uint64_t sub_10011327C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  long long v15;
  long long v16;

  v3 = *(void *)(v1 + 16);
  v4 = (uint64_t *)sub_1000A138C();
  if (!*(void *)(v3 + 16))
  {
    v15 = 0u;
    v16 = 0u;
    goto LABEL_16;
  }
  v6 = *v4;
  v5 = v4[1];
  swift_bridgeObjectRetain();
  v7 = sub_1000048E0(v6, v5);
  if ((v8 & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  sub_1000047DC(*(void *)(v3 + 56) + 32 * v7, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  if (!*((void *)&v16 + 1))
  {
LABEL_16:
    sub_1000130EC((uint64_t)&v15, &qword_10017C018);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = (void *)(a1 + 40);
  while (1)
  {
    v11 = *(v10 - 1) == v13 && *v10 == v14;
    if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      break;
    }
    v10 += 2;
    if (!--v9) {
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1001133B0(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 144))();
  uint64_t v5 = v4;
  if (v3 == (*(uint64_t (**)(void))(*(void *)a1 + 144))() && v5 == v6)
  {
    uint64_t result = swift_bridgeObjectRelease_n();
LABEL_8:
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 192))(result);
    if (v10 == (*(uint64_t (**)(void))(*(void *)a1 + 192))())
    {
      uint64_t v11 = (*(uint64_t (**)(void))(*(void *)v1 + 224))();
      unint64_t v13 = v12;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)a1 + 224))();
      unint64_t v16 = v14;
      if (v13 >> 60 == 15)
      {
        if (v14 >> 60 == 15) {
          return 1;
        }
      }
      else if (v14 >> 60 != 15)
      {
        sub_10002F064(v11, v13);
        char v17 = sub_100023B8C(v11, v13, v15, v16);
        sub_10002404C(v15, v16);
        sub_10002404C(v11, v13);
        sub_10002404C(v11, v13);
        return v17 & 1;
      }
      sub_10002404C(v11, v13);
      sub_10002404C(v15, v16);
    }
    return 0;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if (v8) {
    goto LABEL_8;
  }
  return result;
}

uint64_t sub_1001135E0(void *a1)
{
  if ((*(uint64_t (**)(void))(*(void *)v1 + 144))() == *a1 && v3 == a1[1])
  {
    uint64_t result = swift_bridgeObjectRelease();
LABEL_8:
    if ((*(uint64_t (**)(uint64_t))(*(void *)v1 + 192))(result) == a1[2])
    {
      uint64_t v7 = (*(uint64_t (**)(void))(*(void *)v1 + 224))();
      unint64_t v9 = v8;
      uint64_t v11 = a1[3];
      unint64_t v10 = a1[4];
      if (v8 >> 60 == 15)
      {
        if (v10 >> 60 == 15) {
          return 1;
        }
      }
      else if (v10 >> 60 != 15)
      {
        sub_10002F064(v11, v10);
        char v12 = sub_100023B8C(v7, v9, v11, v10);
        sub_10002404C(v11, v10);
        sub_10002404C(v7, v9);
        return v12 & 1;
      }
      sub_10002F064(v11, v10);
      sub_10002404C(v7, v9);
      sub_10002404C(v11, v10);
    }
    return 0;
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if (v5) {
    goto LABEL_8;
  }
  return result;
}

uint64_t sub_10011376C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_100004700((uint64_t *)&unk_10017FA60);
  __chkstk_darwin(v3 - 8);
  char v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 144))(v8);
  uint64_t v27 = v12;
  uint64_t v28 = v11;
  uint64_t v13 = (*(uint64_t (**)(void))(*(void *)v1 + 192))();
  uint64_t v14 = (*(uint64_t (**)(void))(*(void *)v1 + 224))();
  uint64_t v16 = v15;
  (*(void (**)(void *__return_ptr))(*(void *)v1 + 112))(v29);
  uint64_t v17 = v30;
  if (v30)
  {
    uint64_t v18 = v31;
    sub_1000036B0(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v18 + 64))(v17, v18);
    uint64_t v19 = URL.path.getter();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t result = sub_10000478C((uint64_t)v29);
  }
  else
  {
    uint64_t v23 = sub_1000130EC((uint64_t)v29, &qword_10017BC78);
    (*(void (**)(uint64_t))(*(void *)v1 + 160))(v23);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    {
      uint64_t result = sub_1000130EC((uint64_t)v5, (uint64_t *)&unk_10017FA60);
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v5, v6);
      sub_1000130EC((uint64_t)v5, (uint64_t *)&unk_10017FA60);
      uint64_t v19 = URL.path.getter();
      uint64_t v21 = v24;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  uint64_t v25 = v27;
  *a1 = v28;
  a1[1] = v25;
  a1[2] = v13;
  a1[3] = v14;
  a1[4] = v16;
  a1[5] = v19;
  a1[6] = v21;
  return result;
}

uint64_t sub_100113A70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_100004700((uint64_t *)&unk_10017FA60);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v40 - v7;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v43 = (uint64_t)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v44 = (char *)&v40 - v14;
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v1 + 112))(v45, v13);
  uint64_t v15 = v46;
  if (v46)
  {
    uint64_t v16 = v47;
    sub_1000036B0(v45, v46);
    (*(void (**)(uint64_t, uint64_t))(v16 + 64))(v15, v16);
    uint64_t v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
    v17(v6, 0, 1, v9);
    sub_10000478C((uint64_t)v45);
    uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v19 = v18(v6, 1, v9);
    if (v19 != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v8, v6, v9);
      v17(v8, 0, 1, v9);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)v45, &qword_10017BC78);
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
  }
  (*(void (**)(uint64_t))(*(void *)v1 + 256))(v19);
  sub_1000130EC((uint64_t)v6, (uint64_t *)&unk_10017FA60);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
LABEL_6:
  if (v18(v8, 1, v9) == 1)
  {
    uint64_t result = sub_1000130EC((uint64_t)v8, (uint64_t *)&unk_10017FA60);
  }
  else
  {
    uint64_t v21 = v44;
    uint64_t v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v44, v8, v9);
    uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 184))(v22);
    uint64_t v25 = v24;
    if (!v24)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v21, v9);
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      goto LABEL_13;
    }
    uint64_t v42 = v23;
    uint64_t v26 = (*(uint64_t (**)(void))(*(void *)v1 + 224))();
    if (v27 >> 60 != 15)
    {
      uint64_t v31 = v26;
      uint64_t v32 = v27;
      uint64_t v28 = (*(uint64_t (**)(void))(*(void *)v1 + 144))();
      uint64_t v29 = v35;
      v36 = (uint64_t *)sub_1000A21BC();
      uint64_t v37 = *v36;
      v38 = (void *)v36[1];
      swift_bridgeObjectRetain();
      sub_1000F16F8(v37, v38, v43);
      swift_bridgeObjectRelease();
      uint64_t v33 = URL.path.getter();
      uint64_t v34 = v39;
      v41 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v41(v43, v9);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v41)(v44, v9);
      uint64_t v30 = v42;
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
    uint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v25 = 0;
LABEL_13:
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
LABEL_14:
  *a1 = v28;
  a1[1] = v29;
  a1[2] = v30;
  a1[3] = v25;
  a1[4] = v31;
  a1[5] = v32;
  a1[6] = v33;
  a1[7] = v34;
  return result;
}

uint64_t sub_100113F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v8 + OBJC_IVAR____TtC10driverkitd11OSExtension_originURL;
  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (uint64_t *)(v8 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest);
  *(_OWORD *)(v8 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest) = xmmword_100133A20;
  swift_beginAccess();
  uint64_t v12 = *v11;
  unint64_t v13 = v11[1];
  *uint64_t v11 = a3;
  v11[1] = a4;
  sub_10002404C(v12, v13);
  *(void *)(v8 + 16) = a2;
  sub_10003FE24(a1, v8 + 24);
  return v8;
}

uint64_t sub_100114014(void *a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v53 - v7;
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_1000036B0(a1, v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = sub_1000F2410(v13);
    if (!v15)
    {
      uint64_t v16 = type metadata accessor for KernelExtension(0);
      goto LABEL_7;
    }
    if (v15 == 1)
    {
      uint64_t v16 = type metadata accessor for DriverExtension(0);
LABEL_7:
      uint64_t v24 = v16;
      uint64_t v25 = a1[3];
      uint64_t v26 = a1[4];
      sub_1000036B0(a1, v25);
      uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 48))(v25, v26);
      if (v28 >> 60 != 15)
      {
        uint64_t v47 = v27;
        unint64_t v48 = v28;
        sub_10000469C((uint64_t)a1, (uint64_t)&v53);
        char v55 = 0;
        return (*(uint64_t (**)(long long *, uint64_t, uint64_t, unint64_t))(v24 + 312))(&v53, v12, v47, v48);
      }
      swift_bridgeObjectRelease();
      sub_100004700((uint64_t *)&unk_10017D6E0);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_100132F10;
      uint64_t v30 = a1[3];
      uint64_t v31 = a1[4];
      sub_1000036B0(a1, v30);
      (*(void (**)(uint64_t, uint64_t))(v31 + 64))(v30, v31);
      uint64_t v32 = URL.path.getter();
      uint64_t v34 = v33;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      *(void *)(v29 + 56) = &type metadata for String;
      *(void *)(v29 + 64) = sub_10002A1DC();
      *(void *)(v29 + 32) = v32;
      *(void *)(v29 + 40) = v34;
      sub_10002A230();
      uint64_t v23 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      goto LABEL_9;
    }
    sub_10003C944(v14, v15);
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_100132F30;
    uint64_t v36 = a1[3];
    uint64_t v37 = a1[4];
    sub_1000036B0(a1, v36);
    (*(void (**)(uint64_t, uint64_t))(v37 + 64))(v36, v37);
    uint64_t v38 = URL.path.getter();
    uint64_t v40 = v39;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    *(void *)(v35 + 56) = &type metadata for String;
    unint64_t v41 = sub_10002A1DC();
    *(void *)(v35 + 64) = v41;
    *(void *)(v35 + 32) = v38;
    *(void *)(v35 + 40) = v40;
    uint64_t v42 = sub_1000A12A0();
    if (*(void *)(v12 + 16))
    {
      uint64_t v43 = *v42;
      uint64_t v44 = v42[1];
      swift_bridgeObjectRetain();
      unint64_t v45 = sub_1000048E0(v43, v44);
      if (v46)
      {
        sub_1000047DC(*(void *)(v12 + 56) + 32 * v45, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v54 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v51 = v56;
        unint64_t v50 = v57;
        v52 = (void *)(v35 + 72);
        *(void *)(v35 + 96) = &type metadata for String;
        *(void *)(v35 + 104) = v41;
        if (v50)
        {
          void *v52 = v51;
LABEL_24:
          *(void *)(v35 + 80) = v50;
          sub_10002A230();
          uint64_t v23 = (void *)static OS_os_log.default.getter();
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();
          goto LABEL_25;
        }
LABEL_23:
        void *v52 = 0x73206120746F6E3CLL;
        unint64_t v50 = 0xEE003E676E697274;
        goto LABEL_24;
      }
    }
    else
    {
      sub_1000130EC((uint64_t)&v53, &qword_10017C018);
    }
    v52 = (void *)(v35 + 72);
    *(void *)(v35 + 96) = &type metadata for String;
    *(void *)(v35 + 104) = v41;
    goto LABEL_23;
  }
  sub_100004700((uint64_t *)&unk_10017D6E0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100132F10;
  uint64_t v18 = a1[3];
  uint64_t v19 = a1[4];
  sub_1000036B0(a1, v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 64))(v18, v19);
  uint64_t v20 = URL.path.getter();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  *(void *)(v17 + 56) = &type metadata for String;
  *(void *)(v17 + 64) = sub_10002A1DC();
  *(void *)(v17 + 32) = v20;
  *(void *)(v17 + 40) = v22;
  sub_10002A230();
  uint64_t v23 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
LABEL_9:
  os_log(_:dso:log:type:_:)();
LABEL_25:
  swift_bridgeObjectRelease();

  return 0;
}

uint64_t sub_100114578(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000F2410(a2);
  if (v5)
  {
    if (v5 != 1)
    {
      sub_10003C944(v4, v5);
      return 0;
    }
    uint64_t v6 = type metadata accessor for DriverExtension(0);
  }
  else
  {
    uint64_t v6 = type metadata accessor for KernelExtension(0);
  }
  uint64_t v7 = v6;
  uint64_t v8 = (uint64_t *)sub_1000A14B0();
  if (*(void *)(a2 + 16))
  {
    uint64_t v10 = *v8;
    uint64_t v9 = v8[1];
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_1000048E0(v10, v9);
    if (v12)
    {
      sub_1000047DC(*(void *)(a2 + 56) + 32 * v11, (uint64_t)&v20);
      swift_bridgeObjectRelease();
      if (*((void *)&v21 + 1))
      {
        int v13 = swift_dynamicCast();
        if (v13) {
          uint64_t v14 = v18;
        }
        else {
          uint64_t v14 = 0;
        }
        if (v13) {
          unint64_t v15 = v19;
        }
        else {
          unint64_t v15 = 0xF000000000000000;
        }
        goto LABEL_18;
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  sub_1000130EC((uint64_t)&v20, &qword_10017C018);
  uint64_t v14 = 0;
  unint64_t v15 = 0xF000000000000000;
LABEL_18:
  *(void *)&long long v20 = a1;
  char v22 = 1;
  uint64_t v17 = *(uint64_t (**)(long long *, uint64_t, uint64_t, unint64_t))(v7 + 312);
  swift_bridgeObjectRetain();
  swift_retain();
  return v17(&v20, a2, v14, v15);
}

uint64_t sub_1001146F8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (uint64_t *)sub_1000A15AC();
  if (!*(void *)(a1 + 16))
  {
    long long v63 = 0u;
    long long v64 = 0u;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1000048E0(v4, v3);
  if ((v6 & 1) == 0)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_1000047DC(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v63);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v64 + 1))
  {
LABEL_12:
    sub_1000130EC((uint64_t)&v63, &qword_10017C018);
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    char v8 = 4;
    goto LABEL_14;
  }
  uint64_t v7 = sub_1000A1738();
  if (*(void *)v7 == v61 && *((void *)v7 + 1) == v62 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v8 = 0;
    goto LABEL_14;
  }
  v59 = sub_1000A172C();
  if (*(void *)v59 == v61 && *((void *)v59 + 1) == v62 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v8 = 1;
    goto LABEL_14;
  }
  v60 = sub_1000A1720();
  if ((*(void *)v60 != v61 || *((void *)v60 + 1) != v62)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    sub_1000A1744();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  char v8 = 2;
LABEL_14:
  sub_100004700((uint64_t *)&unk_10017DE60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100136120;
  uint64_t v10 = sub_1000A2120();
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)(inited + 32) = v12;
  *(void *)(inited + 40) = v11;
  swift_bridgeObjectRetain();
  int v13 = (uint64_t *)sub_1000A2114();
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *(void *)(inited + 48) = v15;
  *(void *)(inited + 56) = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1000A212C();
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)(inited + 64) = v18;
  *(void *)(inited + 72) = v17;
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_1000A2138();
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)(inited + 80) = v21;
  *(void *)(inited + 88) = v20;
  swift_bridgeObjectRetain();
  char v22 = (uint64_t *)sub_1000A14B0();
  if (!*(void *)(a1 + 16))
  {
    long long v63 = 0u;
    long long v64 = 0u;
LABEL_26:
    sub_1000130EC((uint64_t)&v63, &qword_10017C018);
    uint64_t v28 = 0;
    unint64_t v29 = 0xF000000000000000;
    goto LABEL_27;
  }
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_1000048E0(v24, v23);
  if (v26)
  {
    sub_1000047DC(*(void *)(a1 + 56) + 32 * v25, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v64 + 1)) {
    goto LABEL_26;
  }
  int v27 = swift_dynamicCast();
  if (v27) {
    uint64_t v28 = v61;
  }
  else {
    uint64_t v28 = 0;
  }
  if (v27) {
    unint64_t v29 = v62;
  }
  else {
    unint64_t v29 = 0xF000000000000000;
  }
LABEL_27:
  uint64_t v30 = swift_bridgeObjectRetain();
  uint64_t v31 = sub_1000F2410(v30);
  if (!v32)
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = type metadata accessor for KernelExtension(0);
    goto LABEL_31;
  }
  if (v32 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = type metadata accessor for DriverExtension(0);
LABEL_31:
    LOBYTE(v63) = v8;
    char v65 = 2;
    uint64_t v34 = *(uint64_t (**)(long long *, uint64_t, uint64_t, unint64_t))(v33 + 312);
    swift_bridgeObjectRetain();
    return v34(&v63, a1, v28, v29);
  }
  sub_10003C944(v31, v32);
  uint64_t v36 = sub_1000A11D8();
  uint64_t v37 = v36;
  if (!*(void *)(a1 + 16))
  {
    long long v63 = 0u;
    long long v64 = 0u;
LABEL_41:
    swift_bridgeObjectRelease();
    sub_1000130EC((uint64_t)&v63, &qword_10017C018);
    goto LABEL_42;
  }
  uint64_t v38 = *v36;
  uint64_t v39 = v36[1];
  swift_bridgeObjectRetain();
  unint64_t v40 = sub_1000048E0(v38, v39);
  if (v41)
  {
    sub_1000047DC(*(void *)(a1 + 56) + 32 * v40, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v64 + 1)) {
    goto LABEL_41;
  }
  if (swift_dynamicCast())
  {
    char v42 = sub_1000391C4(v61, v62, (void *)inited);
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    if (v42)
    {
      LOBYTE(v63) = v8;
      char v65 = 2;
      type metadata accessor for KernelExtension(0);
      uint64_t v35 = swift_allocObject();
      sub_10003FDC8((uint64_t)&v63, v35 + 24);
      uint64_t v43 = v35 + OBJC_IVAR____TtC10driverkitd11OSExtension_originURL;
      uint64_t v44 = type metadata accessor for URL();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v43, 1, 1, v44);
      unint64_t v45 = (uint64_t *)(v35 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest);
      *(_OWORD *)(v35 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest) = xmmword_100133A20;
      swift_beginAccess();
      uint64_t v46 = *v45;
      unint64_t v47 = v45[1];
      *unint64_t v45 = v28;
      v45[1] = v29;
      swift_bridgeObjectRetain();
      sub_10002404C(v46, v47);
      *(void *)(v35 + 16) = a1;
      sub_10003FE80((uint64_t)&v63);
      return v35;
    }
LABEL_42:
    if (*(void *)(a1 + 16)) {
      goto LABEL_43;
    }
LABEL_50:
    long long v63 = 0u;
    long long v64 = 0u;
LABEL_51:
    sub_1000130EC((uint64_t)&v63, &qword_10017C018);
    goto LABEL_52;
  }
  swift_setDeallocating();
  swift_arrayDestroy();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_50;
  }
LABEL_43:
  uint64_t v48 = *v37;
  uint64_t v49 = v37[1];
  swift_bridgeObjectRetain();
  unint64_t v50 = sub_1000048E0(v48, v49);
  if (v51)
  {
    sub_1000047DC(*(void *)(a1 + 56) + 32 * v50, (uint64_t)&v63);
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v64 + 1)) {
    goto LABEL_51;
  }
  if (!swift_dynamicCast())
  {
LABEL_52:
    uint64_t v52 = 0;
    unint64_t v53 = 0;
    goto LABEL_53;
  }
  uint64_t v52 = v61;
  unint64_t v53 = v62;
LABEL_53:
  static os_log_type_t.error.getter();
  sub_100004700((uint64_t *)&unk_10017D6E0);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_100132F10;
  *(void *)(v54 + 56) = &type metadata for String;
  *(void *)(v54 + 64) = sub_10002A1DC();
  uint64_t v55 = 0x3E656E6F6E3CLL;
  if (v53) {
    uint64_t v55 = v52;
  }
  unint64_t v56 = 0xE600000000000000;
  if (v53) {
    unint64_t v56 = v53;
  }
  *(void *)(v54 + 32) = v55;
  *(void *)(v54 + 40) = v56;
  sub_10002A230();
  unint64_t v57 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();

  sub_10002404C(v28, v29);
  return 0;
}

uint64_t sub_100114DC4()
{
  sub_100004700(&qword_10017FB70);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10013EC80;
  sub_100004700(&qword_10017E840);
  uint64_t v1 = sub_1000A13D4();
  uint64_t v2 = v1[1];
  uint64_t v20 = *v1;
  uint64_t v21 = v2;
  swift_bridgeObjectRetain();
  char v3 = sub_10002A278();
  uint64_t v4 = sub_10011C0F8((uint64_t)&v20, v3 & 1, 0);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 32) = v4;
  unint64_t v5 = (uint64_t *)sub_1000A145C();
  uint64_t v6 = v5[1];
  uint64_t v20 = *v5;
  uint64_t v21 = v6;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_10011C0F8((uint64_t)&v20, 1, 0);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 40) = v7;
  char v8 = (uint64_t *)sub_1000A1398();
  uint64_t v9 = v8[1];
  uint64_t v20 = *v8;
  uint64_t v21 = v9;
  uint64_t v10 = sub_100004700(&qword_10017C8B8);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10011A80C((uint64_t)&v20, v10, 1, 0, v10);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 48) = v11;
  uint64_t v12 = sub_1000A123C();
  uint64_t v13 = v12[1];
  uint64_t v20 = *v12;
  uint64_t v21 = v13;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_10011A80C((uint64_t)&v20, (uint64_t)&type metadata for String, 1, 0, (uint64_t)&type metadata for String);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = v14;
  uint64_t v15 = (uint64_t *)sub_1000A1368();
  uint64_t v16 = v15[1];
  uint64_t v20 = *v15;
  uint64_t v21 = v16;
  uint64_t v17 = sub_100004700(&qword_10017C920);
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_10011A80C((uint64_t)&v20, v17, 1, 0, v17);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 64) = v18;
  uint64_t v20 = v0;
  uint64_t result = specialized Array._endMutation()();
  qword_100199928 = v20;
  return result;
}

uint64_t sub_100114F9C()
{
  swift_bridgeObjectRelease();
  sub_10003FE80(v0 + 24);
  sub_1000130EC(v0 + OBJC_IVAR____TtC10driverkitd11OSExtension_originURL, (uint64_t *)&unk_10017FA60);
  sub_10002404C(*(void *)(v0 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest), *(void *)(v0 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest + 8));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10011502C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 200))();
}

const char *sub_100115070()
{
  return "kext";
}

uint64_t sub_10011507C()
{
  if (qword_100197670 != -1) {
    swift_once();
  }
  uint64_t v118 = qword_100199928;
  sub_100004700(&qword_10017FB70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013EC90;
  uint64_t v1 = inited;
  sub_100004700(&qword_10017E840);
  v117 = sub_1000A11D8();
  unint64_t v2 = v117[1];
  uint64_t v123 = *v117;
  unint64_t v124 = v2;
  swift_bridgeObjectRetain();
  char v3 = sub_10002A278();
  uint64_t v4 = sub_10011B498((uint64_t)&v123, 64, v3 & 1, 0);
  swift_bridgeObjectRelease();
  uint64_t v5 = v1;
  *(void *)(v1 + 32) = v4;
  uint64_t v6 = sub_1000A12A0();
  unint64_t v7 = v6[1];
  uint64_t v123 = *v6;
  unint64_t v124 = v7;
  swift_bridgeObjectRetain();
  char v8 = sub_10011EBC4();
  uint64_t v9 = sub_10011AE0C((uint64_t)&v123, (uint64_t)&off_100173210, v8 & 1, 0, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  swift_bridgeObjectRelease();
  *(void *)(v5 + 40) = v9;
  uint64_t v10 = (uint64_t *)sub_1000A138C();
  unint64_t v11 = v10[1];
  uint64_t v123 = *v10;
  unint64_t v124 = v11;
  sub_100004700((uint64_t *)&unk_10017DE60);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10013ECA0;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1000A3A9C();
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)(v12 + 32) = v15;
  *(void *)(v12 + 40) = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1000A3AA8();
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)(v12 + 48) = v18;
  *(void *)(v12 + 56) = v17;
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_1000A3AB4();
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)(v12 + 64) = v21;
  *(void *)(v12 + 72) = v20;
  swift_bridgeObjectRetain();
  char v22 = sub_1000A3AC0();
  uint64_t v24 = *(void *)v22;
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)(v12 + 80) = v24;
  *(void *)(v12 + 88) = v23;
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_1000A3AD8();
  uint64_t v27 = *(void *)v25;
  uint64_t v26 = *((void *)v25 + 1);
  *(void *)(v12 + 96) = v27;
  *(void *)(v12 + 104) = v26;
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_1000A3AE4();
  uint64_t v30 = *(void *)v28;
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)(v12 + 112) = v30;
  *(void *)(v12 + 120) = v29;
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_10011AE0C((uint64_t)&v123, v12, 1, 0, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v32 = v5;
  *(void *)(v5 + 48) = v31;
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_10013ECB0;
  uint64_t v34 = sub_1000A123C();
  unint64_t v35 = v34[1];
  uint64_t v123 = *v34;
  unint64_t v124 = v35;
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_10011A264((uint64_t)&v123, 0);
  swift_bridgeObjectRelease();
  *(void *)(v33 + 32) = v36;
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_10013ECB0;
  uint64_t v38 = *v34;
  unint64_t v39 = v34[1];
  uint64_t v123 = v38;
  unint64_t v124 = v39;
  swift_bridgeObjectRetain();
  char v40 = sub_10011EBC4();
  char v41 = sub_10011A80C((uint64_t)&v123, (uint64_t)&type metadata for String, v40 & 1, 0, (uint64_t)&type metadata for String);
  swift_bridgeObjectRelease();
  *(void *)(v37 + 32) = v41;
  char v42 = (uint64_t *)sub_1000A1480();
  unint64_t v43 = v42[1];
  uint64_t v123 = *v42;
  unint64_t v124 = v43;
  swift_bridgeObjectRetain();
  char v44 = sub_10011EBC4();
  unint64_t v45 = sub_10011A80C((uint64_t)&v123, (uint64_t)&type metadata for String, v44 & 1, 0, (uint64_t)&type metadata for String);
  swift_bridgeObjectRelease();
  *(void *)(v37 + 40) = v45;
  uint64_t v123 = v37;
  specialized Array._endMutation()();
  uint64_t v46 = sub_10011CD00(v123);
  swift_bridgeObjectRelease();
  *(void *)(v33 + 40) = v46;
  uint64_t v123 = v33;
  specialized Array._endMutation()();
  unint64_t v47 = sub_10011CAA8(v123, 0, 0);
  swift_bridgeObjectRelease();
  *(void *)(v32 + 56) = v47;
  uint64_t v48 = v32;
  uint64_t v120 = v32;
  v116 = (uint64_t *)sub_1000A1398();
  unint64_t v49 = v116[1];
  uint64_t v123 = *v116;
  unint64_t v124 = v49;
  uint64_t v50 = sub_100004700(&qword_10017C8B8);
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_10013ECB0;
  swift_bridgeObjectRetain();
  uint64_t v52 = (uint64_t *)sub_1000A2114();
  uint64_t v53 = v52[1];
  uint64_t v121 = *v52;
  uint64_t v122 = v53;
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_10011A264((uint64_t)&v121, 0);
  swift_bridgeObjectRelease();
  *(void *)(v51 + 32) = v54;
  uint64_t v121 = 0;
  uint64_t v122 = 0xE000000000000000;
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease();
  uint64_t v121 = 0xD00000000000001DLL;
  uint64_t v122 = 0x80000001001504E0;
  uint64_t v55 = (uint64_t *)sub_1000A2108();
  uint64_t v56 = *v55;
  unint64_t v57 = (void *)v55[1];
  swift_bridgeObjectRetain();
  v58._countAndFlagsBits = v56;
  v58._object = v57;
  String.append(_:)(v58);
  swift_bridgeObjectRelease();
  v59._countAndFlagsBits = 39;
  v59._object = (void *)0xE100000000000000;
  String.append(_:)(v59);
  v60 = sub_10011C9EC((uint64_t)sub_100115BE4, 0, v121, v122);
  swift_bridgeObjectRelease();
  *(void *)(v51 + 40) = v60;
  uint64_t v121 = v51;
  specialized Array._endMutation()();
  uint64_t v119 = v50;
  uint64_t v61 = sub_10011C374((uint64_t)&v123, v50, v121, 1, 0, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v48 + 64) = v61;
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_10013ECC0;
  long long v63 = (uint64_t *)sub_1000A13A4();
  unint64_t v64 = v63[1];
  uint64_t v123 = *v63;
  unint64_t v124 = v64;
  swift_bridgeObjectRetain();
  char v65 = sub_10011A264((uint64_t)&v123, 0);
  swift_bridgeObjectRelease();
  *(void *)(v62 + 32) = v65;
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_10013ECB0;
  unint64_t v67 = v63[1];
  uint64_t v123 = *v63;
  unint64_t v124 = v67;
  swift_bridgeObjectRetain();
  char v68 = sub_10011EBC4();
  v69 = sub_10011AE0C((uint64_t)&v123, (uint64_t)&off_100173240, v68 & 1, 0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  swift_bridgeObjectRelease();
  *(void *)(v66 + 32) = v69;
  v70 = (uint64_t *)sub_1000A13B0();
  unint64_t v71 = v70[1];
  uint64_t v123 = *v70;
  unint64_t v124 = v71;
  swift_bridgeObjectRetain();
  v72 = sub_10011AE0C((uint64_t)&v123, (uint64_t)&off_100173268, 1, 0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  swift_bridgeObjectRelease();
  *(void *)(v66 + 40) = v72;
  uint64_t v123 = v66;
  specialized Array._endMutation()();
  v73 = sub_10011CC14(v123);
  swift_bridgeObjectRelease();
  *(void *)(v62 + 40) = v73;
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_10013ECB0;
  uint64_t v75 = *v63;
  unint64_t v76 = v63[1];
  uint64_t v123 = v75;
  unint64_t v124 = v76;
  swift_bridgeObjectRetain();
  char v77 = sub_10011EBC4();
  v78 = sub_10011AE0C((uint64_t)&v123, (uint64_t)&off_100173290, v77 & 1, 0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  swift_bridgeObjectRelease();
  *(void *)(v74 + 32) = v78;
  unint64_t v79 = v116[1];
  uint64_t v123 = *v116;
  unint64_t v124 = v79;
  uint64_t v80 = sub_10001348C(&qword_100180328, &qword_10017C8B8);
  swift_bridgeObjectRetain();
  char v81 = sub_10002A278();
  v82 = sub_10011BA24((uint64_t)&v123, 1, 2, v119, v81 & 1, 0, v119, v80);
  swift_bridgeObjectRelease();
  *(void *)(v74 + 40) = v82;
  uint64_t v123 = v74;
  specialized Array._endMutation()();
  v83 = sub_10011CC14(v123);
  swift_bridgeObjectRelease();
  *(void *)(v62 + 48) = v83;
  uint64_t v123 = v62;
  specialized Array._endMutation()();
  v84 = sub_10011CAA8(v123, 0, 0);
  swift_bridgeObjectRelease();
  *(void *)(v120 + 72) = v84;
  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = xmmword_10013ECB0;
  uint64_t v86 = swift_allocObject();
  *(_OWORD *)(v86 + 16) = xmmword_10013ECB0;
  uint64_t v87 = swift_allocObject();
  *(_OWORD *)(v87 + 16) = xmmword_10013ECB0;
  v88 = (uint64_t *)sub_1000A14C8();
  unint64_t v89 = v88[1];
  uint64_t v123 = *v88;
  unint64_t v124 = v89;
  swift_bridgeObjectRetain();
  sub_10002A278();
  v90 = sub_10011CE0C((uint64_t)&v123);
  swift_bridgeObjectRelease();
  *(void *)(v87 + 32) = v90;
  v91 = (uint64_t *)sub_1000A14D4();
  unint64_t v92 = v91[1];
  uint64_t v123 = *v91;
  unint64_t v124 = v92;
  swift_bridgeObjectRetain();
  sub_10002A278();
  v93 = sub_10011CE0C((uint64_t)&v123);
  swift_bridgeObjectRelease();
  *(void *)(v87 + 40) = v93;
  uint64_t v123 = v87;
  specialized Array._endMutation()();
  v94 = sub_10011CAA8(v123, 0, 0);
  swift_bridgeObjectRelease();
  *(void *)(v86 + 32) = v94;
  unint64_t v95 = v117[1];
  uint64_t v123 = *v117;
  unint64_t v124 = v95;
  swift_bridgeObjectRetain();
  v96 = (uint64_t *)sub_1000A20F0();
  uint64_t v97 = *v96;
  v98 = (void *)v96[1];
  swift_bridgeObjectRetain();
  char v99 = sub_10002A278();
  v100 = sub_10011B760((uint64_t)&v123, v97, v98, v99 & 1, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v86 + 40) = v100;
  uint64_t v123 = v86;
  specialized Array._endMutation()();
  v101 = sub_10011CC14(v123);
  swift_bridgeObjectRelease();
  *(void *)(v85 + 32) = v101;
  unint64_t v102 = v116[1];
  uint64_t v123 = *v116;
  unint64_t v124 = v102;
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_10013ECD0;
  swift_bridgeObjectRetain();
  v104 = (uint64_t *)sub_1000A2144();
  uint64_t v105 = v104[1];
  uint64_t v121 = *v104;
  uint64_t v122 = v105;
  swift_bridgeObjectRetain();
  v106 = sub_10011A264((uint64_t)&v121, 0);
  swift_bridgeObjectRelease();
  *(void *)(v103 + 32) = v106;
  uint64_t v121 = v103;
  specialized Array._endMutation()();
  v107 = sub_10011C374((uint64_t)&v123, v119, v121, 1, 0, v119);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v85 + 40) = v107;
  uint64_t v123 = v85;
  specialized Array._endMutation()();
  uint64_t v108 = v123;
  uint64_t v123 = 0;
  unint64_t v124 = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease();
  uint64_t v123 = 0x20676E696B6E694CLL;
  unint64_t v124 = 0xE800000000000000;
  uint64_t v110 = *v104;
  v109 = (void *)v104[1];
  swift_bridgeObjectRetain();
  v111._countAndFlagsBits = v110;
  v111._object = v109;
  String.append(_:)(v111);
  swift_bridgeObjectRelease();
  v112._object = (void *)0x8000000100150500;
  v112._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v112);
  v113 = sub_10011CAA8(v108, v123, v124);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v120 + 80) = v113;
  uint64_t v123 = v120;
  specialized Array._endMutation()();
  uint64_t v123 = v118;
  swift_bridgeObjectRetain();
  unint64_t v114 = swift_bridgeObjectRetain();
  sub_100116E64(v114);
  uint64_t result = swift_bridgeObjectRelease();
  qword_100199930 = v123;
  return result;
}

BOOL sub_100115BE4()
{
  uint64_t v0 = (uint64_t *)sub_1000A2108();
  uint64_t v1 = *v0;
  unint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  Swift::Bool v4 = String.hasPrefix(_:)(v3);
  swift_bridgeObjectRelease();
  return !v4;
}

uint64_t *sub_100115C44()
{
  if (qword_100197678 != -1) {
    swift_once();
  }
  return &qword_100199930;
}

const char *sub_100115C94()
{
  return "dext";
}

