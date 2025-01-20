uint64_t static AppSelectionSignal.ValidationError.== infix(_:_:)()
{
  return 1;
}

uint64_t AppSelectionSignal.ValidationError.hash(into:)()
{
  return sub_21E6CB9B8();
}

uint64_t AppSelectionSignal.ValidationError.hashValue.getter()
{
  return sub_21E6CB9C8();
}

uint64_t sub_21E6B50FC()
{
  return 1;
}

uint64_t sub_21E6B5104()
{
  return AppSelectionSignal.ValidationError.hashValue.getter();
}

uint64_t sub_21E6B511C()
{
  return AppSelectionSignal.ValidationError.hash(into:)();
}

uint64_t sub_21E6B5134()
{
  return sub_21E6CB9C8();
}

uint64_t static AppSelectionSignal.supportsSecureCoding.getter()
{
  return byte_267D3CEE0;
}

uint64_t static AppSelectionSignal.supportsSecureCoding.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_6();
  byte_267D3CEE0 = a1;
  return result;
}

uint64_t (*static AppSelectionSignal.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t AppSelectionSignal.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSelectionSignal.version.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version);
}

uint64_t AppSelectionSignal.rows.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E6B52D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E6B5330();
  *a1 = result;
  return result;
}

uint64_t sub_21E6B5304()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_21E6B5374(v0);
}

uint64_t sub_21E6B5330()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E6B5374(uint64_t a1)
{
  v3 = (void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info);
  OUTLINED_FUNCTION_6();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21E6B53B8())()
{
  return j_j__swift_endAccess;
}

id AppSelectionSignal.__allocating_init(name:version:timeElapsed:rows:info:signalTiming:test:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return AppSelectionSignal.init(name:version:timeElapsed:rows:info:signalTiming:test:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

id AppSelectionSignal.init(name:version:timeElapsed:rows:info:signalTiming:test:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, double a8)
{
  v9 = &v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name];
  void *v9 = a1;
  v9[1] = a2;
  *(void *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version] = a3;
  *(double *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed] = a8;
  *(void *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows] = a4;
  *(void *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info] = a5;
  *(void *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_signalTiming] = a6;
  v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test] = a7;
  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for AppSelectionSignal();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for AppSelectionSignal()
{
  return self;
}

id sub_21E6B5540(uint64_t a1)
{
  if (*(void *)(*(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows) + 16) == *(void *)(*(void *)(a1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows) + 16))
  {
    MEMORY[0x270FA5388]();
    uint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E6B5934(v3, (uint64_t (*)(uint64_t, uint64_t))sub_21E6B5814);
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name);
    uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name + 8);
    uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version);
    double v8 = *(double *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed)
       + *(double *)(a1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed);
    v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info);
    swift_beginAccess();
    uint64_t v10 = *v9;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = swift_bridgeObjectRetain();
    uint64_t v12 = sub_21E6B581C(v11, v10);
    uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_signalTiming);
    swift_bridgeObjectRetain();
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = sub_21E6B58A8(v14, v13);
    char v16 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test);
    id v17 = objc_allocWithZone((Class)type metadata accessor for AppSelectionSignal());
    return AppSelectionSignal.init(name:version:timeElapsed:rows:info:signalTiming:test:)(v5, v6, v7, v4, v12, v15, v16, v8);
  }
  else
  {
    sub_21E6B5750();
    swift_allocError();
    return (id)swift_willThrow();
  }
}

unint64_t sub_21E6B5750()
{
  unint64_t result = qword_267D3CF60;
  if (!qword_267D3CF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3CF60);
  }
  return result;
}

unint64_t sub_21E6B579C(unint64_t result, uint64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)(a3 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows) + 16) > result)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = swift_bridgeObjectRetain();
    return sub_21E6B581C(v4, a2);
  }
  __break(1u);
  return result;
}

unint64_t sub_21E6B5814(unint64_t a1, uint64_t a2)
{
  return sub_21E6B579C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_21E6B581C(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_21E6B7120(a1, (uint64_t)sub_21E6B6EE8, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_21E6B58A8(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_21E6B6F20(a1, (uint64_t)sub_21E6B826C, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_21E6B5934(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_21E6B7AB0(0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    do
    {
      uint64_t v7 = *(void *)(v6 + 8 * v5);
      swift_bridgeObjectRetain();
      uint64_t v8 = a2(v5, v7);
      swift_bridgeObjectRelease();
      unint64_t v10 = *(void *)(v12 + 16);
      unint64_t v9 = *(void *)(v12 + 24);
      if (v10 >= v9 >> 1) {
        sub_21E6B7AB0((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v10 + 1;
      *(void *)(v12 + 8 * v10 + 32) = v8;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_21E6B5A50()
{
  uint64_t v1 = v0;
  sub_21E6B7ED4(0, &qword_26AD35378);
  uint64_t v2 = MEMORY[0x263F8D310];
  uint64_t v3 = sub_21E6CB6F8();
  uint64_t v34 = v3;
  if (qword_267D3CEF0 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_267D3D430;
  uint64_t v4 = *(void *)algn_267D3D438;
  double v6 = *(double *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed) * 1000.0;
  id v7 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  id v8 = objc_msgSend(v7, sel_initWithDouble_, v6);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    swift_isUniquelyReferenced_nonNull_native();
    sub_21E6B7DAC(v9, v5, v4);
    uint64_t v34 = v3;
    swift_bridgeObjectRelease();
    uint64_t v10 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = (void *)sub_21E6B7BB4(v5, v4);
    swift_bridgeObjectRelease();
  }
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = swift_bridgeObjectRetain();
  sub_21E6B5F68(v12, (void (*)(uint64_t, uint64_t, id))sub_21E6B7CD0);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E6CBEA0;
  if (qword_267D3CF10 != -1) {
    swift_once();
  }
  uint64_t v14 = *(void *)algn_267D3D478;
  *(void *)(inited + 32) = qword_267D3D470;
  *(void *)(inited + 40) = v14;
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name + 8);
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 48) = v15;
  *(void *)(inited + 56) = v16;
  uint64_t v17 = qword_267D3CF18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)algn_267D3D488;
  *(void *)(inited + 80) = qword_267D3D480;
  *(void *)(inited + 88) = v18;
  uint64_t v19 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version);
  *(void *)(inited + 120) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 96) = v19;
  uint64_t v20 = qword_267D3CEE8;
  swift_bridgeObjectRetain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = *(void *)algn_267D3D428;
  *(void *)(inited + 128) = qword_267D3D420;
  *(void *)(inited + 136) = v21;
  *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF78);
  *(void *)(inited + 144) = v34;
  uint64_t v22 = qword_267D3CEF8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = *(void *)algn_267D3D448;
  *(void *)(inited + 176) = qword_267D3D440;
  *(void *)(inited + 184) = v23;
  uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows);
  *(void *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF80);
  *(void *)(inited + 192) = v24;
  uint64_t v25 = qword_267D3CF08;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v26 = *(void *)algn_267D3D468;
  *(void *)(inited + 224) = qword_267D3D460;
  *(void *)(inited + 232) = v26;
  v27 = (uint64_t *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info);
  OUTLINED_FUNCTION_5();
  uint64_t v28 = *v27;
  *(void *)(inited + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF88);
  *(void *)(inited + 240) = v28;
  uint64_t v29 = qword_267D3CF00;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v29 != -1) {
    swift_once();
  }
  uint64_t v30 = *(void *)algn_267D3D458;
  *(void *)(inited + 272) = qword_267D3D450;
  *(void *)(inited + 280) = v30;
  char v31 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test);
  *(void *)(inited + 312) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 288) = v31;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_21E6CB6F8();
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t sub_21E6B5F08(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRetain();
  sub_21E6B7D1C((uint64_t)a3, a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E6B5F68(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  sub_21E6B8664(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v20 = v19[1];
  int64_t v4 = v19[3];
  unint64_t v5 = v19[4];
  int64_t v6 = (unint64_t)(v19[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = *(void **)(*(void *)(v3 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    id v18 = v17;
    a2(v15, v16, v18);

    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v10 >= v6) {
      return swift_release();
    }
    unint64_t v11 = *(void *)(v20 + 8 * v10);
    int64_t v12 = v4 + 1;
    if (!v11)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v6) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v20 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v6) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v20 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v6) {
            return swift_release();
          }
          unint64_t v11 = *(void *)(v20 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v6) {
              return swift_release();
            }
            unint64_t v11 = *(void *)(v20 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v6)
              {
                unint64_t v11 = *(void *)(v20 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v4 = v12;
  }
  __break(1u);
  return result;
}

void sub_21E6B6110(void *a1)
{
  uint64_t v3 = (void *)sub_21E6CB708();
  if (qword_267D3CF10 != -1) {
    swift_once();
  }
  int64_t v4 = (void *)sub_21E6CB708();
  OUTLINED_FUNCTION_0();

  id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version));
  if (qword_267D3CF18 != -1) {
    swift_once();
  }
  int64_t v6 = (void *)sub_21E6CB708();
  OUTLINED_FUNCTION_0();

  double v7 = *(double *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed);
  if (qword_267D3CEF0 != -1) {
    swift_once();
  }
  unint64_t v8 = (void *)sub_21E6CB708();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v8, v7);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF88);
  unint64_t v9 = (void *)sub_21E6CB778();
  if (qword_267D3CEF8 != -1) {
    swift_once();
  }
  int64_t v10 = (void *)sub_21E6CB708();
  OUTLINED_FUNCTION_0();

  OUTLINED_FUNCTION_5();
  swift_bridgeObjectRetain();
  unint64_t v11 = (void *)sub_21E6CB6E8();
  swift_bridgeObjectRelease();
  if (qword_267D3CF08 != -1) {
    swift_once();
  }
  int64_t v12 = (void *)sub_21E6CB708();
  OUTLINED_FUNCTION_0();

  sub_21E6B7ED4(0, &qword_26AD35378);
  int64_t v13 = (void *)sub_21E6CB6E8();
  if (qword_267D3CEE8 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)sub_21E6CB708();
  OUTLINED_FUNCTION_0();

  uint64_t v15 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test);
  if (qword_267D3CF00 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)sub_21E6CB708();
  objc_msgSend(a1, sel_encodeBool_forKey_, v15, v16);
}

id AppSelectionSignal.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AppSelectionSignal.init(coder:)(a1);
}

id AppSelectionSignal.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E6B7ED4(0, &qword_267D3CF90);
  uint64_t v5 = qword_267D3CF10;
  int64_t v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21E6CB7C8();
  if (!v7)
  {

LABEL_25:
    type metadata accessor for AppSelectionSignal();
    swift_deallocPartialClassInstance();
    return 0;
  }
  unint64_t v8 = (void *)v7;
  uint64_t v9 = sub_21E6CB718();
  uint64_t v11 = v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF98);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_21E6CBEB0;
  *(void *)(v12 + 32) = sub_21E6B7ED4(0, &qword_267D3CFA0);
  *(void *)(v12 + 40) = sub_21E6B7ED4(0, &qword_267D3CFA8);
  *(void *)(v12 + 48) = v4;
  *(void *)(v12 + 56) = sub_21E6B7ED4(0, &qword_26AD35378);
  if (qword_267D3CEF8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2(&qword_267D3D440);
  swift_bridgeObjectRelease();
  if (!v89)
  {

    swift_bridgeObjectRelease();
    sub_21E6B87C8((uint64_t)v88, &qword_267D3CFB0);
    goto LABEL_25;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF80);
  if ((OUTLINED_FUNCTION_1(v13, v14, v15, v13, v16, v17, v18, v19, v64, v69, v74, v9, 4) & 1) == 0)
  {

LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  uint64_t v20 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_3(v20, v21, v22, v23, v24, v25, v26, v27, v65, v70, v87, v79, v28);
  if (qword_267D3CF08 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2(&qword_267D3D460);
  swift_bridgeObjectRelease();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF88);
  if ((OUTLINED_FUNCTION_1(v29, v30, v31, v29, v32, v33, v34, v35, v66, v71, v75, v80, v84) & 1) == 0)
  {

LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v36 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_3(v36, v37, v38, v39, v40, v41, v42, v43, v67, v87, v76, v81, v44);
  if (qword_267D3CEE8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2(&qword_267D3D420);
  swift_bridgeObjectRelease();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF78);
  if ((OUTLINED_FUNCTION_1(v45, v46, v47, v45, v48, v49, v50, v51, v68, v72, v77, v82, v85) & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v52 = v87;
  v53 = &v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name];
  *(void *)v53 = v83;
  *((void *)v53 + 1) = v11;
  if (qword_267D3CF18 != -1) {
    swift_once();
  }
  v54 = (void *)sub_21E6CB7C8();
  if (v54)
  {
    v55 = v54;
    uint64_t v56 = (uint64_t)objc_msgSend(v54, sel_integerValue);
  }
  else
  {
    uint64_t v56 = -1;
  }
  *(void *)&v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version] = v56;
  if (qword_267D3CEF0 != -1) {
    swift_once();
  }
  v59 = (void *)sub_21E6CB708();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v59);
  uint64_t v61 = v60;

  *(void *)&v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed] = v61;
  *(void *)&v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows] = v78;
  *(void *)&v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info] = v73;
  *(void *)&v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_signalTiming] = v52;
  if (qword_267D3CF00 != -1) {
    swift_once();
  }
  v62 = (void *)sub_21E6CB708();
  unsigned __int8 v63 = objc_msgSend(a1, sel_decodeBoolForKey_, v62);

  v6[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test] = v63;
  v86.receiver = v6;
  v86.super_class = (Class)type metadata accessor for AppSelectionSignal();
  id v57 = objc_msgSendSuper2(&v86, sel_init);

  return v57;
}

void sub_21E6B6AC4()
{
  qword_267D3D420 = 0x6C6C694D656D6974;
  *(void *)algn_267D3D428 = 0xEA00000000007369;
}

void sub_21E6B6AEC()
{
  qword_267D3D430 = 0x6C6C694D656D6974;
  *(void *)algn_267D3D438 = 0xEF6C61746F547369;
}

void sub_21E6B6B1C()
{
  qword_267D3D440 = 1937207154;
  *(void *)algn_267D3D448 = 0xE400000000000000;
}

void sub_21E6B6B38()
{
  qword_267D3D450 = 0x747365547369;
  *(void *)algn_267D3D458 = 0xE600000000000000;
}

void sub_21E6B6B58()
{
  qword_267D3D460 = 1868983913;
  *(void *)algn_267D3D468 = 0xE400000000000000;
}

void sub_21E6B6B74()
{
  qword_267D3D470 = 1701667182;
  *(void *)algn_267D3D478 = 0xE400000000000000;
}

void sub_21E6B6B90()
{
  qword_267D3D480 = 0x6E6F6973726576;
  *(void *)algn_267D3D488 = 0xE700000000000000;
}

id AppSelectionSignal.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AppSelectionSignal.init()()
{
}

id AppSelectionSignal.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSelectionSignal();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_21E6B6CCC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21E6CB868();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_21E6B6D60(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v6 = a1 + 8 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_21E6CB868();
    __break(1u);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3CF88);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return MEMORY[0x270FA01C8](v8, v9, v10, v7);
}

uint64_t sub_21E6B6E60(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  id v6 = a4;
  return a2;
}

uint64_t sub_21E6B6EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_21E6B6EE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_21E6B6EA8((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21E6B6F20(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_21E6B82B0(a1, a2, a3, &v32);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21E6B82EC();
  if (v8)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    while (1)
    {
      uint64_t v13 = (void *)*a5;
      unint64_t v15 = sub_21E6B7938(v10, v11);
      uint64_t v16 = v13[2];
      BOOL v17 = (v14 & 1) == 0;
      uint64_t v18 = v16 + v17;
      if (__OFADD__(v16, v17)) {
        break;
      }
      char v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D028);
          sub_21E6CB838();
        }
      }
      else
      {
        sub_21E6B733C(v18, a4 & 1);
        unint64_t v20 = sub_21E6B7938(v10, v11);
        if ((v19 & 1) != (v21 & 1)) {
          goto LABEL_17;
        }
        unint64_t v15 = v20;
      }
      uint64_t v22 = (void *)*a5;
      if (v19)
      {
        swift_bridgeObjectRelease();
        uint64_t v23 = v22[7];

        *(void *)(v23 + 8 * v15) = v12;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        uint64_t v24 = (uint64_t *)(v22[6] + 16 * v15);
        *uint64_t v24 = v10;
        v24[1] = v11;
        *(void *)(v22[7] + 8 * v15) = v12;
        uint64_t v25 = v22[2];
        BOOL v26 = __OFADD__(v25, 1);
        uint64_t v27 = v25 + 1;
        if (v26) {
          goto LABEL_16;
        }
        v22[2] = v27;
      }
      sub_21E6B82EC();
      uint64_t v10 = v28;
      uint64_t v11 = v29;
      uint64_t v12 = v30;
      a4 = 1;
      if (!v29) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_21E6CB958();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_21E6B869C();
    return swift_release();
  }
  return result;
}

uint64_t sub_21E6B7120(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_21E6B82B0(a1, a2, a3, &v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21E6B8480(&v27);
  uint64_t v7 = *((void *)&v27 + 1);
  if (!*((void *)&v27 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_21E6B869C();
    return swift_release();
  }
  while (1)
  {
    uint64_t v8 = v27;
    sub_21E6B8700(&v28, v26);
    uint64_t v9 = *a5;
    unint64_t v11 = sub_21E6B7938(v8, v7);
    uint64_t v12 = *(void *)(v9 + 16);
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      break;
    }
    char v15 = v10;
    if (*(void *)(v9 + 24) >= v14)
    {
      if (a4)
      {
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D3D038);
        sub_21E6CB838();
        if (v15) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_21E6B763C(v14, a4 & 1);
      unint64_t v16 = sub_21E6B7938(v8, v7);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_17;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_9:
        sub_21E6B86A4((uint64_t)v26, (uint64_t)v25);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
        swift_bridgeObjectRelease();
        uint64_t v18 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v11);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
        sub_21E6B8700(v25, v18);
        goto LABEL_13;
      }
    }
    char v19 = (void *)*a5;
    *(void *)(*a5 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    unint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *unint64_t v20 = v8;
    v20[1] = v7;
    sub_21E6B8700(v26, (_OWORD *)(v19[7] + 32 * v11));
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_16;
    }
    v19[2] = v23;
LABEL_13:
    sub_21E6B8480(&v27);
    uint64_t v7 = *((void *)&v27 + 1);
    a4 = 1;
    if (!*((void *)&v27 + 1)) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = sub_21E6CB958();
  __break(1u);
  return result;
}

