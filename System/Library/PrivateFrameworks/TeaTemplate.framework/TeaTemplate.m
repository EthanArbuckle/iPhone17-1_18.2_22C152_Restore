unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0Tm(uint64_t *a1)
{
  OUTLINED_FUNCTION_7_6();
  if ((*(unsigned char *)(v2 + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v3;
  }
  return a1;
}

void OUTLINED_FUNCTION_16()
{
  sub_1BF8A10C8();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_16_2()
{
  sub_1BF8A515C();
}

uint64_t OUTLINED_FUNCTION_16_3(long long *a1, uint64_t a2)
{
  uint64_t result = sub_1BF8985E0(a1, a2);
  *(void *)(v2 + 56) = v3;
  return result;
}

double OUTLINED_FUNCTION_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  *(void *)(v1 - 72) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_beginAccess();
}

double OUTLINED_FUNCTION_5_6(double a1, double a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return v0;
}

double OUTLINED_FUNCTION_5_8()
{
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  *(void *)&double result = (unint64_t)CGRectIntegral(*(CGRect *)&v5);
  return result;
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return v0 - 96;
}

__n128 OUTLINED_FUNCTION_5_10()
{
  return v0[1];
}

uint64_t OUTLINED_FUNCTION_5_11(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  return sub_1BF8CBE78();
}

uint64_t OUTLINED_FUNCTION_5_13()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_0(void *a1)
{
  *(void *)(v1 + 40) = *a1;
  *(unsigned char *)(v2 - 1) = 1;
  return v2 - 1;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  *(void *)(v1 - 72) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return v0;
}

void OUTLINED_FUNCTION_1_5(void *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return swift_beginAccess();
}

double OUTLINED_FUNCTION_8_0()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetHeight(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return swift_bridgeObjectRelease_n();
}

double OUTLINED_FUNCTION_1_15()
{
  return *(double *)(v0 - 296);
}

id OUTLINED_FUNCTION_1_16(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  return sub_1BF8ADA78(v4, v5, v3);
}

_OWORD *OUTLINED_FUNCTION_1_17()
{
  *(void *)(v3 + 8 * (v1 >> 6) + 64) |= 1 << v1;
  uint64_t v5 = (void *)(*(void *)(v3 + 48) + 16 * v1);
  *uint64_t v5 = v0;
  v5[1] = v2;
  return sub_1BF8AA094((_OWORD *)(v4 - 224), (_OWORD *)(*(void *)(v3 + 56) + 32 * v1));
}

uint64_t OUTLINED_FUNCTION_1_19()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_1_23()
{
  return swift_beginAccess();
}

__n128 *OUTLINED_FUNCTION_1_25(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = v2;
  result[2].n128_u8[8] = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_27@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v6;
  *(unsigned char *)(a1 + 80) = v2;
  *(void *)(a1 + 88) = v3;
  *(void *)(a1 + 96) = v1;
  *(void *)(a1 + 104) = v4;
  return swift_release();
}

unint64_t OUTLINED_FUNCTION_1_28()
{
  return sub_1BF898570();
}

void OUTLINED_FUNCTION_1_29(uint64_t a1@<X8>)
{
  *(void *)(v1 - 72) = a1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_1BF8CC048();
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t result)
{
  *v1 |= result;
  return result;
}

__n128 OUTLINED_FUNCTION_0_5()
{
  unsigned __int8 v2 = v0[1].n128_u8[0];
  __n128 result = *v0;
  *(__n128 *)(v1 - 48) = *v0;
  *(unsigned char *)(v1 - 32) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return sub_1BF8CBAC8();
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return *(void *)(v0 - 176);
}

double OUTLINED_FUNCTION_0_10()
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = v1;
  uint64_t v6 = v2;
  return CGRectGetWidth(*(CGRect *)&v3);
}

char *OUTLINED_FUNCTION_0_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  return &a12;
}

void OUTLINED_FUNCTION_0_12()
{
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 96) = 0;
  *(unsigned char *)(v0 + 120) = 0;
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return sub_1BF89DE20(v4, v3, v2, v1);
}

double OUTLINED_FUNCTION_0_14()
{
  return DimensionCursor.origin.getter();
}

unint64_t OUTLINED_FUNCTION_0_15@<X0>(unint64_t result@<X0>, unint64_t *a2@<X8>)
{
  *a2 = result;
  return sub_1BF89EDBC(result);
}

double OUTLINED_FUNCTION_7()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetWidth(*(CGRect *)&v5);
}

void *OUTLINED_FUNCTION_0_16@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return type metadata accessor for DimensionCursor();
}

void OUTLINED_FUNCTION_0_18()
{
  *(void *)(v2 - 264) = v1;
  *(void *)(v2 - 256) = v0;
  *(void *)(v2 - 248) = v4;
  *(void *)(v2 - 240) = v3;
}

double OUTLINED_FUNCTION_0_19()
{
  return v0;
}

void OUTLINED_FUNCTION_0_20(char *a1@<X8>)
{
  char v4 = *a1;
  char v5 = a1[1];
  *(unsigned char *)(v2 + 48) = v4;
  *(unsigned char *)(v2 + 49) = v5;
  *(void *)(v1 + 16) = v2;
  sub_1BF8A515C();
}

uint64_t OUTLINED_FUNCTION_0_21()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_0_25(char *a1@<X8>)
{
  char v4 = *a1;
  char v5 = a1[1];
  *(unsigned char *)(v2 + 48) = v4;
  *(unsigned char *)(v2 + 49) = v5;
  *(void *)(v1 + 16) = v2;
  sub_1BF8A515C();
}

double OUTLINED_FUNCTION_0_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_27()
{
  return type metadata accessor for DimensionCursor();
}

uint64_t OUTLINED_FUNCTION_0_30(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  a1.n128_u64[0] = v10;
  a2.n128_u64[0] = v9;
  a3.n128_u64[0] = v8;
  a4.n128_u64[0] = v7;
  return sub_1BF8B7E9C(v5, v4, a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_0_31(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(unsigned char *)(a2 + 48) = 2;
  return swift_willThrow();
}

id OUTLINED_FUNCTION_0_32(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0.0, 0.0, 0.0, 0.0);
}

void OUTLINED_FUNCTION_0_34(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  sub_1BF8A515C();
}

uint64_t OUTLINED_FUNCTION_0_38()
{
  return type metadata accessor for Sizing();
}

uint64_t OUTLINED_FUNCTION_0_40()
{
  return sub_1BF8CBF48();
}

uint64_t OUTLINED_FUNCTION_0_42()
{
  return v0;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

double OUTLINED_FUNCTION_2_1()
{
  return v0;
}

double OUTLINED_FUNCTION_2_2()
{
  uint64_t v5 = v1;
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  return CGRectGetWidth(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_1BF8CC078();
}

void *OUTLINED_FUNCTION_2_4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char __src)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v12 + 16);
  *(unsigned char *)(a1 + 32) = v13 & 1;
  *(void *)(a1 + 40) = v14;
  v16 = (void *)(a1 + 48);
  return memcpy(v16, &__src, 0x42uLL);
}

void OUTLINED_FUNCTION_2_5()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_2_6@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  v3[8] = result;
  v3[9] = a2;
  v3[5] = v5;
  v3[10] = v4;
  v3[11] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_9@<X0>(uint64_t a1@<X8>)
{
  *uint64_t v1 = a1;
  sub_1BF89EDD0(v2);
  return v3;
}

double OUTLINED_FUNCTION_2_10()
{
  return v0;
}

double OUTLINED_FUNCTION_2_12()
{
  return *(double *)(v0 - 344);
}

double OUTLINED_FUNCTION_2_13()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMaxX(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  return v0;
}

double OUTLINED_FUNCTION_2_15()
{
  return v0;
}

id OUTLINED_FUNCTION_2_16(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  return sub_1BF8AC988(v4, v5, v3);
}

unint64_t OUTLINED_FUNCTION_2_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8999E0(a2, a3);
}

void OUTLINED_FUNCTION_2_19()
{
  char v1 = v0[271];
  v0[254] = v0[270];
  v0[255] = v1;
}

id OUTLINED_FUNCTION_2_20()
{
  return [v0 (SEL)(v1 + 2072)];
}

uint64_t OUTLINED_FUNCTION_2_22()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  *(unsigned char *)(v0 - 81) = 8;
  return sub_1BF8C188C((char *)(v0 - 81), 0, 0);
}

void OUTLINED_FUNCTION_2_25(uint64_t a1@<X8>)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v5 = v1 + 80 * v4;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
}

void OUTLINED_FUNCTION_2_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_1BF8C2410(a1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_2_27()
{
  return 0x656C616373202B20;
}

uint64_t OUTLINED_FUNCTION_2_28()
{
  return sub_1BF8CBD98();
}

void OUTLINED_FUNCTION_4()
{
  *(void *)(v2 - 168) = *(void *)(v2 - 320);
  *(void *)(v2 - 160) = v0;
  *(void *)(v2 - 192) = v1;
}

void OUTLINED_FUNCTION_4_0(char a1)
{
  char v2 = a1 & 1;
  sub_1BF8A9020(v2);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_allocObject();
}

double OUTLINED_FUNCTION_4_8()
{
  uint64_t v6 = v0[58];
  uint64_t v7 = v0[59];
  uint64_t v8 = v0[56];
  uint64_t v9 = v0[57];
  uint64_t v10 = v5;
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  uint64_t v13 = v2;
  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v8, *(CGRect *)&v10);
  return result;
}

char *OUTLINED_FUNCTION_4_9()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_1BF8A14A0(0, v2, 1, (char *)v0);
}

double OUTLINED_FUNCTION_4_10()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMinY(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_4_11(uint64_t a1)
{
  return MEMORY[0x1F41864C8](v1, a1, 0, 0, 0);
}

double OUTLINED_FUNCTION_4_12()
{
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMinY(*(CGRect *)&v5);
}

__n128 OUTLINED_FUNCTION_4_15()
{
  return v0[1];
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  return sub_1BF8CBAC8();
}

void OUTLINED_FUNCTION_4_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_1BF8C2410(v5, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_4_20(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_allocObject();
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

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_release();
}

double OUTLINED_FUNCTION_9_0()
{
  return v0;
}

double OUTLINED_FUNCTION_9_1(CGRect rect)
{
  return CGRectGetMaxX(rect);
}

double OUTLINED_FUNCTION_9_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return type metadata accessor for Prop();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return 0x7265746E656368;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void OUTLINED_FUNCTION_8_1()
{
  sub_1BF8B04B0();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return 0x676E696461656CLL;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  *(void *)(v1 - 72) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_beginAccess();
}

double OUTLINED_FUNCTION_7_4()
{
  return v0;
}

void OUTLINED_FUNCTION_7_5()
{
  *(void *)(v1 + 16) = v0;
  uint64_t v5 = v1 + v3 * v2;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 48) = 0;
  *(void *)(v5 + 56) = 0;
  *(void *)(v5 + 40) = 0;
  *(unsigned char *)(v5 + 64) = 0;
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return sub_1BF8CBE78();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  return 0x676E696C69617274;
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return swift_allocError();
}

unint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_1BF8999E0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return 0;
}

void OUTLINED_FUNCTION_10_6(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t OUTLINED_FUNCTION_10_7(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

void *OUTLINED_FUNCTION_3_3(__n128 *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __n128 a9, uint64_t a10, uint64_t a11, uint64_t a12, char __src)
{
  a1[1] = a9;
  uint64_t v14 = a1 + 2;
  return memcpy(v14, &__src, 0x42uLL);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

double OUTLINED_FUNCTION_3_7(unint64_t *a1, double a2)
{
  return sub_1BF89EAEC(a1, a2, v4, v3);
}

char *OUTLINED_FUNCTION_3_8@<X0>(unint64_t a1@<X8>)
{
  return sub_1BF8A14A0((char *)(a1 > 1), v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return type metadata accessor for Dynamic.State();
}

double OUTLINED_FUNCTION_3_11()
{
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMinX(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_3_12@<X0>(char *a1@<X8>)
{
  char v3 = *a1;
  char v4 = a1[1];
  *(unsigned char *)(v1 + 48) = v3;
  *(unsigned char *)(v1 + 49) = v4;
  return v2;
}

unint64_t OUTLINED_FUNCTION_3_13()
{
  *(void *)(v3 - 336) = v2;
  return sub_1BF8999E0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return swift_getAssociatedConformanceWitness();
}

double OUTLINED_FUNCTION_3_16()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_3_17()
{
  return v0;
}

double OUTLINED_FUNCTION_3_19@<D0>(uint64_t a1@<X8>)
{
  return *(double *)((a1 & 0xFFFFFFFFFFFFFFBLL) + 0x10);
}

void OUTLINED_FUNCTION_3_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_1BF8C2410(v5, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_3_21()
{
  return sub_1BF8CBF48();
}

void OUTLINED_FUNCTION_3_22(uint64_t a1@<X8>)
{
  v1[70] = v1[28];
  v1[71] = a1;
  v1[67] = v2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

double OUTLINED_FUNCTION_6()
{
  uint64_t v5 = v1;
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  return CGRectGetHeight(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

double OUTLINED_FUNCTION_6_6()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMaxY(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return v0;
}

void OUTLINED_FUNCTION_6_8()
{
  *(void *)(v0 + 16) = v1;
  uint64_t v6 = v0 + v4 * v2;
  *(void *)(v6 + 32) = v5;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 56) = 0;
  *(void *)(v6 + 40) = 0;
  *(unsigned char *)(v6 + 64) = v3;
}

uint64_t OUTLINED_FUNCTION_6_10@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return sub_1BF8CBDA8();
}

uint64_t OUTLINED_FUNCTION_6_12()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_1BF8CBF68();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

void OUTLINED_FUNCTION_13_3(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  v3[3] = v1;
  v3[4] = v2;
  *char v3 = v4;
}

void OUTLINED_FUNCTION_13_4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

void OUTLINED_FUNCTION_11(char a1)
{
  char v2 = a1 & 1;
  sub_1BF8A9020(v2);
}

double OUTLINED_FUNCTION_11_0()
{
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetHeight(*(CGRect *)&v5);
}

double OUTLINED_FUNCTION_11_3()
{
  return v0;
}

id OUTLINED_FUNCTION_11_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)((a1 & 0xFFFFFFFFFFFFFFBLL) + 0x10);
  return v2;
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return 0x7265746E6563;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return 0;
}

void OUTLINED_FUNCTION_17_2(uint64_t a1@<X8>)
{
  v3[3] = v1;
  v3[4] = v2;
  *uint64_t v3 = a1;
  v3[1] = 0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0 & 1;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_1BF8CBF68();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return type metadata accessor for AnchorSizer();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void OUTLINED_FUNCTION_18()
{
  sub_1BF8A10C8();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_1BF8CBE78();
}

void OUTLINED_FUNCTION_18_3(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void OUTLINED_FUNCTION_19()
{
  sub_1BF8A10C8();
}

unint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_1BF8999E0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return 0;
}

__n128 *OUTLINED_FUNCTION_19_2(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = v2;
  result[2].n128_u8[8] = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_20()
{
  sub_1BF8A10C8();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return sub_1BF8CC048();
}

double OUTLINED_FUNCTION_12()
{
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetWidth(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

__n128 OUTLINED_FUNCTION_12_1()
{
  return v0[1];
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return type metadata accessor for FontSizer();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *__swift_memcpy200_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t objectdestroy_6Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t objectdestroyTm()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 216, 7);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

BOOL static ColumnLayoutSize.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ColumnLayoutSize.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t ColumnLayoutSize.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF88B930()
{
  return sub_1BF8CC1D8();
}

uint64_t ColumnLayoutSize.description.getter()
{
  if (*v0) {
    return 0x6C6C616D53;
  }
  else {
    return 0x656772614CLL;
  }
}

unint64_t sub_1BF88B9A4()
{
  unint64_t result = qword_1EA1700C0;
  if (!qword_1EA1700C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1700C0);
  }
  return result;
}

uint64_t sub_1BF88B9F0()
{
  return ColumnLayoutSize.description.getter();
}

uint64_t getEnumTagSinglePayload for ColumnLayoutSize(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ColumnLayoutSize(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF88BB60);
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

uint64_t sub_1BF88BB88(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1BF88BB94(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ColumnLayoutSize()
{
  return &type metadata for ColumnLayoutSize;
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceLayoutDirection(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for RectDimension(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RectDimension(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIRectCorner(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for LayoutOptions(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BF88BCA8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF88BCC8(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceSizeClass(uint64_t a1)
{
}

uint64_t sub_1BF88BD30(uint64_t a1, id *a2)
{
  return sub_1BF88C64C(a1, a2);
}

uint64_t sub_1BF88BD48(uint64_t a1, id *a2)
{
  return sub_1BF88C6C4(a1, a2) & 1;
}

uint64_t sub_1BF88BD64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BF88C5F0();
  *a1 = result;
  return result;
}

BOOL sub_1BF88BD8C(uint64_t *a1)
{
  return sub_1BF88C77C(*a1, *v1);
}

uint64_t sub_1BF88BD98@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF88C788(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BF88BDC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF88EC34(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BF88BDF8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF88C634(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1BF88BE28(void *a1, uint64_t *a2)
{
  return sub_1BF88C5F8(a1, *a2);
}

uint64_t sub_1BF88BE30@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BF88C790(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BF88BE64@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BF88C7E4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BF88BE98(uint64_t *a1)
{
  return OUTLINED_FUNCTION_0_3(*a1);
}

uint64_t sub_1BF88BEA0(uint64_t *a1)
{
  return OUTLINED_FUNCTION_3(*a1);
}

uint64_t sub_1BF88BEA8(uint64_t *a1)
{
  return sub_1BF88C624(*a1);
}

uint64_t sub_1BF88BEB0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF88C820(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1BF88BEE0(uint64_t *a1)
{
  return sub_1BF88C5E4(*a1, *v1);
}

uint64_t sub_1BF88BEEC()
{
  return sub_1BF88C828();
}

uint64_t sub_1BF88BEF8()
{
  return sub_1BF8CBCF8();
}

uint64_t sub_1BF88BF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

uint64_t sub_1BF88BF18(uint64_t *a1)
{
  return sub_1BF88C63C(*a1);
}

void *sub_1BF88BF20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_1BF88BF2C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1BF88BF3C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1BF88BF48()
{
  return sub_1BF88C830(*v0, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1BF88BF78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BF88C744();
  *a1 = result;
  return result;
}

uint64_t sub_1BF88BFA0()
{
  return sub_1BF88C830(*v0, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1BF88BFD0()
{
  return sub_1BF88C494();
}

uint64_t sub_1BF88BFEC()
{
  return sub_1BF88C4E8();
}

BOOL sub_1BF88C008(uint64_t *a1, uint64_t *a2)
{
  return sub_1BF88EC28(*a1, *a2);
}

uint64_t sub_1BF88C014@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BF88C870(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1BF88C03C()
{
  return sub_1BF88C0CC(&qword_1EA1700F0, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BF88C084()
{
  return sub_1BF88C0CC(&qword_1EA1700F8, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BF88C0CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BF88C114()
{
  return sub_1BF88C0CC(&qword_1EA170100, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BF88C15C()
{
  return sub_1BF88C0CC(&qword_1EA170108, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BF88C1A4()
{
  return sub_1BF88C55C() & 1;
}

uint64_t sub_1BF88C1CC(uint64_t a1)
{
  uint64_t v2 = sub_1BF88C0CC(&qword_1EA170128, type metadata accessor for UIContentSizeCategory);
  uint64_t v3 = sub_1BF88C0CC(&qword_1EA170130, type metadata accessor for UIContentSizeCategory);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1BF88C288()
{
  return sub_1BF88C0CC(&qword_1EA170110, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1BF88C2D0()
{
  return sub_1BF88C0CC(&qword_1EA170118, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1BF88C318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BF8CBA78();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BF88C360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BF88C38C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1BF88C390(uint64_t a1)
{
  uint64_t v2 = sub_1BF88C0CC((unint64_t *)&qword_1EBA90250, type metadata accessor for Key);
  uint64_t v3 = sub_1BF88C0CC(&qword_1EA170148, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1BF88C44C()
{
  return sub_1BF88C0CC(&qword_1EA170120, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1BF88C494()
{
  sub_1BF8CBAA8();
  sub_1BF8CBAB8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF88C4E8()
{
  sub_1BF8CBAA8();
  sub_1BF8CC1A8();
  sub_1BF8CBAB8();
  uint64_t v0 = sub_1BF8CC1D8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF88C55C()
{
  uint64_t v0 = sub_1BF8CBAA8();
  uint64_t v2 = v1;
  if (v0 == sub_1BF8CBAA8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BF8CC078();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_1BF88C5E4(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

uint64_t sub_1BF88C5F0()
{
  return 0;
}

BOOL sub_1BF88C5F8(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1BF88C624(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_1BF88C634(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_1BF88C63C(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

uint64_t sub_1BF88C64C(uint64_t a1, id *a2)
{
  uint64_t result = sub_1BF8CBA88();
  *a2 = 0;
  return result;
}

uint64_t sub_1BF88C6C4(uint64_t a1, id *a2)
{
  char v3 = sub_1BF8CBA98();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BF88C744()
{
  sub_1BF8CBAA8();
  uint64_t v0 = sub_1BF8CBA78();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_1BF88C77C(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_1BF88C788(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_1BF88C790(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 & a1;
  if (sub_1BF8CBCF8()) {
    return 0;
  }
  *uint64_t v1 = v3 & ~a1;
  return v4;
}

uint64_t sub_1BF88C7E4(uint64_t a1)
{
  uint64_t v2 = *v1 & a1;
  *v1 |= a1;
  if (sub_1BF8CBCF8()) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t sub_1BF88C820(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

uint64_t sub_1BF88C828()
{
  return sub_1BF8CBCF8();
}

uint64_t sub_1BF88C830(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_1BF8CBAA8();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1BF88C870(uint64_t a1)
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

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_1BF88C8D8()
{
  return sub_1BF88C0CC(&qword_1EA170138, type metadata accessor for Key);
}

uint64_t sub_1BF88C920()
{
  return sub_1BF88C0CC(&qword_1EA170140, type metadata accessor for Key);
}

uint64_t sub_1BF88C968()
{
  return sub_1BF88C0CC(&qword_1EBA90258, type metadata accessor for Key);
}

void type metadata accessor for CTLine(uint64_t a1)
{
}

void sub_1BF88C9C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1BF88CA3C(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t StackBuilder.layer(block:)(void (*a1)(void))
{
  type metadata accessor for ListBuilder();
  uint64_t v3 = sub_1BF8C4A38();
  a1();
  if (!v1)
  {
    type metadata accessor for StackLayer();
    swift_beginAccess();
    sub_1BF88CA3C(*(void *)(v3 + 16));
    swift_bridgeObjectRetain();
    sub_1BF8ACCA4();
    swift_release();
  }
  return swift_release();
}

uint64_t StackBuilder.deinit()
{
  swift_release();
  return v0;
}

uint64_t StackBuilder.__deallocating_deinit()
{
  StackBuilder.deinit();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BF88CBDC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for StackBuilder()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for StackBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StackBuilder);
}

double LayoutOptions.boundingSize.getter()
{
  return *(double *)v0;
}

double LayoutOptions.viewportSize.getter()
{
  return *(double *)(v0 + 16);
}

double LayoutOptions.visibleViewportSize.getter()
{
  return *(double *)(v0 + 32);
}

double LayoutOptions.windowSize.getter()
{
  return *(double *)(v0 + 48);
}

double LayoutOptions.screenNativeSize.getter()
{
  return *(double *)(v0 + 64);
}

id LayoutOptions.traitCollection.getter()
{
  return *(id *)(v0 + 80);
}

double LayoutOptions.layoutMargins.getter()
{
  return *(double *)(v0 + 88);
}

double LayoutOptions.origin.getter()
{
  return *(double *)(v0 + 120);
}

uint64_t LayoutOptions.layoutDirection.getter()
{
  return *(void *)(v0 + 136);
}

id LayoutOptions.contentSizeCategory.getter()
{
  return *(id *)(v0 + 144);
}

double LayoutOptions.safeAreaInsets.getter()
{
  return *(double *)(v0 + 152);
}

void LayoutOptions.contentResizeScale.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 184);
}

uint64_t LayoutOptions.layoutMarginAdjuster.getter()
{
  return swift_retain();
}

double LayoutOptions.scale.getter()
{
  uint64_t v1 = *(void **)(v0 + 80);
  objc_msgSend(v1, sel_displayScale);
  if (v2 <= 0.0) {
    return 1.0;
  }
  objc_msgSend(v1, sel_displayScale);
  return result;
}

double LayoutOptions.init(boundingSize:viewportSize:visibleViewportSize:windowSize:screenNativeSize:traitCollection:layoutMargins:origin:layoutDirection:contentSizeCategory:safeAreaInsets:contentResizeScale:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>, double a10@<D4>, double a11@<D5>, double a12@<D6>, double a13@<D7>, uint64_t a14, uint64_t a15, long long a16, long long a17, uint64_t a18, uint64_t a19, long long a20,uint64_t a21,double a22)
{
  char v31 = *a4;
  uint64_t v39 = 0xF000000000000007;
  unint64_t v40 = 0xF000000000000007;
  uint64_t v37 = 0xF000000000000007;
  uint64_t v38 = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  swift_allocObject();
  v32 = LayoutMarginAdjuster.init(top:left:bottom:right:)(&v40, &v39, &v38, &v37);
  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(double *)(a5 + 16) = a8;
  *(double *)(a5 + 24) = a9;
  *(double *)(a5 + 32) = a10;
  *(double *)(a5 + 40) = a11;
  *(double *)(a5 + 48) = a12;
  *(double *)(a5 + 56) = a13;
  *(void *)(a5 + 64) = a14;
  *(void *)(a5 + 72) = a15;
  *(void *)(a5 + 80) = a1;
  *(_OWORD *)(a5 + 88) = a16;
  *(_OWORD *)(a5 + 104) = a17;
  *(void *)(a5 + 120) = a18;
  *(void *)(a5 + 128) = a19;
  *(void *)(a5 + 136) = a2;
  *(void *)(a5 + 144) = a3;
  *(_OWORD *)(a5 + 152) = a20;
  *(void *)(a5 + 168) = a21;
  double result = a22;
  *(double *)(a5 + 176) = a22;
  *(unsigned char *)(a5 + 184) = v31;
  *(void *)(a5 + 192) = v32;
  return result;
}

uint64_t LayoutOptions.init(boundingSize:viewportSize:visibleViewportSize:windowSize:screenNativeSize:traitCollection:layoutMargins:origin:layoutDirection:contentSizeCategory:safeAreaInsets:contentResizeScale:layoutMarginAdjuster:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>, double a9@<D2>, double a10@<D3>, double a11@<D4>, double a12@<D5>, double a13@<D6>, double a14@<D7>, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19, uint64_t a20,long long a21,uint64_t a22,uint64_t a23)
{
  char v23 = *a4;
  *(double *)a6 = a7;
  *(double *)(a6 + 8) = a8;
  *(double *)(a6 + 16) = a9;
  *(double *)(a6 + 24) = a10;
  *(double *)(a6 + 32) = a11;
  *(double *)(a6 + 40) = a12;
  *(double *)(a6 + 48) = a13;
  *(double *)(a6 + 56) = a14;
  *(void *)(a6 + 64) = a15;
  *(void *)(a6 + 72) = a16;
  *(void *)(a6 + 80) = result;
  *(_OWORD *)(a6 + 88) = a17;
  *(_OWORD *)(a6 + 104) = a18;
  *(void *)(a6 + 120) = a19;
  *(void *)(a6 + 128) = a20;
  *(void *)(a6 + 136) = a2;
  *(void *)(a6 + 144) = a3;
  *(_OWORD *)(a6 + 152) = a21;
  *(void *)(a6 + 168) = a22;
  *(void *)(a6 + 176) = a23;
  *(unsigned char *)(a6 + 184) = v23;
  *(void *)(a6 + 192) = a5;
  return result;
}

id LayoutOptions.makeCopy(layoutDirection:origin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  long long v24 = v4[1];
  long long v25 = *v4;
  long long v22 = v4[3];
  long long v23 = v4[2];
  uint64_t v9 = *((void *)v4 + 8);
  uint64_t v10 = *((void *)v4 + 9);
  uint64_t v11 = (void *)*((void *)v4 + 10);
  long long v21 = *(long long *)((char *)v4 + 88);
  uint64_t v12 = *((void *)v4 + 13);
  uint64_t v13 = *((void *)v4 + 14);
  uint64_t v14 = (void *)*((void *)v4 + 18);
  long long v26 = *(long long *)((char *)v4 + 152);
  uint64_t v15 = *((void *)v4 + 21);
  uint64_t v16 = *((void *)v4 + 22);
  char v17 = *((unsigned char *)v4 + 184);
  unint64_t v31 = 0xF000000000000007;
  uint64_t v29 = 0xF000000000000007;
  uint64_t v30 = 0xF000000000000007;
  id v27 = v14;
  uint64_t v28 = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  swift_allocObject();
  v18 = LayoutMarginAdjuster.init(top:left:bottom:right:)(&v31, &v30, &v29, &v28);
  *(_OWORD *)a2 = v25;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = v23;
  *(_OWORD *)(a2 + 48) = v22;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v11;
  *(_OWORD *)(a2 + 88) = v21;
  *(void *)(a2 + 104) = v12;
  *(void *)(a2 + 112) = v13;
  *(double *)(a2 + 120) = a3;
  *(double *)(a2 + 128) = a4;
  *(void *)(a2 + 136) = a1;
  *(void *)(a2 + 144) = v27;
  *(_OWORD *)(a2 + 152) = v26;
  *(void *)(a2 + 168) = v15;
  *(void *)(a2 + 176) = v16;
  *(unsigned char *)(a2 + 184) = v17;
  *(void *)(a2 + 192) = v18;
  id v19 = v11;
  return v27;
}

uint64_t LayoutOptions.makeCopy(layoutDirection:origin:layoutMarginAdjuster:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  unsigned int v6 = *(void **)(v5 + 80);
  BOOL v7 = *(void **)(v5 + 144);
  char v8 = *(unsigned char *)(v5 + 184);
  long long v9 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)a3 = *(_OWORD *)v5;
  *(_OWORD *)(a3 + 16) = v9;
  long long v10 = *(_OWORD *)(v5 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v5 + 32);
  *(_OWORD *)(a3 + 48) = v10;
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(v5 + 64);
  *(void *)(a3 + 80) = v6;
  *(_OWORD *)(a3 + 88) = *(_OWORD *)(v5 + 88);
  *(_OWORD *)(a3 + 104) = *(_OWORD *)(v5 + 104);
  *(double *)(a3 + 120) = a4;
  *(double *)(a3 + 128) = a5;
  *(void *)(a3 + 136) = a1;
  *(void *)(a3 + 144) = v7;
  *(_OWORD *)(a3 + 152) = *(_OWORD *)(v5 + 152);
  *(_OWORD *)(a3 + 168) = *(_OWORD *)(v5 + 168);
  *(unsigned char *)(a3 + 184) = v8;
  *(void *)(a3 + 192) = a2;
  id v11 = v6;
  id v12 = v7;
  return swift_retain();
}

uint64_t destroy for LayoutOptions(uint64_t a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for LayoutOptions(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  unsigned int v6 = *(void **)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  id v7 = v5;
  id v8 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for LayoutOptions(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v4 = *(void **)(a2 + 80);
  uint64_t v5 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v4;
  id v6 = v4;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  id v7 = *(void **)(a2 + 144);
  id v8 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = v7;
  id v9 = v7;

  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for LayoutOptions(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  id v6 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  uint64_t v7 = *(void *)(a2 + 144);
  id v8 = *(void **)(a1 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v7;

  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutOptions(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 200))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 80);
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

uint64_t storeEnumTagSinglePayload for LayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutOptions()
{
  return &type metadata for LayoutOptions;
}

uint64_t DimensionSizerTrait.hash(into:)()
{
  if (*(unsigned char *)(v0 + 8) == 1) {
    return sub_1BF8CC1B8();
  }
  sub_1BF8CC1B8();
  return sub_1BF8CC1C8();
}

uint64_t static DimensionSizerTrait.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  unsigned int v4 = *(unsigned __int8 *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8) != 1) {
    return (v4 & 1) == 0 && v2 == v3;
  }
  BOOL v5 = *(void *)&v3 == 0;
  if (v3 == 0.0) {
    unsigned int v6 = *(unsigned __int8 *)(a2 + 8);
  }
  else {
    unsigned int v6 = 0;
  }
  if (v5) {
    unsigned int v4 = 0;
  }
  if (v2 == 0.0) {
    return v6;
  }
  else {
    return v4;
  }
}

uint64_t DimensionSizerTrait.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1BF8CC1A8();
  sub_1BF8CC1B8();
  if (v1 != 1) {
    sub_1BF8CC1C8();
  }
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF88D558()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1BF8CC1A8();
  sub_1BF8CC1B8();
  if (v1 != 1) {
    sub_1BF8CC1C8();
  }
  return sub_1BF8CC1D8();
}

unint64_t sub_1BF88D5D8()
{
  unint64_t result = qword_1EA170150;
  if (!qword_1EA170150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170150);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DimensionSizerTrait(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DimensionSizerTrait(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1BF88D678(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF88D694(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for DimensionSizerTrait()
{
  return &type metadata for DimensionSizerTrait;
}

uint64_t dispatch thunk of DimensionSizerType.traits.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DimensionSizerType.frameDimension<A>(cursor:template:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t sub_1BF88D700()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1BF88D710()
{
  return sub_1BF88D700();
}

uint64_t sub_1BF88D718()
{
  return sub_1BF88D700();
}

uint64_t sub_1BF88D720()
{
  return sub_1BF88D700();
}

uint64_t Space.__allocating_init(_:)(void *a1)
{
  return Space.init(_:)(a1);
}

uint64_t Space.init(_:)(void *a1)
{
  int v1 = (unsigned char *)OUTLINED_FUNCTION_1_0(a1);
  return Node.init(kind:identifier:)(v1, 0, 0);
}

uint64_t Space.__allocating_init(sizing:name:)(void *a1)
{
  return Space.init(sizing:name:)(a1);
}

uint64_t Space.init(sizing:name:)(void *a1)
{
  int v1 = (unsigned char *)OUTLINED_FUNCTION_1_0(a1);
  return Node.init(kind:identifier:)(v1, v2, v3);
}

void *sub_1BF88D80C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = *v4;
  uint64_t v22 = v4[5];
  uint64_t v28 = v22;
  uint64_t v9 = *(void *)(v8 + 136);
  uint64_t v10 = *(void *)(v8 + 144);
  uint64_t v21 = type metadata accessor for Sizing();
  sub_1BF8C2410(v21, (uint64_t)v25);
  uint64_t v11 = v26;
  uint64_t v12 = v27;
  __swift_project_boxed_opaque_existential_1(v25, v26);
  long long v23 = a4;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a1, a2, *a4, v9, v10, v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  if (!v24)
  {
    a4 = v4;
    uint64_t v28 = v22;
    sub_1BF8C2410(v21, (uint64_t)v25);
    uint64_t v14 = v26;
    uint64_t v15 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 16))(&v28, a1, a2, *v23, v9, v10, v14, v15);
    uint64_t v17 = v28;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    v25[0] = v17;
    if (SizerResult.isAmbiguous.getter())
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_retain();
    }
    else
    {
      v25[0] = v17;
      uint64_t v28 = v17;
      swift_retain();
      char v18 = SizerResult.nonIntegral.getter();
      sub_1BF8A8BC0(v18 & 1);
      swift_release();
      OUTLINED_FUNCTION_0();
      sub_1BF89D848(v19, v20, 0, 0);
      LOBYTE(v25[0]) = 1;
      OUTLINED_FUNCTION_0();
      sub_1BF89F124();
      OUTLINED_FUNCTION_0();
      sub_1BF89F278(v13);
      swift_bridgeObjectRelease();
      swift_release();
      return 0;
    }
  }
  return a4;
}

void Space.__allocating_init(kind:identifier:)()
{
}

void Space.init(kind:identifier:)()
{
}

unint64_t sub_1BF88DB0C()
{
  return sub_1BF88DB44(*(void *)(v0 + 40));
}

uint64_t Space.deinit()
{
  uint64_t v0 = Node.deinit();
  sub_1BF88DB44(*(void *)(v0 + 40));
  return v0;
}

unint64_t sub_1BF88DB44(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      unint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Space.__deallocating_deinit()
{
  uint64_t v0 = Space.deinit();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t Space.description.getter()
{
  return 0;
}

uint64_t sub_1BF88DD00()
{
  return Space.description.getter();
}

uint64_t sub_1BF88DD24()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Space()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Space(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Space);
}

uint64_t dispatch thunk of Space.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of Space.__allocating_init(sizing:name:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

double UIEdgeInsets.replace(left:)(double a1, double a2)
{
  return a2;
}

double UIEdgeInsets.replace(bottom:)(double a1, double a2)
{
  return a2;
}

void UIEdgeInsets.replace(right:)()
{
}

void *sub_1BF88DE00@<X0>(void *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a3;
  *a4 = *result;
  a4[1] = v4;
  a4[2] = v5;
  return result;
}

uint64_t sub_1BF88DE18(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v18 = v3[2];
  unint64_t v19 = v3[1];
  unint64_t v24 = *v3;
  uint64_t v7 = type metadata accessor for Conditional();
  Conditional.condition.getter(v7, v21);
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  uint64_t v10 = *(void *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 88);
  char v12 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(a1, a2, v10, v11, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  if (v12) {
    unint64_t v13 = v19;
  }
  else {
    unint64_t v13 = v18;
  }
  unint64_t v24 = v13;
  sub_1BF88E13C(v13);
  uint64_t v14 = type metadata accessor for Sizing();
  sub_1BF8C2410(v14, (uint64_t)v21);
  uint64_t v15 = v22;
  uint64_t v16 = v23;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 16))(a1, a2, a3, v10, v11, v15, v16);
  sub_1BF88DB44(v13);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_1BF88DFA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF88DE18(a1, a2, a3);
}

uint64_t sub_1BF88DFC4()
{
  return 0;
}

uint64_t sub_1BF88E114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

unint64_t sub_1BF88E120(unint64_t result)
{
  if ((result >> 62) <= 1) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_1BF88E13C(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      unint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BF88E1F4(unint64_t *a1)
{
  sub_1BF88E238(*a1);
  sub_1BF88DB44(a1[1]);
  unint64_t v2 = a1[2];
  return sub_1BF88DB44(v2);
}

unint64_t sub_1BF88E238(unint64_t result)
{
  if ((result >> 62) <= 1) {
    return swift_release();
  }
  return result;
}

unint64_t *sub_1BF88E254(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  sub_1BF88E120(*a2);
  *a1 = v4;
  unint64_t v5 = a2[1];
  sub_1BF88E13C(v5);
  a1[1] = v5;
  unint64_t v6 = a2[2];
  sub_1BF88E13C(v6);
  a1[2] = v6;
  return a1;
}

unint64_t *sub_1BF88E2B4(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  sub_1BF88E120(*a2);
  unint64_t v5 = *a1;
  *a1 = v4;
  sub_1BF88E238(v5);
  unint64_t v6 = a2[1];
  sub_1BF88E13C(v6);
  unint64_t v7 = a1[1];
  a1[1] = v6;
  sub_1BF88DB44(v7);
  unint64_t v8 = a2[2];
  sub_1BF88E13C(v8);
  unint64_t v9 = a1[2];
  a1[2] = v8;
  sub_1BF88DB44(v9);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

unint64_t *sub_1BF88E340(unint64_t *a1, uint64_t a2)
{
  sub_1BF88E238(*a1);
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1BF88DB44(v4);
  unint64_t v5 = a1[2];
  a1[2] = *(void *)(a2 + 16);
  sub_1BF88DB44(v5);
  return a1;
}

uint64_t sub_1BF88E390(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7E && *(unsigned char *)(a1 + 24))
    {
      unsigned int v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7D) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1BF88E3E4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t type metadata accessor for IfSizer()
{
  return __swift_instantiateGenericMetadata();
}

id sub_1BF88E460(id result, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 3:
    case 4:
    case 6:
      goto LABEL_4;
    case 1:
    case 2:
      __n128 result = result;
      break;
    case 5:
      swift_bridgeObjectRetain();
LABEL_4:
      __n128 result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void destroy for LayoutError(uint64_t a1)
{
}

void sub_1BF88E520(void *a1, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 3:
    case 4:
    case 6:
      goto LABEL_4;
    case 1:
    case 2:

      break;
    case 5:
      swift_bridgeObjectRelease();
LABEL_4:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for LayoutError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_1BF88E460(*(id *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for LayoutError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_1BF88E460(*(id *)a2, v4, v5, v6);
  unint64_t v7 = *(void **)a1;
  unint64_t v8 = *(void **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_1BF88E520(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LayoutError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)a1;
  unint64_t v7 = *(void **)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_1BF88E520(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF9 && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 248;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 7) {
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

uint64_t storeEnumTagSinglePayload for LayoutError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF88E788(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 6u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_1BF88E7A0(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 7;
  if (a2 >= 7)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 7;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LayoutError()
{
  return &type metadata for LayoutError;
}

uint64_t sub_1BF88E7CC()
{
  uint64_t v0 = sub_1BF8CB9A8();
  __swift_allocate_value_buffer(v0, qword_1EA170158);
  int v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)qword_1EA170158);
  return sub_1BF88E818(v1);
}

uint64_t sub_1BF88E818@<X0>(void *a1@<X8>)
{
  sub_1BF8A12C0();
  uint64_t v3 = v2;
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v5 = *(void *)(v2 + 24) >> 1;
  unint64_t v6 = v4 + 1;
  if (v5 <= v4)
  {
    sub_1BF8A12C0();
    uint64_t v3 = v12;
    unint64_t v5 = *(void *)(v12 + 24) >> 1;
  }
  *(void *)(v3 + 16) = v6;
  *(void *)(v3 + 8 * v4 + 32) = 0x4080F00000000000;
  unint64_t v7 = v4 + 2;
  if ((uint64_t)v5 < (uint64_t)(v4 + 2))
  {
    sub_1BF8A12C0();
    uint64_t v3 = v13;
  }
  *(void *)(v3 + 16) = v7;
  *(void *)(v3 + 8 * v6 + 32) = 0x4085400000000000;
  if ((int64_t)(v4 + 3) > *(void *)(v3 + 24) >> 1)
  {
    sub_1BF8A12C0();
    uint64_t v3 = v14;
  }
  *(void *)(v3 + 16) = v4 + 3;
  *(void *)(v3 + 8 * v7 + 32) = 0x4090E00000000000;
  *a1 = v3;
  uint64_t v8 = *MEMORY[0x1E4FAD798];
  uint64_t v9 = sub_1BF8CB9A8();
  char v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a1, v8, v9);
}

uint64_t static Gutters.columnSystem.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EA1700A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1BF8CB9A8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EA170158);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

__C::UIRectCorner __swiftcall UIRectCorner.flipRightToLeft(bounds:)(__C::CGRect bounds)
{
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v2.rawValue = 1;
      if ((v1 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    v2.rawValue = 0;
    if ((v1 & 4) != 0)
    {
LABEL_12:
      v2.rawValue |= 8;
      goto LABEL_13;
    }
LABEL_7:
    if ((v1 & 8) == 0) {
      return v2;
    }
    return (__C::UIRectCorner)(v2.rawValue | 4);
  }
  if ((v1 & 2) == 0)
  {
    v2.rawValue = 2;
    if ((v1 & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  v2.rawValue = 3;
  if ((v1 & 4) != 0) {
    goto LABEL_12;
  }
LABEL_13:
  if ((v1 & 8) != 0 && (v2.rawValue & 4) == 0) {
    return (__C::UIRectCorner)(v2.rawValue | 4);
  }
  return v2;
}

uint64_t sub_1BF88EB14()
{
  return sub_1BF8CBB68();
}

uint64_t sub_1BF88EB90()
{
  return sub_1BF8CBB28();
}

__C::UIRectCorner sub_1BF88EBFC@<X0>(__C::UIRectCorner *a1@<X8>, double a2@<D0>)
{
  result.rawValue = UIRectCorner.flipRightToLeft(bounds:)(*(__C::CGRect *)&a2).rawValue;
  a1->rawValue = result.rawValue;
  return result;
}

BOOL sub_1BF88EC28(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1BF88EC34(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_1BF88EC3C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF88ECA4(&qword_1EBA90238);
  uint64_t result = sub_1BF88ECA4(&qword_1EBA90230);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BF88ECA4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UIRectCorner(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BF88ECE8(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  type metadata accessor for DimensionCursor();
  double v3 = DimensionCursor.position.getter();
  double v4 = DimensionCursor.remainingBounds.getter();
  *(double *)(v2 + 16) = v3;
  *(double *)(v2 + 24) = v4;
  *(unsigned char *)(v2 + 32) = 1;
  *a1 = v2;
}

void sub_1BF88EDAC(uint64_t *a1@<X8>)
{
}

uint64_t sub_1BF88EDC4()
{
  return 1819044198;
}

ValueMetadata *type metadata accessor for FillDimensionSizer()
{
  return &type metadata for FillDimensionSizer;
}

uint64_t sub_1BF88EDE4()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

TeaTemplate::Column_optional __swiftcall Column.init(_:)(Swift::Int a1)
{
  if (a1 == 18) {
    char v2 = 2;
  }
  else {
    char v2 = 3;
  }
  if (a1 == 12) {
    char v3 = 1;
  }
  else {
    char v3 = v2;
  }
  if (a1 == 6) {
    char v3 = 0;
  }
  *char v1 = v3;
  return (TeaTemplate::Column_optional)a1;
}

uint64_t Column.count.getter()
{
  return 6 * *v0 + 6;
}

double Column.hSpacing(for:columnSystem:)(uint64_t a1, int8x16_t *a2)
{
  double result = 28.0;
  if (a2[2].i8[0] == 1)
  {
    int8x16_t v3 = vorrq_s8(*a2, a2[1]);
    int8x8_t v4 = vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
    double result = 10.0;
    if (!*(void *)&v4) {
      return 28.0;
    }
  }
  return result;
}

double Column.vSpacing(for:columnSystem:)(id a1, uint64_t a2, double result)
{
  if (*(unsigned char *)(a2 + 32) != 1
    || (double result = 10.0, !(*(void *)(a2 + 16) | *(void *)(a2 + 24) | *(void *)a2 | *(void *)(a2 + 8))))
  {
    if (*v3)
    {
      if (*v3 == 1)
      {
        id v5 = objc_msgSend(a1, sel_horizontalSizeClass, result);
        BOOL v6 = objc_msgSend(a1, sel_verticalSizeClass) == (id)1 && v5 == (id)1;
        double result = 18.0;
        if (!v6) {
          return 20.0;
        }
      }
      else
      {
        return 30.0;
      }
    }
    else
    {
      return 18.0;
    }
  }
  return result;
}

id Column.traits(for:viewportWidth:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  int v7 = *v3;
  id v8 = objc_msgSend(a1, sel_horizontalSizeClass);
  id result = objc_msgSend(a1, sel_verticalSizeClass);
  if (v8 == (id)1 && result == (id)1)
  {
    uint64_t v14 = qword_1F1B04A00;
  }
  else
  {
    if (v7) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = a3 > 320.0;
    }
    if (v11)
    {
      if ((unint64_t)v8 >= 3)
      {
        sub_1BF88F314();
        uint64_t v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_1BF8CD2F0;
        id v13 = objc_msgSend(a1, sel_horizontalSizeClass);
        id v15 = objc_msgSend(a1, sel_verticalSizeClass);
        sub_1BF88F3C4();
        sub_1BF8CBF48();
        *(void *)(v12 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v12 + 64) = sub_1BF88F428();
        *(void *)(v12 + 32) = 0;
        *(void *)(v12 + 40) = 0xE000000000000000;
        MEMORY[0x1C18B4130]("Unknown size class in %{public}@", 32, 2, v12, v13, v15);
        id result = (id)swift_bridgeObjectRelease();
      }
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = qword_1F1B04A28;
    }
  }
  *a2 = v14;
  return result;
}

double Column.designViewportWidth.getter()
{
  return dbl_1BF8CD488[*v0];
}

double Column.scaleFactor(forActualViewportWidth:)(double a1)
{
  double v2 = 1.0;
  if (a1 != 1.79769313e308) {
    return a1 / dbl_1BF8CD488[*v1];
  }
  return v2;
}

uint64_t Column.maxWidth(for:)(void *a1)
{
  int v2 = *v1;
  uint64_t v3 = static ColumnSystem.specs(for:)(a1);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    id v5 = (double *)(v3 + 48);
    while (*((unsigned __int8 *)v5 - 16) != v2)
    {
      v5 += 3;
      if (!--v4) {
        goto LABEL_5;
      }
    }
    double v7 = *v5;
    swift_bridgeObjectRelease();
    *(double *)&uint64_t result = v7 + -1.0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    *(double *)&uint64_t result = 0.0;
  }
  return result;
}

BOOL static Column.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void Column.layoutSize.getter(BOOL *a1@<X8>)
{
  *a1 = *v1 == 0;
}

uint64_t Column.hash(into:)()
{
  return sub_1BF8CC1B8();
}

void *static Column.allCases.getter()
{
  return &unk_1F1B04A30;
}

uint64_t Column.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

void sub_1BF88F1E0(void *a1@<X8>)
{
  *a1 = &unk_1F1B04A30;
}

uint64_t Column.description.getter()
{
  uint64_t v1 = 12849;
  if (*v0 != 1) {
    uint64_t v1 = 14385;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 54;
  }
}

BOOL static ColumnSpec.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ColumnSpec.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t ColumnSpec.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

uint64_t ColumnSpec.description.getter()
{
  if (*v0) {
    return 0x676E696361705376;
  }
  else {
    return 0x676E696361705368;
  }
}

uint64_t sub_1BF88F2EC()
{
  return ColumnSpec.description.getter();
}

void sub_1BF88F308(void *a1@<X8>)
{
  *a1 = 0;
}

void sub_1BF88F314()
{
  if (!qword_1EA170170)
  {
    sub_1BF88F36C();
    unint64_t v0 = sub_1BF8CC028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA170170);
    }
  }
}

unint64_t sub_1BF88F36C()
{
  unint64_t result = qword_1EA170178;
  if (!qword_1EA170178)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA170178);
  }
  return result;
}

void sub_1BF88F3C4()
{
  if (!qword_1EA170180)
  {
    type metadata accessor for UIUserInterfaceSizeClass(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA170180);
    }
  }
}

unint64_t sub_1BF88F428()
{
  unint64_t result = qword_1EA170188;
  if (!qword_1EA170188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170188);
  }
  return result;
}

unint64_t sub_1BF88F478()
{
  unint64_t result = qword_1EBA8FCB0[0];
  if (!qword_1EBA8FCB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBA8FCB0);
  }
  return result;
}

unint64_t sub_1BF88F4C8()
{
  unint64_t result = qword_1EA170190;
  if (!qword_1EA170190)
  {
    sub_1BF88F518();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170190);
  }
  return result;
}

void sub_1BF88F518()
{
  if (!qword_1EA170198)
  {
    unint64_t v0 = sub_1BF8CBC38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA170198);
    }
  }
}

unint64_t sub_1BF88F568()
{
  unint64_t result = qword_1EA1701A0;
  if (!qword_1EA1701A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1701A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Column(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Column(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF88F708);
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

unsigned char *sub_1BF88F730(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Column()
{
  return &type metadata for Column;
}

unsigned char *storeEnumTagSinglePayload for ColumnSpec(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF88F814);
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

ValueMetadata *type metadata accessor for ColumnSpec()
{
  return &type metadata for ColumnSpec;
}

uint64_t Frame.__allocating_init(name:_:_:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  return Frame.init(name:_:_:mapBlock:)(a1, a2, a3, a4, a5, a6);
}

uint64_t Frame.init(name:_:_:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *a4;
  v6[5] = a3;
  v6[6] = v9;
  v6[7] = a1;
  v6[8] = a2;
  v6[9] = a5;
  v6[10] = a6;
  char v11 = 0;
  swift_bridgeObjectRetain();
  return Node.init(kind:identifier:)(&v11, a1, a2);
}

uint64_t sub_1BF88F928()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790]();
  BOOL v7 = (char *)&v12[-1] - v6;
  swift_getAtKeyPath();
  v12[3] = v2;
  v12[4] = &protocol witness table for Node<A>;
  v12[0] = v0;
  uint64_t v8 = *(void *)(v1 + 160);
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  v9(v12, v3, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_1BF88FA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v75 = a3;
  v71[0] = *v3;
  uint64_t v10 = v71[0];
  uint64_t v72 = *(void *)(v71[0] + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v73 = v11;
  MEMORY[0x1F4188790](v12);
  v71[1] = (char *)v71 - v13;
  v77 = v14;
  uint64_t v15 = v3[8];
  uint64_t v74 = v3[7];
  uint64_t v76 = v15;
  uint64_t v16 = sub_1BF8991D8();
  uint64_t v79 = v3[6];
  v82[0] = v79;
  uint64_t v17 = *(void *)(v10 + 136);
  uint64_t v18 = *(void *)(v10 + 152);
  uint64_t v78 = type metadata accessor for Sizing();
  sub_1BF8C2410(v78, (uint64_t)v83);
  uint64_t v19 = v84;
  uint64_t v20 = v85;
  __swift_project_boxed_opaque_existential_1(v83, v84);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8);
  uint64_t v80 = a1;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = v81;
  uint64_t v25 = v21(v22, a2, v16, v17, v18, v19, v20);
  if (v24)
  {
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
  }
  else
  {
    uint64_t v81 = v25;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
    v82[0] = v79;
    sub_1BF8C2410(v78, (uint64_t)v83);
    uint64_t v27 = v84;
    uint64_t v26 = v85;
    __swift_project_boxed_opaque_existential_1(v83, v84);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 16))(v82, v80, v23, v16, v17, v18, v27, v26);
    uint64_t v29 = v80;
    uint64_t v30 = v82[0];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
    v83[0] = v30;
    if (SizerResult.isAmbiguous.getter())
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_retain();
    }
    else
    {
      v83[0] = v30;
      v82[0] = v30;
      uint64_t v86 = v30;
      swift_retain();
      char v31 = SizerResult.nonIntegral.getter();
      sub_1BF8A8BC0(v31 & 1);
      OUTLINED_FUNCTION_5();
      swift_release();
      v88.origin.x = v4;
      v88.origin.y = v5;
      v88.size.width = v6;
      v88.size.height = v7;
      SizerResult.postProcess(frame:nonIntegral:)(v88, 0);
      if (v32) {
        goto LABEL_8;
      }
      OUTLINED_FUNCTION_5();
      v83[0] = v30;
      v82[0] = v30;
      uint64_t v86 = v30;
      swift_retain();
      char v33 = SizerResult.nonIntegral.getter();
      sub_1BF8A9020(v33 & 1);
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      swift_release();
      v89.origin.x = v35;
      v89.origin.y = v37;
      v89.size.width = v39;
      v89.size.height = v41;
      SizerResult.postProcess(frame:nonIntegral:)(v89, 0);
      if (v42)
      {
LABEL_8:
        swift_release();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      else
      {
        uint64_t v78 = v30 & 0xFFFFFFFFFFFFFFFLL;
        sub_1BF8A3044();
        uint64_t v44 = v43;
        uint64_t v46 = v45;
        uint64_t v48 = v47;
        CGFloat v50 = v49;
        char v51 = v74;
        uint64_t v52 = v76;
        sub_1BF89D848((uint64_t)v3, v75, v74, v76);
        uint64_t v79 = *v77;
        LOBYTE(v82[0]) = *(unsigned char *)(v29 + 48);
        v83[0] = v30;
        v53 = (void *)SizerResult.metadata.getter();
        v90.origin.x = OUTLINED_FUNCTION_2_1();
        v87.value._rawValue = v53;
        v87.is_nil = v51;
        v90.size.height = v50;
        v54.value._countAndFlagsBits = v52;
        uint64_t v55 = v79;
        LayoutContext.set(frame:direction:metadata:for:)(v90, v56, v87, v54);
        swift_bridgeObjectRelease();
        LOBYTE(v83[0]) = 0;
        OUTLINED_FUNCTION_2_1();
        sub_1BF89F124();
        sub_1BF89F278(v81);
        swift_bridgeObjectRelease();
        v57 = (void (*)(uint64_t, double))v3[9];
        if (v57)
        {
          swift_retain();
          double v58 = OUTLINED_FUNCTION_2_1();
          v57(v55, v58);
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_4();
          uint64_t v67 = *(void *)(v66 + 160);
          v68 = *(void (**)(void *, void *, uint64_t, uint64_t, uint64_t))(v67 + 16);
          swift_retain();
          v68(v82, v83, MEMORY[0x1E4FBC840] + 8, v72, v67);
          swift_release();
          sub_1BF8901F4((uint64_t)v57);
          swift_release();
          uint64_t v69 = OUTLINED_FUNCTION_1_1();
          v70(v69);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
        }
        else
        {
          OUTLINED_FUNCTION_3_0();
          v82[0] = v44;
          v82[1] = v46;
          v82[2] = v48;
          *(CGFloat *)&v82[3] = v50;
          OUTLINED_FUNCTION_4();
          uint64_t v60 = *(void *)(v59 + 160);
          v61 = *(void (**)(void *, void *, uint64_t, uint64_t, uint64_t))(v60 + 16);
          type metadata accessor for CGRect(0);
          uint64_t v63 = v62;
          swift_retain();
          v61(v82, v83, v63, v72, v60);
          swift_release();
          swift_release();
          uint64_t v64 = OUTLINED_FUNCTION_1_1();
          v65(v64);
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
        return 0;
      }
    }
  }
}

void Frame.__allocating_init(kind:identifier:)()
{
}

void Frame.init(kind:identifier:)()
{
}

uint64_t sub_1BF8900B4()
{
  swift_release();
  sub_1BF89013C(*(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 72);
  return sub_1BF8901F4(v1);
}

uint64_t Frame.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_release();
  sub_1BF89013C(*(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  sub_1BF8901F4(*(void *)(v0 + 72));
  return v0;
}

unint64_t sub_1BF89013C(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      unint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8901F4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t Frame.__deallocating_deinit()
{
  uint64_t v0 = Frame.deinit();
  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t Frame.description.getter()
{
  return 0;
}

uint64_t sub_1BF890308()
{
  return Frame.description.getter();
}

uint64_t sub_1BF89032C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Frame()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for Frame(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Frame);
}

uint64_t dispatch thunk of Frame.__allocating_init(name:_:_:mapBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t SizerTrait.hash(into:)()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    return sub_1BF8CC1B8();
  }
  sub_1BF8CC1B8();
  sub_1BF8CC1C8();
  return sub_1BF8CC1C8();
}

BOOL static SizerTrait.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  double v4 = *(double *)a2;
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    if (!(*(void *)&v2 | *(void *)&v3))
    {
      if (*(unsigned char *)(a2 + 16))
      {
LABEL_12:
        if (!(*(void *)&v4 | *(void *)(a2 + 8))) {
          return 1;
        }
      }
      return 0;
    }
    if (!(*(void *)&v2 ^ 1 | *(void *)&v3))
    {
      if (*(unsigned char *)(a2 + 16))
      {
        *(void *)&v4 ^= 1uLL;
        goto LABEL_12;
      }
      return 0;
    }
    if (!*(unsigned char *)(a2 + 16)) {
      return 0;
    }
    BOOL result = 1;
    if (*(void *)&v4 <= 1uLL) {
      return 0;
    }
  }
  else
  {
    if (*(unsigned char *)(a2 + 16)) {
      return 0;
    }
    return v3 == *(double *)(a2 + 8) && v2 == v4;
  }
  return result;
}

uint64_t SizerTrait.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF890534()
{
  return sub_1BF8CC1D8();
}

unint64_t sub_1BF890578()
{
  unint64_t result = qword_1EBA8F0A8[0];
  if (!qword_1EBA8F0A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBA8F0A8);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SizerTrait(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SizerTrait(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_1BF89062C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF890648(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 16) = v2;
  return result;
}

ValueMetadata *type metadata accessor for SizerTrait()
{
  return &type metadata for SizerTrait;
}

uint64_t dispatch thunk of SizerType.traits<A>(cursor:template:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of SizerType.frame<A>(cursor:template:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

void sub_1BF8906C8(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  *(double *)(v2 + 16) = Cursor.remainingBounds.getter();
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v5;
  if (qword_1EBA902F8 != -1) {
    swift_once();
  }
  char v6 = HIBYTE(word_1EBA902EA);
  *(unsigned char *)(v2 + 48) = word_1EBA902EA;
  *(unsigned char *)(v2 + 49) = v6;
  *a1 = v2;
}

void sub_1BF89076C(uint64_t *a1@<X8>)
{
}

uint64_t sub_1BF890784()
{
  return 0x69466F54657A6973;
}

ValueMetadata *type metadata accessor for SizeToFitSizer()
{
  return &type metadata for SizeToFitSizer;
}

uint64_t sub_1BF8907B0()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t initializeWithCopy for MinRatioSizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for MinRatioSizer(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
        __n128 result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *__n128 result = *a2;
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

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for MinRatioSizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for MinRatioSizer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 49))
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

uint64_t storeEnumTagSinglePayload for MinRatioSizer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MinRatioSizer()
{
  return &type metadata for MinRatioSizer;
}

uint64_t sub_1BF890B9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *a1;
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v8);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, *(void *)(v7 + 80), *(void *)(v7 + 88), v8, v9);
}

void *sub_1BF890C4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v9 = v4;
  uint64_t v14 = *a1;
  uint64_t v15 = *(void *)(v9 + 24);
  uint64_t v16 = *(void *)(v9 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v9, v15);
  __n128 result = (*(void *(**)(void *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v16 + 16))(v86, a1, a2, a3, *(void *)(v14 + 80), *(void *)(v14 + 88), v15, v16);
  if (v5) {
    return result;
  }
  double v18 = *(double *)(v9 + 40);
  unsigned int v19 = *(unsigned __int8 *)(v9 + 48);
  if (v19 >> 6)
  {
    if (v19 >> 6 == 1)
    {
      OUTLINED_FUNCTION_7_0();
      char v20 = SizerResult.nonIntegral.getter();
      OUTLINED_FUNCTION_4_0(v20);
      OUTLINED_FUNCTION_0_6();
      double v21 = OUTLINED_FUNCTION_2_2() * v18;
      OUTLINED_FUNCTION_1_2();
      char v22 = SizerResult.nonIntegral.getter();
      OUTLINED_FUNCTION_4_0(v22);
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_8();
      if (v23 != v24)
      {
        OUTLINED_FUNCTION_1_2();
        char v25 = SizerResult.nonIntegral.getter();
        OUTLINED_FUNCTION_4_0(v25);
        OUTLINED_FUNCTION_0_6();
        double v26 = OUTLINED_FUNCTION_6();
        if (v26 > v21) {
          double v21 = v26;
        }
      }
      OUTLINED_FUNCTION_3_1();
      uint64_t v27 = a1[61];
      uint64_t v28 = a1[62];
      OUTLINED_FUNCTION_5_0();
      char v29 = SizerResult.nonIntegral.getter();
      OUTLINED_FUNCTION_11(v29);
      uint64_t v31 = v30;
      swift_release();
      uint64_t v32 = OUTLINED_FUNCTION_10();
      *(void *)(v32 + 16) = v27;
      *(void *)(v32 + 24) = v28;
      *(void *)(v32 + 32) = v31;
      *(double *)(v32 + 40) = v21;
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_7_0();
    char v44 = SizerResult.nonIntegral.getter();
    OUTLINED_FUNCTION_4_0(v44);
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_2_2();
    double Height = 0.0;
    OUTLINED_FUNCTION_8();
    double Width = 0.0;
    if (!v47)
    {
      OUTLINED_FUNCTION_1_2();
      char v48 = SizerResult.nonIntegral.getter();
      OUTLINED_FUNCTION_4_0(v48);
      CGFloat v50 = v49;
      OUTLINED_FUNCTION_9();
      v87.origin.x = v50;
      v87.origin.y = v6;
      v87.size.width = v7;
      v87.size.height = v8;
      double Width = CGRectGetWidth(v87);
    }
    OUTLINED_FUNCTION_1_2();
    char v51 = SizerResult.nonIntegral.getter();
    OUTLINED_FUNCTION_4_0(v51);
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    CGFloat v59 = v58;
    swift_release();
    v88.origin.x = v53;
    v88.origin.y = v55;
    v88.size.width = v57;
    v88.size.height = v59;
    CGRectGetHeight(v88);
    OUTLINED_FUNCTION_8();
    if (v47)
    {
      if (v19) {
        goto LABEL_45;
      }
    }
    else
    {
      OUTLINED_FUNCTION_1_2();
      char v79 = SizerResult.nonIntegral.getter();
      OUTLINED_FUNCTION_4_0(v79);
      uint64_t v81 = v80;
      OUTLINED_FUNCTION_9();
      uint64_t v82 = v81;
      CGFloat v83 = v53;
      CGFloat v84 = v55;
      CGFloat v85 = v57;
      double Height = CGRectGetHeight(*(CGRect *)&v82);
      if (v19)
      {
LABEL_45:
        double v60 = 1.0;
        double v61 = Height;
        switch(*(void *)&v18)
        {
          case 1:
            double v60 = 1.33333333;
            goto LABEL_20;
          case 2:
            double v60 = 0.75;
            goto LABEL_20;
          case 3:
            double v60 = 1.77777778;
            goto LABEL_20;
          case 4:
            double v60 = 1.6;
            goto LABEL_20;
          default:
            goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
    double v60 = v18;
LABEL_20:
    double v61 = Height * v60;
LABEL_21:
    if (Height <= Width && v61 <= Width)
    {
      double v70 = Width / v60;
      if (Height <= v70) {
        double Height = v70;
      }
      v90.origin.x = Cursor.remainingBounds.getter();
      double v71 = CGRectGetHeight(v90);
      if (Height >= v71) {
        double v72 = v71;
      }
      else {
        double v72 = Height;
      }
      OUTLINED_FUNCTION_3_1();
      uint64_t v73 = a1[61];
      uint64_t v74 = a1[62];
      OUTLINED_FUNCTION_5_0();
      char v75 = SizerResult.nonIntegral.getter();
      OUTLINED_FUNCTION_11(v75);
      uint64_t v77 = v76;
      swift_release();
      uint64_t v32 = OUTLINED_FUNCTION_10();
      *(void *)(v32 + 16) = v73;
      *(void *)(v32 + 24) = v74;
      *(void *)(v32 + 32) = v77;
      *(double *)(v32 + 40) = v72;
      goto LABEL_40;
    }
    if (Width > v61) {
      double v63 = Width;
    }
    else {
      double v63 = v61;
    }
    v89.origin.x = Cursor.remainingBounds.getter();
    double v64 = CGRectGetWidth(v89);
    if (v63 >= v64) {
      double v65 = v64;
    }
    else {
      double v65 = v63;
    }
    OUTLINED_FUNCTION_3_1();
    uint64_t v66 = a1[61];
    uint64_t v67 = a1[62];
    OUTLINED_FUNCTION_5_0();
    char v68 = SizerResult.nonIntegral.getter();
    OUTLINED_FUNCTION_11(v68);
    uint64_t v42 = v69;
    swift_release();
    uint64_t v43 = OUTLINED_FUNCTION_10();
    uint64_t v32 = v43;
    *(void *)(v43 + 16) = v66;
    *(void *)(v43 + 24) = v67;
    *(double *)(v43 + 32) = v65;
    goto LABEL_33;
  }
  OUTLINED_FUNCTION_7_0();
  char v33 = SizerResult.nonIntegral.getter();
  OUTLINED_FUNCTION_4_0(v33);
  OUTLINED_FUNCTION_0_6();
  double v34 = OUTLINED_FUNCTION_6() * v18;
  OUTLINED_FUNCTION_1_2();
  char v35 = SizerResult.nonIntegral.getter();
  OUTLINED_FUNCTION_4_0(v35);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8();
  if (v23 != v24)
  {
    OUTLINED_FUNCTION_1_2();
    char v36 = SizerResult.nonIntegral.getter();
    OUTLINED_FUNCTION_4_0(v36);
    OUTLINED_FUNCTION_0_6();
    double v37 = OUTLINED_FUNCTION_2_2();
    if (v37 > v34) {
      double v34 = v37;
    }
  }
  OUTLINED_FUNCTION_3_1();
  uint64_t v38 = a1[61];
  uint64_t v39 = a1[62];
  OUTLINED_FUNCTION_5_0();
  char v40 = SizerResult.nonIntegral.getter();
  OUTLINED_FUNCTION_11(v40);
  uint64_t v42 = v41;
  swift_release();
  uint64_t v43 = OUTLINED_FUNCTION_10();
  uint64_t v32 = v43;
  *(void *)(v43 + 16) = v38;
  *(void *)(v43 + 24) = v39;
  *(double *)(v43 + 32) = v34;
LABEL_33:
  *(void *)(v43 + 40) = v42;
LABEL_40:
  if (qword_1EBA90300 != -1) {
    swift_once();
  }
  char v78 = HIBYTE(word_1EBA8F7C8);
  *(unsigned char *)(v32 + 48) = word_1EBA8F7C8;
  *(unsigned char *)(v32 + 49) = v78;
  __n128 result = (void *)swift_release();
  *a4 = v32;
  return result;
}

uint64_t sub_1BF891100(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF890B9C(a1, a2, a3);
}

void *sub_1BF891118@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF890C4C(a1, a2, a3, a4);
}

uint64_t sub_1BF891130()
{
  return 0;
}

uint64_t sub_1BF8911CC()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1BF8911DC(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  switch((unint64_t)*v1 >> 61)
  {
    case 1uLL:
      uint64_t v5 = *(void *)((v3 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      *(void *)(a1 + 24) = &type metadata for FixedDimensionSizer;
      *(void *)(a1 + 32) = &off_1F1B08A28;
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = 0;
      *(unsigned char *)(a1 + 16) = 1;
      break;
    case 2uLL:
      uint64_t v6 = *(void *)((v3 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      *(void *)(a1 + 24) = &type metadata for ColumnDimensionSizer;
      *(void *)(a1 + 32) = &off_1F1B06A60;
      *(void *)a1 = v6;
      break;
    case 3uLL:
      *(void *)(a1 + 24) = &type metadata for InvertDimensionSizer;
      *(void *)(a1 + 32) = &off_1F1B09E78;
      *(void *)a1 = swift_allocObject();
      sub_1BF8911DC();
      break;
    case 4uLL:
      sub_1BF89172C((v3 & 0x1FFFFFFFFFFFFFFFLL) + 16, a1);
      break;
    case 5uLL:
      uint64_t v7 = v3 & 0x1FFFFFFFFFFFFFFFLL;
      CGFloat v8 = *(void **)(v7 + 16);
      uint64_t v9 = *(void *)(v7 + 24);
      *(void *)(a1 + 24) = &type metadata for FixedDimensionSizer;
      *(void *)(a1 + 32) = &off_1F1B08A28;
      *(void *)a1 = v8;
      *(void *)(a1 + 8) = v9;
      *(unsigned char *)(a1 + 16) = 2;
      id v10 = v8;
      break;
    case 6uLL:
      if (v3 == 0xC000000000000000)
      {
        *(void *)(a1 + 24) = &type metadata for SizeToFitDimensionSizer;
        *(void *)(a1 + 32) = &off_1F1B06FD0;
        *(unsigned char *)a1 = 0;
      }
      else if (v3 == 0xC000000000000008)
      {
        *(void *)(a1 + 24) = &type metadata for SizeToFitDimensionSizer;
        *(void *)(a1 + 32) = &off_1F1B06FD0;
        *(unsigned char *)a1 = 1;
      }
      else
      {
        *(void *)(a1 + 24) = &type metadata for FillDimensionSizer;
        *(void *)(a1 + 32) = &off_1F1B055D8;
      }
      break;
    default:
      uint64_t v4 = *(void *)(v3 + 16);
      *(void *)(a1 + 24) = &type metadata for FixedDimensionSizer;
      *(void *)(a1 + 32) = &off_1F1B08A28;
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = 0;
      *(unsigned char *)(a1 + 16) = 0;
      break;
  }
}

uint64_t ColumnSize.init(integerLiteral:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1BF8913EC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return ColumnSize.init(integerLiteral:)(*a1, a2);
}

uint64_t DimensionSizing.description.getter()
{
  uint64_t v1 = *v0;
  switch((unint64_t)*v0 >> 61)
  {
    case 1uLL:
      uint64_t v2 = 0x694664656C616373;
      unint64_t v3 = 0xEC00000028646578;
      goto LABEL_4;
    case 2uLL:
      uint64_t v11 = 0;
      unint64_t v12 = 0xE000000000000000;
      sub_1BF8CBAC8();
      sub_1BF8CBF48();
      goto LABEL_6;
    case 3uLL:
      unint64_t v4 = *(void *)((v1 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v11 = 0x28747265766E69;
      unint64_t v12 = 0xE700000000000000;
      unint64_t v5 = sub_1BF8917EC(v4);
      DimensionSizing.description.getter(v5);
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_7();
      sub_1BF89183C(v4);
      return v11;
    case 4uLL:
      sub_1BF89172C((v1 & 0x1FFFFFFFFFFFFFFFLL) + 16, (uint64_t)&v11);
      sub_1BF8CBAC8();
      sub_1BF891790();
      sub_1BF8CBF48();
      sub_1BF8CBAC8();
      uint64_t v6 = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
      return v6;
    case 5uLL:
      id v7 = *(id *)((v1 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      sub_1BF8CBE78();
      swift_bridgeObjectRelease();
      uint64_t v11 = 0x7274654D746E6F66;
      unint64_t v12 = 0xEB00000000286369;
      id v8 = objc_msgSend(v7, sel_description);
      sub_1BF8CBAA8();

      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      sub_1BF8CBAC8();
      sub_1BF8CBC48();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_7();

      return v11;
    case 6uLL:
      if (v1 == 0xC000000000000008) {
        unint64_t v10 = 0xD000000000000011;
      }
      else {
        unint64_t v10 = 1819044198;
      }
      if (v1 == 0xC000000000000000) {
        return 0x69466F54657A6973;
      }
      else {
        return v10;
      }
    default:
      uint64_t v2 = 0x286465786966;
      unint64_t v3 = 0xE600000000000000;
LABEL_4:
      uint64_t v11 = v2;
      unint64_t v12 = v3;
      sub_1BF8CBC48();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
LABEL_6:
      OUTLINED_FUNCTION_0_7();
      return v11;
  }
}

uint64_t sub_1BF89172C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1BF891790()
{
  unint64_t result = qword_1EBA8F910;
  if (!qword_1EBA8F910)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA8F910);
  }
  return result;
}

unint64_t sub_1BF8917EC(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      unint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BF89183C(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      unint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

double DimensionSizing.init(floatLiteral:)@<D0>(uint64_t *a1@<X8>, float a2@<S0>)
{
  uint64_t v4 = swift_allocObject();
  double result = a2;
  *(double *)(v4 + 16) = a2;
  *a1 = v4;
  return result;
}

uint64_t sub_1BF8918D8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

double sub_1BF8918E8@<D0>(float *a1@<X0>, uint64_t *a2@<X8>)
{
  return DimensionSizing.init(floatLiteral:)(a2, *a1);
}

double DimensionSizing.init(integerLiteral:)@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = swift_allocObject();
  double result = (double)a1;
  *(double *)(v4 + 16) = (double)a1;
  *a2 = v4;
  return result;
}

uint64_t sub_1BF891934()
{
  return MEMORY[0x1E4FBB5C0];
}

uint64_t sub_1BF891940()
{
  return MEMORY[0x1E4FBB4C8];
}

double sub_1BF89194C@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return DimensionSizing.init(integerLiteral:)(*a1, a2);
}

unint64_t *initializeBufferWithCopyOfBuffer for DimensionSizing(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF8917EC(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for DimensionSizing(unint64_t *a1)
{
  return sub_1BF89183C(*a1);
}

unint64_t *assignWithCopy for DimensionSizing(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF8917EC(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_1BF89183C(v4);
  return a1;
}

unint64_t *assignWithTake for DimensionSizing(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_1BF89183C(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for DimensionSizing(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7A && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 121;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x79) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for DimensionSizing(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x79)
  {
    *(void *)double result = a2 - 122;
    if (a3 >= 0x7A) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7A) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)double result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BF891AA4(void *a1)
{
  uint64_t v1 = *a1 >> 61;
  if (v1 <= 5) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 6;
  }
}

void *sub_1BF891AC0(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_1BF891AD0(unint64_t *result, uint64_t a2)
{
  if (a2 < 6)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 61;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 6);
    unint64_t v3 = 0xC000000000000000;
  }
  *double result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for DimensionSizing()
{
  return &type metadata for DimensionSizing;
}

uint64_t getEnumTagSinglePayload for ColumnSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ColumnSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)double result = (a2 - 1);
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

uint64_t sub_1BF891B54()
{
  return 0;
}

ValueMetadata *type metadata accessor for ColumnSize()
{
  return &type metadata for ColumnSize;
}

uint64_t sub_1BF891B6C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF891BA8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 328);
  if (v3 == 3)
  {
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v4 + 8) = 0;
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = 0;
    *(unsigned char *)(v4 + 24) = 7;
    return swift_willThrow();
  }
  uint64_t v9 = *(void *)v2;
  double v8 = *(double *)(v2 + 8);
  char v10 = *(unsigned char *)(v2 + 16);
  double v11 = *(double *)(a1 + 432);
  double v12 = *(double *)(a1 + 416);
  double v13 = *(double *)(a1 + 392);
  double v14 = *(double *)(a1 + 344);
  swift_beginAccess();
  uint64_t v15 = *(void *)(a1 + 488);
  uint64_t v16 = *(void *)(a1 + 496);
  uint64_t v17 = a1;
  Cursor.remainingBounds.getter();
  if (__OFSUB__(v9, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v19 = v18;
    if (v10) {
      double v20 = dbl_1BF8CD830[*(void *)&v8];
    }
    else {
      double v20 = v8;
    }
    double v21 = (v14 * (double)(v9 - 1)
         + (v13 - v12 - v11 - v14 * (dbl_1BF8CD818[(char)v3] + -1.0)) / dbl_1BF8CD818[(char)v3] * (double)v9)
        / v20;
    uint64_t result = swift_allocObject();
    uint64_t v17 = result;
    *(void *)(result + 16) = v15;
    *(void *)(result + 24) = v16;
    *(void *)(result + 32) = v19;
    *(double *)(result + 40) = v21;
    if (qword_1EBA90300 == -1) {
      goto LABEL_8;
    }
  }
  uint64_t result = swift_once();
LABEL_8:
  char v22 = HIBYTE(word_1EBA8F7C8);
  *(unsigned char *)(v17 + 48) = word_1EBA8F7C8;
  *(unsigned char *)(v17 + 49) = v22;
  *a2 = v17;
  return result;
}

uint64_t sub_1BF891D6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF891BA8(a1, a2);
}

uint64_t sub_1BF891D84()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1BF8CBE78();
  swift_bridgeObjectRelease();
  strcpy((char *)v3, "columnRowSpan(");
  HIBYTE(v3[1]) = -18;
  sub_1BF8CC018();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  if (v1 != 1) {
    sub_1BF8CBC48();
  }
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  return v3[0];
}

uint64_t storeEnumTagSinglePayload for ColumnRowSpanSizer(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ColumnRowSpanSizer()
{
  return &type metadata for ColumnRowSpanSizer;
}

uint64_t sub_1BF891F34()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

unint64_t sub_1BF891F44()
{
  unint64_t result = qword_1EA1701A8;
  if (!qword_1EA1701A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1701A8);
  }
  return result;
}

double EmbedFactoryCursor.origin.getter()
{
  return *(double *)v0;
}

double EmbedFactoryCursor.boundingSize.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t EmbedFactoryCursor.layoutOptions.getter@<X0>(void *a1@<X8>)
{
  char v3 = (const void *)(v1 + 32);
  memcpy(__dst, v3, sizeof(__dst));
  memcpy(a1, v3, 0xC8uLL);
  return sub_1BF891FF4((uint64_t)__dst);
}

uint64_t sub_1BF891FF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  id v3 = *(id *)(a1 + 80);
  id v4 = v2;
  swift_retain();
  return a1;
}

uint64_t EmbedFactoryCursor.adjustFrameBlock.getter()
{
  uint64_t v1 = *(void *)(v0 + 232);
  swift_retain();
  return v1;
}

uint64_t sub_1BF89206C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1BF8920F0(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1BF8920F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v13 = (void *)*v7;
  double v14 = (void *)*v7;
  uint64_t v15 = *a4;
  v7[5] = a3;
  v7[6] = v15;
  v7[7] = a1;
  v7[8] = a2;
  uint64_t v16 = v13[26];
  uint64_t v17 = v13[21];
  uint64_t v18 = v13[22];
  long long v26 = *(_OWORD *)(v14 + 17);
  long long v19 = *(_OWORD *)(v14 + 19);
  double v20 = (char *)v7 + v16;
  uint64_t v27 = v14[19];
  long long v28 = v19;
  uint64_t v29 = v17;
  uint64_t v30 = v18;
  uint64_t v31 = v18;
  uint64_t v21 = type metadata accessor for EmbedFactory.Context();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v20, a5, v21);
  char v23 = (void *)((char *)v7 + *(void *)(*v7 + 216));
  *char v23 = a6;
  v23[1] = a7;
  LOBYTE(v26) = 4;
  swift_bridgeObjectRetain();
  uint64_t v24 = Node.init(kind:identifier:)(&v26, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a5, v21);
  return v24;
}

uint64_t sub_1BF892294()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v14[-1] - v8;
  swift_getAtKeyPath();
  v14[3] = v3;
  v14[4] = &protocol witness table for Node<A>;
  v14[0] = v1;
  uint64_t v10 = *(void *)(v0 + 168);
  double v11 = *(void (**)(void *, uint64_t, uint64_t))(v10 + 8);
  swift_retain();
  v11(v14, v4, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_1BF8923B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (*v47)(void *__return_ptr, char *);
  char *v48;
  uint64_t v49;
  void (*v50)(void *, void *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  void (*v52)(uint64_t);
  uint64_t v53;
  void (*v54)(char *, void *, uint64_t, uint64_t, uint64_t);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  void v59[2];
  void *v60;
  void *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t AssociatedTypeWitness;
  uint64_t v66;
  void (*v67)(void);
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void v78[8];
  void v79[31];
  unsigned char v80[200];
  void v81[32];
  uint64_t v82;
  Swift::OpaquePointer_optional v83;
  __C::CGRect v84;

  uint64_t v9 = v4;
  char v68 = a3;
  uint64_t v77 = a2;
  uint64_t v82 = a1;
  uint64_t v69 = (void *)*v9;
  double v11 = v69;
  double v70 = v69[18];
  OUTLINED_FUNCTION_0_4();
  double v64 = v12;
  MEMORY[0x1F4188790](v13);
  double v63 = (char *)v59 - v14;
  uint64_t v15 = (void (*)(void))v69[22];
  uint64_t v66 = v69[19];
  uint64_t v67 = v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v62 = v16;
  MEMORY[0x1F4188790](v17);
  double v61 = a4;
  uint64_t v18 = v9[8];
  double v72 = v9[7];
  uint64_t v73 = (char *)v59 - v19;
  double v71 = v18;
  double v20 = sub_1BF8991D8();
  uint64_t v74 = v9[6];
  v79[0] = v74;
  uint64_t v21 = v11[17];
  uint64_t v22 = v11[20];
  uint64_t v23 = type metadata accessor for Sizing();
  sub_1BF8C2410(v23, (uint64_t)v81);
  uint64_t v24 = v81[3];
  uint64_t v25 = v81[4];
  __swift_project_boxed_opaque_existential_1(v81, v81[3]);
  long long v26 = *(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8);
  uint64_t v76 = v20;
  uint64_t v27 = v75;
  uint64_t v28 = v26(v82, v77, v20, v21, v22, v24, v25);
  if (v27)
  {
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  }
  else
  {
    char v75 = v28;
    double v60 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    v79[0] = v74;
    sub_1BF8C2410(v23, (uint64_t)v81);
    uint64_t v29 = v81[3];
    uint64_t v30 = v81[4];
    __swift_project_boxed_opaque_existential_1(v81, v81[3]);
    uint64_t v31 = v82;
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 16))(v79, v82, v77, v76, v21, v22, v29, v30);
    uint64_t v74 = v21;
    uint64_t v33 = v79[0];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    v81[0] = v33;
    if (SizerResult.isAmbiguous.getter())
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_retain();
    }
    else
    {
      uint64_t v34 = v31;
      uint64_t v35 = swift_allocObject();
      *(unsigned char *)(v35 + 16) = 0;
      v79[0] = v33;
      v78[0] = v33;
      swift_retain();
      char v36 = SizerResult.nonIntegral.getter();
      sub_1BF8A9020(v36 & 1);
      OUTLINED_FUNCTION_5();
      swift_release();
      sub_1BF89D858((uint64_t)v60, v68, v72, v71);
      double v37 = (const void *)(v34 + 128);
      memcpy(v80, (const void *)(v34 + 128), sizeof(v80));
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = v35;
      *(void *)(v38 + 24) = v33;
      *(CGFloat *)uint64_t v81 = v5;
      *(CGFloat *)&v81[1] = v6;
      *(CGFloat *)&v81[2] = v7;
      *(CGFloat *)&v81[3] = v8;
      memcpy(&v81[4], v37, 0xC8uLL);
      v81[29] = sub_1BF89496C;
      v81[30] = v38;
      memcpy(v79, v81, sizeof(v79));
      swift_retain();
      sub_1BF891FF4((uint64_t)v80);
      uint64_t v39 = v69[21];
      v59[1] = v35;
      swift_retain();
      v78[0] = v74;
      v78[1] = v70;
      v78[2] = v66;
      v78[3] = v66;
      v78[4] = v22;
      v78[5] = v39;
      v78[6] = v67;
      v78[7] = v67;
      uint64_t v40 = type metadata accessor for EmbedFactory.Context();
      sub_1BF892C18(v79, v40);
      v59[0] = v39;
      uint64_t v74 = v33 & 0xFFFFFFFFFFFFFFFLL;
      double v61 = (void *)*v61;
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v67 = *(void (**)(void))(AssociatedConformanceWitness + 16);
      OUTLINED_FUNCTION_4_1();
      v42();
      OUTLINED_FUNCTION_5();
      LOBYTE(v78[0]) = *(unsigned char *)(v82 + 48);
      v79[0] = v33;
      uint64_t v43 = (void *)SizerResult.metadata.getter();
      v84.origin.x = v5;
      v84.origin.y = v6;
      v84.size.width = v7;
      v83.value._rawValue = v43;
      v44.value._countAndFlagsBits = v71;
      v83.is_nil = v72;
      v84.size.height = v8;
      LayoutContext.set(frame:direction:metadata:for:)(v84, (TeaTemplate::Direction)v78, v83, v44);
      swift_bridgeObjectRelease();
      double v61 = (void *)v60[3];
      uint64_t v66 = AssociatedConformanceWitness;
      uint64_t v45 = v67;
      OUTLINED_FUNCTION_4_1();
      v45();
      LOBYTE(v79[0]) = 3;
      sub_1BF89F124();
      OUTLINED_FUNCTION_4_1();
      v45();
      uint64_t v46 = (uint64_t)v60;
      sub_1BF89F278(v75);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_1();
      v45();
      sub_1BF89D868(v46, v68, v72, v71);
      char v47 = *(void (**)(void *__return_ptr, char *))(v46 + *(void *)(*(void *)v46 + 216));
      if (v47)
      {
        swift_retain();
        char v48 = v73;
        v47(v78, v73);
        OUTLINED_FUNCTION_7_1();
        v79[3] = v69;
        v79[4] = &protocol witness table for Node<A>;
        v79[0] = v46;
        double v49 = v59[0];
        CGFloat v50 = *(void (**)(void *, void *, uint64_t, uint64_t, uint64_t))(v59[0] + 16);
        swift_retain();
        v50(v78, v79, MEMORY[0x1E4FBC840] + 8, v70, v49);
        swift_release();
        sub_1BF8901F4((uint64_t)v47);
        sub_1BF894988((uint64_t)v81);
        swift_release();
        char v51 = OUTLINED_FUNCTION_3_2();
        v52(v51);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
        (*(void (**)(char *, uint64_t))(v62 + 8))(v48, AssociatedTypeWitness);
      }
      else
      {
        OUTLINED_FUNCTION_7_1();
        v79[3] = v69;
        v79[4] = &protocol witness table for Node<A>;
        v79[0] = v46;
        CGFloat v53 = v59[0];
        double v54 = *(void (**)(char *, void *, uint64_t, uint64_t, uint64_t))(v59[0] + 16);
        swift_retain();
        CGFloat v55 = v73;
        double v56 = AssociatedTypeWitness;
        v54(v73, v79, AssociatedTypeWitness, v70, v53);
        swift_release();
        sub_1BF894988((uint64_t)v81);
        swift_release();
        CGFloat v57 = OUTLINED_FUNCTION_3_2();
        v58(v57);
        (*(void (**)(char *, uint64_t))(v62 + 8))(v55, v56);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v79);
      swift_release();
      return 0;
    }
  }
}

void sub_1BF892B6C(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  swift_beginAccess();
  *(unsigned char *)(a1 + 16) = 1;
  v10.origin.x = a2;
  v10.origin.y = a3;
  v10.size.width = a4;
  v10.size.height = a5;
  SizerResult.postProcess(frame:nonIntegral:)(v10, 0);
}

uint64_t sub_1BF892C18(void *__src, uint64_t a2)
{
  memcpy(__dst, __src, sizeof(__dst));
  return (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, void))(*(void *)(a2 + 72) + 40))(v2 + *(int *)(a2 + 84), v2 + *(int *)(a2 + 88), __dst, *(void *)(a2 + 40));
}

uint64_t EmbedFactory.Context.init(factory:model:options:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t v7 = type metadata accessor for EmbedFactory.Context();
  uint64_t v8 = a5 + *(int *)(v7 + 84);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, a2);
  uint64_t v10 = a5 + *(int *)(v7 + 88);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 32))(v10, a3);
}

uint64_t type metadata accessor for EmbedFactory.Context()
{
  return swift_getGenericMetadata();
}

void EmbedFactory.__allocating_init(kind:identifier:)()
{
}

void EmbedFactory.init(kind:identifier:)()
{
}

uint64_t sub_1BF892E3C()
{
  OUTLINED_FUNCTION_1_3();
  swift_release();
  sub_1BF89306C(v0[6]);
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + *(void *)(*v0 + 208);
  type metadata accessor for EmbedFactory.Context();
  OUTLINED_FUNCTION_2();
  (*(void (**)(char *))(v2 + 8))(v1);
  return sub_1BF8901F4(*(unint64_t *)((char *)v0 + *(void *)(*v0 + 216)));
}

unint64_t *EmbedFactory.deinit()
{
  uint64_t v0 = (unint64_t *)Node.deinit();
  swift_release();
  sub_1BF89306C(v0[6]);
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + *(void *)(*v0 + 208);
  type metadata accessor for EmbedFactory.Context();
  OUTLINED_FUNCTION_2();
  (*(void (**)(char *))(v2 + 8))(v1);
  sub_1BF8901F4(*(unint64_t *)((char *)v0 + *(void *)(*v0 + 216)));
  return v0;
}

unint64_t sub_1BF89306C(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      unint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t EmbedFactory.__deallocating_deinit()
{
  uint64_t v0 = EmbedFactory.deinit();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t EmbedFactory.description.getter()
{
  return 0;
}

uint64_t sub_1BF8932B0()
{
  return EmbedFactory.description.getter();
}

uint64_t destroy for EmbedFactoryCursor(uint64_t a1)
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for EmbedFactoryCursor(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  CGFloat v6 = *(void **)(a2 + 112);
  *(void *)(a1 + 112) = v6;
  long long v7 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  uint64_t v8 = *(void **)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v8;
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  uint64_t v9 = *(void *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(void *)(a1 + 240) = v9;
  id v10 = v6;
  id v11 = v8;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for EmbedFactoryCursor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  long long v4 = *(void **)(a2 + 112);
  long long v5 = *(void **)(a1 + 112);
  *(void *)(a1 + 112) = v4;
  id v6 = v4;

  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  long long v7 = *(void **)(a2 + 176);
  uint64_t v8 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = v7;
  id v9 = v7;

  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v10;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy248_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xF8uLL);
}

uint64_t assignWithTake for EmbedFactoryCursor(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  long long v7 = *(void **)(a1 + 112);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);

  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  uint64_t v8 = *(void *)(a2 + 176);
  id v9 = *(void **)(a1 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v8;

  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  swift_release();
  uint64_t v10 = *(void *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(void *)(a1 + 240) = v10;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmbedFactoryCursor(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 248))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 112);
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

uint64_t storeEnumTagSinglePayload for EmbedFactoryCursor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 248) = 1;
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
      *(void *)(result + 112) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 248) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmbedFactoryCursor()
{
  return &type metadata for EmbedFactoryCursor;
}

uint64_t dispatch thunk of EmbedFactoryType.createLayoutAttributes(model:options:cursor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t sub_1BF8936F0()
{
  uint64_t result = type metadata accessor for EmbedFactory.Context();
  if (v1 <= 0x3F) {
    return swift_initClassMetadata2();
  }
  return result;
}

uint64_t type metadata accessor for EmbedFactory()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for EmbedFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EmbedFactory);
}

uint64_t sub_1BF8937F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 80);
}

uint64_t sub_1BF8937FC()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v3 > 0x3F)
    {
      return AssociatedTypeWitness;
    }
    else
    {
      uint64_t v0 = swift_getAssociatedTypeWitness();
      if (v4 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v0;
}

uint64_t *sub_1BF89395C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 40);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = v4;
  uint64_t v12 = *(void *)(v10 - 8);
  int v13 = *(_DWORD *)(v12 + 80);
  uint64_t v14 = v13;
  uint64_t v26 = v9;
  unint64_t v15 = ((v9 + v13 + (v8 & ~(unint64_t)v7)) & ~(unint64_t)v13)
      + *(void *)(v12 + 64);
  int v16 = v7 | *(_DWORD *)(v11 + 80) | v13;
  uint64_t v17 = (v7 | *(unsigned char *)(v11 + 80) | v13);
  int v18 = v16 & 0x100000;
  if (v17 <= 7 && v15 <= 0x18 && v18 == 0)
  {
    unint64_t v23 = ~(unint64_t)v7;
    uint64_t v22 = a1;
    uint64_t v25 = v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v3);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(((unint64_t)a1 + v8) & v23, ((unint64_t)a2 + v8) & v23, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(((((unint64_t)a1 + v8) & v23) + v26 + v14) & ~v14, ((((unint64_t)a2 + v8) & v23) + v26 + v14) & ~v14, v25);
  }
  else
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    uint64_t v22 = (uint64_t *)(v21 + ((v17 + 16) & ~v17));
    swift_retain();
  }
  return v22;
}

uint64_t sub_1BF893BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 40) - 8) + 8;
  (*(void (**)(uint64_t, void))v3)(a1, *(void *)(a2 + 40));
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, AssociatedTypeWitness);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(unint64_t, uint64_t))(v11 + 8);
  uint64_t v13 = v10;
  unint64_t v14 = (v8 + v9 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return v12(v14, v13);
}

uint64_t sub_1BF893CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 40) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 40));
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v9 + 48);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 16))((v14 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (v14 + *(unsigned __int8 *)(v16 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), v15);
  return a1;
}

uint64_t sub_1BF893E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 40) - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 40));
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v9 + 40);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 24))((v14 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (v14 + *(unsigned __int8 *)(v16 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), v15);
  return a1;
}

uint64_t sub_1BF893F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 40) - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 40));
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v9 + 32);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 32))((v14 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (v14 + *(unsigned __int8 *)(v16 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), v15);
  return a1;
}

uint64_t sub_1BF8940E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 40) - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 40));
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v9 + 24);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 40))((v14 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (v14 + *(unsigned __int8 *)(v16 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), v15);
  return a1;
}

uint64_t sub_1BF894234(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 40);
  uint64_t v5 = *(void *)(v4 - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v28 = *(_DWORD *)(v7 + 84);
  unsigned int v29 = v6;
  if (v28 > v6) {
    unsigned int v6 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v6) {
    unsigned int v11 = v6;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = *(void *)(v7 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = *(void *)(*(void *)(v8 - 8) + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v16 = v8;
  uint64_t v17 = *(void *)(v5 + 64) + v12;
  uint64_t v18 = (uint64_t)a1;
  if (a2 <= v11) {
    goto LABEL_26;
  }
  uint64_t v19 = ((v13 + v14 + (v17 & ~v12)) & ~v14) + v15;
  char v20 = 8 * v19;
  if (v19 <= 3)
  {
    unsigned int v22 = ((a2 - v11 + ~(-1 << v20)) >> v20) + 1;
    if (HIWORD(v22))
    {
      int v21 = *(_DWORD *)((char *)a1 + v19);
      if (!v21) {
        goto LABEL_26;
      }
      goto LABEL_16;
    }
    if (v22 > 0xFF)
    {
      int v21 = *(unsigned __int16 *)((char *)a1 + v19);
      if (!*(unsigned __int16 *)((char *)a1 + v19)) {
        goto LABEL_26;
      }
      goto LABEL_16;
    }
    if (v22 < 2)
    {
LABEL_26:
      if (v11)
      {
        if (v29 == v11)
        {
          uint64_t v10 = v29;
          uint64_t v16 = v4;
        }
        else
        {
          uint64_t v18 = ((unint64_t)a1 + v17) & ~v12;
          if (v28 == v11)
          {
            uint64_t v10 = v28;
            uint64_t v16 = AssociatedTypeWitness;
          }
          else
          {
            uint64_t v18 = (v18 + v13 + v14) & ~v14;
          }
        }
        return __swift_getEnumTagSinglePayload(v18, v10, v16);
      }
      return 0;
    }
  }
  int v21 = *((unsigned __int8 *)a1 + v19);
  if (!*((unsigned char *)a1 + v19)) {
    goto LABEL_26;
  }
LABEL_16:
  int v23 = (v21 - 1) << v20;
  if (v19 > 3) {
    int v23 = 0;
  }
  if (v19)
  {
    if (v19 <= 3) {
      int v24 = v19;
    }
    else {
      int v24 = 4;
    }
    switch(v24)
    {
      case 2:
        int v25 = *a1;
        break;
      case 3:
        int v25 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v25 = *(_DWORD *)a1;
        break;
      default:
        int v25 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v25 = 0;
  }
  return v11 + (v25 | v23) + 1;
}

void sub_1BF894558(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + 40);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v28 = *(_DWORD *)(v8 + 84);
  unsigned int v29 = v7;
  if (v28 > v7) {
    unsigned int v7 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v7) {
    unsigned int v12 = v7;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = *(void *)(v6 + 64) + v13;
  uint64_t v15 = *(void *)(v8 + 64);
  uint64_t v16 = *(unsigned __int8 *)(v10 + 80);
  size_t v17 = ((v15 + v16 + (v14 & ~v13)) & ~v16) + *(void *)(*(void *)(v9 - 8) + 64);
  char v18 = 8 * v17;
  if (a3 <= v12)
  {
    int v20 = 0;
    uint64_t v19 = a1;
  }
  else
  {
    uint64_t v19 = a1;
    if (v17 <= 3)
    {
      unsigned int v24 = ((a3 - v12 + ~(-1 << v18)) >> v18) + 1;
      if (HIWORD(v24))
      {
        int v20 = 4;
      }
      else if (v24 >= 0x100)
      {
        int v20 = 2;
      }
      else
      {
        int v20 = v24 > 1;
      }
    }
    else
    {
      int v20 = 1;
    }
  }
  if (v12 < a2)
  {
    unsigned int v21 = ~v12 + a2;
    if (v17 < 4)
    {
      int v22 = (v21 >> v18) + 1;
      if (v17)
      {
        int v25 = v21 & ~(-1 << v18);
        bzero(v19, v17);
        if (v17 == 3)
        {
          *(_WORD *)uint64_t v19 = v25;
          v19[2] = BYTE2(v25);
        }
        else if (v17 == 2)
        {
          *(_WORD *)uint64_t v19 = v25;
        }
        else
        {
          *uint64_t v19 = v25;
        }
      }
    }
    else
    {
      bzero(v19, v17);
      *(_DWORD *)uint64_t v19 = v21;
      int v22 = 1;
    }
    switch(v20)
    {
      case 1:
        v19[v17] = v22;
        return;
      case 2:
        *(_WORD *)&v19[v17] = v22;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&v19[v17] = v22;
        return;
      default:
        return;
    }
  }
  uint64_t v23 = ~v13;
  switch(v20)
  {
    case 1:
      v19[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&v19[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x1BF8948F0);
    case 4:
      *(_DWORD *)&v19[v17] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v29 == v12)
        {
          uint64_t v26 = (uint64_t)v19;
          uint64_t v11 = v29;
          uint64_t v9 = v5;
        }
        else
        {
          uint64_t v26 = (unint64_t)&v19[v14] & v23;
          if (v28 == v12)
          {
            uint64_t v11 = v28;
            uint64_t v9 = AssociatedTypeWitness;
          }
          else
          {
            uint64_t v26 = (v26 + v15 + v16) & ~v16;
          }
        }
        __swift_storeEnumTagSinglePayload(v26, a2, v11, v9);
      }
      return;
  }
}

uint64_t sub_1BF894918()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1BF894928()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF89496C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  sub_1BF892B6C(*(void *)(v4 + 16), a1, a2, a3, a4);
}

uint64_t sub_1BF894988(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 112);
  uint64_t v3 = *(void **)(a1 + 176);
  swift_release();
  swift_release();

  return a1;
}

uint64_t sub_1BF8949D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BF894A3C(a1, a2, a3, a4);
}

uint64_t sub_1BF894A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a3;
  *(void *)(v4 + 48) = a4;
  char v6 = 6;
  return Node.init(kind:identifier:)(&v6, a1, a2);
}

uint64_t sub_1BF894A78(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = v4;
  uint64_t v43 = a3;
  uint64_t v46 = a1;
  uint64_t v8 = *(void *)(*(void *)v4 + 136);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v11 = (char *)v40 - v10;
  uint64_t v45 = *(void *)(v12 + 144);
  uint64_t v13 = type metadata accessor for Dynamic.State();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v40 - v15;
  size_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v42 = a2;
  uint64_t v18 = a2;
  uint64_t v19 = v46;
  v40[5] = v8;
  v17(v11, v18, v8);
  Swift::String_optional v44 = a4;
  sub_1BF894E94(v19, (uint64_t)v11, *a4, v16);
  int v20 = *(uint64_t (**)(char *))(v5 + 40);
  swift_retain();
  swift_retain();
  uint64_t v21 = v41;
  uint64_t v22 = v20(v16);
  if (v21)
  {
    uint64_t v25 = OUTLINED_FUNCTION_1_4();
    return v26(v25);
  }
  uint64_t v28 = v22;
  v40[3] = v5;
  v40[4] = v23;
  uint64_t v41 = v24;
  uint64_t v29 = type metadata accessor for Node();
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1BF8CBB88();
  swift_bridgeObjectRelease();
  uint64_t v47 = v30;
  if (v30 == MEMORY[0x1C18B43C0](v28, v29))
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v31 = OUTLINED_FUNCTION_1_4();
    v32(v31);
    return 0;
  }
  v40[0] = v16;
  v40[1] = v14;
  v40[2] = v13;
  char v33 = 0;
  do
  {
    char v34 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v34)
    {
      uint64_t v35 = *(void *)(v28 + 32 + 8 * v30);
      swift_retain();
    }
    else
    {
      uint64_t v35 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](&v47, v28, v29);
    swift_bridgeObjectRelease();
    uint64_t v36 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t *))(*(void *)v35 + 128))(v46, v42, v43, v44);
    swift_release();
    BOOL v37 = sub_1BF8C074C(v36);
    swift_release();
    v33 |= v37;
    uint64_t v30 = v47;
  }
  while (v30 != MEMORY[0x1C18B43C0](v28, v29));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v38 = OUTLINED_FUNCTION_0_8();
  v39(v38);
  if ((v33 & 1) == 0) {
    return 0;
  }
  return swift_retain();
}

uint64_t sub_1BF894E94@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v7 = *a1;
  *(void *)a4 = a1;
  uint64_t v8 = *(void *)(v7 + 80);
  uint64_t v9 = type metadata accessor for Dynamic.State();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(&a4[*(int *)(v9 + 36)], a2, v8);
  *(void *)&a4[*(int *)(v9 + 40)] = a3;
  return result;
}

uint64_t Dynamic.State.cursor.getter()
{
  return swift_retain();
}

uint64_t Dynamic.State.template.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t Dynamic.State.context.getter()
{
  return swift_retain();
}

void Dynamic.__allocating_init(kind:identifier:)()
{
}

void Dynamic.init(kind:identifier:)()
{
}

uint64_t sub_1BF894FE8()
{
  return swift_release();
}

uint64_t Dynamic.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_release();
  return v0;
}

uint64_t Dynamic.__deallocating_deinit()
{
  uint64_t v0 = Dynamic.deinit();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t Dynamic.description.getter()
{
  return 0x63696D616E7944;
}

uint64_t sub_1BF895068()
{
  return 0x63696D616E7944;
}

uint64_t sub_1BF895080()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Dynamic()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Dynamic(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Dynamic);
}

uint64_t sub_1BF8950F8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BF895198(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 8) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    uint64_t v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
    *(void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_1BF8952C8(uint64_t a1, uint64_t a2)
{
  swift_release();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  return swift_release();
}

void *sub_1BF895360(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(void *)(v4 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  swift_retain();
  v5(v8, v9, v4);
  *(void *)((*(void *)(v6 + 48) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v6 + 48) + 7 + v9) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

void *sub_1BF895414(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  *(void *)((*(void *)(v7 + 40) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 40) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_1BF8954DC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(void *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1BF89557C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v9, v10);
  *(void *)((*(void *)(v7 + 24) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 24) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1BF895634(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v9 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 8) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v8;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BF89577CLL);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v8 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if ((v6 & 0x80000000) != 0) {
    return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 8) & ~v7, v6, v4);
  }
  uint64_t v18 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v18) = -1;
  }
  return (v18 + 1);
}

void sub_1BF895790(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((*(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    unsigned int v12 = a3 - v9;
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v9;
    }
    else {
      int v16 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v17 = ~v9 + a2;
      bzero(a1, v11);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1BF89596CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v10 + 8] & ~v10;
          __swift_storeEnumTagSinglePayload(v19, a2, v8, v6);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Dynamic.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Embed<A, B, C, D>(name:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0_9();
  uint64_t v10 = v9;
  uint64_t v12 = *v11;
  unint64_t v14 = *v13;
  long long v15 = *(_OWORD *)(*v11 + 136);
  v19[0] = *(_OWORD *)(v10 + *MEMORY[0x1E4FBC5F0]);
  v19[1] = v15;
  uint64_t v20 = v16;
  uint64_t v21 = v17;
  long long v22 = *(_OWORD *)(v12 + 152);
  type metadata accessor for EmbedLayout();
  *(void *)&v19[0] = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF88E13C(v14);
  swift_retain();
  return sub_1BF8CA6A0(a1, a2, a3, (uint64_t *)v19, a5, 0, 0);
}

uint64_t MapEmbed<A, B, C, D>(name:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  OUTLINED_FUNCTION_0_9();
  uint64_t v14 = v13;
  uint64_t v16 = *v15;
  unint64_t v18 = *v17;
  long long v19 = *(_OWORD *)(*v15 + 136);
  v23[0] = *(_OWORD *)(v14 + *MEMORY[0x1E4FBC5F0]);
  v23[1] = v19;
  uint64_t v24 = v20;
  uint64_t v25 = v21;
  long long v26 = *(_OWORD *)(v16 + 152);
  type metadata accessor for EmbedLayout();
  *(void *)&v23[0] = v18;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF88E13C(v18);
  swift_retain();
  swift_retain();
  return sub_1BF8CA6A0(a1, a2, a3, (uint64_t *)v23, a5, a6, a7);
}

uint64_t Embed<A, B, C>(name:keyPath:sizing:context:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v26 = a8;
  uint64_t v27 = a5;
  uint64_t v28 = a2;
  uint64_t v29 = a1;
  OUTLINED_FUNCTION_0_9();
  uint64_t v14 = (uint64_t *)(v13 + *MEMORY[0x1E4FBC5F0]);
  uint64_t v15 = v14[1];
  unint64_t v30 = *v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v16;
  uint64_t v34 = v17;
  uint64_t v35 = v18;
  uint64_t v36 = a9;
  uint64_t v37 = a9;
  uint64_t v19 = type metadata accessor for EmbedFactory.Context();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  long long v22 = (char *)&v26 - v21;
  unint64_t v23 = *a4;
  uint64_t v31 = v15;
  uint64_t v32 = a6;
  uint64_t v33 = a7;
  uint64_t v34 = v26;
  uint64_t v35 = a9;
  type metadata accessor for EmbedFactory();
  unint64_t v30 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v27, v19);
  uint64_t v24 = v28;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF88E13C(v23);
  return sub_1BF89206C(v29, v24, a3, (uint64_t *)&v30, (uint64_t)v22, 0, 0);
}

uint64_t sub_1BF895D28@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t static ColumnSystem.specs(for:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_horizontalSizeClass);
  id v3 = objc_msgSend(a1, sel_verticalSizeClass);
  if (v2 == (id)2)
  {
    if (v3 == (id)2)
    {
      sub_1BF896534(0, &qword_1EBA902A8, (uint64_t (*)(uint64_t))sub_1BF895F70, MEMORY[0x1E4FBBE00]);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_1BF8CDA10;
      *(unsigned char *)(result + 32) = 0;
      *(_OWORD *)(result + 40) = xmmword_1BF8CDA20;
      *(unsigned char *)(result + 56) = 1;
      *(_OWORD *)(result + 64) = xmmword_1BF8CDA30;
      *(unsigned char *)(result + 80) = 2;
      *(void *)(result + 88) = 0x408EF00000000000;
      uint64_t v5 = (void *)(result + 96);
      goto LABEL_11;
    }
    if (v3 == (id)1) {
      goto LABEL_8;
    }
    return MEMORY[0x1E4FBC860];
  }
  if (v2 != (id)1) {
    return MEMORY[0x1E4FBC860];
  }
  if (v3 == (id)1)
  {
LABEL_8:
    sub_1BF896534(0, &qword_1EBA902A8, (uint64_t (*)(uint64_t))sub_1BF895F70, MEMORY[0x1E4FBBE00]);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_1BF8CD2F0;
    *(unsigned char *)(result + 32) = 1;
    *(void *)(result + 40) = 0;
    uint64_t v5 = (void *)(result + 48);
    goto LABEL_11;
  }
  if (v3 != (id)2) {
    return MEMORY[0x1E4FBC860];
  }
  sub_1BF896534(0, &qword_1EBA902A8, (uint64_t (*)(uint64_t))sub_1BF895F70, MEMORY[0x1E4FBBE00]);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1BF8CDA40;
  *(unsigned char *)(result + 32) = 0;
  *(_OWORD *)(result + 40) = xmmword_1BF8CDA50;
  *(unsigned char *)(result + 56) = 1;
  *(void *)(result + 64) = 0x4083F80000000000;
  uint64_t v5 = (void *)(result + 72);
LABEL_11:
  *uint64_t v5 = 0x7FEFFFFFFFFFFFFFLL;
  return result;
}

void sub_1BF895F70()
{
  if (!qword_1EBA8FCA8)
  {
    sub_1BF895FDC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA8FCA8);
    }
  }
}

void sub_1BF895FDC()
{
  if (!qword_1EBA90228)
  {
    sub_1BF896038();
    unint64_t v0 = sub_1BF8CBCD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90228);
    }
  }
}

unint64_t sub_1BF896038()
{
  unint64_t result = qword_1EBA901E0;
  if (!qword_1EBA901E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA901E0);
  }
  return result;
}

void ColumnSystem.options(layoutOptions:)(void *__src@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, __src, sizeof(__dst));
  uint64_t v5 = *(void *)(v2 + 8);
  long long v6 = *(_OWORD *)(v2 + 16);
  if (*(unsigned char *)(v2 + 32) == 1)
  {
    if ((unint64_t)v6 | v5 | *(void *)v2 | *((void *)&v6 + 1))
    {
      long long v8 = 1uLL;
      long long v9 = 0uLL;
      char v10 = 1;
      memset(v13, 0, sizeof(v13));
      char v14 = 1;
      sub_1BF891FF4((uint64_t)__dst);
      uint64_t v7 = v13;
    }
    else
    {
      memset(v11, 0, sizeof(v11));
      char v12 = 1;
      long long v8 = 0u;
      long long v9 = 0u;
      char v10 = 1;
      sub_1BF891FF4((uint64_t)__dst);
      uint64_t v7 = v11;
    }
  }
  else
  {
    v15[0] = *(void *)v2;
    v15[1] = v5;
    long long v16 = v6;
    char v17 = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    char v10 = 1;
    sub_1BF891FF4((uint64_t)__dst);
    uint64_t v7 = v15;
  }
  ColumnSystem.Options.init(columnSystem:layoutOptions:layoutMargins:)((double *)&v8, __src, (uint64_t)v7, a2);
}

void ColumnSystem.Options.init(columnSystem:layoutOptions:layoutMargins:)(double *a1@<X0>, const void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_1BF8964A0(a3, (uint64_t)v50);
  double v8 = *(double *)v50;
  double v9 = *(double *)&v50[1];
  double v10 = *(double *)&v50[2];
  double v11 = *(double *)&v50[3];
  double v12 = *a1;
  double v53 = a1[1];
  uint64_t v47 = *((void *)a1 + 3);
  uint64_t v48 = *((void *)a1 + 2);
  int v13 = *((unsigned __int8 *)a1 + 32);
  memcpy(__dst, a2, 0xC8uLL);
  char v14 = (void *)__dst[10];
  uint64_t v15 = static ColumnSystem.specs(for:)((void *)__dst[10]);
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    double v46 = v12;
    uint64_t v17 = __dst[0];
    uint64_t v18 = __dst[1];
    uint64_t v19 = (double *)(v15 + 48);
    while (1)
    {
      uint64_t v20 = *((char *)v19 - 16);
      double v22 = *(v19 - 1);
      double v21 = *v19;
      double v23 = OUTLINED_FUNCTION_0_10();
      if (v22 <= v23 && v23 < v21) {
        break;
      }
      v19 += 3;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        id v25 = v14;
        double v26 = OUTLINED_FUNCTION_0_10();
        sub_1BF891F44();
        swift_allocError();
        *(void *)uint64_t v27 = v25;
        *(double *)(v27 + 8) = v26;
        *(void *)(v27 + 16) = 0;
        *(unsigned char *)(v27 + 24) = 1;
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    if (!v13 || (v30 = 10.0, double v31 = 10.0, !(v48 | *(void *)&v53 | *(void *)&v46 | v47)))
    {
      double v31 = 28.0;
      if ((_BYTE)v20)
      {
        if (v20 == 1)
        {
          id v32 = objc_msgSend(v14, sel_horizontalSizeClass);
          if (objc_msgSend(v14, sel_verticalSizeClass) == (id)1 && v32 == (id)1) {
            double v30 = 18.0;
          }
          else {
            double v30 = 20.0;
          }
        }
        else
        {
          double v30 = 30.0;
        }
      }
      else
      {
        double v30 = 18.0;
      }
    }
    double v34 = OUTLINED_FUNCTION_0_10();
    Column.traits(for:viewportWidth:)(v14, &v49, v34);
    uint64_t v35 = v49;
    sub_1BF8964A0(a3, (uint64_t)v51);
    if (v51[32])
    {
      double v8 = *(double *)&__dst[11];
      double v9 = *(double *)&__dst[12];
      double v10 = *(double *)&__dst[13];
      double v11 = *(double *)&__dst[14];
    }
    double v36 = v8;
    double v37 = v31;
    double v53 = LayoutMarginAdjuster.adjust(layoutMargins:hSpacing:vSpacing:)(v36, v9, v10, v11);
    double v39 = v38;
    uint64_t v41 = v40;
    double v43 = v42;
    sub_1BF896598((uint64_t)__dst);
    double v44 = 1.0;
    if ((v35 & 4) == 0)
    {
      double v45 = OUTLINED_FUNCTION_0_10() - v39 - v43;
      if (v45 != 1.79769313e308) {
        double v44 = v45 / dbl_1BF8CDC88[v20];
      }
    }
    *(unsigned char *)a4 = v20;
    *(void *)(a4 + 8) = v35;
    *(double *)(a4 + 16) = v37 * v44;
    *(double *)(a4 + 24) = v37;
    *(double *)(a4 + 32) = v30 * v44;
    *(double *)(a4 + 40) = v30;
    *(void *)(a4 + 48) = 0;
    *(void *)(a4 + 56) = 0;
    *(void *)(a4 + 64) = v17;
    *(void *)(a4 + 72) = v18;
    *(double *)(a4 + 80) = v53;
    *(double *)(a4 + 88) = v39;
    *(void *)(a4 + 96) = v41;
    *(double *)(a4 + 104) = v43;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v28 + 8) = 0;
    *(void *)(v28 + 16) = 0;
    *(void *)uint64_t v28 = v14;
    *(unsigned char *)(v28 + 24) = 2;
    id v29 = v14;
LABEL_10:
    swift_willThrow();
    sub_1BF896598((uint64_t)__dst);
  }
}

uint64_t sub_1BF8964A0(uint64_t a1, uint64_t a2)
{
  sub_1BF896534(0, &qword_1EBA907D8, (uint64_t (*)(uint64_t))type metadata accessor for UIEdgeInsets, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BF896534(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1BF896598(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  id v3 = *(void **)(a1 + 144);
  swift_release();

  return a1;
}

void ColumnSystem.Options.column.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void ColumnSystem.Options.traits.getter(void *a1@<X8>)
{
}

void *ColumnSystem.Options.traits.setter(void *result)
{
  *(void *)(v1 + 8) = *result;
  return result;
}

uint64_t (*ColumnSystem.Options.traits.modify())()
{
  return nullsub_1;
}

uint64_t ColumnSystem.Options.columns.getter()
{
  return 6 * *v0 + 6;
}

double ColumnSystem.Options.origin.getter()
{
  return *(double *)(v0 + 88);
}

double ColumnSystem.Options.hSpacing.getter()
{
  return *(double *)(v0 + 16);
}

double ColumnSystem.Options.hSpacingUnscaled.getter()
{
  return *(double *)(v0 + 24);
}

double ColumnSystem.Options.vSpacing.getter()
{
  return *(double *)(v0 + 32);
}

double ColumnSystem.Options.vSpacingUnscaled.getter()
{
  return *(double *)(v0 + 40);
}

double ColumnSystem.Options.bounds.getter()
{
  return *(double *)(v0 + 48);
}

double ColumnSystem.Options.layoutMargins.getter()
{
  return *(double *)(v0 + 80);
}

double ColumnSystem.Options.columnWidth.getter()
{
  double v1 = dbl_1BF8CDC70[*(char *)v0];
  return (v0[8] - v0[11] - v0[13] - v0[2] * (v1 + -1.0)) / v1;
}

double ColumnSystem.Options.scaleFactor.getter()
{
  double v1 = 1.0;
  if ((v0[8] & 4) == 0)
  {
    uint64_t v2 = *v0;
    double v3 = *((double *)v0 + 13);
    double v4 = *((double *)v0 + 11);
    double v5 = CGRectGetWidth(*(CGRect *)(v0 + 48)) - v4 - v3;
    if (v5 != 1.79769313e308) {
      return v5 / dbl_1BF8CDC88[v2];
    }
  }
  return v1;
}

TeaTemplate::ColumnSystem::Options::Traits __swiftcall ColumnSystem.Options.Traits.init(rawValue:)(TeaTemplate::ColumnSystem::Options::Traits rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ColumnSystem.Options.Traits.compressed.getter(void *a1@<X8>)
{
}

void static ColumnSystem.Options.Traits.condensed.getter(void *a1@<X8>)
{
}

void static ColumnSystem.Options.Traits.noScaling.getter(void *a1@<X8>)
{
}

uint64_t ColumnSystem.Options.Traits.rawValue.getter()
{
  return *(void *)v0;
}

TeaTemplate::ColumnSystem::Options::Traits sub_1BF896758(Swift::Int *a1)
{
  return ColumnSystem.Options.Traits.init(rawValue:)(*a1);
}

uint64_t sub_1BF896764@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF896770(*a1, *v2, a2);
}

uint64_t sub_1BF896770@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

void sub_1BF89677C(void *a1@<X8>)
{
}

void sub_1BF896788(void *a1@<X8>)
{
}

uint64_t sub_1BF896790@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF89679C(*a1, *v2, a2);
}

uint64_t sub_1BF89679C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

uint64_t sub_1BF8967A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF8967B0(*a1, a2);
}

uint64_t sub_1BF8967B0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1BF8967D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF8967E0(*a1, a2);
}

uint64_t sub_1BF8967E0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1BF896800(uint64_t *a1)
{
  return j__OUTLINED_FUNCTION_0_3(*a1);
}

uint64_t sub_1BF896808(uint64_t *a1)
{
  return j__OUTLINED_FUNCTION_3(*a1);
}

uint64_t sub_1BF896814@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF896820(*a1, *v2, a2);
}

uint64_t sub_1BF896820@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1BF89682C(uint64_t *a1)
{
  return sub_1BF896838(*a1, *v1);
}

BOOL sub_1BF896838(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1BF896844()
{
  return sub_1BF89684C(*v0);
}

BOOL sub_1BF89684C(uint64_t a1)
{
  return a1 == 0;
}

TeaTemplate::ColumnSystem::Options::Traits sub_1BF896858@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = ColumnSystem.Options.Traits.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1BF896884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ColumnSystem.Options.Traits.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1BF8968AC()
{
  uint64_t v0 = NodeKind.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == NodeKind.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = OUTLINED_FUNCTION_2_3();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BF896938()
{
  return 1;
}

uint64_t sub_1BF896940(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x616D536172747865;
  unint64_t v3 = 0xEA00000000006C6CLL;
  uint64_t v4 = a1;
  uint64_t v5 = 0x616D536172747865;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6C6C616D73;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6D756964656DLL;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x72616C75676572;
      break;
    case 4:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x656772616CLL;
      break;
    case 5:
      uint64_t v5 = 0x72614C6172747865;
      unint64_t v3 = 0xEA00000000006567;
      break;
    case 6:
      uint64_t v5 = 0x7478456172747865;
      unint64_t v3 = 0xEF656772614C6172;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xEA00000000006C6CLL;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x6C6C616D73;
      break;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x6D756964656DLL;
      break;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x72616C75676572;
      break;
    case 4:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x656772616CLL;
      break;
    case 5:
      uint64_t v2 = 0x72614C6172747865;
      unint64_t v6 = 0xEA00000000006567;
      break;
    case 6:
      uint64_t v2 = 0x7478456172747865;
      unint64_t v6 = 0xEF656772614C6172;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_2_3();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1BF896B68(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x656D617266;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x656D617266;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6563617073;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7892834;
      break;
    case 3:
      uint64_t v5 = 0x6465626D65;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      uint64_t v2 = 0x6563617073;
      break;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v2 = 7892834;
      break;
    case 3:
      uint64_t v2 = 0x6465626D65;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_2_3();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t ColumnSystem.description.getter()
{
  if (*(unsigned char *)(v0 + 32) == 1)
  {
    if (*(void *)(v0 + 8) | *(void *)v0 | *(void *)(v0 + 16) | *(void *)(v0 + 24)) {
      return 1685217635;
    }
    else {
      return 0x746C7561666564;
    }
  }
  else
  {
    sub_1BF8CBE78();
    sub_1BF8CBAC8();
    type metadata accessor for UIEdgeInsets(0);
    sub_1BF8CBF48();
    sub_1BF8CBAC8();
    return 0;
  }
}

unint64_t sub_1BF896DB4()
{
  unint64_t result = qword_1EA1701B0;
  if (!qword_1EA1701B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1701B0);
  }
  return result;
}

unint64_t sub_1BF896E04()
{
  unint64_t result = qword_1EA1701B8[0];
  if (!qword_1EA1701B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA1701B8);
  }
  return result;
}

unint64_t sub_1BF896E54()
{
  unint64_t result = qword_1EBA8F438;
  if (!qword_1EBA8F438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA8F438);
  }
  return result;
}

unint64_t sub_1BF896EA4()
{
  unint64_t result = qword_1EBA8F440[0];
  if (!qword_1EBA8F440[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBA8F440);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnSystem(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ColumnSystem(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 33) = v3;
  return result;
}

uint64_t sub_1BF896F48(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF896F64(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 32) = v2;
  return result;
}

void type metadata accessor for ColumnSystem()
{
}

uint64_t getEnumTagSinglePayload for ColumnSystem.Options(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && a1[112])
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 3;
      int v2 = v3 - 3;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnSystem.Options(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 112) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

void type metadata accessor for ColumnSystem.Options()
{
}

void type metadata accessor for ColumnSystem.Options.Traits()
{
}

uint64_t sub_1BF89704C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1BF897064(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 64);
  return sub_1BF8970A8(v2, v3, v4);
}

uint64_t sub_1BF8970A8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BF8970C0(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void **)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v5;
  uint64_t v7 = *(void *)(a2 + 56);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 64);
  id v9 = v5;
  sub_1BF89704C(v6, v7, v8);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

uint64_t sub_1BF897160(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  long long v4 = *(void **)(a2 + 40);
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  unsigned __int8 v9 = *(unsigned char *)(a2 + 64);
  sub_1BF89704C(v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 64);
  *(unsigned char *)(a1 + 64) = v9;
  sub_1BF8970A8(v10, v11, v12);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

void *__swift_memcpy66_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x42uLL);
}

uint64_t sub_1BF8971EC(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;

  char v7 = *(unsigned char *)(a2 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  unsigned __int8 v10 = *(unsigned char *)(a1 + 64);
  *(unsigned char *)(a1 + 64) = v7;
  sub_1BF8970A8(v8, v9, v10);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

uint64_t sub_1BF897254(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 66))
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

uint64_t sub_1BF897294(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 66) = 1;
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
    *(unsigned char *)(result + 66) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for FontSizer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF897300@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  char v10 = *((unsigned char *)a3 + 16);
  uint64_t result = sub_1BF8985E0(a1, a5);
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = v8;
  *(void *)(a5 + 56) = v9;
  *(unsigned char *)(a5 + 64) = v10;
  *(unsigned char *)(a5 + 65) = a4;
  return result;
}

void *sub_1BF897358@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7 = v5;
  v177 = a4;
  uint64_t v12 = *a1;
  uint64_t v14 = *(void *)(v7 + 24);
  uint64_t v13 = *(void *)(v7 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v7, v14);
  uint64_t result = (*(void *(**)(char *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(__src, a1, a2, a3, *(void *)(v12 + 80), *(void *)(v12 + 88), v14, v13);
  if (!v6)
  {
    uint64_t v164 = (uint64_t)a1;
    uint64_t v16 = v177;
    uint64_t v17 = *(void *)__src;
    uint64_t v18 = *(void *)(v7 + 48);
    uint64_t v19 = *(void *)(v7 + 56);
    switch(*(unsigned char *)(v7 + 64))
    {
      case 1:
        uint64_t v158 = *(void *)__src;
        swift_bridgeObjectRetain();
        uint64_t v37 = LayoutContext.contextFrame(for:)();
        if (v37)
        {
          uint64_t v38 = v37;
          sub_1BF8970A8(v18, v19, 1u);
          uint64_t v22 = OUTLINED_FUNCTION_4_3();
          *(void *)(v22 + 16) = v158;
          double v23 = *(void **)(v7 + 40);
          double v39 = v16;
          OUTLINED_FUNCTION_1_6();
          uint64_t v48 = OUTLINED_FUNCTION_0_11(v40, v41, v42, v43, v44, v45, v46, v47, v150, v158, v164, __src[0]);
          v49(v48);
          uint64_t v35 = OUTLINED_FUNCTION_7_2();
          OUTLINED_FUNCTION_3_3((__n128 *)v35, v50, v51, v52, v53, v54, v55, v56, v39[1], v151, v159, v166, __src[0]);
          *(void *)(v35 + 104) = v38;
          *(void *)(v35 + 112) = v23;
          *(void *)(v35 + 120) = v167;
          double v36 = sub_1BF8983C8;
          goto LABEL_7;
        }
        OUTLINED_FUNCTION_5_1();
        if (*(void *)(a3 + 64)) {
          goto LABEL_17;
        }
        uint64_t v116 = v18;
        uint64_t v117 = v19;
        unsigned __int8 v118 = 1;
        goto LABEL_20;
      case 2:
        uint64_t v58 = OUTLINED_FUNCTION_4_3();
        *(void *)(v58 + 16) = v17;
        CGFloat v59 = *(void **)(v7 + 40);
        OUTLINED_FUNCTION_1_6();
        char v68 = OUTLINED_FUNCTION_0_11(v60, v61, v62, v63, v64, v65, v66, v67, v150, v156, v164, __src[0]);
        v69(v68);
        uint64_t v70 = OUTLINED_FUNCTION_7_2();
        OUTLINED_FUNCTION_2_4(v70, v71, v72, v73, v74, v75, v76, v77, v152, v160, v168, __src[0]);
        *(void *)(v17 + 120) = v169;
        char v78 = sub_1BF898288;
        goto LABEL_10;
      case 3:
        uint64_t v58 = OUTLINED_FUNCTION_4_3();
        *(void *)(v58 + 16) = v17;
        CGFloat v59 = *(void **)(v7 + 40);
        OUTLINED_FUNCTION_1_6();
        CGRect v87 = OUTLINED_FUNCTION_0_11(v79, v80, v81, v82, v83, v84, v85, v86, v150, v156, v164, __src[0]);
        v88(v87);
        uint64_t v89 = OUTLINED_FUNCTION_7_2();
        OUTLINED_FUNCTION_2_4(v89, v90, v91, v92, v93, v94, v95, v96, v153, v161, v170, __src[0]);
        *(void *)(v17 + 120) = v171;
        char v78 = sub_1BF898204;
LABEL_10:
        *(void *)(v58 + 24) = v78;
        *(void *)(v58 + 32) = v17;
        *a5 = v58 | 0x7000000000000000;
        swift_retain();
        return v59;
      case 4:
        if (v18 | v19)
        {
          uint64_t v97 = OUTLINED_FUNCTION_4_3();
          *(void *)(v97 + 16) = v17;
          double v23 = *(void **)(v7 + 40);
          OUTLINED_FUNCTION_1_6();
          v106 = OUTLINED_FUNCTION_0_11(v98, v99, v100, v101, v102, v103, v104, v105, v150, v156, v164, __src[0]);
          v107(v106);
          v108 = (__n128 *)swift_allocObject();
          OUTLINED_FUNCTION_3_3(v108, v109, v110, v111, v112, v113, v114, v115, v16[1], v154, v162, v172, __src[0]);
          v108[6].n128_u64[1] = (unint64_t)v23;
          v108[7].n128_u64[0] = v173;
          *(void *)(v97 + 24) = sub_1BF8984D0;
          *(void *)(v97 + 32) = v108;
          uint64_t v57 = v97 | 0x7000000000000000;
          goto LABEL_13;
        }
        v120 = *(void **)(v7 + 40);
        objc_msgSend(v120, sel_ascender);
        double v122 = v121;
        objc_msgSend(v120, sel_descender);
        double v124 = v122 + fabs(v123);
        objc_msgSend(v120, sel_descender);
        double v126 = fabs(v125);
        objc_msgSend(v120, sel_capHeight);
        double v128 = v124 - (v126 + v127);
        uint64_t v129 = OUTLINED_FUNCTION_4_3();
        *(void *)(v129 + 16) = v17;
        OUTLINED_FUNCTION_1_6();
        v138 = OUTLINED_FUNCTION_0_11(v130, v131, v132, v133, v134, v135, v136, v137, v150, v156, v164, __src[0]);
        v139(v138);
        v140 = (__n128 *)swift_allocObject();
        OUTLINED_FUNCTION_3_3(v140, v141, v142, v143, v144, v145, v146, v147, v16[1], v155, v163, v174, __src[0]);
        v140[6].n128_f64[1] = v128;
        v140[7].n128_u64[0] = v175;
        *(void *)(v129 + 24) = sub_1BF898548;
        *(void *)(v129 + 32) = v140;
        *a5 = v129 | 0x7000000000000000;
        uint64_t result = (void *)swift_retain();
        break;
      default:
        uint64_t v157 = *(void *)__src;
        swift_bridgeObjectRetain();
        uint64_t v20 = LayoutContext.contextFrame(for:)();
        if (v20)
        {
          uint64_t v21 = v20;
          sub_1BF8970A8(v18, v19, 0);
          uint64_t v22 = OUTLINED_FUNCTION_4_3();
          *(void *)(v22 + 16) = v157;
          double v23 = *(void **)(v7 + 40);
          uint64_t v24 = v16;
          OUTLINED_FUNCTION_1_6();
          uint64_t v33 = OUTLINED_FUNCTION_0_11(v25, v26, v27, v28, v29, v30, v31, v32, v150, v157, v164, __src[0]);
          v34(v33);
          uint64_t v35 = OUTLINED_FUNCTION_7_2();
          *(__n128 *)(v35 + 16) = v24[1];
          *(void *)(v35 + 32) = v23;
          memcpy((void *)(v35 + 40), __src, 0x42uLL);
          *(void *)(v35 + 112) = v21;
          *(void *)(v35 + 120) = v165;
          double v36 = sub_1BF89844C;
LABEL_7:
          *(void *)(v22 + 24) = v36;
          *(void *)(v22 + 32) = v35;
          uint64_t v57 = v22 | 0x7000000000000000;
LABEL_13:
          *a5 = v57;
          swift_retain();
          uint64_t result = v23;
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
          if (*(void *)(a3 + 64))
          {
LABEL_17:
            sub_1BF891F44();
            swift_allocError();
            *(void *)uint64_t v119 = v18;
            *(void *)(v119 + 8) = v19;
            *(void *)(v119 + 16) = 0;
            *(unsigned char *)(v119 + 24) = 3;
            swift_willThrow();
            uint64_t result = (void *)swift_release();
          }
          else
          {
            uint64_t v116 = v18;
            uint64_t v117 = v19;
            unsigned __int8 v118 = 0;
LABEL_20:
            sub_1BF8970A8(v116, v117, v118);
            uint64_t v148 = swift_allocObject();
            *(void *)(v148 + 40) = v16;
            *(void *)(v148 + 48) = &off_1F1B060A0;
            uint64_t v149 = swift_allocObject();
            *(void *)(v148 + 16) = v149;
            (*(void (**)(uint64_t, uint64_t, __n128 *))(v16[-1].n128_u64[1] + 16))(v149 + 16, v7, v16);
            uint64_t result = (void *)swift_release();
            *a5 = v148 | 0x2000000000000000;
          }
        }
        break;
    }
  }
  return result;
}

double sub_1BF897938(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v7 = a1;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 0.0;
  v11.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v11))
  {
    v9.origin.x = v7;
    v9.origin.y = a2;
    v9.size.width = a3;
    v9.size.height = a4;
    CGRectGetMinY(v9);
    v10.origin.x = v7;
    v10.origin.y = a2;
    v10.size.width = a3;
    v10.size.height = a4;
    return CGRectGetMinX(v10);
  }
  return v7;
}

double sub_1BF897A14(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  double v10 = a1;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 0.0;
  v14.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v14))
  {
    v12.origin.x = v10;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMinY(v12);
    objc_msgSend(a6, sel_descender);
    v13.origin.x = v10;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    return CGRectGetMinX(v13);
  }
  return v10;
}

double sub_1BF897B08(void *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7)
{
  double v12 = a2;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = 0.0;
  v15.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a2, v15))
  {
    objc_msgSend(a1, sel_ascender);
    objc_msgSend(a1, sel_descender);
    objc_msgSend(a1, sel_descender);
    objc_msgSend(a1, sel_capHeight);
    CGRectGetMinY(*(CGRect *)(a7 + 16));
    v14.origin.x = v12;
    v14.origin.y = a3;
    v14.size.width = a4;
    v14.size.height = a5;
    return CGRectGetMinX(v14);
  }
  return v12;
}

double sub_1BF897C3C(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, void *a7)
{
  double v12 = a1;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 0.0;
  v16.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v16))
  {
    CGRectGetMaxY(*(CGRect *)(a6 + 16));
    v14.origin.x = v12;
    v14.origin.y = a2;
    v14.size.width = a3;
    v14.size.height = a4;
    CGRectGetHeight(v14);
    objc_msgSend(a7, sel_descender);
    v15.origin.x = v12;
    v15.origin.y = a2;
    v15.size.width = a3;
    v15.size.height = a4;
    return CGRectGetMinX(v15);
  }
  return v12;
}

double sub_1BF897D4C(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  double v10 = a1;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 0.0;
  v14.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v14))
  {
    objc_msgSend(a6, sel_ascender);
    v12.origin.x = v10;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMinY(v12);
    v13.origin.x = v10;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    return CGRectGetMinX(v13);
  }
  return v10;
}

double sub_1BF897E50(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  double v10 = a1;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 0.0;
  v14.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v14))
  {
    objc_msgSend(a6, sel_descender);
    v12.origin.x = v10;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMinY(v12);
    v13.origin.x = v10;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    return CGRectGetMinX(v13);
  }
  return v10;
}

void *sub_1BF897F54@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X5>, uint64_t *a5@<X8>)
{
  return sub_1BF897358(a1, a2, a3, a4, a5);
}

uint64_t sub_1BF897F70()
{
  return 0;
}

unint64_t sub_1BF898058()
{
  unint64_t result = 0x736142726568746FLL;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      return result;
    case 2:
      uint64_t v2 = 0x7265646E65637361;
      goto LABEL_5;
    case 3:
      uint64_t v2 = 0x65646E6563736564;
LABEL_5:
      unint64_t v3 = v2;
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      unint64_t result = v3;
      break;
    case 4:
      if (*(_OWORD *)v0 == 0) {
        unint64_t result = 0x7361427473726966;
      }
      else {
        unint64_t result = 0x656E696C65736162;
      }
      break;
    default:
      unint64_t result = 0xD000000000000012;
      break;
  }
  return result;
}

uint64_t sub_1BF8981BC()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF898204()
{
  return sub_1BF8982B4((uint64_t (*)(void, void, uint64_t, void, void, void))sub_1BF897E50);
}

uint64_t objectdestroy_2Tm()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  sub_1BF8970A8(*(void *)(v0 + 96), *(void *)(v0 + 104), *(unsigned char *)(v0 + 112));
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_6_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1BF898288()
{
  return sub_1BF8982B4((uint64_t (*)(void, void, uint64_t, void, void, void))sub_1BF897D4C);
}

uint64_t sub_1BF8982B4(uint64_t (*a1)(void, void, uint64_t, void, void, void))
{
  return a1(*(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), v1 + 48, *(void *)(v1 + 120), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1BF8982E8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF898320()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  sub_1BF8970A8(*(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  return MEMORY[0x1F4186498](v0, 82, 7);
}

uint64_t sub_1BF89836C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);

  sub_1BF8970A8(*(void *)(v0 + 80), *(void *)(v0 + 88), *(unsigned char *)(v0 + 96));
  swift_release();

  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_6_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

double sub_1BF8983C8(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF897C3C(a1, a2, a3, a4, v4 + 32, *(void *)(v4 + 104), *(void **)(v4 + 112));
}

uint64_t sub_1BF8983F0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  sub_1BF8970A8(*(void *)(v0 + 88), *(void *)(v0 + 96), *(unsigned char *)(v0 + 104));
  swift_release();
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_6_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

double sub_1BF89844C(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF897B08(*(void **)(v4 + 32), a1, a2, a3, a4, v4 + 40, *(void *)(v4 + 112));
}

uint64_t sub_1BF898474()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);

  sub_1BF8970A8(*(void *)(v0 + 80), *(void *)(v0 + 88), *(unsigned char *)(v0 + 96));
  swift_release();
  return MEMORY[0x1F4186498](v0, 120, 7);
}

double sub_1BF8984D0(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF897A14(a1, a2, a3, a4, v4 + 32, *(void **)(v4 + 104));
}

uint64_t sub_1BF8984F4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);

  sub_1BF8970A8(*(void *)(v0 + 80), *(void *)(v0 + 88), *(unsigned char *)(v0 + 96));
  swift_release();
  return MEMORY[0x1F4186498](v0, 120, 7);
}

double sub_1BF898548(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF897938(a1, a2, a3, a4);
}

unint64_t sub_1BF898570()
{
  unint64_t result = qword_1EBA901D0;
  if (!qword_1EBA901D0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA901D0);
  }
  return result;
}

uint64_t type metadata accessor for FontSizer.Align()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8985E0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1BF8985F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t sub_1BF898604(uint64_t a1)
{
  return sub_1BF8970A8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1BF898614(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1BF89704C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1BF898660(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1BF89704C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1BF8970A8(v6, v7, v8);
  return a1;
}

uint64_t sub_1BF8986B8(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1BF8970A8(v4, v5, v6);
  return a1;
}

uint64_t sub_1BF898700(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4) {
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

uint64_t sub_1BF898740(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF898784(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_1BF89879C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)unint64_t result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t initializeWithCopy for ResizeSizer(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ResizeSizer(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t assignWithTake for ResizeSizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResizeSizer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for ResizeSizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResizeSizer()
{
  return &type metadata for ResizeSizer;
}

uint64_t sub_1BF898908@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v10 = *a1;
  uint64_t v11 = v4[3];
  uint64_t v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  uint64_t result = (uint64_t)(*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v12 + 16))(&v28, a1, a2, a3, *(void *)(v10 + 80), *(void *)(v10 + 88), v11, v12);
  if (!v5)
  {
    uint64_t v14 = v28;
    swift_retain();
    char v15 = SizerResult.nonIntegral.getter();
    sub_1BF8A9020(v15 & 1);
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    uint64_t v24 = v17;
    uint64_t v25 = v19;
    uint64_t v26 = v21;
    uint64_t v27 = v23;
    if (*((unsigned char *)a1 + 48) == 1) {
      CGRectGetHeight(*(CGRect *)&v24);
    }
    else {
      CGRectGetWidth(*(CGRect *)&v24);
    }
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v14;
    *a4 = result | 0x3000000000000000;
  }
  return result;
}

uint64_t sub_1BF898A84@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF898908(a1, a2, a3, a4);
}

uint64_t sub_1BF898A9C()
{
  return 0;
}

uint64_t sub_1BF898B18()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t AltText.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id AltText.attributedText.getter()
{
  return *(id *)(v0 + 16);
}

void AltText.init(identifier:logic:attributedText:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  uint64_t v8 = *a3;
  id v9 = a4;
  id v10 = sub_1BF8A63BC();

  *a5 = a1;
  a5[1] = a2;
  a5[2] = v9;
  a5[3] = v8;
  a5[4] = v10;
}

void destroy for AltText(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_release();
  unint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for AltText(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  unsigned __int8 v6 = (void *)a2[4];
  a1[4] = v6;
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_retain();
  id v8 = v6;
  return a1;
}

void *assignWithCopy for AltText(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  id v7 = (void *)a2[4];
  id v8 = (void *)a1[4];
  a1[4] = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for AltText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for AltText(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for AltText(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AltText()
{
  return &type metadata for AltText;
}

id sub_1BF898E34(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1BF89903C();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BF8CD2F0;
  id v7 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = sub_1BF899100();
  *(void *)(inited + 40) = a3;
  type metadata accessor for Key(0);
  sub_1BF899140();
  id v8 = v7;
  id v9 = a3;
  uint64_t v10 = sub_1BF8CB9F8();
  id v11 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  id v12 = sub_1BF8A6EB0(a1, a2, v10);

  return v12;
}

uint64_t sub_1BF898F2C@<X0>(uint64_t a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  Cursor.remainingBounds.getter();
  objc_msgSend(a2, sel_boundingRectWithSize_options_context_, 33, 0, v6, v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_beginAccess();
  uint64_t v12 = *(void *)(a1 + 488);
  uint64_t v13 = *(void *)(a1 + 496);
  id v14 = a2;
  Cursor.remainingBounds.getter();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v12;
  *(void *)(result + 24) = v13;
  *(void *)(result + 32) = v9;
  *(void *)(result + 40) = v11;
  *(void *)(result + 48) = v12;
  *(void *)(result + 56) = v13;
  *(void *)(result + 64) = v9;
  *(void *)(result + 72) = v11;
  *(void *)(result + 80) = v14;
  *(void *)(result + 88) = v16;
  *(void *)(result + 96) = v18;
  *a3 = result | 0x1000000000000000;
  return result;
}

uint64_t sub_1BF899010@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF898F2C(a1, *v2, a2);
}

uint64_t sub_1BF89902C()
{
  return 1954047348;
}

void sub_1BF89903C()
{
  if (!qword_1EA170240)
  {
    sub_1BF899094();
    unint64_t v0 = sub_1BF8CC028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA170240);
    }
  }
}

void sub_1BF899094()
{
  if (!qword_1EA170248)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA170248);
    }
  }
}

unint64_t sub_1BF899100()
{
  unint64_t result = qword_1EA170250;
  if (!qword_1EA170250)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA170250);
  }
  return result;
}

unint64_t sub_1BF899140()
{
  unint64_t result = qword_1EBA90250;
  if (!qword_1EBA90250)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA90250);
  }
  return result;
}

ValueMetadata *type metadata accessor for TextSizer()
{
  return &type metadata for TextSizer;
}

uint64_t sub_1BF8991A0()
{
  return MEMORY[0x1F4186498](v0, 104, 7);
}

void *sub_1BF8991D8()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  OUTLINED_FUNCTION_1_7();
  uint64_t v5 = v1[7];
  OUTLINED_FUNCTION_1_7();
  uint64_t v6 = v1[8];
  OUTLINED_FUNCTION_1_7();
  uint64_t v7 = v1[9];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v2;
  v9[3] = v0;
  v9[4] = v3;
  v9[5] = v4;
  v9[8] = v6;
  v9[9] = v7;
  v9[6] = v8;
  v9[7] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return v9;
}

Swift::Void __swiftcall LayoutContext.set(frame:direction:metadata:for:)(__C::CGRect frame, TeaTemplate::Direction direction, Swift::OpaquePointer_optional metadata, Swift::String_optional a4)
{
  if (a4.value._countAndFlagsBits)
  {
    uint64_t countAndFlagsBits = a4.value._countAndFlagsBits;
    uint64_t v5 = *(void *)&metadata.is_nil;
    rawValue = metadata.value._rawValue;
    CGFloat height = frame.size.height;
    CGFloat width = frame.size.width;
    CGFloat y = frame.origin.y;
    CGFloat x = frame.origin.x;
    char v11 = *(unsigned char *)direction;
    type metadata accessor for LayoutContextFrame();
    uint64_t v12 = swift_allocObject();
    *(CGFloat *)(v12 + 16) = x;
    *(CGFloat *)(v12 + 24) = y;
    *(CGFloat *)(v12 + 32) = width;
    *(CGFloat *)(v12 + 40) = height;
    *(unsigned char *)(v12 + 48) = v11;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1BF899C4C(v12, v5, countAndFlagsBits, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BF8B0268);
    swift_endAccess();
    if (rawValue)
    {
      OUTLINED_FUNCTION_6_2();
      uint64_t v13 = swift_bridgeObjectRetain();
      sub_1BF899C4C(v13, v5, countAndFlagsBits, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BF8B0180);
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for LayoutContextFrame()
{
  return self;
}

uint64_t LayoutContext.contextFrame(for:)()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_4();
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  if (v4 && (sub_1BF8999E0(v2, v0), (v5 & 1) != 0)) {
    OUTLINED_FUNCTION_4_4();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v3;
}

double LayoutContextFrame.frame.getter()
{
  return *(double *)(v0 + 16);
}

void LayoutContextFrame.direction.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 48);
}

uint64_t LayoutContextFrame.deinit()
{
  return v0;
}

uint64_t LayoutContextFrame.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 49, 7);
}

uint64_t sub_1BF8994A8(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBC868];
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 48) = a1;
  *(void *)(v1 + 56) = v2;
  return v1;
}

uint64_t sub_1BF8994C8(double a1, double a2)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v2[2];
  uint64_t v5 = v2[3];
  OUTLINED_FUNCTION_1_7();
  uint64_t v7 = v2[7];
  OUTLINED_FUNCTION_1_7();
  uint64_t v8 = v2[8];
  OUTLINED_FUNCTION_1_7();
  uint64_t v9 = v2[9];
  uint64_t v10 = v2[6];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  *(void *)(v11 + 24) = v5;
  *(double *)(v11 + 32) = a1;
  *(double *)(v11 + 40) = a2;
  *(void *)(v11 + 64) = v8;
  *(void *)(v11 + 72) = v9;
  *(void *)(v11 + 48) = v10;
  *(void *)(v11 + 56) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return v11;
}

void LayoutContext.set(context:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    OUTLINED_FUNCTION_6_2();
    swift_bridgeObjectRetain();
    uint64_t v5 = swift_retain();
    sub_1BF899C4C(v5, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BF8B0510);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
}

void __swiftcall LayoutContext.frame(for:)(__C::CGRect_optional *__return_ptr retstr, Swift::String a2)
{
  object = a2._object;
  uint64_t countAndFlagsBits = a2._countAndFlagsBits;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 56);
  if (!*(void *)(v6 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  sub_1BF8999E0(countAndFlagsBits, (uint64_t)object);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    CGPoint v8 = (CGPoint)0;
    Swift::Bool v10 = 1;
    CGSize v9 = (CGSize)0;
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_4_4();
  swift_endAccess();
  swift_bridgeObjectRelease();
  CGSize v11 = *(CGSize *)(v6 + 32);
  CGPoint v12 = *(CGPoint *)(v6 + 16);
  swift_release();
  CGSize v9 = v11;
  CGPoint v8 = v12;
  Swift::Bool v10 = 0;
LABEL_6:
  retstr->value.origin = v8;
  retstr->value.size = v9;
  retstr->is_nil = v10;
}

uint64_t LayoutContext.embedContext(for:)()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_4();
  uint64_t v3 = *(void *)(v1 + 72);
  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  if (v4 && (sub_1BF8999E0(v2, v0), (v5 & 1) != 0)) {
    OUTLINED_FUNCTION_4_4();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v3;
}

Swift::OpaquePointer_optional __swiftcall LayoutContext.metadata(for:)(Swift::String a1)
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_4();
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(v4 + 16);
  swift_bridgeObjectRetain();
  if (v5 && (unint64_t v6 = sub_1BF8999E0(v3, v1), (v7 & 1) != 0))
  {
    CGPoint v8 = *(void **)(*(void *)(v4 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
  }
  else
  {
    CGPoint v8 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  Swift::Bool v10 = v8;
  result.value._rawValue = v10;
  result.is_nil = v9;
  return result;
}

uint64_t LayoutContext.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutContext.__deallocating_deinit()
{
  LayoutContext.deinit();
  return MEMORY[0x1F4186488](v0, 80, 7);
}

unint64_t LayoutContext.description.getter()
{
  return 0xD000000000000015;
}

unint64_t sub_1BF8999BC()
{
  return LayoutContext.description.getter();
}

unint64_t sub_1BF8999E0(uint64_t a1, uint64_t a2)
{
  sub_1BF8CC1A8();
  sub_1BF8CBAB8();
  uint64_t v4 = sub_1BF8CC1D8();
  return sub_1BF899AC0(a1, a2, v4);
}

uint64_t sub_1BF899A58()
{
  sub_1BF8CC1A8();
  sub_1BF8CBAB8();
  uint64_t v0 = sub_1BF8CC1D8();
  return sub_1BF899BA4(v0);
}

unint64_t sub_1BF899AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    Swift::Bool v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BF8CC078() & 1) == 0)
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
      while (!v14 && (sub_1BF8CC078() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1BF899BA4(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1BF899BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_2_5();
  sub_1BF8B0288(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF899C4C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_2_5();
  a4(a1, a2, a3);
  *uint64_t v4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t method lookup function for LayoutContextFrame(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutContextFrame);
}

uint64_t type metadata accessor for LayoutContext()
{
  return self;
}

uint64_t method lookup function for LayoutContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutContext);
}

uint64_t sub_1BF899D24@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (*(unsigned char *)(a1 + 328) == 3)
  {
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = 0;
LABEL_8:
    *(void *)(v4 + 8) = 0;
    *(unsigned char *)(v4 + 24) = 7;
    return swift_willThrow();
  }
  if ((*v2 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 344);
      double v13 = Cursor.remainingBounds.getter();
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      uint64_t result = swift_allocObject();
      *(double *)(result + 16) = v13;
      *(void *)(result + 24) = v15;
      *(void *)(result + 32) = v12;
      *(void *)(result + 40) = v17;
      goto LABEL_10;
    }
LABEL_7:
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = 4;
    goto LABEL_8;
  }
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a1 + 360);
  double v6 = Cursor.remainingBounds.getter();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t result = swift_allocObject();
  *(double *)(result + 16) = v6;
  *(void *)(result + 24) = v8;
  *(void *)(result + 32) = v10;
  *(void *)(result + 40) = v5;
LABEL_10:
  if (qword_1EBA90300 != -1)
  {
    uint64_t v19 = result;
    swift_once();
    uint64_t result = v19;
  }
  char v18 = HIBYTE(word_1EBA8F7C8);
  *(unsigned char *)(result + 48) = word_1EBA8F7C8;
  *(unsigned char *)(result + 49) = v18;
  *a2 = result;
  return result;
}

uint64_t sub_1BF899EB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF899D24(a1, a2);
}

uint64_t sub_1BF899ED0()
{
  return 0x70536E6D756C6F63;
}

unsigned char *storeEnumTagSinglePayload for ColumnSpecSizer(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF89A02CLL);
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

ValueMetadata *type metadata accessor for ColumnSpecSizer()
{
  return &type metadata for ColumnSpecSizer;
}

uint64_t sub_1BF89A064()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t If<A>(_:then:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1BF89A180(a1, a2, a3, a4, a5);
}

{
  return sub_1BF89A180(a1, a2, a3, a4, a5);
}

uint64_t type metadata accessor for IfNode()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF89A0AC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BF89A0E4()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_1BF89A10C()
{
  return sub_1BF89A520();
}

uint64_t sub_1BF89A180(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9 = *a1;
  type metadata accessor for IfNode();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  sub_1BF88E120(v9);
  swift_retain();
  return sub_1BF89A10C();
}

uint64_t sub_1BF89A230()
{
  return sub_1BF89A6D8(*(uint64_t (**)(void))(v0 + 32));
}

uint64_t If<A, B>(_:then:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF89A3AC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

{
  return sub_1BF89A3AC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_1BF89A294()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1BF89A2CC()
{
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_1BF89A2F4()
{
  return sub_1BF89A598();
}

uint64_t sub_1BF89A3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_1_8();
  type metadata accessor for IfNode();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v10;
  v16[4] = v9;
  v16[5] = a7;
  v16[6] = a8;
  v16[7] = a9;
  v16[8] = v13;
  v16[9] = v12;
  swift_retain();
  swift_retain();
  return sub_1BF89A2F4();
}

uint64_t sub_1BF89A478(uint64_t (*a1)(void))
{
  sub_1BF89B278();
  swift_allocObject();
  uint64_t v2 = sub_1BF8CBB98();
  *int v3 = a1();
  type metadata accessor for Node();
  uint64_t result = v2;
  sub_1BF8A4268();
  return result;
}

uint64_t sub_1BF89A50C()
{
  return sub_1BF89A478(*(uint64_t (**)(void))(v0 + 64));
}

uint64_t sub_1BF89A520()
{
  OUTLINED_FUNCTION_0_12();
  uint64_t v0 = type metadata accessor for Conditional();
  OUTLINED_FUNCTION_2_6(v0, (uint64_t)&protocol witness table for Conditional<A>);
  char v3 = v1;
  return Node.init(kind:identifier:)(&v3, 0, 0);
}

uint64_t sub_1BF89A598()
{
  OUTLINED_FUNCTION_0_12();
  uint64_t v2 = *(void *)(v1 + 144);
  v10[0] = *(void *)(v0 + 136);
  v10[1] = v3;
  v10[2] = v2;
  v10[3] = v4;
  v10[4] = v5;
  v10[5] = v6;
  uint64_t v7 = type metadata accessor for ConditionalList();
  OUTLINED_FUNCTION_2_6(v7, (uint64_t)&protocol witness table for ConditionalList<A, B>);
  LOBYTE(v10[0]) = v8;
  return Node.init(kind:identifier:)(v10, 0, 0);
}

uint64_t IfNode.Else(elseBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = *(void *)(v5 + 136);
  v6[3] = *(void *)(v5 + 144);
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = v2[12];
  v2[12] = (uint64_t)sub_1BF89B2C8;
  v2[13] = (uint64_t)v6;
  swift_retain();
  sub_1BF8901F4(v7);
  return swift_retain();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  uint64_t v3 = *(void *)(v2 + 96);
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  sub_1BF8901F4(v3);
  swift_retain();
  return swift_retain();
}

uint64_t sub_1BF89A6D8(uint64_t (*a1)(void))
{
  sub_1BF89B278();
  swift_allocObject();
  uint64_t v2 = sub_1BF8CBB98();
  *uint64_t v3 = a1();
  type metadata accessor for Node();
  uint64_t result = v2;
  sub_1BF8A4268();
  return result;
}

uint64_t sub_1BF89A7B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 112) = sub_1BF89A958((uint64_t *)v2, a1, a2);
  *(unsigned char *)(v2 + 120) = v5;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v2 + 112);
  if (v7)
  {
    uint64_t v8 = type metadata accessor for Node();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1BF8CBB88();
    for (i = v9; v9 != MEMORY[0x1C18B43C0](v7, v8); uint64_t v9 = i)
    {
      char v10 = sub_1BF8CBBE8();
      sub_1BF8CBBA8();
      if (v10)
      {
        uint64_t v11 = *(void *)(v7 + 32 + 8 * v9);
        swift_retain();
      }
      else
      {
        uint64_t v11 = sub_1BF8CBE88();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1C18B43D0](&i, v7, v8);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(*(void *)v11 + 120))(a1, a2);
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BF89A958(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *(void *)(*a1 + 136);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1);
  uint64_t v11 = (char *)&v23[-1] - v10;
  uint64_t v12 = a1[8];
  uint64_t v13 = a1[9];
  __swift_project_boxed_opaque_existential_1((void *)(v9 + 40), v12);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v23, v12, v13);
  uint64_t v14 = v24;
  uint64_t v15 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a3, v7);
  char v16 = (*(uint64_t (**)(uint64_t, char *, uint64_t, void, uint64_t, uint64_t))(v15 + 8))(a2, v11, v7, *(void *)(v6 + 144), v14, v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  uint64_t v17 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  if (v16) {
    return ((uint64_t (*)(uint64_t))a1[10])(v17);
  }
  uint64_t v19 = (uint64_t (*)(uint64_t))a1[12];
  if (v19)
  {
    uint64_t v20 = swift_retain();
    uint64_t v18 = v19(v20);
    sub_1BF8901F4((uint64_t)v19);
  }
  else
  {
    type metadata accessor for Node();
    return sub_1BF8CBBD8();
  }
  return v18;
}

uint64_t sub_1BF89AB68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1BF89ADC8(v4, a1, a2);
  uint64_t v19 = v7;
  uint64_t v8 = type metadata accessor for Node();
  sub_1BF8CBC38();
  swift_getWitnessTable();
  if ((sub_1BF8CBCA8() & 1) != 0
    || (swift_bridgeObjectRetain(),
        uint64_t v9 = sub_1BF8CBB88(),
        swift_bridgeObjectRelease(),
        uint64_t v19 = v9,
        v9 == MEMORY[0x1C18B43C0](v7, v8)))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  char v11 = 0;
  do
  {
    char v12 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v12)
    {
      uint64_t v13 = *(void *)(v7 + 32 + 8 * v9);
      swift_retain();
    }
    else
    {
      uint64_t v13 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](&v19, v7, v8);
    swift_bridgeObjectRelease();
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v13 + 128))(a1, a2, a3, a4);
    swift_release();
    if (v5) {
      return swift_bridgeObjectRelease();
    }
    BOOL v15 = sub_1BF8C074C(v14);
    swift_release();
    v11 |= v15;
    uint64_t v9 = v19;
  }
  while (v9 != MEMORY[0x1C18B43C0](v7, v8));
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    return 0;
  }
  return swift_retain();
}

uint64_t sub_1BF89ADC8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *(void *)(*a1 + 136);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1);
  char v11 = (char *)&v23[-1] - v10;
  uint64_t v12 = a1[8];
  uint64_t v13 = a1[9];
  __swift_project_boxed_opaque_existential_1((void *)(v9 + 40), v12);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v23, v12, v13);
  uint64_t v14 = v24;
  uint64_t v15 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a3, v7);
  LOBYTE(a2) = (*(uint64_t (**)(uint64_t, char *, uint64_t, void, uint64_t, uint64_t))(v15 + 8))(a2, v11, v7, *(void *)(v6 + 144), v14, v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  uint64_t v16 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  uint64_t v17 = a1[14];
  if (a2)
  {
    if (!v17 || (a1[15] & 1) == 0) {
      return ((uint64_t (*)(uint64_t))a1[10])(v16);
    }
    goto LABEL_7;
  }
  if (v17 && (a1[15] & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    return v17;
  }
  uint64_t v19 = (uint64_t (*)(uint64_t))a1[12];
  if (!v19)
  {
    type metadata accessor for Node();
    return sub_1BF8CBBD8();
  }
  uint64_t v20 = swift_retain();
  uint64_t v17 = v19(v20);
  sub_1BF8901F4((uint64_t)v19);
  return v17;
}

void IfNode.__allocating_init(kind:identifier:)()
{
}

void IfNode.init(kind:identifier:)()
{
}

uint64_t sub_1BF89B044()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  sub_1BF8901F4(*(void *)(v0 + 96));
  return swift_bridgeObjectRelease();
}

uint64_t IfNode.deinit()
{
  uint64_t v0 = Node.deinit();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  sub_1BF8901F4(*(void *)(v0 + 96));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t IfNode.__deallocating_deinit()
{
  uint64_t v0 = IfNode.deinit();
  return MEMORY[0x1F4186488](v0, 121, 7);
}

uint64_t IfNode.description.getter()
{
  return 0;
}

unint64_t sub_1BF89B180()
{
  unint64_t result = qword_1EA170258[0];
  if (!qword_1EA170258[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EA170258);
  }
  return result;
}

uint64_t sub_1BF89B1D8()
{
  return IfNode.description.getter();
}

uint64_t sub_1BF89B1FC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for IfNode(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IfNode);
}

void sub_1BF89B278()
{
  if (!qword_1EBA907F0)
  {
    unint64_t v0 = sub_1BF8CC028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA907F0);
    }
  }
}

uint64_t LayoutItemList.values.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LayoutItemList.values.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*LayoutItemList.values.modify())()
{
  return j__swift_endAccess;
}

uint64_t LayoutItemList.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  LayoutItemList.init()();
  return v0;
}

uint64_t LayoutItemList.init()()
{
  sub_1BF8CBD98();
  uint64_t v1 = sub_1BF8CB9B8();
  uint64_t v2 = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 24) = v2;
  return v0;
}

uint64_t sub_1BF89B424(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1BF89B474(a1, a2);
  return v4;
}

uint64_t sub_1BF89B474(uint64_t a1, uint64_t a2)
{
  sub_1BF8CBD98();
  *(void *)(v2 + 16) = sub_1BF8CB9B8();
  *(void *)(v2 + 24) = MEMORY[0x1E4FBC860];
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t LayoutItemList.apply<A>(_:source:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v55 = a1;
  uint64_t v57 = *(void *)(*v4 + 80);
  uint64_t v58 = sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_4();
  uint64_t v54 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_4_5();
  uint64_t v52 = v9;
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  int v53 = (char *)&v48 - v12;
  uint64_t v56 = a3;
  uint64_t v13 = *(void *)(a3 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v48 - v17;
  uint64_t v20 = (void *)v4[3];
  uint64_t v19 = v4 + 3;
  uint64_t v21 = a2[4];
  uint64_t v22 = __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v23 = *(uint64_t (**)(void))(v21 + 8);
  swift_bridgeObjectRetain();
  int v50 = v22;
  int v51 = v23;
  uint64_t v24 = OUTLINED_FUNCTION_6_3();
  uint64_t v25 = v23(v24);
  unint64_t v49 = sub_1BF89B860(v25, v26, v20);
  LOBYTE(v23) = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v29 = v19 - 1;
  if (v23)
  {
    v28(v16, v55, v56);
    uint64_t v37 = v52;
    uint64_t v38 = v57;
    int v39 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload(v37, v39 ^ 1u, 1, v38);
    OUTLINED_FUNCTION_2_7();
    sub_1BF8CBC38();
    sub_1BF8CBC08();
    swift_endAccess();
    uint64_t v40 = OUTLINED_FUNCTION_6_3();
    uint64_t v42 = v41(v40);
    uint64_t v44 = v43;
    sub_1BF89C66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BF8A13AC);
    uint64_t v45 = *(void *)(*v19 + 16);
    uint64_t result = sub_1BF89C6E0(v45, (uint64_t (*)(BOOL))sub_1BF8A13AC);
    uint64_t v46 = *v19;
    *(void *)(v46 + 16) = v45 + 1;
    uint64_t v47 = v46 + 16 * v45;
    *(void *)(v47 + 32) = v42;
    *(void *)(v47 + 40) = v44;
  }
  else
  {
    v28(v18, v55, v56);
    uint64_t v30 = (uint64_t)v53;
    uint64_t v31 = v57;
    int v32 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload(v30, v32 ^ 1u, 1, v31);
    OUTLINED_FUNCTION_2_7();
    uint64_t v33 = v58;
    sub_1BF8CBC38();
    sub_1BF8CBBC8();
    uint64_t v34 = *v29;
    unint64_t v35 = v49;
    sub_1BF89C728(v49, v34);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v54 + 40))(v34+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(void *)(v54 + 72) * v35, v30, v33);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1BF89B860(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_1BF8CC078() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_1BF8CC078();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

uint64_t LayoutItemList.register(source:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v20 = *(void *)(*v2 + 80);
  uint64_t v22 = sub_1BF8CBD98();
  MEMORY[0x1F4188790](v22);
  uint64_t v21 = (uint64_t)&v20 - v4;
  uint64_t v5 = (void *)v2[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  BOOL v7 = *(uint64_t (**)(uint64_t))(v6 + 8);
  swift_bridgeObjectRetain();
  uint64_t v8 = OUTLINED_FUNCTION_5_3();
  uint64_t v9 = v7(v8);
  char v11 = sub_1BF89BAE4(v9, v10, v5);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = OUTLINED_FUNCTION_5_3();
    uint64_t v14 = v7(v13);
    uint64_t v16 = v15;
    sub_1BF89C66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BF8A13AC);
    uint64_t v17 = *(void *)(v2[3] + 16);
    sub_1BF89C6E0(v17, (uint64_t (*)(BOOL))sub_1BF8A13AC);
    uint64_t v18 = v2[3];
    *(void *)(v18 + 16) = v17 + 1;
    uint64_t v19 = v18 + 16 * v17;
    *(void *)(v19 + 32) = v14;
    *(void *)(v19 + 40) = v16;
    __swift_storeEnumTagSinglePayload(v21, 1, 1, v20);
    OUTLINED_FUNCTION_2_7();
    sub_1BF8CBC38();
    sub_1BF8CBC08();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1BF89BAE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_1BF8CC078();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_1BF8CC078() & 1) != 0) {
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

uint64_t LayoutItemList.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutItemList.__deallocating_deinit()
{
  LayoutItemList.deinit();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BF89BC08(void *a1)
{
  return LayoutItemList.register(source:)(a1);
}

uint64_t sub_1BF89BC2C(uint64_t a1, void *a2, uint64_t a3)
{
  return LayoutItemList.apply<A>(_:source:)(a1, a2, a3);
}

uint64_t LayoutItemList.description.getter()
{
  return 0;
}

uint64_t sub_1BF89BDD0()
{
  return LayoutItemList.description.getter();
}

uint64_t sub_1BF89BDF4@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_7();
  sub_1BF8CBD98();
  sub_1BF8CBC38();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v2 = sub_1BF8CBAF8();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1BF8CBC38();
  a1[3] = result;
  *a1 = v2;
  return result;
}

uint64_t sub_1BF89BEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1BF8CBD98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_1BF89BF4C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BF89BDF4(a1);
}

uint64_t LayoutItemList.flipRightToLeft(bounds:)(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_1_7();
  uint64_t v24 = *(void *)(v4 + 16);
  v19[1] = *(_OWORD *)(v11 + 80);
  double v20 = a1;
  double v21 = a2;
  double v22 = a3;
  double v23 = a4;
  uint64_t v12 = sub_1BF8CBD98();
  uint64_t v13 = sub_1BF8CBC38();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v16 = sub_1BF89C254((void (*)(char *, char *))sub_1BF89C798, (uint64_t)v19, v13, v12, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v15);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v5 + 24);
  swift_bridgeObjectRetain();
  return sub_1BF89B424(v16, v17);
}

uint64_t sub_1BF89C0A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  uint64_t v16 = sub_1BF8CBD98();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v22 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v22 - v18, a1, v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    uint64_t v20 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, double, double, double, double))(*(void *)(a3 + 24) + 8))(a2, a5, a6, a7, a8);
    (*(void (**)(char *, uint64_t))(*(void *)(a2 - 8) + 8))(v19, a2);
    uint64_t v20 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a4, v20, 1, a2);
}

uint64_t sub_1BF89C254(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a5;
  uint64_t v41 = a8;
  int v50 = a1;
  uint64_t v51 = a2;
  OUTLINED_FUNCTION_0_4();
  uint64_t v39 = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v52 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v45 = v12;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v37 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v42 = v20;
  uint64_t v43 = v19;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_4_5();
  uint64_t v38 = v21;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v37 - v23;
  uint64_t v25 = sub_1BF8CBC78();
  if (!v25) {
    return sub_1BF8CBBD8();
  }
  uint64_t v26 = v25;
  uint64_t v55 = sub_1BF8CB9B8();
  uint64_t v44 = sub_1BF8CBF28();
  sub_1BF8CBEC8();
  uint64_t v48 = a6;
  uint64_t result = sub_1BF8CBC68();
  if (v26 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v46 = (void (**)(char *))(v45 + 16);
    uint64_t v47 = v18;
    v45 += 8;
    while (1)
    {
      uint64_t v28 = (void (*)(char *, void))sub_1BF8CBCC8();
      (*v46)(v16);
      v28(v54, 0);
      uint64_t v29 = v53;
      v50(v16, v52);
      if (v29) {
        break;
      }
      uint64_t v53 = 0;
      uint64_t v30 = OUTLINED_FUNCTION_3_5();
      v31(v30);
      sub_1BF8CBF08();
      sub_1BF8CBC88();
      if (!--v26)
      {
        uint64_t v32 = v42;
        uint64_t v33 = v43;
        uint64_t v34 = v38;
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v38, v24, v43);
        sub_1BF8CBE28();
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
        return v55;
      }
    }
    uint64_t v35 = OUTLINED_FUNCTION_3_5();
    v36(v35);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v43);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v41, v52, v40);
  }
  return result;
}

uint64_t sub_1BF89C628@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t result = LayoutItemList.flipRightToLeft(bounds:)(a2, a3, a4, a5);
  *a1 = result;
  return result;
}

uint64_t sub_1BF89C654()
{
  return sub_1BF89C66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BF8A11BC);
}

uint64_t sub_1BF89C66C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_1BF89C6C8(uint64_t a1)
{
  return sub_1BF89C6E0(a1, (uint64_t (*)(BOOL))sub_1BF8A11BC);
}

uint64_t sub_1BF89C6E0(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_1BF89C728(unint64_t a1, uint64_t a2)
{
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  if ((result & 1) == 0) {
    uint64_t v5 = a2;
  }
  if (*(void *)(v5 + 16) <= a1) {
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_1BF89C77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF89BEDC(a1, a2);
}

uint64_t sub_1BF89C798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF89C0A0(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2, *(double *)(v2 + 32), *(double *)(v2 + 40), *(double *)(v2 + 48), *(double *)(v2 + 56));
}

uint64_t sub_1BF89C7C0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LayoutItemList()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LayoutItemList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutItemList);
}

uint64_t dispatch thunk of LayoutItemList.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1BF89C84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF89C77C(a1, a2);
}

uint64_t Log.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  return Log.init(_:)(a1, a2);
}

uint64_t Log.init(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  char v4 = 10;
  return Node.init(kind:identifier:)(&v4, 0, 0);
}

uint64_t sub_1BF89C8E8()
{
  if (qword_1EA1700A8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EA174990;
  sub_1BF8CBD08();
  sub_1BF88F314();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BF8CD2F0;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v2 + 64) = sub_1BF88F428();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v3;
  swift_bridgeObjectRetain();
  sub_1BF8CB998();

  swift_bridgeObjectRelease();
  return 0;
}

void Log.__allocating_init(kind:identifier:)()
{
}

void Log.init(kind:identifier:)()
{
}

uint64_t sub_1BF89CA34()
{
  return swift_bridgeObjectRelease();
}

uint64_t Log.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Log.__deallocating_deinit()
{
  uint64_t v0 = Log.deinit();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t Log.description.getter()
{
  return 677867340;
}

uint64_t sub_1BF89CB10()
{
  return Log.description.getter();
}

uint64_t sub_1BF89CB34()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Log()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Log(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Log);
}

uint64_t dispatch thunk of Log.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t LayoutItem.value.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_6_4();
  uint64_t v4 = v1 + *(void *)(v3 + 96);
  swift_beginAccess();
  OUTLINED_FUNCTION_6_4();
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(a1, v4);
}

uint64_t LayoutItem.value.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_6_4();
  uint64_t v4 = v1 + *(void *)(v3 + 96);
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_6_4();
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t (*LayoutItem.value.modify())()
{
  return j__swift_endAccess;
}

uint64_t LayoutItem.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  LayoutItem.init(_:)(a1);
  return v2;
}

uint64_t LayoutItem.init(_:)(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, *(void *)(*(void *)v1 + 80));
  OUTLINED_FUNCTION_7_3();
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  swift_endAccess();
  return v1;
}

uint64_t LayoutItem.apply<A>(_:source:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(*(void *)v3 + 80);
  uint64_t v8 = sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_4();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  int v15 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload(v4, v15 ^ 1u, 1, v7);
  uint64_t v16 = v3 + *(void *)(*(void *)v3 + 96);
  OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v16, v4, v8);
  return swift_endAccess();
}

uint64_t LayoutItem.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t LayoutItem.__deallocating_deinit()
{
  LayoutItem.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BF89D0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return LayoutItem.apply<A>(_:source:)(a1, a2, a3);
}

uint64_t LayoutItem.description.getter()
{
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  uint64_t v4 = sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_4();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_5_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v0, v4);
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
    uint64_t v13 = sub_1BF8CC238();
    sub_1BF8CBAC8();
    return v13;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v1, v2, v3);
    sub_1BF8CC238();
    sub_1BF8CBAC8();
    swift_bridgeObjectRelease();
    sub_1BF8CBAC8();
    sub_1BF8CC038();
    sub_1BF8CBAC8();
    uint64_t v11 = 0;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v3);
  }
  return v11;
}

uint64_t sub_1BF89D2CC()
{
  return LayoutItem.description.getter();
}

uint64_t sub_1BF89D2F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t v5 = sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_5_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v2, v1, v5);
  if (__swift_getEnumTagSinglePayload(v2, 1, v4) == 1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    *(void *)(a1 + 24) = v4;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(boxed_opaque_existential_0, v2, v4);
  }
  return result;
}

uint64_t sub_1BF89D438@<X0>(uint64_t a1@<X8>)
{
  return sub_1BF89D2F0(a1);
}

uint64_t LayoutItem.flipRightToLeft(bounds:)(double a1, double a2, double a3, double a4)
{
  uint64_t v10 = *v4;
  uint64_t v11 = *v4;
  uint64_t v12 = *(void *)(*v4 + 80);
  OUTLINED_FUNCTION_0_4();
  uint64_t v14 = v13;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v22 - v16;
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_4_6();
  uint64_t v19 = (uint64_t)v4 + *(void *)(v10 + 96);
  swift_beginAccess();
  uint64_t v20 = 1;
  if (!__swift_getEnumTagSinglePayload(v19, 1, v12))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v19, v12);
    (*(void (**)(uint64_t, double, double, double, double))(*(void *)(*(void *)(v11 + 88) + 24) + 8))(v12, a1, a2, a3, a4);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
    uint64_t v20 = 0;
  }
  __swift_storeEnumTagSinglePayload(v5, v20, 1, v12);
  return LayoutItem.__allocating_init(_:)(v5);
}

uint64_t sub_1BF89D648@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t result = LayoutItem.flipRightToLeft(bounds:)(a2, a3, a4, a5);
  *a1 = result;
  return result;
}

uint64_t sub_1BF89D674()
{
  uint64_t result = sub_1BF8CBD98();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for LayoutItem()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LayoutItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutItem);
}

uint64_t dispatch thunk of LayoutItem.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

double *sub_1BF89D74C@<X0>(double **a1@<X8>)
{
  double v2 = Cursor.remainingBounds.getter();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t result = (double *)swift_allocObject();
  uint64_t v10 = result;
  result[2] = v2;
  *((void *)result + 3) = v4;
  *((void *)result + 4) = v6;
  *((void *)result + 5) = v8;
  if (qword_1EBA90300 != -1) {
    uint64_t result = (double *)swift_once();
  }
  char v11 = HIBYTE(word_1EBA8F7C8);
  *((unsigned char *)v10 + 48) = word_1EBA8F7C8;
  *((unsigned char *)v10 + 49) = v11;
  *a1 = v10;
  return result;
}

double *sub_1BF89D810@<X0>(double **a1@<X8>)
{
  return sub_1BF89D74C(a1);
}

ValueMetadata *type metadata accessor for FillSizer()
{
  return &type metadata for FillSizer;
}

uint64_t sub_1BF89D838()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF89D848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BF89D878(a1, a2, a3, a4);
}

uint64_t sub_1BF89D858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BF89D878(a1, a2, a3, a4);
}

uint64_t sub_1BF89D868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BF89D878(a1, a2, a3, a4);
}

uint64_t sub_1BF89D878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t result = swift_beginAccess();
  if (byte_1EBA902F0 == 1)
  {
    if (qword_1EA1700A8 != -1) {
      swift_once();
    }
    id v11 = (id)qword_1EA174990;
    sub_1BF8CBD08();
    sub_1BF88F314();
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1BF8CDA10;
    uint64_t v13 = sub_1BF89DBD0(v7, 11765474, 0xA300000000000000);
    uint64_t v15 = v14;
    uint64_t v16 = MEMORY[0x1E4FBB1A0];
    *(void *)(v12 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v17 = sub_1BF88F428();
    *(void *)(v12 + 64) = v17;
    *(void *)(v12 + 32) = v13;
    *(void *)(v12 + 40) = v15;
    uint64_t v18 = sub_1BF89DD3C(v9, a3, a4);
    *(void *)(v12 + 96) = v16;
    *(void *)(v12 + 104) = v17;
    *(void *)(v12 + 72) = v18;
    *(void *)(v12 + 80) = v19;
    uint64_t v20 = OUTLINED_FUNCTION_0_13();
    *(void *)(v12 + 136) = v16;
    *(void *)(v12 + 144) = v17;
    *(void *)(v12 + 112) = v20;
    *(void *)(v12 + 120) = v21;
    sub_1BF8CB998();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BF89DA0C()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  sub_1BF89E2E0(v0);
  sub_1BF89E350();
  uint64_t result = sub_1BF8CBD88();
  qword_1EA174990 = result;
  return result;
}

uint64_t static Logging.debuggingEnabled.getter()
{
  return byte_1EBA902F0;
}

uint64_t static Logging.debuggingEnabled.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1EBA902F0 = a1;
  return result;
}

uint64_t (*static Logging.debuggingEnabled.modify())()
{
  return j__swift_endAccess;
}

uint64_t Logging.deinit()
{
  return v0;
}

uint64_t Logging.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for Logging()
{
  return self;
}

uint64_t method lookup function for Logging(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Logging);
}

uint64_t sub_1BF89DBD0(uint64_t result, uint64_t a2, uint64_t a3)
{
  v12[2] = a3;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result;
    v12[1] = v12;
    uint64_t v15 = MEMORY[0x1E4FBC860];
    sub_1BF8A6F78(0, 0, 0);
    uint64_t v4 = v15;
    if (v3)
    {
      uint64_t v5 = 0;
      do
      {
        if (v5 >= v3 - 1)
        {
          uint64_t v13 = 2105376;
          unint64_t v14 = 0xE300000000000000;
          sub_1BF8CBAC8();
          uint64_t v7 = v13;
          unint64_t v6 = v14;
        }
        else
        {
          unint64_t v6 = 0xE400000000000000;
          uint64_t v7 = 2082480160;
        }
        uint64_t v15 = v4;
        unint64_t v9 = *(void *)(v4 + 16);
        unint64_t v8 = *(void *)(v4 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1BF8A6F78(v8 > 1, v9 + 1, 1);
          uint64_t v4 = v15;
        }
        ++v5;
        *(void *)(v4 + 16) = v9 + 1;
        unint64_t v10 = v4 + 16 * v9;
        *(void *)(v10 + 32) = v7;
        *(void *)(v10 + 40) = v6;
      }
      while (v3 != v5);
    }
    uint64_t v13 = v4;
    sub_1BF89E244();
    sub_1BF89E290();
    uint64_t v11 = sub_1BF8CBA48();
    swift_release();
    return v11;
  }
  return result;
}

uint64_t sub_1BF89DD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    type metadata accessor for Node();
    sub_1BF8CC038();
    sub_1BF8CBAC8();
    sub_1BF8CBAC8();
    sub_1BF8CBAC8();
  }
  else
  {
    type metadata accessor for Node();
    sub_1BF8CC038();
  }
  return 0;
}

uint64_t sub_1BF89DE20(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  sub_1BF8CBE78();
  swift_bridgeObjectRelease();
  sub_1BF8CBC48();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  sub_1BF8CBC48();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  v9.origin.CGFloat x = a1;
  v9.origin.CGFloat y = a2;
  v9.size.CGFloat width = a3;
  v9.size.CGFloat height = a4;
  if (CGRectGetWidth(v9) != 1.79769313e308) {
    sub_1BF8CBC48();
  }
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  v10.origin.CGFloat x = a1;
  v10.origin.CGFloat y = a2;
  v10.size.CGFloat width = a3;
  v10.size.CGFloat height = a4;
  if (CGRectGetHeight(v10) != 1.79769313e308) {
    sub_1BF8CBC48();
  }
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  return 40;
}

uint64_t sub_1BF89DFC8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_beginAccess();
  if (byte_1EBA902F0 == 1)
  {
    if (qword_1EA1700A8 != -1) {
      swift_once();
    }
    id v4 = (id)qword_1EA174990;
    sub_1BF8CBD08();
    sub_1BF88F314();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1BF8CD2F0;
    uint64_t v6 = sub_1BF89DBD0(a2, 0, 0xE000000000000000);
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v5 + 64) = sub_1BF88F428();
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    sub_1BF8CB998();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BF89E0F8(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1();
  uint64_t result = OUTLINED_FUNCTION_2_8();
  if (byte_1EBA902F0 == 1)
  {
    if (qword_1EA1700A8 != -1) {
      swift_once();
    }
    id v4 = (id)qword_1EA174990;
    sub_1BF8CBD08();
    sub_1BF88F314();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1BF8CDA40;
    uint64_t v6 = sub_1BF89DBD0(a2, 0, 0xE000000000000000);
    uint64_t v8 = v7;
    uint64_t v9 = MEMORY[0x1E4FBB1A0];
    *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v10 = sub_1BF88F428();
    *(void *)(v5 + 64) = v10;
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    uint64_t v11 = OUTLINED_FUNCTION_0_13();
    *(void *)(v5 + 96) = v9;
    *(void *)(v5 + 104) = v10;
    *(void *)(v5 + 72) = v11;
    *(void *)(v5 + 80) = v12;
    sub_1BF8CB998();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BF89E244()
{
  if (!qword_1EBA90218)
  {
    unint64_t v0 = sub_1BF8CBC38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90218);
    }
  }
}

unint64_t sub_1BF89E290()
{
  unint64_t result = qword_1EBA90220;
  if (!qword_1EBA90220)
  {
    sub_1BF89E244();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA90220);
  }
  return result;
}

uint64_t sub_1BF89E2E0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1BF8CBAA8();

  return v3;
}

unint64_t sub_1BF89E350()
{
  unint64_t result = qword_1EA1702E0;
  if (!qword_1EA1702E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA1702E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for NonIntegralSizer()
{
  return &type metadata for NonIntegralSizer;
}

uint64_t sub_1BF89E3A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = *a1;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v4[3];
  uint64_t v11 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v10);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v11 + 16))(a1, a2, a3, *(void *)(v8 + 80), *(void *)(v8 + 88), v10, v11);
  if (v14) {
    return swift_deallocUninitializedObject();
  }
  *a4 = v9 | 0x5000000000000000;
  return result;
}

uint64_t sub_1BF89E4B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF89E3A0(a1, a2, a3, a4);
}

uint64_t sub_1BF89E4C8()
{
  return 0;
}

uint64_t sub_1BF89E564()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF89E5A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  type metadata accessor for DimensionCursor();
  sub_1BF8A58F4((uint64_t)v15);
  if (v15[0] == 3)
  {
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v4 + 8) = 0;
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = 0;
    *(unsigned char *)(v4 + 24) = 7;
    return swift_willThrow();
  }
  else
  {
    double v6 = v19;
    double v7 = v18;
    double v8 = v17;
    double v9 = v16;
    double v10 = dbl_1BF8CE270[v15[0]];
    double v11 = OUTLINED_FUNCTION_0_14();
    double v12 = DimensionCursor.position.getter();
    double v13 = OUTLINED_FUNCTION_0_14();
    uint64_t result = swift_allocObject();
    if (__OFSUB__(v3, 1))
    {
      __break(1u);
    }
    else
    {
      double v14 = (v8 - v7 - v6 - v9 * (v10 + -1.0)) / v10;
      *(double *)(result + 16) = v11 + (v9 + v14) * ceil((v12 - v13) / (v9 + v14));
      *(double *)(result + 24) = v9 * (double)(v3 - 1) + v14 * (double)v3;
      *(unsigned char *)(result + 32) = 1;
      *a1 = result;
    }
  }
  return result;
}

uint64_t sub_1BF89E744@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BF89E5A0(a1);
}

uint64_t sub_1BF89E75C()
{
  return 0x28736E6D756C6F63;
}

ValueMetadata *type metadata accessor for ColumnDimensionSizer()
{
  return &type metadata for ColumnDimensionSizer;
}

uint64_t sub_1BF89E7F4()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void *LayoutMarginAdjuster.__allocating_init(top:left:bottom:right:)(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = (void *)swift_allocObject();
  uint64_t v9 = *a2;
  uint64_t v10 = *a3;
  uint64_t v11 = *a4;
  result[2] = *a1;
  result[3] = v9;
  result[4] = v10;
  result[5] = v11;
  return result;
}

double LayoutMarginAdjuster.adjust(layoutMargins:hSpacing:vSpacing:)(double a1, double a2, double a3, double a4)
{
  unint64_t v9 = v4[2];
  unint64_t v15 = v9;
  sub_1BF89EDBC(v9);
  double v10 = OUTLINED_FUNCTION_3_7(&v15, a1);
  sub_1BF89EE1C(v9);
  unint64_t v11 = v4[3];
  unint64_t v15 = v11;
  sub_1BF89EDBC(v11);
  OUTLINED_FUNCTION_3_7(&v15, a2);
  sub_1BF89EE1C(v11);
  unint64_t v12 = v4[4];
  unint64_t v15 = v12;
  sub_1BF89EDBC(v12);
  OUTLINED_FUNCTION_3_7(&v15, a3);
  sub_1BF89EE1C(v12);
  unint64_t v13 = v4[5];
  unint64_t v15 = v13;
  sub_1BF89EDBC(v13);
  OUTLINED_FUNCTION_3_7(&v15, a4);
  sub_1BF89EE1C(v13);
  return v10;
}

unint64_t + infix(_:_:)()
{
  OUTLINED_FUNCTION_1_9();
  uint64_t v2 = OUTLINED_FUNCTION_4_7();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = v1;
  unint64_t v3 = OUTLINED_FUNCTION_2_9(v2 | 0x2000000000000000);
  return sub_1BF89EDD0(v3);
}

unint64_t - infix(_:_:)()
{
  OUTLINED_FUNCTION_1_9();
  uint64_t v2 = OUTLINED_FUNCTION_4_7();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = v1;
  unint64_t v3 = OUTLINED_FUNCTION_2_9(v2 | 0x4000000000000000);
  return sub_1BF89EDD0(v3);
}

unint64_t * infix(_:_:)()
{
  OUTLINED_FUNCTION_1_9();
  uint64_t v2 = OUTLINED_FUNCTION_4_7();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = v1;
  unint64_t v3 = OUTLINED_FUNCTION_2_9(v2 | 0x6000000000000000);
  return sub_1BF89EDD0(v3);
}

unint64_t / infix(_:_:)()
{
  OUTLINED_FUNCTION_1_9();
  uint64_t v2 = OUTLINED_FUNCTION_4_7();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = v1;
  unint64_t v3 = OUTLINED_FUNCTION_2_9(v2 | 0x8000000000000000);
  return sub_1BF89EDD0(v3);
}

unint64_t LayoutMarginAdjuster.top.getter@<X0>(unint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_15(*(void *)(v1 + 16), a1);
}

unint64_t LayoutMarginAdjuster.left.getter@<X0>(unint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_15(*(void *)(v1 + 24), a1);
}

unint64_t LayoutMarginAdjuster.bottom.getter@<X0>(unint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_15(*(void *)(v1 + 32), a1);
}

unint64_t LayoutMarginAdjuster.right.getter@<X0>(unint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_15(*(void *)(v1 + 40), a1);
}

void *LayoutMarginAdjuster.init(top:left:bottom:right:)(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t v7 = *a4;
  v4[2] = *a1;
  v4[3] = v5;
  v4[4] = v6;
  v4[5] = v7;
  return v4;
}

double sub_1BF89EAEC(unint64_t *a1, double a2, double a3, double a4)
{
  unint64_t v5 = *a1;
  if ((~*a1 & 0xF000000000000007) != 0)
  {
    switch(v5 >> 61)
    {
      case 1uLL:
        uint64_t v9 = v5 & 0x1FFFFFFFFFFFFFFFLL;
        unint64_t v10 = *(void *)(v9 + 16);
        unint64_t v11 = *(void *)(v9 + 24);
        unint64_t v29 = v10;
        sub_1BF89EDD0(v10);
        sub_1BF89EDD0(v10);
        sub_1BF89EDD0(v11);
        double v12 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v10);
        unint64_t v29 = v11;
        sub_1BF89EDD0(v11);
        double v13 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v11);
        sub_1BF89EE30(v10);
        sub_1BF89EE30(v11);
        a2 = v12 + v13;
        break;
      case 2uLL:
        uint64_t v14 = v5 & 0x1FFFFFFFFFFFFFFFLL;
        unint64_t v15 = *(void *)(v14 + 16);
        unint64_t v16 = *(void *)(v14 + 24);
        unint64_t v29 = v15;
        sub_1BF89EDD0(v15);
        sub_1BF89EDD0(v15);
        sub_1BF89EDD0(v16);
        double v17 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v15);
        unint64_t v29 = v16;
        sub_1BF89EDD0(v16);
        double v18 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v16);
        sub_1BF89EE30(v15);
        sub_1BF89EE30(v16);
        a2 = v17 - v18;
        break;
      case 3uLL:
        uint64_t v19 = v5 & 0x1FFFFFFFFFFFFFFFLL;
        unint64_t v20 = *(void *)(v19 + 16);
        unint64_t v21 = *(void *)(v19 + 24);
        unint64_t v29 = v20;
        sub_1BF89EDD0(v20);
        sub_1BF89EDD0(v20);
        sub_1BF89EDD0(v21);
        double v22 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v20);
        unint64_t v29 = v21;
        sub_1BF89EDD0(v21);
        double v23 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v21);
        sub_1BF89EE30(v20);
        sub_1BF89EE30(v21);
        a2 = v22 * v23;
        break;
      case 4uLL:
        uint64_t v24 = v5 & 0x1FFFFFFFFFFFFFFFLL;
        unint64_t v25 = *(void *)(v24 + 16);
        unint64_t v26 = *(void *)(v24 + 24);
        unint64_t v29 = v25;
        sub_1BF89EDD0(v25);
        sub_1BF89EDD0(v25);
        sub_1BF89EDD0(v26);
        double v27 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v25);
        unint64_t v29 = v26;
        sub_1BF89EDD0(v26);
        double v28 = sub_1BF89EAEC(&v29, a2, a3, a4);
        sub_1BF89EE30(v26);
        sub_1BF89EE30(v25);
        sub_1BF89EE30(v26);
        a2 = v27 / v28;
        break;
      case 5uLL:
        if (v5 == 0xA000000000000000) {
          a2 = a3;
        }
        else {
          a2 = a4;
        }
        break;
      default:
        a2 = *(double *)(v5 + 16);
        break;
    }
  }
  return a2;
}

unint64_t sub_1BF89EDBC(unint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return sub_1BF89EDD0(result);
  }
  return result;
}

unint64_t sub_1BF89EDD0(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      uint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BF89EE1C(unint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return sub_1BF89EE30(result);
  }
  return result;
}

unint64_t sub_1BF89EE30(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF89EE7C()
{
  sub_1BF89EE30(*(void *)(v0 + 16));
  sub_1BF89EE30(*(void *)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t *LayoutMarginAdjuster.deinit()
{
  sub_1BF89EE1C(v0[2]);
  sub_1BF89EE1C(v0[3]);
  sub_1BF89EE1C(v0[4]);
  sub_1BF89EE1C(v0[5]);
  return v0;
}

uint64_t LayoutMarginAdjuster.__deallocating_deinit()
{
  LayoutMarginAdjuster.deinit();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

unint64_t *initializeBufferWithCopyOfBuffer for LayoutMarginAdjustment(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF89EDD0(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for LayoutMarginAdjustment(unint64_t *a1)
{
  return sub_1BF89EE30(*a1);
}

unint64_t *assignWithCopy for LayoutMarginAdjustment(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF89EDD0(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_1BF89EE30(v4);
  return a1;
}

unint64_t *assignWithTake for LayoutMarginAdjustment(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_1BF89EE30(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutMarginAdjustment(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7B && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 122;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7A) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for LayoutMarginAdjustment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7A)
  {
    *(void *)uint64_t result = a2 - 123;
    if (a3 >= 0x7B) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7B) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BF89F078(void *a1)
{
  uint64_t v1 = *a1 >> 61;
  if (v1 <= 4) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 5;
  }
}

unint64_t *sub_1BF89F094(unint64_t *result, uint64_t a2)
{
  if (a2 < 5)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 61;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 5);
    unint64_t v3 = 0xA000000000000000;
  }
  *uint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for LayoutMarginAdjustment()
{
  return &type metadata for LayoutMarginAdjustment;
}

uint64_t type metadata accessor for LayoutMarginAdjuster()
{
  return self;
}

uint64_t method lookup function for LayoutMarginAdjuster(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutMarginAdjuster);
}

uint64_t dispatch thunk of LayoutMarginAdjuster.__allocating_init(top:left:bottom:right:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1BF89F124()
{
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v10 = *v9;
  sub_1BF8A0970((uint64_t)(v0 + 68), (uint64_t)&v24);
  if (!v25) {
    return sub_1BF8A0428((uint64_t)&v24);
  }
  sub_1BF8985E0(&v24, (uint64_t)v26);
  double v11 = OUTLINED_FUNCTION_2_10();
  if (sub_1BF8A0334(v11, v12, v13, v14))
  {
    uint64_t v15 = v27;
    uint64_t v16 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    char v23 = v10;
    OUTLINED_FUNCTION_1_7();
    uint64_t v17 = v0[8];
    if (v17) {
      uint64_t v18 = v0[7];
    }
    else {
      uint64_t v18 = 0;
    }
    v22[0] = v18;
    v22[1] = v17;
    uint64_t v21 = v0[11];
    unint64_t v20 = *(void (**)(uint64_t, uint64_t, char *, void *, uint64_t *, uint64_t, uint64_t, double, double, double, double))(v16 + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    v20(v8, v6, &v23, v22, &v21, v15, v16, v4, v3, v2, v1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

void sub_1BF89F278(uint64_t a1)
{
  uint64_t v6 = v1;
  OUTLINED_FUNCTION_1();
  v65.origin.CGFloat x = 0.0;
  v65.origin.CGFloat y = 0.0;
  v65.size.CGFloat width = 0.0;
  v65.size.CGFloat height = 0.0;
  if (CGRectEqualToRect(v63, v65)) {
    return;
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  if (v8) {
    return;
  }
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8();
  if (v8) {
    return;
  }
  if (*(void *)(a1 + 16))
  {
    sub_1BF8CC1A8();
    sub_1BF8CC1B8();
    uint64_t v9 = sub_1BF8CC1D8();
    char v10 = *(unsigned char *)(a1 + 32);
    char v11 = v10 & 0x3F;
    for (unint64_t i = v9 & ~(-1 << v10);
          ((*(void *)(a1 + 56 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0;
          unint64_t i = (i + 1) & ~(-1 << v10))
    {
      uint64_t v13 = *(void *)(a1 + 48) + 24 * i;
      if (*(unsigned char *)(v13 + 16) == 1 && *(_OWORD *)v13 == 0)
      {
        double v20 = 0.0;
        double v21 = 0.0;
LABEL_38:
        char v30 = *(unsigned char *)(v6 + 48);
        if (v30)
        {
          double v61 = v21;
          CGFloat Width = CGRectGetWidth(*(CGRect *)(v6 + 96));
          OUTLINED_FUNCTION_1_10();
          double v62 = v20;
          double v32 = v20 + *(double *)(v6 + 512) + v2;
          *(CGFloat *)(v6 + 504) = Width;
          *(double *)(v6 + 512) = v32;
          OUTLINED_FUNCTION_1_10();
          double v33 = v5;
          CGFloat v34 = v4;
          CGFloat v35 = v3;
          CGFloat v36 = v2;
          if ((*(unsigned char *)(v6 + 480) & 1) == 0)
          {
            double v33 = OUTLINED_FUNCTION_4_8();
            CGFloat v34 = v37;
            CGFloat v35 = v38;
            CGFloat v36 = v39;
          }
          *(double *)(v6 + 448) = v33;
          *(CGFloat *)(v6 + 456) = v34;
          *(CGFloat *)(v6 + 464) = v35;
          *(CGFloat *)(v6 + 472) = v36;
          *(unsigned char *)(v6 + 480) = 0;
          OUTLINED_FUNCTION_1_10();
          uint64_t v60 = *(void *)(v6 + 488);
          v64.origin.CGFloat x = v33;
          v64.origin.CGFloat y = v34;
          v64.size.CGFloat width = v35;
          v64.size.CGFloat height = v36;
          CGFloat MaxY = CGRectGetMaxY(v64);
          double v21 = v61;
          *(void *)(v6 + 488) = v60;
          *(CGFloat *)(v6 + 496) = MaxY;
          double v20 = v62;
        }
        else
        {
          OUTLINED_FUNCTION_1_10();
          double v41 = v21 + *(double *)(v6 + 504) + v3;
          CGFloat Height = CGRectGetHeight(*(CGRect *)(v6 + 96));
          *(double *)(v6 + 504) = v41;
          *(CGFloat *)(v6 + 512) = Height;
          OUTLINED_FUNCTION_1_10();
          double v43 = OUTLINED_FUNCTION_2_10();
          if ((v47 & 1) == 0) {
            double v43 = OUTLINED_FUNCTION_4_8();
          }
          *(double *)(v6 + 448) = v43;
          *(void *)(v6 + 456) = v44;
          *(void *)(v6 + 464) = v45;
          *(void *)(v6 + 472) = v46;
          *(unsigned char *)(v6 + 480) = 0;
          CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v43);
          OUTLINED_FUNCTION_1_10();
          *(CGFloat *)(v6 + 488) = MaxX;
        }
        if (*(void *)(a1 + 16))
        {
          sub_1BF8CC1A8();
          sub_1BF8CC1B8();
          uint64_t v49 = sub_1BF8CC1D8();
          uint64_t v50 = -1 << *(unsigned char *)(a1 + 32);
          unint64_t v51 = v49 & ~v50;
          if ((*(void *)(a1 + 56 + ((v51 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v51))
          {
            uint64_t v52 = ~v50;
            while (1)
            {
              uint64_t v53 = *(void *)(a1 + 48) + 24 * v51;
              if (*(unsigned char *)(v53 + 16) == 1 && !(*(void *)v53 ^ 1 | *(void *)(v53 + 8))) {
                break;
              }
              unint64_t v51 = (v51 + 1) & v52;
              if (((*(void *)(a1 + 56 + ((v51 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v51) & 1) == 0) {
                return;
              }
            }
            OUTLINED_FUNCTION_1_10();
            uint64_t v54 = *(void *)(v6 + 64);
            if (v54)
            {
              uint64_t v55 = *(void *)(v6 + 56);
              double v56 = *(double *)(v6 + 72);
              double v57 = *(double *)(v6 + 80);
              swift_bridgeObjectRetain();
              if (v30)
              {
                double v58 = v57 - (v20 + OUTLINED_FUNCTION_8_0());
                if (v58 < 0.0) {
                  double v57 = 0.0;
                }
                else {
                  double v57 = v58;
                }
                *(void *)(v6 + 56) = v55;
                *(void *)(v6 + 64) = v54;
                *(double *)(v6 + 72) = v56;
              }
              else
              {
                double v59 = v56 - (v21 + OUTLINED_FUNCTION_7());
                if (v59 < 0.0) {
                  double v59 = 0.0;
                }
                *(void *)(v6 + 56) = v55;
                *(void *)(v6 + 64) = v54;
                *(double *)(v6 + 72) = v59;
              }
              *(double *)(v6 + 80) = v57;
              swift_bridgeObjectRelease();
            }
          }
        }
        return;
      }
    }
  }
  else
  {
    char v11 = *(unsigned char *)(a1 + 32) & 0x3F;
  }
  uint64_t v14 = a1 + 56;
  uint64_t v15 = 1 << v11;
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(a1 + 56);
  OUTLINED_FUNCTION_1_7();
  int64_t v18 = 0;
  int64_t v19 = (unint64_t)(v15 + 63) >> 6;
  double v20 = 0.0;
  double v21 = 0.0;
  while (v17)
  {
    unint64_t v22 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v23 = v22 | (v18 << 6);
LABEL_32:
    uint64_t v27 = *(void *)(a1 + 48) + 24 * v23;
    if (*(unsigned char *)(v27 + 16) == 1)
    {
      if (*(_OWORD *)v27 >= 2uLL)
      {
        double v28 = v4 - *(double *)(v6 + 496);
        double v29 = v5 - *(double *)(v6 + 488);
        goto LABEL_36;
      }
    }
    else
    {
      double v29 = *(double *)v27;
      double v28 = *(double *)(v27 + 8);
LABEL_36:
      double v21 = v21 + v29;
      double v20 = v20 + v28;
    }
  }
  int64_t v24 = v18 + 1;
  if (__OFADD__(v18, 1))
  {
    __break(1u);
    goto LABEL_63;
  }
  if (v24 >= v19) {
    goto LABEL_38;
  }
  unint64_t v25 = *(void *)(v14 + 8 * v24);
  ++v18;
  if (v25) {
    goto LABEL_31;
  }
  int64_t v18 = v24 + 1;
  if (v24 + 1 >= v19) {
    goto LABEL_38;
  }
  unint64_t v25 = *(void *)(v14 + 8 * v18);
  if (v25) {
    goto LABEL_31;
  }
  int64_t v18 = v24 + 2;
  if (v24 + 2 >= v19) {
    goto LABEL_38;
  }
  unint64_t v25 = *(void *)(v14 + 8 * v18);
  if (v25)
  {
LABEL_31:
    unint64_t v17 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v18 << 6);
    goto LABEL_32;
  }
  int64_t v26 = v24 + 3;
  if (v26 >= v19) {
    goto LABEL_38;
  }
  unint64_t v25 = *(void *)(v14 + 8 * v26);
  if (v25)
  {
    int64_t v18 = v26;
    goto LABEL_31;
  }
  while (1)
  {
    int64_t v18 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v18 >= v19) {
      goto LABEL_38;
    }
    unint64_t v25 = *(void *)(v14 + 8 * v18);
    ++v26;
    if (v25) {
      goto LABEL_31;
    }
  }
LABEL_63:
  __break(1u);
}

double Cursor.remainingBounds.getter()
{
  OUTLINED_FUNCTION_1_7();
  double v1 = *(double *)(v0 + 488);
  v3.origin.CGFloat x = OUTLINED_FUNCTION_9_0();
  CGRectGetWidth(v3);
  v4.origin.CGFloat x = OUTLINED_FUNCTION_9_0();
  CGRectGetHeight(v4);
  return v1;
}

uint64_t Pass.DynamicOptions.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double Pass.DynamicOptions.flexibleArea.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t Pass.cursorFramePass.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  if (v2) {
    uint64_t v3 = *v1;
  }
  else {
    uint64_t v3 = 0;
  }
  *a1 = v3;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

double Cursor.origin.getter()
{
  return *(double *)(v0 + 16);
}

double Cursor.initialOrigin.getter()
{
  return *(double *)(v0 + 32);
}

void Cursor.direction.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 48);
}

uint64_t Cursor.pass.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v3 = *(void *)(v1 + 80);
  *(void *)a1 = *(void *)(v1 + 56);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 64);
  *(void *)(a1 + 24) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t Cursor.resizing.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 88);
  return swift_retain();
}

double Cursor.bounds.getter()
{
  return *(double *)(v0 + 96);
}

uint64_t Cursor.layoutOptions.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + 128);
  memcpy(__dst, v3, sizeof(__dst));
  memcpy(a1, v3, 0xC8uLL);
  return sub_1BF891FF4((uint64_t)__dst);
}

uint64_t Cursor.reversed.getter()
{
  return *(unsigned __int8 *)(v0 + 440);
}

double Cursor.scaleFactor.getter()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 328);
  double v2 = 1.0;
  if (v1 != 3 && (*(unsigned char *)(v0 + 336) & 4) == 0)
  {
    CGRectGetWidth(*(CGRect *)(v0 + 376));
    OUTLINED_FUNCTION_8();
    if (!v4) {
      return v3 / dbl_1BF8CE548[(char)v1];
    }
  }
  return v2;
}

double Cursor.absoluteFrame.getter()
{
  double v1 = *(double *)(v0 + 32);
  sub_1BF89F9D8(v0);
  sub_1BF89FAAC(v0);
  return v1;
}

double sub_1BF89F9D8(uint64_t a1)
{
  uint64_t v2 = a1 + 480;
  double v3 = *(double *)(a1 + 16);
  swift_beginAccess();
  double MaxX = v3;
  if ((*(unsigned char *)(a1 + 480) & 1) == 0) {
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 448));
  }
  if (v3 > MaxX) {
    double MaxX = v3;
  }
  double v5 = MaxX - v3;
  if (*(unsigned char *)(v2 + 57) == 1)
  {
    CGFloat v6 = *(double *)(a1 + 96);
    CGFloat v7 = *(double *)(a1 + 104);
    CGFloat v8 = *(double *)(a1 + 112);
    CGFloat v9 = *(double *)(a1 + 120);
    v11.origin.CGFloat x = v6;
    v11.origin.CGFloat y = v7;
    v11.size.CGFloat width = v8;
    v11.size.CGFloat height = v9;
    if (CGRectGetWidth(v11) != 1.79769313e308)
    {
      v12.origin.CGFloat x = v6;
      v12.origin.CGFloat y = v7;
      v12.size.CGFloat width = v8;
      v12.size.CGFloat height = v9;
      return CGRectGetWidth(v12);
    }
  }
  return v5;
}

double sub_1BF89FAAC(uint64_t a1)
{
  uint64_t v2 = a1 + 480;
  double v3 = *(double *)(a1 + 24);
  swift_beginAccess();
  double MaxY = v3;
  if ((*(unsigned char *)(a1 + 480) & 1) == 0) {
    double MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 448));
  }
  if (v3 > MaxY) {
    double MaxY = v3;
  }
  double v5 = MaxY - v3;
  if (*(unsigned char *)(v2 + 58) == 1)
  {
    CGFloat v6 = *(double *)(a1 + 96);
    CGFloat v7 = *(double *)(a1 + 104);
    CGFloat v8 = *(double *)(a1 + 112);
    CGFloat v9 = *(double *)(a1 + 120);
    v11.origin.CGFloat x = v6;
    v11.origin.CGFloat y = v7;
    v11.size.CGFloat width = v8;
    v11.size.CGFloat height = v9;
    if (CGRectGetHeight(v11) != 1.79769313e308)
    {
      v12.origin.CGFloat x = v6;
      v12.origin.CGFloat y = v7;
      v12.size.CGFloat width = v8;
      v12.size.CGFloat height = v9;
      return CGRectGetHeight(v12);
    }
  }
  return v5;
}

__n128 Cursor.filledBounds.getter@<Q0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_7();
  char v3 = *(unsigned char *)(v1 + 480);
  __n128 result = *(__n128 *)(v1 + 448);
  long long v5 = *(_OWORD *)(v1 + 464);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v3;
  return result;
}

double Cursor.position.getter()
{
  OUTLINED_FUNCTION_1_7();
  return *(double *)(v0 + 488);
}

double Cursor.filledArea.getter()
{
  OUTLINED_FUNCTION_1_7();
  return *(double *)(v0 + 504);
}

void Cursor.sizingBehavior.getter(unsigned char *a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 538);
  *a1 = *(unsigned char *)(v1 + 537);
  a1[1] = v2;
}

uint64_t sub_1BF89FC40(uint64_t a1, long long *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char *a8, uint64_t *a9, char a10)
{
  OUTLINED_FUNCTION_1();
  memcpy(__dst, v17, sizeof(__dst));
  char v18 = *a3;
  char v19 = *a8;
  char v20 = a8[1];
  uint64_t v21 = *a9;
  long long v22 = a2[1];
  long long v39 = *a2;
  long long v40 = v22;
  long long v23 = a2[3];
  long long v41 = a2[2];
  long long v42 = v23;
  long long v24 = a2[5];
  long long v43 = a2[4];
  long long v44 = v24;
  long long v45 = a2[6];
  char v38 = v18;
  long long v36 = 0u;
  long long v37 = 0u;
  v35[0] = v19;
  v35[1] = v20;
  uint64_t v34 = v21;
  double v25 = OUTLINED_FUNCTION_2_10();
  return sub_1BF89FD4C(v26, v27, v28, a4, v29, a5, a6, a7, v25, v30, v31, v32, v35, &v34, a10);
}

uint64_t sub_1BF89FD4C(void *a1, long long *a2, char *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10, double a11, double a12, char *a13, uint64_t *a14, char a15)
{
  return sub_1BF89FE28(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1BF89FE28(void *__src, long long *a2, char *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10, double a11, double a12, char *a13, uint64_t *a14, char a15)
{
  long long v34 = *a2;
  long long v32 = a2[2];
  long long v33 = a2[1];
  long long v30 = a2[4];
  long long v31 = a2[3];
  long long v28 = a2[6];
  long long v29 = a2[5];
  char v19 = *a3;
  long long v26 = a5[1];
  long long v27 = *a5;
  char v20 = *a13;
  char v21 = a13[1];
  uint64_t v22 = *a14;
  *(_OWORD *)(v15 + 448) = 0u;
  *(_OWORD *)(v15 + 464) = 0u;
  *(unsigned char *)(v15 + 480) = 1;
  *(void *)(v15 + 504) = 0;
  *(void *)(v15 + 512) = 0;
  *(double *)(v15 + 16) = a9;
  *(double *)(v15 + 24) = a10;
  if (a8)
  {
    if (a8 == 1)
    {
      double v23 = *(double *)&a6 + a9;
      double v24 = *(double *)&a7 + a10;
      a9 = *(double *)&a6 + a9;
      a10 = *(double *)&a7 + a10;
    }
    else
    {
      double v23 = a9;
      double v24 = a10;
    }
  }
  else
  {
    double v23 = *(double *)&a6 + a9;
    double v24 = *(double *)&a7 + a10;
  }
  *(double *)(v15 + 32) = v23;
  *(double *)(v15 + 40) = v24;
  *(double *)(v15 + 488) = a9;
  *(double *)(v15 + 496) = a10;
  *(void *)(v15 + 96) = 0;
  *(void *)(v15 + 104) = 0;
  *(double *)(v15 + 112) = a11;
  *(double *)(v15 + 120) = a12;
  memcpy((void *)(v15 + 128), __src, 0xC8uLL);
  *(_OWORD *)(v15 + 328) = v34;
  *(_OWORD *)(v15 + 344) = v33;
  *(_OWORD *)(v15 + 360) = v32;
  *(_OWORD *)(v15 + 376) = v31;
  *(_OWORD *)(v15 + 392) = v30;
  *(_OWORD *)(v15 + 408) = v29;
  *(_OWORD *)(v15 + 424) = v28;
  *(unsigned char *)(v15 + 48) = v19;
  *(_OWORD *)(v15 + 56) = v27;
  *(_OWORD *)(v15 + 72) = v26;
  *(double *)(v15 + 520) = *(double *)&a6;
  *(double *)(v15 + 528) = *(double *)&a7;
  *(unsigned char *)(v15 + 536) = a8;
  *(unsigned char *)(v15 + 537) = v20;
  *(unsigned char *)(v15 + 538) = v21;
  *(void *)(v15 + 88) = v22;
  sub_1BF8A09D4(a4, v15 + 544);
  *(unsigned char *)(v15 + 440) = a15 & 1;
  return v15;
}

char *sub_1BF89FFC4()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF8CB978();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  CGFloat v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (*(void *)(v1 + 64))
  {
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = 2;
    *(unsigned char *)(v7 + 24) = 7;
    swift_willThrow();
  }
  else
  {
    double v8 = sub_1BF8A025C(v1);
    uint64_t v10 = v9;
    sub_1BF8CB968();
    uint64_t v11 = sub_1BF8CB958();
    v28[1] = v2;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    double v15 = *(double *)(v1 + 112);
    double v16 = *(double *)(v1 + 120);
    double v17 = *(double *)(v1 + 16);
    double v18 = *(double *)(v1 + 24);
    memcpy(v36, (const void *)(v1 + 128), sizeof(v36));
    memcpy(v35, (const void *)(v1 + 128), sizeof(v35));
    long long v19 = *(_OWORD *)(v1 + 344);
    v34[0] = *(_OWORD *)(v1 + 328);
    v34[1] = v19;
    long long v20 = *(_OWORD *)(v1 + 376);
    v34[2] = *(_OWORD *)(v1 + 360);
    v34[3] = v20;
    long long v21 = *(_OWORD *)(v1 + 408);
    v34[4] = *(_OWORD *)(v1 + 392);
    v34[5] = v21;
    long long v22 = *(_OWORD *)(v1 + 424);
    char v38 = *(unsigned char *)(v1 + 48);
    v34[6] = v22;
    sub_1BF8A0970(v1 + 544, (uint64_t)v33);
    *(void *)&long long v30 = v12;
    *((void *)&v30 + 1) = v14;
    double v31 = v8;
    uint64_t v32 = v10;
    uint64_t v23 = *(void *)(v1 + 520);
    uint64_t v24 = *(void *)(v1 + 528);
    char v25 = *(unsigned char *)(v1 + 538);
    char v26 = *(unsigned char *)(v1 + 536);
    v37[0] = *(unsigned char *)(v1 + 537);
    v37[1] = v25;
    uint64_t v29 = *(void *)(v1 + 88);
    CGFloat v6 = (char *)sub_1BF89FD4C(v35, v34, &v38, (uint64_t)v33, &v30, v23, v24, v26, v17, v18, v15, v16, v37, &v29, *(unsigned char *)(v1 + 440));
    sub_1BF891FF4((uint64_t)v36);
    swift_retain();
  }
  return v6;
}

double sub_1BF8A025C(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 48);
  CGFloat v4 = *(double *)(a1 + 96);
  CGFloat v3 = *(double *)(a1 + 104);
  CGFloat v6 = *(double *)(a1 + 112);
  CGFloat v5 = *(double *)(a1 + 120);
  v9.origin.CGFloat x = v4;
  v9.origin.CGFloat y = v3;
  v9.size.CGFloat width = v6;
  v9.size.CGFloat height = v5;
  double Width = CGRectGetWidth(v9);
  if (v2)
  {
    v10.origin.CGFloat x = v4;
    v10.origin.CGFloat y = v3;
    v10.size.CGFloat width = v6;
    v10.size.CGFloat height = v5;
    CGRectGetHeight(v10);
    swift_beginAccess();
  }
  else
  {
    swift_beginAccess();
    double Width = Width - *(double *)(a1 + 504);
    v11.origin.CGFloat x = v4;
    v11.origin.CGFloat y = v3;
    v11.size.CGFloat width = v6;
    v11.size.CGFloat height = v5;
    CGRectGetHeight(v11);
  }
  return Width;
}

BOOL sub_1BF8A0334(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 0.0;
  v11.size.CGFloat height = 0.0;
  if (CGRectEqualToRect(*(CGRect *)&a1, v11)) {
    return 0;
  }
  v9.origin.CGFloat x = a1;
  v9.origin.CGFloat y = a2;
  v9.size.CGFloat width = a3;
  v9.size.CGFloat height = a4;
  if (CGRectGetWidth(v9) == 1.79769313e308) {
    return 0;
  }
  v10.origin.CGFloat x = a1;
  v10.origin.CGFloat y = a2;
  v10.size.CGFloat width = a3;
  v10.size.CGFloat height = a4;
  return CGRectGetHeight(v10) != 1.79769313e308;
}

uint64_t Cursor.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  memcpy(__dst, (const void *)(v0 + 128), sizeof(__dst));
  sub_1BF896598((uint64_t)__dst);
  sub_1BF8A0428(v0 + 544);
  return v0;
}

uint64_t sub_1BF8A0428(uint64_t a1)
{
  sub_1BF8A0484();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BF8A0484()
{
  if (!qword_1EBA90650)
  {
    sub_1BF8A04DC();
    unint64_t v0 = sub_1BF8CBD98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90650);
    }
  }
}

unint64_t sub_1BF8A04DC()
{
  unint64_t result = qword_1EBA90648;
  if (!qword_1EBA90648)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA90648);
  }
  return result;
}

uint64_t Cursor.__deallocating_deinit()
{
  Cursor.deinit();
  return MEMORY[0x1F4186488](v0, 584, 7);
}

uint64_t getEnumTagSinglePayload for Pass(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Pass(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_1BF8A061C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1BF8A0634(void *result, int a2)
{
  if (a2 < 0)
  {
    result[2] = 0;
    result[3] = 0;
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

void type metadata accessor for Pass()
{
}

uint64_t destroy for Pass.DynamicOptions()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s11TeaTemplate4PassO14DynamicOptionsVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *_s11TeaTemplate4PassO14DynamicOptionsVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t _s11TeaTemplate4PassO14DynamicOptionsVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Pass.DynamicOptions(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Pass.DynamicOptions(uint64_t result, int a2, int a3)
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

void type metadata accessor for Pass.DynamicOptions()
{
}

uint64_t sub_1BF8A07D0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Cursor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Cursor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Cursor);
}

uint64_t getEnumTagSinglePayload for DimensionSizerResult.ProcessResult(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for DimensionSizerResult.ProcessResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8A0934(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1BF8A094C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for CursorInitialPosition()
{
}

uint64_t sub_1BF8A0970(uint64_t a1, uint64_t a2)
{
  sub_1BF8A0484();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF8A09D4(uint64_t a1, uint64_t a2)
{
  sub_1BF8A0484();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t (*Template<A, B>(name:_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  long long v11 = *(_OWORD *)a3;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(a3 + 24);
  char v7 = *(unsigned char *)(a3 + 32);
  char v8 = *(unsigned char *)(a3 + 33);
  type metadata accessor for Layout();
  long long v12 = v11;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  char v15 = v7;
  char v16 = v8;
  swift_bridgeObjectRetain();
  Layout.__allocating_init(canvas:name:)(&v12, a1, a2);
  CGRect v9 = sub_1BF8A0AFC();
  swift_release();
  return v9;
}

uint64_t (*sub_1BF8A0AFC())()
{
  return sub_1BF8A0B3C;
}

uint64_t SizeConstraints.width.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SizeConstraints.height.getter()
{
  return swift_bridgeObjectRetain();
}

TeaTemplate::SizeConstraints __swiftcall SizeConstraints.init(width:height:)(Swift::OpaquePointer width, Swift::OpaquePointer height)
{
  v2->_rawValue = width._rawValue;
  v2[1]._rawValue = height._rawValue;
  result.CGFloat height = height;
  result.CGFloat width = width;
  return result;
}

BOOL SizeConstraints.isEmpty.getter()
{
  return !*(void *)(*v0 + 16) && *(void *)(v0[1] + 16) == 0;
}

uint64_t SizeConstraints.adding(widthConstraint:)@<X0>(uint64_t *a1@<X0>, char **a2@<X8>)
{
  uint64_t v4 = *a1;
  char v5 = *((unsigned char *)a1 + 8);
  char v7 = *v2;
  uint64_t v6 = v2[1];
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v7 = OUTLINED_FUNCTION_4_9();
  }
  unint64_t v9 = *((void *)v7 + 2);
  unint64_t v8 = *((void *)v7 + 3);
  if (v9 >= v8 >> 1) {
    char v7 = OUTLINED_FUNCTION_3_8(v8);
  }
  *((void *)v7 + 2) = v9 + 1;
  CGRect v10 = &v7[16 * v9];
  *((void *)v10 + 4) = v4;
  v10[40] = v5;
  *a2 = v7;
  a2[1] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t SizeConstraints.adding(heightConstraint:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  char v5 = *((unsigned char *)a1 + 8);
  uint64_t v7 = *v2;
  uint64_t v6 = v2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)OUTLINED_FUNCTION_4_9();
    uint64_t v6 = result;
  }
  unint64_t v10 = *(void *)(v6 + 16);
  unint64_t v9 = *(void *)(v6 + 24);
  if (v10 >= v9 >> 1)
  {
    uint64_t result = (uint64_t)OUTLINED_FUNCTION_3_8(v9);
    uint64_t v6 = result;
  }
  *(void *)(v6 + 16) = v10 + 1;
  unint64_t v11 = v6 + 16 * v10;
  *(void *)(v11 + 32) = v4;
  *(unsigned char *)(v11 + 40) = v5;
  *a2 = v7;
  a2[1] = v6;
  return result;
}

TeaTemplate::SizeConstraints __swiftcall SizeConstraints.adding(constraints:)(TeaTemplate::SizeConstraints constraints)
{
  unsigned int v3 = v1;
  uint64_t v4 = v2[1];
  uint64_t v10 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_1BF8A0FEC(v5);
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_1BF8A0FEC(v6);
  *unsigned int v3 = v10;
  v3[1] = v4;
  result.height._rawValue = v8;
  result.width._rawValue = v7;
  return result;
}

uint64_t static SizeConstraints.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  if ((sub_1BF8A0D98(*a1, *a2) & 1) == 0) {
    return 0;
  }
  return sub_1BF8A0D98(v2, v3);
}

uint64_t sub_1BF8A0D98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = (double *)(a1 + 40);
    for (unint64_t i = (double *)(a2 + 40); ; i += 2)
    {
      if (*(unsigned char *)v3)
      {
        if ((*(unsigned char *)i & 1) == 0) {
          return 0;
        }
      }
      else if (*(unsigned char *)i)
      {
        return 0;
      }
      if (*(v3 - 1) != *(i - 1)) {
        break;
      }
      v3 += 2;
      if (!--v2) {
        return 1;
      }
    }
  }
  return 0;
}

void sub_1BF8A0E10()
{
  qword_1EA1702E8 = MEMORY[0x1E4FBC860];
  unk_1EA1702F0 = MEMORY[0x1E4FBC860];
}

uint64_t static SizeConstraints.none.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EA1700B0 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_1EA1702F0;
  *a1 = qword_1EA1702E8;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

double static SizeConstraints.minWidth(_:)@<D0>(uint64_t *a1@<X8>, double a2@<D0>)
{
  return sub_1BF8A0EB8(0, a1, a2);
}

double static SizeConstraints.minHeight(_:)@<D0>(void *a1@<X8>, double a2@<D0>)
{
  return sub_1BF8A0F34(0, a1, a2);
}

double static SizeConstraints.maxWidth(_:)@<D0>(uint64_t *a1@<X8>, double a2@<D0>)
{
  return sub_1BF8A0EB8(1, a1, a2);
}

double sub_1BF8A0EB8@<D0>(char a1@<W0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  sub_1BF8A1834(0, (unint64_t *)&qword_1EBA90298);
  uint64_t v6 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v6 + 16) = xmmword_1BF8CD2F0;
  *(double *)(v6 + 32) = a3;
  *(unsigned char *)(v6 + 40) = a1;
  uint64_t v8 = MEMORY[0x1E4FBC860];
  *a2 = v6;
  a2[1] = v8;
  return result;
}

double static SizeConstraints.maxHeight(_:)@<D0>(void *a1@<X8>, double a2@<D0>)
{
  return sub_1BF8A0F34(1, a1, a2);
}

double sub_1BF8A0F34@<D0>(char a1@<W0>, void *a2@<X8>, double a3@<D0>)
{
  sub_1BF8A1834(0, (unint64_t *)&qword_1EBA90298);
  uint64_t v6 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v6 + 16) = xmmword_1BF8CD2F0;
  *(double *)(v6 + 32) = a3;
  *(unsigned char *)(v6 + 40) = a1;
  *a2 = MEMORY[0x1E4FBC860];
  a2[1] = v6;
  return result;
}

BOOL static SizeConstraint.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 8))
  {
    return 0;
  }
  return *(double *)a1 == *(double *)a2;
}

uint64_t sub_1BF8A0FEC(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  double result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    double result = (uint64_t)sub_1BF8A14A0((char *)result, v7, 1, (char *)v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  double result = (uint64_t)memcpy((void *)(v3 + 16 * v8 + 32), (const void *)(v6 + 32), 16 * v2);
  if (!v2)
  {
LABEL_14:
    double result = swift_bridgeObjectRelease();
    *unint64_t v1 = v3;
    return result;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    *(void *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_1BF8A10C8()
{
  OUTLINED_FUNCTION_6_5();
  if (v3)
  {
    OUTLINED_FUNCTION_2_11();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_5_5();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_1_11();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    uint64_t v8 = *((void *)v0 + 2);
  }
  else {
    uint64_t v8 = v4;
  }
  if (v8)
  {
    sub_1BF8A1834(0, &qword_1EBA902A0);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size(v9);
    *((void *)v9 + 2) = v7;
    *((void *)v9 + 3) = 2 * ((uint64_t)(v10 - 32) / 40);
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v11 = v9 + 32;
  long long v12 = v0 + 32;
  size_t v13 = 40 * v7;
  if (v1)
  {
    if (v9 != v0 || &v12[v13] <= v11) {
      memmove(v11, v12, v13);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v11, v12, v13);
  }
  swift_bridgeObjectRelease();
}

void sub_1BF8A11BC()
{
  OUTLINED_FUNCTION_6_5();
  if (v3)
  {
    OUTLINED_FUNCTION_2_11();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_5_5();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_1_11();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    uint64_t v8 = *((void *)v0 + 2);
  }
  else {
    uint64_t v8 = v4;
  }
  if (v8)
  {
    sub_1BF8A1834(0, &qword_1EA1702F8);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size(v9);
    *((void *)v9 + 2) = v7;
    *((void *)v9 + 3) = 2 * ((uint64_t)(v10 - 32) / 80);
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v11 = v9 + 32;
  long long v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[80 * v7] <= v11) {
      memmove(v11, v12, 80 * v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_1BF8A12C0()
{
  OUTLINED_FUNCTION_6_5();
  if (v3)
  {
    OUTLINED_FUNCTION_2_11();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_5_5();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_1_11();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    uint64_t v8 = *((void *)v0 + 2);
  }
  else {
    uint64_t v8 = v4;
  }
  if (v8)
  {
    sub_1BF8A1834(0, &qword_1EA170300);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size(v9);
    *((void *)v9 + 2) = v7;
    *((void *)v9 + 3) = 2 * ((uint64_t)(v10 - 32) / 8);
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v11 = v9 + 32;
  long long v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[8 * v7] <= v11) {
      memmove(v11, v12, 8 * v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v11, v12, 8 * v7);
  }
  swift_bridgeObjectRelease();
}

void sub_1BF8A13AC()
{
  OUTLINED_FUNCTION_6_5();
  if (v3)
  {
    OUTLINED_FUNCTION_2_11();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_5_5();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_1_11();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    uint64_t v8 = *((void *)v0 + 2);
  }
  else {
    uint64_t v8 = v4;
  }
  if (v8)
  {
    sub_1BF8A1834(0, &qword_1EBA902B0);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size(v9);
    *((void *)v9 + 2) = v7;
    *((void *)v9 + 3) = 2 * ((uint64_t)(v10 - 32) / 16);
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v11 = v9 + 32;
  long long v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[16 * v7] <= v11) {
      memmove(v11, v12, 16 * v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

char *sub_1BF8A14A0(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BF8A1834(0, (unint64_t *)&qword_1EBA90298);
    size_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    size_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  long long v12 = v10 + 32;
  size_t v13 = a4 + 32;
  size_t v14 = 16 * v8;
  if (v5)
  {
    if (v10 != a4 || &v13[v14] <= v12) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t destroy for SizeConstraints()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s11TeaTemplate15SizeConstraintsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SizeConstraints(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for SizeConstraints(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SizeConstraints(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for SizeConstraints(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)double result = a2 ^ 0x80000000;
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
      *(void *)double result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeConstraints()
{
  return &type metadata for SizeConstraints;
}

uint64_t getEnumTagSinglePayload for SizeConstraint(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for SizeConstraint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8A17C8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1BF8A17D0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SizeConstraint()
{
  return &type metadata for SizeConstraint;
}

char *sub_1BF8A17EC(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[96 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0_16(a3, result);
  }
  return result;
}

char *sub_1BF8A1814(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[16 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0_16(a3, result);
  }
  return result;
}

void sub_1BF8A1834(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1BF8CC028();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t destroy for LayoutDecoderError(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 48);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)result + 2;
  }
  if (v1 == 1)
  {
    return __swift_destroy_boxed_opaque_existential_1(result);
  }
  else if (!v1)
  {
    if (*(void *)(result + 24)) {
      __swift_destroy_boxed_opaque_existential_1(result);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LayoutDecoderError(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 48);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a2 + 2;
  }
  if (v4 == 1)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 24) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
    char v7 = 1;
LABEL_9:
    *(unsigned char *)(a1 + 48) = v7;
    return a1;
  }
  if (v4)
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    char v7 = *(unsigned char *)(a2 + 48);
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5)
  {
    *(void *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
  }
  uint64_t v10 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = 0;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LayoutDecoderError(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 48);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(a1);
      }
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 48);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v7 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v7;
      (**(void (***)(uint64_t, long long *))(v7 - 8))(a1, a2);
      *(unsigned char *)(a1 + 48) = 1;
    }
    else if (v5)
    {
      long long v8 = *a2;
      long long v9 = a2[1];
      long long v10 = a2[2];
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      *(_OWORD *)(a1 + 16) = v9;
      *(_OWORD *)(a1 + 32) = v10;
      *(_OWORD *)a1 = v8;
    }
    else
    {
      uint64_t v6 = *((void *)a2 + 3);
      if (v6)
      {
        *(void *)(a1 + 24) = v6;
        (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
      }
      else
      {
        long long v11 = a2[1];
        *(_OWORD *)a1 = *a2;
        *(_OWORD *)(a1 + 16) = v11;
      }
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      *(unsigned char *)(a1 + 48) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t assignWithTake for LayoutDecoderError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 48);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(a1);
      }
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 48);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
    }
    else
    {
      if (!v5)
      {
        long long v6 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(unsigned char *)(a1 + 48) = 0;
        return a1;
      }
      long long v8 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      LOBYTE(v5) = *(unsigned char *)(a2 + 48);
    }
    *(unsigned char *)(a1 + 48) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutDecoderError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LayoutDecoderError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)double result = 0u;
    *(_DWORD *)double result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8A1CB8(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 48);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_1BF8A1CD4(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LayoutDecoderError()
{
  return &type metadata for LayoutDecoderError;
}

void sub_1BF8A1D0C(char a1@<W3>, uint64_t *a2@<X8>)
{
  uint64_t v4 = swift_allocObject();
  OUTLINED_FUNCTION_0_17();
  double v5 = DimensionCursor.position.getter();
  if (a1) {
    double v6 = 1.79769313e308;
  }
  else {
    double v6 = DimensionCursor.remainingBounds.getter();
  }
  *(double *)(v4 + 16) = v5;
  *(double *)(v4 + 24) = v6;
  *(unsigned char *)(v4 + 32) = 0;
  *a2 = v4;
}

void sub_1BF8A1DDC(uint64_t *a1@<X8>)
{
  sub_1BF8A1D0C(*v1, a1);
}

uint64_t getEnumTagSinglePayload for SizeToFitDimensionSizer(unsigned __int8 *a1, unsigned int a2)
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
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SizeToFitDimensionSizer(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8A1F64);
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

ValueMetadata *type metadata accessor for SizeToFitDimensionSizer()
{
  return &type metadata for SizeToFitDimensionSizer;
}

uint64_t sub_1BF8A1F9C()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8A1FAC()
{
  return sub_1BF8A2D18((uint64_t)&unk_1F1B04900);
}

void sub_1BF8A1FDC(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v6 = v5;
  swift_beginAccess();
  uint64_t v12 = *(void *)(a1 + 64);
  if (!v12)
  {
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 40) = &type metadata for AltFlexibleTextSizer;
    *(void *)(v33 + 48) = &off_1F1B07090;
    *(void *)(v33 + 16) = a3;
    *(void *)(v33 + 24) = a4;
    *a5 = v33 | 0x2000000000000000;
    id v34 = a3;
    swift_bridgeObjectRetain();
    return;
  }
  double v13 = *(double *)(a1 + 80);
  if (v13 <= 0.0)
  {
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = 0u;
    *(_OWORD *)(v35 + 32) = 0u;
    if (qword_1EBA90300 != -1) {
      swift_once();
    }
    char v36 = HIBYTE(word_1EBA8F7C8);
    *(unsigned char *)(v35 + 48) = word_1EBA8F7C8;
    *(unsigned char *)(v35 + 49) = v36;
    *a5 = v35;
  }
  else
  {
    uint64_t v81 = a3;
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 72);
    char v16 = *(void **)(a2 + 24);
    if (v16)
    {
      uint64_t v17 = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      v18._uint64_t countAndFlagsBits = v17;
      v18._object = v16;
      uint64_t v19 = (unint64_t)LayoutContext.metadata(for:)(v18);
      if (v19)
      {
        uint64_t v20 = v19;
        sub_1BF8BA160(v19, &v83);
        if (v85 == 0.0)
        {
          swift_bridgeObjectRelease();
          sub_1BF8A2C10((uint64_t)&v83);
        }
        else
        {
          sub_1BF8A2B84();
          if (swift_dynamicCast())
          {
            int v76 = (unint64_t *)a5;
            id v21 = sub_1BF8A63BC();
            OUTLINED_FUNCTION_0_18();
            sub_1BF8A2650(v22, a1, v23, v24);
            swift_bridgeObjectRelease();

            long long v25 = v83;
            double v26 = v84;
            double v27 = v85;
            long long v28 = v86;
            uint64_t v29 = v87;
            uint64_t v30 = v88;
            uint64_t v31 = swift_allocObject();
            uint64_t v32 = swift_allocObject();
            *(_OWORD *)(v32 + 16) = v25;
            *(double *)(v32 + 32) = v26;
            *(double *)(v32 + 40) = v27;
            *(_OWORD *)(v32 + 48) = v25;
            *(double *)(v32 + 64) = v26;
            *(double *)(v32 + 72) = v27;
            *(void *)(v32 + 80) = v28;
            *(void *)(v32 + 88) = v29;
            *(void *)(v32 + 96) = v30;
            *(void *)(v31 + 16) = v32 | 0x1000000000000000;
            *(void *)(v31 + 24) = v20;
LABEL_25:
            *int v76 = v31 | 0x9000000000000000;
            return;
          }
          swift_bridgeObjectRelease();
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    OUTLINED_FUNCTION_0_18();
    id v39 = sub_1BF8A2650(v81, a1, v37, v38);
    uint64_t v80 = v83;
    double v40 = v84;
    uint64_t v79 = *((void *)&v83 + 1);
    double v41 = v85;
    id v77 = v86;
    uint64_t v42 = v87;
    uint64_t v43 = v88;
    MEMORY[0x1F4188790](v39);
    v72[2] = v81;
    v72[3] = a4;
    v72[4] = a1;
    v72[5] = v14;
    v72[6] = v12;
    v72[7] = v15;
    *(double *)&v72[8] = v13;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_1BF8AA898((void (*)(uint64_t *__return_ptr, void *))sub_1BF8A2964, (uint64_t)v72, a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&long long v83 = v44;
    sub_1BF8A2C94(0, &qword_1EBA90208, (uint64_t)&type metadata for AltTextSized, MEMORY[0x1E4FBB320]);
    sub_1BF8A2990();
    sub_1BF8A2A04();
    uint64_t v45 = sub_1BF8CBAE8();
    uint64_t v46 = *(void *)(v44 + 16);
    if (v46)
    {
      uint64_t v78 = v45;
      uint64_t v73 = v43;
      uint64_t v74 = v42;
      int v76 = (unint64_t *)a5;
      swift_bridgeObjectRetain();
      uint64_t v75 = v44;
      uint64_t v47 = v44 + 64;
      while (1)
      {
        uint64_t v48 = *(void **)(v47 - 16);
        uint64_t v49 = *(void **)v47;
        uint64_t v50 = *(void *)(v47 + 8);
        uint64_t v51 = *(void *)(v47 + 16);
        uint64_t v52 = *(void *)(v47 + 24);
        uint64_t v53 = *(void *)(v47 + 32);
        uint64_t v54 = *(void **)(v47 + 40);
        uint64_t v55 = *(void *)(v47 + 48);
        uint64_t v56 = *(void *)(v47 + 56);
        *(void *)&long long v83 = *(void *)(v47 - 8);
        swift_retain_n();
        id v57 = v49;
        id v58 = v54;
        swift_bridgeObjectRetain();
        id v59 = v48;
        double v60 = OUTLINED_FUNCTION_2_12();
        char v62 = sub_1BF8B7E9C((const __CFAttributedString *)v81, v78, v60, v61, v40, v41);
        if (v6)
        {
          swift_bridgeObjectRelease();

          OUTLINED_FUNCTION_1_12();
          swift_bridgeObjectRelease();
          swift_release_n();
          return;
        }
        char v63 = v62;
        swift_release();
        if (v63) {
          break;
        }

        swift_release();
        swift_bridgeObjectRelease();
        v47 += 96;
        if (!--v46)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_1_12();
          a5 = (uint64_t *)v76;
          uint64_t v42 = v74;
          uint64_t v43 = v73;
          goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_1_12();
      uint64_t v31 = swift_allocObject();
      uint64_t v67 = swift_allocObject();
      *(void *)(v67 + 16) = v50;
      *(void *)(v67 + 24) = v51;
      *(void *)(v67 + 32) = v52;
      *(void *)(v67 + 40) = v53;
      *(void *)(v67 + 48) = v50;
      *(void *)(v67 + 56) = v51;
      *(void *)(v67 + 64) = v52;
      *(void *)(v67 + 72) = v53;
      *(void *)(v67 + 80) = v58;
      *(void *)(v67 + 88) = v55;
      *(void *)(v67 + 96) = v56;
      *(void *)(v31 + 16) = v67 | 0x1000000000000000;
      sub_1BF8A2ACC();
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1BF8CD2F0;
      *(void *)(inited + 56) = sub_1BF8A2B84();
      *(void *)(inited + 32) = v59;
      sub_1BF8A2BC4();
      id v69 = v58;
      id v70 = v59;
      uint64_t v71 = sub_1BF8CB9F8();

      swift_release();
      swift_bridgeObjectRelease();

      *(void *)(v31 + 24) = v71;
      goto LABEL_25;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_22:
    swift_allocObject();
    double v64 = OUTLINED_FUNCTION_2_12();
    *(double *)(v65 + 16) = v64;
    *(void *)(v65 + 24) = v66;
    *(double *)(v65 + 32) = v40;
    *(double *)(v65 + 40) = v41;
    *(double *)(v65 + 48) = v64;
    *(void *)(v65 + 56) = v66;
    *(double *)(v65 + 64) = v40;
    *(double *)(v65 + 72) = v41;
    *(void *)(v65 + 80) = v77;
    *(void *)(v65 + 88) = v42;
    *(void *)(v65 + 96) = v43;
    *a5 = v65 | 0x1000000000000000;
  }
}

id sub_1BF8A2650@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v6 = *(double *)(a3 + 16);
  double v7 = *(double *)(a3 + 24);
  objc_msgSend(a1, sel_boundingRectWithSize_options_context_, 33, 0, v6, v7);
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  if (trunc(CGRectGetHeight(v14)) <= trunc(v7))
  {
    swift_beginAccess();
    long long v10 = *(_OWORD *)(a2 + 488);
  }
  else
  {
    long long v10 = 0uLL;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
  }
  *(_OWORD *)a4 = v10;
  *(CGFloat *)(a4 + 16) = width;
  *(CGFloat *)(a4 + 24) = height;
  *(void *)(a4 + 32) = a1;
  *(double *)(a4 + 40) = v6;
  *(double *)(a4 + 48) = v7;
  return a1;
}

id sub_1BF8A271C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  long long v10 = (void *)a1[2];
  uint64_t v11 = a1[3];
  uint64_t v12 = (void *)a1[4];
  v19[0] = a3;
  v19[1] = a4;
  *(double *)&_OWORD v19[2] = a6;
  *(double *)&v19[3] = a7;
  sub_1BF8A2650(v12, a2, (uint64_t)v19, (uint64_t)v20);
  uint64_t v13 = v21;
  long long v14 = v20[0];
  long long v15 = v20[1];
  long long v16 = v22;
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v8;
  *(void *)(a5 + 16) = v10;
  *(void *)(a5 + 24) = v11;
  *(void *)(a5 + 32) = v12;
  *(_OWORD *)(a5 + 40) = v14;
  *(_OWORD *)(a5 + 56) = v15;
  *(void *)(a5 + 72) = v13;
  *(_OWORD *)(a5 + 80) = v16;
  swift_retain();
  id v17 = v12;
  swift_bridgeObjectRetain();
  return v10;
}

uint64_t sub_1BF8A27DC()
{
  return sub_1BF8A1FAC();
}

void sub_1BF8A27F4(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  sub_1BF8A1FDC(a1, a2, *(void **)v3, *(void *)(v3 + 8), a3);
}

uint64_t sub_1BF8A2810()
{
  return 0x6978656C46746C61;
}

void *initializeBufferWithCopyOfBuffer for AltFlexibleTextSizer(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AltFlexibleTextSizer(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for AltFlexibleTextSizer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for AltFlexibleTextSizer(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AltFlexibleTextSizer()
{
  return &type metadata for AltFlexibleTextSizer;
}

uint64_t sub_1BF8A2954()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

id sub_1BF8A2964@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF8A271C(a1, *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), a2, *(double *)(v2 + 56), *(double *)(v2 + 64));
}

unint64_t sub_1BF8A2990()
{
  unint64_t result = qword_1EBA90210;
  if (!qword_1EBA90210)
  {
    sub_1BF8A2C94(255, &qword_1EBA90208, (uint64_t)&type metadata for AltTextSized, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA90210);
  }
  return result;
}

unint64_t sub_1BF8A2A04()
{
  unint64_t result = qword_1EBA8F430;
  if (!qword_1EBA8F430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA8F430);
  }
  return result;
}

uint64_t sub_1BF8A2A50()
{
  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1BF8A2A88()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF8A2ACC()
{
  if (!qword_1EBA90700)
  {
    sub_1BF8A2B24();
    unint64_t v0 = sub_1BF8CC028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90700);
    }
  }
}

void sub_1BF8A2B24()
{
  if (!qword_1EBA906E0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA906E0);
    }
  }
}

unint64_t sub_1BF8A2B84()
{
  unint64_t result = qword_1EBA906F0;
  if (!qword_1EBA906F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA906F0);
  }
  return result;
}

unint64_t sub_1BF8A2BC4()
{
  unint64_t result = qword_1EBA906D0;
  if (!qword_1EBA906D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA906D0);
  }
  return result;
}

uint64_t sub_1BF8A2C10(uint64_t a1)
{
  sub_1BF8A2C94(0, (unint64_t *)&qword_1EBA902B8, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BF8A2C94(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1BF8A2CE0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8A2D18(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x1E4FBC870];
    goto LABEL_38;
  }
  sub_1BF8A2F68();
  uint64_t result = sub_1BF8CBE58();
  uint64_t v3 = result;
  uint64_t v28 = *(void *)(a1 + 16);
  if (!v28)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = a1 + 32 + 24 * v4;
    double v8 = *(double *)v6;
    double v7 = *(double *)(v6 + 8);
    int v9 = *(unsigned __int8 *)(v6 + 16);
    sub_1BF8CC1A8();
    sub_1BF8CC1B8();
    if (v9 != 1)
    {
      sub_1BF8CC1C8();
      sub_1BF8CC1C8();
    }
    uint64_t result = sub_1BF8CC1D8();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    uint64_t v15 = *(void *)(v3 + 48);
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v16 = ~v10;
      if (*(void *)&v8 > 1uLL) {
        char v17 = v9;
      }
      else {
        char v17 = 0;
      }
      if (*(void *)&v8 ^ 1 | *(void *)&v7) {
        char v18 = 0;
      }
      else {
        char v18 = v9;
      }
      if (*(void *)&v8 | *(void *)&v7) {
        char v19 = 0;
      }
      else {
        char v19 = v9;
      }
      do
      {
        uint64_t v20 = v15 + 24 * v11;
        double v21 = *(double *)v20;
        double v22 = *(double *)(v20 + 8);
        if (*(unsigned char *)(v20 + 16) == 1)
        {
          if (*(void *)&v21 | *(void *)&v22)
          {
            if (*(void *)&v21 ^ 1 | *(void *)&v22)
            {
              if (v17) {
                goto LABEL_35;
              }
            }
            else if (v18)
            {
              goto LABEL_35;
            }
          }
          else if (v19)
          {
            goto LABEL_35;
          }
        }
        else if ((v9 & 1) == 0 && v21 == v8 && v22 == v7)
        {
          goto LABEL_35;
        }
        unint64_t v11 = (v11 + 1) & v16;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
      }
      while ((v13 & (1 << v11)) != 0);
    }
    *(void *)(v5 + 8 * v12) = v14 | v13;
    uint64_t v24 = v15 + 24 * v11;
    *(double *)uint64_t v24 = v8;
    *(double *)(v24 + 8) = v7;
    *(unsigned char *)(v24 + 16) = v9;
    uint64_t v25 = *(void *)(v3 + 16);
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_40;
    }
    *(void *)(v3 + 16) = v27;
LABEL_35:
    if (++v4 == v28) {
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1BF8A2F68()
{
  if (!qword_1EBA90280)
  {
    sub_1BF8A2FC4();
    unint64_t v0 = sub_1BF8CBE68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90280);
    }
  }
}

unint64_t sub_1BF8A2FC4()
{
  unint64_t result = qword_1EBA8F0A0;
  if (!qword_1EBA8F0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA8F0A0);
  }
  return result;
}

double CGRect.replacing(width:)(double a1, double a2)
{
  return a2;
}

double CGRect.replacing(height:)(double a1, double a2)
{
  return a2;
}

void sub_1BF8A3044()
{
  OUTLINED_FUNCTION_1();
  if (*(unsigned char *)(v0 + 440) == 1)
  {
    if (v3)
    {
      CGFloat v4 = *(double *)(v0 + 16);
      CGFloat v5 = *(double *)(v0 + 24);
    }
    else
    {
      CGFloat v4 = v1;
      CGFloat v5 = v2;
    }
    if (*(unsigned char *)(v0 + 48))
    {
      sub_1BF8CBD78();
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      OUTLINED_FUNCTION_3_9();
      CGRectGetMinX(v12);
      v13.origin.CGFloat x = v4;
      v13.origin.CGFloat y = v5;
      v13.size.CGFloat width = v7;
      v13.size.CGFloat height = v9;
      CGRectGetMaxY(v13);
      OUTLINED_FUNCTION_6_6();
    }
    else
    {
      sub_1BF8CBD68();
      v14.size.CGFloat width = v10;
      v14.size.CGFloat height = v11;
      v14.origin.CGFloat x = v4;
      v14.origin.CGFloat y = v5;
      CGRectGetMaxX(v14);
      OUTLINED_FUNCTION_2_13();
      OUTLINED_FUNCTION_4_10();
    }
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_8_0();
  }
  OUTLINED_FUNCTION_3_9();
}

void CGRect.replacing(minY:)(double a1, double a2)
{
  v2.origin.CGFloat x = OUTLINED_FUNCTION_5_6(a1, a2);
  CGRectGetMinX(v2);
  OUTLINED_FUNCTION_3_9();
}

__C::CGRect __swiftcall CGRect.replacing(origin:)(CGPoint origin)
{
  double v3 = v2;
  double v4 = v1;
  result.origin.CGFloat y = origin.y;
  result.origin.CGFloat x = origin.x;
  result.size.CGFloat height = v3;
  result.size.CGFloat width = v4;
  return result;
}

__C::CGRect __swiftcall CGRect.flipRightToLeft(bounds:)(__C::CGRect bounds)
{
  OUTLINED_FUNCTION_9_1((CGRect)bounds);
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0();
  double v1 = OUTLINED_FUNCTION_7_4();
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

__C::CGRect __swiftcall CGRect.horizontalFlip(inBounds:)(__C::CGRect inBounds)
{
  OUTLINED_FUNCTION_9_1((CGRect)inBounds);
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0();
  double v1 = OUTLINED_FUNCTION_7_4();
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void sub_1BF8A3228(__C::CGRect *a1@<X8>, double a2@<D0>)
{
  *a1 = CGRect.flipRightToLeft(bounds:)(*(__C::CGRect *)&a2);
}

double CGRect.init(horizontal:vertical:)(uint64_t a1)
{
  return *(double *)a1;
}

void CGRect.horizontalDimension.getter()
{
}

void CGRect.verticalDimension.getter()
{
}

void sub_1BF8A32C0(uint64_t a1, double (*a2)(void))
{
  OUTLINED_FUNCTION_1();
  double v4 = v3;
  double v6 = v5();
  OUTLINED_FUNCTION_3_9();
  double v7 = a2();
  *double v4 = v6;
  v4[1] = v7;
}

__C::CGRect __swiftcall CGRect.verticalFlip(inBounds:)(__C::CGRect inBounds)
{
  double height = inBounds.size.height;
  CGFloat width = inBounds.size.width;
  CGFloat y = inBounds.origin.y;
  CGFloat x = inBounds.origin.x;
  v16.origin.CGFloat x = v1;
  v16.origin.CGFloat y = v2;
  v16.size.CGFloat width = v3;
  v16.size.double height = v4;
  CGFloat MinX = CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.double height = height;
  CGRectGetMaxY(v17);
  double v9 = height - OUTLINED_FUNCTION_6_6();
  double v10 = OUTLINED_FUNCTION_7();
  double v11 = OUTLINED_FUNCTION_8_0();
  double v12 = MinX;
  double v13 = v9;
  double v14 = v10;
  result.size.double height = v11;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

__C::CGRect __swiftcall CGRect.replacing(size:)(CGSize size)
{
  CGFloat height = size.height;
  CGFloat width = size.width;
  double v5 = v1;
  double v6 = v2;
  double v7 = width;
  double v8 = height;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

double CGRect.replacing(minX:)(double a1, double a2)
{
  v4.origin.CGFloat x = OUTLINED_FUNCTION_5_6(a1, a2);
  CGRectGetMinY(v4);
  return v2;
}

void static CGRect.| infix(_:_:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(*(unsigned char *)(a1 + 32))
  {
    case 2:
      CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 3:
      CGRectGetMinX(*(CGRect *)&a2);
      break;
    default:
      return;
  }
}

uint64_t sub_1BF8A34E8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF8A3550(&qword_1EBA90270);
  uint64_t result = sub_1BF8A3550(&qword_1EBA90268);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BF8A3550(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CGRectTransform(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFB && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 5) {
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

uint64_t storeEnumTagSinglePayload for CGRectTransform(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8A361C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 4u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_1BF8A3634(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)uint64_t result = a2 - 5;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 5;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CGRectTransform()
{
  return &type metadata for CGRectTransform;
}

uint64_t Node.init(kind:identifier:)(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1BF8CB978();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  double v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v4 + 32) = *a1;
  if (!a3)
  {
    sub_1BF8CB968();
    a2 = sub_1BF8CB958();
    a3 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  return v4;
}

uint64_t Node.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Node.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void Node.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

uint64_t Node.__allocating_init(kind:identifier:)(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  Node.init(kind:identifier:)(a1, a2, a3);
  return v6;
}

void sub_1BF8A3818()
{
}

void sub_1BF8A3874()
{
}

uint64_t Node.__deallocating_deinit()
{
  Node.deinit();
  return MEMORY[0x1F4186488](v0, 33, 7);
}

uint64_t sub_1BF8A3904()
{
  return Node.identifier.getter();
}

TeaTemplate::NodeKind_optional __swiftcall NodeKind.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_1BF8CBFF8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 13;
  if (v3 < 0xD) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

uint64_t NodeKind.rawValue.getter()
{
  uint64_t result = 0x656D617266;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6563617073;
      break;
    case 2:
      uint64_t result = 7892834;
      break;
    case 3:
      uint64_t result = 0x79616C7265766FLL;
      break;
    case 4:
      uint64_t result = 0x6465626D65;
      break;
    case 5:
      uint64_t result = 1886351984;
      break;
    case 6:
      uint64_t result = 0x63696D616E7964;
      break;
    case 7:
      uint64_t result = 0x6B63617473;
      break;
    case 8:
      uint64_t result = 0x68636145726F66;
      break;
    case 9:
      uint64_t result = 0x65736C456669;
      break;
    case 0xA:
      uint64_t result = 6778732;
      break;
    case 0xB:
      uint64_t result = 0x74636570736E69;
      break;
    case 0xC:
      uint64_t result = 0x74756F79616CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8A3AD4()
{
  return sub_1BF8968AC();
}

unint64_t sub_1BF8A3AE4()
{
  unint64_t result = qword_1EA170308;
  if (!qword_1EA170308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170308);
  }
  return result;
}

uint64_t sub_1BF8A3B30()
{
  return sub_1BF8C6D90();
}

uint64_t sub_1BF8A3B38()
{
  return sub_1BF8C6E70();
}

uint64_t sub_1BF8A3B40()
{
  return sub_1BF8C7288();
}

TeaTemplate::NodeKind_optional sub_1BF8A3B48(Swift::String *a1)
{
  return NodeKind.init(rawValue:)(*a1);
}

uint64_t sub_1BF8A3B54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NodeKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BF8A3B7C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Node()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Node(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Node);
}

uint64_t dispatch thunk of Node.__allocating_init(kind:identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t getEnumTagSinglePayload for NodeKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF4)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 13;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v5 = v6 - 13;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for NodeKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8A3D60);
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

ValueMetadata *type metadata accessor for NodeKind()
{
  return &type metadata for NodeKind;
}

uint64_t LayoutAttributesType.flipRightToLeft(bounds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v15 = *(void *)(a1 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](a1);
  char v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v22 - v19;
  type metadata accessor for LayoutDecoder();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v23(v20, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v24.origin.CGFloat x = a4;
  v24.origin.CGFloat y = a5;
  v24.size.CGFloat width = a6;
  v24.size.CGFloat height = a7;
  CGRectGetMaxX(v24);
  v25.origin.CGFloat x = OUTLINED_FUNCTION_0_19();
  CGRectGetMaxX(v25);
  v26.origin.CGFloat x = OUTLINED_FUNCTION_0_19();
  CGRectGetMinY(v26);
  v27.origin.CGFloat x = OUTLINED_FUNCTION_0_19();
  CGRectGetWidth(v27);
  v28.origin.CGFloat x = OUTLINED_FUNCTION_0_19();
  CGRectGetHeight(v28);
  sub_1BF8ADCC8();
  sub_1BF8ADD20((uint64_t)v18);
  swift_release();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a3, v18, a1);
}

uint64_t sub_1BF8A4100(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t dispatch thunk of LayoutAttributesType.frame.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void RectDimension.init(origin:size:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *a1 = a2;
  a1[1] = a3;
}

void sub_1BF8A416C()
{
  xmmword_1EA170310 = 0uLL;
}

double static RectDimension.zero.getter@<D0>(_OWORD *a1@<X8>)
{
  if (qword_1EA1700B8 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_1EA170310;
  *a1 = xmmword_1EA170310;
  return result;
}

double RectDimension.origin.getter()
{
  return *(double *)v0;
}

double RectDimension.size.getter()
{
  return *(double *)(v0 + 8);
}

float64x2_t RectDimension.integral.getter@<Q0>(float64x2_t *a1@<X8>)
{
  float64x2_t result = vrndpq_f64(*v1);
  *a1 = result;
  return result;
}

double RectDimension.union(_:)@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  if (*a1 >= *v2) {
    double v3 = *v2;
  }
  else {
    double v3 = *a1;
  }
  double v4 = *a1 + a1[1];
  if (*v2 + v2[1] > v4) {
    double v4 = *v2 + v2[1];
  }
  double result = v4 - v3;
  *a2 = v3;
  a2[1] = result;
  return result;
}

BOOL static RectDimension.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

ValueMetadata *type metadata accessor for RectDimension()
{
  return &type metadata for RectDimension;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1BF8A4268()
{
  uint64_t v0 = sub_1BF8CBC38();
  nullsub_1(v0);
}

Swift::Void __swiftcall LayoutBuilder.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t LayoutBuilder.deinit()
{
  swift_release();
  return v0;
}

uint64_t LayoutBuilder.__deallocating_deinit()
{
  LayoutBuilder.deinit();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BF8A431C(uint64_t a1)
{
  return LayoutBuilder.add(node:)(a1);
}

uint64_t LayoutBuilder.add(node:)(uint64_t a1)
{
  sub_1BF89B278();
  swift_allocObject();
  sub_1BF8CBB98();
  *int v2 = a1;
  type metadata accessor for Node();
  sub_1BF8A4268();
  swift_retain();
  sub_1BF8BDBB4();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8A4408(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_1BF8A4410(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

uint64_t type metadata accessor for LayoutBuilder()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for LayoutBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutBuilder);
}

uint64_t destroy for ResizeConstrainingSizer(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ResizeConstrainingSizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ResizeConstrainingSizer(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ResizeConstrainingSizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ResizeConstrainingSizer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for ResizeConstrainingSizer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResizeConstrainingSizer()
{
  return &type metadata for ResizeConstrainingSizer;
}

void *sub_1BF8A464C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v6 + 24);
  uint64_t v13 = *(void *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v6, v12);
  __n128 result = (*(void *(**)(void *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(v26, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = v26[0];
    uint64_t v17 = *(void *)(v6 + 48);
    uint64_t v16 = *(void *)(v6 + 56);
    uint64_t v18 = LayoutContext.contextFrame(for:)();
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v15;
      char v21 = *(unsigned char *)(v6 + 40);
      __n128 result = (void *)swift_allocObject();
      *((unsigned char *)result + 16) = v21;
      result[3] = v19;
      *(void *)(v20 + 24) = sub_1BF8A4B30;
      *(void *)(v20 + 32) = result;
      uint64_t v22 = v20 | 0x6000000000000000;
LABEL_4:
      *a4 = v22;
      return result;
    }
    swift_beginAccess();
    if (!a1[8])
    {
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 40) = &type metadata for ResizeConstrainingSizer;
      *(void *)(v24 + 48) = &off_1F1B07520;
      uint64_t v25 = swift_allocObject();
      *(void *)(v24 + 16) = v25;
      sub_1BF8A4A7C(v6, v25 + 16);
      __n128 result = (void *)swift_release();
      uint64_t v22 = v24 | 0x2000000000000000;
      goto LABEL_4;
    }
    sub_1BF891F44();
    swift_allocError();
    *(void *)uint64_t v23 = v17;
    *(void *)(v23 + 8) = v16;
    *(void *)(v23 + 16) = 0;
    *(unsigned char *)(v23 + 24) = 3;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (void *)swift_release();
  }
  return result;
}

void sub_1BF8A4868(char a1@<W1>, void *a2@<X2>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, CGFloat Width@<D2>, CGFloat Height@<D3>)
{
  uint64_t v12 = a2[2];
  uint64_t v13 = a2[3];
  uint64_t v14 = a2[4];
  uint64_t v15 = a2[5];
  if (a1) {
    double Width = CGRectGetWidth(*(CGRect *)&v12);
  }
  else {
    CGFloat Height = CGRectGetHeight(*(CGRect *)&v12);
  }
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(CGFloat *)(a3 + 16) = Width;
  *(CGFloat *)(a3 + 24) = Height;
  *(unsigned char *)(a3 + 32) = 1;
}

void *sub_1BF8A48D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8A464C(a1, a2, a3, a4);
}

uint64_t sub_1BF8A48F0()
{
  BYTE8(v2) = 0;
  sub_1BF8CBE78();
  sub_1BF898570();
  sub_1BF8CBF48();
  sub_1BF8CBAC8();
  *(void *)&long long v2 = *(unsigned __int8 *)(v0 + 40);
  sub_1BF8CBF48();
  sub_1BF8CBAC8();
  swift_bridgeObjectRetain();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  return *(void *)((char *)&v2 + 1);
}

uint64_t sub_1BF8A4A04()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8A4A3C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1BF8A4A7C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF8A4AB4()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8A4AF8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF8A4B30(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_1BF8A4868(*(unsigned char *)(v5 + 16), *(void **)(v5 + 24), a1, a2, a3, a4, a5);
}

ValueMetadata *type metadata accessor for InvertSizer()
{
  return &type metadata for InvertSizer;
}

void *sub_1BF8A4B4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v10 = *a1;
  uint64_t v11 = v4[3];
  uint64_t v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  __n128 result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v12 + 16))(&v16, a1, a2, a3, *(void *)(v10 + 80), *(void *)(v10 + 88), v11, v12);
  if (!v5)
  {
    uint64_t v14 = v16;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    *(void *)(v15 + 24) = sub_1BF8A4DE4;
    *(void *)(v15 + 32) = a1;
    *a4 = v15 | 0x6000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

void sub_1BF8A4C58(uint64_t a1@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  char v11 = *(unsigned char *)(a1 + 48);
  double v12 = Cursor.remainingBounds.getter();
  if (v11)
  {
    double Height = CGRectGetHeight(*(CGRect *)&v12);
    v18.origin.CGFloat x = a3;
    v18.origin.CGFloat y = a4;
    v18.size.CGFloat width = a5;
    v18.size.CGFloat height = a6;
    a6 = Height - CGRectGetHeight(v18);
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)&v12);
    v19.origin.CGFloat x = a3;
    v19.origin.CGFloat y = a4;
    v19.size.CGFloat width = a5;
    v19.size.CGFloat height = a6;
    a5 = Width - CGRectGetWidth(v19);
  }
  *(CGFloat *)a2 = a3;
  *(CGFloat *)(a2 + 8) = a4;
  *(CGFloat *)(a2 + 16) = a5;
  *(CGFloat *)(a2 + 24) = a6;
  *(unsigned char *)(a2 + 32) = 1;
}

void *sub_1BF8A4D0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8A4B4C(a1, a2, a3, a4);
}

uint64_t sub_1BF8A4D24()
{
  return 0;
}

uint64_t sub_1BF8A4DA0()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BF8A4DE4(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_1BF8A4C58(v5, a1, a2, a3, a4, a5);
}

uint64_t sub_1BF8A4DEC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  swift_beginAccess();
  if (*(void *)(a1 + 64))
  {
    double v6 = *(double *)(a1 + 72);
    double v7 = *(double *)(a1 + 80);
    if (*(unsigned char *)(a1 + 48))
    {
      swift_beginAccess();
      uint64_t v8 = *(void *)(a1 + 488);
      uint64_t v9 = *(void *)(a1 + 496);
      uint64_t v10 = swift_allocObject();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v8;
      *(void *)(v11 + 24) = v9;
      *(double *)(v11 + 32) = v6;
      *(double *)(v11 + 40) = v7 * a3;
      uint64_t v12 = qword_1EBA90300;
      swift_bridgeObjectRetain();
      if (v12 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_0_20((char *)&word_1EBA8F7C8);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1BF8CD2F0;
      *(double *)(v13 + 32) = v7;
      *(unsigned char *)(v13 + 40) = 1;
      *(void *)(v10 + 24) = MEMORY[0x1E4FBC860];
      *(void *)(v10 + 32) = v13;
    }
    else
    {
      swift_beginAccess();
      uint64_t v16 = *(void *)(a1 + 488);
      uint64_t v17 = *(void *)(a1 + 496);
      uint64_t v10 = swift_allocObject();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v16;
      *(void *)(v18 + 24) = v17;
      *(double *)(v18 + 32) = v6 * a3;
      *(double *)(v18 + 40) = v7;
      uint64_t v19 = qword_1EBA90300;
      swift_bridgeObjectRetain();
      if (v19 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_0_20((char *)&word_1EBA8F7C8);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1BF8CD2F0;
      *(double *)(v20 + 32) = v6;
      *(unsigned char *)(v20 + 40) = 1;
      uint64_t v21 = MEMORY[0x1E4FBC860];
      *(void *)(v10 + 24) = v20;
      *(void *)(v10 + 32) = v21;
    }
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = 0x4000000000000000;
  }
  else
  {
    uint64_t result = swift_allocObject();
    uint64_t v10 = result;
    *(void *)(result + 40) = &type metadata for FlexibleSizer;
    *(void *)(result + 48) = &off_1F1B076C0;
    *(double *)(result + 16) = a3;
    uint64_t v15 = 0x2000000000000000;
  }
  *a2 = v15 | v10;
  return result;
}

uint64_t sub_1BF8A5060@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8A4DEC(a1, a2, *v2);
}

uint64_t sub_1BF8A507C()
{
  return 0x656C626978656C66;
}

uint64_t sub_1BF8A50E8()
{
  return sub_1BF8A507C();
}

ValueMetadata *type metadata accessor for FlexibleSizer()
{
  return &type metadata for FlexibleSizer;
}

uint64_t sub_1BF8A5100()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8A514C()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1BF8A515C()
{
  if (!qword_1EBA90298)
  {
    unint64_t v0 = sub_1BF8CC028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90298);
    }
  }
}

uint64_t sub_1BF8A51A8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

unsigned char *storeEnumTagSinglePayload for BoolCondition(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8A52ACLL);
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

ValueMetadata *type metadata accessor for BoolCondition()
{
  return &type metadata for BoolCondition;
}

uint64_t sub_1BF8A52E4()
{
  return *v0;
}

uint64_t CursorFramePass.description.getter()
{
  if (!*(void *)(v0 + 8)) {
    return 7631665;
  }
  sub_1BF8CBAC8();
  return 0x202C646E32;
}

void *initializeBufferWithCopyOfBuffer for CursorFramePass(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CursorFramePass(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for CursorFramePass(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CursorFramePass(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CursorFramePass(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void *sub_1BF8A549C(void *result, int a2)
{
  if (a2 < 0)
  {
    *uint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CursorFramePass()
{
  return &type metadata for CursorFramePass;
}

uint64_t sub_1BF8A54D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  double v6 = *(double *)v3;
  unsigned int v7 = *(unsigned __int8 *)(v3 + 8);
  if (v7 >> 6)
  {
    if (v7 >> 6 == 1)
    {
      OUTLINED_FUNCTION_0_21();
      uint64_t v8 = *(void *)(a1 + 488);
      uint64_t v9 = *(void *)(a1 + 496);
      Cursor.remainingBounds.getter();
      uint64_t v11 = v10;
      v32.origin.CGFloat x = Cursor.remainingBounds.getter();
      CGFloat v12 = CGRectGetWidth(v32) * v6;
      uint64_t result = swift_allocObject();
      uint64_t v14 = result;
      *(void *)(result + 16) = v8;
      *(void *)(result + 24) = v9;
      *(void *)(result + 32) = v11;
      *(CGFloat *)(result + 40) = v12;
      goto LABEL_15;
    }
    v34.origin.CGFloat x = Cursor.remainingBounds.getter();
    double Height = CGRectGetHeight(v34);
    if (v7) {
      double v21 = dbl_1BF8CEAF8[*(void *)&v6];
    }
    else {
      double v21 = v6;
    }
    v35.origin.CGFloat x = Cursor.remainingBounds.getter();
    double Width = CGRectGetWidth(v35);
    v36.origin.CGFloat x = Cursor.remainingBounds.getter();
    if (CGRectGetHeight(v36) > Width
      || (double v19 = Height * v21, v37.origin.x = Cursor.remainingBounds.getter(), Height * v21 > CGRectGetWidth(v37)))
    {
      OUTLINED_FUNCTION_0_21();
      uint64_t v23 = *(void *)(a1 + 488);
      uint64_t v24 = *(void *)(a1 + 496);
      Cursor.remainingBounds.getter();
      uint64_t v26 = v25;
      v38.origin.CGFloat x = Cursor.remainingBounds.getter();
      double v27 = CGRectGetWidth(v38);
      if (v7) {
        double v28 = dbl_1BF8CEAF8[*(void *)&v6];
      }
      else {
        double v28 = v6;
      }
      double v29 = v27 / v28;
      uint64_t result = swift_allocObject();
      uint64_t v14 = result;
      *(void *)(result + 16) = v23;
      *(void *)(result + 24) = v24;
      *(void *)(result + 32) = v26;
      *(double *)(result + 40) = v29;
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_0_21();
    uint64_t v15 = *(void *)(a1 + 488);
    uint64_t v16 = *(void *)(a1 + 496);
    Cursor.remainingBounds.getter();
    uint64_t v18 = v31;
  }
  else
  {
    OUTLINED_FUNCTION_0_21();
    uint64_t v15 = *(void *)(a1 + 488);
    uint64_t v16 = *(void *)(a1 + 496);
    Cursor.remainingBounds.getter();
    uint64_t v18 = v17;
    v33.origin.CGFloat x = Cursor.remainingBounds.getter();
    double v19 = CGRectGetHeight(v33) * v6;
  }
  uint64_t result = swift_allocObject();
  uint64_t v14 = result;
  *(void *)(result + 16) = v15;
  *(void *)(result + 24) = v16;
  *(double *)(result + 32) = v19;
  *(void *)(result + 40) = v18;
LABEL_15:
  if (qword_1EBA90300 != -1) {
    uint64_t result = swift_once();
  }
  char v30 = HIBYTE(word_1EBA8F7C8);
  *(unsigned char *)(v14 + 48) = word_1EBA8F7C8;
  *(unsigned char *)(v14 + 49) = v30;
  *a2 = v14;
  return result;
}

uint64_t sub_1BF8A56C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8A54D0(a1, a2);
}

uint64_t sub_1BF8A56E0()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for Ratio(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7E && *(unsigned char *)(a1 + 9))
    {
      unsigned int v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 8) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x1F))) ^ 0x7F;
      if (v2 >= 0x7D) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Ratio(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(unsigned char *)(result + 8) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RatioSizer()
{
  return &type metadata for RatioSizer;
}

uint64_t sub_1BF8A5828()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

double DimensionCursor.position.getter()
{
  char v1 = *v0;
  uint64_t v2 = *((void *)v0 + 1);
  uint64_t v3 = v2 + 488;
  if (v1)
  {
    swift_beginAccess();
    uint64_t v3 = v2 + 496;
  }
  else
  {
    swift_beginAccess();
  }
  return *(double *)v3;
}

double DimensionCursor.remainingBounds.getter()
{
  char v1 = *v0;
  double v2 = Cursor.remainingBounds.getter();
  if (v1)
  {
    return CGRectGetHeight(*(CGRect *)&v2);
  }
  else
  {
    return CGRectGetWidth(*(CGRect *)&v2);
  }
}

__n128 sub_1BF8A58F4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8) + 328;
  long long v3 = *(_OWORD *)(*(void *)(v1 + 8) + 344);
  *(_OWORD *)a1 = *(_OWORD *)v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  __n128 result = *(__n128 *)(v2 + 96);
  *(__n128 *)(a1 + 96) = result;
  return result;
}

double DimensionCursor.origin.getter()
{
  double result = 0.0;
  if ((*(unsigned char *)v0 & 1) == 0)
  {
    uint64_t v2 = *(void *)(v0 + 8);
    if (*(unsigned char *)(v2 + 328) != 3) {
      return *(double *)(v2 + 416);
    }
  }
  return result;
}

uint64_t sub_1BF8A5944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1BF8A594C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_1BF8A5984()
{
  return swift_release();
}

uint64_t sub_1BF8A598C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BF8A59D0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_1BF8A5A0C(uint64_t a1, int a2)
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

uint64_t sub_1BF8A5A4C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)double result = a2 ^ 0x80000000;
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

uint64_t type metadata accessor for DimensionCursor()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_1BF8A5AA0@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = *result;
  *(void *)(a3 + 8) = a2;
  return result;
}

double sub_1BF8A5AB0()
{
  return Cursor.scaleFactor.getter();
}

uint64_t HOverlay<A>(name:reversed:sizing:on:embedPath:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8A5C48(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, (uint64_t (*)(void))sub_1BF8A5BC4);
}

uint64_t type metadata accessor for Overlay()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8A5B30(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return sub_1BF8A5DC8(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t (*sub_1BF8A5BC4())()
{
  return sub_1BF8A63B4;
}

uint64_t VOverlay<A>(name:reversed:sizing:on:embedPath:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8A5C48(a1, a2, a3, a4, a5, a6, a7, a8, a9, 1, (uint64_t (*)(void))sub_1BF8A5D38);
}

uint64_t sub_1BF8A5C48(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t (*a11)(void))
{
  unint64_t v17 = *a4;
  type metadata accessor for Overlay();
  unint64_t v21 = v17;
  char v20 = a10;
  sub_1BF88E13C(v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BF8A5B30((uint64_t *)&v21, &v20, a1, a2, a5, a6, a7, a3);
  uint64_t v18 = a11();
  swift_release();
  return v18;
}

uint64_t (*sub_1BF8A5D38())()
{
  return sub_1BF8A63B8;
}

uint64_t sub_1BF8A5D78()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF8A5DC8(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v9 = *a1;
  char v10 = *a2;
  v8[11] = a5;
  v8[12] = a6;
  v8[13] = a7;
  char v14 = 3;
  uint64_t v13 = v9;
  char v12 = v10;
  return sub_1BF8B6CC4(&v14, &v13, &v12, a3, a4, a8);
}

uint64_t sub_1BF8A5E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = sub_1BF8A60F8();
  if (!v5)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v67 = a3;
    sub_1BF8B7A28(v10);
    type metadata accessor for Cursor();
    uint64_t v12 = v11[4];
    uint64_t v40 = v11[3];
    uint64_t v41 = v11[2];
    uint64_t v13 = v11[5];
    long long v34 = *(_OWORD *)(a1 + 160);
    long long v35 = *(_OWORD *)(a1 + 144);
    uint64_t v14 = *(void *)(a1 + 192);
    uint64_t v15 = *(void *)(a1 + 200);
    uint64_t v31 = *(void **)(a1 + 208);
    long long v32 = *(_OWORD *)(a1 + 216);
    long long v33 = *(_OWORD *)(a1 + 176);
    uint64_t v16 = *(void *)(a1 + 232);
    uint64_t v17 = *(void *)(a1 + 240);
    uint64_t v18 = *(void **)(a1 + 272);
    uint64_t v38 = *(void *)(a1 + 264);
    long long v37 = *(_OWORD *)(a1 + 280);
    uint64_t v19 = *(void *)(a1 + 296);
    uint64_t v20 = *(void *)(a1 + 304);
    char v36 = *(unsigned char *)(a1 + 312);
    v47[0] = 0xF000000000000007;
    *(void *)&v46[0] = 0xF000000000000007;
    v44[0] = 0xF000000000000007;
    v66[0] = 0xF000000000000007;
    type metadata accessor for LayoutMarginAdjuster();
    swift_allocObject();
    unint64_t v21 = LayoutMarginAdjuster.init(top:left:bottom:right:)(v47, (uint64_t *)v46, v44, v66);
    v47[0] = v12;
    v47[1] = v13;
    long long v48 = v35;
    long long v49 = v34;
    long long v50 = v33;
    uint64_t v51 = v14;
    uint64_t v52 = v15;
    uint64_t v53 = v31;
    long long v54 = v32;
    uint64_t v55 = v16;
    uint64_t v56 = v17;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = v38;
    double v60 = v18;
    uint64_t v39 = a4;
    uint64_t v22 = v18;
    long long v61 = v37;
    uint64_t v62 = v19;
    uint64_t v63 = v20;
    char v64 = v36;
    uint64_t v65 = v21;
    long long v23 = *(_OWORD *)(a1 + 344);
    v46[0] = *(_OWORD *)(a1 + 328);
    v46[1] = v23;
    long long v24 = *(_OWORD *)(a1 + 376);
    v46[2] = *(_OWORD *)(a1 + 360);
    v46[3] = v24;
    long long v25 = *(_OWORD *)(a1 + 408);
    v46[4] = *(_OWORD *)(a1 + 392);
    long long v26 = *(_OWORD *)(a1 + 424);
    v46[5] = v25;
    v46[6] = v26;
    char v45 = *(unsigned char *)(a1 + 48);
    sub_1BF8A0970(a1 + 544, (uint64_t)v44);
    v66[0] = 0x8000000000000000;
    LOBYTE(v18) = *(unsigned char *)(a1 + 440);
    id v27 = v31;
    id v28 = v22;
    sub_1BF8B6C5C(v43);
    v42[0] = v43[0];
    v42[1] = v43[1];
    uint64_t v29 = sub_1BF89FC40((uint64_t)v47, v46, &v45, (uint64_t)v44, v41, v40, 0, v42, v66, (char)v18);
    uint64_t v4 = sub_1BF8B6DD8(v29, a2, v67, v39);
    swift_release();
    swift_release();
  }
  return v4;
}

uint64_t sub_1BF8A60F8()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v3 = v1 + 40;
    double v4 = 0.0;
    double v5 = 0.0;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = LayoutContext.embedContext(for:)();
      if (v6)
      {
        double v7 = *(double *)(v6 + 40);
        double v5 = v5 + *(double *)(v6 + 32);
        swift_release();
        swift_bridgeObjectRelease();
        double v4 = v4 + v7;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n();
    uint64_t v9 = v0[11];
    uint64_t v8 = v0[12];
    uint64_t v10 = LayoutContext.contextFrame(for:)();
    if (v10)
    {
      uint64_t v11 = v10;
      sub_1BF8CBD38();
      sub_1BF8CBD48();
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      swift_release();
      char v20 = *(unsigned char *)(v11 + 48);
      swift_release();
      type metadata accessor for LayoutContextFrame();
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = v13;
      *(void *)(result + 24) = v15;
      *(void *)(result + 32) = v17;
      *(void *)(result + 40) = v19;
      *(unsigned char *)(result + 48) = v20;
    }
    else
    {
      sub_1BF891F44();
      swift_allocError();
      *(void *)uint64_t v25 = v1;
      *(void *)(v25 + 8) = v9;
      *(void *)(v25 + 16) = v8;
      *(unsigned char *)(v25 + 24) = 5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_willThrow();
      return swift_release();
    }
  }
  else
  {
    uint64_t v23 = v0[11];
    uint64_t v22 = v0[12];
    uint64_t result = LayoutContext.contextFrame(for:)();
    if (!result)
    {
      sub_1BF891F44();
      swift_allocError();
      *(void *)uint64_t v24 = v23;
      *(void *)(v24 + 8) = v22;
      *(void *)(v24 + 16) = 0;
      *(unsigned char *)(v24 + 24) = 4;
      swift_bridgeObjectRetain();
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_1BF8A631C()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8A634C()
{
  uint64_t v0 = sub_1BF8B76C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8A6384()
{
  uint64_t v0 = sub_1BF8A634C();
  return MEMORY[0x1F4186488](v0, 112, 7);
}

id sub_1BF8A63BC()
{
  id v1 = objc_msgSend(v0, sel_string);
  uint64_t v2 = sub_1BF8CBAA8();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4FB0738];
    if (objc_msgSend(v11, sel_attribute_atIndex_effectiveRange_, *MEMORY[0x1E4FB0738], 0, 0))
    {
      sub_1BF8CBE08();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v13, 0, sizeof(v13));
    }
    sub_1BF8A65E0((uint64_t)v13, (uint64_t)v14);
    if (v15)
    {
      sub_1BF8A6694();
      if (swift_dynamicCast())
      {
        if (objc_msgSend(v12, sel_lineBreakMode) == (id)4)
        {
          id v7 = objc_msgSend(v11, sel_length);
          id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v11);
          objc_msgSend(v8, sel_removeAttribute_range_, v6, 0, v7);
          id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
          objc_msgSend(v9, sel_setParagraphStyle_, v12);
          objc_msgSend(v9, sel_setLineBreakMode_, 0);
          objc_msgSend(v8, sel_addAttribute_value_range_, v6, v9, 0, v7);

          return v8;
        }
      }
    }
    else
    {
      sub_1BF8A2C10((uint64_t)v14);
    }
  }
  return v11;
}

uint64_t sub_1BF8A65E0(uint64_t a1, uint64_t a2)
{
  sub_1BF8A6644();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BF8A6644()
{
  if (!qword_1EBA902B8)
  {
    unint64_t v0 = sub_1BF8CBD98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA902B8);
    }
  }
}

unint64_t sub_1BF8A6694()
{
  unint64_t result = qword_1EBA90248;
  if (!qword_1EBA90248)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA90248);
  }
  return result;
}

ValueMetadata *type metadata accessor for TextLinesSizer()
{
  return &type metadata for TextLinesSizer;
}

void *sub_1BF8A66E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = v6[3];
  uint64_t v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  unint64_t result = (*(void *(**)(_OWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(v19, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = *(void *)&v19[0];
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    sub_1BF8A6E28((uint64_t)v6, (uint64_t)v19);
    uint64_t v17 = swift_allocObject();
    long long v18 = v19[1];
    *(_OWORD *)(v17 + 16) = v19[0];
    *(_OWORD *)(v17 + 32) = v18;
    *(_OWORD *)(v17 + 48) = v19[2];
    *(unsigned char *)(v17 + 64) = v20;
    *(void *)(v17 + 72) = v15;
    *(void *)(v16 + 24) = sub_1BF8A6EA4;
    *(void *)(v16 + 32) = v17;
    *a4 = v16 | 0x6000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

void sub_1BF8A6844(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, CGFloat a5@<D0>, CGFloat a6@<D1>, CGFloat a7@<D2>, CGFloat a8@<D3>)
{
  int64_t v15 = *(void *)(a2 + 40);
  if (*(unsigned char *)(a2 + 48) == 1)
  {
    if (v15 >= 1)
    {
      double Width = CGRectGetWidth(*(CGRect *)&a5);
      SizerResult.text.getter((uint64_t)&v34);
      long long v30 = v34;
      long long v31 = v35;
      id v28 = v36[0];
      long long v32 = *(_OWORD *)v36;
      uint64_t v33 = v37;
      sub_1BF8A6A64(v15, a1 & 1, (uint64_t)&v30, Width);
      double v18 = v17;

      v38.origin.CGFloat x = a5;
      v38.origin.CGFloat y = a6;
      v38.size.CGFloat width = a7;
      v38.size.CGFloat height = a8;
      if (v18 < CGRectGetHeight(v38))
      {
        *(void *)&long long v30 = a3;
        SizerResult.text.getter((uint64_t)&v34);
        id v19 = v36[0];
        if (v36[0])
        {
          objc_msgSend(v36[0], sel_boundingRectWithSize_options_context_, 33, 0, *(double *)&v36[1], v18);
          uint64_t v21 = v20;
          uint64_t v23 = v22;

          *(CGFloat *)a4 = a5;
          *(CGFloat *)(a4 + 8) = a6;
          *(void *)(a4 + 16) = v21;
          *(void *)(a4 + 24) = v23;
        }
        else
        {
          *(CGFloat *)a4 = a5;
          *(CGFloat *)(a4 + 8) = a6;
          *(CGFloat *)(a4 + 16) = a7;
          *(double *)(a4 + 24) = v18;
        }
        goto LABEL_11;
      }
    }
  }
  else if (v15 >= 1)
  {
    double v24 = CGRectGetWidth(*(CGRect *)&a5);
    SizerResult.text.getter((uint64_t)&v34);
    long long v30 = v34;
    long long v31 = v35;
    id v29 = v36[0];
    long long v32 = *(_OWORD *)v36;
    uint64_t v33 = v37;
    sub_1BF8A6A64(v15, a1 & 1, (uint64_t)&v30, v24);
    double v26 = v25;

    v39.origin.CGFloat x = a5;
    v39.origin.CGFloat y = a6;
    v39.size.CGFloat width = a7;
    v39.size.CGFloat height = a8;
    if (CGRectGetHeight(v39) < v26)
    {
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
LABEL_11:
      char v27 = 1;
      goto LABEL_12;
    }
  }
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  char v27 = 2;
LABEL_12:
  *(unsigned char *)(a4 + 32) = v27;
}

void sub_1BF8A6A64(int64_t a1, char a2, uint64_t a3, double a4)
{
  if (a1 >= 1)
  {
    uint64_t v6 = *(void **)(a3 + 32);
    uint64_t v27 = MEMORY[0x1E4FBC860];
    sub_1BF8A6F78(0, a1, 0);
    BOOL v7 = 0;
    uint64_t v8 = 1;
    int64_t v9 = a1;
    do
    {
      if (v7) {
        goto LABEL_20;
      }
      unint64_t v11 = *(void *)(v27 + 16);
      unint64_t v10 = *(void *)(v27 + 24);
      if (v11 >= v10 >> 1) {
        sub_1BF8A6F78(v10 > 1, v11 + 1, 1);
      }
      *(void *)(v27 + 16) = v11 + 1;
      uint64_t v12 = v27 + 16 * v11;
      *(void *)(v12 + 32) = 87;
      *(void *)(v12 + 40) = 0xE100000000000000;
      BOOL v7 = v8 == a1;
      if (v8 == a1)
      {
        uint64_t v8 = 0;
      }
      else if (__OFADD__(v8++, 1))
      {
        __break(1u);
        goto LABEL_19;
      }
      --v9;
    }
    while (v9);
    sub_1BF8A71E0(0, (unint64_t *)&qword_1EBA90218, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    sub_1BF89E290();
    uint64_t v14 = sub_1BF8CBA48();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    if (v6)
    {
      id v17 = v6;
      if ((uint64_t)objc_msgSend(v17, sel_length) > 0)
      {
        id v18 = objc_msgSend(v17, sel_attributesAtIndex_effectiveRange_, 0, 0);
        type metadata accessor for Key(0);
        sub_1BF899140();
        uint64_t v19 = sub_1BF8CB9D8();

LABEL_15:
        id v20 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
        id v21 = sub_1BF8A6EB0(v14, v16, v19);
        objc_msgSend(v21, sel_boundingRectWithSize_options_context_, 33, 0, a4, 1.79769313e308);
        if ((a2 & 1) == 0) {
          CGRectIntegral(*(CGRect *)&v22);
        }

        return;
      }
    }
    uint64_t v19 = 0;
    goto LABEL_15;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
}

void *sub_1BF8A6CD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8A66E4(a1, a2, a3, a4);
}

uint64_t sub_1BF8A6CE8()
{
  sub_1BF8A6D50(*(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  return 0x656E694C74786574;
}

uint64_t sub_1BF8A6D50(uint64_t a1, char a2)
{
  if (a2) {
    uint64_t v2 = 678977901;
  }
  else {
    uint64_t v2 = 678324589;
  }
  uint64_t v4 = v2;
  sub_1BF8CC018();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  return v4;
}

uint64_t sub_1BF8A6DD8()
{
  return sub_1BF8A6D50(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_1BF8A6DE4()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8A6E28(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF8A6E60()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_1BF8A6EA4(char a1@<W0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  sub_1BF8A6844(a1, v6 + 16, *(void *)(v6 + 72), a2, a3, a4, a5, a6);
}

id sub_1BF8A6EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_1BF8CBA78();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1BF899140();
    uint64_t v6 = (void *)sub_1BF8CB9C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

  return v7;
}

uint64_t sub_1BF8A6F58(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BF8A6F98(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1BF8A6F78(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BF8A70B8(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1BF8A6F98(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
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
    sub_1BF8A71E0(0, &qword_1EBA90290, (uint64_t)&type metadata for AltTextSized, MEMORY[0x1E4FBBE00]);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    sub_1BF8A17EC((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_1BF8A70B8(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
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
    sub_1BF8A71E0(0, &qword_1EBA902B0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    sub_1BF8A1814((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

ValueMetadata *type metadata accessor for TextLinesSizer.Lines()
{
  return &type metadata for TextLinesSizer.Lines;
}

void sub_1BF8A71E0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void *sub_1BF8A722C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void *sub_1BF8A725C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1BF8A7298(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for DynamicSizer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8A72E4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *__return_ptr, char *), uint64_t a5, uint64_t a6, uint64_t *a7)
{
  void (*v35)(void *__return_ptr, char *);
  uint64_t v36;
  uint64_t v37;
  void v38[3];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  long long v35 = a4;
  uint64_t v33 = a3;
  uint64_t v34 = a5;
  uint64_t v41 = a2;
  OUTLINED_FUNCTION_1_13();
  uint64_t v32 = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 80);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v37 = OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v16);
  id v18 = (char *)&v31 - v17;
  uint64_t v19 = type metadata accessor for Cursor();
  OUTLINED_FUNCTION_4_11(v19);
  uint64_t v20 = OUTLINED_FUNCTION_6_7();
  v21(v20);
  uint64_t v22 = v33;
  swift_dynamicCast();
  sub_1BF894E94(a7, (uint64_t)v12, v22, v18);
  swift_retain();
  swift_retain();
  uint64_t v23 = v36;
  v35(v38, v18);
  if (v23)
  {
    uint64_t v24 = OUTLINED_FUNCTION_2_14();
    v25(v24);
  }
  else
  {
    uint64_t v26 = v39;
    uint64_t v27 = v40;
    __swift_project_boxed_opaque_existential_1(v38, v39);
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v27 + 8))(a1, v41, v22, v14, *(void *)(v32 + 88), v26, v27);
    uint64_t v29 = OUTLINED_FUNCTION_2_14();
    v30(v29);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  return v22;
}

uint64_t sub_1BF8A7530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(void *__return_ptr, char *)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X6>, uint64_t a7@<X8>)
{
  void (*v34)(void *__return_ptr, char *);
  uint64_t v35;
  uint64_t v36;
  void v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v34 = a4;
  uint64_t v32 = a3;
  uint64_t v33 = a5;
  uint64_t v40 = a2;
  v31[1] = a7;
  OUTLINED_FUNCTION_1_13();
  v31[0] = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 80);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v15);
  char v36 = OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v16);
  id v18 = (char *)v31 - v17;
  uint64_t v19 = type metadata accessor for Cursor();
  OUTLINED_FUNCTION_4_11(v19);
  uint64_t v20 = OUTLINED_FUNCTION_6_7();
  v21(v20);
  uint64_t v22 = v32;
  swift_dynamicCast();
  sub_1BF894E94(a6, (uint64_t)v12, v22, v18);
  swift_retain();
  swift_retain();
  uint64_t v23 = v35;
  v34(v37, v18);
  if (v23)
  {
    uint64_t v24 = OUTLINED_FUNCTION_5_7();
    return v25(v24);
  }
  else
  {
    uint64_t v27 = v38;
    uint64_t v28 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v28 + 16))(a1, v40, v22, v14, *(void *)(v31[0] + 88), v27, v28);
    uint64_t v29 = OUTLINED_FUNCTION_5_7();
    v30(v29);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  }
}

uint64_t sub_1BF8A7764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BF8A72E4(a1, a2, a3, *(void (**)(void *__return_ptr, char *))v6, *(void *)(v6 + 8), *(void *)(a6 + 16), *(uint64_t **)(a6 + 24));
}

uint64_t sub_1BF8A7788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return sub_1BF8A7530(a1, a2, a3, *(void (**)(void *__return_ptr, char *))v5, *(void *)(v5 + 8), *(uint64_t **)(a4 + 24), a5);
}

uint64_t sub_1BF8A77AC()
{
  return 0x63696D616E7964;
}

uint64_t initializeWithCopy for OffsetSizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for OffsetSizer(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OffsetSizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for OffsetSizer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
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

uint64_t storeEnumTagSinglePayload for OffsetSizer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OffsetSizer()
{
  return &type metadata for OffsetSizer;
}

uint64_t sub_1BF8A7964(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v9 = *a1;
  uint64_t v10 = *(void *)(v5 + 24);
  uint64_t v11 = *(void *)(v5 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v5, v10);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v11 + 8))(a1, a2, a3, *(void *)(v9 + 80), *(void *)(v9 + 88), v10, v11);
  uint64_t v13 = result;
  if (!v4)
  {
    sub_1BF8A7E68();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BF8CD2F0;
    *(_OWORD *)(inited + 32) = *(_OWORD *)(v5 + 40);
    *(unsigned char *)(inited + 48) = 0;
    return sub_1BF8C7BD8(inited, v13);
  }
  return result;
}

void *sub_1BF8A7A64@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = v6[3];
  uint64_t v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  uint64_t result = (*(void *(**)(_OWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(v21, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = *(void *)&v21[0];
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = v6[5];
    uint64_t v18 = v6[6];
    sub_1BF8A7DCC((uint64_t)v6, (uint64_t)v21);
    uint64_t v19 = swift_allocObject();
    long long v20 = v21[1];
    *(_OWORD *)(v19 + 16) = v21[0];
    *(_OWORD *)(v19 + 32) = v20;
    *(_OWORD *)(v19 + 48) = v21[2];
    *(void *)(v19 + 64) = v22;
    *(void *)(v19 + 72) = v17;
    *(void *)(v19 + 80) = v18;
    *(void *)(v19 + 88) = a1;
    *(void *)(v16 + 24) = sub_1BF8A7E44;
    *(void *)(v16 + 32) = v19;
    *a4 = v16 | 0x7000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

double sub_1BF8A7BD4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, uint64_t a6, uint64_t a7)
{
  if (*(unsigned char *)(a7 + 440) == 1 && !*(unsigned char *)(a7 + 48)) {
    a5 = -a5;
  }
  double v11 = a5 + a1;
  CGRectGetWidth(*(CGRect *)&a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  CGRectGetHeight(v13);
  return v11;
}

uint64_t sub_1BF8A7C90(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8A7964(a1, a2, a3);
}

void *sub_1BF8A7CA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8A7A64(a1, a2, a3, a4);
}

uint64_t sub_1BF8A7CC0()
{
  return 0;
}

uint64_t sub_1BF8A7D88()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8A7DCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF8A7E04()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186498](v0, 96, 7);
}

double sub_1BF8A7E44(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF8A7BD4(a1, a2, a3, a4, *(double *)(v4 + 72), v4 + 16, *(void *)(v4 + 88));
}

void sub_1BF8A7E68()
{
  if (!qword_1EBA90288)
  {
    unint64_t v0 = sub_1BF8CC028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA90288);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for LayoutDecoderObject(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LayoutDecoderObject()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for LayoutDecoderObject(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LayoutDecoderObject(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LayoutDecoderObject()
{
  return &type metadata for LayoutDecoderObject;
}

uint64_t sub_1BF8A7F88()
{
  return sub_1BF8A2D18((uint64_t)&unk_1F1B048C8);
}

uint64_t sub_1BF8A7FB8@<X0>(uint64_t a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  swift_beginAccess();
  if (*(void *)(a1 + 64))
  {
    double v6 = *(double *)(a1 + 80);
    if (v6 <= 0.0)
    {
      uint64_t result = swift_allocObject();
      uint64_t v13 = result;
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      if (qword_1EBA90300 != -1) {
        uint64_t result = swift_once();
      }
      char v14 = HIBYTE(word_1EBA8F7C8);
      *(unsigned char *)(v13 + 48) = word_1EBA8F7C8;
      *(unsigned char *)(v13 + 49) = v14;
      *a3 = v13;
    }
    else
    {
      double v7 = *(double *)(a1 + 72);
      swift_bridgeObjectRetain();
      objc_msgSend(a2, sel_boundingRectWithSize_options_context_, 33, 0, v7, v6);
      CGFloat width = v17.size.width;
      CGFloat height = v17.size.height;
      if (trunc(CGRectGetHeight(v17)) <= trunc(v6))
      {
        swift_beginAccess();
        uint64_t v15 = *(void *)(a1 + 488);
        uint64_t v16 = *(void *)(a1 + 496);
        id v10 = a2;
        swift_bridgeObjectRelease();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = v15;
        *(void *)(result + 24) = v16;
        *(CGFloat *)(result + 32) = width;
        *(CGFloat *)(result + 40) = height;
        *(void *)(result + 48) = v15;
        *(void *)(result + 56) = v16;
        *(CGFloat *)(result + 64) = width;
        *(CGFloat *)(result + 72) = height;
      }
      else
      {
        id v10 = a2;
        swift_bridgeObjectRelease();
        uint64_t result = swift_allocObject();
        *(_OWORD *)(result + 16) = 0u;
        *(_OWORD *)(result + 32) = 0u;
        *(_OWORD *)(result + 48) = 0u;
        *(_OWORD *)(result + 64) = 0u;
      }
      *(void *)(result + 80) = v10;
      *(double *)(result + 88) = v7;
      *(double *)(result + 96) = v6;
      *a3 = result | 0x1000000000000000;
    }
  }
  else
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 40) = &type metadata for FlexibleTextSizer;
    *(void *)(v12 + 48) = &off_1F1B07DC8;
    *(void *)(v12 + 16) = a2;
    *a3 = v12 | 0x2000000000000000;
    return (uint64_t)a2;
  }
  return result;
}

uint64_t sub_1BF8A81C8()
{
  return sub_1BF8A7F88();
}

uint64_t sub_1BF8A81E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8A7FB8(a1, *v2, a2);
}

uint64_t sub_1BF8A81FC()
{
  return 0x656C626978656C66;
}

ValueMetadata *type metadata accessor for FlexibleTextSizer()
{
  return &type metadata for FlexibleTextSizer;
}

uint64_t sub_1BF8A822C()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8A823C()
{
  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1BF8A8274()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

double LayoutContentScale.scale.getter()
{
  return dbl_1BF8CEE58[*v0];
}

TeaTemplate::LayoutContentScale_optional __swiftcall LayoutContentScale.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_1BF8CBFF8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t LayoutContentScale.rawValue.getter()
{
  uint64_t result = 0x616D536172747865;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C6C616D73;
      break;
    case 2:
      uint64_t result = 0x6D756964656DLL;
      break;
    case 3:
      uint64_t result = 0x72616C75676572;
      break;
    case 4:
      uint64_t result = 0x656772616CLL;
      break;
    case 5:
      uint64_t result = 0x72614C6172747865;
      break;
    case 6:
      uint64_t result = 0x7478456172747865;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8A840C(unsigned __int8 *a1, char *a2)
{
  return sub_1BF896940(*a1, *a2);
}

unint64_t sub_1BF8A841C()
{
  unint64_t result = qword_1EBA90738[0];
  if (!qword_1EBA90738[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBA90738);
  }
  return result;
}

uint64_t sub_1BF8A8468()
{
  return sub_1BF8C6D9C(*v0);
}

uint64_t sub_1BF8A8470()
{
  return sub_1BF8C6FFC();
}

uint64_t sub_1BF8A8478(uint64_t a1)
{
  return sub_1BF8C71D4(a1, *v1);
}

TeaTemplate::LayoutContentScale_optional sub_1BF8A8480(Swift::String *a1)
{
  return LayoutContentScale.init(rawValue:)(*a1);
}

uint64_t sub_1BF8A848C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LayoutContentScale.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for LayoutContentScale(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for LayoutContentScale(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1BF8A8608);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutContentScale()
{
  return &type metadata for LayoutContentScale;
}

uint64_t SizerResult.isAmbiguous.getter()
{
  OUTLINED_FUNCTION_15();
  char v0 = 0;
  switch(v1)
  {
    case 2:
      char v0 = 1;
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      OUTLINED_FUNCTION_0_22();
      char v0 = SizerResult.isAmbiguous.getter();
      break;
    default:
      return v0 & 1;
  }
  return v0 & 1;
}

uint64_t SizerResult.cursorFrame.getter()
{
  return sub_1BF8A8898((uint64_t (*)(void))sub_1BF8A8BC0);
}

__C::CGRect __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SizerResult.postProcess(frame:nonIntegral:)(__C::CGRect frame, Swift::Bool nonIntegral)
{
  OUTLINED_FUNCTION_15();
  char v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  switch(v13)
  {
    case 3:
    case 4:
    case 6:
    case 9:
      double v15 = OUTLINED_FUNCTION_2_15();
      goto LABEL_3;
    case 5:
      double v15 = OUTLINED_FUNCTION_2_15();
      Swift::Bool v14 = 1;
LABEL_3:
      SizerResult.postProcess(frame:nonIntegral:)(*(__C::CGRect *)&v15, v14);
      if (!v19) {
        goto LABEL_4;
      }
      goto LABEL_8;
    case 7:
    case 8:
      long long v20 = *(void (**)(__n128, __n128, __n128, __n128))((v2 & 0xFFFFFFFFFFFFFFFLL) + 0x18);
      swift_retain();
      swift_retain();
      v28.origin.CGFloat x = OUTLINED_FUNCTION_2_15();
      __C::CGRect v29 = SizerResult.postProcess(frame:nonIntegral:)(v28, v21);
      if (v22)
      {
        swift_release();
        swift_release();
      }
      else
      {
        v20((__n128)v29.origin, *(__n128 *)&v29.origin.y, (__n128)v29.size, *(__n128 *)&v29.size.height);
        OUTLINED_FUNCTION_5();
        swift_release();
        char v27 = SizerResult.nonIntegral.getter();
        swift_release();
        if ((v27 & 1) == 0 && (v4 & 1) == 0)
        {
          v30.origin.CGFloat x = v12;
          v30.origin.CGFloat y = v10;
          v30.size.CGFloat width = v8;
          v30.size.CGFloat height = v6;
          CGRectIntegral(v30);
LABEL_4:
          OUTLINED_FUNCTION_5();
        }
      }
LABEL_8:
      double v23 = OUTLINED_FUNCTION_2_15();
      result.size.CGFloat height = v26;
      result.size.CGFloat width = v25;
      result.origin.CGFloat y = v24;
      result.origin.CGFloat x = v23;
      return result;
    default:
      goto LABEL_8;
  }
}

uint64_t SizerResult.frame.getter()
{
  return sub_1BF8A8898((uint64_t (*)(void))sub_1BF8A9020);
}

uint64_t sub_1BF8A8898(uint64_t (*a1)(void))
{
  char v2 = SizerResult.nonIntegral.getter();
  return a1(v2 & 1);
}

uint64_t SizerResult.metadata.getter()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = 0;
  switch(v2)
  {
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      OUTLINED_FUNCTION_0_22();
      uint64_t v1 = SizerResult.metadata.getter(v3);
      break;
    case 9:
      uint64_t v5 = *(void *)((v0 & 0xFFFFFFFFFFFFFFFLL) + 0x18);
      swift_retain();
      uint64_t v6 = swift_bridgeObjectRetain();
      uint64_t v7 = SizerResult.metadata.getter(v6);
      if (v7)
      {
        uint64_t v1 = sub_1BF8A9620(v7, v5);
        swift_release();
      }
      else
      {
        swift_release();
        uint64_t v1 = v5;
      }
      break;
    default:
      return v1;
  }
  return v1;
}

double *static SizerResult.frame(_:)@<X0>(double **a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  __C::CGRect result = (double *)swift_allocObject();
  double v11 = result;
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  if (qword_1EBA90300 != -1) {
    __C::CGRect result = (double *)swift_once();
  }
  char v12 = HIBYTE(word_1EBA8F7C8);
  *((unsigned char *)v11 + 48) = word_1EBA8F7C8;
  *((unsigned char *)v11 + 49) = v12;
  *a1 = v11;
  return result;
}

void SizerResult.text.getter(uint64_t a1@<X8>)
{
  switch(*v1 >> 60)
  {
    case 1:
      uint64_t v2 = *v1 & 0xFFFFFFFFFFFFFFFLL;
      uint64_t v3 = *(void **)(v2 + 0x50);
      long long v4 = *(_OWORD *)(v2 + 0x40);
      *(_OWORD *)a1 = *(_OWORD *)(v2 + 0x30);
      *(_OWORD *)(a1 + 16) = v4;
      *(void *)(a1 + 32) = v3;
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(v2 + 88);
      id v5 = v3;
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      OUTLINED_FUNCTION_21();
      SizerResult.text.getter();
      break;
    default:
      *(void *)(a1 + 48) = 0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)a1 = 0u;
      break;
  }
}

uint64_t SizerResult.nonIntegral.getter()
{
  OUTLINED_FUNCTION_15();
  char v0 = 0;
  switch(v1)
  {
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
      OUTLINED_FUNCTION_0_22();
      char v0 = SizerResult.nonIntegral.getter();
      break;
    case 5:
      char v0 = 1;
      break;
    default:
      return v0 & 1;
  }
  return v0 & 1;
}

void sub_1BF8A8BC0(char a1)
{
  void (*v20)(uint64_t *__return_ptr, void, double, double, double, double);
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned char *v36;
  uint64_t v37;
  unsigned char *v38;
  uint64_t v39;
  char v40;
  CGRect v41;
  CGRect v42;

  uint64_t v6 = *v1;
  switch((unint64_t)*v1 >> 60)
  {
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      uint64_t v8 = OUTLINED_FUNCTION_14();
      sub_1BF8A8BC0(v8);
      goto LABEL_3;
    case 4uLL:
      OUTLINED_FUNCTION_13();
      double v9 = &v39;
      sub_1BF8A9020(a1 & 1);
      OUTLINED_FUNCTION_17();
      if (v4)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = MEMORY[0x1E4FBC860];
        do
        {
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_22();
          if (!(v14 ^ v15 | v13)) {
            uint64_t v11 = v5;
          }
          if (v9) {
            uint64_t v5 = v11;
          }
          else {
            uint64_t v5 = v12;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_20();
            uint64_t v10 = v17;
          }
          unint64_t v16 = *(void *)(v10 + 16);
          LODWORD(v9) = v16 + 1;
          if (v16 >= *(void *)(v10 + 24) >> 1)
          {
            OUTLINED_FUNCTION_18();
            uint64_t v10 = v18;
          }
          OUTLINED_FUNCTION_7_5();
        }
        while (!v13);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = MEMORY[0x1E4FBC860];
      }
      if (*(void *)(v2 + 16))
      {
        swift_bridgeObjectRetain();
        __C::CGRect v29 = MEMORY[0x1E4FBC860];
        do
        {
          OUTLINED_FUNCTION_11_0();
          OUTLINED_FUNCTION_22();
          if (!(v14 ^ v15 | v13)) {
            CGRect v30 = v5;
          }
          if (v3) {
            uint64_t v5 = v30;
          }
          else {
            uint64_t v5 = v31;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_16();
            __C::CGRect v29 = v33;
          }
          uint64_t v32 = *(void *)(v29 + 16);
          int v3 = v32 + 1;
          if (v32 >= *(void *)(v29 + 24) >> 1)
          {
            OUTLINED_FUNCTION_19();
            __C::CGRect v29 = v34;
          }
          OUTLINED_FUNCTION_6_8();
        }
        while (!v13);
        swift_bridgeObjectRelease();
      }
      else
      {
        __C::CGRect v29 = MEMORY[0x1E4FBC860];
      }
      long long v35 = *(void *)(v10 + 16);
      if (v35)
      {
        swift_bridgeObjectRetain();
        char v36 = (unsigned char *)(v10 + 64);
        do
        {
          switch(*v36)
          {
            case 2:
              OUTLINED_FUNCTION_4_12();
              OUTLINED_FUNCTION_24();
              break;
            case 3:
              OUTLINED_FUNCTION_3_11();
              OUTLINED_FUNCTION_23();
              break;
            default:
              break;
          }
          v36 += 40;
          --v35;
        }
        while (v35);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v37 = *(void *)(v29 + 16);
      if (!v37)
      {
        swift_bridgeObjectRelease();
        goto LABEL_56;
      }
      swift_bridgeObjectRetain();
      CGRect v38 = (unsigned char *)(v29 + 64);
      do
      {
        switch(*v38)
        {
          case 2:
            OUTLINED_FUNCTION_4_12();
            OUTLINED_FUNCTION_24();
            break;
          case 3:
            OUTLINED_FUNCTION_3_11();
            OUTLINED_FUNCTION_23();
            break;
          default:
            break;
        }
        v38 += 40;
        --v37;
      }
      while (v37);
      swift_release();
      swift_bridgeObjectRelease_n();
      goto LABEL_4;
    case 6uLL:
      uint64_t v19 = *(void *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 0x10);
      long long v20 = *(void (**)(uint64_t *__return_ptr, void, double, double, double, double))((v6 & 0xFFFFFFFFFFFFFFFLL)
                                                                                                 + 0x18);
      swift_retain();
      swift_retain();
      sub_1BF8A9020(a1 & 1);
      uint64_t v22 = v21;
      double v24 = v23;
      double v26 = v25;
      __C::CGRect v28 = v27;
      CGRect v39 = v19;
      sub_1BF8A8BC0(a1 & 1);
      OUTLINED_FUNCTION_1_14();
      v20(&v39, a1 & 1, v22, v24, v26, v28);
      if (v40)
      {
        if (a1) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      v41.origin.CGFloat x = OUTLINED_FUNCTION_9_2();
      CGRectUnion(v41, v42);
      OUTLINED_FUNCTION_1_14();
      if ((a1 & 1) == 0)
      {
LABEL_23:
        OUTLINED_FUNCTION_5_8();
        OUTLINED_FUNCTION_1_14();
      }
LABEL_24:
      swift_release();
LABEL_56:
      swift_release();
LABEL_4:
      OUTLINED_FUNCTION_9_2();
      return;
    default:
      OUTLINED_FUNCTION_10_0();
      if ((a1 & 1) == 0)
      {
        OUTLINED_FUNCTION_5_8();
LABEL_3:
        OUTLINED_FUNCTION_1_14();
      }
      goto LABEL_4;
  }
}

void sub_1BF8A9020(char a1)
{
  void (*v19)(uint64_t *__return_ptr, void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned char *v27;
  uint64_t v28;
  unsigned char *v29;
  uint64_t v30;

  uint64_t v6 = *v1;
  switch((unint64_t)*v1 >> 60)
  {
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      uint64_t v8 = OUTLINED_FUNCTION_14();
      sub_1BF8A9020(v8);
      goto LABEL_3;
    case 4uLL:
      OUTLINED_FUNCTION_13();
      double v9 = &v30;
      sub_1BF8A9020(a1 & 1);
      OUTLINED_FUNCTION_17();
      if (v4)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = MEMORY[0x1E4FBC860];
        do
        {
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_22();
          if (!(v14 ^ v15 | v13)) {
            uint64_t v11 = v5;
          }
          if (v9) {
            uint64_t v5 = v11;
          }
          else {
            uint64_t v5 = v12;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_20();
            uint64_t v10 = v17;
          }
          unint64_t v16 = *(void *)(v10 + 16);
          LODWORD(v9) = v16 + 1;
          if (v16 >= *(void *)(v10 + 24) >> 1)
          {
            OUTLINED_FUNCTION_18();
            uint64_t v10 = v18;
          }
          OUTLINED_FUNCTION_7_5();
        }
        while (!v13);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = MEMORY[0x1E4FBC860];
      }
      if (*(void *)(v2 + 16))
      {
        swift_bridgeObjectRetain();
        long long v20 = MEMORY[0x1E4FBC860];
        do
        {
          OUTLINED_FUNCTION_11_0();
          OUTLINED_FUNCTION_22();
          if (!(v14 ^ v15 | v13)) {
            Swift::Bool v21 = v5;
          }
          if (v3) {
            uint64_t v5 = v21;
          }
          else {
            uint64_t v5 = v22;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_16();
            long long v20 = v24;
          }
          double v23 = *(void *)(v20 + 16);
          int v3 = v23 + 1;
          if (v23 >= *(void *)(v20 + 24) >> 1)
          {
            OUTLINED_FUNCTION_19();
            long long v20 = v25;
          }
          OUTLINED_FUNCTION_6_8();
        }
        while (!v13);
        swift_bridgeObjectRelease();
      }
      else
      {
        long long v20 = MEMORY[0x1E4FBC860];
      }
      double v26 = *(void *)(v10 + 16);
      if (v26)
      {
        swift_bridgeObjectRetain();
        char v27 = (unsigned char *)(v10 + 64);
        do
        {
          switch(*v27)
          {
            case 2:
              OUTLINED_FUNCTION_4_12();
              OUTLINED_FUNCTION_24();
              break;
            case 3:
              OUTLINED_FUNCTION_3_11();
              OUTLINED_FUNCTION_23();
              break;
            default:
              break;
          }
          v27 += 40;
          --v26;
        }
        while (v26);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      __C::CGRect v28 = *(void *)(v20 + 16);
      if (v28)
      {
        swift_bridgeObjectRetain();
        __C::CGRect v29 = (unsigned char *)(v20 + 64);
        do
        {
          switch(*v29)
          {
            case 2:
              OUTLINED_FUNCTION_4_12();
              OUTLINED_FUNCTION_24();
              break;
            case 3:
              OUTLINED_FUNCTION_3_11();
              OUTLINED_FUNCTION_23();
              break;
            default:
              break;
          }
          v29 += 40;
          --v28;
        }
        while (v28);
        swift_release();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_55:
        swift_release();
      }
LABEL_4:
      OUTLINED_FUNCTION_9_2();
      return;
    case 6uLL:
      uint64_t v19 = *(void (**)(uint64_t *__return_ptr, void))((v6 & 0xFFFFFFFFFFFFFFFLL) + 0x18);
      CGRect v30 = *(void *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 0x10);
      swift_retain();
      swift_retain();
      sub_1BF8A9020(a1 & 1);
      OUTLINED_FUNCTION_5();
      v19(&v30, a1 & 1);
      if ((a1 & 1) == 0)
      {
        OUTLINED_FUNCTION_5_8();
        OUTLINED_FUNCTION_1_14();
      }
      swift_release();
      goto LABEL_55;
    default:
      OUTLINED_FUNCTION_10_0();
      if ((a1 & 1) == 0)
      {
        OUTLINED_FUNCTION_5_8();
LABEL_3:
        OUTLINED_FUNCTION_1_14();
      }
      goto LABEL_4;
  }
}

uint64_t SizerResult.shouldResize.getter()
{
  OUTLINED_FUNCTION_15();
  char v0 = 0;
  switch(v1)
  {
    case 3:
      char v0 = 1;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      OUTLINED_FUNCTION_0_22();
      char v0 = SizerResult.shouldResize.getter();
      break;
    default:
      return v0 & 1;
  }
  return v0 & 1;
}

uint64_t SizerResult.shouldPostProcess.getter()
{
  OUTLINED_FUNCTION_15();
  char v0 = 0;
  switch(v1)
  {
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
      OUTLINED_FUNCTION_0_22();
      char v0 = SizerResult.shouldPostProcess.getter();
      break;
    case 7:
      char v0 = 1;
      break;
    default:
      return v0 & 1;
  }
  return v0 & 1;
}

uint64_t SizerResult.behavior.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = *v1;
  switch((unint64_t)*v1 >> 60)
  {
    case 1uLL:
    case 2uLL:
      if (qword_1EBA90300 != -1)
      {
        uint64_t v6 = a1;
        uint64_t result = swift_once();
        a1 = v6;
      }
      char v4 = word_1EBA8F7C8;
      char v5 = HIBYTE(word_1EBA8F7C8);
      goto LABEL_7;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      OUTLINED_FUNCTION_21();
      uint64_t result = SizerResult.behavior.getter();
      break;
    default:
      char v4 = *(unsigned char *)(v2 + 48);
      char v5 = *(unsigned char *)(v2 + 49);
LABEL_7:
      *a1 = v4;
      a1[1] = v5;
      break;
  }
  return result;
}

uint64_t sub_1BF8A9620(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_1BF8A9930(a1, (uint64_t)sub_1BF8A9924, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1BF8A96AC()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void *initializeBufferWithCopyOfBuffer for SizerResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for SizerResult()
{
  return swift_release();
}

void *assignWithCopy for SizerResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for SizerResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SizerResult(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x77 && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 118;
    }
    else
    {
      unsigned int v2 = ((*(void *)a1 >> 60) & 0x8F | (16 * (*(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x76) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SizerResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x76)
  {
    *(void *)uint64_t result = a2 - 119;
    if (a3 >= 0x77) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x77) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 4) & 7 | (8 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BF8A9810(void *a1)
{
  return *a1 >> 60;
}

void *sub_1BF8A981C(void *result)
{
  *result &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_1BF8A982C(uint64_t *result, uint64_t a2)
{
  *uint64_t result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 60);
  return result;
}

ValueMetadata *type metadata accessor for SizerResult()
{
  return &type metadata for SizerResult;
}

uint64_t getEnumTagSinglePayload for SizerResult.ProcessResult(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for SizerResult.ProcessResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8A98D8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1BF8A98F0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SizerResult.ProcessResult()
{
  return &type metadata for SizerResult.ProcessResult;
}

uint64_t sub_1BF8A991C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8A9B48(a3, a2);
}

uint64_t sub_1BF8A9924@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF8A991C(a1, a2, a1);
}

uint64_t sub_1BF8A9930(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_1BF8A9EA4(a1, a2, a3, &v27);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF8A9EE0(&v25);
  if (!v26)
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1BF8AA08C();
    return swift_release();
  }
  while (1)
  {
    sub_1BF8AA094(&v25, v24);
    uint64_t v7 = *a5;
    unint64_t v9 = sub_1BF899A58();
    uint64_t v10 = *(void *)(v7 + 16);
    BOOL v11 = (v8 & 1) == 0;
    uint64_t v12 = v10 + v11;
    if (__OFADD__(v10, v11)) {
      break;
    }
    char v13 = v8;
    if (*(void *)(v7 + 24) >= v12)
    {
      if (a4)
      {
        if (v8) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_1BF8AA0A4(0, &qword_1EA170320, MEMORY[0x1E4FBBCB8]);
        sub_1BF8CBF78();
        if (v13) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_1BF8A9BA4(v12, a4 & 1);
      uint64_t v14 = sub_1BF899A58();
      if ((v13 & 1) != (v15 & 1)) {
        goto LABEL_17;
      }
      unint64_t v9 = v14;
      if (v13)
      {
LABEL_9:
        sub_1BF8A9B48(*(void *)(*a5 + 56) + 32 * v9, (uint64_t)v22);
        sub_1BF8A9B48((uint64_t)v22, (uint64_t)v23);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        unint64_t v16 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v9);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
        sub_1BF8AA094(v23, v16);
        goto LABEL_13;
      }
    }
    uint64_t v17 = *a5;
    *(void *)(*a5 + 8 * (v9 >> 6) + 64) |= 1 << v9;
    sub_1BF8AA094(v24, (_OWORD *)(*(void *)(v17 + 56) + 32 * v9));
    uint64_t v18 = *(void *)(v17 + 16);
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_16;
    }
    *(void *)(v17 + 16) = v20;
LABEL_13:
    sub_1BF8A9EE0(&v25);
    a4 = 1;
    if (!v26) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = sub_1BF8CC158();
  __break(1u);
  return result;
}

uint64_t sub_1BF8A9B48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BF8A9BA4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF8AA0A4(0, qword_1EBA8EF98, MEMORY[0x1E4FBBD58]);
  uint64_t v6 = sub_1BF8CBFC8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v15 << 6))
    {
      Swift::Bool v21 = (_OWORD *)(*(void *)(v5 + 56) + 32 * i);
      if (a2) {
        sub_1BF8AA094(v21, v31);
      }
      else {
        sub_1BF8A9B48((uint64_t)v21, (uint64_t)v31);
      }
      sub_1BF8CC1A8();
      sub_1BF8CBAB8();
      uint64_t result = sub_1BF8CC1D8();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v13 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      uint64_t result = (uint64_t)sub_1BF8AA094(v31, (_OWORD *)(*(void *)(v7 + 56) + 32 * v25));
      ++*(void *)(v7 + 16);
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_42;
      }
      if (v18 >= v12) {
        goto LABEL_33;
      }
      unint64_t v19 = v9[v18];
      ++v15;
      if (!v19)
      {
        int64_t v15 = v18 + 1;
        if (v18 + 1 >= v12) {
          goto LABEL_33;
        }
        unint64_t v19 = v9[v15];
        if (!v19)
        {
          int64_t v20 = v18 + 2;
          if (v20 >= v12)
          {
LABEL_33:
            swift_release();
            if ((a2 & 1) == 0)
            {
              uint64_t result = swift_release();
              uint64_t v3 = v2;
              goto LABEL_40;
            }
            uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
            if (v30 >= 64) {
              sub_1BF8C826C(0, (unint64_t)(v30 + 63) >> 6, (void *)(v5 + 64));
            }
            else {
              *unint64_t v9 = -1 << v30;
            }
            uint64_t v3 = v2;
            *(void *)(v5 + 16) = 0;
            break;
          }
          unint64_t v19 = v9[v20];
          if (!v19)
          {
            while (1)
            {
              int64_t v15 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_43;
              }
              if (v15 >= v12) {
                goto LABEL_33;
              }
              unint64_t v19 = v9[v15];
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }
          int64_t v15 = v20;
        }
      }
LABEL_18:
      unint64_t v11 = (v19 - 1) & v19;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF8A9EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
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

uint64_t sub_1BF8A9EE0@<X0>(_OWORD *a1@<X8>)
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
    sub_1BF8A9B48(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v21);
    goto LABEL_23;
  }
  int64_t v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    unint64_t v13 = *(void *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      uint64_t v9 = (v13 - 1) & v13;
      unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
      int64_t v7 = v11;
      goto LABEL_3;
    }
    int64_t v14 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        int64_t v11 = v14;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        unint64_t v13 = *(void *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          int64_t v11 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v14 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          unint64_t v13 = *(void *)(v4 + 8 * v14);
          if (v13) {
            goto LABEL_10;
          }
          int64_t v11 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            unint64_t v13 = *(void *)(v4 + 8 * v11);
            if (v13) {
              goto LABEL_7;
            }
            int64_t v7 = v12 - 1;
            int64_t v15 = v5 + 6;
            while (v15 < v12)
            {
              unint64_t v13 = *(void *)(v4 + 8 * v15++);
              if (v13)
              {
                int64_t v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v21, 0, sizeof(v21));
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  unint64_t v16 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_1BF8AA114((uint64_t)v21, (uint64_t)&v19);
  if (*((void *)&v20 + 1))
  {
    v18[0] = v19;
    v18[1] = v20;
    v16(v18);
    return sub_1BF8AA234((uint64_t)v18);
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_1BF8AA08C()
{
  return swift_release();
}

_OWORD *sub_1BF8AA094(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1BF8AA0A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BF8A2BC4();
    unint64_t v7 = a3(a1, &type metadata for SizerResultMetadataKey, MEMORY[0x1E4FBC840] + 8, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BF8AA114(uint64_t a1, uint64_t a2)
{
  sub_1BF8AA178();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BF8AA178()
{
  if (!qword_1EA170328)
  {
    sub_1BF8AA1D0();
    unint64_t v0 = sub_1BF8CBD98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA170328);
    }
  }
}

void sub_1BF8AA1D0()
{
  if (!qword_1EA170330)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA170330);
    }
  }
}

uint64_t sub_1BF8AA234(uint64_t a1)
{
  sub_1BF8AA1D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Optional<A>.flipRightToLeft(bounds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v13 = *(void *)(a1 + 16);
  OUTLINED_FUNCTION_0_4();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  int64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v19);
  Swift::Bool v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v22 + 16))(v21, v23);
  uint64_t v24 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v13) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v21, v13);
    (*(void (**)(uint64_t, double, double, double, double))(*(void *)(a2 + 24) + 8))(v13, a4, a5, a6, a7);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
    uint64_t v24 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a3, v24, 1, v13);
}

uint64_t sub_1BF8AA460(void *a1)
{
  a1[1] = swift_getWitnessTable();
  a1[2] = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  a1[3] = result;
  return result;
}

uint64_t sub_1BF8AA514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  return Optional<A>.flipRightToLeft(bounds:)(a1, *(void *)(a2 - 8), a3, a4, a5, a6, a7);
}

BOOL static FastLayoutDecoderError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FastLayoutDecoderError.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t FastLayoutDecoderError.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

unint64_t sub_1BF8AA5B4()
{
  unint64_t result = qword_1EA170338[0];
  if (!qword_1EA170338[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA170338);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FastLayoutDecoderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8AA6CCLL);
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

ValueMetadata *type metadata accessor for FastLayoutDecoderError()
{
  return &type metadata for FastLayoutDecoderError;
}

Swift::Void __swiftcall BoxBuilder.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t BoxBuilder.deinit()
{
  swift_release();
  return v0;
}

uint64_t BoxBuilder.__deallocating_deinit()
{
  BoxBuilder.deinit();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BF8AA77C(uint64_t a1)
{
  return BoxBuilder.add(node:)(a1);
}

uint64_t BoxBuilder.add(node:)(uint64_t a1)
{
  sub_1BF89B278();
  swift_allocObject();
  sub_1BF8CBB98();
  *uint64_t v2 = a1;
  type metadata accessor for Node();
  sub_1BF8A4268();
  swift_retain();
  sub_1BF8B7948();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for BoxBuilder()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for BoxBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BoxBuilder);
}

uint64_t sub_1BF8AA898(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v42 = MEMORY[0x1E4FBC860];
    sub_1BF8A6F58(0, v5, 0);
    uint64_t result = v42;
    uint64_t v8 = (void **)(a3 + 64);
    while (1)
    {
      uint64_t v32 = v4;
      uint64_t v9 = result;
      uint64_t v10 = (uint64_t)*(v8 - 3);
      int64_t v12 = *(v8 - 2);
      uint64_t v11 = (uint64_t)*(v8 - 1);
      uint64_t v13 = *v8;
      v33[0] = *(v8 - 4);
      v33[1] = v10;
      v33[2] = v12;
      v33[3] = v11;
      v33[4] = v13;
      swift_retain();
      id v14 = v13;
      swift_bridgeObjectRetain();
      id v15 = v12;
      a1(&v34, v33);
      if (v32) {
        break;
      }

      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v16 = v34;
      long long v17 = v35;
      uint64_t v18 = v36;
      uint64_t v19 = v37;
      long long v20 = v38;
      long long v21 = v39;
      uint64_t v22 = v40;
      long long v23 = v41;
      uint64_t result = v9;
      unint64_t v24 = *(void *)(v9 + 16);
      unint64_t v25 = *(void *)(result + 24);
      uint64_t v42 = result;
      if (v24 >= v25 >> 1)
      {
        long long v29 = v38;
        long long v30 = v35;
        long long v27 = v41;
        long long v28 = v39;
        sub_1BF8A6F58(v25 > 1, v24 + 1, 1);
        long long v23 = v27;
        long long v21 = v28;
        long long v20 = v29;
        long long v17 = v30;
        uint64_t result = v42;
      }
      *(void *)(result + 16) = v24 + 1;
      uint64_t v26 = result + 96 * v24;
      *(void *)(v26 + 32) = v16;
      *(_OWORD *)(v26 + 40) = v17;
      *(void *)(v26 + 56) = v18;
      *(void *)(v26 + 64) = v19;
      *(_OWORD *)(v26 + 72) = v20;
      *(_OWORD *)(v26 + 88) = v21;
      *(void *)(v26 + 104) = v22;
      *(_OWORD *)(v26 + 112) = v23;
      v8 += 5;
      --v5;
      uint64_t v4 = 0;
      if (!v5) {
        return result;
      }
    }
    swift_release();

    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BF8AAA5C(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X4>, unint64_t *a5@<X8>)
{
  uint64_t v6 = v5;
  char v68 = a3;
  uint64_t v10 = *(void *)(a2 + 24);
  if (v10)
  {
    uint64_t v11 = *(void *)(a2 + 16);
    uint64_t v12 = (unint64_t)LayoutContext.metadata(for:)(*(Swift::String *)(&v10 - 1));
    if (v12)
    {
      uint64_t v13 = v12;
      sub_1BF8BA160(v12, &v70);
      if (v72 == 0.0)
      {
        swift_bridgeObjectRelease();
        sub_1BF8A2C10((uint64_t)&v70);
      }
      else
      {
        sub_1BF8A2B84();
        if (swift_dynamicCast())
        {
          id v14 = sub_1BF8A63BC();
          sub_1BF8AAFB4(v14, a1, &v70);

          long long v15 = v70;
          double v16 = v71;
          double v17 = v72;
          uint64_t v18 = v73;
          uint64_t v19 = v74;
          uint64_t v20 = v75;
          uint64_t v21 = swift_allocObject();
          uint64_t v22 = swift_allocObject();
          *(_OWORD *)(v22 + 16) = v15;
          *(double *)(v22 + 32) = v16;
          *(double *)(v22 + 40) = v17;
          *(_OWORD *)(v22 + 48) = v15;
          *(double *)(v22 + 64) = v16;
          *(double *)(v22 + 72) = v17;
          *(void *)(v22 + 80) = v18;
          *(void *)(v22 + 88) = v19;
          *(void *)(v22 + 96) = v20;
          *(void *)(v21 + 16) = v22 | 0x1000000000000000;
          *(void *)(v21 + 24) = v13;
          unint64_t v23 = v21 | 0x9000000000000000;
LABEL_16:
          *a5 = v23;
          return;
        }
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_1BF8AAFB4(v68, a1, &v70);
  uint64_t v67 = v70;
  double v24 = v71;
  uint64_t v66 = *((void *)&v70 + 1);
  double v25 = v72;
  id v26 = v73;
  uint64_t v27 = v74;
  uint64_t v28 = v75;
  MEMORY[0x1F4188790](v29);
  v59[2] = v68;
  v59[3] = a4;
  v59[4] = a1;
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1BF8AA898((void (*)(uint64_t *__return_ptr, void *))sub_1BF8AB150, (uint64_t)v59, a4);
  swift_bridgeObjectRelease();
  *(void *)&long long v70 = v30;
  sub_1BF8A2C94(0, &qword_1EBA90208, (uint64_t)&type metadata for AltTextSized, MEMORY[0x1E4FBB320]);
  sub_1BF8A2990();
  sub_1BF8A2A04();
  uint64_t v31 = sub_1BF8CBAE8();
  uint64_t v32 = *(void *)(v30 + 16);
  if (!v32)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_15:
    swift_allocObject();
    double v50 = OUTLINED_FUNCTION_1_15();
    *(double *)(v51 + 16) = v50;
    *(void *)(v51 + 24) = v52;
    *(double *)(v51 + 32) = v24;
    *(double *)(v51 + 40) = v25;
    *(double *)(v51 + 48) = v50;
    *(void *)(v51 + 56) = v52;
    *(double *)(v51 + 64) = v24;
    *(double *)(v51 + 72) = v25;
    *(void *)(v51 + 80) = v26;
    *(void *)(v51 + 88) = v27;
    *(void *)(v51 + 96) = v28;
    unint64_t v23 = v51 | 0x1000000000000000;
    goto LABEL_16;
  }
  uint64_t v65 = v31;
  uint64_t v60 = v28;
  uint64_t v61 = v27;
  id v64 = v26;
  uint64_t v62 = a5;
  swift_bridgeObjectRetain();
  uint64_t v63 = v30;
  uint64_t v33 = v30 + 64;
  while (1)
  {
    uint64_t v34 = *(void **)(v33 - 16);
    long long v35 = *(void **)v33;
    uint64_t v36 = *(void *)(v33 + 8);
    uint64_t v37 = *(void *)(v33 + 16);
    uint64_t v38 = *(void *)(v33 + 24);
    uint64_t v39 = *(void *)(v33 + 32);
    uint64_t v40 = *(void **)(v33 + 40);
    uint64_t v41 = *(void *)(v33 + 48);
    uint64_t v42 = *(void *)(v33 + 56);
    *(void *)&long long v70 = *(void *)(v33 - 8);
    swift_retain_n();
    id v43 = v35;
    id v44 = v40;
    swift_bridgeObjectRetain();
    id v45 = v34;
    double v46 = OUTLINED_FUNCTION_1_15();
    char v48 = sub_1BF8B7E9C((const __CFAttributedString *)v68, v65, v46, v47, v24, v25);
    if (v6)
    {
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_0_23();
      swift_bridgeObjectRelease();
      swift_release_n();
      return;
    }
    char v49 = v48;
    swift_release();
    if (v49) {
      break;
    }

    swift_release();
    swift_bridgeObjectRelease();
    v33 += 96;
    if (!--v32)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_23();
      a5 = v62;
      id v26 = v64;
      uint64_t v27 = v61;
      uint64_t v28 = v60;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_23();
  uint64_t v53 = swift_allocObject();
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = v36;
  *(void *)(v54 + 24) = v37;
  *(void *)(v54 + 32) = v38;
  *(void *)(v54 + 40) = v39;
  *(void *)(v54 + 48) = v36;
  *(void *)(v54 + 56) = v37;
  *(void *)(v54 + 64) = v38;
  *(void *)(v54 + 72) = v39;
  *(void *)(v54 + 80) = v44;
  *(void *)(v54 + 88) = v41;
  *(void *)(v54 + 96) = v42;
  *(void *)(v53 + 16) = v54 | 0x1000000000000000;
  sub_1BF8A2ACC();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BF8CD2F0;
  *(void *)(inited + 56) = sub_1BF8A2B84();
  *(void *)(inited + 32) = v45;
  sub_1BF8A2BC4();
  id v56 = v44;
  id v57 = v45;
  uint64_t v58 = sub_1BF8CB9F8();

  swift_release();
  swift_bridgeObjectRelease();

  *(void *)(v53 + 24) = v58;
  *uint64_t v62 = v53 | 0x9000000000000000;
}

void sub_1BF8AAFB4(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  Cursor.remainingBounds.getter();
  objc_msgSend(a1, sel_boundingRectWithSize_options_context_, 1, 0, v6, v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_beginAccess();
  uint64_t v12 = *(void *)(a2 + 488);
  uint64_t v13 = *(void *)(a2 + 496);
  id v14 = a1;
  Cursor.remainingBounds.getter();
  *a3 = v12;
  a3[1] = v13;
  a3[2] = v9;
  a3[3] = v11;
  a3[4] = v14;
  a3[5] = v15;
  a3[6] = v16;
}

id sub_1BF8AB05C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  double v6 = (void *)a1[2];
  uint64_t v7 = a1[3];
  uint64_t v8 = (void *)a1[4];
  sub_1BF8AAFB4(v8, a2, v15);
  uint64_t v9 = v16;
  long long v10 = v15[0];
  long long v11 = v15[1];
  long long v12 = v17;
  *(void *)a3 = v5;
  *(void *)(a3 + 8) = v4;
  *(void *)(a3 + 16) = v6;
  *(void *)(a3 + 24) = v7;
  *(void *)(a3 + 32) = v8;
  *(_OWORD *)(a3 + 40) = v10;
  *(_OWORD *)(a3 + 56) = v11;
  *(void *)(a3 + 72) = v9;
  *(_OWORD *)(a3 + 80) = v12;
  swift_retain();
  id v13 = v8;
  swift_bridgeObjectRetain();
  return v6;
}

void sub_1BF8AB10C(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  sub_1BF8AAA5C(a1, a2, *(void **)v3, *(void *)(v3 + 8), a3);
}

uint64_t sub_1BF8AB128()
{
  return 0x74786554746C61;
}

ValueMetadata *type metadata accessor for AltTextSizer()
{
  return &type metadata for AltTextSizer;
}

id sub_1BF8AB150@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF8AB05C(a1, *(void *)(v2 + 32), a2);
}

uint64_t sub_1BF8AB174()
{
  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1BF8AB1AC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t destroy for GeometrySizer(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for GeometrySizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for GeometrySizer(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GeometrySizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for GeometrySizer()
{
  return &type metadata for GeometrySizer;
}

void *sub_1BF8AB330@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  double v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = v6[3];
  uint64_t v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  uint64_t result = (*(void *(**)(_OWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(v19, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = *(void *)&v19[0];
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    sub_1BF8AB5BC((uint64_t)v6, (uint64_t)v19);
    uint64_t v17 = swift_allocObject();
    long long v18 = v19[1];
    *(_OWORD *)(v17 + 16) = v19[0];
    *(_OWORD *)(v17 + 32) = v18;
    *(_OWORD *)(v17 + 48) = v19[2];
    *(void *)(v17 + 64) = v20;
    *(void *)(v17 + 72) = a1;
    *(void *)(v16 + 24) = sub_1BF8AB63C;
    *(void *)(v16 + 32) = v17;
    *a4 = v16 | 0x8000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

uint64_t sub_1BF8AB48C(uint64_t a1, double *a2, double a3, double a4, double a5, double a6)
{
  return (*(uint64_t (**)(double, double, double, double, double, double, double, double))(a1 + 40))(a2[12], a2[13], a2[14], a2[15], a3, a4, a5, a6);
}

void *sub_1BF8AB4E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_1BF8AB330(a1, a2, a3, a4);
}

uint64_t sub_1BF8AB4F8()
{
  return 0;
}

uint64_t sub_1BF8AB578()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8AB5BC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF8AB5F4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1BF8AB63C(double a1, double a2, double a3, double a4)
{
  return sub_1BF8AB48C(v4 + 16, *(double **)(v4 + 72), a1, a2, a3, a4);
}

BOOL CursorResizing.isResizing.getter()
{
  return *v0 >> 62 == 0;
}

uint64_t CursorResizing.isNestedResizing.getter()
{
  uint64_t v1 = *v0 >> 62;
  if (v1)
  {
    if (v1 == 1)
    {
      OUTLINED_FUNCTION_0_24();
      char v2 = CursorResizing.isNestedResizing.getter();
    }
    else
    {
      char v2 = 0;
    }
  }
  else
  {
    char v2 = 1;
  }
  return v2 & 1;
}

uint64_t CursorResizing.identifier.getter()
{
  uint64_t v1 = *(void *)v0 >> 62;
  if (v1)
  {
    if (v1 == 1)
    {
      OUTLINED_FUNCTION_0_24();
      return CursorResizing.identifier.getter();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v2 = *(void *)(*(void *)v0 + 16);
    swift_bridgeObjectRetain();
  }
  return v2;
}

uint64_t CursorResizing.description.getter()
{
  uint64_t v1 = *v0 >> 62;
  if (!v1)
  {
    uint64_t v4 = 539782767;
    sub_1BF8CBAC8();
    return v4;
  }
  if (v1 == 1)
  {
    uint64_t v4 = 0x202C6465626D65;
    uint64_t v2 = swift_retain();
    CursorResizing.description.getter(v2);
    sub_1BF8CBAC8();
    swift_release();
    swift_bridgeObjectRelease();
    return v4;
  }
  return 6710895;
}

void *initializeBufferWithCopyOfBuffer for AltTextLogic(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for AltTextLogic()
{
  return swift_release();
}

void *assignWithCopy for AltTextLogic(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for AltTextLogic(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CursorResizing(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7E && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7D) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for CursorResizing(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BF8AB95C(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_1BF8AB978(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_1BF8AB988(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *uint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for CursorResizing()
{
  return &type metadata for CursorResizing;
}

uint64_t sub_1BF8AB9C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  swift_beginAccess();
  if (*(void *)(a1 + 64))
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 80);
    if (*(unsigned char *)(a1 + 48))
    {
      swift_beginAccess();
      uint64_t v9 = *(void *)(a1 + 488);
      uint64_t v10 = *(void *)(a1 + 496);
      uint64_t v11 = swift_allocObject();
      uint64_t v12 = (void *)swift_allocObject();
      v12[2] = v9;
      void v12[3] = v10;
      v12[4] = v8;
      void v12[5] = v7;
      uint64_t v13 = qword_1EBA90300;
      swift_bridgeObjectRetain();
      if (v13 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_0_25((char *)&word_1EBA8F7C8);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1BF8CD2F0;
      *(void *)(v14 + 32) = v7;
      *(unsigned char *)(v14 + 40) = 1;
      *(void *)(v11 + 24) = MEMORY[0x1E4FBC860];
    }
    else
    {
      swift_beginAccess();
      uint64_t v18 = *(void *)(a1 + 488);
      uint64_t v19 = *(void *)(a1 + 496);
      uint64_t v11 = swift_allocObject();
      uint64_t v20 = (void *)swift_allocObject();
      _OWORD v20[2] = v18;
      v20[3] = v19;
      v20[4] = v8;
      v20[5] = v7;
      uint64_t v21 = qword_1EBA90300;
      swift_bridgeObjectRetain();
      if (v21 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_0_25((char *)&word_1EBA8F7C8);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1BF8CD2F0;
      *(void *)(v22 + 32) = v8;
      *(unsigned char *)(v22 + 40) = 1;
      *(void *)(v11 + 24) = v22;
      uint64_t v14 = MEMORY[0x1E4FBC860];
    }
    *(void *)(v11 + 32) = v14;
    swift_bridgeObjectRelease();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v11 | 0x4000000000000000;
    *(void *)(v15 + 24) = v6;
    uint64_t v16 = (void *)(v15 + 32);
    uint64_t v17 = 0x4000000000000000;
  }
  else
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 40) = &type metadata for FlexibleMaxSizer;
    *(void *)(v15 + 48) = &off_1F1B084B8;
    *(void *)(v15 + 16) = v6;
    uint64_t v16 = (void *)(v15 + 24);
    uint64_t v17 = 0x2000000000000000;
  }
  void *v16 = v5;
  *a2 = v17 | v15;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BF8ABC5C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8AB9C8(a1, a2);
}

uint64_t sub_1BF8ABC74()
{
  return 0;
}

ValueMetadata *type metadata accessor for FlexibleMaxSizer()
{
  return &type metadata for FlexibleMaxSizer;
}

uint64_t sub_1BF8ABD34()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8ABD80()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8ABD90()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t Inspect.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  return Inspect.init(_:)(a1, a2);
}

uint64_t Inspect.init(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  char v4 = 11;
  return Node.init(kind:identifier:)(&v4, 0, 0);
}

uint64_t sub_1BF8ABE4C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v18 = a4;
  uint64_t v7 = *(void *)(*v4 + 136);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = type metadata accessor for Inspect.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  sub_1BF8AC024(a1, (uint64_t)v10, *v18, v14);
  uint64_t v15 = (void (*)(char *))v4[5];
  swift_retain();
  swift_retain();
  v15(v14);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return 0;
}

uint64_t sub_1BF8AC024@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v7 = *a1;
  *(void *)a4 = a1;
  uint64_t v8 = *(void *)(v7 + 80);
  uint64_t v9 = type metadata accessor for Inspect.State();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(&a4[*(int *)(v9 + 36)], a2, v8);
  *(void *)&a4[*(int *)(v9 + 40)] = a3;
  return result;
}

uint64_t Inspect.State.cursor.getter()
{
  return swift_retain();
}

uint64_t Inspect.State.template.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t Inspect.State.context.getter()
{
  return swift_retain();
}

void Inspect.__allocating_init(kind:identifier:)()
{
}

void Inspect.init(kind:identifier:)()
{
}

uint64_t Inspect.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_release();
  return v0;
}

uint64_t Inspect.__deallocating_deinit()
{
  uint64_t v0 = Inspect.deinit();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t Inspect.description.getter()
{
  return 0x74636570736E49;
}

uint64_t sub_1BF8AC1F0()
{
  return 0x74636570736E49;
}

uint64_t type metadata accessor for Inspect()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Inspect(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Inspect);
}

uint64_t dispatch thunk of Inspect.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_1BF8AC24C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v9 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 8) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v8;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BF8AC394);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v8 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if ((v6 & 0x80000000) != 0) {
    return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 8) & ~v7, v6, v4);
  }
  uint64_t v18 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v18) = -1;
  }
  return (v18 + 1);
}

void sub_1BF8AC3A8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((*(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    unsigned int v12 = a3 - v9;
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v9;
    }
    else {
      int v16 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v17 = ~v9 + a2;
      bzero(a1, v11);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1BF8AC584);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v10 + 8] & ~v10;
          __swift_storeEnumTagSinglePayload(v19, a2, v8, v6);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Inspect.State()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1BF8AC5C4(uint64_t a1@<X0>, void *a2@<X3>, double a3@<X4>, char a4@<W5>, uint64_t *a5@<X8>)
{
  switch(a4)
  {
    case 1:
      OUTLINED_FUNCTION_0_21();
      uint64_t v12 = *(void *)(a1 + 488);
      uint64_t v13 = *(void *)(a1 + 496);
      Cursor.remainingBounds.getter();
      uint64_t v15 = v14;
      uint64_t v16 = OUTLINED_FUNCTION_10();
      uint64_t v11 = v16;
      *(void *)(v16 + 16) = v12;
      *(void *)(v16 + 24) = v13;
      *(double *)(v16 + 32) = *(double *)&a2;
      goto LABEL_6;
    case 2:
      OUTLINED_FUNCTION_0_21();
      uint64_t v17 = *(void *)(a1 + 488);
      uint64_t v18 = *(void *)(a1 + 496);
      Cursor.remainingBounds.getter();
      uint64_t v20 = v19;
      uint64_t v11 = OUTLINED_FUNCTION_10();
      *(void *)(v11 + 16) = v17;
      *(void *)(v11 + 24) = v18;
      *(void *)(v11 + 32) = v20;
      *(double *)(v11 + 40) = *(double *)&a2;
      goto LABEL_8;
    case 3:
      OUTLINED_FUNCTION_0_21();
      uint64_t v21 = *(void *)(a1 + 488);
      uint64_t v22 = *(void *)(a1 + 496);
      Cursor.remainingBounds.getter();
      uint64_t v15 = v23;
      double v24 = Cursor.scaleFactor.getter() * *(double *)&a2;
      uint64_t v16 = OUTLINED_FUNCTION_10();
      uint64_t v11 = v16;
      *(void *)(v16 + 16) = v21;
      *(void *)(v16 + 24) = v22;
      *(double *)(v16 + 32) = v24;
LABEL_6:
      *(void *)(v16 + 40) = v15;
      goto LABEL_8;
    case 4:
      OUTLINED_FUNCTION_0_21();
      uint64_t v25 = *(void *)(a1 + 488);
      uint64_t v26 = *(void *)(a1 + 496);
      Cursor.remainingBounds.getter();
      uint64_t v28 = v27;
      double v29 = Cursor.scaleFactor.getter() * *(double *)&a2;
      uint64_t v11 = OUTLINED_FUNCTION_10();
      *(void *)(v11 + 16) = v25;
      *(void *)(v11 + 24) = v26;
      *(void *)(v11 + 32) = v28;
      *(double *)(v11 + 40) = v29;
      goto LABEL_8;
    case 5:
      OUTLINED_FUNCTION_0_21();
      uint64_t v31 = *(void *)(a1 + 488);
      uint64_t v32 = *(void *)(a1 + 496);
      id v33 = a2;
      Cursor.remainingBounds.getter();
      uint64_t v35 = v34;
      objc_msgSend(v33, sel_scaledValueForValue_, a3);
      uint64_t v37 = v36;
      uint64_t v11 = OUTLINED_FUNCTION_10();
      *(void *)(v11 + 16) = v31;
      *(void *)(v11 + 24) = v32;
      *(void *)(v11 + 32) = v37;
      *(void *)(v11 + 40) = v35;
      if (qword_1EBA90300 != -1) {
        swift_once();
      }
      uint64_t v38 = (void *)OUTLINED_FUNCTION_3_12((char *)&word_1EBA8F7C8);
      unsigned __int8 v40 = 5;
      goto LABEL_17;
    case 6:
      OUTLINED_FUNCTION_0_21();
      uint64_t v41 = *(void *)(a1 + 488);
      uint64_t v42 = *(void *)(a1 + 496);
      id v43 = a2;
      Cursor.remainingBounds.getter();
      uint64_t v45 = v44;
      objc_msgSend(v43, sel_scaledValueForValue_, a3);
      uint64_t v47 = v46;
      uint64_t v11 = OUTLINED_FUNCTION_10();
      *(void *)(v11 + 16) = v41;
      *(void *)(v11 + 24) = v42;
      *(void *)(v11 + 32) = v45;
      *(void *)(v11 + 40) = v47;
      if (qword_1EBA90300 != -1) {
        swift_once();
      }
      uint64_t v38 = (void *)OUTLINED_FUNCTION_3_12((char *)&word_1EBA8F7C8);
      unsigned __int8 v40 = 6;
LABEL_17:
      sub_1BF8AC9B0(v38, v39, v40);
      break;
    default:
      OUTLINED_FUNCTION_0_21();
      uint64_t v9 = *(void *)(a1 + 488);
      uint64_t v10 = *(void *)(a1 + 496);
      uint64_t v11 = OUTLINED_FUNCTION_10();
      *(void *)(v11 + 16) = v9;
      *(void *)(v11 + 24) = v10;
      *(double *)(v11 + 32) = *(double *)&a2;
      *(double *)(v11 + 40) = a3;
LABEL_8:
      if (qword_1EBA90300 != -1) {
        swift_once();
      }
      char v30 = HIBYTE(word_1EBA8F7C8);
      *(unsigned char *)(v11 + 48) = word_1EBA8F7C8;
      *(unsigned char *)(v11 + 49) = v30;
      break;
  }
  *a5 = v11;
}

void sub_1BF8AC8C0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BF8AC5C4(a1, *(void **)v2, *(double *)(v2 + 8), *(unsigned char *)(v2 + 16), a2);
}

uint64_t sub_1BF8AC8E0()
{
  return 0;
}

uint64_t sub_1BF8AC978()
{
  return sub_1BF8AC8E0();
}

id sub_1BF8AC988(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 - 5 <= 1) {
    return result;
  }
  return result;
}

void destroy for FixedSizer.Fixed(uint64_t a1)
{
}

void sub_1BF8AC9B0(id a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 - 5 <= 1) {
}
  }

uint64_t sub_1BF8AC9D8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1BF8AC9E0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FixedSizer.Fixed()
{
  return &type metadata for FixedSizer.Fixed;
}

uint64_t _s11TeaTemplate10FixedSizerVwCP_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_16(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(unsigned char *)(v2 + 16) = v5;
  return v2;
}

uint64_t _s11TeaTemplate10FixedSizerVwca_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_16(a1, a2);
  uint64_t v6 = *(void **)v2;
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(v2 + 16);
  *(unsigned char *)(v2 + 16) = v5;
  sub_1BF8AC9B0(v6, v7, v8);
  return v2;
}

uint64_t _s11TeaTemplate10FixedSizerVwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1BF8AC9B0(v4, v5, v6);
  return a1;
}

uint64_t _s11TeaTemplate10FixedSizerVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFA && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 6) {
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

uint64_t _s11TeaTemplate10FixedSizerVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FixedSizer()
{
  return &type metadata for FixedSizer;
}

uint64_t sub_1BF8ACB48()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8ACB5C()
{
  return swift_bridgeObjectRetain();
}

uint64_t Stack.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  return Stack.init(name:)(a1, a2);
}

uint64_t Stack.init(name:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for StackLayer();
  swift_retain();
  uint64_t v5 = sub_1BF8CB9B8();
  v2[6] = a2;
  v2[7] = v5;
  v2[5] = a1;
  swift_bridgeObjectRetain();
  swift_release();
  char v7 = 7;
  return Node.init(kind:identifier:)(&v7, a1, a2);
}

uint64_t type metadata accessor for StackLayer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8ACCA4()
{
  return swift_endAccess();
}

uint64_t sub_1BF8ACD54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF8ACB5C();
  uint64_t v5 = type metadata accessor for StackLayer();
  uint64_t v6 = sub_1BF8CBB88();
  uint64_t v17 = v6;
  if (v6 != MEMORY[0x1C18B43C0](v4, v5))
  {
    uint64_t v8 = v4 + 32;
    do
    {
      char v9 = sub_1BF8CBBE8();
      sub_1BF8CBBA8();
      if (v9)
      {
        uint64_t v10 = *(void *)(v8 + 8 * v6);
        swift_retain();
      }
      else
      {
        uint64_t v10 = sub_1BF8CBE88();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1C18B43D0](&v17, v4, v5);
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void *)(v10 + 16);
      uint64_t v12 = type metadata accessor for Node();
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_1BF8CBB88();
      uint64_t v16 = v13;
      if (v13 == MEMORY[0x1C18B43C0](v11, v12))
      {
        swift_release();
      }
      else
      {
        do
        {
          char v14 = sub_1BF8CBBE8();
          sub_1BF8CBBA8();
          if (v14)
          {
            uint64_t v15 = *(void *)(v11 + 32 + 8 * v13);
            swift_retain();
          }
          else
          {
            uint64_t v15 = sub_1BF8CBE88();
          }
          swift_bridgeObjectRetain();
          MEMORY[0x1C18B43D0](&v16, v11, v12);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(*(void *)v15 + 120))(a1, a2);
          swift_release();
          uint64_t v13 = v16;
        }
        while (v13 != MEMORY[0x1C18B43C0](v11, v12));
        swift_release();
        uint64_t v8 = v4 + 32;
      }
      swift_bridgeObjectRelease();
      uint64_t v6 = v17;
    }
    while (v6 != MEMORY[0x1C18B43C0](v4, v5));
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8ACFD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Cursor.remainingBounds.getter();
  uint64_t v38 = *(void *)(v4 + 48);
  uint64_t v39 = *(void *)(v4 + 40);
  sub_1BF89D858(v4, a3, v39, v38);
  uint64_t v8 = sub_1BF8ACB5C();
  uint64_t v78 = v4;
  uint64_t v9 = type metadata accessor for StackLayer();
  uint64_t v10 = sub_1BF8CBB88();
  uint64_t v103 = v10;
  if (v10 == MEMORY[0x1C18B43C0](v8, v9))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = type metadata accessor for Cursor();
    if (__OFADD__(a3, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v74 = *(void *)(a1 + 152);
    uint64_t v75 = *(void *)(a1 + 144);
    uint64_t v72 = *(void *)(a1 + 168);
    uint64_t v73 = *(void *)(a1 + 160);
    uint64_t v70 = *(void *)(a1 + 184);
    uint64_t v71 = *(void *)(a1 + 176);
    uint64_t v68 = *(void *)(a1 + 200);
    uint64_t v69 = *(void *)(a1 + 192);
    uint64_t v67 = *(void **)(a1 + 208);
    uint64_t v65 = *(void *)(a1 + 224);
    uint64_t v66 = *(void *)(a1 + 216);
    uint64_t v63 = *(void *)(a1 + 240);
    uint64_t v64 = *(void *)(a1 + 232);
    uint64_t v61 = *(void **)(a1 + 272);
    uint64_t v62 = *(void *)(a1 + 264);
    uint64_t v59 = *(void *)(a1 + 288);
    uint64_t v60 = *(void *)(a1 + 280);
    uint64_t v57 = *(void *)(a1 + 304);
    uint64_t v58 = *(void *)(a1 + 296);
    int v104 = *(unsigned __int8 *)(a1 + 312);
    uint64_t v55 = *(void *)(a1 + 336);
    uint64_t v56 = *(void *)(a1 + 328);
    uint64_t v53 = *(void *)(a1 + 352);
    uint64_t v54 = *(void *)(a1 + 344);
    uint64_t v51 = *(void *)(a1 + 368);
    uint64_t v52 = *(void *)(a1 + 360);
    uint64_t v49 = *(void *)(a1 + 384);
    uint64_t v50 = *(void *)(a1 + 376);
    uint64_t v47 = *(void *)(a1 + 400);
    uint64_t v48 = *(void *)(a1 + 392);
    uint64_t v45 = *(void *)(a1 + 416);
    uint64_t v46 = *(void *)(a1 + 408);
    uint64_t v44 = *(void *)(a1 + 88);
    int v105 = 1;
    CGFloat x = 0.0;
    uint64_t v42 = *(void *)(a1 + 432);
    uint64_t v43 = *(void *)(a1 + 424);
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    char v40 = *(unsigned char *)(a1 + 440);
    char v41 = *(unsigned char *)(a1 + 48);
    while (1)
    {
      char v16 = sub_1BF8CBBE8();
      sub_1BF8CBBA8();
      CGFloat v79 = height;
      CGFloat v80 = y;
      if (v16)
      {
        uint64_t v17 = *(void *)(v8 + 32 + 8 * v10);
        swift_retain();
      }
      else
      {
        uint64_t v17 = sub_1BF8CBE88();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1C18B43D0](&v103, v8, v9);
      swift_bridgeObjectRelease();
      Cursor.remainingBounds.getter();
      Cursor.remainingBounds.getter();
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      v97[0] = 0xF000000000000007;
      *(void *)&long long v84 = 0xF000000000000007;
      v82[0] = 0xF000000000000007;
      uint64_t v101 = 0xF000000000000007;
      type metadata accessor for LayoutMarginAdjuster();
      swift_allocObject();
      uint64_t v22 = LayoutMarginAdjuster.init(top:left:bottom:right:)(v97, (uint64_t *)&v84, v82, &v101);
      v97[0] = v19;
      v97[1] = v21;
      v97[2] = v75;
      v97[3] = v74;
      v97[4] = v73;
      v97[5] = v72;
      v97[6] = v71;
      v97[7] = v70;
      v97[8] = v69;
      v97[9] = v68;
      v97[10] = v67;
      v97[11] = v66;
      v97[12] = v65;
      v97[13] = v64;
      v97[14] = v63;
      v97[15] = 0;
      v97[16] = 0;
      v97[17] = v62;
      v97[18] = v61;
      v97[19] = v60;
      v97[20] = v59;
      v97[21] = v58;
      v97[22] = v57;
      char v98 = v104;
      *(_DWORD *)&v99[3] = *(_DWORD *)&v102[3];
      *(_DWORD *)uint64_t v99 = *(_DWORD *)v102;
      uint64_t v100 = v22;
      *(void *)&long long v84 = v56;
      *((void *)&v84 + 1) = v55;
      uint64_t v85 = v54;
      uint64_t v86 = v53;
      uint64_t v87 = v52;
      uint64_t v88 = v51;
      uint64_t v89 = v50;
      uint64_t v90 = v49;
      uint64_t v91 = v48;
      uint64_t v92 = v47;
      uint64_t v93 = v46;
      uint64_t v94 = v45;
      uint64_t v95 = v43;
      uint64_t v96 = v42;
      char v83 = v41;
      sub_1BF8A0970(a1 + 544, (uint64_t)v82);
      id v23 = v67;
      id v24 = v61;
      uint64_t v25 = Cursor.remainingBounds.getter();
      uint64_t v27 = v26;
      if (qword_1EBA902F8 != -1) {
        swift_once();
      }
      __int16 v81 = word_1EBA902EA;
      uint64_t v101 = v44;
      uint64_t v28 = sub_1BF89FC40((uint64_t)v97, &v84, &v83, (uint64_t)v82, v25, v27, 0, (char *)&v81, &v101, v40);
      uint64_t v29 = *(void *)(v17 + 16);
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1BF8B87F0(v78, v29, v28, a2, a3 + 1, a4);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRelease();
      double v30 = Cursor.absoluteFrame.getter();
      CGFloat y = v31;
      CGFloat v33 = v32;
      CGFloat height = v34;
      if (v105)
      {
        swift_release();
        swift_release();
        CGFloat x = v30;
        CGFloat width = v33;
      }
      else
      {
        v106.origin.CGFloat x = x;
        v106.size.CGFloat height = v79;
        v106.origin.CGFloat y = v80;
        v106.size.CGFloat width = width;
        v108.origin.CGFloat x = v30;
        v108.origin.CGFloat y = y;
        v108.size.CGFloat width = v33;
        v108.size.CGFloat height = height;
        CGRect v107 = CGRectUnion(v106, v108);
        CGFloat x = v107.origin.x;
        CGFloat y = v107.origin.y;
        CGFloat width = v107.size.width;
        CGFloat height = v107.size.height;
        swift_release();
        swift_release();
      }
      swift_release();
      uint64_t v10 = v103;
      if (v10 == MEMORY[0x1C18B43C0](v8, v9)) {
        break;
      }
      int v105 = 0;
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_26();
    sub_1BF89F278(v35);
  }
  OUTLINED_FUNCTION_0_26();
  sub_1BF89D868(v36, v37, v39, v38);
  return 0;
}

void Stack.__allocating_init(kind:identifier:)()
{
}

void Stack.init(kind:identifier:)()
{
}

uint64_t sub_1BF8AD67C()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Stack.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Stack.__deallocating_deinit()
{
  uint64_t v0 = Stack.deinit();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t Stack.description.getter()
{
  return 0x6B63617453;
}

uint64_t sub_1BF8AD728()
{
  return 0x6B63617453;
}

uint64_t sub_1BF8AD73C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Stack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Stack(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Stack);
}

uint64_t dispatch thunk of Stack.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t sub_1BF8AD7D0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF8AD818()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8AD838()
{
  sub_1BF8AD818();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

void sub_1BF8AD86C(void *a1@<X3>, double a2@<X4>, char a3@<W5>, void *a4@<X8>)
{
  if (a3)
  {
    if (a3 == 1)
    {
      swift_allocObject();
      OUTLINED_FUNCTION_0_27();
      double v8 = DimensionCursor.position.getter();
      double v9 = sub_1BF8A5AB0() * *(double *)&a1;
      *(double *)(v4 + 16) = v8;
    }
    else
    {
      swift_allocObject();
      OUTLINED_FUNCTION_0_27();
      double v11 = DimensionCursor.position.getter();
      objc_msgSend(a1, sel_scaledValueForValue_, a2);
      *(double *)(v4 + 16) = v11;
    }
    *(double *)(v4 + 24) = v9;
  }
  else
  {
    swift_allocObject();
    OUTLINED_FUNCTION_0_27();
    *(double *)(v4 + 16) = DimensionCursor.position.getter();
    *(double *)(v4 + 24) = *(double *)&a1;
  }
  *(unsigned char *)(v4 + 32) = 1;
  *a4 = v4;
}

void sub_1BF8AD9A8(void *a1@<X8>)
{
  sub_1BF8AD86C(*(void **)v1, *(double *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_1BF8AD9D0()
{
  return 0;
}

uint64_t sub_1BF8ADA68()
{
  return sub_1BF8AD9D0();
}

id sub_1BF8ADA78(id result, uint64_t a2, char a3)
{
  if (a3 == 2) {
    return result;
  }
  return result;
}

void destroy for FixedDimensionSizer.Fixed(uint64_t a1)
{
}

void sub_1BF8ADA9C(id a1, uint64_t a2, char a3)
{
  if (a3 == 2) {
}
  }

ValueMetadata *type metadata accessor for FixedDimensionSizer.Fixed()
{
  return &type metadata for FixedDimensionSizer.Fixed;
}

uint64_t _s11TeaTemplate19FixedDimensionSizerVwCP_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_16(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(unsigned char *)(v2 + 16) = v5;
  return v2;
}

uint64_t _s11TeaTemplate19FixedDimensionSizerVwca_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_16(a1, a2);
  uint64_t v6 = *(void **)v2;
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  char v8 = *(unsigned char *)(v2 + 16);
  *(unsigned char *)(v2 + 16) = v5;
  sub_1BF8ADA9C(v6, v7, v8);
  return v2;
}

uint64_t _s11TeaTemplate19FixedDimensionSizerVwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1BF8ADA9C(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for FixedDimensionSizer()
{
  return &type metadata for FixedDimensionSizer;
}

uint64_t sub_1BF8ADB9C()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8ADBB0()
{
  uint64_t result = type metadata accessor for LayoutDecoder.ObjectPath();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1BF8ADC44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1BF8AA094((_OWORD *)a1, v6);
    sub_1BF899BD0((uint64_t)v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BF8A2C10(a1);
    sub_1BF8B004C(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1BF8A2C10((uint64_t)v6);
  }
}

uint64_t sub_1BF8ADCC8()
{
  OUTLINED_FUNCTION_1();
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_2_10();
  sub_1BF8AE9E4();
  return v0;
}

uint64_t sub_1BF8ADD20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = type metadata accessor for LayoutDecoder.ObjectPath();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  char v8 = (char *)v15 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v15 - v7, (uint64_t)v1 + *(void *)(v3 + 96), v5);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, v8, v4);
  }
  uint64_t v10 = *(void *)v8;
  char v11 = v8[8];
  uint64_t v12 = type metadata accessor for _LayoutDecoder();
  swift_allocObject();
  uint64_t v13 = sub_1BF8AEF18(v10, v11);
  v15[4] = v12;
  v15[5] = sub_1BF8B0804();
  v15[1] = v13;
  return sub_1BF8CBC58();
}

uint64_t sub_1BF8ADED0(uint64_t a1, uint64_t a2, char *a3)
{
  OUTLINED_FUNCTION_1();
  uint64_t v5 = swift_allocObject();
  OUTLINED_FUNCTION_2_10();
  sub_1BF8ADF50(v6, a2, a3);
  return v5;
}

uint64_t sub_1BF8ADF50(uint64_t a1, uint64_t a2, char *a3)
{
  char v8 = v3;
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  uint64_t v77 = *(void *)v3;
  uint64_t v13 = *(void *)(v77 + 80);
  uint64_t v80 = sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_4();
  uint64_t v72 = (char *)v14;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v68 - v17;
  uint64_t v75 = v13;
  uint64_t v79 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v71 = (char *)&v68 - v19;
  uint64_t v74 = sub_1BF8CC208();
  OUTLINED_FUNCTION_0_4();
  uint64_t v73 = v20;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_20_0();
  uint64_t v24 = v23 - v22;
  OUTLINED_FUNCTION_0_4();
  uint64_t v26 = v25;
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_20_0();
  uint64_t v76 = v26;
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, char *))(v26 + 16);
  v28(v30 - v29, v12, a3);
  sub_1BF8A4100(0, &qword_1EBA90638);
  char v31 = swift_dynamicCast();
  uint64_t v96 = v12;
  if (v31)
  {
    sub_1BF8985E0(&v89, (uint64_t)v92);
    uint64_t v32 = *((void *)&v93 + 1);
    uint64_t v33 = v94;
    __swift_project_boxed_opaque_existential_1(v92, *((uint64_t *)&v93 + 1));
    *(void *)&long long v89 = v7;
    *((void *)&v89 + 1) = v6;
    *(void *)&long long v90 = v5;
    *((void *)&v90 + 1) = v4;
    uint64_t v91 = a2;
    uint64_t v34 = v78;
    (*(void (**)(long long *__return_ptr, long long *, uint64_t, uint64_t))(v33 + 8))(&v83, &v89, v32, v33);
    if (v34)
    {
      OUTLINED_FUNCTION_15_0();
    }
    else
    {
      uint64_t v57 = v75;
      if (swift_dynamicCast())
      {
        __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v57);
        OUTLINED_FUNCTION_22_0();
        OUTLINED_FUNCTION_6_9();
        v58();
        uint64_t v59 = *(void (**)(char *, char *, uint64_t))(v79 + 32);
        uint64_t v60 = v71;
        v59(v71, v18, v57);
        v59(&v8[*(void *)(*(void *)v8 + 96)], v60, v57);
        OUTLINED_FUNCTION_17_0();
        type metadata accessor for LayoutDecoder.ObjectPath();
        swift_storeEnumTagMultiPayload();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
        return (uint64_t)v8;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v57);
      OUTLINED_FUNCTION_15_0();
      OUTLINED_FUNCTION_6_9();
      v64();
      sub_1BF8B0770();
      swift_allocError();
      *uint64_t v65 = 2;
      swift_willThrow();
      OUTLINED_FUNCTION_22_0();
    }
    OUTLINED_FUNCTION_6_9();
    v66();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
    swift_deallocPartialClassInstance();
    return (uint64_t)v8;
  }
  uint64_t v80 = a2;
  uint64_t v72 = v8;
  uint64_t v91 = 0;
  long long v89 = 0u;
  long long v90 = 0u;
  sub_1BF8B06CC((uint64_t)&v89, &qword_1EBA90640, &qword_1EBA90638);
  *((void *)&v93 + 1) = a3;
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v92);
  uint64_t v71 = a3;
  v28((uint64_t)boxed_opaque_existential_0Tm, v12, a3);
  sub_1BF8CC1E8();
  sub_1BF8CC1F8();
  sub_1BF8CBF38();
  swift_release();
  swift_retain();
  sub_1BF8CBFD8();
  uint64_t v36 = (uint64_t)v92;
  sub_1BF8B0374((uint64_t)&v89, (uint64_t)v92);
  uint64_t v37 = v24;
  if (!v95)
  {
    uint64_t v38 = (void *)MEMORY[0x1E4FBC868];
LABEL_61:
    swift_release_n();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_6_9();
    v61();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_6_9();
    v62();
    char v8 = v72;
    uint64_t v63 = &v8[*(void *)(*(void *)v8 + 96)];
    *(void *)uint64_t v63 = v38;
    v63[8] = 0;
    OUTLINED_FUNCTION_17_0();
    type metadata accessor for LayoutDecoder.ObjectPath();
    swift_storeEnumTagMultiPayload();
    return (uint64_t)v8;
  }
  uint64_t v38 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v70 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v79 = v24;
  while (1)
  {
    uint64_t v39 = v92[0];
    uint64_t v40 = v92[1];
    sub_1BF8AA094(&v93, v88);
    if (!v40)
    {
      uint64_t v49 = v88;
      goto LABEL_23;
    }
    if (!v80) {
      break;
    }
    if (v80 != 1)
    {
      sub_1BF8A9B48((uint64_t)v88, (uint64_t)&v89);
      swift_isUniquelyReferenced_nonNull_native();
      OUTLINED_FUNCTION_3_13();
      OUTLINED_FUNCTION_4_13();
      if (v47) {
        goto LABEL_66;
      }
      OUTLINED_FUNCTION_8_1();
      if (OUTLINED_FUNCTION_14_0())
      {
        OUTLINED_FUNCTION_10_1();
        OUTLINED_FUNCTION_9_3();
        if (!v41) {
          goto LABEL_73;
        }
        uint64_t v37 = v52;
      }
      uint64_t v38 = (void *)v83;
      if (v36) {
        goto LABEL_49;
      }
      OUTLINED_FUNCTION_1_17();
      if (v47) {
        goto LABEL_69;
      }
      goto LABEL_51;
    }
    BOOL v41 = v39 == 0x656D617266 && v40 == 0xE500000000000000;
    if (v41 || (sub_1BF8CC078() & 1) != 0) {
      goto LABEL_43;
    }
    sub_1BF8A9B48((uint64_t)v88, (uint64_t)&v86);
    uint64_t v36 = (uint64_t)&qword_1EA170448;
    sub_1BF8A4100(0, &qword_1EA170448);
    if ((swift_dynamicCast() & 1) == 0)
    {
      unint64_t v85 = 0;
      long long v84 = 0u;
      long long v83 = 0u;
      sub_1BF8B06CC((uint64_t)&v83, &qword_1EA170450, &qword_1EA170448);
LABEL_43:
      sub_1BF8A9B48((uint64_t)v88, (uint64_t)&v89);
      swift_isUniquelyReferenced_nonNull_native();
      OUTLINED_FUNCTION_3_13();
      OUTLINED_FUNCTION_4_13();
      if (v47) {
        goto LABEL_67;
      }
      OUTLINED_FUNCTION_8_1();
      if (OUTLINED_FUNCTION_14_0())
      {
        OUTLINED_FUNCTION_10_1();
        OUTLINED_FUNCTION_9_3();
        if (!v41) {
          goto LABEL_73;
        }
        uint64_t v37 = v53;
      }
      uint64_t v38 = (void *)v83;
      if (v36)
      {
LABEL_49:
        uint64_t v36 = v38[7] + 32 * v37;
        __swift_destroy_boxed_opaque_existential_1(v36);
        sub_1BF8AA094(&v89, (_OWORD *)v36);
LABEL_52:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
        uint64_t v37 = v79;
        goto LABEL_53;
      }
      OUTLINED_FUNCTION_1_17();
      if (v47) {
        goto LABEL_70;
      }
LABEL_51:
      v38[2] = v51;
      swift_bridgeObjectRetain();
      goto LABEL_52;
    }
    sub_1BF8985E0(&v83, (uint64_t)&v89);
    uint64_t v42 = *((void *)&v90 + 1);
    unint64_t v43 = v91;
    __swift_project_boxed_opaque_existential_1(&v89, *((uint64_t *)&v90 + 1));
    uint64_t v69 = *(void (**)(uint64_t, unint64_t, double))(v43 + 8);
    *((void *)&v84 + 1) = v42;
    unint64_t v85 = v43;
    __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)&v83);
    double v44 = OUTLINED_FUNCTION_2_10();
    v69(v42, v43, v44);
    uint64_t v36 = *((void *)&v84 + 1);
    uint64_t v45 = __swift_project_boxed_opaque_existential_1(&v83, *((uint64_t *)&v84 + 1));
    uint64_t v87 = v36;
    uint64_t v46 = __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)&v86);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v46, v45, v36);
    sub_1BF8AA094(&v86, v82);
    swift_isUniquelyReferenced_nonNull_native();
    __int16 v81 = v38;
    sub_1BF8999E0(v39, v40);
    OUTLINED_FUNCTION_4_13();
    if (v47) {
      goto LABEL_71;
    }
    OUTLINED_FUNCTION_8_1();
    if (sub_1BF8CBF68())
    {
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_9_3();
      if (!v41) {
        goto LABEL_73;
      }
      unint64_t v43 = v48;
    }
    uint64_t v38 = v81;
    if (v36)
    {
      uint64_t v36 = v81[7] + 32 * v43;
      __swift_destroy_boxed_opaque_existential_1(v36);
      sub_1BF8AA094(v82, (_OWORD *)v36);
    }
    else
    {
      v81[(v43 >> 6) + 8] |= 1 << v43;
      uint64_t v54 = (uint64_t *)(v38[6] + 16 * v43);
      *uint64_t v54 = v39;
      v54[1] = v40;
      sub_1BF8AA094(v82, (_OWORD *)(v38[7] + 32 * v43));
      uint64_t v55 = v38[2];
      BOOL v47 = __OFADD__(v55, 1);
      uint64_t v56 = v55 + 1;
      if (v47) {
        goto LABEL_72;
      }
      v38[2] = v56;
      swift_bridgeObjectRetain();
    }
    uint64_t v37 = v79;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v83);
    uint64_t v49 = &v89;
LABEL_23:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
LABEL_53:
    sub_1BF8CBFD8();
    sub_1BF8B0374((uint64_t)&v89, (uint64_t)v92);
    if (!v95) {
      goto LABEL_61;
    }
  }
  sub_1BF8A9B48((uint64_t)v88, (uint64_t)&v89);
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_4_13();
  if (!v47)
  {
    OUTLINED_FUNCTION_8_1();
    if (OUTLINED_FUNCTION_14_0())
    {
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_9_3();
      if (!v41) {
        goto LABEL_73;
      }
      uint64_t v37 = v50;
    }
    uint64_t v38 = (void *)v83;
    if (v36) {
      goto LABEL_49;
    }
    OUTLINED_FUNCTION_1_17();
    if (v47) {
      goto LABEL_68;
    }
    goto LABEL_51;
  }
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  uint64_t result = sub_1BF8CC158();
  __break(1u);
  return result;
}

uint64_t sub_1BF8AE9E4()
{
  OUTLINED_FUNCTION_1();
  uint64_t v5 = *v0;
  sub_1BF8CC208();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_20_0();
  uint64_t v28 = v0;
  *((void *)&v32 + 1) = *(void *)(v5 + 80);
  __swift_allocate_boxed_opaque_existential_0Tm(v31);
  OUTLINED_FUNCTION_7_6();
  (*(void (**)(void))(v7 + 16))();
  sub_1BF8CC1E8();
  unint64_t v34 = MEMORY[0x1E4FBC868];
  sub_1BF8CC1F8();
  sub_1BF8CBF38();
  swift_release();
  swift_retain();
  sub_1BF8CBFD8();
  sub_1BF8B0374((uint64_t)v30, (uint64_t)v31);
  if (!v33)
  {
LABEL_15:
    swift_release_n();
    type metadata accessor for CGRect(0);
    *((void *)&v32 + 1) = v22;
    uint64_t v23 = (void *)swift_allocObject();
    v31[0] = (uint64_t)v23;
    _OWORD v23[2] = v4;
    void v23[3] = v3;
    v23[4] = v2;
    v23[5] = v1;
    sub_1BF8ADC44((uint64_t)v31, 0x656D617266, 0xE500000000000000);
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_6_9();
    v24();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_6_9();
    v25();
    uint64_t v26 = (char *)v28 + *(void *)(*v28 + 96);
    *(void *)uint64_t v26 = v34;
    v26[8] = 1;
    OUTLINED_FUNCTION_17_0();
    type metadata accessor for LayoutDecoder.ObjectPath();
    swift_storeEnumTagMultiPayload();
    return (uint64_t)v28;
  }
  char v8 = (void *)MEMORY[0x1E4FBC868];
  while (1)
  {
    uint64_t v9 = v31[0];
    uint64_t v10 = v31[1];
    sub_1BF8AA094(&v32, v30);
    if (!v10) {
      goto LABEL_14;
    }
    sub_1BF8A9B48((uint64_t)v30, (uint64_t)v29);
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v34 = 0x8000000000000000;
    unint64_t v11 = sub_1BF8999E0(v9, v10);
    if (__OFADD__(v8[2], (v12 & 1) == 0)) {
      break;
    }
    unint64_t v13 = v11;
    char v14 = v12;
    sub_1BF8B04B0();
    if (sub_1BF8CBF68())
    {
      sub_1BF8999E0(v9, v10);
      OUTLINED_FUNCTION_16_0();
      if (!v16) {
        goto LABEL_18;
      }
      unint64_t v13 = v15;
    }
    if (v14)
    {
      uint64_t v17 = (_OWORD *)(v8[7] + 32 * v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      sub_1BF8AA094(v29, v17);
    }
    else
    {
      v8[(v13 >> 6) + 8] |= 1 << v13;
      uint64_t v18 = (uint64_t *)(v8[6] + 16 * v13);
      uint64_t *v18 = v9;
      v18[1] = v10;
      sub_1BF8AA094(v29, (_OWORD *)(v8[7] + 32 * v13));
      uint64_t v19 = v8[2];
      BOOL v20 = __OFADD__(v19, 1);
      uint64_t v21 = v19 + 1;
      if (v20) {
        goto LABEL_17;
      }
      v8[2] = v21;
      swift_bridgeObjectRetain();
    }
    unint64_t v34 = (unint64_t)v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    sub_1BF8CBFD8();
    sub_1BF8B0374((uint64_t)v30, (uint64_t)v31);
    if (!v33) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_1BF8CC158();
  __break(1u);
  return result;
}

uint64_t sub_1BF8AEE04()
{
  type metadata accessor for LayoutDecoder.ObjectPath();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_6_9();
  v1();
  return v0;
}

uint64_t sub_1BF8AEE90()
{
  sub_1BF8AEE04();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for LayoutDecoder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for LayoutDecoder.ObjectPath()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8AEF18(uint64_t a1, char a2)
{
  *(void *)(v2 + 32) = MEMORY[0x1E4FBC860];
  sub_1BF8CBF58();
  *(void *)(v2 + 40) = sub_1BF8CB9F8();
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return v2;
}

uint64_t sub_1BF8AEF8C()
{
  type metadata accessor for LayoutKeyedDecodingContainer();
  sub_1BF8BA228(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  return sub_1BF8CC008();
}

uint64_t sub_1BF8AF030()
{
  sub_1BF8B0000();
  swift_allocError();
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(unsigned char *)(v0 + 48) = 2;
  return swift_willThrow();
}

uint64_t sub_1BF8AF08C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8AF0BC()
{
  uint64_t v0 = sub_1BF8AF08C();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t type metadata accessor for _LayoutDecoder()
{
  return self;
}

uint64_t sub_1BF8AF110()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_1BF8AF1A4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 9uLL) {
    uint64_t v5 = 9;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 1)
    {
      unsigned __int8 v14 = a2[8];
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 8) = v14;
      *(unsigned char *)(a1 + v5) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_1BF8AF328(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 9) {
    unint64_t v2 = 9;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return swift_bridgeObjectRelease();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

uint64_t sub_1BF8AF428(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 9uLL) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
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
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    unsigned __int8 v10 = a2[8];
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 8) = v10;
    swift_bridgeObjectRetain();
    char v11 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v11 = 0;
  }
  *(unsigned char *)(a1 + v4) = v11;
  return a1;
}

unsigned __int8 *sub_1BF8AF56C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 9uLL) {
      uint64_t v7 = 9;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      unsigned __int8 v18 = a2[8];
      *(void *)a1 = *(void *)a2;
      a1[8] = v18;
      a1[v7] = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

uint64_t sub_1BF8AF790(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 9uLL) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
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
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 8) = a2[8];
    char v10 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *(unsigned char *)(a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_1BF8AF8D0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 9uLL) {
      uint64_t v7 = 9;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      a1[8] = a2[8];
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_1BF8AFAF0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 9;
  if (*(void *)(v3 + 64) > 9uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_1BF8AFC24(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 9) {
    unint64_t v5 = 9;
  }
  size_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if (a3 < 0xFF)
  {
    int v8 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v9 = a2 - 255;
    if (v6 < 4)
    {
      int v10 = (v9 >> v7) + 1;
      if (v5 != -1)
      {
        int v12 = v9 & ~(-1 << v7);
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v6] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1BF8AFDE8);
      case 4:
        *(_DWORD *)&a1[v6] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_1BF8AFE10(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 9;
  if (*(void *)(v2 + 64) > 9uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
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
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_1BF8AFEC8(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 9uLL) {
    size_t v4 = 9;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_1BF8AFFA0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BF8AFFAC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BF8AFFB8()
{
  return sub_1BF8AEF8C();
}

uint64_t sub_1BF8AFFDC()
{
  return sub_1BF8AF030();
}

unint64_t sub_1BF8B0000()
{
  unint64_t result = qword_1EA170440;
  if (!qword_1EA170440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170440);
  }
  return result;
}

double sub_1BF8B004C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  size_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1BF8999E0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *size_t v4 = 0x8000000000000000;
    sub_1BF8B04B0();
    sub_1BF8CBF68();
    swift_bridgeObjectRelease();
    sub_1BF8AA094((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1BF8CBF88();
    *size_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1BF8B0180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_17(a1, a2, a3);
  OUTLINED_FUNCTION_11_1();
  if (v7)
  {
    __break(1u);
LABEL_12:
    uint64_t result = sub_1BF8CC158();
    __break(1u);
    return result;
  }
  uint64_t v8 = v5;
  char v9 = v6;
  sub_1BF8B08CC(0, &qword_1EBA90708, (void (*)(uint64_t))sub_1BF8B0864);
  if (OUTLINED_FUNCTION_13_0())
  {
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_16_0();
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v8 = v10;
  }
  if (v9)
  {
    uint64_t v12 = *(void *)(*(void *)v4 + 56);
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v12 + 8 * v8) = v3;
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    sub_1BF8B0618(v14, v15, v16, v17, v18);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1BF8B0268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BF8B0530(a1, a2, a3, a4, (unint64_t *)&unk_1EBA90920, (void (*)(uint64_t))type metadata accessor for LayoutContextFrame);
}

_OWORD *sub_1BF8B0288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_17(a1, a2, a3);
  OUTLINED_FUNCTION_11_1();
  if (v7)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v8 = v5;
  char v9 = v6;
  sub_1BF8B04B0();
  if ((OUTLINED_FUNCTION_13_0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v10 = OUTLINED_FUNCTION_19_0();
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_1BF8CC158();
    __break(1u);
    return result;
  }
  unint64_t v8 = v10;
LABEL_5:
  if (v9)
  {
    uint64_t v12 = (_OWORD *)(*(void *)(*(void *)v4 + 56) + 32 * v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return sub_1BF8AA094(v3, v12);
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    sub_1BF8B0660(v14, v15, v16, v17, v18);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1BF8B0374(uint64_t a1, uint64_t a2)
{
  sub_1BF8B03D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BF8B03D8()
{
  if (!qword_1EBA901F8)
  {
    sub_1BF8B0430();
    unint64_t v0 = sub_1BF8CBD98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA901F8);
    }
  }
}

void sub_1BF8B0430()
{
  if (!qword_1EBA901F0)
  {
    sub_1BF8B07BC(255, &qword_1EBA90200);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA901F0);
    }
  }
}

void sub_1BF8B04B0()
{
  if (!qword_1EBA907E8)
  {
    unint64_t v0 = sub_1BF8CBF98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA907E8);
    }
  }
}

uint64_t sub_1BF8B0510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BF8B0530(a1, a2, a3, a4, &qword_1EBA907E0, (void (*)(uint64_t))type metadata accessor for LayoutContext);
}

uint64_t sub_1BF8B0530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  OUTLINED_FUNCTION_2_17(a1, a2, a3);
  OUTLINED_FUNCTION_11_1();
  if (v12)
  {
    __break(1u);
LABEL_12:
    uint64_t result = sub_1BF8CC158();
    __break(1u);
    return result;
  }
  uint64_t v13 = v10;
  char v14 = v11;
  sub_1BF8B08CC(0, a5, a6);
  if (OUTLINED_FUNCTION_13_0())
  {
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_16_0();
    if (!v16) {
      goto LABEL_12;
    }
    uint64_t v13 = v15;
  }
  if (v14)
  {
    uint64_t v17 = *(void *)(*(void *)v7 + 56);
    uint64_t result = swift_release();
    *(void *)(v17 + 8 * v13) = v6;
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    sub_1BF8B0618(v19, v20, v21, v22, v23);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_1BF8B0618(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  unint64_t v5 = (void *)(a5[6] + 16 * result);
  *unint64_t v5 = a2;
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

_OWORD *sub_1BF8B0660(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1BF8AA094(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_1BF8B06CC(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1BF8B0718(0, a2, a3);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_6_9();
  v4();
  return a1;
}

void sub_1BF8B0718(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1BF8A4100(255, a3);
    unint64_t v4 = sub_1BF8CBD98();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1BF8B0770()
{
  unint64_t result = qword_1EA170458;
  if (!qword_1EA170458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170458);
  }
  return result;
}

void sub_1BF8B07BC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1BF8CBD98();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unint64_t sub_1BF8B0804()
{
  unint64_t result = qword_1EBA8F7D0;
  if (!qword_1EBA8F7D0)
  {
    type metadata accessor for _LayoutDecoder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA8F7D0);
  }
  return result;
}

uint64_t sub_1BF8B0854()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1BF8B0864()
{
  if (!qword_1EBA906E8)
  {
    sub_1BF8A2BC4();
    unint64_t v0 = sub_1BF8CBA28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA906E8);
    }
  }
}

void sub_1BF8B08CC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BF8CBF98();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1BF8B0930()
{
  return sub_1BF8AFFDC();
}

uint64_t Prop.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  return Prop.init(_:_:)(a1, a2);
}

uint64_t Prop.init(_:_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  sub_1BF89172C(a2, v2 + 48);
  char v6 = 5;
  uint64_t v4 = Node.init(kind:identifier:)(&v6, 0, 0);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v4;
}

uint64_t Prop.__allocating_init(_:_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Prop.init(_:_:name:)(a1, a2, a3, a4);
}

uint64_t Prop.init(_:_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  sub_1BF89172C(a2, v4 + 48);
  char v10 = 5;
  uint64_t v8 = Node.init(kind:identifier:)(&v10, a3, a4);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v8;
}

uint64_t sub_1BF8B0AC8()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  BOOL v7 = (char *)&v14[-1] - v6;
  swift_getAtKeyPath();
  uint64_t v8 = v1[17];
  uint64_t v9 = v1[19];
  uint64_t v10 = v1[20];
  v14[0] = v8;
  v14[1] = v2;
  v14[2] = v9;
  uint64_t v15 = v10;
  uint64_t v15 = type metadata accessor for Prop();
  char v16 = &protocol witness table for Node<A>;
  v14[0] = v0;
  char v11 = *(void (**)(void *, uint64_t, uint64_t))(v10 + 8);
  swift_retain();
  v11(v14, v2, v10);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_1BF8B0C1C()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  BOOL v7 = (char *)&v15[-1] - v6;
  swift_getAtKeyPath();
  uint64_t v8 = v1[17];
  uint64_t v9 = v1[19];
  uint64_t v10 = v1[20];
  v15[0] = v8;
  v15[1] = v2;
  _OWORD v15[2] = v9;
  uint64_t v16 = v10;
  uint64_t v16 = type metadata accessor for Prop();
  uint64_t v17 = &protocol witness table for Node<A>;
  v15[0] = v0;
  char v11 = *(void (**)(uint64_t, void *, unint64_t, uint64_t, uint64_t))(v10 + 16);
  unint64_t v12 = sub_1BF8B0F0C();
  swift_retain();
  v11(v0 + 48, v15, v12, v2, v10);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return 0;
}

void Prop.__allocating_init(kind:identifier:)()
{
}

void Prop.init(kind:identifier:)()
{
}

uint64_t sub_1BF8B0DEC()
{
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(v0 + 48);
}

uint64_t Prop.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return v0;
}

uint64_t Prop.__deallocating_deinit()
{
  uint64_t v0 = Prop.deinit();
  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t Prop.description.getter()
{
  return 0;
}

unint64_t sub_1BF8B0F0C()
{
  unint64_t result = qword_1EBA8F918;
  if (!qword_1EBA8F918)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA8F918);
  }
  return result;
}

uint64_t sub_1BF8B0F64()
{
  return Prop.description.getter();
}

uint64_t sub_1BF8B0F88()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Prop()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for Prop(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Prop);
}

uint64_t dispatch thunk of Prop.__allocating_init(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of Prop.__allocating_init(_:_:name:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t Conditional.condition.getter@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *v2;
  unint64_t v5 = (unint64_t)*v2 >> 62;
  if (v5)
  {
    if (v5 == 1)
    {
      uint64_t v6 = result;
      a2[3] = (uint64_t)&type metadata for NotCondition;
      a2[4] = (uint64_t)&off_1F1B09888;
      *a2 = swift_allocObject();
      return Conditional.condition.getter(v6);
    }
    if (v4 == 0x8000000000000000)
    {
      a2[3] = (uint64_t)&type metadata for FlexibleCondition;
      a2[4] = (uint64_t)&off_1F1B0B5D8;
      *(unsigned char *)a2 = 0;
      return result;
    }
    a2[3] = (uint64_t)&type metadata for FlexibleCondition;
    a2[4] = (uint64_t)&off_1F1B0B5D8;
    if (v4 == 0x8000000000000008) {
      char v7 = 1;
    }
    else {
      char v7 = 2;
    }
  }
  else
  {
    char v7 = *(unsigned char *)(v4 + 16);
    a2[3] = (uint64_t)&type metadata for BoolCondition;
    a2[4] = (uint64_t)&off_1F1B077D0;
  }
  *(unsigned char *)a2 = v7;
  return result;
}

uint64_t sub_1BF8B1150()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t ConditionalList.condition.getter@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v148 = a2;
  uint64_t v143 = a1[7];
  uint64_t v2 = *(char **)(*(void *)(v143 + 24) + 16);
  uint64_t v139 = a1[5];
  uint64_t v3 = *(char **)(v139 + 8);
  int v147 = a1;
  uint64_t v4 = a1[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v135 = swift_getAssociatedTypeWitness();
  MEMORY[0x1F4188790](v135);
  v134[1] = (char *)v134 - v6;
  uint64_t v7 = sub_1BF8CBD98();
  MEMORY[0x1F4188790](v7 - 8);
  v138 = (char *)v134 - v8;
  OUTLINED_FUNCTION_0_4();
  uint64_t v141 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3_14();
  uint64_t v136 = (char *)(v11 - v12);
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x1F4188790](v13);
  uint64_t v137 = (char *)v134 - v14;
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x1F4188790](v15);
  int v144 = (char *)v134 - v16;
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x1F4188790](v17);
  v140 = (char *)v134 - v18;
  int v145 = v3;
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v20 = sub_1BF8CBD98();
  swift_getTupleTypeMetadata2();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_3_14();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_0_4();
  uint64_t v146 = v23;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_3_14();
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)v134 - v27;
  uint64_t v29 = MEMORY[0x1F4188790](v26);
  MEMORY[0x1F4188790](v29);
  int v142 = (char *)v134 - v30;
  OUTLINED_FUNCTION_10_2();
  uint64_t v32 = MEMORY[0x1F4188790](v31);
  unint64_t v34 = (char *)v134 - v33;
  uint64_t v35 = MEMORY[0x1F4188790](v32);
  uint64_t v152 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_3_14();
  uint64_t v37 = MEMORY[0x1F4188790](v36);
  uint64_t v39 = (char *)v134 - v38;
  uint64_t v40 = MEMORY[0x1F4188790](v37);
  uint64_t v41 = MEMORY[0x1F4188790](v40);
  uint64_t v151 = v4;
  uint64_t v150 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_3_14();
  uint64_t v43 = MEMORY[0x1F4188790](v42);
  uint64_t v45 = (char *)v134 - v44;
  uint64_t v46 = MEMORY[0x1F4188790](v43);
  uint64_t v58 = (char *)v134 - v57;
  switch(*(void *)v149 >> 62)
  {
    case 1:
      v140 = v51;
      uint64_t v143 = v50;
      int v144 = v56;
      uint64_t v149 = v46;
      uint64_t v70 = v54;
      uint64_t v71 = v45;
      uint64_t v72 = v48;
      int v142 = (char *)v20;
      uint64_t v73 = v28;
      uint64_t v74 = v53;
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      uint64_t v76 = swift_projectBox() + *(int *)(TupleTypeMetadata2 + 48);
      OUTLINED_FUNCTION_9_4();
      v77();
      uint64_t v78 = *(void (**)(char *, uint64_t, uint64_t))(v152 + 16);
      v78(v39, v76, v70);
      uint64_t v141 = (uint64_t)v71;
      sub_1BF8CBA38();
      uint64_t v79 = v73;
      int v145 = v39;
      uint64_t v80 = v39;
      uint64_t v81 = v74;
      uint64_t v82 = (uint64_t)v73;
      long long v83 = v142;
      v78(v79, (uint64_t)v80, v70);
      __swift_storeEnumTagSinglePayload(v82, 0, 1, v70);
      uint64_t v84 = v72 + *(int *)(v149 + 48);
      uint64_t v85 = v146;
      long long v86 = *(void (**)(void))(v146 + 16);
      OUTLINED_FUNCTION_8_2();
      v86();
      OUTLINED_FUNCTION_8_2();
      v86();
      uint64_t v87 = v72;
      OUTLINED_FUNCTION_12_0(v72, 1, v70);
      if (v106)
      {
        uint64_t v88 = *(void (**)(void))(v85 + 8);
        OUTLINED_FUNCTION_4_14();
        v88();
        OUTLINED_FUNCTION_4_14();
        v88();
        OUTLINED_FUNCTION_12_0(v84, 1, v70);
        if (v106)
        {
          OUTLINED_FUNCTION_4_14();
          v88();
          char v89 = 1;
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v139 = v81;
        int v109 = v140;
        OUTLINED_FUNCTION_8_2();
        v86();
        OUTLINED_FUNCTION_12_0(v84, 1, v70);
        if (!v110)
        {
          uint64_t v121 = v152;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v152 + 32))(v143, v84, v70);
          char v89 = sub_1BF8CBA68();
          double v122 = *(void (**)(void))(v121 + 8);
          OUTLINED_FUNCTION_11_2();
          v122();
          double v123 = *(void (**)(void))(v146 + 8);
          OUTLINED_FUNCTION_1_18();
          v123();
          OUTLINED_FUNCTION_1_18();
          v123();
          OUTLINED_FUNCTION_11_2();
          v122();
          ((void (*)(uint64_t, char *))v123)(v87, v83);
          goto LABEL_30;
        }
        int v111 = *(void (**)(void))(v146 + 8);
        OUTLINED_FUNCTION_11_2();
        v111();
        OUTLINED_FUNCTION_11_2();
        v111();
        (*(void (**)(char *, uint64_t))(v152 + 8))(v109, v70);
      }
      OUTLINED_FUNCTION_6_9();
      v112();
      char v89 = 0;
LABEL_30:
      double v124 = v148;
      uint64_t v125 = v141;
      v148[3] = (uint64_t)&type metadata for BoolCondition;
      v124[4] = (uint64_t)&off_1F1B077D0;
      *(unsigned char *)double v124 = v89 & 1;
      uint64_t v126 = v151;
      OUTLINED_FUNCTION_6_9();
      v127();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v150 + 8))(v125, v126);
    case 2:
      int v142 = v2;
      uint64_t v90 = v55;
      uint64_t v91 = v47;
      uint64_t v92 = v54;
      TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
      uint64_t v94 = swift_projectBox() + *(int *)(TupleTypeMetadata3 + 64);
      OUTLINED_FUNCTION_9_4();
      v95();
      uint64_t v146 = v92;
      OUTLINED_FUNCTION_9_4();
      v96();
      uint64_t v97 = v141;
      char v98 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 16);
      v98(v140, v94, AssociatedTypeWitness);
      uint64_t v99 = (uint64_t)v138;
      uint64_t v149 = v90;
      int v147 = v91;
      sub_1BF8CBCB8();
      OUTLINED_FUNCTION_12_0(v99, 1, AssociatedTypeWitness);
      if (v106)
      {
        __break(1u);
        JUMPOUT(0x1BF8B2160);
      }
      uint64_t v100 = v144;
      sub_1BF8CBDC8();
      uint64_t v101 = *(void (**)(void))(v97 + 8);
      OUTLINED_FUNCTION_0_28();
      v101();
      if (sub_1BF8CBDF8())
      {
        if (sub_1BF8CBDE8() >= 64)
        {
          uint64_t v153 = 0;
          sub_1BF8B2170();
          OUTLINED_FUNCTION_5_9();
          sub_1BF8CBDB8();
          char v103 = sub_1BF8CBA68();
          OUTLINED_FUNCTION_0_28();
          v101();
          ((void (*)(char *, uint64_t))v101)(v100, AssociatedTypeWitness);
        }
        else
        {
          uint64_t v102 = sub_1BF8CBDD8();
          OUTLINED_FUNCTION_0_28();
          v101();
          char v103 = v102 == 0;
        }
        int v115 = v148;
        goto LABEL_38;
      }
      char v113 = sub_1BF8CBDF8();
      uint64_t v114 = sub_1BF8CBDE8();
      if ((v113 & 1) == 0)
      {
        int v115 = v148;
        if (v114 < 64)
        {
          uint64_t v128 = sub_1BF8CBDD8();
          OUTLINED_FUNCTION_0_28();
          v101();
          char v103 = v128 == 0;
        }
        else
        {
          uint64_t v153 = 0;
          sub_1BF8B2170();
          sub_1BF8CBDB8();
          uint64_t v132 = v144;
          char v103 = sub_1BF8CBA68();
          OUTLINED_FUNCTION_0_28();
          v101();
          ((void (*)(char *, uint64_t))v101)(v132, AssociatedTypeWitness);
        }
        goto LABEL_38;
      }
      if (v114 > 64)
      {
        uint64_t v153 = 0;
        sub_1BF8B2170();
        OUTLINED_FUNCTION_5_9();
        sub_1BF8CBDB8();
        char v103 = sub_1BF8CBA68();
        OUTLINED_FUNCTION_0_28();
        v101();
        OUTLINED_FUNCTION_0_28();
        v101();
        int v115 = v148;
LABEL_38:
        uint64_t v129 = v151;
        goto LABEL_39;
      }
      swift_getAssociatedConformanceWitness();
      sub_1BF8CC138();
      sub_1BF8CC058();
      uint64_t v129 = v151;
      swift_getAssociatedConformanceWitness();
      uint64_t v130 = v144;
      char v131 = sub_1BF8CBA58();
      OUTLINED_FUNCTION_0_28();
      v101();
      v98(v136, (uint64_t)v130, AssociatedTypeWitness);
      char v103 = (v131 & 1) != 0 && sub_1BF8CBDD8() == 0;
      int v115 = v148;
      OUTLINED_FUNCTION_0_28();
      v101();
      OUTLINED_FUNCTION_0_28();
      v101();
LABEL_39:
      v115[3] = (uint64_t)&type metadata for BoolCondition;
      v115[4] = (uint64_t)&off_1F1B077D0;
      *(unsigned char *)int v115 = v103 & 1;
      OUTLINED_FUNCTION_0_28();
      v101();
      OUTLINED_FUNCTION_6_9();
      v133();
      return (*(uint64_t (**)(void *, uint64_t))(v150 + 8))(v147, v129);
    case 3:
      uint64_t v153 = *(void *)((*(void *)v149 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      int v104 = v148;
      v148[3] = (uint64_t)&type metadata for NotCondition;
      v104[4] = (uint64_t)&off_1F1B09888;
      *int v104 = swift_allocObject();
      return ConditionalList.condition.getter(v147);
    default:
      uint64_t v143 = v50;
      int v144 = v56;
      uint64_t v149 = v46;
      uint64_t v59 = v54;
      uint64_t v141 = v49;
      uint64_t v60 = v52;
      swift_getTupleTypeMetadata2();
      swift_projectBox();
      OUTLINED_FUNCTION_9_4();
      v61();
      uint64_t v62 = *(void (**)(void))(v152 + 16);
      OUTLINED_FUNCTION_7_7();
      v62();
      sub_1BF8CBC98();
      int v145 = v60;
      uint64_t v63 = v141;
      OUTLINED_FUNCTION_7_7();
      v62();
      __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v59);
      uint64_t v64 = v63 + *(int *)(v149 + 48);
      uint64_t v65 = v146;
      uint64_t v66 = *(void (**)(void))(v146 + 16);
      OUTLINED_FUNCTION_7_7();
      v66();
      OUTLINED_FUNCTION_7_7();
      v66();
      OUTLINED_FUNCTION_12_0(v63, 1, v59);
      if (v106)
      {
        uint64_t v67 = *(void (**)(void))(v65 + 8);
        OUTLINED_FUNCTION_1_18();
        v67();
        OUTLINED_FUNCTION_1_18();
        v67();
        OUTLINED_FUNCTION_12_0(v64, 1, v59);
        uint64_t v68 = v148;
        if (v106)
        {
          OUTLINED_FUNCTION_1_18();
          v67();
          char v69 = 1;
LABEL_21:
          uint64_t v119 = v151;
          goto LABEL_29;
        }
      }
      else
      {
        OUTLINED_FUNCTION_7_7();
        v66();
        OUTLINED_FUNCTION_12_0(v64, 1, v59);
        if (!v106)
        {
          uint64_t v116 = v152;
          uint64_t v117 = v143;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v152 + 32))(v143, v64, v59);
          char v69 = sub_1BF8CBA68();
          uint64_t v149 = *(void *)(v116 + 8);
          ((void (*)(uint64_t, uint64_t))v149)(v117, v59);
          unsigned __int8 v118 = *(void (**)(void))(v65 + 8);
          OUTLINED_FUNCTION_1_18();
          v118();
          OUTLINED_FUNCTION_1_18();
          v118();
          ((void (*)(char *, uint64_t))v149)(v142, v59);
          OUTLINED_FUNCTION_1_18();
          v118();
          uint64_t v119 = v151;
          uint64_t v68 = v148;
LABEL_29:
          v68[3] = (uint64_t)&type metadata for BoolCondition;
          v68[4] = (uint64_t)&off_1F1B077D0;
          *(unsigned char *)uint64_t v68 = v69 & 1;
          OUTLINED_FUNCTION_6_9();
          v120();
          return (*(uint64_t (**)(char *, uint64_t))(v150 + 8))(v58, v119);
        }
        CGRect v107 = *(void (**)(void))(v65 + 8);
        OUTLINED_FUNCTION_1_18();
        v107();
        OUTLINED_FUNCTION_1_18();
        v107();
        (*(void (**)(char *, uint64_t))(v152 + 8))(v142, v59);
        uint64_t v68 = v148;
      }
      OUTLINED_FUNCTION_6_9();
      v108();
      char v69 = 0;
      goto LABEL_21;
  }
}

unint64_t sub_1BF8B2170()
{
  unint64_t result = qword_1EA170460[0];
  if (!qword_1EA170460[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA170460);
  }
  return result;
}

uint64_t Conditional.description.getter()
{
  uint64_t v1 = *v0 >> 62;
  if (!v1)
  {
    uint64_t v4 = 0x28727078652ELL;
    sub_1BF8CBAC8();
    swift_bridgeObjectRelease();
    sub_1BF8CBAC8();
    return v4;
  }
  if (v1 == 1)
  {
    unint64_t v2 = *(void *)((*v0 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
    uint64_t v4 = 0;
    sub_1BF88E120(v2);
    sub_1BF8CBAC8();
    swift_getWitnessTable();
    sub_1BF8CC048();
    sub_1BF8CBAC8();
    sub_1BF88E238(v2);
    return v4;
  }
  return 0x6C626978656C662ELL;
}

uint64_t dispatch thunk of ConditionType.evaluate<A>(cursor:template:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of ConditionalProviding.condition.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

unint64_t *sub_1BF8B2370(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF88E120(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_1BF8B23A4(unint64_t *a1)
{
  return sub_1BF88E238(*a1);
}

unint64_t *sub_1BF8B23AC(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF88E120(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_1BF88E238(v4);
  return a1;
}

unint64_t *sub_1BF8B23E8(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_1BF88E238(v3);
  return a1;
}

uint64_t type metadata accessor for Conditional()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8B2434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t getEnumTagSinglePayload for AltTextLogic(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7D && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 124;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7C) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for AltTextLogic(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)unint64_t result = a2 - 125;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BF8B24E0(void *a1)
{
  return *a1 >> 62;
}

uint64_t *sub_1BF8B24EC(uint64_t *result, uint64_t a2)
{
  *unint64_t result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

uint64_t type metadata accessor for ConditionalList()
{
  return swift_getGenericMetadata();
}

uint64_t DimensionSizerResult.cursorValue.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_19();
  return sub_1BF8B254C(v0, v1);
}

uint64_t sub_1BF8B254C@<X0>(uint64_t result@<X0>, double *a2@<X8>)
{
  void (*v11)(double *__return_ptr, void *);
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void v23[2];
  double v24;
  double v25;
  char v26;

  unint64_t v4 = *v2;
  char v5 = result;
  switch(*v2 >> 61)
  {
    case 1uLL:
      if (qword_1EA1700B8 != -1) {
        unint64_t result = swift_once();
      }
      int8x16_t v10 = (int8x16_t)xmmword_1EA170310;
      goto LABEL_7;
    case 2uLL:
    case 4uLL:
    case 6uLL:
      uint64_t v24 = *(double *)((v4 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v6 = result & 1;
      uint64_t v7 = a2;
      goto LABEL_9;
    case 3uLL:
      uint64_t v24 = *(double *)((v4 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v7 = a2;
      uint64_t v6 = 1;
LABEL_9:
      unint64_t result = (uint64_t)sub_1BF8B254C(v7, v6);
      break;
    case 5uLL:
      uint64_t v11 = *(void (**)(double *__return_ptr, void *))((v4 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      swift_retain();
      swift_retain();
      sub_1BF8B278C(v5 & 1, &v24);
      uint64_t v12 = v24;
      uint64_t v13 = v25;
      sub_1BF8B254C(&v24, v5 & 1);
      uint64_t v14 = v24;
      uint64_t v15 = v25;
      *(double *)uint64_t v23 = v12;
      *(double *)&v23[1] = v13;
      v11(&v24, v23);
      swift_release();
      unint64_t result = swift_release();
      uint64_t v16 = v24;
      uint64_t v17 = v25;
      if (v14 <= v24) {
        uint64_t v18 = v14;
      }
      else {
        uint64_t v18 = v24;
      }
      uint64_t v19 = v14 + v15;
      if (v14 + v15 <= v24 + v25) {
        uint64_t v19 = v24 + v25;
      }
      uint64_t v20 = v19 - v18;
      if (v26 != 1)
      {
        uint64_t v16 = v14;
        uint64_t v17 = v15;
      }
      if (!v26)
      {
        uint64_t v16 = v18;
        uint64_t v17 = v20;
      }
      uint64_t v21 = ceil(v16);
      uint64_t v22 = ceil(v17);
      if ((v5 & 1) == 0)
      {
        uint64_t v16 = v21;
        uint64_t v17 = v22;
      }
      *a2 = v16;
      a2[1] = v17;
      break;
    default:
      int32x2_t v8 = vdup_n_s32(result);
      v9.i64[0] = v8.u32[0];
      v9.i64[1] = v8.u32[1];
      int8x16_t v10 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v9, 0x3FuLL)), *(int8x16_t *)(v4 + 16), (int8x16_t)vrndpq_f64(*(float64x2_t *)(v4 + 16)));
LABEL_7:
      *(int8x16_t *)a2 = v10;
      break;
  }
  return result;
}

uint64_t DimensionSizerResult.value.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_19();
  return sub_1BF8B278C(v0, v1);
}

uint64_t sub_1BF8B278C@<X0>(uint64_t result@<X0>, double *a2@<X8>)
{
  void (*v11)(double *__return_ptr, void *);
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void v20[2];
  double v21;
  double v22;
  char v23;

  unint64_t v4 = *v2;
  char v5 = result;
  switch(*v2 >> 61)
  {
    case 1uLL:
      if (qword_1EA1700B8 != -1) {
        unint64_t result = swift_once();
      }
      int8x16_t v10 = (int8x16_t)xmmword_1EA170310;
      goto LABEL_7;
    case 2uLL:
    case 4uLL:
    case 6uLL:
      uint64_t v21 = *(double *)((v4 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v6 = result & 1;
      uint64_t v7 = a2;
      goto LABEL_9;
    case 3uLL:
      uint64_t v21 = *(double *)((v4 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v7 = a2;
      uint64_t v6 = 1;
LABEL_9:
      unint64_t result = (uint64_t)sub_1BF8B278C(v7, v6);
      break;
    case 5uLL:
      uint64_t v11 = *(void (**)(double *__return_ptr, void *))((v4 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      swift_retain();
      swift_retain();
      sub_1BF8B278C(&v21, v5 & 1);
      uint64_t v12 = v21;
      uint64_t v13 = v22;
      *(double *)uint64_t v20 = v21;
      *(double *)&v20[1] = v22;
      v11(&v21, v20);
      swift_release();
      unint64_t result = swift_release();
      uint64_t v14 = v21;
      uint64_t v15 = v22;
      if (v23 == 1) {
        uint64_t v16 = v21;
      }
      else {
        uint64_t v16 = v12;
      }
      if (v23 == 1) {
        uint64_t v17 = v22;
      }
      else {
        uint64_t v17 = v13;
      }
      if (v23)
      {
        uint64_t v14 = v16;
        uint64_t v15 = v17;
      }
      uint64_t v18 = ceil(v14);
      uint64_t v19 = ceil(v15);
      if ((v5 & 1) == 0)
      {
        uint64_t v14 = v18;
        uint64_t v15 = v19;
      }
      *a2 = v14;
      a2[1] = v15;
      break;
    default:
      int32x2_t v8 = vdup_n_s32(result);
      v9.i64[0] = v8.u32[0];
      v9.i64[1] = v8.u32[1];
      int8x16_t v10 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v9, 0x3FuLL)), *(int8x16_t *)(v4 + 16), (int8x16_t)vrndpq_f64(*(float64x2_t *)(v4 + 16)));
LABEL_7:
      *(int8x16_t *)a2 = v10;
      break;
  }
  return result;
}

uint64_t DimensionSizerResult.isAmbiguous.getter()
{
  char v1 = 0;
  switch(*v0 >> 61)
  {
    case 1:
      char v1 = 1;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      OUTLINED_FUNCTION_0_29();
      char v1 = DimensionSizerResult.isAmbiguous.getter();
      break;
    default:
      return v1 & 1;
  }
  return v1 & 1;
}

uint64_t DimensionSizerResult.nonIntegral.getter()
{
  char v1 = 0;
  switch(*v0 >> 61)
  {
    case 2:
    case 4:
    case 5:
    case 6:
      OUTLINED_FUNCTION_0_29();
      char v1 = DimensionSizerResult.nonIntegral.getter();
      break;
    case 3:
      char v1 = 1;
      break;
    default:
      return v1 & 1;
  }
  return v1 & 1;
}

uint64_t DimensionSizerResult.constraints.getter()
{
  uint64_t result = MEMORY[0x1E4FBC860];
  switch(*v0 >> 61)
  {
    case 2:
      uint64_t v3 = *(void *)((*v0 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      char v4 = *(unsigned char *)((*v0 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
      sub_1BF8A515C();
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_1BF8CD2F0;
      *(void *)(v5 + 32) = v3;
      *(unsigned char *)(v5 + 40) = v4;
      uint64_t v6 = swift_retain();
      uint64_t v7 = DimensionSizerResult.constraints.getter(v6);
      sub_1BF8A0FEC(v7);
      swift_release();
      uint64_t result = v5;
      break;
    case 3:
    case 4:
    case 5:
    case 6:
      OUTLINED_FUNCTION_0_29();
      uint64_t result = DimensionSizerResult.constraints.getter(v2);
      break;
    default:
      return result;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DimensionSizerResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for DimensionSizerResult()
{
  return swift_release();
}

void *assignWithCopy for DimensionSizerResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for DimensionSizerResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1BF8B2C00(void *a1)
{
  return *a1 >> 61;
}

uint64_t *sub_1BF8B2C0C(uint64_t *result, uint64_t a2)
{
  *uint64_t result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 61);
  return result;
}

ValueMetadata *type metadata accessor for DimensionSizerResult()
{
  return &type metadata for DimensionSizerResult;
}

ValueMetadata *type metadata accessor for DimensionSizerResult.ProcessResult()
{
  return &type metadata for DimensionSizerResult.ProcessResult;
}

uint64_t sub_1BF8B2C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, char a3@<W4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 328);
  if (v5 == 3)
  {
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)uint64_t v6 = 0;
    *(unsigned char *)(v6 + 24) = 7;
    return swift_willThrow();
  }
  uint64_t v9 = a1;
  double v10 = *(double *)(a1 + 432);
  uint64_t v11 = *(void *)(a1 + 408);
  double v12 = *(double *)(a1 + 336);
  LOBYTE(v26[0]) = *(unsigned char *)(a1 + 328);
  v26[1] = v12;
  long long v13 = *(_OWORD *)(a1 + 360);
  long long v27 = *(_OWORD *)(a1 + 344);
  long long v28 = v13;
  float64x2_t v14 = *(float64x2_t *)(a1 + 392);
  long long v29 = *(_OWORD *)(a1 + 376);
  float64x2_t v30 = v14;
  uint64_t v31 = v11;
  float64x2_t v32 = *(float64x2_t *)(a1 + 416);
  double v33 = v10;
  double v15 = (vsubq_f64(v14, v32).f64[0] - v10 - (dbl_1BF8CF6B8[(char)v5] + -1.0) * *(double *)&v27)
      / dbl_1BF8CF6B8[(char)v5];
  double v25 = *(double *)&v27;
  char v16 = a3 & 1;
  sub_1BF8B2E28();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  sub_1BF8B2EB0(a2, v16, v26, (CGRect *)v9);
  if (__OFSUB__(v21, 1))
  {
    __break(1u);
    goto LABEL_7;
  }
  double v22 = v15 * (double)v21 + v25 * (double)(v21 - 1);
  CGFloat Height = CGRectGetHeight(*(CGRect *)(v9 + 96));
  uint64_t result = swift_allocObject();
  uint64_t v9 = result;
  *(void *)(result + 16) = v18;
  *(void *)(result + 24) = v20;
  *(double *)(result + 32) = v22;
  *(CGFloat *)(result + 40) = Height;
  if (qword_1EBA90300 != -1) {
LABEL_7:
  }
    uint64_t result = swift_once();
  char v24 = HIBYTE(word_1EBA8F7C8);
  *(unsigned char *)(v9 + 48) = word_1EBA8F7C8;
  *(unsigned char *)(v9 + 49) = v24;
  *a4 = v9;
  return result;
}

uint64_t sub_1BF8B2E28()
{
  return swift_beginAccess();
}

void sub_1BF8B2EB0(uint64_t a1, char a2, double *a3, CGRect *a4)
{
  if (a2)
  {
    double v5 = a3[2];
    double v6 = v5 + (a3[8] - a3[11] - a3[13] - v5 * (dbl_1BF8CF6B8[*(char *)a3] + -1.0)) / dbl_1BF8CF6B8[*(char *)a3];
    if (v6 != 0.0)
    {
      double v7 = ceil((v5 + CGRectGetWidth(a4[3])) / v6);
      if (v7 <= -9.22337204e18)
      {
        __break(1u);
      }
      else if (v7 < 9.22337204e18)
      {
        uint64_t v8 = *(void *)&v7 & 0x7FF0000000000000;
        double v9 = *(double *)&a1 * (double)(uint64_t)v7;
        if (v8 != 0x7FF0000000000000 && (*(void *)&v9 & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          if (v9 > -9.22337204e18)
          {
            if (v9 < 9.22337204e18) {
              return;
            }
LABEL_16:
            __break(1u);
            return;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
      __break(1u);
      goto LABEL_14;
    }
  }
}

uint64_t sub_1BF8B2FC8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8B2C44(a1, *(void *)v2, *(unsigned char *)(v2 + 8), a2);
}

uint64_t sub_1BF8B3004()
{
  return 0;
}

uint64_t sub_1BF8B30A0()
{
  return sub_1BF8B3004();
}

ValueMetadata *type metadata accessor for ColumnSizer.Column()
{
  return &type metadata for ColumnSizer.Column;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnSizer(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 10))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for ColumnSizer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnSizer()
{
  return &type metadata for ColumnSizer;
}

uint64_t sub_1BF8B3180()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t BuilderType.hBox(name:reversed:size:_:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8B3414(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

uint64_t sub_1BF8B31BC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v5 = *a1;
  sub_1BF88E13C(*a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = type metadata accessor for Positioning();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BF8CBB88();
  uint64_t v22 = v7;
  if (v7 == MEMORY[0x1C18B43C0](a2, v6))
  {
    uint64_t result = swift_bridgeObjectRelease();
LABEL_7:
    *a3 = v5;
  }
  else
  {
    uint64_t v17 = a3;
    while (1)
    {
      char v9 = sub_1BF8CBBE8();
      sub_1BF8CBBA8();
      if ((v9 & 1) == 0) {
        break;
      }
      uint64_t v10 = a2 + 32 + 40 * v7;
      uint64_t v11 = *(void **)v10;
      uint64_t v12 = *(void *)(v10 + 8);
      float64x2_t v14 = *(void **)(v10 + 16);
      uint64_t v13 = *(void *)(v10 + 24);
      char v15 = *(unsigned char *)(v10 + 32);
      swift_bridgeObjectRetain();
      sub_1BF8B5DB0(v11, v12, v14, v13, v15);
      MEMORY[0x1C18B43D0](&v22, a2, v6);
      swift_bridgeObjectRelease();
      unint64_t v20 = v5;
      v18[0] = v11;
      v18[1] = v12;
      _OWORD v18[2] = v14;
      v18[3] = v13;
      char v19 = v15;
      uint64_t v16 = type metadata accessor for Sizing();
      Sizing.add(position:)((uint64_t)v18, v16, &v21);
      sub_1BF8B47E4(v5);
      sub_1BF8B5EA0(v11, v12, v14, v13, v15);
      unint64_t v5 = v21;
      uint64_t v7 = v22;
      if (v7 == MEMORY[0x1C18B43C0](a2, v6))
      {
        uint64_t result = swift_bridgeObjectRelease();
        a3 = v17;
        goto LABEL_7;
      }
    }
    uint64_t result = sub_1BF8CBE88();
    __break(1u);
  }
  return result;
}

void sub_1BF8B33B8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t BuilderType.hBox(name:reversed:size:positions:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8B35EC(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

uint64_t BuilderType.vBox(name:reversed:size:_:block:)()
{
  OUTLINED_FUNCTION_18_1();
  return sub_1BF8B3414(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_1BF8B3414(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  unint64_t v12 = *a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_19_1();
  type metadata accessor for Box();
  v24[0] = v12;
  sub_1BF8B31BC(v24, a5, (unint64_t *)&v26);
  LOBYTE(v24[0]) = a10;
  char v25 = 2;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1BF8B7A40(&v25, &v26, (char *)v24, a1, a2, a3);
  OUTLINED_FUNCTION_1_20();
  v16();
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v18 = swift_getAssociatedConformanceWitness();
  v24[0] = AssociatedTypeWitness;
  v24[1] = v17;
  _OWORD v24[2] = AssociatedConformanceWitness;
  v24[3] = v18;
  OUTLINED_FUNCTION_17_1();
  type metadata accessor for BoxBuilder();
  uint64_t v19 = sub_1BF88CA3C(v15);
  swift_retain();
  a6(v19);
  swift_release();
  return swift_release();
}

uint64_t BuilderType.vBox(name:reversed:size:positions:block:)()
{
  OUTLINED_FUNCTION_18_1();
  return sub_1BF8B35EC(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_1BF8B35EC(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  unint64_t v11 = *a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_10_3();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Box();
  v24[0] = v11;
  sub_1BF8B31BC(v24, a5, (unint64_t *)&v26);
  LOBYTE(v24[0]) = a10;
  char v25 = 2;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1BF8B7A40(&v25, &v26, (char *)v24, a1, a2, a3);
  OUTLINED_FUNCTION_1_20();
  v15();
  uint64_t v16 = OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_3();
  uint64_t v17 = swift_getAssociatedConformanceWitness();
  v24[0] = AssociatedTypeWitness;
  v24[1] = v16;
  _OWORD v24[2] = AssociatedConformanceWitness;
  v24[3] = v17;
  type metadata accessor for BoxBuilder();
  uint64_t v18 = sub_1BF88CA3C(v14);
  swift_retain();
  a6(v18);
  swift_release();
  return swift_release();
}

uint64_t BuilderType.frame<A>(name:keyPath:size:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  OUTLINED_FUNCTION_0_9();
  unint64_t v14 = *v13;
  v19[1] = *(void *)(v15 + *MEMORY[0x1E4FBC5F0] + 8);
  _OWORD v19[2] = swift_getAssociatedConformanceWitness();
  _OWORD v19[3] = a8;
  type metadata accessor for Frame();
  v19[0] = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF8B31BC(v19, a5, (unint64_t *)&v18);
  Frame.__allocating_init(name:_:_:mapBlock:)(a1, a2, a3, &v18, 0, 0);
  OUTLINED_FUNCTION_1_20();
  v16();
  return swift_release();
}

uint64_t BuilderType.mapFrame<A>(name:keyPath:size:_:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8B3AE8(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t)&unk_1F1B09018, (uint64_t)sub_1BF8B3948);
}

uint64_t sub_1BF8B3910()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1BF8B3948@<X0>(uint64_t a1@<X8>)
{
  char v2 = (uint64_t *)OUTLINED_FUNCTION_6_10(a1);
  unsigned int v3 = *(uint64_t (**)(double))(v1 + 48);
  v2[3] = v4;
  __swift_allocate_boxed_opaque_existential_0(v2);
  double v5 = OUTLINED_FUNCTION_11_3();
  return v3(v5);
}

uint64_t BuilderType.mapFrame<A>(name:keyPath:size:positions:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8B3CFC(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t)&unk_1F1B09040, (uint64_t)sub_1BF8B3A78);
}

uint64_t sub_1BF8B39E4@<X0>(uint64_t (*a1)(double, double, double, double)@<X1>, uint64_t a2@<X4>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  a3[3] = a2;
  __swift_allocate_boxed_opaque_existential_0(a3);
  uint64_t result = a1(a4, a5, a6, a7);
  if (v7) {
    return __swift_deallocate_boxed_opaque_existential_0((uint64_t)a3);
  }
  return result;
}

uint64_t sub_1BF8B3A78(uint64_t a1)
{
  return sub_1BF8B3F4C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1BF8B39E4);
}

uint64_t BuilderType.mapFrameWithContext<A>(name:keyPath:size:_:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8B3AE8(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t)&unk_1F1B09068, (uint64_t)sub_1BF8B3C58);
}

uint64_t sub_1BF8B3AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  OUTLINED_FUNCTION_0_9();
  unint64_t v17 = *v16;
  uint64_t v27 = *(void *)(v18 + *MEMORY[0x1E4FBC5F0] + 8);
  uint64_t v19 = v27;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  long long v29 = &protocol witness table for LayoutItemList<A>;
  OUTLINED_FUNCTION_17_1();
  type metadata accessor for Frame();
  unint64_t v26 = v17;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF8B31BC(&v26, a5, (unint64_t *)&v25);
  unint64_t v20 = (void *)swift_allocObject();
  _OWORD v20[2] = a8;
  v20[3] = *(void *)(v19 + 80);
  v20[4] = a9;
  v20[5] = *(void *)(v19 + 88);
  v20[6] = a6;
  v20[7] = a7;
  swift_retain();
  Frame.__allocating_init(name:_:_:mapBlock:)(a1, a2, a3, &v25, a11, (uint64_t)v20);
  OUTLINED_FUNCTION_1_20();
  v21();
  return swift_release();
}

uint64_t sub_1BF8B3C58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (uint64_t *)OUTLINED_FUNCTION_6_10(a2);
  double v5 = *(uint64_t (**)(uint64_t, double))(v2 + 48);
  v4[3] = v6;
  __swift_allocate_boxed_opaque_existential_0(v4);
  double v7 = OUTLINED_FUNCTION_11_3();
  return v5(a1, v7);
}

uint64_t BuilderType.mapFrameWithContext<A>(name:keyPath:size:positions:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF8B3CFC(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t)&unk_1F1B09090, (uint64_t)sub_1BF8B3F20);
}

uint64_t sub_1BF8B3CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  OUTLINED_FUNCTION_0_9();
  unint64_t v17 = *v16;
  uint64_t v26 = *(void *)(v18 + *MEMORY[0x1E4FBC5F0] + 8);
  uint64_t v19 = v26;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  long long v28 = &protocol witness table for LayoutItemList<A>;
  OUTLINED_FUNCTION_17_1();
  type metadata accessor for Frame();
  unint64_t v25 = v17;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF8B31BC(&v25, a5, (unint64_t *)&v29);
  unint64_t v20 = (void *)swift_allocObject();
  _OWORD v20[2] = a8;
  v20[3] = *(void *)(v19 + 80);
  v20[4] = a9;
  v20[5] = *(void *)(v19 + 88);
  v20[6] = a6;
  v20[7] = a7;
  swift_retain();
  Frame.__allocating_init(name:_:_:mapBlock:)(a1, a2, a3, &v29, a11, (uint64_t)v20);
  OUTLINED_FUNCTION_1_20();
  v21();
  return swift_release();
}

uint64_t sub_1BF8B3E7C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, double, double, double, double)@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  a4[3] = a3;
  __swift_allocate_boxed_opaque_existential_0(a4);
  uint64_t result = a2(a1, a5, a6, a7, a8);
  if (v8) {
    return __swift_deallocate_boxed_opaque_existential_0((uint64_t)a4);
  }
  return result;
}

uint64_t sub_1BF8B3F20(uint64_t a1)
{
  return sub_1BF8B3F4C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1BF8B3E7C);
}

uint64_t sub_1BF8B3F4C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t BuilderType.space(name:size:)(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Space();
  unint64_t v6 = v3;
  sub_1BF88E13C(v3);
  swift_bridgeObjectRetain();
  Space.__allocating_init(sizing:name:)(&v6);
  OUTLINED_FUNCTION_1_20();
  v4();
  return swift_release();
}

uint64_t BuilderType.prop<A>(keyPath:value:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_1();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_9_5();
  sub_1BF89172C(a2, (uint64_t)v8);
  uint64_t v3 = swift_retain();
  Prop.__allocating_init(_:_:)(v3, (uint64_t)v8);
  OUTLINED_FUNCTION_1_20();
  v6(v4, v5);
  return swift_release();
}

uint64_t BuilderType.prop<A>(name:keyPath:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_9_5();
  sub_1BF89172C(a4, (uint64_t)v12);
  swift_retain();
  swift_bridgeObjectRetain();
  Prop.__allocating_init(_:_:name:)(a3, (uint64_t)v12, a1, a2);
  OUTLINED_FUNCTION_1_20();
  v10(v8, v9);
  return swift_release();
}

uint64_t BuilderType.hOverlay(name:reversed:size:_:on:embedPath:block:)()
{
  OUTLINED_FUNCTION_12_1();
  return sub_1BF8B4324(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13);
}

uint64_t BuilderType.hOverlay(name:reversed:size:positions:on:embedPath:block:)()
{
  OUTLINED_FUNCTION_12_1();
  return sub_1BF8B4500(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13);
}

uint64_t BuilderType.vOverlay(name:reversed:size:_:on:embedPath:block:)()
{
  OUTLINED_FUNCTION_4_15();
  return sub_1BF8B4324(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13);
}

uint64_t BuilderType.vOverlay(name:reversed:size:positions:on:embedPath:block:)()
{
  OUTLINED_FUNCTION_4_15();
  return sub_1BF8B4500(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13);
}

uint64_t BuilderType.inheritedOverlay(name:reversed:size:_:on:embedPath:block:)()
{
  OUTLINED_FUNCTION_5_10();
  return sub_1BF8B4324(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13);
}

uint64_t sub_1BF8B4324(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t), uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  unint64_t v16 = *a4;
  uint64_t v17 = OUTLINED_FUNCTION_15_1();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_19_1();
  type metadata accessor for Overlay();
  v29[0] = v16;
  sub_1BF8B31BC(v29, a5, (unint64_t *)&v30);
  LOBYTE(v29[0]) = a13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_1BF8A5B30(&v30, (char *)v29, a1, a2, a6, a7, a8, a3);
  OUTLINED_FUNCTION_1_20();
  v19();
  uint64_t v20 = OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_13_1();
  uint64_t v21 = swift_getAssociatedConformanceWitness();
  v29[0] = v17;
  v29[1] = v20;
  _OWORD v29[2] = AssociatedConformanceWitness;
  v29[3] = v21;
  type metadata accessor for BoxBuilder();
  uint64_t v22 = sub_1BF88CA3C(v18);
  swift_retain();
  a9(v22);
  swift_release();
  return swift_release();
}

uint64_t BuilderType.inheritedOverlay(name:reversed:size:positions:on:embedPath:block:)()
{
  OUTLINED_FUNCTION_5_10();
  return sub_1BF8B4500(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13);
}

uint64_t sub_1BF8B4500(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t), uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  unint64_t v15 = *a4;
  uint64_t v16 = OUTLINED_FUNCTION_14_1();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Overlay();
  v29[0] = v15;
  sub_1BF8B31BC(v29, a5, (unint64_t *)&v30);
  LOBYTE(v29[0]) = a13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_1BF8A5B30(&v30, (char *)v29, a1, a2, a6, a7, a8, a3);
  OUTLINED_FUNCTION_1_20();
  v18();
  uint64_t v19 = OUTLINED_FUNCTION_14_1();
  uint64_t v20 = swift_getAssociatedConformanceWitness();
  v29[0] = v16;
  v29[1] = v19;
  _OWORD v29[2] = AssociatedConformanceWitness;
  v29[3] = v20;
  type metadata accessor for BoxBuilder();
  uint64_t v21 = sub_1BF88CA3C(v17);
  swift_retain();
  a9(v21);
  swift_release();
  return swift_release();
}

uint64_t BuilderType.embed<A, B, C>(name:keyPath:size:_:layout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_0_9();
  unint64_t v16 = *v8;
  sub_1BF8B31BC(&v16, v9, &v17);
  unint64_t v10 = v17;
  unint64_t v16 = v17;
  swift_getAssociatedConformanceWitness();
  uint64_t v11 = OUTLINED_FUNCTION_10_3();
  Embed<A, B, C, D>(name:_:_:_:)(v11, v12, a3, v13, a6);
  sub_1BF8B47E4(v10);
  OUTLINED_FUNCTION_1_20();
  v14();
  return swift_release();
}

unint64_t sub_1BF8B47E4(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t BuilderType.mapEmbed<A, B, C>(name:keyPath:size:_:layout:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF8B4974(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t)&unk_1F1B090B8, (uint64_t)sub_1BF8B4918);
}

uint64_t sub_1BF8B48E0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1BF8B4918@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8B4BA8(a1, a2);
}

uint64_t BuilderType.mapEmbed<A, B, C>(name:keyPath:size:positions:layout:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1BF8B4974(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t)&unk_1F1B090E0, (uint64_t)sub_1BF8B4918);
}

uint64_t sub_1BF8B4974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_0_9();
  uint64_t v16 = v15;
  uint64_t v18 = (void *)*v17;
  unint64_t v30 = *v19;
  sub_1BF8B31BC(&v30, v20, &v29);
  uint64_t v21 = (void *)swift_allocObject();
  _OWORD v21[2] = a9;
  uint64_t v22 = *(void *)(v16 + *MEMORY[0x1E4FBC5F0] + 8);
  _OWORD v21[3] = *(void *)(v22 + 80);
  v21[4] = v18[17];
  v21[5] = v18[18];
  v21[6] = a10;
  v21[7] = *(void *)(v22 + 88);
  v21[8] = v18[19];
  v21[9] = v18[20];
  v21[10] = a7;
  v21[11] = a8;
  swift_getAssociatedConformanceWitness();
  swift_retain();
  MapEmbed<A, B, C, D>(name:_:_:_:_:)(a1, a2, a3, (uint64_t)&v29, a6, a12, (uint64_t)v21);
  swift_release();
  sub_1BF8B47E4(v29);
  OUTLINED_FUNCTION_1_20();
  v24(v23);
  return swift_release();
}

uint64_t sub_1BF8B4B34@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  a4[3] = a3;
  __swift_allocate_boxed_opaque_existential_0(a4);
  uint64_t result = a2(a1);
  if (v4) {
    return __swift_deallocate_boxed_opaque_existential_0((uint64_t)a4);
  }
  return result;
}

uint64_t sub_1BF8B4BA8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8B4B34(a1, *(uint64_t (**)(uint64_t))(v2 + 80), *(void *)(v2 + 24), a2);
}

uint64_t BuilderType.embed<A, B>(name:keyPath:size:_:context:)(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v28 = a6;
  uint64_t v26 = a2;
  uint64_t v27 = a5;
  uint64_t v29 = a1;
  v25[0] = a10;
  v25[1] = a7;
  v25[2] = a9;
  uint64_t v13 = (unint64_t *)(*a3 + *MEMORY[0x1E4FBC5F0]);
  unint64_t v14 = v13[1];
  unint64_t v31 = *v13;
  unint64_t v32 = v14;
  uint64_t v33 = a8;
  uint64_t v34 = a8;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v36 = a10;
  uint64_t v37 = a11;
  uint64_t v38 = a11;
  uint64_t v15 = type metadata accessor for EmbedFactory.Context();
  OUTLINED_FUNCTION_2_18();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)v25 - v19;
  unint64_t v21 = *a4;
  unint64_t v32 = v14;
  uint64_t v34 = AssociatedConformanceWitness;
  uint64_t AssociatedConformanceWitness = a10;
  uint64_t v36 = a11;
  type metadata accessor for EmbedFactory();
  unint64_t v31 = v21;
  uint64_t v22 = v26;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF8B31BC(&v31, v27, (unint64_t *)&v30);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v28, v15);
  sub_1BF89206C(v29, v22, (uint64_t)a3, &v30, (uint64_t)v20, 0, 0);
  OUTLINED_FUNCTION_1_20();
  v23();
  return swift_release();
}

uint64_t BuilderType.mapEmbedFactory<A, B>(name:keyPath:size:positions:context:mapBlock:)(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _UNKNOWN **a10, uint64_t a11, _UNKNOWN **a12)
{
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v39 = a8;
  uint64_t v30 = a5;
  uint64_t v33 = a4;
  uint64_t v34 = a3;
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  uint64_t v35 = a9;
  uint64_t v36 = a11;
  uint64_t v12 = (unint64_t *)(*a3 + *MEMORY[0x1E4FBC5F0]);
  unint64_t v13 = v12[1];
  unint64_t v43 = *v12;
  unint64_t v44 = v13;
  uint64_t v45 = a10;
  uint64_t v46 = a10;
  unint64_t v31 = a10;
  uint64_t AssociatedConformanceWitness = (_UNKNOWN **)swift_getAssociatedConformanceWitness();
  uint64_t v48 = &protocol witness table for LayoutItemList<A>;
  uint64_t v49 = a12;
  uint64_t v50 = a12;
  unint64_t v32 = a12;
  uint64_t v14 = type metadata accessor for EmbedFactory.Context();
  OUTLINED_FUNCTION_2_18();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v29 - v18;
  unint64_t v20 = *v33;
  unint64_t v44 = v13;
  uint64_t v46 = AssociatedConformanceWitness;
  uint64_t AssociatedConformanceWitness = &protocol witness table for LayoutItemList<A>;
  uint64_t v48 = a12;
  uint64_t v33 = (unint64_t *)type metadata accessor for EmbedFactory();
  unint64_t v43 = v20;
  swift_bridgeObjectRetain();
  uint64_t v21 = (uint64_t)v34;
  swift_retain();
  uint64_t v23 = v35;
  uint64_t v22 = v36;
  sub_1BF8B31BC(&v43, v30, (unint64_t *)&v42);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v37, v14);
  char v24 = (void *)swift_allocObject();
  _OWORD v24[2] = v23;
  unint64_t v25 = v31;
  v24[3] = *(void *)(v13 + 80);
  unint64_t v24[4] = v25;
  v24[5] = v22;
  uint64_t v26 = v32;
  v24[6] = *(void *)(v13 + 88);
  v24[7] = v26;
  v24[8] = v38;
  v24[9] = v39;
  swift_retain();
  sub_1BF89206C(v40, v41, v21, &v42, (uint64_t)v19, (uint64_t)sub_1BF8B5054, (uint64_t)v24);
  OUTLINED_FUNCTION_1_20();
  v27();
  return swift_release();
}

uint64_t sub_1BF8B501C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1BF8B5054@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 64);
  a2[3] = *(void *)(v2 + 24);
  __swift_allocate_boxed_opaque_existential_0(a2);
  return v4(a1);
}

void *BuilderType.if (_:thenBlock:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9 = *a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for IfBuilder();
  unint64_t v10 = sub_1BF8C433C(a2, a3);
  type metadata accessor for IfNode();
  uint64_t v11 = (void *)swift_allocObject();
  _OWORD v11[2] = a4;
  v11[3] = a5;
  v11[4] = v10;
  swift_retain();
  sub_1BF88E120(v9);
  swift_retain();
  sub_1BF89A10C();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a4;
  void v12[3] = a5;
  v12[4] = v10;
  swift_retain();
  IfNode.Else(elseBlock:)((uint64_t)sub_1BF8B52F0, (uint64_t)v12);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_1_20();
  v17(v13, v14, v15, v16);
  swift_release();
  return v10;
}

uint64_t sub_1BF8B5294()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8B52CC()
{
  return sub_1BF8C4380();
}

uint64_t sub_1BF8B52F0()
{
  return sub_1BF8C442C();
}

void *BuilderType.if<A>(_:thenBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_13_1();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_13_1();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_17_1();
  type metadata accessor for IfBuilder();
  uint64_t v13 = sub_1BF8C433C(a2, a3);
  type metadata accessor for IfNode();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  void v14[3] = a5;
  v14[4] = a6;
  void v14[5] = a7;
  v14[6] = a8;
  v14[7] = a9;
  v14[8] = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1BF89A2F4();
  uint64_t v15 = (void *)swift_allocObject();
  _OWORD v15[2] = a4;
  void v15[3] = a5;
  v15[4] = a6;
  v15[5] = a7;
  void v15[6] = a8;
  v15[7] = a9;
  v15[8] = v13;
  swift_retain();
  IfNode.Else(elseBlock:)((uint64_t)sub_1BF8B5594, (uint64_t)v15);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_1_20();
  v16();
  swift_release();
  return v13;
}

uint64_t sub_1BF8B5538()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1BF8B5570()
{
  return sub_1BF8C4380();
}

uint64_t sub_1BF8B5594()
{
  return sub_1BF8C442C();
}

Swift::Void __swiftcall BuilderType.log(_:)(Swift::String a1)
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_19_1();
  type metadata accessor for Log();
  swift_bridgeObjectRetain();
  Log.__allocating_init(_:)(v2, v1);
  OUTLINED_FUNCTION_1_20();
  v3();
  swift_release();
}

uint64_t BuilderType.inspect(_:)()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_19_1();
  type metadata accessor for Inspect();
  swift_retain();
  Inspect.__allocating_init(_:)(v1, v0);
  OUTLINED_FUNCTION_1_20();
  v2();
  return swift_release();
}

uint64_t BuilderType.dynamic(name:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BF8B5934(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F1B091D0, (uint64_t)sub_1BF8B58C4);
}

uint64_t sub_1BF8B5720(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for ListBuilder();
  uint64_t v6 = sub_1BF8C4A38();
  uint64_t v7 = a3;
  a2(v6, a1);
  if (!v9)
  {
    swift_beginAccess();
    uint64_t v7 = *(void *)(v6 + 16);
    swift_bridgeObjectRetain();
  }
  swift_release();
  return v7;
}

uint64_t sub_1BF8B588C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BF8B58C4(uint64_t a1)
{
  return sub_1BF8B5720(a1, *(void (**)(uint64_t, uint64_t))(v1 + 32), *(void *)(v1 + 40));
}

void *sub_1BF8B58E4(void *a1)
{
  id v2 = a1;
  return a1;
}

uint64_t BuilderType.dynamicWithErrorProcessor(name:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BF8B5934(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F1B091F8, (uint64_t)sub_1BF8B5BC8);
}

uint64_t sub_1BF8B5934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Dynamic();
  uint64_t v15 = (void *)swift_allocObject();
  _OWORD v15[2] = a5;
  void v15[3] = a6;
  v15[4] = a3;
  v15[5] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF8949D8(a1, a2, a8, (uint64_t)v15);
  OUTLINED_FUNCTION_1_20();
  v16();
  return swift_release();
}

uint64_t sub_1BF8B5A64(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for ListBuilder();
  uint64_t v6 = sub_1BF8C4A38();
  a2(v6, a1);
  if (!v8)
  {
    swift_beginAccess();
    a3 = *(void *)(v6 + 16);
    swift_bridgeObjectRetain();
  }
  swift_release();
  return a3;
}

uint64_t sub_1BF8B5BC8(uint64_t a1)
{
  return sub_1BF8B5A64(a1, *(void (**)(uint64_t, uint64_t))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t BuilderType.stack(name:_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_10_3();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Stack();
  swift_bridgeObjectRetain();
  uint64_t v5 = Stack.__allocating_init(name:)(a1, a2);
  OUTLINED_FUNCTION_1_20();
  v6();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_3();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for StackBuilder();
  uint64_t v7 = sub_1BF88CA3C(v5);
  swift_retain();
  a3(v7);
  swift_release();
  return swift_release();
}

uint64_t dispatch thunk of BuilderType.add(node:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t __swift_deallocate_boxed_opaque_existential_0(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x1C18B5040);
  }
  return result;
}

id sub_1BF8B5DB0(id result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 15:
    case 16:
    case 23:
    case 24:
      goto LABEL_3;
    case 17:
    case 18:
    case 19:
    case 20:
      swift_bridgeObjectRetain();
      uint64_t result = a3;
LABEL_3:
      uint64_t result = result;
      break;
    case 26:
      uint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 27:
    case 28:
      uint64_t result = (id)swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_1BF8B5EA0(void *a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 15:
    case 16:
    case 23:
    case 24:
      goto LABEL_3;
    case 17:
    case 18:
    case 19:
    case 20:
      swift_bridgeObjectRelease();
      a1 = a3;
LABEL_3:

      break;
    case 26:
      swift_bridgeObjectRelease();
      break;
    case 27:
    case 28:
      swift_release();
      break;
    default:
      return;
  }
}

uint64_t sub_1BF8B5FAC(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  return a1;
}

uint64_t sub_1BF8B6010(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  return a1;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1BF8B6060(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  return a1;
}

uint64_t sub_1BF8B60AC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 42))
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

uint64_t sub_1BF8B60EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 42) = 1;
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
    *(unsigned char *)(result + 42) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AnchorSizer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8B6150@<X0>(long long *a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v6 = *a2;
  uint64_t result = sub_1BF8985E0(a1, a4);
  *(unsigned char *)(a4 + 40) = v6;
  *(unsigned char *)(a4 + 41) = a3;
  return result;
}

uint64_t sub_1BF8B6190(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *a1;
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v9);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, *(void *)(v8 + 80), *(void *)(v8 + 88), v9, v10);
  if (!v4) {
    return sub_1BF8C7BD8((uint64_t)&unk_1F1B049A8, result);
  }
  return result;
}

void *sub_1BF8B625C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v25 = a4;
  uint64_t v7 = v5;
  uint64_t v12 = *a1;
  uint64_t v14 = *(void *)(v7 + 24);
  uint64_t v13 = *(void *)(v7 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v7, v14);
  uint64_t result = (*(void *(**)(long long *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(&v23, a1, a2, a3, *(void *)(v12 + 80), *(void *)(v12 + 88), v14, v13);
  if (!v6)
  {
    uint64_t v16 = v25;
    uint64_t v17 = v23;
    if (*(unsigned char *)(v7 + 41) == 1 && (unint64_t)a1[11] >> 62)
    {
      *a5 = v23;
    }
    else
    {
      uint64_t v18 = swift_allocObject();
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = v17;
      (*(void (**)(long long *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(&v23, v7, v16);
      uint64_t v20 = swift_allocObject();
      long long v21 = v23;
      long long v22 = v24[0];
      *(_OWORD *)(v20 + 16) = *(_OWORD *)(v16 + 16);
      *(_OWORD *)(v20 + 32) = v21;
      *(_OWORD *)(v20 + 48) = v22;
      *(_OWORD *)(v20 + 58) = *(_OWORD *)((char *)v24 + 10);
      *(void *)(v20 + 80) = a1;
      *(void *)(v19 + 24) = sub_1BF8B6C38;
      *(void *)(v19 + 32) = v20;
      *(void *)(v18 + 16) = v19 | 0x7000000000000000;
      *a5 = v18 | 0x3000000000000000;
      return (void *)swift_retain();
    }
  }
  return result;
}

void sub_1BF8B6428(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6)
{
}

double sub_1BF8B64C0(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  sub_1BF8B68AC(a1, &v34);
  switch(v34)
  {
    case 1:
      double MinY = *(double *)(a1 + 96);
      CGFloat v12 = *(double *)(a1 + 104);
      CGFloat v13 = *(double *)(a1 + 112);
      CGFloat v14 = *(double *)(a1 + 120);
      v35.origin.CGFloat x = MinY;
      v35.origin.CGFloat y = v12;
      v35.size.CGFloat width = v13;
      v35.size.CGFloat height = v14;
      if (CGRectGetMaxY(v35) == 1.79769313e308) {
        goto LABEL_15;
      }
      v36.origin.CGFloat x = MinY;
      v36.origin.CGFloat y = v12;
      v36.size.CGFloat width = v13;
      v36.size.CGFloat height = v14;
      CGRectGetMaxY(v36);
      v37.origin.CGFloat x = a2;
      v37.origin.CGFloat y = a3;
      v37.size.CGFloat width = a4;
      v37.size.CGFloat height = a5;
      CGRectGetHeight(v37);
      goto LABEL_18;
    case 2:
      double MinY = CGRectGetMinY(*(CGRect *)(a1 + 96));
      goto LABEL_19;
    case 3:
      double MinY = *(double *)(a1 + 96);
      CGFloat v15 = *(double *)(a1 + 104);
      CGFloat v16 = *(double *)(a1 + 112);
      CGFloat v17 = *(double *)(a1 + 120);
      v38.origin.CGFloat x = MinY;
      v38.origin.CGFloat y = v15;
      v38.size.CGFloat width = v16;
      v38.size.CGFloat height = v17;
      if (CGRectGetMaxX(v38) == 1.79769313e308) {
        goto LABEL_15;
      }
      double v31 = *(double *)(a1 + 16);
      v39.origin.CGFloat x = MinY;
      v39.origin.CGFloat y = v15;
      v39.size.CGFloat width = v16;
      v39.size.CGFloat height = v17;
      double v18 = v31 + CGRectGetMaxX(v39);
      v40.origin.CGFloat x = a2;
      v40.origin.CGFloat y = a3;
      v40.size.CGFloat width = a4;
      v40.size.CGFloat height = a5;
      double MinY = v18 - CGRectGetWidth(v40);
      goto LABEL_19;
    case 4:
      double MinY = *(double *)(a1 + 96);
      CGFloat v19 = *(double *)(a1 + 104);
      CGFloat v20 = *(double *)(a1 + 112);
      CGFloat v21 = *(double *)(a1 + 120);
      v41.origin.CGFloat x = MinY;
      v41.origin.CGFloat y = v19;
      v41.size.CGFloat width = v20;
      v41.size.CGFloat height = v21;
      if (CGRectGetWidth(v41) == 1.79769313e308) {
        goto LABEL_15;
      }
      v42.origin.CGFloat x = MinY;
      v42.origin.CGFloat y = v19;
      v42.size.CGFloat width = v20;
      v42.size.CGFloat height = v21;
      if (CGRectGetHeight(v42) == 1.79769313e308) {
        goto LABEL_15;
      }
      v43.origin.CGFloat x = MinY;
      v43.origin.CGFloat y = v19;
      v43.size.CGFloat width = v20;
      v43.size.CGFloat height = v21;
      double Width = CGRectGetWidth(v43);
      v44.origin.CGFloat x = a2;
      v44.origin.CGFloat y = a3;
      v44.size.CGFloat width = a4;
      v44.size.CGFloat height = a5;
      double v33 = (Width - CGRectGetWidth(v44)) * 0.5;
      v45.origin.CGFloat x = MinY;
      v45.origin.CGFloat y = v19;
      v45.size.CGFloat width = v20;
      v45.size.CGFloat height = v21;
      CGRectGetHeight(v45);
      v46.origin.CGFloat x = a2;
      v46.origin.CGFloat y = a3;
      v46.size.CGFloat width = a4;
      v46.size.CGFloat height = a5;
      CGRectGetHeight(v46);
      double MinY = v33 + *(double *)(a1 + 16);
      goto LABEL_19;
    case 5:
      double MinY = *(double *)(a1 + 96);
      CGFloat v22 = *(double *)(a1 + 104);
      CGFloat v23 = *(double *)(a1 + 112);
      CGFloat v24 = *(double *)(a1 + 120);
      v47.origin.CGFloat x = MinY;
      v47.origin.CGFloat y = v22;
      v47.size.CGFloat width = v23;
      v47.size.CGFloat height = v24;
      if (CGRectGetWidth(v47) == 1.79769313e308) {
        goto LABEL_15;
      }
      v48.origin.CGFloat x = MinY;
      v48.origin.CGFloat y = v22;
      v48.size.CGFloat width = v23;
      v48.size.CGFloat height = v24;
      double v25 = CGRectGetWidth(v48);
      v49.origin.CGFloat x = a2;
      v49.origin.CGFloat y = a3;
      v49.size.CGFloat width = a4;
      v49.size.CGFloat height = a5;
      double MinY = *(double *)(a1 + 16) + (v25 - CGRectGetWidth(v49)) * 0.5;
      goto LABEL_19;
    case 6:
      double MinY = *(double *)(a1 + 96);
      CGFloat v26 = *(double *)(a1 + 104);
      CGFloat v27 = *(double *)(a1 + 112);
      CGFloat v28 = *(double *)(a1 + 120);
      v50.origin.CGFloat x = MinY;
      v50.origin.CGFloat y = v26;
      v50.size.CGFloat width = v27;
      v50.size.CGFloat height = v28;
      if (CGRectGetHeight(v50) == 1.79769313e308)
      {
LABEL_15:
        double v29 = sub_1BF8B6938(a1, a2);
        if (!v5) {
          return v29;
        }
      }
      else
      {
        v51.origin.CGFloat x = MinY;
        v51.origin.CGFloat y = v26;
        v51.size.CGFloat width = v27;
        v51.size.CGFloat height = v28;
        CGRectGetHeight(v51);
        v52.origin.CGFloat x = a2;
        v52.origin.CGFloat y = a3;
        v52.size.CGFloat width = a4;
        v52.size.CGFloat height = a5;
        CGRectGetHeight(v52);
LABEL_18:
        double MinY = a2;
LABEL_19:
        v53.origin.CGFloat x = a2;
        v53.origin.CGFloat y = a3;
        v53.size.CGFloat width = a4;
        v53.size.CGFloat height = a5;
        CGRectGetWidth(v53);
        v54.origin.CGFloat x = a2;
        v54.origin.CGFloat y = a3;
        v54.size.CGFloat width = a4;
        v54.size.CGFloat height = a5;
        CGRectGetHeight(v54);
      }
      return MinY;
    default:
      CGRectGetMinY(*(CGRect *)(a1 + 96));
      goto LABEL_18;
  }
}

uint64_t sub_1BF8B68AC@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v3 = *(unsigned char *)(v2 + 40);
  if (*(unsigned char *)(result + 440) == 1)
  {
    switch(*(unsigned char *)(v2 + 40))
    {
      case 1:
        if (*(unsigned char *)(result + 48)) {
          char v3 = 0;
        }
        break;
      case 2:
        if ((*(unsigned char *)(result + 48) & 1) == 0) {
          char v3 = 3;
        }
        break;
      case 3:
        if (!*(unsigned char *)(result + 48)) {
          char v3 = 2;
        }
        break;
      case 4:
      case 5:
      case 6:
        break;
      default:
        if (*(unsigned char *)(result + 48)) {
          char v3 = 1;
        }
        break;
    }
  }
  *a2 = v3;
  return result;
}

double sub_1BF8B6938(uint64_t a1, double a2)
{
  swift_beginAccess();
  if (*(void *)(a1 + 64))
  {
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v4 + 8) = 0;
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = 1;
    *(unsigned char *)(v4 + 24) = 7;
    swift_willThrow();
  }
  return a2;
}

uint64_t sub_1BF8B69F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8B6190(a1, a2, a3);
}

void *sub_1BF8B6A08@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  return sub_1BF8B625C(a1, a2, a3, a4, a5);
}

uint64_t sub_1BF8B6A24()
{
  if (*(unsigned char *)(v0 + 41) == 1) {
    sub_1BF8CBE78();
  }
  sub_1BF898570();
  sub_1BF8CBF48();
  sub_1BF8CBAC8();
  type metadata accessor for Positioning.Anchor();
  swift_getWitnessTable();
  sub_1BF8CC048();
  sub_1BF8CBAC8();
  return 0;
}

uint64_t sub_1BF8B6B78()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF8B6BB4()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8B6BF8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

void sub_1BF8B6C38(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  sub_1BF8B6428(a1, a2, a3, a4, v4 + 32, *(void *)(v4 + 80));
}

uint64_t sub_1BF8B6C5C@<X0>(unsigned char *a1@<X8>)
{
  if (qword_1EBA90300 != -1) {
    uint64_t result = swift_once();
  }
  char v2 = HIBYTE(word_1EBA8F7C8);
  *a1 = word_1EBA8F7C8;
  a1[1] = v2;
  return result;
}

uint64_t sub_1BF8B6CC4(char *a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, char a6)
{
  char v10 = *a1;
  uint64_t v11 = *a2;
  char v12 = *a3;
  type metadata accessor for Node();
  swift_retain();
  *(void *)(v6 + 56) = sub_1BF8CBBD8();
  *(void *)(v6 + 40) = v11;
  *(unsigned char *)(v6 + 48) = v12;
  uint64_t v13 = sub_1BF8CBBD8();
  swift_beginAccess();
  *(void *)(v6 + 56) = v13;
  swift_bridgeObjectRelease();
  *(void *)(v6 + 64) = a4;
  *(void *)(v6 + 72) = a5;
  *(unsigned char *)(v6 + 80) = a6;
  swift_bridgeObjectRetain();
  swift_release();
  char v15 = v10;
  return Node.init(kind:identifier:)(&v15, a4, a5);
}

uint64_t sub_1BF8B6DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v114 = a3;
  uint64_t v141 = a2;
  uint64_t v8 = *(void *)v5;
  uint64_t v9 = sub_1BF8CB978();
  uint64_t v109 = *(void *)(v9 - 8);
  uint64_t v110 = v9;
  MEMORY[0x1F4188790](v9);
  CGRect v108 = (char *)v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = a4;
  uint64_t v11 = *(void *)(v5 + 64);
  uint64_t v112 = *(void *)(v5 + 72);
  BOOL v113 = v11;
  char v12 = sub_1BF8991D8();
  uint64_t v116 = *(void *)(v5 + 40);
  v139[0] = v116;
  uint64_t v13 = *(void *)(v8 + 136);
  uint64_t v14 = *(void *)(v8 + 144);
  uint64_t v115 = type metadata accessor for Sizing();
  sub_1BF8C2410(v115, (uint64_t)v140);
  uint64_t v15 = v140[3];
  uint64_t v16 = v140[4];
  __swift_project_boxed_opaque_existential_1(v140, v140[3]);
  CGFloat v17 = *(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 8);
  uint64_t v117 = (void *)a1;
  uint64_t v118 = v13;
  uint64_t v18 = v119;
  uint64_t v19 = v17(a1, v141, v12, v13, v14, v15, v16);
  if (v18)
  {
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v140);
  }
  uint64_t v119 = v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v140);
  v139[0] = v116;
  sub_1BF8C2410(v115, (uint64_t)v140);
  uint64_t v20 = v140[3];
  uint64_t v21 = v140[4];
  __swift_project_boxed_opaque_existential_1(v140, v140[3]);
  CGFloat v22 = v117;
  (*(void (**)(void *__return_ptr, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))(v139, v117, v141, v12, v118, v14, v20, v21);
  uint64_t v24 = v139[0];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v140);
  v140[0] = v24;
  if (SizerResult.isAmbiguous.getter())
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_retain();
  }
  uint64_t v107 = 0;
  v140[0] = v24;
  v139[0] = v24;
  uint64_t v116 = v24;
  swift_retain();
  char v25 = SizerResult.nonIntegral.getter();
  sub_1BF8A9020(v25 & 1);
  OUTLINED_FUNCTION_5();
  uint64_t v105 = v24 & 0xFFFFFFFFFFFFFFFLL;
  swift_release();
  uint64_t v26 = v5;
  OUTLINED_FUNCTION_0();
  sub_1BF89D858(v27, v28, v29, v112);
  uint64_t v30 = (void *)(v5 + 56);
  int v106 = *(unsigned __int8 *)(v5 + 80);
  int v104 = v12;
  if (v106 == 1)
  {
    swift_beginAccess();
    v140[0] = *v30;
    type metadata accessor for Node();
    sub_1BF8CBC38();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    uint64_t v115 = sub_1BF8CBB18();
  }
  else
  {
    swift_beginAccess();
    uint64_t v115 = *v30;
    swift_bridgeObjectRetain();
  }
  uint64_t v31 = type metadata accessor for Cursor();
  memcpy(v140, v22 + 16, sizeof(v140));
  memcpy(v139, v22 + 16, sizeof(v139));
  uint64_t v32 = v22[41];
  uint64_t v33 = v22[42];
  char v34 = v22;
  uint64_t v35 = v22[43];
  uint64_t v36 = v34[44];
  uint64_t v37 = v34[45];
  uint64_t v38 = v34[46];
  uint64_t v39 = v34[47];
  uint64_t v40 = v34[48];
  uint64_t v41 = v34[49];
  uint64_t v42 = v34[50];
  uint64_t v43 = v34[51];
  uint64_t v45 = v34[52];
  uint64_t v44 = v34[53];
  uint64_t v46 = v34[54];
  uint64_t v102 = v33;
  uint64_t v103 = v32;
  uint64_t v125 = v32;
  uint64_t v126 = v33;
  uint64_t v127 = v35;
  uint64_t v128 = v36;
  uint64_t v100 = v37;
  uint64_t v101 = v36;
  uint64_t v129 = v37;
  uint64_t v130 = v38;
  uint64_t v98 = v39;
  uint64_t v99 = v38;
  uint64_t v131 = v39;
  uint64_t v132 = v40;
  uint64_t v96 = v41;
  uint64_t v97 = v40;
  uint64_t v133 = v41;
  uint64_t v134 = v42;
  uint64_t v94 = v43;
  uint64_t v95 = v42;
  uint64_t v135 = v43;
  uint64_t v136 = v45;
  uint64_t v92 = v44;
  uint64_t v93 = v45;
  uint64_t v137 = v44;
  uint64_t v138 = v46;
  uint64_t v91 = v46;
  v122[0] = *(unsigned char *)(v26 + 48);
  sub_1BF8C3F34((uint64_t)v34, &v124);
  char v123 = v124;
  uint64_t v47 = (uint64_t)(v34 + 68);
  sub_1BF8A0970((uint64_t)(v34 + 68), (uint64_t)v122);
  uint64_t v120 = v116;
  sub_1BF891FF4((uint64_t)v140);
  SizerResult.behavior.getter(v121);
  OUTLINED_FUNCTION_2_19();
  uint64_t v120 = 0x8000000000000000;
  char v88 = v106;
  OUTLINED_FUNCTION_0();
  uint64_t v118 = v31;
  uint64_t result = sub_1BF89FC40(v48, v49, v50, v51, 0, 0, 2, v52, &v120, v88);
  uint64_t v53 = v114 + 1;
  if (__OFADD__(v114, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v54 = result;
    uint64_t v55 = v111;
    uint64_t v56 = v107;
    uint64_t v57 = sub_1BF8B87F0(v26, v115, result, v141, v114 + 1, v111);
    if (v56)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return swift_release();
    }
    uint64_t v58 = v26;
    uint64_t v107 = v53;
    v90[1] = v54;
    uint64_t v59 = v116;
    v139[0] = v116;
    uint64_t v60 = v57;
    v143.origin.CGFloat x = Cursor.absoluteFrame.getter();
    SizerResult.postProcess(frame:nonIntegral:)(v143, 0);
    if (v61)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_release();
    }
    OUTLINED_FUNCTION_5();
    v90[0] = v60;
    sub_1BF8A3044();
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    v139[0] = v59;
    if ((SizerResult.shouldResize.getter() & 1) != 0
      || (v139[0] = v116, (SizerResult.shouldPostProcess.getter() & 1) != 0))
    {
      OUTLINED_FUNCTION_0_19();
      sub_1BF89E0F8(v70, v107);
      memcpy(v139, v140, sizeof(v139));
      uint64_t v125 = v103;
      uint64_t v126 = v102;
      uint64_t v127 = v35;
      uint64_t v128 = v101;
      uint64_t v129 = v100;
      uint64_t v130 = v99;
      uint64_t v131 = v98;
      uint64_t v132 = v97;
      uint64_t v133 = v96;
      uint64_t v134 = v95;
      uint64_t v135 = v94;
      uint64_t v136 = v93;
      uint64_t v137 = v92;
      uint64_t v138 = v91;
      v122[0] = *(unsigned char *)(v58 + 48);
      sub_1BF8C3F34((uint64_t)v117, &v124);
      char v123 = v124;
      sub_1BF8A0970(v47, (uint64_t)v122);
      uint64_t v71 = swift_allocObject();
      sub_1BF891FF4((uint64_t)v140);
      uint64_t v72 = v108;
      sub_1BF8CB968();
      uint64_t v73 = sub_1BF8CB958();
      uint64_t v75 = v74;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v72, v110);
      *(void *)(v71 + 16) = v73;
      *(void *)(v71 + 24) = v75;
      uint64_t v120 = v71;
      sub_1BF8B6C5C(v121);
      OUTLINED_FUNCTION_2_19();
      char v89 = v106;
      OUTLINED_FUNCTION_0_19();
      uint64_t v81 = sub_1BF89FC40(v76, v77, v78, v79, 0, 0, 2, v80, &v120, v89);
      sub_1BF8B87F0(v58, v115, v81, v141, v107, v55);
      uint64_t v107 = 0;
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      uint64_t v107 = 0;
      swift_bridgeObjectRelease();
    }
    LOBYTE(v125) = *(unsigned char *)(v90[0] + 48);
    v139[0] = v116;
    uint64_t v82 = (void *)SizerResult.metadata.getter();
    v144.origin.CGFloat x = v63;
    v144.origin.CGFloat y = v65;
    v144.size.CGFloat width = v67;
    v142.value._rawValue = v82;
    uint64_t v84 = v112;
    uint64_t v83 = v113;
    v142.is_nil = v113;
    v144.size.CGFloat height = v69;
    v85.value._uint64_t countAndFlagsBits = v112;
    LayoutContext.set(frame:direction:metadata:for:)(v144, (TeaTemplate::Direction)&v125, v142, v85);
    swift_bridgeObjectRelease();
    LOBYTE(v139[0]) = 2;
    OUTLINED_FUNCTION_0_19();
    sub_1BF89F124();
    OUTLINED_FUNCTION_0();
    sub_1BF89F278(v119);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_19();
    sub_1BF89D868(v86, v87, v83, v84);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return 0;
  }
  return result;
}

uint64_t sub_1BF8B76C0()
{
  uint64_t v0 = Node.deinit();
  sub_1BF88DB44(*(void *)(v0 + 40));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_1BF8B7700()
{
}

uint64_t sub_1BF8B7720(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 56);
  uint64_t v6 = type metadata accessor for Node();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BF8CBB88();
  for (i = v7; v7 != MEMORY[0x1C18B43C0](v5, v6); uint64_t v7 = i)
  {
    char v9 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v9)
    {
      uint64_t v10 = *(void *)(v5 + 32 + 8 * v7);
      swift_retain();
    }
    else
    {
      uint64_t v10 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](&i, v5, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 120))(a1, a2);
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8B78A8()
{
  return swift_endAccess();
}

uint64_t sub_1BF8B7948()
{
  return swift_retain();
}

uint64_t sub_1BF8B7A28(uint64_t result)
{
  if (*(unsigned char *)(v1 + 48) == 2) {
    *(unsigned char *)(v1 + 48) = *(unsigned char *)(result + 48);
  }
  return result;
}

uint64_t sub_1BF8B7A40(char *a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, char a6)
{
  return sub_1BF8B6CC4(a1, a2, a3, a4, a5, a6);
}

uint64_t HBox<A>(name:reversed:_:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_1BF8B7B0C(a1, a2, a3, a4, a5, a6, 0, (uint64_t (*)(void))sub_1BF8A5BC4);
}

uint64_t type metadata accessor for Box()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t VBox<A>(name:reversed:_:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_1BF8B7B0C(a1, a2, a3, a4, a5, a6, 1, (uint64_t (*)(void))sub_1BF8A5D38);
}

uint64_t sub_1BF8B7B0C(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, char a7, uint64_t (*a8)(void))
{
  unint64_t v13 = *a4;
  type metadata accessor for Box();
  unint64_t v18 = v13;
  char v17 = a7;
  sub_1BF8B33B8(&v16);
  sub_1BF88E13C(v13);
  swift_bridgeObjectRetain();
  sub_1BF8B7A40(&v16, (uint64_t *)&v18, &v17, a1, a2, a3);
  uint64_t v14 = a8();
  swift_release();
  return v14;
}

uint64_t sub_1BF8B7BF0()
{
  return swift_initClassMetadata2();
}

void sub_1BF8B7C60()
{
}

uint64_t sub_1BF8B7C90()
{
  sub_1BF88DB44(*(void *)(v0 + 40));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8B7CC8()
{
  uint64_t v0 = sub_1BF8B76C0();
  return MEMORY[0x1F4186488](v0, 81, 7);
}

uint64_t sub_1BF8B7CF8()
{
  if (*(unsigned char *)(v0 + 48) && *(unsigned char *)(v0 + 48) != 1) {
    sub_1BF8CBE78();
  }
  sub_1BF8CBAC8();
  type metadata accessor for Sizing();
  swift_getWitnessTable();
  sub_1BF8CC048();
  sub_1BF8CBAC8();
  return 0;
}

uint64_t sub_1BF8B7E40()
{
  return sub_1BF8B7CF8();
}

uint64_t sub_1BF8B7E64()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BF8B7E9C(const __CFAttributedString *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v8 = *v6;
  switch((unint64_t)*v6 >> 62)
  {
    case 1uLL:
      uint64_t v17 = v8 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v19 = *(void *)(v17 + 16);
      uint64_t v18 = *(void *)(v17 + 24);
      uint64_t v20 = *(void *)(a2 + 16);
      swift_retain();
      swift_bridgeObjectRetain();
      if (!v20) {
        goto LABEL_18;
      }
      swift_bridgeObjectRetain();
      LOBYTE(v6) = a2;
      unint64_t v21 = sub_1BF8999E0(v19, v18);
      if (v22)
      {
        CGFloat v23 = (void *)(*(void *)(a2 + 56) + 96 * v21);
        uint64_t v24 = (void *)v23[2];
        char v25 = (void *)v23[4];
        unint64_t v26 = v23[5];
        unint64_t v27 = v23[6];
        unint64_t v28 = v23[7];
        unint64_t v29 = v23[8];
        uint64_t v30 = (void *)v23[9];
        swift_retain();
        uint64_t v6 = v25;
        id v31 = v30;
        swift_bridgeObjectRetain();
        id v32 = v24;
        swift_bridgeObjectRelease_n();
        uint64_t v33 = v6;
        v34.n128_u64[0] = v26;
        v35.n128_u64[0] = v27;
        v36.n128_u64[0] = v28;
        v37.n128_u64[0] = v29;
        LOBYTE(v6) = sub_1BF8B7E9C(v33, a2, v34, v35, v36, v37);
        swift_release();

        swift_release();
        swift_bridgeObjectRelease();

        return v6 & 1;
      }
      swift_bridgeObjectRelease();
LABEL_18:
      sub_1BF891F44();
      swift_allocError();
      *(void *)uint64_t v52 = v19;
      *(void *)(v52 + 8) = v18;
      *(void *)(v52 + 16) = 0;
      *(unsigned char *)(v52 + 24) = 6;
      swift_willThrow();
      goto LABEL_19;
    case 2uLL:
      OUTLINED_FUNCTION_1_21();
      swift_retain();
      char v42 = OUTLINED_FUNCTION_0_30(v38, v39, v40, v41);
      if (v7) {
        goto LABEL_14;
      }
      if (v42) {
        goto LABEL_12;
      }
      swift_release();
      swift_release();
      LOBYTE(v6) = 0;
      return v6 & 1;
    case 3uLL:
      OUTLINED_FUNCTION_1_21();
      swift_retain();
      char v51 = OUTLINED_FUNCTION_0_30(v47, v48, v49, v50);
      if (v7)
      {
LABEL_14:
        swift_release();
LABEL_19:
        swift_release();
      }
      else if (v51)
      {
        swift_release();
        swift_release();
        LOBYTE(v6) = 1;
      }
      else
      {
LABEL_12:
        LOBYTE(v6) = OUTLINED_FUNCTION_0_30(v43, v44, v45, v46);
        swift_release();
        swift_release();
      }
      return v6 & 1;
    default:
      double v12 = *(double *)(v8 + 16);
      if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v12 <= -9.22337204e18)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (v12 >= 9.22337204e18)
      {
LABEL_30:
        __break(1u);
        JUMPOUT(0x1BF8B8230);
      }
      uint64_t v13 = *(unsigned __int8 *)(v8 + 24);
      uint64_t v14 = (uint64_t)v12;
      double v15 = a3;
      CGRectGetWidth(*(CGRect *)(&a4 - 1));
      uint64_t v16 = sub_1BF8B84D8(a1);
      switch(v13)
      {
        case 1:
          LOBYTE(v6) = v16 != v14;
          break;
        case 2:
          LOBYTE(v6) = v16 > v14;
          break;
        case 3:
          LOBYTE(v6) = v16 >= v14;
          break;
        case 4:
          LOBYTE(v6) = v16 < v14;
          break;
        case 5:
          LOBYTE(v6) = v16 <= v14;
          break;
        default:
          LOBYTE(v6) = v16 == v14;
          break;
      }
      return v6 & 1;
  }
}

BOOL static AltTextLogic.Operator.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AltTextLogic.Operator.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t AltTextLogic.Operator.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

unint64_t sub_1BF8B82F0()
{
  unint64_t result = qword_1EA1704E8;
  if (!qword_1EA1704E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1704E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AltTextLogic()
{
  return &type metadata for AltTextLogic;
}

uint64_t getEnumTagSinglePayload for AltTextLogic.Operator(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AltTextLogic.Operator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8B84A0);
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

ValueMetadata *type metadata accessor for AltTextLogic.Operator()
{
  return &type metadata for AltTextLogic.Operator;
}

uint64_t sub_1BF8B84D8(const __CFAttributedString *a1)
{
  int v2 = CTFramesetterCreateWithAttributedString(a1);
  Mutable = CGPathCreateMutable();
  sub_1BF8CBD28();
  v10.length = (CFIndex)[(__CFAttributedString *)a1 length];
  v10.location = 0;
  Frame = CTFramesetterCreateFrame(v2, v10, Mutable, 0);
  CFArrayRef v5 = CTFrameGetLines(Frame);
  unint64_t v6 = sub_1BF8CBB78();

  unint64_t v7 = sub_1BF8B8634(v6);
  swift_bridgeObjectRelease();
  if (v7)
  {
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1BF8CBFB8();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v8 = 0;
    Mutable = Frame;
  }

  return v8;
}

uint64_t sub_1BF8B8634(unint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4FBC860];
  uint64_t v2 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  while (1)
  {
    sub_1BF8CBED8();
    if (v2) {
      break;
    }
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      return v7;
    }
LABEL_6:
    for (uint64_t i = 4; ; ++i)
    {
      uint64_t v2 = i - 4;
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x1C18B4640](i - 4, a1);
      }
      else {
        swift_unknownObjectRetain();
      }
      uint64_t v5 = i - 3;
      if (__OFADD__(v2, 1)) {
        break;
      }
      type metadata accessor for CTLine(0);
      if (!swift_dynamicCastUnknownClass())
      {
        swift_unknownObjectRelease();
        swift_release();
        return 0;
      }
      sub_1BF8CBEA8();
      sub_1BF8CBEE8();
      sub_1BF8CBEF8();
      sub_1BF8CBEB8();
      if (v5 == v3) {
        return v7;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    sub_1BF8CBFB8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1BF8CBFB8();
  swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_6;
  }
  return v7;
}

uint64_t dispatch thunk of LayoutItemApplicable.register(source:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of LayoutItemApplicable.apply<A>(_:source:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of LayoutValueSource.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

char *sub_1BF8B87F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  CFRange v10 = (char *)a3;
  char v13 = sub_1BF8B8910(a3, a2, a4, a5, a6);
  if (!v6)
  {
    if (v13)
    {
      CFRange v10 = sub_1BF89FFC4();
      swift_retain();
      sub_1BF89DFC8(a1, a5);
      char v15 = sub_1BF8B8910((uint64_t)v10, a2, a4, a5, a6);
      swift_release();
      if (v15)
      {
        sub_1BF891F44();
        swift_allocError();
        *(void *)(v16 + 8) = 0;
        *(void *)(v16 + 16) = 0;
        *(void *)uint64_t v16 = 1;
        *(unsigned char *)(v16 + 24) = 7;
        swift_willThrow();
        swift_release();
      }
    }
    else
    {
      swift_retain();
    }
  }
  return v10;
}

uint64_t sub_1BF8B8910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = *(void *)(*(void *)a1 + 80);
  uint64_t v12 = type metadata accessor for Node();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1BF8CBB88();
  uint64_t v30 = v13;
  if (v13 == MEMORY[0x1C18B43C0](a2, v12))
  {
    swift_bridgeObjectRelease();
    char v14 = 0;
    return v14 & 1;
  }
  uint64_t v24 = a4;
  uint64_t v25 = a3;
  char v14 = 0;
  while (1)
  {
    uint64_t v15 = v11;
    char v16 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v16)
    {
      uint64_t v17 = *(void *)(a2 + 32 + 8 * v13);
      swift_retain();
    }
    else
    {
      uint64_t v17 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](&v30, a2, v12);
    swift_bridgeObjectRelease();
    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v17 + 128))(a1, v25, v24, a5);
    if (!v6)
    {
      uint64_t v21 = v18;
      swift_release();
      BOOL v22 = sub_1BF8C074C(v21);
      uint64_t v11 = v15;
      swift_release();
      v14 |= v22;
      goto LABEL_18;
    }
    id v19 = v6;
    sub_1BF8B8BD8();
    if (!swift_dynamicCast()) {
      goto LABEL_22;
    }
    if (!v29)
    {
      sub_1BF88E520(v27, (id)v28, *((uint64_t *)&v28 + 1), 0);
      swift_release();

      uint64_t v6 = 0;
      char v14 = 1;
      uint64_t v11 = v15;
      goto LABEL_18;
    }
    BOOL v20 = v29 == 7 && v27 == (void *)1;
    if (!v20 || v28 != 0) {
      break;
    }
    uint64_t v11 = v15;
    swift_release();

    uint64_t v6 = 0;
    char v14 = 1;
LABEL_18:
    uint64_t v13 = v30;
    if (v13 == MEMORY[0x1C18B43C0](a2, v12))
    {
      swift_bridgeObjectRelease();
      return v14 & 1;
    }
  }
  sub_1BF88E520(v27, (id)v28, *((uint64_t *)&v28 + 1), v29);
LABEL_22:
  swift_bridgeObjectRelease();

  swift_willThrow();
  swift_release();
  return v14 & 1;
}

unint64_t sub_1BF8B8BD8()
{
  unint64_t result = qword_1EBA8EF90;
  if (!qword_1EBA8EF90)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA8EF90);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClipToBoundsSizer()
{
  return &type metadata for ClipToBoundsSizer;
}

void *sub_1BF8B8C40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v10 = *a1;
  uint64_t v11 = v4[3];
  uint64_t v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v12 + 16))(&v16, a1, a2, a3, *(void *)(v10 + 80), *(void *)(v10 + 88), v11, v12);
  if (!v5)
  {
    uint64_t v14 = v16;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    *(void *)(v15 + 24) = sub_1BF8B8EC0;
    *(void *)(v15 + 32) = a1;
    *a4 = v15 | 0x6000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

void sub_1BF8B8D4C(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  v14.origin.CGFloat x = Cursor.absoluteFrame.getter();
  v14.origin.CGFloat y = v10;
  v14.size.CGFloat width = v11;
  v14.size.CGFloat height = v12;
  v13.origin.CGFloat x = a2;
  v13.origin.CGFloat y = a3;
  v13.size.CGFloat width = a4;
  v13.size.CGFloat height = a5;
  *(CGRect *)a1 = CGRectIntersection(v13, v14);
  *(unsigned char *)(a1 + 32) = 1;
}

void *sub_1BF8B8DC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8B8C40(a1, a2, a3, a4);
}

uint64_t sub_1BF8B8DE0()
{
  return 0;
}

uint64_t sub_1BF8B8E7C()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BF8B8EC0(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
}

uint64_t sub_1BF8B8EC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  void (*v12)(unint64_t *__return_ptr, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(unint64_t *__return_ptr, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  uint64_t v5 = v4;
  uint64_t v9 = *a1;
  uint64_t v10 = v5[3];
  uint64_t v11 = v5[4];
  BOOL v20 = v5;
  __swift_project_boxed_opaque_existential_1(v5, v10);
  LOBYTE(v23) = 0;
  sub_1BF8A5AA0(&v23, (uint64_t)a1, (uint64_t)&v25);
  LOBYTE(v23) = v25;
  uint64_t v24 = v26;
  CGFloat v12 = *(void (**)(unint64_t *__return_ptr, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16);
  CGRect v13 = *(void *)(v9 + 80);
  CGRect v14 = *(void *)(v9 + 88);
  swift_retain();
  v12(&v27, &v23, a2, a3, v13, v14, v10, v11);
  unint64_t result = swift_release();
  if (!v21)
  {
    BOOL v22 = v27;
    uint64_t v16 = v20[8];
    uint64_t v17 = v20[9];
    __swift_project_boxed_opaque_existential_1(v20 + 5, v16);
    LOBYTE(v23) = 1;
    sub_1BF8A5AA0(&v23, (uint64_t)a1, (uint64_t)&v25);
    LOBYTE(v23) = v25;
    uint64_t v24 = v26;
    uint64_t v18 = *(void (**)(unint64_t *__return_ptr, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16);
    swift_retain();
    v18(&v27, &v23, a2, a3, v13, v14, v16, v17);
    swift_release();
    uint64_t v25 = v22;
    CGFloat v23 = v27;
    sub_1BF8B90B8(&v25, &v23, a4);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BF8B90B8@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5 = *a1;
  unint64_t v6 = *a2;
  sub_1BF8B9E78();
  unint64_t v7 = v5 >> 61;
  if (v5 >> 61 == 1) {
    goto LABEL_6;
  }
  unint64_t v8 = v6 >> 61;
  if (v7)
  {
    if (v8 != 1)
    {
      if (v7 == 4)
      {
        unint64_t v5 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      }
      else
      {
        if (v8 != 4)
        {
          if (v7 == 5)
          {
            unint64_t v20 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
            uint64_t v21 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
            uint64_t v22 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
            unint64_t v55 = v6;
            unint64_t v56 = v20;
            swift_retain();
            swift_retain();
            sub_1BF8B90B8(&v57, &v56, &v55);
            unint64_t v23 = v57;
            uint64_t v24 = swift_allocObject();
            *(void *)(v24 + 16) = v23;
            uint64_t v25 = swift_allocObject();
            *(void *)(v25 + 16) = v21;
            *(void *)(v25 + 24) = v22;
            unint64_t v26 = sub_1BF8B9FD8;
          }
          else
          {
            if (v8 != 5)
            {
              if (v7 == 6)
              {
                uint64_t v30 = v5 & 0x1FFFFFFFFFFFFFFFLL;
                unint64_t v31 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
                uint64_t v32 = *(void *)(v30 + 24);
                uint64_t v33 = *(void *)(v30 + 32);
                uint64_t v34 = swift_allocObject();
                unint64_t v56 = v6;
                unint64_t v57 = v31;
                swift_retain();
                swift_retain();
                sub_1BF8B90B8((void *)(v34 + 16), &v57, &v56);
                uint64_t v35 = swift_allocObject();
                *(void *)(v35 + 16) = v32;
                *(void *)(v35 + 24) = v33;
                __n128 v36 = sub_1BF8B9FB0;
              }
              else
              {
                if (v8 != 6)
                {
                  if (v7 == 3)
                  {
                    unint64_t v5 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
                  }
                  else
                  {
                    if (v8 != 3)
                    {
                      if (v7 == 2)
                      {
                        uint64_t v41 = v5 & 0x1FFFFFFFFFFFFFFFLL;
                        unint64_t v42 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
                        uint64_t v43 = *(void *)((v5 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
                        char v44 = *(unsigned char *)(v41 + 32);
                        unint64_t v55 = v6;
                        unint64_t v56 = v42;
                        swift_retain();
                        swift_retain();
                        swift_retain();
                        sub_1BF8B90B8(&v57, &v56, &v55);
                        unint64_t v45 = v57;
                        uint64_t v46 = swift_allocObject();
                        *(void *)(v46 + 16) = v45;
                        sub_1BF8A515C();
                        uint64_t v47 = swift_allocObject();
                        *(_OWORD *)(v47 + 16) = xmmword_1BF8CD2F0;
                        *(void *)(v47 + 32) = v43;
                        *(unsigned char *)(v47 + 40) = v44;
                        swift_release();
                        swift_release();
                        uint64_t v48 = MEMORY[0x1E4FBC860];
                        *(void *)(v46 + 24) = v47;
                        *(void *)(v46 + 32) = v48;
                      }
                      else
                      {
LABEL_30:
                        if (v8 != 2)
                        {
                          swift_retain();
                          sub_1BF8CC068();
                          __break(1u);
                          JUMPOUT(0x1BF8B96E4);
                        }
                        uint64_t v49 = v6 & 0x1FFFFFFFFFFFFFFFLL;
                        unint64_t v50 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
                        uint64_t v51 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
                        char v52 = *(unsigned char *)(v49 + 32);
                        unint64_t v55 = v50;
                        unint64_t v56 = v5;
                        swift_retain();
                        swift_retain();
                        swift_retain();
                        sub_1BF8B90B8(&v57, &v56, &v55);
                        unint64_t v53 = v57;
                        uint64_t v46 = swift_allocObject();
                        *(void *)(v46 + 16) = v53;
                        sub_1BF8A515C();
                        uint64_t v54 = swift_allocObject();
                        *(_OWORD *)(v54 + 16) = xmmword_1BF8CD2F0;
                        *(void *)(v54 + 32) = v51;
                        *(unsigned char *)(v54 + 40) = v52;
                        swift_release();
                        swift_release();
                        *(void *)(v46 + 24) = MEMORY[0x1E4FBC860];
                        *(void *)(v46 + 32) = v54;
                      }
                      swift_release();
                      uint64_t result = v46 | 0x4000000000000000;
                      goto LABEL_33;
                    }
LABEL_8:
                    unint64_t v6 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
                  }
                  swift_retain();
                  swift_retain();
                  uint64_t v18 = swift_allocObject();
                  unint64_t v56 = v6;
                  unint64_t v57 = v5;
                  sub_1BF8B90B8((void *)(v18 + 16), &v57, &v56);
                  swift_release();
                  swift_release();
                  uint64_t result = v18 | 0x5000000000000000;
                  goto LABEL_33;
                }
LABEL_23:
                uint64_t v37 = v6 & 0x1FFFFFFFFFFFFFFFLL;
                unint64_t v38 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
                uint64_t v39 = *(void *)(v37 + 24);
                uint64_t v40 = *(void *)(v37 + 32);
                uint64_t v34 = swift_allocObject();
                unint64_t v56 = v38;
                unint64_t v57 = v5;
                swift_retain();
                swift_retain();
                sub_1BF8B90B8((void *)(v34 + 16), &v57, &v56);
                uint64_t v35 = swift_allocObject();
                *(void *)(v35 + 16) = v39;
                *(void *)(v35 + 24) = v40;
                __n128 v36 = sub_1BF8B9F5C;
              }
              *(void *)(v34 + 24) = v36;
              *(void *)(v34 + 32) = v35;
              swift_release();
              uint64_t result = v34 | 0x7000000000000000;
              goto LABEL_33;
            }
LABEL_18:
            uint64_t v27 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
            uint64_t v28 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
            unint64_t v55 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
            unint64_t v56 = v5;
            swift_retain();
            swift_retain();
            sub_1BF8B90B8(&v57, &v56, &v55);
            unint64_t v29 = v57;
            uint64_t v24 = swift_allocObject();
            *(void *)(v24 + 16) = v29;
            uint64_t v25 = swift_allocObject();
            *(void *)(v25 + 16) = v27;
            *(void *)(v25 + 24) = v28;
            unint64_t v26 = sub_1BF8B9FD0;
          }
          *(void *)(v24 + 24) = v26;
          *(void *)(v24 + 32) = v25;
          swift_release();
          uint64_t result = v24 | 0x6000000000000000;
          goto LABEL_33;
        }
LABEL_13:
        unint64_t v6 = *(void *)((v6 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      }
      swift_retain();
      swift_retain();
      uint64_t v19 = swift_allocObject();
      unint64_t v56 = v6;
      unint64_t v57 = v5;
      sub_1BF8B90B8((void *)(v19 + 16), &v57, &v56);
      swift_release();
      swift_release();
      uint64_t result = v19 | 0x3000000000000000;
      goto LABEL_33;
    }
LABEL_6:
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 40) = &type metadata for DimensionWiseSizer;
    *(void *)(v16 + 48) = &off_1F1B09638;
    uint64_t v17 = swift_allocObject();
    *(void *)(v16 + 16) = v17;
    sub_1BF8BA058(v3, v17 + 16);
    uint64_t result = v16 | 0x2000000000000000;
    goto LABEL_33;
  }
  if (v8)
  {
    switch((int)v8)
    {
      case 1:
        goto LABEL_6;
      case 3:
        goto LABEL_8;
      case 4:
        goto LABEL_13;
      case 5:
        goto LABEL_18;
      case 6:
        goto LABEL_23;
      default:
        goto LABEL_30;
    }
  }
  char v9 = *(unsigned char *)(v5 + 32);
  uint64_t v11 = *(void *)(v5 + 16);
  uint64_t v10 = *(void *)(v5 + 24);
  uint64_t v12 = *(void *)(v6 + 16);
  uint64_t v13 = *(void *)(v6 + 24);
  char v14 = *(unsigned char *)(v6 + 32);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v11;
  *(void *)(result + 24) = v12;
  *(void *)(result + 32) = v10;
  *(void *)(result + 40) = v13;
  *(unsigned char *)(result + 48) = v9;
  *(unsigned char *)(result + 49) = v14;
LABEL_33:
  *a3 = result;
  return result;
}

void sub_1BF8B96FC(void (*a1)(void *__return_ptr, void *)@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a3);
  v23.origin.CGFloat x = a3;
  v23.origin.CGFloat y = a4;
  v23.size.CGFloat width = a5;
  v23.size.CGFloat height = a6;
  *(CGFloat *)unint64_t v20 = MinX;
  v20[1] = CGRectGetWidth(v23);
  a1(v21, v20);
  uint64_t v14 = v21[0];
  uint64_t v13 = v21[1];
  if (v22)
  {
    if (v22 == 1)
    {
      v24.origin.CGFloat x = a3;
      v24.origin.CGFloat y = a4;
      v24.size.CGFloat width = a5;
      v24.size.CGFloat height = a6;
      CGFloat MinY = CGRectGetMinY(v24);
      v25.origin.CGFloat x = a3;
      v25.origin.CGFloat y = a4;
      v25.size.CGFloat width = a5;
      v25.size.CGFloat height = a6;
      CGFloat Height = CGRectGetHeight(v25);
      *(void *)a2 = v14;
      *(CGFloat *)(a2 + 8) = MinY;
      *(void *)(a2 + 16) = v13;
      *(CGFloat *)(a2 + 24) = Height;
      char v17 = 1;
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      char v17 = 2;
    }
    *(unsigned char *)(a2 + 32) = v17;
  }
  else
  {
    v26.origin.CGFloat x = a3;
    v26.origin.CGFloat y = a4;
    v26.size.CGFloat width = a5;
    v26.size.CGFloat height = a6;
    CGFloat v18 = CGRectGetMinY(v26);
    v27.origin.CGFloat x = a3;
    v27.origin.CGFloat y = a4;
    v27.size.CGFloat width = a5;
    v27.size.CGFloat height = a6;
    CGFloat v19 = CGRectGetHeight(v27);
    *(void *)a2 = v14;
    *(CGFloat *)(a2 + 8) = v18;
    *(void *)(a2 + 16) = v13;
    *(CGFloat *)(a2 + 24) = v19;
    *(unsigned char *)(a2 + 32) = 0;
  }
}

void sub_1BF8B9838(void (*a1)(void *__return_ptr, void *)@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  CGFloat MinY = CGRectGetMinY(*(CGRect *)&a3);
  v23.origin.CGFloat x = a3;
  v23.origin.CGFloat y = a4;
  v23.size.CGFloat width = a5;
  v23.size.CGFloat height = a6;
  *(CGFloat *)unint64_t v20 = MinY;
  v20[1] = CGRectGetHeight(v23);
  a1(v21, v20);
  uint64_t v14 = v21[0];
  uint64_t v13 = v21[1];
  if (v22)
  {
    if (v22 == 1)
    {
      v24.origin.CGFloat x = a3;
      v24.origin.CGFloat y = a4;
      v24.size.CGFloat width = a5;
      v24.size.CGFloat height = a6;
      CGFloat MinX = CGRectGetMinX(v24);
      v25.origin.CGFloat x = a3;
      v25.origin.CGFloat y = a4;
      v25.size.CGFloat width = a5;
      v25.size.CGFloat height = a6;
      CGFloat Width = CGRectGetWidth(v25);
      *(CGFloat *)a2 = MinX;
      *(void *)(a2 + 8) = v14;
      *(CGFloat *)(a2 + 16) = Width;
      *(void *)(a2 + 24) = v13;
      char v17 = 1;
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      char v17 = 2;
    }
    *(unsigned char *)(a2 + 32) = v17;
  }
  else
  {
    v26.origin.CGFloat x = a3;
    v26.origin.CGFloat y = a4;
    v26.size.CGFloat width = a5;
    v26.size.CGFloat height = a6;
    CGFloat v18 = CGRectGetMinX(v26);
    v27.origin.CGFloat x = a3;
    v27.origin.CGFloat y = a4;
    v27.size.CGFloat width = a5;
    v27.size.CGFloat height = a6;
    CGFloat v19 = CGRectGetWidth(v27);
    *(CGFloat *)a2 = v18;
    *(void *)(a2 + 8) = v14;
    *(CGFloat *)(a2 + 16) = v19;
    *(void *)(a2 + 24) = v13;
    *(unsigned char *)(a2 + 32) = 0;
  }
}

double sub_1BF8B9974(void (*a1)(double *__return_ptr, void *), CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a2);
  v15.origin.CGFloat x = a2;
  v15.origin.CGFloat y = a3;
  v15.size.CGFloat width = a4;
  v15.size.CGFloat height = a5;
  *(double *)uint64_t v13 = MinX;
  v13[1] = CGRectGetWidth(v15);
  a1(&v14, v13);
  if (!v5)
  {
    double MinX = v14;
    v16.origin.CGFloat x = a2;
    v16.origin.CGFloat y = a3;
    v16.size.CGFloat width = a4;
    v16.size.CGFloat height = a5;
    CGRectGetMinY(v16);
    v17.origin.CGFloat x = a2;
    v17.origin.CGFloat y = a3;
    v17.size.CGFloat width = a4;
    v17.size.CGFloat height = a5;
    CGRectGetHeight(v17);
  }
  return MinX;
}

double sub_1BF8B9A60(void (*a1)(uint64_t *__return_ptr, void *), CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a2);
  v15.origin.CGFloat x = a2;
  v15.origin.CGFloat y = a3;
  v15.size.CGFloat width = a4;
  v15.size.CGFloat height = a5;
  CGRectGetWidth(v15);
  v16.origin.CGFloat x = a2;
  v16.origin.CGFloat y = a3;
  v16.size.CGFloat width = a4;
  v16.size.CGFloat height = a5;
  CGFloat MinY = CGRectGetMinY(v16);
  v17.origin.CGFloat x = a2;
  v17.origin.CGFloat y = a3;
  v17.size.CGFloat width = a4;
  v17.size.CGFloat height = a5;
  *(CGFloat *)uint64_t v13 = MinY;
  v13[1] = CGRectGetHeight(v17);
  a1(&v14, v13);
  return MinX;
}

uint64_t sub_1BF8B9B40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8B8EC8(a1, a2, a3, a4);
}

uint64_t sub_1BF8B9B58()
{
  return 0;
}

uint64_t destroy for DimensionWiseSizer(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t initializeWithCopy for DimensionWiseSizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for DimensionWiseSizer(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for DimensionWiseSizer(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for DimensionWiseSizer(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DimensionWiseSizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for DimensionWiseSizer()
{
  return &type metadata for DimensionWiseSizer;
}

void sub_1BF8B9E78()
{
  if (!qword_1EBA8F920[0])
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, qword_1EBA8F920);
    }
  }
}

uint64_t sub_1BF8B9ED0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8B9F1C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

double sub_1BF8B9F5C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF8B9A60(*(void (**)(uint64_t *__return_ptr, void *))(v4 + 16), a1, a2, a3, a4);
}

uint64_t sub_1BF8B9F78()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

double sub_1BF8B9FB0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF8B9974(*(void (**)(double *__return_ptr, void *))(v4 + 16), a1, a2, a3, a4);
}

void sub_1BF8B9FD0(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_1BF8B9838(*(void (**)(void *__return_ptr, void *))(v5 + 16), a1, a2, a3, a4, a5);
}

void sub_1BF8B9FD8(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_1BF8B96FC(*(void (**)(void *__return_ptr, void *))(v5 + 16), a1, a2, a3, a4, a5);
}

uint64_t sub_1BF8B9FE0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8BA018()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1BF8BA058(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF8BA090()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

ValueMetadata *type metadata accessor for NotCondition()
{
  return &type metadata for NotCondition;
}

BOOL sub_1BF8BA0BC(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *a1;
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  return ((*(uint64_t (**)(uint64_t *, uint64_t, void, void, uint64_t, uint64_t))(v7 + 8))(a1, a2, *(void *)(v5 + 80), *(void *)(v5 + 88), v6, v7) & 1) == 0;
}

double sub_1BF8BA160@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16) && (uint64_t v4 = sub_1BF899A58(), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(a1 + 56) + 32 * v4;
    sub_1BF8A9B48(v6, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_1BF8BA1C4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1BF8999E0(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1BF8A9B48(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_1BF8BA228(uint64_t a1, char a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 32) = MEMORY[0x1E4FBC860];
  *(void *)(result + 16) = a1;
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

uint64_t sub_1BF8BA27C()
{
  sub_1BF8BB8E4();
  sub_1BF8BB944();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1BF8CBAF8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8BA350()
{
  return sub_1BF8CC228();
}

uint64_t sub_1BF8BA3B4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if ((*(unsigned char *)(v0 + 24) & 1) == 0)
  {
    uint64_t v7 = sub_1BF8CC218();
    sub_1BF8BA1C4(v7, v8, v1, &v21);
    swift_bridgeObjectRelease();
    sub_1BF8BB808((uint64_t)&v21, (uint64_t)&v19);
    if (v20)
    {
      sub_1BF8A4100(0, &qword_1EBA8F908);
      if (swift_dynamicCast())
      {
        if (*((void *)&v13 + 1))
        {
          sub_1BF8985E0(&v12, (uint64_t)v16);
          uint64_t v9 = v17;
          uint64_t v10 = v18;
          __swift_project_boxed_opaque_existential_1(v16, v17);
          (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v10 + 8))(&v12, v9, v10);
          sub_1BF8A2C10((uint64_t)&v21);
          char v6 = *((void *)&v13 + 1) != 0;
          sub_1BF8A2C10((uint64_t)&v12);
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v14 = 0;
        long long v12 = 0u;
        long long v13 = 0u;
      }
    }
    else
    {
      sub_1BF8A2C10((uint64_t)&v19);
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v14 = 0;
    }
    sub_1BF8A2C10((uint64_t)&v21);
    sub_1BF8BB86C((uint64_t)&v12, &qword_1EA1704F0, &qword_1EBA8F908);
LABEL_14:
    char v6 = 0;
    return v6 & 1;
  }
  uint64_t v2 = sub_1BF8CC218();
  sub_1BF8BA1C4(v2, v3, v1, &v21);
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_14;
  }
  sub_1BF8AA094(&v21, &v19);
  sub_1BF8A9B48((uint64_t)&v19, (uint64_t)v15);
  sub_1BF8A4100(0, &qword_1EA1704F8);
  if (!swift_dynamicCast())
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
    sub_1BF8BB86C((uint64_t)&v12, &qword_1EA170500, &qword_1EA1704F8);
    char v6 = 1;
    return v6 & 1;
  }
  sub_1BF8985E0(&v12, (uint64_t)v16);
  uint64_t v4 = v17;
  uint64_t v5 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
  char v6 = v4 ^ 1;
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v6 & 1;
}

BOOL sub_1BF8BA65C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if ((*(unsigned char *)(v0 + 24) & 1) == 0)
  {
    uint64_t v5 = sub_1BF8CC218();
    sub_1BF8BA1C4(v5, v6, v1, v17);
    swift_bridgeObjectRelease();
    sub_1BF8BB808((uint64_t)v17, (uint64_t)v10);
    if (v10[3])
    {
      sub_1BF8A4100(0, &qword_1EBA8F908);
      if (swift_dynamicCast())
      {
        if (*((void *)&v12 + 1))
        {
          sub_1BF8985E0(&v11, (uint64_t)&v14);
          uint64_t v7 = v15;
          uint64_t v8 = v16;
          __swift_project_boxed_opaque_existential_1(&v14, v15);
          (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v8 + 8))(&v11, v7, v8);
          sub_1BF8A2C10((uint64_t)v17);
          BOOL v4 = *((void *)&v12 + 1) == 0;
          sub_1BF8A2C10((uint64_t)&v11);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
          return v4;
        }
      }
      else
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
      }
    }
    else
    {
      sub_1BF8A2C10((uint64_t)v10);
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v13 = 0;
    }
    sub_1BF8A2C10((uint64_t)v17);
    sub_1BF8BB86C((uint64_t)&v11, &qword_1EA1704F0, &qword_1EBA8F908);
    return 0;
  }
  uint64_t v2 = sub_1BF8CC218();
  sub_1BF8BA1C4(v2, v3, v1, &v14);
  swift_bridgeObjectRelease();
  BOOL v4 = v15 == 0;
  sub_1BF8A2C10((uint64_t)&v14);
  return v4;
}

uint64_t sub_1BF8BA83C()
{
  sub_1BF8BA880(MEMORY[0x1E4FBB390], MEMORY[0x1E4FBB390], (uint64_t)&v3);
  if (!v0) {
    char v1 = v3;
  }
  return v1 & 1;
}

uint64_t sub_1BF8BA880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v32 = a3;
  uint64_t v5 = sub_1BF8CBD98();
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = *(void *)(v3 + 16);
  char v12 = *(unsigned char *)(v3 + 24);
  uint64_t v13 = sub_1BF8CC218();
  if ((v12 & 1) == 0)
  {
    sub_1BF8BA1C4(v13, v14, v11, &v41);
    swift_bridgeObjectRelease();
    if (v42)
    {
      sub_1BF8AA094(&v41, v40);
      sub_1BF8A9B48((uint64_t)v40, (uint64_t)v36);
      sub_1BF8A4100(0, &qword_1EBA8F908);
      if (swift_dynamicCast())
      {
        sub_1BF8985E0(v34, (uint64_t)&v37);
        uint64_t v16 = v38;
        uint64_t v17 = v39;
        __swift_project_boxed_opaque_existential_1(&v37, v38);
        (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v17 + 8))(v34, v16, v17);
        sub_1BF8A6644();
        if (swift_dynamicCast())
        {
          __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, a2);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a2 - 8) + 32))(v32, v10, a2);
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, a2);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v5);
        sub_1BF8B0000();
        swift_allocError();
        uint64_t v26 = v25;
        uint64_t v27 = v38;
        uint64_t v28 = v39;
        __swift_project_boxed_opaque_existential_1(&v37, v38);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
        *(void *)(v26 + 32) = sub_1BF8CC238();
        *(void *)(v26 + 40) = v29;
        *(unsigned char *)(v26 + 48) = 0;
        swift_willThrow();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
        uint64_t v22 = &v37;
      }
      else
      {
        uint64_t v35 = 0;
        memset(v34, 0, sizeof(v34));
        sub_1BF8BB86C((uint64_t)v34, &qword_1EA1704F0, &qword_1EBA8F908);
        sub_1BF8B0000();
        swift_allocError();
        uint64_t v24 = v23;
        sub_1BF8A9B48((uint64_t)v40, v23);
        *(unsigned char *)(v24 + 48) = 1;
        swift_willThrow();
        uint64_t v22 = v40;
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    }
LABEL_9:
    sub_1BF8B0000();
    swift_allocError();
    *(void *)uint64_t v18 = 1;
    *(_OWORD *)(v18 + 8) = 0u;
    *(_OWORD *)(v18 + 24) = 0u;
    *(void *)(v18 + 40) = 0;
    *(unsigned char *)(v18 + 48) = 2;
    return swift_willThrow();
  }
  sub_1BF8BA1C4(v13, v14, v11, &v37);
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_9;
  }
  sub_1BF8AA094(&v37, v34);
  sub_1BF8A9B48((uint64_t)v34, (uint64_t)&v41);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a2 - 8) + 32))(v32, v8, a2);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, a2);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v5);
  sub_1BF8B0000();
  swift_allocError();
  uint64_t v20 = v19;
  sub_1BF8A9B48((uint64_t)v34, v19);
  *(void *)(v20 + 32) = sub_1BF8CC238();
  *(void *)(v20 + 40) = v21;
  *(unsigned char *)(v20 + 48) = 0;
  swift_willThrow();
  uint64_t v22 = v34;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
}

uint64_t sub_1BF8BADC0()
{
  uint64_t result = sub_1BF8BA880(MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB1A0], (uint64_t)&v2);
  if (!v0) {
    return v2;
  }
  return result;
}

double sub_1BF8BAE00()
{
  sub_1BF8BA880(MEMORY[0x1E4FBB3D0], MEMORY[0x1E4FBB3D0], (uint64_t)&v2);
  if (!v0) {
    return v2;
  }
  return result;
}

float sub_1BF8BAE40()
{
  sub_1BF8BA880(MEMORY[0x1E4FBB470], MEMORY[0x1E4FBB470], (uint64_t)&v2);
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1BF8BAE80()
{
  OUTLINED_FUNCTION_1_22();
  uint64_t result = sub_1BF8BA880(v1, v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t sub_1BF8BAEB8()
{
  OUTLINED_FUNCTION_1_22();
  uint64_t result = sub_1BF8BA880(v1, v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t sub_1BF8BAEF0()
{
  OUTLINED_FUNCTION_1_22();
  uint64_t result = sub_1BF8BA880(v1, v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t sub_1BF8BAF28()
{
  OUTLINED_FUNCTION_1_22();
  uint64_t result = sub_1BF8BA880(v1, v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t sub_1BF8BAF60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1BF8BA880(a1, a2, a3);
}

uint64_t sub_1BF8BAF78()
{
  sub_1BF8B0000();
  uint64_t v0 = swift_allocError();
  return OUTLINED_FUNCTION_0_31(v0, v1);
}

uint64_t sub_1BF8BAFB8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8BAFE0()
{
  sub_1BF8BAFB8();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1BF8BB014()
{
  return sub_1BF8BA27C();
}

uint64_t sub_1BF8BB038()
{
  return sub_1BF8BA3B4() & 1;
}

BOOL sub_1BF8BB060()
{
  return sub_1BF8BA65C();
}

uint64_t sub_1BF8BB088()
{
  return sub_1BF8BA83C() & 1;
}

uint64_t sub_1BF8BB0B0()
{
  return sub_1BF8BADC0();
}

double sub_1BF8BB0D4()
{
  return sub_1BF8BAE00();
}

float sub_1BF8BB0F8()
{
  return sub_1BF8BAE40();
}

uint64_t sub_1BF8BB11C()
{
  return sub_1BF8BAF28();
}

uint64_t sub_1BF8BB148()
{
  return sub_1BF8BAE80();
}

uint64_t sub_1BF8BB174()
{
  return sub_1BF8BAEB8();
}

uint64_t sub_1BF8BB1A0()
{
  return sub_1BF8BAEF0();
}

uint64_t sub_1BF8BB1CC()
{
  return sub_1BF8BAF28();
}

uint64_t sub_1BF8BB1F8()
{
  return sub_1BF8CC118();
}

uint64_t sub_1BF8BB210()
{
  return sub_1BF8BAF28();
}

uint64_t sub_1BF8BB23C()
{
  return sub_1BF8BAE80();
}

uint64_t sub_1BF8BB268()
{
  return sub_1BF8BAEB8();
}

uint64_t sub_1BF8BB294()
{
  return sub_1BF8BAEF0();
}

uint64_t sub_1BF8BB2C0()
{
  return sub_1BF8BAF28();
}

uint64_t sub_1BF8BB2EC()
{
  return sub_1BF8CC128();
}

uint64_t sub_1BF8BB304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1BF8BAF60(a1, a2, a3);
}

uint64_t sub_1BF8BB328()
{
  return sub_1BF8CC0A8();
}

uint64_t sub_1BF8BB340()
{
  return sub_1BF8CC098();
}

uint64_t sub_1BF8BB358()
{
  uint64_t result = sub_1BF8CC0B8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1BF8BB37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB5A8(a1, a2, a3, MEMORY[0x1E4FBBF60]);
}

uint64_t sub_1BF8BB3A8()
{
  uint64_t result = sub_1BF8CC0C8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1BF8BB3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB4F0(a1, a2, a3, MEMORY[0x1E4FBBF78]);
}

uint64_t sub_1BF8BB3F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB54C(a1, a2, a3, MEMORY[0x1E4FBBF80]);
}

uint64_t sub_1BF8BB424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB5A8(a1, a2, a3, MEMORY[0x1E4FBBF88]);
}

uint64_t sub_1BF8BB450()
{
  uint64_t result = sub_1BF8CC0F8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1BF8BB474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB630(a1, a2, a3, MEMORY[0x1E4FBBFA0]);
}

uint64_t sub_1BF8BB4A0()
{
  uint64_t result = sub_1BF8CC0D8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1BF8BB4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB4F0(a1, a2, a3, MEMORY[0x1E4FBBF98]);
}

uint64_t sub_1BF8BB4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_1BF8BB520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB54C(a1, a2, a3, MEMORY[0x1E4FBBFA8]);
}

uint64_t sub_1BF8BB54C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_1BF8BB57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB5A8(a1, a2, a3, MEMORY[0x1E4FBBFB0]);
}

uint64_t sub_1BF8BB5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_1BF8BB5E0()
{
  uint64_t result = sub_1BF8CC108();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1BF8BB604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8BB630(a1, a2, a3, MEMORY[0x1E4FBBFC0]);
}

uint64_t sub_1BF8BB630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_1BF8BB65C()
{
  return sub_1BF8CC0E8();
}

uint64_t sub_1BF8BB688()
{
  return sub_1BF8BAF78();
}

BOOL sub_1BF8BB6A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, *(void *)(a1 + 16));
  if (EnumTagSinglePayload != 1) {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  return EnumTagSinglePayload == 1;
}

uint64_t sub_1BF8BB798()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LayoutKeyedDecodingContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8BB800(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_1BF8BB808(uint64_t a1, uint64_t a2)
{
  sub_1BF8A6644();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF8BB86C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1BF8B0718(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1BF8BB8C8()
{
  return sub_1BF8BA350();
}

void sub_1BF8BB8E4()
{
  if (!qword_1EA170508)
  {
    unint64_t v0 = sub_1BF8CBA08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA170508);
    }
  }
}

unint64_t sub_1BF8BB944()
{
  unint64_t result = qword_1EA170510;
  if (!qword_1EA170510)
  {
    sub_1BF8BB8E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170510);
  }
  return result;
}

TeaTemplate::CursorFrameKind_optional __swiftcall CursorFrameKind.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BF8CBFF8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CursorFrameKind.rawValue.getter()
{
  uint64_t result = 0x656D617266;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6563617073;
      break;
    case 2:
      uint64_t result = 7892834;
      break;
    case 3:
      uint64_t result = 0x6465626D65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8BBA64(unsigned __int8 *a1, char *a2)
{
  return sub_1BF896B68(*a1, *a2);
}

unint64_t sub_1BF8BBA74()
{
  unint64_t result = qword_1EA170518;
  if (!qword_1EA170518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA170518);
  }
  return result;
}

uint64_t sub_1BF8BBAC0()
{
  return sub_1BF8C6DB4(*v0);
}

uint64_t sub_1BF8BBAC8()
{
  return sub_1BF8C7124();
}

uint64_t sub_1BF8BBAD0(uint64_t a1)
{
  return sub_1BF8C71BC(a1, *v1);
}

TeaTemplate::CursorFrameKind_optional sub_1BF8BBAD8(Swift::String *a1)
{
  return CursorFrameKind.init(rawValue:)(*a1);
}

uint64_t sub_1BF8BBAE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CursorFrameKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CursorFrameKind(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CursorFrameKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8BBC60);
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

ValueMetadata *type metadata accessor for CursorFrameKind()
{
  return &type metadata for CursorFrameKind;
}

__n128 ColumnDebugView.columnSystem.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem;
  OUTLINED_FUNCTION_1_7();
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = v4;
  return result;
}

__n128 sub_1BF8BBCE8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v4;
  return result;
}

id sub_1BF8BBD44(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  char v5 = v1;
  return ColumnDebugView.columnSystem.setter(v4);
}

id ColumnDebugView.columnSystem.setter(long long *a1)
{
  long long v7 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  char v4 = *((unsigned char *)a1 + 32);
  char v5 = &v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem];
  swift_beginAccess();
  *(_OWORD *)char v5 = v7;
  *((void *)v5 + 2) = v2;
  *((void *)v5 + 3) = v3;
  v5[32] = v4;
  objc_msgSend(v1, sel_setNeedsLayout);
  return objc_msgSend(v1, sel_layoutIfNeeded);
}

id (*ColumnDebugView.columnSystem.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_1_23();
  return sub_1BF8BBE64;
}

id sub_1BF8BBE64(uint64_t a1, char a2)
{
  id result = (id)swift_endAccess();
  if ((a2 & 1) == 0)
  {
    char v5 = *(void **)(a1 + 24);
    objc_msgSend(v5, sel_setNeedsLayout);
    return objc_msgSend(v5, sel_layoutIfNeeded);
  }
  return result;
}

uint64_t ColumnDebugView.showMargins.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins);
  OUTLINED_FUNCTION_1_7();
  return *v1;
}

uint64_t sub_1BF8BBF0C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t ColumnDebugView.showMargins.setter(char a1)
{
  return sub_1BF8BC130(a1, &OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins, (uint64_t (*)(uint64_t))sub_1BF8BBF80);
}

id sub_1BF8BBF80()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView);
  uint64_t v2 = (unsigned char *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins);
  swift_beginAccess();
  objc_msgSend(v1, sel_setHidden_, (*v2 & 1) == 0);
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView), sel_setHidden_, (*v2 & 1) == 0);
}

uint64_t (*ColumnDebugView.showMargins.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_1_23();
  return sub_1BF8BC064;
}

uint64_t sub_1BF8BC064(uint64_t a1, char a2)
{
  return sub_1BF8BC330(a1, a2, (uint64_t (*)(uint64_t))sub_1BF8BBF80);
}

uint64_t ColumnDebugView.showColumns.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns);
  OUTLINED_FUNCTION_1_7();
  return *v1;
}

uint64_t sub_1BF8BC0BC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t ColumnDebugView.showColumns.setter(char a1)
{
  return sub_1BF8BC130(a1, &OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns, (uint64_t (*)(uint64_t))sub_1BF8BC18C);
}

uint64_t sub_1BF8BC130(char a1, void *a2, uint64_t (*a3)(uint64_t))
{
  long long v6 = (unsigned char *)(v3 + *a2);
  uint64_t v7 = swift_beginAccess();
  *long long v6 = a1;
  return a3(v7);
}

uint64_t sub_1BF8BC18C()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1BF8CBFB8();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 >= 1)
  {
    char v4 = (unsigned char *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns);
    swift_beginAccess();
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x1C18B4640](i, v1);
      }
      else {
        id v6 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v7 = v6;
      objc_msgSend(v6, sel_setHidden_, (*v4 & 1) == 0);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t (*ColumnDebugView.showColumns.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_1_23();
  return sub_1BF8BC318;
}

uint64_t sub_1BF8BC318(uint64_t a1, char a2)
{
  return sub_1BF8BC330(a1, a2, (uint64_t (*)(uint64_t))sub_1BF8BC18C);
}

uint64_t sub_1BF8BC330(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return a3(result);
  }
  return result;
}

uint64_t ColumnDebugView.__allocating_init(columnSystem:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return ColumnDebugView.init(columnSystem:)(a1);
}

uint64_t ColumnDebugView.init(columnSystem:)(uint64_t a1)
{
  swift_getObjectType();
  *(_OWORD *)long long v41 = *(_OWORD *)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  char v5 = *(unsigned char *)(a1 + 32);
  v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins] = 0;
  v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns] = 1;
  uint64_t v6 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView;
  id v7 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  uint64_t v8 = v1;
  double v9 = OUTLINED_FUNCTION_3_16();
  *(void *)&v1[v6] = objc_msgSend(v7, v10, v9);
  uint64_t v11 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView;
  *(void *)&v8[v11] = OUTLINED_FUNCTION_0_32(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_);
  char v12 = &v8[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem];
  *(_OWORD *)char v12 = *(_OWORD *)v41;
  *((void *)v12 + 2) = v3;
  *((void *)v12 + 3) = v4;
  v12[32] = v5;
  uint64_t v43 = MEMORY[0x1E4FBC860];
  uint64_t v13 = 18;
  sub_1BF8CBED8();
  do
  {
    OUTLINED_FUNCTION_0_32(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_);
    sub_1BF8CBEA8();
    sub_1BF8CBEE8();
    sub_1BF8CBEF8();
    sub_1BF8CBEB8();
    --v13;
  }
  while (v13);
  *(void *)&v8[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews] = v43;

  double v14 = OUTLINED_FUNCTION_3_16();
  id v17 = objc_msgSendSuper2(v15, v16, v14);
  uint64_t v18 = self;
  uint64_t v19 = (char *)v17;
  uint64_t v42 = v18;
  id v20 = objc_msgSend(v18, sel_clearColor);
  objc_msgSend(v19, sel_setBackgroundColor_, v20);

  objc_msgSend(v19, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v19, sel_setPreservesSuperviewLayoutMargins_, 1);
  uint64_t v21 = v19;
  unint64_t v22 = *(void *)&v19[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews];
  if (!(v22 >> 62))
  {
    uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v23) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v31 = v19;
    uint64_t v32 = *(void **)&v19[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView];
    uint64_t v33 = &v21[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins];
    id v34 = *(id *)&v21[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView];
    id v35 = v32;
    id v36 = objc_msgSend(v42, sel_blueColor);
    id v37 = objc_msgSend(v36, sel_colorWithAlphaComponent_, 0.1);

    objc_msgSend(v34, sel_setBackgroundColor_, v37);
    OUTLINED_FUNCTION_1_7();
    objc_msgSend(v34, sel_setHidden_, (*v33 & 1) == 0);
    objc_msgSend(v21, sel_addSubview_, v34);

    id v38 = v35;
    id v39 = objc_msgSend(v42, sel_blueColor);
    id v40 = objc_msgSend(v39, sel_colorWithAlphaComponent_, 0.1);

    objc_msgSend(v38, sel_setBackgroundColor_, v40);
    objc_msgSend(v38, sel_setHidden_, (*v33 & 1) == 0);
    objc_msgSend(v31, sel_addSubview_, v38);

    return (uint64_t)v31;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1BF8CBFB8();
  uint64_t v23 = result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_5:
  if (v23 >= 1)
  {
    uint64_t v25 = &v19[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns];
    OUTLINED_FUNCTION_1_7();
    uint64_t v26 = 0;
    do
    {
      if ((v22 & 0xC000000000000001) != 0) {
        id v27 = (id)MEMORY[0x1C18B4640](v26, v22);
      }
      else {
        id v27 = *(id *)(v22 + 8 * v26 + 32);
      }
      uint64_t v28 = v27;
      ++v26;
      id v29 = objc_msgSend(v42, sel_redColor);
      id v30 = objc_msgSend(v29, sel_colorWithAlphaComponent_, 0.1);

      objc_msgSend(v28, sel_setBackgroundColor_, v30);
      objc_msgSend(v28, sel_setHidden_, (*v25 & 1) == 0);
      objc_msgSend(v19, sel_addSubview_, v28);
    }
    while (v23 != v26);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

id ColumnDebugView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void ColumnDebugView.init(coder:)()
{
  v0[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins] = 0;
  v0[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns] = 1;
  uint64_t v1 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView;
  *(void *)&v0[v1] = OUTLINED_FUNCTION_0_32(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_);
  uint64_t v2 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView;
  *(void *)&v0[v2] = OUTLINED_FUNCTION_0_32(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_);

  sub_1BF8CBFA8();
  __break(1u);
}

Swift::Void __swiftcall ColumnDebugView.layoutSubviews()()
{
  uint64_t v1 = v0;
  v79.receiver = v0;
  v79.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v79, sel_layoutSubviews);
  id v2 = objc_msgSend(v0, sel_window);
  if (!v2) {
    return;
  }
  id v3 = v2;
  OUTLINED_FUNCTION_2_20();
  uint64_t v71 = v5;
  uint64_t v72 = v4;
  OUTLINED_FUNCTION_2_20();
  uint64_t v69 = v7;
  uint64_t v70 = v6;
  OUTLINED_FUNCTION_2_20();
  uint64_t v67 = v9;
  uint64_t v68 = v8;
  objc_msgSend(v3, sel_bounds);
  uint64_t v65 = v11;
  uint64_t v66 = v10;
  id v12 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v12, sel_nativeBounds);
  uint64_t v63 = v14;
  uint64_t v64 = v13;

  id v15 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v1, sel_layoutMargins);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  id v24 = objc_msgSend(self, sel_userInterfaceLayoutDirectionForSemanticContentAttribute_, objc_msgSend(v1, sel_semanticContentAttribute));
  id v25 = objc_msgSend(v1, sel_traitCollection);
  id v26 = objc_msgSend(v25, sel_preferredContentSizeCategory);

  objc_msgSend(v1, sel_safeAreaInsets);
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  __dst[0] = 0xF000000000000007;
  v77[0] = 0xF000000000000007;
  *(void *)&v74[0] = 0xF000000000000007;
  v76[0] = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  swift_allocObject();
  id v35 = LayoutMarginAdjuster.init(top:left:bottom:right:)(__dst, v77, (uint64_t *)v74, v76);
  __src[0] = v72;
  __src[1] = v71;
  __src[2] = v70;
  __src[3] = v69;
  __src[4] = v68;
  __src[5] = v67;
  __src[6] = v66;
  __src[7] = v65;
  __src[8] = v64;
  __src[9] = v63;
  __src[10] = v15;
  __src[11] = v17;
  __src[12] = v19;
  __src[13] = v21;
  __src[14] = v23;
  __src[16] = 0;
  __src[15] = 0;
  __src[17] = v24;
  __src[18] = v26;
  __src[19] = v28;
  __src[20] = v30;
  __src[21] = v32;
  __src[22] = v34;
  LOBYTE(__src[23]) = 3;
  id v36 = &v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem];
  __src[24] = v35;
  OUTLINED_FUNCTION_1_7();
  char v37 = v36[32];
  long long v38 = *((_OWORD *)v36 + 1);
  v74[0] = *(_OWORD *)v36;
  v74[1] = v38;
  char v75 = v37;
  memcpy(__dst, __src, sizeof(__dst));
  ColumnSystem.options(layoutOptions:)(__dst, (uint64_t)v77);
  uint64_t v39 = LOBYTE(v77[0]);
  double v40 = *(double *)&v77[2];
  double v41 = *(double *)&v77[8];
  double v42 = *(double *)&v77[11];
  double v43 = *(double *)&v77[13];
  unint64_t v44 = *(void *)&v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews];
  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_1BF8CBFB8();
  }
  else
  {
    uint64_t v45 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v45)
  {
    if (v45 < 1)
    {
LABEL_22:
      __break(1u);
      return;
    }
    uint64_t v46 = 0;
    do
    {
      if ((v44 & 0xC000000000000001) != 0) {
        id v47 = (id)MEMORY[0x1C18B4640](v46, v44);
      }
      else {
        id v47 = *(id *)(v44 + 8 * v46 + 32);
      }
      uint64_t v48 = v47;
      ++v46;
      double v49 = OUTLINED_FUNCTION_3_16();
      objc_msgSend(v50, v51, v49);
    }
    while (v45 != v46);
  }
  swift_bridgeObjectRelease();
  unint64_t v52 = v44 & 0xC000000000000001;
  if ((v44 & 0xC000000000000001) == 0 && !*(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v53 = 6 * v39;
  uint64_t v54 = 6 * v39 + 6;
  double v55 = (v41 - v42 - v43 - v40 * ((double)v54 + -1.0)) / (double)v54;
  sub_1BF8BCFF0(v53 + 5, v52 == 0, v44);
  uint64_t v56 = 0;
  double v57 = v42;
  do
  {
    if (v52) {
      id v58 = (id)MEMORY[0x1C18B4640](v56, v44);
    }
    else {
      id v58 = *(id *)(v44 + 8 * v56 + 32);
    }
    uint64_t v59 = v58;
    ++v56;
    OUTLINED_FUNCTION_2_20();
    objc_msgSend(v59, sel_setFrame_, v57, 0.0, v55);

    double v57 = v40 + v55 + v57;
  }
  while (v54 != v56);
  uint64_t v60 = *(void **)&v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView];
  OUTLINED_FUNCTION_2_20();
  objc_msgSend(v60, sel_setFrame_, 0.0, 0.0, v42, CGRectGetHeight(v80));
  uint64_t v61 = *(void **)&v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView];
  OUTLINED_FUNCTION_2_20();
  CGFloat v62 = CGRectGetWidth(v81) - v43;
  OUTLINED_FUNCTION_2_20();
  objc_msgSend(v61, sel_setFrame_, v62, 0.0, v43, CGRectGetHeight(v82));

  sub_1BF896598((uint64_t)__src);
}

id ColumnDebugView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ColumnDebugView.init(frame:)()
{
}

id ColumnDebugView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1BF8BCFF0(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF8BD020(char *a1)
{
  return ColumnDebugView.showMargins.setter(*a1);
}

uint64_t sub_1BF8BD04C(char *a1)
{
  return ColumnDebugView.showColumns.setter(*a1);
}

uint64_t type metadata accessor for ColumnDebugView()
{
  return self;
}

uint64_t method lookup function for ColumnDebugView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ColumnDebugView);
}

uint64_t dispatch thunk of ColumnDebugView.__allocating_init(columnSystem:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1BF8BD0C4(uint64_t a1)
{
  sub_1BF8BED9C(a1, (uint64_t)v2);
  if ((v4 & 1) == 0)
  {
    v5[0] = v2[0];
    v5[1] = v2[1];
    char v6 = v3;
    sub_1BF8CBAC8();
    sub_1BF8BD184((uint64_t)v5);
    sub_1BF8CBAC8();
  }
  sub_1BF8CBAC8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8BD184(uint64_t a1)
{
  sub_1BF8BF6C4(a1, (uint64_t)&v2);
  if (v3 != 1)
  {
    sub_1BF8CBE78();
    sub_1BF8CBAC8();
    type metadata accessor for UIEdgeInsets(0);
    sub_1BF8CBF48();
    sub_1BF8CBAC8();
  }
  sub_1BF8CBAC8();
  return swift_bridgeObjectRelease();
}

uint64_t Layout.__allocating_init(canvas:name:)(long long *a1, uint64_t a2, uint64_t a3)
{
  return Layout.init(canvas:name:)(a1, a2, a3);
}

double sub_1BF8BD318()
{
  if (*v0 == 1.79769313e308)
  {
    v2.origin.CGFloat x = OUTLINED_FUNCTION_2_10();
    CGRectGetMaxX(v2);
  }
  v3.origin.CGFloat x = OUTLINED_FUNCTION_2_10();
  CGRectGetHeight(v3);
  return 0.0;
}

double sub_1BF8BD390()
{
  return 0.0;
}

double sub_1BF8BD3B0()
{
  return 0.0;
}

double sub_1BF8BD3BC()
{
  return 0.0;
}

uint64_t DebugLayoutData.frames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DebugLayoutData.records.getter()
{
  return swift_retain();
}

uint64_t sub_1BF8BD3EC()
{
  type metadata accessor for LayoutContextRecords();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 16) = MEMORY[0x1E4FBC860];
  type metadata accessor for DebugLayoutData();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  *(void *)(result + 24) = v0;
  qword_1EBA90580 = result;
  return result;
}

uint64_t static DebugLayoutData.empty.getter()
{
  if (qword_1EBA90588 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t DebugLayoutData.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t DebugLayoutData.__deallocating_deinit()
{
  DebugLayoutData.deinit();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t Layout.DebugLayoutAttributes.layoutAttributes.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t Layout.DebugLayoutAttributes.debugData.getter()
{
  return swift_retain();
}

uint64_t Layout.DebugLayoutAttributes.init(layoutAttributes:debugData:)()
{
  OUTLINED_FUNCTION_1_24();
  uint64_t v2 = OUTLINED_FUNCTION_8_4();
  v3(v2);
  OUTLINED_FUNCTION_7_9();
  uint64_t result = type metadata accessor for Layout.DebugLayoutAttributes();
  *(void *)(v1 + *(int *)(result + 52)) = v0;
  return result;
}

__n128 sub_1BF8BD5A0()
{
  OUTLINED_FUNCTION_1_24();
  uint64_t v2 = OUTLINED_FUNCTION_8_4();
  v3(v2);
  OUTLINED_FUNCTION_7_9();
  uint64_t v4 = v1 + *(int *)(type metadata accessor for Layout.InternalLayoutResult() + 52);
  long long v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v0;
  *(_OWORD *)(v4 + 16) = v5;
  __n128 result = *(__n128 *)(v0 + 32);
  long long v7 = *(_OWORD *)(v0 + 48);
  *(__n128 *)(v4 + 32) = result;
  *(_OWORD *)(v4 + 48) = v7;
  return result;
}

uint64_t sub_1BF8BD610()
{
  return swift_bridgeObjectRetain();
}

uint64_t Layout.init(canvas:name:)(long long *a1, uint64_t a2, uint64_t a3)
{
  long long v12 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 3);
  char v8 = *((unsigned char *)a1 + 32);
  char v9 = *((unsigned char *)a1 + 33);
  OUTLINED_FUNCTION_4_16();
  OUTLINED_FUNCTION_4_16();
  type metadata accessor for Node();
  swift_retain();
  uint64_t v10 = sub_1BF8CBBD8();
  *(_OWORD *)(v3 + 40) = v12;
  *(void *)(v3 + 56) = v6;
  *(void *)(v3 + 64) = v7;
  *(unsigned char *)(v3 + 72) = v8;
  *(unsigned char *)(v3 + 73) = v9;
  *(void *)(v3 + 80) = v10;
  *(void *)(v3 + 88) = a2;
  *(void *)(v3 + 96) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  char v13 = 12;
  return Node.init(kind:identifier:)(&v13, a2, a3);
}

uint64_t type metadata accessor for Layout.DebugLayoutAttributes()
{
  return swift_getGenericMetadata();
}

uint64_t Layout.__allocating_init(canvas:name:block:)(long long *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  return Layout.init(canvas:name:block:)(a1, a2, a3, a4);
}

uint64_t Layout.init(canvas:name:block:)(long long *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  long long v15 = *a1;
  uint64_t v8 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 3);
  char v9 = *((unsigned char *)a1 + 32);
  char v14 = *((unsigned char *)a1 + 33);
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_13_2();
  type metadata accessor for Node();
  swift_retain();
  uint64_t v10 = sub_1BF8CBBD8();
  *(_OWORD *)(v4 + 40) = v15;
  *(void *)(v4 + 56) = v8;
  *(void *)(v4 + 64) = v7;
  *(unsigned char *)(v4 + 72) = v9;
  *(unsigned char *)(v4 + 73) = v14;
  *(void *)(v4 + 80) = v10;
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  v17[0] = 12;
  uint64_t v11 = Node.init(kind:identifier:)(v17, a2, a3);
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_10_4();
  type metadata accessor for LayoutBuilder();
  uint64_t v12 = sub_1BF88CA3C(v11);
  swift_retain_n();
  a4(v12);
  swift_release();
  swift_release();
  return v11;
}

uint64_t Layout.__allocating_init(tryCanvas:name:block:)(long long *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  return Layout.init(tryCanvas:name:block:)(a1, a2, a3, a4);
}

uint64_t Layout.init(tryCanvas:name:block:)(long long *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  long long v16 = *a1;
  uint64_t v7 = *((void *)a1 + 2);
  uint64_t v8 = *((void *)a1 + 3);
  char v9 = *((unsigned char *)a1 + 32);
  char v15 = *((unsigned char *)a1 + 33);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_12_2();
  type metadata accessor for Node();
  swift_retain();
  uint64_t v10 = sub_1BF8CBBD8();
  *(_OWORD *)(v4 + 40) = v16;
  *(void *)(v4 + 56) = v7;
  *(void *)(v4 + 64) = v8;
  *(unsigned char *)(v4 + 72) = v9;
  *(unsigned char *)(v4 + 73) = v15;
  *(void *)(v4 + 80) = v10;
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  v18[0] = 12;
  uint64_t v11 = Node.init(kind:identifier:)(v18, a2, a3);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_10_4();
  type metadata accessor for LayoutBuilder();
  uint64_t v12 = sub_1BF88CA3C(v11);
  swift_retain_n();
  uint64_t v13 = v19;
  a4(v12);
  swift_release();
  swift_release();
  if (v13) {
    swift_release();
  }
  return v11;
}

uint64_t sub_1BF8BDB14()
{
  return swift_endAccess();
}

uint64_t sub_1BF8BDBB4()
{
  return swift_retain();
}

uint64_t sub_1BF8BDC94@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_2_21();
  OUTLINED_FUNCTION_4_16();
  uint64_t v6 = *(void *)(v5 + 160);
  *(void *)&v15[0] = v7;
  long long v14 = *(_OWORD *)(v8 + 144);
  *(_OWORD *)((char *)v15 + 8) = v14;
  *((void *)&v15[1] + 1) = v6;
  uint64_t v9 = type metadata accessor for Layout.DebugLayoutAttributes();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v15[-1] - v11;
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  sub_1BF8BE498(a1, (uint64_t)v15, (uint64_t)&v15[-1] - v11);
  uint64_t result = sub_1BF8A0428((uint64_t)v15);
  if (!v2)
  {
    (*(void (**)(uint64_t, char *))(*(void *)(v14 - 8) + 16))(a2, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return result;
}

uint64_t sub_1BF8BDE18@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CursorFrameContainer();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = MEMORY[0x1E4FBC860];
  v7[3] = v4;
  v7[4] = &off_1F1B0AAA0;
  v7[0] = v5;
  sub_1BF8BE498(a1, (uint64_t)v7, a2);
  return sub_1BF8A0428((uint64_t)v7);
}

void sub_1BF8BDEA8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void (*a5)(void *__return_ptr, double)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  void (*v67)(void *__return_ptr, double);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[3];
  void v73[16];
  uint64_t v74;

  uint64_t v8 = v7;
  uint64_t v65 = a6;
  uint64_t v67 = a5;
  uint64_t v64 = a4;
  uint64_t v70 = a3;
  uint64_t v69 = a2;
  uint64_t v60 = a7;
  OUTLINED_FUNCTION_2_21();
  uint64_t v62 = v10;
  uint64_t v66 = *(void *)(v11 + 144);
  OUTLINED_FUNCTION_0_33();
  uint64_t v59 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_11_4();
  uint64_t v58 = v14;
  MEMORY[0x1F4188790](v15);
  uint64_t v61 = (uint64_t)&v58 - v16;
  OUTLINED_FUNCTION_4_16();
  uint64_t v18 = *(char **)(v17 + 136);
  OUTLINED_FUNCTION_0_33();
  uint64_t v74 = v19;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_11_4();
  uint64_t v63 = v21;
  MEMORY[0x1F4188790](v22);
  id v24 = (char *)&v58 - v23;
  OUTLINED_FUNCTION_4_16();
  uint64_t v26 = *(void *)(v25 + 152);
  (*(void (**)(char *, uint64_t))(v26 + 16))(v18, v26);
  uint64_t v27 = sub_1BF8BD610();
  uint64_t v68 = v26;
  uint64_t v28 = type metadata accessor for Node();
  uint64_t v29 = sub_1BF8CBB88();
  for (v72[0] = v29; v29 != MEMORY[0x1C18B43C0](v27, v28); uint64_t v29 = v72[0])
  {
    char v33 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v33)
    {
      uint64_t v34 = *(void *)(v27 + 32 + 8 * v29);
      swift_retain();
    }
    else
    {
      uint64_t v34 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](v72, v27, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *))(*(void *)v34 + 120))(a1, v24);
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_1BF8BD610();
  uint64_t v31 = v71;
  uint64_t v32 = sub_1BF8B87F0(v8, v30, a1, (uint64_t)v24, v69, v70);
  if (v31)
  {
    (*(void (**)(char *, char *))(v74 + 8))(v24, v18);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v35 = (uint64_t)v32;
    swift_bridgeObjectRelease();
    double v36 = Cursor.absoluteFrame.getter();
    uint64_t v40 = v74;
    if (v67)
    {
      v67(v73, v36);
      uint64_t v70 = v35;
      double v36 = *(double *)v73;
      uint64_t v37 = v73[1];
      uint64_t v38 = v73[2];
      uint64_t v39 = v73[3];
      double v41 = *(double *)&v73[4];
      uint64_t v42 = v73[5];
      uint64_t v43 = v73[6];
      uint64_t v44 = v73[7];
    }
    else
    {
      uint64_t v70 = v35;
      double v41 = v36;
      uint64_t v42 = v37;
      uint64_t v43 = v38;
      uint64_t v44 = v39;
    }
    uint64_t v45 = v62;
    *(double *)&v73[8] = v36;
    v73[9] = v37;
    v73[10] = v38;
    v73[11] = v39;
    *(double *)&v73[12] = v41;
    v73[13] = v42;
    v73[14] = v43;
    v73[15] = v44;
    OUTLINED_FUNCTION_0();
    sub_1BF89F278(v46);
    uint64_t v47 = *(void *)(v45 + 160);
    uint64_t v48 = (*(uint64_t (**)(char *))(v68 + 8))(v18);
    swift_beginAccess();
    *(double *)(v48 + 16) = v41;
    *(void *)(v48 + 24) = v42;
    *(void *)(v48 + 32) = v43;
    *(void *)(v48 + 40) = v44;
    *(unsigned char *)(v48 + 48) = 0;
    swift_release();
    uint64_t v69 = v47;
    uint64_t v71 = type metadata accessor for LayoutDecoder();
    uint64_t v49 = v63;
    (*(void (**)(uint64_t, char *, char *))(v40 + 16))(v63, v24, v18);
    uint64_t v50 = v64[3];
    uint64_t v51 = v64[4];
    __swift_project_boxed_opaque_existential_1(v64, v50);
    double v52 = OUTLINED_FUNCTION_0();
    v53(v50, v51, v52);
    sub_1BF8ADED0(v49, *(void *)(a1 + 264), v18);
    uint64_t v54 = v66;
    uint64_t v55 = v61;
    sub_1BF8ADD20(v61);
    uint64_t v56 = OUTLINED_FUNCTION_3_17();
    v57(v56);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32))(v58, v55, v54);
    sub_1BF8BD5A0();
  }
}

void sub_1BF8BE498(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  uint64_t v57 = a2;
  uint64_t v8 = *(void *)(*(void *)v5 + 144);
  OUTLINED_FUNCTION_0_33();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  uint64_t v45 = (char *)&v40 - v12;
  uint64_t v14 = v13[17];
  uint64_t v15 = v13[19];
  uint64_t v16 = v13[20];
  uint64_t v59 = v14;
  uint64_t v60 = v15;
  v68[0] = v14;
  v68[1] = v8;
  v68[2] = v15;
  v68[3] = v16;
  uint64_t v44 = v16;
  uint64_t v43 = type metadata accessor for Layout.InternalLayoutResult();
  MEMORY[0x1F4188790](v43);
  uint64_t v61 = (uint64_t)&v40 - v17;
  memcpy(v82, a1, sizeof(v82));
  memcpy(v83, a1, sizeof(v83));
  if (*(unsigned char *)(v5 + 73))
  {
    uint64_t v40 = v10;
    uint64_t v41 = v8;
    uint64_t v42 = a3;
    uint64_t v58 = v4;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v18 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v50 = 3;
  }
  else
  {
    char v21 = *(unsigned char *)(v5 + 72);
    long long v22 = *(_OWORD *)(v5 + 56);
    v65[0] = *(_OWORD *)(v5 + 40);
    v65[1] = v22;
    char v66 = v21 & 1;
    memcpy(v68, a1, sizeof(v68));
    ColumnSystem.options(layoutOptions:)(v68, (uint64_t)&v69);
    if (v4) {
      return;
    }
    uint64_t v40 = v10;
    uint64_t v41 = v8;
    uint64_t v42 = a3;
    uint64_t v58 = 0;
    uint64_t v50 = v69;
    uint64_t v55 = v70;
    uint64_t v56 = *((void *)&v69 + 1);
    uint64_t v53 = v72;
    uint64_t v54 = v71;
    uint64_t v51 = v74;
    uint64_t v52 = v73;
    uint64_t v18 = v77;
    uint64_t v48 = v76;
    uint64_t v49 = v75;
    uint64_t v46 = v79;
    uint64_t v47 = v78;
    uint64_t v19 = v80;
    uint64_t v20 = v81;
  }
  sub_1BF8CBCE8();
  sub_1BF8CBD68();
  type metadata accessor for Cursor();
  memcpy(v68, v82, sizeof(v68));
  *(void *)&long long v69 = v50;
  *((void *)&v69 + 1) = v56;
  uint64_t v70 = v55;
  uint64_t v71 = v54;
  uint64_t v72 = v53;
  uint64_t v73 = v52;
  uint64_t v74 = v51;
  uint64_t v75 = v49;
  uint64_t v76 = v48;
  uint64_t v77 = v18;
  uint64_t v78 = v47;
  uint64_t v79 = v46;
  uint64_t v80 = v19;
  uint64_t v81 = v20;
  char v67 = 1;
  sub_1BF8A0970(v57, (uint64_t)v65);
  uint64_t v23 = v82[15];
  uint64_t v24 = v82[16];
  uint64_t v64 = 0x8000000000000000;
  sub_1BF891FF4((uint64_t)v82);
  sub_1BF8B6C5C(v63);
  v62[0] = v63[0];
  v62[1] = v63[1];
  uint64_t v25 = sub_1BF89FC40((uint64_t)v68, &v69, &v67, (uint64_t)v65, v23, v24, 1, v62, &v64, 0);
  type metadata accessor for LayoutContextRecords();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = MEMORY[0x1E4FBC860];
  type metadata accessor for LayoutContext();
  swift_allocObject();
  *(void *)&long long v69 = sub_1BF8994A8(v26);
  uint64_t v27 = *(void *)(v5 + 88);
  uint64_t v28 = *(void *)(v5 + 96);
  sub_1BF89D858(v5, 0, v27, v28);
  v68[3] = &unk_1F1B09BB8;
  v68[4] = &off_1F1B09C48;
  v68[0] = swift_allocObject();
  memcpy((void *)(v68[0] + 16), v83, 0xC8uLL);
  uint64_t v29 = swift_allocObject();
  memcpy((void *)(v29 + 16), v82, 0xC8uLL);
  sub_1BF891FF4((uint64_t)v82);
  sub_1BF891FF4((uint64_t)v82);
  uint64_t v30 = v58;
  sub_1BF8BDEA8(v25, 1, (uint64_t)&v69, v68, (void (*)(void *__return_ptr, double))sub_1BF8BF728, v29, v61);
  if (v30)
  {
    swift_release();
    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
  }
  else
  {
    uint64_t v58 = 0;
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    uint64_t v31 = v25 + 544;
    sub_1BF8A0970(v25 + 544, (uint64_t)v68);
    uint64_t v32 = v68[3];
    if (v68[3])
    {
      uint64_t v33 = v68[4];
      __swift_project_boxed_opaque_existential_1(v68, v68[3]);
      uint64_t v57 = v25 + 544;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 32))(v25, v59, v60, v32, v33);
      uint64_t v31 = v57;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    }
    else
    {
      sub_1BF8A0428((uint64_t)v68);
    }
    uint64_t v34 = v40;
    sub_1BF89D868(v5, 0, v27, v28);
    sub_1BF8A0970(v31, (uint64_t)v68);
    uint64_t v35 = v68[3];
    if (v68[3])
    {
      uint64_t v36 = v68[4];
      __swift_project_boxed_opaque_existential_1(v68, v68[3]);
      uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8))(v35, v36);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    }
    else
    {
      sub_1BF8A0428((uint64_t)v68);
      uint64_t v37 = MEMORY[0x1E4FBC860];
    }
    swift_release();
    uint64_t v38 = *(void *)(v69 + 48);
    swift_retain();
    swift_release();
    type metadata accessor for DebugLayoutData();
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v37;
    *(void *)(v39 + 24) = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v45, v61, v41);
    Layout.DebugLayoutAttributes.init(layoutAttributes:debugData:)();
  }
}

void sub_1BF8BEB2C(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  double v8 = a2;
  if (CGRectGetHeight(*(CGRect *)&a2) != 0.0)
  {
    sub_1BF8CBD58();
    double v8 = v10;
    a3 = v11;
    a4 = v12;
    a5 = v13;
  }
  *a1 = v8;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = v8;
  a1[5] = a3;
  a1[6] = a4;
  a1[7] = a5;
}

void Layout.__allocating_init(kind:identifier:)()
{
}

void Layout.init(kind:identifier:)()
{
}

uint64_t sub_1BF8BEC18()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Layout.deinit()
{
  uint64_t v0 = Node.deinit();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Layout.__deallocating_deinit()
{
  uint64_t v0 = Layout.deinit();
  return MEMORY[0x1F4186488](v0, 104, 7);
}

uint64_t Layout.description.getter()
{
  sub_1BF8CBAC8();
  sub_1BF8CC238();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  sub_1BF8BED9C(v0 + 40, (uint64_t)v2);
  sub_1BF8BD0C4((uint64_t)v2);
  sub_1BF8CBAC8();
  return 0;
}

uint64_t sub_1BF8BED78()
{
  return Layout.description.getter();
}

uint64_t sub_1BF8BED9C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t dispatch thunk of LayoutType.frame.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LayoutType.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t type metadata accessor for DebugLayoutData()
{
  return self;
}

uint64_t method lookup function for DebugLayoutData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DebugLayoutData);
}

uint64_t sub_1BF8BEE5C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Layout()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for Layout(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Layout);
}

uint64_t dispatch thunk of Layout.__allocating_init(canvas:name:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of Layout.__allocating_init(canvas:name:block:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of Layout.__allocating_init(tryCanvas:name:block:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of Layout.add(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of Layout.layout(layoutOptions:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of Layout.debugLayout(layoutOptions:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t sub_1BF8BEFDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t sub_1BF8BEFE4()
{
  return sub_1BF8BF768();
}

uint64_t *sub_1BF8BEFF4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_1BF8BF0EC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
  return swift_release();
}

uint64_t sub_1BF8BF15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_1BF8BF1DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BF8BF268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1BF8BF2E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1BF8BF368(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BF8BF4A4);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1BF8BF4B8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x1BF8BF684);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *unint64_t v17 = v18;
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Layout.InternalLayoutResult()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BF8BF6C4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1BF8BF728(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
}

void type metadata accessor for AbsoluteLayoutBoundsAdjuster()
{
}

void type metadata accessor for EmbedLayoutBoundsAdjuster()
{
}

uint64_t sub_1BF8BF75C()
{
  return sub_1BF8BF768();
}

uint64_t sub_1BF8BF768()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BF8BF7FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 64 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = (_OWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (long long *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    long long v12 = v11[3];
    long long v14 = *v11;
    long long v13 = v11[1];
    v10[2] = v11[2];
    v10[3] = v12;
    *unint64_t v10 = v14;
    v10[1] = v13;
  }
  return v4;
}

uint64_t sub_1BF8BF8FC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
}

uint64_t sub_1BF8BF928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (long long *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[3];
  long long v11 = *v8;
  long long v10 = v8[1];
  v7[2] = v8[2];
  v7[3] = v9;
  *int v7 = v11;
  v7[1] = v10;
  return a1;
}

uint64_t sub_1BF8BF9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  void v7[5] = v8[5];
  v7[6] = v8[6];
  v7[7] = v8[7];
  return a1;
}

uint64_t sub_1BF8BFA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (long long *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[3];
  long long v11 = *v8;
  long long v10 = v8[1];
  v7[2] = v8[2];
  v7[3] = v9;
  *int v7 = v11;
  v7[1] = v10;
  return a1;
}

uint64_t sub_1BF8BFAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  void v7[5] = v8[5];
  v7[6] = v8[6];
  v7[7] = v8[7];
  return a1;
}

uint64_t sub_1BF8BFB98(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    unint64_t v6 = ((*(void *)(*(void *)(v4 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 64;
    int v7 = a2 - v5;
    uint64_t v8 = v6 & 0xFFFFFFF8;
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = v7 + 1;
    }
    if (v9 >= 0x10000) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v9 < 0x100) {
      unsigned int v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    switch(v11)
    {
      case 1:
        int v12 = *((unsigned __int8 *)a1 + v6);
        if (!v12) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v12 = *(unsigned __int16 *)((char *)a1 + v6);
        if (v12) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BF8BFC9CLL);
      case 4:
        int v12 = *(_DWORD *)((char *)a1 + v6);
        if (!v12) {
          break;
        }
LABEL_18:
        int v13 = v12 - 1;
        if (v8)
        {
          int v13 = 0;
          LODWORD(v8) = *a1;
        }
        return v5 + (v8 | v13) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  else {
    return 0;
  }
}

void sub_1BF8BFCB0(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = ((*(void *)(*(void *)(v6 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 64;
  if (v7 >= a3)
  {
    int v12 = 0;
  }
  else
  {
    int v9 = a3 - v7;
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFC0) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
  }
  if (a2 > v7)
  {
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFC0) {
      int v13 = a2 - v7;
    }
    else {
      int v13 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFC0)
    {
      int v14 = ~v7 + a2;
      bzero(a1, v8);
      *(_DWORD *)a1 = v14;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1BF8BFE48);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_28;
    default:
LABEL_28:
      if (a2)
      {
LABEL_29:
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
      }
      return;
  }
}

uint64_t sub_1BF8BFE70(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF8BFE90(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for LayoutPostProcessResult()
{
}

void SizingBehavior.width.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void SizingBehavior.height.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

void sub_1BF8BFEF0()
{
  word_1EBA8F7C8 = 257;
}

void *static SizingBehavior.fixed.getter@<X0>(unsigned char *a1@<X8>)
{
  return sub_1BF8BFF64(&qword_1EBA90300, &word_1EBA8F7C8, (char *)&word_1EBA8F7C8 + 1, a1);
}

void sub_1BF8BFF2C()
{
  word_1EBA902EA = 0;
}

void *static SizingBehavior.sizeToFitContents.getter@<X0>(unsigned char *a1@<X8>)
{
  return sub_1BF8BFF64(&qword_1EBA902F8, &word_1EBA902EA, (char *)&word_1EBA902EA + 1, a1);
}

void *sub_1BF8BFF64@<X0>(void *result@<X0>, unsigned char *a2@<X1>, char *a3@<X2>, unsigned char *a4@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  char v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return result;
}

BOOL static DimensionSizingBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DimensionSizingBehavior.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t DimensionSizingBehavior.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

uint64_t DimensionSizingBehavior.description.getter()
{
  if (*v0) {
    return 0x6465786966;
  }
  else {
    return 0x69466F54657A6973;
  }
}

unint64_t sub_1BF8C0094()
{
  unint64_t result = qword_1EA170550[0];
  if (!qword_1EA170550[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA170550);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SizingBehavior(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 65281 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 65281 < 0xFF0000) {
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
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((unsigned char *)a1 + 2)) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 16)) - 65282;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SizingBehavior(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BF8C0248);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SizingBehavior()
{
  return &type metadata for SizingBehavior;
}

unsigned char *storeEnumTagSinglePayload for DimensionSizingBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C034CLL);
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

ValueMetadata *type metadata accessor for DimensionSizingBehavior()
{
  return &type metadata for DimensionSizingBehavior;
}

void *sub_1BF8C0384@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t *a6@<X8>)
{
  char v11 = *a1;
  uint64_t v12 = *((void *)a1 + 1);
  uint64_t v14 = v6[3];
  uint64_t v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v14);
  char v20 = v11;
  v23[0] = v11;
  uint64_t v15 = v12;
  uint64_t v24 = v12;
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))(&v25, v23, a2, a3, a4, a5, v14, v13);
  if (!v22)
  {
    uint64_t v17 = v25;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v17;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a4;
    *(void *)(v19 + 24) = a5;
    *(unsigned char *)(v19 + 32) = v20;
    *(void *)(v19 + 40) = v15;
    *(void *)(v18 + 24) = sub_1BF8C0654;
    *(void *)(v18 + 32) = v19;
    *a6 = v18 | 0xA000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

double sub_1BF8C04BC@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  double v3 = *a1;
  double v4 = a1[1];
  type metadata accessor for DimensionCursor();
  double result = DimensionCursor.remainingBounds.getter() - v4;
  *(double *)a2 = v3;
  *(double *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

void *sub_1BF8C0534@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t *a6@<X8>)
{
  return sub_1BF8C0384(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1BF8C054C()
{
  return 0;
}

ValueMetadata *type metadata accessor for InvertDimensionSizer()
{
  return &type metadata for InvertDimensionSizer;
}

uint64_t sub_1BF8C05D8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8C061C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

double sub_1BF8C0654@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BF8C04BC(a1, a2);
}

BOOL CGFloat.isFlexible.getter(double a1)
{
  return a1 == 1.79769313e308;
}

double static CGFloat.flexible.getter()
{
  return 1.79769313e308;
}

unint64_t sub_1BF8C0684(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF8C06B4();
  unint64_t result = sub_1BF8C0700();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1BF8C06B4()
{
  unint64_t result = qword_1EBA901E8;
  if (!qword_1EBA901E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA901E8);
  }
  return result;
}

unint64_t sub_1BF8C0700()
{
  unint64_t result = qword_1EBA901D8;
  if (!qword_1EBA901D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA901D8);
  }
  return result;
}

BOOL sub_1BF8C074C(uint64_t a1)
{
  return a1 != 0;
}

void destroy for AltTextSized(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_release();
  int v2 = *(void **)(a1 + 72);
}

uint64_t initializeWithCopy for AltTextSized(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  unsigned int v6 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  BOOL v7 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  id v8 = v5;
  swift_retain();
  id v9 = v6;
  id v10 = v7;
  return a1;
}

void *assignWithCopy for AltTextSized(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  BOOL v7 = (void *)a2[4];
  id v8 = (void *)a1[4];
  a1[4] = v7;
  id v9 = v7;

  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  id v10 = (void *)a2[9];
  char v11 = (void *)a1[9];
  a1[9] = v10;
  id v12 = v10;

  a1[10] = a2[10];
  a1[11] = a2[11];
  return a1;
}

uint64_t assignWithTake for AltTextSized(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  id v6 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);

  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for AltTextSized(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 96))
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

uint64_t storeEnumTagSinglePayload for AltTextSized(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AltTextSized()
{
  return &type metadata for AltTextSized;
}

uint64_t sub_1BF8C0A50()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ValueMetadata *type metadata accessor for MinMaxSizer()
{
  return &type metadata for MinMaxSizer;
}

void *sub_1BF8C0A94@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v6 + 24);
  uint64_t v13 = *(void *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v6, v12);
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(&v23, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = *(void *)(v6 + 40);
    switch(*(unsigned char *)(v6 + 48))
    {
      case 1:
        uint64_t v17 = OUTLINED_FUNCTION_4_3();
        OUTLINED_FUNCTION_0_34(v17);
        uint64_t v18 = (__n128 *)OUTLINED_FUNCTION_2_22();
        unint64_t result = OUTLINED_FUNCTION_1_25(v18, (__n128)xmmword_1BF8CD2F0);
        goto LABEL_5;
      case 2:
        uint64_t v20 = OUTLINED_FUNCTION_4_3();
        OUTLINED_FUNCTION_0_34(v20);
        unint64_t result = (void *)OUTLINED_FUNCTION_2_22();
        *((_OWORD *)result + 1) = xmmword_1BF8CD2F0;
        result[4] = v15;
        *((unsigned char *)result + 40) = 0;
        goto LABEL_8;
      case 3:
        uint64_t v21 = OUTLINED_FUNCTION_4_3();
        OUTLINED_FUNCTION_0_34(v21);
        uint64_t v22 = (__n128 *)OUTLINED_FUNCTION_2_22();
        unint64_t result = OUTLINED_FUNCTION_1_25(v22, (__n128)xmmword_1BF8CD2F0);
LABEL_8:
        *(void *)(v6 + 24) = MEMORY[0x1E4FBC860];
        *(void *)(v6 + 32) = result;
        break;
      default:
        uint64_t v16 = OUTLINED_FUNCTION_4_3();
        OUTLINED_FUNCTION_0_34(v16);
        unint64_t result = (void *)OUTLINED_FUNCTION_2_22();
        *((_OWORD *)result + 1) = xmmword_1BF8CD2F0;
        result[4] = v15;
        *((unsigned char *)result + 40) = 0;
LABEL_5:
        uint64_t v19 = MEMORY[0x1E4FBC860];
        *(void *)(v6 + 24) = result;
        *(void *)(v6 + 32) = v19;
        break;
    }
    *a4 = v6 | 0x4000000000000000;
  }
  return result;
}

void *sub_1BF8C0C60@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8C0A94(a1, a2, a3, a4);
}

uint64_t sub_1BF8C0C78(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      unsigned int v2 = 1467507053;
      goto LABEL_7;
    case 2:
      unsigned int v3 = 1215195501;
      goto LABEL_5;
    case 3:
      unsigned int v3 = 1215848813;
LABEL_5:
      uint64_t v4 = v3 | 0x6867696500000000;
      break;
    default:
      unsigned int v2 = 1466853741;
LABEL_7:
      uint64_t v4 = v2 | 0x6874646900000000;
      break;
  }
  uint64_t v6 = v4;
  sub_1BF8CBC48();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  return v6;
}

uint64_t sub_1BF8C0D5C()
{
  return sub_1BF8C0C78(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_1BF8C0D68()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t getEnumTagSinglePayload for MinMaxSizer.Adjust(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for MinMaxSizer.Adjust(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8C0E38(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MinMaxSizer.Adjust()
{
  return &type metadata for MinMaxSizer.Adjust;
}

uint64_t initializeWithCopy for InsetSizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t *assignWithCopy for InsetSizer(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for InsetSizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsetSizer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
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

uint64_t storeEnumTagSinglePayload for InsetSizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InsetSizer()
{
  return &type metadata for InsetSizer;
}

void *sub_1BF8C0FFC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v6 + 24);
  uint64_t v13 = *(void *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v6, v12);
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(&v20, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = v20;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    long long v19 = *(_OWORD *)(v6 + 40);
    uint64_t v17 = *(void *)(v6 + 56);
    uint64_t v18 = *(void *)(v6 + 64);
    unint64_t result = (void *)swift_allocObject();
    *((_OWORD *)result + 1) = v19;
    result[4] = v17;
    result[5] = v18;
    *(void *)(v16 + 24) = sub_1BF8C12B0;
    *(void *)(v16 + 32) = result;
    *a4 = v16 | 0x6000000000000000;
  }
  return result;
}

void sub_1BF8C1148(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  *(double *)a1 = UIEdgeInsetsInsetRect(a2, a3, a4, a5, a6, a7);
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = 0;
}

void *sub_1BF8C1178@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8C0FFC(a1, a2, a3, a4);
}

uint64_t sub_1BF8C1190()
{
  return 0;
}

uint64_t sub_1BF8C125C()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8C12A0()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1BF8C12B0(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  sub_1BF8C1148(a1, a2, a3, a4, a5, *(double *)(v5 + 16), *(double *)(v5 + 24));
}

uint64_t sub_1BF8C12BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  if (*(unsigned char *)(a1 + 48))
  {
    swift_beginAccess();
    uint64_t v6 = *(void *)(a1 + 488);
    uint64_t v7 = *(void *)(a1 + 496);
    v17.origin.CGFloat x = *(CGFloat *)(a1 + 96);
    v17.origin.CGFloat y = *(CGFloat *)(a1 + 104);
    CGFloat v8 = *(double *)(a1 + 112);
    v17.size.CGFloat height = *(CGFloat *)(a1 + 120);
    v17.size.CGFloat width = v8;
    CGFloat v9 = CGRectGetHeight(v17) * a3;
    uint64_t result = swift_allocObject();
    uint64_t v11 = result;
    *(void *)(result + 16) = v6;
    *(void *)(result + 24) = v7;
    *(CGFloat *)(result + 32) = v8;
    *(CGFloat *)(result + 40) = v9;
  }
  else
  {
    swift_beginAccess();
    uint64_t v12 = *(void *)(a1 + 488);
    uint64_t v13 = *(void *)(a1 + 496);
    v18.origin.CGFloat x = *(CGFloat *)(a1 + 96);
    v18.origin.CGFloat y = *(CGFloat *)(a1 + 104);
    v18.size.CGFloat width = *(CGFloat *)(a1 + 112);
    CGFloat v14 = *(double *)(a1 + 120);
    v18.size.CGFloat height = v14;
    CGFloat v15 = CGRectGetWidth(v18) * a3;
    uint64_t result = swift_allocObject();
    uint64_t v11 = result;
    *(void *)(result + 16) = v12;
    *(void *)(result + 24) = v13;
    *(CGFloat *)(result + 32) = v15;
    *(CGFloat *)(result + 40) = v14;
  }
  if (qword_1EBA90300 != -1) {
    uint64_t result = swift_once();
  }
  char v16 = HIBYTE(word_1EBA8F7C8);
  *(unsigned char *)(v11 + 48) = word_1EBA8F7C8;
  *(unsigned char *)(v11 + 49) = v16;
  *a2 = v11;
  return result;
}

uint64_t sub_1BF8C13EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF8C12BC(a1, a2, *v2);
}

uint64_t sub_1BF8C1408()
{
  return 0x61746E6563726570;
}

uint64_t sub_1BF8C1478()
{
  return sub_1BF8C1408();
}

ValueMetadata *type metadata accessor for PercentageSizer()
{
  return &type metadata for PercentageSizer;
}

uint64_t sub_1BF8C1490()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

double *sub_1BF8C14A0@<X0>(double **a1@<X8>)
{
  double v2 = Cursor.remainingBounds.getter();
  uint64_t v4 = v3;
  uint64_t result = (double *)swift_allocObject();
  uint64_t v6 = result;
  result[2] = v2;
  *((void *)result + 3) = v4;
  result[4] = 0.0;
  result[5] = 0.0;
  if (qword_1EBA90300 != -1) {
    uint64_t result = (double *)swift_once();
  }
  char v7 = HIBYTE(word_1EBA8F7C8);
  *((unsigned char *)v6 + 48) = word_1EBA8F7C8;
  *((unsigned char *)v6 + 49) = v7;
  *a1 = v6;
  return result;
}

double *sub_1BF8C1554@<X0>(double **a1@<X8>)
{
  return sub_1BF8C14A0(a1);
}

uint64_t sub_1BF8C156C()
{
  return 1869768058;
}

ValueMetadata *type metadata accessor for ZeroSizer()
{
  return &type metadata for ZeroSizer;
}

uint64_t sub_1BF8C158C()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t ForEach<A, B>(_:block:)(void (*a1)(uint64_t, char *, uint64_t), void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = a3;
  uint64_t v33 = a6;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v28 = v10;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_17();
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v12);
  CGFloat v14 = (char *)&v27 - v13;
  OUTLINED_FUNCTION_0_4();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_3_18();
  uint64_t v18 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v29 = v19;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v27 - v21;
  type metadata accessor for ForEachNode();
  uint64_t v33 = OUTLINED_FUNCTION_2_23();
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 16))(v7, v30, a5);
  uint64_t v23 = v18;
  sub_1BF8CBAD8();
  swift_getAssociatedConformanceWitness();
  sub_1BF8CBDA8();
  OUTLINED_FUNCTION_5_11((uint64_t)v14);
  if (!v24)
  {
    uint64_t v30 = *(void (**)(uint64_t, char *, uint64_t))(v28 + 32);
    uint64_t v25 = (void (**)(uint64_t, uint64_t))(v28 + 8);
    do
    {
      v30(v6, v14, AssociatedTypeWitness);
      v31(v6);
      sub_1BF8C18E0();
      swift_bridgeObjectRelease();
      (*v25)(v6, AssociatedTypeWitness);
      sub_1BF8CBDA8();
      OUTLINED_FUNCTION_5_11((uint64_t)v14);
    }
    while (!v24);
  }
  (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v23);
  return v33;
}

uint64_t type metadata accessor for ForEachNode()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8C188C(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8C2090(a1, a2, a3);
}

uint64_t sub_1BF8C18E0()
{
  return swift_endAccess();
}

uint64_t ForEach<A, B>(_:block:)(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(char *, char *, uint64_t))
{
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v34 = a1;
  uint64_t v33 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v38 = v11;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v12);
  CGFloat v14 = (char *)&v30 - v13;
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v30 - v16;
  OUTLINED_FUNCTION_0_4();
  uint64_t v19 = v18;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_3_18();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_4();
  uint64_t v30 = v21;
  uint64_t v31 = v22;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_4_17();
  type metadata accessor for ForEachNode();
  uint64_t v37 = OUTLINED_FUNCTION_2_23();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v7, v34, a5);
  uint64_t v24 = v30;
  sub_1BF8CBAD8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_6_11();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, AssociatedTypeWitness) != 1)
  {
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
    v38 += 32;
    uint64_t v32 = (void (**)(char *, uint64_t))(v38 - 24);
    uint64_t v33 = v26;
    uint64_t v34 = AssociatedConformanceWitness;
    do
    {
      v33(v14, v17, AssociatedTypeWitness);
      sub_1BF89B278();
      swift_allocObject();
      sub_1BF8CBB98();
      *uint64_t v27 = v35(v14);
      type metadata accessor for Node();
      sub_1BF8A4268();
      sub_1BF8C18E0();
      swift_bridgeObjectRelease();
      (*v32)(v14, AssociatedTypeWitness);
      OUTLINED_FUNCTION_6_11();
      OUTLINED_FUNCTION_5_11((uint64_t)v17);
    }
    while (!v28);
  }
  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t))(v31 + 8))(a7, v24);
  return v37;
}

uint64_t sub_1BF8C1CF0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 40);
  uint64_t v6 = type metadata accessor for Node();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BF8CBB88();
  for (i = v7; v7 != MEMORY[0x1C18B43C0](v5, v6); uint64_t v7 = i)
  {
    char v9 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v9)
    {
      uint64_t v10 = *(void *)(v5 + 32 + 8 * v7);
      swift_retain();
    }
    else
    {
      uint64_t v10 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](&i, v5, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 120))(a1, a2);
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C1E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v8 = *(void *)(v4 + 40);
  uint64_t v9 = type metadata accessor for Node();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1BF8CBB88();
  uint64_t v20 = v10;
  if (v10 == MEMORY[0x1C18B43C0](v8, v9))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v18 = a1;
  char v12 = 0;
  do
  {
    char v13 = sub_1BF8CBBE8();
    sub_1BF8CBBA8();
    if (v13)
    {
      uint64_t v14 = *(void *)(v8 + 32 + 8 * v10);
      swift_retain();
    }
    else
    {
      uint64_t v14 = sub_1BF8CBE88();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1C18B43D0](&v20, v8, v9);
    swift_bridgeObjectRelease();
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 128))(v18, a2, a3, a4);
    swift_release();
    if (v5) {
      return swift_bridgeObjectRelease();
    }
    BOOL v16 = sub_1BF8C074C(v15);
    swift_release();
    v12 |= v16;
    uint64_t v10 = v20;
  }
  while (v10 != MEMORY[0x1C18B43C0](v8, v9));
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0) {
    return 0;
  }
  return swift_retain();
}

uint64_t sub_1BF8C2090(char *a1, uint64_t a2, uint64_t a3)
{
  char v6 = *a1;
  type metadata accessor for Node();
  swift_retain();
  *(void *)(v3 + 40) = sub_1BF8CB9B8();
  swift_release();
  char v8 = v6;
  return Node.init(kind:identifier:)(&v8, a2, a3);
}

uint64_t sub_1BF8C2138()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C2140()
{
  uint64_t v0 = Node.deinit();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8C2170()
{
  uint64_t v0 = sub_1BF8C2140();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t sub_1BF8C21A0()
{
  return 0x68636145726F46;
}

uint64_t sub_1BF8C21B8()
{
  return sub_1BF8C21A0();
}

uint64_t sub_1BF8C21DC()
{
  return swift_initClassMetadata2();
}

BOOL static ResizeConstraint.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ResizeConstraint.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t ResizeConstraint.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

unint64_t sub_1BF8C22C0()
{
  unint64_t result = qword_1EA1705D8;
  if (!qword_1EA1705D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1705D8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ResizeConstraint(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C23D8);
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

ValueMetadata *type metadata accessor for ResizeConstraint()
{
  return &type metadata for ResizeConstraint;
}

void sub_1BF8C2410(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2;
  switch(((unint64_t)*v2 >> 59) & 0x1E | (*v2 >> 2) & 1)
  {
    case 1uLL:
      double v9 = OUTLINED_FUNCTION_3_19(v4);
      uint64_t v11 = *(void *)(v10 + 24);
      char v12 = *(unsigned char *)(v10 + 32);
      *(void *)(a2 + 24) = &type metadata for PercentageFillSizer;
      *(void *)(a2 + 32) = &off_1F1B0A5F8;
      *(double *)a2 = v9;
      *(void *)(a2 + 8) = v11;
      goto LABEL_9;
    case 2uLL:
      OUTLINED_FUNCTION_1_26();
      unint64_t v14 = *(void *)(v13 + 16);
      unint64_t v15 = *(void *)(v13 + 24);
      *(void *)(a2 + 24) = &type metadata for DimensionWiseSizer;
      *(void *)(a2 + 32) = &off_1F1B09638;
      uint64_t v16 = swift_allocObject();
      *(void *)a2 = v16;
      sub_1BF8917EC(v14);
      sub_1BF8917EC(v15);
      sub_1BF8911DC(v16 + 16);
      unint64_t v92 = v15;
      sub_1BF8911DC(v16 + 56);
      sub_1BF89183C(v14);
      sub_1BF89183C(v15);
      return;
    case 3uLL:
      OUTLINED_FUNCTION_0_35();
      OUTLINED_FUNCTION_17_2(v17);
      char v12 = 1;
      goto LABEL_9;
    case 4uLL:
      OUTLINED_FUNCTION_0_35();
      OUTLINED_FUNCTION_17_2(v18);
      char v12 = 2;
      goto LABEL_9;
    case 5uLL:
      OUTLINED_FUNCTION_0_35();
      OUTLINED_FUNCTION_17_2(v19);
      char v12 = 3;
      goto LABEL_9;
    case 6uLL:
      OUTLINED_FUNCTION_0_35();
      OUTLINED_FUNCTION_17_2(v20);
      char v12 = 4;
LABEL_9:
      *(unsigned char *)(a2 + 16) = v12;
      return;
    case 7uLL:
      uint64_t v21 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v22 = *(void **)(v21 + 16);
      uint64_t v23 = *(void *)(v21 + 24);
      *(void *)(a2 + 24) = &type metadata for FixedSizer;
      *(void *)(a2 + 32) = &off_1F1B08768;
      *(void *)a2 = v22;
      *(void *)(a2 + 8) = v23;
      char v24 = 5;
      goto LABEL_12;
    case 8uLL:
      uint64_t v25 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v22 = *(void **)(v25 + 16);
      uint64_t v26 = *(void *)(v25 + 24);
      *(void *)(a2 + 24) = &type metadata for FixedSizer;
      *(void *)(a2 + 32) = &off_1F1B08768;
      *(void *)a2 = v22;
      *(void *)(a2 + 8) = v26;
      char v24 = 6;
LABEL_12:
      *(unsigned char *)(a2 + 16) = v24;
      id v27 = v22;
      return;
    case 9uLL:
      uint64_t v28 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v29 = *(void *)(v28 + 16);
      LOBYTE(v28) = *(unsigned char *)(v28 + 24);
      *(void *)(a2 + 24) = &type metadata for RatioSizer;
      *(void *)(a2 + 32) = &off_1F1B078F0;
      *(void *)a2 = v29;
      *(unsigned char *)(a2 + 8) = v28;
      return;
    case 0xAuLL:
      OUTLINED_FUNCTION_1_26();
      unsigned int v6 = &type metadata for FlexibleSizer;
      uint64_t v7 = *(void *)(v30 + 16);
      char v8 = &off_1F1B076C0;
      goto LABEL_17;
    case 0xBuLL:
      OUTLINED_FUNCTION_16_2();
      uint64_t v31 = (__n128 *)OUTLINED_FUNCTION_2_22();
      uint64_t v32 = OUTLINED_FUNCTION_19_2(v31, (__n128)xmmword_1BF8CD2F0);
      *(void *)(a2 + 24) = &type metadata for FlexibleMaxSizer;
      *(void *)(a2 + 32) = &off_1F1B084B8;
      *(void *)a2 = MEMORY[0x1E4FBC860];
      *(void *)(a2 + 8) = v32;
      return;
    case 0xCuLL:
      OUTLINED_FUNCTION_16_2();
      uint64_t v33 = (__n128 *)OUTLINED_FUNCTION_2_22();
      uint64_t v34 = OUTLINED_FUNCTION_19_2(v33, (__n128)xmmword_1BF8CD2F0);
      *(void *)(a2 + 24) = &type metadata for FlexibleMaxSizer;
      *(void *)(a2 + 32) = &off_1F1B084B8;
      uint64_t v35 = MEMORY[0x1E4FBC860];
      *(void *)a2 = v34;
      *(void *)(a2 + 8) = v35;
      return;
    case 0xDuLL:
      OUTLINED_FUNCTION_1_26();
      uint64_t v37 = *(void *)(v36 + 16);
      uint64_t v38 = *(void *)(v36 + 24);
      sub_1BF8A515C();
      uint64_t v39 = OUTLINED_FUNCTION_2_22();
      *(_OWORD *)(v39 + 16) = xmmword_1BF8CD2F0;
      *(void *)(v39 + 32) = v37;
      *(unsigned char *)(v39 + 40) = 1;
      uint64_t v40 = OUTLINED_FUNCTION_2_22();
      *(_OWORD *)(v40 + 16) = xmmword_1BF8CD2F0;
      *(void *)(v40 + 32) = v38;
      *(unsigned char *)(v40 + 40) = 1;
      *(void *)(a2 + 24) = &type metadata for FlexibleMaxSizer;
      *(void *)(a2 + 32) = &off_1F1B084B8;
      *(void *)a2 = v39;
      *(void *)(a2 + 8) = v40;
      return;
    case 0xEuLL:
      uint64_t v41 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v42 = *(void *)(v41 + 24);
      if (!v42) {
        goto LABEL_51;
      }
      uint64_t v43 = *(void *)(v41 + 16);
      id v44 = *(id *)(v41 + 32);
      swift_bridgeObjectRetain();
      id v45 = sub_1BF898E34(v43, v42, v44);
      uint64_t v46 = &type metadata for FlexibleTextSizer;
      uint64_t v47 = &off_1F1B07DC8;
      goto LABEL_36;
    case 0xFuLL:
      OUTLINED_FUNCTION_0_35();
      if (!v48) {
        goto LABEL_51;
      }
      id v49 = v48;
      id v50 = sub_1BF8A63BC();
      uint64_t v51 = &type metadata for FlexibleTextSizer;
      uint64_t v52 = &off_1F1B07DC8;
      goto LABEL_39;
    case 0x10uLL:
      uint64_t v53 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v54 = *(void **)(v53 + 16);
      if (!v54) {
        goto LABEL_51;
      }
      uint64_t v55 = *(void *)(v53 + 24);
      swift_bridgeObjectRetain();
      id v56 = v54;
      id v57 = sub_1BF8A63BC();
      uint64_t v58 = &type metadata for AltFlexibleTextSizer;
      uint64_t v59 = &off_1F1B07090;
      goto LABEL_42;
    case 0x11uLL:
      OUTLINED_FUNCTION_1_26();
      OUTLINED_FUNCTION_13_3(v60);
      __int16 v61 = 256;
      goto LABEL_33;
    case 0x12uLL:
      OUTLINED_FUNCTION_1_26();
      OUTLINED_FUNCTION_13_3(v62);
      __int16 v61 = 257;
      goto LABEL_33;
    case 0x13uLL:
      OUTLINED_FUNCTION_1_26();
      LOBYTE(v63) = *(unsigned char *)(v63 + 16);
      *(void *)(a2 + 24) = &type metadata for ColumnSpecSizer;
      *(void *)(a2 + 32) = &off_1F1B064C0;
      *(unsigned char *)a2 = v63;
      return;
    case 0x14uLL:
      OUTLINED_FUNCTION_1_26();
      char v65 = *(unsigned char *)(v64 + 32);
      long long v66 = *(_OWORD *)(v64 + 16);
      *(void *)(a2 + 24) = &type metadata for ColumnRowSpanSizer;
      *(void *)(a2 + 32) = &off_1F1B05BC0;
      *(_OWORD *)a2 = v66;
      *(unsigned char *)(a2 + 16) = v65;
      return;
    case 0x15uLL:
      OUTLINED_FUNCTION_0_35();
      *(void *)(a2 + 24) = &type metadata for ColumnSizer;
      *(void *)(a2 + 32) = &off_1F1B08FC8;
      *(void *)a2 = v67;
      *(_WORD *)(a2 + 8) = 0;
      return;
    case 0x16uLL:
      OUTLINED_FUNCTION_1_26();
      OUTLINED_FUNCTION_13_3(v68);
      __int16 v61 = 1;
LABEL_33:
      *(_WORD *)(a2 + 8) = v61;
      return;
    case 0x17uLL:
      uint64_t v69 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v70 = *(void *)(v69 + 24);
      if (!v70) {
        goto LABEL_51;
      }
      uint64_t v71 = *(void *)(v69 + 16);
      id v44 = *(id *)(v69 + 32);
      swift_bridgeObjectRetain();
      id v45 = sub_1BF898E34(v71, v70, v44);
      uint64_t v46 = &type metadata for TextSizer;
      uint64_t v47 = &off_1F1B06400;
LABEL_36:
      *(void *)(a2 + 24) = v46;
      *(void *)(a2 + 32) = v47;

      *(void *)a2 = v45;
      break;
    case 0x18uLL:
      OUTLINED_FUNCTION_0_35();
      if (!v72) {
        goto LABEL_51;
      }
      id v49 = v72;
      id v50 = sub_1BF8A63BC();
      uint64_t v51 = &type metadata for TextSizer;
      uint64_t v52 = &off_1F1B06400;
LABEL_39:
      *(void *)(a2 + 24) = v51;
      *(void *)(a2 + 32) = v52;

      *(void *)a2 = v50;
      break;
    case 0x19uLL:
      uint64_t v73 = v4 & 0xFFFFFFFFFFFFFFBLL;
      uint64_t v74 = *(void **)(v73 + 16);
      if (v74)
      {
        uint64_t v55 = *(void *)(v73 + 24);
        swift_bridgeObjectRetain();
        id v56 = v74;
        id v57 = sub_1BF8A63BC();
        uint64_t v58 = &type metadata for AltTextSizer;
        uint64_t v59 = &off_1F1B08228;
LABEL_42:
        *(void *)(a2 + 24) = v58;
        *(void *)(a2 + 32) = v59;

        *(void *)a2 = v57;
        *(void *)(a2 + 8) = v55;
      }
      else
      {
LABEL_51:
        char v88 = &type metadata for ZeroSizer;
        char v89 = (char **)&off_1F1B0A250;
LABEL_52:
        *(void *)(a2 + 24) = v88;
        *(void *)(a2 + 32) = v89;
      }
      break;
    case 0x1AuLL:
      sub_1BF89172C((v4 & 0xFFFFFFFFFFFFFFBLL) + 16, a2);
      break;
    case 0x1BuLL:
      OUTLINED_FUNCTION_1_26();
      unint64_t v76 = v75[2];
      unint64_t v78 = v75[4];
      unint64_t v91 = v75[3];
      unint64_t v77 = v91;
      unint64_t v92 = v76;
      unint64_t v90 = v78;
      *(void *)(a2 + 24) = type metadata accessor for IfSizer();
      *(void *)(a2 + 32) = &off_1F1B054B0;
      sub_1BF88DE00(&v92, (uint64_t *)&v91, (uint64_t *)&v90, (void *)a2);
      sub_1BF88E120(v76);
      sub_1BF88E13C(v77);
      sub_1BF88E13C(v78);
      break;
    case 0x1CuLL:
      OUTLINED_FUNCTION_1_26();
      uint64_t v81 = *(void *)(v79 + 16);
      uint64_t v80 = *(void *)(v79 + 24);
      CGRect v82 = (void *)OUTLINED_FUNCTION_2_22();
      uint64_t v84 = *(void *)(a1 + 16);
      uint64_t v83 = *(void *)(a1 + 24);
      _OWORD v82[2] = v84;
      v82[3] = v83;
      void v82[4] = v81;
      uint64_t v82[5] = v80;
      uint64_t v85 = nullsub_1(sub_1BF8C3AD8);
      uint64_t v87 = v86;
      *(void *)(a2 + 24) = type metadata accessor for DynamicSizer();
      *(void *)(a2 + 32) = &off_1F1B07C10;
      *(void *)a2 = v85;
      *(void *)(a2 + 8) = v87;
      swift_retain();
      break;
    case 0x1DuLL:
      switch(__ROR8__(v4 + 0x1FFFFFFFFFFFFFFCLL, 3))
      {
        case 1:
          char v88 = &type metadata for SizeToFitSizer;
          char v89 = (char **)&off_1F1B058D0;
          goto LABEL_52;
        case 2:
          *(void *)(a2 + 24) = &type metadata for FlexibleSizer;
          *(void *)(a2 + 32) = &off_1F1B076C0;
          *(void *)a2 = 0x3FF0000000000000;
          break;
        case 3:
          goto LABEL_51;
        default:
          char v88 = &type metadata for FillSizer;
          char v89 = &off_1F1B06938;
          goto LABEL_52;
      }
      break;
    default:
      unsigned int v6 = &type metadata for PercentageSizer;
      uint64_t v7 = *(void *)(v4 + 16);
      char v8 = &off_1F1B0A1F0;
LABEL_17:
      *(void *)(a2 + 24) = v6;
      *(void *)(a2 + 32) = v8;
      *(void *)a2 = v7;
      break;
  }
}

unint64_t Sizing.add(position:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  char v4 = *(unsigned char *)(a1 + 32);
  unint64_t v9 = *v3;
  long long v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  char v8 = v4;
  return + infix<A>(_:_:)(&v9, (uint64_t)v7, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

void *sub_1BF8C2CA0(uint64_t a1, void *(*a2)(unint64_t *__return_ptr))
{
  unint64_t result = a2(&v6);
  if (!v2)
  {
    unint64_t v4 = v6;
    uint64_t v5 = type metadata accessor for Sizing();
    sub_1BF8C2410(v5);
    return (void *)sub_1BF88DB44(v4);
  }
  return result;
}

uint64_t static Sizing.size<A>(_:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = OUTLINED_FUNCTION_8_5();
  *(double *)(v7 + 16) = a2;
  *(void *)(v6 + 16) = v7;
  uint64_t result = OUTLINED_FUNCTION_8_5();
  *(double *)(result + 16) = a3;
  *(void *)(v6 + 24) = result;
  *a1 = v6 | 0x1000000000000000;
  return result;
}

uint64_t sub_1BF8C2DA0()
{
  sub_1BF89183C(*(void *)(v0 + 16));
  sub_1BF89183C(*(void *)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BF8C2DE0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t static Sizing.scaledSize<A>(_:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = OUTLINED_FUNCTION_8_5();
  *(double *)(v7 + 16) = a2;
  *(void *)(v6 + 16) = v7 | 0x2000000000000000;
  uint64_t result = OUTLINED_FUNCTION_8_5();
  *(double *)(result + 16) = a3;
  *(void *)(v6 + 24) = result | 0x2000000000000000;
  *a1 = v6 | 0x1000000000000000;
  return result;
}

uint64_t Sizing.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = 0x63696D616E7964;
  switch(((unint64_t)*v0 >> 59) & 0x1E | (*v0 >> 2) & 1)
  {
    case 1uLL:
      OUTLINED_FUNCTION_7_10();
      sub_1BF8CBAC8();
      sub_1BF8CBC48();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_18();
      sub_1BF8CBF48();
      return v30[0];
    case 2uLL:
      OUTLINED_FUNCTION_1_26();
      unint64_t v6 = *(void *)(v5 + 16);
      unint64_t v7 = *(void *)(v5 + 24);
      v30[0] = 0x28657A6973;
      v30[1] = 0xE500000000000000;
      sub_1BF8917EC(v6);
      sub_1BF8917EC(v7);
      DimensionSizing.description.getter();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_18();
      DimensionSizing.description.getter();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_7();
      sub_1BF89183C(v7);
      sub_1BF89183C(v6);
      return v30[0];
    case 3uLL:
      OUTLINED_FUNCTION_3_19(v1);
      uint64_t v3 = 0x286874646977;
      unint64_t v4 = 0xE600000000000000;
      goto LABEL_14;
    case 4uLL:
      OUTLINED_FUNCTION_3_19(v1);
      uint64_t v3 = 0x28746867696568;
      unint64_t v4 = 0xE700000000000000;
      goto LABEL_14;
    case 5uLL:
      OUTLINED_FUNCTION_3_19(v1);
      uint64_t v3 = 0x695764656C616373;
      unint64_t v4 = 0xEC00000028687464;
      goto LABEL_14;
    case 6uLL:
      OUTLINED_FUNCTION_2_24();
      sub_1BF8CBE78();
      swift_bridgeObjectRelease();
      uint64_t v8 = 0x654864656C616373;
      unint64_t v9 = 0xED00002874686769;
      goto LABEL_42;
    case 7uLL:
      id v10 = OUTLINED_FUNCTION_11_5(v1);
      sub_1BF8CBE78();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_6();
      id v11 = objc_msgSend(v10, sel_description);
      goto LABEL_11;
    case 8uLL:
      id v10 = OUTLINED_FUNCTION_11_5(v1);
      sub_1BF8CBE78();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_5();
      OUTLINED_FUNCTION_9_6();
      id v11 = objc_msgSend(v10, sel_description);
LABEL_11:
      id v12 = v11;
      sub_1BF8CBAA8();

      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_18();
      sub_1BF8CBC48();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_7();

      return v30[0];
    case 9uLL:
      v30[0] = 0;
      v30[1] = 0xE000000000000000;
      sub_1BF8CBAC8();
      sub_1BF8CBF48();
      goto LABEL_45;
    case 0xAuLL:
      OUTLINED_FUNCTION_3_19(v1);
      uint64_t v3 = 0x656C626978656C66;
      unint64_t v4 = 0xE900000000000028;
      goto LABEL_14;
    case 0xBuLL:
      OUTLINED_FUNCTION_2_24();
      sub_1BF8CBE78();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_5();
      uint64_t v8 = v13 + 1;
      unint64_t v14 = "flexibleMaxHeight(";
      goto LABEL_41;
    case 0xCuLL:
      OUTLINED_FUNCTION_5_12();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_5();
      unint64_t v14 = "flexibleMaxWidth(";
      goto LABEL_41;
    case 0xDuLL:
      OUTLINED_FUNCTION_1_26();
      OUTLINED_FUNCTION_18_2();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_6();
      sub_1BF8CBC48();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_18();
      goto LABEL_43;
    case 0xEuLL:
      OUTLINED_FUNCTION_15_2();
      if (v15) {
        return 1869768058;
      }
      else {
        return 0x656C626978656C66;
      }
    case 0xFuLL:
      OUTLINED_FUNCTION_12_3();
      uint64_t v18 = v17 + 5;
      goto LABEL_23;
    case 0x10uLL:
      OUTLINED_FUNCTION_12_3();
      uint64_t v18 = v19 | 8;
LABEL_23:
      if (v16) {
        return v18;
      }
      else {
        return 1869768058;
      }
    case 0x11uLL:
      OUTLINED_FUNCTION_0_35();
      strcpy((char *)v30, "columns(");
      BYTE1(v30[1]) = 0;
      WORD1(v30[1]) = 0;
      HIDWORD(v30[1]) = -402653184;
      goto LABEL_39;
    case 0x12uLL:
      OUTLINED_FUNCTION_5_12();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_5();
      unint64_t v14 = "columnPercentage(";
      goto LABEL_41;
    case 0x13uLL:
      OUTLINED_FUNCTION_1_26();
      strcpy((char *)v30, "columnSpec(");
      HIDWORD(v30[1]) = -352321536;
      goto LABEL_44;
    case 0x14uLL:
      OUTLINED_FUNCTION_1_26();
      char v21 = *(unsigned char *)(v20 + 32);
      OUTLINED_FUNCTION_7_10();
      swift_bridgeObjectRelease();
      strcpy((char *)v30, "columnRowSpan(");
      HIBYTE(v30[1]) = -18;
      sub_1BF8CC018();
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_18();
      if (v21) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 0x15uLL:
      OUTLINED_FUNCTION_18_2();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_5();
      OUTLINED_FUNCTION_9_6();
LABEL_39:
      sub_1BF8CC018();
      goto LABEL_44;
    case 0x16uLL:
      OUTLINED_FUNCTION_2_24();
      sub_1BF8CBE78();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_5();
      uint64_t v8 = v23 | 0xC;
      unint64_t v14 = "columnPercentageFromPosition(";
LABEL_41:
      unint64_t v9 = (unint64_t)(v14 - 32) | 0x8000000000000000;
LABEL_42:
      v30[0] = v8;
      v30[1] = v9;
      goto LABEL_43;
    case 0x17uLL:
      OUTLINED_FUNCTION_15_2();
      if (v15) {
        return 1869768058;
      }
      else {
        return 1954047348;
      }
    case 0x18uLL:
      OUTLINED_FUNCTION_0_35();
      if (v22) {
        return 0x7475626972747461;
      }
      else {
        return 1869768058;
      }
    case 0x19uLL:
      OUTLINED_FUNCTION_0_35();
      if (v25) {
        return 0xD000000000000011;
      }
      else {
        return 1869768058;
      }
    case 0x1AuLL:
      sub_1BF89172C((v1 & 0xFFFFFFFFFFFFFFBLL) + 16, (uint64_t)v30);
      sub_1BF8CBAC8();
      sub_1BF898570();
      sub_1BF8CBF48();
      sub_1BF8CBAC8();
      uint64_t v2 = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      return v2;
    case 0x1BuLL:
      OUTLINED_FUNCTION_1_26();
      unint64_t v27 = v26[2];
      unint64_t v28 = v26[3];
      unint64_t v29 = v26[4];
      v30[0] = 0;
      v30[1] = 0xE000000000000000;
      sub_1BF88E120(v27);
      sub_1BF88E13C(v28);
      sub_1BF88E13C(v29);
      sub_1BF8CBE78();
      sub_1BF8CBAC8();
      type metadata accessor for Conditional();
      swift_getWitnessTable();
      sub_1BF8CC048();
      sub_1BF8CBAC8();
      swift_getWitnessTable();
      OUTLINED_FUNCTION_20_1();
      sub_1BF8CBAC8();
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_7();
      sub_1BF88DB44(v29);
      sub_1BF88DB44(v28);
      sub_1BF88E238(v27);
      return v30[0];
    case 0x1CuLL:
      return v2;
    case 0x1DuLL:
      uint64_t v2 = 1819044198;
      switch(__ROR8__(v1 + 0x1FFFFFFFFFFFFFFCLL, 3))
      {
        case 1:
          uint64_t v2 = 0x69466F54657A6973;
          break;
        case 2:
          uint64_t v2 = 0x656C626978656C66;
          break;
        case 3:
          uint64_t v2 = 1869768058;
          break;
        default:
          return v2;
      }
      return v2;
    default:
      uint64_t v3 = 0x61746E6563726570;
      unint64_t v4 = 0xEB00000000286567;
LABEL_14:
      v30[0] = v3;
      v30[1] = v4;
LABEL_43:
      sub_1BF8CBC48();
LABEL_44:
      sub_1BF8CBAC8();
      swift_bridgeObjectRelease();
LABEL_45:
      OUTLINED_FUNCTION_0_7();
      return v30[0];
  }
}

unint64_t *sub_1BF8C38C8(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF88E13C(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_1BF8C38FC(unint64_t *a1)
{
  return sub_1BF88DB44(*a1);
}

unint64_t *sub_1BF8C3904(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1BF88E13C(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_1BF88DB44(v4);
  return a1;
}

unint64_t *sub_1BF8C3940(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_1BF88DB44(v3);
  return a1;
}

uint64_t sub_1BF8C3974(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x63 && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 98;
    }
    else
    {
      unsigned int v2 = ((((*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7) >> 2) & 0xFFFFFF9F | (32 * (*(void *)a1 & 3))) ^ 0x7F;
      if (v2 >= 0x62) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1BF8C39C8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x62)
  {
    *(void *)uint64_t result = a2 - 99;
    if (a3 >= 0x63) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x63) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 5) & 3 | (4 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BF8C3A18(void *a1)
{
  unsigned int v1 = (*a1 >> 59) & 0x1E | (*a1 >> 2) & 1;
  if (v1 <= 0x1C) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 29;
  }
}

void *sub_1BF8C3A3C(void *result)
{
  *result &= 0xFFFFFFFFFFFFFFBuLL;
  return result;
}

unint64_t *sub_1BF8C3A50(unint64_t *result, uint64_t a2)
{
  if (a2 < 0x1D) {
    unint64_t v2 = (a2 << 59) & 0xF000000000000000 | (4 * (a2 & 1)) | *result & 0xFFFFFFFFFFFFFF8;
  }
  else {
    unint64_t v2 = (8 * (a2 - 29)) | 0xE000000000000004;
  }
  *uint64_t result = v2;
  return result;
}

uint64_t type metadata accessor for Sizing()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF8C3AA0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void *sub_1BF8C3AD8(uint64_t a1)
{
  return sub_1BF8C2CA0(a1, *(void *(**)(unint64_t *__return_ptr))(v1 + 32));
}

uint64_t sub_1BF8C3AF8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x1F4186498](v0, 96, 7);
}

ValueMetadata *type metadata accessor for PercentageFillSpacing()
{
  return &type metadata for PercentageFillSpacing;
}

uint64_t getEnumTagSinglePayload for PercentageFillSizer(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for PercentageFillSizer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PercentageFillSizer()
{
  return &type metadata for PercentageFillSizer;
}

void sub_1BF8C3BE0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BF8C3E24(*(void *)(v2 + 8), *(unsigned char *)(v2 + 16), a1, *(double *)v2);
  if (!v3)
  {
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v9;
    *(void *)(v13 + 24) = v10;
    *(void *)(v13 + 32) = v11;
    *(void *)(v13 + 40) = v12;
    if (qword_1EBA90300 != -1) {
      swift_once();
    }
    char v14 = HIBYTE(word_1EBA8F7C8);
    *(unsigned char *)(v13 + 48) = word_1EBA8F7C8;
    *(unsigned char *)(v13 + 49) = v14;
    *a2 = v13;
  }
}

double sub_1BF8C3CB4(uint64_t a1, double a2, double a3)
{
  double v3 = 0.0;
  if (a2 > 0.0)
  {
    CGFloat v6 = *(double *)(a1 + 96);
    CGFloat v7 = *(double *)(a1 + 104);
    CGFloat v9 = *(double *)(a1 + 112);
    double v8 = *(double *)(a1 + 120);
    CGFloat rect = v8;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    CGFloat v12 = v9;
    if (*(unsigned char *)(a1 + 48))
    {
      CGRectGetHeight(*(CGRect *)&v10);
      swift_beginAccess();
      double v3 = *(double *)(a1 + 488);
      v17.origin.CGFloat x = v6;
      v17.origin.CGFloat y = v7;
      v17.size.CGFloat width = v9;
      v17.size.CGFloat height = rect;
      CGRectGetWidth(v17);
    }
    else
    {
      CGRectGetWidth(*(CGRect *)&v10);
      swift_beginAccess();
      double v13 = *(double *)(a1 + 488);
      double v14 = -0.0;
      if (*(double *)(a1 + 16) < v13) {
        double v14 = a3;
      }
      double v3 = floor(v13 + v14);
      v18.origin.CGFloat x = v6;
      v18.origin.CGFloat y = v7;
      v18.size.CGFloat width = v9;
      v18.size.CGFloat height = rect;
      CGRectGetHeight(v18);
    }
  }
  return v3;
}

void sub_1BF8C3E24(uint64_t a1, char a2, uint64_t a3, double a4)
{
  if (a2)
  {
    double v5 = *(double *)&a1;
LABEL_5:
    sub_1BF8C3CB4(a3, a4, v5);
    return;
  }
  if (*(unsigned char *)(a3 + 328) != 3)
  {
    if (a1)
    {
      if (*(unsigned char *)(a3 + 48))
      {
        double v5 = *(double *)(a3 + 360);
        goto LABEL_5;
      }
    }
    else if ((*(unsigned char *)(a3 + 48) & 1) == 0)
    {
      double v5 = *(double *)(a3 + 344);
      goto LABEL_5;
    }
    sub_1BF891F44();
    swift_allocError();
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = 4;
    goto LABEL_12;
  }
  sub_1BF891F44();
  swift_allocError();
  *(void *)(v4 + 16) = 0;
  *(void *)uint64_t v4 = 0;
LABEL_12:
  *(void *)(v4 + 8) = 0;
  *(unsigned char *)(v4 + 24) = 7;
  swift_willThrow();
}

void sub_1BF8C3EF4(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_1BF8C3F0C()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

BOOL static Direction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1BF8C3F34@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  int v3 = *v2;
  if (*v2 && v3 != 1) {
    LOBYTE(v3) = *(unsigned char *)(result + 48);
  }
  *a2 = v3;
  return result;
}

uint64_t Direction.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t Direction.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

BOOL static BoxDirection.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t BoxDirection.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t BoxDirection.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

unint64_t sub_1BF8C4068()
{
  unint64_t result = qword_1EA1705E0;
  if (!qword_1EA1705E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1705E0);
  }
  return result;
}

unint64_t sub_1BF8C40B8()
{
  unint64_t result = qword_1EA1705E8;
  if (!qword_1EA1705E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1705E8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Direction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C41D0);
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

ValueMetadata *type metadata accessor for Direction()
{
  return &type metadata for Direction;
}

unsigned char *storeEnumTagSinglePayload for BoxDirection(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C42D4);
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

ValueMetadata *type metadata accessor for BoxDirection()
{
  return &type metadata for BoxDirection;
}

double CGPoint.replace(y:)(double a1, double a2)
{
  return a2;
}

double static CGPoint.- infix(_:_:)(double a1, double a2, double a3)
{
  return a1 - a3;
}

double static CGPoint.+ infix(_:_:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

void *sub_1BF8C433C(uint64_t a1, uint64_t a2)
{
  unint64_t result = (void *)swift_allocObject();
  result[4] = 0;
  result[5] = 0;
  result[2] = a1;
  result[3] = a2;
  return result;
}

uint64_t sub_1BF8C4380()
{
  type metadata accessor for ListBuilder();
  uint64_t v1 = sub_1BF8C4A38();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 16))(v1, v2, v3, v4);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v5;
}

uint64_t sub_1BF8C442C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 32);
  if (v1)
  {
    type metadata accessor for ListBuilder();
    swift_retain();
    uint64_t v2 = sub_1BF8C4A38();
    v1(v2, v3, v4, v5);
    sub_1BF8901F4((uint64_t)v1);
    swift_beginAccess();
    uint64_t v6 = *(void *)(v2 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
    type metadata accessor for Node();
    return sub_1BF8CBBD8();
  }
  return v6;
}

uint64_t IfBuilder.else(elseBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  sub_1BF8901F4(v3);
  return swift_retain();
}

uint64_t IfBuilder.deinit()
{
  swift_release();
  sub_1BF8901F4(*(void *)(v0 + 32));
  return v0;
}

uint64_t IfBuilder.__deallocating_deinit()
{
  IfBuilder.deinit();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t sub_1BF8C45B8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for IfBuilder()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for IfBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IfBuilder);
}

uint64_t CursorFrame.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double CursorFrame.frame.getter()
{
  return *(double *)(v0 + 16);
}

void CursorFrame.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 48);
}

uint64_t CursorFrame.pass.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  *a1 = *(void *)(v1 + 56);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t CursorFrame.resizing.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 72);
  return swift_retain();
}

uint64_t destroy for CursorFrame()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for CursorFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CursorFrame(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for CursorFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CursorFrame(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
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

uint64_t storeEnumTagSinglePayload for CursorFrame(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CursorFrame()
{
  return &type metadata for CursorFrame;
}

double Ratio.Aspect.multiplier.getter()
{
  if (v0[8]) {
    return dbl_1BF8D05A8[*(void *)v0];
  }
  else {
    return *(double *)v0;
  }
}

uint64_t Ratio.Aspect.description.getter()
{
  if (*(unsigned char *)(v0 + 8) != 1) {
    return sub_1BF8CBC48();
  }
  uint64_t result = 3226161;
  switch(*(void *)v0)
  {
    case 1:
      uint64_t result = 3357236;
      break;
    case 2:
      uint64_t result = 3422771;
      break;
    case 3:
      uint64_t result = 960116273;
      break;
    case 4:
      uint64_t result = 0x30313A3631;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8C49E8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 6;
}

uint64_t sub_1BF8C49F4(uint64_t result)
{
  *(unsigned char *)(result + 8) &= 0x3Fu;
  return result;
}

uint64_t sub_1BF8C4A04(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for Ratio()
{
  return &type metadata for Ratio;
}

ValueMetadata *type metadata accessor for Ratio.Aspect()
{
  return &type metadata for Ratio.Aspect;
}

uint64_t sub_1BF8C4A38()
{
  uint64_t v0 = swift_allocObject();
  sub_1BF8C4B5C();
  return v0;
}

Swift::Void __swiftcall ListBuilder.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ListBuilder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ListBuilder.__deallocating_deinit()
{
  ListBuilder.deinit();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BF8C4B5C()
{
  type metadata accessor for Node();
  *(void *)(v0 + 16) = sub_1BF8CBBD8();
  return v0;
}

uint64_t sub_1BF8C4BB8()
{
  return ListBuilder.add(node:)();
}

uint64_t ListBuilder.add(node:)()
{
  return swift_endAccess();
}

uint64_t sub_1BF8C4C84()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ListBuilder()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for ListBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ListBuilder);
}

uint64_t dispatch thunk of CursorFrameDebugging.frames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CursorFrameDebugging.add(identifier:frame:kind:pass:resizing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of CursorFrameDebugging.region(origin:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CursorFrameDebugging.commit<A>(cursor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_1BF8C4D4C(double a1, double a2)
{
  OUTLINED_FUNCTION_0_37();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_1BF89C654();
  uint64_t v5 = *(void *)(*(void *)(v2 + 16) + 16);
  sub_1BF89C6C8(v5);
  OUTLINED_FUNCTION_2_25(v5 + 1);
  *(double *)(v6 + 48) = a1;
  *(double *)(v6 + 56) = a2;
  OUTLINED_FUNCTION_1_27(v6);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C4E20@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v7 = type metadata accessor for CursorFrameContainerRegion();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(double *)(v8 + 16) = a2;
  *(double *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = v3;
  *(void *)(v8 + 40) = v9;
  a1[3] = v7;
  a1[4] = (uint64_t)&off_1F1B0AA78;
  *a1 = v8;
  return swift_retain();
}

uint64_t sub_1BF8C4EA0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for CursorFrameContainer()
{
  return self;
}

uint64_t sub_1BF8C4EFC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BF8C4F08(double a1, double a2)
{
  return sub_1BF8C4D4C(a1, a2);
}

uint64_t sub_1BF8C4F2C@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return sub_1BF8C4E20(a1, a2, a3);
}

uint64_t sub_1BF8C4F50()
{
  OUTLINED_FUNCTION_0_37();
  double v2 = *(double *)(v0 + 16) + v1;
  double v4 = *(double *)(v0 + 24) + v3;
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_1BF89C654();
  uint64_t v5 = *(void *)(*(void *)(v0 + 40) + 16);
  sub_1BF89C6C8(v5);
  OUTLINED_FUNCTION_2_25(v5 + 1);
  *(double *)(v6 + 48) = v2;
  *(double *)(v6 + 56) = v4;
  OUTLINED_FUNCTION_1_27(v6);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C5028@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v5 = *v3;
  double v6 = *((double *)v3 + 2) + a2;
  double v7 = *((double *)v3 + 3) + a3;
  uint64_t v8 = v3[4];
  uint64_t v9 = v5;
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4FBC860];
  *(double *)(v10 + 16) = v6;
  *(double *)(v10 + 24) = v7;
  *(void *)(v10 + 32) = v8;
  *(void *)(v10 + 40) = v11;
  a1[3] = v9;
  a1[4] = (uint64_t)&off_1F1B0AA78;
  *a1 = v10;
  return swift_retain();
}

uint64_t sub_1BF8C50D4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + 16);
  if (v1)
  {
    uint64_t v2 = swift_bridgeObjectRetain() + 56;
    do
    {
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_0();
      sub_1BF8A3044();
      swift_bridgeObjectRetain();
      swift_retain();
      double v3 = OUTLINED_FUNCTION_0();
      sub_1BF8C4D4C(v3, v4);
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v2 += 80;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
    uint64_t v0 = v6;
  }
  *(void *)(v0 + 40) = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C5240()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF8C5268()
{
  sub_1BF8C5240();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t type metadata accessor for CursorFrameContainerRegion()
{
  return self;
}

uint64_t sub_1BF8C52C0()
{
  return sub_1BF8C4F50();
}

uint64_t sub_1BF8C52E4@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return sub_1BF8C5028(a1, a2, a3);
}

uint64_t sub_1BF8C5308()
{
  return sub_1BF8C50D4();
}

unint64_t + infix<A>(_:_:)@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unint64_t v5 = *a1;
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  unint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  switch(*(unsigned char *)(a2 + 32))
  {
    case 1:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v24 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v24, v25, v26, v27, v28, v29);
      *(void *)(v23 + 40) = OUTLINED_FUNCTION_14_2();
      *(void *)(v23 + 48) = &off_1F1B09268;
      uint64_t v30 = swift_allocObject();
      OUTLINED_FUNCTION_13_4(v30);
      char v34 = 0;
      goto LABEL_38;
    case 2:
      uint64_t v35 = OUTLINED_FUNCTION_10();
      uint64_t v36 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v36, v37, v38, v39, v40, v41);
      *(void *)(v35 + 40) = &type metadata for OffsetSizer;
      *(void *)(v35 + 48) = &off_1F1B07CA8;
      goto LABEL_6;
    case 3:
      uint64_t v35 = OUTLINED_FUNCTION_10();
      uint64_t v42 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v42, v43, v44, v45, v46, v47);
      *(void *)(v35 + 40) = &type metadata for OffsetScaleSizer;
      *(void *)(v35 + 48) = &off_1F1B0B4F0;
LABEL_6:
      uint64_t v48 = swift_allocObject();
      *(void *)(v35 + 16) = v48;
      unint64_t result = sub_1BF8985E0(v240, v48 + 16);
      *(void *)(v48 + 56) = v6;
      *(void *)(v48 + 64) = v7;
      goto LABEL_21;
    case 4:
      uint64_t v35 = OUTLINED_FUNCTION_10();
      uint64_t v49 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v49, v50, v51, v52, v53, v54);
      *(void *)(v35 + 40) = &type metadata for SizeAdjustSizer;
      *(void *)(v35 + 48) = &off_1F1B0B138;
      goto LABEL_20;
    case 5:
      uint64_t v35 = OUTLINED_FUNCTION_10();
      uint64_t v55 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v55, v56, v57, v58, v59, v60);
      *(void *)(v35 + 40) = &type metadata for SizeAdjustSizer;
      *(void *)(v35 + 48) = &off_1F1B0B138;
      uint64_t v61 = OUTLINED_FUNCTION_6_12();
      *(void *)(v35 + 16) = v61;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v61 + 16);
      *(unsigned char *)(v61 + 64) = v7 | 0x20;
      goto LABEL_21;
    case 6:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v62 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v62, v63, v64, v65, v66, v67);
      *(void *)(v23 + 40) = &type metadata for MinMaxSizer;
      *(void *)(v23 + 48) = &off_1F1B0A010;
      uint64_t v68 = OUTLINED_FUNCTION_6_12();
      *(void *)(v23 + 16) = v68;
      unint64_t result = sub_1BF8985E0(v240, v68 + 16);
      *(void *)(v68 + 56) = v6;
      *(unsigned char *)(v68 + 64) = 0;
      goto LABEL_39;
    case 7:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v69 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v69, v70, v71, v72, v73, v74);
      *(void *)(v23 + 40) = &type metadata for MinMaxSizer;
      *(void *)(v23 + 48) = &off_1F1B0A010;
      uint64_t v75 = OUTLINED_FUNCTION_6_12();
      *(void *)(v23 + 16) = v75;
      unint64_t result = sub_1BF8985E0(v240, v75 + 16);
      *(void *)(v75 + 56) = v6;
      char v76 = 1;
      goto LABEL_13;
    case 8:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v77 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v77, v78, v79, v80, v81, v82);
      *(void *)(v23 + 40) = &type metadata for MinMaxSizer;
      *(void *)(v23 + 48) = &off_1F1B0A010;
      uint64_t v75 = OUTLINED_FUNCTION_6_12();
      *(void *)(v23 + 16) = v75;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v75 + 16);
      char v76 = 2;
      goto LABEL_13;
    case 9:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v83 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v83, v84, v85, v86, v87, v88);
      *(void *)(v23 + 40) = &type metadata for MinMaxSizer;
      *(void *)(v23 + 48) = &off_1F1B0A010;
      uint64_t v75 = OUTLINED_FUNCTION_6_12();
      *(void *)(v23 + 16) = v75;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v75 + 16);
      char v76 = 3;
LABEL_13:
      *(unsigned char *)(v75 + 64) = v76;
      goto LABEL_39;
    case 0xA:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v89 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v89, v90, v91, v92, v93, v94);
      *(void *)(v23 + 40) = &type metadata for SizeScaleSizer;
      *(void *)(v23 + 48) = &off_1F1B0B2D0;
      uint64_t v95 = OUTLINED_FUNCTION_15_3();
      *(void *)(v23 + 16) = v95;
      unint64_t result = sub_1BF8985E0(v240, v95 + 16);
      *(void *)(v95 + 56) = v6;
      __int16 v96 = 1;
      goto LABEL_18;
    case 0xB:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v97 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v97, v98, v99, v100, v101, v102);
      *(void *)(v23 + 40) = &type metadata for SizeScaleSizer;
      *(void *)(v23 + 48) = &off_1F1B0B2D0;
      uint64_t v103 = OUTLINED_FUNCTION_15_3();
      *(void *)(v23 + 16) = v103;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v103 + 16);
      *(_WORD *)(v103 + 64) = 0;
      goto LABEL_39;
    case 0xC:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v104 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v104, v105, v106, v107, v108, v109);
      *(void *)(v23 + 40) = &type metadata for SizeScaleSizer;
      *(void *)(v23 + 48) = &off_1F1B0B2D0;
      uint64_t v95 = OUTLINED_FUNCTION_15_3();
      *(void *)(v23 + 16) = v95;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v95 + 16);
      __int16 v96 = 257;
      goto LABEL_18;
    case 0xD:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v110 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v110, v111, v112, v113, v114, v115);
      *(void *)(v23 + 40) = &type metadata for SizeScaleSizer;
      *(void *)(v23 + 48) = &off_1F1B0B2D0;
      uint64_t v95 = OUTLINED_FUNCTION_15_3();
      *(void *)(v23 + 16) = v95;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v95 + 16);
      __int16 v96 = 256;
LABEL_18:
      *(_WORD *)(v95 + 64) = v96;
      goto LABEL_39;
    case 0xE:
      uint64_t v35 = OUTLINED_FUNCTION_10();
      uint64_t v116 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v116, v117, v118, v119, v120, v121);
      *(void *)(v35 + 40) = &type metadata for MinRatioSizer;
      *(void *)(v35 + 48) = &off_1F1B05990;
LABEL_20:
      uint64_t v122 = OUTLINED_FUNCTION_6_12();
      *(void *)(v35 + 16) = v122;
      unint64_t result = OUTLINED_FUNCTION_16_3(v240, v122 + 16);
      *(unsigned char *)(v122 + 64) = v7;
LABEL_21:
      unint64_t v22 = v35 | 0xD000000000000000;
      goto LABEL_61;
    case 0xF:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      id v123 = (id)v6;
      OUTLINED_FUNCTION_3_20((uint64_t)v123, v124, v125, v126, v127);
      long long v238 = 0uLL;
      goto LABEL_24;
    case 0x10:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      id v128 = (id)v6;
      OUTLINED_FUNCTION_3_20((uint64_t)v128, v129, v130, v131, v132);
      long long v238 = xmmword_1BF8D06D0;
LABEL_24:
      char v133 = 4;
      goto LABEL_36;
    case 0x11:
      uint64_t v134 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_19_3();
      id v135 = (id)v8;
      OUTLINED_FUNCTION_4_19((uint64_t)v135, v136, v137, v138, v139);
      *(void *)&long long v238 = v6;
      *((void *)&v238 + 1) = v7;
      char v239 = 0;
      goto LABEL_28;
    case 0x12:
      uint64_t v134 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_19_3();
      id v140 = (id)v8;
      OUTLINED_FUNCTION_4_19((uint64_t)v140, v141, v142, v143, v144);
      *(void *)&long long v238 = v6;
      *((void *)&v238 + 1) = v7;
      char v239 = 0;
      goto LABEL_30;
    case 0x13:
      uint64_t v134 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_19_3();
      id v145 = (id)v8;
      OUTLINED_FUNCTION_4_19((uint64_t)v145, v146, v147, v148, v149);
      *(void *)&long long v238 = v6;
      *((void *)&v238 + 1) = v7;
      char v239 = 1;
LABEL_28:
      *(void *)(v134 + 40) = OUTLINED_FUNCTION_12_4();
      *(void *)(v134 + 48) = &off_1F1B060A0;
      uint64_t v150 = swift_allocObject();
      OUTLINED_FUNCTION_10_6(v150);
      char v155 = 0;
      goto LABEL_31;
    case 0x14:
      uint64_t v134 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_19_3();
      id v156 = (id)v8;
      OUTLINED_FUNCTION_4_19((uint64_t)v156, v157, v158, v159, v160);
      *(void *)&long long v238 = v6;
      *((void *)&v238 + 1) = v7;
      char v239 = 1;
LABEL_30:
      *(void *)(v134 + 40) = OUTLINED_FUNCTION_12_4();
      *(void *)(v134 + 48) = &off_1F1B060A0;
      uint64_t v161 = swift_allocObject();
      OUTLINED_FUNCTION_10_6(v161);
      char v155 = 1;
LABEL_31:
      unint64_t result = sub_1BF897300(v151, v152, v153, v155, v154);
      goto LABEL_41;
    case 0x15:
      uint64_t v162 = OUTLINED_FUNCTION_10();
      uint64_t v163 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v163, v164, v165, v166, v167, v168);
      *(void *)(v162 + 40) = &type metadata for TextLinesSizer;
      *(void *)(v162 + 48) = &off_1F1B07AC0;
      uint64_t v169 = OUTLINED_FUNCTION_6_12();
      *(void *)(v162 + 16) = v169;
      unint64_t result = sub_1BF8985E0(v240, v169 + 16);
      *(void *)(v169 + 56) = v6;
      *(unsigned char *)(v169 + 64) = 0;
      goto LABEL_60;
    case 0x16:
      uint64_t v162 = OUTLINED_FUNCTION_10();
      uint64_t v170 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v170, v171, v172, v173, v174, v175);
      *(void *)(v162 + 40) = &type metadata for TextLinesSizer;
      *(void *)(v162 + 48) = &off_1F1B07AC0;
      uint64_t v176 = OUTLINED_FUNCTION_6_12();
      *(void *)(v162 + 16) = v176;
      unint64_t result = sub_1BF8985E0(v240, v176 + 16);
      *(void *)(v176 + 56) = v6;
      *(unsigned char *)(v176 + 64) = 1;
      goto LABEL_60;
    case 0x17:
      uint64_t v177 = *(void *)(a2 + 8) & 1;
      uint64_t v23 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      id v178 = (id)v6;
      OUTLINED_FUNCTION_3_20((uint64_t)v178, v179, v180, v181, v182);
      long long v238 = (unint64_t)v177;
      char v133 = 2;
      goto LABEL_36;
    case 0x18:
      uint64_t v183 = *(void *)(a2 + 8) & 1;
      uint64_t v23 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_0_38();
      id v184 = (id)v6;
      OUTLINED_FUNCTION_3_20((uint64_t)v184, v185, v186, v187, v188);
      long long v238 = (unint64_t)v183;
      char v133 = 3;
LABEL_36:
      char v239 = v133;
      *(void *)(v23 + 40) = OUTLINED_FUNCTION_12_4();
      *(void *)(v23 + 48) = &off_1F1B060A0;
      uint64_t v189 = swift_allocObject();
      *(void *)(v23 + 16) = v189;
      unint64_t result = sub_1BF897300(v240, v6, (uint64_t *)&v238, 0, v189 + 16);
      goto LABEL_39;
    case 0x19:
      uint64_t v23 = OUTLINED_FUNCTION_10();
      uint64_t v190 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v190, v191, v192, v193, v194, v195);
      *(void *)(v23 + 40) = OUTLINED_FUNCTION_14_2();
      *(void *)(v23 + 48) = &off_1F1B09268;
      uint64_t v196 = swift_allocObject();
      OUTLINED_FUNCTION_13_4(v196);
      char v34 = 1;
LABEL_38:
      unint64_t result = sub_1BF8B6150(v31, v32, v34, v33);
LABEL_39:
      unint64_t v22 = v23 | 0xD000000000000000;
      goto LABEL_61;
    case 0x1A:
      uint64_t v134 = OUTLINED_FUNCTION_10();
      uint64_t v197 = OUTLINED_FUNCTION_0_38();
      swift_bridgeObjectRetain();
      sub_1BF8C2410(v197, (uint64_t)v240);
      *(void *)(v134 + 40) = &type metadata for ResizeConstrainingSizer;
      *(void *)(v134 + 48) = &off_1F1B07520;
      uint64_t v198 = swift_allocObject();
      *(void *)(v134 + 16) = v198;
      unint64_t result = sub_1BF8985E0(v240, v198 + 16);
      *(unsigned char *)(v198 + 56) = v6 & 1;
      *(void *)(v198 + 64) = v7;
      *(void *)(v198 + 72) = v8;
LABEL_41:
      unint64_t v22 = v134 | 0xD000000000000000;
      goto LABEL_61;
    case 0x1B:
      uint64_t v199 = OUTLINED_FUNCTION_10();
      v200 = (void *)OUTLINED_FUNCTION_10();
      v200[2] = a3;
      v200[3] = a4;
      v200[4] = v6;
      v200[5] = v7;
      v200[6] = v5;
      v237 = (void *)v6;
      v201 = a5;
      uint64_t v202 = nullsub_1(sub_1BF8C614C);
      uint64_t v204 = v203;
      *(void *)(v199 + 40) = type metadata accessor for DynamicSizer();
      *(void *)(v199 + 48) = &off_1F1B07C10;
      *(void *)(v199 + 16) = v202;
      *(void *)(v199 + 24) = v204;
      unint64_t *v201 = v199 | 0xD000000000000000;
      sub_1BF8B5DB0(v237, v7, (void *)v8, v9, 27);
      return sub_1BF88E13C(v5);
    case 0x1C:
      uint64_t v162 = OUTLINED_FUNCTION_10();
      uint64_t v205 = OUTLINED_FUNCTION_0_38();
      swift_retain();
      sub_1BF8C2410(v205, (uint64_t)v240);
      *(void *)(v162 + 40) = &type metadata for GeometrySizer;
      *(void *)(v162 + 48) = &off_1F1B08340;
      uint64_t v206 = swift_allocObject();
      *(void *)(v162 + 16) = v206;
      unint64_t result = sub_1BF8985E0(v240, v206 + 16);
      *(void *)(v206 + 56) = v6;
      *(void *)(v206 + 64) = v7;
      goto LABEL_60;
    case 0x1D:
      if (v8 | v7 | v6 | v9)
      {
        unint64_t v207 = v8 | v7 | v9;
        if (v6 == 1 && v207 == 0)
        {
          uint64_t v162 = OUTLINED_FUNCTION_10();
          uint64_t v224 = OUTLINED_FUNCTION_0_38();
          OUTLINED_FUNCTION_2_26(v224, v225, v226, v227, v228, v229);
          *(void *)(v162 + 40) = &type metadata for ResizeSizer;
          *(void *)(v162 + 48) = &off_1F1B06310;
        }
        else
        {
          if (v6 != 2 || v207 != 0)
          {
            uint64_t v210 = swift_allocObject();
            uint64_t v211 = OUTLINED_FUNCTION_0_38();
            OUTLINED_FUNCTION_2_26(v211, v212, v213, v214, v215, v216);
            *(void *)(v210 + 40) = &type metadata for ClipToBoundsSizer;
            *(void *)(v210 + 48) = &off_1F1B09578;
            uint64_t v217 = OUTLINED_FUNCTION_10();
            *(void *)(v210 + 16) = v217;
            unint64_t result = sub_1BF8985E0(v240, v217 + 16);
            unint64_t v22 = v210 | 0xD000000000000000;
            goto LABEL_61;
          }
          uint64_t v162 = swift_allocObject();
          uint64_t v230 = OUTLINED_FUNCTION_0_38();
          OUTLINED_FUNCTION_2_26(v230, v231, v232, v233, v234, v235);
          *(void *)(v162 + 40) = &type metadata for NonIntegralSizer;
          *(void *)(v162 + 48) = &off_1F1B069F8;
        }
      }
      else
      {
        uint64_t v162 = OUTLINED_FUNCTION_10();
        uint64_t v218 = OUTLINED_FUNCTION_0_38();
        OUTLINED_FUNCTION_2_26(v218, v219, v220, v221, v222, v223);
        *(void *)(v162 + 40) = &type metadata for InvertSizer;
        *(void *)(v162 + 48) = &off_1F1B07658;
      }
      uint64_t v236 = OUTLINED_FUNCTION_10();
      *(void *)(v162 + 16) = v236;
      unint64_t result = sub_1BF8985E0(v240, v236 + 16);
LABEL_60:
      unint64_t v22 = v162 | 0xD000000000000000;
LABEL_61:
      *a5 = v22;
      return result;
    default:
      uint64_t v13 = OUTLINED_FUNCTION_10();
      uint64_t v14 = OUTLINED_FUNCTION_0_38();
      OUTLINED_FUNCTION_2_26(v14, v15, v16, v17, v18, v19);
      *(void *)(v13 + 40) = &type metadata for InsetSizer;
      *(void *)(v13 + 48) = &off_1F1B0A160;
      uint64_t v20 = (void *)swift_allocObject();
      *(void *)(v13 + 16) = v20;
      unint64_t result = sub_1BF8985E0(v240, (uint64_t)(v20 + 2));
      v20[7] = v6;
      v20[8] = v7;
      v20[9] = v8;
      v20[10] = v9;
      unint64_t v22 = v13 | 0xD000000000000000;
      goto LABEL_61;
  }
}

uint64_t sub_1BF8C5F4C()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_13();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BF8C5F7C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

unint64_t sub_1BF8C5FBC@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  unint64_t result = a1();
  if (!v2)
  {
    MEMORY[0x1F4188790](result);
    type metadata accessor for Positioning();
    sub_1BF8CBC38();
    uint64_t v5 = type metadata accessor for Sizing();
    swift_getWitnessTable();
    sub_1BF8CBB08();
    swift_bridgeObjectRelease();
    sub_1BF8C2410(v5, a2);
    return sub_1BF88DB44(v6);
  }
  return result;
}

uint64_t sub_1BF8C610C()
{
  swift_release();
  sub_1BF88DB44(*(void *)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 56, 7);
}

unint64_t sub_1BF8C614C@<X0>(uint64_t a1@<X8>)
{
  return sub_1BF8C5FBC(*(uint64_t (**)(void))(v1 + 32), a1);
}

uint64_t sub_1BF8C6170()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_13();
  return MEMORY[0x1F4186498](v0, 65, 7);
}

uint64_t sub_1BF8C61A0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1BF8C61E0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  sub_1BF8970A8(*(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  return MEMORY[0x1F4186498](v0, 82, 7);
}

uint64_t sub_1BF8C622C()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_13();
  return MEMORY[0x1F4186498](v0, 66, 7);
}

uint64_t sub_1BF8C625C()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_13();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1BF8C628C()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_13();
  return MEMORY[0x1F4186498](v0, 58, 7);
}

uint64_t sub_1BF8C62BC()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_13();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1BF8C62EC(uint64_t *a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *a1;
  long long v3 = *(_OWORD *)(a2 + 16);
  v5[0] = *(_OWORD *)a2;
  v5[1] = v3;
  char v6 = v2;
  return + infix<A>(_:_:)(&v7, v5);
}

uint64_t Positioning.Anchor.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_1BF8CBFF8();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 7;
  if (v2 < 7) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t Positioning.Anchor.rawValue.getter()
{
  uint64_t result = 7368564;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6D6F74746F62;
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_8_6();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_7_11();
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_11_6();
      break;
    case 5:
      uint64_t result = OUTLINED_FUNCTION_9_7();
      break;
    case 6:
      uint64_t result = 0x7265746E656376;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8C6428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1C8];
  return MEMORY[0x1F4185BB0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1BF8C649C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DE0](a1, a2, WitnessTable, v5);
}

uint64_t sub_1BF8C6508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1BF8C6578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DE8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1BF8C65E8@<X0>(char *a1@<X8>)
{
  return Positioning.Anchor.init(rawValue:)(a1);
}

uint64_t sub_1BF8C65F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Positioning.Anchor.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

double sub_1BF8C661C(double a1, double a2)
{
  return a1 + a2;
}

double sub_1BF8C6624(double a1, double a2)
{
  return a1 - a2;
}

double sub_1BF8C662C(double a1, double a2)
{
  return a1 * a2;
}

void PositioningAdjustment.init(integerLiteral:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_1BF8C6640(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1BF8C6648(double *a1)
{
  return PositioningAdjustment.init(floatLiteral:)(*a1);
}

BOOL static PositioningAdjustmentOperator.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PositioningAdjustmentOperator.hash(into:)()
{
  return sub_1BF8CC1B8();
}

uint64_t PositioningAdjustmentOperator.hashValue.getter()
{
  return sub_1BF8CC1D8();
}

uint64_t Positioning.Anchor.description.getter()
{
  uint64_t result = 0x6D6F74746F62;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_8_6();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_7_11();
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_11_6();
      break;
    case 5:
      uint64_t result = OUTLINED_FUNCTION_9_7();
      break;
    case 6:
      uint64_t result = 0x7265746E656376;
      break;
    default:
      uint64_t result = 7368564;
      break;
  }
  return result;
}

uint64_t PositioningAdjustmentOperator.description.getter()
{
  if (*v0) {
    return 0x7463617274627573;
  }
  else {
    return 0x676E69646461;
  }
}

uint64_t sub_1BF8C67B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1BF8C67D4()
{
  return MEMORY[0x1E4FBB450];
}

unint64_t sub_1BF8C67E4()
{
  unint64_t result = qword_1EA1705F0;
  if (!qword_1EA1705F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1705F0);
  }
  return result;
}

void sub_1BF8C6834(uint64_t a1)
{
}

void sub_1BF8C6848(void *a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 15:
    case 16:
    case 23:
    case 24:
      goto LABEL_3;
    case 17:
    case 18:
    case 19:
    case 20:
      swift_bridgeObjectRelease();
      a1 = a3;
LABEL_3:

      break;
    case 26:
      swift_bridgeObjectRelease();
      break;
    case 27:
    case 28:
      swift_release();
      break;
    default:
      return;
  }
}

uint64_t sub_1BF8C6938(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1BF8B5DB0(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t sub_1BF8C699C(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1BF8B5DB0(*(id *)a2, v4, v5, v6, v7);
  unint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void **)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1BF8C6848(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t sub_1BF8C6A10(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_1BF8C6848(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t sub_1BF8C6A5C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xE3 && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 226;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 0x1D) {
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

uint64_t sub_1BF8C6A9C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 - 227;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xE3) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xE3) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF8C6AE4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 0x1Cu) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 29);
  }
}

uint64_t sub_1BF8C6AFC(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x1D)
  {
    *(void *)unint64_t result = a2 - 29;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 29;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

uint64_t type metadata accessor for Positioning()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_1BF8C6B30(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C6BFCLL);
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

uint64_t type metadata accessor for Positioning.Anchor()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for PositioningAdjustment()
{
}

void type metadata accessor for PositioningAmount()
{
}

unsigned char *storeEnumTagSinglePayload for PositioningAdjustmentOperator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C6D20);
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

void type metadata accessor for PositioningAdjustmentOperator()
{
}

uint64_t sub_1BF8C6D54(uint64_t *a1, uint64_t a2)
{
  return sub_1BF8C62EC(a1, a2);
}

uint64_t sub_1BF8C6D90()
{
  return sub_1BF8C7288();
}

uint64_t sub_1BF8C6D9C(uint64_t a1)
{
  return sub_1BF8C6DCC(a1, (void (*)(unsigned char *, uint64_t))sub_1BF8C6FFC);
}

uint64_t sub_1BF8C6DB4(uint64_t a1)
{
  return sub_1BF8C6DCC(a1, (void (*)(unsigned char *, uint64_t))sub_1BF8C7124);
}

uint64_t sub_1BF8C6DCC(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_1BF8CC1A8();
  a2(v5, a1);
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF8C6E1C()
{
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF8C6E70()
{
  OUTLINED_FUNCTION_0_39();
  sub_1BF8CBAB8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C6FE4()
{
  return sub_1BF8CBAB8();
}

uint64_t sub_1BF8C6FFC()
{
  sub_1BF8CBAB8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C7124()
{
  OUTLINED_FUNCTION_0_39();
  sub_1BF8CBAB8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF8C71BC(uint64_t a1, uint64_t a2)
{
  return sub_1BF8C71EC(a1, a2, (void (*)(unsigned char *, uint64_t))sub_1BF8C7124);
}

uint64_t sub_1BF8C71D4(uint64_t a1, uint64_t a2)
{
  return sub_1BF8C71EC(a1, a2, (void (*)(unsigned char *, uint64_t))sub_1BF8C6FFC);
}

uint64_t sub_1BF8C71EC(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_1BF8CC1A8();
  a3(v6, a2);
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF8C7238()
{
  return sub_1BF8CC1D8();
}

uint64_t sub_1BF8C7288()
{
  return sub_1BF8CC1D8();
}

uint64_t SizerResultMetadataKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BF8CBFF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t SizerResultMetadataKey.rawValue.getter()
{
  return 0x74786554746C61;
}

uint64_t sub_1BF8C7360@<X0>(BOOL *a1@<X8>)
{
  return SizerResultMetadataKey.init(rawValue:)(a1);
}

void sub_1BF8C736C(void *a1@<X8>)
{
  *a1 = 0x74786554746C61;
  a1[1] = 0xE700000000000000;
}

unint64_t sub_1BF8C738C()
{
  unint64_t result = qword_1EBA906D8;
  if (!qword_1EBA906D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA906D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SizerResultMetadataKey(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SizerResultMetadataKey(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF8C74D4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SizerResultMetadataKey()
{
  return &type metadata for SizerResultMetadataKey;
}

ValueMetadata *type metadata accessor for SizeAdjustSizer()
{
  return &type metadata for SizeAdjustSizer;
}

void *sub_1BF8C751C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v6 + 24);
  uint64_t v13 = *(void *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v6, v12);
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(&v20, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = v20;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(void *)(v6 + 40);
    char v18 = *(unsigned char *)(v6 + 48);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a1;
    *(void *)(v19 + 24) = v17;
    *(unsigned char *)(v19 + 32) = v18;
    *(void *)(v16 + 24) = sub_1BF8C790C;
    *(void *)(v16 + 32) = v19;
    *a4 = v16 | 0x6000000000000000;
    return (void *)swift_retain();
  }
  return result;
}

void sub_1BF8C7658(uint64_t a1@<X1>, double a2@<X2>, unsigned __int8 a3@<W3>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  double v15 = sub_1BF8C7714(a1);
  uint64_t v17 = (double (*)(double, __n128, __n128))*(&off_1F1B0B230 + (a3 >> 6));
  v18.n128_f64[0] = a2;
  if (a2 == 0.0) {
    double v15 = v16.n128_f64[0];
  }
  if (a3) {
    v16.n128_f64[0] = v15;
  }
  else {
    v16.n128_f64[0] = a2;
  }
  if ((a3 & 0x20) != 0) {
    a8 = v17(a8, v16, v18);
  }
  else {
    a7 = v17(a7, v16, v18);
  }
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(double *)(a4 + 16) = a7;
  *(double *)(a4 + 24) = a8;
  *(unsigned char *)(a4 + 32) = 1;
}

double sub_1BF8C7714(uint64_t a1)
{
  double result = 0.0;
  if (*(unsigned char *)(a1 + 328) != 3) {
    return *(double *)(a1 + 344);
  }
  return result;
}

void *sub_1BF8C7734@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8C751C(a1, a2, a3, a4);
}

uint64_t sub_1BF8C774C()
{
  return 0;
}

uint64_t sub_1BF8C7890()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8C78D4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 33, 7);
}

void sub_1BF8C790C(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  sub_1BF8C7658(*(void *)(v5 + 16), *(double *)(v5 + 24), *(unsigned char *)(v5 + 32), a1, a2, a3, a4, a5);
}

uint64_t getEnumTagSinglePayload for SizeAdjustSizer.Adjust(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x1F && *(unsigned char *)(a1 + 9))
    {
      unsigned int v2 = *(_DWORD *)a1 + 30;
    }
    else
    {
      unsigned int v2 = (*(unsigned char *)(a1 + 8) & 0x1E | (*(unsigned __int8 *)(a1 + 8) >> 5) & 1) ^ 0x1F;
      if (v2 >= 0x1E) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SizeAdjustSizer.Adjust(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1E)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)double result = a2 - 31;
    if (a3 >= 0x1F) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1F) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)double result = 0;
      *(unsigned char *)(result + 8) = 2 * ((((-a2 >> 1) & 0xF) - 16 * a2) & 0x1F);
    }
  }
  return result;
}

uint64_t sub_1BF8C79B4(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 5) & 1;
}

uint64_t sub_1BF8C79C0(uint64_t result)
{
  *(unsigned char *)(result + 8) &= ~0x20u;
  return result;
}

uint64_t sub_1BF8C79D0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 0xC1 | (32 * (a2 & 1));
  return result;
}

ValueMetadata *type metadata accessor for SizeAdjustSizer.Adjust()
{
  return &type metadata for SizeAdjustSizer.Adjust;
}

uint64_t dispatch thunk of FastLayoutDecodable.fastDecode(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeWithCopy for SizeScaleSizer(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for SizeScaleSizer(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SizeScaleSizer(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for SizeScaleSizer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 50))
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

uint64_t storeEnumTagSinglePayload for SizeScaleSizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 50) = 1;
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
    *(unsigned char *)(result + 50) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeScaleSizer()
{
  return &type metadata for SizeScaleSizer;
}

uint64_t sub_1BF8C7BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    long long v3 = (char *)(a1 + 48);
    do
    {
      unint64_t v4 = *((void *)v3 - 2);
      uint64_t v5 = *((void *)v3 - 1);
      char v6 = *v3;
      v3 += 24;
      sub_1BF8C8288((uint64_t)&v9, v4, v5, v6);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = a2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1BF8C7C54(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v9 = *a1;
  uint64_t v10 = *(void *)(v5 + 24);
  uint64_t v11 = *(void *)(v5 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v5, v10);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v11 + 8))(a1, a2, a3, *(void *)(v9 + 80), *(void *)(v9 + 88), v10, v11);
  if (!v4)
  {
    uint64_t v13 = result;
    if (*(unsigned char *)(v5 + 49)) {
      uint64_t v14 = &unk_1F1B04970;
    }
    else {
      uint64_t v14 = (void *)MEMORY[0x1E4FBC860];
    }
    return sub_1BF8C7BD8((uint64_t)v14, v13);
  }
  return result;
}

void *sub_1BF8C7D3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v6 + 24);
  uint64_t v13 = *(void *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v6, v12);
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(&v20, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = v20;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(void *)(v6 + 40);
    char v18 = *(unsigned char *)(v6 + 48);
    char v19 = *(unsigned char *)(v6 + 49);
    uint64_t result = (void *)swift_allocObject();
    result[2] = v17;
    *((unsigned char *)result + 24) = v18;
    *((unsigned char *)result + 25) = v19;
    *(void *)(v16 + 24) = sub_1BF8C8248;
    *(void *)(v16 + 32) = result;
    *a4 = v16 | 0x7000000000000000;
  }
  return result;
}

double sub_1BF8C7E78(uint64_t a1, char a2, char a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11 = a4;
  if (*(double *)&a1 <= 0.0) {
    double v12 = 1.0;
  }
  else {
    double v12 = *(double *)&a1;
  }
  if (a2)
  {
    double v16 = v12 * CGRectGetHeight(*(CGRect *)&a4);
    v23.origin.CGFloat x = v11;
    v23.origin.CGFloat y = a5;
    v23.size.CGFloat width = a6;
    v23.size.CGFloat height = a7;
    CGRectGetWidth(v23);
    if (a3)
    {
      v24.origin.CGFloat x = v11;
      v24.origin.CGFloat y = a5;
      v24.size.CGFloat width = a6;
      v24.size.CGFloat height = a7;
      double Height = CGRectGetHeight(v24);
      v25.origin.CGFloat x = v11;
      v25.origin.CGFloat y = a5;
      v25.size.CGFloat width = a6;
      v25.size.CGFloat height = a7;
      double v18 = CGRectGetHeight(v25);
      if (Height >= v16 && v16 < v18)
      {
        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = a5;
        v27.size.CGFloat width = a6;
        v27.size.CGFloat height = a7;
        CGRectGetHeight(v27);
      }
    }
  }
  else
  {
    double v13 = v12 * CGRectGetWidth(*(CGRect *)&a4);
    v20.origin.CGFloat x = v11;
    v20.origin.CGFloat y = a5;
    v20.size.CGFloat width = a6;
    v20.size.CGFloat height = a7;
    CGRectGetHeight(v20);
    if (a3)
    {
      v21.origin.CGFloat x = v11;
      v21.origin.CGFloat y = a5;
      v21.size.CGFloat width = a6;
      v21.size.CGFloat height = a7;
      double Width = CGRectGetWidth(v21);
      v22.origin.CGFloat x = v11;
      v22.origin.CGFloat y = a5;
      v22.size.CGFloat width = a6;
      v22.size.CGFloat height = a7;
      double v15 = CGRectGetWidth(v22);
      if (Width >= v13)
      {
        if (v13 < v15)
        {
          v26.origin.CGFloat x = v11;
          v26.origin.CGFloat y = a5;
          v26.size.CGFloat width = a6;
          v26.size.CGFloat height = a7;
          return (CGRectGetWidth(v26) - v13) * 0.5 + v11;
        }
      }
      else
      {
        return v11 + (v13 - v15) * -0.5;
      }
    }
  }
  return v11;
}

uint64_t sub_1BF8C8030(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8C7C54(a1, a2, a3);
}

void *sub_1BF8C8048@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8C7D3C(a1, a2, a3, a4);
}

uint64_t sub_1BF8C8060()
{
  if (*(unsigned char *)(v0 + 48) != 1)
  {
    if (*(unsigned char *)(v0 + 49)) {
      goto LABEL_3;
    }
LABEL_5:
    OUTLINED_FUNCTION_0_41();
    sub_1BF8CBE78();
    OUTLINED_FUNCTION_1_28();
    OUTLINED_FUNCTION_3_21();
    OUTLINED_FUNCTION_2_27();
    goto LABEL_6;
  }
  if ((*(unsigned char *)(v0 + 49) & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  OUTLINED_FUNCTION_0_41();
  sub_1BF8CBE78();
  OUTLINED_FUNCTION_1_28();
  OUTLINED_FUNCTION_3_21();
LABEL_6:
  sub_1BF8CBAC8();
  sub_1BF8CBC48();
  sub_1BF8CBAC8();
  swift_bridgeObjectRelease();
  sub_1BF8CBAC8();
  return v2;
}

uint64_t sub_1BF8C81F4()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8C8238()
{
  return MEMORY[0x1F4186498](v0, 26, 7);
}

double sub_1BF8C8248(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF8C7E78(*(void *)(v4 + 16), *(unsigned char *)(v4 + 24), *(unsigned char *)(v4 + 25), a1, a2, a3, a4);
}

uint64_t sub_1BF8C826C(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1BF8C8288(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  char v5 = a4;
  uint64_t v9 = *v4;
  int v10 = a4 & 1;
  sub_1BF8CC1A8();
  SizerTrait.hash(into:)();
  uint64_t v11 = sub_1BF8CC1D8();
  uint64_t v12 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    BOOL v15 = v10 != 0;
    BOOL v16 = a2 > 1 && v10 != 0;
    if (a2 ^ 1 | a3) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = v10 != 0;
    }
    if (a2 | a3) {
      BOOL v15 = 0;
    }
    do
    {
      uint64_t v18 = *(void *)(v9 + 48) + 24 * v13;
      double v19 = *(double *)v18;
      double v20 = *(double *)(v18 + 8);
      if (*(unsigned char *)(v18 + 16) == 1)
      {
        if (*(void *)&v19 | *(void *)&v20)
        {
          if (*(void *)&v19 ^ 1 | *(void *)&v20)
          {
            if (v16) {
              goto LABEL_27;
            }
          }
          else if (v17)
          {
            goto LABEL_27;
          }
        }
        else if (v15)
        {
          goto LABEL_27;
        }
      }
      else if (!v10 && v19 == *(double *)&a2 && v20 == *(double *)&a3)
      {
LABEL_27:
        uint64_t result = 0;
        uint64_t v24 = *(void *)(*v4 + 48) + 24 * v13;
        a2 = *(unint64_t *)v24;
        a3 = *(uint64_t *)(v24 + 8);
        char v5 = *(unsigned char *)(v24 + 16);
        goto LABEL_28;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v25 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_1BF8C87B8(a2, a3, v10, v13, isUniquelyReferenced_nonNull_native);
  *uint64_t v4 = v25;
  swift_bridgeObjectRelease();
  uint64_t result = 1;
LABEL_28:
  *(double *)a1 = *(double *)&a2;
  *(double *)(a1 + 8) = *(double *)&a3;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  return result;
}

uint64_t sub_1BF8C8468()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1BF8A2F68();
  uint64_t result = sub_1BF8CBE48();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v31 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v6;
    int64_t v30 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = result + 56;
    if ((v8 & v6) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v11 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v5 << 6))
    {
      uint64_t v16 = *(void *)(v2 + 48) + 24 * i;
      uint64_t v18 = *(void *)v16;
      uint64_t v17 = *(void *)(v16 + 8);
      int v19 = *(unsigned __int8 *)(v16 + 16);
      sub_1BF8CC1A8();
      sub_1BF8CC1B8();
      if (v19 != 1)
      {
        sub_1BF8CC1C8();
        sub_1BF8CC1C8();
      }
      uint64_t result = sub_1BF8CC1D8();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
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
          uint64_t v27 = *(void *)(v10 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_32;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_32:
      *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = *(void *)(v4 + 48) + 24 * v23;
      *(void *)uint64_t v28 = v18;
      *(void *)(v28 + 8) = v17;
      *(unsigned char *)(v28 + 16) = v19;
      ++*(void *)(v4 + 16);
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v13 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_40;
      }
      if (v13 >= v30) {
        goto LABEL_34;
      }
      unint64_t v14 = v31[v13];
      ++v5;
      if (!v14)
      {
        int64_t v5 = v13 + 1;
        if (v13 + 1 >= v30) {
          goto LABEL_34;
        }
        unint64_t v14 = v31[v5];
        if (!v14)
        {
          int64_t v5 = v13 + 2;
          if (v13 + 2 >= v30) {
            goto LABEL_34;
          }
          unint64_t v14 = v31[v5];
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v30)
            {
LABEL_34:
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_1BF8C826C(0, (unint64_t)(v29 + 63) >> 6, v31);
              }
              else {
                *uint64_t v31 = -1 << v29;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v31[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v5 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_41;
                }
                if (v5 >= v30) {
                  goto LABEL_34;
                }
                unint64_t v14 = v31[v5];
                ++v15;
                if (v14) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v15;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v14 - 1) & v14;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1BF8C87B8(uint64_t result, uint64_t a2, unsigned __int8 a3, unint64_t a4, char a5)
{
  double v9 = *(double *)&result;
  unint64_t v10 = *(void *)(*v5 + 16);
  unint64_t v11 = *(void *)(*v5 + 24);
  if (v11 <= v10 || (a5 & 1) == 0)
  {
    if (a5)
    {
      sub_1BF8C8468();
    }
    else
    {
      if (v11 > v10)
      {
        uint64_t result = (uint64_t)sub_1BF8C89B8();
        goto LABEL_26;
      }
      sub_1BF8C8B60();
    }
    uint64_t v12 = *v5;
    sub_1BF8CC1A8();
    SizerTrait.hash(into:)();
    uint64_t result = sub_1BF8CC1D8();
    uint64_t v13 = -1 << *(unsigned char *)(v12 + 32);
    a4 = result & ~v13;
    if ((*(void *)(v12 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
    {
      uint64_t v14 = ~v13;
      do
      {
        uint64_t v15 = *(void *)(v12 + 48) + 24 * a4;
        double v16 = *(double *)v15;
        double v17 = *(double *)(v15 + 8);
        if (*(unsigned char *)(v15 + 16) == 1)
        {
          if (*(void *)&v16 | *(void *)&v17)
          {
            if (*(void *)&v16 ^ 1 | *(void *)&v17)
            {
              if ((a3 & (*(void *)&v9 > 1uLL)) != 0) {
                goto LABEL_29;
              }
            }
            else if ((a3 & ((*(void *)&v9 ^ 1 | a2) == 0)) != 0)
            {
              goto LABEL_29;
            }
          }
          else if ((a3 & ((*(void *)&v9 | a2) == 0)) != 0)
          {
            goto LABEL_29;
          }
        }
        else if ((a3 & 1) == 0 && v16 == v9 && v17 == *(double *)&a2)
        {
          goto LABEL_29;
        }
        a4 = (a4 + 1) & v14;
      }
      while (((*(void *)(v12 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
    }
  }
LABEL_26:
  uint64_t v19 = *v5;
  *(void *)(*v5 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v20 = *(void *)(v19 + 48) + 24 * a4;
  *(double *)uint64_t v20 = v9;
  *(double *)(v20 + 8) = *(double *)&a2;
  *(unsigned char *)(v20 + 16) = a3 & 1;
  uint64_t v21 = *(void *)(v19 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
    __break(1u);
LABEL_29:
    uint64_t result = sub_1BF8CC148();
    __break(1u);
  }
  else
  {
    *(void *)(v19 + 16) = v23;
  }
  return result;
}

void *sub_1BF8C89B8()
{
  uint64_t v1 = v0;
  sub_1BF8A2F68();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF8CBE38();
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    uint64_t v19 = 3 * i;
    uint64_t v20 = *(void *)(v2 + 48) + 8 * v19;
    char v21 = *(unsigned char *)(v20 + 16);
    uint64_t v22 = *(void *)(v4 + 48) + 8 * v19;
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v20;
    *(unsigned char *)(v22 + 16) = v21;
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1BF8C8B60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1BF8A2F68();
  uint64_t result = sub_1BF8CBE48();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_36:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = *(void *)(v2 + 56);
  uint64_t v29 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & v6;
  int64_t v30 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = result + 56;
  if ((v8 & v6) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v11 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v11 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v5 << 6))
  {
    uint64_t v16 = *(void *)(v2 + 48) + 24 * i;
    uint64_t v18 = *(void *)v16;
    uint64_t v17 = *(void *)(v16 + 8);
    int v19 = *(unsigned __int8 *)(v16 + 16);
    sub_1BF8CC1A8();
    sub_1BF8CC1B8();
    if (v19 != 1)
    {
      sub_1BF8CC1C8();
      sub_1BF8CC1C8();
    }
    uint64_t result = sub_1BF8CC1D8();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
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
        uint64_t v27 = *(void *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_32;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_32:
    *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = *(void *)(v4 + 48) + 24 * v23;
    *(void *)uint64_t v28 = v18;
    *(void *)(v28 + 8) = v17;
    *(unsigned char *)(v28 + 16) = v19;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_38;
    }
    if (v13 >= v30) {
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v29 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v30) {
        goto LABEL_34;
      }
      unint64_t v14 = *(void *)(v29 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v30) {
          goto LABEL_34;
        }
        unint64_t v14 = *(void *)(v29 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v30)
  {
LABEL_34:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v29 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v30) {
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v29 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SizeScaleSizer.Scale()
{
  return &type metadata for SizeScaleSizer.Scale;
}

uint64_t sub_1BF8C8E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BF8C8EB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1BF8C8EB8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BF8C8EEC(char a1)
{
  return a1 & 1;
}

double sub_1BF8C8EF4(double a1, double a2, double a3, double a4, double a5)
{
  return a5;
}

double sub_1BF8C8EFC(double a1, double a2, double a3, double a4, double a5)
{
  return a5;
}

uint64_t LayoutAdjustable.flipRightToLeft(bounds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_1BF8C8F3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BF8C8EEC(*v1);
  *a1 = result & 1;
  return result;
}

uint64_t sub_1BF8C8F6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void sub_1BF8C8F98(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = sub_1BF8C8EF4(a2, a3, a4, a5, *v5);
}

uint64_t Array<A>.flipRightToLeft(bounds:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  v12[9] = a1;
  v12[2] = a2;
  void v12[3] = a3;
  *(double *)&v12[4] = a4;
  *(double *)&void v12[5] = a5;
  *(double *)&v12[6] = a6;
  *(double *)&v12[7] = a7;
  uint64_t v8 = sub_1BF8CBC38();
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_1BF89C254((void (*)(char *, char *))sub_1BF8C9070, (uint64_t)v12, v8, a2, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v10);
}

uint64_t sub_1BF8C9070()
{
  uint64_t v0 = OUTLINED_FUNCTION_0_42();
  return v1(v0);
}

uint64_t sub_1BF8C90A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t result = Array<A>.flipRightToLeft(bounds:)(*v7, *(void *)(a1 + 16), *(void *)(a2 - 8), a4, a5, a6, a7);
  *a3 = result;
  return result;
}

uint64_t Dictionary<>.flipRightToLeft(bounds:)()
{
  return sub_1BF8CBA18();
}

uint64_t sub_1BF8C9148()
{
  uint64_t v0 = OUTLINED_FUNCTION_0_42();
  return v1(v0);
}

uint64_t sub_1BF8C9184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Dictionary<>.flipRightToLeft(bounds:)();
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of LayoutAdjustable.flipRightToLeft(bounds:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1BF8C91D4(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *(double *)a1 = sub_1BF8C8EFC(a2, a3, a4, a5, *v5);
  *(void *)(a1 + 8) = v7;
}

void destroy for SizerResultText(uint64_t a1)
{
}

uint64_t initializeWithCopy for SizerResultText(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  id v5 = v4;
  return a1;
}

void *assignWithCopy for SizerResultText(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = (void *)a2[4];
  id v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for SizerResultText(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  id v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SizerResultText(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for SizerResultText(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SizerResultText()
{
  return &type metadata for SizerResultText;
}

ValueMetadata *type metadata accessor for OffsetScaleSizer()
{
  return &type metadata for OffsetScaleSizer;
}

uint64_t sub_1BF8C93B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *a1;
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v9);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, *(void *)(v8 + 80), *(void *)(v8 + 88), v9, v10);
  if (!v4) {
    return sub_1BF8C7BD8((uint64_t)&unk_1F1B04938, result);
  }
  return result;
}

void *sub_1BF8C947C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v6 = v4;
  uint64_t v11 = *a1;
  uint64_t v12 = v6[3];
  uint64_t v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v13 + 16))(&v19, a1, a2, a3, *(void *)(v11 + 80), *(void *)(v11 + 88), v12, v13);
  if (!v5)
  {
    uint64_t v15 = v19;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = v6[5];
    uint64_t v18 = v6[6];
    uint64_t result = (void *)swift_allocObject();
    result[2] = v17;
    result[3] = v18;
    *(void *)(v16 + 24) = sub_1BF8C97D8;
    *(void *)(v16 + 32) = result;
    *a4 = v16 | 0x7000000000000000;
  }
  return result;
}

CGFloat sub_1BF8C95B0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGFloat v9 = CGRectGetWidth(*(CGRect *)&a1) * a5;
  v11.origin.CGFloat x = a1;
  v11.origin.CGFloat y = a2;
  v11.size.CGFloat width = a3;
  v11.size.CGFloat height = a4;
  CGRectGetHeight(v11);
  v12.origin.CGFloat x = a1;
  v12.origin.CGFloat y = a2;
  v12.size.CGFloat width = a3;
  v12.size.CGFloat height = a4;
  CGRectGetWidth(v12);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  CGRectGetHeight(v13);
  return v9 + a1;
}

uint64_t sub_1BF8C9670(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF8C93B0(a1, a2, a3);
}

void *sub_1BF8C9688@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BF8C947C(a1, a2, a3, a4);
}

uint64_t sub_1BF8C96A0()
{
  return 0;
}

uint64_t sub_1BF8C9784()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BF8C97C8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

CGFloat sub_1BF8C97D8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BF8C95B0(a1, a2, a3, a4, *(double *)(v4 + 16));
}

ValueMetadata *type metadata accessor for FlexibleCondition()
{
  return &type metadata for FlexibleCondition;
}

BOOL sub_1BF8C980C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1BF8C981C()
{
  return sub_1BF8CC1B8();
}

uint64_t sub_1BF8C9844()
{
  return sub_1BF8CC1D8();
}

BOOL sub_1BF8C988C(char *a1, char *a2)
{
  return sub_1BF8C980C(*a1, *a2);
}

uint64_t sub_1BF8C9898()
{
  return sub_1BF8C9844();
}

uint64_t sub_1BF8C98A0()
{
  return sub_1BF8C981C();
}

BOOL sub_1BF8C98A8(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3)
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    double Height = CGRectGetHeight(*(CGRect *)(a1 + 96));
    return Height == 1.79769313e308;
  }
  if (a3 != 1) {
    goto LABEL_5;
  }
LABEL_3:
  double Height = CGRectGetWidth(*(CGRect *)(a1 + 96));
  return Height == 1.79769313e308;
}

BOOL sub_1BF8C9900(uint64_t a1, uint64_t a2)
{
  return sub_1BF8C98A8(a1, a2, *v2);
}

unsigned char *_s11TeaTemplate17FlexibleConditionV15DirectionOptionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF8C99D4);
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

ValueMetadata *type metadata accessor for FlexibleCondition.DirectionOption()
{
  return &type metadata for FlexibleCondition.DirectionOption;
}

unint64_t sub_1BF8C9A10()
{
  unint64_t result = qword_1EA1705F8;
  if (!qword_1EA1705F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1705F8);
  }
  return result;
}

uint64_t FastLayoutDecoder.decodeFrame(_:)(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_7();
  if (*(unsigned char *)(a1 + 48))
  {
    sub_1BF8B0770();
    OUTLINED_FUNCTION_7_12();
    *int v3 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t FastLayoutDecoder.decode<A>(_:)@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_29(a1);
  uint64_t v4 = *(void *)(v3 + 80);
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_43();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_6_13();
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v18 - v7;
  uint64_t v9 = *(void *)(v1 + 32);
  if (v9 == 1)
  {
    LayoutItem.flipRightToLeft(bounds:)(*(double *)v1, *(double *)(v1 + 8), *(double *)(v1 + 16), *(double *)(v1 + 24));
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_5_14();
    v12();
    swift_release();
    OUTLINED_FUNCTION_4_20(v2);
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    sub_1BF8B0770();
    OUTLINED_FUNCTION_7_12();
    char v15 = 1;
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_5_14();
  v10();
  OUTLINED_FUNCTION_4_20((uint64_t)v8);
  if (v11)
  {
LABEL_8:
    OUTLINED_FUNCTION_8_7();
    v13();
    sub_1BF8B0770();
    OUTLINED_FUNCTION_7_12();
    char v15 = 0;
LABEL_10:
    *unint64_t v14 = v15;
    return swift_willThrow();
  }
  uint64_t v2 = (uint64_t)v8;
LABEL_11:
  OUTLINED_FUNCTION_9_8();
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v17 + 32))(v18[5], v2, v4);
}

uint64_t FastLayoutDecoder.decodeIfPresent<A>(_:)@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_29(a1);
  uint64_t v4 = *(void *)(v3 + 80);
  sub_1BF8CBD98();
  OUTLINED_FUNCTION_0_43();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_6_13();
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v23 - v7;
  uint64_t v9 = *(void *)(v1 + 32);
  if (v9 == 1)
  {
    LayoutItem.flipRightToLeft(bounds:)(*(double *)v1, *(double *)(v1 + 8), *(double *)(v1 + 16), *(double *)(v1 + 24));
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_5_14();
    v15();
    swift_release();
    OUTLINED_FUNCTION_4_20(v2);
    uint64_t v16 = v24;
    if (!v11)
    {
      OUTLINED_FUNCTION_9_8();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v16, v2, v4);
    }
    OUTLINED_FUNCTION_8_7();
    v17();
    uint64_t v13 = *(void *)(v4 + 16);
    uint64_t v14 = v16;
    return __swift_storeEnumTagSinglePayload(v14, 1, 1, v13);
  }
  if (!v9)
  {
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_5_14();
    v10();
    OUTLINED_FUNCTION_4_20((uint64_t)v8);
    if (!v11)
    {
      OUTLINED_FUNCTION_9_8();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v24, v8, v4);
    }
    OUTLINED_FUNCTION_8_7();
    v12();
    uint64_t v13 = *(void *)(v4 + 16);
    uint64_t v14 = v24;
    return __swift_storeEnumTagSinglePayload(v14, 1, 1, v13);
  }
  sub_1BF8B0770();
  uint64_t v18 = OUTLINED_FUNCTION_7_12();
  return OUTLINED_FUNCTION_10_7(v18, v19);
}

uint64_t FastLayoutDecoder.decode<A>(_:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1 == 1)
  {
    LayoutItemList.flipRightToLeft(bounds:)(*(double *)v0, *(double *)(v0 + 8), *(double *)(v0 + 16), *(double *)(v0 + 24));
    OUTLINED_FUNCTION_1_7();
    swift_bridgeObjectRetain();
    uint64_t v3 = swift_release();
    MEMORY[0x1F4188790](v3);
    OUTLINED_FUNCTION_2_28();
    sub_1BF8CBC38();
    swift_getWitnessTable();
  }
  else
  {
    if (v1)
    {
      sub_1BF8B0770();
      uint64_t v4 = OUTLINED_FUNCTION_7_12();
      OUTLINED_FUNCTION_10_7(v4, v5);
      return v0;
    }
    uint64_t v2 = OUTLINED_FUNCTION_1_7();
    MEMORY[0x1F4188790](v2);
    OUTLINED_FUNCTION_2_28();
    sub_1BF8CBC38();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
  }
  uint64_t v0 = sub_1BF8CBAF8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t getEnumTagSinglePayload for FastLayoutDecoder(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FastLayoutDecoder(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FastLayoutDecoder()
{
  return &type metadata for FastLayoutDecoder;
}

uint64_t LayoutContextRecords.records.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LayoutContextRecords.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutContextRecords.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t LayoutContextRecord.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void LayoutContextRecord.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

double LayoutContextRecord.startTime.getter()
{
  return *(double *)(v0 + 40);
}

double LayoutContextRecord.endTime.getter()
{
  return *(double *)(v0 + 48);
}

double LayoutContextRecord.durationInMilliseconds.getter()
{
  return (*(double *)(v0 + 48) - *(double *)(v0 + 40)) * 1000.0;
}

uint64_t LayoutContextRecord.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutContextRecord.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t type metadata accessor for LayoutContextRecords()
{
  return self;
}

uint64_t method lookup function for LayoutContextRecords(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutContextRecords);
}

uint64_t type metadata accessor for LayoutContextRecord()
{
  return self;
}

uint64_t method lookup function for LayoutContextRecord(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutContextRecord);
}

uint64_t Canvas.description.getter()
{
  if (*(unsigned char *)(v0 + 33)) {
    return 0x746C7561666564;
  }
  char v2 = *(unsigned char *)(v0 + 32);
  long long v3 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v3;
  char v5 = v2 & 1;
  sub_1BF8CBAC8();
  sub_1BF8BD184((uint64_t)v4);
  sub_1BF8CBAC8();
  return 0;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Canvas(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 34)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Canvas(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 34) = v3;
  return result;
}

uint64_t sub_1BF8CA408(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BF8CA424(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    char v2 = 1;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 33) = v2;
  return result;
}

ValueMetadata *type metadata accessor for Canvas()
{
  return &type metadata for Canvas;
}

uint64_t getEnumTagSinglePayload for Canvas.Options(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && a1[112]) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 3;
  unsigned int v5 = v3 - 3;
  if (!v4) {
    unsigned int v5 = -1;
  }
  if (v5 + 1 >= 2) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Canvas.Options(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 112) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_1BF8CA4F4(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 3) {
    return v1 - 2;
  }
  else {
    return 0;
  }
}

double sub_1BF8CA508(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xFD)
  {
    *(void *)(a1 + 104) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 - 254;
  }
  else if (a2)
  {
    *(unsigned char *)a1 = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Canvas.Options()
{
  return &type metadata for Canvas.Options;
}

double CGSize.replacing(height:)(double a1, double a2)
{
  return a2;
}

double static CGSize.flexibleWidth(height:)()
{
  return 1.79769313e308;
}

uint64_t sub_1BF8CA594(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF8CA5FC(&qword_1EA170600);
  uint64_t result = sub_1BF8CA5FC(&qword_1EA170608);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BF8CA5FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BF8CA640()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF8CA6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1BF8CA724(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1BF8CA724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *a4;
  void v7[5] = a3;
  v7[6] = v10;
  v7[7] = a5;
  v7[8] = a1;
  v7[9] = a2;
  v7[10] = a6;
  v7[11] = a7;
  char v12 = 4;
  swift_bridgeObjectRetain();
  return Node.init(kind:identifier:)(&v12, a1, a2);
}

uint64_t sub_1BF8CA78C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v13[-1] - v7;
  swift_getAtKeyPath();
  v13[3] = v2;
  v13[4] = &protocol witness table for Node<A>;
  v13[0] = v0;
  uint64_t v9 = *(void *)(v1 + 176);
  uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t))(v9 + 8);
  swift_retain();
  v10(v13, v3, v9);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_1BF8CA8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v71)(uint64_t *__return_ptr, uint64_t, uint64_t, double, double);
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  double *v90;
  double v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  CGFloat v96;
  CGFloat v97;
  void *v98;
  Swift::String_optional v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(long long *__return_ptr, uint64_t);
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  void (*v108)(uint64_t, unint64_t *, void, uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  void (*v111)(long long *, unint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  long long v117;
  long long v118;
  long long v119;
  long long v120;
  long long v121;
  id v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  CGFloat v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  char v148[2];
  unsigned char v149[2];
  uint64_t v150[3];
  uint64_t v151;
  uint64_t v152;
  uint64_t v153[5];
  char v154;
  long long v155[7];
  unint64_t v156;
  CGFloat v157;
  long long v158;
  long long v159;
  long long v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  long long v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  void *v170;
  long long v171;
  uint64_t v172;
  uint64_t v173;
  char v174;
  void *v175;
  uint64_t v176;
  Swift::OpaquePointer_optional v177;
  __C::CGRect v178;
  CGRect v179;
  __C::CGRect v180;
  CGRect v181;

  uint64_t v5 = v4;
  uint64_t v142 = a3;
  uint64_t v147 = a2;
  uint64_t v176 = a1;
  uint64_t v136 = *v5;
  uint64_t v7 = v136;
  id v135 = *(void *)(v136 + 144);
  OUTLINED_FUNCTION_0_4();
  uint64_t v129 = v8;
  MEMORY[0x1F4188790](v9);
  uint64_t v130 = (char *)&v113 - v10;
  OUTLINED_FUNCTION_1_30();
  OUTLINED_FUNCTION_1_30();
  OUTLINED_FUNCTION_1_30();
  uint64_t v12 = *(void *)(v7 + 192);
  id v140 = *(void *)(v11 + 184);
  uint64_t v141 = v13;
  id v156 = v13;
  uint64_t v157 = v14;
  char v133 = v12;
  uint64_t v134 = v14;
  *(void *)&uint64_t v158 = v140;
  *((void *)&v158 + 1) = v12;
  type metadata accessor for Layout.InternalLayoutResult();
  OUTLINED_FUNCTION_0_4();
  uint64_t v131 = v16;
  uint64_t v132 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v143 = a4;
  uint64_t v17 = v5[8];
  uint64_t v18 = v5[9];
  uint64_t v138 = (uint64_t)&v113 - v19;
  uint64_t v139 = v17;
  uint64_t v137 = v18;
  uint64_t v20 = sub_1BF8991D8();
  uint64_t v144 = v5[6];
  *(void *)&v155[0] = v144;
  OUTLINED_FUNCTION_1_30();
  uint64_t v22 = *(void *)(v21 + 136);
  OUTLINED_FUNCTION_1_30();
  uint64_t v24 = *(void *)(v23 + 168);
  uint64_t v25 = type metadata accessor for Sizing();
  sub_1BF8C2410(v25, (uint64_t)&v156);
  uint64_t v27 = *((void *)&v158 + 1);
  uint64_t v26 = v159;
  __swift_project_boxed_opaque_existential_1(&v156, *((uint64_t *)&v158 + 1));
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8);
  uint64_t v146 = v20;
  uint64_t v29 = v145;
  uint64_t v30 = v28(v176, v147, v20, v22, v24, v27, v26);
  if (v29)
  {
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  }
  id v145 = v30;
  id v128 = v5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  *(void *)&v155[0] = v144;
  sub_1BF8C2410(v25, (uint64_t)&v156);
  uint64_t v31 = *((void *)&v158 + 1);
  uint64_t v32 = v159;
  __swift_project_boxed_opaque_existential_1(&v156, *((uint64_t *)&v158 + 1));
  uint64_t v33 = v176;
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 16))(v155, v176, v147, v146, v22, v24, v31, v32);
  unint64_t v35 = *(void *)&v155[0];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  id v156 = v35;
  if (SizerResult.isAmbiguous.getter())
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_retain();
  }
  uint64_t v114 = v22;
  id v156 = v35;
  *(void *)&v155[0] = v35;
  swift_retain();
  char v36 = SizerResult.nonIntegral.getter();
  sub_1BF8A9020(v36 & 1);
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  swift_release();
  uint64_t v45 = (uint64_t)v128;
  uint64_t v46 = v128[2];
  uint64_t v115 = v128[3];
  uint64_t v116 = v46;
  *(double *)&uint64_t v47 = COERCE_DOUBLE(LayoutContext.contextFrame(for:)());
  uint64_t v144 = v35;
  if (*(double *)&v47 == 0.0)
  {
    uint64_t v113 = v24;
    uint64_t v127 = v35 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  uint64_t v126 = *(double *)&v47;
  id v156 = v35;
  v178.origin.CGFloat x = v38;
  v178.origin.CGFloat y = v40;
  v178.size.CGFloat width = v42;
  v178.size.CGFloat height = v44;
  SizerResult.postProcess(frame:nonIntegral:)(v178, 0);
  if (v48)
  {
    uint64_t v113 = v24;
    uint64_t v127 = v35 & 0xFFFFFFFFFFFFFFFLL;
    swift_release();

LABEL_10:
    uint64_t v49 = v139;
    goto LABEL_11;
  }
  sub_1BF8A3044();
  v179.origin.CGFloat x = OUTLINED_FUNCTION_0_19();
  uint64_t v89 = CGRectEqualToRect(v179, v181);
  uint64_t v49 = v139;
  if (v89)
  {
    OUTLINED_FUNCTION_0_19();
    sub_1BF89F278(v145);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return 0;
  }
  uint64_t v113 = v24;
  uint64_t v127 = v35 & 0xFFFFFFFFFFFFFFFLL;
  swift_release();
LABEL_11:
  uint64_t v50 = (long long *)(v33 + 328);
  sub_1BF89D858(v45, v142, v49, v137);
  long long v51 = *(_OWORD *)(v33 + 144);
  uint64_t v120 = *(_OWORD *)(v33 + 160);
  uint64_t v121 = v51;
  long long v52 = *(_OWORD *)(v33 + 176);
  uint64_t v53 = *(void *)(v33 + 192);
  uint64_t v54 = *(void *)(v33 + 200);
  uint64_t v55 = *(void **)(v33 + 208);
  uint64_t v118 = *(_OWORD *)(v33 + 216);
  uint64_t v119 = v52;
  uint64_t v56 = *(void *)(v33 + 232);
  uint64_t v57 = *(void *)(v33 + 240);
  uint64_t v58 = *(void **)(v33 + 272);
  uint64_t v122 = *(id *)(v33 + 264);
  uint64_t v117 = *(_OWORD *)(v33 + 280);
  id v123 = v40;
  uint64_t v124 = v38;
  uint64_t v59 = *(void *)(v33 + 296);
  uint64_t v60 = *(void *)(v33 + 304);
  char v61 = *(unsigned char *)(v176 + 312);
  id v156 = 0xF000000000000007;
  *(void *)&v155[0] = 0xF000000000000007;
  v153[0] = 0xF000000000000007;
  v150[0] = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  swift_allocObject();
  uint64_t v62 = LayoutMarginAdjuster.init(top:left:bottom:right:)(&v156, (uint64_t *)v155, v153, v150);
  uint64_t v125 = v44;
  uint64_t v126 = v42;
  id v156 = *(void *)&v42;
  uint64_t v157 = v44;
  uint64_t v158 = v121;
  uint64_t v159 = v120;
  uint64_t v160 = v119;
  uint64_t v161 = v53;
  uint64_t v162 = v54;
  uint64_t v163 = v55;
  uint64_t v164 = v118;
  uint64_t v165 = v56;
  uint64_t v166 = v57;
  uint64_t v167 = 0;
  uint64_t v168 = 0;
  uint64_t v169 = v122;
  uint64_t v170 = v58;
  uint64_t v122 = v58;
  uint64_t v171 = v117;
  uint64_t v172 = v59;
  uint64_t v173 = v60;
  uint64_t v174 = v61;
  uint64_t v63 = v176;
  uint64_t v175 = v62;
  long long v64 = v50[1];
  v155[0] = *v50;
  v155[1] = v64;
  long long v65 = v50[3];
  v155[2] = v50[2];
  long long v66 = v50[4];
  long long v67 = v50[5];
  v155[3] = v65;
  v155[4] = v66;
  long long v68 = v50[6];
  v155[5] = v67;
  v155[6] = v68;
  uint64_t v154 = *(unsigned char *)(v176 + 48);
  sub_1BF8A0970(v176 + 544, (uint64_t)v150);
  uint64_t v69 = v151;
  if (v151)
  {
    uint64_t v70 = v152;
    __swift_project_boxed_opaque_existential_1(v150, v151);
    uint64_t v71 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, double, double))(v70 + 24);
    uint64_t v72 = v55;
    uint64_t v73 = v122;
    uint64_t v75 = *(void *)&v123;
    uint64_t v74 = *(void *)&v124;
    v71(v153, v69, v70, v124, v123);
    uint64_t v63 = v176;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v150);
  }
  else
  {
    char v76 = v55;
    uint64_t v77 = v122;
    sub_1BF8A0428((uint64_t)v150);
    memset(v153, 0, sizeof(v153));
    uint64_t v75 = *(void *)&v123;
    uint64_t v74 = *(void *)&v124;
  }
  type metadata accessor for Cursor();
  v150[0] = v144;
  SizerResult.behavior.getter(v149);
  v148[0] = v149[0];
  v148[1] = v149[1];
  uint64_t v78 = swift_allocObject();
  id v123 = *(double *)(v63 + 88);
  *(CGFloat *)(v78 + 16) = v123;
  v150[0] = v78 | 0x4000000000000000;
  uint64_t v79 = sub_1BF89FC40((uint64_t)&v156, v155, &v154, (uint64_t)v153, v74, v75, 0, v148, v150, 0);
  uint64_t v80 = *(void *)(*(void *)v143 + 48);
  type metadata accessor for LayoutContext();
  swift_allocObject();
  uint64_t result = sub_1BF8994A8(v80);
  v153[0] = result;
  *(void *)&uint64_t v124 = v142 + 1;
  if (!__OFADD__(v142, 1))
  {
    *((void *)&v158 + 1) = &unk_1F1B09BE0;
    *(void *)&uint64_t v159 = &off_1F1B09C58;
    uint64_t v81 = (double *)swift_allocObject();
    uint64_t v82 = v141;
    *((void *)v81 + 2) = v135;
    *((void *)v81 + 3) = v82;
    v81[4] = v134;
    uint64_t v83 = *(void *)(v136 + 176);
    uint64_t v84 = v140;
    *((void *)v81 + 5) = v83;
    *((void *)v81 + 6) = v84;
    uint64_t v85 = v144;
    *((void *)v81 + 7) = v133;
    *((void *)v81 + 8) = v85;
    *((void *)v81 + 9) = v63;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v86 = v138;
    sub_1BF8BDEA8(v79, *(uint64_t *)&v124, (uint64_t)v153, &v156, (void (*)(void *__return_ptr, double))sub_1BF8CB878, (uint64_t)v81, v138);
    id v140 = v83;
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    uint64_t v141 = v79;
    sub_1BF8A0970(v79 + 544, (uint64_t)&v156);
    uint64_t v87 = *((void *)&v158 + 1);
    if (*((void *)&v158 + 1))
    {
      uint64_t v88 = v159;
      __swift_project_boxed_opaque_existential_1(&v156, *((uint64_t *)&v158 + 1));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 32))(v176, v114, v113, v87, v88);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    }
    else
    {
      sub_1BF8A0428((uint64_t)&v156);
    }
    uint64_t v90 = (double *)(v86 + *(int *)(v132 + 52));
    uint64_t v91 = v90[4];
    uint64_t v92 = v90[5];
    uint64_t v93 = sub_1BF8994C8(*(double *)(*(void *)v143 + 32) + v91, *(double *)(*(void *)v143 + 40) + v92);
    uint64_t v94 = v139;
    uint64_t v95 = v137;
    LayoutContext.set(context:for:)(v93, v139, v137);
    swift_release();
    __int16 v96 = v90[6];
    uint64_t v97 = v90[7];
    LOBYTE(v155[0]) = *(unsigned char *)(v141 + 48);
    id v156 = v144;
    uint64_t v98 = (void *)SizerResult.metadata.getter();
    v180.origin.CGFloat x = v91;
    v180.origin.CGFloat y = v92;
    v180.size.CGFloat width = v96;
    v177.value._rawValue = v98;
    v177.is_nil = v94;
    v180.size.CGFloat height = v97;
    v99.value._uint64_t countAndFlagsBits = v95;
    LayoutContext.set(frame:direction:metadata:for:)(v180, (TeaTemplate::Direction)v155, v177, v99);
    swift_bridgeObjectRelease();
    LOBYTE(v156) = 3;
    OUTLINED_FUNCTION_0();
    sub_1BF89F124();
    sub_1BF89F278(v145);
    swift_bridgeObjectRelease();
    uint64_t v100 = v128;
    OUTLINED_FUNCTION_0();
    sub_1BF89D868(v101, v102, v94, v95);
    uint64_t v103 = (void (*)(long long *__return_ptr, uint64_t))v100[10];
    if (v103)
    {
      swift_retain();
      v103(v155, v138);
      uint64_t v104 = v130;
      uint64_t v105 = v131;
      swift_getAtKeyPath();
      OUTLINED_FUNCTION_3_22((uint64_t)&protocol witness table for Node<A>);
      uint64_t v111 = *(void (**)(long long *, unint64_t *, uint64_t, uint64_t, uint64_t))(v140 + 16);
      swift_retain();
      uint64_t v112 = v135;
      v111(v155, &v156, MEMORY[0x1E4FBC840] + 8, v135, v140);
      swift_release();
      sub_1BF8901F4((uint64_t)v103);
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v129 + 8))(v104, v112);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v138, v132);
    }
    else
    {
      uint64_t v106 = v130;
      swift_getAtKeyPath();
      OUTLINED_FUNCTION_3_22((uint64_t)&protocol witness table for Node<A>);
      uint64_t v107 = v140;
      uint64_t v108 = *(void (**)(uint64_t, unint64_t *, void, uint64_t, uint64_t))(v140 + 16);
      swift_retain();
      uint64_t v109 = v138;
      uint64_t v110 = v135;
      v108(v138, &v156, *(void *)&v134, v135, v107);
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v129 + 8))(v106, v110);
      (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v109, v132);
    }
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    return 0;
  }
  __break(1u);
  return result;
}

void sub_1BF8CB4E4(CGFloat *a1@<X8>, double a2@<D0>)
{
  __C::CGRect v15 = SizerResult.postProcess(frame:nonIntegral:)(*(__C::CGRect *)&a2, 0);
  if (!v6)
  {
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    sub_1BF8A3044();
    *a1 = x;
    a1[1] = y;
    a1[2] = width;
    a1[3] = height;
    *((void *)a1 + 4) = v11;
    *((void *)a1 + 5) = v12;
    *((void *)a1 + 6) = v13;
    *((void *)a1 + 7) = v14;
  }
}

void sub_1BF8CB570()
{
}

void sub_1BF8CB590()
{
}

uint64_t sub_1BF8CB5C0()
{
  swift_release();
  sub_1BF8CB8A0(*(void *)(v0 + 48));
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 80);
  return sub_1BF8901F4(v1);
}

uint64_t sub_1BF8CB608()
{
  uint64_t v0 = Node.deinit();
  swift_release();
  sub_1BF8CB8A0(*(void *)(v0 + 48));
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BF8901F4(*(void *)(v0 + 80));
  return v0;
}

uint64_t sub_1BF8CB658()
{
  uint64_t v0 = sub_1BF8CB608();
  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t type metadata accessor for EmbedLayout()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BF8CB6A0()
{
  return 0;
}

uint64_t sub_1BF8CB7D4()
{
  return sub_1BF8CB6A0();
}

uint64_t sub_1BF8CB7F8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF8CB834()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_1BF8CB878(CGFloat *a1@<X8>, double a2@<D0>)
{
}

unint64_t sub_1BF8CB8A0(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BF8CB958()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BF8CB968()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BF8CB978()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BF8CB988()
{
  return MEMORY[0x1F415DF30]();
}

uint64_t sub_1BF8CB998()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BF8CB9A8()
{
  return MEMORY[0x1F4163020]();
}

uint64_t sub_1BF8CB9B8()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1BF8CB9C8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BF8CB9D8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BF8CB9E8()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1BF8CB9F8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1BF8CBA08()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1BF8CBA18()
{
  return MEMORY[0x1F4183498]();
}

uint64_t sub_1BF8CBA28()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BF8CBA38()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1BF8CBA48()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1BF8CBA58()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1BF8CBA68()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BF8CBA78()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BF8CBA88()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BF8CBA98()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BF8CBAA8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BF8CBAB8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BF8CBAC8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BF8CBAD8()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1BF8CBAE8()
{
  return MEMORY[0x1F415F020]();
}

uint64_t sub_1BF8CBAF8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1BF8CBB08()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1BF8CBB18()
{
  return MEMORY[0x1F4183C90]();
}

uint64_t sub_1BF8CBB28()
{
  return MEMORY[0x1F4183DA0]();
}

uint64_t sub_1BF8CBB68()
{
  return MEMORY[0x1F4183E18]();
}

uint64_t sub_1BF8CBB78()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BF8CBB88()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1BF8CBB98()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1BF8CBBA8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1BF8CBBB8()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1BF8CBBC8()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1BF8CBBD8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1BF8CBBE8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1BF8CBBF8()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1BF8CBC08()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1BF8CBC18()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1BF8CBC28()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1BF8CBC38()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BF8CBC48()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1BF8CBC58()
{
  return MEMORY[0x1F4184090]();
}

uint64_t sub_1BF8CBC68()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BF8CBC78()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1BF8CBC88()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BF8CBC98()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1BF8CBCA8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1BF8CBCB8()
{
  return MEMORY[0x1F4184418]();
}

uint64_t sub_1BF8CBCC8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BF8CBCD8()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1BF8CBCE8()
{
  return MEMORY[0x1F41634E0]();
}

uint64_t sub_1BF8CBCF8()
{
  return MEMORY[0x1F4163508]();
}

uint64_t sub_1BF8CBD08()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BF8CBD18()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BF8CBD28()
{
  return MEMORY[0x1F40D9708]();
}

uint64_t sub_1BF8CBD38()
{
  return MEMORY[0x1F4163668]();
}

uint64_t sub_1BF8CBD48()
{
  return MEMORY[0x1F4163670]();
}

uint64_t sub_1BF8CBD58()
{
  return MEMORY[0x1F4163680]();
}

uint64_t sub_1BF8CBD68()
{
  return MEMORY[0x1F41636C0]();
}

uint64_t sub_1BF8CBD78()
{
  return MEMORY[0x1F41636C8]();
}

uint64_t sub_1BF8CBD88()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BF8CBD98()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BF8CBDA8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1BF8CBDB8()
{
  return MEMORY[0x1F41848C0]();
}

uint64_t sub_1BF8CBDC8()
{
  return MEMORY[0x1F41848D8]();
}

uint64_t sub_1BF8CBDD8()
{
  return MEMORY[0x1F4184938]();
}

uint64_t sub_1BF8CBDE8()
{
  return MEMORY[0x1F4184940]();
}

uint64_t sub_1BF8CBDF8()
{
  return MEMORY[0x1F4184950]();
}

uint64_t sub_1BF8CBE08()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BF8CBE28()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1BF8CBE38()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BF8CBE48()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BF8CBE58()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BF8CBE68()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1BF8CBE78()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BF8CBE88()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1BF8CBE98()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BF8CBEA8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1BF8CBEB8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1BF8CBEC8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1BF8CBED8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1BF8CBEE8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1BF8CBEF8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1BF8CBF08()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1BF8CBF18()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1BF8CBF28()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1BF8CBF38()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1BF8CBF48()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BF8CBF58()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1BF8CBF68()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1BF8CBF78()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1BF8CBF88()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1BF8CBF98()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1BF8CBFA8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BF8CBFB8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BF8CBFC8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BF8CBFD8()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1BF8CBFF8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BF8CC008()
{
  return MEMORY[0x1F41855F8]();
}

uint64_t sub_1BF8CC018()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BF8CC028()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1BF8CC038()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1BF8CC048()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1BF8CC058()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1BF8CC068()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1BF8CC078()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BF8CC098()
{
  return MEMORY[0x1F4185BE8]();
}

uint64_t sub_1BF8CC0A8()
{
  return MEMORY[0x1F4185BF0]();
}

uint64_t sub_1BF8CC0B8()
{
  return MEMORY[0x1F4185BF8]();
}

uint64_t sub_1BF8CC0C8()
{
  return MEMORY[0x1F4185C00]();
}

uint64_t sub_1BF8CC0D8()
{
  return MEMORY[0x1F4185C08]();
}

uint64_t sub_1BF8CC0E8()
{
  return MEMORY[0x1F4185C10]();
}

uint64_t sub_1BF8CC0F8()
{
  return MEMORY[0x1F4185C18]();
}

uint64_t sub_1BF8CC108()
{
  return MEMORY[0x1F4185C20]();
}

uint64_t sub_1BF8CC118()
{
  return MEMORY[0x1F4185C28]();
}

uint64_t sub_1BF8CC128()
{
  return MEMORY[0x1F4185C30]();
}

uint64_t sub_1BF8CC138()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1BF8CC148()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BF8CC158()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BF8CC168()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BF8CC178()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BF8CC188()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BF8CC198()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BF8CC1A8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BF8CC1B8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BF8CC1C8()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1BF8CC1D8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BF8CC1E8()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1BF8CC1F8()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1BF8CC208()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1BF8CC218()
{
  return MEMORY[0x1F4186288]();
}

uint64_t sub_1BF8CC228()
{
  return MEMORY[0x1F4186290]();
}

uint64_t sub_1BF8CC238()
{
  return MEMORY[0x1F4186318]();
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1F40DF6B8](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}