uint64_t sub_100115CA0()
{
  if (qword_100197670 != -1) {
    swift_once();
  }
  unint64_t v0 = qword_100199928;
  sub_100004700(&qword_10017E840);
  uint64_t v1 = sub_1000A11D8();
  uint64_t v2 = v1[1];
  uint64_t v42 = *v1;
  uint64_t v43 = v2;
  swift_bridgeObjectRetain();
  uint64_t v3 = *(void *)sub_1000A2240();
  char v4 = sub_10002A278();
  sub_10011B498((uint64_t)&v42, v3, v4 & 1, 0);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_1000A12A0();
  uint64_t v6 = v5[1];
  uint64_t v42 = *v5;
  uint64_t v43 = v6;
  swift_bridgeObjectRetain();
  char v7 = sub_10011EBC4();
  sub_10011AE0C((uint64_t)&v42, (uint64_t)&off_1001732B8, v7 & 1, 0, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  swift_bridgeObjectRelease();
  sub_100004700(&qword_10017FB70);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10013ECB0;
  uint64_t v9 = (uint64_t *)sub_1000A138C();
  uint64_t v10 = v9[1];
  uint64_t v42 = *v9;
  uint64_t v43 = v10;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_10011A264((uint64_t)&v42, 0);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 32) = v11;
  uint64_t v12 = *v9;
  uint64_t v13 = v9[1];
  uint64_t v42 = v12;
  uint64_t v43 = v13;
  sub_100004700((uint64_t *)&unk_10017DE60);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100132F30;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1000A3ACC();
  uint64_t v17 = *(void *)v15;
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)(v14 + 32) = v17;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_1000A3AD8();
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)(v14 + 48) = v20;
  *(void *)(v14 + 56) = v19;
  swift_bridgeObjectRetain();
  char v21 = sub_10011EBC4();
  char v22 = sub_10011AE0C((uint64_t)&v42, v14, v21 & 1, 0, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v8 + 40) = v22;
  uint64_t v42 = v8;
  specialized Array._endMutation()();
  sub_10011CAA8(v42, 0, 0);
  swift_bridgeObjectRelease();
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100133C60;
  uint64_t v24 = (uint64_t *)sub_1000A1380();
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *(void *)(v23 + 32) = v26;
  *(void *)(v23 + 40) = v25;
  swift_bridgeObjectRetain();
  uint64_t v27 = (uint64_t *)sub_1000A13A4();
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *(void *)(v23 + 48) = v29;
  *(void *)(v23 + 56) = v28;
  swift_bridgeObjectRetain();
  uint64_t v30 = (uint64_t *)sub_1000A1468();
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *(void *)(v23 + 64) = v32;
  *(void *)(v23 + 72) = v31;
  swift_bridgeObjectRetain();
  uint64_t v33 = (uint64_t *)sub_1000A1474();
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *(void *)(v23 + 80) = v35;
  *(void *)(v23 + 88) = v34;
  swift_bridgeObjectRetain();
  uint64_t v36 = (uint64_t *)sub_1000A1480();
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *(void *)(v23 + 96) = v38;
  *(void *)(v23 + 104) = v37;
  swift_bridgeObjectRetain();
  sub_10011A464(v23);
  swift_bridgeObjectRelease();
  uint64_t v42 = v0;
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v39 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (__OFADD__(v39, 4))
  {
    __break(1u);
  }
  else
  {
    sub_1001171F4(v39 + 4);
    specialized Array._endMutation()();
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_7;
    }
  }
  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
LABEL_7:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  uint64_t v40 = v42;
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  qword_100199938 = v40;
  return result;
}

uint64_t *sub_100116198()
{
  if (qword_100197680 != -1) {
    swift_once();
  }
  return &qword_100199938;
}

uint64_t sub_1001161E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_10003FDC8(a1, v8 + 24);
  uint64_t v9 = v8 + OBJC_IVAR____TtC10driverkitd11OSExtension_originURL;
  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  unint64_t v11 = (uint64_t *)(v8 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest);
  *(_OWORD *)(v8 + OBJC_IVAR____TtC10driverkitd11OSExtension_digest) = xmmword_100133A20;
  swift_beginAccess();
  uint64_t v12 = *v11;
  unint64_t v13 = v11[1];
  *unint64_t v11 = a3;
  v11[1] = a4;
  sub_10002404C(v12, v13);
  *(void *)(v8 + 16) = a2;
  sub_10003FE80(a1);
  return v8;
}

Swift::Int sub_1001162E4()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = Hasher.init(_seed:)();
  (*(void (**)(uint64_t))(*(void *)v0 + 144))(v5);
  String.hash(into:)();
  uint64_t v6 = swift_bridgeObjectRelease();
  Swift::UInt64 v7 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 192))(v6);
  Hasher._combine(_:)(v7);
  sub_10003FDC8(v0 + 24, (uint64_t)v15);
  if (v16)
  {
    if (v16 == 1)
    {
      uint64_t v8 = *(void *)&v15[0];
      sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of Hashable.hash(into:)();
      LOBYTE(v12[0]) = *(unsigned char *)(v8 + OBJC_IVAR____TtC10driverkitd16KernelCollection_kind);
      sub_1000599C4();
      dispatch thunk of Hashable.hash(into:)();
      swift_release();
    }
  }
  else
  {
    sub_10000372C(v15, (uint64_t)v12);
    uint64_t v9 = v13;
    uint64_t v10 = v14;
    sub_1000036B0(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v10 + 64))(v9, v10);
    sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    sub_10000478C((uint64_t)v12);
  }
  return Hasher._finalize()();
}

uint64_t sub_100116570(uint64_t *a1, uint64_t *a2)
{
  return sub_100118814(*a1, *a2);
}

Swift::Int sub_10011657C()
{
  return sub_1001162E4();
}

uint64_t sub_1001165A0()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  (*(void (**)(uint64_t))(*(void *)v6 + 144))(v3);
  String.hash(into:)();
  uint64_t v7 = swift_bridgeObjectRelease();
  Swift::UInt64 v8 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 192))(v7);
  Hasher._combine(_:)(v8);
  uint64_t result = sub_10003FDC8(v6 + 24, (uint64_t)v17);
  if (v18)
  {
    if (v18 == 1)
    {
      uint64_t v10 = *(void *)&v17[0];
      sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of Hashable.hash(into:)();
      LOBYTE(v14[0]) = *(unsigned char *)(v10 + OBJC_IVAR____TtC10driverkitd16KernelCollection_kind);
      sub_1000599C4();
      dispatch thunk of Hashable.hash(into:)();
      return swift_release();
    }
  }
  else
  {
    sub_10000372C(v17, (uint64_t)v14);
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    sub_1000036B0(v14, v15);
    (*(void (**)(uint64_t, uint64_t))(v12 + 64))(v11, v12);
    sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return sub_10000478C((uint64_t)v14);
  }
  return result;
}

Swift::Int sub_100116828()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = Hasher.init(_seed:)();
  uint64_t v6 = *v0;
  (*(void (**)(uint64_t))(*(void *)v6 + 144))(v5);
  String.hash(into:)();
  uint64_t v7 = swift_bridgeObjectRelease();
  Swift::UInt64 v8 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 192))(v7);
  Hasher._combine(_:)(v8);
  sub_10003FDC8(v6 + 24, (uint64_t)v16);
  if (v17)
  {
    if (v17 == 1)
    {
      uint64_t v9 = *(void *)&v16[0];
      sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of Hashable.hash(into:)();
      LOBYTE(v13[0]) = *(unsigned char *)(v9 + OBJC_IVAR____TtC10driverkitd16KernelCollection_kind);
      sub_1000599C4();
      dispatch thunk of Hashable.hash(into:)();
      swift_release();
    }
  }
  else
  {
    sub_10000372C(v16, (uint64_t)v13);
    uint64_t v10 = v14;
    uint64_t v11 = v15;
    sub_1000036B0(v13, v14);
    (*(void (**)(uint64_t, uint64_t))(v11 + 64))(v10, v11);
    sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    sub_10000478C((uint64_t)v13);
  }
  return Hasher._finalize()();
}

uint64_t sub_100116ABC()
{
  sub_10003FDC8(v0, (uint64_t)v8);
  if (v9)
  {
    if (v9 == 1)
    {
      uint64_t v1 = sub_100057628();
      swift_release();
    }
    else
    {
      v7[0] = 0x20646564616F6CLL;
      v7[1] = 0xE700000000000000;
      if (LOBYTE(v8[0]) == 4)
      {
        unint64_t v2 = 0x8000000100150410;
        unint64_t v3 = 0xD000000000000023;
      }
      else
      {
        unint64_t v3 = sub_1000F11D0(v8[0]);
        unint64_t v2 = v4;
      }
      unint64_t v5 = v2;
      String.append(_:)(*(Swift::String *)&v3);
      swift_bridgeObjectRelease();
      return v7[0];
    }
  }
  else
  {
    sub_10000372C(v8, (uint64_t)v7);
    sub_1000036B0(v7, v7[3]);
    uint64_t v1 = dispatch thunk of CustomStringConvertible.description.getter();
    sub_10000478C((uint64_t)v7);
  }
  return v1;
}

uint64_t sub_100116BD0()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v10[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_10003FDC8(v0, (uint64_t)v13);
  if (v14)
  {
    if (v14 == 1)
    {
      uint64_t v6 = *(void *)&v13[0];
      sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of Hashable.hash(into:)();
      LOBYTE(v10[0]) = *(unsigned char *)(v6 + OBJC_IVAR____TtC10driverkitd16KernelCollection_kind);
      sub_1000599C4();
      dispatch thunk of Hashable.hash(into:)();
      return swift_release();
    }
  }
  else
  {
    sub_10000372C(v13, (uint64_t)v10);
    uint64_t v7 = v11;
    uint64_t v8 = v12;
    sub_1000036B0(v10, v11);
    (*(void (**)(uint64_t, uint64_t))(v8 + 64))(v7, v8);
    sub_100118AF4(&qword_10017BE90, (void (*)(uint64_t))&type metadata accessor for URL);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return sub_10000478C((uint64_t)v10);
  }
  return result;
}

Swift::Int sub_100116DE4()
{
  return Hasher._finalize()();
}

Swift::Int sub_100116E28()
{
  return Hasher._finalize()();
}

uint64_t sub_100116E64(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100117030(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_100117030(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10001348C(&qword_100180338, &qword_100180330);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100004700(&qword_100180330);
            uint64_t v10 = sub_1000ED434(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100004700(&qword_10017E840);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1001171F4(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_1001172B4(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v8 & 1) != 0))
    {
      if (sub_100023B8C(a1[4], a1[5], a2[4], a2[5]))
      {
        if (a1[6] == a2[6] && a1[7] == a2[7])
        {
          return 1;
        }
        else
        {
          return _stringCompareWithSmolCheck(_:_:expecting:)();
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_100117380()
{
  unint64_t result = qword_100197688;
  if (!qword_100197688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100197688);
  }
  return result;
}

uint64_t sub_1001173D4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536E6F6973726576 && a2 == 0xED0000676E697274 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x747365676964 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6150656C646E7562 && a2 == 0xEA00000000006874)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1001175C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100004700(&qword_100180348);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036B0(a1, a1[3]);
  sub_100117380();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000478C((uint64_t)a1);
  }
  LOBYTE(v29) = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v27 = v9;
  LOBYTE(v29) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v28 = v13;
  uint64_t v26 = v12;
  char v31 = 2;
  sub_10001CA64();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v14 = v29;
  LOBYTE(v29) = 3;
  unint64_t v24 = v30;
  uint64_t v25 = v14;
  sub_100012DE4(v14, v30);
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v17 = v16;
  char v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v23 = v15;
  v18(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v19 = v28;
  swift_bridgeObjectRetain();
  unint64_t v21 = v24;
  uint64_t v20 = v25;
  sub_100012DE4(v25, v24);
  swift_bridgeObjectRetain();
  sub_100012A10(v20, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000478C((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100012A10(v20, v21);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v27;
  a2[1] = v11;
  a2[2] = v26;
  a2[3] = v19;
  a2[4] = v20;
  a2[5] = v21;
  a2[6] = v23;
  a2[7] = v17;
  return result;
}

unint64_t sub_100117948()
{
  unint64_t result = qword_10017FE78;
  if (!qword_10017FE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10017FE78);
  }
  return result;
}

uint64_t sub_10011799C(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2])
    {
      uint64_t v7 = a1[3];
      unint64_t v8 = a1[4];
      uint64_t v9 = a2[3];
      unint64_t v10 = a2[4];
      if (v8 >> 60 == 15)
      {
        if (v10 >> 60 == 15)
        {
LABEL_13:
          uint64_t v12 = a1[6];
          uint64_t v13 = a2[6];
          if (v12)
          {
            if (v13 && (a1[5] == a2[5] && v12 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)) {
              return 1;
            }
          }
          else if (!v13)
          {
            return 1;
          }
          return 0;
        }
        goto LABEL_11;
      }
      if (v10 >> 60 == 15)
      {
LABEL_11:
        sub_10002F064(a1[3], a1[4]);
        sub_10002F064(v9, v10);
        sub_10002404C(v7, v8);
        sub_10002404C(v9, v10);
        return 0;
      }
      sub_10002F064(a1[3], a1[4]);
      sub_10002F064(v9, v10);
      char v11 = sub_100023B8C(v7, v8, v9, v10);
      sub_10002404C(v9, v10);
      sub_10002404C(v7, v8);
      if (v11) {
        goto LABEL_13;
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_100117B08()
{
  unint64_t result = qword_100197690[0];
  if (!qword_100197690[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100197690);
  }
  return result;
}

uint64_t sub_100117B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700(&qword_10017FE88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100117BC4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x747365676964 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6150656C646E7562 && a2 == 0xEA00000000006874)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100117D8C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100004700(&qword_100180340);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036B0(a1, a1[3]);
  sub_100117B08();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000478C((uint64_t)a1);
  }
  LOBYTE(v25) = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  LOBYTE(v25) = 1;
  swift_bridgeObjectRetain();
  uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
  char v27 = 2;
  sub_10001CA64();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v12 = v25;
  LOBYTE(v25) = 3;
  unint64_t v22 = v26;
  uint64_t v23 = v12;
  sub_10002F064(v12, v26);
  uint64_t v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v21 = v13;
  v16(v8, v5);
  swift_bridgeObjectRetain();
  unint64_t v18 = v22;
  uint64_t v17 = v23;
  sub_10002F064(v23, v22);
  swift_bridgeObjectRetain();
  sub_10002404C(v17, v18);
  swift_bridgeObjectRelease();
  sub_10000478C((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_10002404C(v17, v18);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v24;
  a2[3] = v17;
  uint64_t v20 = v21;
  a2[4] = v18;
  a2[5] = v20;
  a2[6] = v15;
  return result;
}

uint64_t sub_100118098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700((uint64_t *)&unk_10017FA60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for KernelExtension(uint64_t a1)
{
  return sub_1000192DC(a1, (uint64_t *)&unk_100197EB0);
}

uint64_t type metadata accessor for DriverExtension(uint64_t a1)
{
  return sub_1000192DC(a1, qword_100197EC0);
}

uint64_t sub_100118140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v57 - v9;
  sub_10003FDC8(a1, (uint64_t)v74);
  sub_10003FDC8(a2, (uint64_t)v76);
  if (!v75)
  {
    sub_10003FDC8((uint64_t)v74, (uint64_t)v73);
    if (v77)
    {
      sub_10000478C((uint64_t)v73);
      goto LABEL_16;
    }
    sub_10000372C(v73, (uint64_t)v70);
    sub_10000372C(v76, (uint64_t)v67);
    uint64_t v15 = v71;
    uint64_t v16 = v72;
    sub_1000036B0(v70, v71);
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_1000A13D4();
      if (*(void *)(v18 + 16))
      {
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        swift_bridgeObjectRetain();
        unint64_t v22 = sub_1000048E0(v21, v20);
        if (v23)
        {
          sub_1000047DC(*(void *)(v18 + 56) + 32 * v22, (uint64_t)&v64);
        }
        else
        {
          long long v64 = 0u;
          long long v65 = 0u;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        long long v64 = 0u;
        long long v65 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v65 + 1))
      {
        uint64_t v24 = v5;
        int v25 = swift_dynamicCast();
        if (v25) {
          uint64_t v26 = v60;
        }
        else {
          uint64_t v26 = 0;
        }
        if (v25) {
          uint64_t v27 = v61;
        }
        else {
          uint64_t v27 = 0;
        }
        uint64_t v58 = v26;
        uint64_t v59 = v27;
LABEL_35:
        uint64_t v28 = v68;
        uint64_t v29 = v69;
        sub_1000036B0(v67, v68);
        uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 32))(v28, v29);
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = sub_1000A13D4();
          if (*(void *)(v31 + 16))
          {
            uint64_t v34 = *v32;
            uint64_t v33 = v32[1];
            swift_bridgeObjectRetain();
            unint64_t v35 = sub_1000048E0(v34, v33);
            if (v36)
            {
              sub_1000047DC(*(void *)(v31 + 56) + 32 * v35, (uint64_t)&v64);
            }
            else
            {
              long long v64 = 0u;
              long long v65 = 0u;
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            long long v64 = 0u;
            long long v65 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v65 + 1))
          {
            int v37 = swift_dynamicCast();
            if (v37) {
              uint64_t v38 = v60;
            }
            else {
              uint64_t v38 = 0;
            }
            if (v37) {
              uint64_t v39 = v61;
            }
            else {
              uint64_t v39 = 0;
            }
LABEL_51:
            uint64_t v41 = v71;
            uint64_t v40 = v72;
            sub_1000036B0(v70, v71);
            (*(void (**)(uint64_t, uint64_t))(v40 + 64))(v41, v40);
            uint64_t v42 = v68;
            uint64_t v43 = v69;
            sub_1000036B0(v67, v68);
            (*(void (**)(uint64_t, uint64_t))(v43 + 64))(v42, v43);
            char v44 = static URL.== infix(_:_:)();
            unint64_t v45 = *(void (**)(char *, uint64_t))(v24 + 8);
            v45(v8, v4);
            v45(v10, v4);
            sub_10000469C((uint64_t)v70, (uint64_t)&v64);
            sub_10000469C((uint64_t)v67, (uint64_t)&v60);
            if ((v44 & 1) == 0)
            {
              sub_10000478C((uint64_t)&v64);
              sub_10000478C((uint64_t)&v60);
              goto LABEL_61;
            }
            uint64_t v46 = *((void *)&v65 + 1);
            uint64_t v47 = v66;
            sub_1000036B0(&v64, *((uint64_t *)&v65 + 1));
            uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 24))(v46, v47);
            uint64_t v50 = v49;
            uint64_t v51 = v62;
            uint64_t v52 = v63;
            sub_1000036B0(&v60, v62);
            uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 24))(v51, v52);
            if (v50)
            {
              if (v54)
              {
                if (v48 == v53 && v50 == v54)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
LABEL_64:
                  sub_10000478C((uint64_t)&v64);
                  sub_10000478C((uint64_t)&v60);
                  goto LABEL_70;
                }
                char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_10000478C((uint64_t)&v64);
                sub_10000478C((uint64_t)&v60);
                if (v56)
                {
LABEL_70:
                  if (v59)
                  {
                    if (v39)
                    {
                      if (v58 == v38 && v59 == v39)
                      {
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        char v14 = 1;
                      }
                      else
                      {
                        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                      goto LABEL_63;
                    }
                  }
                  else if (!v39)
                  {
                    char v14 = 1;
                    goto LABEL_63;
                  }
LABEL_62:
                  swift_bridgeObjectRelease();
                  char v14 = 0;
LABEL_63:
                  sub_10000478C((uint64_t)v67);
                  sub_10000478C((uint64_t)v70);
LABEL_67:
                  sub_10003FE80((uint64_t)v74);
                  return v14 & 1;
                }
LABEL_61:
                swift_bridgeObjectRelease();
                goto LABEL_62;
              }
            }
            else if (!v54)
            {
              goto LABEL_64;
            }
            swift_bridgeObjectRelease();
            sub_10000478C((uint64_t)&v64);
            sub_10000478C((uint64_t)&v60);
            goto LABEL_61;
          }
        }
        else
        {
          long long v64 = 0u;
          long long v65 = 0u;
        }
        sub_1000130EC((uint64_t)&v64, &qword_10017C018);
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
    }
    uint64_t v24 = v5;
    sub_1000130EC((uint64_t)&v64, &qword_10017C018);
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    goto LABEL_35;
  }
  if (v75 == 1)
  {
    sub_10003FDC8((uint64_t)v74, (uint64_t)v73);
    uint64_t v11 = *(void *)&v73[0];
    if (v77 == 1)
    {
      uint64_t v12 = *(void *)&v76[0];
      if (sub_100029B78(*(unsigned char *)(*(void *)&v73[0] + OBJC_IVAR____TtC10driverkitd16KernelCollection_kind), *(unsigned char *)(*(void *)&v76[0] + OBJC_IVAR____TtC10driverkitd16KernelCollection_kind))&& (static URL.== infix(_:_:)() & 1) != 0)
      {
        if (*(void *)(v11 + OBJC_IVAR____TtC10driverkitd16KernelCollection_arch) == *(void *)(v12
                                                                                                 + OBJC_IVAR____TtC10driverkitd16KernelCollection_arch)
          && *(void *)(v11 + OBJC_IVAR____TtC10driverkitd16KernelCollection_arch + 8) == *(void *)(v12 + OBJC_IVAR____TtC10driverkitd16KernelCollection_arch + 8))
        {
          char v14 = 1;
        }
        else
        {
          char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        }
      }
      else
      {
        char v14 = 0;
      }
      swift_release();
      swift_release();
      goto LABEL_67;
    }
    swift_release();
    goto LABEL_16;
  }
  if (v77 != 2)
  {
LABEL_16:
    sub_1000130EC((uint64_t)v74, &qword_10017CC00);
    char v14 = 0;
    return v14 & 1;
  }
  sub_10003FE80((uint64_t)v74);
  char v14 = 1;
  return v14 & 1;
}

uint64_t sub_100118814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)a1 + 144);
  uint64_t v5 = v4();
  uint64_t v7 = v6;
  if (v5 == (*(uint64_t (**)(void))(*(void *)a2 + 144))() && v7 == v8)
  {
    uint64_t v11 = swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return 0;
    }
  }
  if (((uint64_t (*)(uint64_t))v4)(v11) == 0xD000000000000014 && v12 == 0x80000001001502C0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t v14 = swift_bridgeObjectRelease();
  if (v13) {
    return 0;
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192))(v14);
  if (v15 != (*(uint64_t (**)(void))(*(void *)a2 + 192))()) {
    return 0;
  }

  return sub_100118140(a1 + 24, a2 + 24);
}

unint64_t sub_100118A00()
{
  unint64_t result = qword_10017FE90;
  if (!qword_10017FE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10017FE90);
  }
  return result;
}

unint64_t sub_100118A58()
{
  unint64_t result = qword_10017FE98;
  if (!qword_10017FE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10017FE98);
  }
  return result;
}

uint64_t sub_100118AAC()
{
  return sub_100118AF4(&qword_10017D420, (void (*)(uint64_t))type metadata accessor for OSExtension);
}

uint64_t sub_100118AF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for OSExtension(uint64_t a1)
{
  return sub_1000192DC(a1, (uint64_t *)&unk_100197EA0);
}

unint64_t sub_100118B60()
{
  unint64_t result = qword_10017FEA0;
  if (!qword_10017FEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10017FEA0);
  }
  return result;
}

uint64_t destroy for OSExtensionCodableLocation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100012A10(*(void *)(a1 + 32), *(void *)(a1 + 40));

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for OSExtensionCodableLocation(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[4];
  unint64_t v7 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100012DE4(v6, v7);
  a1[4] = v6;
  a1[5] = v7;
  uint64_t v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for OSExtensionCodableLocation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[4];
  unint64_t v5 = a2[5];
  sub_100012DE4(v4, v5);
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  a1[4] = v4;
  a1[5] = v5;
  sub_100012A10(v6, v7);
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for OSExtensionCodableLocation(uint64_t a1, uint64_t a2)
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

void *assignWithTake for OSExtensionCodableLocation(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_100012A10(v6, v7);
  uint64_t v8 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OSExtensionCodableLocation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OSExtensionCodableLocation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSExtensionCodableLocation()
{
  return &type metadata for OSExtensionCodableLocation;
}

uint64_t destroy for OSExtensionCodable(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >> 60 != 15) {
    sub_100012A10(*(void *)(a1 + 24), v2);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for OSExtensionCodable(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = a2[2];
  uint64_t v5 = a2 + 3;
  unint64_t v6 = a2[4];
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *v5;
  }
  else
  {
    uint64_t v7 = *(void *)v5;
    sub_100012DE4(v7, v6);
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v6;
  }
  uint64_t v8 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for OSExtensionCodable(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = a2 + 3;
  unint64_t v5 = a2[4];
  if (a1[4] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_100012DE4(*v4, a2[4]);
      uint64_t v8 = a1[3];
      unint64_t v9 = a1[4];
      a1[3] = v7;
      a1[4] = v5;
      sub_100012A10(v8, v9);
      goto LABEL_8;
    }
    sub_10011901C((uint64_t)(a1 + 3));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_100012DE4(*v4, a2[4]);
  a1[3] = v6;
  a1[4] = v5;
LABEL_8:
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10011901C(uint64_t a1)
{
  return a1;
}

void *assignWithTake for OSExtensionCodable(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  unint64_t v5 = a2 + 3;
  unint64_t v6 = a1[4];
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = a2[4];
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = a1[3];
      a1[3] = *v5;
      a1[4] = v7;
      sub_100012A10(v8, v6);
      goto LABEL_6;
    }
    sub_10011901C((uint64_t)(a1 + 3));
  }
  *(_OWORD *)(a1 + 3) = *(_OWORD *)v5;
LABEL_6:
  uint64_t v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OSExtensionCodable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OSExtensionCodable(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSExtensionCodable()
{
  return &type metadata for OSExtensionCodable;
}

uint64_t sub_1001191B8()
{
  return type metadata accessor for OSExtension(0);
}

void sub_1001191C0()
{
  sub_100054AC4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t destroy for OSExtension.Location(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 40);
  if (v1 >= 3) {
    unsigned int v1 = *(_DWORD *)result + 3;
  }
  if (v1 != 2)
  {
    if (v1 == 1) {
      return swift_release();
    }
    else {
      return sub_10000478C(result);
    }
  }
  return result;
}

uint64_t initializeWithCopy for OSExtension.Location(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 3) {
    unsigned int v3 = *(_DWORD *)a2 + 3;
  }
  if (v3 == 2)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(unsigned char *)(a1 + 40) = 2;
  }
  else if (v3 == 1)
  {
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 40) = 1;
    swift_retain();
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    *(unsigned char *)(a1 + 40) = 0;
  }
  return a1;
}

uint64_t assignWithCopy for OSExtension.Location(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 != 2)
    {
      if (v4 == 1) {
        swift_release();
      }
      else {
        sub_10000478C(a1);
      }
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 40) = 2;
    }
    else if (v5 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 40) = 1;
      swift_retain();
    }
    else
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 0;
    }
  }
  return a1;
}

__n128 initializeWithTake for OSExtension.Location(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OSExtension.Location(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 != 2)
    {
      if (v4 == 1) {
        swift_release();
      }
      else {
        sub_10000478C(a1);
      }
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v6 = 2;
    }
    else if (v5 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
    }
    *(unsigned char *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for OSExtension.Location(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for OSExtension.Location(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
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
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1001195A8(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_1001195C4(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSExtension.Location()
{
  return &type metadata for OSExtension.Location;
}

uint64_t sub_1001195FC()
{
  return type metadata accessor for KernelExtension(0);
}

uint64_t sub_100119608()
{
  return type metadata accessor for DriverExtension(0);
}

uint64_t sub_100119610()
{
  return swift_updateClassMetadata2();
}

ValueMetadata *type metadata accessor for OSExtensionCodable.CodingKeys()
{
  return &type metadata for OSExtensionCodable.CodingKeys;
}

unsigned char *_s10driverkitd18OSExtensionCodableV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x10011972CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSExtensionCodableLocation.CodingKeys()
{
  return &type metadata for OSExtensionCodableLocation.CodingKeys;
}

unint64_t sub_100119768()
{
  unint64_t result = qword_100197FD0[0];
  if (!qword_100197FD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100197FD0);
  }
  return result;
}

unint64_t sub_1001197C0()
{
  unint64_t result = qword_1001981E0[0];
  if (!qword_1001981E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001981E0);
  }
  return result;
}

unint64_t sub_100119818()
{
  unint64_t result = qword_1001982F0;
  if (!qword_1001982F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001982F0);
  }
  return result;
}

unint64_t sub_100119870()
{
  unint64_t result = qword_1001982F8[0];
  if (!qword_1001982F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001982F8);
  }
  return result;
}

unint64_t sub_1001198C8()
{
  unint64_t result = qword_100198380;
  if (!qword_100198380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100198380);
  }
  return result;
}

unint64_t sub_100119920()
{
  unint64_t result = qword_100198388[0];
  if (!qword_100198388[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100198388);
  }
  return result;
}

uint64_t sub_100119974()
{
  type metadata accessor for Dictionary.Keys();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v0 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100119A38@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(char *)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, char *a5@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v28 = a5;
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a4 - 8);
  __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v15, a1, a3);
  char v20 = swift_dynamicCast();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  if (v20)
  {
    v21(v12, 0, 1, a4);
    unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v22(v18, v12, a4);
    char v23 = v27(v18);
    uint64_t v24 = v28;
    if (v23)
    {
      v22(v28, v18, a4);
      uint64_t v25 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, a4);
      uint64_t v25 = 1;
    }
  }
  else
  {
    uint64_t v25 = 1;
    v21(v12, 1, 1, a4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v24 = v28;
  }
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v21)(v24, v25, 1, a4);
}

uint64_t sub_100119D0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  v34[1] = a2;
  v34[2] = a6;
  uint64_t v36 = a7;
  uint64_t v37 = a1;
  uint64_t v10 = type metadata accessor for Optional();
  v34[0] = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v35 = (char *)v34 - v11;
  uint64_t v12 = type metadata accessor for Optional();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v34 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(a3 - 8);
  __chkstk_darwin(v17);
  unint64_t v22 = (char *)v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v19, v37, a5);
  int v24 = swift_dynamicCast();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  if (v24)
  {
    uint64_t v26 = v34[0];
    v25(v16, 0, 1, a3);
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v16, a3);
    uint64_t v27 = v35;
    Dictionary.subscript.getter();
    uint64_t v28 = *(void *)(a4 - 8);
    int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v27, 1, a4);
    uint64_t v30 = v36;
    if (v29 == 1)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, a3);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v27, v10);
      *(_OWORD *)uint64_t v30 = 0u;
      *(_OWORD *)(v30 + 16) = 0u;
    }
    else
    {
      *(void *)(v36 + 24) = a4;
      uint64_t v33 = sub_1000045E8((uint64_t *)v30);
      (*(void (**)(uint64_t *, char *, uint64_t))(v28 + 32))(v33, v27, a4);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, a3);
    }
  }
  else
  {
    v25(v16, 1, 1, a3);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    uint64_t v32 = v36;
    *(_OWORD *)uint64_t v36 = 0u;
    *(_OWORD *)(v32 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10011A0E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X4>, uint64_t a4@<X8>)
{
  return sub_100119D0C(a1, *v4, a3[2], a3[3], a2, a3[4], a4);
}

uint64_t sub_10011A0F8()
{
  return sub_100119974();
}

void *sub_10011A114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t sub_10011A168()
{
  return (*(uint64_t (**)(void))(v0 + 32))() & 1;
}

uint64_t sub_10011A194()
{
  type metadata accessor for PropertyCheck();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v0 = _ArrayProtocol.filter(_:)();
  if (!Array.count.getter())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v0;
}

void *sub_10011A264(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a2;
  uint64_t v4 = *(void *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(a1);
  uint64_t v17 = *(void *)(v2 + 88);
  uint64_t v18 = type metadata accessor for PropertyCheck();
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  uint64_t v20 = 0x79747265706F7250;
  unint64_t v21 = 0xEA00000000002720;
  long long v7 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v7((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x8000000100150520;
  v9._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v9);
  uint64_t v11 = v20;
  unint64_t v10 = v21;
  v7((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v17;
  *(void *)(v13 + 16) = v4;
  *(void *)(v13 + 24) = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13 + v12, (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v13 + ((v6 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19;
  uint64_t result = (void *)swift_allocObject();
  result[2] = v11;
  result[3] = v10;
  result[4] = sub_10011D808;
  result[5] = v13;
  return result;
}

void *sub_10011A464(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  type metadata accessor for PropertyCheck();
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease();
  type metadata accessor for Array();
  swift_getWitnessTable();
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 39;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  long long v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = v4;
  void v7[4] = a1;
  Swift::String v8 = (void *)swift_allocObject();
  long long v8[2] = 0xD000000000000024;
  v8[3] = 0x8000000100150540;
  v8[4] = sub_10011D96C;
  v8[5] = v7;
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t sub_10011A5B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = a2;
  uint64_t v23 = a5;
  uint64_t v8 = *(void *)(a4 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(a1);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  if (!Array.endIndex.getter())
  {
LABEL_12:
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v11 = 0;
  unint64_t v21 = (void (**)(char *, void *, uint64_t))(v8 + 16);
  uint64_t v19 = v9;
  uint64_t v20 = (void (**)(char *, uint64_t))(v8 + 8);
  while (1)
  {
    Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
    Array._checkSubscript(_:wasNativeTypeChecked:)();
    if (IsNativeType)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, a3+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v11, a4);
      uint64_t v13 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
    uint64_t result = _ArrayBuffer._getElementSlowPath(_:)();
    if (v19 != 8) {
      break;
    }
    v24[0] = result;
    (*v21)(v10, v24, a4);
    swift_unknownObjectRelease();
    uint64_t v13 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
LABEL_5:
    uint64_t v15 = a1[3];
    uint64_t v14 = a1[4];
    sub_1000036B0(a1, v15);
    (*(void (**)(void *__return_ptr, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(v24, v10, v22, a4, v23, v15, v14);
    (*v20)(v10, a4);
    uint64_t v16 = v24[3];
    sub_1000130EC((uint64_t)v24, &qword_10017C018);
    if (v16)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    ++v11;
    if (v13 == Array.endIndex.getter()) {
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

void *sub_10011A80C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v35 = a1;
  uint64_t v36 = a4;
  char v8 = a3;
  int v32 = a3;
  uint64_t v10 = *(void *)(v5 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(a1);
  uint64_t v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease();
  uint64_t v38 = 0x79747265706F7250;
  unint64_t v39 = 0xEA00000000002720;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v34(v13, a1, v10);
  v14._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._object = (void *)0x8000000100150570;
  v15._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v15);
  uint64_t v33 = a5;
  uint64_t v37 = a5;
  swift_getMetatypeMetadata();
  v16._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = v38;
  unint64_t v18 = v39;
  BOOL v19 = (v8 & 1) == 0;
  if (v8) {
    uint64_t v20 = 0x20656220726F202CLL;
  }
  else {
    uint64_t v20 = 0;
  }
  if (v19) {
    unint64_t v21 = (void *)0xE000000000000000;
  }
  else {
    unint64_t v21 = (void *)0xEE00746E65736261;
  }
  uint64_t v22 = *(void *)(v6 + 88);
  v31[1] = type metadata accessor for PropertyCheck();
  uint64_t v38 = v17;
  unint64_t v39 = v18;
  swift_bridgeObjectRetain();
  v23._countAndFlagsBits = v20;
  v23._object = v21;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = v38;
  unint64_t v25 = v39;
  v34((char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v35, v10);
  unint64_t v26 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v27 = v26 + v12;
  uint64_t v28 = (char *)swift_allocObject();
  uint64_t v29 = v33;
  *((void *)v28 + 2) = v10;
  *((void *)v28 + 3) = v29;
  *((void *)v28 + 4) = v22;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v28[v26], v13, v10);
  v28[v27] = v32;
  *(void *)&v28[(v27 & 0xFFFFFFFFFFFFFFF8) + 8] = v36;
  uint64_t result = (void *)swift_allocObject();
  result[2] = v24;
  result[3] = v25;
  result[4] = sub_10011DA9C;
  result[5] = v28;
  return result;
}

uint64_t sub_10011AABC(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v32 = a5;
  int v33 = a4;
  uint64_t v14 = type metadata accessor for Optional();
  uint64_t v34 = *(void *)(v14 - 8);
  uint64_t v35 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v31 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  BOOL v19 = (char *)&v31 - v18;
  uint64_t v36 = *(void *)(a7 - 8);
  __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  sub_1000036B0(a1, v22);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(&v37, a3, a2, a6, a8, v22, v23);
  if (v38)
  {
    sub_10001889C(&v37, v39);
    sub_1000047DC((uint64_t)v39, (uint64_t)&v37);
    char v24 = swift_dynamicCast();
    uint64_t v25 = v36;
    unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56);
    if (v24)
    {
      v26(v19, 0, 1, a7);
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v21, v19, a7);
      uint64_t v27 = v32;
      if (v32)
      {
        uint64_t v28 = v31;
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v31, v21, a7);
        char v29 = 1;
        v26(v28, 0, 1, a7);
        (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v27, v28, v35);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v21, a7);
        sub_10000478C((uint64_t)v39);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v25 + 8))(v21, a7);
        sub_10000478C((uint64_t)v39);
        char v29 = 1;
      }
    }
    else
    {
      v26(v19, 1, 1, a7);
      sub_10000478C((uint64_t)v39);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v19, v35);
      char v29 = 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v37, &qword_10017C018);
    char v29 = v33;
  }
  return v29 & 1;
}

void *sub_10011AE0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a6;
  uint64_t v34 = a5;
  uint64_t v40 = a4;
  char v7 = a3;
  int v33 = a3;
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v10 = *(void *)(v6 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(a1);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  _StringGuts.grow(_:)(45);
  swift_bridgeObjectRelease();
  uint64_t v42 = 0x79747265706F7250;
  unint64_t v43 = 0xEA00000000002720;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v35(v13, a1, v10);
  v14._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._object = (void *)0x8000000100150590;
  v15._countAndFlagsBits = 0xD00000000000001FLL;
  String.append(_:)(v15);
  uint64_t v41 = a2;
  type metadata accessor for Array();
  swift_getWitnessTable();
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = v42;
  unint64_t v18 = v43;
  if (v7) {
    uint64_t v19 = 0x20656220726F202CLL;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v7) {
    uint64_t v20 = (void *)0xEE00746E65736261;
  }
  else {
    uint64_t v20 = (void *)0xE000000000000000;
  }
  uint64_t v21 = *(void *)(v38 + 88);
  uint64_t v38 = type metadata accessor for PropertyCheck();
  uint64_t v42 = v17;
  unint64_t v43 = v18;
  swift_bridgeObjectRetain();
  v22._countAndFlagsBits = v19;
  v22._object = v20;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v23 = v43;
  uint64_t v32 = v42;
  v35((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v36, v10);
  unint64_t v24 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v25 = v24 + v12;
  unint64_t v26 = (v24 + v12) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = (char *)swift_allocObject();
  uint64_t v28 = v34;
  *((void *)v27 + 2) = v10;
  *((void *)v27 + 3) = v28;
  uint64_t v29 = v39;
  *((void *)v27 + 4) = v21;
  *((void *)v27 + 5) = v29;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v27[v24], v13, v10);
  v27[v25] = v33;
  *(void *)&v27[v26 + 8] = v40;
  *(void *)&v27[(v26 + 23) & 0xFFFFFFFFFFFFFFF8] = v37;
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = v32;
  v30[3] = v23;
  v30[4] = sub_10011DBAC;
  v30[5] = v27;
  swift_bridgeObjectRetain();
  return v30;
}

uint64_t sub_10011B11C(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v15 = type metadata accessor for Optional();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v31 - v19;
  uint64_t v38 = *(void *)(a8 - 8);
  __chkstk_darwin(v18);
  int v33 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1[3];
  uint64_t v22 = a1[4];
  sub_1000036B0(a1, v23);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8))(&v39, a3, a2, a7, a9, v23, v22);
  if (v40)
  {
    sub_10001889C(&v39, v41);
    sub_1000047DC((uint64_t)v41, (uint64_t)&v39);
    char v24 = swift_dynamicCast();
    uint64_t v25 = v38;
    unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56);
    if (v24)
    {
      v26(v20, 0, 1, a8);
      uint64_t v27 = v33;
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v33, v20, a8);
      uint64_t v28 = v34;
      if (v34)
      {
        uint64_t v29 = v32;
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v32, v27, a8);
        v26(v29, 0, 1, a8);
        (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v28, v29, v37);
      }
      *(void *)&long long v39 = v35;
      type metadata accessor for Array();
      swift_getWitnessTable();
      a4 = Sequence<>.contains(_:)();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, a8);
      sub_10000478C((uint64_t)v41);
    }
    else
    {
      v26(v20, 1, 1, a8);
      sub_10000478C((uint64_t)v41);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v20, v37);
      a4 = 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v39, &qword_10017C018);
  }
  return a4 & 1;
}