uint64_t sub_21E6B733C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D030);
  char v38 = a2;
  uint64_t v6 = sub_21E6CB858();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    unint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void **)(*(void *)(v5 + 56) + 8 * i);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v24 = v23;
    }
    sub_21E6CB9A8();
    sub_21E6CB728();
    uint64_t result = sub_21E6CB9C8();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t v33 = (void *)(*(void *)(v7 + 48) + 16 * v28);
    *uint64_t v33 = v22;
    v33[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v28) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v36)
    {
      swift_release();
      uint64_t v3 = v35;
      char v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    char v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v37 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v37 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v36)
  {
    unint64_t v18 = *(void *)(v37 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v36) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v37 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v35;
LABEL_34:
  if (v38)
  {
    uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
    if (v34 >= 64) {
      sub_21E6B7A94(0, (unint64_t)(v34 + 63) >> 6, v17);
    }
    else {
      *char v17 = -1 << v34;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_21E6B763C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD35360);
  uint64_t v6 = sub_21E6CB858();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      int64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * i);
      if (a2)
      {
        sub_21E6B8700(v22, v35);
      }
      else
      {
        sub_21E6B86A4((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21E6CB9A8();
      sub_21E6CB728();
      uint64_t result = sub_21E6CB9C8();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          BOOL v29 = v25 == v28;
          if (v25 == v28) {
            unint64_t v25 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      BOOL v31 = (void *)(*(void *)(v7 + 48) + 16 * v26);
      *BOOL v31 = v21;
      v31[1] = v20;
      uint64_t result = (uint64_t)sub_21E6B8700(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v26));
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v16 >= v33) {
        goto LABEL_33;
      }
      unint64_t v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v33) {
          goto LABEL_33;
        }
        unint64_t v17 = v34[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            uint64_t v3 = v2;
            if (a2)
            {
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                sub_21E6B7A94(0, (unint64_t)(v32 + 63) >> 6, v34);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_41;
              }
              if (v13 >= v33) {
                goto LABEL_33;
              }
              unint64_t v17 = v34[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_21E6B7938(uint64_t a1, uint64_t a2)
{
  sub_21E6CB9A8();
  sub_21E6CB728();
  uint64_t v4 = sub_21E6CB9C8();
  return sub_21E6B79B0(a1, a2, v4);
}

unint64_t sub_21E6B79B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E6CB948() & 1) == 0)
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
      while (!v14 && (sub_21E6CB948() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21E6B7A94(uint64_t result, uint64_t a2, void *a3)
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

char *sub_21E6B7AB0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E6B7AD0(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_21E6B7AD0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D058);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_21E6B6CCC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21E6B6D60((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_21E6B7BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_21E6B7938(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D028);
  sub_21E6CB828();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  sub_21E6B7ED4(0, &qword_26AD35378);
  sub_21E6CB848();
  uint64_t *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21E6B7CD0(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_21E6B5F08(a1, a2, a3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E6B7D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_21E6B7DAC(a1, a2, a3);
  uint64_t *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_21E6B7DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_21E6B7938(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D028);
  if ((sub_21E6CB828() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_21E6B7938(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_21E6CB958();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  char v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_21E6B8224(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_21E6B7ED4(uint64_t a1, unint64_t *a2)
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

unint64_t sub_21E6B7F14()
{
  unint64_t result = qword_267D3CFB8;
  if (!qword_267D3CFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3CFB8);
  }
  return result;
}

uint64_t method lookup function for AppSelectionSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppSelectionSignal);
}

uint64_t dispatch thunk of AppSelectionSignal.info.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppSelectionSignal.info.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AppSelectionSignal.info.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AppSelectionSignal.__allocating_init(name:version:timeElapsed:rows:info:signalTiming:test:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppSelectionSignal.merging(otherSignal:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AppSelectionSignal.json()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AppSelectionSignal.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AppSelectionSignal.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t getEnumTagSinglePayload for AppSelectionSignal.ValidationError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AppSelectionSignal.ValidationError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21E6B81E0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21E6B8208()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppSelectionSignal.ValidationError()
{
  return &type metadata for AppSelectionSignal.ValidationError;
}

unint64_t sub_21E6B8224(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_21E6B826C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_21E6B6E60(&v6, *(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16));
  uint64_t v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

uint64_t sub_21E6B82B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

void sub_21E6B82EC()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    char v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    char v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      char v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      unint64_t v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          unint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            unint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            unint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              int64_t v18 = v3 + 6;
              while (v18 < v14)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  unint64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_21E6B8480@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    unint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_21E6B86A4(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  int64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_21E6B8760((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_21E6B87C8((uint64_t)v21, (uint64_t *)&unk_26AD35350);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_21E6B8664@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_21E6B869C()
{
  return swift_release();
}

uint64_t sub_21E6B86A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_21E6B8700(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21E6B8760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D3D048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6B87C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id OUTLINED_FUNCTION_0()
{
  return objc_msgSend(v0, (SEL)(v3 + 2501), v1, v2);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v16 = va_arg(va1, void);
  return MEMORY[0x270FA0260]((uint64_t *)va, va1, v13 + 8, a4, 6);
}

uint64_t OUTLINED_FUNCTION_2@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  return MEMORY[0x270EF2100](v1, v3, v4);
}

__n128 OUTLINED_FUNCTION_3(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __n128 a13)
{
  __n128 result = a13;
  a1[1] = a13;
  a1[2].n128_u64[0] = v16;
  a1[2].n128_u64[1] = v15;
  a1[3].n128_u64[0] = v13;
  a1[3].n128_u64[1] = v14;
  return result;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_beginAccess();
}

uint64_t ConfirmationOffer.parameterName.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t ConfirmationOffer.intentType.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t ConfirmationOffer.multicardinalIndexValue.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t ConfirmationOffer.item.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  sub_21E6B8988(v0, v1);
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_21E6B8988(uint64_t a1, unint64_t a2)
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

uint64_t ConfirmationOffer.timestamp.getter()
{
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return v1(v0);
}

uint64_t ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8)
{
  char v15 = a6 & 1;
  uint64_t v16 = swift_allocObject();
  ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(a1, a2, a3, a4, a5, v15, a7, a8);
  return v16;
}

uint64_t ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8)
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 40) = a4;
  *(void *)(v8 + 48) = a5;
  *(unsigned char *)(v8 + 56) = a6 & 1;
  unint64_t v11 = self;
  __swift_project_boxed_opaque_existential_0Tm(a7, a7[3]);
  v22[0] = 0;
  id v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_21E6CB938(), 0, v22);
  swift_unknownObjectRelease();
  id v13 = v22[0];
  if (v12)
  {
    uint64_t v14 = sub_21E6CB628();
    uint64_t v16 = v15;

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    *(void *)(v8 + 64) = v14;
    *(void *)(v8 + 72) = v16;
    uint64_t v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp;
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, a8);
  }
  else
  {
    int64_t v19 = v13;
    sub_21E6CB5F8();

    swift_willThrow();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t))(v20 + 8))(a8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for ConfirmationOffer();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v8;
}

uint64_t type metadata accessor for ConfirmationOffer()
{
  uint64_t result = qword_267D3D0E8;
  if (!qword_267D3D0E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7)
{
  char v13 = a6 & 1;
  uint64_t v14 = swift_allocObject();
  ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:)(a1, a2, a3, a4, a5, v13, a7);
  return v14;
}

uint64_t ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7)
{
  v30[1] = *(id *)MEMORY[0x263EF8340];
  sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v16;
  uint64_t v29 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_0();
  uint64_t v19 = v18 - v17;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a3;
  *(void *)(v7 + 40) = a4;
  *(void *)(v7 + 48) = a5;
  *(unsigned char *)(v7 + 56) = a6 & 1;
  uint64_t v20 = self;
  __swift_project_boxed_opaque_existential_0Tm(a7, a7[3]);
  v30[0] = 0;
  id v21 = objc_msgSend(v20, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_21E6CB938(), 0, v30);
  swift_unknownObjectRelease();
  id v22 = v30[0];
  if (v21)
  {
    uint64_t v23 = sub_21E6CB628();
    uint64_t v25 = v24;

    *(void *)(v7 + 64) = v23;
    *(void *)(v7 + 72) = v25;
    sub_21E6CB668();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp, v19, v29);
  }
  else
  {
    unint64_t v26 = v22;
    sub_21E6CB5F8();

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for ConfirmationOffer();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v7;
}

BOOL sub_21E6B8F98(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21E6B8FA8()
{
  return sub_21E6CB9B8();
}

uint64_t sub_21E6B8FD0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x800000021E6CDFE0 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 1835365481 && a2 == 0xE400000000000000;
      if (v7 || (sub_21E6CB948() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_21E6CB948();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

uint64_t sub_21E6B91DC()
{
  return 5;
}

uint64_t sub_21E6B91E4()
{
  return sub_21E6CB9C8();
}

uint64_t sub_21E6B922C()
{
  return 0;
}

unint64_t sub_21E6B9238(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7954746E65746E69;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 1835365481;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    default:
      unint64_t result = 0x6574656D61726170;
      break;
  }
  return result;
}

BOOL sub_21E6B92F8(char *a1, char *a2)
{
  return sub_21E6B8F98(*a1, *a2);
}

uint64_t sub_21E6B9304()
{
  return sub_21E6B91E4();
}

uint64_t sub_21E6B930C()
{
  return sub_21E6B8FA8();
}

uint64_t sub_21E6B9314()
{
  return sub_21E6CB9C8();
}

unint64_t sub_21E6B9358()
{
  return sub_21E6B9238(*v0);
}

uint64_t sub_21E6B9360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6B8FD0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6B9388()
{
  return sub_21E6B922C();
}

uint64_t sub_21E6B93A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6B91DC();
  *a1 = result;
  return result;
}

uint64_t sub_21E6B93D0(uint64_t a1)
{
  unint64_t v2 = sub_21E6B9774();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6B940C(uint64_t a1)
{
  unint64_t v2 = sub_21E6B9774();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConfirmationOffer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E6B94BC(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t sub_21E6B94BC(uint64_t a1, unint64_t a2)
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

uint64_t ConfirmationOffer.__deallocating_deinit()
{
  ConfirmationOffer.deinit();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_21E6B954C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D0C0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6B9774();
  sub_21E6CB9E8();
  sub_21E6CB908();
  if (!v1)
  {
    OUTLINED_FUNCTION_7(1);
    sub_21E6CB908();
    OUTLINED_FUNCTION_7(2);
    sub_21E6CB8E8();
    sub_21E6B97C0();
    sub_21E6CB918();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void *__swift_project_boxed_opaque_existential_0Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21E6B9774()
{
  unint64_t result = qword_267D3D0C8;
  if (!qword_267D3D0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D0C8);
  }
  return result;
}

unint64_t sub_21E6B97C0()
{
  unint64_t result = qword_26AD352E0;
  if (!qword_26AD352E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD352E0);
  }
  return result;
}

uint64_t ConfirmationOffer.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  ConfirmationOffer.init(from:)(a1);
  return v2;
}

uint64_t ConfirmationOffer.init(from:)(void *a1)
{
  sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D0D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6B9774();
  sub_21E6CB9D8();
  if (v1)
  {
    uint64_t v10 = v18;
    type metadata accessor for ConfirmationOffer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v16 = v7;
    LOBYTE(v19) = 0;
    uint64_t v10 = v18;
    *(void *)(v18 + 16) = sub_21E6CB8B8();
    *(void *)(v18 + 24) = v11;
    OUTLINED_FUNCTION_8(1);
    *(void *)(v18 + 32) = sub_21E6CB8B8();
    *(void *)(v18 + 40) = v12;
    OUTLINED_FUNCTION_8(2);
    *(void *)(v18 + 48) = sub_21E6CB898();
    *(unsigned char *)(v18 + 56) = v13 & 1;
    sub_21E6B9B98();
    sub_21E6CB8C8();
    *(_OWORD *)(v18 + 64) = v19;
    sub_21E6B9BE4(&qword_267D3D0E0);
    sub_21E6CB8C8();
    uint64_t v14 = OUTLINED_FUNCTION_6_0();
    v15(v14);
    (*(void (**)(uint64_t, uint64_t, void))(v17 + 32))(v18 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp, v16, 0);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v10;
}

unint64_t sub_21E6B9B98()
{
  unint64_t result = qword_267D3D0D8;
  if (!qword_267D3D0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D0D8);
  }
  return result;
}

uint64_t sub_21E6B9BE4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_21E6CB678();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E6B9C28@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = ConfirmationOffer.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_21E6B9C54(void *a1)
{
  return sub_21E6B954C(a1);
}

uint64_t sub_21E6B9C78()
{
  return type metadata accessor for ConfirmationOffer();
}

uint64_t sub_21E6B9C80()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ConfirmationOffer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfirmationOffer);
}

uint64_t dispatch thunk of ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationOffer.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ConfirmationOffer.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ConfirmationOffer.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConfirmationOffer.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x21E6B9F60);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_21E6B9F88(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21E6B9F90(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationOffer.CodingKeys()
{
  return &type metadata for ConfirmationOffer.CodingKeys;
}

unint64_t sub_21E6B9FAC()
{
  unint64_t result = qword_267D3D0F8;
  if (!qword_267D3D0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D0F8);
  }
  return result;
}

unint64_t sub_21E6B9FFC()
{
  unint64_t result = qword_267D3D100;
  if (!qword_267D3D100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D100);
  }
  return result;
}

unint64_t sub_21E6BA04C()
{
  unint64_t result = qword_267D3D108;
  if (!qword_267D3D108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D108);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

void OUTLINED_FUNCTION_7(char a1@<W8>)
{
  *(unsigned char *)(v1 - 80) = a1;
}

uint64_t OUTLINED_FUNCTION_8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_21E6BA150()
{
  uint64_t v0 = sub_21E6CB878();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_21E6BA1A8(char a1)
{
  if (a1) {
    return 0x65756C6176;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_21E6BA1D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21E6BFFFC(*a1, *a2);
}

uint64_t sub_21E6BA1E0()
{
  return sub_21E6C05E4();
}

uint64_t sub_21E6BA1E8(uint64_t a1)
{
  return sub_21E6C069C(a1, *v1);
}

uint64_t sub_21E6BA1F0(uint64_t a1)
{
  return sub_21E6C0B50(a1, *v1);
}

uint64_t sub_21E6BA1F8()
{
  unint64_t v0 = sub_21E6CB878();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_21E6BA244()
{
  return sub_21E6CB9B8();
}

uint64_t sub_21E6BA26C()
{
  return sub_21E6CB9C8();
}

uint64_t sub_21E6BA2B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6BA150();
  *a1 = result;
  return result;
}

uint64_t sub_21E6BA2E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E6BA1A8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21E6BA30C()
{
  return sub_21E6BA1A8(*v0);
}

uint64_t sub_21E6BA314@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6BA1A4();
  *a1 = result;
  return result;
}

void sub_21E6BA33C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21E6BA348(uint64_t a1)
{
  unint64_t v2 = sub_21E6BA598();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6BA384(uint64_t a1)
{
  unint64_t v2 = sub_21E6BA598();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ConfirmationResolution.encode(to:)()
{
  OUTLINED_FUNCTION_6_1();
  int v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D110);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *v0;
  unint64_t v6 = v0[1];
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_21E6BA598();
  sub_21E6CB9E8();
  unint64_t v7 = v6 >> 60;
  if (v6 >> 60 == 7 || v7 == 11 || v7 == 15)
  {
    OUTLINED_FUNCTION_16();
    sub_21E6CB908();
    uint64_t v8 = OUTLINED_FUNCTION_12();
    v9(v8);
  }
  else
  {
    sub_21E6B8988(v5, v6);
    sub_21E6B97C0();
    sub_21E6CB918();
    if (!v1)
    {
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_8_0();
    }
    uint64_t v10 = OUTLINED_FUNCTION_12();
    v11(v10);
    sub_21E6BA5E4(v5, v6);
  }
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_21E6BA598()
{
  unint64_t result = qword_267D3D118;
  if (!qword_267D3D118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D118);
  }
  return result;
}

uint64_t sub_21E6BA5E4(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 60) > 0xF || ((1 << (a2 >> 60)) & 0x8880) == 0) {
    return sub_21E6B94BC(a1, a2);
  }
  return a1;
}

void ConfirmationResolution.init(from:)()
{
  OUTLINED_FUNCTION_6_1();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D120);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_21E6BA598();
  sub_21E6CB9D8();
  if (!v0)
  {
    LOBYTE(v17) = 0;
    sub_21E6CB8B8();
    switch(sub_21E6BA1F8())
    {
      case 1u:
        uint64_t v11 = OUTLINED_FUNCTION_1_1();
        v12(v11);
        long long v10 = xmmword_21E6CC200;
        goto LABEL_7;
      case 2u:
        uint64_t v13 = OUTLINED_FUNCTION_1_1();
        v14(v13);
        long long v10 = xmmword_21E6CC1F0;
        goto LABEL_7;
      case 3u:
        uint64_t v15 = OUTLINED_FUNCTION_1_1();
        v16(v15);
        long long v10 = xmmword_21E6CC1E0;
        goto LABEL_7;
      case 4u:
        sub_21E6BA804();
        swift_allocError();
        swift_willThrow();
        uint64_t v6 = OUTLINED_FUNCTION_1_1();
        v7(v6);
        break;
      default:
        sub_21E6B9B98();
        sub_21E6CB8C8();
        uint64_t v8 = OUTLINED_FUNCTION_1_1();
        v9(v8);
        long long v10 = v17;
LABEL_7:
        *uint64_t v4 = v10;
        break;
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_21E6BA804()
{
  unint64_t result = qword_267D3D128;
  if (!qword_267D3D128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D128);
  }
  return result;
}

void sub_21E6BA850()
{
}

void sub_21E6BA868()
{
}

uint64_t ConfirmationResult.parameterName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationResult.multicardinalIndexValue.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t ConfirmationResult.intentType.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationResult.resolution.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  unint64_t v3 = *(void *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_21E6BA8F8(v2, v3);
}

uint64_t sub_21E6BA8F8(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 60) > 0xF || ((1 << (a2 >> 60)) & 0x8880) == 0) {
    return sub_21E6B8988(a1, a2);
  }
  return a1;
}

uint64_t ConfirmationResult.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _OWORD *a7)
{
  OUTLINED_FUNCTION_9();
  char v14 = v13 & 1;
  uint64_t v15 = swift_allocObject();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(a1, a2, a3, a4, a5, v14, a7);
  return v15;
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _OWORD *a7)
{
  OUTLINED_FUNCTION_13();
  uint64_t v14 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2_0();
  uint64_t v20 = v19 - v18;
  *(void *)(v7 + 16) = v12;
  *(void *)(v7 + 24) = v11;
  *(void *)(v7 + 48) = v10;
  *(void *)(v7 + 56) = v9;
  *(void *)(v7 + 32) = v8;
  *(unsigned char *)(v7 + 40) = a6 & 1;
  *(_OWORD *)(v7 + 64) = *a7;
  sub_21E6CB668();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp, v20, v14);
  return v7;
}

void ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_9();
  char v13 = v12 & 1;
  swift_allocObject();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)(v11, v9, v7, v5, v3, v13, v1);
  OUTLINED_FUNCTION_7_0();
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7)
{
  v30[1] = *(id *)MEMORY[0x263EF8340];
  sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v16;
  uint64_t v29 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_0();
  uint64_t v19 = v18 - v17;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 48) = a3;
  *(void *)(v7 + 56) = a4;
  *(void *)(v7 + 32) = a5;
  *(unsigned char *)(v7 + 40) = a6 & 1;
  uint64_t v20 = self;
  __swift_project_boxed_opaque_existential_0Tm(a7, a7[3]);
  v30[0] = 0;
  id v21 = objc_msgSend(v20, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_21E6CB938(), 0, v30);
  swift_unknownObjectRelease();
  id v22 = v30[0];
  if (v21)
  {
    uint64_t v23 = sub_21E6CB628();
    uint64_t v25 = v24;

    *(void *)(v7 + 64) = v23;
    *(void *)(v7 + 72) = v25;
    sub_21E6CB668();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp, v19, v29);
  }
  else
  {
    unint64_t v26 = v22;
    sub_21E6CB5F8();

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for ConfirmationResult();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v7;
}

uint64_t type metadata accessor for ConfirmationResult()
{
  uint64_t result = qword_267D3D158;
  if (!qword_267D3D158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9();
  char v16 = v15 & 1;
  uint64_t v17 = swift_allocObject();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(v12, v11, v10, v9, v8, v16, a7, a8);
  return v17;
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(a1, a2, a3, a4, a5, a6);
  *(_OWORD *)(v8 + 64) = *v10;
  uint64_t v11 = v8 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, a8);
  return v8;
}

void ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_9();
  char v15 = v14 & 1;
  swift_allocObject();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)(v13, v11, v9, v7, v5, v15, v3, v1);
  OUTLINED_FUNCTION_7_0();
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8)
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_11(a1, a2, a3, a4, a5, a6);
  uint64_t v11 = self;
  __swift_project_boxed_opaque_existential_0Tm(a7, a7[3]);
  v22[0] = 0;
  id v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_21E6CB938(), 0, v22);
  swift_unknownObjectRelease();
  id v13 = v22[0];
  if (v12)
  {
    uint64_t v14 = sub_21E6CB628();
    uint64_t v16 = v15;

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    *(void *)(v8 + 64) = v14;
    *(void *)(v8 + 72) = v16;
    uint64_t v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, a8);
  }
  else
  {
    uint64_t v19 = v13;
    sub_21E6CB5F8();

    swift_willThrow();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t))(v20 + 8))(a8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for ConfirmationResult();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v8;
}

