uint64_t sub_21D8EEFA8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        result = sub_21D915C28();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
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

uint64_t sub_21D8EF070(char *__dst, char *__src, unint64_t a3, char *a4)
{
  v4 = a4;
  v6 = __src;
  v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 16;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 16;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[16 * v11] <= a4) {
      memmove(a4, __src, 16 * v11);
    }
    v13 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_57;
    }
    v20 = (char *)(a3 - 16);
    while (1)
    {
      v21 = v20 + 16;
      v22 = v13 - 16;
      BOOL v23 = *((void *)v13 - 2) == *((void *)v6 - 2) && *((void *)v13 - 1) == *((void *)v6 - 1);
      if (v23 || (sub_21D915C28() & 1) == 0)
      {
        BOOL v25 = v21 != v13 || v20 >= v13;
        v13 -= 16;
        if (!v25) {
          goto LABEL_53;
        }
      }
      else
      {
        BOOL v24 = v21 != v6 || v20 >= v6;
        v22 = v6 - 16;
        v6 -= 16;
        if (!v24) {
          goto LABEL_53;
        }
      }
      *(_OWORD *)v20 = *(_OWORD *)v22;
LABEL_53:
      v20 -= 16;
      if (v6 <= v7 || v13 <= v4) {
        goto LABEL_57;
      }
    }
  }
  if (a4 != __dst || &__dst[16 * v9] <= a4) {
    memmove(a4, __dst, 16 * v9);
  }
  v13 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v15 && (sub_21D915C28() & 1) != 0) {
        break;
      }
      v16 = v4;
      BOOL v15 = v7 == v4;
      v4 += 16;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 16;
      if (v4 >= v13 || (unint64_t)v6 >= a3) {
        goto LABEL_26;
      }
    }
    v16 = v6;
    BOOL v15 = v7 == v6;
    v6 += 16;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    *(_OWORD *)v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_26:
  v6 = v7;
LABEL_57:
  uint64_t v27 = (v13 - v4) / 16;
  if (v6 != v4 || v6 >= &v4[16 * v27]) {
    memmove(v6, v4, 16 * v27);
  }
  return 1;
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21D8EF290(void *a1@<X8>)
{
  sub_21D8EA78C(*(void *)(v1 + 24), a1);
}

uint64_t sub_21D8EF298()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21D8EF2D0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21D8EF2E0(uint64_t a1)
{
}

uint64_t sub_21D8EF2F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_88_1();
  v4();
  return a2;
}

uint64_t sub_21D8EF350@<X0>(void *a1@<X8>)
{
  return sub_21D8EAFD4(*(void **)(v1 + 16), a1);
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return v0;
}

void OUTLINED_FUNCTION_2_7(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_21D907F44(a1, a2);
}

double OUTLINED_FUNCTION_3_9@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v7 + 48) = a2;
  *(void *)(v7 + 56) = a1;
  *(unsigned char *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = v7;
  *(void *)(v2 + 16) = v6;
  *(void *)(v2 + 24) = v5;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0;
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = a2;
  double result = 0.0;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 128) = a2;
  *(void *)(v2 + 136) = 0;
  *(void *)(v2 + 144) = 0;
  *(_WORD *)(v2 + 152) = 256;
  *(void *)(v2 + 160) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_13_9(char a1, uint64_t a2)
{
  sub_21D8ECAD8(a1, a2, 1, v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return v2;
}

double OUTLINED_FUNCTION_16_9()
{
  *(void *)(v0 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_7()
{
  return swift_arrayInitWithCopy();
}

void *OUTLINED_FUNCTION_23_7(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char __dst)
{
  return memcpy(&__dst, v10, 0xA8uLL);
}

unsigned char *OUTLINED_FUNCTION_26_11(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_28_10(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D8E3F80(a1, a2, a4, a4, a5, a5);
}

uint64_t OUTLINED_FUNCTION_29_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_32_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_33_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_7()
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
  return v1;
}

uint64_t OUTLINED_FUNCTION_36_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_8(uint64_t a1, ...)
{
  va_start(va, a1);
  return sub_21D8E4DAC(v3, (uint64_t *)va, v2, v1, v4);
}

__n128 OUTLINED_FUNCTION_41_5(uint64_t a1)
{
  return *(__n128 *)(a1 + 8);
}

uint64_t OUTLINED_FUNCTION_42_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return Connection.scalar(_:_:)(a1, v9, v10, (uint64_t)&a9);
}

uint64_t OUTLINED_FUNCTION_44_8(uint64_t a1, uint64_t a2)
{
  return sub_21D8EC594(a1, a2, 1, 4476481, 0xE300000000000000, v2);
}

uint64_t OUTLINED_FUNCTION_46_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  *(void *)uint64_t v11 = a10;
  *(_OWORD *)(v11 + 8) = a11;
  return __swift_destroy_boxed_opaque_existential_1(v12 - 120);
}

uint64_t OUTLINED_FUNCTION_48_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Connection.run(_:_:)(a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_50_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52_6@<X0>(uint64_t a1@<X8>, uint64_t a2, long long a3)
{
  return sub_21D861760(&a3, a1 + 32);
}

void OUTLINED_FUNCTION_54_6(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_21D907F44(a1, a2);
}

uint64_t *OUTLINED_FUNCTION_55_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_56_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_21D9083B8((uint64_t)&a9, v10, v9);
}

uint64_t OUTLINED_FUNCTION_57_6(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v2, v1, 1, a1);
}

__n128 OUTLINED_FUNCTION_59_5()
{
  __n128 result = *v1;
  *uint64_t v0 = *v1;
  v0[1].n128_u64[0] = v1[1].n128_u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_60_7()
{
  return v0;
}

char *OUTLINED_FUNCTION_62_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t OUTLINED_FUNCTION_64_6()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

__n128 OUTLINED_FUNCTION_66_5()
{
  __n128 result = *(__n128 *)(v1 + 136);
  *(__n128 *)(v0 + 136) = result;
  *(_WORD *)(v0 + 152) = *(_WORD *)(v1 + 152);
  return result;
}

__n128 OUTLINED_FUNCTION_67_6@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v1[1].n128_u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_68_5()
{
  *(void *)(v0 + 104) = *(void *)(v1 + 104);
  uint64_t result = *(void *)(v1 + 112);
  *(void *)(v0 + 112) = result;
  return result;
}

__n128 OUTLINED_FUNCTION_70_6()
{
  unint64_t v2 = v1[1].n128_u64[0];
  __n128 result = *v1;
  *uint64_t v0 = *v1;
  v0[1].n128_u64[0] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_71_3()
{
  *(void *)(v0 + 72) = *(void *)(v1 + 72);
  uint64_t result = *(void *)(v1 + 80);
  *(void *)(v0 + 80) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_72_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v4[7] = a1;
  v4[8] = a2;
  v4[4] = v5;
  v4[5] = v2;
  v4[6] = v3;
  return 0;
}

uint64_t OUTLINED_FUNCTION_73_5@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void *OUTLINED_FUNCTION_74_3(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void OUTLINED_FUNCTION_75_3(char a1, uint64_t a2)
{
  sub_21D8ECAD8(a1, a2, 1, v2, v3, v4);
}

void OUTLINED_FUNCTION_76_5(char a1, uint64_t a2)
{
  sub_21D8ECAD8(a1, a2, 1, v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_78_4(uint64_t a1)
{
  return sub_21D8ED0DC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_79_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_80_5()
{
  return 34;
}

void OUTLINED_FUNCTION_81_3(uint64_t a1@<X8>)
{
  v1[8] = a1;
  v1[4] = 42;
  v1[5] = 0xE100000000000000;
}

void *OUTLINED_FUNCTION_82_4()
{
  return memmove(v1, v2, 40 * v0);
}

uint64_t OUTLINED_FUNCTION_84_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_85_4(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_87_3(uint64_t result)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((result - 32) / v3);
  return result;
}

__n128 sub_21D8EFA78@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  uint64_t v8 = type metadata accessor for Expression();
  *(void *)(a3 + 24) = v8;
  *(void *)(a3 + 32) = &protocol witness table for Expression<A>;
  *(void *)a3 = v6;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a1 + 1);
  *(void *)(a3 + 64) = v8;
  *(void *)(a3 + 72) = &protocol witness table for Expression<A>;
  *(void *)(a3 + 40) = v7;
  __n128 result = *(__n128 *)(a2 + 1);
  *(__n128 *)(a3 + 48) = result;
  return result;
}

uint64_t sub_21D8EFAEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *a1;
  *(void *)(a5 + 24) = type metadata accessor for Expression();
  *(void *)(a5 + 32) = &protocol witness table for Expression<A>;
  *(void *)a5 = v10;
  *(_OWORD *)(a5 + 8) = *(_OWORD *)(a1 + 1);
  uint64_t v11 = *(void *)(a4 + 8);
  *(void *)(a5 + 64) = a3;
  *(void *)(a5 + 72) = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a5 + 40));
  uint64_t v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32);
  return v13(boxed_opaque_existential_1, a2, a3);
}

__n128 sub_21D8EFBA0@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  sub_21D9158C8();
  *(void *)(a3 + 24) = type metadata accessor for Expression();
  *(void *)(a3 + 32) = &protocol witness table for Expression<A>;
  *(void *)a3 = v6;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a1 + 1);
  *(void *)(a3 + 64) = type metadata accessor for Expression();
  *(void *)(a3 + 72) = &protocol witness table for Expression<A>;
  *(void *)(a3 + 40) = v7;
  __n128 result = *(__n128 *)(a2 + 1);
  *(__n128 *)(a3 + 48) = result;
  return result;
}

__n128 sub_21D8EFC38@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  sub_21D9158C8();
  uint64_t v8 = type metadata accessor for Expression();
  *(void *)(a3 + 24) = v8;
  *(void *)(a3 + 32) = &protocol witness table for Expression<A>;
  *(void *)a3 = v6;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a1 + 1);
  *(void *)(a3 + 64) = v8;
  *(void *)(a3 + 72) = &protocol witness table for Expression<A>;
  *(void *)(a3 + 40) = v7;
  __n128 result = *(__n128 *)(a2 + 1);
  *(__n128 *)(a3 + 48) = result;
  return result;
}

uint64_t sub_21D8EFCB8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_21D9158C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t v12 = *a1;
  uint64_t v13 = type metadata accessor for Expression();
  *(void *)(a4 + 24) = v13;
  *(void *)(a4 + 32) = &protocol witness table for Expression<A>;
  *(void *)a4 = v12;
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a1 + 1);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  uint64_t v18 = v13;
  v19 = &protocol witness table for Expression<A>;
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  ExpressionType<>.init(value:)((uint64_t)v11, v13, WitnessTable, a3, (uint64_t)&v17);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  return sub_21D861760(&v17, a4 + 40);
}

uint64_t Setter.expression.getter()
{
  return sub_21D8EC57C(v0, v0 + 40, 0, 61, 0xE100000000000000);
}

uint64_t <- infix<A>(_:_:)(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8EFF8C(a1, a2, a3, a4, (void (*)(void *, void *))sub_21D8EFA78);
}

{
  return sub_21D8EFF8C(a1, a2, a3, a4, (void (*)(void *, void *))sub_21D8EFBA0);
}

{
  return sub_21D8EFF8C(a1, a2, a3, a4, (void (*)(void *, void *))sub_21D8EFC38);
}

uint64_t <- infix<A>(_:_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v7 = (uint64_t *)MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v7[1];
  uint64_t v11 = v7[2];
  v15[0] = *v7;
  v15[1] = v10;
  v15[2] = v11;
  (*(void (**)(char *))(v12 + 16))(v9);
  sub_21D8EFAEC(v15, (uint64_t)v9, a1, a2, a3);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_21D8EFF8C(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, void *))
{
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  v12[0] = *a1;
  v12[1] = v5;
  v12[2] = v6;
  v11[0] = v7;
  v11[1] = v8;
  v11[2] = v9;
  a5(v12, v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t <- infix<A>(_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  sub_21D9158C8();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17[-1] - v9;
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[2];
  v17[0] = v11;
  v17[1] = v12;
  v17[2] = v13;
  (*(void (**)(char *, uint64_t))(v14 + 16))(v10, a2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_21D8EFCB8(v17, (uint64_t)v10, a3, a4);
}

uint64_t += infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_21D8F0250(a1, a2, &qword_26AD31120, sub_21D8EC704);
}

{
  return sub_21D8F0250(a1, a2, &qword_26AD31130, sub_21D8EC710);
}

uint64_t += infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D8F0338(a1, a2, a3, &qword_26AD31120, sub_21D8EC704);
}

{
  return sub_21D8F0338(a1, a2, a3, &qword_26AD31130, sub_21D8EC710);
}

#error "21D8F0210: call analysis failed (funcsize=55)"

#error "21D8F02CC: call analysis failed (funcsize=49)"

#error "21D8F03B8: call analysis failed (funcsize=49)"

uint64_t += infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)+ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)+ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)+ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)+ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)+ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t sub_21D8F0488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  __n128 v8 = OUTLINED_FUNCTION_0_8(a1, a2);
  v9(v8);
  OUTLINED_FUNCTION_3_10();
  a7();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8F054C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  OUTLINED_FUNCTION_1_9();
  v8();
  OUTLINED_FUNCTION_4_7();
  a7();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t -= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)- infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)- infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)- infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)- infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)- infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t sub_21D8F0610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[4] = &protocol witness table for Expression<A>;
  v9[0] = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D14FC8);
  v8[3] = MEMORY[0x263F8D6C8];
  v8[4] = &protocol witness table for Int;
  v8[0] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8EC71C((uint64_t)v9, (uint64_t)v8, 1, a5, 0xE100000000000000);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t *= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)* infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)* infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)* infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)* infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)* infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t /= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)/ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)/ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)/ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0488(a1, a2, a3, a4, a5, (uint64_t)/ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F054C(a1, a2, a3, a4, a5, (uint64_t)/ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t %= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)% infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)% infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)% infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)% infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)% infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t sub_21D8F0990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  __n128 v7 = OUTLINED_FUNCTION_0_8(a1, a2);
  v8(v7);
  OUTLINED_FUNCTION_3_10();
  a6();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8F0A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  OUTLINED_FUNCTION_1_9();
  v7();
  OUTLINED_FUNCTION_4_7();
  a6();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t <<= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)<< infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)<< infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)<< infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)<< infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)<< infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t >>= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)>> infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)>> infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)>> infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)>> infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)>> infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t &= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t |= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)| infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)| infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)| infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)| infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)| infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

uint64_t ^= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)^ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)^ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)^ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0990(a1, a2, a3, a4, (uint64_t)^ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

{
  return sub_21D8F0A54(a1, a2, a3, a4, (uint64_t)^ infix<A>(_:_:), (void (*)(void))<- infix<A>(_:_:));
}

double ++ postfix<A>(_:)()
{
  return sub_21D8F0F24();
}

{
  return sub_21D8F0FE0();
}

double -- postfix<A>(_:)()
{
  return sub_21D8F0F24();
}

{
  return sub_21D8F0FE0();
}

double sub_21D8F0F24()
{
  OUTLINED_FUNCTION_10_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D14FC8);
  type metadata accessor for Expression();
  sub_21D8F10A0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = OUTLINED_FUNCTION_7_8(WitnessTable, v4, v5, v6, v7, v8, v9, v10, v2);
  OUTLINED_FUNCTION_5_14(v11, v12, v13, v14, v15, v16, v17, v18, v20, v0, v1, v23, v24, v25);
  *(void *)&double result = OUTLINED_FUNCTION_8_12(v21, v21, v22).n128_u64[0];
  return result;
}

double sub_21D8F0FE0()
{
  OUTLINED_FUNCTION_10_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D14FC8);
  sub_21D9158C8();
  type metadata accessor for Expression();
  sub_21D8F10A0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = OUTLINED_FUNCTION_7_8(WitnessTable, v4, v5, v6, v7, v8, v9, v10, v2);
  OUTLINED_FUNCTION_5_14(v11, v12, v13, v14, v15, v16, v17, v18, v20, v0, v1, v23, v24, v25);
  *(void *)&double result = OUTLINED_FUNCTION_8_12(v21, v21, v22).n128_u64[0];
  return result;
}

unint64_t sub_21D8F10A0()
{
  unint64_t result = qword_267D15A60;
  if (!qword_267D15A60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D14FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15A60);
  }
  return result;
}