void *sub_10011B498(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v32 = a2;
  uint64_t v33 = a4;
  char v6 = a3;
  int v29 = a3;
  uint64_t v31 = a1;
  uint64_t v9 = *(void *)(v4 + 80);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(a1);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  _StringGuts.grow(_:)(65);
  v13._countAndFlagsBits = 0x79747265706F7250;
  v13._object = (void *)0xEA00000000002720;
  String.append(_:)(v13);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v30(v12, a1, v9);
  v14._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._object = (void *)0x80000001001505B0;
  v15._countAndFlagsBits = 0xD000000000000033;
  String.append(_:)(v15);
  uint64_t v34 = a2;
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = v35;
  unint64_t v18 = v36;
  if (v6) {
    uint64_t v19 = 0x20656220726F202CLL;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v6) {
    uint64_t v20 = (void *)0xEE00746E65736261;
  }
  else {
    uint64_t v20 = (void *)0xE000000000000000;
  }
  uint64_t v21 = *(void *)(v5 + 88);
  v28[1] = type metadata accessor for PropertyCheck();
  uint64_t v35 = v17;
  unint64_t v36 = v18;
  swift_bridgeObjectRetain();
  v22._countAndFlagsBits = v19;
  v22._object = v20;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v23 = v36;
  v28[0] = v35;
  v30((char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v9);
  unint64_t v24 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v25 = v24 + v11;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v9;
  *(void *)(v26 + 24) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v26 + v24, v12, v9);
  *(unsigned char *)(v26 + v25) = v29;
  *(void *)((v25 & 0xFFFFFFFFFFFFFFF8) + v26 + 8) = v33;
  *(void *)(v26 + (((v25 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) = v32;
  uint64_t result = (void *)swift_allocObject();
  result[2] = v28[0];
  result[3] = v23;
  result[4] = sub_10011DCE4;
  result[5] = v26;
  return result;
}

void *sub_10011B760(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5)
{
  uint64_t v38 = (uint64_t)a3;
  uint64_t v41 = a5;
  char v6 = a4;
  int v35 = a4;
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v10 = *(void *)(v5 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v40 = *(void *)(v11 + 64);
  __chkstk_darwin(a1);
  Swift::String v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  _StringGuts.grow(_:)(53);
  v14._countAndFlagsBits = 0x79747265706F7250;
  v14._object = (void *)0xEA00000000002720;
  String.append(_:)(v14);
  Swift::String v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v15(v13, a1, v10);
  v16._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._object = (void *)0x80000001001505F0;
  v17._countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v17);
  v18._countAndFlagsBits = a2;
  v18._object = a3;
  String.append(_:)(v18);
  uint64_t v19 = v42;
  unint64_t v20 = v43;
  if (v6) {
    uint64_t v21 = 0x20656220726F202CLL;
  }
  else {
    uint64_t v21 = 0;
  }
  if (v6) {
    Swift::String v22 = (void *)0xEE00746E65736261;
  }
  else {
    Swift::String v22 = (void *)0xE000000000000000;
  }
  uint64_t v23 = *(void *)(v39 + 88);
  uint64_t v39 = type metadata accessor for PropertyCheck();
  uint64_t v42 = v19;
  unint64_t v43 = v20;
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = v21;
  v24._object = v22;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v25 = v43;
  uint64_t v34 = v42;
  v15(v13, v36, v10);
  unint64_t v26 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v27 = v26 + v40;
  unint64_t v28 = (v26 + v40) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v10;
  *(void *)(v29 + 24) = v23;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v29 + v26, v13, v10);
  *(unsigned char *)(v29 + v27) = v35;
  *(void *)(v28 + v29 + 8) = v41;
  uint64_t v30 = (uint64_t *)(v29 + ((v28 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v31 = v38;
  *uint64_t v30 = v37;
  v30[1] = v31;
  uint64_t v32 = (void *)swift_allocObject();
  v32[2] = v34;
  v32[3] = v25;
  v32[4] = sub_10011DF30;
  v32[5] = v29;
  swift_bridgeObjectRetain();
  return v32;
}

void *sub_10011BA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v55 = a7;
  uint64_t v56 = a8;
  uint64_t v57 = a6;
  char v9 = a5;
  int v48 = a5;
  uint64_t v49 = a3;
  uint64_t v50 = a2;
  uint64_t v51 = a1;
  uint64_t v13 = *(void *)(v8 + 80);
  uint64_t v52 = *(void *)(v13 - 8);
  uint64_t v14 = v52;
  uint64_t v53 = v8;
  uint64_t v54 = *(void *)(v52 + 64);
  __chkstk_darwin(a1);
  Swift::String v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = 0;
  unint64_t v60 = 0xE000000000000000;
  _StringGuts.grow(_:)(81);
  v17._countAndFlagsBits = 0x79747265706F7250;
  v17._object = (void *)0xEA00000000002720;
  String.append(_:)(v17);
  Swift::String v18 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v18(v16, a1, v13);
  uint64_t v19 = v18;
  unint64_t v20 = v16;
  v21._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0xD000000000000021;
  v22._object = (void *)0x8000000100150620;
  String.append(_:)(v22);
  v23._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  v24._object = (void *)0x8000000100150650;
  v24._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v24);
  uint64_t v58 = a2;
  v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 8236;
  v26._object = (void *)0xE200000000000000;
  String.append(_:)(v26);
  uint64_t v58 = a3;
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 41;
  v28._object = (void *)0xE100000000000000;
  String.append(_:)(v28);
  uint64_t v30 = v59;
  unint64_t v29 = v60;
  if (v9) {
    uint64_t v31 = 0x20656220726F202CLL;
  }
  else {
    uint64_t v31 = 0;
  }
  if (v9) {
    uint64_t v32 = (void *)0xEE00746E65736261;
  }
  else {
    uint64_t v32 = (void *)0xE000000000000000;
  }
  uint64_t v33 = *(void *)(v53 + 88);
  uint64_t v53 = type metadata accessor for PropertyCheck();
  uint64_t v59 = v30;
  unint64_t v60 = v29;
  swift_bridgeObjectRetain();
  v34._countAndFlagsBits = v31;
  v34._object = v32;
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v35 = v60;
  uint64_t v47 = v59;
  uint64_t v36 = v20;
  v19(v20, v51, v13);
  uint64_t v37 = v52;
  unint64_t v38 = (*(unsigned __int8 *)(v52 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  uint64_t v39 = v38 + v54;
  unint64_t v40 = (v38 + v54) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = (char *)swift_allocObject();
  uint64_t v42 = v55;
  *((void *)v41 + 2) = v13;
  *((void *)v41 + 3) = v42;
  uint64_t v43 = v56;
  *((void *)v41 + 4) = v33;
  *((void *)v41 + 5) = v43;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v41[v38], v36, v13);
  v41[v39] = v48;
  *(void *)&v41[v40 + 8] = v57;
  char v44 = &v41[(v40 + 23) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v45 = v49;
  *(void *)char v44 = v50;
  *((void *)v44 + 1) = v45;
  uint64_t result = (void *)swift_allocObject();
  result[2] = v47;
  result[3] = v35;
  result[4] = sub_10011E178;
  result[5] = v41;
  return result;
}

BOOL sub_10011BDAC(void *a1, uint64_t a2, uint64_t a3, BOOL a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  uint64_t v34 = a5;
  BOOL v37 = a4;
  uint64_t v14 = type metadata accessor for Optional();
  uint64_t v38 = *(void *)(v14 - 8);
  uint64_t v39 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v33 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v33 - v18;
  uint64_t v40 = *(void *)(a9 - 8);
  __chkstk_darwin(v17);
  Swift::String v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  sub_1000036B0(a1, v22);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(&v41, a3, a2, a8, a10, v22, v23);
  if (v42)
  {
    sub_10001889C(&v41, v43);
    sub_1000047DC((uint64_t)v43, (uint64_t)&v41);
    char v24 = swift_dynamicCast();
    uint64_t v25 = v40;
    Swift::String v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56);
    if (v24)
    {
      v26(v19, 0, 1, a9);
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v21, v19, a9);
      uint64_t v27 = v34;
      if (v34)
      {
        Swift::String v28 = v33;
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v33, v21, a9);
        v26(v28, 0, 1, a9);
        (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v27, v28, v39);
      }
      uint64_t v29 = dispatch thunk of Sequence.underestimatedCount.getter();
      BOOL v31 = v29 >= v35 && v29 < v36;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v21, a9);
      sub_10000478C((uint64_t)v43);
    }
    else
    {
      v26(v19, 1, 1, a9);
      sub_10000478C((uint64_t)v43);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v39);
      return 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v41, &qword_10017C018);
    return v37;
  }
  return v31;
}

void *sub_10011C0F8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v32 = a3;
  char v5 = a2;
  int v29 = a2;
  uint64_t v30 = a1;
  uint64_t v7 = *(void *)(v3 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v31 = *(void *)(v8 + 64);
  __chkstk_darwin(a1);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)0xE000000000000000;
  uint64_t v33 = 0;
  unint64_t v34 = 0xE000000000000000;
  _StringGuts.grow(_:)(42);
  swift_bridgeObjectRelease();
  uint64_t v33 = 0x79747265706F7250;
  unint64_t v34 = 0xEA00000000002720;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v12(v10, a1, v7);
  v13._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._object = (void *)0x8000000100150670;
  v14._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v14);
  uint64_t v15 = v33;
  unint64_t v16 = v34;
  BOOL v17 = (v5 & 1) == 0;
  if (v5) {
    uint64_t v18 = 0x20656220726F202CLL;
  }
  else {
    uint64_t v18 = 0;
  }
  if (!v17) {
    uint64_t v11 = (void *)0xEE00746E65736261;
  }
  uint64_t v19 = *(void *)(v4 + 88);
  v28[1] = type metadata accessor for PropertyCheck();
  uint64_t v33 = v15;
  unint64_t v34 = v16;
  swift_bridgeObjectRetain();
  v20._countAndFlagsBits = v18;
  v20._object = v11;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v21 = v33;
  unint64_t v22 = v34;
  v12(v10, v30, v7);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = v23 + v31;
  unint64_t v25 = (v23 + v31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v7;
  *(void *)(v26 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v26 + v23, v10, v7);
  *(unsigned char *)(v26 + v24) = v29;
  *(void *)(v25 + v26 + 8) = v32;
  uint64_t result = (void *)swift_allocObject();
  result[2] = v21;
  result[3] = v22;
  result[4] = sub_10011E2B4;
  result[5] = v26;
  return result;
}

void *sub_10011C374(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v29 = a6;
  uint64_t v31 = a5;
  int v30 = a4;
  uint64_t v25 = a1;
  uint64_t v26 = a3;
  uint64_t v9 = *(void *)(v6 + 80);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(a1);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *(void *)(v6 + 88);
  uint64_t v27 = type metadata accessor for PropertyCheck();
  unint64_t v33 = 0;
  unint64_t v34 = 0xE000000000000000;
  _StringGuts.grow(_:)(36);
  swift_bridgeObjectRelease();
  unint64_t v33 = 0xD000000000000011;
  unint64_t v34 = 0x8000000100150690;
  Swift::String v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  v14._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0x6173207473756D20;
  v15._object = (void *)0xEF203A7966736974;
  String.append(_:)(v15);
  uint64_t v32 = a3;
  type metadata accessor for Array();
  swift_getWitnessTable();
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  unint64_t v18 = v33;
  unint64_t v17 = v34;
  v13(v12, v25, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v20 = v19 + v11;
  uint64_t v21 = (char *)swift_allocObject();
  uint64_t v22 = v29;
  *((void *)v21 + 2) = v9;
  *((void *)v21 + 3) = v22;
  *((void *)v21 + 4) = v28;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v12, v9);
  v21[v20] = v30;
  *(void *)&v21[(v20 & 0xFFFFFFFFFFFFFFF8) + 8] = v31;
  *(void *)&v21[((v20 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8] = v26;
  unint64_t v23 = (void *)swift_allocObject();
  v23[2] = v18;
  v23[3] = v17;
  v23[4] = sub_10011E4FC;
  v23[5] = v21;
  swift_bridgeObjectRetain();
  return v23;
}

uint64_t sub_10011C614(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v33 = a6;
  uint64_t v32 = a5;
  int v38 = a4;
  uint64_t v14 = type metadata accessor for Optional();
  uint64_t v35 = *(void *)(v14 - 8);
  uint64_t v36 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = *(void *)(a8 - 8);
  uint64_t v19 = __chkstk_darwin(v15);
  unint64_t v34 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  BOOL v37 = (char *)&v31 - v21;
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  sub_1000036B0(a1, v22);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(&v41, a3, a2, a7, a9, v22, v23);
  if (v42)
  {
    sub_10001889C(&v41, v43);
    sub_1000047DC((uint64_t)v43, (uint64_t)&v41);
    char v24 = swift_dynamicCast();
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    if (v24)
    {
      v25(v17, 0, 1, a8);
      uint64_t v26 = v37;
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v37, v17, a8);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v34, v26, a8);
      sub_100004700(&qword_100180350);
      if (swift_dynamicCast())
      {
        sub_10000372C(v39, (uint64_t)&v41);
        uint64_t v27 = v32;
        if (v32)
        {
          sub_10000469C((uint64_t)&v41, (uint64_t)v39);
          sub_100029900((uint64_t)v39, v27, &qword_100180358);
        }
        type metadata accessor for PropertyCheck();
        uint64_t v28 = sub_10011A194();
        sub_10000478C((uint64_t)&v41);
        (*(void (**)(char *, uint64_t))(v18 + 8))(v26, a8);
        sub_10000478C((uint64_t)v43);
        if (v28)
        {
          swift_bridgeObjectRelease();
          char v29 = 0;
        }
        else
        {
          char v29 = 1;
        }
      }
      else
      {
        uint64_t v40 = 0;
        memset(v39, 0, sizeof(v39));
        (*(void (**)(char *, uint64_t))(v18 + 8))(v26, a8);
        sub_10000478C((uint64_t)v43);
        sub_1000130EC((uint64_t)v39, &qword_100180358);
        char v29 = 0;
      }
    }
    else
    {
      v25(v17, 1, 1, a8);
      sub_10000478C((uint64_t)v43);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v36);
      char v29 = 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v41, &qword_10017C018);
    char v29 = v38;
  }
  return v29 & 1;
}

void *sub_10011C9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *(void *)(v4 + 80);
  uint64_t v9 = *(void *)(v4 + 88);
  type metadata accessor for PropertyCheck();
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = v9;
  v11[4] = a1;
  v11[5] = a2;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  void v12[3] = a4;
  v12[4] = sub_10011E5D4;
  v12[5] = v11;
  swift_bridgeObjectRetain();
  swift_retain();
  return v12;
}

void *sub_10011CAA8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v15 = a3;
    swift_bridgeObjectRetain();
    v5._countAndFlagsBits = 0x464F20594E412820;
    v5._object = (void *)0xEA0000000000203ALL;
    String.append(_:)(v5);
    uint64_t v6 = *(void *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 88);
    type metadata accessor for PropertyCheck();
    v8._countAndFlagsBits = Array.description.getter();
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 41;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
  }
  else
  {
    a2 = 0x203A464F20594E41;
    unint64_t v15 = 0xE800000000000000;
    uint64_t v6 = *(void *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 88);
    type metadata accessor for PropertyCheck();
    v10._countAndFlagsBits = Array.description.getter();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v6;
  v11[3] = v7;
  v11[4] = a1;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a2;
  void v12[3] = v15;
  v12[4] = sub_10011E6CC;
  v12[5] = v11;
  swift_bridgeObjectRetain();
  return v12;
}

void *sub_10011CC14(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  type metadata accessor for PropertyCheck();
  v5._countAndFlagsBits = Array.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = a1;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0x203A464F204C4C41;
  v7[3] = 0xE800000000000000;
  void v7[4] = sub_10011E800;
  v7[5] = v6;
  swift_bridgeObjectRetain();
  return v7;
}

void *sub_10011CD00(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  type metadata accessor for PropertyCheck();
  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = Array.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = a1;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0xD000000000000010;
  v7[3] = 0x80000001001506B0;
  void v7[4] = sub_10011E934;
  v7[5] = v6;
  swift_bridgeObjectRetain();
  return v7;
}