uint64_t sub_21E6BB10C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000021E6CDFE0 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6974756C6F736572 && a2 == 0xEA00000000006E6FLL;
      if (v7 || (sub_21E6CB948() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_21E6CB948();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

unint64_t sub_21E6BB32C(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x7954746E65746E69;
      break;
    case 3:
      unint64_t result = 0x6974756C6F736572;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    default:
      unint64_t result = 0x6574656D61726170;
      break;
  }
  return result;
}

unint64_t sub_21E6BB3FC()
{
  return sub_21E6BB32C(*v0);
}

uint64_t sub_21E6BB404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6BB10C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6BB42C(uint64_t a1)
{
  unint64_t v2 = sub_21E6BB734();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6BB468(uint64_t a1)
{
  unint64_t v2 = sub_21E6BB734();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConfirmationResult.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E6BA5E4(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t ConfirmationResult.__deallocating_deinit()
{
  ConfirmationResult.deinit();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_21E6BB550(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D130);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6BB734();
  sub_21E6CB9E8();
  OUTLINED_FUNCTION_8_0();
  if (!v1)
  {
    sub_21E6CB8E8();
    OUTLINED_FUNCTION_8_0();
    sub_21E6BB780();
    sub_21E6CB918();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_21E6BB734()
{
  unint64_t result = qword_267D3D138;
  if (!qword_267D3D138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D138);
  }
  return result;
}

unint64_t sub_21E6BB780()
{
  unint64_t result = qword_267D3D140;
  if (!qword_267D3D140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D140);
  }
  return result;
}

uint64_t ConfirmationResult.__allocating_init(from:)()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_allocObject();
  ConfirmationResult.init(from:)();
  return v0;
}

void ConfirmationResult.init(from:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v17 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D148);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_21E6BB734();
  sub_21E6CB9D8();
  if (v1)
  {
    type metadata accessor for ConfirmationResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v18) = 0;
    *(void *)(v17 + 16) = sub_21E6CB8B8();
    *(void *)(v17 + 24) = v11;
    OUTLINED_FUNCTION_14(1);
    *(void *)(v17 + 32) = sub_21E6CB898();
    *(unsigned char *)(v17 + 40) = v12 & 1;
    OUTLINED_FUNCTION_14(2);
    *(void *)(v17 + 48) = sub_21E6CB8B8();
    *(void *)(v17 + 56) = v13;
    sub_21E6BBB40();
    sub_21E6CB8C8();
    *(_OWORD *)(v17 + 64) = v18;
    sub_21E6B9BE4(&qword_267D3D0E0);
    sub_21E6CB8C8();
    uint64_t v14 = OUTLINED_FUNCTION_6_0();
    v15(v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v17 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp, v9, v4);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_21E6BBB40()
{
  unint64_t result = qword_267D3D150;
  if (!qword_267D3D150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D150);
  }
  return result;
}

uint64_t sub_21E6BBB8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ConfirmationResult.__allocating_init(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E6BBBB8(void *a1)
{
  return sub_21E6BB550(a1);
}

uint64_t *destroy for ConfirmationResolution(uint64_t *result)
{
  unint64_t v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0) {
    return (uint64_t *)sub_21E6B94BC(*result, v1);
  }
  return result;
}

uint64_t _s16SiriIntentEvents22ConfirmationResolutionOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a2[1];
  if ((v3 & 0x3000000000000000) != 0)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v4 = *a2;
    sub_21E6B8988(*a2, a2[1]);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t *assignWithCopy for ConfirmationResolution(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = a2[1];
  uint64_t v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      uint64_t v9 = *a2;
      sub_21E6B8988(v9, v5);
      uint64_t v10 = *a1;
      unint64_t v11 = a1[1];
      *a1 = v9;
      a1[1] = v5;
      sub_21E6B94BC(v10, v11);
      return a1;
    }
    sub_21E6B94BC(*a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v7 = *a2;
  sub_21E6B8988(v7, v5);
  *a1 = v7;
  a1[1] = v5;
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for ConfirmationResolution(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    uint64_t v5 = a2[1];
    if ((v5 & 0x3000000000000000) == 0)
    {
      uint64_t v7 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_21E6B94BC(v7, v4);
      return a1;
    }
    sub_21E6B94BC(*a1, v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationResolution(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xA && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 10);
  }
  uint64_t v3 = *(void *)(a1 + 8) >> 60;
  if (((4 * v3) & 0xC) != 0) {
    unsigned int v4 = 16 - ((4 * v3) & 0xC | (v3 >> 2));
  }
  else {
    unsigned int v4 = 0;
  }
  if (v4 >= 4) {
    return v4 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationResolution(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 10;
    if (a3 >= 0xA) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xA) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (13 - a2)) | ((13 - a2) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_21E6BBE04(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 60;
  if (((4 * v1) & 0xC) != 0) {
    return 16 - ((4 * v1) & 0xC | (v1 >> 2));
  }
  else {
    return 0;
  }
}

void *sub_21E6BBE2C(void *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    *__n128 result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *__n128 result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

void type metadata accessor for ConfirmationResolution()
{
}

uint64_t sub_21E6BBE68()
{
  return type metadata accessor for ConfirmationResult();
}

uint64_t sub_21E6BBE70()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ConfirmationResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfirmationResult);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 136))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 144))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

unsigned char *storeEnumTagSinglePayload for ConfirmationResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x21E6BC0ECLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationResult.CodingKeys()
{
  return &type metadata for ConfirmationResult.CodingKeys;
}

unsigned char *sub_21E6BC124(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21E6BC1C0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for ConfirmationResolution.DecoderError()
{
}

uint64_t getEnumTagSinglePayload for CustomSignalSource(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_21E6BC27C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6BC348);
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

unsigned char *sub_21E6BC370(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for ConfirmationResolution.CodingKeys()
{
}

unint64_t sub_21E6BC38C()
{
  unint64_t result = qword_267D3D168;
  if (!qword_267D3D168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D168);
  }
  return result;
}

unint64_t sub_21E6BC3DC()
{
  unint64_t result = qword_267D3D170;
  if (!qword_267D3D170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D170);
  }
  return result;
}

unint64_t sub_21E6BC42C()
{
  unint64_t result = qword_267D3D178;
  if (!qword_267D3D178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D178);
  }
  return result;
}

unint64_t sub_21E6BC47C()
{
  unint64_t result = qword_267D3D180;
  if (!qword_267D3D180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D180);
  }
  return result;
}

unint64_t sub_21E6BC4CC()
{
  unint64_t result = qword_267D3D188;
  if (!qword_267D3D188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D188);
  }
  return result;
}

unint64_t sub_21E6BC51C()
{
  unint64_t result = qword_267D3D190;
  if (!qword_267D3D190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D190);
  }
  return result;
}

unint64_t sub_21E6BC56C()
{
  unint64_t result = qword_267D3D198;
  if (!qword_267D3D198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D198);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_21E6CB908();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(void *)(v6 + 16) = result;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 48) = a3;
  *(void *)(v6 + 56) = a4;
  *(void *)(v6 + 32) = a5;
  *(unsigned char *)(v6 + 40) = a6 & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_16()
{
  *(unsigned char *)(v0 - 96) = 0;
}

void CustomSignal.signalType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t CustomSignal.turnId.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

void CustomSignal.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

uint64_t CustomSignal.resultCandidateId.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t CustomSignal.item.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  sub_21E6B8988(v0, v1);
  return OUTLINED_FUNCTION_5_0();
}

uint64_t CustomSignal.timestamp.getter()
{
  type metadata accessor for CustomSignal();
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return v1(v0);
}

uint64_t type metadata accessor for CustomSignal()
{
  uint64_t result = qword_26AD35570;
  if (!qword_26AD35570) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CustomSignal.init(signalType:item:timestamp:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v16[1] = *(id *)MEMORY[0x263EF8340];
  *(unsigned char *)a4 = *a1;
  v16[0] = 0;
  id v6 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a2, 1, v16);
  id v7 = v16[0];
  if (v6)
  {
    uint64_t v8 = sub_21E6CB628();
    uint64_t v10 = v9;

    swift_unknownObjectRelease();
    *(void *)(a4 + 48) = v8;
    *(void *)(a4 + 56) = v10;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 32) = 0;
    *(void *)(a4 + 40) = 0;
    *(unsigned char *)(a4 + 24) = 2;
    uint64_t v11 = a4 + *(int *)(type metadata accessor for CustomSignal() + 36);
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 32))(v11, a3);
  }
  else
  {
    uint64_t v14 = v7;
    sub_21E6CB5F8();

    swift_willThrow();
    swift_unknownObjectRelease();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    return (*(uint64_t (**)(uint64_t))(v15 + 8))(a3);
  }
}

uint64_t CustomSignal.init(signalType:item:turnId:resultCandidateId:source:timestamp:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  v27[1] = *(id *)MEMORY[0x263EF8340];
  char v25 = *a7;
  *(unsigned char *)a9 = *a1;
  v27[0] = 0;
  id v14 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a2, 1, v27);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = v27[0];
    uint64_t v17 = sub_21E6CB628();
    uint64_t v19 = v18;

    swift_unknownObjectRelease();
    *(void *)(a9 + 48) = v17;
    *(void *)(a9 + 56) = v19;
    *(void *)(a9 + 8) = a3;
    *(void *)(a9 + 16) = a4;
    *(void *)(a9 + 32) = a5;
    *(void *)(a9 + 40) = a6;
    *(unsigned char *)(a9 + 24) = v25;
    uint64_t v20 = a9 + *(int *)(type metadata accessor for CustomSignal() + 36);
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(v20, a8);
  }
  else
  {
    id v23 = v27[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21E6CB5F8();

    swift_willThrow();
    swift_unknownObjectRelease();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    return (*(uint64_t (**)(uint64_t))(v24 + 8))(a8);
  }
}

uint64_t CustomSignal.init(signalType:itemData:timestamp:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = *a1;
  *(void *)(a5 + 48) = a2;
  *(void *)(a5 + 56) = a3;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  *(void *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = 0;
  *(unsigned char *)(a5 + 24) = 2;
  uint64_t v6 = a5 + *(int *)(type metadata accessor for CustomSignal() + 36);
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  return v9(v6, a4, v7);
}

uint64_t CustomSignal.init(signalType:itemData:turnId:resultCandidateId:source:timestamp:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  char v9 = *a8;
  *(unsigned char *)a9 = *a1;
  *(void *)(a9 + 48) = a2;
  *(void *)(a9 + 56) = a3;
  *(void *)(a9 + 8) = a4;
  *(void *)(a9 + 16) = a5;
  *(void *)(a9 + 32) = a6;
  *(void *)(a9 + 40) = a7;
  *(unsigned char *)(a9 + 24) = v9;
  type metadata accessor for CustomSignal();
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = OUTLINED_FUNCTION_5_0();
  return v11(v10);
}

uint64_t sub_21E6BCC80(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x79546C616E676973 && a2 == 0xEA00000000006570;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x64496E727574 && a2 == 0xE600000000000000;
    if (v6 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
      if (v7 || (sub_21E6CB948() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x800000021E6CE050 || (sub_21E6CB948() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 1835365481 && a2 == 0xE400000000000000;
        if (v8 || (sub_21E6CB948() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v10 = sub_21E6CB948();
          swift_bridgeObjectRelease();
          if (v10) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_21E6BCEC4()
{
  return 6;
}

unint64_t sub_21E6BCECC(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x64496E727574;
      break;
    case 2:
      unint64_t result = 0x656372756F73;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 1835365481;
      break;
    case 5:
      unint64_t result = 0x6D617473656D6974;
      break;
    default:
      unint64_t result = 0x79546C616E676973;
      break;
  }
  return result;
}

unint64_t sub_21E6BCF94()
{
  return sub_21E6BCECC(*v0);
}

uint64_t sub_21E6BCF9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6BCC80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6BCFC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6BCEC4();
  *a1 = result;
  return result;
}

uint64_t sub_21E6BCFEC(uint64_t a1)
{
  unint64_t v2 = sub_21E6BD268();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6BD028(uint64_t a1)
{
  unint64_t v2 = sub_21E6BD268();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CustomSignal.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD35368);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6BD268();
  sub_21E6CB9E8();
  sub_21E6BD2B4();
  OUTLINED_FUNCTION_7_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_4_1(1);
    sub_21E6BD300();
    sub_21E6CB8F8();
    OUTLINED_FUNCTION_4_1(3);
    sub_21E6B97C0();
    OUTLINED_FUNCTION_7_1();
    type metadata accessor for CustomSignal();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_21E6BD268()
{
  unint64_t result = qword_26AD35308;
  if (!qword_26AD35308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD35308);
  }
  return result;
}

unint64_t sub_21E6BD2B4()
{
  unint64_t result = qword_26AD35318;
  if (!qword_26AD35318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD35318);
  }
  return result;
}

unint64_t sub_21E6BD300()
{
  unint64_t result = qword_26AD35328;
  if (!qword_26AD35328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD35328);
  }
  return result;
}

uint64_t CustomSignal.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v6);
  BOOL v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D1A0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v22 = v9;
  uint64_t v23 = v10;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10();
  uint64_t v11 = type metadata accessor for CustomSignal();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v12);
  uint64_t v24 = a1;
  char v25 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6BD268();
  sub_21E6CB9D8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
  }
  char v27 = 0;
  sub_21E6BD710();
  sub_21E6CB8C8();
  uint64_t v14 = (uint64_t)v25;
  *char v25 = v26;
  *(void *)(v14 + 8) = OUTLINED_FUNCTION_8_1(1);
  *(void *)(v14 + 16) = v15;
  char v27 = 2;
  sub_21E6BD75C();
  OUTLINED_FUNCTION_5_1();
  sub_21E6CB8A8();
  *(unsigned char *)(v14 + 24) = v26;
  *(void *)(v14 + 32) = OUTLINED_FUNCTION_8_1(3);
  *(void *)(v14 + 40) = v16;
  char v27 = 4;
  sub_21E6B9B98();
  OUTLINED_FUNCTION_5_1();
  sub_21E6CB8C8();
  *(_OWORD *)(v14 + 48) = v26;
  LOBYTE(v26) = 5;
  sub_21E6B9BE4(&qword_267D3D0E0);
  sub_21E6CB8C8();
  uint64_t v17 = OUTLINED_FUNCTION_2_1();
  v18(v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v14 + *(int *)(v11 + 36), v8, v4);
  sub_21E6BD7A8(v14, v21);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
  return sub_21E6BD80C(v14);
}

unint64_t sub_21E6BD710()
{
  unint64_t result = qword_267D3D1A8;
  if (!qword_267D3D1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1A8);
  }
  return result;
}

unint64_t sub_21E6BD75C()
{
  unint64_t result = qword_267D3D1B0;
  if (!qword_267D3D1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1B0);
  }
  return result;
}

uint64_t sub_21E6BD7A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CustomSignal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6BD80C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CustomSignal();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E6BD868@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CustomSignal.init(from:)(a1, a2);
}

uint64_t sub_21E6BD880(void *a1)
{
  return CustomSignal.encode(to:)(a1);
}