uint64_t destroy for Setter(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t initializeWithCopy for Setter(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for Setter(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for Setter(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for Setter(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for Setter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Setter()
{
  return &type metadata for Setter;
}

__n128 OUTLINED_FUNCTION_0_8(uint64_t a1, uint64_t a2)
{
  return *(__n128 *)(a2 + 8);
}

uint64_t OUTLINED_FUNCTION_5_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return sub_21D8F0610(a12, a13, a14, 1, v14);
}

char *OUTLINED_FUNCTION_6_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  return &a15;
}

uint64_t OUTLINED_FUNCTION_7_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return ExpressionType.init<A>(_:)((uint64_t)&a9, v9, v10, v11, a1);
}

__n128 OUTLINED_FUNCTION_8_12@<Q0>(unint64_t a1@<X8>, uint64_t a2, __n128 a3)
{
  v4->n128_u64[0] = v6;
  v4->n128_u64[1] = v7;
  v4[1].n128_u64[0] = v8;
  v4[1].n128_u64[1] = v5;
  v4[4].n128_u64[0] = v5;
  v4[4].n128_u64[1] = v3;
  v4[2].n128_u64[0] = v3;
  v4[2].n128_u64[1] = a1;
  __n128 result = a3;
  v4[3] = a3;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  *(_OWORD *)(v21 + 48) = a21;
  return swift_bridgeObjectRetain();
}

uint64_t QueryError.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  switch(*(unsigned char *)(v0 + 24))
  {
    case 1:
      OUTLINED_FUNCTION_1_10();
      sub_21D915A08();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_9();
      sub_21D9154F8();
      MEMORY[0x223C0B680](v1, MEMORY[0x263F8D310]);
      sub_21D9154F8();
      swift_bridgeObjectRelease();
      return v3;
    case 2:
      OUTLINED_FUNCTION_1_10();
      sub_21D915A08();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_9();
      sub_21D9154F8();
      MEMORY[0x223C0B680](v1, MEMORY[0x263F8D310]);
      sub_21D9154F8();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 3:
      OUTLINED_FUNCTION_1_10();
      sub_21D915A08();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_9();
      goto LABEL_5;
    default:
      OUTLINED_FUNCTION_1_10();
      sub_21D915A08();
      swift_bridgeObjectRelease();
      uint64_t v3 = 0x2068637573206F4ELL;
LABEL_5:
      sub_21D9154F8();
      return v3;
  }
}

uint64_t sub_21D8F16C8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result = a2;
  if (a4 - 1 < 2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  if (!a4 || a4 == 3)
  {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for QueryError(uint64_t a1)
{
  return sub_21D8F1748(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_21D8F1748(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result = a2;
  if (a4 - 1 < 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if (!a4 || a4 == 3)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for QueryError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_21D8F16C8(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for QueryError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_21D8F16C8(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_21D8F1748(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for QueryError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_21D8F1748(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 3) {
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

uint64_t storeEnumTagSinglePayload for QueryError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21D8F1970(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_21D8F1978(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for QueryError()
{
  return &type metadata for QueryError;
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return sub_21D9154F8();
}

double sub_21D8F19C8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_21D8F9A0C(a1, (uint64_t)__src, &qword_267D15A68);
  if (__src[3])
  {
    memcpy(v4, __src, sizeof(v4));
    sub_21D8F8A78((uint64_t)v4, (uint64_t)&v4[40], (uint64_t *)a2);
    sub_21D861B48((uint64_t)v4, &qword_267D15A70);
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

void sub_21D8F1A60()
{
  OUTLINED_FUNCTION_11_0();
  unsigned int v3 = v2;
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[7];
  if (!v5)
  {
    swift_bridgeObjectRetain();
LABEL_6:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v25 = OUTLINED_FUNCTION_137_0();
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21D917D30;
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
      *(void *)(inited + 56) = v29;
      *(void *)(inited + 64) = &protocol witness table for Expression<A>;
      swift_bridgeObjectRetain();
      uint64_t v30 = OUTLINED_FUNCTION_136_0();
      uint64_t v32 = v31;
      swift_bridgeObjectRelease();
      *(void *)(inited + 32) = v30;
      *(void *)(inited + 40) = v32;
      uint64_t v33 = MEMORY[0x263F8EE78];
      *(void *)(inited + 48) = MEMORY[0x263F8EE78];
      *(void *)(inited + 96) = v29;
      *(void *)(inited + 104) = &protocol witness table for Expression<A>;
      *(void *)(inited + 72) = v25;
      *(void *)(inited + 80) = v27;
      *(void *)(inited + 88) = v33;
      OUTLINED_FUNCTION_61_5(v3);
      swift_setDeallocating();
      sub_21D8ECF90();
      swift_bridgeObjectRelease();
    }
    else
    {
      v3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
      v3[4] = (uint64_t)&protocol witness table for Expression<A>;
      swift_bridgeObjectRelease();
      *unsigned int v3 = v25;
      v3[1] = v27;
      v3[2] = MEMORY[0x263F8EE78];
    }
    goto LABEL_11;
  }
  uint64_t v7 = v0[4];
  if ((v1 & 1) == 0) {
    goto LABEL_6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_21D919AA0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = OUTLINED_FUNCTION_137_0();
  uint64_t v40 = v10;
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v12 = swift_initStackObject();
    *(_OWORD *)(v12 + 16) = xmmword_21D917D30;
    uint64_t v39 = v7;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    *(void *)(v12 + 56) = v13;
    *(void *)(v12 + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v14 = OUTLINED_FUNCTION_136_0();
    uint64_t v16 = v15;
    uint64_t v17 = swift_bridgeObjectRelease();
    *(void *)(v12 + 32) = v14;
    *(void *)(v12 + 40) = v16;
    uint64_t v11 = MEMORY[0x263F8EE78];
    *(void *)(v12 + 48) = MEMORY[0x263F8EE78];
    *(void *)(v12 + 96) = v13;
    *(void *)(v12 + 104) = &protocol witness table for Expression<A>;
    *(void *)(v12 + 72) = v9;
    *(void *)(v12 + 80) = v40;
    *(void *)(v12 + 88) = v11;
    OUTLINED_FUNCTION_131_0(v17, v18, v19, v20, v21, v22, v23, v24, v38, (uint64_t *)(v8 + 32));
    swift_setDeallocating();
    sub_21D8ECF90();
    uint64_t v7 = v39;
  }
  else
  {
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    *(void *)(v8 + 64) = &protocol witness table for Expression<A>;
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v40;
    *(void *)(v8 + 48) = v11;
  }
  swift_bridgeObjectRelease();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(v8 + 96) = v34;
  *(void *)(v8 + 104) = &protocol witness table for Expression<A>;
  *(void *)(v8 + 72) = 21313;
  *(void *)(v8 + 80) = 0xE200000000000000;
  *(void *)(v8 + 88) = v11;
  *(void *)(v8 + 136) = v34;
  *(void *)(v8 + 144) = &protocol witness table for Expression<A>;
  uint64_t v35 = OUTLINED_FUNCTION_92_2();
  sub_21D908300(v35, v36, v37, v5);
  OUTLINED_FUNCTION_134_0();
  swift_bridgeObjectRelease();
  *(void *)(v8 + 112) = v7;
  *(void *)(v8 + 120) = v4;
  *(void *)(v8 + 128) = v11;
  OUTLINED_FUNCTION_2_7(v8, v3);
  swift_setDeallocating();
  sub_21D8ECF90();
LABEL_11:
  OUTLINED_FUNCTION_12_0();
}

Swift::String __swiftcall SchemaType.drop(ifExists:)(Swift::Bool ifExists)
{
  sub_21D894A10();
  sub_21D8E551C();
  uint64_t v2 = OUTLINED_FUNCTION_124_1();
  sub_21D8F1FB4(v2, v3, v4, ifExists);
  OUTLINED_FUNCTION_82_3();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  uint64_t v5 = OUTLINED_FUNCTION_75_4();
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t sub_21D8F1DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  v28[0] = 0x20504F5244;
  v28[1] = 0xE500000000000000;
  sub_21D9154F8();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = 0x20504F5244;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  *(void *)(inited + 56) = v7;
  if (a4)
  {
    long long v8 = xmmword_21D919F60;
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v10 = &protocol witness table for Expression<A>;
  }
  else
  {
    *(double *)&long long v8 = OUTLINED_FUNCTION_85_5();
  }
  *(void *)(inited + 96) = v7;
  *(void *)(inited + 104) = v10;
  *(_OWORD *)(inited + 72) = v8;
  *(void *)(inited + 88) = v9;
  sub_21D8ED07C(a3, inited + 112);
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  for (uint64_t i = 32; i != 152; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v28, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v28, (uint64_t)&v25);
    if (v26)
    {
      sub_21D861760(&v25, (uint64_t)v27);
      sub_21D861760(v27, (uint64_t)&v25);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_38_9();
        uint64_t v11 = v23;
      }
      OUTLINED_FUNCTION_101_2();
      if (v22)
      {
        sub_21D8EC9B8(v21 > 1, a4, 1, v11);
        uint64_t v11 = (char *)v13;
      }
      OUTLINED_FUNCTION_99_2(v13, v14, v15, v16, v17, v18, v19, v20, v25);
    }
    else
    {
      sub_21D861B48((uint64_t)&v25, &qword_26AD30EC0);
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_7((uint64_t)v11, v28);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_10(v28);
  OUTLINED_FUNCTION_82_3();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return OUTLINED_FUNCTION_75_4();
}

uint64_t sub_21D8F1FB4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  v22[0] = 0x20504F5244;
  v22[1] = 0xE500000000000000;
  sub_21D9154F8();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = 0x20504F5244;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  *(void *)(inited + 56) = v7;
  if (a4)
  {
    long long v8 = xmmword_21D919F60;
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v10 = &protocol witness table for Expression<A>;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    long long v8 = 0uLL;
  }
  *(void *)(inited + 96) = v7;
  *(void *)(inited + 104) = v10;
  *(_OWORD *)(inited + 72) = v8;
  *(void *)(inited + 88) = v9;
  sub_21D8ED07C(a3, inited + 112);
  uint64_t v11 = MEMORY[0x263F8EE78];
  for (uint64_t i = 32; i != 152; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v22, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v22, (uint64_t)&v19);
    if (v20)
    {
      sub_21D861760(&v19, (uint64_t)v21);
      sub_21D861760(v21, (uint64_t)&v19);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21D8EC9B8(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
        uint64_t v11 = v15;
      }
      unint64_t v14 = *(void *)(v11 + 16);
      unint64_t v13 = *(void *)(v11 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_21D8EC9B8(v13 > 1, v14 + 1, 1, (char *)v11);
        uint64_t v11 = v16;
      }
      *(void *)(v11 + 16) = v14 + 1;
      sub_21D861760(&v19, v11 + 40 * v14 + 32);
    }
    else
    {
      sub_21D861B48((uint64_t)&v19, &qword_26AD30EC0);
    }
  }
  swift_bridgeObjectRelease();
  sub_21D907F44(v11, v22);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v22, v22[3]);
  uint64_t countAndFlagsBits = Expressible.asSQL()()._countAndFlagsBits;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return countAndFlagsBits;
}

void Table.create(temporary:ifNotExists:withoutRowid:block:)()
{
  OUTLINED_FUNCTION_11_0();
  char v1 = v0;
  char v3 = v2;
  OUTLINED_FUNCTION_40_7(v43);
  type metadata accessor for TableBuilder();
  *(void *)(swift_allocObject() + 16) = MEMORY[0x263F8EE78];
  v1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  uint64_t v5 = v45;
  uint64_t v6 = v46;
  if (v44)
  {
    uint64_t v7 = v43[4];
    uint64_t v8 = v44;
  }
  else
  {
    uint64_t v7 = v43[2];
    uint64_t v8 = v43[3];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21D908300(34, 0xE100000000000000, v7, v8);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
    uint64_t v36 = v11;
    uint64_t v12 = swift_initStackObject();
    *(_OWORD *)(v12 + 16) = xmmword_21D917D30;
    char v13 = v3;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    *(void *)(v12 + 56) = v14;
    *(void *)(v12 + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21D908300(34, 0xE100000000000000, v5, v6);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    *(void *)(v12 + 32) = v15;
    *(void *)(v12 + 40) = v17;
    uint64_t v18 = MEMORY[0x263F8EE78];
    *(void *)(v12 + 48) = MEMORY[0x263F8EE78];
    *(void *)(v12 + 96) = v14;
    *(void *)(v12 + 104) = &protocol witness table for Expression<A>;
    *(void *)(v12 + 72) = v9;
    *(void *)(v12 + 80) = v36;
    char v3 = v13;
    *(void *)(v12 + 88) = v18;
    OUTLINED_FUNCTION_61_5(v40);
    swift_setDeallocating();
    sub_21D8ECF90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    v42 = &protocol witness table for Expression<A>;
    swift_bridgeObjectRelease();
    v40[0] = v9;
    v40[1] = v11;
    v40[2] = MEMORY[0x263F8EE78];
  }
  uint64_t v19 = OUTLINED_FUNCTION_124_1();
  sub_21D8F25EC(v19, v20, v21, v22, v23, v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 96) = v25;
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  uint64_t v26 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_54_6(v26, v40);
  sub_21D8E8498(v40, 0, 0xE000000000000000);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  swift_bridgeObjectRelease();
  if (v3)
  {
    long long v27 = xmmword_21D919F70;
    uint64_t v28 = MEMORY[0x263F8EE78];
    uint64_t v29 = &protocol witness table for Expression<A>;
  }
  else
  {
    uint64_t v25 = 0;
    *(double *)&long long v27 = OUTLINED_FUNCTION_85_5();
  }
  *(void *)(inited + 136) = v25;
  *(void *)(inited + 144) = v29;
  *(_OWORD *)(inited + 112) = v27;
  uint64_t v30 = 32;
  *(void *)(inited + 128) = v28;
  uint64_t v31 = MEMORY[0x263F8EE78];
  do
  {
    sub_21D8F9A0C(inited + v30, (uint64_t)v40, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v40, (uint64_t)&v37);
    if (v38)
    {
      sub_21D861760(&v37, (uint64_t)v39);
      sub_21D861760(v39, (uint64_t)&v37);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_38_9();
        uint64_t v31 = v34;
      }
      unint64_t v33 = *(void *)(v31 + 16);
      unint64_t v32 = *(void *)(v31 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_21D8EC9B8(v32 > 1, v33 + 1, 1, (char *)v31);
        uint64_t v31 = v35;
      }
      *(void *)(v31 + 16) = v33 + 1;
      sub_21D861760(&v37, v31 + 40 * v33 + 32);
    }
    else
    {
      sub_21D861B48((uint64_t)&v37, &qword_26AD30EC0);
    }
    v30 += 40;
  }
  while (v30 != 152);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_7(v31, v40);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v40, v41);
  OUTLINED_FUNCTION_81_4();
  Expressible.asSQL()();
  OUTLINED_FUNCTION_134_0();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  OUTLINED_FUNCTION_81_4();
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_21D8F25EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, char a5@<W4>, uint64_t *a6@<X8>)
{
  int v11 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AC0;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = 0x455441455243;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  *(void *)(inited + 56) = v13;
  if (v11 == 2)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v15 = 0x5241524F504D4554;
    if ((v11 & 1) == 0) {
      uint64_t v15 = 0x455551494E55;
    }
    unint64_t v16 = 0xE900000000000059;
    if ((v11 & 1) == 0) {
      unint64_t v16 = 0xE600000000000000;
    }
    uint64_t v19 = &protocol witness table for Expression<A>;
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t v18 = v13;
  }
  *(void *)(inited + 72) = v15;
  *(void *)(inited + 80) = v16;
  *(void *)(inited + 88) = v17;
  *(void *)(inited + 96) = v18;
  *(void *)(inited + 136) = v13;
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  *(void *)(inited + 104) = v19;
  *(void *)(inited + 112) = a1;
  *(void *)(inited + 120) = a2;
  *(void *)(inited + 128) = v14;
  if (a5)
  {
    long long v20 = xmmword_21D919F80;
    uint64_t v21 = MEMORY[0x263F8EE78];
    unsigned __int8 v22 = &protocol witness table for Expression<A>;
  }
  else
  {
    *(double *)&long long v20 = OUTLINED_FUNCTION_85_5();
  }
  *(void *)(inited + 176) = v13;
  *(void *)(inited + 184) = v22;
  *(_OWORD *)(inited + 152) = v20;
  *(void *)(inited + 168) = v21;
  sub_21D8ED07C(a3, inited + 192);
  swift_bridgeObjectRetain();
  uint64_t v23 = MEMORY[0x263F8EE78];
  for (uint64_t i = 32; i != 232; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v33, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v33, (uint64_t)&v30);
    if (v31)
    {
      sub_21D861760(&v30, (uint64_t)v32);
      sub_21D861760(v32, (uint64_t)&v30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_43_6();
        uint64_t v23 = v27;
      }
      unint64_t v26 = *(void *)(v23 + 16);
      unint64_t v25 = *(void *)(v23 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_21D8EC9B8(v25 > 1, v26 + 1, 1, (char *)v23);
        uint64_t v23 = v28;
      }
      *(void *)(v23 + 16) = v26 + 1;
      sub_21D861760(&v30, v23 + 40 * v26 + 32);
    }
    else
    {
      sub_21D861B48((uint64_t)&v30, &qword_26AD30EC0);
    }
  }
  swift_setDeallocating();
  sub_21D8ECF9C();
  OUTLINED_FUNCTION_2_7(v23, a6);
  return swift_bridgeObjectRelease();
}

void Table.create(_:temporary:ifNotExists:)()
{
}

void Table.addColumn<A>(_:check:defaultValue:)()
{
  OUTLINED_FUNCTION_11_0();
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v63 = v6;
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  uint64_t v10 = v7[2];
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  uint64_t v14 = v11[2];
  OUTLINED_FUNCTION_27_7(v1);
  uint64_t v93 = OUTLINED_FUNCTION_11_8();
  v94 = &protocol witness table for Expression<A>;
  uint64_t v90 = v9;
  uint64_t v91 = v8;
  uint64_t v92 = v10;
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v16 = v15(v5, v3);
  uint64_t v18 = v17;
  OUTLINED_FUNCTION_114_2();
  if (v12)
  {
    uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F258);
    v88 = &protocol witness table for Expression<A>;
    uint64_t v84 = v13;
    uint64_t v85 = v12;
    uint64_t v86 = v14;
  }
  else
  {
    OUTLINED_FUNCTION_32_8();
  }
  OUTLINED_FUNCTION_109_1(*(void *)(v3 + 8), v49, v54, v59, v63, v67, v70, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75, *((uint64_t *)&v75 + 1), v76, *((uint64_t *)&v76 + 1), v77, *((uint64_t *)&v77 + 1), v78, v79,
    v80,
    v81,
    v82,
    v83);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_88_1();
  v19();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  sub_21D8ED0DC(v13, v12);
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_102_3(v20, v16, v18, v21, v22, v23, v24, v50, v55);
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_21D861B48((uint64_t)&v73, &qword_267D15A68);
  uint64_t v33 = OUTLINED_FUNCTION_108_2(v25, v26, v27, v28, v29, v30, v31, v32, v51, v56, v60, v64, 0, 3, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75,
          *((uint64_t *)&v75 + 1),
          v76,
          *((uint64_t *)&v76 + 1),
          v77,
          *((uint64_t *)&v77 + 1),
          v78,
          v79);
  OUTLINED_FUNCTION_30_8(v33, v34, v35, v36, v37, v38, v39, v40, v52, v57, v61, v65, v68, v71, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75,
    *((uint64_t *)&v75 + 1),
    v76,
    *((uint64_t *)&v76 + 1),
    v77,
    *((uint64_t *)&v77 + 1),
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84);
  uint64_t v41 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
  OUTLINED_FUNCTION_96_2(v41, v42, v43, v44, v45, v46, v47, v48, v53, v58, v62, v66, v69, v72, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75,
    *((uint64_t *)&v75 + 1),
    v76,
    *((uint64_t *)&v76 + 1),
    v77,
    *((uint64_t *)&v77 + 1),
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    (uint64_t)v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    (uint64_t)v94,
    v95[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_12_0();
}

{
  const void *v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _UNKNOWN **v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _UNKNOWN **v94;
  char v95[216];

  OUTLINED_FUNCTION_11_0();
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v63 = v6;
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  uint64_t v10 = v7[2];
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  uint64_t v14 = v11[2];
  OUTLINED_FUNCTION_27_7(v1);
  uint64_t v93 = OUTLINED_FUNCTION_11_8();
  v94 = &protocol witness table for Expression<A>;
  uint64_t v90 = v9;
  uint64_t v91 = v8;
  uint64_t v92 = v10;
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v16 = v15(v5, v3);
  uint64_t v18 = v17;
  OUTLINED_FUNCTION_114_2();
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  v88 = &protocol witness table for Expression<A>;
  uint64_t v84 = v13;
  uint64_t v85 = v12;
  uint64_t v86 = v14;
  OUTLINED_FUNCTION_109_1(*(void *)(v3 + 8), v49, v54, v59, v63, v67, v70, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75, *((uint64_t *)&v75 + 1), v76, *((uint64_t *)&v76 + 1), v77, *((uint64_t *)&v77 + 1), v78, v79,
    v80,
    v81,
    v82,
    v83);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_88_1();
  v19();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_102_3(v20, v16, v18, v21, v22, v23, v24, v50, v55);
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_21D861B48((uint64_t)&v73, &qword_267D15A68);
  uint64_t v33 = OUTLINED_FUNCTION_108_2(v25, v26, v27, v28, v29, v30, v31, v32, v51, v56, v60, v64, 0, 3, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75,
          *((uint64_t *)&v75 + 1),
          v76,
          *((uint64_t *)&v76 + 1),
          v77,
          *((uint64_t *)&v77 + 1),
          v78,
          v79);
  OUTLINED_FUNCTION_30_8(v33, v34, v35, v36, v37, v38, v39, v40, v52, v57, v61, v65, v68, v71, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75,
    *((uint64_t *)&v75 + 1),
    v76,
    *((uint64_t *)&v76 + 1),
    v77,
    *((uint64_t *)&v77 + 1),
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84);
  uint64_t v41 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
  OUTLINED_FUNCTION_96_2(v41, v42, v43, v44, v45, v46, v47, v48, v53, v58, v62, v66, v69, v72, v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75,
    *((uint64_t *)&v75 + 1),
    v76,
    *((uint64_t *)&v76 + 1),
    v77,
    *((uint64_t *)&v77 + 1),
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    (uint64_t)v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    (uint64_t)v94,
    v95[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_12_0();
}

{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void);
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  void (*v26)(void);
  char v27;
  uint64_t v28;
  void (*v29)(void);
  uint64_t v30;
  __n128 *v31;
  uint64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  unsigned char v43[80];
  long long v44;
  long long v45;
  uint64_t v46;
  long long v47;
  long long v48;
  _UNKNOWN **v49;
  char v50;
  void v51[5];
  unsigned char v52[40];
  unsigned char v53[168];

  OUTLINED_FUNCTION_11_0();
  uint64_t v40 = v1;
  uint64_t v41 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = (const void *)sub_21D9158C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v42 = v11;
  OUTLINED_FUNCTION_40_6();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v16 = *v9;
  uint64_t v15 = v9[1];
  uint64_t v17 = v9[2];
  uint64_t v18 = v7[1];
  uint64_t v39 = *v7;
  uint64_t v19 = v7[2];
  memcpy(v53, v41, sizeof(v53));
  uint64_t v41 = v10;
  v51[3] = type metadata accessor for Expression();
  v51[4] = &protocol witness table for Expression<A>;
  v51[0] = v16;
  v51[1] = v15;
  v51[2] = v17;
  uint64_t v20 = *(uint64_t (**)(void))(v3 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_66_6();
  uint64_t v21 = (uint64_t *)v20();
  uint64_t v37 = v22;
  uint64_t v38 = v21;
  uint64_t v50 = 2;
  if (v18)
  {
    *((void *)&v48 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F258);
    uint64_t v49 = &protocol witness table for Expression<A>;
    uint64_t v23 = v39;
    *(void *)&uint64_t v47 = v39;
    *((void *)&v47 + 1) = v18;
    *(void *)&uint64_t v48 = v19;
  }
  else
  {
    uint64_t v23 = v39;
    uint64_t v49 = 0;
    uint64_t v47 = 0u;
    uint64_t v48 = 0u;
  }
  uint64_t v24 = v41;
  uint64_t v25 = v42;
  OUTLINED_FUNCTION_24();
  v26();
  OUTLINED_FUNCTION_65_8((uint64_t)v14);
  if (v27)
  {
    sub_21D8ED0DC(v23, v18);
    (*(void (**)(char *, const void *))(v25 + 8))(v14, v24);
    uint64_t v46 = 0;
    uint64_t v44 = 0u;
    uint64_t v45 = 0u;
  }
  else
  {
    uint64_t v28 = *(void *)(v3 + 8);
    *((void *)&v45 + 1) = v5;
    uint64_t v46 = v28;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    OUTLINED_FUNCTION_13_10();
    OUTLINED_FUNCTION_60_8();
    v29();
    sub_21D8ED0DC(v23, v18);
  }
  uint64_t v30 = v37;
  memset(&v43[16], 0, 64);
  uint64_t v31 = OUTLINED_FUNCTION_47_6((__n128)xmmword_21D919F90, (__n128)0);
  OUTLINED_FUNCTION_133_0((uint64_t)v31, v32, v30, v33, v34, v35, v36, v37, v38);
  swift_bridgeObjectRelease();
  sub_21D861B48((uint64_t)v43, &qword_267D15A68);
  sub_21D861B48((uint64_t)&v44, &qword_26AD30EC0);
  sub_21D861B48((uint64_t)&v47, &qword_26AD30EC0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  sub_21D8F2E90((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
  OUTLINED_FUNCTION_62_7();
  OUTLINED_FUNCTION_12_0();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(void);
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  void (*v31)(void);
  __n128 *v32;
  unsigned __int8 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned char v43[80];
  long long v44;
  long long v45;
  uint64_t v46;
  void v47[5];
  char v48;
  void v49[5];
  unsigned char v50[40];
  unsigned char v51[168];

  OUTLINED_FUNCTION_11_0();
  uint64_t v38 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v42 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_21D9158C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v41 = v11;
  OUTLINED_FUNCTION_40_6();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = *v9;
  uint64_t v16 = v9[1];
  uint64_t v17 = v9[2];
  uint64_t v18 = *v7;
  uint64_t v19 = v7[1];
  uint64_t v39 = v7[2];
  uint64_t v40 = v18;
  memcpy(v51, v38, sizeof(v51));
  v49[3] = type metadata accessor for Expression();
  v49[4] = &protocol witness table for Expression<A>;
  v49[0] = v15;
  v49[1] = v16;
  v49[2] = v17;
  uint64_t v20 = *(uint64_t (**)(uint64_t))(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = OUTLINED_FUNCTION_128_0();
  uint64_t v22 = v20(v21);
  uint64_t v23 = v41;
  uint64_t v24 = v22;
  uint64_t v26 = v25;
  uint64_t v48 = 2;
  v47[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  v47[4] = &protocol witness table for Expression<A>;
  v47[0] = v40;
  v47[1] = v19;
  v47[2] = v39;
  OUTLINED_FUNCTION_24();
  v27();
  OUTLINED_FUNCTION_65_8((uint64_t)v14);
  if (v28)
  {
    uint64_t v29 = *(void (**)(char *, uint64_t))(v23 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v14, v10);
    uint64_t v46 = 0;
    uint64_t v44 = 0u;
    uint64_t v45 = 0u;
  }
  else
  {
    uint64_t v30 = *(void *)(v2 + 8);
    *((void *)&v45 + 1) = v4;
    uint64_t v46 = v30;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    OUTLINED_FUNCTION_13_10();
    OUTLINED_FUNCTION_60_8();
    v31();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  memset(&v43[16], 0, 64);
  uint64_t v32 = OUTLINED_FUNCTION_47_6((__n128)xmmword_21D919F90, (__n128)0);
  OUTLINED_FUNCTION_133_0((uint64_t)v32, v24, v26, v33, v34, v35, v36, v37, v38);
  swift_bridgeObjectRelease();
  sub_21D861B48((uint64_t)v43, &qword_267D15A68);
  sub_21D861B48((uint64_t)&v44, &qword_26AD30EC0);
  sub_21D861B48((uint64_t)v47, &qword_26AD30EC0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  sub_21D8F2E90((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  OUTLINED_FUNCTION_62_7();
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_21D8F29DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t *a11)
{
  int v18 = *a4;
  unint64_t v19 = a11[1];
  uint64_t v45 = *a11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919FA0;
  sub_21D8ED07C(a1, inited + 32);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  uint64_t v22 = v21;
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = a2;
  *(void *)(inited + 80) = a3;
  *(void *)(inited + 88) = MEMORY[0x263F8EE78];
  *(void *)(inited + 96) = v21;
  if (v18 == 2)
  {
    unint64_t v23 = 0;
    unint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
  }
  else
  {
    unint64_t v23 = 0xD000000000000019;
    if ((v18 & 1) == 0) {
      unint64_t v23 = 0x205952414D495250;
    }
    unint64_t v24 = 0x800000021D91C830;
    if ((v18 & 1) == 0) {
      unint64_t v24 = 0xEB0000000059454BLL;
    }
    uint64_t v27 = &protocol witness table for Expression<A>;
    uint64_t v25 = MEMORY[0x263F8EE78];
    uint64_t v26 = v21;
  }
  *(void *)(inited + 112) = v23;
  *(void *)(inited + 120) = v24;
  *(void *)(inited + 128) = v25;
  *(void *)(inited + 136) = v26;
  *(void *)(inited + 144) = v27;
  uint64_t v28 = &protocol witness table for Expression<A>;
  uint64_t v29 = MEMORY[0x263F8EE78];
  if (a5)
  {
    uint64_t v30 = 0;
    unint64_t v31 = 0;
    uint64_t v29 = 0;
    uint64_t v32 = 0;
    uint64_t v28 = 0;
  }
  else
  {
    unint64_t v31 = 0xE800000000000000;
    uint64_t v30 = 0x4C4C554E20544F4ELL;
    uint64_t v32 = v21;
  }
  *(void *)(inited + 152) = v30;
  *(void *)(inited + 160) = v31;
  *(void *)(inited + 168) = v29;
  *(void *)(inited + 176) = v32;
  *(void *)(inited + 184) = v28;
  if (a6)
  {
    long long v33 = xmmword_21D919FB0;
    uint64_t v34 = MEMORY[0x263F8EE78];
    uint64_t v35 = &protocol witness table for Expression<A>;
    uint64_t v36 = v21;
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v35 = 0;
    uint64_t v34 = 0;
    long long v33 = 0uLL;
  }
  *(void *)(inited + 216) = v36;
  *(void *)(inited + 224) = v35;
  *(_OWORD *)(inited + 192) = v33;
  *(void *)(inited + 208) = v34;
  sub_21D8F9A0C(a7, (uint64_t)&v50, &qword_26AD30EC0);
  if (v51)
  {
    sub_21D861760(&v50, (uint64_t)v49);
    swift_bridgeObjectRetain();
    sub_21D8F8D78((uint64_t)v49, (uint64_t *)(inited + 232));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  }
  else
  {
    *(void *)(inited + 264) = 0;
    *(_OWORD *)(inited + 232) = 0u;
    *(_OWORD *)(inited + 248) = 0u;
    swift_bridgeObjectRetain();
  }
  sub_21D8F9A0C(a8, (uint64_t)&v50, &qword_26AD30EC0);
  if (v51)
  {
    sub_21D861760(&v50, (uint64_t)v49);
    *(void *)&long long v47 = 0x544C5541464544;
    *((void *)&v47 + 1) = 0xE700000000000000;
    sub_21D9154F8();
    *(void *)(inited + 296) = v22;
    *(void *)(inited + 304) = &protocol witness table for Expression<A>;
    sub_21D8E8498(v49, 0x544C5541464544, 0xE700000000000000);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  }
  else
  {
    *(void *)(inited + 304) = 0;
    *(_OWORD *)(inited + 272) = 0u;
    *(_OWORD *)(inited + 288) = 0u;
  }
  sub_21D8F19C8(a10, inited + 312);
  if (v19 == 3)
  {
    *(void *)(inited + 384) = 0;
    *(_OWORD *)(inited + 352) = 0u;
    *(_OWORD *)(inited + 368) = 0u;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
    uint64_t v37 = swift_initStackObject();
    *(_OWORD *)(v37 + 16) = xmmword_21D917D30;
    *(void *)(v37 + 32) = 0x4554414C4C4F43;
    *(void *)(v37 + 40) = 0xE700000000000000;
    *(void *)(v37 + 56) = v22;
    *(void *)(v37 + 48) = MEMORY[0x263F8EE78];
    *(void *)(v37 + 96) = &type metadata for Collation;
    *(void *)(v37 + 104) = &protocol witness table for Collation;
    *(void *)(v37 + 64) = &protocol witness table for Expression<A>;
    *(void *)(v37 + 72) = v45;
    *(void *)(v37 + 80) = v19;
    sub_21D8F8ECC(v45, v19);
    sub_21D907F44(v37, (uint64_t *)(inited + 352));
    swift_setDeallocating();
    sub_21D8ECF90();
  }
  uint64_t v38 = MEMORY[0x263F8EE78];
  for (uint64_t i = 32; i != 392; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)&v50, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)&v50, (uint64_t)&v47);
    if (v48)
    {
      sub_21D861760(&v47, (uint64_t)v49);
      sub_21D861760(v49, (uint64_t)&v47);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21D8EC9B8(0, *(void *)(v38 + 16) + 1, 1, (char *)v38);
        uint64_t v38 = v42;
      }
      unint64_t v41 = *(void *)(v38 + 16);
      unint64_t v40 = *(void *)(v38 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_21D8EC9B8(v40 > 1, v41 + 1, 1, (char *)v38);
        uint64_t v38 = v43;
      }
      *(void *)(v38 + 16) = v41 + 1;
      sub_21D861760(&v47, v38 + 40 * v41 + 32);
    }
    else
    {
      sub_21D861B48((uint64_t)&v47, &qword_26AD30EC0);
    }
  }
  swift_setDeallocating();
  sub_21D8ECF9C();
  sub_21D907F44(v38, a9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8F2E90(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v7 = v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919A90;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = 0x4154205245544C41;
  *(void *)(inited + 40) = 0xEB00000000454C42;
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  *(void *)(inited + 56) = v10;
  if (v6)
  {
    uint64_t v4 = v6;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = v3;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_21D908300(34, 0xE100000000000000, v5, v4);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (v7)
  {
    uint64_t v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_21D917D30;
    *(void *)(v14 + 56) = v10;
    *(void *)(v14 + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21D908300(34, 0xE100000000000000, v8, v7);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    uint64_t v18 = MEMORY[0x263F8EE78];
    *(void *)(v14 + 48) = MEMORY[0x263F8EE78];
    *(void *)(v14 + 96) = v10;
    *(void *)(v14 + 104) = &protocol witness table for Expression<A>;
    *(void *)(v14 + 72) = v11;
    *(void *)(v14 + 80) = v13;
    *(void *)(v14 + 88) = v18;
    sub_21D907F44(v14, (uint64_t *)(inited + 72));
    swift_setDeallocating();
    sub_21D8ECF90();
  }
  else
  {
    *(void *)(inited + 96) = v10;
    *(void *)(inited + 104) = &protocol witness table for Expression<A>;
    *(void *)(inited + 72) = v11;
    *(void *)(inited + 80) = v13;
    uint64_t v18 = MEMORY[0x263F8EE78];
    *(void *)(inited + 88) = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  *(void *)(inited + 136) = v10;
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  *(void *)(inited + 112) = 0x554C4F4320444441;
  *(void *)(inited + 120) = 0xEA00000000004E4DLL;
  *(void *)(inited + 128) = v18;
  sub_21D8ED07C(a1, inited + 152);
  sub_21D907F44(inited, v21);
  swift_setDeallocating();
  sub_21D8ECF90();
  __swift_project_boxed_opaque_existential_1(v21, v21[3]);
  uint64_t countAndFlagsBits = Expressible.asSQL()()._countAndFlagsBits;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return countAndFlagsBits;
}

void Table.addColumn<A>(_:unique:check:references:_:)()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_118_1();
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v60 = *v11;
  uint64_t v63 = v10;
  uint64_t v66 = v11[1];
  uint64_t v69 = v11[2];
  OUTLINED_FUNCTION_27_7(v12);
  uint64_t v13 = OUTLINED_FUNCTION_11_8();
  uint64_t v102 = v13;
  v103 = &protocol witness table for Expression<A>;
  uint64_t v99 = v4;
  uint64_t v100 = v3;
  uint64_t v101 = v5;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v0, v1);
  OUTLINED_FUNCTION_115_2();
  if (v8)
  {
    *((void *)&v96 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F258);
    v97 = &protocol witness table for Expression<A>;
    *(void *)&long long v95 = v7;
    *((void *)&v95 + 1) = v8;
    *(void *)&long long v96 = v9;
  }
  else
  {
    v97 = 0;
    long long v95 = 0u;
    long long v96 = 0u;
  }
  OUTLINED_FUNCTION_46_7();
  sub_21D8ED07C(v63, v15);
  OUTLINED_FUNCTION_89_5();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_44_9();
  OUTLINED_FUNCTION_80_6();
  sub_21D8F29DC(v16, v17, v18, v19, v20, v21, v22, v23, v24, v49, v53);
  uint64_t v25 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_5(v25, v26, v27, v28, v29, v30, v31, v32, v50, v54, v57, v60, v63, v66, v69, v72, 0, 3, v79,
    v80,
    v81,
    v82,
    v83,
    v60,
    v66,
    v69,
    v13,
    (uint64_t)&protocol witness table for Expression<A>,
    v89);
  uint64_t v33 = sub_21D861B48((uint64_t)&v79, &qword_267D15A68);
  OUTLINED_FUNCTION_123_1(v33, v34, v35, v36, v37, v38, v39, v40, v51, v55, v58, v61, v64, v67, v70, v73, v75, v77, v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    v95);
  uint64_t v41 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v99);
  OUTLINED_FUNCTION_119_1(v41, v42, v43, v44, v45, v46, v47, v48, v52, v56, v59, v62, v65, v68, v71, v74, v76, v78, v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    v95,
    *((uint64_t *)&v95 + 1),
    v96,
    *((uint64_t *)&v96 + 1),
    (uint64_t)v97,
    v98,
    v99,
    v100,
    v101,
    v102,
    (uint64_t)v103,
    v104[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  OUTLINED_FUNCTION_57_7();
  OUTLINED_FUNCTION_12_0();
}

{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  long long v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _UNKNOWN **v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _UNKNOWN **v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _UNKNOWN **v97;
  char v98[40];
  uint64_t v99;

  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  HIDWORD(v67) = v2;
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v8 = v7[1];
  uint64_t v9 = v7[2];
  uint64_t v61 = *v11;
  uint64_t v64 = v10;
  uint64_t v52 = *v7;
  uint64_t v55 = v11[1];
  uint64_t v58 = v11[2];
  OUTLINED_FUNCTION_40_7(&v99);
  long long v96 = OUTLINED_FUNCTION_112_2();
  v97 = &protocol witness table for Expression<A>;
  uint64_t v93 = v4;
  uint64_t v94 = v5;
  long long v95 = v6;
  uint64_t v12 = *(void (**)(void))(v1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_66_6();
  v12();
  OUTLINED_FUNCTION_115_2();
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  uint64_t v91 = &protocol witness table for Expression<A>;
  uint64_t v87 = v52;
  uint64_t v88 = v8;
  uint64_t v89 = v9;
  OUTLINED_FUNCTION_46_7();
  sub_21D8ED07C(v64, v13);
  uint64_t v79 = v96;
  uint64_t v80 = &protocol witness table for Expression<A>;
  uint64_t v76 = v61;
  uint64_t v77 = v55;
  uint64_t v78 = v58;
  uint64_t v70 = xmmword_21D919F90;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_80_6();
  sub_21D8F29DC(v14, v15, v16, v17, v18, SBYTE4(v67), v19, v20, v21, v6, (uint64_t *)&v70);
  uint64_t v22 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_5(v22, v23, v24, v25, v26, v27, v28, v29, v46, v49, v52, v55, v58, v61, v64, v67, v70, *((uint64_t *)&v70 + 1), v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    v77,
    v78,
    v79,
    (uint64_t)v80,
    v81);
  uint64_t v30 = sub_21D861B48((uint64_t)&v71, &qword_267D15A68);
  OUTLINED_FUNCTION_123_1(v30, v31, v32, v33, v34, v35, v36, v37, v47, v50, v53, v56, v59, v62, v65, v68, v70, *((uint64_t *)&v70 + 1), v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    v77,
    v78,
    v79,
    (uint64_t)v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87);
  uint64_t v38 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v93);
  OUTLINED_FUNCTION_119_1(v38, v39, v40, v41, v42, v43, v44, v45, v48, v51, v54, v57, v60, v63, v66, v69, v70, *((uint64_t *)&v70 + 1), v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    v77,
    v78,
    v79,
    (uint64_t)v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    (uint64_t)v91,
    v92,
    v93,
    v94,
    v95,
    v96,
    (uint64_t)v97,
    v98[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  OUTLINED_FUNCTION_57_7();
  OUTLINED_FUNCTION_12_0();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  const void *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  long long v94;
  long long v95;
  _UNKNOWN **v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _UNKNOWN **v102;
  char v103[216];

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_118_1();
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v62 = *v10;
  uint64_t v65 = v9;
  uint64_t v59 = v10[1];
  uint64_t v68 = v10[2];
  OUTLINED_FUNCTION_27_7(v11);
  OUTLINED_FUNCTION_72_6();
  uint64_t v101 = OUTLINED_FUNCTION_18_8();
  uint64_t v102 = &protocol witness table for Expression<A>;
  uint64_t v98 = v2;
  uint64_t v99 = v3;
  uint64_t v100 = v4;
  uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = OUTLINED_FUNCTION_128_0();
  uint64_t v14 = v12(v13);
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_115_2();
  if (v7)
  {
    *((void *)&v95 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F258);
    long long v96 = &protocol witness table for Expression<A>;
    *(void *)&uint64_t v94 = v6;
    *((void *)&v94 + 1) = v7;
    *(void *)&long long v95 = v8;
  }
  else
  {
    long long v96 = 0;
    uint64_t v94 = 0u;
    long long v95 = 0u;
  }
  OUTLINED_FUNCTION_46_7();
  sub_21D8ED07C(v65, v17);
  uint64_t v86 = OUTLINED_FUNCTION_11_8();
  OUTLINED_FUNCTION_89_5();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_44_9();
  sub_21D8F29DC(v18, v14, v16, v19, 1, v20, v21, v22, v23, v48, v52);
  unint64_t v24 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_5(v24, v25, v26, v27, v28, v29, v30, v31, v49, v53, v56, v59, v62, v65, v68, v71, 0, 3, v78,
    v79,
    v80,
    v81,
    v82,
    v62,
    v59,
    v68,
    v86,
    (uint64_t)&protocol witness table for Expression<A>,
    v88);
  uint64_t v32 = sub_21D861B48((uint64_t)&v78, &qword_267D15A68);
  OUTLINED_FUNCTION_123_1(v32, v33, v34, v35, v36, v37, v38, v39, v50, v54, v57, v60, v63, v66, v69, v72, v74, v76, v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94);
  uint64_t v40 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v98);
  OUTLINED_FUNCTION_119_1(v40, v41, v42, v43, v44, v45, v46, v47, v51, v55, v58, v61, v64, v67, v70, v73, v75, v77, v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    *((uint64_t *)&v94 + 1),
    v95,
    *((uint64_t *)&v95 + 1),
    (uint64_t)v96,
    v97,
    v98,
    v99,
    v100,
    v101,
    (uint64_t)v102,
    v103[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v103);
  OUTLINED_FUNCTION_57_7();
  OUTLINED_FUNCTION_12_0();
}

{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  long long v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _UNKNOWN **v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _UNKNOWN **v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _UNKNOWN **v94;
  uint64_t v95[27];

  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = v1;
  HIDWORD(v64) = v3;
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = v4[2];
  uint64_t v9 = v8[1];
  uint64_t v52 = *v8;
  uint64_t v55 = v10;
  uint64_t v11 = v8[2];
  uint64_t v13 = v12[1];
  uint64_t v58 = v12[2];
  uint64_t v61 = *v12;
  OUTLINED_FUNCTION_27_7(v0);
  OUTLINED_FUNCTION_72_6();
  uint64_t v93 = OUTLINED_FUNCTION_18_8();
  uint64_t v94 = &protocol witness table for Expression<A>;
  uint64_t v90 = v5;
  uint64_t v91 = v6;
  uint64_t v92 = v7;
  uint64_t v14 = *(uint64_t (**)(void))(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_83_6();
  uint64_t v15 = v14();
  uint64_t v17 = v16;
  OUTLINED_FUNCTION_115_2();
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  uint64_t v88 = &protocol witness table for Expression<A>;
  uint64_t v84 = v52;
  uint64_t v85 = v9;
  uint64_t v86 = v11;
  OUTLINED_FUNCTION_45_6();
  sub_21D8ED07C(v18, (uint64_t)&v68);
  uint64_t v76 = OUTLINED_FUNCTION_11_8();
  uint64_t v77 = &protocol witness table for Expression<A>;
  uint64_t v73 = v61;
  uint64_t v74 = v13;
  uint64_t v75 = v58;
  uint64_t v67 = xmmword_21D919F90;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8F29DC((uint64_t)&v90, v15, v17, (unsigned __int8 *)&v89 + 7, 1, SBYTE4(v64), (uint64_t)&v84, (uint64_t)&v78, v95, (uint64_t)&v68, (uint64_t *)&v67);
  unint64_t v19 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_5(v19, v20, v21, v22, v23, v24, v25, v26, v43, v46, v49, v52, v55, v58, v61, v64, v67, *((uint64_t *)&v67 + 1), v68,
    v69,
    v70,
    v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    (uint64_t)v77,
    v78);
  uint64_t v27 = sub_21D861B48((uint64_t)&v68, &qword_267D15A68);
  OUTLINED_FUNCTION_123_1(v27, v28, v29, v30, v31, v32, v33, v34, v44, v47, v50, v53, v56, v59, v62, v65, v67, *((uint64_t *)&v67 + 1), v68,
    v69,
    v70,
    v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    (uint64_t)v77,
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84);
  uint64_t v35 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
  OUTLINED_FUNCTION_119_1(v35, v36, v37, v38, v39, v40, v41, v42, v45, v48, v51, v54, v57, v60, v63, v66, v67, *((uint64_t *)&v67 + 1), v68,
    v69,
    v70,
    v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    (uint64_t)v77,
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    (uint64_t)v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    (uint64_t)v94,
    v95[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  OUTLINED_FUNCTION_57_7();
  OUTLINED_FUNCTION_12_0();
}

void Table.addColumn<A>(_:check:defaultValue:collate:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = v1;
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  uint64_t v10 = v7[2];
  unint64_t v12 = v11[1];
  uint64_t v59 = v13;
  uint64_t v63 = *v11;
  OUTLINED_FUNCTION_27_7(v0);
  uint64_t v98 = OUTLINED_FUNCTION_11_8();
  uint64_t v99 = &protocol witness table for Expression<A>;
  uint64_t v95 = v4;
  uint64_t v96 = v5;
  uint64_t v97 = v6;
  uint64_t v14 = *(uint64_t (**)(uint64_t))(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = OUTLINED_FUNCTION_63_8();
  uint64_t v16 = v14(v15);
  uint64_t v18 = v17;
  OUTLINED_FUNCTION_114_2();
  if (v9)
  {
    uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F258);
    uint64_t v93 = &protocol witness table for Expression<A>;
    uint64_t v89 = v8;
    uint64_t v90 = v9;
    uint64_t v91 = v10;
  }
  else
  {
    OUTLINED_FUNCTION_32_8();
  }
  OUTLINED_FUNCTION_109_1(*(void *)(v2 + 8), v49, v54, v59, v63, v67, v70, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84,
    v85,
    v86,
    v87,
    v88);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_88_1();
  v19();
  OUTLINED_FUNCTION_107_2();
  sub_21D8ED0DC(v8, v9);
  sub_21D8F8ECC(v64, v12);
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_102_3(v20, v16, v18, v21, v22, v23, v24, v50, v55);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_6();
  uint64_t v25 = sub_21D861B48((uint64_t)&v73, &qword_267D15A68);
  uint64_t v33 = OUTLINED_FUNCTION_108_2(v25, v26, v27, v28, v29, v30, v31, v32, v51, v56, v60, v64, v64, v12, v73, v74, v75, v76, v77,
          v78,
          v79,
          v80,
          v81,
          v82,
          v83,
          v84);
  OUTLINED_FUNCTION_30_8(v33, v34, v35, v36, v37, v38, v39, v40, v52, v57, v61, v65, v68, v71, v73, v74, v75, v76, v77,
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89);
  uint64_t v41 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v95);
  OUTLINED_FUNCTION_96_2(v41, v42, v43, v44, v45, v46, v47, v48, v53, v58, v62, v66, v69, v72, v73, v74, v75, v76, v77,
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    (uint64_t)v93,
    v94,
    v95,
    v96,
    v97,
    v98,
    (uint64_t)v99,
    v100[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v100);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_12_0();
}

{
  const void *v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _UNKNOWN **v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _UNKNOWN **v101;
  char v102[216];

  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v11 = v10[1];
  uint64_t v61 = *v10;
  uint64_t v65 = v12;
  uint64_t v13 = v10[2];
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  OUTLINED_FUNCTION_27_7(v1);
  uint64_t v100 = OUTLINED_FUNCTION_11_8();
  uint64_t v101 = &protocol witness table for Expression<A>;
  uint64_t v97 = v8;
  uint64_t v98 = v7;
  uint64_t v99 = v9;
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = v17(v5, v3);
  uint64_t v20 = v19;
  OUTLINED_FUNCTION_114_2();
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  uint64_t v95 = &protocol witness table for Expression<A>;
  uint64_t v91 = v61;
  uint64_t v92 = v11;
  uint64_t v93 = v13;
  OUTLINED_FUNCTION_109_1(*(void *)(v3 + 8), v51, v56, v61, v65, v69, v72, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86,
    v87,
    v88,
    v89,
    v90);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_88_1();
  v21();
  OUTLINED_FUNCTION_107_2();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8F8ECC(v15, v16);
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_102_3(v22, v18, v20, v23, v24, v25, v26, v52, v57);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_6();
  uint64_t v27 = sub_21D861B48((uint64_t)&v75, &qword_267D15A68);
  uint64_t v35 = OUTLINED_FUNCTION_108_2(v27, v28, v29, v30, v31, v32, v33, v34, v53, v58, v62, v66, v15, v16, v75, v76, v77, v78, v79,
          v80,
          v81,
          v82,
          v83,
          v84,
          v85,
          v86);
  OUTLINED_FUNCTION_30_8(v35, v36, v37, v38, v39, v40, v41, v42, v54, v59, v63, v67, v70, v73, v75, v76, v77, v78, v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91);
  uint64_t v43 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v97);
  OUTLINED_FUNCTION_96_2(v43, v44, v45, v46, v47, v48, v49, v50, v55, v60, v64, v68, v71, v74, v75, v76, v77, v78, v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    (uint64_t)v95,
    v96,
    v97,
    v98,
    v99,
    v100,
    (uint64_t)v101,
    v102[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v102);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_12_0();
}

{
  const void *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  void (*v25)(void);
  char v26;
  uint64_t v27;
  void (*v28)(void);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const void *v42;
  uint64_t v43;
  uint64_t v44[2];
  unsigned char v45[80];
  long long v46;
  long long v47;
  uint64_t v48;
  long long v49;
  long long v50;
  _UNKNOWN **v51;
  unsigned __int8 v52;
  void v53[5];
  uint64_t v54[5];
  unsigned char v55[168];

  OUTLINED_FUNCTION_11_0();
  uint64_t v41 = v4;
  uint64_t v42 = v0;
  uint64_t v39 = v5;
  uint64_t v6 = (const void *)OUTLINED_FUNCTION_69_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v43 = v7;
  OUTLINED_FUNCTION_40_6();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v34 - v9;
  unint64_t v12 = *v3;
  uint64_t v11 = v3[1];
  uint64_t v13 = v3[2];
  uint64_t v14 = *v1;
  uint64_t v15 = v1[1];
  uint64_t v40 = v1[2];
  uint64_t v37 = *v2;
  uint64_t v38 = v14;
  uint64_t v36 = v2[1];
  memcpy(v55, v42, sizeof(v55));
  uint64_t v42 = v6;
  v53[3] = type metadata accessor for Expression();
  v53[4] = &protocol witness table for Expression<A>;
  v53[0] = v12;
  v53[1] = v11;
  v53[2] = v13;
  uint64_t v16 = v39;
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v39 + 40);
  uint64_t v18 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v19 = OUTLINED_FUNCTION_127_0();
  uint64_t v35 = v17(v19);
  char v21 = v20;
  uint64_t v52 = 2;
  if (v15)
  {
    *((void *)&v50 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F258);
    uint64_t v51 = &protocol witness table for Expression<A>;
    uint64_t v22 = v38;
    *(void *)&uint64_t v49 = v38;
    *((void *)&v49 + 1) = v15;
    *(void *)&uint64_t v50 = v40;
  }
  else
  {
    uint64_t v22 = v38;
    uint64_t v51 = 0;
    uint64_t v49 = 0u;
    uint64_t v50 = 0u;
  }
  unint64_t v24 = v42;
  uint64_t v23 = v43;
  OUTLINED_FUNCTION_24();
  v25();
  OUTLINED_FUNCTION_65_8((uint64_t)v10);
  if (v26)
  {
    sub_21D8ED0DC(v22, v18);
    (*(void (**)(char *, const void *))(v23 + 8))(v10, v24);
    uint64_t v48 = 0;
    uint64_t v46 = 0u;
    uint64_t v47 = 0u;
  }
  else
  {
    uint64_t v27 = *(void *)(v16 + 8);
    *((void *)&v47 + 1) = v0;
    uint64_t v48 = v27;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v46);
    OUTLINED_FUNCTION_13_10();
    OUTLINED_FUNCTION_60_8();
    v28();
    sub_21D8ED0DC(v22, v18);
  }
  uint64_t v29 = v35;
  memset(v45, 0, sizeof(v45));
  v44[0] = v37;
  v44[1] = v36;
  uint64_t v30 = OUTLINED_FUNCTION_126();
  sub_21D8F8ECC(v30, v31);
  OUTLINED_FUNCTION_133_0((uint64_t)v53, v29, v21, &v52, (uint64_t)&v49, (uint64_t)&v46, v54, (uint64_t)v45, v44);
  swift_bridgeObjectRelease();
  uint64_t v32 = OUTLINED_FUNCTION_126();
  sub_21D8F8EE0(v32, v33);
  sub_21D861B48((uint64_t)v45, &qword_267D15A68);
  sub_21D861B48((uint64_t)&v46, &qword_26AD30EC0);
  sub_21D861B48((uint64_t)&v49, &qword_26AD30EC0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  sub_21D8F2E90((uint64_t)v54);
  OUTLINED_FUNCTION_134_0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  OUTLINED_FUNCTION_62_7();
  OUTLINED_FUNCTION_12_0();
}

{
  const void *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(void);
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[2];
  void v44[10];
  long long v45;
  long long v46;
  uint64_t v47;
  void v48[5];
  unsigned __int8 v49;
  void v50[5];
  uint64_t v51[5];
  unsigned char v52[168];

  OUTLINED_FUNCTION_11_0();
  uint64_t v35 = v0;
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  uint64_t v6 = OUTLINED_FUNCTION_69_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v38 = v7;
  OUTLINED_FUNCTION_40_6();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = *v3;
  unint64_t v12 = v3[1];
  uint64_t v13 = v3[2];
  uint64_t v14 = *v1;
  uint64_t v15 = v1[1];
  uint64_t v36 = v1[2];
  uint64_t v37 = v14;
  uint64_t v16 = *v2;
  uint64_t v41 = v2[1];
  uint64_t v42 = v16;
  memcpy(v52, v35, sizeof(v52));
  v50[3] = type metadata accessor for Expression();
  v50[4] = &protocol witness table for Expression<A>;
  v50[0] = v11;
  v50[1] = v12;
  v50[2] = v13;
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v39 + 40);
  uint64_t v18 = v15;
  unint64_t v19 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = OUTLINED_FUNCTION_127_0();
  char v21 = v17(v20);
  uint64_t v22 = v38;
  uint64_t v23 = v21;
  uint64_t v25 = v24;
  uint64_t v49 = 2;
  v48[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  v48[4] = &protocol witness table for Expression<A>;
  v48[0] = v37;
  v48[1] = v18;
  v48[2] = v36;
  OUTLINED_FUNCTION_24();
  v26();
  OUTLINED_FUNCTION_65_8((uint64_t)v10);
  if (v27)
  {
    uint64_t v28 = *(void (**)(char *, uint64_t))(v22 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28(v10, v6);
    uint64_t v47 = 0;
    uint64_t v45 = 0u;
    uint64_t v46 = 0u;
  }
  else
  {
    uint64_t v29 = *(void *)(v19 + 8);
    *((void *)&v46 + 1) = v0;
    uint64_t v47 = v29;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
    OUTLINED_FUNCTION_13_10();
    OUTLINED_FUNCTION_60_8();
    v30();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  memset(v44, 0, sizeof(v44));
  v43[0] = v42;
  v43[1] = v41;
  uint64_t v31 = OUTLINED_FUNCTION_81_4();
  sub_21D8F8ECC(v31, v32);
  OUTLINED_FUNCTION_133_0((uint64_t)v50, v23, v25, &v49, (uint64_t)v48, (uint64_t)&v45, v51, (uint64_t)v44, v43);
  swift_bridgeObjectRelease();
  uint64_t v33 = OUTLINED_FUNCTION_81_4();
  sub_21D8F8EE0(v33, v34);
  sub_21D861B48((uint64_t)v44, &qword_267D15A68);
  sub_21D861B48((uint64_t)&v45, &qword_26AD30EC0);
  sub_21D861B48((uint64_t)v48, &qword_26AD30EC0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  sub_21D8F2E90((uint64_t)v51);
  OUTLINED_FUNCTION_134_0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  OUTLINED_FUNCTION_62_7();
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_21D8F45CC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919A90;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)(inited + 32) = 0x4154205245544C41;
  *(void *)(inited + 40) = 0xEB00000000454C42;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = v4;
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  if (v1[5])
  {
    uint64_t v8 = v1[5];
  }
  else
  {
    uint64_t v8 = v1[3];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = OUTLINED_FUNCTION_92_2();
  uint64_t v12 = sub_21D908300(v9, v10, v11, v8);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  if (v7)
  {
    uint64_t v15 = swift_initStackObject();
    *(_OWORD *)(v15 + 16) = xmmword_21D917D30;
    *(void *)(v15 + 56) = v4;
    *(void *)(v15 + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_21D908300(34, 0xE100000000000000, v6, v7);
    uint64_t v17 = a1;
    uint64_t v19 = v18;
    uint64_t v20 = swift_bridgeObjectRelease();
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v19;
    a1 = v17;
    uint64_t v21 = MEMORY[0x263F8EE78];
    *(void *)(v15 + 48) = MEMORY[0x263F8EE78];
    *(void *)(v15 + 96) = v4;
    *(void *)(v15 + 104) = &protocol witness table for Expression<A>;
    *(void *)(v15 + 72) = v12;
    *(void *)(v15 + 80) = v14;
    *(void *)(v15 + 88) = v21;
    OUTLINED_FUNCTION_131_0(v20, v22, v23, v24, v25, v26, v27, v28, v37, (uint64_t *)(inited + 72));
    swift_setDeallocating();
    sub_21D8ECF90();
  }
  else
  {
    *(void *)(inited + 96) = v4;
    *(void *)(inited + 104) = &protocol witness table for Expression<A>;
    *(void *)(inited + 72) = v12;
    *(void *)(inited + 80) = v14;
    uint64_t v21 = MEMORY[0x263F8EE78];
    *(void *)(inited + 88) = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  *(void *)(inited + 136) = v4;
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  *(void *)(inited + 112) = 0x5420454D414E4552;
  *(void *)(inited + 120) = 0xE90000000000004FLL;
  *(void *)(inited + 128) = v21;
  uint64_t v29 = *(void *)(a1 + 24);
  *(void *)(inited + 176) = v4;
  *(void *)(inited + 184) = &protocol witness table for Expression<A>;
  swift_bridgeObjectRetain();
  uint64_t v30 = OUTLINED_FUNCTION_92_2();
  uint64_t v33 = sub_21D908300(v30, v31, v32, v29);
  uint64_t v35 = v34;
  swift_bridgeObjectRelease();
  *(void *)(inited + 152) = v33;
  *(void *)(inited + 160) = v35;
  *(void *)(inited + 168) = v21;
  OUTLINED_FUNCTION_2_7(inited, v38);
  swift_setDeallocating();
  sub_21D8ECF90();
  OUTLINED_FUNCTION_16_10(v38);
  OUTLINED_FUNCTION_82_3();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return OUTLINED_FUNCTION_75_4();
}

void Table.createIndex(_:unique:ifNotExists:)()
{
  OUTLINED_FUNCTION_11_0();
  char v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_40_7(v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919A90;
  OUTLINED_FUNCTION_40_7(v34);
  sub_21D8F4A80(v3, (uint64_t *)v35);
  uint64_t v5 = OUTLINED_FUNCTION_104_3();
  sub_21D8F25EC(v5, v6, v7, v8, v1, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = 20047;
  *(void *)(inited + 80) = 0xE200000000000000;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  *(void *)(inited + 88) = MEMORY[0x263F8EE78];
  *(void *)(inited + 96) = v10;
  if (v37)
  {
    uint64_t v12 = v36[4];
    uint64_t v13 = v37;
  }
  else
  {
    uint64_t v12 = v36[2];
    uint64_t v13 = v36[3];
    swift_bridgeObjectRetain();
  }
  *(void *)(inited + 136) = v10;
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_21D908300(34, 0xE100000000000000, v12, v13);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  *(void *)(inited + 112) = v14;
  *(void *)(inited + 120) = v16;
  *(void *)(inited + 128) = v11;
  *(void *)(inited + 176) = v10;
  *(void *)(inited + 184) = &protocol witness table for Expression<A>;
  OUTLINED_FUNCTION_54_6(v3, v34);
  sub_21D8E8498(v34, 0, 0xE000000000000000);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  for (uint64_t i = 32; i != 192; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v34, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v34, (uint64_t)&v32);
    if (v33)
    {
      sub_21D861760(&v32, (uint64_t)v35);
      sub_21D861760(v35, (uint64_t)&v32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_38_9();
        uint64_t v11 = v28;
      }
      OUTLINED_FUNCTION_101_2();
      if (v27)
      {
        char v29 = OUTLINED_FUNCTION_130_0(v26);
        sub_21D8EC9B8(v29, v30, v31, v11);
        uint64_t v11 = (char *)v18;
      }
      OUTLINED_FUNCTION_99_2(v18, v19, v20, v21, v22, v23, v24, v25, v32);
    }
    else
    {
      sub_21D861B48((uint64_t)&v32, &qword_26AD30EC0);
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_7((uint64_t)v11, v34);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_10(v34);
  OUTLINED_FUNCTION_82_3();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  OUTLINED_FUNCTION_86_4();
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_21D8F4A80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v8 = v2[6];
  uint64_t v7 = v2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310D0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21D919AA0;
  *(void *)(v9 + 32) = 0x7865646E69;
  *(void *)(v9 + 40) = 0xE500000000000000;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(void *)(v9 + 64) = 28271;
  *(void *)(v9 + 72) = 0xE200000000000000;
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v46 = v8;
  uint64_t v47 = a2;
  if (v10)
  {
    uint64_t v53 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21D8ED270(0, v10, 0);
    uint64_t v11 = a1 + 32;
    uint64_t v12 = v53;
    do
    {
      sub_21D8ED07C(v11, (uint64_t)v50);
      uint64_t v13 = v51;
      uint64_t v14 = v52;
      __swift_project_boxed_opaque_existential_1(v50, v51);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v14 + 8))(&v48, v13, v14);
      uint64_t v16 = v48;
      uint64_t v15 = v49;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21D8ED270(0, *(void *)(v12 + 16) + 1, 1);
        uint64_t v12 = v53;
      }
      unint64_t v18 = *(void *)(v12 + 16);
      unint64_t v17 = *(void *)(v12 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_21D8ED270((char *)(v17 > 1), v18 + 1, 1);
        uint64_t v12 = v53;
      }
      *(void *)(v12 + 16) = v18 + 1;
      uint64_t v19 = v12 + 16 * v18;
      *(void *)(v19 + 32) = v16;
      *(void *)(v19 + 40) = v15;
      v11 += 40;
      --v10;
    }
    while (v10);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v50[0] = v9;
  sub_21D877984();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD31030);
  sub_21D888E54();
  sub_21D915378();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_21D915448();
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = HIBYTE(v22) & 0xF;
  v50[0] = v20;
  v50[1] = v22;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
  }
  v50[2] = 0;
  uint64_t v51 = v23;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_21D915528();
  if (!v25)
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0xE000000000000000;
LABEL_46:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_21D908300(34, 0xE100000000000000, v28, v29);
    uint64_t v39 = v38;
    swift_bridgeObjectRelease();
    if (v7)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21D917D30;
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
      *(void *)(inited + 56) = v41;
      *(void *)(inited + 64) = &protocol witness table for Expression<A>;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_21D908300(34, 0xE100000000000000, v46, v7);
      uint64_t v44 = v43;
      swift_bridgeObjectRelease();
      *(void *)(inited + 32) = v42;
      *(void *)(inited + 40) = v44;
      uint64_t v45 = MEMORY[0x263F8EE78];
      *(void *)(inited + 48) = MEMORY[0x263F8EE78];
      *(void *)(inited + 96) = v41;
      *(void *)(inited + 104) = &protocol witness table for Expression<A>;
      *(void *)(inited + 72) = v37;
      *(void *)(inited + 80) = v39;
      *(void *)(inited + 88) = v45;
      sub_21D907F44(inited, v47);
      swift_setDeallocating();
      sub_21D8ECF90();
      return swift_bridgeObjectRelease();
    }
    else
    {
      v47[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
      v47[4] = (uint64_t)&protocol witness table for Expression<A>;
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v47 = v37;
      v47[1] = v39;
      v47[2] = MEMORY[0x263F8EE78];
    }
    return result;
  }
  uint64_t v26 = v24;
  uint64_t v27 = v25;
  uint64_t v28 = 0;
  uint64_t v29 = 0xE000000000000000;
  while (1)
  {
    BOOL v30 = v26 == 34 && v27 == 0xE100000000000000;
    if (!v30 && (sub_21D915C28() & 1) == 0) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_43:
    uint64_t v26 = sub_21D915528();
    uint64_t v27 = v36;
    if (!v36) {
      goto LABEL_46;
    }
  }
  uint64_t result = sub_21D915C28();
  if ((result & 1) == 0)
  {
    if (v26 == 97 && v27 == 0xE100000000000000) {
      goto LABEL_30;
    }
    if (sub_21D915C28())
    {
LABEL_31:
      uint64_t result = sub_21D915C28();
      if (result) {
        goto LABEL_50;
      }
      BOOL v34 = v26 == 48 && v27 == 0xE100000000000000;
      if (v34 || (sub_21D915C28() & 1) == 0 && (v26 == 57 ? (BOOL v35 = v27 == 0xE100000000000000) : (BOOL v35 = 0), !v35)) {
        sub_21D915C28();
      }
      goto LABEL_42;
    }
    if (v26 != 122 || v27 != 0xE100000000000000)
    {
LABEL_30:
      if (sub_21D915C28()) {
        goto LABEL_31;
      }
    }
LABEL_42:
    uint64_t v48 = v28;
    uint64_t v49 = v29;
    swift_bridgeObjectRetain();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = v48;
    uint64_t v29 = v49;
    goto LABEL_43;
  }
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t Table.dropIndex(_:ifExists:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_40_7(v10);
  OUTLINED_FUNCTION_40_7(v8);
  sub_21D8F4A80(a1, v9);
  uint64_t v4 = OUTLINED_FUNCTION_104_3();
  sub_21D8F1DC0(v4, v5, v6, a2);
  OUTLINED_FUNCTION_82_3();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return OUTLINED_FUNCTION_75_4();
}

void View.create(_:temporary:ifNotExists:)()
{
}

void sub_21D8F5018()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v47 = __PAIR64__(v5, v4);
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_40_7(v66);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  uint64_t v46 = inited + 32;
  uint64_t v9 = v68;
  uint64_t v10 = v69;
  if (v67)
  {
    uint64_t v11 = v66[4];
    uint64_t v12 = v67;
  }
  else
  {
    uint64_t v11 = v66[2];
    uint64_t v12 = v66[3];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_21D908300(34, 0xE100000000000000, v11, v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = (char *)MEMORY[0x263F8EE78];
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
    uint64_t v43 = v14;
    uint64_t v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = xmmword_21D917D30;
    uint64_t v44 = (uint64_t)v7;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    *(void *)(v16 + 56) = v17;
    *(void *)(v16 + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_21D908300(34, 0xE100000000000000, v9, v10);
    uint64_t v19 = v3;
    uint64_t v20 = v1;
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)(v16 + 32) = v18;
    *(void *)(v16 + 40) = v22;
    uint64_t v1 = v20;
    uint64_t v3 = v19;
    *(void *)(v16 + 48) = v15;
    *(void *)(v16 + 96) = v17;
    *(void *)(v16 + 104) = &protocol witness table for Expression<A>;
    uint64_t v7 = (void *)v44;
    *(void *)(v16 + 72) = v45;
    *(void *)(v16 + 80) = v43;
    *(void *)(v16 + 88) = v15;
    OUTLINED_FUNCTION_61_5(v65);
    swift_setDeallocating();
    sub_21D8ECF90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v65[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    v65[4] = (uint64_t)&protocol witness table for Expression<A>;
    swift_bridgeObjectRelease();
    v65[0] = v45;
    v65[1] = v14;
    v65[2] = (uint64_t)v15;
  }
  OUTLINED_FUNCTION_93_2();
  sub_21D8F25EC(v3, v1, v23, v24, v25, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  *(void *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = 21313;
  *(void *)(inited + 80) = 0xE200000000000000;
  *(void *)(inited + 88) = v15;
  uint64_t v27 = v7[3];
  uint64_t v28 = v7[4];
  __swift_project_boxed_opaque_existential_1(v7, v27);
  *(void *)(inited + 136) = v27;
  *(void *)(inited + 144) = *(void *)(v28 + 8);
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 112));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_88_1();
  v29();
  for (uint64_t i = 32; i != 152; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v65, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v65, (uint64_t)&v62);
    if (v63)
    {
      sub_21D861760(&v62, (uint64_t)v64);
      sub_21D861760(v64, (uint64_t)&v62);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_43_6();
        uint64_t v15 = v41;
      }
      OUTLINED_FUNCTION_101_2();
      if (v40)
      {
        sub_21D8EC9B8(v39 > 1, v27, 1, v15);
        uint64_t v15 = (char *)v31;
      }
      OUTLINED_FUNCTION_135(v31, v32, v33, v34, v35, v36, v37, v38, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        v58,
        v59,
        v60,
        v61,
        v62);
    }
    else
    {
      sub_21D861B48((uint64_t)&v62, &qword_26AD30EC0);
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_7((uint64_t)v15, v65);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_10(v65);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  OUTLINED_FUNCTION_86_4();
  OUTLINED_FUNCTION_12_0();
}

Swift::String __swiftcall View.drop(ifExists:)(Swift::Bool ifExists)
{
  memcpy(__dst, v1, sizeof(__dst));
  uint64_t v3 = __dst[6];
  uint64_t v4 = __dst[7];
  if (__dst[5])
  {
    uint64_t v5 = __dst[4];
    uint64_t v6 = __dst[5];
  }
  else
  {
    uint64_t v5 = __dst[2];
    uint64_t v6 = __dst[3];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21D908300(34, 0xE100000000000000, v5, v6);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21D917D30;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    *(void *)(inited + 56) = v11;
    *(void *)(inited + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_21D908300(34, 0xE100000000000000, v3, v4);
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    *(void *)(inited + 32) = v12;
    *(void *)(inited + 40) = v14;
    uint64_t v15 = MEMORY[0x263F8EE78];
    *(void *)(inited + 48) = MEMORY[0x263F8EE78];
    *(void *)(inited + 96) = v11;
    *(void *)(inited + 104) = &protocol witness table for Expression<A>;
    *(void *)(inited + 72) = v7;
    *(void *)(inited + 80) = v9;
    *(void *)(inited + 88) = v15;
    sub_21D907F44(inited, v19);
    swift_setDeallocating();
    sub_21D8ECF90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    v19[4] = (uint64_t)&protocol witness table for Expression<A>;
    swift_bridgeObjectRelease();
    v19[0] = v7;
    v19[1] = v9;
    v19[2] = MEMORY[0x263F8EE78];
  }
  sub_21D8F1DC0(1464158550, 0xE400000000000000, (uint64_t)v19, ifExists);
  OUTLINED_FUNCTION_82_3();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  uint64_t v16 = OUTLINED_FUNCTION_75_4();
  result._object = v17;
  result._uint64_t countAndFlagsBits = v16;
  return result;
}

void VirtualTable.create(_:ifNotExists:)()
{
  OUTLINED_FUNCTION_11_0();
  HIDWORD(v44) = v0;
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  OUTLINED_FUNCTION_40_7(v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  uint64_t v43 = inited + 32;
  uint64_t v6 = v65;
  uint64_t v7 = v66;
  if (v64)
  {
    uint64_t v8 = v63[4];
    uint64_t v9 = v64;
  }
  else
  {
    uint64_t v8 = v63[2];
    uint64_t v9 = v63[3];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_21D908300(34, 0xE100000000000000, v8, v9);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
    uint64_t v40 = v11;
    uint64_t v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_21D917D30;
    uint64_t v41 = v3;
    uint64_t v14 = v4;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    *(void *)(v13 + 56) = v15;
    *(void *)(v13 + 64) = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_21D908300(34, 0xE100000000000000, v6, v7);
    uint64_t v17 = v2;
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    *(void *)(v13 + 32) = v16;
    *(void *)(v13 + 40) = v19;
    uint64_t v2 = v17;
    *(void *)(v13 + 48) = v12;
    *(void *)(v13 + 96) = v15;
    *(void *)(v13 + 104) = &protocol witness table for Expression<A>;
    *(void *)(v13 + 72) = v42;
    *(void *)(v13 + 80) = v40;
    uint64_t v4 = v14;
    uint64_t v3 = v41;
    *(void *)(v13 + 88) = v12;
    OUTLINED_FUNCTION_61_5(v62);
    swift_setDeallocating();
    sub_21D8ECF90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v62[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    v62[4] = (uint64_t)&protocol witness table for Expression<A>;
    swift_bridgeObjectRelease();
    v62[0] = v42;
    v62[1] = v11;
    v62[2] = (uint64_t)v12;
  }
  OUTLINED_FUNCTION_93_2();
  sub_21D8F25EC(0x204C415554524956, 0xED0000454C424154, v20, 2u, v21, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 72) = 0x474E495355;
  *(void *)(inited + 80) = 0xE500000000000000;
  *(void *)(inited + 88) = v12;
  *(void *)(inited + 96) = v23;
  *(void *)(inited + 136) = &type metadata for Module;
  *(void *)(inited + 144) = &protocol witness table for Module;
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 112) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 128) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (uint64_t i = 32; i != 152; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v62, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v62, (uint64_t)&v59);
    if (v60)
    {
      sub_21D861760(&v59, (uint64_t)v61);
      sub_21D861760(v61, (uint64_t)&v59);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_43_6();
        uint64_t v12 = v35;
      }
      OUTLINED_FUNCTION_101_2();
      if (v34)
      {
        char v36 = OUTLINED_FUNCTION_130_0(v33);
        sub_21D8EC9B8(v36, v37, v38, v12);
        uint64_t v12 = (char *)v25;
      }
      OUTLINED_FUNCTION_135(v25, v26, v27, v28, v29, v30, v31, v32, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49,
        v50,
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        v58,
        v59);
    }
    else
    {
      sub_21D861B48((uint64_t)&v59, &qword_26AD30EC0);
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_7((uint64_t)v12, v62);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_10(v62);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  OUTLINED_FUNCTION_86_4();
  OUTLINED_FUNCTION_12_0();
}

uint64_t _s8RRSQLite5TableV6renameySSACF_0(void *__src)
{
  memcpy(v2, __src, sizeof(v2));
  OUTLINED_FUNCTION_40_7(v3);
  return sub_21D8F45CC((uint64_t)v2);
}

#error "21D8F5968: call analysis failed (funcsize=64)"

#error "21D8F5AA8: call analysis failed (funcsize=76)"

#error "21D8F5B64: call analysis failed (funcsize=65)"

#error "21D8F5D04: call analysis failed (funcsize=78)"

#error "21D8F5E38: call analysis failed (funcsize=73)"

#error "21D8F5FA4: call analysis failed (funcsize=87)"

#error "21D8F60E8: call analysis failed (funcsize=77)"

#error "21D8F61B4: call analysis failed (funcsize=74)"

#error "21D8F6370: call analysis failed (funcsize=80)"

#error "21D8F64D0: call analysis failed (funcsize=84)"

#error "21D8F6614: call analysis failed (funcsize=77)"

#error "21D8F675C: call analysis failed (funcsize=78)"

#error "21D8F6878: call analysis failed (funcsize=69)"

#error "21D8F69AC: call analysis failed (funcsize=73)"

#error "21D8F6A90: call analysis failed (funcsize=77)"

#error "21D8F6C30: call analysis failed (funcsize=74)"

#error "21D8F6D90: call analysis failed (funcsize=84)"

#error "21D8F6E58: call analysis failed (funcsize=75)"

#error "21D8F6FCC: call analysis failed (funcsize=61)"

#error "21D8F7110: call analysis failed (funcsize=77)"

#error "21D8F7204: call analysis failed (funcsize=57)"

#error "21D8F732C: call analysis failed (funcsize=72)"

#error "21D8F743C: call analysis failed (funcsize=62)"

#error "21D8F75BC: call analysis failed (funcsize=94)"

#error "21D8F7710: call analysis failed (funcsize=79)"

#error "21D8F7808: call analysis failed (funcsize=58)"

#error "21D8F7988: call analysis failed (funcsize=95)"

#error "21D8F7AD4: call analysis failed (funcsize=78)"

uint64_t TableBuilder.primaryKey<A>(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917DB0;
  *(void *)(inited + 56) = OUTLINED_FUNCTION_110_2();
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8F7BD4(inited);
  swift_setDeallocating();
  return sub_21D8ECF90();
}

uint64_t sub_21D8F7BD4(uint64_t a1)
{
  sub_21D9087EC(a1, 0x205952414D495250, 0xEB0000000059454BLL, (uint64_t)v5);
  sub_21D8ED004();
  uint64_t v2 = *(void *)(*(void *)(v1 + 16) + 16);
  sub_21D8ECEEC(v2);
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v3 + 16) = v2 + 1;
  return sub_21D861760(v5, v3 + 40 * v2 + 32);
}

uint64_t TableBuilder.primaryKey<A, B>(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v7 = a2[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917D30;
  *(void *)(inited + 56) = type metadata accessor for Expression();
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 96) = OUTLINED_FUNCTION_110_2();
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = v6;
  *(void *)(inited + 80) = v5;
  *(void *)(inited + 88) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8F7BD4(inited);
  swift_setDeallocating();
  return sub_21D8ECF90();
}

uint64_t TableBuilder.primaryKey<A, B, C>(_:_:_:)(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a3[1];
  uint64_t v13 = *a3;
  uint64_t v10 = a3[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  *(void *)(inited + 56) = OUTLINED_FUNCTION_112_2();
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 96) = type metadata accessor for Expression();
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = v6;
  *(void *)(inited + 88) = v8;
  *(void *)(inited + 136) = type metadata accessor for Expression();
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  *(void *)(inited + 112) = v13;
  *(void *)(inited + 120) = v9;
  *(void *)(inited + 128) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8F7BD4(inited);
  swift_setDeallocating();
  return sub_21D8ECF90();
}

void TableBuilder.primaryKey<A, B, C, D>(_:_:_:_:)()
{
  OUTLINED_FUNCTION_20_8();
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = v4[2];
  uint64_t v14 = *v8;
  uint64_t v9 = v8[2];
  uint64_t v13 = v8[1];
  uint64_t v11 = v10[1];
  uint64_t v15 = v10[2];
  uint64_t v16 = *v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919A90;
  *(void *)(inited + 56) = OUTLINED_FUNCTION_110_2();
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 96) = type metadata accessor for Expression();
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = v6;
  *(void *)(inited + 88) = v7;
  *(void *)(inited + 136) = type metadata accessor for Expression();
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  *(void *)(inited + 112) = v14;
  *(void *)(inited + 120) = v13;
  *(void *)(inited + 128) = v9;
  *(void *)(inited + 176) = type metadata accessor for Expression();
  *(void *)(inited + 184) = &protocol witness table for Expression<A>;
  *(void *)(inited + 152) = v16;
  *(void *)(inited + 160) = v11;
  *(void *)(inited + 168) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8F7BD4(inited);
  swift_setDeallocating();
  sub_21D8ECF90();
  OUTLINED_FUNCTION_19_8();
}

Swift::Void __swiftcall TableBuilder.unique(_:)(Swift::OpaquePointer a1)
{
  sub_21D9087EC((uint64_t)a1._rawValue, 0x455551494E55, 0xE600000000000000, (uint64_t)v3);
  sub_21D8ED004();
  sub_21D8ECEEC(*(void *)(*(void *)(v1 + 16) + 16));
  OUTLINED_FUNCTION_79_5();
  sub_21D861760(v3, v2);
}

uint64_t TableBuilder.check(_:)(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  v4[0] = *a1;
  v4[1] = v1;
  v4[2] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  TableBuilder.check(_:)(v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void v8[5];
  long long v9;
  uint64_t v10;
  _UNKNOWN **v11;

  uint64_t v2 = v1;
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = a1[2];
  v8[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F260);
  v8[4] = &protocol witness table for Expression<A>;
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = v5;
  *(void *)&uint64_t v9 = 0x4B43454843;
  *((void *)&v9 + 1) = 0xE500000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D9154F8();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  uint64_t v11 = &protocol witness table for Expression<A>;
  sub_21D8E8498(v8, 0x4B43454843, 0xE500000000000000);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  sub_21D8ED004();
  sub_21D8ECEEC(*(void *)(*(void *)(v2 + 16) + 16));
  OUTLINED_FUNCTION_79_5();
  return sub_21D861760(&v9, v6);
}

RRSQLite::TableBuilder::Dependency_optional __swiftcall TableBuilder.Dependency.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21D915BA8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t TableBuilder.Dependency.rawValue.getter()
{
  uint64_t result = 0x4F49544341204F4ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x5443495254534552;
      break;
    case 2:
      uint64_t result = 0x4C4C554E20544553;
      break;
    case 3:
      uint64_t result = 0x4146454420544553;
      break;
    case 4:
      uint64_t result = 0x45444143534143;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21D8F8298(unsigned __int8 *a1, char *a2)
{
  return sub_21D8FCE28(*a1, *a2);
}

uint64_t sub_21D8F82A4()
{
  return sub_21D8FD2B0(*v0);
}

uint64_t sub_21D8F82AC()
{
  return sub_21D8FD39C();
}

uint64_t sub_21D8F82B4(uint64_t a1)
{
  return sub_21D8FD6B4(a1, *v1);
}

RRSQLite::TableBuilder::Dependency_optional sub_21D8F82BC(Swift::String *a1)
{
  return TableBuilder.Dependency.init(rawValue:)(*a1);
}

uint64_t sub_21D8F82C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TableBuilder.Dependency.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t TableBuilder.foreignKey<A>(_:references:_:update:delete:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_97_3();
  uint64_t v4 = type metadata accessor for Expression();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_82_5();
  sub_21D8F9018(v5, a2, v6, v7, v8, v2, v4, v4, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_97_3();
  sub_21D9158C8();
  uint64_t v4 = OUTLINED_FUNCTION_18_8();
  uint64_t v5 = type metadata accessor for Expression();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_82_5();
  sub_21D8F9018(v6, a2, v7, v8, v9, v2, v4, v5, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void TableBuilder.foreignKey<A, B>(_:references:_:update:delete:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v33 = v0;
  uint64_t v26 = v1;
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v7 = v6[1];
  uint64_t v24 = *v6;
  uint64_t v8 = v6[2];
  uint64_t v25 = v9[1];
  uint64_t v27 = *v9;
  uint64_t v28 = v10[1];
  uint64_t v29 = v10[2];
  uint64_t v30 = *v10;
  unsigned __int8 v31 = *v12;
  unsigned __int8 v32 = *v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917D30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = OUTLINED_FUNCTION_110_2();
  *(void *)(inited + 56) = v14;
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 48) = v5;
  uint64_t v15 = type metadata accessor for Expression();
  *(void *)(inited + 96) = v15;
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = v24;
  *(void *)(inited + 80) = v7;
  *(void *)(inited + 88) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_54_6(inited, v42);
  swift_setDeallocating();
  sub_21D8ECF90();
  sub_21D8ED07C(v26, (uint64_t)v40);
  uint64_t v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_21D917D30;
  swift_bridgeObjectRetain();
  uint64_t v17 = swift_bridgeObjectRetain();
  *(void *)(v16 + 32) = v27;
  *(void *)(v16 + 40) = v25;
  *(void *)(v16 + 48) = v17;
  *(void *)(v16 + 56) = v14;
  *(void *)(v16 + 96) = v15;
  *(void *)(v16 + 104) = &protocol witness table for Expression<A>;
  *(void *)(v16 + 64) = &protocol witness table for Expression<A>;
  *(void *)(v16 + 72) = v30;
  *(void *)(v16 + 80) = v28;
  *(void *)(v16 + 88) = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_54_6(v16, v41);
  swift_setDeallocating();
  sub_21D8ECF90();
  sub_21D8ED07C((uint64_t)v40, (uint64_t)v36);
  sub_21D8ED07C((uint64_t)v41, (uint64_t)v37);
  unsigned __int8 v35 = v32;
  unsigned __int8 v34 = v31;
  uint64_t v18 = v43;
  uint64_t v19 = v44;
  uint64_t v20 = __swift_project_boxed_opaque_existential_1(v42, v43);
  uint64_t v21 = v38;
  uint64_t v22 = v39;
  uint64_t v23 = __swift_project_boxed_opaque_existential_1(v37, v38);
  sub_21D8F9018((uint64_t)v20, (uint64_t)v36, (uint64_t)v23, &v35, &v34, v33, v18, v21, v19, v22);
  sub_21D861B48((uint64_t)v40, &qword_267D15A70);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  OUTLINED_FUNCTION_12_0();
}

void TableBuilder.foreignKey<A, B, C>(_:references:_:update:delete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unsigned __int8 *a21)
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v62 = v21;
  uint64_t v53 = v22;
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  uint64_t v26 = v23[2];
  uint64_t v28 = v27[1];
  uint64_t v47 = *v27;
  uint64_t v29 = v27[2];
  uint64_t v52 = *v30;
  uint64_t v49 = v30[1];
  uint64_t v50 = v30[2];
  uint64_t v32 = v31[1];
  uint64_t v33 = v31[2];
  uint64_t v35 = v34[1];
  uint64_t v54 = *v31;
  uint64_t v55 = v34[2];
  uint64_t v56 = *v34;
  uint64_t v57 = v36[1];
  uint64_t v58 = v36[2];
  uint64_t v59 = *v36;
  unsigned __int8 v60 = *a21;
  unsigned __int8 v61 = *v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = type metadata accessor for Expression();
  *(void *)(inited + 56) = v51;
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = v25;
  *(void *)(inited + 40) = v24;
  *(void *)(inited + 48) = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v48 = type metadata accessor for Expression();
  *(void *)(inited + 96) = v48;
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = v47;
  *(void *)(inited + 80) = v28;
  *(void *)(inited + 88) = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v39 = type metadata accessor for Expression();
  *(void *)(inited + 136) = v39;
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  *(void *)(inited + 112) = v52;
  *(void *)(inited + 120) = v49;
  *(void *)(inited + 128) = v50;
  OUTLINED_FUNCTION_54_6(inited, v71);
  swift_setDeallocating();
  sub_21D8ECF90();
  sub_21D8ED07C(v53, (uint64_t)v69);
  uint64_t v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = xmmword_21D919AA0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v40 + 32) = v54;
  *(void *)(v40 + 40) = v32;
  *(void *)(v40 + 56) = v51;
  *(void *)(v40 + 64) = &protocol witness table for Expression<A>;
  *(void *)(v40 + 48) = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v40 + 72) = v56;
  *(void *)(v40 + 80) = v35;
  *(void *)(v40 + 96) = v48;
  *(void *)(v40 + 104) = &protocol witness table for Expression<A>;
  *(void *)(v40 + 88) = v55;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v40 + 136) = v39;
  *(void *)(v40 + 144) = &protocol witness table for Expression<A>;
  *(void *)(v40 + 112) = v59;
  *(void *)(v40 + 120) = v57;
  *(void *)(v40 + 128) = v58;
  OUTLINED_FUNCTION_54_6(v40, v70);
  swift_setDeallocating();
  sub_21D8ECF90();
  sub_21D8ED07C((uint64_t)v69, (uint64_t)v65);
  sub_21D8ED07C((uint64_t)v70, (uint64_t)v66);
  unsigned __int8 v64 = v61;
  unsigned __int8 v63 = v60;
  uint64_t v41 = v72;
  uint64_t v42 = v73;
  uint64_t v43 = __swift_project_boxed_opaque_existential_1(v71, v72);
  uint64_t v44 = v67;
  uint64_t v45 = v68;
  uint64_t v46 = __swift_project_boxed_opaque_existential_1(v66, v67);
  sub_21D8F9018((uint64_t)v43, (uint64_t)v65, (uint64_t)v46, &v64, &v63, v62, v41, v44, v42, v45);
  sub_21D861B48((uint64_t)v69, &qword_267D15A70);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_21D8F8A78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_21D8ED07C(a1, (uint64_t)v9);
  sub_21D8ED07C(a2, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919AA0;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)(inited + 32) = 0x434E455245464552;
  *(void *)(inited + 40) = 0xEA00000000005345;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v6;
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_21D8E89E4();
  *(void *)(inited + 136) = v6;
  *(void *)(inited + 144) = &protocol witness table for Expression<A>;
  sub_21D8E8498(v10, 0, 0xE000000000000000);
  sub_21D907F44(inited, a3);
  swift_setDeallocating();
  sub_21D8ECF90();
  return sub_21D861B48((uint64_t)v9, &qword_267D15A70);
}

uint64_t TableBuilder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TableBuilder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

BOOL static PrimaryKey.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrimaryKey.hash(into:)()
{
  return sub_21D915CF8();
}

uint64_t PrimaryKey.hashValue.getter()
{
  return sub_21D915D18();
}

uint64_t Module.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = sub_21D908300(34, 0xE100000000000000, a1, a2);
  uint64_t v8 = v7;
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v6;
  a4[1] = v8;
  a4[2] = a3;
  return result;
}

uint64_t Module.expression.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  OUTLINED_FUNCTION_54_6(v0[2], v4);
  sub_21D8E8498(v4, v1, v2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_21D8F8D78@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917D30;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  *(void *)(inited + 32) = 0x4B43454843;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  *(void *)(inited + 56) = v5;
  sub_21D8ED07C(a1, inited + 72);
  sub_21D907F44(inited, a2);
  swift_setDeallocating();
  return sub_21D8ECF90();
}

uint64_t type metadata accessor for TableBuilder()
{
  return self;
}

uint64_t sub_21D8F8E64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D8F8ECC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_21D8F8EE0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21D8F8EF4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, char a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, long long *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v28[3] = a12;
  v28[4] = a13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v28);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a12 - 8) + 16))(boxed_opaque_existential_1, a1, a12);
  unsigned __int8 v26 = *a4;
  long long v25 = *a10;
  sub_21D8F29DC((uint64_t)v28, a2, a3, &v26, a5, a6, a7, a8, (uint64_t *)v27, a9, (uint64_t *)&v25);
  sub_21D8ED004();
  uint64_t v20 = *(void *)(*(void *)(a11 + 16) + 16);
  sub_21D8ECEEC(v20);
  uint64_t v21 = *(void *)(a11 + 16);
  *(void *)(v21 + 16) = v20 + 1;
  sub_21D861760(v27, v21 + 40 * v20 + 32);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
}

uint64_t sub_21D8F9018(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v44[3] = a7;
  v44[4] = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v44);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 16))(boxed_opaque_existential_1, a1, a7);
  v43[3] = a8;
  v43[4] = a10;
  uint64_t v19 = __swift_allocate_boxed_opaque_existential_1(v43);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 16))(v19, a3, a8);
  sub_21D8ED07C(a2, (uint64_t)v41);
  sub_21D8ED07C((uint64_t)v43, (uint64_t)v42);
  LODWORD(a3) = *a4;
  int v20 = *a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D919A90;
  *(void *)&v39[0] = 0x204E474945524F46;
  *((void *)&v39[0] + 1) = 0xEB0000000059454BLL;
  sub_21D9154F8();
  long long v22 = v39[0];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(inited + 56) = v23;
  *(void *)(inited + 64) = &protocol witness table for Expression<A>;
  sub_21D8E8498(v44, v22, *((void *)&v22 + 1));
  swift_bridgeObjectRelease();
  sub_21D8ED07C((uint64_t)v41, (uint64_t)v39);
  sub_21D8ED07C((uint64_t)v42, (uint64_t)v40);
  sub_21D8F8A78((uint64_t)v39, (uint64_t)v40, (uint64_t *)(inited + 72));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  uint64_t v24 = MEMORY[0x263F8EE78];
  if (a3 == 5)
  {
    *(void *)(inited + 144) = 0;
    *(_OWORD *)(inited + 112) = 0u;
    *(_OWORD *)(inited + 128) = 0u;
  }
  else
  {
    *(void *)&v39[0] = 0x5441445055204E4FLL;
    *((void *)&v39[0] + 1) = 0xEA00000000002045;
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    long long v25 = v39[0];
    *(void *)(inited + 136) = v23;
    *(void *)(inited + 144) = &protocol witness table for Expression<A>;
    *(_OWORD *)(inited + 112) = v25;
    *(void *)(inited + 128) = v24;
  }
  if (v20 == 5)
  {
    *(void *)(inited + 184) = 0;
    *(_OWORD *)(inited + 152) = 0u;
    *(_OWORD *)(inited + 168) = 0u;
  }
  else
  {
    *(void *)&v39[0] = 0x54454C4544204E4FLL;
    *((void *)&v39[0] + 1) = 0xEA00000000002045;
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    long long v26 = v39[0];
    *(void *)(inited + 176) = v23;
    *(void *)(inited + 184) = &protocol witness table for Expression<A>;
    *(_OWORD *)(inited + 152) = v26;
    *(void *)(inited + 168) = v24;
  }
  uint64_t v27 = MEMORY[0x263F8EE78];
  for (uint64_t i = 32; i != 192; i += 40)
  {
    sub_21D8F9A0C(inited + i, (uint64_t)v39, &qword_26AD30EC0);
    sub_21D8F8E64((uint64_t)v39, (uint64_t)&v36);
    if (v37)
    {
      sub_21D861760(&v36, (uint64_t)v38);
      sub_21D861760(v38, (uint64_t)&v36);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21D8EC9B8(0, *(void *)(v27 + 16) + 1, 1, (char *)v27);
        uint64_t v27 = v31;
      }
      unint64_t v30 = *(void *)(v27 + 16);
      unint64_t v29 = *(void *)(v27 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_21D8EC9B8(v29 > 1, v30 + 1, 1, (char *)v27);
        uint64_t v27 = v32;
      }
      *(void *)(v27 + 16) = v30 + 1;
      sub_21D861760(&v36, v27 + 40 * v30 + 32);
    }
    else
    {
      sub_21D861B48((uint64_t)&v36, &qword_26AD30EC0);
    }
  }
  swift_bridgeObjectRelease();
  sub_21D907F44(v27, (uint64_t *)v39);
  swift_bridgeObjectRelease();
  sub_21D8ED004();
  uint64_t v33 = *(void *)(*(void *)(a6 + 16) + 16);
  sub_21D8ECEEC(v33);
  uint64_t v34 = *(void *)(a6 + 16);
  *(void *)(v34 + 16) = v33 + 1;
  sub_21D861760(v39, v34 + 40 * v33 + 32);
  sub_21D861B48((uint64_t)v41, &qword_267D15A70);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
}

unint64_t sub_21D8F9594()
{
  unint64_t result = qword_267D15A78;
  if (!qword_267D15A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15A78);
  }
  return result;
}

unint64_t sub_21D8F95E4()
{
  unint64_t result = qword_267D15A80;
  if (!qword_267D15A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15A80);
  }
  return result;
}

uint64_t method lookup function for TableBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TableBuilder);
}

unsigned char *storeEnumTagSinglePayload for TableBuilder.Dependency(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x21D8F9714);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for TableBuilder.Dependency()
{
}

uint64_t getEnumTagSinglePayload for PrimaryKey(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrimaryKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21D8F989CLL);
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

void type metadata accessor for PrimaryKey()
{
}

void *assignWithCopy for Module(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Module(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Module(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Module(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for Module()
{
}

uint64_t sub_21D8F9A0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_75_4();
  OUTLINED_FUNCTION_88_1();
  v4();
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  return sub_21D861B48(v1 - 160, v0);
}

double OUTLINED_FUNCTION_6_12()
{
  *(void *)(v0 - 128) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 160) = 0u;
  *(_OWORD *)(v0 - 144) = 0u;
  return result;
}

void OUTLINED_FUNCTION_9_12()
{
  *(unsigned char *)(v0 - 113) = 2;
}

void OUTLINED_FUNCTION_10_11()
{
  *(unsigned char *)(v0 - 113) = 2;
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_15_10(void *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  *(void *)(v1 - 112) = *a1;
  *(void *)(v1 - 104) = v3;
  *(void *)(v1 - 96) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_10(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return Expressible.asSQL()()._countAndFlagsBits;
}

uint64_t OUTLINED_FUNCTION_17_5(void *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  *(void *)(v1 - 112) = *a1;
  *(void *)(v1 - 104) = v3;
  *(void *)(v1 - 96) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_18_8()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_22_5()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_24_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, char a16, uint64_t a17, long long a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  return sub_21D8F8EF4(v31 - 112, v30, v29, (unsigned __int8 *)(v31 - 113), 1, a16 & 1, v31 - 160, (uint64_t)&a29, (uint64_t)&a19, &a18, a17, a12, a13);
}

uint64_t OUTLINED_FUNCTION_25_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, char a16, uint64_t a17, long long a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  return sub_21D8F8EF4(v31 - 112, v30, v29, (unsigned __int8 *)(v31 - 113), 0, a16 & 1, v31 - 160, (uint64_t)&a29, (uint64_t)&a19, &a18, a17, a12, a13);
}

uint64_t OUTLINED_FUNCTION_26_12()
{
  return v0 - 112;
}

void *OUTLINED_FUNCTION_27_7@<X0>(const void *a1@<X8>)
{
  return memcpy((void *)(v1 - 256), a1, 0xA8uLL);
}

uint64_t OUTLINED_FUNCTION_28_11()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_29_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  return sub_21D8F8EF4(v30 - 112, v29, v28, (unsigned __int8 *)(v30 - 113), 0, 0, v30 - 160, (uint64_t)&a28, (uint64_t)&a18, &a17, a16, a12, a13);
}

uint64_t OUTLINED_FUNCTION_30_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  return sub_21D861B48((uint64_t)&a31, v31);
}

uint64_t OUTLINED_FUNCTION_31_7()
{
  return v0 - 112;
}

double OUTLINED_FUNCTION_32_8()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_33_10()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_34_9()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_36_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  return sub_21D861B48((uint64_t)&a29, v29);
}

uint64_t OUTLINED_FUNCTION_37_9()
{
  return v0;
}

void OUTLINED_FUNCTION_38_9()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  sub_21D8EC9B8(0, v2, 1, (char *)v0);
}

uint64_t OUTLINED_FUNCTION_39_7@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 112) = v1;
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 96) = v2;
  return swift_bridgeObjectRetain();
}

void *OUTLINED_FUNCTION_40_7(void *a1)
{
  return memcpy(a1, v1, 0xA8uLL);
}

uint64_t OUTLINED_FUNCTION_41_6()
{
  return sub_21D8F8EE0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_42_8@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 112) = v1;
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 96) = v2;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_43_6()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  sub_21D8EC9B8(0, v2, 1, (char *)v0);
}

double OUTLINED_FUNCTION_45_6()
{
  return 0.0;
}

double OUTLINED_FUNCTION_46_7()
{
  return 0.0;
}

__n128 *OUTLINED_FUNCTION_47_6(__n128 a1, __n128 a2)
{
  v2[3] = a1;
  v2[4] = a2;
  return v2 + 15;
}

uint64_t OUTLINED_FUNCTION_48_8()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_49_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50_8@<X0>(uint64_t a1@<X8>)
{
  return sub_21D8ED0DC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_51_6()
{
  return sub_21D8ED0DC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_53_3()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_55_7()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_57_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58_7()
{
  return v0;
}

void OUTLINED_FUNCTION_61_5(uint64_t *a1@<X8>)
{
  sub_21D907F44(v1, a1);
}

uint64_t OUTLINED_FUNCTION_62_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_65_8(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

double OUTLINED_FUNCTION_67_7()
{
  return 0.0;
}

void OUTLINED_FUNCTION_68_6(uint64_t a1@<X8>)
{
  *(void *)(v2 - 112) = v1;
  *(void *)(v2 - 104) = a1;
}

uint64_t OUTLINED_FUNCTION_69_4()
{
  return sub_21D9158C8();
}

uint64_t OUTLINED_FUNCTION_71_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_72_6()
{
  return sub_21D9158C8();
}

uint64_t OUTLINED_FUNCTION_74_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,long long a31,long long a32,uint64_t a33)
{
  a33 = 0;
  a31 = 0u;
  a32 = 0u;
  return sub_21D8ED07C(a15, (uint64_t)&a21);
}

uint64_t OUTLINED_FUNCTION_75_4()
{
  return v0;
}

void OUTLINED_FUNCTION_76_6(uint64_t a1@<X8>)
{
  *(void *)(v2 - 112) = v1;
  *(void *)(v2 - 104) = a1;
}

uint64_t OUTLINED_FUNCTION_78_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  return sub_21D861B48((uint64_t)&a30, v30);
}

void OUTLINED_FUNCTION_79_5()
{
  *(void *)(*(void *)(v0 + 16) + 16) = v1 + 1;
}

uint64_t OUTLINED_FUNCTION_81_4()
{
  return v0;
}

double OUTLINED_FUNCTION_85_5()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_86_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_87_4@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 112) = v1;
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 96) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_88_4@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 112) = v1;
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 96) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_89_5()
{
  return sub_21D8ED0DC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_90_5(uint64_t result)
{
  *(void *)(v5 - 136) = result;
  *(void *)(v5 - 128) = v1;
  *(void *)(v5 - 160) = v3;
  *(void *)(v5 - 152) = v2;
  *(void *)(v5 - 144) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_92_2()
{
  return 34;
}

uint64_t OUTLINED_FUNCTION_95_2()
{
  return sub_21D8ED0DC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_96_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  return sub_21D8F2E90((uint64_t)&a42);
}

uint64_t OUTLINED_FUNCTION_98_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  return sub_21D861B48((uint64_t)&a28, v28);
}

uint64_t OUTLINED_FUNCTION_99_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  *(void *)(v9 + 16) = v10;
  return sub_21D861760(&a9, v9 + v12 * v11 + 32);
}

void OUTLINED_FUNCTION_100_2(uint64_t a1@<X8>)
{
  *(void *)(v2 - 112) = v1;
  *(void *)(v2 - 104) = a1;
}

uint64_t OUTLINED_FUNCTION_102_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t *a7@<X8>, uint64_t a8, uint64_t *a9)
{
  return sub_21D8F29DC(a1, a2, a3, a4, 0, 0, a5, a6, a7, a8, a9);
}

uint64_t OUTLINED_FUNCTION_103_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v17 - 136) = result;
  *(void *)(v17 - 128) = v14;
  *(void *)(v17 - 160) = a14;
  *(void *)(v17 - 152) = v16;
  *(void *)(v17 - 144) = v15;
  return result;
}