void *sub_10011CE0C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1);
  uint64_t v6 = *(void *)(v1 + 88);
  type metadata accessor for PropertyCheck();
  v12[0] = 0;
  v12[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(50);
  v7._countAndFlagsBits = 0x79747265706F7250;
  v7._object = (void *)0xE900000000000020;
  String.append(_:)(v7);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v8._object = (void *)0x80000001001506D0;
  v8._countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v3;
  *(void *)(v10 + 24) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v10 + v9, (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0;
  result[3] = 0xE000000000000000;
  result[4] = sub_10011EB04;
  result[5] = v10;
  return result;
}

uint64_t sub_10011CFCC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100004700(&qword_10017C7E0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_1000036B0(a1, v13);
  (*(void (**)(unint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(&v88, a3, a2, a4, a5, v13, v14);
  if (!v91)
  {
    sub_1000130EC((uint64_t)&v88, &qword_10017C018);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  unint64_t v16 = v86;
  unint64_t v15 = v87;
  unint64_t v88 = v86;
  unint64_t v89 = v87;
  unint64_t v17 = sub_1000A3A58();
  unint64_t v18 = *((void *)v17 + 1);
  unint64_t v86 = *(void *)v17;
  unint64_t v87 = v18;
  uint64_t v19 = type metadata accessor for Locale();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  unint64_t v22 = v20 + 56;
  v21(v12, 1, 1, v19);
  unint64_t v23 = sub_100029B24();
  swift_bridgeObjectRetain();
  StringProtocol.range<A>(of:options:range:locale:)();
  unint64_t v25 = v24;
  LOBYTE(v18) = v26;
  sub_1000130EC((uint64_t)v12, &qword_10017C7E0);
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_9;
  }
  unint64_t v88 = v16;
  unint64_t v89 = v15;
  uint64_t v27 = (unint64_t *)sub_1000A3A64();
  unint64_t v28 = v27[1];
  unint64_t v86 = *v27;
  unint64_t v87 = v28;
  v21(v12, 1, 1, v19);
  swift_bridgeObjectRetain();
  unint64_t v29 = StringProtocol.range<A>(of:options:range:locale:)();
  uint64_t v31 = v30;
  sub_1000130EC((uint64_t)v12, &qword_10017C7E0);
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_9;
  }
  unint64_t v80 = v23;
  unint64_t v81 = v22;
  if (v29 >> 14 < v25 >> 14)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  unint64_t v16 = String.subscript.getter();
  unint64_t v22 = v32;
  unint64_t v23 = v33;
  uint64_t v35 = v34;
  swift_bridgeObjectRelease();
  uint64_t v78 = v19;
  unint64_t v79 = v12;
  char v77 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21;
  if (v22 >> 14 == v16 >> 14)
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_34;
  }
  uint64_t v31 = (char *)_swiftEmptyArrayStorage;
  unint64_t v37 = v16;
  unint64_t v38 = v16;
  unint64_t v25 = v16;
  uint64_t v84 = v35;
  unint64_t v85 = v22 >> 14;
  do
  {
    if (Substring.subscript.getter() == 44 && v40 == 0xE100000000000000
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v41 = Character.isWhitespace.getter();
      swift_bridgeObjectRelease();
      if ((v41 & 1) == 0)
      {
        unint64_t v37 = Substring.index(after:)();
        continue;
      }
    }
    if (v38 >> 14 != v37 >> 14)
    {
      if (v37 >> 14 < v38 >> 14)
      {
        __break(1u);
        goto LABEL_42;
      }
      uint64_t v42 = Substring.subscript.getter();
      uint64_t v44 = v43;
      uint64_t v46 = v45;
      uint64_t v48 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v31 = sub_10002D298(0, *((void *)v31 + 2) + 1, 1, v31);
      }
      uint64_t v49 = v31;
      unint64_t v50 = *((void *)v31 + 2);
      uint64_t v51 = v49;
      unint64_t v52 = *((void *)v49 + 3);
      if (v50 >= v52 >> 1) {
        uint64_t v51 = sub_10002D298((char *)(v52 > 1), v50 + 1, 1, v51);
      }
      *((void *)v51 + 2) = v50 + 1;
      uint64_t v39 = &v51[32 * v50];
      uint64_t v31 = v51;
      *((void *)v39 + 4) = v42;
      *((void *)v39 + 5) = v44;
      *((void *)v39 + 6) = v46;
      *((void *)v39 + 7) = v48;
    }
    unint64_t v37 = Substring.index(after:)();
    unint64_t v38 = v37;
    unint64_t v25 = v37;
  }
  while (v85 != v37 >> 14);
  if (v85 == v38 >> 14)
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  if (v85 >= v25 >> 14)
  {
    unint64_t v25 = Substring.subscript.getter();
    unint64_t v16 = v53;
    unint64_t v22 = v54;
    unint64_t v23 = v55;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_31;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  uint64_t v31 = sub_10002D298(0, *((void *)v31 + 2) + 1, 1, v31);
LABEL_31:
  uint64_t v56 = v31;
  unint64_t v57 = *((void *)v31 + 2);
  uint64_t v58 = v56;
  unint64_t v59 = *((void *)v56 + 3);
  if (v57 >= v59 >> 1) {
    uint64_t v58 = sub_10002D298((char *)(v59 > 1), v57 + 1, 1, v58);
  }
  *((void *)v58 + 2) = v57 + 1;
  unint64_t v60 = &v58[32 * v57];
  uint64_t v31 = v58;
  *((void *)v60 + 4) = v25;
  *((void *)v60 + 5) = v16;
  *((void *)v60 + 6) = v22;
  *((void *)v60 + 7) = v23;
LABEL_34:
  uint64_t v61 = *((void *)v31 + 2);
  if (v61)
  {
    unint64_t v76 = v31;
    uint64_t v62 = (uint64_t *)(v31 + 56);
    uint64_t v64 = v78;
    uint64_t v63 = (uint64_t)v79;
    long long v65 = v77;
    while (1)
    {
      uint64_t v82 = v61;
      uint64_t v66 = *(v62 - 1);
      uint64_t v67 = *v62;
      unint64_t v68 = *(v62 - 3);
      unint64_t v83 = *(v62 - 2);
      uint64_t v84 = v66;
      unint64_t v88 = v68;
      unint64_t v89 = v83;
      uint64_t v90 = v66;
      uint64_t v91 = v67;
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_1000A3A70();
      unint64_t v70 = *((void *)v69 + 1);
      unint64_t v86 = *(void *)v69;
      unint64_t v87 = v70;
      v65(v63, 1, 1, v64);
      sub_100080558();
      swift_bridgeObjectRetain();
      StringProtocol.range<A>(of:options:range:locale:)();
      LODWORD(v85) = v71;
      sub_1000130EC(v63, &qword_10017C7E0);
      swift_bridgeObjectRelease();
      unint64_t v88 = v68;
      unint64_t v89 = v83;
      uint64_t v90 = v84;
      uint64_t v91 = v67;
      uint64_t v72 = (unint64_t *)sub_1000A3A7C();
      unint64_t v73 = v72[1];
      unint64_t v86 = *v72;
      unint64_t v87 = v73;
      v65(v63, 1, 1, v64);
      swift_bridgeObjectRetain();
      StringProtocol.range<A>(of:options:range:locale:)();
      char v75 = v74;
      sub_1000130EC(v63, &qword_10017C7E0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v85 & 1) != 0 && (v75) {
        break;
      }
      v62 += 4;
      uint64_t v61 = v82 - 1;
      if (v82 == 1) {
        goto LABEL_40;
      }
    }
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
LABEL_40:
    swift_bridgeObjectRelease();
    return 1;
  }
}

uint64_t sub_10011D6E8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t sub_10011D728()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10011D75C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_100119A38(a1, *(uint64_t (**)(char *))(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 32), a2);
}

BOOL sub_10011D790(uint64_t a1)
{
  return ((*(uint64_t (**)(void, void))(**(void **)a1 + 120))(*(void *)(v1 + 32), *(void *)(v1 + 40)) & 1) == 0;
}

uint64_t type metadata accessor for PropertyCheck()
{
  return sub_100004FAC();
}

BOOL sub_10011D808(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v7 = v2 + v6;
  uint64_t v8 = *(void *)(v2 + ((*(void *)(*(void *)(v4 - 8) + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_1000036B0(a1, v9);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(&v13, v7, a2, v4, v5, v9, v10);
  uint64_t v11 = v14;
  if (v14)
  {
    sub_10001889C(&v13, v15);
    if (v8) {
      sub_1000047DC((uint64_t)v15, v8);
    }
    sub_10000478C((uint64_t)v15);
  }
  else
  {
    sub_1000130EC((uint64_t)&v13, &qword_10017C018);
  }
  return v11 == 0;
}

uint64_t sub_10011D934()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10011D96C(void *a1, uint64_t a2)
{
  return sub_10011A5B4(a1, a2, v2[4], v2[2], v2[3]);
}

uint64_t sub_10011D978()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_10011DA0C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_10011DA9C(void *a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80);
  return sub_10011AABC(a1, a2, (uint64_t)v2 + v3, *((unsigned __int8 *)v2 + v3 + *(void *)(*(void *)(v2[2] - 8) + 64)), *(uint64_t *)((char *)v2 + ((v3 + *(void *)(*(void *)(v2[2] - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 8), v2[2], v2[3], v2[4]);
}

uint64_t sub_10011DB0C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_10011DBAC(void *a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80);
  return sub_10011B11C(a1, a2, (uint64_t)v2 + v3, *((unsigned char *)v2 + v3 + *(void *)(*(void *)(v2[2] - 8) + 64)), *(uint64_t *)((char *)v2 + ((v3 + *(void *)(*(void *)(v2[2] - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 8), *(uint64_t *)((char *)v2+ ((((v3 + *(void *)(*(void *)(v2[2] - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), v2[2], v2[3], v2[4]) & 1;
}

uint64_t sub_10011DC4C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5, v4);
}

BOOL sub_10011DCE4(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  unint64_t v7 = v6 + *(void *)(*(void *)(v4 - 8) + 64);
  uint64_t v8 = *(unsigned __int8 *)(v2 + v7);
  uint64_t v9 = v2 + v6;
  uint64_t v10 = *(void **)((v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 8);
  uint64_t v11 = *(void *)(v2 + (((v7 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_1000036B0(a1, v12);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8))(&v18, v9, a2, v4, v5, v12, v13);
  if (v19)
  {
    sub_10001889C(&v18, v20);
    sub_1000047DC((uint64_t)v20, (uint64_t)&v18);
    if (swift_dynamicCast())
    {
      if (v10)
      {
        *uint64_t v10 = v16;
        v10[1] = v17;
        swift_bridgeObjectRetain();
      }
      uint64_t v14 = String.count.getter();
      swift_bridgeObjectRelease();
      sub_10000478C((uint64_t)v20);
      return v14 <= v11;
    }
    else
    {
      sub_10000478C((uint64_t)v20);
      return 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v18, &qword_10017C018);
  }
  return v8;
}

uint64_t sub_10011DE8C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5 + 16, v4);
}

uint64_t sub_10011DF30(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  unint64_t v7 = v6 + *(void *)(*(void *)(v4 - 8) + 64);
  uint64_t v8 = v2 + v6;
  char v9 = *(unsigned char *)(v2 + v7);
  uint64_t v10 = *(void **)((v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 8);
  uint64_t v11 = (uint64_t *)(v2 + (((v7 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)v11[1];
  uint64_t v17 = *v11;
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_1000036B0(a1, v13);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(&v20, v8, a2, v4, v5, v13, v14);
  if (v21)
  {
    sub_10001889C(&v20, v22);
    sub_1000047DC((uint64_t)v22, (uint64_t)&v20);
    if (swift_dynamicCast())
    {
      if (v10)
      {
        *uint64_t v10 = v18;
        v10[1] = v19;
        swift_bridgeObjectRetain();
      }
      v15._countAndFlagsBits = v17;
      v15._object = v12;
      char v9 = String.hasPrefix(_:)(v15);
      swift_bridgeObjectRelease();
      sub_10000478C((uint64_t)v22);
    }
    else
    {
      sub_10000478C((uint64_t)v22);
      char v9 = 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v20, &qword_10017C018);
  }
  return v9 & 1;
}

uint64_t sub_10011E0E0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5, v4);
}

BOOL sub_10011E178(void *a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80);
  unint64_t v4 = v3 + *(void *)(*(void *)(v2[2] - 8) + 64);
  return sub_10011BDAC(a1, a2, (uint64_t)v2 + v3, *((unsigned __int8 *)v2 + v4), *(uint64_t *)((char *)v2 + (v4 & 0xFFFFFFFFFFFFFFF8) + 8), *(uint64_t *)((char *)v2 + (((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(uint64_t *)((char *)v2 + (((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8), v2[2], v2[3], v2[4]);
}

uint64_t sub_10011E224()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5, v4);
}

BOOL sub_10011E2B4(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  unint64_t v7 = v6 + *(void *)(*(void *)(v4 - 8) + 64);
  uint64_t v8 = v2 + v6;
  uint64_t v9 = *(unsigned __int8 *)(v2 + v7);
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 8);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_1000036B0(a1, v11);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(&v15, v8, a2, v4, v5, v11, v12);
  if (v16)
  {
    sub_10001889C(&v15, v17);
    sub_1000047DC((uint64_t)v17, (uint64_t)&v15);
    if (swift_dynamicCast())
    {
      String.utf8CString.getter();
      swift_bridgeObjectRelease();
      uint64_t v13 = OSKextParseVersionString();
      swift_release();
      if (v10)
      {
        *(void *)uint64_t v10 = v13;
        *(unsigned char *)(v10 + 8) = 0;
      }
      sub_10000478C((uint64_t)v17);
      return v13 > 0;
    }
    else
    {
      sub_10000478C((uint64_t)v17);
      return 0;
    }
  }
  else
  {
    sub_1000130EC((uint64_t)&v15, &qword_10017C018);
  }
  return v9;
}

uint64_t sub_10011E45C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((v3 + *(void *)(v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_10011E4FC(void *a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80);
  return sub_10011C614(a1, a2, (uint64_t)v2 + v3, *((unsigned __int8 *)v2 + v3 + *(void *)(*(void *)(v2[2] - 8) + 64)), *(uint64_t *)((char *)v2 + ((v3 + *(void *)(*(void *)(v2[2] - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 8), *(uint64_t *)((char *)v2+ ((((v3 + *(void *)(*(void *)(v2[2] - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), v2[2], v2[3], v2[4]) & 1;
}

uint64_t sub_10011E59C()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

BOOL sub_10011E5D4(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  long long v10 = *(_OWORD *)(v1 + 24);
  sub_1000036B0(a1, v4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(_OWORD *)(v6 + 24) = v10;
  *(void *)(v6 + 40) = v3;
  unint64_t v7 = *(void (**)(BOOL (*)(), uint64_t, uint64_t, void, uint64_t, uint64_t))(v5 + 16);
  swift_retain();
  v7(sub_10011EB94, v6, v2, v10, v4, v5);
  swift_release();
  uint64_t v8 = Array.count.getter();
  swift_bridgeObjectRelease();
  return v8 == 0;
}

uint64_t sub_10011E6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 32);
  type metadata accessor for PropertyCheck();
  swift_bridgeObjectRetain();
  if (!Array.endIndex.getter()) {
    goto LABEL_11;
  }
  uint64_t v6 = 4;
  while (1)
  {
    uint64_t v7 = v6 - 4;
    Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
    Array._checkSubscript(_:wasNativeTypeChecked:)();
    if (!IsNativeType) {
      break;
    }
    uint64_t v9 = *(void *)(v5 + 8 * v6);
    swift_retain();
    uint64_t v10 = v6 - 3;
    if (__OFADD__(v7, 1)) {
      goto LABEL_10;
    }
LABEL_5:
    char v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 120))(a1, a2);
    swift_release();
    if ((v11 & 1) == 0)
    {
      ++v6;
      if (v10 != Array.endIndex.getter()) {
        continue;
      }
    }
    goto LABEL_12;
  }
  uint64_t v9 = _ArrayBuffer._getElementSlowPath(_:)();
  uint64_t v10 = v6 - 3;
  if (!__OFADD__(v7, 1)) {
    goto LABEL_5;
  }
LABEL_10:
  __break(1u);
LABEL_11:
  char v11 = 0;
LABEL_12:
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_10011E800(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 32);
  type metadata accessor for PropertyCheck();
  swift_bridgeObjectRetain();
  if (!Array.endIndex.getter()) {
    goto LABEL_11;
  }
  uint64_t v6 = 4;
  while (1)
  {
    uint64_t v7 = v6 - 4;
    Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
    Array._checkSubscript(_:wasNativeTypeChecked:)();
    if (!IsNativeType) {
      break;
    }
    uint64_t v9 = *(void *)(v5 + 8 * v6);
    swift_retain();
    uint64_t v10 = v6 - 3;
    if (__OFADD__(v7, 1)) {
      goto LABEL_10;
    }
LABEL_5:
    char v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 120))(a1, a2);
    swift_release();
    if (v11)
    {
      ++v6;
      if (v10 != Array.endIndex.getter()) {
        continue;
      }
    }
    goto LABEL_12;
  }
  uint64_t v9 = _ArrayBuffer._getElementSlowPath(_:)();
  uint64_t v10 = v6 - 3;
  if (!__OFADD__(v7, 1)) {
    goto LABEL_5;
  }
LABEL_10:
  __break(1u);
LABEL_11:
  char v11 = 1;
LABEL_12:
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_10011E934(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 32);
  type metadata accessor for PropertyCheck();
  swift_bridgeObjectRetain();
  int v6 = 0;
  if (!Array.endIndex.getter()) {
    goto LABEL_12;
  }
  uint64_t v7 = 4;
  while (1)
  {
    uint64_t v8 = v7 - 4;
    Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
    Array._checkSubscript(_:wasNativeTypeChecked:)();
    if (!IsNativeType) {
      break;
    }
    uint64_t v10 = *(void *)(v5 + 8 * v7);
    swift_retain();
    uint64_t v11 = v7 - 3;
    if (__OFADD__(v8, 1)) {
      goto LABEL_10;
    }
LABEL_5:
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 120))(a1, a2);
    swift_release();
    if (v12 & v6) {
      goto LABEL_11;
    }
    v6 |= v12;
    ++v7;
    if (v11 == Array.endIndex.getter()) {
      goto LABEL_12;
    }
  }
  uint64_t v10 = _ArrayBuffer._getElementSlowPath(_:)();
  uint64_t v11 = v7 - 3;
  if (!__OFADD__(v8, 1)) {
    goto LABEL_5;
  }
LABEL_10:
  __break(1u);
LABEL_11:
  LOBYTE(v6) = 0;
LABEL_12:
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_10011EA7C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10011EB04(void *a1, uint64_t a2)
{
  return sub_10011CFCC(a1, a2, v2+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80)), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10011EB44()
{
  return swift_initClassMetadata2();
}

BOOL sub_10011EB94()
{
  return ((*(uint64_t (**)(void))(v0 + 32))() & 1) == 0;
}

uint64_t sub_10011EBD8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10011EC10(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10011EC58())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10011ECAC()
{
  return swift_retain();
}

uint64_t sub_10011ECE4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 80) = a1;
  return swift_release();
}

uint64_t sub_10011ED2C()
{
  return swift_retain();
}

uint64_t sub_10011ED64(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 88) = a1;
  return swift_release();
}

uint64_t (*sub_10011EDAC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10011EE00()
{
  return swift_retain();
}

uint64_t sub_10011EE38(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 96) = a1;
  return swift_release();
}

uint64_t (*sub_10011EE80())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10011EED4()
{
  return swift_retain();
}

uint64_t sub_10011EF0C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 104) = a1;
  return swift_release();
}

uint64_t (*sub_10011EF54())()
{
  return j__swift_endAccess;
}

uint64_t sub_10011EFA8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10011EFE0(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 112) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10011F028(void *a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v4 = sub_1001227E4(a1, a2);

  return v4;
}

uint64_t sub_10011F080()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 184);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 176))(v3);
  if (result)
  {
    uint64_t v5 = type metadata accessor for DriverBinManager();
    sub_1000E94E0(v0, (uint64_t)&off_100173900, v5, (uint64_t)&off_10016B4F0);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10011F138()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 208);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 200))(v3);
  if (result)
  {
    uint64_t v5 = type metadata accessor for KernelStateManager();
    sub_1000E94E0(v0, (uint64_t)&off_100173900, v5, (uint64_t)&off_10016A358);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10011F1F0()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 232);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 224))(v3);
  if (result)
  {
    uint64_t v5 = type metadata accessor for ApprovalManager();
    sub_1000E94E0(v0, (uint64_t)&off_100173900, v5, (uint64_t)&off_10016EC40);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10011F2A8()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 256);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 248))(v3);
  if (result)
  {
    uint64_t v5 = type metadata accessor for ApplicationManager();
    sub_1000E94E0(v0, (uint64_t)&off_100173900, v5, (uint64_t)&off_10016A7D8);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10011F368()
{
  OS_dispatch_queue.sync<A>(execute:)();
  return v1;
}

uint64_t sub_10011F3C8()
{
  OS_dispatch_queue.sync<A>(execute:)();
  return v1;
}

uint64_t sub_10011F428@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  v263 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v282 = (char *)&v259 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v291 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v291 - 8);
  __chkstk_darwin(v291);
  v312 = (char *)&v259 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v310 = type metadata accessor for DriverBinEntry();
  uint64_t v300 = *(void *)(v310 - 8);
  uint64_t v8 = __chkstk_darwin(v310);
  uint64_t v313 = (uint64_t)&v259 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v314 = (uint64_t)&v259 - v10;
  uint64_t v11 = sub_100004700(&qword_10017BEF8);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  v306 = (char *)&v259 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v307 = (char *)&v259 - v15;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*a1 + 224))(v14);
  if (!v16) {
    goto LABEL_309;
  }
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 344))(v16);
  uint64_t v19 = v18;
  uint64_t v20 = swift_release();
  uint64_t v262 = (*(uint64_t (**)(uint64_t))(*a1 + 152))(v20);
  uint64_t v21 = ApprovalSettingsState.entries.getter(v17, v19);
  swift_bridgeObjectRelease();
  uint64_t v281 = *(void *)(v21 + 16);
  if (v281)
  {
    uint64_t v285 = v3;
    unint64_t v23 = 0;
    uint64_t v280 = v21 + 32;
    v304 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v305 = a1 + 2;
    v303 = (void (**)(char *, uint64_t))(v6 + 8);
    v283 = &v322;
    v278 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v277 = (void (**)(char *, uint64_t))(v4 + 8);
    unint64_t v264 = 0x8000000100150860;
    unint64_t v265 = (unint64_t)"";
    unint64_t v261 = 0x8000000100150790;
    unint64_t v268 = 0x8000000100150830;
    *(void *)&long long v22 = 136315394;
    long long v271 = v22;
    v270 = (char *)&type metadata for Any + 8;
    v260 = (void *)0x80000001001507C0;
    v266 = (void *)0x8000000100150810;
    unint64_t v267 = 0x80000001001507F0;
    v272 = _swiftEmptyArrayStorage;
    v289 = a1;
    uint64_t v24 = (uint64_t)v307;
    uint64_t v279 = v21;
    while (1)
    {
      if (v23 >= *(void *)(v21 + 16)) {
        goto LABEL_267;
      }
      unint64_t v296 = v23;
      uint64_t v25 = v280 + 40 * v23;
      uint64_t v26 = *(void *)v25;
      uint64_t v27 = *(void **)(v25 + 8);
      v308 = v27;
      uint64_t v309 = v26;
      uint64_t v29 = *(void *)(v25 + 16);
      unint64_t v28 = *(void *)(v25 + 24);
      int v290 = *(unsigned __int8 *)(v25 + 32);
      uint64_t v326 = 0;
      memset(v325, 0, sizeof(v325));
      uint64_t v30 = *a1;
      uint64_t v298 = v29;
      if (v28 >> 60 == 15)
      {
        uint64_t v31 = *(uint64_t (**)(uint64_t))(v30 + 200);
        swift_bridgeObjectRetain_n();
        uint64_t v32 = v29;
        unint64_t v33 = v28;
        uint64_t v34 = sub_10002F064(v32, v28);
        uint64_t v35 = v31(v34);
        if (!v35) {
          goto LABEL_293;
        }
        unint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 408))(v35);
        swift_release();
        swift_bridgeObjectRetain();
        uint64_t v37 = v294;
        unint64_t v38 = (unint64_t)sub_100122B68(v36, v309, (uint64_t)v27);
        uint64_t v39 = v37;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v38 >> 62)
        {
          uint64_t v234 = _CocoaArrayWrapper.endIndex.getter();
          uint64_t v41 = v285;
          if (v234 <= 1)
          {
            swift_bridgeObjectRetain();
            uint64_t v235 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (!v235) {
              goto LABEL_252;
            }
LABEL_13:
            if ((v38 & 0xC000000000000001) != 0)
            {
              uint64_t v42 = specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else
            {
              if (!*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_273;
              }
              uint64_t v42 = *(void *)(v38 + 32);
              swift_retain();
            }
            uint64_t v43 = swift_bridgeObjectRelease();
            (*(void (**)(long long *__return_ptr, uint64_t))(**(void **)(v42 + 24) + 112))(&v315, v43);
            if (*((void *)&v316 + 1))
            {
              swift_release();
              sub_1000130EC((uint64_t)v325, &qword_10017BC78);
              sub_10000372C(&v315, (uint64_t)&v321);
              uint64_t v44 = &v321;
              goto LABEL_201;
            }
            sub_1000130EC((uint64_t)&v315, &qword_10017BC78);
            *(void *)&long long v321 = 0;
            *((void *)&v321 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(35);
            swift_bridgeObjectRelease();
            *(void *)&long long v321 = 0xD000000000000021;
            *((void *)&v321 + 1) = v261;
            v186 = v308;
            v185._countAndFlagsBits = v309;
            v185._object = v308;
            String.append(_:)(v185);
            swift_bridgeObjectRelease();
            long long v187 = v321;
            sub_100012E3C();
            uint64_t v188 = swift_allocError();
            *(_OWORD *)uint64_t v189 = v187;
            *(_OWORD *)(v189 + 16) = 0u;
            *(_OWORD *)(v189 + 32) = 0u;
            *(_OWORD *)(v189 + 48) = 0u;
            *(void *)(v189 + 64) = 0;
            *(unsigned char *)(v189 + 72) = 10;
            uint64_t v311 = v188;
            swift_willThrow();
            swift_release();
            unint64_t v87 = v186;
            goto LABEL_255;
          }
        }
        else
        {
          unint64_t v40 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v41 = v285;
          if (v40 < 2)
          {
            if (v40) {
              goto LABEL_13;
            }
LABEL_252:
            swift_bridgeObjectRelease();
            *(void *)&long long v321 = 0;
            *((void *)&v321 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(46);
            swift_bridgeObjectRelease();
            *(void *)&long long v321 = 0xD00000000000002CLL;
            *((void *)&v321 + 1) = v264;
            unint64_t v87 = v308;
            v236._countAndFlagsBits = v309;
            v236._object = v308;
            String.append(_:)(v236);
            swift_bridgeObjectRelease();
            long long v237 = v321;
            sub_100012E3C();
            uint64_t v238 = swift_allocError();
            *(_OWORD *)uint64_t v239 = v237;
            *(_OWORD *)(v239 + 16) = 0u;
            *(_OWORD *)(v239 + 32) = 0u;
            *(_OWORD *)(v239 + 48) = 0u;
            *(void *)(v239 + 64) = 0;
            *(unsigned char *)(v239 + 72) = 10;
LABEL_254:
            uint64_t v311 = v238;
            swift_willThrow();
LABEL_255:
            sub_1000130EC((uint64_t)v325, &qword_10017BC78);
            uint64_t v294 = 0;
            uint64_t v177 = v298;
            goto LABEL_256;
          }
        }
        swift_bridgeObjectRelease();
        *(void *)&long long v321 = 0;
        *((void *)&v321 + 1) = 0xE000000000000000;
        _StringGuts.grow(_:)(41);
        swift_bridgeObjectRelease();
        *(void *)&long long v321 = 0xD000000000000027;
        *((void *)&v321 + 1) = v268;
        unint64_t v87 = v308;
        v240._countAndFlagsBits = v309;
        v240._object = v308;
        String.append(_:)(v240);
        swift_bridgeObjectRelease();
        long long v241 = v321;
        sub_100012E3C();
        uint64_t v238 = swift_allocError();
        *(_OWORD *)uint64_t v242 = v241;
        *(_OWORD *)(v242 + 16) = 0u;
        *(_OWORD *)(v242 + 32) = 0u;
        *(_OWORD *)(v242 + 48) = 0u;
        *(void *)(v242 + 64) = 0;
        *(unsigned char *)(v242 + 72) = 50;
        goto LABEL_254;
      }
      uint64_t v45 = *(uint64_t (**)(uint64_t))(v30 + 176);
      sub_10002F064(v29, v28);
      swift_bridgeObjectRetain_n();
      sub_10002F064(v29, v28);
      uint64_t v46 = sub_10002F064(v29, v28);
      uint64_t v47 = a1;
      uint64_t v48 = v45(v46);
      if (!v48) {
        goto LABEL_294;
      }
      uint64_t v49 = v29;
      uint64_t v50 = (*(uint64_t (**)(uint64_t))(*(void *)v48 + 360))(v48);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v51 = 0;
      uint64_t v52 = *(void *)(v50 + 64);
      uint64_t v295 = v50 + 64;
      uint64_t v302 = v50;
      uint64_t v53 = 1 << *(unsigned char *)(v50 + 32);
      unint64_t v54 = (unint64_t)(v53 + 63) >> 6;
      if (v53 < 64) {
        uint64_t v55 = ~(-1 << v53);
      }
      else {
        uint64_t v55 = -1;
      }
      unint64_t v56 = v55 & v52;
      unint64_t v299 = v28 >> 62;
      unint64_t v275 = HIDWORD(v49);
      BOOL v57 = __OFSUB__(HIDWORD(v49), v49);
      BOOL v288 = v57;
      uint64_t v286 = BYTE6(v28);
      uint64_t v287 = HIDWORD(v49) - (int)v49;
      unint64_t v292 = v28;
      uint64_t v284 = v28 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v276 = (int)v49;
      int64_t v297 = v54;
      unint64_t v273 = v54 - 1;
      uint64_t v274 = v49 >> 32;
      v301 = _swiftEmptyArrayStorage;
      uint64_t v58 = (uint64_t)v306;
      unint64_t v59 = v47;
      uint64_t v60 = v291;
      while (1)
      {
        if (v56)
        {
          uint64_t v62 = v60;
          uint64_t v63 = v59;
          unint64_t v64 = __clz(__rbit64(v56));
          v56 &= v56 - 1;
          uint64_t v311 = v51;
          unint64_t v65 = v64 | (v51 << 6);
          goto LABEL_31;
        }
        int64_t v71 = v51 + 1;
        if (__OFADD__(v51, 1))
        {
          __break(1u);
LABEL_267:
          __break(1u);
LABEL_268:
          __break(1u);
LABEL_269:
          __break(1u);
LABEL_270:
          __break(1u);
LABEL_271:
          __break(1u);
LABEL_272:
          __break(1u);
LABEL_273:
          __break(1u);
LABEL_274:
          __break(1u);
LABEL_275:
          __break(1u);
LABEL_276:
          __break(1u);
LABEL_277:
          __break(1u);
LABEL_278:
          __break(1u);
LABEL_279:
          __break(1u);
LABEL_280:
          __break(1u);
LABEL_281:
          __break(1u);
LABEL_282:
          __break(1u);
LABEL_283:
          __break(1u);
LABEL_284:
          __break(1u);
LABEL_285:
          __break(1u);
LABEL_286:
          __break(1u);
LABEL_287:
          __break(1u);
LABEL_288:
          __break(1u);
LABEL_289:
          __break(1u);
LABEL_290:
          __break(1u);
LABEL_291:
          __break(1u);
LABEL_292:
          __break(1u);
LABEL_293:
          __break(1u);
LABEL_294:
          __break(1u);
LABEL_295:
          __DataStorage._length.getter();
          __break(1u);
LABEL_296:
          __DataStorage._length.getter();
          __break(1u);
LABEL_297:
          __break(1u);
LABEL_298:
          __break(1u);
LABEL_299:
          __break(1u);
LABEL_300:
          __break(1u);
LABEL_301:
          __break(1u);
LABEL_302:
          __break(1u);
LABEL_303:
          __break(1u);
LABEL_304:
          __break(1u);
LABEL_305:
          __break(1u);
LABEL_306:
          __break(1u);
LABEL_307:
          __break(1u);
LABEL_308:
          __break(1u);
LABEL_309:
          __break(1u);
        }
        if (v71 >= v297)
        {
          uint64_t v311 = v51;
LABEL_38:
          uint64_t v63 = v59;
          goto LABEL_39;
        }
        unint64_t v72 = *(void *)(v295 + 8 * v71);
        if (v72)
        {
          uint64_t v63 = v59;
          goto LABEL_36;
        }
        if (v51 + 2 >= v297)
        {
          uint64_t v63 = v59;
          uint64_t v311 = v51 + 1;
          goto LABEL_39;
        }
        unint64_t v72 = *(void *)(v295 + 8 * (v51 + 2));
        if (v72)
        {
          uint64_t v63 = v59;
          int64_t v71 = v51 + 2;
          goto LABEL_36;
        }
        if (v51 + 3 >= v297)
        {
          uint64_t v311 = v51 + 2;
          goto LABEL_38;
        }
        unint64_t v72 = *(void *)(v295 + 8 * (v51 + 3));
        if (v72)
        {
          uint64_t v63 = v59;
          int64_t v71 = v51 + 3;
          goto LABEL_36;
        }
        uint64_t v63 = v59;
        uint64_t v166 = v51 + 4;
        if (v51 + 4 >= v297)
        {
          uint64_t v311 = v51 + 3;
        }
        else
        {
          unint64_t v72 = *(void *)(v295 + 8 * v166);
          if (v72)
          {
            int64_t v71 = v51 + 4;
LABEL_36:
            uint64_t v62 = v60;
            unint64_t v56 = (v72 - 1) & v72;
            unint64_t v65 = __clz(__rbit64(v72)) + (v71 << 6);
            uint64_t v311 = v71;
LABEL_31:
            uint64_t v66 = v302;
            uint64_t v67 = *(void *)(v302 + 48);
            uint64_t v68 = type metadata accessor for UUID();
            (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v68 - 8) + 16))(v58, v67 + *(void *)(*(void *)(v68 - 8) + 72) * v65, v68);
            uint64_t v69 = *(void *)(v66 + 56) + *(void *)(v300 + 72) * v65;
            uint64_t v70 = sub_100004700((uint64_t *)&unk_10017EBF0);
            sub_1000461D0(v69, v58 + *(int *)(v70 + 48), (uint64_t (*)(void))type metadata accessor for DriverBinEntry);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v58, 0, 1, v70);
            uint64_t v60 = v62;
            goto LABEL_40;
          }
          while (1)
          {
            int64_t v71 = v166 + 1;
            if (__OFADD__(v166, 1)) {
              goto LABEL_292;
            }
            if (v71 >= v297) {
              break;
            }
            unint64_t v72 = *(void *)(v295 + 8 * v71);
            ++v166;
            if (v72) {
              goto LABEL_36;
            }
          }
          uint64_t v311 = v273;
        }
LABEL_39:
        uint64_t v73 = sub_100004700((uint64_t *)&unk_10017EBF0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v58, 1, 1, v73);
        unint64_t v56 = 0;
LABEL_40:
        sub_1000460C0(v58, v24);
        uint64_t v74 = sub_100004700((uint64_t *)&unk_10017EBF0);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 48))(v24, 1, v74) == 1)
        {
          swift_release();
          unint64_t v167 = v301[2];
          if (v167 <= 1)
          {
            unint64_t v33 = v292;
            uint64_t v39 = v294;
            if (v167)
            {
              sub_10001BA68((uint64_t)(v301 + 4), (uint64_t)&v321, &qword_100180510);
            }
            else
            {
              uint64_t v324 = 0;
              long long v322 = 0u;
              long long v323 = 0u;
              long long v321 = 0u;
            }
            sub_10002404C(v298, v33);
            swift_bridgeObjectRelease();
            if (*((void *)&v323 + 1))
            {
              sub_1000130EC((uint64_t)v325, &qword_10017BC78);
              sub_100012A10(v321, *((unint64_t *)&v321 + 1));
              sub_10000372C(v283, (uint64_t)&v315);
              uint64_t v44 = &v315;
              goto LABEL_201;
            }
          }
          else
          {
            uint64_t v168 = swift_bridgeObjectRetain();
            uint64_t v169 = v294;
            v170 = sub_100122E44(v168, (uint64_t (*)(void, void, _OWORD *))sub_100122B60);
            uint64_t v39 = v169;
            swift_bridgeObjectRelease();
            unint64_t v33 = v292;
            if (v170[2])
            {
              sub_10001BA68((uint64_t)(v170 + 4), (uint64_t)&v315, &qword_100180510);
            }
            else
            {
              uint64_t v318 = 0;
              long long v316 = 0u;
              long long v317 = 0u;
              long long v315 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v317 + 1))
            {
              sub_10002404C(v298, v33);
              swift_bridgeObjectRelease();
              long long v321 = v315;
              long long v322 = v316;
              long long v323 = v317;
              uint64_t v324 = v318;
              if (!*((void *)&v317 + 1)) {
                goto LABEL_202;
              }
LABEL_200:
              sub_1000130EC((uint64_t)v325, &qword_10017BC78);
              sub_100012A10(v321, *((unint64_t *)&v321 + 1));
              sub_10000372C(v283, (uint64_t)&v319);
              uint64_t v44 = &v319;
LABEL_201:
              sub_10000372C(v44, (uint64_t)v325);
LABEL_203:
              sub_10001BA68((uint64_t)v325, (uint64_t)&v315, &qword_10017BC78);
              if (!*((void *)&v316 + 1))
              {
                sub_1000130EC((uint64_t)&v315, &qword_10017BC78);
                *(void *)&long long v321 = 0;
                *((void *)&v321 + 1) = 0xE000000000000000;
                _StringGuts.grow(_:)(35);
                swift_bridgeObjectRelease();
                *(void *)&long long v321 = 0xD000000000000021;
                *((void *)&v321 + 1) = v265 | 0x8000000000000000;
                unint64_t v87 = v308;
                v200._countAndFlagsBits = v309;
                v200._object = v308;
                String.append(_:)(v200);
                swift_bridgeObjectRelease();
                long long v201 = v321;
                sub_100012E3C();
                uint64_t v202 = swift_allocError();
                *(_OWORD *)uint64_t v203 = v201;
                *(_OWORD *)(v203 + 16) = 0u;
                *(_OWORD *)(v203 + 32) = 0u;
                *(_OWORD *)(v203 + 48) = 0u;
                *(void *)(v203 + 64) = 0;
                *(unsigned char *)(v203 + 72) = 10;
                uint64_t v311 = v202;
                swift_willThrow();
                uint64_t v177 = v298;
                sub_10002404C(v298, v33);
                sub_1000130EC((uint64_t)v325, &qword_10017BC78);
                goto LABEL_210;
              }
              sub_10000372C(&v315, (uint64_t)&v321);
              uint64_t v190 = *((void *)&v322 + 1);
              uint64_t v191 = v323;
              sub_1000036B0(&v321, *((uint64_t *)&v322 + 1));
              uint64_t v192 = (*(uint64_t (**)(uint64_t, uint64_t))(v191 + 40))(v190, v191);
              if (!v192)
              {
                uint64_t v193 = *((void *)&v322 + 1);
                uint64_t v194 = v323;
                sub_1000036B0(&v321, *((uint64_t *)&v322 + 1));
                uint64_t v192 = (*(uint64_t (**)(uint64_t, uint64_t))(v194 + 32))(v193, v194);
                if (!v192)
                {
                  *(void *)&long long v315 = 0;
                  *((void *)&v315 + 1) = 0xE000000000000000;
                  _StringGuts.grow(_:)(50);
                  v228._countAndFlagsBits = 0xD00000000000002ALL;
                  v228._object = v260;
                  String.append(_:)(v228);
                  unint64_t v87 = v308;
                  v229._countAndFlagsBits = v309;
                  v229._object = v308;
                  String.append(_:)(v229);
                  swift_bridgeObjectRelease();
                  v230._countAndFlagsBits = 544497952;
                  v230._object = (void *)0xE400000000000000;
                  String.append(_:)(v230);
                  sub_1000036B0(&v321, *((uint64_t *)&v322 + 1));
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  long long v231 = v315;
                  sub_100012E3C();
                  uint64_t v232 = swift_allocError();
                  *(_OWORD *)uint64_t v233 = v231;
                  *(_OWORD *)(v233 + 16) = 0u;
                  *(_OWORD *)(v233 + 32) = 0u;
                  *(_OWORD *)(v233 + 48) = 0u;
                  *(void *)(v233 + 64) = 0;
                  *(unsigned char *)(v233 + 72) = 10;
                  uint64_t v311 = v232;
                  swift_willThrow();
                  uint64_t v177 = v298;
                  sub_10002404C(v298, v33);
                  sub_1000130EC((uint64_t)v325, &qword_10017BC78);
                  sub_10000478C((uint64_t)&v321);
                  goto LABEL_210;
                }
              }
              v195 = (uint64_t *)sub_1000A12EC();
              if (*(void *)(v192 + 16))
              {
                uint64_t v196 = *v195;
                uint64_t v197 = v195[1];
                swift_bridgeObjectRetain();
                uint64_t v198 = sub_100122584(v196, v197, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100004958);
                if (v199)
                {
                  sub_1000047DC(*(void *)(v192 + 56) + 32 * v198, (uint64_t)&v315);
                }
                else
                {
                  long long v315 = 0u;
                  long long v316 = 0u;
                }
                swift_bridgeObjectRelease();
                if (*((void *)&v316 + 1))
                {
                  if (swift_dynamicCast())
                  {
                    uint64_t v204 = *((void *)&v319 + 1);
                    uint64_t v205 = v319;
                    goto LABEL_230;
                  }
LABEL_217:
                  v206 = sub_1000A1310();
                  if (*(void *)(v192 + 16))
                  {
                    uint64_t v207 = *v206;
                    uint64_t v208 = v206[1];
                    swift_bridgeObjectRetain();
                    uint64_t v209 = sub_100122584(v207, v208, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100004958);
                    if (v210)
                    {
                      sub_1000047DC(*(void *)(v192 + 56) + 32 * v209, (uint64_t)&v315);
                    }
                    else
                    {
                      long long v315 = 0u;
                      long long v316 = 0u;
                    }
                    swift_bridgeObjectRelease();
                    if (*((void *)&v316 + 1))
                    {
                      int v211 = swift_dynamicCast();
                      if (v211) {
                        uint64_t v204 = *((void *)&v319 + 1);
                      }
                      else {
                        uint64_t v204 = 0;
                      }
                      if (v211) {
                        uint64_t v205 = v319;
                      }
                      else {
                        uint64_t v205 = 0;
                      }
LABEL_230:
                      v212 = (uint64_t *)sub_1000A135C();
                      if (*(void *)(v192 + 16))
                      {
                        uint64_t v213 = *v212;
                        uint64_t v214 = v212[1];
                        swift_bridgeObjectRetain();
                        uint64_t v215 = sub_100122584(v213, v214, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100004958);
                        if (v216)
                        {
                          sub_1000047DC(*(void *)(v192 + 56) + 32 * v215, (uint64_t)&v315);
                        }
                        else
                        {
                          long long v315 = 0u;
                          long long v316 = 0u;
                        }
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        long long v315 = 0u;
                        long long v316 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      uint64_t v294 = v39;
                      if (*((void *)&v316 + 1))
                      {
                        int v217 = swift_dynamicCast();
                        if (v217) {
                          uint64_t v218 = v319;
                        }
                        else {
                          uint64_t v218 = 0;
                        }
                        if (v217) {
                          uint64_t v219 = *((void *)&v319 + 1);
                        }
                        else {
                          uint64_t v219 = 0;
                        }
                      }
                      else
                      {
                        sub_1000130EC((uint64_t)&v315, &qword_10017C018);
                        uint64_t v218 = 0;
                        uint64_t v219 = 0;
                      }
                      uint64_t v220 = v298;
                      sub_10002F064(v298, v33);
                      sub_10006F308(v309, (uint64_t)v308, v205, v204, v218, v219, v220, v33, (uint64_t)v327, v290);
                      if (swift_isUniquelyReferenced_nonNull_native())
                      {
                        uint64_t v24 = (uint64_t)v307;
                        v221 = v272;
                      }
                      else
                      {
                        v221 = sub_100122330(0, v272[2] + 1, 1, v272);
                        uint64_t v24 = (uint64_t)v307;
                      }
                      unint64_t v223 = v221[2];
                      unint64_t v222 = v221[3];
                      if (v223 >= v222 >> 1) {
                        v221 = sub_100122330((void *)(v222 > 1), v223 + 1, 1, v221);
                      }
                      v221[2] = v223 + 1;
                      v272 = v221;
                      v224 = &v221[9 * v223];
                      *((_OWORD *)v224 + 2) = v327[0];
                      long long v225 = v327[1];
                      long long v226 = v327[2];
                      long long v227 = v327[3];
                      *((unsigned char *)v224 + 96) = v328;
                      *((_OWORD *)v224 + 4) = v226;
                      *((_OWORD *)v224 + 5) = v227;
                      *((_OWORD *)v224 + 3) = v225;
                      sub_10002404C(v220, v33);
                      swift_bridgeObjectRelease();
                      sub_10002404C(v220, v33);
                      sub_1000130EC((uint64_t)v325, &qword_10017BC78);
                      sub_10000478C((uint64_t)&v321);
                      goto LABEL_6;
                    }
                  }
                  else
                  {
                    long long v315 = 0u;
                    long long v316 = 0u;
                  }
                  sub_1000130EC((uint64_t)&v315, &qword_10017C018);
                  uint64_t v204 = 0;
                  uint64_t v205 = 0;
                  goto LABEL_230;
                }
              }
              else
              {
                long long v315 = 0u;
                long long v316 = 0u;
              }
              sub_1000130EC((uint64_t)&v315, &qword_10017C018);
              goto LABEL_217;
            }
            if (v301[2])
            {
              sub_10001BA68((uint64_t)(v301 + 4), (uint64_t)&v321, &qword_100180510);
            }
            else
            {
              uint64_t v324 = 0;
              long long v322 = 0u;
              long long v323 = 0u;
              long long v321 = 0u;
            }
            sub_10002404C(v298, v33);
            swift_bridgeObjectRelease();
            sub_1000130EC((uint64_t)&v315, &qword_100180518);
            if (*((void *)&v323 + 1)) {
              goto LABEL_200;
            }
          }
LABEL_202:
          sub_1000130EC((uint64_t)&v321, &qword_100180518);
          goto LABEL_203;
        }
        uint64_t v75 = v24 + *(int *)(v74 + 48);
        uint64_t v76 = v314;
        sub_1000A979C(v75, v314);
        char v77 = v312;
        uint64_t v78 = v60;
        (*v304)(v312, v76 + *(int *)(v310 + 28), v60);
        unint64_t v59 = v63;
        uint64_t v79 = v63[5];
        uint64_t v80 = v63[6];
        sub_1000036B0(v305, v79);
        sub_1000B07CC(v79, v80);
        uint64_t v81 = *((void *)&v322 + 1);
        uint64_t v82 = v323;
        sub_1000036B0(&v321, *((uint64_t *)&v322 + 1));
        (*(void (**)(long long *__return_ptr, char *, uint64_t, uint64_t))(v82 + 24))(&v319, v77, v81, v82);
        if (!v320)
        {
          v171 = v308;
          swift_bridgeObjectRelease();
          sub_1000130EC((uint64_t)&v319, &qword_10017BC78);
          sub_10000478C((uint64_t)&v321);
          *(void *)&long long v321 = 0;
          *((void *)&v321 + 1) = 0xE000000000000000;
          _StringGuts.grow(_:)(27);
          swift_bridgeObjectRelease();
          *(void *)&long long v321 = 0xD000000000000019;
          *((void *)&v321 + 1) = v267;
          v172 = v312;
          v173._countAndFlagsBits = URL.path.getter();
          String.append(_:)(v173);
          swift_bridgeObjectRelease();
          long long v174 = v321;
          sub_100012E3C();
          uint64_t v175 = swift_allocError();
          *(_OWORD *)uint64_t v176 = v174;
          *(_OWORD *)(v176 + 16) = 0u;
          *(_OWORD *)(v176 + 32) = 0u;
          *(_OWORD *)(v176 + 48) = 0u;
          *(void *)(v176 + 64) = 0;
          *(unsigned char *)(v176 + 72) = 19;
          uint64_t v311 = v175;
          swift_willThrow();
          uint64_t v177 = v298;
          unint64_t v33 = v292;
          sub_10002404C(v298, v292);
          sub_10002404C(v177, v33);
          (*v303)(v172, v78);
          sub_100122FB8(v314);
          swift_bridgeObjectRelease();
          swift_release();
          unint64_t v87 = v171;
          sub_1000130EC((uint64_t)v325, &qword_10017BC78);
          goto LABEL_185;
        }
        sub_10000372C(&v319, (uint64_t)&v315);
        sub_10000478C((uint64_t)&v321);
        uint64_t v83 = *((void *)&v316 + 1);
        uint64_t v84 = v317;
        sub_1000036B0(&v315, *((uint64_t *)&v316 + 1));
        uint64_t v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 24))(v83, v84);
        unint64_t v87 = v308;
        if (!v86) {
          break;
        }
        if (v85 == v309 && v86 == v308)
        {
          swift_bridgeObjectRelease();
          sub_1000461D0(v314, v313, (uint64_t (*)(void))type metadata accessor for DriverBinEntry);
        }
        else
        {
          char v88 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          sub_1000461D0(v314, v313, (uint64_t (*)(void))type metadata accessor for DriverBinEntry);
          if ((v88 & 1) == 0)
          {
LABEL_27:
            sub_100122FB8(v313);
            uint64_t v58 = (uint64_t)v306;
            uint64_t v24 = (uint64_t)v307;
            goto LABEL_28;
          }
        }
        uint64_t v89 = v313 + *(int *)(v310 + 20);
        uint64_t v90 = type metadata accessor for ApplicationRecord(0);
        uint64_t v91 = (uint64_t *)(v89 + *(int *)(v90 + 28));
        uint64_t v93 = *v91;
        unint64_t v92 = v91[1];
        uint64_t v94 = v90;
        uint64_t v95 = 0;
        switch((int)v299)
        {
          case 1:
            uint64_t v95 = v287;
            if (v288) {
              goto LABEL_268;
            }
            break;
          case 2:
            uint64_t v97 = *(void *)(v298 + 16);
            uint64_t v96 = *(void *)(v298 + 24);
            BOOL v98 = __OFSUB__(v96, v97);
            uint64_t v95 = v96 - v97;
            if (!v98) {
              break;
            }
            goto LABEL_269;
          case 3:
            break;
          default:
            uint64_t v95 = v286;
            break;
        }
        unint64_t v99 = v92 >> 62;
        switch(v92 >> 62)
        {
          case 1uLL:
            LODWORD(v100) = HIDWORD(v93) - v93;
            if (__OFSUB__(HIDWORD(v93), v93)) {
              goto LABEL_270;
            }
            uint64_t v100 = (int)v100;
LABEL_57:
            if (v95 != v100) {
              goto LABEL_27;
            }
            if (v95 >= 1)
            {
              switch((int)v299)
              {
                case 1:
                  if (v274 < v276) {
                    goto LABEL_272;
                  }
                  uint64_t v293 = v90;
                  sub_10002F064(v298, v292);
                  uint64_t v119 = __DataStorage._bytes.getter();
                  if (v119)
                  {
                    uint64_t v120 = v119;
                    uint64_t v121 = __DataStorage._offset.getter();
                    if (__OFSUB__(v276, v121)) {
                      goto LABEL_275;
                    }
                    v269 = (const void *)(v120 + v276 - v121);
                  }
                  else
                  {
                    v269 = 0;
                  }
                  uint64_t v78 = v291;
                  uint64_t v94 = v293;
                  __DataStorage._length.getter();
                  if (v99)
                  {
                    if (v99 != 1)
                    {
                      uint64_t v159 = *(void *)(v93 + 16);
                      uint64_t v160 = *(void *)(v93 + 24);
                      swift_retain();
                      swift_retain();
                      v161 = (char *)__DataStorage._bytes.getter();
                      if (v161)
                      {
                        uint64_t v162 = __DataStorage._offset.getter();
                        if (__OFSUB__(v159, v162)) {
                          goto LABEL_290;
                        }
                        v161 += v159 - v162;
                      }
                      BOOL v98 = __OFSUB__(v160, v159);
                      int64_t v163 = v160 - v159;
                      if (v98) {
                        goto LABEL_285;
                      }
                      uint64_t v164 = __DataStorage._length.getter();
                      if (v164 >= v163) {
                        size_t v165 = v163;
                      }
                      else {
                        size_t v165 = v164;
                      }
                      if (!v269) {
                        goto LABEL_307;
                      }
                      uint64_t v78 = v291;
                      uint64_t v58 = (uint64_t)v306;
                      uint64_t v94 = v293;
                      if (!v161) {
                        goto LABEL_308;
                      }
                      int v158 = memcmp(v269, v161, v165);
                      swift_release();
                      swift_release();
                      sub_10002404C(v298, v292);
                      goto LABEL_165;
                    }
                    if (v93 >> 32 < (int)v93) {
                      goto LABEL_284;
                    }
                    swift_retain();
                    v136 = (char *)__DataStorage._bytes.getter();
                    if (v136)
                    {
                      uint64_t v137 = __DataStorage._offset.getter();
                      if (__OFSUB__((int)v93, v137)) {
                        goto LABEL_291;
                      }
                      v136 += (int)v93 - v137;
                    }
                    uint64_t v138 = __DataStorage._length.getter();
                    if (v138 >= (v93 >> 32) - (int)v93) {
                      size_t v139 = (v93 >> 32) - (int)v93;
                    }
                    else {
                      size_t v139 = v138;
                    }
                    unint64_t v59 = v289;
                    if (!v269) {
                      goto LABEL_299;
                    }
                    uint64_t v78 = v291;
                    uint64_t v94 = v293;
                    if (!v136) {
                      goto LABEL_300;
                    }
                    int v131 = memcmp(v269, v136, v139);
                    sub_100012A10(v93, v92);
                  }
                  else
                  {
                    *(void *)&long long v321 = v93;
                    WORD4(v321) = v92;
                    BYTE10(v321) = BYTE2(v92);
                    BYTE11(v321) = BYTE3(v92);
                    BYTE12(v321) = BYTE4(v92);
                    BYTE13(v321) = BYTE5(v92);
                    if (!v269) {
                      goto LABEL_306;
                    }
                    int v131 = memcmp(v269, &v321, BYTE6(v92));
                  }
                  sub_10002404C(v298, v292);
LABEL_153:
                  sub_100122FB8(v313);
                  uint64_t v58 = (uint64_t)v306;
                  uint64_t v24 = (uint64_t)v307;
                  if (v131) {
                    goto LABEL_28;
                  }
                  goto LABEL_68;
                case 2:
                  uint64_t v293 = v90;
                  uint64_t v122 = *(void *)(v298 + 16);
                  swift_retain();
                  swift_retain();
                  uint64_t v123 = __DataStorage._bytes.getter();
                  if (v123)
                  {
                    uint64_t v124 = v123;
                    uint64_t v125 = __DataStorage._offset.getter();
                    if (__OFSUB__(v122, v125)) {
                      goto LABEL_274;
                    }
                    v269 = (const void *)(v124 + v122 - v125);
                  }
                  else
                  {
                    v269 = 0;
                  }
                  __DataStorage._length.getter();
                  unint64_t v59 = v289;
                  uint64_t v78 = v291;
                  uint64_t v94 = v293;
                  if (!v99)
                  {
                    *(void *)&long long v321 = v93;
                    WORD4(v321) = v92;
                    BYTE10(v321) = BYTE2(v92);
                    BYTE11(v321) = BYTE3(v92);
                    BYTE12(v321) = BYTE4(v92);
                    BYTE13(v321) = BYTE5(v92);
                    if (!v269) {
                      goto LABEL_303;
                    }
                    int v131 = memcmp(v269, &v321, BYTE6(v92));
LABEL_139:
                    swift_release();
                    swift_release();
                    goto LABEL_153;
                  }
                  if (v99 == 1)
                  {
                    if (v93 >> 32 < (int)v93) {
                      goto LABEL_278;
                    }
                    swift_retain();
                    v132 = (char *)__DataStorage._bytes.getter();
                    if (v132)
                    {
                      uint64_t v133 = __DataStorage._offset.getter();
                      if (__OFSUB__((int)v93, v133)) {
                        goto LABEL_289;
                      }
                      v132 += (int)v93 - v133;
                    }
                    uint64_t v134 = __DataStorage._length.getter();
                    if (v134 >= (v93 >> 32) - (int)v93) {
                      size_t v135 = (v93 >> 32) - (int)v93;
                    }
                    else {
                      size_t v135 = v134;
                    }
                    unint64_t v59 = v289;
                    if (!v269) {
                      goto LABEL_297;
                    }
                    uint64_t v78 = v291;
                    uint64_t v94 = v293;
                    if (!v132) {
                      goto LABEL_298;
                    }
                    int v131 = memcmp(v269, v132, v135);
                    sub_100012A10(v93, v92);
                    goto LABEL_139;
                  }
                  uint64_t v151 = *(void *)(v93 + 16);
                  uint64_t v152 = *(void *)(v93 + 24);
                  swift_retain();
                  swift_retain();
                  v153 = (char *)__DataStorage._bytes.getter();
                  if (v153)
                  {
                    uint64_t v154 = __DataStorage._offset.getter();
                    if (__OFSUB__(v151, v154)) {
                      goto LABEL_288;
                    }
                    v153 += v151 - v154;
                  }
                  BOOL v98 = __OFSUB__(v152, v151);
                  int64_t v155 = v152 - v151;
                  if (v98) {
                    goto LABEL_283;
                  }
                  uint64_t v156 = __DataStorage._length.getter();
                  if (v156 >= v155) {
                    size_t v157 = v155;
                  }
                  else {
                    size_t v157 = v156;
                  }
                  if (!v269) {
                    goto LABEL_304;
                  }
                  uint64_t v78 = v291;
                  uint64_t v58 = (uint64_t)v306;
                  uint64_t v94 = v293;
                  if (!v153) {
                    goto LABEL_305;
                  }
                  int v158 = memcmp(v269, v153, v157);
                  swift_release();
                  swift_release();
                  swift_release();
                  swift_release();
LABEL_165:
                  sub_100122FB8(v313);
                  uint64_t v24 = (uint64_t)v307;
                  if (!v158) {
                    goto LABEL_68;
                  }
                  goto LABEL_28;
                case 3:
                  *(void *)((char *)&v321 + 6) = 0;
                  *(void *)&long long v321 = 0;
                  if (!v99) {
                    goto LABEL_94;
                  }
                  uint64_t v293 = v90;
                  if (v99 == 1)
                  {
                    uint64_t v103 = (v93 >> 32) - (int)v93;
                    if (v93 >> 32 < (int)v93) {
                      goto LABEL_277;
                    }
                    swift_retain();
                    uint64_t v126 = __DataStorage._bytes.getter();
                    if (!v126) {
                      goto LABEL_296;
                    }
                    uint64_t v105 = v126;
                    uint64_t v127 = __DataStorage._offset.getter();
                    uint64_t v107 = (int)v93 - v127;
                    if (__OFSUB__((int)v93, v127)) {
                      goto LABEL_282;
                    }
LABEL_88:
                    uint64_t v128 = __DataStorage._length.getter();
                    if (v128 >= v103) {
                      size_t v129 = v103;
                    }
                    else {
                      size_t v129 = v128;
                    }
                    int v130 = memcmp(&v321, (const void *)(v105 + v107), v129);
                    sub_100012A10(v93, v92);
                    sub_100122FB8(v313);
                    unint64_t v59 = v289;
                    uint64_t v78 = v291;
                    uint64_t v58 = (uint64_t)v306;
                    uint64_t v24 = (uint64_t)v307;
                    uint64_t v94 = v293;
                    if (v130) {
                      goto LABEL_28;
                    }
                  }
                  else
                  {
                    uint64_t v146 = *(void *)(v93 + 16);
                    uint64_t v147 = *(void *)(v93 + 24);
                    swift_retain();
                    swift_retain();
                    v142 = (char *)__DataStorage._bytes.getter();
                    if (v142)
                    {
                      uint64_t v148 = __DataStorage._offset.getter();
                      if (__OFSUB__(v146, v148)) {
                        goto LABEL_287;
                      }
                      v142 += v146 - v148;
                    }
                    BOOL v98 = __OFSUB__(v147, v146);
                    int64_t v144 = v147 - v146;
                    if (v98) {
                      goto LABEL_280;
                    }
                    uint64_t v145 = __DataStorage._length.getter();
                    if (!v142) {
                      goto LABEL_302;
                    }
LABEL_132:
                    if (v145 >= v144) {
                      size_t v149 = v144;
                    }
                    else {
                      size_t v149 = v145;
                    }
                    int v150 = memcmp(&v321, v142, v149);
                    swift_release();
                    swift_release();
                    sub_100122FB8(v313);
                    uint64_t v78 = v291;
                    uint64_t v58 = (uint64_t)v306;
                    uint64_t v24 = (uint64_t)v307;
                    uint64_t v94 = v293;
                    if (v150) {
                      goto LABEL_28;
                    }
                  }
                  goto LABEL_68;
                default:
                  LODWORD(v321) = v298;
                  BYTE4(v321) = v275;
                  *(_WORD *)((char *)&v321 + 5) = *(_WORD *)((char *)&v298 + 5);
                  BYTE7(v321) = HIBYTE(v298);
                  DWORD2(v321) = v292;
                  WORD6(v321) = WORD2(v292);
                  if (!v99)
                  {
LABEL_94:
                    *(void *)&long long v319 = v93;
                    WORD4(v319) = v92;
                    BYTE10(v319) = BYTE2(v92);
                    BYTE11(v319) = BYTE3(v92);
                    BYTE12(v319) = BYTE4(v92);
                    BYTE13(v319) = BYTE5(v92);
                    int v131 = memcmp(&v321, &v319, BYTE6(v92));
                    goto LABEL_153;
                  }
                  uint64_t v293 = v90;
                  if (v99 == 1)
                  {
                    uint64_t v103 = (v93 >> 32) - (int)v93;
                    if (v93 >> 32 < (int)v93) {
                      goto LABEL_276;
                    }
                    swift_retain();
                    uint64_t v104 = __DataStorage._bytes.getter();
                    if (!v104) {
                      goto LABEL_295;
                    }
                    uint64_t v105 = v104;
                    uint64_t v106 = __DataStorage._offset.getter();
                    uint64_t v107 = (int)v93 - v106;
                    if (__OFSUB__((int)v93, v106)) {
                      goto LABEL_281;
                    }
                    goto LABEL_88;
                  }
                  uint64_t v140 = *(void *)(v93 + 16);
                  uint64_t v141 = *(void *)(v93 + 24);
                  swift_retain();
                  swift_retain();
                  v142 = (char *)__DataStorage._bytes.getter();
                  if (v142)
                  {
                    uint64_t v143 = __DataStorage._offset.getter();
                    if (__OFSUB__(v140, v143)) {
                      goto LABEL_286;
                    }
                    v142 += v140 - v143;
                  }
                  BOOL v98 = __OFSUB__(v141, v140);
                  int64_t v144 = v141 - v140;
                  if (v98) {
                    goto LABEL_279;
                  }
                  uint64_t v145 = __DataStorage._length.getter();
                  if (!v142) {
                    goto LABEL_301;
                  }
                  goto LABEL_132;
              }
            }
LABEL_67:
            sub_100122FB8(v313);
            uint64_t v58 = (uint64_t)v306;
            uint64_t v24 = (uint64_t)v307;
LABEL_68:
            uint64_t v108 = (void *)(v314 + *(int *)(v310 + 20) + *(int *)(v94 + 32));
            unint64_t v110 = v108[1];
            *(void *)&long long v321 = *v108;
            uint64_t v109 = v321;
            *((void *)&v321 + 1) = v110;
            sub_10000469C((uint64_t)&v315, (uint64_t)v283);
            sub_100012DE4(v109, v110);
            Swift::String v111 = v301;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              Swift::String v111 = sub_100122458(0, v111[2] + 1, 1, v111);
            }
            unint64_t v113 = v111[2];
            unint64_t v112 = v111[3];
            v301 = v111;
            if (v113 >= v112 >> 1) {
              v301 = sub_100122458((void *)(v112 > 1), v113 + 1, 1, v301);
            }
            unint64_t v114 = v301;
            v301[2] = v113 + 1;
            v115 = &v114[7 * v113];
            long long v116 = v321;
            long long v117 = v322;
            long long v118 = v323;
            v115[10] = v324;
            *((_OWORD *)v115 + 3) = v117;
            *((_OWORD *)v115 + 4) = v118;
            *((_OWORD *)v115 + 2) = v116;
            break;
          case 2uLL:
            uint64_t v102 = *(void *)(v93 + 16);
            uint64_t v101 = *(void *)(v93 + 24);
            BOOL v98 = __OFSUB__(v101, v102);
            uint64_t v100 = v101 - v102;
            if (!v98) {
              goto LABEL_57;
            }
            goto LABEL_271;
          case 3uLL:
            if (v95) {
              goto LABEL_27;
            }
            goto LABEL_67;
          default:
            uint64_t v100 = BYTE6(v92);
            goto LABEL_57;
        }
LABEL_28:
        uint64_t v60 = v78;
        (*v303)(v312, v78);
        sub_100122FB8(v314);
        sub_10000478C((uint64_t)&v315);
        uint64_t v61 = type metadata accessor for UUID();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 8))(v24, v61);
        uint64_t v51 = v311;
      }
      swift_bridgeObjectRelease();
      *(void *)&long long v321 = 0;
      *((void *)&v321 + 1) = 0xE000000000000000;
      _StringGuts.grow(_:)(30);
      swift_bridgeObjectRelease();
      *(void *)&long long v321 = 0x6120656C646E7542;
      *((void *)&v321 + 1) = 0xEA00000000002074;
      v178 = v312;
      v179._countAndFlagsBits = URL.path.getter();
      String.append(_:)(v179);
      swift_bridgeObjectRelease();
      v180._countAndFlagsBits = 0xD000000000000012;
      v180._object = v266;
      String.append(_:)(v180);
      long long v181 = v321;
      sub_100012E3C();
      uint64_t v182 = swift_allocError();
      *(_OWORD *)uint64_t v183 = v181;
      *(_OWORD *)(v183 + 16) = 0u;
      *(_OWORD *)(v183 + 32) = 0u;
      *(_OWORD *)(v183 + 48) = 0u;
      *(void *)(v183 + 64) = 0;
      *(unsigned char *)(v183 + 72) = 50;
      uint64_t v311 = v182;
      swift_willThrow();
      uint64_t v177 = v298;
      unint64_t v33 = v292;
      sub_10002404C(v298, v292);
      sub_10002404C(v177, v33);
      (*v303)(v178, v78);
      sub_100122FB8(v314);
      swift_bridgeObjectRelease();
      swift_release();
      sub_1000130EC((uint64_t)v325, &qword_10017BC78);
      sub_10000478C((uint64_t)&v315);