unsigned char *initializeBufferWithCopyOfBuffer for CustomSignal(unsigned char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (unsigned char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *((void *)v4 + 1) = a2[1];
    *((void *)v4 + 2) = v7;
    v4[24] = *((unsigned char *)a2 + 24);
    uint64_t v8 = a2[5];
    *((void *)v4 + 4) = a2[4];
    *((void *)v4 + 5) = v8;
    uint64_t v9 = a2[6];
    unint64_t v10 = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21E6B8988(v9, v10);
    *((void *)v4 + 6) = v9;
    *((void *)v4 + 7) = v10;
    uint64_t v11 = *(int *)(a3 + 36);
    uint64_t v12 = &v4[v11];
    uint64_t v13 = (uint64_t)a2 + v11;
    uint64_t v14 = sub_21E6CB678();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return v4;
}

uint64_t destroy for CustomSignal(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E6B94BC(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_21E6CB678();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  unint64_t v9 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21E6B8988(v8, v9);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_21E6CB678();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t assignWithCopy for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  unint64_t v7 = *(void *)(a2 + 56);
  sub_21E6B8988(v6, v7);
  uint64_t v8 = *(void *)(a1 + 48);
  unint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  sub_21E6B94BC(v8, v9);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_21E6CB678();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_21E6CB678();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a1 + 48);
  unint64_t v9 = *(void *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_21E6B94BC(v8, v9);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_21E6CB678();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E6BDD4C);
}

uint64_t sub_21E6BDD4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
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
    uint64_t v9 = sub_21E6CB678();
    uint64_t v10 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E6BDE1C);
}

uint64_t sub_21E6BDE1C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = sub_21E6CB678();
    uint64_t v8 = v5 + *(int *)(a4 + 36);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_21E6BDEC4()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CustomSignal.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CustomSignal.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6BE0C8);
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

ValueMetadata *type metadata accessor for CustomSignal.CodingKeys()
{
  return &type metadata for CustomSignal.CodingKeys;
}

unint64_t sub_21E6BE104()
{
  unint64_t result = qword_267D3D1B8;
  if (!qword_267D3D1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1B8);
  }
  return result;
}

unint64_t sub_21E6BE154()
{
  unint64_t result = qword_26AD35300;
  if (!qword_26AD35300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD35300);
  }
  return result;
}

unint64_t sub_21E6BE1A4()
{
  unint64_t result = qword_26AD352F8;
  if (!qword_26AD352F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD352F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_21E6CB8D8();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_21E6CB918();
}

uint64_t OUTLINED_FUNCTION_8_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_21E6CB888();
}

SiriIntentEvents::CustomSignalSource_optional __swiftcall CustomSignalSource.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_21E6CB878();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CustomSignalSource.rawValue.getter()
{
  if (*v0) {
    return 0x746E65696C63;
  }
  else {
    return 0x726576726573;
  }
}

uint64_t sub_21E6BE318(char *a1, char *a2)
{
  return sub_21E6C0088(*a1, *a2);
}

unint64_t sub_21E6BE328()
{
  unint64_t result = qword_267D3D1C0;
  if (!qword_267D3D1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1C0);
  }
  return result;
}

uint64_t sub_21E6BE374()
{
  return sub_21E6C0604();
}

uint64_t sub_21E6BE37C()
{
  return sub_21E6C0700();
}

uint64_t sub_21E6BE384()
{
  return sub_21E6C0AE4();
}

SiriIntentEvents::CustomSignalSource_optional sub_21E6BE38C(Swift::String *a1)
{
  return CustomSignalSource.init(rawValue:)(*a1);
}

uint64_t sub_21E6BE398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CustomSignalSource.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E6BE3C0()
{
  return sub_21E6CB758();
}

uint64_t sub_21E6BE420()
{
  return sub_21E6CB748();
}

unsigned char *storeEnumTagSinglePayload for CustomSignalSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6BE53CLL);
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

ValueMetadata *type metadata accessor for CustomSignalSource()
{
  return &type metadata for CustomSignalSource;
}

unint64_t sub_21E6BE574()
{
  unint64_t result = qword_26AD35330;
  if (!qword_26AD35330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD35330);
  }
  return result;
}

SiriIntentEvents::CustomSignalType_optional __swiftcall CustomSignalType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21E6CB878();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CustomSignalType.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000010;
  if (*v0 == 1) {
    unint64_t v1 = 0x63656C6553707061;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x614C686365657073;
  }
}

uint64_t sub_21E6BE690(unsigned __int8 *a1, char *a2)
{
  return sub_21E6C0100(*a1, *a2);
}

unint64_t sub_21E6BE6A0()
{
  unint64_t result = qword_267D3D1C8;
  if (!qword_267D3D1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1C8);
  }
  return result;
}

uint64_t sub_21E6BE6EC()
{
  return sub_21E6C0610(*v0);
}

uint64_t sub_21E6BE6F4(uint64_t a1)
{
  return sub_21E6C0750(a1, *v1);
}

uint64_t sub_21E6BE6FC(uint64_t a1)
{
  return sub_21E6C0A5C(a1, *v1);
}

SiriIntentEvents::CustomSignalType_optional sub_21E6BE704(Swift::String *a1)
{
  return CustomSignalType.init(rawValue:)(*a1);
}

uint64_t sub_21E6BE710@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CustomSignalType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E6BE738()
{
  return sub_21E6CB758();
}

uint64_t sub_21E6BE798()
{
  return sub_21E6CB748();
}

uint64_t getEnumTagSinglePayload for CustomSignalType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CustomSignalType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6BE93CLL);
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

ValueMetadata *type metadata accessor for CustomSignalType()
{
  return &type metadata for CustomSignalType;
}

unint64_t sub_21E6BE974()
{
  unint64_t result = qword_26AD35320;
  if (!qword_26AD35320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD35320);
  }
  return result;
}

uint64_t DisambiguationOffer.parameterName.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t DisambiguationOffer.intentType.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t DisambiguationOffer.multicardinalIndexValue.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t DisambiguationOffer.disambiguationItems.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  sub_21E6B8988(v0, v1);
  return OUTLINED_FUNCTION_5_0();
}

uint64_t DisambiguationOffer.timestamp.getter()
{
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return v1(v0);
}

uint64_t DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  char v11 = a6 & 1;
  uint64_t v12 = swift_allocObject();
  DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(a1, a2, a3, a4, a5, v11);
  return v12;
}

uint64_t DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  v29[1] = *(id *)MEMORY[0x263EF8340];
  sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v14;
  uint64_t v28 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2_0();
  uint64_t v17 = v16 - v15;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a5;
  *(unsigned char *)(v6 + 56) = a6 & 1;
  uint64_t v18 = self;
  uint64_t v19 = (void *)sub_21E6CB778();
  swift_bridgeObjectRelease();
  v29[0] = 0;
  id v20 = objc_msgSend(v18, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v19, 0, v29);

  id v21 = v29[0];
  if (v20)
  {
    uint64_t v22 = sub_21E6CB628();
    uint64_t v24 = v23;

    *(void *)(v6 + 64) = v22;
    *(void *)(v6 + 72) = v24;
    sub_21E6CB668();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v6 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp, v17, v28);
  }
  else
  {
    char v25 = v21;
    sub_21E6CB5F8();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for DisambiguationOffer();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v6;
}

uint64_t type metadata accessor for DisambiguationOffer()
{
  uint64_t result = qword_267D3D1F0;
  if (!qword_267D3D1F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  char v15 = a6 & 1;
  uint64_t v16 = swift_allocObject();
  DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(a1, a2, a3, a4, a5, v15, a7, a8);
  return v16;
}

uint64_t DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 40) = a4;
  *(void *)(v8 + 48) = a5;
  *(unsigned char *)(v8 + 56) = a6 & 1;
  uint64_t v10 = self;
  char v11 = (void *)sub_21E6CB778();
  swift_bridgeObjectRelease();
  v22[0] = 0;
  id v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 0, v22);

  id v13 = v22[0];
  if (v12)
  {
    uint64_t v14 = sub_21E6CB628();
    uint64_t v16 = v15;

    *(void *)(v8 + 64) = v14;
    *(void *)(v8 + 72) = v16;
    uint64_t v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp;
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, a8);
  }
  else
  {
    uint64_t v19 = v13;
    sub_21E6CB5F8();

    swift_willThrow();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t))(v20 + 8))(a8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for DisambiguationOffer();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v8;
}

uint64_t sub_21E6BEFE8()
{
  sub_21E6CB808();
  sub_21E6CB738();
  swift_bridgeObjectRetain();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6CB738();
  swift_bridgeObjectRetain();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6CB738();
  if ((*(unsigned char *)(v0 + 56) & 1) == 0)
  {
    sub_21E6BF19C();
    sub_21E6CB7F8();
  }
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6CB738();
  uint64_t v2 = *(void *)(v0 + 64);
  unint64_t v1 = *(void *)(v0 + 72);
  sub_21E6B8988(v2, v1);
  sub_21E6CB608();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6B94BC(v2, v1);
  return 0;
}

unint64_t sub_21E6BF19C()
{
  unint64_t result = qword_267D3D1D0;
  if (!qword_267D3D1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1D0);
  }
  return result;
}

uint64_t sub_21E6BF1E8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x800000021E6CDFE0 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000021E6CE120 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      char v8 = sub_21E6CB948();
      swift_bridgeObjectRelease();
      if (v8) {
        return 4;
      }
      else {
        return 5;
      }
    }
  }
}

unint64_t sub_21E6BF408(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7954746E65746E69;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    default:
      unint64_t result = 0x6574656D61726170;
      break;
  }
  return result;
}

unint64_t sub_21E6BF4D8()
{
  return sub_21E6BF408(*v0);
}

uint64_t sub_21E6BF4E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6BF1E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6BF508(uint64_t a1)
{
  unint64_t v2 = sub_21E6BF810();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6BF544(uint64_t a1)
{
  unint64_t v2 = sub_21E6BF810();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DisambiguationOffer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E6B94BC(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t DisambiguationOffer.__deallocating_deinit()
{
  DisambiguationOffer.deinit();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_21E6BF62C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D1D8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6BF810();
  sub_21E6CB9E8();
  sub_21E6CB908();
  if (!v1)
  {
    OUTLINED_FUNCTION_7(1);
    sub_21E6CB908();
    OUTLINED_FUNCTION_7(2);
    sub_21E6CB8E8();
    sub_21E6B97C0();
    sub_21E6CB918();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_21E6BF810()
{
  unint64_t result = qword_267D3D1E0;
  if (!qword_267D3D1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D1E0);
  }
  return result;
}

uint64_t DisambiguationOffer.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  DisambiguationOffer.init(from:)(a1);
  return v2;
}

uint64_t DisambiguationOffer.init(from:)(void *a1)
{
  sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D1E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6BF810();
  sub_21E6CB9D8();
  if (v1)
  {
    uint64_t v10 = v18;
    type metadata accessor for DisambiguationOffer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v16 = v7;
    LOBYTE(v19) = 0;
    uint64_t v10 = v18;
    *(void *)(v18 + 16) = sub_21E6CB8B8();
    *(void *)(v18 + 24) = v11;
    OUTLINED_FUNCTION_8(1);
    *(void *)(v18 + 32) = sub_21E6CB8B8();
    *(void *)(v18 + 40) = v12;
    OUTLINED_FUNCTION_8(2);
    *(void *)(v18 + 48) = sub_21E6CB898();
    *(unsigned char *)(v18 + 56) = v13 & 1;
    sub_21E6B9B98();
    sub_21E6CB8C8();
    *(_OWORD *)(v18 + 64) = v19;
    sub_21E6B9BE4(&qword_267D3D0E0);
    sub_21E6CB8C8();
    uint64_t v14 = OUTLINED_FUNCTION_6_0();
    v15(v14);
    (*(void (**)(uint64_t, uint64_t, void))(v17 + 32))(v18 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp, v16, 0);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v10;
}

uint64_t sub_21E6BFBE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = DisambiguationOffer.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_21E6BFC14(void *a1)
{
  return sub_21E6BF62C(a1);
}

uint64_t sub_21E6BFC38()
{
  return sub_21E6BEFE8();
}

uint64_t sub_21E6BFC5C()
{
  return type metadata accessor for DisambiguationOffer();
}

uint64_t sub_21E6BFC64()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DisambiguationOffer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DisambiguationOffer);
}

uint64_t dispatch thunk of DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationOffer.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DisambiguationOffer.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DisambiguationOffer.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

unsigned char *storeEnumTagSinglePayload for DisambiguationOffer.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x21E6BFED4);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationOffer.CodingKeys()
{
  return &type metadata for DisambiguationOffer.CodingKeys;
}

unint64_t sub_21E6BFF10()
{
  unint64_t result = qword_267D3D200;
  if (!qword_267D3D200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D200);
  }
  return result;
}

unint64_t sub_21E6BFF60()
{
  unint64_t result = qword_267D3D208;
  if (!qword_267D3D208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D208);
  }
  return result;
}

unint64_t sub_21E6BFFB0()
{
  unint64_t result = qword_267D3D210;
  if (!qword_267D3D210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D210);
  }
  return result;
}

