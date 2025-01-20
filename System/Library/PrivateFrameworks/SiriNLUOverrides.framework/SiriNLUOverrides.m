uint64_t type metadata accessor for OverrideResult(uint64_t a1)
{
  return sub_225629F40(a1, (uint64_t *)&unk_26AD58108);
}

uint64_t sub_2256251B8()
{
  uint64_t result = sub_225657EB0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.match(inputs:for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

void sub_225625270()
{
  OUTLINED_FUNCTION_54();
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  uint64_t v12 = OUTLINED_FUNCTION_5_4(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4();
  uint64_t v13 = sub_225657C50();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_10_3(v15, v53);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD580E0);
  uint64_t v17 = OUTLINED_FUNCTION_5_4(v16);
  MEMORY[0x270FA5388](v17);
  uint64_t v18 = OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_15();
  Array<A>.currentTurn.getter(v4, v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v18) == 1)
  {
    v22 = &qword_26AD580E0;
    uint64_t v23 = v0;
LABEL_5:
    sub_22562793C(v23, v22);
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v25 = (id)qword_26AD58298;
    OUTLINED_FUNCTION_13_2();

    goto LABEL_23;
  }
  OUTLINED_FUNCTION_8_3();
  v24();
  Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v13) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v2, v18);
    v22 = &qword_26AD58258;
    uint64_t v23 = v1;
    goto LABEL_5;
  }
  uint64_t v59 = v20;
  OUTLINED_FUNCTION_8_3();
  v26();
  uint64_t v54 = v2;
  uint64_t v27 = sub_225658B40();
  uint64_t v29 = v28;
  uint64_t v31 = sub_225646F90(v58);
  if (v31)
  {
    uint64_t v57 = v18;
    swift_bridgeObjectRelease();
    uint64_t v32 = *(void *)(v31 + 16);
    uint64_t v33 = v59;
    if (v32)
    {
      uint64_t v60 = MEMORY[0x263F8EE78];
      sub_225626BF8(0, v32, 0);
      uint64_t v34 = v31 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
      uint64_t v35 = *(void *)(v55 + 72);
      uint64_t v56 = v32;
      do
      {
        sub_225626F30(v34, v10, (void (*)(void))type metadata accessor for SiriNLOverride);
        v36 = (uint64_t *)(v10 + *(int *)(v5 + 44));
        if (v36[1])
        {
          uint64_t v37 = *v36;
          unint64_t v38 = v36[1];
        }
        else
        {
          unint64_t v38 = 0xE500000000000000;
          uint64_t v37 = 0x296C696E28;
        }
        swift_bridgeObjectRetain();
        sub_225627048(v10, (void (*)(void))type metadata accessor for SiriNLOverride);
        uint64_t v39 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_225626BF8(0, *(void *)(v60 + 16) + 1, 1);
          uint64_t v39 = v60;
        }
        unint64_t v41 = *(void *)(v39 + 16);
        unint64_t v40 = *(void *)(v39 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_225626BF8(v40 > 1, v41 + 1, 1);
          uint64_t v39 = v60;
        }
        *(void *)(v39 + 16) = v41 + 1;
        uint64_t v42 = v39 + 16 * v41;
        *(void *)(v42 + 32) = v37;
        *(void *)(v42 + 40) = v38;
        v34 += v35;
        --v32;
        uint64_t v33 = v59;
      }
      while (v32);
      swift_release();
      uint64_t v32 = v56;
    }
    sub_225658F80();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    v43 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v44 = OUTLINED_FUNCTION_2_0();
    uint64_t v45 = MEMORY[0x263F8D6C8];
    *(_OWORD *)(v44 + 16) = xmmword_225659D50;
    uint64_t v46 = MEMORY[0x263F8D750];
    *(void *)(v44 + 56) = v45;
    *(void *)(v44 + 64) = v46;
    *(void *)(v44 + 32) = v32;
    id v47 = v43;
    sub_225658DA0();

    swift_bridgeObjectRelease();
    sub_2256272B0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    v48();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v54, v57);
  }
  else
  {
    sub_225658F70();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    v49 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v50 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v50 + 16) = xmmword_225659D50;
    *(void *)(v50 + 56) = MEMORY[0x263F8D310];
    *(void *)(v50 + 64) = sub_225626388();
    *(void *)(v50 + 32) = v27;
    *(void *)(v50 + 40) = v29;
    id v51 = v49;
    sub_225658DA0();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    v52();
    OUTLINED_FUNCTION_9_0();
    v30();
  }
LABEL_23:
  OUTLINED_FUNCTION_52();
}

uint64_t type metadata accessor for SiriNLOverride()
{
  uint64_t result = qword_26AD58348;
  if (!qword_26AD58348) {
    return swift_getSingletonMetadata();
  }
  return result;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(sub_225657F00() - 8);
  MEMORY[0x270FA5388]();
  if ((sub_225658B20() & 1) != 0
    && (sub_225658B10(),
        char v3 = sub_225657EF0(),
        uint64_t v4 = *(void (**)(uint64_t))(v2 + 8),
        uint64_t v5 = OUTLINED_FUNCTION_0_5(),
        v4(v5),
        (v3 & 1) != 0))
  {
    sub_225658B10();
    sub_225657ED0();
    uint64_t v6 = OUTLINED_FUNCTION_0_5();
    v4(v6);
    sub_225657BC0();
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v8 = sub_225657C50();
  return __swift_storeEnumTagSinglePayload(a1, v7, 1, v8);
}

void sub_225625FC4(_Unwind_Exception *a1, void *a2, void *a3, ...)
{
  va_start(va, a3);

  marisa::Agent::~Agent((marisa::Agent *)va);
  _Unwind_Resume(a1);
}

void sub_22562602C()
{
  OUTLINED_FUNCTION_43_0();
  if (v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v4 > *(void *)(v1 + 24) >> 1)
  {
    if (v3 <= v4) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = v3;
    }
    sub_2256442A0(isUniquelyReferenced_nonNull_native, v9, 1, (char *)v1);
    uint64_t v1 = v10;
  }
  if (!*(void *)(v7 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((*(void *)(v1 + 24) >> 1) - *(void *)(v1 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  uint64_t v11 = *(void *)(v1 + 16);
  BOOL v6 = __OFADD__(v11, v2);
  uint64_t v12 = v11 + v2;
  if (!v6)
  {
    *(void *)(v1 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

void sub_225626104()
{
  OUTLINED_FUNCTION_43_0();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v4;
  if (!swift_isUniquelyReferenced_nonNull_native() || v3 > *(void *)(v1 + 24) >> 1)
  {
    sub_22564426C();
    uint64_t v1 = v7;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v8 = (*(void *)(v1 + 24) >> 1) - *(void *)(v1 + 16);
  type metadata accessor for SiriNLOverride();
  if (v8 < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  uint64_t v9 = *(void *)(v1 + 16);
  BOOL v5 = __OFADD__(v9, v2);
  uint64_t v10 = v9 + v2;
  if (!v5)
  {
    *(void *)(v1 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_225626218(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v8 = v4 + v2;
    }
    else {
      uint64_t v8 = v4;
    }
    sub_2256443F4(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    uint64_t v3 = v9;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  if (v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *(void *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

unint64_t sub_22562633C()
{
  unint64_t result = qword_26AD58708;
  if (!qword_26AD58708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD58708);
  }
  return result;
}

unint64_t sub_225626388()
{
  unint64_t result = qword_26AD58710;
  if (!qword_26AD58710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD58710);
  }
  return result;
}

uint64_t type metadata accessor for RegexOverrideCache()
{
  return self;
}

uint64_t sub_2256263F8()
{
  uint64_t v1 = type metadata accessor for CacheKey();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1();
  v2();
  sub_2256588B0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = v3();
  if (qword_26AD58178 != -1) {
    uint64_t v4 = swift_once();
  }
  MEMORY[0x270FA5388](v4);
  v9[2] = v0;
  sub_225646994((uint64_t)sub_2256265A4, (uint64_t)v9, v5);
  uint64_t v7 = v6;
  sub_2256267E8(v0);
  return v7;
}

uint64_t type metadata accessor for CacheKey()
{
  uint64_t result = qword_26AD58138;
  if (!qword_26AD58138) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *_s16SiriNLUOverrides8CacheKeyVMa_0()
{
  return &type metadata for CacheKey;
}

uint64_t sub_2256265A4@<X0>(uint64_t *a1@<X8>)
{
  return sub_2256265C0(*(void *)(v1 + 16), a1);
}

uint64_t sub_2256265C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_26AD58190 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (*((void *)off_26AD58180 + 2) && (sub_225627DC0(a1), (v4 & 1) != 0)) {
    uint64_t v5 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = v5;
  return swift_endAccess();
}

uint64_t sub_225626680(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2256266C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22562672C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_225657C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2256588B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_2256267E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_225626844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_225657C50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2256588B0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t destroy for CacheKey()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriNLOverride(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a3[9];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  a1[6] = a2[6];
  uint64_t v12 = sub_225657B90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  uint64_t v14 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a3[12];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (_OWORD *)((char *)a2 + v18);
  unint64_t v21 = *(void *)((char *)a2 + v18 + 8);
  swift_bridgeObjectRetain();
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *v20;
  }
  else
  {
    uint64_t v22 = *(void *)v20;
    sub_225626B60(v22, v21);
    *(void *)uint64_t v19 = v22;
    *((void *)v19 + 1) = v21;
  }
  uint64_t v23 = a3[14];
  *(_DWORD *)((char *)a1 + a3[13]) = *(_DWORD *)((char *)a2 + a3[13]);
  v24 = (char *)a1 + v23;
  id v25 = (void *)((char *)a2 + v23);
  unint64_t v26 = *(void *)((char *)a2 + v23 + 8);
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)v24 = *(_OWORD *)v25;
  }
  else
  {
    uint64_t v27 = *v25;
    sub_225626B60(*v25, v26);
    *(void *)v24 = v27;
    *((void *)v24 + 1) = v26;
  }
  uint64_t v28 = a3[15];
  uint64_t v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  uint64_t v31 = sub_225658BD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  }
  return a1;
}

uint64_t sub_225626B60(uint64_t a1, unint64_t a2)
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

void sub_225626BB8()
{
  sub_225626CCC();
  *uint64_t v0 = v1;
}

void sub_225626BD8()
{
  sub_22564AD50();
  *uint64_t v0 = v1;
}

void sub_225626BF8(char a1, uint64_t a2, char a3)
{
  sub_225626E24(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

void sub_225626C18()
{
  sub_22564ABC8();
  *uint64_t v0 = v1;
}

void sub_225626C38()
{
  sub_225626C98();
  *uint64_t v0 = v1;
}

void sub_225626C58()
{
  sub_225626EFC();
  *uint64_t v0 = v1;
}

void sub_225626C78()
{
  sub_22564AD28();
  *uint64_t v0 = v1;
}

void sub_225626C98()
{
}

void sub_225626CCC()
{
}

void sub_225626D00()
{
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_29_1();
  if (v7)
  {
    OUTLINED_FUNCTION_10_1();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_27_0();
      if (v9)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v8 = v5;
  }
  uint64_t v11 = *(void *)(v0 + 16);
  if (v8 <= v11) {
    uint64_t v12 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v12 = v8;
  }
  if (!v12) {
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(v6);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(v3);
  OUTLINED_FUNCTION_4_2(v13);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = (void *)OUTLINED_FUNCTION_14_3();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v15)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 - v4 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_22;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v4) / v15);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_28_1();
  if (v2)
  {
    v1(v19, v11);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  OUTLINED_FUNCTION_52();
}

void sub_225626E24(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_10_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_27_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58758);
    uint64_t v11 = swift_allocObject();
    _swift_stdlib_malloc_size((const void *)v11);
    OUTLINED_FUNCTION_32_0();
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = v12;
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_225643D08((char *)(a4 + 32), v9, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
}

void sub_225626EFC()
{
}

uint64_t sub_225626F30(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_225626F90(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_22();
  uint64_t v4 = OUTLINED_FUNCTION_12_3();
  v5(v4);
  return a2;
}

uint64_t sub_225626FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriNLOverride();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_225627048(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

uint64_t sub_22562709C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriNLOverride();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for SiriNLOverride(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[9];
  uint64_t v5 = sub_225657B90();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a1 + a2[12]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_225627258(*v6, v7);
  }
  char v8 = (uint64_t *)(a1 + a2[14]);
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15) {
    sub_225627258(*v8, v9);
  }
  uint64_t v10 = a1 + a2[15];
  uint64_t v11 = sub_225658BD0();
  uint64_t result = __swift_getEnumTagSinglePayload(v10, 1, v11);
  if (!result)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    return v13(v10, v11);
  }
  return result;
}

uint64_t sub_225627258(uint64_t a1, unint64_t a2)
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

void sub_2256272B0()
{
  OUTLINED_FUNCTION_54();
  uint64_t v61 = v1;
  uint64_t v3 = v2;
  uint64_t matched = type metadata accessor for OverrideMatchResult(0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v57 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  uint64_t v14 = OUTLINED_FUNCTION_5_4(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_0();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD580E0);
  uint64_t v19 = OUTLINED_FUNCTION_5_4(v18);
  MEMORY[0x270FA5388](v19);
  uint64_t v20 = OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  id v25 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  Array<A>.currentTurn.getter(v3, v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v20) == 1)
  {
    unint64_t v26 = &qword_26AD580E0;
    uint64_t v27 = v0;
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_8_3();
  v28();
  Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(v17);
  uint64_t v29 = sub_225657C50();
  if (__swift_getEnumTagSinglePayload(v17, 1, v29) == 1)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v20);
    unint64_t v26 = &qword_26AD58258;
    uint64_t v27 = v17;
LABEL_5:
    sub_22562793C(v27, v26);
    sub_225658F90();
    if (qword_26AD58250 == -1)
    {
LABEL_6:
      id v30 = (id)qword_26AD58298;
      OUTLINED_FUNCTION_13_2();

      goto LABEL_26;
    }
LABEL_28:
    swift_once();
    goto LABEL_6;
  }
  v62 = v10;
  uint64_t v59 = v22;
  uint64_t v60 = v20;
  sub_22562793C(v17, &qword_26AD58258);
  uint64_t v58 = v25;
  sub_225658B30();
  static MatchingSpanUtils.getSpanLabelDict(_:)();
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
  if (qword_26AD584D8 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_225628698(byte_26AD58A00);
  uint64_t v35 = v34;
  uint64_t v36 = sub_2256287D8();
  uint64_t v38 = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_2256289FC(v61, v3, v32, v36, v38, v33, v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v40 = MEMORY[0x263F8EE78];
  uint64_t v63 = MEMORY[0x263F8EE78];
  uint64_t v41 = *(void *)(v39 + 16);
  if (v41)
  {
    unint64_t v42 = 0;
    uint64_t v43 = (uint64_t)v62;
    uint64_t v61 = *(void *)(v39 + 16);
    while (v42 < *(void *)(v39 + 16))
    {
      unint64_t v44 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v45 = *(void *)(v6 + 72);
      sub_225626F30(v39 + v44 + v45 * v42, (uint64_t)v12, (void (*)(void))type metadata accessor for OverrideMatchResult);
      if (v12[*(int *)(matched + 20)] == 1)
      {
        uint64_t v46 = v6;
        uint64_t v47 = matched;
        sub_225648210((uint64_t)v12, v43);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_225626C58();
        }
        uint64_t v48 = v63;
        unint64_t v49 = *(void *)(v63 + 16);
        if (v49 >= *(void *)(v63 + 24) >> 1)
        {
          sub_225626C58();
          uint64_t v48 = v63;
        }
        *(void *)(v48 + 16) = v49 + 1;
        uint64_t v43 = (uint64_t)v62;
        sub_225648210((uint64_t)v62, v48 + v44 + v49 * v45);
        uint64_t matched = v47;
        uint64_t v6 = v46;
        uint64_t v41 = v61;
      }
      else
      {
        sub_225627048((uint64_t)v12, (void (*)(void))type metadata accessor for OverrideMatchResult);
      }
      if (v41 == ++v42)
      {
        uint64_t v40 = v63;
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_28;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  sub_225658F80();
  uint64_t v50 = v58;
  if (qword_26AD58250 != -1) {
    swift_once();
  }
  id v51 = (void *)qword_26AD58298;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
  uint64_t v52 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v52 + 16) = xmmword_225659D50;
  uint64_t v53 = *(void *)(v40 + 16);
  uint64_t v54 = MEMORY[0x263F8D750];
  *(void *)(v52 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v52 + 64) = v54;
  *(void *)(v52 + 32) = v53;
  id v55 = v51;
  sub_225658DA0();

  swift_bridgeObjectRelease();
  if (!*(void *)(v40 + 16))
  {
    sub_225658F80();
    id v56 = (id)qword_26AD58298;
    sub_225658DA0();
  }
  (*(void (**)(char *, uint64_t))(v59 + 8))(v50, v60);
LABEL_26:
  OUTLINED_FUNCTION_52();
}

uint64_t type metadata accessor for OverrideMatchResult(uint64_t a1)
{
  return sub_225629F40(a1, qword_26AD58500);
}

uint64_t sub_225627890()
{
  uint64_t result = type metadata accessor for SiriNLOverride();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22562793C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

uint64_t sub_22562798C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void static MatchingSpanUtils.getSpanLabelDict(_:)()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  uint64_t v2 = sub_2256580F0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8_1();
  uint64_t v51 = v5 - v6;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v45 - v7;
  uint64_t v9 = *(void *)(v1 + 16);
  if (!v9)
  {
    uint64_t v16 = 0;
LABEL_25:
    sub_2256429A8((uint64_t)v16);
    OUTLINED_FUNCTION_52();
    return;
  }
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v10 = v4 + 16;
  uint64_t v11 = v12;
  OUTLINED_FUNCTION_15_1();
  v45[2] = v13;
  uint64_t v14 = v1 + v13;
  uint64_t v15 = *(void *)(v10 + 56);
  v45[0] = v1;
  v45[1] = v10 + 16;
  unint64_t v49 = (void (**)(char *, uint64_t))(v10 - 8);
  swift_bridgeObjectRetain();
  uint64_t v16 = 0;
  uint64_t v17 = (void *)MEMORY[0x263F8EE80];
  uint64_t v47 = v10;
  uint64_t v48 = v2;
  uint64_t v46 = v12;
  uint64_t v50 = v15;
  while (1)
  {
    v11(v8, v14, v2);
    uint64_t v18 = sub_2256580A0();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0) {
      uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
    }
    if (!v21)
    {
      uint64_t v41 = v50;
      goto LABEL_22;
    }
    uint64_t v22 = sub_2256580A0();
    uint64_t v23 = (void (*)(uint64_t, char *, uint64_t))v11;
    uint64_t v25 = v24;
    v23(v51, v8, v2);
    sub_2256429A8((uint64_t)v16);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v52 = v17;
    unint64_t v26 = sub_225627F1C(v22, v25);
    if (__OFADD__(v17[2], (v27 & 1) == 0)) {
      break;
    }
    unint64_t v28 = v26;
    char v29 = v27;
    __swift_instantiateConcreteTypeFromMangledName(qword_26AD57F28);
    if (sub_2256590D0())
    {
      unint64_t v30 = sub_225627F1C(v22, v25);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_28;
      }
      unint64_t v28 = v30;
    }
    uint64_t v17 = v52;
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0)
    {
      OUTLINED_FUNCTION_21_0((uint64_t)&v17[v28 >> 6]);
      uint64_t v32 = (uint64_t *)(v17[6] + 16 * v28);
      *uint64_t v32 = v22;
      v32[1] = v25;
      *(void *)(v17[7] + 8 * v28) = MEMORY[0x263F8EE78];
      uint64_t v33 = v17[2];
      uint64_t v34 = v33 + 1;
      BOOL v35 = __OFADD__(v33, 1);
      swift_bridgeObjectRetain();
      if (v35) {
        goto LABEL_27;
      }
      v17[2] = v34;
    }
    swift_bridgeObjectRetain();
    uint64_t v36 = v17[7];
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void *)(v36 + 8 * v28);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v36 + 8 * v28) = v37;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      OUTLINED_FUNCTION_29();
      sub_225644078();
      uint64_t v37 = v43;
      *(void *)(v36 + 8 * v28) = v43;
    }
    unint64_t v40 = *(void *)(v37 + 16);
    unint64_t v39 = *(void *)(v37 + 24);
    if (v40 >= v39 >> 1)
    {
      OUTLINED_FUNCTION_28_0(v39);
      sub_225644078();
      uint64_t v37 = v44;
      *(void *)(v36 + 8 * v28) = v44;
    }
    *(void *)(v37 + 16) = v40 + 1;
    uint64_t v41 = v50;
    uint64_t v2 = v48;
    OUTLINED_FUNCTION_58();
    v42();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_22563F030;
    uint64_t v11 = v46;
LABEL_22:
    (*v49)(v8, v2);
    v14 += v41;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  sub_2256591D0();
  __break(1u);
}

unint64_t sub_225627DC0(uint64_t a1)
{
  sub_225659250();
  sub_225657C50();
  sub_225626680(&qword_26AD580D0, MEMORY[0x263F07690]);
  sub_225658DC0();
  type metadata accessor for CacheKey();
  sub_225658870();
  sub_225659260();
  uint64_t v2 = sub_225659270();
  return sub_22562824C(a1, v2);
}

unint64_t sub_225627E90(uint64_t a1)
{
  uint64_t v2 = sub_225659240();
  return sub_225628038(a1, v2);
}

unint64_t sub_225627ED4(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x22A6311E0](*(void *)(v1 + 40), a1, 4);
  return sub_2256281B0(a1, v3);
}

unint64_t sub_225627F1C(uint64_t a1, uint64_t a2)
{
  sub_225659250();
  sub_225658E40();
  uint64_t v4 = sub_225659270();
  return sub_22562843C(a1, a2, v4);
}

unint64_t sub_225627F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_225659250();
  swift_bridgeObjectRetain();
  sub_225658E40();
  swift_bridgeObjectRelease();
  sub_225659260();
  uint64_t v6 = sub_225659270();
  return sub_2256280D4(a1, a2, a3, v6);
}

unint64_t sub_225628038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_2256280D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = (void *)(v12 + 24 * v7);
      uint64_t v14 = v13[2];
      BOOL v15 = *v13 == a1 && v13[1] == a2;
      if (v15 || (sub_2256591A0()) && v14 == a3) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_2256281B0(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_22562824C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v15 = type metadata accessor for CacheKey();
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v14 = v12;
    while (1)
    {
      sub_2256266C8(*(void *)(v3 + 48) + v12 * v10, (uint64_t)v8);
      if (MEMORY[0x22A62FBC0](v8, a1))
      {
        sub_2256588B0();
        sub_225626680(&qword_26AD580D8, MEMORY[0x263F716E8]);
        sub_225658F10();
        sub_225658F10();
        uint64_t v12 = v14;
        if (v17 == v16) {
          break;
        }
      }
      sub_2256267E8((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_2256267E8((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_22562843C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2256591A0() & 1) == 0)
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
      while (!v14 && (sub_2256591A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_225628520()
{
  if (qword_26AD584F8 != -1) {
    swift_once();
  }
  if (qword_26AD584E0 != -1) {
    swift_once();
  }
  unsigned int v0 = dword_26AD584E8;
  swift_beginAccess();
  uint64_t v1 = off_26AD584F0;
  if (*((void *)off_26AD584F0 + 2) && (unint64_t v2 = sub_225627ED4(v0), (v3 & 1) != 0))
  {
    char v4 = *(unsigned char *)(v1[7] + v2);
    uint64_t result = swift_endAccess();
  }
  else
  {
    uint64_t result = swift_endAccess();
    char v4 = 8;
  }
  byte_26AD58A00 = v4;
  return result;
}

void *sub_225628608()
{
  uint64_t result = (void *)sub_22564CDAC();
  off_26AD584F0 = result;
  return result;
}

ValueMetadata *type metadata accessor for MobileGestalt.DeviceClass()
{
  return &type metadata for MobileGestalt.DeviceClass;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

void sub_225628644()
{
  unsigned int v0 = (void *)sub_225658DF0();
  int v1 = MGGetSInt32Answer();

  dword_26AD584E8 = v1;
}

uint64_t sub_225628698(char a1)
{
  uint64_t result = 0x454E4F4850;
  switch(a1)
  {
    case 1:
      uint64_t result = 4473168;
      break;
    case 2:
      uint64_t result = 0x4E414D4553524F48;
      break;
    case 3:
      uint64_t result = 1398097242;
      break;
    case 4:
      uint64_t result = 0x4F454D4143;
      break;
    case 5:
      uint64_t result = 0x4843544157;
      break;
    case 6:
      uint64_t result = 5390659;
      break;
    case 7:
      uint64_t result = 0x544952414752414DLL;
      break;
    case 8:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22562876C(uint64_t a1, uint64_t a2)
{
  sub_2256287F8(a1, a2, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_22564CDF0((uint64_t)v4);
  }
  return 0;
}

uint64_t sub_2256287D8()
{
  return sub_22562876C(0x54746375646F7250, 0xEB00000000657079);
}

double sub_2256287F8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = (void *)sub_225658DF0();
  uint64_t v7 = MGCopyAnswerWithError();

  if (v7)
  {
    *(void *)(a3 + 24) = swift_getObjectType();
    *(void *)a3 = v7;
  }
  else
  {
    sub_225658F90();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_22565A070;
    uint64_t v10 = MEMORY[0x263F8D310];
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    unint64_t v11 = sub_225626388();
    *(void *)(v9 + 64) = v11;
    *(void *)(v9 + 32) = a1;
    *(void *)(v9 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_225659180();
    *(void *)(v9 + 96) = v10;
    *(void *)(v9 + 104) = v11;
    *(void *)(v9 + 72) = v12;
    *(void *)(v9 + 80) = v13;
    sub_225644814();
    BOOL v14 = (void *)sub_225658FC0();
    sub_225658DA0();
    swift_bridgeObjectRelease();

    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2256289FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v33 = a7;
  uint64_t v31 = a4;
  uint64_t v32 = a6;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58540);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t matched = type metadata accessor for OverrideMatchResult(0);
  uint64_t v28 = *(void *)(matched - 8);
  uint64_t v14 = MEMORY[0x270FA5388](matched);
  uint64_t v29 = (uint64_t)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v27 - v16;
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18)
  {
    v27[2] = v7;
    uint64_t v19 = *(void *)(type metadata accessor for SiriNLOverride() - 8);
    uint64_t v20 = a1 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
    uint64_t v21 = *(void *)(v19 + 72);
    v27[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v22 = MEMORY[0x263F8EE78];
    v27[3] = a5;
    v27[4] = a3;
    do
    {
      SiriNLOverride.matches(inputs:spanDict:deviceType:userInterfaceIdiom:)();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, matched) == 1)
      {
        sub_22562793C((uint64_t)v13, &qword_26AD58540);
      }
      else
      {
        sub_225648210((uint64_t)v13, (uint64_t)v17);
        sub_225648210((uint64_t)v17, v29);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22564438C();
          uint64_t v22 = v24;
        }
        unint64_t v23 = *(void *)(v22 + 16);
        if (v23 >= *(void *)(v22 + 24) >> 1)
        {
          sub_22564438C();
          uint64_t v22 = v25;
        }
        *(void *)(v22 + 16) = v23 + 1;
        sub_225648210(v29, v22+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v23);
      }
      v20 += v21;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_225628CF8(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58128);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t matched = type metadata accessor for OverrideMatchResultAndParse(0);
  uint64_t v30 = *(void *)(matched - 8);
  uint64_t v11 = MEMORY[0x270FA5388](matched);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v29 = (uint64_t)&v25 - v14;
  uint64_t v15 = *(void *)(a3 + 16);
  if (!v15) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v16 = *(void *)(type metadata accessor for OverrideMatchResult(0) - 8);
  uint64_t v17 = a3 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v31 = *(void *)(v16 + 72);
  uint64_t v25 = a3;
  swift_bridgeObjectRetain();
  uint64_t v18 = MEMORY[0x263F8EE78];
  char v27 = v13;
  uint64_t v28 = a2;
  uint64_t v26 = matched;
  while (1)
  {
    a1(v17);
    if (v3) {
      break;
    }
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, matched) == 1)
    {
      sub_22562793C((uint64_t)v9, &qword_26AD58128);
    }
    else
    {
      uint64_t v19 = v29;
      sub_225633238((uint64_t)v9, v29, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
      sub_225633238(v19, (uint64_t)v13, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2256443C0();
        uint64_t v18 = v22;
      }
      unint64_t v20 = *(void *)(v18 + 16);
      if (v20 >= *(void *)(v18 + 24) >> 1)
      {
        sub_2256443C0();
        uint64_t v18 = v23;
      }
      *(void *)(v18 + 16) = v20 + 1;
      uint64_t v21 = v18
          + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))
          + *(void *)(v30 + 72) * v20;
      uint64_t v13 = v27;
      sub_225633238((uint64_t)v27, v21, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
      uint64_t matched = v26;
    }
    v17 += v31;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      return v18;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

void sub_225629020()
{
  OUTLINED_FUNCTION_25_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD580F0);
  uint64_t v7 = OUTLINED_FUNCTION_5_4(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_15();
  uint64_t v31 = type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_2();
  uint64_t v29 = v10;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = *(void *)(v3 + 16);
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = v3;
    uint64_t v15 = (uint64_t *)(v3 + 40);
    uint64_t v16 = MEMORY[0x263F8EE78];
    char v27 = v5;
    while (1)
    {
      uint64_t v17 = *v15;
      v30[0] = *(v15 - 1);
      v30[1] = v17;
      swift_bridgeObjectRetain();
      v5(v30);
      if (v0) {
        break;
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_8_4(v1, 1, v31);
      if (v18)
      {
        sub_22562793C(v1, &qword_26AD580F0);
      }
      else
      {
        sub_225633238(v1, (uint64_t)v13, (void (*)(void))type metadata accessor for SiriNLOverride);
        sub_225633238((uint64_t)v13, v29, (void (*)(void))type metadata accessor for SiriNLOverride);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_29();
          sub_22564426C();
          uint64_t v16 = v24;
        }
        unint64_t v20 = *(void *)(v16 + 16);
        if (v20 >= *(void *)(v16 + 24) >> 1)
        {
          sub_22564426C();
          uint64_t v16 = v25;
        }
        *(void *)(v16 + 16) = v20 + 1;
        OUTLINED_FUNCTION_15_1();
        sub_225633238(v23, v16 + v21 + *(void *)(v22 + 72) * v20, (void (*)(void))type metadata accessor for SiriNLOverride);
        uint64_t v5 = v27;
      }
      v15 += 2;
      if (!--v14)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_16:
  OUTLINED_FUNCTION_19_1();
}

void SiriNLOverride.matches(inputs:spanDict:deviceType:userInterfaceIdiom:)()
{
  OUTLINED_FUNCTION_54();
  uint64_t v124 = v4;
  uint64_t v125 = v5;
  uint64_t v126 = v6;
  uint64_t v127 = v7;
  uint64_t v123 = v8;
  uint64_t v136 = v9;
  uint64_t v11 = v10;
  uint64_t matched = type metadata accessor for TurnInputRuleMatchResult(0);
  uint64_t v13 = OUTLINED_FUNCTION_4_2(matched);
  uint64_t v122 = v14;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_22_2(v15, v119);
  uint64_t v16 = type metadata accessor for SiriNLOverride();
  uint64_t v17 = OUTLINED_FUNCTION_5_4(v16);
  MEMORY[0x270FA5388](v17);
  v128 = (void (*)(void))((char *)&v119 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  uint64_t v20 = OUTLINED_FUNCTION_5_4(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_26_2();
  uint64_t v132 = sub_225657C50();
  OUTLINED_FUNCTION_0();
  uint64_t v130 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_5();
  uint64_t v131 = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD580E0);
  uint64_t v25 = OUTLINED_FUNCTION_5_4(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_37_0();
  uint64_t v137 = sub_225658B50();
  OUTLINED_FUNCTION_0();
  uint64_t v133 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_5();
  uint64_t v135 = v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
  uint64_t v30 = OUTLINED_FUNCTION_5_4(v29);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_3_0();
  uint64_t v33 = v32 - v31;
  uint64_t v34 = sub_225658BD0();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v35;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_8_1();
  uint64_t v40 = v38 - v39;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x270FA5388](v42);
  uint64_t v44 = (char *)&v119 - v43;
  v134 = v0;
  SiriNLOverride.nluRequestRule.getter(v33);
  OUTLINED_FUNCTION_8_4(v33, 1, v34);
  if (!v58)
  {
    uint64_t v121 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v44, v33, v34);
    uint64_t v47 = *(void *)(sub_225658410() + 16);
    swift_bridgeObjectRelease();
    if (!v47)
    {
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      uint64_t v51 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v52 = swift_allocObject();
      *(_OWORD *)(v52 + 16) = xmmword_225659D50;
      uint64_t v54 = *v134;
      uint64_t v53 = v134[1];
      *(void *)(v52 + 56) = MEMORY[0x263F8D310];
      *(void *)(v52 + 64) = sub_225626388();
      *(void *)(v52 + 32) = v54;
      *(void *)(v52 + 40) = v53;
      id v55 = v51;
      swift_bridgeObjectRetain();
      sub_225658DA0();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17_0();
      v56();
      uint64_t v45 = type metadata accessor for OverrideMatchResult(0);
      uint64_t v46 = v121;
      goto LABEL_18;
    }
    Array<A>.currentTurn.getter(v136, v2);
    uint64_t v48 = v137;
    OUTLINED_FUNCTION_8_4(v2, 1, v137);
    if (v58)
    {
      unint64_t v49 = &qword_26AD580E0;
      uint64_t v50 = v2;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 32))(v135, v2, v48);
      Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(v1);
      uint64_t v57 = v132;
      OUTLINED_FUNCTION_8_4(v1, 1, v132);
      if (!v58)
      {
        uint64_t v120 = v36;
        uint64_t v64 = (uint64_t)v44;
        uint64_t v65 = v131;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 32))(v131, v1, v57);
        char v66 = sub_22562A2F4(v65);
        if (v66)
        {
          char v67 = sub_225658B80();
          uint64_t v68 = v120;
          v69 = *(void (**)(uint64_t, uint64_t, uint64_t))(v120 + 16);
          uint64_t v119 = v64;
          v69(v3, v64, v34);
          if (v67)
          {
            if (sub_225658B60() != v126 || v70 != v127)
            {
              char v72 = sub_2256591A0();
              swift_bridgeObjectRelease();
              v73 = *(void (**)(void))(v120 + 8);
              OUTLINED_FUNCTION_40();
              v74();
              if ((v72 & 1) == 0)
              {
                sub_225658F80();
                if (qword_26AD58250 != -1) {
                  swift_once();
                }
                id v75 = (id)qword_26AD58298;
                uint64_t v76 = MEMORY[0x263F8EE78];
                sub_225658DA0();

                uint64_t v77 = (uint64_t)v128;
                sub_22562C314((uint64_t)v134, (uint64_t)v128, (void (*)(void))type metadata accessor for SiriNLOverride);
                OUTLINED_FUNCTION_9_0();
                v78();
                OUTLINED_FUNCTION_40();
                v73();
                goto LABEL_52;
              }
LABEL_33:
              uint64_t v82 = v119;
              char v83 = sub_225658BB0();
              v69(v40, v82, v34);
              v84 = v129;
              if (v83)
              {
                sub_225658BA0();
                char v85 = sub_22564CCE0();
                swift_bridgeObjectRetain();
                char v86 = sub_22564CCE0();
                char v87 = v86;
                if (v85 == 9)
                {
                  OUTLINED_FUNCTION_11_0();
                  v73();
                  if (v87 == 9) {
                    goto LABEL_49;
                  }
                  goto LABEL_39;
                }
                if (v86 == 9)
                {
                  uint64_t v88 = OUTLINED_FUNCTION_27_1();
                  ((void (*)(uint64_t))v73)(v88);
                  goto LABEL_39;
                }
                uint64_t v89 = sub_225628698(v85);
                uint64_t v91 = v90;
                if (v89 != sub_225628698(v87) || v91 != v92)
                {
                  char v94 = sub_2256591A0();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  OUTLINED_FUNCTION_11_0();
                  v73();
                  if (v94)
                  {
LABEL_49:
                    unint64_t v96 = *(void *)(v136 + 16);
                    unint64_t v97 = *(void *)(sub_225658410() + 16);
                    swift_bridgeObjectRelease();
                    if (v96 >= v97)
                    {
                      v128 = v73;
                      uint64_t v104 = sub_225658410();
                      MEMORY[0x270FA5388](v104);
                      uint64_t v105 = v123;
                      *(&v119 - 2) = v65;
                      *(&v119 - 1) = v105;
                      uint64_t v106 = swift_bridgeObjectRetain();
                      uint64_t v107 = 0;
                      uint64_t v108 = sub_22564DED4(v106, v104, (void (*)(char *, char *))sub_22562A60C, (uint64_t)(&v119 - 4));
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      uint64_t v109 = *(void *)(v108 + 16);
                      if (v109)
                      {
                        OUTLINED_FUNCTION_21_2();
                        uint64_t v111 = *(void *)(v110 + 72);
                        swift_bridgeObjectRetain();
                        char v112 = 1;
                        v113 = v134;
                        do
                        {
                          sub_22562C314(v107, (uint64_t)v84, (void (*)(void))type metadata accessor for TurnInputRuleMatchResult);
                          if (v112) {
                            char v112 = *v84;
                          }
                          else {
                            char v112 = 0;
                          }
                          sub_225637C24((uint64_t)v84);
                          v107 += v111;
                          --v109;
                        }
                        while (v109);
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        char v112 = 1;
                        v113 = v134;
                      }
                      uint64_t v114 = OUTLINED_FUNCTION_30_1();
                      v115(v114);
                      OUTLINED_FUNCTION_11_0();
                      v116();
                      uint64_t v117 = v121;
                      sub_22562C314((uint64_t)v113, v121, (void (*)(void))type metadata accessor for SiriNLOverride);
                      v102 = (int *)type metadata accessor for OverrideMatchResult(0);
                      *(unsigned char *)(v117 + v102[5]) = v112;
                      *(void *)(v117 + v102[6]) = v108;
                      *(void *)(v117 + v102[7]) = 0;
                      OUTLINED_FUNCTION_17_0();
                      v118();
                      uint64_t v46 = v117;
                      goto LABEL_62;
                    }
                    sub_225658F80();
                    if (qword_26AD58250 == -1) {
                      goto LABEL_51;
                    }
LABEL_63:
                    swift_once();
LABEL_51:
                    id v98 = (id)qword_26AD58298;
                    uint64_t v76 = MEMORY[0x263F8EE78];
                    OUTLINED_FUNCTION_14_2();
                    sub_225658DA0();

                    uint64_t v77 = (uint64_t)v128;
                    sub_22562C314((uint64_t)v134, (uint64_t)v128, (void (*)(void))type metadata accessor for SiriNLOverride);
                    uint64_t v99 = OUTLINED_FUNCTION_30_1();
                    v100(v99);
                    ((void (*)(uint64_t, uint64_t))v73)(v119, v34);
LABEL_52:
                    uint64_t v101 = v121;
                    sub_22562C2C0(v77, v121, (void (*)(void))type metadata accessor for SiriNLOverride);
                    v102 = (int *)type metadata accessor for OverrideMatchResult(0);
                    *(unsigned char *)(v101 + v102[5]) = 0;
                    *(void *)(v101 + v102[6]) = v76;
                    *(void *)(v101 + v102[7]) = 0;
                    OUTLINED_FUNCTION_17_0();
                    v103();
                    uint64_t v46 = v101;
LABEL_62:
                    uint64_t v63 = 0;
                    uint64_t v45 = (uint64_t)v102;
                    goto LABEL_19;
                  }
LABEL_39:
                  sub_225658F80();
                  if (qword_26AD58250 == -1) {
                    goto LABEL_51;
                  }
                  goto LABEL_63;
                }
                swift_bridgeObjectRelease_n();
              }
              uint64_t v95 = OUTLINED_FUNCTION_27_1();
              ((void (*)(uint64_t))v73)(v95);
              goto LABEL_49;
            }
            swift_bridgeObjectRelease();
            uint64_t v68 = v120;
          }
          uint64_t v81 = v3;
          v73 = *(void (**)(void))(v68 + 8);
          ((void (*)(uint64_t, uint64_t))v73)(v81, v34);
          goto LABEL_33;
        }
        OUTLINED_FUNCTION_9_5();
        v79();
        OUTLINED_FUNCTION_17_0();
        v80();
        uint64_t v60 = v121;
        goto LABEL_15;
      }
      OUTLINED_FUNCTION_9_5();
      v59();
      unint64_t v49 = &qword_26AD58258;
      uint64_t v50 = v1;
    }
    sub_22562793C(v50, v49);
    uint64_t v60 = v121;
LABEL_15:
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v61 = (id)qword_26AD58298;
    OUTLINED_FUNCTION_14_2();
    sub_225658DA0();

    OUTLINED_FUNCTION_17_0();
    v62();
    uint64_t v45 = type metadata accessor for OverrideMatchResult(0);
    uint64_t v46 = v60;
    goto LABEL_18;
  }
  sub_22562793C(v33, &qword_26AD57F08);
  uint64_t v45 = type metadata accessor for OverrideMatchResult(0);
  uint64_t v46 = v11;
LABEL_18:
  uint64_t v63 = 1;
LABEL_19:
  __swift_storeEnumTagSinglePayload(v46, v63, 1, v45);
  OUTLINED_FUNCTION_52();
}

uint64_t type metadata accessor for TurnInputRuleMatchResult(uint64_t a1)
{
  return sub_225629F40(a1, qword_26AD585A0);
}

void sub_225629E28()
{
  sub_225629EC8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_225629EC8()
{
  if (!qword_26AD58678)
  {
    type metadata accessor for UtteranceRuleMatchResult(255);
    unint64_t v0 = sub_225658FE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD58678);
    }
  }
}

uint64_t type metadata accessor for UtteranceRuleMatchResult(uint64_t a1)
{
  return sub_225629F40(a1, qword_26AD58638);
}

uint64_t sub_225629F40(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_225629F74()
{
  uint64_t result = sub_2256584F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t SiriNLOverride.nluRequestRule.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_225658D70();
  uint64_t v5 = OUTLINED_FUNCTION_5_4(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_0();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
  uint64_t v7 = OUTLINED_FUNCTION_5_4(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_9_6();
  uint64_t v8 = sub_225658BD0();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3_0();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for SiriNLOverride();
  sub_2256358A8(v1 + *(int *)(v15 + 60), v2, &qword_26AD57F08);
  if (__swift_getEnumTagSinglePayload(v2, 1, v8) != 1)
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
    v20(v14, v2, v8);
    v20(a1, v14, v8);
    goto LABEL_6;
  }
  sub_22562798C(v2, &qword_26AD57F08);
  uint64_t v16 = (uint64_t *)(v1 + *(int *)(v15 + 56));
  unint64_t v17 = v16[1];
  if (v17 >> 60 != 15)
  {
    uint64_t v18 = *v16;
    sub_225626B60(*v16, v17);
    sub_225626B60(v18, v17);
    sub_225658D60();
    sub_22565537C((unint64_t *)&qword_26AD58340, MEMORY[0x263F71B48]);
    sub_225658D80();
    sub_225635818(v18, v17);
LABEL_6:
    uint64_t v19 = 0;
    return __swift_storeEnumTagSinglePayload(a1, v19, 1, v8);
  }
  uint64_t v19 = 1;
  return __swift_storeEnumTagSinglePayload(a1, v19, 1, v8);
}

uint64_t sub_22562A2F4(uint64_t a1)
{
  uint64_t v53 = a1;
  uint64_t v1 = sub_225657C50();
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v2;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_225658BD0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v49 - v13;
  char v15 = sub_225658B70();
  uint64_t v16 = *(void *)(v8 + 16);
  OUTLINED_FUNCTION_2_4();
  ((void (*)(void))v16)();
  if ((v15 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v6);
    goto LABEL_18;
  }
  uint64_t v50 = v12;
  uint64_t v51 = v5;
  uint64_t v52 = v1;
  uint64_t v17 = sub_225658BC0();
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if ((v19 & 0x2000000000000000) != 0) {
    uint64_t v20 = HIBYTE(v19) & 0xF;
  }
  else {
    uint64_t v20 = v17 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v14, v6);
  if (v20)
  {
    unint64_t v49 = v21;
    uint64_t v22 = sub_225658BC0();
    uint64_t v24 = v23;
    uint64_t v20 = v53;
    if (v22 == sub_225657BD0() && v24 == v25)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v28 = v50;
      OUTLINED_FUNCTION_2_4();
      ((void (*)(void))v16)();
      uint64_t v37 = OUTLINED_FUNCTION_1_5();
      v38(v37);
    }
    else
    {
      uint64_t v20 = v25;
      char v27 = sub_2256591A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v28 = v50;
      OUTLINED_FUNCTION_2_4();
      ((void (*)(void))v16)();
      uint64_t v29 = OUTLINED_FUNCTION_1_5();
      v30(v29);
      if ((v27 & 1) == 0)
      {
        uint64_t v31 = sub_225658BC0();
        uint64_t v33 = v32;
        uint64_t v34 = sub_225657C00();
        if (v35)
        {
          if (v31 == v34 && v35 == v33) {
            LOBYTE(v20) = 1;
          }
          else {
            LOBYTE(v20) = sub_2256591A0();
          }
          swift_bridgeObjectRelease();
          uint64_t v45 = OUTLINED_FUNCTION_3_4();
          v46(v45);
          uint64_t v47 = OUTLINED_FUNCTION_4_4();
          v48(v47);
          swift_bridgeObjectRelease();
          return v20 & 1;
        }
        uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
        swift_bridgeObjectRetain();
        v42(v6, v8 + 16);
        uint64_t v43 = OUTLINED_FUNCTION_4_4();
        v44(v43);
        swift_bridgeObjectRelease_n();
LABEL_18:
        LOBYTE(v20) = 0;
        return v20 & 1;
      }
    }
    uint64_t v39 = OUTLINED_FUNCTION_3_4();
    v40(v39);
    v49(v28, v20);
    LOBYTE(v20) = 1;
  }
  return v20 & 1;
}

uint64_t sub_22562A60C@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  return sub_22562A63C(*(int **)(v2 + 16), a1, a2);
}

uint64_t sub_22562A63C@<X0>(int *a1@<X0>, char *a2@<X1>, char *a3@<X8>)
{
  sub_225657F50();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8_2();
  sub_225657E40();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v72 = sub_225657F00();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_0();
  uint64_t v12 = v11 - v10;
  uint64_t v71 = sub_225658590();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3_0();
  uint64_t v18 = v17 - v16;
  uint64_t matched = type metadata accessor for UtteranceRuleMatchResult(0);
  MEMORY[0x270FA5388](matched);
  OUTLINED_FUNCTION_3_0();
  uint64_t v21 = (unsigned char *)(v20 - v19);
  uint64_t v68 = v3;
  sub_2256585A0();
  sub_225658B40();
  v74 = a2;
  sub_225658B10();
  uint64_t v22 = v18;
  sub_22562ABA8(a1, v21);
  uint64_t v23 = (uint64_t)v21;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v72);
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  uint64_t v24 = (char *)(v14 + 8);
  v25(v18, v71);
  if (*v21)
  {
    uint64_t v26 = v68;
    uint64_t v27 = *(void *)(sub_225658410() + 16);
    swift_bridgeObjectRelease();
    if (v27)
    {
      uint64_t v28 = sub_225658410();
      uint64_t v29 = *(void *)(v28 + 16);
      if (!v29)
      {
        swift_bridgeObjectRelease();
LABEL_11:
        sub_225658F80();
        uint64_t v24 = a3;
        if (qword_26AD58250 != -1) {
          swift_once();
        }
        id v46 = (id)qword_26AD58298;
        sub_225658DA0();

        uint64_t v18 = type metadata accessor for TurnInputRuleMatchResult(0);
        uint64_t v47 = (uint64_t)&a3[*(int *)(v18 + 20)];
        sub_2256453D4(v23, v47);
        uint64_t v42 = v47;
        uint64_t v43 = 0;
        uint64_t v44 = 1;
        uint64_t v45 = matched;
        goto LABEL_14;
      }
      uint64_t v30 = sub_225658460();
      OUTLINED_FUNCTION_4_2(v30);
      unint64_t v32 = v28 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
      OUTLINED_FUNCTION_5_3();
      uint64_t v34 = *(void *)(v33 + 72);
      while (1)
      {
        uint64_t v24 = v74;
        sub_225658B00();
        sub_225657E30();
        uint64_t v35 = OUTLINED_FUNCTION_4_3();
        v36(v35);
        sub_225658B30();
        OUTLINED_FUNCTION_12_1();
        char v38 = v37;
        swift_bridgeObjectRelease();
        uint64_t v39 = OUTLINED_FUNCTION_6_3();
        v40(v39);
        if (v38) {
          break;
        }
        v32 += v34;
        if (!--v29)
        {
          swift_bridgeObjectRelease();
          uint64_t v23 = (uint64_t)v21;
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v23 = (uint64_t)v21;
      uint64_t v26 = v68;
    }
    uint64_t v18 = *(void *)(sub_2256585B0() + 16);
    swift_bridgeObjectRelease();
    if (v18)
    {
      uint64_t v50 = sub_2256585B0();
      uint64_t v51 = *(void *)(v50 + 16);
      if (v51)
      {
        uint64_t v52 = sub_225658460();
        OUTLINED_FUNCTION_4_2(v52);
        unint64_t v54 = v50 + ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80));
        OUTLINED_FUNCTION_5_3();
        uint64_t v18 = *(void *)(v55 + 72);
        while (1)
        {
          uint64_t v24 = v74;
          sub_225658B00();
          sub_225657E30();
          uint64_t v56 = OUTLINED_FUNCTION_4_3();
          v57(v56);
          sub_225658B30();
          OUTLINED_FUNCTION_12_1();
          uint64_t v26 = v58;
          swift_bridgeObjectRelease();
          uint64_t v59 = OUTLINED_FUNCTION_6_3();
          v60(v59);
          if (v26) {
            break;
          }
          v54 += v18;
          if (!--v51) {
            goto LABEL_21;
          }
        }
        swift_bridgeObjectRelease();
        sub_225658F80();
        if (qword_26AD58250 != -1) {
          swift_once();
        }
        id v67 = (id)qword_26AD58298;
        sub_225658DA0();

        uint64_t v18 = type metadata accessor for TurnInputRuleMatchResult(0);
        uint64_t v24 = a3;
        uint64_t v22 = (uint64_t)&a3[*(int *)(v18 + 20)];
        uint64_t v41 = v23;
        goto LABEL_9;
      }
LABEL_21:
      swift_bridgeObjectRelease();
    }
    type metadata accessor for TurnInputRuleMatchResult(0);
    uint64_t v61 = OUTLINED_FUNCTION_7_2();
    sub_2256453D4(v61, v26);
    char v49 = 1;
    uint64_t v62 = OUTLINED_FUNCTION_9_2();
    uint64_t result = __swift_storeEnumTagSinglePayload(v62, v63, v64, v65);
    goto LABEL_23;
  }
  type metadata accessor for TurnInputRuleMatchResult(0);
  uint64_t v41 = OUTLINED_FUNCTION_7_2();
LABEL_9:
  sub_2256453D4(v41, v22);
  uint64_t v42 = OUTLINED_FUNCTION_9_2();
LABEL_14:
  uint64_t result = __swift_storeEnumTagSinglePayload(v42, v43, v44, v45);
  char v49 = 0;
LABEL_23:
  uint64_t v66 = *(int *)(v18 + 24);
  char *v24 = v49;
  *(void *)&v24[v66] = 0;
  return result;
}

void sub_22562ABA8(int *a1@<X2>, unsigned char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = v6 - v5;
  sub_2256584E0();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3_0();
  uint64_t v11 = sub_2256584F0();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_8_2();
  sub_225658570();
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 88))(v2, v11);
  if (v15 == *MEMORY[0x263F71598])
  {
    sub_225658F70();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    uint64_t v16 = (int *)(id)qword_26AD58298;
    sub_225658DA0();

    type metadata accessor for UtteranceRuleMatchResult(0);
    OUTLINED_FUNCTION_13_1();
    uint64_t v17 = v16[6];
    *a2 = 0;
LABEL_12:
    *(void *)&a2[v17] = 0;
    *(void *)&a2[v16[7]] = 0;
    return;
  }
  if (v15 == *MEMORY[0x263F715A0])
  {
    sub_225658500();
    sub_2256584B0();
    uint64_t v18 = *(void (**)(uint64_t))(v9 + 8);
    uint64_t v19 = OUTLINED_FUNCTION_3_3();
    v18(v19);
    sub_225658500();
    sub_2256584D0();
    uint64_t v20 = OUTLINED_FUNCTION_3_3();
    v18(v20);
    sub_225658500();
    sub_2256584C0();
    uint64_t v21 = OUTLINED_FUNCTION_3_3();
    v18(v21);
    sub_225658580();
    uint64_t v22 = *(void (**)(void))(*(void *)(sub_225657C50() - 8) + 16);
    uint64_t v16 = a1;
    OUTLINED_FUNCTION_11_1();
    v22();
    OUTLINED_FUNCTION_10_2();
    sub_22562633C();
    uint64_t v31 = sub_225659010();
    uint64_t v24 = v23;
    sub_225635DC0(v7);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_1();
    v22();
    OUTLINED_FUNCTION_10_2();
    uint64_t v25 = sub_225659010();
    uint64_t v27 = v26;
    uint64_t v28 = v7;
    char v29 = 1;
    sub_225635DC0(v28);
    if (v31 != v25 || v24 != v27) {
      char v29 = sub_2256591A0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for UtteranceRuleMatchResult(0);
    OUTLINED_FUNCTION_13_1();
    uint64_t v17 = a1[6];
    *a2 = v29 & 1;
    goto LABEL_12;
  }
  if (v15 == *MEMORY[0x263F715A8])
  {
    sub_22562AF94();
  }
  else
  {
    sub_225659190();
    __break(1u);
  }
}

void sub_22562AF94()
{
  OUTLINED_FUNCTION_54();
  v128 = v1;
  uint64_t v122 = v2;
  uint64_t v123 = v4;
  uint64_t v124 = v3;
  uint64_t v125 = v5;
  sub_2256584A0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v9 = v8 - v7;
  uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_42();
  uint64_t v11 = sub_2256584E0();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_0();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_225658580();
  uint64_t v20 = v19;
  sub_225658500();
  char v21 = sub_2256584B0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  uint64_t v22 = v21 & 1;
  uint64_t v23 = sub_22562BDC4(0, &qword_26AD58148);
  id v28 = sub_22562BE00(v18, v20, v22, 0);
  char v29 = v0;
  uint64_t v120 = v9;
  swift_bridgeObjectRelease();
  id v30 = v28;
  uint64_t v31 = v123;
  unint64_t v32 = (void *)sub_225658DF0();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58290);
  sub_22562C088();
  sub_22562633C();
  uint64_t v33 = MEMORY[0x263F8D310];
  uint64_t v34 = sub_225658FB0();
  uint64_t v119 = v30;
  id v36 = objc_msgSend(v30, sel_matchesInString_options_range_, v32, 0, v34, v35);

  sub_22562BDC4(0, &qword_26AD58720);
  unint64_t v37 = sub_225658F20();

  if (!(v37 >> 62))
  {
    uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v39 = v125;
    uint64_t v40 = v128;
    if (v38 == 1)
    {

      if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_4;
      }
LABEL_79:

      swift_bridgeObjectRelease();
      uint64_t v107 = matched;
LABEL_85:
      sub_2256584F0();
      OUTLINED_FUNCTION_22();
      uint64_t v111 = OUTLINED_FUNCTION_62();
      v112(v111);
      uint64_t v113 = v107[6];
      *uint64_t v39 = 0;
      *(void *)&v39[v113] = 0;
      *(void *)&v39[v107[7]] = 0;
      goto LABEL_86;
    }
LABEL_80:
    swift_bridgeObjectRelease();
    if (v38 < 2)
    {
      uint64_t v40 = v119;

      goto LABEL_84;
    }
    sub_225658F90();
    uint64_t v40 = v119;
    if (qword_26AD58250 == -1)
    {
LABEL_82:
      uint64_t v108 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v109 = swift_allocObject();
      *(_OWORD *)(v109 + 16) = xmmword_22565A070;
      *(void *)(v109 + 56) = v23;
      *(void *)(v109 + 64) = sub_225642948();
      *(void *)(v109 + 32) = v40;
      *(void *)(v109 + 96) = v33;
      *(void *)(v109 + 104) = sub_225626388();
      *(void *)(v109 + 72) = v124;
      *(void *)(v109 + 80) = v123;
      swift_bridgeObjectRetain();
      id v110 = v108;
      sub_225658DA0();

      swift_bridgeObjectRelease();
LABEL_84:

      uint64_t v107 = matched;
      goto LABEL_85;
    }
LABEL_90:
    swift_once();
    goto LABEL_82;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_2256590F0();
  swift_bridgeObjectRelease();
  uint64_t v39 = v125;
  uint64_t v40 = v128;
  if (v38 != 1) {
    goto LABEL_80;
  }

  swift_bridgeObjectRetain();
  uint64_t v106 = sub_2256590F0();
  swift_bridgeObjectRelease();
  if (!v106) {
    goto LABEL_79;
  }
LABEL_4:
  uint64_t v41 = v29;
  if ((v37 & 0xC000000000000001) != 0) {
    goto LABEL_88;
  }
  if (!*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_90;
  }
  for (id i = *(id *)(v37 + 32); ; id i = (id)MEMORY[0x22A631010](0, v37))
  {
    uint64_t v43 = i;
    swift_bridgeObjectRelease();
    uint64_t v44 = &v41[matched[5]];
    uint64_t v45 = *MEMORY[0x263F715A8];
    sub_2256584F0();
    OUTLINED_FUNCTION_22();
    (*(void (**)(unsigned char *, uint64_t))(v46 + 104))(v44, v45);
    uint64_t v47 = matched[6];
    *uint64_t v41 = 0;
    uint64_t v114 = v47;
    *(void *)&v41[v47] = 0;
    *(void *)&v41[matched[7]] = v43;
    id v118 = v43;
    uint64_t v48 = sub_225658410();
    uint64_t v49 = v48;
    uint64_t v117 = *(void *)(v48 + 16);
    if (!v117)
    {

      swift_bridgeObjectRelease();
      unint64_t v37 = 0;
      uint64_t v51 = (void *)MEMORY[0x263F8EE80];
      goto LABEL_58;
    }
    unint64_t v37 = 0;
    unint64_t v50 = 0;
    uint64_t v51 = (void *)MEMORY[0x263F8EE80];
    v115 = v41;
    uint64_t v116 = v48;
LABEL_9:
    if (v50 < *(void *)(v49 + 16)) {
      break;
    }
    __break(1u);
LABEL_88:
    ;
  }
  OUTLINED_FUNCTION_3_1();
  v52();
  if ((sub_225658480() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v92 = (id)qword_26AD58298;
    sub_225658DA0();

    OUTLINED_FUNCTION_9_0();
    v93();
    goto LABEL_59;
  }
  uint64_t v53 = (uint64_t)v41;
  sub_225658470();
  unint64_t v54 = (void *)sub_225658DF0();
  swift_bridgeObjectRelease();
  id v55 = objc_msgSend(v118, sel_rangeWithName_, v54);
  uint64_t v57 = v56;

  if (v55 == (id)sub_225657AD0())
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_50();
    sub_225658F80();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    char v94 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v95 = swift_allocObject();
    *(_OWORD *)(v95 + 16) = xmmword_22565A070;
    id v96 = v94;
    uint64_t v97 = sub_225658470();
    uint64_t v99 = v98;
    uint64_t v100 = MEMORY[0x263F8D310];
    *(void *)(v95 + 56) = MEMORY[0x263F8D310];
    unint64_t v101 = sub_225626388();
    *(void *)(v95 + 64) = v101;
    *(void *)(v95 + 32) = v97;
    *(void *)(v95 + 40) = v99;
    uint64_t v102 = sub_225658580();
    *(void *)(v95 + 96) = v100;
    *(void *)(v95 + 104) = v101;
    *(void *)(v95 + 72) = v102;
    *(void *)(v95 + 80) = v103;
    sub_225658DA0();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_9_0();
    v104();
    goto LABEL_67;
  }
  uint64_t v58 = sub_22562C638(v120, (uint64_t)v55, v57, v122, (uint64_t)v40, v124, v31);
  if (!v58)
  {

    OUTLINED_FUNCTION_9_0();
    v105();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_50();
LABEL_67:
    sub_22562DE90(v53, (uint64_t)v39, (void (*)(void))type metadata accessor for UtteranceRuleMatchResult);
    uint64_t v91 = v53;
    goto LABEL_68;
  }
  uint64_t v59 = 0;
  unint64_t v121 = v50 + 1;
  uint64_t v60 = *(void *)(v58 + 64);
  uint64_t v126 = v58 + 64;
  uint64_t v61 = 1 << *(unsigned char *)(v58 + 32);
  if (v61 < 64) {
    uint64_t v62 = ~(-1 << v61);
  }
  else {
    uint64_t v62 = -1;
  }
  unint64_t v63 = v62 & v60;
  int64_t v127 = (unint64_t)(v61 + 63) >> 6;
  if ((v62 & v60) != 0)
  {
LABEL_17:
    unint64_t v64 = __clz(__rbit64(v63));
    v63 &= v63 - 1;
    uint64_t matched = v59;
    unint64_t v65 = v64 | ((void)v59 << 6);
    goto LABEL_32;
  }
  while (1)
  {
    int64_t v66 = (int64_t)v59 + 1;
    if (__OFADD__(v59, 1)) {
      goto LABEL_75;
    }
    if (v66 >= v127) {
      break;
    }
    unint64_t v67 = *(void *)(v126 + 8 * v66);
    int64_t v68 = (int64_t)v59 + 1;
    if (v67) {
      goto LABEL_31;
    }
    int64_t v68 = (int64_t)v59 + 2;
    if ((uint64_t)v59 + 2 >= v127) {
      break;
    }
    unint64_t v67 = *(void *)(v126 + 8 * v68);
    if (v67) {
      goto LABEL_31;
    }
    int64_t v68 = (int64_t)v59 + 3;
    if ((uint64_t)v59 + 3 >= v127) {
      break;
    }
    unint64_t v67 = *(void *)(v126 + 8 * v68);
    if (v67) {
      goto LABEL_31;
    }
    v69 = v59 + 1;
    if ((uint64_t)(v59 + 1) >= v127) {
      break;
    }
    unint64_t v67 = *(void *)(v126 + 8 * (void)v69);
    if (!v67)
    {
      while (1)
      {
        int64_t v68 = (int64_t)v69 + 1;
        if (__OFADD__(v69, 1)) {
          goto LABEL_76;
        }
        if (v68 >= v127) {
          goto LABEL_55;
        }
        unint64_t v67 = *(void *)(v126 + 8 * v68);
        v69 = (int *)((char *)v69 + 1);
        if (v67) {
          goto LABEL_31;
        }
      }
    }
    int64_t v68 = (int64_t)(v59 + 1);
LABEL_31:
    unint64_t v63 = (v67 - 1) & v67;
    uint64_t matched = (int *)v68;
    unint64_t v65 = __clz(__rbit64(v67)) + (v68 << 6);
LABEL_32:
    uint64_t v70 = v58;
    uint64_t v71 = *(void *)(*(void *)(v58 + 48) + 8 * v65);
    uint64_t v72 = *(void *)(*(void *)(v58 + 56) + 8 * v65);
    swift_bridgeObjectRetain();
    sub_2256429A8(v37);
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v73 = sub_225627E90(v71);
    if (__OFADD__(v51[2], (v74 & 1) == 0))
    {
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
      swift_once();
      id v24 = (id)qword_26AD58298;
      sub_225658DA0();

      sub_2256584F0();
      OUTLINED_FUNCTION_22();
      uint64_t v25 = OUTLINED_FUNCTION_62();
      v26(v25);
      uint64_t v27 = matched[6];
      *uint64_t v125 = 0;
      *(void *)&v125[v27] = 0;
      *(void *)&v125[matched[7]] = 0;
      goto LABEL_86;
    }
    unint64_t v37 = v73;
    char v75 = v74;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681027E0);
    if (sub_2256590D0())
    {
      unint64_t v76 = sub_225627E90(v71);
      if ((v75 & 1) != (v77 & 1))
      {
        sub_2256591D0();
        __break(1u);
        return;
      }
      unint64_t v37 = v76;
    }
    swift_bridgeObjectRelease();
    if (v75)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v51[(v37 >> 6) + 8] |= 1 << v37;
      *(void *)(v51[6] + 8 * v37) = v71;
      *(void *)(v51[7] + 8 * v37) = MEMORY[0x263F8EE78];
      uint64_t v78 = v51[2];
      uint64_t v79 = v78 + 1;
      BOOL v80 = __OFADD__(v78, 1);
      swift_bridgeObjectRetain();
      if (v80) {
        goto LABEL_73;
      }
      v51[2] = v79;
    }
    uint64_t v81 = v51[7];
    swift_bridgeObjectRelease();
    int64_t v82 = *(void *)(v72 + 16);
    uint64_t v83 = *(void *)(v81 + 8 * v37);
    uint64_t v84 = *(void *)(v83 + 16);
    if (__OFADD__(v84, v82)) {
      goto LABEL_70;
    }
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v81 + 8 * v37) = v83;
    if (!isUniquelyReferenced_nonNull_native || v84 + v82 > *(void *)(v83 + 24) >> 1)
    {
      sub_225644044();
      uint64_t v83 = v86;
      *(void *)(v81 + 8 * v37) = v86;
    }
    uint64_t v40 = v128;
    if (*(void *)(v72 + 16))
    {
      unint64_t v37 = (*(void *)(v83 + 24) >> 1) - *(void *)(v83 + 16);
      type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
      if ((uint64_t)v37 < v82) {
        goto LABEL_72;
      }
      swift_arrayInitWithCopy();
      if (v82)
      {
        uint64_t v87 = *(void *)(v83 + 16);
        BOOL v88 = __OFADD__(v87, v82);
        uint64_t v89 = v87 + v82;
        if (v88) {
          goto LABEL_74;
        }
        *(void *)(v83 + 16) = v89;
      }
    }
    else if (v82)
    {
      goto LABEL_71;
    }
    swift_bridgeObjectRelease();
    unint64_t v37 = (unint64_t)sub_22563F030;
    uint64_t v58 = v70;
    uint64_t v59 = matched;
    if (v63) {
      goto LABEL_17;
    }
  }
LABEL_55:
  swift_release();
  OUTLINED_FUNCTION_9_0();
  v90();
  unint64_t v50 = v121;
  uint64_t v39 = v125;
  uint64_t v41 = v115;
  uint64_t v31 = v123;
  uint64_t v49 = v116;
  if (v121 != v117) {
    goto LABEL_9;
  }

  swift_bridgeObjectRelease();
LABEL_58:

  *uint64_t v41 = 1;
  swift_bridgeObjectRelease();
  *(void *)&v41[v114] = v51;
LABEL_59:
  sub_22562DE90((uint64_t)v41, (uint64_t)v39, (void (*)(void))type metadata accessor for UtteranceRuleMatchResult);
  uint64_t v91 = (uint64_t)v41;
LABEL_68:
  sub_22562DEEC(v91, (void (*)(void))type metadata accessor for UtteranceRuleMatchResult);
  sub_2256429A8(v37);
LABEL_86:
  OUTLINED_FUNCTION_52();
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t sub_22562BDC4(uint64_t a1, unint64_t *a2)
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

id sub_22562BE00(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  if (a4) {
    a3 = 0;
  }
  uint64_t v9 = qword_26AD58700;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_6();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AD57F10);
  swift_endAccess();
  if (qword_26AD586E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v10 = qword_26AD586D8;
  swift_bridgeObjectRetain();
  id v11 = sub_22562BFF8(a1, a2, a3, v10);
  swift_bridgeObjectRelease();
  if (!v11)
  {
    swift_endAccess();
    id v12 = objc_allocWithZone(MEMORY[0x263F08AE8]);
    swift_bridgeObjectRetain();
    id v13 = sub_225635900(a1, a2, a3);
    if (v5)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_6();
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AD57F10);
      swift_endAccess();
      return v11;
    }
    uint64_t v15 = v13;
    swift_beginAccess();
    id v11 = v15;
    sub_225646348((uint64_t)v11, a1, a2, a3);
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_6();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AD57F10);
  swift_endAccess();
  return v11;
}

void *sub_22562BFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a4 + 16)) {
    return 0;
  }
  unint64_t v5 = sub_225627F94(a1, a2, a3);
  if ((v6 & 1) == 0) {
    return 0;
  }
  uint64_t v7 = *(void **)(*(void *)(a4 + 56) + 8 * v5);
  id v8 = v7;
  return v7;
}

uint64_t sub_22562C040(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_225627E90(a1), (v4 & 1) != 0)) {
    return *(void *)(*(void *)(a2 + 56) + 8 * v3);
  }
  else {
    return 0;
  }
}

unint64_t sub_22562C088()
{
  unint64_t result = qword_26AD58730;
  if (!qword_26AD58730)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD58290);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD58730);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
  return v2;
}

unsigned char *initializeWithCopy for UtteranceRuleMatchResult(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  id v8 = &a2[v6];
  uint64_t v9 = sub_2256584F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  id v11 = *(void **)&a2[v10];
  *(void *)&a1[v10] = v11;
  swift_bridgeObjectRetain();
  id v12 = v11;
  return a1;
}

uint64_t storeEnumTagSinglePayload for UtteranceRuleMatchResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22564A4CC);
}

void destroy for UtteranceRuleMatchResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2256584F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 28));
}

uint64_t sub_22562C2C0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_22();
  uint64_t v4 = OUTLINED_FUNCTION_42_0();
  v5(v4);
  return a2;
}

uint64_t sub_22562C314(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_22();
  uint64_t v4 = OUTLINED_FUNCTION_12_3();
  v5(v4);
  return a2;
}

unsigned char *initializeWithCopy for TurnInputRuleMatchResult(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  id v8 = &a2[v6];
  uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    *uint64_t v7 = *v8;
    uint64_t v11 = matched[5];
    id v12 = &v7[v11];
    id v13 = &v8[v11];
    uint64_t v14 = sub_2256584F0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    *(void *)&v7[matched[6]] = *(void *)&v8[matched[6]];
    uint64_t v15 = matched[7];
    uint64_t v16 = *(void **)&v8[v15];
    *(void *)&v7[v15] = v16;
    swift_bridgeObjectRetain();
    id v17 = v16;
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t getEnumTagSinglePayload for UtteranceRuleMatchResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22564A458);
}

uint64_t destroy for TurnInputRuleMatchResult(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t matched = type metadata accessor for UtteranceRuleMatchResult(0);
  if (!__swift_getEnumTagSinglePayload(v2, 1, matched))
  {
    uint64_t v4 = v2 + *(int *)(matched + 20);
    uint64_t v5 = sub_2256584F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t storeEnumTagSinglePayload for OverrideMatchResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_225649924);
}

uint64_t getEnumTagSinglePayload for OverrideMatchResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_225649894);
}

uint64_t getEnumTagSinglePayload for SiriNLOverride(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_225655F54);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return 0;
}

uint64_t sub_22562C638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v203 = a7;
  uint64_t v204 = a6;
  uint64_t v196 = a5;
  uint64_t v244 = a4;
  uint64_t v206 = a3;
  uint64_t v236 = a2;
  uint64_t v194 = type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
  uint64_t v193 = *(void *)(v194 - 8);
  MEMORY[0x270FA5388](v194);
  uint64_t v201 = (uint64_t)v191 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_225657CD0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v228 = v9;
  uint64_t v229 = v10;
  MEMORY[0x270FA5388](v9);
  v227 = (char *)v191 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_225657F00();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v233 = (char *)v191 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v234 = (char *)v191 - v16;
  uint64_t v17 = sub_2256580F0();
  uint64_t v210 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v223 = (char *)v191 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v240 = (char *)v191 - v20;
  uint64_t v21 = sub_225658560();
  uint64_t v205 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  id v24 = (char *)v191 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  v208 = (char *)v191 - v26;
  MEMORY[0x270FA5388](v25);
  v212 = (char *)v191 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58718);
  MEMORY[0x270FA5388](v28);
  v202 = (char *)v191 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58288);
  uint64_t v31 = MEMORY[0x270FA5388](v30 - 8);
  uint64_t v33 = (char *)v191 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  v195 = (void *)((char *)v191 - v35);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)v191 - v37;
  MEMORY[0x270FA5388](v36);
  v215 = (char *)v191 - v39;
  uint64_t v224 = a1;
  uint64_t v40 = *(void *)(sub_225658410() + 16);
  swift_bridgeObjectRelease();
  if (!v40)
  {
    sub_225658F80();
    if (qword_26AD58250 == -1)
    {
LABEL_80:
      id v139 = (id)qword_26AD58298;
      sub_225658DA0();

      return MEMORY[0x263F8EE80];
    }
LABEL_140:
    swift_once();
    goto LABEL_80;
  }
  v207 = (unint64_t *)v38;
  uint64_t v41 = v236 + v206;
  if (__OFADD__(v236, v206))
  {
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  v192 = (unint64_t *)v33;
  v197 = v24;
  uint64_t v218 = sub_225658410();
  unint64_t v220 = 0;
  v217 = (void (**)(char *, char *, uint64_t))(v205 + 16);
  v219 = (void (**)(char *, char *, uint64_t))(v205 + 32);
  uint64_t v239 = v210 + 16;
  v242 = (void (**)(char *, uint64_t))(v13 + 8);
  v243 = (void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v225 = v229 + 8;
  uint64_t v226 = v229 + 16;
  v231 = (void (**)(char *, uint64_t))(v210 + 8);
  v211 = (void (**)(unint64_t, char *, uint64_t))(v210 + 32);
  uint64_t v199 = v41 - 1;
  BOOL v42 = __OFSUB__(v41, 1);
  BOOL v200 = v42;
  long long v198 = xmmword_225659D50;
  v222 = (void *)MEMORY[0x263F8EE78];
  uint64_t v209 = v21;
  uint64_t v235 = v17;
  v221 = (void (**)(char *, uint64_t))(v205 + 8);
  uint64_t v43 = v28;
  uint64_t v216 = v28;
  uint64_t v44 = v212;
  uint64_t v232 = v41;
  while (1)
  {
    unint64_t v45 = *(void *)(v218 + 16);
    uint64_t v46 = v215;
    if (v220 == v45)
    {
      uint64_t v47 = 1;
      uint64_t v48 = (uint64_t)v207;
    }
    else
    {
      if (v220 >= v45) {
        goto LABEL_133;
      }
      uint64_t v49 = v44;
      uint64_t v50 = v21;
      unint64_t v51 = v220;
      unint64_t v241 = v220 + 1;
      uint64_t v52 = v205;
      uint64_t v53 = &v202[*(int *)(v43 + 48)];
      (*(void (**)(char *, unint64_t, uint64_t))(v205 + 16))(v53, v218+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(void *)(v52 + 72) * v220, v50);
      uint64_t v48 = (uint64_t)v207;
      unint64_t v54 = (char *)v207 + *(int *)(v43 + 48);
      unint64_t *v207 = v51;
      uint64_t v21 = v50;
      uint64_t v44 = v49;
      id v55 = v53;
      uint64_t v46 = v215;
      (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v54, v55, v21);
      uint64_t v47 = 0;
      unint64_t v220 = v241;
    }
    __swift_storeEnumTagSinglePayload(v48, v47, 1, v43);
    sub_22562DE38(v48, (uint64_t)v46, &qword_26AD58288);
    if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v43) == 1) {
      break;
    }
    unint64_t v241 = *(void *)v46;
    (*v219)(v44, &v46[*(int *)(v43 + 48)], v21);
    char v56 = sub_225658550();
    uint64_t v57 = v208;
    (*v217)(v208, v44, v21);
    if ((v56 & 1) == 0)
    {
      uint64_t v62 = *v221;
      (*v221)(v57, v21);
      uint64_t v63 = v236;
      goto LABEL_62;
    }
    uint64_t v58 = sub_225658540();
    unint64_t v60 = v59;
    swift_bridgeObjectRelease();
    if ((v60 & 0x2000000000000000) != 0) {
      uint64_t v61 = HIBYTE(v60) & 0xF;
    }
    else {
      uint64_t v61 = v58 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v62 = *v221;
    (*v221)(v57, v21);
    uint64_t v63 = v236;
    if (v61)
    {
      unint64_t v64 = v212;
      uint64_t v65 = sub_225658540();
      uint64_t v67 = v196;
      if (!*(void *)(v196 + 16) || (unint64_t v68 = sub_225627F1C(v65, v66), (v69 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        v188 = v64;
        goto LABEL_125;
      }
      uint64_t v70 = *(void *)(*(void *)(v67 + 56) + 8 * v68);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v71 = *(void *)(v70 + 16);
      if (v71)
      {
        v214 = v62;
        unint64_t v72 = (*(unsigned __int8 *)(v210 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v210 + 80);
        v191[1] = v70;
        unint64_t v213 = v72;
        uint64_t v73 = v70 + v72;
        char v74 = *(void (**)(char *, uint64_t, uint64_t))(v210 + 16);
        uint64_t v237 = *(void *)(v210 + 72);
        v238 = v74;
        uint64_t v230 = MEMORY[0x263F8EE78];
        char v75 = v240;
        while (1)
        {
          v238(v75, v73, v17);
          unsigned int v76 = sub_225658030();
          char v77 = *v243;
          uint64_t v78 = v234;
          (*v243)(v234, v244, v12);
          unint64_t v79 = *(void *)(sub_225657EE0() + 16);
          swift_bridgeObjectRelease();
          BOOL v80 = *v242;
          (*v242)(v78, v12);
          if (v79 <= v76)
          {
            uint64_t v89 = -1;
            BOOL v88 = v233;
          }
          else
          {
            uint64_t v81 = sub_225657EE0();
            if (*(void *)(v81 + 16) <= (unint64_t)v76)
            {
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
              goto LABEL_135;
            }
            uint64_t v82 = v229;
            unint64_t v83 = v81
                + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80))
                + *(void *)(v82 + 72) * v76;
            char v85 = v227;
            uint64_t v84 = v228;
            (*(void (**)(char *, unint64_t, uint64_t))(v229 + 16))(v227, v83, v228);
            swift_bridgeObjectRelease();
            int v86 = sub_225657CC0();
            uint64_t v87 = *(void (**)(char *, uint64_t))(v82 + 8);
            BOOL v88 = v233;
            v87(v85, v84);
            uint64_t v89 = v86;
          }
          char v75 = v240;
          unsigned int v90 = sub_225658000();
          v77(v88, v244, v12);
          if (v90)
          {
            unint64_t v91 = v90;
            unint64_t v92 = *(void *)(sub_225657EE0() + 16);
            swift_bridgeObjectRelease();
            v80(v88, v12);
            uint64_t v41 = v232;
            if (v92 >= v91)
            {
              uint64_t v93 = sub_225657EE0();
              if (*(void *)(v93 + 16) < v91) {
                goto LABEL_130;
              }
              unint64_t v94 = v91 - 1;
              BOOL v95 = v241 != 0;
              uint64_t v96 = v228;
              uint64_t v97 = v229;
              uint64_t v98 = v227;
              (*(void (**)(char *, unint64_t, uint64_t))(v229 + 16))(v227, v93+ ((*(unsigned __int8 *)(v97 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80))+ *(void *)(v229 + 72) * v94, v228);
              swift_bridgeObjectRelease();
              int v99 = sub_225657CB0();
              (*(void (**)(char *, uint64_t))(v97 + 8))(v98, v96);
              uint64_t v100 = v99;
              char v101 = v89 == v236 || v95;
              if (v89 < v236 || v41 < v99)
              {
                uint64_t v17 = v235;
                char v75 = v240;
                goto LABEL_57;
              }
              char v75 = v240;
              if (v101) {
                goto LABEL_46;
              }
              goto LABEL_56;
            }
          }
          else
          {
            v80(v88, v12);
            uint64_t v41 = v232;
          }
          BOOL v103 = v241 != 0;
          if (v89 == v236) {
            BOOL v103 = 1;
          }
          BOOL v104 = v89 < v236 || v41 < -1;
          if (!v104 && v103)
          {
            uint64_t v100 = -1;
LABEL_46:
            uint64_t v105 = *(void *)(sub_225658410() + 16);
            swift_bridgeObjectRelease();
            if (v241 != v105 - 1 || v100 == v41)
            {
              uint64_t v17 = v235;
              v238(v223, (uint64_t)v75, v235);
              if (swift_isUniquelyReferenced_nonNull_native())
              {
                uint64_t v107 = v230;
              }
              else
              {
                sub_225643F04();
                uint64_t v107 = v109;
              }
              unint64_t v108 = *(void *)(v107 + 16);
              if (v108 >= *(void *)(v107 + 24) >> 1)
              {
                sub_225643F04();
                uint64_t v107 = v110;
              }
              *(void *)(v107 + 16) = v108 + 1;
              uint64_t v230 = v107;
              (*v211)(v107 + v213 + v108 * v237, v223, v17);
              goto LABEL_57;
            }
          }
LABEL_56:
          uint64_t v17 = v235;
LABEL_57:
          (*v231)(v75, v17);
          v73 += v237;
          if (!--v71)
          {
            swift_bridgeObjectRelease();
            uint64_t v21 = v209;
            uint64_t v44 = v212;
            uint64_t v62 = v214;
            uint64_t v129 = v230;
            goto LABEL_73;
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v129 = MEMORY[0x263F8EE78];
      uint64_t v44 = v212;
LABEL_73:
      uint64_t v130 = v216;
      if (!*(void *)(v129 + 16))
      {
        swift_bridgeObjectRelease();
        v188 = v44;
LABEL_125:
        v62(v188, v21);
        swift_bridgeObjectRelease();
LABEL_126:
        swift_bridgeObjectRelease();
        return 0;
      }
      uint64_t v230 = v129;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225643F38(0, v222[2] + 1, 1, v222);
        v222 = v137;
      }
      unint64_t v132 = v222[2];
      unint64_t v131 = v222[3];
      uint64_t v133 = v230;
      if (v132 >= v131 >> 1)
      {
        sub_225643F38(v131 > 1, v132 + 1, 1, v222);
        uint64_t v133 = v230;
        v222 = v138;
      }
      v134 = v222;
      v222[2] = v132 + 1;
      v134[v132 + 4] = v133;
      v62(v44, v21);
      uint64_t v43 = v130;
    }
    else
    {
LABEL_62:
      uint64_t v111 = v204;
      uint64_t v112 = v203;
      sub_225658F60();
      if (v113)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_115;
      }
      v214 = v62;
      uint64_t v114 = sub_225658F00();
      uint64_t v116 = v115;
      uint64_t v118 = v117;
      uint64_t v120 = v119;
      sub_225642DF0();
      if ((v121 & 0x100000000) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v21 = v209;
        uint64_t v111 = v204;
        goto LABEL_114;
      }
      if (v200) {
        goto LABEL_131;
      }
      sub_225642DF0();
      if ((v122 & 0x100000000) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v21 = v209;
        uint64_t v111 = v204;
        uint64_t v63 = v236;
LABEL_114:
        uint64_t v62 = v214;
LABEL_115:
        sub_225658F80();
        if (qword_26AD58250 != -1) {
          swift_once();
        }
        v183 = (void *)qword_26AD58298;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
        uint64_t v184 = swift_allocObject();
        uint64_t v185 = MEMORY[0x263F8D6C8];
        *(_OWORD *)(v184 + 16) = xmmword_22565A080;
        uint64_t v186 = MEMORY[0x263F8D750];
        *(void *)(v184 + 56) = v185;
        *(void *)(v184 + 64) = v186;
        *(void *)(v184 + 32) = v63;
        *(void *)(v184 + 96) = v185;
        *(void *)(v184 + 104) = v186;
        *(void *)(v184 + 72) = v41;
        *(void *)(v184 + 136) = MEMORY[0x263F8D310];
        *(void *)(v184 + 144) = sub_225626388();
        *(void *)(v184 + 112) = v111;
        *(void *)(v184 + 120) = v112;
        id v187 = v183;
        swift_bridgeObjectRetain();
        sub_225658DA0();

        swift_bridgeObjectRelease();
        v62(v212, v21);
        return 0;
      }
      int v123 = v122;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58738);
      uint64_t v124 = swift_allocObject();
      *(_OWORD *)(v124 + 16) = v198;
      sub_2256580E0();
      sub_2256580B0();
      sub_225658040();
      if (v123 == -1) {
        goto LABEL_132;
      }
      sub_225658010();
      MEMORY[0x22A630DD0](v114, v116, v118, v120);
      sub_225658090();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225643F38(0, v222[2] + 1, 1, v222);
        v222 = v135;
      }
      uint64_t v21 = v209;
      uint64_t v43 = v216;
      uint64_t v44 = v212;
      uint64_t v125 = v214;
      unint64_t v127 = v222[2];
      unint64_t v126 = v222[3];
      if (v127 >= v126 >> 1)
      {
        sub_225643F38(v126 > 1, v127 + 1, 1, v222);
        v222 = v136;
      }
      v128 = v222;
      v222[2] = v127 + 1;
      v128[v127 + 4] = v124;
      v125(v44, v21);
      uint64_t v17 = v235;
    }
  }
  swift_bridgeObjectRelease();
  static MatchingSpanUtils.getAdjacentSpanLists(from:usingTokens:)();
  uint64_t v142 = v141;
  swift_bridgeObjectRelease();
  unint64_t v143 = *(void *)(v142 + 16);
  v144 = v197;
  if (v143 >= 2)
  {
    sub_225658F80();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v145 = (id)qword_26AD58298;
    sub_225658DA0();

    unint64_t v143 = *(void *)(v142 + 16);
  }
  if (!v143) {
    goto LABEL_126;
  }
  uint64_t v146 = *(void *)(v142 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v147 = *(void *)(v146 + 16);
  uint64_t v148 = *(void *)(sub_225658410() + 16);
  swift_bridgeObjectRelease();
  if (v147 != v148)
  {
    swift_bridgeObjectRelease();
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v189 = (id)qword_26AD58298;
    sub_225658DA0();

    return 0;
  }
  uint64_t v149 = v43;
  uint64_t v150 = sub_225658410();
  v151 = 0;
  unint64_t v152 = 0;
  v140 = (void *)MEMORY[0x263F8EE80];
  unint64_t v153 = *(void *)(v150 + 16);
  uint64_t v244 = v150;
  while (2)
  {
    if (v152 == v153)
    {
      uint64_t v154 = 1;
      unint64_t v152 = v153;
      uint64_t v155 = (uint64_t)v192;
    }
    else
    {
      if (v152 >= *(void *)(v150 + 16)) {
        goto LABEL_137;
      }
      uint64_t v156 = v205;
      v157 = &v202[*(int *)(v216 + 48)];
      (*(void (**)(char *, unint64_t, uint64_t))(v205 + 16))(v157, v150+ ((*(unsigned __int8 *)(v156 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80))+ *(void *)(v156 + 72) * v152, v21);
      uint64_t v155 = (uint64_t)v192;
      v158 = (char *)v192 + *(int *)(v216 + 48);
      unint64_t *v192 = v152;
      v159 = *(void (**)(char *, char *, uint64_t))(v156 + 32);
      v144 = v197;
      v159(v158, v157, v21);
      uint64_t v154 = 0;
      ++v152;
      uint64_t v149 = v216;
    }
    __swift_storeEnumTagSinglePayload(v155, v154, 1, v149);
    v160 = v195;
    sub_22562DE38(v155, (uint64_t)v195, &qword_26AD58288);
    if (__swift_getEnumTagSinglePayload((uint64_t)v160, 1, v149) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2256429A8((uint64_t)v151);
      return (uint64_t)v140;
    }
    uint64_t v161 = v21;
    unint64_t v162 = *v160;
    (*v219)(v144, (char *)v160 + *(int *)(v149 + 48), v161);
    int v163 = sub_225658520();
    if ((v162 & 0x8000000000000000) != 0) {
      goto LABEL_134;
    }
    if (v162 >= *(void *)(v146 + 16))
    {
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
      goto LABEL_139;
    }
    uint64_t v164 = v163;
    unint64_t v165 = v146
         + ((*(unsigned __int8 *)(v210 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v210 + 80))
         + *(void *)(v210 + 72) * v162;
    uint64_t v166 = v201;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v210 + 16))(v201, v165, v235);
    *(void *)(v166 + *(int *)(v194 + 20)) = (int)sub_225658530();
    sub_2256429A8((uint64_t)v151);
    swift_isUniquelyReferenced_nonNull_native();
    v245 = v140;
    unint64_t v167 = sub_225627E90(v164);
    if (__OFADD__(v140[2], (v168 & 1) == 0)) {
      goto LABEL_136;
    }
    unint64_t v169 = v167;
    char v170 = v168;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681027E0);
    char v171 = sub_2256590D0();
    v140 = v245;
    if ((v171 & 1) == 0)
    {
LABEL_99:
      swift_bridgeObjectRelease();
      if (v170)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v140[(v169 >> 6) + 8] |= 1 << v169;
        *(void *)(v140[6] + 8 * v169) = v164;
        *(void *)(v140[7] + 8 * v169) = MEMORY[0x263F8EE78];
        uint64_t v174 = v140[2];
        uint64_t v175 = v174 + 1;
        BOOL v176 = __OFADD__(v174, 1);
        swift_bridgeObjectRetain();
        if (v176) {
          goto LABEL_138;
        }
        v140[2] = v175;
      }
      uint64_t v177 = v140[7];
      swift_bridgeObjectRelease();
      uint64_t v178 = *(void *)(v177 + 8 * v169);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v177 + 8 * v169) = v178;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_225644044();
        uint64_t v178 = v181;
        *(void *)(v177 + 8 * v169) = v181;
      }
      unint64_t v180 = *(void *)(v178 + 16);
      if (v180 >= *(void *)(v178 + 24) >> 1)
      {
        sub_225644044();
        uint64_t v178 = v182;
        *(void *)(v177 + 8 * v169) = v182;
      }
      *(void *)(v178 + 16) = v180 + 1;
      sub_22563A52C(v201, v178+ ((*(unsigned __int8 *)(v193 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v193 + 80))+ *(void *)(v193 + 72) * v180);
      v144 = v197;
      uint64_t v21 = v209;
      (*v221)(v197, v209);
      v151 = sub_22563F030;
      uint64_t v149 = v216;
      uint64_t v150 = v244;
      continue;
    }
    break;
  }
  unint64_t v172 = sub_225627E90(v164);
  if ((v170 & 1) == (v173 & 1))
  {
    unint64_t v169 = v172;
    goto LABEL_99;
  }
  uint64_t result = sub_2256591D0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode()
{
  uint64_t result = qword_26AD582A8;
  if (!qword_26AD582A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22562DDA0()
{
  uint64_t result = sub_2256580F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22562DE38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_58();
  v4();
  return a2;
}

uint64_t sub_22562DE90(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_1();
  v4();
  return a2;
}

uint64_t sub_22562DEEC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

void sub_22562DF40()
{
  OUTLINED_FUNCTION_54();
  uint64_t v62 = v1;
  uint64_t v3 = v2;
  sub_225658440();
  OUTLINED_FUNCTION_0();
  uint64_t v60 = v5;
  uint64_t v61 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v59 = &v57[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_34();
  uint64_t v7 = sub_225657F50();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_2();
  uint64_t v66 = v11;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = &v57[-v14];
  uint64_t v16 = sub_225658460();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_2_2();
  char v69 = v20;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_25();
  uint64_t v65 = v22;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = &v57[-v24];
  char v26 = sub_2256583F0();
  uint64_t v70 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v71 = v0;
  uint64_t v64 = v18 + 16;
  v70(v25, v0, v16);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  uint64_t v68 = v3;
  uint64_t v63 = v27;
  v27((uint64_t)v15, v3, v7);
  uint64_t v67 = v9;
  if (v26)
  {
    sub_225658400();
    unint64_t v28 = (unint64_t)v59;
    sub_225658420();
    int v58 = sub_22562E558((uint64_t)v15, v28);
    OUTLINED_FUNCTION_9_0();
    v29();
    uint64_t v30 = *(void (**)(void))(v9 + 8);
    OUTLINED_FUNCTION_40();
    v30();
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_40();
    v30();
    uint64_t v31 = *(void (**)(void))(v18 + 8);
    OUTLINED_FUNCTION_11_0();
    v31();
    if ((v58 & 1) == 0)
    {
      sub_225658F80();
      if (qword_26AD58250 == -1) {
        goto LABEL_22;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v30 = *(void (**)(void))(v9 + 8);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_11_0();
    v30();
    uint64_t v31 = *(void (**)(void))(v18 + 8);
    ((void (*)(unsigned char *, uint64_t))v31)(v25, v16);
  }
  uint64_t v32 = (void (*)(unsigned char *, uint64_t, uint64_t))v16;
  uint64_t v33 = v71;
  char v34 = sub_225658450();
  uint64_t v35 = v65;
  v70(v65, v33, (uint64_t)v32);
  v63(v66, v68, v7);
  if (v34)
  {
    int v36 = sub_225658430();
    int v37 = sub_22563A670();
    OUTLINED_FUNCTION_11_0();
    v30();
    OUTLINED_FUNCTION_11_0();
    v31();
    if ((v36 ^ v37))
    {
      sub_225658F80();
      if (qword_26AD58250 == -1) {
        goto LABEL_22;
      }
      goto LABEL_27;
    }
  }
  else
  {
    OUTLINED_FUNCTION_11_0();
    v30();
    ((void (*)(unsigned char *, void (*)(unsigned char *, uint64_t, uint64_t)))v31)(v35, v32);
  }
  uint64_t v38 = v71;
  uint64_t v39 = *(void *)(sub_225658410() + 16);
  swift_bridgeObjectRelease();
  v70(v69, v38, (uint64_t)v32);
  if (!v39)
  {
LABEL_24:
    OUTLINED_FUNCTION_11_0();
    v31();
    goto LABEL_25;
  }
  uint64_t v40 = sub_225658410();
  uint64_t v71 = *(void *)(v40 + 16);
  if (!v71)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  uint64_t v68 = v18;
  uint64_t v70 = v32;
  uint64_t v41 = sub_2256580F0();
  uint64_t v42 = 0;
  OUTLINED_FUNCTION_4_2(v41);
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  unint64_t v47 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  unint64_t v48 = v40 + v47;
  uint64_t v49 = *(void *)(v62 + 16);
  uint64_t v50 = *(void *)(v46 + 72);
  uint64_t v51 = v62 + v47;
  while (v49)
  {
    unint64_t v52 = v48;
    ++v42;
    swift_bridgeObjectRetain();
    uint64_t v53 = v51;
    uint64_t v54 = v51;
    uint64_t v55 = v49;
    while ((sub_22563AE74(v54) & 1) == 0)
    {
      v54 += v50;
      if (!--v55)
      {
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v48 = v52;
    uint64_t v51 = v53;
    if (v42 == v71) {
      goto LABEL_23;
    }
  }
LABEL_21:
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_0();
  v31();
  sub_225658F80();
  if (qword_26AD58250 == -1) {
    goto LABEL_22;
  }
LABEL_27:
  swift_once();
LABEL_22:
  id v56 = (id)qword_26AD58298;
  OUTLINED_FUNCTION_14_2();
  sub_225658DA0();

LABEL_25:
  OUTLINED_FUNCTION_52();
}

uint64_t sub_22562E558(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v391 = a2;
  uint64_t v386 = a1;
  uint64_t v326 = sub_225658740();
  uint64_t v325 = *(void *)(v326 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v326);
  v324 = (char *)&v321 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v323 = (char *)&v321 - v6;
  uint64_t v343 = sub_225657F50();
  uint64_t v342 = *(void *)(v343 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v343);
  v331 = (char *)&v321 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v332 = (char *)&v321 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v338 = (char *)&v321 - v12;
  MEMORY[0x270FA5388](v11);
  v339 = (char *)&v321 - v13;
  uint64_t v384 = sub_225658680();
  uint64_t v337 = *(void *)(v384 - 8);
  MEMORY[0x270FA5388](v384);
  v383 = (char *)&v321 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v376 = sub_2256585F0();
  v359 = *(void (***)(char *, uint64_t))(v376 - 8);
  MEMORY[0x270FA5388](v376);
  v375 = (char *)&v321 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v374 = sub_2256582F0();
  v358 = *(void (***)(char *, uint64_t))(v374 - 8);
  MEMORY[0x270FA5388](v374);
  v373 = (void (*)(char *, uint64_t))((char *)&v321 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v385 = sub_225658120();
  v355 = *(char **)(v385 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v385);
  v392 = (char *)&v321 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v377 = (uint64_t *)((char *)&v321 - v19);
  uint64_t v396 = sub_2256588D0();
  uint64_t v20 = *(void *)(v396 - 8);
  MEMORY[0x270FA5388](v396);
  v395 = (void (**)(char *, uint64_t))((char *)&v321 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v357 = sub_225658810();
  uint64_t v22 = *(void *)(v357 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v357);
  v352 = (char *)&v321 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v393 = (void (**)(char *, uint64_t))((char *)&v321 - v26);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v400 = (char *)&v321 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v346 = (void (**)(char *, uint64_t))((char *)&v321 - v30);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v345 = (char *)&v321 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v401 = (uint64_t)&v321 - v33;
  uint64_t v354 = sub_225658AF0();
  unint64_t v390 = *(void *)(v354 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v354);
  uint64_t v402 = (uint64_t)&v321 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v344 = (char *)&v321 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v322 = (char *)&v321 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v330 = (void (**)(char *, uint64_t))((char *)&v321 - v41);
  MEMORY[0x270FA5388](v40);
  unint64_t v341 = (unint64_t)&v321 - v42;
  uint64_t v368 = sub_225658AC0();
  v389 = *(void (***)(char *, uint64_t))(v368 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v368);
  v364 = (char *)&v321 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v353 = (char *)&v321 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v328 = (char *)&v321 - v48;
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v334 = (char *)&v321 - v50;
  MEMORY[0x270FA5388](v49);
  v347 = (char *)&v321 - v51;
  uint64_t v404 = sub_225657DD0();
  uint64_t v372 = *(void *)(v404 - 8);
  uint64_t v52 = MEMORY[0x270FA5388](v404);
  v382 = (char *)&v321 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v369 = (char *)&v321 - v55;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v403 = (char *)&v321 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v321 = (char *)&v321 - v59;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  unint64_t v329 = (unint64_t)&v321 - v61;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v327 = (char *)&v321 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v333 = (void (**)(char *, char *, uint64_t))((char *)&v321 - v65);
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v350 = (char *)&v321 - v67;
  MEMORY[0x270FA5388](v66);
  v381 = (void (**)(char **, uint64_t))((char *)&v321 - v68);
  unint64_t v398 = sub_225658620();
  uint64_t v366 = *(void *)(v398 - 8);
  uint64_t v69 = MEMORY[0x270FA5388](v398);
  v394 = (char *)&v321 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = MEMORY[0x270FA5388](v69);
  v397 = (char *)&v321 - v72;
  uint64_t v73 = MEMORY[0x270FA5388](v71);
  v349 = (char *)&v321 - v74;
  uint64_t v75 = MEMORY[0x270FA5388](v73);
  unint64_t v365 = (unint64_t)&v321 - v76;
  MEMORY[0x270FA5388](v75);
  v399 = (char *)&v321 - v77;
  uint64_t v78 = sub_225657E20();
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  v335 = (char *)&v321 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = MEMORY[0x270FA5388](v80);
  v336 = (char *)&v321 - v83;
  uint64_t v84 = MEMORY[0x270FA5388](v82);
  v340 = (char *)&v321 - v85;
  uint64_t v86 = MEMORY[0x270FA5388](v84);
  v351 = (char *)&v321 - v87;
  uint64_t v88 = MEMORY[0x270FA5388](v86);
  v348 = (char *)&v321 - v89;
  uint64_t v90 = MEMORY[0x270FA5388](v88);
  v367 = (char *)&v321 - v91;
  uint64_t v92 = MEMORY[0x270FA5388](v90);
  v356 = (char *)&v321 - v93;
  uint64_t v94 = MEMORY[0x270FA5388](v92);
  v370 = (char *)&v321 - v95;
  uint64_t v96 = MEMORY[0x270FA5388](v94);
  uint64_t v98 = (char *)&v321 - v97;
  uint64_t v99 = MEMORY[0x270FA5388](v96);
  v360 = (char *)&v321 - v100;
  MEMORY[0x270FA5388](v99);
  uint64_t v102 = (char *)&v321 - v101;
  v388 = 0;
  uint64_t v103 = sub_225658440();
  uint64_t v104 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v106 = (char *)&v321 - ((v105 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, unint64_t, uint64_t))(v104 + 16))(v106, v391, v103);
  uint64_t v362 = v104;
  uint64_t v107 = *(uint64_t (**)(char *, uint64_t))(v104 + 88);
  v361 = v106;
  uint64_t v363 = v103;
  int v108 = v107(v106, v103);
  int v109 = *MEMORY[0x263F71590];
  uint64_t v110 = (void (**)(char *, uint64_t))(v79 + 8);
  uint64_t v380 = (v79 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v371 = v3;
  uint64_t v379 = v78;
  uint64_t v378 = v79 + 8;
  if (v108 == v109)
  {
    sub_225657F20();
    uint64_t v111 = sub_225657E10();
    v387 = *v110;
    v387(v102, v78);
    uint64_t v112 = *(void *)(v111 + 16);
    uint64_t v113 = v78;
    if (!v112)
    {
      swift_bridgeObjectRelease();
LABEL_132:
      uint64_t v178 = v387;
      goto LABEL_135;
    }
    unint64_t v391 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    uint64_t v385 = v111 + v391;
    v377 = (uint64_t *)(v22 + 16);
    uint64_t v114 = *(char **)(v22 + 72);
    v375 = (char *)(v22 + 8);
    v370 = (char *)(v390 + 8);
    v395 = (void (**)(char *, uint64_t))(v372 + 8);
    ++v389;
    v397 = (char *)(v366 + 8);
    unint64_t v390 = v111;
    swift_bridgeObjectRetain();
    uint64_t v396 = 0;
    uint64_t v115 = v393;
    uint64_t v116 = v400;
    uint64_t v117 = v401;
    v392 = v114;
    uint64_t v376 = v112;
LABEL_5:
    uint64_t v118 = (char *)v115;
    uint64_t v119 = v360;
    sub_225657F20();
    uint64_t v120 = sub_225657E10();
    v387(v119, v113);
    uint64_t v121 = *(char **)(v120 + 16);
    if (!v121)
    {
LABEL_230:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_174;
    }
    ++v396;
    unint64_t v122 = v120 + v391;
    v394 = (char *)v120;
    swift_bridgeObjectRetain();
    uint64_t v115 = (void (**)(char *, uint64_t))v118;
    while ((sub_225658780() & 1) == 0)
    {
      if (sub_225658790())
      {
        sub_2256509C4();
        if (v136) {
          goto LABEL_68;
        }
        goto LABEL_40;
      }
      if (sub_225658750())
      {
        sub_225651540();
        if (v137) {
          goto LABEL_68;
        }
        goto LABEL_40;
      }
      if (sub_225658770())
      {
        sub_225651CC4();
        if (v138) {
          goto LABEL_68;
        }
        goto LABEL_40;
      }
      if (sub_2256587C0())
      {
        if ((sub_2256587C0() & 1) == 0) {
          goto LABEL_40;
        }
        id v139 = v347;
        sub_2256587A0();
        char v140 = sub_225658AB0();
        uint64_t v141 = *v389;
        uint64_t v142 = v368;
        (*v389)(v139, v368);
        sub_2256587A0();
        char v143 = sub_225658AB0();
        v141(v139, v142);
        if ((v140 & 1) == 0)
        {
LABEL_44:
          uint64_t v114 = v392;
          uint64_t v115 = v393;
          uint64_t v117 = v401;
          if ((v143 & 1) == 0) {
            goto LABEL_68;
          }
          goto LABEL_40;
        }
        uint64_t v114 = v392;
        if ((v143 & 1) == 0) {
          goto LABEL_59;
        }
        v144 = v334;
        sub_2256587A0();
        id v145 = (char *)v333;
        sub_225658AA0();
        v141(v144, v368);
        v134 = v388;
        uint64_t v146 = sub_225658BF0();
        if (v134)
        {
          (*v395)(v145, v404);
          v388 = 0;
          sub_225658F70();
          uint64_t v156 = v393;
          uint64_t v117 = v401;
          if (qword_26AD58250 != -1) {
            goto LABEL_67;
          }
          goto LABEL_39;
        }
        uint64_t v402 = v146;
        uint64_t v374 = (uint64_t)*v395;
        ((void (*)(char *, uint64_t))v374)(v145, v404);
        char v170 = v328;
        sub_2256587A0();
        char v171 = v327;
        sub_225658AA0();
        v141(v170, v368);
        sub_225658BF0();
        v388 = 0;
        ((void (*)(char *, uint64_t))v374)(v171, v404);
        sub_22564F850();
        char v161 = v174;
        swift_release();
LABEL_66:
        swift_release();
        uint64_t v115 = v393;
LABEL_46:
        uint64_t v117 = v401;
        uint64_t v114 = v392;
        if (v161) {
          goto LABEL_68;
        }
        goto LABEL_40;
      }
      if (sub_2256587D0())
      {
        if ((sub_2256587D0() & 1) == 0) {
          goto LABEL_40;
        }
        unint64_t v147 = v341;
        sub_2256587B0();
        char v148 = sub_225658AE0();
        uint64_t v149 = *(void (**)(unint64_t, uint64_t))v370;
        uint64_t v150 = v354;
        (*(void (**)(unint64_t, uint64_t))v370)(v147, v354);
        sub_2256587B0();
        char v143 = sub_225658AE0();
        v149(v147, v150);
        if ((v148 & 1) == 0) {
          goto LABEL_44;
        }
        uint64_t v114 = v392;
        if ((v143 & 1) == 0)
        {
LABEL_59:
          uint64_t v115 = v393;
          uint64_t v117 = v401;
          goto LABEL_40;
        }
        v151 = v330;
        sub_2256587B0();
        unint64_t v152 = v329;
        sub_225658AD0();
        v149((unint64_t)v151, v354);
        v134 = v388;
        uint64_t v153 = sub_225658BF0();
        if (v134)
        {
          (*v395)((char *)v152, v404);
          v388 = 0;
          uint64_t v117 = v401;
          sub_225658F70();
          uint64_t v156 = v393;
          if (qword_26AD58250 == -1) {
            goto LABEL_39;
          }
LABEL_67:
          swift_once();
LABEL_39:
          id v157 = (id)qword_26AD58298;
          sub_225658DA0();

          uint64_t v115 = v156;
          goto LABEL_40;
        }
        uint64_t v402 = v153;
        uint64_t v374 = (uint64_t)*v395;
        ((void (*)(unint64_t, uint64_t))v374)(v152, v404);
        unint64_t v172 = v322;
        sub_2256587B0();
        char v173 = v321;
        sub_225658AD0();
        v149((unint64_t)v172, v354);
        sub_225658BF0();
        v388 = 0;
        ((void (*)(char *, uint64_t))v374)(v173, v404);
        sub_22564F850();
        char v161 = v175;
        swift_release();
        goto LABEL_66;
      }
      char v158 = sub_225658780();
      uint64_t v159 = v357;
      uint64_t v402 = *v377;
      ((void (*)(uint64_t, unint64_t, uint64_t))v402)(v117, v122, v357);
      if (v158) {
        LODWORD(v374) = 0;
      }
      else {
        LODWORD(v374) = sub_225658790() ^ 1;
      }
      uint64_t v162 = v117;
      int v163 = v345;
      uint64_t v164 = *(void (**)(char *, uint64_t))v375;
      (*(void (**)(uint64_t, uint64_t))v375)(v162, v159);
      unint64_t v165 = (void (*)(void (**)(char *, uint64_t), unint64_t, uint64_t))v402;
      ((void (*)(char *, unint64_t, uint64_t))v402)(v163, v122, v159);
      if ((v374 & 1) == 0)
      {
        v164(v163, v159);
        uint64_t v166 = v346;
        v165(v346, v122, v159);
LABEL_56:
        v164((char *)v166, v159);
        v165((void (**)(char *, uint64_t))v116, v122, v159);
LABEL_57:
        v164(v116, v159);
        char v168 = v393;
        v165(v393, v122, v159);
LABEL_58:
        v164((char *)v168, v159);
        uint64_t v117 = v401;
        uint64_t v114 = v392;
        uint64_t v115 = v168;
        goto LABEL_40;
      }
      LODWORD(v374) = sub_225658750();
      v164(v163, v159);
      uint64_t v166 = v346;
      v165(v346, v122, v159);
      if (v374) {
        goto LABEL_56;
      }
      LODWORD(v374) = sub_225658770();
      v164((char *)v166, v159);
      v165((void (**)(char *, uint64_t))v116, v122, v159);
      if (v374) {
        goto LABEL_57;
      }
      char v167 = sub_2256587C0();
      v164(v116, v159);
      char v168 = v393;
      v165(v393, v122, v159);
      if (v167) {
        goto LABEL_58;
      }
      char v169 = sub_2256587D0();
      v164((char *)v168, v159);
      uint64_t v117 = v401;
      uint64_t v114 = v392;
      uint64_t v115 = v168;
      if ((v169 & 1) == 0)
      {
LABEL_68:
        swift_bridgeObjectRelease_n();
        uint64_t v3 = v371;
        uint64_t v113 = v379;
        if (v396 == v376)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_132;
        }
        goto LABEL_5;
      }
LABEL_40:
      v122 += (unint64_t)v114;
      if (!--v121)
      {
LABEL_172:
        swift_bridgeObjectRelease_n();
        goto LABEL_173;
      }
    }
    if ((sub_225658780() & 1) == 0) {
      goto LABEL_40;
    }
    uint64_t v402 = (uint64_t)v121;
    int v123 = v114;
    uint64_t v124 = (char *)v115;
    uint64_t v125 = v399;
    sub_225658800();
    char v126 = sub_225658610();
    unint64_t v127 = v398;
    v128 = *(void (**)(char *, unint64_t))v397;
    (*(void (**)(char *, unint64_t))v397)(v125, v398);
    sub_225658800();
    char v129 = sub_225658610();
    v128(v125, v127);
    if ((v126 & 1) == 0)
    {
      uint64_t v116 = v400;
      uint64_t v117 = v401;
      uint64_t v115 = (void (**)(char *, uint64_t))v124;
      uint64_t v114 = v123;
      uint64_t v121 = (char *)v402;
      if ((v129 & 1) == 0) {
        goto LABEL_68;
      }
      goto LABEL_40;
    }
    uint64_t v114 = v123;
    if ((v129 & 1) == 0)
    {
      uint64_t v116 = v400;
      uint64_t v117 = v401;
      uint64_t v115 = (void (**)(char *, uint64_t))v124;
      uint64_t v121 = (char *)v402;
      goto LABEL_40;
    }
    unint64_t v130 = v365;
    sub_225658800();
    unint64_t v131 = (char *)v381;
    sub_225658600();
    unint64_t v132 = v130;
    unint64_t v133 = v398;
    v128((char *)v132, v398);
    v134 = v388;
    uint64_t v135 = sub_225658BF0();
    if (v134)
    {
      (*v395)(v131, v404);
      v388 = 0;
      uint64_t v116 = v400;
      uint64_t v121 = (char *)v402;
      sub_225658F70();
      uint64_t v156 = v393;
      uint64_t v117 = v401;
      if (qword_26AD58250 != -1) {
        goto LABEL_67;
      }
      goto LABEL_39;
    }
    uint64_t v374 = v135;
    v373 = *v395;
    v373(v131, v404);
    uint64_t v154 = v349;
    sub_225658800();
    uint64_t v155 = v350;
    sub_225658600();
    v128(v154, v133);
    sub_225658BF0();
    uint64_t v121 = (char *)v402;
    v388 = 0;
    v373(v155, v404);
    sub_22564F850();
    char v161 = v160;
    swift_release();
    swift_release();
    uint64_t v115 = v393;
    uint64_t v116 = v400;
    goto LABEL_46;
  }
  sub_225657F20();
  uint64_t v176 = sub_225657E10();
  v387 = *v110;
  v387(v98, v78);
  uint64_t v113 = v78;
  v347 = *(char **)(v176 + 16);
  if (v347)
  {
    v350 = (char *)((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
    v349 = &v350[v176];
    uint64_t v401 = *(void *)(v22 + 72);
    v333 = (void (**)(char *, char *, uint64_t))(v22 + 16);
    v393 = (void (**)(char *, uint64_t))(v372 + 8);
    v330 = (void (**)(char *, uint64_t))(v390 + 8);
    v346 = v389 + 1;
    ++v359;
    ++v358;
    v381 = (void (**)(char **, uint64_t))(v355 + 8);
    v389 = (void (**)(char *, uint64_t))(v20 + 8);
    v400 = (char *)(v366 + 8);
    v345 = (char *)v176;
    swift_bridgeObjectRetain();
    uint64_t v177 = 0;
    unint64_t v391 = (unint64_t)"Turn context was not matched";
    unint64_t v390 = 0x800000022565BBD0;
    unint64_t v365 = (unint64_t)"SystemInformed[entities=";
    v360 = (char *)0x800000022565AA20;
    unint64_t v341 = (unint64_t)"SystemReportedSuccess[task=";
    v334 = (char *)0x800000022565A9E0;
    unint64_t v329 = (unint64_t)"Other SDA string: %s";
    v328 = (char *)0x800000022565A9C0;
    uint64_t v178 = v387;
    v179 = v397;
    unint64_t v180 = v398;
    uint64_t v181 = v392;
    while (1)
    {
      uint64_t v182 = v370;
      sub_225657F20();
      uint64_t v183 = sub_225657E10();
      v178(v182, v113);
      uint64_t v184 = *(void *)(v183 + 16);
      if (!v184)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_130;
      }
      uint64_t v185 = &v349[v401 * (void)v177];
      v355 = v177 + 1;
      uint64_t v186 = &v350[v183];
      uint64_t v366 = v183;
      swift_bridgeObjectRetain();
      v399 = v185;
      while (1)
      {
        if (sub_225658780())
        {
          sub_225658800();
          if (sub_225658610())
          {
            id v187 = v403;
            sub_225658600();
            sub_225636578();
            (*v393)(v187, v404);
          }
          unint64_t v405 = 0;
          unint64_t v406 = 0xE000000000000000;
          sub_225659050();
          swift_bridgeObjectRelease();
          unint64_t v405 = 0xD000000000000016;
          unint64_t v406 = v390;
          sub_225658E50();
          swift_bridgeObjectRelease();
          sub_225658E50();
          uint64_t v189 = v405;
          unint64_t v191 = v406;
          (*(void (**)(char *, unint64_t))v400)(v179, v180);
        }
        else
        {
          if (sub_225658790())
          {
            v188 = v395;
            sub_225658760();
            uint64_t v189 = sub_22564ECF8();
            unint64_t v191 = v190;
            (*v389)((char *)v188, v396);
            goto LABEL_87;
          }
          if (sub_225658750())
          {
            unint64_t v192 = v180;
            uint64_t v193 = (char **)v377;
            sub_2256587E0();
            if (sub_225658100())
            {
              uint64_t v194 = (char *)v373;
              sub_225658110();
              sub_225635E20();
              (*v358)(v194, v374);
            }
            unint64_t v405 = 0;
            unint64_t v406 = 0xE000000000000000;
            sub_225659050();
            swift_bridgeObjectRelease();
            unint64_t v405 = 0xD000000000000016;
            unint64_t v406 = v365 | 0x8000000000000000;
            sub_225658E50();
            swift_bridgeObjectRelease();
            sub_225658E50();
            uint64_t v189 = v405;
            unint64_t v191 = v406;
            (*v381)(v193, v385);
LABEL_86:
            unint64_t v180 = v192;
            goto LABEL_87;
          }
          if (sub_225658770())
          {
            v195 = v375;
            sub_2256587F0();
            uint64_t v189 = sub_22564F1D4();
            unint64_t v191 = v196;
            (*v359)(v195, v376);
            goto LABEL_87;
          }
          if (sub_2256587C0())
          {
            unint64_t v192 = v180;
            unint64_t v213 = v353;
            sub_2256587A0();
            if (sub_225658AB0())
            {
              v214 = v403;
              sub_225658AA0();
              sub_225636578();
              (*v393)(v214, v404);
            }
            unint64_t v405 = 0;
            unint64_t v406 = 0xE000000000000000;
            sub_225659050();
            swift_bridgeObjectRelease();
            unint64_t v405 = 0xD00000000000001BLL;
            unint64_t v406 = v341 | 0x8000000000000000;
            sub_225658E50();
            swift_bridgeObjectRelease();
            sub_225658E50();
            uint64_t v189 = v405;
            unint64_t v191 = v406;
            (*v346)(v213, v368);
            goto LABEL_86;
          }
          if (sub_2256587D0())
          {
            unint64_t v192 = v180;
            v219 = v344;
            sub_2256587B0();
            if (sub_225658AE0())
            {
              unint64_t v220 = v403;
              sub_225658AD0();
              sub_225636578();
              (*v393)(v220, v404);
            }
            unint64_t v405 = 0;
            unint64_t v406 = 0xE000000000000000;
            sub_225659050();
            swift_bridgeObjectRelease();
            unint64_t v405 = 0xD00000000000001BLL;
            unint64_t v406 = v329 | 0x8000000000000000;
            sub_225658E50();
            swift_bridgeObjectRelease();
            sub_225658E50();
            uint64_t v189 = v405;
            unint64_t v191 = v406;
            (*v330)(v219, v354);
            goto LABEL_86;
          }
          (*v333)(v352, v185, v357);
          uint64_t v189 = sub_225658E10();
          unint64_t v191 = v223;
        }
LABEL_87:
        if (sub_225658780())
        {
          v197 = v394;
          sub_225658800();
          if (sub_225658610())
          {
            long long v198 = v403;
            sub_225658600();
            sub_225636578();
            uint64_t v199 = v198;
            uint64_t v181 = v392;
            unint64_t v180 = v398;
            (*v393)(v199, v404);
          }
          unint64_t v405 = 0;
          unint64_t v406 = 0xE000000000000000;
          sub_225659050();
          swift_bridgeObjectRelease();
          unint64_t v405 = 0xD000000000000016;
          unint64_t v406 = v391 | 0x8000000000000000;
          sub_225658E50();
          swift_bridgeObjectRelease();
          sub_225658E50();
          uint64_t v202 = v405;
          unint64_t v204 = v406;
          (*(void (**)(char *, unint64_t))v400)(v197, v180);
          v179 = v397;
        }
        else
        {
          if (sub_225658790())
          {
            unint64_t v200 = v180;
            uint64_t v201 = v395;
            sub_225658760();
            uint64_t v202 = sub_22564ECF8();
            unint64_t v204 = v203;
            uint64_t v205 = (char *)v201;
            unint64_t v180 = v200;
            (*v389)(v205, v396);
            goto LABEL_103;
          }
          if (sub_225658750())
          {
            unint64_t v206 = v180;
            sub_2256587E0();
            if (sub_225658100())
            {
              v207 = (char *)v373;
              sub_225658110();
              sub_225635E20();
              v208 = v207;
              uint64_t v181 = v392;
              (*v358)(v208, v374);
            }
            unint64_t v405 = 0;
            unint64_t v406 = 0xE000000000000000;
            sub_225659050();
            swift_bridgeObjectRelease();
            unint64_t v405 = 0xD000000000000016;
            unint64_t v406 = (unint64_t)v360;
            sub_225658E50();
            swift_bridgeObjectRelease();
            sub_225658E50();
            uint64_t v202 = v405;
            unint64_t v204 = v406;
            (*v381)((char **)v181, v385);
            goto LABEL_102;
          }
          if (sub_225658770())
          {
            unint64_t v209 = v180;
            uint64_t v210 = v375;
            sub_2256587F0();
            uint64_t v202 = sub_22564F1D4();
            unint64_t v204 = v211;
            v212 = v210;
            unint64_t v180 = v209;
            (*v359)(v212, v376);
            goto LABEL_103;
          }
          if (sub_2256587C0())
          {
            sub_2256587A0();
            if (sub_225658AB0())
            {
              v217 = v403;
              sub_225658AA0();
              sub_225636578();
              uint64_t v218 = v217;
              uint64_t v181 = v392;
              unint64_t v206 = v398;
              (*v393)(v218, v404);
            }
            else
            {
              unint64_t v206 = v180;
            }
            unint64_t v405 = 0;
            unint64_t v406 = 0xE000000000000000;
            sub_225659050();
            swift_bridgeObjectRelease();
            unint64_t v405 = 0xD00000000000001BLL;
            unint64_t v406 = (unint64_t)v334;
            sub_225658E50();
            swift_bridgeObjectRelease();
            sub_225658E50();
            uint64_t v202 = v405;
            unint64_t v204 = v406;
            (*v346)(v364, v368);
LABEL_102:
            unint64_t v180 = v206;
            goto LABEL_103;
          }
          if (sub_2256587D0())
          {
            sub_2256587B0();
            if (sub_225658AE0())
            {
              v221 = v403;
              sub_225658AD0();
              sub_225636578();
              v222 = v221;
              uint64_t v181 = v392;
              unint64_t v206 = v398;
              (*v393)(v222, v404);
            }
            else
            {
              unint64_t v206 = v180;
            }
            unint64_t v405 = 0;
            unint64_t v406 = 0xE000000000000000;
            sub_225659050();
            swift_bridgeObjectRelease();
            unint64_t v405 = 0xD00000000000001BLL;
            unint64_t v406 = (unint64_t)v328;
            sub_225658E50();
            swift_bridgeObjectRelease();
            sub_225658E50();
            uint64_t v202 = v405;
            unint64_t v204 = v406;
            (*v330)((char *)v402, v354);
            goto LABEL_102;
          }
          (*v333)(v352, v186, v357);
          uint64_t v202 = sub_225658E10();
          unint64_t v204 = v224;
        }
LABEL_103:
        if (v189 == v202 && v191 == v204) {
          break;
        }
        char v216 = sub_2256591A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v216) {
          goto LABEL_128;
        }
        v186 += v401;
        --v184;
        uint64_t v185 = v399;
        if (!v184)
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
LABEL_130:
          (*(void (**)(char *, uint64_t))(v362 + 8))(v361, v363);
          goto LABEL_174;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_128:
      swift_bridgeObjectRelease_n();
      uint64_t v177 = v355;
      uint64_t v113 = v379;
      uint64_t v178 = v387;
      if (v355 == v347)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v3 = v371;
        goto LABEL_134;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v178 = v387;
LABEL_134:
  (*(void (**)(char *, uint64_t))(v362 + 8))(v361, v363);
LABEL_135:
  uint64_t v225 = v356;
  sub_225657F20();
  uint64_t v226 = sub_225657DE0();
  v178(v225, v113);
  uint64_t v396 = *(void *)(v226 + 16);
  v387 = v178;
  if (v396)
  {
    uint64_t v227 = *(void *)(sub_225657C80() - 8);
    unint64_t v398 = (*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80);
    v397 = (char *)(v226 + v398);
    uint64_t v402 = *(void *)(v227 + 72);
    uint64_t v228 = (void (**)(char *, uint64_t))(v372 + 8);
    swift_bridgeObjectRetain();
    uint64_t v229 = 0;
    v399 = (char *)v226;
    do
    {
      uint64_t v230 = v367;
      sub_225657F20();
      uint64_t v231 = sub_225657DE0();
      v387(v230, v113);
      uint64_t v232 = *(void *)(v231 + 16);
      if (!v232) {
        goto LABEL_230;
      }
      v400 = v229 + 1;
      uint64_t v401 = v231;
      unint64_t v233 = v231 + v398;
      swift_bridgeObjectRetain();
      while (1)
      {
        if (sub_225657C60())
        {
          v234 = v403;
          sub_225657C70();
          sub_225636578();
          (*v228)(v234, v404);
        }
        unint64_t v405 = 0x7361745B6B736154;
        unint64_t v406 = 0xEA00000000003D6BLL;
        sub_225658E50();
        swift_bridgeObjectRelease();
        sub_225658E50();
        unint64_t v236 = v405;
        unint64_t v235 = v406;
        if (sub_225657C60())
        {
          uint64_t v237 = v403;
          sub_225657C70();
          sub_225636578();
          (*v228)(v237, v404);
        }
        unint64_t v405 = 0x7361745B6B736154;
        unint64_t v406 = 0xEA00000000003D6BLL;
        sub_225658E50();
        swift_bridgeObjectRelease();
        sub_225658E50();
        if (v236 == v405 && v235 == v406) {
          break;
        }
        char v239 = sub_2256591A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v239) {
          goto LABEL_151;
        }
        v233 += v402;
        if (!--v232) {
          goto LABEL_172;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_151:
      swift_bridgeObjectRelease_n();
      uint64_t v229 = v400;
      uint64_t v3 = v371;
      uint64_t v113 = v379;
    }
    while (v400 != (char *)v396);
    swift_bridgeObjectRelease_n();
    uint64_t v178 = v387;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v240 = v348;
  sub_225657F20();
  uint64_t v241 = sub_225657DF0();
  v178(v240, v113);
  v397 = *(char **)(v241 + 16);
  if (v397)
  {
    uint64_t v242 = *(void *)(sub_225657C80() - 8);
    v399 = (char *)((*(unsigned __int8 *)(v242 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v242 + 80));
    unint64_t v398 = (unint64_t)&v399[v241];
    uint64_t v402 = *(void *)(v242 + 72);
    v243 = (void (**)(char *, uint64_t))(v372 + 8);
    uint64_t v396 = v241;
    swift_bridgeObjectRetain();
    uint64_t v244 = 0;
    do
    {
      v245 = v351;
      sub_225657F20();
      uint64_t v246 = sub_225657DF0();
      v387(v245, v113);
      uint64_t v247 = *(void *)(v246 + 16);
      if (!v247) {
        goto LABEL_230;
      }
      v400 = v244 + 1;
      uint64_t v401 = v246;
      v248 = &v399[v246];
      swift_bridgeObjectRetain();
      while (1)
      {
        if (sub_225657C60())
        {
          v249 = v403;
          sub_225657C70();
          sub_225636578();
          (*v243)(v249, v404);
        }
        unint64_t v405 = 0x7361745B6B736154;
        unint64_t v406 = 0xEA00000000003D6BLL;
        sub_225658E50();
        swift_bridgeObjectRelease();
        sub_225658E50();
        unint64_t v251 = v405;
        unint64_t v250 = v406;
        if (sub_225657C60())
        {
          v252 = v403;
          sub_225657C70();
          sub_225636578();
          (*v243)(v252, v404);
        }
        unint64_t v405 = 0x7361745B6B736154;
        unint64_t v406 = 0xEA00000000003D6BLL;
        sub_225658E50();
        swift_bridgeObjectRelease();
        sub_225658E50();
        if (v251 == v405 && v250 == v406) {
          break;
        }
        char v254 = sub_2256591A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v254) {
          goto LABEL_170;
        }
        v248 += v402;
        if (!--v247) {
          goto LABEL_172;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_170:
      swift_bridgeObjectRelease_n();
      uint64_t v244 = v400;
      uint64_t v3 = v371;
      uint64_t v113 = v379;
    }
    while (v400 != v397);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v257 = v340;
  sub_225657F20();
  uint64_t v258 = sub_225657E00();
  v259 = v257;
  v260 = v387;
  v387(v259, v113);
  uint64_t v261 = *(void *)(v258 + 16);
  swift_bridgeObjectRelease();
  if (!v261)
  {
LABEL_225:
    char v300 = sub_225657F10();
    uint64_t v301 = v342;
    v302 = *(void (**)(char *, uint64_t, uint64_t))(v342 + 16);
    uint64_t v303 = v3;
    v304 = v339;
    uint64_t v305 = v343;
    v302(v339, v386, v343);
    v306 = v338;
    v302(v338, v303, v305);
    if (v300)
    {
      char v307 = sub_225657F10();
      uint64_t v308 = v343;
      char v309 = v307;
      v310 = v332;
      v302(v332, (uint64_t)v306, v343);
      v311 = v331;
      v302(v331, (uint64_t)v304, v308);
      if ((v309 & 1) == 0)
      {
        v320 = *(void (**)(char *, uint64_t))(v342 + 8);
        v320(v311, v308);
        v320(v310, v308);
        v320(v306, v308);
        v320(v304, v308);
        goto LABEL_174;
      }
      v312 = v323;
      uint64_t v313 = v308;
      sub_225657F40();
      uint64_t v314 = (uint64_t)v324;
      sub_225657F40();
      char v255 = sub_225631B60(v314);
      v315 = *(void (**)(uint64_t, uint64_t))(v325 + 8);
      uint64_t v316 = v314;
      uint64_t v317 = v326;
      v315(v316, v326);
      v315((uint64_t)v312, v317);
      v318 = *(void (**)(char *, uint64_t))(v342 + 8);
      v318(v311, v313);
      v318(v310, v313);
      v318(v306, v313);
      v318(v304, v313);
    }
    else
    {
      v319 = *(void (**)(char *, uint64_t))(v301 + 8);
      v319(v306, v305);
      v319(v304, v305);
      char v255 = 1;
    }
    return v255 & 1;
  }
  v262 = v336;
  sub_225657F20();
  uint64_t v263 = sub_225657E00();
  v260(v262, v113);
  uint64_t v264 = *(void *)(v263 + 16);
  if (v264)
  {
    unint64_t v405 = MEMORY[0x263F8EE78];
    sub_225626BF8(0, v264, 0);
    v265 = *(char **)(v337 + 16);
    uint64_t v266 = *(unsigned __int8 *)(v337 + 80);
    v400 = (char *)v263;
    uint64_t v267 = v263 + ((v266 + 32) & ~v266);
    uint64_t v402 = *(void *)(v337 + 72);
    v403 = v265;
    v268 = (void (**)(char *, uint64_t))(v372 + 8);
    v269 = (void (**)(char *, uint64_t))(v337 + 8);
    uint64_t v401 = (uint64_t)"[task extraction failed]";
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v403)(v383, v267, v384);
      sub_225658670();
      v270 = v388;
      sub_225658BF0();
      if (!v270) {
        break;
      }

      v388 = 0;
      uint64_t v271 = 0xD000000000000019;
      unint64_t v272 = v401 | 0x8000000000000000;
LABEL_192:
      (*v268)(v382, v404);
      (*v269)(v383, v384);
      uint64_t v279 = v405;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225626BF8(0, *(void *)(v279 + 16) + 1, 1);
        uint64_t v279 = v405;
      }
      unint64_t v281 = *(void *)(v279 + 16);
      unint64_t v280 = *(void *)(v279 + 24);
      if (v281 >= v280 >> 1)
      {
        sub_225626BF8(v280 > 1, v281 + 1, 1);
        uint64_t v279 = v405;
      }
      *(void *)(v279 + 16) = v281 + 1;
      uint64_t v282 = v279 + 16 * v281;
      *(void *)(v282 + 32) = v271;
      *(void *)(v282 + 40) = v272;
      v267 += v402;
      if (!--v264)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v371;
        uint64_t v113 = v379;
        goto LABEL_203;
      }
    }
    v388 = 0;
    uint64_t v273 = swift_retain();
    unint64_t v274 = MEMORY[0x22A630BC0](v273);
    unint64_t v275 = v274;
    if (v274 >> 62)
    {
      uint64_t result = sub_2256590F0();
      if (result) {
        goto LABEL_184;
      }
    }
    else
    {
      uint64_t result = *(void *)((v274 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (result)
      {
LABEL_184:
        if ((v275 & 0xC000000000000001) != 0)
        {
          MEMORY[0x22A631010](0, v275);
        }
        else
        {
          if (!*(void *)((v275 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_232:
            __break(1u);
            return result;
          }
          swift_retain();
        }
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v271 = sub_225658CE0();
        unint64_t v272 = v276;
        swift_release();
LABEL_191:
        swift_release();
        goto LABEL_192;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v277 = sub_225658C30();
    swift_release();
    if (!v277)
    {
      swift_release();
      uint64_t v271 = 0x69746E65206F6E5BLL;
      unint64_t v272 = 0xEB000000005D7974;
      goto LABEL_192;
    }
    uint64_t v271 = sub_225658CD0();
    unint64_t v272 = v278;
    swift_release();
    goto LABEL_191;
  }
  swift_bridgeObjectRelease();
  uint64_t v279 = MEMORY[0x263F8EE78];
LABEL_203:
  uint64_t v283 = sub_22564EFCC(v279);
  v284 = v335;
  sub_225657F20();
  uint64_t v285 = sub_225657E00();
  v387(v284, v113);
  uint64_t v286 = *(void *)(v285 + 16);
  if (!v286)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_225;
  }
  unint64_t v287 = v285 + ((*(unsigned __int8 *)(v337 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v337 + 80));
  v288 = (void (**)(char *, uint64_t))(v372 + 8);
  uint64_t v289 = *(void *)(v337 + 72);
  v403 = (char *)v285;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_225658670();
    v290 = v388;
    sub_225658BF0();
    if (v290)
    {

      v388 = 0;
      uint64_t v291 = 0xD000000000000019;
      uint64_t v292 = 0x800000022565AAA0;
      goto LABEL_217;
    }
    v388 = 0;
    uint64_t v293 = swift_retain();
    unint64_t v294 = MEMORY[0x22A630BC0](v293);
    unint64_t v295 = v294;
    if (v294 >> 62)
    {
      uint64_t result = sub_2256590F0();
      if (result)
      {
LABEL_209:
        if ((v295 & 0xC000000000000001) != 0)
        {
          MEMORY[0x22A631010](0, v295);
        }
        else
        {
          if (!*(void *)((v295 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_232;
          }
          swift_retain();
        }
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v296 = sub_225658CE0();
        goto LABEL_216;
      }
    }
    else
    {
      uint64_t result = *(void *)((v294 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (result) {
        goto LABEL_209;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v298 = sub_225658C30();
    swift_release();
    if (v298)
    {
      uint64_t v296 = sub_225658CD0();
LABEL_216:
      uint64_t v291 = v296;
      uint64_t v292 = v297;
      swift_release();
      swift_release();
      goto LABEL_217;
    }
    swift_release();
    uint64_t v291 = 0x69746E65206F6E5BLL;
    uint64_t v292 = 0xEB000000005D7974;
LABEL_217:
    (*v288)(v369, v404);
    char v299 = sub_2256521C8(v291, v292, v283);
    swift_bridgeObjectRelease();
    if ((v299 & 1) == 0) {
      break;
    }
    v287 += v289;
    if (!--v286)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      uint64_t v3 = v371;
      goto LABEL_225;
    }
  }
  swift_bridgeObjectRelease();
LABEL_173:
  swift_bridgeObjectRelease_n();
LABEL_174:
  char v255 = 0;
  return v255 & 1;
}

uint64_t sub_225631B60(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v87 = a1;
  uint64_t v3 = sub_2256586A0();
  uint64_t v76 = *(void *)(v3 - 8);
  uint64_t v77 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v75 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v74 = (char *)&v72 - v6;
  uint64_t v7 = sub_225658740();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v82 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v83 = (char *)&v72 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v81 = (char *)&v72 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v86 = (char *)&v72 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v85 = (char *)&v72 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v80 = (char *)&v72 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v79 = (char *)&v72 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v84 = (char *)&v72 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v72 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v72 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v72 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v72 - v34;
  uint64_t v36 = v8;
  LOBYTE(v8) = sub_225658720();
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  v37(v35, v87, v7);
  v37(v33, v2, v7);
  if (v8)
  {
    uint64_t v73 = v36;
    char v38 = sub_225658720();
    v37(v30, (uint64_t)v33, v7);
    v37(v27, (uint64_t)v35, v7);
    uint64_t v72 = v30;
    if (v38)
    {
      uint64_t v39 = sub_2256586F0();
      uint64_t v41 = v40;
      if (v39 == sub_2256586F0() && v41 == v42) {
        int v44 = 1;
      }
      else {
        int v44 = sub_2256591A0();
      }
      uint64_t v47 = v27;
      int v78 = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v47 = v27;
      int v78 = 0;
    }
    uint64_t v45 = *(void (**)(char *, uint64_t))(v73 + 8);
    v45(v47, v7);
    v45(v72, v7);
    v45(v33, v7);
    v45(v35, v7);
    uint64_t v46 = v87;
  }
  else
  {
    uint64_t v45 = *(void (**)(char *, uint64_t))(v36 + 8);
    v45(v33, v7);
    v45(v35, v7);
    int v78 = 1;
    uint64_t v46 = v87;
  }
  uint64_t v48 = v79;
  char v49 = sub_2256586D0();
  uint64_t v50 = v84;
  v37(v84, v2, v7);
  v37(v48, v46, v7);
  if (v49)
  {
    int v51 = sub_2256586B0();
    int v52 = sub_2256586B0();
    uint64_t v50 = v84;
    LODWORD(v87) = v51 ^ v52;
  }
  else
  {
    LODWORD(v87) = 0;
  }
  v45(v48, v7);
  v45(v50, v7);
  char v53 = sub_2256586E0();
  uint64_t v54 = v80;
  v37(v80, v2, v7);
  uint64_t v55 = v85;
  v37(v85, v46, v7);
  if (v53)
  {
    int v56 = sub_2256586C0();
    int v57 = sub_2256586C0();
    uint64_t v55 = v85;
    LODWORD(v84) = v56 ^ v57;
  }
  else
  {
    LODWORD(v84) = 0;
  }
  v45(v55, v7);
  v45(v54, v7);
  char v58 = sub_225658730();
  uint64_t v59 = v86;
  v37(v86, v2, v7);
  uint64_t v60 = v81;
  v37(v81, v46, v7);
  if (v58)
  {
    int v61 = sub_225658710();
    int v62 = sub_225658710();
    uint64_t v59 = v86;
    LODWORD(v85) = v61 ^ v62;
  }
  else
  {
    LODWORD(v85) = 0;
  }
  v45(v60, v7);
  v45(v59, v7);
  char v63 = sub_225658690();
  uint64_t v64 = v83;
  v37(v83, v2, v7);
  uint64_t v65 = v82;
  v37(v82, v46, v7);
  if (v63)
  {
    uint64_t v66 = v74;
    sub_225658700();
    uint64_t v67 = v75;
    sub_225658700();
    sub_225653BC8(&qword_2681028F0, MEMORY[0x263F71638]);
    uint64_t v68 = v77;
    sub_225658F10();
    sub_225658F10();
    BOOL v69 = v89 == v88;
    uint64_t v70 = *(void (**)(char *, uint64_t))(v76 + 8);
    v70(v67, v68);
    v70(v66, v68);
    v45(v65, v7);
    v45(v83, v7);
    if (!(v87 & 1 | ((v78 & 1) == 0) | (v84 | v85) & 1)) {
      return v69;
    }
  }
  else
  {
    v45(v65, v7);
    v45(v64, v7);
    if (!(v87 & 1 | ((v78 & 1) == 0) | (v84 | v85) & 1)) {
      return 1;
    }
  }
  return 0;
}

void *initializeWithCopy for OverrideMatchResult(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  a1[6] = a2[6];
  uint64_t v9 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v10 = v9[9];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_225657B90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  }
  *((unsigned char *)a1 + v9[10]) = *((unsigned char *)a2 + v9[10]);
  uint64_t v15 = v9[11];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = v9[12];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (_OWORD *)((char *)a2 + v19);
  unint64_t v22 = *(void *)((char *)a2 + v19 + 8);
  swift_bridgeObjectRetain();
  if (v22 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v20 = *v21;
  }
  else
  {
    uint64_t v23 = *(void *)v21;
    sub_225626B60(v23, v22);
    *(void *)uint64_t v20 = v23;
    *((void *)v20 + 1) = v22;
  }
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  uint64_t v24 = v9[14];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  unint64_t v27 = *((void *)v26 + 1);
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  }
  else
  {
    uint64_t v28 = *(void *)v26;
    sub_225626B60(*(void *)v26, *((void *)v26 + 1));
    *(void *)uint64_t v25 = v28;
    *((void *)v25 + 1) = v27;
  }
  uint64_t v29 = v9[15];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_225658BD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  }
  uint64_t v34 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *(void *)((char *)a1 + v34) = *(void *)((char *)a2 + v34);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for OverrideMatchResult(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v3 = a1 + v2[9];
  uint64_t v4 = sub_225657B90();
  if (!__swift_getEnumTagSinglePayload(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t *)(a1 + v2[12]);
  unint64_t v6 = v5[1];
  if (v6 >> 60 != 15) {
    sub_225627258(*v5, v6);
  }
  uint64_t v7 = (uint64_t *)(a1 + v2[14]);
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_225627258(*v7, v8);
  }
  uint64_t v9 = a1 + v2[15];
  uint64_t v10 = sub_225658BD0();
  if (!__swift_getEnumTagSinglePayload(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void OverrideResult.init(matches:turnInputAndPreprocessing:)()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v93 = v4;
  uint64_t v5 = type metadata accessor for OverrideResult(0);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v9 = (uint64_t *)(v8 - v7);
  uint64_t v10 = sub_225657EB0();
  OUTLINED_FUNCTION_0();
  uint64_t v97 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_2();
  uint64_t v96 = v13;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_26();
  uint64_t v91 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58128);
  uint64_t v17 = OUTLINED_FUNCTION_5_4(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_3_0();
  uint64_t v92 = v19 - v18;
  uint64_t matched = type metadata accessor for OverrideMatchResultAndParse(0);
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v94 = (uint64_t)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v25);
  uint64_t v98 = (uint64_t)&v86 - v26;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_25();
  uint64_t v100 = v28;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_25();
  uint64_t v90 = (char *)v30;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&v86 - v32;
  v102[2] = v1;
  uint64_t v34 = sub_225628CF8((void (*)(uint64_t))sub_225636A94, (uint64_t)v102, v3);
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void *)(v34 + 16);
  if (v35)
  {
    uint64_t v87 = v9;
    uint64_t v88 = v1;
    uint64_t v95 = v10;
    uint64_t v89 = v5;
    uint64_t v103 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    unint64_t v36 = 0;
    uint64_t v99 = v34;
    while (v36 < *(void *)(v34 + 16))
    {
      OUTLINED_FUNCTION_15_1();
      uint64_t v37 = *(void *)(v22 + 72);
      uint64_t v101 = v38;
      sub_225637CD0(v34 + v38 + v37 * v36, (uint64_t)v33);
      if (sub_225657E60())
      {
        sub_2256398C0((uint64_t)v33, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
      }
      else
      {
        sub_225633238((uint64_t)v33, v100, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_29();
          sub_225626BB8();
        }
        uint64_t v39 = v103;
        unint64_t v40 = *(void *)(v103 + 16);
        if (v40 >= *(void *)(v103 + 24) >> 1)
        {
          sub_225626BB8();
          uint64_t v39 = v103;
        }
        *(void *)(v39 + 16) = v40 + 1;
        sub_225633238(v100, v39 + v101 + v40 * v37, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
        uint64_t v34 = v99;
      }
      if (v35 == ++v36)
      {
        swift_bridgeObjectRelease();
        uint64_t v41 = v92;
        sub_22564AB40(v103, sub_22563805C, (void (*)(uint64_t))sub_2256484C0);
        swift_release();
        uint64_t v42 = OUTLINED_FUNCTION_22_1();
        if (__swift_getEnumTagSinglePayload(v42, v43, matched) == 1)
        {
          sub_22562793C(v41, &qword_26AD58128);
          swift_bridgeObjectRetain();
          uint64_t v44 = v34 + v101;
          uint64_t v45 = MEMORY[0x263F8EE78];
          uint64_t v46 = v96;
          do
          {
            uint64_t v47 = v98;
            sub_225637CD0(v44, v98);
            uint64_t v48 = (uint64_t *)(v47 + *(int *)(type metadata accessor for SiriNLOverride() + 44));
            uint64_t v49 = *v48;
            uint64_t v50 = v48[1];
            swift_bridgeObjectRetain();
            sub_2256398C0(v47, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
            if (v50)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                char v54 = OUTLINED_FUNCTION_29();
                sub_2256442A0(v54, v55, v56, (char *)v45);
                uint64_t v45 = v57;
              }
              unint64_t v52 = *(void *)(v45 + 16);
              unint64_t v51 = *(void *)(v45 + 24);
              if (v52 >= v51 >> 1)
              {
                sub_2256442A0(v51 > 1, v52 + 1, 1, (char *)v45);
                uint64_t v45 = v58;
              }
              *(void *)(v45 + 16) = v52 + 1;
              uint64_t v53 = v45 + 16 * v52;
              *(void *)(v53 + 32) = v49;
              *(void *)(v53 + 40) = v50;
              uint64_t v46 = v96;
            }
            v44 += v37;
            --v35;
          }
          while (v35);
          uint64_t v68 = v99;
          swift_bridgeObjectRelease();
          if (*(void *)(v45 + 16))
          {
            sub_225658F80();
            if (qword_26AD58250 != -1) {
              swift_once();
            }
            BOOL v69 = (void *)qword_26AD58298;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
            uint64_t v70 = swift_allocObject();
            *(_OWORD *)(v70 + 16) = xmmword_225659D50;
            uint64_t v103 = v45;
            id v71 = v69;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
            sub_225636790();
            uint64_t v72 = sub_225658DD0();
            uint64_t v74 = v73;
            swift_bridgeObjectRelease();
            *(void *)(v70 + 56) = MEMORY[0x263F8D310];
            *(void *)(v70 + 64) = sub_225626388();
            *(void *)(v70 + 32) = v72;
            *(void *)(v70 + 40) = v74;
            sub_225658DA0();

            swift_bridgeObjectRelease();
            uint64_t v46 = v96;
            uint64_t v68 = v99;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          uint64_t v75 = *(void *)(v68 + 16);
          uint64_t v76 = MEMORY[0x263F8EE78];
          if (v75)
          {
            uint64_t v103 = MEMORY[0x263F8EE78];
            sub_225626C38();
            uint64_t v77 = (void (**)(uint64_t, uint64_t, uint64_t))(v97 + 16);
            uint64_t v78 = v68 + v101;
            uint64_t v79 = v95;
            do
            {
              uint64_t v80 = v94;
              sub_225637CD0(v78, v94);
              (*v77)(v46, v80 + *(int *)(matched + 20), v79);
              sub_2256398C0(v80, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
              uint64_t v76 = v103;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                OUTLINED_FUNCTION_29();
                sub_225626C38();
                uint64_t v76 = v103;
              }
              unint64_t v81 = *(void *)(v76 + 16);
              if (v81 >= *(void *)(v76 + 24) >> 1)
              {
                sub_225626C38();
                uint64_t v76 = v103;
              }
              *(void *)(v76 + 16) = v81 + 1;
              OUTLINED_FUNCTION_15_1();
              uint64_t v79 = v95;
              (*(void (**)(unint64_t, uint64_t, uint64_t))(v83 + 32))(v76 + v82 + *(void *)(v83 + 72) * v81, v46, v95);
              uint64_t v103 = v76;
              v78 += v37;
              --v75;
            }
            while (v75);
          }
          sub_225658B50();
          OUTLINED_FUNCTION_22();
          OUTLINED_FUNCTION_9_0();
          v84();
          swift_bridgeObjectRelease();
          uint64_t v85 = (uint64_t)v87;
          *uint64_t v87 = v76;
          swift_storeEnumTagMultiPayload();
          sub_225633238(v85, v93, (void (*)(void))type metadata accessor for OverrideResult);
          goto LABEL_41;
        }
        swift_bridgeObjectRelease();
        uint64_t v33 = v90;
        sub_225633238(v41, (uint64_t)v90, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
        uint64_t v60 = &v33[*(int *)(type metadata accessor for SiriNLOverride() + 44)];
        uint64_t v22 = *((void *)v60 + 1);
        if (v22)
        {
          unint64_t v36 = *(void *)v60;
          swift_bridgeObjectRetain();
          sub_225658F70();
          if (qword_26AD58250 == -1) {
            goto LABEL_25;
          }
          goto LABEL_43;
        }
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_43:
    swift_once();
LABEL_25:
    int v61 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = xmmword_225659D50;
    *(void *)(v62 + 56) = MEMORY[0x263F8D310];
    *(void *)(v62 + 64) = sub_225626388();
    *(void *)(v62 + 32) = v36;
    *(void *)(v62 + 40) = v22;
    id v63 = v61;
    sub_225658DA0();

    swift_bridgeObjectRelease();
LABEL_26:
    uint64_t v64 = v97;
    uint64_t v65 = v91;
    uint64_t v66 = v95;
    (*(void (**)(uint64_t, char *, uint64_t))(v97 + 16))(v91, &v33[*(int *)(matched + 20)], v95);
    sub_225657E50();
    sub_2256398C0((uint64_t)v33, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse);
    sub_225658B50();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_9_0();
    v67();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v93, v65, v66);
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  sub_225658B50();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_0();
  v59();
LABEL_27:
  swift_storeEnumTagMultiPayload();
LABEL_41:
  OUTLINED_FUNCTION_52();
}

uint64_t type metadata accessor for OverrideMatchResultAndParse(uint64_t a1)
{
  return sub_225629F40(a1, (uint64_t *)&unk_26AD58118);
}

uint64_t sub_225633170()
{
  uint64_t result = type metadata accessor for OverrideMatchResult(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_225657EB0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_225633238(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

void *initializeWithCopy for OverrideResult(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_225657EB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t destroy for OverrideResult(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = sub_225657EB0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

uint64_t sub_22563344C()
{
  return static NSRegularExpression.resetCache()();
}

uint64_t static NSRegularExpression.resetCache()()
{
  if (qword_26AD58700 != -1) {
    swift_once();
  }
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AD57F10);
  swift_endAccess();
  if (qword_26AD586E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26AD586D8 = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AD57F10);
  return swift_endAccess();
}

void static RegexOverrideCache.reset()()
{
  if (qword_26AD58178 != -1) {
    swift_once();
  }
  uint64_t v0 = (os_unfair_lock_s *)(qword_26AD58168 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26AD58168 + 16));
  sub_225633618();
  os_unfair_lock_unlock(v0);
}

uint64_t sub_225633618()
{
  if (qword_26AD58190 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_26AD58180 = (_UNKNOWN *)MEMORY[0x263F8EE80];
  return swift_bridgeObjectRelease();
}

void *sub_2256336A4@<X0>(uint64_t a1@<X0>, void *(*a2)(uint64_t *__return_ptr)@<X1>, void *a3@<X8>)
{
  uint64_t result = sub_22563E70C(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void *sub_2256336D0(uint64_t a1, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t result = a2(&v4);
  if (!v2) {
    return (void *)v4;
  }
  return result;
}

uint64_t *marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v5 = *(void *)(v2 - 8);
    uint64_t v4 = v2 - 8;
    uint64_t v3 = v5;
    if (v5)
    {
      uint64_t v6 = 8 * v3;
      do
      {
        uint64_t v7 = *(void *)(v4 + v6);
        if (v7) {
          MEMORY[0x22A6313C0](v7, 0x1000C8077774924);
        }
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x22A6313C0](v4 - 8, 0x10C80436913F5);
  }
  return a1;
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.loadOverrideTrieBundle(filePath:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

id sub_2256338B8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v1 = (void *)sub_225658DF0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_init_, v1);

  return v2;
}

void sub_2256340E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.preheat(locale:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

void sub_22563416C()
{
  OUTLINED_FUNCTION_54();
  uint64_t v87 = v0;
  sub_2256584E0();
  OUTLINED_FUNCTION_0();
  uint64_t v85 = v3;
  uint64_t v86 = v4;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5();
  uint64_t v84 = v5;
  OUTLINED_FUNCTION_34();
  uint64_t v83 = sub_225658590();
  OUTLINED_FUNCTION_0();
  uint64_t v80 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  uint64_t v8 = sub_2256585D0();
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v88 = v11;
  OUTLINED_FUNCTION_34();
  uint64_t v12 = sub_225658D70();
  uint64_t v13 = OUTLINED_FUNCTION_5_4(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5();
  v63[1] = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
  uint64_t v16 = OUTLINED_FUNCTION_5_4(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2_2();
  uint64_t v70 = v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v63 - v19;
  uint64_t v66 = sub_225658BD0();
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2_2();
  uint64_t v65 = v24;
  MEMORY[0x270FA5388](v25);
  uint64_t v77 = (char *)v63 - v26;
  OUTLINED_FUNCTION_34();
  uint64_t v27 = type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v28;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_5();
  uint64_t v72 = v31;
  OUTLINED_FUNCTION_34();
  uint64_t v32 = sub_2256588B0();
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v33;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_14_1();
  (*(void (**)(uint64_t, void, uint64_t))(v34 + 104))(v1, *MEMORY[0x263F716E0], v32);
  sub_2256475CC();
  uint64_t v37 = v36;
  uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  uint64_t v38 = v34 + 8;
  v39(v1, v32);
  uint64_t v75 = *(void *)(v37 + 16);
  if (!v75)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v74 = v37 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
  uint64_t v76 = (void (**)(void))(v22 + 32);
  uint64_t v81 = v86 + 8;
  uint64_t v82 = v64 + 16;
  uint64_t v79 = v64 + 8;
  ++v80;
  uint64_t v67 = v22 + 8;
  uint64_t v73 = *(void *)(v29 + 72);
  v63[0] = v37;
  swift_bridgeObjectRetain();
  uint64_t v40 = 0;
  OUTLINED_FUNCTION_12_2();
  *(void *)(v41 - 256) = v27;
  uint64_t v42 = v72;
  uint64_t v68 = v20;
  do
  {
    sub_225626F30(v74 + v73 * v40, v42, (void (*)(void))type metadata accessor for SiriNLOverride);
    sub_225648158(v42 + *(int *)(v27 + 60), v38);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v38, 1, v29);
    uint64_t v78 = v40;
    if (EnumTagSinglePayload == 1)
    {
      sub_22562793C(v38, &qword_26AD57F08);
      uint64_t v44 = (uint64_t *)(v42 + *(int *)(v27 + 56));
      unint64_t v45 = v44[1];
      if (v45 >> 60 == 15)
      {
        __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v29);
        sub_22562793C((uint64_t)v20, &qword_26AD57F08);
        goto LABEL_14;
      }
      uint64_t v46 = v29;
      uint64_t v47 = *v44;
      uint64_t v91 = 0;
      long long v89 = 0u;
      long long v90 = 0u;
      sub_225626B60(v47, v45);
      sub_225626B60(v47, v45);
      sub_225658D60();
      sub_2256481C0();
      sub_225658D80();
      sub_225635818(v47, v45);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v46);
      uint64_t v62 = *v76;
      uint64_t v29 = v46;
      uint64_t v27 = v69;
    }
    else
    {
      uint64_t v62 = *v76;
      uint64_t v48 = v65;
      OUTLINED_FUNCTION_8_3();
      v62();
      ((void (*)(char *, uint64_t, uint64_t))v62)(v20, v48, v29);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v29);
    }
    ((void (*)(char *, char *, uint64_t))v62)(v77, v20, v29);
    uint64_t v49 = sub_225658410();
    uint64_t v50 = *(void *)(v49 + 16);
    if (v50)
    {
      uint64_t v87 = sub_22562BDC4(0, &qword_26AD58148);
      uint64_t v29 = v49 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
      uint64_t v86 = *(void *)(v64 + 72);
      unint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16);
      uint64_t v71 = v49;
      swift_bridgeObjectRetain();
      uint64_t v52 = v88;
      do
      {
        uint64_t v38 = v8;
        v51(v52, v29, v8);
        sub_2256585A0();
        uint64_t v53 = v2;
        uint64_t v54 = sub_225658580();
        uint64_t v56 = v55;
        sub_225658500();
        char v57 = sub_2256584B0();
        OUTLINED_FUNCTION_9_0();
        v58();

        swift_bridgeObjectRelease();
        (*v80)(v53, v83);
        uint64_t v2 = v53;
        uint64_t v52 = v88;
        OUTLINED_FUNCTION_9_0();
        v59();
        v29 += v86;
        --v50;
      }
      while (v50);
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_12_2();
      uint64_t v27 = *(void *)(v60 - 256);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v38 = v70;
    }
    OUTLINED_FUNCTION_9_0();
    v61();
    uint64_t v20 = v68;
    uint64_t v42 = v72;
LABEL_14:
    uint64_t v40 = v78 + 1;
    sub_225627048(v42, (void (*)(void))type metadata accessor for SiriNLOverride);
  }
  while (v40 != v75);
  swift_bridgeObjectRelease_n();
LABEL_17:
  OUTLINED_FUNCTION_52();
}

void sub_225634BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225635130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22563532C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t SiriNLOverride.init(inputText:ruleId:locale:namespace:source:overrideId:parse:ruleData:utteranceComparisonType:timeStamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, uint64_t a14, unint64_t a15, int a16)
{
  uint64_t v19 = sub_225658D70();
  uint64_t v20 = OUTLINED_FUNCTION_5_4(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_5();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
  uint64_t v22 = OUTLINED_FUNCTION_5_4(v21);
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_5();
  uint64_t v36 = v23;
  uint64_t v24 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v25 = (uint64_t *)(a9 + v24[14]);
  uint64_t v26 = a9 + v24[15];
  uint64_t v27 = sub_225658BD0();
  uint64_t v35 = v26;
  uint64_t v28 = v26;
  uint64_t v29 = v27;
  __swift_storeEnumTagSinglePayload(v28, 1, 1, v27);
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)a9 = a3;
  *(void *)(a9 + 8) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(_DWORD *)(a9 + 48) = a7;
  *(_DWORD *)(a9 + 52) = a8;
  uint64_t v30 = a9 + v24[9];
  sub_225657B60();
  uint64_t v31 = sub_225657B90();
  uint64_t result = __swift_storeEnumTagSinglePayload(v30, 0, 1, v31);
  *(unsigned char *)(a9 + v24[10]) = 1;
  uint64_t v33 = (void *)(a9 + v24[11]);
  *uint64_t v33 = a10;
  v33[1] = a11;
  uint64_t v34 = (uint64_t *)(a9 + v24[12]);
  *uint64_t v34 = a12;
  v34[1] = a13;
  *(_DWORD *)(a9 + v24[13]) = a16;
  *uint64_t v25 = a14;
  v25[1] = a15;
  if (a15 >> 60 != 15)
  {
    sub_225635804(a14, a15);
    sub_225635804(a14, a15);
    sub_225635804(a12, a13);
    sub_225658D60();
    sub_22565537C((unint64_t *)&qword_26AD58340, MEMORY[0x263F71B48]);
    sub_225658D80();
    sub_225635818(a12, a13);
    sub_225635818(a14, a15);
    __swift_storeEnumTagSinglePayload(v36, 0, 1, v29);
    return sub_22563582C(v36, v35);
  }
  return result;
}

uint64_t sub_225635804(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_225626B60(a1, a2);
  }
  return a1;
}

uint64_t sub_225635818(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_225627258(a1, a2);
  }
  return a1;
}

uint64_t sub_22563582C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for SiriNLOverride(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_225656008);
}

uint64_t sub_2256358A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22();
  uint64_t v4 = OUTLINED_FUNCTION_8_5();
  v5(v4);
  return a2;
}

id sub_225635900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_225658DF0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_225657B10();

    swift_willThrow();
  }
  return v6;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for SiriNLOverride(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a3[9];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    a1[6] = a2[6];
    uint64_t v13 = sub_225657B90();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
    }
    uint64_t v16 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v17 = (void *)((char *)v4 + v16);
    uint64_t v18 = (void *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = a3[12];
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (_OWORD *)((char *)a2 + v20);
    unint64_t v23 = *(void *)((char *)a2 + v20 + 8);
    swift_bridgeObjectRetain();
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v21 = *v22;
    }
    else
    {
      uint64_t v24 = *(void *)v22;
      sub_225626B60(v24, v23);
      *(void *)uint64_t v21 = v24;
      *((void *)v21 + 1) = v23;
    }
    uint64_t v25 = a3[14];
    *(_DWORD *)((char *)v4 + a3[13]) = *(_DWORD *)((char *)a2 + a3[13]);
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (void *)((char *)a2 + v25);
    unint64_t v28 = *(void *)((char *)a2 + v25 + 8);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    }
    else
    {
      uint64_t v29 = *v27;
      sub_225626B60(*v27, v28);
      *(void *)uint64_t v26 = v29;
      *((void *)v26 + 1) = v28;
    }
    uint64_t v30 = a3[15];
    uint64_t v31 = (char *)v4 + v30;
    uint64_t v32 = (char *)a2 + v30;
    uint64_t v33 = sub_225658BD0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
      memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
      __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
    }
  }
  return v4;
}

unint64_t SiriNLOverride.description.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_225635DC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_225635E20()
{
  uint64_t v1 = sub_2256582F0();
  uint64_t v40 = *(void *)(v1 - 8);
  uint64_t v41 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v39 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_225658910();
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v36 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_225658A00();
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_225658850();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  MEMORY[0x270FA5388](v7);
  unint64_t v45 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_225658160();
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v50 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v48 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_225657FD0();
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v51 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_225657F90();
  uint64_t v54 = *(void *)(v13 - 8);
  uint64_t v55 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_225658A90();
  uint64_t v56 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_225657DD0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_225658660();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_225658170())
  {
    sub_225658200();
    sub_225658650();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    sub_225636578();
    uint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  else if (sub_225658280())
  {
    sub_225658250();
    sub_225658A80();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v18, v16);
    sub_225636578();
    uint64_t v28 = v29;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  else
  {
    if (sub_225658180())
    {
      sub_2256582A0();
      sub_225657F80();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v55);
      sub_225636578();
      uint64_t v28 = v30;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
      return v28;
    }
    if (sub_225658190())
    {
      uint64_t v31 = v51;
      sub_2256582C0();
      sub_225657FC0();
      uint64_t v33 = v52;
      uint64_t v32 = v53;
    }
    else if (sub_2256581C0())
    {
      uint64_t v31 = v48;
      sub_2256582E0();
      sub_225658150();
      uint64_t v33 = v49;
      uint64_t v32 = v50;
    }
    else if (sub_225658230())
    {
      uint64_t v31 = v45;
      sub_2256581B0();
      sub_225658840();
      uint64_t v33 = v46;
      uint64_t v32 = v47;
    }
    else if (sub_225658270())
    {
      uint64_t v31 = v42;
      sub_225658220();
      sub_2256589F0();
      uint64_t v33 = v43;
      uint64_t v32 = v44;
    }
    else
    {
      if ((sub_225658260() & 1) == 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v0, v41);
        return sub_225658E10();
      }
      uint64_t v31 = v36;
      sub_2256581E0();
      sub_225658900();
      uint64_t v33 = v37;
      uint64_t v32 = v38;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v32);
    sub_225636578();
    uint64_t v28 = v34;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  return v28;
}

void sub_225636578()
{
  sub_225658BF0();
  unint64_t v0 = MEMORY[0x22A630BC0]();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
    sub_225636790();
    sub_225658DD0();
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  uint64_t v2 = sub_2256590F0();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_225626BF8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x22A631010](v3, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v8 = sub_225658CD0();
      uint64_t v9 = v4;
      sub_225658E50();
      sub_225658CE0();
      sub_225658E50();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v6 = *(void *)(v10 + 16);
      unint64_t v5 = *(void *)(v10 + 24);
      if (v6 >= v5 >> 1) {
        sub_225626BF8(v5 > 1, v6 + 1, 1);
      }
      ++v3;
      *(void *)(v10 + 16) = v6 + 1;
      uint64_t v7 = v10 + 16 * v6;
      *(void *)(v7 + 32) = v8;
      *(void *)(v7 + 40) = v9;
    }
    while (v2 != v3);
    goto LABEL_13;
  }
  __break(1u);
}

unint64_t sub_225636790()
{
  unint64_t result = qword_26AD581F8;
  if (!qword_26AD581F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD581F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD581F8);
  }
  return result;
}

uint64_t sub_2256367E4()
{
  uint64_t v1 = type metadata accessor for CacheKey();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1();
  v2();
  sub_2256588B0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = v3();
  if (qword_26AD58178 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = v6 + 4;
  os_unfair_lock_lock(v6 + 4);
  sub_22563E6E4();
  os_unfair_lock_unlock(v7);
  return sub_2256267E8(v0);
}

void *sub_225636970@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2256336A4(a1, *(void *(**)(uint64_t *__return_ptr))(v2 + 16), a2);
}

uint64_t sub_22563698C(uint64_t a1)
{
  if (qword_26AD58190 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_2256462C8(v2, a1);
  return swift_endAccess();
}

uint64_t sub_225636A30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_225636A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_225636AB0(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_225636AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102890);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_225657EB0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OverrideMatchResult.getPatchedUserParse(turnInputAndPreprocessing:)(a2, (uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_22562793C((uint64_t)v8, &qword_268102890);
    uint64_t matched = type metadata accessor for OverrideMatchResultAndParse(0);
    uint64_t v14 = a3;
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v16(v12, v8, v9);
    sub_225637CD0(a1, a3);
    uint64_t v17 = type metadata accessor for OverrideMatchResultAndParse(0);
    v16((char *)(a3 + *(int *)(v17 + 20)), v12, v9);
    uint64_t v14 = a3;
    uint64_t v15 = 0;
    uint64_t matched = v17;
  }
  return __swift_storeEnumTagSinglePayload(v14, v15, 1, matched);
}

uint64_t OverrideMatchResult.getPatchedUserParse(turnInputAndPreprocessing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v128 = a1;
  uint64_t v158 = a2;
  uint64_t v131 = sub_225657F00();
  OUTLINED_FUNCTION_0();
  uint64_t v130 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  uint64_t v129 = v5;
  OUTLINED_FUNCTION_34();
  uint64_t v6 = sub_2256584F0();
  OUTLINED_FUNCTION_0();
  uint64_t v134 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  uint64_t v133 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
  uint64_t v11 = OUTLINED_FUNCTION_5_4(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5();
  uint64_t v152 = v12;
  uint64_t v13 = OUTLINED_FUNCTION_34();
  uint64_t matched = type metadata accessor for UtteranceRuleMatchResult(v13);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_5();
  uint64_t v154 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102880);
  uint64_t v17 = OUTLINED_FUNCTION_5_4(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5();
  uint64_t v150 = v18;
  uint64_t v19 = OUTLINED_FUNCTION_34();
  uint64_t v149 = type metadata accessor for TurnInputRuleMatchResult(v19);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_5();
  uint64_t v155 = v21;
  OUTLINED_FUNCTION_34();
  uint64_t v147 = sub_225657BB0();
  OUTLINED_FUNCTION_0();
  uint64_t v145 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_5();
  uint64_t v144 = v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102888);
  uint64_t v26 = OUTLINED_FUNCTION_5_4(v25);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_5();
  uint64_t v146 = v27;
  OUTLINED_FUNCTION_34();
  uint64_t v148 = sub_225657C90();
  OUTLINED_FUNCTION_0();
  uint64_t v137 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2_2();
  uint64_t v136 = v30;
  MEMORY[0x270FA5388](v31);
  uint64_t v135 = (char *)&v122 - v32;
  OUTLINED_FUNCTION_34();
  uint64_t v141 = sub_225657CE0();
  OUTLINED_FUNCTION_0();
  uint64_t v140 = v33;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_5();
  uint64_t v139 = v35;
  OUTLINED_FUNCTION_34();
  uint64_t v36 = sub_225657CF0();
  OUTLINED_FUNCTION_0();
  uint64_t v138 = v37;
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v122 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_225657D30();
  OUTLINED_FUNCTION_0();
  uint64_t v142 = v41;
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  MEMORY[0x270FA5388](v43);
  uint64_t v44 = sub_225658D70();
  uint64_t v45 = OUTLINED_FUNCTION_5_4(v44);
  MEMORY[0x270FA5388](v45);
  uint64_t v46 = sub_225657EB0();
  OUTLINED_FUNCTION_0();
  uint64_t v157 = v47;
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_2_2();
  unint64_t v127 = v49;
  uint64_t v51 = MEMORY[0x270FA5388](v50);
  uint64_t v53 = (char *)&v122 - v52;
  MEMORY[0x270FA5388](v51);
  uint64_t v156 = (char *)&v122 - v54;
  OUTLINED_FUNCTION_34();
  uint64_t v55 = *(int *)(type metadata accessor for SiriNLOverride() + 48);
  uint64_t v151 = v2;
  uint64_t v56 = (uint64_t *)(v2 + v55);
  unint64_t v57 = v56[1];
  if (v57 >> 60 != 15)
  {
    uint64_t v125 = v6;
    uint64_t v61 = *v56;
    uint64_t v161 = 0;
    long long v159 = 0u;
    long long v160 = 0u;
    sub_225626B60(v61, v57);
    sub_225626B60(v61, v57);
    sub_225658D60();
    sub_225637B50();
    uint64_t v126 = v61;
    unint64_t v132 = v57;
    sub_225658D80();
    uint64_t v62 = v156;
    id v63 = *(void (**)(char *, char *, uint64_t))(v157 + 32);
    uint64_t v124 = v46;
    v63(v156, v53, v46);
    uint64_t v64 = *(void *)(sub_225657DE0() + 16);
    swift_bridgeObjectRelease();
    if (!v64)
    {
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      id v72 = (id)qword_26AD58298;
      OUTLINED_FUNCTION_14_2();
      sub_225658DA0();

      OUTLINED_FUNCTION_4_5();
      uint64_t v73 = v124;
      OUTLINED_FUNCTION_9_0();
      v74();
      uint64_t v75 = OUTLINED_FUNCTION_11_2();
      uint64_t v78 = v73;
      return __swift_storeEnumTagSinglePayload(v75, v76, v77, v78);
    }
    int v123 = (void (*)(uint64_t, char *, uint64_t))v63;
    sub_225657D20();
    (*(void (**)(char *, void, uint64_t))(v138 + 104))(v40, *MEMORY[0x263F71490], v36);
    sub_225657D10();
    (*(void (**)(uint64_t, void, uint64_t))(v140 + 104))(v139, *MEMORY[0x263F71470], v141);
    sub_225657D00();
    OUTLINED_FUNCTION_7_1();
    v65();
    sub_225657EA0();
    sub_225657BA0();
    uint64_t v66 = v146;
    sub_225658BE0();
    OUTLINED_FUNCTION_9_0();
    v67();
    uint64_t v68 = v148;
    uint64_t v69 = v62;
    if (__swift_getEnumTagSinglePayload(v66, 1, v148) == 1)
    {
      uint64_t v70 = OUTLINED_FUNCTION_18_1();
      v71(v70);
      sub_22562793C(v66, &qword_268102888);
    }
    else
    {
      uint64_t v79 = v137;
      uint64_t v80 = v135;
      (*(void (**)(char *, uint64_t, uint64_t))(v137 + 32))(v135, v66, v68);
      OUTLINED_FUNCTION_7_1();
      v81();
      sub_225657E90();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v68);
      uint64_t v82 = OUTLINED_FUNCTION_18_1();
      v83(v82);
    }
    uint64_t v84 = v124;
    uint64_t v85 = v155;
    uint64_t v86 = v152;
    uint64_t v87 = matched;
    uint64_t v89 = v149;
    uint64_t v88 = v150;
    uint64_t v90 = type metadata accessor for OverrideMatchResult(0);
    sub_225648518(*(void *)(v151 + *(int *)(v90 + 24)), type metadata accessor for TurnInputRuleMatchResult, (void (*)(void))type metadata accessor for TurnInputRuleMatchResult, v88);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v88, 1, v89);
    uint64_t v92 = v154;
    if (EnumTagSinglePayload == 1)
    {
      uint64_t v93 = &qword_268102880;
      uint64_t v94 = v88;
    }
    else
    {
      sub_225637BC8(v88, v85);
      sub_22564A53C(v85 + *(int *)(v89 + 20), v86, &qword_268102878);
      if (__swift_getEnumTagSinglePayload(v86, 1, v87) != 1)
      {
        sub_225637BC8(v86, v92);
        uint64_t v99 = v134;
        uint64_t v100 = v133;
        uint64_t v101 = v125;
        OUTLINED_FUNCTION_7_1();
        v102();
        int v103 = (*(uint64_t (**)(uint64_t, uint64_t))(v99 + 88))(v100, v101);
        if (v103 == *MEMORY[0x263F715A0]) {
          goto LABEL_25;
        }
        if (v103 != *MEMORY[0x263F715A8])
        {
          sub_225635818(v126, v132);
          sub_225637C80(v92);
          sub_225637C80(v85);
          uint64_t v113 = OUTLINED_FUNCTION_5_5();
          v114(v113);
          uint64_t v115 = OUTLINED_FUNCTION_11_2();
          __swift_storeEnumTagSinglePayload(v115, v116, v117, v84);
          OUTLINED_FUNCTION_9_0();
          return v118();
        }
        if (!*(void *)(v92 + *(int *)(v87 + 24)))
        {
          sub_225658F90();
          if (qword_26AD58250 != -1) {
            swift_once();
          }
          id v119 = (id)qword_26AD58298;
          OUTLINED_FUNCTION_14_2();
          sub_225658DA0();

          OUTLINED_FUNCTION_4_5();
          sub_225637C80(v92);
          sub_225637C80(v85);
          uint64_t v120 = OUTLINED_FUNCTION_5_5();
          v121(v120);
          uint64_t v75 = v158;
          goto LABEL_21;
        }
        swift_bridgeObjectRetain();
        sub_225658B40();
        sub_225658B10();
        sub_2256407B4();
        uint64_t v108 = v107;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_9_0();
        v109();
        if (!v108)
        {
LABEL_25:
          OUTLINED_FUNCTION_4_5();
          sub_225637C80(v92);
          sub_225637C80(v85);
          uint64_t v104 = v158;
          uint64_t v105 = v158;
          uint64_t v106 = v69;
        }
        else
        {
          uint64_t v110 = v157;
          uint64_t v111 = v127;
          OUTLINED_FUNCTION_7_1();
          v112();
          sub_225657E80();
          OUTLINED_FUNCTION_4_5();
          sub_225637C80(v92);
          sub_225637C80(v85);
          (*(void (**)(char *, uint64_t))(v110 + 8))(v69, v84);
          uint64_t v104 = v158;
          uint64_t v105 = v158;
          uint64_t v106 = v111;
        }
        v123(v105, v106, v84);
        uint64_t v75 = v104;
        uint64_t v76 = 0;
        goto LABEL_22;
      }
      sub_225637C80(v85);
      uint64_t v93 = &qword_268102878;
      uint64_t v94 = v86;
    }
    sub_22562793C(v94, v93);
    sub_225658F90();
    uint64_t v95 = v158;
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v96 = (id)qword_26AD58298;
    OUTLINED_FUNCTION_14_2();
    sub_225658DA0();

    OUTLINED_FUNCTION_4_5();
    uint64_t v97 = OUTLINED_FUNCTION_5_5();
    v98(v97);
    uint64_t v75 = v95;
LABEL_21:
    uint64_t v76 = 1;
LABEL_22:
    uint64_t v77 = 1;
    uint64_t v78 = v84;
    return __swift_storeEnumTagSinglePayload(v75, v76, v77, v78);
  }
  uint64_t v58 = v158;
  sub_225658F90();
  if (qword_26AD58250 != -1) {
    swift_once();
  }
  id v59 = (id)qword_26AD58298;
  OUTLINED_FUNCTION_14_2();
  sub_225658DA0();

  return __swift_storeEnumTagSinglePayload(v58, 1, 1, v46);
}

unint64_t sub_225637B50()
{
  unint64_t result = qword_26AD581D8;
  if (!qword_26AD581D8)
  {
    sub_225657EB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD581D8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TurnInputRuleMatchResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22564A0C8);
}

uint64_t getEnumTagSinglePayload for TurnInputRuleMatchResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22564A050);
}

uint64_t sub_225637BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_16_1();
  v5(v4);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a2, a1);
  return a2;
}

uint64_t sub_225637C24(uint64_t a1)
{
  uint64_t matched = type metadata accessor for TurnInputRuleMatchResult(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(matched - 8) + 8))(a1, matched);
  return a1;
}

uint64_t sub_225637C80(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_16_1();
  v3(v2);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_0();
  v4();
  return a1;
}

uint64_t sub_225637CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_21_1();
  v5(v4);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(a2, a1);
  return a2;
}

uint64_t sub_225637D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22564C078);
}

uint64_t sub_225637D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22564BFFC);
}

void *sub_225637D54(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  a1[6] = a2[6];
  uint64_t v9 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v10 = v9[9];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_225657B90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  }
  *((unsigned char *)a1 + v9[10]) = *((unsigned char *)a2 + v9[10]);
  uint64_t v15 = v9[11];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = v9[12];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (_OWORD *)((char *)a2 + v19);
  unint64_t v22 = *(void *)((char *)a2 + v19 + 8);
  swift_bridgeObjectRetain();
  if (v22 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v20 = *v21;
  }
  else
  {
    uint64_t v23 = *(void *)v21;
    sub_225626B60(v23, v22);
    *(void *)uint64_t v20 = v23;
    *((void *)v20 + 1) = v22;
  }
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  uint64_t v24 = v9[14];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  unint64_t v27 = *((void *)v26 + 1);
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  }
  else
  {
    uint64_t v28 = *(void *)v26;
    sub_225626B60(*(void *)v26, *((void *)v26 + 1));
    *(void *)uint64_t v25 = v28;
    *((void *)v25 + 1) = v27;
  }
  uint64_t v29 = v9[15];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_225658BD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  }
  uint64_t matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *((unsigned char *)a1 + matched[5]) = *((unsigned char *)a2 + matched[5]);
  *(void *)((char *)a1 + matched[6]) = *(void *)((char *)a2 + matched[6]);
  *(void *)((char *)a1 + matched[7]) = *(void *)((char *)a2 + matched[7]);
  uint64_t v35 = *(int *)(a3 + 20);
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)a2 + v35;
  uint64_t v38 = sub_225657EB0();
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39(v36, v37, v38);
  return a1;
}

void sub_22563805C(uint64_t *a1)
{
  type metadata accessor for OverrideMatchResultAndParse(0);
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_22564CAC4();
    uint64_t v2 = v3;
  }
  sub_225638254();
  *a1 = v2;
}

void sub_225638158(uint64_t *a1)
{
  type metadata accessor for OverrideMatchResult(0);
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_22564CB1C();
    uint64_t v2 = v3;
  }
  sub_225638254();
  *a1 = v2;
}

void sub_225638254()
{
  OUTLINED_FUNCTION_25_1();
  uint64_t v241 = v1;
  v262 = v2;
  uint64_t v257 = v3;
  uint64_t v258 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  uint64_t v11 = OUTLINED_FUNCTION_5_4(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v247 = (uint64_t)&v221 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_1();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v221 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v221 - v18;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_25();
  uint64_t v237 = v20;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_25();
  uint64_t v225 = v22;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_26();
  uint64_t v224 = v24;
  uint64_t v252 = sub_225657B90();
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2_2();
  uint64_t v245 = v28;
  OUTLINED_FUNCTION_6_1();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v221 - v31;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_25();
  uint64_t v230 = v33;
  OUTLINED_FUNCTION_6_1();
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v221 - v36;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_25();
  unint64_t v222 = v38;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_26();
  uint64_t v242 = v40;
  uint64_t v41 = OUTLINED_FUNCTION_21_1();
  v6(v41);
  OUTLINED_FUNCTION_0();
  uint64_t v243 = v43;
  uint64_t v244 = v42;
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_2_2();
  uint64_t v236 = v44;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_25();
  uint64_t v259 = v46;
  OUTLINED_FUNCTION_6_1();
  uint64_t v48 = MEMORY[0x270FA5388](v47);
  uint64_t v50 = (char *)&v221 - v49;
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_25();
  uint64_t v263 = v51;
  OUTLINED_FUNCTION_6_1();
  uint64_t v53 = MEMORY[0x270FA5388](v52);
  uint64_t v55 = (char *)&v221 - v54;
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_25();
  uint64_t v239 = v56;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v57);
  OUTLINED_FUNCTION_25();
  uint64_t v228 = v58;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_26();
  uint64_t v229 = v60;
  uint64_t v264 = v9;
  uint64_t v61 = v9[1];
  uint64_t v62 = sub_225659170();
  if (v62 >= v61)
  {
    if (v61 < 0) {
      goto LABEL_166;
    }
    if (v61) {
      sub_225639288();
    }
LABEL_143:
    OUTLINED_FUNCTION_19_1();
    return;
  }
  if (v61 < -1) {
    goto LABEL_165;
  }
  uint64_t v227 = v62;
  uint64_t v63 = MEMORY[0x263F8EE78];
  unint64_t v233 = v37;
  if (v61 > 1)
  {
    uint64_t v63 = sub_225658F40();
    *(void *)(v63 + 16) = v61 / 2;
  }
  uint64_t v223 = v63;
  OUTLINED_FUNCTION_15_1();
  uint64_t v240 = v223 + v69;
  if (v61 <= 0)
  {
    uint64_t v70 = MEMORY[0x263F8EE78];
    unint64_t v159 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_131:
    if (v159 >= 2)
    {
      uint64_t v214 = *v264;
      do
      {
        unint64_t v215 = v159 - 2;
        if (v159 < 2) {
          goto LABEL_159;
        }
        if (!v214) {
          goto LABEL_173;
        }
        uint64_t v216 = *(void *)(v70 + 32 + 16 * v215);
        uint64_t v217 = *(void *)(v70 + 32 + 16 * (v159 - 1) + 8);
        OUTLINED_FUNCTION_10_5(v214 + *(void *)(v243 + 72) * v216, v214 + *(void *)(v243 + 72) * *(void *)(v70 + 32 + 16 * (v159 - 1)), v214 + *(void *)(v243 + 72) * v217, v64, v65, v66, v67, v68, v221, v222, v223, v224, v225, (uint64_t)v226, v227, v228, v229, v230, v231,
          (uint64_t)v232);
        if (v0) {
          break;
        }
        if (v217 < v216) {
          goto LABEL_160;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22564CA9C(v70);
          uint64_t v70 = v220;
        }
        if (v215 >= *(void *)(v70 + 16)) {
          goto LABEL_161;
        }
        uint64_t v218 = (void *)(v70 + 32 + 16 * v215);
        *uint64_t v218 = v216;
        v218[1] = v217;
        unint64_t v219 = *(void *)(v70 + 16);
        if (v159 > v219) {
          goto LABEL_162;
        }
        memmove((void *)(v70 + 32 + 16 * (v159 - 1)), (const void *)(v70 + 32 + 16 * v159), 16 * (v219 - v159));
        *(void *)(v70 + 16) = v219 - 1;
        unint64_t v159 = v219 - 1;
      }
      while (v219 > 2);
    }
LABEL_142:
    swift_bridgeObjectRelease();
    *(void *)(v223 + 16) = 0;
    swift_bridgeObjectRelease();
    goto LABEL_143;
  }
  unint64_t v251 = (void (**)(void))(v26 + 8);
  v248 = v16;
  uint64_t v232 = v19;
  uint64_t v246 = v32;
  uint64_t v70 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_15_2();
  uint64_t v226 = v50;
  char v255 = v55;
  unint64_t v250 = v73;
  while (1)
  {
    uint64_t v74 = v71;
    uint64_t v75 = v71 + 1;
    uint64_t v254 = v72;
    uint64_t v231 = v70;
    uint64_t v238 = v71;
    if (v71 + 1 >= v72)
    {
      uint64_t v88 = v227;
LABEL_12:
      uint64_t v89 = v254;
      goto LABEL_50;
    }
    uint64_t v76 = v71;
    uint64_t v77 = *v264;
    uint64_t v78 = *(void *)(v243 + 72);
    uint64_t v256 = v71 + 1;
    uint64_t v79 = v229;
    sub_225637CD0(v77 + v78 * v75, v229);
    uint64_t v234 = v77;
    uint64_t v261 = v78;
    uint64_t v80 = v77 + v78 * v76;
    uint64_t v81 = v228;
    sub_225637CD0(v80, v228);
    uint64_t v82 = type metadata accessor for SiriNLOverride();
    uint64_t v83 = v224;
    sub_225644F98(v79 + *(int *)(v82 + 36), v224);
    uint64_t v84 = OUTLINED_FUNCTION_22_1();
    uint64_t v85 = v252;
    OUTLINED_FUNCTION_8_4(v84, v86, v252);
    uint64_t v87 = v225;
    uint64_t v253 = v82;
    if (v91)
    {
      sub_22562793C(v83, (uint64_t *)&unk_26AD581C8);
      LODWORD(v260) = 0;
    }
    else
    {
      v260 = *v250;
      OUTLINED_FUNCTION_26_1();
      v90();
      sub_225644F98(v81 + *(int *)(v82 + 36), v87);
      OUTLINED_FUNCTION_8_4(v87, 1, v85);
      if (v91)
      {
        OUTLINED_FUNCTION_9_0();
        v92();
        sub_22562793C(v87, (uint64_t *)&unk_26AD581C8);
        LODWORD(v260) = 0;
      }
      else
      {
        unint64_t v93 = v222;
        OUTLINED_FUNCTION_26_1();
        v94();
        LODWORD(v260) = sub_225657B80() == -1;
        uint64_t v95 = *v251;
        OUTLINED_FUNCTION_15_2();
        v95();
        ((void (*)(unint64_t, uint64_t))v95)(v93, v85);
      }
      uint64_t v81 = v228;
    }
    id v96 = v258;
    sub_2256398C0(v81, v258);
    sub_2256398C0(v229, v96);
    OUTLINED_FUNCTION_24();
    uint64_t v75 = v74 + 2;
    uint64_t v97 = v252;
    if (v74 + 2 >= v254)
    {
      uint64_t v89 = v254;
    }
    else
    {
      uint64_t v249 = v261 * v256;
      uint64_t v98 = v234;
      uint64_t v235 = v261 * v75;
      uint64_t v89 = v254;
      while (1)
      {
        uint64_t v256 = v75;
        uint64_t v99 = v7;
        uint64_t v100 = v239;
        sub_225637CD0(v98 + v235, v239);
        sub_225637CD0(v98 + v249, (uint64_t)v55);
        uint64_t v101 = v253;
        uint64_t v102 = v237;
        sub_225644F98(v100 + *(int *)(v253 + 36), v237);
        uint64_t v103 = OUTLINED_FUNCTION_22_1();
        OUTLINED_FUNCTION_8_4(v103, v104, v97);
        if (v91)
        {
          sub_22562793C(v102, (uint64_t *)&unk_26AD581C8);
          int v105 = 0;
        }
        else
        {
          uint64_t v106 = *v250;
          uint64_t v107 = v55;
          uint64_t v108 = v233;
          OUTLINED_FUNCTION_34_0();
          v106();
          uint64_t v109 = (uint64_t)&v107[*(int *)(v101 + 36)];
          uint64_t v110 = (uint64_t)v232;
          sub_225644F98(v109, (uint64_t)v232);
          OUTLINED_FUNCTION_8_4(v110, 1, v97);
          if (v111)
          {
            OUTLINED_FUNCTION_9_0();
            v112();
            sub_22562793C(v110, (uint64_t *)&unk_26AD581C8);
            int v105 = 0;
          }
          else
          {
            uint64_t v113 = v230;
            OUTLINED_FUNCTION_34_0();
            v106();
            int v105 = sub_225657B80() == -1;
            uint64_t v114 = *v251;
            uint64_t v115 = v113;
            uint64_t v70 = v231;
            ((void (*)(uint64_t, uint64_t))*v251)(v115, v97);
            ((void (*)(char *, uint64_t))v114)(v108, v97);
          }
          uint64_t v89 = v254;
          uint64_t v55 = v255;
        }
        uint64_t v7 = v99;
        uint64_t v116 = v258;
        sub_2256398C0((uint64_t)v55, v258);
        sub_2256398C0(v239, v116);
        if (v260 != v105) {
          break;
        }
        uint64_t v75 = v256 + 1;
        v98 += v261;
        if (v256 + 1 >= v89)
        {
          uint64_t v75 = v89;
          OUTLINED_FUNCTION_15_2();
          goto LABEL_31;
        }
      }
      OUTLINED_FUNCTION_15_2();
      uint64_t v75 = v256;
LABEL_31:
      OUTLINED_FUNCTION_24();
    }
    uint64_t v88 = v227;
    if (v260)
    {
      if (v75 < v74) {
        goto LABEL_167;
      }
      if (v74 < v75)
      {
        uint64_t v117 = 0;
        uint64_t v118 = v261 * (v75 - 1);
        uint64_t v119 = v75 * v261;
        uint64_t v120 = v74;
        uint64_t v121 = v74 * v261;
        do
        {
          if (v120 != v75 + v117 - 1)
          {
            uint64_t v235 = v7;
            uint64_t v122 = v234;
            if (!v234) {
              goto LABEL_172;
            }
            unint64_t v123 = v234 + v121;
            v260 = (void (*)(void))(v234 + v118);
            sub_225633238(v234 + v121, v236, v262);
            if (v121 < v118 || v123 >= v122 + v119)
            {
              uint64_t v125 = (uint64_t)v260;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v125 = (uint64_t)v260;
              if (v121 != v118) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            sub_225633238(v236, v125, v262);
            OUTLINED_FUNCTION_15_2();
            uint64_t v7 = v235;
          }
          ++v120;
          --v117;
          v118 -= v261;
          v119 -= v261;
          v121 += v261;
        }
        while (v120 < v75 + v117);
        uint64_t v70 = v231;
        uint64_t v50 = v226;
        OUTLINED_FUNCTION_24();
        goto LABEL_12;
      }
    }
    uint64_t v50 = v226;
LABEL_50:
    if (v75 >= v89) {
      goto LABEL_76;
    }
    BOOL v174 = __OFSUB__(v75, v74);
    uint64_t v126 = v75 - v74;
    if (v174) {
      goto LABEL_164;
    }
    if (v126 >= v88)
    {
LABEL_75:
      OUTLINED_FUNCTION_24();
      goto LABEL_76;
    }
    if (__OFADD__(v238, v88)) {
      goto LABEL_168;
    }
    uint64_t v127 = v238 + v88 >= v89 ? v89 : v238 + v88;
    if (v127 < v238) {
      break;
    }
    if (v75 != v127)
    {
      uint64_t v235 = v7;
      uint64_t v128 = *(void *)(v243 + 72);
      uint64_t v129 = v128 * (v75 - 1);
      uint64_t v249 = v128;
      uint64_t v130 = v75 * v128;
      uint64_t v234 = v127;
      while (1)
      {
        uint64_t v131 = 0;
        OUTLINED_FUNCTION_24();
        uint64_t v256 = v75;
        uint64_t v253 = v130;
        uint64_t v254 = v129;
        while (1)
        {
          uint64_t v261 = v132;
          uint64_t v133 = *v264;
          v260 = (void (*)(void))(v130 + v131);
          uint64_t v134 = v130 + v131 + v133;
          uint64_t v135 = v263;
          sub_225637CD0(v134, v263);
          sub_225637CD0(v129 + v131 + v133, (uint64_t)v50);
          uint64_t v136 = type metadata accessor for SiriNLOverride();
          uint64_t v137 = (uint64_t)v248;
          sub_225644F98(v135 + *(int *)(v136 + 36), (uint64_t)v248);
          uint64_t v138 = v252;
          OUTLINED_FUNCTION_8_4(v137, 1, v252);
          if (v91)
          {
            uint64_t v153 = v137;
LABEL_70:
            uint64_t v55 = v255;
            sub_22562793C(v153, (uint64_t *)&unk_26AD581C8);
            uint64_t v155 = v258;
            sub_2256398C0((uint64_t)v50, v258);
            sub_2256398C0(v263, v155);
            goto LABEL_72;
          }
          uint64_t v139 = *v250;
          uint64_t v140 = (uint64_t)v50;
          uint64_t v141 = v246;
          OUTLINED_FUNCTION_34_0();
          v139();
          uint64_t v142 = v140 + *(int *)(v136 + 36);
          uint64_t v143 = v247;
          sub_225644F98(v142, v247);
          uint64_t v144 = OUTLINED_FUNCTION_22_1();
          OUTLINED_FUNCTION_8_4(v144, v145, v138);
          if (v91)
          {
            OUTLINED_FUNCTION_9_0();
            v154();
            uint64_t v153 = v143;
            uint64_t v50 = (char *)v140;
            goto LABEL_70;
          }
          uint64_t v146 = v245;
          OUTLINED_FUNCTION_34_0();
          v139();
          uint64_t v147 = sub_225657B80();
          uint64_t v148 = *v251;
          ((void (*)(uint64_t, uint64_t))*v251)(v146, v138);
          ((void (*)(char *, uint64_t))v148)(v141, v138);
          uint64_t v149 = v258;
          sub_2256398C0(v140, v258);
          sub_2256398C0(v263, v149);
          uint64_t v50 = (char *)v140;
          if (v147 != -1) {
            break;
          }
          uint64_t v150 = *v264;
          uint64_t v129 = v254;
          uint64_t v55 = v255;
          uint64_t v130 = v253;
          if (!*v264) {
            goto LABEL_170;
          }
          uint64_t v151 = v150 + v254 + v131;
          sub_225633238(v150 + v253 + v131, v259, v262);
          swift_arrayInitWithTakeFrontToBack();
          sub_225633238(v259, v151, v262);
          v131 -= v249;
          uint64_t v132 = v261 + 1;
          uint64_t v152 = v256;
          if (v256 == v261 + 1) {
            goto LABEL_73;
          }
        }
        uint64_t v55 = v255;
LABEL_72:
        uint64_t v152 = v256;
        uint64_t v130 = v253;
        uint64_t v129 = v254;
LABEL_73:
        uint64_t v75 = v152 + 1;
        v129 += v249;
        v130 += v249;
        if (v75 == v234)
        {
          uint64_t v75 = v234;
          uint64_t v7 = v235;
          uint64_t v70 = v231;
          OUTLINED_FUNCTION_15_2();
          goto LABEL_75;
        }
      }
    }
    uint64_t v74 = v238;
LABEL_76:
    if (v75 < v74) {
      goto LABEL_163;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v256 = v75;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v209 = OUTLINED_FUNCTION_29();
      sub_22564C8EC(v209, v210, v211, (char *)v70);
      uint64_t v70 = v212;
    }
    unint64_t v158 = *(void *)(v70 + 16);
    unint64_t v157 = *(void *)(v70 + 24);
    unint64_t v159 = v158 + 1;
    if (v158 >= v157 >> 1)
    {
      sub_22564C8EC(v157 > 1, v158 + 1, 1, (char *)v70);
      uint64_t v70 = v213;
    }
    *(void *)(v70 + 16) = v159;
    uint64_t v160 = v70 + 32;
    uint64_t v161 = (void *)(v70 + 32 + 16 * v158);
    uint64_t v162 = v256;
    *uint64_t v161 = v238;
    v161[1] = v162;
    if (v158)
    {
      while (1)
      {
        unint64_t v163 = v159 - 1;
        if (v159 >= 4)
        {
          unint64_t v168 = v160 + 16 * v159;
          uint64_t v169 = *(void *)(v168 - 64);
          uint64_t v170 = *(void *)(v168 - 56);
          BOOL v174 = __OFSUB__(v170, v169);
          uint64_t v171 = v170 - v169;
          if (v174) {
            goto LABEL_148;
          }
          uint64_t v173 = *(void *)(v168 - 48);
          uint64_t v172 = *(void *)(v168 - 40);
          BOOL v174 = __OFSUB__(v172, v173);
          uint64_t v166 = v172 - v173;
          char v167 = v174;
          if (v174) {
            goto LABEL_149;
          }
          unint64_t v175 = v159 - 2;
          uint64_t v176 = (uint64_t *)(v160 + 16 * (v159 - 2));
          uint64_t v178 = *v176;
          uint64_t v177 = v176[1];
          BOOL v174 = __OFSUB__(v177, v178);
          uint64_t v179 = v177 - v178;
          if (v174) {
            goto LABEL_150;
          }
          BOOL v174 = __OFADD__(v166, v179);
          uint64_t v180 = v166 + v179;
          if (v174) {
            goto LABEL_152;
          }
          if (v180 >= v171)
          {
            long long v198 = (uint64_t *)(v160 + 16 * v163);
            uint64_t v200 = *v198;
            uint64_t v199 = v198[1];
            BOOL v174 = __OFSUB__(v199, v200);
            uint64_t v201 = v199 - v200;
            if (v174) {
              goto LABEL_158;
            }
            BOOL v191 = v166 < v201;
            goto LABEL_113;
          }
        }
        else
        {
          if (v159 != 3)
          {
            uint64_t v192 = *(void *)(v70 + 32);
            uint64_t v193 = *(void *)(v70 + 40);
            BOOL v174 = __OFSUB__(v193, v192);
            uint64_t v185 = v193 - v192;
            char v186 = v174;
            goto LABEL_107;
          }
          uint64_t v165 = *(void *)(v70 + 32);
          uint64_t v164 = *(void *)(v70 + 40);
          BOOL v174 = __OFSUB__(v164, v165);
          uint64_t v166 = v164 - v165;
          char v167 = v174;
        }
        if (v167) {
          goto LABEL_151;
        }
        unint64_t v175 = v159 - 2;
        uint64_t v181 = (uint64_t *)(v160 + 16 * (v159 - 2));
        uint64_t v183 = *v181;
        uint64_t v182 = v181[1];
        BOOL v184 = __OFSUB__(v182, v183);
        uint64_t v185 = v182 - v183;
        char v186 = v184;
        if (v184) {
          goto LABEL_153;
        }
        id v187 = (uint64_t *)(v160 + 16 * v163);
        uint64_t v189 = *v187;
        uint64_t v188 = v187[1];
        BOOL v174 = __OFSUB__(v188, v189);
        uint64_t v190 = v188 - v189;
        if (v174) {
          goto LABEL_155;
        }
        if (__OFADD__(v185, v190)) {
          goto LABEL_157;
        }
        if (v185 + v190 >= v166)
        {
          BOOL v191 = v166 < v190;
LABEL_113:
          if (v191) {
            unint64_t v163 = v175;
          }
          goto LABEL_115;
        }
LABEL_107:
        if (v186) {
          goto LABEL_154;
        }
        uint64_t v194 = (uint64_t *)(v160 + 16 * v163);
        uint64_t v196 = *v194;
        uint64_t v195 = v194[1];
        BOOL v174 = __OFSUB__(v195, v196);
        uint64_t v197 = v195 - v196;
        if (v174) {
          goto LABEL_156;
        }
        if (v197 < v185) {
          goto LABEL_124;
        }
LABEL_115:
        unint64_t v202 = v163 - 1;
        if (v163 - 1 >= v159)
        {
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
          goto LABEL_169;
        }
        if (!*v264) {
          goto LABEL_171;
        }
        uint64_t v203 = v70;
        unint64_t v204 = (uint64_t *)(v160 + 16 * v202);
        uint64_t v205 = *v204;
        unint64_t v206 = (void *)(v160 + 16 * v163);
        uint64_t v207 = v206[1];
        OUTLINED_FUNCTION_10_5(*v264 + *(void *)(v243 + 72) * *v204, *v264 + *(void *)(v243 + 72) * *v206, *v264 + *(void *)(v243 + 72) * v207, v64, v65, v66, v67, v68, v221, v222, v223, v224, v225, (uint64_t)v226, v227, v228, v229, v230, v231,
          (uint64_t)v232);
        uint64_t v7 = v0;
        if (v0) {
          goto LABEL_142;
        }
        if (v207 < v205) {
          goto LABEL_145;
        }
        if (v163 > *(void *)(v203 + 16)) {
          goto LABEL_146;
        }
        *unint64_t v204 = v205;
        *(void *)(v160 + 16 * v202 + 8) = v207;
        unint64_t v208 = *(void *)(v203 + 16);
        if (v163 >= v208) {
          goto LABEL_147;
        }
        uint64_t v70 = v203;
        unint64_t v159 = v208 - 1;
        memmove((void *)(v160 + 16 * v163), v206 + 2, 16 * (v208 - 1 - v163));
        *(void *)(v203 + 16) = v208 - 1;
        uint64_t v55 = v255;
        if (v208 <= 2) {
          goto LABEL_124;
        }
      }
    }
    unint64_t v159 = 1;
LABEL_124:
    uint64_t v72 = v264[1];
    uint64_t v71 = v256;
    uint64_t v50 = v226;
    if (v256 >= v72) {
      goto LABEL_131;
    }
  }
LABEL_169:
  __break(1u);
LABEL_170:
  __break(1u);
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
}

void sub_225639288()
{
  OUTLINED_FUNCTION_25_1();
  uint64_t v70 = v0;
  uint64_t v63 = v1;
  uint64_t v65 = v2;
  uint64_t v4 = v3;
  uint64_t v74 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v58 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  uint64_t v12 = OUTLINED_FUNCTION_5_4(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_2();
  uint64_t v62 = v13;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_26();
  uint64_t v64 = v15;
  uint64_t v16 = sub_225657B90();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_2_2();
  uint64_t v60 = v20;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = &v56[-v22];
  uint64_t v24 = OUTLINED_FUNCTION_21_1();
  uint64_t v59 = v4(v24);
  uint64_t v25 = MEMORY[0x270FA5388](v59);
  uint64_t v69 = &v56[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = &v56[-v28];
  MEMORY[0x270FA5388](v27);
  uint64_t v68 = v7;
  uint64_t v57 = v9;
  if (v7 != v9)
  {
    uint64_t v32 = &v56[-v31];
    uint64_t v33 = *(void *)(v30 + 72);
    uint64_t v34 = (void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
    uint64_t v61 = (void (**)(uint64_t, uint64_t))(v18 + 8);
    uint64_t v35 = v33 * (v68 - 1);
    uint64_t v66 = v33;
    uint64_t v76 = v33 * v68;
    while (2)
    {
      uint64_t v36 = 0;
      uint64_t v75 = v58;
      uint64_t v67 = v35;
      while (1)
      {
        uint64_t v37 = *v74;
        uint64_t v73 = v76 + v36;
        sub_225637CD0(v76 + v36 + v37, (uint64_t)v32);
        uint64_t v72 = v35 + v36;
        sub_225637CD0(v35 + v36 + v37, (uint64_t)v29);
        uint64_t v38 = type metadata accessor for SiriNLOverride();
        uint64_t v39 = v64;
        sub_225644F98((uint64_t)&v32[*(int *)(v38 + 36)], v64);
        OUTLINED_FUNCTION_8_4(v39, 1, v16);
        if (v40)
        {
          uint64_t v53 = v39;
          goto LABEL_12;
        }
        uint64_t v41 = v39;
        uint64_t v42 = *v34;
        (*v34)((uint64_t)v23, v41, v16);
        uint64_t v43 = (uint64_t)&v29[*(int *)(v38 + 36)];
        uint64_t v44 = v62;
        sub_225644F98(v43, v62);
        OUTLINED_FUNCTION_8_4(v44, 1, v16);
        if (v40) {
          break;
        }
        uint64_t v45 = v32;
        uint64_t v46 = v29;
        uint64_t v47 = v60;
        v42(v60, v44, v16);
        uint64_t v71 = sub_225657B80();
        uint64_t v48 = *v61;
        uint64_t v49 = v47;
        uint64_t v29 = v46;
        uint64_t v32 = v45;
        uint64_t v35 = v67;
        (*v61)(v49, v16);
        v48((uint64_t)v23, v16);
        uint64_t v50 = v63;
        sub_2256398C0((uint64_t)v29, v63);
        sub_2256398C0((uint64_t)v32, v50);
        if (v71 == -1)
        {
          uint64_t v51 = *v74;
          if (!*v74)
          {
            __break(1u);
            return;
          }
          uint64_t v52 = v51 + v35 + v36;
          sub_225633238(v51 + v76 + v36, (uint64_t)v69, v70);
          swift_arrayInitWithTakeFrontToBack();
          sub_225633238((uint64_t)v69, v52, v70);
          v36 -= v66;
          if (v68 != ++v75) {
            continue;
          }
        }
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_9_0();
      v54();
      uint64_t v53 = v44;
LABEL_12:
      sub_22562793C(v53, (uint64_t *)&unk_26AD581C8);
      uint64_t v55 = v63;
      sub_2256398C0((uint64_t)v29, v63);
      sub_2256398C0((uint64_t)v32, v55);
LABEL_13:
      v35 += v66;
      v76 += v66;
      if (++v68 != v57) {
        continue;
      }
      break;
    }
  }
  OUTLINED_FUNCTION_19_1();
}

uint64_t sub_2256396F8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v5 = a1 + v4[9];
  uint64_t v6 = sub_225657B90();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + v4[12]);
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_225627258(*v7, v8);
  }
  uint64_t v9 = (uint64_t *)(a1 + v4[14]);
  unint64_t v10 = v9[1];
  if (v10 >> 60 != 15) {
    sub_225627258(*v9, v10);
  }
  uint64_t v11 = a1 + v4[15];
  uint64_t v12 = sub_225658BD0();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  type metadata accessor for OverrideMatchResult(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = a1 + *(int *)(a2 + 20);
  uint64_t v14 = sub_225657EB0();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  return v15(v13, v14);
}

uint64_t sub_2256398C0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

void static MatchingSpanUtils.getAdjacentSpanLists(from:usingTokens:)()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v113 = sub_225657CD0();
  OUTLINED_FUNCTION_0();
  uint64_t v115 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5();
  uint64_t v112 = v6;
  uint64_t v7 = sub_2256580F0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  char v111 = (char *)&v97 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v97 - v17;
  uint64_t v120 = v3;
  if (!*(void *)(v3 + 16)) {
    goto LABEL_62;
  }
  unint64_t v107 = v15;
  uint64_t v110 = v14;
  uint64_t v19 = *(void *)(v120 + 32);
  unint64_t v20 = *(void *)(v19 + 16);
  if (!v20) {
    goto LABEL_62;
  }
  uint64_t v117 = v16;
  uint64_t v118 = v19;
  uint64_t v22 = *(void (**)(unint64_t, char *, uint64_t))(v16 + 16);
  uint64_t v21 = v16 + 16;
  unint64_t v23 = (*(unsigned __int8 *)(v21 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 64);
  uint64_t v24 = (char *)(v19 + v23);
  uint64_t v25 = *(void *)(v21 + 56);
  unint64_t v119 = v23;
  uint64_t v125 = v25;
  uint64_t v126 = v22;
  uint64_t v122 = v1;
  unint64_t v123 = (void (*)(void))(v25 + v23);
  uint64_t v127 = v21;
  uint64_t v124 = (void (**)(void))(v21 - 8);
  swift_bridgeObjectRetain();
  uint64_t v26 = (void *)MEMORY[0x263F8EE78];
  long long v121 = xmmword_225659D50;
  do
  {
    uint64_t v27 = v126;
    v126((unint64_t)v18, v24, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58738);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = v121;
    v27(v28 + v119, v18, v7);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v35 = OUTLINED_FUNCTION_29();
      sub_225643F38(v35, v36, v37, v26);
      uint64_t v26 = v38;
    }
    uint64_t v29 = v26;
    unint64_t v30 = v26[2];
    uint64_t v31 = v29;
    unint64_t v32 = v29[3];
    if (v30 >= v32 >> 1)
    {
      char v39 = OUTLINED_FUNCTION_28_0(v32);
      sub_225643F38(v39, v30 + 1, 1, v40);
      uint64_t v31 = v41;
    }
    v31[2] = v30 + 1;
    uint64_t v33 = &v31[v30];
    uint64_t v26 = v31;
    v33[4] = v28;
    uint64_t v34 = *v124;
    OUTLINED_FUNCTION_11_0();
    v34();
    v24 += v125;
    --v20;
  }
  while (v20);
  unint64_t v123 = v34;
  swift_bridgeObjectRelease();
  uint64_t v128 = v120;
  swift_bridgeObjectRetain();
  sub_22563A2B0(0, 1);
  uint64_t v42 = v128;
  uint64_t v43 = *(void *)(v128 + 16);
  if (!v43)
  {
LABEL_59:
    swift_bridgeObjectRelease();
LABEL_62:
    OUTLINED_FUNCTION_52();
    return;
  }
  uint64_t v100 = v128 + 32;
  uint64_t v109 = v115 + 16;
  uint64_t v108 = v115 + 8;
  v117 += 32;
  long long v105 = xmmword_22565A080;
  OUTLINED_FUNCTION_20_0();
  uint64_t v45 = v123;
  uint64_t v99 = v42;
  uint64_t v98 = v43;
  while (1)
  {
    if (v44 >= *(void *)(v42 + 16)) {
      goto LABEL_65;
    }
    uint64_t v104 = v26[2];
    unint64_t v101 = v44;
    if (v104) {
      break;
    }
    swift_bridgeObjectRelease();
    uint64_t v26 = (void *)MEMORY[0x263F8EE78];
LABEL_57:
    if (!v26[2])
    {
LABEL_61:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_62;
    }
    unint64_t v44 = v101 + 1;
    if (v101 + 1 == v43) {
      goto LABEL_59;
    }
  }
  uint64_t v46 = *(void *)(v100 + 8 * v44);
  uint64_t v103 = v26 + 4;
  uint64_t v120 = v46 + v119;
  swift_bridgeObjectRetain();
  unint64_t v47 = 0;
  uint64_t v48 = (void *)MEMORY[0x263F8EE78];
  uint64_t v116 = v46;
  uint64_t v102 = v26;
  while (1)
  {
    if (v47 >= v26[2]) {
      goto LABEL_64;
    }
    uint64_t v49 = v103[v47];
    if (!*(void *)(v49 + 16)) {
      goto LABEL_54;
    }
    unint64_t v106 = v47;
    OUTLINED_FUNCTION_5_2();
    v50();
    *(void *)&long long v121 = *(void *)(v46 + 16);
    if ((void)v121) {
      break;
    }
LABEL_53:
    OUTLINED_FUNCTION_11_0();
    v45();
    unint64_t v47 = v106;
LABEL_54:
    if (++v47 == v104)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v26 = v48;
      uint64_t v42 = v99;
      uint64_t v43 = v98;
      goto LABEL_57;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v118 = v49;
  swift_bridgeObjectRetain();
  unint64_t v51 = 0;
  while (1)
  {
    if (v51 >= *(void *)(v46 + 16))
    {
      __break(1u);
      goto LABEL_61;
    }
    OUTLINED_FUNCTION_5_2();
    v52();
    uint64_t v53 = sub_225657EE0();
    int v54 = sub_225658000();
    if (v54 == sub_225658030()) {
      goto LABEL_20;
    }
    unsigned int v62 = sub_225658000();
    if (sub_225658030() >= v62) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_34:
    uint64_t v45 = v123;
LABEL_35:
    ++v51;
    OUTLINED_FUNCTION_11_0();
    v45();
    if (v51 == (void)v121)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v26 = v102;
      goto LABEL_53;
    }
  }
  unint64_t v63 = v20;
  int v64 = sub_225658000();
  unint64_t v65 = *(void *)(v53 + 16);
  if (v65 == v64)
  {
    swift_bridgeObjectRelease();
    unint64_t v20 = v63;
    goto LABEL_34;
  }
  unsigned int v66 = sub_225658000();
  OUTLINED_FUNCTION_5_2();
  v67();
  if (v65 < v66)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_0();
    v68();
    goto LABEL_47;
  }
  unsigned int v69 = sub_225658030();
  OUTLINED_FUNCTION_11_0();
  v70();
  if (v65 <= v69)
  {
    swift_bridgeObjectRelease();
LABEL_47:
    LODWORD(v114) = sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    uint64_t v78 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v79 = swift_allocObject();
    *(_OWORD *)(v79 + 16) = v105;
    id v80 = v78;
    uint64_t v81 = sub_225657EC0();
    uint64_t v83 = v82;
    *(void *)(v79 + 56) = MEMORY[0x263F8D310];
    *(void *)(v79 + 64) = sub_225626388();
    *(void *)(v79 + 32) = v81;
    *(void *)(v79 + 40) = v83;
    unint64_t v84 = v107;
    int v85 = sub_225658000();
    uint64_t v86 = MEMORY[0x263F8E8F8];
    *(void *)(v79 + 96) = MEMORY[0x263F8E8F8];
    uint64_t v87 = MEMORY[0x263F8E960];
    *(void *)(v79 + 104) = MEMORY[0x263F8E960];
    *(_DWORD *)(v79 + 72) = v85;
    int v88 = sub_225658030();
    *(void *)(v79 + 136) = v86;
    *(void *)(v79 + 144) = v87;
    *(_DWORD *)(v79 + 112) = v88;
    sub_225658DA0();

    unint64_t v20 = v84;
    swift_bridgeObjectRelease();
LABEL_50:
    uint64_t v45 = v123;
    uint64_t v46 = v116;
    goto LABEL_35;
  }
  unint64_t v20 = v107;
  unsigned int v71 = sub_225658000();
  if (v71 >= sub_225658030())
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    OUTLINED_FUNCTION_5_2();
    v55();
    uint64_t v56 = v118;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_29();
      sub_225644078();
      uint64_t v56 = v89;
    }
    unint64_t v58 = *(void *)(v56 + 16);
    unint64_t v57 = *(void *)(v56 + 24);
    if (v58 >= v57 >> 1)
    {
      OUTLINED_FUNCTION_28_0(v57);
      sub_225644078();
      uint64_t v56 = v90;
    }
    *(void *)(v56 + 16) = v58 + 1;
    OUTLINED_FUNCTION_58();
    v59();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v91 = OUTLINED_FUNCTION_29();
      sub_225643F38(v91, v92, v93, v48);
      uint64_t v48 = v94;
    }
    unint64_t v61 = v48[2];
    unint64_t v60 = v48[3];
    if (v61 >= v60 >> 1)
    {
      char v95 = OUTLINED_FUNCTION_28_0(v60);
      sub_225643F38(v95, v61 + 1, 1, v48);
      uint64_t v48 = v96;
    }
    v48[2] = v61 + 1;
    v48[v61 + 4] = v56;
    goto LABEL_34;
  }
  unint64_t v20 = v71;
  OUTLINED_FUNCTION_15_1();
  uint64_t v114 = v53 + v72;
  while (v20 < *(void *)(v53 + 16))
  {
    uint64_t v73 = v115;
    uint64_t v74 = v112;
    uint64_t v75 = v113;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v115 + 16))(v112, v114 + *(void *)(v115 + 72) * v20, v113);
    char v76 = sub_225657CA0();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v75);
    if (v76)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20_0();
      goto LABEL_50;
    }
    ++v20;
    unsigned int v77 = sub_225658030();
    uint64_t v46 = v116;
    if (v20 >= v77)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20_0();
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
}

uint64_t sub_22563A2B0(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = result;
  uint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      uint64_t v11 = v5 + v8;
    }
    else {
      uint64_t v11 = v5;
    }
    sub_225643F38(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    uint64_t v4 = v12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581E8);
  unint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v13 = v4[2];
  uint64_t v14 = v13 - a2;
  if (__OFSUB__(v13, a2)) {
    goto LABEL_27;
  }
  unint64_t v15 = (char *)&v4[a2 + 4];
  if (v6 != a2 || &v15[8 * v14] <= (char *)&v4[v6 + 4])
  {
    unint64_t result = (uint64_t)memmove(&v4[v6 + 4], v15, 8 * v14);
    uint64_t v13 = v4[2];
  }
  BOOL v17 = __OFADD__(v13, v8);
  uint64_t v18 = v13 - v7;
  if (!v17)
  {
    v4[2] = v18;
LABEL_21:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_22563A3CC(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v7 = a1 - a2;
  if (__OFSUB__(0, v6))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v8 = v5 - v6;
  if (__OFADD__(v5, v7))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v8 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v8) {
      uint64_t v10 = v5 + v7;
    }
    else {
      uint64_t v10 = v5;
    }
    sub_2256443F4(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    uint64_t v4 = v11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  swift_arrayDestroy();
  if (!v6) {
    goto LABEL_16;
  }
  if (__OFSUB__(*(void *)(v4 + 16), a2)) {
    goto LABEL_22;
  }
  sub_225643E5C();
  uint64_t v12 = *(void *)(v4 + 16);
  BOOL v13 = __OFADD__(v12, v7);
  uint64_t v14 = v12 - v6;
  if (!v13)
  {
    *(void *)(v4 + 16) = v14;
LABEL_16:
    *uint64_t v2 = v4;
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_22563A52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s11SpanForNodeVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2256580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwxx(uint64_t a1)
{
  uint64_t v2 = sub_2256580F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_22563A670()
{
  uint64_t v1 = sub_225658810();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v80 = v1;
  uint64_t v81 = v2;
  MEMORY[0x270FA5388](v1);
  char v91 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225657E20();
  uint64_t v86 = *(void *)(v4 - 8);
  uint64_t v87 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v82 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v85 = (char *)&v76 - v7;
  uint64_t v8 = sub_225658740();
  uint64_t v93 = *(void *)(v8 - 8);
  uint64_t v94 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  unint64_t v84 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v83 = (char *)&v76 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v89 = (char *)&v76 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v76 - v15;
  uint64_t v17 = sub_225657F50();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v92 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v76 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v76 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v90 = (char *)&v76 - v28;
  MEMORY[0x270FA5388](v27);
  unint64_t v30 = (char *)&v76 - v29;
  char v31 = sub_225657F10();
  unint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v95 = v0;
  v32(v30, v0, v17);
  uint64_t v96 = v18;
  if ((v31 & 1) == 0)
  {
    char v39 = *(void (**)(char *, uint64_t))(v18 + 8);
    v39(v30, v17);
    LODWORD(v94) = 0;
    uint64_t v41 = v95;
    char v40 = v91;
    uint64_t v42 = v92;
    uint64_t v38 = v17;
    goto LABEL_17;
  }
  unsigned int v77 = v26;
  uint64_t v78 = v23;
  sub_225657F40();
  char v33 = sub_2256586D0();
  uint64_t v34 = v94;
  uint64_t v36 = v93 + 8;
  char v35 = *(void (**)(char *, uint64_t))(v93 + 8);
  v35(v16, v94);
  int v88 = v32;
  v32(v90, (uint64_t)v30, v17);
  uint64_t v37 = v36;
  uint64_t v79 = v18 + 16;
  uint64_t v38 = v17;
  char v76 = v35;
  if (v33)
  {
    char v39 = *(void (**)(char *, uint64_t))(v96 + 8);
    v39(v90, v17);
    v39(v30, v17);
    char v40 = v91;
  }
  else
  {
    unint64_t v44 = v89;
    uint64_t v43 = v90;
    sub_225657F40();
    char v45 = sub_2256586E0();
    v35(v44, v34);
    char v39 = *(void (**)(char *, uint64_t))(v96 + 8);
    v39(v43, v38);
    v39(v30, v38);
    char v40 = v91;
    if ((v45 & 1) == 0)
    {
      LODWORD(v94) = 0;
      uint64_t v41 = v95;
      uint64_t v42 = v92;
      unint64_t v32 = v88;
      goto LABEL_17;
    }
  }
  uint64_t v46 = v83;
  uint64_t v47 = v95;
  sub_225657F40();
  char v48 = sub_2256586D0();
  uint64_t v49 = v76;
  v76(v46, v34);
  uint64_t v50 = v77;
  v88(v77, v47, v38);
  unint64_t v51 = v89;
  if (v48)
  {
    sub_225657F40();
    LODWORD(v91) = sub_2256586B0();
    v49(v51, v34);
  }
  else
  {
    LODWORD(v91) = 0;
  }
  uint64_t v52 = v84;
  uint64_t v53 = v49;
  v39(v50, v38);
  uint64_t v41 = v95;
  int v54 = v52;
  sub_225657F40();
  LOBYTE(v52) = sub_2256586E0();
  uint64_t v93 = v37;
  v53(v54, v94);
  uint64_t v55 = v78;
  unint64_t v32 = v88;
  v88(v78, v41, v38);
  if ((v52 & 1) == 0)
  {
    v39(v55, v38);
    if ((v91 & 1) == 0)
    {
      LODWORD(v94) = 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t v56 = v53;
  unint64_t v57 = v55;
  unint64_t v58 = v89;
  sub_225657F40();
  int v59 = sub_2256586C0();
  unint64_t v32 = v88;
  v56(v58, v94);
  v39(v57, v38);
  if (v91)
  {
LABEL_13:
    LODWORD(v94) = 1;
    goto LABEL_16;
  }
  LODWORD(v94) = v59;
LABEL_16:
  uint64_t v42 = v92;
LABEL_17:
  char v60 = sub_225657F30();
  v32(v42, v41, v38);
  if (v60)
  {
    unint64_t v61 = v85;
    sub_225657F20();
    uint64_t v62 = sub_225657E10();
    uint64_t v63 = v87;
    int v64 = *(void (**)(char *, uint64_t))(v86 + 8);
    v64(v61, v87);
    uint64_t v65 = *(void *)(v62 + 16);
    swift_bridgeObjectRelease();
    v39(v42, v38);
    if (v65)
    {
      unsigned int v66 = v82;
      sub_225657F20();
      uint64_t v67 = sub_225657E10();
      v64(v66, v63);
      uint64_t v68 = *(void *)(v67 + 16);
      if (v68)
      {
        unsigned int v69 = *(void (**)(char *, unint64_t, uint64_t))(v81 + 16);
        unint64_t v70 = v67 + ((*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80));
        unsigned int v71 = (void (**)(char *, uint64_t))(v81 + 8);
        uint64_t v72 = *(void *)(v81 + 72);
        swift_bridgeObjectRetain();
        uint64_t v73 = v80;
        while (1)
        {
          v69(v40, v70, v73);
          char v74 = sub_225658780();
          (*v71)(v40, v73);
          if (v74) {
            break;
          }
          v70 += v72;
          if (!--v68)
          {
            swift_bridgeObjectRelease_n();
            return (v94 & 1) != 0;
          }
        }
        swift_bridgeObjectRelease_n();
        return 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v39(v42, v38);
  }
  return (v94 & 1) != 0;
}

uint64_t sub_22563AE74(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v80[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_2256580F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v84 = &v80[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_25();
  uint64_t v87 = v10;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_25();
  unint64_t v88 = v12;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_25();
  unint64_t v90 = v14;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_25();
  uint64_t v86 = v16;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_25();
  uint64_t v83 = v18;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_25();
  uint64_t v89 = v20;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_25();
  uint64_t v85 = v22;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_25();
  uint64_t v92 = v24;
  OUTLINED_FUNCTION_6_1();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  MEMORY[0x270FA5388](v27);
  uint64_t v91 = v1;
  char v28 = sub_2256580D0();
  uint64_t v29 = *(void (**)(void))(v7 + 16);
  uint64_t v93 = a1;
  uint64_t v94 = v29;
  uint64_t v30 = v6;
  OUTLINED_FUNCTION_2_3();
  v31();
  uint64_t v82 = v5;
  if (v28) {
    char v32 = sub_2256580D0() ^ 1;
  }
  else {
    char v32 = 1;
  }
  char v33 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_0_4();
  v33();
  uint64_t v35 = v93;
  uint64_t v34 = v94;
  OUTLINED_FUNCTION_1_4();
  v34();
  if (v32)
  {
    OUTLINED_FUNCTION_0_4();
    v33();
    OUTLINED_FUNCTION_1_4();
    v34();
LABEL_11:
    OUTLINED_FUNCTION_0_4();
    v33();
    uint64_t v38 = v92;
    ((void (*)(uint64_t, uint64_t, uint64_t))v34)(v92, v35, v30);
    goto LABEL_12;
  }
  char v36 = sub_225658070();
  OUTLINED_FUNCTION_0_4();
  v33();
  OUTLINED_FUNCTION_1_4();
  v34();
  if ((v36 & 1) == 0) {
    goto LABEL_11;
  }
  char v37 = sub_225658050();
  OUTLINED_FUNCTION_0_4();
  v33();
  uint64_t v38 = v92;
  OUTLINED_FUNCTION_1_4();
  v34();
  if ((v37 & 1) == 0)
  {
LABEL_12:
    ((void (*)(uint64_t, uint64_t))v33)(v38, v30);
    return 0;
  }
  uint64_t v39 = *(void *)(sub_225657FF0() + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
  v33();
  if (!v39) {
    return 0;
  }
  char v40 = sub_225658070();
  OUTLINED_FUNCTION_2_3();
  v34();
  OUTLINED_FUNCTION_1_4();
  v34();
  if (v40)
  {
    int v41 = sub_225658030();
    BOOL v81 = v41 != sub_225658030();
  }
  else
  {
    BOOL v81 = 0;
  }
  uint64_t v44 = v83;
  OUTLINED_FUNCTION_0_4();
  v33();
  OUTLINED_FUNCTION_0_4();
  v33();
  char v45 = sub_225658050();
  uint64_t v46 = v94;
  OUTLINED_FUNCTION_2_3();
  v46();
  OUTLINED_FUNCTION_1_4();
  v46();
  if (v45)
  {
    int v47 = sub_225658000();
    LODWORD(v89) = v47 != sub_225658000();
  }
  else
  {
    LODWORD(v89) = 0;
  }
  OUTLINED_FUNCTION_0_4();
  v33();
  uint64_t v92 = v7 + 8;
  ((void (*)(uint64_t, uint64_t))v33)(v44, v30);
  char v48 = sub_2256580C0();
  uint64_t v49 = v94;
  OUTLINED_FUNCTION_2_3();
  v49();
  OUTLINED_FUNCTION_1_4();
  v49();
  if (v48)
  {
    uint64_t v97 = sub_225658080();
    uint64_t v98 = v50;
    uint64_t v95 = sub_225658080();
    uint64_t v96 = v51;
    uint64_t v52 = sub_225657C50();
    uint64_t v53 = (uint64_t)v82;
    __swift_storeEnumTagSinglePayload((uint64_t)v82, 1, 1, v52);
    sub_22562633C();
    uint64_t v54 = sub_225659000();
    sub_225635DC0(v53);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    LODWORD(v86) = v54 != 0;
  }
  else
  {
    LODWORD(v86) = 0;
  }
  OUTLINED_FUNCTION_0_4();
  v33();
  OUTLINED_FUNCTION_0_4();
  v33();
  char v55 = sub_225658060();
  uint64_t v56 = v94;
  OUTLINED_FUNCTION_2_3();
  v56();
  OUTLINED_FUNCTION_1_4();
  v56();
  if (v55)
  {
    uint64_t v57 = sub_225658020();
    uint64_t v59 = v58;
    if (v57 == sub_225658020() && v59 == v60)
    {
      swift_bridgeObjectRelease_n();
      int v63 = 0;
    }
    else
    {
      int v62 = sub_2256591A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v63 = v62 ^ 1;
    }
  }
  else
  {
    int v63 = 0;
  }
  OUTLINED_FUNCTION_0_4();
  v33();
  OUTLINED_FUNCTION_0_4();
  v33();
  uint64_t v64 = sub_225657FF0();
  uint64_t v94 = *(void (**)(void))(v64 + 16);
  if (v94)
  {
    LODWORD(v92) = v63;
    uint64_t v65 = 0;
    uint64_t v66 = *(void *)(sub_225657FE0() - 8);
    uint64_t v68 = *(void *)(v66 + 72);
    unint64_t v90 = (*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
    unint64_t v67 = v90;
    unint64_t v88 = v64 + v90;
    while (1)
    {
      uint64_t v69 = sub_225657FF0();
      uint64_t v70 = *(void *)(v69 + 16);
      if (!v70) {
        break;
      }
      uint64_t v65 = (void (*)(void))((char *)v65 + 1);
      unint64_t v71 = v69 + v67;
      sub_22563B6CC();
      swift_bridgeObjectRetain();
      while ((sub_225658DE0() & 1) == 0)
      {
        v71 += v68;
        if (!--v70)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_39;
        }
      }
      swift_bridgeObjectRelease_n();
      unint64_t v67 = v90;
      if (v65 == v94)
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = 1;
        goto LABEL_40;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_39:
    uint64_t v42 = 0;
LABEL_40:
    int v63 = v92;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = 1;
  }
  uint64_t v72 = sub_2256580A0();
  uint64_t v74 = v73;
  if (v72 == sub_2256580A0() && v74 == v75)
  {
    swift_bridgeObjectRelease_n();
    int v78 = v81 | v89;
    int v79 = v86;
  }
  else
  {
    int v77 = sub_2256591A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v78 = v81 | ~v77;
    int v79 = v89 | v86;
  }
  if ((v78 | v79 | v63)) {
    return 0;
  }
  return v42;
}

unint64_t sub_22563B6CC()
{
  unint64_t result = qword_268102860;
  if (!qword_268102860)
  {
    sub_225657FE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102860);
  }
  return result;
}

uint64_t Siri_Nlu_Internal_ComponentOverride.serializedOverrideValue.getter()
{
  sub_225658920();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  sub_2256589C0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8();
  sub_2256589B0();
  uint64_t v5 = OUTLINED_FUNCTION_1();
  v6(v5);
  if (v0)
  {
    sub_225658960();
    uint64_t v7 = OUTLINED_FUNCTION_3();
    v8(v7);
    if (v2)
    {
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      uint64_t v9 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_225659D50;
      id v11 = v9;
      uint64_t v12 = sub_225658970();
      uint64_t v14 = v13;
      *(void *)(v10 + 56) = MEMORY[0x263F8D310];
      *(void *)(v10 + 64) = sub_225626388();
      *(void *)(v10 + 32) = v12;
      *(void *)(v10 + 40) = v14;
      OUTLINED_FUNCTION_7();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v15 = OUTLINED_FUNCTION_10();
    v16(v15);
  }
  if (sub_225658960())
  {
    sub_225658940();
  }
  else
  {
    sub_225658990();
    uint64_t v17 = sub_22563BC78(&qword_26AD581E0, MEMORY[0x263F71718]);
    OUTLINED_FUNCTION_6(v17);
    if (v1) {
      uint64_t v18 = OUTLINED_FUNCTION_5_0();
    }
    else {
      uint64_t v18 = OUTLINED_FUNCTION_2();
    }
    v19(v18);
  }
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_22563B96C()
{
  return Siri_Nlu_Internal_ComponentOverride.serializedOverrideValue.getter();
}

uint64_t Siri_Nlu_Internal_ParseOverride.namespace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F716E0];
  uint64_t v3 = sub_2256588B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t Siri_Nlu_Internal_ParseOverride.serializedOverrideValue.getter()
{
  sub_225657EB0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  sub_2256583E0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8();
  sub_225658380();
  uint64_t v5 = OUTLINED_FUNCTION_1();
  v6(v5);
  if (v0)
  {
    sub_225658370();
    uint64_t v7 = OUTLINED_FUNCTION_3();
    v8(v7);
    if (v2)
    {
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      uint64_t v9 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_225659D50;
      id v11 = v9;
      uint64_t v12 = sub_2256583A0();
      uint64_t v14 = v13;
      *(void *)(v10 + 56) = MEMORY[0x263F8D310];
      *(void *)(v10 + 64) = sub_225626388();
      *(void *)(v10 + 32) = v12;
      *(void *)(v10 + 40) = v14;
      OUTLINED_FUNCTION_7();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v15 = OUTLINED_FUNCTION_10();
    v16(v15);
  }
  if (sub_225658370())
  {
    sub_225658360();
  }
  else
  {
    sub_2256583C0();
    uint64_t v17 = sub_22563BC78((unint64_t *)&qword_26AD581D8, MEMORY[0x263F714D8]);
    OUTLINED_FUNCTION_6(v17);
    if (v1) {
      uint64_t v18 = OUTLINED_FUNCTION_5_0();
    }
    else {
      uint64_t v18 = OUTLINED_FUNCTION_2();
    }
    v19(v18);
  }
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_22563BC40@<X0>(uint64_t a1@<X8>)
{
  return Siri_Nlu_Internal_ParseOverride.namespace.getter(a1);
}

uint64_t sub_22563BC5C()
{
  return Siri_Nlu_Internal_ParseOverride.serializedOverrideValue.getter();
}

uint64_t sub_22563BC78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.enabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.namespace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.creationTimestampMsSinceUnixEpoch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.serializedOverrideValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.nluRequestRules.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_22563BD4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22563BF70();
  *a1 = result;
  return result;
}

uint64_t sub_22563BD74@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22563C1A8(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_22563BDA4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22563BF88(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_22563BDD4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22563C190(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_22563BE04(void *a1, uint64_t *a2)
{
  return sub_22563C130(a1, *a2);
}

uint64_t sub_22563BE0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22563C1B0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_22563BE40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22563C1D4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_22563BE74(uint64_t *a1)
{
  return sub_22563BF90(*a1);
}

uint64_t sub_22563BE7C(uint64_t *a1)
{
  return sub_22563BF78(*a1);
}

uint64_t sub_22563BE84(uint64_t *a1)
{
  return sub_22563C174(*a1);
}

uint64_t sub_22563BE8C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22563C1EC(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_22563BEBC(uint64_t *a1)
{
  return sub_22563C15C(*a1, *v1);
}

BOOL sub_22563BEC8(uint64_t *a1)
{
  return sub_22563C1F4(*a1, *v1);
}

BOOL sub_22563BED4(uint64_t *a1)
{
  return sub_22563C168(*a1, *v1);
}

BOOL sub_22563BEE0()
{
  return sub_22563C184(*v0);
}

uint64_t sub_22563BEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_22563BF00(uint64_t *a1)
{
  return sub_22563C198(*a1);
}

void *sub_22563BF08@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_22563BF18(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_22563BF24@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_22563BF30(uint64_t *a1, uint64_t *a2)
{
  return sub_22563BF64(*a1, *a2);
}

uint64_t sub_22563BF3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22563C200(a1);
  *a2 = result;
  return result;
}

BOOL sub_22563BF64(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_22563BF70()
{
  return 0;
}

uint64_t sub_22563BF78(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_22563BF88(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_22563BF90(uint64_t result)
{
  *v1 |= result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for Options(uint64_t a1)
{
}

void sub_22563BFC8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22563C010()
{
  return sub_22563BC78(&qword_2681026B0, type metadata accessor for Options);
}

uint64_t sub_22563C058()
{
  return sub_22563BC78(&qword_2681026B8, type metadata accessor for Options);
}

uint64_t sub_22563C0A0()
{
  return sub_22563BC78(&qword_2681026C0, type metadata accessor for Options);
}

uint64_t sub_22563C0E8()
{
  return sub_22563BC78(&qword_2681026C8, type metadata accessor for Options);
}

BOOL sub_22563C130(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

BOOL sub_22563C15C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_22563C168(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_22563C174(uint64_t result)
{
  *v1 ^= result;
  return result;
}

BOOL sub_22563C184(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_22563C190(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_22563C198(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

uint64_t sub_22563C1A8(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_22563C1B0(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_22563C1D4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_22563C1EC(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_22563C1F4(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

uint64_t sub_22563C200(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  return MEMORY[0x270F44CA8](0, v1, a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_225658DA0();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

void static SiriNLOverride.overrideValuesNilOrEqual(overrideValues:otherValues:)(uint64_t a1)
{
  if (a1)
  {
    OUTLINED_FUNCTION_5_1();
    if (v4) {
      goto LABEL_26;
    }
    uint64_t v5 = *(void *)(v3 + 16);
    while (1)
    {
      uint64_t v23 = v2;
      unint64_t v24 = v1;
      if (v1 >> 62)
      {
        OUTLINED_FUNCTION_4_0();
        uint64_t v6 = sub_2256590F0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v6 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v5 != v6) {
        break;
      }
      if (v5 < 0)
      {
        __break(1u);
        return;
      }
      if (!v5) {
        return;
      }
      unint64_t v7 = 0;
      unint64_t v27 = v1 & 0xC000000000000001;
      unint64_t v28 = v2 & 0xC000000000000001;
      uint64_t v21 = v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v22 = v2 + 32;
      uint64_t v20 = (char *)(v1 + 32);
      uint64_t v25 = v5 - 1;
      uint64_t v26 = v5;
      while (v5 != v7)
      {
        if (v28)
        {
          uint64_t v8 = MEMORY[0x22A631010](v7, v23);
        }
        else
        {
          uint64_t v8 = *(void *)(v22 + 8 * v7);
          swift_unknownObjectRetain();
        }
        if (v27)
        {
          uint64_t v9 = MEMORY[0x22A631010](v7, v24);
        }
        else
        {
          if (v7 >= *(void *)(v21 + 16)) {
            goto LABEL_25;
          }
          uint64_t v9 = *(void *)&v20[8 * v7];
          swift_unknownObjectRetain();
        }
        id v10 = objc_allocWithZone(MEMORY[0x263F08910]);
        swift_unknownObjectRetain();
        id v11 = objc_msgSend(v10, sel_initRequiringSecureCoding_, 0);
        objc_msgSend(v11, sel_encodeObject_, v8);
        id v12 = objc_msgSend(v11, sel_encodedData);
        uint64_t v13 = sub_225657B40();
        unint64_t v15 = v14;

        unint64_t v1 = (unint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 0);
        objc_msgSend((id)v1, sel_encodeObject_, v9);
        id v16 = objc_msgSend((id)v1, sel_encodedData);
        uint64_t v2 = sub_225657B40();
        unint64_t v18 = v17;

        LOBYTE(v16) = MEMORY[0x22A62FAE0](v13, v15, v2, v18);
        sub_225627258(v2, v18);

        sub_225627258(v13, v15);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();

        if (v16)
        {
          uint64_t v5 = v26;
          if (v25 != v7++) {
            continue;
          }
        }
        return;
      }
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2256590F0();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t static SiriNLOverride.overrideValueNilOrEqual(overrideValue:otherValue:)(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  id v4 = objc_allocWithZone(MEMORY[0x263F08910]);
  swift_unknownObjectRetain();
  id v5 = objc_msgSend(v4, sel_initRequiringSecureCoding_, 0);
  objc_msgSend(v5, sel_encodeObject_, a1);
  id v6 = objc_msgSend(v5, sel_encodedData);
  uint64_t v7 = sub_225657B40();
  unint64_t v9 = v8;

  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 0);
  objc_msgSend(v10, sel_encodeObject_, a2);
  id v11 = objc_msgSend(v10, sel_encodedData);
  uint64_t v12 = sub_225657B40();
  unint64_t v14 = v13;

  LOBYTE(v11) = MEMORY[0x22A62FAE0](v7, v9, v12, v14);
  sub_225627258(v12, v14);

  sub_225627258(v7, v9);
  swift_unknownObjectRelease();

  return v11 & 1;
}

uint64_t static SiriNLOverride.subsetOfOther(subset:other:)(uint64_t a1)
{
  if (!a1)
  {
    char v7 = 1;
    return v7 & 1;
  }
  OUTLINED_FUNCTION_5_1();
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2256590F0();
    swift_bridgeObjectRelease();
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2256590F0();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
LABEL_12:
    char v7 = 1;
    return v7 & 1;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  if (!v5) {
    goto LABEL_12;
  }
LABEL_4:
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_4_0();
    uint64_t v6 = sub_2256590F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6 >= v5)
  {
    swift_bridgeObjectRetain();
    char v7 = sub_22563CA84(v2, v1);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t static SiriNLOverride.sdaNilOrEqual(override:other:)(uint64_t a1)
{
  if (a1)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22563D5E0();
    uint64_t v2 = v1;
    uint64_t v4 = v3;
    swift_getObjectType();
    sub_22563D5E0();
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    sub_225658F80();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    unint64_t v9 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v10 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v10 + 16) = xmmword_225659D50;
    *(void *)(v10 + 56) = MEMORY[0x263F8D310];
    unint64_t v11 = sub_225626388();
    *(void *)(v10 + 64) = v11;
    *(void *)(v10 + 32) = v2;
    *(void *)(v10 + 40) = v4;
    id v12 = v9;
    swift_bridgeObjectRetain();
    sub_225658DA0();

    swift_bridgeObjectRelease();
    sub_225658F80();
    unint64_t v13 = (void *)qword_26AD58298;
    uint64_t v14 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v14 + 16) = xmmword_225659D50;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = v11;
    *(void *)(v14 + 32) = v6;
    *(void *)(v14 + 40) = v8;
    id v15 = v13;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_6_0();

    swift_bridgeObjectRelease();
    if (v2 == v6 && v4 == v8) {
      char v17 = 1;
    }
    else {
      char v17 = sub_2256591A0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    char v17 = 1;
  }
  return v17 & 1;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v30;
  uint64_t v31;

  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102790);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_225658810();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_0();
  id v12 = v11 - v10;
  sub_22563E164(a1, v5);
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_22563E1CC(v5);
    unint64_t v13 = 1;
  }
  else
  {
    char v31 = v8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v5, v6);
    sub_22564D674();
    id v15 = v14;
    char v17 = v16;
    sub_22564D674();
    uint64_t v30 = v18;
    uint64_t v20 = v19;
    sub_225658F80();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    uint64_t v21 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v22 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v22 + 16) = xmmword_225659D50;
    *(void *)(v22 + 56) = MEMORY[0x263F8D310];
    uint64_t v23 = sub_225626388();
    *(void *)(v22 + 64) = v23;
    *(void *)(v22 + 32) = v15;
    *(void *)(v22 + 40) = v17;
    unint64_t v24 = v21;
    swift_bridgeObjectRetain();
    sub_225658DA0();

    swift_bridgeObjectRelease();
    sub_225658F80();
    uint64_t v25 = (void *)qword_26AD58298;
    uint64_t v26 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v26 + 16) = xmmword_225659D50;
    *(void *)(v26 + 56) = MEMORY[0x263F8D310];
    *(void *)(v26 + 64) = v23;
    *(void *)(v26 + 32) = v30;
    *(void *)(v26 + 40) = v20;
    unint64_t v27 = v25;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_6_0();

    swift_bridgeObjectRelease();
    if (v15 == v30 && v17 == v20) {
      unint64_t v13 = 1;
    }
    else {
      unint64_t v13 = sub_2256591A0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v12, v6);
  }
  return v13 & 1;
}

uint64_t sub_22563CA84(unint64_t a1, unint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_32;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_28;
  }
  while (1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = v2 & 0xC000000000000001;
    uint64_t v28 = v2;
    unint64_t v27 = v2 & 0xC000000000000001;
LABEL_4:
    if (v5) {
      MEMORY[0x22A631010](v4, v2);
    }
    else {
      swift_unknownObjectRetain();
    }
    BOOL v6 = __OFADD__(v4, 1);
    uint64_t v7 = v4 + 1;
    if (!v6) {
      break;
    }
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2256590F0();
    if (!v3) {
      goto LABEL_28;
    }
  }
  uint64_t v29 = v7;
  if (!(a2 >> 62))
  {
    uint64_t v8 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (!v8) {
      goto LABEL_29;
    }
    goto LABEL_12;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2256590F0();
  if (v8)
  {
LABEL_12:
    swift_getObjectType();
    uint64_t v9 = 4;
    uint64_t v30 = v8;
    while (1)
    {
      uint64_t v2 = v9 - 4;
      if ((a2 & 0xC000000000000001) != 0) {
        MEMORY[0x22A631010](v9 - 4, a2);
      }
      else {
        swift_unknownObjectRetain();
      }
      if (__OFADD__(v2, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      uint64_t v32 = v9 - 3;
      swift_unknownObjectRetain();
      sub_22563D5E0();
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      swift_getObjectType();
      sub_22563D5E0();
      uint64_t v33 = v14;
      uint64_t v16 = v15;
      sub_225658F80();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      char v17 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_225659D50;
      *(void *)(v18 + 56) = MEMORY[0x263F8D310];
      unint64_t v19 = sub_225626388();
      *(void *)(v18 + 64) = v19;
      *(void *)(v18 + 32) = v11;
      *(void *)(v18 + 40) = v13;
      id v20 = v17;
      swift_bridgeObjectRetain();
      sub_225658DA0();

      swift_bridgeObjectRelease();
      sub_225658F80();
      uint64_t v21 = (void *)qword_26AD58298;
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_225659D50;
      *(void *)(v22 + 56) = MEMORY[0x263F8D310];
      *(void *)(v22 + 64) = v19;
      *(void *)(v22 + 32) = v33;
      *(void *)(v22 + 40) = v16;
      id v23 = v21;
      swift_bridgeObjectRetain();
      sub_225658DA0();

      swift_bridgeObjectRelease();
      if (v11 == v33 && v13 == v16) {
        break;
      }
      char v25 = sub_2256591A0();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v25) {
        goto LABEL_27;
      }
      ++v9;
      if (v32 == v30) {
        goto LABEL_29;
      }
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_27:
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v5 = v27;
    uint64_t v4 = v29;
    uint64_t v2 = v28;
    if (v29 != v3) {
      goto LABEL_4;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_29:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return 0;
}

uint64_t static SiriNLOverride.subsetOfOther(subset:other:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_225658810();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_0();
  id v10 = (id)(v9 - v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102790);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v45 - v15;
  if (!a1) {
    return 1;
  }
  unint64_t v17 = *(void *)(a1 + 16);
  if (!v17) {
    return 1;
  }
  unint64_t v50 = *(void *)(a2 + 16);
  if (v50 >= v17)
  {
    unint64_t v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v48 = a1 + v18;
    uint64_t v60 = *(void *)(v6 + 72);
    uint64_t v47 = a2 + v18;
    uint64_t v45 = a1;
    swift_bridgeObjectRetain();
    uint64_t v19 = 0;
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v20 = v6 + 16;
    uint64_t v57 = (void (**)(id, char *, uint64_t))(v20 + 16);
    uint64_t v58 = v21;
    uint64_t v59 = v20;
    uint64_t v52 = v20 - 8;
    long long v63 = xmmword_225659D50;
    uint64_t v49 = a2;
    id v55 = v10;
    uint64_t v56 = v4;
    uint64_t v53 = v16;
    uint64_t v54 = v14;
    unint64_t v46 = v17;
    do
    {
      uint64_t v61 = v48 + v60 * v19;
      uint64_t v51 = v19 + 1;
      swift_bridgeObjectRetain();
      uint64_t v22 = v47;
      unint64_t v23 = v50;
      while (1)
      {
        v58(v16, v61, v4);
        __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v4);
        sub_22563E164((uint64_t)v16, (uint64_t)v14);
        if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v4) == 1)
        {
          sub_22563E1CC((uint64_t)v14);
          goto LABEL_18;
        }
        unint64_t v62 = v23;
        (*v57)(v10, v14, v4);
        sub_22564D674();
        uint64_t v25 = v24;
        uint64_t v27 = v26;
        sub_22564D674();
        uint64_t v29 = v28;
        uint64_t v31 = v30;
        sub_225658F80();
        if (qword_26AD58250 != -1) {
          swift_once();
        }
        uint64_t v32 = (void *)qword_26AD58298;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
        uint64_t v33 = OUTLINED_FUNCTION_2_0();
        *(_OWORD *)(v33 + 16) = v63;
        *(void *)(v33 + 56) = MEMORY[0x263F8D310];
        unint64_t v34 = sub_225626388();
        *(void *)(v33 + 64) = v34;
        *(void *)(v33 + 32) = v25;
        *(void *)(v33 + 40) = v27;
        id v35 = v32;
        swift_bridgeObjectRetain();
        sub_225658DA0();

        swift_bridgeObjectRelease();
        uint64_t v4 = sub_225658F80();
        char v36 = (void *)qword_26AD58298;
        uint64_t v37 = OUTLINED_FUNCTION_2_0();
        *(_OWORD *)(v37 + 16) = v63;
        *(void *)(v37 + 56) = MEMORY[0x263F8D310];
        *(void *)(v37 + 64) = v34;
        *(void *)(v37 + 32) = v29;
        *(void *)(v37 + 40) = v31;
        id v10 = v36;
        swift_bridgeObjectRetain();
        sub_225658DA0();

        swift_bridgeObjectRelease();
        if (v25 == v29 && v27 == v31) {
          break;
        }
        char v39 = sub_2256591A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v40 = OUTLINED_FUNCTION_1_0();
        v41(v40);
        uint64_t v16 = v53;
        sub_22563E1CC((uint64_t)v53);
        uint64_t v14 = v54;
        if (v39) {
          goto LABEL_19;
        }
        v22 += v60;
        unint64_t v23 = v62 - 1;
        if (v62 == 1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      swift_bridgeObjectRelease_n();
      uint64_t v42 = OUTLINED_FUNCTION_1_0();
      v43(v42);
      uint64_t v16 = v53;
      uint64_t v14 = v54;
LABEL_18:
      sub_22563E1CC((uint64_t)v16);
LABEL_19:
      swift_bridgeObjectRelease();
      uint64_t v19 = v51;
    }
    while (v51 != v46);
    swift_bridgeObjectRelease();
    return 1;
  }
  return 0;
}

void sub_22563D5E0()
{
  self;
  uint64_t v0 = swift_dynamicCastObjCClass();
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    swift_unknownObjectRetain();
    sub_225659050();
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v1, sel_reference);
    sub_22563DF60();

LABEL_40:
    sub_225658E50();
    swift_bridgeObjectRelease();
    sub_225658E50();
    swift_unknownObjectRelease();
    return;
  }
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (!v3)
  {
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();
    if (v16)
    {
      unint64_t v17 = (void *)v16;
      swift_unknownObjectRetain();
      sub_225659050();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(v17, sel_offeredAct);
      swift_getObjectType();
      sub_22563DD50();
      swift_unknownObjectRelease();
      goto LABEL_40;
    }
    self;
    uint64_t v19 = swift_dynamicCastObjCClass();
    if (!v19)
    {
      self;
      uint64_t v33 = swift_dynamicCastObjCClass();
      if (v33)
      {
        unint64_t v34 = (void *)v33;
        swift_unknownObjectRetain();
        id v35 = objc_msgSend(v34, sel_task);
        if (v35)
        {
          char v36 = v35;
          sub_22563DF60();
        }
        sub_225659050();
        swift_bridgeObjectRelease();
      }
      else
      {
        self;
        uint64_t v37 = swift_dynamicCastObjCClass();
        if (!v37)
        {
          swift_unknownObjectRetain();
          sub_225658E10();
          return;
        }
        uint64_t v38 = (void *)v37;
        swift_unknownObjectRetain();
        id v39 = objc_msgSend(v38, sel_task);
        if (v39)
        {
          uint64_t v40 = v39;
          sub_22563DF60();
        }
        sub_225659050();
        swift_bridgeObjectRelease();
        id v41 = objc_msgSend(v38, sel_description);
        sub_225658E00();

        sub_225658E50();
        swift_bridgeObjectRelease();
      }
      goto LABEL_40;
    }
    uint64_t v20 = (void *)v19;
    swift_unknownObjectRetain();
    id v21 = objc_msgSend(v20, sel_entities);
    sub_22563E22C();
    unint64_t v6 = sub_225658F20();

    if (v6 >> 62) {
      goto LABEL_42;
    }
    uint64_t v22 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v22) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
  uint64_t v4 = (void *)v3;
  swift_unknownObjectRetain();
  id v5 = objc_msgSend(v4, sel_choices);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681027A0);
  unint64_t v6 = sub_225658F20();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2256590F0();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_6;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
    sub_225636790();
    sub_225658DD0();
    swift_bridgeObjectRelease();
    sub_225659050();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    goto LABEL_39;
  }
LABEL_6:
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_225626BF8(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0) {
        MEMORY[0x22A631010](v8, v6);
      }
      else {
        swift_unknownObjectRetain();
      }
      swift_getObjectType();
      sub_22563DD50();
      uint64_t v10 = v9;
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      unint64_t v14 = *(void *)(v42 + 16);
      unint64_t v13 = *(void *)(v42 + 24);
      if (v14 >= v13 >> 1) {
        sub_225626BF8(v13 > 1, v14 + 1, 1);
      }
      ++v8;
      *(void *)(v42 + 16) = v14 + 1;
      uint64_t v15 = v42 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
    }
    while (v7 != v8);
    goto LABEL_39;
  }
  __break(1u);
LABEL_42:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_2256590F0();
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_39;
  }
LABEL_20:
  uint64_t v43 = MEMORY[0x263F8EE78];
  sub_225626BF8(0, v22 & ~(v22 >> 63), 0);
  if ((v22 & 0x8000000000000000) == 0)
  {
    uint64_t v23 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v24 = (id)MEMORY[0x22A631010](v23, v6);
      }
      else {
        id v24 = *(id *)(v6 + 8 * v23 + 32);
      }
      uint64_t v25 = v24;
      sub_22563DF60();
      uint64_t v27 = v26;
      uint64_t v29 = v28;

      unint64_t v31 = *(void *)(v43 + 16);
      unint64_t v30 = *(void *)(v43 + 24);
      if (v31 >= v30 >> 1) {
        sub_225626BF8(v30 > 1, v31 + 1, 1);
      }
      ++v23;
      *(void *)(v43 + 16) = v31 + 1;
      uint64_t v32 = v43 + 16 * v31;
      *(void *)(v32 + 32) = v27;
      *(void *)(v32 + 40) = v29;
    }
    while (v22 != v23);
    goto LABEL_39;
  }
  __break(1u);
}

void sub_22563DD50()
{
  unint64_t v0 = sub_225658C20();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
    sub_225636790();
    sub_225658DD0();
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2256590F0();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_225626BF8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x22A631010](v3, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v8 = sub_225658CD0();
      uint64_t v9 = v4;
      sub_225658E50();
      sub_225658CE0();
      sub_225658E50();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v6 = *(void *)(v10 + 16);
      unint64_t v5 = *(void *)(v10 + 24);
      if (v6 >= v5 >> 1) {
        sub_225626BF8(v5 > 1, v6 + 1, 1);
      }
      ++v3;
      *(void *)(v10 + 16) = v6 + 1;
      uint64_t v7 = v10 + 16 * v6;
      *(void *)(v7 + 32) = v8;
      *(void *)(v7 + 40) = v9;
    }
    while (v2 != v3);
    goto LABEL_13;
  }
  __break(1u);
}

void sub_22563DF60()
{
  if (!sub_225658FA0()) {
    return;
  }
  unint64_t v0 = MEMORY[0x22A630BC0]();
  unint64_t v1 = v0;
  if (v0 >> 62)
  {
    uint64_t v2 = sub_2256590F0();
    if (v2) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
    sub_225636790();
    sub_225658DD0();
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    goto LABEL_15;
  }
LABEL_4:
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_225626BF8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x22A631010](v3, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v8 = sub_225658CD0();
      uint64_t v9 = v4;
      sub_225658E50();
      sub_225658CE0();
      sub_225658E50();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v6 = *(void *)(v10 + 16);
      unint64_t v5 = *(void *)(v10 + 24);
      if (v6 >= v5 >> 1) {
        sub_225626BF8(v5 > 1, v6 + 1, 1);
      }
      ++v3;
      *(void *)(v10 + 16) = v6 + 1;
      uint64_t v7 = v10 + 16 * v6;
      *(void *)(v7 + 32) = v8;
      *(void *)(v7 + 40) = v9;
    }
    while (v2 != v3);
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_22563E164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102790);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22563E1CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102790);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22563E22C()
{
  unint64_t result = qword_268102798;
  if (!qword_268102798)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268102798);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return *(void *)(v0 - 176);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_225658DA0();
}

void sub_22563E308()
{
  off_26AD58180 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

uint64_t sub_22563E31C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58198);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_26AD58168 = result;
  return result;
}

uint64_t sub_22563E354()
{
  return sub_225659260();
}

BOOL sub_22563E3E8()
{
  if ((MEMORY[0x22A62FBC0]() & 1) == 0) {
    return 0;
  }
  type metadata accessor for CacheKey();
  sub_2256588B0();
  sub_22563EC8C(&qword_26AD580D8, MEMORY[0x263F716E8]);
  sub_225658F10();
  sub_225658F10();
  return v2 == v1;
}

uint64_t sub_22563E4B4()
{
  return sub_225659270();
}

uint64_t sub_22563E560()
{
  return sub_225659270();
}

id RegexOverrideCache.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id RegexOverrideCache.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RegexOverrideCache();
  return objc_msgSendSuper2(&v2, sel_init);
}

id RegexOverrideCache.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RegexOverrideCache();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22563E6C8()
{
  return sub_22563698C(*(void *)(v0 + 16));
}

uint64_t sub_22563E6E4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void *sub_22563E70C(uint64_t a1, void *(*a2)(uint64_t *__return_ptr))
{
  return sub_2256336D0(a1, a2);
}

uint64_t *sub_22563E724(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_225657C50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2256588B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_22563E82C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_225657C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2256588B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_22563E8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_225657C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2256588B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_22563E99C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_225657C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2256588B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_22563EA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22563EA68);
}

uint64_t sub_22563EA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_225657C50();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_2256588B0();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_22563EAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22563EAF8);
}

uint64_t sub_22563EAF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_225657C50();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_2256588B0();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_22563EB7C()
{
  uint64_t result = sub_225657C50();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2256588B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_22563EC44()
{
  return sub_22563EC8C(&qword_26AD58130, (void (*)(uint64_t))type metadata accessor for CacheKey);
}

uint64_t sub_22563EC8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_225657C50();
}

uint64_t *_s11SpanForNodeVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_2256580F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t _s11SpanForNodeVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2256580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2256580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2256580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22563EF88);
}

uint64_t sub_22563EF88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2256580F0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t _s11SpanForNodeVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22563EFE4);
}

uint64_t sub_22563EFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2256580F0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_22563F030(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

void sub_22563F040()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  uint64_t v132 = sub_225658910();
  OUTLINED_FUNCTION_0();
  uint64_t v131 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_26();
  uint64_t v146 = v5;
  uint64_t v134 = sub_225658A90();
  OUTLINED_FUNCTION_0();
  uint64_t v145 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_26();
  uint64_t v133 = v9;
  uint64_t v137 = sub_225658850();
  OUTLINED_FUNCTION_0();
  uint64_t v136 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_26();
  uint64_t v135 = v13;
  uint64_t v140 = sub_225658A00();
  OUTLINED_FUNCTION_0();
  uint64_t v139 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_26();
  uint64_t v138 = v17;
  uint64_t v143 = sub_225658160();
  OUTLINED_FUNCTION_0();
  uint64_t v142 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v130 - v21;
  sub_225657FD0();
  OUTLINED_FUNCTION_0();
  uint64_t v148 = v24;
  uint64_t v149 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_26();
  uint64_t v147 = v26;
  sub_225657F90();
  OUTLINED_FUNCTION_0();
  uint64_t v152 = v28;
  uint64_t v153 = v27;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_26();
  uint64_t v151 = v30;
  OUTLINED_FUNCTION_34();
  sub_225657DD0();
  OUTLINED_FUNCTION_0();
  uint64_t v159 = v31;
  uint64_t v160 = v32;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_2_2();
  uint64_t v158 = v33;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_26();
  uint64_t v157 = v35;
  uint64_t v156 = sub_225658660();
  OUTLINED_FUNCTION_0();
  uint64_t v161 = v36;
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)v130 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  id v41 = (void (*)(void))sub_2256582F0();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v42;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_25();
  uint64_t v144 = v47;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_25();
  uint64_t v150 = v49;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_25();
  uint64_t v154 = v51;
  OUTLINED_FUNCTION_6_1();
  uint64_t v53 = MEMORY[0x270FA5388](v52);
  id v55 = (char *)v130 - v54;
  uint64_t v56 = MEMORY[0x270FA5388](v53);
  uint64_t v58 = (char *)v130 - v57;
  MEMORY[0x270FA5388](v56);
  uint64_t v60 = (char *)v130 - v59;
  char v61 = sub_225658170();
  unint64_t v163 = *(void (**)(char *, uint64_t, void (*)(void)))(v43 + 16);
  uint64_t v164 = v43 + 16;
  v163(v60, v1, v41);
  uint64_t v155 = v22;
  if ((v61 & 1) == 0)
  {
    uint64_t v62 = v1;
    uint64_t v68 = OUTLINED_FUNCTION_43();
    v69(v68);
LABEL_5:
    char v70 = sub_225658180();
    OUTLINED_FUNCTION_10_0();
    v71();
    uint64_t v72 = v62;
    if (v70)
    {
      uint64_t v73 = v151;
      sub_2256582A0();
      char v74 = sub_225657F60();
      uint64_t v75 = v153;
      uint64_t v161 = *(void *)(v152 + 8);
      ((void (*)(uint64_t, uint64_t))v161)(v73, v153);
      uint64_t v76 = v1;
      OUTLINED_FUNCTION_7_0();
      v77();
      if (v74)
      {
        sub_2256582A0();
        OUTLINED_FUNCTION_63();
        sub_225657F80();
        int v78 = (void (*)(uint64_t, uint64_t))v161;
        ((void (*)(uint64_t, uint64_t))v161)(v73, v75);
        uint64_t v164 = sub_225657DB0();
        uint64_t v79 = v159;
        id v41 = *(void (**)(void))(v160 + 8);
        OUTLINED_FUNCTION_20();
        v41();
        uint64_t v80 = v141;
        sub_2256582A0();
        OUTLINED_FUNCTION_51();
        sub_225657F80();
        v78(v80, v75);
LABEL_34:
        sub_225657D90();
        ((void (*)(uint64_t, uint64_t))v41)(v73, v79);
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v76 = v1;
      v162(v58, v41);
    }
    uint64_t v73 = v72;
    char v81 = sub_225658190();
    v163(v55, v72, v41);
    if (v81)
    {
      sub_2256582C0();
      char v82 = sub_225657FA0();
      uint64_t v83 = *(void (**)(void))(v148 + 8);
      OUTLINED_FUNCTION_40();
      v83();
      OUTLINED_FUNCTION_7_0();
      v84();
      uint64_t v85 = (uint64_t)v155;
      if (v82)
      {
        sub_2256582C0();
        sub_225657FC0();
        OUTLINED_FUNCTION_55();
        v83();
        uint64_t v164 = sub_225657DB0();
        uint64_t v79 = v159;
        id v41 = *(void (**)(void))(v160 + 8);
        OUTLINED_FUNCTION_20();
        v41();
        sub_2256582C0();
        OUTLINED_FUNCTION_51();
        sub_225657FC0();
LABEL_24:
        OUTLINED_FUNCTION_55();
        v83();
        goto LABEL_34;
      }
    }
    else
    {
      OUTLINED_FUNCTION_7_0();
      v86();
      uint64_t v85 = (uint64_t)v155;
    }
    char v87 = sub_2256581C0();
    OUTLINED_FUNCTION_10_0();
    v88();
    if (v87)
    {
      sub_2256582E0();
      char v89 = sub_225658130();
      unint64_t v90 = *(void (**)(void))(v142 + 8);
      uint64_t v79 = v143;
      OUTLINED_FUNCTION_40();
      v90();
      OUTLINED_FUNCTION_7_0();
      v91();
      if (v89)
      {
        OUTLINED_FUNCTION_47();
        sub_2256582E0();
        uint64_t v92 = v157;
        sub_225658150();
        OUTLINED_FUNCTION_44();
        v90();
        uint64_t v93 = sub_225657DB0();
        uint64_t v94 = OUTLINED_FUNCTION_11(v93);
        ((void (*)(uint64_t))v41)(v94);
        OUTLINED_FUNCTION_37();
        sub_2256582E0();
        OUTLINED_FUNCTION_39();
        sub_225658150();
LABEL_33:
        ((void (*)(uint64_t, uint64_t))v90)(v85, v92);
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v95 = OUTLINED_FUNCTION_19();
      v96(v95);
    }
    char v97 = sub_225658270();
    OUTLINED_FUNCTION_10_0();
    v98();
    if (v97)
    {
      uint64_t v85 = v76;
      sub_225658220();
      char v99 = sub_2256589D0();
      unint64_t v90 = *(void (**)(void))(v139 + 8);
      uint64_t v79 = v140;
      OUTLINED_FUNCTION_40();
      v90();
      OUTLINED_FUNCTION_7_0();
      v100();
      if (v99)
      {
        OUTLINED_FUNCTION_47();
        sub_225658220();
        uint64_t v92 = v157;
        sub_2256589F0();
        OUTLINED_FUNCTION_44();
        v90();
        uint64_t v101 = sub_225657DB0();
        uint64_t v102 = OUTLINED_FUNCTION_11(v101);
        ((void (*)(uint64_t))v41)(v102);
        OUTLINED_FUNCTION_37();
        sub_225658220();
        OUTLINED_FUNCTION_39();
        sub_2256589F0();
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v103 = OUTLINED_FUNCTION_19();
      v104(v103);
    }
    char v105 = sub_225658230();
    OUTLINED_FUNCTION_10_0();
    v106();
    if (v105)
    {
      uint64_t v107 = v135;
      sub_2256581B0();
      char v108 = sub_225658820();
      uint64_t v83 = *(void (**)(void))(v136 + 8);
      ((void (*)(uint64_t, uint64_t))v83)(v107, v137);
      OUTLINED_FUNCTION_7_0();
      v109();
      uint64_t v110 = v145;
      uint64_t v111 = v146;
      if (v108)
      {
        OUTLINED_FUNCTION_47();
        sub_2256581B0();
        sub_225658840();
        OUTLINED_FUNCTION_55();
        v83();
        uint64_t v164 = sub_225657DB0();
        uint64_t v79 = v159;
        id v41 = *(void (**)(void))(v160 + 8);
        OUTLINED_FUNCTION_20();
        v41();
        OUTLINED_FUNCTION_63();
        sub_2256581B0();
        OUTLINED_FUNCTION_51();
        sub_225658840();
        goto LABEL_24;
      }
    }
    else
    {
      OUTLINED_FUNCTION_7_0();
      v112();
      uint64_t v110 = v145;
      uint64_t v111 = v146;
    }
    char v113 = sub_225658280();
    OUTLINED_FUNCTION_10_0();
    v114();
    if (v113)
    {
      uint64_t v115 = v133;
      sub_225658250();
      char v116 = sub_225658A60();
      uint64_t v118 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
      uint64_t v79 = v110 + 8;
      uint64_t v117 = v118;
      v118(v115, v134);
      OUTLINED_FUNCTION_7_0();
      v119();
      if (v116)
      {
        OUTLINED_FUNCTION_47();
        sub_225658250();
        sub_225658A80();
        v117(v115, v111);
        uint64_t v120 = sub_225657DB0();
        uint64_t v121 = OUTLINED_FUNCTION_11(v120);
        ((void (*)(uint64_t))v41)(v121);
        OUTLINED_FUNCTION_37();
        sub_225658250();
        OUTLINED_FUNCTION_39();
        sub_225658A80();
        v117(v115, v111);
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v122 = OUTLINED_FUNCTION_19();
      v123(v122);
    }
    char v124 = sub_225658260();
    OUTLINED_FUNCTION_10_0();
    v125();
    if (v124)
    {
      sub_2256581E0();
      char v126 = sub_2256588E0();
      unint64_t v90 = *(void (**)(void))(v131 + 8);
      uint64_t v85 = v132;
      OUTLINED_FUNCTION_40();
      v90();
      OUTLINED_FUNCTION_7_0();
      v127();
      if (v126)
      {
        OUTLINED_FUNCTION_47();
        sub_2256581E0();
        sub_225658900();
        OUTLINED_FUNCTION_44();
        v90();
        uint64_t v164 = sub_225657DB0();
        uint64_t v92 = v85;
        id v41 = *(void (**)(void))(v160 + 8);
        uint64_t v79 = v159;
        OUTLINED_FUNCTION_20();
        v41();
        OUTLINED_FUNCTION_37();
        sub_2256581E0();
        OUTLINED_FUNCTION_39();
        sub_225658900();
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v128 = OUTLINED_FUNCTION_19();
      v129(v128);
    }
    uint64_t v164 = 0;
    goto LABEL_35;
  }
  v130[0] = v40;
  uint64_t v62 = v1;
  sub_225658200();
  char v63 = sub_225658630();
  uint64_t v1 = v161 + 8;
  uint64_t v64 = *(void (**)(void))(v161 + 8);
  v161 += 8;
  OUTLINED_FUNCTION_44();
  v64();
  uint64_t v65 = OUTLINED_FUNCTION_43();
  v66(v65);
  if ((v63 & 1) == 0) {
    goto LABEL_5;
  }
  sub_225658200();
  sub_225658650();
  OUTLINED_FUNCTION_44();
  v64();
  uint64_t v164 = sub_225657DB0();
  unint64_t v67 = *(void (**)(void))(v160 + 8);
  OUTLINED_FUNCTION_28();
  v67();
  sub_225658200();
  sub_225658650();
  OUTLINED_FUNCTION_44();
  v64();
  sub_225657D90();
  OUTLINED_FUNCTION_28();
  v67();
LABEL_35:
  OUTLINED_FUNCTION_52();
}

void sub_22563FD8C()
{
  OUTLINED_FUNCTION_54();
  uint64_t v113 = v0;
  uint64_t v114 = v1;
  uint64_t v111 = v2;
  uint64_t v4 = v3;
  v104[2] = sub_225658910();
  OUTLINED_FUNCTION_0();
  v104[1] = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v7);
  v104[5] = sub_225658A90();
  OUTLINED_FUNCTION_0();
  v104[4] = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5();
  v104[3] = v10;
  v104[8] = sub_225658850();
  OUTLINED_FUNCTION_0();
  v104[7] = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5();
  v104[6] = v13;
  v104[12] = sub_225658A00();
  OUTLINED_FUNCTION_0();
  v104[11] = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_5();
  v104[10] = v16;
  v104[16] = sub_225658160();
  OUTLINED_FUNCTION_0();
  v104[15] = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v19);
  v104[20] = sub_225657FD0();
  OUTLINED_FUNCTION_0();
  v104[19] = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v22);
  sub_225657F90();
  OUTLINED_FUNCTION_0();
  uint64_t v106 = v24;
  uint64_t v107 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_5();
  uint64_t v105 = v25;
  sub_225658660();
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v27;
  uint64_t v110 = v26;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_3_0();
  uint64_t v30 = (void (*)(uint64_t))(v29 - v28);
  uint64_t v31 = sub_2256582F0();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_25();
  v104[21] = v38;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_25();
  uint64_t v108 = v40;
  OUTLINED_FUNCTION_6_1();
  uint64_t v42 = MEMORY[0x270FA5388](v41);
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  uint64_t v45 = (char *)v104 - v44;
  uint64_t v46 = MEMORY[0x270FA5388](v43);
  uint64_t v48 = (char *)v104 - v47;
  MEMORY[0x270FA5388](v46);
  uint64_t v50 = (char *)v104 - v49;
  uint64_t v51 = *(void (**)(void))(v33 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v51)((char *)v104 - v49, v4, v31);
  ((void (*)(char *, char *, uint64_t))v51)(v48, v50, v31);
  uint64_t v52 = sub_225658170();
  uint64_t v112 = v33;
  uint64_t v53 = *(void (**)(void))(v33 + 8);
  uint64_t v115 = v31;
  uint64_t v54 = v53;
  OUTLINED_FUNCTION_28();
  v55();
  if (v52)
  {
    OUTLINED_FUNCTION_63();
    sub_225658200();
    char v56 = sub_225658630();
    OUTLINED_FUNCTION_9_0();
    v57();
    if (v56)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_2256581F0();
      OUTLINED_FUNCTION_8_0();
      sub_225658640();
      OUTLINED_FUNCTION_15_0();
      uint64_t v58 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v58);
      uint64_t v59 = OUTLINED_FUNCTION_4_1();
      v30(v59);
      OUTLINED_FUNCTION_35();
      sub_2256581F0();
      OUTLINED_FUNCTION_16();
      uint64_t v60 = (void (*)(uint64_t))sub_225658640();
      sub_225657DA0();
      uint64_t v61 = OUTLINED_FUNCTION_3_2();
      v60(v61);
      uint64_t v62 = OUTLINED_FUNCTION_4_1();
      v30(v62);
      uint64_t v63 = v114;
      uint64_t v64 = v115;
LABEL_26:
      OUTLINED_FUNCTION_58();
      v101();
      uint64_t v102 = 0;
      goto LABEL_27;
    }
  }
  uint64_t v65 = v115;
  ((void (*)(char *, char *, uint64_t))v51)(v45, v50, v115);
  char v66 = sub_225658180();
  uint64_t v64 = v65;
  OUTLINED_FUNCTION_28();
  v54();
  if (v66)
  {
    uint64_t v67 = v105;
    OUTLINED_FUNCTION_63();
    sub_2256582A0();
    char v68 = sub_225657F60();
    OUTLINED_FUNCTION_9_0();
    v69();
    if (v68)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_225658290();
      OUTLINED_FUNCTION_8_0();
      sub_225657F70();
      OUTLINED_FUNCTION_15_0();
      uint64_t v70 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v70);
      uint64_t v71 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v71);
      OUTLINED_FUNCTION_35();
      sub_225658290();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_225657F70();
LABEL_25:
      uint64_t v98 = (void (*)(uint64_t))v72;
      sub_225657DA0();
      uint64_t v99 = OUTLINED_FUNCTION_3_2();
      v98(v99);
      uint64_t v100 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v100);
      uint64_t v63 = v114;
      goto LABEL_26;
    }
  }
  OUTLINED_FUNCTION_13();
  v51();
  char v73 = sub_225658190();
  OUTLINED_FUNCTION_23();
  v54();
  if (v73)
  {
    uint64_t v67 = v104[18];
    sub_2256582C0();
    char v74 = sub_225657FA0();
    OUTLINED_FUNCTION_9_0();
    v75();
    if (v74)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_2256582B0();
      OUTLINED_FUNCTION_8_0();
      sub_225657FB0();
      OUTLINED_FUNCTION_15_0();
      uint64_t v76 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v76);
      uint64_t v77 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v77);
      OUTLINED_FUNCTION_35();
      sub_2256582B0();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_225657FB0();
      goto LABEL_25;
    }
  }
  LOBYTE(v67) = v108;
  OUTLINED_FUNCTION_13();
  v51();
  char v78 = sub_2256581C0();
  OUTLINED_FUNCTION_23();
  v54();
  if (v78)
  {
    OUTLINED_FUNCTION_33();
    sub_2256582E0();
    uint64_t v67 = sub_225658130();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_9_0();
    v79();
    if (v67)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_2256582D0();
      OUTLINED_FUNCTION_8_0();
      sub_225658140();
      OUTLINED_FUNCTION_15_0();
      uint64_t v80 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v80);
      uint64_t v81 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v81);
      OUTLINED_FUNCTION_35();
      sub_2256582D0();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_225658140();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_13();
  v51();
  sub_225658270();
  uint64_t v82 = OUTLINED_FUNCTION_17();
  ((void (*)(uint64_t))v54)(v82);
  if (v67)
  {
    OUTLINED_FUNCTION_33();
    sub_225658220();
    uint64_t v67 = sub_2256589D0();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_9_0();
    v83();
    if (v67)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_225658210();
      OUTLINED_FUNCTION_8_0();
      sub_2256589E0();
      OUTLINED_FUNCTION_15_0();
      uint64_t v84 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v84);
      uint64_t v85 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v85);
      OUTLINED_FUNCTION_35();
      sub_225658210();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_2256589E0();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_13();
  v51();
  sub_225658230();
  uint64_t v86 = OUTLINED_FUNCTION_17();
  ((void (*)(uint64_t))v54)(v86);
  if (v67)
  {
    OUTLINED_FUNCTION_33();
    sub_2256581B0();
    uint64_t v67 = sub_225658820();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_9_0();
    v87();
    if (v67)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_2256581A0();
      OUTLINED_FUNCTION_8_0();
      sub_225658830();
      OUTLINED_FUNCTION_15_0();
      uint64_t v88 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v88);
      uint64_t v89 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v89);
      OUTLINED_FUNCTION_35();
      sub_2256581A0();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_225658830();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_13();
  v51();
  sub_225658280();
  uint64_t v90 = OUTLINED_FUNCTION_17();
  ((void (*)(uint64_t))v54)(v90);
  if (v67)
  {
    OUTLINED_FUNCTION_33();
    sub_225658250();
    uint64_t v67 = sub_225658A60();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_9_0();
    v91();
    if (v67)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_225658240();
      OUTLINED_FUNCTION_8_0();
      sub_225658A70();
      OUTLINED_FUNCTION_15_0();
      uint64_t v92 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v92);
      uint64_t v93 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v93);
      OUTLINED_FUNCTION_35();
      sub_225658240();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_225658A70();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_13();
  v51();
  sub_225658260();
  uint64_t v94 = OUTLINED_FUNCTION_17();
  ((void (*)(uint64_t))v54)(v94);
  if (v67)
  {
    OUTLINED_FUNCTION_33();
    sub_2256581E0();
    uint64_t v67 = sub_2256588E0();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_9_0();
    v95();
    if (v67)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_14();
      sub_2256581D0();
      OUTLINED_FUNCTION_8_0();
      sub_2256588F0();
      OUTLINED_FUNCTION_15_0();
      uint64_t v96 = OUTLINED_FUNCTION_3_2();
      ((void (*)(uint64_t))v52)(v96);
      uint64_t v97 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v67)(v97);
      OUTLINED_FUNCTION_35();
      sub_2256581D0();
      OUTLINED_FUNCTION_16();
      uint64_t v72 = sub_2256588F0();
      goto LABEL_25;
    }
  }
  sub_225658F90();
  if (qword_26AD58250 != -1) {
    swift_once();
  }
  id v103 = (id)qword_26AD58298;
  sub_225658DA0();

  OUTLINED_FUNCTION_23();
  v54();
  uint64_t v102 = 1;
  uint64_t v63 = v114;
LABEL_27:
  __swift_storeEnumTagSinglePayload(v63, v102, 1, v64);
  OUTLINED_FUNCTION_52();
}

void sub_2256407B4()
{
  OUTLINED_FUNCTION_54();
  uint64_t v242 = v1;
  uint64_t v205 = v2;
  uint64_t v237 = v3;
  uint64_t v238 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681027B0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v6);
  uint64_t v241 = sub_225658350();
  OUTLINED_FUNCTION_0();
  uint64_t v231 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_42();
  uint64_t v240 = sub_225658A50();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_2();
  uint64_t v239 = v12;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_26();
  uint64_t v244 = v14;
  OUTLINED_FUNCTION_34();
  uint64_t v208 = sub_225658D20();
  OUTLINED_FUNCTION_0();
  unint64_t v236 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_27(v18);
  uint64_t v212 = sub_225658D50();
  OUTLINED_FUNCTION_0();
  unint64_t v235 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_27(v22);
  uint64_t v243 = sub_225657D80();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_5();
  uint64_t v245 = v26;
  OUTLINED_FUNCTION_34();
  uint64_t v228 = type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
  OUTLINED_FUNCTION_0();
  uint64_t v234 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_26();
  uint64_t v246 = v30;
  OUTLINED_FUNCTION_34();
  uint64_t v31 = sub_2256582F0();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)v189 - v40;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681027B8);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_5();
  uint64_t v196 = v43;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681027C0);
  uint64_t v45 = MEMORY[0x270FA5388](v44 - 8);
  uint64_t v47 = (void *)((char *)v189 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v45);
  uint64_t v49 = (void *)((char *)v189 - v48);
  uint64_t v50 = sub_225657DE0();
  uint64_t v233 = static MatchingSpanUtils.utf16CodeUnitsToCodePointsMapping(_:)();
  unint64_t v51 = 0;
  unint64_t v209 = 0;
  uint64_t v52 = *(void **)(v50 + 16);
  uint64_t v197 = v33 + 16;
  unint64_t v204 = (void (**)(void, void, void))(v33 + 32);
  uint64_t v225 = v24 + 16;
  v189[3] = (char *)v247 + 2;
  v189[4] = (char *)v247 + 3;
  unint64_t v207 = v236 + 16;
  unint64_t v206 = v236 + 8;
  unint64_t v211 = v235 + 16;
  unint64_t v210 = v235 + 8;
  uint64_t v221 = v24 + 24;
  uint64_t v219 = v231 + 16;
  uint64_t v218 = v10 + 16;
  uint64_t v217 = v10 + 32;
  uint64_t v216 = v231 + 8;
  uint64_t v220 = v10;
  uint64_t v215 = v10 + 8;
  uint64_t v226 = v24;
  uint64_t v223 = v24 + 8;
  uint64_t v198 = v33;
  uint64_t v201 = v33 + 8;
  uint64_t v53 = MEMORY[0x263F8EE78];
  long long v230 = xmmword_225659D50;
  uint64_t v199 = v31;
  uint64_t v200 = v41;
  uint64_t v202 = v50;
  uint64_t v190 = v42;
  uint64_t v192 = v47;
  BOOL v191 = v49;
  uint64_t v193 = v52;
  uint64_t v222 = v0;
LABEL_2:
  uint64_t v203 = v53;
LABEL_3:
  if ((void *)v51 == v52)
  {
    uint64_t v54 = 1;
    uint64_t v195 = v52;
  }
  else
  {
    if ((v51 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_164:
      __break(1u);
LABEL_165:
      __break(1u);
LABEL_166:
      __break(1u);
LABEL_167:
      swift_once();
      goto LABEL_137;
    }
    if (v51 >= *(void *)(v50 + 16)) {
      goto LABEL_164;
    }
    uint64_t v238 = (unint64_t *)(v51 + 1);
    id v55 = v49;
    uint64_t v56 = v53;
    uint64_t v57 = v31;
    uint64_t v58 = v41;
    unint64_t v59 = v51;
    OUTLINED_FUNCTION_3_1();
    v60();
    *uint64_t v47 = v59;
    uint64_t v41 = v58;
    uint64_t v31 = v57;
    uint64_t v53 = v56;
    uint64_t v49 = v55;
    OUTLINED_FUNCTION_58();
    v61();
    uint64_t v54 = 0;
    uint64_t v195 = v238;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v47, v54, 1, v42);
  sub_22562DE38((uint64_t)v47, (uint64_t)v49, &qword_2681027C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v42) == 1)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_41();
    goto LABEL_139;
  }
  uint64_t v33 = *v49;
  uint64_t v62 = (char *)v49 + *(int *)(v42 + 48);
  uint64_t v194 = *v204;
  v194(v41, v62, v31);
  if (!*(void *)(v205 + 16) || (unint64_t v63 = sub_225627E90(v33), (v64 & 1) == 0))
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_3_1();
    v139();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_21();
      uint64_t v53 = v149;
    }
    OUTLINED_FUNCTION_56();
    if (v106)
    {
      OUTLINED_FUNCTION_32();
      uint64_t v53 = v150;
    }
    goto LABEL_122;
  }
  uint64_t v65 = *(void *)(*(void *)(v205 + 56) + 8 * v63);
  uint64_t v224 = *(void **)(v65 + 16);
  if (!v224)
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_3_1();
    v140();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_21();
      uint64_t v53 = v151;
    }
    OUTLINED_FUNCTION_56();
    if (v106)
    {
      OUTLINED_FUNCTION_32();
      uint64_t v53 = v152;
    }
    goto LABEL_122;
  }
  uint64_t v33 = v31;
  swift_bridgeObjectRetain();
  sub_22563F040();
  if (!v66)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29_0();
    uint64_t v41 = v200;
    OUTLINED_FUNCTION_3_1();
    v141();
    uint64_t v53 = v203;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_21();
      uint64_t v53 = v153;
    }
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_56();
    if (v106)
    {
      OUTLINED_FUNCTION_32();
      uint64_t v53 = v154;
    }
LABEL_122:
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_18();
    v142();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v41, v31);
    goto LABEL_123;
  }
  char v68 = v66;
  uint64_t v47 = v67;
  unint64_t v69 = 0;
  uint64_t v232 = v65 + ((*(unsigned __int8 *)(v234 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v234 + 80));
  uint64_t v229 = v65;
  while (1)
  {
    if (v69 >= *(void *)(v65 + 16))
    {
      __break(1u);
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
LABEL_162:
      OUTLINED_FUNCTION_50();
LABEL_143:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_41();
      swift_bridgeObjectRelease();
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      uint64_t v178 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v179 = swift_allocObject();
      *(_OWORD *)(v179 + 16) = xmmword_22565A070;
      id v180 = v178;
      uint64_t v181 = v246;
      uint64_t v182 = sub_225658080();
      uint64_t v184 = v183;
      *(void *)(v179 + 56) = MEMORY[0x263F8D310];
      unint64_t v185 = sub_225626388();
      *(void *)(v179 + 32) = v182;
      *(void *)(v179 + 40) = v184;
      uint64_t v186 = *(void *)(v181 + v33);
      uint64_t v187 = MEMORY[0x263F8D750];
      *(void *)(v179 + 96) = MEMORY[0x263F8D6C8];
      *(void *)(v179 + 104) = v187;
      *(void *)(v179 + 64) = v185;
      *(void *)(v179 + 72) = v186;
      sub_225658DA0();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_0();
      v188();
      uint64_t v163 = v181;
LABEL_133:
      sub_22562DEEC(v163, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
      OUTLINED_FUNCTION_29_0();
      goto LABEL_138;
    }
    sub_22562DE90(v232 + *(void *)(v234 + 72) * v69, v246, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if ((sub_2256580C0() & 1) == 0)
    {
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_41();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_225658F90();
      if (qword_26AD58250 == -1) {
        goto LABEL_132;
      }
LABEL_168:
      swift_once();
LABEL_132:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v157 = OUTLINED_FUNCTION_2_0();
      id v158 = OUTLINED_FUNCTION_64(v157);
      uint64_t v159 = v246;
      uint64_t v160 = sub_2256580A0();
      uint64_t v162 = v161;
      *(void *)(v69 + 56) = MEMORY[0x263F8D310];
      *(void *)(v69 + 64) = sub_225626388();
      *(void *)(v69 + 32) = v160;
      *(void *)(v69 + 40) = v162;
      sub_225658DA0();

      swift_bridgeObjectRelease();
      uint64_t v163 = v159;
      goto LABEL_133;
    }
    uint64_t v70 = static MatchingSpanUtils.getUnicodeScalarIndexes(_:_:_:)(v246, v242, v233);
    if (v72)
    {
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_41();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        goto LABEL_168;
      }
      goto LABEL_132;
    }
    uint64_t v73 = v70;
    unint64_t v74 = v71;
    uint64_t v75 = v228;
    uint64_t v33 = *(int *)(v228 + 20);
    uint64_t v76 = *(void *)(v246 + v33);
    uint64_t v77 = v227;
    sub_22562DE90(v246, v227, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if (v76 <= 0)
    {
      swift_bridgeObjectRelease();
      sub_22562DEEC(v77, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
      swift_bridgeObjectRelease();
      goto LABEL_136;
    }
    uint64_t v78 = *(void *)(v77 + *(int *)(v75 + 20));
    uint64_t v79 = v68[2];
    sub_22562DEEC(v77, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if (v78 >= v79) {
      break;
    }
    uint64_t v237 = v73;
    uint64_t v238 = v47;
    uint64_t v80 = v246;
    sub_225658030();
    sub_22564319C();
    uint64_t v82 = v81;
    sub_225658000();
    sub_2256432F4();
    unint64_t v84 = *(void *)(v80 + v33);
    if ((v84 & 0x8000000000000000) != 0) {
      goto LABEL_148;
    }
    if (v84 >= v68[2]) {
      goto LABEL_149;
    }
    uint64_t v85 = v83;
    unint64_t v86 = (*(unsigned __int8 *)(v226 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v226 + 80);
    OUTLINED_FUNCTION_3_1();
    v87();
    char v88 = sub_225657D60();
    unint64_t v235 = v69;
    unint64_t v236 = v86;
    if (v88)
    {
      uint64_t v89 = v68;
      sub_225658D40();
      unint64_t v90 = v82;
      uint64_t v91 = v82;
      unint64_t v92 = v85;
      sub_2256437E8(v91, v85);
      unint64_t v93 = v74;
      if (!v94) {
        sub_225658080();
      }
      sub_225658D30();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_3_1();
      v95();
      sub_225657D40();
      OUTLINED_FUNCTION_45();
      goto LABEL_84;
    }
    if ((sub_225657D70() & 1) == 0)
    {
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_41();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_50();
      swift_bridgeObjectRelease();
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      uint64_t v172 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v173 = OUTLINED_FUNCTION_2_0();
      uint64_t v174 = MEMORY[0x263F8D6C8];
      *(_OWORD *)(v173 + 16) = v230;
      uint64_t v175 = MEMORY[0x263F8D750];
      *(void *)(v173 + 56) = v174;
      *(void *)(v173 + 64) = v175;
      *(void *)(v173 + 32) = v84;
      id v176 = v172;
      sub_225658DA0();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_0();
      v177();
      uint64_t v163 = v246;
      goto LABEL_133;
    }
    uint64_t v96 = sub_225658080();
    uint64_t v98 = v97;
    uint64_t v99 = HIBYTE(v97) & 0xF;
    uint64_t v100 = v96 & 0xFFFFFFFFFFFFLL;
    if ((v98 & 0x2000000000000000) != 0) {
      uint64_t v101 = v99;
    }
    else {
      uint64_t v101 = v96 & 0xFFFFFFFFFFFFLL;
    }
    if (!v101) {
      goto LABEL_162;
    }
    if ((v98 & 0x1000000000000000) != 0)
    {
      uint64_t v213 = (uint64_t)sub_225641F8C(v96, v98, 10);
      LOBYTE(v84) = v136;
      goto LABEL_82;
    }
    if ((v98 & 0x2000000000000000) == 0)
    {
      if ((v96 & 0x1000000000000000) != 0) {
        uint64_t v102 = (unsigned __int8 *)((v98 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v102 = (unsigned __int8 *)sub_225659070();
      }
      unint64_t v84 = v209;
      uint64_t v213 = (uint64_t)sub_2256420E8(v102, v100, 10);
      unint64_t v209 = v84;
      LOBYTE(v84) = v103 & 1;
      goto LABEL_82;
    }
    v247[0] = v96;
    v247[1] = v98 & 0xFFFFFFFFFFFFFFLL;
    if (v96 == 43)
    {
      if (!v99) {
        goto LABEL_166;
      }
      if (v99 != 1 && (BYTE1(v96) - 48) <= 9u)
      {
        uint64_t v104 = (BYTE1(v96) - 48);
        if (v99 == 2) {
          goto LABEL_59;
        }
        if ((BYTE2(v96) - 48) <= 9u)
        {
          uint64_t v105 = 10 * (BYTE1(v96) - 48) + (BYTE2(v96) - 48);
          if (v99 != 3)
          {
            while (1)
            {
              OUTLINED_FUNCTION_46();
              if (!v107 & v106) {
                goto LABEL_80;
              }
              OUTLINED_FUNCTION_30();
              if (!v107 || __OFADD__(v109, v108)) {
                goto LABEL_80;
              }
              OUTLINED_FUNCTION_48();
              if (v107) {
                goto LABEL_81;
              }
            }
          }
LABEL_71:
          uint64_t v213 = v105;
LABEL_72:
          LOBYTE(v84) = 0;
          goto LABEL_82;
        }
      }
LABEL_57:
      uint64_t v213 = 0;
      LOBYTE(v84) = 1;
      goto LABEL_82;
    }
    if (v96 != 45)
    {
      if (v99 && (v96 - 48) <= 9u)
      {
        uint64_t v104 = (v96 - 48);
        if (v99 == 1)
        {
LABEL_59:
          uint64_t v213 = v104;
          goto LABEL_72;
        }
        if ((BYTE1(v96) - 48) <= 9u)
        {
          uint64_t v105 = 10 * (v96 - 48) + (BYTE1(v96) - 48);
          if (v99 == 2) {
            goto LABEL_71;
          }
          while (1)
          {
            OUTLINED_FUNCTION_46();
            if (!v107 & v106) {
              goto LABEL_80;
            }
            OUTLINED_FUNCTION_30();
            if (!v107 || __OFADD__(v112, v111)) {
              goto LABEL_80;
            }
            OUTLINED_FUNCTION_48();
            if (v107) {
              goto LABEL_81;
            }
          }
        }
      }
      goto LABEL_57;
    }
    if (!v99) {
      goto LABEL_165;
    }
    if (v99 == 1 || (BYTE1(v96) - 48) > 9u) {
      goto LABEL_57;
    }
    if (v99 != 2)
    {
      if ((BYTE2(v96) - 48) <= 9u)
      {
        uint64_t v105 = -10 * (BYTE1(v96) - 48) - (BYTE2(v96) - 48);
        if (v99 == 3) {
          goto LABEL_71;
        }
        while (1)
        {
          OUTLINED_FUNCTION_46();
          if (!v107 & v106) {
            break;
          }
          OUTLINED_FUNCTION_30();
          if (!v107 || __OFSUB__(v114, v113)) {
            break;
          }
          OUTLINED_FUNCTION_48();
          if (v107) {
            goto LABEL_81;
          }
        }
LABEL_80:
        uint64_t v110 = 0;
        LOBYTE(v84) = 1;
LABEL_81:
        uint64_t v213 = (uint64_t)v110;
        goto LABEL_82;
      }
      goto LABEL_57;
    }
    LOBYTE(v84) = 0;
    uint64_t v213 = -(uint64_t)(BYTE1(v96) - 48);
LABEL_82:
    uint64_t v115 = swift_bridgeObjectRelease();
    if (v84) {
      goto LABEL_143;
    }
    unint64_t v90 = v82;
    unint64_t v92 = v85;
    unint64_t v93 = v74;
    MEMORY[0x22A630CC0](v115);
    sub_225658D00();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_3_1();
    v116();
    sub_225657D50();
    OUTLINED_FUNCTION_29_0();
    uint64_t v89 = v68;
LABEL_84:
    OUTLINED_FUNCTION_9_0();
    v117();
    unint64_t v118 = *(void *)(v246 + v33);
    uint64_t v49 = v89;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v120 = v237;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_225642074();
      uint64_t v49 = v133;
    }
    if ((v118 & 0x8000000000000000) != 0) {
      goto LABEL_150;
    }
    if (v118 >= v49[2]) {
      goto LABEL_151;
    }
    OUTLINED_FUNCTION_29_0();
    v121();
    sub_225658A40();
    unint64_t v122 = *(void *)(v246 + v33);
    if ((v122 & 0x8000000000000000) != 0) {
      goto LABEL_152;
    }
    if (HIDWORD(v122)) {
      goto LABEL_153;
    }
    char v68 = v49;
    sub_225658A30();
    sub_225658A10();
    sub_225658340();
    if ((v90 & 0x8000000000000000) != 0) {
      goto LABEL_154;
    }
    if (HIDWORD(v90)) {
      goto LABEL_155;
    }
    sub_225658300();
    if ((v92 & 0x8000000000000000) != 0) {
      goto LABEL_156;
    }
    if (HIDWORD(v92)) {
      goto LABEL_157;
    }
    sub_225658330();
    if ((v120 & 0x8000000000000000) != 0) {
      goto LABEL_158;
    }
    if (HIDWORD(v120)) {
      goto LABEL_159;
    }
    sub_225658320();
    if ((v93 & 0x8000000000000000) != 0) {
      goto LABEL_160;
    }
    if (HIDWORD(v93)) {
      goto LABEL_161;
    }
    sub_225658310();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681027C8);
    *(_OWORD *)(swift_allocObject() + 16) = v230;
    OUTLINED_FUNCTION_3_1();
    v123();
    sub_225658A20();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_3_1();
    v124();
    uint64_t v47 = v238;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2256441D0();
      uint64_t v47 = v134;
    }
    uint64_t v125 = v214;
    uint64_t v65 = v229;
    unint64_t v126 = v235;
    unint64_t v128 = v47[2];
    unint64_t v127 = v47[3];
    if (v128 >= v127 >> 1)
    {
      OUTLINED_FUNCTION_60(v127);
      sub_2256441D0();
      uint64_t v47 = v135;
    }
    unint64_t v69 = v126 + 1;
    v47[2] = v128 + 1;
    OUTLINED_FUNCTION_59();
    uint64_t v33 = v240;
    OUTLINED_FUNCTION_58();
    v129();
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_9_0();
    v130();
    OUTLINED_FUNCTION_9_0();
    v131();
    OUTLINED_FUNCTION_9_0();
    v132();
    sub_22562DEEC(v246, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if ((void *)v69 == v224)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v41 = v200;
      sub_22563FD8C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v31 = v199;
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v125, 1, v199);
      if (EnumTagSinglePayload == 1)
      {
        OUTLINED_FUNCTION_57();
        OUTLINED_FUNCTION_9_0();
        v138();
        sub_225642088(v125);
        swift_bridgeObjectRelease();
        uint64_t v50 = v202;
        uint64_t v42 = v190;
        uint64_t v53 = v203;
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_61();
        goto LABEL_3;
      }
      OUTLINED_FUNCTION_18();
      v143();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_3_1();
      v144();
      uint64_t v53 = v203;
      char v145 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v42 = v190;
      if ((v145 & 1) == 0)
      {
        OUTLINED_FUNCTION_21();
        uint64_t v53 = v155;
      }
      uint64_t v41 = v200;
      OUTLINED_FUNCTION_38();
      unint64_t v147 = *(void *)(v53 + 16);
      unint64_t v146 = *(void *)(v53 + 24);
      if (v147 >= v146 >> 1)
      {
        OUTLINED_FUNCTION_60(v146);
        sub_225644238();
        uint64_t v53 = v156;
      }
      *(void *)(v53 + 16) = v147 + 1;
      OUTLINED_FUNCTION_59();
      OUTLINED_FUNCTION_18();
      v148();
      uint64_t v33 = *(void *)(v147 + 9);
      OUTLINED_FUNCTION_40();
      ((void (*)(void))v33)();
      OUTLINED_FUNCTION_40();
      ((void (*)(void))v33)();
      swift_bridgeObjectRelease();
LABEL_123:
      uint64_t v50 = v202;
      OUTLINED_FUNCTION_61();
      goto LABEL_2;
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_50();
LABEL_136:
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_41();
  sub_225658F90();
  if (qword_26AD58250 != -1) {
    goto LABEL_167;
  }
LABEL_137:
  uint64_t v164 = (void *)qword_26AD58298;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
  uint64_t v165 = OUTLINED_FUNCTION_2_0();
  uint64_t v166 = v246;
  uint64_t v167 = *(void *)(v246 + v33);
  uint64_t v168 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v165 + 16) = v230;
  uint64_t v169 = MEMORY[0x263F8D750];
  *(void *)(v165 + 56) = v168;
  *(void *)(v165 + 64) = v169;
  *(void *)(v165 + 32) = v167;
  id v170 = v164;
  sub_225658DA0();

  swift_bridgeObjectRelease();
  sub_22562DEEC(v166, (void (*)(void))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
  OUTLINED_FUNCTION_57();
LABEL_138:
  OUTLINED_FUNCTION_9_0();
  v171();
  swift_bridgeObjectRelease();
LABEL_139:
  OUTLINED_FUNCTION_52();
}

unsigned __int8 *sub_225641F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_225658EF0();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_225642364();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_225659070();
  }
LABEL_7:
  uint64_t v11 = sub_2256420E8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

void sub_225642074()
{
}

uint64_t sub_225642088(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681027B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned __int8 *sub_2256420E8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          unint64_t v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v5 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v6 = a3 + 48;
        unsigned __int8 v7 = a3 + 55;
        unsigned __int8 v8 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = 58;
        }
        else
        {
          unsigned __int8 v8 = 97;
          unsigned __int8 v7 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          for (id i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
                }
                char v12 = -87;
              }
              else
              {
                char v12 = -55;
              }
            }
            else
            {
              char v12 = -48;
            }
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
              return 0;
            }
            if (!--v5) {
              return (unsigned __int8 *)v9;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_225642364()
{
  unint64_t v0 = sub_2256423D0();
  uint64_t v4 = sub_225642404(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2256423D0()
{
  return sub_225658F00();
}

uint64_t sub_225642404(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22564255C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22564265C(v9, 0);
      unint64_t v12 = sub_2256426C4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_225659070();
LABEL_4:
        JUMPOUT(0x22A630DE0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x22A630DE0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22A630DE0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22564255C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_2256428C8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_2256428C8(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_22564265C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681027D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_2256426C4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    uint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      uint64_t result = sub_2256428C8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_225658EA0();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_225659070();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      uint64_t result = sub_2256428C8(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_225658E70();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2256428C8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_225658EE0();
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
    uint64_t v5 = MEMORY[0x22A630E30](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_225642948()
{
  unint64_t result = qword_2681027D8;
  if (!qword_2681027D8)
  {
    sub_22562BDC4(255, &qword_26AD58148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681027D8);
  }
  return result;
}

uint64_t sub_2256429A8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void OUTLINED_FUNCTION_1_2()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0 - 152;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0 - 152;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  return v1;
}

unint64_t OUTLINED_FUNCTION_12()
{
  *(void *)(v2 + 16) = v0;
  return v2
       + ((*(unsigned __int8 *)(*(void *)(v3 - 560) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 560) + 80))
       + *(void *)(*(void *)(v3 - 560) + 72) * v1;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return MEMORY[0x270F6A360](v0);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0 - 152;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

void OUTLINED_FUNCTION_21()
{
  sub_225644238();
}

uint64_t OUTLINED_FUNCTION_27@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

void OUTLINED_FUNCTION_32()
{
  sub_225644238();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t result = v0;
  *(void *)(v2 - 112) = *(void *)(v1 + 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_60@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return v0;
}

id OUTLINED_FUNCTION_64(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v2 - 272);
  return v1;
}

void sub_225642DF0()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  uint64_t v2 = sub_225657CD0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8_1();
  uint64_t v8 = v6 - v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v54 = (char *)&v43 - v10;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58200);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5();
  uint64_t v43 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58208);
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v16 = (unint64_t *)(v14 - v15);
  MEMORY[0x270FA5388](v17);
  char v19 = (unint64_t *)((char *)&v43 - v18);
  uint64_t v20 = sub_225657EE0();
  unint64_t v21 = 0;
  unint64_t v22 = *(void *)(v20 + 16);
  unint64_t v51 = (void (**)(uint64_t, char *, uint64_t))(v4 + 16);
  unint64_t v52 = v22;
  uint64_t v44 = v4;
  uint64_t v49 = (void (**)(void))(v4 + 8);
  uint64_t v50 = v4 + 32;
  uint64_t v47 = v8;
  uint64_t v48 = v1;
  uint64_t v46 = v16;
  while (1)
  {
    if (v21 == v52)
    {
      uint64_t v23 = 1;
      unint64_t v24 = v52;
      uint64_t v25 = v55;
    }
    else
    {
      if (v21 >= *(void *)(v20 + 16))
      {
        __break(1u);
        goto LABEL_18;
      }
      unint64_t v24 = v21 + 1;
      uint64_t v26 = v8;
      uint64_t v27 = v1;
      uint64_t v28 = v20;
      unint64_t v29 = v21;
      uint64_t v30 = v44;
      OUTLINED_FUNCTION_15_1();
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v30 + 16))(v43 + *(int *)(v32 + 48), v28 + v31 + *(void *)(v30 + 72) * v29, v2);
      *uint64_t v16 = v29;
      uint64_t v20 = v28;
      uint64_t v1 = v27;
      uint64_t v8 = v26;
      uint64_t v25 = v55;
      OUTLINED_FUNCTION_58();
      v33();
      uint64_t v23 = 0;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, v23, 1, v25);
    sub_225644598((uint64_t)v16, (uint64_t)v19);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v25);
    if (EnumTagSinglePayload == 1)
    {
      swift_bridgeObjectRelease();
LABEL_16:
      BOOL v56 = EnumTagSinglePayload == 1;
      OUTLINED_FUNCTION_52();
      return;
    }
    unint64_t v53 = v24;
    unint64_t v35 = *v19;
    uint64_t v36 = v54;
    OUTLINED_FUNCTION_58();
    v37();
    uint64_t v38 = (int)sub_225657CC0();
    (*v51)(v8, v36, v2);
    if (v38 > v1)
    {
      uint64_t v39 = *v49;
      OUTLINED_FUNCTION_11_0();
      v39();
      goto LABEL_11;
    }
    uint64_t v40 = v1;
    uint64_t v41 = v20;
    uint64_t v42 = v49;
    uint64_t v45 = sub_225657CB0();
    uint64_t v39 = *v42;
    ((void (*)(uint64_t, uint64_t))*v42)(v8, v2);
    if ((int)v45 > v40) {
      break;
    }
    uint64_t v20 = v41;
LABEL_11:
    ((void (*)(char *, uint64_t))v39)(v54, v2);
    uint64_t v8 = v47;
    uint64_t v1 = v48;
    uint64_t v16 = v46;
    unint64_t v21 = v53;
  }
  swift_bridgeObjectRelease();
  if ((v35 & 0x8000000000000000) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!HIDWORD(v35))
  {
    ((void (*)(char *, uint64_t))v39)(v54, v2);
    goto LABEL_16;
  }
LABEL_19:
  __break(1u);
}

void sub_22564319C()
{
  OUTLINED_FUNCTION_54();
  unint64_t v1 = v0;
  sub_225657CD0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_7_1();
  v4();
  if ((v1 & 0x8000000000000000) != 0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_26_0();
    v12(v11);
    goto LABEL_6;
  }
  unint64_t v5 = *(void *)(sub_225657EE0() + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = OUTLINED_FUNCTION_26_0();
  v7(v6);
  if (v5 <= v1)
  {
LABEL_6:
    OUTLINED_FUNCTION_52();
    return;
  }
  if (*(void *)(sub_225657EE0() + 16) > v1)
  {
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_7_1();
    v8();
    swift_bridgeObjectRelease();
    sub_225657CC0();
    uint64_t v9 = OUTLINED_FUNCTION_14_0();
    v10(v9);
    goto LABEL_6;
  }
  __break(1u);
}

void sub_2256432F4()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  sub_225657CD0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_18_0();
  BOOL v4 = __OFSUB__(v1, 1);
  unint64_t v5 = v1 - 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_7_1();
    v6();
    if ((v5 & 0x8000000000000000) != 0)
    {
      uint64_t v13 = OUTLINED_FUNCTION_25_0();
      v14(v13);
      goto LABEL_7;
    }
    unint64_t v7 = *(void *)(sub_225657EE0() + 16);
    swift_bridgeObjectRelease();
    uint64_t v8 = OUTLINED_FUNCTION_25_0();
    v9(v8);
    if (v5 >= v7)
    {
LABEL_7:
      OUTLINED_FUNCTION_52();
      return;
    }
    if (v5 < *(void *)(sub_225657EE0() + 16))
    {
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_7_1();
      v10();
      swift_bridgeObjectRelease();
      sub_225657CB0();
      uint64_t v11 = OUTLINED_FUNCTION_14_0();
      v12(v11);
      goto LABEL_7;
    }
  }
  __break(1u);
}

uint64_t static MatchingSpanUtils.utf16CodeUnitsToCodePointsMapping(_:)()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = 0;
  uint64_t v1 = 0;
  uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    sub_225658E60();
    if (!v3)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v2;
    }
    uint64_t v4 = v3;
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v5 = sub_225627E90(v0);
    if (__OFADD__(v2[2], (v6 & 1) == 0)) {
      break;
    }
    unint64_t v7 = v5;
    char v8 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681027E8);
    if (sub_2256590D0())
    {
      unint64_t v9 = sub_225627E90(v0);
      if ((v8 & 1) != (v10 & 1)) {
        goto LABEL_41;
      }
      unint64_t v7 = v9;
    }
    if (v8)
    {
      *(void *)(v2[7] + 8 * v7) = v1;
    }
    else
    {
      OUTLINED_FUNCTION_21_0((uint64_t)&v2[v7 >> 6]);
      *(void *)(v2[6] + 8 * v7) = v0;
      *(void *)(v2[7] + 8 * v7) = v1;
      uint64_t v11 = v2[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_40;
      }
      v2[2] = v13;
    }
    swift_bridgeObjectRelease();
    if ((v4 & 0x1000000000000000) != 0) {
      uint64_t v14 = sub_225658EB0();
    }
    else {
      uint64_t v14 = sub_225658EC0();
    }
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = v15 - 1;
    if (v15 < 1) {
      goto LABEL_37;
    }
    if (v15 != 1)
    {
      while (v16)
      {
        if (v0 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_33;
        }
        ++v0;
        swift_isUniquelyReferenced_nonNull_native();
        unint64_t v17 = sub_225627E90(v0);
        char v19 = v18;
        if (__OFADD__(v2[2], (v18 & 1) == 0)) {
          goto LABEL_34;
        }
        unint64_t v20 = v17;
        if (sub_2256590D0())
        {
          unint64_t v21 = sub_225627E90(v0);
          if ((v19 & 1) != (v22 & 1)) {
            goto LABEL_41;
          }
          unint64_t v20 = v21;
        }
        if (v19)
        {
          *(void *)(v2[7] + 8 * v20) = v1;
        }
        else
        {
          v2[(v20 >> 6) + 8] |= 1 << v20;
          *(void *)(v2[6] + 8 * v20) = v0;
          *(void *)(v2[7] + 8 * v20) = v1;
          uint64_t v23 = v2[2];
          BOOL v12 = __OFADD__(v23, 1);
          uint64_t v24 = v23 + 1;
          if (v12) {
            goto LABEL_35;
          }
          v2[2] = v24;
        }
        swift_bridgeObjectRelease();
        if (!--v16) {
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      break;
    }
LABEL_26:
    BOOL v12 = __OFADD__(v1++, 1);
    if (v12) {
      goto LABEL_38;
    }
    BOOL v12 = __OFADD__(v0++, 1);
    if (v12) {
      goto LABEL_39;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_2256591D0();
  __break(1u);
  return result;
}

uint64_t static MatchingSpanUtils.getUnicodeScalarIndexes(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_225658030();
  sub_22564319C();
  if (v4 == -1) {
    return 0;
  }
  uint64_t v5 = v4;
  sub_225658000();
  sub_2256432F4();
  if (v6 == -1) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_22562C040(v5, a3);
  if (v9) {
    return 0;
  }
  uint64_t v10 = v8;
  uint64_t result = sub_22562C040(v7 - 1, a3);
  if (v12) {
    return 0;
  }
  if (!__OFADD__(result, 1)) {
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2256437E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 < 0 || a2 < 0 || a2 < a1) {
    return v2;
  }
  sub_225657EC0();
  sub_225657EC0();
  swift_bridgeObjectRelease();
  sub_225657EC0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_0();
  unint64_t v3 = sub_225658ED0();
  char v5 = v4;
  swift_bridgeObjectRelease();
  if (v5) {
    return 0;
  }
  sub_225657EC0();
  sub_225657EC0();
  swift_bridgeObjectRelease();
  sub_225657EC0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_0();
  unint64_t v6 = sub_225658ED0();
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v8) {
    return 0;
  }
  uint64_t result = sub_225657EC0();
  if (v6 >> 14 >= v3 >> 14)
  {
    uint64_t v10 = sub_225658F00();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v2 = MEMORY[0x22A630DD0](v10, v12, v14, v16);
    swift_bridgeObjectRelease();
    return v2;
  }
  __break(1u);
  return result;
}

void static MatchingSpanUtils.trailingAdjacent(_:_:usingTokens:)()
{
  OUTLINED_FUNCTION_54();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_225657CD0();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v5;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2256580F0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v1;
  uint64_t v15 = sub_225657EE0();
  int v16 = sub_225658000();
  if (v16 != sub_225658030())
  {
    unsigned int v17 = sub_225658000();
    uint64_t v43 = v3;
    if (sub_225658030() >= v17)
    {
      int v18 = sub_225658000();
      unint64_t v19 = *(void *)(v15 + 16);
      if (v19 != v18)
      {
        unsigned int v20 = sub_225658000();
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v43, v9);
        if (v19 >= v20)
        {
          unsigned int v23 = sub_225658030();
          uint64_t v24 = OUTLINED_FUNCTION_19_0();
          v25(v24);
          if (v19 > v23)
          {
            unsigned int v26 = sub_225658000();
            if (v26 >= sub_225658030()) {
              goto LABEL_5;
            }
            unint64_t v27 = v26;
            uint64_t v28 = v44;
            OUTLINED_FUNCTION_15_1();
            uint64_t v30 = v15 + v29;
            while (v27 < *(void *)(v15 + 16))
            {
              (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v8, v30 + *(void *)(v28 + 72) * v27, v4);
              char v31 = sub_225657CA0();
              (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v4);
              if ((v31 & 1) == 0 && ++v27 < sub_225658030()) {
                continue;
              }
              goto LABEL_5;
            }
            __break(1u);
            goto LABEL_19;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v21 = OUTLINED_FUNCTION_19_0();
          v22(v21);
        }
        sub_225658F90();
        if (qword_26AD58250 == -1)
        {
LABEL_17:
          uint64_t v32 = (void *)qword_26AD58298;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
          uint64_t v33 = swift_allocObject();
          *(_OWORD *)(v33 + 16) = xmmword_22565A080;
          id v34 = v32;
          uint64_t v35 = sub_225657EC0();
          uint64_t v37 = v36;
          *(void *)(v33 + 56) = MEMORY[0x263F8D310];
          *(void *)(v33 + 64) = sub_225626388();
          *(void *)(v33 + 32) = v35;
          *(void *)(v33 + 40) = v37;
          int v38 = sub_225658000();
          uint64_t v39 = MEMORY[0x263F8E8F8];
          uint64_t v40 = MEMORY[0x263F8E960];
          *(void *)(v33 + 96) = MEMORY[0x263F8E8F8];
          *(void *)(v33 + 104) = v40;
          *(_DWORD *)(v33 + 72) = v38;
          int v41 = sub_225658030();
          *(void *)(v33 + 136) = v39;
          *(void *)(v33 + 144) = v40;
          *(_DWORD *)(v33 + 112) = v41;
          sub_225658DA0();

          goto LABEL_5;
        }
LABEL_19:
        swift_once();
        goto LABEL_17;
      }
    }
  }
LABEL_5:
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_52();
}

char *sub_225643D08(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[16 * a2] <= __dst) {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_225643D34()
{
}

void sub_225643D4C()
{
}

void sub_225643D64()
{
}

void sub_225643D7C()
{
}

void sub_225643D94()
{
}

void sub_225643DA0()
{
  OUTLINED_FUNCTION_22_0();
  if (v4 && (v3(0), OUTLINED_FUNCTION_22(), v1 + *(void *)(v5 + 72) * v0 > v2))
  {
    if (v2 != v1)
    {
      OUTLINED_FUNCTION_6_2();
      swift_arrayInitWithTakeBackToFront();
    }
  }
  else
  {
    v3(0);
    OUTLINED_FUNCTION_6_2();
    swift_arrayInitWithTakeFrontToBack();
  }
}

void sub_225643E50()
{
}

void sub_225643E5C()
{
  OUTLINED_FUNCTION_22_0();
  if (v4
    && (__swift_instantiateConcreteTypeFromMangledName(v3), OUTLINED_FUNCTION_22(), v1 + *(void *)(v5 + 72) * v0 > v2))
  {
    if (v2 != v1)
    {
      OUTLINED_FUNCTION_6_2();
      swift_arrayInitWithTakeBackToFront();
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(v3);
    OUTLINED_FUNCTION_6_2();
    swift_arrayInitWithTakeFrontToBack();
  }
}

void sub_225643F04()
{
}

void sub_225643F38(char a1, uint64_t a2, char a3, void *a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_10_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_27_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = a4[2];
  if (v6 <= v9) {
    uint64_t v10 = a4[2];
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58218);
    uint64_t v11 = (void *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 8);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    if (v11 != a4 || &a4[v9 + 4] <= v11 + 4) {
      memmove(v11 + 4, a4 + 4, 8 * v9);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581E8);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_225644044()
{
}

void sub_225644078()
{
  OUTLINED_FUNCTION_54();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  char v7 = v6;
  if (v8)
  {
    OUTLINED_FUNCTION_10_1();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_27_0();
      if (v10)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v9 = v0;
  }
  uint64_t v12 = *(void *)(v5 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(v5 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (!v13) {
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(v1);
  uint64_t v14 = v3(0);
  OUTLINED_FUNCTION_4_2(v14);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v19 = (void *)swift_allocObject();
  size_t v20 = _swift_stdlib_malloc_size(v19);
  if (!v16)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v20 - v18 == 0x8000000000000000 && v16 == -1) {
    goto LABEL_22;
  }
  v19[2] = v12;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v16);
LABEL_17:
  v3(0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_15_1();
  if (v7)
  {
    sub_225643DA0();
    *(void *)(v5 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_52();
}

void sub_2256441D0()
{
}

void sub_225644204()
{
}

void sub_225644238()
{
}

void sub_22564426C()
{
}

void sub_2256442A0(char a1, uint64_t a2, char a3, char *a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_10_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_27_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58758);
    char v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    char v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || &v14[16 * v9] <= v13) {
      memmove(v13, v14, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_22564438C()
{
}

void sub_2256443C0()
{
}

void sub_2256443F4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_10_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_27_0();
      if (v7)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (!v10) {
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102820);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  OUTLINED_FUNCTION_4_2(v11);
  uint64_t v13 = *(void *)(v12 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v13)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 - v15 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_22;
  }
  v16[2] = v9;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v13);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_15_1();
  if (a1)
  {
    sub_225643E5C();
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_225644554()
{
}

ValueMetadata *type metadata accessor for MatchingSpanUtils()
{
  return &type metadata for MatchingSpanUtils;
}

uint64_t sub_225644598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_225657F00();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return v0;
}

void OUTLINED_FUNCTION_21_0(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= 1 << v1;
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_28_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_2256447B0()
{
  sub_225644814();
  uint64_t result = sub_225658FD0();
  qword_26AD58298 = result;
  return result;
}

unint64_t sub_225644814()
{
  unint64_t result = qword_26AD58728;
  if (!qword_26AD58728)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD58728);
  }
  return result;
}

id static ParseOverride.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  char v1 = (void *)sub_225658DF0();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

unint64_t sub_2256448CC()
{
  unint64_t result = qword_268102830;
  if (!qword_268102830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268102838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102830);
  }
  return result;
}

uint64_t sub_225644938@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_creation);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_225657B70();

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = sub_225657B90();
  return __swift_storeEnumTagSinglePayload(a2, v5, 1, v6);
}

void sub_2256449B8(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225644F98(a1, (uint64_t)v6);
  char v7 = *a2;
  uint64_t v8 = sub_225657B90();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_225657B50();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setCreation_, v9);
}

void sub_225644AB8(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_225658E00();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_225644B1C()
{
  OUTLINED_FUNCTION_0_1();
  if (v2) {
    uint64_t v3 = sub_225658DF0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [v1 *v0];
}

void sub_225644B80(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_225657B40();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_225644BE4()
{
  OUTLINED_FUNCTION_0_1();
  if (v2 >> 60 == 15) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = sub_225657B20();
  }
  id v4 = (id)v3;
  [v1 *v0];
}

uint64_t sub_225644C50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225645000(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *keypath_get_selector_archivedNluRequestRule()
{
  return sel_archivedNluRequestRule;
}

void sub_225644C88(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_225644CA8()
{
}

char *keypath_get_selector_creation()
{
  return sel_creation;
}

char *keypath_get_selector_enabled()
{
  return sel_enabled;
}

id sub_225644CE8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_enabled);
  *char v1 = (_BYTE)result;
  return result;
}

id sub_225644D18(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnabled_, *a1);
}

char *keypath_get_selector_id()
{
  return sel_id;
}

void sub_225644D38(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_225644D58()
{
}

char *keypath_get_selector_inputText()
{
  return sel_inputText;
}

void sub_225644D84(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_225644DA4()
{
}

char *keypath_get_selector_locale()
{
  return sel_locale;
}

void sub_225644DD0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_225644DF0()
{
}

char *keypath_get_selector_namespace()
{
  return sel_namespace;
}

id sub_225644E1C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_namespace);
  *char v1 = result;
  return result;
}

id sub_225644E4C(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNamespace_, *a1);
}

char *keypath_get_selector_overrideId()
{
  return sel_overrideId;
}

void sub_225644E6C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_225644E8C()
{
}

char *keypath_get_selector_source()
{
  return sel_source;
}

id sub_225644EB8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_source);
  *char v1 = result;
  return result;
}

id sub_225644EE8(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSource_, *a1);
}

char *keypath_get_selector_userParse()
{
  return sel_userParse;
}

void sub_225644F08(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_225644F28()
{
}

char *keypath_get_selector_utteranceComparisonType()
{
  return sel_utteranceComparisonType;
}

id sub_225644F54(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_utteranceComparisonType);
  *char v1 = result;
  return result;
}

id sub_225644F84(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUtteranceComparisonType_, *a1);
}

uint64_t sub_225644F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_225645000(void *a1)
{
  id v1 = objc_msgSend(a1, sel_id);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_225658E00();

  return v3;
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t Array<A>.currentTurn.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_225658B50();
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
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t Array<A>.previousTurns.getter(uint64_t a1)
{
  if (*(void *)(a1 + 16) < 2uLL) {
    return 0;
  }
  uint64_t v1 = sub_225645164(1, a1);
  return sub_225645200(v1, v2, v3, v4);
}

uint64_t sub_225645164(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    sub_225658B50();
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t sub_225645200(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_2256591B0();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v11 = *(void *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_2256523E4(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t Array<A>.currentTurnLocale.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v3 = sub_225658B50();
    OUTLINED_FUNCTION_0_2(v3);
    return Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(a2);
  }
  else
  {
    uint64_t v5 = sub_225657C50();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v5);
  }
}

uint64_t Array<A>.currentTurnUtterance.getter(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  uint64_t v1 = sub_225658B50();
  OUTLINED_FUNCTION_0_2(v1);
  return sub_225658B40();
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_2256453D4(uint64_t a1, uint64_t a2)
{
  uint64_t matched = type metadata accessor for UtteranceRuleMatchResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(matched - 8) + 32))(a2, a1, matched);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

void OUTLINED_FUNCTION_12_1()
{
  sub_22562DF40();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_225658570();
}

unint64_t sub_22564554C(uint64_t a1, unsigned __int8 a2)
{
  if (a2 > 1u)
  {
    if (a1) {
      return 0xD000000000000022;
    }
    else {
      return 0xD000000000000025;
    }
  }
  else
  {
    sub_225659050();
    OUTLINED_FUNCTION_0_3();
    sub_225658E50();
    sub_225659180();
    sub_225658E50();
    swift_bridgeObjectRelease();
    sub_225658E50();
    return 0;
  }
}

unint64_t sub_225645674(uint64_t a1, char a2)
{
  unint64_t result = 0xD00000000000005DLL;
  if (a2 && (a2 == 1 || a1)) {
    return 0xD000000000000057;
  }
  return result;
}

unint64_t sub_2256456D4()
{
  return sub_22564554C(*(void *)v0, *(unsigned char *)(v0 + 8));
}

unint64_t sub_2256456E0()
{
  return sub_225645674(*(void *)v0, *(unsigned char *)(v0 + 8));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParseOverride.validateForInsert()()
{
}

uint64_t sub_225645744()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102858);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2256588B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - v9;
  objc_msgSend(v0, sel_namespace);
  sub_225658890();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    sub_225645EFC((uint64_t)v3, &qword_268102858);
    uint64_t v11 = (int)objc_msgSend(v0, sel_namespace);
    sub_225645EB0();
    swift_allocError();
    *(void *)uint64_t v12 = v11;
    *(unsigned char *)(v12 + 8) = 0;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F716D8], v4);
    sub_225645F58(&qword_26AD580D8, MEMORY[0x263F716E8]);
    sub_225658F10();
    sub_225658F10();
    uint64_t v15 = v18[0];
    uint64_t v14 = v18[1];
    uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    if (v14 == v15)
    {
      sub_225645EB0();
      swift_allocError();
      *(void *)uint64_t v17 = 0;
      *(unsigned char *)(v17 + 8) = 2;
      swift_willThrow();
    }
    return ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
  }
}

uint64_t sub_225645A04()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102840);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225658880();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - v9;
  objc_msgSend(v0, sel_source);
  sub_225658860();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    sub_225645EFC((uint64_t)v3, &qword_268102840);
    uint64_t v11 = (int)objc_msgSend(v0, sel_source);
    sub_225645EB0();
    swift_allocError();
    *(void *)uint64_t v12 = v11;
    *(unsigned char *)(v12 + 8) = 1;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F716C0], v4);
    sub_225645F58(&qword_268102850, MEMORY[0x263F716C8]);
    sub_225658F10();
    sub_225658F10();
    uint64_t v14 = v18[3];
    uint64_t v15 = v18[1];
    uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    if (v14 == v15)
    {
      sub_225645EB0();
      swift_allocError();
      *(void *)uint64_t v17 = 1;
      *(unsigned char *)(v17 + 8) = 2;
      swift_willThrow();
    }
    return ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParseOverride.validateForUpdate()()
{
}

uint64_t sub_225645D44(SEL *a1)
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  v8[0] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ParseOverride();
  if (objc_msgSendSuper2(&v7, *a1, v8))
  {
    id v4 = v8[0];
    uint64_t result = sub_225645744();
    if (!v2) {
      return sub_225645A04();
    }
  }
  else
  {
    id v6 = v8[0];
    sub_225657B10();

    return swift_willThrow();
  }
  return result;
}

uint64_t sub_225645E2C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  id v5 = a1;
  a4();

  return 1;
}

unint64_t sub_225645EB0()
{
  unint64_t result = qword_268102848;
  if (!qword_268102848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102848);
  }
  return result;
}

uint64_t sub_225645EFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_225645F58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t _s15ValidationErrorOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s15ValidationErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22564603C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_225646054(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *_s15ValidationErrorOMa()
{
  return &_s15ValidationErrorON;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return v0;
}

void sub_2256460D8()
{
  qword_26AD586D8 = MEMORY[0x263F8EE80];
}

void sub_2256460EC()
{
  dword_26AD57F10 = 0;
}

uint64_t sub_2256460F8()
{
  return sub_225659260();
}

BOOL sub_225646158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 == a4 && a2 == a5) {
    return a3 == a6;
  }
  char v9 = sub_2256591A0();
  BOOL result = 0;
  if (v9) {
    return a3 == a6;
  }
  return result;
}

uint64_t sub_2256461AC()
{
  return sub_225659270();
}

uint64_t sub_225646224()
{
  return sub_2256461AC();
}

uint64_t sub_225646230()
{
  return sub_2256460F8();
}

uint64_t sub_22564623C()
{
  return sub_225659270();
}

BOOL sub_2256462AC(uint64_t *a1, uint64_t *a2)
{
  return sub_225646158(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_2256462C8(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *int v2 = 0x8000000000000000;
  sub_2256463E0(a1, a2);
  *int v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_225646348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v4;
  *id v4 = 0x8000000000000000;
  sub_225646534(a1, a2, a3, a4);
  *id v4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2256463E0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (void **)v2;
  uint64_t v6 = type metadata accessor for CacheKey();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = (void *)*v2;
  unint64_t v10 = sub_225627DC0(a2);
  if (__OFADD__(v9[2], (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58160);
  if ((sub_2256590D0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_225627DC0(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_10:
    uint64_t result = sub_2256591D0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v14;
LABEL_5:
  uint64_t v16 = *v3;
  if (v13)
  {
    uint64_t v17 = v16[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v17 + 8 * v12) = a1;
  }
  else
  {
    sub_2256266C8(a2, (uint64_t)v8);
    return sub_225646678(v12, (uint64_t)v8, a1, v16);
  }
  return result;
}

void sub_225646534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_225627F94(a2, a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58158);
  if ((sub_2256590D0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_225627F94(a2, a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    sub_2256591D0();
    __break(1u);
    return;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = v17[7];

    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    sub_225646718(v13, a2, a3, a4, a1, v17);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_225646678(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for CacheKey();
  uint64_t result = sub_225636A30(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_225646718(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 24 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  *(void *)(a6[7] + 8 * result) = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

void *_s16SiriNLUOverrides8CacheKeyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CacheKey(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for CacheKey(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for CacheKey(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for CacheKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

unint64_t sub_2256468BC()
{
  unint64_t result = qword_26AD586F0;
  if (!qword_26AD586F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD586F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

void sub_225646994(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  uint64_t v3 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_225636970(v4, &v5);
  os_unfair_lock_unlock(v3);
}

void sub_225646A00(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  uint64_t v3 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_225648358(v4, &v5);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_225646A6C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_225646A78()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58198);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_26AD580F8 = result;
  return result;
}

uint64_t sub_225646AB0()
{
  return MEMORY[0x270FA0650](&unk_26AD57F00, 0);
}

uint64_t static SiriNLOverridePrimaryStore.getWeakSharedTrieStore()()
{
  return sub_225646B9C((uint64_t)sub_225646B54, (uint64_t (*)(uint64_t))sub_225646994);
}

uint64_t sub_225646AEC@<X0>(uint64_t *a1@<X8>)
{
  if (qword_26AD58100 != -1) {
    swift_once();
  }
  uint64_t result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_225646B54@<X0>(uint64_t *a1@<X8>)
{
  return sub_225646AEC(a1);
}

uint64_t static SiriNLOverridePrimaryStore.sharedTrieStore.getter()
{
  return sub_225646B9C((uint64_t)sub_225646CD4, (uint64_t (*)(uint64_t))sub_225646A00);
}

uint64_t sub_225646B9C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = a1;
  if (qword_26AD57EF8 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = v2;
  return a2(v4);
}

uint64_t sub_225646C3C@<X0>(uint64_t *a1@<X8>)
{
  if (qword_26AD58100 != -1) {
    swift_once();
  }
  uint64_t result = swift_weakLoadStrong();
  uint64_t v3 = result;
  if (!result)
  {
    type metadata accessor for SiriNLOverridePrimaryStore();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    uint64_t result = swift_weakAssign();
  }
  *a1 = v3;
  return result;
}

uint64_t sub_225646CD4@<X0>(uint64_t *a1@<X8>)
{
  return sub_225646C3C(a1);
}

uint64_t SiriNLOverridePrimaryStore.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t SiriNLOverridePrimaryStore.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  return result;
}

uint64_t SiriNLOverridePrimaryStore.deinit()
{
  sub_225658F70();
  if (qword_26AD58250 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AD58298;
  sub_225658DA0();

  return v0;
}

uint64_t SiriNLOverridePrimaryStore.__deallocating_deinit()
{
  SiriNLOverridePrimaryStore.deinit();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

BOOL sub_225646E00()
{
  sub_22562BDC4(0, &qword_26AD58150);
  swift_bridgeObjectRetain();
  id v0 = sub_2256338B8();
  uint64_t v1 = (uint64_t)v0;
  if (v0)
  {
    id v2 = v0;
    sub_225646A6C(v1);
    sub_225658F80();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v3 = (id)qword_26AD58298;
    sub_225658DA0();
  }
  else
  {
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v2 = (id)qword_26AD58298;
    sub_225658DA0();
  }

  return v1 != 0;
}

BOOL sub_225646F80()
{
  return *(void *)(v0 + 16) != 0;
}

uint64_t sub_225646F90(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD580C8);
  uint64_t v4 = OUTLINED_FUNCTION_5_4(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = v6 - v5;
  sub_225657C30();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v50 = sub_225657BF0();
  OUTLINED_FUNCTION_0();
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10_3(v11, v46);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58258);
  uint64_t v13 = OUTLINED_FUNCTION_5_4(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3_0();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = *(void **)(v1 + 16);
  if (v17)
  {
    uint64_t v18 = sub_225657C50();
    OUTLINED_FUNCTION_22();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v16, a1, v18);
    __swift_storeEnumTagSinglePayload(v16, 0, 1, v18);
    sub_22562633C();
    id v20 = v17;
    sub_225659010();
    sub_22562793C(v16, &qword_26AD58258);
    sub_225658FF0();
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)sub_225658DF0();
    sub_225657BD0();
    char v22 = (void *)sub_225658DF0();
    swift_bridgeObjectRelease();
    uint64_t v49 = v20;
    id v23 = objc_msgSend(v20, sel_fetchRuleId_locale_overrideNamespace_, v21, v22, sub_225658870());

    uint64_t v24 = sub_225658F20();
    sub_225657C40();
    sub_225657C20();
    OUTLINED_FUNCTION_9_0();
    v25();
    if (__swift_getEnumTagSinglePayload(v7, 1, v50) == 1)
    {
      swift_bridgeObjectRelease();
      sub_22562793C(v7, &qword_26AD580C8);
    }
    else
    {
      OUTLINED_FUNCTION_8_3();
      v28();
      uint64_t v29 = (void *)sub_225658DF0();
      swift_bridgeObjectRelease();
      sub_225657BE0();
      uint64_t v30 = (void *)sub_225658DF0();
      swift_bridgeObjectRelease();
      id v31 = objc_msgSend(v49, sel_fetchRuleId_locale_overrideNamespace_, v29, v30, sub_225658870());

      sub_225658F20();
      sub_22562602C();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v50);
    }
    uint64_t v27 = sub_225647ADC(v24);
    swift_bridgeObjectRelease();
    sub_225658F70();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    uint64_t v32 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_22565A070;
    uint64_t v34 = *(void *)(v27 + 16);
    uint64_t v35 = MEMORY[0x263F8D750];
    *(void *)(v33 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v33 + 64) = v35;
    *(void *)(v33 + 32) = v34;
    uint64_t v36 = type metadata accessor for SiriNLOverride();
    id v37 = v32;
    uint64_t v38 = MEMORY[0x22A630EE0](v27, v36);
    uint64_t v40 = v39;
    *(void *)(v33 + 96) = MEMORY[0x263F8D310];
    *(void *)(v33 + 104) = sub_225626388();
    *(void *)(v33 + 72) = v38;
    *(void *)(v33 + 80) = v40;
    sub_225658DA0();

    swift_bridgeObjectRelease();
    sub_2256475CC();
    sub_225626104();
    sub_225658F70();
    int v41 = (void *)qword_26AD58298;
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_225659D50;
    uint64_t v43 = *(void *)(v27 + 16);
    *(void *)(v42 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v42 + 64) = MEMORY[0x263F8D750];
    *(void *)(v42 + 32) = v43;
    id v44 = v41;
    sub_225658DA0();

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v26 = (id)qword_26AD58298;
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_225658DA0();
  }
  return v27;
}

void sub_2256475CC()
{
  OUTLINED_FUNCTION_54();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD580C8);
  uint64_t v4 = OUTLINED_FUNCTION_5_4(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_14_1();
  sub_225657C30();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_15();
  uint64_t v6 = sub_225657BF0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4();
  type metadata accessor for RegexOverrideCache();
  uint64_t v10 = sub_2256263F8();
  if (v10)
  {
    uint64_t v11 = v10;
    sub_225658F70();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    uint64_t v12 = (void *)qword_26AD58298;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
    uint64_t v13 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v13 + 16) = xmmword_225659D50;
    uint64_t v14 = *(void *)(v11 + 16);
    uint64_t v15 = MEMORY[0x263F8D750];
    *(void *)(v13 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v13 + 64) = v15;
    *(void *)(v13 + 32) = v14;
    id v16 = v12;
    sub_225658DA0();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v35 = v2;
    uint64_t v17 = *(void **)(v0 + 16);
    if (v17)
    {
      id v18 = v17;
      sub_225657BD0();
      uint64_t v19 = (void *)sub_225658DF0();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v18, sel_fetchRegexRuleIds_overrideNamespace_, v19, sub_225658870());

      uint64_t v21 = sub_225658F20();
      sub_225657C40();
      sub_225657C20();
      OUTLINED_FUNCTION_9_0();
      v22();
      uint64_t v23 = v6;
      if (__swift_getEnumTagSinglePayload(v1, 1, v6) == 1)
      {
        sub_22562793C(v1, &qword_26AD580C8);
        uint64_t v24 = v18;
      }
      else
      {
        OUTLINED_FUNCTION_8_3();
        v26();
        sub_225657BE0();
        uint64_t v24 = v18;
        uint64_t v27 = (void *)sub_225658DF0();
        swift_bridgeObjectRelease();
        id v28 = objc_msgSend(v24, sel_fetchRegexRuleIds_overrideNamespace_, v27, sub_225658870());

        sub_225658F20();
        sub_22562602C();
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v35, v23);
      }
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_225647ADC(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_225658F70();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      uint64_t v30 = (void *)qword_26AD58298;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD58760);
      uint64_t v31 = OUTLINED_FUNCTION_2_0();
      *(_OWORD *)(v31 + 16) = xmmword_225659D50;
      uint64_t v32 = *(void *)(v29 + 16);
      uint64_t v33 = MEMORY[0x263F8D750];
      *(void *)(v31 + 56) = MEMORY[0x263F8D6C8];
      *(void *)(v31 + 64) = v33;
      *(void *)(v31 + 32) = v32;
      id v34 = v30;
      sub_225658DA0();

      swift_bridgeObjectRelease();
      sub_2256367E4();
    }
    else
    {
      sub_225658F90();
      if (qword_26AD58250 != -1) {
        swift_once();
      }
      id v25 = (id)qword_26AD58298;
      sub_225658DA0();
    }
  }
  OUTLINED_FUNCTION_52();
}

uint64_t sub_225647ADC(uint64_t a1)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](a1);
    id v3 = v2;
    sub_225629020();
    uint64_t v5 = v4;
  }
  else
  {
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v6 = (id)qword_26AD58298;
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_225658DA0();
  }
  return v5;
}

uint64_t sub_225647C04@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v53 = a5;
  uint64_t v54 = a4;
  uint64_t v50 = a3;
  uint64_t v57 = a6;
  uint64_t v8 = sub_225658880();
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2256588B0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a1;
  uint64_t v16 = a1[1];
  uint64_t v17 = (void *)sub_225658DF0();
  id v18 = objc_msgSend(a2, sel_fetchSerializedNluRequestRule_, v17);

  if (!v18)
  {
    sub_225658F90();
    if (qword_26AD58250 != -1) {
      swift_once();
    }
    id v40 = (id)qword_26AD58298;
    sub_225658DA0();
    goto LABEL_16;
  }
  uint64_t v19 = sub_225657B40();
  unint64_t v55 = v20;
  uint64_t v56 = v19;

  uint64_t v21 = (void *)sub_225658DF0();
  id v22 = objc_msgSend(a2, sel_fetchOverrideId_, v21);

  if (!v22)
  {
    sub_225658F90();
    if (qword_26AD58250 == -1) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  uint64_t v49 = v12;
  uint64_t v48 = sub_225658E00();
  uint64_t v24 = v23;
  id v25 = objc_msgSend(a2, sel_fetchSerializedUserParse_, v22);
  if (!v25)
  {
    swift_bridgeObjectRelease();

    sub_225658F90();
    if (qword_26AD58250 == -1)
    {
LABEL_15:
      id v40 = (id)qword_26AD58298;
      sub_225658DA0();
      sub_225627258(v56, v55);
LABEL_16:

      uint64_t v37 = type metadata accessor for SiriNLOverride();
      uint64_t v38 = v57;
      uint64_t v39 = 1;
      return __swift_storeEnumTagSinglePayload(v38, v39, 1, v37);
    }
LABEL_22:
    swift_once();
    goto LABEL_15;
  }
  id v26 = v25;
  uint64_t v47 = v24;
  uint64_t v27 = sub_225657B40();
  unint64_t v45 = v28;
  uint64_t v46 = v27;

  id v44 = objc_msgSend(a2, sel_fetchOverrideTimeStamp_, v22);
  uint64_t v29 = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_225657BD0();
  uint64_t v43 = v30;
  uint64_t v31 = v49;
  (*(void (**)(char *, void, uint64_t))(v49 + 104))(v14, *MEMORY[0x263F716E0], v11);
  uint64_t v32 = sub_225658870();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v11);
  if (v32 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v32 > 0x7FFFFFFF)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v34 = v51;
  uint64_t v33 = v52;
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v10, *MEMORY[0x263F716B8], v52);
  uint64_t v35 = sub_225658870();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v33);
  if (v35 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v35 > 0x7FFFFFFF)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v36 = v57;
  SiriNLOverride.init(inputText:ruleId:locale:namespace:source:overrideId:parse:ruleData:utteranceComparisonType:timeStamp:)(v50, v29, v15, v16, v53, v43, v32, v35, v57, v48, v47, v46, v45, v56, v55, 1);
  uint64_t v37 = type metadata accessor for SiriNLOverride();
  uint64_t v38 = v36;
  uint64_t v39 = 0;
  return __swift_storeEnumTagSinglePayload(v38, v39, 1, v37);
}

uint64_t sub_225648158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2256481C0()
{
  unint64_t result = qword_26AD58340;
  if (!qword_26AD58340)
  {
    sub_225658BD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD58340);
  }
  return result;
}

uint64_t sub_225648210(uint64_t a1, uint64_t a2)
{
  uint64_t matched = type metadata accessor for OverrideMatchResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(matched - 8) + 32))(a2, a1, matched);
  return a2;
}

uint64_t type metadata accessor for SiriNLOverridePrimaryStore()
{
  return self;
}

uint64_t method lookup function for SiriNLOverridePrimaryStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriNLOverridePrimaryStore);
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.isOverrideTrieBundleLoaded()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.matchCandidateOverrides(inputs:candidateOverrides:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t sub_22564830C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_225647C04(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

void *sub_22564832C@<X0>(uint64_t a1@<X0>, void *(*a2)(uint64_t *__return_ptr)@<X1>, void *a3@<X8>)
{
  unint64_t result = sub_2256336D0(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void *sub_225648358@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_22564832C(a1, *(void *(**)(uint64_t *__return_ptr))(v2 + 16), a2);
}

uint64_t OUTLINED_FUNCTION_5_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_225658B50();
}

void OUTLINED_FUNCTION_10_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_225658DA0();
}

uint64_t UtteranceRuleMatchResult.init(matched:comparisonType:allUdaSpanNodes:textCheckingResult:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  uint64_t v11 = matched[6];
  *a5 = a1;
  *(void *)&a5[v11] = a3;
  uint64_t v12 = &a5[matched[5]];
  sub_2256584F0();
  OUTLINED_FUNCTION_22();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v13 + 32))(v12, a2);
  *(void *)&a5[matched[7]] = a4;
  return result;
}

uint64_t sub_2256484C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_225648518(a1, type metadata accessor for OverrideMatchResultAndParse, (void (*)(void))type metadata accessor for OverrideMatchResultAndParse, a2);
}

uint64_t sub_2256484EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_225648518(a1, type metadata accessor for OverrideMatchResult, (void (*)(void))type metadata accessor for OverrideMatchResult, a2);
}

uint64_t sub_225648518@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = a2(0);
  if (v7)
  {
    OUTLINED_FUNCTION_1_6();
    sub_225626F90(a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a4, a3);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a4, v10, 1, v8);
}

uint64_t sub_2256485B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  if (v4)
  {
    OUTLINED_FUNCTION_1_6();
    sub_22564A53C(a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), a2, &qword_268102828);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v5);
}

uint64_t TurnInputRuleMatchResult.init(matched:utteranceRuleMatchResult:userDialogActs:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  uint64_t matched = type metadata accessor for TurnInputRuleMatchResult(0);
  uint64_t v9 = *(int *)(matched + 24);
  *a4 = a1;
  uint64_t result = sub_2256486A8(a2, (uint64_t)&a4[*(int *)(matched + 20)]);
  *(void *)&a4[v9] = a3;
  return result;
}

uint64_t sub_2256486A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OverrideMatchResult.override.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_225626F90(v1, a1, (void (*)(void))type metadata accessor for SiriNLOverride);
}

uint64_t OverrideMatchResult.matched.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for OverrideMatchResult(0) + 20));
}

uint64_t OverrideMatchResult.turnInputMatchResults.getter()
{
  type metadata accessor for OverrideMatchResult(0);
  return swift_bridgeObjectRetain();
}

uint64_t OverrideMatchResult.userDialogActs.getter()
{
  type metadata accessor for OverrideMatchResult(0);
  return swift_bridgeObjectRetain();
}

uint64_t OverrideMatchResult.userDialogActs.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for OverrideMatchResult(0) + 28);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*OverrideMatchResult.userDialogActs.modify())()
{
  return nullsub_1;
}

uint64_t TurnInputRuleMatchResult.matched.getter()
{
  return *v0;
}

uint64_t TurnInputRuleMatchResult.utteranceRuleMatchResult.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t matched = type metadata accessor for TurnInputRuleMatchResult(0);
  return sub_22564A53C(v1 + *(int *)(matched + 20), a1, &qword_268102878);
}

uint64_t TurnInputRuleMatchResult.userDialogActs.getter()
{
  return sub_2256489C8();
}

uint64_t TurnInputRuleMatchResult.userDialogActs.setter(uint64_t a1)
{
  return sub_225648A18(a1);
}

uint64_t (*TurnInputRuleMatchResult.userDialogActs.modify())()
{
  return nullsub_1;
}

uint64_t UtteranceRuleMatchResult.matched.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*UtteranceRuleMatchResult.matched.modify())()
{
  return nullsub_1;
}

uint64_t UtteranceRuleMatchResult.comparisonType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UtteranceRuleMatchResult(0) + 20);
  sub_2256584F0();
  OUTLINED_FUNCTION_22();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t UtteranceRuleMatchResult.allUdaSpanNodes.getter()
{
  return sub_2256489C8();
}

uint64_t sub_2256489C8()
{
  uint64_t v0 = OUTLINED_FUNCTION_16_1();
  v1(v0);
  return swift_bridgeObjectRetain();
}

uint64_t UtteranceRuleMatchResult.allUdaSpanNodes.setter(uint64_t a1)
{
  return sub_225648A18(a1);
}

uint64_t sub_225648A18(uint64_t a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_16_1();
  uint64_t v5 = *(int *)(v4(v3) + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v5) = a1;
  return result;
}

uint64_t (*UtteranceRuleMatchResult.allUdaSpanNodes.modify())()
{
  return nullsub_1;
}

void *UtteranceRuleMatchResult.textCheckingResult.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for UtteranceRuleMatchResult(0) + 28));
  id v2 = v1;
  return v1;
}

void *initializeBufferWithCopyOfBuffer for OverrideMatchResult(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    a1[6] = a2[6];
    uint64_t v10 = (int *)type metadata accessor for SiriNLOverride();
    uint64_t v11 = v10[9];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_225657B90();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
      memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    *((unsigned char *)v4 + v10[10]) = *((unsigned char *)a2 + v10[10]);
    uint64_t v17 = v10[11];
    id v18 = (void *)((char *)v4 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *id v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v10[12];
    id v22 = (char *)v4 + v21;
    uint64_t v23 = (_OWORD *)((char *)a2 + v21);
    unint64_t v24 = *(void *)((char *)a2 + v21 + 8);
    swift_bridgeObjectRetain();
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)id v22 = *v23;
    }
    else
    {
      uint64_t v25 = *(void *)v23;
      sub_225626B60(v25, v24);
      *(void *)id v22 = v25;
      *((void *)v22 + 1) = v24;
    }
    *(_DWORD *)((char *)v4 + v10[13]) = *(_DWORD *)((char *)a2 + v10[13]);
    uint64_t v26 = v10[14];
    uint64_t v27 = (char *)v4 + v26;
    unint64_t v28 = (char *)a2 + v26;
    unint64_t v29 = *((void *)v28 + 1);
    if (v29 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    }
    else
    {
      uint64_t v30 = *(void *)v28;
      sub_225626B60(*(void *)v28, *((void *)v28 + 1));
      *(void *)uint64_t v27 = v30;
      *((void *)v27 + 1) = v29;
    }
    uint64_t v31 = v10[15];
    uint64_t v32 = (char *)v4 + v31;
    uint64_t v33 = (char *)a2 + v31;
    uint64_t v34 = sub_225658BD0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v34))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v34);
    }
    uint64_t v36 = a3[6];
    *((unsigned char *)v4 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *(void *)((char *)v4 + v36) = *(void *)((char *)a2 + v36);
    *(void *)((char *)v4 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t assignWithCopy for OverrideMatchResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  uint64_t v6 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v7 = v6[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_225657B90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v15 = v6[11];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v6[12];
  uint64_t v19 = (uint64_t *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  unint64_t v21 = *(void *)(a2 + v18 + 8);
  if (*(void *)(a1 + v18 + 8) >> 60 == 15)
  {
    if (v21 >> 60 != 15)
    {
      uint64_t v22 = *v20;
      sub_225626B60(v22, v21);
      *uint64_t v19 = v22;
      v19[1] = v21;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v21 >> 60 == 15)
  {
    sub_225649260((uint64_t)v19);
LABEL_12:
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    goto LABEL_14;
  }
  uint64_t v23 = *v20;
  sub_225626B60(v23, v21);
  uint64_t v24 = *v19;
  unint64_t v25 = v19[1];
  *uint64_t v19 = v23;
  v19[1] = v21;
  sub_225627258(v24, v25);
LABEL_14:
  *(_DWORD *)(a1 + v6[13]) = *(_DWORD *)(a2 + v6[13]);
  uint64_t v26 = v6[14];
  uint64_t v27 = (uint64_t *)(a1 + v26);
  unint64_t v28 = (uint64_t *)(a2 + v26);
  unint64_t v29 = *(void *)(a2 + v26 + 8);
  if (*(void *)(a1 + v26 + 8) >> 60 == 15)
  {
    if (v29 >> 60 != 15)
    {
      uint64_t v30 = *v28;
      sub_225626B60(v30, v29);
      *uint64_t v27 = v30;
      v27[1] = v29;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v29 >> 60 == 15)
  {
    sub_225649260((uint64_t)v27);
LABEL_19:
    *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    goto LABEL_21;
  }
  uint64_t v31 = *v28;
  sub_225626B60(v31, v29);
  uint64_t v32 = *v27;
  unint64_t v33 = v27[1];
  *uint64_t v27 = v31;
  v27[1] = v29;
  sub_225627258(v32, v33);
LABEL_21:
  uint64_t v34 = v6[15];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (const void *)(a2 + v34);
  uint64_t v37 = sub_225658BD0();
  int v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v37);
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37);
  if (!v38)
  {
    uint64_t v40 = *(void *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(void *, const void *, uint64_t))(v40 + 24))(v35, v36, v37);
      goto LABEL_27;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_26;
  }
  if (v39)
  {
LABEL_26:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v35, v36, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_27;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
LABEL_27:
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_225649260(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for OverrideMatchResult(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v8 = v7[9];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_225657B90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  *(_OWORD *)(a1 + v7[11]) = *(_OWORD *)(a2 + v7[11]);
  *(_OWORD *)(a1 + v7[12]) = *(_OWORD *)(a2 + v7[12]);
  *(_DWORD *)(a1 + v7[13]) = *(_DWORD *)(a2 + v7[13]);
  *(_OWORD *)(a1 + v7[14]) = *(_OWORD *)(a2 + v7[14]);
  uint64_t v13 = v7[15];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_225658BD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  uint64_t v18 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

void *assignWithTake for OverrideMatchResult(void *a1, void *a2, int *a3)
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
  a1[6] = a2[6];
  uint64_t v9 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v10 = v9[9];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_225657B90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (EnumTagSinglePayload)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = *(void *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v11, v12, v13);
LABEL_7:
  *((unsigned char *)a1 + v9[10]) = *((unsigned char *)a2 + v9[10]);
  uint64_t v18 = v9[11];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = v9[12];
  uint64_t v24 = (uint64_t)a1 + v23;
  unint64_t v25 = (char *)a2 + v23;
  unint64_t v26 = *(void *)((char *)a1 + v23 + 8);
  if (v26 >> 60 == 15)
  {
LABEL_10:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    goto LABEL_12;
  }
  unint64_t v27 = *((void *)v25 + 1);
  if (v27 >> 60 == 15)
  {
    sub_225649260(v24);
    goto LABEL_10;
  }
  uint64_t v28 = *(void *)v24;
  *(void *)uint64_t v24 = *(void *)v25;
  *(void *)(v24 + 8) = v27;
  sub_225627258(v28, v26);
LABEL_12:
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  uint64_t v29 = v9[14];
  uint64_t v30 = (uint64_t)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  unint64_t v32 = *(void *)((char *)a1 + v29 + 8);
  if (v32 >> 60 == 15)
  {
LABEL_15:
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    goto LABEL_17;
  }
  unint64_t v33 = *((void *)v31 + 1);
  if (v33 >> 60 == 15)
  {
    sub_225649260(v30);
    goto LABEL_15;
  }
  uint64_t v34 = *(void *)v30;
  *(void *)uint64_t v30 = *(void *)v31;
  *(void *)(v30 + 8) = v33;
  sub_225627258(v34, v32);
LABEL_17:
  uint64_t v35 = v9[15];
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)a2 + v35;
  uint64_t v38 = sub_225658BD0();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v36, v37, v38);
      goto LABEL_23;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_22;
  }
  if (v40)
  {
LABEL_22:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_23:
  uint64_t v43 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *(void *)((char *)a1 + v43) = *(void *)((char *)a2 + v43);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_225649894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

void sub_225649924()
{
  OUTLINED_FUNCTION_10_4();
  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    __swift_storeEnumTagSinglePayload(v1, v0, v0, v4);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 24)) = (v0 - 1);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TurnInputRuleMatchResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    unint64_t v9 = (char *)a2 + v7;
    uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, (uint64_t)matched))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      *uint64_t v8 = *v9;
      uint64_t v13 = matched[5];
      uint64_t v14 = &v8[v13];
      int v15 = &v9[v13];
      uint64_t v16 = sub_2256584F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
      *(void *)&v8[matched[6]] = *(void *)&v9[matched[6]];
      uint64_t v17 = matched[7];
      uint64_t v18 = *(void **)&v9[v17];
      *(void *)&v8[v17] = v18;
      swift_bridgeObjectRetain();
      id v19 = v18;
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, (uint64_t)matched);
    }
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

unsigned char *assignWithCopy for TurnInputRuleMatchResult(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, (uint64_t)matched);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched);
  if (!EnumTagSinglePayload)
  {
    if (!v11)
    {
      *uint64_t v7 = *v8;
      uint64_t v21 = matched[5];
      uint64_t v22 = &v7[v21];
      uint64_t v23 = &v8[v21];
      uint64_t v24 = sub_2256584F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
      *(void *)&v7[matched[6]] = *(void *)&v8[matched[6]];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v25 = matched[7];
      unint64_t v26 = *(void **)&v7[v25];
      unint64_t v27 = *(void **)&v8[v25];
      *(void *)&v7[v25] = v27;
      id v28 = v27;

      goto LABEL_7;
    }
    sub_225637C80((uint64_t)v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
    memcpy(v7, v8, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *uint64_t v7 = *v8;
  uint64_t v12 = matched[5];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_2256584F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  *(void *)&v7[matched[6]] = *(void *)&v8[matched[6]];
  uint64_t v16 = matched[7];
  uint64_t v17 = *(void **)&v8[v16];
  *(void *)&v7[v16] = v17;
  swift_bridgeObjectRetain();
  id v18 = v17;
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *initializeWithTake for TurnInputRuleMatchResult(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    *uint64_t v7 = *v8;
    uint64_t v11 = matched[5];
    uint64_t v12 = &v7[v11];
    uint64_t v13 = &v8[v11];
    uint64_t v14 = sub_2256584F0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
    *(void *)&v7[matched[6]] = *(void *)&v8[matched[6]];
    *(void *)&v7[matched[7]] = *(void *)&v8[matched[7]];
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *assignWithTake for TurnInputRuleMatchResult(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, (uint64_t)matched);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched);
  if (!EnumTagSinglePayload)
  {
    if (!v11)
    {
      *uint64_t v7 = *v8;
      uint64_t v18 = matched[5];
      uint64_t v19 = &v7[v18];
      uint64_t v20 = &v8[v18];
      uint64_t v21 = sub_2256584F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
      *(void *)&v7[matched[6]] = *(void *)&v8[matched[6]];
      swift_bridgeObjectRelease();
      uint64_t v22 = matched[7];
      uint64_t v23 = *(void **)&v7[v22];
      *(void *)&v7[v22] = *(void *)&v8[v22];

      goto LABEL_7;
    }
    sub_225637C80((uint64_t)v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  *uint64_t v7 = *v8;
  uint64_t v12 = matched[5];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_2256584F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(void *)&v7[matched[6]] = *(void *)&v8[matched[6]];
  *(void *)&v7[matched[7]] = *(void *)&v8[matched[7]];
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22564A050(uint64_t a1, int a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v3 + 84) != a2) {
    return OUTLINED_FUNCTION_6_4();
  }
  uint64_t v4 = OUTLINED_FUNCTION_13_3();
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

void sub_22564A0C8(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102878);
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_9_4();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for UtteranceRuleMatchResult(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_2256584F0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)v4 + v11) = (uint64_t)v12;
    swift_bridgeObjectRetain();
    id v13 = v12;
  }
  return v4;
}

unsigned char *assignWithCopy for UtteranceRuleMatchResult(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2256584F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = *(void **)&a1[v10];
  uint64_t v12 = *(void **)&a2[v10];
  *(void *)&a1[v10] = v12;
  id v13 = v12;

  return a1;
}

unsigned char *initializeWithTake for UtteranceRuleMatchResult(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2256584F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  return a1;
}

unsigned char *assignWithTake for UtteranceRuleMatchResult(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2256584F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = *(void **)&a1[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];

  return a1;
}

uint64_t sub_22564A458(uint64_t a1, int a2)
{
  sub_2256584F0();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v3 + 84) != a2) {
    return OUTLINED_FUNCTION_6_4();
  }
  uint64_t v4 = OUTLINED_FUNCTION_13_3();
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

void sub_22564A4CC()
{
  OUTLINED_FUNCTION_10_4();
  sub_2256584F0();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_9_4();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 24)) = v0;
  }
}

uint64_t sub_22564A53C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22();
  uint64_t v4 = OUTLINED_FUNCTION_12_3();
  v5(v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  uint64_t v2 = *(void *)(v0 - 432);
  unint64_t v3 = *(void *)(v0 - 384);
  return sub_225635818(v2, v3);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  unint64_t v2 = *(void *)(v0 + *(int *)(v1 + 24));
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  int v3 = v2 - 1;
  if (v3 < 0) {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return v0 + *(int *)(v1 + 20);
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return *(void *)(v0 - 176);
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return v0 + *(int *)(v1 + 20);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return v0;
}

uint64_t dispatch thunk of NLOverride.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLOverride.inputText.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLOverride.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

id ParseOverride.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id ParseOverride.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ParseOverride();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for ParseOverride()
{
  return self;
}

id ParseOverride.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParseOverride();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void OverrideResult.init(replaceMatchFromMatches:turnInputAndPreprocessing:)()
{
  OUTLINED_FUNCTION_54();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102890);
  uint64_t v8 = OUTLINED_FUNCTION_5_4(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_225657EB0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_15();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58540);
  uint64_t v17 = OUTLINED_FUNCTION_5_4(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_3_0();
  uint64_t v20 = v19 - v18;
  uint64_t matched = type metadata accessor for OverrideMatchResult(0);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_3_0();
  uint64_t v25 = v24 - v23;
  Array<A>.oldestOverride.getter(v4);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v20, 1, matched) == 1)
  {
    sub_225658B50();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_9_0();
    v26();
    unint64_t v27 = &qword_26AD58540;
    uint64_t v28 = v20;
  }
  else
  {
    sub_225633238(v20, v25, (void (*)(void))type metadata accessor for OverrideMatchResult);
    OverrideMatchResult.getPatchedUserParse(turnInputAndPreprocessing:)(v2, v11);
    if (__swift_getEnumTagSinglePayload(v11, 1, v12) != 1)
    {
      uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
      v30(v0, v11, v12);
      sub_225657E50();
      sub_225658B50();
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_9_0();
      v31();
      sub_2256398C0(v25, (void (*)(void))type metadata accessor for OverrideMatchResult);
      v30(v6, v0, v12);
      goto LABEL_7;
    }
    sub_225658B50();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_9_0();
    v29();
    sub_2256398C0(v25, (void (*)(void))type metadata accessor for OverrideMatchResult);
    unint64_t v27 = &qword_268102890;
    uint64_t v28 = v11;
  }
  sub_22562793C(v28, v27);
LABEL_7:
  type metadata accessor for OverrideResult(0);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_52();
}

uint64_t Array<A>.oldestOverride.getter(uint64_t a1)
{
  return sub_22564AB40(a1, sub_225638158, (void (*)(uint64_t))sub_2256484EC);
}

uint64_t sub_22564AB40(uint64_t a1, void (*a2)(uint64_t *), void (*a3)(uint64_t))
{
  uint64_t v6 = a1;
  swift_bridgeObjectRetain();
  a2(&v6);
  a3(v6);
  return swift_release();
}

void sub_22564ABC8()
{
}

void sub_22564ABFC()
{
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_29_1();
  if (v7)
  {
    OUTLINED_FUNCTION_10_1();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_27_0();
      if (v9)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v8 = v5;
  }
  uint64_t v11 = *(void *)(v0 + 16);
  if (v8 <= v11) {
    uint64_t v12 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v12 = v8;
  }
  if (!v12) {
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(v6);
  uint64_t v13 = v3(0);
  OUTLINED_FUNCTION_4_2(v13);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = (void *)OUTLINED_FUNCTION_14_3();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v15)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 - v4 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_22;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v4) / v15);
LABEL_17:
  v3(0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_28_1();
  if (v2)
  {
    v1(v19, v11);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  OUTLINED_FUNCTION_52();
}

void sub_22564AD28()
{
}

void sub_22564AD50()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for OverrideResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v6 + 64));
        return a1;
      }
      uint64_t v8 = sub_225657EB0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for OverrideResult(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2256398C0((uint64_t)a1, (void (*)(void))type metadata accessor for OverrideResult);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_225657EB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for OverrideResult(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_225657EB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for OverrideResult(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2256398C0((uint64_t)a1, (void (*)(void))type metadata accessor for OverrideResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_225657EB0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_22564B124()
{
  return swift_storeEnumTagMultiPayload();
}

void *sub_22564B134(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    a1[6] = a2[6];
    char v10 = (int *)type metadata accessor for SiriNLOverride();
    uint64_t v11 = v10[9];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_225657B90();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
      memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    *((unsigned char *)v4 + v10[10]) = *((unsigned char *)a2 + v10[10]);
    uint64_t v17 = v10[11];
    uint64_t v18 = (void *)((char *)v4 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v10[12];
    uint64_t v22 = (char *)v4 + v21;
    uint64_t v23 = (_OWORD *)((char *)a2 + v21);
    unint64_t v24 = *(void *)((char *)a2 + v21 + 8);
    swift_bridgeObjectRetain();
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v22 = *v23;
    }
    else
    {
      uint64_t v25 = *(void *)v23;
      sub_225626B60(v25, v24);
      *(void *)uint64_t v22 = v25;
      *((void *)v22 + 1) = v24;
    }
    *(_DWORD *)((char *)v4 + v10[13]) = *(_DWORD *)((char *)a2 + v10[13]);
    uint64_t v26 = v10[14];
    unint64_t v27 = (char *)v4 + v26;
    uint64_t v28 = (char *)a2 + v26;
    unint64_t v29 = *((void *)v28 + 1);
    if (v29 >> 60 == 15)
    {
      *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
    }
    else
    {
      uint64_t v30 = *(void *)v28;
      sub_225626B60(*(void *)v28, *((void *)v28 + 1));
      *(void *)unint64_t v27 = v30;
      *((void *)v27 + 1) = v29;
    }
    uint64_t v31 = v10[15];
    unint64_t v32 = (char *)v4 + v31;
    unint64_t v33 = (char *)a2 + v31;
    uint64_t v34 = sub_225658BD0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v34))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v34);
    }
    uint64_t matched = (int *)type metadata accessor for OverrideMatchResult(0);
    *((unsigned char *)v4 + matched[5]) = *((unsigned char *)a2 + matched[5]);
    *(void *)((char *)v4 + matched[6]) = *(void *)((char *)a2 + matched[6]);
    *(void *)((char *)v4 + matched[7]) = *(void *)((char *)a2 + matched[7]);
    uint64_t v37 = *(int *)(a3 + 20);
    uint64_t v38 = (char *)v4 + v37;
    int v39 = (char *)a2 + v37;
    uint64_t v40 = sub_225657EB0();
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41(v38, v39, v40);
  }
  return v4;
}

uint64_t sub_22564B48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  uint64_t v6 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v7 = v6[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_225657B90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v15 = v6[11];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v6[12];
  uint64_t v19 = (uint64_t *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  unint64_t v21 = *(void *)(a2 + v18 + 8);
  if (*(void *)(a1 + v18 + 8) >> 60 == 15)
  {
    if (v21 >> 60 != 15)
    {
      uint64_t v22 = *v20;
      sub_225626B60(v22, v21);
      *uint64_t v19 = v22;
      v19[1] = v21;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v21 >> 60 == 15)
  {
    sub_225649260((uint64_t)v19);
LABEL_12:
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    goto LABEL_14;
  }
  uint64_t v23 = *v20;
  sub_225626B60(v23, v21);
  uint64_t v24 = *v19;
  unint64_t v25 = v19[1];
  *uint64_t v19 = v23;
  v19[1] = v21;
  sub_225627258(v24, v25);
LABEL_14:
  *(_DWORD *)(a1 + v6[13]) = *(_DWORD *)(a2 + v6[13]);
  uint64_t v26 = v6[14];
  unint64_t v27 = (uint64_t *)(a1 + v26);
  uint64_t v28 = (uint64_t *)(a2 + v26);
  unint64_t v29 = *(void *)(a2 + v26 + 8);
  if (*(void *)(a1 + v26 + 8) >> 60 == 15)
  {
    if (v29 >> 60 != 15)
    {
      uint64_t v30 = *v28;
      sub_225626B60(v30, v29);
      *unint64_t v27 = v30;
      v27[1] = v29;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v29 >> 60 == 15)
  {
    sub_225649260((uint64_t)v27);
LABEL_19:
    *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
    goto LABEL_21;
  }
  uint64_t v31 = *v28;
  sub_225626B60(v31, v29);
  uint64_t v32 = *v27;
  unint64_t v33 = v27[1];
  *unint64_t v27 = v31;
  v27[1] = v29;
  sub_225627258(v32, v33);
LABEL_21:
  uint64_t v34 = v6[15];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (const void *)(a2 + v34);
  uint64_t v37 = sub_225658BD0();
  int v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v37);
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37);
  if (!v38)
  {
    uint64_t v40 = *(void *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(void *, const void *, uint64_t))(v40 + 24))(v35, v36, v37);
      goto LABEL_27;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_26;
  }
  if (v39)
  {
LABEL_26:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v35, v36, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_27;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
LABEL_27:
  uint64_t matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *(unsigned char *)(a1 + matched[5]) = *(unsigned char *)(a2 + matched[5]);
  *(void *)(a1 + matched[6]) = *(void *)(a2 + matched[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + matched[7]) = *(void *)(a2 + matched[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v43 = *(int *)(a3 + 20);
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = sub_225657EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
  return a1;
}

uint64_t sub_22564B970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v8 = v7[9];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_225657B90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  *(_OWORD *)(a1 + v7[11]) = *(_OWORD *)(a2 + v7[11]);
  *(_OWORD *)(a1 + v7[12]) = *(_OWORD *)(a2 + v7[12]);
  *(_DWORD *)(a1 + v7[13]) = *(_DWORD *)(a2 + v7[13]);
  *(_OWORD *)(a1 + v7[14]) = *(_OWORD *)(a2 + v7[14]);
  uint64_t v13 = v7[15];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_225658BD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  uint64_t matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *(unsigned char *)(a1 + matched[5]) = *(unsigned char *)(a2 + matched[5]);
  *(void *)(a1 + matched[6]) = *(void *)(a2 + matched[6]);
  *(void *)(a1 + matched[7]) = *(void *)(a2 + matched[7]);
  uint64_t v19 = *(int *)(a3 + 20);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_225657EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

void *sub_22564BBD0(void *a1, void *a2, uint64_t a3)
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
  a1[6] = a2[6];
  uint64_t v9 = (int *)type metadata accessor for SiriNLOverride();
  uint64_t v10 = v9[9];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_225657B90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (EnumTagSinglePayload)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = *(void *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v11, v12, v13);
LABEL_7:
  *((unsigned char *)a1 + v9[10]) = *((unsigned char *)a2 + v9[10]);
  uint64_t v18 = v9[11];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = v9[12];
  uint64_t v24 = (uint64_t)a1 + v23;
  unint64_t v25 = (char *)a2 + v23;
  unint64_t v26 = *(void *)((char *)a1 + v23 + 8);
  if (v26 >> 60 == 15)
  {
LABEL_10:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    goto LABEL_12;
  }
  unint64_t v27 = *((void *)v25 + 1);
  if (v27 >> 60 == 15)
  {
    sub_225649260(v24);
    goto LABEL_10;
  }
  uint64_t v28 = *(void *)v24;
  *(void *)uint64_t v24 = *(void *)v25;
  *(void *)(v24 + 8) = v27;
  sub_225627258(v28, v26);
LABEL_12:
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  uint64_t v29 = v9[14];
  uint64_t v30 = (uint64_t)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  unint64_t v32 = *(void *)((char *)a1 + v29 + 8);
  if (v32 >> 60 == 15)
  {
LABEL_15:
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    goto LABEL_17;
  }
  unint64_t v33 = *((void *)v31 + 1);
  if (v33 >> 60 == 15)
  {
    sub_225649260(v30);
    goto LABEL_15;
  }
  uint64_t v34 = *(void *)v30;
  *(void *)uint64_t v30 = *(void *)v31;
  *(void *)(v30 + 8) = v33;
  sub_225627258(v34, v32);
LABEL_17:
  uint64_t v35 = v9[15];
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)a2 + v35;
  uint64_t v38 = sub_225658BD0();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v36, v37, v38);
      goto LABEL_23;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_22;
  }
  if (v40)
  {
LABEL_22:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_23:
  uint64_t matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *((unsigned char *)a1 + matched[5]) = *((unsigned char *)a2 + matched[5]);
  *(void *)((char *)a1 + matched[6]) = *(void *)((char *)a2 + matched[6]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + matched[7]) = *(void *)((char *)a2 + matched[7]);
  swift_bridgeObjectRelease();
  uint64_t v44 = *(int *)(a3 + 20);
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  uint64_t v47 = sub_225657EB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 40))(v45, v46, v47);
  return a1;
}

uint64_t sub_22564BFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for OverrideMatchResult(0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_225657EB0();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_22564C078(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for OverrideMatchResult(0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_225657EB0();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_22564C0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_25_1();
  a19 = v20;
  a20 = v21;
  char v145 = v22;
  uint64_t v147 = v23;
  uint64_t v135 = v24;
  unint64_t v26 = v25;
  unint64_t v28 = v27;
  unint64_t v30 = v29;
  unint64_t v32 = v31;
  unint64_t v34 = v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  uint64_t v36 = OUTLINED_FUNCTION_5_4(v35);
  MEMORY[0x270FA5388](v36);
  uint64_t v138 = (uint64_t)&v131 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v38);
  uint64_t v142 = (uint64_t *)((char *)&v131 - v39);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_25();
  unint64_t v140 = v41;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v42);
  uint64_t v44 = (char *)&v131 - v43;
  uint64_t v148 = sub_225657B90();
  OUTLINED_FUNCTION_0();
  uint64_t v132 = v45;
  MEMORY[0x270FA5388](v46);
  uint64_t v134 = (char *)&v131 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_25();
  uint64_t v141 = v49;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_25();
  uint64_t v136 = v51;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_26();
  uint64_t v144 = v53;
  uint64_t v54 = OUTLINED_FUNCTION_21_1();
  uint64_t v143 = v26(v54);
  uint64_t v55 = MEMORY[0x270FA5388](v143);
  uint64_t v56 = MEMORY[0x270FA5388](v55);
  unint64_t v146 = (unint64_t)&v131 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  uint64_t v60 = (char *)&v131 - v59;
  MEMORY[0x270FA5388](v58);
  unint64_t v63 = (char *)&v131 - v62;
  uint64_t v65 = *(void *)(v64 + 72);
  if (!v65)
  {
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
    return;
  }
  int64_t v66 = v32 - v34;
  BOOL v67 = v32 - v34 == 0x8000000000000000 && v65 == -1;
  if (v67) {
    goto LABEL_85;
  }
  int64_t v68 = v30 - v32;
  if (v30 - v32 == 0x8000000000000000 && v65 == -1) {
    goto LABEL_86;
  }
  unint64_t v139 = v30;
  uint64_t v70 = v66 / v65;
  a10 = v34;
  unint64_t v150 = v28;
  uint64_t v71 = v68 / v65;
  if (v66 / v65 >= v68 / v65)
  {
    uint64_t v144 = v61;
    unint64_t v140 = v34;
    ((void (*)(unint64_t, int64_t, unint64_t))v135)(v32, v68 / v65, v28);
    unint64_t v100 = v28 + v71 * v65;
    unint64_t v149 = v100;
    a10 = v32;
    unint64_t v101 = v139;
    if (v71 * v65 >= 1 && v140 < v32)
    {
      uint64_t v103 = -v65;
      uint64_t v135 = (void (**)(char *, uint64_t))(v132 + 8);
      uint64_t v136 = -v65;
      unint64_t v133 = v28;
      uint64_t v137 = (char *)(v132 + 32);
      do
      {
        unint64_t v104 = v101;
        unint64_t v105 = v146;
        sub_225637CD0(v100 + v103, v146);
        unint64_t v106 = v32 + v103;
        uint64_t v107 = v144;
        sub_225637CD0(v32 + v103, v144);
        uint64_t v108 = type metadata accessor for SiriNLOverride();
        uint64_t v109 = v142;
        sub_225644F98(v105 + *(int *)(v108 + 36), (uint64_t)v142);
        OUTLINED_FUNCTION_8_4((uint64_t)v109, 1, v148);
        if (v67)
        {
          sub_22562793C((uint64_t)v109, (uint64_t *)&unk_26AD581C8);
          BOOL v110 = 0;
        }
        else
        {
          unsigned __int8 v111 = v109;
          uint64_t v112 = *(void (**)(char *, uint64_t, uint64_t))v137;
          uint64_t v113 = v148;
          (*(void (**)(void (**)(uint64_t, uint64_t), void *, uint64_t))v137)(v141, v111, v148);
          uint64_t v114 = v107 + *(int *)(v108 + 36);
          uint64_t v115 = v138;
          sub_225644F98(v114, v138);
          uint64_t v116 = OUTLINED_FUNCTION_22_1();
          OUTLINED_FUNCTION_8_4(v116, v117, v113);
          if (v118)
          {
            OUTLINED_FUNCTION_9_0();
            v119();
            sub_22562793C(v115, (uint64_t *)&unk_26AD581C8);
            BOOL v110 = 0;
          }
          else
          {
            uint64_t v120 = v148;
            uint64_t v121 = v141;
            unint64_t v122 = v134;
            v112(v134, v115, v148);
            BOOL v110 = sub_225657B80() == -1;
            unint64_t v123 = *v135;
            char v124 = v122;
            uint64_t v125 = (char *)v121;
            unint64_t v28 = v133;
            (*v135)(v124, v120);
            v123(v125, v120);
          }
          uint64_t v103 = v136;
        }
        unint64_t v101 = v104 + v103;
        unint64_t v126 = v145;
        sub_2256398C0(v144, v145);
        sub_2256398C0(v146, v126);
        if (v110)
        {
          if (v104 < v32 || v101 >= v32)
          {
            OUTLINED_FUNCTION_31_0();
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v104 != v32)
          {
            OUTLINED_FUNCTION_31_0();
            swift_arrayInitWithTakeBackToFront();
          }
          a10 += v103;
        }
        else
        {
          unint64_t v128 = v149;
          v149 += v103;
          if (v104 < v128 || v101 >= v128)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v104 != v128)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v106 = v32;
        }
        unint64_t v100 = v149;
        BOOL v130 = v149 > v28 && v106 > v140;
        unint64_t v32 = v106;
      }
      while (v130);
    }
  }
  else
  {
    ((void (*)(unint64_t, int64_t, unint64_t))v135)(v34, v66 / v65, v28);
    unint64_t v146 = v28 + v70 * v65;
    unint64_t v149 = v146;
    BOOL v130 = v70 * v65 < 1;
    unint64_t v72 = v139;
    if (!v130 && v32 < v139)
    {
      uint64_t v74 = v65;
      uint64_t v141 = (void (**)(uint64_t, uint64_t))(v132 + 8);
      uint64_t v142 = (void *)(v132 + 32);
      uint64_t v137 = v44;
      while (1)
      {
        uint64_t v75 = v74;
        sub_225637CD0(v32, (uint64_t)v63);
        sub_225637CD0(v28, (uint64_t)v60);
        uint64_t v76 = type metadata accessor for SiriNLOverride();
        sub_225644F98((uint64_t)&v63[*(int *)(v76 + 36)], (uint64_t)v44);
        int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v44, 1, v148);
        uint64_t v78 = (uint64_t)v44;
        if (EnumTagSinglePayload == 1) {
          goto LABEL_20;
        }
        uint64_t v79 = (void (*)(void))*v142;
        uint64_t v80 = (uint64_t)v60;
        uint64_t v81 = v148;
        OUTLINED_FUNCTION_26_1();
        v79();
        uint64_t v82 = v80 + *(int *)(v76 + 36);
        uint64_t v83 = v140;
        sub_225644F98(v82, v140);
        OUTLINED_FUNCTION_8_4(v83, 1, v81);
        if (v67) {
          break;
        }
        uint64_t v91 = v136;
        uint64_t v92 = v148;
        OUTLINED_FUNCTION_26_1();
        v79();
        uint64_t v93 = sub_225657B80();
        uint64_t v94 = *v141;
        uint64_t v95 = v91;
        uint64_t v96 = v144;
        (*v141)(v95, v92);
        v94(v96, v92);
        unint64_t v97 = v145;
        sub_2256398C0(v80, v145);
        uint64_t v98 = v97;
        unint64_t v72 = v139;
        sub_2256398C0((uint64_t)v63, v98);
        uint64_t v60 = (char *)v80;
        uint64_t v44 = v137;
        if (v93 != -1) {
          goto LABEL_21;
        }
        unint64_t v86 = a10;
        unint64_t v89 = v32 + v75;
        if (a10 < v32 || a10 >= v89)
        {
          OUTLINED_FUNCTION_30_0();
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          if (a10 == v32)
          {
            uint64_t v74 = v75;
            unint64_t v86 = v32;
            goto LABEL_31;
          }
          OUTLINED_FUNCTION_30_0();
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v74 = v75;
LABEL_31:
        a10 = v86 + v74;
        unint64_t v28 = v150;
        BOOL v90 = v150 >= v146 || v89 >= v72;
        unint64_t v32 = v89;
        if (v90) {
          goto LABEL_83;
        }
      }
      OUTLINED_FUNCTION_9_0();
      v84();
      uint64_t v78 = v83;
      uint64_t v60 = (char *)v80;
      uint64_t v44 = v137;
      unint64_t v72 = v139;
LABEL_20:
      sub_22562793C(v78, (uint64_t *)&unk_26AD581C8);
      uint64_t v85 = v145;
      sub_2256398C0((uint64_t)v60, v145);
      sub_2256398C0((uint64_t)v63, v85);
LABEL_21:
      unint64_t v86 = a10;
      unint64_t v87 = v150 + v75;
      if (a10 < v150 || a10 >= v87)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        uint64_t v74 = v75;
        if (a10 == v150)
        {
LABEL_30:
          unint64_t v150 = v87;
          unint64_t v89 = v32;
          goto LABEL_31;
        }
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v74 = v75;
      goto LABEL_30;
    }
  }
LABEL_83:
  sub_22564C9C4(&a10, &v150, (uint64_t *)&v149);
  OUTLINED_FUNCTION_19_1();
}

void sub_22564C8EC(char a1, uint64_t a2, char a3, char *a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_10_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_27_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268102898);
    uint64_t v11 = (char *)swift_allocObject();
    _swift_stdlib_malloc_size(v11);
    OUTLINED_FUNCTION_32_0();
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = v12;
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || &v14[16 * v9] <= v13) {
      memmove(v13, v14, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v9);
  }
  swift_bridgeObjectRelease();
}

void sub_22564C9C4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t v6 = OUTLINED_FUNCTION_21_1();
  v7(v6);
  OUTLINED_FUNCTION_22();
  uint64_t v9 = *(void *)(v8 + 72);
  if (!v9)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    return;
  }
  if (v5 - v4 == 0x8000000000000000 && v9 == -1) {
    goto LABEL_20;
  }
  unint64_t v11 = v4 + (uint64_t)(v5 - v4) / v9 * v9;
  if (v3 < v4 || v3 >= v11)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    swift_arrayInitWithTakeBackToFront();
  }
}

void sub_22564CA9C(uint64_t a1)
{
}

void sub_22564CAB0(uint64_t a1)
{
}

void sub_22564CAC4()
{
}

void sub_22564CB1C()
{
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void OUTLINED_FUNCTION_10_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v22 = *(void *)(v20 - 280);
  uint64_t v23 = *(void *)(v20 - 144);
  uint64_t v24 = *(void *)(v20 - 136);
  uint64_t v25 = *(void *)(v20 - 272);
  sub_22564C0FC(a1, a2, a3, v22, v23, v25, v23, v24, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return v0;
}

uint64_t sub_22564CCE0()
{
  unint64_t v0 = sub_225659110();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

uint64_t sub_22564CD2C(unsigned __int8 *a1, char *a2)
{
  return sub_22564D9D0(*a1, *a2);
}

uint64_t sub_22564CD38()
{
  return sub_225653DC4(*v0);
}

uint64_t sub_22564CD40()
{
  return sub_225653E5C();
}

uint64_t sub_22564CD48(uint64_t a1)
{
  return sub_225654138(a1, *v1);
}

uint64_t sub_22564CD50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22564CCE0();
  *a1 = result;
  return result;
}

uint64_t sub_22564CD80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225628698(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22564CDAC()
{
  return sub_225658DB0();
}

uint64_t static MobileGestalt.buildVersion.getter()
{
  return sub_22562876C(0x726556646C697542, 0xEC0000006E6F6973);
}

uint64_t sub_22564CDF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58220);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static MobileGestalt.osVersion.getter()
{
  return sub_22562876C(0x56746375646F7250, 0xEE006E6F69737265);
}

ValueMetadata *type metadata accessor for MobileGestalt()
{
  return &type metadata for MobileGestalt;
}

uint64_t getEnumTagSinglePayload for MobileGestalt.DeviceClass(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MobileGestalt.DeviceClass(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x22564CFD8);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_22564D000(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22564D008(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

unint64_t sub_22564D014()
{
  unint64_t result = qword_2681028B0;
  if (!qword_2681028B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681028B0);
  }
  return result;
}

uint64_t sub_22564D060(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = a1;
  if (a1 >> 62)
  {
LABEL_50:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2256590F0();
    if (!v6) {
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_51;
    }
  }
  uint64_t v7 = 0;
  unint64_t v8 = v5 & 0xC000000000000001;
  unint64_t v9 = a2 & 0xC000000000000001;
  uint64_t v29 = a3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v34 = a3 & 0xC000000000000001;
  unint64_t v32 = a2 >> 62;
  unint64_t v33 = a3;
  uint64_t v31 = v5;
  unint64_t v28 = v5 & 0xC000000000000001;
  while (2)
  {
    if (v8) {
      uint64_t result = MEMORY[0x22A631010](v7, v5);
    }
    else {
      uint64_t result = swift_retain();
    }
    BOOL v11 = __OFADD__(v7, 1);
    uint64_t v12 = v7 + 1;
    if (!v11)
    {
      if (v32)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_2256590F0();
      }
      else
      {
        uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_retain();
        swift_bridgeObjectRetain();
      }
      if (!v13)
      {
LABEL_47:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v25 = 0;
LABEL_52:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v25;
      }
      uint64_t v30 = v12;
      uint64_t v5 = 4;
      while (1)
      {
        if (v9) {
          MEMORY[0x22A631010](v5 - 4, a2);
        }
        else {
          swift_retain();
        }
        uint64_t v14 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }
        sub_22564F850();
        char v16 = v15;
        swift_release();
        if (v16) {
          break;
        }
        ++v5;
        if (v14 == v13) {
          goto LABEL_47;
        }
      }
      swift_release();
      swift_bridgeObjectRelease();
      if (v32)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v17 = sub_2256590F0();
      }
      else
      {
        uint64_t v17 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t v7 = v30;
      if (v17)
      {
        uint64_t v18 = 0;
        uint64_t v26 = v17;
LABEL_25:
        if (v9) {
          uint64_t result = MEMORY[0x22A631010](v18, a2);
        }
        else {
          uint64_t result = swift_retain();
        }
        BOOL v11 = __OFADD__(v18, 1);
        uint64_t v19 = v18 + 1;
        if (!v11)
        {
          uint64_t v27 = v19;
          if (a3 >> 62)
          {
            swift_bridgeObjectRetain();
            swift_retain();
            uint64_t v20 = sub_2256590F0();
          }
          else
          {
            uint64_t v20 = *(void *)(v29 + 16);
            swift_bridgeObjectRetain();
            swift_retain();
          }
          if (!v20)
          {
LABEL_46:
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_47;
          }
          uint64_t v21 = 4;
          while (1)
          {
            if (v34)
            {
              uint64_t v5 = MEMORY[0x22A631010](v21 - 4, a3);
            }
            else
            {
              uint64_t v5 = *(void *)(a3 + 8 * v21);
              swift_retain();
            }
            a3 = v21 - 3;
            if (__OFADD__(v21 - 4, 1)) {
              goto LABEL_49;
            }
            sub_22564F850();
            char v23 = v22;
            swift_release();
            if (v23)
            {
              swift_release_n();
              a3 = v33;
              swift_bridgeObjectRelease();
              uint64_t v18 = v27;
              uint64_t v7 = v30;
              if (v27 != v26) {
                goto LABEL_25;
              }
              goto LABEL_43;
            }
            ++v21;
            BOOL v24 = a3 == v20;
            a3 = v33;
            if (v24) {
              goto LABEL_46;
            }
          }
        }
        goto LABEL_54;
      }
LABEL_43:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v8 = v28;
      uint64_t v5 = v31;
      if (v7 != v6) {
        continue;
      }
LABEL_51:
      swift_bridgeObjectRelease();
      uint64_t v25 = 1;
      goto LABEL_52;
    }
    break;
  }
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_22564D458(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = 0;
      unint64_t v6 = v3 & 0xC000000000000001;
      uint64_t v15 = v4;
      unint64_t v7 = a2 >> 62;
      uint64_t v16 = v3;
      unint64_t v14 = v3 & 0xC000000000000001;
LABEL_4:
      if (v6) {
        MEMORY[0x22A631010](v5, v3);
      }
      else {
        swift_retain();
      }
      if (!__OFADD__(v5++, 1)) {
        break;
      }
LABEL_24:
      __break(1u);
LABEL_25:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2256590F0();
      if (!v4) {
        goto LABEL_26;
      }
    }
    if (v7)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2256590F0();
    }
    else
    {
      uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_retain();
      swift_bridgeObjectRetain();
    }
    if (!v9)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_release_n();
      return 0;
    }
    uint64_t v10 = 4;
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0) {
        MEMORY[0x22A631010](v10 - 4, a2);
      }
      else {
        swift_retain();
      }
      uint64_t v3 = v10 - 3;
      if (__OFADD__(v10 - 4, 1))
      {
        __break(1u);
        goto LABEL_24;
      }
      sub_22564F850();
      char v12 = v11;
      swift_release();
      if (v12) {
        break;
      }
      ++v10;
      if (v3 == v9) {
        goto LABEL_22;
      }
    }
    swift_release_n();
    swift_bridgeObjectRelease();
    unint64_t v6 = v14;
    uint64_t v3 = v16;
    unint64_t v7 = a2 >> 62;
    if (v5 != v15) {
      goto LABEL_4;
    }
  }
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

void sub_22564D674()
{
  OUTLINED_FUNCTION_54();
  sub_225658810();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v4;
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = v6 - v5;
  sub_225658AF0();
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v9;
  uint64_t v32 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_22_2(v10, v29);
  sub_225658AC0();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v12;
  uint64_t v37 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5();
  uint64_t v35 = v13;
  OUTLINED_FUNCTION_34();
  sub_2256585F0();
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v15;
  uint64_t v40 = v14;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_5();
  uint64_t v38 = v16;
  uint64_t v17 = sub_225658120();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_26_2();
  sub_2256588D0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_3_0();
  uint64_t v21 = sub_225658620();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_8_2();
  if (sub_225658780())
  {
    sub_225658800();
    sub_22564EBA4();
    OUTLINED_FUNCTION_20_1();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v2, v21);
  }
  else if (sub_225658790())
  {
    sub_225658760();
    sub_22564ECF8();
    OUTLINED_FUNCTION_20_1();
    OUTLINED_FUNCTION_17_0();
    v25();
  }
  else if (sub_225658750())
  {
    sub_2256587E0();
    sub_22564F080();
    OUTLINED_FUNCTION_20_1();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v1, v17);
  }
  else
  {
    if (sub_225658770())
    {
      uint64_t v26 = v38;
      sub_2256587F0();
      sub_22564F1D4();
      OUTLINED_FUNCTION_20_1();
      uint64_t v28 = v39;
      uint64_t v27 = v40;
    }
    else if (sub_2256587C0())
    {
      uint64_t v26 = v35;
      sub_2256587A0();
      sub_22564F5A8();
      OUTLINED_FUNCTION_20_1();
      uint64_t v28 = v36;
      uint64_t v27 = v37;
    }
    else
    {
      if ((sub_2256587D0() & 1) == 0)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v7, v0, v34);
        sub_225658E10();
        OUTLINED_FUNCTION_20_1();
        goto LABEL_14;
      }
      uint64_t v26 = v30;
      sub_2256587B0();
      sub_22564F6FC();
      OUTLINED_FUNCTION_20_1();
      uint64_t v28 = v31;
      uint64_t v27 = v32;
    }
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
  }
LABEL_14:
  OUTLINED_FUNCTION_52();
}

uint64_t sub_22564D9D0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x454E4F4850;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x454E4F4850;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 4473168;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x4E414D4553524F48;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1398097242;
      break;
    case 4:
      uint64_t v5 = 0x4F454D4143;
      break;
    case 5:
      uint64_t v5 = 0x4843544157;
      break;
    case 6:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 5390659;
      break;
    case 7:
      uint64_t v5 = 0x544952414752414DLL;
      unint64_t v3 = 0xE900000000000041;
      break;
    case 8:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v2 = 4473168;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x4E414D4553524F48;
      break;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1398097242;
      break;
    case 4:
      uint64_t v2 = 0x4F454D4143;
      break;
    case 5:
      uint64_t v2 = 0x4843544157;
      break;
    case 6:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v2 = 5390659;
      break;
    case 7:
      uint64_t v2 = 0x544952414752414DLL;
      unint64_t v6 = 0xE900000000000041;
      break;
    case 8:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2256591A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22564DC14(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  unint64_t v4 = 25705;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x7865547475706E69;
      unint64_t v3 = 0xE900000000000074;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v4 = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t v4 = 0x63617073656D616ELL;
      goto LABEL_10;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v4 = 0x656372756F73;
      break;
    case 5:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v4 = 0x6E6F697461657263;
      break;
    case 6:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v4 = 0x64656C62616E65;
      break;
    case 7:
      unint64_t v4 = 0x656469727265766FLL;
      unint64_t v3 = 0xEA00000000006449;
      break;
    case 8:
      unint64_t v4 = 0x7372615072657375;
LABEL_10:
      unint64_t v3 = 0xE900000000000065;
      break;
    case 9:
      unint64_t v3 = 0x800000022565A8E0;
      unint64_t v4 = 0xD000000000000017;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE200000000000000;
  unint64_t v6 = 25705;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x7865547475706E69;
      unint64_t v5 = 0xE900000000000074;
      break;
    case 2:
      unint64_t v5 = 0xE600000000000000;
      unint64_t v6 = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t v6 = 0x63617073656D616ELL;
      goto LABEL_21;
    case 4:
      unint64_t v5 = 0xE600000000000000;
      unint64_t v6 = 0x656372756F73;
      break;
    case 5:
      unint64_t v5 = 0xE800000000000000;
      unint64_t v6 = 0x6E6F697461657263;
      break;
    case 6:
      unint64_t v5 = 0xE700000000000000;
      unint64_t v6 = 0x64656C62616E65;
      break;
    case 7:
      unint64_t v6 = 0x656469727265766FLL;
      unint64_t v5 = 0xEA00000000006449;
      break;
    case 8:
      unint64_t v6 = 0x7372615072657375;
LABEL_21:
      unint64_t v5 = 0xE900000000000065;
      break;
    case 9:
      unint64_t v5 = 0x800000022565A8E0;
      unint64_t v6 = 0xD000000000000017;
      break;
    default:
      break;
  }
  if (v4 == v6 && v3 == v5) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2256591A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22564DED4(uint64_t a1, uint64_t a2, void (*a3)(char *, char *), uint64_t a4)
{
  uint64_t v60 = a3;
  uint64_t v61 = a4;
  uint64_t matched = type metadata accessor for TurnInputRuleMatchResult(0);
  uint64_t v59 = *(void *)(matched - 8);
  uint64_t v7 = MEMORY[0x270FA5388](matched - 8);
  uint64_t v65 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v52 = (uint64_t)&v48 - v9;
  uint64_t v10 = sub_225658B50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v53 = (char *)&v48 - v15;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58338);
  uint64_t v16 = MEMORY[0x270FA5388](v57);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v50 = (char *)&v48 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v49 = (uint64_t)&v48 - v21;
  unint64_t v22 = *(void *)(a1 + 16);
  unint64_t v63 = *(void *)(a2 + 16);
  unint64_t v64 = v22;
  if (v63 >= v22) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v63;
  }
  uint64_t v66 = MEMORY[0x263F8EE78];
  sub_225626C18();
  uint64_t v62 = a1;
  uint64_t v58 = v11;
  unint64_t v56 = v23;
  if (v23)
  {
    uint64_t v54 = (void (**)(char *))(v11 + 32);
    uint64_t v55 = v11 + 16;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v25 = 0;
    unint64_t v26 = v64;
    while (v26 != v25)
    {
      uint64_t result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v11 + 16))(v14, a1+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v25, v10);
      if (v63 == v25) {
        goto LABEL_29;
      }
      uint64_t v27 = sub_2256585D0();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = a2;
      unint64_t v30 = a2
          + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))
          + *(void *)(v28 + 72) * v25;
      uint64_t v31 = v14;
      uint64_t v32 = &v18[*(int *)(v57 + 48)];
      uint64_t v33 = v31;
      (*v54)(v18);
      (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v32, v30, v27);
      v60(v18, v32);
      sub_22562793C((uint64_t)v18, &qword_26AD58338);
      uint64_t v34 = v66;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225626C18();
        uint64_t v34 = v66;
      }
      unint64_t v35 = *(void *)(v34 + 16);
      a1 = v62;
      if (v35 >= *(void *)(v34 + 24) >> 1)
      {
        sub_225626C18();
        uint64_t v34 = v66;
      }
      ++v25;
      *(void *)(v34 + 16) = v35 + 1;
      uint64_t result = sub_22562C2C0(v65, v34+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v35, (void (*)(void))type metadata accessor for TurnInputRuleMatchResult);
      a2 = v29;
      uint64_t v11 = v58;
      unint64_t v26 = v64;
      uint64_t v14 = v33;
      if (v56 == v25) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v26 = v64;
LABEL_15:
    uint64_t v51 = a2;
    unint64_t v36 = v63;
    unint64_t v37 = v56;
    if (v26 <= v63)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v66;
    }
    uint64_t v65 = v11 + 16;
    uint64_t v38 = (void (**)(uint64_t, char *, uint64_t))(v11 + 32);
    uint64_t v39 = (uint64_t)v50;
    while (v37 < v26)
    {
      uint64_t result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v11 + 16))(v53, a1+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v37, v10);
      if (v36 == v37)
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v53, v10);
        goto LABEL_27;
      }
      if (v37 >= v36) {
        goto LABEL_31;
      }
      uint64_t v40 = sub_2256585D0();
      uint64_t v41 = *(void *)(v40 - 8);
      unint64_t v42 = v51
          + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))
          + *(void *)(v41 + 72) * v37;
      uint64_t v43 = v57;
      uint64_t v44 = v39 + *(int *)(v57 + 48);
      (*v38)(v39, v53, v10);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v41 + 16))(v44, v42, v40);
      uint64_t v45 = v49;
      sub_225653B70(v39, v49, &qword_26AD58338);
      v60((char *)v45, (char *)(v45 + *(int *)(v43 + 48)));
      sub_22562793C(v45, &qword_26AD58338);
      uint64_t v46 = v66;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225626C18();
        uint64_t v46 = v66;
      }
      unint64_t v47 = *(void *)(v46 + 16);
      uint64_t v11 = v58;
      unint64_t v36 = v63;
      if (v47 >= *(void *)(v46 + 24) >> 1)
      {
        sub_225626C18();
        uint64_t v46 = v66;
      }
      ++v37;
      *(void *)(v46 + 16) = v47 + 1;
      uint64_t result = sub_22562C2C0(v52, v46+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v47, (void (*)(void))type metadata accessor for TurnInputRuleMatchResult);
      unint64_t v26 = v64;
      a1 = v62;
      if (v64 == v37) {
        goto LABEL_27;
      }
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_22564E5B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v1 = sub_225658910();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v33 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v31 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_225658A00();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_225658850();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_225658160();
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v40 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_225657FD0();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_225657F90();
  uint64_t v45 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_225658A90();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_225658660();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_225658170())
  {
    sub_225658200();
    uint64_t v23 = v46;
    sub_225658650();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    uint64_t v24 = sub_225657DD0();
    uint64_t v25 = v23;
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v24);
  }
  uint64_t v26 = v46;
  if (sub_225658280())
  {
    sub_225658250();
    sub_225658A80();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
LABEL_18:
    uint64_t v24 = sub_225657DD0();
    uint64_t v25 = v26;
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v24);
  }
  if (sub_225658180())
  {
    sub_2256582A0();
    sub_225657F80();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v12);
    goto LABEL_18;
  }
  if (sub_225658190())
  {
    sub_2256582C0();
    sub_225657FC0();
    uint64_t v28 = v43;
    uint64_t v27 = v44;
LABEL_17:
    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v27);
    goto LABEL_18;
  }
  if (sub_2256581C0())
  {
    uint64_t v11 = v40;
    sub_2256582E0();
    sub_225658150();
    uint64_t v28 = v41;
    uint64_t v27 = v42;
    goto LABEL_17;
  }
  if (sub_225658230())
  {
    uint64_t v11 = v37;
    sub_2256581B0();
    sub_225658840();
    uint64_t v28 = v38;
    uint64_t v27 = v39;
    goto LABEL_17;
  }
  if (sub_225658270())
  {
    uint64_t v11 = v34;
    sub_225658220();
    sub_2256589F0();
    uint64_t v28 = v35;
    uint64_t v27 = v36;
    goto LABEL_17;
  }
  if (sub_225658260())
  {
    uint64_t v11 = v31;
    sub_2256581E0();
    sub_225658900();
    uint64_t v28 = v32;
    uint64_t v27 = v33;
    goto LABEL_17;
  }
  uint64_t v30 = sub_225657DD0();
  return __swift_storeEnumTagSinglePayload(v26, 1, 1, v30);
}

unint64_t sub_22564EBA4()
{
  uint64_t v0 = sub_225657DD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_225658610())
  {
    sub_225658600();
    sub_225636578();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_225659050();
  swift_bridgeObjectRelease();
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x800000022565BBD0;
  sub_225658E50();
  swift_bridgeObjectRelease();
  sub_225658E50();
  return v5;
}

uint64_t sub_22564ECF8()
{
  uint64_t v0 = sub_2256582F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225657DE0();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v25 = (void *)MEMORY[0x263F8EE78];
    sub_225626BF8(0, v5, 0);
    uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    uint64_t v6 = v1 + 16;
    uint64_t v8 = *(unsigned __int8 *)(v6 + 64);
    v21[1] = v4;
    uint64_t v9 = v4 + ((v8 + 32) & ~v8);
    uint64_t v22 = *(void *)(v6 + 56);
    uint64_t v23 = v7;
    uint64_t v10 = (void (**)(char *, uint64_t))(v6 - 8);
    uint64_t v24 = v6;
    do
    {
      v23(v3, v9, v0);
      uint64_t v11 = sub_225635E20();
      uint64_t v13 = v12;
      (*v10)(v3, v0);
      uint64_t v14 = (uint64_t)v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225626BF8(0, *(void *)(v14 + 16) + 1, 1);
        uint64_t v14 = (uint64_t)v25;
      }
      unint64_t v16 = *(void *)(v14 + 16);
      unint64_t v15 = *(void *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_225626BF8(v15 > 1, v16 + 1, 1);
        uint64_t v14 = (uint64_t)v25;
      }
      *(void *)(v14 + 16) = v16 + 1;
      uint64_t v17 = v14 + 16 * v16;
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v13;
      v9 += v22;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  sub_22564EFCC(v14);
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_225652300(v18);
  swift_bridgeObjectRelease();
  uint64_t v25 = v19;
  sub_225652554((uint64_t *)&v25);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
  sub_225636790();
  sub_225658DD0();
  swift_release();
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  sub_225659050();
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)0xD00000000000001ALL;
  unint64_t v26 = 0x800000022565AA40;
  sub_225658E50();
  swift_bridgeObjectRelease();
  sub_225658E50();
  return (uint64_t)v25;
}

uint64_t sub_22564EFCC(uint64_t a1)
{
  uint64_t v2 = sub_225658F50();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_225652EE8(&v9, v5, v6);
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

unint64_t sub_22564F080()
{
  uint64_t v0 = sub_2256582F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_225658100())
  {
    sub_225658110();
    sub_225635E20();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_225659050();
  swift_bridgeObjectRelease();
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x800000022565AA20;
  sub_225658E50();
  swift_bridgeObjectRelease();
  sub_225658E50();
  return v5;
}

uint64_t sub_22564F1D4()
{
  uint64_t v23 = sub_225657DD0();
  uint64_t v0 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v2 = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_225657DE0();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    unint64_t v28 = MEMORY[0x263F8EE78];
    sub_225626BF8(0, v4, 0);
    unint64_t v5 = *(void (**)(char *, unint64_t, uint64_t))(v0 + 16);
    uint64_t v26 = v0 + 16;
    uint64_t v27 = v5;
    unint64_t v6 = v3 + ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v24 = (void (**)(char *, uint64_t))(v0 + 8);
    uint64_t v25 = v7;
    v22[0] = v3;
    v22[1] = "[task extraction failed]";
    uint64_t v8 = v23;
    while (1)
    {
      v27(v2, v6, v8);
      sub_225658BF0();
      uint64_t v9 = swift_retain();
      unint64_t v10 = MEMORY[0x22A630BC0](v9);
      unint64_t v11 = v10;
      if (v10 >> 62)
      {
        uint64_t result = sub_2256590F0();
        if (result)
        {
LABEL_5:
          if ((v11 & 0xC000000000000001) != 0)
          {
            MEMORY[0x22A631010](0, v11);
          }
          else
          {
            if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return result;
            }
            swift_retain();
          }
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v13 = sub_225658CE0();
          unint64_t v15 = v14;
          swift_release();
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t result = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (result) {
          goto LABEL_5;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v16 = sub_225658C30();
      swift_release();
      if (!v16)
      {
        swift_release();
        unint64_t v15 = 0xEB000000005D7974;
        uint64_t v13 = 0x69746E65206F6E5BLL;
        goto LABEL_13;
      }
      uint64_t v13 = sub_225658CD0();
      unint64_t v15 = v17;
      swift_release();
LABEL_12:
      swift_release();
LABEL_13:
      uint64_t v8 = v23;
      (*v24)(v2, v23);
      unint64_t v18 = v28;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225626BF8(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v8 = v23;
        unint64_t v18 = v28;
      }
      unint64_t v20 = *(void *)(v18 + 16);
      unint64_t v19 = *(void *)(v18 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_225626BF8(v19 > 1, v20 + 1, 1);
        uint64_t v8 = v23;
        unint64_t v18 = v28;
      }
      *(void *)(v18 + 16) = v20 + 1;
      unint64_t v21 = v18 + 16 * v20;
      *(void *)(v21 + 32) = v13;
      *(void *)(v21 + 40) = v15;
      v6 += v25;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v18 = MEMORY[0x263F8EE78];
LABEL_22:
  unint64_t v28 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD581F0);
  sub_225636790();
  sub_225658DD0();
  swift_bridgeObjectRelease();
  unint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_225659050();
  swift_bridgeObjectRelease();
  unint64_t v28 = 0xD000000000000018;
  unint64_t v29 = 0x800000022565AA00;
  sub_225658E50();
  swift_bridgeObjectRelease();
  sub_225658E50();
  return v28;
}

unint64_t sub_22564F5A8()
{
  uint64_t v0 = sub_225657DD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_225658AB0())
  {
    sub_225658AA0();
    sub_225636578();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_225659050();
  swift_bridgeObjectRelease();
  unint64_t v5 = 0xD00000000000001BLL;
  unint64_t v6 = 0x800000022565A9E0;
  sub_225658E50();
  swift_bridgeObjectRelease();
  sub_225658E50();
  return v5;
}

unint64_t sub_22564F6FC()
{
  uint64_t v0 = sub_225657DD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_225658AE0())
  {
    sub_225658AD0();
    sub_225636578();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_225659050();
  swift_bridgeObjectRelease();
  unint64_t v5 = 0xD00000000000001BLL;
  unint64_t v6 = 0x800000022565A9C0;
  sub_225658E50();
  swift_bridgeObjectRelease();
  sub_225658E50();
  return v5;
}

void sub_22564F850()
{
  OUTLINED_FUNCTION_54();
  uint64_t v151 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681028B8);
  uint64_t v3 = OUTLINED_FUNCTION_5_4(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2_2();
  uint64_t v123 = v4;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_26();
  uint64_t v122 = v6;
  OUTLINED_FUNCTION_34();
  uint64_t v152 = sub_225658CB0();
  OUTLINED_FUNCTION_0();
  uint64_t v141 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_2();
  uint64_t v144 = v9;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_26();
  uint64_t v143 = v11;
  OUTLINED_FUNCTION_34();
  uint64_t v148 = sub_225658C80();
  OUTLINED_FUNCTION_0();
  uint64_t v142 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2_2();
  uint64_t v125 = v14;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_39_0(v16);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681028C0);
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_39_0(v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681028C8);
  uint64_t v20 = OUTLINED_FUNCTION_5_4(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2_2();
  uint64_t v133 = v21;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_25();
  uint64_t v132 = v23;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_39_0(v25);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681028D0);
  uint64_t v27 = OUTLINED_FUNCTION_5_4(v26);
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2_2();
  uint64_t v127 = v28;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_25();
  uint64_t v126 = v30;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_25();
  uint64_t v130 = v32;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_25();
  uint64_t v129 = v34;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_45_0();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_26();
  uint64_t v155 = v37;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681028D8);
  uint64_t v39 = OUTLINED_FUNCTION_5_4(v38);
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_2_2();
  uint64_t v135 = v40;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_39_0(v42);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  uint64_t v44 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v147 = (uint64_t)&v120 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v46);
  uint64_t v156 = (uint64_t)&v120 - v47;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v48);
  uint64_t v50 = (char *)&v120 - v49;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102820);
  uint64_t v51 = *(unsigned __int8 *)(v44 + 80);
  uint64_t v52 = (v51 + 32) & ~v51;
  uint64_t v154 = v52 + *(void *)(v44 + 72);
  uint64_t v149 = v51 | 7;
  uint64_t v53 = swift_allocObject();
  long long v146 = xmmword_225659D50;
  *(_OWORD *)(v53 + 16) = xmmword_225659D50;
  uint64_t v54 = sub_225658C60();
  __swift_storeEnumTagSinglePayload(v53 + v52, 1, 1, v54);
  sub_225658CC0();
  uint64_t v158 = v53;
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = v146;
  uint64_t v56 = v55 + v52;
  uint64_t v57 = (uint64_t)v50;
  uint64_t v154 = v43;
  __swift_storeEnumTagSinglePayload(v56, 1, 1, v54);
  sub_225658CC0();
  uint64_t v157 = v55;
  char v145 = (void (**)(uint64_t, char *, uint64_t))(v141 + 16);
  uint64_t v128 = v54;
  uint64_t v149 = v54 - 8;
  uint64_t v121 = (void (**)(uint64_t, uint64_t, uint64_t))((char *)v142 + 32);
  uint64_t v138 = (void (**)(void))((char *)v142 + 8);
  char v124 = (void (**)(void))(v141 + 32);
  BOOL v58 = *(void *)(v53 + 16) == 0;
  *(void *)&long long v146 = v141 + 8;
  uint64_t v150 = v0;
  uint64_t v153 = v50;
  while (!v58)
  {
    uint64_t v59 = v136;
    sub_2256485B4(v53, v136);
    OUTLINED_FUNCTION_8_4(v59, 1, v154);
    if (v89) {
      goto LABEL_51;
    }
    sub_225653B70(v59, v57, &qword_268102828);
    if (!*(void *)(v53 + 16)) {
      goto LABEL_48;
    }
    sub_22563A3CC(0, 1);
    if (!*(void *)(v55 + 16)) {
      goto LABEL_49;
    }
    uint64_t v60 = v135;
    sub_2256485B4(v55, v135);
    uint64_t v61 = v154;
    OUTLINED_FUNCTION_8_4(v60, 1, v154);
    if (v89) {
      goto LABEL_52;
    }
    uint64_t v62 = *(int *)(v61 + 48);
    uint64_t v63 = v60;
    uint64_t v64 = v156;
    sub_225653B70(v63, v156, &qword_268102828);
    if (!*(void *)(v55 + 16)) {
      goto LABEL_50;
    }
    uint64_t v65 = (uint64_t)v153;
    uint64_t v66 = &v153[v62];
    uint64_t v151 = (char *)(v64 + v62);
    sub_22563A3CC(0, 1);
    uint64_t v67 = v147;
    uint64_t v68 = v147 + *(int *)(v61 + 48);
    sub_22564A53C(v65, v147, &qword_2681028D0);
    unint64_t v69 = *v145;
    unint64_t v140 = v66;
    uint64_t v70 = v152;
    v69(v68, v66, v152);
    uint64_t v71 = v155;
    sub_225653B70(v67, v155, &qword_2681028D0);
    unint64_t v72 = *(void (**)(void))v146;
    OUTLINED_FUNCTION_9_5();
    v72();
    uint64_t v73 = v67 + *(int *)(v61 + 48);
    sub_22564A53C(v156, v67, &qword_2681028D0);
    uint64_t v141 = (char *)v69;
    v69(v73, v151, v70);
    uint64_t v74 = v150;
    sub_225653B70(v67, v150, &qword_2681028D0);
    uint64_t v142 = v72;
    OUTLINED_FUNCTION_9_5();
    v72();
    uint64_t v75 = v71;
    uint64_t v76 = v129;
    sub_22564A53C(v75, v129, &qword_2681028D0);
    uint64_t v77 = v128;
    OUTLINED_FUNCTION_8_4(v76, 1, v128);
    if (v89)
    {
      sub_22562793C(v76, &qword_2681028D0);
      uint64_t v80 = 1;
      uint64_t v81 = v130;
      uint64_t v78 = v131;
    }
    else
    {
      uint64_t v78 = v131;
      sub_225658C50();
      OUTLINED_FUNCTION_9_0();
      v79();
      uint64_t v80 = 0;
      uint64_t v81 = v130;
    }
    uint64_t v82 = v132;
    uint64_t v83 = v148;
    __swift_storeEnumTagSinglePayload(v78, v80, 1, v148);
    sub_22564A53C(v74, v81, &qword_2681028D0);
    OUTLINED_FUNCTION_8_4(v81, 1, v77);
    if (v89)
    {
      sub_22562793C(v81, &qword_2681028D0);
      uint64_t v85 = 1;
    }
    else
    {
      sub_225658C50();
      OUTLINED_FUNCTION_9_0();
      v84();
      uint64_t v85 = 0;
    }
    uint64_t v86 = v133;
    __swift_storeEnumTagSinglePayload(v82, v85, 1, v83);
    uint64_t v87 = v139;
    uint64_t v88 = v139 + *(int *)(v134 + 48);
    sub_22564A53C(v78, v139, &qword_2681028C8);
    sub_22564A53C(v82, v88, &qword_2681028C8);
    OUTLINED_FUNCTION_8_4(v87, 1, v83);
    if (v89)
    {
      sub_22562793C(v82, &qword_2681028C8);
      sub_22562793C(v78, &qword_2681028C8);
      OUTLINED_FUNCTION_8_4(v88, 1, v83);
      if (!v89) {
        goto LABEL_41;
      }
      sub_22562793C(v139, &qword_2681028C8);
    }
    else
    {
      sub_22564A53C(v87, v86, &qword_2681028C8);
      OUTLINED_FUNCTION_8_4(v88, 1, v83);
      if (v89)
      {
        sub_22562793C(v82, &qword_2681028C8);
        sub_22562793C(v78, &qword_2681028C8);
        ((void (*)(uint64_t, uint64_t))*v138)(v86, v83);
LABEL_41:
        sub_22562793C(v139, &qword_2681028C0);
LABEL_42:
        uint64_t v119 = v74;
LABEL_43:
        sub_22562793C(v119, &qword_2681028D0);
        sub_22562793C(v155, &qword_2681028D0);
        sub_22562793C(v156, &qword_268102828);
        uint64_t v117 = (uint64_t)v153;
        goto LABEL_44;
      }
      (*v121)(v137, v88, v83);
      sub_225653BC8(&qword_2681028E0, MEMORY[0x263F73710]);
      char v90 = sub_225658DE0();
      uint64_t v91 = *v138;
      OUTLINED_FUNCTION_28();
      v91();
      sub_22562793C(v82, &qword_2681028C8);
      uint64_t v74 = v150;
      sub_22562793C(v78, &qword_2681028C8);
      OUTLINED_FUNCTION_28();
      v91();
      sub_22562793C(v87, &qword_2681028C8);
      if ((v90 & 1) == 0) {
        goto LABEL_42;
      }
    }
    uint64_t v92 = v126;
    sub_22564A53C(v155, v126, &qword_2681028D0);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v92, 1, v77);
    uint64_t v94 = (uint64_t)v153;
    if (EnumTagSinglePayload == 1)
    {
      sub_22562793C(v92, &qword_2681028D0);
      int v95 = 0;
    }
    else
    {
      int v95 = sub_225658C40();
      OUTLINED_FUNCTION_9_0();
      v96();
    }
    uint64_t v97 = v127;
    sub_22564A53C(v74, v127, &qword_2681028D0);
    OUTLINED_FUNCTION_8_4(v97, 1, v77);
    if (v89)
    {
      sub_22562793C(v97, &qword_2681028D0);
      if (EnumTagSinglePayload != 1) {
        goto LABEL_37;
      }
    }
    else
    {
      int v98 = sub_225658C40();
      OUTLINED_FUNCTION_9_0();
      v99();
      if (EnumTagSinglePayload == 1 || v95 != v98)
      {
LABEL_37:
        sub_22562793C(v74, &qword_2681028D0);
        sub_22562793C(v155, &qword_2681028D0);
        sub_22562793C(v156, &qword_268102828);
        uint64_t v117 = v94;
LABEL_44:
        sub_22562793C(v117, &qword_268102828);
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
    }
    uint64_t v101 = v154;
    uint64_t v102 = v147;
    uint64_t v103 = v147 + *(int *)(v154 + 48);
    sub_22564A53C(v94, v147, &qword_2681028D0);
    unint64_t v104 = (void (*)(uint64_t, uint64_t, uint64_t))v141;
    uint64_t v105 = v152;
    ((void (*)(uint64_t, char *, uint64_t))v141)(v103, v140, v152);
    unint64_t v106 = *v124;
    OUTLINED_FUNCTION_29_2();
    v106();
    sub_22562793C(v102, &qword_2681028D0);
    uint64_t v107 = v102 + *(int *)(v101 + 48);
    sub_22564A53C(v156, v102, &qword_2681028D0);
    v104(v107, (uint64_t)v151, v105);
    OUTLINED_FUNCTION_29_2();
    v106();
    sub_22562793C(v102, &qword_2681028D0);
    sub_225658CA0();
    sub_225658CA0();
    sub_225653BC8(&qword_2681028E0, MEMORY[0x263F73710]);
    LOBYTE(v107) = sub_225658DE0();
    uint64_t v108 = *v138;
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_28();
    v108();
    OUTLINED_FUNCTION_28();
    v108();
    if ((v107 & 1) == 0)
    {
      char v118 = v142;
      OUTLINED_FUNCTION_40();
      v118();
      OUTLINED_FUNCTION_40();
      v118();
      uint64_t v119 = v150;
      goto LABEL_43;
    }
    sub_225658C70();
    uint64_t v109 = v122;
    OUTLINED_FUNCTION_47_0();
    uint64_t v110 = v123;
    OUTLINED_FUNCTION_44_0();
    sub_225658C90();
    sub_22562793C(v110, &qword_2681028B8);
    sub_22562793C(v109, &qword_2681028B8);
    uint64_t v111 = sub_225658C00();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_44_0();
    sub_225658C90();
    sub_22562793C(v110, &qword_2681028B8);
    uint64_t v112 = v109;
    uint64_t v57 = (uint64_t)v153;
    sub_22562793C(v112, &qword_2681028B8);
    uint64_t v113 = sub_225658C00();
    swift_bridgeObjectRelease();
    uint64_t v114 = sub_225650780(v111);
    swift_bridgeObjectRelease();
    sub_225626218(v114);
    uint64_t v115 = sub_225650780(v113);
    swift_bridgeObjectRelease();
    sub_225626218(v115);
    uint64_t v116 = v142;
    OUTLINED_FUNCTION_40();
    v116();
    OUTLINED_FUNCTION_40();
    v116();
    sub_22562793C(v150, &qword_2681028D0);
    sub_22562793C(v155, &qword_2681028D0);
    sub_22562793C(v156, &qword_268102828);
    sub_22562793C(v57, &qword_268102828);
    uint64_t v53 = v158;
    if (!*(void *)(v158 + 16))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_46:
      OUTLINED_FUNCTION_52();
      return;
    }
    BOOL v58 = 0;
    uint64_t v55 = v157;
    if (!*(void *)(v157 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_45:
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
}

uint64_t sub_225650780(uint64_t a1)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681028E8);
  uint64_t v2 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102828);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_225626C78();
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v12 = *(void *)(v2 + 72);
    uint64_t v10 = v16;
    do
    {
      sub_22564A53C(v11, (uint64_t)v4, &qword_2681028E8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225626C78();
        uint64_t v10 = v16;
      }
      unint64_t v13 = *(void *)(v10 + 16);
      if (v13 >= *(void *)(v10 + 24) >> 1)
      {
        sub_225626C78();
        uint64_t v10 = v16;
      }
      *(void *)(v10 + 16) = v13 + 1;
      sub_225653B70((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v13, &qword_268102828);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

void sub_2256509C4()
{
  OUTLINED_FUNCTION_54();
  uint64_t v2 = v1;
  uint64_t v3 = sub_225657DD0();
  OUTLINED_FUNCTION_0();
  uint64_t v136 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_2();
  uint64_t v122 = v6;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_25();
  uint64_t v123 = v8;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_25();
  uint64_t v131 = v10;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_25();
  uint64_t v127 = v12;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_25();
  unint64_t v130 = v14;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_26();
  uint64_t v126 = v16;
  uint64_t v138 = sub_2256582F0();
  OUTLINED_FUNCTION_0();
  uint64_t v125 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_37_0();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102818);
  uint64_t v20 = OUTLINED_FUNCTION_4_2(v19);
  uint64_t v139 = v21;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_8_1();
  uint64_t v24 = v22 - v23;
  MEMORY[0x270FA5388](v25);
  uint64_t v133 = (uint64_t)v121 - v26;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_25();
  uint64_t v137 = v28;
  OUTLINED_FUNCTION_6_1();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)v121 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v132 = (uint64_t)v121 - v33;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (char *)v121 - v35;
  uint64_t v37 = sub_2256588D0();
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v38;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_2_2();
  uint64_t v124 = v41;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v42);
  if (sub_225658790())
  {
    uint64_t v129 = v32;
    v121[4] = v2;
    sub_225658760();
    uint64_t v43 = sub_225657DE0();
    uint64_t v44 = *(void *)(v39 + 8);
    uint64_t v45 = v43;
    v121[3] = v37;
    v121[2] = v39 + 8;
    v121[1] = v44;
    OUTLINED_FUNCTION_28();
    v46();
    uint64_t v47 = *(void *)(v45 + 16);
    uint64_t v134 = v24;
    unint64_t v135 = v3;
    if (v47)
    {
      unint64_t v140 = MEMORY[0x263F8EE78];
      sub_225626BD8();
      uint64_t v48 = v125 + 16;
      uint64_t v128 = *(void (**)(uint64_t))(v125 + 16);
      OUTLINED_FUNCTION_15_1();
      v121[0] = v45;
      v45 += v49;
      uint64_t v50 = *(void *)(v48 + 56);
      do
      {
        uint64_t v51 = OUTLINED_FUNCTION_33_0();
        uint64_t v52 = v138;
        v128(v51);
        sub_22564E5B0((uint64_t)v36);
        (*(void (**)(uint64_t, uint64_t))(v48 - 8))(v0, v52);
        unint64_t v53 = v140;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_32_1();
          unint64_t v53 = v140;
        }
        unint64_t v54 = *(void *)(v53 + 16);
        if (v54 >= *(void *)(v53 + 24) >> 1)
        {
          sub_225626BD8();
          unint64_t v53 = v140;
        }
        *(void *)(v53 + 16) = v54 + 1;
        OUTLINED_FUNCTION_24_0();
        sub_225653B70((uint64_t)v36, v55 + v56 * v54, &qword_268102818);
        v45 += v50;
        --v47;
      }
      while (v47);
      swift_bridgeObjectRelease();
      uint64_t v24 = v134;
      uint64_t v3 = v135;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v53 = MEMORY[0x263F8EE78];
    }
    uint64_t v57 = *(void *)(v53 + 16);
    uint64_t v58 = v137;
    if (v57)
    {
      v121[0] = v0;
      OUTLINED_FUNCTION_21_2();
      uint64_t v128 = *(void (**)(uint64_t))(v59 + 72);
      uint64_t v60 = (void (**)(void))(v136 + 32);
      swift_bridgeObjectRetain();
      uint64_t v61 = MEMORY[0x263F8EE78];
      do
      {
        uint64_t v62 = v132;
        sub_22564A53C(v45, v132, &qword_268102818);
        uint64_t v63 = v62;
        uint64_t v64 = (uint64_t)v129;
        sub_225653B70(v63, (uint64_t)v129, &qword_268102818);
        OUTLINED_FUNCTION_8_4(v64, 1, v3);
        if (v65)
        {
          sub_22562793C(v64, &qword_268102818);
        }
        else
        {
          uint64_t v66 = *v60;
          OUTLINED_FUNCTION_34_0();
          v66();
          OUTLINED_FUNCTION_34_0();
          v66();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_225644554();
            uint64_t v61 = v70;
          }
          unint64_t v69 = *(void *)(v61 + 16);
          unint64_t v68 = *(void *)(v61 + 24);
          if (v69 >= v68 >> 1)
          {
            OUTLINED_FUNCTION_40_0(v68);
            sub_225644554();
            uint64_t v61 = v71;
          }
          *(void *)(v61 + 16) = v69 + 1;
          OUTLINED_FUNCTION_15_1();
          uint64_t v3 = v135;
          OUTLINED_FUNCTION_34_0();
          v66();
          uint64_t v24 = v134;
          uint64_t v58 = v137;
        }
        v45 += (uint64_t)v128;
        --v57;
      }
      while (v57);
      uint64_t v132 = v61;
      swift_bridgeObjectRelease_n();
      uint64_t v0 = v121[0];
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v132 = MEMORY[0x263F8EE78];
    }
    sub_225658760();
    unint64_t v72 = sub_225657DE0();
    OUTLINED_FUNCTION_11_0();
    v73();
    uint64_t v74 = *(void *)(v72 + 16);
    if (v74)
    {
      unint64_t v140 = MEMORY[0x263F8EE78];
      sub_225626BD8();
      uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v125 + 16);
      OUTLINED_FUNCTION_15_1();
      unint64_t v130 = v72;
      uint64_t v77 = v72 + v76;
      uint64_t v79 = *(void *)(v78 + 56);
      do
      {
        v75(v0, v77, v138);
        sub_22564E5B0(v58);
        OUTLINED_FUNCTION_33_0();
        OUTLINED_FUNCTION_9_5();
        v80();
        unint64_t v81 = v140;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_32_1();
          unint64_t v81 = v140;
        }
        unint64_t v72 = *(void *)(v81 + 16);
        if (v72 >= *(void *)(v81 + 24) >> 1)
        {
          sub_225626BD8();
          unint64_t v81 = v140;
        }
        *(void *)(v81 + 16) = v72 + 1;
        OUTLINED_FUNCTION_24_0();
        uint64_t v58 = v137;
        sub_225653B70(v137, v82 + v83 * v72, &qword_268102818);
        v77 += v79;
        --v74;
      }
      while (v74);
      swift_bridgeObjectRelease();
      uint64_t v24 = v134;
      uint64_t v3 = v135;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v81 = MEMORY[0x263F8EE78];
    }
    uint64_t v84 = *(void *)(v81 + 16);
    if (v84)
    {
      OUTLINED_FUNCTION_21_2();
      uint64_t v86 = *(void *)(v85 + 72);
      uint64_t v87 = (void (**)(void))(v136 + 32);
      swift_bridgeObjectRetain();
      uint64_t v88 = MEMORY[0x263F8EE78];
      do
      {
        uint64_t v89 = v133;
        sub_22564A53C(v72, v133, &qword_268102818);
        sub_225653B70(v89, v24, &qword_268102818);
        OUTLINED_FUNCTION_8_4(v24, 1, v3);
        if (v65)
        {
          sub_22562793C(v24, &qword_268102818);
        }
        else
        {
          char v90 = *v87;
          OUTLINED_FUNCTION_29_2();
          v90();
          OUTLINED_FUNCTION_29_2();
          v90();
          char v91 = swift_isUniquelyReferenced_nonNull_native();
          if (v91)
          {
            uint64_t v92 = v88;
          }
          else
          {
            sub_225644554();
            uint64_t v92 = v96;
          }
          unint64_t v94 = *(void *)(v92 + 16);
          unint64_t v93 = *(void *)(v92 + 24);
          if (v94 >= v93 >> 1)
          {
            OUTLINED_FUNCTION_40_0(v93);
            sub_225644554();
            uint64_t v92 = v97;
          }
          *(void *)(v92 + 16) = v94 + 1;
          OUTLINED_FUNCTION_15_1();
          uint64_t v88 = v95;
          uint64_t v3 = v135;
          OUTLINED_FUNCTION_29_2();
          v90();
          uint64_t v24 = v134;
        }
        v72 += v86;
        --v84;
      }
      while (v84);
      swift_bridgeObjectRelease_n();
      uint64_t v98 = v88;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v98 = MEMORY[0x263F8EE78];
    }
    uint64_t v99 = v132;
    uint64_t v100 = *(void *)(v132 + 16);
    unint64_t v101 = MEMORY[0x263F8EE78];
    if (v100)
    {
      uint64_t v137 = v98;
      unint64_t v140 = MEMORY[0x263F8EE78];
      sub_2256590A0();
      uint64_t v102 = v136 + 16;
      OUTLINED_FUNCTION_15_1();
      uint64_t v104 = v99 + v103;
      uint64_t v138 = *(void *)(v102 + 56);
      uint64_t v139 = v105;
      uint64_t v106 = v123;
      do
      {
        v139(v106, v104, v3);
        sub_225658BF0();
        OUTLINED_FUNCTION_9_5();
        v107();
        sub_225659080();
        sub_2256590B0();
        sub_2256590C0();
        sub_225659090();
        v104 += v138;
        --v100;
      }
      while (v100);
      unint64_t v108 = v140;
      swift_bridgeObjectRelease();
      unint64_t v101 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v109 = *(void *)(v98 + 16);
      swift_bridgeObjectRelease();
      if (!v109)
      {
        swift_bridgeObjectRelease();
        goto LABEL_59;
      }
      uint64_t v137 = v98;
      unint64_t v108 = MEMORY[0x263F8EE78];
    }
    uint64_t v110 = *(void *)(v137 + 16);
    if (v110)
    {
      unint64_t v135 = v108;
      unint64_t v140 = v101;
      uint64_t v111 = v137;
      sub_2256590A0();
      OUTLINED_FUNCTION_15_1();
      uint64_t v113 = v111 + v112;
      uint64_t v138 = *(void *)(v114 + 56);
      uint64_t v139 = v115;
      uint64_t v136 = v114;
      uint64_t v116 = v122;
      do
      {
        v139(v116, v113, v3);
        sub_225658BF0();
        uint64_t v117 = OUTLINED_FUNCTION_38_0();
        v118(v117);
        sub_225659080();
        sub_2256590B0();
        sub_2256590C0();
        sub_225659090();
        v113 += v138;
        --v110;
      }
      while (v110);
      unint64_t v119 = v140;
      swift_bridgeObjectRelease();
      unint64_t v108 = v135;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v119 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRetain();
    unint64_t v120 = swift_bridgeObjectRetain();
    sub_22564D060(v120, v119, v108);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_59:
  OUTLINED_FUNCTION_52();
}

void sub_225651540()
{
  OUTLINED_FUNCTION_54();
  uint64_t v2 = sub_225657DD0();
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_2();
  uint64_t v59 = v5;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_26();
  uint64_t v60 = v7;
  sub_2256582F0();
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268102818);
  uint64_t v11 = OUTLINED_FUNCTION_5_4(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v54 = (uint64_t)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_25();
  uint64_t v58 = v14;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v15);
  uint64_t v57 = (char *)v52 - v16;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v17);
  uint64_t v56 = (uint64_t)v52 - v18;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_25();
  uint64_t v62 = v20;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v21);
  uint64_t v63 = (uint64_t)v52 - v22;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_45_0();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_25();
  uint64_t v64 = v25;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_26();
  uint64_t v65 = v27;
  sub_225658120();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v28;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_8_2();
  if (sub_225658750())
  {
    v52[1] = v0;
    uint64_t v53 = v2;
    sub_2256587E0();
    char v31 = sub_225658100();
    uint64_t v32 = *(void (**)(void))(v29 + 8);
    OUTLINED_FUNCTION_9_5();
    v32();
    sub_2256587E0();
    char v33 = sub_225658100();
    OUTLINED_FUNCTION_9_5();
    v32();
    if (v31 & 1) != 0 && (v33)
    {
      sub_2256587E0();
      sub_225658110();
      OUTLINED_FUNCTION_9_5();
      v32();
      sub_22564E5B0(v65);
      uint64_t v61 = *(void *)(v61 + 8);
      OUTLINED_FUNCTION_28();
      v34();
      sub_2256587E0();
      sub_225658110();
      uint64_t v35 = v65;
      OUTLINED_FUNCTION_9_5();
      v32();
      uint64_t v36 = v64;
      sub_22564E5B0(v64);
      OUTLINED_FUNCTION_28();
      v37();
      uint64_t v38 = v53;
      LODWORD(v39) = __swift_getEnumTagSinglePayload(v35, 1, v53);
      sub_22564A53C(v36, v1, &qword_268102818);
      if (v39 == 1) {
        OUTLINED_FUNCTION_23_0(v1);
      }
      else {
        uint64_t v39 = &qword_268102818;
      }
      sub_22562793C(v1, &qword_268102818);
      uint64_t v40 = v63;
      sub_22564A53C(v35, v63, &qword_268102818);
      uint64_t v41 = v62;
      sub_22564A53C(v36, v62, &qword_268102818);
      OUTLINED_FUNCTION_23_0(v40);
      uint64_t v42 = v41;
      uint64_t v43 = v56;
      sub_225653B70(v42, v56, &qword_268102818);
      if (v39 == 1) {
        uint64_t v39 = &qword_268102818;
      }
      else {
        OUTLINED_FUNCTION_23_0(v43);
      }
      sub_22562793C(v43, &qword_268102818);
      sub_22562793C(v40, &qword_268102818);
      uint64_t v45 = v59;
      uint64_t v44 = v60;
      uint64_t v46 = (uint64_t)v57;
      uint64_t v47 = v58;
      OUTLINED_FUNCTION_23_0(v35);
      sub_22564A53C(v36, v46, &qword_268102818);
      if (v39 != 1 || (OUTLINED_FUNCTION_8_4(v46, 1, v38), !v48))
      {
        sub_22562793C(v46, &qword_268102818);
        sub_22564A53C(v35, v47, &qword_268102818);
        OUTLINED_FUNCTION_8_4(v47, 1, v38);
        if (!v48)
        {
          uint64_t v49 = v55;
          uint64_t v50 = *(void (**)(void))(v55 + 32);
          OUTLINED_FUNCTION_34_0();
          v50();
          uint64_t v47 = v54;
          sub_22564A53C(v36, v54, &qword_268102818);
          OUTLINED_FUNCTION_8_4(v47, 1, v38);
          if (!v48)
          {
            OUTLINED_FUNCTION_34_0();
            v50();
            sub_225658BF0();
            sub_225658BF0();
            sub_22564F850();
            swift_release();
            swift_release();
            uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
            v51(v45, v38);
            v51(v44, v38);
            sub_22562793C(v36, &qword_268102818);
            sub_22562793C(v35, &qword_268102818);
            goto LABEL_20;
          }
          (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v44, v38);
        }
        sub_22562793C(v36, &qword_268102818);
        sub_22562793C(v47, &qword_268102818);
        sub_22562793C(v35, &qword_268102818);
        goto LABEL_20;
      }
      sub_22562793C(v46, &qword_268102818);
      sub_22562793C(v36, &qword_268102818);
      sub_22562793C(v35, &qword_268102818);
    }
  }
LABEL_20:
  OUTLINED_FUNCTION_52();
}

void sub_225651CC4()
{
  OUTLINED_FUNCTION_54();
  uint64_t v2 = v1;
  sub_225657DD0();
  OUTLINED_FUNCTION_0();
  uint64_t v59 = v4;
  uint64_t v60 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2_2();
  uint64_t v58 = v5;
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v51 - v7;
  uint64_t v9 = sub_2256585F0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_8_1();
  unint64_t v15 = v13 - v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v51 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v51 - v21;
  if (sub_225658770())
  {
    unint64_t v57 = v15;
    uint64_t v62 = v0;
    sub_2256587F0();
    uint64_t v23 = sub_225657DE0();
    uint64_t v24 = *(void (**)(void))(v11 + 8);
    ((void (*)(char *, uint64_t))v24)(v22, v9);
    uint64_t v25 = *(void *)(v23 + 16);
    swift_bridgeObjectRelease();
    sub_2256587F0();
    uint64_t v26 = sub_225657DE0();
    uint64_t v27 = v20;
    uint64_t v28 = v24;
    ((void (*)(char *, uint64_t))v24)(v27, v9);
    uint64_t v29 = v11 + 8;
    uint64_t v30 = *(void *)(v26 + 16);
    swift_bridgeObjectRelease();
    if (v25 == v30)
    {
      sub_2256587F0();
      uint64_t v31 = sub_225657DE0();
      OUTLINED_FUNCTION_28();
      v24();
      uint64_t v32 = *(void *)(v31 + 16);
      if (v32)
      {
        uint64_t v52 = v24;
        uint64_t v53 = v29;
        uint64_t v54 = v9;
        uint64_t v55 = v2;
        unint64_t v63 = MEMORY[0x263F8EE78];
        sub_2256590A0();
        uint64_t v33 = v59 + 16;
        OUTLINED_FUNCTION_15_1();
        uint64_t v56 = v31;
        uint64_t v35 = v31 + v34;
        uint64_t v61 = *(void *)(v33 + 56);
        uint64_t v62 = v36;
        uint64_t v37 = v60;
        do
        {
          v62(v8, v35, v37);
          sub_225658BF0();
          uint64_t v38 = OUTLINED_FUNCTION_28_2();
          v39(v38);
          sub_225659080();
          sub_2256590B0();
          sub_2256590C0();
          sub_225659090();
          v35 += v61;
          --v32;
        }
        while (v32);
        unint64_t v40 = v63;
        swift_bridgeObjectRelease();
        uint64_t v28 = v52;
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v40 = MEMORY[0x263F8EE78];
      }
      sub_2256587F0();
      uint64_t v41 = sub_225657DE0();
      OUTLINED_FUNCTION_28();
      v28();
      uint64_t v42 = *(void *)(v41 + 16);
      if (v42)
      {
        unint64_t v57 = v40;
        unint64_t v63 = MEMORY[0x263F8EE78];
        sub_2256590A0();
        uint64_t v43 = v60;
        OUTLINED_FUNCTION_15_1();
        uint64_t v59 = v41;
        uint64_t v45 = v41 + v44;
        uint64_t v61 = *(void *)(v46 + 56);
        uint64_t v62 = v47;
        char v48 = v58;
        do
        {
          v62(v48, v45, v43);
          sub_225658BF0();
          OUTLINED_FUNCTION_17_0();
          v49();
          sub_225659080();
          sub_2256590B0();
          sub_2256590C0();
          sub_225659090();
          v45 += v61;
          --v42;
        }
        while (v42);
        unint64_t v50 = v63;
        swift_bridgeObjectRelease();
        unint64_t v40 = v57;
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v50 = MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRetain();
      sub_22564D458(v40, v50);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  OUTLINED_FUNCTION_52();
}

uint64_t sub_2256521C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_225659250();
    sub_225658E40();
    uint64_t v6 = sub_225659270();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2256591A0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2256591A0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void *sub_225652300(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD58758);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_225653970((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_225653BC0();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_2256523E4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v5)
  {
    if (v5 <= 0) {
      goto LABEL_11;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268102900);
    uint64_t v7 = sub_225658B50();
    OUTLINED_FUNCTION_4_2(v7);
    uint64_t v9 = *(void *)(v8 + 72);
    unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    BOOL v12 = (void *)swift_allocObject();
    size_t v13 = _swift_stdlib_malloc_size(v12);
    if (v9)
    {
      if (v13 - v11 != 0x8000000000000000 || v9 != -1)
      {
        v12[2] = v5;
        v12[3] = 2 * ((uint64_t)(v13 - v11) / v9);
LABEL_11:
        if (v4 != a3)
        {
          sub_225658B50();
          swift_arrayInitWithCopy();
          return;
        }
        goto LABEL_16;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      return;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
}

void sub_225652554(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_22564CAB0(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_2256525C0(v5);
  *a1 = v2;
}

void sub_2256525C0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_225659170();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_147;
    }
    if (v3) {
      sub_225652C64(0, v3, 1, a1);
    }
    return;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v106 = v4;
  uint64_t v103 = a1;
  if (v3 <= 1)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v39 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v9 = MEMORY[0x263F8EE78];
      goto LABEL_113;
    }
    uint64_t v105 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = sub_225658F40();
    *(void *)(v5 + 16) = v3 / 2;
    uint64_t v105 = v5;
    __dst = (char *)(v5 + 32);
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v104 = v8 + 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v107 = v3;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 >= v3) {
      goto LABEL_39;
    }
    unint64_t v11 = (uint64_t *)(v8 + 16 * v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    uint64_t v14 = (void *)(v8 + 16 * v10);
    if (v12 == *v14 && v13 == v14[1])
    {
      uint64_t v17 = v10 + 2;
      if (v10 + 2 >= v3) {
        goto LABEL_38;
      }
      int v16 = 0;
    }
    else
    {
      int v16 = sub_2256591A0();
      uint64_t v17 = v10 + 2;
      if (v10 + 2 >= v3) {
        goto LABEL_30;
      }
    }
    uint64_t v18 = (void *)(v104 + 16 * v17);
    do
    {
      uint64_t v19 = (void *)(v8 + 16 * v7);
      if (*(v18 - 1) == *v19 && *v18 == v19[1])
      {
        if (v16) {
          goto LABEL_31;
        }
      }
      else if ((v16 ^ sub_2256591A0()))
      {
        goto LABEL_30;
      }
      v18 += 2;
      uint64_t v21 = v17 + 1;
      uint64_t v7 = v17;
      uint64_t v17 = v21;
    }
    while (v21 < v3);
    uint64_t v17 = v21;
LABEL_30:
    uint64_t v7 = v17;
    if (v16)
    {
LABEL_31:
      if (v17 < v10) {
        goto LABEL_150;
      }
      if (v10 < v17)
      {
        uint64_t v22 = 16 * v17;
        uint64_t v23 = 16 * v10;
        uint64_t v24 = v17;
        uint64_t v25 = v10;
        do
        {
          if (v25 != --v24)
          {
            if (!v8) {
              goto LABEL_153;
            }
            uint64_t v26 = v8 + v22;
            uint64_t v27 = *(void *)(v8 + v23);
            uint64_t v28 = *(void *)(v8 + v23 + 8);
            *(_OWORD *)(v8 + v23) = *(_OWORD *)(v8 + v22 - 16);
            *(void *)(v26 - 16) = v27;
            *(void *)(v26 - 8) = v28;
          }
          ++v25;
          v22 -= 16;
          v23 += 16;
        }
        while (v25 < v24);
      }
LABEL_38:
      uint64_t v7 = v17;
    }
LABEL_39:
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_145;
      }
      if (v7 - v10 < v106) {
        break;
      }
    }
LABEL_59:
    if (v7 < v10) {
      goto LABEL_140;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22564C8EC(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = v92;
    }
    unint64_t v38 = *(void *)(v9 + 16);
    unint64_t v37 = *(void *)(v9 + 24);
    unint64_t v39 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      sub_22564C8EC(v37 > 1, v38 + 1, 1, (char *)v9);
      uint64_t v9 = v93;
    }
    *(void *)(v9 + 16) = v39;
    uint64_t v40 = v9 + 32;
    uint64_t v41 = (uint64_t *)(v9 + 32 + 16 * v38);
    *uint64_t v41 = v10;
    v41[1] = v7;
    if (v38)
    {
      uint64_t v108 = v7;
      while (1)
      {
        unint64_t v42 = v39 - 1;
        if (v39 >= 4)
        {
          unint64_t v47 = v40 + 16 * v39;
          uint64_t v48 = *(void *)(v47 - 64);
          uint64_t v49 = *(void *)(v47 - 56);
          BOOL v53 = __OFSUB__(v49, v48);
          uint64_t v50 = v49 - v48;
          if (v53) {
            goto LABEL_129;
          }
          uint64_t v52 = *(void *)(v47 - 48);
          uint64_t v51 = *(void *)(v47 - 40);
          BOOL v53 = __OFSUB__(v51, v52);
          uint64_t v45 = v51 - v52;
          char v46 = v53;
          if (v53) {
            goto LABEL_130;
          }
          unint64_t v54 = v39 - 2;
          uint64_t v55 = (uint64_t *)(v40 + 16 * (v39 - 2));
          uint64_t v57 = *v55;
          uint64_t v56 = v55[1];
          BOOL v53 = __OFSUB__(v56, v57);
          uint64_t v58 = v56 - v57;
          if (v53) {
            goto LABEL_131;
          }
          BOOL v53 = __OFADD__(v45, v58);
          uint64_t v59 = v45 + v58;
          if (v53) {
            goto LABEL_133;
          }
          if (v59 >= v50)
          {
            uint64_t v77 = (uint64_t *)(v40 + 16 * v42);
            uint64_t v79 = *v77;
            uint64_t v78 = v77[1];
            BOOL v53 = __OFSUB__(v78, v79);
            uint64_t v80 = v78 - v79;
            if (v53) {
              goto LABEL_139;
            }
            BOOL v70 = v45 < v80;
            goto LABEL_97;
          }
        }
        else
        {
          if (v39 != 3)
          {
            uint64_t v71 = *(void *)(v9 + 32);
            uint64_t v72 = *(void *)(v9 + 40);
            BOOL v53 = __OFSUB__(v72, v71);
            uint64_t v64 = v72 - v71;
            char v65 = v53;
            goto LABEL_91;
          }
          uint64_t v44 = *(void *)(v9 + 32);
          uint64_t v43 = *(void *)(v9 + 40);
          BOOL v53 = __OFSUB__(v43, v44);
          uint64_t v45 = v43 - v44;
          char v46 = v53;
        }
        if (v46) {
          goto LABEL_132;
        }
        unint64_t v54 = v39 - 2;
        uint64_t v60 = (uint64_t *)(v40 + 16 * (v39 - 2));
        uint64_t v62 = *v60;
        uint64_t v61 = v60[1];
        BOOL v63 = __OFSUB__(v61, v62);
        uint64_t v64 = v61 - v62;
        char v65 = v63;
        if (v63) {
          goto LABEL_134;
        }
        uint64_t v66 = (uint64_t *)(v40 + 16 * v42);
        uint64_t v68 = *v66;
        uint64_t v67 = v66[1];
        BOOL v53 = __OFSUB__(v67, v68);
        uint64_t v69 = v67 - v68;
        if (v53) {
          goto LABEL_136;
        }
        if (__OFADD__(v64, v69)) {
          goto LABEL_138;
        }
        if (v64 + v69 >= v45)
        {
          BOOL v70 = v45 < v69;
LABEL_97:
          if (v70) {
            unint64_t v42 = v54;
          }
          goto LABEL_99;
        }
LABEL_91:
        if (v65) {
          goto LABEL_135;
        }
        uint64_t v73 = (uint64_t *)(v40 + 16 * v42);
        uint64_t v75 = *v73;
        uint64_t v74 = v73[1];
        BOOL v53 = __OFSUB__(v74, v75);
        uint64_t v76 = v74 - v75;
        if (v53) {
          goto LABEL_137;
        }
        if (v76 < v64) {
          goto LABEL_108;
        }
LABEL_99:
        unint64_t v81 = v42 - 1;
        if (v42 - 1 >= v39)
        {
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
        uint64_t v82 = v8;
        if (!v8) {
          goto LABEL_152;
        }
        uint64_t v83 = v9;
        uint64_t v84 = (uint64_t *)(v40 + 16 * v81);
        uint64_t v85 = *v84;
        uint64_t v86 = v40;
        unint64_t v87 = v42;
        uint64_t v88 = (void *)(v40 + 16 * v42);
        uint64_t v89 = v88[1];
        uint64_t v90 = v82;
        sub_225652D2C((char *)(v82 + 16 * *v84), (char *)(v82 + 16 * *v88), v82 + 16 * v89, __dst);
        if (v1)
        {
LABEL_110:
          swift_bridgeObjectRelease();
          *(void *)(v105 + 16) = 0;
          swift_bridgeObjectRelease();
          return;
        }
        if (v89 < v85) {
          goto LABEL_126;
        }
        if (v87 > *(void *)(v83 + 16)) {
          goto LABEL_127;
        }
        uint64_t *v84 = v85;
        *(void *)(v86 + 16 * v81 + 8) = v89;
        unint64_t v91 = *(void *)(v83 + 16);
        if (v87 >= v91) {
          goto LABEL_128;
        }
        uint64_t v9 = v83;
        unint64_t v39 = v91 - 1;
        memmove(v88, v88 + 2, 16 * (v91 - 1 - v87));
        uint64_t v40 = v86;
        *(void *)(v83 + 16) = v91 - 1;
        uint64_t v8 = v90;
        uint64_t v7 = v108;
        if (v91 <= 2) {
          goto LABEL_108;
        }
      }
    }
    unint64_t v39 = 1;
LABEL_108:
    uint64_t v3 = v107;
    if (v7 >= v107)
    {
      uint64_t v6 = v105;
LABEL_113:
      uint64_t v94 = v9;
      uint64_t v105 = v6;
      if (v39 >= 2)
      {
        uint64_t v95 = *v103;
        do
        {
          unint64_t v96 = v39 - 2;
          if (v39 < 2) {
            goto LABEL_141;
          }
          if (!v95) {
            goto LABEL_154;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)(v94 + 32 + 16 * v96);
          uint64_t v99 = *(void *)(v94 + 32 + 16 * (v39 - 1) + 8);
          sub_225652D2C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)(v94 + 32 + 16 * (v39 - 1))), v95 + 16 * v99, __dst);
          if (v1) {
            goto LABEL_110;
          }
          if (v99 < v98) {
            goto LABEL_142;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_22564CA9C(v97);
            uint64_t v97 = v102;
          }
          if (v96 >= *(void *)(v97 + 16)) {
            goto LABEL_143;
          }
          uint64_t v100 = (void *)(v97 + 32 + 16 * v96);
          *uint64_t v100 = v98;
          v100[1] = v99;
          unint64_t v101 = *(void *)(v97 + 16);
          if (v39 > v101) {
            goto LABEL_144;
          }
          memmove((void *)(v97 + 32 + 16 * (v39 - 1)), (const void *)(v97 + 32 + 16 * v39), 16 * (v101 - v39));
          uint64_t v94 = v97;
          *(void *)(v97 + 16) = v101 - 1;
          unint64_t v39 = v101 - 1;
        }
        while (v101 > 2);
      }
      swift_bridgeObjectRelease();
      *(void *)(v105 + 16) = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (__OFADD__(v10, v106)) {
    goto LABEL_148;
  }
  if (v10 + v106 >= v3) {
    uint64_t v29 = v3;
  }
  else {
    uint64_t v29 = v10 + v106;
  }
  if (v29 >= v10)
  {
    if (v7 != v29)
    {
      uint64_t v30 = (void *)(v8 + 16 * v7);
      do
      {
        uint64_t v31 = (uint64_t *)(v8 + 16 * v7);
        uint64_t v32 = *v31;
        uint64_t v33 = v31[1];
        uint64_t v34 = v10;
        uint64_t v35 = v30;
        do
        {
          BOOL v36 = v32 == *(v35 - 2) && v33 == *(v35 - 1);
          if (v36 || (sub_2256591A0() & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_151;
          }
          uint64_t v32 = *v35;
          uint64_t v33 = v35[1];
          *(_OWORD *)uint64_t v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = v32;
          v35 -= 2;
          ++v34;
        }
        while (v7 != v34);
        ++v7;
        v30 += 2;
      }
      while (v7 != v29);
      uint64_t v7 = v29;
    }
    goto LABEL_59;
  }
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
}

uint64_t sub_225652C64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        uint64_t result = sub_2256591A0();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_225652D2C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_225643D08(a2, (uint64_t)(a3 - (void)a2) / 16, __dst);
    uint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v18 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v19 = v18 + 16;
      uint64_t v20 = v12 - 16;
      BOOL v21 = *((void *)v12 - 2) == *((void *)v6 - 2) && *((void *)v12 - 1) == *((void *)v6 - 1);
      if (v21 || (sub_2256591A0() & 1) == 0)
      {
        BOOL v23 = v19 != v12 || v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        uint64_t v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }
  sub_225643D08(__src, (a2 - __src) / 16, __dst);
  uint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_2256591A0() & 1) != 0) {
        break;
      }
      unint64_t v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    unint64_t v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  uint64_t v25 = (v12 - v4) / 16;
  if (v6 != v4 || v6 >= &v4[16 * v25]) {
    memmove(v6, v4, 16 * v25);
  }
  return 1;
}

uint64_t sub_225652EE8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_225659250();
  swift_bridgeObjectRetain();
  sub_225658E40();
  uint64_t v8 = sub_225659270();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2256591A0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      if (v19 || (sub_2256591A0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_225653374(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_225653098()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681028F8);
  uint64_t v3 = sub_225659040();
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
      sub_225659250();
      sub_225658E40();
      uint64_t result = sub_225659270();
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
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
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
                sub_225656880(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
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

uint64_t sub_225653374(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_225653098();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_225653510();
      goto LABEL_22;
    }
    sub_2256536C4();
  }
  uint64_t v11 = *v4;
  sub_225659250();
  sub_225658E40();
  uint64_t result = sub_225659270();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2256591A0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2256591C0();
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
          uint64_t result = sub_2256591A0();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
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

void *sub_225653510()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681028F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_225659030();
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
    void *v22 = *v20;
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

uint64_t sub_2256536C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681028F8);
  uint64_t v3 = sub_225659040();
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
    sub_225659250();
    swift_bridgeObjectRetain();
    sub_225658E40();
    uint64_t result = sub_225659270();
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
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
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

uint64_t sub_225653970(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_225653B70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22();
  uint64_t v4 = OUTLINED_FUNCTION_42_0();
  v5(v4);
  return a2;
}

uint64_t sub_225653BC0()
{
  return swift_release();
}

uint64_t sub_225653BC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_22_2@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return *(void *)(v0 - 128);
}

void OUTLINED_FUNCTION_32_1()
{
  sub_225626BD8();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return v0;
}

void OUTLINED_FUNCTION_39_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

BOOL OUTLINED_FUNCTION_40_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t sub_225653DC4(char a1)
{
  return sub_225659270();
}

uint64_t sub_225653E14()
{
  return sub_225659270();
}

uint64_t sub_225653E5C()
{
  sub_225658E40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_225653F88()
{
  sub_225658E40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2256540F4()
{
  return sub_225659270();
}

uint64_t sub_225654138(uint64_t a1, char a2)
{
  return sub_225659270();
}

BOOL static SiriNLOverride.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SiriNLOverride.Error.hash(into:)()
{
  return sub_225659260();
}

uint64_t SiriNLOverride.Error.hashValue.getter()
{
  return sub_225659270();
}

uint64_t sub_22565421C()
{
  return sub_225659270();
}

uint64_t SiriNLOverride.id.getter()
{
  return OUTLINED_FUNCTION_8_5();
}

uint64_t SiriNLOverride.inputText.getter()
{
  return OUTLINED_FUNCTION_8_5();
}

uint64_t SiriNLOverride.locale.getter()
{
  return OUTLINED_FUNCTION_8_5();
}

uint64_t SiriNLOverride.namespace.getter()
{
  return *(unsigned int *)(v0 + 48);
}

uint64_t SiriNLOverride.source.getter()
{
  return *(unsigned int *)(v0 + 52);
}

uint64_t SiriNLOverride.creation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriNLOverride();
  return sub_2256358A8(v1 + *(int *)(v3 + 36), a1, (uint64_t *)&unk_26AD581C8);
}

uint64_t SiriNLOverride.enabled.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SiriNLOverride() + 40));
}

uint64_t SiriNLOverride.overrideId.getter()
{
  return OUTLINED_FUNCTION_8_5();
}

uint64_t _s16SiriNLUOverrides0A10NLOverrideV9userParse10Foundation4DataVSgvg_0()
{
  uint64_t v1 = type metadata accessor for SiriNLOverride();
  sub_225635804(*(void *)(v0 + *(int *)(v1 + 48)), *(void *)(v0 + *(int *)(v1 + 48) + 8));
  return OUTLINED_FUNCTION_8_5();
}

uint64_t SiriNLOverride.utteranceComparisonType.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for SiriNLOverride() + 52));
}

uint64_t SiriNLOverride.utteranceComparisonType.setter(int a1)
{
  uint64_t result = type metadata accessor for SiriNLOverride();
  *(_DWORD *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*SiriNLOverride.utteranceComparisonType.modify())()
{
  return nullsub_1;
}

uint64_t SiriNLOverride.archivedNluRequestRule.getter()
{
  uint64_t v1 = type metadata accessor for SiriNLOverride();
  sub_225635804(*(void *)(v0 + *(int *)(v1 + 56)), *(void *)(v0 + *(int *)(v1 + 56) + 8));
  return OUTLINED_FUNCTION_8_5();
}

uint64_t SiriNLOverride.archivedNluRequestRule.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for SiriNLOverride() + 56);
  uint64_t result = sub_225635818(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t (*SiriNLOverride.archivedNluRequestRule.modify())()
{
  return nullsub_1;
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional __swiftcall SiriNLOverride.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_225659110();
  result.value = swift_bridgeObjectRelease();
  char v5 = 10;
  if (v3 < 0xA) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional __swiftcall SiriNLOverride.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v2 = v1;
  result.value = SiriNLOverride.CodingKeys.init(rawValue:)(stringValue).value;
  *uint64_t v2 = v4;
  return result;
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional __swiftcall SiriNLOverride.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 10;
  return (SiriNLUOverrides::SiriNLOverride::CodingKeys_optional)intValue;
}

uint64_t SiriNLOverride.CodingKeys.intValue.getter()
{
  return 0;
}

void SiriNLOverride.CodingKeys.rawValue.getter()
{
  switch(*v0)
  {
    case 1:
      OUTLINED_FUNCTION_3_5();
      break;
    case 2:
      OUTLINED_FUNCTION_11_3();
      break;
    case 3:
    case 8:
      OUTLINED_FUNCTION_21_3();
      break;
    case 4:
      OUTLINED_FUNCTION_10_6();
      break;
    case 5:
      OUTLINED_FUNCTION_6_5();
      break;
    case 6:
      OUTLINED_FUNCTION_5_6();
      break;
    case 7:
      OUTLINED_FUNCTION_4_6();
      break;
    default:
      return;
  }
}

void SiriNLOverride.CodingKeys.stringValue.getter()
{
  switch(*v0)
  {
    case 1:
      OUTLINED_FUNCTION_3_5();
      break;
    case 2:
      OUTLINED_FUNCTION_11_3();
      break;
    case 3:
    case 8:
      OUTLINED_FUNCTION_21_3();
      break;
    case 4:
      OUTLINED_FUNCTION_10_6();
      break;
    case 5:
      OUTLINED_FUNCTION_6_5();
      break;
    case 6:
      OUTLINED_FUNCTION_5_6();
      break;
    case 7:
      OUTLINED_FUNCTION_4_6();
      break;
    default:
      return;
  }
}

uint64_t sub_225654754(char *a1, char *a2)
{
  return sub_22564DC14(*a1, *a2);
}

uint64_t sub_225654760()
{
  return sub_225653E14();
}

uint64_t sub_225654768()
{
  return sub_225653F88();
}

uint64_t sub_225654770()
{
  return sub_2256540F4();
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional sub_225654778(Swift::String *a1)
{
  return SiriNLOverride.CodingKeys.init(rawValue:)(*a1);
}

void sub_225654784(void *a1@<X8>)
{
  SiriNLOverride.CodingKeys.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2256547B4()
{
  return 0;
}

uint64_t sub_2256547C4(uint64_t a1)
{
  unint64_t v2 = sub_2256552E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_225654800(uint64_t a1)
{
  unint64_t v2 = sub_2256552E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriNLOverride.dictionary.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102908);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22565A080;
  *(void *)(inited + 32) = 25705;
  *(void *)(inited + 40) = 0xE200000000000000;
  uint64_t v2 = v0[1];
  *(void *)(inited + 48) = *v0;
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 64) = 0x7865547475706E69;
  *(void *)(inited + 72) = 0xE900000000000074;
  uint64_t v3 = v0[3];
  *(void *)(inited + 80) = v0[2];
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 96) = 0x656C61636F6CLL;
  *(void *)(inited + 104) = 0xE600000000000000;
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  *(void *)(inited + 112) = v4;
  *(void *)(inited + 120) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102838);
  return sub_225658DB0();
}

uint64_t SiriNLOverride.criteria.getter()
{
  uint64_t v0 = SiriNLOverride.dictionary.getter();
  uint64_t v1 = sub_225654984(v0);
  swift_bridgeObjectRelease();
  sub_22565518C(25705, 0xE200000000000000);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_225654984(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x263F8EE80];
  uint64_t v34 = MEMORY[0x263F8EE80];
  sub_22565689C(a1, v33);
  uint64_t v2 = v33[0];
  uint64_t v3 = v33[1];
  int64_t v4 = v33[3];
  unint64_t v5 = v33[4];
  int64_t v6 = (unint64_t)(v33[2] + 64) >> 6;
  for (uint64_t result = swift_bridgeObjectRetain(); ; uint64_t result = swift_bridgeObjectRelease())
  {
    do
    {
      if (v5)
      {
        unint64_t v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v9 = v8 | (v4 << 6);
      }
      else
      {
        int64_t v10 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_36;
        }
        if (v10 >= v6) {
          goto LABEL_34;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v10);
        int64_t v12 = v4 + 1;
        if (!v11)
        {
          int64_t v12 = v4 + 2;
          if (v4 + 2 >= v6) {
            goto LABEL_34;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 3;
            if (v4 + 3 >= v6) {
              goto LABEL_34;
            }
            unint64_t v11 = *(void *)(v3 + 8 * v12);
            if (!v11)
            {
              int64_t v12 = v4 + 4;
              if (v4 + 4 >= v6) {
                goto LABEL_34;
              }
              unint64_t v11 = *(void *)(v3 + 8 * v12);
              if (!v11)
              {
                int64_t v12 = v4 + 5;
                if (v4 + 5 >= v6) {
                  goto LABEL_34;
                }
                unint64_t v11 = *(void *)(v3 + 8 * v12);
                if (!v11)
                {
                  int64_t v13 = v4 + 6;
                  while (v13 < v6)
                  {
                    unint64_t v11 = *(void *)(v3 + 8 * v13++);
                    if (v11)
                    {
                      int64_t v12 = v13 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_225653BC0();
                  return v1;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v5 = (v11 - 1) & v11;
        unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
        int64_t v4 = v12;
      }
      int64_t v14 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v9);
      uint64_t v15 = v14[1];
    }
    while (!v15);
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v9);
    uint64_t v17 = v16[1];
    uint64_t v31 = *v14;
    uint64_t v32 = *v16;
    unint64_t v18 = *(void *)(v1 + 16);
    if (*(void *)(v1 + 24) <= v18)
    {
      uint64_t v19 = v18 + 1;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_225656570(v19, 1);
      uint64_t v1 = v34;
    }
    else
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
    }
    sub_225659250();
    sub_225658E40();
    uint64_t result = sub_225659270();
    uint64_t v20 = v1 + 64;
    uint64_t v21 = -1 << *(unsigned char *)(v1 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v1 + 64 + 8 * (v22 >> 6))) == 0) {
      break;
    }
    unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v1 + 64 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v20 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    int64_t v29 = (void *)(*(void *)(v1 + 48) + 16 * v24);
    *int64_t v29 = v32;
    v29[1] = v17;
    uint64_t v30 = (void *)(*(void *)(v1 + 56) + 16 * v24);
    void *v30 = v31;
    v30[1] = v15;
    ++*(void *)(v1 + 16);
  }
  char v25 = 0;
  unint64_t v26 = (unint64_t)(63 - v21) >> 6;
  while (++v23 != v26 || (v25 & 1) == 0)
  {
    BOOL v27 = v23 == v26;
    if (v23 == v26) {
      unint64_t v23 = 0;
    }
    v25 |= v27;
    uint64_t v28 = *(void *)(v20 + 8 * v23);
    if (v28 != -1)
    {
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
      goto LABEL_33;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t SiriNLOverride.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  uint64_t v5 = OUTLINED_FUNCTION_5_4(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102910);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_6();
  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3_0();
  uint64_t v13 = v12 - v11;
  uint64_t v28 = v12 - v11 + v14[14];
  *(_OWORD *)uint64_t v28 = xmmword_22565A4B0;
  int64_t v29 = v14;
  uint64_t v15 = v12 - v11 + v14[15];
  uint64_t v16 = sub_225658BD0();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2256552E0();
  sub_225659280();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_225635818(*(void *)v28, *(void *)(v28 + 8));
    return sub_22562798C(v15, &qword_26AD57F08);
  }
  else
  {
    *(void *)uint64_t v13 = sub_225659140();
    *(void *)(v13 + 8) = v17;
    *(void *)(v13 + 16) = OUTLINED_FUNCTION_13_4(1);
    *(void *)(v13 + 24) = v18;
    *(void *)(v13 + 32) = OUTLINED_FUNCTION_13_4(2);
    *(void *)(v13 + 40) = v19;
    *(_DWORD *)(v13 + 48) = OUTLINED_FUNCTION_14_4(3);
    *(_DWORD *)(v13 + 52) = OUTLINED_FUNCTION_14_4(4);
    sub_225657B90();
    LOBYTE(v30) = 5;
    sub_22565537C(&qword_268102920, MEMORY[0x263F07490]);
    sub_225659130();
    sub_2256553C4(v8, v13 + v29[9]);
    OUTLINED_FUNCTION_12_4(6);
    *(unsigned char *)(v13 + v29[10]) = sub_225659150() & 1;
    OUTLINED_FUNCTION_12_4(7);
    uint64_t v20 = sub_225659120();
    uint64_t v21 = (uint64_t *)(v13 + v29[11]);
    *uint64_t v21 = v20;
    v21[1] = v22;
    sub_22565542C();
    sub_225659130();
    *(_OWORD *)(v13 + v29[12]) = v30;
    int v23 = sub_225659160();
    uint64_t v24 = OUTLINED_FUNCTION_19_2();
    v25(v24);
    *(_DWORD *)(v13 + v29[13]) = v23;
    sub_225626FE4(v13, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_22562709C(v13);
  }
}

uint64_t sub_225655174@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriNLOverride.init(from:)(a1, a2);
}

uint64_t sub_22565518C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_225627F1C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102950);
  sub_2256590D0();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 16 * v6);
  sub_2256590E0();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2256552E0()
{
  unint64_t result = qword_268102918;
  if (!qword_268102918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102918);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_22565537C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2256553C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22565542C()
{
  unint64_t result = qword_268102928;
  if (!qword_268102928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102928);
  }
  return result;
}

unint64_t sub_22565547C()
{
  unint64_t result = qword_268102930;
  if (!qword_268102930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102930);
  }
  return result;
}

unint64_t sub_2256554CC()
{
  unint64_t result = qword_268102938;
  if (!qword_268102938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102938);
  }
  return result;
}

unint64_t sub_22565551C()
{
  unint64_t result = qword_268102940;
  if (!qword_268102940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102940);
  }
  return result;
}

unint64_t sub_22565556C()
{
  unint64_t result = qword_268102948;
  if (!qword_268102948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268102948);
  }
  return result;
}

uint64_t assignWithCopy for SiriNLOverride(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  uint64_t v6 = a3[9];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_225657B90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v14 = a3[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[12];
  uint64_t v18 = (uint64_t *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = *(void *)(a2 + v17 + 8);
  if (*(void *)(a1 + v17 + 8) >> 60 == 15)
  {
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = *v19;
      sub_225626B60(v21, v20);
      *uint64_t v18 = v21;
      v18[1] = v20;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v20 >> 60 == 15)
  {
    sub_225649260((uint64_t)v18);
LABEL_12:
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    goto LABEL_14;
  }
  uint64_t v22 = *v19;
  sub_225626B60(v22, v20);
  uint64_t v23 = *v18;
  unint64_t v24 = v18[1];
  *uint64_t v18 = v22;
  v18[1] = v20;
  sub_225627258(v23, v24);
LABEL_14:
  *(_DWORD *)(a1 + a3[13]) = *(_DWORD *)(a2 + a3[13]);
  uint64_t v25 = a3[14];
  unint64_t v26 = (uint64_t *)(a1 + v25);
  BOOL v27 = (uint64_t *)(a2 + v25);
  unint64_t v28 = *(void *)(a2 + v25 + 8);
  if (*(void *)(a1 + v25 + 8) >> 60 == 15)
  {
    if (v28 >> 60 != 15)
    {
      uint64_t v29 = *v27;
      sub_225626B60(v29, v28);
      *unint64_t v26 = v29;
      v26[1] = v28;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v28 >> 60 == 15)
  {
    sub_225649260((uint64_t)v26);
LABEL_19:
    *(_OWORD *)unint64_t v26 = *(_OWORD *)v27;
    goto LABEL_21;
  }
  uint64_t v30 = *v27;
  sub_225626B60(v30, v28);
  uint64_t v31 = *v26;
  unint64_t v32 = v26[1];
  *unint64_t v26 = v30;
  v26[1] = v28;
  sub_225627258(v31, v32);
LABEL_21:
  uint64_t v33 = a3[15];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  uint64_t v36 = sub_225658BD0();
  int v37 = __swift_getEnumTagSinglePayload((uint64_t)v34, 1, v36);
  int v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36);
  if (!v37)
  {
    uint64_t v39 = *(void *)(v36 - 8);
    if (!v38)
    {
      (*(void (**)(void *, const void *, uint64_t))(v39 + 24))(v34, v35, v36);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v39 + 8))(v34, v36);
    goto LABEL_26;
  }
  if (v38)
  {
LABEL_26:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v34, v35, *(void *)(*(void *)(v40 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
  return a1;
}

uint64_t initializeWithTake for SiriNLOverride(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_225657B90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_DWORD *)(a1 + v13) = *(_DWORD *)(a2 + v13);
  uint64_t v14 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_225658BD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

void *assignWithTake for SiriNLOverride(void *a1, void *a2, int *a3)
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
  a1[6] = a2[6];
  uint64_t v9 = a3[9];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_225657B90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_7:
  uint64_t v17 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[12];
  uint64_t v23 = (uint64_t)a1 + v22;
  unint64_t v24 = (char *)a2 + v22;
  unint64_t v25 = *(void *)((char *)a1 + v22 + 8);
  if (v25 >> 60 == 15)
  {
LABEL_10:
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    goto LABEL_12;
  }
  unint64_t v26 = *((void *)v24 + 1);
  if (v26 >> 60 == 15)
  {
    sub_225649260(v23);
    goto LABEL_10;
  }
  uint64_t v27 = *(void *)v23;
  *(void *)uint64_t v23 = *(void *)v24;
  *(void *)(v23 + 8) = v26;
  sub_225627258(v27, v25);
LABEL_12:
  uint64_t v28 = a3[14];
  *(_DWORD *)((char *)a1 + a3[13]) = *(_DWORD *)((char *)a2 + a3[13]);
  uint64_t v29 = (uint64_t)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  unint64_t v31 = *(void *)((char *)a1 + v28 + 8);
  if (v31 >> 60 == 15)
  {
LABEL_15:
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    goto LABEL_17;
  }
  unint64_t v32 = *((void *)v30 + 1);
  if (v32 >> 60 == 15)
  {
    sub_225649260(v29);
    goto LABEL_15;
  }
  uint64_t v33 = *(void *)v29;
  *(void *)uint64_t v29 = *(void *)v30;
  *(void *)(v29 + 8) = v32;
  sub_225627258(v33, v31);
LABEL_17:
  uint64_t v34 = a3[15];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  uint64_t v37 = sub_225658BD0();
  int v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v37);
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37);
  if (!v38)
  {
    uint64_t v40 = *(void *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v35, v36, v37);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_22;
  }
  if (v39)
  {
LABEL_22:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
    memcpy(v35, v36, *(void *)(*(void *)(v41 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
  return a1;
}

uint64_t sub_225655F54(uint64_t a1, uint64_t a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 36);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
      uint64_t v11 = *(int *)(a3 + 60);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_225656008(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD581C8);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 36);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD57F08);
      uint64_t v11 = *(int *)(a4 + 60);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_2256560B8()
{
  sub_2256561F8(319, &qword_26AD582A0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_2256561F8(319, &qword_26AD580E8, MEMORY[0x263F71B48]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2256561F8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_225658FE0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for SiriNLOverride.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriNLOverride.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2256563A0);
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

unsigned char *sub_2256563C8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriNLOverride.Error()
{
  return &type metadata for SiriNLOverride.Error;
}

uint64_t getEnumTagSinglePayload for SiriNLOverride.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriNLOverride.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x225656538);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriNLOverride.CodingKeys()
{
  return &type metadata for SiriNLOverride.CodingKeys;
}

uint64_t sub_225656570(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268102958);
  char v40 = a2;
  uint64_t v6 = sub_225659100();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
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
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = (uint64_t *)(*(void *)(v5 + 56) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_225659250();
    sub_225658E40();
    uint64_t result = sub_225659270();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        BOOL v32 = v28 == v31;
        if (v28 == v31) {
          unint64_t v28 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v11 + 8 * v28);
        if (v33 != -1)
        {
          unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
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
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v7 + 48) + 16 * v29);
    *uint64_t v34 = v22;
    v34[1] = v21;
    uint64_t v35 = (void *)(*(void *)(v7 + 56) + 16 * v29);
    *uint64_t v35 = v24;
    v35[1] = v25;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v38)
    {
      swift_release();
      int v3 = v37;
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v39 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v38) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v39 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v38)
  {
    unint64_t v18 = *(void *)(v39 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v38) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v39 + 8 * v13);
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
  int v3 = v37;
LABEL_34:
  if (v40)
  {
    uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
    if (v36 >= 64) {
      sub_225656880(0, (unint64_t)(v36 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v36;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_225656880(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_22565689C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t OUTLINED_FUNCTION_0_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return 0x7865547475706E69;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return 0x656469727265766FLL;
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return 0x64656C62616E65;
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return 0x6E6F697461657263;
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return 0x656372756F73;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return 0x656C61636F6CLL;
}

uint64_t OUTLINED_FUNCTION_12_4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_13_4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_225659140();
}

uint64_t OUTLINED_FUNCTION_14_4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_225659160();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return sub_225658E40();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_225656BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::Agent::~Agent((marisa::Agent *)&a9);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_225657030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    char *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_2647209F8, MEMORY[0x263F8C060]);
}

void sub_22565717C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_225657264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225657474()
{
  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x2256574E8);
}

void sub_225657484(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_225657494(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  marisa::Agent::~Agent((marisa::Agent *)&v23);

  JUMPOUT(0x2256574E8);
}

void sub_225657720()
{
  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x2256577A0);
}

void sub_225657730(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_225657740(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  marisa::Agent::~Agent((marisa::Agent *)&v23);

  JUMPOUT(0x2256577A0);
}

void sub_225657828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_225657948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_225657A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_225657AD0()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_225657AE0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_225657AF0()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_225657B00()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_225657B10()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_225657B20()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_225657B30()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_225657B40()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_225657B50()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_225657B60()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_225657B70()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_225657B80()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_225657B90()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_225657BA0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_225657BB0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_225657BC0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_225657BD0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_225657BE0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_225657BF0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_225657C00()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_225657C10()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_225657C20()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_225657C30()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_225657C40()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_225657C50()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_225657C60()
{
  return MEMORY[0x270F6A270]();
}

uint64_t sub_225657C70()
{
  return MEMORY[0x270F6A278]();
}

uint64_t sub_225657C80()
{
  return MEMORY[0x270F6A280]();
}

uint64_t sub_225657C90()
{
  return MEMORY[0x270F6A290]();
}

uint64_t sub_225657CA0()
{
  return MEMORY[0x270F6A298]();
}

uint64_t sub_225657CB0()
{
  return MEMORY[0x270F6A2A0]();
}

uint64_t sub_225657CC0()
{
  return MEMORY[0x270F6A2A8]();
}

uint64_t sub_225657CD0()
{
  return MEMORY[0x270F6A2B0]();
}

uint64_t sub_225657CE0()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_225657CF0()
{
  return MEMORY[0x270F6A2D8]();
}

uint64_t sub_225657D00()
{
  return MEMORY[0x270F6A2E8]();
}

uint64_t sub_225657D10()
{
  return MEMORY[0x270F6A2F8]();
}

uint64_t sub_225657D20()
{
  return MEMORY[0x270F6A300]();
}

uint64_t sub_225657D30()
{
  return MEMORY[0x270F6A308]();
}

uint64_t sub_225657D40()
{
  return MEMORY[0x270F6A318]();
}

uint64_t sub_225657D50()
{
  return MEMORY[0x270F6A320]();
}

uint64_t sub_225657D60()
{
  return MEMORY[0x270F6A328]();
}

uint64_t sub_225657D70()
{
  return MEMORY[0x270F6A330]();
}

uint64_t sub_225657D80()
{
  return MEMORY[0x270F6A338]();
}

uint64_t sub_225657D90()
{
  return MEMORY[0x270F6A340]();
}

uint64_t sub_225657DA0()
{
  return MEMORY[0x270F6A348]();
}

uint64_t sub_225657DB0()
{
  return MEMORY[0x270F6A358]();
}

uint64_t sub_225657DD0()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_225657DE0()
{
  return MEMORY[0x270F6A3A0]();
}

uint64_t sub_225657DF0()
{
  return MEMORY[0x270F6A3B0]();
}

uint64_t sub_225657E00()
{
  return MEMORY[0x270F6A3C0]();
}

uint64_t sub_225657E10()
{
  return MEMORY[0x270F6A3D0]();
}

uint64_t sub_225657E20()
{
  return MEMORY[0x270F6A3E8]();
}

uint64_t sub_225657E30()
{
  return MEMORY[0x270F6A448]();
}

uint64_t sub_225657E40()
{
  return MEMORY[0x270F6A480]();
}

uint64_t sub_225657E50()
{
  return MEMORY[0x270F6A488]();
}

uint64_t sub_225657E60()
{
  return MEMORY[0x270F6A490]();
}

uint64_t sub_225657E70()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_225657E80()
{
  return MEMORY[0x270F6A4A0]();
}

uint64_t sub_225657E90()
{
  return MEMORY[0x270F6A4C0]();
}

uint64_t sub_225657EA0()
{
  return MEMORY[0x270F6A4E0]();
}

uint64_t sub_225657EB0()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_225657EC0()
{
  return MEMORY[0x270F6A530]();
}

uint64_t sub_225657ED0()
{
  return MEMORY[0x270F6A538]();
}

uint64_t sub_225657EE0()
{
  return MEMORY[0x270F6A540]();
}

uint64_t sub_225657EF0()
{
  return MEMORY[0x270F6A548]();
}

uint64_t sub_225657F00()
{
  return MEMORY[0x270F6A550]();
}

uint64_t sub_225657F10()
{
  return MEMORY[0x270F6A558]();
}

uint64_t sub_225657F20()
{
  return MEMORY[0x270F6A560]();
}

uint64_t sub_225657F30()
{
  return MEMORY[0x270F6A570]();
}

uint64_t sub_225657F40()
{
  return MEMORY[0x270F6A578]();
}

uint64_t sub_225657F50()
{
  return MEMORY[0x270F6A590]();
}

uint64_t sub_225657F60()
{
  return MEMORY[0x270F6A5C0]();
}

uint64_t sub_225657F70()
{
  return MEMORY[0x270F6A5C8]();
}

uint64_t sub_225657F80()
{
  return MEMORY[0x270F6A5D0]();
}

uint64_t sub_225657F90()
{
  return MEMORY[0x270F6A5E0]();
}

uint64_t sub_225657FA0()
{
  return MEMORY[0x270F6A5E8]();
}

uint64_t sub_225657FB0()
{
  return MEMORY[0x270F6A5F0]();
}

uint64_t sub_225657FC0()
{
  return MEMORY[0x270F6A5F8]();
}

uint64_t sub_225657FD0()
{
  return MEMORY[0x270F6A608]();
}

uint64_t sub_225657FE0()
{
  return MEMORY[0x270F6A610]();
}

uint64_t sub_225657FF0()
{
  return MEMORY[0x270F6A618]();
}

uint64_t sub_225658000()
{
  return MEMORY[0x270F6A620]();
}

uint64_t sub_225658010()
{
  return MEMORY[0x270F6A628]();
}

uint64_t sub_225658020()
{
  return MEMORY[0x270F6A630]();
}

uint64_t sub_225658030()
{
  return MEMORY[0x270F6A638]();
}

uint64_t sub_225658040()
{
  return MEMORY[0x270F6A640]();
}

uint64_t sub_225658050()
{
  return MEMORY[0x270F6A648]();
}

uint64_t sub_225658060()
{
  return MEMORY[0x270F6A650]();
}

uint64_t sub_225658070()
{
  return MEMORY[0x270F6A658]();
}

uint64_t sub_225658080()
{
  return MEMORY[0x270F6A660]();
}

uint64_t sub_225658090()
{
  return MEMORY[0x270F6A668]();
}

uint64_t sub_2256580A0()
{
  return MEMORY[0x270F6A670]();
}

uint64_t sub_2256580B0()
{
  return MEMORY[0x270F6A678]();
}

uint64_t sub_2256580C0()
{
  return MEMORY[0x270F6A680]();
}

uint64_t sub_2256580D0()
{
  return MEMORY[0x270F6A688]();
}

uint64_t sub_2256580E0()
{
  return MEMORY[0x270F6A690]();
}

uint64_t sub_2256580F0()
{
  return MEMORY[0x270F6A698]();
}

uint64_t sub_225658100()
{
  return MEMORY[0x270F6A708]();
}

uint64_t sub_225658110()
{
  return MEMORY[0x270F6A710]();
}

uint64_t sub_225658120()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_225658130()
{
  return MEMORY[0x270F6A730]();
}

uint64_t sub_225658140()
{
  return MEMORY[0x270F6A738]();
}

uint64_t sub_225658150()
{
  return MEMORY[0x270F6A740]();
}

uint64_t sub_225658160()
{
  return MEMORY[0x270F6A750]();
}

uint64_t sub_225658170()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_225658180()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_225658190()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_2256581A0()
{
  return MEMORY[0x270F6A778]();
}

uint64_t sub_2256581B0()
{
  return MEMORY[0x270F6A780]();
}

uint64_t sub_2256581C0()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_2256581D0()
{
  return MEMORY[0x270F6A798]();
}

uint64_t sub_2256581E0()
{
  return MEMORY[0x270F6A7A0]();
}

uint64_t sub_2256581F0()
{
  return MEMORY[0x270F6A7A8]();
}

uint64_t sub_225658200()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_225658210()
{
  return MEMORY[0x270F6A7C0]();
}

uint64_t sub_225658220()
{
  return MEMORY[0x270F6A7C8]();
}

uint64_t sub_225658230()
{
  return MEMORY[0x270F6A7D0]();
}

uint64_t sub_225658240()
{
  return MEMORY[0x270F6A7D8]();
}

uint64_t sub_225658250()
{
  return MEMORY[0x270F6A7E0]();
}

uint64_t sub_225658260()
{
  return MEMORY[0x270F6A7F0]();
}

uint64_t sub_225658270()
{
  return MEMORY[0x270F6A7F8]();
}

uint64_t sub_225658280()
{
  return MEMORY[0x270F6A800]();
}

uint64_t sub_225658290()
{
  return MEMORY[0x270F6A808]();
}

uint64_t sub_2256582A0()
{
  return MEMORY[0x270F6A810]();
}

uint64_t sub_2256582B0()
{
  return MEMORY[0x270F6A820]();
}

uint64_t sub_2256582C0()
{
  return MEMORY[0x270F6A828]();
}

uint64_t sub_2256582D0()
{
  return MEMORY[0x270F6A838]();
}

uint64_t sub_2256582E0()
{
  return MEMORY[0x270F6A840]();
}

uint64_t sub_2256582F0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_225658300()
{
  return MEMORY[0x270F6A8C8]();
}

uint64_t sub_225658310()
{
  return MEMORY[0x270F6A8D0]();
}

uint64_t sub_225658320()
{
  return MEMORY[0x270F6A8D8]();
}

uint64_t sub_225658330()
{
  return MEMORY[0x270F6A8E0]();
}

uint64_t sub_225658340()
{
  return MEMORY[0x270F6A8E8]();
}

uint64_t sub_225658350()
{
  return MEMORY[0x270F6A8F0]();
}

uint64_t sub_225658360()
{
  return MEMORY[0x270F6A8F8]();
}

uint64_t sub_225658370()
{
  return MEMORY[0x270F6A900]();
}

uint64_t sub_225658380()
{
  return MEMORY[0x270F6A908]();
}

uint64_t sub_225658390()
{
  return MEMORY[0x270F6A910]();
}

uint64_t sub_2256583A0()
{
  return MEMORY[0x270F6A918]();
}

uint64_t sub_2256583B0()
{
  return MEMORY[0x270F6A920]();
}

uint64_t sub_2256583C0()
{
  return MEMORY[0x270F6A928]();
}

uint64_t sub_2256583D0()
{
  return MEMORY[0x270F6A930]();
}

uint64_t sub_2256583E0()
{
  return MEMORY[0x270F6A938]();
}

uint64_t sub_2256583F0()
{
  return MEMORY[0x270F6A940]();
}

uint64_t sub_225658400()
{
  return MEMORY[0x270F6A948]();
}

uint64_t sub_225658410()
{
  return MEMORY[0x270F6A950]();
}

uint64_t sub_225658420()
{
  return MEMORY[0x270F6A958]();
}

uint64_t sub_225658430()
{
  return MEMORY[0x270F6A960]();
}

uint64_t sub_225658440()
{
  return MEMORY[0x270F6A968]();
}

uint64_t sub_225658450()
{
  return MEMORY[0x270F6A970]();
}

uint64_t sub_225658460()
{
  return MEMORY[0x270F6A978]();
}

uint64_t sub_225658470()
{
  return MEMORY[0x270F6A980]();
}

uint64_t sub_225658480()
{
  return MEMORY[0x270F6A988]();
}

uint64_t sub_225658490()
{
  return MEMORY[0x270F6A990]();
}

uint64_t sub_2256584A0()
{
  return MEMORY[0x270F6A998]();
}

uint64_t sub_2256584B0()
{
  return MEMORY[0x270F6A9A0]();
}

uint64_t sub_2256584C0()
{
  return MEMORY[0x270F6A9A8]();
}

uint64_t sub_2256584D0()
{
  return MEMORY[0x270F6A9B0]();
}

uint64_t sub_2256584E0()
{
  return MEMORY[0x270F6A9B8]();
}

uint64_t sub_2256584F0()
{
  return MEMORY[0x270F6A9C0]();
}

uint64_t sub_225658500()
{
  return MEMORY[0x270F6A9C8]();
}

uint64_t sub_225658510()
{
  return MEMORY[0x270F6A9D0]();
}

uint64_t sub_225658520()
{
  return MEMORY[0x270F6A9D8]();
}

uint64_t sub_225658530()
{
  return MEMORY[0x270F6A9E0]();
}

uint64_t sub_225658540()
{
  return MEMORY[0x270F6A9E8]();
}

uint64_t sub_225658550()
{
  return MEMORY[0x270F6A9F0]();
}

uint64_t sub_225658560()
{
  return MEMORY[0x270F6A9F8]();
}

uint64_t sub_225658570()
{
  return MEMORY[0x270F6AA00]();
}

uint64_t sub_225658580()
{
  return MEMORY[0x270F6AA08]();
}

uint64_t sub_225658590()
{
  return MEMORY[0x270F6AA10]();
}

uint64_t sub_2256585A0()
{
  return MEMORY[0x270F6AA18]();
}

uint64_t sub_2256585B0()
{
  return MEMORY[0x270F6AA20]();
}

uint64_t sub_2256585C0()
{
  return MEMORY[0x270F6AA28]();
}

uint64_t sub_2256585D0()
{
  return MEMORY[0x270F6AA30]();
}

uint64_t sub_2256585E0()
{
  return MEMORY[0x270F6AA60]();
}

uint64_t sub_2256585F0()
{
  return MEMORY[0x270F6AA68]();
}

uint64_t sub_225658600()
{
  return MEMORY[0x270F6AA78]();
}

uint64_t sub_225658610()
{
  return MEMORY[0x270F6AA88]();
}

uint64_t sub_225658620()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_225658630()
{
  return MEMORY[0x270F6AAA0]();
}

uint64_t sub_225658640()
{
  return MEMORY[0x270F6AAA8]();
}

uint64_t sub_225658650()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_225658660()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_225658670()
{
  return MEMORY[0x270F6AB10]();
}

uint64_t sub_225658680()
{
  return MEMORY[0x270F6AB58]();
}

uint64_t sub_225658690()
{
  return MEMORY[0x270F6AB60]();
}

uint64_t sub_2256586A0()
{
  return MEMORY[0x270F6AB68]();
}

uint64_t sub_2256586B0()
{
  return MEMORY[0x270F6AB70]();
}

uint64_t sub_2256586C0()
{
  return MEMORY[0x270F6AB90]();
}

uint64_t sub_2256586D0()
{
  return MEMORY[0x270F6ABA0]();
}

uint64_t sub_2256586E0()
{
  return MEMORY[0x270F6ABA8]();
}

uint64_t sub_2256586F0()
{
  return MEMORY[0x270F6ABB0]();
}

uint64_t sub_225658700()
{
  return MEMORY[0x270F6ABC0]();
}

uint64_t sub_225658710()
{
  return MEMORY[0x270F6ABD0]();
}

uint64_t sub_225658720()
{
  return MEMORY[0x270F6ABE0]();
}

uint64_t sub_225658730()
{
  return MEMORY[0x270F6ABE8]();
}

uint64_t sub_225658740()
{
  return MEMORY[0x270F6AC08]();
}

uint64_t sub_225658750()
{
  return MEMORY[0x270F6AC10]();
}

uint64_t sub_225658760()
{
  return MEMORY[0x270F6AC18]();
}

uint64_t sub_225658770()
{
  return MEMORY[0x270F6AC28]();
}

uint64_t sub_225658780()
{
  return MEMORY[0x270F6AC30]();
}

uint64_t sub_225658790()
{
  return MEMORY[0x270F6AC38]();
}

uint64_t sub_2256587A0()
{
  return MEMORY[0x270F6AC40]();
}

uint64_t sub_2256587B0()
{
  return MEMORY[0x270F6AC48]();
}

uint64_t sub_2256587C0()
{
  return MEMORY[0x270F6AC50]();
}

uint64_t sub_2256587D0()
{
  return MEMORY[0x270F6AC58]();
}

uint64_t sub_2256587E0()
{
  return MEMORY[0x270F6AC80]();
}

uint64_t sub_2256587F0()
{
  return MEMORY[0x270F6AC90]();
}

uint64_t sub_225658800()
{
  return MEMORY[0x270F6AC98]();
}

uint64_t sub_225658810()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_225658820()
{
  return MEMORY[0x270F6ACD0]();
}

uint64_t sub_225658830()
{
  return MEMORY[0x270F6ACD8]();
}

uint64_t sub_225658840()
{
  return MEMORY[0x270F6ACE0]();
}

uint64_t sub_225658850()
{
  return MEMORY[0x270F6ACE8]();
}

uint64_t sub_225658860()
{
  return MEMORY[0x270F6ACF0]();
}

uint64_t sub_225658870()
{
  return MEMORY[0x270F6ACF8]();
}

uint64_t sub_225658880()
{
  return MEMORY[0x270F6AD00]();
}

uint64_t sub_225658890()
{
  return MEMORY[0x270F6AD08]();
}

uint64_t sub_2256588A0()
{
  return MEMORY[0x270F6AD10]();
}

uint64_t sub_2256588B0()
{
  return MEMORY[0x270F6AD18]();
}

uint64_t sub_2256588C0()
{
  return MEMORY[0x270F6ADA8]();
}

uint64_t sub_2256588D0()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_2256588E0()
{
  return MEMORY[0x270F6ADC8]();
}

uint64_t sub_2256588F0()
{
  return MEMORY[0x270F6ADD0]();
}

uint64_t sub_225658900()
{
  return MEMORY[0x270F6ADD8]();
}

uint64_t sub_225658910()
{
  return MEMORY[0x270F6ADE0]();
}

uint64_t sub_225658920()
{
  return MEMORY[0x270F6ADE8]();
}

uint64_t sub_225658930()
{
  return MEMORY[0x270F6ADF0]();
}

uint64_t sub_225658940()
{
  return MEMORY[0x270F6ADF8]();
}

uint64_t _s12SiriNLUTypes0A31_Nlu_Internal_ComponentOverrideV0A12NLUOverridesE9namespaceAA0a1_c1_d1_F8MetadataV0F9NamespaceOvg_0()
{
  return MEMORY[0x270F6AE00]();
}

uint64_t sub_225658960()
{
  return MEMORY[0x270F6AE08]();
}

uint64_t sub_225658970()
{
  return MEMORY[0x270F6AE10]();
}

uint64_t sub_225658980()
{
  return MEMORY[0x270F6AE18]();
}

uint64_t sub_225658990()
{
  return MEMORY[0x270F6AE20]();
}

uint64_t sub_2256589A0()
{
  return MEMORY[0x270F6AE28]();
}

uint64_t sub_2256589B0()
{
  return MEMORY[0x270F6AE30]();
}

uint64_t sub_2256589C0()
{
  return MEMORY[0x270F6AE38]();
}

uint64_t sub_2256589D0()
{
  return MEMORY[0x270F6AE60]();
}

uint64_t sub_2256589E0()
{
  return MEMORY[0x270F6AE68]();
}

uint64_t sub_2256589F0()
{
  return MEMORY[0x270F6AE70]();
}

uint64_t sub_225658A00()
{
  return MEMORY[0x270F6AE78]();
}

uint64_t sub_225658A10()
{
  return MEMORY[0x270F6AE80]();
}

uint64_t sub_225658A20()
{
  return MEMORY[0x270F6AE88]();
}

uint64_t sub_225658A30()
{
  return MEMORY[0x270F6AE90]();
}

uint64_t sub_225658A40()
{
  return MEMORY[0x270F6AE98]();
}

uint64_t sub_225658A50()
{
  return MEMORY[0x270F6AEA0]();
}

uint64_t sub_225658A60()
{
  return MEMORY[0x270F6AF50]();
}

uint64_t sub_225658A70()
{
  return MEMORY[0x270F6AF58]();
}

uint64_t sub_225658A80()
{
  return MEMORY[0x270F6AF60]();
}

uint64_t sub_225658A90()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_225658AA0()
{
  return MEMORY[0x270F6AFF0]();
}

uint64_t sub_225658AB0()
{
  return MEMORY[0x270F6AFF8]();
}

uint64_t sub_225658AC0()
{
  return MEMORY[0x270F6B000]();
}

uint64_t sub_225658AD0()
{
  return MEMORY[0x270F6B008]();
}

uint64_t sub_225658AE0()
{
  return MEMORY[0x270F6B010]();
}

uint64_t sub_225658AF0()
{
  return MEMORY[0x270F6B018]();
}

uint64_t sub_225658B00()
{
  return MEMORY[0x270F6B1F0]();
}

uint64_t sub_225658B10()
{
  return MEMORY[0x270F6B1F8]();
}

uint64_t sub_225658B20()
{
  return MEMORY[0x270F6B200]();
}

uint64_t sub_225658B30()
{
  return MEMORY[0x270F6B208]();
}

uint64_t sub_225658B40()
{
  return MEMORY[0x270F6B210]();
}

uint64_t sub_225658B50()
{
  return MEMORY[0x270F6B218]();
}

uint64_t sub_225658B60()
{
  return MEMORY[0x270F6B940]();
}

uint64_t sub_225658B70()
{
  return MEMORY[0x270F6B948]();
}

uint64_t sub_225658B80()
{
  return MEMORY[0x270F6B950]();
}

uint64_t sub_225658B90()
{
  return MEMORY[0x270F6B958]();
}

uint64_t sub_225658BA0()
{
  return MEMORY[0x270F6B960]();
}

uint64_t sub_225658BB0()
{
  return MEMORY[0x270F6B968]();
}

uint64_t sub_225658BC0()
{
  return MEMORY[0x270F6B970]();
}

uint64_t sub_225658BD0()
{
  return MEMORY[0x270F6B978]();
}

uint64_t sub_225658BE0()
{
  return MEMORY[0x270F6BB10]();
}

uint64_t sub_225658BF0()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_225658C00()
{
  return MEMORY[0x270F6C9E8]();
}

uint64_t sub_225658C10()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_225658C20()
{
  return MEMORY[0x270F6CDB0]();
}

uint64_t sub_225658C30()
{
  return MEMORY[0x270F6CDB8]();
}

uint64_t sub_225658C40()
{
  return MEMORY[0x270F6F150]();
}

uint64_t sub_225658C50()
{
  return MEMORY[0x270F6F158]();
}

uint64_t sub_225658C60()
{
  return MEMORY[0x270F6F170]();
}

uint64_t sub_225658C70()
{
  return MEMORY[0x270F6F180]();
}

uint64_t sub_225658C80()
{
  return MEMORY[0x270F6F190]();
}

uint64_t sub_225658C90()
{
  return MEMORY[0x270F6F1B0]();
}

uint64_t sub_225658CA0()
{
  return MEMORY[0x270F6F1C0]();
}

uint64_t sub_225658CB0()
{
  return MEMORY[0x270F6F1C8]();
}

uint64_t sub_225658CC0()
{
  return MEMORY[0x270F6F270]();
}

uint64_t sub_225658CD0()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_225658CE0()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_225658CF0()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_225658D00()
{
  return MEMORY[0x270F446B8]();
}

uint64_t sub_225658D10()
{
  return MEMORY[0x270F446C0]();
}

uint64_t sub_225658D20()
{
  return MEMORY[0x270F446C8]();
}

uint64_t sub_225658D30()
{
  return MEMORY[0x270F44700]();
}

uint64_t sub_225658D40()
{
  return MEMORY[0x270F44708]();
}

uint64_t sub_225658D50()
{
  return MEMORY[0x270F44710]();
}

uint64_t sub_225658D60()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_225658D70()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_225658D80()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_225658DA0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_225658DB0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_225658DC0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_225658DD0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_225658DE0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_225658DF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_225658E00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_225658E10()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_225658E20()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_225658E30()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_225658E40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_225658E50()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_225658E60()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_225658E70()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_225658E80()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_225658EA0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_225658EB0()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_225658EC0()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_225658ED0()
{
  return MEMORY[0x270F9D858]();
}

uint64_t sub_225658EE0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_225658EF0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_225658F00()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_225658F10()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_225658F20()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_225658F30()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_225658F40()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_225658F50()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_225658F60()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_225658F70()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_225658F80()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_225658F90()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_225658FA0()
{
  return MEMORY[0x270F6F4D8]();
}

uint64_t sub_225658FB0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_225658FC0()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_225658FD0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_225658FE0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_225658FF0()
{
  return MEMORY[0x270EF2530]();
}

uint64_t sub_225659000()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_225659010()
{
  return MEMORY[0x270EF2598]();
}

uint64_t sub_225659030()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_225659040()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_225659050()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_225659060()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_225659070()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_225659080()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_225659090()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2256590A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2256590B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2256590C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2256590D0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2256590E0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2256590F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_225659100()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_225659110()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_225659120()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_225659130()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_225659140()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_225659150()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_225659160()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_225659170()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_225659180()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_225659190()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_2256591A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2256591B0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2256591C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2256591D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2256591E0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2256591F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_225659200()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_225659210()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_225659220()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_225659230()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_225659240()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_225659250()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_225659260()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_225659270()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_225659280()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x270F99C30](this, a2);
}

uint64_t marisa::Trie::build(marisa::Trie *this, Keyset *a2)
{
  return MEMORY[0x270F99C38](this, a2);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x270F99C48](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x270F99C58](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x270F99C60](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x270F99C68](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2, float a3)
{
  return MEMORY[0x270F99C80](this, a2, a3);
}

uint64_t marisa::Keyset::Keyset(marisa::Keyset *this)
{
  return MEMORY[0x270F99C88](this);
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99C90](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99C98](this, a2);
}

uint64_t marisa::Trie::save(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x270F99CA0](this, a2);
}

uint64_t marisa::Trie::size(marisa::Trie *this)
{
  return MEMORY[0x270F99CA8](this);
}

uint64_t marisa::Trie::lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99CB8](this, a2);
}

uint64_t marisa::Trie::num_keys(marisa::Trie *this)
{
  return MEMORY[0x270F99CC0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}