LABEL_185:
      uint64_t v184 = type metadata accessor for UUID();
      (*(void (**)(char *, uint64_t))(*(void *)(v184 - 8) + 8))(v307, v184);
LABEL_210:
      uint64_t v294 = 0;
      uint64_t v41 = v285;
LABEL_256:
      uint64_t v243 = sub_1000EFEF8();
      v244 = v282;
      (*v278)(v282, v243, v41);
      swift_bridgeObjectRetain();
      sub_10002F064(v177, v33);
      swift_errorRetain();
      v245 = v87;
      swift_bridgeObjectRetain();
      sub_10002F064(v177, v33);
      swift_errorRetain();
      v246 = Logger.logObject.getter();
      os_log_type_t v247 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v246, v247))
      {
        uint64_t v248 = swift_slowAlloc();
        v308 = (void *)swift_slowAlloc();
        *(void *)&long long v315 = v308;
        *(_DWORD *)uint64_t v248 = v271;
        *(void *)&long long v321 = v309;
        *((void *)&v321 + 1) = v245;
        *(void *)&long long v322 = v177;
        *((void *)&v322 + 1) = v33;
        LOBYTE(v323) = v290;
        sub_100122B0C();
        uint64_t v249 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v248 + 4) = sub_100003F90(v249, v250, (uint64_t *)&v315);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10002404C(v177, v33);
        swift_bridgeObjectRelease();
        sub_10002404C(v177, v33);
        *(_WORD *)(v248 + 12) = 2080;
        *(void *)&long long v321 = v311;
        swift_errorRetain();
        sub_100004700(&qword_10017EB50);
        uint64_t v251 = String.init<A>(describing:)();
        *(void *)(v248 + 14) = sub_100003F90(v251, v252, (uint64_t *)&v315);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v246, v247, "Failed to use entry %s: %s", (uint8_t *)v248, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        swift_bridgeObjectRelease();
        sub_10002404C(v177, v33);
        (*v277)(v282, v285);
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_10002404C(v177, v33);
        swift_errorRelease();
        swift_bridgeObjectRelease();
        sub_10002404C(v177, v33);
        swift_bridgeObjectRelease();
        sub_10002404C(v177, v33);
        swift_errorRelease();
        swift_errorRelease();

        (*v277)(v244, v41);
      }
      uint64_t v24 = (uint64_t)v307;
LABEL_6:
      unint64_t v23 = v296 + 1;
      uint64_t v21 = v279;
      a1 = v289;
      if (v296 + 1 == v281)
      {
        swift_bridgeObjectRelease();
        v253 = v272;
        goto LABEL_262;
      }
    }
  }
  swift_bridgeObjectRelease();
  v253 = _swiftEmptyArrayStorage;
LABEL_262:
  uint64_t v254 = sub_10006D040((uint64_t)v253);
  *(void *)&long long v321 = v262;
  *(void *)&long long v315 = v254;
  sub_100122AB8();
  char v255 = dispatch thunk of static Equatable.== infix(_:_:)();
  swift_bridgeObjectRelease();
  if (v255)
  {
    uint64_t result = swift_bridgeObjectRelease();
    v257 = 0;
  }
  else
  {
    uint64_t v258 = (*(uint64_t (**)(uint64_t))(*a1 + 160))(v254);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*a1 + 360))(v258);
    v257 = &off_1001738D0;
  }
  void *v263 = v257;
  return result;
}

uint64_t sub_100121A40(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004700(&qword_10017BEF0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 248))(v7);
  if (result)
  {
    uint64_t v11 = (*(uint64_t (**)(void))(*(void *)result + 216))();
    swift_release();
    if (*(void *)(v11 + 16))
    {
      sub_100012DE4(a1, a2);
      uint64_t v12 = sub_100122584(a1, a2, (void (*)(unsigned char *, uint64_t, uint64_t))&Data.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000CFAC);
      if (v13)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)(v11 + 56);
        uint64_t v16 = type metadata accessor for ApplicationRecord(0);
        uint64_t v17 = *(void *)(v16 - 8);
        sub_1000461D0(v15 + *(void *)(v17 + 72) * v14, (uint64_t)v9, type metadata accessor for ApplicationRecord);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      }
      else
      {
        uint64_t v16 = type metadata accessor for ApplicationRecord(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
      }
    }
    else
    {
      uint64_t v16 = type metadata accessor for ApplicationRecord(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
      sub_100012DE4(a1, a2);
    }
    swift_bridgeObjectRelease();
    sub_100012A10(a1, a2);
    type metadata accessor for ApplicationRecord(0);
    BOOL v18 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v9, 1, v16) != 1;
    sub_1000130EC((uint64_t)v9, &qword_10017BEF0);
    return v18;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100121D24()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 152))();
  unint64_t v2 = ApprovalSettingsState.debugDescription.getter(v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100121D8C()
{
  uint64_t v1 = v0;
  uint64_t v35 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v4 = (void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  unint64_t v33 = v4;
  uint64_t v34 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036B0(v4, v5);
  sub_10012E340(v5, v6);
  uint64_t v8 = v40;
  uint64_t v7 = v41;
  sub_1000036B0(v39, v40);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 8))(v8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v36 = v9 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t result = sub_10000478C((uint64_t)v39);
  int64_t v15 = 0;
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v31 = v2 + 8;
  uint64_t v32 = v2 + 16;
  *(void *)&long long v16 = 134217984;
  long long v30 = v16;
  while (v13)
  {
    unint64_t v17 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v18 = v17 | (v15 << 6);
LABEL_17:
    uint64_t v22 = 8 * v18;
    uint64_t v23 = *(void *)(*(void *)(v9 + 48) + v22);
    uint64_t v24 = *(void *)(*(void *)(v9 + 56) + v22);
    uint64_t v25 = *sub_100086784();
    uint64_t v38 = v24;
    v39[0] = v25;
    sub_10008844C();
    uint64_t result = dispatch thunk of SetAlgebra.isSuperset(of:)();
    if (result)
    {
      uint64_t v26 = *(void *)(v1 + 40);
      uint64_t v27 = *(void *)(v1 + 48);
      sub_1000036B0(v33, v26);
      sub_10012E340(v26, v27);
      uint64_t v29 = v40;
      uint64_t v28 = v41;
      sub_1000036B0(v39, v40);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 + 8) + 16))(v23, v29);
      uint64_t result = sub_10000478C((uint64_t)v39);
    }
  }
  if (__OFADD__(v15++, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v15 >= v37) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v36 + 8 * v15);
  if (v20)
  {
LABEL_16:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v15 << 6);
    goto LABEL_17;
  }
  int64_t v21 = v15 + 1;
  if (v15 + 1 >= v37) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v36 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v15 + 2;
  if (v15 + 2 >= v37) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v36 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v15 + 3;
  if (v15 + 3 >= v37) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v36 + 8 * v21);
  if (v20)
  {
LABEL_15:
    int64_t v15 = v21;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v15 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v15 >= v37) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v36 + 8 * v15);
    ++v21;
    if (v20) {
      goto LABEL_16;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100122164()
{
  sub_10000478C(v0 + 16);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1001221C4()
{
  sub_100122164();

  return _swift_deallocClassInstance(v0, 120, 7);
}

id sub_1001221F8()
{
  return *(id *)(v0 + 72);
}

uint64_t sub_100122200()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t sub_10012222C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

void (*sub_100122258(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(void *)v1 + 288))();
  return sub_10000C31C;
}

uint64_t sub_1001222D8()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t sub_100122304()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

void *sub_100122330(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004700(&qword_100180538);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      void v10[3] = 2 * ((uint64_t)(v11 - 32) / 72);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[9 * v8 + 4]) {
          memmove(v12, a4 + 4, 72 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100123014(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100122458(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004700(&qword_100180530);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      void v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100122D34(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100122584(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, Swift::Int))
{
  Hasher.init(_seed:)();
  a3(v10, a1, a2);
  Swift::Int v7 = Hasher._finalize()();

  return a4(a1, a2, v7);
}

uint64_t sub_100122618(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100122638(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100122638(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004700(&qword_100180530);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    void v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 56 * v8) {
      memmove(v10 + 4, a4 + 4, 56 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 56 * v8 || v12 >= v13 + 56 * v8)
  {
    sub_100004700(&qword_100180510);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1001227E4(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v15[0] = a2;
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v10);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v11 - 8);
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(void *)(v2 + 112) = _swiftEmptyArrayStorage;
  sub_10000469C(a2, v2 + 16);
  *(void *)(v2 + 72) = a1;
  id v12 = a1;
  *(void *)(v2 + 56) = sub_10005CA68();
  sub_100090AA8();
  static DispatchQoS.unspecified.getter();
  v15[1] = (uint64_t)_swiftEmptyArrayStorage;
  sub_100087388();
  sub_100004700(&qword_10017DCF0);
  sub_10012310C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v6);
  uint64_t v13 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  sub_10000478C(v15[0]);
  *(void *)(v3 + 64) = v13;
  return v3;
}

uint64_t sub_100122A28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v1 + 152))();
  *a1 = result;
  return result;
}

uint64_t sub_100122A78@<X0>(void *a1@<X8>)
{
  return sub_10011F428(v1, a1);
}

uint64_t type metadata accessor for ApprovalSettingsStateManager()
{
  return self;
}

unint64_t sub_100122AB8()
{
  unint64_t result = qword_100180520;
  if (!qword_100180520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180520);
  }
  return result;
}

unint64_t sub_100122B0C()
{
  unint64_t result = qword_100180528;
  if (!qword_100180528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180528);
  }
  return result;
}

uint64_t sub_100122B60(uint64_t a1, unint64_t a2)
{
  return sub_100121A40(a1, a2, v2);
}

void *sub_100122B68(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62)
  {
LABEL_22:
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6)
    {
LABEL_3:
      for (unint64_t i = 0; ; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          unint64_t v9 = i + 1;
          if (__OFADD__(i, 1))
          {
LABEL_19:
            __break(1u);
            return _swiftEmptyArrayStorage;
          }
        }
        else
        {
          if (i >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_22;
          }
          uint64_t v8 = *(void *)(a1 + 8 * i + 32);
          swift_retain();
          unint64_t v9 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_19;
          }
        }
        if ((*(uint64_t (**)(void))(**(void **)(v8 + 24) + 144))() == a2 && v10 == a3) {
          break;
        }
        char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v12) {
          goto LABEL_16;
        }
        swift_release();
LABEL_5:
        if (v9 == v6) {
          return _swiftEmptyArrayStorage;
        }
      }
      swift_bridgeObjectRelease();
LABEL_16:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      goto LABEL_5;
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100122D34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      sub_100004700(&qword_100180510);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100122E44(uint64_t a1, uint64_t (*a2)(void, void, _OWORD *))
{
  uint64_t v2 = _swiftEmptyArrayStorage;
  uint64_t v19 = _swiftEmptyArrayStorage;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = a1 + 32;
    unint64_t v6 = &qword_100180510;
    do
    {
      sub_10001BA68(v5, (uint64_t)&v16, v6);
      if (a2(v16, *((void *)&v16 + 1), v17))
      {
        uint64_t v7 = v6;
        long long v12 = v16;
        long long v13 = v17[0];
        long long v14 = v17[1];
        uint64_t v15 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_100122618(0, v2[2] + 1, 1);
        }
        uint64_t v2 = v19;
        unint64_t v9 = v19[2];
        unint64_t v8 = v19[3];
        if (v9 >= v8 >> 1)
        {
          sub_100122618(v8 > 1, v9 + 1, 1);
          uint64_t v2 = v19;
        }
        v2[2] = v9 + 1;
        uint64_t v10 = &v2[7 * v9];
        *((_OWORD *)v10 + 2) = v12;
        *((_OWORD *)v10 + 3) = v13;
        *((_OWORD *)v10 + 4) = v14;
        v10[10] = v15;
        unint64_t v6 = v7;
      }
      else
      {
        sub_1000130EC((uint64_t)&v16, v6);
      }
      v5 += 56;
      --v3;
    }
    while (v3);
  }
  return v2;
}

uint64_t sub_100122FB8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DriverBinEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100123014(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 72 * a1 + 32;
    unint64_t v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10012310C()
{
  unint64_t result = qword_10017DCF8;
  if (!qword_10017DCF8)
  {
    sub_1000126B8(&qword_10017DCF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10017DCF8);
  }
  return result;
}

uint64_t sub_100123168()
{
  _StringGuts.grow(_:)(199);
  v0._countAndFlagsBits = 0x636B202020200A7BLL;
  v0._object = (void *)0xED0000203A206F6CLL;
  String.append(_:)(v0);
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0xEC000000203A2070;
  v2._countAndFlagsBits = 0x65636B202020200ALL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x72636B202020200ALL;
  v4._object = (void *)0xEC000000203A2066;
  String.append(_:)(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x72636B202020200ALL;
  v6._object = (void *)0xEC000000203A207ALL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x73636B202020200ALL;
  v8._object = (void *)0xEC000000203A2066;
  String.append(_:)(v8);
  v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x73636B202020200ALL;
  v10._object = (void *)0xEC000000203A207ALL;
  String.append(_:)(v10);
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x78636B202020200ALL;
  v12._object = (void *)0xEC000000203A2066;
  String.append(_:)(v12);
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x78636B202020200ALL;
  v14._object = (void *)0xEC000000203A207ALL;
  String.append(_:)(v14);
  v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0x62636B202020200ALL;
  v16._object = (void *)0xEC000000203A2066;
  String.append(_:)(v16);
  v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 0x62636B202020200ALL;
  v18._object = (void *)0xEC000000203A207ALL;
  String.append(_:)(v18);
  v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0x77636B202020200ALL;
  v20._object = (void *)0xEC000000203A2066;
  String.append(_:)(v20);
  v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0x77636B202020200ALL;
  v22._object = (void *)0xEC000000203A207ALL;
  String.append(_:)(v22);
  v23._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 0x6C636B202020200ALL;
  v24._object = (void *)0xEC000000203A2066;
  String.append(_:)(v24);
  v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 0x6C636B202020200ALL;
  v26._object = (void *)0xEC000000203A207ALL;
  String.append(_:)(v26);
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 32010;
  v28._object = (void *)0xE200000000000000;
  String.append(_:)(v28);
  return 0;
}

unint64_t sub_100123618()
{
  Swift::String v1 = v0;
  unint64_t v2 = sub_1000E8248((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v3 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v3, 1869374315, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v5 = v1[1];
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v5, 1885692779, 0xE400000000000000, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = v1[2];
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v7, 1718772587, 0xE400000000000000, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = v1[3];
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v9, 2054316907, 0xE400000000000000, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = v1[10];
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v11, 1719100267, 0xE400000000000000, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = v1[11];
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v13, 2054644587, 0xE400000000000000, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = v1[12];
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v15, 1718379371, 0xE400000000000000, v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = v1[13];
  char v18 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v17, 2053923691, 0xE400000000000000, v18);
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_100123824()
{
  Swift::String v1 = v0;
  unint64_t v2 = sub_1000E8248((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v3 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v3, 1869374315, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v5 = v1[1];
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v5, 1885692779, 0xE400000000000000, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = v1[2];
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v7, 1718772587, 0xE400000000000000, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = v1[3];
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v9, 2054316907, 0xE400000000000000, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = v1[4];
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v11, 1718838123, 0xE400000000000000, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = v1[5];
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v13, 2054382443, 0xE400000000000000, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = v1[6];
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v15, 1719165803, 0xE400000000000000, v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = v1[7];
  char v18 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v17, 2054710123, 0xE400000000000000, v18);
  swift_bridgeObjectRelease();
  uint64_t v19 = v1[8];
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v19, 1717724011, 0xE400000000000000, v20);
  swift_bridgeObjectRelease();
  uint64_t v21 = v1[9];
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v21, 2053268331, 0xE400000000000000, v22);
  swift_bridgeObjectRelease();
  uint64_t v23 = v1[10];
  char v24 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v23, 1719100267, 0xE400000000000000, v24);
  swift_bridgeObjectRelease();
  uint64_t v25 = v1[11];
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v25, 2054644587, 0xE400000000000000, v26);
  swift_bridgeObjectRelease();
  uint64_t v27 = v1[12];
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v27, 1718379371, 0xE400000000000000, v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = v1[13];
  char v30 = swift_isUniquelyReferenced_nonNull_native();
  sub_1001257A4(v29, 2053923691, 0xE400000000000000, v30);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100123B70(char a1)
{
  return *(void *)&aKclo_0[8 * a1];
}

uint64_t sub_100123B88()
{
  return sub_100123B70(*v0);
}

uint64_t sub_100123B90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100125E34(a1, a2);
  *a3 = result;
  return result;
}

void sub_100123BB8(unsigned char *a1@<X8>)
{
  *a1 = 14;
}

uint64_t sub_100123BC4(uint64_t a1)
{
  unint64_t v2 = sub_100125ADC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100123C00(uint64_t a1)
{
  unint64_t v2 = sub_100125ADC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100123C3C(void *a1)
{
  uint64_t v3 = sub_100004700(&qword_100180540);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000036B0(a1, a1[3]);
  sub_100125ADC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[9] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[8] = 7;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[7] = 8;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[6] = 9;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[5] = 10;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[4] = 11;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[3] = 12;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v8[2] = 13;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int sub_100123F7C()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*v0);
  Hasher._combine(_:)(v0[1]);
  Hasher._combine(_:)(v0[2]);
  Hasher._combine(_:)(v0[3]);
  Hasher._combine(_:)(v0[4]);
  Hasher._combine(_:)(v0[5]);
  Hasher._combine(_:)(v0[6]);
  Hasher._combine(_:)(v0[7]);
  Hasher._combine(_:)(v0[8]);
  Hasher._combine(_:)(v0[9]);
  Hasher._combine(_:)(v0[10]);
  Hasher._combine(_:)(v0[11]);
  Hasher._combine(_:)(v0[12]);
  Hasher._combine(_:)(v0[13]);
  return Hasher._finalize()();
}

void sub_100124064()
{
  Swift::UInt64 v1 = v0[1];
  Swift::UInt64 v2 = v0[2];
  Swift::UInt64 v3 = v0[3];
  Swift::UInt64 v4 = v0[4];
  Swift::UInt64 v5 = v0[5];
  Swift::UInt64 v7 = v0[6];
  Swift::UInt64 v6 = v0[7];
  Swift::UInt64 v8 = v0[8];
  Swift::UInt64 v9 = v0[9];
  Swift::UInt64 v10 = v0[10];
  Swift::UInt64 v11 = v0[11];
  Swift::UInt64 v12 = v0[12];
  Swift::UInt64 v13 = v0[13];
  Hasher._combine(_:)(*v0);
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v7);
  Hasher._combine(_:)(v6);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v10);
  Hasher._combine(_:)(v11);
  Hasher._combine(_:)(v12);
  Hasher._combine(_:)(v13);
}

Swift::Int sub_100124144()
{
  Swift::UInt64 v1 = *v0;
  Swift::UInt64 v2 = v0[1];
  Swift::UInt64 v3 = v0[2];
  Swift::UInt64 v4 = v0[3];
  Swift::UInt64 v6 = v0[4];
  Swift::UInt64 v5 = v0[5];
  Swift::UInt64 v7 = v0[6];
  Swift::UInt64 v8 = v0[7];
  Swift::UInt64 v9 = v0[8];
  Swift::UInt64 v11 = v0[9];
  Swift::UInt64 v12 = v0[10];
  Swift::UInt64 v13 = v0[11];
  Swift::UInt64 v14 = v0[12];
  Swift::UInt64 v15 = v0[13];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(v6);
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v7);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v11);
  Hasher._combine(_:)(v12);
  Hasher._combine(_:)(v13);
  Hasher._combine(_:)(v14);
  Hasher._combine(_:)(v15);
  return Hasher._finalize()();
}

uint64_t sub_100124274(void *a1)
{
  return sub_100123C3C(a1);
}