uint64_t sub_21E6C0000(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65756C6176;
  }
  else {
    uint64_t v3 = 1701869940;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x65756C6176;
  }
  else {
    uint64_t v5 = 1701869940;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_9_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21E6C0088(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x746E65696C63;
  }
  else {
    uint64_t v2 = 0x726576726573;
  }
  if (a2) {
    uint64_t v3 = 0x746E65696C63;
  }
  else {
    uint64_t v3 = 0x726576726573;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_21E6CB948();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_21E6C0100(unsigned __int8 a1, char a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x63656C6553707061;
    }
    else {
      unint64_t v3 = 0xD000000000000010;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEC0000006E6F6974;
    }
    else {
      unint64_t v4 = 0x800000021E6CDC50;
    }
  }
  else
  {
    unint64_t v3 = 0x614C686365657073;
    unint64_t v4 = 0xED00006563697474;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v5 = 0x63656C6553707061;
    }
    else {
      unint64_t v5 = 0xD000000000000010;
    }
    if (a2 == 1) {
      unint64_t v6 = 0xEC0000006E6F6974;
    }
    else {
      unint64_t v6 = 0x800000021E6CDC50;
    }
  }
  else
  {
    unint64_t v5 = 0x614C686365657073;
    unint64_t v6 = 0xED00006563697474;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_9_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21E6C021C(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 0xD000000000000011;
  uint64_t v4 = 0xD000000000000013;
  unint64_t v5 = (unint64_t)"tentStart";
  unint64_t v6 = 0x800000021E6CDCB0;
  uint64_t v7 = a1;
  char v8 = "confirmationResult";
  uint64_t v9 = "confirmationOffer";
  uint64_t v10 = "disambiguationResult";
  switch(v7)
  {
    case 1:
      unint64_t v6 = 0xEC000000746C7573;
      uint64_t v11 = 0x746E65746E69;
      goto LABEL_9;
    case 2:
      break;
    case 3:
      uint64_t v4 = 0xD000000000000014;
      uint64_t v12 = "disambiguationOffer";
      goto LABEL_7;
    case 4:
      unint64_t v6 = 0x800000021E6CDCF0;
      uint64_t v4 = 0xD000000000000011;
      break;
    case 5:
      uint64_t v4 = 0xD000000000000012;
      uint64_t v12 = "confirmationOffer";
LABEL_7:
      unint64_t v6 = (unint64_t)v12 | 0x8000000000000000;
      break;
    case 6:
      OUTLINED_FUNCTION_20();
      uint64_t v11 = 0x797469746E65;
LABEL_9:
      uint64_t v4 = v11 & 0xFFFFFFFFFFFFLL | 0x6552000000000000;
      break;
    case 7:
      unint64_t v6 = 0xEC0000006C616E67;
      uint64_t v4 = 0x69536D6F74737563;
      break;
    default:
      unint64_t v6 = 0xEB00000000747261;
      uint64_t v4 = 0x7453746E65746E69;
      break;
  }
  uint64_t v13 = v3 + 2;
  unint64_t v14 = v5 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v14 = 0xEC000000746C7573;
      uint64_t v15 = 0x746E65746E69;
      goto LABEL_19;
    case 2:
      break;
    case 3:
      uint64_t v13 = v3 + 3;
      uint64_t v16 = v10 - 32;
      goto LABEL_17;
    case 4:
      unint64_t v14 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      uint64_t v13 = 0xD000000000000011;
      break;
    case 5:
      uint64_t v13 = v3 + 1;
      uint64_t v16 = v8 - 32;
LABEL_17:
      unint64_t v14 = (unint64_t)v16 | 0x8000000000000000;
      break;
    case 6:
      unint64_t v14 = 0xEF6E6F697463656ALL;
      uint64_t v15 = 0x797469746E65;
LABEL_19:
      uint64_t v13 = v15 & 0xFFFFFFFFFFFFLL | 0x6552000000000000;
      break;
    case 7:
      unint64_t v14 = 0xEC0000006C616E67;
      uint64_t v13 = 0x69536D6F74737563;
      break;
    default:
      unint64_t v14 = 0xEB00000000747261;
      uint64_t v13 = 0x7453746E65746E69;
      break;
  }
  if (v4 == v13 && v6 == v14) {
    char v18 = 1;
  }
  else {
    char v18 = OUTLINED_FUNCTION_9_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18 & 1;
}

uint64_t sub_21E6C0484(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x800000021E6CDD40;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      unint64_t v6 = "completedWithinSiri";
      goto LABEL_5;
    case 2:
      unint64_t v6 = "userPunchedOutToApp";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD00000000000001ALL;
      unint64_t v6 = "autoPunchedOutToApp";
LABEL_5:
      unint64_t v3 = (unint64_t)v6 | 0x8000000000000000;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x64656C696166;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000021E6CDD40;
  switch(a2)
  {
    case 1:
      char v8 = "completedWithinSiri";
      goto LABEL_11;
    case 2:
      char v8 = "userPunchedOutToApp";
      goto LABEL_11;
    case 3:
      unint64_t v2 = 0xD00000000000001ALL;
      char v8 = "autoPunchedOutToApp";
LABEL_11:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    case 4:
      unint64_t v7 = 0xE600000000000000;
      unint64_t v2 = 0x64656C696166;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = OUTLINED_FUNCTION_9_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_21E6C05E4()
{
  return sub_21E6C0B54();
}

uint64_t sub_21E6C0604()
{
  return sub_21E6C0AE4();
}

uint64_t sub_21E6C0610(char a1)
{
  return sub_21E6C0A5C(0, a1);
}

uint64_t sub_21E6C061C(uint64_t a1)
{
  return sub_21E6C064C(a1, (void (*)(unsigned char *, uint64_t))sub_21E6C07C4);
}

uint64_t sub_21E6C0634(uint64_t a1)
{
  return sub_21E6C064C(a1, (void (*)(unsigned char *, uint64_t))sub_21E6C0914);
}

uint64_t sub_21E6C064C(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_21E6CB9A8();
  a2(v5, a1);
  return sub_21E6CB9C8();
}

uint64_t sub_21E6C06A0()
{
  sub_21E6CB728();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E6C0700()
{
  sub_21E6CB728();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E6C0750(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_10_0();
  }
  else {
    OUTLINED_FUNCTION_6_2();
  }
  sub_21E6CB728();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E6C07C4(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 6:
      OUTLINED_FUNCTION_20();
      break;
    default:
      break;
  }
  sub_21E6CB728();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E6C0914()
{
  sub_21E6CB728();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E6C09E0(uint64_t a1, uint64_t a2)
{
  return sub_21E6C0A10(a1, a2, (void (*)(unsigned char *, uint64_t))sub_21E6C0914);
}

uint64_t sub_21E6C09F8(uint64_t a1, uint64_t a2)
{
  return sub_21E6C0A10(a1, a2, (void (*)(unsigned char *, uint64_t))sub_21E6C07C4);
}

uint64_t sub_21E6C0A10(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_21E6CB9A8();
  a3(v6, a2);
  return sub_21E6CB9C8();
}

uint64_t sub_21E6C0A5C(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_10_0();
  }
  else {
    OUTLINED_FUNCTION_6_2();
  }
  sub_21E6CB728();
  swift_bridgeObjectRelease();
  return sub_21E6CB9C8();
}

uint64_t sub_21E6C0AE4()
{
  return sub_21E6CB9C8();
}

uint64_t sub_21E6C0B54()
{
  return sub_21E6CB9C8();
}

uint64_t sub_21E6C0BC8()
{
  uint64_t v0 = sub_21E6CB878();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_21E6C0C20()
{
  unint64_t v0 = sub_21E6CB878();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_21E6C0C6C(char *a1, char *a2)
{
  return sub_21E6C0000(*a1, *a2) & 1;
}

uint64_t sub_21E6C0C90()
{
  return sub_21E6C06A0();
}

uint64_t sub_21E6C0CAC()
{
  return sub_21E6C0B54();
}

uint64_t sub_21E6C0CC8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6C0BC8();
  *a1 = result;
  return result;
}

uint64_t sub_21E6C0CF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6C0C1C();
  *a1 = result;
  return result;
}

uint64_t sub_21E6C0D20(uint64_t a1)
{
  unint64_t v2 = sub_21E6C0F80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6C0D5C(uint64_t a1)
{
  unint64_t v2 = sub_21E6C0F80();
  return MEMORY[0x270FA00B8](a1, v2);
}

void DisambiguationResolution.encode(to:)()
{
  OUTLINED_FUNCTION_6_1();
  unint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D218);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10();
  uint64_t v6 = *v0;
  unint64_t v5 = v0[1];
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_21E6C0F80();
  sub_21E6CB9E8();
  uint64_t v7 = (v5 >> 60) & 3;
  if (v7)
  {
    if (v7 != 1)
    {
      sub_21E6CB908();
      uint64_t v10 = OUTLINED_FUNCTION_15_0();
      v11(v10);
      goto LABEL_9;
    }
    sub_21E6B8988(v6, v5 & 0xCFFFFFFFFFFFFFFFLL);
    sub_21E6B97C0();
    OUTLINED_FUNCTION_18();
    if (!v1) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_21E6B8988(v6, v5);
    sub_21E6B97C0();
    OUTLINED_FUNCTION_18();
    if (!v1) {
LABEL_6:
    }
      sub_21E6CB908();
  }
  uint64_t v8 = OUTLINED_FUNCTION_15_0();
  v9(v8);
  sub_21E6C0FCC(v6, v5);
LABEL_9:
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_21E6C0F80()
{
  unint64_t result = qword_267D3D220;
  if (!qword_267D3D220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D220);
  }
  return result;
}

uint64_t sub_21E6C0FCC(uint64_t result, unint64_t a2)
{
  uint64_t v2 = (a2 >> 60) & 3;
  if (v2)
  {
    if (v2 != 1) {
      return result;
    }
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  return sub_21E6B94BC(result, a2);
}

void DisambiguationResolution.init(from:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D228);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v11 = v10 - v9;
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_21E6C0F80();
  sub_21E6CB9D8();
  if (!v0)
  {
    LOBYTE(v21) = 0;
    sub_21E6CB8B8();
    char v12 = sub_21E6C0C20();
    switch(v12)
    {
      case 1:
        sub_21E6B9B98();
        OUTLINED_FUNCTION_11_0();
        uint64_t v17 = OUTLINED_FUNCTION_1_1();
        v18(v17);
        uint64_t v15 = v21;
        uint64_t v16 = v22 | 0x1000000000000000;
        goto LABEL_8;
      case 2:
        uint64_t v19 = OUTLINED_FUNCTION_1_1();
        v20(v19);
        uint64_t v15 = 0;
        uint64_t v16 = 0x2000000000000000;
        goto LABEL_8;
      case 3:
        sub_21E6C11E4();
        swift_allocError();
        swift_willThrow();
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
        break;
      default:
        sub_21E6B9B98();
        OUTLINED_FUNCTION_11_0();
        uint64_t v13 = OUTLINED_FUNCTION_1_1();
        v14(v13);
        uint64_t v15 = v21;
        uint64_t v16 = v22;
LABEL_8:
        *uint64_t v4 = v15;
        v4[1] = v16;
        break;
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_21E6C11E4()
{
  unint64_t result = qword_267D3D230;
  if (!qword_267D3D230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D230);
  }
  return result;
}

void sub_21E6C1230()
{
}

void sub_21E6C1248()
{
}

uint64_t DisambiguationResult.parameterName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DisambiguationResult.multicardinalIndexValue.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t DisambiguationResult.intentType.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DisambiguationResult.resolution.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  unint64_t v3 = *(void *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_21E6C12D8(v2, v3);
}

uint64_t sub_21E6C12D8(uint64_t result, unint64_t a2)
{
  uint64_t v2 = (a2 >> 60) & 3;
  if (v2)
  {
    if (v2 != 1) {
      return result;
    }
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  return sub_21E6B8988(result, a2);
}

uint64_t DisambiguationResult.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _OWORD *a7)
{
  OUTLINED_FUNCTION_9();
  char v14 = v13 & 1;
  uint64_t v15 = swift_allocObject();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(a1, a2, a3, a4, a5, v14, a7);
  return v15;
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _OWORD *a7)
{
  OUTLINED_FUNCTION_13();
  uint64_t v14 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2_0();
  uint64_t v20 = v19 - v18;
  *(void *)(v7 + 16) = v12;
  *(void *)(v7 + 24) = v11;
  *(void *)(v7 + 48) = v10;
  *(void *)(v7 + 56) = v9;
  *(void *)(v7 + 32) = v8;
  *(unsigned char *)(v7 + 40) = a6 & 1;
  *(_OWORD *)(v7 + 64) = *a7;
  sub_21E6CB668();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp, v20, v14);
  return v7;
}

void DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_9();
  char v13 = v12 & 1;
  swift_allocObject();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)(v11, v9, v7, v5, v3, v13, v1);
  OUTLINED_FUNCTION_7_0();
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7)
{
  v30[1] = *(id *)MEMORY[0x263EF8340];
  sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v16;
  uint64_t v29 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_0();
  uint64_t v19 = v18 - v17;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 48) = a3;
  *(void *)(v7 + 56) = a4;
  *(void *)(v7 + 32) = a5;
  *(unsigned char *)(v7 + 40) = a6 & 1;
  uint64_t v20 = self;
  __swift_project_boxed_opaque_existential_0Tm(a7, a7[3]);
  v30[0] = 0;
  id v21 = objc_msgSend(v20, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_21E6CB938(), 0, v30);
  swift_unknownObjectRelease();
  id v22 = v30[0];
  if (v21)
  {
    uint64_t v23 = sub_21E6CB628();
    uint64_t v25 = v24;

    *(void *)(v7 + 64) = v23;
    *(void *)(v7 + 72) = v25;
    sub_21E6CB668();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp, v19, v29);
  }
  else
  {
    long long v26 = v22;
    sub_21E6CB5F8();

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for DisambiguationResult();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v7;
}

uint64_t type metadata accessor for DisambiguationResult()
{
  uint64_t result = qword_267D3D260;
  if (!qword_267D3D260) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9();
  char v16 = v15 & 1;
  uint64_t v17 = swift_allocObject();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(v12, v11, v10, v9, v8, v16, a7, a8);
  return v17;
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(a1, a2, a3, a4, a5, a6);
  *(_OWORD *)(v8 + 64) = *v10;
  uint64_t v11 = v8 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, a8);
  return v8;
}

void DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_9();
  char v15 = v14 & 1;
  swift_allocObject();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)(v13, v11, v9, v7, v5, v15, v3, v1);
  OUTLINED_FUNCTION_7_0();
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8)
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_11(a1, a2, a3, a4, a5, a6);
  uint64_t v11 = self;
  __swift_project_boxed_opaque_existential_0Tm(a7, a7[3]);
  v22[0] = 0;
  id v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_21E6CB938(), 0, v22);
  swift_unknownObjectRelease();
  id v13 = v22[0];
  if (v12)
  {
    uint64_t v14 = sub_21E6CB628();
    uint64_t v16 = v15;

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    *(void *)(v8 + 64) = v14;
    *(void *)(v8 + 72) = v16;
    uint64_t v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, a8);
  }
  else
  {
    uint64_t v19 = v13;
    sub_21E6CB5F8();

    swift_willThrow();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t))(v20 + 8))(a8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for DisambiguationResult();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v8;
}

unint64_t sub_21E6C1AE0(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x7954746E65746E69;
      break;
    case 3:
      unint64_t result = 0x6974756C6F736572;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    default:
      unint64_t result = 0x6574656D61726170;
      break;
  }
  return result;
}

unint64_t sub_21E6C1BB0()
{
  return sub_21E6C1AE0(*v0);
}

uint64_t sub_21E6C1BB8(uint64_t a1)
{
  unint64_t v2 = sub_21E6C1EB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6C1BF4(uint64_t a1)
{
  unint64_t v2 = sub_21E6C1EB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DisambiguationResult.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E6C0FCC(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t DisambiguationResult.__deallocating_deinit()
{
  DisambiguationResult.deinit();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_21E6C1CDC(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D238);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6C1EB8();
  sub_21E6CB9E8();
  sub_21E6CB908();
  if (!v1)
  {
    OUTLINED_FUNCTION_7(1);
    sub_21E6CB8E8();
    OUTLINED_FUNCTION_7(2);
    sub_21E6CB908();
    sub_21E6C1F04();
    sub_21E6CB918();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_21E6C1EB8()
{
  unint64_t result = qword_267D3D240;
  if (!qword_267D3D240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D240);
  }
  return result;
}

unint64_t sub_21E6C1F04()
{
  unint64_t result = qword_267D3D248;
  if (!qword_267D3D248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D248);
  }
  return result;
}

uint64_t DisambiguationResult.__allocating_init(from:)()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_allocObject();
  DisambiguationResult.init(from:)();
  return v0;
}

void DisambiguationResult.init(from:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v17 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D250);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_21E6C1EB8();
  sub_21E6CB9D8();
  if (v1)
  {
    type metadata accessor for DisambiguationResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v18) = 0;
    *(void *)(v17 + 16) = sub_21E6CB8B8();
    *(void *)(v17 + 24) = v11;
    OUTLINED_FUNCTION_14(1);
    *(void *)(v17 + 32) = sub_21E6CB898();
    *(unsigned char *)(v17 + 40) = v12 & 1;
    OUTLINED_FUNCTION_14(2);
    *(void *)(v17 + 48) = sub_21E6CB8B8();
    *(void *)(v17 + 56) = v13;
    sub_21E6C22C4();
    sub_21E6CB8C8();
    *(_OWORD *)(v17 + 64) = v18;
    sub_21E6B9BE4(&qword_267D3D0E0);
    sub_21E6CB8C8();
    uint64_t v14 = OUTLINED_FUNCTION_6_0();
    v15(v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v17 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp, v9, v4);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_21E6C22C4()
{
  unint64_t result = qword_267D3D258;
  if (!qword_267D3D258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D258);
  }
  return result;
}

uint64_t sub_21E6C2310@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DisambiguationResult.__allocating_init(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E6C233C(void *a1)
{
  return sub_21E6C1CDC(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationResolution(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_21E6C12D8(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for DisambiguationResolution(uint64_t a1)
{
  return sub_21E6C0FCC(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for DisambiguationResolution(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_21E6C12D8(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_21E6C0FCC(v5, v6);
  return a1;
}

uint64_t *assignWithTake for DisambiguationResolution(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_21E6C0FCC(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationResolution(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 1 || !*(unsigned char *)(a1 + 16))
    {
      if ((~*(void *)(a1 + 8) & 0x3000000000000000) != 0) {
        int v2 = -1;
      }
      else {
        int v2 = 0;
      }
    }
    else
    {
      int v2 = *(_DWORD *)a1 + 1;
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisambiguationResolution(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(_OWORD *)uint64_t result = xmmword_21E6CCD00;
    }
  }
  return result;
}

uint64_t sub_21E6C24B4(uint64_t a1)
{
  if (((*(void *)(a1 + 8) >> 60) & 2) != 0) {
    return (*(_DWORD *)a1 + 2);
  }
  else {
    return (*(void *)(a1 + 8) >> 60) & 3;
  }
}

uint64_t sub_21E6C24D4(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

void *sub_21E6C24E4(void *result, uint64_t a2)
{
  if (a2 < 2)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *uint64_t result = (a2 - 2);
    result[1] = 0x2000000000000000;
  }
  return result;
}

void type metadata accessor for DisambiguationResolution()
{
}

uint64_t sub_21E6C2518()
{
  return type metadata accessor for DisambiguationResult();
}

uint64_t sub_21E6C2520()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DisambiguationResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DisambiguationResult);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 136))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 144))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

unsigned char *storeEnumTagSinglePayload for DisambiguationResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x21E6C279CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationResult.CodingKeys()
{
  return &type metadata for DisambiguationResult.CodingKeys;
}

unsigned char *sub_21E6C27D4(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21E6C2870);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for DisambiguationResolution.DecoderError()
{
}

unsigned char *sub_21E6C28A4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6C2970);
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

void type metadata accessor for DisambiguationResolution.CodingKeys()
{
}

unint64_t sub_21E6C29A8()
{
  unint64_t result = qword_267D3D270;
  if (!qword_267D3D270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D270);
  }
  return result;
}

unint64_t sub_21E6C29F8()
{
  unint64_t result = qword_267D3D278;
  if (!qword_267D3D278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D278);
  }
  return result;
}

unint64_t sub_21E6C2A48()
{
  unint64_t result = qword_267D3D280;
  if (!qword_267D3D280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D280);
  }
  return result;
}

unint64_t sub_21E6C2A98()
{
  unint64_t result = qword_267D3D288;
  if (!qword_267D3D288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D288);
  }
  return result;
}

unint64_t sub_21E6C2AE8()
{
  unint64_t result = qword_267D3D290;
  if (!qword_267D3D290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D290);
  }
  return result;
}

unint64_t sub_21E6C2B38()
{
  unint64_t result = qword_267D3D298;
  if (!qword_267D3D298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D298);
  }
  return result;
}

unint64_t sub_21E6C2B88()
{
  unint64_t result = qword_267D3D2A0;
  if (!qword_267D3D2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D2A0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_21E6CB948();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_21E6CB8C8();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_21E6CB918();
}

uint64_t EntityRejection.parameterName.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t EntityRejection.intentType.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t EntityRejection.entityType.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t EntityRejection.entityId.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t EntityRejection.bundleId.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t EntityRejection.timestamp.getter()
{
  type metadata accessor for EntityRejection();
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return v1(v0);
}

uint64_t type metadata accessor for EntityRejection()
{
  uint64_t result = qword_26AD35610;
  if (!qword_26AD35610) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EntityRejection.init(parameterName:intentType:entityType:entityId:timestamp:bundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *a9 = a1;
  a9[1] = a2;
  swift_bridgeObjectRetain();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  uint64_t v17 = (char *)a9 + *(int *)(type metadata accessor for EntityRejection() + 36);
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 32))(v17, a10);
  a9[8] = a11;
  a9[9] = a12;
  return result;
}