uint64_t OUTLINED_FUNCTION_104_3()
{
  return 0x5845444E49;
}

double OUTLINED_FUNCTION_107_2()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_108_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  return sub_21D861B48((uint64_t)&a26, v26);
}

uint64_t *OUTLINED_FUNCTION_109_1@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  a22 = v23;
  a23 = a1;
  return __swift_allocate_boxed_opaque_existential_1(&a19);
}

uint64_t OUTLINED_FUNCTION_110_2()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_111_2()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_112_2()
{
  return type metadata accessor for Expression();
}

double OUTLINED_FUNCTION_113_2()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_116_2()
{
  return sub_21D8ED0DC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_119_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  return sub_21D8F2E90((uint64_t)&a46);
}

uint64_t OUTLINED_FUNCTION_123_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  return sub_21D861B48((uint64_t)&a35, v35);
}

double OUTLINED_FUNCTION_125_1()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_126()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_127_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_128_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_130_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_131_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10)
{
  sub_21D907F44(v10, a10);
}

uint64_t OUTLINED_FUNCTION_133_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t *a7@<X8>, uint64_t a8, uint64_t *a9)
{
  return sub_21D8F29DC(a1, a2, a3, a4, 1, 0, a5, a6, a7, a8, a9);
}

uint64_t OUTLINED_FUNCTION_135(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,long long a29)
{
  *(void *)(v29 + 16) = v30;
  return sub_21D861760(&a29, v29 + v32 * v31 + 32);
}