BOOL sub_10012428C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[5];
  v13[4] = a1[4];
  v13[5] = v2;
  long long v3 = a1[6];
  long long v4 = a1[1];
  v13[0] = *a1;
  v13[1] = v4;
  long long v5 = a1[3];
  long long v13[2] = a1[2];
  void v13[3] = v5;
  long long v6 = *a2;
  long long v7 = a2[1];
  v13[6] = v3;
  v14[0] = v6;
  long long v8 = a2[2];
  long long v9 = a2[3];
  long long v10 = a2[6];
  v14[5] = a2[5];
  v14[6] = v10;
  long long v11 = a2[4];
  void v14[3] = v9;
  v14[4] = v11;
  v14[1] = v7;
  v14[2] = v8;
  return sub_100125AB8(v13, v14);
}

uint64_t sub_1001242F4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

__n128 sub_100124304@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X8>)
{
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = 0u;
  *(_OWORD *)(v13 + 32) = 0u;
  *(void *)(v13 + 48) = 0;
  Swift::UInt64 v14 = (void *)swift_allocObject();
  v14[2] = a4;
  void v14[3] = a5;
  v14[4] = v13;
  Swift::UInt64 v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t *), void *, uint64_t, uint64_t))(a7 + 32);
  swift_bridgeObjectRetain();
  swift_retain();
  v15(a1, a2, a3, sub_100126C8C, v14, a6, a7);
  swift_release();
  if (v22)
  {
    swift_release();
  }
  else
  {
    swift_beginAccess();
    __n128 v23 = *(__n128 *)(v13 + 16);
    unint64_t v17 = *(void *)(v13 + 32);
    unint64_t v18 = *(void *)(v13 + 40);
    unint64_t v19 = *(void *)(v13 + 48);
    swift_bridgeObjectRetain();
    swift_release();
    __n128 result = v23;
    *a8 = v23;
    a8[1].n128_u64[0] = v17;
    a8[1].n128_u64[1] = v18;
    a8[2].n128_u64[0] = v19;
  }
  return result;
}

uint64_t sub_100124478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  uint64_t v10 = v9 + 16;
  *(unsigned char *)(v9 + 24) = 1;
  long long v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(a5 + 24);
  swift_retain();
  v11(a1, a2, a3, sub_100125B40, v9, a4, a5);
  swift_release();
  if (!v14)
  {
    swift_beginAccess();
    uint64_t v10 = *(void *)(v9 + 16);
  }
  swift_release();
  return v10;
}

uint64_t sub_10012458C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 0;
  switch(a4)
  {
    case 1:
      sub_100012E3C();
      swift_allocError();
      uint64_t v13 = "Cannot calculate Mach-O entry point for system kernel collection";
      unint64_t v14 = 0xD000000000000040;
      goto LABEL_7;
    case 2:
      return result;
    case 3:
      sub_100012E3C();
      swift_allocError();
      uint64_t v13 = "Mach-O tags can be calculated for boot and auxiliary kernel collections only";
      unint64_t v14 = 0xD00000000000004CLL;
LABEL_7:
      *(void *)uint64_t v11 = v14;
      *(void *)(v11 + 8) = (unint64_t)(v13 - 32) | 0x8000000000000000;
      *(_OWORD *)(v11 + 16) = 0u;
      *(_OWORD *)(v11 + 32) = 0u;
      *(_OWORD *)(v11 + 48) = 0u;
      *(void *)(v11 + 64) = 0;
      char v12 = 9;
      goto LABEL_8;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 48))(a1, a2, a3, a5, a6);
      if (v6 || (v9 & 1) == 0) {
        return result;
      }
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease();
      v10._countAndFlagsBits = sub_1000F11D0(0);
      String.append(_:)(v10);
      swift_bridgeObjectRelease();
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v11 = 0xD000000000000026;
      *(void *)(v11 + 8) = 0x8000000100150AE0;
      *(_OWORD *)(v11 + 16) = 0u;
      *(_OWORD *)(v11 + 32) = 0u;
      *(_OWORD *)(v11 + 48) = 0u;
      *(void *)(v11 + 64) = 0;
      char v12 = 58;
LABEL_8:
      *(unsigned char *)(v11 + 72) = v12;
      return swift_willThrow();
  }
}

uint64_t sub_100124758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v9 = v8;
  uint64_t v158 = a7;
  uint64_t v15 = sub_1000F0F54(a1);
  if (v16)
  {
    if (v15 == 0x34365F363878 && v16 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v18 = 0xD00000000000003FLL;
      *(void *)(v18 + 8) = 0x80000001001508E0;
      *(_OWORD *)(v18 + 16) = 0u;
      *(_OWORD *)(v18 + 32) = 0u;
      *(_OWORD *)(v18 + 48) = 0u;
      *(void *)(v18 + 64) = 0;
      char v19 = 16;
LABEL_7:
      *(unsigned char *)(v18 + 72) = v19;
      return swift_willThrow();
    }
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_6;
    }
  }
  uint64_t v21 = sub_1000A1C84();
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v22, v23, a6, v158, &v108);
  if (v9) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_100125D40((uint64_t)&v108, (uint64_t)&v151);
  if (!v153)
  {
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    *(void *)__src = 0x742064656C696146;
    *(void *)&__src[8] = 0xEF20646E6966206FLL;
    uint64_t v28 = *v21;
    uint64_t v27 = (void *)v21[1];
LABEL_13:
    swift_bridgeObjectRetain();
    v29._countAndFlagsBits = v28;
    v29._object = v27;
    String.append(_:)(v29);
    swift_bridgeObjectRelease();
    v30._countAndFlagsBits = 0x746E656D67657320;
    v30._object = (void *)0xE800000000000000;
    String.append(_:)(v30);
    uint64_t v31 = *(void *)__src;
    unint64_t v32 = *(void *)&__src[8];
LABEL_14:
    sub_100012E3C();
    swift_allocError();
    *(void *)uint64_t v18 = v31;
    *(void *)(v18 + 8) = v32;
    *(_OWORD *)(v18 + 16) = 0u;
    *(_OWORD *)(v18 + 32) = 0u;
    *(_OWORD *)(v18 + 48) = 0u;
    *(void *)(v18 + 64) = 0;
    char v19 = 58;
    goto LABEL_7;
  }
  uint64_t v101 = v153;
  v154[0] = v151;
  v154[1] = v152;
  uint64_t v155 = v153;
  uint64_t v97 = *((void *)&v151 + 1);
  uint64_t v99 = v151;
  uint64_t v95 = v152;
  unint64_t v92 = a8;
  uint64_t v93 = *((void *)&v152 + 1);
  char v24 = sub_1000A1D10();
  uint64_t v25 = *v24;
  uint64_t v26 = v24[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v25, v26, a6, v158, v109);
  uint64_t v91 = a6;
  swift_bridgeObjectRelease();
  sub_100125D40((uint64_t)v109, (uint64_t)&v146);
  if (!v148)
  {
    sub_10011152C((uint64_t)&v108);
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    *(void *)__src = 0x742064656C696146;
    *(void *)&__src[8] = 0xEF20646E6966206FLL;
    uint64_t v28 = *v24;
    uint64_t v27 = (void *)v24[1];
    goto LABEL_13;
  }
  unint64_t v87 = v148;
  v149[0] = v146;
  v149[1] = v147;
  unint64_t v150 = v148;
  unint64_t v89 = v146;
  unint64_t v85 = v147;
  unint64_t v86 = *((void *)&v146 + 1);
  unint64_t v84 = *((void *)&v147 + 1);
  unint64_t v33 = sub_1000A1EB4();
  uint64_t v34 = *v33;
  uint64_t v35 = v33[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v34, v35, v91, v158, &v110);
  swift_bridgeObjectRelease();
  sub_100125D40((uint64_t)&v110, (uint64_t)&v141);
  if (!v143)
  {
    sub_10011152C((uint64_t)v109);
    sub_10011152C((uint64_t)&v108);
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    *(void *)__src = 0x742064656C696146;
    *(void *)&__src[8] = 0xEF20646E6966206FLL;
    uint64_t v28 = *v33;
    uint64_t v27 = (void *)v33[1];
    goto LABEL_13;
  }
  unint64_t v83 = v143;
  v144[0] = v141;
  v144[1] = v142;
  unint64_t v145 = v143;
  unint64_t v81 = *((void *)&v141 + 1);
  unint64_t v82 = v141;
  unint64_t v79 = *((void *)&v142 + 1);
  unint64_t v80 = v142;
  uint64_t v36 = sub_1000A1F3C();
  uint64_t v37 = *v36;
  uint64_t v38 = v36[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v37, v38, v91, v158, v111);
  char v77 = v36;
  swift_bridgeObjectRelease();
  sub_100125D40((uint64_t)v111, (uint64_t)&v136);
  uint64_t v39 = v138;
  if (!v138)
  {
    sub_10011152C((uint64_t)v109);
    sub_10011152C((uint64_t)&v110);
    sub_10011152C((uint64_t)&v108);
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    *(void *)__src = 0x742064656C696146;
    *(void *)&__src[8] = 0xEF20646E6966206FLL;
    uint64_t v28 = *v77;
    uint64_t v27 = (void *)v77[1];
    goto LABEL_13;
  }
  v139[0] = v136;
  v139[1] = v137;
  uint64_t v140 = v138;
  uint64_t v76 = *((void *)&v136 + 1);
  uint64_t v78 = v136;
  uint64_t v74 = *((void *)&v137 + 1);
  uint64_t v75 = v137;
  uint64_t v40 = sub_1000A1D98();
  uint64_t v41 = *v40;
  uint64_t v42 = v40[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v41, v42, v91, v158, &v112);
  unint64_t v72 = v112.n128_u64[1];
  unint64_t v73 = v112.n128_u64[0];
  uint64_t v70 = v114;
  uint64_t v71 = v113;
  uint64_t v69 = v115;
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_1000A1E24();
  uint64_t v44 = *v43;
  uint64_t v45 = v43[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v44, v45, v91, v158, &v116);
  uint64_t v67 = v39;
  unint64_t v46 = v116.n128_u64[1];
  unint64_t v68 = v116.n128_u64[0];
  unint64_t v65 = v118;
  unint64_t v66 = v117;
  unint64_t v64 = v119;
  swift_bridgeObjectRelease();
  uint64_t v47 = sub_1000A1FCC();
  uint64_t v48 = *v47;
  uint64_t v49 = v47[1];
  swift_bridgeObjectRetain();
  sub_100124304(a1, a2, a3, v48, v49, v91, v158, v120);
  __n128 v62 = v120[1];
  __n128 v63 = v120[0];
  uint64_t v61 = v121;
  swift_bridgeObjectRelease();
  *(void *)__src = v99;
  *(void *)&__src[8] = v97;
  *(void *)&__src[16] = v95;
  *(void *)&__src[24] = v93;
  *(void *)&__src[32] = v101;
  *(void *)&__src[40] = v89;
  *(void *)&__src[48] = v86;
  *(void *)&__src[56] = v85;
  *(void *)&__src[64] = v84;
  *(void *)&__src[72] = v87;
  *(void *)&__src[80] = v82;
  *(void *)&__src[88] = v81;
  *(void *)&__src[96] = v80;
  *(void *)&__src[104] = v79;
  *(void *)&__src[112] = v83;
  *(void *)&__src[120] = v78;
  *(void *)&__src[128] = v76;
  *(void *)&__src[136] = v75;
  *(void *)&__src[144] = v74;
  *(void *)&__src[152] = v67;
  *(void *)&__src[160] = v73;
  *(void *)&__src[168] = v72;
  *(void *)&__src[176] = v71;
  *(void *)&__src[184] = v70;
  *(void *)&__src[192] = v69;
  *(void *)&__src[200] = v68;
  unint64_t v102 = v46;
  *(void *)&__src[208] = v46;
  unint64_t v50 = v66;
  *(void *)&__src[216] = v66;
  unint64_t v51 = v65;
  *(void *)&__src[224] = v65;
  *(void *)&__src[232] = v64;
  *(__n128 *)&__src[240] = v63;
  *(__n128 *)&__src[256] = v62;
  *(void *)&__src[272] = v61;
  memcpy(__dst, __src, sizeof(__dst));
  if (*(void *)&v154[0])
  {
    sub_100125DA8((uint64_t)__src);
    _StringGuts.grow(_:)(32);
    swift_bridgeObjectRelease();
    uint64_t v53 = *v21;
    uint64_t v52 = (void *)v21[1];
    swift_bridgeObjectRetain();
    v54._countAndFlagsBits = v53;
    v54._object = v52;
    String.append(_:)(v54);
    swift_bridgeObjectRelease();
    v55._object = (void *)0x80000001001508C0;
    v55._countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v55);
    uint64_t v31 = 0x742074657366664FLL;
    unint64_t v32 = 0xEA0000000000206FLL;
    goto LABEL_14;
  }
  if (a5)
  {
    uint64_t v106 = *(void *)&v149[0];
    sub_100125D40((uint64_t)&v112, (uint64_t)v132);
    if (v133)
    {
      v134[0] = v132[0];
      v134[1] = v132[1];
      uint64_t v135 = v133;
      unint64_t v100 = sub_10012621C((unint64_t *)v149, (unint64_t *)v134);
    }
    else
    {
      unint64_t v100 = *((void *)&v149[0] + 1);
    }
    sub_100125D40((uint64_t)&v116, (uint64_t)v130);
    if (v131)
    {
      unint64_t v83 = v64;
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v68 = v89;
      unint64_t v50 = v85;
      unint64_t v102 = v86;
      unint64_t v51 = v84;
      unint64_t v83 = v87;
    }
    sub_1001266E0((uint64_t)&v116);
    unint64_t v81 = v102;
    unint64_t v82 = v68;
    unint64_t v79 = v51;
    unint64_t v80 = v50;
  }
  else
  {
    swift_bridgeObjectRetain();
    unint64_t v100 = 0;
    uint64_t v106 = 0;
  }
  v157[0] = v82;
  v157[1] = v81;
  v157[2] = v80;
  v157[3] = v79;
  v157[4] = v83;
  unint64_t v56 = sub_10012621C((unint64_t *)v154, v157);
  swift_bridgeObjectRelease();
  unint64_t v57 = sub_10012621C((unint64_t *)v144, (unint64_t *)v139);
  uint64_t v103 = *((void *)&v139[0] + 1);
  uint64_t v96 = *(void *)&v139[0];
  uint64_t v98 = *(void *)&v144[0];
  sub_100125D40((uint64_t)&v116, (uint64_t)v126);
  if (v127)
  {
    v128[0] = v126[0];
    v128[1] = v126[1];
    uint64_t v129 = v127;
    uint64_t v58 = *(void *)&v126[0];
    unint64_t v94 = sub_10012621C((unint64_t *)v128, (unint64_t *)v149);
  }
  else
  {
    uint64_t v58 = 0;
    unint64_t v94 = 0;
  }
  sub_100125D40((uint64_t)&v112, (uint64_t)v122);
  if (v123)
  {
    v124[0] = v122[0];
    v124[1] = v122[1];
    uint64_t v125 = v123;
    uint64_t v90 = *(void *)&v122[0];
    unint64_t v88 = sub_10012621C((unint64_t *)v124, (unint64_t *)v144);
  }
  else
  {
    unint64_t v88 = 0;
    uint64_t v90 = 0;
  }
  uint64_t v59 = sub_10012458C(a1, a2, a3, a4, v91, v158);
  uint64_t v60 = sub_100126518((uint64_t)__dst, a4);
  uint64_t result = sub_100125DA8((uint64_t)__src);
  *unint64_t v92 = v60;
  v92[1] = v59;
  v92[2] = 0;
  v92[3] = v56;
  v92[4] = v58;
  v92[5] = v94;
  v92[6] = v106;
  v92[7] = v100;
  v92[8] = v90;
  v92[9] = v88;
  v92[10] = v98;
  v92[11] = v57;
  v92[12] = v96;
  v92[13] = v103;
  return result;
}

uint64_t sub_1001252C8(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1000F1040(a1);
  sub_100124758(v12, v13, v14, a3, a4, a5, a6, v22);
  if (v6)
  {
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_100132F10;
    v22[15] = v6;
    swift_errorRetain();
    sub_100004700(&qword_10017EB50);
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v18 = v17;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = sub_10002A1DC();
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v18;
    sub_10002A230();
    char v19 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

    return swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (a4)
    {
      sub_10002A230();
      uint64_t v21 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      return sub_100123824();
    }
    else
    {
      return sub_100123618();
    }
  }
}

uint64_t sub_100125498(uint64_t a1, char a2)
{
  long long v3 = v2;
  uint64_t v5 = *v2;
  sub_100004700(&qword_10017F938);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          long long v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    Swift::String v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  long long v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *long long v3 = v7;
  return result;
}

uint64_t sub_1001257A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000048E0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100125908();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100125498(result, a4 & 1);
  uint64_t result = sub_1000048E0(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

void *sub_100125908()
{
  Swift::UInt64 v1 = v0;
  sub_100004700(&qword_10017F938);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *Swift::UInt64 v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    BOOL v22 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

BOOL sub_100125AB8(const void *a1, const void *a2)
{
  return memcmp(a1, a2, 0x70uLL) == 0;
}

unint64_t sub_100125ADC()
{
  unint64_t result = qword_100198510[0];
  if (!qword_100198510[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100198510);
  }
  return result;
}

uint64_t sub_100125B30()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100125B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)a1 != 5) {
    return 2;
  }
  uint64_t v5 = v4;
  if (*(_DWORD *)(a1 + 8) == 6)
  {
    if (*(_DWORD *)(a1 + 12) == 68)
    {
      uint64_t v7 = nullsub_1(*(void *)(a1 + 272), a2, a3, a4);
      swift_beginAccess();
      *(void *)(v5 + 16) = v7;
      *(unsigned char *)(v5 + 24) = 0;
      goto LABEL_9;
    }
    static os_log_type_t.error.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_100132F30;
    *(void *)(v12 + 56) = &type metadata for Int;
    *(void *)(v12 + 64) = &protocol witness table for Int;
    *(void *)(v12 + 32) = 68;
    *(void *)(v12 + 96) = sub_100004700(&qword_100180558);
    *(void *)(v12 + 104) = sub_100126D30();
    *(void *)(v12 + 72) = a1 + 12;
    sub_10002A230();
    uint64_t v11 = (void *)static OS_os_log.default.getter();
  }
  else
  {
    static os_log_type_t.error.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100132F10;
    int v10 = *(_DWORD *)(a1 + 8);
    *(void *)(v9 + 56) = &type metadata for UInt32;
    *(void *)(v9 + 64) = &protocol witness table for UInt32;
    *(_DWORD *)(v9 + 32) = v10;
    sub_10002A230();
    uint64_t v11 = (void *)static OS_os_log.default.getter();
  }
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();

LABEL_9:
  swift_beginAccess();
  if (*(unsigned char *)(v5 + 24)) {
    return 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_100125D40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700(&qword_100180548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100125DA8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100125E34(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1869374315 && a2 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1885692779 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1718772587 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 2054316907 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1718838123 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 2054382443 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 1719165803 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 2054710123 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 1717724011 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 2053268331 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 1719100267 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 2054644587 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 1718379371 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 2053923691 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 13;
    }
    else {
      return 14;
    }
  }
}

unint64_t sub_10012621C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v5 = sub_1000FF4E8(*a1, *a2);
  if (v2)
  {
    os_log_type_t v6 = static os_log_type_t.error.getter();
    uint64_t v7 = a2[3];
    unint64_t v17 = a2[4];
    sub_10002A230();
    sub_1001266E0((uint64_t)a1);
    sub_1001266E0((uint64_t)a2);
    sub_1001266E0((uint64_t)a1);
    sub_1001266E0((uint64_t)a2);
    sub_1001266E0((uint64_t)a2);
    sub_1001266E0((uint64_t)a1);
    sub_1001266E0((uint64_t)a2);
    sub_1001266E0((uint64_t)a1);
    uint64_t v8 = static OS_os_log.default.getter();
    if (os_log_type_enabled(v8, v6))
    {
      os_log_type_t type = v6;
      unint64_t v9 = v5;
      uint64_t v10 = a1[3];
      unint64_t v11 = a1[4];
      uint64_t v15 = v7;
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315906;
      swift_bridgeObjectRetain();
      unint64_t v13 = v11;
      unint64_t v5 = v9;
      sub_100003F90(v10, v13, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10011152C((uint64_t)a1);
      sub_10011152C((uint64_t)a1);
      sub_10011152C((uint64_t)a1);
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_100003F90(v15, v17, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10011152C((uint64_t)a2);
      sub_10011152C((uint64_t)a2);
      sub_10011152C((uint64_t)a2);
      *(_WORD *)(v12 + 22) = 2048;
      sub_10011152C((uint64_t)a2);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10011152C((uint64_t)a2);
      *(_WORD *)(v12 + 32) = 2048;
      sub_10011152C((uint64_t)a1);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10011152C((uint64_t)a1);
      _os_log_impl((void *)&_mh_execute_header, v8, type, "Integer overflow detected: %s offset from segment %s offset (%llu - %llu)", (uint8_t *)v12, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10011152C((uint64_t)a1);
      sub_10011152C((uint64_t)a2);

      sub_10011152C((uint64_t)a1);
      sub_10011152C((uint64_t)a1);
      sub_10011152C((uint64_t)a2);
      sub_10011152C((uint64_t)a2);
      sub_10011152C((uint64_t)a2);
      sub_10011152C((uint64_t)a1);
    }
    swift_willThrow();
  }
  return v5;
}

uint64_t sub_100126518(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v3 = 0xD000000000000046;
      uint64_t v4 = "Cannot calculate Mach-O lowest VM address for system kernel collection";
      goto LABEL_7;
    case 2:
      if (!*(void *)(a1 + 96)) {
        return 0;
      }
      _StringGuts.grow(_:)(36);
      swift_bridgeObjectRelease();
      v5._countAndFlagsBits = sub_1000F11D0(2);
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0x6562207473756D20;
      v6._object = (void *)0xEC00000030783020;
      String.append(_:)(v6);
      unint64_t v7 = 0x8000000100150A20;
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v3 = 0xD000000000000016;
      char v8 = 58;
LABEL_8:
      *(void *)(v3 + 8) = v7;
      *(_OWORD *)(v3 + 16) = 0u;
      *(_OWORD *)(v3 + 32) = 0u;
      *(_OWORD *)(v3 + 48) = 0u;
      *(void *)(v3 + 64) = 0;
      *(unsigned char *)(v3 + 72) = v8;
      return swift_willThrow();
    case 3:
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v3 = 0xD00000000000004CLL;
      uint64_t v4 = "Mach-O tags can be calculated for boot and auxiliary kernel collections only";
LABEL_7:
      unint64_t v7 = (unint64_t)(v4 - 32) | 0x8000000000000000;
      char v8 = 9;
      goto LABEL_8;
    default:
      return *(void *)(a1 + 16);
  }
}

uint64_t sub_1001266E0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100126710()
{
  unint64_t result = qword_100180550;
  if (!qword_100180550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180550);
  }
  return result;
}

__n128 initializeWithCopy for MachOKernelcacheTags(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t getEnumTagSinglePayload for MachOKernelcacheTags(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 112)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MachOKernelcacheTags(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 112) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MachOKernelcacheTags()
{
  return &type metadata for MachOKernelcacheTags;
}

uint64_t destroy for MachOSegment()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MachOSegment(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MachOSegment(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MachOSegment(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MachOSegment(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MachOSegment(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MachOSegment()
{
  return &type metadata for MachOSegment;
}

uint64_t getEnumTagSinglePayload for MachOKernelcacheTags.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MachOKernelcacheTags.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *__n128 result = a2 + 13;
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
        JUMPOUT(0x100126AD4);
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
          *__n128 result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MachOKernelcacheTags.CodingKeys()
{
  return &type metadata for MachOKernelcacheTags.CodingKeys;
}

unint64_t sub_100126B10()
{
  unint64_t result = qword_100198820[0];
  if (!qword_100198820[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100198820);
  }
  return result;
}

unint64_t sub_100126B68()
{
  unint64_t result = qword_100198930;
  if (!qword_100198930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100198930);
  }
  return result;
}

unint64_t sub_100126BC0()
{
  unint64_t result = qword_100198938[0];
  if (!qword_100198938[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100198938);
  }
  return result;
}

uint64_t sub_100126C14()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100126C4C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100126C8C(uint64_t *a1)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  unsigned int v4 = (void *)v1[4];
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v9 = a1[4];
  if ((sub_1000FE854(v7, v9, v2, v3) & 1) == 0) {
    return 2;
  }
  swift_beginAccess();
  v4[2] = v5;
  v4[3] = v6;
  v4[4] = v8;
  v4[5] = v7;
  v4[6] = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return 0;
}

unint64_t sub_100126D30()
{
  unint64_t result = qword_100180560;
  if (!qword_100180560)
  {
    sub_1000126B8(&qword_100180558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180560);
  }
  return result;
}

uint64_t sub_100126D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v10[3] = a2;
  v10[4] = a3;
  uint64_t v6 = sub_1000045E8(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v6, v3, a2);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  sub_10000464C(a1, v7);
  return sub_100126E24((uint64_t)v10, v7, v8);
}

uint64_t sub_100126E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000469C(a1, (uint64_t)v8);
  uint64_t v6 = sub_100004700(&qword_100180568);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + 40))(v8, v6, v6, a2);
  return sub_10000478C(a1);
}

uint64_t sub_100126EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700(&qword_100180568);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 8) + 32);

  return v5(v4, v4, a1);
}

uint64_t sub_100126F0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  sub_1000036B0(a1, v4);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v5(v4, v3);
  uint64_t v6 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)(v6 + 32));
  swift_release();
  if (!v7)
  {
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = ((uint64_t (*)(uint64_t, uint64_t))v5)(v4, v3);
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    sub_100012E3C();
    swift_allocError();
    *(void *)uint64_t v17 = 0xD00000000000002BLL;
    *(void *)(v17 + 8) = 0x8000000100150C10;
    *(_OWORD *)(v17 + 16) = 0u;
    *(_OWORD *)(v17 + 32) = 0u;
    *(_OWORD *)(v17 + 48) = 0u;
    *(void *)(v17 + 64) = 0;
    *(unsigned char *)(v17 + 72) = 10;
    return swift_willThrow();
  }
  uint64_t v28 = v3;
  Swift::String v29 = (uint64_t (*)(uint64_t, uint64_t))v5;
  uint64_t v9 = a1[3];
  uint64_t v8 = a1[4];
  sub_1000036B0(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v9, v8);
  uint64_t v10 = (__CFString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v7, v10, kCFAllocatorDefault, 0);

  if (!CFProperty)
  {
    _StringGuts.grow(_:)(32);
    swift_bridgeObjectRelease();
    uint64_t v19 = a1[3];
    uint64_t v20 = a1[4];
    sub_1000036B0(a1, v19);
    v21._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20);
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    v22._countAndFlagsBits = 544106784;
    v22._object = (void *)0xE400000000000000;
    String.append(_:)(v22);
    v23._countAndFlagsBits = v29(v4, v28);
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    sub_100012E3C();
    swift_allocError();
    *(void *)uint64_t v24 = 0xD000000000000018;
    *(void *)(v24 + 8) = 0x8000000100150BF0;
    *(_OWORD *)(v24 + 16) = 0u;
    *(_OWORD *)(v24 + 32) = 0u;
    *(_OWORD *)(v24 + 48) = 0u;
    *(void *)(v24 + 64) = 0;
    *(unsigned char *)(v24 + 72) = 10;
    swift_willThrow();
    return IOObjectRelease(v7);
  }
  CFTypeID v12 = CFGetTypeID(CFProperty);
  if (CFStringGetTypeID() != v12)
  {
    if (CFNumberGetTypeID() == v12)
    {
      swift_unknownObjectRetain();
      self;
      if (swift_dynamicCastObjCClass()) {
        static Int._conditionallyBridgeFromObjectiveC(_:result:)();
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return IOObjectRelease(v7);
    }
    if (CFDataGetTypeID() != v12)
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      swift_unknownObjectRelease();
      return IOObjectRelease(v7);
    }
    swift_unknownObjectRetain();
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v27 = v26;
      swift_unknownObjectRelease();
      *(void *)(a2 + 24) = &type metadata for Data;
      swift_unknownObjectRelease();
      *(void *)a2 = v25;
      *(void *)(a2 + 8) = v27;
      return IOObjectRelease(v7);
    }
LABEL_14:
    swift_unknownObjectRelease_n();
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return IOObjectRelease(v7);
  }
  swift_unknownObjectRetain();
  self;
  if (!swift_dynamicCastObjCClass()) {
    goto LABEL_14;
  }
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  swift_unknownObjectRelease();
  *(void *)(a2 + 24) = &type metadata for String;
  swift_unknownObjectRelease();
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v15;
  return IOObjectRelease(v7);
}

uint64_t sub_1001273C8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 80))();
}

uint64_t type metadata accessor for RealDeviceProperties()
{
  return self;
}

uint64_t sub_100127430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __chkstk_darwin(a1);
  uint64_t v7 = type metadata accessor for String.Encoding();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  v16[1] = a1;
  uint64_t v17 = String.data(using:allowLossyConversion:)();
  unint64_t v12 = v11;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v12 >> 60 != 15)
  {
    v18[0] = v17;
    v18[1] = v12;
    uint64_t v14 = *(void (**)(void *, void *, unint64_t, uint64_t, uint64_t))(a4 + 56);
    unint64_t v15 = sub_1000C929C();
    v14(v18, &type metadata for Data, v15, a3, a4);
    return sub_10002404C(v17, v12);
  }
  return result;
}

uint64_t sub_10012772C()
{
  return 950287;
}

uint64_t sub_100127738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 200))();
}

uint64_t protocol witness for TextOutputStream.write(_:) in conformance NSFileHandle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_100127430(a1, a2, a3, WitnessTable);
}

id sub_1001277D8()
{
  return [*v0 offsetInFile];
}

id sub_1001277E8()
{
  return [*v0 seekToEndOfFile];
}

id sub_1001277F8(uint64_t a1)
{
  return [*v1 seekToFileOffset:a1];
}

uint64_t sub_10012780C(uint64_t a1, uint64_t a2)
{
  return sub_1001285B0(a1, a2, (SEL *)&selRef_readDataToEndOfFile, (uint64_t (*)(void))&static Data._unconditionallyBridgeFromObjectiveC(_:));
}

uint64_t sub_10012782C(uint64_t a1)
{
  id v2 = [*v1 readDataOfLength:a1];
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_100127888()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

id sub_1001278AC()
{
  return [*v0 closeFile];
}

uint64_t sub_1001278BC@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  id v31 = a4;
  uint64_t v9 = type metadata accessor for POSIXError();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v13 = strlen(a1);
  size_t v14 = v13 + 1;
  if (__OFADD__(v13, 1)) {
    __break(1u);
  }
  uint64_t v32 = a5;
  unint64_t v15 = (char *)swift_slowAlloc();
  strlcpy(v15, a1, v14);
  uint64_t v16 = mkstemp(v15);
  if ((v16 & 0x80000000) != 0)
  {
    sub_1000D5EB4((uint64_t)v12);
    POSIXError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_willThrow();
  }
  else
  {
    id v17 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v16 closeOnDealloc:1];
    sub_10000469C(a2, (uint64_t)v35);
    sub_100004700(&qword_10017F190);
    swift_dynamicCast();
    uint64_t v18 = v33;
    unint64_t v19 = v34;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100012A10(v18, v19);
    [v17 writeData:isa];

    uint64_t v21 = String.init(cString:)();
    uint64_t v23 = v22;
    if (a3)
    {
      type metadata accessor for FileAttributeKey();
      sub_100129C78(&qword_10017C608, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
      Class v24 = Dictionary._bridgeToObjectiveC()().super.isa;
      NSString v25 = String._bridgeToObjectiveC()();
      v35[0] = 0;
      unsigned int v26 = [v31 setAttributes:v24 ofItemAtPath:v25 error:v35];

      if (!v26)
      {
        id v29 = v35[0];
        swift_bridgeObjectRelease();
        _convertNSErrorToError(_:)();

        swift_willThrow();
        return swift_slowDealloc();
      }
      id v27 = v35[0];
    }

    uint64_t v28 = v32;
    *uint64_t v32 = v21;
    v28[1] = v23;
  }
  return swift_slowDealloc();
}

uint64_t sub_100127BD4@<X0>(const char *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1001278BC(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), a2);
}

void *sub_100127BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v7)(uint64_t *__return_ptr, void *);
  uint64_t v8;
  uint64_t v9;
  void *result;
  uint64_t v11;
  void v12[3];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    uint64_t result = (void *)_StringGuts._slowWithCString<A>(_:)();
    if (!v4) {
      return (void *)v12[2];
    }
  }
  else
  {
    __chkstk_darwin(a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v12[0] = v5;
      v12[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      uint64_t result = v7(&v11, v12);
      if (!v4) {
        return (void *)v11;
      }
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = _StringObject.sharedUTF8.getter();
      }
      return (void *)sub_100129860(v8, v9, (uint64_t (*)(void))sub_10012A844);
    }
  }
  return result;
}

uint64_t sub_100127D08(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    type metadata accessor for URL();
    return _StringGuts._slowWithCString<A>(_:)();
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v7[0] = a3;
      v7[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v5 = v7;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v5 = (void *)_StringObject.sharedUTF8.getter();
    }
    return a1(v5);
  }
}

double sub_100127DE4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  String.utf8CString.getter();
  uint64_t v6 = open(_:_:)();
  swift_release();
  if (v6 == -1)
  {
    int v9 = errno.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100132F30;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_10002A1DC();
    *(void *)(v10 + 32) = a1;
    *(void *)(v10 + 40) = a2;
    *(void *)(v10 + 96) = &type metadata for Int32;
    *(void *)(v10 + 104) = &protocol witness table for Int32;
    *(_DWORD *)(v10 + 72) = v9;
    sub_10000483C(0, (unint64_t *)&qword_10017D6F0);
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    id v7 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v6 closeOnDealloc:1];
    *(void *)(a3 + 24) = sub_10000483C(0, &qword_100180610);
    *(void *)(a3 + 32) = sub_10012A7E0(&qword_100180618);
    *(void *)a3 = v7;
  }
  return result;
}

BOOL sub_100127F84(int a1, int a2, copyfile_state_t s)
{
  return sub_100129A44(a1, s);
}

uint64_t sub_100127F8C@<X0>(const char *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v4 = (void *)swift_slowAlloc();
  sub_1000A2300();
  uint64_t v5 = String.utf8CString.getter();
  ssize_t v6 = getxattr(a1, (const char *)(v5 + 32), v4, 0x20uLL, 0, 0);
  swift_release();
  uint64_t result = swift_slowDealloc();
  *a2 = v6 > 0;
  return result;
}

uint64_t sub_100128030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for POSIXError();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.path.getter();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  int v10 = open(_:_:)();
  uint64_t v11 = swift_release();
  if (v10 < 0)
  {
    sub_1000D5EB4((uint64_t)v9);
    POSIXError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return swift_willThrow();
  }
  else
  {
    __chkstk_darwin(v11);
    *(&v13 - 4) = a2;
    *(&v13 - 3) = a3;
    *((_DWORD *)&v13 - 4) = v10;
    *(&v13 - 1) = a1;
    sub_100127D08((uint64_t (*)(void *))sub_100129A24, (uint64_t)(&v13 - 6), a2, a3);
    return close(v10);
  }
}

size_t sub_1001281D4(const char *a1, int a2)
{
  uint64_t v4 = type metadata accessor for POSIXError();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t result = strlen(a1);
  size_t v9 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    int v10 = (char *)swift_slowAlloc();
    strlcpy(v10, a1, v9);
    if (mkdtempat_np(a2, v10))
    {
      String.init(cString:)();
      URL.appendingPathComponent(_:)();
      swift_bridgeObjectRelease();
      return swift_slowDealloc();
    }
    else
    {
      sub_1000D5EB4((uint64_t)v7);
      POSIXError._nsError.getter();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_willThrow();
      return swift_slowDealloc();
    }
  }
  return result;
}