uint64_t sub_21E6C2F38(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7954797469746E65 && a2 == 0xEA00000000006570;
      if (v7 || (sub_21E6CB948() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
        if (v8 || (sub_21E6CB948() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
          if (v9 || (sub_21E6CB948() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_21E6CB948();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21E6C31B0(char a1)
{
  return *(void *)&aParameteintent[8 * a1];
}

uint64_t sub_21E6C31D0()
{
  return sub_21E6C31B0(*v0);
}

uint64_t sub_21E6C31D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6C2F38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6C3200(uint64_t a1)
{
  unint64_t v2 = sub_21E6C345C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6C323C(uint64_t a1)
{
  unint64_t v2 = sub_21E6C345C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EntityRejection.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D2A8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6C345C();
  sub_21E6CB9E8();
  OUTLINED_FUNCTION_8_0();
  if (!v1)
  {
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_8_0();
    sub_21E6CB8D8();
    type metadata accessor for EntityRejection();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_21E6C345C()
{
  unint64_t result = qword_267D3D2B0;
  if (!qword_267D3D2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D2B0);
  }
  return result;
}

uint64_t EntityRejection.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v23 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D2B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_0();
  uint64_t v11 = type metadata accessor for EntityRejection();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_0();
  uint64_t v25 = (uint64_t *)(v14 - v13);
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6C345C();
  sub_21E6CB9D8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  *uint64_t v25 = OUTLINED_FUNCTION_2_2();
  v25[1] = v15;
  _OWORD v25[2] = OUTLINED_FUNCTION_2_2();
  v25[3] = v16;
  v25[4] = OUTLINED_FUNCTION_2_2();
  v25[5] = v17;
  v25[6] = OUTLINED_FUNCTION_2_2();
  v25[7] = v18;
  v25[8] = sub_21E6CB888();
  v25[9] = v19;
  sub_21E6B9BE4(&qword_267D3D0E0);
  sub_21E6CB8C8();
  uint64_t v20 = OUTLINED_FUNCTION_7_2();
  v21(v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))((char *)v25 + *(int *)(v11 + 36), v9, v4);
  sub_21E6C3888((uint64_t)v25, a2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_21E6C38EC((uint64_t)v25);
}

uint64_t sub_21E6C3888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EntityRejection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6C38EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EntityRejection();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E6C3948@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EntityRejection.init(from:)(a1, a2);
}

uint64_t sub_21E6C3960(void *a1)
{
  return EntityRejection.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for EntityRejection(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v9 = a2[9];
    uint64_t v10 = *(int *)(a3 + 36);
    uint64_t v16 = (char *)a2 + v10;
    uint64_t v11 = (char *)a1 + v10;
    a1[8] = a2[8];
    a1[9] = v9;
    uint64_t v12 = sub_21E6CB678();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v16, v12);
  }
  return v3;
}

uint64_t destroy for EntityRejection(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_21E6CB678();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for EntityRejection(void *a1, void *a2, uint64_t a3)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[9];
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v14 = (char *)a2 + v9;
  uint64_t v10 = (char *)a1 + v9;
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v11 = sub_21E6CB678();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v14, v11);
  return a1;
}

void *assignWithCopy for EntityRejection(void *a1, void *a2, uint64_t a3)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21E6CB678();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for EntityRejection(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21E6CB678();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

void *assignWithTake for EntityRejection(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_21E6CB678();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityRejection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E6C3EC0);
}

uint64_t sub_21E6C3EC0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_21E6CB678();
    uint64_t v9 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for EntityRejection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E6C3F5C);
}

uint64_t sub_21E6C3F5C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_21E6CB678();
    uint64_t v8 = v5 + *(int *)(a4 + 36);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_21E6C3FDC()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EntityRejection.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6C4150);
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

ValueMetadata *type metadata accessor for EntityRejection.CodingKeys()
{
  return &type metadata for EntityRejection.CodingKeys;
}

unint64_t sub_21E6C418C()
{
  unint64_t result = qword_267D3D2C0;
  if (!qword_267D3D2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D2C0);
  }
  return result;
}

unint64_t sub_21E6C41DC()
{
  unint64_t result = qword_267D3D2C8;
  if (!qword_267D3D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D2C8);
  }
  return result;
}

unint64_t sub_21E6C422C()
{
  unint64_t result = qword_267D3D2D0;
  if (!qword_267D3D2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D2D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_21E6CB8B8();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return v0;
}

uint64_t IntentEvent.intentId.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

void IntentEvent.eventType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

uint64_t IntentEvent.eventData.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  sub_21E6B8988(v0, v1);
  return OUTLINED_FUNCTION_5_0();
}

uint64_t IntentEvent.createdAt.getter()
{
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return v1(v0);
}

uint64_t sub_21E6C4390@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = type metadata accessor for IntentEventContent();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD352F0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v16[-v12];
  uint64_t v14 = v1 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content;
  swift_beginAccess();
  sub_21E6C4564(v14, (uint64_t)v13);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v4) == 1)
  {
    sub_21E6C45CC((uint64_t)v13);
    v16[0] = *(unsigned char *)(v1 + 32);
    sub_21E6B8988(*(void *)(v1 + 40), *(void *)(v1 + 48));
    uint64_t result = sub_21E6C7238(v16, (uint64_t)v7);
    if (v2) {
      return result;
    }
    sub_21E6C462C((uint64_t)v7, (uint64_t)v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v4);
    swift_beginAccess();
    sub_21E6C4690((uint64_t)v11, v14);
    swift_endAccess();
  }
  else
  {
    uint64_t v7 = v13;
  }
  return sub_21E6C46F8((uint64_t)v7, a1);
}

uint64_t sub_21E6C4564(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD352F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6C45CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD352F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E6C462C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntentEventContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6C4690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD352F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6C46F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntentEventContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t IntentEvent.__allocating_init(intentId:intentStart:createdAt:)()
{
  return sub_21E6C4FB0();
}

void IntentEvent.init(intentId:intentStart:createdAt:)()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v2);
  *(unsigned char *)(v0 + 32) = 0;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = (void (**)(void))(v3 + 16);
  uint64_t v5 = OUTLINED_FUNCTION_6_3();
  v6(v5);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  OUTLINED_FUNCTION_9_1();
  type metadata accessor for IntentStart();
  uint64_t v7 = sub_21E6C5564(&qword_267D3D2D8, (void (*)(uint64_t))type metadata accessor for IntentStart);
  OUTLINED_FUNCTION_4_2(v7, v8, v9, v10);
  OUTLINED_FUNCTION_19();
  if (v1)
  {
    swift_release();
    uint64_t v13 = *v4;
    OUTLINED_FUNCTION_1_3();
    v13();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v13();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    OUTLINED_FUNCTION_1_3();
    v16();
    swift_release();
    swift_release();
    *(void *)(v0 + 40) = v14;
    *(void *)(v0 + 48) = v15;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t type metadata accessor for IntentEvent()
{
  uint64_t result = qword_26AD35440;
  if (!qword_26AD35440) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t IntentEvent.__allocating_init(intentId:disambiguationOffer:createdAt:)()
{
  return sub_21E6C4FB0();
}

void IntentEvent.init(intentId:disambiguationOffer:createdAt:)()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v2);
  *(unsigned char *)(v0 + 32) = 2;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = (void (**)(void))(v3 + 16);
  uint64_t v5 = OUTLINED_FUNCTION_6_3();
  v6(v5);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  OUTLINED_FUNCTION_9_1();
  type metadata accessor for DisambiguationOffer();
  uint64_t v7 = sub_21E6C5564(&qword_267D3D2E0, (void (*)(uint64_t))type metadata accessor for DisambiguationOffer);
  OUTLINED_FUNCTION_4_2(v7, v8, v9, v10);
  OUTLINED_FUNCTION_19();
  if (v1)
  {
    swift_release();
    uint64_t v13 = *v4;
    OUTLINED_FUNCTION_1_3();
    v13();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v13();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    OUTLINED_FUNCTION_1_3();
    v16();
    swift_release();
    swift_release();
    *(void *)(v0 + 40) = v14;
    *(void *)(v0 + 48) = v15;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t IntentEvent.__allocating_init(intentId:disambiguationResult:createdAt:)()
{
  return sub_21E6C4FB0();
}

void IntentEvent.init(intentId:disambiguationResult:createdAt:)()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v2);
  *(unsigned char *)(v0 + 32) = 3;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = (void (**)(void))(v3 + 16);
  uint64_t v5 = OUTLINED_FUNCTION_6_3();
  v6(v5);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  OUTLINED_FUNCTION_9_1();
  type metadata accessor for DisambiguationResult();
  uint64_t v7 = sub_21E6C5564(&qword_267D3D2E8, (void (*)(uint64_t))type metadata accessor for DisambiguationResult);
  OUTLINED_FUNCTION_4_2(v7, v8, v9, v10);
  OUTLINED_FUNCTION_19();
  if (v1)
  {
    swift_release();
    uint64_t v13 = *v4;
    OUTLINED_FUNCTION_1_3();
    v13();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v13();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    OUTLINED_FUNCTION_1_3();
    v16();
    swift_release();
    swift_release();
    *(void *)(v0 + 40) = v14;
    *(void *)(v0 + 48) = v15;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t IntentEvent.__allocating_init(intentId:confirmationOffer:createdAt:)()
{
  return sub_21E6C4FB0();
}

void IntentEvent.init(intentId:confirmationOffer:createdAt:)()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v2);
  *(unsigned char *)(v0 + 32) = 4;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = (void (**)(void))(v3 + 16);
  uint64_t v5 = OUTLINED_FUNCTION_6_3();
  v6(v5);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  OUTLINED_FUNCTION_9_1();
  type metadata accessor for ConfirmationOffer();
  uint64_t v7 = sub_21E6C5564(&qword_267D3D2F0, (void (*)(uint64_t))type metadata accessor for ConfirmationOffer);
  OUTLINED_FUNCTION_4_2(v7, v8, v9, v10);
  OUTLINED_FUNCTION_19();
  if (v1)
  {
    swift_release();
    uint64_t v13 = *v4;
    OUTLINED_FUNCTION_1_3();
    v13();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v13();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    OUTLINED_FUNCTION_1_3();
    v16();
    swift_release();
    swift_release();
    *(void *)(v0 + 40) = v14;
    *(void *)(v0 + 48) = v15;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t IntentEvent.__allocating_init(intentId:confirmationResult:createdAt:)()
{
  return sub_21E6C4FB0();
}

void IntentEvent.init(intentId:confirmationResult:createdAt:)()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v2);
  *(unsigned char *)(v0 + 32) = 5;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = (void (**)(void))(v3 + 16);
  uint64_t v5 = OUTLINED_FUNCTION_6_3();
  v6(v5);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  OUTLINED_FUNCTION_9_1();
  type metadata accessor for ConfirmationResult();
  uint64_t v7 = sub_21E6C5564(&qword_267D3D2F8, (void (*)(uint64_t))type metadata accessor for ConfirmationResult);
  OUTLINED_FUNCTION_4_2(v7, v8, v9, v10);
  OUTLINED_FUNCTION_19();
  if (v1)
  {
    swift_release();
    uint64_t v13 = *v4;
    OUTLINED_FUNCTION_1_3();
    v13();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v13();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    OUTLINED_FUNCTION_1_3();
    v16();
    swift_release();
    swift_release();
    *(void *)(v0 + 40) = v14;
    *(void *)(v0 + 48) = v15;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t IntentEvent.__allocating_init(intentId:intentResult:createdAt:)()
{
  return sub_21E6C4FB0();
}

uint64_t sub_21E6C4FB0()
{
  OUTLINED_FUNCTION_11_1();
  uint64_t v2 = OUTLINED_FUNCTION_18_0();
  v0(v2);
  return v1;
}

void IntentEvent.init(intentId:intentResult:createdAt:)()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v6 = OUTLINED_FUNCTION_14_0();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  *(void *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v1;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v7 = v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent_createdAt;
  uint64_t v8 = sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = (void (**)(void))(v9 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v3, v8);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  type metadata accessor for IntentResult();
  uint64_t v11 = sub_21E6C5564(&qword_267D3D300, (void (*)(uint64_t))type metadata accessor for IntentResult);
  OUTLINED_FUNCTION_4_2(v11, v12, v13, v14);
  OUTLINED_FUNCTION_19();
  if (v2)
  {
    swift_release();
    uint64_t v17 = *v10;
    OUTLINED_FUNCTION_1_3();
    v17();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v17();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v18 = v15;
    uint64_t v19 = v16;
    OUTLINED_FUNCTION_1_3();
    v20();
    swift_release();
    swift_release();
    *(void *)(v0 + 40) = v18;
    *(void *)(v0 + 48) = v19;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t IntentEvent.__allocating_init(intentId:entityRejection:createdAt:)()
{
  return sub_21E6C5388();
}

void IntentEvent.init(intentId:entityRejection:createdAt:)()
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v3 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v3);
  *(unsigned char *)(v0 + 32) = 6;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10_1();
  uint64_t v5 = v4;
  uint64_t v6 = OUTLINED_FUNCTION_15_1();
  v7(v6);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  type metadata accessor for EntityRejection();
  uint64_t v8 = sub_21E6C5564(&qword_267D3D308, (void (*)(uint64_t))type metadata accessor for EntityRejection);
  uint64_t v9 = OUTLINED_FUNCTION_17(v8);
  if (v1)
  {
    swift_release();
    uint64_t v11 = *(void (**)(void))(v5 + 8);
    OUTLINED_FUNCTION_1_3();
    v11();
    sub_21E6C55AC(v2, (void (*)(void))type metadata accessor for EntityRejection);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v11();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    swift_release();
    OUTLINED_FUNCTION_1_3();
    v14();
    sub_21E6C55AC(v2, (void (*)(void))type metadata accessor for EntityRejection);
    *(void *)(v0 + 40) = v12;
    *(void *)(v0 + 48) = v13;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t IntentEvent.__allocating_init(intentId:customSignal:createdAt:)()
{
  return sub_21E6C5388();
}

uint64_t sub_21E6C5388()
{
  OUTLINED_FUNCTION_11_1();
  uint64_t v2 = OUTLINED_FUNCTION_18_0();
  v0(v2);
  return v1;
}

void IntentEvent.init(intentId:customSignal:createdAt:)()
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v3 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3(v3);
  *(unsigned char *)(v0 + 32) = 7;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10_1();
  uint64_t v5 = v4;
  uint64_t v6 = OUTLINED_FUNCTION_15_1();
  v7(v6);
  sub_21E6CB5E8();
  OUTLINED_FUNCTION_12_0();
  sub_21E6CB5D8();
  type metadata accessor for CustomSignal();
  uint64_t v8 = sub_21E6C5564(&qword_26AD35310, (void (*)(uint64_t))type metadata accessor for CustomSignal);
  uint64_t v9 = OUTLINED_FUNCTION_17(v8);
  if (v1)
  {
    swift_release();
    uint64_t v11 = *(void (**)(void))(v5 + 8);
    OUTLINED_FUNCTION_1_3();
    v11();
    sub_21E6C55AC(v2, (void (*)(void))type metadata accessor for CustomSignal);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_3();
    v11();
    sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_0_1();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    swift_release();
    OUTLINED_FUNCTION_1_3();
    v14();
    sub_21E6C55AC(v2, (void (*)(void))type metadata accessor for CustomSignal);
    *(void *)(v0 + 40) = v12;
    *(void *)(v0 + 48) = v13;
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_21E6C5564(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21E6C55AC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_21E6C5604(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v12 = *a3;
  uint64_t v13 = v6 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content;
  uint64_t v14 = type metadata accessor for IntentEventContent();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(unsigned char *)(v6 + 32) = v12;
  uint64_t v15 = v6 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent_createdAt;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v16 + 32))(v15, a6);
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a5;
  return v6;
}

uint64_t IntentEvent.deinit()
{
  swift_bridgeObjectRelease();
  sub_21E6B94BC(*(void *)(v0 + 40), *(void *)(v0 + 48));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent_createdAt;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  sub_21E6C45CC(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
  return v0;
}

uint64_t IntentEvent.__deallocating_deinit()
{
  IntentEvent.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_21E6C579C()
{
  return type metadata accessor for IntentEvent();
}

void sub_21E6C57A4()
{
  sub_21E6CB678();
  if (v0 <= 0x3F)
  {
    sub_21E6C5A20();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for IntentEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntentEvent);
}

uint64_t dispatch thunk of IntentEvent.content()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:intentStart:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:disambiguationOffer:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:disambiguationResult:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:confirmationOffer:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:confirmationResult:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:intentResult:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:entityRejection:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:customSignal:createdAt:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

void sub_21E6C5A20()
{
  if (!qword_26AD353C0)
  {
    type metadata accessor for IntentEventContent();
    unint64_t v0 = sub_21E6CB7E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD353C0);
    }
  }
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  uint64_t result = __swift_storeEnumTagSinglePayload(v4, 1, 1, a1);
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return MEMORY[0x270EEDEE8](va, v4, a1);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return type metadata accessor for IntentEventContent();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_21E6CB678();
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  return MEMORY[0x270EEDEE8](v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0;
}

void *initializeBufferWithCopyOfBuffer for IntentEventLoggerError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for IntentEventLoggerError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for IntentEventLoggerError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for IntentEventLoggerError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntentEventLoggerError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntentEventLoggerError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntentEventLoggerError()
{
  return &type metadata for IntentEventLoggerError;
}

uint64_t dispatch thunk of IntentEventLogger.log(event:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of IntentEventLogger.log(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t IntentEventStore.init()@<X0>(void *a1@<X8>)
{
  id v2 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(v2, sel_Remembers);
  swift_unknownObjectRelease();
  id v4 = objc_msgSend(v3, sel_Intent);
  uint64_t result = swift_unknownObjectRelease();
  *a1 = v4;
  return result;
}

void static IntentEventStore.temporary()(void *a1@<X8>)
{
  uint64_t v2 = sub_21E6CB6A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E6CB698();
  sub_21E6CB688();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_21E6CB808();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD00000000000001BLL;
  unint64_t v24 = 0x800000021E6CE1D0;
  sub_21E6CB738();
  uint64_t v6 = (void *)sub_21E6CB708();
  swift_bridgeObjectRelease();
  uint64_t v7 = NSTemporaryDirectory();
  uint64_t v8 = sub_21E6CB718();
  unint64_t v10 = v9;

  unint64_t v23 = v8;
  unint64_t v24 = v10;
  sub_21E6CB738();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  uint64_t v11 = v23;
  uint64_t v12 = v24;
  uint64_t v13 = self;
  id v14 = sub_21E6C6F98(v11, v12, v13);
  id v15 = objc_allocWithZone(MEMORY[0x263F2A8F0]);
  id v16 = sub_21E6C6C9C(1886217588, 0xE400000000000000, MEMORY[0x263F8EE78]);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_21E6B7ED4(0, &qword_267D3D310);
    uint64_t v18 = sub_21E6B7ED4(0, &qword_267D3D318);
    id v19 = v6;
    id v20 = v14;
    id v21 = sub_21E6C6140(v19, v18, v20);
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A998]), sel_initWithIdentifier_schema_configuration_, v19, v17, v21);

    *a1 = v22;
  }
  else
  {
    __break(1u);
  }
}

id sub_21E6C6140(void *a1, uint64_t a2, void *a3)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v6 = objc_msgSend(v5, sel_initWithStreamIdentifier_eventClass_storeConfig_, a1, swift_getObjCClassFromMetadata(), a3);

  return v6;
}

void IntentEventStore.log(event:)(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = 0xD000000000000013;
  unint64_t v6 = 0x800000021E6CDCB0;
  switch(*(unsigned char *)(a1 + 32))
  {
    case 1:
      unint64_t v6 = 0xEC000000746C7573;
      uint64_t v7 = 0x746E65746E69;
      goto LABEL_9;
    case 2:
      break;
    case 3:
      unint64_t v5 = 0xD000000000000014;
      uint64_t v8 = "disambiguationResult";
      goto LABEL_7;
    case 4:
      unint64_t v6 = 0x800000021E6CDCF0;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 5:
      unint64_t v5 = 0xD000000000000012;
      uint64_t v8 = "confirmationResult";
LABEL_7:
      unint64_t v6 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    case 6:
      unint64_t v6 = 0xEF6E6F697463656ALL;
      uint64_t v7 = 0x797469746E65;
LABEL_9:
      unint64_t v5 = v7 & 0xFFFFFFFFFFFFLL | 0x6552000000000000;
      break;
    case 7:
      unint64_t v6 = 0xEC0000006C616E67;
      unint64_t v5 = 0x69536D6F74737563;
      break;
    default:
      unint64_t v6 = 0xEB00000000747261;
      unint64_t v5 = 0x7453746E65746E69;
      break;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  unint64_t v10 = *(void *)(a1 + 48);
  id v11 = objc_allocWithZone(MEMORY[0x263F2A3E8]);
  swift_bridgeObjectRetain();
  sub_21E6B8988(v9, v10);
  id v12 = sub_21E6C6D48(v3, v4, v5, v6, v9, v10);
  sub_21E6CB648();
  double v14 = v13;
  id v15 = objc_msgSend(v2, sel_source);
  objc_msgSend(v15, sel_sendEvent_timestamp_, v12, v14);
}

uint64_t IntentEventStore.findEvents(intentId:eventType:startDate:endDate:limit:reversed:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char a8)
{
  uint64_t v36 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD35380);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  id v19 = &v34[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  id v21 = &v34[-v20];
  int v35 = *a3;
  id v22 = *v8;
  if (a7) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = a6;
  }
  sub_21E6C6FF4(a4, (uint64_t)&v34[-v20]);
  sub_21E6C6FF4(a5, (uint64_t)v19);
  id v24 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v25 = sub_21E6C6E30((uint64_t)v21, (uint64_t)v19, v23, 0, a8);
  id v26 = objc_msgSend(v22, sel_publisherWithOptions_, v25);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = MEMORY[0x263F8EE78];
  uint64_t v41 = (void (*)(void *))nullsub_1;
  uint64_t v42 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_21E6C66B8;
  uint64_t v40 = &block_descriptor;
  uint64_t v28 = _Block_copy(&aBlock);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v36;
  *(void *)(v29 + 24) = a2;
  *(unsigned char *)(v29 + 32) = v35;
  *(void *)(v29 + 40) = v27;
  uint64_t v41 = sub_21E6C70EC;
  uint64_t v42 = v29;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_21E6C66B8;
  uint64_t v40 = &block_descriptor_6;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  id v31 = objc_msgSend(v26, sel_sinkWithCompletion_receiveInput_, v28, v30);

  _Block_release(v30);
  _Block_release(v28);

  swift_beginAccess();
  uint64_t v32 = *(void *)(v27 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v32;
}

void sub_21E6C66BC(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = sub_21E6CB678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  double v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = objc_msgSend(a1, sel_eventBody);
  if (!v17)
  {
    if (qword_26AD35340 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_21E6CB6D8();
    __swift_project_value_buffer(v26, (uint64_t)qword_26AD35B30);
    uint64_t v50 = sub_21E6CB6B8();
    os_log_type_t v27 = sub_21E6CB7B8();
    if (os_log_type_enabled(v50, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_21E6B3000, v50, v27, "found BMStoreEvent<BMSiriIntent> with no body", v28, 2u);
      MEMORY[0x223C2F840](v28, -1, -1);
    }
    goto LABEL_11;
  }
  uint64_t v49 = v11;
  uint64_t v50 = v17;
  uint64_t v18 = sub_21E6C7144(v17, (SEL *)&selRef_eventType);
  if (!v19)
  {
LABEL_11:
    uint64_t v29 = v50;

    return;
  }
  uint64_t v20 = v18;
  id v21 = v19;
  uint64_t v22 = sub_21E6C7144(v50, (SEL *)&selRef_intentID);
  if (!v23)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v47 = v22;
  uint64_t v48 = v23;
  uint64_t v24 = sub_21E6C71A4(v50);
  if (v25 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v45 = v24;
  unint64_t v46 = v25;
  if (!a3 || (v47 == a2 ? (BOOL v30 = v48 == a3) : (BOOL v30 = 0), v30 || (sub_21E6CB948() & 1) != 0))
  {
    id v31 = (void *)(a5 + 16);
    uint64_t v32 = 0xD000000000000013;
    unint64_t v33 = 0x800000021E6CDCB0;
    switch(a4)
    {
      case 1:
        unint64_t v33 = 0xEC000000746C7573;
        uint64_t v34 = 0x746E65746E69;
        goto LABEL_28;
      case 2:
        goto LABEL_30;
      case 3:
        uint64_t v32 = 0xD000000000000014;
        int v35 = "disambiguationResult";
        goto LABEL_26;
      case 4:
        unint64_t v33 = 0x800000021E6CDCF0;
        uint64_t v32 = 0xD000000000000011;
        goto LABEL_30;
      case 5:
        uint64_t v32 = 0xD000000000000012;
        int v35 = "confirmationResult";
LABEL_26:
        unint64_t v33 = (unint64_t)(v35 - 32) | 0x8000000000000000;
        goto LABEL_30;
      case 6:
        unint64_t v33 = 0xEF6E6F697463656ALL;
        uint64_t v34 = 0x797469746E65;
LABEL_28:
        uint64_t v32 = v34 & 0xFFFFFFFFFFFFLL | 0x6552000000000000;
        goto LABEL_30;
      case 7:
        unint64_t v33 = 0xEC0000006C616E67;
        uint64_t v32 = 0x69536D6F74737563;
        goto LABEL_30;
      case 8:
        goto LABEL_39;
      default:
        unint64_t v33 = 0xEB00000000747261;
        uint64_t v32 = 0x7453746E65746E69;
LABEL_30:
        if (v32 == v20 && v33 == (void)v21)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v37 = sub_21E6CB948();
          swift_bridgeObjectRelease();
          if ((v37 & 1) == 0) {
            goto LABEL_35;
          }
        }
LABEL_39:
        v38._countAndFlagsBits = v20;
        v38._object = v21;
        IntentEventType.init(rawValue:)(v38);
        char v39 = v51[0];
        if (v51[0] == 8)
        {
          sub_21E6C7208(v45, v46);

          swift_bridgeObjectRelease();
        }
        else
        {
          objc_msgSend(a1, sel_timestamp);
          sub_21E6CB638();
          v51[0] = v39;
          uint64_t v40 = v49;
          (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v14, v16, v10);
          type metadata accessor for IntentEvent();
          swift_allocObject();
          uint64_t v42 = v45;
          unint64_t v41 = v46;
          sub_21E6C5604(v47, v48, v51, v45, v46, (uint64_t)v14);
          swift_beginAccess();
          sub_21E6C721C(v42, v41);
          uint64_t v43 = swift_retain();
          MEMORY[0x223C2F1D0](v43);
          sub_21E6C6F6C(*(void *)((*v31 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_21E6CB7A8();
          sub_21E6CB788();
          swift_endAccess();
          swift_release();

          sub_21E6C7208(v42, v41);
          (*(void (**)(char *, uint64_t))(v40 + 8))(v16, v10);
        }
        break;
    }
  }
  else
  {
LABEL_35:
    sub_21E6C7208(v45, v46);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_21E6C6C34(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_21E6C6C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2)
  {
    unint64_t v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v6 = 0;
    goto LABEL_6;
  }
  unint64_t v5 = (void *)sub_21E6CB708();
  swift_bridgeObjectRelease();
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_21E6B7ED4(0, &qword_267D3D320);
  unint64_t v6 = (void *)sub_21E6CB778();
  swift_bridgeObjectRelease();
LABEL_6:
  id v7 = objc_msgSend(v3, sel_initWithTableName_columns_, v5, v6);

  return v7;
}

id sub_21E6C6D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2)
  {
    uint64_t v10 = (void *)sub_21E6CB708();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      uint64_t v11 = (void *)sub_21E6CB708();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  if (a6 >> 60 == 15)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = (void *)sub_21E6CB618();
    sub_21E6C7208(a5, a6);
  }
  id v13 = objc_msgSend(v6, sel_initWithIntentID_eventType_eventData_, v10, v11, v12);

  return v13;
}

id sub_21E6C6E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = sub_21E6CB678();
  id v13 = 0;
  if (__swift_getEnumTagSinglePayload(a1, 1, v12) != 1)
  {
    id v13 = (void *)sub_21E6CB658();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  if (__swift_getEnumTagSinglePayload(a2, 1, v12) == 1)
  {
    double v14 = 0;
  }
  else
  {
    double v14 = (void *)sub_21E6CB658();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
  }
  id v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_21E6C6F6C(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

id sub_21E6C6F98(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)sub_21E6CB708();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(a3, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v4);

  return v5;
}

uint64_t sub_21E6C6FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD35380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E6C705C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21E6C70AC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21E6C70EC(void *a1)
{
  sub_21E6C66BC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40));
}

ValueMetadata *type metadata accessor for IntentEventStore()
{
  return &type metadata for IntentEventStore;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21E6C7144(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_21E6CB718();

  return v4;
}

uint64_t sub_21E6C71A4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_eventData);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_21E6CB628();

  return v3;
}

uint64_t sub_21E6C7208(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21E6B94BC(a1, a2);
  }
  return a1;
}

uint64_t sub_21E6C721C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21E6B8988(a1, a2);
  }
  return a1;
}

uint64_t sub_21E6C7238@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  type metadata accessor for CustomSignal();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EntityRejection();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  sub_21E6CB5B8();
  swift_allocObject();
  sub_21E6CB5A8();
  switch(v10)
  {
    case 1:
      type metadata accessor for IntentResult();
      sub_21E6C8B4C(&qword_267D3D368, (void (*)(uint64_t))type metadata accessor for IntentResult);
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_3_2();
      uint64_t result = swift_release();
      if (!v2) {
        goto LABEL_9;
      }
      return result;
    case 2:
      type metadata accessor for DisambiguationOffer();
      sub_21E6C8B4C(&qword_267D3D360, (void (*)(uint64_t))type metadata accessor for DisambiguationOffer);
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_3_2();
      uint64_t result = swift_release();
      if (!v2) {
        goto LABEL_9;
      }
      return result;
    case 3:
      type metadata accessor for DisambiguationResult();
      sub_21E6C8B4C(&qword_267D3D358, (void (*)(uint64_t))type metadata accessor for DisambiguationResult);
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_3_2();
      uint64_t result = swift_release();
      if (!v2) {
        goto LABEL_9;
      }
      return result;
    case 4:
      type metadata accessor for ConfirmationOffer();
      sub_21E6C8B4C(&qword_267D3D350, (void (*)(uint64_t))type metadata accessor for ConfirmationOffer);
      OUTLINED_FUNCTION_0_2();
      if (v2) {
        goto LABEL_17;
      }
      goto LABEL_11;
    case 5:
      type metadata accessor for ConfirmationResult();
      sub_21E6C8B4C(&qword_267D3D348, (void (*)(uint64_t))type metadata accessor for ConfirmationResult);
      OUTLINED_FUNCTION_0_2();
      if (v2) {
        goto LABEL_17;
      }
LABEL_11:
      OUTLINED_FUNCTION_3_2();
      swift_release();
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_4_3();
      return swift_storeEnumTagMultiPayload();
    case 6:
      sub_21E6C8B4C(&qword_267D3D340, (void (*)(uint64_t))type metadata accessor for EntityRejection);
      sub_21E6CB598();
      if (v2) {
        goto LABEL_17;
      }
      OUTLINED_FUNCTION_3_2();
      swift_release();
      sub_21E6C8AEC((uint64_t)v9, v13, (void (*)(void))type metadata accessor for EntityRejection);
      type metadata accessor for IntentEventContent();
      OUTLINED_FUNCTION_4_3();
      return swift_storeEnumTagMultiPayload();
    case 7:
      sub_21E6C8B4C(&qword_267D3D338, (void (*)(uint64_t))type metadata accessor for CustomSignal);
      sub_21E6CB598();
      if (v2)
      {
LABEL_17:
        OUTLINED_FUNCTION_3_2();
        return swift_release();
      }
      else
      {
        OUTLINED_FUNCTION_3_2();
        swift_release();
        sub_21E6C8AEC((uint64_t)v6, v13, (void (*)(void))type metadata accessor for CustomSignal);
        type metadata accessor for IntentEventContent();
        OUTLINED_FUNCTION_4_3();
        return swift_storeEnumTagMultiPayload();
      }
    default:
      type metadata accessor for IntentStart();
      sub_21E6C8B4C(&qword_267D3D370, (void (*)(uint64_t))type metadata accessor for IntentStart);
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_3_2();
      uint64_t result = swift_release();
      if (v2) {
        return result;
      }
LABEL_9:
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_4_3();
      return swift_storeEnumTagMultiPayload();
  }
}

