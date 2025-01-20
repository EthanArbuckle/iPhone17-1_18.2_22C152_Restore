id sub_100001CDC(void *a1, unsigned __int8 a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  unsigned char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  NSBundle v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  NSBundle v25;
  uint64_t v26;
  void *v27;
  char v28;
  char v29;
  id v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  objc_class *v35;
  NSBundle v36;
  id v37;
  id v38;
  objc_class *v39;
  NSBundle v40;
  id v41;
  id v42;
  id v43;
  objc_class *v44;
  NSBundle v45;
  uint64_t v46;
  NSString v47;
  id v48;
  id v49;
  id v50;
  id v51;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  uint64_t v57;
  void *v58;
  id v60;
  void *v61;
  uint64_t v63;
  int v65;
  uint64_t v66;
  Swift::String v67;
  Swift::String v68;
  Swift::String v69;
  Swift::String v70;
  Swift::String v71;
  Swift::String_optional v72;
  Swift::String_optional v73;
  Swift::String_optional v74;
  Swift::String_optional v75;
  Swift::String_optional v76;
  Swift::String v77;
  Swift::String v78;
  Swift::String v79;
  Swift::String v80;
  Swift::String v81;

  v8 = v5;
  v9 = [a3 serviceName];
  v10 = sub_100029960();
  v12 = v11;

  v13 = self;
  swift_bridgeObjectRetain_n();
  v14 = v13;
  v15 = (objc_class *)[v13 mainBundle];
  v53._countAndFlagsBits = 0xE000000000000000;
  v67._object = (void *)0x800000010002B730;
  v67._countAndFlagsBits = 0xD000000000000018;
  v72.value._countAndFlagsBits = 0;
  v72.value._object = 0;
  v16.super.isa = v15;
  v77._countAndFlagsBits = 0;
  v77._object = (void *)0xE000000000000000;
  sub_100029710(v67, v72, v16, v77, v53);

  sub_100002798((uint64_t *)&unk_10003BB40);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10002A710;
  *(void *)(v17 + 56) = &type metadata for String;
  v54._object = (void *)sub_100004708();
  *(void *)(v17 + 64) = v54._object;
  v66 = v10;
  *(void *)(v17 + 32) = v10;
  *(void *)(v17 + 40) = v12;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v61 = a3;
  v18 = [a3 supportedMediaIntents];
  v63 = a5;
  if (!v18
    || (v19 = v18,
        v20 = sub_100029A70(),
        v19,
        sub_100004620(v20),
        v22 = v21,
        swift_bridgeObjectRelease(),
        !v22))
  {
    v23 = HIBYTE(v12) & 0xF;
    if ((v12 & 0x2000000000000000) == 0) {
      v23 = v10 & 0xFFFFFFFFFFFFLL;
    }
    if (v23)
    {
      swift_bridgeObjectRetain_n();
      v24 = (objc_class *)[v14 mainBundle];
      v68._countAndFlagsBits = 0xD00000000000001ALL;
      v54._countAndFlagsBits = 0xE000000000000000;
      v68._object = (void *)0x800000010002B750;
      v73.value._countAndFlagsBits = 0;
      v73.value._object = 0;
      v25.super.isa = v24;
      v78._countAndFlagsBits = 0;
      v78._object = (void *)0xE000000000000000;
      sub_100029710(v68, v73, v25, v78, v54);

      v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_10002A710;
      *(void *)(v26 + 56) = &type metadata for String;
      *(void *)(v26 + 64) = v54._object;
      *(void *)(v26 + 32) = v10;
      *(void *)(v26 + 40) = v12;
      sub_100029970();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  v27 = a1;
  v65 = a2;
  if (a2 == 2) {
    v28 = 3;
  }
  else {
    v28 = 1;
  }
  v8[OBJC_IVAR____TtC21MediaSetupViewService23AddToHomeViewController_trigger] = v28;
  if (a2 == 2) {
    v29 = 31;
  }
  else {
    v29 = 41;
  }

  v60 = v27;
  v30 = sub_100018518(v60);
  v31 = sub_100026030(v29);
  v33 = v32;
  v34 = v30;
  v35 = (objc_class *)[v14 mainBundle];
  v54._countAndFlagsBits = 0xE000000000000000;
  v69._countAndFlagsBits = v31;
  v69._object = v33;
  v74.value._countAndFlagsBits = 0;
  v74.value._object = 0;
  v36.super.isa = v35;
  v79._countAndFlagsBits = 0;
  v79._object = (void *)0xE000000000000000;
  sub_100029710(v69, v74, v36, v79, v54);
  swift_bridgeObjectRelease();

  v37 = sub_100027260(0);
  swift_bridgeObjectRelease();
  [v37 addTarget:v34 action:"selectAddToHomes" forControlEvents:64];
  v38 = [v34 buttonTray];
  v58 = v37;
  [v38 addButton:v37];

  v39 = (objc_class *)[v14 mainBundle];
  v55._countAndFlagsBits = 0xE000000000000000;
  v70._countAndFlagsBits = 0x574F4E5F544F4ELL;
  v70._object = (void *)0xE700000000000000;
  v75.value._countAndFlagsBits = 0;
  v75.value._object = 0;
  v40.super.isa = v39;
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_100029710(v70, v75, v40, v80, v55);

  v41 = sub_100027260(1);
  swift_bridgeObjectRelease();
  [v41 addTarget:v34 action:"requestDismiss" forControlEvents:64];
  v42 = [v34 buttonTray];
  [v42 addButton:v41];

  if (v65 == 2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v43 = [v34 buttonTray];
    swift_bridgeObjectRetain();
    v44 = (objc_class *)[v14 mainBundle];
    v71._countAndFlagsBits = 0xD00000000000001ELL;
    v56._countAndFlagsBits = 0xE000000000000000;
    v71._object = (void *)0x800000010002B770;
    v76.value._countAndFlagsBits = 0;
    v76.value._object = 0;
    v45.super.isa = v44;
    v81._countAndFlagsBits = 0;
    v81._object = (void *)0xE000000000000000;
    sub_100029710(v71, v76, v45, v81, v56);

    v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_10002A710;
    *(void *)(v46 + 56) = &type metadata for String;
    *(void *)(v46 + 64) = v57;
    *(void *)(v46 + 32) = v66;
    *(void *)(v46 + 40) = v12;
    sub_100029970();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v47 = sub_100029950();
    swift_bridgeObjectRelease();
    [v43 setCaptionText:v47];
  }
  v48 = objc_allocWithZone((Class)type metadata accessor for MainContentView());
  swift_bridgeObjectRetain_n();
  v49 = v61;
  v50 = sub_10002790C(1, a4, v63, v49);
  v51 = [v34 contentView];
  [v51 addSubview:v50];

  sub_1000234D8();
  swift_bridgeObjectRelease_n();

  return v34;
}

uint64_t sub_100002434()
{
  v0 = (void *)sub_100004588((uint64_t)&off_100034DC0);
  uint64_t result = swift_arrayDestroy();
  off_10003BA18 = v0;
  return result;
}

id sub_100002484()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddToHomeViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *variable initialization expression of SetupSession.homesToSetup()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of SetupSession.state()
{
  return 4;
}

uint64_t variable initialization expression of SetupSession.testFlags()
{
  return 0;
}

uint64_t variable initialization expression of SetupSession.dispatchQueue()
{
  uint64_t v0 = sub_1000298B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000025D4();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchQoS.QoSClass.default(_:), v0);
  uint64_t v4 = sub_100029B10();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t sub_1000025D4()
{
  unint64_t result = qword_10003BA70;
  if (!qword_10003BA70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003BA70);
  }
  return result;
}

double variable initialization expression of SetupSession.hostAuditToken@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t variable initialization expression of SetupSession.progressHandler()
{
  return 0;
}

uint64_t variable initialization expression of SetupSession.didEncounterErrorDuringSetup()
{
  return 0;
}

uint64_t variable initialization expression of SetupSession.log()
{
  return sub_100029860();
}

uint64_t variable initialization expression of SetupSession.configModel()
{
  return 0;
}

uint64_t variable initialization expression of SetupSession.homeTopology()
{
  return 3;
}

double variable initialization expression of SetupSession.preErrorContext@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t variable initialization expression of SetupSession.stateStack()
{
  sub_100002798(&qword_10003BC60);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = &_swiftEmptyArrayStorage;
  return result;
}

_UNKNOWN **variable initialization expression of SetupSession.recoverableStates()
{
  return &off_100035040;
}

id variable initialization expression of SetupSession.setupAnalyticEvent()
{
  id v0 = objc_allocWithZone((Class)MSSetupCompleteEvent);

  return [v0 init];
}

id variable initialization expression of SetupSession.defaults()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_100029950();
  id v2 = [v0 initWithSuiteName:v1];

  return v2;
}

uint64_t variable initialization expression of SetupSession.$__lazy_storage_$_mediaService()
{
  return 1;
}

void *sub_10000278C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100002798(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for AddToHomeViewController()
{
  return self;
}

void type metadata accessor for MSTestUIFlags(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SetupStepContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000284C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002858(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002878(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void sub_1000028B8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_100002900(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100002908@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_10000291C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100002930@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100002944(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100002974@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000029A0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1000029C4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000029D8(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1000029EC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100002A00@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100002A14(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100002A28(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100002A3C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100002A50()
{
  return *v0 == 0;
}

uint64_t sub_100002A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100002A78(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100002A8C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002A9C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100002AA8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100002ABC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1000046D0(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_100002AFC()
{
  return sub_100002B64(&qword_10003BAC0);
}

uint64_t sub_100002B30()
{
  return sub_100002B64(&qword_10003BAC8);
}

uint64_t sub_100002B64(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MSTestUIFlags(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100002BA8()
{
  return sub_100002B64(&qword_10003BAD0);
}

uint64_t sub_100002BDC()
{
  return sub_100002B64(&qword_10003BAD8);
}

uint64_t sub_100002C10(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_100003228(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

unint64_t *sub_100002DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_10000475C();
                  return (unint64_t *)v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_100029E00();
      swift_bridgeObjectRetain();
      sub_100029990();
      Swift::Int v19 = sub_100029E20();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_100029D80() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_100029D80() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_100003698((unint64_t *)((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0)), v30, v2, v21, &v38);
      swift_release();
      sub_10000475C();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_100003698((unint64_t *)v33, v30, v2, v21, &v38);
      swift_release();
      sub_10000475C();
      swift_slowDealloc();
    }
    return v32;
  }
  else
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_100003228(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_100029E00();
  swift_bridgeObjectRetain();
  sub_100029990();
  Swift::Int v6 = sub_100029E20();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_100029D80() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_100029D80() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100003C10();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100004074(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1000033B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100002798((uint64_t *)&unk_10003BB50);
  uint64_t v3 = sub_100029C30();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100029E00();
      sub_100029990();
      uint64_t result = sub_100029E20();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t *sub_100003698(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = result;
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_43;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_43;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_43;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_43;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v15 = v14 - 1;
                  int64_t v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return (unint64_t *)sub_100003978(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_100029E00();
        swift_bridgeObjectRetain();
        sub_100029990();
        Swift::Int v22 = sub_100029E20();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_100029D80() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_100029D80() & 1) != 0)
          {
            uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
LABEL_29:
      unint64_t v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_100003978(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100002798((uint64_t *)&unk_10003BB50);
  uint64_t result = sub_100029C40();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_100029E00();
    swift_bridgeObjectRetain();
    sub_100029990();
    uint64_t result = sub_100029E20();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_100003C10()
{
  uint64_t v1 = v0;
  sub_100002798((uint64_t *)&unk_10003BB50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100029C20();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100003DC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100002798((uint64_t *)&unk_10003BB50);
  uint64_t v3 = sub_100029C30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100029E00();
    swift_bridgeObjectRetain();
    sub_100029990();
    uint64_t result = sub_100029E20();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_100004074(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_100029BE0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_100029E00();
        swift_bridgeObjectRetain();
        sub_100029990();
        Swift::Int v10 = sub_100029E20();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *int64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_10000423C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100029E00();
  swift_bridgeObjectRetain();
  sub_100029990();
  Swift::Int v8 = sub_100029E20();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100029D80() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      int64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100029D80() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000043EC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_1000043EC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_1000033B8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100003C10();
      goto LABEL_22;
    }
    sub_100003DC4();
  }
  uint64_t v11 = *v4;
  sub_100029E00();
  sub_100029990();
  uint64_t result = sub_100029E20();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    Swift::Int v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100029D80(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100029D90();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100029D80();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

uint64_t sub_100004588(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100029A80();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000423C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100004620(uint64_t a1)
{
  uint64_t v2 = qword_10003BA10;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  if (*((void *)off_10003BA18 + 2) <= *(void *)(a1 + 16) >> 3)
  {
    sub_100002C10((uint64_t)off_10003BA18);
    uint64_t v3 = (unint64_t *)a1;
  }
  else
  {
    uint64_t v3 = sub_100002DB8((uint64_t)off_10003BA18, a1);
  }
  char v4 = sub_100026FEC((uint64_t)v3);
  if (v4 == 7) {
    return 0;
  }
  else {
    return sub_10002376C(v4);
  }
}

uint64_t sub_1000046D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  char v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

unint64_t sub_100004708()
{
  unint64_t result = qword_10003C500;
  if (!qword_10003C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C500);
  }
  return result;
}

uint64_t sub_10000475C()
{
  return swift_release();
}

uint64_t sub_100004768(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homesToSetup);
  swift_beginAccess();
  void *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SetupSession.homesToSetup.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100004820(unsigned __int8 a1)
{
  uint64_t v3 = v1;
  char v4 = sub_100029850();
  os_log_type_t v5 = sub_100029A90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    unint64_t v7 = SetupState.description.getter(a1);
    sub_100021F44(v7, v8, v21);
    sub_100029B90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    unint64_t v9 = (unsigned __int8 *)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unint64_t v10 = SetupState.description.getter(*v9);
    sub_100021F44(v10, v11, v21);
    sub_100029B90();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "State change: %s -> %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v12 = *(void *)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stateStack];
  uint64_t v13 = &v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
  swift_beginAccess();
  char v14 = *v13;
  Swift::Int v15 = (char **)(v12 + 16);
  swift_beginAccess();
  BOOL v16 = *(char **)(v12 + 16);
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v12 + 16) = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    BOOL v16 = sub_10000E8AC(0, *((void *)v16 + 2) + 1, 1, v16);
    *Swift::Int v15 = v16;
  }
  unint64_t v19 = *((void *)v16 + 2);
  unint64_t v18 = *((void *)v16 + 3);
  if (v19 >= v18 >> 1)
  {
    BOOL v16 = sub_10000E8AC((char *)(v18 > 1), v19 + 1, 1, v16);
    *Swift::Int v15 = v16;
  }
  *((void *)v16 + 2) = v19 + 1;
  v16[v19 + 32] = v14;
  swift_endAccess();
  return swift_release();
}

uint64_t SetupSession.state.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
  swift_beginAccess();
  return *v1;
}

void sub_100004B04()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
  if (v2)
  {
    uint64_t v4 = *v1;
    uint64_t v3 = v1[1];
    uint64_t v6 = v1[2];
    os_log_type_t v5 = (void *)v1[3];
    uint64_t v8 = v1[4];
    uint64_t v7 = v1[5];
    uint64_t v9 = v1[6];
    v21[1] = v4;
    v21[2] = v3;
    uint64_t v21[3] = v6;
    v21[4] = (uint64_t)v5;
    v21[5] = v8;
    v21[6] = v7;
    char v22 = v9;
    uint64_t v23 = v2;
    sub_1000100D8(v4, v3, v6, v5, v8, v7, v9, v2);
    sub_1000100D8(v4, v3, v6, v5, v8, v7, v9, v2);
    sub_100010118(v4, v3, v6, v5);
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_100029850();
    os_log_type_t v11 = sub_100029A90();
    if (os_log_type_enabled(v10, v11))
    {
      loga = v10;
      os_log_type_t type = v11;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      v21[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136380675;
      sub_100010118(v4, v3, v6, v5);
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_100024F50();
      unint64_t v14 = v13;
      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);
      sub_100021F44(v17, v14, v21);
      sub_100029B90();
      swift_bridgeObjectRelease();
      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);
      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);
      _os_log_impl((void *)&_mh_execute_header, loga, type, "StepContext: %{private}s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);
    }
    else
    {
      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);

      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);
      sub_1000101B8(v4, v3, v6, v5, v8, v7, v9, v2);
    }
  }
  else
  {
    log = sub_100029850();
    uint64_t v15 = sub_100029A90();
    if (os_log_type_enabled(log, (os_log_type_t)v15))
    {
      BOOL v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, (os_log_type_t)v15, "StepContext = nil", v16, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_100004F0C()
{
  uint64_t v1 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___configuration;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___configuration);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___configuration);
LABEL_5:
    id v7 = v2;
    return v3;
  }
  id result = [self sharedInstance];
  if (result)
  {
    os_log_type_t v5 = result;
    [result setQueue:*(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_dispatchQueue)];
    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_100004FAC()
{
  uint64_t v1 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___mediaService;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___mediaService);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_10000501C(v0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_10001088C(v4);
  }
  sub_10001089C(v2);
  return v3;
}

id sub_10000501C(uint64_t a1)
{
  uint64_t v2 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100029810();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)v32 - v10;
  if (!*(void *)(a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID + 8))
  {
    uint64_t v20 = sub_100029850();
    os_log_type_t v21 = sub_100029AB0();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v22 = 0;
      uint64_t v23 = "### No host bundle ID?";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v23, v22, 2u);
      swift_slowDealloc();
    }
LABEL_11:

    return 0;
  }
  uint64_t v12 = *(void **)(a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount);
  if (!v12)
  {
    uint64_t v20 = sub_100029850();
    os_log_type_t v21 = sub_100029AB0();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v22 = 0;
      uint64_t v23 = "### No setup context?";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID);
  id v14 = v12;
  swift_bridgeObjectRetain();
  id v15 = [v14 serviceID];
  if (!v15)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_13;
  }
  BOOL v16 = v15;
  v32[1] = v13;
  sub_1000297E0();

  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v17(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    sub_100010604((uint64_t)v4, (uint64_t *)&unk_10003BD30);
    uint64_t v24 = sub_100029850();
    os_log_type_t v25 = sub_100029AB0();
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "### No serviceID?", v26, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  v17(v11, v4, v5);
  id v18 = objc_allocWithZone((Class)MediaService);
  id v19 = v14;
  id v27 = sub_10001CF10((uint64_t)v19);

  id v28 = v27;
  Class isa = sub_1000297D0().super.isa;
  [v28 setServiceID:isa];

  if (*(void *)(a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configPublicKey + 8))
  {
    swift_bridgeObjectRetain();
    NSString v30 = sub_100029950();
    swift_bridgeObjectRelease();
    [v28 setConfigPublicKey:v30];

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return v28;
}

void SetupSession.targetHome.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager);
  if (v2)
  {
    if ([v2 currentHome]) {
      return;
    }
    uint64_t v3 = *(void **)(v0 + v1);
    if (v3)
    {
      id v4 = [v3 homes];
      sub_1000102BC(0, &qword_10003BBD8);
      unint64_t v5 = sub_100029A10();

      if (v5 >> 62) {
        goto LABEL_5;
      }
LABEL_8:
      if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  unint64_t v5 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
    goto LABEL_8;
  }
LABEL_5:
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_100029D00();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_12;
  }
LABEL_9:
  if ((v5 & 0xC000000000000001) != 0)
  {
    sub_100029C70();
    goto LABEL_12;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v5 + 32);
LABEL_12:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t sub_100005764@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100029810();
  uint64_t v18 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags))
  {
    if (qword_10003BA50 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100010854(v3, (uint64_t)qword_10003D648);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    return v10(a1, v9, v3);
  }
  else
  {
    SetupSession.targetHome.getter();
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = [v12 currentUser];

      id v15 = [v14 uniqueIdentifier];
      sub_1000297E0();

      BOOL v16 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
      v16(v8, v5, v3);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v8, 0, 1, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v3) != 1) {
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v16)(a1, v8, v3);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v8, 1, 1, v3);
    }
    sub_100029800();
    return sub_100010604((uint64_t)v8, (uint64_t *)&unk_10003BD30);
  }
}

void sub_100005A0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029850();
  os_log_type_t v3 = sub_100029A90();
  p_superclass = _TtC21MediaSetupViewService29AccountMismatchViewController.superclass;
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 136380675;
    v15[0] = v6;
    id v7 = *(id *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount];
    sub_100002798((uint64_t *)&unk_10003BDD0);
    uint64_t v8 = sub_100029980();
    sub_100021F44(v8, v9, v15);
    sub_100029B90();

    p_superclass = (__objc2_class **)(_TtC21MediaSetupViewService29AccountMismatchViewController + 8);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Activating with context %{private}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (!*(__objc2_class **)((char *)&p_superclass[380]->isa + (void)v1))
  {
    uint64_t v10 = sub_100029850();
    os_log_type_t v11 = sub_100029AB0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "### Activating without context?", v12, 2u);
      swift_slowDealloc();
    }

    uint64_t v13 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v14 = *v13;
    *uint64_t v13 = 3;
    sub_100004820(v14);
  }
  sub_100005C50();
}

void sub_100005C50()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
  swift_beginAccess();
  switch(*v1)
  {
    case 2u:
      uint64_t v2 = sub_100029850();
      os_log_type_t v3 = sub_100029AB0();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "Invalid state", v4, 2u);
        swift_slowDealloc();
      }

      return;
    case 3u:
      if (sub_100006AE8(3))
      {
        uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
        uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8);
        uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16);
        uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24);
        uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32);
        uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40);
        uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48);
        uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
        uint64_t v13 = 5;
        if (v12) {
          uint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
        }
        else {
          uint64_t v14 = 0;
        }
        if (v12) {
          uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8);
        }
        else {
          uint64_t v15 = 1;
        }
        if (v12) {
          uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16);
        }
        else {
          uint64_t v16 = 0;
        }
        if (v12) {
          uint64_t v17 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24);
        }
        else {
          uint64_t v17 = 0;
        }
        if (v12) {
          uint64_t v18 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32);
        }
        else {
          uint64_t v18 = 0;
        }
        if (v12) {
          uint64_t v19 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40);
        }
        else {
          uint64_t v19 = 0;
        }
        if (v12)
        {
          uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48);
          uint64_t v20 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
        }
        else
        {
          uint64_t v20 = &_swiftEmptyArrayStorage;
        }
        *(void *)&long long v26 = v14;
        *((void *)&v26 + 1) = v15;
        *(void *)&long long v27 = v16;
        *((void *)&v27 + 1) = v17;
        *(void *)&long long v28 = v18;
        *((void *)&v28 + 1) = v19;
        *(void *)&long long v29 = v13;
        *((void *)&v29 + 1) = v20;
        sub_1000100D8(v5, v6, v7, v8, v9, v10, v11, v12);
        sub_100010118(v14, v15, v16, v17);
        swift_bridgeObjectRetain();
        sub_100008720(4, &v26);
        sub_1000101F8(v14, v15, v16, v17);
        swift_bridgeObjectRelease();
        sub_1000101F8(v14, v15, v16, v17);
        swift_bridgeObjectRelease();
      }
      return;
    case 4u:
      sub_1000095DC();
      return;
    case 5u:
    case 9u:
    case 0xCu:
    case 0xEu:
    case 0x11u:
    case 0x13u:
    case 0x16u:
    case 0x18u:
    case 0x1Bu:
      return;
    case 6u:
      sub_10000A228();
      return;
    case 7u:
      sub_10000A444();
      return;
    case 8u:
      if (sub_100006AE8(8))
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        sub_100008720(9, &v26);
        unsigned __int8 v21 = *v1;
        *uint64_t v1 = 9;
        goto LABEL_58;
      }
      return;
    case 0xAu:
      sub_10000A764();
      return;
    case 0xBu:
      if (sub_100006AE8(11))
      {
        sub_10001040C(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext, (uint64_t)&v26, &qword_10003BD40);
        sub_100010174(&v26, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
        sub_100008720(5, &v26);
        sub_100010174(&v26, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
        *(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist + 2) = 1;
        unsigned __int8 v21 = *v1;
        char v22 = 12;
        break;
      }
      return;
    case 0xDu:
      sub_10000ACA0();
      return;
    case 0xFu:
      sub_10000AD88();
      return;
    case 0x10u:
      if (*(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeTopology) == 1) {
        char v23 = 23;
      }
      else {
        char v23 = 20;
      }
      *uint64_t v1 = v23;
      unsigned __int8 v21 = 16;
      goto LABEL_58;
    case 0x12u:
      sub_10000B3D8();
      return;
    case 0x14u:
      if ((sub_100006AE8(20) & 1) == 0) {
        return;
      }
      sub_10001040C(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext, (uint64_t)&v26, &qword_10003BD40);
      sub_100010174(&v26, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
      char v24 = 6;
      goto LABEL_47;
    case 0x15u:
      if ((sub_100006AE8(21) & 1) == 0) {
        return;
      }
      sub_10001040C(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext, (uint64_t)&v26, &qword_10003BD40);
      sub_100010174(&v26, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
      char v24 = 7;
LABEL_47:
      sub_100008720(v24, &v26);
      sub_100010174(&v26, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
      unsigned __int8 v21 = *v1;
      char v22 = 22;
      break;
    case 0x17u:
      if ((sub_100006AE8(23) & 1) == 0) {
        return;
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      sub_100008720(14, &v26);
      unsigned __int8 v21 = *v1;
      char v22 = 24;
      break;
    case 0x19u:
      sub_100006AE8(25);
      return;
    case 0x1Au:
      if ((sub_100006AE8(26) & 1) == 0) {
        return;
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      sub_100008720(10, &v26);
      unsigned __int8 v21 = *v1;
      char v22 = 27;
      break;
    case 0x1Cu:
      if (sub_100006AE8(28))
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        sub_100008720(3, &v26);
      }
      return;
    case 0x1Du:
      if ((sub_100006AE8(29) & 1) == 0) {
        return;
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      sub_100008720(11, &v26);
      unsigned __int8 v21 = *v1;
      char v22 = 28;
      break;
    default:
      sub_10000C08C(*v1 & 1);
      return;
  }
  *uint64_t v1 = v22;
LABEL_58:
  uint64_t v25 = sub_100004820(v21);
  sub_100005C50(v25);
}

void sub_10000617C(char a1, void *a2)
{
  uint64_t v3 = v2;
  sub_10001040C((uint64_t)a2, (uint64_t)v64, &qword_10003BD40);
  uint64_t v58 = v64[1];
  uint64_t v60 = v64[0];
  v54 = (void *)v64[3];
  uint64_t v56 = v64[2];
  sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
  sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
  uint64_t v6 = sub_100029850();
  os_log_type_t v7 = sub_100029A90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    v63[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315395;
    uint64_t v9 = 0xD000000000000011;
    unint64_t v10 = 0x800000010002BB80;
    switch(a1)
    {
      case 1:
        unint64_t v10 = 0x800000010002BB60;
        uint64_t v9 = 0xD000000000000010;
        break;
      case 2:
        unint64_t v10 = 0xEE0065756E69746ELL;
        uint64_t v9 = 0x6F437463656C6573;
        break;
      case 3:
        uint64_t v9 = 0xD000000000000014;
        uint64_t v11 = "selectCustomizeHomes";
        goto LABEL_11;
      case 4:
        unint64_t v10 = 0xEF676E6973557065;
        uint64_t v9 = 0x654B7463656C6573;
        break;
      case 5:
        unint64_t v10 = 0xEF65726F4D6E7261;
        uint64_t v9 = 0x654C7463656C6573;
        break;
      case 6:
        uint64_t v9 = 0xD000000000000013;
        uint64_t v11 = "selectSwitchAccount";
        goto LABEL_11;
      case 7:
        uint64_t v9 = 0xD000000000000012;
        uint64_t v11 = "selectUpdateInHome";
LABEL_11:
        unint64_t v10 = (unint64_t)(v11 - 32) | 0x8000000000000000;
        break;
      default:
        break;
    }
    v65[0] = sub_100021F44(v9, v10, v63);
    sub_100029B90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2081;
    sub_10001040C((uint64_t)a2, (uint64_t)v65, &qword_10003BD40);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
    sub_100002798(&qword_10003BD40);
    uint64_t v12 = sub_100029980();
    v65[0] = sub_100021F44(v12, v13, v63);
    sub_100029B90();
    swift_bridgeObjectRelease();
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "User event: %s, context: %{private}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
  }
  sub_10001040C((uint64_t)a2, (uint64_t)v65, &qword_10003BD40);
  if (v65[7])
  {
    uint64_t v48 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8);
    uint64_t v49 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
    v46 = *(void **)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24);
    uint64_t v47 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16);
    uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48);
    uint64_t v44 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40);
    uint64_t v45 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32);
    char v50 = a1;
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
    sub_10001040C((uint64_t)a2, v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext, &qword_10003BD40);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
    sub_100010118(v60, v58, v56, v54);
    swift_bridgeObjectRetain();
    sub_100010118(v60, v58, v56, v54);
    swift_bridgeObjectRetain();
    uint64_t v16 = v15;
    a1 = v50;
    sub_1000101B8(v49, v48, v47, v46, v45, v44, v14, v16);
    sub_100004B04();
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
  }
  switch(a1)
  {
    case 0:
      if ((sub_100006AE8(3) & 1) == 0) {
        return;
      }
      swift_retain();
      uint64_t v17 = swift_bridgeObjectRetain();
      char v18 = sub_100006DB4(v17);
      swift_release();
      swift_bridgeObjectRelease();
      if (v18 == 30)
      {
        uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
        swift_beginAccess();
        unsigned __int8 v20 = *v19;
        char v21 = 29;
      }
      else
      {
        char v62 = v18;
        uint64_t v34 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext);
        uint64_t v35 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 8);
        uint64_t v36 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 16);
        uint64_t v37 = *(void **)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 24);
        uint64_t v38 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 32);
        uint64_t v39 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 40);
        uint64_t v41 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 48);
        uint64_t v40 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 56);
        unint64_t v42 = (uint64_t *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
        uint64_t v43 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
        uint64_t v59 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16);
        uint64_t v61 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8);
        uint64_t v55 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32);
        v57 = *(void **)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24);
        uint64_t v52 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48);
        uint64_t v53 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40);
        uint64_t v51 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
        *unint64_t v42 = v34;
        v42[1] = v35;
        v42[2] = v36;
        v42[3] = (uint64_t)v37;
        v42[4] = v38;
        v42[5] = v39;
        v42[6] = v41;
        v42[7] = v40;
        sub_1000100D8(v34, v35, v36, v37, v38, v39, v41, v40);
        sub_1000100D8(v34, v35, v36, v37, v38, v39, v41, v40);
        sub_1000101B8(v43, v61, v59, v57, v55, v53, v52, v51);
        sub_100004B04();
        sub_1000101B8(v34, v35, v36, v37, v38, v39, v41, v40);
        uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
        swift_beginAccess();
        unsigned __int8 v20 = *v19;
        char v21 = v62;
      }
      goto LABEL_45;
    case 1:
      if ((sub_1000070C4((uint64_t)&off_100034FF0) & 1) == 0) {
        return;
      }
      char v22 = (uint64_t *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
      unint64_t v23 = *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
      if (!v23) {
        goto LABEL_44;
      }
      uint64_t v25 = v22[5];
      uint64_t v24 = v22[6];
      long long v27 = (void *)v22[3];
      uint64_t v26 = v22[4];
      uint64_t v29 = v22[1];
      uint64_t v28 = v22[2];
      uint64_t v30 = *v22;
      sub_1000100D8(*v22, v29, v28, v27, v26, v25, v24, *(void *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56));
      swift_bridgeObjectRetain();
      sub_1000101B8(v30, v29, v28, v27, v26, v25, v24, v23);
      if (v23 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_100029D00();
        if (!v31) {
          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v31 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v31) {
          goto LABEL_43;
        }
      }
      if (v31 < 1)
      {
        __break(1u);
        JUMPOUT(0x100006AA8);
      }
      for (uint64_t i = 0; i != v31; ++i)
      {
        if ((v23 & 0xC000000000000001) != 0) {
          uint64_t v33 = sub_100029C70();
        }
        else {
          uint64_t v33 = swift_retain();
        }
        *(unsigned char *)(v33 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) = 1;
        swift_release();
      }
LABEL_43:
      swift_bridgeObjectRelease_n();
LABEL_44:
      uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v20 = *v19;
      char v21 = 18;
LABEL_45:
      *uint64_t v19 = v21;
      sub_100004820(v20);
      sub_100005C50();
      return;
    case 2:
      if ((sub_1000070C4((uint64_t)&off_100035018) & 1) == 0) {
        return;
      }
      goto LABEL_44;
    case 3:
      if ((sub_100006AE8(22) & 1) == 0) {
        return;
      }
      uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v20 = *v19;
      char v21 = 21;
      goto LABEL_45;
    case 4:
      if ((sub_100006AE8(12) & 1) == 0) {
        return;
      }
      uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v20 = *v19;
      char v21 = 15;
      goto LABEL_45;
    case 5:
      if ((sub_100006AE8(9) & 1) == 0) {
        return;
      }
      uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v20 = *v19;
      char v21 = 7;
      goto LABEL_45;
    case 6:
      if ((sub_100006AE8(12) & 1) == 0) {
        return;
      }
      uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v20 = *v19;
      char v21 = 13;
      goto LABEL_45;
    case 7:
      if ((sub_100006AE8(17) & 1) == 0) {
        return;
      }
      uint64_t v19 = (unsigned __int8 *)(v3 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v20 = *v19;
      char v21 = 16;
      goto LABEL_45;
    default:
      JUMPOUT(0);
  }
}

uint64_t sub_100006AE8(char a1)
{
  uint64_t v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
  swift_beginAccess();
  char v4 = _s21MediaSetupViewService0B5StateO2eeoiySbAC_ACtFZ_0(a1, *v3);
  if ((v4 & 1) == 0)
  {
    unint64_t v10 = v1;
    uint64_t v5 = sub_100029850();
    os_log_type_t v11 = sub_100029AC0();
    if (!os_log_type_enabled(v5, v11))
    {

      goto LABEL_8;
    }
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    unint64_t v13 = SetupState.description.getter(a1);
    sub_100021F44(v13, v14, &v18);
    sub_100029B90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    unint64_t v15 = SetupState.description.getter(*v3);
    sub_100021F44(v15, v16, &v18);
    sub_100029B90();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v11, "State mismatch: expected '%s', have '%s'", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_6;
  }
  uint64_t v5 = sub_100029850();
  os_log_type_t v6 = sub_100029A90();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 136315138;
    unint64_t v8 = SetupState.description.getter(a1);
    sub_100021F44(v8, v9, &v18);
    sub_100029B90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s (valid)", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
LABEL_6:
    swift_slowDealloc();
  }
LABEL_8:

  return v4 & 1;
}

uint64_t sub_100006DB4(uint64_t a1)
{
  uint64_t v3 = (char **)(v1 + 16);
  swift_beginAccess();
  if (!*(void *)(*(void *)(v1 + 16) + 16)) {
    return 30;
  }
  while (1)
  {
    swift_beginAccess();
    char v4 = *v3;
    if (!*((void *)*v3 + 2))
    {
      __break(1u);
      JUMPOUT(0x100007054);
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unsigned __int8 *v3 = v4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      break;
    }
    uint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      goto LABEL_70;
    }
LABEL_7:
    uint64_t v7 = v6 - 1;
    uint64_t v8 = v4[v7 + 32];
    *((void *)v4 + 2) = v7;
    unsigned __int8 *v3 = v4;
    swift_endAccess();
    uint64_t v9 = *(void *)(a1 + 16);
    if (v9)
    {
      unint64_t v10 = (unsigned __int8 *)(a1 + 32);
      while (2)
      {
        int v12 = *v10++;
        char v11 = v12;
        switch(v12)
        {
          case 2:
            if (v8 == 2) {
              return v8;
            }
            goto LABEL_10;
          case 3:
            if (v8 == 3) {
              return v8;
            }
            goto LABEL_10;
          case 4:
            if (v8 == 4) {
              return v8;
            }
            goto LABEL_10;
          case 5:
            if (v8 == 5) {
              return v8;
            }
            goto LABEL_10;
          case 6:
            if (v8 == 6) {
              return v8;
            }
            goto LABEL_10;
          case 7:
            if (v8 == 7) {
              return v8;
            }
            goto LABEL_10;
          case 8:
            if (v8 == 8) {
              return v8;
            }
            goto LABEL_10;
          case 9:
            if (v8 == 9) {
              return v8;
            }
            goto LABEL_10;
          case 10:
            if (v8 == 10) {
              return v8;
            }
            goto LABEL_10;
          case 11:
            if (v8 == 11) {
              return v8;
            }
            goto LABEL_10;
          case 12:
            if (v8 == 12) {
              return v8;
            }
            goto LABEL_10;
          case 13:
            if (v8 == 13) {
              return v8;
            }
            goto LABEL_10;
          case 14:
            if (v8 == 14) {
              return v8;
            }
            goto LABEL_10;
          case 15:
            if (v8 == 15) {
              return v8;
            }
            goto LABEL_10;
          case 16:
            if (v8 == 16) {
              return v8;
            }
            goto LABEL_10;
          case 17:
            if (v8 == 17) {
              return v8;
            }
            goto LABEL_10;
          case 18:
            if (v8 == 18) {
              return v8;
            }
            goto LABEL_10;
          case 19:
            if (v8 == 19) {
              return v8;
            }
            goto LABEL_10;
          case 20:
            if (v8 == 20) {
              return v8;
            }
            goto LABEL_10;
          case 21:
            if (v8 == 21) {
              return v8;
            }
            goto LABEL_10;
          case 22:
            if (v8 == 22) {
              return v8;
            }
            goto LABEL_10;
          case 23:
            if (v8 == 23) {
              return v8;
            }
            goto LABEL_10;
          case 24:
            if (v8 == 24) {
              return v8;
            }
            goto LABEL_10;
          case 25:
            if (v8 == 25) {
              return v8;
            }
            goto LABEL_10;
          case 26:
            if (v8 == 26) {
              return v8;
            }
            goto LABEL_10;
          case 27:
            if (v8 == 27) {
              return v8;
            }
            goto LABEL_10;
          case 28:
            if (v8 == 28) {
              return v8;
            }
            goto LABEL_10;
          case 29:
            if (v8 != 29) {
              goto LABEL_10;
            }
            return v8;
          default:
            if (v8 - 2) >= 0x1C && ((v8 ^ ((v11 & 1) == 0))) {
              return v8;
            }
LABEL_10:
            if (--v9) {
              continue;
            }
            goto LABEL_3;
        }
      }
    }
LABEL_3:
    if (!*((void *)*v3 + 2)) {
      return 30;
    }
  }
  char v4 = sub_10000ED20((uint64_t)v4);
  unsigned __int8 *v3 = v4;
  uint64_t v6 = *((void *)v4 + 2);
  if (v6) {
    goto LABEL_7;
  }
LABEL_70:
  __break(1u);
  return 30;
}

uint64_t sub_1000070C4(uint64_t a1)
{
  uint64_t v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
  swift_beginAccess();
  char v4 = sub_100010EE0(*v3, a1);
  uint64_t v5 = v1;
  uint64_t v6 = v5;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100029850();
    os_log_type_t v12 = sub_100029AC0();
    if (os_log_type_enabled(v7, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      unint64_t v14 = SetupState.description.getter(*v3);
      sub_100021F44(v14, v15, &v19);
      sub_100029B90();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      unint64_t v16 = SetupState.description.getter(*v3);
      sub_100021F44(v16, v17, &v19);
      sub_100029B90();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v12, "State mismatch: expected '%s', have '%s'", (uint8_t *)v13, 0x16u);
      goto LABEL_6;
    }

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v7 = sub_100029850();
  os_log_type_t v8 = sub_100029A90();
  if (!os_log_type_enabled(v7, v8)) {
    goto LABEL_8;
  }
  uint64_t v9 = (uint8_t *)swift_slowAlloc();
  uint64_t v19 = swift_slowAlloc();
  *(_DWORD *)uint64_t v9 = 136315138;
  unint64_t v10 = SetupState.description.getter(*v3);
  sub_100021F44(v10, v11, &v19);
  sub_100029B90();

  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s (valid)", v9, 0xCu);
LABEL_6:
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();
LABEL_9:

  return v4 & 1;
}

void sub_100007398()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029810();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = sub_100004FAC();
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 serviceID];

    sub_1000297E0();
    uint64_t v9 = sub_1000297C0();
    unint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    os_log_type_t v12 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_defaults);
    if (!v12)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      return;
    }
    NSString v13 = sub_100029950();
    id v14 = [v12 arrayForKey:v13];

    if (!v14
      || (uint64_t v15 = sub_100029A10(), v14, v16 = (char *)sub_10001FA30(v15), swift_bridgeObjectRelease(), !v16))
    {
      sub_100002798(&qword_10003C510);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_10002A710;
      *(void *)(v20 + 32) = v9;
      *(void *)(v20 + 40) = v11;
      Class isa = sub_100029A00().super.isa;
      swift_bridgeObjectRelease();
      NSString v22 = sub_100029950();
      [v12 setObject:isa forKey:v22];

      return;
    }
    if (sub_100011114(v9, v11, v16))
    {
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    swift_bridgeObjectRetain_n();
    unint64_t v23 = sub_100029850();
    os_log_type_t v24 = sub_100029A90();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      os_log_t v32 = (os_log_t)(v25 + 4);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_100021F44(v9, v11, &v34);
      sub_100029B90();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "noted successful setup of %s", (uint8_t *)v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v16 = sub_10000EC10(0, *((void *)v16 + 2) + 1, 1, v16);
    }
    unint64_t v27 = *((void *)v16 + 2);
    unint64_t v26 = *((void *)v16 + 3);
    if (v27 >= v26 >> 1) {
      unint64_t v16 = sub_10000EC10((char *)(v26 > 1), v27 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v27 + 1;
    uint64_t v28 = &v16[16 * v27];
    *((void *)v28 + 4) = v9;
    *((void *)v28 + 5) = v11;
    Class v29 = sub_100029A00().super.isa;
    swift_bridgeObjectRelease();
    NSString v30 = sub_100029950();
    [v12 setObject:v29 forKey:v30];
  }
  else
  {
    os_log_t v32 = (os_log_t)sub_100029850();
    os_log_type_t v17 = sub_100029AB0();
    if (os_log_type_enabled(v32, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v17, "Failed to note service as a successful onboard. had no serviceID", v18, 2u);
      swift_slowDealloc();
    }
    os_log_t v19 = v32;
  }
}

void sub_10000787C(char a1)
{
  uint64_t v3 = sub_100029810();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      uint64_t v8 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_didEncounterErrorDuringSetup);
      id v9 = objc_allocWithZone((Class)MSSetupEarlyExitEvent);
      NSString v10 = sub_100029950();
      swift_bridgeObjectRelease();
      id v11 = [v9 initWithExitReason:v10 didEncounterError:v8];

      id v12 = sub_100004FAC();
      if (v12)
      {
        NSString v13 = v12;
        id v14 = [v12 serviceID];

        sub_1000297E0();
        sub_1000297C0();
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        NSString v15 = sub_100029950();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v15 = 0;
      }
      [v11 setServiceID:v15];

      [self sendSetupEvent:v11];
      break;
    case 4:
      return;
    default:
      if (!*(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession__completedSetupEvent))
      {
        uint64_t v7 = sub_100007BF8();
        if (v7)
        {
          id v23 = v7;
        }
        else
        {
          unint64_t v16 = sub_100029850();
          os_log_type_t v17 = sub_100029A90();
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "completed setup but somehow did it without a service or serviceID. recording error", v18, 2u);
            swift_slowDealloc();
          }

          id v19 = objc_allocWithZone((Class)MSSetupFailedEvent);
          NSString v20 = sub_100029950();
          id v23 = [v19 initWithErrorNamed:v20];
        }
        [self sendSetupEvent:v23];
        char v21 = v23;
      }
      break;
  }
}

void *sub_100007BF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000297A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100029810();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  NSString v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  NSString v15 = (char *)&v30 - v14;
  unint64_t v16 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount);
  if (!v16) {
    return 0;
  }
  uint64_t v31 = v3;
  id v17 = v16;
  id v18 = [v17 serviceID];
  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_8;
  }
  id v19 = v18;
  uint64_t v30 = v2;
  sub_1000297E0();

  NSString v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v20(v8, v13, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_8:

    sub_100010604((uint64_t)v8, (uint64_t *)&unk_10003BD30);
    return 0;
  }
  v20(v15, v8, v9);
  uint64_t v21 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession__completedSetupEvent;
  if (*(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession__completedSetupEvent))
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
  else
  {
    id v23 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_setupAnalyticEvent);
    sub_1000297C0();
    NSString v24 = sub_100029950();
    swift_bridgeObjectRelease();
    [v23 setServiceID:v24];

    sub_100029790();
    Class isa = sub_100029780().super.isa;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v30);
    [v23 setEndTime:isa];

    unint64_t v26 = *(void **)(v1 + v21);
    *(void *)(v1 + v21) = v23;
    id v27 = v23;

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
  uint64_t v22 = *(void **)(v1 + v21);
  id v28 = v22;
  return v22;
}

id SetupSession.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id SetupSession.init()()
{
  id v1 = v0;
  uint64_t v2 = sub_1000298B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homesToSetup] = &_swiftEmptyArrayStorage;
  v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state] = 4;
  *(void *)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount] = 0;
  uint64_t v6 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_dispatchQueue;
  sub_1000102BC(0, (unint64_t *)&qword_10003BA70);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchQoS.QoSClass.default(_:), v2);
  uint64_t v7 = v0;
  uint64_t v8 = sub_100029B10();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)&v1[v6] = v8;
  uint64_t v9 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostAuditToken];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  uint64_t v10 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID];
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_progressHandler];
  void *v11 = 0;
  v11[1] = 0;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags] = 0;
  v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_didEncounterErrorDuringSetup] = 0;
  sub_100029860();
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist] = 0;
  uint64_t v12 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel];
  v12[1] = 0;
  v12[2] = 0;
  *uint64_t v12 = 0;
  NSString v13 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configPublicKey];
  *NSString v13 = 0;
  v13[1] = 0;
  v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeTopology] = 3;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager] = 0;
  uint64_t v14 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext];
  *uint64_t v14 = 0u;
  v14[1] = 0u;
  v14[2] = 0u;
  v14[3] = 0u;
  NSString v15 = &v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext];
  *NSString v15 = 0u;
  v15[1] = 0u;
  v15[2] = 0u;
  uint64_t v15[3] = 0u;
  uint64_t v16 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stateStack;
  sub_100002798(&qword_10003BC60);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = &_swiftEmptyArrayStorage;
  *(void *)&v7[v16] = v17;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_recoverableStates] = &off_100035068;
  uint64_t v18 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_setupAnalyticEvent;
  *(void *)&v7[v18] = [objc_allocWithZone((Class)MSSetupCompleteEvent) init];
  uint64_t v19 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_defaults;
  id v20 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v21 = sub_100029950();
  id v22 = [v20 initWithSuiteName:v21];

  *(void *)&v7[v19] = v22;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___configuration] = 0;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession____lazy_storage___mediaService] = 1;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession__completedSetupEvent] = 0;

  id v23 = (objc_class *)type metadata accessor for SetupSession();
  v25.receiver = v7;
  v25.super_class = v23;
  return objc_msgSendSuper2(&v25, "init");
}

id SetupSession.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupSession();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100008548()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist) = 1;
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostAuditToken);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostAuditToken + 32))
  {
    oslog = sub_100029850();
    os_log_type_t v3 = sub_100029AB0();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      uint64_t v5 = "### Missing host audit token?";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, v5, v4, 2u);
      swift_slowDealloc();
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount);
  if (!v6)
  {
    oslog = sub_100029850();
    os_log_type_t v3 = sub_100029AB0();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      uint64_t v5 = "### Missing setup context?";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  uint64_t v8 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v10 = *v2;
  uint64_t v9 = v2[1];
  type metadata accessor for EntitlementProxy(0);
  swift_allocObject();
  id v11 = v6;
  sub_100019614(v10, v9, v8, v7);
  *(unsigned char *)(v1 + 3) = sub_100018CF0(v11);

  swift_release();
}

uint64_t sub_100008720(char a1, void *a2)
{
  uint64_t v5 = sub_1000298A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000298D0();
  uint64_t result = __chkstk_darwin();
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v2 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_progressHandler);
  if (v13)
  {
    uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_progressHandler + 8);
    uint64_t v20 = v10;
    uint64_t v21 = result;
    sub_1000102BC(0, (unint64_t *)&qword_10003BA70);
    swift_retain();
    uint64_t v19 = sub_100029AF0();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v13;
    *(void *)(v15 + 24) = v14;
    *(unsigned char *)(v15 + 32) = a1;
    sub_10001040C((uint64_t)a2, v15 + 40, &qword_10003BD40);
    aBlock[4] = sub_100010800;
    aBlock[5] = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C76C;
    aBlock[3] = &unk_100035470;
    uint64_t v16 = _Block_copy(aBlock);
    sub_100010834(v13);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
    swift_release();
    sub_1000298C0();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100010660((unint64_t *)&qword_10003BD90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100002798(&qword_10003BD98);
    sub_1000106F0((unint64_t *)&qword_10003BDA0, &qword_10003BD98);
    sub_100029BD0();
    uint64_t v17 = (void *)v19;
    sub_100029B00();
    _Block_release(v16);

    sub_100010844(v13);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v12, v21);
  }
  return result;
}

void sub_100008A70()
{
  id v0 = sub_100004FAC();
  if (v0)
  {
    id v11 = v0;
    SetupSession.targetHome.getter();
    if (v1)
    {
      uint64_t v2 = v1;
      os_log_type_t v3 = sub_100029850();
      os_log_type_t v4 = sub_100029A90();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Switching to new service", v5, 2u);
        swift_slowDealloc();
      }

      id v6 = sub_100004F0C();
      uint64_t v7 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v7;
      *(void *)(v8 + 24) = v2;
      aBlock[4] = sub_100010598;
      aBlock[5] = v8;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000095D4;
      aBlock[3] = &unk_100035330;
      uint64_t v9 = _Block_copy(aBlock);
      id v10 = v2;
      swift_release();
      [v6 switchUserAccountInfo:v11 home:v10 completion:v9];
      _Block_release(v9);
    }
    else
    {
      sub_100008CD4(2, 0x6567726174206F4ELL, 0xEF3F656D6F682074, 1);
    }
  }
  else
  {
    sub_100008CD4(2, 0xD000000000000010, 0x800000010002BD90, 1);
  }
}

void sub_100008CD4(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100029810();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_100029850();
  os_log_type_t v15 = sub_100029AB0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  int v62 = a4;
  uint64_t v59 = v11;
  uint64_t v60 = v10;
  uint64_t v58 = v13;
  uint64_t v63 = a1;
  if (v16)
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    v65[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_100021F44(a2, a3, v65);
    sub_100029B90();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "### %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v61 = v5;
  uint64_t v18 = (uint64_t *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
  uint64_t v19 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
  uint64_t v20 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8);
  uint64_t v21 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16);
  id v22 = *(void **)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24);
  uint64_t v23 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32);
  uint64_t v24 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40);
  uint64_t v25 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48);
  uint64_t v26 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
  id v27 = (uint64_t *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext);
  uint64_t v28 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext);
  uint64_t v29 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 8);
  uint64_t v30 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 16);
  uint64_t v31 = *(void **)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 24);
  uint64_t v32 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 32);
  uint64_t v33 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 40);
  uint64_t v34 = *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_preErrorContext + 48);
  uint64_t v35 = v27[7];
  *id v27 = v19;
  v27[1] = v20;
  v27[2] = v21;
  v27[3] = (uint64_t)v22;
  v27[4] = v23;
  v27[5] = v24;
  v27[6] = v25;
  v27[7] = v26;
  sub_1000100D8(v19, v20, v21, v22, v23, v24, v25, v26);
  sub_1000101B8(v28, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v36 = v63;
  uint64_t v38 = *v18;
  uint64_t v37 = v18[1];
  uint64_t v39 = v18[2];
  uint64_t v40 = (void *)v18[3];
  uint64_t v41 = v18[4];
  uint64_t v42 = v18[5];
  uint64_t v43 = v18[6];
  uint64_t v44 = v18[7];
  *(_OWORD *)uint64_t v18 = xmmword_10002A980;
  *((_OWORD *)v18 + 1) = 0u;
  *((_OWORD *)v18 + 2) = 0u;
  uint64_t v45 = v61;
  v18[6] = v36;
  v18[7] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100010118(0, 1, 0, 0);
  swift_bridgeObjectRetain();
  sub_1000101B8(v38, v37, v39, v40, v41, v42, v43, v44);
  sub_100004B04();
  sub_1000101F8(0, 1, 0, 0);
  uint64_t v46 = v45;
  swift_bridgeObjectRelease();
  uint64_t v47 = (unsigned __int8 *)(v45 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
  swift_beginAccess();
  unsigned __int8 v48 = *v47;
  *uint64_t v47 = 3;
  sub_100004820(v48);
  *(unsigned char *)(v46 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_didEncounterErrorDuringSetup) = 1;
  id v49 = objc_allocWithZone((Class)MSSetupFailedEvent);
  NSString v50 = sub_100029950();
  swift_bridgeObjectRelease();
  id v51 = [v49 initWithErrorNamed:v50];

  id v52 = sub_100004FAC();
  NSString v53 = v52;
  if (v52)
  {
    id v54 = [v52 serviceID];

    uint64_t v55 = v58;
    sub_1000297E0();

    sub_1000297C0();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v55, v60);
    NSString v53 = sub_100029950();
    swift_bridgeObjectRelease();
  }
  char v56 = v62;
  objc_msgSend(v51, "setServiceID:", v53, v58);

  id v57 = [self sendSetupEvent:v51];
  if (v56) {
    sub_100005C50(v57);
  }
}

void sub_10000917C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_100029810();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = (unsigned char *)Strong;
    id v11 = a3;
    swift_errorRetain();
    id v12 = v11;
    swift_errorRetain();
    uint64_t v13 = sub_100029850();
    int v14 = sub_100029A90();
    if (os_log_type_enabled(v13, (os_log_type_t)v14))
    {
      int v35 = v14;
      os_log_t v36 = v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v33 = v6;
      uint64_t v16 = v15;
      uint64_t v34 = swift_slowAlloc();
      v38[0] = v34;
      *(_DWORD *)uint64_t v16 = 136381187;
      id v17 = [v12 name];
      uint64_t v18 = sub_100029960();
      unint64_t v20 = v19;

      uint64_t v37 = sub_100021F44(v18, v20, v38);
      sub_100029B90();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2081;
      id v21 = [v12 uniqueIdentifier];
      sub_1000297E0();

      sub_100010660((unint64_t *)&qword_10003BD50, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v22 = sub_100029D70();
      unint64_t v24 = v23;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v5);
      uint64_t v37 = sub_100021F44(v22, v24, v38);
      sub_100029B90();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2080;
      if (a1)
      {
        swift_getErrorValue();
        uint64_t v25 = sub_100029DB0();
        unint64_t v27 = v26;
      }
      else
      {
        unint64_t v27 = 0xE300000000000000;
        uint64_t v25 = 7104878;
      }
      uint64_t v37 = sub_100021F44(v25, v27, v38);
      sub_100029B90();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v28 = v36;
      _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v35, "Setup: %{private}s (%{private}s error=%s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      if (!a1) {
        goto LABEL_9;
      }
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      if (!a1)
      {
LABEL_9:
        v10[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist + 6] = 1;
        uint64_t v29 = &v10[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
        swift_beginAccess();
        unsigned __int8 v30 = *v29;
        *uint64_t v29 = 13;
        uint64_t v31 = sub_100004820(v30);
        sub_100005C50(v31);
        goto LABEL_10;
      }
    }
    sub_100008CD4(3, 0x6166207075746553, 0xEC00000064656C69, 1);
LABEL_10:
  }
}

void sub_1000095D4(uint64_t a1, void *a2)
{
}

void sub_1000095DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100002798((uint64_t *)&unk_10003BD30);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v79 - v6;
  uint64_t v8 = sub_100029810();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  id v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v79 - v14;
  __chkstk_darwin(v13);
  id v17 = (char *)&v79 - v16;
  if ((sub_100006AE8(4) & 1) == 0) {
    return;
  }
  if (*(void *)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags])
  {
    sub_10000C7B0();
    return;
  }
  uint64_t v18 = &v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist];
  char v19 = v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist + 1];
  v84 = &v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist];
  if ((v19 & 1) == 0)
  {
    unint64_t v20 = sub_100029850();
    os_log_type_t v21 = sub_100029A90();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v85 = v9;
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Starting HomeKit", v22, 2u);
      uint64_t v9 = v85;
      swift_slowDealloc();
    }

    id v23 = [objc_allocWithZone((Class)HMHomeManager) init];
    uint64_t v24 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager;
    uint64_t v25 = *(void **)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager];
    *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager] = v23;

    unint64_t v26 = *(void **)&v1[v24];
    if (v26) {
      [v26 setDelegate:v1];
    }
    uint64_t v18 = v84;
    v84[1] = 1;
  }
  if (v18[4] != 1)
  {
    uint64_t v33 = sub_100029850();
    os_log_type_t v34 = sub_100029AC0();
    if (os_log_type_enabled(v33, v34))
    {
      int v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v35 = 0;
      os_log_t v36 = "Still waiting on HomeKit update...";
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v33, v34, v36, v35, 2u);
      swift_slowDealloc();
    }
LABEL_28:

    uint64_t v37 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v38 = *v37;
    *uint64_t v37 = 5;
    sub_100004820(v38);
    return;
  }
  if ((v18[7] & 1) == 0)
  {
    unint64_t v27 = sub_100029850();
    os_log_type_t v28 = sub_100029A90();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v85 = v9;
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Starting service ID mapping", v29, 2u);
      uint64_t v9 = v85;
      swift_slowDealloc();
    }

    sub_10000C9B8();
  }
  unsigned __int8 v30 = *(void **)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount];
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_25;
  }
  id v31 = [v30 serviceID];
  if (v31)
  {
    uint64_t v32 = v31;
    sub_1000297E0();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
  }
  sub_10001040C((uint64_t)v5, (uint64_t)v7, (uint64_t *)&unk_10003BD30);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
LABEL_25:
    sub_100010604((uint64_t)v7, (uint64_t *)&unk_10003BD30);
    uint64_t v33 = sub_100029850();
    os_log_type_t v34 = sub_100029A90();
    if (os_log_type_enabled(v33, v34))
    {
      int v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v35 = 0;
      os_log_t v36 = "Still waiting on serviceID....";
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v82 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  uint64_t v83 = v9 + 32;
  v82(v17, v7, v8);
  uint64_t v39 = v84;
  if ((v84[5] & 1) == 0)
  {
    uint64_t v85 = v9;
    uint64_t v40 = *(void **)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager];
    if (v40)
    {
      id v41 = [v40 homes];
      sub_1000102BC(0, &qword_10003BBD8);
      unint64_t v42 = sub_100029A10();
    }
    else
    {
      unint64_t v42 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    if (v42 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_100029D00();
      swift_bridgeObjectRelease();
      v79 = v17;
      if (v43) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v43 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v79 = v17;
      if (v43)
      {
LABEL_36:
        aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
        sub_100022754(0, v43 & ~(v43 >> 63), 0);
        if (v43 < 0)
        {
          __break(1u);
          return;
        }
        uint64_t v44 = 0;
        uint64_t v45 = aBlock[0];
        unint64_t v80 = v42 & 0xC000000000000001;
        unint64_t v81 = v42;
        uint64_t v46 = v43;
        do
        {
          if (v80) {
            id v47 = (id)sub_100029C70();
          }
          else {
            id v47 = *(id *)(v42 + 8 * v44 + 32);
          }
          unsigned __int8 v48 = v47;
          id v49 = objc_msgSend(v47, "currentUser", v79);
          id v50 = [v49 uniqueIdentifier];

          sub_1000297E0();
          aBlock[0] = v45;
          unint64_t v52 = *(void *)(v45 + 16);
          unint64_t v51 = *(void *)(v45 + 24);
          if (v52 >= v51 >> 1)
          {
            sub_100022754(v51 > 1, v52 + 1, 1);
            uint64_t v45 = aBlock[0];
          }
          ++v44;
          *(void *)(v45 + 16) = v52 + 1;
          v82((char *)(v45+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(void *)(v85 + 72) * v52), v15, v8);
          unint64_t v42 = v81;
        }
        while (v46 != v44);
        swift_bridgeObjectRelease();
        id v17 = v79;
        goto LABEL_47;
      }
    }
    swift_bridgeObjectRelease();
LABEL_47:
    uint64_t v9 = v85;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v12, v17, v8);
    swift_bridgeObjectRetain_n();
    NSString v53 = sub_100029850();
    os_log_type_t v54 = sub_100029A90();
    int v55 = v54;
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v56 = swift_slowAlloc();
      uint64_t v83 = swift_slowAlloc();
      aBlock[0] = v83;
      *(_DWORD *)uint64_t v56 = 136380931;
      LODWORD(v82) = v55;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_100029A20();
      unint64_t v59 = v58;
      swift_bridgeObjectRelease();
      uint64_t v86 = sub_100021F44(v57, v59, aBlock);
      sub_100029B90();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2080;
      sub_100010660((unint64_t *)&qword_10003BD50, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v60 = sub_100029D70();
      uint64_t v86 = sub_100021F44(v60, v61, aBlock);
      id v17 = v79;
      sub_100029B90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      _os_log_impl((void *)&_mh_execute_header, v53, (os_log_type_t)v82, "Getting configuration info for userIDs %{private}s serviceID %s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    id v62 = sub_100004F0C();
    Class isa = sub_100029A00().super.isa;
    swift_bridgeObjectRelease();
    Class v64 = sub_1000297D0().super.isa;
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = v1;
    aBlock[4] = (uint64_t)sub_100010280;
    aBlock[5] = v65;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000D164;
    aBlock[3] = (uint64_t)&unk_100035218;
    v66 = _Block_copy(aBlock);
    v67 = v1;
    swift_release();
    [v62 getServiceConfigurationInfo:isa serviceID:v64 completion:v66];
    _Block_release(v66);

    uint64_t v39 = v84;
    v84[5] = 1;
  }
  if (*(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8])
  {
    if ((*v39 & 1) == 0)
    {
      sub_100008548();
      uint64_t v39 = v84;
    }
    if (v39[3] == 1)
    {
      v68 = sub_100029850();
      os_log_type_t v69 = sub_100029A90();
      if (os_log_type_enabled(v68, v69))
      {
        v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v70 = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "Preflight completed, all info loaded.", v70, 2u);
        swift_slowDealloc();
      }

      v71 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
      swift_beginAccess();
      unsigned __int8 v72 = *v71;
      unsigned __int8 *v71 = 6;
      uint64_t v73 = sub_100004820(v72);
      sub_100005C50(v73);
    }
    else
    {
      sub_100008CD4(1, 0xD000000000000033, 0x800000010002BBD0, 1);
    }
  }
  else
  {
    v74 = sub_100029850();
    os_log_type_t v75 = sub_100029AC0();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "Still waiting on config model...", v76, 2u);
      swift_slowDealloc();
    }

    v77 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v78 = *v77;
    unsigned __int8 *v77 = 5;
    sub_100004820(v78);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
}

void sub_10000A228()
{
  uint64_t v1 = v0;
  if (sub_100006AE8(6))
  {
    uint64_t v2 = v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel;
    if (*(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8))
    {
      uint64_t v3 = *(void *)(v2 + 16);
      id v4 = *(id *)v2;
      uint64_t v5 = swift_bridgeObjectRetain();
      BOOL v6 = sub_10001D7C8(v5, v3);
      uint64_t v7 = sub_100029850();
      os_log_type_t v8 = sub_100029A90();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 67109120;
        sub_100029B90();
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Should offer 'learn more' = %{BOOL}d", v9, 8u);
        swift_slowDealloc();
      }

      if (v6) {
        char v10 = 8;
      }
      else {
        char v10 = 10;
      }
      uint64_t v11 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v12 = *v11;
      unsigned __int8 *v11 = v10;
      uint64_t v13 = sub_100004820(v12);
      sub_100005C50(v13);
      swift_bridgeObjectRelease();
    }
    else
    {
      oslog = sub_100029850();
      os_log_type_t v14 = sub_100029AB0();
      if (os_log_type_enabled(oslog, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v14, "### No config model?", v15, 2u);
        swift_slowDealloc();
      }
    }
  }
}

uint64_t sub_10000A444()
{
  uint64_t v1 = sub_1000298A0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000298D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100006AE8(7);
  if (result)
  {
    memset(v21, 0, 64);
    sub_100008720(8, v21);
    uint64_t v18 = v5;
    char v10 = (unsigned __int8 *)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v11 = *v10;
    *char v10 = 9;
    sub_100004820(v11);
    unsigned __int8 v12 = *(void **)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_dispatchQueue];
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v0;
    aBlock[4] = sub_100010360;
    aBlock[5] = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C76C;
    aBlock[3] = &unk_1000352B8;
    os_log_type_t v14 = _Block_copy(aBlock);
    id v15 = v12;
    uint64_t v16 = v0;
    sub_1000298C0();
    char v19 = &_swiftEmptyArrayStorage;
    sub_100010660((unint64_t *)&qword_10003BD90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100002798(&qword_10003BD98);
    sub_1000106F0((unint64_t *)&qword_10003BDA0, &qword_10003BD98);
    sub_100029BD0();
    sub_100029B00();
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);
    return swift_release();
  }
  return result;
}

void sub_10000A764()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029810();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100006AE8(10))
  {
    uint64_t v6 = (void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel);
    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8);
    if (v7)
    {
      os_log_type_t v8 = *v6;
      uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount);
      if (v9)
      {
        sub_1000103CC(*v6, *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8));
        id v10 = v9;
        sub_100005764((uint64_t)v5);
        id v41 = v10;
        sub_10001DC0C(v10, (uint64_t)v5, v7, (uint64_t)v43);
        uint64_t v38 = v43[1];
        uint64_t v39 = v43[0];
        uint64_t v40 = v44;
        unsigned __int8 v11 = v45;
        uint64_t v36 = v46[1];
        uint64_t v37 = v46[0];
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        sub_10001040C((uint64_t)v43, (uint64_t)v49, &qword_10003BD88);
        sub_10001040C((uint64_t)&v45, (uint64_t)&v48, &qword_10003BDA8);
        sub_10001040C((uint64_t)v46, (uint64_t)v47, &qword_10003BD88);
        sub_100010470((uint64_t)v49);
        sub_10001049C(&v48);
        sub_100010470((uint64_t)v47);
        unsigned __int8 v12 = sub_100029850();
        os_log_type_t v13 = sub_100029A90();
        if (os_log_type_enabled(v12, v13))
        {
          os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)os_log_type_t v14 = 67109120;
          int v42 = v44 & 1;
          sub_100029B90();
          sub_1000104C8((uint64_t)v49);
          sub_1000104F4(&v48);
          sub_1000104C8((uint64_t)v47);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Account mismatch = %{BOOL}d", v14, 8u);
          swift_slowDealloc();
        }
        else
        {

          sub_1000104C8((uint64_t)v49);
          sub_1000104F4(&v48);
          sub_1000104C8((uint64_t)v47);
        }
        uint64_t v16 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
        if (v44)
        {
          swift_beginAccess();
          unsigned __int8 v19 = *v16;
          *uint64_t v16 = 11;
          sub_100004820(v19);
          unint64_t v20 = (uint64_t *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
          uint64_t v34 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
          uint64_t v33 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8);
          uint64_t v32 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16);
          id v31 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24);
          uint64_t v30 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32);
          uint64_t v29 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40);
          int v35 = v8;
          uint64_t v21 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48);
          uint64_t v28 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
          uint64_t v23 = v38;
          uint64_t v22 = v39;
          *unint64_t v20 = v39;
          v20[1] = v23;
          uint64_t v24 = v40;
          v20[2] = v40;
          v20[3] = (uint64_t)v11;
          uint64_t v25 = v36;
          v20[4] = v37;
          v20[5] = v25;
          v20[6] = 6;
          v20[7] = (uint64_t)&_swiftEmptyArrayStorage;
          sub_100010470((uint64_t)v49);
          sub_10001049C(&v48);
          sub_100010470((uint64_t)v47);
          sub_100010118(v22, v23, v24, v11);
          swift_bridgeObjectRetain();
          uint64_t v26 = v21;
          os_log_type_t v8 = v35;
          sub_1000101B8(v34, v33, v32, v31, v30, v29, v26, v28);
          sub_100004B04();
          sub_1000101F8(v22, v23, v24, v11);
          uint64_t v18 = swift_bridgeObjectRelease();
        }
        else
        {
          swift_beginAccess();
          unsigned __int8 v17 = *v16;
          *uint64_t v16 = 15;
          uint64_t v18 = sub_100004820(v17);
        }
        sub_100005C50(v18);
        sub_1000104C8((uint64_t)v49);
        sub_1000104F4(&v48);
        sub_1000104C8((uint64_t)v47);
        swift_bridgeObjectRelease();
      }
      else
      {
        id v41 = v8;
        swift_bridgeObjectRetain();
        sub_100008CD4(2, 0xD000000000000011, 0x800000010002BD70, 1);
        swift_bridgeObjectRelease();
        id v15 = v41;
      }
    }
    else
    {
      sub_100008CD4(2, 0x69666E6F63206F4ELL, 0xEF3F6F666E692067, 1);
    }
  }
}

uint64_t sub_10000ACA0()
{
  uint64_t result = sub_100006AE8(13);
  if (result)
  {
    uint64_t v2 = v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist;
    if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags) & 4) != 0)
    {
      *(unsigned char *)(v2 + 6) = 1;
      goto LABEL_6;
    }
    if (*(unsigned char *)(v2 + 6))
    {
      [*(id *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_setupAnalyticEvent) setDidSwitchAccount:1];
LABEL_6:
      uint64_t v3 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
      swift_beginAccess();
      unsigned __int8 v4 = *v3;
      unsigned __int8 *v3 = 15;
      uint64_t v5 = sub_100004820(v4);
      return sub_100005C50(v5);
    }
    sub_100008A70();
    uint64_t v6 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
    swift_beginAccess();
    unsigned __int8 v7 = *v6;
    *uint64_t v6 = 14;
    return sub_100004820(v7);
  }
  return result;
}

uint64_t sub_10000AD88()
{
  uint64_t v1 = v0;
  uint64_t result = sub_100006AE8(15);
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v3 = &v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel];
  uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8];
  if (!v4) {
    return result;
  }
  uint64_t v5 = *((void *)v3 + 2);
  uint64_t v6 = *(void **)v3;
  sub_1000103CC(*(void **)v3, *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8]);
  unsigned __int8 v7 = *(void **)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount];
  id v8 = v7;
  unint64_t v9 = sub_10001B4C4((uint64_t)v7, v6, v4, v5);
  LOBYTE(v5) = v10;
  swift_bridgeObjectRelease();

  uint64_t v60 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeTopology;
  v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeTopology] = v5;
  unsigned __int8 v11 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext];
  uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext];
  uint64_t v13 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 8];
  uint64_t v14 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 16];
  id v15 = *(void **)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 24];
  uint64_t v16 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 32];
  uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 40];
  uint64_t v18 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 48];
  uint64_t v19 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56];
  *(_OWORD *)unsigned __int8 v11 = xmmword_10002A980;
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *((void *)v11 + 6) = 6;
  *((void *)v11 + 7) = v9;
  sub_100010118(0, 1, 0, 0);
  swift_bridgeObjectRetain();
  sub_100010118(0, 1, 0, 0);
  swift_bridgeObjectRetain();
  sub_1000101B8(v12, v13, v14, v15, v16, v17, v18, v19);
  sub_100004B04();
  sub_1000101F8(0, 1, 0, 0);
  swift_bridgeObjectRelease();
  if ((v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags] & 8) != 0) {
    goto LABEL_59;
  }
  unint64_t v20 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist];
  if (v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist + 2] == 1)
  {
    uint64_t v21 = v1;
    unint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v23 = sub_10000EF74(v22, (uint64_t)v21);
    swift_bridgeObjectRelease();

    if (v23)
    {
      v23[17] = 1;
      swift_release();
    }
  }
  if (v9 >> 62) {
    goto LABEL_44;
  }
  uint64_t v24 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v24)
  {
LABEL_45:
    int v37 = 0;
    int v59 = 0;
    int v32 = 0;
    goto LABEL_46;
  }
LABEL_9:
  unint64_t v25 = v9 & 0xC000000000000001;
  swift_bridgeObjectRetain_n();
  uint64_t v26 = 4;
  while (1)
  {
    uint64_t v27 = v26 - 4;
    if (v25)
    {
      uint64_t v28 = sub_100029C70();
      BOOL v29 = __OFADD__(v27, 1);
      uint64_t v30 = v26 - 3;
      if (v29) {
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v28 = swift_retain();
      BOOL v29 = __OFADD__(v27, 1);
      uint64_t v30 = v26 - 3;
      if (v29)
      {
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_100029D00();
        swift_bridgeObjectRelease();
        if (!v24) {
          goto LABEL_45;
        }
        goto LABEL_9;
      }
    }
    if (!*(void *)(v28 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service)) {
      break;
    }
    swift_release();
LABEL_11:
    ++v26;
    if (v30 == v24)
    {
      int v32 = 1;
      goto LABEL_21;
    }
  }
  int v31 = *(unsigned __int8 *)(v28 + 16);
  swift_release();
  if ((v31 | 2) != 2) {
    goto LABEL_11;
  }
  int v32 = 0;
LABEL_21:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain_n();
  uint64_t v33 = 4;
  while (1)
  {
    uint64_t v34 = v33 - 4;
    if (v25)
    {
      uint64_t v35 = sub_100029C70();
      BOOL v29 = __OFADD__(v34, 1);
      uint64_t v36 = v33 - 3;
      if (v29) {
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v35 = swift_retain();
      BOOL v29 = __OFADD__(v34, 1);
      uint64_t v36 = v33 - 3;
      if (v29) {
        goto LABEL_43;
      }
    }
    int v37 = *(unsigned __int8 *)(v35 + 16);
    swift_release();
    if ((v37 | 2) == 2) {
      break;
    }
    ++v33;
    if (v36 == v24)
    {
      int v59 = 0;
      goto LABEL_31;
    }
  }
  int v59 = 1;
LABEL_31:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain_n();
  uint64_t v38 = 4;
  while (2)
  {
    uint64_t v43 = v38 - 4;
    if (!v25)
    {
      uint64_t v39 = swift_retain();
      BOOL v29 = __OFADD__(v43, 1);
      uint64_t v40 = v38 - 3;
      if (v29) {
        break;
      }
      goto LABEL_33;
    }
    uint64_t v39 = sub_100029C70();
    BOOL v29 = __OFADD__(v43, 1);
    uint64_t v40 = v38 - 3;
    if (!v29)
    {
LABEL_33:
      int v41 = *(unsigned __int8 *)(v39 + 16);
      swift_release();
      BOOL v42 = v41 == 2;
      int v37 = v41 == 2;
      ++v38;
      BOOL v42 = v42 || v40 == v24;
      if (v42) {
        goto LABEL_41;
      }
      continue;
    }
    break;
  }
  __break(1u);
LABEL_41:
  swift_bridgeObjectRelease_n();
LABEL_46:
  unsigned __int8 v44 = sub_100029850();
  os_log_type_t v45 = sub_100029A90();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 67109632;
    sub_100029B90();
    *(_WORD *)(v46 + 8) = 1024;
    sub_100029B90();
    *(_WORD *)(v46 + 14) = 1024;
    LODWORD(v61[0]) = v37;
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "HomeTopologyCheck allSetup=%{BOOL}d inelgibible=%{BOOL}d needsUpdate=%{BOOL}d", (uint8_t *)v46, 0x14u);
    swift_slowDealloc();
  }

  int v47 = v1[v60];
  if (v47 == 3 || !v1[v60])
  {
    id v48 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v49 = *v48;
    char v50 = 8;
    goto LABEL_63;
  }
  if (v20[2] != 1)
  {
    if ((v59 & v32) == 1)
    {
      id v48 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
      swift_beginAccess();
      unsigned __int8 v49 = *v48;
      char v50 = 26;
LABEL_63:
      *id v48 = v50;
      goto LABEL_64;
    }
    if (!v37)
    {
      BOOL v52 = v47 == 1;
      char v51 = 23;
      goto LABEL_67;
    }
LABEL_59:
    SetupSession.targetHome.getter();
    if (v53)
    {
      os_log_type_t v54 = v53;
      char v55 = [v53 isCurrentUserHomeOwner];
    }
    else
    {
      char v55 = 0;
    }
    memset(v61, 0, sizeof(v61));
    sub_100008720(v55, v61);
    id v48 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v49 = *v48;
    char v50 = 17;
    goto LABEL_63;
  }
  if (v20[6]) {
    char v51 = 26;
  }
  else {
    char v51 = 29;
  }
  BOOL v52 = v47 == 1;
LABEL_67:
  if (v52) {
    char v57 = v51;
  }
  else {
    char v57 = 20;
  }
  unint64_t v58 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
  swift_beginAccess();
  unsigned __int8 v49 = *v58;
  *unint64_t v58 = v57;
LABEL_64:
  uint64_t v56 = sub_100004820(v49);
  sub_100005C50(v56);
  sub_1000101F8(0, 1, 0, 0);
  return swift_bridgeObjectRelease();
}

void sub_10000B3D8()
{
  uint64_t v1 = sub_100029810();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v94 = (char *)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_100006AE8(18) & 1) == 0) {
    return;
  }
  memset(v97, 0, 64);
  sub_100008720(13, v97);
  if (*(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags))
  {
    sub_10000D254();
    return;
  }
  uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext);
  unint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_stepContext + 56);
  if (!v5)
  {
    uint64_t v17 = 0xD000000000000023;
    unint64_t v18 = 0x800000010002BDF0;
    uint64_t v19 = 2;
LABEL_42:
    sub_100008CD4(v19, v17, v18, 1);
    return;
  }
  uint64_t v7 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v8 = v4[2];
  unint64_t v9 = (void *)v4[3];
  uint64_t v10 = v4[4];
  uint64_t v11 = v4[5];
  uint64_t v12 = v4[6];
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v89 = v0;
  uint64_t v92 = v1;
  uint64_t v93 = v2;
  unint64_t v91 = v6;
  uint64_t v90 = v8;
  v88 = v9;
  uint64_t v87 = v10;
  uint64_t v86 = v11;
  if (v5 >> 62)
  {
    uint64_t v14 = v12;
    sub_1000100D8(v7, v6, v8, v9, v10, v11, v12, v5);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100029D00();
    if (!v13) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v14 = v12;
    sub_1000100D8(v7, v6, v8, v9, v10, v11, v12, v5);
    swift_bridgeObjectRetain();
    if (!v13) {
      goto LABEL_26;
    }
  }
  if (v13 < 1)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t v16 = sub_100029C70();
      if (*(unsigned char *)(v16 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) == 1
        && (*(unsigned char *)(v16 + 17) & 1) == 0
        && (*(unsigned __int8 *)(v16 + 16) | 2) == 2)
      {
        sub_100029CA0();
        sub_100029CD0();
        sub_100029CE0();
        sub_100029CB0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v5 + 32);
    uint64_t v21 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup;
    do
    {
      uint64_t v22 = *v20;
      if (*(unsigned char *)(*v20 + v21) == 1 && (*(unsigned char *)(v22 + 17) & 1) == 0 && (*(unsigned __int8 *)(v22 + 16) | 2) == 2)
      {
        swift_retain();
        sub_100029CA0();
        sub_100029CD0();
        sub_100029CE0();
        sub_100029CB0();
        uint64_t v21 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup;
      }
      ++v20;
      --v13;
    }
    while (v13);
  }
LABEL_26:
  swift_bridgeObjectRelease();
  uint64_t v13 = aBlock[0];
  sub_1000101B8(v7, v91, v90, v88, v87, (uint64_t)v86, v14, v5);
  uint64_t v23 = v89;
  id v24 = sub_100004FAC();
  if (!v24)
  {
    swift_release();
    unint64_t v18 = 0x800000010002BD90;
    uint64_t v19 = 3;
    uint64_t v17 = 0xD000000000000010;
    goto LABEL_42;
  }
  v88 = v24;
  uint64_t v25 = v23 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_log;
  swift_retain_n();
  uint64_t v87 = v25;
  uint64_t v26 = sub_100029850();
  int v27 = sub_100029A90();
  if (!os_log_type_enabled(v26, (os_log_type_t)v27))
  {
    swift_release_n();

    uint64_t v29 = v13 & 0x4000000000000000;
LABEL_47:
    if ((v13 & 0x8000000000000000) == 0 && !v29)
    {
      uint64_t v30 = *(void *)(v13 + 16);
      swift_retain();
      if (v30) {
        goto LABEL_50;
      }
      goto LABEL_58;
    }
LABEL_92:
    swift_retain();
    uint64_t v30 = sub_100029D00();
    if (v30)
    {
LABEL_50:
      unint64_t v42 = v13 & 0xC000000000000001;
      uint64_t v43 = 4;
      while (1)
      {
        uint64_t v44 = v43 - 4;
        if (v42)
        {
          uint64_t v45 = sub_100029C70();
          uint64_t v46 = v43 - 3;
          if (__OFADD__(v44, 1)) {
            goto LABEL_90;
          }
        }
        else
        {
          uint64_t v45 = swift_retain();
          uint64_t v46 = v43 - 3;
          if (__OFADD__(v44, 1))
          {
LABEL_90:
            __break(1u);
            goto LABEL_91;
          }
        }
        uint64_t v47 = *(void *)(v45 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service);
        swift_release();
        if (!v47) {
          break;
        }
        ++v43;
        if (v46 == v30) {
          goto LABEL_58;
        }
      }
      swift_release();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      if (v30 < 1) {
        goto LABEL_96;
      }
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (v42)
        {
          uint64_t v52 = sub_100029C70();
        }
        else
        {
          uint64_t v52 = *(void *)(v13 + 8 * j + 32);
          swift_retain();
        }
        if (*(void *)(v52 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service))
        {
          swift_release();
        }
        else
        {
          sub_100029CA0();
          sub_100029CD0();
          sub_100029CE0();
          sub_100029CB0();
        }
      }
      swift_release();
      uint64_t v30 = aBlock[0];
      if ((aBlock[0] & 0x8000000000000000) == 0 && (aBlock[0] & 0x4000000000000000) == 0)
      {
        uint64_t v53 = *(void *)(aBlock[0] + 16);
        goto LABEL_71;
      }
      goto LABEL_97;
    }
LABEL_58:
    swift_release_n();
    id v48 = (unsigned __int8 *)(v89 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
    swift_beginAccess();
    unsigned __int8 v49 = *v48;
    *id v48 = 1;
    uint64_t v50 = sub_100004820(v49);
    sub_100005C50(v50);

    return;
  }
  uint64_t v28 = (uint8_t *)swift_slowAlloc();
  uint64_t v90 = swift_slowAlloc();
  aBlock[0] = v90;
  *(_DWORD *)uint64_t v28 = 136380675;
  uint64_t v29 = v13 & 0x4000000000000000;
  LODWORD(v91) = v27;
  if (v13 < 0 || v29)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_100029D00();
    swift_release();
  }
  else
  {
    uint64_t v30 = *(void *)(v13 + 16);
  }
  if (!v30)
  {
LABEL_46:
    uint64_t v39 = sub_100029A20();
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    v96 = (void *)sub_100021F44(v39, v41, aBlock);
    sub_100029B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v26, (os_log_type_t)v91, "Setup with %{private}s", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_47;
  }
  v84 = v28;
  uint64_t v85 = v13 & 0x4000000000000000;
  uint64_t v86 = v26;
  v96 = &_swiftEmptyArrayStorage;
  sub_100022794(0, v30 & ~(v30 >> 63), 0);
  if ((v30 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = 0;
    int v32 = v96;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        uint64_t v33 = sub_100029C70();
      }
      else
      {
        uint64_t v33 = *(void *)(v13 + 8 * v31 + 32);
        swift_retain();
      }
      uint64_t v34 = *(void *)(v33 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
      uint64_t v35 = *(void *)(v33 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name + 8);
      swift_bridgeObjectRetain();
      swift_release();
      v96 = v32;
      unint64_t v37 = v32[2];
      unint64_t v36 = v32[3];
      if (v37 >= v36 >> 1)
      {
        sub_100022794(v36 > 1, v37 + 1, 1);
        int v32 = v96;
      }
      ++v31;
      void v32[2] = v37 + 1;
      uint64_t v38 = &v32[2 * v37];
      v38[4] = v34;
      v38[5] = v35;
    }
    while (v30 != v31);
    uint64_t v26 = v86;
    uint64_t v29 = v85;
    uint64_t v28 = v84;
    goto LABEL_46;
  }
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_100029D00();
  swift_release();
LABEL_71:
  uint64_t v54 = v89;
  if (v53)
  {
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_100022754(0, v53 & ~(v53 >> 63), 0);
    if (v53 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v55 = 0;
    unint64_t v91 = v30 & 0xC000000000000001;
    uint64_t v56 = (void (**)(char *, uint64_t, uint64_t))(v93 + 16);
    uint64_t v90 = v93 + 32;
    char v57 = v94;
    unint64_t v58 = (void *)aBlock[0];
    uint64_t v59 = v30;
    do
    {
      if (v91)
      {
        uint64_t v60 = sub_100029C70();
      }
      else
      {
        uint64_t v60 = *(void *)(v30 + 8 * v55 + 32);
        swift_retain();
      }
      uint64_t v61 = v92;
      (*v56)(v57, v60 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v92);
      swift_release();
      aBlock[0] = (uint64_t)v58;
      id v62 = v57;
      unint64_t v64 = v58[2];
      unint64_t v63 = v58[3];
      if (v64 >= v63 >> 1)
      {
        sub_100022754(v63 > 1, v64 + 1, 1);
        unint64_t v58 = (void *)aBlock[0];
      }
      ++v55;
      v58[2] = v64 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v93 + 32))((unint64_t)v58+ ((*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80))+ *(void *)(v93 + 72) * v64, v62, v61);
      char v57 = v62;
      uint64_t v30 = v59;
    }
    while (v53 != v55);
    swift_release();
    uint64_t v54 = v89;
  }
  else
  {
    swift_release();
    unint64_t v58 = &_swiftEmptyArrayStorage;
  }
  uint64_t v65 = *(void **)(v54 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager);
  if (v65)
  {
    id v66 = [v65 homes];
    sub_1000102BC(0, &qword_10003BBD8);
    v67 = (void *)sub_100029A10();
  }
  else
  {
    v67 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  v68 = sub_10000F618((unint64_t)v67, (uint64_t)v58);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v69 = (void *)(v54 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homesToSetup);
  swift_beginAccess();
  *os_log_type_t v69 = v68;
  swift_bridgeObjectRelease();
  v70 = v88;
  v71 = v88;
  unsigned __int8 v72 = sub_100029850();
  os_log_type_t v73 = sub_100029A90();
  if (os_log_type_enabled(v72, v73))
  {
    v74 = (uint8_t *)swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    *(_DWORD *)v74 = 138477827;
    aBlock[0] = (uint64_t)v71;
    os_log_type_t v75 = v71;
    v94 = v71;
    v76 = v75;
    sub_100029B90();
    *(void *)uint64_t v93 = v70;

    v71 = v94;
    _os_log_impl((void *)&_mh_execute_header, v72, v73, "Setting up %{private}@", v74, 0xCu);
    sub_100002798(&qword_10003BD70);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v77 = sub_100004F0C();
  unint64_t v78 = swift_bridgeObjectRetain();
  sub_10000D6D8(v78);
  swift_bridgeObjectRelease();
  Class isa = sub_100029A00().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v80 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v81 = swift_allocObject();
  *(void *)(v81 + 16) = v80;
  *(void *)(v81 + 24) = v58;
  aBlock[4] = (uint64_t)sub_1000106E8;
  aBlock[5] = v81;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000C6F4;
  aBlock[3] = (uint64_t)&unk_100035380;
  v82 = _Block_copy(aBlock);
  swift_release();
  [v77 addMediaService:v71 toHomes:isa completion:v82];
  _Block_release(v82);
}

void sub_10000C08C(char a1)
{
  if (sub_100006AE8(a1 & 1))
  {
    if (a1)
    {
      uint64_t v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
      swift_beginAccess();
      unsigned __int8 v4 = *v3;
      unsigned __int8 *v3 = 28;
      uint64_t v5 = sub_100004820(v4);
      sub_100005C50(v5);
      return;
    }
    uint64_t v6 = &v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homesToSetup];
    swift_beginAccess();
    uint64_t v7 = *(void *)v6;
    if (*(void *)v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100029D00();
      if (v8) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_6:
        if (v8 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v9 = 0;
        unint64_t v19 = v7 & 0xC000000000000001;
        uint64_t v10 = v7;
        do
        {
          if (v19) {
            id v11 = (id)sub_100029C70();
          }
          else {
            id v11 = *(id *)(v7 + 8 * v9 + 32);
          }
          uint64_t v12 = v11;
          ++v9;
          id v13 = sub_100004F0C();
          id v14 = sub_100004FAC();
          uint64_t v15 = swift_allocObject();
          *(void *)(v15 + 16) = v1;
          *(void *)(v15 + 24) = v12;
          aBlock[4] = sub_10001078C;
          aBlock[5] = v15;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_10000C6F4;
          aBlock[3] = &unk_100035420;
          uint64_t v16 = _Block_copy(aBlock);
          id v17 = v12;
          unint64_t v18 = v1;
          swift_release();
          [v13 removeServiceFromHome:v14 fromHome:v17 completion:v16];
          _Block_release(v16);

          uint64_t v7 = v10;
        }
        while (v8 != v9);
      }
    }
    swift_bridgeObjectRelease();
    sub_100008CD4(3, 0xD00000000000001FLL, 0x800000010002BE40, 1);
  }
}

void sub_10000C2F0(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_100029810();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a4;
  swift_errorRetain();
  id v12 = v11;
  swift_errorRetain();
  id v13 = sub_100029850();
  int v14 = sub_100029AC0();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    uint64_t v30 = v13;
    int v32 = v14;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v15 = 136381443;
    uint64_t v16 = v8;
    id v17 = [v12 name];
    uint64_t v18 = sub_100029960();
    HIDWORD(v29) = a1;
    unint64_t v20 = v19;

    uint64_t v33 = sub_100021F44(v18, v20, &v34);
    sub_100029B90();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2081;
    id v21 = [v12 uniqueIdentifier];
    sub_1000297E0();

    sub_100010660((unint64_t *)&qword_10003BD50, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v22 = sub_100029D70();
    unint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v7);
    uint64_t v33 = sub_100021F44(v22, v24, &v34);
    sub_100029B90();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 1024;
    LODWORD(v33) = BYTE4(v29) & 1;
    sub_100029B90();
    *(_WORD *)(v15 + 28) = 2080;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v25 = sub_100029DB0();
      unint64_t v27 = v26;
    }
    else
    {
      unint64_t v27 = 0xE300000000000000;
      uint64_t v25 = 7104878;
    }
    uint64_t v28 = v30;
    uint64_t v33 = sub_100021F44(v25, v27, &v34);
    sub_100029B90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v32, "Setup reverted for %{private}s (%{private}s success=%{BOOL}d, error=%s", (uint8_t *)v15, 0x26u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_10000C6F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_10000C76C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000C7B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029810();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount);
  if (v6)
  {
    id v7 = v6;
    sub_100029800();
    Class isa = sub_1000297D0().super.isa;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [v7 setServiceID:isa];

    uint64_t v9 = sub_100029850();
    os_log_type_t v10 = sub_100029A90();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Running preflight for testing", v11, 2u);
      swift_slowDealloc();
    }

    id v12 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags);
    id v13 = v7;
    sub_10001CFF4(v12, v13);
    int v14 = (void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel);
    uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel);
    uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8);
    *int v14 = v17;
    v14[1] = v18;
    v14[2] = v19;
    sub_1000102F8(v15, v16);
    unint64_t v20 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
    swift_beginAccess();
    unsigned __int8 v21 = *v20;
    *unint64_t v20 = 6;
    uint64_t v22 = sub_100004820(v21);
    sub_100005C50(v22);
  }
}

void sub_10000C9B8()
{
  if (*(void *)&v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID + 8])
  {
    swift_bridgeObjectRetain();
    id v1 = sub_100004F0C();
    NSString v2 = sub_100029950();
    swift_bridgeObjectRelease();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v0;
    v6[4] = sub_10001033C;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10000E678;
    v6[3] = &unk_100035268;
    uint64_t v4 = _Block_copy(v6);
    uint64_t v5 = v0;
    swift_release();
    [v1 getPublicInfoForBundleID:v2 completion:v4];
    _Block_release(v4);
  }
  else
  {
    sub_100008CD4(2, 0xD000000000000011, 0x800000010002BCE0, 1);
  }
  v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist + 7] = 1;
}

void sub_10000CB1C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = (unsigned __int8 *)&v2[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
  swift_beginAccess();
  if ((_s21MediaSetupViewService0B5StateO2eeoiySbAC_ACtFZ_0(*v6, 5u) & 1) == 0)
  {
    id v7 = v2;
    uint64_t v8 = sub_100029850();
    os_log_type_t v9 = sub_100029AB0();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v10 = 136315138;
      unint64_t v11 = SetupState.description.getter(*v6);
      sub_100021F44(v11, v12, &v54);
      sub_100029B90();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "### Received service configuration info while in state %s?", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
  if (!a2)
  {
LABEL_13:
    if (!a1)
    {
      uint64_t v21 = 0xD000000000000021;
      unint64_t v22 = 0x800000010002BC70;
      uint64_t v23 = 0;
LABEL_28:
      sub_100008CD4(v23, v21, v22, 1);
      return;
    }
    goto LABEL_22;
  }
  id v13 = (void *)sub_100029720();
  id v14 = [v13 domain];
  uint64_t v15 = sub_100029960();
  uint64_t v17 = v16;

  if (v15 == sub_100029960() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v20 = sub_100029D80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {

      goto LABEL_13;
    }
  }
  id v24 = v13;
  uint64_t v25 = sub_100029850();
  os_log_type_t v26 = sub_100029AB0();
  if (os_log_type_enabled(v25, v26))
  {
    log = v25;
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v27 = 138412290;
    uint64_t v54 = (uint64_t)v24;
    id v28 = v24;
    sub_100029B90();
    *uint64_t v52 = v24;

    uint64_t v25 = log;
    _os_log_impl((void *)&_mh_execute_header, log, v26, "### Configuration returned error: %@", v27, 0xCu);
    sub_100002798(&qword_10003BD70);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if ([v24 code] != (id)2 && objc_msgSend(v24, "code") != (id)1)
  {
    unsigned __int8 v49 = sub_100029850();
    os_log_type_t v50 = sub_100029AB0();
    if (os_log_type_enabled(v49, v50))
    {
      char v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Received configuration info response with unexpected failure", v51, 2u);
      swift_slowDealloc();
    }

    sub_100008CD4(0, 0xD00000000000001CLL, 0x800000010002BCC0, 1);
    return;
  }

LABEL_22:
  uint64_t v29 = *(void **)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount];
  if (!v29)
  {
    unint64_t v22 = 0x800000010002BCA0;
    uint64_t v23 = 2;
    uint64_t v21 = 0xD000000000000015;
    goto LABEL_28;
  }
  id v30 = v29;
  uint64_t v31 = sub_100029850();
  os_log_type_t v32 = sub_100029A90();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Received configuration info response", v33, 2u);
    swift_slowDealloc();
  }

  if (a1) {
    uint64_t v34 = a1;
  }
  else {
    uint64_t v34 = (void *)sub_10000DEE8((uint64_t)&_swiftEmptyArrayStorage);
  }
  uint64_t v35 = *(void **)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager];
  swift_bridgeObjectRetain();
  if (v35)
  {
    id v36 = [v35 homes];
    sub_1000102BC(0, &qword_10003BBD8);
    unint64_t v37 = (void *)sub_100029A10();
  }
  else
  {
    unint64_t v37 = &_swiftEmptyArrayStorage;
  }
  id v38 = v30;
  uint64_t v39 = sub_10001E4A4(v34, (unint64_t)v37, v38);
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v44 = (uint64_t *)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel];
  uint64_t v45 = *(void **)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel];
  uint64_t v46 = *(void *)&v3[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configModel + 8];
  *uint64_t v44 = v39;
  v44[1] = v41;
  v44[2] = v43;
  sub_1000102F8(v45, v46);
  unsigned __int8 v47 = *v6;
  *id v6 = 4;
  uint64_t v48 = sub_100004820(v47);
  sub_100005C50(v48);
}

uint64_t sub_10000D164(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100029810();
    sub_1000102BC(0, (unint64_t *)&unk_10003BD60);
    sub_100010660((unint64_t *)&qword_10003C000, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v4 = sub_100029910();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D254()
{
  uint64_t v28 = sub_1000298A0();
  uint64_t v31 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  unint64_t v27 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000298D0();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100029890();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1000298F0();
  uint64_t v25 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v25 - v14;
  if ((*(void *)((unsigned char *)v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags) & 0x80) != 0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 500;
  }
  id v26 = *(id *)((char *)v0 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_dispatchQueue);
  sub_1000298E0();
  *uint64_t v8 = v16;
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchTimeInterval.milliseconds(_:), v5);
  sub_100029900();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v0;
  aBlock[4] = sub_100010744;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C76C;
  aBlock[3] = &unk_1000353D0;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v0;
  sub_1000298C0();
  os_log_type_t v32 = &_swiftEmptyArrayStorage;
  sub_100010660((unint64_t *)&qword_10003BD90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100002798(&qword_10003BD98);
  sub_1000106F0((unint64_t *)&qword_10003BDA0, &qword_10003BD98);
  uint64_t v21 = v27;
  uint64_t v22 = v28;
  sub_100029BD0();
  uint64_t v23 = v26;
  sub_100029AE0();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v22);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v30);
  v17(v15, v25);
  return swift_release();
}

uint64_t sub_10000D6D8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100029D00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  id v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_100022774(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_100029C70();
        sub_1000102BC(0, &qword_10003BBD8);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100022774(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100022774(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_100010734(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_1000102BC(0, &qword_10003BBD8);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100022774(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_100022774(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_100010734(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_10000D93C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v45 = sub_100029810();
  uint64_t v7 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  id v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v11 = (char *)Strong;
    if (a2)
    {
      swift_errorRetain();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v12 = sub_100029850();
      os_log_type_t v13 = sub_100029AB0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        v47[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_getErrorValue();
        uint64_t v15 = sub_100029DB0();
        uint64_t v46 = sub_100021F44(v15, v16, v47);
        sub_100029B90();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to setup media service in requested homes: %s", v14, 0xCu);
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
    else
    {
      int64_t v17 = *(void *)(a4 + 16);
      uint64_t v18 = &_swiftEmptyArrayStorage;
      if (v17)
      {
        uint64_t v40 = (char *)Strong;
        int v41 = a1;
        v47[0] = (uint64_t)&_swiftEmptyArrayStorage;
        sub_100022794(0, v17, 0);
        id v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
        uint64_t v19 = v7 + 16;
        uint64_t v21 = a4 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
        uint64_t v42 = *(void *)(v19 + 56);
        uint64_t v43 = v20;
        uint64_t v44 = v19;
        uint64_t v22 = (void (**)(char *, uint64_t))(v19 - 8);
        do
        {
          uint64_t v23 = v45;
          v43(v9, v21, v45);
          uint64_t v24 = sub_1000297C0();
          uint64_t v26 = v25;
          (*v22)(v9, v23);
          uint64_t v18 = (void *)v47[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_100022794(0, v18[2] + 1, 1);
            uint64_t v18 = (void *)v47[0];
          }
          unint64_t v28 = v18[2];
          unint64_t v27 = v18[3];
          if (v28 >= v27 >> 1)
          {
            sub_100022794(v27 > 1, v28 + 1, 1);
            uint64_t v18 = (void *)v47[0];
          }
          v18[2] = v28 + 1;
          uint64_t v29 = (char *)&v18[2 * v28];
          *((void *)v29 + 4) = v24;
          *((void *)v29 + 5) = v26;
          v21 += v42;
          --v17;
        }
        while (v17);
        LOBYTE(a1) = v41;
        unint64_t v11 = v40;
      }
      v47[0] = (uint64_t)v18;
      sub_100002798(&qword_10003BDC0);
      sub_1000106F0(&qword_10003BDC8, &qword_10003BDC0);
      uint64_t v30 = sub_100029930();
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_100029850();
      os_log_type_t v34 = sub_100029A90();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        v47[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136380675;
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_100021F44(v30, v32, v47);
        sub_100029B90();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Successfully setup media service in homes: %{private}s", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    id v36 = (unsigned __int8 *)&v11[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
    swift_beginAccess();
    unsigned __int8 v37 = *v36;
    *id v36 = a1 & 1;
    uint64_t v38 = sub_100004820(v37);
    sub_100005C50(v38);
  }
}

unint64_t sub_10000DEE8(uint64_t a1)
{
  uint64_t v2 = sub_100002798(&qword_10003BD78);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002798(&qword_10003BD80);
  uint64_t v6 = sub_100029D30();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000105A0(v12, (uint64_t)v5, &qword_10003BD78);
    unint64_t result = sub_100015E94((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_100029810();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

uint64_t sub_10000E0DC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100029810();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v41 - v12;
  if (!a1)
  {
    uint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    sub_100029C50(34);
    swift_bridgeObjectRelease();
    uint64_t v44 = 0xD00000000000001FLL;
    unint64_t v45 = 0x800000010002BD20;
    uint64_t v20 = *(void *)(v2 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID + 8);
    uint64_t v46 = *(void *)(v2 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID);
    uint64_t v47 = v20;
    swift_bridgeObjectRetain();
    sub_100002798(&qword_10003BD88);
    v49._countAndFlagsBits = sub_100029980();
    sub_1000299C0(v49);
    swift_bridgeObjectRelease();
    v50._countAndFlagsBits = 63;
    v50._object = (void *)0xE100000000000000;
    sub_1000299C0(v50);
    sub_100008CD4(2, v44, v45, 1);
    return swift_bridgeObjectRelease();
  }
  uint64_t v43 = v2;
  id v14 = a1;
  id v15 = [v14 serviceID];
  sub_100029960();

  sub_1000297B0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100010604((uint64_t)v6, (uint64_t *)&unk_10003BD30);
    uint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    sub_100029C50(42);
    swift_bridgeObjectRelease();
    uint64_t v44 = 0xD000000000000028;
    unint64_t v45 = 0x800000010002BD40;
    id v16 = [v14 serviceID];
    uint64_t v17 = sub_100029960();
    uint64_t v19 = v18;

    v48._countAndFlagsBits = v17;
    v48._object = v19;
    sub_1000299C0(v48);
    swift_bridgeObjectRelease();
    sub_100008CD4(0, v44, v45, 1);

    return swift_bridgeObjectRelease();
  }
  id v42 = v14;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v22 = sub_100029850();
  os_log_type_t v23 = sub_100029A90();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136380675;
    int v41 = v24 + 4;
    sub_100010660((unint64_t *)&qword_10003BD50, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v25 = sub_100029D70();
    uint64_t v46 = sub_100021F44(v25, v26, &v44);
    sub_100029B90();
    swift_bridgeObjectRelease();
    unint64_t v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    v27(v11, v7);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Service ID = %{private}s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    unint64_t v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    v27(v11, v7);
  }
  unint64_t v28 = v42;
  uint64_t v29 = v43;
  uint64_t v30 = *(void **)(v43 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount);
  if (v30)
  {
    id v31 = v30;
    Class isa = sub_1000297D0().super.isa;
    [v31 setServiceID:isa];
  }
  id v33 = [v28 configurationPublicKey];
  uint64_t v34 = sub_100029960();
  uint64_t v36 = v35;

  unsigned __int8 v37 = (uint64_t *)(v29 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_configPublicKey);
  *unsigned __int8 v37 = v34;
  v37[1] = v36;
  swift_bridgeObjectRelease();
  uint64_t v38 = (unsigned __int8 *)(v29 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
  swift_beginAccess();
  unsigned __int8 v39 = *v38;
  *uint64_t v38 = 4;
  uint64_t v40 = sub_100004820(v39);
  sub_100005C50(v40);

  return ((uint64_t (*)(char *, uint64_t))v27)(v13, v7);
}

void sub_10000E678(uint64_t a1, void *a2)
{
}

void sub_10000E680(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000E6F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags);
  uint64_t v3 = sub_100029850();
  os_log_type_t v4 = sub_100029A90();
  BOOL v5 = os_log_type_enabled(v3, v4);
  if ((v2 & 0x20) != 0)
  {
    if (v5)
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Simulating error via test flag", v10, 2u);
      swift_slowDealloc();
    }

    sub_100008CD4(3, 0xD000000000000018, 0x800000010002BE20, 0);
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Skipping setup via test flags", v6, 2u);
      swift_slowDealloc();
    }

    uint64_t v7 = (unsigned __int8 *)(a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
    swift_beginAccess();
    unsigned __int8 v8 = *v7;
    *uint64_t v7 = 28;
    uint64_t v9 = sub_100004820(v8);
  }
  return sub_100005C50(v9);
}

uint64_t type metadata accessor for SetupSession()
{
  uint64_t result = qword_10003BCC0;
  if (!qword_10003BCC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *sub_10000E8AC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100002798(&qword_10003BD48);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000ED34(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E9A8(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100002798(&qword_10003BD58);
  uint64_t v10 = *(void *)(type metadata accessor for SetupEntitlement(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_100029CF0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for SetupEntitlement(0) - 8);
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
    sub_10000EE1C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_10000EC10(char *result, int64_t a2, char a3, char *a4)
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
      sub_100002798(&qword_10003C510);
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
    sub_10000FA48(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000ED20(uint64_t a1)
{
  return sub_10000E8AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_10000ED34(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_100029D40();
  __break(1u);
  return result;
}

uint64_t sub_10000EE1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for SetupEntitlement(0) - 8);
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
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

char *sub_10000EF74(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = a2;
  uint64_t v5 = sub_100029810();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v43 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100002798(&qword_10003BDB0);
  __chkstk_darwin(v53);
  uint64_t v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002798((uint64_t *)&unk_10003BD30);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v47 = (uint64_t)v41 - v15;
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)v41 - v16;
  if (a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v18)
  {
    uint64_t v54 = OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager;
    char v51 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    unint64_t v52 = a1 & 0xC000000000000001;
    unint64_t v58 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    uint64_t v19 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
    v41[1] = v3;
    id v42 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    unint64_t v45 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    uint64_t v46 = v13;
    uint64_t v20 = 4;
    uint64_t v6 = v47;
    uint64_t v48 = v18;
    unint64_t v49 = a1;
    Swift::String v50 = v19;
    while (1)
    {
      uint64_t v3 = v20 - 4;
      if (!v52) {
        break;
      }
      uint64_t v13 = (char *)sub_100029C70();
      uint64_t v21 = v20 - 3;
      if (__OFADD__(v3, 1)) {
        goto LABEL_34;
      }
LABEL_12:
      uint64_t v56 = v21;
      (*v51)(v17, (uint64_t)&v13[OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id], v5);
      uint64_t v22 = *v58;
      (*v58)((uint64_t)v17, 0, 1, v5);
      os_log_type_t v23 = *(void **)(v55 + v54);
      char v57 = v13;
      if (!v23) {
        goto LABEL_18;
      }
      id v24 = [v23 currentHome];
      if (!v24)
      {
        uint64_t v25 = *(void **)(v55 + v54);
        if (v25)
        {
          id v26 = [v25 homes];
          sub_1000102BC(0, &qword_10003BBD8);
          a1 = sub_100029A10();

          if (a1 >> 62)
          {
LABEL_16:
            swift_bridgeObjectRetain();
            uint64_t v3 = sub_100029D00();
            swift_bridgeObjectRelease();
            if (!v3) {
              goto LABEL_17;
            }
LABEL_20:
            if ((a1 & 0xC000000000000001) != 0)
            {
              id v28 = (id)sub_100029C70();
            }
            else
            {
              if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_35;
              }
              id v28 = *(id *)(a1 + 32);
            }
            id v24 = v28;
            swift_bridgeObjectRelease();
            goto LABEL_24;
          }
        }
        else
        {
LABEL_18:
          a1 = (unint64_t)&_swiftEmptyArrayStorage;
          if ((unint64_t)&_swiftEmptyArrayStorage >> 62) {
            goto LABEL_16;
          }
        }
        uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v3)
        {
LABEL_17:
          swift_bridgeObjectRelease();
          uint64_t v27 = 1;
          goto LABEL_25;
        }
        goto LABEL_20;
      }
LABEL_24:
      id v29 = [v24 uniqueIdentifier];

      sub_1000297E0();
      uint64_t v27 = 0;
LABEL_25:
      v22(v6, v27, 1, v5);
      uint64_t v30 = (uint64_t)&v9[*(int *)(v53 + 48)];
      sub_1000105A0((uint64_t)v17, (uint64_t)v9, (uint64_t *)&unk_10003BD30);
      sub_1000105A0(v6, v30, (uint64_t *)&unk_10003BD30);
      id v31 = *v50;
      if ((*v50)(v9, 1, v5) == 1)
      {
        sub_100010604(v6, (uint64_t *)&unk_10003BD30);
        sub_100010604((uint64_t)v17, (uint64_t *)&unk_10003BD30);
        if (v31((char *)v30, 1, v5) == 1)
        {
          sub_100010604((uint64_t)v9, (uint64_t *)&unk_10003BD30);
          unsigned __int8 v39 = v57;
LABEL_33:
          swift_bridgeObjectRelease();
          return v39;
        }
        goto LABEL_5;
      }
      uint64_t v32 = (uint64_t)v46;
      sub_1000105A0((uint64_t)v9, (uint64_t)v46, (uint64_t *)&unk_10003BD30);
      if (v31((char *)v30, 1, v5) == 1)
      {
        uint64_t v33 = v47;
        sub_100010604(v47, (uint64_t *)&unk_10003BD30);
        sub_100010604((uint64_t)v17, (uint64_t *)&unk_10003BD30);
        uint64_t v34 = v32;
        uint64_t v6 = v33;
        (*v45)(v34, v5);
LABEL_5:
        sub_100010604((uint64_t)v9, &qword_10003BDB0);
        a1 = v49;
        goto LABEL_6;
      }
      uint64_t v35 = v43;
      (*v42)(v43, v30, v5);
      sub_100010660(&qword_10003BDB8, (void (*)(uint64_t))&type metadata accessor for UUID);
      int v44 = sub_100029940();
      uint64_t v36 = *v45;
      (*v45)((uint64_t)v35, v5);
      uint64_t v37 = v47;
      sub_100010604(v47, (uint64_t *)&unk_10003BD30);
      sub_100010604((uint64_t)v17, (uint64_t *)&unk_10003BD30);
      uint64_t v38 = v32;
      uint64_t v6 = v37;
      v36(v38, v5);
      sub_100010604((uint64_t)v9, (uint64_t *)&unk_10003BD30);
      a1 = v49;
      unsigned __int8 v39 = v57;
      if (v44) {
        goto LABEL_33;
      }
LABEL_6:
      swift_release();
      ++v20;
      if (v56 == v48) {
        goto LABEL_37;
      }
    }
    uint64_t v13 = *(char **)(a1 + 8 * v20);
    swift_retain();
    uint64_t v21 = v20 - 3;
    if (!__OFADD__(v3, 1)) {
      goto LABEL_12;
    }
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100029D00();
  }
LABEL_37:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_10000F618(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100029810();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v36 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v42 = (char *)v25 - v10;
  uint64_t v43 = &_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_23:
    uint64_t v11 = sub_100029D00();
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11)
    {
LABEL_3:
      unint64_t v12 = 0;
      uint64_t v31 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v32 = a1 & 0xC000000000000001;
      unint64_t v27 = a1 + 32;
      uint64_t v28 = v11;
      uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
      uint64_t v38 = v26 + 16;
      uint64_t v35 = (void (**)(char *, char *, uint64_t))(v26 + 32);
      uint64_t v40 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
      int v41 = (void (**)(char *, uint64_t))(v26 + 8);
      v25[2] = (v26 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      unint64_t v29 = a1;
      uint64_t v30 = a2;
      uint64_t v13 = v36;
      while (1)
      {
        if (v32)
        {
          id v15 = (id)sub_100029C70();
          BOOL v16 = __OFADD__(v12, 1);
          unint64_t v17 = v12 + 1;
          if (v16)
          {
LABEL_20:
            __break(1u);
            return v43;
          }
        }
        else
        {
          if (v12 >= *(void *)(v31 + 16))
          {
            __break(1u);
            goto LABEL_23;
          }
          id v15 = *(id *)(v27 + 8 * v12);
          BOOL v16 = __OFADD__(v12, 1);
          unint64_t v17 = v12 + 1;
          if (v16) {
            goto LABEL_20;
          }
        }
        id v33 = v15;
        unint64_t v34 = v17;
        id v18 = [v15 uniqueIdentifier];
        sub_1000297E0();

        uint64_t v19 = *(void *)(a2 + 16);
        if (v19)
        {
          uint64_t v20 = a2 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
          uint64_t v39 = *(void *)(v26 + 72);
          uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
          swift_bridgeObjectRetain();
          while (1)
          {
            v21(v6, v20, v7);
            uint64_t v14 = *v40;
            (*v40)(v6, 0, 1, v7);
            if ((*v37)(v6, 1, v7) == 1) {
              break;
            }
            (*v35)(v13, v6, v7);
            sub_100010660(&qword_10003BDB8, (void (*)(uint64_t))&type metadata accessor for UUID);
            char v22 = sub_100029940();
            os_log_type_t v23 = *v41;
            (*v41)(v13, v7);
            if (v22)
            {
              a2 = v30;
              swift_bridgeObjectRelease();
              v23(v42, v7);
              sub_100029CA0();
              sub_100029CD0();
              sub_100029CE0();
              sub_100029CB0();
              goto LABEL_7;
            }
            v20 += v39;
            if (!--v19) {
              goto LABEL_5;
            }
          }
        }
        else
        {
          uint64_t v14 = *v40;
          swift_bridgeObjectRetain();
LABEL_5:
          v14(v6, 1, 1, v7);
        }
        a2 = v30;
        swift_bridgeObjectRelease();
        (*v41)(v42, v7);

LABEL_7:
        a1 = v29;
        unint64_t v12 = v34;
        if (v34 == v28) {
          return v43;
        }
      }
    }
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000FA48(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

void _s21MediaSetupViewService0B7SessionC25homeManagerDidUpdateHomesyySo06HMHomeG0CF_0()
{
  v0[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_checklist + 4] = 1;
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029850();
  os_log_type_t v3 = sub_100029A90();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315395;
    uint64_t v12 = sub_100021F44(0xD00000000000001DLL, 0x800000010002BE60, v13);
    sub_100029B90();
    *(_WORD *)(v4 + 12) = 2081;
    unint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homeKitManager];
    if (v5)
    {
      id v6 = objc_msgSend(v5, "homes", v12);
      sub_1000102BC(0, &qword_10003BBD8);
      sub_100029A10();
    }
    sub_1000102BC(0, &qword_10003BBD8);
    uint64_t v7 = sub_100029A20();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_100021F44(v7, v9, v13);
    sub_100029B90();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s %{private}s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v10 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state];
  swift_beginAccess();
  unsigned __int8 v11 = *v10;
  *uint64_t v10 = 4;
  sub_100004820(v11);
  sub_100005C50();
}

uint64_t sub_10000FDC0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  os_log_type_t v3 = (void *)(*a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_homesToSetup);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000FE1C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  os_log_type_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_10000FE70(unsigned __int8 *a1, void *a2)
{
  unsigned __int8 v2 = *a1;
  os_log_type_t v3 = (unsigned __int8 *)(*a2 + OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_state);
  swift_beginAccess();
  unsigned __int8 v4 = *v3;
  unsigned __int8 *v3 = v2;
  return sub_100004820(v4);
}

uint64_t sub_10000FED0()
{
  return type metadata accessor for SetupSession();
}

uint64_t sub_10000FED8()
{
  uint64_t result = sub_100029870();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Checklist(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Checklist(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[8]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Checklist(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Checklist()
{
  return &type metadata for Checklist;
}

uint64_t sub_1000100D8(uint64_t result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    sub_100010118(result, a2, a3, a4);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_100010118(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v5 = a4;
  }
}

void *sub_100010174(void *a1, void (*a2)(void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1000101B8(uint64_t result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    sub_1000101F8(result, a2, a3, a4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000101F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100010248()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100010280(void *a1, uint64_t a2)
{
}

uint64_t sub_1000102A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000102B4()
{
  return swift_release();
}

uint64_t sub_1000102BC(uint64_t a1, unint64_t *a2)
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

void sub_1000102F8(void *a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001033C(void *a1)
{
  return sub_10000E0DC(a1);
}

uint64_t sub_100010360(uint64_t a1)
{
  return sub_100005C50(a1);
}

uint64_t sub_100010384(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_1000103CC(void *result, uint64_t a2)
{
  if (a2)
  {
    id v2 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001040C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002798(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100010470(uint64_t a1)
{
  return a1;
}

id *sub_10001049C(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_1000104C8(uint64_t a1)
{
  return a1;
}

id *sub_1000104F4(id *a1)
{
  return a1;
}

uint64_t sub_100010520()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010558()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100010598(uint64_t a1)
{
  sub_10000917C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000105A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002798(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100010604(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002798(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010660(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000106A8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000106E8(int a1, uint64_t a2)
{
  sub_10000D93C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1000106F0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100010384(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_100010734(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100010744()
{
  return sub_10000E6F0(*(void *)(v0 + 16));
}

uint64_t sub_10001074C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001078C(int a1, uint64_t a2)
{
  sub_10000C2F0(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_100010794()
{
  swift_release();
  if (*(void *)(v0 + 96))
  {
    if (*(void *)(v0 + 48) != 1)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_100010800()
{
  return (*(uint64_t (**)(void, uint64_t))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), v0 + 40);
}

uint64_t sub_100010834(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100010844(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100010854(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_10001088C(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_10001089C(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

id sub_1000108F0(void *a1, uint64_t a2)
{
  uint64_t v31 = *(void **)(a2 + 48);
  id v4 = [v31 serviceName];
  uint64_t v5 = sub_100029960();
  uint64_t v7 = v6;

  long long v32 = *(_OWORD *)a2;
  long long v33 = *(_OWORD *)(a2 + 16);
  long long v34 = *(_OWORD *)(a2 + 32);
  unint64_t v8 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  unint64_t v9 = (objc_class *)[v8 mainBundle];
  v29._countAndFlagsBits = 0xE000000000000000;
  v37._object = (void *)0x800000010002BEC0;
  v37._countAndFlagsBits = 0xD00000000000001DLL;
  v38.value._countAndFlagsBits = 0;
  v38.value._object = 0;
  v10.super.Class isa = v9;
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_100029710(v37, v38, v10, v39, v29);

  sub_100002798((uint64_t *)&unk_10003BB40);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10002A710;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = sub_100004708();
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v7;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100023218(0, v5, v7, v32, *((uint64_t *)&v32 + 1));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v30 = a1;
  id v12 = sub_100018518(v30);
  swift_bridgeObjectRetain();
  id v13 = v12;
  sub_100023218(38, v34, *((uint64_t *)&v34 + 1), 0, 0);
  swift_bridgeObjectRelease();
  id v14 = sub_100027260(0);
  swift_bridgeObjectRelease();
  [v14 addTarget:v13 action:"selectSwitchAccounts" forControlEvents:64];
  id v15 = [v13 buttonTray];
  [v15 addButton:v14];

  sub_100010E18((uint64_t)&v33 + 8, (uint64_t)v35);
  sub_100010E18((uint64_t)v35, (uint64_t)&v36);
  if (v36)
  {
    id v16 = [v36 accountName];
    uint64_t v17 = sub_100029960();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  sub_100023218(34, v17, v19, 0, 0);
  swift_bridgeObjectRelease();
  id v20 = sub_100027260(1);
  swift_bridgeObjectRelease();
  [v20 addTarget:v13 action:"selectKeepUsing" forControlEvents:64];
  id v21 = [v13 buttonTray];
  [v21 addButton:v20];

  uint64_t v22 = *(void *)(a2 + 56);
  uint64_t v23 = *(void *)(a2 + 64);
  id v24 = objc_allocWithZone((Class)type metadata accessor for MainContentView());
  swift_bridgeObjectRetain_n();
  id v25 = v31;
  id v26 = sub_10002790C(0, v22, v23, v25);
  id v27 = [v13 contentView];

  [v27 addSubview:v26];
  sub_1000234D8();
  sub_100010E80(a2);

  swift_bridgeObjectRelease();
  return v13;
}

void sub_100010D10(char *a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void **)(*(void *)&a1[OBJC_IVAR____TtC21MediaSetupViewService23SetupBaseViewController_mainController]
                + OBJC_IVAR___MediaSetupNavigationController_setupSession);
  if (v3)
  {
    memset(v7, 0, sizeof(v7));
    uint64_t v5 = a1;
    id v6 = v3;
    sub_10000617C(a3, v7);
  }
}

id sub_100010DC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountMismatchViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountMismatchViewController()
{
  return self;
}

uint64_t sub_100010E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002798(&qword_10003BDA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010E80(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 48);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100010EE0(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v3 = (unsigned __int8 *)(a2 + 32);
    while (1)
    {
      int v5 = *v3++;
      char v4 = v5;
      switch(v5)
      {
        case 2:
          if (a1 != 2) {
            goto LABEL_4;
          }
          return 1;
        case 3:
          if (a1 == 3) {
            return 1;
          }
          goto LABEL_4;
        case 4:
          if (a1 == 4) {
            return 1;
          }
          goto LABEL_4;
        case 5:
          if (a1 == 5) {
            return 1;
          }
          goto LABEL_4;
        case 6:
          if (a1 == 6) {
            return 1;
          }
          goto LABEL_4;
        case 7:
          if (a1 == 7) {
            return 1;
          }
          goto LABEL_4;
        case 8:
          if (a1 == 8) {
            return 1;
          }
          goto LABEL_4;
        case 9:
          if (a1 == 9) {
            return 1;
          }
          goto LABEL_4;
        case 10:
          if (a1 == 10) {
            return 1;
          }
          goto LABEL_4;
        case 11:
          if (a1 == 11) {
            return 1;
          }
          goto LABEL_4;
        case 12:
          if (a1 == 12) {
            return 1;
          }
          goto LABEL_4;
        case 13:
          if (a1 == 13) {
            return 1;
          }
          goto LABEL_4;
        case 14:
          if (a1 == 14) {
            return 1;
          }
          goto LABEL_4;
        case 15:
          if (a1 == 15) {
            return 1;
          }
          goto LABEL_4;
        case 16:
          if (a1 == 16) {
            return 1;
          }
          goto LABEL_4;
        case 17:
          if (a1 == 17) {
            return 1;
          }
          goto LABEL_4;
        case 18:
          if (a1 == 18) {
            return 1;
          }
          goto LABEL_4;
        case 19:
          if (a1 == 19) {
            return 1;
          }
          goto LABEL_4;
        case 20:
          if (a1 == 20) {
            return 1;
          }
          goto LABEL_4;
        case 21:
          if (a1 == 21) {
            return 1;
          }
          goto LABEL_4;
        case 22:
          if (a1 == 22) {
            return 1;
          }
          goto LABEL_4;
        case 23:
          if (a1 == 23) {
            return 1;
          }
          goto LABEL_4;
        case 24:
          if (a1 == 24) {
            return 1;
          }
          goto LABEL_4;
        case 25:
          if (a1 == 25) {
            return 1;
          }
          goto LABEL_4;
        case 26:
          if (a1 == 26) {
            return 1;
          }
          goto LABEL_4;
        case 27:
          if (a1 == 27) {
            return 1;
          }
          goto LABEL_4;
        case 28:
          if (a1 == 28) {
            return 1;
          }
          goto LABEL_4;
        case 29:
          if (a1 != 29) {
            goto LABEL_4;
          }
          return 1;
        default:
          if a1 - 2 >= 0x1C && ((a1 ^ ((v4 & 1) == 0))) {
            return 1;
          }
LABEL_4:
          if (!--v2) {
            return 0;
          }
          break;
      }
    }
  }
  return 0;
}

uint64_t sub_100011114(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_100029D80();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  unint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_100029D80() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000111DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_100029D00())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)sub_100029C70();
LABEL_5:
      id v6 = v5;
      sub_1000102BC(0, &qword_10003BFD8);
      char v7 = sub_100029B20();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_100029B20();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      sub_100029C70();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_100029B20();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_100011364()
{
  id v1 = v0;
  uint64_t v2 = sub_100029850();
  os_log_type_t v3 = sub_100029A90();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v4 = 67109120;
    sub_100029B90();

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Update, waiting=%{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }
  else
  {
  }
  if (*((unsigned char *)v1 + OBJC_IVAR___MediaSetupNavigationController_waiting) == 1)
  {
    [v1 setModalInPresentation:1];
    id v5 = objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    id v6 = [v1 topViewController];
    if (v6)
    {
      char v7 = v6;
      id v8 = [v6 navigationItem];

      sub_100002798(&qword_10003BFB0);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_10002AB70;
      *(void *)(v9 + 32) = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v5];
      sub_100029A30();
      sub_1000102BC(0, (unint64_t *)&unk_10003BFB8);
      Class isa = sub_100029A00().super.isa;
      swift_bridgeObjectRelease();
      [v8 setRightBarButtonItems:isa animated:1];
    }
    [v5 startAnimating];
  }
  else
  {
    [v1 setModalInPresentation:0];
    id v11 = [v1 topViewController];
    if (!v11) {
      return;
    }
    unint64_t v12 = v11;
    id v5 = [v11 navigationItem];

    [v5 setRightBarButtonItems:0 animated:1];
  }
}

void sub_1000116E0(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 inputItems];
  uint64_t v4 = sub_100029A10();

  if (!*(void *)(v4 + 16))
  {
    long long v48 = 0u;
    long long v49 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_100017C48(v4 + 32, (uint64_t)&v48);
  swift_bridgeObjectRelease();
  if (!*((void *)&v49 + 1))
  {
LABEL_9:
    unint64_t v12 = (id *)&v48;
LABEL_10:
    sub_100010604((uint64_t)v12, &qword_10003BF78);
    return;
  }
  sub_1000102BC(0, &qword_10003BF88);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  id v5 = v50[0];
  id v6 = [v50[0] userInfo];
  if (!v6)
  {
    id v16 = sub_100029850();
    os_log_type_t v17 = sub_100029AB0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "No info to extract?", v18, 2u);
      swift_slowDealloc();
    }

    goto LABEL_40;
  }
  char v7 = v6;
  uint64_t v8 = sub_100029910();

  uint64_t v43 = sub_100029960();
  unint64_t v46 = v9;
  sub_100029C10();
  if (*(void *)(v8 + 16) && (unint64_t v10 = sub_100015F2C((uint64_t)&v48), (v11 & 1) != 0))
  {
    sub_100017C48(*(void *)(v8 + 56) + 32 * v10, (uint64_t)v50);
  }
  else
  {
    *(_OWORD *)Swift::String v50 = 0u;
    long long v51 = 0u;
  }
  sub_100017CA4((uint64_t)&v48);
  if (*((void *)&v51 + 1))
  {
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRetain_n();
      id v13 = sub_100029850();
      os_log_type_t v14 = sub_100029A90();
      if (os_log_type_enabled(v13, v14))
      {
        id v15 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v48 = swift_slowAlloc();
        *(_DWORD *)id v15 = 136315138;
        swift_bridgeObjectRetain();
        v50[0] = (id)sub_100021F44(v43, v46, (uint64_t *)&v48);
        sub_100029B90();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "HostBundleID: %s", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v19 = (uint64_t *)(v2 + OBJC_IVAR___MediaSetupNavigationController_hostBundleID);
      *uint64_t v19 = v43;
      v19[1] = v46;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_100010604((uint64_t)v50, &qword_10003BF78);
  }
  uint64_t v44 = sub_100029960();
  unint64_t v47 = v20;
  sub_100029C10();
  if (*(void *)(v8 + 16) && (unint64_t v21 = sub_100015F2C((uint64_t)&v48), (v22 & 1) != 0))
  {
    sub_100017C48(*(void *)(v8 + 56) + 32 * v21, (uint64_t)v50);
  }
  else
  {
    *(_OWORD *)Swift::String v50 = 0u;
    long long v51 = 0u;
  }
  sub_100017CA4((uint64_t)&v48);
  if (!*((void *)&v51 + 1))
  {
    uint64_t v23 = v50;
LABEL_31:
    sub_100010604((uint64_t)v23, &qword_10003BF78);
    goto LABEL_32;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_32;
  }
  sub_1000102BC(0, &qword_10003BFA0);
  sub_100029AD0();
  if (!*((void *)&v49 + 1))
  {
    sub_100017CF8(v44, v47);
    uint64_t v23 = (id *)&v48;
    goto LABEL_31;
  }
  sub_1000102BC(0, &qword_10003BFA8);
  if (swift_dynamicCast())
  {
    id v33 = v50[0];
    long long v34 = sub_100029850();
    os_log_type_t v35 = sub_100029A90();
    if (os_log_type_enabled(v34, v35))
    {
      loga = v34;
      os_log_type_t type = v35;
      id v36 = (uint8_t *)swift_slowAlloc();
      Swift::String v39 = (void *)swift_slowAlloc();
      *(_DWORD *)id v36 = 138477827;
      *(void *)&long long v48 = v33;
      id v37 = v33;
      sub_100029B90();
      *Swift::String v39 = v33;

      long long v34 = loga;
      _os_log_impl((void *)&_mh_execute_header, loga, type, "serviceAccount: %{private}@", v36, 0xCu);
      sub_100002798(&qword_10003BD70);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    Swift::String_optional v38 = *(void **)(v2 + OBJC_IVAR___MediaSetupNavigationController_serviceAccount);
    *(void *)(v2 + OBJC_IVAR___MediaSetupNavigationController_serviceAccount) = v33;
  }
  sub_100017CF8(v44, v47);
LABEL_32:
  unint64_t v45 = (void *)sub_100029960();
  sub_100029C10();
  if (*(void *)(v8 + 16) && (unint64_t v24 = sub_100015F2C((uint64_t)&v48), (v25 & 1) != 0))
  {
    sub_100017C48(*(void *)(v8 + 56) + 32 * v24, (uint64_t)v50);
  }
  else
  {
    *(_OWORD *)Swift::String v50 = 0u;
    long long v51 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100017CA4((uint64_t)&v48);
  if (!*((void *)&v51 + 1))
  {

    unint64_t v12 = v50;
    goto LABEL_10;
  }
  sub_1000102BC(0, (unint64_t *)&unk_10003BF90);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_40:

    return;
  }
  id v26 = v45;
  id v27 = sub_100029850();
  os_log_type_t v28 = sub_100029AA0();
  if (os_log_type_enabled(v27, v28))
  {
    Swift::String v29 = (uint8_t *)swift_slowAlloc();
    os_log_t log = (os_log_t)swift_slowAlloc();
    *(_DWORD *)Swift::String v29 = 138412290;
    *(void *)&long long v48 = v26;
    id v30 = v26;
    sub_100029B90();
    log->Class isa = (Class)v26;

    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Test flags: %@", v29, 0xCu);
    sub_100002798(&qword_10003BD70);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v31 = [v26 unsignedLongLongValue];

  uint64_t v32 = v2 + OBJC_IVAR___MediaSetupNavigationController_testFlags;
  *(void *)uint64_t v32 = v31;
  *(unsigned char *)(v32 + 8) = 0;
}

void sub_100011F54()
{
  uint64_t v0 = sub_100029850();
  os_log_type_t v1 = sub_100029A90();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_100021F44(0xD000000000000023, 0x800000010002C0C0, &v3);
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000120A0();
}

void sub_1000120A0()
{
  uint64_t v1 = OBJC_IVAR___MediaSetupNavigationController_setupSession;
  if (!*(void *)&v0[OBJC_IVAR___MediaSetupNavigationController_setupSession])
  {
    uint64_t v2 = v0;
    uint64_t v3 = sub_100029850();
    os_log_type_t v4 = sub_100029A90();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting setup session", v5, 2u);
      swift_slowDealloc();
    }

    id v6 = (char *)[objc_allocWithZone((Class)type metadata accessor for SetupSession()) init];
    char v7 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_serviceAccount];
    uint64_t v8 = *(void **)&v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount];
    *(void *)&v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_serviceAccount] = v7;
    id v9 = v7;

    [v2 _hostAuditToken];
    long long v10 = v21;
    char v11 = &v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostAuditToken];
    *(_OWORD *)char v11 = v20;
    *((_OWORD *)v11 + 1) = v10;
    v11[32] = 0;
    uint64_t v12 = *(void *)&v2[OBJC_IVAR___MediaSetupNavigationController_hostBundleID + 8];
    id v13 = &v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_hostBundleID];
    *(void *)id v13 = *(void *)&v2[OBJC_IVAR___MediaSetupNavigationController_hostBundleID];
    *((void *)v13 + 1) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v2;
    id v15 = &v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_progressHandler];
    uint64_t v16 = *(void *)&v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_progressHandler];
    *(void *)id v15 = sub_100017DE4;
    *((void *)v15 + 1) = v14;
    os_log_type_t v17 = v2;
    sub_100010844(v16);
    if (v17[OBJC_IVAR___MediaSetupNavigationController_testFlags + 8]) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = *(void *)&v17[OBJC_IVAR___MediaSetupNavigationController_testFlags];
    }
    *(void *)&v6[OBJC_IVAR____TtC21MediaSetupViewService12SetupSession_testFlags] = v18;
    sub_100005A0C();
    uint64_t v19 = *(void **)&v2[v1];
    *(void *)&v2[v1] = v6;
  }
}

void sub_100012304()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029850();
  os_log_type_t v3 = sub_100029A90();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v4 = 136315138;
    uint64_t v15 = sub_100021F44(0x4C64694477656976, 0xED0000292864616FLL, &v16);
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v5 = (objc_class *)type metadata accessor for MediaSetupNavigationController();
  v17.receiver = v1;
  v17.super_class = v5;
  objc_msgSendSuper2(&v17, "viewDidLoad");
  id v6 = [v1 interactivePopGestureRecognizer];
  if (v6)
  {
    char v7 = v6;
    [v6 setEnabled:0];
  }
  id v8 = objc_msgSend(v1, "navigationItem", v15);
  [v8 setHidesBackButton:1];

  id v9 = [v1 presentationController];
  if (v9)
  {
    long long v10 = v9;
    [v9 setDelegate:v1];
  }
  [v1 setToolbarHidden:1 animated:0];
  id v11 = objc_allocWithZone((Class)OBWelcomeController);
  NSString v12 = sub_100029950();
  NSString v13 = sub_100029950();
  id v14 = [v11 initWithTitle:v12 detailText:v13 icon:0];

  [v1 pushViewController:v14 animated:0];
  *((unsigned char *)v1 + OBJC_IVAR___MediaSetupNavigationController_waiting) = 1;
  sub_100011364();
}

id sub_100012670(uint64_t ObjCClassFromMetadata, uint64_t a2)
{
  id v5 = &v2[OBJC_IVAR___MediaSetupNavigationController_hostBundleID];
  *(void *)id v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v2[OBJC_IVAR___MediaSetupNavigationController_serviceAccount] = 0;
  *(void *)&v2[OBJC_IVAR___MediaSetupNavigationController_setupSession] = 0;
  id v6 = &v2[OBJC_IVAR___MediaSetupNavigationController_stepContext];
  *(_OWORD *)id v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  char v7 = &v2[OBJC_IVAR___MediaSetupNavigationController_testFlags];
  *(void *)char v7 = 0;
  v7[8] = 1;
  id v8 = v2;
  sub_100029860();
  v8[OBJC_IVAR___MediaSetupNavigationController_firstVC] = 1;
  v8[OBJC_IVAR___MediaSetupNavigationController_dismissed] = 0;
  *(void *)&v8[OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch] = 0;
  *(void *)&v8[OBJC_IVAR___MediaSetupNavigationController_vcAddToHome] = 0;
  *(void *)&v8[OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize] = 0;
  *(void *)&v8[OBJC_IVAR___MediaSetupNavigationController_vcDone] = 0;
  *(void *)&v8[OBJC_IVAR___MediaSetupNavigationController_vcLearnMore] = 0;
  *(void *)&v8[OBJC_IVAR___MediaSetupNavigationController_vcSoftwareUpdate] = 0;
  v8[OBJC_IVAR___MediaSetupNavigationController_waiting] = 0;

  if (ObjCClassFromMetadata) {
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  }
  if (a2) {
    a2 = swift_getObjCClassFromMetadata();
  }
  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for MediaSetupNavigationController();
  return objc_msgSendSuper2(&v10, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, a2);
}

id sub_1000128A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = &v3[OBJC_IVAR___MediaSetupNavigationController_hostBundleID];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___MediaSetupNavigationController_serviceAccount] = 0;
  *(void *)&v3[OBJC_IVAR___MediaSetupNavigationController_setupSession] = 0;
  char v7 = &v3[OBJC_IVAR___MediaSetupNavigationController_stepContext];
  *(_OWORD *)char v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  id v8 = &v3[OBJC_IVAR___MediaSetupNavigationController_testFlags];
  *(void *)id v8 = 0;
  v8[8] = 1;
  id v9 = v3;
  sub_100029860();
  v9[OBJC_IVAR___MediaSetupNavigationController_firstVC] = 1;
  v9[OBJC_IVAR___MediaSetupNavigationController_dismissed] = 0;
  *(void *)&v9[OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch] = 0;
  *(void *)&v9[OBJC_IVAR___MediaSetupNavigationController_vcAddToHome] = 0;
  *(void *)&v9[OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize] = 0;
  *(void *)&v9[OBJC_IVAR___MediaSetupNavigationController_vcDone] = 0;
  *(void *)&v9[OBJC_IVAR___MediaSetupNavigationController_vcLearnMore] = 0;
  *(void *)&v9[OBJC_IVAR___MediaSetupNavigationController_vcSoftwareUpdate] = 0;
  v9[OBJC_IVAR___MediaSetupNavigationController_waiting] = 0;

  if (a2)
  {
    NSString v10 = sub_100029950();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for MediaSetupNavigationController();
  id v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_100012AC4(void *a1)
{
  os_log_type_t v3 = &v1[OBJC_IVAR___MediaSetupNavigationController_hostBundleID];
  *(void *)os_log_type_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_serviceAccount] = 0;
  *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_setupSession] = 0;
  os_log_type_t v4 = &v1[OBJC_IVAR___MediaSetupNavigationController_stepContext];
  *(_OWORD *)os_log_type_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  id v5 = &v1[OBJC_IVAR___MediaSetupNavigationController_testFlags];
  *(void *)id v5 = 0;
  v5[8] = 1;
  id v6 = v1;
  sub_100029860();
  v6[OBJC_IVAR___MediaSetupNavigationController_firstVC] = 1;
  v6[OBJC_IVAR___MediaSetupNavigationController_dismissed] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcAddToHome] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcDone] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcLearnMore] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcSoftwareUpdate] = 0;
  v6[OBJC_IVAR___MediaSetupNavigationController_waiting] = 0;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MediaSetupNavigationController();
  id v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100012C64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaSetupNavigationController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100012DC0()
{
  return type metadata accessor for MediaSetupNavigationController();
}

uint64_t type metadata accessor for MediaSetupNavigationController()
{
  uint64_t result = qword_10003BF08;
  if (!qword_10003BF08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012E14()
{
  uint64_t result = sub_100029870();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100012EE8(char a1, void *a2)
{
  uint64_t v3 = v2;
  sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
  sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
  id v6 = sub_100029850();
  os_log_type_t v7 = sub_100029A90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315395;
    unint64_t v9 = sub_100024CDC(a1);
    v28[0] = sub_100021F44(v9, v10, &v29);
    sub_100029B90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2081;
    char v11 = a1;
    sub_10001040C((uint64_t)a2, (uint64_t)v28, &qword_10003BD40);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
    sub_100002798(&qword_10003BD40);
    uint64_t v12 = sub_100029980();
    v28[0] = sub_100021F44(v12, v13, &v29);
    sub_100029B90();
    swift_bridgeObjectRelease();
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Handle session event: %s, context: %{private}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000101B8);
    char v11 = a1;
  }
  uint64_t v27 = v3;
  uint64_t v14 = v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext;
  uint64_t v15 = *(void *)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext);
  uint64_t v16 = *(void *)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext + 8);
  uint64_t v17 = *(void *)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext + 16);
  uint64_t v18 = *(void **)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext + 24);
  uint64_t v19 = *(void *)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext + 32);
  uint64_t v20 = *(void *)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext + 40);
  uint64_t v22 = *(void *)(v3 + OBJC_IVAR___MediaSetupNavigationController_stepContext + 48);
  uint64_t v21 = *(void *)(v14 + 56);
  sub_10001040C((uint64_t)a2, v14, &qword_10003BD40);
  sub_100010174(a2, (void (*)(void, void, void, void, void, void, void, void))sub_1000100D8);
  sub_1000101B8(v15, v16, v17, v18, v19, v20, v22, v21);
  switch(v11)
  {
    case 2:
      return;
    case 3:
    case 10:
      unsigned __int8 v23 = -126;
      goto LABEL_19;
    case 4:
      unsigned __int8 v23 = -125;
      goto LABEL_19;
    case 5:
      unsigned __int8 v23 = 0x80;
      goto LABEL_19;
    case 6:
      unsigned __int8 v23 = 2;
      goto LABEL_19;
    case 7:
      unsigned __int8 v23 = -127;
      goto LABEL_19;
    case 8:
      unsigned __int8 v23 = -63;
      goto LABEL_19;
    case 9:
      unsigned __int8 v23 = -64;
      goto LABEL_19;
    case 11:
      sub_100013D0C(1);
      return;
    case 12:
      unsigned __int8 v23 = -62;
      goto LABEL_19;
    case 13:
      unint64_t v24 = sub_100029850();
      os_log_type_t v25 = sub_100029A90();
      if (os_log_type_enabled(v24, v25))
      {
        id v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Handle setup started", v26, 2u);
        swift_slowDealloc();
      }

      *(unsigned char *)(v27 + OBJC_IVAR___MediaSetupNavigationController_waiting) = 1;
      sub_100011364();
      return;
    case 14:
      unsigned __int8 v23 = 1;
      goto LABEL_19;
    default:
      unsigned __int8 v23 = v11 & 1 | 0x40;
LABEL_19:
      sub_100013314(v23);
      return;
  }
}

void sub_100013314(unsigned __int8 a1)
{
  uint64_t v2 = v1;
  if (v1[OBJC_IVAR___MediaSetupNavigationController_dismissed])
  {
    osos_log_t log = sub_100029850();
    os_log_type_t v4 = sub_100029AB0();
    if (os_log_type_enabled(oslog, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      v87[0] = swift_slowAlloc();
      *(_DWORD *)id v5 = 136315138;
      uint64_t v6 = sub_1000266D4(a1);
      sub_100021F44(v6, v7, v87);
      sub_100029B90();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "### Dismiss already requested, not showing UI (%s)", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
LABEL_33:
    Swift::String v39 = oslog;
    goto LABEL_47;
  }
  if (*(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_serviceAccount])
  {
    uint64_t v8 = *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_hostBundleID + 8];
    if (v8)
    {
      osos_log_t log = *(NSObject **)&v1[OBJC_IVAR___MediaSetupNavigationController_serviceAccount];
      uint64_t v9 = *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_hostBundleID];
      switch(a1 >> 6)
      {
        case 1:
          objc_allocWithZone((Class)type metadata accessor for SoftwareUpdateViewController());
          unint64_t v24 = oslog;
          swift_bridgeObjectRetain_n();
          os_log_type_t v25 = v24;
          id v26 = sub_10001F598(v2, v25, v9, v8, a1 & 1);
          swift_bridgeObjectRelease();

          goto LABEL_45;
        case 2:
          uint64_t v12 = oslog;
          switch(a1)
          {
            case 0x81u:
              uint64_t v31 = OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize;
              uint64_t v40 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize];
              if (v40)
              {
                uint64_t v32 = oslog;
                id v33 = v40;
                goto LABEL_27;
              }
              long long v49 = (uint64_t *)&v2[OBJC_IVAR___MediaSetupNavigationController_stepContext];
              unint64_t v50 = *(void *)&v2[OBJC_IVAR___MediaSetupNavigationController_stepContext + 56];
              if (v50)
              {
                uint64_t v51 = v49[5];
                uint64_t v82 = v49[6];
                uint64_t v53 = (void *)v49[3];
                uint64_t v52 = v49[4];
                uint64_t v54 = v49[1];
                uint64_t v55 = v49[2];
                uint64_t v56 = *v49;
                uint64_t v85 = oslog;
                swift_bridgeObjectRetain();
                sub_1000100D8(v56, v54, v55, v53, v52, v51, v82, v50);
                swift_bridgeObjectRetain();
                sub_1000101B8(v56, v54, v55, v53, v52, v51, v82, v50);
                if (v50 >> 62)
                {
                  unint64_t v58 = v85;
                  id v77 = v85;
                  unint64_t v78 = swift_bridgeObjectRetain();
                  uint64_t v57 = (uint64_t)sub_100015D9C(v78);
                  swift_bridgeObjectRelease();
                }
                else
                {
                  uint64_t v57 = v50 & 0xFFFFFFFFFFFFFF8;
                  unint64_t v58 = v85;
                  uint64_t v59 = v85;
                  swift_bridgeObjectRetain();
                }
                v87[0] = v57;
                sub_1000161F8(v87);
                swift_bridgeObjectRelease();
                unint64_t v60 = v87[0];
                id v61 = objc_allocWithZone((Class)type metadata accessor for MultiHomeCustomizeViewController());
                v84 = v58;
                id v62 = v2;
                swift_retain();
                unint64_t v63 = sub_10001FBA8(v62, v60, v84);
                unint64_t v64 = *(void **)&v2[v31];
                *(void *)&v2[v31] = v63;

                swift_release();
                goto LABEL_43;
              }
              osos_log_t log = oslog;
              swift_bridgeObjectRetain();
              id v66 = sub_100029850();
              os_log_type_t v67 = sub_100029AB0();
              if (!os_log_type_enabled(v66, v67)) {
                goto LABEL_56;
              }
              v68 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v68 = 0;
              os_log_type_t v69 = "User tried to setup multiple homes but had no context which to draw the UI with";
              goto LABEL_55;
            case 0x82u:
              uint64_t v35 = OBJC_IVAR___MediaSetupNavigationController_vcDone;
              id v36 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_vcDone];
              if (v36)
              {
                id v37 = oslog;
                swift_bridgeObjectRetain();
                id v26 = v36;
                id v38 = v36;
                goto LABEL_45;
              }
              objc_allocWithZone((Class)type metadata accessor for DoneViewController());
              uint64_t v44 = oslog;
              swift_bridgeObjectRetain_n();
              v84 = v44;
              id v45 = sub_100018108(v2, v84, v9, v8);
              unint64_t v46 = *(void **)&v2[v35];
              *(void *)&v2[v35] = v45;

              unint64_t v47 = *(void **)&v2[v35];
              if (!v47) {
                goto LABEL_58;
              }
              id v26 = v47;
              id v48 = 0;
              goto LABEL_45;
            case 0x83u:
              osos_log_t log = oslog;
              swift_bridgeObjectRetain();
              sub_100014008();
              goto LABEL_32;
            default:
              char v11 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch];
              if (v11) {
                goto LABEL_26;
              }
              uint64_t v16 = (uint64_t *)&v2[OBJC_IVAR___MediaSetupNavigationController_stepContext];
              uint64_t v17 = *(void *)&v2[OBJC_IVAR___MediaSetupNavigationController_stepContext + 56];
              if (v17)
              {
                uint64_t v80 = OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch;
                uint64_t v19 = *v16;
                uint64_t v18 = v16[1];
                uint64_t v21 = v16[2];
                uint64_t v20 = (void *)v16[3];
                uint64_t v22 = v16[5];
                uint64_t v81 = v16[6];
                id v83 = (id)v16[4];
                unsigned __int8 v23 = oslog;
                swift_bridgeObjectRetain_n();
                v79 = v23;
                sub_100010118(v19, v18, v21, v20);
                sub_1000100D8(v19, v18, v21, v20, (uint64_t)v83, v22, v81, v17);
                sub_1000101B8(v19, v18, v21, v20, (uint64_t)v83, v22, v81, v17);
                if (v18 != 1)
                {
                  v87[0] = v19;
                  v87[1] = v18;
                  char v88 = v21 & 1;
                  uint64_t v89 = v20;
                  id v90 = v83;
                  uint64_t v91 = v22;
                  uint64_t v92 = v79;
                  uint64_t v93 = v9;
                  uint64_t v94 = v8;
                  id v70 = objc_allocWithZone((Class)type metadata accessor for AccountMismatchViewController());
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain_n();
                  id v71 = v20;
                  unsigned __int8 v72 = v79;
                  swift_bridgeObjectRetain();
                  v84 = v72;
                  os_log_type_t v73 = v2;
                  id v74 = v71;
                  id v75 = sub_1000108F0(v73, (uint64_t)v87);
                  v76 = *(void **)&v2[v80];
                  *(void *)&v2[v80] = v75;
                  swift_bridgeObjectRelease();

                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();

                  id v30 = *(void **)&v2[v80];
                  if (v30) {
                    goto LABEL_44;
                  }
LABEL_58:
                  swift_bridgeObjectRelease();
LABEL_46:

                  Swift::String v39 = v84;
LABEL_47:

                  return;
                }
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v65 = oslog;
                swift_bridgeObjectRetain();
              }
              id v66 = sub_100029850();
              os_log_type_t v67 = sub_100029AB0();
              if (os_log_type_enabled(v66, v67))
              {
                v68 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v68 = 0;
                os_log_type_t v69 = "User had mismatched account but had no context to construct the view";
LABEL_55:
                _os_log_impl((void *)&_mh_execute_header, v66, v67, v69, v68, 2u);
                swift_slowDealloc();
              }
LABEL_56:

              sub_100014008();
              swift_bridgeObjectRelease();

              goto LABEL_33;
          }
        case 3:
          if (a1 != 192)
          {
            if (a1 == 193)
            {
              osos_log_t log = oslog;
              swift_bridgeObjectRetain();
              sub_1000143E4();
            }
            else
            {
              osos_log_t log = oslog;
              swift_bridgeObjectRetain();
              sub_1000147BC();
            }
LABEL_32:
            swift_bridgeObjectRelease();
            goto LABEL_33;
          }
          uint64_t v31 = OBJC_IVAR___MediaSetupNavigationController_vcLearnMore;
          char v11 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_vcLearnMore];
          uint64_t v12 = oslog;
          if (v11) {
            goto LABEL_26;
          }
          objc_allocWithZone((Class)type metadata accessor for LearnMoreViewController());
          int v41 = oslog;
          swift_bridgeObjectRetain_n();
          v84 = v41;
          id v42 = sub_10001875C(v2, v84, v9, v8);
          uint64_t v43 = *(void **)&v2[v31];
          *(void *)&v2[v31] = v42;

LABEL_43:
          id v30 = *(void **)&v2[v31];
          if (v30) {
            goto LABEL_44;
          }
          goto LABEL_58;
        default:
          uint64_t v10 = OBJC_IVAR___MediaSetupNavigationController_vcAddToHome;
          char v11 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_vcAddToHome];
          if (v11)
          {
            uint64_t v12 = oslog;
LABEL_26:
            uint64_t v32 = v12;
            id v33 = v11;
LABEL_27:
            id v26 = v33;
            long long v34 = v32;
            swift_bridgeObjectRetain();
          }
          else
          {
            objc_allocWithZone((Class)type metadata accessor for AddToHomeViewController());
            uint64_t v27 = oslog;
            swift_bridgeObjectRetain_n();
            v84 = v27;
            id v28 = sub_100001CDC(v2, a1, v84, v9, v8);
            uint64_t v29 = *(void **)&v2[v10];
            *(void *)&v2[v10] = v28;
            swift_bridgeObjectRelease();

            id v30 = *(void **)&v2[v10];
            if (!v30) {
              goto LABEL_58;
            }
LABEL_44:
            id v26 = v30;
          }
LABEL_45:
          v84 = v26;
          sub_1000151C0((uint64_t)v84);
          swift_bridgeObjectRelease();

          goto LABEL_46;
      }
    }
  }
  unint64_t v13 = sub_100029850();
  os_log_type_t v14 = sub_100029AB0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Attempted to show UI but lacked the necessary service information to construct views", v15, 2u);
    swift_slowDealloc();
  }

  sub_100014008();
}

uint64_t sub_100013D0C(char a1)
{
  uint64_t v2 = v1;
  os_log_type_t v4 = sub_100029850();
  os_log_type_t v5 = sub_100029A90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    v17[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    unint64_t v7 = 0x800000010002BA20;
    uint64_t v8 = 0xD000000000000010;
    switch(a1)
    {
      case 1:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1919251317;
        break;
      case 2:
        unint64_t v7 = 0xED000065726F4D6ELL;
        uint64_t v8 = 0x7261654C72657375;
        break;
      case 3:
        break;
      case 4:
        unint64_t v7 = 0xE700000000000000;
        uint64_t v8 = 0x6E776F6E6B6E75;
        break;
      default:
        unint64_t v7 = 0xED00006574656C70;
        uint64_t v8 = 0x6D6F437075746573;
        break;
    }
    *(void *)&v16[0] = sub_100021F44(v8, v7, v17);
    sub_100029B90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Requesting dismiss (%s)", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v2[OBJC_IVAR___MediaSetupNavigationController_dismissed] = 1;
  uint64_t v9 = OBJC_IVAR___MediaSetupNavigationController_setupSession;
  uint64_t v10 = *(void **)&v2[OBJC_IVAR___MediaSetupNavigationController_setupSession];
  if (v10)
  {
    id v11 = v10;
    sub_10000787C(a1);
  }
  if (!a1)
  {
    uint64_t v12 = *(void **)&v2[v9];
    if (v12)
    {
      id v13 = v12;
      sub_100007398();
    }
  }
  if ([v2 _remoteViewControllerProxy])
  {
    sub_100029BB0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_10001040C((uint64_t)v16, (uint64_t)v17, &qword_10003BF78);
  if (!v17[3]) {
    return sub_100010604((uint64_t)v17, &qword_10003BF78);
  }
  sub_100002798(&qword_10003BF80);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    [v15 requestDismiss];
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100014008()
{
  unint64_t v1 = v0;
  v0[OBJC_IVAR___MediaSetupNavigationController_waiting] = 0;
  sub_100011364();
  uint64_t v2 = sub_100029850();
  os_log_type_t v3 = sub_100029AA0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Presenting error alert", v4, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v5 = *(void **)&v1[OBJC_IVAR___MediaSetupNavigationController_serviceAccount];
  if (v5)
  {
    id v6 = [v5 serviceName];
    uint64_t v7 = sub_100029960();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0xE100000000000000;
    uint64_t v7 = 63;
  }
  sub_1000102BC(0, &qword_10003BFF8);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  id v11 = v1;
  id v12 = sub_100023AC4(v7, v9, (uint64_t)sub_100017F78, v10);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  v16[4] = sub_100017F80;
  v16[5] = v13;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  _OWORD v16[2] = sub_10000C76C;
  v16[3] = &unk_1000355B0;
  os_log_type_t v14 = _Block_copy(v16);
  id v15 = v11;
  swift_release();
  [v15 presentViewController:v12 animated:1 completion:v14];
  _Block_release(v14);
}

void sub_100014230(uint64_t a1)
{
  uint64_t v2 = sub_100029850();
  os_log_type_t v3 = sub_100029AA0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Dismissing error alert", v4, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v5 = *(void **)(a1 + OBJC_IVAR___MediaSetupNavigationController_setupSession);
  if (v5)
  {
    memset(v7, 0, sizeof(v7));
    id v6 = v5;
    sub_10000617C(0, v7);
  }
}

void sub_100014338()
{
  osos_log_t log = sub_100029850();
  os_log_type_t v0 = sub_100029AA0();
  if (os_log_type_enabled(oslog, v0))
  {
    unint64_t v1 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v0, "Presented error alert", v1, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000143E4()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_100002798(&qword_10003BFE8);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100029770();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v11 = (char *)&v30 - v10;
  id v12 = sub_100029850();
  os_log_type_t v13 = sub_100029A90();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Launching learn more website", v14, 2u);
    swift_slowDealloc();
  }

  id v15 = (objc_class *)[self mainBundle];
  v29._countAndFlagsBits = 0xE000000000000000;
  v33._object = (void *)0x800000010002C180;
  v33._countAndFlagsBits = 0xD000000000000012;
  v34.value._countAndFlagsBits = 0;
  v34.value._object = 0;
  v16.super.Class isa = v15;
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_100029710(v33, v34, v16, v35, v29);

  sub_100029760();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_100010604((uint64_t)v4, &qword_10003BFE8);
  }
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v18(v11, v4, v5);
  id v19 = [self defaultWorkspace];
  if (v19)
  {
    uint64_t v21 = v19;
    sub_100029740(v20);
    uint64_t v31 = v22;
    unsigned __int8 v23 = v1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    unint64_t v24 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v23;
    v18((char *)(v25 + v24), v9, v5);
    aBlock[4] = sub_100017ED4;
    aBlock[5] = v25;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000156B4;
    aBlock[3] = &unk_1000354E8;
    id v26 = _Block_copy(aBlock);
    id v27 = v23;
    swift_release();
    id v28 = v31;
    [v21 openURL:v31 configuration:0 completionHandler:v26];
    _Block_release(v26);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

void sub_1000147BC()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_100002798(&qword_10003BFE8);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100029770();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v11 = (char *)&v72 - v10;
  uint64_t v12 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v12 - 8);
  os_log_type_t v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100029810();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v18 = __chkstk_darwin(v17);
  __chkstk_darwin(v18);
  uint64_t v22 = (uint64_t *)&v1[OBJC_IVAR___MediaSetupNavigationController_stepContext];
  unint64_t v23 = *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_stepContext + 56];
  if (!v23) {
    goto LABEL_13;
  }
  uint64_t v75 = v21;
  v76 = v4;
  os_log_type_t v73 = v20;
  id v74 = v9;
  id v77 = v11;
  uint64_t v78 = v6;
  v79 = (char *)&v72 - v19;
  uint64_t v80 = v5;
  uint64_t v81 = v15;
  uint64_t v82 = v16;
  unint64_t v24 = v1;
  uint64_t v25 = v22[5];
  uint64_t v26 = v22[6];
  id v28 = (void *)v22[3];
  uint64_t v27 = v22[4];
  uint64_t v30 = v22[1];
  uint64_t v29 = v22[2];
  uint64_t v31 = *v22;
  sub_1000100D8(*v22, v30, v29, v28, v27, v25, v26, v23);
  swift_bridgeObjectRetain();
  sub_1000101B8(v31, v30, v29, v28, v27, v25, v26, v23);
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_100029D00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v32 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  Swift::String v33 = v24;
  uint64_t v15 = v81;
  uint64_t v16 = v82;
  if (!v32)
  {
    swift_bridgeObjectRelease();
LABEL_13:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
    goto LABEL_14;
  }
  if ((v23 & 0xC000000000000001) != 0)
  {
    uint64_t v34 = sub_100029C70();
  }
  else
  {
    if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    uint64_t v34 = *(void *)(v23 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  Swift::String v35 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v35(v14, v34 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v15);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
  {
    id v36 = v79;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v79, v14, v15);
    uint64_t v37 = v75;
    v35((char *)v75, (uint64_t)v36, v15);
    uint64_t v38 = (uint64_t)v76;
    sub_100023E98(v37, (uint64_t)v76);
    uint64_t v39 = v78;
    uint64_t v40 = v80;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v38, 1, v80) == 1)
    {
      sub_100010604(v38, &qword_10003BFE8);
      int v41 = v73;
      v35(v73, (uint64_t)v36, v15);
      id v42 = sub_100029850();
      os_log_type_t v43 = sub_100029AB0();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 136380675;
        sub_100017F88((unint64_t *)&qword_10003BD50, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v45 = sub_100029D70();
        uint64_t v84 = sub_100021F44(v45, v46, aBlock);
        sub_100029B90();
        swift_bridgeObjectRelease();
        unint64_t v47 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
        v47((uint64_t)v41, v15);
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "### Failed to generate homeURL with homeID %{private}s", v44, 0xCu);
        swift_arrayDestroy();
        id v36 = v79;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        unint64_t v47 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
        v47((uint64_t)v41, v15);
      }
      sub_100014008();
      v47((uint64_t)v36, v15);
    }
    else
    {
      uint64_t v51 = v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v77, v38, v40);
      uint64_t v52 = v74;
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v74, v51, v40);
      uint64_t v53 = sub_100029850();
      os_log_type_t v54 = sub_100029AA0();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = (uint8_t *)swift_slowAlloc();
        v76 = (char *)swift_slowAlloc();
        aBlock[0] = (uint64_t)v76;
        *(_DWORD *)uint64_t v55 = 136315138;
        sub_100017F88(&qword_10003BFF0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v56 = sub_100029D70();
        uint64_t v84 = sub_100021F44(v56, v57, aBlock);
        uint64_t v51 = v77;
        uint64_t v58 = v80;
        sub_100029B90();
        swift_bridgeObjectRelease();
        uint64_t v59 = *(void (**)(char *, uint64_t))(v39 + 8);
        v59(v52, v58);
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Opening %s", v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v58 = v40;

        uint64_t v59 = *(void (**)(char *, uint64_t))(v39 + 8);
        v59(v52, v40);
      }
      id v60 = [objc_allocWithZone((Class)_LSOpenConfiguration) init];
      [v60 setSensitive:1];
      id v61 = [self defaultWorkspace];
      uint64_t v63 = v81;
      if (v61)
      {
        unint64_t v64 = v61;
        sub_100029740(v62);
        id v66 = v65;
        uint64_t v67 = swift_allocObject();
        *(void *)(v67 + 16) = v33;
        aBlock[4] = (uint64_t)sub_100017F70;
        aBlock[5] = v67;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1000156B4;
        aBlock[3] = (uint64_t)&unk_100035538;
        v68 = _Block_copy(aBlock);
        id v69 = v60;
        id v70 = v33;
        uint64_t v51 = v77;
        swift_release();
        [v64 openURL:v66 configuration:v69 completionHandler:v68];
        id v71 = v68;
        uint64_t v58 = v80;
        _Block_release(v71);

        uint64_t v16 = v82;
      }

      v59(v51, v58);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v79, v63);
    }
    return;
  }
LABEL_14:
  sub_100010604((uint64_t)v14, (uint64_t *)&unk_10003BD30);
  id v48 = sub_100029850();
  os_log_type_t v49 = sub_100029AB0();
  if (os_log_type_enabled(v48, v49))
  {
    unint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "### Show update in Home without HomeID?", v50, 2u);
    swift_slowDealloc();
  }

  sub_100014008();
}

void sub_1000151C0(uint64_t a1)
{
  uint64_t v2 = v1;
  char v4 = *((unsigned char *)v1 + OBJC_IVAR___MediaSetupNavigationController_firstVC) ^ 1;
  if ((v4 & 1) == 0) {
    *((unsigned char *)v1 + OBJC_IVAR___MediaSetupNavigationController_firstVC) = 0;
  }
  uint64_t v5 = sub_100029850();
  os_log_type_t v6 = sub_100029AA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Transitioning animated: %{BOOL}d", v7, 8u);
    swift_slowDealloc();
  }

  id v8 = [v2 viewControllers];
  sub_1000102BC(0, &qword_10003BFD8);
  unint64_t v9 = sub_100029A10();

  char v10 = sub_1000111DC(a1, v9);
  swift_bridgeObjectRelease();
  *((unsigned char *)v2 + OBJC_IVAR___MediaSetupNavigationController_waiting) = 0;
  sub_100011364();
  if (v10) {

  }
  else {
    [v2 pushViewController:a1 animated:v4 & 1];
  }
}

uint64_t sub_10001537C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_100029770();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    id v11 = sub_100029850();
    os_log_type_t v12 = sub_100029AB0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v22 = a3;
      uint64_t v14 = v13;
      uint64_t v20 = (void *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v24 = v21;
      *(_DWORD *)uint64_t v14 = 136315394;
      sub_100017F88(&qword_10003BFF0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v15 = sub_100029D70();
      uint64_t v23 = sub_100021F44(v15, v16, &v24);
      sub_100029B90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      *(_WORD *)(v14 + 12) = 2112;
      swift_errorRetain();
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v23 = v17;
      sub_100029B90();
      *uint64_t v20 = v17;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "### Failed to open %s: %@", (uint8_t *)v14, 0x16u);
      sub_100002798(&qword_10003BD70);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  return sub_100013D0C(2);
}

uint64_t sub_1000156B4(uint64_t a1, uint64_t a2, void *a3)
{
  char v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_100029910();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100015760(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v2 = sub_100029850();
    os_log_type_t v3 = sub_100029AB0();
    if (os_log_type_enabled(v2, v3))
    {
      char v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)char v4 = 138412290;
      swift_errorRetain();
      uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
      sub_100029B90();
      *uint64_t v5 = v7;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "### Error launching home app: %@", v4, 0xCu);
      sub_100002798(&qword_10003BD70);
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
  return sub_100013D0C(3);
}

id sub_100015ADC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [self interfaceWithProtocol:*a3];

  return v3;
}

uint64_t sub_100015B30(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_100015B68(uint64_t (*a1)(void))
{
  return a1();
}

void sub_100015B90(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100029B90();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

char *sub_100015C48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  sub_100002798(&qword_10003C028);
  uint64_t v3 = *(void *)(type metadata accessor for ConfigurationModelItem() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  id v6 = (void *)swift_allocObject();
  uint64_t result = (char *)j__malloc_size(v6);
  if (v4)
  {
    if (&result[-v5] != (char *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)&result[-v5] / v4);
      uint64_t v9 = sub_100017554(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_10000475C();
      if (v9 == v1) {
        return (char *)v6;
      }
      __break(1u);
      return (char *)&_swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_100015D9C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100002798(&qword_10003BFB0);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100017344((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100029D00();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

unint64_t sub_100015E94(uint64_t a1)
{
  sub_100029810();
  sub_100017F88((unint64_t *)&qword_10003C000, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_100029920();

  return sub_100015F70(a1, v2);
}

unint64_t sub_100015F2C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100029BF0(*(void *)(v2 + 40));

  return sub_100016130(a1, v4);
}

unint64_t sub_100015F70(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100029810();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    id v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100017F88(&qword_10003BDB8, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_100029940();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_100016130(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100017D50(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100029C00();
      sub_100017CA4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000161F8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100017820(v2);
    *a1 = v2;
  }
  unint64_t v4 = *(uint64_t **)(v2 + 16);
  v6[0] = (uint64_t *)(v2 + 32);
  v6[1] = v4;
  sub_100016274(v6);
  return sub_100029CB0();
}

Swift::Int sub_100016274(uint64_t **a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  Swift::Int v4 = (Swift::Int)a1[1];
  Swift::Int result = sub_100029D60(v4);
  Swift::Int v143 = v4;
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_217;
    }
    if ((unint64_t)v4 >= 2)
    {
      uint64_t v10 = *v3;
      uint64_t v11 = -1;
      uint64_t v12 = 1;
      uint64_t v13 = v10;
      do
      {
        uint64_t v14 = v10[v12];
        uint64_t v15 = v11;
        unint64_t v16 = v13;
        do
        {
          uint64_t v17 = (Swift::Int *)(v14 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
          Swift::Int result = *v17;
          Swift::Int v18 = v17[1];
          uint64_t v19 = (void *)(*v16 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
          BOOL v20 = result == *v19 && v18 == v19[1];
          if (v20) {
            break;
          }
          Swift::Int result = sub_100029D80();
          if ((result & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_219;
          }
          uint64_t v21 = *v16;
          uint64_t v14 = v16[1];
          *unint64_t v16 = v14;
          v16[1] = v21;
          --v16;
          BOOL v22 = __CFADD__(v15++, 1);
        }
        while (!v22);
        ++v12;
        ++v13;
        --v11;
      }
      while (v12 != v143);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_224;
  }
  Swift::Int v141 = result;
  if (v4 < 2)
  {
    uint64_t v23 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v153 = (uint64_t)&_swiftEmptyArrayStorage;
    unint64_t v9 = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v27 = *((void *)&_swiftEmptyArrayStorage + 2);
      if (v27 < 2)
      {
LABEL_191:
        swift_bridgeObjectRelease();
        *(void *)((v153 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_100029A30();
        return swift_bridgeObjectRelease();
      }
LABEL_181:
      v134 = *v3;
      while (1)
      {
        unint64_t v135 = v27 - 2;
        if (v27 < 2) {
          goto LABEL_210;
        }
        if (!v134) {
          goto LABEL_222;
        }
        uint64_t v136 = *(void *)&v23[16 * v135 + 32];
        uint64_t v137 = *(void *)&v23[16 * v27 + 24];
        sub_100016C84((char *)&v134[v136], (char *)&v134[*(void *)&v23[16 * v27 + 16]], (unint64_t)&v134[v137], v9);
        if (v2) {
          goto LABEL_191;
        }
        if (v137 < v136) {
          goto LABEL_211;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v23 = sub_100017110((uint64_t)v23);
        }
        if (v135 >= *((void *)v23 + 2)) {
          goto LABEL_212;
        }
        v138 = &v23[16 * v135 + 32];
        *(void *)v138 = v136;
        *((void *)v138 + 1) = v137;
        unint64_t v139 = *((void *)v23 + 2);
        if (v27 > v139) {
          goto LABEL_213;
        }
        memmove(&v23[16 * v27 + 16], &v23[16 * v27 + 32], 16 * (v139 - v27));
        *((void *)v23 + 2) = v139 - 1;
        unint64_t v27 = v139 - 1;
        if (v139 <= 2) {
          goto LABEL_191;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    type metadata accessor for HomeItem();
    uint64_t v8 = sub_100029A50();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    unint64_t v9 = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v153 = v8;
  }
  __dst = v9;
  v140 = v3;
  Swift::Int v24 = 0;
  uint64_t v25 = *v3;
  uint64_t v144 = (uint64_t)(*v3 - 1);
  uint64_t v23 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v26 = v4;
  v145 = v25;
  while (1)
  {
    Swift::Int v28 = v24 + 1;
    if (v24 + 1 < v26)
    {
      uint64_t v29 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name;
      uint64_t v30 = (uint64_t *)(v25[v28] + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
      uint64_t v31 = *v30;
      uint64_t v32 = v30[1];
      Swift::String v33 = (void *)(v25[v24] + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
      if (v31 == *v33 && v32 == v33[1])
      {
        Swift::Int v36 = v24 + 2;
        if (v24 + 2 >= v26) {
          goto LABEL_52;
        }
        int v35 = 0;
        do
        {
LABEL_37:
          uint64_t v38 = (uint64_t *)(v25[v36] + v29);
          uint64_t v39 = *v38;
          uint64_t v40 = v38[1];
          int v41 = (void *)(v25[v28] + v29);
          if (v39 == *v41 && v40 == v41[1])
          {
            if (v35) {
              goto LABEL_45;
            }
          }
          else
          {
            if ((v35 ^ sub_100029D80())) {
              goto LABEL_44;
            }
            uint64_t v29 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name;
          }
          Swift::Int v37 = v36 + 1;
          Swift::Int v28 = v36;
          Swift::Int v36 = v37;
        }
        while (v37 < v26);
        Swift::Int v36 = v37;
      }
      else
      {
        int v35 = sub_100029D80();
        Swift::Int v36 = v24 + 2;
        if (v24 + 2 < v26)
        {
          uint64_t v29 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name;
          goto LABEL_37;
        }
      }
LABEL_44:
      Swift::Int v28 = v36;
      if (v35)
      {
LABEL_45:
        if (v36 < v24) {
          goto LABEL_216;
        }
        if (v24 < v36)
        {
          os_log_type_t v43 = (uint64_t *)(v144 + 8 * v36);
          Swift::Int v44 = v36;
          Swift::Int v45 = v24;
          unint64_t v46 = &v25[v24];
          do
          {
            if (v45 != --v44)
            {
              if (!v25) {
                goto LABEL_221;
              }
              uint64_t v47 = *v46;
              uint64_t *v46 = *v43;
              *os_log_type_t v43 = v47;
            }
            ++v45;
            --v43;
            ++v46;
          }
          while (v45 < v44);
        }
LABEL_52:
        Swift::Int v28 = v36;
      }
    }
    if (v28 < v26)
    {
      if (__OFSUB__(v28, v24)) {
        goto LABEL_209;
      }
      if (v28 - v24 < v141)
      {
        if (__OFADD__(v24, v141)) {
          goto LABEL_214;
        }
        if (v24 + v141 >= v26) {
          Swift::Int v48 = v26;
        }
        else {
          Swift::Int v48 = v24 + v141;
        }
        if (v48 < v24) {
          goto LABEL_215;
        }
        if (v28 != v48)
        {
          os_log_type_t v49 = (uint64_t *)(v144 + 8 * v28);
          do
          {
            uint64_t v50 = v25[v28];
            Swift::Int v51 = v24;
            uint64_t v52 = v49;
            do
            {
              uint64_t v53 = (uint64_t *)(v50 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
              uint64_t v54 = *v53;
              uint64_t v55 = v53[1];
              uint64_t v56 = (void *)(*v52 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
              BOOL v57 = v54 == *v56 && v55 == v56[1];
              if (v57 || (sub_100029D80() & 1) == 0) {
                break;
              }
              if (!v25) {
                goto LABEL_218;
              }
              uint64_t v58 = *v52;
              uint64_t v50 = v52[1];
              *uint64_t v52 = v50;
              v52[1] = v58;
              --v52;
              ++v51;
            }
            while (v28 != v51);
            ++v28;
            ++v49;
          }
          while (v28 != v48);
          Swift::Int v28 = v48;
        }
      }
    }
    if (v28 < v24) {
      goto LABEL_208;
    }
    Swift::Int v142 = v28;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v23 = sub_100016F58(0, *((void *)v23 + 2) + 1, 1, v23);
    }
    unint64_t v60 = *((void *)v23 + 2);
    unint64_t v59 = *((void *)v23 + 3);
    unint64_t v27 = v60 + 1;
    if (v60 >= v59 >> 1) {
      uint64_t v23 = sub_100016F58((char *)(v59 > 1), v60 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v27;
    id v61 = v23 + 32;
    id v62 = &v23[16 * v60 + 32];
    *(void *)id v62 = v24;
    *((void *)v62 + 1) = v28;
    if (v60) {
      break;
    }
    unint64_t v27 = 1;
LABEL_25:
    Swift::Int v24 = v142;
    Swift::Int v26 = v143;
    if (v142 >= v143)
    {
      uint64_t v3 = v140;
      uint64_t v2 = v1;
      unint64_t v9 = __dst;
      if (v27 < 2) {
        goto LABEL_191;
      }
      goto LABEL_181;
    }
  }
  v147 = v23 + 32;
  v148 = v23;
  while (1)
  {
    int64_t v63 = v27 - 1;
    if (v27 >= 4)
    {
      v68 = &v61[16 * v27];
      uint64_t v69 = *((void *)v68 - 8);
      uint64_t v70 = *((void *)v68 - 7);
      BOOL v74 = __OFSUB__(v70, v69);
      uint64_t v71 = v70 - v69;
      if (v74) {
        goto LABEL_197;
      }
      uint64_t v73 = *((void *)v68 - 6);
      uint64_t v72 = *((void *)v68 - 5);
      BOOL v74 = __OFSUB__(v72, v73);
      uint64_t v66 = v72 - v73;
      char v67 = v74;
      if (v74) {
        goto LABEL_198;
      }
      unint64_t v75 = v27 - 2;
      v76 = &v61[16 * v27 - 32];
      uint64_t v78 = *(void *)v76;
      uint64_t v77 = *((void *)v76 + 1);
      BOOL v74 = __OFSUB__(v77, v78);
      uint64_t v79 = v77 - v78;
      if (v74) {
        goto LABEL_200;
      }
      BOOL v74 = __OFADD__(v66, v79);
      uint64_t v80 = v66 + v79;
      if (v74) {
        goto LABEL_203;
      }
      if (v80 >= v71)
      {
        v98 = &v61[16 * v63];
        uint64_t v100 = *(void *)v98;
        uint64_t v99 = *((void *)v98 + 1);
        BOOL v74 = __OFSUB__(v99, v100);
        uint64_t v101 = v99 - v100;
        if (v74) {
          goto LABEL_207;
        }
        BOOL v91 = v66 < v101;
        goto LABEL_112;
      }
    }
    else
    {
      if (v27 != 3)
      {
        uint64_t v92 = *((void *)v23 + 4);
        uint64_t v93 = *((void *)v23 + 5);
        BOOL v74 = __OFSUB__(v93, v92);
        uint64_t v85 = v93 - v92;
        char v86 = v74;
        goto LABEL_106;
      }
      uint64_t v65 = *((void *)v23 + 4);
      uint64_t v64 = *((void *)v23 + 5);
      BOOL v74 = __OFSUB__(v64, v65);
      uint64_t v66 = v64 - v65;
      char v67 = v74;
    }
    if (v67) {
      goto LABEL_199;
    }
    unint64_t v75 = v27 - 2;
    uint64_t v81 = &v61[16 * v27 - 32];
    uint64_t v83 = *(void *)v81;
    uint64_t v82 = *((void *)v81 + 1);
    BOOL v84 = __OFSUB__(v82, v83);
    uint64_t v85 = v82 - v83;
    char v86 = v84;
    if (v84) {
      goto LABEL_202;
    }
    uint64_t v87 = &v61[16 * v63];
    uint64_t v89 = *(void *)v87;
    uint64_t v88 = *((void *)v87 + 1);
    BOOL v74 = __OFSUB__(v88, v89);
    uint64_t v90 = v88 - v89;
    if (v74) {
      goto LABEL_205;
    }
    if (__OFADD__(v85, v90)) {
      goto LABEL_206;
    }
    if (v85 + v90 >= v66)
    {
      BOOL v91 = v66 < v90;
LABEL_112:
      if (v91) {
        int64_t v63 = v75;
      }
      goto LABEL_114;
    }
LABEL_106:
    if (v86) {
      goto LABEL_201;
    }
    uint64_t v94 = &v61[16 * v63];
    uint64_t v96 = *(void *)v94;
    uint64_t v95 = *((void *)v94 + 1);
    BOOL v74 = __OFSUB__(v95, v96);
    uint64_t v97 = v95 - v96;
    if (v74) {
      goto LABEL_204;
    }
    if (v97 < v85) {
      goto LABEL_25;
    }
LABEL_114:
    if (v63 - 1 >= v27) {
      break;
    }
    if (!v25) {
      goto LABEL_220;
    }
    v150 = &v61[16 * v63 - 16];
    uint64_t v102 = *(void *)v150;
    v103 = &v61[16 * v63];
    uint64_t v104 = *(void *)v103;
    v149 = v103;
    v105 = (char *)&v25[*(void *)v150];
    v106 = (char *)&v25[*(void *)v103];
    uint64_t v151 = *(void *)v150;
    uint64_t v152 = *((void *)v103 + 1);
    unint64_t v107 = (unint64_t)&v25[v152];
    uint64_t v108 = v106 - v105;
    uint64_t v109 = v106 - v105 + 7;
    if (v106 - v105 >= 0) {
      uint64_t v109 = v106 - v105;
    }
    uint64_t v110 = v109 >> 3;
    uint64_t v111 = v107 - (void)v106;
    uint64_t v112 = v107 - (void)v106 + 7;
    if ((uint64_t)(v107 - (void)v106) >= 0) {
      uint64_t v112 = v107 - (void)v106;
    }
    uint64_t v113 = v112 >> 3;
    if (v110 >= v112 >> 3)
    {
      if (v111 < -7) {
        goto LABEL_223;
      }
      if ((unint64_t)__dst >= v107 || __dst != v106)
      {
        uint64_t v125 = *(void *)v150;
        memmove(__dst, v106, 8 * v113);
        uint64_t v102 = v125;
      }
      v115 = &__dst[8 * v113];
      v114 = __dst;
      if (v102 >= v104 || v111 < 8) {
        goto LABEL_140;
      }
      v126 = (char *)(v144 + 8 * v152);
      while (2)
      {
        v127 = v126 + 8;
        v128 = v115 - 8;
        v129 = (uint64_t *)(*((void *)v115 - 1) + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
        uint64_t v130 = *v129;
        uint64_t v131 = v129[1];
        v132 = (void *)(*((void *)v106 - 1) + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
        BOOL v133 = v130 == *v132 && v131 == v132[1];
        if (v133 || (sub_100029D80() & 1) == 0)
        {
          if (v127 == v115)
          {
            BOOL v22 = v126 >= v115;
            v115 -= 8;
            if (!v22) {
              goto LABEL_174;
            }
          }
          else
          {
            v115 -= 8;
          }
        }
        else
        {
          v128 = v106 - 8;
          if (v127 == v106)
          {
            BOOL v22 = v126 >= v106;
            v106 -= 8;
            if (!v22) {
              goto LABEL_174;
            }
          }
          else
          {
            v106 -= 8;
          }
        }
        *(void *)v126 = *(void *)v128;
LABEL_174:
        if (v105 >= v106) {
          goto LABEL_140;
        }
        v126 -= 8;
        if (__dst >= v115) {
          goto LABEL_140;
        }
        continue;
      }
    }
    if (v108 < -7) {
      goto LABEL_223;
    }
    v114 = __dst;
    if (__dst != v105 || __dst >= v106) {
      memmove(__dst, v105, 8 * v110);
    }
    v115 = &__dst[8 * v110];
    if (v104 < v152 && v108 >= 8)
    {
      while (1)
      {
        v116 = (uint64_t *)(*(void *)v106 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
        uint64_t v117 = *v116;
        uint64_t v118 = v116[1];
        v119 = (void *)(*(void *)v114 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
        BOOL v120 = v117 == *v119 && v118 == v119[1];
        if (v120 || (sub_100029D80() & 1) == 0) {
          break;
        }
        v121 = v106;
        BOOL v20 = v105 == v106;
        v106 += 8;
        if (!v20) {
          goto LABEL_136;
        }
LABEL_137:
        v105 += 8;
        if (v114 >= v115 || (unint64_t)v106 >= v107) {
          goto LABEL_139;
        }
      }
      v121 = v114;
      BOOL v20 = v105 == v114;
      v114 += 8;
      if (v20) {
        goto LABEL_137;
      }
LABEL_136:
      *(void *)v105 = *(void *)v121;
      goto LABEL_137;
    }
LABEL_139:
    v106 = v105;
LABEL_140:
    uint64_t v122 = v115 - v114 + 7;
    if (v115 - v114 >= 0) {
      uint64_t v122 = v115 - v114;
    }
    uint64_t v23 = v148;
    if (v115 - v114 <= -8) {
      goto LABEL_223;
    }
    uint64_t v123 = v122 >> 3;
    uint64_t v25 = v145;
    if (v106 != v114 || v106 >= &v114[8 * v123]) {
      memmove(v106, v114, 8 * v123);
    }
    if (v152 < v151) {
      goto LABEL_194;
    }
    if (v63 > *((void *)v148 + 2)) {
      goto LABEL_195;
    }
    *(void *)v150 = v151;
    id v61 = v147;
    *(void *)&v147[16 * v63 - 8] = v152;
    unint64_t v124 = *((void *)v148 + 2);
    if (v63 >= (uint64_t)v124) {
      goto LABEL_196;
    }
    unint64_t v27 = v124 - 1;
    memmove(v149, v149 + 16, 16 * (v124 - 1 - v63));
    *((void *)v148 + 2) = v124 - 1;
    if (v124 <= 2) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  __break(1u);
LABEL_197:
  __break(1u);
LABEL_198:
  __break(1u);
LABEL_199:
  __break(1u);
LABEL_200:
  __break(1u);
LABEL_201:
  __break(1u);
LABEL_202:
  __break(1u);
LABEL_203:
  __break(1u);
LABEL_204:
  __break(1u);
LABEL_205:
  __break(1u);
LABEL_206:
  __break(1u);
LABEL_207:
  __break(1u);
LABEL_208:
  __break(1u);
LABEL_209:
  __break(1u);
LABEL_210:
  __break(1u);
LABEL_211:
  __break(1u);
LABEL_212:
  __break(1u);
LABEL_213:
  __break(1u);
LABEL_214:
  __break(1u);
LABEL_215:
  __break(1u);
LABEL_216:
  __break(1u);
LABEL_217:
  __break(1u);
LABEL_218:
  __break(1u);
LABEL_219:
  __break(1u);
LABEL_220:
  __break(1u);
LABEL_221:
  __break(1u);
LABEL_222:
  __break(1u);
LABEL_223:
  sub_100029D40();
  __break(1u);
LABEL_224:
  Swift::Int result = sub_100029CF0();
  __break(1u);
  return result;
}

uint64_t sub_100016C84(char *__src, char *a2, unint64_t a3, char *__dst)
{
  Swift::Int v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v32 = __src;
  uint64_t v31 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v21 = &v4[8 * v13];
      uint64_t v30 = v21;
      uint64_t v32 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        BOOL v22 = (char *)(a3 - 8);
        uint64_t v23 = v6;
        while (1)
        {
          Swift::Int v24 = v22 + 8;
          uint64_t v25 = *((void *)v23 - 1);
          v23 -= 8;
          Swift::Int v26 = (void *)(*((void *)v21 - 1) + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
          uint64_t v27 = *(void *)(v25 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name + 8);
          BOOL v28 = *v26 == *(void *)(v25 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name) && v26[1] == v27;
          if (v28 || (sub_100029D80() & 1) == 0)
          {
            uint64_t v30 = v21 - 8;
            if (v24 < v21 || v22 >= v21 || v24 != v21) {
              *(void *)BOOL v22 = *((void *)v21 - 1);
            }
            uint64_t v23 = v6;
            v21 -= 8;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v24 != v6 || v22 >= v6) {
              *(void *)BOOL v22 = *(void *)v23;
            }
            uint64_t v32 = v23;
            if (v23 <= v7) {
              goto LABEL_50;
            }
          }
          v22 -= 8;
          uint64_t v6 = v23;
          if (v21 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    uint64_t v30 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        uint64_t v15 = (uint64_t *)(*(void *)v6 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
        uint64_t v16 = *v15;
        uint64_t v17 = v15[1];
        Swift::Int v18 = (void *)(*(void *)v4 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
        BOOL v19 = v16 == *v18 && v17 == v18[1];
        if (v19 || (sub_100029D80() & 1) == 0)
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          uint64_t v31 = v4;
          BOOL v20 = v6;
        }
        else
        {
          BOOL v20 = v6 + 8;
          if (v7 < v6 || v7 >= v20 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v20;
      }
      while ((unint64_t)v20 < a3);
      uint64_t v32 = v7;
    }
LABEL_50:
    sub_100017054((void **)&v32, (const void **)&v31, &v30);
    return 1;
  }
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

char *sub_100016F58(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002798(&qword_10003BFE0);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100017054(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_100029D40();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_100017110(uint64_t a1)
{
  return sub_100016F58(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100017124(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100029D00();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100029D00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100017FD0(&qword_10003C020, &qword_10003C018);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100002798(&qword_10003C018);
          uint64_t v12 = sub_100026BA4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1000102BC(0, (unint64_t *)&qword_10003C010);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

uint64_t sub_100017344(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100029D00();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100029D00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100017FD0(&qword_10003BFD0, &qword_10003BFC8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100002798(&qword_10003BFC8);
          uint64_t v12 = sub_100026C10(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for HomeItem();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

uint64_t sub_100017554(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ConfigurationModelItem();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 64);
  uint64_t v17 = a4 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 32);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 32);
  Swift::String v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    sub_100018020(*(void *)(v35 + 56) + v29 * v25, (uint64_t)v12);
    sub_100018084((uint64_t)v12, (uint64_t)v15);
    uint64_t result = sub_100018084((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100017820(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

id sub_100017834(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___MediaSetupNavigationController_hostBundleID];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_serviceAccount] = 0;
  *(void *)&v1[OBJC_IVAR___MediaSetupNavigationController_setupSession] = 0;
  uint64_t v4 = &v1[OBJC_IVAR___MediaSetupNavigationController_stepContext];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  uint64_t v5 = &v1[OBJC_IVAR___MediaSetupNavigationController_testFlags];
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  unint64_t v6 = v1;
  sub_100029860();
  v6[OBJC_IVAR___MediaSetupNavigationController_firstVC] = 1;
  v6[OBJC_IVAR___MediaSetupNavigationController_dismissed] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcAddToHome] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcDone] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcLearnMore] = 0;
  *(void *)&v6[OBJC_IVAR___MediaSetupNavigationController_vcSoftwareUpdate] = 0;
  v6[OBJC_IVAR___MediaSetupNavigationController_waiting] = 0;

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for MediaSetupNavigationController();
  return objc_msgSendSuper2(&v8, "initWithRootViewController:", a1);
}

uint64_t sub_1000179A0()
{
  os_log_type_t v0 = sub_100029850();
  os_log_type_t v1 = sub_100029A90();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_100021F44(0xD000000000000027, 0x800000010002C030, &v4);
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return 1;
}

void sub_100017ADC(uint64_t a1, unint64_t a2)
{
  osos_log_t log = sub_100029850();
  os_log_type_t v4 = sub_100029A90();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_100021F44(a1, a2, &v7);
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100017C48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100017CA4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100017CF8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100017D50(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100017DAC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100017DE4(char a1, void *a2)
{
}

uint64_t sub_100017E08()
{
  uint64_t v1 = sub_100029770();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100017ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100029770() - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001537C(a1, a2, v6, v7);
}

uint64_t sub_100017F58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017F68()
{
  return swift_release();
}

uint64_t sub_100017F70(uint64_t a1, uint64_t a2)
{
  return sub_100015760(a1, a2);
}

void sub_100017F78()
{
  sub_100014230(*(void *)(v0 + 16));
}

void sub_100017F80()
{
}

uint64_t sub_100017F88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100017FD0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100010384(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100018020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfigurationModelItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfigurationModelItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_100018108(void *a1, id a2, uint64_t a3, uint64_t a4)
{
  v26._object = a2;
  id v5 = [a2 serviceName];
  uint64_t v6 = sub_100029960();
  uint64_t v8 = v7;

  uint64_t v9 = self;
  swift_bridgeObjectRetain();
  uint64_t v10 = (objc_class *)[v9 mainBundle];
  v26._countAndFlagsBits = 0xE000000000000000;
  v32._object = (void *)0x800000010002C1E0;
  v32._countAndFlagsBits = 0xD000000000000011;
  v35.value._countAndFlagsBits = 0;
  v35.value._object = 0;
  v11.super.Class isa = v10;
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_100029710(v32, v35, v11, v38, v26);

  sub_100002798((uint64_t *)&unk_10003BB40);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10002A710;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = sub_100004708();
  *(void *)(v12 + 32) = v6;
  *(void *)(v12 + 40) = v8;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = (objc_class *)[v9 mainBundle];
  v27._countAndFlagsBits = 0xE000000000000000;
  v33._countAndFlagsBits = 0x5445445F454E4F44;
  v33._object = (void *)0xEB000000004C4941;
  v36.value._countAndFlagsBits = 0;
  v36.value._object = 0;
  v14.super.Class isa = v13;
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_100029710(v33, v36, v14, v39, v27);

  id v15 = a1;
  id v16 = sub_100018518(v15);
  uint64_t v17 = (objc_class *)[v9 mainBundle];
  v28._countAndFlagsBits = 0xE000000000000000;
  v34._countAndFlagsBits = 1162760004;
  v34._object = (void *)0xE400000000000000;
  v37.value._countAndFlagsBits = 0;
  v37.value._object = 0;
  v18.super.Class isa = v17;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_100029710(v34, v37, v18, v40, v28);

  id v19 = sub_100027260(0);
  swift_bridgeObjectRelease();
  [v19 addTarget:v16 action:"requestDismiss" forControlEvents:64];
  id v20 = [v16 buttonTray];
  [v20 addButton:v19];

  id v21 = objc_allocWithZone((Class)type metadata accessor for MainContentView());
  swift_bridgeObjectRetain_n();
  id v22 = v29;
  id v23 = sub_10002790C(1, a3, a4, v22);
  id v24 = [v16 contentView];

  [v24 addSubview:v23];
  sub_1000234D8();

  swift_bridgeObjectRelease_n();
  return v16;
}

id sub_1000184C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DoneViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DoneViewController()
{
  return self;
}

id sub_100018518(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService23SetupBaseViewController_mainController] = a1;
  id v2 = a1;
  NSString v3 = sub_100029950();
  swift_bridgeObjectRelease();
  NSString v4 = sub_100029950();
  swift_bridgeObjectRelease();
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for SetupBaseViewController();
  id v5 = objc_msgSendSuper2(&v9, "initWithTitle:detailText:icon:contentLayout:", v3, v4, 0, 2);

  id v6 = v5;
  [v6 setModalPresentationStyle:2];
  id v7 = [v6 navigationItem];
  [v7 setHidesBackButton:1];

  return v6;
}

id sub_1000186F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupBaseViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SetupBaseViewController()
{
  return self;
}

id sub_10001875C(void *a1, id a2, uint64_t a3, uint64_t a4)
{
  id v4 = [a2 serviceName];
  uint64_t v5 = sub_100029960();
  uint64_t v7 = v6;

  uint64_t v8 = self;
  swift_bridgeObjectRetain_n();
  objc_super v9 = (objc_class *)[v8 mainBundle];
  v39._countAndFlagsBits = 0xD000000000000017;
  v30._countAndFlagsBits = 0xE000000000000000;
  v39._object = (void *)0x800000010002C350;
  v43.value._countAndFlagsBits = 0;
  v43.value._object = 0;
  v10.super.Class isa = v9;
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  sub_100029710(v39, v43, v10, v47, v30);

  sub_100002798((uint64_t *)&unk_10003BB40);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10002A710;
  *(void *)(v11 + 56) = &type metadata for String;
  unint64_t v12 = sub_100004708();
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v7;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v13 = (objc_class *)[v8 mainBundle];
  v31._countAndFlagsBits = 0xE000000000000000;
  v40._object = (void *)0x800000010002C370;
  v40._countAndFlagsBits = 0xD000000000000011;
  v44.value._countAndFlagsBits = 0;
  v44.value._object = 0;
  v14.super.Class isa = v13;
  v48._countAndFlagsBits = 0;
  v48._object = (void *)0xE000000000000000;
  sub_100029710(v40, v44, v14, v48, v31);

  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10002A710;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 64) = v12;
  *(void *)(v15 + 32) = v5;
  *(void *)(v15 + 40) = v7;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v35 = a1;
  id v16 = sub_100018518(v35);
  uint64_t v17 = (objc_class *)[v8 mainBundle];
  v32._countAndFlagsBits = 0xE000000000000000;
  v41._countAndFlagsBits = 0x4F4D5F4E5241454CLL;
  v41._object = (void *)0xEA00000000004552;
  v45.value._countAndFlagsBits = 0;
  v45.value._object = 0;
  v18.super.Class isa = v17;
  v49._countAndFlagsBits = 0;
  v49._object = (void *)0xE000000000000000;
  sub_100029710(v41, v45, v18, v49, v32);

  id v19 = sub_100027260(0);
  swift_bridgeObjectRelease();
  [v19 addTarget:v16 action:"selectLearnMore" forControlEvents:64];
  id v20 = [v16 buttonTray];
  [v20 addButton:v19];

  id v21 = (objc_class *)[v8 mainBundle];
  v33._countAndFlagsBits = 0xE000000000000000;
  v42._countAndFlagsBits = 0x574F4E5F544F4ELL;
  v42._object = (void *)0xE700000000000000;
  v46.value._countAndFlagsBits = 0;
  v46.value._object = 0;
  v22.super.Class isa = v21;
  v50._countAndFlagsBits = 0;
  v50._object = (void *)0xE000000000000000;
  sub_100029710(v42, v46, v22, v50, v33);

  id v23 = sub_100027260(1);
  swift_bridgeObjectRelease();
  [v23 addTarget:v16 action:"requestDismiss" forControlEvents:64];
  id v24 = [v16 buttonTray];
  [v24 addButton:v23];

  id v25 = objc_allocWithZone((Class)type metadata accessor for MainContentView());
  swift_bridgeObjectRetain_n();
  id v26 = a2;
  id v27 = sub_10002790C(1, a3, a4, v26);
  id v28 = [v16 contentView];

  [v28 addSubview:v27];
  sub_1000234D8();

  swift_bridgeObjectRelease_n();
  return v16;
}

id sub_100018C98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LearnMoreViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LearnMoreViewController()
{
  return self;
}

BOOL sub_100018CF0(void *a1)
{
  uint64_t v2 = v1;
  id v48 = a1;
  uint64_t v49 = type metadata accessor for SetupEntitlement(0);
  uint64_t v3 = *(void *)(v49 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002798((uint64_t *)&unk_10003BD30);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100029810();
  uint64_t v52 = *(void *)(v8 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  Swift::String v50 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v44 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v44 - v14;
  uint64_t v47 = v1 + OBJC_IVAR____TtC21MediaSetupViewService16EntitlementProxy_log;
  id v16 = sub_100029850();
  os_log_type_t v17 = sub_100029A90();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v51 = v8;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v45 = v3;
    id v20 = (uint8_t *)v19;
    id v21 = (void *)swift_slowAlloc();
    Swift::String_optional v46 = v15;
    uint64_t v54 = v21;
    Swift::String_optional v44 = v7;
    *(_DWORD *)id v20 = 136315138;
    uint64_t v8 = v51;
    uint64_t v53 = sub_100021F44(0xD000000000000014, 0x800000010002C3F0, (uint64_t *)&v54);
    uint64_t v2 = v1;
    uint64_t v7 = v44;
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v46;
    swift_slowDealloc();
    uint64_t v3 = v45;
    swift_slowDealloc();
  }

  id v22 = [v48 serviceID];
  if (v22)
  {
    id v23 = v22;
    sub_1000297E0();

    uint64_t v24 = v52;
    id v25 = v13;
    id v26 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
    v26(v7, v25, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v7, 1, v8) != 1)
    {
      uint64_t v27 = ((uint64_t (*)(char *, char *, uint64_t))v26)(v15, v7, v8);
      id v28 = *(void **)(v2 + OBJC_IVAR____TtC21MediaSetupViewService16EntitlementProxy_setupEntitlements);
      int64_t v29 = v28[2];
      Swift::String v30 = &_swiftEmptyArrayStorage;
      if (v29)
      {
        Swift::String_optional v46 = v15;
        uint64_t v54 = &_swiftEmptyArrayStorage;
        swift_bridgeObjectRetain();
        sub_100022754(0, v29, 0);
        uint64_t v31 = *(unsigned __int8 *)(v3 + 80);
        id v48 = v28;
        uint64_t v32 = (uint64_t)v28 + ((v31 + 32) & ~v31);
        uint64_t v33 = *(void *)(v3 + 72);
        Swift::String v34 = (void (**)(char *, char *, uint64_t))(v52 + 16);
        id v35 = v50;
        do
        {
          sub_10001A7BC(v32, (uint64_t)v5);
          (*v34)(v35, &v5[*(int *)(v49 + 20)], v8);
          sub_10001A820((uint64_t)v5);
          Swift::String v30 = v54;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_100022754(0, v30[2] + 1, 1);
            Swift::String v30 = v54;
          }
          unint64_t v37 = v30[2];
          unint64_t v36 = v30[3];
          if (v37 >= v36 >> 1)
          {
            sub_100022754(v36 > 1, v37 + 1, 1);
            Swift::String v30 = v54;
          }
          v30[2] = v37 + 1;
          unint64_t v38 = (unint64_t)v30
              + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))
              + *(void *)(v52 + 72) * v37;
          id v35 = v50;
          uint64_t v8 = v51;
          v26((char *)v38, v50, v51);
          uint64_t v54 = v30;
          v32 += v33;
          --v29;
        }
        while (v29);
        uint64_t v27 = swift_bridgeObjectRelease();
        uint64_t v15 = v46;
      }
      __chkstk_darwin(v27);
      *(&v44 - 2) = v15;
      BOOL v42 = sub_100019304((uint64_t (*)(char *))sub_10001A87C, (uint64_t)(&v44 - 4), (uint64_t)v30);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v15, v51);
      swift_bridgeObjectRelease();
      return v42;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v7, 1, 1, v8);
  }
  sub_10001A6E0((uint64_t)v7);
  Swift::String v39 = sub_100029850();
  os_log_type_t v40 = sub_100029AB0();
  if (os_log_type_enabled(v39, v40))
  {
    Swift::String v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "### Context missing service ID", v41, 2u);
    swift_slowDealloc();
  }

  return 0;
}

BOOL sub_100019304(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v37 = a1;
  uint64_t v38 = sub_100029810();
  uint64_t v6 = *(void *)(v38 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin();
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a3 + 16);
  if (v11)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v12 = v6 + 16;
    unint64_t v36 = v13;
    uint64_t v14 = a3 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v15 = *(void *)(v12 + 56);
    uint64_t v33 = v8;
    Swift::String v34 = (uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32);
    uint64_t v30 = v15;
    uint64_t v31 = (void (**)(char *))(v12 + 16);
    uint64_t v32 = (void (**)(char *, uint64_t))(v12 - 8);
    v28[2] = a3;
    swift_bridgeObjectRetain();
    id v35 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 40);
    v28[1] = (v12 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      uint64_t v16 = v38;
      uint64_t v17 = v12;
      v36(v10, v14, v38);
      BOOL v18 = *v35;
      (*v35)(v10, 0, 1, v16);
      int v19 = (*v34)(v10, 1, v16);
      BOOL v20 = v19 != 1;
      if (v19 == 1) {
        break;
      }
      int64_t v29 = v18;
      id v21 = v10;
      id v22 = v33;
      id v23 = v21;
      (*v31)(v33);
      char v24 = v37(v22);
      if (v4)
      {
        (*v32)(v22, v16);
        swift_bridgeObjectRelease();
        return v20;
      }
      char v25 = v24;
      (*v32)(v22, v16);
      if (v25) {
        break;
      }
      v14 += v30;
      --v11;
      uint64_t v4 = 0;
      uint64_t v12 = v17;
      uint64_t v10 = v23;
      if (!v11)
      {
        v29(v23, 1, 1, v38);
        goto LABEL_9;
      }
    }
  }
  else
  {
    id v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v26(v10, 1, 1, v38);
LABEL_9:
    BOOL v20 = 0;
  }
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_1000195E4()
{
  uint64_t result = sub_100029960();
  qword_10003C0B0 = result;
  *(void *)algn_10003C0B8 = v1;
  return result;
}

uint64_t sub_100019614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100029810();
  uint64_t v53 = *(void (***)(char *, char *, uint64_t))(v13 - 8);
  __chkstk_darwin(v13);
  unint64_t v60 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for SetupEntitlement(0);
  uint64_t v59 = *(void *)(v61 - 8);
  uint64_t v15 = __chkstk_darwin(v61);
  uint64_t v17 = (char *)v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v58 = (void *)((char *)v49 - v19);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v57 = (uint64_t)v49 - v21;
  __chkstk_darwin(v20);
  uint64_t v56 = (uint64_t)v49 - v22;
  uint64_t v23 = v5 + OBJC_IVAR____TtC21MediaSetupViewService16EntitlementProxy_log;
  sub_100029860();
  uint64_t v24 = OBJC_IVAR____TtC21MediaSetupViewService16EntitlementProxy_setupEntitlements;
  *(void *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService16EntitlementProxy_setupEntitlements) = &_swiftEmptyArrayStorage;
  uint64_t v25 = *((void *)sub_100019C0C(a1, a2, a3, a4) + 2);
  if (v25)
  {
    v49[1] = v23;
    uint64_t v50 = v24;
    uint64_t v51 = v5;
    id v26 = (unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 6);
    v53 += 4;
    v49[0] = swift_bridgeObjectRetain();
    uint64_t v27 = (uint64_t *)(v49[0] + 40);
    id v28 = &_swiftEmptyArrayStorage;
    uint64_t v54 = v26;
    uint64_t v55 = v12;
    uint64_t v52 = v17;
    do
    {
      uint64_t v30 = *(v27 - 1);
      uint64_t v29 = *v27;
      swift_bridgeObjectRetain();
      sub_1000297B0();
      if ((*v26)(v12, 1, v13) == 1)
      {
        swift_bridgeObjectRelease();
        sub_10001A6E0((uint64_t)v12);
      }
      else
      {
        uint64_t v31 = *v53;
        uint64_t v32 = v60;
        (*v53)(v60, v12, v13);
        uint64_t v33 = (uint64_t)v58;
        *uint64_t v58 = v30;
        *(void *)(v33 + 8) = v29;
        v31((char *)(v33 + *(int *)(v61 + 20)), v32, v13);
        uint64_t v34 = (uint64_t)v52;
        uint64_t v35 = v57;
        sub_10001A93C(v33, v57);
        uint64_t v36 = v35;
        uint64_t v37 = v56;
        sub_10001A93C(v36, v56);
        sub_10001A93C(v37, v34);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v28 = (void *)sub_10000E9A8(0, v28[2] + 1, 1, (unint64_t)v28);
        }
        unint64_t v39 = v28[2];
        unint64_t v38 = v28[3];
        id v26 = v54;
        uint64_t v12 = v55;
        if (v39 >= v38 >> 1) {
          id v28 = (void *)sub_10000E9A8(v38 > 1, v39 + 1, 1, (unint64_t)v28);
        }
        v28[2] = v39 + 1;
        sub_10001A93C(v34, (uint64_t)v28+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v39);
      }
      v27 += 2;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease_n();
    uint64_t v5 = v51;
    *(void *)(v51 + v50) = v28;
    swift_bridgeObjectRelease();
    swift_retain_n();
    os_log_type_t v40 = sub_100029850();
    os_log_type_t v41 = sub_100029A90();
    if (!os_log_type_enabled(v40, v41))
    {
      swift_release_n();
      goto LABEL_17;
    }
    BOOL v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    *(_DWORD *)BOOL v42 = 136380675;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_100029A20();
    unint64_t v45 = v44;
    uint64_t v5 = v51;
    swift_bridgeObjectRelease();
    uint64_t v62 = sub_100021F44(v43, v45, &v63);
    sub_100029B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Found entitlements: %{private}s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  os_log_type_t v40 = sub_100029850();
  os_log_type_t v46 = sub_100029AB0();
  if (os_log_type_enabled(v40, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v46, "### Unable to fetch entitlements for token", v47, 2u);
LABEL_15:
    swift_slowDealloc();
  }
LABEL_17:

  return v5;
}

void *sub_100019C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)token.val = a1;
  *(void *)&token.val[2] = a2;
  *(void *)&token.val[4] = a3;
  *(void *)&token.val[6] = a4;
  SecTaskRef v4 = SecTaskCreateWithAuditToken(0, &token);
  if (!v4)
  {
    uint64_t v5 = sub_100029850();
    os_log_type_t v9 = sub_100029AB0();
    if (os_log_type_enabled(v5, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v9, "### Failed to create sec task?", v10, 2u);
      swift_slowDealloc();
    }
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  if (qword_10003BA20 != -1) {
    swift_once();
  }
  uint64_t v6 = (__CFString *)sub_100029950();
  CFTypeRef v7 = SecTaskCopyValueForEntitlement((SecTaskRef)v5, v6, 0);

  if (!v7)
  {
    uint64_t v11 = sub_100029850();
    uint64_t v12 = sub_100029AB0();
    if (os_log_type_enabled(v11, (os_log_type_t)v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v12, "### No values for entitlement?", v13, 2u);
      swift_slowDealloc();
    }

LABEL_12:
    return &_swiftEmptyArrayStorage;
  }
  *(void *)token.val = v7;
  swift_unknownObjectRetain();
  sub_100002798(&qword_10003BDC0);
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();

    return (void *)v17;
  }
  uint64_t v14 = sub_100029850();
  os_log_type_t v15 = sub_100029AB0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "### Can't cast as RawEntitlementValue...)", v16, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100019EA8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21MediaSetupViewService16EntitlementProxy_log;
  uint64_t v2 = sub_100029870();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100019F58()
{
  return type metadata accessor for EntitlementProxy(0);
}

uint64_t type metadata accessor for EntitlementProxy(uint64_t a1)
{
  return sub_10001A558(a1, qword_10003C0F0);
}

uint64_t sub_100019F80()
{
  uint64_t result = sub_100029870();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_10001A01C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    CFTypeRef v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100029810();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_10001A104(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100029810();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10001A17C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  CFTypeRef v7 = (char *)a2 + v5;
  uint64_t v8 = sub_100029810();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_10001A214(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  CFTypeRef v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100029810();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_10001A2B0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100029810();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_10001A32C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100029810();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_10001A3B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A3CC);
}

uint64_t sub_10001A3CC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100029810();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001A47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A490);
}

uint64_t sub_10001A490(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100029810();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SetupEntitlement(uint64_t a1)
{
  return sub_10001A558(a1, qword_10003C1D8);
}

uint64_t sub_10001A558(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001A590()
{
  uint64_t result = sub_100029810();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10001A628()
{
  type metadata accessor for SetupEntitlement(0);
  sub_100029810();
  sub_10001A8F8((unint64_t *)&qword_10003BD50);
  v1._countAndFlagsBits = sub_100029D70();
  sub_1000299C0(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 62;
  v2._object = (void *)0xE100000000000000;
  sub_1000299C0(v2);
  return 0x656369767265733CLL;
}

uint64_t sub_10001A6E0(uint64_t a1)
{
  uint64_t v2 = sub_100002798((uint64_t *)&unk_10003BD30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A740()
{
  return sub_100029940() & 1;
}

uint64_t sub_10001A7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetupEntitlement(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A820(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SetupEntitlement(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A87C()
{
  return sub_100029940() & 1;
}

uint64_t sub_10001A8F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100029810();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001A93C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SetupEntitlement(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A9A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029810();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 8);
  if (!v6)
  {
    uint64_t v10 = (void *)0xE600000000000000;
    uint64_t v8 = 0x29656E6F6E28;
    uint64_t v11 = *(void **)v1;
    if (*(void *)v1) {
      goto LABEL_3;
    }
LABEL_5:
    os_log_type_t v15 = (void *)0xE100000000000000;
    uint64_t v13 = 63;
    goto LABEL_6;
  }
  id v7 = [v6 serviceName];
  uint64_t v8 = sub_100029960();
  uint64_t v10 = v9;

  uint64_t v11 = *(void **)v1;
  if (!*(void *)v1) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [v11 uniqueIdentifier];
  sub_1000297E0();

  uint64_t v13 = sub_1000297C0();
  os_log_type_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_6:
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_100029C50(39);
  swift_bridgeObjectRelease();
  uint64_t v17 = 0x3D4449726573753CLL;
  unint64_t v18 = 0xE800000000000000;
  type metadata accessor for ConfigurationModelItem();
  sub_10001AC28();
  v19._countAndFlagsBits = sub_100029D70();
  sub_1000299C0(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0x4449656D6F68202CLL;
  v20._object = (void *)0xE90000000000003DLL;
  sub_1000299C0(v20);
  v21._countAndFlagsBits = v13;
  v21._object = v15;
  sub_1000299C0(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0x636976726573202CLL;
  v22._object = (void *)0xEF3D20656D614E65;
  sub_1000299C0(v22);
  v23._countAndFlagsBits = v8;
  v23._object = v10;
  sub_1000299C0(v23);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 62;
  v24._object = (void *)0xE100000000000000;
  sub_1000299C0(v24);
  return v17;
}

uint64_t type metadata accessor for ConfigurationModelItem()
{
  uint64_t result = qword_10003C288;
  if (!qword_10003C288) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10001AC28()
{
  unint64_t result = qword_10003BD50;
  if (!qword_10003BD50)
  {
    sub_100029810();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003BD50);
  }
  return result;
}

char *sub_10001AC84(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    uint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_100029810();
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    uint64_t v14 = v4;
    os_log_type_t v15 = v8;
    v13(v10, v11, v12);
    v7[*(int *)(a3 + 28)] = *((unsigned char *)a2 + *(int *)(a3 + 28));
  }
  return v7;
}

uint64_t sub_10001AD8C(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100029810();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10001AE0C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  id v7 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100029810();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v6;
  id v14 = v7;
  v12(v9, v10, v11);
  *((unsigned char *)a1 + *(int *)(a3 + 28)) = *(unsigned char *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10001AEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  id v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v10;
  id v11 = v10;

  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100029810();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(unsigned char *)(a1 + *(int *)(a3 + 28)) = *(unsigned char *)(a2 + *(int *)(a3 + 28));
  return a1;
}

_OWORD *sub_10001AF78(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 24);
  id v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100029810();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10001B010(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  id v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_100029810();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(unsigned char *)(a1 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10001B0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B0D4);
}

uint64_t sub_10001B0D4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = sub_100029810();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10001B190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B1A4);
}

void *sub_10001B1A4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_100029810();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10001B24C()
{
  uint64_t result = sub_100029810();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for ConfigurationModel(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s21MediaSetupViewService18ConfigurationModelVwCP_0(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConfigurationModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ConfigurationModel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ConfigurationModel(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfigurationModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConfigurationModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ConfigurationModel()
{
  return &type metadata for ConfigurationModel;
}

int64_t sub_10001B4C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ConfigurationModelItem();
  uint64_t v69 = *(void *)(v8 - 8);
  __chkstk_darwin(v8 - 8);
  uint64_t v68 = (uint64_t)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100029810();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v61 - v15;
  if (!a1)
  {
    if (qword_10003BA28 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100029870();
    sub_100010854(v18, (uint64_t)qword_10003C2C8);
    Swift::String v19 = sub_100029850();
    os_log_type_t v20 = sub_100029AB0();
    if (os_log_type_enabled(v19, v20))
    {
      Swift::String v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "### Home topology with no context?", v21, 2u);
      swift_slowDealloc();
    }

    goto LABEL_9;
  }
  if (a4) {
    return sub_10001DF38(a2, a4);
  }
  unint64_t v79 = (unint64_t)&_swiftEmptyArrayStorage;
  unint64_t v22 = (unint64_t)sub_10001D640();
  if (v22 >> 62) {
    uint64_t v23 = sub_100029D00();
  }
  else {
    uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v23)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    if (qword_10003BA58 != -1) {
      swift_once();
    }
    return swift_bridgeObjectRetain();
  }
  unint64_t v24 = (unint64_t)sub_10001D640();
  unint64_t v26 = v24;
  if (v24 >> 62)
  {
    int64_t result = sub_100029D00();
    if (result) {
      goto LABEL_17;
    }
LABEL_45:
    swift_bridgeObjectRelease();
    if ((unint64_t)sub_10001D640() >> 62) {
      sub_100029D00();
    }
    swift_bridgeObjectRelease();
    return v79;
  }
  int64_t result = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_45;
  }
LABEL_17:
  if (result >= 1)
  {
    uint64_t v27 = 0;
    uint64_t v71 = (void (**)(uint64_t, char *, uint64_t))(v11 + 32);
    unint64_t v72 = v26 & 0xC000000000000001;
    uint64_t v63 = &v78;
    uint64_t v70 = (void (**)(char *, uint64_t))(v11 + 8);
    id v28 = &off_10003A000;
    *(void *)&long long v25 = 136380675;
    long long v62 = v25;
    v61[1] = (char *)&type metadata for Any + 8;
    int64_t v73 = result;
    uint64_t v66 = v10;
    uint64_t v67 = a3;
    unint64_t v64 = v26;
    uint64_t v65 = v16;
    while (1)
    {
      id v29 = v72 ? (id)sub_100029C70() : *(id *)(v26 + 8 * v27 + 32);
      uint64_t v30 = v29;
      id v31 = [v29 currentUser];
      id v32 = [v31 v28[209]];

      sub_1000297E0();
      uint64_t v33 = *(void *)(a3 + 16);
      uint64_t v74 = v27;
      if (!v33) {
        goto LABEL_25;
      }
      unint64_t v34 = sub_100015E94((uint64_t)v16);
      if (v35)
      {
        uint64_t v36 = v68;
        sub_100018020(*(void *)(a3 + 56) + *(void *)(v69 + 72) * v34, v68);
        uint64_t v37 = *(void **)(v36 + 8);
        id v38 = v37;
        sub_10001EAE4(v36);
      }
      else
      {
LABEL_25:
        uint64_t v37 = 0;
      }
      id v75 = v37;
      id v39 = [v30 v28[209]];
      sub_1000297E0();

      id v40 = [v30 name];
      uint64_t v41 = sub_100029960();
      uint64_t v43 = v42;

      type metadata accessor for HomeItem();
      unint64_t v44 = v30;
      uint64_t v45 = swift_allocObject();
      uint64_t v46 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service;
      *(void *)(v45 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service) = 0;
      *(unsigned char *)(v45 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) = 0;
      uint64_t v47 = *(void **)(v45 + v46);
      *(void *)(v45 + v46) = v37;

      (*v71)(v45 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v14, v10);
      id v48 = (uint64_t *)(v45 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
      *id v48 = v41;
      v48[1] = v43;
      *(_WORD *)(v45 + 16) = 0;
      unsigned int v49 = [v44 hasAccessoryTypeHomePod];
      id v76 = v44;
      if (v49)
      {
        if (![v44 isUpdatedForBolt]) {
          break;
        }
      }
      if (([v44 hasAccessoryTypeHomePod] & 1) == 0)
      {
        char v50 = 1;
LABEL_31:
        *(unsigned char *)(v45 + 16) = v50;
      }
      if (qword_10003BA28 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_100029870();
      sub_100010854(v51, (uint64_t)qword_10003C2C8);
      swift_retain_n();
      uint64_t v52 = sub_100029850();
      os_log_type_t v53 = sub_100029A90();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        uint64_t v78 = swift_slowAlloc();
        *(_DWORD *)uint64_t v54 = v62;
        swift_retain();
        uint64_t v55 = sub_1000247D8();
        unint64_t v57 = v56;
        swift_release();
        uint64_t v77 = sub_100021F44(v55, v57, &v78);
        unint64_t v26 = v64;
        sub_100029B90();
        swift_release_n();
        uint64_t v16 = v65;
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "Home topology adding item %{private}s", v54, 0xCu);
        swift_arrayDestroy();
        a3 = v67;
        swift_slowDealloc();
        uint64_t v10 = v66;
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      uint64_t v58 = v74;
      swift_retain();
      sub_1000299F0();
      int64_t v59 = v73;
      if (*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100029A40();
      }
      uint64_t v27 = v58 + 1;
      sub_100029A60();
      sub_100029A30();

      swift_release();
      (*v70)(v16, v10);
      BOOL v60 = v59 == v27;
      id v28 = &off_10003A000;
      if (v60) {
        goto LABEL_45;
      }
    }
    char v50 = 2;
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001BC8C()
{
  uint64_t v0 = sub_100029870();
  sub_10001EBFC(v0, qword_10003C2C8);
  sub_100010854(v0, (uint64_t)qword_10003C2C8);
  return sub_100029860();
}

void sub_10001BD10(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_100029810();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  __chkstk_darwin(v4);
  unint64_t v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100029770();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002798(&qword_10003BFE8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v33 - v17;
  id v19 = [a1 authorizationScope];
  [v2 setAuthorizationScope:v19];

  id v20 = [a1 authorizationTokenURL];
  if (v20)
  {
    sub_100029750();

    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v12, v9);
    Swift::String v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v21(v18, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v18, 1, v9) == 1)
    {
      id v20 = 0;
    }
    else
    {
      sub_100029740(v22);
      id v20 = v23;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    }
  }
  else
  {
    Swift::String v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v21(v18, 1, 1, v9);
  }
  [v2 setAuthorizationTokenURL:v20];

  id v24 = [a1 clientID];
  [v2 setClientID:v24];

  id v25 = [a1 clientSecret];
  [v2 setClientSecret:v25];

  id v26 = [a1 configurationURL];
  if (v26)
  {
    sub_100029750();

    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v12, v9);
    v21(v16, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v16, 1, v9) == 1)
    {
      id v26 = 0;
    }
    else
    {
      sub_100029740(v27);
      id v26 = v28;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    }
  }
  else
  {
    v21(v16, 1, 1, v9);
  }
  uint64_t v29 = v35;
  [v2 setConfigurationURL:v26];

  Class isa = (Class)[a1 serviceID];
  uint64_t v31 = v36;
  if (isa)
  {
    id v32 = v34;
    sub_1000297E0();

    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v8, v32, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v8, 0, 1, v31);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v8, 1, v31) == 1)
    {
      Class isa = 0;
    }
    else
    {
      Class isa = sub_1000297D0().super.isa;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v31);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v8, 1, 1, v36);
  }
  [v2 setServiceID:isa];
}

uint64_t sub_10001C2B0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100029D00();
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
  uint64_t v15 = sub_100029D00();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v1 = v6;
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
    uint64_t v9 = sub_100029C80();
    swift_bridgeObjectRelease();
    *unint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100017124(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100029D00();
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

  return sub_100029A30();
}

uint64_t sub_10001C47C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ConfigurationModelItem();
  uint64_t v49 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100029810();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_100002798(&qword_10003C2E0);
  int v50 = a2;
  uint64_t v12 = v11;
  uint64_t v13 = sub_100029D20();
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_41;
  }
  uint64_t v53 = v7;
  uint64_t v15 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 64);
  uint64_t v46 = (void *)(v12 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  unint64_t v44 = v2;
  int64_t v45 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v19 = v13 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  uint64_t v48 = v12;
  uint64_t v51 = v10;
  while (1)
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    id v26 = v46;
    unint64_t v27 = v46[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v18 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
    uint64_t v10 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v12 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v10, v31, v53);
      uint64_t v32 = *(void *)(v12 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_100018084(v32 + v33 * v24, v54);
    }
    else
    {
      (*v47)(v10, v31, v53);
      uint64_t v34 = *(void *)(v12 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_100018020(v34 + v33 * v24, v54);
    }
    sub_10001EBA4();
    uint64_t result = sub_100029920();
    uint64_t v35 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v10 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      uint64_t v10 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v19 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v14 + 48) + v30 * v22), (unint64_t)v10, v53);
    uint64_t result = sub_100018084(v54, *(void *)(v14 + 56) + v33 * v22);
    ++*(void *)(v14 + 16);
    uint64_t v12 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  id v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v12 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v42;
  }
  *(void *)(v12 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v14;
  return result;
}

uint64_t sub_10001C934(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_100029810();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100015E94(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_10001CBF8();
      goto LABEL_7;
    }
    sub_10001C47C(v17, a3 & 1);
    unint64_t v24 = sub_100015E94(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      id v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_10001CB1C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_100029DA0();
    __break(1u);
    return result;
  }
LABEL_7:
  id v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21 + *(void *)(*(void *)(type metadata accessor for ConfigurationModelItem() - 8) + 72) * v14;

  return sub_10001EB40(a1, v22);
}

uint64_t sub_10001CB1C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_100029810();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for ConfigurationModelItem();
  uint64_t result = sub_100018084(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_10001CBF8()
{
  uint64_t v1 = type metadata accessor for ConfigurationModelItem();
  uint64_t v29 = *(void *)(v1 - 8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002798(&qword_10003C2E0);
  unint64_t v24 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_100029D10();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *unint64_t v24 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v25 = v8 + 64;
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v27 = v5 + 32;
  uint64_t v28 = v5 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v13);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v5 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v19, v4);
    unint64_t v20 = *(void *)(v29 + 72) * v18;
    sub_100018020(*(void *)(v8 + 56) + v20, (uint64_t)v3);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v19, v7, v4);
    uint64_t result = (void *)sub_100018084((uint64_t)v3, *(void *)(v10 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_10001CF10(uint64_t a1)
{
  NSString v3 = sub_100029950();
  swift_bridgeObjectRelease();
  id v8 = 0;
  id v4 = [v1 initWithServiceAccount:a1 bundleIdentifier:v3 error:&v8];

  if (v4)
  {
    id v5 = v8;
  }
  else
  {
    id v6 = v8;
    sub_100029730();

    swift_willThrow();
  }
  return v4;
}

void sub_10001CFF4(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ConfigurationModelItem();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  BOOL v60 = (char *)&v50 - v8;
  uint64_t v9 = sub_100029810();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 2) != 0) {
    return;
  }
  if ((a1 & 4) == 0)
  {
    if ((a1 & 8) != 0)
    {
      int64_t v59 = a1;
      uint64_t v16 = v4;
      uint64_t v17 = qword_10003BA50;
      uint64_t v58 = a2;
      if (v17 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_100010854(v9, (uint64_t)qword_10003D648);
      unint64_t v19 = v60;
      uint64_t v20 = v10;
      int64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
      v21(&v60[*(int *)(v16 + 24)], v18, v9);
      *unint64_t v19 = 0;
      v19[1] = 0;
      *((unsigned char *)v19 + *(int *)(v16 + 28)) = 1;
      v21(v12, v18, v9);
      sub_100018020((uint64_t)v19, (uint64_t)v7);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v61 = (uint64_t)&_swiftEmptyDictionarySingleton;
      sub_10001C934((uint64_t)v7, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v12, v9);

      sub_10001EAE4((uint64_t)v19);
    }
    return;
  }
  uint64_t v55 = v4;
  unint64_t v56 = v7;
  uint64_t v57 = v10;
  uint64_t v58 = v12;
  int64_t v59 = a2;
  id v23 = a2;
  id v24 = [v23 accountName];
  uint64_t v25 = sub_100029960();
  uint64_t v27 = v26;

  uint64_t v61 = 0x726568746FLL;
  unint64_t v62 = 0xE500000000000000;
  v63._countAndFlagsBits = v25;
  v63._object = v27;
  sub_1000299C0(v63);
  swift_bridgeObjectRelease();
  id v28 = [v23 serviceName];
  sub_100029960();

  id v29 = objc_allocWithZone((Class)MSServiceAccount);
  NSString v30 = sub_100029950();
  unint64_t v31 = v23;
  swift_bridgeObjectRelease();
  NSString v32 = sub_100029950();
  swift_bridgeObjectRelease();
  id v33 = [v29 initWithServiceName:v30 accountName:v32];

  sub_10001BD10(v23);
  id v34 = objc_allocWithZone((Class)MediaService);
  id v35 = v33;
  id v36 = sub_10001CF10((uint64_t)v35);

  uint64_t v38 = v57;
  unint64_t v37 = v58;
  if (!v36)
  {

    return;
  }
  id v39 = [v31 serviceID];
  if (!v39)
  {
    id v54 = v31;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v15, 1, 1, v9);
    goto LABEL_16;
  }
  BOOL v40 = v39;
  id v54 = v31;
  sub_1000297E0();

  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v15, v37, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v15, 0, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v15, 1, v9) == 1)
  {
LABEL_16:

    __break(1u);
    return;
  }
  id v52 = v35;
  Class isa = sub_1000297D0().super.isa;
  uint64_t v51 = *(void (**)(char *, uint64_t))(v38 + 8);
  v51(v15, v9);
  [v36 setServiceID:isa];

  uint64_t v42 = qword_10003BA50;
  id v53 = v36;
  if (v42 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_100010854(v9, (uint64_t)qword_10003D648);
  uint64_t v44 = v55;
  int64_t v45 = v60;
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
  v46(&v60[*(int *)(v55 + 24)], v43, v9);
  *int64_t v45 = 0;
  v45[1] = v36;
  *((unsigned char *)v45 + *(int *)(v44 + 28)) = 0;
  uint64_t v47 = (uint64_t)v58;
  v46(v58, v43, v9);
  uint64_t v48 = (uint64_t)v56;
  sub_100018020((uint64_t)v45, (uint64_t)v56);
  char v49 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v61 = (uint64_t)&_swiftEmptyDictionarySingleton;
  sub_10001C934(v48, v47, v49);
  swift_bridgeObjectRelease();
  v51((char *)v47, v9);

  sub_10001EAE4((uint64_t)v45);
}

void *sub_10001D640()
{
  uint64_t v0 = type metadata accessor for ConfigurationModelItem();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0 - 8);
  NSString v3 = (id *)((char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_100015C48(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = &_swiftEmptyArrayStorage;
  unint64_t v14 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v7 = *((void *)v5 + 2);
  if (v7)
  {
    uint64_t v8 = (uint64_t)&v5[(*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)];
    uint64_t v9 = *(void *)(v1 + 72);
    swift_retain();
    do
    {
      sub_100018020(v8, (uint64_t)v3);
      id v10 = *v3;
      id v11 = *v3;
      sub_10001EAE4((uint64_t)v3);
      if (v10)
      {
        sub_1000299F0();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100029A40();
        }
        sub_100029A60();
        sub_100029A30();
      }
      v8 += v9;
      --v7;
    }
    while (v7);
    swift_release();
    uint64_t v6 = (void *)v14;
  }
  swift_release();
  return v6;
}

BOOL sub_10001D7C8(uint64_t a1, uint64_t a2)
{
  if ((a2 & 2) != 0) {
    return 1;
  }
  if (a2) {
    return 0;
  }
  uint64_t v5 = (uint64_t)sub_10001D640();
  uint64_t v6 = v5;
  uint64_t v25 = &_swiftEmptyArrayStorage;
  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v2 = v5;
    }
    else {
      uint64_t v2 = (v5 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100029D00();
    if (v7) {
      goto LABEL_7;
    }
LABEL_18:
    swift_bridgeObjectRelease_n();
    uint64_t v6 = (uint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_18;
  }
LABEL_7:
  if (v7 < 1)
  {
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  NSString v3 = 0;
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v8 = (id)sub_100029C70();
    }
    else {
      id v8 = *(id *)(v6 + 8 * (void)v3 + 32);
    }
    uint64_t v9 = v8;
    ++v3;
    id v10 = [v8 accessories];
    sub_10001EC60();
    unint64_t v11 = sub_100029A10();

    uint64_t v2 = &v25;
    sub_10001C2B0(v11);
  }
  while ((uint8_t *)v7 != v3);
  swift_bridgeObjectRelease_n();
  uint64_t v6 = (uint64_t)v25;
LABEL_19:
  uint64_t v25 = &_swiftEmptyArrayStorage;
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0) {
      uint64_t v2 = v6;
    }
    else {
      uint64_t v2 = (v6 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100029D00();
    swift_bridgeObjectRelease();
    if (v7)
    {
LABEL_21:
      if (v7 >= 1)
      {
        uint64_t v12 = 0;
        while (1)
        {
          id v13 = *(id *)(v6 + 8 * v12 + 32);
          id v14 = [v13 category];
          id v15 = [v14 categoryType];

          uint64_t v16 = sub_100029960();
          uint64_t v18 = v17;

          if (v16 == sub_100029960() && v18 == v19)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v21 = sub_100029D80();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v21 & 1) == 0)
            {

              goto LABEL_25;
            }
          }
          sub_100029CA0();
          sub_100029CD0();
          sub_100029CE0();
          sub_100029CB0();
LABEL_25:
          if (v7 == ++v12)
          {
            swift_bridgeObjectRelease();
            uint64_t v6 = (uint64_t)v25;
            goto LABEL_38;
          }
        }
      }
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t)&_swiftEmptyArrayStorage;
LABEL_38:
  if (qword_10003BA28 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_100029870();
  sub_100010854(v22, (uint64_t)qword_10003C2C8);
  swift_retain_n();
  uint64_t v2 = sub_100029850();
  LOBYTE(v7) = sub_100029A90();
  if (os_log_type_enabled(v2, (os_log_type_t)v7))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)NSString v3 = 134283521;
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v23 = *(void *)(v6 + 16);
LABEL_44:
      swift_release();
      uint64_t v25 = (void *)v23;
      sub_100029B90();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v2, (os_log_type_t)v7, "%{private}ld HomePods", v3, 0xCu);
      swift_slowDealloc();

      goto LABEL_46;
    }
LABEL_53:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100029D00();
    swift_release();
    goto LABEL_44;
  }

  swift_release_n();
LABEL_46:
  if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_100029D00();
    swift_release();
  }
  else
  {
    uint64_t v24 = *(void *)(v6 + 16);
  }
  swift_release();
  return v24 == 0;
}

void sub_10001DC0C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for ConfigurationModelItem();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8 - 8);
  uint64_t v12 = (id *)((char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  id v14 = (char *)&v48 - v13;
  if (!*(void *)(a3 + 16) || (unint64_t v15 = sub_100015E94(a2), (v16 & 1) == 0))
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    char v30 = 0;
    uint64_t v18 = 0;
LABEL_10:
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    goto LABEL_11;
  }
  uint64_t v17 = *(void *)(v9 + 72);
  sub_100018020(*(void *)(a3 + 56) + v17 * v15, (uint64_t)v14);
  uint64_t v18 = (void *)*((void *)v14 + 1);
  id v19 = v18;
  sub_10001EAE4((uint64_t)v14);
  if (!v18)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    char v30 = 0;
    goto LABEL_10;
  }
  uint64_t v49 = v17;
  id v51 = a1;
  id v20 = [a1 accountName];
  uint64_t v21 = sub_100029960();
  uint64_t v23 = v22;

  id v50 = v19;
  id v24 = [v19 accountName];
  uint64_t v25 = sub_100029960();
  uint64_t v27 = v26;

  if (v21 == v25 && v23 == v27)
  {
    swift_bridgeObjectRelease_n();
    char v30 = 0;
  }
  else
  {
    char v29 = sub_100029D80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v30 = v29 ^ 1;
  }
  id v35 = v50;
  if (*(void *)(a3 + 16)
    && (unint64_t v36 = sub_100015E94(a2), (v37 & 1) != 0)
    && (sub_100018020(*(void *)(a3 + 56) + v36 * v49, (uint64_t)v12),
        id v38 = *v12,
        id v39 = *v12,
        sub_10001EAE4((uint64_t)v12),
        v38))
  {
    BOOL v40 = (objc_class *)[v39 name];

    uint64_t v41 = sub_100029960();
  }
  else
  {
    BOOL v40 = (objc_class *)[self mainBundle];
    v47._countAndFlagsBits = 0xE000000000000000;
    v52._object = (void *)0x800000010002C410;
    v52._countAndFlagsBits = 0xD00000000000001ALL;
    v53.value._countAndFlagsBits = 0;
    v53.value._object = 0;
    v43.super.Class isa = v40;
    v54._countAndFlagsBits = 0;
    v54._object = (void *)0xE000000000000000;
    uint64_t v41 = sub_100029710(v52, v53, v43, v54, v47);
  }
  uint64_t v31 = v41;
  uint64_t v32 = v42;

  id v44 = v35;
  id v45 = [v51 accountName];
  uint64_t v33 = sub_100029960();
  uint64_t v34 = v46;

LABEL_11:
  *(void *)a4 = v31;
  *(void *)(a4 + 8) = v32;
  *(unsigned char *)(a4 + 16) = v30 & 1;
  *(void *)(a4 + 24) = v18;
  *(void *)(a4 + 32) = v33;
  *(void *)(a4 + 40) = v34;
}

unint64_t sub_10001DF38(void *a1, char a2)
{
  uint64_t v4 = sub_100029870();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BA58 != -1) {
    swift_once();
  }
  unint64_t v8 = qword_10003D660;
  unint64_t v33 = qword_10003D660;
  char v34 = byte_10003D668;
  if ((a2 & 2) != 0)
  {
    unint64_t v8 = (unint64_t)&_swiftEmptyArrayStorage;
    unint64_t v33 = (unint64_t)&_swiftEmptyArrayStorage;
    char v34 = 0;
    if ((a2 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  if (a2)
  {
LABEL_7:
    uint64_t v9 = sub_100024388((uint64_t)&off_100034FA0);
    swift_bridgeObjectRelease();
    unint64_t v33 = (unint64_t)v9;
    char v34 = 1;
    unint64_t v8 = (unint64_t)v9;
  }
LABEL_8:
  if ((a2 & 0x10) != 0)
  {
    uint64_t v10 = sub_100024388((uint64_t)&off_100034FC8);
    swift_bridgeObjectRelease();
    unint64_t v33 = (unint64_t)v10;
    char v34 = 2;
    unint64_t v8 = (unint64_t)v10;
    if ((a2 & 0x40) == 0) {
      goto LABEL_26;
    }
LABEL_12:
    if (!a1) {
      goto LABEL_26;
    }
    uint64_t v30 = v5;
    uint64_t v31 = v4;
    char v29 = v7;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain_n();
      id v22 = a1;
      uint64_t v11 = sub_100029D00();
      if (v11) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      id v12 = a1;
      if (v11)
      {
LABEL_15:
        if (v11 < 1) {
          __break(1u);
        }
        for (uint64_t i = 0; i != v11; ++i)
        {
          if ((v8 & 0xC000000000000001) != 0)
          {
            uint64_t v15 = sub_100029C70();
          }
          else
          {
            uint64_t v15 = *(void *)(v8 + 8 * i + 32);
            swift_retain();
          }
          id v16 = objc_allocWithZone((Class)MediaService);
          id v17 = a1;
          NSString v18 = sub_100029950();
          v35[0] = 0;
          id v19 = [v16 initWithServiceAccount:v17 bundleIdentifier:v18 error:v35];

          id v20 = v35[0];
          if (v19)
          {

            uint64_t v21 = *(void **)(v15 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service);
            *(void *)(v15 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service) = v19;
            swift_release();
          }
          else
          {
            id v14 = v20;
            sub_100029730();

            swift_willThrow();
            swift_errorRelease();
            swift_release();
          }
        }
      }
    }
    swift_bridgeObjectRelease_n();

    uint64_t v5 = v30;
    uint64_t v4 = v31;
    uint64_t v7 = v29;
    goto LABEL_26;
  }
  if ((a2 & 0x40) != 0) {
    goto LABEL_12;
  }
LABEL_26:
  if (qword_10003BA28 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_100010854(v4, (uint64_t)qword_10003C2C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
  id v24 = sub_100029850();
  os_log_type_t v25 = sub_100029AA0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    v35[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136380931;
    swift_beginAccess();
    uint64_t v32 = sub_100021F44(*(void *)&aNohomes_0[8 * v34], *(void *)&aMultiple_0[8 * v34 + 8], (uint64_t *)v35);
    sub_100029B90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2049;
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_100029D00();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v27 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v32 = v27;
    sub_100029B90();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Home topology for testing:(%{private}s, %{private}ld home(s))", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_beginAccess();
  return v33;
}

uint64_t sub_10001E4A4(void *a1, unint64_t a2, void *a3)
{
  uint64_t v68 = type metadata accessor for ConfigurationModelItem();
  uint64_t v65 = *(void *)(v68 - 8);
  uint64_t v6 = __chkstk_darwin(v68);
  uint64_t v67 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v66 = (uint64_t)&v55 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (void **)((char *)&v55 - v10);
  uint64_t v12 = sub_100029810();
  uint64_t v59 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v17 = (unint64_t)&v55 - v16;
  if (a2 >> 62) {
    goto LABEL_30;
  }
  uint64_t v18 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v19 = a3;
  uint64_t v55 = a3;
  if (!v18) {
    return (uint64_t)v55;
  }
  while (v18 >= 1)
  {
    uint64_t v21 = 0;
    unint64_t v64 = a2 & 0xC000000000000001;
    int64_t v73 = (void (**)(char *, unint64_t, uint64_t))(v59 + 16);
    id v22 = &_swiftEmptyDictionarySingleton;
    BOOL v60 = (void (**)(char *, uint64_t))(v59 + 8);
    *(void *)&long long v20 = 136380675;
    long long v57 = v20;
    unint64_t v56 = (char *)&type metadata for Any + 8;
    uint64_t v61 = a1;
    unint64_t v62 = a2;
    uint64_t v63 = v18;
    uint64_t v58 = v11;
    unint64_t v71 = v17;
    while (1)
    {
      if (v64) {
        id v25 = (id)sub_100029C70();
      }
      else {
        id v25 = *(id *)(a2 + 8 * (void)v21 + 32);
      }
      uint64_t v26 = v25;
      id v27 = objc_msgSend(v25, "currentUser", v55, v56);
      id v28 = [v27 uniqueIdentifier];

      sub_1000297E0();
      if (a1[2] && (unint64_t v29 = sub_100015E94(v17), (v30 & 1) != 0))
      {
        uint64_t v31 = *(void **)(a1[7] + 8 * v29);
        id v32 = v31;
      }
      else
      {
        uint64_t v31 = 0;
      }
      uint64_t v33 = v68;
      char v34 = (char *)v11 + *(int *)(v68 + 24);
      unint64_t v72 = *v73;
      v72(v34, v17, v12);
      void *v11 = v26;
      v11[1] = v31;
      *((unsigned char *)v11 + *(int *)(v33 + 28)) = 0;
      uint64_t v35 = qword_10003BA28;
      id v70 = v26;
      id v69 = v31;
      if (v35 != -1) {
        swift_once();
      }
      uint64_t v36 = sub_100029870();
      sub_100010854(v36, (uint64_t)qword_10003C2C8);
      uint64_t v37 = v66;
      sub_100018020((uint64_t)v11, v66);
      id v38 = sub_100029850();
      os_log_type_t v39 = sub_100029A90();
      a2 = v39;
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        uint64_t v74 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = v57;
        uint64_t v41 = sub_10001A9A0();
        *(void *)(v40 + 4) = sub_100021F44(v41, v42, (uint64_t *)&v74);
        swift_bridgeObjectRelease();
        sub_10001EAE4(v37);
        _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)a2, "Adding item: %{private}s", (uint8_t *)v40, 0xCu);
        swift_arrayDestroy();
        uint64_t v11 = v58;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10001EAE4(v37);
      }

      a3 = v67;
      v72(v15, v71, v12);
      sub_100018020((uint64_t)v11, (uint64_t)a3);
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v74 = v22;
      a1 = v22;
      unint64_t v17 = sub_100015E94((uint64_t)v15);
      uint64_t v45 = v22[2];
      BOOL v46 = (v44 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        break;
      }
      a2 = v44;
      if (v22[3] >= v47)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_10001CBF8();
        }
      }
      else
      {
        sub_10001C47C(v47, isUniquelyReferenced_nonNull_native);
        unint64_t v48 = sub_100015E94((uint64_t)v15);
        if ((a2 & 1) != (v49 & 1)) {
          goto LABEL_33;
        }
        unint64_t v17 = v48;
      }
      a1 = (void *)v63;
      id v22 = v74;
      if (a2)
      {
        sub_10001EB40((uint64_t)a3, v74[7] + *(void *)(v65 + 72) * v17);
      }
      else
      {
        v74[(v17 >> 6) + 8] |= 1 << v17;
        v72((char *)(v22[6] + *(void *)(v59 + 72) * v17), (unint64_t)v15, v12);
        sub_100018084((uint64_t)a3, v22[7] + *(void *)(v65 + 72) * v17);
        uint64_t v50 = v22[2];
        BOOL v51 = __OFADD__(v50, 1);
        uint64_t v52 = v50 + 1;
        if (v51) {
          goto LABEL_29;
        }
        void v22[2] = v52;
        id v22 = v74;
      }
      uint64_t v21 = (void *)((char *)v21 + 1);
      swift_bridgeObjectRelease();
      uint64_t v23 = *v60;
      (*v60)(v15, v12);

      sub_10001EAE4((uint64_t)v11);
      unint64_t v17 = v71;
      v23((char *)v71, v12);
      BOOL v24 = a1 == v21;
      a1 = v61;
      a2 = v62;
      if (v24) {
        return (uint64_t)v55;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    id v53 = a3;
    uint64_t v18 = sub_100029D00();
    uint64_t v55 = a3;
    if (!v18) {
      return (uint64_t)v55;
    }
  }
  __break(1u);
LABEL_33:
  uint64_t result = sub_100029DA0();
  __break(1u);
  return result;
}

uint64_t sub_10001EAE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConfigurationModelItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001EB40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfigurationModelItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001EBA4()
{
  unint64_t result = qword_10003C000;
  if (!qword_10003C000)
  {
    sub_100029810();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C000);
  }
  return result;
}

uint64_t *sub_10001EBFC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10001EC60()
{
  unint64_t result = qword_10003C010;
  if (!qword_10003C010)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003C010);
  }
  return result;
}

unint64_t SetupState.description.getter(unsigned __int8 a1)
{
  int v2 = a1 - 2;
  unint64_t result = 0xD000000000000014;
  switch(v2)
  {
    case 0:
      unint64_t result = 0x64696C61766E69;
      break;
    case 1:
      unint64_t result = 0x726F727265;
      break;
    case 2:
      unint64_t result = 0x6867696C66657270;
      break;
    case 3:
      unint64_t result = 0x6867696C66657270;
      break;
    case 4:
    case 6:
      unint64_t result = 0x726F4D6E7261656CLL;
      break;
    case 5:
      unint64_t result = 0x726F4D6E7261656CLL;
      break;
    case 7:
      unint64_t result = 0x726F4D6E7261656CLL;
      break;
    case 8:
      return result;
    case 9:
      unint64_t result = 0xD000000000000015;
      break;
    case 10:
    case 11:
    case 23:
    case 25:
      unint64_t result = 0xD000000000000013;
      break;
    case 12:
      unint64_t result = 0xD000000000000011;
      break;
    case 13:
      unint64_t result = 0xD000000000000011;
      break;
    case 14:
      unint64_t result = 0xD000000000000014;
      break;
    case 15:
      unint64_t result = 0xD000000000000012;
      break;
    case 16:
      unint64_t result = 0x7075746573;
      break;
    case 17:
      unint64_t result = 0x6961577075746573;
      break;
    case 18:
      unint64_t result = 0x6D6F4869746C756DLL;
      break;
    case 19:
      unint64_t result = 0xD000000000000012;
      break;
    case 20:
      unint64_t result = 0x6D6F4869746C756DLL;
      break;
    case 21:
      unint64_t result = 0xD000000000000010;
      break;
    case 22:
      unint64_t result = 0x6F48656C676E6973;
      break;
    case 24:
      unint64_t result = 0xD000000000000015;
      break;
    case 26:
      unint64_t result = 1701736292;
      break;
    case 27:
      unint64_t result = 0x4474736575716572;
      break;
    default:
      sub_100029C50(43);
      swift_bridgeObjectRelease();
      if (a1) {
        v4._countAndFlagsBits = 1702195828;
      }
      else {
        v4._countAndFlagsBits = 0x65736C6166;
      }
      if (a1) {
        uint64_t v5 = (void *)0xE400000000000000;
      }
      else {
        uint64_t v5 = (void *)0xE500000000000000;
      }
      v4._object = v5;
      sub_1000299C0(v4);
      swift_bridgeObjectRelease();
      unint64_t result = 0xD000000000000029;
      break;
  }
  return result;
}

unint64_t sub_10001F05C()
{
  return SetupState.description.getter(*v0);
}

uint64_t sub_10001F064(char *a1, unsigned __int8 *a2)
{
  return _s21MediaSetupViewService0B5StateO2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t _s21MediaSetupViewService0B5StateO2eeoiySbAC_ACtFZ_0(char a1, unsigned __int8 a2)
{
  switch(a1)
  {
    case 2:
      if (a2 != 2) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 3:
      if (a2 == 3) {
        goto LABEL_7;
      }
      goto LABEL_59;
    case 4:
      if (a2 != 4) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 5:
      if (a2 != 5) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 6:
      if (a2 != 6) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 7:
      if (a2 != 7) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 8:
      if (a2 != 8) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 9:
      if (a2 != 9) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 10:
      if (a2 != 10) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 11:
      if (a2 != 11) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 12:
      if (a2 != 12) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 13:
      if (a2 != 13) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 14:
      if (a2 != 14) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 15:
      if (a2 != 15) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 16:
      if (a2 != 16) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 17:
      if (a2 != 17) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 18:
      if (a2 != 18) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 19:
      if (a2 != 19) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 20:
      if (a2 != 20) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 21:
      if (a2 != 21) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 22:
      if (a2 != 22) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 23:
      if (a2 != 23) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 24:
      if (a2 != 24) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 25:
      if (a2 != 25) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 26:
      if (a2 != 26) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 27:
      if (a2 != 27) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 28:
      if (a2 != 28) {
        goto LABEL_59;
      }
      goto LABEL_7;
    case 29:
      if (a2 != 29) {
        goto LABEL_59;
      }
LABEL_7:
      uint64_t result = 1;
      break;
    default:
      if (a2 - 2 < 0x1C) {
LABEL_59:
      }
        uint64_t result = 0;
      else {
        uint64_t result = (((a1 & 1) == 0) ^ a2) & 1;
      }
      break;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SetupState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SetupState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xE3)
  {
    unsigned int v2 = a2 + 29;
    if (a2 + 29 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 29;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 29;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10001F34CLL);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 29;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v8 = (v7 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v8 - 27;
  if (v8 <= 0x1B) {
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SetupState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 29;
  if (a3 + 29 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xE3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xE2)
  {
    unsigned int v7 = ((a2 - 227) >> 8) + 1;
    *uint64_t result = a2 + 29;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x10001F434);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 29;
        break;
    }
  }
  return result;
}

uint64_t sub_10001F45C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_10001F478(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupState()
{
  return &type metadata for SetupState;
}

id sub_10001F540()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SoftwareUpdateViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SoftwareUpdateViewController()
{
  return self;
}

id sub_10001F598(void *a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  v29._object = a2;
  unsigned int v7 = self;
  unsigned int v8 = (objc_class *)[v7 mainBundle];
  v29._countAndFlagsBits = 0xE000000000000000;
  v37._object = (void *)0x800000010002C640;
  v37._countAndFlagsBits = 0xD000000000000015;
  v43.value._countAndFlagsBits = 0;
  v43.value._object = 0;
  v9.super.Class isa = v8;
  v49._countAndFlagsBits = 0;
  v49._object = (void *)0xE000000000000000;
  sub_100029710(v37, v43, v9, v49, v29);

  uint64_t v10 = (objc_class *)[v7 mainBundle];
  if (a5)
  {
    v38._countAndFlagsBits = 0xD00000000000001DLL;
    v30._countAndFlagsBits = 0xE000000000000000;
    v38._object = (void *)0x800000010002C690;
    v44.value._countAndFlagsBits = 0;
    v44.value._object = 0;
    v11.super.Class isa = v10;
    v50._countAndFlagsBits = 0;
    v50._object = (void *)0xE000000000000000;
    sub_100029710(v38, v44, v11, v50, v30);

    id v12 = sub_100018518(a1);
    uint64_t v13 = (objc_class *)[v7 mainBundle];
    v31._countAndFlagsBits = 0xE000000000000000;
    v39._countAndFlagsBits = 0x45554E49544E4F43;
    v39._object = (void *)0xE800000000000000;
    v45.value._countAndFlagsBits = 0;
    v45.value._object = 0;
    v14.super.Class isa = v13;
    v51._countAndFlagsBits = 0;
    v51._object = (void *)0xE000000000000000;
    sub_100029710(v39, v45, v14, v51, v31);

    id v15 = sub_100027260(0);
    swift_bridgeObjectRelease();
    [v15 addTarget:v12 action:"selectContinue" forControlEvents:64];
    id v16 = [v12 buttonTray];
    [v16 addButton:v15];

    unint64_t v17 = (objc_class *)[v7 mainBundle];
    v32._countAndFlagsBits = 0xE000000000000000;
    v40._countAndFlagsBits = 0x574F4E5F544F4ELL;
    v40._object = (void *)0xE700000000000000;
    v46.value._countAndFlagsBits = 0;
    v46.value._object = 0;
    v18.super.Class isa = v17;
    v52._countAndFlagsBits = 0;
    v52._object = (void *)0xE000000000000000;
    sub_100029710(v40, v46, v18, v52, v32);

    id v19 = sub_100027260(1);
    swift_bridgeObjectRelease();
    [v19 addTarget:v12 action:"requestDismiss" forControlEvents:64];
    id v20 = [v12 buttonTray];
    [v20 addButton:v19];
  }
  else
  {
    v41._countAndFlagsBits = 0xD000000000000020;
    v30._countAndFlagsBits = 0xE000000000000000;
    v41._object = (void *)0x800000010002C660;
    v47.value._countAndFlagsBits = 0;
    v47.value._object = 0;
    v21.super.Class isa = v10;
    v53._countAndFlagsBits = 0;
    v53._object = (void *)0xE000000000000000;
    sub_100029710(v41, v47, v21, v53, v30);

    id v12 = sub_100018518(a1);
    id v22 = (objc_class *)[v7 mainBundle];
    v33._countAndFlagsBits = 0xE000000000000000;
    v42._countAndFlagsBits = 0x45554E49544E4F43;
    v42._object = (void *)0xE800000000000000;
    v48.value._countAndFlagsBits = 0;
    v48.value._object = 0;
    v23.super.Class isa = v22;
    v54._countAndFlagsBits = 0;
    v54._object = (void *)0xE000000000000000;
    sub_100029710(v42, v48, v23, v54, v33);

    id v19 = sub_100027260(0);
    swift_bridgeObjectRelease();
    [v19 addTarget:v12 action:"selectContinue" forControlEvents:64];
    id v20 = [v12 buttonTray];
    [v20 addButton:v19];
  }

  id v24 = objc_allocWithZone((Class)type metadata accessor for MainContentView());
  swift_bridgeObjectRetain_n();
  id v25 = v34;
  id v26 = sub_10002790C(2, a3, a4, v25);
  id v27 = [v12 contentView];

  [v27 addSubview:v26];
  sub_1000234D8();

  swift_bridgeObjectRelease();
  return v12;
}

void *sub_10001FA30(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  id v12 = &_swiftEmptyArrayStorage;
  sub_100022794(0, v2, 0);
  int v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100017C48(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100022794(0, v3[2] + 1, 1);
        int v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100022794(v5 > 1, v6 + 1, 1);
        int v3 = v12;
      }
      v3[2] = v6 + 1;
      unsigned int v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void sub_10001FB78()
{
  *(_WORD *)&algn_10003C318[6] = -4864;
}

char *sub_10001FBA8(void *a1, unint64_t a2, void *a3)
{
  unsigned int v7 = v3;
  sub_100029860();
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels] = _swiftEmptyArrayStorage;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_tableViewHeight] = 0;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_heightConstraint] = 0;
  *(void *)&v7[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_mainController] = a1;
  unsigned int v8 = (unint64_t *)&v7[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_viewModel];
  *unsigned int v8 = a2;
  v8[1] = (unint64_t)a3;
  id v64 = a1;
  swift_bridgeObjectRetain();
  id v65 = a3;

  id v9 = [v65 serviceName];
  uint64_t v66 = sub_100029960();
  uint64_t v11 = v10;

  id v12 = self;
  swift_bridgeObjectRetain_n();
  uint64_t v13 = (objc_class *)[v12 mainBundle];
  v69._countAndFlagsBits = 0xD00000000000001CLL;
  v56._countAndFlagsBits = 0xE000000000000000;
  v69._object = (void *)0x800000010002CB80;
  v74.value._countAndFlagsBits = 0;
  v74.value._object = 0;
  v14.super.Class isa = v13;
  v79._countAndFlagsBits = 0;
  v79._object = (void *)0xE000000000000000;
  sub_100029710(v69, v74, v14, v79, v56);

  sub_100002798((uint64_t *)&unk_10003BB40);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10002A710;
  *(void *)(v15 + 56) = &type metadata for String;
  unint64_t v16 = sub_100004708();
  *(void *)(v15 + 64) = v16;
  *(void *)(v15 + 32) = v66;
  *(void *)(v15 + 40) = v11;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  id v62 = v12;
  unint64_t v17 = (objc_class *)[v12 mainBundle];
  v70._countAndFlagsBits = 0xD00000000000001DLL;
  v57._countAndFlagsBits = 0xE000000000000000;
  v70._object = (void *)0x800000010002CBA0;
  v75.value._countAndFlagsBits = 0;
  v75.value._object = 0;
  v18.super.Class isa = v17;
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_100029710(v70, v75, v18, v80, v57);

  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10002A710;
  *(void *)(v19 + 56) = &type metadata for String;
  *(void *)(v19 + 64) = v16;
  unint64_t v61 = v16;
  *(void *)(v19 + 32) = v66;
  *(void *)(v19 + 40) = v11;
  sub_100029970();
  uint64_t v63 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v20 = sub_100029950();
  swift_bridgeObjectRelease();
  NSString v21 = sub_100029950();
  swift_bridgeObjectRelease();
  v68.receiver = v7;
  v68.super_class = (Class)type metadata accessor for MultiHomeCustomizeViewController();
  id v22 = objc_msgSendSuper2(&v68, "initWithTitle:detailText:icon:", v20, v21, 0);

  swift_bridgeObjectRetain_n();
  id v23 = v65;
  id v24 = v22;
  id v25 = sub_100029850();
  os_log_type_t v26 = sub_100029A90();
  if (os_log_type_enabled(v25, v26))
  {
    id v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    *(_DWORD *)id v27 = 136380675;
    type metadata accessor for HomeItem();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_100029A20();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    sub_100021F44(v28, v30, &v67);
    sub_100029B90();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Init with home items %{private}s", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v31 = [v24 navigationItem];
  [v31 setHidesBackButton:1];

  [v24 setModalInPresentation:0];
  Swift::String v32 = (char *)v24;
  Swift::String v33 = sub_100022FE8(a2, (uint64_t)v32);

  *(void *)&v32[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels] = v33;
  swift_bridgeObjectRelease();
  id v34 = objc_allocWithZone((Class)UITableView);
  uint64_t v35 = v32;
  id v36 = objc_msgSend(v34, "initWithFrame:style:", 2, 0.0, 0.0, 0.0, 0.0);
  [v35 setTableView:v36];

  uint64_t result = (char *)[v35 tableView];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  Swift::String v38 = result;
  id v39 = [self clearColor];
  [v38 setBackgroundColor:v39];

  uint64_t result = (char *)[v35 tableView];
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  Swift::String v40 = result;
  [result setDataSource:v35];

  uint64_t result = (char *)[v35 tableView];
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Swift::String v41 = result;
  [result setDelegate:v35];

  uint64_t result = (char *)[v35 tableView];
  if (result)
  {
    Swift::String v42 = result;
    [result setTranslatesAutoresizingMaskIntoConstraints:0];

    Swift::String_optional v43 = (objc_class *)[v62 mainBundle];
    v58._countAndFlagsBits = 0xE000000000000000;
    v71._countAndFlagsBits = 0x45554E49544E4F43;
    v71._object = (void *)0xE800000000000000;
    v76.value._countAndFlagsBits = 0;
    v76.value._object = 0;
    v44.super.Class isa = v43;
    v81._countAndFlagsBits = 0;
    v81._object = (void *)0xE000000000000000;
    sub_100029710(v71, v76, v44, v81, v58);

    id v45 = sub_100027260(0);
    swift_bridgeObjectRelease();
    [v45 addTarget:v35 action:"selectContinue" forControlEvents:64];
    id v46 = [v35 buttonTray];
    [v46 addButton:v45];

    Swift::String_optional v47 = (objc_class *)[v62 mainBundle];
    v59._countAndFlagsBits = 0xE000000000000000;
    v72._countAndFlagsBits = 0x574F4E5F544F4ELL;
    v72._object = (void *)0xE700000000000000;
    v77.value._countAndFlagsBits = 0;
    v77.value._object = 0;
    v48.super.Class isa = v47;
    v82._countAndFlagsBits = 0;
    v82._object = (void *)0xE000000000000000;
    sub_100029710(v72, v77, v48, v82, v59);

    id v49 = sub_100027260(1);
    swift_bridgeObjectRelease();
    [v49 addTarget:v35 action:"requestDismiss" forControlEvents:64];
    id v50 = [v35 buttonTray];
    [v50 addButton:v49];

    id v51 = [v35 buttonTray];
    swift_bridgeObjectRetain();
    Swift::String v52 = (objc_class *)[v62 mainBundle];
    v73._countAndFlagsBits = 0xD000000000000024;
    v60._countAndFlagsBits = 0xE000000000000000;
    v73._object = (void *)0x800000010002CBC0;
    v78.value._countAndFlagsBits = 0;
    v78.value._object = 0;
    v53.super.Class isa = v52;
    v83._countAndFlagsBits = 0;
    v83._object = (void *)0xE000000000000000;
    sub_100029710(v73, v78, v53, v83, v60);

    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_10002A710;
    *(void *)(v54 + 56) = &type metadata for String;
    *(void *)(v54 + 64) = v61;
    *(void *)(v54 + 32) = v66;
    *(void *)(v54 + 40) = v63;
    sub_100029970();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    NSString v55 = sub_100029950();
    swift_bridgeObjectRelease();
    [v51 setCaptionText:v55];

    swift_bridgeObjectRelease();
    return v35;
  }
LABEL_12:
  __break(1u);
  return result;
}

id sub_100020548()
{
  uint64_t v1 = OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_tableViewHeight;
  double v2 = *(double *)&v0[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_tableViewHeight];
  id result = [v0 tableView];
  if (!result)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v4 = result;
  [result contentSize];
  double v6 = v5;

  if (v2 == v6)
  {
LABEL_9:
    v26.receiver = v0;
    v26.super_class = (Class)type metadata accessor for MultiHomeCustomizeViewController();
    return objc_msgSendSuper2(&v26, "viewDidLayoutSubviews");
  }
  id result = [v0 tableView];
  if (!result) {
    goto LABEL_16;
  }
  unsigned int v7 = result;
  [result contentSize];
  uint64_t v9 = v8;

  *(void *)&v0[v1] = v9;
  id result = [v0 tableView];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v10 = result;
  [result reloadData];

  id result = [v0 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v11 = result;
  [result layoutIfNeeded];

  uint64_t v12 = OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_heightConstraint;
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_heightConstraint];
  if (v13) {
    goto LABEL_7;
  }
  id result = [v0 tableView];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  NSBundle v18 = result;
  id v19 = [result heightAnchor];

  id result = [v0 tableView];
  if (result)
  {
    NSString v20 = result;
    [result contentSize];
    double v22 = v21;

    id v23 = [v19 constraintEqualToConstant:v22];
    id v24 = *(void **)&v0[v12];
    *(void *)&v0[v12] = v23;

    id v25 = *(void **)&v0[v12];
    if (!v25) {
      goto LABEL_9;
    }
    [v25 setActive:1];
    uint64_t v13 = *(void **)&v0[v12];
    if (!v13) {
      goto LABEL_9;
    }
LABEL_7:
    id v14 = v13;
    id result = [v0 tableView];
    if (result)
    {
      uint64_t v15 = result;
      [result contentSize];
      double v17 = v16;

      [v14 setConstant:v17];
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_100020840()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels;
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100029D00();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      uint64_t v7 = sub_100029C70();
    }
    else
    {
      uint64_t v7 = *(void *)(v3 + 8 * v6 + 32);
      swift_retain();
    }
    ++v6;
    uint64_t v8 = *(void *)(v7 + 16);
    char v9 = *(unsigned char *)(v7 + 24);
    swift_retain();
    swift_release();
    *(unsigned char *)(v8 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) = v9;
    swift_release();
  }
  while (v4 != v6);
LABEL_10:
  swift_bridgeObjectRelease();
  unint64_t v10 = *(void *)(v1 + v2);
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100029D00();
    if (v11)
    {
LABEL_12:
      *(void *)&v16[0] = _swiftEmptyArrayStorage;
      uint64_t result = sub_100029CC0();
      if ((v11 & 0x8000000000000000) == 0)
      {
        uint64_t v12 = 0;
        do
        {
          if ((v10 & 0xC000000000000001) != 0) {
            sub_100029C70();
          }
          else {
            swift_retain();
          }
          ++v12;
          swift_retain();
          swift_release();
          sub_100029CA0();
          sub_100029CD0();
          sub_100029CE0();
          sub_100029CB0();
        }
        while (v11 != v12);
        uint64_t v13 = *(void **)&v16[0];
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
LABEL_28:
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = _swiftEmptyArrayStorage;
LABEL_21:
  id v14 = *(void **)(*(void *)(v1
                             + OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_mainController)
                 + OBJC_IVAR___MediaSetupNavigationController_setupSession);
  if (v14)
  {
    v16[0] = xmmword_10002A980;
    memset(&v16[1], 0, 32);
    uint64_t v17 = 6;
    NSBundle v18 = v13;
    id v15 = v14;
    sub_100010118(0, 1, 0, 0);
    swift_bridgeObjectRetain();
    sub_10000617C(2, v16);
    sub_1000101F8(0, 1, 0, 0);
    swift_bridgeObjectRelease();
    sub_1000101F8(0, 1, 0, 0);
  }
  else
  {
    sub_1000101F8(0, 1, 0, 0);
  }

  return swift_bridgeObjectRelease();
}

void sub_100020B98(uint64_t a1)
{
  uint64_t v3 = sub_100029810();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels];
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    id v9 = (id)a1;
    if (v8) {
      goto LABEL_3;
    }
LABEL_22:

    swift_bridgeObjectRelease();
LABEL_23:
    swift_bridgeObjectRelease();
    id v29 = (id)a1;
    unint64_t v30 = sub_100029850();
    os_log_type_t v31 = sub_100029AB0();
    if (os_log_type_enabled(v30, v31))
    {
      Swift::String v32 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)Swift::String v32 = 134217984;
      id v38 = [v29 tag];
      sub_100029B90();

      _os_log_impl((void *)&_mh_execute_header, v30, v31, "### Unable to find switch for tag %ld", v32, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
LABEL_21:
  swift_bridgeObjectRetain_n();
  id v28 = (id)a1;
  uint64_t v8 = sub_100029D00();
  if (!v8) {
    goto LABEL_22;
  }
LABEL_3:
  Swift::String v33 = v1;
  unint64_t v34 = v7;
  unint64_t v35 = v7 & 0xC000000000000001;
  id v36 = (id)a1;
  unint64_t v10 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v11 = (void (**)(char *, uint64_t))(v4 + 8);
  a1 = 4;
  while (1)
  {
    uint64_t v4 = v8;
    uint64_t v12 = a1 - 4;
    if (v35)
    {
      uint64_t v13 = sub_100029C70();
      unint64_t v7 = a1 - 3;
      if (__OFADD__(v12, 1)) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v13 = *(void *)(v7 + 8 * a1);
      swift_retain();
      unint64_t v7 = a1 - 3;
      if (__OFADD__(v12, 1))
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
    }
    (*v10)(v6, *(void *)(v13 + 16) + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v3);
    uint64_t v1 = v6;
    id v14 = (id)sub_1000297F0();
    (*v11)(v6, v3);
    if (v14 == [v36 tag]) {
      break;
    }
    swift_release();
    ++a1;
    uint64_t v8 = v4;
    BOOL v15 = v7 == v4;
    unint64_t v7 = v34;
    if (v15)
    {
      a1 = (uint64_t)v36;

      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
  }
  id v16 = v36;

  swift_bridgeObjectRelease_n();
  swift_retain_n();
  id v17 = v16;
  NSBundle v18 = sub_100029850();
  os_log_type_t v19 = sub_100029AA0();
  NSString v20 = &off_10003A000;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    id v38 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 67109379;
    LODWORD(v37) = [v17 isOn];
    sub_100029B90();

    *(_WORD *)(v21 + 8) = 2081;
    double v22 = (uint64_t *)(*(void *)(v13 + 16) + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
    uint64_t v23 = *v22;
    unint64_t v24 = v22[1];
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_100021F44(v23, v24, (uint64_t *)&v38);
    NSString v20 = &off_10003A000;
    sub_100029B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "UserRequestsSetup=%{BOOL}d home=%{private}s", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }
  *(unsigned char *)(v13 + 24) = [v17 v20[293]];
  swift_retain();
  id v25 = sub_100029850();
  os_log_type_t v26 = sub_100029A90();
  if (os_log_type_enabled(v25, v26))
  {
    id v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v27 = 67174657;
    LODWORD(v38) = *(unsigned __int8 *)(v13 + 24);
    sub_100029B90();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "request setup now is:%{BOOL,private}d", v27, 8u);
    swift_slowDealloc();
  }

  swift_release_n();
}

id sub_100021234()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiHomeCustomizeViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100021328()
{
  return type metadata accessor for MultiHomeCustomizeViewController();
}

uint64_t type metadata accessor for MultiHomeCustomizeViewController()
{
  uint64_t result = qword_10003C378;
  if (!qword_10003C378) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002137C()
{
  uint64_t result = sub_100029870();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100021524(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100029810();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BA30 != -1) {
    swift_once();
  }
  NSString v8 = sub_100029950();
  id v9 = [a1 dequeueReusableCellWithIdentifier:v8];

  if (!v9)
  {
    id v10 = objc_allocWithZone((Class)UITableViewCell);
    swift_bridgeObjectRetain();
    NSString v11 = sub_100029950();
    swift_bridgeObjectRelease();
    id v9 = [v10 initWithStyle:3 reuseIdentifier:v11];
  }
  uint64_t v12 = sub_100029830();
  uint64_t v13 = v12;
  uint64_t v14 = OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels;
  unint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_homeItemViewModels);
  if (!(v15 >> 62))
  {
    if (v12 < *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_7;
    }
    return (unint64_t)v9;
  }
  swift_bridgeObjectRetain();
  uint64_t v43 = sub_100029D00();
  swift_bridgeObjectRelease();
  if (v13 >= v43) {
    return (unint64_t)v9;
  }
LABEL_7:
  unint64_t result = sub_100029830();
  uint64_t v17 = *(void *)(v1 + v14);
  if ((v17 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100029C70();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v18 = *(void *)(v17 + 8 * result + 32);
    swift_retain();
LABEL_11:
    uint64_t v19 = *(void *)(v18 + 16);
    swift_retain();
    id v20 = [v9 accessoryView];

    if (!v20)
    {
      id v21 = objc_msgSend(objc_allocWithZone((Class)UISwitch), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
      [v9 setAccessoryView:v21];
    }
    id v22 = [v9 accessoryView];
    if (v22)
    {
      uint64_t v23 = v22;
      self;
      unint64_t v24 = (void *)swift_dynamicCastObjCClass();
      if (v24)
      {
        id v25 = v24;
        [v24 addTarget:v2 action:"switchDidChange:" forControlEvents:4096];
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v19 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v4);
        id v26 = v23;
        uint64_t v27 = sub_1000297F0();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        [v25 setTag:v27];

        [v25 setEnabled:(*(unsigned char *)(v19 + 16) & 0xFD) == 0];
        BOOL v28 = *(unsigned char *)(v18 + 24) == 1 && (*(unsigned char *)(v19 + 16) & 0xFD) == 0;
        [v25 setOn:v28];
      }
      else
      {
      }
    }
    id v29 = [v9 textLabel];
    if (v29)
    {
      unint64_t v30 = v29;
      swift_bridgeObjectRetain();
      NSString v31 = sub_100029950();
      swift_bridgeObjectRelease();
      [v30 setText:v31];
    }
    id v32 = [v9 detailTextLabel];
    if (v32)
    {
      Swift::String v33 = v32;
      if (*(unsigned char *)(v19 + 16))
      {
        if (*(unsigned char *)(v19 + 16) == 1) {
          char v34 = 18;
        }
        else {
          char v34 = 17;
        }
        unint64_t v35 = sub_100026030(v34);
        uint64_t v37 = v36;
        id v38 = (objc_class *)[self mainBundle];
        v44._countAndFlagsBits = 0xE000000000000000;
        v46._countAndFlagsBits = v35;
        v46._object = v37;
        v47.value._countAndFlagsBits = 0;
        v47.value._object = 0;
        v39.super.Class isa = v38;
        v48._countAndFlagsBits = 0;
        v48._object = (void *)0xE000000000000000;
        sub_100029710(v46, v47, v39, v48, v44);
        swift_bridgeObjectRelease();
      }
      NSString v40 = sub_100029950();
      swift_bridgeObjectRelease();
      [v33 setText:v40];
    }
    id v41 = [v9 detailTextLabel];
    if (v41)
    {
      Swift::String v42 = v41;
      [v41 setAdjustsFontSizeToFitWidth:1];
    }
    [v9 setSelectionStyle:0];
    swift_release();
    swift_release();
    return (unint64_t)v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_100021C50()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 25, 7);
}

uint64_t type metadata accessor for HomeItemViewModel()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for MultiHomeCustomizeViewModel(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  id v4 = v3;
  return a1;
}

void destroy for MultiHomeCustomizeViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *assignWithCopy for MultiHomeCustomizeViewModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for MultiHomeCustomizeViewModel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MultiHomeCustomizeViewModel(uint64_t a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MultiHomeCustomizeViewModel(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MultiHomeCustomizeViewModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MultiHomeCustomizeViewModel()
{
  return &type metadata for MultiHomeCustomizeViewModel;
}

uint64_t sub_100021E58(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100021E68(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100021EA4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100021ECC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100021F44(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100029B90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100021F44(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100022018(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100017C48((uint64_t)v12, *a3);
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
      sub_100017C48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100022704((uint64_t)v12);
  return v7;
}

uint64_t sub_100022018(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100029BA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000221D4(a5, a6);
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
  uint64_t v8 = sub_100029C90();
  if (!v8)
  {
    sub_100029CF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100029D40();
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

uint64_t sub_1000221D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002226C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002244C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002244C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002226C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000223E4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100029C60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100029CF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000299D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100029D40();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100029CF0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000223E4(uint64_t a1, uint64_t a2)
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
  sub_100002798((uint64_t *)&unk_10003C4F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002244C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002798((uint64_t *)&unk_10003C4F0);
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
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

unsigned char **sub_10002259C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_1000225AC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_100029D40();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_100022650@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100022680(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1000226AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000226D4@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100022704(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100022754(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000227B4(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100022774(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000229F4(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100022794(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100022B64(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1000227B4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  sub_100002798(&qword_10003C518);
  uint64_t v10 = *(void *)(sub_100029810() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  uint64_t v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100029810() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  id v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

uint64_t sub_1000229F4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100002798((uint64_t *)&unk_10003C520);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

uint64_t sub_100022B64(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100002798(&qword_10003C510);
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
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100029D40();
  __break(1u);
  return result;
}

uint64_t sub_100022CD0(void *a1)
{
  uint64_t v2 = sub_100029810();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002798((uint64_t *)&unk_10003BD30);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  int64_t v11 = (char *)&v27 - v10;
  id v12 = [a1 serviceID];
  if (v12)
  {
    uint64_t v13 = v12;
    sub_1000297E0();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v9, 0, 1, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v9, 1, 1, v2);
  }
  sub_1000231AC((uint64_t)v9, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2))
  {
    sub_10001A6E0((uint64_t)v11);
LABEL_12:
    char v25 = 1;
    return v25 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v11, v2);
  sub_10001A6E0((uint64_t)v11);
  uint64_t v14 = sub_1000297C0();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v17 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v18 = sub_100029950();
  id v19 = [v17 initWithSuiteName:v18];

  if (!v19)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  NSString v20 = sub_100029950();
  id v21 = [v19 arrayForKey:v20];

  if (!v21 || (uint64_t v22 = sub_100029A10(), v21, v23 = sub_10001FA30(v22), swift_bridgeObjectRelease(), !v23))
  {

    goto LABEL_11;
  }
  char v24 = sub_100011114(v14, v16, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  char v25 = v24 ^ 1;
  return v25 & 1;
}

void *sub_100022FE8(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v4) {
      break;
    }
    uint64_t result = (void *)sub_100029CC0();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    uint64_t v7 = a2 + OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_viewModel;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = sub_100029C70();
      }
      else
      {
        uint64_t v9 = *(void *)(a1 + 8 * v6 + 32);
        swift_retain();
      }
      if ((*(unsigned __int8 *)(v9 + 16) | 2) == 2)
      {
        BOOL v8 = (sub_100022CD0(*(void **)(v7 + 8)) & 1) != 0
          || *(void *)(v9 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service) != 0;
        type metadata accessor for HomeItemViewModel();
        a2 = swift_allocObject();
        *(void *)(a2 + 16) = v9;
        *(unsigned char *)(a2 + 24) = v8;
      }
      else
      {
        type metadata accessor for HomeItemViewModel();
        a2 = swift_allocObject();
        *(void *)(a2 + 16) = v9;
        *(unsigned char *)(a2 + 24) = 0;
      }
      ++v6;
      sub_100029CA0();
      sub_100029CD0();
      sub_100029CE0();
      sub_100029CB0();
      if (v4 == v6) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100029D00();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000231AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002798((uint64_t *)&unk_10003BD30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023218(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 == 42) {
    return 0;
  }
  if (a3)
  {
    if (a5)
    {
      unint64_t v10 = sub_100026030(a1);
      id v12 = v11;
      uint64_t v13 = self;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v14 = (objc_class *)[v13 mainBundle];
      v30._countAndFlagsBits = 0xE000000000000000;
      v31._countAndFlagsBits = v10;
      v31._object = v12;
      v34.value._countAndFlagsBits = 0;
      v34.value._object = 0;
      v15.super.Class isa = v14;
      v37._countAndFlagsBits = 0;
      v37._object = (void *)0xE000000000000000;
      sub_100029710(v31, v34, v15, v37, v30);
      swift_bridgeObjectRelease();

      sub_100002798((uint64_t *)&unk_10003BB40);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_10002B090;
      *(void *)(v16 + 56) = &type metadata for String;
      unint64_t v17 = sub_100004708();
      *(void *)(v16 + 32) = a2;
      *(void *)(v16 + 40) = a3;
      *(void *)(v16 + 96) = &type metadata for String;
      *(void *)(v16 + 104) = v17;
      *(void *)(v16 + 64) = v17;
      *(void *)(v16 + 72) = a4;
      *(void *)(v16 + 80) = a5;
    }
    else
    {
      unint64_t v22 = sub_100026030(a1);
      char v24 = v23;
      char v25 = self;
      swift_bridgeObjectRetain();
      id v26 = (objc_class *)[v25 mainBundle];
      v30._countAndFlagsBits = 0xE000000000000000;
      v33._countAndFlagsBits = v22;
      v33._object = v24;
      v36.value._countAndFlagsBits = a4;
      v36.value._object = 0;
      v27.super.Class isa = v26;
      v39._countAndFlagsBits = 0;
      v39._object = (void *)0xE000000000000000;
      sub_100029710(v33, v36, v27, v39, v30);
      swift_bridgeObjectRelease();

      sub_100002798((uint64_t *)&unk_10003BB40);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_10002A710;
      *(void *)(v28 + 56) = &type metadata for String;
      *(void *)(v28 + 64) = sub_100004708();
      *(void *)(v28 + 32) = a2;
      *(void *)(v28 + 40) = a3;
    }
    uint64_t v5 = sub_100029970();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = sub_100026030(a1);
    id v19 = v18;
    if (!a5)
    {
      NSString v20 = (objc_class *)[self mainBundle];
      v30._countAndFlagsBits = 0xE000000000000000;
      v32._countAndFlagsBits = v5;
      v32._object = v19;
      v35.value._countAndFlagsBits = a4;
      v35.value._object = 0;
      v21.super.Class isa = v20;
      v38._countAndFlagsBits = 0;
      v38._object = (void *)0xE000000000000000;
      uint64_t v5 = sub_100029710(v32, v35, v21, v38, v30);
      swift_bridgeObjectRelease();
    }
  }
  return v5;
}

void sub_1000234D8()
{
  id v1 = [v0 superview];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = self;
    sub_100002798(&qword_10003BFB0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10002B0A0;
    id v5 = [v0 topAnchor];
    id v6 = [v2 topAnchor];
    id v7 = [v5 constraintLessThanOrEqualToAnchor:v6 constant:50.0];

    *(void *)(v4 + 32) = v7;
    id v8 = [v0 centerXAnchor];
    id v9 = [v2 centerXAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];

    *(void *)(v4 + 40) = v10;
    id v11 = [v0 widthAnchor];
    id v12 = [v2 widthAnchor];
    id v13 = [v11 constraintLessThanOrEqualToAnchor:v12];

    *(void *)(v4 + 48) = v13;
    id v14 = [v2 bottomAnchor];
    id v15 = [v0 bottomAnchor];
    id v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];

    *(void *)(v4 + 56) = v16;
    sub_100029A30();
    sub_100026E08();
    Class isa = sub_100029A00().super.isa;
    swift_bridgeObjectRelease();
    [v3 activateConstraints:isa];
  }
}

uint64_t sub_10002376C(char a1)
{
  switch(a1)
  {
    case 1:
      id v1 = (objc_class *)[self mainBundle];
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v4 = "ADD_TO_HOME_MUSIC_ONLY_SUPPORTED_DETAIL";
      goto LABEL_5;
    case 2:
      id v1 = (objc_class *)[self mainBundle];
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v4 = "ADD_TO_HOME_RADIO_ONLY_SUPPORTED_DETAIL";
LABEL_5:
      v2._object = (void *)((unint64_t)(v4 - 32) | 0x8000000000000000);
      v2._countAndFlagsBits = 0xD000000000000027;
      goto LABEL_11;
    case 3:
      id v1 = (objc_class *)[self mainBundle];
      v2._countAndFlagsBits = 0xD00000000000002ALL;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "ADD_TO_HOME_PODCASTS_ONLY_SUPPORTED_DETAIL";
      goto LABEL_10;
    case 4:
      id v1 = (objc_class *)[self mainBundle];
      v2._countAndFlagsBits = 0xD000000000000028;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "ADD_TO_HOME_MUSIC_RADIO_SUPPORTED_DETAIL";
      goto LABEL_10;
    case 5:
      id v1 = (objc_class *)[self mainBundle];
      v2._countAndFlagsBits = 0xD00000000000002BLL;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "ADD_TO_HOME_MUSIC_PODCASTS_SUPPORTED_DETAIL";
      goto LABEL_10;
    case 6:
      id v1 = (objc_class *)[self mainBundle];
      v2._countAndFlagsBits = 0xD00000000000002BLL;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "ADD_TO_HOME_RADIO_PODCASTS_SUPPORTED_DETAIL";
      goto LABEL_10;
    default:
      id v1 = (objc_class *)[self mainBundle];
      v2._countAndFlagsBits = 0xD000000000000026;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "ADD_TO_HOME_ALL_MEDIA_SUPPORTED_DETAIL";
LABEL_10:
      v2._object = (void *)((unint64_t)(v3 - 32) | 0x8000000000000000);
LABEL_11:
      v9.value._countAndFlagsBits = 0;
      v9.value._object = 0;
      v5.super.Class isa = v1;
      v10._countAndFlagsBits = 0;
      v10._object = (void *)0xE000000000000000;
      uint64_t v6 = sub_100029710(v2, v9, v5, v10, v8);

      return v6;
  }
}

uint64_t sub_1000239E0(char a1)
{
  return *(void *)&aConfigurentitl_0[8 * a1];
}

unint64_t sub_100023A00(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 1919251317;
      break;
    case 2:
      unint64_t result = 0x7261654C72657375;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x6D6F437075746573;
      break;
  }
  return result;
}

id sub_100023AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = self;
  swift_bridgeObjectRetain_n();
  id v7 = (objc_class *)[v6 mainBundle];
  v26._countAndFlagsBits = 0xE000000000000000;
  v32._object = (void *)0x800000010002CD80;
  v32._countAndFlagsBits = 0xD000000000000012;
  v35.value._countAndFlagsBits = 0;
  v35.value._object = 0;
  v8.super.Class isa = v7;
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_100029710(v32, v35, v8, v38, v26);

  sub_100002798((uint64_t *)&unk_10003BB40);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10002A710;
  *(void *)(v9 + 56) = &type metadata for String;
  unint64_t v10 = sub_100004708();
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v11 = (objc_class *)[v6 mainBundle];
  v33._countAndFlagsBits = 0xD000000000000013;
  v27._countAndFlagsBits = 0xE000000000000000;
  v33._object = (void *)0x800000010002CDA0;
  v36.value._countAndFlagsBits = 0;
  v36.value._object = 0;
  v12.super.Class isa = v11;
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_100029710(v33, v36, v12, v39, v27);

  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10002A710;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = v10;
  *(void *)(v13 + 32) = a1;
  *(void *)(v13 + 40) = a2;
  sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v14 = (objc_class *)[v6 mainBundle];
  v28._countAndFlagsBits = 0xE000000000000000;
  v34._countAndFlagsBits = 19279;
  v34._object = (void *)0xE200000000000000;
  v37.value._countAndFlagsBits = 0;
  v37.value._object = 0;
  v15.super.Class isa = v14;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_100029710(v34, v37, v15, v40, v28);

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  sub_100010834(a3);
  NSString v17 = sub_100029950();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1000275F4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002666C;
  aBlock[3] = &unk_100035BA0;
  NSString v18 = _Block_copy(aBlock);
  swift_release();
  id v19 = [self actionWithTitle:v17 style:0 handler:v18];
  _Block_release(v18);

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  NSString v21 = sub_100029950();
  swift_bridgeObjectRelease();
  NSString v22 = sub_100029950();
  swift_bridgeObjectRelease();
  id v23 = [ObjCClassFromMetadata alertControllerWithTitle:v21 message:v22 preferredStyle:1];

  id v24 = v23;
  [v24 addAction:v19];
  sub_100010844(a3);

  return v24;
}

uint64_t sub_100023E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100002798(&qword_10003BFE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100029700();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000296F0();
  sub_1000296E0();
  sub_1000296D0();
  sub_100002798(&qword_10003C7E0);
  sub_1000296A0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10002B090;
  sub_100029690();
  sub_1000297C0();
  sub_100029690();
  swift_bridgeObjectRelease();
  sub_1000296B0();
  sub_1000296C0();
  uint64_t v11 = sub_100029810();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v12 = sub_100029770();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12) == 1)
  {
    sub_100010604((uint64_t)v6, &qword_10003BFE8);
    uint64_t v14 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v6, v12);
    uint64_t v14 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a2, v14, 1, v12);
}

uint64_t sub_1000241F4(uint64_t a1)
{
  return sub_100024264(a1, qword_10003D600);
}

uint64_t sub_100024210(uint64_t a1)
{
  return sub_100024264(a1, qword_10003D618);
}

uint64_t sub_10002422C(uint64_t a1)
{
  return sub_100024264(a1, qword_10003D630);
}

uint64_t sub_100024248(uint64_t a1)
{
  return sub_100024264(a1, qword_10003D648);
}

uint64_t sub_100024264(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002798((uint64_t *)&unk_10003BD30);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  sub_10001EBFC(v6, a2);
  uint64_t v7 = sub_100010854(v6, (uint64_t)a2);
  sub_1000297B0();
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v7, v5, v6);
  }
  __break(1u);
  return result;
}

void *sub_100024388(uint64_t a1)
{
  uint64_t v2 = sub_100029810();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  Swift::String v31 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v11)
  {
    Swift::String v32 = &_swiftEmptyArrayStorage;
    sub_100029CC0();
    uint64_t v13 = (unsigned __int8 *)(a1 + 32);
    uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    NSBundle v15 = (void (**)(uint64_t, char *, uint64_t))(v3 + 32);
    do
    {
      int v24 = *v13++;
      int v23 = v24;
      if (v24)
      {
        if (v23 == 1)
        {
          if (qword_10003BA40 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_100010854(v2, (uint64_t)qword_10003D618);
          (*v14)(v8, v25, v2);
          type metadata accessor for HomeItem();
          uint64_t v18 = swift_allocObject();
          uint64_t v26 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service;
          *(void *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service) = 0;
          *(unsigned char *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) = 0;
          Swift::String v27 = *(void **)(v18 + v26);
          *(void *)(v18 + v26) = 0;

          (*v15)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v8, v2);
          uint64_t v21 = v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name;
          *(void *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name) = 0x4120616E616E6142;
          unint64_t v22 = 0xED000065756E6576;
        }
        else
        {
          if (qword_10003BA48 != -1) {
            swift_once();
          }
          uint64_t v16 = sub_100010854(v2, (uint64_t)qword_10003D630);
          NSString v17 = v31;
          (*v14)(v31, v16, v2);
          type metadata accessor for HomeItem();
          uint64_t v18 = swift_allocObject();
          uint64_t v19 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service;
          *(void *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service) = 0;
          *(unsigned char *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) = 0;
          NSString v20 = *(void **)(v18 + v19);
          *(void *)(v18 + v19) = 0;

          (*v15)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v17, v2);
          uint64_t v21 = v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name;
          *(void *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name) = 0x4C20797272656843;
          unint64_t v22 = 0xEB00000000656E61;
        }
      }
      else
      {
        if (qword_10003BA38 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_100010854(v2, (uint64_t)qword_10003D600);
        (*v14)(v10, v28, v2);
        type metadata accessor for HomeItem();
        uint64_t v18 = swift_allocObject();
        uint64_t v29 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service;
        *(void *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service) = 0;
        *(unsigned char *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) = 0;
        Swift::String v30 = *(void **)(v18 + v29);
        *(void *)(v18 + v29) = 0;

        (*v15)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v10, v2);
        uint64_t v21 = v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name;
        *(void *)(v18 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name) = 0x745320656C707041;
        unint64_t v22 = 0xE90000000000002ELL;
      }
      *(void *)(v21 + 8) = v22;
      *(unsigned char *)(v18 + 17) = 0;
      *(unsigned char *)(v18 + 16) = v23;
      sub_100029CA0();
      sub_100029CD0();
      sub_100029CE0();
      sub_100029CB0();
      --v11;
    }
    while (v11);
    return v32;
  }
  return result;
}

uint64_t sub_1000247D8()
{
  uint64_t v1 = sub_100029810();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name + 8);
  uint64_t v20 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_name);
  uint64_t v21 = v5;
  swift_bridgeObjectRetain();
  v22._countAndFlagsBits = 8250;
  v22._object = (void *)0xE200000000000000;
  sub_1000299C0(v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id, v1);
  sub_10001AC28();
  v23._countAndFlagsBits = sub_100029D70();
  sub_1000299C0(v23);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v6 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service;
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_service);
  if (v7) {
    uint64_t v8 = 0xD000000000000011;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)0xE000000000000000;
  if (v7) {
    uint64_t v10 = (void *)0x800000010002CF90;
  }
  else {
    uint64_t v10 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = v8;
  v24._object = v10;
  sub_1000299C0(v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup)) {
    uint64_t v11 = 0xD000000000000013;
  }
  else {
    uint64_t v11 = 0;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup)) {
    uint64_t v12 = (void *)0x800000010002CF70;
  }
  else {
    uint64_t v12 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v25._countAndFlagsBits = v11;
  v25._object = v12;
  sub_1000299C0(v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v20;
  uint64_t v13 = v21;
  NSBundle v15 = *(void **)(v0 + v6);
  if (v15)
  {
    id v16 = [v15 description];
    uint64_t v17 = sub_100029960();
    uint64_t v9 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v20 = v14;
  uint64_t v21 = v13;
  swift_bridgeObjectRetain();
  v26._countAndFlagsBits = v17;
  v26._object = v9;
  sub_1000299C0(v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_100024A44()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_id;
  uint64_t v2 = sub_100029810();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100024B08()
{
  return type metadata accessor for HomeItem();
}

uint64_t type metadata accessor for HomeItem()
{
  uint64_t result = qword_10003C5B8;
  if (!qword_10003C5B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100024B5C()
{
  uint64_t result = sub_100029810();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100024C18()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100024C60()
{
  return sub_1000247D8();
}

BOOL sub_100024C84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100024C98()
{
  sub_100029E10(*v0);
}

uint64_t sub_100024CD4()
{
  return sub_1000239E0(*v0);
}

unint64_t sub_100024CDC(char a1)
{
  unint64_t v2 = 0xD000000000000011;
  switch(a1)
  {
    case 2:
      unint64_t v2 = 0x64696C61766E69;
      break;
    case 3:
      unint64_t v2 = 1701736292;
      break;
    case 4:
      unint64_t v2 = 0x726F727265;
      break;
    case 5:
      return v2;
    case 6:
      unint64_t v2 = 0x6D6F4869746C756DLL;
      break;
    case 7:
      unint64_t v2 = 0xD000000000000012;
      break;
    case 8:
    case 9:
      unint64_t v2 = 0x726F4D6E7261656CLL;
      break;
    case 10:
      unint64_t v2 = 0x73756F6976657270;
      break;
    case 11:
      unint64_t v2 = 0x4474736575716572;
      break;
    case 12:
      unint64_t v2 = 0xD000000000000015;
      break;
    case 13:
      unint64_t v2 = 0x6174537075746573;
      break;
    case 14:
      unint64_t v2 = 0x6F48656C676E6973;
      break;
    default:
      sub_100029C50(36);
      swift_bridgeObjectRelease();
      if (a1) {
        v3._countAndFlagsBits = 1702195828;
      }
      else {
        v3._countAndFlagsBits = 0x65736C6166;
      }
      if (a1) {
        uint64_t v4 = (void *)0xE400000000000000;
      }
      else {
        uint64_t v4 = (void *)0xE500000000000000;
      }
      v3._object = v4;
      sub_1000299C0(v3);
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD000000000000022;
      break;
  }
  return v2;
}

unint64_t sub_100024F48()
{
  return sub_100024CDC(*v0);
}

uint64_t sub_100024F50()
{
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  sub_100029C50(67);
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  v14._object = (void *)0x800000010002CC50;
  v14._countAndFlagsBits = 0xD000000000000011;
  sub_1000299C0(v14);
  sub_10001040C(v0, (uint64_t)v13, &qword_10003C7C0);
  sub_10001040C((uint64_t)v13, (uint64_t)v10, &qword_10003C7C0);
  sub_100026DD0((uint64_t)v13);
  sub_100002798(&qword_10003C7C0);
  v15._countAndFlagsBits = sub_100029980();
  sub_1000299C0(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0x7449656D6F68202CLL;
  v16._object = (void *)0xED0000203A736D65;
  sub_1000299C0(v16);
  unint64_t v1 = *(void *)(v0 + 56);
  type metadata accessor for HomeItem();
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = sub_100029A20();
  sub_1000299C0(v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 0xD000000000000014;
  v18._object = (void *)0x800000010002CC70;
  sub_1000299C0(v18);
  v10[0] = &_swiftEmptyArrayStorage;
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    v19._countAndFlagsBits = sub_100029A20();
    sub_1000299C0(v19);
    swift_release();
    swift_bridgeObjectRelease();
    v20._countAndFlagsBits = 0x3A726F727265202CLL;
    v20._object = (void *)0xE900000000000020;
    sub_1000299C0(v20);
    sub_10001040C(v0 + 48, (uint64_t)v10, &qword_10003C7C8);
    sub_10001040C((uint64_t)v10, (uint64_t)&v9, &qword_10003C7C8);
    sub_100002798(&qword_10003C7C8);
    v21._countAndFlagsBits = sub_100029980();
    sub_1000299C0(v21);
    swift_bridgeObjectRelease();
    return v11;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_100029D00();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        uint64_t v5 = sub_100029C70();
        if (*(unsigned char *)(v5 + OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup) == 1
          && (*(unsigned char *)(v5 + 17) & 1) == 0
          && (*(unsigned __int8 *)(v5 + 16) | 2) == 2)
        {
          sub_100029CA0();
          sub_100029CD0();
          sub_100029CE0();
          sub_100029CB0();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup;
      do
      {
        uint64_t v8 = *(void *)(v1 + 8 * v6 + 32);
        if (*(unsigned char *)(v8 + v7) == 1 && (*(unsigned char *)(v8 + 17) & 1) == 0 && (*(unsigned __int8 *)(v8 + 16) | 2) == 2)
        {
          swift_retain();
          sub_100029CA0();
          sub_100029CD0();
          sub_100029CE0();
          sub_100029CB0();
          uint64_t v7 = OBJC_IVAR____TtC21MediaSetupViewService8HomeItem_userRequestsSetup;
        }
        ++v6;
      }
      while (v2 != v6);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000252D8()
{
  return sub_100024F50();
}

unint64_t sub_100025314()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6F437463656C6573;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x654B7463656C6573;
      break;
    case 5:
      unint64_t result = 0x654C7463656C6573;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100025434()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100025454()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for Stack()
{
  return sub_10002763C();
}

ValueMetadata *type metadata accessor for HomeItemEligibility()
{
  return &type metadata for HomeItemEligibility;
}

uint64_t getEnumTagSinglePayload for MainContentViewConfiguration(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s21MediaSetupViewService19HomeItemEligibilityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100025618);
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

ValueMetadata *type metadata accessor for HomeTopology()
{
  return &type metadata for HomeTopology;
}

uint64_t destroy for SetupStepContext(uint64_t a1)
{
  if (*(void *)(a1 + 8) != 1)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SetupStepContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4 == 1)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    BOOL v7 = *(void **)(a2 + 24);
    uint64_t v6 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    id v8 = v7;
    swift_bridgeObjectRetain();
  }
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SetupStepContext(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8) == 1)
  {
    if (v4 == 1)
    {
      long long v5 = *a2;
      long long v6 = a2[2];
      *(_OWORD *)(a1 + 16) = a2[1];
      *(_OWORD *)(a1 + 32) = v6;
      *(_OWORD *)a1 = v5;
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
      char v9 = (void *)*((void *)a2 + 3);
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      id v10 = v9;
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 == 1)
  {
    sub_100025874(a1);
    long long v8 = a2[1];
    long long v7 = a2[2];
    *(_OWORD *)a1 = *a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 32) = v7;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v11 = *(void **)(a1 + 24);
    unint64_t v12 = (void *)*((void *)a2 + 3);
    *(void *)(a1 + 24) = v12;
    id v13 = v12;

    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100025874(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for SetupStepContext(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SetupStepContext(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) != 1)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    if (v4 != 1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      long long v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);

      uint64_t v7 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_100025874(a1);
  }
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_6:
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SetupStepContext(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SetupStepContext(uint64_t result, int a2, int a3)
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupStepContext()
{
  return &type metadata for SetupStepContext;
}

uint64_t destroy for AccountMismatchContext(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccountMismatchContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v5 = *(void **)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  id v6 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountMismatchContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  long long v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AccountMismatchContext(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AccountMismatchContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountMismatchContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountMismatchContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountMismatchContext()
{
  return &type metadata for AccountMismatchContext;
}

uint64_t getEnumTagSinglePayload for SetupProgressEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF2)
  {
    unsigned int v2 = a2 + 14;
    if (a2 + 14 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 14;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 14;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x100025D24);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 14;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v8 = (v7 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v8 - 12;
  if (v8 <= 0xC) {
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SetupProgressEvent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 14;
  if (a3 + 14 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xF2) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v7 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x100025E0CLL);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupProgressEvent()
{
  return &type metadata for SetupProgressEvent;
}

uint64_t getEnumTagSinglePayload for SetupUserEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SetupUserEvent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x100025FA0);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupUserEvent()
{
  return &type metadata for SetupUserEvent;
}

unint64_t sub_100025FDC()
{
  unint64_t result = qword_10003C7A8;
  if (!qword_10003C7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7A8);
  }
  return result;
}

unint64_t sub_100026030(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000026;
      break;
    case 6:
      unint64_t result = 0xD000000000000027;
      break;
    case 7:
      unint64_t result = 0xD000000000000027;
      break;
    case 8:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 9:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000028;
      break;
    case 11:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 12:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 13:
      unint64_t result = 0xD000000000000024;
      break;
    case 14:
      unint64_t result = 0x545F474E49444441;
      break;
    case 15:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 16:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 17:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 18:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 19:
      unint64_t result = 0x5445445F454E4F44;
      break;
    case 20:
    case 23:
    case 34:
      unint64_t result = 0xD000000000000011;
      break;
    case 21:
      unint64_t result = 0xD000000000000013;
      break;
    case 22:
      unint64_t result = 0xD000000000000012;
      break;
    case 24:
      unint64_t result = 0xD000000000000017;
      break;
    case 25:
      unint64_t result = 0xD000000000000012;
      break;
    case 26:
      unint64_t result = 0xD000000000000018;
      break;
    case 27:
      unint64_t result = 0x495249535F594548;
      break;
    case 28:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 29:
      unint64_t result = 0xD000000000000020;
      break;
    case 30:
      unint64_t result = 0xD000000000000015;
      break;
    case 31:
      unint64_t result = 0x45554E49544E4F43;
      break;
    case 32:
      unint64_t result = 0x485F45534F4F4843;
      break;
    case 33:
      unint64_t result = 1162760004;
      break;
    case 35:
      unint64_t result = 0x4F4D5F4E5241454CLL;
      break;
    case 36:
      unint64_t result = 0x574F4E5F544F4ELL;
      break;
    case 37:
      unint64_t result = 19279;
      break;
    case 38:
      unint64_t result = 0xD000000000000010;
      break;
    case 39:
      unint64_t result = 0x495F455441445055;
      break;
    case 40:
      unint64_t result = 0xD000000000000010;
      break;
    case 41:
      unint64_t result = 0x485F4E495F455355;
      break;
    default:
      return result;
  }
  return result;
}

void sub_100026434(void *a1, void (*a2)(void))
{
  if (a1 && (id v3 = [a1 CGImage]) != 0)
  {
    unsigned int v4 = v3;
    id v5 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v3];
    a2();
  }
  else
  {
    ((void (*)(void))a2)(0);
  }
}

unint64_t sub_1000264E8()
{
  return sub_100023A00(*v0);
}

Swift::Int sub_1000264F0()
{
  Swift::UInt v1 = *v0;
  sub_100029E00();
  sub_100029E10(v1);
  return sub_100029E20();
}

Swift::Int sub_100026538()
{
  Swift::UInt v1 = *v0;
  sub_100029E00();
  sub_100029E10(v1);
  return sub_100029E20();
}

uint64_t sub_10002657C()
{
  return *(void *)&aNohomes_1[8 * *v0];
}

unint64_t sub_1000265A4()
{
  unint64_t result = qword_10003C7B0;
  if (!qword_10003C7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7B0);
  }
  return result;
}

unint64_t sub_1000265FC()
{
  unint64_t result = qword_10003C7B8;
  if (!qword_10003C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7B8);
  }
  return result;
}

void sub_100026650()
{
  qword_10003D660 = (uint64_t)&_swiftEmptyArrayStorage;
  byte_10003D668 = 0;
}

void sub_10002666C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000266D4(unsigned __int8 a1)
{
  switch(a1 >> 6)
  {
    case 1:
      sub_100029C50(29);
      swift_bridgeObjectRelease();
      unint64_t v8 = 0xD00000000000001BLL;
      if (a1) {
        v3._countAndFlagsBits = 1702195828;
      }
      else {
        v3._countAndFlagsBits = 0x65736C6166;
      }
      if (a1) {
        id v4 = (void *)0xE400000000000000;
      }
      else {
        id v4 = (void *)0xE500000000000000;
      }
      goto LABEL_11;
    case 2:
      int v5 = a1;
      uint64_t result = 0x4D746E756F636361;
      switch(v5)
      {
        case 129:
          uint64_t result = 0x7A696D6F74737563;
          break;
        case 130:
          uint64_t result = 1701736292;
          break;
        case 131:
          uint64_t result = 0x726F727265;
          break;
        default:
          return result;
      }
      break;
    case 3:
      unint64_t v7 = 0xD000000000000010;
      if (a1 != 193) {
        unint64_t v7 = 0x6E49657461647075;
      }
      if (a1 == 192) {
        uint64_t result = 0x726F4D6E7261656CLL;
      }
      else {
        uint64_t result = v7;
      }
      break;
    default:
      unint64_t v8 = 0x6D6F486F54646461;
      uint64_t v2 = 8 * (char)a1;
      v3._countAndFlagsBits = *(void *)&aNohomes_1[v2];
      id v4 = *(void **)&aMultiple_1[v2 + 8];
LABEL_11:
      v3._object = v4;
      sub_1000299C0(v3);
      swift_bridgeObjectRelease();
      uint64_t result = v8;
      break;
  }
  return result;
}

uint64_t sub_1000268F8()
{
  return sub_1000266D4(*v0);
}

uint64_t sub_100026900(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    Swift::String v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_100029E00();
    swift_bridgeObjectRetain();
    sub_100029990();
    Swift::Int v18 = sub_100029E20();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    Swift::String v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_100029D80() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        Swift::String v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_100029D80() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t (*sub_100026BA4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100026CC0(v6, a2, a3);
  return sub_100026C0C;
}

uint64_t (*sub_100026C10(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100026D48(v6, a2, a3);
  return sub_100026C0C;
}

void sub_100026C78(void *a1)
{
  Swift::UInt v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100026CC0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  int64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100029C70();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)int64_t v3 = v4;
    return sub_100026D40;
  }
  __break(1u);
  return result;
}

void sub_100026D40(id *a1)
{
}

uint64_t (*sub_100026D48(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  int64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_100029C70();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_100026DC8;
  }
  __break(1u);
  return result;
}

uint64_t sub_100026DC8()
{
  return swift_release();
}

uint64_t sub_100026DD0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100026E08()
{
  unint64_t result = qword_10003C7D0;
  if (!qword_10003C7D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003C7D0);
  }
  return result;
}

Swift::Int sub_100026E48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100002798((uint64_t *)&unk_10003BB50);
    uint64_t v3 = sub_100029C40();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100029E00();
      swift_bridgeObjectRetain();
      sub_100029990();
      Swift::Int result = sub_100029E20();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_100029D80(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_100029D80();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100026FEC(uint64_t a1)
{
  Swift::Int v2 = sub_100026E48((uint64_t)&off_100034E00);
  swift_arrayDestroy();
  char v3 = sub_100026900(a1, v2);
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    Swift::Int v5 = sub_100026E48((uint64_t)&off_100034E50);
    swift_arrayDestroy();
    char v6 = sub_100026900(a1, v5);
    swift_bridgeObjectRelease();
    if (v6)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      Swift::Int v7 = sub_100026E48((uint64_t)&off_100034E80);
      swift_arrayDestroy();
      char v8 = sub_100026900(a1, v7);
      swift_bridgeObjectRelease();
      if (v8)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        Swift::Int v9 = sub_100026E48((uint64_t)&off_100034EB0);
        swift_arrayDestroy();
        char v10 = sub_100026900(a1, v9);
        swift_bridgeObjectRelease();
        if (v10)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          Swift::Int v11 = sub_100026E48((uint64_t)&off_100034EE0);
          swift_arrayDestroy();
          char v12 = sub_100026900(a1, v11);
          swift_bridgeObjectRelease();
          if (v12)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            Swift::Int v13 = sub_100026E48((uint64_t)&off_100034F20);
            swift_arrayDestroy();
            char v14 = sub_100026900(a1, v13);
            swift_bridgeObjectRelease();
            if (v14)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              Swift::Int v15 = sub_100026E48((uint64_t)&off_100034F60);
              swift_arrayDestroy();
              char v16 = sub_100026900(a1, v15);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v16) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

id sub_100027260(char a1)
{
  uint64_t v2 = sub_100002798(&qword_10003C7D8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  Swift::Int v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __chkstk_darwin(v3);
  char v8 = &v21[-v7];
  __chkstk_darwin(v6);
  char v10 = &v21[-v9];
  if (a1)
  {
    id v11 = [self linkButton];
    sub_100029B60();
    uint64_t v14 = sub_100029B50();
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v5, 1, v14))
    {
      sub_10002754C((uint64_t)v5, (uint64_t)v8);
      sub_100029B70();

      uint64_t v13 = (uint64_t)v5;
      goto LABEL_6;
    }
    id v17 = [self orangeColor];
    sub_100029B40();
LABEL_9:
    sub_100029B70();

    goto LABEL_10;
  }
  id v11 = [self boldButton];
  sub_100029B60();
  uint64_t v12 = sub_100029B50();
  if (!(*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v10, 1, v12))
  {
    id v15 = [self orangeColor];
    char v16 = (void (*)(unsigned char *, void))sub_100029B30();
    sub_100029880();
    v16(v21, 0);
    goto LABEL_9;
  }
  sub_10002754C((uint64_t)v10, (uint64_t)v8);
  sub_100029B70();

  uint64_t v13 = (uint64_t)v10;
LABEL_6:
  sub_100010604(v13, &qword_10003C7D8);
LABEL_10:
  id v18 = v11;
  NSString v19 = sub_100029950();
  [v18 setTitle:v19 forState:0];

  return v18;
}

uint64_t sub_10002754C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002798(&qword_10003C7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000275B4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000275F4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_100027624(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100027634()
{
  return swift_release();
}

uint64_t sub_10002763C()
{
  return swift_getGenericMetadata();
}

uint64_t getEnumTagSinglePayload for SetupError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SetupError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1000277C8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_1000277F0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000277F8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SetupError()
{
  return &type metadata for SetupError;
}

unint64_t sub_100027814()
{
  unint64_t result = qword_10003C7E8;
  if (!qword_10003C7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7E8);
  }
  return result;
}

void sub_10002787C(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000278E8()
{
  qword_10003C7F0 = 0x4066800000000000;
}

void sub_1000278FC()
{
  qword_10003C7F8 = 0x404E000000000000;
}

id sub_10002790C(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___homeImageView] = 1;
  uint64_t v9 = OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_settingsImageView;
  char v10 = v4;
  NSString v11 = sub_100029950();
  id v12 = [self imageNamed:v11];

  id v13 = [objc_allocWithZone((Class)UIImageView) initWithImage:v12];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  *(void *)&v4[v9] = v13;
  *(void *)&v10[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___exampleLabel] = 0;
  uint64_t v14 = &v10[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_viewModel];
  *uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  *((void *)v14 + 2) = a3;
  *((void *)v14 + 3) = a4;
  swift_bridgeObjectRetain();
  id v15 = a4;

  v18.receiver = v10;
  v18.super_class = (Class)type metadata accessor for MainContentView();
  id v16 = objc_msgSendSuper2(&v18, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  sub_100027BE0();

  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_100027A90(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___homeImageView;
  *(void *)&v1[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___homeImageView] = 1;
  uint64_t v4 = OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_settingsImageView;
  uint64_t v5 = v1;
  NSString v6 = sub_100029950();
  id v7 = [self imageNamed:v6];

  id v8 = [objc_allocWithZone((Class)UIImageView) initWithImage:v7];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  *(void *)&v1[v4] = v8;
  uint64_t v9 = OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___exampleLabel;
  *(void *)&v5[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___exampleLabel] = 0;
  sub_10001088C(*(id *)&v1[v3]);

  char v10 = *(void **)&v5[v9];
  type metadata accessor for MainContentView();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_100027BE0()
{
  int v1 = v0[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_viewModel];
  int v2 = sub_100027EAC(v0[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_viewModel]);
  if (v1 == 1)
  {
    id v23 = v2;
    id v3 = sub_100028A14();
    [v0 addSubview:v3];

    uint64_t v4 = self;
    sub_100002798(&qword_10003BFB0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_10002B0A0;
    id v6 = sub_100028A14();
    id v7 = [v6 topAnchor];

    id v8 = [v23 bottomAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8 constant:50.0];

    *(void *)(v5 + 32) = v9;
    id v10 = sub_100028A14();
    id v11 = [v10 centerXAnchor];

    id v12 = [v0 centerXAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12];

    *(void *)(v5 + 40) = v13;
    id v14 = sub_100028A14();
    id v15 = [v14 leadingAnchor];

    id v16 = [v0 leadingAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16 constant:16.0];

    *(void *)(v5 + 48) = v17;
    id v18 = sub_100028A14();
    id v19 = [v18 trailingAnchor];

    id v20 = [v0 trailingAnchor];
    id v21 = [v19 constraintEqualToAnchor:v20 constant:-16.0];

    *(void *)(v5 + 56) = v21;
    sub_100029A30();
    sub_1000102BC(0, (unint64_t *)&qword_10003C7D0);
    Class isa = sub_100029A00().super.isa;
    swift_bridgeObjectRelease();
    [v4 activateConstraints:isa];

    int v2 = v23;
  }
}

void *sub_100027EAC(unsigned __int8 a1)
{
  if (a1 > 1u)
  {
    id v2 = *(id *)&v1[OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_settingsImageView];
  }
  else
  {
    id v2 = sub_100028164();
    if (!v2) {
      id v2 = [objc_allocWithZone((Class)UIImageView) init];
    }
  }
  id v3 = v2;
  [v1 addSubview:v2];
  uint64_t v4 = self;
  sub_100002798(&qword_10003BFB0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10002B0A0;
  id v6 = [v3 widthAnchor];
  if (qword_10003BA60 != -1) {
    swift_once();
  }
  id v7 = [v6 constraintLessThanOrEqualToConstant:*(double *)&qword_10003C7F0];

  *(void *)(v5 + 32) = v7;
  id v8 = [v3 heightAnchor];
  id v9 = [v3 widthAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];

  *(void *)(v5 + 40) = v10;
  id v11 = [v3 centerXAnchor];
  id v12 = [v1 centerXAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];

  *(void *)(v5 + 48) = v13;
  id v14 = [v3 topAnchor];
  id v15 = [v1 topAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v5 + 56) = v16;
  sub_100029A30();
  sub_1000102BC(0, (unint64_t *)&qword_10003C7D0);
  Class isa = sub_100029A00().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];

  return v3;
}

id sub_100028164()
{
  uint64_t v1 = OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___homeImageView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___homeImageView);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_1000281D4();
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_10001088C(v4);
  }
  sub_10001089C(v2);
  return v3;
}

id sub_1000281D4()
{
  NSString v0 = sub_100029950();
  id v1 = [self imageNamed:v0];

  if (!v1) {
    return 0;
  }
  id v2 = [objc_allocWithZone((Class)UIImageView) initWithImage:v1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = objc_allocWithZone((Class)ISIcon);
  id v5 = v2;
  swift_bridgeObjectRetain();
  NSString v6 = sub_100029950();
  swift_bridgeObjectRelease();
  id v7 = [v4 initWithBundleIdentifier:v6];

  id v8 = [self imageDescriptorNamed:kISImageDescriptorHomeScreen];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002939C;
  *(void *)(v9 + 24) = v3;
  v12[4] = sub_1000293DC;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  _OWORD v12[2] = sub_10002787C;
  uint64_t v12[3] = &unk_100035D30;
  id v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v7 getImageForImageDescriptor:v8 completion:v10];
  _Block_release(v10);

  swift_release();
  return v5;
}

uint64_t sub_100028424(void *a1, void *a2)
{
  uint64_t v4 = sub_1000298A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000298D0();
  uint64_t v8 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000102BC(0, (unint64_t *)&qword_10003BA70);
  id v11 = (void *)sub_100029AF0();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  aBlock[4] = sub_10002943C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C76C;
  aBlock[3] = &unk_100035D80;
  id v13 = _Block_copy(aBlock);
  id v14 = a1;
  id v15 = a2;
  swift_release();
  sub_1000298C0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100029444();
  sub_100002798(&qword_10003BD98);
  sub_10002949C();
  sub_100029BD0();
  sub_100029B00();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
}

void sub_1000286B8(uint64_t a1, void *a2)
{
  id v3 = [objc_allocWithZone((Class)UIImageView) initWithImage:a1];
  id v4 = [v3 layer];
  [v4 setShadowRadius:4.0];

  id v5 = [v3 layer];
  objc_msgSend(v5, "setShadowOffset:", 0.0, 2.0);

  id v6 = [v3 layer];
  LODWORD(v7) = 1041865114;
  [v6 setShadowOpacity:v7];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a2 addSubview:v3];
  uint64_t v8 = self;
  sub_100002798(&qword_10003BFB0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10002B0A0;
  id v10 = [v3 widthAnchor];
  if (qword_10003BA68 != -1) {
    swift_once();
  }
  id v11 = [v10 constraintLessThanOrEqualToConstant:*(double *)&qword_10003C7F8];

  *(void *)(v9 + 32) = v11;
  id v12 = [v3 heightAnchor];
  id v13 = [v3 widthAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];

  *(void *)(v9 + 40) = v14;
  id v15 = [v3 trailingAnchor];
  id v16 = [a2 trailingAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16 constant:0.0];

  *(void *)(v9 + 48) = v17;
  id v18 = [v3 bottomAnchor];
  id v19 = [a2 bottomAnchor];
  id v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];

  *(void *)(v9 + 56) = v20;
  sub_100029A30();
  sub_1000102BC(0, (unint64_t *)&qword_10003C7D0);
  Class isa = sub_100029A00().super.isa;
  swift_bridgeObjectRelease();
  [v8 activateConstraints:isa];
}

id sub_100028A14()
{
  uint64_t v1 = OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___exampleLabel;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___exampleLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC21MediaSetupViewService15MainContentView____lazy_storage___exampleLabel);
  }
  else
  {
    id v4 = sub_100028A78(v0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100028A78(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  id v3 = [self preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v2 setFont:v3];

  [v2 setNumberOfLines:0];
  sub_100028FC0(*(void **)(a1 + OBJC_IVAR____TtC21MediaSetupViewService15MainContentView_viewModel + 24));
  NSString v4 = sub_100029950();
  swift_bridgeObjectRelease();
  [v2 setText:v4];

  [v2 setTextAlignment:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

id sub_100028BC4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MainContentView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MainContentView()
{
  return self;
}

void destroy for MainContentViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for MainContentViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  NSString v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for MainContentViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  NSString v4 = *(void **)(a2 + 24);
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for MainContentViewModel(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for MainContentViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  NSString v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for MainContentViewModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MainContentViewModel(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MainContentViewModel()
{
  return &type metadata for MainContentViewModel;
}

uint64_t sub_100028E74(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_1000299A0();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return String.subscript.getter(a1, a2, a3, a4);
}

uint64_t sub_100028F10(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return String.subscript.getter(a1, a2, a3, a4);
  }
  unint64_t v4 = a3;
  unint64_t v5 = a2;
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v7 = 11;
  }
  unint64_t v8 = v7 | (v6 << 16);
  a1 = sub_1000299A0();
  if (a2) {
    a1 = v8;
  }
  if (4 * v6 < a1 >> 14) {
    goto LABEL_14;
  }
  a2 = v8;
  a3 = v5;
  a4 = v4;

  return String.subscript.getter(a1, a2, a3, a4);
}

uint64_t sub_100028FC0(void *a1)
{
  id v2 = [a1 intentExamples];
  if (v2)
  {
    long long v3 = v2;
    unint64_t v4 = (void *)sub_100029A10();

    if (v4[2])
    {
      unint64_t v5 = v4[4];
      unint64_t v6 = v4[5];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      sub_100028E74(1, v5, v6, v7);
      swift_bridgeObjectRelease();
      uint64_t v8 = sub_100029B80();
      uint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_100028F10(1uLL, v5, v6, v11);
      swift_bridgeObjectRelease();
      sub_100029310();
      swift_bridgeObjectRetain();
      sub_1000299B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = v8;
      id v13 = self;
      swift_bridgeObjectRetain();
      id v14 = (objc_class *)[v13 mainBundle];
      v28._countAndFlagsBits = 0xE000000000000000;
      v29._countAndFlagsBits = 0x495249535F594548;
      v29._object = (void *)0xE800000000000000;
      v31.value._countAndFlagsBits = 0;
      v31.value._object = 0;
      v15.super.Class isa = v14;
      v33._countAndFlagsBits = 0;
      v33._object = (void *)0xE000000000000000;
      sub_100029710(v29, v31, v15, v33, v28);

      sub_100002798((uint64_t *)&unk_10003BB40);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_10002A710;
      *(void *)(v16 + 56) = &type metadata for String;
      *(void *)(v16 + 64) = sub_100004708();
      *(void *)(v16 + 32) = v12;
      *(void *)(v16 + 40) = v10;
      uint64_t v17 = sub_100029970();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v17;
    }
    swift_bridgeObjectRelease();
  }
  id v19 = [a1 serviceName];
  uint64_t v20 = sub_100029960();
  uint64_t v22 = v21;

  id v23 = self;
  swift_bridgeObjectRetain();
  uint64_t v24 = (objc_class *)[v23 mainBundle];
  v28._countAndFlagsBits = 0xE000000000000000;
  v30._object = (void *)0x800000010002CD60;
  v30._countAndFlagsBits = 0xD000000000000018;
  v32.value._countAndFlagsBits = 0;
  v32.value._object = 0;
  v25.super.Class isa = v24;
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_100029710(v30, v32, v25, v34, v28);

  sub_100002798((uint64_t *)&unk_10003BB40);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_10002A710;
  *(void *)(v26 + 56) = &type metadata for String;
  *(void *)(v26 + 64) = sub_100004708();
  *(void *)(v26 + 32) = v20;
  *(void *)(v26 + 40) = v22;
  uint64_t v27 = sub_100029970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v27;
}

unint64_t sub_100029310()
{
  unint64_t result = qword_10003C848;
  if (!qword_10003C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C848);
  }
  return result;
}

uint64_t sub_100029364()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002939C(void *a1)
{
  return sub_100028424(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000293A4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000293DC(void *a1)
{
  sub_100026434(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_1000293E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000293F4()
{
  return swift_release();
}

uint64_t sub_1000293FC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002943C()
{
  sub_1000286B8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_100029444()
{
  unint64_t result = qword_10003BD90;
  if (!qword_10003BD90)
  {
    sub_1000298A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003BD90);
  }
  return result;
}

unint64_t sub_10002949C()
{
  unint64_t result = qword_10003BDA0;
  if (!qword_10003BDA0)
  {
    sub_100010384(&qword_10003BD98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003BDA0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MainContentViewConfiguration(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000295C4);
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

ValueMetadata *type metadata accessor for MainContentViewConfiguration()
{
  return &type metadata for MainContentViewConfiguration;
}

unint64_t sub_100029600()
{
  unint64_t result = qword_10003C850;
  if (!qword_10003C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C850);
  }
  return result;
}

uint64_t sub_10002965C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100029690()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_1000296A0()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_1000296B0()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_1000296C0()
{
  return URLComponents.url.getter();
}

uint64_t sub_1000296D0()
{
  return URLComponents.host.setter();
}

uint64_t sub_1000296E0()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_1000296F0()
{
  return URLComponents.init()();
}

uint64_t sub_100029700()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100029710(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100029720()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100029730()
{
  return _convertNSErrorToError(_:)();
}

void sub_100029740(NSURL *retstr@<X8>)
{
}

uint64_t sub_100029750()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029760()
{
  return URL.init(string:)();
}

uint64_t sub_100029770()
{
  return type metadata accessor for URL();
}

NSDate sub_100029780()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100029790()
{
  return Date.init()();
}

uint64_t sub_1000297A0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000297B0()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_1000297C0()
{
  return UUID.uuidString.getter();
}

NSUUID sub_1000297D0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_1000297E0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000297F0()
{
  return UUID.hashValue.getter();
}

uint64_t sub_100029800()
{
  return UUID.init()();
}

uint64_t sub_100029810()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100029820()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029830()
{
  return IndexPath.row.getter();
}

uint64_t sub_100029840()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_100029850()
{
  return Logger.logObject.getter();
}

uint64_t sub_100029860()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100029870()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100029880()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_100029890()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000298A0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000298B0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1000298C0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000298D0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000298E0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000298F0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100029900()
{
  return + infix(_:_:)();
}

uint64_t sub_100029910()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029920()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100029930()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100029940()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100029950()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100029960()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029970()
{
  return String.init(format:_:)();
}

uint64_t sub_100029980()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100029990()
{
  return String.hash(into:)();
}

uint64_t sub_1000299A0()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_1000299B0()
{
  return String.append<A>(contentsOf:)();
}

void sub_1000299C0(Swift::String a1)
{
}

Swift::Int sub_1000299D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000299F0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100029A00()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100029A10()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029A20()
{
  return Array.description.getter();
}

uint64_t sub_100029A30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100029A40()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100029A50()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100029A60()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100029A70()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029A80()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100029A90()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100029AA0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100029AB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100029AC0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100029AD0()
{
  return static NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(_:)();
}

uint64_t sub_100029AE0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100029AF0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100029B00()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100029B10()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_100029B20()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100029B30()
{
  return UIButton.Configuration.background.modify();
}

uint64_t sub_100029B40()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_100029B50()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_100029B60()
{
  return UIButton.configuration.getter();
}

uint64_t sub_100029B70()
{
  return UIButton.configuration.setter();
}

uint64_t sub_100029B80()
{
  return Substring.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100029B90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100029BA0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100029BB0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100029BD0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100029BE0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100029BF0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100029C00()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100029C10()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100029C20()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100029C30()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100029C40()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100029C50(Swift::Int a1)
{
}

uint64_t sub_100029C60()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100029C70()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100029C80()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100029C90()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100029CA0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100029CB0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100029CC0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100029CD0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100029CE0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100029CF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100029D00()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100029D10()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100029D20()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100029D30()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100029D40()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100029D60(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100029D70()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100029D80()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100029D90()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100029DA0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100029DB0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100029DC0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100029DD0()
{
  return Error._code.getter();
}

uint64_t sub_100029DE0()
{
  return Error._domain.getter();
}

uint64_t sub_100029DF0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100029E00()
{
  return Hasher.init(_seed:)();
}

void sub_100029E10(Swift::UInt a1)
{
}

Swift::Int sub_100029E20()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}