void sub_100128358()
{
  Swift::UInt64 v1 = v0;
  char v17 = 0;
  URL.path.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned __int8 v3 = [v0 fileExistsAtPath:v2 isDirectory:&v17];

  if (v3)
  {
    if (v17) {
      return;
    }
    _StringGuts.grow(_:)(21);
    uint64_t v5 = (void *)URL.path.getter();
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v16[0] = v5;
    v16[1] = v7;
    v8._object = (void *)0x8000000100149FE0;
    v8._countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v8);
    sub_100012E3C();
    swift_allocError();
    *(void *)uint64_t v9 = v5;
    *(void *)(v9 + 8) = v7;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_OWORD *)(v9 + 48) = 0u;
    *(void *)(v9 + 64) = 0;
    *(unsigned char *)(v9 + 72) = 19;
  }
  else
  {
    URL._bridgeToObjectiveC()(v4);
    uint64_t v11 = v10;
    sub_10001DB3C((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for FileAttributeKey();
    sub_100129C78(&qword_10017C608, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v16[0] = 0;
    unsigned int v13 = [v1 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:isa error:v16];

    if (v13)
    {
      id v14 = v16[0];
      return;
    }
    id v15 = v16[0];
    _convertNSErrorToError(_:)();
  }
  swift_willThrow();
}

uint64_t sub_100128590(uint64_t a1, uint64_t a2)
{
  return sub_1001285B0(a1, a2, (SEL *)&selRef_currentDirectoryPath, (uint64_t (*)(void))&static String._unconditionallyBridgeFromObjectiveC(_:));
}

uint64_t sub_1001285B0(uint64_t a1, uint64_t a2, SEL *a3, uint64_t (*a4)(void))
{
  id v6 = [*v4 *a3];
  uint64_t v7 = a4();

  return v7;
}

uint64_t sub_10012860C()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unsigned __int8 v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(fileURLWithPath:)();
  uint64_t v4 = Data.init(contentsOf:options:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void *sub_100128724(uint64_t a1, objc_class *a2, uint64_t a3)
{
  return sub_100128748(a1, a2, a3);
}

void *sub_100128748(uint64_t a1, Class isa, uint64_t a3)
{
  uint64_t v4 = v3;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  Swift::String v8 = v7;
  if (isa)
  {
    type metadata accessor for URLResourceKey();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
  }
  id v14 = 0;
  id v9 = [v4 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:isa options:a3 error:&v14];

  id v10 = v14;
  if (v9)
  {
    type metadata accessor for URL();
    uint64_t v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v11 = v10;
  }
  else
  {
    id v12 = v14;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v4;
}

char *sub_10012886C()
{
  return sub_10012A1DC();
}

id sub_100128884(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, Class a5)
{
  Swift::String v8 = *v5;
  NSString v9 = String._bridgeToObjectiveC()();
  if (a4 >> 60 == 15)
  {
    Class isa = 0;
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  if (a5)
  {
LABEL_5:
    type metadata accessor for FileAttributeKey();
    sub_100129C78(&qword_10017C608, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
    a5 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
LABEL_6:
  id v11 = [v8 createFileAtPath:v9 contents:isa attributes:a5];

  return v11;
}

id sub_100128984(uint64_t a1, char a2, objc_class *a3)
{
  return sub_1001289A8(a1, a2, a3);
}

id sub_1001289A8(uint64_t a1, char a2, Class isa)
{
  uint64_t v4 = v3;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  Swift::String v8 = v7;
  if (isa)
  {
    type metadata accessor for FileAttributeKey();
    sub_100129C78(&qword_10017C608, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  id v12 = 0;
  unsigned int v9 = [v4 createDirectoryAtURL:v8 withIntermediateDirectories:a2 & 1 attributes:isa error:&v12];

  if (v9) {
    return v12;
  }
  id v11 = v12;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t sub_100128AEC()
{
  return sub_100129B1C();
}

void sub_100128B04()
{
}

uint64_t sub_100128B28()
{
  return sub_100128B4C();
}

uint64_t sub_100128B4C()
{
  NSString v2 = String._bridgeToObjectiveC()();
  id v8 = 0;
  id v3 = [v0 attributesOfItemAtPath:v2 error:&v8];

  id v4 = v8;
  if (v3)
  {
    type metadata accessor for FileAttributeKey();
    sub_100129C78(&qword_10017C608, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
    uint64_t v1 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    id v5 = v4;
  }
  else
  {
    id v6 = v8;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_100128C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100128030(a1, a2, a3);
}

id sub_100128C90(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  return sub_100128CB4(a1, a2, a3, a4, a5, a6);
}

id sub_100128CB4(uint64_t a1, uint64_t a2, uint64_t a3, NSString a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  id v12 = v11;
  URL._bridgeToObjectiveC()(v13);
  id v15 = v14;
  if (a4) {
    a4 = String._bridgeToObjectiveC()();
  }
  id v19 = 0;
  unsigned int v16 = [v7 replaceItemAtURL:v12 withItemAtURL:v15 backupItemName:a4 options:a5 resultingItemURL:a6 error:&v19];

  if (v16) {
    return v19;
  }
  id v18 = v19;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id sub_100128DDC()
{
  return sub_100128E00();
}

id sub_100128E00()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v5 = 0;
  unsigned int v2 = [v0 removeItemAtPath:v1 error:&v5];

  if (v2) {
    return v5;
  }
  id v4 = v5;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id sub_100128EBC()
{
  return sub_100128EE0();
}

id sub_100128EE0()
{
  NSString v1 = v0;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  id v3 = v2;
  id v6 = 0;
  LODWORD(v1) = [v1 removeItemAtURL:v2 error:&v6];

  if (v1) {
    return v6;
  }
  id v5 = v6;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t sub_100128FA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(fileURLWithPath:)();
  uint64_t v6 = Data.init(contentsOf:options:)();
  uint64_t v8 = v7;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  a1[3] = (uint64_t)&type metadata for Data;
  a1[4] = (uint64_t)&off_100172AE0;
  *a1 = v6;
  a1[1] = v8;
  return result;
}

void *sub_1001290F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a2;
  uint64_t v7 = *v4;
  uint64_t v12 = a1;
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = 0x5858585858582ELL;
  v8._object = (void *)0xE700000000000000;
  String.append(_:)(v8);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = v7;
  unsigned int v9 = sub_100127BF4((uint64_t)sub_10012AB94, (uint64_t)v11, v12, v13);
  swift_bridgeObjectRelease();
  return v9;
}

id sub_1001291B4()
{
  return sub_1001291D8();
}

id sub_1001291D8()
{
  NSString v1 = String._bridgeToObjectiveC()();
  NSString v2 = String._bridgeToObjectiveC()();
  id v6 = 0;
  unsigned int v3 = [v0 createSymbolicLinkAtPath:v1 withDestinationPath:v2 error:&v6];

  if (v3) {
    return v6;
  }
  id v5 = v6;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id sub_1001292BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *v3;
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 fileExistsAtPath:v6 isDirectory:a3];

  return v7;
}

id sub_100129314()
{
  NSString v1 = *v0;
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 isExecutableFileAtPath:v2];

  return v3;
}

uint64_t sub_10012935C()
{
  uint64_t v0 = type metadata accessor for POSIXError();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = String.utf8CString.getter();
  id v5 = realpath_DARWIN_EXTSN((const char *)(v4 + 32), 0);
  swift_release();
  if (v5)
  {
    uint64_t v6 = String.init(utf8String:)();
    free(v5);
    return v6;
  }
  else
  {
    sub_1000D5EB4((uint64_t)v3);
    POSIXError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return swift_willThrow();
  }
}

double sub_100129494@<D0>(uint64_t a1@<X8>)
{
  return sub_1001294B8((SEL *)&selRef_fileHandleForReadingAtPath_, a1);
}

double sub_1001294A0@<D0>(uint64_t a1@<X8>)
{
  return sub_1001294B8((SEL *)&selRef_fileHandleForWritingAtPath_, a1);
}

double sub_1001294AC@<D0>(uint64_t a1@<X8>)
{
  return sub_1001294B8((SEL *)&selRef_fileHandleForUpdatingAtPath_, a1);
}

double sub_1001294B8@<D0>(SEL *a1@<X4>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRetain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [self *a1:v4];

  if (v5)
  {
    *(void *)(a2 + 24) = sub_10000483C(0, &qword_100180610);
    *(void *)(a2 + 32) = sub_10012A7E0(&qword_100180618);
    *(void *)a2 = v5;
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

double sub_10012958C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100127DE4(a1, a2, a3);
}

uint64_t sub_1001295A4@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = type metadata accessor for URLResourceValues();
  a1[4] = (uint64_t)&off_100173E28;
  sub_1000045E8(a1);
  uint64_t result = URL.resourceValues(forKeys:)();
  if (v1) {
    return sub_10008038C((uint64_t)a1);
  }
  return result;
}

uint64_t sub_10012961C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, copyfile_flags_t a5)
{
  return sub_1001298A8(a1, a2, a3, a4, a5);
}

uint64_t sub_100129634()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  if (result)
  {
    URL.withUnsafeFileSystemRepresentation<A>(_:)();
    return v1;
  }
  return result;
}

uint64_t sub_1001296A4(uint64_t a1, unint64_t a2)
{
  return sub_100129CC0(a1, a2) & 1;
}

uint64_t sub_1001296C0(uint64_t a1, unint64_t a2)
{
  return sub_100129EB4(a1, a2) & 1;
}

uint64_t sub_1001296E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v10[3] = a2;
  v10[4] = a3;
  uint64_t v6 = sub_1000045E8(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v6, v3, a2);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  sub_10000464C(a1, v7);
  return sub_100129778((uint64_t)v10, v7, v8);
}

uint64_t sub_100129778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000469C(a1, (uint64_t)v8);
  uint64_t v6 = sub_100004700(&qword_100180620);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + 40))(v8, v6, v6, a2);
  return sub_10000478C(a1);
}

uint64_t sub_1001297F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700(&qword_100180620);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 8) + 32);

  return v5(v4, v4, a1);
}

uint64_t sub_100129860(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

uint64_t sub_1001298A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, copyfile_flags_t a5)
{
  uint64_t v15 = type metadata accessor for POSIXError();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v9 = copyfile_state_alloc();
  copyfile_state_set(v9, 6u, sub_100127F84);
  uint64_t v10 = (const char *)(String.utf8CString.getter() + 32);
  uint64_t v11 = String.utf8CString.getter();
  int v12 = copyfile(v10, (const char *)(v11 + 32), v9, a5);
  swift_release();
  swift_release();
  if (v12)
  {
    sub_1000D5EB4((uint64_t)v8);
    POSIXError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
    swift_willThrow();
  }
  return copyfile_state_free(v9);
}

size_t sub_100129A24(const char *a1)
{
  return sub_1001281D4(a1, *(_DWORD *)(v1 + 32));
}

BOOL sub_100129A44(int a1, copyfile_state_t s)
{
  if (a1 != 5) {
    return 0;
  }
  uint64_t v8 = 0;
  if (copyfile_state_get(s, 9u, &v8)) {
    return 0;
  }
  BOOL result = v8;
  if (v8)
  {
    uint64_t v3 = String.init(cString:)();
    uint64_t v5 = v4;
    uint64_t v6 = sub_1000A230C();
    if (v3 == *v6 && v5 == v6[1])
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    return (v7 & 1) != 0;
  }
  return result;
}

uint64_t sub_100129B1C()
{
  uint64_t v0 = type metadata accessor for POSIXError();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.path.getter();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  String.utf8CString.getter();
  int v4 = rootless_mkdir_restricted();
  swift_release();
  uint64_t result = swift_release();
  if (v4 == -1)
  {
    sub_1000D5EB4((uint64_t)v3);
    POSIXError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_100129C78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100129CC0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for POSIXError();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(&v19, 0x878uLL);
  uint64_t v8 = sub_1000EE240(a1, a2);
  uint64_t v10 = v9;
  uint64_t v11 = String.utf8CString.getter();
  int v12 = statfs((const char *)(v11 + 32), &v19);
  swift_release();
  if (v12)
  {
    swift_bridgeObjectRelease();
    sub_1000D5EB4(v7);
    POSIXError._nsError.getter();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
    swift_willThrow();
  }
  else
  {
    KeyPath = (void *)swift_getKeyPath();
    uint64_t v14 = sub_1000F3C14(KeyPath, (uint64_t)&v19);
    uint64_t v16 = v15;
    swift_release();
    if (v14 == v8 && v16 == v10) {
      LOBYTE(v7) = 1;
    }
    else {
      LOBYTE(v7) = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7 & 1;
}

uint64_t sub_100129EB4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for POSIXError();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(&v14, 0x878uLL);
  sub_1000EE240(a1, a2);
  uint64_t v8 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  LODWORD(a2) = statfs((const char *)(v8 + 32), &v14);
  swift_release();
  if (a2)
  {
    sub_1000D5EB4(v7);
    POSIXError._nsError.getter();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
    swift_willThrow();
  }
  else
  {
    KeyPath = (void *)swift_getKeyPath();
    uint64_t v10 = sub_1000F3C14(KeyPath, (uint64_t)&v14);
    uint64_t v12 = v11;
    swift_release();
    if (v10 == 47 && v12 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v7) = 1;
    }
    else
    {
      LOBYTE(v7) = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
    }
  }
  return v7 & 1;
}

BOOL sub_10012A09C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = String.utf8CString.getter();
  int v5 = openat_authenticated_np(-2, (const char *)(v4 + 32), 0, -1);
  swift_release();
  if (v5 == -1)
  {
    static os_log_type_t.error.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100132F30;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_10002A1DC();
    *(void *)(v6 + 32) = a1;
    *(void *)(v6 + 40) = a2;
    swift_bridgeObjectRetain();
    int v7 = errno.getter();
    *(void *)(v6 + 96) = &type metadata for Int32;
    *(void *)(v6 + 104) = &protocol witness table for Int32;
    *(_DWORD *)(v6 + 72) = v7;
    sub_10000483C(0, (unint64_t *)&qword_10017D6F0);
    uint64_t v8 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
  }
  else if ((v5 & 0x80000000) == 0)
  {
    close(v5);
  }
  return v5 != -1;
}

char *sub_10012A1DC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v31 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004700((uint64_t *)&unk_10017FA60);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self defaultManager];
  uint64_t v10 = NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();

  if (v10)
  {
    uint64_t v30 = v0;
    NSEnumerator.makeIterator()();
    NSFastEnumerationIterator.next()();
    if (v35)
    {
      uint64_t v11 = v2;
      uint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
      uint64_t v13 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
      uint64_t v28 = v11;
      id v29 = (void (**)(char *, char *, uint64_t))(v11 + 32);
      statfs v14 = (char *)_swiftEmptyArrayStorage;
      while (1)
      {
        int v15 = swift_dynamicCast();
        uint64_t v16 = *v12;
        if (v15)
        {
          v16(v6, 0, 1, v1);
          if ((*v13)(v6, 1, v1) != 1)
          {
            id v27 = *v29;
            v27(v31, v6, v1);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              statfs v14 = (char *)sub_10000C4CC(0, *((void *)v14 + 2) + 1, 1, (unint64_t)v14);
            }
            unint64_t v18 = *((void *)v14 + 2);
            unint64_t v17 = *((void *)v14 + 3);
            unint64_t v19 = v18 + 1;
            if (v18 >= v17 >> 1)
            {
              unint64_t v26 = v18 + 1;
              uint64_t v20 = sub_10000C4CC(v17 > 1, v18 + 1, 1, (unint64_t)v14);
              unint64_t v19 = v26;
              statfs v14 = (char *)v20;
            }
            *((void *)v14 + 2) = v19;
            v27(&v14[((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v18], v31, v1);
            goto LABEL_13;
          }
        }
        else
        {
          v16(v6, 1, 1, v1);
        }
        sub_1000AAB74((uint64_t)v6);
LABEL_13:
        NSFastEnumerationIterator.next()();
        if (!v35) {
          goto LABEL_17;
        }
      }
    }
    statfs v14 = (char *)_swiftEmptyArrayStorage;
LABEL_17:
    (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v36);
  }
  else
  {
    unint64_t v33 = 0;
    unint64_t v34 = 0xE000000000000000;
    _StringGuts.grow(_:)(34);
    swift_bridgeObjectRelease();
    unint64_t v33 = 0xD000000000000020;
    unint64_t v34 = 0x8000000100150CF0;
    v21._countAndFlagsBits = URL.path.getter();
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    statfs v14 = (char *)v33;
    unint64_t v22 = v34;
    sub_100012E3C();
    swift_allocError();
    *(void *)uint64_t v23 = v14;
    *(void *)(v23 + 8) = v22;
    *(_OWORD *)(v23 + 16) = 0u;
    *(_OWORD *)(v23 + 32) = 0u;
    *(_OWORD *)(v23 + 48) = 0u;
    *(void *)(v23 + 64) = 0;
    *(unsigned char *)(v23 + 72) = 19;
    swift_willThrow();
  }
  return v14;
}

unint64_t sub_10012A640()
{
  unint64_t result = qword_100180628;
  if (!qword_100180628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180628);
  }
  return result;
}

unint64_t sub_10012A698()
{
  unint64_t result = qword_100180630;
  if (!qword_100180630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180630);
  }
  return result;
}

unint64_t sub_10012A6F0()
{
  unint64_t result = qword_100180638;
  if (!qword_100180638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180638);
  }
  return result;
}

unint64_t sub_10012A748()
{
  unint64_t result = qword_100180640;
  if (!qword_100180640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180640);
  }
  return result;
}

uint64_t sub_10012A79C(uint64_t a1)
{
  uint64_t result = sub_10012A7E0(&qword_100180648);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10012A7E0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000483C(255, &qword_100180610);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CopyFileFlags()
{
  return &type metadata for CopyFileFlags;
}

void *sub_10012A844@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(void *__return_ptr))(v1 + 16))(v6);
  if (!v2)
  {
    uint64_t v5 = v6[1];
    *a1 = v6[0];
    a1[1] = v5;
  }
  return result;
}

void *sub_10012A888(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x878uLL);
}

uint64_t sub_10012A890(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 2168)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10012A8B0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 2152) = 0u;
    *(_OWORD *)(result + 2136) = 0u;
    *(_OWORD *)(result + 2120) = 0u;
    *(_OWORD *)(result + 2104) = 0u;
    *(_OWORD *)(result + 2088) = 0u;
    *(_OWORD *)(result + 2072) = 0u;
    *(_OWORD *)(result + 2056) = 0u;
    *(_OWORD *)(result + 2040) = 0u;
    *(_OWORD *)(result + 2024) = 0u;
    *(_OWORD *)(result + 2008) = 0u;
    *(_OWORD *)(result + 1992) = 0u;
    *(_OWORD *)(result + 1976) = 0u;
    *(_OWORD *)(result + 1960) = 0u;
    *(_OWORD *)(result + 1944) = 0u;
    *(_OWORD *)(result + 1928) = 0u;
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 2168) = v3;
  return result;
}

void type metadata accessor for statfs(uint64_t a1)
{
}

void *sub_10012AB2C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_10012AB38(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10012AB58(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

void type metadata accessor for fsid(uint64_t a1)
{
}

uint64_t sub_10012AB94@<X0>(const char *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100127BD4(a1, a2);
}

uint64_t sub_10012ABC0()
{
  return URLResourceValues.fileSize.getter();
}

unint64_t sub_10012ABDC()
{
  return 0xD000000000000013;
}

uint64_t sub_10012ABF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_10012DD20(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_10012AC28(uint64_t a1)
{
  unint64_t v2 = sub_10012ACA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10012AC64(uint64_t a1)
{
  unint64_t v2 = sub_10012ACA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_10012ACA0()
{
  unint64_t result = qword_100198ED0[0];
  if (!qword_100198ED0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100198ED0);
  }
  return result;
}

uint64_t sub_10012ACF4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100004700(&qword_100180668);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036B0(a1, a1[3]);
  sub_10012ACA0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000478C((uint64_t)a1);
  }
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_10000478C((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_10012AE6C(void *a1)
{
  uint64_t v2 = sub_100004700(&qword_100180660);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036B0(a1, a1[3]);
  sub_10012ACA0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_10012AFA4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  int v33 = a5;
  uint64_t v14 = a1;
  uint64_t v15 = *(void *)(a6 - 8);
  __chkstk_darwin(a1);
  unint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v8, v18);
  if (a2)
  {
    unint64_t v19 = *(void (**)(char *, uint64_t))(v15 + 8);
    swift_bridgeObjectRetain();
    v19(v17, a6);
  }
  else
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 8))(a3, a4, a6, a7);
    a2 = v20;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a6);
    if (!a2)
    {
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v25 = 0xD000000000000046;
      unint64_t v24 = 0x8000000100150D70;
LABEL_9:
      *(void *)(v25 + 8) = v24;
      *(_OWORD *)(v25 + 16) = 0u;
      *(_OWORD *)(v25 + 32) = 0u;
      *(_OWORD *)(v25 + 48) = 0u;
      *(void *)(v25 + 64) = 0;
      *(unsigned char *)(v25 + 72) = 57;
      swift_willThrow();
      return v24;
    }
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(a7 + 32))(v14, a2, a3, a4, v33 & 1, 0, a6, a7);
  if (!v22)
  {
    uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 24))(v14, a2, a3, a4, a6, a7);
    if (!v23)
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
      _StringGuts.grow(_:)(76);
      v26._countAndFlagsBits = 0xD00000000000004ALL;
      v26._object = (void *)0x8000000100150DC0;
      String.append(_:)(v26);
      v27._countAndFlagsBits = v14;
      v27._object = a2;
      String.append(_:)(v27);
      swift_bridgeObjectRelease();
      uint64_t v28 = v31;
      unint64_t v24 = v32;
      sub_100012E3C();
      swift_allocError();
      *(void *)uint64_t v25 = v28;
      goto LABEL_9;
    }
  }
  unint64_t v24 = v21;
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t sub_10012B284()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = &v25[-v7];
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v0 + 88))(&v27, v6);
  if (!v28)
  {
    sub_1000130EC((uint64_t)&v27, &qword_10017F6A0);
    static os_log_type_t.error.getter();
    sub_10002A230();
    uint64_t v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();

    return 0;
  }
  sub_10000372C(&v27, (uint64_t)v30);
  URL.init(fileURLWithPath:isDirectory:)();
  sub_1000A221C();
  swift_bridgeObjectRetain();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(unsigned char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  uint64_t v10 = URL.path.getter();
  uint64_t v12 = v11;
  v9(v8, v1);
  char v26 = 0;
  uint64_t v13 = v31;
  uint64_t v14 = v32;
  sub_1000036B0(v30, v31);
  sub_1001297F4(v13, v14);
  uint64_t v15 = v28;
  uint64_t v16 = v29;
  sub_1000036B0(&v27, v28);
  LOBYTE(v13) = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v16 + 136))(v10, v12, &v26, v15, v16);
  sub_10000478C((uint64_t)&v27);
  if ((v13 & 1) == 0)
  {
    static os_log_type_t.debug.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100132F10;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 64) = sub_10002A1DC();
    *(void *)(v19 + 32) = v10;
    *(void *)(v19 + 40) = v12;
    sub_10002A230();
    uint64_t v20 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

    sub_10000478C((uint64_t)v30);
    return 0;
  }
  uint64_t v17 = sub_100004700(&qword_100180670);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v17 + 152))(v10, v12, v30);
  uint64_t v22 = swift_bridgeObjectRelease();
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v21 + 128))(&v27, v22);
  swift_release();
  uint64_t v23 = v27;
  sub_10000478C((uint64_t)v30);
  return v23;
}

uint64_t sub_10012B71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100004700((uint64_t *)&unk_10017FA60);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v31 - v13;
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v3 + 88))(&v34, v12);
  if (v35)
  {
    uint64_t v31 = a2;
    uint64_t v32 = a3;
    sub_10000372C(&v34, (uint64_t)v37);
    uint64_t v15 = v38;
    uint64_t v16 = v39;
    sub_1000036B0(v37, v38);
    sub_1001297F4(v15, v16);
    uint64_t v18 = v35;
    uint64_t v17 = v36;
    sub_1000036B0(&v34, v35);
    sub_100004700(&qword_10017E848);
    uint64_t v19 = swift_allocObject();
    long long v33 = xmmword_100132F10;
    *(_OWORD *)(v19 + 16) = xmmword_100132F10;
    *(void *)(v19 + 32) = NSURLIsDirectoryKey;
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 24);
    uint64_t v21 = NSURLIsDirectoryKey;
    uint64_t v23 = v20(a1, v19, 1, v18, v17);
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_10000478C((uint64_t)&v34);
    __chkstk_darwin(v24);
    *(&v31 - 4) = (uint64_t)v37;
    *(&v31 - 3) = v4;
    uint64_t v25 = v32;
    *(&v31 - 2) = v31;
    *(&v31 - 1) = v25;
    uint64_t v28 = sub_1000BFCCC((uint64_t (*)(char *))sub_10012E000, (uint64_t)(&v31 - 6), v23);
    swift_retain();
    sub_10012BB8C(v28, v4, v14);
    swift_bridgeObjectRelease();
    sub_10001BA68((uint64_t)v14, (uint64_t)v11, (uint64_t *)&unk_10017FA60);
    uint64_t v29 = type metadata accessor for URL();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v11, 1, v29) == 1)
    {
      sub_1000130EC((uint64_t)v14, (uint64_t *)&unk_10017FA60);
      sub_1000130EC((uint64_t)v11, (uint64_t *)&unk_10017FA60);
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v26 = URL.path.getter();
      sub_1000130EC((uint64_t)v14, (uint64_t *)&unk_10017FA60);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v29);
    }
    sub_10000478C((uint64_t)v37);
  }
  else
  {
    sub_1000130EC((uint64_t)&v34, &qword_10017F6A0);
    static os_log_type_t.error.getter();
    sub_10002A230();
    uint64_t v22 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();

    return 0;
  }
  return v26;
}

uint64_t sub_10012BB8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v25 = a3;
  uint64_t v33 = a2;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004700((uint64_t *)&unk_10017FA60);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v24 = a1;
  if (v11)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v30 = v5 + 16;
    uint64_t v31 = v12;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v14 = *(void *)(v5 + 72);
    uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
    uint64_t v27 = v14;
    uint64_t v28 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v26 = (void (**)(char *, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    uint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    unint64_t v23 = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      v31(v10, v13, v4);
      uint64_t v15 = *v32;
      (*v32)(v10, 0, 1, v4);
      if ((*v29)(v10, 1, v4) == 1) {
        break;
      }
      uint64_t v16 = *v28;
      (*v28)(v7, v10, v4);
      uint64_t v17 = URL.path.getter();
      (*(void (**)(uint64_t))(*(void *)v33 + 136))(v17);
      uint64_t v19 = v18;
      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v20 = v25;
        v16(v25, v7, v4);
        v15(v20, 0, 1, v4);
        return swift_release();
      }
      (*v26)(v7, v4);
      v13 += v27;
      if (!--v11) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    unint64_t v23 = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    swift_bridgeObjectRetain();
LABEL_8:
    v15(v10, 1, 1, v4);
  }
  swift_bridgeObjectRelease();
  v15(v25, 1, 1, v4);
  return swift_release();
}

uint64_t sub_10012BEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v45 - v11;
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v2 + 88))(&v52, v10);
  if (v53)
  {
    sub_10000372C(&v52, (uint64_t)v55);
    URL.init(fileURLWithPath:)();
    sub_1000A2228();
    uint64_t v47 = a2;
    swift_bridgeObjectRetain();
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v48 = v6 + 8;
    v13(v9, v5);
    uint64_t v14 = URL.path.getter();
    uint64_t v16 = v15;
    v13(v12, v5);
    uint64_t v17 = v56;
    uint64_t v18 = v57;
    sub_1000036B0(v55, v56);
    sub_1001297F4(v17, v18);
    uint64_t v46 = a1;
    uint64_t v19 = v5;
    uint64_t v20 = v53;
    uint64_t v21 = v54;
    sub_1000036B0(&v52, v53);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 152);
    uint64_t v49 = v14;
    uint64_t v50 = v16;
    uint64_t v24 = v22(v14, v16, v20, v21);
    uint64_t v26 = v25;
    uint64_t v27 = v49;
    uint64_t v45 = v19;
    uint64_t v28 = v50;
    sub_10000478C((uint64_t)&v52);
    if (v26)
    {
      swift_bridgeObjectRelease();
      URL.init(fileURLWithPath:)();
      sub_1000A2234();
      swift_bridgeObjectRetain();
      URL.appendingPathComponent(_:)();
      swift_bridgeObjectRelease();
      uint64_t v29 = v45;
      v13(v9, v45);
      uint64_t v30 = URL.path.getter();
      uint64_t v32 = v31;
      v13(v12, v29);
      v51[0] = 0;
      uint64_t v33 = v56;
      uint64_t v34 = v57;
      sub_1000036B0(v55, v56);
      sub_1001297F4(v33, v34);
      uint64_t v35 = v53;
      uint64_t v36 = v54;
      sub_1000036B0(&v52, v53);
      if (((*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v36 + 136))(v30, v32, v51, v35, v36) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        sub_10000478C((uint64_t)&v52);
        goto LABEL_10;
      }
      char v37 = v51[0];
      sub_10000478C((uint64_t)&v52);
      if (v37)
      {
        swift_bridgeObjectRelease();
LABEL_10:
        static os_log_type_t.error.getter();
        sub_100004700((uint64_t *)&unk_10017D6E0);
        uint64_t v40 = swift_allocObject();
        *(_OWORD *)(v40 + 16) = xmmword_100132F30;
        *(void *)(v40 + 56) = &type metadata for String;
        unint64_t v41 = sub_10002A1DC();
        uint64_t v42 = v47;
        *(void *)(v40 + 32) = v46;
        *(void *)(v40 + 40) = v42;
        *(void *)(v40 + 96) = &type metadata for String;
        *(void *)(v40 + 104) = v41;
        *(void *)(v40 + 64) = v41;
        *(void *)(v40 + 72) = v30;
        *(void *)(v40 + 80) = v32;
        sub_10002A230();
        swift_bridgeObjectRetain();
        uint64_t v43 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();
        swift_bridgeObjectRelease();

        sub_10000478C((uint64_t)v55);
        return 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      static os_log_type_t.error.getter();
      sub_100004700((uint64_t *)&unk_10017D6E0);
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = xmmword_100132F10;
      *(void *)(v38 + 56) = &type metadata for String;
      *(void *)(v38 + 64) = sub_10002A1DC();
      *(void *)(v38 + 32) = v27;
      *(void *)(v38 + 40) = v28;
      sub_10002A230();
      uint64_t v39 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
    }
    sub_10000478C((uint64_t)v55);
    return v24;
  }
  sub_1000130EC((uint64_t)&v52, &qword_10017F6A0);
  static os_log_type_t.error.getter();
  sub_10002A230();
  unint64_t v23 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  return 0;
}

uint64_t sub_10012C4BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v21 - v15;
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 120))(a3, a4);
  if (v18)
  {
    URL.init(fileURLWithPath:isDirectory:)();
    swift_bridgeObjectRelease();
    sub_1000A21EC();
    swift_bridgeObjectRetain();
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
    v19(v14, v10);
    uint64_t v17 = sub_10012B71C((uint64_t)v16, a1, a2);
    v19(v16, v10);
  }
  return v17;
}

uint64_t sub_10012C680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v7 = v6;
  uint64_t v95 = a1;
  uint64_t v96 = a3;
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v22 = (char *)v77 - v21;
  __chkstk_darwin(v20);
  uint64_t v27 = (char *)v77 - v26;
  if (a5)
  {
    uint64_t v89 = v25;
    uint64_t v90 = v24;
    unint64_t v92 = v16;
    uint64_t v93 = v23;
    int v91 = a6;
    URL.init(fileURLWithPath:)();
    sub_1000A2210();
    uint64_t v28 = v7;
    uint64_t v29 = a2;
    swift_bridgeObjectRetain();
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    uint64_t v94 = a4;
    uint64_t v30 = v13;
    uint64_t v33 = *(void (**)(char *, uint64_t))(v13 + 8);
    uint64_t v32 = v13 + 8;
    uint64_t v31 = v33;
    v33(v22, v12);
    uint64_t v34 = sub_10012B71C((uint64_t)v27, v95, a2);
    if (v35)
    {
      uint64_t v36 = v34;
      v31(v27, v12);
      return v36;
    }
    uint64_t v86 = v30;
    LODWORD(v88) = static os_log_type_t.error.getter();
    uint64_t v83 = sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v37 = swift_allocObject();
    long long v82 = xmmword_100132F10;
    *(_OWORD *)(v37 + 16) = xmmword_100132F10;
    uint64_t v38 = URL.path.getter();
    uint64_t v40 = v39;
    *(void *)(v37 + 56) = &type metadata for String;
    unint64_t v81 = sub_10002A1DC();
    *(void *)(v37 + 64) = v81;
    *(void *)(v37 + 32) = v38;
    *(void *)(v37 + 40) = v40;
    unint64_t v80 = sub_10002A230();
    unint64_t v41 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

    URL.init(fileURLWithPath:)();
    uint64_t v42 = sub_1000A2204();
    unint64_t v87 = v27;
    uint64_t v43 = v42;
    swift_bridgeObjectRetain();
    uint64_t v44 = v28;
    uint64_t v45 = v93;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    uint64_t v88 = v32;
    v31(v22, v12);
    uint64_t v84 = v29;
    uint64_t v85 = v44;
    uint64_t v46 = sub_10012B71C(v45, v95, v29);
    uint64_t v47 = v94;
    if (v48)
    {
      uint64_t v36 = v46;
      v31((char *)v45, v12);
      v31(v87, v12);
      return v36;
    }
    v77[1] = v43;
    uint64_t v78 = v12;
    unint64_t v79 = (void (*)(uint64_t, uint64_t))v31;
    static os_log_type_t.error.getter();
    uint64_t v49 = v47;
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = v82;
    uint64_t v51 = URL.path.getter();
    unint64_t v52 = v81;
    *(void *)(v50 + 56) = &type metadata for String;
    *(void *)(v50 + 64) = v52;
    *(void *)(v50 + 32) = v51;
    *(void *)(v50 + 40) = v53;
    uint64_t v54 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

    Swift::String v55 = v87;
    if ((v96 != 47 || v49 != 0xE100000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v56 = v89;
      URL.init(fileURLWithPath:)();
      swift_bridgeObjectRetain();
      URL.appendingPathComponent(_:)();
      swift_bridgeObjectRelease();
      uint64_t v57 = v56;
      uint64_t v58 = v78;
      uint64_t v59 = v79;
      v79(v57, v78);
      uint64_t v60 = v93;
      v59(v93, v58);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 32))(v60, v90, v58);
      uint64_t v61 = sub_10012B71C(v60, v95, v84);
      if (v62)
      {
        uint64_t v36 = v61;
        v59(v60, v58);
        v59((uint64_t)v55, v58);
        return v36;
      }
      static os_log_type_t.error.getter();
      uint64_t v63 = swift_allocObject();
      *(_OWORD *)(v63 + 16) = v82;
      uint64_t v64 = URL.path.getter();
      unint64_t v65 = v81;
      *(void *)(v63 + 56) = &type metadata for String;
      *(void *)(v63 + 64) = v65;
      *(void *)(v63 + 32) = v64;
      *(void *)(v63 + 40) = v66;
      uint64_t v67 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = v78;
    unint64_t v68 = (void (*)(char *, uint64_t))v79;
    v79(v93, v78);
    v68(v55, v12);
    uint64_t v13 = v86;
    a2 = v84;
    uint64_t v16 = v92;
    if (v91) {
      return 0;
    }
  }
  URL.init(fileURLWithPath:)();
  sub_1000A21F8();
  swift_bridgeObjectRetain();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  uint64_t v69 = *(void (**)(char *, uint64_t))(v13 + 8);
  v69(v22, v12);
  uint64_t v36 = sub_10012B71C((uint64_t)v16, v95, a2);
  if (!v70)
  {
    static os_log_type_t.error.getter();
    sub_100004700((uint64_t *)&unk_10017D6E0);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_100132F10;
    uint64_t v72 = URL.path.getter();
    uint64_t v74 = v73;
    *(void *)(v71 + 56) = &type metadata for String;
    *(void *)(v71 + 64) = sub_10002A1DC();
    *(void *)(v71 + 32) = v72;
    *(void *)(v71 + 40) = v74;
    sub_10002A230();
    uint64_t v75 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
  }
  v69(v16, v12);
  return v36;
}