uint64_t OUTLINED_FUNCTION_136_0()
{
  return sub_21D908300(34, 0xE100000000000000, v0, v1);
}

uint64_t OUTLINED_FUNCTION_137_0()
{
  return sub_21D908300(34, 0xE100000000000000, v1, v0);
}

uint64_t OUTLINED_FUNCTION_138_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_139_0(uint64_t result)
{
  *(void *)(v5 - 136) = result;
  *(void *)(v5 - 128) = v4;
  *(void *)(v5 - 160) = v1;
  *(void *)(v5 - 152) = v3;
  *(void *)(v5 - 144) = v2;
  return result;
}

void *Blob.init(bytes:length:)@<X0>(const void *a1@<X0>, int64_t a2@<X1>, void *a3@<X8>)
{
  double result = sub_21D8FAB30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t Blob.bytes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Blob.init(bytes:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::String __swiftcall Blob.toHex()()
{
  uint64_t v1 = *v0;
  int64_t v2 = *(void *)(*v0 + 16);
  if (v2)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21D8ED270(0, v2, 0);
    sub_21D8FABC0();
    uint64_t v3 = 0;
    do
    {
      unsigned int v4 = *(unsigned __int8 *)(v1 + v3 + 32);
      if (v4 >= 0x10) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = 48;
      }
      if (v4 >= 0x10) {
        unint64_t v6 = 0xE000000000000000;
      }
      else {
        unint64_t v6 = 0xE100000000000000;
      }
      sub_21D915558();
      swift_bridgeObjectRetain();
      sub_21D9154F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v8 = *(void *)(v16 + 16);
      unint64_t v7 = *(void *)(v16 + 24);
      if (v8 >= v7 >> 1) {
        sub_21D8ED270((char *)(v7 > 1), v8 + 1, 1);
      }
      ++v3;
      *(void *)(v16 + 16) = v8 + 1;
      uint64_t v9 = v16 + 16 * v8;
      *(void *)(v9 + 32) = v5;
      *(void *)(v9 + 40) = v6;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD31030);
  sub_21D888E54();
  uint64_t v10 = sub_21D915378();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = v10;
  uint64_t v14 = v12;
  result._object = v14;
  result._uint64_t countAndFlagsBits = v13;
  return result;
}

uint64_t Blob.description.getter()
{
  return 10104;
}

BOOL == infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_21D8FAABC(*a1, *a2);
}

BOOL sub_21D8FAABC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (unsigned __int8 *)(a1 + 33);
  unint64_t v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

void *sub_21D8FAB30(const void *a1, int64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F390);
    uint64_t v4 = (void *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    uint64_t v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

unint64_t sub_21D8FABC0()
{
  unint64_t result = qword_267D15A88;
  if (!qword_267D15A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15A88);
  }
  return result;
}

ValueMetadata *type metadata accessor for Blob()
{
  return &type metadata for Blob;
}

void *sub_21D8FAC1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310D0);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  long long v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_21D907CCC((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21D89B0A4();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

double sub_21D8FAD00@<D0>(uint64_t a1@<X8>)
{
  return sub_21D8FAF7C(*(void *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_21D8FAD08@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21D913698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8D310];
  *(_OWORD *)(v8 + 16) = xmmword_21D917DB0;
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = &protocol witness table for String;
  if (qword_26AD2F270 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v10 = (id)qword_26AD2F268;
  uint64_t v11 = (void *)sub_21D913608();
  id v12 = objc_msgSend(v10, sel_stringFromDate_, v11);

  uint64_t v13 = sub_21D9153D8();
  uint64_t v15 = v14;

  *(void *)(v8 + 32) = v13;
  *(void *)(v8 + 40) = v15;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a1 = 63;
  a1[1] = 0xE100000000000000;
  a1[2] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FAEF0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21D917DB0;
  *(void *)(v4 + 56) = &type metadata for Blob;
  *(void *)(v4 + 64) = &protocol witness table for Blob;
  *(void *)(v4 + 32) = a1;
  *a2 = 63;
  a2[1] = 0xE100000000000000;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

double sub_21D8FAF7C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_21D86EA3C(a1, a2);
  sub_21D8FBCE4(a1, a2, &v7);
  *(void *)a3 = v7;
  double result = *(double *)&v8;
  *(_OWORD *)(a3 + 8) = v8;
  return result;
}

uint64_t sub_21D8FAFD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = MEMORY[0x263F8D310];
  *(_OWORD *)(v6 + 16) = xmmword_21D917DB0;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = &protocol witness table for String;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  *a3 = 63;
  a3[1] = 0xE100000000000000;
  a3[2] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FB070@<X0>(char a1@<W0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21D917DB0;
  *(void *)(v4 + 56) = MEMORY[0x263F8E5C0];
  *(void *)(v4 + 64) = &protocol witness table for Int64;
  *(void *)(v4 + 32) = a1 & 1;
  *a2 = 63;
  a2[1] = 0xE100000000000000;
  a2[2] = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FB0F8@<X0>(void *a1@<X8>, double a2@<D0>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8D538];
  *(_OWORD *)(v4 + 16) = xmmword_21D917DB0;
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = &protocol witness table for Double;
  *(double *)(v4 + 32) = a2;
  *a1 = 63;
  a1[1] = 0xE100000000000000;
  a1[2] = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FB184@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8E5C0];
  *(_OWORD *)(v4 + 16) = xmmword_21D917DB0;
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = &protocol witness table for Int64;
  *(void *)(v4 + 32) = a1;
  *a2 = 63;
  a2[1] = 0xE100000000000000;
  a2[2] = v4;
  return swift_bridgeObjectRelease();
}

uint64_t Value.expression.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Expression();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v2, a1);
  uint64_t WitnessTable = swift_getWitnessTable();
  ExpressionType<>.init(value:)((uint64_t)v9, v10, WitnessTable, a2);
  v13[0] = v13[3];
  v13[1] = v13[4];
  v13[2] = v13[5];
  ExpressionType.expression.getter();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for Expression()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t ExpressionType.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  uint64_t v12 = v11;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(a3, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 40))(v10, v12, v13, a2, a4);
  OUTLINED_FUNCTION_7();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
  return v15(a1, a3);
}

uint64_t ExpressionType.init(literal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(a4 + 40))(a1, a2, MEMORY[0x263F8EE78], a3, a4);
}

uint64_t ExpressionType.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_21D908300(34, 0xE100000000000000, a1, a2);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 40);
  uint64_t v10 = MEMORY[0x263F8EE78];
  return v9(v6, v8, v10, a3, a4);
}

uint64_t sub_21D8FB520()
{
  return ExpressionType.expression.getter();
}

uint64_t ExpressionType.expression.getter()
{
  OUTLINED_FUNCTION_2_9();
  uint64_t v4 = (*(uint64_t (**)(void))(v3 + 24))();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v1, v0);
  *uint64_t v2 = v4;
  v2[1] = v6;
  v2[2] = result;
  return result;
}

uint64_t sub_21D8FB59C()
{
  return sub_21D8E947C(*v0, v0[1], v0[2]);
}

uint64_t ExpressionType<>.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  v25[1] = a5;
  uint64_t v26 = a2;
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_21D9158C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v25 - v12;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  v25[0] = v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)v25 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_21D917DB0;
  int v20 = (uint64_t *)(v19 + 32);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v28 = a1;
  v21(v13, a1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    *(void *)(v19 + 64) = 0;
    *(_OWORD *)int v20 = 0u;
    *(_OWORD *)(v19 + 48) = 0u;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 56))(AssociatedTypeWitness, a4);
    OUTLINED_FUNCTION_7();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, AssociatedTypeWitness);
    *(void *)(v19 + 56) = v14;
    *(void *)(v19 + 64) = swift_getAssociatedConformanceWitness();
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25[0] + 32))(boxed_opaque_existential_1, v18, v14);
  }
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v27 + 40))(63, 0xE100000000000000, v19, v26);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v28, v8);
}

Swift::String __swiftcall Expressible.asSQL()()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 8))(&v10);
  uint64_t v1 = v12;
  uint64_t v2 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v2 = v10 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v12 = 0;
  uint64_t v13 = v2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_21D915528();
  if (!v4)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v3 = 0;
    uint64_t v4 = (void *)0xE000000000000000;
    goto LABEL_18;
  }
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  unint64_t v7 = 0;
  while (1)
  {
    if (v5 != 63 || v6 != (void *)0xE100000000000000)
    {
      uint64_t v3 = sub_21D915C28();
      if ((v3 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        goto LABEL_14;
      }
    }
    if ((v7 & 0x8000000000000000) != 0) {
      break;
    }
    if (v7 >= *(void *)(v1 + 16)) {
      goto LABEL_17;
    }
    sub_21D908890(v1 + 32 + 40 * v7++);
LABEL_14:
    swift_bridgeObjectRetain();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_21D915528();
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    if (!v4) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t Expression.init(_:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t Expression.template.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Expression.template.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Expression.template.modify())()
{
  return nullsub_1;
}

uint64_t Expression.bindings.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Expression.bindings.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Expression.bindings.modify())()
{
  return nullsub_1;
}

uint64_t sub_21D8FBB00()
{
  swift_getWitnessTable();
  return ExpressionType.expression.getter();
}

uint64_t ExpressionType.asc.getter()
{
  OUTLINED_FUNCTION_2_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_3_12(inited, (__n128)xmmword_21D917D30);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_10();
  v1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[1] = 4412225;
  inited[5].n128_u64[0] = 0xE300000000000000;
  OUTLINED_FUNCTION_5_16(v2, MEMORY[0x263F8EE78]);
  swift_setDeallocating();
  return sub_21D8ECF90();
}

uint64_t ExpressionType.desc.getter()
{
  OUTLINED_FUNCTION_2_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_3_12(inited, (__n128)xmmword_21D917D30);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_10();
  v1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[1] = 1129530692;
  inited[5].n128_u64[0] = 0xE400000000000000;
  OUTLINED_FUNCTION_5_16(v2, MEMORY[0x263F8EE78]);
  swift_setDeallocating();
  return sub_21D8ECF90();
}

uint64_t sub_21D8FBCE4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21D917DB0;
  unint64_t v7 = (void *)(v6 + 32);
  *(void *)(v6 + 56) = &type metadata for Blob;
  *(void *)(v6 + 64) = &protocol witness table for Blob;
  uint64_t v8 = v6;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x21D8FBE8CLL);
      }
      sub_21D86EA3C(a1, a2);
      sub_21D8E3C18((int)a1, a1 >> 32, a1, a2, v7);
      break;
    case 2uLL:
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      sub_21D86EA3C(a1, a2);
      sub_21D914698();
      sub_21D914698();
      sub_21D8E3C18(v12, v13, a1, a2, v7);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      uint64_t v10 = (void *)(v6 + 32);
      uint64_t v11 = 0;
      uint64_t v9 = 0;
      goto LABEL_7;
    default:
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
      uint64_t v10 = (void *)(v6 + 32);
      uint64_t v11 = a1;
LABEL_7:
      sub_21D8E3CD8(v11, v9, a1, a2, v10);
      break;
  }
  uint64_t result = sub_21D86E924(a1, a2);
  *a3 = 63;
  a3[1] = 0xE100000000000000;
  a3[2] = v8;
  return result;
}

uint64_t ExpressionType<>.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21D917DB0;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(a4 + 56);
  swift_getAssociatedTypeWitness();
  *(void *)(v8 + 56) = swift_getAssociatedTypeWitness();
  *(void *)(v8 + 64) = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  uint64_t v10 = swift_checkMetadataState();
  v9(v10, a4);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(a3 + 40))(63, 0xE100000000000000, v8, a2, a3);
  OUTLINED_FUNCTION_7();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  return v12(a1, v10);
}

uint64_t static ExpressionType<>.null.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_21D9158C8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - v10;
  __swift_storeEnumTagSinglePayload((uint64_t)&v13 - v10, 1, 1, AssociatedTypeWitness);
  return ExpressionType<>.init(value:)((uint64_t)v11, a1, a2, a3, a4);
}

uint64_t sub_21D8FC124()
{
  uint64_t result = sub_21D908300(34, 0xE100000000000000, 0x4449574F52, 0xE500000000000000);
  qword_267D15A90 = result;
  *(void *)algn_267D15A98 = v1;
  qword_267D15AA0 = MEMORY[0x263F8EE78];
  return result;
}

uint64_t rowid.getter@<X0>(void *a1@<X8>)
{
  if (qword_267D15990 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_267D15A98;
  uint64_t v3 = qword_267D15AA0;
  *a1 = qword_267D15A90;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t cast<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_1_11();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_13();
  (*(void (**)(uint64_t, uint64_t))(a5 + 40))(a3, a5);
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  *uint64_t v5 = v10;
  v5[1] = v11;
  long long v5[2] = v6;
  return swift_bridgeObjectRetain();
}

{
  void *v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t vars8;

  OUTLINED_FUNCTION_1_11();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_13();
  (*(void (**)(uint64_t, uint64_t))(a5 + 40))(a3, a5);
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  sub_21D9158C8();
  *uint64_t v5 = v10;
  v5[1] = v11;
  long long v5[2] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21D8FC388@<X0>(void *a1@<X8>)
{
  return sub_21D8FB0F8(a1, *v1);
}

uint64_t sub_21D8FC390@<X0>(void *a1@<X8>)
{
  return sub_21D8FAFD8(*v1, v1[1], a1);
}

uint64_t sub_21D8FC398@<X0>(void *a1@<X8>)
{
  return sub_21D8FAEF0(*v1, a1);
}

uint64_t sub_21D8FC3A0@<X0>(void *a1@<X8>)
{
  return sub_21D8FB070(*v1, a1);
}

uint64_t sub_21D8FC3A8@<X0>(void *a1@<X8>)
{
  return sub_21D8FB184(*v1, a1);
}

uint64_t dispatch thunk of ExpressionType.template.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ExpressionType.bindings.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ExpressionType.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of Expressible.expression.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return swift_bridgeObjectRetain();
}

uint64_t *OUTLINED_FUNCTION_3_12(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  uint64_t v6 = (uint64_t *)&a1[2];
  *(void *)(v4 + 56) = v3;
  *(void *)(v4 + 64) = *(void *)(v2 + 8);
  return __swift_allocate_boxed_opaque_existential_1(v6);
}

void OUTLINED_FUNCTION_5_16(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 + 88) = a2;
  *(void *)(v3 + 96) = a1;
  sub_21D907F44(v3, v2);
}

uint64_t OUTLINED_FUNCTION_6_13()
{
  return sub_21D9154F8();
}

uint64_t Connection.prepare(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D8FE470(a1, a2, a3, Statement.bind(_:));
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  if (*(void *)(a3 + 16))
  {
    uint64_t result = Connection.prepare(_:_:)(a1, a2, MEMORY[0x263F8EE78]);
    if (!v4)
    {
      unint64_t v7 = Statement.bind(_:)(a3);
      swift_release();
      return v7;
    }
  }
  else
  {
    type metadata accessor for Statement();
    swift_allocObject();
    sub_21D914698();
    swift_bridgeObjectRetain();
    return sub_21D905D90(v3);
  }
  return result;
}

{
  return sub_21D8FE470(a1, a2, a3, Statement.bind(_:));
}

uint64_t Connection.scalar(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_21D8FE5F4(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:), a4);
}

{
  return Connection.scalar(_:_:)(a1, a2, a3, a4);
}

{
  return sub_21D8FE5F4(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:), a4);
}