void IntentEventType.rawValue.getter()
{
  switch(*v0)
  {
    case 1:
    case 2:
    case 6:
    case 7:
      return;
    case 3:
    case 5:
      OUTLINED_FUNCTION_7_4();
      break;
    case 4:
      OUTLINED_FUNCTION_5_2();
      break;
    default:
      OUTLINED_FUNCTION_2_4();
      break;
  }
}

SiriIntentEvents::IntentEventType_optional __swiftcall IntentEventType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21E6CB878();
  result.value = swift_bridgeObjectRelease();
  char v5 = 8;
  if (v3 < 8) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void IntentEventType.description.getter()
{
  switch(*v0)
  {
    case 1:
    case 2:
    case 6:
    case 7:
      return;
    case 3:
    case 5:
      OUTLINED_FUNCTION_7_4();
      break;
    case 4:
      OUTLINED_FUNCTION_5_2();
      break;
    default:
      OUTLINED_FUNCTION_2_4();
      break;
  }
}

uint64_t sub_21E6C7980(unsigned __int8 *a1, char *a2)
{
  return sub_21E6C021C(*a1, *a2);
}

unint64_t sub_21E6C7990()
{
  unint64_t result = qword_267D3D328;
  if (!qword_267D3D328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D328);
  }
  return result;
}

uint64_t sub_21E6C79DC()
{
  return sub_21E6C061C(*v0);
}

uint64_t sub_21E6C79E4(uint64_t a1)
{
  return sub_21E6C07C4(a1, *v1);
}

uint64_t sub_21E6C79EC(uint64_t a1)
{
  return sub_21E6C09F8(a1, *v1);
}

uint64_t sub_21E6C79F4()
{
  return sub_21E6CB758();
}

uint64_t sub_21E6C7A54()
{
  return sub_21E6CB748();
}

SiriIntentEvents::IntentEventType_optional sub_21E6C7AA8(Swift::String *a1)
{
  return IntentEventType.init(rawValue:)(*a1);
}

void sub_21E6C7AB4(void *a1@<X8>)
{
  IntentEventType.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t getEnumTagSinglePayload for IntentEventType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for IntentEventType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x21E6C7C30);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentEventType()
{
  return &type metadata for IntentEventType;
}

