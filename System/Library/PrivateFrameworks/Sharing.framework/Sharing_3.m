uint64_t AirDropUserDefault.init(wrappedValue:_:kill:)(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = *v5;
  v8 = sub_1A568036C(a1, a2, a3, a4, a5);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v7 + 80) - 8) + 8))(a1);
  return v8;
}

void (*AirDropUserDefault.wrappedValue.modify(void *a1))(uint64_t a1, char a2)
{
  v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  SFUserDefault.value.getter((uint64_t)v7);
  return sub_1A567F708;
}

void sub_1A567F708(uint64_t a1, char a2)
{
  v2 = *(void **)a1;
  v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 8);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    sub_1A56805FC((uint64_t)v3);
    v7 = *(void (**)(void *, uint64_t))(v6 + 8);
    v7(v3, v5);
    v7(v4, v5);
  }
  else
  {
    sub_1A56805FC(*(void *)(*(void *)a1 + 32));
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t AirDropFeatureFlag.__allocating_init(_:kill:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  AirDropFeatureFlag.init(_:kill:)(a1, a2, a3, a4);
  return v8;
}

uint64_t AirDropFeatureFlag.init(_:kill:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_1E966C300 != -1) {
    swift_once();
  }
  v10 = (void *)qword_1E966C2F8;
  uint64_t v11 = sub_1A567AE60(a4);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C188);
  swift_allocObject();
  id v12 = v10;
  LOBYTE(v16) = 2;
  uint64_t v13 = sub_1A567FCF8(v10, a1, a2, a3, (uint64_t)"Sharing", 7, 2, 0, 0xD00000000000001ELL, 0x80000001A573BFC0, v16, v11, &qword_1E966C0D8);

  *(void *)(v5 + 16) = v13;
  uint64_t v14 = qword_1E966C4F0;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  sub_1A56D6228();
  sub_1A567A8EC();
  swift_release();
  swift_release();
  return v5;
}

void sub_1A567F9E8(unsigned __int8 *a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(*(void *)a2 + 16) + 56);
  if (v2)
  {
    uint64_t v3 = *a1;
    id v4 = v2;
    id v5 = (id)sub_1A56D5098();
    objc_msgSend(v4, sel_setBool_forKey_, v3, v5);
  }
}

void (*AirDropFeatureFlag.wrappedValue.modify(uint64_t a1))(void *a1)
{
  *(void *)a1 = *(void *)(v1 + 16);
  *(unsigned char *)(a1 + 8) = sub_1A5391378() & 1;
  return sub_1A567FAD8;
}

void sub_1A567FAD8(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = (unsigned __int8 *)(a1 + 1);
  uint64_t v3 = *(void **)(v2 + 56);
  if (v3)
  {
    uint64_t v4 = *v1;
    id v6 = v3;
    id v5 = (void *)sub_1A56D5098();
    objc_msgSend(v6, sel_setBool_forKey_, v4, v5);
  }
}

uint64_t AirDropFeatureFlag.deinit()
{
  swift_release();
  return v0;
}

uint64_t sub_1A567FB98(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_1A54E2FB8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[6 * v9 + 4];
  if (a1 + 32 < v10 + 48 * v8 && v10 < a1 + 32 + 48 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1A56D5C08();
  __break(1u);
  return result;
}

uint64_t sub_1A567FCF8(void *a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, __int16 a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13)
{
  uint64_t v14 = v13;
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  *(unsigned char *)(v14 + 32) = a4;
  *(void *)(v14 + 56) = a1;
  *(void *)(v14 + 64) = a5;
  *(void *)(v14 + 72) = a6;
  *(unsigned char *)(v14 + 80) = a7;
  *(unsigned char *)(v14 + 81) = HIBYTE(a7) & 1;
  *(unsigned char *)(v14 + 82) = a8;
  *(void *)(v14 + 96) = a9;
  *(void *)(v14 + 104) = a10;
  __swift_instantiateConcreteTypeFromMangledName(a13);
  swift_allocObject();
  id v18 = a1;
  uint64_t result = sub_1A56D4E68();
  *(void *)(v14 + 88) = result;
  *(void *)(v14 + 112) = a12;
  if ((a4 & 1) == 0)
  {
    if (a2)
    {
LABEL_9:
      *(void *)(v14 + 40) = sub_1A56D5168();
      *(void *)(v14 + 48) = v20;
      return v14;
    }
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(a2))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 >> 11 != 27)
  {
    if (WORD1(a2) > 0x10u)
    {
LABEL_12:
      __break(1u);
      goto LABEL_9;
    }
    if ((a2 & 0xFFFFFF80) != 0 || a2 <= 0xFF) {
      goto LABEL_9;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A567FEB0(void *a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, __int16 a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12;
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  *(unsigned char *)(v13 + 32) = a4;
  *(void *)(v13 + 56) = a1;
  *(void *)(v13 + 64) = a5;
  *(void *)(v13 + 72) = a6;
  *(unsigned char *)(v13 + 80) = a7;
  *(unsigned char *)(v13 + 81) = HIBYTE(a7) & 1;
  *(_DWORD *)(v13 + 84) = a8;
  *(void *)(v13 + 96) = a9;
  *(void *)(v13 + 104) = a10;
  __swift_instantiateConcreteTypeFromMangledName(qword_1E966C0E0);
  swift_allocObject();
  id v17 = a1;
  uint64_t result = sub_1A56D4E68();
  *(void *)(v13 + 88) = result;
  *(void *)(v13 + 112) = a12;
  if ((a4 & 1) == 0)
  {
    if (a2)
    {
LABEL_9:
      *(void *)(v13 + 40) = sub_1A56D5168();
      *(void *)(v13 + 48) = v19;
      return v13;
    }
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(a2))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 >> 11 != 27)
  {
    if (WORD1(a2) > 0x10u)
    {
LABEL_12:
      __break(1u);
      goto LABEL_9;
    }
    if ((a2 & 0xFFFFFF80) != 0 || a2 <= 0xFF) {
      goto LABEL_9;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A5680074(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t, uint64_t, unsigned char *))
{
  uint64_t v31 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  v30 = (void *)MEMORY[0x1E4FBC860];
  if (!v6) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v10 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    sub_1A54E3F20(*(void *)(a1 + 56) + 32 * i, (uint64_t)v39);
    v38[0] = v13;
    v38[1] = v14;
    swift_bridgeObjectRetain();
    a2(&v32, v13, v14, v39);
    uint64_t result = sub_1A54E4D44((uint64_t)v38, &qword_1E9674E70);
    uint64_t v15 = v33;
    if (v33)
    {
      uint64_t v25 = v32;
      uint64_t v26 = v35;
      uint64_t v27 = v34;
      unint64_t v28 = v36;
      uint64_t v29 = v37;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1A54E2FB8(0, v30[2] + 1, 1, v30);
        v30 = (void *)result;
      }
      unint64_t v20 = v30[2];
      unint64_t v19 = v30[3];
      unint64_t v21 = v20 + 1;
      if (v20 >= v19 >> 1)
      {
        uint64_t result = (uint64_t)sub_1A54E2FB8((void *)(v19 > 1), v20 + 1, 1, v30);
        unint64_t v21 = v20 + 1;
        v30 = (void *)result;
      }
      v30[2] = v21;
      v22 = &v30[6 * v20];
      v22[4] = v25;
      v22[5] = v15;
      v22[6] = v27;
      v22[7] = v26;
      *((unsigned char *)v22 + 64) = v28 & 1;
      uint64x2_t v23 = (uint64x2_t)vdupq_n_s64(v28);
      int16x8_t v24 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v23, (uint64x2_t)xmmword_1A56FE350), (int32x4_t)vshlq_u64(v23, (uint64x2_t)xmmword_1A56FE340));
      *(int8x8_t *)v24.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v24), (int8x8_t)0x1000100010001);
      *(_DWORD *)((char *)v22 + 65) = vmovn_s16(v24).u32[0];
      v22[9] = v29;
      if (v6) {
        goto LABEL_4;
      }
    }
    else if (v6)
    {
      goto LABEL_4;
    }
LABEL_7:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v16 >= v7) {
      goto LABEL_29;
    }
    unint64_t v17 = *(void *)(v31 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v7) {
        goto LABEL_29;
      }
      unint64_t v17 = *(void *)(v31 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v7) {
          goto LABEL_29;
        }
        unint64_t v17 = *(void *)(v31 + 8 * v9);
        if (!v17)
        {
          int64_t v9 = v16 + 3;
          if (v16 + 3 >= v7) {
            goto LABEL_29;
          }
          unint64_t v17 = *(void *)(v31 + 8 * v9);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v7)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v30;
  }
  unint64_t v17 = *(void *)(v31 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_29;
    }
    unint64_t v17 = *(void *)(v31 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1A568036C(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v6 = v5;
  HIDWORD(v21) = a4;
  uint64_t v22 = a1;
  uint64_t v10 = *(void *)(*(void *)v5 + 80);
  uint64_t v11 = sub_1A56D5898();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v21 - v13;
  if (qword_1E966C300 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)qword_1E966C2F8;
  type metadata accessor for SFUserDefault();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v14, 1, 1, v10);
  uint64_t v16 = sub_1A567AE60(a5);
  swift_bridgeObjectRelease();
  id v17 = v15;
  int64_t v18 = sub_1A54E3CA8(v15, a2, a3, SHIDWORD(v21), 0, 0, 256, v22, 0xD00000000000001ELL, 0x80000001A573BFC0, (uint64_t)v14, v16);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *(void *)(v6 + 16) = v18;
  uint64_t v19 = qword_1E966C4F0;
  swift_retain();
  if (v19 != -1) {
    swift_once();
  }
  sub_1A56D6228();
  sub_1A54DCD38();
  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_1A56805FC(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  unint64_t v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return SFUserDefault.value.setter((uint64_t)v2);
}

uint64_t type metadata accessor for AirDropFeatureFlag()
{
  return self;
}

uint64_t sub_1A56806E0@<X0>(void *a1@<X8>)
{
  return sub_1A54DCEA8(v1, a1);
}

void sub_1A56806FC()
{
  if (qword_1E966C300 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1E966C2F8;
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  id v2 = (id)qword_1E966C2F8;
  sub_1A56D5A28();
  swift_bridgeObjectRelease();
  if (v1)
  {
    if (qword_1E966C4F0 != -1) {
      swift_once();
    }
    sub_1A56D6228();
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(v11[0] + 24) + 16);
    os_unfair_lock_lock(v3);
    sub_1A56806E0(v11);
    os_unfair_lock_unlock(v3);
    if (v0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = v11[0];
      swift_release();
      uint64_t v5 = sub_1A567B048(v4);
      swift_bridgeObjectRelease();
      sub_1A567B1E8(v5);
      id v6 = objc_msgSend(v2, sel_dictionaryRepresentation);
      uint64_t v7 = sub_1A56D4FD8();

      MEMORY[0x1F4188790](v8);
      uint64_t v9 = sub_1A5680074(v7, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, unsigned char *))sub_1A56817F4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11[0] = v5;
      sub_1A567FB98(v9);
    }
  }
  else
  {
    sub_1A54F38F4();
    swift_allocError();
    *(void *)uint64_t v10 = 0xD000000000000037;
    *(void *)(v10 + 8) = 0x80000001A573C970;
    *(void *)(v10 + 16) = 0xD000000000000053;
    *(void *)(v10 + 24) = 0x80000001A573C9B0;
    *(void *)(v10 + 32) = 293;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    *(void *)(v10 + 72) = 0;
    *(void *)(v10 + 80) = 0x2000000000000000;
    *(void *)(v10 + 88) = 0;
    *(void *)(v10 + 96) = 0;
    swift_willThrow();
  }
}

unint64_t _s7Sharing21SFAirDropUserDefaultsC11descriptionSSvg_0()
{
  sub_1A56806FC();
  sub_1A567B2C0(v0);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C528);
  sub_1A54F3948();
  sub_1A56D5018();
  swift_bridgeObjectRelease();
  sub_1A56D5A28();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  return 0xD00000000000001CLL;
}

unint64_t sub_1A5680B0C()
{
  unint64_t result = qword_1E9674E68;
  if (!qword_1E9674E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674E68);
  }
  return result;
}

uint64_t sub_1A5680B60@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680B80(char *a1)
{
}

uint64_t sub_1A5680BA8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680BC8(char *a1)
{
}

uint64_t sub_1A5680BF0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680C10(char *a1)
{
}

uint64_t sub_1A5680C38@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680C58(char *a1)
{
}

uint64_t sub_1A5680C80@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680CA0(char *a1)
{
}

uint64_t sub_1A5680CC8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680CE8(char *a1)
{
}

uint64_t sub_1A5680D10@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680D30(char *a1)
{
}

void sub_1A5680D5C()
{
}

uint64_t sub_1A5680DA4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680DC4(char *a1)
{
}

uint64_t sub_1A5680DEC@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680E0C(char *a1)
{
}

uint64_t sub_1A5680E34@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680E54(char *a1)
{
}

uint64_t sub_1A5680E7C@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680E9C(char *a1)
{
}

uint64_t sub_1A5680EC4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567C6D4(a1);
}

uint64_t sub_1A5680EE4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_79Tm(a1, a2, a3, a4, (uint64_t (*)(char *))SFAirDropUserDefaults.browseAllInterfaces.setter);
}

uint64_t sub_1A5680EFC@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567C6D4(a1);
}

uint64_t sub_1A5680F1C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_79Tm(a1, a2, a3, a4, (uint64_t (*)(char *))SFAirDropUserDefaults.registerAllInterfaces.setter);
}

uint64_t keypath_set_79Tm(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  char v6 = *a1;
  return a5(&v6);
}

uint64_t sub_1A5680F70@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680F90(char *a1)
{
}

uint64_t sub_1A5680FB8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5680FD8(char *a1)
{
}

uint64_t sub_1A5681000@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681020(char *a1)
{
}

uint64_t sub_1A5681048@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681068(char *a1)
{
}

uint64_t sub_1A5681090@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A56810B0(char *a1)
{
}

uint64_t sub_1A56810D8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A56810F8(char *a1)
{
}

uint64_t sub_1A5681120@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681140(char *a1)
{
}

uint64_t sub_1A5681168@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681188(char *a1)
{
}

uint64_t sub_1A56811B0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A56811D0(char *a1)
{
}

uint64_t sub_1A56811F8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681218(char *a1)
{
}

void sub_1A5681244()
{
}

uint64_t sub_1A568126C@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A568128C(char *a1)
{
}

uint64_t sub_1A56812B4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A56812D4(char *a1)
{
}

uint64_t sub_1A56812FC@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A568131C(char *a1)
{
}

uint64_t sub_1A5681344@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681364(char *a1)
{
}

uint64_t sub_1A568138C@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A56813AC(char *a1)
{
}

uint64_t sub_1A56813D4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D7D0(a1);
}

void sub_1A56813F4(char *a1)
{
}

uint64_t sub_1A568141C@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D7D0(a1);
}

void sub_1A568143C(char *a1)
{
}

uint64_t sub_1A5681464@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681484(char *a1)
{
}

uint64_t sub_1A56814AC@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A56814CC(char *a1)
{
}

uint64_t sub_1A56814F4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A567D500(a1);
}

void sub_1A5681514(char *a1)
{
}

uint64_t sub_1A568153C@<X0>(uint64_t a1@<X8>)
{
  return AirDropUserDefault.wrappedValue.getter(a1);
}

uint64_t sub_1A5681560(uint64_t a1)
{
  return sub_1A56805FC(a1);
}

uint64_t sub_1A5681584()
{
  return 16;
}

__n128 sub_1A5681590(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

id sub_1A568159C@<X0>(unsigned char *a1@<X8>)
{
  id result = sub_1A5391378();
  *a1 = result & 1;
  return result;
}

uint64_t type metadata accessor for SFAirDropUserDefaults()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SFAirDropUserDefaults.Process(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 7;
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
        JUMPOUT(0x1A56816C4);
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
          *id result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SFAirDropUserDefaults.Process()
{
  return &type metadata for SFAirDropUserDefaults.Process;
}

uint64_t sub_1A56816FC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AirDropUserDefault()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AirDropUserDefault(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AirDropUserDefault);
}

uint64_t dispatch thunk of AirDropUserDefault.__allocating_init(wrappedValue:_:kill:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for AirDropFeatureFlag(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AirDropFeatureFlag);
}

uint64_t dispatch thunk of AirDropFeatureFlag.__allocating_init(_:kill:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void sub_1A56817B4(uint64_t a1@<X8>)
{
  sub_1A5679F1C(v1, a1);
}

uint64_t sub_1A56817D4()
{
  return sub_1A567A600(v0) & 1;
}

uint64_t sub_1A56817F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A567ED44(a1, a2, *(void **)(v3 + 16), a3);
}

uint64_t sub_1A56817FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1A567A4CC(a1);
}

void sub_1A568181C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1A567A2F0(a1, a2, v3, a3);
}

uint64_t sub_1A568183C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A567A100(v1, a1);
}

uint64_t sub_1A568185C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A5679DE8(a1);
}

void sub_1A568187C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_1A5679C84(a1, a2, v3, a3);
}

uint64_t sub_1A56818A4(uint64_t a1)
{
  return sub_1A54E7DE0(a1);
}

ValueMetadata *type metadata accessor for SFAirDropReceive.UserInteractionHandler()
{
  return &type metadata for SFAirDropReceive.UserInteractionHandler;
}

uint64_t sub_1A56818D0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1A5681928@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (int *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t SFClientIdentity.init(addingUntrustedProcessName:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5681B28(a3, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1A5681BF0(a3);
    uint64_t v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    int v25 = *(_DWORD *)&v10[v11[12]];
    uint64_t v12 = &v10[v11[16]];
    uint64_t v13 = *(void *)v12;
    uint64_t v23 = *((void *)v12 + 1);
    uint64_t v24 = v13;
    swift_bridgeObjectRelease();
    uint64_t v14 = v11[24];
    int v15 = *(_DWORD *)&v10[v14];
    uint64_t v16 = v11[12];
    id v17 = (void *)(a4 + v11[16]);
    int64_t v18 = (void *)(a4 + v11[20]);
    uint64_t v19 = sub_1A56D4CB8();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(a4, v10, v19);
    *(_DWORD *)(a4 + v16) = v25;
    uint64_t v20 = v23;
    *id v17 = v24;
    v17[1] = v20;
    *int64_t v18 = a1;
    v18[1] = a2;
    *(_DWORD *)(a4 + v14) = v15;
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1A5681B8C(a3, a4);
    return sub_1A5681BF0((uint64_t)v10);
  }
}

uint64_t sub_1A5681B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFClientIdentity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A5681B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFClientIdentity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A5681BF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SFClientIdentity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SFClientIdentity.init(xpcConnection:accessLevel:)@<X0>(void *a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  int v5 = *a2;
  int v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
  uint64_t v7 = v6[12];
  uint64_t v8 = (uint64_t *)(a3 + v6[16]);
  uint64_t v9 = (void *)(a3 + v6[20]);
  uint64_t v10 = v6[24];
  sub_1A56D4CA8();
  *(_DWORD *)(a3 + v7) = objc_msgSend(a1, sel_processIdentifier);
  uint64_t v11 = sub_1A55D4ED8();
  uint64_t v13 = v12;

  *uint64_t v8 = v11;
  v8[1] = v13;
  *uint64_t v9 = 0;
  v9[1] = 0;
  *(_DWORD *)(a3 + v10) = v5;
  type metadata accessor for SFClientIdentity();

  return swift_storeEnumTagMultiPayload();
}

uint64_t SFClientIdentity.connectionID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v4);
  int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5681B28(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_1A56D4CB8();
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v6, v7);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  else
  {
    sub_1A5681BF0((uint64_t)v6);
    uint64_t v10 = sub_1A56D4CB8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
}

unint64_t SFClientIdentity.bundleIdentifier.getter()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000010;
  uint64_t v3 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5681B28(v1, (uint64_t)v5);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      unint64_t v2 = *(void *)&v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078) + 64)];
      swift_bridgeObjectRelease();
      uint64_t v7 = sub_1A56D4CB8();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
    }
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0xE000000000000000;
    sub_1A56D5A28();
    swift_bridgeObjectRelease();
    unint64_t v9 = 0xD000000000000018;
    unint64_t v10 = 0x80000001A573CA70;
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    return v9;
  }
  return v2;
}

uint64_t SFClientIdentity.untrustedProcessName.getter()
{
  uint64_t v1 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5681B28(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_1A5681BF0((uint64_t)v3);
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload != 1)
  {
LABEL_5:
    id v8 = objc_msgSend(self, sel_processInfo);
    id v9 = objc_msgSend(v8, sel_processName);

    uint64_t v6 = sub_1A56D50D8();
    return v6;
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)&v3[*(int *)(v5 + 80)];
  uint64_t v7 = sub_1A56D4CB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v3, v7);
  return v6;
}

id SFClientIdentity.pid.getter()
{
  uint64_t v1 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5681B28(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_1A5681BF0((uint64_t)v3);
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload != 1)
  {
LABEL_5:
    id v7 = objc_msgSend(self, sel_processInfo);
    id v5 = objc_msgSend(v7, sel_processIdentifier);

    return v5;
  }
  id v5 = (id)*(unsigned int *)&v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078) + 48)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v3, v6);
  return v5;
}

uint64_t SFClientIdentity.shortDescription.getter()
{
  uint64_t v1 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  SFClientIdentity.bundleIdentifier.getter();
  uint64_t v5 = v4;
  sub_1A5681B28(v0, (uint64_t)v3);
  if (!v5) {
    SFClientIdentity.untrustedProcessName.getter();
  }
  sub_1A5681BF0((uint64_t)v3);
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  v7[3] = SFClientIdentity.pid.getter();
  sub_1A56D5E78();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t SFClientIdentity.accessLevel.getter@<X0>(int *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SFClientIdentity();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5681B28(v2, (uint64_t)v6);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result)
  {
    if (result == 1)
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *a1 = *(_DWORD *)&v6[*(int *)(v8 + 96)];
      uint64_t v9 = sub_1A56D4CB8();
      return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v6, v9);
    }
    if (qword_1E9670390 != -1) {
      uint64_t result = swift_once();
    }
    int v10 = dword_1E9674EAC;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    if (qword_1E9670388 != -1) {
      uint64_t result = swift_once();
    }
    int v10 = dword_1E9674EA8;
  }
  *a1 = v10;
  return result;
}

unint64_t SFClientIdentity.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SFClientIdentity();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v16 - v8;
  unint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_1A56D5A28();
  swift_bridgeObjectRelease();
  unint64_t v17 = 0xD000000000000012;
  unint64_t v18 = 0x80000001A573CA90;
  SFClientIdentity.bundleIdentifier.getter();
  uint64_t v11 = v10;
  sub_1A5681B28(v0, (uint64_t)v9);
  if (!v11) {
    SFClientIdentity.untrustedProcessName.getter();
  }
  sub_1A5681BF0((uint64_t)v9);
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  v16[3] = SFClientIdentity.pid.getter();
  sub_1A56D5E78();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  sub_1A5681B28(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_1A5681BF0((uint64_t)v7);
    uint64_t v14 = sub_1A56D4CB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v3, 1, 1, v14);
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1A56D4CB8();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v3, v7, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v3, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v3, 1, v12) == 1)
  {
LABEL_7:
    sub_1A54E4D44((uint64_t)v3, qword_1E966B098);
    goto LABEL_8;
  }
  _s7Sharing9SFAirDropO18TransferIdentifierV11stringValueSSvg_0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v3, v12);
LABEL_8:
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  return v17;
}

uint64_t sub_1A5682934()
{
  uint64_t v0 = sub_1A56D4D98();
  __swift_allocate_value_buffer(v0, qword_1E9674E90);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9674E90);
  if (qword_1EB3DB9F8[0] != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EB3DC850);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t SFClientAccessLevel.rawValue.getter()
{
  return *v0;
}

uint64_t SFClientAccessLevel.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static SFClientAccessLevel.allowRestrictedBoop.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static SFClientAccessLevel.proximityHandoffInteractions.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static SFClientAccessLevel.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_1A5682A2C()
{
  int v0 = unk_1EF9AD704;
  if ((unk_1EF9AD704 & ~dword_1EF9AD700) == 0) {
    int v0 = 0;
  }
  dword_1E9674EA8 = v0 | dword_1EF9AD700;
}

void *static SFClientAccessLevel.all.getter@<X0>(_DWORD *a1@<X8>)
{
  return sub_1A5682AEC(&qword_1E9670388, &dword_1E9674EA8, a1);
}

uint64_t sub_1A5682A74()
{
  if (qword_1E9670388 != -1) {
    uint64_t result = swift_once();
  }
  dword_1E9674EAC = dword_1E9674EA8;
  return result;
}

void *static SFClientAccessLevel.xctest.getter@<X0>(_DWORD *a1@<X8>)
{
  return sub_1A5682AEC(&qword_1E9670390, &dword_1E9674EAC, a1);
}

void *sub_1A5682AEC@<X0>(void *result@<X0>, _DWORD *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

_DWORD *SFClientAccessLevel.verifyHasAccess(to:)(_DWORD *result)
{
  if ((*result & ~*v1) != 0)
  {
    if (qword_1E9670380 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1A56D4D98();
    __swift_project_value_buffer(v2, (uint64_t)qword_1E9674E90);
    uint64_t v3 = sub_1A56D4D78();
    os_log_type_t v4 = sub_1A56D57B8();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = MEMORY[0x1E4FBC860];
    if (v5)
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = v11;
      *(_DWORD *)uint64_t v7 = 136315650;
      uint64_t v14 = 91;
      unint64_t v15 = 0xE100000000000000;
      uint64_t v16 = v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C528);
      sub_1A54F3948();
      sub_1A56D5018();
      sub_1A56D51C8();
      swift_bridgeObjectRelease();
      sub_1A56D51C8();
      uint64_t v14 = sub_1A54E3290(91, 0xE100000000000000, &v12);
      sub_1A56D5928();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v14 = 91;
      unint64_t v15 = 0xE100000000000000;
      uint64_t v16 = MEMORY[0x1E4FBC860];
      sub_1A56D5018();
      sub_1A56D51C8();
      uint64_t v6 = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRelease();
      sub_1A56D51C8();
      uint64_t v14 = sub_1A54E3290(v14, v15, &v12);
      sub_1A56D5928();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 22) = 2080;
      uint64_t v14 = 91;
      unint64_t v15 = 0xE100000000000000;
      uint64_t v16 = v6;
      sub_1A56D5018();
      sub_1A56D51C8();
      swift_bridgeObjectRelease();
      sub_1A56D51C8();
      uint64_t v14 = sub_1A54E3290(v14, v15, &v12);
      sub_1A56D5928();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A5389000, v3, v4, "Operation denied {description: %s, requestedAccessLevel: %s, currentAccessLevel: %s}", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1A626CE20](v11, -1, -1);
      MEMORY[0x1A626CE20](v7, -1, -1);
    }

    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_1A56D5A28();
    sub_1A56D51C8();
    uint64_t v12 = 91;
    unint64_t v13 = 0xE100000000000000;
    uint64_t v16 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C528);
    sub_1A54F3948();
    sub_1A56D5018();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    uint64_t v12 = 91;
    unint64_t v13 = 0xE100000000000000;
    uint64_t v16 = v6;
    sub_1A56D5018();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    uint64_t v12 = 91;
    unint64_t v13 = 0xE100000000000000;
    uint64_t v16 = v6;
    sub_1A56D5018();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    uint64_t v8 = v14;
    unint64_t v9 = v15;
    sub_1A54F38F4();
    swift_allocError();
    *(void *)uint64_t v10 = v8;
    *(void *)(v10 + 8) = v9;
    *(void *)(v10 + 16) = 0xD000000000000052;
    *(void *)(v10 + 24) = 0x80000001A573CB10;
    *(void *)(v10 + 32) = 136;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    return (_DWORD *)swift_willThrow();
  }
  return result;
}

uint64_t SFClientAccessLevel.description.getter()
{
  return 91;
}

uint64_t sub_1A5683110@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_1A5681928(a1, a2);
}

uint64_t SFClientAccessLevel.init(xpcConnection:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  os_log_type_t v4 = (void *)sub_1A56D5098();
  id v5 = objc_msgSend(a1, sel_valueForEntitlement_, v4);

  if (v5)
  {
    sub_1A56D5968();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_1A54E3E90((uint64_t)&v13, (uint64_t)v15);
  uint64_t v6 = v16;
  uint64_t v7 = (void *)sub_1A56D5098();
  id v8 = objc_msgSend(a1, sel_valueForEntitlement_, v7);

  if (v8)
  {
    sub_1A56D5968();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  int v9 = v6 != 0;
  sub_1A54E3E90((uint64_t)v12, (uint64_t)&v13);
  uint64_t v10 = *((void *)&v14 + 1);

  if (v10) {
    v9 |= 2u;
  }
  sub_1A54E4D44((uint64_t)&v13, &qword_1EB3DB9F0);
  uint64_t result = sub_1A54E4D44((uint64_t)v15, &qword_1EB3DB9F0);
  *a2 = v9;
  return result;
}

uint64_t sub_1A5683298()
{
  return 91;
}

unint64_t sub_1A568332C()
{
  unint64_t result = qword_1E9674EB0;
  if (!qword_1E9674EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674EB0);
  }
  return result;
}

unint64_t sub_1A5683384()
{
  unint64_t result = qword_1E9674EB8;
  if (!qword_1E9674EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674EB8);
  }
  return result;
}

unint64_t sub_1A56833DC()
{
  unint64_t result = qword_1E966BCD8;
  if (!qword_1E966BCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966BCD8);
  }
  return result;
}

unint64_t sub_1A5683434()
{
  unint64_t result = qword_1E966BCE0[0];
  if (!qword_1E966BCE0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E966BCE0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SFClientIdentity(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      uint64_t v10 = sub_1A56D4CB8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      *(_DWORD *)((char *)a1 + v11[12]) = *(_DWORD *)((char *)a2 + v11[12]);
      uint64_t v12 = v11[16];
      long long v13 = (uint64_t *)((char *)a1 + v12);
      long long v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      *long long v13 = v16;
      v13[1] = v15;
      uint64_t v17 = v11[20];
      unint64_t v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      *unint64_t v18 = *v19;
      v18[1] = v20;
      *(_DWORD *)((char *)a1 + v11[24]) = *(_DWORD *)((char *)a2 + v11[24]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
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

uint64_t destroy for SFClientIdentity(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v3 = sub_1A56D4CB8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SFClientIdentity(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_1A56D4CB8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    *(_DWORD *)((char *)a1 + v9[12]) = *(_DWORD *)((char *)a2 + v9[12]);
    uint64_t v10 = v9[16];
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    *uint64_t v11 = v14;
    v11[1] = v13;
    uint64_t v15 = v9[20];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *(_DWORD *)((char *)a1 + v9[24]) = *(_DWORD *)((char *)a2 + v9[24]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
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

void *assignWithCopy for SFClientIdentity(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A5681BF0((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_1A56D4CB8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      *(_DWORD *)((char *)a1 + v8[12]) = *(_DWORD *)((char *)a2 + v8[12]);
      uint64_t v9 = v8[16];
      uint64_t v10 = (void *)((char *)a1 + v9);
      uint64_t v11 = (void *)((char *)a2 + v9);
      void *v10 = *v11;
      v10[1] = v11[1];
      uint64_t v12 = v8[20];
      uint64_t v13 = (void *)((char *)a1 + v12);
      uint64_t v14 = (void *)((char *)a2 + v12);
      *uint64_t v13 = *v14;
      v13[1] = v14[1];
      *(_DWORD *)((char *)a1 + v8[24]) = *(_DWORD *)((char *)a2 + v8[24]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
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

char *initializeWithTake for SFClientIdentity(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1A56D4CB8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    *(_DWORD *)&a1[v7[12]] = *(_DWORD *)&a2[v7[12]];
    *(_OWORD *)&a1[v7[16]] = *(_OWORD *)&a2[v7[16]];
    *(_OWORD *)&a1[v7[20]] = *(_OWORD *)&a2[v7[20]];
    *(_DWORD *)&a1[v7[24]] = *(_DWORD *)&a2[v7[24]];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for SFClientIdentity(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A5681BF0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1A56D4CB8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      *(_DWORD *)&a1[v7[12]] = *(_DWORD *)&a2[v7[12]];
      *(_OWORD *)&a1[v7[16]] = *(_OWORD *)&a2[v7[16]];
      *(_OWORD *)&a1[v7[20]] = *(_OWORD *)&a2[v7[20]];
      *(_DWORD *)&a1[v7[24]] = *(_DWORD *)&a2[v7[24]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1A5683B44()
{
  uint64_t v3 = &unk_1A56FE6F8;
  uint64_t result = sub_1A56D4CB8();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout();
    os_log_type_t v4 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_1A5683C10()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9672FF0);
  MEMORY[0x1F4188790](v0 - 8);
  char v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1A56D4D68();
  __swift_allocate_value_buffer(v3, qword_1E96A7F28);
  __swift_project_value_buffer(v3, (uint64_t)qword_1E96A7F28);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  return sub_1A56D4D38();
}

uint64_t sub_1A5683D08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 56);
    for (unint64_t i = (uint64_t *)(a1 + 56); ; i += 4)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      uint64_t v7 = *(v3 - 1);
      uint64_t v8 = *v3;
      BOOL v9 = *(i - 3) == *(v3 - 3) && *(i - 2) == *(v3 - 2);
      if (!v9 && (sub_1A56D5F28() & 1) == 0) {
        break;
      }
      BOOL v10 = v5 == v7 && v6 == v8;
      if (!v10 && (sub_1A56D5F28() & 1) == 0) {
        break;
      }
      v3 += 4;
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_1A5683DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A56D4A28();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  MEMORY[0x1F4188790](v5);
  BOOL v9 = (char *)&v28 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      uint64_t v31 = v7;
      uint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      v30 = (void (**)(uint64_t, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      uint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        uint64_t v19 = v9;
        uint64_t v20 = v9;
        uint64_t v21 = v32;
        v32((uint64_t)v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        BOOL v9 = v20;
        sub_1A5687D8C(&qword_1E9672A80, MEMORY[0x1E4F276F0]);
        char v23 = sub_1A56D5058();
        uint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24((uint64_t)v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v14 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_1A5683FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674FA0) - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = v11 - 1;
      uint64_t v14 = *(void *)(v8 + 72);
      do
      {
        sub_1A54F60EC(a1 + v12, (uint64_t)v10, &qword_1E9674FA0);
        sub_1A54F60EC(a2 + v12, (uint64_t)v7, &qword_1E9674FA0);
        char v15 = sub_1A5684C04((uint64_t)v10, (uint64_t)v7, &qword_1E9674FA8, &qword_1E9674FA0, &qword_1E9674FB0, &qword_1E9674FC0, &qword_1E9674FB8);
        sub_1A54E4D44((uint64_t)v7, &qword_1E9674FA0);
        sub_1A54E4D44((uint64_t)v10, &qword_1E9674FA0);
        BOOL v17 = v13-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v14;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1A568419C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674EE0) - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = v11 - 1;
      uint64_t v14 = *(void *)(v8 + 72);
      do
      {
        sub_1A54F60EC(a1 + v12, (uint64_t)v10, &qword_1E9674EE0);
        sub_1A54F60EC(a2 + v12, (uint64_t)v7, &qword_1E9674EE0);
        char v15 = sub_1A5684C04((uint64_t)v10, (uint64_t)v7, &qword_1E9674EE8, &qword_1E9674EE0, &qword_1E9674FF0, &qword_1E9674EF8, &qword_1E9674FF8);
        sub_1A54E4D44((uint64_t)v7, &qword_1E9674EE0);
        sub_1A54E4D44((uint64_t)v10, &qword_1E9674EE0);
        BOOL v17 = v13-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v14;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1A5684348(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a3) - 8;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (uint64_t *)((char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  unint64_t v12 = (char *)&v54 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  char v15 = (uint64_t *)((char *)&v54 - v14);
  MEMORY[0x1F4188790](v13);
  uint64_t v18 = (uint64_t *)((char *)&v54 - v17);
  uint64_t v63 = a1;
  uint64_t v64 = a2;
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v19 || v63 == v64) {
    return 1;
  }
  unint64_t v20 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v57 = *(void *)(v16 + 72);
  v58 = v3;
  v59 = v12;
  v60 = v9;
  v61 = (uint64_t *)((char *)&v54 - v17);
  v62 = v15;
  while (1)
  {
    sub_1A54F60EC(v63 + v20, (uint64_t)v18, v3);
    sub_1A54F60EC(v64 + v20, (uint64_t)v15, v3);
    if (*v18 == *v15 && v18[1] == v15[1])
    {
      sub_1A54F60EC((uint64_t)v18, (uint64_t)v12, v3);
      sub_1A54F60EC((uint64_t)v15, (uint64_t)v9, v3);
    }
    else
    {
      char v29 = sub_1A56D5F28();
      sub_1A54F60EC((uint64_t)v18, (uint64_t)v12, v3);
      sub_1A54F60EC((uint64_t)v15, (uint64_t)v9, v3);
      if ((v29 & 1) == 0) {
        goto LABEL_34;
      }
    }
    uint64_t v31 = *((void *)v12 + 2);
    uint64_t v30 = *((void *)v12 + 3);
    uint64_t v33 = *((void *)v12 + 4);
    uint64_t v32 = *((void *)v12 + 5);
    int v34 = v12[48];
    uint64_t v36 = v9[2];
    uint64_t v35 = v9[3];
    uint64_t v37 = v9;
    uint64_t v38 = v9[4];
    uint64_t v39 = v37[5];
    int v40 = *((unsigned __int8 *)v37 + 48);
    uint64_t v65 = v19;
    if (!v34)
    {
      if (v40) {
        goto LABEL_32;
      }
      goto LABEL_19;
    }
    if (v34 == 1)
    {
      if (v40 != 1) {
        goto LABEL_32;
      }
LABEL_19:
      if (v31 == v36 && v30 == v35) {
        goto LABEL_5;
      }
      uint64_t v41 = v33;
      uint64_t v42 = v32;
      uint64_t v43 = v30;
      uint64_t v56 = v39;
      uint64_t v44 = v35;
      int v45 = sub_1A56D5F28();
      uint64_t v46 = v56;
      goto LABEL_29;
    }
    if (v40 != 2)
    {
LABEL_32:
      uint64_t v47 = v30;
      uint64_t v52 = v33;
      uint64_t v49 = v32;
      goto LABEL_33;
    }
    if (v31 != v36 || v30 != v35)
    {
      uint64_t v47 = v30;
      uint64_t v56 = v39;
      uint64_t v48 = v35;
      uint64_t v49 = v32;
      char v50 = sub_1A56D5F28();
      uint64_t v30 = v47;
      uint64_t v32 = v49;
      uint64_t v35 = v48;
      uint64_t v39 = v56;
      if ((v50 & 1) == 0) {
        break;
      }
    }
    if (v33 == v38 && v32 == v39)
    {
LABEL_5:
      uint64_t v21 = v36;
      uint64_t v22 = v30;
      uint64_t v23 = v39;
      uint64_t v24 = v33;
      uint64_t v25 = v36;
      uint64_t v26 = v35;
      uint64_t v27 = v32;
      sub_1A551182C(v21, v35, v38, v39, v34);
      sub_1A551182C(v31, v22, v24, v27, v34);
      sub_1A5512C74(v31, v22, v24, v27, v34);
      sub_1A5512C74(v25, v26, v38, v23, v34);
      uint64_t v9 = v60;
      uint64_t v3 = v58;
      sub_1A54E4D44((uint64_t)v60, v58);
      unint64_t v12 = v59;
      sub_1A54E4D44((uint64_t)v59, v3);
      char v15 = v62;
      sub_1A54E4D44((uint64_t)v62, v3);
      uint64_t v18 = v61;
      sub_1A54E4D44((uint64_t)v61, v3);
      goto LABEL_6;
    }
    uint64_t v41 = v33;
    uint64_t v42 = v32;
    uint64_t v43 = v30;
    uint64_t v56 = v38;
    uint64_t v46 = v39;
    uint64_t v44 = v35;
    int v45 = sub_1A56D5F28();
    uint64_t v38 = v56;
LABEL_29:
    int v55 = v45;
    sub_1A551182C(v36, v44, v38, v46, v34);
    sub_1A551182C(v31, v43, v41, v42, v34);
    sub_1A5512C74(v31, v43, v41, v42, v34);
    sub_1A5512C74(v36, v44, v38, v46, v34);
    uint64_t v9 = v60;
    uint64_t v3 = v58;
    sub_1A54E4D44((uint64_t)v60, v58);
    unint64_t v12 = v59;
    sub_1A54E4D44((uint64_t)v59, v3);
    char v15 = v62;
    sub_1A54E4D44((uint64_t)v62, v3);
    uint64_t v18 = v61;
    sub_1A54E4D44((uint64_t)v61, v3);
    if ((v55 & 1) == 0) {
      return 0;
    }
LABEL_6:
    v20 += v57;
    uint64_t v19 = v65 - 1;
    if (v65 == 1) {
      return 1;
    }
  }
  uint64_t v52 = v33;
  LOBYTE(v40) = 2;
  LOBYTE(v34) = 2;
LABEL_33:
  uint64_t v54 = v35;
  uint64_t v53 = v39;
  sub_1A551182C(v36, v35, v38, v39, v40);
  sub_1A551182C(v31, v47, v52, v49, v34);
  sub_1A5512C74(v31, v47, v52, v49, v34);
  sub_1A5512C74(v36, v54, v38, v53, v40);
  uint64_t v18 = v61;
  char v15 = v62;
  unint64_t v12 = v59;
  uint64_t v9 = v60;
  uint64_t v3 = v58;
LABEL_34:
  sub_1A54E4D44((uint64_t)v9, v3);
  sub_1A54E4D44((uint64_t)v12, v3);
  sub_1A54E4D44((uint64_t)v15, v3);
  sub_1A54E4D44((uint64_t)v18, v3);
  return 0;
}

uint64_t sub_1A56848AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674FC8) - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = v11 - 1;
      uint64_t v14 = *(void *)(v8 + 72);
      do
      {
        sub_1A54F60EC(a1 + v12, (uint64_t)v10, &qword_1E9674FC8);
        sub_1A54F60EC(a2 + v12, (uint64_t)v7, &qword_1E9674FC8);
        char v15 = sub_1A5684C04((uint64_t)v10, (uint64_t)v7, &qword_1E9674FD0, &qword_1E9674FC8, &qword_1E9674FD8, &qword_1E9674FE8, &qword_1E9674FE0);
        sub_1A54E4D44((uint64_t)v7, &qword_1E9674FC8);
        sub_1A54E4D44((uint64_t)v10, &qword_1E9674FC8);
        BOOL v17 = v13-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v14;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1A5684A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674F78) - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = v11 - 1;
      uint64_t v14 = *(void *)(v8 + 72);
      do
      {
        sub_1A54F60EC(a1 + v12, (uint64_t)v10, &qword_1E9674F78);
        sub_1A54F60EC(a2 + v12, (uint64_t)v7, &qword_1E9674F78);
        char v15 = sub_1A5684C04((uint64_t)v10, (uint64_t)v7, &qword_1E9674F80, &qword_1E9674F78, &qword_1E9674F88, &qword_1E9674F98, &qword_1E9674F90);
        sub_1A54E4D44((uint64_t)v7, &qword_1E9674F78);
        sub_1A54E4D44((uint64_t)v10, &qword_1E9674F78);
        BOOL v17 = v13-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v14;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1A5684C04(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t *a7)
{
  v99 = a6;
  v100 = a7;
  *(void *)&long long v102 = a1;
  *((void *)&v102 + 1) = a2;
  uint64_t v10 = sub_1A56D4CB8();
  uint64_t v103 = *(void *)(v10 - 8);
  uint64_t v104 = v10;
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  v96 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v97 = (char *)&v90 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v95 = (uint64_t *)((char *)&v90 - v16);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v90 - v17;
  v101 = a3;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  uint64_t v22 = (char *)&v90 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  uint64_t v25 = (char *)&v90 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (uint64_t *)((char *)&v90 - v26);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v29 = MEMORY[0x1F4188790](v28);
  uint64_t v31 = (char *)&v90 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  uint64_t v33 = (char *)&v90 - v32;
  v98 = a5;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v35 = MEMORY[0x1F4188790](v34 - 8);
  uint64_t v37 = (uint64_t *)((char *)&v90 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = (uint64_t)v37 + *(int *)(v35 + 56);
  sub_1A54F60EC(v102, (uint64_t)v37, a4);
  sub_1A54F60EC(*((uint64_t *)&v102 + 1), v38, a4);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v97 = v22;
    *(void *)&long long v102 = v25;
    *((void *)&v102 + 1) = v18;
    sub_1A54F60EC((uint64_t)v37, (uint64_t)v33, a4);
    uint64_t v65 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(v99) + 48);
    int v45 = v37;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, uint64_t))(v103 + 8))(&v33[v65], v104);
      sub_1A54E4D44((uint64_t)v33, v101);
      goto LABEL_9;
    }
    v100 = v37;
    v66 = (char *)(v38 + v65);
    uint64_t v67 = (uint64_t)v27;
    sub_1A550D4D4(v38, (uint64_t)v27, v101);
    uint64_t v68 = v103;
    v69 = *(void (**)(uint64_t *, char *, uint64_t))(v103 + 32);
    uint64_t v70 = v104;
    v69(*((uint64_t **)&v102 + 1), &v33[v65], v104);
    v71 = v95;
    v69(v95, v66, v70);
    if (*(void *)v33 == *v27 && *((void *)v33 + 1) == v27[1])
    {
      v73 = v101;
      uint64_t v72 = v102;
      sub_1A54F60EC((uint64_t)v33, v102, v101);
      uint64_t v74 = (uint64_t)v97;
      sub_1A54F60EC(v67, (uint64_t)v97, v73);
    }
    else
    {
      char v75 = sub_1A56D5F28();
      v73 = v101;
      uint64_t v72 = v102;
      sub_1A54F60EC((uint64_t)v33, v102, v101);
      uint64_t v74 = (uint64_t)v97;
      sub_1A54F60EC(v67, (uint64_t)v97, v73);
      if ((v75 & 1) == 0)
      {
        sub_1A54E4D44(v74, v73);
        sub_1A54E4D44(v72, v73);
        sub_1A54E4D44((uint64_t)v33, v73);
        v81 = (uint64_t *)*((void *)&v102 + 1);
LABEL_19:
        v87 = *(void (**)(uint64_t *, uint64_t))(v68 + 8);
        uint64_t v88 = v104;
        v87(v71, v104);
        v87(v81, v88);
        sub_1A54E4D44(v67, v73);
        goto LABEL_20;
      }
    }
    char v76 = *(unsigned char *)(v72 + 48);
    long long v77 = *(_OWORD *)(v72 + 32);
    long long v108 = *(_OWORD *)(v72 + 16);
    long long v109 = v77;
    char v110 = v76;
    unsigned __int8 v78 = *(unsigned char *)(v74 + 48);
    long long v79 = *(_OWORD *)(v74 + 32);
    long long v105 = *(_OWORD *)(v74 + 16);
    long long v106 = v79;
    unsigned __int8 v107 = v78;
    char v80 = _s7Sharing9SFAirDropO19ButtonConfigurationO2eeoiySbAE_AEtFZ_0((uint64_t)&v108, (uint64_t)&v105);
    sub_1A54E4D44(v74, v73);
    sub_1A54E4D44(v72, v73);
    sub_1A54E4D44((uint64_t)v33, v73);
    v81 = (uint64_t *)*((void *)&v102 + 1);
    if (v80)
    {
      char v61 = _s7Sharing9SFAirDropO17PermissionRequestV18InterventionActionV2eeoiySbAGy_x_G_AItFZ_0();
      v82 = *(void (**)(uint64_t *, uint64_t))(v68 + 8);
      v83 = v71;
      uint64_t v84 = v104;
      v82(v83, v104);
      v82(v81, v84);
      sub_1A54E4D44(v67, v73);
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  sub_1A54F60EC((uint64_t)v37, (uint64_t)v31, a4);
  uint64_t v39 = *((void *)v31 + 1);
  *(void *)&long long v102 = *(void *)v31;
  *((void *)&v102 + 1) = v39;
  uint64_t v40 = *((void *)v31 + 3);
  v99 = (uint64_t *)*((void *)v31 + 2);
  int v41 = v31[32];
  uint64_t v42 = *((void *)v31 + 5);
  uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(v100) + 48);
  uint64_t v44 = &v31[v43];
  int v45 = v37;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v95 = a4;
    uint64_t v94 = v42;
    v100 = v37;
    uint64_t v46 = *(void *)v38;
    uint64_t v47 = *(void *)(v38 + 8);
    uint64_t v48 = *(void *)(v38 + 16);
    v98 = *(uint64_t **)(v38 + 24);
    unsigned __int8 v49 = *(unsigned char *)(v38 + 32);
    uint64_t v93 = *(void *)(v38 + 40);
    char v50 = *(void (**)(char *, char *, uint64_t))(v103 + 32);
    v51 = v44;
    uint64_t v52 = v104;
    v50(v97, v51, v104);
    v50(v96, (char *)(v38 + v43), v52);
    long long v108 = v102;
    uint64_t v53 = v99;
    *(void *)&long long v109 = v99;
    *((void *)&v109 + 1) = v40;
    uint64_t v91 = v40;
    int v92 = v41;
    char v110 = v41;
    uint64_t v54 = v46;
    *(void *)&long long v105 = v46;
    *((void *)&v105 + 1) = v47;
    uint64_t v55 = v48;
    *(void *)&long long v106 = v48;
    uint64_t v56 = (uint64_t)v98;
    *((void *)&v106 + 1) = v98;
    unsigned __int8 v107 = v49;
    if (_s7Sharing9SFAirDropO19ButtonConfigurationO2eeoiySbAE_AEtFZ_0((uint64_t)&v108, (uint64_t)&v105))
    {
      char v57 = sub_1A5684348(v94, v93, v101);
      sub_1A5512C74(v54, v47, v55, v56, v49);
      swift_bridgeObjectRelease();
      sub_1A5512C74(v102, *((uint64_t *)&v102 + 1), (uint64_t)v53, v91, v92);
      swift_bridgeObjectRelease();
      uint64_t v58 = v103;
      v59 = v96;
      uint64_t v60 = (uint64_t)v97;
      a4 = v95;
      if (v57)
      {
        char v61 = _s7Sharing9SFAirDropO17PermissionRequestV18InterventionActionV2eeoiySbAGy_x_G_AItFZ_0();
        v62 = *(void (**)(char *, uint64_t))(v58 + 8);
        uint64_t v63 = v59;
        uint64_t v64 = v104;
        v62(v63, v104);
        v62((char *)v60, v64);
LABEL_21:
        int v45 = v100;
        goto LABEL_22;
      }
    }
    else
    {
      sub_1A5512C74(v46, v47, v55, v56, v49);
      swift_bridgeObjectRelease();
      sub_1A5512C74(v102, *((uint64_t *)&v102 + 1), (uint64_t)v53, v91, v92);
      swift_bridgeObjectRelease();
      uint64_t v58 = v103;
      v59 = v96;
      uint64_t v60 = (uint64_t)v97;
      a4 = v95;
    }
    v85 = *(void (**)(char *, uint64_t))(v58 + 8);
    uint64_t v86 = v104;
    v85(v59, v104);
    v85((char *)v60, v86);
LABEL_20:
    char v61 = 0;
    goto LABEL_21;
  }
  (*(void (**)(char *, uint64_t))(v103 + 8))(&v31[v43], v104);
  sub_1A5512C74(v102, *((uint64_t *)&v102 + 1), (uint64_t)v99, v40, v41);
  swift_bridgeObjectRelease();
LABEL_9:
  char v61 = 0;
  a4 = v98;
LABEL_22:
  sub_1A54E4D44((uint64_t)v45, a4);
  return v61 & 1;
}

uint64_t SFItemDestinationAlertViewModel.Action.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFItemDestinationAlertViewModel.Action.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t SFItemDestinationAlertViewModel.Action.description.getter()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_1A568550C()
{
  if (*v0) {
    return 0x656C746974;
  }
  else {
    return 25705;
  }
}

uint64_t sub_1A5685538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A5687AEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5685560(uint64_t a1)
{
  unint64_t v2 = sub_1A5686CAC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A568559C(uint64_t a1)
{
  unint64_t v2 = sub_1A5686CAC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFItemDestinationAlertViewModel.Action.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674EC0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  v10[1] = *(void *)(v1 + 24);
  v10[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5686CAC();
  sub_1A56D61D8();
  char v12 = 0;
  uint64_t v8 = v10[3];
  sub_1A56D5DE8();
  if (!v8)
  {
    char v11 = 1;
    sub_1A56D5DE8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SFItemDestinationAlertViewModel.Action.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674ED0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5686CAC();
  sub_1A56D61A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  char v20 = 0;
  uint64_t v9 = sub_1A56D5CF8();
  uint64_t v11 = v10;
  char v19 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1A56D5CF8();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5685954@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SFItemDestinationAlertViewModel.Action.init(from:)(a1, a2);
}

uint64_t sub_1A568596C(void *a1)
{
  return SFItemDestinationAlertViewModel.Action.encode(to:)(a1);
}

uint64_t SFItemDestinationAlertViewModel.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFItemDestinationAlertViewModel.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFItemDestinationAlertViewModel.actions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SFItemDestinationAlertViewModel.cancelAction.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  uint64_t v4 = v1[7];
  uint64_t v5 = v1[8];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_1A5686D00(v2, v3);
}

uint64_t SFItemDestinationAlertViewModel.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  sub_1A56D5A28();
  sub_1A56D51C8();
  swift_bridgeObjectRetain();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  swift_bridgeObjectRetain();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  uint64_t v3 = swift_bridgeObjectRetain();
  MEMORY[0x1A62695D0](v3, &type metadata for SFItemDestinationAlertViewModel.Action);
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  sub_1A5686D00(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674ED8);
  sub_1A56D5138();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  return 0;
}

void __swiftcall SFItemDestinationAlertViewModel.init(title:message:actions:cancelAction:)(Sharing::SFItemDestinationAlertViewModel *__return_ptr retstr, Swift::String title, Swift::String message, Swift::OpaquePointer actions, Sharing::SFItemDestinationAlertViewModel::Action_optional cancelAction)
{
  Swift::String v5 = *(Swift::String *)(cancelAction.value.id._countAndFlagsBits + 16);
  retstr->cancelAction.value.id = *(Swift::String *)cancelAction.value.id._countAndFlagsBits;
  retstr->title = title;
  retstr->message = message;
  retstr->actions = actions;
  retstr->cancelAction.value.title = v5;
}

uint64_t SFItemDestinationAlertViewModel.init(permissionRequest:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674EE0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674EE8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9670D58);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (uint64_t *)((char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for SFAirDrop.DeclineAction();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9670D10);
  sub_1A54F60EC(a1 + *(int *)(v16 + 60), (uint64_t)v12, &qword_1E9670D58);
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    sub_1A54E4D44((uint64_t)v12, &qword_1E9670D58);
    type metadata accessor for SFAirDropReceive.Failure();
    sub_1A5687D8C(&qword_1E9674EF0, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Failure);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return sub_1A54E4D44(a1, &qword_1E9670D10);
  }
  uint64_t v57 = *v12;
  uint64_t v61 = v12[1];
  uint64_t v62 = a1;
  uint64_t v17 = v12[2];
  uint64_t v18 = v12[4];
  uint64_t v59 = v12[3];
  uint64_t v60 = v17;
  uint64_t v19 = (uint64_t)v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9670D68) + 80);
  uint64_t v20 = v18;
  uint64_t v58 = v15;
  sub_1A5625A04(v19, (uint64_t)v15);
  uint64_t v21 = *(void *)(v18 + 16);
  if (v21)
  {
    uint64_t v22 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v56 = v20;
    uint64_t v23 = v20 + ((v22 + 32) & ~v22);
    uint64_t v24 = *(void *)(v4 + 72);
    v69 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v64 = v24;
    uint64_t v65 = v3;
    while (1)
    {
      sub_1A54F60EC(v23, (uint64_t)v6, &qword_1E9674EE0);
      if (swift_getEnumCaseMultiPayload() != 1) {
        break;
      }
      sub_1A54E4D44((uint64_t)v6, &qword_1E9674EE0);
LABEL_5:
      v23 += v24;
      if (!--v21)
      {
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
    }
    uint64_t v25 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9674EF8) + 48)];
    sub_1A550D4D4((uint64_t)v6, (uint64_t)v9, &qword_1E9674EE8);
    uint64_t v26 = sub_1A56D4CB8();
    (*(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8))(v25, v26);
    uint64_t v27 = *((void *)v9 + 2);
    unint64_t v28 = *((void *)v9 + 3);
    uint64_t v29 = *((void *)v9 + 4);
    unint64_t v30 = *((void *)v9 + 5);
    int v31 = v9[48];
    unint64_t v32 = v28;
    uint64_t v33 = v27;
    unint64_t v66 = v30;
    uint64_t v67 = v29;
    if (v31)
    {
      if (v31 == 1)
      {
        uint64_t v27 = 0;
        unint64_t v32 = 0xE000000000000000;
        goto LABEL_12;
      }
      unint64_t v32 = v30;
      uint64_t v27 = v29;
    }
    swift_bridgeObjectRetain();
LABEL_12:
    swift_bridgeObjectRelease();
    uint64_t v34 = HIBYTE(v32) & 0xF;
    if ((v32 & 0x2000000000000000) == 0) {
      uint64_t v34 = v27 & 0xFFFFFFFFFFFFLL;
    }
    if (!v34) {
      goto LABEL_25;
    }
    uint64_t v35 = *((void *)v9 + 1);
    uint64_t v68 = *(void *)v9;
    if (v31)
    {
      if (v31 == 1)
      {
        uint64_t v33 = 0;
        unint64_t v28 = 0xE000000000000000;
LABEL_20:
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v69 = sub_1A54E30E0(0, v69[2] + 1, 1, v69);
        }
        unint64_t v37 = v69[2];
        unint64_t v36 = v69[3];
        if (v37 >= v36 >> 1) {
          v69 = sub_1A54E30E0((void *)(v36 > 1), v37 + 1, 1, v69);
        }
        uint64_t v38 = v69;
        v69[2] = v37 + 1;
        uint64_t v39 = &v38[4 * v37];
        v39[4] = v68;
        v39[5] = v35;
        v39[6] = v33;
        v39[7] = v28;
LABEL_25:
        sub_1A54E4D44((uint64_t)v9, &qword_1E9674EE8);
        uint64_t v24 = v64;
        goto LABEL_5;
      }
      unint64_t v28 = v66;
      uint64_t v33 = v67;
    }
    swift_bridgeObjectRetain();
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  v69 = (void *)MEMORY[0x1E4FBC860];
LABEL_29:
  int v41 = (uint64_t *)v58;
  uint64_t v43 = *((void *)v58 + 2);
  unint64_t v42 = *((void *)v58 + 3);
  uint64_t v44 = *((void *)v58 + 4);
  unint64_t v45 = *((void *)v58 + 5);
  int v46 = v58[48];
  unint64_t v47 = v42;
  uint64_t v48 = v43;
  if (v58[48])
  {
    if (v46 == 1)
    {
      uint64_t v48 = 0;
      unint64_t v47 = 0xE000000000000000;
      goto LABEL_34;
    }
    unint64_t v47 = *((void *)v58 + 5);
    uint64_t v48 = *((void *)v58 + 4);
  }
  swift_bridgeObjectRetain();
LABEL_34:
  swift_bridgeObjectRelease();
  uint64_t v49 = HIBYTE(v47) & 0xF;
  if ((v47 & 0x2000000000000000) == 0) {
    uint64_t v49 = v48 & 0xFFFFFFFFFFFFLL;
  }
  if (v49)
  {
    uint64_t v51 = *v41;
    uint64_t v50 = v41[1];
    if (v46)
    {
      if (v46 == 1)
      {
        uint64_t v43 = 0;
        unint64_t v42 = 0xE000000000000000;
LABEL_43:
        swift_bridgeObjectRetain();
        goto LABEL_44;
      }
      unint64_t v42 = v45;
      uint64_t v43 = v44;
    }
    swift_bridgeObjectRetain();
    goto LABEL_43;
  }
  uint64_t v51 = 0;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  unint64_t v42 = 0;
LABEL_44:
  uint64_t v52 = v63;
  uint64_t v53 = v57;
  sub_1A54E4D44(v62, &qword_1E9670D10);
  uint64_t result = sub_1A56351B0((uint64_t)v41);
  uint64_t v54 = v61;
  *uint64_t v52 = v53;
  v52[1] = v54;
  uint64_t v55 = v59;
  v52[2] = v60;
  v52[3] = v55;
  v52[4] = v69;
  v52[5] = v51;
  v52[6] = v50;
  v52[7] = v43;
  v52[8] = v42;
  return result;
}

uint64_t sub_1A56861A4()
{
  uint64_t result = 0x656C746974;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6567617373656DLL;
      break;
    case 2:
      uint64_t result = 0x736E6F69746361;
      break;
    case 3:
      uint64_t result = 0x63416C65636E6163;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A5686238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A5687BC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5686260(uint64_t a1)
{
  unint64_t v2 = sub_1A5686EF0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A568629C(uint64_t a1)
{
  unint64_t v2 = sub_1A5686EF0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFItemDestinationAlertViewModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674F00);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v21 = v1[3];
  uint64_t v22 = v7;
  uint64_t v8 = v1[4];
  uint64_t v19 = v1[5];
  uint64_t v20 = v8;
  uint64_t v9 = v1[6];
  uint64_t v17 = v1[7];
  uint64_t v18 = v9;
  uint64_t v16 = v1[8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5686EF0();
  sub_1A56D61D8();
  LOBYTE(v24) = 0;
  uint64_t v10 = v23;
  sub_1A56D5DE8();
  if (!v10)
  {
    uint64_t v11 = v19;
    uint64_t v12 = v20;
    uint64_t v14 = v17;
    uint64_t v13 = v18;
    LOBYTE(v24) = 1;
    sub_1A56D5DE8();
    uint64_t v24 = v12;
    char v28 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674F10);
    sub_1A5686F98(&qword_1E9674F18, (void (*)(void))sub_1A5686F44);
    sub_1A56D5E38();
    uint64_t v24 = v11;
    uint64_t v25 = v13;
    uint64_t v26 = v14;
    uint64_t v27 = v16;
    char v28 = 3;
    sub_1A5686F44();
    sub_1A56D5DD8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SFItemDestinationAlertViewModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674F28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A5686EF0();
  sub_1A56D61A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  LOBYTE(v32) = 0;
  uint64_t v9 = sub_1A56D5CF8();
  uint64_t v11 = v10;
  uint64_t v30 = v9;
  LOBYTE(v32) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1A56D5CF8();
  uint64_t v31 = v13;
  uint64_t v29 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674F10);
  char v36 = 2;
  sub_1A5686F98(&qword_1E9674F30, (void (*)(void))sub_1A5687008);
  swift_bridgeObjectRetain();
  sub_1A56D5D48();
  uint64_t v14 = v32;
  char v36 = 3;
  sub_1A5687008();
  uint64_t v28 = v14;
  swift_bridgeObjectRetain();
  sub_1A56D5CE8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v15 = v32;
  uint64_t v16 = v33;
  uint64_t v24 = v34;
  uint64_t v26 = v35;
  uint64_t v27 = v33;
  swift_bridgeObjectRetain();
  uint64_t v17 = v31;
  swift_bridgeObjectRetain();
  uint64_t v18 = v28;
  swift_bridgeObjectRetain();
  uint64_t v25 = v15;
  uint64_t v19 = v16;
  uint64_t v20 = v24;
  sub_1A5686D00(v15, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v30;
  a2[1] = v11;
  a2[2] = v29;
  a2[3] = v17;
  a2[4] = v18;
  a2[5] = v15;
  uint64_t v21 = v26;
  uint64_t v22 = v27;
  a2[6] = v27;
  a2[7] = v20;
  a2[8] = v21;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1A568705C(v25, v22);
}

uint64_t sub_1A5686938@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SFItemDestinationAlertViewModel.init(from:)(a1, a2);
}

uint64_t sub_1A5686950(void *a1)
{
  return SFItemDestinationAlertViewModel.encode(to:)(a1);
}

unint64_t static SFItemDestinationAlertSettings.viewModel.getter()
{
  return 0xD000000000000024;
}

Sharing::SFItemDestinationAlertSettings_optional __swiftcall SFItemDestinationAlertSettings.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (Sharing::SFItemDestinationAlertSettings_optional)rawValue;
}

uint64_t SFItemDestinationAlertSettings.rawValue.getter()
{
  return *v0;
}

uint64_t static SFAirDropInvocations.ItemDestinationAlert.supportsSecureCoding.getter()
{
  return 1;
}

id SFAirDropInvocations.ItemDestinationAlert.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR___SFXPCInvocation_name];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for SFXPCInvocation();
  return objc_msgSendSuper2(&v8, sel_init);
}

id SFAirDropInvocations.ItemDestinationAlert.init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR___SFXPCInvocation_name];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for SFXPCInvocation();
  return objc_msgSendSuper2(&v5, sel_init);
}

id SFAirDropInvocations.ItemDestinationAlert.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SFAirDropInvocations.ItemDestinationAlert.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SFAirDropInvocations.ItemDestinationAlert.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_1A55B2384(a1);

  return v4;
}

id SFAirDropInvocations.ItemDestinationAlert.init(coder:)(void *a1)
{
  id v2 = sub_1A55B2384(a1);

  return v2;
}

id SFAirDropInvocations.ItemDestinationAlert.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s7Sharing31SFItemDestinationAlertViewModelV6ActionV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_1A56D5F28(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_1A56D5F28();
    }
  }
  return result;
}

unint64_t sub_1A5686CAC()
{
  unint64_t result = qword_1E9674EC8;
  if (!qword_1E9674EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674EC8);
  }
  return result;
}

uint64_t sub_1A5686D00(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

BOOL _s7Sharing31SFItemDestinationAlertViewModelV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v11 = a2[6];
  uint64_t v15 = a2[7];
  uint64_t v16 = a1[7];
  uint64_t v17 = a2[8];
  uint64_t v18 = a1[8];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v12 = sub_1A56D5F28(), result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v3 == v8 || (char v14 = sub_1A56D5F28(), result = 0, (v14 & 1) != 0))
    {
      if (sub_1A5683D08(v4, v10))
      {
        if (v5)
        {
          if (v11) {
            return (v6 == v9 && v5 == v11 || (sub_1A56D5F28() & 1) != 0)
          }
                && (v16 == v15 && v18 == v17 || (sub_1A56D5F28() & 1) != 0);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else if (!v11)
        {
          return 1;
        }
        sub_1A5686D00(v9, v11);
        sub_1A568705C(v6, v5);
        sub_1A568705C(v9, v11);
      }
      return 0;
    }
  }
  return result;
}

unint64_t sub_1A5686EF0()
{
  unint64_t result = qword_1E9674F08;
  if (!qword_1E9674F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F08);
  }
  return result;
}

unint64_t sub_1A5686F44()
{
  unint64_t result = qword_1E9674F20;
  if (!qword_1E9674F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F20);
  }
  return result;
}

uint64_t sub_1A5686F98(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9674F10);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1A5687008()
{
  unint64_t result = qword_1E9674F38;
  if (!qword_1E9674F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F38);
  }
  return result;
}

uint64_t sub_1A568705C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1A56870A4()
{
  unint64_t result = qword_1E9674F40;
  if (!qword_1E9674F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F40);
  }
  return result;
}

uint64_t sub_1A56870F8()
{
  return sub_1A5687160(&qword_1E9671030);
}

uint64_t sub_1A568712C()
{
  return sub_1A5687160(&qword_1E9670EB8);
}

uint64_t sub_1A5687160(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9670D10);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for SFItemDestinationAlertViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for SFItemDestinationAlertViewModel(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  uint64_t v6 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    a1[5] = a2[5];
    a1[6] = v6;
    uint64_t v7 = a2[7];
    uint64_t v8 = a2[8];
    a1[7] = v7;
    a1[8] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 7);
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 7) = v9;
  }
  return a1;
}

void *assignWithCopy for SFItemDestinationAlertViewModel(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + 5;
  uint64_t v5 = a2 + 5;
  uint64_t v6 = a2[6];
  if (a1[6])
  {
    if (v6)
    {
      a1[5] = a2[5];
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[7] = a2[7];
      a1[8] = a2[8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1A56873E4((uint64_t)(a1 + 5));
      long long v7 = *(_OWORD *)(a2 + 7);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 7) = v7;
    }
  }
  else if (v6)
  {
    a1[5] = a2[5];
    a1[6] = a2[6];
    a1[7] = a2[7];
    a1[8] = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 7);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 7) = v8;
  }
  return a1;
}

uint64_t sub_1A56873E4(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for SFItemDestinationAlertViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 48)) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a2 + 48);
  if (!v6)
  {
    sub_1A56873E4(a1 + 40);
LABEL_5:
    long long v8 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v8;
    return a1;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SFItemDestinationAlertViewModel()
{
  return &type metadata for SFItemDestinationAlertViewModel;
}

uint64_t destroy for SFItemDestinationAlertViewModel.Action()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SFItemDestinationAlertViewModel.Action(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SFItemDestinationAlertViewModel.Action(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SFItemDestinationAlertViewModel.Action(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SFItemDestinationAlertViewModel.Action(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SFItemDestinationAlertViewModel.Action(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SFItemDestinationAlertViewModel.Action()
{
  return &type metadata for SFItemDestinationAlertViewModel.Action;
}

ValueMetadata *type metadata accessor for SFItemDestinationAlertSettings()
{
  return &type metadata for SFItemDestinationAlertSettings;
}

uint64_t type metadata accessor for SFAirDropInvocations.ItemDestinationAlert()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SFItemDestinationAlertViewModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56877A0);
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

ValueMetadata *type metadata accessor for SFItemDestinationAlertViewModel.CodingKeys()
{
  return &type metadata for SFItemDestinationAlertViewModel.CodingKeys;
}

unsigned char *_s7Sharing30SFItemDestinationAlertSettingsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56878A4);
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

ValueMetadata *type metadata accessor for SFItemDestinationAlertViewModel.Action.CodingKeys()
{
  return &type metadata for SFItemDestinationAlertViewModel.Action.CodingKeys;
}

unint64_t sub_1A56878E0()
{
  unint64_t result = qword_1E9674F48;
  if (!qword_1E9674F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F48);
  }
  return result;
}

unint64_t sub_1A5687938()
{
  unint64_t result = qword_1E9674F50;
  if (!qword_1E9674F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F50);
  }
  return result;
}

unint64_t sub_1A5687990()
{
  unint64_t result = qword_1E9674F58;
  if (!qword_1E9674F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F58);
  }
  return result;
}

unint64_t sub_1A56879E8()
{
  unint64_t result = qword_1E9674F60;
  if (!qword_1E9674F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F60);
  }
  return result;
}

unint64_t sub_1A5687A40()
{
  unint64_t result = qword_1E9674F68;
  if (!qword_1E9674F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F68);
  }
  return result;
}

unint64_t sub_1A5687A98()
{
  unint64_t result = qword_1E9674F70;
  if (!qword_1E9674F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9674F70);
  }
  return result;
}

uint64_t sub_1A5687AEC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A5687BC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736E6F69746361 && a2 == 0xE700000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x63416C65636E6163 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1A5687D8C(unint64_t *a1, void (*a2)(uint64_t))
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

void SFAirDropReceive.Failure.init(_:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  MEMORY[0x1F4188790](v4);
  char v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A56D5438();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v17[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = a1;
  id v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C8B0);
  if (swift_dynamicCast())
  {

    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
LABEL_5:

    return;
  }

  v17[0] = a1;
  id v12 = a1;
  if (swift_dynamicCast())
  {

    sub_1A568BF80((uint64_t)v6, a2);
    goto LABEL_5;
  }

  CodableError.init(_:)(a1, v17);
  id v13 = v17[1];
  uint64_t v14 = v20;
  *(id *)a2 = v17[0];
  *(void *)(a2 + 8) = v13;
  long long v15 = v19;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = v15;
  *(void *)(a2 + 48) = v14;
  swift_storeEnumTagMultiPayload();
}

unint64_t SFAirDropReceive.Failure.errorDescription.getter()
{
  uint64_t v1 = type metadata accessor for SFAirDropReceive.Failure();
  MEMORY[0x1F4188790](v1);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A568BFE4(v0, (uint64_t)v3);
  unint64_t v4 = 0x64656E696C636564;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      unint64_t v4 = *((void *)v3 + 3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 2u:
      return v4;
    case 3u:
      unint64_t v4 = 0x696D7369446B7361;
      break;
    case 4u:
      unint64_t v4 = 0x61437265646E6573;
      break;
    case 5u:
    case 8u:
      unint64_t v4 = 0xD000000000000011;
      break;
    case 6u:
      unint64_t v4 = 0x707954646578696DLL;
      break;
    case 7u:
      unint64_t v4 = 0xD000000000000018;
      break;
    case 9u:
      unint64_t v4 = 0x72456D6165727473;
      break;
    case 0xAu:
      unint64_t v4 = 0x6148746F4E6B7361;
      break;
    case 0xBu:
      unint64_t v4 = 0xD000000000000012;
      break;
    case 0xCu:
      unint64_t v4 = 0x6575716552646162;
      break;
    case 0xDu:
      unint64_t v4 = 0x70416F5465766F6DLL;
      break;
    case 0xEu:
      unint64_t v4 = 0xD000000000000013;
      break;
    default:
      uint64_t v5 = &v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48)];
      unint64_t v8 = 0;
      unint64_t v9 = 0xE000000000000000;
      sub_1A56D5A28();
      swift_bridgeObjectRelease();
      unint64_t v8 = 0xD000000000000010;
      unint64_t v9 = 0x80000001A573CCB0;
      sub_1A56D51C8();
      swift_bridgeObjectRelease();
      sub_1A56D51C8();
      unint64_t v4 = v8;
      uint64_t v6 = sub_1A56D4A28();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
      break;
  }
  return v4;
}

uint64_t SFAirDropReceive.Failure.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1A56D4A28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SFAirDropReceive.Failure();
  MEMORY[0x1F4188790](v6);
  unint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A568BFE4(v1, (uint64_t)v8);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v12 = *(void *)v8;
      uint64_t v11 = *((void *)v8 + 1);
      uint64_t v13 = *((void *)v8 + 2);
      uint64_t v14 = *((void *)v8 + 3);
      uint64_t v15 = *((void *)v8 + 4);
      uint64_t v16 = *((void *)v8 + 5);
      uint64_t v17 = *((void *)v8 + 6);
      sub_1A56D60C8();
      v18[1] = v12;
      v18[2] = v11;
      v18[3] = v13;
      v18[4] = v14;
      v18[5] = v15;
      v18[6] = v16;
      v18[7] = v17;
      CodableError.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
      uint64_t result = sub_1A56D60C8();
      break;
    default:
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110);
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, &v8[*(int *)(v9 + 48)], v2);
      sub_1A56D60C8();
      sub_1A56D5188();
      swift_bridgeObjectRelease();
      sub_1A568C618(&qword_1E96724E0, MEMORY[0x1E4F276F0]);
      sub_1A56D4FF8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
  }
  return result;
}

unint64_t sub_1A5688618(char a1)
{
  unint64_t result = 0x64656E696C636564;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x696D7369446B7361;
      break;
    case 2:
      unint64_t result = 0x61437265646E6573;
      break;
    case 3:
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x707954646578696DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 0x72456D6165727473;
      break;
    case 8:
      unint64_t result = 0x6148746F4E6B7361;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0x6575716552646162;
      break;
    case 11:
      unint64_t result = 0x726F707075736E75;
      break;
    case 12:
      unint64_t result = 0x70416F5465766F6DLL;
      break;
    case 13:
      unint64_t result = 0xD000000000000013;
      break;
    case 14:
      unint64_t result = 0x7463657078656E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A5688830(uint64_t a1)
{
  unint64_t v2 = sub_1A568C4E0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A568886C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C4E0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56888A8(uint64_t a1)
{
  unint64_t v2 = sub_1A568C294();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56888E4(uint64_t a1)
{
  unint64_t v2 = sub_1A568C294();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688920(uint64_t a1)
{
  unint64_t v2 = sub_1A568C1EC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A568895C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C1EC();

  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1A5688998()
{
  return sub_1A5688618(*v0);
}

uint64_t sub_1A56889A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A568DE14(a1, a2);
  *a3 = result;
  return result;
}

void sub_1A56889C8(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_1A56889D4(uint64_t a1)
{
  unint64_t v2 = sub_1A568C048();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688A10(uint64_t a1)
{
  unint64_t v2 = sub_1A568C048();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688A4C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C534();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688A88(uint64_t a1)
{
  unint64_t v2 = sub_1A568C534();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688AC4(uint64_t a1)
{
  unint64_t v2 = sub_1A568C240();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688B00(uint64_t a1)
{
  unint64_t v2 = sub_1A568C240();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688B3C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C0F0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688B78(uint64_t a1)
{
  unint64_t v2 = sub_1A568C0F0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688BB4(uint64_t a1)
{
  unint64_t v2 = sub_1A568C390();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688BF0(uint64_t a1)
{
  unint64_t v2 = sub_1A568C390();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688C2C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C33C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688C68(uint64_t a1)
{
  unint64_t v2 = sub_1A568C33C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688CA4(uint64_t a1)
{
  unint64_t v2 = sub_1A568C3E4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688CE0(uint64_t a1)
{
  unint64_t v2 = sub_1A568C3E4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688D1C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C144();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688D58(uint64_t a1)
{
  unint64_t v2 = sub_1A568C144();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688D94(uint64_t a1)
{
  unint64_t v2 = sub_1A568C438();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688DD0(uint64_t a1)
{
  unint64_t v2 = sub_1A568C438();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688E0C(uint64_t a1)
{
  unint64_t v2 = sub_1A568C48C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688E48(uint64_t a1)
{
  unint64_t v2 = sub_1A568C48C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688E84(uint64_t a1)
{
  unint64_t v2 = sub_1A568C2E8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688EC0(uint64_t a1)
{
  unint64_t v2 = sub_1A568C2E8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688EFC(uint64_t a1)
{
  unint64_t v2 = sub_1A568C09C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688F38(uint64_t a1)
{
  unint64_t v2 = sub_1A568C09C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A5688F74()
{
  if (*v0) {
    return 7107189;
  }
  else {
    return 6911093;
  }
}

uint64_t sub_1A5688F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A568E4BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A5688FC0(uint64_t a1)
{
  unint64_t v2 = sub_1A568C198();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A5688FFC(uint64_t a1)
{
  unint64_t v2 = sub_1A568C198();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDropReceive.Failure.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675000);
  uint64_t v103 = *(void *)(v2 - 8);
  uint64_t v104 = v2;
  MEMORY[0x1F4188790](v2);
  long long v102 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675008);
  uint64_t v96 = *(void *)(v4 - 8);
  uint64_t v97 = v4;
  MEMORY[0x1F4188790](v4);
  v95 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675010);
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x1F4188790](v94);
  int v92 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675018);
  uint64_t v61 = *(void *)(v101 - 8);
  MEMORY[0x1F4188790](v101);
  v99 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_1A56D4A28();
  uint64_t v100 = *(void *)(v105 - 8);
  MEMORY[0x1F4188790](v105);
  v98 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675020);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x1F4188790](v91);
  v89 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675028);
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x1F4188790](v88);
  uint64_t v86 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675030);
  uint64_t v84 = *(void *)(v85 - 8);
  MEMORY[0x1F4188790](v85);
  v83 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675038);
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  char v80 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675040);
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x1F4188790](v79);
  long long v77 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675048);
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x1F4188790](v76);
  uint64_t v74 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675050);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x1F4188790](v73);
  v71 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675058);
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  uint64_t v68 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675060);
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790](v67);
  uint64_t v65 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675068);
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x1F4188790](v64);
  long long v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675070);
  uint64_t v62 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for SFAirDropReceive.Failure();
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (uint64_t *)((char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675078);
  uint64_t v106 = *(void *)(v117 - 8);
  MEMORY[0x1F4188790](v117);
  uint64_t v27 = (char *)&v60 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A568C048();
  long long v109 = v27;
  sub_1A56D61D8();
  sub_1A568BFE4(v108, (uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v37 = v25[1];
      uint64_t v105 = *v25;
      uint64_t v108 = v37;
      uint64_t v38 = v25[2];
      uint64_t v101 = v25[3];
      uint64_t v39 = v25[4];
      uint64_t v40 = v25[5];
      uint64_t v41 = v25[6];
      LOBYTE(v110) = 14;
      sub_1A568C09C();
      unint64_t v42 = v102;
      uint64_t v43 = v117;
      uint64_t v44 = v109;
      sub_1A56D5D98();
      uint64_t v110 = v105;
      uint64_t v111 = v37;
      uint64_t v112 = v38;
      uint64_t v113 = v101;
      uint64_t v114 = v39;
      uint64_t v115 = v40;
      uint64_t v116 = v41;
      sub_1A55F773C();
      uint64_t v45 = v104;
      sub_1A56D5E38();
      (*(void (**)(char *, uint64_t))(v103 + 8))(v42, v45);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v44, v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 2u:
      LOBYTE(v110) = 0;
      sub_1A568C534();
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v22, v20);
      goto LABEL_17;
    case 3u:
      LOBYTE(v110) = 1;
      sub_1A568C4E0();
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v19, v64);
      goto LABEL_17;
    case 4u:
      LOBYTE(v110) = 2;
      sub_1A568C48C();
      uint64_t v48 = v65;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v48, v67);
      goto LABEL_17;
    case 5u:
      LOBYTE(v110) = 3;
      sub_1A568C438();
      uint64_t v49 = v68;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v49, v70);
      goto LABEL_17;
    case 6u:
      LOBYTE(v110) = 4;
      sub_1A568C3E4();
      uint64_t v50 = v71;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v50, v73);
      goto LABEL_17;
    case 7u:
      LOBYTE(v110) = 5;
      sub_1A568C390();
      uint64_t v51 = v74;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v51, v76);
      goto LABEL_17;
    case 8u:
      LOBYTE(v110) = 6;
      sub_1A568C33C();
      uint64_t v52 = v77;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v52, v79);
      goto LABEL_17;
    case 9u:
      LOBYTE(v110) = 7;
      sub_1A568C2E8();
      uint64_t v53 = v80;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v53, v82);
      goto LABEL_17;
    case 0xAu:
      LOBYTE(v110) = 8;
      sub_1A568C294();
      uint64_t v54 = v83;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v84 + 8))(v54, v85);
      goto LABEL_17;
    case 0xBu:
      LOBYTE(v110) = 9;
      sub_1A568C240();
      uint64_t v55 = v86;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v55, v88);
      goto LABEL_17;
    case 0xCu:
      LOBYTE(v110) = 10;
      sub_1A568C1EC();
      uint64_t v56 = v89;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v56, v91);
      goto LABEL_17;
    case 0xDu:
      LOBYTE(v110) = 12;
      sub_1A568C144();
      uint64_t v57 = v92;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v93 + 8))(v57, v94);
      goto LABEL_17;
    case 0xEu:
      LOBYTE(v110) = 13;
      sub_1A568C0F0();
      uint64_t v58 = v95;
      uint64_t v46 = v117;
      unint64_t v47 = v109;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v58, v97);
LABEL_17:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v47, v46);
      break;
    default:
      uint64_t v28 = (char *)v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v29 = v100;
      uint64_t v30 = v98;
      (*(void (**)(char *, char *, uint64_t))(v100 + 32))(v98, v28, v105);
      LOBYTE(v110) = 11;
      sub_1A568C198();
      uint64_t v31 = v99;
      uint64_t v32 = v117;
      uint64_t v33 = v109;
      sub_1A56D5D98();
      LOBYTE(v110) = 0;
      uint64_t v34 = v101;
      uint64_t v35 = v107;
      sub_1A56D5DE8();
      swift_bridgeObjectRelease();
      if (v35)
      {
        (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v34);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v105);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v33, v32);
      }
      else
      {
        LOBYTE(v110) = 1;
        sub_1A568C618(&qword_1E9670E80, MEMORY[0x1E4F276F0]);
        uint64_t v59 = v105;
        sub_1A56D5E38();
        (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v34);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v59);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v109, v117);
      }
      break;
  }
  return result;
}

uint64_t SFAirDropReceive.Failure.hashValue.getter()
{
  return sub_1A56D60E8();
}

uint64_t SFAirDropReceive.Failure.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v132 = a2;
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675100);
  uint64_t v118 = *(void *)(v116 - 8);
  MEMORY[0x1F4188790](v116);
  v130 = (char *)&v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675108);
  uint64_t v114 = *(void *)(v136 - 8);
  MEMORY[0x1F4188790](v136);
  v129 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675110);
  uint64_t v112 = *(void *)(v113 - 8);
  MEMORY[0x1F4188790](v113);
  v128 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675118);
  uint64_t v117 = *(void *)(v115 - 8);
  MEMORY[0x1F4188790](v115);
  v131 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675120);
  uint64_t v110 = *(void *)(v111 - 8);
  MEMORY[0x1F4188790](v111);
  v127 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675128);
  uint64_t v108 = *(void *)(v109 - 8);
  MEMORY[0x1F4188790](v109);
  v126 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675130);
  uint64_t v106 = *(void *)(v107 - 8);
  MEMORY[0x1F4188790](v107);
  v125 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675138);
  uint64_t v104 = *(void *)(v105 - 8);
  MEMORY[0x1F4188790](v105);
  v124 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675140);
  uint64_t v102 = *(void *)(v103 - 8);
  MEMORY[0x1F4188790](v103);
  v123 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675148);
  uint64_t v100 = *(void *)(v101 - 8);
  MEMORY[0x1F4188790](v101);
  v135 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675150);
  uint64_t v98 = *(void *)(v99 - 8);
  MEMORY[0x1F4188790](v99);
  v122 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675158);
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x1F4188790](v97);
  v121 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675160);
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x1F4188790](v95);
  v134 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675168);
  uint64_t v92 = *(void *)(v93 - 8);
  MEMORY[0x1F4188790](v93);
  v120 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675170);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x1F4188790](v91);
  v119 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675178);
  uint64_t v133 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v22);
  uint64_t v27 = (uint64_t *)((char *)&v86 - v26);
  MEMORY[0x1F4188790](v25);
  uint64_t v29 = (char *)&v86 - v28;
  uint64_t v30 = a1[3];
  v137 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v30);
  sub_1A568C048();
  uint64_t v31 = v143;
  sub_1A56D61A8();
  if (v31)
  {
LABEL_38:
    uint64_t v63 = (uint64_t)v137;
    return __swift_destroy_boxed_opaque_existential_0Tm(v63);
  }
  uint64_t v87 = v24;
  uint64_t v32 = v134;
  uint64_t v88 = v27;
  uint64_t v34 = v135;
  uint64_t v33 = v136;
  uint64_t v143 = 0;
  uint64_t v35 = v21;
  v89 = v29;
  uint64_t v36 = sub_1A56D5D78();
  uint64_t v37 = v36;
  if (*(void *)(v36 + 16) != 1)
  {
    uint64_t v41 = sub_1A56D5A78();
    swift_allocError();
    uint64_t v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
    *uint64_t v43 = v35;
    sub_1A56D5C98();
    sub_1A56D5A68();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v41 - 8) + 104))(v43, *MEMORY[0x1E4FBBA70], v41);
    swift_willThrow();
LABEL_37:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
    goto LABEL_38;
  }
  switch(*(unsigned char *)(v36 + 32))
  {
    case 1:
      LOBYTE(v138) = 1;
      sub_1A568C4E0();
      uint64_t v44 = v120;
      uint64_t v45 = v143;
      sub_1A56D5C88();
      if (v45) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v92 + 8))(v44, v93);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 2:
      LOBYTE(v138) = 2;
      sub_1A568C48C();
      uint64_t v46 = v143;
      sub_1A56D5C88();
      if (v46) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v94 + 8))(v32, v95);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 3:
      LOBYTE(v138) = 3;
      sub_1A568C438();
      unint64_t v47 = v121;
      uint64_t v48 = v143;
      sub_1A56D5C88();
      if (v48) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v96 + 8))(v47, v97);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 4:
      LOBYTE(v138) = 4;
      sub_1A568C3E4();
      uint64_t v49 = v122;
      uint64_t v50 = v143;
      sub_1A56D5C88();
      if (v50) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v98 + 8))(v49, v99);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 5:
      LOBYTE(v138) = 5;
      sub_1A568C390();
      uint64_t v51 = v143;
      sub_1A56D5C88();
      if (v51) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v100 + 8))(v34, v101);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 6:
      LOBYTE(v138) = 6;
      sub_1A568C33C();
      uint64_t v52 = v123;
      uint64_t v53 = v143;
      sub_1A56D5C88();
      if (v53) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v102 + 8))(v52, v103);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 7:
      LOBYTE(v138) = 7;
      sub_1A568C2E8();
      uint64_t v54 = v124;
      uint64_t v55 = v143;
      sub_1A56D5C88();
      if (v55) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v104 + 8))(v54, v105);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 8:
      LOBYTE(v138) = 8;
      sub_1A568C294();
      uint64_t v56 = v125;
      uint64_t v57 = v143;
      sub_1A56D5C88();
      if (v57) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v106 + 8))(v56, v107);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 9:
      LOBYTE(v138) = 9;
      sub_1A568C240();
      uint64_t v58 = v126;
      uint64_t v59 = v143;
      sub_1A56D5C88();
      if (v59) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v108 + 8))(v58, v109);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 0xA:
      LOBYTE(v138) = 10;
      sub_1A568C1EC();
      uint64_t v60 = v127;
      uint64_t v61 = v143;
      sub_1A56D5C88();
      if (v61) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v110 + 8))(v60, v111);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 0xB:
      LOBYTE(v138) = 11;
      sub_1A568C198();
      uint64_t v62 = v143;
      sub_1A56D5C88();
      if (v62)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
        uint64_t v63 = (uint64_t)v137;
        return __swift_destroy_boxed_opaque_existential_0Tm(v63);
      }
      LOBYTE(v138) = 0;
      uint64_t v73 = v115;
      uint64_t v79 = sub_1A56D5CF8();
      uint64_t v81 = v80;
      uint64_t v143 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110);
      uint64_t v82 = v88;
      *uint64_t v88 = v79;
      v82[1] = v81;
      sub_1A56D4A28();
      LOBYTE(v138) = 1;
      sub_1A568C618(&qword_1E9671018, MEMORY[0x1E4F276F0]);
      v83 = v131;
      sub_1A56D5D48();
      uint64_t v84 = v73;
      uint64_t v85 = v133;
      (*(void (**)(char *, uint64_t))(v117 + 8))(v83, v84);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v20, v18);
      swift_storeEnumTagMultiPayload();
      uint64_t v78 = (uint64_t)v82;
LABEL_41:
      uint64_t v40 = (uint64_t)v89;
      sub_1A568BF80(v78, (uint64_t)v89);
LABEL_34:
      uint64_t v68 = (uint64_t)v137;
      sub_1A568BF80(v40, v132);
      uint64_t result = __swift_destroy_boxed_opaque_existential_0Tm(v68);
      break;
    case 0xC:
      LOBYTE(v138) = 12;
      sub_1A568C144();
      uint64_t v64 = v128;
      uint64_t v65 = v143;
      sub_1A56D5C88();
      if (v65) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v112 + 8))(v64, v113);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 0xD:
      LOBYTE(v138) = 13;
      sub_1A568C0F0();
      uint64_t v66 = v129;
      uint64_t v67 = v143;
      sub_1A56D5C88();
      if (v67) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v114 + 8))(v66, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
      goto LABEL_33;
    case 0xE:
      LOBYTE(v138) = 14;
      sub_1A568C09C();
      uint64_t v70 = v130;
      uint64_t v71 = v143;
      sub_1A56D5C88();
      if (v71) {
        goto LABEL_37;
      }
      sub_1A55F7BD4();
      uint64_t v72 = v116;
      sub_1A56D5D48();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v70, v72);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v74 = v139;
      uint64_t v75 = v142;
      uint64_t v76 = v87;
      *uint64_t v87 = v138;
      v76[1] = v74;
      long long v77 = v141;
      *((_OWORD *)v76 + 1) = v140;
      *((_OWORD *)v76 + 2) = v77;
      v76[6] = v75;
      swift_storeEnumTagMultiPayload();
      uint64_t v78 = (uint64_t)v76;
      goto LABEL_41;
    default:
      LOBYTE(v138) = 0;
      sub_1A568C534();
      uint64_t v38 = v119;
      uint64_t v39 = v143;
      sub_1A56D5C88();
      if (v39) {
        goto LABEL_37;
      }
      (*(void (**)(char *, uint64_t))(v90 + 8))(v38, v91);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v20, v18);
      uint64_t v40 = (uint64_t)v89;
LABEL_33:
      swift_storeEnumTagMultiPayload();
      goto LABEL_34;
  }
  return result;
}

uint64_t sub_1A568B8D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDropReceive.Failure.init(from:)(a1, a2);
}

uint64_t sub_1A568B8EC(void *a1)
{
  return SFAirDropReceive.Failure.encode(to:)(a1);
}

uint64_t sub_1A568B904()
{
  return sub_1A56D60E8();
}

uint64_t sub_1A568B948()
{
  return sub_1A56D60E8();
}

uint64_t _s7Sharing16SFAirDropReceiveO7FailureO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A56D4A28();
  *(void *)&long long v43 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (uint64_t *)((char *)&v41 - v14);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96752A0);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (uint64_t)&v19[*(int *)(v17 + 56)];
  sub_1A568BFE4(a1, (uint64_t)v19);
  sub_1A568BFE4(a2, v20);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1A568BFE4((uint64_t)v19, (uint64_t)v13);
      uint64_t v25 = *((void *)v13 + 1);
      uint64_t v26 = *((void *)v13 + 4);
      uint64_t v27 = *((void *)v13 + 6);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v28 = *((void *)v13 + 5);
        uint64_t v29 = *(void *)v20;
        uint64_t v30 = *(void *)(v20 + 8);
        uint64_t v31 = *(void *)(v20 + 48);
        v48[0] = *(void *)v13;
        v48[1] = v25;
        long long v49 = *((_OWORD *)v13 + 1);
        uint64_t v50 = v26;
        uint64_t v51 = v28;
        uint64_t v52 = v27;
        v44[0] = v29;
        v44[1] = v30;
        long long v32 = *(_OWORD *)(v20 + 16);
        long long v43 = *(_OWORD *)(v20 + 32);
        long long v45 = v32;
        long long v46 = v43;
        uint64_t v47 = v31;
        char v33 = _s7Sharing12CodableErrorV2eeoiySbAC_ACtFZ_0(v48, v44);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_33;
    case 2u:
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 5u:
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 7u:
      if (swift_getEnumCaseMultiPayload() != 7) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 8u:
      if (swift_getEnumCaseMultiPayload() != 8) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 9u:
      if (swift_getEnumCaseMultiPayload() != 9) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 0xAu:
      if (swift_getEnumCaseMultiPayload() != 10) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 0xBu:
      if (swift_getEnumCaseMultiPayload() != 11) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 0xCu:
      if (swift_getEnumCaseMultiPayload() != 12) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 0xDu:
      if (swift_getEnumCaseMultiPayload() != 13) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 0xEu:
      if (swift_getEnumCaseMultiPayload() != 14) {
        goto LABEL_34;
      }
LABEL_31:
      sub_1A568CB18((uint64_t)v19);
      char v33 = 1;
      return v33 & 1;
    default:
      sub_1A568BFE4((uint64_t)v19, (uint64_t)v15);
      uint64_t v22 = *v15;
      uint64_t v21 = v15[1];
      uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v24 = (char *)v15 + v23;
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v43 + 8))(v24, v4);
LABEL_33:
        swift_bridgeObjectRelease();
LABEL_34:
        sub_1A568E590((uint64_t)v19);
        goto LABEL_35;
      }
      uint64_t v35 = *(void *)v20;
      uint64_t v41 = *(void *)(v20 + 8);
      uint64_t v42 = v35;
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v43 + 32);
      v36(v9, v24, v4);
      v36(v7, (char *)(v20 + v23), v4);
      if (v22 == v42 && v21 == v41)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v38 = sub_1A56D5F28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0)
        {
          uint64_t v39 = *(void (**)(char *, uint64_t))(v43 + 8);
          v39(v7, v4);
          v39(v9, v4);
          sub_1A568CB18((uint64_t)v19);
LABEL_35:
          char v33 = 0;
          return v33 & 1;
        }
      }
      char v33 = MEMORY[0x1A6268C50](v9, v7);
      uint64_t v40 = *(void (**)(char *, uint64_t))(v43 + 8);
      v40(v7, v4);
      v40(v9, v4);
LABEL_45:
      sub_1A568CB18((uint64_t)v19);
      return v33 & 1;
  }
}

uint64_t type metadata accessor for SFAirDropReceive.Failure()
{
  uint64_t result = qword_1E966B268;
  if (!qword_1E966B268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A568BF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A568BFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A568C048()
{
  unint64_t result = qword_1E9675080;
  if (!qword_1E9675080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675080);
  }
  return result;
}

unint64_t sub_1A568C09C()
{
  unint64_t result = qword_1E9675088;
  if (!qword_1E9675088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675088);
  }
  return result;
}

unint64_t sub_1A568C0F0()
{
  unint64_t result = qword_1E9675090;
  if (!qword_1E9675090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675090);
  }
  return result;
}

unint64_t sub_1A568C144()
{
  unint64_t result = qword_1E9675098;
  if (!qword_1E9675098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675098);
  }
  return result;
}

unint64_t sub_1A568C198()
{
  unint64_t result = qword_1E96750A0;
  if (!qword_1E96750A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750A0);
  }
  return result;
}

unint64_t sub_1A568C1EC()
{
  unint64_t result = qword_1E96750A8;
  if (!qword_1E96750A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750A8);
  }
  return result;
}

unint64_t sub_1A568C240()
{
  unint64_t result = qword_1E96750B0;
  if (!qword_1E96750B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750B0);
  }
  return result;
}

unint64_t sub_1A568C294()
{
  unint64_t result = qword_1E96750B8;
  if (!qword_1E96750B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750B8);
  }
  return result;
}

unint64_t sub_1A568C2E8()
{
  unint64_t result = qword_1E96750C0;
  if (!qword_1E96750C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750C0);
  }
  return result;
}

unint64_t sub_1A568C33C()
{
  unint64_t result = qword_1E96750C8;
  if (!qword_1E96750C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750C8);
  }
  return result;
}

unint64_t sub_1A568C390()
{
  unint64_t result = qword_1E96750D0;
  if (!qword_1E96750D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750D0);
  }
  return result;
}

unint64_t sub_1A568C3E4()
{
  unint64_t result = qword_1E96750D8;
  if (!qword_1E96750D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750D8);
  }
  return result;
}

unint64_t sub_1A568C438()
{
  unint64_t result = qword_1E96750E0;
  if (!qword_1E96750E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750E0);
  }
  return result;
}

unint64_t sub_1A568C48C()
{
  unint64_t result = qword_1E96750E8;
  if (!qword_1E96750E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750E8);
  }
  return result;
}

unint64_t sub_1A568C4E0()
{
  unint64_t result = qword_1E96750F0;
  if (!qword_1E96750F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750F0);
  }
  return result;
}

unint64_t sub_1A568C534()
{
  unint64_t result = qword_1E96750F8;
  if (!qword_1E96750F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96750F8);
  }
  return result;
}

uint64_t sub_1A568C588()
{
  return sub_1A568C618(&qword_1E9675180, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Failure);
}

uint64_t sub_1A568C5D0()
{
  return sub_1A568C618(&qword_1E9674EF0, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Failure);
}

uint64_t sub_1A568C618(unint64_t *a1, void (*a2)(uint64_t))
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

void *_s7FailureOwCP(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      uint64_t v15 = a2[5];
      a1[4] = a2[4];
      a1[5] = v15;
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
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
      uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s7FailureOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
    uint64_t v4 = sub_1A56D4A28();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(v3, v4);
  }
  return result;
}

void *_s7FailureOwcp(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v12 = a2[1];
    *a1 = *a2;
    a1[1] = v12;
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    uint64_t v13 = a2[5];
    a1[4] = a2[4];
    a1[5] = v13;
    a1[6] = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
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
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1A56D4A28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *_s7FailureOwca(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A568CB18((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      a1[5] = a2[5];
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
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
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A568CB18(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SFAirDropReceive.Failure();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *_s7FailureOwtk(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1A56D4A28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *_s7FailureOwta(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A568CB18((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A568CD2C()
{
  uint64_t result = sub_1A56D4A28();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[4] = v2;
    v2[5] = &unk_1A56FED98;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s7FailureO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7FailureO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
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
        JUMPOUT(0x1A568CF2CLL);
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *_s7FailureO10CodingKeysOMa_0()
{
  return &_s7FailureO10CodingKeysON_0;
}

ValueMetadata *_s7FailureO18DeclinedCodingKeysOMa()
{
  return &_s7FailureO18DeclinedCodingKeysON;
}

ValueMetadata *_s7FailureO22AskDismissedCodingKeysOMa()
{
  return &_s7FailureO22AskDismissedCodingKeysON;
}

ValueMetadata *_s7FailureO25SenderCancelledCodingKeysOMa()
{
  return &_s7FailureO25SenderCancelledCodingKeysON;
}

ValueMetadata *_s7FailureO27ReceiverCancelledCodingKeysOMa()
{
  return &_s7FailureO27ReceiverCancelledCodingKeysON;
}

ValueMetadata *_s7FailureO20MixedTypesCodingKeysOMa()
{
  return &_s7FailureO20MixedTypesCodingKeysON;
}

ValueMetadata *_s7FailureO34MissingDownloadDirectoryCodingKeysOMa_0()
{
  return &_s7FailureO34MissingDownloadDirectoryCodingKeysON_0;
}

ValueMetadata *_s7FailureO27MissingOwnContactCodingKeysOMa_0()
{
  return &_s7FailureO27MissingOwnContactCodingKeysON_0;
}

ValueMetadata *_s7FailureO21StreamErrorCodingKeysOMa_0()
{
  return &_s7FailureO21StreamErrorCodingKeysON_0;
}

ValueMetadata *_s7FailureO23AskNotHandledCodingKeysOMa()
{
  return &_s7FailureO23AskNotHandledCodingKeysON;
}

ValueMetadata *_s7FailureO28IncompleteTransferCodingKeysOMa()
{
  return &_s7FailureO28IncompleteTransferCodingKeysON;
}

ValueMetadata *_s7FailureO20BadRequestCodingKeysOMa_0()
{
  return &_s7FailureO20BadRequestCodingKeysON_0;
}

unsigned char *_s7FailureO25UnsupportedTypeCodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A568D0E0);
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

ValueMetadata *_s7FailureO25UnsupportedTypeCodingKeysOMa()
{
  return &_s7FailureO25UnsupportedTypeCodingKeysON;
}

ValueMetadata *_s7FailureO25MoveToAppFailedCodingKeysOMa()
{
  return &_s7FailureO25MoveToAppFailedCodingKeysON;
}

ValueMetadata *_s7FailureO29InsufficientStorageCodingKeysOMa_0()
{
  return &_s7FailureO29InsufficientStorageCodingKeysON_0;
}

unsigned char *_s7FailureO20UnexpectedCodingKeysOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A568D1D4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s7FailureO20UnexpectedCodingKeysOMa_0()
{
  return &_s7FailureO20UnexpectedCodingKeysON_0;
}

unint64_t sub_1A568D210()
{
  unint64_t result = qword_1E9675188;
  if (!qword_1E9675188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675188);
  }
  return result;
}

unint64_t sub_1A568D268()
{
  unint64_t result = qword_1E9675190;
  if (!qword_1E9675190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675190);
  }
  return result;
}

unint64_t sub_1A568D2C0()
{
  unint64_t result = qword_1E9675198;
  if (!qword_1E9675198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675198);
  }
  return result;
}

unint64_t sub_1A568D318()
{
  unint64_t result = qword_1E96751A0;
  if (!qword_1E96751A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751A0);
  }
  return result;
}

unint64_t sub_1A568D370()
{
  unint64_t result = qword_1E96751A8;
  if (!qword_1E96751A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751A8);
  }
  return result;
}

unint64_t sub_1A568D3C8()
{
  unint64_t result = qword_1E96751B0;
  if (!qword_1E96751B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751B0);
  }
  return result;
}

unint64_t sub_1A568D420()
{
  unint64_t result = qword_1E96751B8;
  if (!qword_1E96751B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751B8);
  }
  return result;
}

unint64_t sub_1A568D478()
{
  unint64_t result = qword_1E96751C0;
  if (!qword_1E96751C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751C0);
  }
  return result;
}

unint64_t sub_1A568D4D0()
{
  unint64_t result = qword_1E96751C8;
  if (!qword_1E96751C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751C8);
  }
  return result;
}

unint64_t sub_1A568D528()
{
  unint64_t result = qword_1E96751D0;
  if (!qword_1E96751D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751D0);
  }
  return result;
}

unint64_t sub_1A568D580()
{
  unint64_t result = qword_1E96751D8;
  if (!qword_1E96751D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751D8);
  }
  return result;
}

unint64_t sub_1A568D5D8()
{
  unint64_t result = qword_1E96751E0;
  if (!qword_1E96751E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751E0);
  }
  return result;
}

unint64_t sub_1A568D630()
{
  unint64_t result = qword_1E96751E8;
  if (!qword_1E96751E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751E8);
  }
  return result;
}

unint64_t sub_1A568D688()
{
  unint64_t result = qword_1E96751F0;
  if (!qword_1E96751F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751F0);
  }
  return result;
}

unint64_t sub_1A568D6E0()
{
  unint64_t result = qword_1E96751F8;
  if (!qword_1E96751F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96751F8);
  }
  return result;
}

unint64_t sub_1A568D738()
{
  unint64_t result = qword_1E9675200;
  if (!qword_1E9675200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675200);
  }
  return result;
}

unint64_t sub_1A568D790()
{
  unint64_t result = qword_1E9675208;
  if (!qword_1E9675208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675208);
  }
  return result;
}

unint64_t sub_1A568D7E8()
{
  unint64_t result = qword_1E9675210;
  if (!qword_1E9675210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675210);
  }
  return result;
}

unint64_t sub_1A568D840()
{
  unint64_t result = qword_1E9675218;
  if (!qword_1E9675218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675218);
  }
  return result;
}

unint64_t sub_1A568D898()
{
  unint64_t result = qword_1E9675220;
  if (!qword_1E9675220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675220);
  }
  return result;
}

unint64_t sub_1A568D8F0()
{
  unint64_t result = qword_1E9675228;
  if (!qword_1E9675228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675228);
  }
  return result;
}

unint64_t sub_1A568D948()
{
  unint64_t result = qword_1E9675230;
  if (!qword_1E9675230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675230);
  }
  return result;
}

unint64_t sub_1A568D9A0()
{
  unint64_t result = qword_1E9675238;
  if (!qword_1E9675238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675238);
  }
  return result;
}

unint64_t sub_1A568D9F8()
{
  unint64_t result = qword_1E9675240;
  if (!qword_1E9675240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675240);
  }
  return result;
}

unint64_t sub_1A568DA50()
{
  unint64_t result = qword_1E9675248;
  if (!qword_1E9675248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675248);
  }
  return result;
}

unint64_t sub_1A568DAA8()
{
  unint64_t result = qword_1E9675250;
  if (!qword_1E9675250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675250);
  }
  return result;
}

unint64_t sub_1A568DB00()
{
  unint64_t result = qword_1E9675258;
  if (!qword_1E9675258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675258);
  }
  return result;
}

unint64_t sub_1A568DB58()
{
  unint64_t result = qword_1E9675260;
  if (!qword_1E9675260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675260);
  }
  return result;
}

unint64_t sub_1A568DBB0()
{
  unint64_t result = qword_1E9675268;
  if (!qword_1E9675268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675268);
  }
  return result;
}

unint64_t sub_1A568DC08()
{
  unint64_t result = qword_1E9675270;
  if (!qword_1E9675270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675270);
  }
  return result;
}

unint64_t sub_1A568DC60()
{
  unint64_t result = qword_1E9675278;
  if (!qword_1E9675278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675278);
  }
  return result;
}

unint64_t sub_1A568DCB8()
{
  unint64_t result = qword_1E9675280;
  if (!qword_1E9675280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675280);
  }
  return result;
}

unint64_t sub_1A568DD10()
{
  unint64_t result = qword_1E9675288;
  if (!qword_1E9675288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675288);
  }
  return result;
}

unint64_t sub_1A568DD68()
{
  unint64_t result = qword_1E9675290;
  if (!qword_1E9675290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675290);
  }
  return result;
}

unint64_t sub_1A568DDC0()
{
  unint64_t result = qword_1E9675298;
  if (!qword_1E9675298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675298);
  }
  return result;
}

uint64_t sub_1A568DE14(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64656E696C636564 && a2 == 0xE800000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696D7369446B7361 && a2 == 0xEC00000064657373 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61437265646E6573 && a2 == 0xEF64656C6C65636ELL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001A573CCF0 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x707954646578696DLL && a2 == 0xEA00000000007365 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000001A573AD30 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001A573AD10 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x72456D6165727473 && a2 == 0xEB00000000726F72 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6148746F4E6B7361 && a2 == 0xED000064656C646ELL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001A573CCD0 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6575716552646162 && a2 == 0xEA00000000007473 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x726F707075736E75 && a2 == 0xEF65707954646574 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x70416F5465766F6DLL && a2 == 0xEF64656C69614670 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001A573ACD0 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x7463657078656E75 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 14;
    }
    else {
      return 15;
    }
  }
}

uint64_t sub_1A568E4BC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6911093 && a2 == 0xE300000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A568E590(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96752A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SFXPCProgressTask.initialValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t SFXPCProgressTask.init(_:)@<X0>(uint64_t a1@<X0>, ValueMetadata *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v41 = a6;
  uint64_t v51 = a4;
  long long v46 = a2;
  uint64_t v14 = type metadata accessor for SFProgressTask();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v43 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v14);
  long long v45 = (char *)&v38 - v16;
  unint64_t v17 = sub_1A55A6748();
  unint64_t v48 = v17;
  unint64_t v47 = sub_1A55A67A0();
  uint64_t v53 = &type metadata for VoidParameters;
  uint64_t v54 = a3;
  uint64_t v39 = a3;
  unint64_t v55 = v17;
  unint64_t v56 = v47;
  uint64_t v57 = a6;
  uint64_t v58 = a7;
  uint64_t v18 = a7;
  uint64_t v19 = type metadata accessor for SFXPCBlock();
  uint64_t v49 = *(void *)(v19 - 8);
  uint64_t v50 = v19;
  MEMORY[0x1F4188790](v19);
  uint64_t v44 = (uint64_t)&v38 - v20;
  uint64_t v21 = a8;
  uint64_t v22 = a8;
  uint64_t v42 = a8;
  uint64_t v23 = a1;
  SFProgressTask.initialValue.getter(v14, v21);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = v51;
  unint64_t v26 = a5;
  uint64_t v40 = v23;
  AsyncSequence<>.xpc.getter(v14, WitnessTable, v51, a5, &v52);
  uint64_t v27 = v46;
  uint64_t v53 = v46;
  uint64_t v54 = a3;
  unint64_t v55 = v25;
  unint64_t v56 = v26;
  unint64_t v28 = v26;
  uint64_t v29 = v41;
  uint64_t v57 = v41;
  uint64_t v58 = v18;
  uint64_t v30 = type metadata accessor for SFXPCProgressTask();
  *(_OWORD *)(v22 + *(int *)(v30 + 68)) = v52;
  uint64_t v31 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v45, v23, v14);
  unint64_t v32 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  char v33 = (char *)swift_allocObject();
  *((void *)v33 + 2) = v27;
  uint64_t v34 = v39;
  uint64_t v35 = v51;
  *((void *)v33 + 3) = v39;
  *((void *)v33 + 4) = v35;
  *((void *)v33 + 5) = v28;
  *((void *)v33 + 6) = v29;
  *((void *)v33 + 7) = v18;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v33[v32], v31, v14);
  uint64_t v36 = v44;
  SFXPCBlock.init(_:)((uint64_t)&unk_1E96752B0, (uint64_t)v33, (uint64_t)&type metadata for VoidParameters, v34, v48, v47, v29, v18, v44);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v40, v14);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v42 + *(int *)(v30 + 72), v36, v50);
}

uint64_t type metadata accessor for SFXPCProgressTask()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A568E958(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = type metadata accessor for SFProgressTask();
  void *v3 = v1;
  v3[1] = sub_1A54E83BC;
  return SFProgressTask.finalValue.getter(a1, v4);
}

uint64_t sub_1A568EA2C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for SFProgressTask() - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  swift_bridgeObjectRelease();
  uint64_t v4 = v3 + v2[11];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v5 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = type metadata accessor for SFProgressContinuation();
  uint64_t v7 = v4 + *(int *)(v6 + 36);
  uint64_t v8 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v4 + *(int *)(v6 + 44), v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A568EC44(uint64_t a1)
{
  type metadata accessor for SFProgressTask();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1A54E83BC;
  return sub_1A568E958(a1);
}

uint64_t SFXPCProgressTask.finalValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  unint64_t v7 = sub_1A55A6748();
  unint64_t v8 = sub_1A55A67A0();
  long long v9 = *(_OWORD *)(a2 + 48);
  *(void *)(v2 + 16) = &type metadata for VoidParameters;
  *(void *)(v2 + 24) = v6;
  *(void *)(v2 + 32) = v7;
  *(void *)(v2 + 40) = v8;
  *(_OWORD *)(v2 + 48) = v9;
  uint64_t v10 = type metadata accessor for SFXPCBlock();
  *uint64_t v5 = v2;
  v5[1] = sub_1A54F6A98;
  uint64_t v11 = MEMORY[0x1E4FBC860];
  return SFXPCBlock.dynamicallyCall(withArguments:)(a1, v11, v10);
}

uint64_t SFXPCProgressTask.makeAsyncIterator()()
{
  return SFXPCAsyncSequence.makeAsyncIterator()();
}

uint64_t sub_1A568EEC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x566C616974696E69 && a2 == 0xEC00000065756C61;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65636E6575716573 && a2 == 0xE800000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61566C616E6966 && a2 == 0xEF6B636F6C426575)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A568F054(char a1)
{
  if (!a1) {
    return 0x566C616974696E69;
  }
  if (a1 == 1) {
    return 0x65636E6575716573;
  }
  return 0x6C61566C616E6966;
}

BOOL sub_1A568F0C0(char *a1, char *a2)
{
  return sub_1A562F518(*a1, *a2);
}

uint64_t sub_1A568F0DC()
{
  return sub_1A562F7E0();
}

uint64_t sub_1A568F0F0()
{
  return sub_1A562F528();
}

uint64_t sub_1A568F104()
{
  return sub_1A56D60E8();
}

uint64_t sub_1A568F154()
{
  return sub_1A568F054(*v0);
}

uint64_t sub_1A568F168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A568EEC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A568F1A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A5635448();
  *a1 = result;
  return result;
}

uint64_t sub_1A568F1D8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A568F22C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t SFXPCProgressTask.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  unint64_t v6 = *(void *)(a2 + 32);
  unint64_t v23 = *(void *)(a2 + 40);
  uint64_t v24 = v5;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)&long long v28 = v5;
  *((void *)&v28 + 1) = v4;
  uint64_t v19 = v4;
  uint64_t v20 = v8;
  uint64_t v21 = v7;
  unint64_t v22 = v6;
  unint64_t v29 = v6;
  unint64_t v30 = v23;
  uint64_t v31 = v7;
  uint64_t v32 = v8;
  type metadata accessor for SFXPCProgressTask.CodingKeys();
  swift_getWitnessTable();
  uint64_t v9 = sub_1A56D5E68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v18 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56D61D8();
  LOBYTE(v28) = 0;
  uint64_t v13 = v25;
  uint64_t v27 = v9;
  uint64_t v14 = v26;
  sub_1A56D5E38();
  if (!v14)
  {
    long long v28 = *(_OWORD *)(v13 + *(int *)(a2 + 68));
    char v33 = 1;
    type metadata accessor for SFXPCAsyncSequence();
    swift_getWitnessTable();
    sub_1A56D5E38();
    char v33 = 2;
    unint64_t v15 = sub_1A55A6748();
    unint64_t v16 = sub_1A55A67A0();
    *(void *)&long long v28 = &type metadata for VoidParameters;
    *((void *)&v28 + 1) = v19;
    unint64_t v29 = v15;
    unint64_t v30 = v16;
    uint64_t v31 = v21;
    uint64_t v32 = v20;
    type metadata accessor for SFXPCBlock();
    swift_getWitnessTable();
    sub_1A56D5E38();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v27);
}

uint64_t type metadata accessor for SFXPCProgressTask.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t SFXPCProgressTask.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v35 = a8;
  *(void *)&long long v47 = &type metadata for VoidParameters;
  *((void *)&v47 + 1) = a3;
  unint64_t v48 = sub_1A55A6748();
  unint64_t v49 = sub_1A55A67A0();
  uint64_t v50 = a6;
  uint64_t v51 = a7;
  long long v45 = a7;
  uint64_t v36 = type metadata accessor for SFXPCBlock();
  uint64_t v34 = *(void *)(v36 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v36);
  uint64_t v37 = (char *)&v33 - v16;
  uint64_t v38 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v44 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v47 = a2;
  *((void *)&v47 + 1) = a3;
  unint64_t v48 = a4;
  unint64_t v49 = a5;
  uint64_t v50 = a6;
  uint64_t v51 = a7;
  type metadata accessor for SFXPCProgressTask.CodingKeys();
  swift_getWitnessTable();
  uint64_t v42 = sub_1A56D5D88();
  uint64_t v39 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v19 = (char *)&v33 - v18;
  uint64_t v43 = a2;
  *(void *)&long long v47 = a2;
  *((void *)&v47 + 1) = a3;
  unint64_t v40 = a5;
  unint64_t v41 = a4;
  unint64_t v48 = a4;
  unint64_t v49 = a5;
  uint64_t v50 = a6;
  uint64_t v51 = v45;
  uint64_t v20 = type metadata accessor for SFXPCProgressTask();
  uint64_t v33 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  unint64_t v22 = (char *)&v33 - v21;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  long long v45 = v19;
  unint64_t v23 = v46;
  sub_1A56D61A8();
  if (v23) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v24 = v39;
  long long v46 = v22;
  LOBYTE(v47) = 0;
  uint64_t v25 = v43;
  uint64_t v26 = v42;
  sub_1A56D5D48();
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v46, v44, v25);
  type metadata accessor for SFXPCAsyncSequence();
  char v52 = 1;
  swift_getWitnessTable();
  sub_1A56D5D48();
  uint64_t v44 = (char *)v20;
  uint64_t v27 = *(int *)(v20 + 68);
  long long v28 = v46;
  *(_OWORD *)&v46[v27] = v47;
  LOBYTE(v47) = 2;
  uint64_t v29 = v36;
  swift_getWitnessTable();
  sub_1A56D5D48();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v45, v26);
  unint64_t v30 = v44;
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v28[*((int *)v44 + 18)], v37, v29);
  uint64_t v31 = v33;
  (*(void (**)(uint64_t, char *, char *))(v33 + 16))(v35, v28, v30);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return (*(uint64_t (**)(char *, char *))(v31 + 8))(v28, v30);
}

uint64_t sub_1A568FAB4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return SFXPCProgressTask.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(char **)(a2 + 56), a3);
}

uint64_t sub_1A568FADC(void *a1, uint64_t a2)
{
  return SFXPCProgressTask.encode(to:)(a1, a2);
}

uint64_t sub_1A568FAF4(uint64_t a1)
{
  SFXPCProgressTask.makeAsyncIterator()();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);

  return v3(v1, a1);
}

uint64_t SFProgressTask<>.xpc.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  MEMORY[0x1F4188790](a1);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v14, v6, a1);
  return SFXPCProgressTask.init(_:)((uint64_t)v14, *(ValueMetadata **)(a1 + 16), *(void *)(a1 + 24), a2, a3, a4, a5, a6);
}

uint64_t sub_1A568FC4C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A568FC68()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    sub_1A55A6748();
    sub_1A55A67A0();
    uint64_t result = type metadata accessor for SFXPCBlock();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1A568FD74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10 & 0xF8 | 7;
  uint64_t v12 = *(void *)(v9 + 64) + 7;
  int v13 = v10 | *(_DWORD *)(v6 + 80);
  if ((v13 & 0x1000F8) != 0
    || (v12 & 0xFFFFFFFFFFFFFFF8) + ((v11 + ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v11) + 16 > 0x18)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + (((v13 & 0xF8 | 7u) + 16) & ~(unint64_t)(v13 & 0xF8 | 7u)));
  }
  else
  {
    uint64_t v16 = v8;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    uint64_t v17 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v18 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = ((unint64_t)v17 + v11 + 16) & ~v11;
    uint64_t v21 = ((unint64_t)v18 + v11 + 16) & ~v11;
    unint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    swift_retain();
    v22(v20, v21, v16);
    unint64_t v23 = (void *)((v12 + v21) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v24 = v23[1];
    uint64_t v25 = (void *)((v12 + v20) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v25 = *v23;
    v25[1] = v24;
  }
  swift_retain();
  return a1;
}

uint64_t sub_1A568FF54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v5 = sub_1A56D4CB8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80) & 0xF8 | 7;
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))((v4 + v7 + 16) & ~v7, v5);

  return swift_release();
}

uint64_t sub_1A569002C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  void *v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = sub_1A56D4CB8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16);
  uint64_t v13 = v11 + 16;
  uint64_t v14 = *(_DWORD *)(v11 + 80) & 0xF8;
  uint64_t v15 = v14 + 23;
  unint64_t v16 = (unint64_t)v7 + v14 + 23;
  unint64_t v17 = ~v14 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = v16 & v17;
  unint64_t v19 = ((unint64_t)v8 + v15) & v17;
  swift_retain();
  v12(v18, v19, v10);
  uint64_t v20 = *(void *)(v13 + 48) + 7;
  uint64_t v21 = (void *)((v20 + v18) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = (void *)((v20 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  swift_retain();
  return a1;
}

uint64_t sub_1A5690148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  void *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = sub_1A56D4CB8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = v11 + 24;
  uint64_t v13 = *(_DWORD *)(v11 + 80) & 0xF8;
  uint64_t v14 = v13 + 23;
  unint64_t v15 = (unint64_t)v7 + v13 + 23;
  unint64_t v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = v15 & v16;
  unint64_t v18 = ((unint64_t)v8 + v14) & v16;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 24))(v15 & v16, v18, v10);
  uint64_t v19 = *(void *)(v12 + 40) + 7;
  uint64_t v20 = (void *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A569026C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v7 = *v8;
  uint64_t v9 = sub_1A56D4CB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v10 + 32;
  uint64_t v12 = *(_DWORD *)(v10 + 80) & 0xF8;
  uint64_t v13 = v12 + 23;
  unint64_t v14 = (unint64_t)v7 + v12 + 23;
  unint64_t v15 = ~v12 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = v14 & v15;
  unint64_t v17 = ((unint64_t)v8 + v13) & v15;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))(v14 & v15, v17, v9);
  *(_OWORD *)((*(void *)(v11 + 32) + 7 + v16) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v11 + 32)
                                                                                       + 7
                                                                                       + v17) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1A5690370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v7 = *v8;
  swift_release();
  uint64_t v9 = sub_1A56D4CB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v10 + 40;
  uint64_t v12 = *(_DWORD *)(v10 + 80) & 0xF8;
  uint64_t v13 = v12 + 23;
  unint64_t v14 = (unint64_t)v7 + v12 + 23;
  unint64_t v15 = ~v12 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = v14 & v15;
  unint64_t v17 = ((unint64_t)v8 + v13) & v15;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 40))(v14 & v15, v17, v9);
  *(_OWORD *)((*(void *)(v11 + 24) + 7 + v16) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v11 + 24)
                                                                                       + 7
                                                                                       + v17) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1A5690484(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v6 + 64);
  if (*(_DWORD *)(v9 + 84) <= 0x7FFFFFFFu) {
    unsigned int v11 = 0x7FFFFFFF;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  if (v7 <= v11) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = v7;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  if (v12 < a2)
  {
    unint64_t v14 = ((*(void *)(*(void *)(v8 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8)
        + ((v13 + ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v13)
        + 16;
    uint64_t v15 = v14 & 0xFFFFFFF8;
    if ((v14 & 0xFFFFFFF8) != 0) {
      unsigned int v16 = 2;
    }
    else {
      unsigned int v16 = a2 - v12 + 1;
    }
    if (v16 >= 0x10000) {
      unsigned int v17 = 4;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v16 < 0x100) {
      unsigned int v17 = 1;
    }
    if (v16 >= 2) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    switch(v18)
    {
      case 1:
        int v19 = *((unsigned __int8 *)a1 + v14);
        if (!v19) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v19 = *(unsigned __int16 *)((char *)a1 + v14);
        if (v19) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A5690704);
      case 4:
        int v19 = *(int *)((char *)a1 + v14);
        if (!v19) {
          break;
        }
LABEL_25:
        int v21 = v19 - 1;
        if (v15)
        {
          int v21 = 0;
          int v22 = *a1;
        }
        else
        {
          int v22 = 0;
        }
        return v12 + (v22 | v21) + 1;
      default:
        break;
    }
  }
  if (v7 >= v11)
  {
    uint64_t v25 = *(uint64_t (**)(int *, uint64_t, uint64_t))(v6 + 48);
    return v25(a1, v7, v5);
  }
  else
  {
    uint64_t v23 = (uint64_t *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
    if ((v12 & 0x80000000) != 0)
    {
      uint64_t v26 = *(uint64_t (**)(unint64_t))(v9 + 48);
      return v26(((unint64_t)v23 + v13 + 16) & ~v13);
    }
    else
    {
      uint64_t v24 = *v23;
      if ((unint64_t)*v23 >= 0xFFFFFFFF) {
        LODWORD(v24) = -1;
      }
      return (v24 + 1);
    }
  }
}

void sub_1A5690718(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v30 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(sub_1A56D4CB8() - 8);
  uint64_t v11 = *(void *)(v8 + 64);
  if (*(_DWORD *)(v10 + 84) <= 0x7FFFFFFFu) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  if (v9 <= v12) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = v9;
  }
  uint64_t v14 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  size_t v15 = ((*(void *)(v10 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v16 = ((v14 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14) + v15;
  if (v13 >= a3)
  {
    int v19 = 0;
    int v20 = a2 - v13;
    if (a2 <= v13)
    {
LABEL_20:
      switch(v19)
      {
        case 1:
          *((unsigned char *)a1 + v16) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 2:
          *(_WORD *)((char *)a1 + v16) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 3:
          goto LABEL_53;
        case 4:
          *(_DWORD *)((char *)a1 + v16) = 0;
          goto LABEL_32;
        default:
LABEL_32:
          if (a2)
          {
LABEL_33:
            if (v9 >= v12)
            {
              uint64_t v26 = *(void (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(v30 + 56);
              v26(a1, a2, v9, v7);
            }
            else
            {
              uint64_t v24 = (void *)(((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8);
              if ((v13 & 0x80000000) != 0)
              {
                uint64_t v21 = ~v14;
                uint64_t v27 = (_DWORD *)(((unint64_t)v24 + v14 + 16) & ~v14);
                if (v12 >= a2)
                {
                  uint64_t v29 = *(void (**)(unint64_t, uint64_t))(v10 + 56);
                  v29(((unint64_t)v24 + v14 + 16) & v21, a2);
                }
                else if (v15)
                {
                  int v28 = ~v12 + a2;
                  bzero((void *)(((unint64_t)v24 + v14 + 16) & v21), v15);
                  *uint64_t v27 = v28;
                }
              }
              else
              {
                if ((a2 & 0x80000000) != 0)
                {
                  uint64_t v25 = a2 ^ 0x80000000;
                  v24[1] = 0;
                }
                else
                {
                  uint64_t v25 = (a2 - 1);
                }
                *uint64_t v24 = v25;
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (v16) {
      unsigned int v17 = 2;
    }
    else {
      unsigned int v17 = a3 - v13 + 1;
    }
    if (v17 >= 0x10000) {
      int v18 = 4;
    }
    else {
      int v18 = 2;
    }
    if (v17 < 0x100) {
      int v18 = 1;
    }
    if (v17 >= 2) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    int v20 = a2 - v13;
    if (a2 <= v13) {
      goto LABEL_20;
    }
  }
  if (v16) {
    int v22 = 1;
  }
  else {
    int v22 = v20;
  }
  if (v16)
  {
    int v23 = ~v13 + a2;
    bzero(a1, ((v14 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14) + v15);
    *a1 = v23;
  }
  switch(v19)
  {
    case 1:
      *((unsigned char *)a1 + v16) = v22;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v16) = v22;
      break;
    case 3:
LABEL_53:
      __break(1u);
      JUMPOUT(0x1A5690A24);
    case 4:
      *(_DWORD *)((char *)a1 + v16) = v22;
      break;
    default:
      return;
  }
}

unsigned char *sub_1A5690A4C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A5690B18);
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

uint64_t sub_1A5690B40()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A5690B5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A5690B78()
{
  return swift_getWitnessTable();
}

uint64_t combineLatest<A, B, C, D>(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, uint64_t a11, uint64_t a12)
{
  uint64_t v37 = a8;
  uint64_t v39 = a4;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v41 = a9;
  long long v40 = a10;
  uint64_t v15 = *(void *)(a8 - 8);
  uint64_t v38 = a11;
  uint64_t v36 = a12;
  uint64_t v16 = MEMORY[0x1F4188790](a1);
  int v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v16);
  int v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x1F4188790](v21);
  int v28 = (char *)&v34 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  uint64_t v30 = (char *)&v34 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v31 + 16))(v30);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v34, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v35, a7);
  uint64_t v32 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v39, v37);
  return sub_1A5690E78((uint64_t)v30, (uint64_t)v28, (uint64_t)v23, (uint64_t)v18, a5, a6, a7, v32, v41);
}

uint64_t sub_1A5690E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a9, a1, a5);
  uint64_t v16 = (int *)type metadata accessor for AsyncCombineLatest4Sequence();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(a9 + v16[21], a2, a6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(a9 + v16[22], a3, a7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(a9 + v16[23], a4, a8);
}

uint64_t AsyncCombineLatest4Sequence.Iterator.next()(uint64_t a1, void *a2)
{
  v2[22] = a1;
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[6];
  v2[23] = swift_getAssociatedTypeWitness();
  uint64_t v17 = a2[3];
  uint64_t v18 = a2[7];
  v2[24] = swift_getAssociatedTypeWitness();
  v2[25] = swift_getTupleTypeMetadata2();
  uint64_t v4 = a2[8];
  uint64_t v5 = a2[4];
  v2[26] = swift_getAssociatedTypeWitness();
  uint64_t v6 = a2[9];
  uint64_t v7 = a2[5];
  v2[27] = swift_getAssociatedTypeWitness();
  v2[28] = swift_getTupleTypeMetadata2();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v2[29] = TupleTypeMetadata2;
  uint64_t v9 = sub_1A56D5898();
  v2[30] = v9;
  v2[31] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v2[32] = v10;
  v2[33] = *(void *)(TupleTypeMetadata2 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  uint64_t v11 = (void *)swift_task_alloc();
  v2[39] = v11;
  v2[2] = v19;
  v2[3] = v17;
  v2[4] = v20;
  v2[5] = v18;
  uint64_t v12 = type metadata accessor for AsyncCombineLatest2Sequence();
  void v2[6] = v5;
  v2[7] = v7;
  v2[8] = v4;
  v2[9] = v6;
  uint64_t v13 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = swift_getWitnessTable();
  v2[10] = v12;
  v2[11] = v13;
  v2[12] = WitnessTable;
  v2[13] = v15;
  type metadata accessor for AsyncCombineLatest2Sequence.Iterator();
  *uint64_t v11 = v2;
  v11[1] = sub_1A5691328;
  return AsyncCombineLatest2Sequence.Iterator.next()(v10);
}

uint64_t sub_1A5691328()
{
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1A5691C54;
  }
  else {
    unint64_t v2 = sub_1A569143C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A569143C()
{
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 264) + 48))(v1, 1, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 176);
    long long v69 = *(_OWORD *)(v0 + 208);
    long long v71 = *(_OWORD *)(v0 + 184);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 248) + 8))(v1, *(void *)(v0 + 240));
    *(_OWORD *)(v0 + 112) = v71;
    *(_OWORD *)(v0 + 128) = v69;
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 56))(v3, 1, 1, TupleTypeMetadata);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 304);
    uint64_t v50 = *(void *)(v0 + 296);
    uint64_t v52 = *(void *)(v0 + 288);
    uint64_t v53 = *(void *)(v0 + 280);
    uint64_t v57 = *(void *)(v0 + 272);
    uint64_t v64 = *(void *)(v0 + 208);
    uint64_t v65 = *(void *)(v0 + 216);
    uint64_t v6 = *(void *)(v0 + 192);
    uint64_t v62 = *(void *)(v0 + 200);
    uint64_t v63 = *(void *)(v0 + 176);
    uint64_t v7 = *(int *)(v62 + 48);
    uint64_t v8 = v5 + v7;
    uint64_t v61 = v5 + v7;
    uint64_t v9 = *(int *)(v2 + 48);
    uint64_t v10 = v5 + v9;
    uint64_t v11 = *(void *)(v0 + 224);
    uint64_t v49 = v11;
    uint64_t v12 = v5 + v9 + *(int *)(v11 + 48);
    uint64_t v66 = v12;
    uint64_t v43 = v5 + v9;
    uint64_t v13 = v1 + v9;
    uint64_t v14 = v1 + v7;
    uint64_t v58 = *(void **)(*(void *)(v0 + 184) - 8);
    unint64_t v56 = (void (*)(uint64_t, uint64_t))v58[4];
    uint64_t v68 = v2;
    uint64_t v15 = *(void *)(v0 + 184);
    v56(v5, v1);
    uint64_t v72 = *(void **)(v6 - 8);
    uint64_t v54 = (void (*)(uint64_t, uint64_t, uint64_t))v72[4];
    v54(v8, v14, v6);
    uint64_t v16 = v13 + *(int *)(v11 + 48);
    uint64_t v70 = *(void **)(v64 - 8);
    uint64_t v38 = (void (*)(uint64_t, uint64_t, uint64_t))v70[4];
    v38(v10, v13, v64);
    unint64_t v55 = *(void **)(v65 - 8);
    long long v40 = (void (*)(uint64_t, uint64_t, uint64_t))v55[4];
    v40(v12, v16, v65);
    uint64_t v59 = v6;
    uint64_t v60 = v15;
    *(void *)(v0 + 144) = v15;
    *(void *)(v0 + 152) = v6;
    *(void *)(v0 + 160) = v64;
    *(void *)(v0 + 168) = v65;
    uint64_t v39 = (int *)swift_getTupleTypeMetadata();
    uint64_t v33 = v63 + v39[12];
    uint64_t v35 = v63 + v39[16];
    uint64_t v37 = v63 + v39[20];
    uint64_t v17 = v50 + *(int *)(v68 + 48);
    uint64_t v18 = v50 + *(int *)(v62 + 48);
    uint64_t v42 = v18;
    long long v47 = (void (*)(void))v58[2];
    v47();
    long long v46 = (void (*)(uint64_t, uint64_t, uint64_t))v72[2];
    v46(v18, v61, v6);
    uint64_t v19 = v17 + *(int *)(v11 + 48);
    uint64_t v41 = v19;
    long long v45 = (void (*)(void))v70[2];
    ((void (*)(uint64_t, uint64_t, uint64_t))v45)(v17, v43, v64);
    uint64_t v44 = (void (*)(uint64_t, uint64_t, uint64_t))v55[2];
    v44(v19, v66, v65);
    ((void (*)(uint64_t, uint64_t, uint64_t))v56)(v63, v50, v15);
    uint64_t v51 = v52 + *(int *)(v68 + 48);
    uint64_t v32 = v52 + *(int *)(v62 + 48);
    v47();
    uint64_t v20 = v6;
    v46(v32, v61, v6);
    uint64_t v21 = v51 + *(int *)(v49 + 48);
    uint64_t v36 = v21;
    v45();
    v44(v21, v66, v65);
    v54(v33, v32, v20);
    uint64_t v22 = v53 + *(int *)(v68 + 48);
    uint64_t v23 = v53 + *(int *)(v62 + 48);
    uint64_t v34 = v23;
    v47();
    v46(v23, v61, v20);
    uint64_t v48 = v22 + *(int *)(v49 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v45)(v22, v43, v64);
    v44(v48, v66, v65);
    v38(v35, v22, v64);
    uint64_t v24 = v57 + *(int *)(v68 + 48);
    uint64_t v25 = v57 + *(int *)(v62 + 48);
    ((void (*)(void))v56)();
    v54(v25, v61, v20);
    uint64_t v26 = v24 + *(int *)(v49 + 48);
    v38(v24, v43, v64);
    v40(v26, v66, v65);
    v40(v37, v26, v65);
    (*(void (**)(uint64_t, void, uint64_t))(*((void *)v39 - 1) + 56))(v63, 0, 1);
    uint64_t v67 = (void (*)(uint64_t, uint64_t))v70[1];
    v67(v24, v64);
    uint64_t v27 = (void (*)(uint64_t, uint64_t))v72[1];
    v27(v25, v59);
    int v28 = (void (*)(uint64_t, uint64_t))v58[1];
    v28(v57, v60);
    uint64_t v29 = (void (*)(uint64_t, uint64_t))v55[1];
    v29(v48, v65);
    v27(v34, v59);
    v28(v53, v60);
    v29(v36, v65);
    v67(v51, v64);
    v28(v52, v60);
    v29(v41, v65);
    v67(v17, v64);
    v27(v42, v59);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_1A5691C54()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A5691CFC(uint64_t a1, void *a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1A54E83BC;
  return AsyncCombineLatest4Sequence.Iterator.next()(a1, a2);
}

uint64_t sub_1A5691DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[3] = AssociatedTypeWitness;
  v6[4] = *(void *)(AssociatedTypeWitness - 8);
  v6[5] = swift_task_alloc();
  uint64_t v13 = (void *)swift_task_alloc();
  v6[6] = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_1A556B718;
  return MEMORY[0x1F4187C88](a1, a2, a3, a5, a6);
}

uint64_t AsyncCombineLatest4Sequence.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v35 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v34 = v5;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v31 = *(void *)(a1 + 56);
  uint64_t v32 = v6;
  uint64_t v36 = v5;
  uint64_t v37 = v33;
  uint64_t v38 = v6;
  uint64_t v39 = v31;
  uint64_t v7 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v29 = *(void *)(a1 + 40);
  uint64_t v30 = v8;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v27 = *(void *)(a1 + 72);
  uint64_t v28 = v9;
  uint64_t v10 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v36 = v7;
  uint64_t v37 = v10;
  uint64_t v38 = WitnessTable;
  uint64_t v39 = v25;
  uint64_t v24 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t v11 = *(void *)(v24 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v24);
  uint64_t v14 = (char *)&v24 - v13;
  uint64_t v15 = *(void *)(v10 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v12);
  uint64_t v18 = (char *)&v24 - v17;
  uint64_t v19 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v24 - v20;
  combineLatest<A, B>(_:_:)(v3, v3 + *(int *)(a1 + 84), v34, v33, (uint64_t)&v24 - v20);
  combineLatest<A, B>(_:_:)(v3 + *(int *)(a1 + 88), v3 + *(int *)(a1 + 92), v30, v29, (uint64_t)v18);
  combineLatest<A, B>(_:_:)((uint64_t)v21, (uint64_t)v18, v7, v10, (uint64_t)v14);
  uint64_t v22 = v24;
  AsyncCombineLatest2Sequence.makeAsyncIterator()(v24, &v36);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v22);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v10);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v7);
  *uint64_t v35 = v36;
  return result;
}

uint64_t sub_1A56921D4()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();

  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1A5692278()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A5692294@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  AsyncCombineLatest4Sequence.makeAsyncIterator()(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);

  return v4(v2, a1);
}

uint64_t sub_1A56922F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 80);
}

uint64_t sub_1A56922FC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_1A569244C(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = (v5 + v7) & ~v7;
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v11 = *(void *)(a3[4] - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v10 + v12;
  uint64_t v14 = (v10 + v12 + v9) & ~v12;
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v16 = *(void *)(a3[5] - 8);
  uint64_t v17 = *(_DWORD *)(v16 + 80);
  uint64_t v18 = v15 + v17;
  unint64_t v19 = ((v15 + v17 + v14) & ~v17) + *(void *)(v16 + 64);
  uint64_t v20 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v11 + 80) | *(unsigned char *)(v16 + 80));
  if (v20 <= 7
    && v19 <= 0x18
    && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v11 + 80) | *(_DWORD *)(v16 + 80)) & 0x100000) == 0)
  {
    uint64_t v25 = ~v7;
    uint64_t v26 = ~v12;
    uint64_t v35 = a3[4];
    uint64_t v36 = ~v17;
    uint64_t v34 = a3[3];
    uint64_t v37 = a3[5];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    uint64_t v38 = a1;
    unint64_t v28 = ((unint64_t)a1 + v8) & v25;
    unint64_t v29 = ((unint64_t)a2 + v8) & v25;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v28, v29, v34);
    uint64_t v30 = v28 + v13;
    uint64_t v24 = v38;
    uint64_t v31 = v30 & v26;
    unint64_t v32 = (v29 + v13) & v26;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v11 + 16))(v30 & v26, v32, v35);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))((v31 + v18) & v36, (v32 + v18) & v36, v37);
  }
  else
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    uint64_t v24 = (uint64_t *)(v23 + ((v20 + 16) & ~v20));
    swift_retain();
  }
  return v24;
}

uint64_t sub_1A56926EC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(a2[5] - 8);
  uint64_t v14 = *(uint64_t (**)(unint64_t))(v13 + 8);
  unint64_t v15 = (v12 + *(void *)(v11 + 56) + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);

  return v14(v15);
}

uint64_t sub_1A5692818(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(a3[5] - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 16))((*(void *)(v15 + 48) + *(unsigned __int8 *)(v20 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (*(void *)(v15 + 48) + *(unsigned __int8 *)(v20 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_1A5692968(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(a3[5] - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 24))((*(void *)(v15 + 40) + *(unsigned __int8 *)(v20 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (*(void *)(v15 + 40) + *(unsigned __int8 *)(v20 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_1A5692AB8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(a3[5] - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 32))((*(void *)(v15 + 32) + *(unsigned __int8 *)(v20 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (*(void *)(v15 + 32) + *(unsigned __int8 *)(v20 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_1A5692C08(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(a3[5] - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 40))((*(void *)(v15 + 24) + *(unsigned __int8 *)(v20 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (*(void *)(v15 + 24) + *(unsigned __int8 *)(v20 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_1A5692D58(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v5 = *(void *)(a3[2] - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t v7 = *(void *)(a3[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6) {
    unsigned int v9 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = *(void *)(a3[4] - 8);
  unsigned int v12 = *(_DWORD *)(v11 + 84);
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12 <= v9) {
    unsigned int v14 = v9;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v15 = *(unsigned int *)(v13 + 84);
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = *(void *)(*(void *)(a3[4] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v21 = *(void *)(v13 + 64);
  if (v15 <= v14) {
    unsigned int v22 = v14;
  }
  else {
    unsigned int v22 = *(_DWORD *)(v13 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v23 = *(void *)(*(void *)(a3[2] - 8) + 64) + v16;
  int v24 = a2 - v22;
  if (a2 <= v22) {
    goto LABEL_30;
  }
  uint64_t v25 = ((v19 + v20 + ((v17 + v18 + (v23 & ~v16)) & ~v18)) & ~v20) + v21;
  char v26 = 8 * v25;
  if (v25 <= 3)
  {
    unsigned int v28 = ((v24 + ~(-1 << v26)) >> v26) + 1;
    if (HIWORD(v28))
    {
      int v27 = *(_DWORD *)((char *)a1 + v25);
      if (!v27) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v28 > 0xFF)
    {
      int v27 = *(unsigned __int16 *)((char *)a1 + v25);
      if (!*(unsigned __int16 *)((char *)a1 + v25)) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v28 < 2)
    {
LABEL_30:
      if (v22)
      {
        if (v6 == v22)
        {
          unint64_t v32 = *(uint64_t (**)(void))(v5 + 48);
          return v32();
        }
        else
        {
          unint64_t v34 = ((unint64_t)a1 + v23) & ~v16;
          if (v8 == v22)
          {
            uint64_t v35 = *(uint64_t (**)(unint64_t))(v7 + 48);
            return v35(v34);
          }
          else
          {
            unint64_t v36 = (v34 + v17 + v18) & ~v18;
            if (v12 == v22)
            {
              uint64_t v37 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v11 + 48);
              uint64_t v38 = *(unsigned int *)(v11 + 84);
              uint64_t v39 = a3[4];
            }
            else
            {
              unint64_t v36 = (v36 + v19 + v20) & ~v20;
              uint64_t v37 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
              uint64_t v38 = v15;
              uint64_t v39 = a3[5];
            }
            return v37(v36, v38, v39);
          }
        }
      }
      return 0;
    }
  }
  int v27 = *((unsigned __int8 *)a1 + v25);
  if (!*((unsigned char *)a1 + v25)) {
    goto LABEL_30;
  }
LABEL_20:
  int v29 = (v27 - 1) << v26;
  if (v25 > 3) {
    int v29 = 0;
  }
  if (v25)
  {
    if (v25 <= 3) {
      int v30 = ((v19 + v20 + ((v17 + v18 + (v23 & ~v16)) & ~v18)) & ~v20) + v21;
    }
    else {
      int v30 = 4;
    }
    switch(v30)
    {
      case 2:
        int v31 = *a1;
        break;
      case 3:
        int v31 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v31 = *(_DWORD *)a1;
        break;
      default:
        int v31 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v31 = 0;
  }
  return v22 + (v31 | v29) + 1;
}

void sub_1A5693118(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v6 = *(void *)(a4[2] - 8);
  uint64_t v7 = a4[4];
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = *(void *)(a4[3] - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8) {
    unsigned int v11 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(void *)(v7 - 8);
  unsigned int v13 = *(_DWORD *)(v12 + 84);
  if (v13 <= v11) {
    unsigned int v14 = v11;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v15 = a4[5];
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(*(void *)(a4[2] - 8) + 64);
  uint64_t v18 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = *(void *)(*(void *)(a4[3] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v16 + 80);
  if (*(_DWORD *)(v16 + 84) <= v14) {
    unsigned int v23 = v14;
  }
  else {
    unsigned int v23 = *(_DWORD *)(v16 + 84);
  }
  uint64_t v24 = v17 + v18;
  size_t v25 = ((v21 + v22 + ((v19 + v20 + ((v17 + v18) & ~v18)) & ~v20)) & ~v22) + *(void *)(*(void *)(v15 - 8) + 64);
  BOOL v26 = a3 >= v23;
  unsigned int v27 = a3 - v23;
  if (v27 != 0 && v26)
  {
    if (v25 <= 3)
    {
      unsigned int v31 = ((v27 + ~(-1 << (8 * v25))) >> (8 * v25)) + 1;
      if (HIWORD(v31))
      {
        int v28 = 4;
      }
      else if (v31 >= 0x100)
      {
        int v28 = 2;
      }
      else
      {
        int v28 = v31 > 1;
      }
    }
    else
    {
      int v28 = 1;
    }
  }
  else
  {
    int v28 = 0;
  }
  if (v23 < a2)
  {
    unsigned int v29 = ~v23 + a2;
    if (v25 < 4)
    {
      int v30 = (v29 >> (8 * v25)) + 1;
      if (v25)
      {
        int v32 = v29 & ~(-1 << (8 * v25));
        bzero(a1, v25);
        if (v25 == 3)
        {
          *(_WORD *)a1 = v32;
          a1[2] = BYTE2(v32);
        }
        else if (v25 == 2)
        {
          *(_WORD *)a1 = v32;
        }
        else
        {
          *a1 = v32;
        }
      }
    }
    else
    {
      bzero(a1, v25);
      *(_DWORD *)a1 = v29;
      int v30 = 1;
    }
    switch(v28)
    {
      case 1:
        a1[v25] = v30;
        return;
      case 2:
        *(_WORD *)&a1[v25] = v30;
        return;
      case 3:
        goto LABEL_55;
      case 4:
        *(_DWORD *)&a1[v25] = v30;
        return;
      default:
        return;
    }
  }
  switch(v28)
  {
    case 1:
      a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_55:
      __break(1u);
      JUMPOUT(0x1A5693578);
    case 4:
      *(_DWORD *)&a1[v25] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        if (v8 == v23)
        {
          uint64_t v33 = *(void (**)(char *))(v6 + 56);
          unint64_t v34 = a1;
        }
        else
        {
          unint64_t v34 = (char *)((unint64_t)&a1[v24] & ~v18);
          if (v10 == v23)
          {
            uint64_t v33 = *(void (**)(char *))(v9 + 56);
          }
          else
          {
            unint64_t v34 = (char *)((unint64_t)&v34[v19 + v20] & ~v20);
            if (v13 == v23)
            {
              uint64_t v33 = *(void (**)(char *))(v12 + 56);
            }
            else
            {
              unint64_t v34 = (char *)((unint64_t)&v34[v21 + v22] & ~v22);
              uint64_t v33 = *(void (**)(char *))(v16 + 56);
            }
          }
        }
        v33(v34);
      }
      return;
  }
}

uint64_t type metadata accessor for AsyncCombineLatest4Sequence()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for AsyncCombineLatest4Sequence.Iterator()
{
  return swift_getGenericMetadata();
}

id _SFXPCError.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_1A5698FB8(a1);

  return v4;
}

void sub_1A5693614(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = sub_1A56D4A68();
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t))(a6 + 16))(a6);
}

uint64_t sub_1A56936A0()
{
  uint64_t v0 = sub_1A56D4D98();
  __swift_allocate_value_buffer(v0, qword_1E966C810);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E966C810);
  if (qword_1EB3DB9F8[0] != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EB3DC850);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t SFXPCListener.connections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SFXPCListener.containerRegistry.getter()
{
  return swift_retain();
}

uint64_t SFXPCListener.containerRegistry.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + qword_1E96754E0);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*SFXPCListener.containerRegistry.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1A56938B0@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  id v3 = (uint64_t *)(*a1 + qword_1E96754E8);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1A569A854;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_1A5572C20(v4);
}

uint64_t sub_1A5693950(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1A569A85C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + qword_1E96754E8);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1A5572C20(v3);
  return sub_1A54F5EA8(v8);
}

uint64_t SFXPCListener.didAddConnectionHandler.getter()
{
  return sub_1A5693DBC(&qword_1E96754E8, (void (*)(void, void))sub_1A5572C20);
}

uint64_t SFXPCListener.didAddConnectionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_1A5693E44(a1, a2, &qword_1E96754E8, (uint64_t (*)(uint64_t, uint64_t))sub_1A54F5EA8);
}

uint64_t (*SFXPCListener.didAddConnectionHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1A5693AB4@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + qword_1E96754F0);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1A569A770;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_1A5572C20(v4);
}

uint64_t sub_1A5693B54(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1A569A748;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + qword_1E96754F0);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1A5572C20(v3);
  return sub_1A54F5EA8(v8);
}

uint64_t SFXPCListener.didRemoveConnectionHandler.getter()
{
  return sub_1A5693DBC(&qword_1E96754F0, (void (*)(void, void))sub_1A5572C20);
}

uint64_t SFXPCListener.didRemoveConnectionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_1A5693E44(a1, a2, &qword_1E96754F0, (uint64_t (*)(uint64_t, uint64_t))sub_1A54F5EA8);
}

uint64_t (*SFXPCListener.didRemoveConnectionHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1A5693CB8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + qword_1E96754F8);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3) {
    uint64_t v5 = v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = v4;
  a2[1] = v5;
  return sub_1A5572C20(v4);
}

uint64_t sub_1A5693D18(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (*a1) {
    uint64_t v3 = a1[1];
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (uint64_t *)(*a2 + qword_1E96754F8);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = v2;
  v4[1] = v3;
  sub_1A5572C20(v2);
  return sub_1A54F5EA8(v5);
}

uint64_t SFXPCListener.contextProvider.getter()
{
  return sub_1A5693DBC(&qword_1E96754F8, (void (*)(void, void))sub_1A5615B24);
}

uint64_t sub_1A5693DBC(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t SFXPCListener.contextProvider.setter(uint64_t a1, uint64_t a2)
{
  return sub_1A5693E44(a1, a2, &qword_1E96754F8, (uint64_t (*)(uint64_t, uint64_t))sub_1A5615B28);
}

uint64_t sub_1A5693E44(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*SFXPCListener.contextProvider.modify())()
{
  return j__swift_endAccess;
}

id static SFXPCListener.service(queue:)(void *a1)
{
  return sub_1A5693F60(a1, (SEL *)&selRef_serviceListener);
}

id SFXPCListener.__allocating_init(takingOver:queue:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SFXPCListener.init(takingOver:queue:)(a1, a2);
}

id static SFXPCListener.anonymous(queue:)(void *a1)
{
  return sub_1A5693F60(a1, (SEL *)&selRef_anonymousListener);
}

id sub_1A5693F60(void *a1, SEL *a2)
{
  id v4 = [self *a2];
  id v5 = a1;
  id v6 = objc_allocWithZone(v2);
  return SFXPCListener.init(takingOver:queue:)(v4, v5);
}

id SFXPCListener.init(takingOver:queue:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[qword_1E96754E0] = 0;
  uint64_t v7 = &v3[qword_1E96754E8];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v3[qword_1E96754F0];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v3[qword_1E96754F8];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = v3;
  objc_msgSend(a1, sel_sf_setQueue_, a2);
  *(void *)&v10[qword_1E9675500] = a1;
  type metadata accessor for SFXPCListener.ClientConnection();
  id v11 = a1;
  *(void *)&v10[qword_1E96754D8] = sub_1A56D5398();
  *(void *)&v10[qword_1E9675508] = a2;
  id v12 = a2;

  v15.receiver = v10;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  objc_msgSend(v11, sel_setDelegate_, v13);

  return v13;
}

id SFXPCListener.__allocating_init(machServiceName:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = objc_allocWithZone(MEMORY[0x1E4F29290]);
  id v6 = (void *)sub_1A56D5098();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithMachServiceName_, v6);

  id v8 = objc_allocWithZone(v3);
  return SFXPCListener.init(takingOver:queue:)(v7, a3);
}

Swift::Void __swiftcall SFXPCListener.resume()()
{
  objc_msgSend(*(id *)(v0 + qword_1E9675500), sel_activate);
}

Swift::Void __swiftcall SFXPCListener.suspend()()
{
  objc_msgSend(*(id *)(v0 + qword_1E9675500), sel_suspend);
}

Swift::Void __swiftcall SFXPCListener.invalidate()()
{
  objc_msgSend(*(id *)(v0 + qword_1E9675500), sel_invalidate);
}

id SFXPCListener.endpoint.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + qword_1E9675500), sel_endpoint);

  return v1;
}

Swift::Bool __swiftcall SFXPCListener.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_1A56996F0(shouldAcceptNewConnection.super.isa);
}

id SFXPCListener.ClientConnection.__allocating_init(connection:clientIdentity:containerRegistry:contextProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return SFXPCListener.ClientConnection.init(connection:clientIdentity:containerRegistry:contextProvider:)(a1, a2, a3, a4, a5);
}

uint64_t sub_1A56942B0(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  id v4 = (void **)(a1 + qword_1E96754D8);
  swift_beginAccess();
  uint64_t v10 = *v4;
  sub_1A56D53D8();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_1A56D5758();
  if (v9 != 1)
  {
    swift_beginAccess();
    sub_1A56D53C8();
    swift_endAccess();
  }
  id v5 = (void (**)(uint64_t))(a1 + qword_1E96754F0);
  uint64_t result = swift_beginAccess();
  id v7 = *v5;
  if (*v5)
  {
    uint64_t v8 = a2 + qword_1E96A7EC8;
    swift_retain();
    v7(v8);
    return sub_1A54F5EA8((uint64_t)v7);
  }
  return result;
}

uint64_t sub_1A5694428(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  char v9 = sub_1A56996F0(v7);

  return v9 & 1;
}

uint64_t SFXPCListener.init()()
{
  return sub_1A56967D0((uint64_t (*)(void))sub_1A5699C3C);
}

uint64_t sub_1A56944A0(void *a1, uint64_t a2)
{
  return sub_1A5696818(a1, a2, (uint64_t (*)(void))sub_1A5699C3C);
}

uint64_t sub_1A56944BC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1A54F5EA8(*(void *)(a1 + qword_1E96754E8));
  sub_1A54F5EA8(*(void *)(a1 + qword_1E96754F0));
  uint64_t v2 = *(void *)(a1 + qword_1E96754F8);

  return sub_1A54F5EA8(v2);
}

uint64_t SFXPCListener.ClientConnection.clientIdentity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A5681B28(v1 + qword_1E96A7EC8, a1);
}

id SFXPCListener.ClientConnection.init(connection:clientIdentity:containerRegistry:contextProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v5[qword_1E96A7ED8] = a1;
  sub_1A5681B28(a2, (uint64_t)&v5[qword_1E96A7EC8]);
  id v12 = &v5[qword_1E96A7EE0];
  *(void *)id v12 = a4;
  *((void *)v12 + 1) = a5;
  *(void *)&v5[qword_1E96A7EE8] = a3;
  v15.receiver = v5;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  sub_1A5681BF0(a2);
  return v13;
}

Swift::Void __swiftcall SFXPCListener.ClientConnection.activate()()
{
  objc_msgSend(*(id *)(*(void *)(v0 + qword_1E96A7ED8) + 16), sel_activate);
}

uint64_t SFXPCListener.ClientConnection.invoke(_:parametersData:parametersAsyncSequenceContainer:parametersBlocksContainer:sync:completion:)(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(void, unint64_t, void, void, id), uint64_t a8)
{
  v157 = a7;
  LODWORD(v153) = a6;
  uint64_t v138 = a5;
  uint64_t v139 = a4;
  unint64_t v142 = a3;
  uint64_t v141 = a2;
  uint64_t v11 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v8) + 0x50);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](a1);
  objc_super v15 = (char *)&v131 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v131 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB820);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v154 = (uint64_t)&v131 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_1A56D4CB8();
  uint64_t v149 = *(void *)(v150 - 8);
  uint64_t v20 = *(void *)(v149 + 64);
  uint64_t v21 = MEMORY[0x1F4188790](v150);
  v146 = (char *)&v131 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  v156 = (char *)&v131 - v22;
  uint64_t v151 = type metadata accessor for SFClientIdentity();
  uint64_t v135 = *(void *)(v151 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v151);
  size_t v25 = (char *)&v131 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x1F4188790](v23);
  uint64_t v140 = (uint64_t)&v131 - v27;
  uint64_t v136 = v28;
  MEMORY[0x1F4188790](v26);
  int v30 = (char *)&v131 - v29;
  v158 = v8;
  sub_1A5681B28((uint64_t)v8 + qword_1E96A7EC8, (uint64_t)&v131 - v29);
  id v147 = a1;
  unint64_t v31 = *(void *)&a1[OBJC_IVAR___SFXPCInvocation_name + 8];
  if (!v31)
  {
    if (qword_1E966C830 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_1A56D4D98();
    __swift_project_value_buffer(v41, (uint64_t)qword_1E966C810);
    sub_1A5681B28((uint64_t)v30, (uint64_t)v25);
    id v42 = v147;
    uint64_t v43 = sub_1A56D4D78();
    os_log_type_t v44 = sub_1A56D57C8();
    BOOL v45 = os_log_type_enabled(v43, v44);
    long long v46 = v157;
    if (v45)
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v48 = (void (*)(void))swift_slowAlloc();
      uint64_t v148 = a8;
      uint64_t v49 = v48;
      v162 = (void (*)(char *))v48;
      *(_DWORD *)uint64_t v47 = 136315394;
      uint64_t v50 = SFClientIdentity.shortDescription.getter();
      v155 = v30;
      v160[0] = sub_1A54E3290(v50, v51, (uint64_t *)&v162);
      sub_1A56D5928();
      swift_bridgeObjectRelease();
      sub_1A5681BF0((uint64_t)v25);
      *(_WORD *)(v47 + 12) = 2082;
      id v52 = v42;
      id v53 = objc_msgSend(v52, sel_description);
      uint64_t v54 = sub_1A56D50D8();
      unint64_t v56 = v55;

      long long v46 = v157;
      uint64_t v57 = v54;
      int v30 = v155;
      v160[0] = sub_1A54E3290(v57, v56, (uint64_t *)&v162);
      sub_1A56D5928();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A5389000, v43, v44, "invocable has no name -- Daemon {client: %s, invocable: %{public}s}", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1A626CE20](v49, -1, -1);
      MEMORY[0x1A626CE20](v47, -1, -1);
    }
    else
    {
      sub_1A5681BF0((uint64_t)v25);
    }
    sub_1A54F38F4();
    uint64_t v84 = (void *)swift_allocError();
    uint64_t v86 = v85;
    *(_OWORD *)uint64_t v85 = xmmword_1A56FFE20;
    *(void *)(v85 + 16) = 0xD00000000000004FLL;
    *(void *)(v85 + 24) = 0x80000001A573CD10;
    *(void *)(v85 + 32) = 260;
    *(_OWORD *)(v85 + 40) = 0u;
    *(_OWORD *)(v85 + 56) = 0u;
    *(void *)(v85 + 72) = 0;
    *(void *)(v85 + 80) = 0x2000000000000000;
    uint64_t v87 = (objc_class *)type metadata accessor for _SFXPCError();
    *(void *)(v86 + 88) = 0;
    *(void *)(v86 + 96) = 0;
    id v88 = objc_allocWithZone(v87);
    id v89 = sub_1A5698FB8(v84);

    v46(0, 0xF000000000000000, 0, 0, v89);
    uint64_t v90 = (uint64_t)v30;
    return sub_1A5681BF0(v90);
  }
  v134 = v17;
  uint64_t v133 = v12;
  uint64_t v145 = v11;
  v162 = *(void (**)(char *))&a1[OBJC_IVAR___SFXPCInvocation_name];
  unint64_t v163 = v31;
  swift_bridgeObjectRetain();
  sub_1A56D51C8();
  v155 = v30;
  SFClientIdentity.shortDescription.getter();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  uint64_t v32 = (uint64_t)v162;
  unint64_t v33 = v163;
  if (qword_1E966C830 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_1A56D4D98();
  uint64_t v35 = __swift_project_value_buffer(v34, (uint64_t)qword_1E966C810);
  swift_bridgeObjectRetain_n();
  uint64_t v143 = v35;
  unint64_t v36 = sub_1A56D4D78();
  os_log_type_t v37 = sub_1A56D57D8();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v152 = v32;
  uint64_t v148 = a8;
  if (v38)
  {
    uint64_t v39 = swift_slowAlloc();
    long long v40 = (void (*)(char *))swift_slowAlloc();
    v162 = v40;
    *(_DWORD *)uint64_t v39 = 136446466;
    swift_bridgeObjectRetain();
    v160[0] = sub_1A54E3290(v32, v33, (uint64_t *)&v162);
    sub_1A56D5928();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 12) = 1024;
    LODWORD(v160[0]) = v153 & 1;
    uint64_t v32 = v152;
    sub_1A56D5928();
    _os_log_impl(&dword_1A5389000, v36, v37, "Invocation [%{public}s] START -- Daemon {sync: %{BOOL}d}", (uint8_t *)v39, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v40, -1, -1);
    MEMORY[0x1A626CE20](v39, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v132 = v15;
  uint64_t v58 = *(void *)((char *)v158 + qword_1E96A7EE8);
  Class v144 = (Class)type metadata accessor for _SFXPCAsyncSequenceContainer(0);
  id v59 = objc_allocWithZone(v144);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v60 = (char *)v59;
  uint64_t v61 = v156;
  sub_1A56D4CA8();
  uint64_t v62 = v149;
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v149 + 16);
  uint64_t v64 = v33;
  uint64_t v65 = v150;
  v63(&v60[OBJC_IVAR____SFXPCAsyncSequenceContainer_uuid], v61, v150);
  uint64_t v66 = (uint64_t *)&v60[OBJC_IVAR____SFXPCAsyncSequenceContainer_name];
  uint64_t *v66 = v32;
  v66[1] = v64;
  swift_bridgeObjectRetain();
  *(void *)&v60[OBJC_IVAR____SFXPCAsyncSequenceContainer_sequences] = sub_1A54F05D8(MEMORY[0x1E4FBC860]);
  *(void *)&v60[OBJC_IVAR____SFXPCAsyncSequenceContainer_containerRegistry] = v58;
  swift_retain();

  if (v58)
  {
    uint64_t v67 = sub_1A56D5478();
    uint64_t v68 = v61;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v154, 1, 1, v67);
    long long v69 = v146;
    v63(v146, v68, v65);
    unint64_t v70 = (*(unsigned __int8 *)(v62 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
    unint64_t v71 = (v20 + v70 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v72 = (void *)swift_allocObject();
    v72[2] = 0;
    v72[3] = 0;
    v72[4] = v58;
    uint64_t v73 = (char *)v72 + v70;
    uint64_t v32 = v152;
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v73, v69, v65);
    uint64_t v74 = (void *)((char *)v72 + v71);
    *uint64_t v74 = v32;
    v74[1] = v64;
    swift_retain_n();
    swift_bridgeObjectRetain();
    sub_1A54EB08C(v154, (uint64_t)&unk_1E9670AD8, (uint64_t)v72);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v156, v65);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v65);
    swift_bridgeObjectRelease();
  }
  unint64_t v75 = v64;
  v166.receiver = v60;
  v166.super_class = v144;
  uint64_t v76 = (char *)objc_msgSendSuper2(&v166, sel_init);
  swift_release();
  id v77 = objc_allocWithZone((Class)type metadata accessor for _SFXPCBlockContainer());
  swift_bridgeObjectRetain();
  swift_retain();
  id v78 = sub_1A54F443C(v32, v64, v58);
  swift_release();
  uint64_t v79 = *(void *)((char *)v158 + qword_1E96A7EE0);
  if (v79) {
    uint64_t v80 = *(void *)((char *)v158 + qword_1E96A7EE0 + 8);
  }
  else {
    uint64_t v80 = 0;
  }
  v160[0] = *(void *)((char *)v158 + qword_1E96A7EE0);
  v160[1] = v80;
  sub_1A5572C20(v79);
  uint64_t v81 = v145;
  swift_getFunctionTypeMetadata1();
  uint64_t v82 = sub_1A56D5898();
  Optional.tryUnwrap(_:file:line:)(0xD000000000000010, 0x80000001A573CD60, 0xD00000000000004FLL, 0x80000001A573CD10, 269, v82, (uint64_t)&v162);
  sub_1A54F5EA8(v79);
  v83 = (void *)v163;
  v162(v155);
  v158 = v83;
  if ((v153 & 1) == 0)
  {
    uint64_t v93 = sub_1A56D5478();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v154, 1, 1, v93);
    uint64_t v94 = v133;
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v132, v134, v81);
    sub_1A5681B28((uint64_t)v155, v140);
    unint64_t v95 = (*(unsigned __int8 *)(v94 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
    unint64_t v96 = (v137 + *(unsigned __int8 *)(v135 + 80) + v95) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80);
    v156 = (char *)((v136 + v96 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v153 = (unint64_t)(v156 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v97 = (v153 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v98 = v81;
    unint64_t v99 = (v97 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v100 = v76;
    unint64_t v101 = (v99 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v151 = (uint64_t)v78;
    uint64_t v102 = swift_allocObject();
    *(void *)(v102 + 16) = 0;
    *(void *)(v102 + 24) = 0;
    uint64_t v103 = v98;
    *(void *)(v102 + 32) = v98;
    id v104 = v147;
    uint64_t v105 = v141;
    *(void *)(v102 + 40) = v147;
    *(void *)(v102 + 48) = v105;
    *(void *)(v102 + 56) = v142;
    (*(void (**)(unint64_t, char *, uint64_t))(v133 + 32))(v102 + v95, v132, v103);
    sub_1A5681B8C(v140, v102 + v96);
    *(void *)&v156[v102] = v139;
    *(void *)(v102 + v153) = v138;
    *(void *)(v102 + v97) = v100;
    uint64_t v106 = (void *)v151;
    *(void *)(v102 + v99) = v151;
    uint64_t v107 = (void *)(v102 + v101);
    *uint64_t v107 = v152;
    v107[1] = v75;
    uint64_t v108 = (void *)(v102 + ((v101 + 23) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v109 = v148;
    *uint64_t v108 = v157;
    v108[1] = v109;
    id v110 = v104;
    uint64_t v111 = v100;
    id v112 = v106;
    sub_1A54E9E98(v141, v142);
    swift_unknownObjectRetain();
    swift_retain();
    swift_unknownObjectRetain();
    sub_1A54EB08C(v154, (uint64_t)&unk_1E9675520, v102);

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v133 + 8))(v134, v145);
    uint64_t v90 = (uint64_t)v155;
    return sub_1A5681BF0(v90);
  }
  uint64_t v161 = type metadata accessor for SFXPCInvocation();
  v160[0] = (uint64_t)v147;
  id v92 = v147;
  sub_1A54EBD1C((uint64_t)v160, 0, 0, 0xD00000000000004FLL, 0x80000001A573CD10, 272, (uint64_t)&v162);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v160);
  uint64_t v113 = v164;
  uint64_t v114 = v165;
  __swift_project_boxed_opaque_existential_1(&v162, v164);
  uint64_t v161 = v81;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v160);
  (*(void (**)(uint64_t *, char *, uint64_t))(v133 + 16))(boxed_opaque_existential_0, v134, v81);
  uint64_t v116 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, char *, uint64_t, uint64_t, char *, id, uint64_t, uint64_t))(v114 + 8))(v141, v142, v160, v155, v139, v138, v76, v78, v113, v114);
  unint64_t v118 = v117;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v160);
  sub_1A54E9E98(v116, v118);
  swift_bridgeObjectRetain();
  sub_1A54E9E98(v116, v118);
  v119 = sub_1A56D4D78();
  os_log_type_t v120 = sub_1A56D57D8();
  if (os_log_type_enabled(v119, v120))
  {
    uint64_t v122 = swift_slowAlloc();
    uint64_t v154 = swift_slowAlloc();
    v160[0] = v154;
    *(_DWORD *)uint64_t v122 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v159 = sub_1A54E3290(v152, v75, v160);
    v156 = v76;
    sub_1A56D5928();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v122 + 12) = 2080;
    sub_1A54E9E98(v116, v118);
    uint64_t v123 = sub_1A56D4A48();
    id v124 = v78;
    unint64_t v126 = v125;
    sub_1A54EA09C(v116, v118);
    uint64_t v159 = sub_1A54E3290(v123, v126, v160);
    uint64_t v76 = v156;
    uint64_t v81 = v145;
    sub_1A56D5928();
    id v78 = v124;
    swift_bridgeObjectRelease();
    sub_1A54EA09C(v116, v118);
    sub_1A54EA09C(v116, v118);
    _os_log_impl(&dword_1A5389000, v119, v120, "Invocation [%{public}s] END -- Daemon {responseData: %s, sync: true}", (uint8_t *)v122, 0x16u);
    uint64_t v127 = v154;
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v127, -1, -1);
    MEMORY[0x1A626CE20](v122, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A54EA09C(v116, v118);
    sub_1A54EA09C(v116, v118);
  }

  v128 = (void (*)(uint64_t, unint64_t, char *, id, void))v157;
  sub_1A54E9E98(v116, v118);
  v129 = v76;
  id v130 = v78;
  v128(v116, v118, v76, v78, 0);

  swift_release();
  sub_1A54EA09C(v116, v118);
  sub_1A54EA09C(v116, v118);

  (*(void (**)(char *, uint64_t))(v133 + 8))(v134, v81);
  sub_1A5681BF0((uint64_t)v155);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v162);
}

uint64_t sub_1A5695AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 288) = v14;
  *(_OWORD *)(v8 + 256) = v12;
  *(_OWORD *)(v8 + 272) = v13;
  *(_OWORD *)(v8 + 224) = v10;
  *(_OWORD *)(v8 + 240) = v11;
  *(void *)(v8 + 208) = a7;
  *(void *)(v8 + 216) = a8;
  *(void *)(v8 + 192) = a5;
  *(void *)(v8 + 200) = a6;
  *(void *)(v8 + 184) = a4;
  return MEMORY[0x1F4188298](sub_1A5695B0C, 0, 0);
}

void sub_1A5695B0C()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = type metadata accessor for SFXPCInvocation();
  v0[7] = v1;
  v0[10] = v2;
  id v3 = v1;
  sub_1A54EBE8C((uint64_t)(v0 + 7), 0, 0, 0xD00000000000004FLL, 0x80000001A573CD10, 285, (uint64_t)(v0 + 2));
  uint64_t v4 = v0[36];
  uint64_t v5 = v0[26];
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 7));
  uint64_t v6 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v0[14] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, v5, v4);
  uint64_t v9 = *(void *)(v6 + 8) + **(int **)(v6 + 8);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[37] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1A5695F88;
  __asm { BRAA            X9, X16 }
}

uint64_t sub_1A5695F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[38] = a1;
  v4[39] = a2;
  v4[40] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = sub_1A56963A4;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v4 + 11));
    uint64_t v5 = sub_1A56960A8;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1A56960A8()
{
  uint64_t v24 = v0;
  if (qword_1E966C830 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[38];
  unint64_t v2 = v0[39];
  uint64_t v3 = sub_1A56D4D98();
  __swift_project_value_buffer(v3, (uint64_t)qword_1E966C810);
  swift_bridgeObjectRetain();
  sub_1A54E9E98(v1, v2);
  swift_bridgeObjectRetain();
  sub_1A54E9E98(v1, v2);
  uint64_t v4 = sub_1A56D4D78();
  os_log_type_t v5 = sub_1A56D57D8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v8 = v0[38];
  unint64_t v7 = v0[39];
  unint64_t v9 = v0[33];
  if (v6)
  {
    uint64_t v10 = v0[32];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v11 = 136446466;
    swift_bridgeObjectRetain();
    v0[21] = sub_1A54E3290(v10, v9, &v23);
    sub_1A56D5928();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    sub_1A54E9E98(v8, v7);
    uint64_t v12 = sub_1A56D4A48();
    unint64_t v14 = v13;
    sub_1A54EA09C(v8, v7);
    v0[22] = sub_1A54E3290(v12, v14, &v23);
    sub_1A56D5928();
    swift_bridgeObjectRelease();
    sub_1A54EA09C(v8, v7);
    sub_1A54EA09C(v8, v7);
    _os_log_impl(&dword_1A5389000, v4, v5, "Invocation [%{public}s] END -- Daemon {responseData: %s, sync: false}", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v22, -1, -1);
    MEMORY[0x1A626CE20](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A54EA09C(v8, v7);
    sub_1A54EA09C(v8, v7);
  }

  uint64_t v16 = v0[38];
  unint64_t v15 = v0[39];
  uint64_t v17 = (void (*)(uint64_t, unint64_t, uint64_t, uint64_t, void))v0[34];
  uint64_t v19 = v0[30];
  uint64_t v18 = v0[31];
  sub_1A54E9E98(v16, v15);
  v17(v16, v15, v19, v18, 0);
  sub_1A54EA09C(v16, v15);
  sub_1A54EA09C(v16, v15);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_1A56963A4()
{
  uint64_t v21 = v0;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 11));
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  uint64_t v1 = (void *)v0[40];
  if (qword_1E966C830 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A56D4D98();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E966C810);
  swift_bridgeObjectRetain();
  id v3 = v1;
  swift_bridgeObjectRetain();
  id v4 = v1;
  os_log_type_t v5 = sub_1A56D4D78();
  os_log_type_t v6 = sub_1A56D57D8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = v0[33];
  if (v7)
  {
    uint64_t v9 = v0[32];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    swift_bridgeObjectRetain();
    v0[20] = sub_1A54E3290(v9, v8, &v20);
    sub_1A56D5928();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v12 = sub_1A56D6018();
    v0[19] = sub_1A54E3290(v12, v13, &v20);
    sub_1A56D5928();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A5389000, v5, v6, "Invocation [%{public}s] FAIL -- Daemon post-async-invocation {error: %{public}s, sync: false}", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v11, -1, -1);
    MEMORY[0x1A626CE20](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  unint64_t v14 = (void (*)(void, unint64_t, void, void, id))v0[34];
  id v15 = objc_allocWithZone((Class)type metadata accessor for _SFXPCError());
  id v16 = v1;
  id v17 = sub_1A5698FB8(v1);

  v14(0, 0xF000000000000000, 0, 0, v17);
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

void sub_1A569668C(void *a1, int a2, void *a3, void *a4, uint64_t a5, uint64_t a6, int a7, void *aBlock)
{
  unint64_t v14 = _Block_copy(aBlock);
  id v15 = a3;
  id v16 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v21 = a1;
  uint64_t v17 = sub_1A56D4A78();
  unint64_t v19 = v18;

  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v14;
  SFXPCListener.ClientConnection.invoke(_:parametersData:parametersAsyncSequenceContainer:parametersBlocksContainer:sync:completion:)(v15, v17, v19, a5, a6, a7, (void (*)(void, unint64_t, void, void, id))sub_1A54F5CE4, v20);
  swift_release();
  sub_1A54EA09C(v17, v19);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t SFXPCListener.ClientConnection.init()()
{
  return sub_1A56967D0((uint64_t (*)(void))sub_1A569A1C4);
}

uint64_t sub_1A56967D0(uint64_t (*a1)(void))
{
  return a1(*(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x50));
}

uint64_t sub_1A5696800(void *a1, uint64_t a2)
{
  return sub_1A5696818(a1, a2, (uint64_t (*)(void))sub_1A569A1C4);
}

uint64_t sub_1A5696818(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(*(void *)((*MEMORY[0x1E4FBC8C8] & *a1) + 0x50));
}

uint64_t sub_1A5696848(uint64_t a1)
{
  sub_1A5681BF0(a1 + qword_1E96A7EC8);
  swift_release();
  sub_1A54F5EA8(*(void *)(a1 + qword_1E96A7EE0));

  return swift_release();
}

uint64_t sub_1A56968B8()
{
  uint64_t result = sub_1A56968E0();
  qword_1EB3DD6F8 = result;
  unk_1EB3DD700 = v1;
  qword_1EB3DD708 = v2;
  unk_1EB3DD710 = v3;
  return result;
}

uint64_t sub_1A56968E0()
{
  uint64_t v0 = self;
  objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_1EFA39920);
  objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_1EFA2F4C8);
  objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_1EFA2F430);
  objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_1EFA2F3A0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB3DCFE0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A56F4E90;
  uint64_t v2 = sub_1A5584030(0, &qword_1EB3DD000);
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DD008);
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = type metadata accessor for SFXPCInvocation();
  *(void *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB3DCFF0);
  *(void *)(v1 + 64) = v3;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  os_log_type_t v5 = (void *)sub_1A56D5348();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_initWithArray_, v5);

  uint64_t result = sub_1A56D5688();
  __break(1u);
  return result;
}

uint64_t _AnySFXPCSyncInvocableProtocol<>.invoke(with:context:client:parametersAsyncSequenceContainer:parametersBlockContainer:responseAsyncSequenceContainer:responseXPCBlockContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v60 = a8;
  id v67 = a7;
  uint64_t v76 = a6;
  uint64_t v70 = a4;
  uint64_t v73 = a3;
  uint64_t v77 = a1;
  uint64_t v78 = a2;
  uint64_t v12 = *(void *)(a11 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v61 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v71 = (char *)v58 - v13;
  uint64_t v69 = a11;
  uint64_t v75 = swift_getAssociatedTypeWitness();
  uint64_t v68 = *(void *)(v75 - 8);
  MEMORY[0x1F4188790](v75);
  uint64_t v74 = (uint64_t)v58 - v14;
  uint64_t v81 = v12;
  uint64_t v85 = a9;
  uint64_t v83 = swift_getAssociatedTypeWitness();
  uint64_t v72 = *(void *)(v83 - 8);
  MEMORY[0x1F4188790](v83);
  uint64_t v82 = (char *)v58 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DC870);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v66 = (char *)v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v65 = (char *)v58 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)v58 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)v58 - v24;
  uint64_t v26 = sub_1A56D5BA8();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  id v59 = (char *)v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x1F4188790](v28);
  uint64_t v64 = (char *)v58 - v31;
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  uint64_t v34 = (char *)v58 - v33;
  MEMORY[0x1F4188790](v32);
  unint64_t v36 = (char *)v58 - v35;
  sub_1A56D4878();
  swift_allocObject();
  uint64_t v37 = sub_1A56D4868();
  uint64_t v63 = "rProtocol>\"24@\"_SFXPCError\"32";
  sub_1A56D5B98();
  uint64_t v84 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t result = v84(v25, 1, v26);
  if (result == 1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
  v80(v36, v25, v26);
  if (a5)
  {
    *((void *)&v88 + 1) = swift_getObjectType();
    *(void *)&long long v87 = a5;
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_unknownObjectRetain();
  uint64_t v89 = v37;
  uint64_t v39 = (void (*)(unsigned char *, void))sub_1A56D4858();
  sub_1A553763C((uint64_t)&v87, (uint64_t)v36);
  v39(v86, 0);
  sub_1A56D5B98();
  uint64_t result = v84(v23, 1, v26);
  if (result == 1) {
    goto LABEL_17;
  }
  v80(v34, v23, v26);
  uint64_t v40 = v76;
  v58[1] = "amework/XPC/SFXPCBlock.swift";
  if (v76)
  {
    *((void *)&v88 + 1) = swift_getObjectType();
    *(void *)&long long v87 = v40;
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  uint64_t v41 = v82;
  swift_unknownObjectRetain();
  id v42 = (void (*)(unsigned char *, void))sub_1A56D4858();
  sub_1A553763C((uint64_t)&v87, (uint64_t)v34);
  v42(v86, 0);
  swift_getAssociatedConformanceWitness();
  uint64_t v43 = v79;
  sub_1A56D4848();
  if (v43)
  {
    swift_release();
    return v26;
  }
  uint64_t v44 = v74;
  tryCast<A>(_:as:description:file:line:)(v73, v75, 0, 0, 0xD00000000000004FLL, 0x80000001A573CD10, 440, v75, v74);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 24))(v41, v44, v70, v85);
  sub_1A56D48B8();
  swift_allocObject();
  uint64_t v45 = sub_1A56D48A8();
  long long v46 = v65;
  sub_1A56D5B98();
  uint64_t v47 = v84;
  uint64_t result = v84(v46, 1, v26);
  if (result == 1) {
    goto LABEL_18;
  }
  uint64_t v48 = (uint64_t)v64;
  uint64_t v49 = v80;
  v80(v64, v46, v26);
  *((void *)&v88 + 1) = type metadata accessor for _SFXPCAsyncSequenceContainer(0);
  *(void *)&long long v87 = v67;
  id v50 = v67;
  uint64_t v79 = v45;
  unint64_t v51 = (void (*)(unsigned char *, void))sub_1A56D4898();
  sub_1A553763C((uint64_t)&v87, v48);
  v51(v86, 0);
  id v52 = v66;
  sub_1A56D5B98();
  uint64_t result = v47(v52, 1, v26);
  if (result != 1)
  {
    uint64_t v53 = (uint64_t)v59;
    v49(v59, v52, v26);
    *((void *)&v88 + 1) = type metadata accessor for _SFXPCBlockContainer();
    *(void *)&long long v87 = v60;
    id v54 = v60;
    unint64_t v55 = (void (*)(unsigned char *, void))sub_1A56D4898();
    sub_1A553763C((uint64_t)&v87, v53);
    v55(v86, 0);
    uint64_t v56 = AssociatedTypeWitness;
    swift_getAssociatedConformanceWitness();
    uint64_t v57 = v71;
    uint64_t v26 = sub_1A56D4888();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v57, v56);
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v74, v75);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v82, v83);
    return v26;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t _AnySFXPCAsyncInvocableProtocol<>.invoke(with:context:client:parametersAsyncSequenceContainer:parametersBlocksContainer:responseAsyncSequenceContainer:responseXPCBlocksContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[27] = v17;
  v9[28] = v8;
  v9[25] = a8;
  v9[26] = v16;
  v9[23] = a6;
  v9[24] = a7;
  v9[21] = a4;
  v9[22] = a5;
  v9[19] = a2;
  v9[20] = a3;
  v9[18] = a1;
  v9[29] = *(void *)(v17 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[30] = AssociatedTypeWitness;
  v9[31] = *(void *)(AssociatedTypeWitness - 8);
  v9[32] = swift_task_alloc();
  uint64_t v11 = swift_getAssociatedTypeWitness();
  v9[33] = v11;
  v9[34] = *(void *)(v11 - 8);
  v9[35] = swift_task_alloc();
  uint64_t v12 = swift_getAssociatedTypeWitness();
  v9[36] = v12;
  v9[37] = *(void *)(v12 - 8);
  v9[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DC870);
  v9[39] = swift_task_alloc();
  v9[40] = swift_task_alloc();
  v9[41] = swift_task_alloc();
  v9[42] = swift_task_alloc();
  uint64_t v13 = sub_1A56D5BA8();
  v9[43] = v13;
  v9[44] = *(void *)(v13 - 8);
  v9[45] = swift_task_alloc();
  v9[46] = swift_task_alloc();
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A5697918, 0, 0);
}

uint64_t sub_1A5697918()
{
  uint64_t v31 = v0;
  uint64_t v2 = v0[43];
  uint64_t v1 = v0[44];
  uint64_t v3 = v0[42];
  sub_1A56D4878();
  swift_allocObject();
  v0[49] = sub_1A56D4868();
  sub_1A56D5B98();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  v0[50] = (uint64_t)v4;
  v0[51] = (v1 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  uint64_t result = v4(v3, 1, v2);
  if (result == 1)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v6 = v0[48];
  uint64_t v7 = v0[43];
  uint64_t v8 = v0[44];
  uint64_t v9 = v0[42];
  uint64_t v10 = v0[22];
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  v0[52] = (uint64_t)v11;
  v0[53] = (v8 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v11(v6, v9, v7);
  uint64_t v12 = v0[22];
  if (v10)
  {
    *((void *)&v30 + 1) = swift_getObjectType();
    *(void *)&long long v29 = v12;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  uint64_t v13 = v0[48];
  uint64_t v28 = v0[43];
  uint64_t v14 = v0[41];
  swift_unknownObjectRetain();
  uint64_t v15 = (void (*)(uint64_t *, void))sub_1A56D4858();
  sub_1A553763C((uint64_t)&v29, v13);
  v15(v0 + 2, 0);
  sub_1A56D5B98();
  uint64_t result = v4(v14, 1, v28);
  if (result == 1) {
    goto LABEL_13;
  }
  uint64_t v16 = v0[23];
  v11(v0[47], v0[41], v0[43]);
  uint64_t v17 = v0[23];
  if (v16)
  {
    *((void *)&v30 + 1) = swift_getObjectType();
    *(void *)&long long v29 = v17;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  uint64_t v18 = v0[47];
  swift_unknownObjectRetain();
  uint64_t v19 = (void (*)(uint64_t *, void))sub_1A56D4858();
  sub_1A553763C((uint64_t)&v29, v18);
  v19(v0 + 6, 0);
  swift_getAssociatedConformanceWitness();
  sub_1A56D4848();
  tryCast<A>(_:as:description:file:line:)(v0[20], v0[33], 0, 0, 0xD00000000000004FLL, 0x80000001A573CD10, 475, v0[33], v0[35]);
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0[27] + 24)
                                                                                     + **(int **)(v0[27] + 24));
  uint64_t v20 = (void *)swift_task_alloc();
  v0[54] = (uint64_t)v20;
  *uint64_t v20 = v0;
  v20[1] = sub_1A5697DA0;
  uint64_t v21 = v0[38];
  uint64_t v22 = v0[35];
  uint64_t v23 = v0[32];
  uint64_t v24 = v0[27];
  uint64_t v25 = v0[26];
  uint64_t v26 = v0[21];
  return v27(v23, v21, v22, v26, v25, v24);
}

uint64_t sub_1A5697DA0()
{
  *(void *)(*(void *)v1 + 440) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A5698334;
  }
  else {
    uint64_t v2 = sub_1A5697EB4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A5697EB4()
{
  uint64_t v43 = v0;
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 320);
  sub_1A56D48B8();
  swift_allocObject();
  sub_1A56D48A8();
  sub_1A56D5B98();
  uint64_t result = v1(v3, 1, v2);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_11;
  }
  os_log_type_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  uint64_t v6 = *(void *)(v0 + 368);
  uint64_t v7 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 312);
  uint64_t v9 = *(void **)(v0 + 192);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 416))(v6, *(void *)(v0 + 320), v7);
  uint64_t v42 = type metadata accessor for _SFXPCAsyncSequenceContainer(0);
  v41[0] = v9;
  id v10 = v9;
  uint64_t v11 = (void (*)(uint64_t, void))sub_1A56D4898();
  sub_1A553763C((uint64_t)v41, v6);
  v11(v0 + 80, 0);
  sub_1A56D5B98();
  uint64_t result = v5(v8, 1, v7);
  if (result == 1)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v38 = *(void *)(v0 + 440);
  uint64_t v12 = *(void *)(v0 + 360);
  uint64_t v13 = *(void **)(v0 + 200);
  (*(void (**)(uint64_t, void, void))(v0 + 416))(v12, *(void *)(v0 + 312), *(void *)(v0 + 344));
  uint64_t v42 = type metadata accessor for _SFXPCBlockContainer();
  v41[0] = v13;
  id v14 = v13;
  uint64_t v15 = (void (*)(uint64_t, void))sub_1A56D4898();
  sub_1A553763C((uint64_t)v41, v12);
  v15(v0 + 112, 0);
  swift_getAssociatedConformanceWitness();
  uint64_t v16 = sub_1A56D4888();
  if (v38)
  {
    uint64_t v18 = *(void *)(v0 + 296);
    uint64_t v37 = *(void *)(v0 + 304);
    uint64_t v20 = *(void *)(v0 + 280);
    uint64_t v19 = *(void *)(v0 + 288);
    uint64_t v22 = *(void *)(v0 + 264);
    uint64_t v21 = *(void *)(v0 + 272);
    uint64_t v23 = *(void *)(v0 + 248);
    uint64_t v24 = *(void *)(v0 + 256);
    uint64_t v25 = *(void *)(v0 + 240);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v37, v19);
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
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  else
  {
    uint64_t v27 = *(void *)(v0 + 296);
    uint64_t v36 = *(void *)(v0 + 304);
    uint64_t v28 = *(void *)(v0 + 280);
    uint64_t v29 = *(void *)(v0 + 288);
    uint64_t v31 = *(void *)(v0 + 264);
    uint64_t v30 = *(void *)(v0 + 272);
    uint64_t v32 = *(void *)(v0 + 248);
    uint64_t v33 = *(void *)(v0 + 256);
    uint64_t v34 = *(void *)(v0 + 240);
    uint64_t v39 = v16;
    uint64_t v40 = v17;
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v34);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v31);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v36, v29);
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
    swift_task_dealloc();
    uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v35(v39, v40);
  }
}

uint64_t sub_1A5698334()
{
  uint64_t v2 = v0[37];
  uint64_t v1 = v0[38];
  uint64_t v4 = v0[35];
  uint64_t v3 = v0[36];
  uint64_t v5 = v0[33];
  uint64_t v6 = v0[34];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
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
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t _SFXPCError.domain.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SFXPCError_domain);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _SFXPCError.errorCode.getter()
{
  return *(void *)(v0 + OBJC_IVAR____SFXPCError_errorCode);
}

uint64_t _SFXPCError.internalLocalizedDescription.getter()
{
  return sub_1A56984DC(&OBJC_IVAR____SFXPCError_internalLocalizedDescription);
}

uint64_t _SFXPCError.internalDebugDescription.getter()
{
  return sub_1A56984DC(&OBJC_IVAR____SFXPCError_internalDebugDescription);
}

uint64_t _SFXPCError.file.getter()
{
  return sub_1A56984DC(&OBJC_IVAR____SFXPCError_file);
}

uint64_t sub_1A56984DC(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t _SFXPCError.line.getter()
{
  return *(void *)(v0 + OBJC_IVAR____SFXPCError_line);
}

uint64_t _SFXPCError.process.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SFXPCError_process);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static _SFXPCError.supportsSecureCoding.getter()
{
  return 1;
}

id _SFXPCError.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return _SFXPCError.init(coder:)(a1);
}

id _SFXPCError.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675568);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A56F0E60;
  uint64_t v6 = sub_1A5584030(0, &qword_1EB3DD000);
  *(void *)(v5 + 32) = v6;
  uint64_t v7 = v2;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (!v44)
  {

LABEL_13:
    sub_1A553E2C0((uint64_t)v43);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_14:
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v9 = v41;
  uint64_t v8 = v42;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1A56F0E60;
  uint64_t v11 = sub_1A5584030(0, (unint64_t *)&qword_1E9675570);
  *(void *)(v10 + 32) = v11;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (!v44) {
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v39 = v41;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1A56F0E60;
  *(void *)(v12 + 32) = v6;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (!v44)
  {
LABEL_12:

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v37 = v42;
  uint64_t v38 = v41;
  uint64_t v13 = &v7[OBJC_IVAR____SFXPCError_domain];
  *(void *)uint64_t v13 = v9;
  *((void *)v13 + 1) = v8;
  *(void *)&v7[OBJC_IVAR____SFXPCError_errorCode] = v39;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1A56F0E60;
  *(void *)(v14 + 32) = v6;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (v44)
  {
    int v15 = swift_dynamicCast();
    uint64_t v16 = v41;
    uint64_t v17 = v42;
    if (!v15)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_1A553E2C0((uint64_t)v43);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v20 = &v7[OBJC_IVAR____SFXPCError_internalLocalizedDescription];
  *(void *)uint64_t v20 = v16;
  *((void *)v20 + 1) = v17;
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1A56F0E60;
  *(void *)(v21 + 32) = v6;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (v44)
  {
    int v22 = swift_dynamicCast();
    uint64_t v23 = v41;
    uint64_t v24 = v42;
    if (!v22)
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
    }
  }
  else
  {
    sub_1A553E2C0((uint64_t)v43);
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  uint64_t v25 = &v7[OBJC_IVAR____SFXPCError_internalDebugDescription];
  *(void *)uint64_t v25 = v23;
  *((void *)v25 + 1) = v24;
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1A56F0E60;
  *(void *)(v26 + 32) = v6;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (v44)
  {
    int v27 = swift_dynamicCast();
    uint64_t v28 = v41;
    uint64_t v29 = v42;
    if (!v27)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }
  }
  else
  {
    sub_1A553E2C0((uint64_t)v43);
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  uint64_t v30 = &v7[OBJC_IVAR____SFXPCError_file];
  *(void *)uint64_t v30 = v28;
  *((void *)v30 + 1) = v29;
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_1A56F0E60;
  *(void *)(v31 + 32) = v11;
  sub_1A56D5838();
  swift_bridgeObjectRelease();
  if (v44)
  {
    int v32 = swift_dynamicCast();
    uint64_t v33 = v41;
    if (!v32) {
      uint64_t v33 = 0;
    }
    char v34 = v32 ^ 1;
  }
  else
  {
    sub_1A553E2C0((uint64_t)v43);
    uint64_t v33 = 0;
    char v34 = 1;
  }
  uint64_t v35 = &v7[OBJC_IVAR____SFXPCError_line];
  *(void *)uint64_t v35 = v33;
  v35[8] = v34;
  uint64_t v36 = &v7[OBJC_IVAR____SFXPCError_process];
  *(void *)uint64_t v36 = v38;
  *((void *)v36 + 1) = v37;

  v40.receiver = v7;
  v40.super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v40, sel_init);

  return v18;
}

Swift::Void __swiftcall _SFXPCError.encode(with:)(NSCoder with)
{
  id v3 = (void *)sub_1A56D5098();
  uint64_t v4 = (void *)sub_1A56D5098();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____SFXPCError_errorCode);
  uint64_t v6 = (void *)sub_1A56D5098();
  [(objc_class *)with.super.isa encodeInteger:v5 forKey:v6];

  if (*(void *)(v1 + OBJC_IVAR____SFXPCError_internalLocalizedDescription + 8))
  {
    uint64_t v7 = (void *)sub_1A56D5098();
    uint64_t v8 = (void *)sub_1A56D5098();
    [(objc_class *)with.super.isa encodeObject:v7 forKey:v8];
  }
  if (*(void *)(v1 + OBJC_IVAR____SFXPCError_internalDebugDescription + 8))
  {
    uint64_t v9 = (void *)sub_1A56D5098();
    uint64_t v10 = (void *)sub_1A56D5098();
    [(objc_class *)with.super.isa encodeObject:v9 forKey:v10];
  }
  if (*(void *)(v1 + OBJC_IVAR____SFXPCError_file + 8))
  {
    uint64_t v11 = (void *)sub_1A56D5098();
    uint64_t v12 = (void *)sub_1A56D5098();
    [(objc_class *)with.super.isa encodeObject:v11 forKey:v12];
  }
  if ((*(unsigned char *)(v1 + OBJC_IVAR____SFXPCError_line + 8) & 1) == 0)
  {
    uint64_t v13 = *(void *)(v1 + OBJC_IVAR____SFXPCError_line);
    uint64_t v14 = (void *)sub_1A56D5098();
    [(objc_class *)with.super.isa encodeInteger:v13 forKey:v14];
  }
  int v15 = (void *)sub_1A56D5098();
  id v16 = (id)sub_1A56D5098();
  [(objc_class *)with.super.isa encodeObject:v15 forKey:v16];
}

id _SFXPCError.init(_:)(void *a1)
{
  id v2 = sub_1A5698FB8(a1);

  return v2;
}

id _SFXPCError.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void _SFXPCError.init()()
{
}

uint64_t sub_1A5698F64(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1A5698F90(uint64_t (*a1)(void))
{
  return a1();
}

id sub_1A5698FB8(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = v1;
  id v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C8B0);
  if (swift_dynamicCast())
  {
    uint64_t v5 = *((void *)&v87 + 1);
    uint64_t v6 = *(void *)v88;
    uint64_t v7 = v89;
    uint64_t v8 = v90;
    long long v9 = *(_OWORD *)&v88[8];
    uint64_t v10 = &v3[OBJC_IVAR____SFXPCError_domain];
    *(void *)uint64_t v10 = v87;
    *((void *)v10 + 1) = v5;
    *(void *)&v3[OBJC_IVAR____SFXPCError_errorCode] = v6;
    *(_OWORD *)&v3[OBJC_IVAR____SFXPCError_internalLocalizedDescription] = v9;
    uint64_t v11 = &v3[OBJC_IVAR____SFXPCError_internalDebugDescription];
    *(void *)&v3[OBJC_IVAR____SFXPCError_internalDebugDescription] = v7;
    goto LABEL_23;
  }
  uint64_t v12 = (void *)sub_1A56D4948();
  id v13 = objc_msgSend(v12, sel_domain);
  uint64_t v14 = sub_1A56D50D8();
  uint64_t v16 = v15;

  uint64_t v17 = (uint64_t *)&v3[OBJC_IVAR____SFXPCError_domain];
  *uint64_t v17 = v14;
  v17[1] = v16;
  id v18 = objc_msgSend(v12, sel_code);
  *(void *)&v3[OBJC_IVAR____SFXPCError_errorCode] = v18;
  swift_getErrorValue();
  uint64_t v19 = sub_1A56D6018();
  uint64_t v20 = (uint64_t *)&v3[OBJC_IVAR____SFXPCError_internalLocalizedDescription];
  *uint64_t v20 = v19;
  v20[1] = v21;
  id v22 = objc_msgSend(v12, sel_userInfo);
  uint64_t v23 = sub_1A56D4FD8();

  uint64_t v24 = sub_1A56D50D8();
  if (*(void *)(v23 + 16) && (unint64_t v26 = sub_1A54F3E90(v24, v25), (v27 & 1) != 0))
  {
    sub_1A54E3F20(*(void *)(v23 + 56) + 32 * v26, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    *(_OWORD *)long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)&v88[8])
  {
    sub_1A553E2C0((uint64_t)&v87);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    id v29 = objc_msgSend(v12, sel_userInfo);
    uint64_t v30 = sub_1A56D4FD8();

    if (*(void *)(v30 + 16) && (unint64_t v31 = sub_1A54F3E90(0xD000000000000015, 0x80000001A573A9E0), (v32 & 1) != 0))
    {
      sub_1A54E3F20(*(void *)(v30 + 56) + 32 * v31, (uint64_t)&v87);
    }
    else
    {
      long long v87 = 0u;
      *(_OWORD *)long long v88 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*(void *)&v88[8])
    {
      sub_1A5584030(0, (unint64_t *)&unk_1E9675650);
      if (swift_dynamicCast())
      {
        *(void *)&long long v87 = 0;
        *((void *)&v87 + 1) = 0xE000000000000000;
        sub_1A56D5A28();
        sub_1A56D51C8();
        id v84 = objc_msgSend(a1, sel_name);
        type metadata accessor for NSExceptionName(0);
        sub_1A56D5B48();

        sub_1A56D51C8();
        id v33 = objc_msgSend(a1, sel_reason);
        if (v33)
        {
          char v34 = v33;
          sub_1A56D50D8();
        }
        sub_1A56D51C8();

        swift_bridgeObjectRelease();
        uint64_t v8 = *((void *)&v87 + 1);
        uint64_t v28 = (void *)v87;
        goto LABEL_22;
      }
    }
    else
    {
      sub_1A553E2C0((uint64_t)&v87);
    }
    *(void *)&long long v87 = a1;
    id v35 = a1;
    uint64_t v36 = sub_1A56D5118();
    uint64_t v8 = v37;

    uint64_t v11 = &v3[OBJC_IVAR____SFXPCError_internalDebugDescription];
    *(void *)&v3[OBJC_IVAR____SFXPCError_internalDebugDescription] = v36;
    goto LABEL_23;
  }

  uint64_t v28 = a1;
  uint64_t v8 = v85;
LABEL_22:
  uint64_t v11 = &v3[OBJC_IVAR____SFXPCError_internalDebugDescription];
  *(void *)&v3[OBJC_IVAR____SFXPCError_internalDebugDescription] = v28;
LABEL_23:
  *((void *)v11 + 1) = v8;
  id v38 = objc_msgSend(self, sel_processInfo);
  id v39 = objc_msgSend(v38, sel_processName);

  uint64_t v40 = sub_1A56D50D8();
  uint64_t v42 = v41;

  id v43 = a1;
  if (swift_dynamicCast())
  {
    uint64_t v44 = v87;
    uint64_t v45 = *(void *)&v88[8];
    uint64_t v46 = *(void *)&v88[16];
    uint64_t v81 = v3;
    uint64_t v82 = v89;
    uint64_t v47 = v90;
    uint64_t v48 = *(void *)&v88[8];
    uint64_t v49 = *(void *)v88;
    uint64_t v50 = *(void *)&v88[16];
    switch(v94 >> 61)
    {
      case 4uLL:
        uint64_t v48 = *(void *)&v88[16];
        uint64_t v49 = *(void *)&v88[8];
        uint64_t v50 = v89;
        goto LABEL_25;
      case 5uLL:
        uint64_t v48 = v91;
        uint64_t v49 = v90;
        uint64_t v50 = v92;
        goto LABEL_25;
      case 6uLL:
        uint64_t v78 = *(void *)v88;
        uint64_t v80 = v87;
        uint64_t v63 = v96;
        uint64_t v64 = v92;
        uint64_t v65 = v91;
        uint64_t v66 = v95;
        uint64_t v77 = *((void *)&v87 + 1);
        uint64_t v67 = v93;
        unint64_t v68 = v94;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v69 = v66;
        sub_1A55DE494(v80, v77, v78, v45, v46, v82, v47, v65, v64, v67, v68);
        id v3 = v81;
        uint64_t v70 = (uint64_t *)&v81[OBJC_IVAR____SFXPCError_file];
        *uint64_t v70 = v65;
        v70[1] = v64;
        unint64_t v71 = &v81[OBJC_IVAR____SFXPCError_line];
        *(void *)unint64_t v71 = v67;
        v71[8] = v68 & 1;
        id v59 = &v81[OBJC_IVAR____SFXPCError_process];
        *(void *)&v81[OBJC_IVAR____SFXPCError_process] = v69;
        uint64_t v42 = v63;
        break;
      default:
LABEL_25:
        uint64_t v74 = v49;
        uint64_t v75 = v91;
        uint64_t v76 = v50;
        uint64_t v51 = v92;
        uint64_t v79 = v42;
        uint64_t v52 = *((void *)&v87 + 1);
        uint64_t v72 = *(void *)&v88[16];
        uint64_t v73 = v90;
        uint64_t v53 = *(void *)&v88[8];
        uint64_t v54 = *(void *)v88;
        uint64_t v55 = v93;
        unint64_t v56 = v94;
        swift_bridgeObjectRetain();
        sub_1A55DE494(v44, v52, v54, v53, v72, v82, v73, v75, v51, v55, v56);
        uint64_t v42 = v79;
        id v3 = v81;
        uint64_t v57 = &v81[OBJC_IVAR____SFXPCError_file];
        *(void *)uint64_t v57 = v74;
        *((void *)v57 + 1) = v48;
        uint64_t v58 = &v81[OBJC_IVAR____SFXPCError_line];
        *(void *)uint64_t v58 = v76;
        v58[8] = 0;
        id v59 = &v81[OBJC_IVAR____SFXPCError_process];
        *(void *)&v81[OBJC_IVAR____SFXPCError_process] = v40;
        break;
    }
  }
  else
  {
    id v60 = &v3[OBJC_IVAR____SFXPCError_file];
    *(void *)id v60 = 0;
    *((void *)v60 + 1) = 0;
    uint64_t v61 = &v3[OBJC_IVAR____SFXPCError_line];
    *(void *)uint64_t v61 = 0;
    v61[8] = 1;
    id v59 = &v3[OBJC_IVAR____SFXPCError_process];
    *(void *)&v3[OBJC_IVAR____SFXPCError_process] = v40;
  }
  *((void *)v59 + 1) = v42;

  v86.receiver = v3;
  v86.super_class = ObjectType;
  return objc_msgSendSuper2(&v86, sel_init);
}

uint64_t type metadata accessor for SFXPCListener.ClientConnection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A56996F0(void *a1)
{
  id v2 = v1;
  v46[1] = *MEMORY[0x1E4FBC8C8] & *v2;
  uint64_t v4 = type metadata accessor for SFClientIdentity();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v47 = (uint64_t)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v46 - v7;
  id v9 = a1;
  SFClientAccessLevel.init(xpcConnection:)(v9, &aBlock);
  int v10 = aBlock;
  uint64_t v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
  uint64_t v12 = v11[12];
  id v13 = (uint64_t *)&v8[v11[16]];
  uint64_t v14 = &v8[v11[20]];
  uint64_t v15 = v11[24];
  id v16 = v9;
  sub_1A56D4CA8();
  *(_DWORD *)&v8[v12] = objc_msgSend(v16, sel_processIdentifier);
  uint64_t v17 = sub_1A55D4ED8();
  uint64_t v19 = v18;

  *id v13 = v17;
  v13[1] = v19;
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  *(_DWORD *)&v8[v15] = v10;
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = *(void **)((char *)v2 + qword_1E9675508);
  type metadata accessor for SFXPCConnection();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v16;
  *(void *)(v21 + 24) = 0;
  id v22 = v16;
  id v23 = v20;
  objc_msgSend(v22, sel_sf_setQueue_, v23);
  if (qword_1EB3DCFD8 != -1) {
    swift_once();
  }
  objc_msgSend(v22, sel_setRemoteObjectInterface_, qword_1EB3DD6F8);

  uint64_t v24 = (objc_class *)type metadata accessor for SFXPCListener.ClientConnection();
  uint64_t v25 = v47;
  sub_1A5681B28((uint64_t)v8, v47);
  unint64_t v26 = (void *)((char *)v2 + qword_1E96754E0);
  swift_beginAccess();
  uint64_t v27 = *v26;
  uint64_t v28 = (void *)((char *)v2 + qword_1E96754F8);
  swift_beginAccess();
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  swift_retain();
  swift_retain();
  sub_1A5572C20(v30);
  id v31 = objc_allocWithZone(v24);
  id v32 = SFXPCListener.ClientConnection.init(connection:clientIdentity:containerRegistry:contextProvider:)(v21, v25, v27, v30, v29);
  objc_msgSend(v22, sel_setExportedInterface_, qword_1EB3DD6F8);
  objc_msgSend(v22, sel_setExportedObject_, v32);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v2;
  *(void *)(v33 + 24) = v32;
  uint64_t v53 = sub_1A569A82C;
  uint64_t v54 = v33;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v50 = 1107296256;
  uint64_t v51 = sub_1A55AEF94;
  uint64_t v52 = &block_descriptor_9;
  char v34 = _Block_copy(&aBlock);
  id v35 = v2;
  id v36 = v32;
  swift_release();
  objc_msgSend(v22, sel_setInvalidationHandler_, v34);
  _Block_release(v34);
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v35;
  *(void *)(v37 + 24) = v36;
  uint64_t v53 = sub_1A569A7F0;
  uint64_t v54 = v37;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v50 = 1107296256;
  uint64_t v51 = sub_1A55AEF94;
  uint64_t v52 = &block_descriptor_52;
  id v38 = _Block_copy(&aBlock);
  id v39 = v35;
  id v40 = v36;
  swift_release();
  objc_msgSend(v22, sel_setInterruptionHandler_, v38);
  _Block_release(v38);
  id v48 = v40;
  swift_beginAccess();
  sub_1A56D53D8();
  uint64_t v41 = (char *)v40;
  sub_1A56D53B8();
  swift_endAccess();
  objc_msgSend(*(id *)(v21 + 16), sel_activate);
  uint64_t v42 = &v39[qword_1E96754E8];
  swift_beginAccess();
  id v43 = *(void (**)(char *))v42;
  if (*(void *)v42)
  {
    swift_endAccess();
    uint64_t v44 = &v41[qword_1E96A7EC8];
    swift_retain();
    v43(v44);
    sub_1A54F5EA8((uint64_t)v43);
    swift_release();

    sub_1A5681BF0((uint64_t)v8);
  }
  else
  {
    sub_1A5681BF0((uint64_t)v8);
    swift_endAccess();

    swift_release();
  }
  return 1;
}

void sub_1A5699C3C()
{
}

uint64_t type metadata accessor for _SFXPCError()
{
  return self;
}

uint64_t sub_1A5699C90()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for SFClientIdentity() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_unknownObjectRelease();

  sub_1A54EA09C(*(void *)(v0 + 48), *(void *)(v0 + 56));
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1) {
      goto LABEL_5;
    }
    uint64_t v9 = sub_1A56D4CB8();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v0 + v6, v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_5:
  unint64_t v10 = (((((v7 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A5699EC8()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(v0 + 32) - 8) + 64);
  uint64_t v3 = *(void *)(type metadata accessor for SFClientIdentity() - 8);
  unint64_t v4 = (v1 + v2 + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v22 = *(_OWORD *)(v0 + 40);
  uint64_t v21 = *(void *)(v0 + 56);
  uint64_t v11 = *(void *)(v0 + v5);
  uint64_t v12 = *(void *)(v0 + v6);
  uint64_t v13 = *(void *)(v0 + v7);
  uint64_t v14 = *(void *)(v0 + v8);
  uint64_t v15 = v0 + v4;
  uint64_t v17 = *(void *)(v0 + v9);
  uint64_t v16 = *(void *)(v0 + v9 + 8);
  uint64_t v18 = swift_task_alloc();
  long long v19 = *(_OWORD *)(v0 + v10);
  *(void *)(v23 + 16) = v18;
  *(void *)uint64_t v18 = v23;
  *(void *)(v18 + 8) = sub_1A54E83BC;
  *(void *)(v18 + 288) = v24;
  *(_OWORD *)(v18 + 272) = v19;
  *(void *)(v18 + 256) = v17;
  *(void *)(v18 + 264) = v16;
  *(void *)(v18 + 240) = v13;
  *(void *)(v18 + 248) = v14;
  *(void *)(v18 + 224) = v11;
  *(void *)(v18 + 232) = v12;
  *(void *)(v18 + 208) = v0 + v1;
  *(void *)(v18 + 216) = v15;
  *(void *)(v18 + 200) = v21;
  *(_OWORD *)(v18 + 184) = v22;
  return MEMORY[0x1F4188298](sub_1A5695B0C, 0, 0);
}

uint64_t sub_1A569A0D0()
{
  uint64_t v1 = sub_1A56D4CB8();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1A569A1C4()
{
}

uint64_t sub_1A569A1FC()
{
  return 8;
}

void *sub_1A569A208(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1A569A21C()
{
  return 8;
}

uint64_t sub_1A569A230()
{
  return 8;
}

uint64_t dispatch thunk of _SFXPCSyncInvocableProtocol.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of _SFXPCAsyncInvocableProtocol.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 24)
                                                                                     + **(int **)(a6 + 24));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_1A54E83BC;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1A569A38C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SFXPCListener()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for SFXPCListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SFXPCListener);
}

uint64_t dispatch thunk of SFXPCListener.__allocating_init(takingOver:queue:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_1A569A440()
{
  uint64_t result = type metadata accessor for SFClientIdentity();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SFXPCListener.ClientConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SFXPCListener.ClientConnection);
}

uint64_t dispatch thunk of SFXPCListener.ClientConnection.__allocating_init(connection:clientIdentity:containerRegistry:contextProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of _AnySFXPCSyncInvocableProtocol.invoke(with:context:client:parametersAsyncSequenceContainer:parametersBlockContainer:responseAsyncSequenceContainer:responseXPCBlockContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 8))(a1, a2);
}

uint64_t dispatch thunk of _AnySFXPCAsyncInvocableProtocol.invoke(with:context:client:parametersAsyncSequenceContainer:parametersBlocksContainer:responseAsyncSequenceContainer:responseXPCBlocksContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a10 + 8) + **(int **)(a10 + 8));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v10 + 16) = v18;
  *uint64_t v18 = v10;
  v18[1] = sub_1A5540554;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t method lookup function for _SFXPCError(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for _SFXPCError);
}

uint64_t dispatch thunk of _SFXPCError.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of _SFXPCError.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_1A569A6D8()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1A569A710()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A569A748()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A569A770()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A569A798()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_1A569A7F0()
{
  return sub_1A56942B0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t SFAirDropClient.Identifier.description.getter()
{
  uint64_t v1 = type metadata accessor for SFAirDropClient.Identifier();
  MEMORY[0x1F4188790](v1);
  unint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A569D4F4(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unint64_t result = 0x755379636167656CLL;
  switch(EnumCaseMultiPayload)
  {
    case 1:
      sub_1A569D558((uint64_t)v3);
      unint64_t result = 0x636972656E6567;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 6909027;
      break;
    case 4:
      unint64_t result = 0x6E6F6D656164;
      break;
    case 5:
      unint64_t result = 0x6568536572616873;
      break;
    case 6:
      unint64_t result = 1886351202;
      break;
    case 7:
      unint64_t result = 0x7265646E6966;
      break;
    case 8:
      unint64_t result = 0x74656C6C6177;
      break;
    case 9:
      unint64_t result = 0x4E706F7244726961;
      break;
    case 10:
      unint64_t result = 0x55706F7264726961;
      break;
    case 11:
      unint64_t result = 0xD000000000000010;
      break;
    case 12:
      unint64_t result = 0x79636167656CLL;
      break;
    default:
      uint64_t v6 = sub_1A56D4CB8();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v3, v6);
      unint64_t result = 0x69577265646E6966;
      break;
  }
  return result;
}

unint64_t sub_1A569AACC(char a1)
{
  unint64_t result = 0x755379636167656CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 6909027;
      break;
    case 2:
      unint64_t result = 0x6E6F6D656164;
      break;
    case 3:
      unint64_t result = 0x6568536572616873;
      break;
    case 4:
      unint64_t result = 1886351202;
      break;
    case 5:
      unint64_t result = 0x7265646E6966;
      break;
    case 6:
      unint64_t result = 0x74656C6C6177;
      break;
    case 7:
      unint64_t result = 0x4E706F7244726961;
      break;
    case 8:
      unint64_t result = 0x69577265646E6966;
      break;
    case 9:
      unint64_t result = 0x55706F7264726961;
      break;
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 11:
      unint64_t result = 0x636972656E6567;
      break;
    case 12:
      unint64_t result = 0x79636167656CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A569AC68(uint64_t a1)
{
  unint64_t v2 = sub_1A569D704();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569ACA4(uint64_t a1)
{
  unint64_t v2 = sub_1A569D704();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569ACE0(uint64_t a1)
{
  unint64_t v2 = sub_1A569D6B0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569AD1C(uint64_t a1)
{
  unint64_t v2 = sub_1A569D6B0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569AD58(uint64_t a1)
{
  unint64_t v2 = sub_1A569D7AC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569AD94(uint64_t a1)
{
  unint64_t v2 = sub_1A569D7AC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569ADD0(uint64_t a1)
{
  unint64_t v2 = sub_1A569D8A8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569AE0C(uint64_t a1)
{
  unint64_t v2 = sub_1A569D8A8();

  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1A569AE48()
{
  return sub_1A569AACC(*v0);
}

uint64_t sub_1A569AE50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A569EA74(a1, a2);
  *a3 = result;
  return result;
}

void sub_1A569AE78(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_1A569AE84(uint64_t a1)
{
  unint64_t v2 = sub_1A569D5B4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569AEC0(uint64_t a1)
{
  unint64_t v2 = sub_1A569D5B4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569AEFC(uint64_t a1)
{
  unint64_t v2 = sub_1A569D854();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569AF38(uint64_t a1)
{
  unint64_t v2 = sub_1A569D854();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569AF74()
{
  if (*v0) {
    return 0x797469726F697270;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_1A569AFA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A569EFE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A569AFD0(uint64_t a1)
{
  unint64_t v2 = sub_1A569D65C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569B00C(uint64_t a1)
{
  unint64_t v2 = sub_1A569D65C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569B048(uint64_t a1)
{
  unint64_t v2 = sub_1A569D608();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569B084(uint64_t a1)
{
  unint64_t v2 = sub_1A569D608();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569B0C0(uint64_t a1)
{
  unint64_t v2 = sub_1A569D8FC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569B0FC(uint64_t a1)
{
  unint64_t v2 = sub_1A569D8FC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569B138(uint64_t a1)
{
  unint64_t v2 = sub_1A569D800();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569B174(uint64_t a1)
{
  unint64_t v2 = sub_1A569D800();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569B1B0(uint64_t a1)
{
  unint64_t v2 = sub_1A569D758();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569B1EC(uint64_t a1)
{
  unint64_t v2 = sub_1A569D758();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDropClient.Identifier.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675660);
  uint64_t v66 = *(void *)(v2 - 8);
  uint64_t v67 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v65 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675668);
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v70 = v4;
  MEMORY[0x1F4188790](v4);
  unint64_t v68 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675670);
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v64 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v62 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675678);
  uint64_t v60 = *(void *)(v8 - 8);
  uint64_t v61 = v8;
  MEMORY[0x1F4188790](v8);
  id v59 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675680);
  uint64_t v57 = *(void *)(v10 - 8);
  uint64_t v58 = v10;
  MEMORY[0x1F4188790](v10);
  unint64_t v56 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675688);
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x1F4188790](v55);
  uint64_t v53 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675690);
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  uint64_t v50 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675698);
  uint64_t v48 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v47 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96756A0);
  uint64_t v45 = *(void *)(v46 - 8);
  MEMORY[0x1F4188790](v46);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96756A8);
  uint64_t v44 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  long long v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for SFAirDropClient.Identifier();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96756B0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v73 = v23;
  uint64_t v74 = v24;
  MEMORY[0x1F4188790](v23);
  unint64_t v26 = (char *)&v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A569D5B4();
  uint64_t v72 = v26;
  sub_1A56D61D8();
  sub_1A569D4F4(v71, (uint64_t)v22);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      char v87 = 11;
      sub_1A569D65C();
      uint64_t v27 = v68;
      uint64_t v29 = v72;
      uint64_t v28 = v73;
      sub_1A56D5D98();
      char v86 = 0;
      uint64_t v30 = v70;
      uint64_t v31 = v75;
      sub_1A56D5DE8();
      swift_bridgeObjectRelease();
      if (!v31)
      {
        char v85 = 1;
        sub_1A56D5E18();
      }
      (*(void (**)(char *, uint64_t))(v69 + 8))(v27, v30);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v29, v28);
    case 2u:
      char v76 = 0;
      sub_1A569D8FC();
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v35, v34);
    case 3u:
      char v77 = 1;
      sub_1A569D8A8();
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      id v38 = *(void (**)(char *, uint64_t))(v45 + 8);
      id v39 = v16;
      id v40 = &v80;
      goto LABEL_12;
    case 4u:
      char v78 = 2;
      sub_1A569D854();
      uint64_t v41 = v47;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      id v38 = *(void (**)(char *, uint64_t))(v48 + 8);
      id v39 = v41;
      id v40 = &v89;
      goto LABEL_12;
    case 5u:
      char v79 = 3;
      sub_1A569D800();
      uint64_t v42 = v50;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      id v38 = *(void (**)(char *, uint64_t))(v51 + 8);
      id v39 = v42;
      id v40 = &v90;
      goto LABEL_12;
    case 6u:
      char v81 = 4;
      sub_1A569D7AC();
      id v43 = v53;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      id v38 = *(void (**)(char *, uint64_t))(v54 + 8);
      id v39 = v43;
      id v40 = &v91;
LABEL_12:
      uint64_t v36 = *(v40 - 32);
      goto LABEL_16;
    case 8u:
      char v82 = 6;
      sub_1A569D758();
      uint64_t v33 = v56;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      uint64_t v37 = v57;
      uint64_t v36 = v58;
      goto LABEL_15;
    case 0xAu:
      char v83 = 9;
      sub_1A569D704();
      uint64_t v33 = v59;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      uint64_t v37 = v60;
      uint64_t v36 = v61;
      goto LABEL_15;
    case 0xBu:
      char v84 = 10;
      sub_1A569D6B0();
      uint64_t v33 = v62;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      uint64_t v37 = v63;
      uint64_t v36 = v64;
      goto LABEL_15;
    case 0xCu:
      char v88 = 12;
      sub_1A569D608();
      uint64_t v33 = v65;
      id v35 = v72;
      uint64_t v34 = v73;
      sub_1A56D5D98();
      uint64_t v37 = v66;
      uint64_t v36 = v67;
LABEL_15:
      id v38 = *(void (**)(char *, uint64_t))(v37 + 8);
      id v39 = v33;
LABEL_16:
      v38(v39, v36);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v35, v34);
    default:
      sub_1A56D5F18();
      __break(1u);
      JUMPOUT(0x1A569BC58);
  }
}

uint64_t SFAirDropClient.Identifier.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v93 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675710);
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v85 = v3;
  MEMORY[0x1F4188790](v3);
  unint64_t v97 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675718);
  uint64_t v67 = *(void *)(v86 - 8);
  MEMORY[0x1F4188790](v86);
  uint64_t v92 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675720);
  uint64_t v82 = *(void *)(v6 - 8);
  uint64_t v83 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v91 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675728);
  uint64_t v80 = *(void *)(v8 - 8);
  uint64_t v81 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v90 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675730);
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x1F4188790](v79);
  uint64_t v89 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675738);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x1F4188790](v77);
  uint64_t v96 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675740);
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x1F4188790](v75);
  char v88 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675748);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x1F4188790](v73);
  char v87 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675750);
  uint64_t v71 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  uint64_t v95 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675758);
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675760);
  uint64_t v94 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  long long v19 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for SFAirDropClient.Identifier();
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v64 - v24;
  uint64_t v26 = a1[3];
  uint64_t v98 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_1A569D5B4();
  uint64_t v27 = v99;
  sub_1A56D61A8();
  if (v27)
  {
LABEL_8:
    uint64_t v37 = (uint64_t)v98;
    return __swift_destroy_boxed_opaque_existential_0Tm(v37);
  }
  uint64_t v66 = v16;
  uint64_t v28 = v95;
  uint64_t v65 = v23;
  uint64_t v29 = v96;
  uint64_t v30 = v97;
  uint64_t v99 = 0;
  uint64_t v31 = sub_1A56D5D78();
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v32 = sub_1A56D5A78();
    swift_allocError();
    uint64_t v34 = v36;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
    *uint64_t v34 = v20;
    sub_1A56D5C98();
    sub_1A56D5A68();
    id v35 = (unsigned int *)MEMORY[0x1E4FBBA70];
LABEL_6:
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *v35, v32);
    swift_willThrow();
LABEL_7:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
    goto LABEL_8;
  }
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      char v101 = 1;
      sub_1A569D8A8();
      uint64_t v41 = v99;
      sub_1A56D5C88();
      if (v41) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v71 + 8))(v28, v70);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 2:
      char v102 = 2;
      sub_1A569D854();
      uint64_t v42 = v87;
      uint64_t v43 = v99;
      sub_1A56D5C88();
      if (v43) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v72 + 8))(v42, v73);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 3:
      char v103 = 3;
      sub_1A569D800();
      uint64_t v44 = v88;
      uint64_t v45 = v99;
      sub_1A56D5C88();
      if (v45) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v74 + 8))(v44, v75);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 4:
      char v104 = 4;
      sub_1A569D7AC();
      uint64_t v46 = v99;
      sub_1A56D5C88();
      if (v46) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v76 + 8))(v29, v77);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 5:
    case 7:
    case 8:
      uint64_t v32 = sub_1A56D5A78();
      swift_allocError();
      uint64_t v34 = v33;
      sub_1A56D5C98();
      sub_1A56D5A68();
      id v35 = (unsigned int *)MEMORY[0x1E4FBBA78];
      goto LABEL_6;
    case 6:
      char v105 = 6;
      sub_1A569D758();
      uint64_t v47 = v89;
      uint64_t v48 = v99;
      sub_1A56D5C88();
      if (v48) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v78 + 8))(v47, v79);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 9:
      char v106 = 9;
      sub_1A569D704();
      uint64_t v49 = v90;
      uint64_t v50 = v99;
      sub_1A56D5C88();
      if (v50) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v80 + 8))(v49, v81);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 0xA:
      char v107 = 10;
      sub_1A569D6B0();
      uint64_t v51 = v91;
      uint64_t v52 = v99;
      sub_1A56D5C88();
      if (v52) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v82 + 8))(v51, v83);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    case 0xB:
      char v110 = 11;
      sub_1A569D65C();
      uint64_t v53 = v92;
      uint64_t v54 = v99;
      sub_1A56D5C88();
      if (v54)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
        uint64_t v37 = (uint64_t)v98;
      }
      else
      {
        uint64_t v57 = v53;
        char v109 = 0;
        uint64_t v58 = v86;
        uint64_t v59 = sub_1A56D5CF8();
        uint64_t v61 = v60;
        uint64_t v96 = (char *)v59;
        char v108 = 1;
        unint64_t v97 = (char *)sub_1A56D5D28();
        uint64_t v62 = v94;
        uint64_t v99 = 0;
        (*(void (**)(char *, uint64_t))(v67 + 8))(v57, v58);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v62 + 8))(v19, v17);
        uint64_t v63 = (uint64_t)v65;
        *uint64_t v65 = v96;
        *(void *)(v63 + 8) = v61;
        *(void *)(v63 + 16) = v97;
        swift_storeEnumTagMultiPayload();
        sub_1A569D950(v63, (uint64_t)v25);
        uint64_t v56 = (uint64_t)v98;
LABEL_31:
        sub_1A569D950((uint64_t)v25, v93);
        uint64_t v37 = v56;
      }
      break;
    case 0xC:
      char v111 = 12;
      sub_1A569D608();
      uint64_t v55 = v99;
      sub_1A56D5C88();
      if (v55) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v84 + 8))(v30, v85);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
      goto LABEL_30;
    default:
      char v100 = 0;
      sub_1A569D8FC();
      id v39 = v66;
      uint64_t v40 = v99;
      sub_1A56D5C88();
      if (v40) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v68 + 8))(v39, v69);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v17);
LABEL_30:
      swift_storeEnumTagMultiPayload();
      uint64_t v56 = (uint64_t)v98;
      goto LABEL_31;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(v37);
}

uint64_t sub_1A569CC58@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDropClient.Identifier.init(from:)(a1, a2);
}

uint64_t sub_1A569CC70(void *a1)
{
  return SFAirDropClient.Identifier.encode(to:)(a1);
}

BOOL sub_1A569CC8C(uint64_t a1, uint64_t a2)
{
  return (_s7Sharing15SFAirDropClientC10IdentifierO1loiySbAE_AEtFZ_0(a2, a1) & 1) == 0;
}

BOOL sub_1A569CCB8(uint64_t a1, uint64_t a2)
{
  return (_s7Sharing15SFAirDropClientC10IdentifierO1loiySbAE_AEtFZ_0(a1, a2) & 1) == 0;
}

uint64_t sub_1A569CCD8(uint64_t a1, uint64_t a2)
{
  return _s7Sharing15SFAirDropClientC10IdentifierO1loiySbAE_AEtFZ_0(a2, a1);
}

uint64_t SFAirDropClient.Identifier.shouldHandleUpdate(presenter:)()
{
  return 1;
}

uint64_t _s7Sharing15SFAirDropClientC10IdentifierO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropClient.Identifier();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675830);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = &v13[*(int *)(v11 + 56)];
  sub_1A569D4F4(a1, (uint64_t)v13);
  sub_1A569D4F4(a2, (uint64_t)v14);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      goto LABEL_18;
    case 2u:
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 5u:
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 7u:
      if (swift_getEnumCaseMultiPayload() == 7) {
        goto LABEL_17;
      }
      goto LABEL_34;
    case 8u:
      if (swift_getEnumCaseMultiPayload() != 8) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 9u:
      if (swift_getEnumCaseMultiPayload() == 9) {
        goto LABEL_17;
      }
      goto LABEL_34;
    case 0xAu:
      if (swift_getEnumCaseMultiPayload() == 10) {
        goto LABEL_32;
      }
      goto LABEL_34;
    case 0xBu:
      if (swift_getEnumCaseMultiPayload() != 11) {
        goto LABEL_34;
      }
      goto LABEL_32;
    case 0xCu:
      if (swift_getEnumCaseMultiPayload() != 12) {
        goto LABEL_34;
      }
LABEL_32:
      sub_1A569D558((uint64_t)v13);
      return 1;
    default:
      sub_1A569D4F4((uint64_t)v13, (uint64_t)v9);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v15 = sub_1A56D4CB8();
        (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v9, v15);
LABEL_34:
        sub_1A569F0C8((uint64_t)v13);
        return 0;
      }
LABEL_17:
      sub_1A56D5F58();
      __break(1u);
LABEL_18:
      sub_1A569D4F4((uint64_t)v13, (uint64_t)v7);
      uint64_t v17 = *v7;
      uint64_t v16 = v7[1];
      uint64_t v18 = v7[2];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      uint64_t v19 = *((void *)v14 + 2);
      if (v17 == *(void *)v14 && v16 == *((void *)v14 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v21 = sub_1A56D5F28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v21 & 1) == 0)
        {
          sub_1A569D558((uint64_t)v13);
          return 0;
        }
      }
      BOOL v22 = v18 == v19;
      sub_1A569D558((uint64_t)v13);
      return v22;
  }
}

uint64_t _s7Sharing15SFAirDropClientC10IdentifierO1loiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropClient.Identifier();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v30 - v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (uint64_t *)((char *)&v30 - v11);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675830);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = &v16[*(int *)(v14 + 56)];
  sub_1A569D4F4(a1, (uint64_t)v16);
  sub_1A569D4F4(a2, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1A569D4F4((uint64_t)v16, (uint64_t)v12);
    uint64_t v19 = *v12;
    uint64_t v18 = v12[1];
    uint64_t v20 = v12[2];
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = *((void *)v17 + 2);
      if (v20 == v21)
      {
        if (v19 == *(void *)v17 && v18 == *((void *)v17 + 1)) {
          char v23 = 0;
        }
        else {
          char v23 = sub_1A56D5F28();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v23 = v20 < v21;
      }
      sub_1A569D558((uint64_t)v16);
      return v23 & 1;
    }
    swift_bridgeObjectRelease();
  }
  sub_1A569D4F4(a1, (uint64_t)v10);
  unint64_t v24 = 100;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1A569D558((uint64_t)v10);
      unint64_t v24 = 600;
      break;
    case 2u:
      break;
    case 3u:
      unint64_t v24 = 200;
      break;
    case 4u:
      unint64_t v24 = 250;
      break;
    case 5u:
      unint64_t v24 = 500;
      break;
    case 6u:
      unint64_t v24 = 375;
      break;
    case 7u:
      unint64_t v24 = 400;
      break;
    case 8u:
      unint64_t v24 = 450;
      break;
    case 9u:
    case 0xAu:
      unint64_t v24 = 300;
      break;
    case 0xBu:
      unint64_t v24 = 350;
      break;
    case 0xCu:
      unint64_t v24 = 700;
      break;
    default:
      uint64_t v25 = sub_1A56D4CB8();
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v10, v25);
      unint64_t v24 = 425;
      break;
  }
  sub_1A569D4F4(a2, (uint64_t)v7);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unint64_t v27 = 100;
  switch(EnumCaseMultiPayload)
  {
    case 1:
      sub_1A569D558((uint64_t)v7);
      unint64_t v27 = 600;
      break;
    case 2:
      break;
    case 3:
      unint64_t v27 = 200;
      break;
    case 4:
      unint64_t v27 = 250;
      break;
    case 5:
      unint64_t v27 = 500;
      break;
    case 6:
      unint64_t v27 = 375;
      break;
    case 7:
      unint64_t v27 = 400;
      break;
    case 8:
      unint64_t v27 = 450;
      break;
    case 9:
    case 10:
      unint64_t v27 = 300;
      break;
    case 11:
      unint64_t v27 = 350;
      break;
    case 12:
      unint64_t v27 = 700;
      break;
    default:
      uint64_t v28 = sub_1A56D4CB8();
      (*(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 8))(v7, v28);
      unint64_t v27 = 425;
      break;
  }
  char v23 = v24 < v27;
  sub_1A569F0C8((uint64_t)v16);
  return v23 & 1;
}

uint64_t type metadata accessor for SFAirDropClient.Identifier()
{
  uint64_t result = qword_1E966B1E0;
  if (!qword_1E966B1E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A569D4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropClient.Identifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A569D558(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SFAirDropClient.Identifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1A569D5B4()
{
  unint64_t result = qword_1E96756B8;
  if (!qword_1E96756B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756B8);
  }
  return result;
}

unint64_t sub_1A569D608()
{
  unint64_t result = qword_1E96756C0;
  if (!qword_1E96756C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756C0);
  }
  return result;
}

unint64_t sub_1A569D65C()
{
  unint64_t result = qword_1E96756C8;
  if (!qword_1E96756C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756C8);
  }
  return result;
}

unint64_t sub_1A569D6B0()
{
  unint64_t result = qword_1E96756D0;
  if (!qword_1E96756D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756D0);
  }
  return result;
}

unint64_t sub_1A569D704()
{
  unint64_t result = qword_1E96756D8;
  if (!qword_1E96756D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756D8);
  }
  return result;
}

unint64_t sub_1A569D758()
{
  unint64_t result = qword_1E96756E0;
  if (!qword_1E96756E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756E0);
  }
  return result;
}

unint64_t sub_1A569D7AC()
{
  unint64_t result = qword_1E96756E8;
  if (!qword_1E96756E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756E8);
  }
  return result;
}

unint64_t sub_1A569D800()
{
  unint64_t result = qword_1E96756F0;
  if (!qword_1E96756F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756F0);
  }
  return result;
}

unint64_t sub_1A569D854()
{
  unint64_t result = qword_1E96756F8;
  if (!qword_1E96756F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96756F8);
  }
  return result;
}

unint64_t sub_1A569D8A8()
{
  unint64_t result = qword_1E9675700;
  if (!qword_1E9675700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675700);
  }
  return result;
}

unint64_t sub_1A569D8FC()
{
  unint64_t result = qword_1E9675708;
  if (!qword_1E9675708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675708);
  }
  return result;
}

uint64_t sub_1A569D950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropClient.Identifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A569D9B8()
{
  unint64_t result = qword_1E9675768;
  if (!qword_1E9675768)
  {
    type metadata accessor for SFAirDropClient.Identifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675768);
  }
  return result;
}

uint64_t *_s10IdentifierOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_1A56D4CB8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s10IdentifierOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = sub_1A56D4CB8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *_s10IdentifierOwcp(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1A56D4CB8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *_s10IdentifierOwca(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A569D558((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_1A56D4CB8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *_s10IdentifierOwta(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A569D558((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_1A56D4CB8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A569DE7C()
{
  uint64_t result = sub_1A56D4CB8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s10IdentifierO10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s10IdentifierO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0x1A569E068);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *_s10IdentifierO10CodingKeysOMa()
{
  return &_s10IdentifierO10CodingKeysON;
}

ValueMetadata *_s10IdentifierO23LegacySupportCodingKeysOMa()
{
  return &_s10IdentifierO23LegacySupportCodingKeysON;
}

ValueMetadata *_s10IdentifierO13CliCodingKeysOMa()
{
  return &_s10IdentifierO13CliCodingKeysON;
}

ValueMetadata *_s10IdentifierO16DaemonCodingKeysOMa()
{
  return &_s10IdentifierO16DaemonCodingKeysON;
}

ValueMetadata *_s10IdentifierO20ShareSheetCodingKeysOMa()
{
  return &_s10IdentifierO20ShareSheetCodingKeysON;
}

ValueMetadata *_s10IdentifierO14BoopCodingKeysOMa()
{
  return &_s10IdentifierO14BoopCodingKeysON;
}

ValueMetadata *_s10IdentifierO16WalletCodingKeysOMa()
{
  return &_s10IdentifierO16WalletCodingKeysON;
}

ValueMetadata *_s10IdentifierO19AirdropUICodingKeysOMa()
{
  return &_s10IdentifierO19AirdropUICodingKeysON;
}

ValueMetadata *_s10IdentifierO26AirdropUIManagerCodingKeysOMa()
{
  return &_s10IdentifierO26AirdropUIManagerCodingKeysON;
}

unsigned char *_s10IdentifierO17GenericCodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A569E1ECLL);
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

ValueMetadata *_s10IdentifierO17GenericCodingKeysOMa()
{
  return &_s10IdentifierO17GenericCodingKeysON;
}

ValueMetadata *_s10IdentifierO16LegacyCodingKeysOMa()
{
  return &_s10IdentifierO16LegacyCodingKeysON;
}

unint64_t sub_1A569E238()
{
  unint64_t result = qword_1E9675770;
  if (!qword_1E9675770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675770);
  }
  return result;
}

unint64_t sub_1A569E290()
{
  unint64_t result = qword_1E9675778;
  if (!qword_1E9675778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675778);
  }
  return result;
}

unint64_t sub_1A569E2E8()
{
  unint64_t result = qword_1E9675780;
  if (!qword_1E9675780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675780);
  }
  return result;
}

unint64_t sub_1A569E340()
{
  unint64_t result = qword_1E9675788;
  if (!qword_1E9675788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675788);
  }
  return result;
}

unint64_t sub_1A569E398()
{
  unint64_t result = qword_1E9675790;
  if (!qword_1E9675790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675790);
  }
  return result;
}

unint64_t sub_1A569E3F0()
{
  unint64_t result = qword_1E9675798;
  if (!qword_1E9675798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675798);
  }
  return result;
}

unint64_t sub_1A569E448()
{
  unint64_t result = qword_1E96757A0;
  if (!qword_1E96757A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757A0);
  }
  return result;
}

unint64_t sub_1A569E4A0()
{
  unint64_t result = qword_1E96757A8;
  if (!qword_1E96757A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757A8);
  }
  return result;
}

unint64_t sub_1A569E4F8()
{
  unint64_t result = qword_1E96757B0;
  if (!qword_1E96757B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757B0);
  }
  return result;
}

unint64_t sub_1A569E550()
{
  unint64_t result = qword_1E96757B8;
  if (!qword_1E96757B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757B8);
  }
  return result;
}

unint64_t sub_1A569E5A8()
{
  unint64_t result = qword_1E96757C0;
  if (!qword_1E96757C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757C0);
  }
  return result;
}

unint64_t sub_1A569E600()
{
  unint64_t result = qword_1E96757C8;
  if (!qword_1E96757C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757C8);
  }
  return result;
}

unint64_t sub_1A569E658()
{
  unint64_t result = qword_1E96757D0;
  if (!qword_1E96757D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757D0);
  }
  return result;
}

unint64_t sub_1A569E6B0()
{
  unint64_t result = qword_1E96757D8;
  if (!qword_1E96757D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757D8);
  }
  return result;
}

unint64_t sub_1A569E708()
{
  unint64_t result = qword_1E96757E0;
  if (!qword_1E96757E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757E0);
  }
  return result;
}

unint64_t sub_1A569E760()
{
  unint64_t result = qword_1E96757E8;
  if (!qword_1E96757E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757E8);
  }
  return result;
}

unint64_t sub_1A569E7B8()
{
  unint64_t result = qword_1E96757F0;
  if (!qword_1E96757F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757F0);
  }
  return result;
}

unint64_t sub_1A569E810()
{
  unint64_t result = qword_1E96757F8;
  if (!qword_1E96757F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96757F8);
  }
  return result;
}

unint64_t sub_1A569E868()
{
  unint64_t result = qword_1E9675800;
  if (!qword_1E9675800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675800);
  }
  return result;
}

unint64_t sub_1A569E8C0()
{
  unint64_t result = qword_1E9675808;
  if (!qword_1E9675808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675808);
  }
  return result;
}

unint64_t sub_1A569E918()
{
  unint64_t result = qword_1E9675810;
  if (!qword_1E9675810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675810);
  }
  return result;
}

unint64_t sub_1A569E970()
{
  unint64_t result = qword_1E9675818;
  if (!qword_1E9675818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675818);
  }
  return result;
}

unint64_t sub_1A569E9C8()
{
  unint64_t result = qword_1E9675820;
  if (!qword_1E9675820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675820);
  }
  return result;
}

unint64_t sub_1A569EA20()
{
  unint64_t result = qword_1E9675828;
  if (!qword_1E9675828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675828);
  }
  return result;
}

uint64_t sub_1A569EA74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x755379636167656CLL && a2 == 0xED000074726F7070;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6909027 && a2 == 0xE300000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F6D656164 && a2 == 0xE600000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6568536572616873 && a2 == 0xEA00000000007465 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1886351202 && a2 == 0xE400000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7265646E6966 && a2 == 0xE600000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x74656C6C6177 && a2 == 0xE600000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x4E706F7244726961 && a2 == 0xED0000656369746FLL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x69577265646E6966 && a2 == 0xEC000000776F646ELL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x55706F7264726961 && a2 == 0xE900000000000049 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001A573CEE0 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x636972656E6567 && a2 == 0xE700000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x79636167656CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t sub_1A569EFE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x797469726F697270 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A569F0C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675830);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Slice.initializeAll<A>(fromContentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return sub_1A569F68C(a1, a2, a3, a4, a5, AssociatedTypeWitness, a6, a7);
}

uint64_t UnsafeMutableBufferPointer.initialize(fromContentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 1) {
    return 0;
  }
  uint64_t v4 = a2;
  if (a4 >= a2)
  {
    sub_1A56D58A8();
    sub_1A56D58A8();
    sub_1A56D5848();
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableBufferPointer.initialize(fromContentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1A56D58F8();
  swift_getWitnessTable();
  sub_1A56D6098();
  swift_getWitnessTable();
  uint64_t result = sub_1A56D5708();
  if (result < 1) {
    return 0;
  }
  uint64_t v8 = result;
  if (result <= a6)
  {
    sub_1A56D58A8();
    sub_1A56D6088();
    sub_1A56D58A8();
    sub_1A56D6068();
    sub_1A56D5848();
    return v8;
  }
  __break(1u);
  return result;
}

uint64_t Slice.initialize<A>(fromContentsOf:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A56D58E8();
  uint64_t v6 = UnsafeMutableBufferPointer.initialize(fromContentsOf:)(a1, a2, v4, v5);
  sub_1A56D58F8();
  swift_getWitnessTable();
  sub_1A56D6098();
  sub_1A56D6068();
  uint64_t result = v8 + v6;
  if (__OFADD__(v8, v6)) {
    __break(1u);
  }
  return result;
}

uint64_t Slice.initialize<A>(fromContentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1A56D58E8();
  uint64_t v10 = UnsafeMutableBufferPointer.initialize(fromContentsOf:)(a1, a2, a3, a4, v8, v9);
  sub_1A56D58F8();
  swift_getWitnessTable();
  sub_1A56D6098();
  sub_1A56D6068();
  uint64_t result = v12 + v10;
  if (__OFADD__(v12, v10)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A569F5C8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!result) {
    return 0;
  }
  uint64_t v4 = a2;
  if (!a2) {
    return v4;
  }
  if (a4 >= a2)
  {
    if (a3) {
      sub_1A56D5878();
    }
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A569F61C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = a2 - result;
  if (a2 == result) {
    return v6;
  }
  if (v6 <= a6)
  {
    if (a5) {
      sub_1A56D5878();
    }
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A569F68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = sub_1A56D58E8();
  uint64_t v15 = _sSr7SharingE13initializeAll14fromContentsOfyqd___t7ElementQyd__RszSlRd__lF_0(a1, v13, v14, a6, a7, a8);
  BOOL v16 = __OFADD__(a2, v15);
  uint64_t result = a2 + v15;
  if (v16) {
    __break(1u);
  }
  return result;
}

uint64_t Slice.initializeAll<A>(fromContentsOf:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1A56D58E8();

  return UnsafeMutableBufferPointer.initialize(fromContentsOf:)(a1, a2, v5, v4);
}

uint64_t Slice.initializeAll<A>(fromContentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_1A56D58E8();

  return UnsafeMutableBufferPointer.initialize(fromContentsOf:)(a1, a2, a3, a4, v9, v8);
}

uint64_t Slice.moveInitializeAll<A>(fromContentsOf:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1A56D58E8();

  return sub_1A569F5C8(a1, a2, v5, v4);
}

uint64_t Slice.moveInitializeAll<A>(fromContentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_1A56D58E8();

  return sub_1A569F61C(a1, a2, a3, a4, v9, v8);
}

BOOL static SFShockwaveEffectState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SFShockwaveEffectState.hash(into:)()
{
  return sub_1A56D60C8();
}

uint64_t sub_1A569F934(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0410();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569F970(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0410();

  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1A569F9AC()
{
  unint64_t result = 0x697463656E6E6F63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x7661776B636F6873;
      break;
    case 3:
      unint64_t result = 0x54676E6974696177;
      break;
    case 4:
      unint64_t result = 0x676E696E61656C63;
      break;
    case 5:
      unint64_t result = 0x6465766F6D6572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A569FA98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56A15B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A569FAC0(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0368();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569FAFC(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0368();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569FB38(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0560();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569FB74(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0560();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569FBB0(uint64_t a1)
{
  unint64_t v2 = sub_1A56A050C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569FBEC(uint64_t a1)
{
  unint64_t v2 = sub_1A56A050C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569FC28(uint64_t a1)
{
  unint64_t v2 = sub_1A56A03BC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569FC64(uint64_t a1)
{
  unint64_t v2 = sub_1A56A03BC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569FCA0(uint64_t a1)
{
  unint64_t v2 = sub_1A56A04B8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569FCDC(uint64_t a1)
{
  unint64_t v2 = sub_1A56A04B8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A569FD18(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0464();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A569FD54(uint64_t a1)
{
  unint64_t v2 = sub_1A56A0464();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFShockwaveEffectState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675838);
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  MEMORY[0x1F4188790](v3);
  id v39 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675840);
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v36 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675848);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v33 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675850);
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v30 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675858);
  uint64_t v28 = *(void *)(v11 - 8);
  uint64_t v29 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675860);
  uint64_t v27 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  BOOL v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675868);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v42 = v17;
  uint64_t v43 = v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56A0368();
  sub_1A56D61D8();
  switch(v21)
  {
    case 1:
      char v45 = 1;
      sub_1A56A050C();
      uint64_t v22 = v42;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v20, v22);
    case 2:
      char v46 = 2;
      sub_1A56A04B8();
      char v23 = v30;
      uint64_t v22 = v42;
      sub_1A56D5D98();
      uint64_t v25 = v31;
      uint64_t v24 = v32;
      goto LABEL_8;
    case 3:
      char v47 = 3;
      sub_1A56A0464();
      char v23 = v33;
      uint64_t v22 = v42;
      sub_1A56D5D98();
      uint64_t v25 = v34;
      uint64_t v24 = v35;
      goto LABEL_8;
    case 4:
      char v48 = 4;
      sub_1A56A0410();
      char v23 = v36;
      uint64_t v22 = v42;
      sub_1A56D5D98();
      uint64_t v25 = v37;
      uint64_t v24 = v38;
      goto LABEL_8;
    case 5:
      char v49 = 5;
      sub_1A56A03BC();
      char v23 = v39;
      uint64_t v22 = v42;
      sub_1A56D5D98();
      uint64_t v25 = v40;
      uint64_t v24 = v41;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
      break;
    default:
      char v44 = 0;
      sub_1A56A0560();
      uint64_t v22 = v42;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v20, v22);
}

unint64_t sub_1A56A0368()
{
  unint64_t result = qword_1E9675870;
  if (!qword_1E9675870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675870);
  }
  return result;
}

unint64_t sub_1A56A03BC()
{
  unint64_t result = qword_1E9675878;
  if (!qword_1E9675878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675878);
  }
  return result;
}

unint64_t sub_1A56A0410()
{
  unint64_t result = qword_1E9675880;
  if (!qword_1E9675880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675880);
  }
  return result;
}

unint64_t sub_1A56A0464()
{
  unint64_t result = qword_1E9675888;
  if (!qword_1E9675888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675888);
  }
  return result;
}

unint64_t sub_1A56A04B8()
{
  unint64_t result = qword_1E9675890;
  if (!qword_1E9675890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675890);
  }
  return result;
}

unint64_t sub_1A56A050C()
{
  unint64_t result = qword_1E9675898;
  if (!qword_1E9675898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675898);
  }
  return result;
}

unint64_t sub_1A56A0560()
{
  unint64_t result = qword_1E96758A0;
  if (!qword_1E96758A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96758A0);
  }
  return result;
}

uint64_t SFShockwaveEffectState.hashValue.getter()
{
  return sub_1A56D60E8();
}

uint64_t SFShockwaveEffectState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758A8);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v66 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758B0);
  uint64_t v56 = *(void *)(v61 - 8);
  MEMORY[0x1F4188790](v61);
  uint64_t v65 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758B8);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v64 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758C0);
  uint64_t v57 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v62 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758C8);
  uint64_t v54 = *(void *)(v10 - 8);
  uint64_t v55 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758D0);
  uint64_t v53 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96758D8);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  uint64_t v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_1A56A0368();
  uint64_t v21 = v68;
  sub_1A56D61A8();
  if (v21) {
    goto LABEL_6;
  }
  uint64_t v49 = v13;
  uint64_t v50 = v15;
  uint64_t v22 = v12;
  uint64_t v24 = v64;
  char v23 = v65;
  uint64_t v25 = v66;
  uint64_t v68 = v16;
  uint64_t v26 = v19;
  uint64_t v27 = sub_1A56D5D78();
  if (*(void *)(v27 + 16) != 1)
  {
    uint64_t v34 = sub_1A56D5A78();
    swift_allocError();
    uint64_t v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
    *uint64_t v36 = &type metadata for SFShockwaveEffectState;
    uint64_t v37 = v68;
    sub_1A56D5C98();
    sub_1A56D5A68();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v36, *MEMORY[0x1E4FBBA70], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v37);
LABEL_6:
    uint64_t v32 = (uint64_t)v67;
    return __swift_destroy_boxed_opaque_existential_0Tm(v32);
  }
  char v28 = *(unsigned char *)(v27 + 32);
  switch(v28)
  {
    case 1:
      char v70 = 1;
      sub_1A56A050C();
      uint64_t v39 = v68;
      sub_1A56D5C88();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v22, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v39);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      break;
    case 2:
      char v40 = *(unsigned char *)(v27 + 32);
      char v71 = 2;
      sub_1A56A04B8();
      uint64_t v41 = v62;
      uint64_t v42 = v68;
      sub_1A56D5C88();
      uint64_t v44 = v57;
      uint64_t v43 = v58;
      goto LABEL_11;
    case 3:
      char v40 = *(unsigned char *)(v27 + 32);
      char v72 = 3;
      sub_1A56A0464();
      uint64_t v41 = v24;
      uint64_t v42 = v68;
      sub_1A56D5C88();
      uint64_t v44 = v59;
      uint64_t v43 = v60;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v42);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = v40;
      break;
    case 4:
      char v45 = *(unsigned char *)(v27 + 32);
      char v73 = 4;
      sub_1A56A0410();
      uint64_t v46 = v68;
      sub_1A56D5C88();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v23, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v46);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = v45;
      break;
    case 5:
      uint64_t v65 = (char *)*(unsigned __int8 *)(v27 + 32);
      char v74 = 5;
      sub_1A56A03BC();
      uint64_t v47 = v68;
      sub_1A56D5C88();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v25, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v47);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = (char)v65;
      break;
    default:
      char v29 = *(unsigned char *)(v27 + 32);
      char v69 = 0;
      sub_1A56A0560();
      uint64_t v30 = v50;
      uint64_t v31 = v68;
      sub_1A56D5C88();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v30, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v31);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = v29;
      break;
  }
  *uint64_t v33 = v28;
  return __swift_destroy_boxed_opaque_existential_0Tm(v32);
}

unint64_t sub_1A56A0E88()
{
  unint64_t result = qword_1E96758E0;
  if (!qword_1E96758E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96758E0);
  }
  return result;
}

uint64_t sub_1A56A0EDC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SFShockwaveEffectState.init(from:)(a1, a2);
}

uint64_t sub_1A56A0EF4(void *a1)
{
  return SFShockwaveEffectState.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState()
{
  return &type metadata for SFShockwaveEffectState;
}

unsigned char *_s7Sharing22SFShockwaveEffectStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1A56A0FF0);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.CodingKeys()
{
  return &type metadata for SFShockwaveEffectState.CodingKeys;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.ConnectionHintCodingKeys()
{
  return &type metadata for SFShockwaveEffectState.ConnectionHintCodingKeys;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.ConnectionInterruptedCodingKeys()
{
  return &type metadata for SFShockwaveEffectState.ConnectionInterruptedCodingKeys;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.ShockwaveCodingKeys()
{
  return &type metadata for SFShockwaveEffectState.ShockwaveCodingKeys;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.WaitingToSettleCodingKeys()
{
  return &type metadata for SFShockwaveEffectState.WaitingToSettleCodingKeys;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.CleaningUpCodingKeys()
{
  return &type metadata for SFShockwaveEffectState.CleaningUpCodingKeys;
}

ValueMetadata *type metadata accessor for SFShockwaveEffectState.RemovedCodingKeys()
{
  return &type metadata for SFShockwaveEffectState.RemovedCodingKeys;
}

unint64_t sub_1A56A108C()
{
  unint64_t result = qword_1E96758E8;
  if (!qword_1E96758E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96758E8);
  }
  return result;
}

unint64_t sub_1A56A10E4()
{
  unint64_t result = qword_1E96758F0;
  if (!qword_1E96758F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96758F0);
  }
  return result;
}

unint64_t sub_1A56A113C()
{
  unint64_t result = qword_1E96758F8;
  if (!qword_1E96758F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96758F8);
  }
  return result;
}

unint64_t sub_1A56A1194()
{
  unint64_t result = qword_1E9675900;
  if (!qword_1E9675900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675900);
  }
  return result;
}

unint64_t sub_1A56A11EC()
{
  unint64_t result = qword_1E9675908;
  if (!qword_1E9675908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675908);
  }
  return result;
}

unint64_t sub_1A56A1244()
{
  unint64_t result = qword_1E9675910;
  if (!qword_1E9675910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675910);
  }
  return result;
}

unint64_t sub_1A56A129C()
{
  unint64_t result = qword_1E9675918;
  if (!qword_1E9675918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675918);
  }
  return result;
}

unint64_t sub_1A56A12F4()
{
  unint64_t result = qword_1E9675920;
  if (!qword_1E9675920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675920);
  }
  return result;
}

unint64_t sub_1A56A134C()
{
  unint64_t result = qword_1E9675928;
  if (!qword_1E9675928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675928);
  }
  return result;
}

unint64_t sub_1A56A13A4()
{
  unint64_t result = qword_1E9675930;
  if (!qword_1E9675930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675930);
  }
  return result;
}

unint64_t sub_1A56A13FC()
{
  unint64_t result = qword_1E9675938;
  if (!qword_1E9675938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675938);
  }
  return result;
}

unint64_t sub_1A56A1454()
{
  unint64_t result = qword_1E9675940;
  if (!qword_1E9675940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675940);
  }
  return result;
}

unint64_t sub_1A56A14AC()
{
  unint64_t result = qword_1E9675948;
  if (!qword_1E9675948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675948);
  }
  return result;
}

unint64_t sub_1A56A1504()
{
  unint64_t result = qword_1E9675950;
  if (!qword_1E9675950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675950);
  }
  return result;
}

unint64_t sub_1A56A155C()
{
  unint64_t result = qword_1E9675958;
  if (!qword_1E9675958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675958);
  }
  return result;
}

uint64_t sub_1A56A15B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x697463656E6E6F63 && a2 == 0xEE00746E69486E6FLL;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001A573CF30 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7661776B636F6873 && a2 == 0xE900000000000065 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x54676E6974696177 && a2 == 0xEF656C747465536FLL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x676E696E61656C63 && a2 == 0xEA00000000007055 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_1A56A188C()
{
  uint64_t v0 = sub_1A56D4D98();
  __swift_allocate_value_buffer(v0, qword_1E9675960);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9675960);
  if (qword_1E966C0B0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1E966C098);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t static SFAirDropReceive.PeerPayment.receiverMetadata(for:)()
{
  return 0;
}

uint64_t static SFAirDropReceive.PeerPayment.validateTransaction(for:)(uint64_t a1)
{
  uint64_t v2 = sub_1A56D4A28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E96703A0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A56D4D98();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1E9675960);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v8 = sub_1A56D4D78();
  os_log_type_t v9 = sub_1A56D57D8();
  if (os_log_type_enabled(v8, v9))
  {
    v18[2] = a1;
    uint64_t v10 = swift_slowAlloc();
    v18[1] = v7;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_1A56A1D40();
    uint64_t v13 = sub_1A56D5E78();
    v18[3] = sub_1A54E3290(v13, v14, &v19);
    sub_1A56D5928();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl(&dword_1A5389000, v8, v9, "PeerPayment: validating transaction for transactionURL: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v12, -1, -1);
    MEMORY[0x1A626CE20](v11, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  uint64_t v15 = sub_1A56D4A38();
  sub_1A54EA09C(v15, v16);
  return 1;
}

unint64_t sub_1A56A1D40()
{
  unint64_t result = qword_1E96715A0;
  if (!qword_1E96715A0)
  {
    sub_1A56D4A28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96715A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SFAirDropReceive.PeerPayment()
{
  return &type metadata for SFAirDropReceive.PeerPayment;
}

unint64_t static SFMoveToAppShareSheetSettings.encodedFiles.getter()
{
  return 0xD000000000000011;
}

Sharing::SFMoveToAppShareSheetSettings_optional __swiftcall SFMoveToAppShareSheetSettings.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (Sharing::SFMoveToAppShareSheetSettings_optional)rawValue;
}

uint64_t SFMoveToAppShareSheetSettings.rawValue.getter()
{
  return *v0;
}

uint64_t static SFAirDropInvocations.MoveToAppShareSheet.supportsSecureCoding.getter()
{
  return 1;
}

id SFAirDropInvocations.MoveToAppShareSheet.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR___SFXPCInvocation_name];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for SFXPCInvocation();
  return objc_msgSendSuper2(&v8, sel_init);
}

id SFAirDropInvocations.MoveToAppShareSheet.init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR___SFXPCInvocation_name];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for SFXPCInvocation();
  return objc_msgSendSuper2(&v5, sel_init);
}

id SFAirDropInvocations.MoveToAppShareSheet.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SFAirDropInvocations.MoveToAppShareSheet.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SFAirDropInvocations.MoveToAppShareSheet.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_1A55B2384(a1);

  return v4;
}

id SFAirDropInvocations.MoveToAppShareSheet.init(coder:)(void *a1)
{
  id v2 = sub_1A55B2384(a1);

  return v2;
}

id SFAirDropInvocations.MoveToAppShareSheet.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1A56A2044()
{
  unint64_t result = qword_1E9675978;
  if (!qword_1E9675978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675978);
  }
  return result;
}

uint64_t sub_1A56A2098()
{
  return MEMORY[0x1E4FBB3B0];
}

uint64_t sub_1A56A20A4()
{
  return MEMORY[0x1E4FBB398];
}

unsigned char *storeEnumTagSinglePayload for SFMoveToAppShareSheetSettings(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56A217CLL);
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

ValueMetadata *type metadata accessor for SFMoveToAppShareSheetSettings()
{
  return &type metadata for SFMoveToAppShareSheetSettings;
}

uint64_t type metadata accessor for SFAirDropInvocations.MoveToAppShareSheet()
{
  return self;
}

uint64_t sub_1A56A21D8()
{
  uint64_t v0 = sub_1A56D4D98();
  __swift_allocate_value_buffer(v0, qword_1E9675980);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9675980);
  if (qword_1E9670330 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9672A90);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_1A56A2368(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  sub_1A56D50D8();
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_1A56A2480(id a1)
{
  aBlock[6] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_isAttemptingRepair))
  {
    if (qword_1E96703A8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1A56D4D98();
    __swift_project_value_buffer(v3, (uint64_t)qword_1E9675980);
    uint64_t v41 = a1;
    id v4 = sub_1A56D4D78();
    os_log_type_t v5 = sub_1A56D57D8();
    if (os_log_type_enabled(v4, v5))
    {
      unsigned int v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      aBlock[0] = v7;
      *(_DWORD *)unsigned int v6 = 136315138;
      id v8 = [v41 bleDevice];
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759B0);
      uint64_t v9 = sub_1A56D5138();
      *(void *)&long long v43 = sub_1A54E3290(v9, v10, aBlock);
      sub_1A56D5928();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A5389000, v4, v5, "Ignoring proximity Repair with another %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A626CE20](v7, -1, -1);
      uint64_t v11 = v6;
      goto LABEL_36;
    }

    goto LABEL_14;
  }
  uint64_t v12 = v1;
  if ((objc_msgSend(a1, sel_problemFlags) & 0x10000) == 0)
  {
    id v13 = objc_msgSend(a1, sel_model);
    if (v13)
    {
      unint64_t v14 = v13;
      sub_1A56D50D8();
    }
    if ((objc_msgSend(a1, sel_problemFlags) & 0x10) != 0)
    {
      char v18 = sub_1A56D5238();
      swift_bridgeObjectRelease();
      if (v18)
      {
        LODWORD(v43) = 0;
        uint64_t v19 = WiFiCopyCurrentNetworkInfoEx();
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          aBlock[0] = 0;
          sub_1A56D4FC8();
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (!SFDeviceRepairSessionProblemCanFixSilently((int)objc_msgSend(a1, sel_problemFlags)))
    {
      if (qword_1E96703A8 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_1A56D4D98();
      __swift_project_value_buffer(v32, (uint64_t)qword_1E9675980);
      id v4 = sub_1A56D4D78();
      os_log_type_t v33 = sub_1A56D57D8();
      if (!os_log_type_enabled(v4, v33)) {
        goto LABEL_37;
      }
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_1A5389000, v4, v33, "Ignoring device that has problems that are not silently fixable", v34, 2u);
      uint64_t v11 = v34;
LABEL_36:
      MEMORY[0x1A626CE20](v11, -1, -1);
LABEL_37:

      return;
    }
    uint64_t v21 = OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession;
    uint64_t v22 = *(void **)(v12 + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession);
    if (v22) {
      objc_msgSend(v22, sel_invalidate);
    }
    id v23 = objc_msgSend(objc_allocWithZone((Class)SFDeviceRepairSession), sel_init);
    objc_msgSend(v23, sel_setPeerDevice_, a1);
    uint64_t v24 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_1A56A372C;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1A56A34F4;
    aBlock[3] = (uint64_t)&block_descriptor_10;
    uint64_t v25 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v23, sel_setProgressHandler_, v25);
    _Block_release(v25);
    id v26 = objc_msgSend(a1, sel_bleDevice);
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = objc_msgSend(v26, sel_foundTicks);

      if (v28)
      {
        if (mach_absolute_time() < (unint64_t)v28)
        {
          __break(1u);
          goto LABEL_49;
        }
        objc_msgSend(v23, sel_setTriggerMs_, UpTicksToMicroseconds());
      }
    }
    id v29 = objc_msgSend(self, sel_sharedInstance);
    uint64_t v30 = (void *)sub_1A56D5098();
    id v31 = objc_msgSend(v29, sel_objectForKey_, v30);

    if (v31)
    {
      sub_1A56D5968();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
    sub_1A54E3E90((uint64_t)&v43, (uint64_t)aBlock);
    sub_1A553E364((uint64_t)aBlock, (uint64_t)&v43);
    if (!*((void *)&v44 + 1))
    {
      sub_1A553E2C0((uint64_t)&v43);
      goto LABEL_48;
    }
    sub_1A56A374C();
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_48:
      uint64_t v39 = *(void **)(v12 + v21);
      *(void *)(v12 + v21) = v23;
      id v40 = v23;

      objc_msgSend(v40, sel_activate);
      sub_1A553E2C0((uint64_t)aBlock);
      return;
    }
    id v28 = v42;
    if (!objc_msgSend(v42, sel_BOOLValue))
    {
LABEL_46:

      goto LABEL_48;
    }
    if (qword_1E96703A8 == -1)
    {
LABEL_43:
      uint64_t v35 = sub_1A56D4D98();
      __swift_project_value_buffer(v35, (uint64_t)qword_1E9675980);
      uint64_t v36 = sub_1A56D4D78();
      os_log_type_t v37 = sub_1A56D57D8();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_1A5389000, v36, v37, "Disabling silent auth due to server bag value", v38, 2u);
        MEMORY[0x1A626CE20](v38, -1, -1);
      }

      objc_msgSend(v23, sel_setDisableSilentAuth_, 1);
      goto LABEL_46;
    }
LABEL_49:
    swift_once();
    goto LABEL_43;
  }
  if (qword_1E96703A8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1A56D4D98();
  __swift_project_value_buffer(v15, (uint64_t)qword_1E9675980);
  uint64_t v41 = sub_1A56D4D78();
  os_log_type_t v16 = sub_1A56D57D8();
  if (os_log_type_enabled(v41, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1A5389000, v41, v16, "Ignoring proximity repair for WiFi 802.1x (needs user)", v17, 2u);
    MEMORY[0x1A626CE20](v17, -1, -1);
  }
LABEL_14:
}

void sub_1A56A2D98(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1A626CEF0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    sub_1A56A2E08(a1, a2);
  }
}

void sub_1A56A2E08(int a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_1E96703A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A56D4D98();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E9675980);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1A56D4D78();
  os_log_type_t v8 = sub_1A56D57D8();
  if (!os_log_type_enabled(v7, v8))
  {

    swift_bridgeObjectRelease_n();
    if (a1 != 20) {
      goto LABEL_5;
    }
LABEL_14:
    id v26 = sub_1A56D4D78();
    os_log_type_t v27 = sub_1A56D57D8();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_1A5389000, v26, v27, "Repair finalized", v28, 2u);
      MEMORY[0x1A626CE20](v28, -1, -1);
    }

    return;
  }
  uint64_t v9 = swift_slowAlloc();
  uint64_t v10 = swift_slowAlloc();
  v50[0] = v10;
  *(_DWORD *)uint64_t v9 = 136315394;
  LODWORD(v53) = a1;
  type metadata accessor for SFDeviceSetupProgressEvent(0);
  uint64_t v11 = sub_1A56D5138();
  *(void *)&long long v53 = sub_1A54E3290(v11, v12, v50);
  sub_1A56D5928();
  swift_bridgeObjectRelease();
  *(_WORD *)(v9 + 12) = 2080;
  *(void *)&long long v53 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759C0);
  uint64_t v13 = sub_1A56D5138();
  *(void *)&long long v53 = sub_1A54E3290(v13, v14, v50);
  sub_1A56D5928();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1A5389000, v7, v8, "Repair silent progress: %s %s", (uint8_t *)v9, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x1A626CE20](v10, -1, -1);
  MEMORY[0x1A626CE20](v9, -1, -1);

  if (a1 == 20) {
    goto LABEL_14;
  }
LABEL_5:
  if (a1 != 96)
  {
    if (a1 != 30) {
      return;
    }
    uint64_t v15 = OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession;
    os_log_type_t v16 = *(void **)&v3[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession];
    if (!v16) {
      goto LABEL_30;
    }
    id v17 = objc_msgSend(v16, sel_peerDevice);
    if (v17)
    {
      char v18 = v17;
      uint64_t v19 = *(void **)&v3[v15];
      if (v19)
      {
        id v20 = objc_msgSend(v19, sel_idsIdentifier);
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = sub_1A56D50D8();
          uint64_t v24 = v23;

          uint64_t v25 = *(void (**)(void *, uint64_t, uint64_t))&v3[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler];
          if (v25)
          {
            swift_retain();
            v25(v18, v22, v24);

            sub_1A54F5EA8((uint64_t)v25);
            swift_bridgeObjectRelease();
            goto LABEL_28;
          }
          swift_bridgeObjectRelease();
        }
      }
    }
LABEL_28:
    id v40 = *(void **)&v3[v15];
    if (v40)
    {
      objc_msgSend(v40, sel_invalidate);
      uint64_t v41 = *(void **)&v3[v15];
LABEL_31:
      *(void *)&v3[v15] = 0;

      if (a2)
      {
        v51[0] = 28517;
        v51[1] = 0xE200000000000000;
        sub_1A56D59F8();
        if (*(void *)(a2 + 16) && (unint64_t v42 = sub_1A54F3F08((uint64_t)v50), (v43 & 1) != 0))
        {
          sub_1A54E3F20(*(void *)(a2 + 56) + 32 * v42, (uint64_t)&v53);
        }
        else
        {
          long long v53 = 0u;
          long long v54 = 0u;
        }
        sub_1A54F5360((uint64_t)v50);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      sub_1A553E364((uint64_t)&v53, (uint64_t)v50);
      long long v44 = sub_1A56D4D78();
      os_log_type_t v45 = sub_1A56D57B8();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        uint64_t v52 = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        sub_1A553E364((uint64_t)v50, (uint64_t)v51);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB9F0);
        uint64_t v48 = sub_1A56D5138();
        v51[0] = sub_1A54E3290(v48, v49, &v52);
        sub_1A56D5928();
        swift_bridgeObjectRelease();
        sub_1A553E2C0((uint64_t)v50);
        _os_log_impl(&dword_1A5389000, v44, v45, "Repair silent done: %s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A626CE20](v47, -1, -1);
        MEMORY[0x1A626CE20](v46, -1, -1);
      }
      else
      {

        sub_1A553E2C0((uint64_t)v50);
      }
      sub_1A553E2C0((uint64_t)&v53);
      return;
    }
LABEL_30:
    uint64_t v41 = 0;
    goto LABEL_31;
  }
  id v29 = v3;
  uint64_t v30 = sub_1A56D4D78();
  os_log_type_t v31 = sub_1A56D57D8();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v50[0] = v33;
    *(_DWORD *)uint64_t v32 = 136315138;
    id v34 = *(id *)&v29[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession];
    if (v34) {
      id v34 = objc_msgSend(v34, sel_peerDevice);
    }
    *(void *)&long long v53 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759B8);
    uint64_t v35 = sub_1A56D5138();
    *(void *)&long long v53 = sub_1A54E3290(v35, v36, v50);
    sub_1A56D5928();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A5389000, v30, v31, "Repair completed: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v33, -1, -1);
    MEMORY[0x1A626CE20](v32, -1, -1);
  }
  else
  {
  }
  uint64_t v37 = OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession;
  uint64_t v38 = *(void **)&v29[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession];
  if (v38)
  {
    objc_msgSend(v38, sel_invalidate);
    uint64_t v39 = *(void **)&v29[v37];
  }
  else
  {
    uint64_t v39 = 0;
  }
  *(void *)&v29[v37] = 0;

  v29[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_isAttemptingRepair] = 0;
}

uint64_t sub_1A56A34F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = sub_1A56D4FD8();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SFCommunalDeviceRepairManager()
{
  return self;
}

BOOL SFDeviceRepairSessionProblemCanFixSilently(int a1)
{
  return (*(void *)&a1 & 0x22001ELL) != 0;
}

uint64_t sub_1A56A36F4()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

void sub_1A56A372C(int a1, uint64_t a2)
{
  sub_1A56A2D98(a1, a2, v2);
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

unint64_t sub_1A56A374C()
{
  unint64_t result = qword_1E9675570;
  if (!qword_1E9675570)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9675570);
  }
  return result;
}

uint64_t sub_1A56A378C()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

void sub_1A56A37C4(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  id v4 = (id)sub_1A56D5098();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);
}

uint64_t sub_1A56A383C(uint64_t a1)
{
  unint64_t v2 = sub_1A56A653C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56A3878(uint64_t a1)
{
  unint64_t v2 = sub_1A56A653C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56A38B4(uint64_t a1)
{
  unint64_t v2 = sub_1A56A6590();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56A38F0(uint64_t a1)
{
  unint64_t v2 = sub_1A56A6590();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56A392C(uint64_t a1)
{
  unint64_t v2 = sub_1A56A65E4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56A3968(uint64_t a1)
{
  unint64_t v2 = sub_1A56A65E4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDropReceive.Transfer.Metrics.TransferResult.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759C8);
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x1F4188790](v2);
  id v26 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v25 = (uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759D0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  MEMORY[0x1F4188790](v10 - 8);
  unint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759D8);
  uint64_t v13 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56A653C();
  sub_1A56D61D8();
  sub_1A56A675C(v29, (uint64_t)v12, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
  {
    char v31 = 0;
    sub_1A56A65E4();
    uint64_t v16 = v30;
    sub_1A56D5D98();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  }
  else
  {
    uint64_t v18 = v25;
    sub_1A56A6680((uint64_t)v12, v25, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
    char v32 = 1;
    sub_1A56A6590();
    uint64_t v19 = v26;
    uint64_t v20 = v30;
    sub_1A56D5D98();
    sub_1A56A6638(&qword_1E9670E60, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Failure);
    uint64_t v21 = v28;
    sub_1A56D5E38();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v21);
    sub_1A56A67C4(v18, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  }
}

uint64_t SFAirDropReceive.Transfer.Metrics.TransferResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96759F8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  uint64_t v37 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v41 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675A00);
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  MEMORY[0x1F4188790](v6);
  id v40 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675A08);
  uint64_t v39 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v31 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56A653C();
  id v17 = v42;
  sub_1A56D61A8();
  if (!v17)
  {
    char v32 = v14;
    uint64_t v33 = v16;
    uint64_t v18 = v40;
    uint64_t v19 = v41;
    unint64_t v42 = a1;
    uint64_t v20 = sub_1A56D5D78();
    if (*(void *)(v20 + 16) == 1)
    {
      a1 = v42;
      if (*(unsigned char *)(v20 + 32))
      {
        id v40 = (char *)v20;
        char v44 = 1;
        sub_1A56A6590();
        uint64_t v21 = v19;
        sub_1A56D5C88();
        uint64_t v26 = type metadata accessor for SFAirDropReceive.Failure();
        sub_1A56A6638(&qword_1E9671008, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Failure);
        uint64_t v27 = (uint64_t)v32;
        uint64_t v28 = v36;
        sub_1A56D5D48();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v21, v28);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
        a1 = v42;
        uint64_t v29 = (uint64_t)v33;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v27, 0, 1, v26);
        sub_1A56A6680(v27, v29, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
      }
      else
      {
        char v43 = 0;
        sub_1A56A65E4();
        sub_1A56D5C88();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
        uint64_t v30 = type metadata accessor for SFAirDropReceive.Failure();
        uint64_t v29 = (uint64_t)v33;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v33, 1, 1, v30);
      }
      sub_1A56A6680(v29, v38, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
    }
    else
    {
      uint64_t v22 = sub_1A56D5A78();
      swift_allocError();
      uint64_t v24 = v23;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
      *uint64_t v24 = v11;
      sub_1A56D5C98();
      sub_1A56D5A68();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x1E4FBBA70], v22);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
      a1 = v42;
    }
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
}

uint64_t sub_1A56A4428@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDropReceive.Transfer.Metrics.TransferResult.init(from:)(a1, a2);
}

uint64_t sub_1A56A4440(void *a1)
{
  return SFAirDropReceive.Transfer.Metrics.TransferResult.encode(to:)(a1);
}

uint64_t SFAirDropReceive.Transfer.Metrics.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1A56D4C28();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t SFAirDropReceive.Transfer.Metrics.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  return sub_1A54F60EC(v1 + *(int *)(v3 + 20), a1, &qword_1E9671108);
}

uint64_t SFAirDropReceive.Transfer.Metrics.endDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  return sub_1A566BD28(a1, v1 + *(int *)(v3 + 20), &qword_1E9671108);
}

uint64_t (*SFAirDropReceive.Transfer.Metrics.endDate.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDropReceive.Transfer.Metrics.sensitive.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SFAirDropReceive.Transfer.Metrics(0) + 24));
}

uint64_t SFAirDropReceive.Transfer.Metrics.sensitive.setter(char a1)
{
  uint64_t result = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*SFAirDropReceive.Transfer.Metrics.sensitive.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDropReceive.Transfer.Metrics.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  return sub_1A54F60EC(v1 + *(int *)(v3 + 28), a1, &qword_1E9671118);
}

uint64_t SFAirDropReceive.Transfer.Metrics.result.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  return sub_1A566BD28(a1, v1 + *(int *)(v3 + 28), &qword_1E9671118);
}

uint64_t (*SFAirDropReceive.Transfer.Metrics.result.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDropReceive.Transfer.Metrics.init(startDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  uint64_t v5 = a2 + v4[5];
  uint64_t v6 = sub_1A56D4C28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v8(v5, 1, 1, v6);
  uint64_t v9 = v4[6];
  *(unsigned char *)(a2 + v9) = 2;
  uint64_t v10 = a2 + v4[7];
  uint64_t v11 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))v13)((void *)(v11 - 8), v10, 1, 1, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a2, a1, v6);
  sub_1A54E4D44(v5, &qword_1E9671108);
  v8(v5, 1, 1, v6);
  *(unsigned char *)(a2 + v9) = 2;
  sub_1A54E4D44(v10, &qword_1E9671118);

  return v13(v10, 1, 1, v11);
}

uint64_t SFAirDropReceive.Transfer.Metrics.description.getter()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_1A56D4AA8();
  uint64_t v63 = *(char **)(v2 - 8);
  uint64_t v64 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A56D4AC8();
  uint64_t v61 = *(void *)(v5 - 8);
  uint64_t v62 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674B90);
  uint64_t v8 = MEMORY[0x1F4188790](v60);
  uint64_t v59 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v56 = (char *)&v54 - v10;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9672AC0);
  uint64_t v11 = MEMORY[0x1F4188790](v57);
  uint64_t v58 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v54 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
  MEMORY[0x1F4188790](v15 - 8);
  id v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1A56D4C28();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v54 - v23;
  uint64_t v65 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  sub_1A54F60EC(v1 + *(int *)(v65 + 20), (uint64_t)v17, &qword_1E9671108);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
  {
    uint64_t v55 = v14;
    uint64_t v25 = v19;
    unint64_t v26 = v19 + 32;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    v27(v24, v17, v18);
    if ((sub_1A56D4B08() & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v24, v18);
      goto LABEL_8;
    }
    uint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v25 + 16);
    uint64_t v64 = v1;
    v28(v22, v1, v18);
    sub_1A56A6638(&qword_1E9674B98, MEMORY[0x1E4F27928]);
    int64_t v29 = v18;
    if (sub_1A56D5028())
    {
      uint64_t v31 = v60;
      uint64_t v32 = *(int *)(v60 + 48);
      uint64_t v62 = v25;
      uint64_t v33 = v56;
      uint64_t v34 = &v56[v32];
      v27(v56, v22, v18);
      uint64_t v35 = v34;
      uint64_t v63 = v24;
      v28(v34, (unint64_t)v24, v18);
      uint64_t v36 = *(int *)(v31 + 48);
      uint64_t v37 = v59;
      uint64_t v38 = &v59[v36];
      v28(v59, (unint64_t)v33, v18);
      v28(v38, (unint64_t)v35, v18);
      uint64_t v39 = (uint64_t)v58;
      v27(v58, v37, v18);
      id v40 = *(void (**)(char *, uint64_t))(v62 + 8);
      v40(v38, v18);
      uint64_t v41 = &v37[*(int *)(v60 + 48)];
      v27(v37, v33, v18);
      v27(v41, v35, v18);
      v27((char *)(v39 + *(int *)(v57 + 36)), v41, v18);
      uint64_t v22 = (char *)v40;
      v40(v37, v18);
      sub_1A566BD8C(v39, (uint64_t)v55);
      uint64_t v67 = 0x203A656D6974;
      unint64_t v68 = 0xE600000000000000;
      sub_1A55D8CA0();
      sub_1A56D5788();
      sub_1A56D51C8();
      swift_bridgeObjectRelease();
      uint64_t v25 = v67;
      unint64_t v26 = v68;
      uint64_t v28 = (void (*)(char *, unint64_t, uint64_t))sub_1A54E2784(0, 1, 1, MEMORY[0x1E4FBC860]);
      unint64_t v1 = *((void *)v28 + 2);
      unint64_t v30 = *((void *)v28 + 3);
      int64_t v29 = v1 + 1;
      if (v1 < v30 >> 1)
      {
LABEL_6:
        *((void *)v28 + 2) = v29;
        unint64_t v42 = (void *)((char *)v28 + 16 * v1);
        v42[4] = v25;
        v42[5] = v26;
        sub_1A54E4D44((uint64_t)v55, &qword_1E9672AC0);
        ((void (*)(char *, uint64_t))v22)(v63, v18);
        unint64_t v1 = v64;
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v28 = (void (*)(char *, unint64_t, uint64_t))sub_1A54E2784((void *)(v30 > 1), v29, 1, v28);
    goto LABEL_6;
  }
  sub_1A54E4D44((uint64_t)v17, &qword_1E9671108);
LABEL_8:
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  sub_1A56D5A28();
  swift_bridgeObjectRelease();
  uint64_t v67 = 0x203A656D6974;
  unint64_t v68 = 0xE600000000000000;
  sub_1A56D4AB8();
  sub_1A56D4A98();
  sub_1A56D4BF8();
  (*((void (**)(char *, uint64_t))v63 + 1))(v4, v64);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v7, v62);
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  uint64_t v43 = v67;
  unint64_t v44 = v68;
  uint64_t v28 = (void (*)(char *, unint64_t, uint64_t))sub_1A54E2784(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v46 = *((void *)v28 + 2);
  unint64_t v45 = *((void *)v28 + 3);
  if (v46 >= v45 >> 1) {
    uint64_t v28 = (void (*)(char *, unint64_t, uint64_t))sub_1A54E2784((void *)(v45 > 1), v46 + 1, 1, v28);
  }
  *((void *)v28 + 2) = v46 + 1;
  uint64_t v47 = (void *)((char *)v28 + 16 * v46);
  v47[4] = v43;
  v47[5] = v44;
LABEL_11:
  if (*(unsigned char *)(v1 + *(int *)(v65 + 24)) != 2)
  {
    uint64_t v67 = 0x76697469736E6573;
    unint64_t v68 = 0xEB00000000203A65;
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    uint64_t v48 = v67;
    unint64_t v49 = v68;
    unint64_t v51 = *((void *)v28 + 2);
    unint64_t v50 = *((void *)v28 + 3);
    if (v51 >= v50 >> 1) {
      uint64_t v28 = (void (*)(char *, unint64_t, uint64_t))sub_1A54E2784((void *)(v50 > 1), v51 + 1, 1, v28);
    }
    *((void *)v28 + 2) = v51 + 1;
    uint64_t v52 = (void *)((char *)v28 + 16 * v51);
    v52[4] = v48;
    v52[5] = v49;
  }
  uint64_t v67 = 123;
  unint64_t v68 = 0xE100000000000000;
  uint64_t v66 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C528);
  sub_1A54F3948();
  sub_1A56D5018();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  return v67;
}

uint64_t sub_1A56A5110()
{
  uint64_t result = 0x7461447472617473;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x65746144646E65;
      break;
    case 2:
      uint64_t result = 0x76697469736E6573;
      break;
    case 3:
      uint64_t result = 0x746C75736572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A56A519C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56A9CE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56A51C4(uint64_t a1)
{
  unint64_t v2 = sub_1A56A6708();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56A5200(uint64_t a1)
{
  unint64_t v2 = sub_1A56A6708();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDropReceive.Transfer.Metrics.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675A10);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56A6708();
  sub_1A56D61D8();
  char v12 = 0;
  sub_1A56D4C28();
  sub_1A56A6638(&qword_1E9670478, MEMORY[0x1E4F27928]);
  sub_1A56D5E38();
  if (!v1)
  {
    type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
    char v11 = 1;
    sub_1A56D5DD8();
    char v10 = 2;
    sub_1A56D5DB8();
    char v9 = 3;
    type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
    sub_1A56A6638(&qword_1E9675A20, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
    sub_1A56D5DD8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SFAirDropReceive.Transfer.Metrics.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v31 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v34 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A56D4C28();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v36 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675A28);
  uint64_t v32 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  char v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  uint64_t v13 = (int *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (uint64_t)&v15[v13[7]];
  uint64_t v33 = v8;
  id v17 = *(void (**)(void))(v8 + 56);
  uint64_t v38 = v16;
  v17();
  uint64_t v18 = v13[8];
  v15[v18] = 2;
  uint64_t v19 = (uint64_t)&v15[v13[9]];
  uint64_t v20 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  uint64_t v39 = v19;
  v21(v19, 1, 1, v20);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56A6708();
  uint64_t v37 = v11;
  uint64_t v22 = (uint64_t)v40;
  sub_1A56D61A8();
  if (v22)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    uint64_t v25 = v39;
    sub_1A54E4D44(v38, &qword_1E9671108);
    return sub_1A54E4D44(v25, &qword_1E9671118);
  }
  else
  {
    v28[1] = v20;
    uint64_t v29 = v18;
    uint64_t v23 = v33;
    uint64_t v24 = (uint64_t)v34;
    id v40 = a1;
    char v44 = 0;
    sub_1A56A6638(&qword_1E9670500, MEMORY[0x1E4F27928]);
    sub_1A56D5D48();
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v15, v36, v7);
    char v43 = 1;
    sub_1A56D5CE8();
    sub_1A566BD28(v24, v38, &qword_1E9671108);
    char v42 = 2;
    v15[v29] = sub_1A56D5CB8();
    char v41 = 3;
    sub_1A56A6638(&qword_1E9675A30, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
    uint64_t v26 = (uint64_t)v31;
    sub_1A56D5CE8();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v37, v35);
    sub_1A566BD28(v26, v39, &qword_1E9671118);
    sub_1A56A675C((uint64_t)v15, v30, type metadata accessor for SFAirDropReceive.Transfer.Metrics);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
    return sub_1A56A67C4((uint64_t)v15, type metadata accessor for SFAirDropReceive.Transfer.Metrics);
  }
}

uint64_t sub_1A56A5A68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDropReceive.Transfer.Metrics.init(from:)(a1, a2);
}

uint64_t sub_1A56A5A80(void *a1)
{
  return SFAirDropReceive.Transfer.Metrics.encode(to:)(a1);
}

uint64_t _s7Sharing16SFAirDropReceiveO8TransferV7MetricsV0E6ResultO2eeoiySbAI_AItFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675A90);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_1A56A675C(a1, (uint64_t)v14, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
  sub_1A56A675C(a2, v15, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    sub_1A56A675C((uint64_t)v14, (uint64_t)v10, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
    if (v16(v15, 1, v4) != 1)
    {
      sub_1A56A6680(v15, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      char v17 = _s7Sharing16SFAirDropReceiveO7FailureO2eeoiySbAE_AEtFZ_0((uint64_t)v10, (uint64_t)v7);
      sub_1A56A67C4((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      sub_1A56A67C4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      sub_1A56A67C4((uint64_t)v14, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
      return v17 & 1;
    }
    sub_1A56A67C4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_1A54E4D44((uint64_t)v14, &qword_1E9675A90);
    char v17 = 0;
    return v17 & 1;
  }
  sub_1A56A67C4((uint64_t)v14, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
  char v17 = 1;
  return v17 & 1;
}

BOOL _s7Sharing16SFAirDropReceiveO8TransferV7MetricsV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v61 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v59 = (uint64_t)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675A98);
  MEMORY[0x1F4188790](v60);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v65 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v63 = (char *)&v53 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v64 = (char *)&v53 - v13;
  uint64_t v14 = sub_1A56D4C28();
  uint64_t v66 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v62 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9674C30);
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  uint64_t v25 = (char *)&v53 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)&v53 - v26;
  if ((sub_1A56D4BD8() & 1) == 0) {
    return 0;
  }
  uint64_t v57 = v4;
  uint64_t v58 = v7;
  uint64_t v28 = type metadata accessor for SFAirDropReceive.Transfer.Metrics(0);
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v55 = a1;
  sub_1A54F60EC(a1 + v29, (uint64_t)v27, &qword_1E9671108);
  uint64_t v54 = v28;
  uint64_t v30 = *(int *)(v28 + 20);
  uint64_t v56 = a2;
  sub_1A54F60EC(a2 + v30, (uint64_t)v25, &qword_1E9671108);
  uint64_t v31 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_1A54F60EC((uint64_t)v27, (uint64_t)v18, &qword_1E9671108);
  sub_1A54F60EC((uint64_t)v25, v31, &qword_1E9671108);
  uint64_t v32 = v66;
  uint64_t v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48);
  if (v33((uint64_t)v18, 1, v14) == 1)
  {
    sub_1A54E4D44((uint64_t)v25, &qword_1E9671108);
    sub_1A54E4D44((uint64_t)v27, &qword_1E9671108);
    if (v33(v31, 1, v14) == 1)
    {
      sub_1A54E4D44((uint64_t)v18, &qword_1E9671108);
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v34 = &qword_1E9674C30;
LABEL_8:
    sub_1A54E4D44((uint64_t)v18, v34);
    return 0;
  }
  sub_1A54F60EC((uint64_t)v18, (uint64_t)v22, &qword_1E9671108);
  if (v33(v31, 1, v14) == 1)
  {
    sub_1A54E4D44((uint64_t)v25, &qword_1E9671108);
    sub_1A54E4D44((uint64_t)v27, &qword_1E9671108);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v14);
    goto LABEL_7;
  }
  uint64_t v36 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(v62, v31, v14);
  sub_1A56A6638(&qword_1E9674C38, MEMORY[0x1E4F27928]);
  char v37 = sub_1A56D5058();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v32 + 8);
  v38(v36, v14);
  sub_1A54E4D44((uint64_t)v25, &qword_1E9671108);
  sub_1A54E4D44((uint64_t)v27, &qword_1E9671108);
  v38(v22, v14);
  sub_1A54E4D44((uint64_t)v18, &qword_1E9671108);
  if ((v37 & 1) == 0) {
    return 0;
  }
LABEL_12:
  uint64_t v39 = v54;
  uint64_t v40 = *(int *)(v54 + 24);
  int v41 = *(unsigned __int8 *)(v55 + v40);
  uint64_t v42 = v56;
  int v43 = *(unsigned __int8 *)(v56 + v40);
  if (v41 == 2)
  {
    uint64_t v44 = v57;
    uint64_t v18 = v58;
    uint64_t v46 = (uint64_t)v64;
    uint64_t v45 = (uint64_t)v65;
    uint64_t v47 = (uint64_t)v63;
    if (v43 != 2) {
      return 0;
    }
    goto LABEL_17;
  }
  BOOL result = 0;
  BOOL v48 = (v41 & 1) == 0;
  uint64_t v44 = v57;
  uint64_t v18 = v58;
  uint64_t v46 = (uint64_t)v64;
  uint64_t v45 = (uint64_t)v65;
  uint64_t v47 = (uint64_t)v63;
  if (v43 != 2 && ((v48 ^ v43) & 1) != 0)
  {
LABEL_17:
    sub_1A54F60EC(v55 + *(int *)(v54 + 28), v46, &qword_1E9671118);
    sub_1A54F60EC(v42 + *(int *)(v39 + 28), v47, &qword_1E9671118);
    uint64_t v49 = (uint64_t)&v18[*(int *)(v60 + 48)];
    sub_1A54F60EC(v46, (uint64_t)v18, &qword_1E9671118);
    sub_1A54F60EC(v47, v49, &qword_1E9671118);
    unint64_t v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
    if (v50((uint64_t)v18, 1, v44) == 1)
    {
      sub_1A54E4D44(v47, &qword_1E9671118);
      sub_1A54E4D44(v46, &qword_1E9671118);
      if (v50(v49, 1, v44) == 1)
      {
        sub_1A54E4D44((uint64_t)v18, &qword_1E9671118);
        return 1;
      }
    }
    else
    {
      sub_1A54F60EC((uint64_t)v18, v45, &qword_1E9671118);
      if (v50(v49, 1, v44) != 1)
      {
        uint64_t v51 = v59;
        sub_1A56A6680(v49, v59, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
        char v52 = _s7Sharing16SFAirDropReceiveO8TransferV7MetricsV0E6ResultO2eeoiySbAI_AItFZ_0(v45, v51);
        sub_1A56A67C4(v51, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
        sub_1A54E4D44(v47, &qword_1E9671118);
        sub_1A54E4D44(v46, &qword_1E9671118);
        sub_1A56A67C4(v45, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
        sub_1A54E4D44((uint64_t)v18, &qword_1E9671118);
        return (v52 & 1) != 0;
      }
      sub_1A54E4D44(v47, &qword_1E9671118);
      sub_1A54E4D44(v46, &qword_1E9671118);
      sub_1A56A67C4(v45, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
    }
    uint64_t v34 = &qword_1E9675A98;
    goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966B288);
}

unint64_t sub_1A56A653C()
{
  unint64_t result = qword_1E96759E0;
  if (!qword_1E96759E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96759E0);
  }
  return result;
}

unint64_t sub_1A56A6590()
{
  unint64_t result = qword_1E96759E8;
  if (!qword_1E96759E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96759E8);
  }
  return result;
}

unint64_t sub_1A56A65E4()
{
  unint64_t result = qword_1E96759F0;
  if (!qword_1E96759F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96759F0);
  }
  return result;
}

uint64_t sub_1A56A6638(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A56A6680(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for SFAirDropReceive.Transfer.Metrics(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966B2A0);
}

unint64_t sub_1A56A6708()
{
  unint64_t result = qword_1E9675A18;
  if (!qword_1E9675A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A18);
  }
  return result;
}

uint64_t sub_1A56A675C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A56A67C4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *_s7MetricsVwCP(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A56D4C28();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = a3[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v10], 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9(v11, v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    uint64_t v15 = a3[7];
    a1[a3[6]] = a2[a3[6]];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      uint64_t v21 = type metadata accessor for SFAirDropReceive.Failure();
      uint64_t v22 = *(void *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v17, 1, v21))
      {
        memcpy(v16, v17, *(void *)(v19 + 64));
      }
      else
      {
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v29 = *((void *)v17 + 1);
          *(void *)uint64_t v16 = *(void *)v17;
          *((void *)v16 + 1) = v29;
          *((_OWORD *)v16 + 1) = *((_OWORD *)v17 + 1);
          uint64_t v30 = *((void *)v17 + 5);
          *((void *)v16 + 4) = *((void *)v17 + 4);
          *((void *)v16 + 5) = v30;
          *((void *)v16 + 6) = *((void *)v17 + 6);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v16, v17, *(void *)(v22 + 64));
        }
        else
        {
          uint64_t v24 = *((void *)v17 + 1);
          *(void *)uint64_t v16 = *(void *)v17;
          *((void *)v16 + 1) = v24;
          swift_bridgeObjectRetain();
          uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
          uint64_t v26 = &v16[v25];
          uint64_t v27 = &v17[v25];
          uint64_t v28 = sub_1A56D4A28();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
          swift_storeEnumTagMultiPayload();
        }
        (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v16, 0, 1, v21);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t _s7MetricsVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A56D4C28();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = type metadata accessor for SFAirDropReceive.Failure();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v8, 1, v11);
    if (!result)
    {
      uint64_t result = swift_getEnumCaseMultiPayload();
      if (result == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else if (!result)
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
        uint64_t v13 = sub_1A56D4A28();
        uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
        return v14(v12, v13);
      }
    }
  }
  return result;
}

uint64_t _s7MetricsVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4C28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2 + v9, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = type metadata accessor for SFAirDropReceive.Failure();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v15, 1, v19))
    {
      memcpy(v14, v15, *(void *)(v17 + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v27 = v15[1];
        *uint64_t v14 = *v15;
        v14[1] = v27;
        *((_OWORD *)v14 + 1) = *((_OWORD *)v15 + 1);
        uint64_t v28 = v15[5];
        v14[4] = v15[4];
        v14[5] = v28;
        v14[6] = v15[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(v14, v15, *(void *)(v20 + 64));
      }
      else
      {
        uint64_t v22 = v15[1];
        *uint64_t v14 = *v15;
        v14[1] = v22;
        swift_bridgeObjectRetain();
        uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
        uint64_t v24 = (char *)v14 + v23;
        uint64_t v25 = (char *)v15 + v23;
        uint64_t v26 = sub_1A56D4A28();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v14, 0, 1, v19);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t _s7MetricsVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4C28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v48 = a2;
  uint64_t v49 = a1;
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(v10, 1, v6);
  int v14 = v12(v11, 1, v6);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v10, v11, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  *(unsigned char *)(v49 + a3[6]) = *(unsigned char *)(v48 + a3[6]);
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(v49 + v16);
  uint64_t v18 = (void *)(v48 + v16);
  uint64_t v19 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v27 = type metadata accessor for SFAirDropReceive.Failure();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
      int v30 = v29(v17, 1, v27);
      int v31 = v29(v18, 1, v27);
      if (v30)
      {
        if (!v31)
        {
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload == 1)
          {
            *uint64_t v17 = *v18;
            v17[1] = v18[1];
            id v17[2] = v18[2];
            v17[3] = v18[3];
            v17[4] = v18[4];
            v17[5] = v18[5];
            v17[6] = v18[6];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_storeEnumTagMultiPayload();
          }
          else if (EnumCaseMultiPayload)
          {
            memcpy(v17, v18, *(void *)(v28 + 64));
          }
          else
          {
            *uint64_t v17 = *v18;
            v17[1] = v18[1];
            swift_bridgeObjectRetain();
            uint64_t v33 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
            uint64_t v34 = (char *)v17 + v33;
            uint64_t v35 = (char *)v18 + v33;
            uint64_t v36 = sub_1A56D4A28();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
            swift_storeEnumTagMultiPayload();
          }
          (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v17, 0, 1, v27);
          return v49;
        }
      }
      else
      {
        if (!v31)
        {
          if (v49 == v48) {
            return v49;
          }
          sub_1A56A67C4((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
          int v43 = swift_getEnumCaseMultiPayload();
          if (v43 == 1)
          {
            *uint64_t v17 = *v18;
            v17[1] = v18[1];
            id v17[2] = v18[2];
            v17[3] = v18[3];
            v17[4] = v18[4];
            v17[5] = v18[5];
            v17[6] = v18[6];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_storeEnumTagMultiPayload();
            return v49;
          }
          if (!v43)
          {
            *uint64_t v17 = *v18;
            v17[1] = v18[1];
            swift_bridgeObjectRetain();
            uint64_t v44 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
            uint64_t v45 = (char *)v17 + v44;
            uint64_t v46 = (char *)v18 + v44;
            uint64_t v47 = sub_1A56D4A28();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
            swift_storeEnumTagMultiPayload();
            return v49;
          }
          size_t v26 = *(void *)(v28 + 64);
          goto LABEL_14;
        }
        sub_1A56A67C4((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      }
      size_t v26 = *(void *)(v20 + 64);
LABEL_14:
      memcpy(v17, v18, v26);
      return v49;
    }
    sub_1A56A67C4((uint64_t)v17, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
LABEL_13:
    size_t v26 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118) - 8) + 64);
    goto LABEL_14;
  }
  if (v23) {
    goto LABEL_13;
  }
  uint64_t v24 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v25 + 48))(v18, 1, v24))
  {
    memcpy(v17, v18, *(void *)(v20 + 64));
  }
  else
  {
    int v37 = swift_getEnumCaseMultiPayload();
    if (v37 == 1)
    {
      *uint64_t v17 = *v18;
      v17[1] = v18[1];
      id v17[2] = v18[2];
      v17[3] = v18[3];
      v17[4] = v18[4];
      v17[5] = v18[5];
      v17[6] = v18[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (v37)
    {
      memcpy(v17, v18, *(void *)(v25 + 64));
    }
    else
    {
      *uint64_t v17 = *v18;
      v17[1] = v18[1];
      swift_bridgeObjectRetain();
      uint64_t v38 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v39 = (char *)v17 + v38;
      uint64_t v40 = (char *)v18 + v38;
      uint64_t v41 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v17, 0, 1, v24);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return v49;
}

uint64_t _s7MetricsVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4C28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2 + v9, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  int v14 = (_OWORD *)(a1 + v13);
  uint64_t v15 = (_OWORD *)(a2 + v13);
  uint64_t v16 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = type metadata accessor for SFAirDropReceive.Failure();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v20 + 48))(v15, 1, v19))
    {
      memcpy(v14, v15, *(void *)(v17 + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v14, v15, *(void *)(v20 + 64));
      }
      else
      {
        *int v14 = *v15;
        uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
        int v22 = (char *)v14 + v21;
        int v23 = (char *)v15 + v21;
        uint64_t v24 = sub_1A56D4A28();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v20 + 56))(v14, 0, 1, v19);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t _s7MetricsVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4C28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v45 = a2;
  uint64_t v46 = a1;
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(v10, 1, v6);
  int v14 = v12(v11, 1, v6);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v10, v11, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  uint64_t v16 = a3[7];
  *(unsigned char *)(v46 + a3[6]) = *(unsigned char *)(v45 + a3[6]);
  uint64_t v17 = (_OWORD *)(v46 + v16);
  uint64_t v18 = (_OWORD *)(v45 + v16);
  uint64_t v19 = type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v27 = type metadata accessor for SFAirDropReceive.Failure();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v28 + 48);
      int v30 = v29(v17, 1, v27);
      int v31 = v29(v18, 1, v27);
      if (v30)
      {
        if (!v31)
        {
          if (swift_getEnumCaseMultiPayload())
          {
            memcpy(v17, v18, *(void *)(v28 + 64));
          }
          else
          {
            *uint64_t v17 = *v18;
            uint64_t v37 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
            uint64_t v38 = (char *)v17 + v37;
            uint64_t v39 = (char *)v18 + v37;
            uint64_t v40 = sub_1A56D4A28();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(v38, v39, v40);
            swift_storeEnumTagMultiPayload();
          }
          (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v28 + 56))(v17, 0, 1, v27);
          return v46;
        }
      }
      else
      {
        if (!v31)
        {
          if (v46 == v45) {
            return v46;
          }
          sub_1A56A67C4((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
          if (!swift_getEnumCaseMultiPayload())
          {
            *uint64_t v17 = *v18;
            uint64_t v41 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
            uint64_t v42 = (char *)v17 + v41;
            int v43 = (char *)v18 + v41;
            uint64_t v44 = sub_1A56D4A28();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(v42, v43, v44);
            swift_storeEnumTagMultiPayload();
            return v46;
          }
          size_t v26 = *(void *)(v28 + 64);
          goto LABEL_14;
        }
        sub_1A56A67C4((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      }
      size_t v26 = *(void *)(v20 + 64);
LABEL_14:
      memcpy(v17, v18, v26);
      return v46;
    }
    sub_1A56A67C4((uint64_t)v17, type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
LABEL_13:
    size_t v26 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118) - 8) + 64);
    goto LABEL_14;
  }
  if (v23) {
    goto LABEL_13;
  }
  uint64_t v24 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v25 + 48))(v18, 1, v24))
  {
    memcpy(v17, v18, *(void *)(v20 + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v17, v18, *(void *)(v25 + 64));
    }
    else
    {
      *uint64_t v17 = *v18;
      uint64_t v32 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v33 = (char *)v17 + v32;
      uint64_t v34 = (char *)v18 + v32;
      uint64_t v35 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v25 + 56))(v17, 0, 1, v24);
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return v46;
}

uint64_t _s7MetricsVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56A82AC);
}

uint64_t sub_1A56A82AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4C28();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 253)
  {
    unsigned int v14 = *(unsigned __int8 *)(a1 + a3[6]);
    if (v14 >= 2) {
      int v15 = ((v14 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v15 = -2;
    }
    if (v15 < 0) {
      int v15 = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[7];
    return v17(v19, a2, v18);
  }
}

uint64_t _s7MetricsVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56A8460);
}

uint64_t sub_1A56A8460(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1A56D4C28();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671108);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 253)
  {
    *(unsigned char *)(a1 + a4[6]) = a2 + 2;
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9671118);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_1A56A85E4()
{
  sub_1A56D4C28();
  if (v0 <= 0x3F)
  {
    sub_1A56A8728(319, &qword_1E966B090, MEMORY[0x1E4F27928]);
    if (v1 <= 0x3F)
    {
      sub_1A56A8728(319, &qword_1E966B298, (void (*)(uint64_t))type metadata accessor for SFAirDropReceive.Transfer.Metrics.TransferResult);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1A56A8728(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A56D5898();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *_s7MetricsV14TransferResultOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for SFAirDropReceive.Failure();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v16 = a2[1];
        *a1 = *a2;
        a1[1] = v16;
        *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
        uint64_t v17 = a2[5];
        a1[4] = a2[4];
        a1[5] = v17;
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v8 + 64));
      }
      else
      {
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
        int v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = sub_1A56D4A28();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t _s7MetricsV14TransferResultOwxx(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t result = swift_getEnumCaseMultiPayload();
    if (result == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else if (!result)
    {
      swift_bridgeObjectRelease();
      uint64_t v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v5 = sub_1A56D4A28();
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      return v6(v4, v5);
    }
  }
  return result;
}

void *_s7MetricsV14TransferResultOwcp(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      uint64_t v15 = a2[5];
      a1[4] = a2[4];
      a1[5] = v15;
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      swift_bridgeObjectRetain();
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *_s7MetricsV14TransferResultOwca(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_1A56A67C4((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      if (!EnumCaseMultiPayload)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
        uint64_t v19 = (char *)a1 + v18;
        uint64_t v20 = (char *)a2 + v18;
        uint64_t v21 = sub_1A56D4A28();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v16 = *(void *)(v7 + 64);
      goto LABEL_9;
    }
    sub_1A56A67C4((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
LABEL_8:
    size_t v16 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_9:
    memcpy(a1, a2, v16);
    return a1;
  }
  if (v10) {
    goto LABEL_8;
  }
  int v11 = swift_getEnumCaseMultiPayload();
  if (v11 == 1)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    a1[5] = a2[5];
    a1[6] = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (v11)
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    *a1 = *a2;
    a1[1] = a2[1];
    swift_bridgeObjectRetain();
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_1A56D4A28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

_OWORD *_s7MetricsV14TransferResultOwtk(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
      int v9 = (char *)a1 + v8;
      int v10 = (char *)a2 + v8;
      uint64_t v11 = sub_1A56D4A28();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_OWORD *_s7MetricsV14TransferResultOwta(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_1A56A67C4((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
      if (!swift_getEnumCaseMultiPayload())
      {
        *a1 = *a2;
        uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        uint64_t v20 = sub_1A56D4A28();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v11 = *(void *)(v7 + 64);
      goto LABEL_8;
    }
    sub_1A56A67C4((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SFAirDropReceive.Failure);
LABEL_7:
    size_t v11 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v11);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9671110) + 48);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_1A56D4A28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t _s7MetricsV14TransferResultOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56A93DC);
}

uint64_t sub_1A56A93DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t _s7MetricsV14TransferResultOwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56A945C);
}

uint64_t sub_1A56A945C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_1A56A94DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_1A56A9544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Failure();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t sub_1A56A95B4()
{
  uint64_t result = type metadata accessor for SFAirDropReceive.Failure();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unsigned char *_s7MetricsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56A96F8);
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

ValueMetadata *_s7MetricsV10CodingKeysOMa_0()
{
  return &_s7MetricsV10CodingKeysON_0;
}

unsigned char *_s7MetricsV14TransferResultO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56A97FCLL);
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

ValueMetadata *_s7MetricsV14TransferResultO10CodingKeysOMa_0()
{
  return &_s7MetricsV14TransferResultO10CodingKeysON_0;
}

ValueMetadata *_s7MetricsV14TransferResultO17SuccessCodingKeysOMa_0()
{
  return &_s7MetricsV14TransferResultO17SuccessCodingKeysON_0;
}

unsigned char *_s7MetricsV14TransferResultO17FailureCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A56A98E0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s7MetricsV14TransferResultO17FailureCodingKeysOMa_0()
{
  return &_s7MetricsV14TransferResultO17FailureCodingKeysON_0;
}

unint64_t sub_1A56A991C()
{
  unint64_t result = qword_1E9675A38;
  if (!qword_1E9675A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A38);
  }
  return result;
}

unint64_t sub_1A56A9974()
{
  unint64_t result = qword_1E9675A40;
  if (!qword_1E9675A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A40);
  }
  return result;
}

unint64_t sub_1A56A99CC()
{
  unint64_t result = qword_1E9675A48;
  if (!qword_1E9675A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A48);
  }
  return result;
}

unint64_t sub_1A56A9A24()
{
  unint64_t result = qword_1E9675A50;
  if (!qword_1E9675A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A50);
  }
  return result;
}

unint64_t sub_1A56A9A7C()
{
  unint64_t result = qword_1E9675A58;
  if (!qword_1E9675A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A58);
  }
  return result;
}

unint64_t sub_1A56A9AD4()
{
  unint64_t result = qword_1E9675A60;
  if (!qword_1E9675A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A60);
  }
  return result;
}

unint64_t sub_1A56A9B2C()
{
  unint64_t result = qword_1E9675A68;
  if (!qword_1E9675A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A68);
  }
  return result;
}

unint64_t sub_1A56A9B84()
{
  unint64_t result = qword_1E9675A70;
  if (!qword_1E9675A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A70);
  }
  return result;
}

unint64_t sub_1A56A9BDC()
{
  unint64_t result = qword_1E9675A78;
  if (!qword_1E9675A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A78);
  }
  return result;
}

unint64_t sub_1A56A9C34()
{
  unint64_t result = qword_1E9675A80;
  if (!qword_1E9675A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A80);
  }
  return result;
}

unint64_t sub_1A56A9C8C()
{
  unint64_t result = qword_1E9675A88;
  if (!qword_1E9675A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675A88);
  }
  return result;
}

uint64_t sub_1A56A9CE0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x76697469736E6573 && a2 == 0xE900000000000065 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746C75736572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t SFAirDrop.ContactRequest.description.getter()
{
  unint64_t v1 = v0[3];
  if (!v1) {
    return 0x6F70707553746F6ELL;
  }
  if (v1 == 1) {
    return 0x656465654E746F6ELL;
  }
  uint64_t v3 = v0[6];
  uint64_t v4 = *v0;
  uint64_t v5 = v0[1];
  uint64_t v6 = v0[2];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[7];
  unint64_t v10 = v0[8];
  sub_1A56AB060(*v0, v5, v6, v1, v7, v8, v3, v9, v10);
  SFAirDrop.ContactInfo.description.getter();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  sub_1A54F7304(v4, v5, v6, v1, v7, v8, v3, v9, v10);
  return 0x28746361746E6F63;
}

uint64_t SFAirDrop.ContactRequest.contact.getter@<X0>(uint64_t a1@<X8>)
{
  unint64_t v3 = *(void *)(v1 + 24);
  if (v3 >= 2)
  {
    uint64_t v7 = *(void *)(v1 + 56);
    unint64_t v8 = *(void *)(v1 + 64);
    uint64_t v5 = *(void *)(v1 + 40);
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v6 = *(void *)(v1 + 48) & 1;
    *(void *)a1 = *(void *)v1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A54E866C();
    uint64_t result = sub_1A54E9E98(v7, v8);
  }
  else
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  return result;
}

uint64_t sub_1A56AA0C4()
{
  uint64_t v1 = 0x656465654E746F6ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x746361746E6F63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6F70707553746F6ELL;
  }
}

uint64_t sub_1A56AA12C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56ABC50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56AA154(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB0E8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AA190(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB0E8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56AA1CC(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB13C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AA208(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB13C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56AA244(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB190();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AA280(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB190();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56AA2BC(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB1E4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AA2F8(uint64_t a1)
{
  unint64_t v2 = sub_1A56AB1E4();

  return MEMORY[0x1F41862B0](a1, v2);
}

void SFAirDrop.ContactRequest.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AA0);
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v33 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AA8);
  uint64_t v31 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AB0);
  uint64_t v28 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  unint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AB8);
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  MEMORY[0x1F4188790](v9);
  size_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v1;
  uint64_t v40 = v1[1];
  uint64_t v41 = v12;
  uint64_t v13 = v1[2];
  unint64_t v14 = v1[3];
  uint64_t v38 = v1[4];
  uint64_t v39 = v13;
  uint64_t v15 = v1[5];
  uint64_t v16 = v1[6];
  uint64_t v36 = v1[7];
  uint64_t v37 = v15;
  unint64_t v30 = v1[8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AB0E8();
  sub_1A56D61D8();
  if (!v14)
  {
    LOBYTE(v44) = 0;
    sub_1A56AB1E4();
    uint64_t v17 = v43;
    sub_1A56D5D98();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
    goto LABEL_5;
  }
  if (v14 == 1)
  {
    LOBYTE(v44) = 1;
    sub_1A56AB190();
    uint64_t v17 = v43;
    sub_1A56D5D98();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v32);
LABEL_5:
    (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v17);
    return;
  }
  uint64_t v27 = v16;
  uint64_t v32 = v16 & 1;
  LOBYTE(v44) = 2;
  uint64_t v18 = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = v37;
  uint64_t v19 = v38;
  sub_1A54E866C();
  unint64_t v21 = v30;
  sub_1A54E9E98(v36, v30);
  sub_1A56AB13C();
  int v22 = v33;
  uint64_t v23 = v43;
  sub_1A56D5D98();
  uint64_t v44 = v41;
  uint64_t v45 = v18;
  uint64_t v46 = v39;
  unint64_t v47 = v14;
  uint64_t v48 = v19;
  uint64_t v49 = v20;
  char v50 = v32;
  uint64_t v24 = v36;
  uint64_t v51 = v36;
  unint64_t v52 = v21;
  sub_1A550CC48();
  uint64_t v25 = v35;
  sub_1A56D5E38();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v25);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v23);
  sub_1A54F7304(v41, v40, v39, v14, v38, v37, v27, v24, v21);
}

uint64_t SFAirDrop.ContactRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AE0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  uint64_t v42 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v45 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AE8);
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v40 = v6;
  MEMORY[0x1F4188790](v6);
  unint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AF0);
  uint64_t v44 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  size_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675AF8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_1A56AB0E8();
  uint64_t v17 = v53;
  sub_1A56D61A8();
  if (v17) {
    goto LABEL_11;
  }
  uint64_t v38 = v9;
  uint64_t v19 = v44;
  uint64_t v18 = v45;
  uint64_t v53 = v13;
  uint64_t v20 = sub_1A56D5D78();
  if (*(void *)(v20 + 16) != 1)
  {
    uint64_t v25 = sub_1A56D5A78();
    swift_allocError();
    uint64_t v26 = v15;
    uint64_t v27 = v12;
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
    *uint64_t v29 = &type metadata for SFAirDrop.ContactRequest;
    sub_1A56D5C98();
    sub_1A56D5A68();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v29, *MEMORY[0x1E4FBBA70], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v26, v27);
LABEL_11:
    uint64_t v32 = (uint64_t)v46;
    return __swift_destroy_boxed_opaque_existential_0Tm(v32);
  }
  if (*(unsigned char *)(v20 + 32))
  {
    if (*(unsigned char *)(v20 + 32) != 1)
    {
      LOBYTE(v47) = 2;
      sub_1A56AB13C();
      sub_1A56D5C88();
      uint64_t v33 = v43;
      sub_1A550D36C();
      uint64_t v35 = v18;
      uint64_t v36 = v41;
      sub_1A56D5D48();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v12);
      long long v23 = v47;
      uint64_t v21 = v48;
      uint64_t v24 = v49;
      long long v30 = v50;
      uint64_t v22 = v51;
      long long v31 = v52;
      uint64_t v32 = (uint64_t)v46;
      goto LABEL_9;
    }
    LOBYTE(v47) = 1;
    sub_1A56AB190();
    sub_1A56D5C88();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v40);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v12);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    long long v23 = 0uLL;
    uint64_t v24 = 1;
  }
  else
  {
    LOBYTE(v47) = 0;
    sub_1A56AB1E4();
    sub_1A56D5C88();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v38);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v12);
    uint64_t v21 = 0;
    uint64_t v24 = 0;
    uint64_t v22 = 0;
    long long v23 = 0uLL;
  }
  long long v30 = 0uLL;
  long long v31 = 0uLL;
  uint64_t v32 = (uint64_t)v46;
  uint64_t v33 = v43;
LABEL_9:
  *(_OWORD *)uint64_t v33 = v23;
  *(void *)(v33 + 16) = v21;
  *(void *)(v33 + 24) = v24;
  *(_OWORD *)(v33 + 32) = v30;
  *(void *)(v33 + 48) = v22;
  *(_OWORD *)(v33 + 56) = v31;
  return __swift_destroy_boxed_opaque_existential_0Tm(v32);
}

uint64_t sub_1A56AADB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDrop.ContactRequest.init(from:)(a1, a2);
}

void sub_1A56AADCC(void *a1)
{
}

uint64_t _s7Sharing9SFAirDropO14ContactRequestO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  uint64_t v13 = a2[2];
  unint64_t v14 = a2[3];
  uint64_t v15 = a2[4];
  uint64_t v16 = a2[5];
  uint64_t v17 = a2[6];
  uint64_t v18 = a2[7];
  unint64_t v19 = a2[8];
  v53[0] = *a1;
  v53[1] = v2;
  v53[2] = v4;
  v53[3] = v5;
  v53[4] = v6;
  v53[5] = v7;
  v53[6] = v8;
  v53[7] = v9;
  v53[8] = v10;
  v53[9] = v11;
  v53[10] = v12;
  v53[11] = v13;
  v53[12] = v14;
  v53[13] = v15;
  v53[14] = v16;
  v53[15] = v17;
  v53[16] = v18;
  v53[17] = v19;
  if (v5)
  {
    if (v5 != 1)
    {
      if (v14 >= 2)
      {
        v49[0] = v3;
        v49[1] = v2;
        v49[2] = v4;
        v49[3] = v5;
        v49[4] = v6;
        v49[5] = v7;
        uint64_t v44 = v2;
        v45[0] = v11;
        char v50 = v8 & 1;
        uint64_t v51 = v9;
        uint64_t v52 = v10;
        v45[1] = v12;
        v45[2] = v13;
        v45[3] = v14;
        v45[4] = v15;
        v45[5] = v16;
        char v46 = v17 & 1;
        uint64_t v47 = v18;
        unint64_t v48 = v19;
        uint64_t v42 = v6;
        uint64_t v43 = v4;
        uint64_t v37 = v13;
        unint64_t v38 = v10;
        uint64_t v40 = v8;
        uint64_t v41 = v7;
        uint64_t v39 = v9;
        sub_1A56AB060(v11, v12, v13, v14, v15, v16, v17, v18, v19);
        sub_1A56AB060(v3, v44, v43, v5, v42, v41, v40, v39, v38);
        sub_1A56AB060(v11, v12, v37, v14, v15, v16, v17, v18, v19);
        sub_1A56AB060(v3, v44, v43, v5, v42, v41, v40, v39, v38);
        uint64_t v36 = v3;
        char v20 = _s7Sharing9SFAirDropO11ContactInfoV2eeoiySbAE_AEtFZ_0((uint64_t)v49, (uint64_t)v45);
        sub_1A54F7260(v53);
        sub_1A54F7304(v11, v12, v37, v14, v15, v16, v17, v18, v19);
        sub_1A54F7304(v36, v44, v43, v5, v42, v41, v40, v39, v38);
        return v20 & 1;
      }
      goto LABEL_8;
    }
    if (v14 != 1)
    {
LABEL_8:
      unint64_t v35 = v19;
      uint64_t v21 = v11;
      uint64_t v22 = v4;
      unint64_t v23 = v14;
      uint64_t v24 = v6;
      uint64_t v25 = v15;
      uint64_t v26 = v7;
      uint64_t v27 = v16;
      uint64_t v28 = v8;
      uint64_t v29 = v17;
      uint64_t v30 = v9;
      uint64_t v31 = v18;
      uint64_t v32 = v2;
      unint64_t v33 = v10;
      sub_1A56AB060(v21, v12, v13, v23, v25, v27, v29, v31, v35);
      sub_1A56AB060(v3, v32, v22, v5, v24, v26, v28, v30, v33);
      sub_1A54F7260(v53);
      char v20 = 0;
      return v20 & 1;
    }
  }
  else if (v14)
  {
    goto LABEL_8;
  }
  sub_1A54F7260(v53);
  char v20 = 1;
  return v20 & 1;
}

void sub_1A56AB060(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  if (a4 >= 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A54E866C();
    sub_1A54E9E98(a8, a9);
  }
}

unint64_t sub_1A56AB0E8()
{
  unint64_t result = qword_1E9675AC0;
  if (!qword_1E9675AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675AC0);
  }
  return result;
}

unint64_t sub_1A56AB13C()
{
  unint64_t result = qword_1E9675AC8;
  if (!qword_1E9675AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675AC8);
  }
  return result;
}

unint64_t sub_1A56AB190()
{
  unint64_t result = qword_1E9675AD0;
  if (!qword_1E9675AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675AD0);
  }
  return result;
}

unint64_t sub_1A56AB1E4()
{
  unint64_t result = qword_1E9675AD8;
  if (!qword_1E9675AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675AD8);
  }
  return result;
}

unint64_t _s14ContactRequestOwxx(void *a1)
{
  unint64_t result = a1[3];
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A54E9EF0();
    uint64_t v3 = a1[7];
    unint64_t v4 = a1[8];
    return sub_1A54EA09C(v3, v4);
  }
  return result;
}

uint64_t _s14ContactRequestOwcp(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 24);
  if (v4 < 0xFFFFFFFF)
  {
    long long v11 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v11;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    long long v12 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    uint64_t v6 = *(void *)(a2 + 32);
    uint64_t v7 = *(void *)(a2 + 40);
    char v8 = *(unsigned char *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A54E866C();
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = v8;
    uint64_t v10 = *(void *)(a2 + 56);
    unint64_t v9 = *(void *)(a2 + 64);
    sub_1A54E9E98(v10, v9);
    *(void *)(a1 + 56) = v10;
    *(void *)(a1 + 64) = v9;
  }
  return a1;
}

uint64_t _s14ContactRequestOwca(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      uint64_t v12 = *(void *)(a2 + 32);
      uint64_t v13 = *(void *)(a2 + 40);
      char v14 = *(unsigned char *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1A54E866C();
      *(void *)(a1 + 32) = v12;
      *(void *)(a1 + 40) = v13;
      *(unsigned char *)(a1 + 48) = v14;
      uint64_t v16 = *(void *)(a2 + 56);
      unint64_t v15 = *(void *)(a2 + 64);
      sub_1A54E9E98(v16, v15);
      *(void *)(a1 + 56) = v16;
      *(void *)(a1 + 64) = v15;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    long long v17 = *(_OWORD *)(a2 + 16);
    long long v18 = *(_OWORD *)(a2 + 32);
    long long v19 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 32) = v18;
    *(_OWORD *)(a1 + 48) = v19;
    *(_OWORD *)(a1 + 16) = v17;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A54E9EF0();
    sub_1A54EA09C(*(void *)(a1 + 56), *(void *)(a1 + 64));
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  sub_1A54E866C();
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  sub_1A54E9EF0();
  uint64_t v9 = *(void *)(a2 + 56);
  unint64_t v8 = *(void *)(a2 + 64);
  sub_1A54E9E98(v9, v8);
  uint64_t v10 = *(void *)(a1 + 56);
  unint64_t v11 = *(void *)(a1 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v8;
  sub_1A54EA09C(v10, v11);
  return a1;
}

uint64_t _s14ContactRequestOwta(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 24);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A54E9EF0();
    sub_1A54EA09C(*(void *)(a1 + 56), *(void *)(a1 + 64));
LABEL_5:
    long long v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    long long v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v10;
    return a1;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  char v6 = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = v6;
  sub_1A54E9EF0();
  uint64_t v7 = *(void *)(a1 + 56);
  unint64_t v8 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  sub_1A54EA09C(v7, v8);
  return a1;
}

uint64_t _s14ContactRequestOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _s14ContactRequestOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1A56AB68C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double sub_1A56AB6A4(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(a1 + 24) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SFAirDrop.ContactRequest()
{
  return &type metadata for SFAirDrop.ContactRequest;
}

unsigned char *_s14ContactRequestO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 2;
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
        JUMPOUT(0x1A56AB7B4);
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
          *double result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14ContactRequestO10CodingKeysOMa()
{
  return &_s14ContactRequestO10CodingKeysON;
}

ValueMetadata *_s14ContactRequestO22NotSupportedCodingKeysOMa()
{
  return &_s14ContactRequestO22NotSupportedCodingKeysON;
}

ValueMetadata *_s14ContactRequestO19NotNeededCodingKeysOMa()
{
  return &_s14ContactRequestO19NotNeededCodingKeysON;
}

unsigned char *_s14ContactRequestO17ContactCodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *double result = a2;
        return result;
      case 2:
        *(_WORD *)double result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)double result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *double result = 0;
      break;
    case 2:
      *(_WORD *)double result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A56AB8A8);
    case 4:
      *(_DWORD *)double result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s14ContactRequestO17ContactCodingKeysOMa()
{
  return &_s14ContactRequestO17ContactCodingKeysON;
}

unint64_t sub_1A56AB8E4()
{
  unint64_t result = qword_1E9675B00;
  if (!qword_1E9675B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B00);
  }
  return result;
}

unint64_t sub_1A56AB93C()
{
  unint64_t result = qword_1E9675B08;
  if (!qword_1E9675B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B08);
  }
  return result;
}

unint64_t sub_1A56AB994()
{
  unint64_t result = qword_1E9675B10;
  if (!qword_1E9675B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B10);
  }
  return result;
}

unint64_t sub_1A56AB9EC()
{
  unint64_t result = qword_1E9675B18;
  if (!qword_1E9675B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B18);
  }
  return result;
}

unint64_t sub_1A56ABA44()
{
  unint64_t result = qword_1E9675B20;
  if (!qword_1E9675B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B20);
  }
  return result;
}

unint64_t sub_1A56ABA9C()
{
  unint64_t result = qword_1E9675B28;
  if (!qword_1E9675B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B28);
  }
  return result;
}

unint64_t sub_1A56ABAF4()
{
  unint64_t result = qword_1E9675B30;
  if (!qword_1E9675B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B30);
  }
  return result;
}

unint64_t sub_1A56ABB4C()
{
  unint64_t result = qword_1E9675B38;
  if (!qword_1E9675B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B38);
  }
  return result;
}

unint64_t sub_1A56ABBA4()
{
  unint64_t result = qword_1E9675B40;
  if (!qword_1E9675B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B40);
  }
  return result;
}

unint64_t sub_1A56ABBFC()
{
  unint64_t result = qword_1E9675B48;
  if (!qword_1E9675B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B48);
  }
  return result;
}

uint64_t sub_1A56ABC50(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F70707553746F6ELL && a2 == 0xEC00000064657472;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656465654E746F6ELL && a2 == 0xE900000000000064 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746361746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A56ABDCC()
{
  return sub_1A56D60E8();
}

uint64_t sub_1A56ABED4()
{
  sub_1A56D5188();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A56AC014()
{
  sub_1A56D5188();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A56AC16C()
{
  sub_1A56D5188();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A56AC28C()
{
  return sub_1A56D60E8();
}

uint64_t sub_1A56AC3F4()
{
  return sub_1A56D60E8();
}

uint64_t sub_1A56AC4FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A54F60EC(v2 + *(int *)(a1 + 28), a2, &qword_1E966BBB8);
}

uint64_t SFAirDrop.NearbySharingInteraction.connectionTime.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A56ADF5C(type metadata accessor for SFAirDrop.NearbySharingInteraction, (uint64_t)&qword_1E966BBB8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A54F60EC, a1);
}

uint64_t type metadata accessor for SFAirDrop.NearbySharingInteraction(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966C440);
}

uint64_t sub_1A56AC57C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t SFAirDrop.NearbySharingInteraction.isInitiator.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction(0) + 36));
}

uint64_t sub_1A56AC5AC(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 32));
}

uint64_t SFAirDrop.NearbySharingInteraction.isInitiatorRoleExpected.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction(0) + 32));
}

uint64_t sub_1A56AC5DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A56ADD88(v2 + *(int *)(a1 + 20), a2, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
}

uint64_t SFAirDrop.NearbySharingInteraction.state.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A56AC654(type metadata accessor for SFAirDrop.NearbySharingInteraction, (uint64_t)type metadata accessor for SFAirDrop.NearbySharingInteraction.State, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A56ADD88, a1);
}

uint64_t sub_1A56AC654@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1(0);
  return a3(v4 + *(int *)(v8 + 20), a4, a2);
}

uint64_t type metadata accessor for SFAirDrop.NearbySharingInteraction.State(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966C430);
}

BOOL static SFAirDrop.NearbySharingDiscovery.PollingType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SFAirDrop.NearbySharingDiscovery.PollingType.hash(into:)()
{
  return sub_1A56D60C8();
}

uint64_t sub_1A56AC70C(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACDCC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AC748(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACDCC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56AC784()
{
  uint64_t v1 = 0x65766973736170;
  if (*v0 != 1) {
    uint64_t v1 = 1819047270;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6974616D6F747561;
  }
}

uint64_t sub_1A56AC7DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BBBD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56AC804(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACCD0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AC840(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACCD0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56AC87C(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACD24();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AC8B8(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACD24();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56AC8F4(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACD78();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AC930(uint64_t a1)
{
  unint64_t v2 = sub_1A56ACD78();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingDiscovery.PollingType.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BC00);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x1F4188790](v4);
  unint64_t v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BC08);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BC10);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x1F4188790](v9);
  unint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBF8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  unint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56ACCD0();
  sub_1A56D61D8();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_1A56ACD78();
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_1A56ACD24();
      long long v17 = v23;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_1A56ACDCC();
    sub_1A56D5D98();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_1A56ACCD0()
{
  unint64_t result = qword_1E966B928;
  if (!qword_1E966B928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B928);
  }
  return result;
}

unint64_t sub_1A56ACD24()
{
  unint64_t result = qword_1E9675B50;
  if (!qword_1E9675B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B50);
  }
  return result;
}

unint64_t sub_1A56ACD78()
{
  unint64_t result = qword_1E9675B58;
  if (!qword_1E9675B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B58);
  }
  return result;
}

unint64_t sub_1A56ACDCC()
{
  unint64_t result = qword_1E966B960;
  if (!qword_1E966B960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B960);
  }
  return result;
}

uint64_t SFAirDrop.NearbySharingDiscovery.PollingType.hashValue.getter()
{
  return sub_1A56D60E8();
}

uint64_t SFAirDrop.NearbySharingDiscovery.PollingType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBC8);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBD0);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x1F4188790](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBD8);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBC0);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  unint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56ACCD0();
  uint64_t v12 = (uint64_t)v39;
  sub_1A56D61A8();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  unint64_t v15 = v11;
  uint64_t v16 = sub_1A56D5D78();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_1A56D5A78();
    swift_allocError();
    unint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
    *unint64_t v23 = &type metadata for SFAirDrop.NearbySharingDiscovery.PollingType;
    sub_1A56D5C98();
    sub_1A56D5A68();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x1E4FBBA70], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_1A56ACD78();
      uint64_t v18 = v30;
      sub_1A56D5C88();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_1A56ACD24();
      uint64_t v25 = v30;
      sub_1A56D5C88();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_1A56ACDCC();
    uint64_t v24 = v30;
    sub_1A56D5C88();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v39);
}

uint64_t sub_1A56AD420@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SFAirDrop.NearbySharingDiscovery.PollingType.init(from:)(a1, a2);
}

uint64_t sub_1A56AD438(void *a1)
{
  return SFAirDrop.NearbySharingDiscovery.PollingType.encode(to:)(a1);
}

uint64_t SFAirDrop.NearbySharingDiscovery.Request.pollingType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966B068);
}

uint64_t SFAirDrop.NearbySharingDiscovery.Request.applicationLabel.getter()
{
  return sub_1A56ADED4(type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request);
}

uint64_t SFAirDrop.NearbySharingDiscovery.Request.init(pollingType:applicationLabel:)@<X0>(char *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char v7 = *a1;
  sub_1A56D4CA8();
  uint64_t v8 = type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request(0);
  *(unsigned char *)(a4 + *(int *)(v8 + 20)) = v7;
  uint64_t result = sub_1A56D5238();
  if ((result & 1) == 0)
  {
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    sub_1A56D51C8();
    uint64_t result = swift_bridgeObjectRelease();
    a2 = 0xD000000000000011;
    a3 = 0x80000001A57388B0;
  }
  uint64_t v10 = (unint64_t *)(a4 + *(int *)(v8 + 24));
  unint64_t *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t sub_1A56AD5A0()
{
  unint64_t v1 = 0x54676E696C6C6F70;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 25705;
  }
}

uint64_t sub_1A56AD5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BBD2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56AD624(uint64_t a1)
{
  unint64_t v2 = sub_1A56AD89C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AD660(uint64_t a1)
{
  unint64_t v2 = sub_1A56AD89C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingDiscovery.Request.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BC18);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AD89C();
  sub_1A56D61D8();
  v10[15] = 0;
  sub_1A56D4CB8();
  sub_1A56ADCEC(&qword_1E966C7D8, MEMORY[0x1E4F27990]);
  sub_1A56D5E38();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request(0) + 20));
    v10[13] = 1;
    sub_1A56AD8F0();
    sub_1A56D5E38();
    v10[12] = 2;
    sub_1A56D5DE8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1A56AD89C()
{
  unint64_t result = qword_1E966B988;
  if (!qword_1E966B988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B988);
  }
  return result;
}

unint64_t sub_1A56AD8F0()
{
  unint64_t result = qword_1E966B978;
  if (!qword_1E966B978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B978);
  }
  return result;
}

uint64_t SFAirDrop.NearbySharingDiscovery.Request.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_1A56D4CB8();
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v26 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E966BBE0);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AD89C();
  sub_1A56D61A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v12 = v23;
  uint64_t v11 = v24;
  uint64_t v21 = v10;
  char v30 = 0;
  sub_1A56ADCEC(&qword_1E966C888, MEMORY[0x1E4F27990]);
  uint64_t v13 = v25;
  sub_1A56D5D48();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v21, v26, v4);
  char v28 = 1;
  sub_1A56ADD34();
  sub_1A56D5D48();
  v21[*(int *)(v8 + 20)] = v29;
  char v27 = 2;
  uint64_t v14 = sub_1A56D5CF8();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
  uint64_t v18 = (uint64_t)v21;
  uint64_t v17 = v22;
  uint64_t v19 = (uint64_t *)&v21[*(int *)(v8 + 24)];
  *uint64_t v19 = v14;
  v19[1] = v16;
  sub_1A56ADD88(v18, v17, type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return sub_1A56AE7B0(v18, type metadata accessor for SFAirDrop.NearbySharingDiscovery.Request);
}

uint64_t sub_1A56ADCEC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1A56ADD34()
{
  unint64_t result = qword_1E966B980;
  if (!qword_1E966B980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B980);
  }
  return result;
}

uint64_t sub_1A56ADD88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A56ADDF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDrop.NearbySharingDiscovery.Request.init(from:)(a1, a2);
}

uint64_t sub_1A56ADE08(void *a1)
{
  return SFAirDrop.NearbySharingDiscovery.Request.encode(to:)(a1);
}

uint64_t SFAirDrop.NearbySharingAssertion.nearbySharingInteractionID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingAssertion(0) + 20);
  uint64_t v4 = sub_1A56D4CB8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SFAirDrop.NearbySharingAssertion(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966BDE8);
}

uint64_t SFAirDrop.NearbySharingAssertion.explanation.getter()
{
  return sub_1A56ADED4(type metadata accessor for SFAirDrop.NearbySharingAssertion);
}

uint64_t sub_1A56ADED4(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1(0) + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SFAirDrop.NearbySharingAssertion.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A56ADF5C(type metadata accessor for SFAirDrop.NearbySharingAssertion, (uint64_t)type metadata accessor for SFClientIdentity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A56ADD88, a1);
}

uint64_t sub_1A56ADF5C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1(0);
  return a3(v4 + *(int *)(v8 + 28), a4, a2);
}

uint64_t SFAirDrop.NearbySharingAssertion.init(nearbySharingInteractionID:explanation:client:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_1A56D4CA8();
  uint64_t v10 = (int *)type metadata accessor for SFAirDrop.NearbySharingAssertion(0);
  uint64_t v11 = a5 + v10[5];
  uint64_t v12 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a1, v12);
  uint64_t v13 = (void *)(a5 + v10[6]);
  *uint64_t v13 = a2;
  v13[1] = a3;
  return sub_1A56B4EC0(a4, a5 + v10[7], (uint64_t (*)(void))type metadata accessor for SFClientIdentity);
}

uint64_t SFAirDrop.NearbySharingAssertionRequest.explanation.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingAssertionRequest(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for SFAirDrop.NearbySharingAssertionRequest(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966B918);
}

uint64_t SFAirDrop.NearbySharingAssertionRequest.init(nearbySharingInteractionID:explanation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t result = type metadata accessor for SFAirDrop.NearbySharingAssertionRequest(0);
  uint64_t v10 = (void *)(a4 + *(int *)(result + 20));
  void *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t sub_1A56AE168()
{
  if (*v0) {
    return 0x74616E616C707865;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t sub_1A56AE1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BBE80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56AE1D8(uint64_t a1)
{
  unint64_t v2 = sub_1A56AE408();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AE214(uint64_t a1)
{
  unint64_t v2 = sub_1A56AE408();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingAssertionRequest.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675B60);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AE408();
  sub_1A56D61D8();
  v8[15] = 0;
  sub_1A56D4CB8();
  sub_1A56ADCEC(&qword_1E966C7D8, MEMORY[0x1E4F27990]);
  sub_1A56D5E38();
  if (!v1)
  {
    type metadata accessor for SFAirDrop.NearbySharingAssertionRequest(0);
    v8[14] = 1;
    sub_1A56D5DE8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A56AE408()
{
  unint64_t result = qword_1E9675B68;
  if (!qword_1E9675B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B68);
  }
  return result;
}

uint64_t SFAirDrop.NearbySharingAssertionRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = sub_1A56D4CB8();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675B70);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SFAirDrop.NearbySharingAssertionRequest(0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AE408();
  sub_1A56D61A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v22 = v11;
  uint64_t v12 = v24;
  uint64_t v13 = v25;
  char v29 = 0;
  sub_1A56ADCEC(&qword_1E966C888, MEMORY[0x1E4F27990]);
  uint64_t v14 = v26;
  sub_1A56D5D48();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v22, v6, v14);
  char v28 = 1;
  uint64_t v15 = sub_1A56D5CF8();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v27);
  uint64_t v19 = (uint64_t)v22;
  uint64_t v18 = v23;
  uint64_t v20 = (uint64_t *)&v22[*(int *)(v9 + 20)];
  *uint64_t v20 = v15;
  v20[1] = v17;
  sub_1A56ADD88(v19, v18, type metadata accessor for SFAirDrop.NearbySharingAssertionRequest);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return sub_1A56AE7B0(v19, type metadata accessor for SFAirDrop.NearbySharingAssertionRequest);
}

uint64_t sub_1A56AE7B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A56AE810@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDrop.NearbySharingAssertionRequest.init(from:)(a1, a2);
}

uint64_t sub_1A56AE828(void *a1)
{
  return SFAirDrop.NearbySharingAssertionRequest.encode(to:)(a1);
}

uint64_t static SFAirDrop.NearbySharingInteraction.PresenceContext.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_1A56AE84C(uint64_t a1)
{
  unint64_t v2 = sub_1A56AE9D4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AE888(uint64_t a1)
{
  unint64_t v2 = sub_1A56AE9D4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingInteraction.PresenceContext.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675B78);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AE9D4();
  sub_1A56D61D8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1A56AE9D4()
{
  unint64_t result = qword_1E9675B80;
  if (!qword_1E9675B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B80);
  }
  return result;
}

uint64_t SFAirDrop.NearbySharingInteraction.PresenceContext.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_1A56AEA50(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675B78);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56AE9D4();
  sub_1A56D61D8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.InteractionType.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_1A56D5C68();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 6;
  if (v2 < 6) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.InteractionType.rawValue.getter()
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x636972656E6567;
      break;
    case 2:
      uint64_t result = 0x706F7244726961;
      break;
    case 3:
      uint64_t result = 1952802157;
      break;
    case 4:
      uint64_t result = 0x6572616873;
      break;
    case 5:
      uint64_t result = 0x6D79615072656570;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A56AEC78(unsigned __int8 *a1, char *a2)
{
  return sub_1A5625D94(*a1, *a2);
}

uint64_t sub_1A56AEC84()
{
  return sub_1A56ABDCC();
}

uint64_t sub_1A56AEC8C()
{
  sub_1A56D5188();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A56AED7C()
{
  return sub_1A56AC3F4();
}

uint64_t sub_1A56AED84@<X0>(char *a1@<X8>)
{
  return SFAirDrop.NearbySharingInteraction.ConnectionContext.InteractionType.init(rawValue:)(a1);
}

void sub_1A56AED90(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 0x636972656E6567;
      goto LABEL_3;
    case 2:
      *a1 = 0x706F7244726961;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 1952802157;
      a1[1] = 0xE400000000000000;
      break;
    case 4:
      *a1 = 0x6572616873;
      a1[1] = 0xE500000000000000;
      break;
    case 5:
      *a1 = 0x6D79615072656570;
      a1[1] = 0xEB00000000746E65;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE700000000000000;
      break;
  }
}

uint64_t sub_1A56AEE60()
{
  return sub_1A56D5328();
}

uint64_t sub_1A56AEEC0()
{
  return sub_1A56D5308();
}

void SFAirDrop.NearbySharingInteraction.ConnectionContext.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *SFAirDrop.NearbySharingInteraction.ConnectionContext.type.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.type.modify())()
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.endpointIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A56AC654(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext, (uint64_t)qword_1E966B098, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A54F60EC, a1);
}

uint64_t type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(uint64_t a1)
{
  return sub_1A550D49C(a1, (uint64_t *)&unk_1E966C420);
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.endpointIdentifier.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  return sub_1A566BD28(a1, v1 + *(int *)(v3 + 20), qword_1E966B098);
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.endpointIdentifier.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.contactIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0
                 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.contactIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.contactIdentifier.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.deviceName.getter()
{
  uint64_t v1 = *(void *)(v0
                 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.deviceName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.deviceName.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.deviceModel.getter()
{
  uint64_t v1 = *(void *)(v0
                 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.deviceModel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.deviceModel.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.accountID.getter()
{
  uint64_t v1 = *(void *)(v0
                 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.accountID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.accountID.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.isSameAccount.getter()
{
  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0)
                                     + 40));
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.isSameAccount.setter(char a1)
{
  uint64_t result = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.isSameAccount.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.transactionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 44);
  uint64_t v4 = sub_1A56D4CB8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.transactionIdentifier.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0) + 44);
  uint64_t v4 = sub_1A56D4CB8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*SFAirDrop.NearbySharingInteraction.ConnectionContext.transactionIdentifier.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.init(type:transactionIdentifier:endpointIdentifier:contactIdentifier:deviceName:deviceModel:accountID:isSameAccount:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned char *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  char v24 = *a1;
  uint64_t v14 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  uint64_t v15 = (uint64_t)&a9[v14[5]];
  uint64_t v16 = sub_1A56D4CB8();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  uint64_t v18 = &a9[v14[6]];
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v19 = &a9[v14[7]];
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = &a9[v14[8]];
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v21 = &a9[v14[9]];
  *uint64_t v21 = 0;
  v21[1] = 0;
  uint64_t v22 = v14[10];
  a9[v22] = 2;
  *a9 = v24;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 32))(&a9[v14[11]], a2, v16);
  sub_1A566BD28(a3, v15, qword_1E966B098);
  swift_bridgeObjectRelease();
  *uint64_t v18 = a4;
  v18[1] = a5;
  swift_bridgeObjectRelease();
  *uint64_t v19 = a6;
  v19[1] = a7;
  swift_bridgeObjectRelease();
  *uint64_t v20 = a8;
  v20[1] = a10;
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v21 = a11;
  v21[1] = a12;
  a9[v22] = a13;
  return result;
}

unint64_t sub_1A56AF6FC(char a1)
{
  unint64_t result = 1701869940;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x614E656369766564;
      break;
    case 4:
      unint64_t result = 0x6F4D656369766564;
      break;
    case 5:
      unint64_t result = 0x49746E756F636361;
      break;
    case 6:
      unint64_t result = 0x6341656D61537369;
      break;
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1A56AF820()
{
  return sub_1A56AF6FC(*v0);
}

uint64_t sub_1A56AF828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BBF88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56AF850(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4B78();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56AF88C(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4B78();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675B88);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56B4B78();
  sub_1A56D61D8();
  v10[31] = *v3;
  v10[30] = 0;
  sub_1A56B4BCC();
  sub_1A56D5E38();
  if (!v2)
  {
    type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    v10[29] = 1;
    sub_1A56D4CB8();
    sub_1A56ADCEC(&qword_1E966C7D8, MEMORY[0x1E4F27990]);
    sub_1A56D5DD8();
    v10[28] = 2;
    sub_1A56D5DA8();
    v10[27] = 3;
    sub_1A56D5DA8();
    v10[26] = 4;
    sub_1A56D5DA8();
    v10[25] = 5;
    sub_1A56D5DA8();
    v10[24] = 6;
    sub_1A56D5DB8();
    v10[15] = 7;
    sub_1A56D5E38();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_1A56D4CB8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v46 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BA0);
  uint64_t v47 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 20)];
  uint64_t v44 = v4;
  uint64_t v16 = *(void (**)(void))(v4 + 56);
  uint64_t v51 = v15;
  v16();
  uint64_t v17 = (uint64_t *)&v14[v11[6]];
  *uint64_t v17 = 0;
  v17[1] = 0;
  uint64_t v56 = v17;
  uint64_t v18 = (uint64_t *)&v14[v11[7]];
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v55 = v18;
  uint64_t v19 = (uint64_t *)&v14[v11[8]];
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v54 = v19;
  uint64_t v20 = (uint64_t *)&v14[v11[9]];
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v53 = v20;
  uint64_t v21 = v11[10];
  v14[v21] = 2;
  uint64_t v22 = a1[3];
  char v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_1A56B4B78();
  unint64_t v48 = v10;
  uint64_t v23 = v52;
  sub_1A56D61A8();
  if (v23)
  {
    uint64_t v24 = v51;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v50);
    sub_1A54E4D44(v24, qword_1E966B098);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v52 = v21;
    char v64 = 0;
    sub_1A56B4C20();
    sub_1A56D5D48();
    *uint64_t v14 = v65;
    char v63 = 1;
    uint64_t v25 = sub_1A56ADCEC(&qword_1E966C888, MEMORY[0x1E4F27990]);
    sub_1A56D5CE8();
    uint64_t v42 = v25;
    sub_1A566BD28((uint64_t)v8, v51, qword_1E966B098);
    char v62 = 2;
    uint64_t v43 = sub_1A56D5CA8();
    uint64_t v27 = v26;
    char v28 = v56;
    swift_bridgeObjectRelease();
    *char v28 = v43;
    v28[1] = v27;
    char v61 = 3;
    uint64_t v43 = sub_1A56D5CA8();
    uint64_t v30 = v29;
    uint64_t v31 = v55;
    swift_bridgeObjectRelease();
    *uint64_t v31 = v43;
    v31[1] = v30;
    char v60 = 4;
    uint64_t v43 = sub_1A56D5CA8();
    uint64_t v33 = v32;
    uint64_t v34 = v54;
    swift_bridgeObjectRelease();
    *uint64_t v34 = v43;
    v34[1] = v33;
    char v59 = 5;
    uint64_t v43 = sub_1A56D5CA8();
    uint64_t v36 = v35;
    uint64_t v37 = v53;
    swift_bridgeObjectRelease();
    *uint64_t v37 = v43;
    v37[1] = v36;
    uint64_t v38 = v48;
    uint64_t v39 = v49;
    char v58 = 6;
    v14[v52] = sub_1A56D5CB8();
    char v57 = 7;
    sub_1A56D5D48();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v39);
    uint64_t v40 = (uint64_t)v50;
    (*(void (**)(unsigned char *, char *, uint64_t))(v44 + 32))(&v14[v11[11]], v46, v3);
    sub_1A56ADD88((uint64_t)v14, v45, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
    __swift_destroy_boxed_opaque_existential_0Tm(v40);
    return sub_1A56AE7B0((uint64_t)v14, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
  }
}

uint64_t sub_1A56B01D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDrop.NearbySharingInteraction.ConnectionContext.init(from:)(a1, a2);
}

uint64_t sub_1A56B01EC(void *a1)
{
  return SFAirDrop.NearbySharingInteraction.ConnectionContext.encode(to:)(a1);
}

uint64_t static SFAirDrop.NearbySharingInteraction.FailureType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  char v3 = v2 == 2;
  int v4 = *a2;
  if (v4 != 2) {
    char v3 = 0;
  }
  if (v2 != 2 && v4 != 2) {
    char v3 = ((v2 & 1) == 0) ^ v4;
  }
  return v3 & 1;
}

uint64_t sub_1A56B023C()
{
  if (*v0) {
    return 0x726F707075736E75;
  }
  else {
    return 0x796177416C6C7570;
  }
}

uint64_t sub_1A56B0280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BC300(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56B02A8(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4C74();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B02E4(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4C74();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0320(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4D1C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B035C(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4D1C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0398()
{
  return 0x796C6C61636F6CLL;
}

uint64_t sub_1A56B03B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x796C6C61636F6CLL && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1A56D5F28();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A56B0448(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4CC8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B0484(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4CC8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingInteraction.FailureType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BB0);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BB8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x1F4188790](v5);
  char v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BC0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56B4C74();
  sub_1A56D61D8();
  if (v12 == 2)
  {
    char v21 = 0;
    sub_1A56B4D1C();
    sub_1A56D5D98();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  else
  {
    char v22 = 1;
    sub_1A56B4CC8();
    uint64_t v14 = v18;
    sub_1A56D5D98();
    uint64_t v15 = v20;
    sub_1A56D5DF8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t SFAirDrop.NearbySharingInteraction.FailureType.init(from:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BE0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BE8);
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BF0);
  uint64_t v28 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  int v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56B4C74();
  uint64_t v13 = v30;
  sub_1A56D61A8();
  if (!v13)
  {
    uint64_t v14 = v29;
    uint64_t v24 = v7;
    uint64_t v30 = a1;
    uint64_t v15 = sub_1A56D5D78();
    if (*(void *)(v15 + 16) == 1)
    {
      a1 = v30;
      if (*(unsigned char *)(v15 + 32))
      {
        char v32 = 1;
        sub_1A56B4CC8();
        sub_1A56D5C88();
        uint64_t v20 = v25;
        char v21 = sub_1A56D5D08();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v20);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
        a1 = v30;
        char v22 = v21 & 1;
      }
      else
      {
        char v31 = 0;
        sub_1A56B4D1C();
        sub_1A56D5C88();
        (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v24);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
        char v22 = 2;
      }
      *uint64_t v27 = v22;
    }
    else
    {
      uint64_t v16 = sub_1A56D5A78();
      swift_allocError();
      uint64_t v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
      *uint64_t v18 = &type metadata for SFAirDrop.NearbySharingInteraction.FailureType;
      sub_1A56D5C98();
      sub_1A56D5A68();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x1E4FBBA70], v16);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
      a1 = v30;
    }
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
}

unint64_t sub_1A56B0C40(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x697463656E6E6F63;
      break;
    case 2:
      unint64_t result = 0x657463656E6E6F63;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0x6465646E65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A56B0CF8@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return SFAirDrop.NearbySharingInteraction.FailureType.init(from:)(a1, a2);
}

uint64_t sub_1A56B0D10(void *a1)
{
  return SFAirDrop.NearbySharingInteraction.FailureType.encode(to:)(a1);
}

uint64_t sub_1A56B0D28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  char v3 = v2 == 2;
  int v4 = *a2;
  if (v4 != 2) {
    char v3 = 0;
  }
  if (v2 != 2 && v4 != 2) {
    char v3 = ((v2 & 1) == 0) ^ v4;
  }
  return v3 & 1;
}

unint64_t sub_1A56B0D60()
{
  return sub_1A56B0C40(*v0);
}

uint64_t sub_1A56B0D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BC40C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56B0D90(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4D70();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B0DCC(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4D70();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0E08(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4F28();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B0E44(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4F28();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0E80(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4F7C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B0EBC(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4F7C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0EF8(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4E18();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B0F34(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4E18();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0F70(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4DC4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B0FAC(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4DC4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56B0FE8(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4FD0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B1024(uint64_t a1)
{
  unint64_t v2 = sub_1A56B4FD0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingInteraction.State.encode(to:)(void *a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675BF8);
  uint64_t v39 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v37 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C00);
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v35 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C08);
  uint64_t v34 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v33 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  MEMORY[0x1F4188790](v31);
  uint64_t v32 = (uint64_t)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C10);
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C18);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C20);
  uint64_t v43 = *(void *)(v15 - 8);
  uint64_t v44 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56B4D70();
  sub_1A56D61D8();
  sub_1A56ADD88(v42, (uint64_t)v14, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v19 = v32;
      sub_1A56B4EC0((uint64_t)v14, v32, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      char v47 = 2;
      sub_1A56B4F28();
      uint64_t v20 = v33;
      uint64_t v18 = v44;
      sub_1A56D5D98();
      sub_1A56ADCEC(&qword_1E9675C50, (void (*)(uint64_t))type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      uint64_t v21 = v36;
      sub_1A56D5E38();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v21);
      sub_1A56AE7B0(v19, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      goto LABEL_5;
    case 2u:
      char v22 = *v14;
      char v49 = 3;
      sub_1A56B4E18();
      uint64_t v23 = v35;
      uint64_t v18 = v44;
      sub_1A56D5D98();
      char v48 = v22;
      sub_1A56B4E6C();
      uint64_t v24 = v40;
      sub_1A56D5E38();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v23, v24);
      goto LABEL_5;
    case 3u:
      char v46 = 1;
      sub_1A56B4F7C();
      uint64_t v26 = v44;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v30);
      goto LABEL_8;
    case 4u:
      char v50 = 4;
      sub_1A56B4DC4();
      uint64_t v27 = v37;
      uint64_t v26 = v44;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v41);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v17, v26);
      break;
    default:
      char v45 = 0;
      sub_1A56B4FD0();
      uint64_t v18 = v44;
      sub_1A56D5D98();
      sub_1A56B5024();
      sub_1A56D5E38();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v9);
LABEL_5:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v17, v18);
      break;
  }
  return result;
}

uint64_t SFAirDrop.NearbySharingInteraction.State.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C70);
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v67 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C78);
  uint64_t v64 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  unint64_t v68 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C80);
  uint64_t v63 = *(void *)(v60 - 8);
  MEMORY[0x1F4188790](v60);
  char v69 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C88);
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v59 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v66 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C90);
  uint64_t v56 = *(void *)(v9 - 8);
  uint64_t v57 = v9;
  MEMORY[0x1F4188790](v9);
  char v65 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675C98);
  uint64_t v70 = *(void *)(v11 - 8);
  uint64_t v71 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  uint64_t v20 = (char *)&v53 - v19;
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v23 = (char *)&v53 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v53 - v24;
  uint64_t v26 = a1[3];
  char v74 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_1A56B4D70();
  uint64_t v27 = (uint64_t)v75;
  sub_1A56D61A8();
  if (v27) {
    goto LABEL_10;
  }
  uint64_t v53 = v23;
  uint64_t v54 = v17;
  uint64_t v55 = v20;
  uint64_t v28 = v72;
  uint64_t v29 = v73;
  uint64_t v75 = v25;
  uint64_t v30 = v71;
  uint64_t v31 = sub_1A56D5D78();
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v38 = sub_1A56D5A78();
    swift_allocError();
    uint64_t v39 = v30;
    uint64_t v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
    *uint64_t v41 = v14;
    sub_1A56D5C98();
    sub_1A56D5A68();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v41, *MEMORY[0x1E4FBBA70], v38);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v39);
LABEL_10:
    uint64_t v34 = (uint64_t)v74;
    return __swift_destroy_boxed_opaque_existential_0Tm(v34);
  }
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      char v77 = 1;
      sub_1A56B4F7C();
      uint64_t v42 = v66;
      sub_1A56D5C88();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v59);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v30);
      uint64_t v37 = (uint64_t)v75;
      goto LABEL_12;
    case 2:
      char v78 = 2;
      sub_1A56B4F28();
      sub_1A56D5C88();
      type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      sub_1A56ADCEC(&qword_1E9675CA8, (void (*)(uint64_t))type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      uint64_t v43 = v60;
      uint64_t v44 = v69;
      sub_1A56D5D48();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v44, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v30);
      uint64_t v51 = v55;
      goto LABEL_13;
    case 3:
      uint64_t v45 = v28;
      char v80 = 3;
      sub_1A56B4E18();
      char v46 = v68;
      sub_1A56D5C88();
      sub_1A56B5078();
      sub_1A56D5D48();
      char v47 = v46;
      uint64_t v48 = v70;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v47, v45);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v30);
      uint64_t v51 = v54;
      *uint64_t v54 = v79;
LABEL_13:
      swift_storeEnumTagMultiPayload();
      uint64_t v52 = (uint64_t)v51;
      uint64_t v37 = (uint64_t)v75;
      sub_1A56B4EC0(v52, (uint64_t)v75, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
      goto LABEL_14;
    case 4:
      char v81 = 4;
      sub_1A56B4DC4();
      char v49 = v67;
      sub_1A56D5C88();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v49, v62);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v30);
      uint64_t v37 = (uint64_t)v75;
LABEL_12:
      swift_storeEnumTagMultiPayload();
LABEL_14:
      uint64_t v34 = (uint64_t)v74;
      break;
    default:
      char v76 = 0;
      sub_1A56B4FD0();
      uint64_t v32 = v65;
      sub_1A56D5C88();
      sub_1A56B50CC();
      uint64_t v33 = v57;
      sub_1A56D5D48();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v30);
      uint64_t v34 = (uint64_t)v74;
      uint64_t v35 = (uint64_t)v53;
      swift_storeEnumTagMultiPayload();
      uint64_t v36 = v35;
      uint64_t v37 = (uint64_t)v75;
      sub_1A56B4EC0(v36, (uint64_t)v75, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
      break;
  }
  sub_1A56B4EC0(v37, v29, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  return __swift_destroy_boxed_opaque_existential_0Tm(v34);
}

uint64_t sub_1A56B21D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDrop.NearbySharingInteraction.State.init(from:)(a1, a2);
}

uint64_t sub_1A56B21E8(void *a1)
{
  return SFAirDrop.NearbySharingInteraction.State.encode(to:)(a1);
}

uint64_t SFAirDrop.NearbySharingInteraction.state.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction(0) + 20);

  return sub_1A55C51D0(a1, v3);
}

uint64_t (*SFAirDrop.NearbySharingInteraction.state.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SFAirDrop.NearbySharingInteraction(0) + 24);
  uint64_t v4 = sub_1A56D4C28();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t SFAirDrop.NearbySharingInteraction.connectionTime.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
  return sub_1A566BD28(a1, v1 + *(int *)(v3 + 28), &qword_1E966BBB8);
}

uint64_t (*SFAirDrop.NearbySharingInteraction.connectionTime.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.isInitiatorRoleExpected.setter(char a1)
{
  uint64_t result = type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.isInitiatorRoleExpected.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.isInitiator.setter(char a1)
{
  uint64_t result = type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*SFAirDrop.NearbySharingInteraction.isInitiator.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SFAirDrop.NearbySharingInteraction.init(state:id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v5 = sub_1A56D4C28();
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A56D4CB8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
  uint64_t v16 = &a3[v15[7]];
  uint64_t v17 = sub_1A56D5B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  a3[v15[8]] = 0;
  a3[v15[9]] = 0;
  sub_1A54F60EC(a2, (uint64_t)v10, qword_1E966B098);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1A56D4CA8();
    sub_1A54E4D44((uint64_t)v10, qword_1E966B098);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a3, v14, v11);
  }
  else
  {
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v18(v14, v10, v11);
    v18(a3, v14, v11);
  }
  sub_1A56D4C18();
  sub_1A54E4D44(a2, qword_1E966B098);
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&a3[v15[6]], v7, v22);
  return sub_1A56B4EC0(v23, (uint64_t)&a3[v15[5]], type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
}

unint64_t sub_1A56B2764()
{
  unint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6574617473;
      break;
    case 2:
      unint64_t result = 0x6E6F697461657263;
      break;
    case 3:
      unint64_t result = 0x697463656E6E6F63;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0x616974696E497369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A56B283C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56BC634(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A56B2864(uint64_t a1)
{
  unint64_t v2 = sub_1A56B5120();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56B28A0(uint64_t a1)
{
  unint64_t v2 = sub_1A56B5120();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFAirDrop.NearbySharingInteraction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675CB8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56B5120();
  sub_1A56D61D8();
  v8[15] = 0;
  sub_1A56D4CB8();
  sub_1A56ADCEC(&qword_1E966C7D8, MEMORY[0x1E4F27990]);
  sub_1A56D5E38();
  if (!v1)
  {
    type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
    v8[14] = 1;
    type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
    sub_1A56ADCEC(&qword_1E9672840, (void (*)(uint64_t))type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    sub_1A56D5E38();
    v8[13] = 2;
    sub_1A56D4C28();
    sub_1A56ADCEC(&qword_1E9670478, MEMORY[0x1E4F27928]);
    sub_1A56D5E38();
    v8[12] = 3;
    sub_1A56D5B08();
    sub_1A56ADCEC(&qword_1E9675CC8, MEMORY[0x1E4FBD178]);
    sub_1A56D5DD8();
    v8[11] = 4;
    sub_1A56D5DF8();
    v8[10] = 5;
    sub_1A56D5DF8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SFAirDrop.NearbySharingInteraction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v31 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1A56D4C28();
  uint64_t v32 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v37 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v33);
  uint64_t v36 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1A56D4CB8();
  uint64_t v34 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v39 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675CD0);
  uint64_t v35 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t)&v13[*(int *)(v11 + 28)];
  uint64_t v15 = sub_1A56D5B08();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v43 = v14;
  v16(v14, 1, 1, v15);
  uint64_t v30 = v10[8];
  v13[v30] = 0;
  uint64_t v17 = v10[9];
  v13[v17] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56B5120();
  uint64_t v41 = v9;
  uint64_t v18 = (uint64_t)v44;
  sub_1A56D61A8();
  if (v18)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    return sub_1A54E4D44(v43, &qword_1E966BBB8);
  }
  else
  {
    v28[0] = v17;
    v28[1] = v15;
    uint64_t v19 = (uint64_t)v36;
    uint64_t v20 = v37;
    uint64_t v21 = (uint64_t)v13;
    uint64_t v22 = v40;
    uint64_t v44 = a1;
    char v50 = 0;
    sub_1A56ADCEC(&qword_1E966C888, MEMORY[0x1E4F27990]);
    uint64_t v24 = v38;
    uint64_t v23 = v39;
    sub_1A56D5D48();
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v21, v23, v24);
    char v49 = 1;
    sub_1A56ADCEC(&qword_1E9672850, (void (*)(uint64_t))type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    sub_1A56D5D48();
    sub_1A56B4EC0(v19, v21 + v10[5], type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    char v48 = 2;
    sub_1A56ADCEC(&qword_1E9670500, MEMORY[0x1E4F27928]);
    sub_1A56D5D48();
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v21 + v10[6], v20, v22);
    char v47 = 3;
    sub_1A56ADCEC(&qword_1E9675CD8, MEMORY[0x1E4FBD178]);
    uint64_t v25 = (uint64_t)v31;
    sub_1A56D5CE8();
    sub_1A566BD28(v25, v43, &qword_1E966BBB8);
    char v46 = 4;
    *(unsigned char *)(v21 + v30) = sub_1A56D5D08() & 1;
    char v45 = 5;
    char v26 = sub_1A56D5D08();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v41, v42);
    *(unsigned char *)(v21 + v28[0]) = v26 & 1;
    sub_1A56ADD88(v21, v29, type metadata accessor for SFAirDrop.NearbySharingInteraction);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
    return sub_1A56AE7B0(v21, type metadata accessor for SFAirDrop.NearbySharingInteraction);
  }
}

uint64_t sub_1A56B33A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SFAirDrop.NearbySharingInteraction.init(from:)(a1, a2);
}

uint64_t sub_1A56B33BC(void *a1)
{
  return SFAirDrop.NearbySharingInteraction.encode(to:)(a1);
}

uint64_t SFAirDrop.NearbySharingInteraction.State.connectionContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A56ADD88(v2, (uint64_t)v6, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1A56B4EC0((uint64_t)v6, a1, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
    uint64_t v7 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
  }
  else
  {
    uint64_t v9 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
    return sub_1A56AE7B0((uint64_t)v6, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  }
}

BOOL SFAirDrop.NearbySharingInteraction.State.isConnected.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675CE0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A56ADD88(v1, (uint64_t)v4, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1A56B4EC0((uint64_t)v4, (uint64_t)v7, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
    uint64_t v8 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v8 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
    sub_1A56AE7B0((uint64_t)v4, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  }
  type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  BOOL v9 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) != 1;
  sub_1A54E4D44((uint64_t)v7, &qword_1E9675CE0);
  return v9;
}

BOOL sub_1A56B375C(uint64_t a1, uint64_t a2)
{
  return (_s7Sharing9SFAirDropO06NearbyA11InteractionV5StateO1loiySbAG_AGtFZ_0(a2, a1) & 1) == 0;
}

BOOL sub_1A56B3788(uint64_t a1, uint64_t a2)
{
  return (_s7Sharing9SFAirDropO06NearbyA11InteractionV5StateO1loiySbAG_AGtFZ_0(a1, a2) & 1) == 0;
}

uint64_t sub_1A56B37A8(uint64_t a1, uint64_t a2)
{
  return _s7Sharing9SFAirDropO06NearbyA11InteractionV5StateO1loiySbAG_AGtFZ_0(a2, a1);
}

unint64_t SFAirDrop.NearbySharingInteraction.State.description.getter()
{
  unint64_t v1 = 0x7463656E6E6F632ELL;
  uint64_t v2 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A56ADD88(v0, (uint64_t)v7, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1A56B4EC0((uint64_t)v7, (uint64_t)v4, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      unint64_t v9 = 0;
      unint64_t v10 = 0xE000000000000000;
      sub_1A56D51C8();
      sub_1A56D5B48();
      sub_1A56D51C8();
      unint64_t v1 = v9;
      sub_1A56AE7B0((uint64_t)v4, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      break;
    case 2u:
      unint64_t v1 = 0xD000000000000016;
      break;
    case 3u:
      return v1;
    case 4u:
      unint64_t v1 = 0x6465646E652ELL;
      break;
    default:
      unint64_t v9 = 0;
      unint64_t v10 = 0xE000000000000000;
      sub_1A56D5A28();
      sub_1A56D51C8();
      sub_1A56D5B48();
      sub_1A56D51C8();
      unint64_t v1 = v9;
      break;
  }
  return v1;
}

uint64_t SFAirDrop.NearbySharingInteraction.ConnectionContext.InteractionType.description.getter()
{
  uint64_t result = 0x6E776F6E6B6E752ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x636972656E65672ELL;
      break;
    case 2:
      uint64_t result = 0x706F72447269612ELL;
      break;
    case 3:
      uint64_t result = 0x7465656D2ELL;
      break;
    case 4:
      uint64_t result = 0x65726168732ELL;
      break;
    case 5:
      uint64_t result = 0x796150726565702ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A56B3B08()
{
  uint64_t result = 0x6E776F6E6B6E752ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x636972656E65672ELL;
      break;
    case 2:
      uint64_t result = 0x706F72447269612ELL;
      break;
    case 3:
      uint64_t result = 0x7465656D2ELL;
      break;
    case 4:
      uint64_t result = 0x65726168732ELL;
      break;
    case 5:
      uint64_t result = 0x796150726565702ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s7Sharing9SFAirDropO06NearbyA11InteractionV5StateO1loiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v39 = (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v40 = (uint64_t)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675E30);
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (uint64_t)&v20[*(int *)(v18 + 56)];
  sub_1A56ADD88(a1, (uint64_t)v20, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  sub_1A56ADD88(a2, v21, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1A56ADD88((uint64_t)v20, (uint64_t)v16, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload != 4 && EnumCaseMultiPayload != 2)
        {
          sub_1A56AE7B0((uint64_t)v16, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
          goto LABEL_26;
        }
        uint64_t v25 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext;
        uint64_t v26 = (uint64_t)v16;
        goto LABEL_20;
      }
      sub_1A56B4EC0((uint64_t)v16, (uint64_t)v13, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      uint64_t v30 = v21;
      uint64_t v31 = v40;
      sub_1A56B4EC0(v30, v40, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      uint64_t v32 = *(int *)(v9 + 24);
      if (!*(void *)&v13[v32 + 8] && *(void *)(v31 + v32 + 8))
      {
        sub_1A56AE7B0(v31, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
        uint64_t v26 = (uint64_t)v13;
        uint64_t v25 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext;
        goto LABEL_20;
      }
      sub_1A54F60EC((uint64_t)&v13[*(int *)(v9 + 20)], (uint64_t)v8, qword_1E966B098);
      sub_1A56AE7B0((uint64_t)v13, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      uint64_t v33 = sub_1A56D4CB8();
      uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48);
      int v35 = v34(v8, 1, v33);
      sub_1A54E4D44((uint64_t)v8, qword_1E966B098);
      if (v35 == 1)
      {
        uint64_t v36 = v31 + *(int *)(v9 + 20);
        uint64_t v37 = v39;
        sub_1A54F60EC(v36, v39, qword_1E966B098);
        sub_1A56AE7B0(v31, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
        int v38 = v34((char *)v37, 1, v33);
        sub_1A54E4D44(v37, qword_1E966B098);
        if (v38 != 1) {
          goto LABEL_21;
        }
      }
      else
      {
        sub_1A56AE7B0(v31, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      }
      sub_1A56AE7B0((uint64_t)v20, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
      return 0;
    case 2u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_26;
      }
      goto LABEL_21;
    case 3u:
      int v27 = swift_getEnumCaseMultiPayload();
      if (v27 == 4 || v27 == 2) {
        goto LABEL_21;
      }
      if (v27 == 1) {
        goto LABEL_19;
      }
      goto LABEL_26;
    case 4u:
      goto LABEL_26;
    default:
      int v22 = swift_getEnumCaseMultiPayload();
      if ((v22 - 2) < 3) {
        goto LABEL_21;
      }
      if (v22)
      {
LABEL_19:
        uint64_t v25 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State;
        uint64_t v26 = v21;
LABEL_20:
        sub_1A56AE7B0(v26, v25);
LABEL_21:
        sub_1A56AE7B0((uint64_t)v20, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
        return 1;
      }
      else
      {
LABEL_26:
        sub_1A54E4D44((uint64_t)v20, &qword_1E9675E30);
        return 0;
      }
  }
}

uint64_t _s7Sharing9SFAirDropO06NearbyA11InteractionV5StateO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (unsigned __int8 *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675E30);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t)&v16[*(int *)(v14 + 56)];
  sub_1A56ADD88(a1, (uint64_t)v16, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  sub_1A56ADD88(a2, v17, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1A56ADD88((uint64_t)v16, (uint64_t)v12, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_1A56AE7B0((uint64_t)v12, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
        goto LABEL_13;
      }
      sub_1A56B4EC0((uint64_t)v12, (uint64_t)v9, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      sub_1A56B4EC0(v17, (uint64_t)v7, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      char v18 = _s7Sharing9SFAirDropO06NearbyA11InteractionV17ConnectionContextV2eeoiySbAG_AGtFZ_0(v9, v7);
      sub_1A56AE7B0((uint64_t)v7, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      sub_1A56AE7B0((uint64_t)v9, type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext);
      sub_1A56AE7B0((uint64_t)v16, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
      return v18 & 1;
    case 2u:
      if (swift_getEnumCaseMultiPayload() == 2) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_13;
      }
      goto LABEL_11;
    case 4u:
      if (swift_getEnumCaseMultiPayload() == 4) {
        goto LABEL_11;
      }
      goto LABEL_13;
    default:
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_13:
        sub_1A54E4D44((uint64_t)v16, &qword_1E9675E30);
        char v18 = 0;
      }
      else
      {
LABEL_11:
        sub_1A56AE7B0((uint64_t)v16, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
        char v18 = 1;
      }
      return v18 & 1;
  }
}

uint64_t _s7Sharing9SFAirDropO06NearbyA11InteractionV17ConnectionContextV2eeoiySbAG_AGtFZ_0(unsigned char *a1, unsigned __int8 *a2)
{
  uint64_t v4 = 0x6E776F6E6B6E75;
  uint64_t v5 = sub_1A56D4CB8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v63 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9675E38);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v62 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v62 - v18;
  uint64_t v64 = a1;
  char v65 = a2;
  uint64_t v20 = *a2;
  unint64_t v21 = 0xE700000000000000;
  uint64_t v22 = 0x6E776F6E6B6E75;
  switch(*a1)
  {
    case 1:
      uint64_t v22 = 0x636972656E6567;
      break;
    case 2:
      uint64_t v22 = 0x706F7244726961;
      break;
    case 3:
      unint64_t v21 = 0xE400000000000000;
      uint64_t v22 = 1952802157;
      break;
    case 4:
      unint64_t v21 = 0xE500000000000000;
      uint64_t v22 = 0x6572616873;
      break;
    case 5:
      uint64_t v22 = 0x6D79615072656570;
      unint64_t v21 = 0xEB00000000746E65;
      break;
    default:
      break;
  }
  unint64_t v23 = 0xE700000000000000;
  switch(v20)
  {
    case 1:
      if (v22 == 0x636972656E6567) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      if (v22 != 0x706F7244726961) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v23 = 0xE400000000000000;
      if (v22 != 1952802157) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v23 = 0xE500000000000000;
      uint64_t v4 = 0x6572616873;
      goto LABEL_15;
    case 5:
      unint64_t v23 = 0xEB00000000746E65;
      if (v22 != 0x6D79615072656570) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v22 != v4) {
        goto LABEL_19;
      }
LABEL_16:
      if (v21 == v23)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
LABEL_19:
        char v24 = sub_1A56D5F28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v25 = 0;
        if ((v24 & 1) == 0) {
          return v25 & 1;
        }
      }
      uint64_t v26 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      sub_1A54F60EC((uint64_t)&v64[*(int *)(v26 + 20)], (uint64_t)v19, qword_1E966B098);
      uint64_t v62 = (int *)v26;
      sub_1A54F60EC((uint64_t)&v65[*(int *)(v26 + 20)], (uint64_t)v17, qword_1E966B098);
      uint64_t v27 = (uint64_t)&v10[*(int *)(v8 + 48)];
      sub_1A54F60EC((uint64_t)v19, (uint64_t)v10, qword_1E966B098);
      sub_1A54F60EC((uint64_t)v17, v27, qword_1E966B098);
      uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
      if (v28((uint64_t)v10, 1, v5) == 1)
      {
        sub_1A54E4D44((uint64_t)v17, qword_1E966B098);
        sub_1A54E4D44((uint64_t)v19, qword_1E966B098);
        if (v28(v27, 1, v5) == 1)
        {
          sub_1A54E4D44((uint64_t)v10, qword_1E966B098);
          goto LABEL_27;
        }
LABEL_25:
        sub_1A54E4D44((uint64_t)v10, &qword_1E9675E38);
        goto LABEL_57;
      }
      sub_1A54F60EC((uint64_t)v10, (uint64_t)v14, qword_1E966B098);
      if (v28(v27, 1, v5) == 1)
      {
        sub_1A54E4D44((uint64_t)v17, qword_1E966B098);
        sub_1A54E4D44((uint64_t)v19, qword_1E966B098);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
        goto LABEL_25;
      }
      uint64_t v29 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v63, v27, v5);
      sub_1A56ADCEC(&qword_1E966C080, MEMORY[0x1E4F27990]);
      char v30 = sub_1A56D5058();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v6 + 8);
      v31(v29, v5);
      sub_1A54E4D44((uint64_t)v17, qword_1E966B098);
      sub_1A54E4D44((uint64_t)v19, qword_1E966B098);
      v31(v14, v5);
      sub_1A54E4D44((uint64_t)v10, qword_1E966B098);
      if ((v30 & 1) == 0) {
        goto LABEL_57;
      }
LABEL_27:
      uint64_t v32 = v62;
      uint64_t v33 = v62[6];
      uint64_t v34 = &v64[v33];
      uint64_t v35 = *(void *)&v64[v33 + 8];
      uint64_t v36 = &v65[v33];
      uint64_t v37 = *((void *)v36 + 1);
      if (!v35)
      {
        if (v37) {
          goto LABEL_57;
        }
LABEL_34:
        uint64_t v39 = v32[7];
        uint64_t v40 = &v64[v39];
        uint64_t v41 = *(void *)&v64[v39 + 8];
        uint64_t v42 = &v65[v39];
        uint64_t v43 = *((void *)v42 + 1);
        if (v41)
        {
          if (!v43) {
            goto LABEL_57;
          }
          if (*v40 != *(void *)v42 || v41 != v43)
          {
            char v44 = sub_1A56D5F28();
            char v25 = 0;
            if ((v44 & 1) == 0) {
              return v25 & 1;
            }
          }
        }
        else if (v43)
        {
          goto LABEL_57;
        }
        uint64_t v45 = v32[8];
        char v46 = &v64[v45];
        uint64_t v47 = *(void *)&v64[v45 + 8];
        char v48 = &v65[v45];
        uint64_t v49 = *((void *)v48 + 1);
        if (v47)
        {
          if (!v49) {
            goto LABEL_57;
          }
          if (*v46 != *(void *)v48 || v47 != v49)
          {
            char v50 = sub_1A56D5F28();
            char v25 = 0;
            if ((v50 & 1) == 0) {
              return v25 & 1;
            }
          }
        }
        else if (v49)
        {
          goto LABEL_57;
        }
        uint64_t v51 = v32[9];
        uint64_t v52 = &v64[v51];
        uint64_t v53 = *(void *)&v64[v51 + 8];
        uint64_t v54 = &v65[v51];
        uint64_t v55 = *((void *)v54 + 1);
        if (v53)
        {
          if (v55)
          {
            if (*v52 != *(void *)v54 || v53 != v55)
            {
              char v56 = sub_1A56D5F28();
              char v25 = 0;
              if ((v56 & 1) == 0) {
                return v25 & 1;
              }
            }
LABEL_55:
            uint64_t v57 = v32[10];
            int v58 = v64[v57];
            int v59 = v65[v57];
            if (v58 == 2)
            {
              if (v59 != 2) {
                goto LABEL_57;
              }
            }
            else
            {
              char v25 = 0;
              BOOL v61 = (v58 & 1) == 0;
              if (v59 == 2 || ((v61 ^ v59) & 1) == 0) {
                return v25 & 1;
              }
            }
            char v25 = _s7Sharing9SFAirDropO17PermissionRequestV18InterventionActionV2eeoiySbAGy_x_G_AItFZ_0();
            return v25 & 1;
          }
        }
        else if (!v55)
        {
          goto LABEL_55;
        }
LABEL_57:
        char v25 = 0;
        return v25 & 1;
      }
      if (!v37) {
        goto LABEL_57;
      }
      if (*v34 == *(void *)v36 && v35 == v37) {
        goto LABEL_34;
      }
      char v38 = sub_1A56D5F28();
      char v25 = 0;
      if (v38) {
        goto LABEL_34;
      }
      return v25 & 1;
  }
}

unint64_t sub_1A56B4B78()
{
  unint64_t result = qword_1E9675B90;
  if (!qword_1E9675B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B90);
  }
  return result;
}

unint64_t sub_1A56B4BCC()
{
  unint64_t result = qword_1E9675B98;
  if (!qword_1E9675B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675B98);
  }
  return result;
}

unint64_t sub_1A56B4C20()
{
  unint64_t result = qword_1E9675BA8;
  if (!qword_1E9675BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675BA8);
  }
  return result;
}

unint64_t sub_1A56B4C74()
{
  unint64_t result = qword_1E9675BC8;
  if (!qword_1E9675BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675BC8);
  }
  return result;
}

unint64_t sub_1A56B4CC8()
{
  unint64_t result = qword_1E9675BD0;
  if (!qword_1E9675BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675BD0);
  }
  return result;
}

unint64_t sub_1A56B4D1C()
{
  unint64_t result = qword_1E9675BD8;
  if (!qword_1E9675BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675BD8);
  }
  return result;
}

unint64_t sub_1A56B4D70()
{
  unint64_t result = qword_1E9675C28;
  if (!qword_1E9675C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C28);
  }
  return result;
}

unint64_t sub_1A56B4DC4()
{
  unint64_t result = qword_1E9675C30;
  if (!qword_1E9675C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C30);
  }
  return result;
}

unint64_t sub_1A56B4E18()
{
  unint64_t result = qword_1E9675C38;
  if (!qword_1E9675C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C38);
  }
  return result;
}

unint64_t sub_1A56B4E6C()
{
  unint64_t result = qword_1E9675C40;
  if (!qword_1E9675C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C40);
  }
  return result;
}

uint64_t sub_1A56B4EC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1A56B4F28()
{
  unint64_t result = qword_1E9675C48;
  if (!qword_1E9675C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C48);
  }
  return result;
}

unint64_t sub_1A56B4F7C()
{
  unint64_t result = qword_1E9675C58;
  if (!qword_1E9675C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C58);
  }
  return result;
}

unint64_t sub_1A56B4FD0()
{
  unint64_t result = qword_1E9675C60;
  if (!qword_1E9675C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C60);
  }
  return result;
}

unint64_t sub_1A56B5024()
{
  unint64_t result = qword_1E9675C68;
  if (!qword_1E9675C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675C68);
  }
  return result;
}

unint64_t sub_1A56B5078()
{
  unint64_t result = qword_1E9675CA0;
  if (!qword_1E9675CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675CA0);
  }
  return result;
}

unint64_t sub_1A56B50CC()
{
  unint64_t result = qword_1E9675CB0;
  if (!qword_1E9675CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675CB0);
  }
  return result;
}

unint64_t sub_1A56B5120()
{
  unint64_t result = qword_1E9675CC0;
  if (!qword_1E9675CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675CC0);
  }
  return result;
}

unint64_t sub_1A56B5178()
{
  unint64_t result = qword_1E9675CE8;
  if (!qword_1E9675CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675CE8);
  }
  return result;
}

uint64_t sub_1A56B51CC()
{
  return sub_1A56ADCEC(&qword_1E966C7E0, MEMORY[0x1E4F27990]);
}

unint64_t sub_1A56B5218()
{
  unint64_t result = qword_1E9675CF0;
  if (!qword_1E9675CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675CF0);
  }
  return result;
}

uint64_t sub_1A56B526C()
{
  return sub_1A56ADCEC(&qword_1E9675CF8, (void (*)(uint64_t))type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
}

ValueMetadata *type metadata accessor for SFAirDrop.NearbySharingDiscovery()
{
  return &type metadata for SFAirDrop.NearbySharingDiscovery;
}

ValueMetadata *type metadata accessor for SFAirDrop.NearbySharingDiscovery.PollingType()
{
  return &type metadata for SFAirDrop.NearbySharingDiscovery.PollingType;
}

void *_s22NearbySharingDiscoveryO7RequestVwCP(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A56D4CB8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwxx(uint64_t a1)
{
  uint64_t v2 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56B5694);
}

uint64_t sub_1A56B5694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t _s22NearbySharingDiscoveryO7RequestVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56B576C);
}

uint64_t sub_1A56B576C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1A56B582C()
{
  uint64_t result = sub_1A56D4CB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *_s22NearbySharingAssertionVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A56D4CB8();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = a3[7];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    uint64_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = type metadata accessor for SFClientIdentity();
    swift_bridgeObjectRetain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v8(v14, v15, v7);
      uint64_t v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      *(_DWORD *)((char *)v14 + v20[12]) = *(_DWORD *)((char *)v15 + v20[12]);
      uint64_t v21 = v20[16];
      uint64_t v22 = (uint64_t *)((char *)v14 + v21);
      unint64_t v23 = (uint64_t *)((char *)v15 + v21);
      uint64_t v25 = *v23;
      uint64_t v24 = v23[1];
      void *v22 = v25;
      v22[1] = v24;
      uint64_t v26 = v20[20];
      uint64_t v27 = (uint64_t *)((char *)v14 + v26);
      uint64_t v28 = (uint64_t *)((char *)v15 + v26);
      uint64_t v29 = v28[1];
      *uint64_t v27 = *v28;
      v27[1] = v29;
      *(_DWORD *)((char *)v14 + v20[24]) = *(_DWORD *)((char *)v15 + v20[24]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v18 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v18;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s22NearbySharingAssertionVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A56D4CB8();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  type metadata accessor for SFClientIdentity();
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result)
  {
    if (result != 1) {
      return result;
    }
    v5(v6, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void *_s22NearbySharingAssertionVwcp(void *a1, void *a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)((char *)a1 + v8);
  uint64_t v11 = (void *)((char *)a2 + v8);
  uint64_t v12 = v11[1];
  void *v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (void *)((char *)a1 + v9);
  uint64_t v14 = (void *)((char *)a2 + v9);
  uint64_t v15 = type metadata accessor for SFClientIdentity();
  swift_bridgeObjectRetain();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v7(v13, v14, v6);
    uint64_t v18 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    *(_DWORD *)((char *)v13 + v18[12]) = *(_DWORD *)((char *)v14 + v18[12]);
    uint64_t v19 = v18[16];
    uint64_t v20 = (void *)((char *)v13 + v19);
    uint64_t v21 = (void *)((char *)v14 + v19);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    *uint64_t v20 = v23;
    v20[1] = v22;
    uint64_t v24 = v18[20];
    uint64_t v25 = (void *)((char *)v13 + v24);
    uint64_t v26 = (void *)((char *)v14 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    *(_DWORD *)((char *)v13 + v18[24]) = *(_DWORD *)((char *)v14 + v18[24]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v17 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v17;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t _s22NearbySharingAssertionVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v8(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  void *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v12 = a3[7];
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    sub_1A56AE7B0(a1 + v12, (uint64_t (*)(void))type metadata accessor for SFClientIdentity);
    uint64_t v15 = type metadata accessor for SFClientIdentity();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v13, v14, v6);
      uint64_t v17 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      *(_DWORD *)((char *)v13 + v17[12]) = *(_DWORD *)((char *)v14 + v17[12]);
      uint64_t v18 = v17[16];
      uint64_t v19 = (void *)((char *)v13 + v18);
      uint64_t v20 = (void *)((char *)v14 + v18);
      *uint64_t v19 = *v20;
      v19[1] = v20[1];
      uint64_t v21 = v17[20];
      uint64_t v22 = (void *)((char *)v13 + v21);
      uint64_t v23 = (void *)((char *)v14 + v21);
      void *v22 = *v23;
      v22[1] = v23[1];
      *(_DWORD *)((char *)v13 + v17[24]) = *(_DWORD *)((char *)v14 + v17[24]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      *uint64_t v13 = *v14;
      v13[1] = v14[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s22NearbySharingAssertionVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for SFClientIdentity();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v12 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
    *(_DWORD *)&v9[v12[12]] = *(_DWORD *)&v10[v12[12]];
    *(_OWORD *)&v9[v12[16]] = *(_OWORD *)&v10[v12[16]];
    *(_OWORD *)&v9[v12[20]] = *(_OWORD *)&v10[v12[20]];
    *(_DWORD *)&v9[v12[24]] = *(_DWORD *)&v10[v12[24]];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  return a1;
}

uint64_t _s22NearbySharingAssertionVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v8(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  void *v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)(a1 + v14);
    uint64_t v16 = (char *)(a2 + v14);
    sub_1A56AE7B0(a1 + v14, (uint64_t (*)(void))type metadata accessor for SFClientIdentity);
    uint64_t v17 = type metadata accessor for SFClientIdentity();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v16, v6);
      uint64_t v18 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E966C078);
      *(_DWORD *)&v15[v18[12]] = *(_DWORD *)&v16[v18[12]];
      *(_OWORD *)&v15[v18[16]] = *(_OWORD *)&v16[v18[16]];
      *(_OWORD *)&v15[v18[20]] = *(_OWORD *)&v16[v18[20]];
      *(_DWORD *)&v15[v18[24]] = *(_DWORD *)&v16[v18[24]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s22NearbySharingAssertionVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56B6304);
}

uint64_t sub_1A56B6304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for SFClientIdentity();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t _s22NearbySharingAssertionVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56B6448);
}

uint64_t sub_1A56B6448(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for SFClientIdentity();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_1A56B6578()
{
  uint64_t result = sub_1A56D4CB8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SFClientIdentity();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *_s29NearbySharingAssertionRequestVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1A56D4CB8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s29NearbySharingAssertionRequestVwxx(uint64_t a1)
{
  uint64_t v2 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t _s29NearbySharingAssertionRequestVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s29NearbySharingAssertionRequestVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s29NearbySharingAssertionRequestVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s29NearbySharingAssertionRequestVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s29NearbySharingAssertionRequestVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56B69DC);
}

uint64_t sub_1A56B69DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t _s29NearbySharingAssertionRequestVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56B6AB4);
}

uint64_t sub_1A56B6AB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1A56B6B74()
{
  uint64_t result = sub_1A56D4CB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *_s24NearbySharingInteractionVwCP(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A56D4CB8();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = a3[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v51 = v9;
      *uint64_t v11 = *v12;
      uint64_t v14 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      uint64_t v15 = v14[5];
      uint64_t v16 = &v11[v15];
      uint64_t v17 = &v12[v15];
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(&v12[v15], 1, v7))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
        memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        v51(v16, v17, v7);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v16, 0, 1, v7);
      }
      uint64_t v20 = v14[6];
      uint64_t v21 = &v11[v20];
      uint64_t v22 = &v12[v20];
      uint64_t v23 = v22[1];
      *uint64_t v21 = *v22;
      v21[1] = v23;
      uint64_t v24 = v14[7];
      uint64_t v25 = &v11[v24];
      uint64_t v26 = &v12[v24];
      uint64_t v27 = v26[1];
      *uint64_t v25 = *v26;
      v25[1] = v27;
      uint64_t v28 = v14[8];
      uint64_t v29 = &v11[v28];
      char v30 = &v12[v28];
      uint64_t v31 = v30[1];
      *uint64_t v29 = *v30;
      v29[1] = v31;
      uint64_t v32 = v14[9];
      uint64_t v33 = &v11[v32];
      uint64_t v34 = &v12[v32];
      uint64_t v35 = v34[1];
      *uint64_t v33 = *v34;
      v33[1] = v35;
      v11[v14[10]] = v12[v14[10]];
      uint64_t v36 = v14[11];
      uint64_t v37 = &v11[v36];
      char v38 = &v12[v36];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v51(v37, v38, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    uint64_t v39 = a3[6];
    uint64_t v40 = (char *)a1 + v39;
    uint64_t v41 = (char *)a2 + v39;
    uint64_t v42 = sub_1A56D4C28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    uint64_t v43 = a3[7];
    char v44 = (char *)a1 + v43;
    uint64_t v45 = (char *)a2 + v43;
    uint64_t v46 = sub_1A56D5B08();
    uint64_t v47 = *(void *)(v46 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
    {
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
      memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v44, v45, v46);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
    }
    uint64_t v49 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)a1 + v49) = *((unsigned char *)a2 + v49);
  }
  return a1;
}

uint64_t _s24NearbySharingInteractionVwxx(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A56D4CB8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + a2[5];
  type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    uint64_t v9 = v7 + *(int *)(v8 + 20);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4)) {
      v6(v9, v4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6(v7 + *(int *)(v8 + 44), v4);
  }
  uint64_t v10 = a1 + a2[6];
  uint64_t v11 = sub_1A56D4C28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = a1 + a2[7];
  uint64_t v13 = sub_1A56D5B08();
  uint64_t v16 = *(void *)(v13 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v12, 1, v13);
  if (!result)
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
    return v15(v12, v13);
  }
  return result;
}

unsigned char *_s24NearbySharingInteractionVwcp(unsigned char *a1, unsigned char *a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v50 = v8;
    uint64_t v49 = a3;
    unsigned char *v10 = *v11;
    uint64_t v13 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    uint64_t v14 = v13[5];
    uint64_t v15 = &v10[v14];
    uint64_t v16 = &v11[v14];
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(&v11[v14], 1, v6))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      v50(v15, v16, v6);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
    }
    uint64_t v18 = v13[6];
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = v13[7];
    uint64_t v23 = &v10[v22];
    uint64_t v24 = &v11[v22];
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = v13[8];
    uint64_t v27 = &v10[v26];
    uint64_t v28 = &v11[v26];
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = v13[9];
    uint64_t v31 = &v10[v30];
    uint64_t v32 = &v11[v30];
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    v10[v13[10]] = v11[v13[10]];
    uint64_t v34 = v13[11];
    uint64_t v35 = &v10[v34];
    uint64_t v36 = &v11[v34];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v50(v35, v36, v6);
    swift_storeEnumTagMultiPayload();
    a3 = v49;
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  uint64_t v37 = a3[6];
  char v38 = &a1[v37];
  uint64_t v39 = &a2[v37];
  uint64_t v40 = sub_1A56D4C28();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
  uint64_t v41 = a3[7];
  uint64_t v42 = &a1[v41];
  uint64_t v43 = &a2[v41];
  uint64_t v44 = sub_1A56D5B08();
  uint64_t v45 = *(void *)(v44 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
  {
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
    memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v45 + 16))(v42, v43, v44);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
  }
  uint64_t v47 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v47] = a2[v47];
  return a1;
}

uint64_t _s24NearbySharingInteractionVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v8 = a3[5];
    uint64_t v9 = (unsigned char *)(a1 + v8);
    uint64_t v10 = (unsigned char *)(a2 + v8);
    sub_1A56AE7B0(a1 + v8, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    uint64_t v11 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v9 = *v10;
      uint64_t v12 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      uint64_t v13 = v12[5];
      uint64_t v14 = &v9[v13];
      uint64_t v15 = &v10[v13];
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(&v10[v13], 1, v6))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v14, v15, v6);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
      }
      uint64_t v17 = v12[6];
      uint64_t v18 = &v9[v17];
      uint64_t v19 = &v10[v17];
      *uint64_t v18 = *v19;
      v18[1] = v19[1];
      uint64_t v20 = v12[7];
      uint64_t v21 = &v9[v20];
      uint64_t v22 = &v10[v20];
      *uint64_t v21 = *v22;
      v21[1] = v22[1];
      uint64_t v23 = v12[8];
      uint64_t v24 = &v9[v23];
      uint64_t v25 = &v10[v23];
      *uint64_t v24 = *v25;
      v24[1] = v25[1];
      uint64_t v26 = v12[9];
      uint64_t v27 = &v9[v26];
      uint64_t v28 = &v10[v26];
      *uint64_t v27 = *v28;
      v27[1] = v28[1];
      v9[v12[10]] = v10[v12[10]];
      uint64_t v29 = v12[11];
      uint64_t v30 = &v9[v29];
      uint64_t v46 = &v10[v29];
      uint64_t v45 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45(v30, v46, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v31 = a3[6];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = sub_1A56D4C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  uint64_t v35 = a3[7];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  uint64_t v38 = sub_1A56D5B08();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v39 + 48);
  int v41 = v40(v36, 1, v38);
  int v42 = v40(v37, 1, v38);
  if (!v41)
  {
    if (!v42)
    {
      (*(void (**)(void *, void *, uint64_t))(v39 + 24))(v36, v37, v38);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v39 + 8))(v36, v38);
    goto LABEL_13;
  }
  if (v42)
  {
LABEL_13:
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
    memcpy(v36, v37, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, void *, uint64_t))(v39 + 16))(v36, v37, v38);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
LABEL_14:
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

unsigned char *_s24NearbySharingInteractionVwtk(unsigned char *a1, unsigned char *a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v31 = v8;
    unsigned char *v10 = *v11;
    uint64_t v13 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    uint64_t v14 = v13[5];
    __dst = &v10[v14];
    uint64_t v15 = &v11[v14];
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(&v11[v14], 1, v6))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
      memcpy(__dst, v15, *(void *)(*(void *)(v16 - 8) + 64));
      uint64_t v17 = v31;
    }
    else
    {
      uint64_t v18 = v15;
      uint64_t v17 = v31;
      v31(__dst, v18, v6);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(__dst, 0, 1, v6);
    }
    *(_OWORD *)&v10[v13[6]] = *(_OWORD *)&v11[v13[6]];
    *(_OWORD *)&v10[v13[7]] = *(_OWORD *)&v11[v13[7]];
    *(_OWORD *)&v10[v13[8]] = *(_OWORD *)&v11[v13[8]];
    *(_OWORD *)&v10[v13[9]] = *(_OWORD *)&v11[v13[9]];
    v10[v13[10]] = v11[v13[10]];
    v17(&v10[v13[11]], &v11[v13[11]], v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  uint64_t v19 = a3[6];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = sub_1A56D4C28();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = a3[7];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = sub_1A56D5B08();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v27 + 32))(v24, v25, v26);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v29 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v29] = a2[v29];
  return a1;
}

uint64_t _s24NearbySharingInteractionVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v8 = a3[5];
    uint64_t v9 = (unsigned char *)(a1 + v8);
    uint64_t v10 = (unsigned char *)(a2 + v8);
    sub_1A56AE7B0(a1 + v8, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    uint64_t v11 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v9 = *v10;
      uint64_t v12 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      uint64_t v13 = v12[5];
      __dst = &v9[v13];
      uint64_t v14 = &v10[v13];
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(&v10[v13], 1, v6))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
        memcpy(__dst, v14, *(void *)(*(void *)(v15 - 8) + 64));
        uint64_t v16 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
      }
      else
      {
        uint64_t v17 = v14;
        uint64_t v16 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
        v16(__dst, v17, v6);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(__dst, 0, 1, v6);
      }
      *(_OWORD *)&v9[v12[6]] = *(_OWORD *)&v10[v12[6]];
      *(_OWORD *)&v9[v12[7]] = *(_OWORD *)&v10[v12[7]];
      *(_OWORD *)&v9[v12[8]] = *(_OWORD *)&v10[v12[8]];
      *(_OWORD *)&v9[v12[9]] = *(_OWORD *)&v10[v12[9]];
      v9[v12[10]] = v10[v12[10]];
      v16(&v9[v12[11]], &v10[v12[11]], v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v18 = a3[6];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_1A56D4C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = sub_1A56D5B08();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 40))(v23, v24, v25);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_13;
  }
  if (v29)
  {
LABEL_13:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 32))(v23, v24, v25);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_14:
  uint64_t v31 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v31) = *(unsigned char *)(a2 + v31);
  return a1;
}

uint64_t _s24NearbySharingInteractionVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56B81F8);
}

uint64_t sub_1A56B81F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A56D4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
    if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
    {
      uint64_t v8 = v11;
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = a3[5];
    }
    else
    {
      uint64_t v14 = sub_1A56D4C28();
      if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
      {
        uint64_t v8 = v14;
        uint64_t v12 = *(void *)(v14 - 8);
        uint64_t v13 = a3[6];
      }
      else
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
        if (*(_DWORD *)(*(void *)(v15 - 8) + 84) != a2)
        {
          unsigned int v17 = *(unsigned __int8 *)(a1 + a3[8]);
          if (v17 >= 2) {
            return ((v17 + 2147483646) & 0x7FFFFFFF) + 1;
          }
          else {
            return 0;
          }
        }
        uint64_t v8 = v15;
        uint64_t v12 = *(void *)(v15 - 8);
        uint64_t v13 = a3[7];
      }
    }
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t _s24NearbySharingInteractionVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56B83CC);
}

uint64_t sub_1A56B83CC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = type metadata accessor for SFAirDrop.NearbySharingInteraction.State(0);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t v16 = sub_1A56D4C28();
      if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
      {
        uint64_t v10 = v16;
        uint64_t v14 = *(void *)(v16 - 8);
        uint64_t v15 = a4[6];
      }
      else
      {
        uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E966BBB8);
        if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
        {
          *(unsigned char *)(a1 + a4[8]) = a2 + 1;
          return result;
        }
        uint64_t v10 = result;
        uint64_t v14 = *(void *)(result - 8);
        uint64_t v15 = a4[7];
      }
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_1A56B8578()
{
  sub_1A56D4CB8();
  if (v0 <= 0x3F)
  {
    type metadata accessor for SFAirDrop.NearbySharingInteraction.State(319);
    if (v1 <= 0x3F)
    {
      sub_1A56D4C28();
      if (v2 <= 0x3F)
      {
        sub_1A56B95C0(319, &qword_1E966C488, MEMORY[0x1E4FBD178]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

ValueMetadata *type metadata accessor for SFAirDrop.NearbySharingInteraction.PresenceContext()
{
  return &type metadata for SFAirDrop.NearbySharingInteraction.PresenceContext;
}

void *_s24NearbySharingInteractionV17ConnectionContextVwCP(unsigned char *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1A56D4CB8();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (void *)((char *)v4 + v14);
    unsigned int v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (void *)((char *)v4 + v15);
    uint64_t v20 = (void *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[8];
    uint64_t v23 = a3[9];
    uint64_t v24 = (void *)((char *)v4 + v22);
    uint64_t v25 = (void *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = (void *)((char *)v4 + v23);
    int v28 = (void *)((char *)a2 + v23);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v31 = (char *)v4 + v30;
    uint64_t v32 = (char *)a2 + v30;
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v31, v32, v10);
  }
  return v4;
}

uint64_t _s24NearbySharingInteractionV17ConnectionContextVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1A56D4CB8();
  uint64_t v9 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 44);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);

  return v7(v6, v5);
}

unsigned char *_s24NearbySharingInteractionV17ConnectionContextVwcp(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1A56D4CB8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  unsigned int v17 = &a1[v13];
  uint64_t v18 = &a2[v13];
  uint64_t v19 = v18[1];
  *unsigned int v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = &a1[v20];
  uint64_t v23 = &a2[v20];
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = &a1[v21];
  uint64_t v26 = &a2[v21];
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31(v29, v30, v9);
  return a1;
}

unsigned char *_s24NearbySharingInteractionV17ConnectionContextVwca(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1A56D4CB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  unsigned int v17 = &a2[v15];
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[9];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[10]] = a2[a3[10]];
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(&a1[a3[11]], &a2[a3[11]], v9);
  return a1;
}

unsigned char *_s24NearbySharingInteractionV17ConnectionContextVwtk(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1A56D4CB8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    int v12 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32);
  }
  else
  {
    int v12 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32);
    v12(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  uint64_t v14 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  uint64_t v15 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  v12(&a1[v15], &a2[v15], v9);
  return a1;
}

unsigned char *_s24NearbySharingInteractionV17ConnectionContextVwta(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1A56D4CB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  unsigned int v17 = (uint64_t *)&a2[v15];
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = (uint64_t *)&a2[v20];
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[8];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = (uint64_t *)&a2[v25];
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[9];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = (uint64_t *)&a2[v30];
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(&a1[v35], &a2[v35], v9);
  return a1;
}

uint64_t _s24NearbySharingInteractionV17ConnectionContextVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56B9228);
}

uint64_t sub_1A56B9228(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v12 = *(void *)(a1 + a3[6] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
  else
  {
    uint64_t v14 = sub_1A56D4CB8();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + a3[11];
    return v15(v17, a2, v16);
  }
}

uint64_t _s24NearbySharingInteractionV17ConnectionContextVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56B9380);
}

uint64_t sub_1A56B9380(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[6] + 8) = a2;
  }
  else
  {
    uint64_t v13 = sub_1A56D4CB8();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[11];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_1A56B94B8()
{
  sub_1A56B95C0(319, &qword_1E966C090, MEMORY[0x1E4F27990]);
  if (v0 <= 0x3F)
  {
    sub_1A56D4CB8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1A56B95C0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A56D5898();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

ValueMetadata *type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext.InteractionType()
{
  return &type metadata for SFAirDrop.NearbySharingInteraction.ConnectionContext.InteractionType;
}

uint64_t _s24NearbySharingInteractionV11FailureTypeOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
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
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A56B96E4);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = (v7 + 2147483646) & 0x7FFFFFFF;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *_s24NearbySharingInteractionV11FailureTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
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
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1A56B97CCLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1A56B97F4(unsigned __int8 *a1)
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

unsigned char *sub_1A56B9810(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SFAirDrop.NearbySharingInteraction.FailureType()
{
  return &type metadata for SFAirDrop.NearbySharingInteraction.FailureType;
}

void *_s24NearbySharingInteractionV5StateOwCP(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      unsigned int v7 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      uint64_t v8 = v7[5];
      unsigned int v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_1A56D4CB8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      uint64_t v15 = v7[6];
      uint64_t v16 = (void *)((char *)a1 + v15);
      uint64_t v17 = (void *)((char *)a2 + v15);
      uint64_t v18 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v18;
      uint64_t v19 = v7[7];
      uint64_t v20 = (void *)((char *)a1 + v19);
      uint64_t v21 = (void *)((char *)a2 + v19);
      uint64_t v22 = v21[1];
      *uint64_t v20 = *v21;
      v20[1] = v22;
      uint64_t v23 = v7[8];
      uint64_t v24 = (void *)((char *)a1 + v23);
      uint64_t v25 = (void *)((char *)a2 + v23);
      uint64_t v26 = v25[1];
      *uint64_t v24 = *v25;
      v24[1] = v26;
      uint64_t v27 = v7[9];
      uint64_t v28 = (void *)((char *)a1 + v27);
      uint64_t v29 = (void *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      *((unsigned char *)a1 + v7[10]) = *((unsigned char *)a2 + v7[10]);
      uint64_t v31 = v7[11];
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v34(v32, v33, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t _s24NearbySharingInteractionV5StateOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    uint64_t v4 = a1 + *(int *)(v3 + 20);
    uint64_t v5 = sub_1A56D4CB8();
    uint64_t v8 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = a1 + *(int *)(v3 + 44);
    unsigned int v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v6, v5);
  }
  return result;
}

unsigned char *_s24NearbySharingInteractionV5StateOwcp(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v6 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    uint64_t v7 = v6[5];
    uint64_t v8 = &a1[v7];
    unsigned int v9 = &a2[v7];
    uint64_t v10 = sub_1A56D4CB8();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v13 = v6[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v6[7];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v6[8];
    uint64_t v22 = &a1[v21];
    uint64_t v23 = &a2[v21];
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v6[9];
    uint64_t v26 = &a1[v25];
    uint64_t v27 = &a2[v25];
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    a1[v6[10]] = a2[v6[10]];
    uint64_t v29 = v6[11];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    uint64_t v32 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32(v30, v31, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

unsigned char *_s24NearbySharingInteractionV5StateOwca(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A56AE7B0((uint64_t)a1, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      uint64_t v7 = v6[5];
      uint64_t v8 = &a1[v7];
      unsigned int v9 = &a2[v7];
      uint64_t v10 = sub_1A56D4CB8();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      uint64_t v13 = v6[6];
      uint64_t v14 = &a1[v13];
      uint64_t v15 = &a2[v13];
      *uint64_t v14 = *v15;
      v14[1] = v15[1];
      uint64_t v16 = v6[7];
      uint64_t v17 = &a1[v16];
      uint64_t v18 = &a2[v16];
      *uint64_t v17 = *v18;
      v17[1] = v18[1];
      uint64_t v19 = v6[8];
      uint64_t v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      *uint64_t v20 = *v21;
      v20[1] = v21[1];
      uint64_t v22 = v6[9];
      uint64_t v23 = &a1[v22];
      uint64_t v24 = &a2[v22];
      *uint64_t v23 = *v24;
      v23[1] = v24[1];
      a1[v6[10]] = a2[v6[10]];
      uint64_t v25 = v6[11];
      uint64_t v26 = &a1[v25];
      uint64_t v27 = &a2[v25];
      uint64_t v28 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v26, v27, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

unsigned char *_s24NearbySharingInteractionV5StateOwtk(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v6 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
    uint64_t v7 = v6[5];
    uint64_t v8 = &a1[v7];
    unsigned int v9 = &a2[v7];
    uint64_t v10 = sub_1A56D4CB8();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      uint64_t v13 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
    }
    else
    {
      uint64_t v13 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
      v13(v8, v9, v10);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
    *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
    *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
    a1[v6[10]] = a2[v6[10]];
    v13(&a1[v6[11]], &a2[v6[11]], v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

unsigned char *_s24NearbySharingInteractionV5StateOwta(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A56AE7B0((uint64_t)a1, type metadata accessor for SFAirDrop.NearbySharingInteraction.State);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = (int *)type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(0);
      uint64_t v7 = v6[5];
      uint64_t v8 = &a1[v7];
      unsigned int v9 = &a2[v7];
      uint64_t v10 = sub_1A56D4CB8();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1E966B098);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
        uint64_t v13 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
      }
      else
      {
        uint64_t v13 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
        v13(v8, v9, v10);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
      *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
      *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
      *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
      a1[v6[10]] = a2[v6[10]];
      v13(&a1[v6[11]], &a2[v6[11]], v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1A56BA460()
{
  uint64_t result = type metadata accessor for SFAirDrop.NearbySharingInteraction.ConnectionContext(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *_s24NearbySharingInteractionV17ConnectionContextV15InteractionTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56BA5CCLL);
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

ValueMetadata *_s24NearbySharingInteractionV10CodingKeysOMa()
{
  return &_s24NearbySharingInteractionV10CodingKeysON;
}

unsigned char *_s24NearbySharingInteractionV5StateO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56BA6D0);
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

ValueMetadata *_s24NearbySharingInteractionV5StateO10CodingKeysOMa()
{
  return &_s24NearbySharingInteractionV5StateO10CodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV5StateO26PresenceDetectedCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV5StateO26PresenceDetectedCodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV5StateO20ConnectingCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV5StateO20ConnectingCodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV5StateO19ConnectedCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV5StateO19ConnectedCodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV5StateO31ConnectionInterruptedCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV5StateO31ConnectionInterruptedCodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV5StateO15EndedCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV5StateO15EndedCodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV11FailureTypeO10CodingKeysOMa()
{
  return &_s24NearbySharingInteractionV11FailureTypeO10CodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV11FailureTypeO18PullAwayCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV11FailureTypeO18PullAwayCodingKeysON;
}

unsigned char *_s24NearbySharingInteractionV5StateO26PresenceDetectedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A56BA81CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s24NearbySharingInteractionV11FailureTypeO21UnsupportedCodingKeysOMa()
{
  return &_s24NearbySharingInteractionV11FailureTypeO21UnsupportedCodingKeysON;
}

unsigned char *_s24NearbySharingInteractionV17ConnectionContextV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56BA920);
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

ValueMetadata *_s24NearbySharingInteractionV17ConnectionContextV10CodingKeysOMa()
{
  return &_s24NearbySharingInteractionV17ConnectionContextV10CodingKeysON;
}

ValueMetadata *_s24NearbySharingInteractionV15PresenceContextV10CodingKeysOMa()
{
  return &_s24NearbySharingInteractionV15PresenceContextV10CodingKeysON;
}

unsigned char *_s24NearbySharingInteractionV11FailureTypeO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56BAA34);
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

ValueMetadata *_s29NearbySharingAssertionRequestV10CodingKeysOMa()
{
  return &_s29NearbySharingAssertionRequestV10CodingKeysON;
}

ValueMetadata *_s22NearbySharingDiscoveryO7RequestV10CodingKeysOMa()
{
  return &_s22NearbySharingDiscoveryO7RequestV10CodingKeysON;
}

unsigned char *_s22NearbySharingDiscoveryO11PollingTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56BAB48);
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

ValueMetadata *_s22NearbySharingDiscoveryO11PollingTypeO10CodingKeysOMa()
{
  return &_s22NearbySharingDiscoveryO11PollingTypeO10CodingKeysON;
}

ValueMetadata *_s22NearbySharingDiscoveryO11PollingTypeO19AutomaticCodingKeysOMa()
{
  return &_s22NearbySharingDiscoveryO11PollingTypeO19AutomaticCodingKeysON;
}

ValueMetadata *_s22NearbySharingDiscoveryO11PollingTypeO17PassiveCodingKeysOMa()
{
  return &_s22NearbySharingDiscoveryO11PollingTypeO17PassiveCodingKeysON;
}

ValueMetadata *_s22NearbySharingDiscoveryO11PollingTypeO14FullCodingKeysOMa()
{
  return &_s22NearbySharingDiscoveryO11PollingTypeO14FullCodingKeysON;
}

unint64_t sub_1A56BABB4()
{
  unint64_t result = qword_1E9675D00;
  if (!qword_1E9675D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D00);
  }
  return result;
}

unint64_t sub_1A56BAC0C()
{
  unint64_t result = qword_1E9675D08;
  if (!qword_1E9675D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D08);
  }
  return result;
}

unint64_t sub_1A56BAC64()
{
  unint64_t result = qword_1E9675D10;
  if (!qword_1E9675D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D10);
  }
  return result;
}

unint64_t sub_1A56BACBC()
{
  unint64_t result = qword_1E9675D18;
  if (!qword_1E9675D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D18);
  }
  return result;
}

unint64_t sub_1A56BAD14()
{
  unint64_t result = qword_1E9675D20;
  if (!qword_1E9675D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D20);
  }
  return result;
}

unint64_t sub_1A56BAD6C()
{
  unint64_t result = qword_1E9675D28;
  if (!qword_1E9675D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D28);
  }
  return result;
}

unint64_t sub_1A56BADC4()
{
  unint64_t result = qword_1E9675D30;
  if (!qword_1E9675D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D30);
  }
  return result;
}

unint64_t sub_1A56BAE1C()
{
  unint64_t result = qword_1E9675D38;
  if (!qword_1E9675D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D38);
  }
  return result;
}

unint64_t sub_1A56BAE74()
{
  unint64_t result = qword_1E9675D40;
  if (!qword_1E9675D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D40);
  }
  return result;
}

unint64_t sub_1A56BAECC()
{
  unint64_t result = qword_1E9675D48;
  if (!qword_1E9675D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D48);
  }
  return result;
}

unint64_t sub_1A56BAF24()
{
  unint64_t result = qword_1E9675D50;
  if (!qword_1E9675D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D50);
  }
  return result;
}

unint64_t sub_1A56BAF7C()
{
  unint64_t result = qword_1E9675D58;
  if (!qword_1E9675D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D58);
  }
  return result;
}

unint64_t sub_1A56BAFD4()
{
  unint64_t result = qword_1E9675D60;
  if (!qword_1E9675D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D60);
  }
  return result;
}

unint64_t sub_1A56BB02C()
{
  unint64_t result = qword_1E9675D68;
  if (!qword_1E9675D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D68);
  }
  return result;
}

unint64_t sub_1A56BB084()
{
  unint64_t result = qword_1E9675D70;
  if (!qword_1E9675D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D70);
  }
  return result;
}

unint64_t sub_1A56BB0DC()
{
  unint64_t result = qword_1E9675D78;
  if (!qword_1E9675D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D78);
  }
  return result;
}

unint64_t sub_1A56BB134()
{
  unint64_t result = qword_1E9675D80;
  if (!qword_1E9675D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D80);
  }
  return result;
}

unint64_t sub_1A56BB18C()
{
  unint64_t result = qword_1E9675D88;
  if (!qword_1E9675D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D88);
  }
  return result;
}

unint64_t sub_1A56BB1E4()
{
  unint64_t result = qword_1E9675D90;
  if (!qword_1E9675D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D90);
  }
  return result;
}

unint64_t sub_1A56BB23C()
{
  unint64_t result = qword_1E9675D98;
  if (!qword_1E9675D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675D98);
  }
  return result;
}

unint64_t sub_1A56BB294()
{
  unint64_t result = qword_1E9675DA0;
  if (!qword_1E9675DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DA0);
  }
  return result;
}

unint64_t sub_1A56BB2EC()
{
  unint64_t result = qword_1E9675DA8;
  if (!qword_1E9675DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DA8);
  }
  return result;
}

unint64_t sub_1A56BB344()
{
  unint64_t result = qword_1E9675DB0;
  if (!qword_1E9675DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DB0);
  }
  return result;
}

unint64_t sub_1A56BB39C()
{
  unint64_t result = qword_1E9675DB8;
  if (!qword_1E9675DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DB8);
  }
  return result;
}

unint64_t sub_1A56BB3F4()
{
  unint64_t result = qword_1E9675DC0;
  if (!qword_1E9675DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DC0);
  }
  return result;
}

unint64_t sub_1A56BB44C()
{
  unint64_t result = qword_1E9675DC8;
  if (!qword_1E9675DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DC8);
  }
  return result;
}

unint64_t sub_1A56BB4A4()
{
  unint64_t result = qword_1E9675DD0;
  if (!qword_1E9675DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DD0);
  }
  return result;
}

unint64_t sub_1A56BB4FC()
{
  unint64_t result = qword_1E9675DD8;
  if (!qword_1E9675DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DD8);
  }
  return result;
}

unint64_t sub_1A56BB554()
{
  unint64_t result = qword_1E9675DE0;
  if (!qword_1E9675DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DE0);
  }
  return result;
}

unint64_t sub_1A56BB5AC()
{
  unint64_t result = qword_1E9675DE8;
  if (!qword_1E9675DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DE8);
  }
  return result;
}

unint64_t sub_1A56BB604()
{
  unint64_t result = qword_1E9675DF0;
  if (!qword_1E9675DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DF0);
  }
  return result;
}

unint64_t sub_1A56BB65C()
{
  unint64_t result = qword_1E9675DF8;
  if (!qword_1E9675DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675DF8);
  }
  return result;
}

unint64_t sub_1A56BB6B4()
{
  unint64_t result = qword_1E9675E00;
  if (!qword_1E9675E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675E00);
  }
  return result;
}

unint64_t sub_1A56BB70C()
{
  unint64_t result = qword_1E9675E08;
  if (!qword_1E9675E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675E08);
  }
  return result;
}

unint64_t sub_1A56BB764()
{
  unint64_t result = qword_1E9675E10;
  if (!qword_1E9675E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675E10);
  }
  return result;
}

unint64_t sub_1A56BB7BC()
{
  unint64_t result = qword_1E9675E18;
  if (!qword_1E9675E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675E18);
  }
  return result;
}

unint64_t sub_1A56BB814()
{
  unint64_t result = qword_1E9675E20;
  if (!qword_1E9675E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675E20);
  }
  return result;
}

unint64_t sub_1A56BB86C()
{
  unint64_t result = qword_1E966B998;
  if (!qword_1E966B998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B998);
  }
  return result;
}

unint64_t sub_1A56BB8C4()
{
  unint64_t result = qword_1E966B990;
  if (!qword_1E966B990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B990);
  }
  return result;
}

unint64_t sub_1A56BB91C()
{
  unint64_t result = qword_1E966B970;
  if (!qword_1E966B970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B970);
  }
  return result;
}

unint64_t sub_1A56BB974()
{
  unint64_t result = qword_1E966B968;
  if (!qword_1E966B968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B968);
  }
  return result;
}

unint64_t sub_1A56BB9CC()
{
  unint64_t result = qword_1E966B958;
  if (!qword_1E966B958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B958);
  }
  return result;
}

unint64_t sub_1A56BBA24()
{
  unint64_t result = qword_1E966B950;
  if (!qword_1E966B950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B950);
  }
  return result;
}

unint64_t sub_1A56BBA7C()
{
  unint64_t result = qword_1E966B948;
  if (!qword_1E966B948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B948);
  }
  return result;
}

unint64_t sub_1A56BBAD4()
{
  unint64_t result = qword_1E966B940;
  if (!qword_1E966B940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B940);
  }
  return result;
}

unint64_t sub_1A56BBB2C()
{
  unint64_t result = qword_1E966B938;
  if (!qword_1E966B938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B938);
  }
  return result;
}

unint64_t sub_1A56BBB84()
{
  unint64_t result = qword_1E966B930;
  if (!qword_1E966B930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E966B930);
  }
  return result;
}

uint64_t sub_1A56BBBD8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65766973736170 && a2 == 0xE700000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1819047270 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A56BBD2C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x54676E696C6C6F70 && a2 == 0xEB00000000657079 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001A573B930)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A56BBE80(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001ALL && a2 == 0x80000001A573D0C0 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A56BBF88(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001A573BE00 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001A573A430 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x614E656369766564 && a2 == 0xEA0000000000656DLL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F4D656369766564 && a2 == 0xEB000000006C6564 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x49746E756F636361 && a2 == 0xE900000000000044 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6341656D61537369 && a2 == 0xED0000746E756F63 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001A573D0E0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_1A56BC300(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x796177416C6C7570 && a2 == 0xE800000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F707075736E75 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A56BC40C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000001A573D100 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x697463656E6E6F63 && a2 == 0xEA0000000000676ELL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657463656E6E6F63 && a2 == 0xE900000000000064 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001A573CF30 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6465646E65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1A56BC634(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x697463656E6E6F63 && a2 == 0xEE00656D69546E6FLL || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001A573D120 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x616974696E497369 && a2 == 0xEB00000000726F74)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t sub_1A56BC8E4()
{
  unint64_t result = qword_1E9675E28;
  if (!qword_1E9675E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9675E28);
  }
  return result;
}

uint64_t SFNoThrowAsyncSequence.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v10 = *(void *)(a3 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  *((void *)v12 + 2) = a2;
  *((void *)v12 + 3) = a3;
  *((void *)v12 + 4) = a4;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 32))(&v12[v11], a1, a3);
  *a5 = sub_1A56BD0A8;
  a5[1] = (uint64_t (*)())v12;
  return result;
}

{
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t result;

  uint64_t v10 = *(void *)(a3 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  *((void *)v12 + 2) = a2;
  *((void *)v12 + 3) = a3;
  *((void *)v12 + 4) = a4;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 32))(&v12[v11], a1, a3);
  *a5 = sub_1A56BD14C;
  a5[1] = (uint64_t (*)())v12;
  return result;
}

uint64_t sub_1A56BCA20()
{
  uint64_t v0 = sub_1A56D4D98();
  __swift_allocate_value_buffer(v0, qword_1E9675E40);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9675E40);
  if (qword_1E9670340 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9672AA8);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *sub_1A56BCBD0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = sub_1A56D4DF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v14 - v10;
  sub_1A56D4DE8();
  uint64_t v12 = swift_allocBox();
  MEMORY[0x1A6269130](a2, a3);
  sub_1A56D4DC8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = v12;
  *a4 = &unk_1E9675FB0;
  a4[1] = result;
  return result;
}

uint64_t sub_1A56BCD24(uint64_t a1)
{
  v1[5] = a1;
  v1[6] = sub_1A56D4DE8();
  v1[7] = swift_projectBox();
  return MEMORY[0x1F4188298](sub_1A56BCDAC, 0, 0);
}

uint64_t sub_1A56BCDAC()
{
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A56BCE5C;
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[5];
  return MEMORY[0x1F40D6998](v3, v2);
}

uint64_t sub_1A56BCE5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_1A56BCF5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  uint64_t v13 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a3);
  sub_1A56D55A8();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = v13;
  *a5 = &unk_1E9675FC0;
  a5[1] = result;
  return result;
}

uint64_t sub_1A56BD0A8()
{
  return sub_1A56BD164((uint64_t (*)(unint64_t, void))sub_1A56BCF5C);
}

uint64_t objectdestroyTm_3()
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80)));

  return swift_deallocObject();
}

uint64_t sub_1A56BD14C()
{
  return sub_1A56BD164((uint64_t (*)(unint64_t, void))sub_1A56BCBD0);
}

uint64_t sub_1A56BD164(uint64_t (*a1)(unint64_t, void))
{
  return a1(v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80)), *(void *)(v1 + 16));
}

uint64_t sub_1A56BD1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[15] = a4;
  v5[16] = a5;
  v5[14] = a1;
  v5[17] = swift_getAssociatedTypeWitness();
  v5[18] = swift_projectBox();
  return MEMORY[0x1F4188298](sub_1A56BD250, 0, 0);
}

uint64_t sub_1A56BD250()
{
  swift_beginAccess();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[19] = v2;
  void *v2 = v0;
  v2[1] = sub_1A56BD334;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[14];
  return MEMORY[0x1F4187C78](v4, v3, AssociatedConformanceWitness);
}

uint64_t sub_1A56BD334()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1A56BD470, 0, 0);
  }
  else
  {
    swift_endAccess();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1A56BD470()
{
  uint64_t v15 = v0;
  swift_endAccess();
  if (qword_1E96703B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v2 = sub_1A56D4D98();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9675E40);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1A56D4D78();
  os_log_type_t v6 = sub_1A56D57C8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 160);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v14[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_1A56D6018();
    *(void *)(v0 + 104) = sub_1A54E3290(v11, v12, v14);
    sub_1A56D5928();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A5389000, v5, v6, "Unexpected error by sequence in SFNoThrowAsyncSequence {error: %s}", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A626CE20](v10, -1, -1);
    MEMORY[0x1A626CE20](v9, -1, -1);
  }
  else
  {
  }
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  sub_1A56D5A28();
  sub_1A56D51C8();
  swift_getErrorValue();
  sub_1A56D6018();
  sub_1A56D51C8();
  swift_bridgeObjectRelease();
  sub_1A56D51C8();
  return sub_1A56D5BC8();
}

uint64_t SFNoThrowAsyncSequence.AsyncIterator.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_1A553ABB8, 0, 0);
}

uint64_t sub_1A56BD748(uint64_t a1)
{
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_1A55E45C0;
  return MEMORY[0x1F4188298](sub_1A553ABB8, 0, 0);
}

uint64_t sub_1A56BD7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *unint64_t v12 = v6;
  v12[1] = sub_1A56BD8C0;
  return MEMORY[0x1F4187C88](a1, a2, a3, a5, a6);
}

uint64_t sub_1A56BD8C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t SFNoThrowAsyncSequence.makeAsyncIterator()()
{
  return (*v0)();
}

uint64_t sub_1A56BD9E4()
{
  SFNoThrowAsyncSequence.makeAsyncIterator()();

  return swift_release();
}

uint64_t SFThrowingAsyncSequence.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t (**a6)()@<X8>)
{
  uint64_t v12 = *(void *)(a4 - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a2;
  *((void *)v14 + 3) = a3;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = a5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v14[v13], a1, a4);
  *a6 = sub_1A56BDC6C;
  a6[1] = (uint64_t (*)())v14;
  return result;
}

{
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t result;

  uint64_t v12 = *(void *)(a4 - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a2;
  *((void *)v14 + 3) = a3;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = a5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v14[v13], a1, a4);
  *a6 = sub_1A56BE230;
  a6[1] = (uint64_t (*)())v14;
  return result;
}

void *sub_1A56BDB04@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v9 = sub_1A56D4EA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v16 - v11;
  sub_1A56D4E98();
  uint64_t v13 = swift_allocBox();
  MEMORY[0x1A6269120](a3, a4);
  sub_1A56D4E78();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t result = (void *)swift_allocObject();
  uint64_t v15 = v17;
  result[2] = a1;
  result[3] = v15;
  result[4] = a3;
  result[5] = a4;
  result[6] = v13;
  *a5 = &unk_1E9675FA0;
  a5[1] = result;
  return result;
}

uint64_t sub_1A56BDC6C()
{
  return sub_1A56BE248((uint64_t (*)(char *, void, void))sub_1A56BDB04);
}

uint64_t sub_1A56BDC84(uint64_t a1)
{
  v1[5] = a1;
  v1[6] = sub_1A56D4E98();
  v1[7] = swift_projectBox();
  return MEMORY[0x1F4188298](sub_1A56BDD0C, 0, 0);
}

uint64_t sub_1A56BDD0C()
{
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A56BDDBC;
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[5];
  return MEMORY[0x1F40D6A90](v3, v2);
}

uint64_t sub_1A56BDDBC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1A56BDEF8, 0, 0);
  }
  else
  {
    swift_endAccess();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1A56BDEF8()
{
  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_1A56BE050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  uint64_t v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a4);
  sub_1A56D55A8();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  result[6] = v15;
  *a6 = &unk_1E9675F90;
  a6[1] = result;
  return result;
}

uint64_t objectdestroy_6Tm()
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(v0 + 32) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80)));

  return swift_deallocObject();
}

uint64_t sub_1A56BE230()
{
  return sub_1A56BE248((uint64_t (*)(char *, void, void))sub_1A56BE050);
}

uint64_t sub_1A56BE248(uint64_t (*a1)(char *, void, void))
{
  return a1(&v1[(*(unsigned __int8 *)(*(void *)(*((void *)v1 + 4) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*((void *)v1 + 4) - 8) + 80)], *((void *)v1 + 2), *((void *)v1 + 3));
}

uint64_t sub_1A56BE294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a1;
  v6[8] = swift_getAssociatedTypeWitness();
  v6[9] = swift_projectBox();
  return MEMORY[0x1F4188298](sub_1A5537F74, 0, 0);
}

uint64_t SFThrowingAsyncSequence.AsyncIterator.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_1A553ABB8, 0, 0);
}

uint64_t sub_1A56BE350(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_1A54E83BC;
  return MEMORY[0x1F4188298](sub_1A553ABB8, 0, 0);
}

uint64_t sub_1A56BE3FC()
{
  return MEMORY[0x1E4FBC278];
}

uint64_t sub_1A56BE408()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A56BE424()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for SFNoThrowAsyncSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SFNoThrowAsyncSequence.AsyncIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SFThrowingAsyncSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SFThrowingAsyncSequence.AsyncIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A56BE4A0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A56BE4D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1A54E8628;
  return sub_1A56BE294(a1, v8, v4, v5, v6, v7);
}

uint64_t sub_1A56BE5A0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1A54E83BC;
  return sub_1A56BDC84(a1);
}

uint64_t sub_1A56BE668()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A56BE6A0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1A54E83BC;
  return sub_1A56BCD24(a1);
}

uint64_t sub_1A56BE760(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1A54E8628;
  return sub_1A56BD1B0(a1, v6, v4, v5, v7);
}

void SFAirDrop.TXTRecord.deviceRelationship.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *SFAirDrop.TXTRecord.init(deviceRelationship:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t SFAirDrop.TXTRecord.init(txtRecord:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t result = sub_1A56D4EF8();
  if (!v5) {
    goto LABEL_56;
  }
  uint64_t v6 = v5;
  uint64_t v7 = HIBYTE(v5) & 0xF;
  uint64_t v8 = result & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_56;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (uint64_t)sub_1A56BED90(result, v6, 10);
    char v13 = v29;
    goto LABEL_45;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      uint64_t v10 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v10 = (unsigned __int8 *)sub_1A56D5AB8();
    }
    uint64_t v11 = (uint64_t)sub_1A56BF064(v10, v8, 10);
    char v13 = v12 & 1;
LABEL_45:
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      uint64_t v23 = sub_1A56D4EE8();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(a1, v23);
      if ((unint64_t)v11 >= 4) {
        char v24 = 2;
      }
      else {
        char v24 = v11;
      }
      goto LABEL_57;
    }
LABEL_56:
    uint64_t v28 = sub_1A56D4EE8();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(a1, v28);
    char v24 = 2;
LABEL_57:
    *a2 = v24;
    return result;
  }
  v30[0] = result;
  v30[1] = v6 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v7) {
      goto LABEL_61;
    }
    if (v7 == 1 || (BYTE1(result) - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v11 = (BYTE1(result) - 48);
    if (v7 != 2)
    {
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v11 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      uint64_t v14 = v7 - 3;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v30 + 3;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_32;
          }
          uint64_t v17 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            goto LABEL_32;
          }
          uint64_t v11 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_32;
          }
          char v13 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_45;
          }
        }
      }
    }
LABEL_44:
    char v13 = 0;
    goto LABEL_45;
  }
  if (result != 45)
  {
    if (!v7 || (result - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v11 = (result - 48);
    if (v7 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v11 = 10 * (result - 48) + (BYTE1(result) - 48);
      uint64_t v18 = v7 - 2;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v30 + 2;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_32;
          }
          uint64_t v21 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            goto LABEL_32;
          }
          uint64_t v11 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_32;
          }
          char v13 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_45;
          }
        }
      }
    }
    goto LABEL_44;
  }
  if (v7)
  {
    if (v7 != 1 && (BYTE1(result) - 48) <= 9u)
    {
      if (v7 == 2)
      {
        char v13 = 0;
        uint64_t v11 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_45;
      }
      if ((BYTE2(result) - 48) <= 9u)
      {
        uint64_t v11 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
        uint64_t v22 = v7 - 3;
        if (!v22) {
          goto LABEL_44;
        }
        uint64_t v25 = (unsigned __int8 *)v30 + 3;
        while (1)
        {
          unsigned int v26 = *v25 - 48;
          if (v26 > 9) {
            break;
          }
          uint64_t v27 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            break;
          }
          uint64_t v11 = v27 - v26;
          if (__OFSUB__(v27, v26)) {
            break;
          }
          char v13 = 0;
          ++v25;
          if (!--v22) {
            goto LABEL_45;
          }
        }
      }
    }
LABEL_32:
    uint64_t v11 = 0;
    char v13 = 1;
    goto LABEL_45;
  }
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

uint64_t SFAirDrop.TXTRecord.addToEndpoint(_:)()
{
  dictionary_with_initial_length = nw_txt_record_create_dictionary_with_initial_length();
  sub_1A56D5E78();
  size_t v1 = sub_1A56D5198();
  uint64_t v2 = sub_1A56D5148();
  swift_bridgeObjectRelease();
  nw_txt_record_set_key(dictionary_with_initial_length, "deviceRelationship", (const uint8_t *)(v2 + 32), v1);
  swift_release();
  nw_endpoint_set_txt_record();
  return swift_unknownObjectRelease();
}

void *sub_1A56BEC7C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E966C848);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A56BECE4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1A56D5228();
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
    uint64_t v5 = MEMORY[0x1A6269460](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_1A56BED60(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A56BF064(a1, a2, a3);
}

unsigned __int8 *sub_1A56BED78(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A56BF2E0(a1, a2, a3);
}

unsigned __int8 *sub_1A56BED90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1A56D5268();
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
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1A56BF560();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_1A56D5AB8();
  }
LABEL_7:
  uint64_t v11 = sub_1A56BF064(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned char *_s9TXTRecordVwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56BEF44);
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

ValueMetadata *type metadata accessor for SFAirDrop.TXTRecord()
{
  return &type metadata for SFAirDrop.TXTRecord;
}

uint64_t sub_1A56BEF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1A56D5268();
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
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1A56BF560();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_1A56D5AB8();
  }
LABEL_7:
  uint64_t v11 = sub_1A56BF2E0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_1A56BF064(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
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
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_1A56BF2E0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          char v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A56BF560()
{
  unint64_t v0 = sub_1A56D5278();
  uint64_t v4 = sub_1A56BF5E0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1A56BF5E0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1A56BF738(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_1A56BEC7C(v9, 0);
      unint64_t v12 = sub_1A56BF838((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1A56D5AB8();
LABEL_4:
        JUMPOUT(0x1A62693E0);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1A62693E0](v11 + 4, v11[2]);
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
    return MEMORY[0x1A62693E0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1A56BF738(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_1A56BECE4(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1A56BECE4(v6, v5, v4);
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
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_1A56BF838(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
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
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1A56BECE4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1A56D5218();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1A56D5AB8();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_1A56BECE4(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_1A56D51E8();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t combineLatest<A, B, C, D, E>(_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, long long a11, long long a12, uint64_t a13)
{
  uint64_t v50 = a5;
  uint64_t v44 = a2;
  uint64_t v45 = a3;
  uint64_t v52 = a8;
  long long v51 = a11;
  long long v49 = a12;
  uint64_t v42 = a7;
  uint64_t v43 = a9;
  uint64_t v47 = a10;
  uint64_t v48 = a4;
  uint64_t v14 = *(void *)(a10 - 8);
  uint64_t v46 = a13;
  uint64_t v15 = MEMORY[0x1F4188790](a1);
  unint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v15);
  uint64_t v22 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x1F4188790](v20);
  unint64_t v27 = (char *)&v41 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x1F4188790](v25);
  unsigned __int8 v32 = (char *)&v41 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v33;
  MEMORY[0x1F4188790](v30);
  uint64_t v35 = (char *)&v41 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v36 + 16))(v35);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, v44, a6);
  uint64_t v37 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v27, v45, v42);
  uint64_t v38 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v48, v43);
  uint64_t v39 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v50, v47);
  return sub_1A56BFDC4((uint64_t)v35, (uint64_t)v32, (uint64_t)v27, (uint64_t)v22, (uint64_t)v17, v41, a6, v37, v52, v38, v39);
}

uint64_t sub_1A56BFDC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(a9, a1, a6);
  unint64_t v17 = (int *)type metadata accessor for AsyncCombineLatest5Sequence();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(a9 + v17[25], a2, a7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(a9 + v17[26], a3, a8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a10 - 8) + 32))(a9 + v17[27], a4, a10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32))(a9 + v17[28], a5, a11);
}

uint64_t AsyncCombineLatest5Sequence.Iterator.next()(uint64_t a1, void *a2)
{
  v2[26] = a1;
  uint64_t v21 = a2[2];
  uint64_t v22 = a2[7];
  v2[27] = swift_getAssociatedTypeWitness();
  uint64_t v19 = a2[3];
  uint64_t v20 = a2[8];
  v2[28] = swift_getAssociatedTypeWitness();
  uint64_t v18 = a2[9];
  uint64_t v4 = a2[4];
  v2[29] = swift_getAssociatedTypeWitness();
  v2[30] = swift_getTupleTypeMetadata3();
  uint64_t v5 = a2[10];
  uint64_t v6 = a2[5];
  v2[31] = swift_getAssociatedTypeWitness();
  uint64_t v7 = a2[11];
  uint64_t v8 = a2[6];
  v2[32] = swift_getAssociatedTypeWitness();
  v2[33] = swift_getTupleTypeMetadata2();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v2[34] = TupleTypeMetadata2;
  uint64_t v10 = sub_1A56D5898();
  v2[35] = v10;
  v2[36] = *(void *)(v10 - 8);
  uint64_t v11 = swift_task_alloc();
  v2[37] = v11;
  v2[38] = *(void *)(TupleTypeMetadata2 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  unint64_t v12 = (void *)swift_task_alloc();
  v2[2] = v21;
  v2[45] = v12;
  v2[3] = v19;
  v2[4] = v4;
  v2[5] = v22;
  void v2[6] = v20;
  v2[7] = v18;
  uint64_t v13 = type metadata accessor for AsyncCombineLatest3Sequence();
  v2[18] = v6;
  v2[19] = v8;
  v2[20] = v5;
  v2[21] = v7;
  uint64_t v14 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v16 = swift_getWitnessTable();
  v2[22] = v13;
  v2[23] = v14;
  v2[24] = WitnessTable;
  v2[25] = v16;
  type metadata accessor for AsyncCombineLatest2Sequence.Iterator();
  *unint64_t v12 = v2;
  v12[1] = sub_1A56C030C;
  return AsyncCombineLatest2Sequence.Iterator.next()(v11);
}

uint64_t sub_1A56C030C()
{
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1A56C0FD4;
  }
  else {
    unint64_t v2 = sub_1A56C0420;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A56C0420()
{
  uint64_t v1 = *(void *)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 272);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 304) + 48))(v1, 1, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 232);
    uint64_t v4 = *(void *)(v0 + 208);
    long long v92 = *(_OWORD *)(v0 + 216);
    long long v94 = *(_OWORD *)(v0 + 248);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 288) + 8))(v1, *(void *)(v0 + 280));
    *(_OWORD *)(v0 + 64) = v92;
    *(void *)(v0 + 80) = v3;
    *(_OWORD *)(v0 + 88) = v94;
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 56))(v4, 1, 1, TupleTypeMetadata);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 352);
    uint64_t v62 = *(void *)(v0 + 336);
    uint64_t v57 = *(void *)(v0 + 328);
    uint64_t v58 = *(void *)(v0 + 344);
    uint64_t v60 = *(void *)(v0 + 320);
    uint64_t v65 = *(void *)(v0 + 312);
    uint64_t v95 = *(void *)(v0 + 256);
    uint64_t v73 = *(void *)(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 224);
    uint64_t v86 = *(void *)(v0 + 248);
    uint64_t v87 = *(void *)(v0 + 232);
    uint64_t v56 = *(void *)(v0 + 208);
    uint64_t v8 = *(int *)(v73 + 48);
    uint64_t v9 = v6 + v8;
    uint64_t v79 = v6 + v8;
    uint64_t v10 = *(int *)(v73 + 64);
    uint64_t v11 = v6 + v10;
    uint64_t v53 = v6 + v10;
    uint64_t v12 = *(int *)(v2 + 48);
    uint64_t v13 = v6 + v12;
    uint64_t v81 = v6;
    uint64_t v14 = *(void *)(v0 + 264);
    uint64_t v75 = v14;
    uint64_t v88 = v6 + v12 + *(int *)(v14 + 48);
    uint64_t v67 = v6 + v12;
    uint64_t v15 = v1 + v12;
    uint64_t v76 = v2;
    uint64_t v16 = v1 + v8;
    uint64_t v84 = v1 + v10;
    uint64_t v93 = *(void **)(*(void *)(v0 + 216) - 8);
    uint64_t v64 = (void (*)(uint64_t, uint64_t))v93[4];
    uint64_t v17 = v1;
    uint64_t v18 = *(void *)(v0 + 216);
    v64(v6, v17);
    uint64_t v91 = *(void **)(v7 - 8);
    uint64_t v63 = (void (*)(uint64_t, uint64_t, uint64_t))v91[4];
    v63(v9, v16, v7);
    uint64_t v90 = *(void **)(v87 - 8);
    BOOL v61 = (void (*)(uint64_t, uint64_t))v90[4];
    v61(v11, v84);
    uint64_t v19 = v15 + *(int *)(v14 + 48);
    uint64_t v83 = *(void **)(v86 - 8);
    uint64_t v42 = (void (*)(uint64_t, uint64_t))v83[4];
    v42(v13, v15);
    uint64_t v85 = *(void **)(v95 - 8);
    uint64_t v46 = (void (*)(uint64_t, uint64_t, uint64_t))v85[4];
    v46(v88, v19, v95);
    *(void *)(v0 + 104) = v18;
    *(void *)(v0 + 112) = v7;
    uint64_t v71 = v7;
    *(void *)(v0 + 120) = v87;
    *(void *)(v0 + 128) = v86;
    *(void *)(v0 + 136) = v95;
    uint64_t v45 = (int *)swift_getTupleTypeMetadata();
    uint64_t v54 = v56 + v45[12];
    uint64_t v37 = v56 + v45[16];
    uint64_t v40 = v56 + v45[20];
    uint64_t v43 = v56 + v45[24];
    uint64_t v66 = v58 + *(int *)(v76 + 48);
    uint64_t v20 = v58 + *(int *)(v73 + 48);
    uint64_t v21 = v58 + *(int *)(v73 + 64);
    uint64_t v49 = v21;
    uint64_t v50 = v20;
    uint64_t v52 = (void (*)(void))v93[2];
    ((void (*)(uint64_t, uint64_t, uint64_t))v52)(v58, v81, v18);
    uint64_t v70 = (void (*)(uint64_t, uint64_t, uint64_t))v91[2];
    v70(v20, v79, v7);
    char v69 = (void (*)(uint64_t, uint64_t, uint64_t))v90[2];
    v69(v21, v53, v87);
    uint64_t v22 = v66 + *(int *)(v14 + 48);
    uint64_t v48 = v22;
    long long v51 = (void (*)(void))v83[2];
    v51();
    unint64_t v68 = (void (*)(uint64_t, uint64_t, uint64_t))v85[2];
    v68(v22, v88, v95);
    uint64_t v72 = v18;
    ((void (*)(uint64_t, uint64_t, uint64_t))v64)(v56, v58, v18);
    uint64_t v59 = v62 + *(int *)(v76 + 48);
    uint64_t v23 = v62 + *(int *)(v73 + 48);
    uint64_t v41 = v23;
    uint64_t v24 = v62 + *(int *)(v73 + 64);
    uint64_t v47 = v24;
    v52();
    v70(v23, v79, v7);
    v69(v24, v53, v87);
    uint64_t v25 = v59 + *(int *)(v75 + 48);
    uint64_t v44 = v25;
    v51();
    v68(v25, v88, v95);
    v63(v54, v41, v7);
    uint64_t v55 = v57 + *(int *)(v76 + 48);
    uint64_t v26 = v57 + *(int *)(v73 + 48);
    uint64_t v36 = v57 + *(int *)(v73 + 64);
    v52();
    v70(v26, v79, v7);
    v69(v36, v53, v87);
    uint64_t v39 = v55 + *(int *)(v75 + 48);
    v51();
    v68(v39, v88, v95);
    ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v37, v36, v87);
    uint64_t v27 = v60 + *(int *)(v76 + 48);
    uint64_t v28 = v60 + *(int *)(v73 + 48);
    uint64_t v29 = v60 + *(int *)(v73 + 64);
    uint64_t v38 = v28;
    v52();
    v70(v28, v79, v7);
    v69(v29, v53, v87);
    uint64_t v30 = v27 + *(int *)(v75 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v51)(v27, v67, v86);
    v68(v30, v88, v95);
    ((void (*)(uint64_t, uint64_t, uint64_t))v42)(v40, v27, v86);
    uint64_t v31 = v65 + *(int *)(v76 + 48);
    uint64_t v77 = v65 + *(int *)(v73 + 48);
    uint64_t v74 = v65 + *(int *)(v73 + 64);
    ((void (*)(void))v64)();
    v63(v77, v79, v71);
    ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v74, v53, v87);
    uint64_t v32 = v31 + *(int *)(v75 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v42)(v31, v67, v86);
    v46(v32, v88, v95);
    v46(v43, v32, v95);
    (*(void (**)(uint64_t, void, uint64_t))(*((void *)v45 - 1) + 56))(v56, 0, 1);
    char v80 = (void (*)(uint64_t, uint64_t))v83[1];
    v80(v31, v86);
    uint64_t v33 = (void (*)(uint64_t, uint64_t))v90[1];
    v33(v74, v87);
    uint64_t v89 = (void (*)(uint64_t, uint64_t))v91[1];
    v89(v77, v71);
    uint64_t v82 = (void (*)(uint64_t, uint64_t))v93[1];
    v82(v65, v72);
    char v78 = (void (*)(uint64_t, uint64_t))v85[1];
    v78(v30, v95);
    v33(v29, v87);
    v89(v38, v71);
    v82(v60, v72);
    v78(v39, v95);
    v80(v55, v86);
    v89(v26, v71);
    v82(v57, v72);
    v78(v44, v95);
    v80(v59, v86);
    v33(v47, v87);
    v82(v62, v72);
    v78(v48, v95);
    v80(v66, v86);
    v33(v49, v87);
    v89(v50, v71);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_1A56C0FD4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A56C1084(uint64_t a1, void *a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1A54E83BC;
  return AsyncCombineLatest5Sequence.Iterator.next()(a1, a2);
}

uint64_t sub_1A56C112C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[3] = AssociatedTypeWitness;
  v6[4] = *(void *)(AssociatedTypeWitness - 8);
  v6[5] = swift_task_alloc();
  uint64_t v13 = (void *)swift_task_alloc();
  v6[6] = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_1A556B718;
  return MEMORY[0x1F4187C88](a1, a2, a3, a5, a6);
}

uint64_t AsyncCombineLatest5Sequence.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v39 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v37 = *(void *)(a1 + 24);
  uint64_t v38 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v35 = *(void *)(a1 + 56);
  uint64_t v36 = v6;
  uint64_t v34 = v7;
  uint64_t v29 = *(void *)(a1 + 72);
  uint64_t v40 = v5;
  uint64_t v41 = v37;
  uint64_t v42 = v6;
  uint64_t v43 = v35;
  uint64_t v44 = v7;
  uint64_t v45 = v29;
  uint64_t v8 = type metadata accessor for AsyncCombineLatest3Sequence();
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 48);
  uint64_t v33 = v9;
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v30 = *(void *)(a1 + 88);
  uint64_t v31 = v10;
  uint64_t v11 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v40 = v8;
  uint64_t v41 = v11;
  uint64_t v42 = WitnessTable;
  uint64_t v43 = v27;
  uint64_t v26 = type metadata accessor for AsyncCombineLatest2Sequence();
  uint64_t v12 = *(void *)(v26 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v26);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v16 = *(void *)(v11 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v13);
  uint64_t v19 = (char *)&v25 - v18;
  uint64_t v20 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v22 = (char *)&v25 - v21;
  combineLatest<A, B, C>(_:_:_:)(v3, v3 + *(int *)(a1 + 100), v3 + *(int *)(a1 + 104), v38, v37, v36, v35, v34, (uint64_t)&v25 - v21);
  combineLatest<A, B>(_:_:)(v3 + *(int *)(a1 + 108), v3 + *(int *)(a1 + 112), v33, v32, (uint64_t)v19);
  combineLatest<A, B>(_:_:)((uint64_t)v22, (uint64_t)v19, v8, v11, (uint64_t)v15);
  uint64_t v23 = v26;
  AsyncCombineLatest2Sequence.makeAsyncIterator()(v26, &v40);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v23);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, v8);
  *uint64_t v39 = v40;
  return result;
}

uint64_t sub_1A56C1590()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();

  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1A56C1634()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A56C1650@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  AsyncCombineLatest5Sequence.makeAsyncIterator()(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);

  return v4(v2, a1);
}

uint64_t sub_1A56C16B0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          uint64_t result = swift_checkMetadataState();
          if (v5 <= 0x3F)
          {
            swift_initStructMetadata();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t *sub_1A56C1840(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = (v5 + v7) & ~v7;
  uint64_t v10 = *(void *)(a3[4] - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v46 = *(void *)(v6 + 64) + v11;
  uint64_t v12 = v46 + v9;
  uint64_t v13 = *(void *)(v10 + 64);
  uint64_t v14 = a3[6];
  uint64_t v15 = v12 & ~v11;
  uint64_t v16 = *(void *)(a3[5] - 8);
  uint64_t v17 = *(_DWORD *)(v16 + 80);
  uint64_t v18 = v13 + v17;
  uint64_t v19 = *(void *)(v16 + 64);
  uint64_t v20 = *(void *)(v14 - 8);
  uint64_t v21 = *(_DWORD *)(v20 + 80);
  uint64_t v22 = v19 + v21;
  unint64_t v23 = ((v19 + v21 + ((v13 + v17 + v15) & ~v17)) & ~v21) + *(void *)(v20 + 64);
  uint64_t v24 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v10 + 80) | *(unsigned char *)(v16 + 80) | *(unsigned char *)(v20 + 80));
  if (v24 <= 7
    && v23 <= 0x18
    && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v10 + 80) | *(_DWORD *)(v16 + 80) | *(_DWORD *)(v20 + 80)) & 0x100000) == 0)
  {
    uint64_t v44 = a3[5];
    uint64_t v29 = ~v7;
    uint64_t v40 = a3[4];
    uint64_t v41 = ~v11;
    uint64_t v42 = ~v17;
    uint64_t v43 = ~v21;
    uint64_t v39 = a3[3];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    uint64_t v45 = a1;
    unint64_t v31 = ((unint64_t)a1 + v8) & v29;
    unint64_t v32 = ((unint64_t)a2 + v8) & v29;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v31, v32, v39);
    uint64_t v33 = v31 + v46;
    uint64_t v28 = v45;
    uint64_t v34 = v33 & v41;
    unint64_t v35 = (v32 + v46) & v41;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v10 + 16))(v33 & v41, v35, v40);
    uint64_t v36 = (v34 + v18) & v42;
    unint64_t v37 = (v35 + v18) & v42;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v36, v37, v44);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16))((v36 + v22) & v43, (v37 + v22) & v43, v14);
  }
  else
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    uint64_t v28 = (uint64_t *)(v27 + ((v24 + 16) & ~v24));
    swift_retain();
  }
  return v28;
}

uint64_t sub_1A56C1B84(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v14 = *(void *)(a2[5] - 8);
  uint64_t v15 = v14 + 8;
  unint64_t v16 = (v12 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t))(v14 + 8))(v16);
  uint64_t v17 = *(void *)(a2[6] - 8);
  uint64_t v18 = *(uint64_t (**)(unint64_t))(v17 + 8);
  unint64_t v19 = (v16 + *(void *)(v15 + 56) + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);

  return v18(v19);
}

uint64_t sub_1A56C1CF4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 16;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 16))((*(void *)(v22 + 48) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 48) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_1A56C1E94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 24;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 24))((*(void *)(v22 + 40) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 40) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_1A56C2034(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 32;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 32))((*(void *)(v22 + 32) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 32) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_1A56C21D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 24);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 40;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 40))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 40))((*(void *)(v22 + 24) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 24) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_1A56C2374(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v44 = *(void *)(a3[2] - 8);
  unsigned int v5 = *(_DWORD *)(v44 + 84);
  uint64_t v6 = *(void *)(a3[3] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v44 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = *(void *)(a3[4] - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(v9 - 8);
  unsigned int v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v12) {
    unsigned int v15 = v12;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v16 = *(void *)(a3[6] - 8);
  uint64_t v17 = *(unsigned int *)(v16 + 84);
  uint64_t v18 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v21 = *(void *)(*(void *)(a3[4] - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v23 = *(unsigned __int8 *)(v16 + 80);
  if (v17 <= v15) {
    unsigned int v24 = v15;
  }
  else {
    unsigned int v24 = *(_DWORD *)(v16 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v25 = *(void *)(*(void *)(a3[2] - 8) + 64) + v18;
  uint64_t v26 = *(void *)(*(void *)(v9 - 8) + 64) + v23;
  int v27 = a2 - v24;
  if (a2 <= v24) {
    goto LABEL_33;
  }
  uint64_t v28 = ((v26 + ((v21 + v22 + ((v19 + v20 + (v25 & ~v18)) & ~v20)) & ~v22)) & ~v23)
      + *(void *)(*(void *)(a3[6] - 8) + 64);
  char v29 = 8 * v28;
  if (v28 > 3) {
    goto LABEL_16;
  }
  unsigned int v31 = ((v27 + ~(-1 << v29)) >> v29) + 1;
  if (HIWORD(v31))
  {
    int v30 = *(_DWORD *)((char *)a1 + v28);
    if (!v30) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }
  if (v31 > 0xFF)
  {
    int v30 = *(unsigned __int16 *)((char *)a1 + v28);
    if (!*(unsigned __int16 *)((char *)a1 + v28)) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }
  if (v31 >= 2)
  {
LABEL_16:
    int v30 = *((unsigned __int8 *)a1 + v28);
    if (!*((unsigned char *)a1 + v28)) {
      goto LABEL_33;
    }
LABEL_23:
    int v32 = (v30 - 1) << v29;
    if (v28 > 3) {
      int v32 = 0;
    }
    if (v28)
    {
      if (v28 <= 3) {
        int v33 = ((v26 + ((v21 + v22 + ((v19 + v20 + (v25 & ~v18)) & ~v20)) & ~v22)) & ~v23)
      }
            + *(_DWORD *)(*(void *)(a3[6] - 8) + 64);
      else {
        int v33 = 4;
      }
      switch(v33)
      {
        case 2:
          int v34 = *a1;
          break;
        case 3:
          int v34 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v34 = *(_DWORD *)a1;
          break;
        default:
          int v34 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v34 = 0;
    }
    return v24 + (v34 | v32) + 1;
  }
LABEL_33:
  if (!v24) {
    return 0;
  }
  if (v5 == v24)
  {
    unint64_t v35 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v44 + 48);
    uint64_t v36 = a1;
    uint64_t v37 = *(unsigned int *)(v44 + 84);
    uint64_t v38 = a3[2];
    return v35(v36, v37, v38);
  }
  unint64_t v40 = ((unint64_t)a1 + v25) & ~v18;
  if (v7 == v24)
  {
    uint64_t v41 = *(uint64_t (**)(unint64_t))(v6 + 48);
    return v41(((unint64_t)a1 + v25) & ~v18);
  }
  else
  {
    if (v11 == v24)
    {
      unint64_t v35 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v10 + 48);
      uint64_t v36 = (unsigned __int16 *)((v40 + v19 + v20) & ~v20);
      uint64_t v37 = *(unsigned int *)(v10 + 84);
      uint64_t v38 = a3[4];
      return v35(v36, v37, v38);
    }
    uint64_t v36 = (unsigned __int16 *)((((v40 + v19 + v20) & ~v20) + v21 + v22) & ~v22);
    if (v14 == v24)
    {
      unint64_t v35 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v13 + 48);
      uint64_t v37 = *(unsigned int *)(v13 + 84);
      uint64_t v38 = a3[5];
      return v35(v36, v37, v38);
    }
    unint64_t v42 = ((unint64_t)v36 + v26) & ~v23;
    uint64_t v43 = *(uint64_t (**)(unint64_t, uint64_t))(v16 + 48);
    return v43(v42, v17);
  }
}

void sub_1A56C2848(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v39 = *(void *)(a4[2] - 8);
  unsigned int v6 = *(_DWORD *)(v39 + 84);
  uint64_t v7 = *(void *)(a4[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(a4[4] - 8);
  if (v8 <= v6) {
    unsigned int v10 = *(_DWORD *)(v39 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v11 = *(void *)(a4[4] - 8);
  unsigned int v12 = *(_DWORD *)(v9 + 84);
  if (v12 <= v10) {
    unsigned int v13 = v10;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v14 = a4[6];
  uint64_t v38 = a4[5];
  uint64_t v15 = *(void *)(v38 - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  if (v16 <= v13) {
    unsigned int v17 = v13;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v15 + 84);
  }
  uint64_t v18 = *(void *)(v14 - 8);
  uint64_t v19 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = *(void *)(*(void *)(a4[3] - 8) + 64);
  uint64_t v21 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v22 = *(void *)(v9 + 64);
  uint64_t v23 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v24 = *(unsigned __int8 *)(v18 + 80);
  if (*(_DWORD *)(v18 + 84) <= v17) {
    unsigned int v25 = v17;
  }
  else {
    unsigned int v25 = *(_DWORD *)(v18 + 84);
  }
  uint64_t v26 = *(void *)(*(void *)(a4[2] - 8) + 64) + v19;
  uint64_t v27 = *(void *)(*(void *)(v38 - 8) + 64) + v24;
  size_t v28 = ((v27 + ((v22 + v23 + ((v20 + v21 + (v26 & ~v19)) & ~v21)) & ~v23)) & ~v24)
      + *(void *)(*(void *)(v14 - 8) + 64);
  if (a3 <= v25)
  {
    int v29 = 0;
  }
  else if (v28 <= 3)
  {
    unsigned int v34 = ((a3 - v25 + ~(-1 << (8 * v28))) >> (8 * v28)) + 1;
    if (HIWORD(v34))
    {
      int v29 = 4;
    }
    else if (v34 >= 0x100)
    {
      int v29 = 2;
    }
    else
    {
      int v29 = v34 > 1;
    }
  }
  else
  {
    int v29 = 1;
  }
  if (v25 < a2)
  {
    unsigned int v30 = ~v25 + a2;
    if (v28 < 4)
    {
      int v31 = (v30 >> (8 * v28)) + 1;
      if (v28)
      {
        int v35 = v30 & ~(-1 << (8 * v28));
        bzero(a1, v28);
        if (v28 == 3)
        {
          *(_WORD *)a1 = v35;
          a1[2] = BYTE2(v35);
        }
        else if (v28 == 2)
        {
          *(_WORD *)a1 = v35;
        }
        else
        {
          *a1 = v35;
        }
      }
    }
    else
    {
      bzero(a1, v28);
      *(_DWORD *)a1 = v30;
      int v31 = 1;
    }
    switch(v29)
    {
      case 1:
        a1[v28] = v31;
        return;
      case 2:
        *(_WORD *)&a1[v28] = v31;
        return;
      case 3:
        goto LABEL_62;
      case 4:
        *(_DWORD *)&a1[v28] = v31;
        return;
      default:
        return;
    }
  }
  uint64_t v32 = ~v19;
  uint64_t v33 = ~v24;
  switch(v29)
  {
    case 1:
      a1[v28] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v28] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_62:
      __break(1u);
      JUMPOUT(0x1A56C2D80);
    case 4:
      *(_DWORD *)&a1[v28] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v6 == v25)
        {
          uint64_t v36 = *(void (**)(char *))(v39 + 56);
          uint64_t v37 = a1;
        }
        else
        {
          uint64_t v37 = (char *)((unint64_t)&a1[v26] & v32);
          if (v8 == v25)
          {
            uint64_t v36 = *(void (**)(char *))(v7 + 56);
          }
          else
          {
            uint64_t v37 = (char *)((unint64_t)&v37[v20 + v21] & ~v21);
            if (v12 == v25)
            {
              uint64_t v36 = *(void (**)(char *))(v11 + 56);
            }
            else
            {
              uint64_t v37 = (char *)((unint64_t)&v37[v22 + v23] & ~v23);
              if (v16 == v25)
              {
                uint64_t v36 = *(void (**)(char *))(v15 + 56);
              }
              else
              {
                uint64_t v37 = (char *)((unint64_t)&v37[v27] & v33);
                uint64_t v36 = *(void (**)(char *))(v18 + 56);
              }
            }
          }
        }
        v36(v37);
      }
      return;
  }
}

uint64_t type metadata accessor for AsyncCombineLatest5Sequence()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A56C2DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 88);
}

uint64_t type metadata accessor for AsyncCombineLatest5Sequence.Iterator()
{
  return swift_getGenericMetadata();
}

uint64_t SFProgressTask.initialValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = v4 + *(int *)(type metadata accessor for SFProgressContinuation() + 44);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a2, v6, v5);
}

uint64_t type metadata accessor for SFProgressContinuation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SFProgressTask.finalValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v5 = sub_1A56D49A8();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96714D8);
  v3[14] = swift_task_alloc();
  uint64_t v6 = sub_1A56D4A28();
  v3[15] = v6;
  v3[16] = *(void *)(v6 - 8);
  v3[17] = swift_task_alloc();
  uint64_t v7 = *(void *)(v4 - 8);
  v4 -= 8;
  v3[18] = v7;
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  uint64_t v8 = *(void *)(v4 + 24);
  v3[22] = v8;
  v3[23] = *(void *)(v8 - 8);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = *(void *)(v4 + 32);
  uint64_t v9 = type metadata accessor for SFProgressContinuation.Value();
  v3[28] = v9;
  v3[29] = *(void *)(v9 - 8);
  v3[30] = swift_task_alloc();
  uint64_t v10 = sub_1A56D5898();
  v3[31] = v10;
  v3[32] = *(void *)(v10 - 8);
  v3[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  v3[34] = sub_1A56D4E48();
  v3[35] = swift_getWitnessTable();
  uint64_t v11 = sub_1A56D4EA8();
  v3[36] = v11;
  v3[37] = *(void *)(v11 - 8);
  v3[38] = swift_task_alloc();
  uint64_t v12 = sub_1A56D4E98();
  v3[39] = v12;
  v3[40] = *(void *)(v12 - 8);
  v3[41] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A56C32A4, 0, 0);
}

uint64_t sub_1A56C32A4()
{
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(int *)(*(void *)(v0 + 72) + 36);
  *(_DWORD *)(v0 + 352) = v7;
  uint64_t v8 = v6 + v7;
  uint64_t v9 = type metadata accessor for SFProgressContinuation();
  *(void *)(v0 + 336) = v9;
  uint64_t v10 = *(int *)(v9 + 40);
  *(_DWORD *)(v0 + 356) = v10;
  *(void *)(v0 + 16) = *(void *)(v8 + v10);
  MEMORY[0x1A6269120](v5, v4);
  sub_1A56D4E78();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v11;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v11 = v0;
  v11[1] = sub_1A56C3410;
  uint64_t v13 = *(void *)(v0 + 312);
  uint64_t v14 = *(void *)(v0 + 264);
  return MEMORY[0x1F4187C88](v14, 0, 0, v13, WitnessTable);
}

uint64_t sub_1A56C3410()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_1A56C3F50;
  }
  else {
    uint64_t v1 = sub_1A56C3520;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1A56C3520()
{
  uint64_t v79 = v0;
  uint64_t v1 = *(void *)(v0 + 264);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v0 + 232) + 48))(v1, 1, *(void *)(v0 + 224)) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 320) + 8))(*(void *)(v0 + 328), *(void *)(v0 + 312));
    sub_1A56D4E28();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload == 1)
      {
        (*(void (**)(void, void))(*(void *)(*(void *)(v0 + 216) - 8) + 32))(*(void *)(v0 + 64), *(void *)(v0 + 240));
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
LABEL_18:
        return v3();
      }
      swift_willThrow();
    }
    else
    {
      (*(void (**)(void, void, void))(*(void *)(v0 + 184) + 32))(*(void *)(v0 + 208), *(void *)(v0 + 240), *(void *)(v0 + 176));
      if (sub_1A56D5538())
      {
        if (qword_1E96703B8 != -1) {
          swift_once();
        }
        uint64_t v8 = *(void *)(v0 + 200);
        uint64_t v9 = *(void *)(v0 + 176);
        uint64_t v10 = *(void *)(v0 + 184);
        uint64_t v11 = *(void *)(v0 + 168);
        uint64_t v72 = *(void *)(v0 + 160);
        uint64_t v74 = *(void *)(v0 + 208);
        uint64_t v12 = *(void *)(v0 + 144);
        uint64_t v76 = *(void *)(v0 + 152);
        uint64_t v14 = *(void *)(v0 + 72);
        uint64_t v13 = *(void *)(v0 + 80);
        uint64_t v15 = sub_1A56D4D98();
        __swift_project_value_buffer(v15, (uint64_t)qword_1E96760E0);
        uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
        v16(v11, v13, v14);
        unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
        v17(v8, v74, v9);
        v16(v72, v13, v14);
        v16(v76, v13, v14);
        uint64_t v18 = sub_1A56D4D78();
        os_log_type_t v19 = sub_1A56D57B8();
        uint64_t v77 = v18;
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = *(void *)(v0 + 336);
          uint64_t v71 = v20;
          uint64_t v21 = *(void *)(v0 + 184);
          uint64_t v57 = *(void *)(v0 + 192);
          uint64_t v58 = *(void *)(v0 + 200);
          os_log_type_t type = v19;
          uint64_t v22 = *(void *)(v0 + 168);
          uint64_t v23 = *(void *)(v0 + 176);
          uint64_t v70 = *(void *)(v0 + 160);
          uint64_t v67 = *(void *)(v0 + 152);
          uint64_t v73 = *(void *)(v0 + 144);
          uint64_t v59 = *(void *)(v0 + 128);
          uint64_t v61 = *(void *)(v0 + 112);
          uint64_t v62 = *(void *)(v0 + 120);
          uint64_t v63 = *(void *)(v0 + 96);
          uint64_t v64 = *(void *)(v0 + 104);
          uint64_t v65 = *(void *)(v0 + 88);
          uint64_t v66 = *(void *)(v0 + 136);
          uint64_t v24 = *(void *)(v0 + 72);
          uint64_t v56 = v17;
          uint64_t v25 = swift_slowAlloc();
          uint64_t v68 = swift_slowAlloc();
          v78[0] = v68;
          *(_DWORD *)uint64_t v25 = 136315906;
          uint64_t v26 = (uint64_t *)(v22 + *(int *)(v24 + 36) + *(int *)(v20 + 48));
          uint64_t v28 = *v26;
          unint64_t v27 = v26[1];
          swift_bridgeObjectRetain();
          *(void *)(v0 + 32) = sub_1A54E3290(v28, v27, v78);
          sub_1A56D5928();
          swift_bridgeObjectRelease();
          uint64_t v60 = *(void (**)(void))(v73 + 8);
          ((void (*)(uint64_t, uint64_t))v60)(v22, v24);
          *(_WORD *)(v25 + 12) = 2080;
          v56(v57, v58, v23);
          uint64_t v29 = sub_1A56D5118();
          *(void *)(v0 + 40) = sub_1A54E3290(v29, v30, v78);
          sub_1A56D5928();
          swift_bridgeObjectRelease();
          uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
          v75(v58, v23);
          *(_WORD *)(v25 + 22) = 2080;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v61, 1, 1, v62);
          (*(void (**)(uint64_t, void, uint64_t))(v63 + 104))(v64, *MEMORY[0x1E4F276C0], v65);
          swift_bridgeObjectRetain();
          sub_1A56D4A18();
          uint64_t v31 = sub_1A56D49C8();
          unint64_t v33 = v32;
          (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v66, v62);
          *(void *)(v0 + 48) = sub_1A54E3290(v31, v33, v78);
          sub_1A56D5928();
          swift_bridgeObjectRelease();
          ((void (*)(uint64_t, uint64_t))v60)(v70, v24);
          *(_WORD *)(v25 + 32) = 2048;
          uint64_t v34 = *(void *)(v67 + *(int *)(v24 + 36) + *(int *)(v71 + 56));
          v60();
          *(void *)(v0 + 56) = v34;
          sub_1A56D5928();
          _os_log_impl(&dword_1A5389000, v77, type, "SFProgressTask was cancelled {name: %s progress: %s} [%s:%ld]", (uint8_t *)v25, 0x2Au);
          swift_arrayDestroy();
          MEMORY[0x1A626CE20](v68, -1, -1);
          MEMORY[0x1A626CE20](v25, -1, -1);
        }
        else
        {
          uint64_t v46 = *(void *)(v0 + 200);
          uint64_t v47 = *(void *)(v0 + 176);
          uint64_t v48 = *(void *)(v0 + 184);
          uint64_t v50 = *(void *)(v0 + 160);
          uint64_t v49 = *(void *)(v0 + 168);
          uint64_t v51 = *(void *)(v0 + 72);
          uint64_t v52 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 144) + 8);
          v52(*(void *)(v0 + 152), v51);
          v52(v49, v51);
          uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
          v75(v46, v47);
          v52(v50, v51);
        }
        uint64_t v53 = *(void *)(v0 + 208);
        uint64_t v54 = *(void *)(v0 + 176);
        sub_1A56D5438();
        sub_1A5561590();
        swift_allocError();
        sub_1A56D4F98();
        swift_willThrow();
        v75(v53, v54);
      }
      else
      {
        uint64_t v35 = *(void *)(v0 + 336);
        uint64_t v36 = *(void *)(v0 + 208);
        uint64_t v38 = *(void *)(v0 + 184);
        uint64_t v37 = *(void *)(v0 + 192);
        uint64_t v39 = *(void *)(v0 + 176);
        uint64_t v40 = *(void *)(v0 + 80) + *(int *)(v0 + 352);
        v78[0] = 0;
        v78[1] = 0xE000000000000000;
        sub_1A56D5A28();
        sub_1A56D51C8();
        swift_bridgeObjectRetain();
        sub_1A56D51C8();
        swift_bridgeObjectRelease();
        sub_1A56D51C8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v37, v36, v39);
        sub_1A56D5118();
        sub_1A56D51C8();
        swift_bridgeObjectRelease();
        sub_1A56D51C8();
        uint64_t v41 = (uint64_t *)(v40 + *(int *)(v35 + 52));
        uint64_t v43 = *v41;
        uint64_t v42 = v41[1];
        uint64_t v44 = *(void *)(v40 + *(int *)(v35 + 56));
        sub_1A54F38F4();
        swift_allocError();
        *(void *)uint64_t v45 = 0;
        *(void *)(v45 + 8) = 0xE000000000000000;
        *(void *)(v45 + 16) = v43;
        *(void *)(v45 + 24) = v42;
        *(void *)(v45 + 32) = v44;
        *(_OWORD *)(v45 + 40) = 0u;
        *(_OWORD *)(v45 + 56) = 0u;
        *(_OWORD *)(v45 + 72) = 0u;
        *(_OWORD *)(v45 + 88) = 0u;
        swift_bridgeObjectRetain();
        swift_willThrow();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v39);
      }
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_18;
  }
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 256) + 8))(v1, *(void *)(v0 + 248));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v4;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v4 = v0;
  v4[1] = sub_1A56C3410;
  uint64_t v6 = *(void *)(v0 + 312);
  uint64_t v7 = *(void *)(v0 + 264);
  return MEMORY[0x1F4187C88](v7, 0, 0, v6, WitnessTable);
}

uint64_t sub_1A56C3F50()
{
  (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1A56C4080()
{
  uint64_t v0 = sub_1A56D4D98();
  __swift_allocate_value_buffer(v0, qword_1E96760E0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E96760E0);
  if (qword_1E9670340 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9672AA8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t SFProgressContinuation.init(_:initialProgress:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v47 = a8;
  uint64_t v48 = a3;
  uint64_t v54 = a5;
  uint64_t v55 = a6;
  uint64_t v52 = a2;
  uint64_t v53 = a4;
  uint64_t v51 = a1;
  uint64_t v56 = a9;
  uint64_t v50 = type metadata accessor for SFProgressContinuation.Value();
  uint64_t v10 = MEMORY[0x1F4188790](v50);
  uint64_t v49 = (char *)v42 - v11;
  uint64_t v46 = *(void *)(a7 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v45 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v14 = sub_1A56D55D8();
  uint64_t v43 = *(void *)(v14 - 8);
  uint64_t v44 = v14;
  MEMORY[0x1F4188790](v14);
  v42[0] = (char *)v42 - v15;
  uint64_t v16 = sub_1A56D55E8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  os_log_type_t v19 = (char *)v42 - v18;
  v42[1] = v13;
  uint64_t v20 = sub_1A56D5618();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)v42 - v22;
  uint64_t v24 = sub_1A56D5658();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  unint64_t v27 = (char *)v42 - v26;
  sub_1A56C462C((uint64_t)v19);
  sub_1A56D55C8();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v28 = v56;
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v56, v27, v24);
  uint64_t v29 = (int *)type metadata accessor for SFProgressContinuation();
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v28 + v29[9], v23, v20);
  uint64_t v30 = v46;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
  uint64_t v32 = v48;
  v31(v45, v48, a7);
  uint64_t v33 = v42[0];
  sub_1A56D55F8();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v33, v44);
  sub_1A56D4E48();
  v31(v49, v32, a7);
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = sub_1A56D4E58();
  uint64_t v35 = v56;
  *(void *)(v56 + v29[10]) = v34;
  uint64_t v36 = v35;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v35 + v29[11], v32, a7);
  uint64_t v38 = (void *)(v36 + v29[12]);
  uint64_t v39 = v52;
  *uint64_t v38 = v51;
  v38[1] = v39;
  uint64_t v40 = (void *)(v36 + v29[13]);
  uint64_t v41 = v54;
  *uint64_t v40 = v53;
  v40[1] = v41;
  *(void *)(v36 + v29[14]) = v55;
  return result;
}

uint64_t sub_1A56C462C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FBD120];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v3 = sub_1A56D55E8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t SFProgressContinuation.yield(_:)(uint64_t a1, uint64_t a2)
{
  v18[1] = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = type metadata accessor for SFProgressContinuation.Value();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  uint64_t v21 = v5;
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v18 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v19 = sub_1A56D55D8();
  uint64_t v12 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v14 = (char *)v18 - v13;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v15(v11, a1, v3);
  sub_1A56D5618();
  sub_1A56D55F8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v19);
  v15(v8, a1, v3);
  uint64_t v16 = v20;
  swift_storeEnumTagMultiPayload();
  sub_1A56D4E18();
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v16);
}

uint64_t SFProgressContinuation.finish(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = type metadata accessor for SFProgressContinuation.Value();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - v6;
  uint64_t v10 = 0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  sub_1A56D5618();
  sub_1A56D5608();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v7, a1, v3);
  swift_storeEnumTagMultiPayload();
  sub_1A56D4E18();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v10 = 0;
  return sub_1A56D4E08();
}

void SFProgressContinuation.fail(with:)(void *a1)
{
  uint64_t v2 = type metadata accessor for SFProgressContinuation.Value();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v9 - v4);
  uint64_t v10 = a1;
  id v6 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  sub_1A56D5618();
  sub_1A56D5608();
  *uint64_t v5 = a1;
  swift_storeEnumTagMultiPayload();
  id v7 = a1;
  sub_1A56D4E18();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = a1;
  id v8 = a1;
  sub_1A56D4E08();
}

void SFProgressContinuation.cancel(_:)(id a1)
{
  if (a1)
  {
    id v2 = a1;
  }
  else
  {
    sub_1A56D5438();
    sub_1A5561590();
    id v2 = (id)swift_allocError();
    sub_1A56D4F98();
  }
  id v3 = a1;
  SFProgressContinuation.fail(with:)(v2);
}

uint64_t SFProgressContinuation.task.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  MEMORY[0x1F4188790](a1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v4);
  return sub_1A56C4D98((uint64_t)v4, a2);
}

uint64_t sub_1A56C4D98@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for SFProgressTask();
  uint64_t v5 = v4[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676100);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 24) = 0;
  *(void *)((char *)a2 + v5) = v6;
  *(void *)(v6 + 16) = 0;
  *(void *)((char *)a2 + v4[11]) = 0;
  uint64_t v7 = (char *)a2 + v4[9];
  uint64_t v8 = type metadata accessor for SFProgressContinuation();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  uint64_t v10 = (uint64_t *)(a1 + *(int *)(v8 + 48));
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = v13(a1, v8);
  *a2 = v12;
  a2[1] = v11;
  return result;
}

uint64_t SFProgressTask.init(_:initialProgress:operation:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v48 = a7;
  uint64_t v49 = a8;
  uint64_t v46 = a6;
  uint64_t v50 = a4;
  uint64_t v51 = a5;
  uint64_t v53 = a3;
  uint64_t v44 = a2;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB820);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v47 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = *(void *)(a10 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for SFProgressContinuation();
  uint64_t v18 = *(void *)(v42 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = MEMORY[0x1F4188790](v42);
  uint64_t v43 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v23 = (int *)type metadata accessor for SFProgressTask();
  uint64_t v24 = v23[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676100);
  uint64_t v25 = swift_allocObject();
  *(_DWORD *)(v25 + 24) = 0;
  *(void *)(v25 + 16) = 0;
  *(uint64_t *)((char *)a9 + v24) = v25;
  uint64_t v45 = v23[11];
  *(uint64_t *)((char *)a9 + v45) = 0;
  uint64_t v26 = v44;
  *a9 = a1;
  a9[1] = v26;
  uint64_t v41 = a9;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v17, v53, a10);
  swift_bridgeObjectRetain();
  SFProgressContinuation.init(_:initialProgress:file:line:)(a1, v26, (uint64_t)v17, v46, v48, v49, a10, a11, (uint64_t)v22);
  unint64_t v27 = (char *)a9 + v23[9];
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v29 = v42;
  v28(v27, v22, v42);
  uint64_t v30 = sub_1A56D5478();
  uint64_t v31 = (uint64_t)v47;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v47, 1, 1, v30);
  uint64_t v32 = v43;
  v28(v43, v22, v29);
  unint64_t v33 = (*(unsigned __int8 *)(v18 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v34 = (char *)swift_allocObject();
  *((void *)v34 + 2) = 0;
  *((void *)v34 + 3) = 0;
  *((void *)v34 + 4) = a10;
  *((void *)v34 + 5) = a11;
  uint64_t v35 = v51;
  *((void *)v34 + 6) = v50;
  *((void *)v34 + 7) = v35;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v34[v33], v32, v29);
  uint64_t v36 = sub_1A54EB08C(v31, (uint64_t)&unk_1E9676110, (uint64_t)v34);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v53, a10);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v29);
  uint64_t v37 = v45;
  uint64_t v38 = v41;
  uint64_t result = swift_release();
  *(uint64_t *)((char *)v38 + v37) = v36;
  return result;
}

uint64_t sub_1A56C5254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  uint64_t v10 = type metadata accessor for SFProgressContinuation();
  v8[7] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v8[8] = v11;
  v8[9] = *(void *)(v11 + 64);
  v8[10] = swift_task_alloc();
  v8[11] = *(void *)(a8 - 8);
  v8[12] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A56C5380, 0, 0);
}

uint64_t sub_1A56C5380()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(int **)(v0 + 16);
  long long v10 = *(_OWORD *)(v0 + 40);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v1, *(void *)(v0 + 32), v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  *(void *)(v0 + 104) = v6;
  *(_OWORD *)(v6 + 16) = v10;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t (*)(uint64_t), uint64_t))((char *)v4 + *v4);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v7;
  void *v7 = v0;
  v7[1] = sub_1A56C5504;
  uint64_t v8 = *(void *)(v0 + 96);
  return v11(v8, sub_1A56CAD60, v6);
}

uint64_t sub_1A56C5504()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A56C5708;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1A56C5620;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A56C5620()
{
  uint64_t v1 = (void *)v0[15];
  sub_1A56D5548();
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  if (v1)
  {
    (*(void (**)(void, void))(v3 + 8))(v0[12], v0[6]);
    SFProgressContinuation.fail(with:)(v1);
  }
  else
  {
    uint64_t v4 = v0[6];
    SFProgressContinuation.finish(with:)(v0[12], v0[7]);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1A56C5708()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 120);
  SFProgressContinuation.fail(with:)(v1);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t SFProgressTask.cancel(_:)(void *a1, uint64_t a2)
{
  type metadata accessor for SFProgressContinuation();
  SFProgressContinuation.cancel(_:)(a1);
  uint64_t result = *(void *)(v2 + *(int *)(a2 + 44));
  if (result)
  {
    return sub_1A56D5528();
  }
  return result;
}

uint64_t SFProgressTask.makeAsyncIterator()(uint64_t a1)
{
  sub_1A56C58A8(*(os_unfair_lock_s **)(v1 + *(int *)(a1 + 40)));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  sub_1A56D5658();
  return sub_1A56D54E8();
}

void sub_1A56C58A8(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 4;
  uint64_t v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_1A56CAB74(v1);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_1A56C5908(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SFProgressTask();
  uint64_t result = MEMORY[0x1F4188790](v4);
  if (*a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v9 - v8, a2, v6);
    v9[0] = 0;
    v9[1] = 0xE000000000000000;
    sub_1A56D5A28();
    sub_1A56D51C8();
    type metadata accessor for SFProgressContinuation();
    swift_bridgeObjectRetain();
    sub_1A56D51C8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1A56D5BC8();
    __break(1u);
  }
  else
  {
    *a1 = 1;
  }
  return result;
}

uint64_t sub_1A56C5AC0(uint64_t a1)
{
  SFProgressTask.makeAsyncIterator()(a1);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);

  return v3(v1, a1);
}

uint64_t SFProgressTask.split()(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  char v69 = a1;
  uint64_t v70 = a2;
  uint64_t v67 = *(void *)(a3 - 8);
  uint64_t v68 = *(void *)(v67 + 64);
  MEMORY[0x1F4188790](a1);
  uint64_t v66 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB820);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v75 = (uint64_t)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = *(void *)(*(void *)(a3 + 16) - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v62 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = *(void *)(a3 + 24);
  uint64_t v11 = a3;
  uint64_t v60 = a3;
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for SFProgressContinuation();
  uint64_t v65 = *(void *)(v14 - 8);
  uint64_t v64 = *(void *)(v65 + 64);
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v74 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v73 = (char *)&v58 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v63 = (uint64_t)&v58 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v58 - v21;
  uint64_t v72 = (char *)&v58 - v21;
  uint64_t v23 = *v3;
  uint64_t v24 = v3[1];
  uint64_t v59 = v3;
  uint64_t v77 = v23;
  uint64_t v78 = v24;
  swift_bridgeObjectRetain();
  sub_1A56D51C8();
  uint64_t v25 = v77;
  uint64_t v26 = v78;
  unint64_t v27 = (char *)v4 + *(int *)(v11 + 36) + *(int *)(v14 + 44);
  uint64_t v28 = *(void (**)(uint64_t, char *, uint64_t))(v76 + 16);
  v76 += 16;
  uint64_t v58 = v28;
  uint64_t v29 = (uint64_t)v62;
  v28((uint64_t)v62, v27, v13);
  uint64_t v30 = v26;
  uint64_t v31 = v13;
  uint64_t v32 = v13;
  uint64_t v61 = v13;
  uint64_t v33 = v71;
  SFProgressContinuation.init(_:initialProgress:file:line:)(v25, v30, v29, 0xD00000000000004CLL, 0x80000001A573D210, 190, v31, v71, (uint64_t)v22);
  uint64_t v77 = v23;
  uint64_t v78 = v24;
  swift_bridgeObjectRetain();
  sub_1A56D51C8();
  uint64_t v34 = v77;
  uint64_t v35 = v78;
  uint64_t v37 = v59;
  uint64_t v36 = v60;
  v58(v29, (char *)v59 + *(int *)(v60 + 36) + *(int *)(v14 + 44), v32);
  uint64_t v38 = v63;
  SFProgressContinuation.init(_:initialProgress:file:line:)(v34, v35, v29, 0xD00000000000004CLL, 0x80000001A573D210, 191, v32, v33, v63);
  uint64_t v39 = sub_1A56D5478();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v75, 1, 1, v39);
  uint64_t v41 = v66;
  uint64_t v40 = v67;
  uint64_t v42 = v37;
  uint64_t v43 = v36;
  (*(void (**)(char *, void *, uint64_t))(v67 + 16))(v66, v42, v36);
  uint64_t v44 = v65;
  uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
  v45(v73, v72, v14);
  v45(v74, (char *)v38, v14);
  uint64_t v46 = v40;
  unint64_t v47 = (*(unsigned __int8 *)(v40 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v48 = *(unsigned __int8 *)(v44 + 80);
  unint64_t v49 = (v68 + v47 + v48) & ~v48;
  unint64_t v50 = (v64 + v48 + v49) & ~v48;
  uint64_t v51 = (char *)swift_allocObject();
  *((void *)v51 + 2) = 0;
  *((void *)v51 + 3) = 0;
  uint64_t v52 = v71;
  *((void *)v51 + 4) = v61;
  *((void *)v51 + 5) = v52;
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(&v51[v47], v41, v43);
  uint64_t v53 = &v51[v49];
  uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
  v54(v53, v73, v14);
  v54(&v51[v50], v74, v14);
  sub_1A54EB08C(v75, (uint64_t)&unk_1E9676120, (uint64_t)v51);
  swift_release();
  uint64_t v55 = v72;
  SFProgressContinuation.task.getter(v14, v69);
  SFProgressContinuation.task.getter(v14, v70);
  uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v56(v38, v14);
  return ((uint64_t (*)(char *, uint64_t))v56)(v55, v14);
}

uint64_t sub_1A56C60C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  v8[8] = *(void *)(a8 - 8);
  v8[9] = swift_task_alloc();
  v8[10] = *(void *)(a7 - 8);
  v8[11] = swift_task_alloc();
  sub_1A56D5898();
  v8[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v10 = sub_1A56D5648();
  v8[13] = v10;
  v8[14] = *(void *)(v10 - 8);
  v8[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A56C627C, 0, 0);
}

uint64_t sub_1A56C627C()
{
  uint64_t v1 = type metadata accessor for SFProgressTask();
  v0[16] = v1;
  SFProgressTask.makeAsyncIterator()(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  void *v2 = v0;
  v2[1] = sub_1A56C6350;
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  return MEMORY[0x1F4187ED8](v3, 0, 0, v4, v0 + 2);
}

uint64_t sub_1A56C6350()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A56C6914;
  }
  else {
    uint64_t v2 = sub_1A56C6464;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A56C6464()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[6];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    uint64_t v4 = (void *)v0[18];
    (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
    sub_1A56D5548();
    if (v4)
    {
      type metadata accessor for SFProgressContinuation();
      SFProgressContinuation.fail(with:)(v4);
      SFProgressContinuation.fail(with:)(v4);

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v5 = (uint64_t (*)(void))v0[1];
      return v5();
    }
    else
    {
      uint64_t v12 = (void *)swift_task_alloc();
      v0[19] = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_1A56C6720;
      uint64_t v13 = v0[16];
      uint64_t v14 = v0[9];
      return SFProgressTask.finalValue.getter(v14, v13);
    }
  }
  else
  {
    uint64_t v7 = v0[11];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v7, v1, v3);
    uint64_t v8 = type metadata accessor for SFProgressContinuation();
    SFProgressContinuation.yield(_:)(v7, v8);
    SFProgressContinuation.yield(_:)(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v3);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[17] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_1A56C6350;
    uint64_t v10 = v0[12];
    uint64_t v11 = v0[13];
    return MEMORY[0x1F4187ED8](v10, 0, 0, v11, v0 + 2);
  }
}

uint64_t sub_1A56C6720()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A56C69F0;
  }
  else {
    uint64_t v2 = sub_1A56C6834;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A56C6834()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = type metadata accessor for SFProgressContinuation();
  SFProgressContinuation.finish(with:)(v1, v4);
  SFProgressContinuation.finish(with:)(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1A56C6914()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  uint64_t v1 = (void *)v0[2];
  type metadata accessor for SFProgressContinuation();
  SFProgressContinuation.fail(with:)(v1);
  SFProgressContinuation.fail(with:)(v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1A56C69F0()
{
  uint64_t v1 = *(void **)(v0 + 160);
  type metadata accessor for SFProgressContinuation();
  SFProgressContinuation.fail(with:)(v1);
  SFProgressContinuation.fail(with:)(v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t withProgressTask<A, B>(_:initialProgress:operation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v30 = a3;
  uint64_t v31 = a1;
  uint64_t v35 = a8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB820);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v32 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a6 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for SFProgressContinuation();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v30 - v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v30, a6);
  swift_bridgeObjectRetain();
  SFProgressContinuation.init(_:initialProgress:file:line:)(v31, a2, (uint64_t)v16, 0xD00000000000004CLL, 0x80000001A573D210, 217, a6, a7, (uint64_t)v23);
  uint64_t v24 = sub_1A56D5478();
  uint64_t v25 = (uint64_t)v32;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v32, 1, 1, v24);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  unint64_t v26 = (*(unsigned __int8 *)(v18 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = 0;
  *((void *)v27 + 3) = 0;
  *((void *)v27 + 4) = a6;
  *((void *)v27 + 5) = a7;
  uint64_t v28 = v34;
  *((void *)v27 + 6) = v33;
  *((void *)v27 + 7) = v28;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v27[v26], v21, v17);
  swift_retain();
  sub_1A54EB08C(v25, (uint64_t)&unk_1E9676130, (uint64_t)v27);
  swift_release();
  SFProgressContinuation.task.getter(v17, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v23, v17);
}

uint64_t sub_1A56C6DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return MEMORY[0x1F4188298](sub_1A56C6DF8, 0, 0);
}

uint64_t sub_1A56C6DF8()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  long long v5 = *(_OWORD *)(v0 + 16);
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 48) = v3;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  v6[2] = v2;
  v6[3] = v1;
  v6[4] = v3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v7;
  void *v7 = v0;
  v7[1] = sub_1A56C6F1C;
  uint64_t v8 = MEMORY[0x1E4FBC848] + 8;
  return MEMORY[0x1F4188148](v7, &unk_1E9676240, v4, sub_1A56CAB3C, v6, 0, 0, v8);
}

uint64_t sub_1A56C6F1C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A56C7040;
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = sub_1A55B04C4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A56C7040()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  type metadata accessor for SFProgressContinuation();
  SFProgressContinuation.fail(with:)(v1);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1A56C70E8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_1A54E83BC;
  return v8(a4);
}

uint64_t type metadata accessor for SFProgressContinuation.Value()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SFProgressTask()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A56C71F8(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for SFProgressContinuation() - 8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v6 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_1A54E8628;
  return sub_1A56C5254(a1, v7, v8, v9, v10, v11, v4, v5);
}

uint64_t sub_1A56C7314()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for SFProgressTask() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = *(void *)(*(void *)v2 + 64);
  uint64_t v5 = (int *)(type metadata accessor for SFProgressContinuation() - 8);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)v5 + 80);
  unint64_t v15 = (v3 + v4 + v6) & ~v6;
  unint64_t v16 = (*(void *)(*(void *)v5 + 64) + v6 + v15) & ~v6;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v7 = v0 + v3 + v2[11];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v8 = sub_1A56D5658();
  uint64_t v14 = *(void (**)(unint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v14(v7, v8);
  unint64_t v9 = v7 + v5[11];
  uint64_t v10 = sub_1A56D5618();
  uint64_t v13 = *(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v13(v9, v10);
  swift_release();
  uint64_t v12 = *(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8);
  v12(v7 + v5[13], v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v14(v0 + v15, v8);
  v13(v0 + v15 + v5[11], v10);
  swift_release();
  v12(v0 + v15 + v5[13], v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14(v0 + v16, v8);
  v13(v0 + v16 + v5[11], v10);
  swift_release();
  v12(v0 + v16 + v5[13], v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A56C76BC(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v6 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v7 = *(void *)(type metadata accessor for SFProgressTask() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(type metadata accessor for SFProgressContinuation() - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  unint64_t v12 = (v8 + v9 + v11) & ~v11;
  uint64_t v13 = v1[2];
  uint64_t v14 = v1[3];
  uint64_t v15 = (uint64_t)v1 + v8;
  uint64_t v16 = (uint64_t)v1 + v12;
  uint64_t v17 = (uint64_t)v1 + ((*(void *)(v10 + 64) + v11 + v12) & ~v11);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v18;
  *uint64_t v18 = v3;
  v18[1] = sub_1A54E83BC;
  return sub_1A56C60C0(a1, v13, v14, v15, v16, v17, v6, v5);
}

uint64_t objectdestroyTm_4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for SFProgressContinuation() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v4 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v5 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v4 + v2[11];
  uint64_t v7 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v4 + v2[13], v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A56C7A48()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(type metadata accessor for SFProgressContinuation() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v6;
  *(void *)uint64_t v6 = v1;
  *(void *)(v6 + 8) = sub_1A54E8628;
  *(void *)(v6 + 40) = v2;
  *(void *)(v6 + 48) = v3;
  *(void *)(v6 + 32) = v5;
  *(_OWORD *)(v6 + 16) = v7;
  return MEMORY[0x1F4188298](sub_1A56C6DF8, 0, 0);
}

uint64_t sub_1A56C7B4C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A56C7B68()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t result = sub_1A56D5658();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1A56D5618();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_1A56C7CD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)(a3 + 16);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
    uint64_t v8 = sub_1A56D5658();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1A56D5618();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = *(int *)(a3 + 44);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    swift_retain();
    v16(v14, v15, v7);
    uint64_t v17 = *(int *)(a3 + 48);
    uint64_t v18 = *(int *)(a3 + 52);
    uint64_t v19 = (uint64_t *)((char *)a1 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = (uint64_t *)((char *)a1 + v18);
    uint64_t v23 = (uint64_t *)((char *)a2 + v18);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 56)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 56));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A56C7EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v5 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1 + *(int *)(a2 + 44), v4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A56C7FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v7 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 44);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  swift_retain();
  v15(v13, v14, v6);
  uint64_t v16 = *(int *)(a3 + 48);
  uint64_t v17 = *(int *)(a3 + 52);
  uint64_t v18 = (void *)(a1 + v16);
  uint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = (void *)(a1 + v17);
  uint64_t v22 = (void *)(a2 + v17);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  *(void *)(a1 + *(int *)(a3 + 56)) = *(void *)(a2 + *(int *)(a3 + 56));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A56C8174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v7 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  swift_retain();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1 + *(int *)(a3 + 44), a2 + *(int *)(a3 + 44), v6);
  uint64_t v12 = *(int *)(a3 + 48);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(int *)(a3 + 52);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 56)) = *(void *)(a2 + *(int *)(a3 + 56));
  return a1;
}

uint64_t sub_1A56C8328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v7 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 44);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1 + v12, a2 + v12, v6);
  uint64_t v13 = *(int *)(a3 + 52);
  *(_OWORD *)(a1 + *(int *)(a3 + 48)) = *(_OWORD *)(a2 + *(int *)(a3 + 48));
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  *(void *)(a1 + *(int *)(a3 + 56)) = *(void *)(a2 + *(int *)(a3 + 56));
  return a1;
}

uint64_t sub_1A56C8484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v7 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1 + *(int *)(a3 + 44), a2 + *(int *)(a3 + 44), v6);
  uint64_t v12 = *(int *)(a3 + 48);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(a3 + 52);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 56)) = *(void *)(a2 + *(int *)(a3 + 56));
  return a1;
}

uint64_t sub_1A56C8610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56C8624);
}

uint64_t sub_1A56C8624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v7 = sub_1A56D5658();
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    uint64_t v11 = a1;
LABEL_5:
    return v10(v11, a2, v9);
  }
  uint64_t v12 = sub_1A56D5618();
  uint64_t v13 = *(void *)(v12 - 8);
  if (*(_DWORD *)(v13 + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v15 = *(void *)(a1 + *(int *)(a3 + 40));
    if (v15 >= 0xFFFFFFFF) {
      LODWORD(v15) = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = a1 + *(int *)(a3 + 44);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
    return v17(v16, a2, v6);
  }
}

uint64_t sub_1A56C87DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56C87F0);
}

uint64_t sub_1A56C87F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v9 = sub_1A56D5658();
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    uint64_t v13 = a1;
LABEL_5:
    return v12(v13, a2, a2, v11);
  }
  uint64_t result = sub_1A56D5618();
  uint64_t v15 = *(void *)(result - 8);
  if (*(_DWORD *)(v15 + 84) == a3)
  {
    uint64_t v11 = result;
    uint64_t v13 = a1 + *(int *)(a4 + 36);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  }
  else
  {
    uint64_t v16 = a1 + *(int *)(a4 + 44);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v17(v16, a2, a2, v8);
  }
  return result;
}

uint64_t sub_1A56C89A8()
{
  uint64_t result = type metadata accessor for SFProgressContinuation();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A56C8A5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    unint64_t v3 = (uint64_t *)(v30 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    uint64_t v6 = a2[1];
    uint64_t *v3 = *a2;
    v3[1] = v6;
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (char *)v3 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
    uint64_t v11 = sub_1A56D5658();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
    uint64_t v12 = (int *)type metadata accessor for SFProgressContinuation();
    uint64_t v13 = v12[9];
    uint64_t v14 = &v8[v13];
    uint64_t v15 = &v9[v13];
    uint64_t v16 = sub_1A56D5618();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    *(void *)&v8[v12[10]] = *(void *)&v9[v12[10]];
    uint64_t v17 = v12[11];
    uint64_t v18 = &v8[v17];
    uint64_t v19 = &v9[v17];
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    v20(v18, v19, v10);
    uint64_t v21 = v12[12];
    uint64_t v22 = &v8[v21];
    uint64_t v23 = &v9[v21];
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)uint64_t v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    uint64_t v25 = v12[13];
    unint64_t v26 = &v8[v25];
    unint64_t v27 = &v9[v25];
    uint64_t v28 = *((void *)v27 + 1);
    *(void *)unint64_t v26 = *(void *)v27;
    *((void *)v26 + 1) = v28;
    *(void *)&v8[v12[14]] = *(void *)&v9[v12[14]];
    uint64_t v29 = *(int *)(a3 + 44);
    *(uint64_t *)((char *)v3 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
    *(uint64_t *)((char *)v3 + v29) = *(uint64_t *)((char *)a2 + v29);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return v3;
}

uint64_t sub_1A56C8C98(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = *(void *)(a2 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v6 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  uint64_t v7 = type metadata accessor for SFProgressContinuation();
  uint64_t v8 = v4 + *(int *)(v7 + 36);
  uint64_t v9 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4 + *(int *)(v7 + 44), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *sub_1A56C8E28(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)(a3 + 16);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v10 = sub_1A56D5658();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
  uint64_t v11 = (int *)type metadata accessor for SFProgressContinuation();
  uint64_t v12 = v11[9];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_1A56D5618();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  *(void *)&v7[v11[10]] = *(void *)&v8[v11[10]];
  uint64_t v16 = v11[11];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v19(v17, v18, v9);
  uint64_t v20 = v11[12];
  uint64_t v21 = &v7[v20];
  uint64_t v22 = &v8[v20];
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = v23;
  uint64_t v24 = v11[13];
  uint64_t v25 = &v7[v24];
  unint64_t v26 = &v8[v24];
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = v27;
  *(void *)&v7[v11[14]] = *(void *)&v8[v11[14]];
  uint64_t v28 = *(int *)(a3 + 44);
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1A56C9018(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v10 = sub_1A56D5658();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v7, v8, v10);
  uint64_t v11 = (int *)type metadata accessor for SFProgressContinuation();
  uint64_t v12 = v11[9];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_1A56D5618();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)&v7[v11[10]] = *(void *)&v8[v11[10]];
  swift_retain();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(&v7[v11[11]], &v8[v11[11]], v9);
  uint64_t v16 = v11[12];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = v11[13];
  uint64_t v20 = &v7[v19];
  uint64_t v21 = &v8[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v7[v11[14]] = *(void *)&v8[v11[14]];
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 44)) = *(void *)((char *)a2 + *(int *)(a3 + 44));
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1A56C924C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v10 = sub_1A56D5658();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
  uint64_t v11 = (int *)type metadata accessor for SFProgressContinuation();
  uint64_t v12 = v11[9];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_1A56D5618();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(void *)&v7[v11[10]] = *(void *)&v8[v11[10]];
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(&v7[v11[11]], &v8[v11[11]], v9);
  *(_OWORD *)&v7[v11[12]] = *(_OWORD *)&v8[v11[12]];
  *(_OWORD *)&v7[v11[13]] = *(_OWORD *)&v8[v11[13]];
  *(void *)&v7[v11[14]] = *(void *)&v8[v11[14]];
  uint64_t v16 = *(int *)(a3 + 44);
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  return a1;
}

void *sub_1A56C93F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v11 = sub_1A56D5658();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v8, v9, v11);
  uint64_t v12 = (int *)type metadata accessor for SFProgressContinuation();
  uint64_t v13 = v12[9];
  uint64_t v14 = &v8[v13];
  uint64_t v15 = &v9[v13];
  uint64_t v16 = sub_1A56D5618();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *(void *)&v8[v12[10]] = *(void *)&v9[v12[10]];
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(&v8[v12[11]], &v9[v12[11]], v10);
  uint64_t v17 = v12[12];
  uint64_t v18 = &v8[v17];
  uint64_t v19 = &v9[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v12[13];
  uint64_t v23 = &v8[v22];
  uint64_t v24 = &v9[v22];
  uint64_t v26 = *(void *)v24;
  uint64_t v25 = *((void *)v24 + 1);
  *(void *)uint64_t v23 = v26;
  *((void *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  *(void *)&v8[v12[14]] = *(void *)&v9[v12[14]];
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 44)) = *(void *)((char *)a2 + *(int *)(a3 + 44));
  swift_release();
  return a1;
}

uint64_t sub_1A56C95E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A56C95F4);
}

uint64_t sub_1A56C95F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for SFProgressContinuation();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1A56C96A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A56C96BC);
}

uint64_t sub_1A56C96BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for SFProgressContinuation();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1A56C9768()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

char *sub_1A56C983C(char *a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  if (v6 <= *(void *)(v4 + 64)) {
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v6 <= 8) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = *(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80);
  if ((unint64_t)(v7 + 1) <= 0x18 && (v8 & 0x1000F8) == 0)
  {
    unsigned int v11 = a2[v7];
    unsigned int v12 = v11 - 3;
    if (v11 >= 3)
    {
      if (v7 <= 3) {
        uint64_t v13 = v7;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a2;
          goto LABEL_20;
        case 2:
          int v14 = *(unsigned __int16 *)a2;
          goto LABEL_20;
        case 3:
          int v14 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_20;
        case 4:
          int v14 = *(_DWORD *)a2;
LABEL_20:
          int v15 = (v14 | (v12 << (8 * v7))) + 3;
          unsigned int v11 = v14 + 3;
          if (v7 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    if (v11 == 2)
    {
      uint64_t v16 = *(void *)a2;
      id v17 = *(id *)a2;
      *(void *)unint64_t v3 = v16;
      v3[v7] = 2;
    }
    else if (v11 == 1)
    {
      (*(void (**)(char *))(v5 + 16))(a1);
      v3[v7] = 1;
    }
    else
    {
      (*(void (**)(char *))(v4 + 16))(a1);
      v3[v7] = 0;
    }
  }
  else
  {
    uint64_t v10 = *(char **)a2;
    *(void *)unint64_t v3 = *(void *)a2;
    unint64_t v3 = &v10[((v8 & 0xF8 | 7u) + 16) & ~(unint64_t)(v8 & 0xF8 | 7u)];
    swift_retain();
  }
  return v3;
}

void sub_1A56C9A4C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 24) - 8);
  unint64_t v3 = *(void *)(v2 + 64);
  if (v3 <= *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64)) {
    unint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  }
  if (v3 <= 8) {
    unint64_t v3 = 8;
  }
  unsigned int v4 = a1[v3];
  unsigned int v5 = v4 - 3;
  if (v4 >= 3)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_14;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_14;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_14;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_14:
        int v8 = (v7 | (v5 << (8 * v3))) + 3;
        unsigned int v4 = v7 + 3;
        if (v3 < 4) {
          unsigned int v4 = v8;
        }
        break;
      default:
        break;
    }
  }
  if (v4 == 2)
  {
  }
  else if (v4 == 1)
  {
    (*(void (**)(void))(v2 + 8))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_1A56C9BBC(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  if (v5 <= *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)) {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v5 <= 8) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = v5;
  }
  unsigned int v7 = a2[v6];
  unsigned int v8 = v7 - 3;
  if (v7 >= 3)
  {
    if (v6 <= 3) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a2;
        goto LABEL_15;
      case 2:
        int v10 = *(unsigned __int16 *)a2;
        goto LABEL_15;
      case 3:
        int v10 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_15;
      case 4:
        int v10 = *(_DWORD *)a2;
LABEL_15:
        int v11 = (v10 | (v8 << (8 * v6))) + 3;
        unsigned int v7 = v10 + 3;
        if (v6 < 4) {
          unsigned int v7 = v11;
        }
        break;
      default:
        break;
    }
  }
  if (v7 == 2)
  {
    uint64_t v13 = *(void *)a2;
    id v14 = *(id *)a2;
    *a1 = v13;
    char v12 = 2;
  }
  else if (v7 == 1)
  {
    (*(void (**)(void *))(v4 + 16))(a1);
    char v12 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v12 = 0;
  }
  *((unsigned char *)a1 + v6) = v12;
  return a1;
}

unsigned __int8 *sub_1A56C9D80(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t v8 = *(void *)(v6 - 8);
    unint64_t v9 = *(void *)(v8 + 64);
    if (v9 <= *(void *)(v7 + 64)) {
      unint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    if (v9 <= 8) {
      uint64_t v10 = 8;
    }
    else {
      uint64_t v10 = v9;
    }
    unsigned int v11 = a1[v10];
    unsigned int v12 = v11 - 3;
    if (v11 >= 3)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a1;
          goto LABEL_16;
        case 2:
          int v14 = *(unsigned __int16 *)a1;
          goto LABEL_16;
        case 3:
          int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_16;
        case 4:
          int v14 = *(_DWORD *)a1;
LABEL_16:
          int v15 = (v14 | (v12 << (8 * v10))) + 3;
          unsigned int v11 = v14 + 3;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    if (v11 == 2)
    {
    }
    else
    {
      if (v11 == 1) {
        uint64_t v16 = *(void (**)(void))(v8 + 8);
      }
      else {
        uint64_t v16 = *(void (**)(void))(v7 + 8);
      }
      v16();
    }
    unsigned int v17 = a2[v10];
    unsigned int v18 = v17 - 3;
    if (v17 >= 3)
    {
      if (v10 <= 3) {
        uint64_t v19 = v10;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *a2;
          goto LABEL_33;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_33;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_33;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_33:
          int v21 = (v20 | (v18 << (8 * v10))) + 3;
          unsigned int v17 = v20 + 3;
          if (v10 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    if (v17 == 2)
    {
      uint64_t v23 = *(void **)a2;
      id v24 = v23;
      *(void *)a1 = v23;
      char v22 = 2;
    }
    else if (v17 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v8 + 16))(a1, a2, v6);
      char v22 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v5);
      char v22 = 0;
    }
    a1[v10] = v22;
  }
  return a1;
}

void *sub_1A56CA03C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  if (v5 <= *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)) {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v5 <= 8) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = v5;
  }
  unsigned int v7 = a2[v6];
  unsigned int v8 = v7 - 3;
  if (v7 >= 3)
  {
    if (v6 <= 3) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a2;
        goto LABEL_15;
      case 2:
        int v10 = *(unsigned __int16 *)a2;
        goto LABEL_15;
      case 3:
        int v10 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_15;
      case 4:
        int v10 = *(_DWORD *)a2;
LABEL_15:
        int v11 = (v10 | (v8 << (8 * v6))) + 3;
        unsigned int v7 = v10 + 3;
        if (v6 < 4) {
          unsigned int v7 = v11;
        }
        break;
      default:
        break;
    }
  }
  if (v7 == 2)
  {
    *a1 = *(void *)a2;
    char v12 = 2;
  }
  else if (v7 == 1)
  {
    (*(void (**)(void *))(v4 + 32))(a1);
    char v12 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v12 = 0;
  }
  *((unsigned char *)a1 + v6) = v12;
  return a1;
}

unsigned __int8 *sub_1A56CA1F0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t v8 = *(void *)(v6 - 8);
    unint64_t v9 = *(void *)(v8 + 64);
    if (v9 <= *(void *)(v7 + 64)) {
      unint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    if (v9 <= 8) {
      uint64_t v10 = 8;
    }
    else {
      uint64_t v10 = v9;
    }
    unsigned int v11 = a1[v10];
    unsigned int v12 = v11 - 3;
    if (v11 >= 3)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a1;
          goto LABEL_16;
        case 2:
          int v14 = *(unsigned __int16 *)a1;
          goto LABEL_16;
        case 3:
          int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_16;
        case 4:
          int v14 = *(_DWORD *)a1;
LABEL_16:
          int v15 = (v14 | (v12 << (8 * v10))) + 3;
          unsigned int v11 = v14 + 3;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    if (v11 == 2)
    {
    }
    else
    {
      if (v11 == 1) {
        uint64_t v16 = *(void (**)(void))(v8 + 8);
      }
      else {
        uint64_t v16 = *(void (**)(void))(v7 + 8);
      }
      v16();
    }
    unsigned int v17 = a2[v10];
    unsigned int v18 = v17 - 3;
    if (v17 >= 3)
    {
      if (v10 <= 3) {
        uint64_t v19 = v10;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *a2;
          goto LABEL_33;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_33;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_33;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_33:
          int v21 = (v20 | (v18 << (8 * v10))) + 3;
          unsigned int v17 = v20 + 3;
          if (v10 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    if (v17 == 2)
    {
      *(void *)a1 = *(void *)a2;
      char v22 = 2;
    }
    else if (v17 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v8 + 32))(a1, a2, v6);
      char v22 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v5);
      char v22 = 0;
    }
    a1[v10] = v22;
  }
  return a1;
}

uint64_t sub_1A56CA4A4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  if (*(void *)(v4 + 64) > v3) {
    unint64_t v3 = *(void *)(v4 + 64);
  }
  uint64_t v5 = 8;
  if (v3 > 8) {
    uint64_t v5 = v3;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_24;
  }
  uint64_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    unsigned int v10 = ((a2 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v10))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v10 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v10 < 2)
    {
LABEL_24:
      unsigned int v12 = *((unsigned __int8 *)a1 + v5);
      if (v12 >= 3) {
        return (v12 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_24;
  }
LABEL_16:
  int v11 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v6 | v11) + 254;
}

void sub_1A56CA5F4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (*(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) > v5) {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  }
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_36:
        __break(1u);
        JUMPOUT(0x1A56CA7D8);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_24;
      case 3:
        goto LABEL_36;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      default:
LABEL_24:
        if (a2) {
LABEL_25:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_1A56CA800(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v3 = *(void *)(*(void *)(a2 + 24) - 8);
  if (*(void *)(v3 + 64) > v2) {
    unint64_t v2 = *(void *)(v3 + 64);
  }
  uint64_t v4 = 8;
  if (v2 > 8) {
    uint64_t v4 = v2;
  }
  uint64_t v5 = a1[v4];
  int v6 = v5 - 3;
  if (v5 >= 3)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_14;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_14;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_14;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_14:
        unsigned int v9 = (v8 | (v6 << (8 * v4))) + 3;
        LODWORD(v5) = v8 + 3;
        if (v4 >= 4) {
          uint64_t v5 = v5;
        }
        else {
          uint64_t v5 = v9;
        }
        break;
      default:
        return v5;
    }
  }
  return v5;
}

void sub_1A56CA8D4(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 > 2)
  {
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
    if (*(void *)(v7 + 64) > v6) {
      unint64_t v6 = *(void *)(v7 + 64);
    }
    if (v6 <= 8) {
      size_t v8 = 8;
    }
    else {
      size_t v8 = v6;
    }
    unsigned int v9 = a2 - 3;
    if (v8 < 4)
    {
      unsigned int v10 = v9 >> (8 * v8);
      int v11 = v9 & ~(-1 << (8 * v8));
      a1[v8] = v10 + 3;
      bzero(a1, v8);
      if (v8 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if (v8 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      a1[v8] = 3;
      bzero(a1, v8);
      *(_DWORD *)a1 = v9;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    if (*(void *)(v4 + 64) > v5) {
      unint64_t v5 = *(void *)(v4 + 64);
    }
    if (v5 <= 8) {
      unint64_t v5 = 8;
    }
    a1[v5] = a2;
  }
}

uint64_t sub_1A56CAA14()
{
  unint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1A54E83BC;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  unint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *unint64_t v5 = v4;
  v5[1] = sub_1A54E83BC;
  return v7(v3);
}

void sub_1A56CAB3C()
{
}

uint64_t sub_1A56CAB74(void *a1)
{
  return sub_1A56C5908(a1, *(void *)(v1 + 32));
}

uint64_t sub_1A56CAB94()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = (int *)(type metadata accessor for SFProgressContinuation() - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E966C8B0);
  uint64_t v4 = sub_1A56D5658();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v3 + v2[11];
  uint64_t v6 = sub_1A56D5618();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v3 + v2[13], v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A56CAD60(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SFProgressContinuation();
  return SFProgressContinuation.yield(_:)(a1, v2);
}

ValueMetadata *type metadata accessor for SFAirDropReceive()
{
  return &type metadata for SFAirDropReceive;
}

uint64_t static NWParameters.airDropClientBrowserParameters(domain:type:bundleID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = sub_1A56D4F08();
  sub_1A56D4F18();
  xpc_object_t v8 = xpc_array_create(0, 0);
  size_t v9 = sub_1A56D4DA8();
  uint64_t v10 = sub_1A56D5148();
  xpc_array_set_string(v8, v9, (const char *)(v10 + 32));
  swift_release();
  xpc_object_t v11 = xpc_array_create(0, 0);
  size_t v12 = sub_1A56D4DA8();
  uint64_t v13 = sub_1A56D5148();
  xpc_array_set_string(v11, v12, (const char *)(v13 + 32));
  swift_release();
  nw_parameters_set_required_netagent_classes();
  if (a6)
  {
    sub_1A56D5148();
    nw_parameters_set_attributed_bundle_identifier();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

uint64_t static NWParameters.airDropNetworkBrowserParameters(domain:type:)()
{
  uint64_t v0 = sub_1A56D4F08();
  sub_1A56D4F18();
  xpc_object_t v1 = xpc_array_create(0, 0);
  size_t v2 = sub_1A56D4DA8();
  uint64_t v3 = sub_1A56D5148();
  xpc_array_set_string(v1, v2, (const char *)(v3 + 32));
  swift_release();
  xpc_object_t v4 = xpc_array_create(0, 0);
  size_t v5 = sub_1A56D4DA8();
  uint64_t v6 = sub_1A56D5148();
  xpc_array_set_string(v4, v5, (const char *)(v6 + 32));
  swift_release();
  swift_unknownObjectRetain();
  nw_parameters_set_required_netagent_classes();
  nw_parameters_set_include_ble();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease_n();
  return v0;
}

uint64_t SFNWInterfaceType.description.getter()
{
  uint64_t result = 1818523489;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x72616C756C6C6563;
      break;
    case 2:
      uint64_t result = 0x6957746365726964;
      break;
    case 3:
      uint64_t result = 0x4669576C61636F6CLL;
      break;
    case 4:
      uint64_t result = 0x726568746FLL;
      break;
    case 5:
      uint64_t result = 1768319351;
      break;
    case 6:
      uint64_t result = 0x6465726977;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static SFNWInterfaceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SFNWInterfaceType.hash(into:)()
{
  return sub_1A56D60C8();
}

uint64_t sub_1A56CB154(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBE4C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB190(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBE4C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB1CC(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBDF8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB208(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBDF8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A56CD264(a1, a2);
  *a3 = result;
  return result;
}

void sub_1A56CB270(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1A56CB27C(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBC00();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB2B8(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBC00();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB2F4(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBDA4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB330(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBDA4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB36C(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBD50();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB3A8(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBD50();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB3E4(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBCFC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB420(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBCFC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB45C(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBCA8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB498(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBCA8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A56CB4D4(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBC54();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A56CB510(uint64_t a1)
{
  unint64_t v2 = sub_1A56CBC54();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SFNWInterfaceType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676248);
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v45 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676250);
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v42 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676258);
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v39 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676260);
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v36 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676268);
  uint64_t v34 = *(void *)(v11 - 8);
  uint64_t v35 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v33 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676270);
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v32 = v13;
  MEMORY[0x1F4188790](v13);
  int v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676278);
  uint64_t v30 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  unsigned int v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676280);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v48 = v19;
  uint64_t v49 = v20;
  MEMORY[0x1F4188790](v19);
  char v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A56CBC00();
  sub_1A56D61D8();
  switch(v23)
  {
    case 1:
      char v51 = 1;
      sub_1A56CBDF8();
      uint64_t v26 = v48;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);
      goto LABEL_10;
    case 2:
      char v52 = 2;
      sub_1A56CBDA4();
      uint64_t v27 = v33;
      uint64_t v26 = v48;
      sub_1A56D5D98();
      uint64_t v29 = v34;
      uint64_t v28 = v35;
      goto LABEL_9;
    case 3:
      char v53 = 3;
      sub_1A56CBD50();
      uint64_t v27 = v36;
      uint64_t v26 = v48;
      sub_1A56D5D98();
      uint64_t v29 = v37;
      uint64_t v28 = v38;
      goto LABEL_9;
    case 4:
      char v54 = 4;
      sub_1A56CBCFC();
      uint64_t v27 = v39;
      uint64_t v26 = v48;
      sub_1A56D5D98();
      uint64_t v29 = v40;
      uint64_t v28 = v41;
      goto LABEL_9;
    case 5:
      char v55 = 5;
      sub_1A56CBCA8();
      uint64_t v27 = v42;
      uint64_t v26 = v48;
      sub_1A56D5D98();
      uint64_t v29 = v43;
      uint64_t v28 = v44;
      goto LABEL_9;
    case 6:
      char v56 = 6;
      sub_1A56CBC54();
      uint64_t v27 = v45;
      uint64_t v26 = v48;
      sub_1A56D5D98();
      uint64_t v29 = v46;
      uint64_t v28 = v47;
LABEL_9:
      (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v28);
LABEL_10:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v22, v26);
      break;
    default:
      char v50 = 0;
      sub_1A56CBE4C();
      uint64_t v24 = v48;
      sub_1A56D5D98();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v16);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v22, v24);
      break;
  }
  return result;
}

unint64_t sub_1A56CBC00()
{
  unint64_t result = qword_1E9676288;
  if (!qword_1E9676288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676288);
  }
  return result;
}

unint64_t sub_1A56CBC54()
{
  unint64_t result = qword_1E9676290;
  if (!qword_1E9676290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676290);
  }
  return result;
}

unint64_t sub_1A56CBCA8()
{
  unint64_t result = qword_1E9676298;
  if (!qword_1E9676298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676298);
  }
  return result;
}

unint64_t sub_1A56CBCFC()
{
  unint64_t result = qword_1E96762A0;
  if (!qword_1E96762A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96762A0);
  }
  return result;
}

unint64_t sub_1A56CBD50()
{
  unint64_t result = qword_1E96762A8;
  if (!qword_1E96762A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96762A8);
  }
  return result;
}

unint64_t sub_1A56CBDA4()
{
  unint64_t result = qword_1E96762B0;
  if (!qword_1E96762B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96762B0);
  }
  return result;
}

unint64_t sub_1A56CBDF8()
{
  unint64_t result = qword_1E96762B8;
  if (!qword_1E96762B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96762B8);
  }
  return result;
}

unint64_t sub_1A56CBE4C()
{
  unint64_t result = qword_1E96762C0;
  if (!qword_1E96762C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E96762C0);
  }
  return result;
}

uint64_t SFNWInterfaceType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762C8);
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v60 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762D0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  uint64_t v56 = v6;
  MEMORY[0x1F4188790](v5);
  uint64_t v63 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762D8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v53 = v8;
  uint64_t v54 = v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v62 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762E0);
  uint64_t v51 = *(void *)(v11 - 8);
  uint64_t v52 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v61 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762E8);
  uint64_t v49 = *(void *)(v13 - 8);
  uint64_t v50 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v59 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762F0);
  uint64_t v47 = *(void *)(v15 - 8);
  uint64_t v48 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96762F8);
  uint64_t v46 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9676300);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[3];
  uint64_t v65 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_1A56CBC00();
  uint64_t v26 = v66;
  sub_1A56D61A8();
  if (!v26)
  {
    uint64_t v44 = v20;
    uint64_t v43 = v18;
    uint64_t v45 = v17;
    uint64_t v28 = v61;
    uint64_t v27 = v62;
    uint64_t v29 = v63;
    uint64_t v30 = v64;
    uint64_t v66 = v22;
    uint64_t v31 = v24;
    uint64_t v32 = sub_1A56D5D78();
    if (*(void *)(v32 + 16) == 1)
    {
      char v33 = *(unsigned char *)(v32 + 32);
      switch(v33)
      {
        case 1:
          char v68 = 1;
          sub_1A56CBDF8();
          uint64_t v27 = v45;
          sub_1A56D5C88();
          uint64_t v40 = v47;
          uint64_t v39 = v48;
          goto LABEL_13;
        case 2:
          char v69 = 2;
          sub_1A56CBDA4();
          uint64_t v27 = v59;
          sub_1A56D5C88();
          uint64_t v40 = v49;
          uint64_t v39 = v50;
          goto LABEL_13;
        case 3:
          char v70 = 3;
          sub_1A56CBD50();
          uint64_t v27 = v28;
          sub_1A56D5C88();
          uint64_t v40 = v51;
          uint64_t v39 = v52;
          goto LABEL_13;
        case 4:
          char v71 = 4;
          sub_1A56CBCFC();
          sub_1A56D5C88();
          uint64_t v39 = v53;
          uint64_t v40 = v54;
          goto LABEL_13;
        case 5:
          char v72 = 5;
          sub_1A56CBCA8();
          sub_1A56D5C88();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v29, v55);
          break;
        case 6:
          char v73 = 6;
          sub_1A56CBC54();
          uint64_t v27 = v60;
          sub_1A56D5C88();
          uint64_t v40 = v57;
          uint64_t v39 = v58;
LABEL_13:
          (*(void (**)(char *, uint64_t))(v40 + 8))(v27, v39);
          break;
        default:
          char v67 = 0;
          sub_1A56CBE4C();
          uint64_t v34 = v44;
          sub_1A56D5C88();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v43);
          break;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v31, v21);
      unsigned char *v30 = v33;
    }
    else
    {
      uint64_t v35 = sub_1A56D5A78();
      swift_allocError();
      uint64_t v36 = v21;
      uint64_t v38 = v37;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E96704F0);
      *uint64_t v38 = &type metadata for SFNWInterfaceType;
      sub_1A56D5C98();
      sub_1A56D5A68();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v38, *MEMORY[0x1E4FBBA70], v35);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v24, v36);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v65);
}

uint64_t sub_1A56CC6D4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SFNWInterfaceType.init(from:)(a1, a2);
}

uint64_t sub_1A56CC6EC(void *a1)
{
  return SFNWInterfaceType.encode(to:)(a1);
}

uint64_t sub_1A56CC704()
{
  uint64_t result = 1818523489;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x72616C756C6C6563;
      break;
    case 2:
      uint64_t result = 0x6957746365726964;
      break;
    case 3:
      uint64_t result = 0x4669576C61636F6CLL;
      break;
    case 4:
      uint64_t result = 0x726568746FLL;
      break;
    case 5:
      uint64_t result = 1768319351;
      break;
    case 6:
      uint64_t result = 0x6465726977;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SFNWInterfaceTypeCategory.description.getter()
{
  uint64_t v1 = 0x6465726977;
  if (*v0 != 1) {
    uint64_t v1 = 0x72616C75676572;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x72616C756C6C6563;
  }
}

uint64_t sub_1A56CC834()
{
  uint64_t v1 = 0x6465726977;
  if (*v0 != 1) {
    uint64_t v1 = 0x72616C75676572;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x72616C756C6C6563;
  }
}

Sharing::SFNWInterfaceTypeCategory __swiftcall SFNWInterfaceType.category()()
{
  unint64_t v2 = *v1;
  if (v2 >= 7) {
    char v3 = 2;
  }
  else {
    char v3 = 0x1020202010002uLL >> (8 * v2);
  }
  *uint64_t v0 = v3;
  return result;
}

unint64_t sub_1A56CC8C0()
{
  unint64_t result = qword_1E9676308;
  if (!qword_1E9676308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676308);
  }
  return result;
}

unint64_t sub_1A56CC918()
{
  unint64_t result = qword_1E9676310;
  if (!qword_1E9676310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676310);
  }
  return result;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType()
{
  return &type metadata for SFNWInterfaceType;
}

unsigned char *storeEnumTagSinglePayload for SFNWInterfaceTypeCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A56CCA50);
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

ValueMetadata *type metadata accessor for SFNWInterfaceTypeCategory()
{
  return &type metadata for SFNWInterfaceTypeCategory;
}

uint64_t _s7Sharing17SFNWInterfaceTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7Sharing17SFNWInterfaceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1A56CCBE4);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.CodingKeys()
{
  return &type metadata for SFNWInterfaceType.CodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.AwdlCodingKeys()
{
  return &type metadata for SFNWInterfaceType.AwdlCodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.CellularCodingKeys()
{
  return &type metadata for SFNWInterfaceType.CellularCodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.DirectWiredCodingKeys()
{
  return &type metadata for SFNWInterfaceType.DirectWiredCodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.LocalWiFiCodingKeys()
{
  return &type metadata for SFNWInterfaceType.LocalWiFiCodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.OtherCodingKeys()
{
  return &type metadata for SFNWInterfaceType.OtherCodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.WifiCodingKeys()
{
  return &type metadata for SFNWInterfaceType.WifiCodingKeys;
}

ValueMetadata *type metadata accessor for SFNWInterfaceType.WiredCodingKeys()
{
  return &type metadata for SFNWInterfaceType.WiredCodingKeys;
}

unint64_t sub_1A56CCC90()
{
  unint64_t result = qword_1E9676318;
  if (!qword_1E9676318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676318);
  }
  return result;
}

unint64_t sub_1A56CCCE8()
{
  unint64_t result = qword_1E9676320;
  if (!qword_1E9676320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676320);
  }
  return result;
}

unint64_t sub_1A56CCD40()
{
  unint64_t result = qword_1E9676328;
  if (!qword_1E9676328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676328);
  }
  return result;
}

unint64_t sub_1A56CCD98()
{
  unint64_t result = qword_1E9676330;
  if (!qword_1E9676330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676330);
  }
  return result;
}

unint64_t sub_1A56CCDF0()
{
  unint64_t result = qword_1E9676338;
  if (!qword_1E9676338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676338);
  }
  return result;
}

unint64_t sub_1A56CCE48()
{
  unint64_t result = qword_1E9676340;
  if (!qword_1E9676340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676340);
  }
  return result;
}

unint64_t sub_1A56CCEA0()
{
  unint64_t result = qword_1E9676348;
  if (!qword_1E9676348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676348);
  }
  return result;
}

unint64_t sub_1A56CCEF8()
{
  unint64_t result = qword_1E9676350;
  if (!qword_1E9676350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676350);
  }
  return result;
}

unint64_t sub_1A56CCF50()
{
  unint64_t result = qword_1E9676358;
  if (!qword_1E9676358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676358);
  }
  return result;
}

unint64_t sub_1A56CCFA8()
{
  unint64_t result = qword_1E9676360;
  if (!qword_1E9676360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676360);
  }
  return result;
}

unint64_t sub_1A56CD000()
{
  unint64_t result = qword_1E9676368;
  if (!qword_1E9676368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676368);
  }
  return result;
}

unint64_t sub_1A56CD058()
{
  unint64_t result = qword_1E9676370;
  if (!qword_1E9676370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676370);
  }
  return result;
}

unint64_t sub_1A56CD0B0()
{
  unint64_t result = qword_1E9676378;
  if (!qword_1E9676378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676378);
  }
  return result;
}

unint64_t sub_1A56CD108()
{
  unint64_t result = qword_1E9676380;
  if (!qword_1E9676380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676380);
  }
  return result;
}

unint64_t sub_1A56CD160()
{
  unint64_t result = qword_1E9676388;
  if (!qword_1E9676388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676388);
  }
  return result;
}

unint64_t sub_1A56CD1B8()
{
  unint64_t result = qword_1E9676390;
  if (!qword_1E9676390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676390);
  }
  return result;
}

unint64_t sub_1A56CD210()
{
  unint64_t result = qword_1E9676398;
  if (!qword_1E9676398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9676398);
  }
  return result;
}

uint64_t sub_1A56CD264(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1818523489 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72616C756C6C6563 && a2 == 0xE800000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6957746365726964 && a2 == 0xEB00000000646572 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4669576C61636F6CLL && a2 == 0xE900000000000069 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726568746FLL && a2 == 0xE500000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1768319351 && a2 == 0xE400000000000000 || (sub_1A56D5F28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6465726977 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_1A56D5F28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_1A56CD548()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void SFBrowserCreate_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserCreate (alloc = %p, kind = %@)");
}

void SFBrowserSetDispatchQueue_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserSetDispatchQueue (browser = %p, queue = %p)", v2, v3);
}

void SFBrowserSetMode_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1A5389000, v1, OS_LOG_TYPE_DEBUG, "SFBrowserSetMode (browser = %p, mode = %d)", v2, 0x12u);
}

void SFBrowserSetOptions_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserSetOptions (browser = %p, mode = %p)", v2, v3);
}

void SFBrowserScheduleWithRunLoop_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFBrowserScheduleWithRunLoop is unimplemented.  Use SFBrowserSetDispatchQueue instead.", v2, v3, v4, v5, v6);
}

void SFBrowserGetRootNode_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "SFBrowserGetRootNode (browser = %p)", v2, v3, v4, v5, v6);
}

void SFBrowserCopyChildren_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void SFBrowserCopyChildren_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserCopyChildren (browser = %p, node = %p)", v2, v3);
}

void SFBrowserCopySidebarChildren_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "SFBrowserCopySidebarChildren (browser = %p)", v2, v3, v4, v5, v6);
}

void SFBrowserOpenNode_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserOpenNode (browser = %p, node = %p)", v2, v3);
}

void SFBrowserAddNode_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserAddNode (browser = %p, node = %p)", v2, v3);
}

void SFBrowserRemoveNode_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserRemoveNode (browser = %p, node = %p)", v2, v3);
}

void SFBrowserCloseNode_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserCloseNode (browser = %p, node = %p)", v2, v3);
}

void SFBrowserInvalidate_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "SFBrowserInvalidate (browser = %p)", v2, v3, v4, v5, v6);
}

void SFBrowserCopyNodeForURL_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFBrowserCopyNodeForURL invalid scheme", v2, v3, v4, v5, v6);
}

void SFBrowserCopyNodeForURL_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFBrowserCopyNodeForURL hostPart is NULL", v2, v3, v4, v5, v6);
}

void SFBrowserCopyNodeForURL_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFBrowserCopyNodeForURL namePart is NULL", v2, v3, v4, v5, v6);
}

void SFBrowserCopyNodeForURL_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFBrowserCopyNodeForURL unrecognized URL host prefix", v2, v3, v4, v5, v6);
}

void SFBrowserCopyNodeForURL_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFBrowserCopyNodeForURL (browser = %p, nodeURL = %p)", v2, v3);
}

void _SFNodeCreateWithXPCObject_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFDictionaryForKey result is not a dictionary", v2, v3, v4, v5, v6);
}

void _SFNodeCreateWithXPCObject_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFDictionaryForKey xpcNode is not a dictionary", v2, v3, v4, v5, v6);
}

void xpcDictionaryCopyCFStringForKey()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFStringForKey result is not a string", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFStringForKey xpcNode is not a dictionary", v2, v3, v4, v5, v6);
}

void xpcDictionaryCopyCFArrayForKey()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFArrayForKey result is not a array", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFArrayForKey xpcNode is not a dictionary", v2, v3, v4, v5, v6);
}

void xpcDictionaryCopyCFDataForKey()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFDataForKey result is not a data", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFDataForKey xpcNode is not a dictionary", v2, v3, v4, v5, v6);
}

void xpcDictionaryCopyCFNumberForKey()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFNumberForKey result is not a number", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFNumberForKey xpcNode is not a dictionary", v2, v3, v4, v5, v6);
}

void xpcDictionaryCopyCFURLForKey()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFURLForKey result is not a url", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "xpcDictionaryCopyCFURLForKey xpcNode is not a dictionary", v2, v3, v4, v5, v6);
}

void __getCKContainerIDClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKContainerIDClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationCloudSharingMailRequest.m", 20, @"Unable to find class %s", "CKContainerID");

  __break(1u);
}

void CloudKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationCloudSharingMailRequest.m", 18, @"%s", *a1);

  __break(1u);
}

void __getCKShareClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKShareClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationCloudSharingMailRequest.m", 21, @"Unable to find class %s", "CKShare");

  __break(1u);
}

void __getCKContainerSetupInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKContainerSetupInfoClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationCloudSharingMailRequest.m", 19, @"Unable to find class %s", "CKContainerSetupInfo");

  __break(1u);
}

void SFOperationCreate_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFOperationCreate (alloc = %p, kind = %@)");
}

void _SFOperationCreateInternal_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "SFOperationCreate (kind = %@)", v2, v3, v4, v5, v6);
}

void SFOperationSetDispatchQueue_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFOperationSetDispatchQueue (%@, queue = %p)");
}

void SFOperationCopyProperty_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1A5389000, v0, v1, "SFOperationCopyProperty (%@, name = %@)");
}

void SFOperationResume_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "SFOperationResume (%@)", v2, v3, v4, v5, v6);
}

void SFOperationCancel_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1A5389000, v0, v1, "SFOperationCancel (%@)", v2, v3, v4, v5, v6);
}

void _SFOperationAddSandboxExtensionForFileURL_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "CFURLCopyFileSystemPath failed for file \"%@\"", v1, 0xCu);
}

void _SFOperationAddSandboxExtensionForFileURL_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "CFStringGetCString failed for file \"%@\"", v1, 0xCu);
}

void _SFOperationAddSandboxExtensionForFileURL_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "sandbox_extension_issue_file failed for file \"%s\" with error %d", (uint8_t *)&v5, 0x12u);
}

void createURL_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "createURL: CFURLSetResourcePropertyForKey %@", (uint8_t *)&v3, 0xCu);
}

void createCGImageWithURL_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithData: CGImageSourceCreateWithURL returned NULL", v2, v3, v4, v5, v6);
}

void createCGImageWithURL_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithURL: CGImageSourceGetCount returned zero", v2, v3, v4, v5, v6);
}

void createCGImageWithDataInternal_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataInternal: CGImageSourceCreateWithData returned NULL", v2, v3, v4, v5, v6);
}

void createCGImageWithDataInternal_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataInternal: CGImageSourceGetCount returned zero", v2, v3, v4, v5, v6);
}

void createCGImageWithDataInternal_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataInternal: CGImageSourceGetType image format invalid", v2, v3, v4, v5, v6);
}

void createCGImageWithDataInternal_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataInternal: CGImageSourceCreateImageAtIndex (requireJPEG2000) returned NULL", v2, v3, v4, v5, v6);
}

void createCGImageWithDataInternal_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataInternal: CGImageSourceCreateImageAtIndex returned NULL", v2, v3, v4, v5, v6);
}

void createCGImageWithDataOrURL_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataOrURL: CGImageSourceCreate returned NULL", v2, v3, v4, v5, v6);
}

void createCGImageWithDataOrURL_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createCGImageWithDataOrURL: CGImageSourceGetCount returned zero", v2, v3, v4, v5, v6);
}

void copyImageData_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "copyImageData: CGImageDestinationCreateWithData returned NULL", v2, v3, v4, v5, v6);
}

void copyImageData_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "copyImageData: CGImageDestinationFinalize failed", v2, v3, v4, v5, v6);
}

void createImageDataWithSize_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createImageDataWithSize: CGColorSpaceCreateDeviceRGB returned NULL", v2, v3, v4, v5, v6);
}

void createImageDataWithSize_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createImageDataWithSize: CGImageCreateCopyWithColorSpace returned NULL", v2, v3, v4, v5, v6);
}

void createImageDataWithSize_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "createImageDataWithSize: CGImageCreateThumb returned NULL", v2, v3, v4, v5, v6);
}

void SFIsBluetoothEnabled_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Bluetooth controller failed to fetch controller info with error: %@", v2, v3, v4, v5, v6);
}

void SFCreateLivePhotoBundle_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  OUTLINED_FUNCTION_5();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1A5389000, a3, OS_LOG_TYPE_ERROR, "Failed write live photo bundle to %@ (%@)", v6, 0x16u);
}

void SFIsiCloudFamilyLink_cold_1(void *a1)
{
  uint64_t v1 = [a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A5389000, v2, v3, "Overridden URL scheme %@", v4, v5, v6, v7, v8);
}

void SFIsiCloudFamilyLink_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1A5389000, a3, OS_LOG_TYPE_DEBUG, "Failed to create appLink for URL - %@ with error - %@", (uint8_t *)&v6, 0x16u);
}

void SFIsiCloudFamilyLink_cold_3(void *a1)
{
  uint64_t v1 = [a1 targetApplicationProxy];
  uint64_t v2 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A5389000, v3, v4, "Applink created with bundleID %@", v5, v6, v7, v8, v9);
}

void SFEncryptData_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### SecKeyCreateEncryptedData failed", v2, v3, v4, v5, v6);
}

void SFSharablePasswordForAirDropURL_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### No hexString in URL?", v2, v3, v4, v5, v6);
}

void SFSharablePasswordForAirDropURL_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Failed to grab credential data", v2, v3, v4, v5, v6);
}

void SFSharablePasswordForAirDropURL_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Failed to deserialize credential data", v2, v3, v4, v5, v6);
}

void SFDecryptData_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### SFDecryptData failed: no data", v2, v3, v4, v5, v6);
}

void SFDecryptData_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### SFDecryptData failed: no private key", v2, v3, v4, v5, v6);
}

void SFDecryptData_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### SFDecryptData failed: SecKeyCreateDecryptedData failed", v2, v3, v4, v5, v6);
}

void SFFullTextFromRTIDataPayload_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Failed to create RTI input system data payload", v2, v3, v4, v5, v6);
}

void SFFullTextFromRTIDataPayload_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Failed to get TI Document State", v2, v3, v4, v5, v6);
}

void SFMinorWatchHardwareVersion_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Can not query Watch's minor hardware version!", v2, v3, v4, v5, v6);
}

void SFRemoteDeviceCanConnectOn5GHz_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Can not query Watch's major hardware version!", v2, v3, v4, v5, v6);
}

void SFRemoteTextInputPayloadFromLegacyAPI_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Failed to convert legacy API -> RTI payload", v2, v3, v4, v5, v6);
}

void SFRemoteTextInputPayloadFromLegacyAPI_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "### Unrecognized opCode: %d", (uint8_t *)v2, 8u);
}

void SFRemoteTextInputPayloadFromLegacyAPI_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Insert text without string?", v2, v3, v4, v5, v6);
}

void SFRemoteTextInputPayloadFromLegacyAPI_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Set text without string?", v2, v3, v4, v5, v6);
}

void SFRemoteTextInputPayloadFromLegacyAPI_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Text did change without string?", v2, v3, v4, v5, v6);
}

void SFRemoteTextInputPayloadToLegacyAPI_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "### Failed to convert RTI payload -> legacy API", v2, v3, v4, v5, v6);
}

void SFRTIDataPayloadForData_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "### Error getting RTIDataPayload from data: %@", v2, v3, v4, v5, v6);
}

void SFAirDropDownloadsURL_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "SFDownloadsURL: failed to get Downloads directory with error %@", v2, v3, v4, v5, v6);
}

void SFRealpathForFileURL_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "SFRealpathForFileURL: failed to get file system representation for %@", v2, v3, v4, v5, v6);
}

void SFRealpathForFileURL_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFRealpathForFileURL: failed to get file system representation", v2, v3, v4, v5, v6);
}

void SFRealpathForFileURL_cold_3(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_fault_impl(&dword_1A5389000, log, OS_LOG_TYPE_FAULT, "SFRealpathForFileURL: realpath for %s failed: %d", buf, 0x12u);
}

void SFRealpathForFileURL_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "SFRealpathForFileURL: paramater is not a file URL. (%@)", v2, v3, v4, v5, v6);
}

void SFCreateThumbnailForAirDropItem_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "SFCreateThumbnailForAirDropItem failed to generate icon", v2, v3, v4, v5, v6);
}

void SFCreateThumbnailForAirDropItem_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Thumbnail generation timed out!", v2, v3, v4, v5, v6);
}

void __SFCreateThumbnailForAirDropItem_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFAirDropModelImageNameFromModelString_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "No icon data for model: %@", v2, v3, v4, v5, v6);
}

void __getSLCollaborationFooterViewModelClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SocialLayerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationItem.m", 32, @"%s", *a1);

  __break(1u);
}

void __getSLCollaborationFooterViewModelClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSLCollaborationFooterViewModelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationItem.m", 33, @"Unable to find class %s", "SLCollaborationFooterViewModel");

  __break(1u);
}

void SharedWithYouCoreLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SharedWithYouCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationUtilities.m", 119, @"%s", *a1);

  __break(1u);
}

void get_CKCloudKitPreShareType_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *get_CKCloudKitPreShareType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 74, @"%s", dlerror());

  __break(1u);
}

void get_CKCloudKitPostShareType_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *get_CKCloudKitPostShareType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 75, @"%s", dlerror());

  __break(1u);
}

void soft_CKSharingAccessTypeFromOptionsGroups_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CKShareParticipantPermission soft_CKSharingAccessTypeFromOptionsGroups(NSArray<_SWCollaborationOptionsGroup *> *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 83, @"%s", dlerror());

  __break(1u);
}

void getCKShareTitleKey_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCKShareTitleKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 101, @"%s", dlerror());

  __break(1u);
}

void get_SWPendingCollaborationTypeIdentifier_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *get_SWPendingCollaborationTypeIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 123, @"%s", dlerror());

  __break(1u);
}

void getUTCollaborationOptionsTypeIdentifier_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getUTCollaborationOptionsTypeIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 124, @"%s", dlerror());

  __break(1u);
}

void getCKErrorDomain_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCKErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 77, @"%s", dlerror());

  __break(1u);
}

void __getFPItemManagerClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFPItemManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 53, @"Unable to find class %s", "FPItemManager");

  __break(1u);
}

void FileProviderLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FileProviderLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationUtilities.m", 52, @"%s", *a1);

  __break(1u);
}

void CloudKitLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationUtilities.m", 72, @"%s", *a1);

  __break(1u);
}

void __getCKAllowedSharingOptionsClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKAllowedSharingOptionsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 82, @"Unable to find class %s", "CKAllowedSharingOptions");

  __break(1u);
}

void __getCloudSharingClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudSharingLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationUtilities.m", 44, @"%s", *a1);

  __break(1u);
}

void __getCloudSharingClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCloudSharingClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 45, @"Unable to find class %s", "CloudSharing");

  __break(1u);
}

void __getCKPostSharingContextClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKPostSharingContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 100, @"Unable to find class %s", "CKPostSharingContext");

  __break(1u);
}

void __getCKPreSharingContextClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKPreSharingContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 99, @"Unable to find class %s", "CKPreSharingContext");

  __break(1u);
}

void __getCKContainerSetupInfoClass_block_invoke_cold_1_0()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKContainerSetupInfoClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 80, @"Unable to find class %s", "CKContainerSetupInfo");

  __break(1u);
}

void __getLPiCloudSharingMetadataClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLPiCloudSharingMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 108, @"Unable to find class %s", "LPiCloudSharingMetadata");

  __break(1u);
}

void LinkPresentationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *LinkPresentationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationUtilities.m", 107, @"%s", *a1);

  __break(1u);
}

void __getLPImageClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLPImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 109, @"Unable to find class %s", "LPImage");

  __break(1u);
}

void __getLPSharedObjectMetadataClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLPSharedObjectMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 111, @"Unable to find class %s", "LPSharedObjectMetadata");

  __break(1u);
}

void __getLPLinkMetadataClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLPLinkMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 110, @"Unable to find class %s", "LPLinkMetadata");

  __break(1u);
}

void __getFPProviderDomainClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFPProviderDomainClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 54, @"Unable to find class %s", "FPProviderDomain");

  __break(1u);
}

void __getCNContactClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNContactClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFPeopleSuggestion.m", 18, @"Unable to find class %s", "CNContact");

  __break(1u);
}

void ContactsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ContactsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFPeopleSuggestion.m", 17, @"%s", *a1);

  __break(1u);
}

void __getCNMutableContactClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNMutableContactClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFPeopleSuggestion.m", 19, @"Unable to find class %s", "CNMutableContact");

  __break(1u);
}

void __getINImageClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *IntentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFPeopleSuggestion.m", 21, @"%s", *a1);

  __break(1u);
}

void __getINImageClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFPeopleSuggestion.m", 22, @"Unable to find class %s", "INImage");

  __break(1u);
}

void __getCKShareClass_block_invoke_cold_1_0()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKShareClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationCloudSharingRequest.m", 23, @"Unable to find class %s", "CKShare");

  __break(1u);
}

void CloudKitLibrary_cold_1_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFCollaborationCloudSharingRequest.m", 20, @"%s", *a1);

  __break(1u);
}

void __getCKContainerSetupInfoClass_block_invoke_cold_1_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKContainerSetupInfoClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationCloudSharingRequest.m", 21, @"Unable to find class %s", "CKContainerSetupInfo");

  __break(1u);
}

uint64_t sub_1A56D4818()
{
  return MEMORY[0x1F40E2D20]();
}

uint64_t sub_1A56D4828()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_1A56D4838()
{
  return MEMORY[0x1F40E2FC8]();
}

uint64_t sub_1A56D4848()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1A56D4858()
{
  return MEMORY[0x1F40E3040]();
}

uint64_t sub_1A56D4868()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1A56D4878()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1A56D4888()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1A56D4898()
{
  return MEMORY[0x1F40E3130]();
}

uint64_t sub_1A56D48A8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1A56D48B8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1A56D48C8()
{
  return MEMORY[0x1F40E3600]();
}

uint64_t sub_1A56D48D8()
{
  return MEMORY[0x1F40E3640]();
}

uint64_t sub_1A56D48E8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A56D48F8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A56D4908()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A56D4918()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1A56D4928()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1A56D4938()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1A56D4948()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A56D4958()
{
  return MEMORY[0x1F40E4640]();
}

uint64_t sub_1A56D4968()
{
  return MEMORY[0x1F40E4650]();
}

uint64_t sub_1A56D4978()
{
  return MEMORY[0x1F40E47F0]();
}

uint64_t sub_1A56D4988()
{
  return MEMORY[0x1F40E4810]();
}

uint64_t sub_1A56D4998()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1A56D49A8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1A56D49B8()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1A56D49C8()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1A56D49D8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A56D49E8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1A56D49F8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A56D4A08()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1A56D4A18()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1A56D4A28()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A56D4A38()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1A56D4A48()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1A56D4A58()
{
  return MEMORY[0x1F40E4CF8]();
}

uint64_t sub_1A56D4A68()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1A56D4A78()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A56D4A88()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1A56D4A98()
{
  return MEMORY[0x1F40E4F10]();
}

uint64_t sub_1A56D4AA8()
{
  return MEMORY[0x1F40E4F18]();
}

uint64_t sub_1A56D4AB8()
{
  return MEMORY[0x1F40E4F30]();
}

uint64_t sub_1A56D4AC8()
{
  return MEMORY[0x1F40E4F38]();
}

uint64_t sub_1A56D4AD8()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1A56D4AE8()
{
  return MEMORY[0x1F40E5148]();
}

uint64_t sub_1A56D4AF8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A56D4B08()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1A56D4B18()
{
  return MEMORY[0x1F40E5200]();
}

uint64_t sub_1A56D4B28()
{
  return MEMORY[0x1F40E5220]();
}

uint64_t sub_1A56D4B38()
{
  return MEMORY[0x1F40E5228]();
}

uint64_t sub_1A56D4B48()
{
  return MEMORY[0x1F40E5238]();
}

uint64_t sub_1A56D4B58()
{
  return MEMORY[0x1F40E5240]();
}

uint64_t sub_1A56D4B68()
{
  return MEMORY[0x1F40E5248]();
}

uint64_t sub_1A56D4B78()
{
  return MEMORY[0x1F40E5250]();
}

uint64_t sub_1A56D4B88()
{
  return MEMORY[0x1F40E5258]();
}

uint64_t sub_1A56D4B98()
{
  return MEMORY[0x1F40E5268]();
}

uint64_t sub_1A56D4BA8()
{
  return MEMORY[0x1F40E5270]();
}

uint64_t sub_1A56D4BB8()
{
  return MEMORY[0x1F40E5288]();
}

uint64_t sub_1A56D4BC8()
{
  return MEMORY[0x1F40E5298]();
}

uint64_t sub_1A56D4BD8()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1A56D4BE8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A56D4BF8()
{
  return MEMORY[0x1F40E5348]();
}

uint64_t sub_1A56D4C08()
{
  return MEMORY[0x1F40E5358]();
}

uint64_t sub_1A56D4C18()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A56D4C28()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A56D4C38()
{
  return MEMORY[0x1F40E5390]();
}

uint64_t sub_1A56D4C48()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t _s7Sharing9SFAirDropO18TransferIdentifierV11stringValueSSvg_0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A56D4C68()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t _s7Sharing9SFAirDropO17PermissionRequestV18InterventionActionV2eeoiySbAGy_x_G_AItFZ_0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1A56D4C88()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1A56D4C98()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1A56D4CA8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A56D4CB8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A56D4CC8()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1A56D4CD8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1A56D4CE8()
{
  return MEMORY[0x1F40E59F8]();
}

uint64_t sub_1A56D4CF8()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1A56D4D08()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1A56D4D18()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1A56D4D28()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1A56D4D38()
{
  return MEMORY[0x1F4187850]();
}

uint64_t sub_1A56D4D48()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1A56D4D58()
{
  return MEMORY[0x1F4187938]();
}

uint64_t sub_1A56D4D68()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1A56D4D78()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A56D4D88()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A56D4D98()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A56D4DA8()
{
  return MEMORY[0x1F4187A90]();
}

uint64_t sub_1A56D4DB8()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1A56D4DC8()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t sub_1A56D4DE8()
{
  return MEMORY[0x1F40D69A0]();
}

uint64_t sub_1A56D4DF8()
{
  return MEMORY[0x1F40D69A8]();
}

uint64_t sub_1A56D4E08()
{
  return MEMORY[0x1F40D6A30]();
}

uint64_t sub_1A56D4E18()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1A56D4E28()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1A56D4E38()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1A56D4E48()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1A56D4E58()
{
  return MEMORY[0x1F40D6A70]();
}

uint64_t sub_1A56D4E68()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1A56D4E78()
{
  return MEMORY[0x1F40D6A88]();
}

uint64_t sub_1A56D4E98()
{
  return MEMORY[0x1F40D6A98]();
}

uint64_t sub_1A56D4EA8()
{
  return MEMORY[0x1F40D6AA0]();
}

uint64_t sub_1A56D4EB8()
{
  return MEMORY[0x1F40D6D38]();
}

uint64_t sub_1A56D4EC8()
{
  return MEMORY[0x1F40D6E30]();
}

uint64_t sub_1A56D4ED8()
{
  return MEMORY[0x1F40F1EF0]();
}

uint64_t sub_1A56D4EE8()
{
  return MEMORY[0x1F40F2058]();
}

uint64_t sub_1A56D4EF8()
{
  return MEMORY[0x1F40F2060]();
}

uint64_t sub_1A56D4F08()
{
  return MEMORY[0x1F40F22F8]();
}

uint64_t sub_1A56D4F18()
{
  return MEMORY[0x1F40F2330]();
}

uint64_t sub_1A56D4F28()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A56D4F38()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A56D4F48()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1A56D4F58()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1A56D4F68()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1A56D4F78()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A56D4F88()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1A56D4F98()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1A56D4FA8()
{
  return MEMORY[0x1F40E5FE0]();
}

uint64_t sub_1A56D4FB8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A56D4FC8()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1A56D4FD8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A56D4FE8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A56D4FF8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A56D5008()
{
  return MEMORY[0x1F41836F8]();
}

uint64_t sub_1A56D5018()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A56D5028()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1A56D5038()
{
  return MEMORY[0x1F41837A8]();
}

uint64_t sub_1A56D5048()
{
  return MEMORY[0x1F41837C0]();
}

uint64_t sub_1A56D5058()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A56D5068()
{
  return MEMORY[0x1F4183850]();
}

uint64_t sub_1A56D5078()
{
  return MEMORY[0x1F4183870]();
}

uint64_t sub_1A56D5088()
{
  return MEMORY[0x1F40E6068]();
}

uint64_t sub_1A56D5098()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A56D50A8()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1A56D50B8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1A56D50C8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A56D50D8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A56D50E8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A56D50F8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1A56D5108()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1A56D5118()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A56D5128()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1A56D5138()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1A56D5148()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A56D5158()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1A56D5168()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1A56D5178()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1A56D5188()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A56D5198()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1A56D51A8()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1A56D51B8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1A56D51C8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A56D51D8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A56D51E8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1A56D51F8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A56D5218()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1A56D5228()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A56D5238()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1A56D5248()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_1A56D5258()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1A56D5268()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A56D5278()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A56D5288()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1A56D5298()
{
  return MEMORY[0x1F4183BB0]();
}

uint64_t sub_1A56D52A8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1A56D52B8()
{
  return MEMORY[0x1F4183BD0]();
}

uint64_t sub_1A56D52C8()
{
  return MEMORY[0x1F4183CD0]();
}

uint64_t sub_1A56D52D8()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1A56D52E8()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1A56D52F8()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1A56D5308()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A56D5318()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1A56D5328()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A56D5338()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1A56D5348()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A56D5358()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A56D5368()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A56D5378()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A56D5388()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1A56D5398()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A56D53A8()
{
  return MEMORY[0x1F4183F10]();
}

uint64_t sub_1A56D53B8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A56D53C8()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1A56D53D8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A56D53E8()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1A56D53F8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A56D5408()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1A56D5418()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A56D5428()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1A56D5438()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1A56D5468()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A56D5478()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A56D5488()
{
  return MEMORY[0x1F4187D10]();
}

uint64_t sub_1A56D5498()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1A56D54A8()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t sub_1A56D54B8()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1A56D54C8()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1A56D54D8()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1A56D54E8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1A56D5508()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1A56D5528()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1A56D5538()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1A56D5548()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1A56D5558()
{
  return MEMORY[0x1F4187E00]();
}

uint64_t sub_1A56D5578()
{
  return MEMORY[0x1F4187E40]();
}

uint64_t sub_1A56D5588()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1A56D5598()
{
  return MEMORY[0x1F4187E60]();
}

uint64_t sub_1A56D55A8()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1A56D55B8()
{
  return MEMORY[0x1F4187E70]();
}

uint64_t sub_1A56D55C8()
{
  return MEMORY[0x1F4187E98]();
}

uint64_t sub_1A56D55D8()
{
  return MEMORY[0x1F4187EA0]();
}

uint64_t sub_1A56D55E8()
{
  return MEMORY[0x1F4187EB0]();
}

uint64_t sub_1A56D55F8()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1A56D5608()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1A56D5618()
{
  return MEMORY[0x1F4187EC8]();
}

uint64_t sub_1A56D5628()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1A56D5648()
{
  return MEMORY[0x1F4187EE8]();
}

uint64_t sub_1A56D5658()
{
  return MEMORY[0x1F4187EF8]();
}

uint64_t sub_1A56D5668()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1A56D5678()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1A56D5688()
{
  return MEMORY[0x1F40E6440]();
}

uint64_t sub_1A56D5698()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A56D56A8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A56D56B8()
{
  return MEMORY[0x1F4184310]();
}

uint64_t sub_1A56D56C8()
{
  return MEMORY[0x1F4184320]();
}

uint64_t sub_1A56D56D8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A56D56E8()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1A56D5708()
{
  return MEMORY[0x1F4184390]();
}

uint64_t sub_1A56D5718()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A56D5728()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1A56D5738()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A56D5748()
{
  return MEMORY[0x1F4184400]();
}

uint64_t sub_1A56D5758()
{
  return MEMORY[0x1F4184418]();
}

uint64_t sub_1A56D5768()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A56D5778()
{
  return MEMORY[0x1F4184580]();
}

uint64_t sub_1A56D5788()
{
  return MEMORY[0x1F40E64D0]();
}

uint64_t sub_1A56D5798()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1A56D57A8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1A56D57B8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A56D57C8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A56D57D8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A56D57E8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A56D57F8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A56D5808()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1A56D5818()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A56D5828()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A56D5838()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_1A56D5848()
{
  return MEMORY[0x1F41845E0]();
}

uint64_t sub_1A56D5858()
{
  return MEMORY[0x1F41845E8]();
}

uint64_t sub_1A56D5868()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1A56D5878()
{
  return MEMORY[0x1F4184600]();
}

uint64_t sub_1A56D5888()
{
  return MEMORY[0x1F4184608]();
}

uint64_t sub_1A56D5898()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A56D58A8()
{
  return MEMORY[0x1F4184680]();
}

uint64_t sub_1A56D58B8()
{
  return MEMORY[0x1F4184688]();
}

uint64_t sub_1A56D58C8()
{
  return MEMORY[0x1F4184698]();
}

uint64_t sub_1A56D58D8()
{
  return MEMORY[0x1F41846B0]();
}

uint64_t sub_1A56D58E8()
{
  return MEMORY[0x1F41846B8]();
}

uint64_t sub_1A56D58F8()
{
  return MEMORY[0x1F41846C0]();
}

uint64_t sub_1A56D5908()
{
  return MEMORY[0x1F41846C8]();
}

uint64_t sub_1A56D5918()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A56D5928()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A56D5938()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A56D5948()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1A56D5958()
{
  return MEMORY[0x1F40E6D48]();
}

uint64_t sub_1A56D5968()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A56D5978()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1A56D5988()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1A56D59A8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A56D59B8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A56D59C8()
{
  return MEMORY[0x1F4184BF8]();
}

uint64_t sub_1A56D59D8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A56D59E8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A56D59F8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A56D5A08()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A56D5A18()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1A56D5A28()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A56D5A38()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A56D5A48()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1A56D5A58()
{
  return MEMORY[0x1F4184D58]();
}

uint64_t sub_1A56D5A68()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A56D5A78()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A56D5A88()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1A56D5A98()
{
  return MEMORY[0x1F4184E30]();
}

uint64_t sub_1A56D5AA8()
{
  return MEMORY[0x1F4184E40]();
}

uint64_t sub_1A56D5AB8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A56D5AC8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A56D5AD8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A56D5AE8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A56D5AF8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A56D5B08()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1A56D5B18()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1A56D5B28()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1A56D5B38()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1A56D5B48()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A56D5B58()
{
  return MEMORY[0x1F4187FF8]();
}

uint64_t sub_1A56D5B68()
{
  return MEMORY[0x1F4185058]();
}

uint64_t sub_1A56D5B78()
{
  return MEMORY[0x1F4185070]();
}

uint64_t sub_1A56D5B88()
{
  return MEMORY[0x1F4185078]();
}

uint64_t sub_1A56D5B98()
{
  return MEMORY[0x1F41850B0]();
}

uint64_t sub_1A56D5BA8()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1A56D5BB8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A56D5BC8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A56D5BD8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A56D5BE8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A56D5BF8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A56D5C08()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A56D5C18()
{
  return MEMORY[0x1F4185428]();
}

uint64_t sub_1A56D5C28()
{
  return MEMORY[0x1F4185430]();
}

uint64_t sub_1A56D5C38()
{
  return MEMORY[0x1F4185438]();
}

uint64_t sub_1A56D5C58()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1A56D5C68()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A56D5C88()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A56D5C98()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A56D5CA8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A56D5CB8()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1A56D5CC8()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1A56D5CD8()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1A56D5CE8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A56D5CF8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A56D5D08()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A56D5D18()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1A56D5D28()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A56D5D38()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1A56D5D48()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A56D5D58()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1A56D5D68()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1A56D5D78()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A56D5D88()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A56D5D98()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A56D5DA8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A56D5DB8()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1A56D5DC8()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1A56D5DD8()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A56D5DE8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A56D5DF8()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A56D5E08()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1A56D5E18()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A56D5E28()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1A56D5E38()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A56D5E48()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1A56D5E58()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1A56D5E68()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A56D5E78()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A56D5EA8()
{
  return MEMORY[0x1F41857B8]();
}

uint64_t sub_1A56D5EB8()
{
  return MEMORY[0x1F41857F0]();
}

uint64_t sub_1A56D5EC8()
{
  return MEMORY[0x1F4185818]();
}

uint64_t sub_1A56D5ED8()
{
  return MEMORY[0x1F41858D8]();
}

uint64_t sub_1A56D5EE8()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1A56D5EF8()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A56D5F08()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A56D5F18()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1A56D5F28()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A56D5F48()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1A56D5F58()
{
  return MEMORY[0x1F4185D20]();
}

uint64_t sub_1A56D5F78()
{
  return MEMORY[0x1F4185D38]();
}

uint64_t sub_1A56D5F88()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1A56D5F98()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1A56D5FA8()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1A56D5FB8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A56D5FC8()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1A56D5FE8()
{
  return MEMORY[0x1F4188188]();
}

uint64_t sub_1A56D6018()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1A56D6028()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A56D6038()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A56D6048()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A56D6058()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A56D6068()
{
  return MEMORY[0x1F4185E48]();
}

uint64_t sub_1A56D6078()
{
  return MEMORY[0x1F4185E50]();
}

uint64_t sub_1A56D6088()
{
  return MEMORY[0x1F4185E58]();
}

uint64_t sub_1A56D6098()
{
  return MEMORY[0x1F4185E78]();
}

uint64_t sub_1A56D60A8()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1A56D60B8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A56D60C8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A56D60D8()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A56D60E8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A56D60F8()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1A56D6108()
{
  return MEMORY[0x1F4185F18]();
}

uint64_t sub_1A56D6118()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1A56D6128()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1A56D6138()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1A56D6148()
{
  return MEMORY[0x1F4185F50]();
}

uint64_t sub_1A56D6158()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1A56D6168()
{
  return MEMORY[0x1F40E6EA8]();
}

uint64_t sub_1A56D6178()
{
  return MEMORY[0x1F4185FA8]();
}

uint64_t sub_1A56D6188()
{
  return MEMORY[0x1F4185FB0]();
}

uint64_t sub_1A56D6198()
{
  return MEMORY[0x1F4185FC0]();
}

uint64_t sub_1A56D61A8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A56D61B8()
{
  return MEMORY[0x1F4185FD8]();
}

uint64_t sub_1A56D61C8()
{
  return MEMORY[0x1F4185FE8]();
}

uint64_t sub_1A56D61D8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A56D61E8()
{
  return MEMORY[0x1F4186288]();
}

uint64_t sub_1A56D6218()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_1A56D6228()
{
  return MEMORY[0x1F41881A8]();
}

uint64_t sub_1A56D6238()
{
  return MEMORY[0x1F4186318]();
}

uint64_t ASPrintF()
{
  return MEMORY[0x1F4115D28]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t CFAppendPrintF()
{
  return MEMORY[0x1F4115E68]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

CFBagRef CFBagCreateCopy(CFAllocatorRef allocator, CFBagRef theBag)
{
  return (CFBagRef)MEMORY[0x1F40D7300](allocator, theBag);
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x1F40D7308](allocator, capacity, callBacks);
}

CFMutableBagRef CFBagCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBagRef theBag)
{
  return (CFMutableBagRef)MEMORY[0x1F40D7310](allocator, capacity, theBag);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return MEMORY[0x1F40D7318](theBag);
}

CFTypeID CFBagGetTypeID(void)
{
  return MEMORY[0x1F40D7328]();
}

void CFBagGetValues(CFBagRef theBag, const void **values)
{
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
}

void CFBagSetValue(CFMutableBagRef theBag, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return MEMORY[0x1F4115EC8]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1F4115EF0]();
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return MEMORY[0x1F4115F00]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1F4115F10]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1F4115F18]();
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1F4115F28]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x1F4115F58]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1F40D7AC0]();
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x1F4115FD8]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1F4115FE8]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1F4116000]();
}

uint64_t CFPrefs_SetInt64()
{
  return MEMORY[0x1F4116020]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x1F4116028]();
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x1F40D8020](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1F40D8208](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8218](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8768](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D87C0](anURL);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x1F40D8958](url, key, propertyValue, error);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1F40D8A58](userNotification);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x1F40D8A60](userNotification, key, idx);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return MEMORY[0x1F40D8A70](userNotification, flags, dictionary, timeout);
}

Boolean CFWriteStreamSetProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x1F40D8AF0](stream, propertyName, propertyValue);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateByMatchingToColorSpace()
{
  return MEMORY[0x1F40E96A0]();
}

uint64_t CGImageCreateThumb()
{
  return MEMORY[0x1F40E96F8]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x1F40DA988](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x1F40DA990](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CNUserInteractionIsRequired()
{
  return MEMORY[0x1F410FB70]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1F4109338]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1F41160C0]();
}

uint64_t CUMainQueue()
{
  return MEMORY[0x1F41160E8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x1F4116178]();
}

uint64_t CryptoAEADCreate()
{
  return MEMORY[0x1F4116278]();
}

uint64_t CryptoAEADDecryptMessage()
{
  return MEMORY[0x1F4116280]();
}

uint64_t CryptoAEADEncryptMessage()
{
  return MEMORY[0x1F4116288]();
}

uint64_t DataToHexCStringEx()
{
  return MEMORY[0x1F4116328]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1F4116330]();
}

uint64_t FPrintF()
{
  return MEMORY[0x1F4116358]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x1F4116368]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x1F4116378]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1F41163A8]();
}

uint64_t IOPMConnectionGetSystemCapabilities()
{
  return MEMORY[0x1F40E8FD0]();
}

uint64_t IOPMIsASleep()
{
  return MEMORY[0x1F40E9040]();
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x1F40E90D0]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1F40E90D8]();
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x1F40E90E0]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1F40E90F0](blob);
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x1F40E90F8]();
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9118](blob, ps);
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x1F40E9138]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x1F40E9140]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1F41165A0]();
}

uint64_t LogCategoryCreateEx()
{
  return MEMORY[0x1F41165E8]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x1F41165F8]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x1F4116600]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1F4116630]();
}

uint64_t MAGetActivationState()
{
  return MEMORY[0x1F412F550]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1F41166D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSDataCompress()
{
  return MEMORY[0x1F41166F0]();
}

uint64_t NSDataDecompress()
{
  return MEMORY[0x1F41166F8]();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x1F4116708]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x1F4116728]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x1F4116730]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x1F4116738]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x1F4116750]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x1F4116760]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x1F4116778]();
}

uint64_t NSErrorNestedV()
{
  return MEMORY[0x1F4116788]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x1F4116790]();
}

uint64_t NSErrorV()
{
  return MEMORY[0x1F4116798]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x1F41167A0]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPrintF()
{
  return MEMORY[0x1F41167B0]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1F41167D0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSStringWithMACAddress()
{
  return MEMORY[0x1F41167D8]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t NSUnimplemented_()
{
  return MEMORY[0x1F40E72D0]();
}

uint64_t NormalizePath()
{
  return MEMORY[0x1F41168A8]();
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1F41168C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1F41168D0]();
}

uint64_t OPACKEncoderCreateDataMutable()
{
  return MEMORY[0x1F41168D8]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1F4114240]();
}

uint64_t PairingSessionCopyPairedPeer()
{
  return MEMORY[0x1F41168F8]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1F4116918]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1F4116928]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1F4116930]();
}

uint64_t PairingSessionSetACL()
{
  return MEMORY[0x1F4116968]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x1F4116978]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x1F4116990]();
}

uint64_t PairingSessionSetMyAppleID()
{
  return MEMORY[0x1F41169A0]();
}

uint64_t PairingSessionSetMyAppleIDInfoClient()
{
  return MEMORY[0x1F41169A8]();
}

uint64_t PairingSessionSetPeerAppleID()
{
  return MEMORY[0x1F41169B0]();
}

uint64_t PairingSessionSetPeerAppleIDs()
{
  return MEMORY[0x1F41169B8]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x1F41169D0]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1F4116A00]();
}

uint64_t RandomString()
{
  return MEMORY[0x1F4116A08]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

uint64_t SNPrintF()
{
  return MEMORY[0x1F4116A18]();
}

uint64_t SNPrintF_Add()
{
  return MEMORY[0x1F4116A20]();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return MEMORY[0x1F40F6A98]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x1F40F6AC0]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6B48](certificate, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1F40F6BB8]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

uint64_t SecGenerateCertificateRequestWithParameters()
{
  return MEMORY[0x1F40F6DA8]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1F40F6DC8]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t SecKeyCopyMatchingPrivateKey()
{
  return MEMORY[0x1F40F6E58]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E98](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EB0](key, algorithm, plaintext, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF8](key, algorithm, dataToSign, error);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x1F40F6F38]();
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x1F40F6F40](key);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1F40F6F58]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleIDAuthorityPolicy()
{
  return MEMORY[0x1F40F6FF0]();
}

uint64_t SecPolicyCreateAppleIDValidationRecordSigningPolicy()
{
  return MEMORY[0x1F40F7008]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F71F0](trust, result);
}

OSStatus SecTrustEvaluateAsync(SecTrustRef trust, dispatch_queue_t queue, SecTrustCallback result)
{
  return MEMORY[0x1F40F71F8](trust, queue, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

uint64_t SecondsToUpTicksF()
{
  return MEMORY[0x1F4116A38]();
}

uint64_t SipHash()
{
  return MEMORY[0x1F4116A60]();
}

uint64_t StringToUUIDEx()
{
  return MEMORY[0x1F4116B28]();
}

uint64_t TextSep()
{
  return MEMORY[0x1F4116B90]();
}

uint64_t TextToSourceVersion()
{
  return MEMORY[0x1F4116BC0]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFURLRef UTTypeCopyDeclaringBundleURL(CFStringRef inUTI)
{
  return (CFURLRef)MEMORY[0x1F40DEE38](inUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1F40DEE78](inUTI);
}

uint64_t UUIDGet()
{
  return MEMORY[0x1F4116BD0]();
}

uint64_t UpTicksToMicroseconds()
{
  return MEMORY[0x1F4116BF0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1F4116BF8]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1F4116C10]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x1F4116C20]();
}

uint64_t WiFiCopyCurrentNetworkInfo()
{
  return MEMORY[0x1F4116C28]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1F4116C30]();
}

uint64_t WiFiDeviceClientRegisterAutoJoinNotificationCallback()
{
  return MEMORY[0x1F412FDF0]();
}

uint64_t WiFiDeviceClientRegisterRemovalCallback()
{
  return MEMORY[0x1F412FE20]();
}

uint64_t WiFiJoinNetwork_b()
{
  return MEMORY[0x1F4116C48]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x1F412FE90]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x1F412FEA8]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x1F412FEB0]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1F412FEF0]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x1F412FF00]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1F412FF58]();
}

uint64_t WiFiNetworkCopyShareablePassword()
{
  return MEMORY[0x1F412FF78]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1F412FFC8]();
}

uint64_t WiFiNetworkGetShareMode()
{
  return MEMORY[0x1F412FFD8]();
}

uint64_t WiFiScan_b()
{
  return MEMORY[0x1F4116C70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x1F40D9348]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1F4116C88]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1F40E7398]();
}

uint64_t _UTHardwareColorMakeWithIndex()
{
  return MEMORY[0x1F4103050]();
}

uint64_t _UTHardwareColorMakeWithRGBComponents()
{
  return MEMORY[0x1F4103058]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_activity_label_useraction(void *dso, const char *name)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_pthread_root_queue_create()
{
  return MEMORY[0x1F40CBB98]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1F40CC508](*(void *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

uint64_t mkpath()
{
  return MEMORY[0x1F4116D38]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x1F40F2910](name, type, domain);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1F40F29A0](type, domain);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1F40F29B8](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1F40F29C8](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1F40F29D8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2AA0](connection);
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x1F40F2AC0](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1F40F2AD0](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x1F40F2CF8](context_identifier);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x1F40F2D10](context);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EE8](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2F08](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F20](endpoint);
}

uint64_t nw_endpoint_get_service_identifier()
{
  return MEMORY[0x1F40F2F28]();
}

uint64_t nw_endpoint_set_txt_record()
{
  return MEMORY[0x1F40F2F48]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1F40F2F60](error);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1F40F3238]();
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1F40F3320](parameters);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1F40F3418](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1F40F3488]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

void nw_parameters_prohibit_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_attributed_bundle_identifier()
{
  return MEMORY[0x1F40F35B8]();
}

uint64_t nw_parameters_set_include_ble()
{
  return MEMORY[0x1F40F3650]();
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x1F40F3750]();
}

nw_protocol_definition_t nw_protocol_copy_ws_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3A60]();
}

BOOL nw_protocol_definition_is_equal(nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x1F40F3A88](definition1, definition2);
}

nw_protocol_definition_t nw_protocol_options_copy_definition(nw_protocol_options_t options)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3B00](options);
}

void nw_protocol_stack_iterate_application_protocols(nw_protocol_stack_t stack, nw_protocol_stack_iterate_protocols_block_t iterate_block)
{
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

void nw_tcp_options_set_enable_fast_open(nw_protocol_options_t options, BOOL enable_fast_open)
{
}

void nw_tcp_options_set_enable_keepalive(nw_protocol_options_t options, BOOL enable_keepalive)
{
}

void nw_tcp_options_set_keepalive_idle_time(nw_protocol_options_t options, uint32_t keepalive_idle_time)
{
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
}

uint64_t nw_txt_record_create_dictionary_with_initial_length()
{
  return MEMORY[0x1F40F3F78]();
}

BOOL nw_txt_record_set_key(nw_txt_record_t txt_record, const char *key, const uint8_t *value, size_t value_len)
{
  return MEMORY[0x1F40F3F90](txt_record, key, value, value_len);
}

nw_protocol_metadata_t nw_ws_create_metadata(nw_ws_opcode_t opcode)
{
  return (nw_protocol_metadata_t)MEMORY[0x1F40F3FA8](*(void *)&opcode);
}

nw_protocol_options_t nw_ws_create_options(nw_ws_version_t version)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3FB0](*(void *)&version);
}

nw_ws_response_t nw_ws_metadata_copy_server_response(nw_protocol_metadata_t metadata)
{
  return (nw_ws_response_t)MEMORY[0x1F40F3FB8](metadata);
}

void nw_ws_options_add_additional_header(nw_protocol_options_t options, const char *name, const char *value)
{
}

void nw_ws_options_set_auto_reply_ping(nw_protocol_options_t options, BOOL auto_reply_ping)
{
}

void nw_ws_options_set_client_request_handler(nw_protocol_options_t options, dispatch_queue_t client_queue, nw_ws_client_request_handler_t handler)
{
}

BOOL nw_ws_request_enumerate_additional_headers(nw_ws_request_t request, nw_ws_additional_header_enumerator_t enumerator)
{
  return MEMORY[0x1F40F4020](request, enumerator);
}

void nw_ws_response_add_additional_header(nw_ws_response_t response, const char *name, const char *value)
{
}

nw_ws_response_t nw_ws_response_create(nw_ws_response_status_t status, const char *selected_subprotocol)
{
  return (nw_ws_response_t)MEMORY[0x1F40F4030](*(void *)&status, selected_subprotocol);
}

BOOL nw_ws_response_enumerate_additional_headers(nw_ws_response_t response, nw_ws_additional_header_enumerator_t enumerator)
{
  return MEMORY[0x1F40F4038](response, enumerator);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x1F40CD180]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x1F40CD200]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x1F40CD218]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x1F40CD258]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x1F40CD270]();
}

uint64_t os_channel_set_slot_properties()
{
  return MEMORY[0x1F40CD278]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x1F40CD298]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x1F40CD2A0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1F40CD938](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

uint64_t reboot3()
{
  return MEMORY[0x1F40CDCA8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1F40CDF88](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strnicmp_prefix()
{
  return MEMORY[0x1F4116D68]();
}

uint64_t strnicmpx()
{
  return MEMORY[0x1F4116D70]();
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1F41866F0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA80](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}