uint64_t Connection.run(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D8FE518(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

{
  return Connection.run(_:_:)(a1, a2, a3);
}

{
  return sub_21D8FE518(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

sqlite3_int64 Connection.lastInsertRowid.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_last_insert_rowid(v0);
}

BOOL sub_21D8FC584(uint64_t a1, uint64_t a2)
{
  sub_21D89FBB8();
  if (qword_26AD30D38 != -1) {
    swift_once();
  }
  sub_21D9157A8();
  uint64_t v5 = sub_21D8FE138();
  if ((v12 & 1) != 0 || v11 != v5)
  {
    id v9 = *(id *)(a1 + 88);
    sub_21D9157E8();
    swift_release();

    if (!v2) {
      return v13;
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v6 = sqlite3_step(*(sqlite3_stmt **)(a2 + 16));
    int v7 = v6;
    sub_21D8FE038(v6, 0);
    swift_release();
    if (!v2) {
      return v7 == 100;
    }
  }
  return v8;
}

void sub_21D8FC6D8()
{
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_0_10();
  if (qword_26AD30D38 != -1) {
    swift_once();
  }
  sub_21D9157A8();
  uint64_t v4 = OUTLINED_FUNCTION_6_14();
  if ((v3 & 1) != 0 || v2 != v4)
  {
    id v5 = *(id *)(v1 + 88);
    OUTLINED_FUNCTION_5_17();
    if (v0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();

      goto LABEL_12;
    }
    swift_release();

LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_1_12();
  if (!v0)
  {
    swift_release();
    uint64_t v6 = (sqlite3 *)Connection.handle.getter();
    sqlite3_last_insert_rowid(v6);
    swift_release();
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_12:
  OUTLINED_FUNCTION_4_8();
}

void sub_21D8FC820()
{
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_0_10();
  if (qword_26AD30D38 != -1) {
    swift_once();
  }
  sub_21D9157A8();
  uint64_t v4 = OUTLINED_FUNCTION_6_14();
  if ((v3 & 1) != 0 || v2 != v4)
  {
    id v5 = *(id *)(v1 + 88);
    OUTLINED_FUNCTION_5_17();
    if (v0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();

      goto LABEL_12;
    }
    swift_release();

LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_1_12();
  if (!v0)
  {
    swift_release();
    uint64_t v6 = (sqlite3 *)Connection.handle.getter();
    sqlite3_changes(v6);
    swift_release();
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_12:
  OUTLINED_FUNCTION_4_8();
}

uint64_t sub_21D8FC96C(uint64_t a1)
{
  sub_21D89FBB8();
  if (qword_26AD30D38 != -1) {
    swift_once();
  }
  sub_21D9157A8();
  uint64_t v3 = sub_21D8FE138();
  if ((v9 & 1) != 0 || v8 != v3)
  {
    uint64_t v6 = (uint64_t)*(id *)(a1 + 88);
    sub_21D9157E8();
    if (v1)
    {
      swift_bridgeObjectRelease();
      swift_release();

      return v6;
    }
    swift_release();

    uint64_t v6 = v10;
LABEL_11:
    swift_bridgeObjectRelease();
    return v6;
  }
  uint64_t v4 = (sqlite3 *)Connection.handle.getter();
  uint64_t v5 = sub_21D915458();
  uint64_t v6 = sqlite3_exec(v4, (const char *)(v5 + 32), 0, 0, 0);
  swift_release();
  sub_21D8FE038(v6, 0);
  if (!v1)
  {
    swift_release();
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v6;
}

uint64_t sub_21D8FCB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21D89FBB8();
  if (qword_26AD30D38 != -1) {
    swift_once();
  }
  sub_21D9157A8();
  uint64_t v13 = sub_21D8FE138();
  if ((v20 & 1) != 0 || v19 != v13)
  {
    id v14 = *(id *)(a1 + 88);
    sub_21D9157E8();
    if (v21)
    {
      swift_bridgeObjectRelease();
      swift_release();

      goto LABEL_9;
    }
    swift_release();

LABEL_12:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  sub_21D8FEACC(a2, a3, a4, a5, a6, a7, a8);
  if (!v21)
  {
    swift_release();
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_release();
LABEL_9:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Connection.changes.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_changes(v0);
}

uint64_t sub_21D8FCD2C(char a1, char a2)
{
  uint64_t v2 = 0x53534F5243;
  if (a1)
  {
    OUTLINED_FUNCTION_19_9();
    if (v3) {
      uint64_t v5 = 0x52454E4E49;
    }
    else {
      uint64_t v5 = 0x54554F205446454CLL;
    }
    if (v3) {
      unint64_t v6 = v4;
    }
    else {
      unint64_t v6 = 0xEA00000000005245;
    }
  }
  else
  {
    unint64_t v6 = 0xE500000000000000;
    uint64_t v5 = 0x53534F5243;
  }
  if (a2)
  {
    OUTLINED_FUNCTION_19_9();
    if (v7) {
      uint64_t v2 = 0x52454E4E49;
    }
    else {
      uint64_t v2 = 0x54554F205446454CLL;
    }
    if (v7) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = 0xEA00000000005245;
    }
  }
  else
  {
    unint64_t v9 = 0xE500000000000000;
  }
  if (v5 == v2 && v6 == v9) {
    char v11 = 1;
  }
  else {
    char v11 = sub_21D915C28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_21D8FCE28(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE90000000000004ELL;
  uint64_t v3 = 0x4F49544341204F4ELL;
  uint64_t v4 = a1;
  uint64_t v5 = 0x4F49544341204F4ELL;
  unint64_t v6 = 0xE90000000000004ELL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x5443495254534552;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x4C4C554E20544553;
      break;
    case 3:
      uint64_t v5 = 0x4146454420544553;
      unint64_t v6 = 0xEB00000000544C55;
      break;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x45444143534143;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x5443495254534552;
      break;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x4C4C554E20544553;
      break;
    case 3:
      uint64_t v3 = 0x4146454420544553;
      unint64_t v2 = 0xEB00000000544C55;
      break;
    case 4:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x45444143534143;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_21D915C28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21D8FCFF4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x4543414C504552;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x4543414C504552;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x4B4341424C4C4F52;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x54524F4241;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1279869254;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x45524F4E4749;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x4B4341424C4C4F52;
      break;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x54524F4241;
      break;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1279869254;
      break;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x45524F4E4749;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_21D915C28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21D8FD188(char a1, char a2)
{
  unint64_t v2 = 0xE900000000000045;
  uint64_t v3 = 0x4445525245464544;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 0x54414944454D4D49;
    }
    else {
      uint64_t v4 = 0x564953554C435845;
    }
    unint64_t v5 = 0xE900000000000045;
  }
  else
  {
    unint64_t v5 = 0xE800000000000000;
    uint64_t v4 = 0x4445525245464544;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 0x54414944454D4D49;
    }
    else {
      uint64_t v3 = 0x564953554C435845;
    }
  }
  else
  {
    unint64_t v2 = 0xE800000000000000;
  }
  if (v4 == v3 && v5 == v2) {
    char v7 = 1;
  }
  else {
    char v7 = sub_21D915C28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21D8FD28C(char a1)
{
  return sub_21D8FD718(0, a1);
}

uint64_t sub_21D8FD298(uint64_t a1)
{
  return sub_21D8FD2C8(a1, (void (*)(unsigned char *, uint64_t))sub_21D8FD48C);
}

uint64_t sub_21D8FD2B0(uint64_t a1)
{
  return sub_21D8FD2C8(a1, (void (*)(unsigned char *, uint64_t))sub_21D8FD39C);
}

uint64_t sub_21D8FD2C8(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_21D915CE8();
  a2(v5, a1);
  return sub_21D915D18();
}

uint64_t sub_21D8FD318()
{
  return sub_21D8FD5F4();
}

uint64_t sub_21D8FD324(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_19_9();
  }
  else {
    OUTLINED_FUNCTION_18_9();
  }
  sub_21D9154B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FD39C()
{
  sub_21D9154B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FD48C()
{
  sub_21D9154B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FD560()
{
  sub_21D9154B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FD5F4()
{
  return sub_21D915D18();
}

uint64_t sub_21D8FD69C(uint64_t a1, uint64_t a2)
{
  return sub_21D8FD6CC(a1, a2, (void (*)(unsigned char *, uint64_t))sub_21D8FD48C);
}

uint64_t sub_21D8FD6B4(uint64_t a1, uint64_t a2)
{
  return sub_21D8FD6CC(a1, a2, (void (*)(unsigned char *, uint64_t))sub_21D8FD39C);
}

uint64_t sub_21D8FD6CC(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_21D915CE8();
  a3(v6, a2);
  return sub_21D915D18();
}

uint64_t sub_21D8FD718(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_19_9();
  }
  else {
    OUTLINED_FUNCTION_18_9();
  }
  sub_21D9154B8();
  swift_bridgeObjectRelease();
  return sub_21D915D18();
}

void Connection.createFunction(_:argumentCount:deterministic:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  if ((a4 & 1) == 0)
  {
    uint64_t v13 = a3;
    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
    __break(1u);
  }
  uint64_t v13 = -1;
LABEL_5:
  uint64_t v14 = OUTLINED_FUNCTION_7_11();
  *(void *)(v14 + 16) = a6;
  *(void *)(v14 + 24) = a7;
  aBlock[4] = sub_21D9004DC;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21D8FFC08;
  aBlock[3] = &block_descriptor_9;
  uint64_t v15 = _Block_copy(aBlock);
  sub_21D914698();
  swift_release();
  uint64_t v16 = Connection.handle.getter();
  if (v13 > 0x7FFFFFFF)
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = (sqlite3 *)v16;
    if (a5) {
      int v18 = 2049;
    }
    else {
      int v18 = 1;
    }
    uint64_t v19 = sub_21D915458();
    sqlite3_create_function_v2(v17, (const char *)(v19 + 32), v13, v18, v15, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_21D8FFCD0, 0, 0, 0);
    swift_release();
    swift_beginAccess();
    uint64_t v20 = *(void *)(v7 + 72);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_21D877ADC(a1, a2, v20);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v21)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D15AA8);
      uint64_t v22 = sub_21D915338();
      swift_beginAccess();
      sub_21D90067C(v22, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21D900EE0);
      swift_endAccess();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_21D8FFCD4(aBlock, a1, a2);
    uint64_t v31 = v23;
    if (*v24)
    {
      _Block_copy(v15);
      uint64_t v32 = sub_21D9004FC((uint64_t)v15, v13);
      uint64_t v40 = OUTLINED_FUNCTION_13_11(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)xDestroy, v43, v44, v45, aBlock[0]);
      v31((void **)v40);
      swift_endAccess();
      _Block_release(v15);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v41 = OUTLINED_FUNCTION_13_11((uint64_t)v23, (uint64_t)v24, v25, v26, v27, v28, v29, v30, (uint64_t)xDestroy, v43, v44, v45, aBlock[0]);
      v31((void **)v41);
      swift_endAccess();
      swift_bridgeObjectRelease();
      _Block_release(v15);
    }
  }
}

uint64_t sub_21D8FDA74@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  switch(result)
  {
    case 9:
      char v2 = 2;
      goto LABEL_7;
    case 0x12:
      char v2 = 0;
LABEL_7:
      *a2 = v2;
      return result;
    case 0x17:
      char v2 = 1;
      goto LABEL_7;
  }
  sub_21D915A08();
  swift_bridgeObjectRelease();
  sub_21D915BE8();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  uint64_t result = sub_21D915B38();
  __break(1u);
  return result;
}

BOOL static Connection.Operation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Connection.Operation.hash(into:)()
{
  return sub_21D915CF8();
}

uint64_t Connection.Operation.hashValue.getter()
{
  return sub_21D915D18();
}

uint64_t Connection.handle.getter()
{
  swift_beginAccess();
  uint64_t result = *(void *)(v0 + 16);
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t Connection.__allocating_init(_:readonly:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  Connection.init(_:readonly:)(a1, a2);
  return v4;
}

uint64_t Connection.init(_:readonly:)(uint64_t a1, char a2)
{
  uint64_t v3 = sub_21D9157C8();
  uint64_t v17 = *(void *)(v3 - 8);
  uint64_t v18 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_94();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_21D915218();
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_94();
  uint64_t v8 = sub_21D915788();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_94();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  unint64_t v9 = (sqlite3 **)(v2 + 16);
  *(_OWORD *)(v2 + 48) = 0u;
  uint64_t v10 = MEMORY[0x263F8EE80];
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = v10;
  *(void *)(v2 + 80) = v10;
  sub_21D89FBB8();
  sub_21D90057C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD31040);
  sub_21D9005CC();
  sub_21D915928();
  sub_21D9151F8();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v6, *MEMORY[0x263F8F130], v18);
  *(void *)(v2 + 88) = sub_21D915808();
  *(void *)(v2 + 96) = 0;
  *(unsigned char *)(v2 + 104) = 1;
  OUTLINED_FUNCTION_3_13();
  if (a2) {
    int v11 = 65537;
  }
  else {
    int v11 = 3211270;
  }
  uint64_t v12 = sub_21D915458();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v13 = sqlite3_open_v2((const char *)(v12 + 32), v9, v11, 0);
  swift_endAccess();
  swift_release();
  sub_21D8FE038(v13, 0);
  if (v21)
  {
    swift_release();
  }
  else
  {
    uint64_t v14 = qword_26AD30D38;
    id v15 = *(id *)(v19 + 88);
    if (v14 != -1) {
      swift_once();
    }
    sub_21D8FE138();
    sub_21D9157B8();
  }
  return v19;
}

uint64_t Connection.Location.description.getter()
{
  OUTLINED_FUNCTION_3_13();
  if (v1 == 1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v0;
  }
  if (v1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v2;
  }
  sub_21D900620(v0, v1);
  return v4;
}

const char *sub_21D8FE038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = qword_26AD30ED0;
  sub_21D914698();
  sub_21D914698();
  if (v4 != -1) {
    swift_once();
  }
  if (sub_21D9001A0(a1, qword_26AD30EC8))
  {
    swift_release();
    swift_release();
    return (const char *)a1;
  }
  uint64_t v5 = (sqlite3 *)Connection.handle.getter();
  uint64_t result = sqlite3_errmsg(v5);
  if (result)
  {
    uint64_t v7 = sub_21D915508();
    uint64_t v9 = v8;
    swift_release();
    sub_21D9011D0();
    swift_allocError();
    *(void *)uint64_t v10 = v7;
    *(void *)(v10 + 8) = v9;
    *(_DWORD *)(v10 + 16) = a1;
    *(void *)(v10 + 24) = a2;
    swift_willThrow();
    return (const char *)a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_21D8FE138()
{
  uint64_t result = v0;
  if (*(unsigned char *)(v0 + 104) != 1) {
    return *(void *)(v0 + 96);
  }
  *(void *)(v0 + 96) = v0;
  *(unsigned char *)(v0 + 104) = 0;
  return result;
}

uint64_t Connection.__allocating_init(_:readonly:)(uint64_t a1, uint64_t a2, char a3)
{
  v6[1] = a2;
  v6[0] = a1;
  uint64_t v4 = swift_allocObject();
  Connection.init(_:readonly:)((uint64_t)v6, a3);
  return v4;
}

uint64_t Connection.deinit()
{
  unint64_t v1 = (sqlite3 *)Connection.handle.getter();
  sqlite3_close(v1);
  _Block_release(*(const void **)(v0 + 32));
  _Block_release(*(const void **)(v0 + 40));
  _Block_release(*(const void **)(v0 + 48));
  _Block_release(*(const void **)(v0 + 56));
  _Block_release(*(const void **)(v0 + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t Connection.__deallocating_deinit()
{
  Connection.deinit();
  return MEMORY[0x270FA0228](v0, 105, 7);
}

BOOL Connection.readonly.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_db_readonly(v0, 0) == 1;
}

uint64_t Connection.totalChanges.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_total_changes(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Connection.execute(_:)(Swift::String a1)
{
  sub_21D914698();
  swift_bridgeObjectRetain();
  sub_21D8FC96C(v1);
}

const char *sub_21D8FE2E0@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v3 = (sqlite3 *)Connection.handle.getter();
  uint64_t v4 = sub_21D915458();
  uint64_t v5 = sqlite3_exec(v3, (const char *)(v4 + 32), 0, 0, 0);
  swift_release();
  uint64_t result = sub_21D8FE038(v5, 0);
  if (!v1) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_21D8FE470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = Connection.prepare(_:_:)(a1, a2, MEMORY[0x263F8EE78]);
  if (!v4)
  {
    uint64_t v8 = a4(a3);
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_21D8FE518(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  Connection.prepare(_:_:)(a1, a2, MEMORY[0x263F8EE78]);
  if (!v5)
  {
    a4(a3);
    uint64_t v4 = Statement.run(_:)(MEMORY[0x263F8EE78]);
    swift_release();
    swift_release();
  }
  return v4;
}

uint64_t sub_21D8FE5F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = Connection.prepare(_:_:)(a1, a2, MEMORY[0x263F8EE78]);
  if (!v5)
  {
    a4(a3);
    Statement.scalar(_:)(MEMORY[0x263F8EE78], a5);
    swift_release();
    return swift_release();
  }
  return result;
}

RRSQLite::Connection::TransactionMode_optional __swiftcall Connection.TransactionMode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21D915BA8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t Connection.TransactionMode.rawValue.getter()
{
  uint64_t v1 = 0x54414944454D4D49;
  if (*v0 != 1) {
    uint64_t v1 = 0x564953554C435845;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4445525245464544;
  }
}

uint64_t sub_21D8FE744(char *a1, char *a2)
{
  return sub_21D8FD188(*a1, *a2);
}

uint64_t sub_21D8FE750()
{
  return sub_21D8FD318();
}

uint64_t sub_21D8FE758()
{
  return sub_21D8FD560();
}

uint64_t sub_21D8FE760()
{
  return sub_21D8FD5F4();
}

RRSQLite::Connection::TransactionMode_optional sub_21D8FE768(Swift::String *a1)
{
  return Connection.TransactionMode.init(rawValue:)(*a1);
}

uint64_t sub_21D8FE774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Connection.TransactionMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t Connection.transaction(_:block:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FE908(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_21D914698();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_21D8FCB24(v6, v6, a1, a2, a3, a4, a5, a6);
}

uint64_t Connection.savepoint(_:block:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FEACC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = Connection.run(_:_:)(a2, a3, MEMORY[0x263F8EE78]);
  if (!v7)
  {
    uint64_t v12 = swift_release();
    a4(v12);
    Connection.run(_:_:)(a6, a7, MEMORY[0x263F8EE78]);
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall Connection.interrupt()()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  sqlite3_interrupt(v0);
}

double Connection.busyTimeout.getter()
{
  swift_beginAccess();
  return *(double *)(v0 + 24);
}

double sub_21D8FEC24@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  double result = *(double *)(v3 + 24);
  *a2 = result;
  return result;
}

uint64_t Connection.busyTimeout.setter(double a1)
{
  swift_beginAccess();
  *(double *)(v1 + 24) = a1;
  return sub_21D8FECB0();
}

uint64_t sub_21D8FECB0()
{
  uint64_t v1 = (sqlite3 *)Connection.handle.getter();
  uint64_t result = swift_beginAccess();
  double v3 = *(double *)(v0 + 24) * 1000.0;
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -2147483650.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 2147483650.0) {
    return sqlite3_busy_timeout(v1, (int)v3);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t (*Connection.busyTimeout.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_21D8FEDA0;
}

uint64_t sub_21D8FEDA0(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_21D8FECB0();
  }
  return result;
}

void Connection.busyHandler(_:)(uint64_t a1)
{
  if (a1)
  {
    OUTLINED_FUNCTION_17_6();
    uint64_t v4 = OUTLINED_FUNCTION_7_11();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_21D900634;
    v11[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_11_9();
    v11[2] = sub_21D8FEEE0;
    void v11[3] = &block_descriptor_6_0;
    _Block_copy(v11);
    OUTLINED_FUNCTION_2_10();
    swift_release();
    char v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_busy_handler(v5, (int (__cdecl *)(void *, int))sub_21D8FEF3C, v3);
    uint64_t v6 = *(const void **)(v2 + 32);
    *(void *)(v2 + 32) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_28_0();
    sqlite3_busy_handler(v7, v8, v9);
    uint64_t v10 = *(const void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_21D8FEEE0(uint64_t a1, uint64_t a2)
{
  double v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_21D914698();
  uint64_t v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t sub_21D8FEF30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_21D8FEF44(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    v11[4] = sub_21D901174;
    v11[5] = v5;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_21D8FF094;
    void v11[3] = &block_descriptor_48;
    uint64_t v6 = _Block_copy(v11);
    swift_retain_n();
    swift_release();
    uint64_t v7 = (sqlite3 *)Connection.handle.getter();
    sqlite3_trace_v2(v7, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_21D9004A0, v6);
    sub_21D87428C(a1);
    uint64_t v8 = *(const void **)(v2 + 40);
    *(void *)(v2 + 40) = v6;
    _Block_release(v8);
  }
  else
  {
    uint64_t v9 = (sqlite3 *)Connection.handle.getter();
    sqlite3_trace_v2(v9, 0, 0, 0);
    uint64_t v10 = *(const void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_21D8FF094(uint64_t a1, uint64_t a2)
{
  double v3 = *(void (**)(uint64_t))(a1 + 32);
  sub_21D914698();
  v3(a2);
  return swift_release();
}

void Connection.updateHook(_:)(uint64_t a1)
{
  if (a1)
  {
    OUTLINED_FUNCTION_17_6();
    uint64_t v4 = OUTLINED_FUNCTION_7_11();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_21D900664;
    v11[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_11_9();
    v11[2] = sub_21D8FF29C;
    void v11[3] = &block_descriptor_12_0;
    _Block_copy(v11);
    OUTLINED_FUNCTION_2_10();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_update_hook(v5, (void (__cdecl *)(void *, int, const char *, const char *, sqlite3_int64))sub_21D8FF330, v3);
    uint64_t v6 = *(const void **)(v2 + 48);
    *(void *)(v2 + 48) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_28_0();
    sqlite3_update_hook(v7, v8, v9);
    uint64_t v10 = *(const void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_21D8FF1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_21D8FDA74(a1, &v13);
  uint64_t v7 = sub_21D915508();
  uint64_t v9 = v8;
  uint64_t v10 = sub_21D915508();
  a5(&v13, v7, v9, v10, v11, a4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D8FF29C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  sub_21D914698();
  v9(a2, a3, a4, a5);
  return swift_release();
}

uint64_t sub_21D8FF314(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    if (a4) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void Connection.commitHook(_:)(uint64_t a1)
{
  if (a1)
  {
    OUTLINED_FUNCTION_17_6();
    uint64_t v4 = OUTLINED_FUNCTION_7_11();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_21D90066C;
    v11[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_11_9();
    v11[2] = sub_21D8FF494;
    void v11[3] = &block_descriptor_18_0;
    _Block_copy(v11);
    OUTLINED_FUNCTION_2_10();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_commit_hook(v5, (int (__cdecl *)(void *))sub_21D8FF4E0, v3);
    uint64_t v6 = *(const void **)(v2 + 56);
    *(void *)(v2 + 56) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_28_0();
    sqlite3_commit_hook(v7, v8, v9);
    uint64_t v10 = *(const void **)(v2 + 56);
    *(void *)(v2 + 56) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_21D8FF440(void (*a1)(void))
{
  return 0;
}

uint64_t sub_21D8FF494(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_21D914698();
  uint64_t v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_21D8FF4D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void Connection.rollbackHook(_:)(uint64_t a1)
{
  if (a1)
  {
    OUTLINED_FUNCTION_17_6();
    uint64_t v4 = OUTLINED_FUNCTION_7_11();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_21D8D3578;
    v11[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_11_9();
    v11[2] = sub_21D8766F8;
    void v11[3] = &block_descriptor_24_0;
    _Block_copy(v11);
    OUTLINED_FUNCTION_2_10();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_rollback_hook(v5, (void (__cdecl *)(void *))sub_21D8FF5F0, v3);
    uint64_t v6 = *(const void **)(v2 + 64);
    *(void *)(v2 + 64) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_28_0();
    sqlite3_rollback_hook(v7, v8, v9);
    uint64_t v10 = *(const void **)(v2 + 64);
    *(void *)(v2 + 64) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_21D8FF5F4(uint64_t a1, int a2, uint64_t a3, void (*a4)(void *__return_ptr, void), int a5)
{
  void (*v19)(void *__return_ptr, void);
  sqlite3_int64 v21[7];
  void v22[3];
  uint64_t v23;
  void v24[6];

  if (a2 < 0)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = a1;
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (a2)
  {
    uint64_t v19 = a4;
    uint64_t v10 = a2;
    v22[0] = MEMORY[0x263F8EE78];
    uint64_t v6 = v22;
    sub_21D8ED5B0(0, a2, 0);
    sqlite3_int64 v11 = 0;
    uint64_t v8 = v22[0];
    uint64_t v5 = 40;
    while (v10 != v11)
    {
      v21[0] = v11;
      sub_21D8FFA10(v21, a3, (uint64_t)v24);
      v22[0] = v8;
      unint64_t v13 = *(void *)(v8 + 16);
      unint64_t v12 = *(void *)(v8 + 24);
      if (v13 >= v12 >> 1)
      {
        uint64_t v6 = v22;
        sub_21D8ED5B0((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v8 = v22[0];
      }
      ++v11;
      *(void *)(v8 + 16) = v13 + 1;
      sub_21D9017A0((uint64_t)v24, v8 + 40 * v13 + 32);
      if (v10 == v11)
      {
        a4 = v19;
        uint64_t v5 = a1;
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_33;
  }
LABEL_9:
  LODWORD(v6) = a5;
  a4(v24, v8);
  swift_bridgeObjectRelease();
  sub_21D901808((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      LODWORD(v6) = v21[0];
      unint64_t v14 = *(void *)(v21[0] + 16);
      if (!(v14 >> 31))
      {
        sqlite3_result_blob((sqlite3_context *)v5, (const void *)(v21[0] + 32), v14, 0);
        sub_21D901870((uint64_t)v24);
        return swift_bridgeObjectRelease();
      }
      goto LABEL_34;
    }
  }
  else
  {
    sub_21D901870((uint64_t)v22);
  }
  sub_21D901808((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      sqlite3_result_double((sqlite3_context *)v5, *(double *)v21);
      return sub_21D901870((uint64_t)v24);
    }
  }
  else
  {
    sub_21D901870((uint64_t)v22);
  }
  sub_21D901808((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      sqlite3_result_int64((sqlite3_context *)v5, v21[0]);
      return sub_21D901870((uint64_t)v24);
    }
  }
  else
  {
    sub_21D901870((uint64_t)v22);
  }
  sub_21D901808((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      uint64_t v16 = sub_21D9154C8();
      if (v16 >= (uint64_t)0xFFFFFFFF80000000)
      {
        LODWORD(v6) = v16;
        if (v16 <= 0x7FFFFFFF)
        {
          if (qword_26AD2F278 == -1)
          {
LABEL_27:
            uint64_t v17 = (void (__cdecl *)(void *))qword_26AD31EF8;
            uint64_t v18 = sub_21D915458();
            swift_bridgeObjectRelease();
            sqlite3_result_text((sqlite3_context *)v5, (const char *)(v18 + 32), (int)v6, v17);
            sub_21D901870((uint64_t)v24);
            return swift_release();
          }
LABEL_37:
          swift_once();
          goto LABEL_27;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    sub_21D901870((uint64_t)v22);
  }
  if (!v24[3])
  {
    sqlite3_result_null((sqlite3_context *)v5);
    return sub_21D901870((uint64_t)v24);
  }
  sub_21D901808((uint64_t)v24, (uint64_t)v22);
  v21[0] = 0;
  v21[1] = 0xE000000000000000;
  sub_21D915A08();
  swift_bridgeObjectRelease();
  v21[5] = 0xD000000000000019;
  v21[6] = 0x800000021D91CA10;
  sub_21D901808((uint64_t)v22, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F68);
  sub_21D915438();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  uint64_t result = sub_21D915B38();
  __break(1u);
  return result;
}

void sub_21D8FFA10(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2)
  {
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    sub_21D915A08();
    swift_bridgeObjectRelease();
    sub_21D915BE8();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    sub_21D915B38();
    __break(1u);
    JUMPOUT(0x21D8FFBF4);
  }
  uint64_t v4 = *(sqlite3_value **)(a2 + 8 * *a1);
  switch(sqlite3_value_type(v4))
  {
    case 1:
      sqlite3_int64 v5 = sqlite3_value_int64(v4);
      *(void *)(a3 + 24) = MEMORY[0x263F8E5C0];
      *(void *)(a3 + 32) = &protocol witness table for Int64;
      goto LABEL_10;
    case 2:
      double v8 = sqlite3_value_double(v4);
      *(void *)(a3 + 24) = MEMORY[0x263F8D538];
      *(void *)(a3 + 32) = &protocol witness table for Double;
      *(double *)a3 = v8;
      return;
    case 3:
      if (!sqlite3_value_text(v4)) {
        goto LABEL_13;
      }
      uint64_t v6 = sub_21D915518();
      *(void *)(a3 + 24) = MEMORY[0x263F8D310];
      *(void *)(a3 + 32) = &protocol witness table for String;
      *(void *)a3 = v6;
      *(void *)(a3 + 8) = v7;
      break;
    case 4:
      uint64_t v9 = sqlite3_value_blob(v4);
      if (!v9) {
        goto LABEL_14;
      }
      uint64_t v10 = v9;
      int v11 = sqlite3_value_bytes(v4);
      *(void *)(a3 + 24) = &type metadata for Blob;
      *(void *)(a3 + 32) = &protocol witness table for Blob;
      sqlite3_int64 v5 = (sqlite3_int64)sub_21D8FAB30(v10, v11);
LABEL_10:
      *(void *)a3 = v5;
      break;
    case 5:
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return;
    default:
      goto LABEL_15;
  }
}

uint64_t sub_21D8FFC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  sub_21D914698();
  v7(a2, a3, a4);
  return swift_release();
}

uint64_t sub_21D8FFC78(sqlite3_context *a1)
{
  uint64_t v1 = (uint64_t (*)(void))*((void *)sqlite3_user_data(a1) + 2);
  return v1();
}

void (*sub_21D8FFCD4(void *a1, uint64_t a2, uint64_t a3))(void **a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_21D9012B8(v6, a2, a3);
  return sub_21D8FFD54;
}

void sub_21D8FFD54(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = OUTLINED_FUNCTION_14_10();
  v3(v2);
  swift_bridgeObjectRelease();
  free(v1);
}

void Connection.createCollation(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v14[4] = sub_21D900674;
  v14[5] = v9;
  v14[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_11_9();
  v14[2] = sub_21D8FFFE4;
  v14[3] = &block_descriptor_30;
  uint64_t v10 = _Block_copy(v14);
  sub_21D914698();
  swift_release();
  int v11 = (sqlite3 *)Connection.handle.getter();
  uint64_t v12 = sub_21D915458();
  collation_uint64_t v2 = sqlite3_create_collation_v2(v11, (const char *)(v12 + 32), 1, v10, (int (__cdecl *)(void *, int, const void *, int, const void *))sub_21D9000D0, 0);
  swift_release();
  sub_21D8FE038(collation_v2, 0);
  if (!v4)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    _Block_copy(v10);
    sub_21D90067C((uint64_t)v10, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21D901008);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _Block_release(v10);
}

uint64_t sub_21D8FFF44(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = sub_21D915518();
  uint64_t v6 = v5;
  uint64_t v7 = sub_21D915518();
  uint64_t v9 = a3(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v9 <= 0x7FFFFFFF)
  {
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_21D8FFFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  sub_21D914698();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  return v6;
}

uint64_t sub_21D900040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 && a5)
  {
    uint64_t v5 = *(uint64_t (**)(void))(a1 + 16);
    return v5();
  }
  else
  {
    uint64_t result = sub_21D915B38();
    __break(1u);
  }
  return result;
}

uint64_t sub_21D9000D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30D28);
  swift_allocObject();
  uint64_t result = sub_21D9151A8();
  qword_26AD30D30 = result;
  return result;
}

const char *Connection.description.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  uint64_t result = sqlite3_db_filename(v0, 0);
  if (result)
  {
    return (const char *)sub_21D915508();
  }
  else
  {
    __break(1u);
  }
  return result;
}

const char *sub_21D900150()
{
  return Connection.description.getter();
}

uint64_t sub_21D900178()
{
  uint64_t result = sub_21D901660((uint64_t)&unk_26CE3A238);
  qword_26AD30EC8 = result;
  return result;
}

BOOL sub_21D9001A0(unsigned int a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = MEMORY[0x223C0BD30](*(void *)(a2 + 40), a1, 4);
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(_DWORD *)(v8 + 4 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t Result.description.getter()
{
  uint64_t v1 = *v0;
  if (v0[3])
  {
    swift_retain_n();
    sub_21D915A08();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v3 = v1;
    sub_21D9154F8();
    Statement.description.getter();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    sub_21D9154F8();
    sub_21D915BE8();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    sub_21D9154F8();
    swift_release_n();
  }
  else
  {
    uint64_t v3 = *v0;
    swift_bridgeObjectRetain();
    sub_21D9154F8();
    sub_21D915BE8();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    sub_21D9154F8();
  }
  return v3;
}

uint64_t sub_21D9003F8(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = sub_21D915518();
  a2(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D900448(int a1, uint64_t a2, sqlite3_stmt *pStmt)
{
  if (pStmt)
  {
    uint64_t v4 = sqlite3_expanded_sql(pStmt);
    if (v4)
    {
      uint64_t v5 = v4;
      (*(void (**)(uint64_t, char *))(a2 + 16))(a2, v4);
      sqlite3_free(v5);
    }
  }
  return 0;
}

uint64_t sub_21D9004A4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21D9004DC(uint64_t a1, int a2, uint64_t a3)
{
  return sub_21D8FF5F4(a1, a2, a3, *(void (**)(void *__return_ptr, void))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return sub_21D914698();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_21D9004FC(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_21D900DD0(a1, a2);
  *uint64_t v2 = v6;
  return swift_bridgeObjectRelease();
}

unint64_t sub_21D90057C()
{
  unint64_t result = qword_26AD31098;
  if (!qword_26AD31098)
  {
    sub_21D915788();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD31098);
  }
  return result;
}

unint64_t sub_21D9005CC()
{
  unint64_t result = qword_26AD31048;
  if (!qword_26AD31048)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD31040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD31048);
  }
  return result;
}

uint64_t sub_21D900620(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_21D900634(int a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(a1) & 1;
}

uint64_t sub_21D900664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D8FF1F4(a1, a2, a3, a4, *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16));
}

uint64_t sub_21D90066C()
{
  return sub_21D8FF440(*(void (**)(void))(v0 + 16));
}

uint64_t sub_21D900674(uint64_t a1, uint64_t a2)
{
  return sub_21D8FFF44(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_21D90067C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  a4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v4 = v11;
  return swift_bridgeObjectRelease();
}

unint64_t sub_21D900718()
{
  unint64_t result = qword_267D15AB0;
  if (!qword_267D15AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15AB0);
  }
  return result;
}

unint64_t sub_21D900768()
{
  unint64_t result = qword_267D15AB8;
  if (!qword_267D15AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15AB8);
  }
  return result;
}

uint64_t sub_21D9007B8(double *a1)
{
  return Connection.busyTimeout.setter(*a1);
}

uint64_t type metadata accessor for Connection()
{
  return self;
}

uint64_t method lookup function for Connection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Connection);
}

uint64_t dispatch thunk of Connection.__allocating_init(_:readonly:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

unint64_t destroy for Connection.Location(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s8RRSQLite10ConnectionC8LocationOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for Connection.Location(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Connection.Location(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Connection.Location(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for Connection.Location(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_21D900A64(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_21D900A7C(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

void type metadata accessor for Connection.Location()
{
}

void type metadata accessor for Connection.Operation()
{
}

unsigned char *_s8RRSQLite10ConnectionC9OperationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21D900B88);
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

void type metadata accessor for Connection.TransactionMode()
{
}

uint64_t destroy for Result()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for Result(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_21D914698();
  return a1;
}

uint64_t assignWithCopy for Result(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_21D914698();
  swift_release();
  return a1;
}

uint64_t assignWithTake for Result(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Result(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for Result(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for Result()
{
}

unint64_t sub_21D900D8C(uint64_t a1)
{
  uint64_t v2 = sub_21D915CD8();
  return sub_21D90121C(a1, v2);
}

void sub_21D900DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  unsigned int v6 = (void *)*v2;
  unint64_t v7 = sub_21D900D8C(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D15AD8);
  if ((sub_21D915AC8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_21D900D8C(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    sub_21D915C58();
    __break(1u);
    return;
  }
  unint64_t v9 = v11;
LABEL_5:
  unint64_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    _Block_release(*(const void **)(v14 + 8 * v9));
    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_21D901130(v9, a2, a1, v13);
  }
}

uint64_t sub_21D900EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_21D87FD80();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D15AD0);
  if ((sub_21D915AC8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_21D87FD80();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_21D915C58();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  id v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_21D880C08(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_21D901008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_21D87FD80();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D15AC0);
  if ((sub_21D915AC8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_21D87FD80();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_21D915C58();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  id v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    _Block_release(*(const void **)(v16 + 8 * v11));
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_21D880C08(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_21D901130(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t sub_21D901174(uint64_t a1)
{
  return sub_21D9003F8(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_21D90117C()
{
  uint64_t v1 = OUTLINED_FUNCTION_12_10();
  return sub_21D8FEACC(v1, v2, v3, v4, v0[6], v0[7], v0[8]);
}

const char *sub_21D9011B0@<X0>(_DWORD *a1@<X8>)
{
  return sub_21D8FE2E0(a1);
}

unint64_t sub_21D9011D0()
{
  unint64_t result = qword_267D15AC8;
  if (!qword_267D15AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15AC8);
  }
  return result;
}

unint64_t sub_21D90121C(uint64_t a1, uint64_t a2)
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

void (*sub_21D9012B8(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_21D901550(v6);
  v6[10] = sub_21D9013CC(v6 + 4, a2, a3);
  return sub_21D901364;
}

void sub_21D901364(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_14_10();
  v2(v3);
  free(v1);
}

void (*sub_21D9013CC(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[2] = a3;
  v8[3] = v3;
  v8[1] = a2;
  uint64_t v9 = *v3;
  unint64_t v10 = sub_21D87FD80();
  *((unsigned char *)v8 + 40) = v11 & 1;
  if (__OFADD__(*(void *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D15AD0);
  if (sub_21D915AC8())
  {
    unint64_t v14 = sub_21D87FD80();
    if ((v13 & 1) == (v15 & 1))
    {
      unint64_t v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    unint64_t result = (void (*)(uint64_t **))sub_21D915C58();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[4] = v12;
  if (v13) {
    uint64_t v16 = *(void *)(*(void *)(*v4 + 56) + 8 * v12);
  }
  else {
    uint64_t v16 = 0;
  }
  *uint64_t v8 = v16;
  return sub_21D901500;
}

void sub_21D901500(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_21D90158C(*a1, *((unsigned char *)*a1 + 40), (void **)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_21D901550(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_21D901580;
}

uint64_t sub_21D901580(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_21D90158C(uint64_t *a1, char a2, void **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_21D880C08(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D15AE0);
    sub_21D915AE8();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_21D901660(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310B0);
  uint64_t result = sub_21D9159F8();
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v5 = 0;
  uint64_t v6 = result + 56;
  uint64_t v7 = *(void *)(result + 40);
  uint64_t v8 = ~(-1 << *(unsigned char *)(result + 32));
  while (v5 < *(void *)(a1 + 16))
  {
    unsigned int v9 = *(_DWORD *)(a1 + 32 + 4 * v5);
    uint64_t result = MEMORY[0x223C0BD30](v7, v9, 4);
    unint64_t v10 = result & v8;
    unint64_t v11 = (result & (unint64_t)v8) >> 6;
    uint64_t v12 = *(void *)(v6 + 8 * v11);
    uint64_t v13 = 1 << (result & v8);
    uint64_t v14 = *(void *)(v3 + 48);
    if ((v13 & v12) != 0)
    {
      while (*(_DWORD *)(v14 + 4 * v10) != v9)
      {
        unint64_t v10 = (v10 + 1) & v8;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v6 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      *(void *)(v6 + 8 * v11) = v13 | v12;
      *(_DWORD *)(v14 + 4 * v10) = v9;
      uint64_t v15 = *(void *)(v3 + 16);
      BOOL v16 = __OFADD__(v15, 1);
      uint64_t v17 = v15 + 1;
      if (v16) {
        goto LABEL_15;
      }
      *(void *)(v3 + 16) = v17;
    }
    if (++v5 == v4) {
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_21D9017A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D901808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D901870(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21D9018D0()
{
  uint64_t v0 = OUTLINED_FUNCTION_12_10();
  return sub_21D8EB87C(v0, v1, v2, v3);
}

uint64_t sub_21D9018EC()
{
  uint64_t v0 = OUTLINED_FUNCTION_12_10();
  return sub_21D8EB80C(v0, v1, v2, v3);
}

const char *sub_21D901908@<X0>(BOOL *a1@<X8>)
{
  return sub_21D906C64(v1, a1);
}

unint64_t OUTLINED_FUNCTION_0_10()
{
  return sub_21D89FBB8();
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return Connection.run(_:_:)(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return sub_21D914698();
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return sub_21D9157E8();
}

uint64_t OUTLINED_FUNCTION_6_14()
{
  return sub_21D8FE138();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_12_10()
{
  return *(void *)(v0 + 16);
}

char *OUTLINED_FUNCTION_13_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_11()
{
  return sub_21D9154F8();
}

uint64_t && infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_38_10(a1, a2, (uint64_t)&qword_26AD2F260);
}

{
  return OUTLINED_FUNCTION_38_10(a1, a2, (uint64_t)&qword_26AD2F258);
}

{
  return OUTLINED_FUNCTION_39_8(a1, a2, (uint64_t)&qword_26AD2F258);
}

{
  return OUTLINED_FUNCTION_39_8(a1, a2, (uint64_t)&qword_26AD2F260);
}

uint64_t + infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_10_12(a1, a2, (uint64_t)&qword_26AD31120, 31868);
}

{
  return OUTLINED_FUNCTION_10_12(a1, a2, (uint64_t)&qword_26AD31130, 31868);
}

void + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_21D901BDC(a1, a2, a3, (uint64_t)&qword_26AD31120, (uint64_t)sub_21D8EC704, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  sub_21D901BDC(a1, a2, a3, (uint64_t)&qword_26AD31130, (uint64_t)sub_21D8EC710, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_63_9(a1, a2, (uint64_t)&qword_26AD31130, (uint64_t)&qword_26AD31120, a5, (uint64_t)sub_21D8EC710, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_63_9(a1, a2, (uint64_t)&qword_26AD31120, (uint64_t)&qword_26AD31130, a5, (uint64_t)sub_21D8EC710, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_21D901BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_7_12();
  a27 = v28;
  a28 = v29;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  uint64_t v39 = v36[2];
  a17 = __swift_instantiateConcreteTypeFromMangledName(v40);
  a18 = &protocol witness table for Expression<A>;
  a14 = v38;
  a15 = v37;
  a16 = v39;
  a12 = MEMORY[0x263F8D310];
  a13 = &protocol witness table for String;
  a9 = v35;
  a10 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_83_7();
  v31();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a14);
  OUTLINED_FUNCTION_5_18();
}

uint64_t + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D901D10(a1, a2, a3, a4, a5, 0);
}

{
  return sub_21D901D8C(a1, a2, a3, a4, a5, 0);
}

{
  return sub_21D901ED4(a1, a2, a3, a4, a5, 0);
}

{
  return sub_21D901F6C(a1, a2, a3, a4, a5, 0);
}

{
  return sub_21D902B80(a1, a2, a3, a4, a5, 0);
}

{
  return sub_21D902C10(a1, a2, a3, a4, a5, 0);
}

void + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D901E34(a1, a2, a3, a4, a5, 0, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D901D10(a1, a2, a3, a4, a5, 1);
}

{
  return sub_21D901D8C(a1, a2, a3, a4, a5, 1);
}

{
  return sub_21D901ED4(a1, a2, a3, a4, a5, 1);
}

{
  return sub_21D901F6C(a1, a2, a3, a4, a5, 1);
}

{
  return sub_21D902B80(a1, a2, a3, a4, a5, 1);
}

{
  return sub_21D902C10(a1, a2, a3, a4, a5, 1);
}

void - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D901E34(a1, a2, a3, a4, a5, 1, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D901D10(a1, a2, a3, a4, a5, 5);
}

{
  return sub_21D901D8C(a1, a2, a3, a4, a5, 5);
}

{
  return sub_21D901ED4(a1, a2, a3, a4, a5, 5);
}

{
  return sub_21D901F6C(a1, a2, a3, a4, a5, 5);
}

{
  return sub_21D902B80(a1, a2, a3, a4, a5, 5);
}

{
  return sub_21D902C10(a1, a2, a3, a4, a5, 5);
}

void * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D901E34(a1, a2, a3, a4, a5, 5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21D901D10(a1, a2, a3, a4, a5, 6);
}

{
  return sub_21D901D8C(a1, a2, a3, a4, a5, 6);
}

{
  return sub_21D901ED4(a1, a2, a3, a4, a5, 6);
}

{
  return sub_21D901F6C(a1, a2, a3, a4, a5, 6);
}

{
  return sub_21D902B80(a1, a2, a3, a4, a5, 6);
}

{
  return sub_21D902C10(a1, a2, a3, a4, a5, 6);
}

#error "21D901D5C: call analysis failed (funcsize=28)"

#error "21D901DC4: call analysis failed (funcsize=39)"

void / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D901E34(a1, a2, a3, a4, a5, 6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_21D901E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_15_11();
  a31 = v32;
  a32 = v33;
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  uint64_t v37 = v34[2];
  OUTLINED_FUNCTION_32_9();
  a19 = OUTLINED_FUNCTION_47_7();
  a20 = &protocol witness table for Expression<A>;
  a16 = v36;
  a17 = v35;
  a18 = v37;
  OUTLINED_FUNCTION_69_5();
  OUTLINED_FUNCTION_87_5();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v38 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_61_6(v38, v39, v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a16);
  OUTLINED_FUNCTION_14_11();
}

#error "21D901F3C: call analysis failed (funcsize=35)"

#error "21D901FA8: call analysis failed (funcsize=37)"

uint64_t % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D9020AC(a1, a2, a3, a4, 7);
}

{
  return sub_21D902128(a1, a2, a3, a4, 7);
}

{
  return sub_21D902270(a1, a2, a3, a4, 7);
}

{
  return sub_21D902308(a1, a2, a3, a4, 7);
}

{
  return sub_21D902E84(a1, a2, a3, a4, 7);
}

{
  return sub_21D902F14(a1, a2, a3, a4, 7);
}

void % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9021D0(a1, a2, a3, a4, 7, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D9020AC(a1, a2, a3, a4, 8);
}

{
  return sub_21D902128(a1, a2, a3, a4, 8);
}

{
  return sub_21D902270(a1, a2, a3, a4, 8);
}

{
  return sub_21D902308(a1, a2, a3, a4, 8);
}

{
  return sub_21D902E84(a1, a2, a3, a4, 8);
}

{
  return sub_21D902F14(a1, a2, a3, a4, 8);
}

void << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9021D0(a1, a2, a3, a4, 8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D9020AC(a1, a2, a3, a4, 9);
}

{
  return sub_21D902128(a1, a2, a3, a4, 9);
}

{
  return sub_21D902270(a1, a2, a3, a4, 9);
}

{
  return sub_21D902308(a1, a2, a3, a4, 9);
}

{
  return sub_21D902E84(a1, a2, a3, a4, 9);
}

{
  return sub_21D902F14(a1, a2, a3, a4, 9);
}

void >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9021D0(a1, a2, a3, a4, 9, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D9020AC(a1, a2, a3, a4, 10);
}

{
  return sub_21D902128(a1, a2, a3, a4, 10);
}

{
  return sub_21D902270(a1, a2, a3, a4, 10);
}

{
  return sub_21D902308(a1, a2, a3, a4, 10);
}

{
  return sub_21D902E84(a1, a2, a3, a4, 10);
}

{
  return sub_21D902F14(a1, a2, a3, a4, 10);
}

void & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9021D0(a1, a2, a3, a4, 10, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D9020AC(a1, a2, a3, a4, 11);
}

{
  return sub_21D902128(a1, a2, a3, a4, 11);
}

{
  return sub_21D902270(a1, a2, a3, a4, 11);
}

{
  return sub_21D902308(a1, a2, a3, a4, 11);
}

{
  return sub_21D902E84(a1, a2, a3, a4, 11);
}

{
  return sub_21D902F14(a1, a2, a3, a4, 11);
}

#error "21D9020F8: call analysis failed (funcsize=28)"

#error "21D902160: call analysis failed (funcsize=39)"

void | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9021D0(a1, a2, a3, a4, 11, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_21D9021D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_15_11();
  a31 = v32;
  a32 = v33;
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  uint64_t v37 = v34[2];
  OUTLINED_FUNCTION_32_9();
  a19 = OUTLINED_FUNCTION_47_7();
  a20 = &protocol witness table for Expression<A>;
  a16 = v36;
  a17 = v35;
  a18 = v37;
  OUTLINED_FUNCTION_69_5();
  OUTLINED_FUNCTION_87_5();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v38 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_61_6(v38, v39, v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a16);
  OUTLINED_FUNCTION_14_11();
}

#error "21D9022D8: call analysis failed (funcsize=35)"

#error "21D902344: call analysis failed (funcsize=37)"

uint64_t ^ infix<A>(_:_:)(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_21D90249C(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, void *, uint64_t))| infix<A>(_:_:), (void (*)(uint64_t *, uint64_t *, uint64_t))& infix<A>(_:_:));
}

{
  return sub_21D90249C(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, void *, uint64_t))| infix<A>(_:_:), (void (*)(uint64_t *, uint64_t *, uint64_t))& infix<A>(_:_:));
}

{
  return sub_21D90249C(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, void *, uint64_t))| infix<A>(_:_:), (void (*)(uint64_t *, uint64_t *, uint64_t))& infix<A>(_:_:));
}

{
  return sub_21D90249C(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, void *, uint64_t))| infix<A>(_:_:), (void (*)(uint64_t *, uint64_t *, uint64_t))& infix<A>(_:_:));
}

uint64_t ^ infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  return sub_21D902690(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (uint64_t)~ prefix<A>(_:), (uint64_t)| infix<A>(_:_:), (uint64_t)& infix<A>(_:_:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

{
  return sub_21D902690(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (uint64_t)~ prefix<A>(_:), (uint64_t)| infix<A>(_:_:), (uint64_t)& infix<A>(_:_:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

{
  return sub_21D903188(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (uint64_t)~ prefix<A>(_:), (uint64_t)| infix<A>(_:_:), (uint64_t)& infix<A>(_:_:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

{
  return sub_21D903188(a1, a2, a3, a4, (uint64_t)& infix<A>(_:_:), (uint64_t)~ prefix<A>(_:), (uint64_t)| infix<A>(_:_:), (uint64_t)& infix<A>(_:_:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_21D90249C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, uint64_t *, uint64_t *), void (*a6)(uint64_t *__return_ptr, uint64_t *, uint64_t), void (*a7)(uint64_t *__return_ptr, uint64_t *, void *, uint64_t), void (*a8)(uint64_t *, uint64_t *, uint64_t))
{
  uint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  uint64_t v13 = *a2;
  uint64_t v14 = a2[1];
  uint64_t v15 = a2[2];
  uint64_t v29 = *a1;
  uint64_t v10 = v29;
  uint64_t v30 = v11;
  uint64_t v31 = v12;
  uint64_t v23 = v13;
  uint64_t v24 = v14;
  uint64_t v25 = v15;
  a5(&v26, &v29, &v23);
  uint64_t v23 = v26;
  uint64_t v24 = v27;
  uint64_t v25 = v28;
  a6(&v29, &v23, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = v29;
  uint64_t v27 = v30;
  uint64_t v28 = v31;
  uint64_t v20 = v10;
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  v19[0] = v13;
  v19[1] = v14;
  v19[2] = v15;
  a7(&v23, &v20, v19, a3);
  uint64_t v20 = v23;
  uint64_t v21 = v24;
  uint64_t v22 = v25;
  a8(&v26, &v20, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D902690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  void (*v45)(uint64_t *__return_ptr, uint64_t *);
  void (*v46)(void);
  uint64_t v47;

  OUTLINED_FUNCTION_9_11();
  a33 = v38;
  a34 = v39;
  OUTLINED_FUNCTION_70_8();
  uint64_t v41 = v40;
  uint64_t v43 = v42[1];
  uint64_t v44 = v42[2];
  a20 = *v42;
  a21 = v43;
  a22 = v44;
  v45(&a17, &a20);
  OUTLINED_FUNCTION_33_11();
  v37();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_7();
  v35(&a11, v41, v34, v36);
  OUTLINED_FUNCTION_30_9();
  v46();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_7();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D90274C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t *a5@<X8>)
{
  sub_21D9027CC(a4);
  sub_21D908420(a1, a2, a3, a5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D9027CC(char a1)
{
  uint64_t result = 43;
  switch(a1)
  {
    case 1:
      uint64_t result = 45;
      break;
    case 2:
      uint64_t result = 21071;
      break;
    case 3:
      uint64_t result = 4476481;
      break;
    case 4:
      uint64_t result = 542396238;
      break;
    case 5:
      uint64_t result = 42;
      break;
    case 6:
      uint64_t result = 47;
      break;
    case 7:
      uint64_t result = 37;
      break;
    case 8:
      uint64_t result = 15420;
      break;
    case 9:
      uint64_t result = 15934;
      break;
    case 10:
      uint64_t result = 38;
      break;
    case 11:
      uint64_t result = 124;
      break;
    case 12:
      uint64_t result = 126;
      break;
    case 13:
      uint64_t result = 61;
      break;
    case 14:
      uint64_t result = 15649;
      break;
    case 15:
      uint64_t result = 62;
      break;
    case 16:
      uint64_t result = 60;
      break;
    case 17:
      uint64_t result = 15678;
      break;
    case 18:
      uint64_t result = 15676;
      break;
    case 19:
      uint64_t result = 31868;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21D902910@<X0>(void *a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  uint64_t v5 = sub_21D9027CC(a2);
  sub_21D9081F4(a1, v5, v6, a3);
  return swift_bridgeObjectRelease();
}

uint64_t + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_21D9029E4(a1, a2, a3, &qword_26AD31120, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21D8EC704);
}

{
  return sub_21D9029E4(a1, a2, a3, &qword_26AD31130, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21D8EC710);
}

uint64_t sub_21D9029E4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a3;
  uint64_t v6 = a3[1];
  uint64_t v8 = a3[2];
  v18[3] = MEMORY[0x263F8D310];
  v18[4] = &protocol witness table for String;
  v18[0] = a1;
  v18[1] = a2;
  uint64_t v17[3] = __swift_instantiateConcreteTypeFromMangledName(a4);
  v17[4] = &protocol witness table for Expression<A>;
  v17[0] = v7;
  v17[1] = v6;
  v17[2] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_83_7();
  a5(v9, v10, v11, v12, v13, v14, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

void + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902AEC(a1, a2, a3, a4, a5, 0, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902AEC(a1, a2, a3, a4, a5, 1, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902AEC(a1, a2, a3, a4, a5, 5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902AEC(a1, a2, a3, a4, a5, 6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_21D902AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_1_13();
  a29 = v30;
  a30 = v31;
  uint64_t v33 = v32;
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_80_7();
  OUTLINED_FUNCTION_69_5();
  OUTLINED_FUNCTION_93_3();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_40_8((uint64_t)&a14, (uint64_t)&a9, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a14);
  OUTLINED_FUNCTION_0_11();
}

#error "21D902B9C: call analysis failed (funcsize=33)"

#error "21D902C2C: call analysis failed (funcsize=37)"

uint64_t - prefix<A>(_:)()
{
  OUTLINED_FUNCTION_77_7();
  OUTLINED_FUNCTION_48_9();
  swift_bridgeObjectRetain();
  sub_21D902910(v2, 1, v0);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

{
  void *v0;
  void v2[5];

  OUTLINED_FUNCTION_85_6();
  type metadata accessor for Expression();
  OUTLINED_FUNCTION_90_6();
  swift_bridgeObjectRetain();
  sub_21D902910(v2, 1, v0);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

void % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902DF0(a1, a2, a3, a4, 7, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902DF0(a1, a2, a3, a4, 8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902DF0(a1, a2, a3, a4, 9, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902DF0(a1, a2, a3, a4, 10, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D902DF0(a1, a2, a3, a4, 11, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_21D902DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_1_13();
  a29 = v30;
  a30 = v31;
  uint64_t v33 = v32;
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_80_7();
  OUTLINED_FUNCTION_69_5();
  OUTLINED_FUNCTION_93_3();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_40_8((uint64_t)&a14, (uint64_t)&a9, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a14);
  OUTLINED_FUNCTION_0_11();
}

#error "21D902EA0: call analysis failed (funcsize=33)"

#error "21D902F30: call analysis failed (funcsize=37)"

uint64_t ~ prefix<A>(_:)()
{
  OUTLINED_FUNCTION_77_7();
  OUTLINED_FUNCTION_48_9();
  swift_bridgeObjectRetain();
  sub_21D902910(v2, 12, v0);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

{
  void *v0;
  void v2[5];

  OUTLINED_FUNCTION_85_6();
  type metadata accessor for Expression();
  OUTLINED_FUNCTION_90_6();
  swift_bridgeObjectRetain();
  sub_21D902910(v2, 12, v0);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t sub_21D903188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  void (*v45)(uint64_t *__return_ptr);
  void (*v46)(void);
  uint64_t v47;

  OUTLINED_FUNCTION_9_11();
  a33 = v38;
  a34 = v39;
  OUTLINED_FUNCTION_70_8();
  uint64_t v41 = v40;
  uint64_t v43 = v42[1];
  uint64_t v44 = v42[2];
  a20 = *v42;
  a21 = v43;
  a22 = v44;
  v45(&a17);
  OUTLINED_FUNCTION_33_11();
  v37();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_7();
  v35(v41, &a11, v34, v36);
  OUTLINED_FUNCTION_30_9();
  v46();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_7();
  return swift_bridgeObjectRelease();
}

uint64_t == infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_19_10(a1, a2, a3, a4, a5, 61);
}

{
  return OUTLINED_FUNCTION_21_9(a1, a2, a3, a4, a5, 61);
}

{
  return OUTLINED_FUNCTION_17_7(a1, a2, a3, a4, a5, 61);
}

{
  return OUTLINED_FUNCTION_20_9(a1, a2, a3, a4, a5, 61);
}

void == infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_22_6(a1, a2, a3, a4, a5, 61, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_18_10(a1, a2, a3, a4, a5, 61, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t == infix<A>(_:_:)()
{
  OUTLINED_FUNCTION_66_7();
  return sub_21D903308(v0, v1, v2, v3, v4, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  OUTLINED_FUNCTION_66_7();
  return sub_21D9035EC(v0, v1, v2, v3, v4, v6);
}

uint64_t != infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_26_13(a1, a2, a3, a4, a5, 15649);
}

{
  return OUTLINED_FUNCTION_28_12(a1, a2, a3, a4, a5, 15649);
}

{
  return OUTLINED_FUNCTION_24_8(a1, a2, a3, a4, a5, 15649);
}

{
  return OUTLINED_FUNCTION_27_8(a1, a2, a3, a4, a5, 15649);
}

void != infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4, a5, 15649, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_25_8(a1, a2, a3, a4, a5, 15649, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t != infix<A>(_:_:)()
{
  OUTLINED_FUNCTION_49_7();
  return sub_21D903308(v0, v1, v2, v3, v4, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  OUTLINED_FUNCTION_49_7();
  return sub_21D9035EC(v0, v1, v2, v3, v4, v6);
}

uint64_t sub_21D903308@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>, uint64_t a6)
{
  OUTLINED_FUNCTION_89_6(a1, a2, a3, a4, a5);
  uint64_t v8 = v7;
  uint64_t v9 = sub_21D9158C8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v35[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = &v35[-v16];
  OUTLINED_FUNCTION_0_3();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v35[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = v8[1];
  uint64_t v36 = *v8;
  uint64_t v24 = v8[2];
  OUTLINED_FUNCTION_24();
  v25();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v6) == 1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v17, v9);
    uint64_t v26 = type metadata accessor for Expression();
    uint64_t v44 = v26;
    uint64_t v45 = &protocol witness table for Expression<A>;
    uint64_t v41 = v36;
    uint64_t v42 = v23;
    uint64_t v43 = v24;
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v6);
    uint64_t v39 = v26;
    uint64_t v40 = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_91_3((uint64_t)v15, (uint64_t)v38);
    uint64_t v27 = OUTLINED_FUNCTION_75_5();
    sub_21D8EC588(v27, v28, v29, v30, a6);
  }
  else
  {
    OUTLINED_FUNCTION_92_3();
    v31();
    uint64_t v44 = type metadata accessor for Expression();
    uint64_t v45 = &protocol witness table for Expression<A>;
    uint64_t v41 = v36;
    uint64_t v42 = v23;
    uint64_t v43 = v24;
    uint64_t v32 = *(_UNKNOWN ***)(v37 + 8);
    uint64_t v39 = v6;
    uint64_t v40 = v32;
    __swift_allocate_boxed_opaque_existential_1(v38);
    OUTLINED_FUNCTION_24();
    v33();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_74_5();
    (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v22, v6);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
}

uint64_t sub_21D9035EC@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>, uint64_t a6)
{
  OUTLINED_FUNCTION_89_6(a1, a2, a3, a4, a5);
  uint64_t v8 = v7;
  uint64_t v9 = sub_21D9158C8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v33 - v16;
  OUTLINED_FUNCTION_0_3();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[3] = *v8;
  OUTLINED_FUNCTION_24();
  v23();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v9);
    uint64_t v24 = type metadata accessor for Expression();
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v6);
    uint64_t v38 = v24;
    uint64_t v39 = &protocol witness table for Expression<A>;
    swift_getWitnessTable();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_91_3((uint64_t)v15, (uint64_t)v37);
    uint64_t v35 = v24;
    uint64_t v36 = &protocol witness table for Expression<A>;
    OUTLINED_FUNCTION_94_1();
    swift_bridgeObjectRetain();
    uint64_t v25 = OUTLINED_FUNCTION_75_5();
    sub_21D8EC588(v25, v26, v27, v28, a6);
  }
  else
  {
    OUTLINED_FUNCTION_92_3();
    v29();
    uint64_t v30 = *(_UNKNOWN ***)(v33[4] + 8);
    uint64_t v38 = v6;
    uint64_t v39 = v30;
    __swift_allocate_boxed_opaque_existential_1(v37);
    OUTLINED_FUNCTION_24();
    v31();
    uint64_t v35 = type metadata accessor for Expression();
    uint64_t v36 = &protocol witness table for Expression<A>;
    OUTLINED_FUNCTION_94_1();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_74_5();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v6);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
}

uint64_t > infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_19_10(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_21_9(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_17_7(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_51_7(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_20_9(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_50_9(a1, a2, a3, a4, a5, 62);
}

void > infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_22_6(a1, a2, a3, a4, a5, 62, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_18_10(a1, a2, a3, a4, a5, 62, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t >= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_26_13(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_28_12(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_24_8(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_65_9(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_27_8(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_64_7(a1, a2, a3, a4, a5, 15678);
}

void >= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4, a5, 15678, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_25_8(a1, a2, a3, a4, a5, 15678, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t < infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_19_10(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_21_9(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_17_7(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_51_7(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_20_9(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_50_9(a1, a2, a3, a4, a5, 60);
}

void < infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_22_6(a1, a2, a3, a4, a5, 60, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_18_10(a1, a2, a3, a4, a5, 60, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t <= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_26_13(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_28_12(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_24_8(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_65_9(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_27_8(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_64_7(a1, a2, a3, a4, a5, 15676);
}

#error "21D903998: call analysis failed (funcsize=29)"

void <= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4, a5, 15676, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_25_8(a1, a2, a3, a4, a5, 15676, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_21D9039CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_15_11();
  a31 = v32;
  a32 = v33;
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_31_8();
  OUTLINED_FUNCTION_72_7();
  sub_21D9158C8();
  OUTLINED_FUNCTION_18_8();
  OUTLINED_FUNCTION_44_10();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v34 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_60_9(v34, v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a16);
  OUTLINED_FUNCTION_14_11();
}

void sub_21D903A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_15_11();
  a31 = v32;
  a32 = v33;
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_18_8();
  OUTLINED_FUNCTION_72_7();
  type metadata accessor for Expression();
  OUTLINED_FUNCTION_44_10();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v34 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_60_9(v34, v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a16);
  OUTLINED_FUNCTION_14_11();
}

#error "21D903B3C: call analysis failed (funcsize=34)"

#error "21D903B98: call analysis failed (funcsize=35)"

#error "21D903C34: call analysis failed (funcsize=36)"

#error "21D903CBC: call analysis failed (funcsize=31)"

#error "21D903D44: call analysis failed (funcsize=34)"

void _s8RRSQLite2teoiyAA10ExpressionVySbGSNyxG_ADyxGtAA5ValueRzSLRzAaH8DatatypeAaHPRpzSLAKRQlF_0(uint64_t *a1@<X1>, uint64_t a2@<X3>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v14 = a1[2];
  OUTLINED_FUNCTION_82_6();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  uint64_t v13 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917D30;
  uint64_t v8 = *(void (**)(uint64_t))(a2 + 56);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(inited + 56) = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(void *)(inited + 64) = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  uint64_t v11 = OUTLINED_FUNCTION_43_7();
  v8(v11);
  sub_21D915388();
  *(void *)(inited + 96) = AssociatedTypeWitness;
  *(void *)(inited + 104) = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 72));
  uint64_t v12 = OUTLINED_FUNCTION_43_7();
  v8(v12);
  swift_bridgeObjectRetain();
  sub_21D8EC74C();
  *a3 = v5;
  a3[1] = v13;
  a3[2] = v14;
}

void _s8RRSQLite2teoiyAA10ExpressionVySbGSnyxG_ADyxGtAA5ValueRzSLRzAaH8DatatypeAaHPRpzSLAKRQlF_0(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = a1[2];
  OUTLINED_FUNCTION_82_6();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  swift_bridgeObjectRetain();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  uint64_t v16 = v7;
  uint64_t v17 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917DB0;
  uint64_t v10 = *(void (**)(uint64_t))(a3 + 56);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(inited + 56) = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(void *)(inited + 64) = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  uint64_t v13 = OUTLINED_FUNCTION_43_7();
  v10(v13);
  swift_bridgeObjectRetain();
  sub_21D8EC74C();
  swift_bridgeObjectRetain();
  sub_21D8EC74C();
  uint64_t v14 = v8;
  uint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_21D917DB0;
  sub_21D915728();
  *(void *)(v15 + 56) = AssociatedTypeWitness;
  *(void *)(v15 + 64) = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v15 + 32));
  ((void (*)(uint64_t, uint64_t))v10)(a2, a3);
  sub_21D8EC74C();
  *a4 = v17;
  a4[1] = v16;
  a4[2] = v14;
}

void ~= infix<A>(_:_:)()
{
}

{
  OUTLINED_FUNCTION_68_7();
}

{
  OUTLINED_FUNCTION_84_4();
}

{
  OUTLINED_FUNCTION_84_4();
}

{
  OUTLINED_FUNCTION_67_8();
}

{
  OUTLINED_FUNCTION_67_8();
}

void sub_21D904250()
{
  OUTLINED_FUNCTION_9_11();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6[2];
  uint64_t v10 = *v6;
  uint64_t v11 = v6[1];
  swift_bridgeObjectRetain();
  sub_21D9154F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917DB0;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v1 + 56);
  *(void *)(inited + 56) = swift_getAssociatedTypeWitness();
  *(void *)(inited + 64) = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  v9(v3, v1);
  swift_bridgeObjectRetain();
  sub_21D8EC74C();
  *uint64_t v5 = v10;
  v5[1] = v11;
  long long v5[2] = v7;
  OUTLINED_FUNCTION_11_7();
}

void && infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21D9043B4(a1, a2, (uint64_t)&qword_26AD2F258, (uint64_t)&qword_26AD2F260, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  sub_21D9043B4(a1, a2, (uint64_t)&qword_26AD2F260, (uint64_t)&qword_26AD2F258, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_21D9043B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_1_13();
  a29 = v30;
  a30 = v31;
  uint64_t v33 = v32;
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  uint64_t v37 = v34[2];
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  uint64_t v41 = v38[2];
  a17 = __swift_instantiateConcreteTypeFromMangledName(v42);
  a18 = &protocol witness table for Expression<A>;
  a14 = v36;
  a15 = v35;
  a16 = v37;
  a12 = __swift_instantiateConcreteTypeFromMangledName(v33);
  a13 = &protocol witness table for Expression<A>;
  a9 = v40;
  a10 = v39;
  a11 = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21D8EC588((uint64_t)&a14, (uint64_t)&a9, 1, 4476481, 0xE300000000000000);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a14);
  OUTLINED_FUNCTION_0_11();
}

void && infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_37_10(a1, a2, (uint64_t)&qword_26AD2F258, a4, a5, (uint64_t)sub_21D8EC728, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  OUTLINED_FUNCTION_37_10(a1, a2, (uint64_t)&qword_26AD2F260, a4, a5, (uint64_t)sub_21D8EC588, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

uint64_t || infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_10_12(a1, a2, (uint64_t)&qword_26AD2F258, 21071);
}

{
  return OUTLINED_FUNCTION_10_12(a1, a2, (uint64_t)&qword_26AD2F260, 21071);
}

{
  return OUTLINED_FUNCTION_46_8(a1, a2, (uint64_t)&qword_26AD2F258);
}

{
  return OUTLINED_FUNCTION_46_8(a1, a2, (uint64_t)&qword_26AD2F260);
}

void || infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_62_8(a1, a2, (uint64_t)&qword_26AD2F258, (uint64_t)&qword_26AD2F260, a5, (uint64_t)sub_21D8EC588, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_62_8(a1, a2, (uint64_t)&qword_26AD2F260, (uint64_t)&qword_26AD2F258, a5, (uint64_t)sub_21D8EC588, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_21D904580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_15_11();
  a31 = v34;
  a32 = v35;
  uint64_t v40 = v36;
  OUTLINED_FUNCTION_34_10(v37, v38, v39);
  OUTLINED_FUNCTION_72_7();
  __swift_instantiateConcreteTypeFromMangledName(v33);
  OUTLINED_FUNCTION_44_10();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40(&a16, &a11, 1, v32, 0xE200000000000000);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a16);
  OUTLINED_FUNCTION_14_11();
}

#error "21D90469C: call analysis failed (funcsize=35)"

void || infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_45_7(a1, a2, (uint64_t)&qword_26AD2F258, a4, a5, (uint64_t)sub_21D8EC728, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  OUTLINED_FUNCTION_45_7(a1, a2, (uint64_t)&qword_26AD2F260, a4, a5, (uint64_t)sub_21D8EC588, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void sub_21D90470C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_7_12();
  a27 = v28;
  a28 = v29;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  char v37 = v36;
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  uint64_t v41 = v38[2];
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(v42);
  a18 = &protocol witness table for Expression<A>;
  a14 = v40;
  a15 = v39;
  a16 = v41;
  a17 = v43;
  a12 = MEMORY[0x263F8D4F8];
  a13 = &protocol witness table for Bool;
  a9 = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31(&a14, &a9, 1, v35, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a14);
  OUTLINED_FUNCTION_5_18();
}

#error "21D90486C: call analysis failed (funcsize=35)"

uint64_t ! prefix(_:)(uint64_t a1)
{
  return sub_21D9048DC(a1, &qword_26AD2F258, (void (*)(unsigned char *, uint64_t, unint64_t))sub_21D8E8498);
}

{
  return sub_21D9048DC(a1, &qword_26AD2F260, (void (*)(unsigned char *, uint64_t, unint64_t))sub_21D8E8498);
}

uint64_t sub_21D9048DC(uint64_t a1, uint64_t *a2, void (*a3)(unsigned char *, uint64_t, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_48_9();
  swift_bridgeObjectRetain();
  a3(v5, 542396238, 0xE400000000000000);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t *OUTLINED_FUNCTION_3_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19 = *(void *)(a4 + 8);
  a17 = a3;
  a18 = v19;
  return __swift_allocate_boxed_opaque_existential_1(&a14);
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_6_15()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return sub_21D90274C((uint64_t)&a14, (uint64_t)&a9, 1, v14, v15);
}

uint64_t OUTLINED_FUNCTION_10_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21D90463C(a1, a2, a3, a4, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_11_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t *OUTLINED_FUNCTION_16_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  a16 = v18;
  uint64_t v20 = *(void *)(v16 + 8);
  a12 = v17;
  a13 = v20;
  return __swift_allocate_boxed_opaque_existential_1(&a9);
}

uint64_t OUTLINED_FUNCTION_17_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903B70(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

void OUTLINED_FUNCTION_18_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D903A54(a1, a2, a3, a4, a5, a6, 0xE100000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_19_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D90394C(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_20_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903CA4(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_21_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903ADC(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

void OUTLINED_FUNCTION_22_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9039CC(a1, a2, a3, a4, a5, a6, 0xE100000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t *OUTLINED_FUNCTION_23_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19 = *(void *)(a4 + 8);
  a17 = a3;
  a18 = v19;
  return __swift_allocate_boxed_opaque_existential_1(&a14);
}

uint64_t OUTLINED_FUNCTION_24_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903B70(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

void OUTLINED_FUNCTION_25_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D903A54(a1, a2, a3, a4, a5, a6, 0xE200000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_26_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D90394C(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_27_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903CA4(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_28_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903ADC(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

void OUTLINED_FUNCTION_29_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D9039CC(a1, a2, a3, a4, a5, a6, 0xE200000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_32_9()
{
  return sub_21D9158C8();
}

uint64_t OUTLINED_FUNCTION_34_10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_37_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_21D90470C(a1, a2, a3, 4476481, 0xE300000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

uint64_t OUTLINED_FUNCTION_38_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D90463C(a1, a2, a3, 4476481, 0xE300000000000000);
}

uint64_t OUTLINED_FUNCTION_39_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D904808(a1, a2, a3, 4476481, 0xE300000000000000);
}

uint64_t OUTLINED_FUNCTION_40_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_21D90274C(a1, a2, 1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_42_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_43_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_10()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_45_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_21D90470C(a1, a2, a3, 21071, 0xE200000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

uint64_t OUTLINED_FUNCTION_46_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D904808(a1, a2, a3, 21071, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_47_7()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_48_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903D2C(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_51_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903C08(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_52_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return sub_21D90274C((uint64_t)&a14, (uint64_t)&a9, 1, v14, v15);
}

char *OUTLINED_FUNCTION_53_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return &a14;
}

char *OUTLINED_FUNCTION_54_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return &a14;
}

uint64_t OUTLINED_FUNCTION_55_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return sub_21D90274C((uint64_t)&a14, (uint64_t)&a9, 1, v14, v15);
}

uint64_t OUTLINED_FUNCTION_56_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return sub_21D90274C((uint64_t)&a14, (uint64_t)&a9, 1, v14, v15);
}

char *OUTLINED_FUNCTION_57_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return &a14;
}

char *OUTLINED_FUNCTION_58_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return &a14;
}

uint64_t *OUTLINED_FUNCTION_59_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  a11 = a1;
  a12 = a2;
  a8 = v16;
  a9 = v14;
  a10 = v15;
  uint64_t v18 = *(void *)(v12 + 8);
  a6 = v13;
  a7 = v18;
  return __swift_allocate_boxed_opaque_existential_1(&a3);
}

uint64_t OUTLINED_FUNCTION_60_9(uint64_t a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  return sub_21D8EC588((uint64_t)va1, (uint64_t)va, 1, v2, a2);
}

uint64_t OUTLINED_FUNCTION_61_6(uint64_t a1, int a2, char a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  return sub_21D90274C((uint64_t)va1, (uint64_t)va, 1, a3, v3);
}

void OUTLINED_FUNCTION_62_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D904580(a1, a2, a3, a4, 21071, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void OUTLINED_FUNCTION_63_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_21D904580(a1, a2, a3, a4, 31868, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_64_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903D2C(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_65_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21D903C08(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

void OUTLINED_FUNCTION_67_8()
{
  sub_21D904250();
}

void OUTLINED_FUNCTION_68_7()
{
  sub_21D904250();
}

uint64_t OUTLINED_FUNCTION_69_5()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_74_5()
{
  uint64_t v2 = *(void *)(v0 - 208);
  uint64_t v3 = *(void *)(v0 - 200);
  return sub_21D8EC588(v0 - 120, v0 - 160, 1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_75_5()
{
  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_77_7()
{
  return type metadata accessor for Expression();
}

uint64_t OUTLINED_FUNCTION_80_7()
{
  return sub_21D9158C8();
}

uint64_t OUTLINED_FUNCTION_82_6()
{
  *(void *)(v0 - 104) = 0;
  *(void *)(v0 - 96) = 0xE000000000000000;
  return sub_21D915A08();
}

void OUTLINED_FUNCTION_84_4()
{
  sub_21D904250();
}

uint64_t OUTLINED_FUNCTION_85_6()
{
  return sub_21D9158C8();
}

uint64_t OUTLINED_FUNCTION_86_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_87_5()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_89_6(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  *(void *)(v5 - 200) = a3;
  *(void *)(v5 - 192) = a4;
  *(void *)(v5 - 208) = a2;
  *(void *)(v5 - 176) = a1;
  *(void *)(v5 - 168) = a5;
}

uint64_t OUTLINED_FUNCTION_90_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_91_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *(void *)(v4 - 176);
  return ExpressionType<>.init(value:)(a1, v2, v3, v6, a2);
}

uint64_t OUTLINED_FUNCTION_93_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_94_1()
{
  *(void *)(v2 - 160) = *(void *)(v2 - 184);
  *(void *)(v2 - 152) = v1;
  *(void *)(v2 - 144) = v0;
  return swift_bridgeObjectRetain();
}

void Collation.expression.getter(uint64_t *a1@<X8>)
{
  unint64_t v3 = v1[1];
  if (v3)
  {
    if (v3 == 1)
    {
      unint64_t v4 = 0xE600000000000000;
      uint64_t v5 = 0x455341434F4ELL;
    }
    else if (v3 == 2)
    {
      unint64_t v4 = 0xE500000000000000;
      uint64_t v5 = 0x4D49525452;
    }
    else
    {
      uint64_t v6 = *v1;
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_21D908300(34, 0xE100000000000000, v6, v3);
      unint64_t v4 = v7;
      sub_21D8F8EE0(v6, v3);
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v5 = 0x5952414E4942;
  }
  *a1 = v5;
  a1[1] = v4;
  a1[2] = MEMORY[0x263F8EE78];
}

uint64_t Collation.description.getter()
{
  uint64_t v1 = v0[1];
  switch(v1)
  {
    case 0:
      return 0x5952414E4942;
    case 1:
      return 0x455341434F4ELL;
    case 2:
      return 0x4D49525452;
  }
  return sub_21D908300(34, 0xE100000000000000, *v0, v1);
}

uint64_t getEnumTagSinglePayload for Collation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Collation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Collation()
{
  return &type metadata for Collation;
}

uint64_t sub_21D905418(uint64_t result, uint64_t a2)
{
  int v3 = result;
  unint64_t v4 = HIDWORD(result);
  if (result < 0 != (int)result < 0)
  {
    if ((int)result >= 0) {
      int v5 = result;
    }
    else {
      int v5 = -(int)result;
    }
    if (result >= 0) {
      int v6 = HIDWORD(result);
    }
    else {
      int v6 = -HIDWORD(result);
    }
    BOOL v7 = __CFADD__(v5, v6);
    uint64_t v8 = (v5 + v6);
    if (v7)
    {
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
    if ((int)result < 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = -v8;
    }
    if (v9)
    {
LABEL_13:
      uint64_t v20 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)sub_21D8ED270(0, v9 & ~(v9 >> 63), 0);
      if ((v9 & 0x8000000000000000) == 0)
      {
        uint64_t v10 = v20;
        uint64_t v19 = (sqlite3_stmt **)(a2 + 16);
        uint64_t result = swift_beginAccess();
        int v11 = v3;
        while (v9)
        {
          uint64_t result = (uint64_t)sqlite3_column_name(*v19, v11);
          if (!result) {
            goto LABEL_33;
          }
          uint64_t result = sub_21D915508();
          uint64_t v12 = result;
          uint64_t v14 = v13;
          unint64_t v16 = *(void *)(v20 + 16);
          unint64_t v15 = *(void *)(v20 + 24);
          if (v16 >= v15 >> 1) {
            uint64_t result = (uint64_t)sub_21D8ED270((char *)(v15 > 1), v16 + 1, 1);
          }
          *(void *)(v20 + 16) = v16 + 1;
          uint64_t v17 = v20 + 16 * v16;
          *(void *)(v17 + 32) = v12;
          *(void *)(v17 + 40) = v14;
          if ((int)v4 < v3) {
            goto LABEL_28;
          }
          if (v11 >= (int)v4) {
            goto LABEL_29;
          }
          ++v11;
          if (!--v9)
          {
            swift_release();
            return v10;
          }
        }
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
      }
      __break(1u);
      goto LABEL_31;
    }
  }
  else
  {
    int v18 = HIDWORD(result) - result;
    if (__OFSUB__(HIDWORD(result), result)) {
      goto LABEL_32;
    }
    uint64_t v9 = v18;
    if (v18) {
      goto LABEL_13;
    }
  }
  swift_release();
  return MEMORY[0x263F8EE78];
}

Swift::OpaquePointer_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.failableNext()()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_21D914698();
  BOOL v4 = sub_21D8FC584(v2, v0);
  int v5 = 0;
  if (!v1 && v4)
  {
    Statement.row.getter(v6);
    int v5 = (void *)sub_21D907630(v6[0], v6[1]);
  }
  result.value._rawValue = v5;
  result.is_nil = v3;
  return result;
}

unint64_t sub_21D90562C()
{
  unint64_t result = (unint64_t)Statement.failableNext()();
  if (v1)
  {

    return 0;
  }
  return result;
}

uint64_t FailableIterator.next()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t Statement.columnNames.getter()
{
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = *(void *)(v0 + 48);
LABEL_7:
    swift_bridgeObjectRetain();
    return v1;
  }
  uint64_t result = Statement.columnCount.getter();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x80000000) == 0)
  {
    uint64_t v3 = result << 32;
    sub_21D914698();
    uint64_t v1 = sub_21D905418(v3, v0);
    *(void *)(v0 + 48) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t Statement.bind(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return sub_21D914698();
  }
  sub_21D9061DC(1);
  swift_beginAccess();
  if (v2 == sqlite3_bind_parameter_count(*(sqlite3_stmt **)(v1 + 16)))
  {
    uint64_t v4 = 0;
    uint64_t v5 = a1 + 32;
    do
    {
      sub_21D906238(v5, ++v4);
      v5 += 40;
    }
    while (v2 != v4);
    return sub_21D914698();
  }
  sub_21D915A08();
  sqlite3_bind_parameter_count(*(sqlite3_stmt **)(v1 + 16));
  sub_21D915BE8();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  sub_21D915BE8();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  uint64_t result = OUTLINED_FUNCTION_2_11();
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  sqlite3_stmt *v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  uint64_t v19;
  int64_t v20;
  long long v21;
  _OWORD v22[2];
  uint64_t v23;
  void v24[2];
  uint64_t v25;

  sub_21D9061DC(1);
  uint64_t v19 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  int v6 = 0;
  uint64_t v20 = (unint64_t)(v3 + 63) >> 6;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  uint64_t v8 = v7 | (v6 << 6);
LABEL_5:
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = (void *)(*(void *)(a1 + 48) + 16 * v8);
  int v11 = v10[1];
  *(void *)&uint64_t v21 = *v10;
  *((void *)&v21 + 1) = v11;
  sub_21D901808(v9 + 40 * v8, (uint64_t)v22);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_21D8817EC((uint64_t)&v21, (uint64_t)v24, &qword_267D15AE8);
    if (!v24[1])
    {
      swift_release();
      return sub_21D914698();
    }
    sub_21D8817EC((uint64_t)&v25, (uint64_t)&v21, &qword_26AD30F68);
    unint64_t v15 = *(sqlite3_stmt **)(v1 + 16);
    unint64_t v16 = sub_21D915458();
    uint64_t v17 = sqlite3_bind_parameter_index(v15, (const char *)(v16 + 32));
    swift_release();
    if (v17 < 1) {
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    sub_21D906238((uint64_t)&v21, v17);
    sub_21D861B48((uint64_t)&v21, &qword_26AD30F68);
    if (v5) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v12 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v12 < v20)
    {
      uint64_t v13 = *(void *)(v19 + 8 * v12);
      if (v13) {
        goto LABEL_9;
      }
      uint64_t v14 = v6 + 2;
      ++v6;
      if (v12 + 1 < v20)
      {
        uint64_t v13 = *(void *)(v19 + 8 * v14);
        if (v13) {
          goto LABEL_12;
        }
        int v6 = v12 + 1;
        if (v12 + 2 < v20)
        {
          uint64_t v13 = *(void *)(v19 + 8 * (v12 + 2));
          if (v13)
          {
            v12 += 2;
            goto LABEL_9;
          }
          uint64_t v14 = v12 + 3;
          int v6 = v12 + 2;
          if (v12 + 3 < v20)
          {
            uint64_t v13 = *(void *)(v19 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                uint64_t v12 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  goto LABEL_30;
                }
                if (v12 >= v20)
                {
                  int v6 = v20 - 1;
                  goto LABEL_23;
                }
                uint64_t v13 = *(void *)(v19 + 8 * v12);
                ++v14;
                if (v13) {
                  goto LABEL_9;
                }
              }
            }
LABEL_12:
            uint64_t v12 = v14;
LABEL_9:
            uint64_t v5 = (v13 - 1) & v13;
            uint64_t v8 = __clz(__rbit64(v13)) + (v12 << 6);
            int v6 = v12;
            goto LABEL_5;
          }
        }
      }
    }
LABEL_23:
    uint64_t v5 = 0;
    uint64_t v23 = 0;
    memset(v22, 0, sizeof(v22));
    uint64_t v21 = 0u;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  sub_21D915A08();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  uint64_t result = OUTLINED_FUNCTION_2_11();
  __break(1u);
  return result;
}

uint64_t Statement.run(_:)(uint64_t a1)
{
  Statement.bind(_:)(a1);
  uint64_t v1 = Statement.run(_:)(MEMORY[0x263F8EE78]);
  swift_release();
  return v1;
}

{
  uint64_t v1;

  Statement.bind(_:)(a1);
  uint64_t v1 = Statement.run(_:)(MEMORY[0x263F8EE78]);
  swift_release();
  return v1;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  id v11;
  uint64_t v13;
  char v14;
  char v15;

  uint64_t v3 = v2;
  uint64_t v4 = v1;
  if (*(void *)(a1 + 16))
  {
    Statement.bind(_:)(a1);
    uint64_t v5 = Statement.run(_:)(MEMORY[0x263F8EE78]);
    swift_release();
    if (!v2) {
      return v5;
    }
  }
  else
  {
    sub_21D9061DC(0);
    sub_21D89FBB8();
    int v6 = *(void *)(v1 + 24);
    swift_beginAccess();
    do
    {
      while (1)
      {
        BOOL v7 = qword_26AD30D38;
        sub_21D914698();
        if (v7 != -1) {
          swift_once();
        }
        sub_21D9157A8();
        uint64_t v8 = sub_21D8FE138();
        if ((v14 & 1) != 0 || v13 != v8) {
          break;
        }
        uint64_t v9 = sqlite3_step(*(sqlite3_stmt **)(v4 + 16));
        uint64_t v10 = sub_21D8FE038(v9, 0);
        swift_release();
        if (v3) {
          return v4;
        }
        if (v10 != 100) {
          goto LABEL_16;
        }
      }
      int v11 = *(id *)(v6 + 88);
      sub_21D9157E8();
      swift_release();

      if (v3) {
        return v4;
      }
    }
    while ((v15 & 1) != 0);
LABEL_16:
    sub_21D914698();
  }
  return v4;
}

uint64_t Statement.scalar(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_release();
}

{
  Statement.bind(_:)(a1);
  Statement.scalar(_:)(MEMORY[0x263F8EE78], a2);
  return swift_release();
}

uint64_t sub_21D905D90(uint64_t a1)
{
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 40) = 1;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 32) = 0;
  uint64_t v3 = (sqlite3 *)Connection.handle.getter();
  uint64_t v4 = sub_21D915458();
  sub_21D914698();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v5 = sqlite3_prepare_v2(v3, (const char *)(v4 + 32), -1, (sqlite3_stmt **)(v1 + 16), 0);
  swift_endAccess();
  swift_release();
  sub_21D8FE038(v5, 0);
  if (v2) {
    swift_release();
  }
  swift_release();
  return v1;
}

uint64_t Statement.deinit()
{
  OUTLINED_FUNCTION_0_12();
  sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Statement.__deallocating_deinit()
{
  Statement.deinit();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t Statement.columnCount.getter()
{
  if (*(unsigned char *)(v0 + 40) != 1) {
    return *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_0_12();
  uint64_t result = sqlite3_column_count(*(sqlite3_stmt **)(v0 + 16));
  *(void *)(v0 + 32) = (int)result;
  *(unsigned char *)(v0 + 40) = 0;
  return result;
}

uint64_t Statement.columnCount.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  *(unsigned char *)(v1 + 40) = 0;
  return result;
}

void *(*Statement.columnCount.modify(uint64_t *a1))(void *result)
{
  a1[1] = v1;
  *a1 = Statement.columnCount.getter();
  return sub_21D905FA4;
}

void *sub_21D905FA4(void *result)
{
  uint64_t v1 = result[1];
  *(void *)(v1 + 32) = *result;
  *(unsigned char *)(v1 + 40) = 0;
  return result;
}

uint64_t sub_21D905FB4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return Statement.columnNames.setter(v0);
}

uint64_t Statement.columnNames.setter(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*Statement.columnNames.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = Statement.columnNames.getter();
  return sub_21D906038;
}

uint64_t sub_21D906038(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return Statement.columnNames.setter(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  Statement.columnNames.setter(v2);
  return swift_bridgeObjectRelease();
}

void Statement.row.getter(void *a1@<X8>)
{
  uint64_t v3 = v1[7];
  if (v3)
  {
    uint64_t v4 = v1[8];
LABEL_5:
    *a1 = v3;
    a1[1] = v4;
    return;
  }
  OUTLINED_FUNCTION_0_12();
  uint64_t v3 = v1[2];
  if (v3)
  {
    sub_21D914698();
    uint64_t v4 = Statement.columnCount.getter();
    swift_release();
    v1[7] = v3;
    v1[8] = v4;
    goto LABEL_5;
  }
  __break(1u);
}

void sub_21D906100(void *a1@<X8>)
{
  Statement.row.getter(v3);
  uint64_t v2 = v3[1];
  *a1 = v3[0];
  a1[1] = v2;
}

void *sub_21D90613C(void *a1)
{
  uint64_t v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  return Statement.row.setter(v3);
}

void *Statement.row.setter(void *result)
{
  uint64_t v2 = result[1];
  *(void *)(v1 + 56) = *result;
  *(void *)(v1 + 64) = v2;
  return result;
}

void *(*Statement.row.modify(void *a1))(void *result)
{
  a1[2] = v1;
  Statement.row.getter(a1);
  return sub_21D9061C8;
}

void *sub_21D9061C8(void *result)
{
  uint64_t v2 = result[1];
  uint64_t v1 = result[2];
  *(void *)(v1 + 56) = *result;
  *(void *)(v1 + 64) = v2;
  return result;
}

uint64_t sub_21D9061DC(char a1)
{
  swift_beginAccess();
  uint64_t result = sqlite3_reset(*(sqlite3_stmt **)(v1 + 16));
  if (a1) {
    return sqlite3_clear_bindings(*(sqlite3_stmt **)(v1 + 16));
  }
  return result;
}

uint64_t sub_21D906238(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 24))
  {
    swift_beginAccess();
    if (a2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (a2 <= 0x7FFFFFFF)
    {
      return sqlite3_bind_null(v2[2], a2);
    }
    __break(1u);
    goto LABEL_46;
  }
  sub_21D901808(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      uint64_t v3 = v13;
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
        {
          unint64_t v4 = *(void *)(v13 + 16);
          if (!(v4 >> 31))
          {
            uint64_t v2 = (sqlite3_stmt **)v2[2];
            if (qword_26AD2F278 == -1)
            {
LABEL_8:
              sqlite3_bind_blob((sqlite3_stmt *)v2, a2, (const void *)(v3 + 32), v4, (void (__cdecl *)(void *))qword_26AD31EF8);
              return swift_bridgeObjectRelease();
            }
LABEL_49:
            swift_once();
            goto LABEL_8;
          }
LABEL_48:
          __break(1u);
          goto LABEL_49;
        }
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
  }
  else
  {
    sub_21D861B48((uint64_t)v15, &qword_26AD30F68);
  }
  sub_21D901808(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      swift_beginAccess();
      if (a2 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (a2 <= 0x7FFFFFFF)
      {
        return sqlite3_bind_double(v2[2], a2, *(double *)&v13);
      }
      __break(1u);
      goto LABEL_52;
    }
  }
  else
  {
    sub_21D861B48((uint64_t)v15, &qword_26AD30F68);
  }
  sub_21D901808(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF) {
          return sqlite3_bind_int64(v2[2], a2, v13);
        }
        goto LABEL_53;
      }
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
  }
  else
  {
    sub_21D861B48((uint64_t)v15, &qword_26AD30F68);
  }
  sub_21D901808(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
        {
          uint64_t v2 = (sqlite3_stmt **)v2[2];
          if (qword_26AD2F278 == -1)
          {
LABEL_30:
            uint64_t v8 = (void (__cdecl *)(void *))qword_26AD31EF8;
            uint64_t v9 = sub_21D915458();
            swift_bridgeObjectRelease();
            sqlite3_bind_text((sqlite3_stmt *)v2, a2, (const char *)(v9 + 32), -1, v8);
            return swift_release();
          }
LABEL_56:
          swift_once();
          goto LABEL_30;
        }
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
  }
  else
  {
    sub_21D861B48((uint64_t)v15, &qword_26AD30F68);
  }
  uint64_t v10 = MEMORY[0x263F8E5C0];
  sub_21D901808(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      uint64_t v11 = v13;
LABEL_39:
      uint64_t v16 = v10;
      uint64_t v17 = &protocol witness table for Int64;
      v15[0] = v11;
      sub_21D906238(v15, a2);
      uint64_t v12 = (long long *)v15;
      return sub_21D861B48((uint64_t)v12, &qword_26AD30F68);
    }
  }
  else
  {
    sub_21D861B48((uint64_t)v15, &qword_26AD30F68);
  }
  sub_21D901808(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      uint64_t v11 = v13;
      goto LABEL_39;
    }
  }
  else
  {
    sub_21D861B48((uint64_t)v15, &qword_26AD30F68);
  }
  sub_21D901808(a1, (uint64_t)&v13);
  if (!v14)
  {
    uint64_t v12 = &v13;
    return sub_21D861B48((uint64_t)v12, &qword_26AD30F68);
  }
  sub_21D861760(&v13, (uint64_t)v15);
  *(void *)&long long v13 = 0;
  *((void *)&v13 + 1) = 0xE000000000000000;
  sub_21D915A08();
  sub_21D9154F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
  sub_21D915AB8();
  uint64_t result = sub_21D915B38();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.step()()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_21D914698();
  return sub_21D8FC584(v1, v0);
}

void Statement.scalar(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 16))
  {
    Statement.bind(_:)(a1);
    Statement.scalar(_:)(MEMORY[0x263F8EE78]);
    swift_release();
  }
  else
  {
    sub_21D9061DC(0);
    uint64_t v6 = *(void *)(v2 + 24);
    sub_21D914698();
    sub_21D8FC584(v6, v2);
    if (!v4)
    {
      Statement.row.getter(&v7);
      Cursor.subscript.getter(0, a2);
    }
  }
}

void Cursor.subscript.getter(uint64_t iCol@<X0>, uint64_t a2@<X8>)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  int v4 = iCol;
  if (iCol > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    sub_21D915A08();
    swift_bridgeObjectRelease();
    sub_21D915BE8();
    sub_21D9154F8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_11();
    __break(1u);
    JUMPOUT(0x21D906C50);
  }
  uint64_t v5 = *v2;
  switch(sqlite3_column_type(*v2, iCol))
  {
    case 1:
      uint64_t v6 = (sqlite3_stmt *)OUTLINED_FUNCTION_5_19();
      sqlite3_int64 v8 = sqlite3_column_int64(v6, v7);
      *(void *)(a2 + 24) = MEMORY[0x263F8E5C0];
      *(void *)(a2 + 32) = &protocol witness table for Int64;
      goto LABEL_10;
    case 2:
      int v18 = (sqlite3_stmt *)OUTLINED_FUNCTION_5_19();
      double v20 = sqlite3_column_double(v18, v19);
      *(void *)(a2 + 24) = MEMORY[0x263F8D538];
      *(void *)(a2 + 32) = &protocol witness table for Double;
      *(double *)a2 = v20;
      return;
    case 3:
      uint64_t v9 = (sqlite3_stmt *)OUTLINED_FUNCTION_5_19();
      if (!sqlite3_column_text(v9, v10)) {
        goto LABEL_16;
      }
      uint64_t v11 = sub_21D915518();
      *(void *)(a2 + 24) = MEMORY[0x263F8D310];
      *(void *)(a2 + 32) = &protocol witness table for String;
      *(void *)a2 = v11;
      *(void *)(a2 + 8) = v12;
      break;
    case 4:
      *(void *)(a2 + 24) = &type metadata for Blob;
      *(void *)(a2 + 32) = &protocol witness table for Blob;
      long long v13 = sqlite3_column_blob(v5, v4);
      if (v13)
      {
        uint64_t v14 = v13;
        unint64_t v15 = (sqlite3_stmt *)OUTLINED_FUNCTION_5_19();
        int v17 = sqlite3_column_bytes(v15, v16);
        sqlite3_int64 v8 = (sqlite3_int64)sub_21D8FAB30(v14, v17);
LABEL_10:
        *(void *)a2 = v8;
      }
      else
      {
        *(void *)a2 = MEMORY[0x263F8EE78];
      }
      break;
    case 5:
      *(void *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return;
    default:
      goto LABEL_17;
  }
}

const char *sub_21D906C64@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  swift_beginAccess();
  uint64_t v5 = sqlite3_step(*(sqlite3_stmt **)(a1 + 16));
  uint64_t result = sub_21D8FE038(v5, 0);
  if (!v2) {
    *a2 = result == 100;
  }
  return result;
}

uint64_t Statement.makeIterator()()
{
  sub_21D9061DC(0);
  return sub_21D914698();
}

uint64_t sub_21D906D08@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  Statement.makeIterator()();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21D906D3C()
{
  return sub_21D906D60();
}

uint64_t sub_21D906D60()
{
  return 0;
}

uint64_t sub_21D906D68()
{
  return sub_21D906D8C();
}

uint64_t sub_21D906D8C()
{
  uint64_t v0 = sub_21D9074AC();
  swift_release();
  return v0;
}

uint64_t sub_21D906DC4()
{
  return sub_21D906DEC();
}

uint64_t sub_21D906DF0()
{
  return sub_21D9155C8();
}

uint64_t Array.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21D9158C8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v26 = v9;
  uint64_t v27 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - v10;
  OUTLINED_FUNCTION_0_3();
  uint64_t v28 = v12;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  int v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  int v18 = (char *)&v26 - v17;
  uint64_t v31 = sub_21D9152F8();
  uint64_t v32 = a1;
  uint64_t v34 = v31;
  int v19 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v20 = v33;
  uint64_t v33 = a3;
  v19(a3, a4);
  if (v20)
  {
    OUTLINED_FUNCTION_7();
    (*(void (**)(void))(v23 + 8))();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = v19;
    uint64_t v31 = a4;
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v28 + 32);
    uint64_t v21 = (void (**)(char *, char *, uint64_t))(v28 + 16);
    uint64_t v22 = (void (**)(char *, uint64_t))(v28 + 8);
    while (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, a2) != 1)
    {
      (*v29)(v18, v11, a2);
      (*v21)(v16, v18, a2);
      sub_21D915688();
      sub_21D915678();
      (*v22)(v18, a2);
      v30(v33, v31);
    }
    OUTLINED_FUNCTION_7();
    (*(void (**)(void))(v25 + 8))();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);
    return v34;
  }
}

unint64_t sub_21D9070C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = (unint64_t)Statement.failableNext()();
  if (!v3) {
    *a1 = result;
  }
  return result;
}

unint64_t sub_21D9070F4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_21D90562C();
  *a1 = result;
  return result;
}

const char *Statement.description.getter()
{
  OUTLINED_FUNCTION_0_12();
  unint64_t result = sqlite3_sql(*(sqlite3_stmt **)(v0 + 16));
  if (result) {
    return (const char *)sub_21D915508();
  }
  __break(1u);
  return result;
}

const char *sub_21D907154()
{
  return Statement.description.getter();
}

double Cursor.subscript.getter(uint64_t iCol)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (iCol <= 0x7FFFFFFF)
  {
    return sqlite3_column_double(*v1, iCol);
  }
  __break(1u);
  return result;
}

sqlite3_int64 Cursor.subscript.getter(sqlite3_int64 result)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    return OUTLINED_FUNCTION_3_15(result, result);
  }
  __break(1u);
  return result;
}

{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    return OUTLINED_FUNCTION_3_15(result, result);
  }
  __break(1u);
  return result;
}

uint64_t Cursor.subscript.getter(uint64_t iCol)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (iCol > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  iCol = (uint64_t)sqlite3_column_text(*v1, iCol);
  if (!iCol)
  {
LABEL_9:
    __break(1u);
    return iCol;
  }
  return sub_21D915518();
}

uint64_t Cursor.subscript.getter@<X0>(uint64_t iCol@<X0>, void *a2@<X8>)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_8;
  }
  int v4 = iCol;
  if (iCol > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    return iCol;
  }
  uint64_t v5 = *v2;
  uint64_t v6 = sqlite3_column_blob(v5, iCol);
  if (v6)
  {
    int v7 = v6;
    int v8 = sqlite3_column_bytes(v5, v4);
    iCol = (uint64_t)sub_21D8FAB30(v7, v8);
  }
  else
  {
    iCol = MEMORY[0x263F8EE78];
  }
  *a2 = iCol;
  return iCol;
}

BOOL Cursor.subscript.getter(BOOL iCol)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (iCol <= 0x7FFFFFFF)
  {
    return sqlite3_column_int64(*v1, iCol) != 0;
  }
  __break(1u);
  return iCol;
}

uint64_t Cursor.makeIterator()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  int v4 = (void *)swift_allocObject();
  v4[2] = v3;
  uint64_t v4[3] = v1;
  v4[4] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F360);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_21D907830;
  *(void *)(result + 24) = v4;
  return result;
}

void sub_21D9073B0(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  if (*(void *)(a1 + 16) >= a2)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(_OWORD *)(a3 + 24) = xmmword_21D91A540;
  }
  else
  {
    swift_beginAccess();
    uint64_t v7 = *v6 + 1;
    if (__OFADD__(*v6, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t *v6 = v7;
      Cursor.subscript.getter(v7 - 1, a3);
    }
  }
}

uint64_t sub_21D90746C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Cursor.makeIterator()();
  *a1 = result;
  return result;
}

uint64_t sub_21D907494()
{
  return sub_21D906D60();
}

uint64_t sub_21D90749C()
{
  return sub_21D906DC0(*v0, v0[1]);
}

uint64_t sub_21D9074A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21D906DE8(a1, a2, a3, *v3, v3[1]);
}

uint64_t sub_21D9074AC()
{
  sub_21D914698();
  sub_21D9061DC(0);
  uint64_t result = (unint64_t)Statement.failableNext()();
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = 0;
LABEL_21:
  }
  else
  {
    uint64_t v4 = result;
    uint64_t v3 = 0;
    uint64_t v5 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
    while (v4)
    {
      if (!v3)
      {
        unint64_t v6 = v2[3];
        if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_27;
        }
        int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
        if (v7 <= 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v7;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D15B08);
        uint64_t v9 = (void *)swift_allocObject();
        uint64_t v10 = (uint64_t)(_swift_stdlib_malloc_size(v9) - 32) / 8;
        v9[2] = v8;
        v9[3] = 2 * v10;
        unint64_t v11 = (unint64_t)(v9 + 4);
        unint64_t v12 = v2[3];
        unint64_t v13 = v12 >> 1;
        if (v2[2])
        {
          if (v9 != v2 || v11 >= (unint64_t)&v2[v13 + 4]) {
            memmove(v9 + 4, v2 + 4, 8 * v13);
          }
          v2[2] = 0;
        }
        uint64_t v5 = (uint64_t *)(v11 + 8 * v13);
        uint64_t v3 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - (v12 >> 1);
        uint64_t result = swift_release();
        uint64_t v2 = v9;
      }
      BOOL v15 = __OFSUB__(v3--, 1);
      if (v15)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      *v5++ = v4;
      uint64_t result = (unint64_t)Statement.failableNext()();
      uint64_t v4 = result;
      if (v1) {
        goto LABEL_21;
      }
    }
  }
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v16 = v2[3];
  if (v16 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v17 = v16 >> 1;
  BOOL v15 = __OFSUB__(v17, v3);
  unint64_t v18 = v17 - v3;
  if (!v15)
  {
    v2[2] = v18;
    return (uint64_t)v2;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21D907630(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  uint64_t v4 = (uint64_t *)(v3 + 16);
  sub_21D914698();
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = (void *)MEMORY[0x263F8EE78];
  if (*v4 < a2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x263F8EE78] + 32;
    while (1)
    {
      uint64_t *v4 = v5 + 1;
      Cursor.subscript.getter(v5, (uint64_t)v23);
      uint64_t result = sub_21D8817EC((uint64_t)v23, (uint64_t)v24, &qword_26AD30F68);
      if (!v7)
      {
        unint64_t v10 = v6[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F378);
        unint64_t v13 = (void *)swift_allocObject();
        uint64_t v14 = (uint64_t)(_swift_stdlib_malloc_size(v13) - 32) / 40;
        v13[2] = v12;
        v13[3] = 2 * v14;
        unint64_t v15 = (unint64_t)(v13 + 4);
        unint64_t v16 = v6[3];
        unint64_t v17 = v16 >> 1;
        if (v6[2])
        {
          if (v13 != v6 || v15 >= (unint64_t)&v6[5 * v17 + 4]) {
            memmove(v13 + 4, v6 + 4, 40 * v17);
          }
          uint64_t v6[2] = 0;
        }
        uint64_t v8 = v15 + 40 * v17;
        uint64_t v7 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - (v16 >> 1);
        uint64_t result = swift_release();
        unint64_t v6 = v13;
      }
      BOOL v19 = __OFSUB__(v7--, 1);
      if (v19) {
        break;
      }
      sub_21D8817EC((uint64_t)v24, v8, &qword_26AD30F68);
      v8 += 40;
      uint64_t v5 = *v4;
      if (*v4 >= a2) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v7 = 0;
LABEL_21:
  uint64_t result = swift_release_n();
  unint64_t v20 = v6[3];
  if (v20 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v21 = v20 >> 1;
  BOOL v19 = __OFSUB__(v21, v7);
  unint64_t v22 = v21 - v7;
  if (!v19)
  {
    uint64_t v6[2] = v22;
    return (uint64_t)v6;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_21D907820()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21D907830(uint64_t a1@<X8>)
{
  sub_21D9073B0(*(void *)(v1 + 16), *(void *)(v1 + 32), a1);
}

unint64_t sub_21D907840()
{
  unint64_t result = qword_267D15AF0;
  if (!qword_267D15AF0)
  {
    type metadata accessor for Statement();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15AF0);
  }
  return result;
}

uint64_t type metadata accessor for Statement()
{
  return self;
}

unint64_t sub_21D9078B0(uint64_t a1)
{
  unint64_t result = sub_21D907840();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21D9078DC()
{
  unint64_t result = qword_267D15AF8;
  if (!qword_267D15AF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D15B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D15AF8);
  }
  return result;
}

uint64_t sub_21D907930@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Statement.columnCount.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21D90795C(uint64_t *a1)
{
  return Statement.columnCount.setter(*a1);
}

uint64_t sub_21D907984@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Statement.columnNames.getter();
  *a1 = result;
  return result;
}

uint64_t method lookup function for Statement(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Statement);
}

uint64_t dispatch thunk of FailableIterator.failableNext()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t getEnumTagSinglePayload for Cursor(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 1 || !*(unsigned char *)(a1 + 16))
    {
      if (*(void *)a1) {
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

uint64_t storeEnumTagSinglePayload for Cursor(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Cursor()
{
  return &type metadata for Cursor;
}

uint64_t sub_21D907A84(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  int64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  void v11[3] = a4;
  v11[4] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD2F360);
  uint64_t result = swift_allocObject();
  uint64_t v13 = result;
  uint64_t v14 = 0;
  *(void *)(result + 16) = sub_21D907ECC;
  *(void *)(result + 24) = v11;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v13;
    return v14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_21D907830((uint64_t)v15);
    if (v16 == 1)
    {
      uint64_t v14 = 0;
LABEL_9:
      sub_21D861B48((uint64_t)v15, &qword_26AD2F280);
    }
    else
    {
      uint64_t v14 = 0;
      while (1)
      {
        sub_21D8817EC((uint64_t)v15, (uint64_t)v17, &qword_26AD30F68);
        sub_21D8817EC((uint64_t)v17, a2, &qword_26AD30F68);
        if (a3 - 1 == v14) {
          break;
        }
        a2 += 40;
        sub_21D907830((uint64_t)v15);
        ++v14;
        if (v16 == 1) {
          goto LABEL_9;
        }
      }
      uint64_t v14 = a3;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_21D907BE4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21D907C1C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_21D9061DC(0);
  uint64_t v8 = 0;
  if (!a2 || !a3)
  {
LABEL_6:
    *a1 = v3;
    return v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v9 = (unint64_t)Statement.failableNext()();
    uint64_t v8 = 0;
    if (v10)
    {
LABEL_5:
    }
    else
    {
      while (v9)
      {
        *(void *)(a2 + 8 * v8) = v9;
        if (a3 - 1 == v8)
        {
          uint64_t v8 = a3;
          goto LABEL_6;
        }
        unint64_t v9 = (unint64_t)Statement.failableNext()();
        ++v8;
        if (v10) {
          goto LABEL_5;
        }
      }
    }
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_21D907CCC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    long long v5[2] = ~v7;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
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

uint64_t OUTLINED_FUNCTION_0_12()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_21D915B38();
}

sqlite3_int64 OUTLINED_FUNCTION_3_15(uint64_t a1, int a2)
{
  return sqlite3_column_int64(*v2, a2);
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return v0;
}

void * infix(_:_:)(void *a1@<X8>)
{
  *a1 = 42;
  a1[1] = 0xE100000000000000;
  a1[2] = MEMORY[0x263F8EE78];
}

void sub_21D907F44(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int v2 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (void *)(a1 + 32);
    swift_bridgeObjectRetain();
    uint64_t v5 = MEMORY[0x263F8EE78];
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v7 = v4[3];
      uint64_t v8 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v7);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v8 + 8))(v30, v7, v8);
      uint64_t v10 = v30[0];
      uint64_t v9 = v30[1];
      uint64_t v11 = v30[2];
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21D888D80(0, *(void *)(v5 + 16) + 1, 1, v5);
        uint64_t v5 = v24;
      }
      unint64_t v13 = *(void *)(v5 + 16);
      unint64_t v12 = *(void *)(v5 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_21D888D80(v12 > 1, v13 + 1, 1, v5);
        uint64_t v5 = v25;
      }
      *(void *)(v5 + 16) = v13 + 1;
      uint64_t v14 = v5 + 16 * v13;
      *(void *)(v14 + 32) = v10;
      *(void *)(v14 + 40) = v9;
      uint64_t v15 = *(void *)(v11 + 16);
      uint64_t v16 = v6[2];
      uint64_t v17 = v16 + v15;
      if (__OFADD__(v16, v15)) {
        break;
      }
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v17 > v6[3] >> 1)
      {
        if (v16 <= v17) {
          uint64_t v19 = v16 + v15;
        }
        else {
          uint64_t v19 = v16;
        }
        sub_21D8EC9CC(isUniquelyReferenced_nonNull_native, v19, 1, v6);
        uint64_t v6 = v20;
      }
      if (*(void *)(v11 + 16))
      {
        if ((v6[3] >> 1) - v6[2] < v15) {
          goto LABEL_26;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F68);
        swift_arrayInitWithCopy();
        if (v15)
        {
          uint64_t v21 = v6[2];
          BOOL v22 = __OFADD__(v21, v15);
          uint64_t v23 = v21 + v15;
          if (v22) {
            goto LABEL_27;
          }
          uint64_t v6[2] = v23;
        }
      }
      else if (v15)
      {
        goto LABEL_25;
      }
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v4 += 5;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        int v2 = a2;
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
LABEL_23:
    v30[0] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD31030);
    sub_21D874248((unint64_t *)&qword_26AD31038, &qword_26AD31030);
    uint64_t v26 = sub_21D915378();
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    v2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
    v2[4] = (uint64_t)&protocol witness table for Expression<A>;
    *int v2 = v26;
    v2[1] = v28;
    v2[2] = (uint64_t)v6;
  }
}

uint64_t sub_21D9081F4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  swift_bridgeObjectRetain();
  sub_21D9154F8();
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = *(void (**)(uint64_t))(v6 + 8);
  uint64_t v8 = OUTLINED_FUNCTION_1_14();
  v7(v8);
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  swift_bridgeObjectRelease();
  sub_21D9154F8();
  uint64_t v9 = OUTLINED_FUNCTION_1_14();
  v7(v9);
  swift_bridgeObjectRelease();
  return Expression.init(_:_:)(a2, a3, v11, a4);
}

uint64_t sub_21D908300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0;
}

uint64_t sub_21D9083B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_21D901808(a1, (uint64_t)v6);
  if (v7)
  {
    sub_21D908628((uint64_t)v6, a2, a3);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21D908420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Expression();
  uint64_t v22 = 32;
  unint64_t v23 = 0xE100000000000000;
  sub_21D9154F8();
  sub_21D9154F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD310C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D917D30;
  sub_21D861694(a1, inited + 32);
  sub_21D861694(a2, inited + 72);
  sub_21D907F44(inited, &v22);
  swift_setDeallocating();
  sub_21D8ECF90();
  swift_bridgeObjectRelease();
  uint64_t v10 = v25;
  uint64_t v11 = v26;
  __swift_project_boxed_opaque_existential_1(&v22, v25);
  ((void (*)(uint64_t *__return_ptr, uint64_t, _UNKNOWN **))v11[1])(&v20, v10, v11);
  uint64_t v18 = v20;
  long long v19 = v21;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = sub_21D874248(&qword_267D159A0, &qword_26AD30EB0);
  ExpressionType.init<A>(_:)((uint64_t)&v18, v8, v12, WitnessTable, v14);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  unint64_t v16 = v28;
  uint64_t v17 = v29;
  if (a3)
  {
    uint64_t v25 = v8;
    uint64_t v26 = &protocol witness table for Expression<A>;
    uint64_t v22 = v27;
    unint64_t v23 = v28;
    uint64_t v24 = v29;
    sub_21D9081F4(&v22, 0, 0xE000000000000000, a4);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  }
  else
  {
    *a4 = v27;
    a4[1] = v16;
    a4[2] = v17;
  }
  return result;
}

uint64_t sub_21D908628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = &v13[-v8 - 8];
  uint64_t v10 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v10);
  sub_21D861694(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
  swift_dynamicCast();
  (*(void (**)(char *, uint64_t, uint64_t))(a3 + 48))(v9, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  return swift_dynamicCast();
}

uint64_t sub_21D9087EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  swift_bridgeObjectRetain();
  sub_21D9154F8();
  uint64_t v6 = v9;
  uint64_t v7 = v10;
  *(void *)(a4 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30EB0);
  *(void *)(a4 + 32) = &protocol witness table for Expression<A>;
  sub_21D907F44(a1, &v9);
  sub_21D8E8498(&v9, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D908890(uint64_t a1)
{
  sub_21D901808(a1, (uint64_t)&v6);
  if (v7)
  {
    sub_21D861760(&v6, (uint64_t)v8);
    sub_21D861694((uint64_t)v8, (uint64_t)&v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD30F60);
    if (swift_dynamicCast())
    {
      uint64_t v4 = 10104;
      uint64_t v5 = 0xE200000000000000;
      Blob.toHex()();
      sub_21D9154F8();
      swift_bridgeObjectRelease();
      sub_21D9154F8();
      swift_bridgeObjectRelease();
      uint64_t v1 = 10104;
    }
    else
    {
      if (!swift_dynamicCast())
      {
        sub_21D861760(&v6, (uint64_t)&v4);
        sub_21D915AB8();
        uint64_t v1 = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v4);
        int v2 = (long long *)v8;
        goto LABEL_9;
      }
      uint64_t v1 = sub_21D908300(39, 0xE100000000000000, v4, v5);
      swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    int v2 = &v6;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    return v1;
  }
  sub_21D901870((uint64_t)&v6);
  return 1280070990;
}

void sub_21D908A20()
{
  qword_26AD31EF8 = -1;
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return sub_21D915368();
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return v0;
}

uint64_t Bool.datatypeValue.getter(char a1)
{
  return a1 & 1;
}

BOOL static Bool.fromDatatypeValue(_:)(uint64_t a1)
{
  return a1 != 0;
}

void static Double.declaredDatatype.getter()
{
}

uint64_t sub_21D908A98()
{
  return 1279346002;
}

double sub_21D908AA8@<D0>(double *a1@<X0>, void *a2@<X8>)
{
  double result = *a1;
  *a2 = *(void *)a1;
  return result;
}

double sub_21D908AB4@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t static Int64.declaredDatatype.getter()
{
  return 0x52454745544E49;
}

uint64_t sub_21D908ADC()
{
  return 0x52454745544E49;
}

void static String.declaredDatatype.getter()
{
}

uint64_t static String.fromDatatypeValue(_:)(uint64_t a1)
{
  return a1;
}

uint64_t String.datatypeValue.getter(uint64_t a1)
{
  return a1;
}

uint64_t sub_21D908B68@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static String.fromDatatypeValue(_:)(*a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21D908B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = String.datatypeValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void static Blob.declaredDatatype.getter()
{
}

uint64_t static Blob.fromDatatypeValue(_:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return OUTLINED_FUNCTION_0_14(*a1, a2);
}

uint64_t Blob.datatypeValue.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_14(*v1, a1);
}

uint64_t static Bool.declaredDatatype.getter()
{
  return OUTLINED_FUNCTION_2_12((uint64_t *)aInteger);
}

uint64_t static Bool.declaredDatatype.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_1_15(a1, a2, aInteger);
}

uint64_t (*static Bool.declaredDatatype.modify())()
{
  return j__swift_endAccess;
}

BOOL sub_21D908C4C@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = static Bool.fromDatatypeValue(_:)(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_21D908C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Bool.datatypeValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t static Int.declaredDatatype.getter()
{
  return OUTLINED_FUNCTION_2_12((uint64_t *)aInteger_0);
}

uint64_t sub_21D908CB4(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static Int.declaredDatatype.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_1_15(a1, a2, aInteger_0);
}

uint64_t sub_21D908D14(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Int.declaredDatatype.modify())()
{
  return j_j__swift_endAccess;
}

_UNKNOWN **sub_21D908DBC()
{
  return &protocol witness table for Double;
}

_UNKNOWN **sub_21D908DC8()
{
  return &protocol witness table for Int64;
}

_UNKNOWN **sub_21D908DD4()
{
  return &protocol witness table for String;
}

_UNKNOWN **sub_21D908DE0()
{
  return &protocol witness table for Blob;
}

void *sub_21D908DF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_21D908DFC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t dispatch thunk of static Value.declaredDatatype.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static Value.fromDatatypeValue(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of Value.datatypeValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t OUTLINED_FUNCTION_0_14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_15(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_21D908D14(a1, a2, a3, a3 + 1);
}

uint64_t OUTLINED_FUNCTION_2_12(uint64_t *a1)
{
  return sub_21D908CB4(a1);
}

uint64_t OUTLINED_FUNCTION_3_16()
{
  return swift_beginAccess();
}

uint64_t RRSchemaProvisionalPullerStartedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        [a1 setName:v18];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalPullerEndedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v26 = PBReaderReadString();
        [a1 setName:v26];
      }
      else if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_34;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        uint64_t v25 = *(unsigned char *)(a2 + *v5) ? 0 : v20;
LABEL_34:
        [a1 setEntityCount:v25];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalPullerFailedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v25 = PBReaderReadString();
        [a1 setName:v25];
      }
      else if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        [a1 setTimeout:v20 != 0];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalPullerContextReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 103)
      {
        unsigned int v19 = objc_alloc_init(RRSchemaProvisionalPullerFailed);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalPullerFailedReadFrom(v19, a2) & 1) == 0)
        {
LABEL_35:

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setFailed:", v19, 0, 0);
        goto LABEL_30;
      }
      if (v18 == 102) {
        break;
      }
      if (v18 == 101)
      {
        unsigned int v19 = objc_alloc_init(RRSchemaProvisionalPullerStarted);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalPullerStartedReadFrom(v19, a2) & 1) == 0) {
          goto LABEL_35;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setStarted:", v19, 0, 0);
LABEL_30:

        goto LABEL_32;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_32:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v19 = objc_alloc_init(RRSchemaProvisionalPullerEnded);
    if (!PBReaderPlaceMark() || (RRSchemaProvisionalPullerEndedReadFrom(v19, a2) & 1) == 0) {
      goto LABEL_35;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setEnded:", v19, 0, 0);
    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRRGroupIdentifierReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v26 = PBReaderReadString();
        [a1 setGroupId:v26];
      }
      else if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_34;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        uint64_t v25 = *(unsigned char *)(a2 + *v5) ? 0 : v20;
LABEL_34:
        [a1 setSeq:v25];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRRAnnotationReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        while (1)
        {
          uint64_t v29 = *v3;
          uint64_t v30 = *(void *)(a2 + v29);
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)(a2 + *v4)) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
          *(void *)(a2 + v29) = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0) {
            goto LABEL_42;
          }
          v26 += 7;
          BOOL v15 = v27++ >= 9;
          if (v15)
          {
            uint64_t v33 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
        uint64_t v33 = *(unsigned char *)(a2 + *v5) ? 0 : v28;
LABEL_45:
        [a1 setName:v33];
      }
      else if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_37;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_40;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        uint64_t v25 = *(unsigned char *)(a2 + *v5) ? 0 : v20;
LABEL_40:
        [a1 setAnnotationAddedTimestampInSeconds:v25];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRRAnnotatedEntityReadFrom(void *a1, uint64_t a2, double a3)
{
  uint64_t v4 = (int *)MEMORY[0x263F62298];
  uint64_t v5 = (int *)MEMORY[0x263F62288];
  long long v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v6) == 0;
  }
  char v8 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v6)) {
      return *(unsigned char *)(a2 + *v6) == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      uint64_t v13 = *(void *)(a2 + v12);
      unint64_t v14 = v13 + 1;
      if (v13 == -1 || v14 > *(void *)(a2 + *v5)) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)(a2 + *v8) + v13);
      *(void *)(a2 + v12) = v14;
      v11 |= (unint64_t)(v15 & 0x7F) << v9;
      if ((v15 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      BOOL v16 = v10++ >= 9;
      if (v16)
      {
        unint64_t v11 = 0;
        uint64_t v17 = *v6;
        int v18 = *(unsigned __int8 *)(a2 + v17);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v6) = 1;
LABEL_12:
    uint64_t v17 = *v6;
    int v18 = *(unsigned __int8 *)(a2 + v17);
    if (*(unsigned char *)(a2 + v17)) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v18 || (v11 & 7) == 4) {
      return *(unsigned char *)(a2 + *v6) == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        uint64_t v20 = (RRSchemaProvisionalRRGroupIdentifier *)objc_alloc_init(MEMORY[0x263F6F180]);
        if (!PBReaderPlaceMark() || (USOSchemaUSOGraphReadFrom() & 1) == 0) {
          goto LABEL_63;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setUsoGraph:", v20, 0, 0);
        goto LABEL_32;
      case 2u:
        PBReaderReadString();
        uint64_t v20 = (RRSchemaProvisionalRRGroupIdentifier *)objc_claimAutoreleasedReturnValue();
        [a1 setSwiftClassName:v20];
        goto LABEL_32;
      case 3u:
        uint64_t v20 = objc_alloc_init(RRSchemaProvisionalRRGroupIdentifier);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalRRGroupIdentifierReadFrom(v20, a2) & 1) == 0) {
          goto LABEL_63;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setGroup:", v20, 0, 0);
        goto LABEL_32;
      case 4u:
        uint64_t v20 = objc_alloc_init(RRSchemaProvisionalRRAnnotation);
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        if (PBReaderPlaceMark() && RRSchemaProvisionalRRAnnotationReadFrom(v20, a2))
        {
          PBReaderRecallMark();
          if (v20) {
            objc_msgSend(a1, "addAnnotations:", v20, 0, 0);
          }
LABEL_32:

LABEL_61:
          if (*(void *)(a2 + *v4) >= *(void *)(a2 + *v5)) {
            return *(unsigned char *)(a2 + *v6) == 0;
          }
          continue;
        }
LABEL_63:

        return 0;
      case 5u:
        uint64_t v22 = *v4;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(void *)(a2 + *v5))
        {
          LODWORD(a3) = *(_DWORD *)(*(void *)(a2 + *v8) + v23);
          *(void *)(a2 + v22) = v23 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + v17) = 1;
          a3 = 0.0;
        }
        objc_msgSend(a1, "setSaliencyScore:", a3, v39, v40);
        goto LABEL_61;
      case 6u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        while (2)
        {
          uint64_t v27 = *v4;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v5))
          {
            *(unsigned char *)(a2 + *v6) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v8) + v28);
            *(void *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              BOOL v16 = v25++ >= 9;
              if (v16)
              {
                uint64_t v31 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v6)) {
          uint64_t v31 = 0;
        }
        else {
          uint64_t v31 = v26;
        }
LABEL_54:
        objc_msgSend(a1, "setSaliencyComputedAtTimestampInSeconds:", v31, v39, v40);
        goto LABEL_61;
      case 7u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        while (2)
        {
          uint64_t v35 = *v4;
          uint64_t v36 = *(void *)(a2 + v35);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + *v5))
          {
            *(unsigned char *)(a2 + *v6) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v8) + v36);
            *(void *)(a2 + v35) = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if (v38 < 0)
            {
              v32 += 7;
              BOOL v16 = v33++ >= 9;
              if (v16)
              {
                uint64_t v34 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v6)) {
          uint64_t v34 = 0;
        }
LABEL_58:
        [a1 setHasReference:v34 != 0];
        goto LABEL_61;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_61;
    }
  }
}

uint64_t RRSchemaProvisionalRRUsoGraphTier1ReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 101)
      {
        id v18 = objc_alloc_init(MEMORY[0x263F6F190]);
        if (!PBReaderPlaceMark() || (USOSchemaUSOGraphTier1ReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setUsoGraphTier1:", v18, 0, 0);
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolResolveFailedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_29;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_32;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        uint64_t v25 = *(unsigned char *)(a2 + *v5) ? 0 : v20;
LABEL_32:
        [a1 setReason:v25];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolResolveEndedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v26 = objc_alloc_init(RRSchemaProvisionalRRAnnotatedEntity);
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if (!PBReaderPlaceMark()
          || !RRSchemaProvisionalRRAnnotatedEntityReadFrom(v26, a2, v27))
        {

          return 0;
        }
        PBReaderRecallMark();
        if (v26) {
          objc_msgSend(a1, "addQueryResults:", v26, 0, 0);
        }
      }
      else if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_38;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = v20;
        }
LABEL_38:
        objc_msgSend(a1, "setOutcome:", v25, v29, v30);
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolResolveStartedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v18 = objc_alloc_init(MEMORY[0x263F6F180]);
        if (!PBReaderPlaceMark() || (USOSchemaUSOGraphReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setUsoQuery:", v18, 0, 0);
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalRREntityPoolResolveContextReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 103)
      {
        unsigned int v19 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveFailed);
        if (!PBReaderPlaceMark()
          || (RRSchemaProvisionalRREntityPoolResolveFailedReadFrom(v19, a2) & 1) == 0)
        {
LABEL_35:

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setFailed:", v19, 0, 0);
        goto LABEL_30;
      }
      if (v18 == 102) {
        break;
      }
      if (v18 == 101)
      {
        unsigned int v19 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveStarted);
        if (!PBReaderPlaceMark()
          || (RRSchemaProvisionalRREntityPoolResolveStartedReadFrom(v19, a2) & 1) == 0)
        {
          goto LABEL_35;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setStartedOrChanged:", v19, 0, 0);
LABEL_30:

        goto LABEL_32;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_32:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v19 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveEnded);
    if (!PBReaderPlaceMark() || (RRSchemaProvisionalRREntityPoolResolveEndedReadFrom(v19, a2) & 1) == 0) {
      goto LABEL_35;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setEnded:", v19, 0, 0);
    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolReturnedReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 101)
      {
        uint64_t v26 = objc_alloc_init(RRSchemaProvisionalRRAnnotatedEntity);
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if (!PBReaderPlaceMark()
          || !RRSchemaProvisionalRRAnnotatedEntityReadFrom(v26, a2, v27))
        {

          return 0;
        }
        PBReaderRecallMark();
        if (v26) {
          objc_msgSend(a1, "addCandidateEntities:", v26, 0, 0);
        }
      }
      else if ((v10 >> 3) == 102)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_38;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = v20;
        }
LABEL_38:
        objc_msgSend(a1, "setEntityCount:", v25, v29, v30);
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalRRClientEventMetadataReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v18 = objc_alloc_init(MEMORY[0x263F6EEE0]);
        if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0) {
          goto LABEL_31;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setRrID:", v18, 0, 0);
LABEL_26:

        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x263F6EEE0]);
    if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0)
    {
LABEL_31:

      return 0;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setRequestId:", v18, 0, 0);
    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalRRClientEventReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 'e':
        id v18 = objc_alloc_init(RRSchemaProvisionalPullerContext);
        if (!PBReaderPlaceMark() || !RRSchemaProvisionalPullerContextReadFrom(v18, a2)) {
          goto LABEL_42;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setPullerContext:", v18, 0, 0);
        goto LABEL_35;
      case 'f':
        id v18 = objc_alloc_init(RRSchemaProvisionalRREntityPoolReturned);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalRREntityPoolReturnedReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_42;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setEntityPoolReturned:", v18, 0, 0);
        goto LABEL_35;
      case 'g':
        id v18 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveContext);
        if (!PBReaderPlaceMark() || !RRSchemaProvisionalRREntityPoolResolveContextReadFrom(v18, a2)) {
          goto LABEL_42;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setEntityPoolResolveContext:", v18, 0, 0);
        goto LABEL_35;
      case 'h':
        id v18 = objc_alloc_init(RRSchemaProvisionalRRUsoGraphTier1);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalRRUsoGraphTier1ReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_42;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setRrUsoGraphTier1:", v18, 0, 0);
        goto LABEL_35;
      default:
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_36:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        id v18 = objc_alloc_init(RRSchemaProvisionalRRClientEventMetadata);
        if (PBReaderPlaceMark() && RRSchemaProvisionalRRClientEventMetadataReadFrom(v18, a2))
        {
          PBReaderRecallMark();
          objc_msgSend(a1, "setEventMetadata:", v18, 0, 0);
LABEL_35:

          goto LABEL_36;
        }
LABEL_42:

        return 0;
    }
  }
}

uint64_t sub_21D9132A8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21D9132B8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21D9132C8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21D9132D8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_21D9132E8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21D9132F8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21D913308()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_21D913318()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_21D913328()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_21D913338()
{
  return MEMORY[0x270EEE6D0]();
}

uint64_t sub_21D913348()
{
  return MEMORY[0x270EEE710]();
}

uint64_t sub_21D913358()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_21D913368()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_21D913378()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_21D913388()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_21D913398()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_21D9133A8()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_21D9133B8()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_21D9133C8()
{
  return MEMORY[0x270EEE8C8]();
}

uint64_t sub_21D9133D8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_21D9133E8()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_21D9133F8()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_21D913408()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_21D913418()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_21D913428()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_21D913438()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_21D913448()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_21D913458()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_21D913468()
{
  return MEMORY[0x270EEF360]();
}

uint64_t sub_21D913478()
{
  return MEMORY[0x270EEF390]();
}

uint64_t sub_21D913488()
{
  return MEMORY[0x270EEF3B8]();
}

uint64_t sub_21D913498()
{
  return MEMORY[0x270EEF3F8]();
}

uint64_t sub_21D9134A8()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_21D9134B8()
{
  return MEMORY[0x270EEF420]();
}

uint64_t sub_21D9134C8()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_21D9134D8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21D9134E8()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_21D9134F8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_21D913508()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_21D913518()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_21D913528()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21D913538()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_21D913548()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_21D913558()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_21D913568()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21D913578()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_21D913588()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21D913598()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_21D9135A8()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_21D9135B8()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_21D9135C8()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_21D9135D8()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_21D9135E8()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_21D9135F8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_21D913608()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21D913618()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_21D913628()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_21D913638()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_21D913648()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_21D913658()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21D913668()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_21D913678()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_21D913688()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21D913698()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21D9136A8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21D9136B8()
{
  return MEMORY[0x270EF0C80]();
}

uint64_t sub_21D9136C8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_21D9136D8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_21D9136E8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21D9136F8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21D913708()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_21D913718()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_21D913728()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_21D913738()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_21D913748()
{
  return MEMORY[0x270EF0E40]();
}

uint64_t sub_21D913758()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_21D913768()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_21D913778()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_21D913788()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_21D913798()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_21D9137A8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21D9137B8()
{
  return MEMORY[0x270EF1220]();
}

uint64_t sub_21D9137C8()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_21D9137D8()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_21D9137E8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_21D9137F8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_21D913808()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_21D913818()
{
  return MEMORY[0x270EF1588]();
}

uint64_t sub_21D913828()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_21D913838()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_21D913848()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_21D913858()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_21D913868()
{
  return MEMORY[0x270F10B28]();
}

uint64_t sub_21D913878()
{
  return MEMORY[0x270F10B30]();
}

uint64_t sub_21D913888()
{
  return MEMORY[0x270F10B38]();
}

uint64_t sub_21D913898()
{
  return MEMORY[0x270F10B40]();
}

uint64_t sub_21D9138A8()
{
  return MEMORY[0x270F10B90]();
}

uint64_t sub_21D9138B8()
{
  return MEMORY[0x270F10BA0]();
}

uint64_t sub_21D9138C8()
{
  return MEMORY[0x270F10BE8]();
}

uint64_t sub_21D9138D8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_21D9138E8()
{
  return MEMORY[0x270F6BB30]();
}

uint64_t sub_21D9138F8()
{
  return MEMORY[0x270F6BFB0]();
}

uint64_t sub_21D913908()
{
  return MEMORY[0x270F6BFC8]();
}

uint64_t sub_21D913918()
{
  return MEMORY[0x270F6BFD8]();
}

uint64_t sub_21D913928()
{
  return MEMORY[0x270F6BFE0]();
}

uint64_t sub_21D913938()
{
  return MEMORY[0x270F6BFF0]();
}

uint64_t sub_21D913948()
{
  return MEMORY[0x270F6C020]();
}

uint64_t sub_21D913958()
{
  return MEMORY[0x270F6C028]();
}

uint64_t sub_21D913968()
{
  return MEMORY[0x270F6C030]();
}

uint64_t sub_21D913978()
{
  return MEMORY[0x270F6C050]();
}

uint64_t sub_21D913988()
{
  return MEMORY[0x270F6C058]();
}

uint64_t sub_21D913998()
{
  return MEMORY[0x270F6C060]();
}

uint64_t sub_21D9139A8()
{
  return MEMORY[0x270F6C068]();
}

uint64_t sub_21D9139B8()
{
  return MEMORY[0x270F6C070]();
}

uint64_t sub_21D9139C8()
{
  return MEMORY[0x270F6C078]();
}

uint64_t sub_21D9139D8()
{
  return MEMORY[0x270F6C090]();
}

uint64_t sub_21D9139E8()
{
  return MEMORY[0x270F6C0A0]();
}

uint64_t sub_21D9139F8()
{
  return MEMORY[0x270F6C0A8]();
}

uint64_t sub_21D913A08()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_21D913A18()
{
  return MEMORY[0x270F6C818]();
}

uint64_t sub_21D913A28()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_21D913A38()
{
  return MEMORY[0x270F6C8B8]();
}

uint64_t sub_21D913A48()
{
  return MEMORY[0x270F6C8D0]();
}

uint64_t sub_21D913A58()
{
  return MEMORY[0x270F6C8F0]();
}

uint64_t sub_21D913A68()
{
  return MEMORY[0x270F6C908]();
}

uint64_t sub_21D913A78()
{
  return MEMORY[0x270F6C940]();
}

uint64_t sub_21D913A88()
{
  return MEMORY[0x270F6C9A0]();
}

uint64_t sub_21D913A98()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_21D913AA8()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_21D913AB8()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_21D913AC8()
{
  return MEMORY[0x270F6CA48]();
}

uint64_t sub_21D913AD8()
{
  return MEMORY[0x270F6CA58]();
}

uint64_t sub_21D913AE8()
{
  return MEMORY[0x270F6CCE0]();
}

uint64_t sub_21D913AF8()
{
  return MEMORY[0x270F6CCE8]();
}

uint64_t sub_21D913B08()
{
  return MEMORY[0x270F6CCF8]();
}

uint64_t sub_21D913B18()
{
  return MEMORY[0x270F6CD80]();
}

uint64_t sub_21D913B28()
{
  return MEMORY[0x270F6CE20]();
}

uint64_t sub_21D913B38()
{
  return MEMORY[0x270F6CE28]();
}

uint64_t sub_21D913B48()
{
  return MEMORY[0x270F6CE60]();
}

uint64_t sub_21D913B58()
{
  return MEMORY[0x270F6CE68]();
}

uint64_t sub_21D913B68()
{
  return MEMORY[0x270F6CF50]();
}

uint64_t sub_21D913B78()
{
  return MEMORY[0x270F6CFE8]();
}

uint64_t sub_21D913B88()
{
  return MEMORY[0x270F6D008]();
}

uint64_t sub_21D913B98()
{
  return MEMORY[0x270F6D018]();
}

uint64_t sub_21D913BA8()
{
  return MEMORY[0x270F6D0B8]();
}

uint64_t sub_21D913BB8()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_21D913BD8()
{
  return MEMORY[0x270F6D238]();
}

uint64_t sub_21D913BE8()
{
  return MEMORY[0x270F6D280]();
}

uint64_t sub_21D913BF8()
{
  return MEMORY[0x270F6D330]();
}

uint64_t sub_21D913C08()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_21D913C18()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_21D913C28()
{
  return MEMORY[0x270F6D410]();
}

uint64_t sub_21D913C38()
{
  return MEMORY[0x270F6D520]();
}

uint64_t sub_21D913C48()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_21D913C58()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_21D913C68()
{
  return MEMORY[0x270F6D540]();
}

uint64_t sub_21D913C78()
{
  return MEMORY[0x270F6D548]();
}

uint64_t sub_21D913C88()
{
  return MEMORY[0x270F6D550]();
}

uint64_t sub_21D913C98()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_21D913CA8()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_21D913CB8()
{
  return MEMORY[0x270F6D5C8]();
}

uint64_t sub_21D913CC8()
{
  return MEMORY[0x270F6D6B0]();
}

uint64_t sub_21D913CD8()
{
  return MEMORY[0x270F6D6B8]();
}

uint64_t sub_21D913CE8()
{
  return MEMORY[0x270F6D6C0]();
}

uint64_t sub_21D913CF8()
{
  return MEMORY[0x270F6D6C8]();
}

uint64_t sub_21D913D08()
{
  return MEMORY[0x270F6D6D0]();
}

uint64_t sub_21D913D18()
{
  return MEMORY[0x270F6D6D8]();
}

uint64_t sub_21D913D28()
{
  return MEMORY[0x270F6D6E0]();
}

uint64_t sub_21D913D38()
{
  return MEMORY[0x270F6D710]();
}

uint64_t sub_21D913D48()
{
  return MEMORY[0x270F6D718]();
}

uint64_t sub_21D913D58()
{
  return MEMORY[0x270F6D720]();
}

uint64_t sub_21D913D68()
{
  return MEMORY[0x270F6D728]();
}

uint64_t sub_21D913D78()
{
  return MEMORY[0x270F6D730]();
}

uint64_t sub_21D913D88()
{
  return MEMORY[0x270F6D738]();
}

uint64_t sub_21D913D98()
{
  return MEMORY[0x270F6D880]();
}

uint64_t sub_21D913DA8()
{
  return MEMORY[0x270F6D888]();
}

uint64_t sub_21D913DB8()
{
  return MEMORY[0x270F6D890]();
}

uint64_t sub_21D913DC8()
{
  return MEMORY[0x270F6D898]();
}

uint64_t sub_21D913DD8()
{
  return MEMORY[0x270F6D8A0]();
}

uint64_t sub_21D913DE8()
{
  return MEMORY[0x270F6D8A8]();
}

uint64_t sub_21D913DF8()
{
  return MEMORY[0x270F6D8B0]();
}

uint64_t sub_21D913E08()
{
  return MEMORY[0x270F6D8E0]();
}

uint64_t sub_21D913E18()
{
  return MEMORY[0x270F6D8E8]();
}

uint64_t sub_21D913E28()
{
  return MEMORY[0x270F6DAD8]();
}

uint64_t sub_21D913E38()
{
  return MEMORY[0x270F6DAE0]();
}

uint64_t sub_21D913E48()
{
  return MEMORY[0x270F6DAE8]();
}

uint64_t sub_21D913E58()
{
  return MEMORY[0x270F6DAF0]();
}

uint64_t sub_21D913E68()
{
  return MEMORY[0x270F6DAF8]();
}

uint64_t sub_21D913E78()
{
  return MEMORY[0x270F6DB00]();
}

uint64_t sub_21D913E88()
{
  return MEMORY[0x270F6DB30]();
}

uint64_t sub_21D913E98()
{
  return MEMORY[0x270F6DB38]();
}

uint64_t sub_21D913EA8()
{
  return MEMORY[0x270F6DB40]();
}

uint64_t sub_21D913EB8()
{
  return MEMORY[0x270F6DB50]();
}

uint64_t sub_21D913EC8()
{
  return MEMORY[0x270F6DB58]();
}

uint64_t sub_21D913ED8()
{
  return MEMORY[0x270F6DB60]();
}

uint64_t sub_21D913EE8()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t sub_21D913EF8()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t sub_21D913F08()
{
  return MEMORY[0x270F6DBD0]();
}

uint64_t sub_21D913F18()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_21D913F28()
{
  return MEMORY[0x270F6DC58]();
}

uint64_t sub_21D913F38()
{
  return MEMORY[0x270F6DD78]();
}

uint64_t sub_21D913F48()
{
  return MEMORY[0x270F6DD88]();
}

uint64_t sub_21D913F58()
{
  return MEMORY[0x270F6DD90]();
}

uint64_t sub_21D913F68()
{
  return MEMORY[0x270F6DE78]();
}

uint64_t sub_21D913F78()
{
  return MEMORY[0x270F6DFA8]();
}

uint64_t sub_21D913F88()
{
  return MEMORY[0x270F6DFB0]();
}

uint64_t sub_21D913F98()
{
  return MEMORY[0x270F6DFB8]();
}

uint64_t sub_21D913FA8()
{
  return MEMORY[0x270F6DFC0]();
}

uint64_t sub_21D913FB8()
{
  return MEMORY[0x270F6E068]();
}

uint64_t sub_21D913FC8()
{
  return MEMORY[0x270F6E070]();
}

uint64_t sub_21D913FD8()
{
  return MEMORY[0x270F6E078]();
}

uint64_t sub_21D913FE8()
{
  return MEMORY[0x270F6E098]();
}

uint64_t sub_21D913FF8()
{
  return MEMORY[0x270F6E210]();
}

uint64_t sub_21D914008()
{
  return MEMORY[0x270F6E218]();
}

uint64_t sub_21D914018()
{
  return MEMORY[0x270F6E220]();
}

uint64_t sub_21D914028()
{
  return MEMORY[0x270F6E228]();
}

uint64_t sub_21D914038()
{
  return MEMORY[0x270F6E230]();
}

uint64_t sub_21D914048()
{
  return MEMORY[0x270F6E238]();
}

uint64_t sub_21D914058()
{
  return MEMORY[0x270F6E268]();
}

uint64_t sub_21D914068()
{
  return MEMORY[0x270F6E270]();
}

uint64_t sub_21D914078()
{
  return MEMORY[0x270F6E280]();
}

uint64_t sub_21D914088()
{
  return MEMORY[0x270F6E288]();
}

uint64_t sub_21D914098()
{
  return MEMORY[0x270F6E290]();
}

uint64_t sub_21D9140A8()
{
  return MEMORY[0x270F6E428]();
}

uint64_t sub_21D9140B8()
{
  return MEMORY[0x270F6E430]();
}

uint64_t sub_21D9140C8()
{
  return MEMORY[0x270F6E438]();
}

uint64_t sub_21D9140D8()
{
  return MEMORY[0x270F6E458]();
}

uint64_t sub_21D9140E8()
{
  return MEMORY[0x270F6E460]();
}

uint64_t sub_21D9140F8()
{
  return MEMORY[0x270F6E468]();
}

uint64_t sub_21D914108()
{
  return MEMORY[0x270F6E470]();
}

uint64_t sub_21D914118()
{
  return MEMORY[0x270F6E478]();
}

uint64_t sub_21D914128()
{
  return MEMORY[0x270F6E480]();
}

uint64_t sub_21D914138()
{
  return MEMORY[0x270F6E490]();
}

uint64_t sub_21D914148()
{
  return MEMORY[0x270F6E498]();
}

uint64_t sub_21D914158()
{
  return MEMORY[0x270F6E5E0]();
}

uint64_t sub_21D914168()
{
  return MEMORY[0x270F6E5E8]();
}

uint64_t sub_21D914178()
{
  return MEMORY[0x270F6E5F0]();
}

uint64_t sub_21D914188()
{
  return MEMORY[0x270F6E610]();
}

uint64_t sub_21D914198()
{
  return MEMORY[0x270F6E618]();
}

uint64_t sub_21D9141A8()
{
  return MEMORY[0x270F6E620]();
}

uint64_t sub_21D9141B8()
{
  return MEMORY[0x270F6E628]();
}

uint64_t sub_21D9141C8()
{
  return MEMORY[0x270F6E630]();
}

uint64_t sub_21D9141D8()
{
  return MEMORY[0x270F6E638]();
}

uint64_t sub_21D9141E8()
{
  return MEMORY[0x270F6E640]();
}

uint64_t sub_21D9141F8()
{
  return MEMORY[0x270F6E648]();
}

uint64_t sub_21D914208()
{
  return MEMORY[0x270F6E7A0]();
}

uint64_t sub_21D914218()
{
  return MEMORY[0x270F6E7A8]();
}

uint64_t sub_21D914228()
{
  return MEMORY[0x270F6E7B0]();
}

uint64_t sub_21D914238()
{
  return MEMORY[0x270F6E7B8]();
}

uint64_t sub_21D914248()
{
  return MEMORY[0x270F6E828]();
}

uint64_t sub_21D914258()
{
  return MEMORY[0x270F6E830]();
}

uint64_t sub_21D914268()
{
  return MEMORY[0x270F6E878]();
}

uint64_t sub_21D914278()
{
  return MEMORY[0x270F6E880]();
}

uint64_t sub_21D914288()
{
  return MEMORY[0x270F6E888]();
}

uint64_t sub_21D914298()
{
  return MEMORY[0x270F6E9D0]();
}

uint64_t sub_21D9142A8()
{
  return MEMORY[0x270F6E9E0]();
}

uint64_t sub_21D9142B8()
{
  return MEMORY[0x270F6E9E8]();
}

uint64_t sub_21D9142C8()
{
  return MEMORY[0x270F6E9F8]();
}

uint64_t sub_21D9142D8()
{
  return MEMORY[0x270F6EA00]();
}

uint64_t sub_21D9142E8()
{
  return MEMORY[0x270F6EA08]();
}

uint64_t sub_21D9142F8()
{
  return MEMORY[0x270F6EA10]();
}

uint64_t sub_21D914308()
{
  return MEMORY[0x270F6EA18]();
}

uint64_t sub_21D914318()
{
  return MEMORY[0x270F6EA20]();
}

uint64_t sub_21D914328()
{
  return MEMORY[0x270F6EA28]();
}

uint64_t sub_21D914338()
{
  return MEMORY[0x270F6EA38]();
}

uint64_t sub_21D914348()
{
  return MEMORY[0x270F6EA40]();
}

uint64_t sub_21D914358()
{
  return MEMORY[0x270F6EA48]();
}

uint64_t sub_21D914368()
{
  return MEMORY[0x270F6EA50]();
}

uint64_t sub_21D914378()
{
  return MEMORY[0x270F6EA58]();
}

uint64_t sub_21D914388()
{
  return MEMORY[0x270F6EA60]();
}

uint64_t sub_21D914398()
{
  return MEMORY[0x270F6EA68]();
}

uint64_t sub_21D9143A8()
{
  return MEMORY[0x270F6EA70]();
}

uint64_t sub_21D9143B8()
{
  return MEMORY[0x270F6EA78]();
}

uint64_t sub_21D9143C8()
{
  return MEMORY[0x270F6EA80]();
}

uint64_t sub_21D9143D8()
{
  return MEMORY[0x270F6EAB0]();
}

uint64_t sub_21D9143E8()
{
  return MEMORY[0x270F6EAC0]();
}

uint64_t sub_21D9143F8()
{
  return MEMORY[0x270F6EAC8]();
}

uint64_t sub_21D914408()
{
  return MEMORY[0x270F6EBD8]();
}

uint64_t sub_21D914418()
{
  return MEMORY[0x270F6EBE0]();
}

uint64_t sub_21D914428()
{
  return MEMORY[0x270F6EBE8]();
}

uint64_t sub_21D914438()
{
  return MEMORY[0x270F6EBF0]();
}

uint64_t sub_21D914448()
{
  return MEMORY[0x270F6EBF8]();
}

uint64_t sub_21D914458()
{
  return MEMORY[0x270F6EC08]();
}

uint64_t sub_21D914468()
{
  return MEMORY[0x270F6EC10]();
}

uint64_t sub_21D914478()
{
  return MEMORY[0x270F6ECE0]();
}

uint64_t sub_21D914488()
{
  return MEMORY[0x270F6ECE8]();
}

uint64_t sub_21D914498()
{
  return MEMORY[0x270F6ECF0]();
}

uint64_t sub_21D9144A8()
{
  return MEMORY[0x270F6ECF8]();
}

uint64_t sub_21D9144B8()
{
  return MEMORY[0x270F6ED08]();
}

uint64_t sub_21D9144C8()
{
  return MEMORY[0x270F6ED10]();
}

uint64_t sub_21D9144D8()
{
  return MEMORY[0x270F6ED18]();
}

uint64_t sub_21D9144E8()
{
  return MEMORY[0x270F6ED70]();
}

uint64_t sub_21D9144F8()
{
  return MEMORY[0x270F6F428]();
}

uint64_t sub_21D914518()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_21D914528()
{
  return MEMORY[0x270F6F4C0]();
}

uint64_t sub_21D914538()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_21D914548()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t sub_21D914558()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_21D914568()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_21D914578()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_21D914588()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_21D914598()
{
  return MEMORY[0x270F72920]();
}

uint64_t sub_21D9145A8()
{
  return MEMORY[0x270F72928]();
}

uint64_t sub_21D9145B8()
{
  return MEMORY[0x270F72960]();
}

uint64_t sub_21D9145C8()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_21D9145D8()
{
  return MEMORY[0x270F72A28]();
}

uint64_t sub_21D9145F8()
{
  return MEMORY[0x270F72A78]();
}

uint64_t sub_21D914608()
{
  return MEMORY[0x270F72A80]();
}

uint64_t sub_21D914618()
{
  return MEMORY[0x270F72AF8]();
}

uint64_t sub_21D914628()
{
  return MEMORY[0x270F72BA0]();
}

uint64_t sub_21D914638()
{
  return MEMORY[0x270F72BA8]();
}

uint64_t sub_21D914648()
{
  return MEMORY[0x270F72BB0]();
}

uint64_t sub_21D914658()
{
  return MEMORY[0x270F72BB8]();
}

uint64_t sub_21D914668()
{
  return MEMORY[0x270F72BC0]();
}

uint64_t sub_21D914678()
{
  return MEMORY[0x270F72BC8]();
}

uint64_t sub_21D914688()
{
  return MEMORY[0x270F72C20]();
}

uint64_t sub_21D914698()
{
  return MEMORY[0x270F72C40]();
}

uint64_t sub_21D9146A8()
{
  return MEMORY[0x270F72C48]();
}

uint64_t sub_21D9146C8()
{
  return MEMORY[0x270F3E880]();
}

uint64_t sub_21D9146D8()
{
  return MEMORY[0x270F3E888]();
}

uint64_t sub_21D9146E8()
{
  return MEMORY[0x270F3E898]();
}

uint64_t sub_21D9146F8()
{
  return MEMORY[0x270F3E8A0]();
}

uint64_t sub_21D914708()
{
  return MEMORY[0x270F3EC98]();
}

uint64_t sub_21D914718()
{
  return MEMORY[0x270F3ECA0]();
}

uint64_t sub_21D914728()
{
  return MEMORY[0x270F3ECA8]();
}

uint64_t sub_21D914738()
{
  return MEMORY[0x270F3ED08]();
}

uint64_t sub_21D914748()
{
  return MEMORY[0x270F3ED10]();
}

uint64_t sub_21D914758()
{
  return MEMORY[0x270F70AF8]();
}

uint64_t sub_21D914768()
{
  return MEMORY[0x270F70B00]();
}

uint64_t sub_21D914778()
{
  return MEMORY[0x270F70B08]();
}

uint64_t sub_21D914788()
{
  return MEMORY[0x270F70B10]();
}

uint64_t sub_21D914798()
{
  return MEMORY[0x270F70B18]();
}

uint64_t sub_21D9147A8()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_21D9147B8()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_21D9147C8()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_21D9147D8()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_21D9147E8()
{
  return MEMORY[0x270FA1880]();
}

uint64_t sub_21D9147F8()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_21D914808()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_21D914818()
{
  return MEMORY[0x270F3EFE0]();
}

uint64_t sub_21D914828()
{
  return MEMORY[0x270F3EFF0]();
}

uint64_t sub_21D914838()
{
  return MEMORY[0x270F3EFF8]();
}

uint64_t sub_21D914848()
{
  return MEMORY[0x270F3F000]();
}

uint64_t sub_21D914858()
{
  return MEMORY[0x270F3F008]();
}

uint64_t sub_21D914868()
{
  return MEMORY[0x270F3F018]();
}

uint64_t sub_21D914878()
{
  return MEMORY[0x270F3F030]();
}

uint64_t sub_21D914888()
{
  return MEMORY[0x270F3F038]();
}

uint64_t sub_21D914898()
{
  return MEMORY[0x270F3F050]();
}

uint64_t sub_21D9148A8()
{
  return MEMORY[0x270F3F058]();
}

uint64_t sub_21D9148B8()
{
  return MEMORY[0x270F3F060]();
}

uint64_t sub_21D9148C8()
{
  return MEMORY[0x270F3F090]();
}

uint64_t sub_21D9148D8()
{
  return MEMORY[0x270F3F0A0]();
}

uint64_t sub_21D9148E8()
{
  return MEMORY[0x270F3F1D8]();
}

uint64_t sub_21D9148F8()
{
  return MEMORY[0x270F3F1E0]();
}

uint64_t sub_21D914908()
{
  return MEMORY[0x270F3F1E8]();
}

uint64_t sub_21D914918()
{
  return MEMORY[0x270F3F1F0]();
}

uint64_t sub_21D914928()
{
  return MEMORY[0x270F3F1F8]();
}

uint64_t sub_21D914938()
{
  return MEMORY[0x270F3F200]();
}

uint64_t sub_21D914948()
{
  return MEMORY[0x270F3F220]();
}

uint64_t sub_21D914958()
{
  return MEMORY[0x270F3F228]();
}

uint64_t sub_21D914968()
{
  return MEMORY[0x270F3F240]();
}

uint64_t sub_21D914978()
{
  return MEMORY[0x270F3F250]();
}

uint64_t sub_21D914988()
{
  return MEMORY[0x270F3F270]();
}

uint64_t sub_21D914998()
{
  return MEMORY[0x270F3F280]();
}

uint64_t sub_21D9149A8()
{
  return MEMORY[0x270F3F290]();
}

uint64_t sub_21D9149B8()
{
  return MEMORY[0x270F3F2A0]();
}

uint64_t sub_21D9149C8()
{
  return MEMORY[0x270F3F2B8]();
}

uint64_t sub_21D9149D8()
{
  return MEMORY[0x270F3F2C0]();
}

uint64_t sub_21D9149E8()
{
  return MEMORY[0x270F3F2D0]();
}

uint64_t sub_21D9149F8()
{
  return MEMORY[0x270F3F2E0]();
}

uint64_t sub_21D914A08()
{
  return MEMORY[0x270F3F2E8]();
}

uint64_t sub_21D914A18()
{
  return MEMORY[0x270F3F2F8]();
}

uint64_t sub_21D914A28()
{
  return MEMORY[0x270F3F300]();
}

uint64_t sub_21D914A38()
{
  return MEMORY[0x270F3F310]();
}

uint64_t sub_21D914A48()
{
  return MEMORY[0x270F3F318]();
}

uint64_t sub_21D914A58()
{
  return MEMORY[0x270F3F448]();
}

uint64_t sub_21D914A68()
{
  return MEMORY[0x270F3F450]();
}

uint64_t sub_21D914A78()
{
  return MEMORY[0x270F3F468]();
}

uint64_t sub_21D914A88()
{
  return MEMORY[0x270F3F470]();
}

uint64_t sub_21D914A98()
{
  return MEMORY[0x270F3F480]();
}

uint64_t sub_21D914AA8()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_21D914AB8()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_21D914AC8()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_21D914AD8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_21D914AE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21D914AF8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21D914B08()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21D914B18()
{
  return MEMORY[0x270F70750]();
}

uint64_t sub_21D914B28()
{
  return MEMORY[0x270F70758]();
}

uint64_t sub_21D914B38()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_21D914B48()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_21D914B58()
{
  return MEMORY[0x270F70770]();
}

uint64_t sub_21D914B68()
{
  return MEMORY[0x270F70778]();
}

uint64_t sub_21D914B78()
{
  return MEMORY[0x270F70780]();
}

uint64_t sub_21D914B88()
{
  return MEMORY[0x270F70788]();
}

uint64_t sub_21D914B98()
{
  return MEMORY[0x270F70790]();
}

uint64_t sub_21D914BA8()
{
  return MEMORY[0x270F70798]();
}

uint64_t sub_21D914BB8()
{
  return MEMORY[0x270F707A0]();
}

uint64_t sub_21D914BC8()
{
  return MEMORY[0x270F707A8]();
}

uint64_t sub_21D914BD8()
{
  return MEMORY[0x270F707B0]();
}

uint64_t sub_21D914BE8()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_21D914BF8()
{
  return MEMORY[0x270F707C8]();
}

uint64_t sub_21D914C08()
{
  return MEMORY[0x270F707D0]();
}

uint64_t sub_21D914C18()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_21D914C28()
{
  return MEMORY[0x270F707E8]();
}

uint64_t sub_21D914C38()
{
  return MEMORY[0x270F707F0]();
}

uint64_t sub_21D914C48()
{
  return MEMORY[0x270F707F8]();
}

uint64_t sub_21D914C58()
{
  return MEMORY[0x270F70800]();
}

uint64_t sub_21D914C68()
{
  return MEMORY[0x270F70808]();
}

uint64_t sub_21D914C78()
{
  return MEMORY[0x270F70810]();
}

uint64_t sub_21D914C88()
{
  return MEMORY[0x270F70818]();
}

uint64_t sub_21D914C98()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_21D914CA8()
{
  return MEMORY[0x270F70828]();
}

uint64_t sub_21D914CB8()
{
  return MEMORY[0x270F70830]();
}

uint64_t sub_21D914CC8()
{
  return MEMORY[0x270F70838]();
}

uint64_t sub_21D914CD8()
{
  return MEMORY[0x270F70840]();
}

uint64_t sub_21D914CE8()
{
  return MEMORY[0x270F70848]();
}

uint64_t sub_21D914CF8()
{
  return MEMORY[0x270F70850]();
}

uint64_t sub_21D914D08()
{
  return MEMORY[0x270F70858]();
}

uint64_t sub_21D914D18()
{
  return MEMORY[0x270F70860]();
}

uint64_t sub_21D914D28()
{
  return MEMORY[0x270F70868]();
}

uint64_t sub_21D914D38()
{
  return MEMORY[0x270F70870]();
}

uint64_t sub_21D914D48()
{
  return MEMORY[0x270F70878]();
}

uint64_t sub_21D914D58()
{
  return MEMORY[0x270F70880]();
}

uint64_t sub_21D914D68()
{
  return MEMORY[0x270F70888]();
}

uint64_t sub_21D914D78()
{
  return MEMORY[0x270F70890]();
}

uint64_t sub_21D914D88()
{
  return MEMORY[0x270F70898]();
}

uint64_t sub_21D914D98()
{
  return MEMORY[0x270F708A0]();
}

uint64_t sub_21D914DA8()
{
  return MEMORY[0x270F708A8]();
}

uint64_t sub_21D914DC8()
{
  return MEMORY[0x270F708B8]();
}

uint64_t sub_21D914DD8()
{
  return MEMORY[0x270F708C0]();
}

uint64_t sub_21D914DE8()
{
  return MEMORY[0x270F708C8]();
}

uint64_t sub_21D914DF8()
{
  return MEMORY[0x270F708D0]();
}

uint64_t sub_21D914E08()
{
  return MEMORY[0x270F708D8]();
}

uint64_t sub_21D914E18()
{
  return MEMORY[0x270F708E0]();
}

uint64_t sub_21D914E28()
{
  return MEMORY[0x270F708E8]();
}

uint64_t sub_21D914E38()
{
  return MEMORY[0x270F708F8]();
}

uint64_t sub_21D914E48()
{
  return MEMORY[0x270F70900]();
}

uint64_t sub_21D914E58()
{
  return MEMORY[0x270F70908]();
}

uint64_t sub_21D914E68()
{
  return MEMORY[0x270F70910]();
}

uint64_t sub_21D914E78()
{
  return MEMORY[0x270F70918]();
}

uint64_t sub_21D914E88()
{
  return MEMORY[0x270F70920]();
}

uint64_t sub_21D914E98()
{
  return MEMORY[0x270F70928]();
}

uint64_t sub_21D914EA8()
{
  return MEMORY[0x270F70930]();
}

uint64_t sub_21D914EB8()
{
  return MEMORY[0x270F70938]();
}

uint64_t sub_21D914EC8()
{
  return MEMORY[0x270F70940]();
}

uint64_t sub_21D914ED8()
{
  return MEMORY[0x270F70948]();
}

uint64_t sub_21D914EE8()
{
  return MEMORY[0x270F70950]();
}

uint64_t sub_21D914EF8()
{
  return MEMORY[0x270F70958]();
}

uint64_t sub_21D914F08()
{
  return MEMORY[0x270F70960]();
}

uint64_t sub_21D914F18()
{
  return MEMORY[0x270F70968]();
}

uint64_t sub_21D914F28()
{
  return MEMORY[0x270F70978]();
}

uint64_t sub_21D914F38()
{
  return MEMORY[0x270F70988]();
}

uint64_t sub_21D914F48()
{
  return MEMORY[0x270F70998]();
}

uint64_t sub_21D914F58()
{
  return MEMORY[0x270F709A0]();
}

uint64_t sub_21D914F68()
{
  return MEMORY[0x270F709C0]();
}

uint64_t sub_21D914F78()
{
  return MEMORY[0x270F709C8]();
}

uint64_t sub_21D914F88()
{
  return MEMORY[0x270F709F0]();
}

uint64_t sub_21D914F98()
{
  return MEMORY[0x270F709F8]();
}

uint64_t sub_21D914FB8()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_21D914FC8()
{
  return MEMORY[0x270F70A38]();
}

uint64_t sub_21D914FD8()
{
  return MEMORY[0x270F70A48]();
}

uint64_t sub_21D914FE8()
{
  return MEMORY[0x270F70A50]();
}

uint64_t sub_21D914FF8()
{
  return MEMORY[0x270F70A60]();
}

uint64_t sub_21D915008()
{
  return MEMORY[0x270F70A68]();
}

uint64_t sub_21D915018()
{
  return MEMORY[0x270F70A70]();
}

uint64_t sub_21D915028()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_21D915038()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_21D915048()
{
  return MEMORY[0x270F70A98]();
}

uint64_t sub_21D915058()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_21D915068()
{
  return MEMORY[0x270F70AC0]();
}

uint64_t sub_21D915078()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t sub_21D915088()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_21D915098()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21D9150A8()
{
  return MEMORY[0x270F7FE78]();
}

uint64_t sub_21D9150B8()
{
  return MEMORY[0x270F7FE90]();
}

uint64_t sub_21D9150C8()
{
  return MEMORY[0x270F7FE98]();
}

uint64_t sub_21D9150D8()
{
  return MEMORY[0x270F7FEB0]();
}

uint64_t sub_21D9150E8()
{
  return MEMORY[0x270F7FEB8]();
}

uint64_t sub_21D9150F8()
{
  return MEMORY[0x270F7FED8]();
}

uint64_t sub_21D915108()
{
  return MEMORY[0x270F7FEE0]();
}

uint64_t sub_21D915118()
{
  return MEMORY[0x270F7FEE8]();
}

uint64_t sub_21D915128()
{
  return MEMORY[0x270F7FEF0]();
}

uint64_t sub_21D915138()
{
  return MEMORY[0x270F7FF80]();
}

uint64_t sub_21D915148()
{
  return MEMORY[0x270F7FF88]();
}

uint64_t sub_21D915158()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_21D915168()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_21D915178()
{
  return MEMORY[0x270F800B8]();
}

uint64_t sub_21D915188()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_21D915198()
{
  return MEMORY[0x270F80460]();
}

uint64_t sub_21D9151A8()
{
  return MEMORY[0x270FA0968]();
}

uint64_t sub_21D9151B8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21D9151C8()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_21D9151D8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21D9151E8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_21D9151F8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21D915208()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_21D915218()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21D915228()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21D915238()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21D915248()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_21D915258()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t sub_21D915268()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_21D915278()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_21D915288()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_21D9152B8()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_21D9152C8()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_21D9152D8()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t sub_21D9152E8()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t sub_21D9152F8()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_21D915308()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21D915318()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21D915328()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_21D915338()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_21D915348()
{
  return MEMORY[0x270F9D188]();
}

uint64_t sub_21D915358()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21D915368()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_21D915378()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_21D915388()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_21D915398()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21D9153A8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21D9153B8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21D9153C8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21D9153D8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21D9153F8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_21D915418()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_21D915428()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_21D915438()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21D915448()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_21D915458()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_21D915468()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_21D915478()
{
  return MEMORY[0x270F70AD8]();
}

uint64_t sub_21D915488()
{
  return MEMORY[0x270F70AE0]();
}

uint64_t sub_21D915498()
{
  return MEMORY[0x270F70AE8]();
}

uint64_t sub_21D9154A8()
{
  return MEMORY[0x270F70AF0]();
}

uint64_t sub_21D9154B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21D9154C8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21D9154D8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_21D9154E8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_21D9154F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21D915508()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_21D915518()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_21D915528()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_21D915538()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21D915548()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_21D915558()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_21D915568()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_21D915578()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_21D915598()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_21D9155A8()
{
  return MEMORY[0x270F9D958]();
}

uint64_t sub_21D9155C8()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_21D9155D8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_21D9155E8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21D9155F8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21D915608()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21D915618()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21D915628()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21D915638()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21D915648()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_21D915658()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21D915668()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21D915678()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_21D915688()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_21D915698()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21D9156A8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_21D9156B8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21D9156C8()
{
  return MEMORY[0x270FA1EE8]();
}

uint64_t sub_21D9156D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21D9156E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21D9156F8()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_21D915708()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_21D915718()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21D915728()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_21D915738()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21D915748()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21D915758()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21D915768()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21D915778()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_21D915788()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21D915798()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_21D9157A8()
{
  return MEMORY[0x270FA0CB0]();
}

uint64_t sub_21D9157B8()
{
  return MEMORY[0x270FA0CC0]();
}

uint64_t sub_21D9157C8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21D9157D8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21D9157E8()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_21D9157F8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21D915808()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21D915818()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_21D915828()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_21D915838()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_21D915848()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_21D915858()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_21D915868()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_21D915878()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_21D915888()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_21D915898()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21D9158A8()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_21D9158C8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21D9158D8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21D9158E8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21D9158F8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_21D915908()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_21D915918()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_21D915928()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21D915938()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21D915948()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_21D915958()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_21D915968()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_21D915978()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_21D915988()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_21D915998()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_21D9159A8()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_21D9159B8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21D9159C8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21D9159D8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21D9159E8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_21D9159F8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21D915A08()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21D915A18()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21D915A28()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21D915A38()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21D915A48()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21D915A68()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21D915A78()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21D915A88()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21D915A98()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21D915AA8()
{
  return MEMORY[0x270F9ED40]();
}

uint64_t sub_21D915AB8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21D915AC8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_21D915AD8()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_21D915AE8()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_21D915AF8()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_21D915B08()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_21D915B18()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_21D915B28()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21D915B38()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21D915B48()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21D915B58()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21D915B68()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21D915B78()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21D915B88()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_21D915BA8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21D915BB8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_21D915BC8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21D915BD8()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_21D915BE8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21D915C08()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21D915C18()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_21D915C28()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21D915C48()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21D915C58()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21D915C68()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21D915C78()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21D915C88()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21D915C98()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21D915CA8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21D915CB8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_21D915CC8()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_21D915CD8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_21D915CE8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21D915CF8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21D915D08()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_21D915D18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x270F0ECD8]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x270F0EDC0]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x270F0EDE0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x270EFB8D8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t LNStructuredDataRepresentationsAsString()
{
  return MEMORY[0x270F47678]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t SISchemaUUIDReadFrom()
{
  return MEMORY[0x270F662D0]();
}

uint64_t USOSchemaUSOGraphReadFrom()
{
  return MEMORY[0x270F662D8]();
}

uint64_t USOSchemaUSOGraphTier1ReadFrom()
{
  return MEMORY[0x270F662E0]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B4C0](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x270F9B4C8](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x270F9B530](a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x270F9B538](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B540](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

void *__cdecl sqlite3_commit_hook(sqlite3 *a1, int (__cdecl *a2)(void *), void *a3)
{
  return (void *)MEMORY[0x270F9B5E0](a1, a2, a3);
}

int sqlite3_create_collation_v2(sqlite3 *a1, const char *zName, int eTextRep, void *pArg, int (__cdecl *xCompare)(void *, int, const void *, int, const void *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x270F9B5F8](a1, zName, *(void *)&eTextRep, pArg, xCompare, xDestroy);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x270F9B608](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x270F9B620](db, zDbName);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x270F9B630](db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x270F9B670](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_interrupt(sqlite3 *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

void *__cdecl sqlite3_rollback_hook(sqlite3 *a1, void (__cdecl *a2)(void *), void *a3)
{
  return (void *)MEMORY[0x270F9B7A8](a1, a2, a3);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x270F9B7F8](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_total_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B838](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x270F9B840](a1, *(void *)&uMask, xCallback, pCtx);
}

void *__cdecl sqlite3_update_hook(sqlite3 *a1, void (__cdecl *a2)(void *, int, const char *, const char *, sqlite3_int64), void *a3)
{
  return (void *)MEMORY[0x270F9B850](a1, a2, a3);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x270F9B868](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x270F9B870](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x270F9B878](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x270F9B888](a1);
  return result;
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8A8](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B8C0](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8D0](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}