void *initializeBufferWithCopyOfBuffer for IntentEventContent(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (void *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 6u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        uint64_t v8 = a2[3];
        a1[2] = a2[2];
        a1[3] = v8;
        uint64_t v9 = a2[5];
        a1[4] = a2[4];
        a1[5] = v9;
        uint64_t v10 = a2[7];
        a1[6] = a2[6];
        a1[7] = v10;
        uint64_t v11 = a2[9];
        a1[8] = a2[8];
        a1[9] = v11;
        uint64_t v12 = *(int *)(type metadata accessor for EntityRejection() + 36);
        uint64_t v24 = (char *)a2 + v12;
        unint64_t v25 = (char *)a1 + v12;
        uint64_t v13 = sub_21E6CB678();
        double v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v14(v25, v24, v13);
        break;
      case 7u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v15 = a2[2];
        a1[1] = a2[1];
        a1[2] = v15;
        *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
        uint64_t v16 = a2[5];
        a1[4] = a2[4];
        a1[5] = v16;
        uint64_t v17 = a2[6];
        unint64_t v18 = a2[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_21E6B8988(v17, v18);
        a1[6] = v17;
        a1[7] = v18;
        uint64_t v19 = *(int *)(type metadata accessor for CustomSignal() + 36);
        uint64_t v20 = (char *)a1 + v19;
        id v21 = (char *)a2 + v19;
        uint64_t v22 = sub_21E6CB678();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
        break;
      default:
        *a1 = *a2;
        swift_retain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for IntentEventContent(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      uint64_t result = swift_release();
      break;
    case 6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = type metadata accessor for EntityRejection();
      goto LABEL_7;
    case 7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21E6B94BC(*(void *)(a1 + 48), *(void *)(a1 + 56));
      uint64_t v3 = type metadata accessor for CustomSignal();
LABEL_7:
      uint64_t v4 = a1 + *(int *)(v3 + 36);
      uint64_t v5 = sub_21E6CB678();
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      uint64_t result = v6(v4, v5);
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for IntentEventContent(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 6u:
      uint64_t v4 = a2[1];
      *a1 = *a2;
      a1[1] = v4;
      uint64_t v5 = a2[3];
      a1[2] = a2[2];
      a1[3] = v5;
      uint64_t v6 = a2[5];
      a1[4] = a2[4];
      a1[5] = v6;
      uint64_t v7 = a2[7];
      a1[6] = a2[6];
      a1[7] = v7;
      uint64_t v8 = a2[9];
      a1[8] = a2[8];
      a1[9] = v8;
      uint64_t v9 = *(int *)(type metadata accessor for EntityRejection() + 36);
      id v21 = (char *)a2 + v9;
      uint64_t v22 = (char *)a1 + v9;
      uint64_t v10 = sub_21E6CB678();
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v11(v22, v21, v10);
      break;
    case 7u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v12 = a2[2];
      a1[1] = a2[1];
      a1[2] = v12;
      *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
      uint64_t v13 = a2[5];
      a1[4] = a2[4];
      a1[5] = v13;
      uint64_t v14 = a2[6];
      unint64_t v15 = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21E6B8988(v14, v15);
      a1[6] = v14;
      a1[7] = v15;
      uint64_t v16 = *(int *)(type metadata accessor for CustomSignal() + 36);
      uint64_t v17 = (char *)a1 + v16;
      unint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = sub_21E6CB678();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      break;
    default:
      *a1 = *a2;
      swift_retain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for IntentEventContent(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_21E6C861C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 6u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        a1[7] = a2[7];
        a1[8] = a2[8];
        a1[9] = a2[9];
        uint64_t v4 = *(int *)(type metadata accessor for EntityRejection() + 36);
        uint64_t v14 = (char *)a2 + v4;
        unint64_t v15 = (char *)a1 + v4;
        uint64_t v5 = sub_21E6CB678();
        uint64_t v6 = *(void (**)(char *, char *, uint64_t))(*(void *)(v5 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v6(v15, v14, v5);
        break;
      case 7u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
        a1[4] = a2[4];
        a1[5] = a2[5];
        uint64_t v7 = a2[6];
        unint64_t v8 = a2[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_21E6B8988(v7, v8);
        a1[6] = v7;
        a1[7] = v8;
        uint64_t v9 = *(int *)(type metadata accessor for CustomSignal() + 36);
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_21E6CB678();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        break;
      default:
        *a1 = *a2;
        swift_retain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21E6C861C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IntentEventContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for IntentEventContent()
{
  uint64_t result = qword_26AD35388;
  if (!qword_26AD35388) {
    return swift_getSingletonMetadata();
  }
  return result;
}

_OWORD *initializeWithTake for IntentEventContent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 7)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
    *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
    long long v13 = a2[3];
    a1[2] = a2[2];
    a1[3] = v13;
    uint64_t v14 = *(int *)(type metadata accessor for CustomSignal() + 36);
    unint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_21E6CB678();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  }
  else
  {
    if (EnumCaseMultiPayload != 6)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    long long v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    long long v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    a1[4] = a2[4];
    uint64_t v9 = *(int *)(type metadata accessor for EntityRejection() + 36);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_21E6CB678();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_OWORD *assignWithTake for IntentEventContent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_21E6C861C((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 7)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
      *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
      long long v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      uint64_t v14 = *(int *)(type metadata accessor for CustomSignal() + 36);
      unint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_21E6CB678();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    }
    else
    {
      if (EnumCaseMultiPayload != 6)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      long long v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      long long v8 = a2[3];
      a1[2] = a2[2];
      a1[3] = v8;
      a1[4] = a2[4];
      uint64_t v9 = *(int *)(type metadata accessor for EntityRejection() + 36);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_21E6CB678();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21E6C89B4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21E6C89C4()
{
  uint64_t result = type metadata accessor for EntityRejection();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for CustomSignal();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

unint64_t sub_21E6C8AA0()
{
  unint64_t result = qword_267D3D330;
  if (!qword_267D3D330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D330);
  }
  return result;
}

uint64_t sub_21E6C8AEC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_21E6C8B4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_21E6CB598();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  **(void **)(v0 - 88) = *(void *)(v0 - 72);
  return type metadata accessor for IntentEventContent();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return 0x7453746E65746E69;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_21E6B94BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_5_2()
{
  return 0xD000000000000011;
}

SiriIntentEvents::IntentResultType_optional __swiftcall IntentResultType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21E6CB878();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t IntentResultType.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
      unint64_t result = 0x64656C696166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21E6C8D34(unsigned __int8 *a1, char *a2)
{
  return sub_21E6C0484(*a1, *a2);
}

uint64_t sub_21E6C8D40()
{
  return sub_21E6C0634(*v0);
}

uint64_t sub_21E6C8D48()
{
  return sub_21E6C0914();
}

uint64_t sub_21E6C8D50(uint64_t a1)
{
  return sub_21E6C09E0(a1, *v1);
}

SiriIntentEvents::IntentResultType_optional sub_21E6C8D58(Swift::String *a1)
{
  return IntentResultType.init(rawValue:)(*a1);
}

unint64_t sub_21E6C8D64@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = IntentResultType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E6C8D8C()
{
  return sub_21E6CB758();
}

uint64_t sub_21E6C8DEC()
{
  return sub_21E6CB748();
}

uint64_t IntentResult.intentType.getter()
{
  return OUTLINED_FUNCTION_5_0();
}

void IntentResult.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

uint64_t IntentResult.intentData.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  sub_21E6B8988(v0, v1);
  return OUTLINED_FUNCTION_5_0();
}

uint64_t IntentResult.timestamp.getter()
{
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return v1(v0);
}

uint64_t IntentResult.__allocating_init(intentType:type:intent:)(uint64_t a1, uint64_t a2, unsigned char *a3, void *a4)
{
  uint64_t v8 = OUTLINED_FUNCTION_7_5();
  IntentResult.init(intentType:type:intent:)(a1, a2, a3, a4);
  return v8;
}

uint64_t IntentResult.init(intentType:type:intent:)(uint64_t a1, uint64_t a2, unsigned char *a3, void *a4)
{
  v23[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_0();
  uint64_t v15 = v14 - v13;
  LOBYTE(v13) = *a3;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  *(unsigned char *)(v4 + 32) = v13;
  v23[0] = 0;
  id v16 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a4, 0, v23);
  id v17 = v23[0];
  if (v16)
  {
    uint64_t v18 = sub_21E6CB628();
    uint64_t v20 = v19;

    *(void *)(v4 + 40) = v18;
    *(void *)(v4 + 48) = v20;
    sub_21E6CB668();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v4 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp, v15, v9);
  }
  else
  {
    id v21 = v17;
    sub_21E6CB5F8();

    swift_willThrow();
    swift_bridgeObjectRelease();
    type metadata accessor for IntentResult();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v4;
}

uint64_t type metadata accessor for IntentResult()
{
  uint64_t result = qword_267D3D3B0;
  if (!qword_267D3D3B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t IntentResult.__allocating_init(intentType:type:intent:timestamp:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = OUTLINED_FUNCTION_7_5();
  IntentResult.init(intentType:type:intent:timestamp:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t IntentResult.init(intentType:type:intent:timestamp:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  v19[1] = *(id *)MEMORY[0x263EF8340];
  char v8 = *a3;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(unsigned char *)(v5 + 32) = v8;
  v19[0] = 0;
  id v9 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a4, 0, v19);
  id v10 = v19[0];
  if (v9)
  {
    uint64_t v11 = sub_21E6CB628();
    uint64_t v13 = v12;

    *(void *)(v5 + 40) = v11;
    *(void *)(v5 + 48) = v13;
    uint64_t v14 = v5 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp;
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v14, a5);
  }
  else
  {
    id v16 = v10;
    sub_21E6CB5F8();

    swift_willThrow();
    sub_21E6CB678();
    OUTLINED_FUNCTION_3_0();
    (*(void (**)(uint64_t))(v17 + 8))(a5);
    swift_bridgeObjectRelease();
    type metadata accessor for IntentResult();
    OUTLINED_FUNCTION_1_0();
    swift_deallocPartialClassInstance();
  }
  return v5;
}

uint64_t sub_21E6C9364()
{
  BYTE8(v4) = 0;
  sub_21E6CB808();
  sub_21E6CB738();
  swift_bridgeObjectRetain();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6CB738();
  *(void *)&long long v4 = *(unsigned __int8 *)(v0 + 32);
  sub_21E6CB818();
  sub_21E6CB738();
  sub_21E6CB678();
  sub_21E6B9BE4(&qword_267D3D378);
  sub_21E6CB928();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6CB738();
  uint64_t v2 = *(void *)(v0 + 40);
  unint64_t v1 = *(void *)(v0 + 48);
  sub_21E6B8988(v2, v1);
  sub_21E6CB608();
  sub_21E6CB738();
  swift_bridgeObjectRelease();
  sub_21E6B94BC(v2, v1);
  sub_21E6CB738();
  return *(void *)((char *)&v4 + 1);
}

uint64_t sub_21E6C9534(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701869940 && a2 == 0xE400000000000000;
    if (v6 || (sub_21E6CB948() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6144746E65746E69 && a2 == 0xEA00000000006174;
      if (v7 || (sub_21E6CB948() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_21E6CB948();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_21E6C96D0()
{
  return 4;
}

uint64_t sub_21E6C96D8(char a1)
{
  return *(void *)&aIntenttytype[8 * a1];
}

uint64_t sub_21E6C96F8()
{
  return sub_21E6C96D8(*v0);
}

uint64_t sub_21E6C9700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6C9534(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6C9728@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6C96D0();
  *a1 = result;
  return result;
}

uint64_t sub_21E6C9750(uint64_t a1)
{
  unint64_t v2 = sub_21E6C9A34();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6C978C(uint64_t a1)
{
  unint64_t v2 = sub_21E6C9A34();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntentResult.deinit()
{
  swift_bridgeObjectRelease();
  sub_21E6B94BC(*(void *)(v0 + 40), *(void *)(v0 + 48));
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t IntentResult.__deallocating_deinit()
{
  IntentResult.deinit();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_21E6C986C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D380);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6C9A34();
  sub_21E6CB9E8();
  sub_21E6CB908();
  if (!v1)
  {
    sub_21E6C9A80();
    OUTLINED_FUNCTION_7_1();
    sub_21E6B97C0();
    OUTLINED_FUNCTION_7_1();
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_21E6C9A34()
{
  unint64_t result = qword_267D3D388;
  if (!qword_267D3D388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D388);
  }
  return result;
}

unint64_t sub_21E6C9A80()
{
  unint64_t result = qword_267D3D390;
  if (!qword_267D3D390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D390);
  }
  return result;
}

uint64_t IntentResult.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_5();
  IntentResult.init(from:)(a1);
  return v2;
}

uint64_t IntentResult.init(from:)(void *a1)
{
  uint64_t v3 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D398);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6C9A34();
  sub_21E6CB9D8();
  if (v1)
  {
    uint64_t v12 = v17;
    type metadata accessor for IntentResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v8;
    LOBYTE(v18) = 0;
    uint64_t v12 = v17;
    *(void *)(v17 + 16) = sub_21E6CB8B8();
    *(void *)(v17 + 24) = v13;
    sub_21E6C9DFC();
    OUTLINED_FUNCTION_5_3();
    *(unsigned char *)(v17 + 32) = 0;
    sub_21E6B9B98();
    OUTLINED_FUNCTION_5_3();
    *(_OWORD *)(v17 + 40) = v18;
    sub_21E6B9BE4(&qword_267D3D0E0);
    sub_21E6CB8C8();
    uint64_t v14 = OUTLINED_FUNCTION_2_5();
    v15(v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v17 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp, v10, v3);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v12;
}

unint64_t sub_21E6C9DFC()
{
  unint64_t result = qword_267D3D3A0;
  if (!qword_267D3D3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3A0);
  }
  return result;
}

unint64_t sub_21E6C9E4C()
{
  unint64_t result = qword_267D3D3A8;
  if (!qword_267D3D3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3A8);
  }
  return result;
}

uint64_t sub_21E6C9E98@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = IntentResult.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_21E6C9EC4(void *a1)
{
  return sub_21E6C986C(a1);
}

unsigned char *storeEnumTagSinglePayload for IntentResultType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x21E6C9FB4);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentResultType()
{
  return &type metadata for IntentResultType;
}

uint64_t sub_21E6C9FEC()
{
  return type metadata accessor for IntentResult();
}

uint64_t sub_21E6C9FF4()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for IntentResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntentResult);
}

uint64_t dispatch thunk of IntentResult.__allocating_init(intentType:type:intent:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of IntentResult.__allocating_init(intentType:type:intent:timestamp:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of IntentResult.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of IntentResult.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of IntentResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for IntentResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IntentResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6CA2E4);
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

ValueMetadata *type metadata accessor for IntentResult.CodingKeys()
{
  return &type metadata for IntentResult.CodingKeys;
}

unint64_t sub_21E6CA320()
{
  unint64_t result = qword_267D3D3C0;
  if (!qword_267D3D3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3C0);
  }
  return result;
}

unint64_t sub_21E6CA370()
{
  unint64_t result = qword_267D3D3C8;
  if (!qword_267D3D3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3C8);
  }
  return result;
}

unint64_t sub_21E6CA3C0()
{
  unint64_t result = qword_267D3D3D0;
  if (!qword_267D3D3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3D0);
  }
  return result;
}

unint64_t sub_21E6CA40C()
{
  unint64_t result = qword_267D3D3D8;
  if (!qword_267D3D3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3D8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return sub_21E6CB8C8();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_allocObject();
}

uint64_t IntentStart.intentType.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntentStart.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t IntentStart.__allocating_init(intentType:timestamp:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_5_4();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = a2;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = OUTLINED_FUNCTION_4_4();
  v6(v5);
  return v4;
}

uint64_t IntentStart.init(intentType:timestamp:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = OUTLINED_FUNCTION_4_4();
  v4(v3);
  return v2;
}

uint64_t IntentStart.__allocating_init(intent:timestamp:)(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  IntentStart.init(intent:timestamp:)(a1, a2);
  return v4;
}

uint64_t IntentStart.init(intent:timestamp:)(void *a1, uint64_t a2)
{
  id v5 = objc_msgSend(a1, sel__className);
  uint64_t v6 = sub_21E6CB718();
  uint64_t v8 = v7;

  *(void *)(v2 + 16) = v6;
  *(void *)(v2 + 24) = v8;
  uint64_t v9 = v2 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v9, a2);
  return v2;
}

unint64_t sub_21E6CA738()
{
  return 0xD000000000000018;
}

BOOL sub_21E6CA858(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_21E6CA868()
{
  return sub_21E6CB9B8();
}

uint64_t sub_21E6CA890(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
  if (v3 || (sub_21E6CB948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_21E6CB948();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_21E6CA988()
{
  return 2;
}

uint64_t sub_21E6CA990()
{
  return sub_21E6CB9C8();
}

uint64_t sub_21E6CA9D8(char a1)
{
  if (a1) {
    return 0x6D617473656D6974;
  }
  else {
    return 0x7954746E65746E69;
  }
}

BOOL sub_21E6CAA18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21E6CA858(*a1, *a2);
}

uint64_t sub_21E6CAA24()
{
  return sub_21E6CA990();
}

uint64_t sub_21E6CAA2C()
{
  return sub_21E6CA868();
}

uint64_t sub_21E6CAA34()
{
  return sub_21E6CA9D8(*v0);
}

uint64_t sub_21E6CAA3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21E6CA890(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E6CAA64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21E6CA988();
  *a1 = result;
  return result;
}

uint64_t sub_21E6CAA8C(uint64_t a1)
{
  unint64_t v2 = sub_21E6CAD78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21E6CAAC8(uint64_t a1)
{
  unint64_t v2 = sub_21E6CAD78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntentStart.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t IntentStart.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp;
  sub_21E6CB678();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_21E6CAC08(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D3E0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6CAD78();
  sub_21E6CB9E8();
  sub_21E6CB908();
  if (!v1)
  {
    sub_21E6CB678();
    sub_21E6B9BE4(&qword_26AD352E8);
    sub_21E6CB918();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_21E6CAD78()
{
  unint64_t result = qword_267D3D3E8;
  if (!qword_267D3D3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D3E8);
  }
  return result;
}

uint64_t IntentStart.__allocating_init(from:)()
{
  OUTLINED_FUNCTION_5_4();
  uint64_t v1 = swift_allocObject();
  IntentStart.init(from:)(v0);
  return v1;
}

uint64_t IntentStart.init(from:)(void *a1)
{
  uint64_t v4 = sub_21E6CB678();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D3D3F0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_21E6CAD78();
  sub_21E6CB9D8();
  if (v2)
  {
    type metadata accessor for IntentStart();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 16) = sub_21E6CB8B8();
    *(void *)(v1 + 24) = v11;
    sub_21E6B9BE4(&qword_267D3D0E0);
    sub_21E6CB8C8();
    uint64_t v13 = OUTLINED_FUNCTION_2_6();
    v14(v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v1 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp, v9, v4);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v1;
}

uint64_t type metadata accessor for IntentStart()
{
  uint64_t result = qword_267D3D3F8;
  if (!qword_267D3D3F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E6CB08C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IntentStart.__allocating_init(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E6CB0B8(void *a1)
{
  return sub_21E6CAC08(a1);
}

unint64_t sub_21E6CB0DC()
{
  return sub_21E6CA738();
}

uint64_t sub_21E6CB100()
{
  return type metadata accessor for IntentStart();
}

uint64_t sub_21E6CB108()
{
  uint64_t result = sub_21E6CB678();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for IntentStart(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntentStart);
}

uint64_t dispatch thunk of IntentStart.__allocating_init(intentType:timestamp:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of IntentStart.__allocating_init(intent:timestamp:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of IntentStart.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of IntentStart.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of IntentStart.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unsigned char *storeEnumTagSinglePayload for IntentStart.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E6CB348);
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

ValueMetadata *type metadata accessor for IntentStart.CodingKeys()
{
  return &type metadata for IntentStart.CodingKeys;
}

unint64_t sub_21E6CB384()
{
  unint64_t result = qword_267D3D408;
  if (!qword_267D3D408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D408);
  }
  return result;
}

unint64_t sub_21E6CB3D4()
{
  unint64_t result = qword_267D3D410;
  if (!qword_267D3D410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D410);
  }
  return result;
}

unint64_t sub_21E6CB424()
{
  unint64_t result = qword_267D3D418;
  if (!qword_267D3D418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D3D418);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return v0;
}

uint64_t sub_21E6CB4B0()
{
  uint64_t v0 = sub_21E6CB6D8();
  __swift_allocate_value_buffer(v0, qword_26AD35B30);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD35B30);
  return sub_21E6CB6C8();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21E6CB598()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21E6CB5A8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21E6CB5B8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21E6CB5D8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21E6CB5E8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21E6CB5F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21E6CB608()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_21E6CB618()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21E6CB628()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21E6CB638()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_21E6CB648()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_21E6CB658()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21E6CB668()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21E6CB678()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21E6CB688()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21E6CB698()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21E6CB6A8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21E6CB6B8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21E6CB6C8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21E6CB6D8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21E6CB6E8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E6CB6F8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_21E6CB708()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E6CB718()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E6CB728()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E6CB738()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21E6CB748()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_21E6CB758()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_21E6CB768()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21E6CB778()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21E6CB788()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21E6CB7A8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21E6CB7B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21E6CB7C8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_21E6CB7E8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21E6CB7F8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_21E6CB808()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21E6CB818()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21E6CB828()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_21E6CB838()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_21E6CB848()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_21E6CB858()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21E6CB868()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21E6CB878()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21E6CB888()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_21E6CB898()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_21E6CB8A8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_21E6CB8B8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_21E6CB8C8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21E6CB8D8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_21E6CB8E8()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_21E6CB8F8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_21E6CB908()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_21E6CB918()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21E6CB928()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21E6CB938()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21E6CB948()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E6CB958()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21E6CB968()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21E6CB978()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21E6CB988()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21E6CB998()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21E6CB9A8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E6CB9B8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21E6CB9C8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21E6CB9D8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21E6CB9E8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}