uint64_t sub_10012CDCC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_10012CE10()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_10012CE54()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t sub_10012CE98()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152))();
}

unint64_t sub_10012CEDC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return sub_10012AFA4(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10012CEF4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t sub_10012CF38()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v23[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = &v23[-v7];
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v0 + 88))(&v25, v6);
  if (!v26)
  {
    sub_1000130EC((uint64_t)&v25, &qword_10017F6A0);
    static os_log_type_t.error.getter();
    sub_10002A230();
    uint64_t v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();

    return 0;
  }
  sub_10000372C(&v25, (uint64_t)v28);
  URL.init(fileURLWithPath:isDirectory:)();
  sub_1000A221C();
  swift_bridgeObjectRetain();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(unsigned char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  uint64_t v10 = URL.path.getter();
  uint64_t v12 = v11;
  v9(v8, v1);
  char v24 = 0;
  uint64_t v13 = v29;
  uint64_t v14 = v30;
  sub_1000036B0(v28, v29);
  sub_1001297F4(v13, v14);
  uint64_t v15 = v26;
  uint64_t v16 = v27;
  sub_1000036B0(&v25, v26);
  LOBYTE(v13) = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v16 + 136))(v10, v12, &v24, v15, v16);
  sub_10000478C((uint64_t)&v25);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_10000478C((uint64_t)v28);
    return 0;
  }
  uint64_t v17 = sub_100004700(&qword_100180670);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v17 + 152))(v10, v12, v28);
  uint64_t v20 = swift_bridgeObjectRelease();
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v19 + 128))(&v25, v20);
  swift_release();
  uint64_t v21 = v25;
  sub_10000478C((uint64_t)v28);
  return v21;
}

uint64_t sub_10012D348()
{
  return sub_10012D448();
}

uint64_t sub_10012D358()
{
  static os_log_type_t.info.getter();
  sub_10002A230();
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  return 0;
}

uint64_t sub_10012D3C8()
{
  static os_log_type_t.info.getter();
  sub_10002A230();
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  return 0;
}

uint64_t sub_10012D438()
{
  return sub_10012D448();
}

uint64_t sub_10012D448()
{
  static os_log_type_t.info.getter();
  sub_10002A230();
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  return 0;
}

uint64_t sub_10012D4C4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_10012D508()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_10012D54C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t sub_10012D590()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t sub_10012D5D4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t sub_10012D618(uint64_t a1, uint64_t a2)
{
  return sub_10012D8EC(a1, a2, 0xD000000000000015, 0x80000001001511B0);
}

uint64_t sub_10012D634(uint64_t a1, uint64_t a2)
{
  return sub_10012D8EC(a1, a2, 0xD00000000000001BLL, 0x80000001001511D0);
}

uint64_t sub_10012D650()
{
  os_log_type_t v0 = static os_log_type_t.error.getter();
  sub_10002A230();
  uint64_t v1 = static OS_os_log.default.getter();
  if (os_log_type_enabled(v1, v0))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_100003F90(0xD000000000000025, 0x80000001001511F0, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v0, "Unexpected call to %s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_10012D790()
{
  os_log_type_t v0 = static os_log_type_t.error.getter();
  sub_10002A230();
  uint64_t v1 = static OS_os_log.default.getter();
  if (os_log_type_enabled(v1, v0))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_100003F90(0xD00000000000004BLL, 0x8000000100151220, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v0, "Unexpected call to %s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_10012D8D0(uint64_t a1, uint64_t a2)
{
  return sub_10012D8EC(a1, a2, 0xD00000000000001BLL, 0x8000000100151270);
}

uint64_t sub_10012D8EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  os_log_type_t v6 = static os_log_type_t.error.getter();
  sub_10002A230();
  uint64_t v7 = static OS_os_log.default.getter();
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_100003F90(a3, a4, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v6, "Unexpected call to %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_10012DA2C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 80))();
}

uint64_t sub_10012DA70()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t sub_10012DAB4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96))();
}

uint64_t sub_10012DAF8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104))();
}

uint64_t sub_10012DB3C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_10012DB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000469C(a1, (uint64_t)v8);
  uint64_t v6 = sub_100004700(&qword_100180678);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + 40))(v8, v6, v6, a2);
  return sub_10000478C(a1);
}

uint64_t sub_10012DBFC(uint64_t a1)
{
  uint64_t v2 = v1;
  v7[3] = type metadata accessor for MinimalDeveloperKitClient();
  void v7[4] = &off_100173E98;
  v7[0] = v1;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  sub_10000464C(a1, v4);
  swift_retain();
  sub_10012DB80((uint64_t)v7, v4, v5);
  sub_10000469C(a1, (uint64_t)v7);
  return (*(uint64_t (**)(void *))(*(void *)v2 + 96))(v7);
}

uint64_t sub_10012DCB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700(&qword_100180678);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 8) + 32);

  return v5(v4, v4, a1);
}

uint64_t sub_10012DD20(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000100151320)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t type metadata accessor for RealDeveloperKitClient()
{
  return self;
}

uint64_t type metadata accessor for MinimalDeveloperKitClient()
{
  return self;
}

ValueMetadata *type metadata accessor for BuildVersionPlist()
{
  return &type metadata for BuildVersionPlist;
}

uint64_t type metadata accessor for NullDeveloperKitClient()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for BuildVersionPlist.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10012DEC0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BuildVersionPlist.CodingKeys()
{
  return &type metadata for BuildVersionPlist.CodingKeys;
}

unint64_t sub_10012DEFC()
{
  unint64_t result = qword_1001990E0[0];
  if (!qword_1001990E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001990E0);
  }
  return result;
}

unint64_t sub_10012DF54()
{
  unint64_t result = qword_1001991F0;
  if (!qword_1001991F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001991F0);
  }
  return result;
}

unint64_t sub_10012DFAC()
{
  unint64_t result = qword_1001991F8[0];
  if (!qword_1001991F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001991F8);
  }
  return result;
}

uint64_t sub_10012E000(uint64_t a1)
{
  unsigned int v4 = (void *)v1[2];
  uint64_t v29 = v1[3];
  uint64_t v5 = v1[5];
  uint64_t v22 = v1[4];
  uint64_t v6 = v4[3];
  uint64_t v7 = v4[4];
  sub_1000036B0(v4, v6);
  sub_1001297F4(v6, v7);
  uint64_t v8 = v24;
  uint64_t v9 = v25;
  sub_1000036B0(v23, v24);
  sub_100004700(&qword_10017E848);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100132F10;
  *(void *)(inited + 32) = NSURLIsDirectoryKey;
  uint64_t v11 = NSURLIsDirectoryKey;
  uint64_t v12 = sub_1000A0DCC(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey();
  swift_arrayDestroy();
  (*(void (**)(void *__return_ptr, uint64_t, void *, uint64_t, uint64_t))(v9 + 192))(v26, a1, v12, v8, v9);
  swift_bridgeObjectRelease();
  sub_10000478C((uint64_t)v23);
  if (!v2)
  {
    uint64_t v13 = v29;
    uint64_t v14 = v5;
    uint64_t v15 = v27;
    uint64_t v16 = v28;
    sub_1000036B0(v26, v27);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16) & 1) != 0
      && (uint64_t v17 = URL.path.getter(),
          uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 112))(v17),
          uint64_t v20 = v19,
          swift_bridgeObjectRelease(),
          v20))
    {
      if (v18 == v22 && v20 == v14) {
        LOBYTE(v12) = 1;
      }
      else {
        LOBYTE(v12) = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      LOBYTE(v12) = 0;
    }
    sub_10000478C((uint64_t)v26);
  }
  return v12 & 1;
}

uint64_t sub_10012E22C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v10[3] = a2;
  v10[4] = a3;
  uint64_t v6 = sub_1000045E8(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v6, v3, a2);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  sub_10000464C(a1, v7);
  return sub_10012E2C4((uint64_t)v10, v7, v8);
}

uint64_t sub_10012E2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000469C(a1, (uint64_t)v8);
  uint64_t v6 = sub_100004700(&qword_10017F118);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + 40))(v8, v6, v6, a2);
  return sub_10000478C(a1);
}

uint64_t sub_10012E340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700(&qword_10017F118);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 8) + 32);

  return v5(v4, v4, a1);
}

uint64_t sub_10012E3AC()
{
  return swift_retain();
}

uint64_t sub_10012E3E4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 64) = a1;
  return swift_release();
}

uint64_t sub_10012E42C()
{
  *(void *)(swift_allocObject() + 64) = 0;
  uint64_t v0 = (uint64_t *)DriverKitDaemonXPC.NotificationType.approvalsChanged.unsafeMutableAddressor();
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain_n();
  return sub_100086A00(v1, v2, v1, (uint64_t)v2);
}

void sub_10012E490()
{
}

uint64_t sub_10012E4C0()
{
  return swift_release();
}

uint64_t sub_10012E4C8()
{
  uint64_t v0 = sub_1000871D4();
  swift_release();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t sub_10012E510()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)v0 + 216);
  uint64_t v2 = swift_retain();
  return v1(v2);
}

uint64_t type metadata accessor for RealApprovalsXPCPublisher()
{
  return self;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_10012E9D4(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_10012E9D4(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  long long v5 = &v4[v3];
  long long v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    long long v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      long long v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            double result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          double result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  double result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    long long v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  memset(v12, 170, sizeof(v12));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

_DWORD *DEREncoderCreate(int a1)
{
  uint64_t result = calloc(1uLL, 0x10uLL);
  if (result) {
    result[3] = a1;
  }
  return result;
}

void DEREncoderDestroy(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2)
    {
      do
      {
        unint64_t v3 = (void *)*v2;
        sub_10012FD7C((uint64_t)v2);
        unint64_t v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t DEREncoderAddData(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  unint64_t v7 = sub_10012F624(a2, a3, a4, a5, a6, 3);

  return sub_10012F4B0(a1, (uint64_t)v7);
}

uint64_t sub_10012F4B0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a1)
  {
    uint64_t v22 = 1;
    if (!a2) {
      return v22;
    }
    goto LABEL_30;
  }
  if (!a2) {
    return 2;
  }
  int v4 = *((_DWORD *)a1 + 2);
  uint64_t v5 = a2;
  do
  {
    int v6 = *(_DWORD *)(v5 + 20);
    BOOL v7 = __CFADD__(v4, v6);
    int v8 = v4 + v6;
    if (v7 || (v9 = *(_DWORD *)(v5 + 24), int v4 = v8 + v9, __CFADD__(v8, v9)))
    {
      uint64_t v22 = 2;
      do
      {
LABEL_30:
        uint64_t v23 = *(void *)v2;
        sub_10012FD7C(v2);
        uint64_t v2 = v23;
      }
      while (v23);
      return v22;
    }
    uint64_t v5 = *(void *)v5;
  }
  while (v5);
  unint64_t v10 = (uint64_t *)*a1;
  unint64_t v11 = a1;
  if (!*a1) {
    goto LABEL_26;
  }
  int v12 = *((_DWORD *)a1 + 3);
  unint64_t v11 = a1;
  while (2)
  {
    unsigned __int16 v13 = v11;
    unint64_t v11 = v10;
    if (!v12) {
      goto LABEL_20;
    }
    unint64_t v14 = bswap64(*(void *)(v2 + 28));
    unint64_t v15 = bswap64(*(uint64_t *)((char *)v11 + 28));
    if (v14 != v15 || (unint64_t v14 = bswap64(*(void *)(v2 + 36)), v15 = bswap64(*(uint64_t *)((char *)v11 + 36)), v14 != v15))
    {
      if (v14 < v15) {
        int v16 = -1;
      }
      else {
        int v16 = 1;
      }
LABEL_19:
      if (v16 < 0) {
        break;
      }
      goto LABEL_20;
    }
    unsigned int v17 = *(_DWORD *)(v2 + 24);
    unsigned int v18 = *((_DWORD *)v11 + 6);
    if (v17 >= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    int v16 = memcmp(*(const void **)(v2 + 8), (const void *)v11[1], v19);
    if (v16) {
      goto LABEL_19;
    }
    if (v17 >= v18)
    {
LABEL_20:
      unint64_t v10 = (uint64_t *)*v11;
      if (!*v11) {
        goto LABEL_26;
      }
      continue;
    }
    break;
  }
  long long v20 = (void *)v2;
  do
  {
    uint64_t v21 = v20;
    long long v20 = (void *)*v20;
  }
  while (v20);
  *uint64_t v21 = v11;
  unint64_t v11 = v13;
LABEL_26:
  uint64_t v22 = 0;
  *unint64_t v11 = v2;
  *((_DWORD *)a1 + 2) = v4;
  return v22;
}

char *sub_10012F624(unsigned int a1, unsigned int a2, const void *a3, unsigned int a4, int a5, int a6)
{
  if (!a3 && a4 && a6) {
    return 0;
  }
  int v12 = (char *)calloc(1uLL, 0x38uLL);
  unsigned __int16 v13 = v12;
  if (!v12) {
    return v13;
  }
  *((_DWORD *)v12 + 4) = 1;
  unint64_t v14 = v12 + 28;
  if (a1 == 259)
  {
    int v15 = 0;
    goto LABEL_7;
  }
  if (a1 > 3) {
    goto LABEL_40;
  }
  if (a2 > 0x1E)
  {
    uint64_t v17 = 0;
    uint64_t v28 = 0;
    do
    {
      *((unsigned char *)&v28 + v17++) = a2 & 0x7F;
      BOOL v18 = a2 > 0x7F;
      a2 >>= 7;
    }
    while (v18);
    int v16 = v13 + 28;
    if ((v17 & 0xFFFFFFF0) == 0)
    {
      v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | 0x1F;
      size_t v19 = v13 + 29;
      if (v17 >= 2)
      {
        uint64_t v20 = v17 - 1;
        do
          *v19++ = *((unsigned char *)&v28 + v20--) | 0x80;
        while (v20);
      }
      *size_t v19 = v28;
      int v16 = v19 + 1;
    }
  }
  else
  {
    v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | a2;
    int v16 = v13 + 29;
  }
  int v21 = v16 - v14;
  if (!v21) {
    goto LABEL_40;
  }
  uint64_t v22 = &v14[v21];
  if (a4 > 0x7F)
  {
    uint64_t v24 = 0;
    uint64_t v28 = 0;
    unsigned int v25 = a4;
    do
    {
      *((unsigned char *)&v28 + v24++) = v25;
      BOOL v18 = v25 > 0xFF;
      v25 >>= 8;
    }
    while (v18);
    if (16 - v21 <= v24)
    {
      LODWORD(v23) = v14 + v21;
    }
    else
    {
      *uint64_t v22 = v24 | 0x80;
      uint64_t v23 = v22 + 1;
      if (v24)
      {
        do
          *v23++ = *((unsigned char *)&v28 + --v24);
        while (v24);
      }
    }
  }
  else
  {
    LODWORD(v23) = v14 + v21;
    if (v21 != 16)
    {
      *uint64_t v22 = a4;
      LODWORD(v23) = v22 + 1;
    }
  }
  int v26 = v23 - v22;
  if (v23 == v22)
  {
LABEL_40:
    free(v13);
    return 0;
  }
  unint64_t v14 = &v22[v26];
  int v15 = v21 + v26;
LABEL_7:
  *((_DWORD *)v13 + 5) = v15;
  switch(a6)
  {
    case 0:
      *((void *)v13 + 1) = 0;
      *((void *)v13 + 6) = 0;
      *((_DWORD *)v13 + 6) = 0;
      return v13;
    case 1:
      *((void *)v13 + 1) = a3;
      *((void *)v13 + 6) = 0;
      goto LABEL_25;
    case 2:
      *((void *)v13 + 1) = a3;
      *((void *)v13 + 6) = v13;
LABEL_25:
      *((_DWORD *)v13 + 6) = a4;
      return v13;
    case 3:
      if (v13 + 56 - v14 >= a4)
      {
        *((void *)v13 + 1) = v14;
        *((_DWORD *)v13 + 6) = a4;
      }
      else
      {
        unint64_t v14 = (char *)malloc(a4);
        *((void *)v13 + 1) = v14;
        *((void *)v13 + 6) = v13;
        *((_DWORD *)v13 + 6) = a4;
        if (!v14) {
          goto LABEL_40;
        }
      }
      memcpy(v14, a3, a4);
      break;
    default:
      return v13;
  }
  return v13;
}

uint64_t DEREncoderAddDataNoCopy(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  BOOL v7 = sub_10012F624(a2, a3, a4, a5, a6, 1);

  return sub_10012F4B0(a1, (uint64_t)v7);
}

uint64_t DEREncoderAddUInt32(uint64_t *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v5 = 0;
  unsigned int v10 = bswap32(a4);
  char v11 = 0;
  unsigned int v12 = v10;
  while (!*((unsigned char *)&v10 + v5))
  {
    if (++v5 == 4)
    {
      int v6 = 0;
      goto LABEL_6;
    }
  }
  int v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 4;
LABEL_6:
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = sub_10012F624(a2, a3, &v11 - v7 + 5, v7, 0, 3);
  return sub_10012F4B0(a1, (uint64_t)v8);
}

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, void *a2, unsigned int *a3)
{
  if (!a1) {
    return 1;
  }
  unsigned int v6 = *((_DWORD *)a1 + 2);
  uint64_t v7 = (char *)malloc(v6);
  if (!v7) {
    return 2;
  }
  int v8 = v7;
  int v9 = (uint64_t **)*a1;
  if (*a1)
  {
    unsigned int v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      char v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      unsigned int v10 = &v11[*((unsigned int *)v9 + 6)];
      int v9 = (uint64_t **)*v9;
    }
    while (v9);
  }
  if (a3) {
    *a3 = v6;
  }
  if (a2)
  {
    uint64_t result = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return result;
}

uint64_t sub_10012FAD8(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v13 = 0;
  unsigned int v12 = 0;
  uint64_t v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!v9)
  {
    uint64_t v9 = 2;
    unsigned int v10 = sub_10012F624(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      unsigned int v12 = 0;
      uint64_t v9 = sub_10012F4B0(a2, (uint64_t)v10);
    }
  }
  if (v12) {
    free(v12);
  }
  return v9;
}

uint64_t DEREncoderAddDataFromEncoderNoCopy(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 12))
    {
      return sub_10012FAD8((uint64_t **)a1, (uint64_t *)a2, a3, a4, a5);
    }
    else
    {
      int v8 = sub_10012F624(a3, a4, 0, *(_DWORD *)(a1 + 8), 1, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        unsigned int v10 = *(uint64_t **)a1;
        int v21 = 0;
        char v11 = &v21;
        while (v10)
        {
          unsigned int v12 = malloc(0x38uLL);
          if (!v12)
          {
            uint64_t v17 = v21;
            if (v21)
            {
              do
              {
                BOOL v18 = (void *)*v17;
                sub_10012FD7C((uint64_t)v17);
                uint64_t v17 = v18;
              }
              while (v18);
            }
            *(void *)uint64_t v9 = 0;
            goto LABEL_22;
          }
          uint64_t v13 = v10[6];
          long long v15 = *((_OWORD *)v10 + 1);
          long long v14 = *((_OWORD *)v10 + 2);
          *unsigned int v12 = *(_OWORD *)v10;
          v12[1] = v15;
          *((void *)v12 + 6) = v13;
          void v12[2] = v14;
          *(void *)unsigned int v12 = 0;
          *((_DWORD *)v12 + 4) = 1;
          unint64_t v16 = v10[1];
          if ((unint64_t)v10 + 28 > v16 || v16 >= (unint64_t)(v10 + 7))
          {
            if (v13) {
              ++*(_DWORD *)(v13 + 16);
            }
          }
          else
          {
            *((void *)v12 + 1) = (char *)v12 + v16 - (void)v10;
          }
          *char v11 = v12;
          unsigned int v10 = (uint64_t *)*v10;
          char v11 = v12;
        }
        size_t v19 = v21;
        *(void *)uint64_t v9 = v21;
        if (v19) {
          goto LABEL_26;
        }
LABEL_22:
        if (*(void *)a1)
        {
          do
          {
            uint64_t v20 = *(char **)v9;
            sub_10012FD7C((uint64_t)v9);
            uint64_t v9 = v20;
          }
          while (v20);
          return 2;
        }
LABEL_26:
        return sub_10012F4B0((uint64_t *)a2, (uint64_t)v9);
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void sub_10012FD7C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    unint64_t v3 = *(void **)(a1 + 8);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      BOOL v5 = (unint64_t)v3 >= a1 + 56 || a1 + 28 > (unint64_t)v3;
      if (v5 && v4 != 0)
      {
        if (v4 == a1) {
          free(v3);
        }
        else {
          sub_10012FD7C(*(void *)(a1 + 48));
        }
      }
    }
    free((void *)a1);
  }
}

uint64_t Img4EncodeCreatePayload(const char *a1, const char *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, void *a7, unsigned int *a8)
{
  int v8 = 0;
  uint64_t v9 = 101;
  if (!a1 || !a2)
  {
    unsigned int v12 = 0;
    goto LABEL_16;
  }
  unsigned int v12 = 0;
  if (a3)
  {
    if (strlen(a1) != 4)
    {
      int v8 = 0;
      unsigned int v12 = 0;
      goto LABEL_16;
    }
    int v8 = (uint64_t *)DEREncoderCreate(0);
    if (v8)
    {
      unsigned int v12 = (uint64_t **)DEREncoderCreate(0);
      if (v12)
      {
        uint64_t v18 = DEREncoderAddData(v8, 0, 0x16u, "IM4P", 4u, 0);
        if (v18
          || (uint64_t v18 = DEREncoderAddData(v8, 0, 0x16u, a1, 4u, 0), v18)
          || (v19 = strlen(a2), uint64_t v18 = DEREncoderAddData(v8, 0, 0x16u, a2, v19, 0), v18)
          || (uint64_t v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a3, a4, 0), v18)
          || a5 && (uint64_t v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a5, a6, 0), v18)
          || (uint64_t v18 = DEREncoderAddDataFromEncoderNoCopy((uint64_t)v8, (uint64_t)v12, 0, 0x10u, 1), v18))
        {
          uint64_t v9 = v18;
        }
        else
        {
          unsigned int EncodedBuffer = DEREncoderCreateEncodedBuffer(v12, a7, a8);
          if (EncodedBuffer) {
            uint64_t v9 = EncodedBuffer;
          }
          else {
            uint64_t v9 = 100;
          }
        }
        goto LABEL_16;
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
    uint64_t v9 = 2;
  }
LABEL_16:
  DEREncoderDestroy((void **)v8);
  DEREncoderDestroy(v12);
  return v9;
}

void sub_10012FFD4(void *a1)
{
  int v1 = [a1 localizedFailureReason];
  int v2 = 138543362;
  unint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to submit job: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10013006C(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 state];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Job submitted but not running: %d", (uint8_t *)v1, 8u);
}

uint64_t POSIXError._nsError.getter()
{
  return POSIXError._nsError.getter();
}

uint64_t type metadata accessor for POSIXError()
{
  return type metadata accessor for POSIXError();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t URLResourceValues.isDirectory.getter()
{
  return URLResourceValues.isDirectory.getter();
}

uint64_t URLResourceValues.creationDate.getter()
{
  return URLResourceValues.creationDate.getter();
}

uint64_t URLResourceValues.isSymbolicLink.getter()
{
  return URLResourceValues.isSymbolicLink.getter();
}

uint64_t URLResourceValues.contentAccessDate.getter()
{
  return URLResourceValues.contentAccessDate.getter();
}

uint64_t URLResourceValues.path.getter()
{
  return URLResourceValues.path.getter();
}

uint64_t URLResourceValues.fileSize.getter()
{
  return URLResourceValues.fileSize.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t URL.isFileURL.getter()
{
  return URL.isFileURL.getter();
}

uint64_t URL.absoluteURL.getter()
{
  return URL.absoluteURL.getter();
}

uint64_t URL.pathExtension.getter()
{
  return URL.pathExtension.getter();
}

uint64_t URL.pathComponents.getter()
{
  return URL.pathComponents.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.hasDirectoryPath.getter()
{
  return URL.hasDirectoryPath.getter();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.deletingPathExtension()()
{
  return URL.deletingPathExtension()();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t URL.withUnsafeFileSystemRepresentation<A>(_:)()
{
  return URL.withUnsafeFileSystemRepresentation<A>(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return Data.Deallocator._deallocator.getter();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return type metadata accessor for Data.Deallocator();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.subscript.getter()
{
  return Data._Representation.subscript.getter();
}

uint64_t Data._Representation.subscript.setter()
{
  return Data._Representation.subscript.setter();
}

uint64_t Data.withUnsafeBytes<A>(_:)()
{
  return Data.withUnsafeBytes<A>(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.hash(into:)()
{
  return Data.hash(into:)();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init(uuid:)()
{
  return UUID.init(uuid:)();
}

uint64_t UUID.uuid.getter()
{
  return UUID.uuid.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logHandle:)()
{
  return OSSignposter.init(logHandle:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t OSSignposter.init()()
{
  return OSSignposter.init()();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t POSIXErrorCode.init(rawValue:)()
{
  return POSIXErrorCode.init(rawValue:)();
}

uint64_t open(_:_:)()
{
  return open(_:_:)();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t S_IRGRP.getter()
{
  return S_IRGRP.getter();
}

uint64_t S_IROTH.getter()
{
  return S_IROTH.getter();
}

uint64_t S_IRWXU.getter()
{
  return S_IRWXU.getter();
}

uint64_t S_IWGRP.getter()
{
  return S_IWGRP.getter();
}

uint64_t S_IWOTH.getter()
{
  return S_IWOTH.getter();
}

uint64_t S_IXGRP.getter()
{
  return S_IXGRP.getter();
}

uint64_t S_IXOTH.getter()
{
  return S_IXOTH.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.removeValue(forKey:)()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return type metadata accessor for Dictionary.Keys();
}

uint64_t Dictionary.count.getter()
{
  return Dictionary.count.getter();
}

uint64_t type metadata accessor for Dictionary()
{
  return type metadata accessor for Dictionary();
}

uint64_t Dictionary.subscript.getter()
{
  return Dictionary.subscript.getter();
}

uint64_t Dictionary.subscript.setter()
{
  return Dictionary.subscript.setter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t Character.isWhitespace.getter()
{
  return Character.isWhitespace.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t static Comparable.> infix(_:_:)()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t ObjectIdentifier.debugDescription.getter()
{
  return ObjectIdentifier.debugDescription.getter();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init(utf8String:)()
{
  return String.init(utf8String:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return String.init<A>(bytes:encoding:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.distance(from:to:)()
{
  return String.distance(from:to:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = String.init(repeating:count:)(repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t Sequence<>.contains(_:)()
{
  return Sequence<>.contains(_:)();
}

uint64_t Sequence<>.joined(separator:)()
{
  return Sequence<>.joined(separator:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return static Array._adoptStorage(_:count:)();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array.+ infix(_:_:)()
{
  return static Array.+ infix(_:_:)();
}

Swift::Void __swiftcall Array._makeMutableAndUnique()()
{
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.count.getter()
{
  return Array.count.getter();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t Array.insert(_:at:)()
{
  return Array.insert(_:at:)();
}

uint64_t Array.endIndex.getter()
{
  return Array.endIndex.getter();
}

Swift::Int __swiftcall Array._getCount()()
{
  return Array._getCount()();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array.subscript.getter()
{
  return Array.subscript.getter();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t type metadata accessor for Set()
{
  return type metadata accessor for Set();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t Collection.firstIndex(where:)()
{
  return Collection.firstIndex(where:)();
}

uint64_t NSEnumerator.makeIterator()()
{
  return NSEnumerator.makeIterator()();
}

uint64_t NSFileHandle.write<A>(contentsOf:)()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

uint64_t NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)()
{
  return NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeMachReceiveSource(port:queue:)()
{
  return static OS_dispatch_source.makeMachReceiveSource(port:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

uint64_t OS_dispatch_source.setCancelHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setCancelHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t type metadata accessor for OS_dispatch_workloop.Attributes()
{
  return type metadata accessor for OS_dispatch_workloop.Attributes();
}

uint64_t OS_dispatch_workloop.init(label:attributes:autoreleaseFrequency:osWorkgroup:)()
{
  return OS_dispatch_workloop.init(label:attributes:autoreleaseFrequency:osWorkgroup:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.index(after:)()
{
  return Substring.index(after:)();
}

uint64_t Substring.subscript.getter()
{
  return Substring.subscript.getter();
}

{
  return Substring.subscript.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.lengthOfBytes(using:)()
{
  return StringProtocol.lengthOfBytes(using:)();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t StringProtocol.compare<A>(_:options:range:locale:)()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t dispatch thunk of static BinaryInteger.& infix(_:_:)()
{
  return dispatch thunk of static BinaryInteger.& infix(_:_:)();
}

uint64_t dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)()
{
  return dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return dispatch thunk of BinaryInteger._lowWord.getter();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return dispatch thunk of BinaryInteger.bitWidth.getter();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t BinaryInteger.description.getter()
{
  return BinaryInteger.description.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t dispatch thunk of SetAlgebra.formIntersection(_:)()
{
  return dispatch thunk of SetAlgebra.formIntersection(_:)();
}

uint64_t dispatch thunk of SetAlgebra.union(_:)()
{
  return dispatch thunk of SetAlgebra.union(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isEmpty.getter()
{
  return dispatch thunk of SetAlgebra.isEmpty.getter();
}

uint64_t dispatch thunk of SetAlgebra.isSubset(of:)()
{
  return dispatch thunk of SetAlgebra.isSubset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.subtract(_:)()
{
  return dispatch thunk of SetAlgebra.subtract(_:)();
}

uint64_t dispatch thunk of SetAlgebra.formUnion(_:)()
{
  return dispatch thunk of SetAlgebra.formUnion(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init()()
{
  return dispatch thunk of SetAlgebra.init()();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t type metadata accessor for _SetStorage()
{
  return type metadata accessor for _SetStorage();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return _ArrayProtocol.filter(_:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t TextOutputStream._writeASCII(_:)()
{
  return TextOutputStream._writeASCII(_:)();
}

Swift::Void __swiftcall TextOutputStream._lock()()
{
}

Swift::Void __swiftcall TextOutputStream._unlock()()
{
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return dispatch thunk of static FixedWidthInteger.bitWidth.getter();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Int32.init(truncating:)()
{
  return Int32.init(truncating:)();
}

uint64_t static Int32._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int32._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AMAuthInstallApImg4CreatePayloadWithProperties()
{
  return _AMAuthInstallApImg4CreatePayloadWithProperties();
}

uint64_t AMAuthInstallApImg4GetPayloadPropertiesData()
{
  return _AMAuthInstallApImg4GetPayloadPropertiesData();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return _CFBundleCopyBuiltInPlugInsURL(bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return _CFBundleCopyExecutableURL(bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfTypeInDirectory(CFURLRef bundleURL, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURLsOfTypeInDirectory(bundleURL, resourceType, subDirName);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return _IOCFSerialize(object, options);
}

CFTypeRef IOCFUnserialize(const char *buffer, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return _IOCFUnserialize(buffer, allocator, options, errorString);
}

kern_return_t IOCatalogueModuleLoaded(mach_port_t mainPort, io_name_t name)
{
  return _IOCatalogueModuleLoaded(mainPort, name);
}

kern_return_t IOCatalogueSendData(mach_port_t mainPort, uint32_t flag, const char *buffer, uint32_t size)
{
  return _IOCatalogueSendData(mainPort, flag, buffer, size);
}

kern_return_t IOCatalogueTerminate(mach_port_t mainPort, uint32_t flag, io_name_t description)
{
  return _IOCatalogueTerminate(mainPort, flag, description);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return _IORegistryGetRootEntry(mainPort);
}

fat_arch *__cdecl NXFindBestFatArch(cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return _NXFindBestFatArch(cputype, cpusubtype, fat_archs, nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return _NXGetArchInfoFromCpuType(cputype, cpusubtype);
}

uint64_t OSKextParseVersionCFString()
{
  return _OSKextParseVersionCFString();
}

uint64_t OSKextParseVersionString()
{
  return _OSKextParseVersionString();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return _SecCodeCopySigningInformation(code, flags, information);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecRequirementCreateWithString(CFStringRef text, SecCSFlags flags, SecRequirementRef *requirement)
{
  return _SecRequirementCreateWithString(text, flags, requirement);
}

OSStatus SecStaticCodeCheckValidity(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement)
{
  return _SecStaticCodeCheckValidity(staticCode, flags, requirement);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return _SecStaticCodeCreateWithPath(path, flags, staticCode);
}

OSStatus SecStaticCodeCreateWithPathAndAttributes(CFURLRef path, SecCSFlags flags, CFDictionaryRef attributes, SecStaticCodeRef *staticCode)
{
  return _SecStaticCodeCreateWithPathAndAttributes(path, flags, attributes, staticCode);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return __CFBundleCopyInfoPlistURL();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return __swift_isClassOrObjCExistentialType();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_with_reason()
{
  return _abort_with_reason();
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_decode_scratch_buffer_size(algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_encode_scratch_buffer_size(algorithm);
}

uint64_t compression_stream_identify_algorithm()
{
  return _compression_stream_identify_algorithm();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  return _copyfile_state_get(s, flag, dst);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return _copyfile_state_set(s, flag, src);
}

void dispatch_main(void)
{
}

uint64_t dispatch_mig_server()
{
  return _dispatch_mig_server();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

kern_return_t kext_request(host_priv_t host_priv, uint32_t user_log_flags, vm_offset_t request_data, mach_msg_type_number_t request_dataCnt, vm_offset_t *response_data, mach_msg_type_number_t *response_dataCnt, vm_offset_t *log_data, mach_msg_type_number_t *log_dataCnt, kern_return_t *op_result)
{
  return _kext_request(host_priv, user_log_flags, request_data, request_dataCnt, response_data, response_dataCnt, log_data, log_dataCnt, op_result);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  return _macho_arch_name_for_cpu_type(type, subtype);
}

BOOL macho_cpu_type_for_arch_name(const char *archName, cpu_type_t *type, cpu_subtype_t *subtype)
{
  return _macho_cpu_type_for_arch_name(archName, type, subtype);
}

uint64_t macho_find_symtab()
{
  return _macho_find_symtab();
}

uint64_t macho_get_section_by_name()
{
  return _macho_get_section_by_name();
}

uint64_t macho_get_section_by_name_64()
{
  return _macho_get_section_by_name_64();
}

uint64_t macho_scan_load_commands()
{
  return _macho_scan_load_commands();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

char *__cdecl mkdtempat_np(int dfd, char *path)
{
  return _mkdtempat_np(dfd, path);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutorelease(id a1)
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

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return _openat_authenticated_np(a1, a2, a3, a4);
}

uint64_t os_log_copy_decorated_message()
{
  return _os_log_copy_decorated_message();
}

uint64_t os_log_set_hook()
{
  return _os_log_set_hook();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return _pthread_getschedparam(a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return _pthread_setschedparam(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t rootless_mkdir_restricted()
{
  return _rootless_mkdir_restricted();
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_arch_64(fat_arch_64 *fat_archs64, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
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

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return _xpc_dictionary_set_mach_send();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return _xpc_event_publisher_fire_with_reply();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

id objc_msgSend_initWithPlist_domain_(void *a1, const char *a2, ...)
{
  return [a1 initWithPlist:x0 domain:x1];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_submitAndStart_(void *a1, const char *a2, ...)
{
  return [a1 submitAndStart:];
}

id objc_msgSend_systemDomain(void *a1, const char *a2, ...)
{
  return _[a1 systemDomain];
}