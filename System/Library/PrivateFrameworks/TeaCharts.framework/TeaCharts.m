uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void *OUTLINED_FUNCTION_0@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_1BD60A3A0();
}

double OUTLINED_FUNCTION_0_4()
{
  return *(double *)(v0 + 40);
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_allocObject();
}

double OUTLINED_FUNCTION_0_6()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_0_8(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  sub_1BD5DF134(0, a3, a4);
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return sub_1BD60A390();
}

double OUTLINED_FUNCTION_0_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_12@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t a2@<X8>)
{
  return a1(a2);
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return v0;
}

double OUTLINED_FUNCTION_0_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return *(void *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_17@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return MEMORY[0x1F41865C8](67108865, a1, a2 + 8);
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  return v0;
}

void OUTLINED_FUNCTION_0_20(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *(void *)(v5 - 184) = v8;
  *(void *)(v5 - 176) = v7;
  *(void *)(v5 - 168) = v6;
  *(double *)(v5 - 160) = a5;
  *(double *)(v5 - 152) = a4;
  *(double *)(v5 - 144) = a3;
  *(void *)(v5 - 136) = a1;
  *(double *)(v5 - 128) = a2;
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

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return sub_1BD60AB70();
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return swift_beginAccess();
}

double OUTLINED_FUNCTION_1_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  return v0;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

double OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

void OUTLINED_FUNCTION_2_5()
{
  *(void *)(v1 - 184) = v0;
  *(void *)(v1 - 224) = v4;
  *(void *)(v1 - 216) = v2;
  *(void *)(v1 - 208) = v3;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return sub_1BD60A390();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return type metadata accessor for HighlightInteraction.InteractionType();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

size_t OUTLINED_FUNCTION_3_1(void *a1)
{
  size_t result = _swift_stdlib_malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / 16);
  return result;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_1BD60A6A0();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_getAssociatedConformanceWitness();
}

double OUTLINED_FUNCTION_3_5(_OWORD *a1)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  return result;
}

void OUTLINED_FUNCTION_3_6(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = 0;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_getAssociatedConformanceWitness();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1BD5D2B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 8);
}

void *sub_1BD5D2B38(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t sub_1BD5D2B68()
{
  return swift_release();
}

void *sub_1BD5D2B70(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *sub_1BD5D2BB8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StrokeStyle(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StrokeStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t sub_1BD5D2C90(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1BD5D2CAC(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *__n128 result = v2;
  return result;
}

uint64_t type metadata accessor for GridLabel()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for UIRectCorner(uint64_t a1)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for Stroke(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t getEnumTagSinglePayload for ColumnChartCoordinateOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ColumnChartCoordinateOptions(uint64_t result, int a2, int a3)
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

uint64_t getEnumTagSinglePayload for ChartLayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ChartLayoutOptions(uint64_t result, int a2, int a3)
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

uint64_t sub_1BD5D2E28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    char v3 = (uint64_t *)(a1 + 32);
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

uint64_t sub_1BD5D2E7C(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_1BD5D2E84(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_1BD5D2E8C(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_1BD5D2EB0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_1BD5D2EC8(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_1BD5D2ED8(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_1BD5D2EE0(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1BD5D2EEC(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1BD5D2EF8(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1BD5D2F04(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1BD5D2F10(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

uint64_t sub_1BD5D2F20()
{
  return sub_1BD5D3760(*v0, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1BD5D2F50()
{
  return sub_1BD5D3480();
}

uint64_t sub_1BD5D2F58()
{
  return sub_1BD5EE29C();
}

uint64_t sub_1BD5D2F60()
{
  return sub_1BD5D3760(*v0, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1BD5D2F98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BD5D3728();
  *a1 = result;
  return result;
}

uint64_t sub_1BD5D2FC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j__OUTLINED_FUNCTION_4();
  *a1 = result;
  return result;
}

uint64_t sub_1BD5D2FE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BD5D2E7C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BD5D3018@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BD5D9830(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1BD5D3048@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BD5D2E84(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1BD5D3078(void *a1, uint64_t *a2)
{
  return sub_1BD5D9838(a1, *a2);
}

uint64_t sub_1BD5D3080@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BD5D2E8C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BD5D30B4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1BD5D2EB0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BD5D30E8(uint64_t *a1)
{
  return sub_1BD5D9864(*a1);
}

uint64_t sub_1BD5D30F0(uint64_t *a1)
{
  return sub_1BD5D9874(*a1);
}

uint64_t sub_1BD5D30F8(uint64_t *a1)
{
  return sub_1BD5D2EC8(*a1);
}

uint64_t sub_1BD5D3100@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BD5D2ED8(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1BD5D3130(uint64_t *a1)
{
  return sub_1BD5D2EE0(*a1, *v1);
}

BOOL sub_1BD5D313C(uint64_t *a1)
{
  return sub_1BD5D2EEC(*a1, *v1);
}

BOOL sub_1BD5D3148(uint64_t *a1)
{
  return sub_1BD5D2EF8(*a1, *v1);
}

BOOL sub_1BD5D3154()
{
  return sub_1BD5D2F04(*v0);
}

uint64_t sub_1BD5D315C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

uint64_t sub_1BD5D3174(uint64_t *a1)
{
  return sub_1BD5D2F10(*a1);
}

uint64_t sub_1BD5D317C()
{
  return sub_1BD5EE310();
}

BOOL sub_1BD5D3188(uint64_t *a1, uint64_t *a2)
{
  return sub_1BD5D9824(*a1, *a2);
}

uint64_t sub_1BD5D3194@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BD5D2E28(a1);
  *a2 = result;
  return result;
}

void *sub_1BD5D31BC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1BD5D31C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BD60A510();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BD5D3210@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BD5D323C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1BD5D3240(uint64_t a1)
{
  uint64_t v2 = sub_1BD5D33A8(&qword_1EBA199E8, type metadata accessor for Key);
  uint64_t v3 = sub_1BD5D33A8(&qword_1E9FC6870, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

void *sub_1BD5D32FC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1BD5D330C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1BD5D3318()
{
  return sub_1BD5D33A8(&qword_1E9FC6838, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BD5D3360()
{
  return sub_1BD5D33A8(&qword_1E9FC6840, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BD5D33A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BD5D33F0()
{
  return sub_1BD5D33A8(&qword_1E9FC6848, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BD5D3438()
{
  return sub_1BD5D33A8(&qword_1E9FC6850, type metadata accessor for UIRectCorner);
}

uint64_t sub_1BD5D3480()
{
  sub_1BD60A540();
  sub_1BD60A550();

  return swift_bridgeObjectRelease();
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void sub_1BD5D3510(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1BD5D3558()
{
  return sub_1BD5D33A8(&qword_1E9FC6860, type metadata accessor for Key);
}

uint64_t sub_1BD5D35A0()
{
  return sub_1BD5D33A8(&qword_1E9FC6868, type metadata accessor for Key);
}

uint64_t sub_1BD5D35E8()
{
  return sub_1BD5D33A8(&qword_1EBA199F0, type metadata accessor for Key);
}

uint64_t sub_1BD5D3630(uint64_t a1, id *a2)
{
  uint64_t result = sub_1BD60A520();
  *a2 = 0;
  return result;
}

uint64_t sub_1BD5D36A8(uint64_t a1, id *a2)
{
  char v3 = sub_1BD60A530();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BD5D3728()
{
  sub_1BD60A540();
  uint64_t v0 = sub_1BD60A510();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BD5D3760(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_1BD60A540();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

void destroy for GridViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for GridViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for GridViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void **)(a2 + 32);
  long long v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for GridViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for GridViewModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GridViewModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GridViewModel()
{
  return &type metadata for GridViewModel;
}

BOOL static LineCap.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LineCap.hash(into:)()
{
  return sub_1BD60AB80();
}

uint64_t LineCap.hashValue.getter()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5D3AD8()
{
  return sub_1BD60ABA0();
}

unint64_t sub_1BD5D3B20()
{
  unint64_t result = qword_1E9FC6878;
  if (!qword_1E9FC6878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6878);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LineCap(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LineCap(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD5D3CCCLL);
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

uint64_t sub_1BD5D3CF4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1BD5D3CFC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LineCap()
{
  return &type metadata for LineCap;
}

uint64_t dispatch thunk of ChartInteractorType.dataPoint(for:model:size:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of CategoryCoordinateCalculatorType.location(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of CategoryCoordinateCalculatorType.category(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_1BD5D3D70(double a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  char v6 = *a5;
  uint64_t v7 = *(void *)(a4 + *(int *)(type metadata accessor for CategoryAxis() + 20));
  if (!*(void *)(v7 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1BD5ED34C();
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
  swift_bridgeObjectRelease();
  if (a1 <= 0.0) {
    return 0;
  }
  sub_1BD5D40B0();
  uint64_t result = sub_1BD60A330();
  uint64_t v12 = result - 1;
  BOOL v13 = __OFSUB__(result, 1);
  if ((v6 & 1) == 0)
  {
    if (!v13)
    {
      double v14 = a1 / (double)v12 * (double)v10;
      goto LABEL_14;
    }
LABEL_21:
    __break(1u);
    return result;
  }
  if (v13)
  {
    __break(1u);
    goto LABEL_21;
  }
  double v14 = a1 - a1 / (double)v12 * (double)v10;
LABEL_14:
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0 || v14 == 1.79769313e308) {
    return 0;
  }
  else {
    return *(void *)&v14;
  }
}

uint64_t sub_1BD5D3E90(double a1, double a2, uint64_t a3, unsigned __int8 *a4)
{
  int v6 = *a4;
  BOOL v7 = sub_1BD5D3FDC();
  uint64_t result = 0;
  if (v7 || a2 <= 0.0) {
    return result;
  }
  sub_1BD5D40B0();
  uint64_t result = sub_1BD60A330();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  double v9 = a1 / a2;
  if (v6) {
    double v9 = 1.0 - a1 / a2;
  }
  double v10 = round(v9 * (double)(result - 1));
  if ((~*(void *)&v10 & 0x7FF0000000000000) == 0) {
    goto LABEL_14;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t v11 = (uint64_t)v10;
  sub_1BD5D410C();
  sub_1BD60A680();
  sub_1BD60A6A0();
  uint64_t v12 = sub_1BD60A690();
  uint64_t result = 0;
  if ((v11 & 0x8000000000000000) == 0 && v12 > v11)
  {
    sub_1BD60A350();
    return v13;
  }
  return result;
}

BOOL sub_1BD5D3FDC()
{
  sub_1BD5D40B0();
  sub_1BD5D410C();
  sub_1BD60A680();
  sub_1BD60A6A0();
  return v2 == v1;
}

uint64_t sub_1BD5D4048()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for CategoryCoordinateCalculator()
{
  return self;
}

uint64_t sub_1BD5D407C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, double a5)
{
  return sub_1BD5D3D70(a5, a1, a2, a3, a4);
}

uint64_t sub_1BD5D4098(uint64_t a1, unsigned __int8 *a2, double a3, double a4)
{
  return sub_1BD5D3E90(a3, a4, a1, a2);
}

void sub_1BD5D40B0()
{
  if (!qword_1EBA1AA20)
  {
    unint64_t v0 = sub_1BD60A340();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1AA20);
    }
  }
}

unint64_t sub_1BD5D410C()
{
  unint64_t result = qword_1EBA1AA18;
  if (!qword_1EBA1AA18)
  {
    sub_1BD5D40B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1AA18);
  }
  return result;
}

uint64_t sub_1BD5D415C(CGFloat a1, CGFloat a2, CGFloat a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_1BD60A140();
  OUTLINED_FUNCTION_1();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_3();
  uint64_t v17 = v16 - v15;
  __swift_project_boxed_opaque_existential_1((void *)(v6 + 16), *(void *)(v6 + 40));
  OUTLINED_FUNCTION_2();
  id v19 = sub_1BD601964(v18);
  __swift_project_boxed_opaque_existential_1((void *)(v6 + 16), *(void *)(v6 + 40));
  double v20 = OUTLINED_FUNCTION_2();
  id v23 = sub_1BD601AA0(v21, v20, v22);
  if (a1 == 0.0 || a2 == 0.0)
  {

    return 0;
  }
  v49.width = a1;
  v49.height = a2;
  UIGraphicsBeginImageContextWithOptions(v49, 0, a3);
  v26 = UIGraphicsGetCurrentContext();
  if (!v26)
  {
    sub_1BD5D4860();
    v35 = (void *)sub_1BD60A7C0();
    sub_1BD60A710();
    sub_1BD60A470();

    return 0;
  }
  v27 = v26;
  objc_msgSend(*(id *)(a6 + 32), sel_setStroke);
  objc_msgSend(v19, sel_setLineWidth_, *(double *)(a6 + 24));
  uint64_t v28 = *(void *)(a6 + 16);
  if (v28)
  {
    int64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
      v47 = v27;
      uint64_t v48 = MEMORY[0x1E4FBC860];
      id v46 = v19;
      sub_1BD5D48B0(0, v29, 0);
      v30 = (uint64_t *)(v28 + 32);
      unint64_t v31 = *(void *)(v48 + 16);
      do
      {
        uint64_t v33 = *v30++;
        uint64_t v32 = v33;
        unint64_t v34 = *(void *)(v48 + 24);
        if (v31 >= v34 >> 1) {
          sub_1BD5D48B0((char *)(v34 > 1), v31 + 1, 1);
        }
        *(void *)(v48 + 16) = v31 + 1;
        *(double *)(v48 + 8 * v31++ + 32) = (double)v32;
        --v29;
      }
      while (v29);
      id v19 = v46;
      v27 = v47;
    }
    sub_1BD60A6F0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v19, sel_stroke);
  unint64_t v36 = *(void *)(a6 + 48);
  if ((*(unsigned char *)(a6 + 56) & 1) == 0)
  {
    objc_msgSend((id)v36, sel_setFill);
    v42 = (const CGPath *)objc_msgSend(v23, sel_CGPath);
    CGContextAddPath(v27, v42);

    (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v17, *MEMORY[0x1E4F1DA40], v11);
    sub_1BD60A700();
    sub_1BD5D48A0((void *)v36, 0);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
LABEL_31:
    v24 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return (uint64_t)v24;
  }
  swift_bridgeObjectRetain();
  objc_msgSend(v23, sel_addClip);
  if (!(v36 >> 62))
  {
    uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v37) {
      goto LABEL_19;
    }
LABEL_28:
    sub_1BD5D48A0((void *)v36, 1);
    type metadata accessor for CGColor(0);
    CFArrayRef v43 = (const __CFArray *)sub_1BD60A5A0();
    swift_bridgeObjectRelease();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v45 = CGGradientCreateWithColors(DeviceRGB, v43, 0);

    if (v45)
    {
      v50.x = 0.0;
      v50.y = 0.0;
      v51.x = 0.0;
      v51.y = a2;
      CGContextDrawLinearGradient(v27, v45, v50, v51, 0);
    }
    else
    {
    }
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_1BD60AA10();
  sub_1BD5D48A0((void *)v36, 1);
  if (!v37) {
    goto LABEL_28;
  }
LABEL_19:
  uint64_t result = sub_1BD60A980();
  if ((v37 & 0x8000000000000000) == 0)
  {
    uint64_t v38 = 0;
    do
    {
      if ((v36 & 0xC000000000000001) != 0) {
        id v39 = (id)MEMORY[0x1C187E170](v38, v36);
      }
      else {
        id v39 = *(id *)(v36 + 8 * v38 + 32);
      }
      v40 = v39;
      ++v38;
      id v41 = objc_msgSend(v39, sel_CGColor);

      sub_1BD60A960();
      sub_1BD60A990();
      sub_1BD60A9A0();
      sub_1BD60A970();
    }
    while (v37 != v38);
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5D4638@<X0>(uint64_t a1@<X0>, void *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v9 = *v4;
  __swift_project_boxed_opaque_existential_1(v4 + 2, v4[5]);
  sub_1BD601B90(a1, v26, a3, a4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v26[3]);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = (uint64_t *)(v12 - v11);
  (*(void (**)(uint64_t))(v14 + 16))(v12 - v11);
  uint64_t v15 = *v13;
  uint64_t v16 = type metadata accessor for LinePathGenerator();
  v25[3] = v16;
  v25[4] = &off_1F17FF7D0;
  v25[0] = v15;
  uint64_t v17 = (void *)swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v16);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_3();
  v21 = (uint64_t *)(v20 - v19);
  (*(void (**)(uint64_t))(v22 + 16))(v20 - v19);
  uint64_t v23 = *v21;
  v17[5] = v16;
  v17[6] = &off_1F17FF7D0;
  v17[2] = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  a2[3] = v9;
  a2[4] = &off_1F17FDD68;
  *a2 = v17;
  return result;
}

uint64_t sub_1BD5D4804()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t type metadata accessor for LineImageGenerator()
{
  return self;
}

unint64_t sub_1BD5D4860()
{
  unint64_t result = qword_1E9FC6880;
  if (!qword_1E9FC6880)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9FC6880);
  }
  return result;
}

void sub_1BD5D48A0(void *a1, char a2)
{
  if (a2) {
    swift_bridgeObjectRelease();
  }
  else {
}
  }

char *sub_1BD5D48B0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D49F0(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D48D0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D4AF4(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D48F0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D4C00(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

void *sub_1BD5D4910(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D4D1C(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D4930(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D4E34(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D4950(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D4F40(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D4970(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D504C(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D4990(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D5164(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D49B0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D5280(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D49D0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1BD5D538C(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1BD5D49F0(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1E9FC6888);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12) {
      memmove(v12, v13, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1BD5D4AF4(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A80);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D4C00(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A30);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[48 * v8] <= v12) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_1BD5D4D1C(void *result, int64_t a2, char a3, void *a4)
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
    sub_1BD5D557C();
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_1BD5D55D4();
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D4E34(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A40);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D4F40(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A50);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12) {
      memmove(v12, v13, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D504C(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[48 * v8] <= v12) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D5164(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A38);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[80 * v8] <= v12) {
      memmove(v12, v13, 80 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D5280(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A68);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D538C(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5D5534(0, &qword_1EBA19A90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1BD5D54A4(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[16 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0(a3, result);
  }
  return result;
}

char *sub_1BD5D54C4(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[48 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0(a3, result);
  }
  return result;
}

char *sub_1BD5D54EC(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[80 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0(a3, result);
  }
  return result;
}

char *sub_1BD5D5514(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[8 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0(a3, result);
  }
  return result;
}

void sub_1BD5D5534(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1BD60AAD0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_1BD5D557C()
{
  if (!qword_1EBA19A70)
  {
    sub_1BD5D55D4();
    unint64_t v0 = sub_1BD60AAD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19A70);
    }
  }
}

void sub_1BD5D55D4()
{
  if (!qword_1EBA199B8)
  {
    type metadata accessor for LineStyle();
    unint64_t v0 = sub_1BD60A4F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA199B8);
    }
  }
}

uint64_t OUTLINED_FUNCTION_4()
{
  return 0;
}

uint64_t sub_1BD5D5644(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - result;
  if (__OFSUB__(a2, result)) {
    goto LABEL_19;
  }
  if (v3)
  {
    uint64_t v5 = result;
    uint64_t v22 = MEMORY[0x1E4FBC860];
    unint64_t result = sub_1BD60A980();
    if (a2 < v5 || v3 < 0) {
      goto LABEL_20;
    }
    uint64_t v18 = v3;
    uint64_t v6 = 0;
    while (v6 != v3)
    {
      __swift_project_boxed_opaque_existential_1((void *)(a3 + 56), *(void *)(a3 + 80));
      uint64_t v7 = *(void *)(sub_1BD5F59C4(v5) + 64);
      int64_t v8 = *(void *)(v7 + 16);
      if (v8)
      {
        uint64_t v20 = v5;
        uint64_t v21 = MEMORY[0x1E4FBC860];
        swift_bridgeObjectRetain();
        sub_1BD5D48D0(0, v8, 0);
        uint64_t v9 = v21;
        uint64_t v10 = (uint64_t *)(v7 + 40);
        do
        {
          uint64_t v12 = *(v10 - 1);
          uint64_t v11 = *v10;
          unint64_t v14 = *(void *)(v21 + 16);
          unint64_t v13 = *(void *)(v21 + 24);
          swift_bridgeObjectRetain();
          if (v14 >= v13 >> 1) {
            sub_1BD5D48D0((char *)(v13 > 1), v14 + 1, 1);
          }
          v10 += 3;
          *(void *)(v21 + 16) = v14 + 1;
          unint64_t v15 = v21 + 16 * v14;
          *(void *)(v15 + 32) = v12;
          *(void *)(v15 + 40) = v11;
          --v8;
        }
        while (v8);
        swift_bridgeObjectRelease();
        uint64_t v5 = v20;
        uint64_t v3 = v18;
      }
      else
      {
        uint64_t v9 = MEMORY[0x1E4FBC860];
      }
      ++v6;
      id v16 = objc_allocWithZone((Class)type metadata accessor for LineSeriesView());
      sub_1BD5DBD64(v9);
      swift_release();
      sub_1BD60A960();
      sub_1BD60A990();
      sub_1BD60A9A0();
      unint64_t result = sub_1BD60A970();
      ++v5;
      if (v6 == v3)
      {
        uint64_t v17 = v22;
        swift_release();
        return v17;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  swift_release();
  return MEMORY[0x1E4FBC860];
}

uint64_t LineChartViewProvider.zoneManager.getter()
{
  return swift_retain();
}

uint64_t LineChartViewProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return v0;
}

uint64_t LineChartViewProvider.__deallocating_deinit()
{
  LineChartViewProvider.deinit();

  return MEMORY[0x1F4186488](v0, 104, 7);
}

void *LineChartViewProvider.view(for:style:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + *(int *)(type metadata accessor for LineChartModel() + 20)) + 16);
  swift_retain();
  unint64_t v3 = sub_1BD5D5644(0, v2, v1);
  id v4 = objc_allocWithZone((Class)type metadata accessor for LineChartView());
  return LineChartView.init(seriesViews:)(v3);
}

uint64_t LineChartViewProvider.present(_:on:attributes:)(uint64_t a1, void *a2, uint64_t a3)
{
  sub_1BD5D5C9C();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_2_0();
  double v9 = *(double *)a3;
  CGFloat v10 = *(double *)(a3 + 8);
  CGFloat v11 = *(double *)(a3 + 16);
  CGFloat v12 = *(double *)(a3 + 24);
  double v13 = *(double *)(a3 + 32);
  double v14 = *(double *)(a3 + 40);
  double v15 = *(double *)(a3 + 48);
  double v16 = *(double *)(a3 + 56);
  double v26 = *(double *)(a3 + 64);
  double v25 = *(double *)(a3 + 72);
  double v24 = *(double *)(a3 + 80);
  double v23 = *(double *)(a3 + 88);
  long long v22 = *(_OWORD *)(a3 + 96);
  v29.origin.x = *(CGFloat *)a3;
  v29.origin.y = v10;
  v29.size.width = v11;
  v29.size.height = v12;
  uint64_t result = CGRectIsEmpty(v29);
  if ((result & 1) == 0)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
    OUTLINED_FUNCTION_4_0();
    swift_beginAccess();
    uint64_t v18 = OUTLINED_FUNCTION_1_0();
    v19(v18);
    v27[0] = v9;
    v27[1] = v10;
    v27[2] = v11;
    v27[3] = v12;
    v27[4] = v13;
    v27[5] = v14;
    v27[6] = v15;
    v27[7] = v16;
    v27[8] = v26;
    v27[9] = v25;
    v27[10] = v24;
    v27[11] = v23;
    long long v28 = v22;
    sub_1BD5DF1E8(a1, v4, a2, v27);
    uint64_t v20 = OUTLINED_FUNCTION_3_0();
    return v21(v20);
  }
  return result;
}

void *sub_1BD5D5AFC(uint64_t a1)
{
  return LineChartViewProvider.view(for:style:)(a1);
}

uint64_t sub_1BD5D5B20(uint64_t a1, void *a2, uint64_t a3)
{
  return LineChartViewProvider.present(_:on:attributes:)(a1, a2, a3);
}

uint64_t LineChartViewProvider.updateZones(with:view:)(uint64_t a1, void *a2)
{
  sub_1BD5D5C9C();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_2_0();
  sub_1BD5D5D9C(v2 + 16, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  OUTLINED_FUNCTION_4_0();
  swift_beginAccess();
  uint64_t v7 = OUTLINED_FUNCTION_1_0();
  v8(v7);
  objc_msgSend(a2, sel_bounds);
  v14[0] = v9;
  v14[1] = v10;
  sub_1BD5E0080(v3, a1, (uint64_t)a2, v14);
  uint64_t v11 = OUTLINED_FUNCTION_3_0();
  v12(v11);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t sub_1BD5D5C4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LineChartViewProvider.zoneManager.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1BD5D5C78(uint64_t a1, void *a2)
{
  return LineChartViewProvider.updateZones(with:view:)(a1, a2);
}

void sub_1BD5D5C9C()
{
  if (!qword_1EBA19528)
  {
    sub_1BD5D5D04();
    sub_1BD5D5D50();
    unint64_t v0 = sub_1BD60A340();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19528);
    }
  }
}

unint64_t sub_1BD5D5D04()
{
  unint64_t result = qword_1EBA1AB58;
  if (!qword_1EBA1AB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1AB58);
  }
  return result;
}

unint64_t sub_1BD5D5D50()
{
  unint64_t result = qword_1EBA1AB50;
  if (!qword_1EBA1AB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1AB50);
  }
  return result;
}

uint64_t sub_1BD5D5D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BD5D5E00()
{
  return sub_1BD5D5E90((unint64_t *)&qword_1EBA1ACA0, (void (*)(uint64_t))type metadata accessor for LineChartModel);
}

uint64_t sub_1BD5D5E48()
{
  return sub_1BD5D5E90(&qword_1EBA19550, (void (*)(uint64_t))sub_1BD5D5ED8);
}

uint64_t sub_1BD5D5E90(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BD5D5ED8()
{
  if (!qword_1EBA1AAB0)
  {
    sub_1BD5D5F34();
    unint64_t v0 = type metadata accessor for ZoneManager();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1AAB0);
    }
  }
}

unint64_t sub_1BD5D5F34()
{
  unint64_t result = qword_1EBA1AB60[0];
  if (!qword_1EBA1AB60[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBA1AB60);
  }
  return result;
}

uint64_t type metadata accessor for LineChartViewProvider()
{
  return self;
}

uint64_t method lookup function for LineChartViewProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineChartViewProvider);
}

uint64_t dispatch thunk of ChartCoordinateProviderType.register(model:size:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ChartCoordinateProviderType.location(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

id SeriesStyle.strokeColor.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

id SeriesStyle.fill.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = *(void **)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  return sub_1BD5D6054(v2, v3);
}

id sub_1BD5D6054(void *a1, char a2)
{
  if (a2) {
    return (id)swift_bridgeObjectRetain();
  }
  else {
    return a1;
  }
}

uint64_t SeriesStyle.init(strokeColor:fill:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 16) = v4;
  return result;
}

void destroy for SeriesStyle(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);

  sub_1BD5D48A0(v2, v3);
}

uint64_t _s9TeaCharts11SeriesStyleVwCP_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  char v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 16);
  id v6 = v3;
  sub_1BD5D6054(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SeriesStyle(uint64_t a1, void **a2)
{
  id v2 = a2;
  char v4 = *(void **)a1;
  char v5 = *a2;
  *(void *)a1 = *a2;
  id v6 = v5;

  uint64_t v7 = v2[1];
  LOBYTE(v2) = *((unsigned char *)v2 + 16);
  sub_1BD5D6054(v7, (char)v2);
  uint64_t v8 = *(void **)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = (_BYTE)v2;
  sub_1BD5D48A0(v8, v9);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SeriesStyle(uint64_t a1, uint64_t a2)
{
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  char v5 = *(unsigned char *)(a2 + 16);
  id v6 = *(void **)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1BD5D48A0(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SeriesStyle(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
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

uint64_t storeEnumTagSinglePayload for SeriesStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SeriesStyle()
{
  return &type metadata for SeriesStyle;
}

uint64_t ZoneStyle.init(identifier:style:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  char v7 = (char *)a5 + *(int *)(type metadata accessor for ZoneStyle() + 28);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32);

  return v8(v7, a3, a4);
}

uint64_t type metadata accessor for ZoneStyle()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BD5D6330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t sub_1BD5D6338()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BD5D63D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    double v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_1BD5D64DC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_1BD5D6550(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_1BD5D65E0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_1BD5D6678(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_1BD5D66E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1BD5D6770(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 16) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 16) & ~v7, v6, v4);
      }
      unint64_t v16 = *((void *)a1 + 1);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_1BD5D6900(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
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
  size_t v11 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
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
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1BD5D6B4CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v20 = (unint64_t)&a1[v10 + 16] & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t dispatch thunk of ChartLayoutAttributesProviderType.chartLayoutAttributes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1BD5D6B88(uint64_t a1, uint64_t a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = type metadata accessor for LineChartModel();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x1F4188790](v16);
  int v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  swift_retain();
  uint64_t v21 = swift_bridgeObjectRetain();
  uint64_t v32 = sub_1BD5D6DFC(v21, (void (*)(uint64_t, void *))sub_1BD5D7C74);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = sub_1BD5D6F40(v22, a9);
  swift_bridgeObjectRelease();
  v31[1] = sub_1BD60A240();
  sub_1BD5D7C7C(a8, (uint64_t)v19);
  unint64_t v24 = (*(unsigned __int8 *)(v17 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v25 = (v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v28 = (double *)swift_allocObject();
  v28[2] = a3;
  v28[3] = a4;
  v28[4] = a5;
  sub_1BD5D7F34((uint64_t)v19, (uint64_t)v28 + v24);
  *(void *)((char *)v28 + v25) = v32;
  *(void *)((char *)v28 + v26) = a9;
  *(void *)((char *)v28 + v27) = v23;
  CGRect v29 = (uint64_t (**)(uint64_t))((char *)v28 + ((v27 + 15) & 0xFFFFFFFFFFFFFFF8));
  *CGRect v29 = sub_1BD5D7C3C;
  v29[1] = (uint64_t (*)(uint64_t))v20;
  swift_retain();
  sub_1BD60A230();
  return swift_release();
}

uint64_t sub_1BD5D6DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BD5F59C4(a1);
}

uint64_t sub_1BD5D6DFC(uint64_t a1, void (*a2)(uint64_t, void *))
{
  uint64_t v11 = MEMORY[0x1E4FBC860];
  sub_1BD60A980();
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v8 = *(v6 - 1);
      uint64_t v7 = *v6;
      v10[0] = *(v6 - 2);
      v10[1] = v8;
      v10[2] = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a2(v5, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BD60A960();
      sub_1BD60A990();
      sub_1BD60A9A0();
      sub_1BD60A970();
      v6 += 3;
      ++v5;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1BD5D6F40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v19 = MEMORY[0x1E4FBC860];
  sub_1BD5D4910(0, 0, 0);
  uint64_t v6 = v19;
  uint64_t v7 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v7)
  {
    uint64_t v8 = 0;
    unsigned int v9 = (uint64_t *)(a1 + 48);
    while (1)
    {
      uint64_t v10 = *(v9 - 1);
      uint64_t v11 = *v9;
      uint64_t v12 = *(v9 - 2);
      v18[0] = v8;
      v18[1] = v12;
      v18[2] = v10;
      v18[3] = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BD5D734C(v18, a2, &v17);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = v17;
      uint64_t v19 = v6;
      unint64_t v15 = *(void *)(v6 + 16);
      unint64_t v14 = *(void *)(v6 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_1BD5D4910((void *)(v14 > 1), v15 + 1, 1);
        uint64_t v6 = v19;
      }
      ++v8;
      v9 += 3;
      *(void *)(v6 + 16) = v15 + 1;
      *(void *)(v6 + 8 * v15 + 32) = v13;
      if (v7 == v8) {
        goto LABEL_7;
      }
    }
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_7:
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1BD5D70BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v39 = MEMORY[0x1E4FBC860];
  sub_1BD5D4930(0, 0, 0);
  uint64_t v14 = v39;
  uint64_t v15 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v36 = v15;
  uint64_t v37 = a4;
  if (v15)
  {
    unint64_t v16 = 0;
    unint64_t v34 = a2 & 0xC000000000000001;
    v35 = (void *)(a3 + 16);
    uint64_t v31 = a4 + 32;
    uint64_t v32 = a2;
    uint64_t v17 = (uint64_t *)(a1 + 48);
    uint64_t v18 = a2;
    uint64_t v33 = a3;
    while (1)
    {
      uint64_t v20 = *(v17 - 2);
      uint64_t v19 = *(v17 - 1);
      uint64_t v21 = *v17;
      sub_1BD600AA8(v16, v34 == 0, v18);
      if (v34)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v22 = MEMORY[0x1C187E170](v16, v18);
      }
      else
      {
        uint64_t v22 = *(void *)(v18 + 8 * v16 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
      }
      __swift_project_boxed_opaque_existential_1(v35, *(void *)(a3 + 40));
      uint64_t result = sub_1BD5D415C(a5, a6, a7, v21, (uint64_t)v38, v22);
      if (v16 >= *(void *)(v37 + 16)) {
        break;
      }
      uint64_t v24 = a3;
      uint64_t v25 = result;
      uint64_t v26 = *(void *)(v31 + 8 * v16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_1BD5D7580(MEMORY[0x1E4FBC868], v26, v24, a5, a6, a7, v20, v19, v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v39 = v14;
      unint64_t v29 = *(void *)(v14 + 16);
      unint64_t v28 = *(void *)(v14 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_1BD5D4930((char *)(v28 > 1), v29 + 1, 1);
        uint64_t v14 = v39;
      }
      ++v16;
      v17 += 3;
      *(void *)(v14 + 16) = v29 + 1;
      uint64_t v30 = v14 + 16 * v29;
      *(void *)(v30 + 32) = v25;
      *(void *)(v30 + 40) = v27;
      uint64_t v18 = v32;
      a3 = v33;
      if (v36 == v16) {
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return v14;
  }
  return result;
}

uint64_t sub_1BD5D734C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 56), *(void *)(a2 + 80));
  uint64_t v5 = *(void *)(sub_1BD5F59C4(v4) + 64);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (uint64_t *)(v5 + 48);
    uint64_t v8 = (void *)MEMORY[0x1E4FBC868];
    while (1)
    {
      uint64_t v24 = v6;
      uint64_t v10 = *(v7 - 2);
      uint64_t v9 = *(v7 - 1);
      uint64_t v11 = *v7;
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v12 = sub_1BD5ED34C();
      if (__OFADD__(v8[2], (v13 & 1) == 0)) {
        break;
      }
      unint64_t v14 = v12;
      char v15 = v13;
      sub_1BD5D8094(0, &qword_1EBA19BB0, (void (*)(uint64_t))type metadata accessor for LineStyle);
      if (sub_1BD60A9D0())
      {
        unint64_t v16 = sub_1BD5ED34C();
        if ((v15 & 1) != (v17 & 1)) {
          goto LABEL_17;
        }
        unint64_t v14 = v16;
      }
      if (v15)
      {
        uint64_t v18 = v8[7];
        swift_release();
        *(void *)(v18 + 8 * v14) = v11;
      }
      else
      {
        v8[(v14 >> 6) + 8] |= 1 << v14;
        uint64_t v19 = (void *)(v8[6] + 16 * v14);
        *uint64_t v19 = v10;
        v19[1] = v9;
        *(void *)(v8[7] + 8 * v14) = v11;
        uint64_t v20 = v8[2];
        BOOL v21 = __OFADD__(v20, 1);
        uint64_t v22 = v20 + 1;
        if (v21) {
          goto LABEL_16;
        }
        v8[2] = v22;
        swift_bridgeObjectRetain();
      }
      swift_release();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v7 += 3;
      --v6;
      if (v24 == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BD60AB10();
    __break(1u);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FBC868];
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *a3 = v8;
  }
  return result;
}

uint64_t sub_1BD5D7580(void *a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1BD5DC4C0(v65, a2);
  int64_t v14 = v65[3];
  unint64_t v15 = v65[4];
  uint64_t v58 = a3;
  v55 = (void *)(a3 + 16);
  uint64_t v56 = v65[0];
  uint64_t v53 = v65[1];
  int64_t v54 = (unint64_t)(v65[2] + 64) >> 6;
  swift_bridgeObjectRetain();
  if (!v15) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v16 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  unint64_t v17 = v16 | (v14 << 6);
  while (1)
  {
    uint64_t v22 = (uint64_t *)(*(void *)(v56 + 48) + 16 * v17);
    uint64_t v23 = v22[1];
    uint64_t v60 = *v22;
    uint64_t v24 = *(void *)(*(void *)(v56 + 56) + 8 * v17);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    if (UIAccessibilityIsBoldTextEnabled())
    {
      uint64_t v25 = *(void *)(v24 + 16);
      double v26 = *(double *)(v24 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v27 = *(void **)(v24 + 32);
      char v28 = *(unsigned char *)(v24 + 40);
      v63[0] = v25;
      *(double *)&v63[1] = v26 * 1.5;
      v63[2] = v27;
      char v64 = v28;
      char v30 = *(unsigned char *)(v24 + 56);
      v61 = *(void **)(v24 + 48);
      unint64_t v29 = v61;
      char v62 = v30;
      uint64_t v31 = *(void *)(v24 + 64);
      id v32 = v27;
      sub_1BD5D6054(v29, v30);
      swift_bridgeObjectRetain();
      swift_release();
      type metadata accessor for LineStyle();
      swift_allocObject();
      uint64_t v33 = LineStyle.init(stroke:fill:zoneStyles:)((uint64_t)v63, (uint64_t *)&v61, v31);
    }
    else
    {
      swift_release();
      uint64_t v33 = v24;
    }
    __swift_project_boxed_opaque_existential_1(v55, *(void *)(v58 + 40));
    uint64_t v34 = sub_1BD5D415C(a4, a5, a6, a9, (uint64_t)v63, v33);
    if (!v34)
    {
      swift_bridgeObjectRetain();
      unint64_t v44 = sub_1BD5ED34C();
      char v46 = v45;
      swift_bridgeObjectRelease();
      if (v46)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v63[0] = a1;
        sub_1BD5D8094(0, &qword_1EBA19BD0, (void (*)(uint64_t))sub_1BD5D8054);
        sub_1BD60A9D0();
        a1 = (void *)v63[0];
        swift_bridgeObjectRelease();
        v47 = *(void **)(a1[7] + 8 * v44);
        sub_1BD5D8054();
        sub_1BD60A9E0();
        swift_release();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease_n();
      }
      goto LABEL_35;
    }
    uint64_t v35 = v34;
    unint64_t v59 = v15;
    uint64_t v36 = v14;
    swift_isUniquelyReferenced_nonNull_native();
    v63[0] = a1;
    unint64_t v37 = sub_1BD5ED34C();
    if (__OFADD__(a1[2], (v38 & 1) == 0)) {
      break;
    }
    unint64_t v39 = v37;
    char v40 = v38;
    sub_1BD5D8094(0, &qword_1EBA19BD0, (void (*)(uint64_t))sub_1BD5D8054);
    if (sub_1BD60A9D0())
    {
      unint64_t v41 = sub_1BD5ED34C();
      if ((v40 & 1) != (v42 & 1)) {
        goto LABEL_41;
      }
      unint64_t v39 = v41;
    }
    a1 = (void *)v63[0];
    if (v40)
    {
      uint64_t v43 = *(void *)(v63[0] + 56);

      *(void *)(v43 + 8 * v39) = v35;
    }
    else
    {
      *(void *)(v63[0] + 8 * (v39 >> 6) + 64) |= 1 << v39;
      uint64_t v48 = (void *)(a1[6] + 16 * v39);
      *uint64_t v48 = v60;
      v48[1] = v23;
      *(void *)(a1[7] + 8 * v39) = v35;
      uint64_t v49 = a1[2];
      BOOL v50 = __OFADD__(v49, 1);
      uint64_t v51 = v49 + 1;
      if (v50) {
        goto LABEL_40;
      }
      a1[2] = v51;
      swift_bridgeObjectRetain();
    }
    swift_release();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    int64_t v14 = v36;
    unint64_t v15 = v59;
LABEL_35:
    swift_release();
    if (v15) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      goto LABEL_39;
    }
    if (v18 >= v54) {
      goto LABEL_37;
    }
    unint64_t v19 = *(void *)(v53 + 8 * v18);
    int64_t v20 = v14 + 1;
    if (!v19)
    {
      int64_t v20 = v14 + 2;
      if (v14 + 2 >= v54) {
        goto LABEL_37;
      }
      unint64_t v19 = *(void *)(v53 + 8 * v20);
      if (!v19)
      {
        int64_t v20 = v14 + 3;
        if (v14 + 3 >= v54) {
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v53 + 8 * v20);
        if (!v19)
        {
          int64_t v20 = v14 + 4;
          if (v14 + 4 >= v54) {
            goto LABEL_37;
          }
          unint64_t v19 = *(void *)(v53 + 8 * v20);
          if (!v19)
          {
            int64_t v20 = v14 + 5;
            if (v14 + 5 >= v54) {
              goto LABEL_37;
            }
            unint64_t v19 = *(void *)(v53 + 8 * v20);
            if (!v19)
            {
              int64_t v21 = v14 + 6;
              while (v21 < v54)
              {
                unint64_t v19 = *(void *)(v53 + 8 * v21++);
                if (v19)
                {
                  int64_t v20 = v21 - 1;
                  goto LABEL_18;
                }
              }
LABEL_37:
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              return (uint64_t)a1;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v15 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
    int64_t v14 = v20;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_1BD60AB10();
  __break(1u);
  return result;
}

uint64_t sub_1BD5D7AC4(CGFloat a1, CGFloat a2, CGFloat a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t))
{
  type metadata accessor for LineChartModel();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = sub_1BD5D70BC(v15, a5, a6, a7, a1, a2, a3);
  swift_bridgeObjectRelease();
  a8(v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BD5D7BA0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t type metadata accessor for LineChartImageLoader()
{
  return self;
}

uint64_t sub_1BD5D7C04()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD5D7C3C(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1BD5D7C74(uint64_t a1, uint64_t a2)
{
  return sub_1BD5D6DC4(a1, a2, v2);
}

uint64_t sub_1BD5D7C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LineChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD5D7CE0()
{
  uint64_t v1 = (int *)(type metadata accessor for LineChartModel() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  sub_1BD5D40B0();
  OUTLINED_FUNCTION_0_1();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(v6 + *(int *)(v8 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v6 + v1[10];
  sub_1BD60A130();
  OUTLINED_FUNCTION_0_1();
  (*(void (**)(uint64_t))(v10 + 8))(v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

void sub_1BD5D7EB4()
{
  if (!qword_1EBA1ADD0)
  {
    type metadata accessor for CategoryAxis();
    unint64_t v0 = type metadata accessor for CoordinateSpace();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1ADD0);
    }
  }
}

uint64_t sub_1BD5D7F34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LineChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD5D7F98()
{
  uint64_t v1 = *(void *)(type metadata accessor for LineChartModel() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  CGFloat v6 = v0[2];
  CGFloat v7 = v0[3];
  CGFloat v8 = v0[4];
  uint64_t v9 = *(void *)((char *)v0 + v3);
  uint64_t v10 = *(void *)((char *)v0 + v4);
  uint64_t v11 = *(void *)((char *)v0 + v5);
  unint64_t v12 = *(void (**)(uint64_t))((char *)v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_1BD5D7AC4(v6, v7, v8, (uint64_t)v0 + v2, v9, v10, v11, v12);
}

unint64_t sub_1BD5D8054()
{
  unint64_t result = qword_1EBA1BC70;
  if (!qword_1EBA1BC70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA1BC70);
  }
  return result;
}

void sub_1BD5D8094(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BD60A9F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1BD5D80F8(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t v18 = v17;
  int64_t v19 = *(void *)(a1 + 16);
  uint64_t v20 = MEMORY[0x1E4FBC860];
  if (v19)
  {
    uint64_t v56 = MEMORY[0x1E4FBC860];
    sub_1BD5D4970(0, v19, 0);
    uint64_t v20 = v56;
    for (i = (long long *)(a1 + 56); ; i += 5)
    {
      char v31 = *((unsigned char *)i + 16);
      id v46 = (id)*((void *)i - 3);
      long long v47 = *(i - 1);
      long long v48 = *i;
      char v49 = v31;
      long long v32 = *(long long *)((char *)i + 40);
      long long v50 = *(long long *)((char *)i + 24);
      long long v51 = v32;
      id v33 = v46;
      sub_1BD5D8C40((uint64_t)&v46, a2, a3, (uint64_t)&v52, a4, a5, a6, a7, a8, a9, a10, a11, a12);
      if (v18) {
        break;
      }
      uint64_t v18 = 0;

      long long v34 = v52;
      long long v35 = v53;
      uint64_t v36 = v54;
      char v37 = v55;
      uint64_t v56 = v20;
      unint64_t v39 = *(void *)(v20 + 16);
      unint64_t v38 = *(void *)(v20 + 24);
      if (v39 >= v38 >> 1)
      {
        long long v42 = v53;
        long long v43 = v52;
        sub_1BD5D4970((char *)(v38 > 1), v39 + 1, 1);
        long long v35 = v42;
        long long v34 = v43;
        uint64_t v20 = v56;
      }
      *(void *)(v20 + 16) = v39 + 1;
      uint64_t v40 = v20 + 48 * v39;
      *(_OWORD *)(v40 + 32) = v34;
      *(_OWORD *)(v40 + 48) = v35;
      *(void *)(v40 + 64) = v36;
      *(unsigned char *)(v40 + 72) = v37;
      if (!--v19) {
        return v20;
      }
    }
    swift_release();
  }
  return v20;
}

uint64_t sub_1BD5D82C4(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  int64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v50 = MEMORY[0x1E4FBC860];
    sub_1BD5D4950(0, v8, 0);
    uint64_t v16 = a2;
    uint64_t v17 = v50;
    uint64_t v18 = (_OWORD *)(a1 + 96);
    do
    {
      uint64_t v37 = v17;
      int64_t v38 = v8;
      char v19 = *((unsigned char *)v18 - 64);
      uint64_t v20 = *((void *)v18 - 7);
      uint64_t v21 = *((void *)v18 - 6);
      uint64_t v22 = *((void *)v18 - 5);
      uint64_t v23 = (void *)*((void *)v18 - 4);
      char v24 = *((unsigned char *)v18 - 24);
      char v25 = *((unsigned char *)v18 - 23);
      uint64_t v27 = *(void *)(v16 + 40);
      uint64_t v26 = *(void *)(v16 + 48);
      long long v35 = *v18;
      long long v36 = *(v18 - 1);
      __swift_project_boxed_opaque_existential_1((void *)(a2 + 16), v27);
      v41[0] = v19;
      uint64_t v42 = v20;
      uint64_t v43 = v21;
      uint64_t v44 = v22;
      char v45 = v23;
      char v46 = v24;
      char v47 = v25;
      long long v48 = v36;
      long long v49 = v35;
      *(double *)unint64_t v39 = a3;
      *(double *)&v39[1] = a4;
      *(double *)&v39[2] = a5;
      *(double *)&v39[3] = a6;
      *(double *)&v39[4] = a7;
      *(double *)&v39[5] = a8;
      char v40 = v25;
      char v28 = *(uint64_t (**)(unsigned char *, void *, uint64_t, uint64_t))(v26 + 8);
      swift_bridgeObjectRetain();
      id v29 = v23;
      swift_bridgeObjectRetain();
      uint64_t v17 = v37;
      uint64_t v30 = v28(v41, v39, v27, v26);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v50 = v37;
      unint64_t v32 = *(void *)(v37 + 16);
      unint64_t v31 = *(void *)(v37 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_1BD5D4950((char *)(v31 > 1), v32 + 1, 1);
        uint64_t v17 = v50;
      }
      *(void *)(v17 + 16) = v32 + 1;
      *(void *)(v17 + 8 * v32 + 32) = v30;
      v18 += 5;
      int64_t v8 = v38 - 1;
      uint64_t v16 = a2;
    }
    while (v38 != 1);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC860];
  }
  return v17;
}

void sub_1BD5D84D4(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_1BD60A100();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v77 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v76 = (char *)&v70 - v11;
  double v12 = *a2;
  double v13 = a2[1];
  uint64_t v79 = *(void *)(a1 + 16);
  if (v79)
  {
    uint64_t v72 = v3;
    uint64_t v73 = a3;
    uint64_t v74 = v8;
    uint64_t v75 = v7;
    uint64_t v14 = a1 + 32;
    id v80 = (id)*MEMORY[0x1E4FB12B0];
    uint64_t v71 = a1;
    swift_bridgeObjectRetain();
    uint64_t v15 = 0;
    uint64_t v16 = MEMORY[0x1E4FBC860];
    uint64_t v83 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v78 = a1 + 32;
    while (1)
    {
      uint64_t v17 = v16;
      uint64_t v18 = v14 + 80 * v15;
      uint64_t v19 = *(void *)(v18 + 8);
      uint64_t v20 = *(void **)(v18 + 32);
      uint64_t v21 = *(void *)(v19 + 16);
      uint64_t v82 = *(void *)(v18 + 16);
      id v81 = v20;
      if (v21) {
        break;
      }
      swift_bridgeObjectRetain();
      id v49 = v20;
      swift_bridgeObjectRetain();
      uint64_t v26 = MEMORY[0x1E4FBC860];
LABEL_31:
      uint64_t v50 = *(void *)(v26 + 16);
      uint64_t v51 = *(void *)(v17 + 16);
      uint64_t v52 = v51 + v50;
      if (__OFADD__(v51, v50))
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
        return;
      }
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (uint64_t v16 = v17, v52 > *(void *)(v17 + 24) >> 1))
      {
        if (v51 <= v52) {
          uint64_t v54 = v51 + v50;
        }
        else {
          uint64_t v54 = v51;
        }
        sub_1BD5D9D8C(isUniquelyReferenced_nonNull_native, v54, 1, v17, &qword_1EBA19A60, (uint64_t)&type metadata for GridLayoutAttributesFactory.Label, (void (*)(uint64_t, uint64_t, void *))sub_1BD5D54EC);
        uint64_t v16 = v55;
      }
      if (*(void *)(v26 + 16))
      {
        if ((*(void *)(v16 + 24) >> 1) - *(void *)(v16 + 16) < v50) {
          goto LABEL_61;
        }
        swift_arrayInitWithCopy();
        if (v50)
        {
          uint64_t v56 = *(void *)(v16 + 16);
          BOOL v57 = __OFADD__(v56, v50);
          uint64_t v58 = v56 + v50;
          if (v57) {
            goto LABEL_62;
          }
          *(void *)(v16 + 16) = v58;
        }
      }
      else if (v50)
      {
        goto LABEL_60;
      }
      ++v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v15 == v79)
      {
        a1 = v71;
        swift_bridgeObjectRelease();
        uint64_t v7 = v75;
        uint64_t v8 = v74;
        a3 = v73;
        uint64_t v3 = v72;
        goto LABEL_47;
      }
    }
    long long v22 = *(_OWORD *)(v18 + 48);
    long long v84 = *(_OWORD *)(v18 + 64);
    long long v85 = v22;
    char v23 = *(unsigned char *)(v14 + 80 * v15);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v24 = v20;
    char v25 = (id *)(v19 + 40);
    uint64_t v26 = MEMORY[0x1E4FBC860];
    while (1)
    {
      double v27 = *((double *)v25 - 1);
      if (*v25 && v27 != 1.0) {
        break;
      }
LABEL_28:
      v25 += 2;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v14 = v78;
        goto LABEL_31;
      }
    }
    id v29 = *v25;
    if ((uint64_t)objc_msgSend(v29, sel_length) >= 1)
    {
      id v30 = objc_msgSend(v29, sel_attributesAtIndex_effectiveRange_, 0, 0);
      type metadata accessor for Key(0);
      sub_1BD5D9C44(&qword_1EBA199E8, type metadata accessor for Key);
      uint64_t v31 = sub_1BD60A4B0();

      if (*(void *)(v31 + 16))
      {
        id v32 = v80;
        unint64_t v33 = sub_1BD5ED570((uint64_t)v32);
        if (v34)
        {
          sub_1BD5D9AB4(*(void *)(v31 + 56) + 32 * v33, (uint64_t)&v87);
        }
        else
        {
          long long v87 = 0u;
          long long v88 = 0u;
        }
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v88 + 1))
      {
        sub_1BD5D9BB4(0, &qword_1EBA19A00);
        if (swift_dynamicCast())
        {
          long long v35 = v86;
LABEL_21:
          objc_msgSend(v29, sel_boundingRectWithSize_options_context_, 1, 0, v12, v13);
          uint64_t v37 = v36;
          uint64_t v39 = v38;
          char v40 = v29;
          double v41 = v13;
          if (v35)
          {
            objc_msgSend(v35, sel_ascender);
            double v41 = v42;

            char v40 = v35;
          }

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1BD5D9D8C(0, *(void *)(v26 + 16) + 1, 1, v26, &qword_1EBA19A60, (uint64_t)&type metadata for GridLayoutAttributesFactory.Label, (void (*)(uint64_t, uint64_t, void *))sub_1BD5D54EC);
            uint64_t v26 = v47;
          }
          unint64_t v44 = *(void *)(v26 + 16);
          unint64_t v43 = *(void *)(v26 + 24);
          if (v44 >= v43 >> 1)
          {
            sub_1BD5D9D8C(v43 > 1, v44 + 1, 1, v26, &qword_1EBA19A60, (uint64_t)&type metadata for GridLayoutAttributesFactory.Label, (void (*)(uint64_t, uint64_t, void *))sub_1BD5D54EC);
            uint64_t v26 = v48;
          }
          *(void *)(v26 + 16) = v44 + 1;
          uint64_t v45 = v26 + 80 * v44;
          *(void *)(v45 + 32) = v29;
          *(void *)(v45 + 40) = v37;
          *(void *)(v45 + 48) = v39;
          *(double *)(v45 + 56) = v41;
          *(double *)(v45 + 64) = v27;
          *(unsigned char *)(v45 + 72) = v23;
          long long v46 = v84;
          *(_OWORD *)(v45 + 80) = v85;
          *(_OWORD *)(v45 + 96) = v46;
          goto LABEL_28;
        }
      }
      else
      {
        sub_1BD5D9A30((uint64_t)&v87);
      }
    }
    long long v35 = 0;
    goto LABEL_21;
  }
  uint64_t v16 = MEMORY[0x1E4FBC860];
LABEL_47:
  uint64_t v59 = *(void *)(v16 + 16);
  if (v59)
  {
    uint64_t v60 = v16 + 56;
    double v61 = 0.0;
    double v62 = 0.0;
    do
    {
      if (*(unsigned char *)(v60 + 16))
      {
        if (v61 <= *(double *)(v60 + 24) + *(double *)v60) {
          double v61 = *(double *)(v60 + 24) + *(double *)v60;
        }
      }
      else
      {
        double v63 = *(double *)(v60 + 32);
        double v64 = *(double *)(v60 - 16);
        if (v62 <= v64 + *(double *)(v60 + 48) + v63) {
          double v62 = v64 + *(double *)(v60 + 48) + v63;
        }
      }
      v60 += 80;
      --v59;
    }
    while (v59);
  }
  else
  {
    double v62 = 0.0;
    double v61 = 0.0;
  }
  uint64_t v65 = (uint64_t)v76;
  sub_1BD60A0F0();
  uint64_t v66 = (uint64_t)v77;
  sub_1BD60A0F0();
  uint64_t v67 = sub_1BD5D80F8(v16, v66, v65, v12, v13, v12 - v62, v13 - v61, 3.0, 0.0, 0.0, v61, v62);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v68 = sub_1BD5D82C4(a1, v3, v12, v13, 0.0, 0.0, v61, v62);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(double *)(a3 + 16) = v12;
  *(double *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = 0;
  *(double *)(a3 + 48) = v61;
  *(double *)(a3 + 56) = v62;
  *(void *)(a3 + 64) = v68;
  *(void *)(a3 + 72) = v67;
  v69 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v69(v66, v7);
  v69(v65, v7);
}

void sub_1BD5D8C40(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>, double a13)
{
  *(double *)&long long v123 = a12;
  double v136 = a10;
  uint64_t v24 = sub_1BD60A100();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  double v27 = (char *)&v102 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v28 = *(void **)a1;
  double v30 = *(double *)(a1 + 8);
  double v29 = *(double *)(a1 + 16);
  double v31 = *(double *)(a1 + 32);
  double v32 = *(double *)(a1 + 48);
  if ((*(unsigned char *)(a1 + 40) & 1) == 0)
  {
    double v76 = a5 - v30 - *(double *)(a1 + 72);
    double v77 = v31 * a8 + v32;
    v139.origin.x = v76;
    v139.origin.y = v77;
    v139.size.width = *(CGFloat *)(a1 + 8);
    v139.size.height = *(CGFloat *)(a1 + 16);
    double v78 = CGRectGetMinY(v139) - a9;
    if ((~*(void *)&v78 & 0x7FF0000000000000) != 0)
    {
      if (v78 > -9.22337204e18)
      {
        if (v78 < 9.22337204e18)
        {
          v140.origin.x = v76;
          v140.origin.y = v77;
          v140.size.width = v30;
          v140.size.height = v29;
          double v79 = CGRectGetMaxY(v140) + a9;
          if ((~*(void *)&v79 & 0x7FF0000000000000) != 0)
          {
            if (v79 > -9.22337204e18)
            {
              if (v79 < 9.22337204e18)
              {
                if (((uint64_t)v79 & (unint64_t)~((uint64_t)v79 >> 63)) >= ((uint64_t)v78 & (unint64_t)~((uint64_t)v78 >> 63)))
                {
                  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a2, v24);
                  char v80 = sub_1BD60A070();
                  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
                  if (v80)
                  {
                    *(void *)(a4 + 32) = 0;
                    *(_OWORD *)a4 = 0u;
                    *(_OWORD *)(a4 + 16) = 0u;
                    *(unsigned char *)(a4 + 40) = 1;
                    return;
                  }
                  v141.origin.x = v76;
                  v141.origin.y = v77;
                  v141.size.width = v30;
                  v141.size.height = v29;
                  double MinY = CGRectGetMinY(v141);
                  double v82 = MinY;
                  if ((~*(void *)&MinY & 0x7FF0000000000000) != 0)
                  {
                    if (MinY > -9.22337204e18)
                    {
                      if (MinY < 9.22337204e18)
                      {
                        v142.origin.x = v76;
                        v142.origin.y = v77;
                        v142.size.width = v30;
                        v142.size.height = v29;
                        double MaxY = CGRectGetMaxY(v142);
                        if ((~*(void *)&MaxY & 0x7FF0000000000000) != 0)
                        {
                          if (MaxY > -9.22337204e18)
                          {
                            if (MaxY < 9.22337204e18)
                            {
                              if ((uint64_t)MaxY >= (uint64_t)v82)
                              {
                                sub_1BD60A090();
                                *(void *)a4 = v28;
                                *(double *)(a4 + 8) = v76;
                                *(double *)(a4 + 16) = v77;
                                *(double *)(a4 + 24) = v30;
                                *(double *)(a4 + 32) = v29;
                                *(unsigned char *)(a4 + 40) = 0;
                                id v84 = v28;
                                return;
                              }
                              goto LABEL_54;
                            }
LABEL_53:
                            __break(1u);
LABEL_54:
                            __break(1u);
LABEL_55:
                            __break(1u);
                            goto LABEL_56;
                          }
LABEL_52:
                          __break(1u);
                          goto LABEL_53;
                        }
LABEL_51:
                        __break(1u);
                        goto LABEL_52;
                      }
LABEL_50:
                      __break(1u);
                      goto LABEL_51;
                    }
LABEL_49:
                    __break(1u);
                    goto LABEL_50;
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
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v121 = *(void *)(a1 + 72);
  double v113 = v32;
  double v115 = a8;
  double v122 = a5;
  double v118 = *(double *)(a1 + 24);
  double v33 = *(double *)(a1 + 56);
  uint64_t v119 = *(void *)(a1 + 64);
  double v114 = a7;
  double v34 = v31;
  double v120 = v33;
  double v35 = v31 * a7 + a11 + v33;
  double v112 = a6;
  double v36 = a6 - v29;
  v137.origin.x = v35;
  v137.origin.y = a6 - v29;
  v137.size.width = v30;
  v137.size.height = v29;
  double MinX = CGRectGetMinX(v137);
  BOOL v38 = MinX == 1.79769313e308 || (*(void *)&MinX & 0x7FF0000000000000) == 0x7FF0000000000000;
  uint64_t v117 = v13;
  v116 = v28;
  if (v38
    || ((v138.origin.x = v35,
         v138.origin.y = a6 - v29,
         v138.size.width = v30,
         v138.size.height = v29,
         double MaxX = CGRectGetMaxX(v138),
         MaxX != 1.79769313e308)
      ? (BOOL v40 = (*(void *)&MaxX & 0x7FF0000000000000) == 0x7FF0000000000000)
      : (BOOL v40 = 1),
        v40))
  {
    double v105 = a13;
    int v110 = sub_1BD60A710();
    sub_1BD5DA2E4(0, (unint64_t *)&qword_1E9FC6890, (void (*)(uint64_t))sub_1BD5D9B10);
    uint64_t v109 = v41;
    uint64_t v42 = swift_allocObject();
    long long v108 = xmmword_1BD60BF00;
    *(_OWORD *)(v42 + 16) = xmmword_1BD60BF00;
    double v134 = 0.0;
    unint64_t v135 = 0xE000000000000000;
    uint64_t v124 = *(void *)&v35;
    double v125 = a6 - v29;
    double v126 = v30;
    double v127 = v29;
    type metadata accessor for CGRect(0);
    uint64_t v107 = v43;
    sub_1BD60A9B0();
    uint64_t v111 = a4;
    uint64_t v44 = (uint64_t)v28;
    double v45 = v134;
    unint64_t v46 = v135;
    uint64_t v47 = MEMORY[0x1E4FBB1A0];
    *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v48 = sub_1BD5D9B68();
    *(void *)(v42 + 64) = v48;
    *(double *)(v42 + 32) = v45;
    *(void *)(v42 + 40) = v46;
    double v134 = 0.0;
    unint64_t v135 = 0xE000000000000000;
    uint64_t v124 = *(void *)&v136;
    double v125 = a11;
    double v106 = a11;
    double v126 = *(double *)&v123;
    double v127 = a13;
    type metadata accessor for UIEdgeInsets(0);
    uint64_t v104 = v49;
    sub_1BD60A9B0();
    double v50 = v134;
    unint64_t v51 = v135;
    *(void *)(v42 + 96) = v47;
    *(void *)(v42 + 104) = v48;
    *(double *)(v42 + 72) = v50;
    *(void *)(v42 + 80) = v51;
    double v134 = 0.0;
    unint64_t v135 = 0xE000000000000000;
    uint64_t v124 = v44;
    double v125 = v30;
    double v126 = v29;
    double v127 = v118;
    double v128 = v34;
    double v103 = v34;
    char v129 = 1;
    double v52 = v113;
    double v130 = v113;
    double v131 = v120;
    uint64_t v132 = v119;
    uint64_t v133 = v121;
    sub_1BD60A9B0();
    double v53 = v134;
    unint64_t v54 = v135;
    *(void *)(v42 + 136) = v47;
    *(void *)(v42 + 144) = v48;
    *(double *)(v42 + 112) = v53;
    *(void *)(v42 + 120) = v54;
    uint64_t v124 = 0;
    double v125 = -2.68156159e154;
    double v55 = v112;
    double v134 = v122;
    unint64_t v135 = *(void *)&v112;
    sub_1BD60A9B0();
    uint64_t v56 = v124;
    double v57 = v125;
    *(void *)(v42 + 176) = v47;
    *(void *)(v42 + 184) = v48;
    *(void *)(v42 + 152) = v56;
    *(double *)(v42 + 160) = v57;
    uint64_t v124 = 0;
    double v125 = -2.68156159e154;
    double v58 = v114;
    double v59 = v115;
    double v134 = v114;
    unint64_t v135 = *(void *)&v115;
    type metadata accessor for CGSize(0);
    sub_1BD60A9B0();
    uint64_t v60 = v124;
    double v61 = v125;
    *(void *)(v42 + 216) = v47;
    *(void *)(v42 + 224) = v48;
    *(void *)(v42 + 192) = v60;
    *(double *)(v42 + 200) = v61;
    sub_1BD5D9BB4(0, (unint64_t *)&qword_1E9FC6880);
    double v62 = (void *)sub_1BD60A7C0();
    sub_1BD60A470();
    swift_bridgeObjectRelease();

    int v110 = sub_1BD60A720();
    uint64_t v63 = swift_allocObject();
    *(_OWORD *)(v63 + 16) = v108;
    double v134 = 0.0;
    unint64_t v135 = 0xE000000000000000;
    uint64_t v124 = *(void *)&v35;
    double v125 = v36;
    double v126 = v30;
    double v127 = v29;
    sub_1BD60A9B0();
    double v64 = v134;
    unint64_t v65 = v135;
    *(void *)(v63 + 56) = v47;
    *(void *)(v63 + 64) = v48;
    *(double *)(v63 + 32) = v64;
    *(void *)(v63 + 40) = v65;
    double v134 = 0.0;
    unint64_t v135 = 0xE000000000000000;
    uint64_t v124 = *(void *)&v136;
    double v125 = v106;
    double v126 = *(double *)&v123;
    double v127 = v105;
    sub_1BD60A9B0();
    double v66 = v134;
    unint64_t v67 = v135;
    *(void *)(v63 + 96) = v47;
    *(void *)(v63 + 104) = v48;
    *(double *)(v63 + 72) = v66;
    *(void *)(v63 + 80) = v67;
    double v134 = 0.0;
    unint64_t v135 = 0xE000000000000000;
    uint64_t v124 = (uint64_t)v116;
    double v125 = v30;
    double v126 = v29;
    double v127 = v118;
    double v128 = v103;
    char v129 = 1;
    double v130 = v52;
    double v131 = v120;
    uint64_t v132 = v119;
    uint64_t v133 = v121;
    sub_1BD60A9B0();
    double v68 = v134;
    unint64_t v69 = v135;
    *(void *)(v63 + 136) = v47;
    *(void *)(v63 + 144) = v48;
    *(double *)(v63 + 112) = v68;
    *(void *)(v63 + 120) = v69;
    uint64_t v124 = 0;
    double v125 = -2.68156159e154;
    double v134 = v122;
    unint64_t v135 = *(void *)&v55;
    sub_1BD60A9B0();
    uint64_t v70 = v124;
    double v71 = v125;
    *(void *)(v63 + 176) = v47;
    *(void *)(v63 + 184) = v48;
    *(void *)(v63 + 152) = v70;
    *(double *)(v63 + 160) = v71;
    uint64_t v124 = 0;
    double v125 = -2.68156159e154;
    double v134 = v58;
    unint64_t v135 = *(void *)&v59;
    sub_1BD60A9B0();
    uint64_t v72 = v124;
    double v73 = v125;
    *(void *)(v63 + 216) = v47;
    *(void *)(v63 + 224) = v48;
    *(void *)(v63 + 192) = v72;
    *(double *)(v63 + 200) = v73;
    uint64_t v74 = (void *)sub_1BD60A7C0();
    sub_1BD60A470();
    swift_bridgeObjectRelease();

    uint64_t v75 = v111;
    *(void *)(v111 + 32) = 0;
    *(_OWORD *)uint64_t v75 = 0u;
    *(_OWORD *)(v75 + 16) = 0u;
    *(unsigned char *)(v75 + 40) = 1;
    return;
  }
  v143.origin.x = v35;
  v143.origin.y = a6 - v29;
  v143.size.width = v30;
  v143.size.height = v29;
  double v85 = CGRectGetMinX(v143);
  double v86 = v85 + -3.0;
  if ((~COERCE__INT64(v85 + -3.0) & 0x7FF0000000000000) == 0) {
    goto LABEL_55;
  }
  if (v86 <= -9.22337204e18)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v86 >= 9.22337204e18)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v144.origin.x = v35;
  v144.origin.y = v36;
  v144.size.width = v30;
  v144.size.height = v29;
  double v87 = CGRectGetMaxX(v144) + 3.0;
  if ((~*(void *)&v87 & 0x7FF0000000000000) == 0)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  if (v87 <= -9.22337204e18)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  double v88 = v122;
  if (v87 >= 9.22337204e18)
  {
LABEL_60:
    __break(1u);
    return;
  }
  unint64_t v89 = (uint64_t)v86 & ~((uint64_t)v86 >> 63);
  unint64_t v90 = (uint64_t)v87 & ~((uint64_t)v87 >> 63);
  if (v90 >= v89)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a3, v24);
    uint64_t v124 = (uint64_t)v86 & ~((uint64_t)v86 >> 63);
    double v125 = *(double *)&v90;
    *(void *)&long long v123 = v90;
    sub_1BD5D9BF0();
    sub_1BD5D9C44(&qword_1EBA199C8, (void (*)(uint64_t))sub_1BD5D9BF0);
    char v99 = sub_1BD60A080();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    if ((v99 & 1) == 0)
    {
      v145.origin.x = v35;
      v145.origin.y = v36;
      v145.size.width = v30;
      v145.size.height = v29;
      if (CGRectGetMaxX(v145) < v88)
      {
        uint64_t v124 = (uint64_t)v86 & ~((uint64_t)v86 >> 63);
        double v125 = *(double *)&v123;
        sub_1BD60A0A0();
        v100 = v116;
        *(void *)a4 = v116;
        *(double *)(a4 + 8) = v35;
        *(double *)(a4 + 16) = v36;
        *(double *)(a4 + 24) = v30;
        *(double *)(a4 + 32) = v29;
        *(unsigned char *)(a4 + 40) = 0;
        id v101 = v100;
        return;
      }
    }
  }
  else
  {
    sub_1BD60A710();
    sub_1BD5DA2E4(0, (unint64_t *)&qword_1E9FC6890, (void (*)(uint64_t))sub_1BD5D9B10);
    uint64_t v91 = swift_allocObject();
    long long v123 = xmmword_1BD60BEF0;
    *(_OWORD *)(v91 + 16) = xmmword_1BD60BEF0;
    uint64_t v92 = MEMORY[0x1E4FBB550];
    uint64_t v93 = MEMORY[0x1E4FBB5C8];
    *(void *)(v91 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v91 + 64) = v93;
    *(void *)(v91 + 32) = v89;
    *(void *)(v91 + 96) = v92;
    *(void *)(v91 + 104) = v93;
    *(double *)(v91 + 72) = *(double *)&v90;
    sub_1BD5D9BB4(0, (unint64_t *)&qword_1E9FC6880);
    unint64_t v94 = v90;
    v95 = (void *)sub_1BD60A7C0();
    sub_1BD60A470();
    swift_bridgeObjectRelease();

    sub_1BD60A720();
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = v123;
    uint64_t v97 = MEMORY[0x1E4FBB550];
    *(void *)(v96 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v96 + 64) = v93;
    *(void *)(v96 + 32) = v89;
    *(void *)(v96 + 96) = v97;
    *(void *)(v96 + 104) = v93;
    *(void *)(v96 + 72) = v94;
    v98 = (void *)sub_1BD60A7C0();
    sub_1BD60A470();
    swift_bridgeObjectRelease();
  }
  *(void *)(a4 + 32) = 0;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(unsigned char *)(a4 + 40) = 1;
}

uint64_t type metadata accessor for GridLayoutAttributesFactory()
{
  return self;
}

BOOL sub_1BD5D9824(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1BD5D9830(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

BOOL sub_1BD5D9838(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1BD5D9864(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_1BD5D9874(uint64_t result)
{
  *v1 &= result;
  return result;
}

void sub_1BD5D9884()
{
  OUTLINED_FUNCTION_5();
  if (v4)
  {
    OUTLINED_FUNCTION_1_1();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_4_1();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  OUTLINED_FUNCTION_2_1();
  if (v3)
  {
    sub_1BD5DA2E4(0, &qword_1EBA19A78, (void (*)(uint64_t))sub_1BD5D9BF0);
    uint64_t v7 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_3_1(v7);
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4FBC860];
  }
  if (v1)
  {
    sub_1BD5D54A4((char *)(v0 + 32), v2, (char *)(v3 + 32));
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v3 + 32), (const void *)(v0 + 32), 16 * v2);
  }
  swift_bridgeObjectRelease();
}

void sub_1BD5D994C()
{
  OUTLINED_FUNCTION_5();
  if (v4)
  {
    OUTLINED_FUNCTION_1_1();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_4_1();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  OUTLINED_FUNCTION_2_1();
  if (v3)
  {
    sub_1BD5DA338(0, &qword_1EBA19A30, (uint64_t)&type metadata for CategoryZone, MEMORY[0x1E4FBBE00]);
    uint64_t v7 = (char *)OUTLINED_FUNCTION_8();
    size_t v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_7(v8);
  }
  else
  {
    uint64_t v7 = (char *)MEMORY[0x1E4FBC860];
  }
  if (v1)
  {
    sub_1BD5D54C4((char *)(v0 + 32), v2, v7 + 32);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_1BD5D9A30(uint64_t a1)
{
  sub_1BD5DA338(0, &qword_1EBA19B90, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BD5D9AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1BD5D9B10()
{
  unint64_t result = qword_1E9FC6898;
  if (!qword_1E9FC6898)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9FC6898);
  }
  return result;
}

unint64_t sub_1BD5D9B68()
{
  unint64_t result = qword_1E9FC68A0;
  if (!qword_1E9FC68A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC68A0);
  }
  return result;
}

uint64_t sub_1BD5D9BB4(uint64_t a1, unint64_t *a2)
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

void sub_1BD5D9BF0()
{
  if (!qword_1EBA199C0)
  {
    unint64_t v0 = sub_1BD60A500();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA199C0);
    }
  }
}

uint64_t sub_1BD5D9C44(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BD5D9C8C()
{
  OUTLINED_FUNCTION_5();
  if (v4)
  {
    OUTLINED_FUNCTION_1_1();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_4_1();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  OUTLINED_FUNCTION_2_1();
  if (v3)
  {
    sub_1BD5DA2E4(0, &qword_1EBA19A48, (void (*)(uint64_t))sub_1BD5DA17C);
    uint64_t v7 = (char *)OUTLINED_FUNCTION_8();
    size_t v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_7(v8);
  }
  else
  {
    uint64_t v7 = (char *)MEMORY[0x1E4FBC860];
  }
  if (v1)
  {
    sub_1BD5D54C4((char *)(v0 + 32), v2, v7 + 32);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_1BD5DA17C();
    OUTLINED_FUNCTION_9();
  }
  swift_bridgeObjectRelease();
}

void sub_1BD5D9D64(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1BD5D9D8C(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    OUTLINED_FUNCTION_1_1();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_4_1();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    sub_1BD5DA338(0, a5, a6, MEMORY[0x1E4FBBE00]);
    uint64_t v16 = (void *)swift_allocObject();
    size_t v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 80);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4FBC860];
  }
  if (a1)
  {
    a7(a4 + 32, v14, v16 + 4);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_1BD5D9EA0()
{
  OUTLINED_FUNCTION_5();
  if (v4)
  {
    OUTLINED_FUNCTION_1_1();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_4_1();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  OUTLINED_FUNCTION_2_1();
  if (v3)
  {
    sub_1BD5DA338(0, &qword_1EBA19A68, (uint64_t)&type metadata for GridLine, MEMORY[0x1E4FBBE00]);
    uint64_t v7 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_3_1(v7);
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4FBC860];
  }
  if (v1)
  {
    sub_1BD5D54A4((char *)(v0 + 32), v2, (char *)(v3 + 32));
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_1BD5D9F74()
{
  OUTLINED_FUNCTION_5();
  if (v4)
  {
    OUTLINED_FUNCTION_1_1();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_4_1();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  OUTLINED_FUNCTION_2_1();
  if (v3)
  {
    sub_1BD5DA338(0, &qword_1EBA19A88, MEMORY[0x1E4FBB550], MEMORY[0x1E4FBBE00]);
    uint64_t v7 = swift_allocObject();
    size_t v8 = _swift_stdlib_malloc_size((const void *)v7);
    *(void *)(v7 + 16) = v2;
    *(void *)(v7 + 24) = 2 * ((uint64_t)(v8 - 32) / 8);
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4FBC860];
  }
  if (v1)
  {
    sub_1BD5D5514((char *)(v0 + 32), v2, (char *)(v7 + 32));
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v7 + 32), (const void *)(v0 + 32), 8 * v2);
  }
  swift_bridgeObjectRelease();
}

void sub_1BD5DA068()
{
  OUTLINED_FUNCTION_5();
  if (v4)
  {
    OUTLINED_FUNCTION_1_1();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_4_1();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_2();
    }
  }
  OUTLINED_FUNCTION_2_1();
  if (v3)
  {
    sub_1BD5DA2E4(0, &qword_1E9FC68A8, (void (*)(uint64_t))sub_1BD5DA138);
    uint64_t v7 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_3_1(v7);
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4FBC860];
  }
  if (v1)
  {
    sub_1BD5D54A4((char *)(v0 + 32), v2, (char *)(v3 + 32));
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_1BD5DA138();
    OUTLINED_FUNCTION_9();
  }
  swift_bridgeObjectRelease();
}

unint64_t sub_1BD5DA138()
{
  unint64_t result = qword_1E9FC68B0;
  if (!qword_1E9FC68B0)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1E9FC68B0);
  }
  return result;
}

void sub_1BD5DA17C()
{
  if (!qword_1EBA19600[0])
  {
    sub_1BD5DA200();
    sub_1BD5DA24C();
    sub_1BD5DA298();
    unint64_t v0 = type metadata accessor for InteractionCursor();
    if (!v1) {
      atomic_store(v0, qword_1EBA19600);
    }
  }
}

unint64_t sub_1BD5DA200()
{
  unint64_t result = qword_1EBA19D58;
  if (!qword_1EBA19D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA19D58);
  }
  return result;
}

unint64_t sub_1BD5DA24C()
{
  unint64_t result = qword_1EBA19D48;
  if (!qword_1EBA19D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA19D48);
  }
  return result;
}

unint64_t sub_1BD5DA298()
{
  unint64_t result = qword_1EBA19D50;
  if (!qword_1EBA19D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA19D50);
  }
  return result;
}

void sub_1BD5DA2E4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BD60AAD0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1BD5DA338(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void destroy for GridLayoutAttributesFactory.Label(id *a1)
{
}

uint64_t initializeWithCopy for GridLayoutAttributesFactory.Label(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for GridLayoutAttributesFactory.Label(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for GridLayoutAttributesFactory.Label(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for GridLayoutAttributesFactory.Label(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 80))
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

uint64_t storeEnumTagSinglePayload for GridLayoutAttributesFactory.Label(uint64_t result, int a2, int a3)
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridLayoutAttributesFactory.Label()
{
  return &type metadata for GridLayoutAttributesFactory.Label;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((result - 32) / v3);
  return result;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_arrayInitWithCopy();
}

uint64_t InteractionCursor.series.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t InteractionCursor.point.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t sub_1BD5DA65C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t sub_1BD5DA664()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BD5DA700(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 24) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    a1[2] = a2[2];
    uint64_t v11 = ((unint64_t)a1 + v6 + 24) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 24) & ~v6;
    char v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_1BD5DA824(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_1BD5DA8A0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 24) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 24) & ~v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_1BD5DA948(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1BD5DA9F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 24 + a1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 24 + a2) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_1BD5DAA70(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1BD5DAB08(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 24) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 24) & ~v7, v6, v4);
      }
      unint64_t v16 = *((void *)a1 + 1);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_1BD5DAC98(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
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
  size_t v11 = ((v10 + 24) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
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
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1BD5DAEE8);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v20 = (unint64_t)&a1[v10 + 24] & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *((void *)a1 + 1) = 0;
          *((void *)a1 + 2) = 0;
          *(void *)a1 = a2 ^ 0x80000000;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for InteractionCursor()
{
  return swift_getGenericMetadata();
}

uint64_t InteractionManager.deinit()
{
  swift_release();
  return v0;
}

uint64_t InteractionManager.__deallocating_deinit()
{
  InteractionManager.deinit();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t InteractionManager.register(model:on:)(uint64_t a1, void *a2)
{
  return MultiTouchInteractionManager.register(model:on:)(a1, a2);
}

uint64_t InteractionManager.add<A>(interactionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MultiTouchInteractionManager.add<A>(interactionHandler:)(a1, a2, a3);
}

uint64_t InteractionManager.remove<A>(interactionHandler:)()
{
  return MultiTouchInteractionManager.remove<A>(interactionHandler:)();
}

uint64_t sub_1BD5DAFE8()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1BD5DB004(uint64_t a1, void *a2)
{
  return InteractionManager.register(model:on:)(a1, a2);
}

uint64_t sub_1BD5DB028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return InteractionManager.add<A>(interactionHandler:)(a1, a2, a3);
}

uint64_t dispatch thunk of InteractionManagerType.register(model:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of InteractionManagerType.add<A>(interactionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t sub_1BD5DB078()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for InteractionManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for InteractionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InteractionManager);
}

uint64_t sub_1BD5DB0F0()
{
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1B600);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1B320);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1B9D0);
  OUTLINED_FUNCTION_0_3();
  swift_release();

  return swift_release();
}

uint64_t sub_1BD5DB1F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B320);
  uint64_t result = sub_1BD60A200();
  if (v6)
  {
    uint64_t v4 = type metadata accessor for SparklineViewRenderer();
    swift_allocObject();
    uint64_t result = sub_1BD5E9A94((uint64_t)v5);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_1F17FEBF0;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5DB2A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B528);
  uint64_t result = sub_1BD60A200();
  if (v11)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    MEMORY[0x1F4188790](v4);
    uint64_t v6 = (uint64_t **)&v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(uint64_t **))(v7 + 16))(v6);
    uint64_t v8 = sub_1BD5DB800(*v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    uint64_t result = type metadata accessor for SparklineLoader();
    a2[3] = result;
    a2[4] = (uint64_t)&off_1F17FF0F8;
    *a2 = v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5DB3E0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B9C0);
  uint64_t result = sub_1BD60A200();
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1BA78);
    uint64_t result = sub_1BD60A200();
    if (v8)
    {
      uint64_t v5 = type metadata accessor for SparklineCoordinateProvider();
      uint64_t v6 = swift_allocObject();
      sub_1BD5DBA08(&v9, v6 + 16);
      uint64_t result = sub_1BD5DBA08(&v7, v6 + 56);
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for SparklineCoordinateProvider;
      *a2 = v6;
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

uint64_t type metadata accessor for SparklineAssembly()
{
  return self;
}

uint64_t sub_1BD5DB518()
{
  return sub_1BD5DB0F0();
}

uint64_t sub_1BD5DB530(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1BD5DB580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BD60A740();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1BD60A4A0();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = sub_1BD60A750();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  long long v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for LineImageGenerator();
  unsigned int v14 = &off_1F17FDD68;
  *(void *)&long long v12 = a1;
  sub_1BD5DB928();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCC68], v6);
  sub_1BD60A490();
  uint64_t v11 = MEMORY[0x1E4FBC860];
  sub_1BD5DB9C0(&qword_1EBA1A798, MEMORY[0x1E4FBCC10]);
  sub_1BD5DB968();
  sub_1BD5DB9C0(&qword_1EBA1A780, (void (*)(uint64_t))sub_1BD5DB968);
  sub_1BD60A800();
  *(void *)(a2 + 56) = sub_1BD60A780();
  sub_1BD5DBA08(&v12, a2 + 16);
  return a2;
}

uint64_t sub_1BD5DB800(uint64_t *a1)
{
  uint64_t v10 = *a1;
  uint64_t v11 = &off_1F17FDD68;
  v9[0] = a1;
  type metadata accessor for SparklineLoader();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (void *)((char *)&v9[-1] - v3);
  (*(void (**)(char *))(v5 + 16))((char *)&v9[-1] - v3);
  uint64_t v6 = sub_1BD5DB580(*v4, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

unint64_t sub_1BD5DB928()
{
  unint64_t result = qword_1EBA1BC60;
  if (!qword_1EBA1BC60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA1BC60);
  }
  return result;
}

void sub_1BD5DB968()
{
  if (!qword_1EBA1A778)
  {
    sub_1BD60A740();
    unint64_t v0 = sub_1BD60A610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1A778);
    }
  }
}

uint64_t sub_1BD5DB9C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BD5DBA08(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *initializeBufferWithCopyOfBuffer for GridLine(void *a1, void *a2)
{
  long long v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for GridLine(uint64_t a1)
{
}

void *assignWithCopy for GridLine(void *a1, void *a2)
{
  *a1 = *a2;
  long long v3 = (void *)a1[1];
  id v4 = (void *)a2[1];
  a1[1] = v4;
  id v5 = v4;

  return a1;
}

void *assignWithTake for GridLine(void *a1, void *a2)
{
  *a1 = *a2;
  long long v3 = (void *)a1[1];
  a1[1] = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for GridLine(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
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

uint64_t storeEnumTagSinglePayload for GridLine(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for GridLine()
{
  return &type metadata for GridLine;
}

uint64_t dispatch thunk of ColumnChartStylerType.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1BD5DBBA0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_beginAccess();
  *a1 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BD5DBBEC()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for ColumnChartStyler()
{
  return self;
}

uint64_t sub_1BD5DBC48@<X0>(void *a1@<X8>)
{
  return sub_1BD5DBBA0(a1);
}

id LineSeriesView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void LineSeriesView.init(coder:)()
{
  uint64_t v1 = OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews;
  type metadata accessor for LineView();
  *(void *)&v0[v1] = sub_1BD60A4C0();

  sub_1BD60AA00();
  __break(1u);
}

uint64_t sub_1BD5DBD64(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews;
  id v4 = (objc_class *)type metadata accessor for LineView();
  id v5 = v1;
  *(void *)&v1[v3] = sub_1BD60A4C0();
  double v32 = v4;
  id v6 = objc_msgSend(objc_allocWithZone(v4), sel_init);
  *(void *)&v5[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView] = v6;

  v35.receiver = v5;
  v35.super_class = (Class)type metadata accessor for LineSeriesView();
  uint64_t v7 = (char *)objc_msgSendSuper2(&v35, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView];
  long long v9 = v7;
  objc_msgSend(v9, sel_addSubview_, v8);
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v11 = &v9[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews];
    swift_bridgeObjectRetain();
    double v31 = v9;
    long long v12 = (uint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v33 = v10;
      uint64_t v14 = *(v12 - 1);
      uint64_t v13 = *v12;
      id v15 = objc_allocWithZone(v32);
      swift_bridgeObjectRetain();
      id v16 = objc_msgSend(v15, sel_init);
      objc_msgSend(v16, sel_setHidden_, 1);
      objc_msgSend(v9, sel_addSubview_, v16);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      id v17 = v16;
      swift_isUniquelyReferenced_nonNull_native();
      unsigned int v18 = *(void **)v11;
      double v34 = *(void **)v11;
      *(void *)uint64_t v11 = 0x8000000000000000;
      unint64_t v19 = sub_1BD5ED34C();
      if (__OFADD__(v18[2], (v20 & 1) == 0)) {
        break;
      }
      unint64_t v21 = v19;
      char v22 = v20;
      sub_1BD5DC4FC();
      if (sub_1BD60A9D0())
      {
        unint64_t v23 = sub_1BD5ED34C();
        if ((v22 & 1) != (v24 & 1)) {
          goto LABEL_17;
        }
        unint64_t v21 = v23;
      }
      if (v22)
      {
        uint64_t v25 = v34[7];

        *(void *)(v25 + 8 * v21) = v17;
      }
      else
      {
        v34[(v21 >> 6) + 8] |= 1 << v21;
        uint64_t v26 = (void *)(v34[6] + 16 * v21);
        void *v26 = v14;
        v26[1] = v13;
        *(void *)(v34[7] + 8 * v21) = v17;
        uint64_t v27 = v34[2];
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_16;
        }
        v34[2] = v29;
        swift_bridgeObjectRetain();
      }
      v12 += 2;
      *(void *)uint64_t v11 = v34;
      swift_bridgeObjectRelease();
      swift_endAccess();

      swift_bridgeObjectRelease_n();
      uint64_t v10 = v33 - 1;
      long long v9 = v31;
      if (v33 == 1)
      {

        swift_bridgeObjectRelease_n();
        return (uint64_t)v9;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BD60AB10();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();

    return (uint64_t)v9;
  }
  return result;
}

uint64_t sub_1BD5DC054(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  sub_1BD5DC4C4(a1, v19);
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
    id v17 = *(void **)(*(void *)(v3 + 56) + 8 * v9);
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

uint64_t sub_1BD5DC1FC()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for LineSeriesView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_1BD5DC054(v2, (void (*)(uint64_t, uint64_t, id))sub_1BD5DC334);
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for LineSeriesView()
{
  return self;
}

id sub_1BD5DC2E8(int a1, int a2, void *a3, id a4)
{
  objc_msgSend(a4, sel_bounds);

  return objc_msgSend(a3, sel_setFrame_);
}

id sub_1BD5DC334(int a1, int a2, void *a3)
{
  return sub_1BD5DC2E8(a1, a2, a3, *(id *)(v3 + 16));
}

id LineSeriesView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void LineSeriesView.init(frame:)()
{
}

id LineSeriesView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LineSeriesView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for LineSeriesView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineSeriesView);
}

uint64_t sub_1BD5DC4C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

void sub_1BD5DC4FC()
{
  if (!qword_1EBA19BA8)
  {
    type metadata accessor for LineView();
    unint64_t v0 = sub_1BD60A9F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19BA8);
    }
  }
}

uint64_t sub_1BD5DC564(void (*a1)(void *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v54 = MEMORY[0x1E4FBC860];
    sub_1BD5D4990(0, v5, 0);
    uint64_t v6 = v54;
    unint64_t v8 = (void *)(a3 + 112);
    while (1)
    {
      uint64_t v9 = *(v8 - 10);
      char v10 = *((unsigned char *)v8 - 72);
      uint64_t v11 = *(v8 - 8);
      uint64_t v12 = *(v8 - 7);
      int64_t v13 = (void *)*(v8 - 6);
      char v14 = *((unsigned char *)v8 - 40);
      char v15 = *((unsigned char *)v8 - 39);
      uint64_t v16 = *v8;
      uint64_t v39 = v9;
      char v40 = v10;
      uint64_t v41 = v11;
      uint64_t v42 = v12;
      uint64_t v43 = v13;
      char v44 = v14;
      char v45 = v15;
      long long v17 = *((_OWORD *)v8 - 1);
      long long v46 = *((_OWORD *)v8 - 2);
      long long v47 = v17;
      uint64_t v48 = v16;
      sub_1BD5DCFEC(v9, v10);
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v18 = v4;
      id v19 = v13;
      a1(v49, &v39);
      if (v18) {
        break;
      }
      sub_1BD5DCFF8(v9, v10);
      swift_release();

      swift_bridgeObjectRelease();
      char v20 = v49[0];
      uint64_t v21 = v49[1];
      uint64_t v22 = v49[2];
      uint64_t v23 = v49[3];
      uint64_t v24 = v49[4];
      char v25 = v50;
      char v26 = v51;
      unint64_t v28 = *(void *)(v6 + 16);
      unint64_t v27 = *(void *)(v6 + 24);
      long long v30 = v52;
      long long v29 = v53;
      uint64_t v54 = v6;
      if (v28 >= v27 >> 1)
      {
        char v32 = v49[0];
        char v36 = v51;
        char v37 = v50;
        long long v34 = v52;
        long long v35 = v53;
        sub_1BD5D4990((char *)(v27 > 1), v28 + 1, 1);
        long long v30 = v34;
        long long v29 = v35;
        char v26 = v36;
        char v25 = v37;
        char v20 = v32;
        uint64_t v6 = v54;
      }
      *(void *)(v6 + 16) = v28 + 1;
      uint64_t v31 = v6 + 80 * v28;
      *(unsigned char *)(v31 + 32) = v20;
      v8 += 11;
      *(void *)(v31 + 40) = v21;
      *(void *)(v31 + 48) = v22;
      *(void *)(v31 + 56) = v23;
      *(void *)(v31 + 64) = v24;
      *(unsigned char *)(v31 + 72) = v25;
      *(unsigned char *)(v31 + 73) = v26;
      *(_OWORD *)(v31 + 80) = v30;
      *(_OWORD *)(v31 + 96) = v29;
      --v5;
      uint64_t v4 = 0;
      if (!v5) {
        return v6;
      }
    }
    sub_1BD5DCFF8(v9, v10);
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1BD5DC778(void (*a1)(void *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v18 = MEMORY[0x1E4FBC860];
    sub_1BD5D49B0(0, v5, 0);
    uint64_t v6 = v18;
    for (i = (uint64_t *)(a3 + 32); ; ++i)
    {
      uint64_t v16 = *i;
      a1(v17, &v16);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v10 = v17[0];
      uint64_t v11 = v17[1];
      uint64_t v18 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1BD5D49B0((char *)(v12 > 1), v13 + 1, 1);
        uint64_t v6 = v18;
      }
      *(void *)(v6 + 16) = v13 + 1;
      uint64_t v14 = v6 + 16 * v13;
      *(void *)(v14 + 32) = v10;
      *(void *)(v14 + 40) = v11;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

char *sub_1BD5DC89C(void *(*a1)(void *__return_ptr, void), double a2, double a3, double a4)
{
  void *(*v30)(void *__return_ptr, void);
  char v31;
  double v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  uint64_t v5 = v4;
  uint64_t v10 = sub_1BD5DD040(a2, a3, a4);
  char v36 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1BD5D49B0(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0) {
    goto LABEL_33;
  }
  uint64_t v13 = v36;
  if (!v10)
  {
    uint64_t v31 = 0;
    uint64_t v14 = 0;
    double v16 = a2;
    goto LABEL_17;
  }
  uint64_t v31 = 0;
  uint64_t v14 = 0;
  v12.n128_f64[0] = a2;
  long long v30 = a1;
  do
  {
    BOOL v15 = v12.n128_f64[0] <= a3;
    if (a4 > 0.0) {
      BOOL v15 = v12.n128_f64[0] >= a3;
    }
    if (v15)
    {
      if (v31 & 1 | (v12.n128_f64[0] != a3)) {
        goto LABEL_31;
      }
      uint64_t v31 = 1;
      double v16 = v12.n128_f64[0];
    }
    else
    {
      BOOL v17 = __OFADD__(v14++, 1);
      if (v17) {
        goto LABEL_32;
      }
      double v16 = a2 + (double)v14 * a4;
    }
    char v32 = v12.n128_f64[0];
    uint64_t v33 = 0;
    uint64_t result = (char *)a1(&v34, &v32);
    if (v5)
    {
LABEL_28:
      swift_release();
      return (char *)v13;
    }
    uint64_t v5 = 0;
    uint64_t v18 = v34;
    uint64_t v19 = v35;
    char v36 = v13;
    unint64_t v21 = *(void *)(v13 + 16);
    unint64_t v20 = *(void *)(v13 + 24);
    if (v21 >= v20 >> 1)
    {
      uint64_t result = sub_1BD5D49B0((char *)(v20 > 1), v21 + 1, 1);
      uint64_t v13 = v36;
    }
    *(void *)(v13 + 16) = v21 + 1;
    uint64_t v22 = v13 + 16 * v21;
    *(void *)(v22 + 32) = v18;
    *(void *)(v22 + 40) = v19;
    v12.n128_f64[0] = v16;
    --v10;
    a1 = v30;
  }
  while (v10);
  while (1)
  {
LABEL_17:
    BOOL v23 = v16 <= a3;
    if (a4 > 0.0) {
      BOOL v23 = v16 >= a3;
    }
    if (!v23) {
      break;
    }
    if ((v16 != a3) | v31 & 1) {
      return (char *)v13;
    }
    uint64_t v31 = 1;
    double v24 = v16;
LABEL_24:
    char v32 = v16;
    uint64_t result = (char *)((char *(*)(uint64_t *__return_ptr, double *, __n128))a1)(&v34, &v32, v12);
    if (v5) {
      goto LABEL_28;
    }
    uint64_t v5 = 0;
    uint64_t v25 = v34;
    uint64_t v26 = v35;
    char v36 = v13;
    unint64_t v28 = *(void *)(v13 + 16);
    unint64_t v27 = *(void *)(v13 + 24);
    if (v28 >= v27 >> 1)
    {
      uint64_t result = sub_1BD5D49B0((char *)(v27 > 1), v28 + 1, 1);
      uint64_t v13 = v36;
    }
    *(void *)(v13 + 16) = v28 + 1;
    uint64_t v29 = v13 + 16 * v28;
    *(void *)(v29 + 32) = v25;
    *(void *)(v29 + 40) = v26;
    double v16 = v24;
  }
  BOOL v17 = __OFADD__(v14++, 1);
  if (!v17)
  {
    v12.n128_f64[0] = (double)v14;
    double v24 = a2 + (double)v14 * a4;
    goto LABEL_24;
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t ValueAxisGridViewModelGenerator.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t ValueAxisGridViewModelGenerator.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t ValueAxisGridViewModelGenerator.models(for:orientation:options:)(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v4 = MEMORY[0x1E4FBC860];
  if (*(double *)(a1 + 8) - *(double *)a1 > 0.0 && *a3 > 0.0)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    double v6 = MEMORY[0x1F4188790](a1);
    v12[2] = v3;
    v12[3] = v7;
    char v13 = v8;
    double v14 = v6;
    BOOL v15 = v9;
    double v16 = v9;
    id v10 = v9;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1BD5DC564((void (*)(void *__return_ptr, uint64_t *))sub_1BD5DCF60, (uint64_t)v12, v5);

    swift_bridgeObjectRelease();
  }
  return v4;
}

double sub_1BD5DCC74@<D0>(double *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>, double a8@<D0>)
{
  double v14 = *a1;
  uint64_t v15 = a2[5];
  uint64_t v16 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v15);
  BOOL v20 = (a4 & 1) == 0;
  double v17 = (*(double (**)(uint64_t, BOOL *, uint64_t, uint64_t, double, double))(v16 + 8))(a3, &v20, v15, v16, v14, a8);
  if (a5) {
    uint64_t v18 = sub_1BD5DE764(a6, v14);
  }
  else {
    uint64_t v18 = 0;
  }
  double result = v17 / a8;
  *(double *)a7 = v17 / a8;
  *(void *)(a7 + 8) = v18;
  return result;
}

id sub_1BD5DCD58@<X0>(uint64_t a1@<X0>, double *a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v5 = *(uint64_t *)a1;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = a3 & 1;
  uint64_t v9 = *(void **)(a1 + 32);
  int v10 = *(unsigned __int8 *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 41);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 80);
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    int v38 = *(unsigned __int8 *)(a1 + 41);
    int v39 = v10;
    long long v40 = v13;
    long long v41 = v12;
    double v17 = MEMORY[0x1F4188790](a1);
    uint64_t v31 = v18;
    uint64_t v32 = v19;
    char v33 = v8;
    double v34 = v17;
    uint64_t v35 = v20;
    uint64_t v36 = v14;
    uint64_t v37 = v21;
    swift_retain();
    sub_1BD5DCFEC(v5, 0);
    uint64_t v16 = sub_1BD5DC778((void (*)(void *__return_ptr, uint64_t *))sub_1BD5DD004, (uint64_t)&v30, v5);
    swift_release();
    char v11 = v38;
    sub_1BD5DCFF8(v5, 0);
LABEL_6:
    long long v13 = v40;
    long long v12 = v41;
    LOBYTE(v10) = v39;
    goto LABEL_7;
  }
  double v15 = *(double *)a1;
  if (*(double *)&v5 != 0.0)
  {
    int v39 = *(unsigned __int8 *)(a1 + 40);
    long long v40 = v13;
    long long v41 = v12;
    double v23 = *a2;
    double v22 = a2[1];
    double v24 = MEMORY[0x1F4188790](a1);
    uint64_t v31 = v25;
    uint64_t v32 = v26;
    char v33 = v8;
    double v34 = v24;
    uint64_t v35 = v27;
    uint64_t v36 = v14;
    uint64_t v37 = v28;
    swift_retain();
    uint64_t v16 = (uint64_t)sub_1BD5DC89C((void *(*)(void *__return_ptr, void))sub_1BD5DD004, v23, v22, v15);
    swift_release();
    goto LABEL_6;
  }
  uint64_t v16 = MEMORY[0x1E4FBC860];
LABEL_7:
  *(unsigned char *)a4 = v8;
  *(void *)(a4 + 8) = v16;
  *(void *)(a4 + 16) = v6;
  *(void *)(a4 + 24) = v7;
  *(void *)(a4 + 32) = v9;
  *(unsigned char *)(a4 + 40) = v10;
  *(unsigned char *)(a4 + 41) = v11;
  *(_OWORD *)(a4 + 48) = v12;
  *(_OWORD *)(a4 + 64) = v13;
  swift_bridgeObjectRetain();
  return v9;
}

id sub_1BD5DCF60()
{
  OUTLINED_FUNCTION_0_4();
  return sub_1BD5DCD58(v0, v1, v2, v3);
}

_UNKNOWN **sub_1BD5DCF80()
{
  return &protocol witness table for ValueAxis;
}

uint64_t sub_1BD5DCF8C(uint64_t a1, uint64_t a2, double *a3)
{
  return ValueAxisGridViewModelGenerator.models(for:orientation:options:)(a1, a2, a3);
}

uint64_t type metadata accessor for ValueAxisGridViewModelGenerator()
{
  return self;
}

uint64_t method lookup function for ValueAxisGridViewModelGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ValueAxisGridViewModelGenerator);
}

uint64_t sub_1BD5DCFEC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1BD5DCFF8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

double sub_1BD5DD004()
{
  return sub_1BD5DD01C();
}

double sub_1BD5DD01C()
{
  double v1 = OUTLINED_FUNCTION_0_4();
  return sub_1BD5DCC74(v2, v3, v4, v5, v6, *(void *)(v0 + 64), v7, v1);
}

uint64_t sub_1BD5DD040(double a1, double a2, double a3)
{
  uint64_t result = 0;
  char v4 = 0;
  uint64_t v5 = 0;
  double v6 = a1;
  while (1)
  {
    BOOL v7 = v6 <= a2;
    if (a3 > 0.0) {
      BOOL v7 = v6 >= a2;
    }
    if (v7)
    {
      if ((v6 != a2) | v4 & 1) {
        return result;
      }
      char v4 = 1;
      goto LABEL_9;
    }
    BOOL v8 = __OFADD__(v5++, 1);
    if (v8) {
      break;
    }
    double v6 = a1 + (double)v5 * a3;
LABEL_9:
    BOOL v8 = __OFADD__(result++, 1);
    if (v8)
    {
      __break(1u);
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5DD0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *(void *)(a1 + 16);
  if (v22)
  {
    uint64_t v20 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v6 = MEMORY[0x1E4FBC860];
    do
    {
      BOOL v7 = (uint64_t *)(v20 + 24 * v5);
      uint64_t v8 = v7[2];
      uint64_t v9 = *(void *)(v8 + 16);
      if (v9)
      {
        uint64_t v21 = *v7;
        uint64_t v23 = v7[1];
        int v10 = (uint64_t *)(v8 + 48);
        while (1)
        {
          uint64_t v11 = *(v10 - 2);
          uint64_t v12 = *(v10 - 1);
          uint64_t v13 = *v10;
          if (v11 == a2 && v12 == a3) {
            break;
          }
          if (sub_1BD60AAF0()) {
            goto LABEL_13;
          }
          v10 += 3;
          if (!--v9) {
            goto LABEL_18;
          }
        }
        uint64_t v11 = a2;
        uint64_t v12 = a3;
LABEL_13:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1BD5D9C8C();
          uint64_t v6 = v17;
        }
        unint64_t v15 = *(void *)(v6 + 16);
        if (v15 >= *(void *)(v6 + 24) >> 1)
        {
          sub_1BD5D9C8C();
          uint64_t v6 = v18;
        }
        *(void *)(v6 + 16) = v15 + 1;
        uint64_t v16 = (void *)(v6 + 48 * v15);
        v16[4] = v21;
        v16[5] = v23;
        v16[6] = v8;
        v16[7] = v11;
        v16[8] = v12;
        v16[9] = v13;
      }
LABEL_18:
      ++v5;
    }
    while (v5 != v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t LineChartInteractor.__allocating_init(categoryCoordinateCalculator:valueCoordinateCalculator:)(long long *a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1BD5DBA08(a1, v4 + 16);
  sub_1BD5DBA08(a2, v4 + 56);
  return v4;
}

uint64_t LineChartInteractor.init(categoryCoordinateCalculator:valueCoordinateCalculator:)(long long *a1, long long *a2)
{
  sub_1BD5DBA08(a1, v2 + 16);
  sub_1BD5DBA08(a2, v2 + 56);
  return v2;
}

void LineChartInteractor.dataPoint(for:model:size:)(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v13 = v6[5];
  uint64_t v14 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v13);
  LOBYTE(v46[0]) = 0;
  uint64_t v15 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, double, double))(v14 + 16))(a1, v46, v13, v14, a3, a5);
  if (!v16) {
    goto LABEL_6;
  }
  uint64_t v17 = v15;
  uint64_t v18 = v16;
  uint64_t v20 = v6[10];
  uint64_t v19 = v6[11];
  __swift_project_boxed_opaque_existential_1(v6 + 7, v20);
  sub_1BD5D7EB4();
  uint64_t v22 = a1 + *(int *)(v21 + 52);
  LOBYTE(v46[0]) = 1;
  double v23 = (*(double (**)(uint64_t, void *, uint64_t, uint64_t, double, double))(v19 + 16))(v22, v46, v20, v19, a4, a6);
  type metadata accessor for LineChartModel();
  swift_bridgeObjectRetain();
  uint64_t v24 = swift_bridgeObjectRetain();
  uint64_t v25 = sub_1BD5DD0AC(v24, v17, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v48 = 0;
  unint64_t v49 = 0;
  uint64_t v47 = v25;
  sub_1BD5DD6BC((uint64_t)v46);
  if (!v46[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    return;
  }
  unint64_t v26 = v46[0];
  uint64_t v28 = v47;
  unint64_t v27 = v48;
  uint64_t v29 = *(void *)(v47 + 16);
  if (v48 == v29)
  {
    swift_bridgeObjectRetain();
LABEL_16:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 0x8000000000000000) == 0)
    {
      if (v26 < *(void *)(v25 + 16))
      {
        uint64_t v36 = (void *)(v25 + 48 * v26);
        uint64_t v37 = v36[4];
        uint64_t v38 = v36[5];
        uint64_t v40 = v36[6];
        uint64_t v39 = v36[7];
        uint64_t v41 = v36[8];
        uint64_t v42 = v36[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)a2 = v37;
        *(void *)(a2 + 8) = v38;
        *(void *)(a2 + 16) = v40;
        *(void *)(a2 + 24) = v39;
        *(void *)(a2 + 32) = v41;
        *(void *)(a2 + 40) = v42;
        return;
      }
      goto LABEL_23;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v45 = *(void *)(v47 + 16);
  if (v48 < v29)
  {
    double v30 = *(double *)&v46[6];
    unint64_t v31 = v49;
    uint64_t v43 = v25;
    swift_bridgeObjectRetain_n();
    uint64_t v32 = (double *)(v28 + 48 * v27 + 72);
    unint64_t v33 = v27;
    uint64_t v34 = v45;
    uint64_t v44 = v28;
    while ((v27 & 0x8000000000000000) == 0)
    {
      if (v33 >= *(void *)(v28 + 16)) {
        goto LABEL_20;
      }
      if (__OFADD__(v31, 1)) {
        goto LABEL_21;
      }
      double v35 = *v32;
      if (vabdd_f64(*v32, v23) < vabdd_f64(v30, v23))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v28 = v44;
        swift_bridgeObjectRelease();
        uint64_t v34 = v45;
        unint64_t v26 = v31;
        double v30 = v35;
      }
      ++v33;
      ++v31;
      v32 += 6;
      if (v34 == v33)
      {
        uint64_t v25 = v43;
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_24:
  __break(1u);
}

uint64_t LineChartInteractor.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t LineChartInteractor.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186488](v0, 96, 7);
}

void sub_1BD5DD698(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
}

void sub_1BD5DD6BC(uint64_t a1@<X8>)
{
  unint64_t v2 = v1[1];
  unint64_t v3 = *(void *)(*v1 + 16);
  if (v2 == v3)
  {
    *(void *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return;
  }
  if (v2 >= v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = (void *)(*v1 + 48 * v2);
  uint64_t v6 = v4[4];
  uint64_t v5 = v4[5];
  uint64_t v8 = v4[6];
  uint64_t v7 = v4[7];
  uint64_t v9 = v4[8];
  uint64_t v10 = v4[9];
  v1[1] = v2 + 1;
  uint64_t v11 = v1[2];
  if (__OFADD__(v11, 1))
  {
LABEL_9:
    __break(1u);
    return;
  }
  v1[2] = v11 + 1;
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  swift_bridgeObjectRetain();
}

unint64_t sub_1BD5DD780()
{
  unint64_t result = qword_1EBA1ACA0;
  if (!qword_1EBA1ACA0)
  {
    type metadata accessor for LineChartModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1ACA0);
  }
  return result;
}

uint64_t type metadata accessor for LineChartInteractor()
{
  return self;
}

uint64_t method lookup function for LineChartInteractor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineChartInteractor);
}

uint64_t dispatch thunk of LineChartInteractor.__allocating_init(categoryCoordinateCalculator:valueCoordinateCalculator:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t FrameworkAssembly.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  FrameworkAssembly.init()();
  return v0;
}

uint64_t FrameworkAssembly.init()()
{
  sub_1BD5DDA38();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BD60BF00;
  type metadata accessor for ChartsAssembly();
  uint64_t v3 = OUTLINED_FUNCTION_0_5();
  *(void *)(v2 + 56) = v1;
  *(void *)(v2 + 64) = sub_1BD5DDAE8(&qword_1EBA1A880, (void (*)(uint64_t))type metadata accessor for ChartsAssembly);
  *(void *)(v2 + 32) = v3;
  type metadata accessor for GridAssembly();
  uint64_t v4 = OUTLINED_FUNCTION_0_5();
  *(void *)(v2 + 96) = v1;
  *(void *)(v2 + 104) = sub_1BD5DDAE8(&qword_1EBA1A8B0, (void (*)(uint64_t))type metadata accessor for GridAssembly);
  *(void *)(v2 + 72) = v4;
  type metadata accessor for LineChartAssembly();
  uint64_t v5 = OUTLINED_FUNCTION_0_5();
  *(void *)(v2 + 136) = v1;
  *(void *)(v2 + 144) = sub_1BD5DDAE8(&qword_1EBA1A958, (void (*)(uint64_t))type metadata accessor for LineChartAssembly);
  *(void *)(v2 + 112) = v5;
  type metadata accessor for ColumnChartAssembly();
  uint64_t v6 = OUTLINED_FUNCTION_0_5();
  *(void *)(v2 + 176) = v1;
  *(void *)(v2 + 184) = sub_1BD5DDAE8(&qword_1EBA1A9B8, (void (*)(uint64_t))type metadata accessor for ColumnChartAssembly);
  *(void *)(v2 + 152) = v6;
  type metadata accessor for SparklineAssembly();
  uint64_t v7 = OUTLINED_FUNCTION_0_5();
  *(void *)(v2 + 216) = v1;
  *(void *)(v2 + 224) = sub_1BD5DDAE8(&qword_1EBA1A988, (void (*)(uint64_t))type metadata accessor for SparklineAssembly);
  *(void *)(v2 + 192) = v7;
  *(void *)(v0 + 16) = v2;
  return v0;
}

void sub_1BD5DDA38()
{
  if (!qword_1EBA1A9E8)
  {
    sub_1BD5DDA90();
    unint64_t v0 = sub_1BD60AAD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1A9E8);
    }
  }
}

unint64_t sub_1BD5DDA90()
{
  unint64_t result = qword_1EBA1A878;
  if (!qword_1EBA1A878)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA1A878);
  }
  return result;
}

uint64_t sub_1BD5DDAE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t FrameworkAssembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FrameworkAssembly.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FrameworkAssembly.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BD5DDB90()
{
  return FrameworkAssembly.assemblies.getter();
}

uint64_t type metadata accessor for FrameworkAssembly()
{
  return self;
}

uint64_t method lookup function for FrameworkAssembly(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FrameworkAssembly);
}

uint64_t dispatch thunk of FrameworkAssembly.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of Zonable.zoneManager.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Zonable.updateZones(with:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t getEnumTagSinglePayload for LayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LayoutOptions()
{
  return &type metadata for LayoutOptions;
}

TeaCharts::ChartLayoutOptions __swiftcall ChartLayoutOptions.init(size:)(TeaCharts::ChartLayoutOptions size)
{
  *uint64_t v1 = size.size.width;
  v1[1] = size.size.height;
  return size;
}

double ChartLayoutOptions.size.getter()
{
  return *(double *)v0;
}

ValueMetadata *type metadata accessor for ChartLayoutOptions()
{
  return &type metadata for ChartLayoutOptions;
}

ValueMetadata *type metadata accessor for GridLayoutOptions()
{
  return &type metadata for GridLayoutOptions;
}

double ColumnChartInteractor.dataPoint(for:model:size:)@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t ColumnChartInteractor.deinit()
{
  return v0;
}

uint64_t ColumnChartInteractor.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

unint64_t sub_1BD5DDCE4()
{
  unint64_t result = qword_1EBA1ADE0;
  if (!qword_1EBA1ADE0)
  {
    type metadata accessor for ColumnChartModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1ADE0);
  }
  return result;
}

double sub_1BD5DDD34@<D0>(_OWORD *a1@<X8>)
{
  return ColumnChartInteractor.dataPoint(for:model:size:)(a1);
}

uint64_t type metadata accessor for ColumnChartInteractor()
{
  return self;
}

uint64_t method lookup function for ColumnChartInteractor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ColumnChartInteractor);
}

void sub_1BD5DDD88()
{
  uint64_t v1 = OBJC_IVAR____TtC9TeaCharts8LineView_imageView;
  id v2 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  double v3 = OUTLINED_FUNCTION_0_6();
  *(void *)&v0[v1] = objc_msgSend(v4, v5, v3);
  uint64_t v6 = OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C88]), sel_init);

  sub_1BD60AA00();
  __break(1u);
}

char *sub_1BD5DDE5C()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC9TeaCharts8LineView_imageView;
  id v3 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v4 = v0;
  double v5 = OUTLINED_FUNCTION_0_6();
  *(void *)&v0[v2] = objc_msgSend(v3, v6, v5);
  uint64_t v7 = OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer;
  *(void *)&v4[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C88]), sel_init);

  double v8 = OUTLINED_FUNCTION_0_6();
  uint64_t v11 = (char *)objc_msgSendSuper2(v9, v10, v8, v4, ObjectType);
  objc_msgSend(v11, sel_addSubview_, *(void *)&v11[OBJC_IVAR____TtC9TeaCharts8LineView_imageView]);
  return v11;
}

Swift::Void __swiftcall LineView.layoutSubviews()()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts8LineView_imageView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);
}

void sub_1BD5DE038(void *a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC9TeaCharts8LineView_imageView);
    id v3 = a1;
    id v4 = objc_msgSend(v2, sel_layer);
    id v5 = objc_msgSend(v4, sel_mask);

    SEL v6 = *(void **)(v1 + OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer);
    if (!v5
      || (sub_1BD5DE300(),
          id v7 = v6,
          id v8 = v5,
          char v9 = sub_1BD60A7B0(),
          v8,
          v8,
          v7,
          (v9 & 1) == 0))
    {
      id v10 = objc_msgSend(v2, sel_layer);
      objc_msgSend(v10, sel_setMask_, v6);
    }
    id v11 = objc_msgSend(v3, sel_CGPath);
    objc_msgSend(v6, sel_setPath_);
  }
  else
  {
    id v11 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9TeaCharts8LineView_imageView), sel_layer);
    objc_msgSend(v11, sel_setMask_, 0);
  }
}

id LineView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void LineView.init(frame:)()
{
}

id LineView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LineView()
{
  return self;
}

unint64_t sub_1BD5DE300()
{
  unint64_t result = qword_1EBA19A18;
  if (!qword_1EBA19A18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA19A18);
  }
  return result;
}

uint64_t sub_1BD5DE340(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (!v3) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v4 = a3;
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v34 = MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v4 + v5;
    uint64_t v8 = *(void *)(v4 + v5 + 32);
    char v9 = *(unsigned char *)(v4 + v5 + 40);
    id v10 = *(void **)(v4 + v5 + 64);
    uint64_t v11 = *(void *)(v7 + 112);
    char v12 = *(unsigned char *)(v7 + 73);
    char v13 = *(unsigned char *)(v7 + 72);
    uint64_t v14 = *(void *)(v7 + 56);
    uint64_t v15 = *(void *)(v7 + 48);
    uint64_t v44 = v8;
    char v45 = v9;
    uint64_t v46 = v15;
    uint64_t v47 = v14;
    uint64_t v48 = v10;
    char v49 = v13;
    char v50 = v12;
    long long v16 = *(_OWORD *)(v7 + 96);
    long long v51 = *(_OWORD *)(v7 + 80);
    long long v52 = v16;
    uint64_t v53 = v11;
    sub_1BD5DCFEC(v8, v9);
    swift_retain();
    swift_bridgeObjectRetain();
    id v17 = v10;
    a1(&v36, &v44);
    if (v35) {
      break;
    }
    uint64_t v35 = 0;
    sub_1BD5DCFF8(v8, v9);
    swift_release();

    swift_bridgeObjectRelease();
    uint64_t v18 = v37;
    if (v37)
    {
      char v19 = v36;
      uint64_t v31 = v38;
      uint64_t v20 = v39;
      uint64_t v22 = v40;
      __int16 v21 = v41;
      long long v32 = v43;
      long long v33 = v42;
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v23 = v34;
      }
      else
      {
        sub_1BD5D9D64(0, *(void *)(v34 + 16) + 1, 1, v34);
        uint64_t v23 = v27;
      }
      unint64_t v25 = *(void *)(v23 + 16);
      unint64_t v24 = *(void *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_1BD5D9D64(v24 > 1, v25 + 1, 1, v23);
        uint64_t v23 = v28;
      }
      *(void *)(v23 + 16) = v25 + 1;
      uint64_t v34 = v23;
      uint64_t v26 = v23 + 80 * v25;
      *(unsigned char *)(v26 + 32) = v19 & 1;
      *(void *)(v26 + 40) = v18;
      *(void *)(v26 + 48) = v31;
      *(void *)(v26 + 56) = v20;
      *(void *)(v26 + 64) = v22;
      *(unsigned char *)(v26 + 72) = v21;
      *(unsigned char *)(v26 + 73) = HIBYTE(v21) & 1;
      *(_OWORD *)(v26 + 80) = v33;
      *(_OWORD *)(v26 + 96) = v32;
    }
    uint64_t v4 = v6;
    v5 += 88;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return v34;
    }
  }
  sub_1BD5DCFF8(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BD5DE598(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v8)(uint64_t *__return_ptr, uint64_t *);
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  uint64_t v6 = a5;
  uint64_t v8 = a1;
  uint64_t v26 = 0;
  char v9 = 0;
  unint64_t v24 = (a5 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v25 = 0;
  id v10 = MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v11 = a3 <= a4;
    if (v6 > 0) {
      uint64_t v11 = a3 >= a4;
    }
    if (v11)
    {
      if ((a3 != a4) | v26 & 1) {
        return v10;
      }
      if (v9)
      {
        uint64_t v26 = 1;
        char v12 = a4;
        char v9 = 1;
      }
      else
      {
        if (v25 == 0x8000000000000000) {
          return v10;
        }
        char v9 = 0;
        uint64_t v26 = 1;
        char v12 = a4;
      }
    }
    else
    {
      char v13 = __OFADD__(a3, v6);
      if (v13) {
        char v12 = v24;
      }
      else {
        char v12 = a3 + v6;
      }
      uint64_t v14 = 0x8000000000000000;
      if (!v13) {
        uint64_t v14 = 0;
      }
      unint64_t v25 = v14;
      char v9 = !v13;
    }
    uint64_t v29 = a3;
    v8(&v27, &v29);
    if (v5) {
      break;
    }
    uint64_t v15 = v28;
    if (v28 != 1)
    {
      long long v16 = v27;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BD5D9EA0();
        id v10 = v19;
      }
      id v17 = *(void *)(v10 + 16);
      if (v17 >= *(void *)(v10 + 24) >> 1)
      {
        sub_1BD5D9EA0();
        id v10 = v20;
      }
      *(void *)(v10 + 16) = v17 + 1;
      uint64_t v18 = v10 + 16 * v17;
      *(void *)(v18 + 32) = v16;
      *(void *)(v18 + 40) = v15;
      uint64_t v8 = a1;
      uint64_t v6 = a5;
    }
    a3 = v12;
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BD5DE764(uint64_t a1, double a2)
{
  swift_beginAccess();
  sub_1BD5DF0C4(v2 + 56, (uint64_t)&v9, &qword_1EBA197D8, &qword_1EBA197D0);
  if (v10)
  {
    sub_1BD5DBA08(&v9, (uint64_t)v11);
    uint64_t v5 = v12;
    uint64_t v6 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    *(void *)&long long v9 = a1;
    uint64_t v7 = (*(uint64_t (**)(long long *, uint64_t, uint64_t, double))(v6 + 8))(&v9, v5, v6, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    sub_1BD5DF18C((uint64_t)&v9, &qword_1EBA197D8, &qword_1EBA197D0);
    return 0;
  }
  return v7;
}

uint64_t sub_1BD5DE864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  sub_1BD5DF0C4(v3 + 16, (uint64_t)&v12, &qword_1EBA197E8, &qword_1EBA197E0);
  if (v13)
  {
    sub_1BD5DBA08(&v12, (uint64_t)v14);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    *(void *)&long long v12 = a3;
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    uint64_t v10 = v9(a1, a2, &v12, v7, v8);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    sub_1BD5DF18C((uint64_t)&v12, &qword_1EBA197E8, &qword_1EBA197E0);
    return 0;
  }
  return v10;
}

uint64_t CategoryAxisGridViewModelGenerator.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t CategoryAxisGridViewModelGenerator.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1BD5DE9DC(uint64_t a1, char *a2, uint64_t *a3)
{
  return CategoryAxisGridViewModelGenerator.models(for:orientation:options:)(a1, a2, a3);
}

uint64_t CategoryAxisGridViewModelGenerator.models(for:orientation:options:)(uint64_t a1, char *a2, uint64_t *a3)
{
  char v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t v7 = (void *)a3[1];
  uint64_t v8 = *(void *)(a1 + *(int *)(type metadata accessor for CategoryAxis() + 24));
  uint64_t v13 = v3;
  uint64_t v14 = a1;
  char v15 = v5;
  uint64_t v16 = v6;
  id v17 = v7;
  uint64_t v18 = v7;
  id v9 = v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1BD5DE340((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1BD5DF040, (uint64_t)&v12, v8);

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BD5DEAB4(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v46 = a2;
  int v9 = a4 & 1;
  uint64_t v10 = *(uint64_t *)a1;
  char v11 = *(unsigned char *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v41 = a6;
  uint64_t v42 = v12;
  if ((v11 & 1) == 0)
  {
    uint64_t v18 = *(void *)(v10 + 16);
    if (!v18) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v44 = v46 + 2;
    uint64_t v45 = a3;
    swift_retain();
    sub_1BD5DCFEC(v10, 0);
    int v43 = v9 ^ 1;
    uint64_t v40 = v10;
    char v19 = (uint64_t *)(v10 + 40);
    uint64_t v17 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v20 = *(v19 - 1);
      uint64_t v21 = *v19;
      uint64_t v23 = v46[5];
      uint64_t v22 = v46[6];
      __swift_project_boxed_opaque_existential_1(v44, v23);
      v47[0] = v43;
      unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, double))(v22 + 8);
      swift_bridgeObjectRetain();
      *(double *)&uint64_t v25 = COERCE_DOUBLE(v24(v20, v21, v45, v47, v23, v22, a7));
      if (v26)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        double v27 = *(double *)&v25;
        if (v42)
        {
          swift_retain();
          uint64_t v28 = (void *)sub_1BD5DE864(v20, v21, v41);
          swift_bridgeObjectRelease();
          swift_release();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v28 = 0;
        }
        id v29 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1BD5D9EA0();
          uint64_t v17 = v32;
        }
        unint64_t v30 = *(void *)(v17 + 16);
        if (v30 >= *(void *)(v17 + 24) >> 1)
        {
          sub_1BD5D9EA0();
          uint64_t v17 = v33;
        }
        *(void *)(v17 + 16) = v30 + 1;
        uint64_t v31 = v17 + 16 * v30;
        *(double *)(v31 + 32) = v27 / a7;
        *(void *)(v31 + 40) = v28;
      }
      v19 += 2;
      --v18;
    }
    while (v18);
    sub_1BD5DCFF8(v40, 0);
    swift_release();
    return v17;
  }
  sub_1BD5D40B0();
  sub_1BD5D410C();
  swift_retain();
  sub_1BD60A680();
  sub_1BD60A6A0();
  uint64_t result = sub_1BD60A690();
  if ((~v10 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (*(double *)&v10 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(double *)&v10 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((uint64_t)*(double *)&v10)
  {
    MEMORY[0x1F4188790](result);
    v34[2] = a3;
    v34[3] = v46;
    char v35 = v9;
    double v36 = a7;
    uint64_t v37 = a5;
    uint64_t v38 = v42;
    uint64_t v39 = v41;
    uint64_t v17 = sub_1BD5DE598((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1BD5DF0A4, (uint64_t)v34, 0, v15, v16);
    swift_release();
    return v17;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1BD5DEDE4@<X0>(uint64_t a1@<X1>, void *a2@<X2>, char a3@<W3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v26 = a5;
  sub_1BD5D40B0();
  sub_1BD60A350();
  uint64_t v14 = v24;
  uint64_t v13 = v25;
  uint64_t v15 = a2 + 2;
  uint64_t v16 = a2[5];
  uint64_t v17 = a2[6];
  __swift_project_boxed_opaque_existential_1(v15, v16);
  LOBYTE(v24) = (a3 & 1) == 0;
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, double))(v17 + 8))(v14, v25, a1, &v24, v16, v17, a7);
  if (v19)
  {
    uint64_t result = swift_bridgeObjectRelease();
    double v23 = 0.0;
    uint64_t v21 = 1;
  }
  else
  {
    double v20 = *(double *)&v18;
    if (a4) {
      uint64_t v21 = sub_1BD5DE864(v14, v13, v26);
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t result = swift_bridgeObjectRelease();
    double v23 = v20 / a7;
  }
  *(double *)a6 = v23;
  *(void *)(a6 + 8) = v21;
  return result;
}

id sub_1BD5DEF18@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>, double a8@<D0>)
{
  char v9 = *((unsigned char *)a1 + 8);
  uint64_t v10 = a1[2];
  uint64_t v11 = a1[3];
  uint64_t v12 = (void *)a1[4];
  uint64_t v13 = a4 & 1;
  uint64_t v14 = *((unsigned __int8 *)a1 + 40);
  int v15 = *((unsigned __int8 *)a1 + 41);
  uint64_t v16 = a1[6];
  uint64_t v17 = a1[7];
  uint64_t v18 = a1[8];
  uint64_t v19 = a1[9];
  uint64_t v20 = a1[10];
  uint64_t v25 = *a1;
  char v26 = v9;
  uint64_t v27 = v10;
  uint64_t v28 = v11;
  id v29 = v12;
  char v30 = v14;
  char v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v17;
  uint64_t v34 = v18;
  uint64_t v35 = v19;
  uint64_t v36 = v20;
  uint64_t v21 = sub_1BD5DEAB4((uint64_t)&v25, a2, a3, a4 & 1, a5, a6, a8);
  if (*(void *)(v21 + 16))
  {
    uint64_t v22 = 256;
    if (!v15) {
      uint64_t v22 = 0;
    }
    uint64_t v23 = v22 | v14;
    *a7 = v13;
    a7[1] = v21;
    swift_bridgeObjectRetain();
    id result = v12;
  }
  else
  {
    id result = (id)swift_bridgeObjectRelease();
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v23 = 0;
    *a7 = 0;
    a7[1] = 0;
    uint64_t v11 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  a7[2] = v10;
  a7[3] = v11;
  a7[4] = v12;
  a7[5] = v23;
  a7[6] = v16;
  a7[7] = v17;
  a7[8] = v18;
  a7[9] = v19;
  return result;
}

id sub_1BD5DF040()
{
  double v0 = OUTLINED_FUNCTION_0_4();
  return sub_1BD5DEF18(v1, v2, v3, v4, v5, v6, v7, v0);
}

_UNKNOWN **sub_1BD5DF05C()
{
  return &protocol witness table for CategoryAxis;
}

uint64_t type metadata accessor for CategoryAxisGridViewModelGenerator()
{
  return self;
}

uint64_t method lookup function for CategoryAxisGridViewModelGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CategoryAxisGridViewModelGenerator);
}

uint64_t sub_1BD5DF0A4()
{
  double v1 = OUTLINED_FUNCTION_0_4();
  return sub_1BD5DEDE4(v2, v3, v4, v5, *(void *)(v0 + 64), v6, v1);
}

uint64_t sub_1BD5DF0C4(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  sub_1BD5DF134(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_1BD5DF134(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1BD5DB530(255, a3);
    unint64_t v4 = sub_1BD60A7D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1BD5DF18C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1BD5DF134(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1BD5DF1E8(uint64_t a1, uint64_t a2, id a3, double *a4)
{
  uint64_t v5 = v4;
  double v9 = a4[2];
  double v10 = a4[3];
  objc_msgSend(a3, sel_setFrame_, *a4, a4[1], v9, v10);
  id v11 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v11, sel_scale);

  __swift_project_boxed_opaque_existential_1(v5 + 2, v5[5]);
  sub_1BD5E0A08();
  swift_allocObject();
  sub_1BD60A3F0();
  objc_msgSend(a3, sel_setAlpha_, 0.0);
  __swift_project_boxed_opaque_existential_1(v5 + 17, v5[20]);
  sub_1BD5D9BB4(0, (unint64_t *)&qword_1EBA1BC60);
  uint64_t v12 = (void *)sub_1BD60A760();
  sub_1BD60A2C0();

  uint64_t v13 = (void *)sub_1BD60A1B0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1BD5E0ACC;
  *(void *)(v15 + 24) = v14;
  id v16 = a3;
  sub_1BD60A3C0();
  swift_release();
  swift_release();

  swift_release();
  *(double *)uint64_t v18 = v9;
  *(double *)&v18[1] = v10;
  sub_1BD5E0080(a2, a1, (uint64_t)v16, v18);
  return swift_release();
}

uint64_t sub_1BD5DF440(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a5;
  uint64_t v28 = a4;
  char v26 = a2;
  uint64_t v8 = type metadata accessor for LineChartModel();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v29 + 64);
  MEMORY[0x1F4188790](v8 - 8);
  double v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD5D5C9C();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  sub_1BD5E0B70();
  sub_1BD60A410();
  uint64_t v27 = sub_1BD60A1B0();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v28, v12);
  sub_1BD5D7C7C(v30, (uint64_t)v10);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v17 = (v14 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (*(unsigned __int8 *)(v29 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v19 + v16, v15, v12);
  uint64_t v20 = v26;
  *(void *)(v19 + v17) = v26;
  sub_1BD5D7F34((uint64_t)v10, v19 + v18);
  swift_retain();
  id v21 = v20;
  uint64_t v22 = (void *)v27;
  uint64_t v23 = sub_1BD60A3C0();
  swift_release();

  swift_release();
  return v23;
}

uint64_t sub_1BD5DF6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void **)(a2 + 184);
  swift_beginAccess();
  uint64_t v7 = v6[5];
  uint64_t v51 = v6[6];
  uint64_t v52 = v6[4];
  uint64_t v49 = v6[8];
  uint64_t v50 = v6[7];
  uint64_t v8 = v6[9];
  sub_1BD5E0F0C(v52, v7);
  sub_1BD5D5C9C();
  sub_1BD5E09AC(&qword_1EBA19520);
  sub_1BD60A680();
  sub_1BD60A6A0();
  if (v56 == v55[0])
  {
    uint64_t v9 = a4;
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v10 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = v52;
    goto LABEL_24;
  }
  uint64_t v14 = (void (*)(void *, void))sub_1BD60A6C0();
  uint64_t v11 = v15[1];
  uint64_t v48 = *v15;
  uint64_t v16 = v15[3];
  uint64_t v17 = v15[5];
  uint64_t v46 = v15[4];
  uint64_t v47 = v15[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v55, 0);
  if (!v7)
  {
    uint64_t v9 = a4;
    if (!v11) {
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (!v11)
  {
LABEL_23:
    uint64_t v10 = v7;
    uint64_t v13 = v52;
    uint64_t v12 = v48;
LABEL_24:
    sub_1BD5E0F5C(v13, v10);
    sub_1BD5E0F5C(v12, v11);
LABEL_25:
    swift_beginAccess();
    sub_1BD5E0FAC();
    sub_1BD60A4D0();
    swift_endAccess();
    sub_1BD60A680();
    sub_1BD60A6A0();
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    if (v56 != v55[0])
    {
      uint64_t v31 = (void (*)(void *, void))sub_1BD60A6C0();
      uint64_t v33 = *v32;
      uint64_t v26 = v32[1];
      uint64_t v34 = v32[2];
      uint64_t v28 = v32[3];
      uint64_t v35 = v32[4];
      uint64_t v30 = v32[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v31(v55, 0);
      uint64_t v29 = v35;
      uint64_t v27 = v34;
      uint64_t v25 = v33;
    }
    uint64_t v36 = v6[4];
    uint64_t v37 = v6[5];
    v6[4] = v25;
    v6[5] = v26;
    v6[6] = v27;
    v6[7] = v28;
    v6[8] = v29;
    v6[9] = v30;
    goto LABEL_28;
  }
  uint64_t v18 = v52;
  BOOL v19 = v52 == v48 && v7 == v11;
  if (!v19 && (char v20 = sub_1BD60AAF0(), v18 = v52, (v20 & 1) == 0)
    || (v51 == v47 ? (v21 = v50 == v16) : (v21 = 0), !v21 && (char v22 = sub_1BD60AAF0(), v18 = v52, (v22 & 1) == 0)))
  {
    sub_1BD5E0F0C(v18, v7);
    sub_1BD5E0F5C(v48, v11);
    goto LABEL_39;
  }
  if (v49 != v46 || v8 != v17)
  {
    uint64_t v24 = v18;
    char v45 = sub_1BD60AAF0();
    sub_1BD5E0F0C(v24, v7);
    sub_1BD5E0F5C(v48, v11);
    if (v45) {
      goto LABEL_41;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BD5E0F5C(v52, v7);
    goto LABEL_25;
  }
  sub_1BD5E0F0C(v18, v7);
  sub_1BD5E0F5C(v48, v11);
LABEL_41:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v36 = v52;
  uint64_t v37 = v7;
LABEL_28:
  sub_1BD5E0F5C(v36, v37);
  uint64_t v9 = a4;
LABEL_29:
  unint64_t v38 = *(void *)(v9 + OBJC_IVAR____TtC9TeaCharts13LineChartView_seriesViews);
  if (v38 >> 62) {
    goto LABEL_43;
  }
  uint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (; v39; uint64_t v39 = sub_1BD60AA10())
  {
    for (uint64_t i = 4; ; ++i)
    {
      uint64_t v41 = (v38 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x1C187E170](i - 4, v38)
          : (char *)*(id *)(v38 + 8 * i);
      uint64_t v42 = v41;
      uint64_t v43 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      sub_1BD5DFC5C(i - 4, v41, v5, a5);

      if (v43 == v39) {
        return swift_bridgeObjectRelease_n();
      }
    }
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain_n();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_1BD5DFC5C(unint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LineChartModel();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v20 = a3;
  unint64_t v21 = a1;
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_1BD5DC054(v11, (void (*)(uint64_t, uint64_t, id))sub_1BD5E1014);
  swift_bridgeObjectRelease();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(a3 + 16) <= a1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)(a3 + 16 * a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)&a2[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView]+ OBJC_IVAR____TtC9TeaCharts8LineView_imageView), sel_setImage_);
  }
  sub_1BD5D7C7C(a4, (uint64_t)v10);
  unint64_t v12 = *(void *)(*(void *)&v10[*(int *)(v8 + 20)] + 16);
  sub_1BD5E101C((uint64_t)v10, (void (*)(void))type metadata accessor for LineChartModel);
  if (v12 > a1)
  {
    id v13 = LineSeriesAccessibilityElementProvider.seriesContainerElement(for:in:chartModel:)(a1, a2, a4);
    objc_msgSend(v13, sel_setIsAccessibilityElement_, 0);
    uint64_t v14 = *(void *)(a4 + *(int *)(v8 + 20));
    if (*(void *)(v14 + 16) > a1)
    {
      uint64_t v15 = v14 + 24 * a1;
      uint64_t v16 = *(void *)(v15 + 32);
      uint64_t v17 = *(void *)(v15 + 40);
      swift_bridgeObjectRetain();
      sub_1BD5E1074(v16, v17, v13);
      sub_1BD5E10D8(0, &qword_1EBA19A90, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBBE00]);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1BD60C3A0;
      *(void *)(v18 + 56) = type metadata accessor for LineSeriesAccessibilityElement();
      *(void *)(v18 + 32) = v13;
      sub_1BD600B3C(v18, a2);
      return;
    }
LABEL_11:
    __break(1u);
  }
}

void sub_1BD5DFEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(void *)(a4 + 16) <= a5)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v8 = *(void *)(a4 + 16 * a5 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v9 = (id)sub_1BD604C04(a1, a2, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC9TeaCharts8LineView_imageView), sel_setImage_, v9);
  }
}

void sub_1BD5DFF90(void *a1)
{
  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  v6[4] = sub_1BD5E0B28;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1BD5F637C;
  v6[3] = &block_descriptor;
  uint64_t v4 = _Block_copy(v6);
  id v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.15);
  _Block_release(v4);
}

uint64_t sub_1BD5E0080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v67 = a2;
  uint64_t v66 = a1;
  sub_1BD5E092C();
  uint64_t v65 = v6;
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v7);
  id v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD5D5C9C();
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_0_7();
  id v13 = v12;
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  double v64 = (char *)&v57 - v18;
  uint64_t v19 = *a4;
  uint64_t v20 = a4[1];
  unint64_t v59 = *(void *)(a3 + OBJC_IVAR____TtC9TeaCharts13LineChartView_seriesViews);
  if (v59 >> 62) {
    goto LABEL_25;
  }
  uint64_t v21 = *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v21)
  {
LABEL_26:
    return swift_bridgeObjectRelease();
  }
  while (1)
  {
    uint64_t result = type metadata accessor for LineChartModel();
    if (v21 < 1) {
      break;
    }
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v63 = *(int *)(result + 20);
    uint64_t v60 = (void *)(v68 + 96);
    unint64_t v62 = v59 & 0xC000000000000001;
    unint64_t v58 = v59 + 32;
    double v79 = v13 + 8;
    char v80 = (void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    double v76 = v9;
    uint64_t v75 = v17;
    uint64_t v61 = v21;
    while (1)
    {
      uint64_t v25 = v62 ? (char *)MEMORY[0x1C187E170](v23, v59) : (char *)*(id *)(v58 + 8 * v23);
      id v13 = v25;
      uint64_t v26 = *(void *)(v67 + v63);
      if (v23 >= *(void *)(v26 + 16)) {
        break;
      }
      uint64_t v73 = v24;
      unint64_t v74 = v23;
      uint64_t v27 = (void *)(v26 + 24 * v23);
      uint64_t v28 = v27[5];
      uint64_t v69 = v27[4];
      uint64_t v29 = v27[6];
      double v78 = *v80;
      v78(v64, v66, v11);
      v83[0] = MEMORY[0x1E4FBC860];
      sub_1BD5E09AC(&qword_1EBA19518);
      uint64_t v30 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BD60A560();
      double v77 = &v30[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews];
      swift_beginAccess();
      sub_1BD5E09AC(&qword_1EBA19520);
      OUTLINED_FUNCTION_3_2();
      uint64_t v72 = v30;
      uint64_t v71 = v28;
      uint64_t v70 = v29;
      if (v13 != (char *)v84[0])
      {
        do
        {
          uint64_t v43 = (void (*)(void *, void))sub_1BD60A6C0();
          uint64_t v45 = *v44;
          uint64_t v46 = v44[1];
          uint64_t v47 = v44[2];
          uint64_t v48 = v44[3];
          uint64_t v49 = v44[5];
          uint64_t v81 = v44[4];
          uint64_t v82 = v47;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v43(v84, 0);
          v78(v17, (uint64_t)v9, v11);
          sub_1BD60A6B0();
          uint64_t v50 = OUTLINED_FUNCTION_2_2();
          v51(v50);
          if (*(void *)(*(void *)v77 + 16))
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1BD5ED34C();
            if (v52)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v53 = v83[0];
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_1BD5D48F0(0, *(void *)(v53 + 16) + 1, 1);
                uint64_t v53 = v83[0];
              }
              unint64_t v55 = *(void *)(v53 + 16);
              unint64_t v54 = *(void *)(v53 + 24);
              if (v55 >= v54 >> 1)
              {
                sub_1BD5D48F0((char *)(v54 > 1), v55 + 1, 1);
                uint64_t v53 = v83[0];
              }
              *(void *)(v53 + 16) = v55 + 1;
              uint64_t v56 = (void *)(v53 + 48 * v55);
              v56[4] = v45;
              v56[5] = v46;
              v56[6] = v82;
              v56[7] = v48;
              v56[8] = v81;
              v56[9] = v49;
              id v9 = v76;
              uint64_t v17 = v75;
              goto LABEL_22;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
LABEL_22:
          OUTLINED_FUNCTION_3_2();
        }
        while (v45 != v84[0]);
      }
      unint64_t v23 = v74 + 1;
      sub_1BD5E101C((uint64_t)v9, (void (*)(void))sub_1BD5E092C);
      uint64_t v31 = v72;

      uint64_t v32 = v83[0];
      __swift_project_boxed_opaque_existential_1(v60, *(void *)(v68 + 120));
      unint64_t v33 = sub_1BD5D5D04();
      unint64_t v34 = sub_1BD5D5D50();
      MEMORY[0x1C187DB10](v32, &type metadata for CategoryZone, v33, v34);
      v84[0] = v69;
      v84[1] = v71;
      v84[2] = v70;
      v83[0] = v19;
      v83[1] = v20;
      uint64_t v35 = (void *)sub_1BD607570((uint64_t)v17, (uint64_t)v84, (uint64_t)v83);
      uint64_t v37 = v36;
      uint64_t v38 = OUTLINED_FUNCTION_2_2();
      v39(v38);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v40 = swift_beginAccess();
      MEMORY[0x1F4188790](v40);
      *(&v57 - 2) = (uint64_t)v35;
      *(&v57 - 1) = v37;
      uint64_t v41 = swift_bridgeObjectRetain();
      uint64_t v24 = v73;
      sub_1BD5DC054(v41, sub_1BD5E09F0);
      swift_bridgeObjectRelease();
      id v42 = *(id *)&v31[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView];
      sub_1BD5DE038(v35);

      swift_bridgeObjectRelease();
      if (v23 == v61) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1BD60AA10();
    if (!v21) {
      goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

void sub_1BD5E07AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  id v9 = (void *)sub_1BD604C04(a1, a2, a5);
  swift_bridgeObjectRelease();
  if (v9)
  {
    id v10 = v9;
    sub_1BD5DE038(v9);

    objc_msgSend(a3, sel_setHidden_, 0);
  }
  else
  {
    sub_1BD5DE038(0);
    objc_msgSend(a3, sel_setHidden_, 1);
  }
}

uint64_t sub_1BD5E088C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1BD5E08D4()
{
  sub_1BD5E088C();

  return MEMORY[0x1F4186488](v0, 192, 7);
}

uint64_t type metadata accessor for LineChartRenderer()
{
  return self;
}

void sub_1BD5E092C()
{
  if (!qword_1EBA194F0)
  {
    sub_1BD5D5C9C();
    sub_1BD5E09AC(&qword_1EBA19520);
    unint64_t v0 = sub_1BD60A9C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA194F0);
    }
  }
}

uint64_t sub_1BD5E09AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BD5D5C9C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BD5E09F0(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1BD5E07AC(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1BD5E09F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BD5D6B88(a1, a2, *(double *)(v4 + 32), *(double *)(v4 + 40), *(double *)(v4 + 48), a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

void sub_1BD5E0A08()
{
  if (!qword_1EBA19538)
  {
    sub_1BD5E10D8(255, &qword_1EBA199E0, (uint64_t)&type metadata for LineChartImages, MEMORY[0x1E4FBB320]);
    unint64_t v0 = sub_1BD60A400();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19538);
    }
  }
}

uint64_t sub_1BD5E0A84()
{
  return sub_1BD5DF440(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1BD5E0A94()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BD5E0ACC()
{
  sub_1BD5DFF90(*(void **)(v0 + 16));
}

uint64_t sub_1BD5E0AD4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD5E0B0C(uint64_t a1)
{
  return sub_1BD60829C(a1, *(uint64_t (**)(void))(v1 + 16));
}

id sub_1BD5E0B28()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 1.0);
}

uint64_t sub_1BD5E0B3C()
{
  return sub_1BD60A360();
}

void sub_1BD5E0B70()
{
  if (!qword_1EBA19A08)
  {
    sub_1BD5D9BB4(255, (unint64_t *)&qword_1EBA1BC68);
    sub_1BD5E10D8(255, &qword_1EBA199E0, (uint64_t)&type metadata for LineChartImages, MEMORY[0x1E4FBB320]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA19A08);
    }
  }
}

uint64_t sub_1BD5E0C14()
{
  sub_1BD5D5C9C();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_7();
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (v5 + 24) & ~v5;
  unint64_t v8 = (*(void *)(v7 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  id v9 = (int *)(type metadata accessor for LineChartModel() - 8);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)v9 + 80);
  uint64_t v11 = (v8 + v10 + 8) & ~v10;
  uint64_t v12 = v11 + *(void *)(*(void *)v9 + 64);
  uint64_t v13 = v5 | v10 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v6, v2);

  sub_1BD5D40B0();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v14 + 8))(v0 + v11);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(v0 + v11 + *(int *)(v15 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = v0 + v11 + v9[10];
  sub_1BD60A130();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v17 + 8))(v16);

  return MEMORY[0x1F4186498](v0, v12, v13);
}

uint64_t sub_1BD5E0E18(uint64_t a1)
{
  sub_1BD5D5C9C();
  unint64_t v4 = (*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80);
  unint64_t v5 = (*(void *)(*(void *)(v3 - 8) + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for LineChartModel() - 8);
  return sub_1BD5DF6C4(a1, *(void *)(v1 + 16), v1 + v4, *(void *)(v1 + v5), v1 + ((v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
}

uint64_t sub_1BD5E0F0C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1BD5E0F5C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BD5E0FAC()
{
  if (!qword_1EBA19B98)
  {
    type metadata accessor for LineSeriesAccessibilityElement();
    unint64_t v0 = sub_1BD60A4E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19B98);
    }
  }
}

void sub_1BD5E1014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5DFEB4(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1BD5E101C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void sub_1BD5E1074(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1BD60A510();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAccessibilityLabel_, v4);
}

void sub_1BD5E10D8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t initializeWithCopy for GridLabelLayoutAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for GridLabelLayoutAttributes(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  unint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  long long v7 = *(_OWORD *)(a2 + 8);
  long long v8 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v8;
  *(_OWORD *)(a1 + 8) = v7;
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for GridLabelLayoutAttributes(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for GridLabelLayoutAttributes(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
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

uint64_t storeEnumTagSinglePayload for GridLabelLayoutAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridLabelLayoutAttributes()
{
  return &type metadata for GridLabelLayoutAttributes;
}

uint64_t ChartModelFactory.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t ChartModelFactory.init(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t ChartModelFactory.model(for:)(long long *a1)
{
  uint64_t v2 = *(uint64_t (**)(long long *))(v1 + 16);
  long long v4 = *a1;
  return v2(&v4);
}

uint64_t ChartModelFactory.deinit()
{
  swift_release();
  return v0;
}

uint64_t ChartModelFactory.__deallocating_deinit()
{
  ChartModelFactory.deinit();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BD5E13D0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_1BD5E13D8(long long *a1)
{
  return ChartModelFactory.model(for:)(a1);
}

uint64_t dispatch thunk of ChartModelFactoryType.model(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_1BD5E1410()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ChartModelFactory()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ChartModelFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ChartModelFactory);
}

uint64_t dispatch thunk of ChartModelFactory.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t Series.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Series.points.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Series.init(_:points:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t Series.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1BD60A550();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1BD60A620();

  return swift_bridgeObjectRelease();
}

uint64_t static Series.== infix(_:_:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = a1[2];
  uint64_t v9 = a2[2];
  BOOL v10 = *a1 == *a2 && a1[1] == a2[1];
  if (!v10 && (sub_1BD60AAF0() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = *(void *)(a6 + 8);

  return MEMORY[0x1F4183FC8](v8, v9, a3, v11);
}

BOOL sub_1BD5E1604(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1BD5E1614()
{
  return sub_1BD60AB80();
}

uint64_t sub_1BD5E163C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1BD60AAF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746E696F70 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1BD60AAF0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1BD5E1714()
{
  return 2;
}

uint64_t sub_1BD5E171C()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5E1764()
{
  return 0;
}

uint64_t sub_1BD5E1770(char a1)
{
  if (a1) {
    return 0x73746E696F70;
  }
  else {
    return 1701667182;
  }
}

BOOL sub_1BD5E179C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BD5E1604(*a1, *a2);
}

uint64_t sub_1BD5E17B4()
{
  return sub_1BD5E171C();
}

uint64_t sub_1BD5E17C8()
{
  return sub_1BD5E1614();
}

uint64_t sub_1BD5E17DC()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5E1828()
{
  return sub_1BD5E1770(*v0);
}

uint64_t sub_1BD5E183C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BD5E163C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BD5E1870()
{
  return sub_1BD5E1764();
}

uint64_t sub_1BD5E189C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BD5E1714();
  *a1 = result;
  return result;
}

uint64_t sub_1BD5E18D0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1BD5E1924(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t Series.encode(to:)(void *a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 32);
  long long v18 = *(_OWORD *)(a2 + 16);
  long long v19 = v4;
  long long v23 = v18;
  long long v24 = v4;
  type metadata accessor for Series.CodingKeys();
  swift_getWitnessTable();
  sub_1BD60AAA0();
  OUTLINED_FUNCTION_0_7();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v16 - v8;
  uint64_t v20 = *v2;
  uint64_t v17 = v2[2];
  uint64_t v10 = a1[3];
  uint64_t v11 = a1;
  uint64_t v13 = v12;
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_1BD60ABC0();
  LOBYTE(v23) = 0;
  uint64_t v14 = v21;
  sub_1BD60AA70();
  if (!v14)
  {
    *(void *)&long long v23 = v17;
    char v25 = 1;
    sub_1BD60A610();
    uint64_t v22 = v19;
    swift_getWitnessTable();
    sub_1BD60AA90();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v13);
}

uint64_t Series.hashValue.getter()
{
  return sub_1BD60ABA0();
}

uint64_t Series.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for Series.CodingKeys();
  swift_getWitnessTable();
  sub_1BD60AA60();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD60ABB0();
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(a2) = 0;
  uint64_t v6 = sub_1BD60AA30();
  uint64_t v8 = v7;
  uint64_t v12 = v6;
  sub_1BD60A610();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_1BD60AA50();
  uint64_t v9 = OUTLINED_FUNCTION_1_3();
  v10(v9);
  *a3 = v12;
  a3[1] = v8;
  a3[2] = a2;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BD5E1DE8()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5E1E2C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return Series.init(from:)(a1, *(void *)(a2 + 16), a3);
}

uint64_t sub_1BD5E1E50(void *a1, uint64_t a2)
{
  return Series.encode(to:)(a1, a2);
}

uint64_t sub_1BD5E1E68(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Series.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), a4, a5, *(void *)(a3 + 40));
}

uint64_t type metadata accessor for Series.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BD5E1E90()
{
  return swift_getWitnessTable();
}

uint64_t sub_1BD5E1EB0()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1BD5E1EEC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1BD5E1F2C(void *a1, void *a2)
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

uint64_t sub_1BD5E1F94(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CategoryDataPoint(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CategoryDataPoint(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Series()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BD5E2074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

uint64_t getEnumTagSinglePayload for Orientation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_1BD5E2104(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD5E21D0);
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

unsigned char *sub_1BD5E21F8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_1BD5E2204()
{
  return swift_getWitnessTable();
}

uint64_t sub_1BD5E2220()
{
  return swift_getWitnessTable();
}

uint64_t sub_1BD5E223C()
{
  return swift_getWitnessTable();
}

void sub_1BD5E2258(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_1BD5E22DC(v1);
}

void *sub_1BD5E2288()
{
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_28();
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1BD5E22DC(void *a1)
{
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_26();
  int v3 = *v1;
  *id v1 = a1;
}

uint64_t sub_1BD5E2334@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_22();
  uint64_t v4 = v1 + *(void *)(v3 + 240);
  swift_beginAccess();
  OUTLINED_FUNCTION_22();
  sub_1BD60A7D0();
  OUTLINED_FUNCTION_8_0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(a1, v4);
}

uint64_t sub_1BD5E23E8(uint64_t a1)
{
  OUTLINED_FUNCTION_22();
  uint64_t v4 = v1 + *(void *)(v3 + 240);
  swift_beginAccess();
  OUTLINED_FUNCTION_22();
  sub_1BD60A7D0();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, a1);
  return swift_endAccess();
}

void *sub_1BD5E24A4()
{
  uint64_t v1 = *(void **)((char *)v0 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8));
  id v2 = v1;
  return v1;
}

uint64_t sub_1BD5E24F0(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0xF8)) = a1;
  return MEMORY[0x1F41817F8]();
}

uint64_t ChartViewController.chartLayoutAttributes.getter()
{
  return swift_retain();
}

uint64_t sub_1BD5E254C()
{
  uint64_t v0 = swift_retain();
  return sub_1BD5E25C8(v0);
}

uint64_t sub_1BD5E2578()
{
  return swift_retain();
}

uint64_t sub_1BD5E25C8(uint64_t a1)
{
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_26();
  *uint64_t v1 = a1;
  return swift_release();
}

uint64_t (*sub_1BD5E2620())()
{
  return j__swift_endAccess;
}

id ChartViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void ChartViewController.init(coder:)()
{
  id v2 = v0;
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *(void *)v0;
  uint64_t v4 = *(void *)(v3 + 80);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v5);
  BOOL v7 = (char *)v14 - v6;
  *(void *)&v2[*(void *)(v3 + 232)] = 0;
  OUTLINED_FUNCTION_5_0();
  __swift_storeEnumTagSinglePayload((uint64_t)&v2[*(void *)(v8 + 240)], 1, 1, v4);
  OUTLINED_FUNCTION_5_0();
  *(void *)&v2[*(void *)(v9 + 248)] = 0;
  OUTLINED_FUNCTION_5_0();
  uint64_t v11 = *(void *)(v10 + 256);
  sub_1BD5E2914();
  memset(v14, 0, sizeof(v14));
  swift_allocObject();
  *(void *)&v2[v11] = sub_1BD60A290();
  OUTLINED_FUNCTION_5_0();
  uint64_t v13 = *(void *)(v12 + 264);
  sub_1BD60A2B0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v1);
  *(void *)&v2[v13] = sub_1BD60A280();

  sub_1BD60AA00();
  __break(1u);
}

void sub_1BD5E2914()
{
  if (!qword_1EBA19BE8)
  {
    sub_1BD5E296C();
    unint64_t v0 = sub_1BD60A2B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19BE8);
    }
  }
}

void sub_1BD5E296C()
{
  if (!qword_1EBA1A1A8)
  {
    unint64_t v0 = sub_1BD60A7D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1A1A8);
    }
  }
}

void sub_1BD5E29B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  ChartViewController.init(coder:)();
}

void ChartViewController.__allocating_init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)()
{
  id v1 = objc_allocWithZone(v0);
  ChartViewController.init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)();
}

void ChartViewController.init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)()
{
  OUTLINED_FUNCTION_21();
  id v2 = v0;
  uint64_t v63 = v3;
  uint64_t v65 = v4;
  uint64_t v66 = v6;
  uint64_t v67 = v5;
  uint64_t v68 = v8;
  uint64_t v69 = v7;
  uint64_t v59 = v9;
  uint64_t v64 = *MEMORY[0x1E4FBC8C8] & *(void *)v0;
  uint64_t v10 = v64;
  uint64_t v62 = *(void *)(v64 + 128);
  OUTLINED_FUNCTION_22();
  uint64_t v61 = *(void *)(v11 + 80);
  uint64_t v12 = v61;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v56 - v14;
  *(void *)&v2[*(void *)(v64 + 232)] = 0;
  OUTLINED_FUNCTION_4_2();
  __swift_storeEnumTagSinglePayload((uint64_t)&v2[*(void *)(v16 + 240)], 1, 1, v12);
  OUTLINED_FUNCTION_4_2();
  *(void *)&v2[*(void *)(v17 + 248)] = 0;
  OUTLINED_FUNCTION_4_2();
  uint64_t v19 = *(void *)(v18 + 256);
  sub_1BD5E2914();
  long long v75 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  memset(v74, 0, sizeof(v74));
  swift_allocObject();
  uint64_t v20 = v2;
  *(void *)&v2[v19] = sub_1BD60A290();
  OUTLINED_FUNCTION_3_3();
  uint64_t v22 = *(void *)(v21 + 264);
  sub_1BD60A2B0();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v1);
  *(void *)&v20[v22] = sub_1BD60A280();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_10(*(void *)(v23 + 176));
  OUTLINED_FUNCTION_1_4();
  uint64_t v60 = v24;
  uint64_t v26 = v25;
  OUTLINED_FUNCTION_11_0();
  v27();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_10(*(void *)(v28 + 184));
  uint64_t v57 = *(void *)(v29 + 96);
  OUTLINED_FUNCTION_1_4();
  uint64_t v58 = v30;
  OUTLINED_FUNCTION_11_0();
  v31();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_10(*(void *)(v32 + 192));
  uint64_t v56 = *(void *)(v33 + 104);
  OUTLINED_FUNCTION_1_4();
  uint64_t v35 = v34;
  OUTLINED_FUNCTION_11_0();
  v36();
  OUTLINED_FUNCTION_3_3();
  sub_1BD5E2F38(v67, (uint64_t)&v20[*(void *)(v37 + 200)]);
  OUTLINED_FUNCTION_3_3();
  sub_1BD5E2F38(v66, (uint64_t)&v20[*(void *)(v38 + 208)]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_10(*(void *)(v39 + 216));
  uint64_t v41 = *(void *)(v40 + 112);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_11_0();
  v42();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_10(*(void *)(v43 + 224));
  uint64_t v45 = *(void *)(v44 + 120);
  OUTLINED_FUNCTION_1_4();
  uint64_t v47 = v46;
  uint64_t v48 = v63;
  OUTLINED_FUNCTION_11_0();
  v49();

  uint64_t v50 = *(void *)(v10 + 168);
  *(void *)&long long v71 = v61;
  *((void *)&v71 + 1) = v26;
  uint64_t v51 = v56;
  *(void *)&long long v72 = v57;
  *((void *)&v72 + 1) = v56;
  *(void *)&long long v73 = v41;
  *((void *)&v73 + 1) = v45;
  v74[0] = v62;
  *(_OWORD *)&v74[1] = *(_OWORD *)(v64 + 136);
  *(_OWORD *)&v74[3] = *(_OWORD *)(v64 + 152);
  v74[5] = v50;
  char v52 = (objc_class *)type metadata accessor for ChartViewController();
  v70.receiver = v20;
  v70.super_class = v52;
  objc_msgSendSuper2(&v70, sel_initWithNibName_bundle_, 0, 0);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v45);
  OUTLINED_FUNCTION_24();
  v53();
  __swift_destroy_boxed_opaque_existential_1(v66);
  __swift_destroy_boxed_opaque_existential_1(v67);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v68, v51);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_7_0();
  v54();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_7_0();
  v55();
  OUTLINED_FUNCTION_19();
}

uint64_t sub_1BD5E2F38(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_8_0();
  (*v3)(a2);
  return a2;
}

uint64_t type metadata accessor for ChartViewController()
{
  return swift_getGenericMetadata();
}

id ChartViewController.__deallocating_deinit()
{
  uint64_t v1 = (_OWORD *)(*MEMORY[0x1E4FBC8C8] & *v0);
  id v2 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v2, sel_removeObserver_name_object_, v0, *MEMORY[0x1E4FB2420], 0);

  long long v4 = v1[5];
  long long v5 = v1[6];
  long long v6 = v1[7];
  long long v7 = v1[8];
  long long v8 = v1[9];
  long long v9 = v1[10];
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for ChartViewController();
  return objc_msgSendSuper2(&v10, sel_dealloc, v4, v5, v6, v7, v8, v9);
}

id sub_1BD5E3094(void *a1)
{
  id v1 = a1;
  return ChartViewController.__deallocating_deinit();
}

uint64_t sub_1BD5E30BC(uint64_t a1)
{
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v2 + 8))();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12(*(void *)(v3 + 184));
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v4 + 8))();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12(*(void *)(v5 + 192));
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v6 + 8))();
  OUTLINED_FUNCTION_2_3();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(void *)(v7 + 200));
  OUTLINED_FUNCTION_2_3();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(void *)(v8 + 208));
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12(*(void *)(v9 + 216));
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v10 + 8))();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12(*(void *)(v11 + 224));
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v12 + 8))();
  OUTLINED_FUNCTION_2_3();

  OUTLINED_FUNCTION_2_3();
  sub_1BD60A7D0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  v14();
  OUTLINED_FUNCTION_2_3();

  OUTLINED_FUNCTION_2_3();
  swift_release();
  OUTLINED_FUNCTION_2_3();

  return swift_release();
}

void sub_1BD5E334C()
{
  uint64_t v4 = v0;
  *(void *)&long long v112 = *MEMORY[0x1E4FBC8C8] & *(void *)v0;
  uint64_t v5 = (void *)v112;
  uint64_t v6 = *(void *)(v112 + 160);
  uint64_t v7 = *(void *)(v112 + 112);
  uint64_t v114 = OUTLINED_FUNCTION_36();
  uint64_t v115 = OUTLINED_FUNCTION_36();
  *(void *)&long long v116 = swift_getAssociatedConformanceWitness();
  *((void *)&v116 + 1) = swift_getAssociatedConformanceWitness();
  uint64_t v99 = type metadata accessor for CoordinateSpace();
  OUTLINED_FUNCTION_1();
  uint64_t v98 = v8;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_38(v10);
  uint64_t v12 = *(void *)(v11 + 128);
  uint64_t v13 = *(void *)(v112 + 80);
  swift_getAssociatedTypeWitness();
  uint64_t v105 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1();
  uint64_t v104 = v14;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_13();
  uint64_t v103 = v16;
  OUTLINED_FUNCTION_1();
  long long v108 = v17;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_13();
  uint64_t v107 = v19;
  sub_1BD60A7D0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v94 - v21;
  uint64_t v109 = v1;
  OUTLINED_FUNCTION_1();
  uint64_t v24 = v23;
  MEMORY[0x1F4188790](v25);
  double v106 = (char *)&v94 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_38((uint64_t)&v94 - v28);
  uint64_t v30 = *(void *)(v29 + 88);
  uint64_t v31 = v5[15];
  uint64_t v32 = v5[17];
  uint64_t v33 = v5[21];
  uint64_t v114 = v13;
  uint64_t v101 = v30;
  uint64_t v115 = v30;
  long long v96 = *(_OWORD *)(v112 + 96);
  long long v116 = v96;
  uint64_t v102 = v7;
  *(void *)&long long v117 = v7;
  *((void *)&v117 + 1) = v31;
  uint64_t v110 = v12;
  uint64_t v118 = v12;
  uint64_t v119 = v32;
  uint64_t v100 = v32;
  long long v112 = *(_OWORD *)(v112 + 144);
  long long v120 = v112;
  uint64_t v95 = v6;
  uint64_t v121 = v6;
  uint64_t v122 = v33;
  uint64_t v34 = (objc_class *)type metadata accessor for ChartViewController();
  v125.receiver = v4;
  v125.super_class = v34;
  objc_msgSendSuper2(&v125, sel_viewDidLayoutSubviews);
  uint64_t v35 = sub_1BD5E2288();
  if (v35)
  {
    uint64_t v36 = v35;
    id v37 = objc_msgSend(v4, sel_view);
    if (!v37)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    objc_msgSend(v37, sel_bounds);
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_25(v38, sel_setFrame_);
  }
  uint64_t v39 = sub_1BD5E24A4();
  if (v39)
  {
    uint64_t v40 = v39;
    id v41 = objc_msgSend(v4, sel_view);
    if (!v41)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    objc_msgSend(v41, sel_bounds);
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_25(v42, sel_setFrame_);
  }
  id v43 = objc_msgSend(v4, sel_view);
  if (!v43)
  {
    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v43, sel_bounds);
  OUTLINED_FUNCTION_37();
  sub_1BD5E2334((uint64_t)v22);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v13))
  {
    uint64_t v44 = OUTLINED_FUNCTION_31();
    v45(v44);
    return;
  }
  uint64_t v46 = v108;
  uint64_t v47 = v107;
  OUTLINED_FUNCTION_11_0();
  v48();
  uint64_t v49 = OUTLINED_FUNCTION_31();
  v50(v49);
  uint64_t v114 = v2;
  uint64_t v115 = v3;
  uint64_t v51 = v106;
  (*(void (**)(uint64_t *, uint64_t))(v110 + 24))(&v114, v13);
  v46[1](v47, v13);
  uint64_t v52 = v109;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v111, v51, v109);
  uint64_t v53 = sub_1BD5E2288();
  if (!v53)
  {
    OUTLINED_FUNCTION_24();
    v92();
    return;
  }
  unint64_t v54 = v53;
  unint64_t v55 = (void (**)(void, uint64_t))sub_1BD5E24A4();
  if (!v55)
  {
    OUTLINED_FUNCTION_24();
    v93();

    return;
  }
  long long v108 = v55;
  sub_1BD5E2578();
  uint64_t v56 = v103;
  OUTLINED_FUNCTION_11_0();
  v57();
  __swift_storeEnumTagSinglePayload(v56, 0, 1, v52);
  sub_1BD60A270();
  swift_release();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_7_0();
  v58();
  id v59 = objc_msgSend(v4, sel_view);
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v107 = v24;
    objc_msgSend(v59, sel_bounds);

    id v61 = objc_msgSend(v4, sel_view);
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = (char *)objc_msgSend(v61, sel_traitCollection);
      double v106 = v63;

      OUTLINED_FUNCTION_5_0();
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v65 = v97;
      uint64_t v66 = v111;
      (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 72))(v52, AssociatedConformanceWitness);
      OUTLINED_FUNCTION_17();
      *(void *)(v67 - 256) = v63;
      uint64_t v68 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(v95 + 40))(v65, &v114, v102);
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_7_0();
      v69();
      OUTLINED_FUNCTION_5_0();
      long long v71 = &v4[*(void *)(v70 + 200)];
      uint64_t v72 = *((void *)v71 + 3);
      uint64_t v73 = *((void *)v71 + 4);
      __swift_project_boxed_opaque_existential_1(v71, v72);
      v113[0] = v2;
      v113[1] = v3;
      (*(void (**)(uint64_t *__return_ptr, uint64_t, void *, uint64_t, uint64_t))(v73 + 8))(&v114, v68, v113, v72, v73);
      uint64_t v110 = v114;
      uint64_t v105 = v115;
      long long v74 = v116;
      uint64_t v75 = v118;
      uint64_t v76 = v119;
      long long v77 = v120;
      uint64_t v104 = v121;
      uint64_t v103 = v122;
      uint64_t v78 = v123;
      uint64_t v79 = v124;
      OUTLINED_FUNCTION_5_0();
      uint64_t v114 = v80;
      uint64_t v115 = v81;
      OUTLINED_FUNCTION_16();
      *((void *)&v120 + 1) = *((void *)&v77 + 1);
      uint64_t v121 = v82;
      uint64_t v122 = v83;
      uint64_t v123 = v78;
      uint64_t v124 = v79;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BD60A270();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_5_0();
      (*(void (**)(uint64_t, void, double, double))(v112 + 24))(v66, v96, *(double *)&v74, *((double *)&v74 + 1));
      OUTLINED_FUNCTION_5_0();
      uint64_t v114 = v110;
      uint64_t v115 = v105;
      OUTLINED_FUNCTION_16();
      uint64_t v84 = v104;
      *((void *)&v120 + 1) = *((void *)&v77 + 1);
      uint64_t v121 = v104;
      uint64_t v85 = v103;
      uint64_t v122 = v103;
      uint64_t v123 = v78;
      uint64_t v124 = v79;
      (*(void (**)(uint64_t, void *, uint64_t *, uint64_t))(v100 + 48))(v66, v54, &v114, v101);
      OUTLINED_FUNCTION_5_0();
      double v87 = &v4[*(void *)(v86 + 208)];
      uint64_t v88 = *((void *)v87 + 3);
      uint64_t v89 = *((void *)v87 + 4);
      __swift_project_boxed_opaque_existential_1(v87, v88);
      OUTLINED_FUNCTION_17();
      *(void *)(v90 - 256) = v75;
      *((void *)&v116 + 1) = v76;
      long long v117 = v77;
      uint64_t v118 = v84;
      uint64_t v119 = v85;
      *(void *)&long long v120 = v78;
      *((void *)&v120 + 1) = v79;
      uint64_t v91 = v108;
      (*(void (**)(uint64_t, uint64_t *, void (**)(void, uint64_t), uint64_t, uint64_t))(v89 + 16))(v68, &v114, v108, v88, v89);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v66, v52);
      return;
    }
    goto LABEL_21;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
}

void sub_1BD5E3E08(void *a1)
{
  id v1 = a1;
  sub_1BD5E334C();
}

id sub_1BD5E3E50(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  uint64_t v79 = a2;
  uint64_t v84 = a1;
  uint64_t v80 = (void *)(*MEMORY[0x1E4FBC8C8] & *(void *)v2);
  uint64_t v6 = v80[20];
  uint64_t v7 = v80[14];
  uint64_t v8 = OUTLINED_FUNCTION_35();
  uint64_t v9 = OUTLINED_FUNCTION_35();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v76 = v7;
  uint64_t v77 = v6;
  double v86 = *(double *)&v8;
  double v87 = *(double *)&v9;
  uint64_t v88 = AssociatedConformanceWitness;
  uint64_t v89 = swift_getAssociatedConformanceWitness();
  type metadata accessor for CoordinateSpace();
  OUTLINED_FUNCTION_1();
  uint64_t v74 = v12;
  uint64_t v75 = v11;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_13();
  uint64_t v73 = v14;
  uint64_t v83 = v80[12];
  OUTLINED_FUNCTION_1();
  id v85 = v15;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13();
  uint64_t v82 = v17;
  uint64_t v18 = v80[16];
  uint64_t v19 = v80[10];
  swift_getAssociatedTypeWitness();
  uint64_t v81 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1();
  uint64_t v21 = v20;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v71 - v23;
  OUTLINED_FUNCTION_1();
  uint64_t v26 = v25;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v27);
  uint64_t v29 = (char *)&v71 - v28;
  sub_1BD60A7D0();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)&v71 - v31;
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(char *))(v33 + 16))(v32);
  __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v19);
  sub_1BD5E23E8((uint64_t)v32);
  id result = objc_msgSend(v5, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  objc_msgSend(result, sel_bounds);
  OUTLINED_FUNCTION_37();
  double v86 = v3;
  double v87 = v4;
  uint64_t v35 = *(void (**)(double *, uint64_t, uint64_t))(v18 + 24);
  uint64_t v78 = v18;
  v35(&v86, v19, v18);
  sub_1BD5E2578();
  uint64_t v72 = v26;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v24, v29, AssociatedConformanceWitness);
  uint64_t v84 = AssociatedConformanceWitness;
  __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, AssociatedConformanceWitness);
  sub_1BD60A270();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v81);
  OUTLINED_FUNCTION_5_0();
  uint64_t v36 = v83;
  OUTLINED_FUNCTION_11_0();
  v37();
  id result = OUTLINED_FUNCTION_20();
  if (!result)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(result, sel_bounds);
  OUTLINED_FUNCTION_37();
  uint64_t v38 = v80;
  (*(void (**)(char *, uint64_t, double, double))(v80[18] + 24))(v29, v36, v3, v4);
  uint64_t v39 = v38;
  OUTLINED_FUNCTION_7_0();
  v40();
  OUTLINED_FUNCTION_5_0();
  uint64_t v41 = v79;
  (*(void (**)(uint64_t, void))(v38[19] + 16))(v79, v38[13]);
  uint64_t v42 = sub_1BD5E24A4();
  id v43 = v29;
  if (v42)
  {
    uint64_t v44 = v42;
    objc_msgSend(v42, sel_removeFromSuperview);
  }
  uint64_t v45 = sub_1BD5E2288();
  if (v45)
  {
    uint64_t v46 = v45;
    objc_msgSend(v45, sel_removeFromSuperview);
  }
  id result = OUTLINED_FUNCTION_20();
  if (!result) {
    goto LABEL_15;
  }
  objc_msgSend(result, sel_bounds);
  OUTLINED_FUNCTION_37();
  id result = OUTLINED_FUNCTION_20();
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v47 = result;
  id v48 = objc_msgSend(result, sel_traitCollection);

  OUTLINED_FUNCTION_5_0();
  uint64_t v49 = v84;
  uint64_t v50 = swift_getAssociatedConformanceWitness();
  uint64_t v51 = v73;
  (*(void (**)(uint64_t, uint64_t))(v50 + 72))(v49, v50);
  double v86 = v3;
  double v87 = v4;
  id v85 = v48;
  uint64_t v88 = (uint64_t)v48;
  uint64_t v52 = (*(uint64_t (**)(uint64_t, double *, uint64_t))(v77 + 40))(v51, &v86, v76);
  OUTLINED_FUNCTION_7_0();
  v53();
  OUTLINED_FUNCTION_5_0();
  unint64_t v55 = &v5[*(void *)(v54 + 208)];
  uint64_t v56 = v43;
  uint64_t v57 = *((void *)v55 + 3);
  uint64_t v58 = *((void *)v55 + 4);
  __swift_project_boxed_opaque_existential_1(v55, v57);
  id v59 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 8))(v52, v57, v58);
  swift_bridgeObjectRelease();
  id result = OUTLINED_FUNCTION_20();
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v60 = result;
  objc_msgSend(result, sel_addSubview_, v59);

  OUTLINED_FUNCTION_5_0();
  id v61 = (void *)(*(uint64_t (**)(char *, uint64_t, void))(v39[17] + 40))(v56, v41, v39[11]);
  id result = OUTLINED_FUNCTION_20();
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v62 = result;
  objc_msgSend(result, sel_addSubview_, v61);

  id v63 = v61;
  sub_1BD5E22DC(v61);
  id v64 = v59;
  sub_1BD5E24F0((uint64_t)v59);
  OUTLINED_FUNCTION_5_0();
  uint64_t v65 = v39[21];
  uint64_t v66 = *(void (**)(char *, id, uint64_t, uint64_t))(v65 + 32);
  uint64_t v67 = v39[15];
  id v68 = v63;
  v66(v56, v68, v67, v65);

  id result = objc_msgSend(v5, sel_view);
  uint64_t v69 = v72;
  if (result)
  {
    uint64_t v70 = result;
    objc_msgSend(result, sel_setNeedsLayout);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v56, v84);
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_1BD5E4670()
{
  uint64_t v1 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50);
  sub_1BD60A7D0();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v2);
  double v4 = (char *)v10 - v3;
  uint64_t v5 = sub_1BD5E24A4();
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_removeFromSuperview);
  }
  uint64_t v7 = sub_1BD5E2288();
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(v7, sel_removeFromSuperview);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v1);
  sub_1BD5E23E8((uint64_t)v4);
  memset(v10, 0, sizeof(v10));
  return sub_1BD60A270();
}

uint64_t sub_1BD5E4798()
{
  swift_getAssociatedTypeWitness();
  sub_1BD60A7D0();

  return sub_1BD60A7D0();
}

void sub_1BD5E483C(void *a1)
{
  id v1 = a1;
  sub_1BD5E4798();
}

uint64_t sub_1BD5E4884()
{
  return 0;
}

id ChartViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1BD60A510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ChartViewController.init(nibName:bundle:)()
{
}

void sub_1BD5E4934(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3) {
    sub_1BD60A540();
  }
  id v5 = a4;
  ChartViewController.init(nibName:bundle:)();
}

void ChartViewController<>.add(zone:)()
{
  OUTLINED_FUNCTION_21();
  uint64_t v2 = v0;
  uint64_t v29 = v3;
  uint64_t v4 = *MEMORY[0x1E4FBC8C8] & *v0;
  OUTLINED_FUNCTION_15();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1();
  v28[1] = v6;
  v28[2] = v5;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v28 - v8;
  OUTLINED_FUNCTION_1();
  v28[4] = v10;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_13();
  v28[3] = v12;
  OUTLINED_FUNCTION_15();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)v28 - v17;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_40();
  v28[0] = v4;
  uint64_t v19 = OUTLINED_FUNCTION_34();
  v20(v19);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v29, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, AssociatedTypeWitness);
  sub_1BD5E2578();
  sub_1BD60A2A0();
  swift_release();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v1) == 1)
  {
    OUTLINED_FUNCTION_7_0();
    v22();
  }
  else
  {
    uint64_t v23 = OUTLINED_FUNCTION_14();
    v24(v23);
    if (sub_1BD5E2288())
    {
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_18();
      v25();
    }
    uint64_t v26 = OUTLINED_FUNCTION_32();
    v27(v26);
  }
  OUTLINED_FUNCTION_19();
}

void ChartViewController<>.removeZone(with:)()
{
  OUTLINED_FUNCTION_21();
  uint64_t v2 = v0;
  uint64_t v30 = v3;
  uint64_t v31 = v4;
  uint64_t v5 = *MEMORY[0x1E4FBC8C8] & *v0;
  OUTLINED_FUNCTION_15();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1();
  v29[2] = v7;
  v29[3] = v6;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v29 - v9;
  OUTLINED_FUNCTION_1();
  v29[5] = v11;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_13();
  v29[4] = v13;
  OUTLINED_FUNCTION_15();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1();
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v29 - v18;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_40();
  v29[1] = v5;
  uint64_t v20 = OUTLINED_FUNCTION_34();
  v21(v20);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v30, v31, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, AssociatedTypeWitness);
  sub_1BD5E2578();
  sub_1BD60A2A0();
  swift_release();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v1) == 1)
  {
    OUTLINED_FUNCTION_7_0();
    v23();
  }
  else
  {
    uint64_t v24 = OUTLINED_FUNCTION_14();
    v25(v24);
    if (sub_1BD5E2288())
    {
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_18();
      v26();
    }
    uint64_t v27 = OUTLINED_FUNCTION_32();
    v28(v27);
  }
  OUTLINED_FUNCTION_19();
}

void ChartViewController<>.removeZones(with:)()
{
  OUTLINED_FUNCTION_21();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *MEMORY[0x1E4FBC8C8] & *v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_1BD60A7D0();
  OUTLINED_FUNCTION_1();
  v25[3] = v9;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v25 - v11;
  OUTLINED_FUNCTION_1();
  uint64_t v26 = v13;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v25 - v15;
  uint64_t v17 = *(void *)(v5 + 16);
  if (v17)
  {
    v25[1] = v8;
    v25[2] = v6;
    swift_bridgeObjectRetain();
    uint64_t v18 = (uint64_t *)(v5 + 40);
    do
    {
      uint64_t v19 = *v18;
      v27[0] = *(v18 - 1);
      v27[1] = v19;
      swift_bridgeObjectRetain();
      sub_1BD5E5108(v27, v1, v3);
      swift_bridgeObjectRelease();
      v18 += 2;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  sub_1BD5E2578();
  sub_1BD60A2A0();
  swift_release();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, AssociatedTypeWitness) == 1)
  {
    OUTLINED_FUNCTION_7_0();
    v20();
  }
  else
  {
    uint64_t v21 = v26;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v16, v12, AssociatedTypeWitness);
    uint64_t v22 = sub_1BD5E2288();
    if (v22)
    {
      uint64_t v23 = v22;
      OUTLINED_FUNCTION_18();
      v24();
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, AssociatedTypeWitness);
  }
  OUTLINED_FUNCTION_19();
}

uint64_t sub_1BD5E5108(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)((*MEMORY[0x1E4FBC8C8] & *a2) + 0x58);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  double v8 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v15 - v9;
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  (*(void (**)(uint64_t, uint64_t, double))(a3 + 48))(v5, a3, v8);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v12, v11, AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, AssociatedTypeWitness);
}

void *sub_1BD5E52AC@<X0>(void *a1@<X8>)
{
  id result = sub_1BD5E2288();
  *a1 = result;
  return result;
}

uint64_t sub_1BD5E52E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BD5E2578();
  *a1 = result;
  return result;
}

uint64_t sub_1BD5E531C()
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
            uint64_t result = sub_1BD60A7D0();
            if (v6 <= 0x3F) {
              return swift_initClassMetadata2();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t method lookup function for ChartViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ChartViewController);
}

uint64_t dispatch thunk of ChartViewController.chartView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ChartViewController.model.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ChartViewController.model.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ChartViewController.model.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ChartViewController.__allocating_init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of ChartViewController.show(modelFactory:style:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ChartViewController.clear()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ChartViewController.accessibilityRedrawsOnBoldTextStatusChange.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

void *OUTLINED_FUNCTION_9_0(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x60uLL);
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

void OUTLINED_FUNCTION_16()
{
  *(void *)(v0 - 264) = v1;
  *(void *)(v0 - 256) = v2;
  *(void *)(v0 - 248) = v3;
  *(void *)(v0 - 240) = v4;
  *(void *)(v0 - 232) = v5;
  *(void *)(v0 - 224) = v6;
  *(void *)(v0 - 216) = v7;
}

void OUTLINED_FUNCTION_17()
{
  *(void *)(v0 - 280) = v1;
  *(void *)(v0 - 272) = v2;
}

id OUTLINED_FUNCTION_20()
{
  return [v0 (SEL)(v1 + 1944)];
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_1BD60A7D0();
}

id OUTLINED_FUNCTION_25(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v4, v5, v6, v7);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_1BD60A7D0();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_37()
{
}

void OUTLINED_FUNCTION_38(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_39()
{
}

uint64_t OUTLINED_FUNCTION_41()
{
  return 96;
}

uint64_t MultiTouchInteractionManager.__allocating_init(interactor:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  MultiTouchInteractionManager.init(interactor:)(a1);
  return v2;
}

uint64_t MultiTouchInteractionManager.register(model:on:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_5();
  uint64_t v7 = v6;
  uint64_t v8 = v3[10];
  v31[0] = v3[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_1BD60A7D0();
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v31 - v14;
  uint64_t v16 = v3[17];
  uint64_t v17 = *(void **)(v2 + v16);
  if (v17) {
    objc_msgSend(v17, sel_removeGestureRecognizer_, *(void *)(v2 + *(void *)(v7 + 120)));
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v15, a1, AssociatedTypeWitness);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, AssociatedTypeWitness);
  OUTLINED_FUNCTION_2_4();
  uint64_t v19 = v2 + *(void *)(v18 + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 40))(v19, v15, v10);
  swift_endAccess();
  uint64_t v20 = *(void **)(v2 + v16);
  *(void *)(v2 + v16) = a2;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend(a2, sel_addGestureRecognizer_, *(void *)(v2 + *(void *)(v21 + 120)));
  OUTLINED_FUNCTION_2_4();
  uint64_t v23 = (void *)(v2 + *(void *)(v22 + 104));
  uint64_t v24 = OUTLINED_FUNCTION_11();
  v31[6] = *v23;
  MEMORY[0x1F4188790](v24);
  uint64_t v25 = v31[0];
  v31[-4] = v8;
  v31[-3] = v25;
  v31[-2] = a1;
  swift_getAssociatedConformanceWitness();
  uint64_t v26 = swift_getAssociatedTypeWitness();
  uint64_t v27 = OUTLINED_FUNCTION_3_4();
  uint64_t v28 = OUTLINED_FUNCTION_3_4();
  uint64_t v29 = OUTLINED_FUNCTION_3_4();
  swift_bridgeObjectRetain();
  v31[1] = v26;
  void v31[2] = v27;
  v31[3] = v28;
  v31[4] = v29;
  type metadata accessor for InteractionCursor();
  type metadata accessor for InteractionHandlerWrapper();
  sub_1BD60A610();
  swift_getWitnessTable();
  sub_1BD60A580();
  return swift_bridgeObjectRelease();
}

uint64_t MultiTouchInteractionManager.add<A>(interactionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)v3 + 88);
  uint64_t v6 = *(void *)(*(void *)v3 + 80);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_1();
  type metadata accessor for InteractionCursor();
  type metadata accessor for InteractionHandlerWrapper();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = a2;
  v7[4] = v5;
  v7[5] = a3;
  v7[6] = a1;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = a2;
  v8[4] = v5;
  v8[5] = a3;
  v8[6] = a1;
  sub_1BD5FDAB0((uint64_t)sub_1BD5E7070, (uint64_t)v7, (uint64_t)sub_1BD5E70A8, (uint64_t)v8);
  swift_beginAccess();
  sub_1BD60A610();
  swift_unknownObjectRetain_n();
  swift_retain();
  sub_1BD60A600();
  swift_endAccess();
  return swift_release();
}

uint64_t MultiTouchInteractionManager.init(interactor:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 104);
  uint64_t v5 = *(void *)(*(void *)v1 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v20 = OUTLINED_FUNCTION_4_3();
  uint64_t v21 = OUTLINED_FUNCTION_4_3();
  uint64_t v22 = OUTLINED_FUNCTION_4_3();
  type metadata accessor for InteractionCursor();
  type metadata accessor for InteractionHandlerWrapper();
  *(void *)(v1 + v4) = sub_1BD60A5D0();
  OUTLINED_FUNCTION_6_1();
  *(void *)(v1 + *(void *)(v7 + 112)) = 0;
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = *(void *)(v8 + 120);
  LOBYTE(v19) = 0;
  id v10 = objc_allocWithZone((Class)type metadata accessor for TapDragGestureRecognizer());
  *(void *)(v1 + v9) = sub_1BD5F93D0((char *)&v19);
  OUTLINED_FUNCTION_6_1();
  uint64_t v12 = *(void *)(v11 + 128);
  id v13 = objc_allocWithZone(MEMORY[0x1E4FB1968]);
  *(void *)(v2 + v12) = objc_msgSend(v13, sel_init, v19, v20, v21, v22);
  OUTLINED_FUNCTION_6_1();
  *(void *)(v2 + *(void *)(v14 + 136)) = 0;
  OUTLINED_FUNCTION_6_1();
  __swift_storeEnumTagSinglePayload(v2 + *(void *)(v15 + 144), 1, 1, AssociatedTypeWitness);
  OUTLINED_FUNCTION_6_1();
  uint64_t v17 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v2 + *(void *)(v16 + 96), a1, v5);
  objc_msgSend(*(id *)(v2 + *(void *)(*(void *)v2 + 120)), sel_addTarget_action_, v2, sel_handleGestureWithGesture_);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a1, v5);
  return v2;
}

void sub_1BD5E6268(void *a1)
{
  uint64_t v3 = v1;
  id v44 = a1;
  OUTLINED_FUNCTION_1_5();
  uint64_t v5 = v4;
  uint64_t v6 = v2[10];
  uint64_t v43 = v2[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = (void *)sub_1BD60A7D0();
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)v42 - v12;
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)v42 - v17;
  uint64_t v19 = *(void **)((char *)v3 + v2[17]);
  if (v19)
  {
    uint64_t v20 = (char *)v3 + *(void *)(v5 + 144);
    OUTLINED_FUNCTION_11();
    (*(void (**)(char *, char *, void *))(v10 + 16))(v13, v20, v8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, void *))(v10 + 8))(v13, v8);
      return;
    }
    uint64_t v21 = v15;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, AssociatedTypeWitness);
    id v22 = v19;
    uint64_t v23 = (char *)objc_msgSend(v44, sel_state);
    if ((unint64_t)(v23 - 3) < 2)
    {
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_8_1(*(void *)(v35 + 112));
      swift_beginAccess();
      if (!*v8)
      {
        uint64_t v40 = OUTLINED_FUNCTION_7_1();
        v41(v40);
        swift_endAccess();
        goto LABEL_17;
      }
      swift_endAccess();
      swift_retain();
      sub_1BD6026E0();
    }
    else
    {
      if (v23 != (char *)2)
      {
        if (v23 == (char *)1)
        {
          swift_getAssociatedConformanceWitness();
          uint64_t v24 = swift_getAssociatedTypeWitness();
          uint64_t v25 = OUTLINED_FUNCTION_9_1();
          uint64_t v26 = OUTLINED_FUNCTION_9_1();
          uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
          uint64_t v46 = v24;
          uint64_t v47 = v25;
          uint64_t v48 = v26;
          uint64_t v49 = AssociatedConformanceWitness;
          v42[1] = type metadata accessor for InteractionCursor();
          uint64_t v28 = (void *)type metadata accessor for HighlightInteraction();
          uint64_t v29 = (void *)sub_1BD6026B0();
          OUTLINED_FUNCTION_10_0();
          OUTLINED_FUNCTION_8_1(*(void *)(v30 + 112));
          swift_beginAccess();
          *uint64_t v28 = v29;
          swift_retain();
          swift_release();
          OUTLINED_FUNCTION_10_0();
          uint64_t v32 = (uint64_t *)((char *)v3 + *(void *)(v31 + 104));
          uint64_t v33 = OUTLINED_FUNCTION_11();
          v42[0] = v42;
          uint64_t v45 = *v32;
          MEMORY[0x1F4188790](v33);
          uint64_t v34 = v43;
          v42[-4] = v6;
          v42[-3] = v34;
          v42[-2] = v29;
          type metadata accessor for InteractionHandlerWrapper();
          sub_1BD60A610();
          swift_bridgeObjectRetain();
          swift_getWitnessTable();
          sub_1BD60A580();
          swift_bridgeObjectRelease();
          sub_1BD5E6734(v29, (uint64_t)v44, v22, v3, (uint64_t)v18);
          swift_release();

LABEL_13:
          (*(void (**)(char *, uint64_t))(v21 + 8))(v18, AssociatedTypeWitness);
          return;
        }
        goto LABEL_15;
      }
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_8_1(*(void *)(v36 + 112));
      OUTLINED_FUNCTION_11();
      if (!*v8)
      {
LABEL_15:
        uint64_t v38 = OUTLINED_FUNCTION_7_1();
        v39(v38);
LABEL_17:

        return;
      }
      id v37 = (void *)swift_retain();
      sub_1BD5E6734(v37, (uint64_t)v44, v22, v3, (uint64_t)v18);
    }
    swift_release();

    goto LABEL_13;
  }
}

uint64_t sub_1BD5E6734(void *a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v65 = a5;
  uint64_t v7 = *a1;
  uint64_t v8 = *a4;
  uint64_t v60 = a1;
  uint64_t v9 = *(void *)(v7 + 80);
  uint64_t v10 = type metadata accessor for HighlightInteraction.InteractionType();
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v59 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v57 = (char *)&v56 - v11;
  uint64_t v12 = sub_1BD60A7D0();
  uint64_t v62 = *(void *)(v12 - 8);
  uint64_t v63 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v56 - v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v56 - v19;
  uint64_t v64 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v56 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  id v61 = (char *)&v56 - v24;
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v56 - v26;
  uint64_t v28 = a2 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations;
  uint64_t result = swift_beginAccess();
  int v30 = *(unsigned __int8 *)(v28 + 32);
  if (v30 != 255)
  {
    double v32 = *(double *)(v28 + 16);
    double v31 = *(double *)(v28 + 24);
    double v33 = *(double *)(v28 + 8);
    if (*(double *)v28 > 0.0) {
      double v34 = *(double *)v28;
    }
    else {
      double v34 = 0.0;
    }
    objc_msgSend(a3, sel_bounds);
    double Width = CGRectGetWidth(v66);
    if (Width < v34) {
      double v34 = Width;
    }
    if (v30)
    {
      objc_msgSend(a3, sel_bounds);
      double v36 = CGRectGetWidth(v67);
      objc_msgSend(a3, sel_bounds);
      uint64_t v38 = *(void *)(v8 + 80);
      uint64_t v37 = *(void *)(v8 + 88);
      uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t, double, double))(v37 + 24);
      v39(v65, v38, v37, v34, v33);
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v9) == 1)
      {
        return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v17, v63);
      }
      else
      {
        double v43 = 0.0;
        if (v32 > 0.0) {
          double v43 = v32;
        }
        if (v36 >= v43) {
          double v44 = v43;
        }
        else {
          double v44 = v36;
        }
        uint64_t v45 = v17;
        uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
        v46(v61, v45, v9);
        objc_msgSend(a3, sel_bounds);
        v39(v65, v38, v37, v44, v31);
        if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v9) == 1)
        {
          (*(void (**)(char *, uint64_t))(v64 + 8))(v61, v9);
          return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v14, v63);
        }
        else
        {
          uint64_t v47 = v56;
          v46(v56, v14, v9);
          TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
          uint64_t v49 = v57;
          uint64_t v50 = &v57[*(int *)(TupleTypeMetadata2 + 48)];
          uint64_t v51 = v64;
          uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
          uint64_t v53 = v61;
          v52(v57, v61, v9);
          v52(v50, v47, v9);
          uint64_t v54 = v59;
          swift_storeEnumTagMultiPayload();
          sub_1BD6025D0();
          (*(void (**)(char *, uint64_t))(v58 + 8))(v49, v54);
          unint64_t v55 = *(void (**)(char *, uint64_t))(v51 + 8);
          v55(v47, v9);
          return ((uint64_t (*)(char *, uint64_t))v55)(v53, v9);
        }
      }
    }
    else
    {
      objc_msgSend(a3, sel_bounds);
      (*(void (**)(uint64_t, void, double, double))(*(void *)(v8 + 88) + 24))(v65, *(void *)(v8 + 80), v34, v33);
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v9) == 1)
      {
        return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v20, v63);
      }
      else
      {
        uint64_t v40 = v64;
        (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v27, v20, v9);
        uint64_t v41 = v57;
        (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v57, v27, v9);
        uint64_t v42 = v59;
        swift_storeEnumTagMultiPayload();
        sub_1BD6025D0();
        (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v42);
        return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v27, v9);
      }
    }
  }
  return result;
}

uint64_t sub_1BD5E6D84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t *))(*(void *)a1 + 32);
  uint64_t v4 = a2;
  swift_retain();
  v2(&v4);
  return swift_release();
}

uint64_t sub_1BD5E6DDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  swift_retain();
  sub_1BD5E6268(v3);

  return swift_release();
}

uint64_t MultiTouchInteractionManager.deinit()
{
  (*(void (**)(uint64_t, void))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96), *(void *)(*(void *)v0 + 80));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  swift_release();
  OUTLINED_FUNCTION_2_4();

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_4();

  OUTLINED_FUNCTION_2_4();
  uint64_t v5 = v0 + *(void *)(v4 + 144);
  swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_1BD60A7D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t MultiTouchInteractionManager.__deallocating_deinit()
{
  MultiTouchInteractionManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BD5E7004()
{
  return sub_1BD5FDA88();
}

uint64_t sub_1BD5E7038()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BD5E7070(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 + 40) + 40))(a1, *(void *)(v1 + 24));
}

uint64_t sub_1BD5E70A8(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v5 = *a1;
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 48))(&v5, v2);
}

uint64_t sub_1BD5E70F4(uint64_t a1, void *a2)
{
  return MultiTouchInteractionManager.register(model:on:)(a1, a2);
}

uint64_t sub_1BD5E7118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MultiTouchInteractionManager.add<A>(interactionHandler:)(a1, a2, a3);
}

uint64_t sub_1BD5E713C()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    uint64_t v0 = sub_1BD60A7D0();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return v0;
}

uint64_t type metadata accessor for MultiTouchInteractionManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for MultiTouchInteractionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MultiTouchInteractionManager);
}

uint64_t dispatch thunk of MultiTouchInteractionManager.__allocating_init(interactor:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1BD5E72A8(uint64_t a1)
{
  return sub_1BD5E6D84(a1, *(void *)(v1 + 32));
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1BD5E734C(uint64_t a1, uint64_t a2, long long *a3, double a4, double a5)
{
  uint64_t v6 = v5;
  long long v11 = a3[1];
  long long v31 = *a3;
  v32[0] = v11;
  *(_OWORD *)((char *)v32 + 9) = *(long long *)((char *)a3 + 25);
  if (sub_1BD5D3FDC()) {
    return MEMORY[0x1E4FBC860];
  }
  sub_1BD5D7EB4();
  double v14 = *(double *)(a2 + *(int *)(v13 + 52) + 8) - *(double *)(a2 + *(int *)(v13 + 52));
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v14 > 0.0 && a5 > 0.0 && a4 > 0.0)
  {
    uint64_t v30 = MEMORY[0x1E4FBC860];
    uint64_t v27 = *(void *)(a1 + 16);
    if (v27)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = 0;
      do
      {
        uint64_t v16 = (uint64_t *)(a1 + 32 + 24 * v15);
        uint64_t v17 = *v16;
        uint64_t v18 = v16[1];
        uint64_t v19 = v16[2];
        id v20 = objc_allocWithZone(MEMORY[0x1E4FB14C0]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        id v21 = objc_msgSend(v20, sel_init);
        id v29 = v21;
        uint64_t v22 = *(void *)(v19 + 16);
        if (v22)
        {
          swift_bridgeObjectRetain();
          uint64_t v23 = (uint64_t *)(v19 + 48);
          do
          {
            uint64_t v24 = *v23;
            uint64_t v25 = *(v23 - 1);
            v28[0] = *(v23 - 2);
            v28[1] = v25;
            v28[2] = v24;
            swift_bridgeObjectRetain();
            sub_1BD5E7584(&v29, v28, v6, v17, v18, v19, (uint64_t)&v31, a4, a5);
            swift_bridgeObjectRelease();
            v23 += 3;
            --v22;
          }
          while (v22);
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        id v26 = v21;
        MEMORY[0x1C187DDC0]();
        if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1BD60A5C0();
        }
        ++v15;
        sub_1BD60A5F0();
        sub_1BD60A5B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v15 != v27);
      swift_bridgeObjectRelease();
      return v30;
    }
  }
  return result;
}

void sub_1BD5E7584(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  uint64_t v12 = a2[1];
  uint64_t v13 = a2[2];
  uint64_t v14 = *(void *)(a3 + 16);
  double v49 = *(double *)a2;
  double v50 = *(double *)&v12;
  double v51 = *(double *)&v13;
  v55[0] = a4;
  v55[1] = a5;
  v55[2] = a6;
  *(double *)&uint64_t v15 = COERCE_DOUBLE(ColumnChartCoordinateProvider.location(for:in:)((uint64_t *)&v49, v55));
  if ((v17 & 1) == 0)
  {
    double v18 = *(double *)&v15;
    double v19 = v16;
    uint64_t v20 = v14 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
    swift_beginAccess();
    if ((*(unsigned char *)(v20 + 32) & 1) == 0)
    {
      double v21 = *(double *)v20;
      double v22 = a9 - v19;
      if ((~*(void *)&v18 & 0x7FF0000000000000) == 0) {
        goto LABEL_20;
      }
      BOOL v23 = v18 == 1.79769313e308 || (~*(void *)&v19 & 0x7FF0000000000000) == 0;
      if (v23 || v19 == 1.79769313e308) {
        goto LABEL_20;
      }
      v56.origin.x = v18;
      v56.origin.y = v19;
      v56.size.width = *(CGFloat *)v20;
      v56.size.height = v22;
      double Width = CGRectGetWidth(v56);
      BOOL v26 = Width == 1.79769313e308 || (*(void *)&Width & 0x7FF0000000000000) == 0x7FF0000000000000;
      if (v26
        || ((v57.origin.x = v18,
             v57.origin.y = v19,
             v57.size.width = v21,
             v57.size.height = v22,
             double Height = CGRectGetHeight(v57),
             Height != 1.79769313e308)
          ? (BOOL v28 = (*(void *)&Height & 0x7FF0000000000000) == 0x7FF0000000000000)
          : (BOOL v28 = 1),
            v28))
      {
LABEL_20:
        sub_1BD60A710();
        sub_1BD5E7A48();
        uint64_t v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_1BD60C3A0;
        uint64_t v53 = 0;
        unint64_t v54 = 0xE000000000000000;
        double v49 = v18;
        double v50 = v19;
        double v51 = v21;
        double v52 = v22;
        type metadata accessor for CGRect(0);
        sub_1BD60A9B0();
        uint64_t v30 = v53;
        unint64_t v31 = v54;
        *(void *)(v29 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v32 = sub_1BD5D9B68();
        *(void *)(v29 + 64) = v32;
        *(void *)(v29 + 32) = v30;
        *(void *)(v29 + 40) = v31;
        sub_1BD5D4860();
        double v33 = (void *)sub_1BD60A7C0();
        sub_1BD60A470();
        swift_bridgeObjectRelease();

        sub_1BD60A720();
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_1BD60C3A0;
        uint64_t v53 = 0;
        unint64_t v54 = 0xE000000000000000;
        double v49 = v18;
        double v50 = v19;
        double v51 = v21;
        double v52 = v22;
        sub_1BD60A9B0();
        uint64_t v35 = v53;
        unint64_t v36 = v54;
        *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v34 + 64) = v32;
        *(void *)(v34 + 32) = v35;
        *(void *)(v34 + 40) = v36;
        id v37 = (id)sub_1BD60A7C0();
        sub_1BD60A470();
      }
      else
      {
        double v38 = v21 * *(double *)(a7 + 32);
        if (v38 != 1.79769313e308
          && (COERCE_UNSIGNED_INT64(v21 * *(double *)(a7 + 32)) & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          id v37 = objc_msgSend(self, sel_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_, *(void *)(a7 + 24), v18, v19, v21, v22, v38, v38);
          objc_msgSend(*a1, sel_appendPath_, v37);
          goto LABEL_22;
        }
        sub_1BD60A710();
        sub_1BD5E7A48();
        uint64_t v40 = swift_allocObject();
        *(_OWORD *)(v40 + 16) = xmmword_1BD60C3A0;
        uint64_t v41 = sub_1BD60A650();
        uint64_t v43 = v42;
        *(void *)(v40 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v44 = sub_1BD5D9B68();
        *(void *)(v40 + 64) = v44;
        *(void *)(v40 + 32) = v41;
        *(void *)(v40 + 40) = v43;
        sub_1BD5D4860();
        uint64_t v45 = (void *)sub_1BD60A7C0();
        sub_1BD60A470();
        swift_bridgeObjectRelease();

        sub_1BD60A720();
        uint64_t v46 = swift_allocObject();
        *(_OWORD *)(v46 + 16) = xmmword_1BD60C3A0;
        uint64_t v47 = sub_1BD60A650();
        *(void *)(v46 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v46 + 64) = v44;
        *(void *)(v46 + 32) = v47;
        *(void *)(v46 + 40) = v48;
        id v37 = (id)sub_1BD60A7C0();
        sub_1BD60A470();
      }
      swift_bridgeObjectRelease();
LABEL_22:
    }
  }
}

uint64_t type metadata accessor for ColumnPathGenerator()
{
  return self;
}

void sub_1BD5E7A48()
{
  if (!qword_1E9FC6890)
  {
    sub_1BD5D9B10();
    unint64_t v0 = sub_1BD60AAD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9FC6890);
    }
  }
}

TeaCharts::GridLabelFormatterOptions __swiftcall GridLabelFormatterOptions.init(traitCollection:)(TeaCharts::GridLabelFormatterOptions traitCollection)
{
  v1->traitCollection.super.isa = traitCollection.traitCollection.super.isa;
  return traitCollection;
}

uint64_t GridLabelFormatter.format(value:options:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = &v21[-v8];
  uint64_t v11 = *v10;
  swift_beginAccess();
  sub_1BD5E7DB4(v1 + 16, (uint64_t)&v22, &qword_1EBA197E8, &qword_1EBA197E0);
  if (!v23)
  {
    sub_1BD5E7E04((uint64_t)&v22, &qword_1EBA197E8, &qword_1EBA197E0);
    goto LABEL_6;
  }
  sub_1BD5DBA08(&v22, (uint64_t)v24);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v9, a1, v3);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
LABEL_6:
    swift_beginAccess();
    sub_1BD5E7DB4(v1 + 56, (uint64_t)&v22, &qword_1EBA197D8, &qword_1EBA197D0);
    if (v23)
    {
      sub_1BD5DBA08(&v22, (uint64_t)v24);
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
      if (swift_dynamicCast())
      {
        double v17 = *(double *)&v22;
        uint64_t v18 = v25;
        uint64_t v19 = v26;
        __swift_project_boxed_opaque_existential_1(v24, v25);
        *(void *)&long long v22 = v11;
        uint64_t v16 = (*(uint64_t (**)(long long *, uint64_t, uint64_t, double))(v19 + 8))(&v22, v18, v19, v17);
        goto LABEL_9;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    }
    else
    {
      sub_1BD5E7E04((uint64_t)&v22, &qword_1EBA197D8, &qword_1EBA197D0);
    }
    return 0;
  }
  uint64_t v13 = *((void *)&v22 + 1);
  uint64_t v12 = v22;
  uint64_t v14 = v25;
  uint64_t v15 = v26;
  __swift_project_boxed_opaque_existential_1(v24, v25);
  *(void *)&long long v22 = v11;
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t, uint64_t))(v15 + 8))(v12, v13, &v22, v14, v15);
  swift_bridgeObjectRelease();
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v16;
}

uint64_t sub_1BD5E7DB4(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  OUTLINED_FUNCTION_0_8(a1, a2, a3, a4);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v4, v5);
  return v4;
}

uint64_t sub_1BD5E7E04(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1BD5DF134(0, a2, a3);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v4 + 8))(a1);
  return a1;
}

id GridLabelFormatterOptions.traitCollection.getter()
{
  return *v0;
}

double GridLabelFormatter.__allocating_init()()
{
  unint64_t v0 = (_OWORD *)OUTLINED_FUNCTION_1_6();
  return OUTLINED_FUNCTION_3_5(v0);
}

double GridLabelFormatter.init()()
{
  double result = 0.0;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t GridLabelFormatter.deinit()
{
  sub_1BD5E7E04(v0 + 16, &qword_1EBA197E8, &qword_1EBA197E0);
  sub_1BD5E7E04(v0 + 56, &qword_1EBA197D8, &qword_1EBA197D0);
  return v0;
}

uint64_t GridLabelFormatter.__deallocating_deinit()
{
  GridLabelFormatter.deinit();

  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t sub_1BD5E7F20(uint64_t a1)
{
  return GridLabelFormatter.format(value:options:)(a1);
}

_OWORD *GridLabelFormatter<A>.init(formatter:)(long long *a1)
{
  unint64_t v2 = (_OWORD *)OUTLINED_FUNCTION_1_6();
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[1] = 0u;
  sub_1BD5DBA08(a1, (uint64_t)v4);
  OUTLINED_FUNCTION_4_4();
  sub_1BD5E8050((uint64_t)v4, (uint64_t)(v2 + 1), &qword_1EBA197E8, &qword_1EBA197E0);
  swift_endAccess();
  return v2;
}

{
  _OWORD *v2;
  unsigned char v4[40];

  unint64_t v2 = (_OWORD *)OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5(v2);
  sub_1BD5DBA08(a1, (uint64_t)v4);
  OUTLINED_FUNCTION_4_4();
  sub_1BD5E8050((uint64_t)v4, (uint64_t)v2 + 56, &qword_1EBA197D8, &qword_1EBA197D0);
  swift_endAccess();
  return v2;
}

uint64_t sub_1BD5E8050(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  OUTLINED_FUNCTION_0_8(a1, a2, a3, a4);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v4, v5);
  return v4;
}

ValueMetadata *type metadata accessor for GridLabelFormatterOptions()
{
  return &type metadata for GridLabelFormatterOptions;
}

uint64_t dispatch thunk of GridLabelFormatterType.format(value:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of StringLabelFormatterType.format(value:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of ValueLabelFormatterType.format(value:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_1BD5E80EC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GridLabelFormatter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for GridLabelFormatter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GridLabelFormatter);
}

uint64_t dispatch thunk of GridLabelFormatter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_beginAccess();
}

uint64_t GridStyle.init(stroke:insetBehavior:labelPadding:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v7 = *(void *)(result + 8);
  uint64_t v8 = *(void *)(result + 16);
  char v9 = *(unsigned char *)(result + 24);
  char v10 = *a2;
  *(void *)a3 = *(void *)result;
  *(void *)(a3 + 8) = v7;
  *(void *)(a3 + 16) = v8;
  *(unsigned char *)(a3 + 24) = v9;
  *(unsigned char *)(a3 + 25) = v10;
  *(double *)(a3 + 32) = a4;
  *(double *)(a3 + 40) = a5;
  *(double *)(a3 + 48) = a6;
  *(double *)(a3 + 56) = a7;
  return result;
}

BOOL static GridInsetBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t GridInsetBehavior.hash(into:)()
{
  return sub_1BD60AB80();
}

uint64_t GridInsetBehavior.hashValue.getter()
{
  return sub_1BD60ABA0();
}

unint64_t sub_1BD5E8264()
{
  unint64_t result = qword_1E9FC6958;
  if (!qword_1E9FC6958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6958);
  }
  return result;
}

void destroy for Stroke(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for GridStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for GridStyle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  long long v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for GridStyle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for GridStyle(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for GridStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridStyle()
{
  return &type metadata for GridStyle;
}

unsigned char *storeEnumTagSinglePayload for GridInsetBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD5E85A8);
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

ValueMetadata *type metadata accessor for GridInsetBehavior()
{
  return &type metadata for GridInsetBehavior;
}

uint64_t dispatch thunk of ValueAxisCalculationModelType.relativeLocation(for:in:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ValueAxisCalculationModelType.value(for:in:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static Orientation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Orientation.hash(into:)()
{
  return sub_1BD60AB80();
}

uint64_t Orientation.hashValue.getter()
{
  return sub_1BD60ABA0();
}

unint64_t sub_1BD5E86A4()
{
  unint64_t result = qword_1E9FC6960;
  if (!qword_1E9FC6960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6960);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Orientation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD5E87BCLL);
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

ValueMetadata *type metadata accessor for Orientation()
{
  return &type metadata for Orientation;
}

uint64_t GridViewProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t GridViewProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t GridViewProvider.view(for:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 32 + 80 * v3 + 8);
      uint64_t v6 = *(void *)(v5 + 16);
      if (v6) {
        break;
      }
      uint64_t v7 = 0;
LABEL_9:
      BOOL v11 = __OFADD__(v4, v7);
      v4 += v7;
      if (v11) {
        goto LABEL_25;
      }
      if (++v3 == v2) {
        goto LABEL_13;
      }
    }
    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t *)(v5 + 40);
    while (1)
    {
      uint64_t v9 = *v8;
      v8 += 2;
      uint64_t v10 = v9 != 0;
      BOOL v11 = __OFADD__(v7, v10);
      v7 += v10;
      if (v11) {
        break;
      }
      if (!--v6) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t result = sub_1BD60AA10();
    uint64_t v16 = result;
    if (!result) {
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  uint64_t v4 = 0;
LABEL_13:
  id v12 = objc_allocWithZone((Class)type metadata accessor for GridView());
  GridView.init(numberOfGrids:numberOfLabels:)(v2, v4);
  uint64_t v14 = v13;
  uint64_t v34 = (void *)(v35 + 56);
  __swift_project_boxed_opaque_existential_1((void *)(v35 + 56), *(void *)(v35 + 80));
  sub_1BD607184(v14);
  uint64_t v15 = &v14[OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers];
  swift_beginAccess();
  uint64_t v33 = *(void *)v15;
  unint64_t v32 = v14;
  if (*(void *)v15 >> 62) {
    goto LABEL_26;
  }
  uint64_t v16 = *(void *)((*(void *)v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v16)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return (uint64_t)v32;
  }
LABEL_15:
  if (v16 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (!v2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v16 <= v2)
  {
    uint64_t v18 = 0;
    uint64_t v19 = (_OWORD *)(a1 + 96);
    do
    {
      if ((v33 & 0xC000000000000001) != 0) {
        id v20 = (id)MEMORY[0x1C187E170](v18, v33);
      }
      else {
        id v20 = *(id *)(v33 + 32 + 8 * v18);
      }
      double v21 = v20;
      ++v18;
      char v22 = *((unsigned char *)v19 - 64);
      double v23 = *((double *)v19 - 7);
      double v24 = *((double *)v19 - 6);
      double v25 = *((double *)v19 - 5);
      uint64_t v26 = (void *)*((void *)v19 - 4);
      char v27 = *((unsigned char *)v19 - 24);
      char v28 = *((unsigned char *)v19 - 23);
      long long v29 = *(v19 - 1);
      long long v30 = *v19;
      v19 += 5;
      long long v36 = v29;
      __swift_project_boxed_opaque_existential_1(v34, *(void *)(v35 + 80));
      LOBYTE(v37[0]) = v22;
      v37[1] = v23;
      v37[2] = v24;
      v37[3] = v25;
      *(void *)&v37[4] = v26;
      char v38 = v27;
      char v39 = v28;
      long long v40 = v36;
      long long v41 = v30;
      swift_bridgeObjectRetain();
      id v31 = v26;
      swift_bridgeObjectRetain();
      sub_1BD6071F8(v21, v37);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v16 != v18);
    goto LABEL_23;
  }
LABEL_30:
  __break(1u);
  return result;
}

void GridViewProvider.present(models:attributes:on:)(int a1, uint64_t a2, void *a3)
{
  CGFloat v6 = *(double *)a2;
  CGFloat v7 = *(double *)(a2 + 8);
  CGFloat v8 = *(double *)(a2 + 16);
  CGFloat v9 = *(double *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 48);
  uint64_t v13 = *(void *)(a2 + 56);
  long long v14 = *(_OWORD *)(a2 + 64);
  v17.origin.x = *(CGFloat *)a2;
  v17.origin.y = v7;
  v17.size.width = v8;
  v17.size.height = v9;
  if (!CGRectIsEmpty(v17))
  {
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
    *(CGFloat *)__src = v6;
    *(CGFloat *)&__src[1] = v7;
    *(CGFloat *)&__src[2] = v8;
    *(CGFloat *)&__src[3] = v9;
    __src[4] = v10;
    __src[5] = v11;
    __src[6] = v12;
    __src[7] = v13;
    long long v16 = v14;
    sub_1BD5EE398(a1, a3, __src);
  }
}

uint64_t sub_1BD5E8BA8(uint64_t a1)
{
  return GridViewProvider.view(for:)(a1);
}

void sub_1BD5E8BCC(int a1, uint64_t a2, void *a3)
{
}

uint64_t dispatch thunk of GridViewProviderType.view(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of GridViewProviderType.present(models:attributes:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for GridViewProvider()
{
  return self;
}

uint64_t method lookup function for GridViewProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GridViewProvider);
}

double DataPoint.x.getter()
{
  return *(double *)v0;
}

double DataPoint.y.getter()
{
  return *(double *)(v0 + 8);
}

TeaCharts::DataPoint __swiftcall DataPoint.init(x:y:)(Swift::Double x, Swift::Double y)
{
  *uint64_t v2 = x;
  v2[1] = y;
  result.y = y;
  result.x = x;
  return result;
}

BOOL static DataPoint.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

ValueMetadata *type metadata accessor for DataPoint()
{
  return &type metadata for DataPoint;
}

uint64_t sub_1BD5E8CAC()
{
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for GridViewProvider();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for CategoryAxisGridViewModelGenerator();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for ValueAxisGridViewModelGenerator();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1B9C8);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for GridViewRenderer();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for GridViewStyler();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B3D0);
  OUTLINED_FUNCTION_0_3();
  swift_release();

  return swift_release();
}

uint64_t sub_1BD5E8E6C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v2 = type metadata accessor for GridViewRenderer();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    v23[3] = v2;
    v23[4] = &off_1F17FEC38;
    v23[0] = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v4 = type metadata accessor for GridViewStyler();
    uint64_t result = sub_1BD60A1F0();
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v2);
      uint64_t v17 = (uint64_t)&v17;
      uint64_t v7 = *(void *)(v2 - 8);
      uint64_t v8 = *(void *)(v7 + 64);
      double v9 = MEMORY[0x1F4188790](v6);
      unint64_t v10 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v11 = *(void (**)(char *, double))(v7 + 16);
      v11((char *)&v17 - v10, v9);
      uint64_t v12 = *(uint64_t *)((char *)&v17 - v10);
      v22[3] = v2;
      v22[4] = &off_1F17FEC38;
      v22[0] = v12;
      type metadata accessor for GridViewProvider();
      uint64_t v13 = swift_allocObject();
      uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v2);
      double v15 = MEMORY[0x1F4188790](v14);
      v11((char *)&v17 - v10, v15);
      uint64_t v16 = *(uint64_t *)((char *)&v17 - v10);
      v21[3] = v2;
      v21[4] = &off_1F17FEC38;
      v21[0] = v16;
      sub_1BD5D5D9C((uint64_t)v21, v13 + 16);
      uint64_t v19 = v4;
      id v20 = &off_1F17FFE90;
      *(void *)&long long v18 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      sub_1BD5DBA08(&v18, v13 + 56);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      return v13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5E9098(void *a1)
{
  return sub_1BD5E9110(a1, &qword_1EBA1BA78, (uint64_t)&protocol descriptor for CategoryCoordinateCalculatorType, (void (*)(void))type metadata accessor for CategoryAxisGridViewModelGenerator, (void (*)(unsigned char *, uint64_t))sub_1BD5DBA08);
}

uint64_t sub_1BD5E90D4(void *a1)
{
  return sub_1BD5E9110(a1, &qword_1EBA1B9C0, (uint64_t)&protocol descriptor for ValueCoordinateCalculatorType, (void (*)(void))type metadata accessor for ValueAxisGridViewModelGenerator, (void (*)(unsigned char *, uint64_t))sub_1BD5DBA08);
}

uint64_t sub_1BD5E9110(void *a1, unint64_t *a2, uint64_t a3, void (*a4)(void), void (*a5)(unsigned char *, uint64_t))
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, a2);
  uint64_t result = sub_1BD60A200();
  if (v11)
  {
    a4(0);
    uint64_t v9 = swift_allocObject();
    a5(v10, v9 + 16);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5E91D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B3D0);
  uint64_t result = sub_1BD60A200();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for GridLayoutAttributesFactory();
    uint64_t v5 = swift_allocObject();
    uint64_t result = sub_1BD5DBA08(&v6, v5 + 16);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_1F17FDEB8;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5E9280(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1AA08);
  sub_1BD60A1E0();
  if (v6)
  {
    sub_1BD5DBA08(&v5, (uint64_t)&v7);
  }
  else
  {
    uint64_t v1 = sub_1BD60A220();
    swift_allocObject();
    uint64_t v2 = sub_1BD60A210();
    uint64_t v8 = v1;
    uint64_t v9 = MEMORY[0x1E4FAA9E0];
    *(void *)&long long v7 = v2;
    sub_1BD5E9438((uint64_t)&v5);
  }
  type metadata accessor for GridViewRenderer();
  uint64_t v3 = swift_allocObject();
  sub_1BD5DBA08(&v7, v3 + 16);
  return v3;
}

uint64_t sub_1BD5E9380()
{
  type metadata accessor for GridViewStyler();

  return swift_allocObject();
}

uint64_t sub_1BD5E93B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for GridPathGenerator();
  uint64_t result = swift_allocObject();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for GridPathGenerator;
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for GridAssembly()
{
  return self;
}

uint64_t sub_1BD5E9420()
{
  return sub_1BD5E8CAC();
}

uint64_t sub_1BD5E9438(uint64_t a1)
{
  sub_1BD5E9494();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BD5E9494()
{
  if (!qword_1EBA19BF0)
  {
    sub_1BD5DB530(255, &qword_1EBA1AA08);
    unint64_t v0 = sub_1BD60A7D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19BF0);
    }
  }
}

uint64_t sub_1BD5E94FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (double *)(a2 + 48);
    uint64_t v4 = (double *)(a1 + 48);
    do
    {
      double v5 = *v4;
      double v6 = *v3;
      if (*((void *)v4 - 2) == *((void *)v3 - 2) && *((void *)v4 - 1) == *((void *)v3 - 1))
      {
        if (v5 != v6) {
          return 0;
        }
      }
      else
      {
        char v8 = sub_1BD60AAF0();
        uint64_t result = 0;
        if ((v8 & 1) == 0 || v5 != v6) {
          return result;
        }
      }
      v3 += 3;
      v4 += 3;
      --v2;
    }
    while (v2);
  }
  return 1;
}

BOOL static SparklineViewRendererOptions.Method.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SparklineViewRendererOptions.Method.hash(into:)()
{
  return sub_1BD60AB80();
}

uint64_t SparklineViewRendererOptions.Method.hashValue.getter()
{
  return sub_1BD60ABA0();
}

void SparklineViewRendererOptions.method.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

TeaCharts::SparklineViewRendererOptions __swiftcall SparklineViewRendererOptions.init(method:)(TeaCharts::SparklineViewRendererOptions method)
{
  *uint64_t v1 = *(unsigned char *)method.method;
  return method;
}

unint64_t sub_1BD5E9660()
{
  unint64_t result = qword_1E9FC6968;
  if (!qword_1E9FC6968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6968);
  }
  return result;
}

ValueMetadata *type metadata accessor for SparklineViewRendererOptions()
{
  return &type metadata for SparklineViewRendererOptions;
}

unsigned char *_s9TeaCharts28SparklineViewRendererOptionsV6MethodOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD5E9790);
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

ValueMetadata *type metadata accessor for SparklineViewRendererOptions.Method()
{
  return &type metadata for SparklineViewRendererOptions.Method;
}

uint64_t dispatch thunk of SparklineViewRendererType.render(_:on:style:layoutAttributes:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_1BD5E97DC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  sub_1BD60AB90();
  sub_1BD60AB90();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1BD60A550();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1BD5EA6B0(a1, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_1BD60A550();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1BD5E98D4(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 != *(double *)a2 || *(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  BOOL v9 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
  if (v9 || (v10 = sub_1BD60AAF0(), uint64_t result = 0, (v10 & 1) != 0))
  {
    if ((sub_1BD5E94FC(v3, v7) & 1) == 0) {
      return 0;
    }
    if (v4 == v6 && v5 == v8)
    {
      return 1;
    }
    else
    {
      return sub_1BD60AAF0();
    }
  }
  return result;
}

uint64_t sub_1BD5E99B4()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 5);
  long long v5 = *v0;
  uint64_t v6 = v1;
  long long v7 = *(long long *)((char *)v0 + 24);
  uint64_t v8 = v2;
  long long v9 = v0[3];
  sub_1BD60AB70();
  sub_1BD5E97DC((uint64_t)v4);
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5E9A28()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 5);
  long long v5 = *v0;
  uint64_t v6 = v1;
  long long v7 = *(long long *)((char *)v0 + 24);
  uint64_t v8 = v2;
  long long v9 = v0[3];
  sub_1BD60AB70();
  sub_1BD5E97DC((uint64_t)v4);
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5E9A94(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1BD5EA424();
  swift_allocObject();
  *(void *)(v1 + 56) = sub_1BD60A370();
  sub_1BD5EA4AC();
  swift_allocObject();
  *(void *)(v1 + 64) = sub_1BD60A440();
  sub_1BD5D5D9C(a1, v1 + 16);
  id v4 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v2, sel_didReceiveMemoryWarning, *MEMORY[0x1E4FB2650], 0);

  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

void sub_1BD5E9B6C(uint64_t a1, char *a2, uint64_t *a3, uint64_t a4, unsigned __int8 *a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = *a3;
  uint64_t v9 = a3[1];
  uint64_t v11 = a3[2];
  uint64_t v13 = *(void *)(a4 + 16);
  uint64_t v12 = *(void *)(a4 + 24);
  int v30 = *a5;
  double v14 = OUTLINED_FUNCTION_0_10();
  objc_msgSend(v15, v16, v14);
  uint64_t v17 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SparklineModel() + 20));
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  uint64_t v20 = v17[2];
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  sub_1BD60A460();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (v31)
  {
    objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView], sel_setImage_, v31);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  v32.origin.x = OUTLINED_FUNCTION_0_10();
  CGRectGetWidth(v32);
  v33.origin.x = OUTLINED_FUNCTION_0_10();
  CGRectGetHeight(v33);
  id v21 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v21, sel_scale);

  __swift_project_boxed_opaque_existential_1((void *)(v6 + 16), *(void *)(v6 + 40));
  if (v30)
  {
    OUTLINED_FUNCTION_2_5();
    OUTLINED_FUNCTION_1_8();
    uint64_t v23 = v22();
    MEMORY[0x1F4188790](v23);
    sub_1BD5EA5A8();
    sub_1BD60A410();
    double v24 = (void *)sub_1BD60A1B0();
    double v25 = (void *)swift_allocObject();
    v25[2] = a2;
    v25[3] = v13;
    void v25[4] = v12;
    void v25[5] = v19;
    v25[6] = v18;
    v25[7] = v20;
    v25[8] = v10;
    v25[9] = v9;
    v25[10] = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v26 = a2;
    sub_1BD60A3D0();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_2_5();
    OUTLINED_FUNCTION_1_8();
    uint64_t v28 = v27();
    if (v28)
    {
      long long v29 = (void *)v28;
      objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView], sel_setImage_, v28);
      swift_retain();
      sub_1BD60A420();

      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      return;
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_1BD5E9F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_release();
}

uint64_t sub_1BD5EA034()
{
  swift_retain();
  sub_1BD60A430();

  return swift_release();
}

uint64_t sub_1BD5EA0B4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1BD5EA0E4()
{
  sub_1BD5EA0B4();

  return MEMORY[0x1F4186488](v0, 72, 7);
}

uint64_t type metadata accessor for SparklineViewRenderer()
{
  return self;
}

uint64_t destroy for SparklineViewRenderer.LRUCacheKey()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for SparklineViewRenderer.LRUCacheKey(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SparklineViewRenderer.LRUCacheKey(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SparklineViewRenderer.LRUCacheKey(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SparklineViewRenderer.LRUCacheKey(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SparklineViewRenderer.LRUCacheKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SparklineViewRenderer.LRUCacheKey()
{
  return &type metadata for SparklineViewRenderer.LRUCacheKey;
}

unint64_t sub_1BD5EA3B4()
{
  unint64_t result = qword_1EBA1A1B8;
  if (!qword_1EBA1A1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1A1B8);
  }
  return result;
}

void sub_1BD5EA400(uint64_t a1, char *a2, uint64_t *a3, uint64_t a4, unsigned __int8 *a5)
{
}

void sub_1BD5EA424()
{
  if (!qword_1EBA1AA28[0])
  {
    sub_1BD5D9BB4(255, (unint64_t *)&qword_1EBA1BC68);
    sub_1BD5D9BB4(255, (unint64_t *)&qword_1EBA1BC70);
    unint64_t v0 = sub_1BD60A380();
    if (!v1) {
      atomic_store(v0, qword_1EBA1AA28);
    }
  }
}

void sub_1BD5EA4AC()
{
  if (!qword_1EBA19C00)
  {
    sub_1BD5D9BB4(255, (unint64_t *)&qword_1EBA1BC70);
    sub_1BD5EA528();
    unint64_t v0 = sub_1BD60A450();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19C00);
    }
  }
}

unint64_t sub_1BD5EA528()
{
  unint64_t result = qword_1EBA1A1B0;
  if (!qword_1EBA1A1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1A1B0);
  }
  return result;
}

uint64_t sub_1BD5EA574()
{
  return sub_1BD60A360();
}

void sub_1BD5EA5A8()
{
  if (!qword_1EBA19A10)
  {
    sub_1BD5D9BB4(255, (unint64_t *)&qword_1EBA1BC68);
    sub_1BD5D9BB4(255, (unint64_t *)&qword_1EBA1BC70);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA19A10);
    }
  }
}

uint64_t sub_1BD5EA638()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1BD5EA690(uint64_t a1, uint64_t a2)
{
  return sub_1BD5E9F98(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1BD5EA6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_1BD60AB80();
  if (v3)
  {
    uint64_t v5 = a2 + 48;
    do
    {
      v5 += 24;
      swift_bridgeObjectRetain();
      sub_1BD60A550();
      sub_1BD60AB90();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_1BD5EA734()
{
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  sub_1BD5EB9E8();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for ColumnChartViewProvider();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for ColumnChartCoordinateProvider();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  sub_1BD5EBC3C();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B530);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B5E8);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B3C8);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  sub_1BD5EBC88();
  OUTLINED_FUNCTION_2_6();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5EBD0C(0, qword_1EBA1B1D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1BD5EBD8C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
  OUTLINED_FUNCTION_2_6();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for ColumnChartInteractor();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B6A0);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B9B8);
  OUTLINED_FUNCTION_0_3();
  swift_release();

  return swift_release();
}

id sub_1BD5EAA7C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ColumnChartViewProvider();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ColumnChartCoordinateProvider();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v4 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5EBC3C();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1BA80);
  id result = (id)sub_1BD60A200();
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v6 = type metadata accessor for GridViewProvider();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  void v11[3] = v6;
  v11[4] = &protocol witness table for GridViewProvider;
  v11[0] = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5EBC88();
  id result = (id)sub_1BD60A1D0();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5EBD0C(0, qword_1EBA1B1D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1BD5EBD8C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
  id result = (id)sub_1BD60A1D0();
  if (result)
  {
    uint64_t v8 = (uint64_t)result;
    sub_1BD5EB9E8();
    id v10 = objc_allocWithZone(v9);
    return sub_1BD5F2A00(v3, v4, v5, (uint64_t)v12, (uint64_t)v11, v7, v8);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1BD5EAD14(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B530);
  uint64_t result = sub_1BD60A200();
  if (v22)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1B3C8);
    uint64_t result = sub_1BD60A200();
    if (v20)
    {
      uint64_t v3 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
      double v4 = MEMORY[0x1F4188790](v3);
      uint64_t v6 = (void *)((char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v7 + 16))(v6, v4);
      uint64_t v8 = *v6;
      uint64_t v9 = type metadata accessor for ColumnChartRenderer();
      uint64_t v18[3] = v9;
      uint64_t v18[4] = &off_1F17FFFF0;
      v18[0] = v8;
      type metadata accessor for ColumnChartViewProvider();
      id v10 = (void *)swift_allocObject();
      uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v9);
      double v12 = MEMORY[0x1F4188790](v11);
      double v14 = (void *)((char *)&v18[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v15 + 16))(v14, v12);
      uint64_t v16 = *v14;
      v10[5] = v9;
      v10[6] = &off_1F17FFFF0;
      v10[2] = v16;
      sub_1BD5DBA08(&v19, (uint64_t)(v10 + 7));
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      return (uint64_t)v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5EAF80(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B9C0);
  uint64_t result = sub_1BD60A200();
  if (v3)
  {
    type metadata accessor for ColumnChartCoordinateProvider();
    swift_allocObject();
    return sub_1BD604E80(&v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5EB014()
{
  sub_1BD5EBC3C();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_1BD5EB040@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B6A0);
  uint64_t result = sub_1BD60A200();
  if (v14)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1AA08);
    uint64_t result = sub_1BD60A1E0();
    if (v12)
    {
      uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v14);
      double v6 = MEMORY[0x1F4188790](v5);
      uint64_t v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v9 + 16))(v8, v6);
      uint64_t v10 = sub_1BD5EBFBC(*v8, &v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      uint64_t result = type metadata accessor for ColumnChartRenderer();
      a2[3] = result;
      a2[4] = (uint64_t)&off_1F17FFFF0;
      *a2 = v10;
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

uint64_t sub_1BD5EB200@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BD5EB268(a1, (void (*)(void))type metadata accessor for ColumnChartCoordinateProvider, (uint64_t (*)(uint64_t))type metadata accessor for ColumnPathGenerator, (uint64_t)&off_1F17FE728, a2);
}

uint64_t sub_1BD5EB234@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BD5EB268(a1, (void (*)(void))sub_1BD5EBC3C, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartStyler, (uint64_t)&off_1F17FE0E8, a2);
}

uint64_t sub_1BD5EB268@<X0>(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a2(0);
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v11 = OUTLINED_FUNCTION_1_7();
    uint64_t v12 = a3(v11);
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v9;
    a5[3] = v12;
    a5[4] = a4;
    *a5 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5EB30C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for CategoryAxisGridViewModelGenerator();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v3 = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    type metadata accessor for ValueAxisGridViewModelGenerator();
    uint64_t result = sub_1BD60A1F0();
    if (result)
    {
      uint64_t v4 = result;
      sub_1BD5EBC88();
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = v3;
      *(void *)(result + 24) = v4;
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

uint64_t sub_1BD5EB3C0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ColumnChartInteractor();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v2 = result;
    sub_1BD5EBD0C(0, qword_1EBA1B1D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1BD5EBD8C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
    uint64_t v3 = swift_allocObject();
    sub_1BD5EBD0C(0, &qword_1EBA1A5F8, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1BD5EBD8C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for MultiTouchInteractionManager);
    swift_allocObject();
    *(void *)(v3 + 16) = sub_1BD5F3078(v2);
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5EB4C8()
{
  type metadata accessor for ColumnChartInteractor();

  return swift_allocObject();
}

uint64_t sub_1BD5EB4FC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B9B8);
  uint64_t result = sub_1BD60A200();
  if (v25)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1B3C8);
    uint64_t result = sub_1BD60A200();
    if (v23)
    {
      uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
      double v6 = MEMORY[0x1F4188790](v5);
      uint64_t v8 = (void *)((char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v9 + 16))(v8, v6);
      uint64_t v10 = *v8;
      uint64_t v11 = type metadata accessor for ColumnChartImageGenerator();
      v21[3] = v11;
      v21[4] = &off_1F17FEC28;
      v21[0] = v10;
      uint64_t v12 = type metadata accessor for ColumnChartImageLoader();
      uint64_t v13 = (void *)swift_allocObject();
      uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v11);
      double v15 = MEMORY[0x1F4188790](v14);
      uint64_t v17 = (void *)((char *)&v21[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v18 + 16))(v17, v15);
      uint64_t v19 = *v17;
      v13[5] = v11;
      v13[6] = &off_1F17FEC28;
      v13[2] = v19;
      sub_1BD5DBA08(&v22, (uint64_t)(v13 + 7));
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      a2[3] = v12;
      a2[4] = &off_1F17FEF60;
      *a2 = v13;
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

uint64_t sub_1BD5EB784@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B5E8);
  uint64_t result = sub_1BD60A200();
  if (v21)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
    double v5 = MEMORY[0x1F4188790](v4);
    uint64_t v7 = (void *)((char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v8 + 16))(v7, v5);
    uint64_t v9 = *v7;
    uint64_t v10 = type metadata accessor for ColumnPathGenerator();
    v19[3] = v10;
    v19[4] = &off_1F17FE728;
    v19[0] = v9;
    uint64_t v11 = type metadata accessor for ColumnChartImageGenerator();
    uint64_t v12 = (void *)swift_allocObject();
    uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v10);
    double v14 = MEMORY[0x1F4188790](v13);
    uint64_t v16 = (void *)((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v17 + 16))(v16, v14);
    uint64_t v18 = *v16;
    v12[5] = v10;
    v12[6] = &off_1F17FE728;
    v12[2] = v18;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    a2[3] = v11;
    a2[4] = &off_1F17FEC28;
    *a2 = v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ColumnChartAssembly()
{
  return self;
}

uint64_t sub_1BD5EB9D0()
{
  return sub_1BD5EA734();
}

void sub_1BD5EB9E8()
{
  if (!qword_1EBA1B260)
  {
    sub_1BD5EBD0C(255, &qword_1EBA1B068, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartModel, (uint64_t (*)(void))sub_1BD5DDCE4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for ChartModelFactory);
    type metadata accessor for ColumnChartViewProvider();
    type metadata accessor for ColumnChartCoordinateProvider();
    sub_1BD5EBC3C();
    sub_1BD5EBC88();
    sub_1BD5EBD0C(255, qword_1EBA1B1D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1BD5EBD8C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
    sub_1BD5EBDC0();
    sub_1BD5EBE54(&qword_1EBA1B538, (void (*)(uint64_t))type metadata accessor for ColumnChartViewProvider);
    sub_1BD5EBE54(&qword_1EBA1B8D8, (void (*)(uint64_t))type metadata accessor for ColumnChartCoordinateProvider);
    sub_1BD5EBE54(&qword_1EBA1ABE8, (void (*)(uint64_t))sub_1BD5EBC3C);
    sub_1BD5EBE54(&qword_1EBA1B518, (void (*)(uint64_t))sub_1BD5EBC88);
    sub_1BD5EBE9C();
    unint64_t v0 = type metadata accessor for ChartViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1B260);
    }
  }
}

void sub_1BD5EBC3C()
{
  if (!qword_1EBA1ABF0)
  {
    unint64_t v0 = type metadata accessor for StyleManager();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1ABF0);
    }
  }
}

void sub_1BD5EBC88()
{
  if (!qword_1EBA1B520)
  {
    type metadata accessor for CategoryAxisGridViewModelGenerator();
    type metadata accessor for ValueAxisGridViewModelGenerator();
    unint64_t v0 = type metadata accessor for GridViewModelGenerator();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1B520);
    }
  }
}

void sub_1BD5EBD0C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_1BD5EBD8C()
{
  return sub_1BD5EBE54(&qword_1EBA1B328, (void (*)(uint64_t))type metadata accessor for ColumnChartInteractor);
}

unint64_t sub_1BD5EBDC0()
{
  unint64_t result = qword_1EBA1B060;
  if (!qword_1EBA1B060)
  {
    sub_1BD5EBD0C(255, &qword_1EBA1B068, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartModel, (uint64_t (*)(void))sub_1BD5DDCE4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for ChartModelFactory);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1B060);
  }
  return result;
}

uint64_t sub_1BD5EBE54(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1BD5EBE9C()
{
  unint64_t result = qword_1EBA1B1C8;
  if (!qword_1EBA1B1C8)
  {
    sub_1BD5EBD0C(255, qword_1EBA1B1D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1BD5EBD8C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA1B1C8);
  }
  return result;
}

uint64_t sub_1BD5EBF30(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v8 = type metadata accessor for ColumnChartImageLoader();
  uint64_t v9 = &off_1F17FEF60;
  *(void *)&long long v7 = a1;
  sub_1BD5EA424();
  swift_allocObject();
  *(void *)(a3 + 96) = sub_1BD60A370();
  sub_1BD5DBA08(&v7, a3 + 16);
  sub_1BD5DBA08(a2, a3 + 56);
  return a3;
}

uint64_t sub_1BD5EBFBC(uint64_t a1, long long *a2)
{
  uint64_t v14 = type metadata accessor for ColumnChartImageLoader();
  uint64_t v15 = &off_1F17FEF60;
  v13[0] = a1;
  type metadata accessor for ColumnChartRenderer();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v14);
  double v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (void *)((char *)&v13[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v9 + 16))(v8, v6);
  uint64_t v10 = sub_1BD5EBF30(*v8, a2, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

void *LineChartView.__allocating_init(seriesViews:)(unint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return LineChartView.init(seriesViews:)(a1);
}

uint64_t sub_1BD5EC10C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1BD60AA10())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C187E170](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      objc_msgSend(a2, sel_bounds);
      objc_msgSend(v7, sel_setFrame_);

      ++v5;
      if (v8 == v4) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

id LineChartView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void LineChartView.init(coder:)()
{
}

void *LineChartView.init(seriesViews:)(unint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC9TeaCharts13LineChartView_seriesViews] = a1;
  v16.receiver = v1;
  v16.super_class = ObjectType;
  swift_bridgeObjectRetain();
  id v4 = objc_msgSendSuper2(&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v5 = v4;
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v7 = v4;
  swift_bridgeObjectRetain();
  for (i = v7; v6; uint64_t v6 = sub_1BD60AA10())
  {
    uint64_t v9 = 4;
    while (1)
    {
      id v10 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C187E170](v9 - 4, a1) : *(id *)(a1 + 8 * v9);
      unint64_t v11 = v10;
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      objc_msgSend(v5, sel_addSubview_, v10, v16.receiver, v16.super_class);

      ++v9;
      if (v12 == v6) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    id v14 = v5;
    swift_bridgeObjectRetain();
    id v15 = v14;
  }
LABEL_9:

  swift_bridgeObjectRelease_n();
  return v5;
}

Swift::Void __swiftcall LineChartView.layoutSubviews()()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  id v1 = v0;
  unint64_t v2 = swift_bridgeObjectRetain();
  sub_1BD5EC10C(v2, v1);
  swift_bridgeObjectRelease();
}

id LineChartView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void LineChartView.init(frame:)()
{
}

id LineChartView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LineChartView()
{
  return self;
}

uint64_t method lookup function for LineChartView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineChartView);
}

uint64_t dispatch thunk of LineChartView.__allocating_init(seriesViews:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

UIImage *sub_1BD5EC614(uint64_t a1, uint64_t a2, void *__src, uint64_t *a4)
{
  memcpy(__dst, __src, 0x41uLL);
  uint64_t v8 = *a4;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
  CGFloat v9 = __dst[0];
  CGFloat v10 = __dst[1];
  CGFloat v11 = __dst[2];
  long long v22 = *(_OWORD *)&__dst[3];
  CGFloat v23 = __dst[5];
  CGFloat v24 = __dst[6];
  CGFloat v25 = __dst[7];
  char v26 = LOBYTE(__dst[8]);
  unint64_t v12 = sub_1BD5E734C(a1, a2, &v22, __dst[0], __dst[1]);
  v28.width = v9;
  v28.height = v10;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v11);
  uint64_t v13 = UIGraphicsGetCurrentContext();
  if (v13)
  {
    id v14 = v13;
    if (v12 >> 62) {
      goto LABEL_14;
    }
    uint64_t v15 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v15; uint64_t v15 = sub_1BD60AA10())
    {
      uint64_t v16 = 4;
      while (1)
      {
        id v17 = (v12 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x1C187E170](v16 - 4, v12)
            : *(id *)(v12 + 8 * v16);
        uint64_t v18 = v17;
        uint64_t v19 = v16 - 3;
        if (__OFADD__(v16 - 4, 1)) {
          break;
        }
        sub_1BD5EC834(v16 - 4, v17, v8, v14, __dst);

        ++v16;
        if (v19 == v15) {
          goto LABEL_10;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    uint64_t v20 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1BD5D4860();
    id v14 = (CGContext *)sub_1BD60A7C0();
    sub_1BD60A710();
    sub_1BD60A470();
    uint64_t v20 = 0;
  }

  return v20;
}

void sub_1BD5EC834(uint64_t a1, void *a2, uint64_t a3, CGContext *a4, CGFloat *a5)
{
  if (*(void *)(a3 + 16) > a1)
  {
    if ((a1 & 0x8000000000000000) == 0)
    {
      uint64_t v8 = (uint64_t *)(a3 + 16 * a1 + 32);
      goto LABEL_6;
    }
    __break(1u);
    goto LABEL_20;
  }
  if (qword_1E9FC6808 != -1) {
LABEL_20:
  }
    swift_once();
  uint64_t v8 = &qword_1E9FC6C40;
LABEL_6:
  unint64_t v9 = *v8;
  if (v8[1])
  {
    CGFloat v10 = self;
    sub_1BD5D6054((void *)v9, 1);
    sub_1BD5D6054((void *)v9, 1);
    id v11 = objc_msgSend(v10, sel_clearColor);
    objc_msgSend(v11, sel_setFill);

    objc_msgSend(a2, sel_addClip);
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_1BD60AA10();
      sub_1BD5D48A0((void *)v9, 1);
      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v12)
      {
LABEL_9:
        uint64_t v22 = MEMORY[0x1E4FBC860];
        sub_1BD60A980();
        if (v12 < 0)
        {
          __break(1u);
          return;
        }
        CFArrayRef colors = (CFArrayRef)a5;
        uint64_t v13 = 0;
        do
        {
          if ((v9 & 0xC000000000000001) != 0) {
            id v14 = (id)MEMORY[0x1C187E170](v13, v9);
          }
          else {
            id v14 = *(id *)(v9 + 8 * v13 + 32);
          }
          uint64_t v15 = v14;
          ++v13;
          id v16 = objc_msgSend(v14, sel_CGColor, colors, v22);

          sub_1BD60A960();
          sub_1BD60A990();
          sub_1BD60A9A0();
          sub_1BD60A970();
        }
        while (v12 != v13);
        sub_1BD5D48A0((void *)v9, 1);
        a5 = (CGFloat *)colors;
        goto LABEL_23;
      }
    }
    sub_1BD5D48A0((void *)v9, 1);
LABEL_23:
    type metadata accessor for CGColor(0);
    CFArrayRef colorsa = (const __CFArray *)sub_1BD60A5A0();
    swift_bridgeObjectRelease();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v18 = CGGradientCreateWithColors(DeviceRGB, colorsa, 0);

    if (v18)
    {
      v25.y = a5[1];
      v24.x = 0.0;
      v24.y = 0.0;
      v25.x = 0.0;
      CGContextDrawLinearGradient(a4, v18, v24, v25, 0);
    }
    objc_msgSend(a2, sel_fill, colorsa);
    sub_1BD5D48A0((void *)v9, 1);

    return;
  }
  sub_1BD5D6054((void *)*v8, 0);
  objc_msgSend((id)v9, sel_setFill);
  objc_msgSend(a2, sel_fill);
  objc_msgSend(a2, sel_fill);

  sub_1BD5D48A0((void *)v9, 0);
}

uint64_t type metadata accessor for ColumnChartImageGenerator()
{
  return self;
}

uint64_t dispatch thunk of AxisType.grids.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

Swift::Int_optional __swiftcall CategoryAxis.index(of:)(Swift::String of)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(type metadata accessor for CategoryAxis() + 20));
  if (*(void *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v3 = sub_1BD5ED34C();
    if (v4) {
      Swift::Int v5 = *(void *)(*(void *)(v2 + 56) + 8 * v3);
    }
    else {
      Swift::Int v5 = 0;
    }
    char v6 = v4 ^ 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v5 = 0;
    char v6 = 1;
  }
  Swift::Bool v7 = v6 & 1;
  Swift::Int v8 = v5;
  result.value = v8;
  result.is_nil = v7;
  return result;
}

uint64_t type metadata accessor for CategoryAxis()
{
  uint64_t result = qword_1EBA1AAB8;
  if (!qword_1EBA1AAB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CategoryAxis.categories.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t CategoryAxis.grids.getter()
{
  type metadata accessor for CategoryAxis();

  return swift_bridgeObjectRetain();
}

uint64_t CategoryAxis.init(categories:grids:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a2;
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v9 = (char *)&v47 - v8;
  uint64_t v10 = MEMORY[0x1E4FAAB58];
  CGRect v56 = (char *)MEMORY[0x1E4FAAB58];
  sub_1BD5ED450(0, &qword_1EBA1AA00, &qword_1EBA1AA10, MEMORY[0x1E4FAAB58], MEMORY[0x1E4FBBCF0]);
  uint64_t v12 = v11 - 8;
  MEMORY[0x1F4188790](v11);
  CGRect v57 = (char *)&v47 - v13;
  sub_1BD5ED450(0, qword_1EBA1BC78, &qword_1EBA1AA10, v10, MEMORY[0x1E4FBBCF8]);
  MEMORY[0x1F4188790](v14 - 8);
  id v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v18 = MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v47 - v19;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, double))(v7 + 16);
  v21(a3, a1, v6, v18);
  uint64_t v47 = type metadata accessor for CategoryAxis();
  uint64_t v22 = *(int *)(v47 + 24);
  uint64_t v50 = a1;
  uint64_t v51 = a3;
  *(void *)(a3 + v22) = v58;
  unint64_t v54 = (void (*)(char *, uint64_t, uint64_t))v21;
  uint64_t v55 = v7 + 16;
  ((void (*)(char *, uint64_t, uint64_t))v21)(v20, a1, v6);
  CGFloat v23 = (void *)sub_1BD60A4C0();
  uint64_t v48 = v20;
  sub_1BD5ED3B4((uint64_t)v20, (uint64_t)v16);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v16, v6);
  uint64_t v24 = (uint64_t)v57;
  sub_1BD5ED500(&qword_1EBA1AA10);
  CGRect v56 = v9;
  sub_1BD60A560();
  uint64_t v25 = *(int *)(v12 + 44);
  *(void *)(v24 + v25) = 0;
  sub_1BD5ED450(0, &qword_1EBA1A9F8, (unint64_t *)&qword_1EBA1AA18, MEMORY[0x1E4FAAB60], MEMORY[0x1E4FBBC18]);
  char v27 = (void *)(v24 + *(int *)(v26 + 36));
  sub_1BD5ED500((unint64_t *)&qword_1EBA1AA18);
  CGSize v28 = (void *)*v27;
  sub_1BD60A6A0();
  uint64_t v49 = v7;
  if (v28 == v59)
  {
LABEL_13:
    sub_1BD5EDB08(v24, &qword_1EBA1AA00, MEMORY[0x1E4FBBCF0]);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v50, v6);
    uint64_t result = sub_1BD5EDB08((uint64_t)v48, qword_1EBA1BC78, MEMORY[0x1E4FBBCF8]);
    *(void *)(v51 + *(int *)(v47 + 20)) = v23;
  }
  else
  {
    uint64_t v52 = v25;
    uint64_t v53 = (void (**)(char *, uint64_t))(v7 + 8);
    while (1)
    {
      long long v29 = (void (*)(void **, void))sub_1BD60A6C0();
      uint64_t v32 = *v30;
      uint64_t v31 = v30[1];
      swift_bridgeObjectRetain();
      v29(&v59, 0);
      CGRect v33 = v56;
      v54(v56, v24, v6);
      sub_1BD60A6B0();
      (*v53)(v33, v6);
      uint64_t v34 = *(void *)(v24 + v25);
      if (__OFADD__(v34, 1)) {
        break;
      }
      uint64_t v58 = *(void *)(v24 + v25);
      *(void *)(v24 + v25) = v34 + 1;
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v59 = v23;
      unint64_t v35 = sub_1BD5ED34C();
      if (__OFADD__(v23[2], (v36 & 1) == 0)) {
        goto LABEL_15;
      }
      unint64_t v37 = v35;
      char v38 = v36;
      sub_1BD5EDAB8(0, &qword_1EBA19BB8, MEMORY[0x1E4FBB550], MEMORY[0x1E4FBB1B0], MEMORY[0x1E4FBBCB8]);
      if (sub_1BD60A9D0())
      {
        unint64_t v39 = sub_1BD5ED34C();
        if ((v38 & 1) != (v40 & 1)) {
          goto LABEL_17;
        }
        unint64_t v37 = v39;
      }
      CGFloat v23 = v59;
      if (v38)
      {
        *(void *)(v59[7] + 8 * v37) = v58;
      }
      else
      {
        v59[(v37 >> 6) + 8] |= 1 << v37;
        long long v41 = (void *)(v23[6] + 16 * v37);
        *long long v41 = v32;
        v41[1] = v31;
        *(void *)(v23[7] + 8 * v37) = v58;
        uint64_t v42 = v23[2];
        BOOL v43 = __OFADD__(v42, 1);
        uint64_t v44 = v42 + 1;
        if (v43) {
          goto LABEL_16;
        }
        v23[2] = v44;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v45 = (void *)*v27;
      uint64_t v24 = (uint64_t)v57;
      sub_1BD60A6A0();
      uint64_t v25 = v52;
      if (v45 == v59) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BD60AB10();
    __break(1u);
  }
  return result;
}

unint64_t sub_1BD5ED34C()
{
  OUTLINED_FUNCTION_1_9();
  sub_1BD60A550();
  uint64_t v2 = sub_1BD60ABA0();

  return sub_1BD5ED6E4(v1, v0, v2);
}

uint64_t sub_1BD5ED3B4(uint64_t a1, uint64_t a2)
{
  sub_1BD5ED450(0, qword_1EBA1BC78, &qword_1EBA1AA10, MEMORY[0x1E4FAAB58], MEMORY[0x1E4FBBCF8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BD5ED450(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1BD5EDAB8(255, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
    uint64_t v10 = v9;
    uint64_t v11 = sub_1BD5ED500(a3);
    unint64_t v12 = a5(a1, v10, v11);
    if (!v13) {
      atomic_store(v12, a2);
    }
  }
}

uint64_t sub_1BD5ED500(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BD5EDAB8(255, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BD5ED570(uint64_t a1)
{
  sub_1BD60A540();
  sub_1BD60AB70();
  sub_1BD60A550();
  uint64_t v2 = sub_1BD60ABA0();
  swift_bridgeObjectRelease();

  return sub_1BD5ED7C8(a1, v2);
}

unint64_t sub_1BD5ED604(uint64_t a1)
{
  uint64_t v2 = sub_1BD60AB60();

  return sub_1BD5ED940(a1, v2);
}

unint64_t sub_1BD5ED648(double a1)
{
  OUTLINED_FUNCTION_1_9();
  swift_bridgeObjectRetain();
  sub_1BD60A550();
  swift_bridgeObjectRelease();
  sub_1BD60AB90();
  uint64_t v4 = sub_1BD60ABA0();

  return sub_1BD5ED9DC(v2, v1, v4, a1);
}

unint64_t sub_1BD5ED6E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BD60AAF0() & 1) == 0)
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
      while (!v14 && (sub_1BD60AAF0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BD5ED7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1BD60A540();
    uint64_t v8 = v7;
    if (v6 == sub_1BD60A540() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1BD60AAF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1BD60A540();
          uint64_t v15 = v14;
          if (v13 == sub_1BD60A540() && v15 == v16) {
            break;
          }
          char v18 = sub_1BD60AAF0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1BD5ED940(uint64_t a1, uint64_t a2)
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

unint64_t sub_1BD5ED9DC(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a3 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = v12 + 24 * v7;
      double v14 = *(double *)(v13 + 16);
      BOOL v15 = *(void *)v13 == a1 && *(void *)(v13 + 8) == a2;
      if (v15 || (sub_1BD60AAF0()) && v14 == a4) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

void sub_1BD5EDAB8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, MEMORY[0x1E4FBB1A0]);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1BD5EDB08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_1BD5ED450(0, a2, &qword_1EBA1AA10, MEMORY[0x1E4FAAB58], a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for CategoryAxis(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CategoryAxis(uint64_t a1)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BD5EE054);
}

uint64_t sub_1BD5EE054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BD5EE120);
}

void sub_1BD5EE120(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1BD5EDAB8(0, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_1BD5EE1D4()
{
  sub_1BD5EDAB8(319, (unint64_t *)&qword_1EBA1AA20, MEMORY[0x1E4FBB1C8], MEMORY[0x1E4FAB190], MEMORY[0x1E4FAAB50]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1BD5EE29C()
{
  sub_1BD60A540();
  sub_1BD60AB70();
  sub_1BD60A550();
  uint64_t v0 = sub_1BD60ABA0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BD5EE310()
{
  uint64_t v0 = sub_1BD60A540();
  uint64_t v2 = v1;
  if (v0 == sub_1BD60A540() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BD60AAF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_1BD5EE398(int a1, void *a2, void *__src)
{
  memcpy(__dst, __src, sizeof(__dst));
  objc_msgSend(a2, sel_setFrame_, __dst[0], __dst[1], __dst[2], __dst[3]);
  objc_msgSend(a2, sel_setAlpha_, 0.0);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  sub_1BD5DB928();
  char v5 = (void *)sub_1BD60A760();
  sub_1BD60A2C0();

  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1BD5EEBF4;
  *(void *)(v7 + 24) = v6;
  id v8 = a2;
  uint64_t v9 = (void *)sub_1BD60A3B0();
  sub_1BD60A3C0();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1BD5EE508()
{
  return sub_1BD60A3F0();
}

uint64_t sub_1BD5EE58C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(a5 + 64);
  uint64_t v53 = v7;
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = v7 + 32;
    uint64_t v49 = a6;
    uint64_t v10 = (uint64_t *)(a6 + OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers);
    swift_bridgeObjectRetain();
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = *(void **)(v9 + 8 * v11);
      uint64_t result = swift_beginAccess();
      uint64_t v14 = *v10;
      if ((*v10 & 0xC000000000000001) != 0)
      {
        id v20 = v12;
        id v17 = (id)MEMORY[0x1C187E170](v11, v14);
      }
      else
      {
        if (v11 >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
        BOOL v15 = *(void **)(v14 + 8 * v11 + 32);
        id v16 = v12;
        id v17 = v15;
      }
      char v18 = v17;
      ++v11;
      swift_endAccess();
      id v19 = objc_msgSend(v12, sel_CGPath);
      objc_msgSend(v18, sel_setPath_, v19);
    }
    while (v8 != v11);
    sub_1BD5EEC3C((uint64_t)&v53);
    a6 = v49;
  }
  uint64_t v21 = *(void *)(a5 + 72);
  uint64_t v52 = v21;
  uint64_t v22 = *(void *)(v21 + 16);
  if (!v22) {
    return a1(v21);
  }
  CGFloat v23 = (void *)(a6 + OBJC_IVAR____TtC9TeaCharts8GridView_labels);
  uint64_t v50 = *MEMORY[0x1E4FB24F0];
  unint64_t v24 = 0;
  uint64_t v25 = v22 - 1;
  uint64_t v26 = (unsigned char *)(swift_bridgeObjectRetain() + 72);
  uint64_t v48 = v23;
  while (1)
  {
    char v27 = (void *)*((void *)v26 - 5);
    double v28 = *((double *)v26 - 4);
    double v29 = *((double *)v26 - 3);
    double v30 = *((double *)v26 - 2);
    double v31 = *((double *)v26 - 1);
    char v32 = *v26;
    uint64_t result = swift_beginAccess();
    uint64_t v33 = *v23;
    if ((*v23 & 0xC000000000000001) != 0)
    {
      id v46 = v27;
      id v36 = (id)MEMORY[0x1C187E170](v24, v33);
    }
    else
    {
      if ((v24 & 0x8000000000000000) != 0) {
        goto LABEL_28;
      }
      if (v24 >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_29;
      }
      uint64_t v34 = *(void **)(v33 + 8 * v24 + 32);
      id v35 = v27;
      id v36 = v34;
    }
    unint64_t v37 = v36;
    swift_endAccess();
    if (v27) {
      break;
    }
LABEL_18:

    if (v25 == v24) {
      goto LABEL_25;
    }
LABEL_23:
    v26 += 48;
    ++v24;
  }
  if (v32)
  {

    goto LABEL_18;
  }
  id v38 = v27;
  objc_msgSend(v37, sel_setAttributedText_, v38);
  objc_msgSend(v37, sel_setFrame_, v28, v29, v30, v31);
  uint64_t result = (uint64_t)objc_msgSend(v38, sel_length);
  if (result < 0) {
    goto LABEL_30;
  }
  uint64_t v39 = result;
  uint64_t v40 = v25;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v37;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = sub_1BD5EEC68;
  *(void *)(v42 + 24) = v41;
  aBlock[4] = sub_1BD5EEC80;
  aBlock[5] = v42;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BD5EEA10;
  aBlock[3] = &block_descriptor_17;
  BOOL v43 = _Block_copy(aBlock);
  id v44 = v37;
  swift_retain();
  swift_release();
  objc_msgSend(v38, sel_enumerateAttribute_inRange_options_usingBlock_, v50, 0, v39, 0, v43);

  _Block_release(v43);
  LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  uint64_t result = swift_release();
  if (v39) {
    goto LABEL_31;
  }
  uint64_t v25 = v40;
  BOOL v45 = v40 == v24;
  CGFloat v23 = v48;
  if (!v45) {
    goto LABEL_23;
  }
LABEL_25:
  uint64_t v21 = sub_1BD5EEC3C((uint64_t)&v52);
  return a1(v21);
}

void sub_1BD5EE98C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, void *a5)
{
  sub_1BD5EECF4(a1, (uint64_t)v9);
  if (v10)
  {
    if (swift_dynamicCast())
    {
      sub_1BD5E1074(v7, v8, a5);
      *a4 = 1;
    }
  }
  else
  {
    sub_1BD5D9A30((uint64_t)v9);
  }
}

uint64_t sub_1BD5EEA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(long long *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((void *)&v12 + 1) = swift_getObjectType();
    *(void *)&long long v11 = a2;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return sub_1BD5D9A30((uint64_t)&v11);
}

void sub_1BD5EEAA0(void *a1)
{
  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  v6[4] = sub_1BD5E0B28;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1BD5F637C;
  v6[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(v6);
  id v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.15);
  _Block_release(v4);
}

uint64_t type metadata accessor for GridViewRenderer()
{
  return self;
}

uint64_t sub_1BD5EEBB4()
{
  return sub_1BD5EE508();
}

uint64_t sub_1BD5EEBBC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BD5EEBF4()
{
  sub_1BD5EEAA0(*(void **)(v0 + 16));
}

uint64_t sub_1BD5EEBFC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD5EEC34(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BD5EE58C(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_1BD5EEC3C(uint64_t a1)
{
  return a1;
}

void sub_1BD5EEC68(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  sub_1BD5EE98C(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_1BD5EEC70()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD5EEC80()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1BD5EECA8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1BD5EECF4(uint64_t a1, uint64_t a2)
{
  sub_1BD5EECA8(0, &qword_1EBA19B90, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CoordinateSpace.x.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return OUTLINED_FUNCTION_0_12(*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16), a2);
}

uint64_t CoordinateSpace.y.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return OUTLINED_FUNCTION_0_12(*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16), a2);
}

uint64_t CoordinateSpace.init(x:y:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a5, a1);
  uint64_t v8 = type metadata accessor for CoordinateSpace();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5 + *(int *)(v8 + 52), a2, a4);
}

uint64_t type metadata accessor for CoordinateSpace()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BD5EEEC4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1BD5EEF94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v5 + 64) + v8;
  int v11 = *(_DWORD *)(v5 + 80) | v8;
  uint64_t v12 = v11;
  int v13 = v11 & 0x100000;
  if (v12 > 7 || v13 != 0 || (v10 & (unint64_t)~v9) + *(void *)(v7 + 64) > 0x18)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v10) & v17, ((unint64_t)a2 + v10) & v17, v6);
  }
  return v4;
}

uint64_t sub_1BD5EF0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v6 = *(uint64_t (**)(unint64_t))(v5 + 8);
  unint64_t v7 = (*(void *)(v4 + 56) + a1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);

  return v6(v7);
}

uint64_t sub_1BD5EF194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(void *)(v6 + 48) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 48) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1BD5EF23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(void *)(v6 + 40) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 40) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1BD5EF2E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(void *)(v6 + 32) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 32) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1BD5EF38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(void *)(v6 + 24) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 24) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1BD5EF434(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(unsigned int *)(*(void *)(v5 - 8) + 84);
  uint64_t v8 = *(void *)(v6 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= v7) {
    unsigned int v11 = *(_DWORD *)(*(void *)(v5 - 8) + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(*(void *)(v5 - 8) + 64) + v10;
  unsigned int v13 = a2 - v11;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v14 = (v12 & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 < v9)
        {
          a1 = (unsigned __int16 *)(((unint64_t)a1 + v12) & ~v10);
          uint64_t v7 = *(unsigned int *)(v8 + 84);
          uint64_t v5 = v6;
        }
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v7, v5);
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = v14;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v11 + (v20 | v18) + 1;
}

void sub_1BD5EF60C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(unsigned int *)(*(void *)(v7 - 8) + 84);
  uint64_t v9 = *(void *)(a4 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v8) {
    unsigned int v12 = *(_DWORD *)(*(void *)(v7 - 8) + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = *(void *)(*(void *)(v7 - 8) + 64) + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(*(void *)(v9 - 8) + 64);
  char v16 = 8 * v15;
  BOOL v17 = a3 >= v12;
  unsigned int v18 = a3 - v12;
  if (v18 != 0 && v17)
  {
    if (v15 <= 3)
    {
      unsigned int v22 = ((v18 + ~(-1 << v16)) >> v16) + 1;
      if (HIWORD(v22))
      {
        int v19 = 4;
      }
      else if (v22 >= 0x100)
      {
        int v19 = 2;
      }
      else
      {
        int v19 = v22 > 1;
      }
    }
    else
    {
      int v19 = 1;
    }
  }
  else
  {
    int v19 = 0;
  }
  if (v12 < a2)
  {
    unsigned int v20 = ~v12 + a2;
    if (v15 < 4)
    {
      int v21 = (v20 >> v16) + 1;
      if (v15)
      {
        int v23 = v20 & ~(-1 << v16);
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)uint64_t v6 = v23;
          v6[2] = BYTE2(v23);
        }
        else if (v15 == 2)
        {
          *(_WORD *)uint64_t v6 = v23;
        }
        else
        {
          *uint64_t v6 = v23;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)uint64_t v6 = v20;
      int v21 = 1;
    }
    switch(v19)
    {
      case 1:
        v6[v15] = v21;
        return;
      case 2:
        *(_WORD *)&v6[v15] = v21;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&v6[v15] = v21;
        return;
      default:
        return;
    }
  }
  switch(v19)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x1BD5EF898);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v8 < v11)
        {
          a1 = (char *)((unint64_t)&a1[v14] & ~v13);
          uint64_t v8 = v11;
          uint64_t v7 = v9;
        }
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v8, v7);
      }
      return;
  }
}

uint64_t dispatch thunk of InteractionHandler.register(model:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of InteractionHandler.didStart(interaction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t GridViewModelGenerator.models(for:options:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (void *)*v2;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = (void *)a2[2];
  char v26 = 1;
  uint64_t v22 = v5;
  uint64_t v23 = (uint64_t)v7;
  uint64_t v8 = v4[12];
  uint64_t v9 = *(uint64_t (**)(uint64_t, char *, uint64_t *, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = v4[10];
  id v20 = v7;
  uint64_t v21 = v9(a1, &v26, &v22, v10, v8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = v4[13];
  uint64_t v13 = v4[11];
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v16 = swift_getAssociatedConformanceWitness();
  uint64_t v22 = AssociatedTypeWitness;
  uint64_t v23 = v14;
  uint64_t v24 = AssociatedConformanceWitness;
  uint64_t v25 = v16;
  uint64_t v17 = a1 + *(int *)(type metadata accessor for CoordinateSpace() + 52);
  char v26 = 0;
  uint64_t v22 = v6;
  uint64_t v23 = (uint64_t)v20;
  uint64_t v18 = (*(uint64_t (**)(uint64_t, char *, uint64_t *, uint64_t, uint64_t))(v12 + 24))(v17, &v26, &v22, v13, v12);
  uint64_t v22 = v21;
  sub_1BD5EFC40(v18);

  return v22;
}

uint64_t *GridViewModelGenerator.deinit()
{
  uint64_t v1 = *v0;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v0 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 112));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 120));
  return v0;
}

uint64_t GridViewModelGenerator.__deallocating_deinit()
{
  GridViewModelGenerator.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BD5EFC1C(uint64_t a1, uint64_t *a2)
{
  return GridViewModelGenerator.models(for:options:)(a1, a2);
}

void sub_1BD5EFC40(uint64_t a1)
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
    sub_1BD5D9D64(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    uint64_t v3 = v9;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
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
  uint64_t v10 = *(void *)(v3 + 16);
  BOOL v11 = __OFADD__(v10, v2);
  uint64_t v12 = v10 + v2;
  if (!v11)
  {
    *(void *)(v3 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_1BD5EFD28()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1BD5EFD48()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t initializeBufferWithCopyOfBuffer for GridViewModelGeneratorOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  id v4 = v3;
  return a1;
}

void destroy for GridViewModelGeneratorOptions(uint64_t a1)
{
}

void *assignWithCopy for GridViewModelGeneratorOptions(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = (void *)a2[2];
  id v4 = (void *)a1[2];
  a1[2] = v3;
  id v5 = v3;

  return a1;
}

uint64_t assignWithTake for GridViewModelGeneratorOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for GridViewModelGeneratorOptions(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for GridViewModelGeneratorOptions(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridViewModelGeneratorOptions()
{
  return &type metadata for GridViewModelGeneratorOptions;
}

uint64_t dispatch thunk of GridViewModelGeneratorType.models(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t sub_1BD5EFED0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for GridViewModelGenerator()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for GridViewModelGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GridViewModelGenerator);
}

uint64_t ColumnChartModel.coordinateSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BD5EFFE4(v1, a1);
}

uint64_t sub_1BD5EFFE4(uint64_t a1, uint64_t a2)
{
  sub_1BD5D7EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ColumnChartModel.series.getter()
{
  type metadata accessor for ColumnChartModel();

  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for ColumnChartModel()
{
  uint64_t result = qword_1EBA1ADE8;
  if (!qword_1EBA1ADE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double ColumnChartModel.options.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ColumnChartModel() + 24);
  double result = *(double *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v6 = *(void *)(v3 + 32);
  char v7 = *(unsigned char *)(v3 + 40);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(double *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  return result;
}

__n128 ColumnChartModel.init(coordinateSpace:series:options:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  __n128 v13 = *a3;
  unint64_t v6 = a3[1].n128_u64[0];
  unint64_t v7 = a3[1].n128_u64[1];
  unint64_t v8 = a3[2].n128_u64[0];
  unsigned __int8 v9 = a3[2].n128_u8[8];
  sub_1BD5F01A8(a1, a4);
  uint64_t v10 = type metadata accessor for ColumnChartModel();
  *(void *)(a4 + *(int *)(v10 + 20)) = a2;
  BOOL v11 = (__n128 *)(a4 + *(int *)(v10 + 24));
  __n128 result = v13;
  *BOOL v11 = v13;
  v11[1].n128_u64[0] = v6;
  v11[1].n128_u64[1] = v7;
  v11[2].n128_u64[0] = v8;
  v11[2].n128_u8[8] = v9;
  return result;
}

uint64_t sub_1BD5F01A8(uint64_t a1, uint64_t a2)
{
  sub_1BD5D7EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for ColumnChartModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1BD5D40B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for CategoryAxis();
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 24));
    sub_1BD5D7EB4();
    uint64_t v10 = *(int *)(v9 + 52);
    BOOL v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    *(_OWORD *)BOOL v11 = *(_OWORD *)((char *)a2 + v10);
    uint64_t v22 = (uint64_t)a2 + v10 + 16;
    uint64_t v23 = (uint64_t)a1 + v10 + 16;
    long long v13 = *(_OWORD *)((char *)a2 + v10 + 40);
    *(_OWORD *)(v11 + 40) = v13;
    uint64_t v14 = v13;
    size_t v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v23, v22, v14);
    *((void *)v11 + 7) = *((void *)v12 + 7);
    uint64_t v16 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v17 = (_OWORD *)((char *)a1 + v16);
    uint64_t v18 = (_OWORD *)((char *)a2 + v16);
    long long v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    *(_OWORD *)((char *)v17 + 25) = *(_OWORD *)((char *)v18 + 25);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ColumnChartModel(uint64_t a1)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(v3 + 52) + 16);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  uint64_t v6 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v6 + 20)) = *(void *)(a2 + *(int *)(v6 + 20));
  *(void *)(a1 + *(int *)(v6 + 24)) = *(void *)(a2 + *(int *)(v6 + 24));
  sub_1BD5D7EB4();
  uint64_t v8 = *(int *)(v7 + 52);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)(a2 + v8);
  uint64_t v20 = a1 + v8 + 16;
  uint64_t v11 = a2 + v8 + 16;
  long long v12 = *(_OWORD *)(a2 + v8 + 40);
  *(_OWORD *)(v9 + 40) = v12;
  uint64_t v13 = v12;
  uint64_t v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v20, v11, v13);
  *(void *)(v9 + 56) = *(void *)(v10 + 56);
  uint64_t v15 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v16 = (_OWORD *)(a1 + v15);
  uint64_t v17 = (_OWORD *)(a2 + v15);
  long long v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(_OWORD *)((char *)v16 + 25) = *(_OWORD *)((char *)v17 + 25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9 + 16), (uint64_t *)(a2 + v9 + 16));
  _OWORD v10[7] = *(void *)(v11 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  *(void *)(v13 + 16) = *(void *)(v14 + 16);
  *(void *)(v13 + 24) = *(void *)(v14 + 24);
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  *(unsigned char *)(v13 + 40) = *(unsigned char *)(v14 + 40);
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

uint64_t initializeWithTake for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  long long v13 = v11[2];
  long long v14 = v11[3];
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = *(void *)(a2 + v15);
  v10[2] = v13;
  void v10[3] = v14;
  *(void *)(a1 + v15) = v17;
  long long v18 = (_OWORD *)(a1 + v16);
  long long v19 = *(_OWORD *)(a2 + v16 + 16);
  _OWORD *v18 = *(_OWORD *)(a2 + v16);
  v18[1] = v19;
  *(_OWORD *)((char *)v18 + 25) = *(_OWORD *)(a2 + v16 + 25);
  return a1;
}

uint64_t assignWithTake for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  __swift_destroy_boxed_opaque_existential_1(a1 + v9 + 16);
  long long v12 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v11 + 16);
  *(_OWORD *)(v10 + 32) = v12;
  uint64_t v13 = *(void *)(v11 + 56);
  *(void *)(v10 + 48) = *(void *)(v11 + 48);
  *(void *)(v10 + 56) = v13;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  *(void *)(v15 + 24) = *(void *)(v16 + 24);
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  *(unsigned char *)(v15 + 40) = *(unsigned char *)(v16 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BD5F0BC0);
}

uint64_t sub_1BD5F0BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D7EB4();
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BD5F0C60);
}

void sub_1BD5F0C60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1BD5D7EB4();
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_1BD5F0CE8()
{
  sub_1BD5D7EB4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1BD5F0D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1BD5DCFEC(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_1BD5F0DD4(uint64_t a1)
{
  return sub_1BD5DCFF8(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_1BD5F0DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1BD5DCFEC(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_1BD5DCFF8(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t sub_1BD5F0E4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_1BD5DCFF8(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Fill(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Fill(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 255;
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

uint64_t sub_1BD5F0F10(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1BD5F0F18(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for GridType()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_1BD5F0F40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BD5E1604(*a1, *a2);
}

uint64_t sub_1BD5F0F4C()
{
  return sub_1BD5E171C();
}

uint64_t sub_1BD5F0F54()
{
  return sub_1BD5E1614();
}

UIImage *sub_1BD5F0F6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  char v12 = *((unsigned char *)a2 + 64);
  __swift_project_boxed_opaque_existential_1(v2 + 7, v2[10]);
  uint64_t v13 = OUTLINED_FUNCTION_0_13();
  v14(v13);
  uint64_t v15 = __src[0];
  if (!__src[0]) {
    return 0;
  }
  __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
  uint64_t v16 = *(void *)(a1 + *(int *)(type metadata accessor for ColumnChartModel() + 20));
  __src[0] = v4;
  __src[1] = v5;
  __src[2] = v6;
  __src[3] = v7;
  __src[4] = v8;
  __src[5] = v9;
  __src[6] = v10;
  __src[7] = v11;
  char v21 = v12;
  uint64_t v19 = v15;
  uint64_t v17 = sub_1BD5EC614(v16, a1, __src, &v19);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1BD5F107C(uint64_t a1, const void *a2)
{
  memcpy(__dst, a2, sizeof(__dst));
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 56), *(void *)(v2 + 80));
  uint64_t v3 = OUTLINED_FUNCTION_0_13();
  uint64_t v5 = v4(v3);
  if (v9)
  {
    MEMORY[0x1F4188790](v5);
    sub_1BD5F1588();
    swift_allocObject();
    uint64_t v6 = sub_1BD60A3F0();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    sub_1BD5F153C();
    swift_allocError();
    *uint64_t v8 = 0;
    sub_1BD5F1588();
    swift_allocObject();
    return sub_1BD60A3E0();
  }
}

uint64_t sub_1BD5F11B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v41 = a4;
  uint64_t v42 = a8;
  uint64_t v39 = a6;
  uint64_t v40 = a3;
  uint64_t v37 = a2;
  uint64_t v12 = type metadata accessor for ColumnChartModel();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  long long v17 = *a5;
  long long v35 = a5[1];
  long long v36 = v17;
  uint64_t v18 = *((void *)a5 + 4);
  uint64_t v19 = *((void *)a5 + 5);
  uint64_t v20 = *((void *)a5 + 6);
  uint64_t v21 = *((void *)a5 + 7);
  int v34 = *((unsigned __int8 *)a5 + 64);
  uint64_t v38 = sub_1BD60A240();
  sub_1BD5F162C(a7, (uint64_t)v15);
  unint64_t v22 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v23 = (v22 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v22 + v14 + 79) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v39;
  sub_1BD5F1818((uint64_t)v15, v26 + v22);
  unint64_t v27 = v26 + v23;
  long long v28 = v35;
  *(_OWORD *)unint64_t v27 = v36;
  *(_OWORD *)(v27 + 16) = v28;
  *(void *)(v27 + 32) = v18;
  *(void *)(v27 + 40) = v19;
  *(void *)(v27 + 48) = v20;
  *(void *)(v27 + 56) = v21;
  *(unsigned char *)(v27 + 64) = v34;
  *(void *)(v26 + v24) = v42;
  double v29 = (void *)(v26 + v25);
  uint64_t v30 = v41;
  *double v29 = v40;
  v29[1] = v30;
  double v31 = (uint64_t (**)(uint64_t))(v26 + ((v25 + 23) & 0xFFFFFFFFFFFFFFF8));
  *double v31 = sub_1BD5F1624;
  v31[1] = (uint64_t (*)(uint64_t))v16;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BD60A230();
  return swift_release();
}

void sub_1BD5F13DC(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(void))
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 16), *(void *)(a1 + 40));
  uint64_t v12 = *(void *)(a2 + *(int *)(type metadata accessor for ColumnChartModel() + 20));
  memcpy(__dst, a3, 0x41uLL);
  uint64_t v18 = a4;
  uint64_t v13 = sub_1BD5EC614(v12, a2, __dst, &v18);
  if (v13)
  {
    long long v17 = v13;
    a7();
    uint64_t v14 = v17;
  }
  else
  {
    sub_1BD5F153C();
    uint64_t v15 = swift_allocError();
    *uint64_t v16 = 1;
    a5();
    uint64_t v14 = (void *)v15;
  }
}

uint64_t type metadata accessor for ColumnChartImageLoader()
{
  return self;
}

unint64_t sub_1BD5F153C()
{
  unint64_t result = qword_1E9FC6978;
  if (!qword_1E9FC6978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6978);
  }
  return result;
}

void sub_1BD5F1588()
{
  if (!qword_1EBA19540)
  {
    sub_1BD5D8054();
    unint64_t v0 = sub_1BD60A400();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19540);
    }
  }
}

uint64_t sub_1BD5F15E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BD5F11B4(a1, a2, a3, a4, *(long long **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40));
}

uint64_t sub_1BD5F15EC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD5F1624(uint64_t a1)
{
  return sub_1BD5F5B80(a1, *(uint64_t (**)(uint64_t *))(v1 + 16));
}

uint64_t sub_1BD5F162C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColumnChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD5F1690()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColumnChartModel() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((*(void *)(v1 + 64) + v3 + 79) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v6 = v0 + v3;
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(v6 + *(int *)(v8 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1BD5F1818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColumnChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BD5F187C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColumnChartModel() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = v2 + *(void *)(v1 + 64);
  unint64_t v4 = (v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v3 + 79) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + v5);
  uint64_t v9 = *(void (**)(void))(v0 + v6);
  uint64_t v10 = *(void *)(v0 + v6 + 8);
  uint64_t v11 = *(void (**)(void))(v0 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));

  sub_1BD5F13DC(v7, v0 + v2, (const void *)(v0 + v4), v8, v9, v10, v11);
}

unsigned char *storeEnumTagSinglePayload for ColumnChartImageLoader.ColumnChartImageLoaderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD5F1A04);
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

ValueMetadata *type metadata accessor for ColumnChartImageLoader.ColumnChartImageLoaderError()
{
  return &type metadata for ColumnChartImageLoader.ColumnChartImageLoaderError;
}

unint64_t sub_1BD5F1A40()
{
  unint64_t result = qword_1E9FC6980;
  if (!qword_1E9FC6980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6980);
  }
  return result;
}

TeaCharts::SparklineLayoutAttributes __swiftcall SparklineLayoutAttributes.init(frame:)(TeaCharts::SparklineLayoutAttributes frame)
{
  *uint64_t v1 = frame;
  return frame;
}

ValueMetadata *type metadata accessor for SparklineLayoutAttributes()
{
  return &type metadata for SparklineLayoutAttributes;
}

uint64_t dispatch thunk of ChartSeriesAccessibilityElementProviderType.seriesContainerElement(for:in:chartModel:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t LineChartModel.coordinateSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BD5EFFE4(v1, a1);
}

uint64_t LineChartModel.series.getter()
{
  type metadata accessor for LineChartModel();

  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for LineChartModel()
{
  uint64_t result = qword_1EBA1ACA8;
  if (!qword_1EBA1ACA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LineChartModel.tcAccessibleXAxisTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for LineChartModel() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LineChartModel.tcAccessibleXAxisTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for LineChartModel() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*LineChartModel.tcAccessibleXAxisTitle.modify())(__n128, __n128, __n128, __n128)
{
  return nullsub_1;
}

uint64_t LineChartModel.tcAccessibleYAxisTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for LineChartModel() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LineChartModel.tcAccessibleYAxisTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for LineChartModel() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*LineChartModel.tcAccessibleYAxisTitle.modify())(__n128, __n128, __n128, __n128)
{
  return nullsub_1;
}

uint64_t LineChartModel.marketTimeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LineChartModel() + 32);
  uint64_t v4 = sub_1BD60A130();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t LineChartModel.init(coordinateSpace:series:marketTimeZone:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for LineChartModel();
  uint64_t v9 = (void *)(a4 + v8[6]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (void *)(a4 + v8[7]);
  *uint64_t v10 = 0;
  v10[1] = 0;
  sub_1BD5F01A8(a1, a4);
  *(void *)(a4 + v8[5]) = a2;
  uint64_t v11 = a4 + v8[8];
  uint64_t v12 = sub_1BD60A130();
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32);

  return v13(v11, a3, v12);
}

uint64_t *initializeBufferWithCopyOfBuffer for LineChartModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1BD5D40B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for CategoryAxis();
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 24));
    sub_1BD5D7EB4();
    uint64_t v10 = *(int *)(v9 + 52);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    *(_OWORD *)uint64_t v11 = *(_OWORD *)((char *)a2 + v10);
    uint64_t v31 = (uint64_t)a2 + v10 + 16;
    uint64_t v32 = (uint64_t)a1 + v10 + 16;
    long long v13 = *(_OWORD *)((char *)a2 + v10 + 40);
    *(_OWORD *)(v11 + 40) = v13;
    uint64_t v14 = v13;
    uint64_t v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v32, v31, v14);
    *((void *)v11 + 7) = *((void *)v12 + 7);
    uint64_t v16 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    long long v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *long long v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = a3[7];
    uint64_t v21 = a3[8];
    unint64_t v22 = (uint64_t *)((char *)a1 + v20);
    unint64_t v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *unint64_t v22 = *v23;
    v22[1] = v24;
    unint64_t v25 = (char *)a1 + v21;
    uint64_t v26 = (char *)a2 + v21;
    uint64_t v27 = sub_1BD60A130();
    long long v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for LineChartModel(uint64_t a1, uint64_t a2)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(v5 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = sub_1BD60A130();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t initializeWithCopy for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a2 + v9);
  uint64_t v29 = a2 + v9 + 16;
  uint64_t v30 = a1 + v9 + 16;
  long long v12 = *(_OWORD *)(a2 + v9 + 40);
  *(_OWORD *)(v10 + 40) = v12;
  uint64_t v13 = v12;
  uint64_t v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v30, v29, v13);
  *(void *)(v10 + 56) = *(void *)(v11 + 56);
  uint64_t v15 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v16 = (void *)(a1 + v15);
  long long v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[7];
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v19);
  unint64_t v22 = (void *)(a2 + v19);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a1 + v20;
  uint64_t v25 = a2 + v20;
  uint64_t v26 = sub_1BD60A130();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v24, v25, v26);
  return a1;
}

uint64_t assignWithCopy for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9 + 16), (uint64_t *)(a2 + v9 + 16));
  _OWORD v10[7] = *(void *)(v11 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  long long v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_1BD60A130();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

uint64_t initializeWithTake for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  long long v13 = v11[3];
  v10[2] = v11[2];
  void v10[3] = v13;
  uint64_t v14 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  uint64_t v15 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_1BD60A130();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t assignWithTake for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  __swift_destroy_boxed_opaque_existential_1(a1 + v9 + 16);
  long long v12 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v11 + 16);
  *(_OWORD *)(v10 + 32) = v12;
  uint64_t v13 = *(void *)(v11 + 56);
  *(void *)(v10 + 48) = *(void *)(v11 + 48);
  *(void *)(v10 + 56) = v13;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[8];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = sub_1BD60A130();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for LineChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BD5F27B0);
}

uint64_t sub_1BD5F27B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D7EB4();
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_1BD60A130();
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for LineChartModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BD5F2874);
}

void sub_1BD5F2874(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1BD5D7EB4();
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return;
    }
    uint64_t v10 = sub_1BD60A130();
    uint64_t v11 = a1 + *(int *)(a4 + 32);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_1BD5F2920()
{
  sub_1BD5D7EB4();
  if (v0 <= 0x3F)
  {
    sub_1BD60A130();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

id sub_1BD5F2A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v36 = a3;
  sub_1BD5F5430(0);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3_6(*(void *)((*MEMORY[0x1E4FBC8C8] & *v7) + 0xE8));
  OUTLINED_FUNCTION_3_6(*(void *)(v15 + 240));
  OUTLINED_FUNCTION_3_6(*(void *)(v16 + 248));
  uint64_t v18 = *(void *)(v17 + 256);
  sub_1BD5E2914();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  swift_allocObject();
  uint64_t v19 = v7;
  *(void *)((char *)v7 + v18) = sub_1BD60A290();
  OUTLINED_FUNCTION_1_10();
  uint64_t v21 = *(void *)(v20 + 264);
  uint64_t v22 = type metadata accessor for ColumnChartModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v22);
  sub_1BD5F5464(0, &qword_1EBA19BE0, (uint64_t (*)(uint64_t))sub_1BD5F5430, MEMORY[0x1E4FAAA48]);
  swift_allocObject();
  *(void *)((char *)v19 + v21) = sub_1BD60A290();
  OUTLINED_FUNCTION_1_10();
  *(void *)((char *)v19 + *(void *)(v23 + 176)) = a1;
  OUTLINED_FUNCTION_1_10();
  *(void *)((char *)v19 + *(void *)(v24 + 184)) = a2;
  OUTLINED_FUNCTION_1_10();
  uint64_t v26 = v37;
  *(void *)((char *)v19 + *(void *)(v25 + 192)) = v36;
  OUTLINED_FUNCTION_1_10();
  sub_1BD5D5D9C(v26, (uint64_t)v19 + *(void *)(v27 + 200));
  OUTLINED_FUNCTION_1_10();
  uint64_t v29 = v38;
  sub_1BD5D5D9C(v38, (uint64_t)v19 + *(void *)(v28 + 208));
  OUTLINED_FUNCTION_1_10();
  *(void *)((char *)v19 + *(void *)(v30 + 216)) = a6;
  OUTLINED_FUNCTION_1_10();
  *(void *)((char *)v19 + *(void *)(v31 + 224)) = a7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  sub_1BD5EB9E8();
  v39.receiver = v19;
  v39.super_class = v32;
  id v33 = objc_msgSendSuper2(&v39, sel_initWithNibName_bundle_, 0, 0);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v29);
  __swift_destroy_boxed_opaque_existential_1(v26);
  swift_release();
  swift_release();
  swift_release();
  return v33;
}

id sub_1BD5F2CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v26 = a3;
  sub_1BD5F53FC(0);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)MEMORY[0x1E4FBC8C8];
  *(void *)((char *)v7 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v7) + 0xE8)) = 0;
  *(void *)((char *)v7 + *(void *)((*v15 & *v7) + 0xF0)) = 0;
  *(void *)((char *)v7 + *(void *)((*v15 & *v7) + 0xF8)) = 0;
  uint64_t v16 = *(void *)((*v15 & *v7) + 0x100);
  sub_1BD5E2914();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  swift_allocObject();
  uint64_t v17 = v7;
  *(void *)((char *)v7 + v16) = sub_1BD60A290();
  uint64_t v18 = *(void *)((*v15 & *v17) + 0x108);
  uint64_t v19 = type metadata accessor for LineChartModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v19);
  sub_1BD5F5464(0, &qword_1EBA19510, (uint64_t (*)(uint64_t))sub_1BD5F53FC, MEMORY[0x1E4FAAA48]);
  swift_allocObject();
  *(void *)((char *)v17 + v18) = sub_1BD60A290();
  *(void *)((char *)v17 + *(void *)((*v15 & *v17) + 0xB0)) = a1;
  *(void *)((char *)v17 + *(void *)((*v15 & *v17) + 0xB8)) = a2;
  uint64_t v20 = v27;
  *(void *)((char *)v17 + *(void *)((*v15 & *v17) + 0xC0)) = v26;
  sub_1BD5D5D9C(v20, (uint64_t)v17 + *(void *)((*v15 & *v17) + 0xC8));
  uint64_t v21 = v28;
  sub_1BD5D5D9C(v28, (uint64_t)v17 + *(void *)((*v15 & *v17) + 0xD0));
  *(void *)((char *)v17 + *(void *)((*v15 & *v17) + 0xD8)) = a6;
  *(void *)((char *)v17 + *(void *)((*v15 & *v17) + 0xE0)) = a7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  sub_1BD5F4B38();
  v29.receiver = v17;
  v29.super_class = v22;
  id v23 = objc_msgSendSuper2(&v29, sel_initWithNibName_bundle_, 0, 0);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v21);
  __swift_destroy_boxed_opaque_existential_1(v20);
  swift_release();
  swift_release();
  swift_release();
  return v23;
}

void *sub_1BD5F3078(uint64_t a1)
{
  return sub_1BD5F3090(a1, (uint64_t (*)(void))type metadata accessor for ColumnChartModel);
}

void *sub_1BD5F3090(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2;
  v2[3] = MEMORY[0x1E4FBC860];
  v2[4] = 0;
  char v10 = 0;
  id v6 = objc_allocWithZone((Class)type metadata accessor for TapDragGestureRecognizer());
  v2[5] = sub_1BD5F93D0(&v10);
  v2[6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1968]), sel_init);
  v2[7] = 0;
  uint64_t v7 = (uint64_t)v4 + *(void *)(*v4 + 144);
  uint64_t v8 = a2(0);
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  v4[2] = a1;
  objc_msgSend((id)v4[5], sel_addTarget_action_, v4, sel_handleGestureWithGesture_);
  return v4;
}

uint64_t sub_1BD5F316C()
{
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  sub_1BD5F4B38();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for LineChartViewProvider();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for LineSeriesAccessibilityElementProvider();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  OUTLINED_FUNCTION_1_7();
  sub_1BD5F4E04();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1B528);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5F54C8(0, &qword_1EBA1AC00, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(void, uint64_t))type metadata accessor for StyleManager);
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A250();
  type metadata accessor for LineChartCoordinateProvider();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for LineChartRenderer();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B318);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, qword_1EBA1B490);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_1_7();
  sub_1BD5EBC88();
  OUTLINED_FUNCTION_5_2();
  sub_1BD60A390();
  swift_release();
  swift_release();
  sub_1BD60A260();
  OUTLINED_FUNCTION_5_2();
  sub_1BD60A390();
  swift_release();
  swift_release();
  sub_1BD60A260();
  type metadata accessor for LineChartInteractor();
  OUTLINED_FUNCTION_0_9();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B5F8);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A260();
  sub_1BD5DB530(0, &qword_1EBA1B5F0);
  OUTLINED_FUNCTION_0_3();
  swift_release();

  return swift_release();
}

id sub_1BD5F3554(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartViewProvider();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartCoordinateProvider();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v4 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5F54C8(0, &qword_1EBA1AC00, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(void, uint64_t))type metadata accessor for StyleManager);
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1BA80);
  id result = (id)sub_1BD60A200();
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v6 = type metadata accessor for GridViewProvider();
  id result = (id)sub_1BD60A1F0();
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  void v11[3] = v6;
  v11[4] = &protocol witness table for GridViewProvider;
  v11[0] = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5EBC88();
  id result = (id)sub_1BD60A1D0();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5F4E04();
  id result = (id)sub_1BD60A1D0();
  if (result)
  {
    uint64_t v8 = (uint64_t)result;
    sub_1BD5F4B38();
    id v10 = objc_allocWithZone(v9);
    return sub_1BD5F2CF4(v3, v4, v5, (uint64_t)v12, (uint64_t)v11, v7, v8);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1BD5F37C4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v2 = type metadata accessor for LineChartRenderer();
  uint64_t result = sub_1BD60A1F0();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v39 = v2;
  long long v40 = &off_1F17FE278;
  v38[0] = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B318);
  uint64_t result = sub_1BD60A200();
  if (!v37)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5D5ED8();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v38, v39);
    void v31[2] = v31;
    double v6 = MEMORY[0x1F4188790](v5);
    uint64_t v8 = (void *)((char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v9 + 16))(v8, v6);
    uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
    v31[1] = v31;
    double v11 = MEMORY[0x1F4188790](v10);
    uint64_t v13 = (void *)((char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v14 + 16))(v13, v11);
    uint64_t v15 = *v8;
    uint64_t v16 = *v13;
    v35[3] = v2;
    v35[4] = &off_1F17FE278;
    v35[0] = v15;
    uint64_t v17 = type metadata accessor for LineChartStyler();
    uint64_t v33 = v17;
    long long v34 = &off_1F17FF0D8;
    v32[0] = v16;
    type metadata accessor for LineChartViewProvider();
    uint64_t v18 = (void *)swift_allocObject();
    uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v2);
    double v20 = MEMORY[0x1F4188790](v19);
    uint64_t v22 = (void *)((char *)v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v23 + 16))(v22, v20);
    uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v33);
    double v25 = MEMORY[0x1F4188790](v24);
    uint64_t v27 = (void *)((char *)v31 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v28 + 16))(v27, v25);
    uint64_t v29 = *v22;
    uint64_t v30 = *v27;
    void v18[5] = v2;
    v18[6] = &off_1F17FE278;
    v18[2] = v29;
    v18[10] = v17;
    v18[11] = &off_1F17FF0D8;
    v18[12] = v4;
    v18[7] = v30;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    return (uint64_t)v18;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1BD5F3BF4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartInteractor();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for LineSeriesAccessibilityElementProvider();
    swift_allocObject();
    return sub_1BD5F7D50(v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5F3C70@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, qword_1EBA1B490);
  uint64_t result = sub_1BD60A200();
  if (v21)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
    double v5 = MEMORY[0x1F4188790](v4);
    uint64_t v7 = (void *)((char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v8 + 16))(v7, v5);
    uint64_t v9 = *v7;
    uint64_t v10 = type metadata accessor for LinePathGenerator();
    v19[3] = v10;
    v19[4] = &off_1F17FF7D0;
    v19[0] = v9;
    uint64_t v11 = type metadata accessor for LineImageGenerator();
    uint64_t v12 = (void *)swift_allocObject();
    uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v10);
    double v14 = MEMORY[0x1F4188790](v13);
    uint64_t v16 = (void *)((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v17 + 16))(v16, v14);
    uint64_t v18 = *v16;
    v12[5] = v10;
    v12[6] = &off_1F17FF7D0;
    v12[2] = v18;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    a2[3] = v11;
    a2[4] = &off_1F17FDD68;
    *a2 = v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5F3E98()
{
  sub_1BD5F54C8(0, &qword_1EBA1AC00, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(void, uint64_t))type metadata accessor for StyleManager);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_1BD5F3EE8(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B9C0);
  uint64_t result = sub_1BD60A200();
  if (v6)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1BA78);
    uint64_t result = sub_1BD60A200();
    if (v4)
    {
      type metadata accessor for LineChartCoordinateProvider();
      swift_allocObject();
      return sub_1BD608E5C(&v5, &v3);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5F3FD0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B5F0);
  uint64_t result = sub_1BD60A200();
  if (!v27)
  {
    __break(1u);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B318);
  uint64_t result = sub_1BD60A200();
  if (!v25)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B5F8);
  uint64_t result = sub_1BD60A200();
  if (!v23)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1AA08);
  uint64_t result = sub_1BD60A1E0();
  if (!v21)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineSeriesAccessibilityElementProvider();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    double v5 = MEMORY[0x1F4188790](v4);
    uint64_t v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v8 + 16))(v7, v5);
    uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
    double v10 = MEMORY[0x1F4188790](v9);
    uint64_t v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v13 + 16))(v12, v10);
    uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
    double v15 = MEMORY[0x1F4188790](v14);
    uint64_t v17 = (uint64_t *)((char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v18 + 16))(v17, v15);
    uint64_t v19 = sub_1BD5F507C(*v7, *v12, *v17, &v20, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return v19;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1BD5F43AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5F54C8(0, &qword_1EBA1AC00, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(void, uint64_t))type metadata accessor for StyleManager);
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = type metadata accessor for LineChartStyler();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    a2[3] = v5;
    a2[4] = (uint64_t)&off_1F17FF0D8;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5F4458@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BD5F4478(a1, (uint64_t (*)(uint64_t))type metadata accessor for LinePathGenerator, (uint64_t)&off_1F17FF7D0, a2);
}

uint64_t sub_1BD5F4478@<X0>(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartCoordinateProvider();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v9 = OUTLINED_FUNCTION_1_7();
    uint64_t v10 = a2(v9);
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v7;
    a4[3] = v10;
    a4[4] = a3;
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5F4508(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartInteractor();
  uint64_t result = sub_1BD60A1F0();
  if (result)
  {
    uint64_t v2 = result;
    sub_1BD5F4E04();
    uint64_t v3 = swift_allocObject();
    sub_1BD5F4EFC();
    swift_allocObject();
    *(void *)(v3 + 16) = sub_1BD5F3090(v2, (uint64_t (*)(void))type metadata accessor for LineChartModel);
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD5F45B4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1BA78);
  uint64_t result = sub_1BD60A200();
  if (v7)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1B9C0);
    uint64_t result = sub_1BD60A200();
    if (v5)
    {
      type metadata accessor for LineChartInteractor();
      uint64_t v3 = swift_allocObject();
      sub_1BD5DBA08(&v6, v3 + 16);
      sub_1BD5DBA08(&v4, v3 + 56);
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5F46AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BD5F4478(a1, (uint64_t (*)(uint64_t))type metadata accessor for LineZoneMaskProvider, (uint64_t)&off_1F17FFF38, a2);
}

uint64_t sub_1BD5F46CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B528);
  uint64_t result = sub_1BD60A200();
  if (v41)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BD5DB530(0, &qword_1EBA1B318);
    uint64_t result = sub_1BD60A200();
    if (v39)
    {
      uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v40, v41);
      v33[2] = v33;
      double v6 = MEMORY[0x1F4188790](v5);
      uint64_t v8 = (void *)((char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v9 + 16))(v8, v6);
      uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v38, v39);
      v33[1] = v33;
      double v11 = MEMORY[0x1F4188790](v10);
      uint64_t v13 = (void *)((char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v14 + 16))(v13, v11);
      uint64_t v15 = *v8;
      uint64_t v16 = *v13;
      uint64_t v17 = type metadata accessor for LineImageGenerator();
      v37[3] = v17;
      v37[4] = &off_1F17FDD68;
      v37[0] = v15;
      uint64_t v18 = type metadata accessor for LineChartStyler();
      uint64_t v35 = v18;
      long long v36 = &off_1F17FF0D8;
      v34[0] = v16;
      uint64_t v19 = type metadata accessor for LineChartImageLoader();
      long long v20 = (void *)swift_allocObject();
      uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v17);
      double v22 = MEMORY[0x1F4188790](v21);
      uint64_t v24 = (void *)((char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v25 + 16))(v24, v22);
      uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
      double v27 = MEMORY[0x1F4188790](v26);
      uint64_t v29 = (void *)((char *)v33 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *, double))(v30 + 16))(v29, v27);
      uint64_t v31 = *v24;
      uint64_t v32 = *v29;
      v20[5] = v17;
      v20[6] = &off_1F17FDD68;
      v20[2] = v31;
      v20[10] = v18;
      v20[11] = &off_1F17FF0D8;
      v20[7] = v32;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
      a2[3] = v19;
      a2[4] = &off_1F17FDE58;
      *a2 = v20;
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

uint64_t type metadata accessor for LineChartAssembly()
{
  return self;
}

uint64_t sub_1BD5F4B20()
{
  return sub_1BD5F316C();
}

void sub_1BD5F4B38()
{
  if (!qword_1EBA1B258)
  {
    sub_1BD5F4D70();
    type metadata accessor for LineChartViewProvider();
    type metadata accessor for LineChartCoordinateProvider();
    sub_1BD5F54C8(255, &qword_1EBA1AC00, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(void, uint64_t))type metadata accessor for StyleManager);
    sub_1BD5EBC88();
    sub_1BD5F4E04();
    sub_1BD5F5514(&qword_1EBA1B050, (void (*)(uint64_t))sub_1BD5F4D70);
    sub_1BD5F5514(&qword_1EBA1B3D8, (void (*)(uint64_t))type metadata accessor for LineChartViewProvider);
    sub_1BD5F5514(&qword_1EBA1B750, (void (*)(uint64_t))type metadata accessor for LineChartCoordinateProvider);
    sub_1BD5F4E98(&qword_1EBA1ABF8, &qword_1EBA1AC00, (uint64_t)&type metadata for LineChartStyle);
    sub_1BD5F5514(&qword_1EBA1B518, (void (*)(uint64_t))sub_1BD5EBC88);
    sub_1BD5F5514(&qword_1EBA1B1B8, (void (*)(uint64_t))sub_1BD5F4E04);
    unint64_t v0 = type metadata accessor for ChartViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1B258);
    }
  }
}

void sub_1BD5F4D70()
{
  if (!qword_1EBA1B058)
  {
    type metadata accessor for LineChartModel();
    sub_1BD5F5514((unint64_t *)&qword_1EBA1ACA0, (void (*)(uint64_t))type metadata accessor for LineChartModel);
    unint64_t v0 = type metadata accessor for ChartModelFactory();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1B058);
    }
  }
}

void sub_1BD5F4E04()
{
  if (!qword_1EBA1B1C0)
  {
    type metadata accessor for LineChartInteractor();
    sub_1BD5F5514(&qword_1EBA1B268, (void (*)(uint64_t))type metadata accessor for LineChartInteractor);
    unint64_t v0 = type metadata accessor for InteractionManager();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1B1C0);
    }
  }
}

uint64_t sub_1BD5F4E98(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BD5F54C8(255, a2, a3, (uint64_t (*)(void, uint64_t))type metadata accessor for StyleManager);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BD5F4EFC()
{
  if (!qword_1EBA197F0)
  {
    type metadata accessor for LineChartInteractor();
    sub_1BD5F5514(&qword_1EBA1B268, (void (*)(uint64_t))type metadata accessor for LineChartInteractor);
    unint64_t v0 = type metadata accessor for MultiTouchInteractionManager();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA197F0);
    }
  }
}

uint64_t sub_1BD5F4F90(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v20 = type metadata accessor for LineChartImageLoader();
  uint64_t v21 = &off_1F17FDE58;
  *(void *)&long long v19 = a1;
  uint64_t v17 = type metadata accessor for LineChartStyler();
  uint64_t v18 = &off_1F17FF0D8;
  *(void *)&long long v16 = a2;
  uint64_t v14 = type metadata accessor for LineZoneMaskProvider();
  uint64_t v15 = &off_1F17FFF38;
  *(void *)&long long v13 = a3;
  sub_1BD5F5330();
  swift_allocObject();
  *(void *)(a6 + 176) = sub_1BD60A370();
  sub_1BD5DBA08(&v19, a6 + 16);
  sub_1BD5DBA08(&v16, a6 + 56);
  sub_1BD5DBA08(&v13, a6 + 96);
  sub_1BD5DBA08(a4, a6 + 136);
  *(void *)(a6 + 184) = a5;
  return a6;
}

uint64_t sub_1BD5F507C(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5)
{
  uint64_t v36 = type metadata accessor for LineChartImageLoader();
  uint64_t v37 = &off_1F17FDE58;
  v35[0] = a1;
  uint64_t v33 = type metadata accessor for LineChartStyler();
  long long v34 = &off_1F17FF0D8;
  v32[0] = a2;
  uint64_t v30 = type metadata accessor for LineZoneMaskProvider();
  uint64_t v31 = &off_1F17FFF38;
  v29[0] = a3;
  type metadata accessor for LineChartRenderer();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v36);
  double v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (void *)((char *)&v29[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v15 + 16))(v14, v12);
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v33);
  double v17 = MEMORY[0x1F4188790](v16);
  long long v19 = (void *)((char *)&v29[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v20 + 16))(v19, v17);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
  double v22 = MEMORY[0x1F4188790](v21);
  uint64_t v24 = (void *)((char *)&v29[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v25 + 16))(v24, v22);
  uint64_t v26 = sub_1BD5F4F90(*v14, *v19, *v24, a4, a5, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return v26;
}

void sub_1BD5F5330()
{
  if (!qword_1EBA19530)
  {
    sub_1BD5F53BC();
    sub_1BD5F54C8(255, &qword_1EBA199E0, (uint64_t)&type metadata for LineChartImages, MEMORY[0x1E4FBB320]);
    unint64_t v0 = sub_1BD60A380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19530);
    }
  }
}

unint64_t sub_1BD5F53BC()
{
  unint64_t result = qword_1EBA1BC68;
  if (!qword_1EBA1BC68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA1BC68);
  }
  return result;
}

void sub_1BD5F53FC(uint64_t a1)
{
}

void sub_1BD5F5430(uint64_t a1)
{
}

void sub_1BD5F5464(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1BD5F54C8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1BD5F5514(unint64_t *a1, void (*a2)(uint64_t))
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

id ColumnChartView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void ColumnChartView.init(coder:)()
{
  uint64_t v1 = OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView;
  id v2 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  double v3 = OUTLINED_FUNCTION_0_6();
  *(void *)&v0[v1] = objc_msgSend(v4, v5, v3);

  sub_1BD60AA00();
  __break(1u);
}

char *sub_1BD5F5650()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView;
  id v3 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v4 = v0;
  double v5 = OUTLINED_FUNCTION_0_6();
  *(void *)&v0[v2] = objc_msgSend(v3, v6, v5);

  double v7 = OUTLINED_FUNCTION_0_6();
  uint64_t v10 = (char *)objc_msgSendSuper2(v8, v9, v7, v4, ObjectType);
  objc_msgSend(v10, sel_addSubview_, *(void *)&v10[OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView]);
  return v10;
}

Swift::Void __swiftcall ColumnChartView.layoutSubviews()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

id ColumnChartView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ColumnChartView.init(frame:)()
{
}

id ColumnChartView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ColumnChartView()
{
  return self;
}

uint64_t sub_1BD5F58EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    *a1 = v4;
  }
  else
  {
    sub_1BD5F5B08();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1BD60D290;
    if (qword_1E9FC6800 != -1) {
      swift_once();
    }
    *(void *)(v5 + 32) = qword_1E9FC6B00;
    sub_1BD60A5B0();
    *a1 = v5;
    swift_retain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BD5F59C4(uint64_t a1)
{
  sub_1BD5F58EC((uint64_t *)&v7);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1BD60AA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v2 <= a1)
  {
    if (qword_1E9FC6800 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_1E9FC6B00;
    swift_retain();
  }
  else
  {
    sub_1BD5F58EC((uint64_t *)&v7);
    unint64_t v3 = v7;
    unint64_t v4 = v7 & 0xC000000000000001;
    sub_1BD600AA8(a1, (v7 & 0xC000000000000001) == 0, v7);
    if (v4)
    {
      uint64_t v5 = MEMORY[0x1C187E170](a1, v3);
    }
    else
    {
      uint64_t v5 = *(void *)(v3 + 8 * a1 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t type metadata accessor for LineChartStyler()
{
  return self;
}

void sub_1BD5F5B08()
{
  if (!qword_1EBA1A9F0)
  {
    unint64_t v0 = sub_1BD60AAD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1A9F0);
    }
  }
}

uint64_t dispatch thunk of SparklineLoaderType.generateSparkline(for:style:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SparklineLoaderType.sparkline(for:style:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_1BD5F5B80(uint64_t a1, uint64_t (*a2)(uint64_t *))
{
  uint64_t v3 = a1;
  return a2(&v3);
}

uint64_t sub_1BD5F5BB8()
{
  return sub_1BD60AB80();
}

uint64_t sub_1BD5F5BE0()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5F5C24()
{
  return 1;
}

uint64_t sub_1BD5F5C34()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD5F5C74()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t type metadata accessor for SparklineLoader()
{
  return self;
}

uint64_t sub_1BD5F5CD8(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v5 = *(void *)(a2 + 16);
  double v6 = *a3;
  double v7 = a3[1];
  CGFloat v8 = a3[2];
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  sub_1BD5D4638(a1, v13, v6, v7);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  type metadata accessor for SparklineModel();
  swift_bridgeObjectRetain();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_1BD5D415C(v6, v7, v8, v9, (uint64_t)&v12, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

uint64_t sub_1BD5F5DB8()
{
  return sub_1BD60A3F0();
}

uint64_t sub_1BD5F5E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, uint64_t a12)
{
  uint64_t v47 = a7;
  uint64_t v48 = a8;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v45 = a2;
  uint64_t v46 = a12;
  uint64_t v53 = sub_1BD60A480();
  uint64_t v56 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v52 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1BD60A4A0();
  uint64_t v54 = *(void *)(v20 - 8);
  uint64_t v55 = v20;
  MEMORY[0x1F4188790](v20);
  double v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for SparklineModel();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 64);
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v26 = (char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a1;
  *(void *)(v27 + 24) = a2;
  uint64_t v51 = *(void *)(a5 + 56);
  uint64_t v28 = a5;
  sub_1BD5F6478(a6, (uint64_t)v26);
  unint64_t v29 = (*(unsigned __int8 *)(v24 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v30 = (v25 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (v30 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v31 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v28;
  sub_1BD5F6684((uint64_t)v26, v34 + v29);
  uint64_t v35 = (void *)(v34 + v30);
  uint64_t v36 = v48;
  void *v35 = v47;
  v35[1] = v36;
  v35[2] = v46;
  uint64_t v37 = (double *)(v34 + v31);
  *uint64_t v37 = a9;
  v37[1] = a10;
  v37[2] = a11;
  uint64_t v38 = (void *)(v34 + v32);
  uint64_t v39 = v50;
  *uint64_t v38 = v49;
  v38[1] = v39;
  long long v40 = (uint64_t (**)(uint64_t))(v34 + v33);
  void *v40 = sub_1BD5D7C3C;
  v40[1] = (uint64_t (*)(uint64_t))v27;
  aBlock[4] = sub_1BD5F66E8;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BD5F637C;
  aBlock[3] = &block_descriptor_1;
  uint64_t v41 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1BD60A490();
  uint64_t v57 = MEMORY[0x1E4FBC860];
  sub_1BD5F67B4();
  sub_1BD5F6804(0, &qword_1EBA199D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1BD5F6868();
  long long v43 = v52;
  uint64_t v42 = v53;
  sub_1BD60A800();
  MEMORY[0x1C187DFA0](0, v22, v43, v41);
  _Block_release(v41);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v43, v42);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v22, v55);
  return swift_release();
}

void sub_1BD5F6290(double a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void), uint64_t a10, void (*a11)(void))
{
  v18[0] = a6;
  v18[1] = a7;
  v18[2] = a8;
  v17[0] = a1;
  v17[1] = a2;
  void v17[2] = a3;
  uint64_t v13 = sub_1BD5F5CD8(a5, (uint64_t)v18, v17);
  if (v13)
  {
    id v16 = (id)v13;
    a11();
    uint64_t v14 = v16;
  }
  else
  {
    sub_1BD5F68E8();
    uint64_t v15 = swift_allocError();
    a9();
    uint64_t v14 = (void *)v15;
  }
}

uint64_t sub_1BD5F637C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1BD5F63C0(uint64_t a1, uint64_t a2, double *a3)
{
  return sub_1BD5F5CD8(a1, a2, a3);
}

uint64_t sub_1BD5F63E4()
{
  return sub_1BD5F5DB8();
}

uint64_t sub_1BD5F6408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BD5F5E64(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(double *)(v4 + 56), *(double *)(v4 + 64), *(double *)(v4 + 72), *(void *)(v4 + 48));
}

uint64_t sub_1BD5F6440()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD5F6478(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SparklineModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD5F64DC()
{
  uint64_t v1 = *(void *)(type metadata accessor for SparklineModel() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v6 = v0 + v3;
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(v6 + *(int *)(v8 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1BD5F6684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SparklineModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BD5F66E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for SparklineModel() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 31) & 0xFFFFFFFFFFFFFFF8;
  sub_1BD5F6290(*(double *)(v0 + v4), *(double *)(v0 + v4 + 8), *(double *)(v0 + v4 + 16), *(void *)(v0 + 16), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + v3 + 8), *(void *)(v0 + v3 + 16), *(void (**)(void))(v0 + ((v4 + 31) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v4 + 31) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(void))(v0 + ((((v4 + 31) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

unint64_t sub_1BD5F67B4()
{
  unint64_t result = qword_1EBA19548;
  if (!qword_1EBA19548)
  {
    sub_1BD60A480();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA19548);
  }
  return result;
}

void sub_1BD5F6804(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1BD5F6868()
{
  unint64_t result = qword_1EBA199D8;
  if (!qword_1EBA199D8)
  {
    sub_1BD5F6804(255, &qword_1EBA199D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA199D8);
  }
  return result;
}

unint64_t sub_1BD5F68E8()
{
  unint64_t result = qword_1E9FC6990;
  if (!qword_1E9FC6990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6990);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SparklineLoader.SparklineLoaderError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SparklineLoader.SparklineLoaderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BD5F6A24);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SparklineLoader.SparklineLoaderError()
{
  return &type metadata for SparklineLoader.SparklineLoaderError;
}

unint64_t sub_1BD5F6A60()
{
  unint64_t result = qword_1E9FC6998;
  if (!qword_1E9FC6998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6998);
  }
  return result;
}

uint64_t destroy for GridSetLayoutAttributes()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GridSetLayoutAttributes(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GridSetLayoutAttributes(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for GridSetLayoutAttributes(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GridSetLayoutAttributes(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 64);
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

uint64_t storeEnumTagSinglePayload for GridSetLayoutAttributes(uint64_t result, int a2, int a3)
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridSetLayoutAttributes()
{
  return &type metadata for GridSetLayoutAttributes;
}

uint64_t SparklineModel.coordinateSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BD5EFFE4(v1, a1);
}

uint64_t SparklineModel.series.getter@<X0>(void *a1@<X8>)
{
  long long v3 = (void *)(v1 + *(int *)(type metadata accessor for SparklineModel() + 20));
  uint64_t v4 = v3[1];
  uint64_t v5 = v3[2];
  *a1 = *v3;
  a1[1] = v4;
  a1[2] = v5;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SparklineModel()
{
  uint64_t result = qword_1EBA19C08;
  if (!qword_1EBA19C08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

__n128 SparklineModel.init(coordinateSpace:series:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a2;
  sub_1BD5F01A8(a1, a3);
  uint64_t v6 = a3 + *(int *)(type metadata accessor for SparklineModel() + 20);
  *(void *)uint64_t v6 = v5;
  __n128 result = *(__n128 *)(a2 + 1);
  *(__n128 *)(v6 + 8) = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SparklineModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1BD5D40B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for CategoryAxis();
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 24));
    sub_1BD5D7EB4();
    uint64_t v10 = *(int *)(v9 + 52);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    *(_OWORD *)uint64_t v11 = *(_OWORD *)((char *)a2 + v10);
    uint64_t v22 = (uint64_t)a2 + v10 + 16;
    uint64_t v23 = (uint64_t)a1 + v10 + 16;
    long long v13 = *(_OWORD *)((char *)a2 + v10 + 40);
    *(_OWORD *)(v11 + 40) = v13;
    uint64_t v14 = v13;
    uint64_t v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v23, v22, v14);
    *((void *)v11 + 7) = *((void *)v12 + 7);
    uint64_t v16 = *(int *)(a3 + 20);
    double v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *double v17 = *v18;
    v17[1] = v19;
    void v17[2] = v18[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SparklineModel(uint64_t a1)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(v3 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  uint64_t v6 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v6 + 20)) = *(void *)(a2 + *(int *)(v6 + 20));
  *(void *)(a1 + *(int *)(v6 + 24)) = *(void *)(a2 + *(int *)(v6 + 24));
  sub_1BD5D7EB4();
  uint64_t v8 = *(int *)(v7 + 52);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)(a2 + v8);
  uint64_t v20 = a1 + v8 + 16;
  uint64_t v11 = a2 + v8 + 16;
  long long v12 = *(_OWORD *)(a2 + v8 + 40);
  *(_OWORD *)(v9 + 40) = v12;
  uint64_t v13 = v12;
  uint64_t v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v20, v11, v13);
  *(void *)(v9 + 56) = *(void *)(v10 + 56);
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (void *)(a1 + v15);
  double v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  v16[2] = v17[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9 + 16), (uint64_t *)(a2 + v9 + 16));
  _OWORD v10[7] = *(void *)(v11 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  *uint64_t v13 = *(void *)(a2 + v12);
  v13[1] = *(void *)(a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[2] = *(void *)(v14 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  long long v13 = v11[3];
  v10[2] = v11[2];
  void v10[3] = v13;
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  return a1;
}

uint64_t assignWithTake for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D40B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CategoryAxis();
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v7 + 24)) = *(void *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRelease();
  sub_1BD5D7EB4();
  uint64_t v9 = *(int *)(v8 + 52);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  __swift_destroy_boxed_opaque_existential_1(a1 + v9 + 16);
  long long v12 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v11 + 16);
  *(_OWORD *)(v10 + 32) = v12;
  uint64_t v13 = *(void *)(v11 + 56);
  *(void *)(v10 + 48) = *(void *)(v11 + 48);
  *(void *)(v10 + 56) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  v15[2] = v16[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BD5F7508);
}

uint64_t sub_1BD5F7508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BD5D7EB4();
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BD5F75AC);
}

void sub_1BD5F75AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1BD5D7EB4();
  OUTLINED_FUNCTION_0_11();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

void sub_1BD5F7638()
{
  sub_1BD5D7EB4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

id SparklineView.imageView.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView);
}

id SparklineView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void SparklineView.init(coder:)()
{
}

id SparklineView.__allocating_init(frame:)()
{
  OUTLINED_FUNCTION_1_11();
  id v1 = objc_allocWithZone(v0);
  double v4 = OUTLINED_FUNCTION_0_14();

  return objc_msgSend(v2, v3, v4);
}

id SparklineView.init(frame:)()
{
  OUTLINED_FUNCTION_1_11();
  uint64_t ObjectType = swift_getObjectType();
  id v2 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v3 = v0;
  double v4 = OUTLINED_FUNCTION_0_14();
  id v7 = objc_msgSend(v5, v6, v4);
  *(void *)&v3[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView] = v7;
  id v8 = v7;

  double v9 = OUTLINED_FUNCTION_0_14();
  id v12 = objc_msgSendSuper2(v10, v11, v9, v3, ObjectType);
  objc_msgSend(v12, sel_addSubview_, v8);

  return v12;
}

Swift::Void __swiftcall SparklineView.layoutSubviews()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

id SparklineView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SparklineView()
{
  return self;
}

Swift::Void __swiftcall LineSeriesAccessibilityElementProvider.clearElements()()
{
}

id LineSeriesAccessibilityElementProvider.seriesContainerElement(for:in:chartModel:)(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for LineChartModel();
  MEMORY[0x1F4188790](v7);
  double v9 = (char *)&v23[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v3 + 24);
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_1BD5ED604(a1), (v12 & 1) != 0))
  {
    uint64_t v22 = *(void **)(*(void *)(v10 + 56) + 8 * v11);
    swift_endAccess();
    uint64_t v13 = v22;
    return v13;
  }
  else
  {
    id result = (id)swift_endAccess();
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v15 = *(void *)(a3 + *(int *)(v7 + 20));
      if (*(void *)(v15 + 16) > a1)
      {
        uint64_t v16 = (void *)(v15 + 24 * a1);
        uint64_t v17 = v16[5];
        uint64_t v18 = v16[6];
        v23[0] = v16[4];
        v23[1] = v17;
        v23[2] = v18;
        sub_1BD5D7C7C(a3, (uint64_t)v9);
        objc_allocWithZone((Class)type metadata accessor for LineSeriesAccessibilityElement());
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v19 = a2;
        swift_retain();
        id v20 = sub_1BD5FE868(v19, v23, (uint64_t)v9);
        swift_beginAccess();
        id v21 = v20;
        sub_1BD5F7E30((uint64_t)v21, a1);
        swift_endAccess();
        return v21;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t LineSeriesAccessibilityElementProvider.currentZone.getter@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v2 = OUTLINED_FUNCTION_0_15();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_1BD5E0F0C(v2, v3);
}

uint64_t LineSeriesAccessibilityElementProvider.currentZone.setter(long long *a1)
{
  uint64_t v2 = *((void *)a1 + 2);
  long long v7 = *(long long *)((char *)a1 + 24);
  long long v8 = *a1;
  uint64_t v3 = *((void *)a1 + 5);
  swift_beginAccess();
  uint64_t v4 = OUTLINED_FUNCTION_0_15();
  *(_OWORD *)(v1 + 32) = v8;
  *(void *)(v1 + 48) = v2;
  *(_OWORD *)(v1 + 56) = v7;
  *(void *)(v1 + 72) = v3;
  return sub_1BD5E0F5C(v4, v5);
}

uint64_t (*LineSeriesAccessibilityElementProvider.currentZone.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_1BD5F7D50(uint64_t a1)
{
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  uint64_t v2 = MEMORY[0x1E4FBC868];
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = v2;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  sub_1BD5E0F5C(v3, v4);
  return v1;
}

uint64_t LineSeriesAccessibilityElementProvider.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = OUTLINED_FUNCTION_0_15();
  sub_1BD5E0F5C(v1, v2);
  return v0;
}

uint64_t LineSeriesAccessibilityElementProvider.__deallocating_deinit()
{
  LineSeriesAccessibilityElementProvider.deinit();

  return MEMORY[0x1F4186488](v0, 80, 7);
}

uint64_t sub_1BD5F7E30(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1BD5F7FD4(a1, a2);
  *uint64_t v2 = v6;

  return swift_bridgeObjectRelease();
}

void sub_1BD5F7EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  long long v8 = (void *)*v3;
  unint64_t v9 = sub_1BD5ED34C();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_1BD5F8234();
  if ((sub_1BD60A9D0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1BD5ED34C();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_1BD60AB10();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1BD5F80FC(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

void sub_1BD5F7FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_1BD5ED604(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  sub_1BD5F81C4(0, &qword_1EBA19BD8, MEMORY[0x1E4FBBCB8]);
  if ((sub_1BD60A9D0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_1BD5ED604(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    sub_1BD60AB10();
    __break(1u);
    return;
  }
  unint64_t v9 = v11;
LABEL_5:
  unint64_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];

    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_1BD5F8144(v9, a2, a1, v13);
  }
}

unint64_t sub_1BD5F80FC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

unint64_t sub_1BD5F8144(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
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

uint64_t type metadata accessor for LineSeriesAccessibilityElementProvider()
{
  return self;
}

uint64_t method lookup function for LineSeriesAccessibilityElementProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineSeriesAccessibilityElementProvider);
}

void sub_1BD5F81C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for LineSeriesAccessibilityElement();
    unint64_t v7 = a3(a1, MEMORY[0x1E4FBB550], v6, MEMORY[0x1E4FBB560]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_1BD5F8234()
{
  if (!qword_1EBA19BC8)
  {
    sub_1BD5F829C();
    unint64_t v0 = sub_1BD60A9F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19BC8);
    }
  }
}

unint64_t sub_1BD5F829C()
{
  unint64_t result = qword_1EBA1A790;
  if (!qword_1EBA1A790)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA1A790);
  }
  return result;
}

ValueMetadata *type metadata accessor for SparklineLayoutOptions()
{
  return &type metadata for SparklineLayoutOptions;
}

uint64_t CategoryZone.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall CategoryZone.init(identifier:from:to:)(TeaCharts::CategoryZone *__return_ptr retstr, Swift::String identifier, Swift::String from, Swift::String to)
{
  retstr->identifier = identifier;
  retstr->fromCategory = from;
  retstr->toCategory = to;
}

uint64_t static CategoryZone.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  BOOL v10 = *a1 == *a2 && a1[1] == a2[1];
  if (v10 || (v11 = sub_1BD60AAF0(), uint64_t result = 0, (v11 & 1) != 0))
  {
    BOOL v13 = v2 == v6 && v4 == v7;
    if (v13 || (v14 = sub_1BD60AAF0(), uint64_t result = 0, (v14 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
      {
        return 1;
      }
      else
      {
        return sub_1BD60AAF0();
      }
    }
  }
  return result;
}

unint64_t sub_1BD5F8420(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BD5D5D04();
  unint64_t result = sub_1BD5D5D50();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t destroy for CategoryZone()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CategoryZone(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CategoryZone(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for CategoryZone(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CategoryZone(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for CategoryZone(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for CategoryZone()
{
  return &type metadata for CategoryZone;
}

void sub_1BD5F868C(uint64_t a1, char *a2, void *a3)
{
  uint64_t v4 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BD60A840();
    sub_1BD5FAC34();
    sub_1BD5FAC74();
    sub_1BD60A670();
    uint64_t v4 = v28;
    uint64_t v25 = v29;
    uint64_t v6 = v30;
    int64_t v5 = v31;
    unint64_t v7 = v32;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v25 = a1 + 56;
    uint64_t v6 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v5 = 0;
  }
  int64_t v24 = (unint64_t)(v6 + 64) >> 6;
  if (v4 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v7)
    {
      uint64_t v11 = (v7 - 1) & v7;
      unint64_t v12 = __clz(__rbit64(v7)) | (v5 << 6);
      int64_t v13 = v5;
      goto LABEL_29;
    }
    int64_t v16 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v16 >= v24) {
      goto LABEL_38;
    }
    unint64_t v17 = *(void *)(v25 + 8 * v16);
    int64_t v13 = v5 + 1;
    if (!v17)
    {
      int64_t v13 = v5 + 2;
      if (v5 + 2 >= v24) {
        goto LABEL_38;
      }
      unint64_t v17 = *(void *)(v25 + 8 * v13);
      if (!v17)
      {
        int64_t v13 = v5 + 3;
        if (v5 + 3 >= v24) {
          goto LABEL_38;
        }
        unint64_t v17 = *(void *)(v25 + 8 * v13);
        if (!v17)
        {
          int64_t v13 = v5 + 4;
          if (v5 + 4 >= v24) {
            goto LABEL_38;
          }
          unint64_t v17 = *(void *)(v25 + 8 * v13);
          if (!v17)
          {
            int64_t v13 = v5 + 5;
            if (v5 + 5 >= v24) {
              goto LABEL_38;
            }
            unint64_t v17 = *(void *)(v25 + 8 * v13);
            if (!v17)
            {
              int64_t v18 = v5 + 6;
              while (v18 < v24)
              {
                unint64_t v17 = *(void *)(v25 + 8 * v18++);
                if (v17)
                {
                  int64_t v13 = v18 - 1;
                  goto LABEL_28;
                }
              }
LABEL_38:
              sub_1BD5FACC4();

              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v11 = (v17 - 1) & v17;
    unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
LABEL_29:
    id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v12);
    if (!v15) {
      goto LABEL_38;
    }
    while (1)
    {
      id v19 = &a2[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches];
      swift_beginAccess();
      uint64_t v20 = *(void *)v19;
      if ((v20 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_1BD60A880();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v21 = *(void *)(v20 + 16);
      }
      if (v21 > 1)
      {
        objc_msgSend(a2, sel_ignoreTouch_forEvent_, v15, a3);
      }
      else
      {
        swift_beginAccess();
        id v22 = v15;
        sub_1BD5FACCC(&v33, v22);
        swift_endAccess();
        uint64_t v23 = v33;
      }
      int64_t v5 = v13;
      unint64_t v7 = v11;
      if ((v4 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v14 = sub_1BD60A8B0();
      if (v14)
      {
        unint64_t v33 = (void *)v14;
        sub_1BD5FAC34();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v15 = v27;
        swift_unknownObjectRelease();
        int64_t v13 = v5;
        uint64_t v11 = v7;
        if (v27) {
          continue;
        }
      }
      goto LABEL_38;
    }
  }
  __break(1u);
}

void sub_1BD5F8A0C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BD60A840();
    sub_1BD5FAC34();
    sub_1BD5FAC74();
    sub_1BD60A670();
    uint64_t v5 = v22;
    uint64_t v21 = v23;
    uint64_t v6 = v24;
    int64_t v7 = v25;
    unint64_t v8 = v26;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v21 = a1 + 56;
    uint64_t v10 = ~v9;
    uint64_t v11 = -v9;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v8 = v12 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v6 = v10;
    int64_t v7 = 0;
  }
  int64_t v20 = (unint64_t)(v6 + 64) >> 6;
  if (v5 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v8)
    {
      uint64_t v13 = (v8 - 1) & v8;
      unint64_t v14 = __clz(__rbit64(v8)) | (v7 << 6);
      int64_t v15 = v7;
      goto LABEL_29;
    }
    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (v17 >= v20) {
      goto LABEL_32;
    }
    unint64_t v18 = *(void *)(v21 + 8 * v17);
    int64_t v15 = v7 + 1;
    if (!v18)
    {
      int64_t v15 = v7 + 2;
      if (v7 + 2 >= v20) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v21 + 8 * v15);
      if (!v18)
      {
        int64_t v15 = v7 + 3;
        if (v7 + 3 >= v20) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v21 + 8 * v15);
        if (!v18)
        {
          int64_t v15 = v7 + 4;
          if (v7 + 4 >= v20) {
            goto LABEL_32;
          }
          unint64_t v18 = *(void *)(v21 + 8 * v15);
          if (!v18)
          {
            int64_t v15 = v7 + 5;
            if (v7 + 5 >= v20) {
              goto LABEL_32;
            }
            unint64_t v18 = *(void *)(v21 + 8 * v15);
            if (!v18)
            {
              int64_t v19 = v7 + 6;
              while (v19 < v20)
              {
                unint64_t v18 = *(void *)(v21 + 8 * v19++);
                if (v18)
                {
                  int64_t v15 = v19 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1BD5FACC4();

              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v13 = (v18 - 1) & v18;
    unint64_t v14 = __clz(__rbit64(v18)) + (v15 << 6);
LABEL_29:
    id v16 = *(id *)(*(void *)(v5 + 48) + 8 * v14);
    if (!v16) {
      goto LABEL_32;
    }
    while (1)
    {
      objc_msgSend(a2, sel_ignoreTouch_forEvent_, v16, a3);

      int64_t v7 = v15;
      unint64_t v8 = v13;
      if ((v5 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_1BD60A8B0())
      {
        sub_1BD5FAC34();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v16 = v27;
        swift_unknownObjectRelease();
        int64_t v15 = v7;
        uint64_t v13 = v8;
        if (v27) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_1BD5F8CD8(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BD60A840();
    sub_1BD5FAC34();
    sub_1BD5FAC74();
    sub_1BD60A670();
    uint64_t v3 = v21;
    uint64_t v19 = v22;
    uint64_t v5 = v23;
    int64_t v4 = v24;
    unint64_t v6 = v25;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v5 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v4 = 0;
  }
  int64_t v18 = (unint64_t)(v5 + 64) >> 6;
  if (v3 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v10 = (v6 - 1) & v6;
      unint64_t v11 = __clz(__rbit64(v6)) | (v4 << 6);
      int64_t v12 = v4;
      goto LABEL_29;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v18) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v19 + 8 * v14);
    int64_t v12 = v4 + 1;
    if (!v15)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v18) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v19 + 8 * v12);
      if (!v15)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v18) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v19 + 8 * v12);
        if (!v15)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v18) {
            goto LABEL_32;
          }
          unint64_t v15 = *(void *)(v19 + 8 * v12);
          if (!v15)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v18) {
              goto LABEL_32;
            }
            unint64_t v15 = *(void *)(v19 + 8 * v12);
            if (!v15)
            {
              int64_t v16 = v4 + 6;
              while (v16 < v18)
              {
                unint64_t v15 = *(void *)(v19 + 8 * v16++);
                if (v15)
                {
                  int64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1BD5FACC4();

              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_32;
    }
    while (1)
    {
      swift_beginAccess();
      int64_t v17 = (void *)sub_1BD5FC9D8(v13);
      swift_endAccess();

      int64_t v4 = v12;
      unint64_t v6 = v10;
      if ((v3 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_1BD60A8B0())
      {
        sub_1BD5FAC34();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v20;
        swift_unknownObjectRelease();
        int64_t v12 = v4;
        uint64_t v10 = v6;
        if (v20) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_1BD5F8FBC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_1BD60A830();
    uint64_t v4 = v3;
    char v5 = 1;
  }
  else
  {
    uint64_t v2 = sub_1BD5FD510(a1);
    uint64_t v4 = v6;
    char v5 = v7 & 1;
  }
  uint64_t v8 = sub_1BD5FD264(a1);
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  BOOL v13 = sub_1BD5FD590(v2, v4, v5, v8, v9, v11 & 1);
  sub_1BD5FD5C4(v8, v10, v12);
  if (v13)
  {
    sub_1BD5FD5C4(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_1BD5FD2B8(v2, v4, v5, a1);
    uint64_t v14 = v15;
    sub_1BD5FD5C4(v2, v4, v5);
  }
  return v14;
}

__n128 TapDragGestureRecognizer.locations.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations;
  OUTLINED_FUNCTION_11();
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = v4;
  return result;
}

__n128 TapDragGestureRecognizer.locations.setter(__n128 *a1)
{
  __n128 v7 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  char v5 = (__n128 *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations);
  OUTLINED_FUNCTION_2_7();
  __n128 result = v7;
  *char v5 = v7;
  v5[1].n128_u64[0] = v2;
  v5[1].n128_u64[1] = v3;
  v5[2].n128_u8[0] = v4;
  return result;
}

uint64_t (*TapDragGestureRecognizer.locations.modify())()
{
  return j_j__swift_endAccess;
}

double TapDragGestureRecognizer.minimumPressDuration.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration;
  OUTLINED_FUNCTION_11();
  return *(double *)v1;
}

uint64_t TapDragGestureRecognizer.minimumPressDuration.setter(double a1)
{
  unint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration);
  uint64_t result = OUTLINED_FUNCTION_2_7();
  *unint64_t v3 = a1;
  return result;
}

uint64_t (*TapDragGestureRecognizer.minimumPressDuration.modify())()
{
  return j__swift_endAccess;
}

id TapDragGestureRecognizer.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void TapDragGestureRecognizer.init(coder:)()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = -1;
  *(void *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration] = 0x3FB999999999999ALL;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1BD60AA10()) {
    sub_1BD5FA8F8(MEMORY[0x1E4FBC860]);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4FBC870];
  }
  *(void *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches] = v2;
  *(void *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer] = 0;

  sub_1BD60AA00();
  __break(1u);
}

id sub_1BD5F93D0(char *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  char v4 = *a1;
  char v5 = &v1[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations];
  *(_OWORD *)char v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = -1;
  *(void *)&v1[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration] = 0x3FB999999999999ALL;
  long long v6 = v1;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1BD60AA10()) {
    sub_1BD5FA8F8(MEMORY[0x1E4FBC860]);
  }
  else {
    uint64_t v7 = MEMORY[0x1E4FBC870];
  }
  *(void *)&v6[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches] = v7;
  *(void *)&v6[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer] = 0;
  v6[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation] = v4;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_initWithTarget_action_, 0, 0);
}

void TapDragGestureRecognizer.touchesBegan(_:with:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_11();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_1BD5F9670(v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = v2;
  id v8 = a2;
  if (v6 > 1)
  {
    sub_1BD5F8A0C(a1, v7, v8);
    return;
  }
  sub_1BD5F868C(a1, v7, v8);
  if (objc_msgSend(v7, sel_state))
  {
    uint64_t v9 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer;
  }
  else
  {
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_1BD5F9670(v10);
    swift_bridgeObjectRelease();
    uint64_t v9 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer;
    if (v11 == 1 && !*(void *)&v7[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer])
    {
      uint64_t v14 = swift_bridgeObjectRetain();
      uint64_t v15 = (void *)sub_1BD5F8FBC(v14);
      swift_bridgeObjectRelease();
      if (v15)
      {
        id v16 = objc_msgSend(v7, sel_view);
        objc_msgSend(v15, sel_locationInView_, v16);
        double v18 = v17;
        double v20 = v19;

        sub_1BD5F9690(v18, v20);
      }
      return;
    }
  }
  if (*(void *)&v7[v9])
  {
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v13 = sub_1BD5F9670(v12);
    swift_bridgeObjectRelease();
    if (v13 < 2) {
      return;
    }
    sub_1BD5F9AC8();
  }
  sub_1BD5F97E0();
}

uint64_t sub_1BD5F9670(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1BD60A880();
  }
  else {
    return *(void *)(a1 + 16);
  }
}

void sub_1BD5F9690(double a1, double a2)
{
  uint64_t v5 = self;
  uint64_t v6 = (double *)&v2[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration];
  swift_beginAccess();
  double v7 = *v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  *(double *)(v8 + 24) = a1;
  *(double *)(v8 + 32) = a2;
  aBlock[4] = sub_1BD5FCF5C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BD5FA724;
  aBlock[3] = &block_descriptor_2;
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = v2;
  swift_release();
  id v11 = objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v9, v7);
  _Block_release(v9);
  uint64_t v12 = *(void **)&v10[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer];
  *(void *)&v10[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer] = v11;
}

id sub_1BD5F97E0()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations];
  swift_beginAccess();
  int v2 = v1[32];
  id v3 = (uint64_t *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches];
  swift_beginAccess();
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_1BD5F9670(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_bridgeObjectRetain();
  if (v5 == 1)
  {
    double v7 = (void *)sub_1BD5F8FBC(v6);
    id result = (id)swift_bridgeObjectRelease();
    if (!v7) {
      return result;
    }
    id v9 = objc_msgSend(v0, sel_view);
    objc_msgSend(v7, sel_locationInView_, v9);
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    char v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v17 = sub_1BD5F9670(v6);
    swift_bridgeObjectRelease();
    if (v17 < 2)
    {
      *(_OWORD *)uint64_t v1 = 0u;
      *((_OWORD *)v1 + 1) = 0u;
      v1[32] = -1;
      return objc_msgSend(v0, sel_setState_, 3);
    }
    uint64_t v18 = *v3;
    swift_bridgeObjectRetain_n();
    double v19 = v0;
    uint64_t v20 = sub_1BD5FA804(v18);
    swift_bridgeObjectRelease();
    uint64_t v34 = v20;
    sub_1BD5FB9CC(&v34, v19);
    swift_bridgeObjectRelease();
    uint64_t v21 = v34;
    unint64_t v22 = v34 & 0xC000000000000001;
    sub_1BD600AA8(0, (v34 & 0xC000000000000001) == 0, v34);
    if (v22) {
      id v23 = (id)MEMORY[0x1C187E170](0, v21);
    }
    else {
      id v23 = *(id *)(v21 + 32);
    }
    uint64_t v24 = v23;
    id v25 = objc_msgSend(v19, sel_view);
    objc_msgSend(v24, sel_locationInView_, v25);
    uint64_t v11 = v26;
    uint64_t v13 = v27;

    sub_1BD600AA8(1, v22 == 0, v21);
    if (v22) {
      id v28 = (id)MEMORY[0x1C187E170](1, v21);
    }
    else {
      id v28 = *(id *)(v21 + 40);
    }
    uint64_t v29 = v28;
    swift_release();
    id v30 = objc_msgSend(v19, sel_view);
    objc_msgSend(v29, sel_locationInView_, v30);
    uint64_t v15 = v31;
    uint64_t v16 = v32;

    char v14 = 1;
  }
  *(void *)uint64_t v1 = v11;
  *((void *)v1 + 1) = v13;
  *((void *)v1 + 2) = v15;
  *((void *)v1 + 3) = v16;
  v1[32] = v14;
  if (v2 == 255) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
  return objc_msgSend(v0, sel_setState_, v33);
}

void sub_1BD5F9AC8()
{
  uint64_t v1 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer;
  int v2 = *(void **)(v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    int v2 = *(void **)(v0 + v1);
  }
  *(void *)(v0 + v1) = 0;
}

id TapDragGestureRecognizer.touchesMoved(_:with:)(uint64_t a1)
{
  id v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches);
  OUTLINED_FUNCTION_11();
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain();
  sub_1BD5F9C28(a1, v4);
  LOBYTE(a1) = v5;
  id result = (id)swift_bridgeObjectRelease();
  if ((a1 & 1) == 0 && !*(void *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer)) {
    return sub_1BD5F97E0();
  }
  return result;
}

void sub_1BD5F9C28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (!sub_1BD60A880()) {
      return;
    }
  }
  else if (!*(void *)(a2 + 16))
  {
    return;
  }
  unint64_t v5 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (!sub_1BD60A880()) {
      return;
    }
  }
  else if (!*(void *)(a1 + 16))
  {
    return;
  }
  if (!v4)
  {
    uint64_t v6 = *(void *)(v2 + 16);
    if (v5) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v7 = *(void *)(a1 + 16);
    goto LABEL_14;
  }
  uint64_t v6 = sub_1BD60A880();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v7 = sub_1BD60A880();
LABEL_14:
  if (v6 >= v7) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = v2;
  }
  if (v6 < v7) {
    uint64_t v2 = a1;
  }
  if ((v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BD60A840();
    sub_1BD5FAC34();
    sub_1BD5FAC74();
    sub_1BD60A670();
    uint64_t v8 = v38;
    uint64_t v35 = v39;
    uint64_t v9 = v40;
    int64_t v10 = v41;
    unint64_t v11 = v42;
  }
  else
  {
    uint64_t v12 = -1 << *(unsigned char *)(v8 + 32);
    uint64_t v35 = v8 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v11 = v14 & *(void *)(v8 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v10 = 0;
  }
  sub_1BD5FAC34();
  int64_t v34 = (unint64_t)(v9 + 64) >> 6;
  unint64_t v15 = v2 & 0xC000000000000001;
  uint64_t v36 = v2 + 56;
  uint64_t v33 = v8;
  while (1)
  {
    while (1)
    {
      int64_t v16 = v10;
      if ((v8 & 0x8000000000000000) == 0) {
        break;
      }
      if (!sub_1BD60A8B0()) {
        goto LABEL_58;
      }
      swift_dynamicCast();
      double v19 = v37;
      if (v15) {
        goto LABEL_54;
      }
LABEL_31:
      if (*(void *)(v2 + 16))
      {
        uint64_t v20 = sub_1BD60A7A0();
        uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v22 = v20 & ~v21;
        if ((*(void *)(v36 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22))
        {
          id v23 = *(id *)(*(void *)(v2 + 48) + 8 * v22);
          char v24 = sub_1BD60A7B0();

          if (v24)
          {
LABEL_56:

            swift_bridgeObjectRelease();
            goto LABEL_57;
          }
          uint64_t v25 = ~v21;
          while (1)
          {
            unint64_t v22 = (v22 + 1) & v25;
            if (((*(void *)(v36 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
              break;
            }
            id v26 = *(id *)(*(void *)(v2 + 48) + 8 * v22);
            char v27 = sub_1BD60A7B0();

            if (v27) {
              goto LABEL_56;
            }
          }
        }
      }

      uint64_t v8 = v33;
      unint64_t v15 = v2 & 0xC000000000000001;
    }
    if (v11)
    {
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v10 << 6);
      goto LABEL_53;
    }
    int64_t v28 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      return;
    }
    if (v28 >= v34) {
      goto LABEL_58;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    ++v10;
    if (!v29)
    {
      int64_t v10 = v16 + 2;
      if (v16 + 2 >= v34) {
        goto LABEL_58;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v10);
      if (!v29)
      {
        int64_t v10 = v16 + 3;
        if (v16 + 3 >= v34) {
          goto LABEL_58;
        }
        unint64_t v29 = *(void *)(v35 + 8 * v10);
        if (!v29)
        {
          int64_t v10 = v16 + 4;
          if (v16 + 4 >= v34) {
            goto LABEL_58;
          }
          unint64_t v29 = *(void *)(v35 + 8 * v10);
          if (!v29) {
            break;
          }
        }
      }
    }
LABEL_52:
    unint64_t v11 = (v29 - 1) & v29;
    unint64_t v18 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_53:
    double v19 = *(void **)(*(void *)(v8 + 48) + 8 * v18);
    uint64_t v37 = v19;
    id v31 = v19;
    if (!v15) {
      goto LABEL_31;
    }
LABEL_54:
    char v32 = sub_1BD60A8C0();

    if (v32)
    {
      swift_bridgeObjectRelease();
LABEL_57:
      sub_1BD5FACC4();
      return;
    }
  }
  int64_t v30 = v16 + 5;
  while (v30 < v34)
  {
    unint64_t v29 = *(void *)(v35 + 8 * v30++);
    if (v29)
    {
      int64_t v10 = v30 - 1;
      goto LABEL_52;
    }
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_1BD5FACC4();
}

id TapDragGestureRecognizer.touchesEnded(_:with:)(uint64_t a1)
{
  id v3 = v1;
  sub_1BD5F8CD8(a1, v3);
  if (*(void *)&v3[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer]
    && (OUTLINED_FUNCTION_11(), uint64_t v4 = swift_bridgeObjectRetain(), v5 = sub_1BD5FA134(v4), swift_bridgeObjectRelease(), v5))
  {
    return objc_msgSend(v3, sel_setState_, 4);
  }
  else
  {
    return sub_1BD5F97E0();
  }
}

BOOL sub_1BD5FA134(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v1 = sub_1BD60A880();
  }
  else {
    uint64_t v1 = *(void *)(a1 + 16);
  }
  return v1 == 0;
}

uint64_t sub_1BD5FA188(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t))
{
  sub_1BD5FAC34();
  sub_1BD5FAC74();
  uint64_t v8 = sub_1BD60A660();
  id v9 = a4;
  id v10 = a1;
  a5(v8);

  return swift_bridgeObjectRelease();
}

id TapDragGestureRecognizer.touchesCancelled(_:with:)()
{
  return objc_msgSend(v0, sel_setState_, 4);
}

Swift::Void __swiftcall TapDragGestureRecognizer.reset()()
{
  sub_1BD5F9AC8();
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1BD60AA10())
  {
    sub_1BD5FA8F8(MEMORY[0x1E4FBC860]);
    uint64_t v1 = v4;
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4FBC870];
  }
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches);
  swift_beginAccess();
  *uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations;
  OUTLINED_FUNCTION_2_7();
  *(_OWORD *)uint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(unsigned char *)(v3 + 32) = -1;
}

id TapDragGestureRecognizer.__allocating_init(target:action:)(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[3];
  if (v4)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v7 = *(void *)(v4 - 8);
    double v8 = MEMORY[0x1F4188790](v6);
    id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v7 + 16))(v10, v8);
    uint64_t v11 = sub_1BD60AAE0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = objc_msgSend(objc_allocWithZone(v2), sel_initWithTarget_action_, v11, a2);
  swift_unknownObjectRelease();
  return v12;
}

void TapDragGestureRecognizer.init(target:action:)()
{
}

id TapDragGestureRecognizer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1BD5FA5F0(double a1, double a2, uint64_t a3, void *a4)
{
  sub_1BD5F9AC8();
  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  double v8 = (void *)sub_1BD5F8FBC(v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    id v9 = objc_msgSend(a4, sel_view);
    objc_msgSend(v8, sel_locationInView_, v9);
    double v11 = v10;

    double v12 = vabdd_f64(a1, v11);
    id v13 = objc_msgSend(a4, sel_view);
    objc_msgSend(v8, sel_locationInView_, v13);
    double v15 = v14;

    double v16 = vabdd_f64(a2, v15);
    if (v12 <= 5.0 && v16 <= 5.0) {
      sub_1BD5F97E0();
    }
    else {
      objc_msgSend(a4, sel_setState_, 4, v16);
    }
  }
}

void sub_1BD5FA724(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1BD5FA78C(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = result;
    if (result)
    {
      sub_1BD5FAC34();
      id result = sub_1BD60A5E0();
      *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v1;
    }
    else
    {
      return MEMORY[0x1E4FBC860];
    }
  }
  return result;
}

uint64_t sub_1BD5FA7E8(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1BD5FA804(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_1BD60A880();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    sub_1BD5F5B08();
    uint64_t v3 = (void *)swift_allocObject();
    size_t v4 = _swift_stdlib_malloc_size(v3);
    v3[2] = v2;
    v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  }
  swift_bridgeObjectRetain();
  BOOL v5 = sub_1BD5FCF68(&v7, v3 + 4, v2, a1);
  uint64_t result = sub_1BD5FACC4();
  if (v5 == (void *)v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_1BD5FA8F8(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1BD60AA10();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = MEMORY[0x1E4FBC870];
    goto LABEL_6;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1BD5FCEC0();
  uint64_t v3 = sub_1BD60A910();
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1BD60AA10();
    swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_26;
    }
  }
  unint64_t v6 = 0;
  uint64_t v7 = v3 + 56;
  unint64_t v27 = v1;
  unint64_t v28 = v1 & 0xC000000000000001;
  unint64_t v24 = v1 + 32;
  uint64_t v25 = v1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v26 = v5;
  while (1)
  {
    if (v28)
    {
      id v8 = (id)MEMORY[0x1C187E170](v6, v1);
    }
    else
    {
      if (v6 >= *(void *)(v25 + 16)) {
        goto LABEL_29;
      }
      id v8 = *(id *)(v24 + 8 * v6);
    }
    id v9 = v8;
    BOOL v10 = __OFADD__(v6++, 1);
    if (v10) {
      break;
    }
    uint64_t v11 = sub_1BD60A7A0();
    uint64_t v12 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)(v7 + 8 * (v13 >> 6));
    uint64_t v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_1BD5FAC34();
      id v17 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
      char v18 = sub_1BD60A7B0();

      if (v18)
      {
LABEL_21:

        uint64_t v5 = v26;
        unint64_t v1 = v27;
        goto LABEL_25;
      }
      uint64_t v19 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v19;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)(v7 + 8 * (v13 >> 6));
        uint64_t v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
        char v21 = sub_1BD60A7B0();

        if (v21) {
          goto LABEL_21;
        }
      }
      uint64_t v5 = v26;
      unint64_t v1 = v27;
    }
    *(void *)(v7 + 8 * v14) = v16 | v15;
    *(void *)(*(void *)(v3 + 48) + 8 * v13) = v9;
    uint64_t v22 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v22, 1);
    uint64_t v23 = v22 + 1;
    if (v10) {
      goto LABEL_28;
    }
    *(void *)(v3 + 16) = v23;
LABEL_25:
    if (v6 == v5) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
}

uint64_t type metadata accessor for TapDragGestureRecognizer()
{
  return self;
}

uint64_t method lookup function for TapDragGestureRecognizer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TapDragGestureRecognizer);
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

uint64_t getEnumTagSinglePayload for TapDragGestureRecognizer.LocationType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for TapDragGestureRecognizer.LocationType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BD5FAC10(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1BD5FAC18(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TapDragGestureRecognizer.LocationType()
{
  return &type metadata for TapDragGestureRecognizer.LocationType;
}

unint64_t sub_1BD5FAC34()
{
  unint64_t result = qword_1EBA19B70;
  if (!qword_1EBA19B70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA19B70);
  }
  return result;
}

unint64_t sub_1BD5FAC74()
{
  unint64_t result = qword_1EBA19B78;
  if (!qword_1EBA19B78)
  {
    sub_1BD5FAC34();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA19B78);
  }
  return result;
}

uint64_t sub_1BD5FACC4()
{
  return swift_release();
}

uint64_t sub_1BD5FACCC(void *a1, void *a2)
{
  unsigned int v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1BD60A890();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1BD5FAC34();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1BD60A880();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_1BD5FAF48(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_1BD5FB11C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_1BD5FB3B4((uint64_t)v8, v22);
    *unsigned int v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1BD60A7A0();
    uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v12 = v10 & ~v11;
    if ((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
    {
      sub_1BD5FAC34();
      id v13 = *(id *)(*(void *)(v6 + 48) + 8 * v12);
      char v14 = sub_1BD60A7B0();

      if (v14)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        char v18 = *(void **)(*(void *)(*v2 + 48) + 8 * v12);
        *a1 = v18;
        id v19 = v18;
        return 0;
      }
      uint64_t v15 = ~v11;
      while (1)
      {
        unint64_t v12 = (v12 + 1) & v15;
        if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
          break;
        }
        id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v12);
        char v17 = sub_1BD60A7B0();

        if (v17) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *int v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1BD5FB438((uint64_t)v8, v12, isUniquelyReferenced_nonNull_native);
    *int v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1BD5FAF48(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  sub_1BD5FCEC0();
  uint64_t v2 = sub_1BD60A900();
  uint64_t v14 = v2;
  sub_1BD60A840();
  if (!sub_1BD60A8B0())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_1BD5FAC34();
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_1BD5FB11C();
      uint64_t v2 = v14;
    }
    uint64_t result = sub_1BD60A7A0();
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!sub_1BD60A8B0()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BD5FB11C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1BD5FCEC0();
  uint64_t v3 = sub_1BD60A8F0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_1BD60A7A0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
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
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              unint64_t v1 = v28;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                sub_1BD5FA7E8(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *unint64_t v6 = -1 << v27;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

unint64_t sub_1BD5FB3B4(uint64_t a1, uint64_t a2)
{
  sub_1BD60A7A0();
  unint64_t result = sub_1BD60A820();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1BD5FB438(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1BD5FB11C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1BD5FB5B0();
      goto LABEL_14;
    }
    sub_1BD5FB758();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_1BD60A7A0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1BD5FAC34();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1BD60A7B0();

    if (v12)
    {
LABEL_13:
      sub_1BD60AB00();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_1BD60A7B0();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_1BD5FB5B0()
{
  unint64_t v1 = v0;
  sub_1BD5FCEC0();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BD60A8E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
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

uint64_t sub_1BD5FB758()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1BD5FCEC0();
  uint64_t v3 = sub_1BD60A8F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    id v18 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_1BD60A7A0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    unint64_t v1 = v27;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1BD5FB9CC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_1BD5FD250();
  }
  uint64_t v6 = *(void *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  id v7 = v4;
  sub_1BD5FBA6C(v8, v7);
  sub_1BD60A970();
}

void sub_1BD5FBA6C(uint64_t *a1, void *a2)
{
  uint64_t v4 = a1[1];
  int64_t v5 = a2;
  uint64_t v6 = sub_1BD60AAC0();
  if (v6 >= v4)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (v4) {
        sub_1BD5FC3F0(0, v4, 1, a1, (unsigned char *)v5);
      }
      else {

      }
      goto LABEL_121;
    }
    goto LABEL_144;
  }
  uint64_t v7 = v6;
  uint64_t v144 = v2;
  uint64_t v8 = sub_1BD5FA78C(v4 / 2);
  CGRect v142 = v9;
  uint64_t v152 = v8;
  v151 = (void *)v5;
  uint64_t v140 = v4;
  unint64_t v135 = a1;
  if (v4 <= 0)
  {
    int64_t v12 = (char *)MEMORY[0x1E4FBC860];
    unint64_t v80 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_105:
    if (v80 < 2)
    {
LABEL_119:
      swift_bridgeObjectRelease();
      if (v4 >= -1) {
        goto LABEL_120;
      }
      goto LABEL_149;
    }
    uint64_t v129 = *v135;
    uint64_t v150 = *v135;
    while (1)
    {
      unint64_t v130 = v80 - 2;
      if (v80 < 2) {
        break;
      }
      if (!v129) {
        goto LABEL_153;
      }
      uint64_t v131 = *(void *)&v12[16 * v130 + 32];
      int64_t v5 = *(void *)&v12[16 * v80 + 24];
      sub_1BD5FC57C((char *)(v129 + 8 * v131), (char *)(v129 + 8 * *(void *)&v12[16 * v80 + 16]), v129 + 8 * v5, v142, v151);
      if (v144) {
        goto LABEL_102;
      }
      if (v5 < v131) {
        goto LABEL_139;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v12 = sub_1BD5FC9C4((uint64_t)v12);
      }
      if (v130 >= *((void *)v12 + 2)) {
        goto LABEL_140;
      }
      uint64_t v132 = &v12[16 * v130 + 32];
      *(void *)uint64_t v132 = v131;
      *((void *)v132 + 1) = v5;
      unint64_t v133 = *((void *)v12 + 2);
      if (v80 > v133) {
        goto LABEL_141;
      }
      int64_t v5 = v133 - 1;
      memmove(&v12[16 * v80 + 16], &v12[16 * v80 + 32], 16 * (v133 - v80));
      *((void *)v12 + 2) = v133 - 1;
      unint64_t v80 = v133 - 1;
      uint64_t v4 = v140;
      uint64_t v129 = v150;
      if (v133 <= 2) {
        goto LABEL_119;
      }
    }
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
    return;
  }
  uint64_t v138 = v7;
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v145 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
  uint64_t v134 = *a1 - 8;
  int64_t v12 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v149 = *a1;
  while (1)
  {
    uint64_t v13 = v10;
    uint64_t v14 = v10 + 1;
    uint64_t v141 = v10;
    if (v10 + 1 < v4)
    {
      int64_t v15 = *(void **)(v11 + 8 * v14);
      unint64_t v16 = *(void **)(v11 + 8 * v10);
      char v17 = *(unsigned char *)(v5 + v145);
      id v18 = v15;
      id v19 = v16;
      id v20 = objc_msgSend((id)v5, sel_view);
      objc_msgSend(v18, sel_locationInView_, v20);
      double v22 = v21;
      double v24 = v23;

      id v25 = objc_msgSend((id)v5, sel_view);
      uint64_t v13 = v141;
      objc_msgSend(v19, sel_locationInView_, v25);
      double v27 = v26;
      double v29 = v28;

      uint64_t v14 = v141 + 2;
      if (v17) {
        BOOL v30 = v24 < v29;
      }
      else {
        BOOL v30 = v22 < v27;
      }
      int v31 = v30;
      int v146 = v31;
      uint64_t v11 = v149;
      if (v14 < v4)
      {
        double v136 = v12;
        do
        {
          uint64_t v32 = v14;
          uint64_t v33 = v11 + 8 * v13;
          int64_t v34 = *(void **)(v33 + 8);
          char v35 = *((unsigned char *)v151 + v145);
          id v36 = *(id *)(v33 + 16);
          id v37 = v34;
          id v38 = objc_msgSend(v151, sel_view);
          objc_msgSend(v36, sel_locationInView_, v38);
          double v40 = v39;
          double v42 = v41;

          id v43 = objc_msgSend(v151, sel_view);
          objc_msgSend(v37, sel_locationInView_, v43);
          double v45 = v44;
          double v47 = v46;

          if (v35)
          {
            uint64_t v11 = v149;
            uint64_t v14 = v32;
            if (v146 == v42 >= v47)
            {
              uint64_t v14 = v13 + 2;
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v11 = v149;
            uint64_t v14 = v32;
            if (((v146 ^ (v40 >= v45)) & 1) == 0) {
              goto LABEL_19;
            }
          }
          ++v14;
          uint64_t v48 = v13 + 1;
          uint64_t v49 = v13 + 3;
          ++v13;
        }
        while (v49 < v140);
        uint64_t v14 = v48 + 2;
LABEL_19:
        uint64_t v4 = v140;
        uint64_t v13 = v141;
        int64_t v12 = v136;
        int64_t v5 = (int64_t)v151;
      }
      if (v146)
      {
        if (v14 < v13) {
          goto LABEL_146;
        }
        if (v13 < v14)
        {
          uint64_t v50 = (uint64_t *)(v134 + 8 * v14);
          uint64_t v51 = v14;
          uint64_t v52 = v13;
          uint64_t v53 = (uint64_t *)(v11 + 8 * v13);
          do
          {
            if (v52 != --v51)
            {
              if (!v11) {
                goto LABEL_152;
              }
              uint64_t v54 = *v53;
              *uint64_t v53 = *v50;
              *uint64_t v50 = v54;
            }
            ++v52;
            --v50;
            ++v53;
          }
          while (v52 < v51);
        }
      }
    }
    if (v14 < v4)
    {
      if (__OFSUB__(v14, v13)) {
        goto LABEL_143;
      }
      if (v14 - v13 < v138)
      {
        if (__OFADD__(v13, v138)) {
          goto LABEL_147;
        }
        if (v13 + v138 >= v4) {
          uint64_t v55 = v4;
        }
        else {
          uint64_t v55 = v13 + v138;
        }
        if (v55 < v13) {
          goto LABEL_148;
        }
        if (v14 != v55)
        {
          CGRect v137 = v12;
          uint64_t v56 = v134 + 8 * v14;
          uint64_t v139 = v55;
          do
          {
            uint64_t v57 = v56;
            uint64_t v58 = *(void **)(v11 + 8 * v14);
            uint64_t v59 = v13;
            uint64_t v143 = v57;
            uint64_t v60 = v57;
            uint64_t v147 = v14;
            while (1)
            {
              id v61 = *(void **)v60;
              int64_t v5 = (int64_t)v151;
              char v62 = *((unsigned char *)v151 + v145);
              id v63 = v58;
              id v64 = v61;
              id v65 = objc_msgSend(v151, sel_view);
              objc_msgSend(v63, sel_locationInView_, v65);
              double v67 = v66;
              double v69 = v68;

              id v70 = objc_msgSend(v151, sel_view);
              objc_msgSend(v64, sel_locationInView_, v70);
              double v72 = v71;
              double v74 = v73;

              BOOL v75 = (v62 & 1) != 0 ? v69 < v74 : v67 < v72;
              uint64_t v11 = v149;
              if (!v75) {
                break;
              }
              uint64_t v77 = v147;
              if (!v149) {
                goto LABEL_150;
              }
              uint64_t v76 = *(void **)v60;
              uint64_t v58 = *(void **)(v60 + 8);
              *(void *)uint64_t v60 = v58;
              *(void *)(v60 + 8) = v76;
              v60 -= 8;
              if (v147 == ++v59) {
                goto LABEL_46;
              }
            }
            uint64_t v77 = v147;
LABEL_46:
            uint64_t v14 = v77 + 1;
            uint64_t v56 = v143 + 8;
            uint64_t v13 = v141;
          }
          while (v14 != v139);
          uint64_t v14 = v139;
          int64_t v12 = v137;
          int64_t v5 = (int64_t)v151;
        }
      }
    }
    if (v14 < v13) {
      goto LABEL_142;
    }
    uint64_t v148 = v14;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v12 = sub_1BD5FC8D0(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v79 = *((void *)v12 + 2);
    unint64_t v78 = *((void *)v12 + 3);
    unint64_t v80 = v79 + 1;
    uint64_t v11 = v149;
    if (v79 >= v78 >> 1)
    {
      double v128 = sub_1BD5FC8D0((char *)(v78 > 1), v79 + 1, 1, v12);
      uint64_t v11 = v149;
      int64_t v12 = v128;
    }
    *((void *)v12 + 2) = v80;
    uint64_t v81 = &v12[16 * v79 + 32];
    *(void *)uint64_t v81 = v13;
    *((void *)v81 + 1) = v148;
    if (v79) {
      break;
    }
    unint64_t v80 = 1;
LABEL_97:
    uint64_t v4 = v140;
    uint64_t v10 = v148;
    if (v148 >= v140) {
      goto LABEL_105;
    }
  }
  uint64_t v82 = v12 + 32;
  while (1)
  {
    unint64_t v83 = v80 - 1;
    if (v80 >= 4)
    {
      uint64_t v88 = &v82[16 * v80];
      uint64_t v89 = *((void *)v88 - 8);
      uint64_t v90 = *((void *)v88 - 7);
      BOOL v94 = __OFSUB__(v90, v89);
      uint64_t v91 = v90 - v89;
      if (v94) {
        goto LABEL_127;
      }
      uint64_t v93 = *((void *)v88 - 6);
      uint64_t v92 = *((void *)v88 - 5);
      BOOL v94 = __OFSUB__(v92, v93);
      uint64_t v86 = v92 - v93;
      char v87 = v94;
      if (v94) {
        goto LABEL_128;
      }
      unint64_t v95 = v80 - 2;
      long long v96 = &v82[16 * v80 - 32];
      uint64_t v98 = *(void *)v96;
      uint64_t v97 = *((void *)v96 + 1);
      BOOL v94 = __OFSUB__(v97, v98);
      uint64_t v99 = v97 - v98;
      if (v94) {
        goto LABEL_129;
      }
      BOOL v94 = __OFADD__(v86, v99);
      uint64_t v100 = v86 + v99;
      if (v94) {
        goto LABEL_131;
      }
      if (v100 >= v91)
      {
        uint64_t v118 = &v82[16 * v83];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v94 = __OFSUB__(v119, v120);
        uint64_t v121 = v119 - v120;
        if (v94) {
          goto LABEL_137;
        }
        BOOL v111 = v86 < v121;
        goto LABEL_86;
      }
    }
    else
    {
      if (v80 != 3)
      {
        uint64_t v112 = *((void *)v12 + 4);
        uint64_t v113 = *((void *)v12 + 5);
        BOOL v94 = __OFSUB__(v113, v112);
        uint64_t v105 = v113 - v112;
        char v106 = v94;
        goto LABEL_80;
      }
      uint64_t v85 = *((void *)v12 + 4);
      uint64_t v84 = *((void *)v12 + 5);
      BOOL v94 = __OFSUB__(v84, v85);
      uint64_t v86 = v84 - v85;
      char v87 = v94;
    }
    if (v87) {
      goto LABEL_130;
    }
    unint64_t v95 = v80 - 2;
    uint64_t v101 = &v82[16 * v80 - 32];
    uint64_t v103 = *(void *)v101;
    uint64_t v102 = *((void *)v101 + 1);
    BOOL v104 = __OFSUB__(v102, v103);
    uint64_t v105 = v102 - v103;
    char v106 = v104;
    if (v104) {
      goto LABEL_132;
    }
    uint64_t v107 = &v82[16 * v83];
    uint64_t v109 = *(void *)v107;
    uint64_t v108 = *((void *)v107 + 1);
    BOOL v94 = __OFSUB__(v108, v109);
    uint64_t v110 = v108 - v109;
    if (v94) {
      goto LABEL_134;
    }
    if (__OFADD__(v105, v110)) {
      goto LABEL_136;
    }
    if (v105 + v110 >= v86)
    {
      BOOL v111 = v86 < v110;
LABEL_86:
      if (v111) {
        unint64_t v83 = v95;
      }
      goto LABEL_88;
    }
LABEL_80:
    if (v106) {
      goto LABEL_133;
    }
    uint64_t v114 = &v82[16 * v83];
    uint64_t v116 = *(void *)v114;
    uint64_t v115 = *((void *)v114 + 1);
    BOOL v94 = __OFSUB__(v115, v116);
    uint64_t v117 = v115 - v116;
    if (v94) {
      goto LABEL_135;
    }
    if (v117 < v105) {
      goto LABEL_97;
    }
LABEL_88:
    unint64_t v122 = v83 - 1;
    if (v83 - 1 >= v80)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
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
      goto LABEL_138;
    }
    if (!v11) {
      goto LABEL_151;
    }
    int64_t v5 = (int64_t)&v82[16 * v122];
    uint64_t v123 = *(void *)v5;
    unint64_t v124 = v83;
    objc_super v125 = &v82[16 * v83];
    uint64_t v126 = *((void *)v125 + 1);
    sub_1BD5FC57C((char *)(v11 + 8 * *(void *)v5), (char *)(v11 + 8 * *(void *)v125), v11 + 8 * v126, v142, v151);
    if (v144) {
      break;
    }
    if (v126 < v123) {
      goto LABEL_124;
    }
    if (v124 > *((void *)v12 + 2)) {
      goto LABEL_125;
    }
    *(void *)int64_t v5 = v123;
    uint64_t v82 = v12 + 32;
    *(void *)&v12[16 * v122 + 40] = v126;
    unint64_t v127 = *((void *)v12 + 2);
    if (v124 >= v127) {
      goto LABEL_126;
    }
    uint64_t v144 = 0;
    unint64_t v80 = v127 - 1;
    memmove(v125, v125 + 16, 16 * (v127 - 1 - v124));
    *((void *)v12 + 2) = v127 - 1;
    uint64_t v11 = v149;
    int64_t v5 = (int64_t)v151;
    if (v127 <= 2) {
      goto LABEL_97;
    }
  }
LABEL_102:
  swift_bridgeObjectRelease();
  if (v140 < -1) {
    goto LABEL_145;
  }
LABEL_120:
  *(void *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_1BD60A5B0();

  int64_t v5 = (int64_t)v151;
  swift_bridgeObjectRelease();
LABEL_121:
}

void sub_1BD5FC3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned char *a5)
{
  if (a3 != a2)
  {
    uint64_t v27 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
    uint64_t v29 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      uint64_t v6 = *(void **)(v29 + 8 * a3);
      uint64_t v7 = a1;
      uint64_t v26 = v5;
      uint64_t v30 = a3;
      do
      {
        uint64_t v8 = *(void **)v5;
        char v9 = a5[v27];
        id v10 = v6;
        id v11 = v8;
        id v12 = objc_msgSend(a5, sel_view);
        objc_msgSend(v10, sel_locationInView_, v12);
        double v14 = v13;
        double v16 = v15;

        id v17 = objc_msgSend(a5, sel_view);
        objc_msgSend(v11, sel_locationInView_, v17);
        double v19 = v18;
        double v21 = v20;

        if (v9) {
          BOOL v22 = v16 < v21;
        }
        else {
          BOOL v22 = v14 < v19;
        }
        if (!v22) {
          break;
        }
        if (!v29)
        {
          __break(1u);
          return;
        }
        double v23 = *(void **)v5;
        uint64_t v6 = *(void **)(v5 + 8);
        *(void *)uint64_t v5 = v6;
        *(void *)(v5 + 8) = v23;
        v5 -= 8;
        ++v7;
      }
      while (v30 != v7);
      a3 = v30 + 1;
      uint64_t v5 = v26 + 8;
      if (v30 + 1 != a2) {
        continue;
      }
      break;
    }
  }
}

uint64_t sub_1BD5FC57C(char *a1, char *a2, unint64_t a3, char *a4, unsigned char *a5)
{
  uint64_t v5 = (void **)a4;
  uint64_t v7 = (id *)a2;
  uint64_t v8 = (id *)a1;
  uint64_t v9 = a2 - a1;
  uint64_t v10 = (a2 - a1) / 8;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = (uint64_t)(a3 - (void)a2) / 8;
  if (v10 >= v12)
  {
    sub_1BD5D5514(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
    double v13 = &v5[v12];
    if (v8 >= v7 || v11 <= 7) {
      goto LABEL_43;
    }
    uint64_t v54 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
    uint64_t v33 = (id *)(a3 - 8);
    char v62 = v5;
    while (1)
    {
      unint64_t v60 = (unint64_t)v13;
      int64_t v34 = v13 - 1;
      uint64_t v55 = v33 + 1;
      char v35 = v7 - 1;
      id v36 = *(v7 - 1);
      char v57 = a5[v54];
      id v37 = *(v13 - 1);
      id v38 = v36;
      id v39 = objc_msgSend(a5, sel_view);
      objc_msgSend(v37, sel_locationInView_, v39);
      double v41 = v40;
      double v43 = v42;

      id v44 = objc_msgSend(a5, sel_view);
      objc_msgSend(v38, sel_locationInView_, v44);
      double v46 = v45;
      double v48 = v47;

      if (v57)
      {
        if (v43 < v48) {
          goto LABEL_32;
        }
      }
      else if (v41 < v46)
      {
LABEL_32:
        BOOL v49 = v55 != v7 || v33 >= v7;
        --v7;
        double v13 = (void **)v60;
        goto LABEL_36;
      }
      BOOL v49 = v55 != (id *)v60 || (unint64_t)v33 >= v60;
      char v35 = v34;
      double v13 = v34;
LABEL_36:
      if (v49) {
        *uint64_t v33 = *v35;
      }
      --v33;
      uint64_t v5 = v62;
      if (v7 <= v8 || v13 <= v62) {
        goto LABEL_43;
      }
    }
  }
  sub_1BD5D5514(a1, (a2 - a1) / 8, a4);
  double v13 = &v5[v10];
  if ((unint64_t)v7 < a3 && v9 > 7)
  {
    uint64_t v56 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
    uint64_t v59 = &v5[v10];
    do
    {
      id v61 = v5;
      double v15 = *v5;
      char v16 = a5[v56];
      id v17 = *v7;
      id v18 = v15;
      id v19 = objc_msgSend(a5, sel_view);
      objc_msgSend(v17, sel_locationInView_, v19);
      double v21 = v20;
      double v23 = v22;

      id v24 = objc_msgSend(a5, sel_view);
      objc_msgSend(v18, sel_locationInView_, v24);
      double v26 = v25;
      double v28 = v27;

      if (v16)
      {
        if (v23 < v28) {
          goto LABEL_11;
        }
      }
      else if (v21 < v26)
      {
LABEL_11:
        uint64_t v29 = v7;
        BOOL v30 = v8 == v7++;
        goto LABEL_12;
      }
      uint64_t v29 = v5++;
      BOOL v30 = v8 == v61;
LABEL_12:
      double v13 = v59;
      if (!v30) {
        *uint64_t v8 = *v29;
      }
      ++v8;
    }
    while (v5 < v59 && (unint64_t)v7 < a3);
  }
  uint64_t v7 = v8;
LABEL_43:
  uint64_t v51 = v13 - v5;
  if (v7 != v5 || v7 >= &v5[v51]) {
    memmove(v7, v5, 8 * v51);
  }

  return 1;
}

char *sub_1BD5FC8D0(char *result, int64_t a2, char a3, char *a4)
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
    sub_1BD5FD5D0();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  double v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1BD5FC9C4(uint64_t a1)
{
  return sub_1BD5FC8D0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1BD5FC9D8(void *a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1BD60A7A0();
    uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v9 = v7 & ~v8;
    if ((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
    {
      sub_1BD5FAC34();
      id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
      char v11 = sub_1BD60A7B0();

      if (v11)
      {
LABEL_9:
        swift_bridgeObjectRelease();
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v16 = *v1;
        uint64_t v18 = *v1;
        *unint64_t v1 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1BD5FB5B0();
          uint64_t v16 = v18;
        }
        uint64_t v6 = *(void *)(*(void *)(v16 + 48) + 8 * v9);
        sub_1BD5FCD28(v9);
        *unint64_t v1 = v18;
        goto LABEL_12;
      }
      uint64_t v12 = ~v8;
      while (1)
      {
        unint64_t v9 = (v9 + 1) & v12;
        if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          break;
        }
        id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
        char v14 = sub_1BD60A7B0();

        if (v14) {
          goto LABEL_9;
        }
      }
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  id v4 = a1;
  char v5 = sub_1BD60A8C0();

  if ((v5 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v6 = sub_1BD5FCB9C();
LABEL_12:
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1BD5FCB9C()
{
  unint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1BD60A880();
  uint64_t v3 = swift_unknownObjectRetain();
  uint64_t v4 = sub_1BD5FAF48(v3, v2);
  uint64_t v15 = v4;
  swift_retain();
  uint64_t v5 = sub_1BD60A7A0();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    sub_1BD5FAC34();
    id v8 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
    char v9 = sub_1BD60A7B0();

    if (v9)
    {
LABEL_6:
      swift_release();
      uint64_t v13 = *(void *)(*(void *)(v4 + 48) + 8 * v7);
      sub_1BD5FCD28(v7);
      if (sub_1BD60A7B0())
      {
        *unint64_t v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v6;
      while (1)
      {
        unint64_t v7 = (v7 + 1) & v10;
        if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          break;
        }
        id v11 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
        char v12 = sub_1BD60A7B0();

        if (v12) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_1BD5FCD28(unint64_t result)
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
    uint64_t v8 = sub_1BD60A810();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        uint64_t v11 = sub_1BD60A7A0();

        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_15:
            uint64_t v15 = *(void *)(v3 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v2);
            id v17 = (void *)(v15 + 8 * v6);
            BOOL v18 = v2 != v6 || v16 >= v17 + 1;
            int64_t v2 = v6;
            if (v18)
            {
              *uint64_t v16 = *v17;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_15;
        }
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
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void sub_1BD5FCEC0()
{
  if (!qword_1EBA19B80)
  {
    sub_1BD5FAC34();
    sub_1BD5FAC74();
    unint64_t v0 = sub_1BD60A920();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19B80);
    }
  }
}

uint64_t sub_1BD5FCF24()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BD5FCF5C(uint64_t a1)
{
  sub_1BD5FA5F0(*(double *)(v1 + 24), *(double *)(v1 + 32), a1, *(void **)(v1 + 16));
}

void *sub_1BD5FCF68(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_1BD60A840();
    sub_1BD5FAC34();
    sub_1BD5FAC74();
    uint64_t result = (void *)sub_1BD60A670();
    uint64_t v4 = v26;
    uint64_t v8 = v27;
    uint64_t v9 = v28;
    int64_t v10 = v29;
    unint64_t v11 = v30;
  }
  else
  {
    int64_t v10 = 0;
    uint64_t v12 = -1 << *(unsigned char *)(a4 + 32);
    uint64_t v8 = a4 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v11 = v14 & *(void *)(a4 + 56);
  }
  if (!a2)
  {
    uint64_t v15 = 0;
LABEL_47:
    *uint64_t v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v10;
    v7[4] = v11;
    return (void *)v15;
  }
  if (!a3)
  {
    uint64_t v15 = 0;
    goto LABEL_47;
  }
  if (a3 < 0) {
    goto LABEL_49;
  }
  uint64_t v15 = 0;
  int64_t v24 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_1BD60A8B0()) {
        goto LABEL_46;
      }
      sub_1BD5FAC34();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      BOOL v18 = v25;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v25) {
        goto LABEL_46;
      }
      goto LABEL_28;
    }
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v10 << 6);
      goto LABEL_27;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v19 >= v24)
    {
      unint64_t v11 = 0;
      goto LABEL_46;
    }
    unint64_t v20 = *(void *)(v8 + 8 * v19);
    if (v20) {
      goto LABEL_26;
    }
    int64_t v21 = v10 + 2;
    if (v10 + 2 >= v24)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_46;
    }
    unint64_t v20 = *(void *)(v8 + 8 * v21);
    if (!v20)
    {
      if (v10 + 3 >= v24) {
        goto LABEL_43;
      }
      unint64_t v20 = *(void *)(v8 + 8 * (v10 + 3));
      if (v20)
      {
        int64_t v19 = v10 + 3;
        goto LABEL_26;
      }
      int64_t v21 = v10 + 4;
      if (v10 + 4 >= v24)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_46;
      }
      unint64_t v20 = *(void *)(v8 + 8 * v21);
      if (!v20)
      {
        int64_t v19 = v10 + 5;
        if (v10 + 5 >= v24)
        {
LABEL_43:
          unint64_t v11 = 0;
          int64_t v10 = v21;
          goto LABEL_46;
        }
        unint64_t v20 = *(void *)(v8 + 8 * v19);
        if (!v20)
        {
          int64_t v22 = v10 + 6;
          while (v22 < v24)
          {
            unint64_t v20 = *(void *)(v8 + 8 * v22++);
            if (v20)
            {
              int64_t v19 = v22 - 1;
              goto LABEL_26;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v24 - 1;
          goto LABEL_46;
        }
        goto LABEL_26;
      }
    }
    int64_t v19 = v21;
LABEL_26:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v19 << 6);
    int64_t v10 = v19;
LABEL_27:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    BOOL v18 = result;
    if (!result) {
      goto LABEL_46;
    }
LABEL_28:
    ++v15;
    *a2++ = v18;
    if (v15 == a3)
    {
      uint64_t v15 = a3;
LABEL_46:
      uint64_t v9 = v23;
      goto LABEL_47;
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

void sub_1BD5FD250()
{
}

uint64_t sub_1BD5FD264(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1BD60A8D0();
  }
  else {
    return 1 << *(unsigned char *)(a1 + 32);
  }
}

void sub_1BD5FD2B8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x1C187E0D0](a1, a2, v7);
      sub_1BD5FAC34();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_1BD60A860() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_1BD60A870();
  sub_1BD5FAC34();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1BD60A7A0();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_1BD60A7B0();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_1BD60A7B0();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v16 = v15;
}

uint64_t sub_1BD5FD510(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

BOOL sub_1BD5FD590(uint64_t a1, int a2, char a3, uint64_t a4, int a5, char a6)
{
  if (a3)
  {
    if (a6) {
LABEL_9:
    }
      JUMPOUT(0x1C187E080);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a6) {
    goto LABEL_8;
  }
  if (a2 != a5)
  {
    __break(1u);
    goto LABEL_8;
  }
  return a1 == a4;
}

uint64_t sub_1BD5FD5C4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BD5FD5D0()
{
  if (!qword_1E9FC69D0)
  {
    sub_1BD5FD628();
    unint64_t v0 = sub_1BD60AAD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9FC69D0);
    }
  }
}

void sub_1BD5FD628()
{
  if (!qword_1EBA19B88)
  {
    unint64_t v0 = sub_1BD60A6D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19B88);
    }
  }
}

uint64_t dispatch thunk of ChartModelType.coordinateSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ChartModelType.series.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

void *Stroke.init(style:width:color:lineCap:)@<X0>(void *result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  char v5 = *a3;
  *(void *)a4 = *result;
  *(double *)(a4 + 8) = a5;
  *(void *)(a4 + 16) = a2;
  *(unsigned char *)(a4 + 24) = v5;
  return result;
}

id sub_1BD5FD6C4()
{
  id result = objc_msgSend(self, sel_blackColor);
  qword_1E9FC69D8 = 0;
  qword_1E9FC69E0 = 0x3FF0000000000000;
  qword_1E9FC69E8 = (uint64_t)result;
  byte_1E9FC69F0 = 0;
  return result;
}

id static Stroke.default.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FC67F0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1E9FC69E0;
  uint64_t v3 = qword_1E9FC69E8;
  id v6 = (id)qword_1E9FC69E8;
  char v4 = byte_1E9FC69F0;
  *(void *)a1 = qword_1E9FC69D8;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  swift_bridgeObjectRetain();

  return v6;
}

uint64_t Stroke.style.getter@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

double Stroke.width.getter()
{
  return *(double *)(v0 + 8);
}

id Stroke.color.getter()
{
  return *(id *)(v0 + 16);
}

void Stroke.lineCap.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

uint64_t initializeWithCopy for Stroke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  char v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for Stroke(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  char v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Stroke(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  char v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Stroke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for Stroke(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Stroke()
{
  return &type metadata for Stroke;
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

uint64_t getEnumTagSinglePayload for GridPathGeneratorOptions(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 49))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
      BOOL v4 = v3 >= 2;
      int v2 = v3 - 2;
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

uint64_t storeEnumTagSinglePayload for GridPathGeneratorOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridPathGeneratorOptions()
{
  return &type metadata for GridPathGeneratorOptions;
}

uint64_t sub_1BD5FDA40()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BD5FDA88()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void *sub_1BD5FDAB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t sub_1BD5FDB04(uint64_t *a1)
{
  int v2 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_1BD5FDB40()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1BD5FDB68()
{
  sub_1BD5FDB40();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t type metadata accessor for InteractionHandlerWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BD5FDBB4(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

void *GridPathGenerator.path(for:options:)(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  double v5 = *(double *)a2;
  double v4 = *(double *)(a2 + 8);
  double v6 = *(double *)(a2 + 16);
  double v7 = *(double *)(a2 + 24);
  double v8 = *(double *)(a2 + 32);
  double v9 = *(double *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 48);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14C0]), sel_init);
  double v12 = v4;
  id v13 = v11;
  double v14 = v5 - v7 - v9;
  double v15 = v4 - v6 - v8;
  double v30 = v6;
  double v16 = v6;
  double v17 = v7;
  double v18 = v14;
  double v19 = v15;
  if ((v10 & 1) == 0)
  {
    double v16 = *MEMORY[0x1E4FB2848];
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v18 = v5;
    double v19 = v12;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  if (v20)
  {
    int64_t v21 = (void **)(v3 + 40);
    swift_bridgeObjectRetain();
    uint64_t v22 = 1;
    while (1)
    {
      double v23 = *((double *)v21 - 1);
      int64_t v24 = *v21;
      if (v2)
      {
        double v25 = v7 + v14 * v23;
        id v26 = v24;
        objc_msgSend(v13, sel_moveToPoint_, v25, v16);
        objc_msgSend(v13, sel_addLineToPoint_, v25, v19);
      }
      else
      {
        double v27 = v30 + v15 * v23;
        id v26 = v24;
        objc_msgSend(v13, sel_moveToPoint_, v17, v27);
        objc_msgSend(v13, sel_addLineToPoint_, v18, v27);
      }

      if (v20 == v22) {
        break;
      }
      v21 += 2;
      if (__OFADD__(v22++, 1))
      {
        __break(1u);
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  return v13;
}

uint64_t GridPathGenerator.deinit()
{
  return v0;
}

uint64_t GridPathGenerator.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

void *sub_1BD5FDD84(unsigned __int8 *a1, uint64_t a2)
{
  return GridPathGenerator.path(for:options:)(a1, a2);
}

uint64_t dispatch thunk of GridPathGeneratorType.path(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for GridPathGenerator()
{
  return self;
}

uint64_t method lookup function for GridPathGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GridPathGenerator);
}

ValueMetadata *type metadata accessor for GridLayoutAttributes()
{
  return &type metadata for GridLayoutAttributes;
}

uint64_t sub_1BD5FDDFC(uint64_t a1, char *a2)
{
  uint64_t v27 = sub_1BD609FE0();
  uint64_t v5 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  double v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v28 = a2;
    v24[1] = v2;
    uint64_t v29 = MEMORY[0x1E4FBC860];
    sub_1BD5D48D0(0, v8, 0);
    uint64_t v9 = v29;
    double v25 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v26 = OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter;
    char v10 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v11 = *(v10 - 1);
      uint64_t v12 = *v10;
      swift_bridgeObjectRetain_n();
      sub_1BD5FEBF4(v11, v12);
      if (v13)
      {
        uint64_t v17 = 0;
        unint64_t v19 = 0xE000000000000000;
      }
      else
      {
        sub_1BD609FD0();
        id v14 = *(id *)&v28[v26];
        double v15 = (void *)sub_1BD609FC0();
        id v16 = objc_msgSend(v14, sel_stringFromDate_, v15);

        uint64_t v17 = sub_1BD60A540();
        unint64_t v19 = v18;

        (*v25)(v7, v27);
      }
      swift_bridgeObjectRelease();
      uint64_t v29 = v9;
      unint64_t v21 = *(void *)(v9 + 16);
      unint64_t v20 = *(void *)(v9 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_1BD5D48D0((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v9 = v29;
      }
      v10 += 2;
      *(void *)(v9 + 16) = v21 + 1;
      uint64_t v22 = v9 + 16 * v21;
      *(void *)(v22 + 32) = v17;
      *(void *)(v22 + 40) = v19;
      --v8;
    }
    while (v8);
  }
  else
  {

    return MEMORY[0x1E4FBC860];
  }
  return v9;
}

uint64_t sub_1BD5FE038(uint64_t a1, void (*a2)(uint64_t, void *))
{
  uint64_t v11 = MEMORY[0x1E4FBC860];
  sub_1BD60A980();
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v7 = *v6;
      uint64_t v8 = *(v6 - 1);
      v10[0] = *(v6 - 2);
      v10[1] = v8;
      v10[2] = v7;
      swift_bridgeObjectRetain();
      a2(v5, v10);
      swift_bridgeObjectRelease();
      sub_1BD60A960();
      sub_1BD60A990();
      sub_1BD60A9A0();
      sub_1BD60A970();
      v6 += 3;
      ++v5;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void sub_1BD5FE15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 == a2)
  {
LABEL_2:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v7 = a1;
  if (a2 < a1) {
    goto LABEL_27;
  }
  uint64_t v9 = a6 - a4;
  if (!__OFSUB__(a6, a4))
  {
    uint64_t v11 = MEMORY[0x1E4FBC860];
    while (1)
    {
      if (v7 >= a2)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        break;
      }
      uint64_t v12 = v7 * a5;
      if ((unsigned __int128)(v7 * (__int128)a5) >> 64 != (v7 * a5) >> 63) {
        goto LABEL_25;
      }
      if (v12 < 1)
      {
        if (v9 <= 0 && v12 < v9) {
          goto LABEL_22;
        }
      }
      else if ((v9 & 0x8000000000000000) == 0 && v9 < v12)
      {
        goto LABEL_22;
      }
      uint64_t v14 = a4 + v12;
      if (__OFADD__(a4, v12)) {
        goto LABEL_26;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BD5D9F74();
        uint64_t v11 = v16;
      }
      unint64_t v15 = *(void *)(v11 + 16);
      if (v15 >= *(void *)(v11 + 24) >> 1)
      {
        sub_1BD5D9F74();
        uint64_t v11 = v17;
      }
      *(void *)(v11 + 16) = v15 + 1;
      *(void *)(v11 + 8 * v15 + 32) = v14;
LABEL_22:
      if (a2 == ++v7) {
        goto LABEL_2;
      }
    }
  }
  __break(1u);
}

id sub_1BD5FE2B8(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  uint64_t v4 = &v1[OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedLabel];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedValue];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  swift_unknownObjectWeakAssign();
  v8.receiver = v1;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithAccessibilityContainer_, a1);

  return v6;
}

double sub_1BD5FE36C()
{
  uint64_t v1 = MEMORY[0x1C187EAF0](v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_seriesElement);
  if (!v1) {
    return 0.0;
  }
  uint64_t v2 = (void *)v1;
  double v3 = sub_1BD600010(v0);

  return v3;
}

uint64_t sub_1BD5FE430()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedLabel);
  if (!*(void *)(v0
                  + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedLabel
                  + 8))
  {
    uint64_t v2 = MEMORY[0x1C187EAF0](v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_seriesElement);
    if (v2)
    {
      double v3 = (void *)v2;
      sub_1BD600350(v0);
      uint64_t v5 = v4;
      uint64_t v7 = v6;

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v7 = 0;
    }
    *uint64_t v1 = v5;
    v1[1] = v7;
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = *v1;
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t sub_1BD5FE4F4()
{
  return swift_bridgeObjectRelease();
}

id sub_1BD5FE514(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    uint64_t v7 = (void *)sub_1BD60A510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t sub_1BD5FE594()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedValue);
  if (!*(void *)(v0
                  + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedValue
                  + 8))
  {
    uint64_t v2 = MEMORY[0x1C187EAF0](v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_seriesElement);
    if (v2)
    {
      double v3 = (void *)v2;
      sub_1BD600350(v0);
      uint64_t v5 = v4;
      uint64_t v7 = v6;

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v7 = 0;
    }
    *uint64_t v1 = v5;
    v1[1] = v7;
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = *v1;
  swift_bridgeObjectRetain();
  return v8;
}

void sub_1BD5FE658(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = sub_1BD60A540();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  a4(v6, v8);
}

void sub_1BD5FE6E0()
{
}

void sub_1BD5FE760()
{
}

id sub_1BD5FE7B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BD5FE850(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements) = a1;
  return swift_bridgeObjectRelease();
}

id sub_1BD5FE868(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v7 = *a2;
  swift_weakInit();
  *(void *)&v3[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements] = 0;
  uint64_t v8 = &v3[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series];
  *(void *)uint64_t v8 = v7;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(a2 + 1);
  swift_weakAssign();
  sub_1BD5D7C7C(a3, (uint64_t)&v3[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel]);
  id v9 = objc_allocWithZone(MEMORY[0x1E4F28C10]);
  char v10 = v3;
  id v11 = objc_msgSend(v9, sel_init);
  *(void *)&v10[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter] = v11;

  v21.receiver = v10;
  v21.super_class = (Class)type metadata accessor for LineSeriesAccessibilityElement();
  id v12 = objc_msgSendSuper2(&v21, sel_initWithAccessibilityContainer_, a1);
  id v13 = objc_allocWithZone(MEMORY[0x1E4F29128]);
  id v14 = v12;
  id v15 = objc_msgSend(v13, sel_init);
  id v16 = objc_msgSend(v15, sel_UUIDString);

  uint64_t v17 = sub_1BD60A540();
  uint64_t v19 = v18;

  sub_1BD600C18(v17, v19, v14);
  sub_1BD5FE9FC();
  sub_1BD5FFD48();

  swift_release();
  sub_1BD600BBC(a3);
  return v14;
}

id sub_1BD5FE9FC()
{
  uint64_t v1 = v0;
  sub_1BD5D40B0();
  objc_super v2 = (void *)sub_1BD60A2F0();
  if (v2[2]
    && (uint64_t v4 = v2[4],
        uint64_t v3 = v2[5],
        uint64_t v5 = sub_1BD5FEBAC((uint64_t)v2),
        uint64_t v7 = v6,
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        v7)
    && (uint64_t v8 = sub_1BD5FEBF4(v4, v3), (v9 & 1) == 0))
  {
    double v10 = *(double *)&v8;
    id result = (id)sub_1BD5FEBF4(v5, v7);
    if ((v12 & 1) == 0)
    {
      double v13 = *(double *)&result;
      uint64_t v14 = OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter;
      id v15 = *(void **)(v0 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter);
      type metadata accessor for LineChartModel();
      id v16 = v15;
      uint64_t v17 = (void *)sub_1BD60A120();
      objc_msgSend(v16, sel_setTimeZone_, v17);

      double v18 = vabdd_f64(v13, v10);
      if (v18 >= 86400.0) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 0;
      }
      objc_msgSend(*(id *)(v1 + v14), sel_setDateStyle_, v19);
      unint64_t v20 = *(void **)(v1 + v14);
      return objc_msgSend(v20, sel_setTimeStyle_, v18 < 2764800.0);
    }
  }
  else
  {
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BD5FEBAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BD5FEBF4(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1BD60A930();
    swift_bridgeObjectRelease();
    char v6 = v9;
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      char v6 = (v3 > 0x20u || ((0x100003E01uLL >> v3) & 1) == 0)
        && (uint64_t v7 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
        && *v7 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v3 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_1BD60A950();
      }
      char v6 = sub_1BD600C7C(v4, v5, (void (*)(uint64_t *__return_ptr))sub_1BD600CF8);
      swift_bridgeObjectRelease();
    }
  }
  if (v6) {
    return 0;
  }
  else {
    return 0;
  }
}

double sub_1BD5FED9C(void *a1, uint64_t a2, double (*a3)(void))
{
  id v4 = a1;
  double v5 = a3();

  return v5;
}

double sub_1BD5FEE00()
{
  id v1 = objc_msgSend(v0, sel_accessibilityContainer);
  if (!v1) {
    return 0.0;
  }
  uint64_t v2 = v1;
  if ((objc_msgSend(v1, sel_respondsToSelector_, sel_accessibilityFrame) & 1) == 0)
  {
    swift_unknownObjectRelease();
    return 0.0;
  }
  objc_msgSend(v2, sel_accessibilityFrame);
  double v4 = v3;
  swift_unknownObjectRelease();
  return v4;
}

id sub_1BD5FEEB8()
{
  id result = sub_1BD5FEED8();
  qword_1E9FC8250 = (uint64_t)result;
  return result;
}

id sub_1BD5FEED8()
{
  uint64_t v0 = sub_1BD60A050();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  double v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD60A040();
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  sub_1BD60A030();
  if (v5)
  {
    char v6 = (void *)sub_1BD60A510();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  objc_msgSend(v4, sel_setGroupingSeparator_, v6);

  sub_1BD60A020();
  if (v7)
  {
    uint64_t v8 = (void *)sub_1BD60A510();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_msgSend(v4, sel_setDecimalSeparator_, v8);

  objc_msgSend(v4, sel_setMinimumFractionDigits_, 2);
  objc_msgSend(v4, sel_setMaximumFractionDigits_, 2);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void sub_1BD5FF0AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel];
  sub_1BD5D40B0();
  uint64_t v3 = sub_1BD60A2F0();
  id v4 = v1;
  sub_1BD5FDDFC(v3, v4);
  swift_bridgeObjectRelease();
  type metadata accessor for LineChartModel();
  objc_allocWithZone(MEMORY[0x1E4F17468]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = sub_1BD600710();
  sub_1BD5D7EB4();
  if (*(double *)&v2[*(int *)(v6 + 52)] > *(double *)&v2[*(int *)(v6 + 52) + 8])
  {
    __break(1u);
  }
  else
  {
    sub_1BD5D9BB4(0, &qword_1E9FC69F8);
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BD60A790();
    uint64_t v8 = *(void *)&v4[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series];
    uint64_t v9 = *(void *)&v4[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 8];
    MEMORY[0x1F4188790](v7);
    swift_bridgeObjectRetain();
    uint64_t v10 = swift_bridgeObjectRetain();
    sub_1BD5FE038(v10, (void (*)(uint64_t, void *))sub_1BD600790);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v11 = objc_allocWithZone(MEMORY[0x1E4F17490]);
    id v12 = sub_1BD600798(v8, v9, 1);
    sub_1BD5D9BB4(0, &qword_1E9FC6A08);
    sub_1BD5F5B08();
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1BD60D290;
    *(void *)(v13 + 32) = v12;
    id v14 = v5;
    id v15 = v7;
    sub_1BD60A5B0();
    sub_1BD60A730();
  }
}

void sub_1BD5FF3F0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
}

uint64_t sub_1BD5FF41C(double a1)
{
  if (qword_1E9FC67F8 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_1E9FC8250;
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v4 = objc_msgSend(v2, sel_stringFromNumber_, v3);

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_1BD60A540();

  return v5;
}

uint64_t sub_1BD5FF4F4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1BD5D9BB4(0, &qword_1E9FC6A88);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a3 + 16) > a1)
  {
    swift_bridgeObjectRetain();
    return sub_1BD60A6E0();
  }
  __break(1u);
  return result;
}

void (*sub_1BD5FF58C(void *a1))(id *a1)
{
  sub_1BD5FF0AC();
  *a1 = v2;
  return destroy for GridLayoutAttributesFactory.Label;
}

uint64_t sub_1BD5FF5D0(uint64_t a1, double a2)
{
  sub_1BD60A050();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  sub_1BD60083C();
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_1BD609FE0();
  OUTLINED_FUNCTION_0_7();
  uint64_t v53 = v11;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_1BD5FFAF8(1.0);
  uint64_t v55 = v10;
  if ((v17 & 1) == 0)
  {
    char v18 = 0;
    if (!a1) {
      goto LABEL_9;
    }
LABEL_6:
    id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
    sub_1BD60A040();
    sub_1BD60A030();
    if (v26)
    {
      uint64_t v27 = (void *)sub_1BD60A510();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v27 = 0;
    }
    objc_msgSend(v25, sel_setGroupingSeparator_, v27, v53);

    sub_1BD60A020();
    if (v42)
    {
      double v43 = (void *)sub_1BD60A510();
      swift_bridgeObjectRelease();
    }
    else
    {
      double v43 = 0;
    }
    objc_msgSend(v25, sel_setDecimalSeparator_, v43);

    objc_msgSend(v25, sel_setMinimumFractionDigits_, 2);
    objc_msgSend(v25, sel_setMaximumFractionDigits_, 2);
    uint64_t v44 = sub_1BD5FFC80(a2);
    if ((v45 & 1) == 0)
    {
      id v46 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)&v44);
      id v47 = objc_msgSend(v25, sel_stringFromNumber_, v46);

      if (v47)
      {
        uint64_t v41 = sub_1BD60A540();
      }
      else
      {

        uint64_t v41 = 0;
      }
      uint64_t v50 = OUTLINED_FUNCTION_2_8();
      v51(v50);
      return v41;
    }
    uint64_t v48 = OUTLINED_FUNCTION_2_8();
    v49(v48);

    return 0;
  }
  uint64_t v19 = *(void *)(v2 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16);
  unint64_t v20 = *(void *)(v19 + 16);
  if (v20 < 2)
  {
    char v18 = 1;
    if (a1) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v21 = v19 + 24 * v20;
    uint64_t v22 = *(void *)(v21 + 8);
    uint64_t v23 = *(void *)(v21 + 16);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1BD5FEBF4(v22, v23);
    char v18 = v24 & 1;
    if (a1) {
      goto LABEL_6;
    }
  }
LABEL_9:
  uint64_t v28 = sub_1BD5FFAF8(0.0);
  if (v29) {
    return 0;
  }
  if (v18) {
    return 0;
  }
  double v30 = *(double *)&v28;
  sub_1BD5FFAF8(a2);
  if (v31) {
    return 0;
  }
  double v32 = v30;
  sub_1BD609FD0();
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  sub_1BD60A110();
  uint64_t v34 = sub_1BD60A130();
  char v35 = 0;
  if (__swift_getEnumTagSinglePayload(v9, 1, v34) != 1)
  {
    char v35 = (void *)sub_1BD60A120();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v9, v34);
  }
  objc_msgSend(v33, sel_setTimeZone_, v35, v53);

  double v36 = vabdd_f64(*(double *)&v16, v32);
  BOOL v37 = v36 < 86400.0;
  if (v36 >= 86400.0) {
    uint64_t v38 = 3;
  }
  else {
    uint64_t v38 = 0;
  }
  objc_msgSend(v33, sel_setDateStyle_, v38);
  objc_msgSend(v33, sel_setTimeStyle_, v37);
  id v39 = (void *)sub_1BD609FC0();
  id v40 = objc_msgSend(v33, sel_stringFromDate_, v39);

  uint64_t v41 = sub_1BD60A540();
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v15, v55);
  return v41;
}

uint64_t sub_1BD5FFAF8(double a1)
{
  BOOL v3 = a1 >= 0.0 && a1 <= 1.0;
  if (!v3 || !swift_weakLoadStrong()) {
    return 0;
  }
  objc_msgSend(v1, sel_accessibilityFrame);
  LineChartInteractor.dataPoint(for:model:size:)((uint64_t)v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel, (uint64_t)&v12, v4 * a1, v5 * 0.5, v4, v5);
  uint64_t v6 = v13;
  if (!v13)
  {
    swift_release();
    return v6;
  }
  uint64_t v7 = v12;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_1BD60A510();
  sub_1BD600D3C(v7, v6);
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_numberFromString_, v9);

  if (!v10)
  {
    swift_release();
    return 0;
  }
  uint64_t v6 = sub_1BD60A640();
  swift_release();

  return v6;
}

uint64_t sub_1BD5FFC80(double a1)
{
  if (a1 >= 0.0 && a1 <= 1.0)
  {
    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong) {
      return Strong;
    }
    objc_msgSend(v1, sel_accessibilityFrame);
    LineChartInteractor.dataPoint(for:model:size:)((uint64_t)v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel, (uint64_t)&v8, v5 * a1, v6 * 0.5, v5, v6);
    swift_release();
    if (v9)
    {
      uint64_t Strong = v10;
      sub_1BD600D3C(v8, v9);
      return Strong;
    }
  }
  return 0;
}

void sub_1BD5FFD48()
{
  objc_msgSend(v0, sel_setAccessibilityElements_, 0);
  unint64_t v1 = *(void *)(*(void *)&v0[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16] + 16);
  if (v1)
  {
    unint64_t v9 = MEMORY[0x1E4FBC860];
    if (v1 >= 0xA) {
      uint64_t v2 = 10;
    }
    else {
      uint64_t v2 = *(void *)(*(void *)&v0[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16] + 16);
    }
    BOOL v3 = (objc_class *)type metadata accessor for LineSeriesDataElement();
    do
    {
      id v4 = objc_allocWithZone(v3);
      double v5 = v0;
      id v6 = sub_1BD5FE2B8(v5);
      MEMORY[0x1C187DDC0]();
      if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1BD60A5C0();
      }
      sub_1BD60A5F0();
      sub_1BD60A5B0();

      --v2;
    }
    while (v2);
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_1BD5FE850(v7);
    uint64_t v8 = sub_1BD5FFE8C(v9);
    swift_bridgeObjectRelease();
    sub_1BD600B3C((uint64_t)v8, v5);
  }
}

char *sub_1BD5FFE8C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1BD60AA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v10 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1BD5D49D0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x1C187E170](i, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      type metadata accessor for LineSeriesDataElement();
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BD5D49D0(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v7 = *(void *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1BD5D49D0((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      *(void *)(v3 + 16) = v8 + 1;
      sub_1BD600BAC(&v9, (_OWORD *)(v3 + 32 * v8 + 32));
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

double sub_1BD600010(uint64_t a1)
{
  unint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements];
  double v3 = 0.0;
  if (!v2) {
    return v3;
  }
  swift_bridgeObjectRetain_n();
  sub_1BD6001C4(a1, v2);
  uint64_t v6 = v5;
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_11;
  }
  long long v9 = &off_1E633C000;
  objc_msgSend(v1, sel_accessibilityFrame);
  if (CGRectIsEmpty(v15)) {
    goto LABEL_11;
  }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1BD60AA10();
    swift_bridgeObjectRelease();
    uint64_t v13 = v12;
    long long v9 = &off_1E633C000;
    if (v13) {
      goto LABEL_6;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return v3;
  }
  if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
LABEL_6:
  [v1 (SEL)v9[335]];
  CGRectGetWidth(v16);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1BD60AA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v17.origin.x = OUTLINED_FUNCTION_1_13();
  double MinX = CGRectGetMinX(v17);
  v18.origin.x = OUTLINED_FUNCTION_1_13();
  double v3 = MinX + (double)v6 / (double)v10 * CGRectGetWidth(v18);
  v19.origin.x = OUTLINED_FUNCTION_1_13();
  CGRectGetMinY(v19);
  v20.origin.x = OUTLINED_FUNCTION_1_13();
  CGRectGetHeight(v20);
  return v3;
}

void sub_1BD6001C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_21;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1C187E170](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      type metadata accessor for LineSeriesDataElement();
      char v6 = sub_1BD60A7B0();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v8 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v8 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v9 = (id)MEMORY[0x1C187E170](i + 1, a2);
          }
          else
          {
            if ((v8 & 0x8000000000000000) != 0) {
              goto LABEL_19;
            }
            if (v8 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_20;
            }
            id v9 = *(id *)(a2 + 32 + 8 * v8);
          }
          uint64_t v10 = v9;
          char v11 = sub_1BD60A7B0();

          if (v11) {
            return;
          }
        }
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_1BD60AA10();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

void sub_1BD600350(uint64_t a1)
{
  uint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16];
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return;
  }
  unint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements];
  if (!v4) {
    return;
  }
  swift_bridgeObjectRetain();
  sub_1BD6001C4(a1, v4);
  unint64_t v7 = v6;
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease();
  if (a1) {
    return;
  }
  unint64_t v9 = *(void *)(v2 + 16);
  if (v9 >= 0xA) {
    unint64_t v10 = 10;
  }
  else {
    unint64_t v10 = *(void *)(v2 + 16);
  }
  if (!v10)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v11 = v3 - 1;
  uint64_t v12 = v9 / v10;
  swift_bridgeObjectRetain();
  sub_1BD5FE15C(0, v10, v2, 0, v12, v11);
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 >= *(void *)(v13 + 16))
  {
LABEL_17:
    __break(1u);
    return;
  }
  uint64_t v14 = *(void *)(v13 + 8 * v7 + 32);
  swift_bridgeObjectRelease();
  double v15 = (double)v14 / (double)*(uint64_t *)(v2 + 16);
  id v16 = objc_msgSend(v1, sel_tc_accessibilityDataSeriesValueDescriptionForPosition_axis_, 0, v15);
  if (v16)
  {
    CGRect v17 = v16;
    sub_1BD60A540();
  }
  id v18 = objc_msgSend(v1, sel_tc_accessibilityDataSeriesValueDescriptionForPosition_axis_, 1, v15);
  if (v18)
  {
    CGRect v19 = v18;
    sub_1BD60A540();
  }
}

id LineSeriesAccessibilityElement.__allocating_init(accessibilityContainer:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v4 = objc_msgSend(v3, sel_initWithAccessibilityContainer_, sub_1BD60AAE0());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

void LineSeriesAccessibilityElement.init(accessibilityContainer:)()
{
}

id LineSeriesAccessibilityElement.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void LineSeriesAccessibilityElement.init()()
{
}

id LineSeriesAccessibilityElement.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LineSeriesAccessibilityElement();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1BD600710()
{
  id v1 = (void *)sub_1BD60A510();
  swift_bridgeObjectRelease();
  objc_super v2 = (void *)sub_1BD60A5A0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_initWithTitle_categoryOrder_, v1, v2);

  return v3;
}

uint64_t sub_1BD600790(unint64_t a1, uint64_t a2)
{
  return sub_1BD5FF4F4(a1, a2, *(void *)(v2 + 16));
}

id sub_1BD600798(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = (void *)sub_1BD60A510();
  swift_bridgeObjectRelease();
  sub_1BD5D9BB4(0, &qword_1E9FC6A88);
  unint64_t v6 = (void *)sub_1BD60A5A0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v3, sel_initWithName_isContinuous_dataPoints_, v5, a3 & 1, v6);

  return v7;
}

void sub_1BD60083C()
{
  if (!qword_1EBA19508)
  {
    sub_1BD60A130();
    unint64_t v0 = sub_1BD60A7D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19508);
    }
  }
}

uint64_t type metadata accessor for LineSeriesAccessibilityElement()
{
  uint64_t result = qword_1EBA19828;
  if (!qword_1EBA19828) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BD6008DC(void *a1@<X8>)
{
  sub_1BD5FF0AC();
  *a1 = v2;
}

uint64_t type metadata accessor for LineSeriesDataElement()
{
  return self;
}

uint64_t sub_1BD600930()
{
  return type metadata accessor for LineSeriesAccessibilityElement();
}

uint64_t sub_1BD600938()
{
  uint64_t result = type metadata accessor for LineChartModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for LineSeriesAccessibilityElement(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineSeriesAccessibilityElement);
}

uint64_t dispatch thunk of LineSeriesAccessibilityElement.accessibilityChartDescriptor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LineSeriesAccessibilityElement.accessibilityChartDescriptor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of LineSeriesAccessibilityElement.accessibilityChartDescriptor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

unint64_t sub_1BD600AAC(unint64_t result, char a2, uint64_t a3)
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

unsigned char *sub_1BD600AD0@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void sub_1BD600B3C(uint64_t a1, void *a2)
{
  id v3 = (id)sub_1BD60A5A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setAccessibilityElements_, v3);
}

_OWORD *sub_1BD600BAC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1BD600BBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LineChartModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BD600C18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1BD60A510();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAccessibilityIdentifier_, v4);
}

uint64_t sub_1BD600C7C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_1BD600CDC@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_1BD600AD0(a1, a2);
}

void *sub_1BD600CF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_1BD600D3C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

double ValueAxis.range.getter()
{
  return *(double *)v0;
}

uint64_t ValueAxis.calculationModel.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BD5D5D9C(v1 + 16, a1);
}

uint64_t ValueAxis.grids.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ValueAxis.init(range:calculationModel:grids:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  uint64_t result = sub_1BD5DBA08(a1, a3 + 16);
  *(void *)(a3 + 56) = a2;
  return result;
}

uint64_t destroy for ValueAxis(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ValueAxis(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ValueAxis(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ValueAxis(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueAxis(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for ValueAxis(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueAxis()
{
  return &type metadata for ValueAxis;
}

TeaCharts::LineChartStyle __swiftcall LineChartStyle.init(lineStyles:)(TeaCharts::LineChartStyle lineStyles)
{
  v1->lineStyles._rawValue = lineStyles.lineStyles._rawValue;
  return lineStyles;
}

ValueMetadata *type metadata accessor for LineChartStyle()
{
  return &type metadata for LineChartStyle;
}

uint64_t ChartViewController<>.accessibilityRedrawsOnBoldTextStatusChange.getter()
{
  return 1;
}

uint64_t sub_1BD600FF8(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1BD60AA10())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C187E170](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      BOOL v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = objc_msgSend(a2, sel_layer);
      objc_msgSend(v9, sel_bounds);
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      objc_msgSend(v7, sel_setFrame_, v11, v13, v15, v17);
      ++v5;
      if (v8 == v4) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

void GridView.__allocating_init(numberOfGrids:numberOfLabels:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  GridView.init(numberOfGrids:numberOfLabels:)(a1, a2);
}

id GridView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void GridView.init(coder:)()
{
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers] = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR____TtC9TeaCharts8GridView_labels] = v1;

  sub_1BD60AA00();
  __break(1u);
}

void GridView.init(numberOfGrids:numberOfLabels:)(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  uint64_t v5 = MEMORY[0x1E4FBC860];
  *(void *)(v2 + OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers) = MEMORY[0x1E4FBC860];
  *(void *)(v2 + OBJC_IVAR____TtC9TeaCharts8GridView_labels) = v5;
  double v6 = OUTLINED_FUNCTION_0_6();
  id v9 = (char *)objc_msgSendSuper2(v7, v8, v6);
  if (a1 < 0)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  double v10 = v9;
  if (a1)
  {
    double v11 = &v9[OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers];
    double v12 = v9;
    do
    {
      id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C88]), sel_init);
      OUTLINED_FUNCTION_0_16();
      id v14 = v13;
      MEMORY[0x1C187DDC0]();
      if (*(void *)((*(void *)v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v11 & 0xFFFFFFFFFFFFFF8)
                                                                                   + 0x18) >> 1)
        sub_1BD60A5C0();
      sub_1BD60A5F0();
      sub_1BD60A5B0();
      swift_endAccess();
      id v15 = objc_msgSend(v12, sel_layer);
      objc_msgSend(v15, sel_addSublayer_, v14);

      --a1;
    }
    while (a1);
  }
  else
  {
    double v16 = v9;
  }
  if (a2 < 0) {
    goto LABEL_17;
  }
  if (a2)
  {
    double v17 = &v10[OBJC_IVAR____TtC9TeaCharts8GridView_labels];
    do
    {
      id v18 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
      double v19 = OUTLINED_FUNCTION_0_6();
      id v22 = objc_msgSend(v20, v21, v19);
      objc_msgSend(v22, sel_setIsAccessibilityElement_, 0);
      OUTLINED_FUNCTION_0_16();
      id v23 = v22;
      MEMORY[0x1C187DDC0]();
      if (*(void *)((*(void *)v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v17 & 0xFFFFFFFFFFFFFF8)
                                                                                   + 0x18) >> 1)
        sub_1BD60A5C0();
      sub_1BD60A5F0();
      sub_1BD60A5B0();
      swift_endAccess();
      objc_msgSend(v10, sel_addSubview_, v23);

      --a2;
    }
    while (a2);
  }
}

Swift::Void __swiftcall GridView.layoutSubviews()()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  swift_beginAccess();
  id v1 = v0;
  unint64_t v2 = swift_bridgeObjectRetain();
  sub_1BD600FF8(v2, v1);
  swift_bridgeObjectRelease();
}

id GridView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void GridView.init(frame:)()
{
}

id GridView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GridView()
{
  return self;
}

uint64_t method lookup function for GridView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GridView);
}

uint64_t dispatch thunk of GridView.__allocating_init(numberOfGrids:numberOfLabels:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void *initializeBufferWithCopyOfBuffer for LineChartImages(void *a1, uint64_t a2)
{
  objc_super v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LineChartImages(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for LineChartImages(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for LineChartImages(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LineChartImages(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LineChartImages(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LineChartImages()
{
  return &type metadata for LineChartImages;
}

uint64_t LinePathGenerator.__allocating_init(coordinateProvider:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t LinePathGenerator.init(coordinateProvider:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t LinePathGenerator.deinit()
{
  swift_release();
  return v0;
}

uint64_t LinePathGenerator.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for LinePathGenerator()
{
  return self;
}

uint64_t method lookup function for LinePathGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LinePathGenerator);
}

uint64_t dispatch thunk of LinePathGenerator.__allocating_init(coordinateProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

id sub_1BD601964(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14C0]), sel_init);
  uint64_t v3 = a1[2];
  if (v3) {
    BOOL v4 = v3 == 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[5];
    uint64_t v22 = a1[4];
    uint64_t v23 = v7;
    uint64_t v24 = v6;
    swift_bridgeObjectRetain();
    uint64_t v8 = LineChartCoordinateProvider.location(for:in:)(&v22);
    double v10 = v9;
    char v12 = v11;
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v2, sel_moveToPoint_, *(double *)&v8, v10);
      id v13 = a1 + 9;
      uint64_t v14 = v3 - 1;
      do
      {
        uint64_t v15 = *(v13 - 1);
        uint64_t v16 = *v13;
        uint64_t v22 = *(v13 - 2);
        uint64_t v23 = v15;
        uint64_t v24 = v16;
        swift_bridgeObjectRetain();
        uint64_t v17 = LineChartCoordinateProvider.location(for:in:)(&v22);
        double v19 = v18;
        char v21 = v20;
        swift_bridgeObjectRelease();
        if ((v21 & 1) == 0) {
          objc_msgSend(v2, sel_addLineToPoint_, *(double *)&v17, v19);
        }
        v13 += 3;
        --v14;
      }
      while (v14);
    }
  }
  return v2;
}

id sub_1BD601AA0(double *a1, double a2, double a3)
{
  id v5 = sub_1BD601964(a1);
  objc_msgSend(v5, sel_currentPoint);
  objc_msgSend(v5, sel_addLineToPoint_);
  if (*((void *)a1 + 2))
  {
    uint64_t v7 = *((void *)a1 + 4);
    uint64_t v6 = *((void *)a1 + 5);
    double v8 = a1[6];
    swift_bridgeObjectRetain();
    uint64_t v9 = LineChartCoordinateProvider.horizontalLocation(for:in:)(v7, v6);
    if (v10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      double v11 = *(double *)&v9;
      LineChartCoordinateProvider.verticalLocation(for:in:)(v8);
      char v13 = v12;
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        objc_msgSend(v5, sel_addLineToPoint_, v11, a3);
        objc_msgSend(v5, sel_closePath);
      }
    }
  }
  return v5;
}

uint64_t sub_1BD601B90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v9 = *v4;
  uint64_t v10 = LineChartCoordinateProvider.copy()();
  sub_1BD60A150();
  sub_1BD609384(a1, a3, a4);
  sub_1BD60A160();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v10;
  a2[3] = v9;
  a2[4] = (uint64_t)&off_1F17FF7D0;
  *a2 = result;
  return result;
}

uint64_t LineStyle.__allocating_init(stroke:fill:zoneStyles:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  LineStyle.init(stroke:fill:zoneStyles:)(a1, a2, a3);
  return v6;
}

uint64_t sub_1BD601CB4()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_blackColor);
  id v2 = objc_msgSend(v0, sel_clearColor);
  type metadata accessor for LineStyle();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0x3FF0000000000000;
  *(void *)(result + 32) = v1;
  *(unsigned char *)(result + 40) = 0;
  *(void *)(result + 48) = v2;
  *(unsigned char *)(result + 56) = 0;
  *(void *)(result + 64) = MEMORY[0x1E4FBC860];
  qword_1E9FC6B00 = result;
  return result;
}

uint64_t static LineStyle.default.getter()
{
  if (qword_1E9FC6800 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t LineStyle.init(stroke:fill:zoneStyles:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 24);
  uint64_t v7 = *a2;
  char v8 = *((unsigned char *)a2 + 8);
  *(void *)(v3 + 16) = *(void *)a1;
  *(void *)(v3 + 24) = v4;
  *(void *)(v3 + 32) = v5;
  *(unsigned char *)(v3 + 40) = v6;
  *(void *)(v3 + 48) = v7;
  *(unsigned char *)(v3 + 56) = v8;
  *(void *)(v3 + 64) = a3;
  return v3;
}

uint64_t LineStyle.deinit()
{
  swift_bridgeObjectRelease();
  sub_1BD5D48A0(*(void **)(v0 + 48), *(unsigned char *)(v0 + 56));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LineStyle.__deallocating_deinit()
{
  LineStyle.deinit();

  return MEMORY[0x1F4186488](v0, 72, 7);
}

uint64_t type metadata accessor for LineStyle()
{
  return self;
}

uint64_t method lookup function for LineStyle(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineStyle);
}

uint64_t dispatch thunk of LineStyle.__allocating_init(stroke:fill:zoneStyles:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void *assignWithCopy for AxisGridViewModelGeneratorOptions(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  uint64_t v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for AxisGridViewModelGeneratorOptions(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a1[1];
  a1[1] = a2[1];

  return a1;
}

ValueMetadata *type metadata accessor for AxisGridViewModelGeneratorOptions()
{
  return &type metadata for AxisGridViewModelGeneratorOptions;
}

uint64_t dispatch thunk of AxisGridViewModelGeneratorType.models(for:orientation:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t SparklineCoordinateProvider.location(for:in:model:size:)(double *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  char v6 = v5;
  double v10 = *a1;
  uint64_t v11 = *((void *)a1 + 1);
  double v12 = a1[2];
  uint64_t v13 = v6[10];
  uint64_t v14 = v6[11];
  __swift_project_boxed_opaque_existential_1(v6 + 7, v13);
  char v25 = 0;
  uint64_t v15 = (*(uint64_t (**)(double, uint64_t, uint64_t, char *, uint64_t, uint64_t, double))(v14 + 8))(COERCE_DOUBLE(*(void *)&v10), v11, a5, &v25, v13, v14, a2);
  if (v16) {
    return 0;
  }
  uint64_t v17 = v15;
  double v18 = v6 + 2;
  uint64_t v20 = v6[5];
  uint64_t v19 = v6[6];
  __swift_project_boxed_opaque_existential_1(v18, v20);
  sub_1BD5D7EB4();
  uint64_t v22 = a5 + *(int *)(v21 + 52);
  char v24 = 1;
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, double, double))(v19 + 8))(v22, &v24, v20, v19, v12, a3);
  return v17;
}

uint64_t SparklineCoordinateProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t SparklineCoordinateProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t sub_1BD6020DC(double *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  return SparklineCoordinateProvider.location(for:in:model:size:)(a1, a4, a5, a2, a3);
}

uint64_t dispatch thunk of SparklineCoordinateProviderType.location(for:in:model:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t type metadata accessor for SparklineCoordinateProvider()
{
  return self;
}

uint64_t method lookup function for SparklineCoordinateProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SparklineCoordinateProvider);
}

uint64_t StyleManager.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = sub_1BD60A7D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t StyleManager.register(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_1BD60A7D0();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x1F4188790](v4);
  char v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t, double))(*(void *)(v3 - 8) + 16))((char *)&v11 - v7, a1, v3, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v3);
  uint64_t v9 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v9, v8, v4);
  return swift_endAccess();
}

uint64_t StyleManager.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_1BD60A7D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StyleManager.__deallocating_deinit()
{
  StyleManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BD602460(uint64_t a1)
{
  return StyleManager.register(_:)(a1);
}

uint64_t sub_1BD602484(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1BD6024C0@<X0>(uint64_t a1@<X8>)
{
  return StyleManager.style.getter(a1);
}

uint64_t dispatch thunk of StyleProviderType.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StyleManagerType.register(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_1BD60250C()
{
  uint64_t result = sub_1BD60A7D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for StyleManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for StyleManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StyleManager);
}

uint64_t sub_1BD6025D0()
{
  swift_beginAccess();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_17(v0, MEMORY[0x1E4FBC848]);
  sub_1BD60A610();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_1BD60A580();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BD6026B0()
{
  OUTLINED_FUNCTION_1_14();
  uint64_t v0 = swift_allocObject();
  sub_1BD602A90();
  return v0;
}

uint64_t sub_1BD6026E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = v2 + 40;
    do
    {
      uint64_t v5 = *(void (**)(uint64_t))(v4 - 8);
      uint64_t v6 = swift_retain();
      v5(v6);
      swift_release();
      v4 += 16;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_17(v7, MEMORY[0x1E4FBC848]);
  uint64_t v8 = sub_1BD60A5D0();
  swift_beginAccess();
  *(void *)(v1 + 16) = v8;
  swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

uint64_t HighlightInteraction.onChange(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = *(void *)(v5 + 80);
  v6[3] = a1;
  v6[4] = a2;
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for HighlightInteraction.InteractionType();
  OUTLINED_FUNCTION_0_17(v7, MEMORY[0x1E4FBC848]);
  sub_1BD60A610();
  swift_retain();
  sub_1BD60A600();
  return swift_endAccess();
}

uint64_t sub_1BD6028D4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BD60290C()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t type metadata accessor for HighlightInteraction.InteractionType()
{
  return __swift_instantiateGenericMetadata();
}

void HighlightInteraction.onEnd(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  sub_1BD602B24();
  uint64_t v6 = *(void *)(*(void *)(v2 + 24) + 16);
  sub_1BD602AE4(v6);
  uint64_t v7 = *(void *)(v2 + 24);
  *(void *)(v7 + 16) = v6 + 1;
  uint64_t v8 = v7 + 16 * v6;
  *(void *)(v8 + 32) = sub_1BD602A14;
  *(void *)(v8 + 40) = v5;
}

uint64_t sub_1BD6029E4()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_1_14();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1BD602A14()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t HighlightInteraction.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HighlightInteraction.__deallocating_deinit()
{
  HighlightInteraction.deinit();
  uint64_t v0 = OUTLINED_FUNCTION_1_14();

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BD602A90()
{
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_17(v1, MEMORY[0x1E4FBC848]);
  uint64_t v2 = sub_1BD60A5D0();
  uint64_t v3 = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return v0;
}

void sub_1BD602AE4(uint64_t a1)
{
  if (a1 + 1 > *(void *)(*(void *)v1 + 24) >> 1)
  {
    sub_1BD5DA068();
    *(void *)uint64_t v1 = v2;
  }
}

void sub_1BD602B24()
{
  uint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1BD5DA068();
    *uint64_t v0 = v3;
  }
}

uint64_t sub_1BD602B70()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for HighlightInteraction()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for HighlightInteraction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HighlightInteraction);
}

uint64_t sub_1BD602BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1BD602BF0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v2[4] = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_1BD602C90(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  int v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v8;
  unint64_t v10 = ~(unint64_t)v8;
  uint64_t v11 = v7 + v8;
  if ((v11 & v10) + v7 <= v7) {
    uint64_t v12 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v12 = (v11 & ~(unint64_t)v8) + v7;
  }
  int v13 = v8 & 0x100000;
  if (v9 > 7 || v13 != 0 || (unint64_t)(v12 + 1) > 0x18)
  {
    uint64_t v16 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v16 + ((v9 + 16) & v10));
    swift_retain();
  }
  else
  {
    unsigned int v17 = a2[v12];
    if (v17 >= 2)
    {
      if (v12 <= 3) {
        uint64_t v18 = v12;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *a2;
          goto LABEL_22;
        case 2:
          int v19 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v19 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v19 = *(_DWORD *)a2;
LABEL_22:
          int v20 = (v19 | ((v17 - 2) << (8 * v12))) + 2;
          unsigned int v21 = v19 + 2;
          if (v12 >= 4) {
            unsigned int v17 = v21;
          }
          else {
            unsigned int v17 = v20;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v22 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16);
    v22(a1, a2, v5);
    if (v17 == 1)
    {
      v22((void *)(((unint64_t)v4 + v11) & v10), (unsigned __int8 *)((unint64_t)&a2[v11] & v10), v5);
      *((unsigned char *)v4 + v12) = 1;
    }
    else
    {
      *((unsigned char *)v4 + v12) = 0;
    }
  }
  return v4;
}

uint64_t sub_1BD602E54(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = v5 + v6;
  if (((v5 + v6) & ~v6) + v5 > v5) {
    v5 += (v5 + v6) & ~v6;
  }
  unsigned int v8 = a1[v5];
  if (v8 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a1;
        goto LABEL_12;
      case 2:
        int v10 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v10 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v10 = *(_DWORD *)a1;
LABEL_12:
        int v11 = (v10 | ((v8 - 2) << (8 * v5))) + 2;
        unsigned int v12 = v10 + 2;
        if (v5 >= 4) {
          unsigned int v8 = v12;
        }
        else {
          unsigned int v8 = v11;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v14 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v4 + 8);
  uint64_t result = v14(a1, v3);
  if (v8 == 1)
  {
    return v14((unsigned __int8 *)((unint64_t)&a1[v7] & ~v6), v3);
  }
  return result;
}

uint64_t sub_1BD602FE0(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  if (((v7 + v8) & ~v8) + v7 <= v7) {
    uint64_t v10 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v10 = ((v7 + v8) & ~v8) + v7;
  }
  unsigned int v11 = a2[v10];
  if (v11 >= 2)
  {
    if (v10 <= 3) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a2;
        goto LABEL_13;
      case 2:
        int v13 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v13 = *(_DWORD *)a2;
LABEL_13:
        int v14 = (v13 | ((v11 - 2) << (8 * v10))) + 2;
        unsigned int v15 = v13 + 2;
        if (v10 >= 4) {
          unsigned int v11 = v15;
        }
        else {
          unsigned int v11 = v14;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v16 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v6 + 16);
  v16(a1, a2, v5);
  if (v11 == 1)
  {
    v16((v9 + a1) & ~v8, (unsigned __int8 *)((unint64_t)&a2[v9] & ~v8), v5);
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  *(unsigned char *)(a1 + v10) = v17;
  return a1;
}

unsigned __int8 *sub_1BD60316C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v9 = v7 + v8;
    if (((v7 + v8) & ~v8) + v7 <= v7) {
      uint64_t v10 = *(void *)(v6 + 64);
    }
    else {
      uint64_t v10 = ((v7 + v8) & ~v8) + v7;
    }
    unsigned int v11 = a1[v10];
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a1;
          goto LABEL_14;
        case 2:
          int v13 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v13 = *(_DWORD *)a1;
LABEL_14:
          int v14 = (v13 | ((v11 - 2) << (8 * v10))) + 2;
          unsigned int v15 = v13 + 2;
          if (v10 >= 4) {
            unsigned int v11 = v15;
          }
          else {
            unsigned int v11 = v14;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v16 = ~v8;
    char v17 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
    v17(a1, v5);
    if (v11 == 1) {
      v17((unsigned __int8 *)((unint64_t)&a1[v9] & v16), v5);
    }
    unsigned int v18 = a2[v10];
    if (v18 >= 2)
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
          goto LABEL_28;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_28:
          int v21 = (v20 | ((v18 - 2) << (8 * v10))) + 2;
          unsigned int v22 = v20 + 2;
          if (v10 >= 4) {
            unsigned int v18 = v22;
          }
          else {
            unsigned int v18 = v21;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v23 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
    v23(a1, a2, v5);
    if (v18 == 1)
    {
      v23((unsigned __int8 *)((unint64_t)&a1[v9] & v16), (unsigned __int8 *)((unint64_t)&a2[v9] & v16), v5);
      char v24 = 1;
    }
    else
    {
      char v24 = 0;
    }
    a1[v10] = v24;
  }
  return a1;
}

uint64_t sub_1BD6033C8(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  if (((v7 + v8) & ~v8) + v7 <= v7) {
    uint64_t v10 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v10 = ((v7 + v8) & ~v8) + v7;
  }
  unsigned int v11 = a2[v10];
  if (v11 >= 2)
  {
    if (v10 <= 3) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a2;
        goto LABEL_13;
      case 2:
        int v13 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v13 = *(_DWORD *)a2;
LABEL_13:
        int v14 = (v13 | ((v11 - 2) << (8 * v10))) + 2;
        unsigned int v15 = v13 + 2;
        if (v10 >= 4) {
          unsigned int v11 = v15;
        }
        else {
          unsigned int v11 = v14;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v16 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v6 + 32);
  v16(a1, a2, v5);
  if (v11 == 1)
  {
    v16((v9 + a1) & ~v8, (unsigned __int8 *)((unint64_t)&a2[v9] & ~v8), v5);
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  *(unsigned char *)(a1 + v10) = v17;
  return a1;
}

unsigned __int8 *sub_1BD603554(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v9 = v7 + v8;
    if (((v7 + v8) & ~v8) + v7 <= v7) {
      uint64_t v10 = *(void *)(v6 + 64);
    }
    else {
      uint64_t v10 = ((v7 + v8) & ~v8) + v7;
    }
    unsigned int v11 = a1[v10];
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a1;
          goto LABEL_14;
        case 2:
          int v13 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v13 = *(_DWORD *)a1;
LABEL_14:
          int v14 = (v13 | ((v11 - 2) << (8 * v10))) + 2;
          unsigned int v15 = v13 + 2;
          if (v10 >= 4) {
            unsigned int v11 = v15;
          }
          else {
            unsigned int v11 = v14;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v16 = ~v8;
    char v17 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
    v17(a1, v5);
    if (v11 == 1) {
      v17((unsigned __int8 *)((unint64_t)&a1[v9] & v16), v5);
    }
    unsigned int v18 = a2[v10];
    if (v18 >= 2)
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
          goto LABEL_28;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_28:
          int v21 = (v20 | ((v18 - 2) << (8 * v10))) + 2;
          unsigned int v22 = v20 + 2;
          if (v10 >= 4) {
            unsigned int v18 = v22;
          }
          else {
            unsigned int v18 = v21;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v23 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
    v23(a1, a2, v5);
    if (v18 == 1)
    {
      v23((unsigned __int8 *)((unint64_t)&a1[v9] & v16), (unsigned __int8 *)((unint64_t)&a2[v9] & v16), v5);
      char v24 = 1;
    }
    else
    {
      char v24 = 0;
    }
    a1[v10] = v24;
  }
  return a1;
}

uint64_t sub_1BD6037B0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 24) - 8);
  unint64_t v4 = *(void *)(v3 + 64);
  unint64_t v5 = ((v4 + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + v4;
  if (v5 <= v4) {
    unint64_t v5 = v4;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  unint64_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    unsigned int v10 = ((a2 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v10 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v10 < 2)
    {
LABEL_22:
      unsigned int v12 = *((unsigned __int8 *)a1 + v5);
      if (v12 >= 2) {
        return (v12 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_22;
  }
LABEL_14:
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
  return (v6 | v11) + 255;
}

void sub_1BD60391C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 24) - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  unint64_t v7 = ((v6 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + v6;
  if (v7 > v6) {
    unint64_t v6 = v7;
  }
  size_t v8 = v6 + 1;
  char v9 = 8 * (v6 + 1);
  if (a3 < 0xFF)
  {
    int v10 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v13 = ((a3 + ~(-1 << v9) - 254) >> v9) + 1;
    if (HIWORD(v13))
    {
      int v10 = 4;
    }
    else if (v13 >= 0x100)
    {
      int v10 = 2;
    }
    else
    {
      int v10 = v13 > 1;
    }
  }
  else
  {
    int v10 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v11 = a2 - 255;
    if (v8 < 4)
    {
      int v12 = (v11 >> v9) + 1;
      if (v6 != -1)
      {
        int v14 = v11 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v14;
          a1[2] = BYTE2(v14);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v14;
        }
        else
        {
          *a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v6 + 1);
      *(_DWORD *)a1 = v11;
      int v12 = 1;
    }
    switch(v10)
    {
      case 1:
        a1[v8] = v12;
        break;
      case 2:
        *(_WORD *)&a1[v8] = v12;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1BD603B18);
      case 4:
        *(_DWORD *)&a1[v8] = v12;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v10)
    {
      case 1:
        a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v6] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_1BD603B40(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 24) - 8);
  unint64_t v3 = *(void *)(v2 + 64);
  unint64_t v4 = ((v3 + *(unsigned __int8 *)(v2 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)) + v3;
  if (v4 <= v3) {
    unint64_t v4 = v3;
  }
  uint64_t v5 = a1[v4];
  int v6 = v5 - 2;
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
        int v8 = *a1;
        goto LABEL_12;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v9 = (v8 | (v6 << (8 * v4))) + 2;
        LODWORD(v5) = v8 + 2;
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

void sub_1BD603C30(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  size_t v5 = *(void *)(v4 + 64);
  size_t v6 = ((v5 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v5;
  if (a2 > 1)
  {
    if (v6 <= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = v6;
    }
    unsigned int v8 = a2 - 2;
    if (v7 < 4)
    {
      unsigned int v9 = v8 >> (8 * v7);
      int v10 = v8 & ~(-1 << (8 * v7));
      a1[v7] = v9 + 2;
      bzero(a1, v7);
      if (v7 == 3)
      {
        *(_WORD *)a1 = v10;
        a1[2] = BYTE2(v10);
      }
      else if (v7 == 2)
      {
        *(_WORD *)a1 = v10;
      }
      else
      {
        *a1 = v10;
      }
    }
    else
    {
      a1[v7] = 2;
      bzero(a1, v7);
      *(_DWORD *)a1 = v8;
    }
  }
  else
  {
    if (v6 > v5) {
      size_t v5 = v6;
    }
    a1[v5] = a2;
  }
}

uint64_t sub_1BD603D48(uint64_t (**a1)(void))
{
  return (*a1)(*(void *)(v1 + 24));
}

uint64_t ZoneManager.zones.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v4 = sub_1BD60A340();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ZoneManager.add(zone:)()
{
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_0_18();
  uint64_t v1 = sub_1BD60A340();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = &v9[-v3];
  OUTLINED_FUNCTION_0_18();
  uint64_t v6 = v0 + *(void *)(v5 + 96);
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  sub_1BD60A1C0();
  char v7 = sub_1BD60A320();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  if (v7)
  {
    sub_1BD60A1C0();
    OUTLINED_FUNCTION_1_15();
    sub_1BD60A310();
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1_15();
  sub_1BD60A300();
  return swift_endAccess();
}

uint64_t ZoneManager.remove(zone:)()
{
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall ZoneManager.removeZone(for:)(Swift::String a1)
{
}

uint64_t ZoneManager.deinit()
{
  OUTLINED_FUNCTION_2_10();
  uint64_t v2 = v0 + *(void *)(v1 + 96);
  OUTLINED_FUNCTION_2_10();
  uint64_t v3 = sub_1BD60A340();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t ZoneManager.__deallocating_deinit()
{
  ZoneManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BD60429C()
{
  return ZoneManager.add(zone:)();
}

uint64_t sub_1BD6042C0()
{
  return ZoneManager.remove(zone:)();
}

void sub_1BD6042E4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1BD604308(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1BD604344@<X0>(uint64_t a1@<X8>)
{
  return ZoneManager.zones.getter(a1);
}

uint64_t dispatch thunk of ZoneProviderType.zones.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ZoneManagerType.add(zone:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ZoneManagerType.remove(zone:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ZoneManagerType.removeZone(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_1BD6043B8()
{
  uint64_t result = sub_1BD60A340();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ZoneManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ZoneManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ZoneManager);
}

uint64_t initializeBufferWithCopyOfBuffer for Fill(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1BD5D6054(*(void **)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for Fill(uint64_t a1)
{
}

uint64_t assignWithCopy for Fill(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1BD5D6054(*(void **)a2, v4);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_1BD5D48A0(v5, v6);
  return a1;
}

uint64_t assignWithTake for Fill(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_1BD5D48A0(v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for Fill()
{
  return &type metadata for Fill;
}

uint64_t sub_1BD604580()
{
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1B9C0);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1BA78);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5D5ED8();
  sub_1BD60A390();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1BA80);
  OUTLINED_FUNCTION_0_3();
  swift_release();
  swift_release();
  sub_1BD60A250();
  sub_1BD5DB530(0, &qword_1EBA1AA08);
  sub_1BD60A3A0();
  swift_release();

  return swift_release();
}

uint64_t sub_1BD60473C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BD60477C((uint64_t (*)(void))type metadata accessor for ValueCoordinateCalculator, (uint64_t)&off_1F17FFDF8, a1);
}

uint64_t sub_1BD60475C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BD60477C((uint64_t (*)(void))type metadata accessor for CategoryCoordinateCalculator, (uint64_t)&off_1F17FDD50, a1);
}

uint64_t sub_1BD60477C@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1(0);
  uint64_t result = swift_allocObject();
  a3[3] = v5;
  a3[4] = a2;
  *a3 = result;
  return result;
}

uint64_t sub_1BD6047CC()
{
  sub_1BD5D5ED8();
  uint64_t v0 = swift_allocObject();
  unint64_t v1 = sub_1BD5D5D04();
  unint64_t v2 = sub_1BD5D5D50();
  MEMORY[0x1C187DB00](MEMORY[0x1E4FBC860], &type metadata for CategoryZone, v1, v2);
  return v0;
}

uint64_t sub_1BD604850@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD5DB530(0, &qword_1EBA1B9C8);
  uint64_t result = sub_1BD60A200();
  if (v21)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
    double v5 = MEMORY[0x1F4188790](v4);
    char v7 = (void *)((char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v8 + 16))(v7, v5);
    uint64_t v9 = *v7;
    uint64_t v10 = type metadata accessor for GridLayoutAttributesFactory();
    v19[3] = v10;
    v19[4] = &off_1F17FDEB8;
    v19[0] = v9;
    uint64_t v11 = type metadata accessor for ChartLayoutAttributesFactory();
    int v12 = (void *)swift_allocObject();
    uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v10);
    double v14 = MEMORY[0x1F4188790](v13);
    uint64_t v16 = (void *)((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v17 + 16))(v16, v14);
    uint64_t v18 = *v16;
    v12[5] = v10;
    v12[6] = &off_1F17FDEB8;
    v12[2] = v18;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    a2[3] = v11;
    a2[4] = &off_1F17FFC38;
    *a2 = v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BD604A78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BD60A220();
  swift_allocObject();
  uint64_t result = sub_1BD60A210();
  uint64_t v4 = MEMORY[0x1E4FAA9E0];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for ChartsAssembly()
{
  return self;
}

uint64_t sub_1BD604AF4()
{
  return sub_1BD604580();
}

uint64_t dispatch thunk of ChartLayoutAttributesFactoryType.attributes(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

double sub_1BD604B20@<D0>(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  double v6 = *a2;
  double v7 = a2[1];
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  v17[0] = v6;
  v17[1] = v7;
  sub_1BD5D84D4(a1, v17, (uint64_t)v18);
  double result = v19;
  double v9 = v20;
  double v10 = v21;
  double v11 = v22;
  double v12 = v6 - v20 - v22;
  double v13 = v7 - v19 - v21;
  long long v14 = v23;
  long long v15 = v18[0];
  long long v16 = v18[1];
  *(double *)a3 = v20;
  *(double *)(a3 + 8) = result;
  *(double *)(a3 + 16) = v12;
  *(double *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 32) = v15;
  *(_OWORD *)(a3 + 48) = v16;
  *(double *)(a3 + 64) = result;
  *(double *)(a3 + 72) = v9;
  *(double *)(a3 + 80) = v10;
  *(double *)(a3 + 88) = v11;
  *(_OWORD *)(a3 + 96) = v14;
  return result;
}

uint64_t type metadata accessor for ChartLayoutAttributesFactory()
{
  return self;
}

double sub_1BD604BE0@<D0>(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1BD604B20(a1, a2, a3);
}

void *sub_1BD604C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1BD5ED34C();
  if ((v5 & 1) == 0) {
    return 0;
  }
  double v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

uint64_t sub_1BD604C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1BD5ED34C();
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_1BD604CA8(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a4 + 16) && (unint64_t v5 = sub_1BD5ED648(a1), (v6 & 1) != 0)) {
    return *(void *)(*(void *)(a4 + 56) + 8 * v5);
  }
  else {
    return 0;
  }
}

uint64_t ColumnChartCoordinateProvider.location(for:in:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  double v5 = *((double *)a1 + 2);
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  sub_1BD60A150();
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_seriesDictionary);
  if (!v8) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BD604C50(v7, v6, v8);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1BD604CA8(v5, v3, v4, v11);
  char v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
    v17[0] = v3;
    v17[1] = v4;
    *(double *)&double v17[2] = v5;
    uint64_t v15 = sub_1BD605A5C(v12, v9, v17);
  }
  else
  {
LABEL_5:
    uint64_t v15 = 0;
  }
  sub_1BD60A160();
  return v15;
}

__n128 ColumnChartCoordinateProvider.options.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = v4;
  return result;
}

uint64_t sub_1BD604E80(long long *a1)
{
  uint64_t v3 = sub_1BD60A180();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace;
  sub_1BD5D7EB4();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
  uint64_t v6 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  *(unsigned char *)(v6 + 16) = 1;
  uint64_t v7 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
  *(_OWORD *)uint64_t v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(unsigned char *)(v7 + 32) = 1;
  *(void *)(v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_seriesDictionary) = 0;
  uint64_t v8 = OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_lock;
  sub_1BD60A170();
  sub_1BD60A1A0();
  swift_allocObject();
  *(void *)(v1 + v8) = sub_1BD60A190();
  sub_1BD5DBA08(a1, v1 + 16);
  return v1;
}

uint64_t ColumnChartCoordinateProvider.horizontalLocation(for:in:)(uint64_t a1, uint64_t a2)
{
  sub_1BD60A150();
  sub_1BD60501C(a1, a2);
  uint64_t v5 = v4;
  sub_1BD60A160();
  return v5;
}

double sub_1BD60501C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
  swift_beginAccess();
  if ((*(unsigned char *)(v5 + 32) & 1) == 0) {
    return *(double *)(v5 + 24) * (double)a1
  }
         + *(double *)(v5 + 16) * (double)a1
         + *(double *)(v5 + 8) * (double)a2
         + *(double *)v5 * (double)a2;
  return result;
}

uint64_t ColumnChartCoordinateProvider.verticalLocation(for:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  sub_1BD60A150();
  v6[0] = v1;
  v6[1] = v2;
  v6[2] = v3;
  uint64_t v4 = sub_1BD605134((uint64_t)v6);
  sub_1BD60A160();
  return v4;
}

uint64_t sub_1BD605134(uint64_t a1)
{
  sub_1BD605ADC();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BD5D7EB4();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size + 16)) {
    return 0;
  }
  double v10 = *(double *)(a1 + 16);
  double v11 = *(double *)((char *)v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size + 8);
  uint64_t v12 = (uint64_t)v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1BD605F0C(v12, (uint64_t)v5, (uint64_t (*)(void))sub_1BD605ADC);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) == 1)
  {
    sub_1BD605F74((uint64_t)v5, (uint64_t (*)(void))sub_1BD605ADC);
    return 0;
  }
  sub_1BD5F01A8((uint64_t)v5, (uint64_t)v9);
  uint64_t v14 = v1[5];
  uint64_t v15 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v14);
  long long v16 = &v9[*(int *)(v7 + 52)];
  char v19 = 1;
  double v17 = (*(double (**)(unsigned char *, char *, uint64_t, uint64_t, double, double))(v15 + 8))(v16, &v19, v14, v15, v10, v11);
  sub_1BD605F74((uint64_t)v9, (uint64_t (*)(void))sub_1BD5D7EB4);
  return *(void *)&v17;
}

uint64_t ColumnChartCoordinateProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1BD605F74(v0 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace, (uint64_t (*)(void))sub_1BD605ADC);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t ColumnChartCoordinateProvider.__deallocating_deinit()
{
  ColumnChartCoordinateProvider.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t ColumnChartCoordinateProvider.register(model:size:)(uint64_t a1, double a2, double a3)
{
  sub_1BD60A150();
  uint64_t v6 = type metadata accessor for ColumnChartModel();
  uint64_t v7 = *(void *)(a1 + *(int *)(v6 + 20));
  uint64_t v8 = a1 + *(int *)(v6 + 24);
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = *(void *)(v8 + 24);
  uint64_t v11 = *(void *)(v8 + 32);
  char v12 = *(unsigned char *)(v8 + 40);
  long long v14 = *(_OWORD *)v8;
  uint64_t v15 = v9;
  uint64_t v16 = v10;
  uint64_t v17 = v11;
  char v18 = v12;
  sub_1BD605490(a1, v7, (double *)&v14, a2, a3);
  return sub_1BD60A160();
}

uint64_t sub_1BD605490(uint64_t a1, uint64_t a2, double *a3, double a4, double a5)
{
  uint64_t v6 = v5;
  sub_1BD605ADC();
  MEMORY[0x1F4188790](v12 - 8);
  long long v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v16 = *a3;
  double v15 = a3[1];
  double v17 = a3[2];
  uint64_t result = sub_1BD5D3FDC();
  if ((result & 1) == 0 && a4 > 0.0)
  {
    uint64_t v68 = *(void *)(a2 + 16);
    if (v68)
    {
      uint64_t v19 = v6 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size;
      *(double *)uint64_t v19 = a4;
      *(double *)(v19 + 8) = a5;
      *(unsigned char *)(v19 + 16) = 0;
      sub_1BD605F0C(a1, (uint64_t)v14, (uint64_t (*)(void))sub_1BD5D7EB4);
      sub_1BD5D7EB4();
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
      uint64_t v21 = v6 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace;
      swift_beginAccess();
      sub_1BD605D08((uint64_t)v14, v21);
      swift_endAccess();
      sub_1BD5D40B0();
      sub_1BD605D6C((unint64_t *)&qword_1EBA1AA18, (void (*)(uint64_t))sub_1BD5D40B0);
      sub_1BD60A680();
      sub_1BD60A6A0();
      uint64_t v22 = sub_1BD60A690();
      sub_1BD60A680();
      sub_1BD60A6A0();
      uint64_t v23 = sub_1BD60A690();
      if (!__OFSUB__(v23, 1))
      {
        double v24 = (double)v68 * (double)v22;
        double v25 = v15 * ((double)v68 + -1.0);
        double v26 = v25 * (double)v22;
        double v27 = (a4 - v26 - v17 * ((double)v22 + -1.0)) / v24;
        if (v16 < v27) {
          double v27 = v16;
        }
        if (v27 > 1.0) {
          double v28 = v27;
        }
        else {
          double v28 = 1.0;
        }
        double v29 = (a4 - v24 * v28 - v26) / (double)(v23 - 1);
        double v30 = v25 + v28 * (double)v68;
        uint64_t v66 = v6;
        uint64_t v31 = v6 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
        swift_beginAccess();
        *(double *)uint64_t v31 = v28;
        *(double *)(v31 + 8) = v15;
        *(double *)(v31 + 16) = v29;
        *(double *)(v31 + 24) = v30;
        uint64_t v67 = a2 + 32;
        *(unsigned char *)(v31 + 32) = 0;
        uint64_t v65 = a2;
        swift_bridgeObjectRetain();
        uint64_t v32 = 0;
        id v33 = (void *)MEMORY[0x1E4FBC868];
        while (1)
        {
          uint64_t v34 = (uint64_t *)(v67 + 24 * v32);
          uint64_t v36 = *v34;
          uint64_t v35 = v34[1];
          uint64_t v37 = *(void *)(v34[2] + 16);
          if (v37) {
            break;
          }
          id v40 = (void *)MEMORY[0x1E4FBC868];
LABEL_24:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_isUniquelyReferenced_nonNull_native();
          double v74 = v33;
          unint64_t v54 = sub_1BD5ED34C();
          if (__OFADD__(v33[2], (v55 & 1) == 0)) {
            goto LABEL_37;
          }
          unint64_t v56 = v54;
          char v57 = v55;
          sub_1BD605DB4();
          if (sub_1BD60A9D0())
          {
            unint64_t v58 = sub_1BD5ED34C();
            if ((v57 & 1) != (v59 & 1)) {
              goto LABEL_40;
            }
            unint64_t v56 = v58;
          }
          id v33 = v74;
          if (v57)
          {
            unint64_t v60 = (void *)(v74[7] + 16 * v56);
            swift_bridgeObjectRelease();
            *unint64_t v60 = v32;
            v60[1] = v40;
          }
          else
          {
            v74[(v56 >> 6) + 8] |= 1 << v56;
            id v61 = (void *)(v33[6] + 16 * v56);
            void *v61 = v36;
            v61[1] = v35;
            char v62 = (void *)(v33[7] + 16 * v56);
            *char v62 = v32;
            v62[1] = v40;
            uint64_t v63 = v33[2];
            BOOL v52 = __OFADD__(v63, 1);
            uint64_t v64 = v63 + 1;
            if (v52) {
              goto LABEL_38;
            }
            v33[2] = v64;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (++v32 == v68)
          {
            swift_bridgeObjectRelease();
            *(void *)(v66 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_seriesDictionary) = v33;
            return swift_bridgeObjectRelease();
          }
        }
        uint64_t v70 = *v34;
        double v71 = v33;
        uint64_t v72 = v35;
        uint64_t v73 = v32;
        uint64_t v38 = 0;
        uint64_t v69 = swift_bridgeObjectRetain();
        id v39 = (double *)(v69 + 48);
        id v40 = (void *)MEMORY[0x1E4FBC868];
        while (1)
        {
          uint64_t v41 = *((void *)v39 - 2);
          uint64_t v42 = *((void *)v39 - 1);
          double v43 = *v39;
          swift_bridgeObjectRetain();
          swift_isUniquelyReferenced_nonNull_native();
          double v74 = v40;
          unint64_t v44 = sub_1BD5ED648(v43);
          if (__OFADD__(v40[2], (v45 & 1) == 0)) {
            break;
          }
          unint64_t v46 = v44;
          char v47 = v45;
          sub_1BD605EA0(0, &qword_1EBA19BA0, MEMORY[0x1E4FBBCB8]);
          if (sub_1BD60A9D0())
          {
            unint64_t v48 = sub_1BD5ED648(v43);
            if ((v47 & 1) != (v49 & 1)) {
              goto LABEL_40;
            }
            unint64_t v46 = v48;
          }
          id v40 = v74;
          if (v47)
          {
            *(void *)(v74[7] + 8 * v46) = v38;
          }
          else
          {
            v74[(v46 >> 6) + 8] |= 1 << v46;
            uint64_t v50 = (double *)(v40[6] + 24 * v46);
            *(void *)uint64_t v50 = v41;
            *((void *)v50 + 1) = v42;
            v50[2] = v43;
            *(void *)(v40[7] + 8 * v46) = v38;
            uint64_t v51 = v40[2];
            BOOL v52 = __OFADD__(v51, 1);
            uint64_t v53 = v51 + 1;
            if (v52) {
              goto LABEL_36;
            }
            v40[2] = v53;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          ++v38;
          v39 += 3;
          if (v37 == v38)
          {
            swift_bridgeObjectRelease();
            uint64_t v35 = v72;
            uint64_t v32 = v73;
            uint64_t v36 = v70;
            id v33 = v71;
            goto LABEL_24;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
      }
      __break(1u);
      while (1)
      {
LABEL_40:
        sub_1BD60AB10();
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_1BD605A5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  uint64_t v5 = a3[2];
  sub_1BD60501C(a1, a2);
  if (v7) {
    return 0;
  }
  uint64_t v8 = v6;
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  sub_1BD605134((uint64_t)v11);
  if (v9) {
    return 0;
  }
  else {
    return v8;
  }
}

void sub_1BD605ADC()
{
  if (!qword_1EBA1ADD8)
  {
    sub_1BD5D7EB4();
    unint64_t v0 = sub_1BD60A7D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA1ADD8);
    }
  }
}

uint64_t sub_1BD605B34()
{
  return sub_1BD605D6C((unint64_t *)&qword_1EBA1ADE0, (void (*)(uint64_t))type metadata accessor for ColumnChartModel);
}

uint64_t sub_1BD605B7C(uint64_t a1, double a2, double a3)
{
  return ColumnChartCoordinateProvider.register(model:size:)(a1, a2, a3);
}

uint64_t sub_1BD605BA0(uint64_t *a1, uint64_t *a2)
{
  return ColumnChartCoordinateProvider.location(for:in:)(a1, a2);
}

ValueMetadata *type metadata accessor for ColumnChartCoordinateOptions()
{
  return &type metadata for ColumnChartCoordinateOptions;
}

uint64_t sub_1BD605BD8()
{
  return type metadata accessor for ColumnChartCoordinateProvider();
}

uint64_t type metadata accessor for ColumnChartCoordinateProvider()
{
  uint64_t result = qword_1EBA1B8E0;
  if (!qword_1EBA1B8E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BD605C28()
{
  sub_1BD605ADC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ColumnChartCoordinateProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ColumnChartCoordinateProvider);
}

uint64_t sub_1BD605D08(uint64_t a1, uint64_t a2)
{
  sub_1BD605ADC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD605D6C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BD605DB4()
{
  if (!qword_1EBA19BC0)
  {
    sub_1BD605E1C();
    unint64_t v0 = sub_1BD60A9F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19BC0);
    }
  }
}

void sub_1BD605E1C()
{
  if (!qword_1EBA1A788)
  {
    sub_1BD605EA0(255, &qword_1EBA1A770, MEMORY[0x1E4FBAEA0]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA1A788);
    }
  }
}

void sub_1BD605EA0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, void, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BD5DA298();
    unint64_t v7 = a3(a1, &type metadata for CategoryDataPoint, MEMORY[0x1E4FBB550], v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BD605F0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BD605F74(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t LinearAxisCalculationModel.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t LinearAxisCalculationModel.init()()
{
  return v0;
}

double LinearAxisCalculationModel.relativeLocation(for:in:)(double a1, double a2, double a3)
{
  double result = 0.0;
  if (a2 != a3) {
    return (a1 - a2) / (a3 - a2);
  }
  return result;
}

double LinearAxisCalculationModel.value(for:in:)(double a1, double a2, double a3)
{
  double result = (a3 - a2) * a1 + a2;
  if (a2 == a3) {
    return 0.0;
  }
  return result;
}

uint64_t LinearAxisCalculationModel.deinit()
{
  return v0;
}

uint64_t LinearAxisCalculationModel.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

double sub_1BD606044(double a1, double a2, double a3)
{
  return LinearAxisCalculationModel.relativeLocation(for:in:)(a1, a2, a3);
}

double sub_1BD60605C(double a1, double a2, double a3)
{
  return LinearAxisCalculationModel.value(for:in:)(a1, a2, a3);
}

uint64_t type metadata accessor for LinearAxisCalculationModel()
{
  return self;
}

uint64_t method lookup function for LinearAxisCalculationModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LinearAxisCalculationModel);
}

uint64_t dispatch thunk of LinearAxisCalculationModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t CategoryDataPoint.category.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double CategoryDataPoint.value.getter()
{
  return *(double *)(v0 + 16);
}

TeaCharts::CategoryDataPoint __swiftcall CategoryDataPoint.init(category:value:)(Swift::String category, Swift::Double value)
{
  *(Swift::String *)uint64_t v2 = category;
  *(Swift::Double *)(v2 + 16) = value;
  result.category = category;
  result.value = value;
  return result;
}

uint64_t CategoryDataPoint.hash(into:)()
{
  return sub_1BD60AB90();
}

BOOL static CategoryDataPoint.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 16);
  double v3 = *(double *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 == v3;
  }
  char v5 = sub_1BD60AAF0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_1BD6061C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x79726F6765746163 && a2 == 0xE800000000000000;
  if (v2 || (sub_1BD60AAF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1BD60AAF0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1BD6062B0(char a1)
{
  if (a1) {
    return 0x65756C6176;
  }
  else {
    return 0x79726F6765746163;
  }
}

uint64_t sub_1BD6062E4()
{
  return sub_1BD6062B0(*v0);
}

uint64_t sub_1BD6062EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BD6061C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BD606314()
{
  return sub_1BD5E1764();
}

uint64_t sub_1BD606334@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BD5E1714();
  *a1 = result;
  return result;
}

uint64_t sub_1BD60635C(uint64_t a1)
{
  unint64_t v2 = sub_1BD606538();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BD606398(uint64_t a1)
{
  unint64_t v2 = sub_1BD606538();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CategoryDataPoint.encode(to:)(void *a1)
{
  sub_1BD606830(0, &qword_1E9FC6C08, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_7();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v11 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD606538();
  sub_1BD60ABC0();
  char v13 = 0;
  uint64_t v9 = v11;
  sub_1BD60AA70();
  if (!v9)
  {
    char v12 = 1;
    sub_1BD60AA80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_1BD606538()
{
  unint64_t result = qword_1E9FC6C10;
  if (!qword_1E9FC6C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6C10);
  }
  return result;
}

uint64_t CategoryDataPoint.hashValue.getter()
{
  return sub_1BD60ABA0();
}

uint64_t CategoryDataPoint.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BD606830(0, &qword_1E9FC6C18, MEMORY[0x1E4FBBDC0]);
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BD606538();
  sub_1BD60ABB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_1BD60AA30();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  sub_1BD60AA40();
  uint64_t v10 = v9;
  uint64_t v11 = OUTLINED_FUNCTION_1_16();
  v12(v11);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BD6067BC()
{
  return sub_1BD60ABA0();
}

void sub_1BD606830(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BD606538();
    unint64_t v7 = a3(a1, &type metadata for CategoryDataPoint.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BD606898()
{
  unint64_t result = qword_1EBA1AFC8[0];
  if (!qword_1EBA1AFC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBA1AFC8);
  }
  return result;
}

uint64_t sub_1BD6068E4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CategoryDataPoint.init(from:)(a1, a2);
}

uint64_t sub_1BD6068FC(void *a1)
{
  return CategoryDataPoint.encode(to:)(a1);
}

uint64_t destroy for CategoryDataPoint()
{
  return swift_bridgeObjectRelease();
}

void *_s9TeaCharts17CategoryDataPointVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CategoryDataPoint(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for CategoryDataPoint(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for CategoryDataPoint()
{
  return &type metadata for CategoryDataPoint;
}

unsigned char *storeEnumTagSinglePayload for CategoryDataPoint.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BD606AD0);
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

ValueMetadata *type metadata accessor for CategoryDataPoint.CodingKeys()
{
  return &type metadata for CategoryDataPoint.CodingKeys;
}

unint64_t sub_1BD606B0C()
{
  unint64_t result = qword_1E9FC6C20;
  if (!qword_1E9FC6C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6C20);
  }
  return result;
}

unint64_t sub_1BD606B5C()
{
  unint64_t result = qword_1E9FC6C28;
  if (!qword_1E9FC6C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6C28);
  }
  return result;
}

unint64_t sub_1BD606BAC()
{
  unint64_t result = qword_1E9FC6C30;
  if (!qword_1E9FC6C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6C30);
  }
  return result;
}

uint64_t dispatch thunk of ValueCoordinateCalculatorType.location(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ValueCoordinateCalculatorType.value(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void sub_1BD606C20(uint64_t a1, double a2, double a3)
{
  if (*(double *)(a1 + 8) - *(double *)a1 > 0.0 && a3 > 0.0)
  {
    __swift_project_boxed_opaque_existential_1((void *)(a1 + 16), *(void *)(a1 + 40));
    uint64_t v3 = OUTLINED_FUNCTION_0_19();
    v4(v3);
  }
}

uint64_t sub_1BD606CC0(uint64_t result, double a2, double a3)
{
  if (*(double *)(result + 8) - *(double *)result > 0.0 && a3 > 0.0)
  {
    __swift_project_boxed_opaque_existential_1((void *)(result + 16), *(void *)(result + 40));
    uint64_t v3 = OUTLINED_FUNCTION_0_19();
    return v4(v3);
  }
  return result;
}

uint64_t type metadata accessor for ValueCoordinateCalculator()
{
  return self;
}

void sub_1BD606D84(uint64_t a1, double a2, double a3)
{
}

uint64_t sub_1BD606D9C(uint64_t a1, double a2, double a3)
{
  return sub_1BD606CC0(a1, a2, a3);
}

uint64_t SparklineStyle.init(lineStyle:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1BD60A010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD60A000();
  uint64_t v8 = sub_1BD609FF0();
  uint64_t v10 = v9;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v8;
  a2[1] = v10;
  a2[2] = a1;
  return result;
}

uint64_t SparklineStyle.init(identifier:lineStyle:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t SparklineStyle.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1BD60A550();

  return swift_bridgeObjectRelease();
}

uint64_t static SparklineStyle.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1BD60AAF0();
  }
}

uint64_t SparklineStyle.hashValue.getter()
{
  return sub_1BD60ABA0();
}

uint64_t sub_1BD606F98()
{
  return sub_1BD60ABA0();
}

unint64_t sub_1BD606FF4()
{
  unint64_t result = qword_1E9FC6C38;
  if (!qword_1E9FC6C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FC6C38);
  }
  return result;
}

uint64_t destroy for SparklineStyle()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s9TeaCharts14SparklineStyleVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SparklineStyle(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SparklineStyle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SparklineStyle()
{
  return &type metadata for SparklineStyle;
}

void sub_1BD607184(void *a1)
{
  id v2 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(a1, sel_setBackgroundColor_, v2);
}

void sub_1BD6071F8(void *a1, double *a2)
{
  uint64_t v3 = *((void *)a2 + 2);
  double v4 = a2[3];
  uint64_t v5 = (void *)*((void *)a2 + 4);
  objc_msgSend(a1, sel_setFillColor_, 0);
  id v6 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(a1, sel_setStrokeColor_, v6);

  objc_msgSend(a1, sel_setLineWidth_, v4);
  objc_msgSend(a1, sel_setLineCap_, *MEMORY[0x1E4F3A458]);
  if (v3)
  {
    uint64_t v7 = *(void *)(v3 + 16);
    uint64_t v8 = MEMORY[0x1E4FBC860];
    if (v7)
    {
      uint64_t v12 = MEMORY[0x1E4FBC860];
      sub_1BD60A980();
      uint64_t v9 = (uint64_t *)(v3 + 32);
      do
      {
        uint64_t v10 = *v9++;
        objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v10);
        sub_1BD60A960();
        sub_1BD60A990();
        sub_1BD60A9A0();
        sub_1BD60A970();
        --v7;
      }
      while (v7);
      uint64_t v8 = v12;
    }
    sub_1BD6073F0(v8, a1);
  }
  sub_1BD60A540();
  id v11 = (id)sub_1BD60A510();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setLineCap_, v11);
}

uint64_t type metadata accessor for GridViewStyler()
{
  return self;
}

void sub_1BD6073F0(uint64_t a1, void *a2)
{
  sub_1BD607464();
  id v3 = (id)sub_1BD60A5A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setLineDashPattern_, v3);
}

unint64_t sub_1BD607464()
{
  unint64_t result = qword_1EBA19A20;
  if (!qword_1EBA19A20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA19A20);
  }
  return result;
}

uint64_t *ColumnChartOptions.init(preferredWidthPerBar:spacingBetweenSeries:minimumSpacingBetweenCategories:cornerRadius:renderSynchronous:)@<X0>(uint64_t *result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  uint64_t v6 = *result;
  uint64_t v7 = result[1];
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(double *)(a3 + 16) = a6;
  *(void *)(a3 + 24) = v6;
  *(void *)(a3 + 32) = v7;
  *(unsigned char *)(a3 + 40) = a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnChartOptions(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
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

uint64_t storeEnumTagSinglePayload for ColumnChartOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnChartOptions()
{
  return &type metadata for ColumnChartOptions;
}

uint64_t sub_1BD607570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v58 = sub_1BD60A100();
  OUTLINED_FUNCTION_0_7();
  uint64_t v8 = v7;
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v53 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  unint64_t v60 = (char *)&v53 - v11;
  sub_1BD5D5C9C();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_0_7();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  char v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v19 = *(double *)a3;
  uint64_t v20 = *(void *)(a3 + 8);
  sub_1BD5F829C();
  uint64_t v21 = MEMORY[0x1E4FBC860];
  uint64_t v61 = sub_1BD60A4C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v13);
  uint64_t v22 = sub_1BD607A34();
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v54 = v8;
  uint64_t v55 = v22;
  if (v23)
  {
    uint64_t v24 = *(void *)(v4 + 16);
    unint64_t v56 = (void (**)(char *, uint64_t))(v8 + 8);
    double v25 = (uint64_t *)(v22 + 72);
    uint64_t v62 = MEMORY[0x1E4FBC860];
    uint64_t v57 = v4;
    uint64_t v63 = v24;
    while (1)
    {
      uint64_t v26 = *(v25 - 5);
      uint64_t v27 = *(v25 - 4);
      uint64_t v28 = *(v25 - 3);
      uint64_t v29 = *(v25 - 2);
      uint64_t v31 = *(v25 - 1);
      uint64_t v30 = *v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v32 = LineChartCoordinateProvider.horizontalLocation(for:in:)(v28, v29);
      if ((v33 & 1) != 0
        || (double v34 = *(double *)&v32,
            *(double *)&uint64_t result = COERCE_DOUBLE(LineChartCoordinateProvider.horizontalLocation(for:in:)(v31, v30)),
            (v36 & 1) != 0)
        || (double v37 = *(double *)&result, v34 >= *(double *)&result))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v34 <= -9.22337204e18)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        if (v34 >= 9.22337204e18) {
          goto LABEL_34;
        }
        if ((*(void *)&v34 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (result & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_35;
        }
        if (*(double *)&result <= -9.22337204e18) {
          goto LABEL_36;
        }
        if (*(double *)&result >= 9.22337204e18) {
          goto LABEL_37;
        }
        uint64_t result = (uint64_t)v34;
        uint64_t v39 = (uint64_t)v37;
        if ((uint64_t)v37 < (uint64_t)v34) {
          goto LABEL_38;
        }
        uint64_t v40 = (uint64_t)v60;
        uint64_t v59 = (uint64_t)v34;
        sub_1BD60A060();
        uint64_t v64 = *(void *)&v19;
        uint64_t v65 = v20;
        swift_bridgeObjectRetain();
        uint64_t v41 = v62;
        swift_bridgeObjectRetain();
        id v42 = sub_1BD607D0C(v40, v41, (uint64_t)&v64);
        swift_bridgeObjectRelease();
        uint64_t v43 = v61;
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v64 = v43;
        sub_1BD5F7EB0((uint64_t)v42, v26, v27);
        uint64_t v61 = v64;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v44 = v62;
        }
        else
        {
          sub_1BD5D9884();
          uint64_t v44 = v48;
        }
        unint64_t v45 = *(void *)(v44 + 16);
        if (v45 >= *(void *)(v44 + 24) >> 1)
        {
          sub_1BD5D9884();
          uint64_t v44 = v49;
        }
        *(void *)(v44 + 16) = v45 + 1;
        uint64_t v62 = v44;
        uint64_t v46 = v44 + 16 * v45;
        char v47 = v60;
        *(void *)(v46 + 32) = v59;
        *(void *)(v46 + 40) = v39;
        (*v56)(v47, v58);
      }
      v25 += 6;
      if (!--v23) {
        goto LABEL_25;
      }
    }
  }
  uint64_t v62 = v21;
LABEL_25:
  *(double *)&uint64_t result = COERCE_DOUBLE(swift_bridgeObjectRelease());
  uint64_t v50 = v62;
  if (!*(void *)(v62 + 16))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0) {
    goto LABEL_39;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (((uint64_t)v19 & 0x8000000000000000) == 0)
  {
    uint64_t v51 = (uint64_t)v53;
    sub_1BD60A060();
    uint64_t v64 = *(void *)&v19;
    uint64_t v65 = v20;
    id v52 = sub_1BD607D0C(v51, v50, (uint64_t)&v64);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v51, v58);
    return (uint64_t)v52;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1BD607A34()
{
  sub_1BD5D5C9C();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v0, v2);
  sub_1BD60820C(&qword_1EBA19518, (void (*)(uint64_t))sub_1BD5D5C9C);
  uint64_t v5 = sub_1BD60A570();
  unint64_t v6 = *(void *)(v5 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
  if (v6 < 2) {
    return v5;
  }
  unint64_t v8 = 0;
  unint64_t v9 = v6 >> 1;
  unint64_t v10 = v6 - 1;
  uint64_t v11 = 48 * v6 - 16;
  uint64_t v12 = 72;
  unint64_t v34 = v6 >> 1;
  while (1)
  {
    if (v8 == v10) {
      goto LABEL_11;
    }
    unint64_t v13 = *(void *)(v5 + 16);
    if (v8 >= v13) {
      break;
    }
    if (v10 >= v13) {
      goto LABEL_14;
    }
    uint64_t v15 = *(void *)(v5 + v12 - 40);
    uint64_t v14 = *(void *)(v5 + v12 - 32);
    uint64_t v16 = *(void *)(v5 + v12 - 16);
    uint64_t v38 = *(void *)(v5 + v12 - 24);
    uint64_t v39 = v14;
    uint64_t v17 = *(void *)(v5 + v12);
    uint64_t v36 = *(void *)(v5 + v12 - 8);
    uint64_t v18 = v5 + v11;
    uint64_t v19 = *(void *)(v5 + v11);
    uint64_t v20 = *(void *)(v5 + v11 + 8);
    uint64_t v42 = *(void *)(v5 + v11 + 16);
    uint64_t v43 = v19;
    uint64_t v21 = v5;
    uint64_t v23 = *(void *)(v5 + v11 + 24);
    uint64_t v22 = *(void *)(v18 + 32);
    uint64_t v40 = v15;
    uint64_t v41 = v22;
    uint64_t v24 = *(void *)(v18 + 40);
    swift_bridgeObjectRetain();
    uint64_t v37 = v16;
    swift_bridgeObjectRetain();
    uint64_t v35 = v17;
    swift_bridgeObjectRetain();
    uint64_t v44 = v20;
    uint64_t v25 = v23;
    uint64_t v5 = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1BD608254();
      uint64_t v5 = v32;
    }
    uint64_t v26 = (void *)(v5 + v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v27 = v44;
    *(v26 - 5) = v43;
    *(v26 - 4) = v27;
    *(v26 - 3) = v42;
    *(v26 - 2) = v25;
    *(v26 - 1) = v41;
    void *v26 = v24;
    if (v10 >= *(void *)(v5 + 16)) {
      goto LABEL_15;
    }
    uint64_t v28 = (void *)(v5 + v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v29 = v39;
    *uint64_t v28 = v40;
    v28[1] = v29;
    uint64_t v30 = v37;
    v28[2] = v38;
    uint64_t v28[3] = v30;
    unint64_t v9 = v34;
    uint64_t v31 = v35;
    v28[4] = v36;
    void v28[5] = v31;
LABEL_11:
    ++v8;
    v12 += 48;
    --v10;
    v11 -= 48;
    if (v9 == v8) {
      return v5;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

id sub_1BD607D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BD60A0D0();
  uint64_t v34 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD60811C();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1BD60A100();
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v16 = *(double *)(a3 + 8);
  uint64_t v33 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a1, v13);
  uint64_t v18 = *(void *)(a2 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = (void *)(a2 + 40);
    while (1)
    {
      id result = (id)*(v19 - 1);
      if (*v19 < (uint64_t)result) {
        break;
      }
      v19 += 2;
      sub_1BD60A0B0();
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    uint64_t v32 = v13;
    id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14C0]), sel_init);
    uint64_t v31 = v15;
    sub_1BD60A0E0();
    sub_1BD60A0C0();
    uint64_t v21 = v34;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v34 + 8);
    v35(v8, v6);
    uint64_t v22 = &v12[*(int *)(v10 + 36)];
    sub_1BD60820C((unint64_t *)&unk_1EBA194F8, MEMORY[0x1E4F27CE0]);
    uint64_t v23 = *(void *)v22;
    sub_1BD60A6A0();
    if (v23 == v37[0])
    {
LABEL_10:
      sub_1BD6081B0((uint64_t)v12);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v32);
      return v36;
    }
    uint64_t v24 = (void (**)(char *, char *, uint64_t))(v21 + 16);
    while (1)
    {
      uint64_t v25 = (void (*)(uint64_t *, void))sub_1BD60A6C0();
      uint64_t v28 = *v26;
      uint64_t v27 = v26[1];
      v25(v37, 0);
      (*v24)(v8, v12, v6);
      sub_1BD60A6B0();
      id result = (id)((uint64_t (*)(char *, uint64_t))v35)(v8, v6);
      if (__OFSUB__(v27, v28)) {
        break;
      }
      id v29 = objc_msgSend(self, sel_bezierPathWithRect_, (double)v28, 0.0, (double)(v27 - v28), v16);
      objc_msgSend(v36, sel_appendPath_, v29);

      uint64_t v30 = *(void *)v22;
      sub_1BD60A6A0();
      if (v30 == v37[0]) {
        goto LABEL_10;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LineZoneMaskProvider()
{
  return self;
}

void sub_1BD60811C()
{
  if (!qword_1EBA19A28)
  {
    sub_1BD60A0D0();
    sub_1BD60820C((unint64_t *)&unk_1EBA194F8, MEMORY[0x1E4F27CE0]);
    unint64_t v0 = sub_1BD60A9C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA19A28);
    }
  }
}

uint64_t sub_1BD6081B0(uint64_t a1)
{
  sub_1BD60811C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BD60820C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BD608254()
{
}

TeaCharts::ColumnChartStyle __swiftcall ColumnChartStyle.init(columnStyles:)(TeaCharts::ColumnChartStyle columnStyles)
{
  v1->columnStyles._rawValue = columnStyles.columnStyles._rawValue;
  return columnStyles;
}

ValueMetadata *type metadata accessor for ColumnChartStyle()
{
  return &type metadata for ColumnChartStyle;
}

uint64_t CornerRadius.init(corners:radius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(void *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

ValueMetadata *type metadata accessor for CornerRadius()
{
  return &type metadata for CornerRadius;
}

uint64_t sub_1BD60829C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_1BD6082CC(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = a1 + *(int *)(type metadata accessor for ColumnChartModel() + 24);
  int v7 = *(unsigned __int8 *)(v6 + 40);
  __swift_project_boxed_opaque_existential_1(v3 + 2, v3[5]);
  id v8 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v8, sel_scale);

  double v10 = *(double *)v6;
  double v9 = *(double *)(v6 + 8);
  double v11 = *(double *)(v6 + 16);
  uint64_t v12 = *(void *)(v6 + 24);
  double v13 = *(double *)(v6 + 32);
  if (v7 == 1)
  {
    OUTLINED_FUNCTION_0_20(v12, v13, v11, v9, v10);
    char v22 = 1;
    uint64_t v14 = sub_1BD5F0F6C(a1, v21);
    if (v14)
    {
      uint64_t v20 = v14;
      objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView], sel_setImage_);
      objc_msgSend(a2, sel_setAlpha_, 1.0);
    }
  }
  else
  {
    OUTLINED_FUNCTION_0_20(v12, v13, v11, v9, v10);
    char v22 = 0;
    sub_1BD5F107C(a1, v21);
    objc_msgSend(a2, sel_setAlpha_, 0.0);
    __swift_project_boxed_opaque_existential_1(v3 + 7, v3[10]);
    sub_1BD5D9BB4(0, (unint64_t *)&qword_1EBA1BC60);
    uint64_t v15 = (void *)sub_1BD60A760();
    MEMORY[0x1F4188790](v15);
    sub_1BD60A2C0();

    double v16 = (void *)sub_1BD60A1B0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a2;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_1BD608834;
    *(void *)(v18 + 24) = v17;
    uint64_t v19 = a2;
    sub_1BD60A3C0();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
  }
}

uint64_t sub_1BD6085A4(uint64_t a1, void *a2)
{
  sub_1BD5EA5A8();
  sub_1BD60A410();
  uint64_t v3 = (void *)sub_1BD60A1B0();
  *(void *)(swift_allocObject() + 16) = a2;
  id v4 = a2;
  uint64_t v5 = sub_1BD60A3C0();
  swift_release();

  swift_release();
  return v5;
}

void sub_1BD608678(void *a1)
{
  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  v6[4] = sub_1BD5E0B28;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1BD5F637C;
  void v6[3] = &block_descriptor_3;
  id v4 = _Block_copy(v6);
  id v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.15);
  _Block_release(v4);
}

uint64_t sub_1BD608768()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return v0;
}

uint64_t sub_1BD608798()
{
  sub_1BD608768();

  return MEMORY[0x1F4186488](v0, 104, 7);
}

uint64_t type metadata accessor for ColumnChartRenderer()
{
  return self;
}

uint64_t sub_1BD6087F0()
{
  return sub_1BD6085A4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1BD6087FC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BD608834()
{
  sub_1BD608678(*(void **)(v0 + 16));
}

uint64_t sub_1BD60883C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BD608874()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BD6088A4()
{
  return sub_1BD60A360();
}

id sub_1BD6088D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView), sel_setImage_, *(void *)(a1 + 8));
}

id sub_1BD608928()
{
  id result = objc_msgSend(self, sel_blackColor);
  qword_1E9FC6C40 = (uint64_t)result;
  byte_1E9FC6C48 = 0;
  return result;
}

uint64_t ColumnStyle.init(backgroundColor:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

id static ColumnStyle.default.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FC6808 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1E9FC6C40;
  char v3 = byte_1E9FC6C48;
  *(void *)a1 = qword_1E9FC6C40;
  *(unsigned char *)(a1 + 8) = v3;

  return sub_1BD5D6054(v2, v3);
}

uint64_t ColumnStyle.init(fill:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for ColumnStyle()
{
  return &type metadata for ColumnStyle;
}

void *__swift_initWithCopy_strong(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t __swift_destroy_strong()
{
  return swift_release();
}

void *__swift_assignWithCopy_strong(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_assignWithTake_strong(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1BD608ABC(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 8))
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

uint64_t sub_1BD608AFC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)id result = a2 ^ 0x80000000;
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
      *(void *)id result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for InteractionType()
{
  return __swift_instantiateGenericMetadata();
}

void *initializeBufferWithCopyOfBuffer for StrokeStyle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StrokeStyle()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for StrokeStyle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for StrokeStyle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for StrokeStyle()
{
  return &type metadata for StrokeStyle;
}

uint64_t LineChartCoordinateProvider.location(for:in:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  double v3 = *((double *)a1 + 2);
  sub_1BD60A150();
  uint64_t v4 = sub_1BD608F70(v1, v2);
  if (v5)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = v4;
    sub_1BD609180(v3);
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v6;
    }
  }
  sub_1BD60A160();
  return v8;
}

uint64_t LineChartCoordinateProvider.horizontalLocation(for:in:)(uint64_t a1, uint64_t a2)
{
  sub_1BD60A150();
  uint64_t v4 = sub_1BD608F70(a1, a2);
  sub_1BD60A160();
  return v4;
}

uint64_t LineChartCoordinateProvider.verticalLocation(for:in:)(double a1)
{
  sub_1BD60A150();
  uint64_t v2 = sub_1BD609180(a1);
  sub_1BD60A160();
  return v2;
}

uint64_t LineChartCoordinateProvider.copy()()
{
  sub_1BD5D5D9C(v0 + 16, (uint64_t)v4);
  sub_1BD5D5D9C(v0 + 56, (uint64_t)v3);
  uint64_t v1 = swift_allocObject();
  sub_1BD608E5C(v4, v3);
  return v1;
}

uint64_t sub_1BD608E5C(long long *a1, long long *a2)
{
  uint64_t v5 = sub_1BD60A180();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  sub_1BD5D7EB4();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  uint64_t v8 = v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size;
  *(void *)uint64_t v8 = 0;
  *(void *)(v8 + 8) = 0;
  *(unsigned char *)(v8 + 16) = 1;
  uint64_t v9 = OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_lock;
  sub_1BD60A170();
  sub_1BD60A1A0();
  swift_allocObject();
  *(void *)(v2 + v9) = sub_1BD60A190();
  sub_1BD5DBA08(a1, v2 + 16);
  sub_1BD5DBA08(a2, v2 + 56);
  return v2;
}

uint64_t sub_1BD608F70(uint64_t a1, uint64_t a2)
{
  sub_1BD605ADC();
  MEMORY[0x1F4188790]();
  uint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BD5D7EB4();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790]();
  double v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = (uint64_t)v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1BD605F0C(v11, (uint64_t)v6, (uint64_t (*)(void))sub_1BD605ADC);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) == 1)
  {
    uint64_t v12 = sub_1BD605ADC;
    uint64_t v13 = (uint64_t)v6;
  }
  else
  {
    sub_1BD5F01A8((uint64_t)v6, (uint64_t)v10);
    if ((*((unsigned char *)v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size + 16) & 1) == 0)
    {
      double v15 = *(double *)((char *)v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size);
      uint64_t v16 = v2[10];
      uint64_t v17 = v2[11];
      __swift_project_boxed_opaque_existential_1(v2 + 7, v16);
      char v20 = 0;
      uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, char *, uint64_t, uint64_t, double))(v17 + 8))(a1, a2, v10, &v20, v16, v17, v15);
      sub_1BD605F74((uint64_t)v10, (uint64_t (*)(void))sub_1BD5D7EB4);
      return v14;
    }
    uint64_t v12 = sub_1BD5D7EB4;
    uint64_t v13 = (uint64_t)v10;
  }
  sub_1BD605F74(v13, (uint64_t (*)(void))v12);
  return 0;
}

uint64_t sub_1BD609180(double a1)
{
  sub_1BD605ADC();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BD5D7EB4();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = (uint64_t)v1 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1BD605F0C(v10, (uint64_t)v5, (uint64_t (*)(void))sub_1BD605ADC);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) == 1)
  {
    uint64_t v11 = sub_1BD605ADC;
    uint64_t v12 = (uint64_t)v5;
LABEL_5:
    sub_1BD605F74(v12, (uint64_t (*)(void))v11);
    return 0;
  }
  sub_1BD5F01A8((uint64_t)v5, (uint64_t)v9);
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size + 16))
  {
    uint64_t v11 = sub_1BD5D7EB4;
    uint64_t v12 = (uint64_t)v9;
    goto LABEL_5;
  }
  double v14 = *(double *)((char *)v1 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size + 8);
  uint64_t v15 = v1[5];
  uint64_t v16 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v15);
  uint64_t v17 = &v9[*(int *)(v7 + 52)];
  char v20 = 1;
  double v18 = (*(double (**)(unsigned char *, char *, uint64_t, uint64_t, double, double))(v16 + 8))(v17, &v20, v15, v16, a1, v14);
  sub_1BD605F74((uint64_t)v9, (uint64_t (*)(void))sub_1BD5D7EB4);
  return *(void *)&v18;
}

uint64_t sub_1BD609384(uint64_t a1, double a2, double a3)
{
  sub_1BD605ADC();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD605F0C(a1, (uint64_t)v9, (uint64_t (*)(void))sub_1BD5D7EB4);
  sub_1BD5D7EB4();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  uint64_t v11 = v3 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1BD605D08((uint64_t)v9, v11);
  uint64_t result = swift_endAccess();
  uint64_t v13 = v3 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size;
  *(double *)uint64_t v13 = a2;
  *(double *)(v13 + 8) = a3;
  *(unsigned char *)(v13 + 16) = 0;
  return result;
}

uint64_t LineChartCoordinateProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  sub_1BD605F74(v0 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace, (uint64_t (*)(void))sub_1BD605ADC);
  swift_release();
  return v0;
}

uint64_t LineChartCoordinateProvider.__deallocating_deinit()
{
  LineChartCoordinateProvider.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t _s9TeaCharts27LineChartCoordinateProviderC8register15coordinateSpace4sizeyAA0eI0VyAA12CategoryAxisVAA05ValueL0VG_So6CGSizeVtF_0(uint64_t a1, double a2, double a3)
{
  return sub_1BD60A160();
}

uint64_t sub_1BD6095B0()
{
  return LineChartCoordinateProvider.register(coordinateSpace:size:)();
}

uint64_t sub_1BD6095D4(uint64_t *a1)
{
  return LineChartCoordinateProvider.location(for:in:)(a1);
}

uint64_t sub_1BD6095FC()
{
  return type metadata accessor for LineChartCoordinateProvider();
}

uint64_t type metadata accessor for LineChartCoordinateProvider()
{
  uint64_t result = qword_1EBA1B758;
  if (!qword_1EBA1B758) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BD60964C()
{
  sub_1BD605ADC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LineChartCoordinateProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LineChartCoordinateProvider);
}

uint64_t dispatch thunk of ChartViewProviderType.view(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ChartViewProviderType.present(_:on:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

id ColumnChartViewProvider.view(for:style:)()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ColumnChartView());

  return objc_msgSend(v0, sel_init);
}

void ColumnChartViewProvider.present(_:on:attributes:)(uint64_t a1, char *a2, CGRect *a3)
{
  if (!CGRectIsEmpty(*a3))
  {
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
    sub_1BD6082CC(a1, a2);
  }
}

uint64_t ColumnChartViewProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t ColumnChartViewProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186488](v0, 96, 7);
}

id sub_1BD6098CC()
{
  return ColumnChartViewProvider.view(for:style:)();
}

void sub_1BD6098E4(uint64_t a1, char *a2, CGRect *a3)
{
}

uint64_t type metadata accessor for ColumnChartViewProvider()
{
  return self;
}

uint64_t method lookup function for ColumnChartViewProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ColumnChartViewProvider);
}

uint64_t Grid.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v3;
  return sub_1BD5DCFEC(v2, v3);
}

id Grid.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  id v7 = *(id *)(v1 + 32);
  char v3 = *(unsigned char *)(v1 + 40);
  char v4 = *(unsigned char *)(v1 + 41);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 25) = v4;
  long long v5 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();

  return v7;
}

uint64_t Grid.label.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 80);
  return swift_retain();
}

__n128 Grid.init(_:style:label:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X2>, __n128 *a4@<X8>)
{
  unsigned __int8 v4 = *(unsigned char *)(a1 + 8);
  unint64_t v5 = a2->n128_u64[0];
  uint64_t v6 = a2->n128_i64[1];
  uint64_t v7 = a2[1].n128_i64[0];
  char v8 = a2[1].n128_i8[8];
  char v9 = a2[1].n128_i8[9];
  uint64_t v10 = *a3;
  a4->n128_u64[0] = *(void *)a1;
  a4->n128_u8[8] = v4;
  a4[1].n128_u64[0] = v5;
  a4[1].n128_u64[1] = v6;
  a4[2].n128_u64[0] = v7;
  a4[2].n128_u8[8] = v8;
  a4[2].n128_u8[9] = v9;
  __n128 result = a2[2];
  __n128 v12 = a2[3];
  a4[3] = result;
  a4[4] = v12;
  a4[5].n128_u64[0] = v10;
  return result;
}

uint64_t sub_1BD609A18(uint64_t a1)
{
  sub_1BD5DCFF8(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1BD609A68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1BD5DCFEC(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  long long v8 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v8;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  id v9 = v7;
  swift_retain();
  return a1;
}

uint64_t sub_1BD609AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1BD5DCFEC(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_1BD5DCFF8(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v8 = *(void **)(a2 + 32);
  id v9 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v8;
  id v10 = v8;

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t sub_1BD609BD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_1BD5DCFF8(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = a2[3];
  long long v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = a2[4];

  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(unsigned char *)(a1 + 41) = *((unsigned char *)a2 + 41);
  long long v9 = *((_OWORD *)a2 + 4);
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 64) = v9;
  *(void *)(a1 + 80) = a2[10];
  swift_release();
  return a1;
}

uint64_t sub_1BD609C64(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
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

uint64_t sub_1BD609CA4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Grid()
{
  return __swift_instantiateGenericMetadata();
}

double ChartLayoutAttributes.chartFrame.getter()
{
  return *(double *)v0;
}

uint64_t ChartLayoutAttributes.gridSetLayoutAttributes.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 104);
  long long v4 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = v2;
  *(void *)(a1 + 72) = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t destroy for ChartLayoutAttributes()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ChartLayoutAttributes(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ChartLayoutAttributes(void *a1, void *a2)
{
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
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

_OWORD *assignWithTake for ChartLayoutAttributes(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  long long v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ChartLayoutAttributes(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 96);
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

uint64_t storeEnumTagSinglePayload for ChartLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 96) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartLayoutAttributes()
{
  return &type metadata for ChartLayoutAttributes;
}

uint64_t sub_1BD609FC0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1BD609FD0()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1BD609FE0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BD609FF0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BD60A000()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BD60A010()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BD60A020()
{
  return MEMORY[0x1F40E55E8]();
}

uint64_t sub_1BD60A030()
{
  return MEMORY[0x1F40E5618]();
}

uint64_t sub_1BD60A040()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1BD60A050()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1BD60A060()
{
  return MEMORY[0x1F40E5B50]();
}

uint64_t sub_1BD60A070()
{
  return MEMORY[0x1F40E5B58]();
}

uint64_t sub_1BD60A080()
{
  return MEMORY[0x1F40E5B60]();
}

uint64_t sub_1BD60A090()
{
  return MEMORY[0x1F40E5BF8]();
}

uint64_t sub_1BD60A0A0()
{
  return MEMORY[0x1F40E5C00]();
}

uint64_t sub_1BD60A0B0()
{
  return MEMORY[0x1F40E5C20]();
}

uint64_t sub_1BD60A0C0()
{
  return MEMORY[0x1F40E5C70]();
}

uint64_t sub_1BD60A0D0()
{
  return MEMORY[0x1F40E5C78]();
}

uint64_t sub_1BD60A0E0()
{
  return MEMORY[0x1F40E5C88]();
}

uint64_t sub_1BD60A0F0()
{
  return MEMORY[0x1F40E5C98]();
}

uint64_t sub_1BD60A100()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1BD60A110()
{
  return MEMORY[0x1F40E5CF8]();
}

uint64_t sub_1BD60A120()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1BD60A130()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1BD60A140()
{
  return MEMORY[0x1F40D9648]();
}

uint64_t sub_1BD60A150()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1BD60A160()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1BD60A170()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1BD60A180()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1BD60A190()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1BD60A1A0()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1BD60A1B0()
{
  return MEMORY[0x1F415DC68]();
}

uint64_t sub_1BD60A1C0()
{
  return MEMORY[0x1F415DD18]();
}

uint64_t sub_1BD60A1D0()
{
  return MEMORY[0x1F415DD48]();
}

uint64_t sub_1BD60A1E0()
{
  return MEMORY[0x1F415DD50]();
}

uint64_t sub_1BD60A1F0()
{
  return MEMORY[0x1F415DD68]();
}

uint64_t sub_1BD60A200()
{
  return MEMORY[0x1F415DD70]();
}

uint64_t sub_1BD60A210()
{
  return MEMORY[0x1F415DDC8]();
}

uint64_t sub_1BD60A220()
{
  return MEMORY[0x1F415DDD0]();
}

uint64_t sub_1BD60A230()
{
  return MEMORY[0x1F415DED8]();
}

uint64_t sub_1BD60A240()
{
  return MEMORY[0x1F415DEE0]();
}

uint64_t sub_1BD60A250()
{
  return MEMORY[0x1F415DF90]();
}

uint64_t sub_1BD60A260()
{
  return MEMORY[0x1F415DF98]();
}

uint64_t sub_1BD60A270()
{
  return MEMORY[0x1F415DFD8]();
}

uint64_t sub_1BD60A280()
{
  return MEMORY[0x1F415DFE0]();
}

uint64_t sub_1BD60A290()
{
  return MEMORY[0x1F415DFE8]();
}

uint64_t sub_1BD60A2A0()
{
  return MEMORY[0x1F415DFF0]();
}

uint64_t sub_1BD60A2B0()
{
  return MEMORY[0x1F415E018]();
}

uint64_t sub_1BD60A2C0()
{
  return MEMORY[0x1F415E298]();
}

uint64_t sub_1BD60A2D0()
{
  return MEMORY[0x1F415E2A8]();
}

uint64_t sub_1BD60A2E0()
{
  return MEMORY[0x1F415E2C8]();
}

uint64_t sub_1BD60A2F0()
{
  return MEMORY[0x1F415E2D0]();
}

uint64_t sub_1BD60A300()
{
  return MEMORY[0x1F415E2E8]();
}

uint64_t sub_1BD60A310()
{
  return MEMORY[0x1F415E300]();
}

uint64_t sub_1BD60A320()
{
  return MEMORY[0x1F415E318]();
}

uint64_t sub_1BD60A330()
{
  return MEMORY[0x1F415E320]();
}

uint64_t sub_1BD60A340()
{
  return MEMORY[0x1F415E338]();
}

uint64_t sub_1BD60A350()
{
  return MEMORY[0x1F415E348]();
}

uint64_t sub_1BD60A360()
{
  return MEMORY[0x1F415E5F8]();
}

uint64_t sub_1BD60A370()
{
  return MEMORY[0x1F415E600]();
}

uint64_t sub_1BD60A380()
{
  return MEMORY[0x1F415E608]();
}

uint64_t sub_1BD60A390()
{
  return MEMORY[0x1F415E6A8]();
}

uint64_t sub_1BD60A3A0()
{
  return MEMORY[0x1F415E6B0]();
}

uint64_t sub_1BD60A3B0()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1BD60A3C0()
{
  return MEMORY[0x1F415EC18]();
}

uint64_t sub_1BD60A3D0()
{
  return MEMORY[0x1F415EC28]();
}

uint64_t sub_1BD60A3E0()
{
  return MEMORY[0x1F415EC60]();
}

uint64_t sub_1BD60A3F0()
{
  return MEMORY[0x1F415ECC8]();
}

uint64_t sub_1BD60A400()
{
  return MEMORY[0x1F415ED08]();
}

uint64_t sub_1BD60A410()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1BD60A420()
{
  return MEMORY[0x1F415EE60]();
}

uint64_t sub_1BD60A430()
{
  return MEMORY[0x1F415EE68]();
}

uint64_t sub_1BD60A440()
{
  return MEMORY[0x1F415EE78]();
}

uint64_t sub_1BD60A450()
{
  return MEMORY[0x1F415EE80]();
}

uint64_t sub_1BD60A460()
{
  return MEMORY[0x1F415EE88]();
}

uint64_t sub_1BD60A470()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BD60A480()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BD60A490()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BD60A4A0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BD60A4B0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BD60A4C0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1BD60A4D0()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_1BD60A4E0()
{
  return MEMORY[0x1F4183468]();
}

uint64_t sub_1BD60A4F0()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BD60A500()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1BD60A510()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BD60A520()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BD60A530()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BD60A540()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BD60A550()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BD60A560()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1BD60A570()
{
  return MEMORY[0x1F4183BC0]();
}

uint64_t sub_1BD60A580()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1BD60A590()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1BD60A5A0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BD60A5B0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BD60A5C0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1BD60A5D0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1BD60A5E0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1BD60A5F0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1BD60A600()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1BD60A610()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BD60A620()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1BD60A640()
{
  return MEMORY[0x1F40E63E0]();
}

uint64_t sub_1BD60A650()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1BD60A660()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1BD60A670()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1BD60A680()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BD60A690()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1BD60A6A0()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1BD60A6B0()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BD60A6C0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BD60A6D0()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1BD60A6E0()
{
  return MEMORY[0x1F40D3168]();
}

uint64_t sub_1BD60A6F0()
{
  return MEMORY[0x1F40D9660]();
}

uint64_t sub_1BD60A700()
{
  return MEMORY[0x1F40D96C0]();
}

uint64_t sub_1BD60A710()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BD60A720()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1BD60A730()
{
  return MEMORY[0x1F40D3170]();
}

uint64_t sub_1BD60A740()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BD60A750()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BD60A760()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BD60A770()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BD60A780()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BD60A790()
{
  return MEMORY[0x1F40D3188]();
}

uint64_t sub_1BD60A7A0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1BD60A7B0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1BD60A7C0()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1BD60A7D0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BD60A7E0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BD60A800()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BD60A810()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BD60A820()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1BD60A830()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1BD60A840()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1BD60A850()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1BD60A860()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1BD60A870()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1BD60A880()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1BD60A890()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1BD60A8A0()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1BD60A8B0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1BD60A8C0()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1BD60A8D0()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1BD60A8E0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BD60A8F0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BD60A900()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1BD60A910()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BD60A920()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1BD60A930()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1BD60A940()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BD60A950()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BD60A960()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1BD60A970()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1BD60A980()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1BD60A990()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1BD60A9A0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1BD60A9B0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BD60A9C0()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1BD60A9D0()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1BD60A9E0()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1BD60A9F0()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1BD60AA00()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BD60AA10()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BD60AA30()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1BD60AA40()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1BD60AA50()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BD60AA60()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1BD60AA70()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1BD60AA80()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1BD60AA90()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BD60AAA0()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1BD60AAB0()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1BD60AAC0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1BD60AAD0()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1BD60AAE0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1BD60AAF0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BD60AB00()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BD60AB10()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BD60AB20()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BD60AB30()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BD60AB40()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BD60AB50()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BD60AB60()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1BD60AB70()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BD60AB80()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BD60AB90()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1BD60ABA0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BD60ABB0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BD60ABC0()
{
  return MEMORY[0x1F4185FF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
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