double sub_26151E524(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  double *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;

  v6 = (double *)sub_26151F6A8(a5, a1, a2 & 1, a3, a4 & 1, *(double *)(v5 + 16), *(CGFloat *)(v5 + 24));
  v7 = *((void *)v6 + 2);
  if (v7)
  {
    v8 = v6 + 7;
    v9 = *((void *)v6 + 7);
    v10 = *((void *)v6 + 4);
    v11 = *((void *)v6 + 5);
    v12 = v6[6];
    do
    {
      v13 = v12;
      v14 = v9;
      *(CGRect *)&v10 = CGRectUnion(*(CGRect *)&v10, *(CGRect *)(v8 - 3));
      v12 = v15;
      v9 = v16;
      v8 += 4;
      --v7;
    }
    while (v7);
  }
  else
  {
    v12 = *MEMORY[0x263F001B0];
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_26151E5EC(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, CGFloat a6, double a7, CGFloat a8, CGFloat a9)
{
  uint64_t v18 = sub_261529020();
  double MinY = *(double *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v23 = (char *)&v49 - v22;
  uint64_t v66 = sub_261528FA0();
  v63 = *(void (***)(char *, uint64_t))(v66 - 8);
  MEMORY[0x270FA5388](v66);
  v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v26 = *(double *)&a1;
  LODWORD(MinX) = a2;
  double v27 = 1.79769313e308;
  if (a2) {
    double v26 = 1.79769313e308;
  }
  LODWORD(v69) = a4;
  if ((a4 & 1) == 0) {
    double v27 = *(double *)&a3;
  }
  char v71 = a2 & 1;
  char v70 = a4 & 1;
  uint64_t v50 = sub_26151F6A8(a5, a1, a2 & 1, a3, a4 & 1, v26, v27);
  sub_261528FB0();
  sub_26151FE8C();
  sub_261529390();
  sub_2615293B0();
  uint64_t result = sub_2615293A0();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v29 = result;
    if (!result) {
      return swift_bridgeObjectRelease();
    }
    if ((unint64_t)(result - 1) < *(void *)(v50 + 16))
    {
      uint64_t v30 = 0;
      ++v63;
      uint64_t v64 = *(void *)&MinY + 8;
      uint64_t v61 = a1;
      uint64_t v62 = a3;
      v31 = (CGFloat *)(v50 + 56);
      int v59 = LOBYTE(MinX) & 1;
      uint64_t v58 = v18;
      int v57 = v69 & 1;
      CGFloat v55 = a9;
      CGFloat v52 = a8;
      double v54 = a7;
      CGFloat v53 = a6;
      v51 = v21;
      uint64_t v65 = v29;
      v60 = v23;
      uint64_t v56 = a5;
      CGFloat v32 = a7;
      char v33 = LOBYTE(MinX) & 1;
      v34 = (void (**)(char *, uint64_t))(*(void *)&MinY + 8);
      do
      {
        uint64_t v69 = v30 + 1;
        sub_261528FC0();
        CGFloat v35 = *(v31 - 3);
        CGFloat v36 = *(v31 - 2);
        CGFloat v37 = *(v31 - 1);
        CGFloat v38 = *v31;
        v72.origin.x = v35;
        v72.origin.y = v36;
        v72.size.width = v37;
        v72.size.height = *v31;
        double MinX = CGRectGetMinX(v72);
        CGFloat v39 = v53;
        v73.origin.x = v53;
        v73.origin.y = v32;
        CGFloat v40 = v52;
        v73.size.width = v52;
        v73.size.height = a9;
        double MinX = MinX + CGRectGetMinX(v73);
        v74.origin.x = v35;
        v74.origin.y = v36;
        v74.size.width = v37;
        v74.size.height = v38;
        double MinY = CGRectGetMinY(v74);
        v75.origin.x = v39;
        v75.origin.y = v32;
        v75.size.width = v40;
        v75.size.height = a9;
        double v41 = MinY + CGRectGetMinY(v75);
        v76.origin.x = v35;
        v76.origin.y = v36;
        v76.size.width = v37;
        v76.size.height = v38;
        CGRectGetWidth(v76);
        v77.origin.x = v35;
        v77.origin.y = v36;
        v77.size.width = v37;
        v77.size.height = v38;
        CGRectGetHeight(v77);
        CGRectMake(MinX, v41);
        sub_2615292F0();
        char v71 = v33;
        char v42 = v57;
        char v70 = v57;
        sub_261528F70();
        sub_261529000();
        double v44 = v43;
        v45 = *v34;
        v46 = v23;
        uint64_t v47 = v58;
        (*v34)(v46, v58);
        double MinX = v44;
        char v71 = v33;
        char v70 = v42;
        v48 = v51;
        sub_261528F70();
        sub_261529010();
        v45(v48, v47);
        char v71 = 0;
        char v70 = 0;
        v23 = v60;
        sub_261528F90();
        (*v63)(v25, v66);
        v31 += 4;
        uint64_t v30 = v69;
      }
      while (v65 != v69);
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

double sub_26151EB04(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_26151E524(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_26151EB58(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, CGFloat a6, double a7, CGFloat a8, CGFloat a9)
{
  return sub_26151E5EC(a1, a2 & 1, a3, a4 & 1, a5, a6, a7, a8, a9);
}

uint64_t sub_26151EBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_26151EC1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_26151EBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_26151EC1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_26151EC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_26151EC64(void *a1))(void *a1)
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_261528F20();
  return sub_26151ECD4;
}

void sub_26151ECD4(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_26151ED20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 != 4) {
    MEMORY[0x263E38D00](a5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208C0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208C8);
  sub_26151EFEC();
  swift_getOpaqueTypeConformance2();
  sub_26151F078();
  return sub_261529210();
}

uint64_t sub_26151EE3C()
{
  return swift_getOpaqueTypeMetadata2();
}

uint64_t sub_26151EED0()
{
  return swift_getOpaqueTypeConformance2();
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

unint64_t sub_26151EFEC()
{
  unint64_t result = qword_26A9208D0;
  if (!qword_26A9208D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208C8);
    sub_26151F140(&qword_26A9208D8, &qword_26A9208E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9208D0);
  }
  return result;
}

unint64_t sub_26151F078()
{
  unint64_t result = qword_26A9208E8;
  if (!qword_26A9208E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208F0);
    sub_26151F140(&qword_26A9208F8, &qword_26A9208F0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9208E8);
  }
  return result;
}

uint64_t sub_26151F140(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_26151F1A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_26151F1C0(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for VCUIOverlayTextOverlayType(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for VCUIHorizontalFlowLayout(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VCUIHorizontalFlowLayout()
{
  return swift_release();
}

uint64_t initializeWithCopy for VCUIHorizontalFlowLayout(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VCUIHorizontalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v3;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for VCUIHorizontalFlowLayout(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUIHorizontalFlowLayout(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUIHorizontalFlowLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 48) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIHorizontalFlowLayout()
{
  return &type metadata for VCUIHorizontalFlowLayout;
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

uint64_t sub_26151F458(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_26151F478(uint64_t result, int a2, int a3)
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

void sub_26151F4B4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_26151F500()
{
  unint64_t result = qword_26A920920;
  if (!qword_26A920920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920920);
  }
  return result;
}

unint64_t sub_26151F558()
{
  unint64_t result = qword_26A920928;
  if (!qword_26A920928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920928);
  }
  return result;
}

char *sub_26151F5AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920950);
    v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_26151F6A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, double a6, CGFloat a7)
{
  CGFloat v67 = a7;
  double v66 = a6;
  LODWORD(v69) = a5;
  uint64_t v65 = a4;
  int v63 = a3;
  uint64_t v64 = a2;
  uint64_t v59 = sub_261528FA0();
  uint64_t v8 = *(void *)(v59 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v80 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_261528FB0();
  uint64_t v11 = *(void *)(v10 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v78 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920938);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v79 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920940) - 8;
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v59 - v18;
  CGRect v76 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v77 = v11 + 16;
  v76(v17, a1, v10);
  unint64_t v20 = sub_26151FE8C();
  sub_261529390();
  *(void *)&v17[*(int *)(v14 + 44)] = v84;
  sub_26151FEE4((uint64_t)v17, (uint64_t)v19);
  v21 = &v19[*(int *)(v14 + 44)];
  uint64_t v22 = *(void *)v21;
  v23 = v19;
  sub_2615293B0();
  if (v22 == (void)v84)
  {
    uint64_t v24 = (char *)MEMORY[0x263F8EE78];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v79, 1, 1, v59);
LABEL_29:
    uint64_t v58 = (uint64_t)v23;
LABEL_30:
    sub_26151FF4C(v58);
    return (uint64_t)v24;
  }
  uint64_t v25 = v8;
  unint64_t v26 = v20;
  char v27 = 0;
  CGRect v74 = (void (**)(char *))(v25 + 16);
  CGRect v73 = (void (**)(char *, uint64_t))(v11 + 8);
  CGRect v75 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  CGRect v72 = (unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  char v71 = (void (**)(char *, char *, uint64_t))(v25 + 32);
  uint64_t v61 = v68 + 4;
  char v70 = (void (**)(char *, uint64_t))(v25 + 8);
  double v28 = 0.0;
  v81 = (char *)MEMORY[0x263F8EE78];
  v63 &= 1u;
  int v62 = v69 & 1;
  double v29 = 0.0;
  double v30 = 0.0;
  uint64_t v31 = v59;
  v60 = v19;
  while (1)
  {
    CGFloat v32 = (void (*)(long long *, void))sub_2615293D0();
    char v33 = v79;
    (*v74)(v79);
    v32(&v84, 0);
    v34 = v78;
    CGFloat v35 = v23;
    v76(v78, (uint64_t)v23, v10);
    CGFloat v36 = v21;
    unint64_t v37 = v26;
    sub_2615293C0();
    (*v73)(v34, v10);
    CGFloat v38 = *v75;
    (*v75)(v33, 0, 1, v31);
    if ((*v72)(v33, 1, v31) == 1)
    {
      uint64_t v58 = (uint64_t)v23;
      uint64_t v24 = v81;
      goto LABEL_30;
    }
    uint64_t v39 = v10;
    uint64_t v69 = v38;
    (*v71)(v80, v33, v31);
    CGFloat v40 = v81;
    if (v27)
    {
      double v41 = 0.0;
      char v27 = 1;
      double v42 = 0.0;
      double v43 = 0.0;
      CGFloat v44 = 0.0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_27;
      }
      double v45 = 0.0;
      goto LABEL_23;
    }
    LOBYTE(v84) = v63;
    LOBYTE(v82) = v62;
    sub_261528F80();
    double v43 = v46;
    CGFloat v44 = v47;
    if (v28 + v46 <= v66)
    {
      double v45 = v28;
    }
    else
    {
      double v29 = v29 + v30 + v68[1];
      double v30 = 0.0;
      double v45 = 0.0;
    }
    v86.origin.x = v45;
    v86.origin.y = v29;
    v86.size.width = v43;
    v86.size.height = v44;
    if (CGRectGetMaxY(v86) > v67)
    {
      double v41 = 0.0;
      char v27 = 1;
      double v28 = v45;
      double v42 = 0.0;
      double v43 = 0.0;
      CGFloat v44 = 0.0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_27;
      }
      double v28 = v45;
      double v45 = 0.0;
      goto LABEL_23;
    }
    double v48 = *v68;
    v87.origin.x = v45;
    v87.origin.y = v29;
    v87.size.width = v43;
    v87.size.height = v44;
    double Height = CGRectGetHeight(v87);
    if (v30 <= Height) {
      double v30 = Height;
    }
    uint64_t v50 = v61;
    long long v84 = *(_OWORD *)v61;
    uint64_t v85 = *((void *)v61 + 2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920948);
    sub_261529250();
    if ((v83 & 1) == 0) {
      break;
    }
    uint64_t v51 = 1;
LABEL_21:
    double v28 = v45 + v43 + v48;
    long long v84 = *(_OWORD *)v50;
    uint64_t v85 = *((void *)v50 + 2);
    uint64_t v82 = v51;
    char v83 = 0;
    sub_261529260();
    CGFloat v40 = v81;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v27 = 0;
    double v41 = v45;
    double v42 = v29;
    CGFloat v35 = v60;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
LABEL_27:
      CGFloat v40 = sub_26151F5AC(0, *((void *)v40 + 2) + 1, 1, v40);
      double v45 = v41;
      double v41 = v42;
      goto LABEL_23;
    }
    double v41 = v29;
LABEL_23:
    unint64_t v55 = *((void *)v40 + 2);
    unint64_t v54 = *((void *)v40 + 3);
    if (v55 >= v54 >> 1) {
      CGFloat v40 = sub_26151F5AC((char *)(v54 > 1), v55 + 1, 1, v40);
    }
    *((void *)v40 + 2) = v55 + 1;
    v81 = v40;
    uint64_t v56 = (double *)&v40[32 * v55];
    v56[4] = v45;
    v56[5] = v41;
    v56[6] = v43;
    v56[7] = v44;
    (*v70)(v80, v31);
    uint64_t v57 = *(void *)v36;
    v23 = v35;
    uint64_t v10 = v39;
    unint64_t v26 = v37;
    v21 = v36;
    sub_2615293B0();
    if (v57 == (void)v84)
    {
      uint64_t v24 = v81;
      v69(v79, 1, 1, v59);
      goto LABEL_29;
    }
  }
  long long v84 = *(_OWORD *)v50;
  uint64_t v85 = *((void *)v50 + 2);
  uint64_t result = sub_261529250();
  if (v83) {
    goto LABEL_32;
  }
  uint64_t v51 = v82 + 1;
  if (!__OFADD__(v82, 1))
  {
    uint64_t v50 = v61;
    goto LABEL_21;
  }
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_26151FE8C()
{
  unint64_t result = qword_26A920930;
  if (!qword_26A920930)
  {
    sub_261528FB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920930);
  }
  return result;
}

uint64_t sub_26151FEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26151FF4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920940);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for VCUIBadgedHorizontalTextSegmentView()
{
  return &type metadata for VCUIBadgedHorizontalTextSegmentView;
}

uint64_t sub_26151FFCC()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_26151FFE8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v4 = sub_261529160();
  unsigned __int8 v5 = sub_261529180();
  char v6 = sub_261529170();
  sub_261529170();
  if (sub_261529170() != v4) {
    char v6 = sub_261529170();
  }
  sub_261529170();
  if (sub_261529170() != v5) {
    char v6 = sub_261529170();
  }
  sub_261520104(a1, (uint64_t)&v19);
  char v7 = v20;
  uint64_t v8 = v21;
  char v9 = v22;
  char v10 = v24;
  uint64_t v11 = v25;
  uint64_t v12 = v26;
  char v13 = v27;
  uint64_t v14 = v28;
  char v15 = v29;
  __n128 result = v19;
  long long v17 = v23;
  long long v18 = v30;
  *(unsigned char *)a2 = v6;
  *(__n128 *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v9;
  *(_OWORD *)(a2 + 48) = v17;
  *(unsigned char *)(a2 + 64) = v10;
  *(void *)(a2 + 72) = v11;
  *(void *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  *(unsigned char *)(a2 + 88) = v13;
  *(void *)(a2 + 96) = v14;
  *(unsigned char *)(a2 + 104) = v15;
  *(_OWORD *)(a2 + 112) = v18;
  return result;
}

uint64_t sub_261520104@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_261529030();
  sub_261520220(a1, (uint64_t)&v17);
  unsigned __int8 v5 = v17;
  char v6 = v18;
  uint64_t v7 = v19;
  uint64_t v8 = v20;
  char v9 = v21;
  uint64_t v10 = *((void *)&v21 + 1);
  sub_2615292E0();
  sub_261528F60();
  uint64_t v11 = v17;
  char v12 = v18;
  uint64_t v13 = v19;
  char v14 = v20;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0x3FF0000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v5;
  *(unsigned char *)(a2 + 32) = v6;
  *(void *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v7;
  *(void *)(a2 + 48) = v8;
  *(unsigned char *)(a2 + 56) = v9;
  *(void *)(a2 + 64) = v10;
  *(void *)(a2 + 72) = v11;
  *(unsigned char *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  *(void *)(a2 + 88) = v13;
  *(unsigned char *)(a2 + 96) = v14;
  *(_OWORD *)(a2 + 104) = v21;
  id v15 = v5;
  sub_261520370(v7, v8, v9);
  swift_bridgeObjectRetain();

  sub_261520380(v7, v8, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_261520220@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (objc_msgSend(a1, sel_isWhiteSpace))
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = a1;
    uint64_t v4 = a1;
  }
  id v6 = objc_msgSend(a1, sel_displayedText);
  id v7 = objc_msgSend(v6, sel_string);

  sub_261529320();
  sub_261520390();
  uint64_t v8 = sub_2615291E0();
  uint64_t v10 = v9;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = 0;
  char v12 = v11 & 1;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v9;
  *(unsigned char *)(a2 + 32) = v11 & 1;
  *(void *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v13;
  id v14 = v4;
  sub_261520370(v8, v10, v12);
  swift_bridgeObjectRetain();
  sub_261520380(v8, v10, v12);

  return swift_bridgeObjectRelease();
}

uint64_t sub_26152034C()
{
  return sub_261529220();
}

double sub_261520368@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_26151FFE8(*v1, a1).n128_u64[0];
  return result;
}

uint64_t sub_261520370(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_261520380(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_261520390()
{
  unint64_t result = qword_26A920958;
  if (!qword_26A920958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920958);
  }
  return result;
}

unint64_t sub_2615203E8()
{
  unint64_t result = qword_26A920960;
  if (!qword_26A920960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A920968);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920960);
  }
  return result;
}

uint64_t destroy for VCUIBadgedTextOverlayView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for VCUIBadgedTextOverlayView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VCUIBadgedTextOverlayView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
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

uint64_t assignWithTake for VCUIBadgedTextOverlayView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUIBadgedTextOverlayView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUIBadgedTextOverlayView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
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

ValueMetadata *type metadata accessor for VCUIBadgedTextOverlayView()
{
  return &type metadata for VCUIBadgedTextOverlayView;
}

uint64_t sub_261520684()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2615206A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v78 = a1;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208C0);
  MEMORY[0x270FA5388](v79);
  uint64_t v64 = (char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920970);
  MEMORY[0x270FA5388](v75);
  uint64_t v77 = (uint64_t)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_261529150();
  uint64_t v69 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  CGFloat v67 = (void *)((char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208B8);
  uint64_t v66 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  char v71 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920978);
  uint64_t v70 = *(void *)(v76 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v76);
  uint64_t v65 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v68 = (char *)v61 - v9;
  uint64_t v10 = sub_261529140();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920980);
  uint64_t v73 = *(void *)(v80 - 8);
  uint64_t v14 = *(void *)(v73 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v80);
  int v63 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  long long v17 = (char *)v61 - v16;
  uint64_t v62 = *(void *)(v1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_261528EF0();
  swift_release();
  swift_release();
  swift_release();
  CGPoint v18 = v85;
  CGFloat v19 = v86;
  CGFloat x = v87.x;
  v91.origin = v85;
  v91.size.width = v86;
  v91.size.height = v87.x;
  CGFloat MinX = CGRectGetMinX(v91);
  v92.origin = v18;
  v92.size.width = v19;
  v92.size.height = x;
  CGFloat MaxY = CGRectGetMaxY(v92);
  uint64_t v23 = sub_261529030();
  sub_261521114(v2, (uint64_t)&v85);
  uint64_t v24 = *(void *)&v86;
  char x_low = LOBYTE(v87.x);
  char v26 = BYTE1(v87.x);
  CGPoint v27 = v85;
  CGPoint v85 = (CGPoint)(unint64_t)v23;
  LOBYTE(v86) = 1;
  CGPoint v87 = v27;
  uint64_t v88 = v24;
  char v89 = x_low;
  char v90 = v26;
  sub_261529130();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208F0);
  sub_26151F140(&qword_26A9208F8, &qword_26A9208F0);
  v81 = v17;
  sub_261529230();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28(v13, v10);
  sub_261521544(*(uint64_t *)&v87.x, *(uint64_t *)&v87.y, v88, v89, v90);
  if (*(unsigned char *)(v2 + 48))
  {
    CGPoint v85 = (CGPoint)(unint64_t)sub_261529030();
    LOBYTE(v86) = 1;
    v87.CGFloat x = MinX;
    v87.y = MaxY;
    sub_261529130();
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208C8);
    unint64_t v45 = sub_26151EFEC();
    sub_261529230();
    v28(v13, v10);
    type metadata accessor for VCUIBadgedTextOverlayModel();
    sub_261521620();
    sub_261528FE0();
    swift_getKeyPath();
    sub_261528FF0();
    swift_release();
    swift_release();
    uint64_t v62 = v82;
    v61[1] = v83;
    LODWORD(v64) = v84;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_261528EF0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = sub_261529270();
    double v47 = v67;
    *CGFloat v67 = v46;
    uint64_t v48 = v69;
    (*(void (**)(uint64_t *, void, uint64_t))(v69 + 104))(v47, *MEMORY[0x263F1A030], v72);
    uint64_t v30 = v73;
    uint64_t v49 = v63;
    uint64_t v50 = v80;
    (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v63, v81, v80);
    unint64_t v51 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    uint64_t v52 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v52 + v51, v49, v50);
    MEMORY[0x263E38D00](2);
    *(void *)&v85.CGFloat x = v44;
    *(void *)&v85.y = v45;
    v61[0] = swift_getOpaqueTypeConformance2();
    int v63 = (char *)sub_26151F078();
    uint64_t v53 = v79;
    uint64_t v54 = v74;
    unint64_t v55 = v65;
    uint64_t v56 = v71;
    sub_261529210();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t *, uint64_t))(v48 + 8))(v47, v72);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v54);
    uint64_t v57 = v70;
    uint64_t v58 = v68;
    uint64_t v59 = v76;
    (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v68, v55, v76);
    (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v77, v58, v59);
    swift_storeEnumTagMultiPayload();
    *(void *)&v85.CGFloat x = v54;
    *(void *)&v85.y = v53;
    CGFloat v86 = *(double *)v61;
    *(void *)&v87.CGFloat x = v63;
    swift_getOpaqueTypeConformance2();
    uint64_t v32 = v80;
    sub_261529120();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v59);
  }
  else
  {
    char v29 = sub_261529190();
    uint64_t v30 = v73;
    uint64_t v31 = (uint64_t)v64;
    uint64_t v32 = v80;
    (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v64, v81, v80);
    uint64_t v33 = v79;
    uint64_t v34 = v31 + *(int *)(v79 + 36);
    *(unsigned char *)uint64_t v34 = v29;
    __asm { FMOV            V0.2D, #5.0 }
    *(_OWORD *)(v34 + 8) = _Q0;
    *(_OWORD *)(v34 + 24) = _Q0;
    *(unsigned char *)(v34 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
    sub_261521558(v31, v77);
    swift_storeEnumTagMultiPayload();
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208C8);
    unint64_t v41 = sub_26151EFEC();
    *(void *)&v85.CGFloat x = v40;
    *(void *)&v85.y = v41;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    unint64_t v43 = sub_26151F078();
    *(void *)&v85.CGFloat x = v74;
    *(void *)&v85.y = v33;
    CGFloat v86 = *(double *)&OpaqueTypeConformance2;
    *(void *)&v87.CGFloat x = v43;
    swift_getOpaqueTypeConformance2();
    sub_261529120();
    sub_2615215C0(v31);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v81, v32);
}

uint64_t sub_261521114@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v8 = *(_OWORD *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_261528EF0();
  swift_release();
  swift_release();
  sub_261521790((uint64_t)&v8);
  if ((void)v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_261528EF0();
    swift_release();
    swift_release();
    sub_261521790((uint64_t)&v8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_261528EF0();
    swift_release();
    swift_release();
    sub_261521790((uint64_t)&v8);
    sub_2615221CC(3, 1, 0, 1, *((uint64_t *)&v4 + 1));
    swift_bridgeObjectRelease();
LABEL_5:
    sub_2615217CC();
    sub_261521820();
    sub_261529120();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9209A0);
    sub_261521874();
    uint64_t result = sub_261529120();
    *(_OWORD *)a2 = v4;
    *(void *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 24) = v6;
    *(unsigned char *)(a2 + 25) = v7;
    return result;
  }
  if (!(void)v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_261528EF0();
    swift_release();
    swift_release();
    sub_261521790((uint64_t)&v8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_261528EF0();
    swift_release();
    swift_release();
    sub_261521790((uint64_t)&v8);
    sub_2615221CC(2, 0, 1, 0, *((uint64_t *)&v4 + 1));
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  uint64_t result = sub_261529450();
  __break(1u);
  return result;
}

__n128 sub_26152145C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = sub_261529190();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  uint64_t v6 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A9208C0) + 36);
  *(unsigned char *)uint64_t v6 = v4;
  __asm { FMOV            V0.2D, #5.0 }
  *(__n128 *)(v6 + 8) = result;
  *(__n128 *)(v6 + 24) = result;
  *(unsigned char *)(v6 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
  return result;
}

uint64_t sub_2615214F8@<X0>(uint64_t a1@<X8>)
{
  return sub_2615206A0(a1);
}

uint64_t sub_261521544(uint64_t result, uint64_t a2, uint64_t a3, char a4, char a5)
{
  if ((a5 & 1) == 0) {
    return j__swift_bridgeObjectRelease(result, a2, a3, a4 & 1);
  }
  return result;
}

uint64_t sub_261521558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2615215C0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9208C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_261521620()
{
  unint64_t result = qword_26A920988;
  if (!qword_26A920988)
  {
    type metadata accessor for VCUIBadgedTextOverlayModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920988);
  }
  return result;
}

uint64_t sub_261521680()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920980);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

double sub_261521714@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A920980) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  *(void *)&double result = sub_26152145C(v4, a1).n128_u64[0];
  return result;
}

uint64_t sub_261521790(uint64_t a1)
{
  return a1;
}

unint64_t sub_2615217CC()
{
  unint64_t result = qword_26A920990;
  if (!qword_26A920990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920990);
  }
  return result;
}

unint64_t sub_261521820()
{
  unint64_t result = qword_26A920998;
  if (!qword_26A920998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920998);
  }
  return result;
}

unint64_t sub_261521874()
{
  unint64_t result = qword_26A9209A8;
  if (!qword_26A9209A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9209A0);
    sub_2615217CC();
    sub_261521820();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9209A8);
  }
  return result;
}

unint64_t sub_2615218F4()
{
  unint64_t result = qword_26A9209B0;
  if (!qword_26A9209B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9209B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9208C8);
    sub_26151EFEC();
    swift_getOpaqueTypeConformance2();
    sub_26151F078();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9209B0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VCUIVerticalBadgedText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VCUIVerticalBadgedText()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for VCUIVerticalBadgedText(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VCUIVerticalBadgedText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUIVerticalBadgedText(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUIVerticalBadgedText(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIVerticalBadgedText()
{
  return &type metadata for VCUIVerticalBadgedText;
}

uint64_t sub_261521B84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261521BA0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A08);
  sub_261529240();
  *(_OWORD *)a2 = xmmword_26152A0C0;
  *(double *)(a2 + 16) = a3;
  *(double *)(a2 + 24) = a4;
  *(void *)(a2 + 32) = v11;
  *(unsigned char *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  *(void *)(a2 + 48) = v13;
  if (!(a1 >> 62))
  {
    swift_retain();
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9209C0);
    swift_getKeyPath();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(double *)(v8 + 24) = a3;
    *(double *)(v8 + 32) = a4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9209F8);
    sub_261522078();
    sub_261521F38();
    sub_2615292D0();
    return swift_release();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_261529460();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) == 0) {
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_261521D58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = *a1;
  if (result > 49)
  {
    uint64_t result = 0;
    goto LABEL_7;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t result = MEMORY[0x263E38F70]();
    goto LABEL_7;
  }
  if (result < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)result < *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t result = (uint64_t)*(id *)(a2 + 8 * result + 32);
LABEL_7:
    *a3 = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_261521DC8()
{
  return sub_261528F50();
}

uint64_t sub_261521E54@<X0>(uint64_t a1@<X8>)
{
  return sub_261521BA0(*(void *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

unint64_t sub_261521E60()
{
  unint64_t result = qword_26A9209C8;
  if (!qword_26A9209C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9209C0);
    sub_261522184(&qword_26A9209D0, &qword_26A9209D8);
    sub_261521F74(&qword_26A9209E0, &qword_26A9209E8, (void (*)(void))sub_261521F38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9209C8);
  }
  return result;
}

uint64_t sub_261521F38()
{
  return sub_261521F74(&qword_26A9209F0, &qword_26A9209F8, (void (*)(void))sub_261521FE0);
}

uint64_t sub_261521F74(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261521FE0()
{
  unint64_t result = qword_26A920A00;
  if (!qword_26A920A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920A00);
  }
  return result;
}

uint64_t sub_261522034()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_26152206C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_261521D58(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_261522078()
{
  unint64_t result = qword_26A920A18;
  if (!qword_26A920A18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A920A10);
    sub_2615220F4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920A18);
  }
  return result;
}

unint64_t sub_2615220F4()
{
  unint64_t result = qword_26A920A20;
  if (!qword_26A920A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920A20);
  }
  return result;
}

uint64_t sub_261522148()
{
  return sub_261522184(&qword_26A920A28, &qword_26A920A30);
}

uint64_t sub_261522184(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2615221CC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = MEMORY[0x263F8EE78];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 15;
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = a4;
  *(void *)(v12 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = a5;
  *(void *)(v12 + 48) = v10;
  *(void *)(v12 + 56) = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A38);
  sub_261520390();
  sub_261522184((unint64_t *)&qword_26A920A40, &qword_26A920A38);
  sub_261529410();
  swift_release();
  swift_beginAccess();
  uint64_t v13 = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_2615223C4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2615223FC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_26152240C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  unint64_t v83 = a4;
  uint64_t v17 = sub_261528EC0();
  MEMORY[0x270FA5388](v17 - 8);
  unsigned __int8 v84 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A920A48);
  uint64_t v85 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  long long v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_261528E90();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (a8) {
      goto LABEL_6;
    }
    uint64_t v91 = a1;
    uint64_t v92 = a2;
    sub_261528E70();
    sub_261520390();
    uint64_t v26 = sub_261529400();
    unint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    swift_bridgeObjectRelease();
    uint64_t v29 = HIBYTE(v28) & 0xF;
    if ((v28 & 0x2000000000000000) == 0) {
      uint64_t v29 = v26 & 0xFFFFFFFFFFFFLL;
    }
    if (v29)
    {
LABEL_6:
      v81 = v21;
      uint64_t v82 = v19;
      uint64_t v30 = (unint64_t *)(a9 + 16);
      unint64_t v31 = a3;
      uint64_t v32 = (uint64_t *)(a12 + 16);
      uint64_t v79 = (void *)(a13 + 16);
      swift_beginAccess();
      uint64_t v33 = *(void *)(a9 + 16);
      unint64_t v86 = v31;
      uint64_t v80 = (unint64_t *)(a9 + 16);
      if ((v33 ^ v31) >= 0x4000)
      {
        uint64_t v76 = a10;
        uint64_t v89 = a10;
        uint64_t v90 = a11;
        uint64_t v78 = a11;
        uint64_t v34 = v33;
        sub_261528E80();
        sub_261520390();
        uint64_t v35 = sub_2615293F0();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
        uint64_t v89 = v35;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A920A50);
        sub_261522184((unint64_t *)&unk_26A920A58, (uint64_t *)&unk_26A920A50);
        sub_261529300();
        swift_bridgeObjectRelease();
        id v36 = objc_allocWithZone(MEMORY[0x263F086A0]);
        unint64_t v37 = (void *)sub_261529310();
        swift_bridgeObjectRelease();
        id v38 = objc_msgSend(v36, (SEL)0x265582E98, v37);

        swift_beginAccess();
        uint64_t v77 = (uint64_t *)(a12 + 16);
        uint64_t v88 = *v32;
        sub_261528EB0();
        sub_261522D58();
        uint64_t v39 = v81;
        sub_261528EA0();
        sub_261522184((unint64_t *)&unk_26A920A68, (uint64_t *)&unk_26A920A48);
        uint64_t v40 = v82;
        sub_261529420();
        (*(void (**)(char *, uint64_t))(v85 + 8))(v39, v40);
        id v41 = objc_allocWithZone(MEMORY[0x263F086A0]);
        double v42 = (void *)sub_261529310();
        swift_bridgeObjectRelease();
        id v43 = objc_msgSend(v41, (SEL)0x265582E98, v42);

        uint64_t v44 = (char *)objc_msgSend(objc_allocWithZone((Class)VCUIBadgedTextSegmentModel), sel_init);
        unint64_t v45 = &v44[OBJC_IVAR___VCUIBadgedTextSegmentModel_range];
        swift_beginAccess();
        unint64_t v46 = v86;
        *(void *)unint64_t v45 = v34;
        *((void *)v45 + 1) = v46;
        double v47 = &v44[OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange];
        swift_beginAccess();
        *(void *)double v47 = v34;
        *((void *)v47 + 1) = v46;
        uint64_t v48 = (void **)&v44[OBJC_IVAR___VCUIBadgedTextSegmentModel_text];
        swift_beginAccess();
        uint64_t v49 = *v48;
        char *v48 = v38;
        uint64_t v50 = v44;

        unint64_t v51 = (void **)&v50[OBJC_IVAR___VCUIBadgedTextSegmentModel_label];
        swift_beginAccess();
        uint64_t v52 = *v51;
        char *v51 = v43;

        objc_msgSend(v50, sel_setIsWhiteSpace_, 1);
        uint64_t v53 = v79;
        swift_beginAccess();
        uint64_t v54 = v50;
        MEMORY[0x263E38E70]();
        if (*(void *)((*v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_261529370();
        }
        sub_261529380();
        sub_261529360();
        swift_endAccess();

        uint64_t v30 = v80;
        uint64_t v32 = v77;
      }
      swift_beginAccess();
      *uint64_t v30 = v86;
      id v55 = objc_allocWithZone(MEMORY[0x263F086A0]);
      swift_bridgeObjectRetain();
      uint64_t v56 = (void *)sub_261529310();
      swift_bridgeObjectRelease();
      id v57 = objc_msgSend(v55, sel_initWithString_, v56);

      swift_beginAccess();
      uint64_t v87 = *v32;
      sub_261528EB0();
      sub_261522D58();
      uint64_t v58 = v81;
      sub_261528EA0();
      sub_261522184((unint64_t *)&unk_26A920A68, (uint64_t *)&unk_26A920A48);
      uint64_t v59 = v82;
      sub_261529420();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v58, v59);
      id v60 = objc_allocWithZone(MEMORY[0x263F086A0]);
      uint64_t v61 = (void *)sub_261529310();
      swift_bridgeObjectRelease();
      id v62 = objc_msgSend(v60, (SEL)0x265582E98, v61);

      int v63 = (char *)objc_msgSend(objc_allocWithZone((Class)VCUIBadgedTextSegmentModel), sel_init);
      uint64_t v64 = &v63[OBJC_IVAR___VCUIBadgedTextSegmentModel_range];
      swift_beginAccess();
      unint64_t v65 = v86;
      unint64_t v66 = v83;
      *(void *)uint64_t v64 = v86;
      *((void *)v64 + 1) = v66;
      CGFloat v67 = &v63[OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange];
      swift_beginAccess();
      *(void *)CGFloat v67 = v65;
      *((void *)v67 + 1) = v66;
      v68 = (void **)&v63[OBJC_IVAR___VCUIBadgedTextSegmentModel_text];
      swift_beginAccess();
      uint64_t v69 = *v68;
      char *v68 = v57;
      uint64_t v70 = v63;

      char v71 = (void **)&v70[OBJC_IVAR___VCUIBadgedTextSegmentModel_label];
      swift_beginAccess();
      uint64_t v72 = *v71;
      *char v71 = v62;

      swift_beginAccess();
      uint64_t v73 = *v32 + 1;
      if (__OFADD__(*v32, 1))
      {
        __break(1u);
      }
      else
      {
        swift_beginAccess();
        *uint64_t v32 = v73;
        uint64_t v74 = v80;
        swift_beginAccess();
        *uint64_t v74 = v66;
        uint64_t v75 = v79;
        swift_beginAccess();
        uint64_t v70 = v70;
        MEMORY[0x263E38E70]();
        if (*(void *)((*v75 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v75 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_12:
          sub_261529380();
          sub_261529360();
          swift_endAccess();

          return;
        }
      }
      sub_261529370();
      goto LABEL_12;
    }
  }
}

uint64_t sub_261522CD0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_261522D20(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_26152240C(a1, a2, a3, a4, a5, a6, a7, *(unsigned char *)(v7 + 16), *(void *)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 40), *(void *)(v7 + 48), *(void *)(v7 + 56));
}

unint64_t sub_261522D58()
{
  unint64_t result = qword_26A920A60;
  if (!qword_26A920A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920A60);
  }
  return result;
}

uint64_t VCUIBadgedTextSegmentModel.range.getter()
{
  return sub_261522E2C(&OBJC_IVAR___VCUIBadgedTextSegmentModel_range);
}

uint64_t VCUIBadgedTextSegmentModel.range.setter(uint64_t a1, uint64_t a2)
{
  return sub_261522E7C(a1, a2, &OBJC_IVAR___VCUIBadgedTextSegmentModel_range);
}

uint64_t (*VCUIBadgedTextSegmentModel.range.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t VCUIBadgedTextSegmentModel.displayedRange.getter()
{
  return sub_261522E2C(&OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange);
}

uint64_t sub_261522E2C(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return *(void *)v2;
}

uint64_t VCUIBadgedTextSegmentModel.displayedRange.setter(uint64_t a1, uint64_t a2)
{
  return sub_261522E7C(a1, a2, &OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange);
}

uint64_t sub_261522E7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*VCUIBadgedTextSegmentModel.displayedRange.modify())()
{
  return j__swift_endAccess;
}

id VCUIBadgedTextSegmentModel.text.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___VCUIBadgedTextSegmentModel_text);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void VCUIBadgedTextSegmentModel.text.setter(void *a1)
{
}

id VCUIBadgedTextSegmentModel.label.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_26152309C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
}

void VCUIBadgedTextSegmentModel.label.setter(void *a1)
{
}

void sub_261523104(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t VCUIBadgedTextSegmentModel.isWhiteSpace.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace);
  swift_beginAccess();
  return *v1;
}

uint64_t VCUIBadgedTextSegmentModel.isWhiteSpace.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t VCUIBadgedTextSegmentModel.nsRange.getter()
{
  swift_beginAccess();
  id v1 = objc_msgSend(v0, sel_text);
  id v2 = objc_msgSend(v1, sel_string);

  sub_261529320();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A38);
  sub_261523458();
  sub_261520390();
  return sub_2615293E0();
}

unint64_t sub_261523458()
{
  unint64_t result = qword_26A920A40;
  if (!qword_26A920A40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A920A38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920A40);
  }
  return result;
}

id VCUIBadgedTextSegmentModel.representedText.getter()
{
  id v1 = objc_msgSend(v0, sel_text);
  id v2 = objc_msgSend(v0, sel_nsRange);
  id v4 = objc_msgSend(v1, sel_attributedSubstringFromRange_, v2, v3);

  return v4;
}

id VCUIBadgedTextSegmentModel.displayedText.getter()
{
  id v1 = objc_msgSend(v0, sel_text);
  swift_beginAccess();
  id v2 = objc_msgSend(v0, sel_text);
  id v3 = objc_msgSend(v2, sel_string);

  uint64_t v4 = sub_261529320();
  uint64_t v6 = v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A38);
  sub_261523458();
  sub_261520390();
  uint64_t v7 = sub_2615293E0();
  id v9 = objc_msgSend(v1, sel_attributedSubstringFromRange_, v7, v8, v4, v6);

  return v9;
}

char *keypath_get_selector_text()
{
  return sel_text;
}

id sub_261523730@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_text);
  *a2 = result;
  return result;
}

id sub_26152376C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setText_, *a1);
}

char *keypath_get_selector_label()
{
  return sel_label;
}

id sub_26152378C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_label);
  *a2 = result;
  return result;
}

id sub_2615237C8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLabel_, *a1);
}

char *keypath_get_selector_isWhiteSpace()
{
  return sel_isWhiteSpace;
}

id sub_2615237E8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isWhiteSpace);
  *a2 = (_BYTE)result;
  return result;
}

id sub_26152381C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsWhiteSpace_, *a1);
}

unint64_t type metadata accessor for VCUIBadgedTextSegmentModel()
{
  unint64_t result = qword_26A920A98;
  if (!qword_26A920A98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A920A98);
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIHorizontalBadgedText()
{
  return &type metadata for VCUIHorizontalBadgedText;
}

uint64_t sub_2615238D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2615238EC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A08);
  sub_261529240();
  *(_OWORD *)a2 = xmmword_26152A0C0;
  *(double *)(a2 + 16) = a3;
  *(double *)(a2 + 24) = a4;
  *(void *)(a2 + 32) = v11;
  *(unsigned char *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  *(void *)(a2 + 48) = v13;
  if (!(a1 >> 62))
  {
    swift_retain();
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920AA0);
    swift_getKeyPath();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(double *)(v8 + 24) = a3;
    *(double *)(v8 + 32) = a4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920AC8);
    sub_261522078();
    sub_261523C14();
    sub_2615292D0();
    return swift_release();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_261529460();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) == 0) {
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_261523AA4()
{
  return sub_261528F50();
}

uint64_t sub_261523B30@<X0>(uint64_t a1@<X8>)
{
  return sub_2615238EC(*(void *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

unint64_t sub_261523B3C()
{
  unint64_t result = qword_26A920AA8;
  if (!qword_26A920AA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A920AA0);
    sub_261522184(&qword_26A9209D0, &qword_26A9209D8);
    sub_261523C50(&qword_26A920AB0, &qword_26A920AB8, (void (*)(void))sub_261523C14);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920AA8);
  }
  return result;
}

uint64_t sub_261523C14()
{
  return sub_261523C50(&qword_26A920AC0, &qword_26A920AC8, (void (*)(void))sub_261523CBC);
}

uint64_t sub_261523C50(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261523CBC()
{
  unint64_t result = qword_26A920AD0;
  if (!qword_26A920AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920AD0);
  }
  return result;
}

uint64_t sub_261523D10()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_261523D48()
{
  return sub_261522184(&qword_26A920AD8, &qword_26A920AE0);
}

ValueMetadata *type metadata accessor for VCUIBadgedVerticalTextSegmentView()
{
  return &type metadata for VCUIBadgedVerticalTextSegmentView;
}

uint64_t sub_261523D94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261523DB0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (objc_msgSend(a1, sel_isWhiteSpace))
  {
    id v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    id v4 = a1;
    unsigned __int8 v11 = sub_2615291A0();
    unsigned __int8 v12 = sub_2615291C0();
    unsigned __int8 v13 = sub_2615291B0();
    sub_2615291B0();
    if (sub_2615291B0() != v11) {
      unsigned __int8 v13 = sub_2615291B0();
    }
    sub_2615291B0();
    if (sub_2615291B0() != v12) {
      unsigned __int8 v13 = sub_2615291B0();
    }
    sub_261528F40();
    uint64_t v7 = v14;
    uint64_t v8 = v15;
    uint64_t v9 = v16;
    uint64_t v10 = v17;
    uint64_t v6 = v13;
    uint64_t v5 = 1;
  }
  id v18 = objc_msgSend(a1, sel_displayedText);
  id v19 = objc_msgSend(v18, sel_string);

  sub_261529320();
  sub_261520390();
  uint64_t v20 = sub_2615291E0();
  uint64_t v22 = v21;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  char v24 = v23 & 1;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v8;
  *(void *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v9;
  *(void *)(a2 + 48) = v10;
  *(unsigned char *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = v20;
  *(void *)(a2 + 72) = v21;
  *(unsigned char *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v23 & 1;
  *(void *)(a2 + 88) = v25;
  id v26 = v4;
  sub_261520370(v20, v22, v24);
  swift_bridgeObjectRetain();
  sub_261520380(v20, v22, v24);

  return swift_bridgeObjectRelease();
}

__n128 sub_261523F98@<Q0>(uint64_t a1@<X8>)
{
  id v3 = *v1;
  uint64_t v4 = sub_261529040();
  sub_261523DB0(v3, (uint64_t)v13);
  uint64_t v5 = v14;
  char v6 = v15;
  char v7 = v17;
  uint64_t v8 = v18;
  __n128 result = (__n128)v13[0];
  long long v10 = v13[1];
  long long v11 = v13[2];
  long long v12 = v16;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v10;
  *(_OWORD *)(a1 + 56) = v11;
  *(void *)(a1 + 72) = v5;
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  *(_OWORD *)(a1 + 88) = v12;
  *(unsigned char *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  return result;
}

unint64_t sub_26152402C()
{
  unint64_t result = qword_26A920AE8;
  if (!qword_26A920AE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A920AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920AE8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VCUILabeledBadgeView(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for VCUILabeledBadgeView(id *a1)
{
}

uint64_t assignWithCopy for VCUILabeledBadgeView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for VCUILabeledBadgeView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUILabeledBadgeView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUILabeledBadgeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUILabeledBadgeView()
{
  return &type metadata for VCUILabeledBadgeView;
}

uint64_t sub_261524200()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_26152421C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_label);
  id v4 = objc_msgSend(v3, sel_string);

  sub_261529320();
  sub_261529240();
  sub_261524358();
  sub_2615243AC();
  sub_261529120();
  double result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(void *)(a2 + 16) = v7;
  *(unsigned char *)(a2 + 24) = v8;
  return result;
}

double sub_26152434C@<D0>(uint64_t a1@<X8>)
{
  return sub_26152421C(*v1, a1);
}

unint64_t sub_261524358()
{
  unint64_t result = qword_26A920AF8;
  if (!qword_26A920AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920AF8);
  }
  return result;
}

unint64_t sub_2615243AC()
{
  unint64_t result = qword_26A920B00;
  if (!qword_26A920B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920B00);
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIHorizontalLabeledBadgeView_CommandAndControl()
{
  return &type metadata for VCUIHorizontalLabeledBadgeView_CommandAndControl;
}

uint64_t _s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void *_s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *_s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwca_0(void *a1, void *a2)
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

uint64_t _s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t _s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwet_0(uint64_t a1, int a2)
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

uint64_t sub_26152459C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VCUIVerticalLabeledBadgeView_CommandAndControl()
{
  return &type metadata for VCUIVerticalLabeledBadgeView_CommandAndControl;
}

unint64_t sub_2615245F0()
{
  unint64_t result = qword_26A920B08;
  if (!qword_26A920B08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A920B10);
    sub_261524358();
    sub_2615243AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920B08);
  }
  return result;
}

id sub_261524670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2615247F0(a1, a2, a3, a4, (SEL *)&selRef_downBadgeViewForText);
}

id sub_26152467C(uint64_t a1)
{
  return sub_2615247F0(a1, *v1, v1[1], v1[2], (SEL *)&selRef_downBadgeViewForText);
}

uint64_t sub_2615246B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_261524AA4(a1, a2, a3, a4, a5, a6, a7, a8, (SEL *)&selRef_downBadgeSizeForDigits);
}

uint64_t sub_2615246F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_261524BCC();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_261524758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_261524BCC();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_2615247BC()
{
}

id sub_2615247E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2615247F0(a1, a2, a3, a4, (SEL *)&selRef_rightBadgeViewForText);
}

id sub_2615247F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v8 = [self *a5];
  if (v8)
  {
    uint64_t v9 = (uint64_t (**)(void, void))v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B28);
    sub_261529250();
    long long v10 = (void *)sub_261529310();
    id v11 = (id)((uint64_t (**)(void, void *))v9)[2](v9, v10);

    sub_261529430();
    swift_unknownObjectRelease();
    _Block_release(v9);
    swift_bridgeObjectRelease();
    sub_261524D50();
    swift_dynamicCast();
    return (id)v20;
  }
  else
  {
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 20.0, 20.0);
    unsigned __int8 v13 = self;
    id v14 = objc_msgSend(v13, sel_blackColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v14);

    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 20.0, 20.0);
    uint64_t v19 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B28);
    sub_261529250();
    long long v16 = (void *)sub_261529310();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setText_, v16, a2, v19, a4);

    id v17 = objc_msgSend(v13, sel_whiteColor);
    objc_msgSend(v15, sel_setTextColor_, v17);

    objc_msgSend(v15, sel_setTextAlignment_, 1);
    objc_msgSend(v12, sel_addSubview_, v15);
  }
  return v12;
}

id sub_261524A50(uint64_t a1)
{
  return sub_2615247F0(a1, *v1, v1[1], v1[2], (SEL *)&selRef_rightBadgeViewForText);
}

uint64_t sub_261524A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_261524AA4(a1, a2, a3, a4, a5, a6, a7, a8, (SEL *)&selRef_rightBadgeSizeForDigits);
}

uint64_t sub_261524AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, SEL *a9)
{
  return sub_261524C74(a6, *v9, v9[1], v9[2], a9);
}

uint64_t sub_261524AD0()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_261524ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_261524C20();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_261524B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_261524C20();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_261524BA4()
{
}

unint64_t sub_261524BCC()
{
  unint64_t result = qword_26A920B18;
  if (!qword_26A920B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920B18);
  }
  return result;
}

unint64_t sub_261524C20()
{
  unint64_t result = qword_26A920B20;
  if (!qword_26A920B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920B20);
  }
  return result;
}

uint64_t sub_261524C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v5 = [self *a5];
  if (!v5) {
    return 0x4034000000000000;
  }
  unint64_t v6 = (double (**)(void, void))v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B28);
  sub_261529250();
  uint64_t v7 = sub_261529330();
  swift_bridgeObjectRelease();
  double v8 = v6[2](v6, v7);
  _Block_release(v6);
  return *(void *)&v8;
}

unint64_t sub_261524D50()
{
  unint64_t result = qword_26A920B30;
  if (!qword_26A920B30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A920B30);
  }
  return result;
}

uint64_t sub_261524D98@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_261524E18()
{
  return sub_261528F00();
}

uint64_t sub_261524E8C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_261524F00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  swift_release();
  return v1;
}

double sub_261524F74()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_261524FEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_261525060()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2615250D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9)
{
  int v48 = a5;
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  *(void *)&long long v45 = a1;
  *((void *)&v45 + 1) = a2;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B80);
  uint64_t v43 = *(void *)(v14 - 8);
  uint64_t v44 = v14;
  MEMORY[0x270FA5388](v14);
  double v42 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B70);
  uint64_t v40 = *(void *)(v16 - 8);
  uint64_t v41 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v39 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B60);
  uint64_t v18 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B50);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  char v24 = (char *)&v38 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B40);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  unint64_t v28 = (char *)&v38 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__text;
  *(void *)&long long v49 = 0;
  *((void *)&v49 + 1) = 0xE000000000000000;
  sub_261528EE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v29, v28, v25);
  uint64_t v30 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__type;
  *(void *)&long long v49 = 1;
  type metadata accessor for VCUIOverlayTextOverlayType(0);
  sub_261528EE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v30, v24, v21);
  uint64_t v31 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__focusRect;
  long long v32 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v49 = *MEMORY[0x263F001A8];
  long long v50 = v32;
  type metadata accessor for CGRect(0);
  sub_261528EE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v31, v20, v38);
  uint64_t v33 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__startIndex;
  *(void *)&long long v49 = 1;
  uint64_t v34 = v39;
  sub_261528EE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v33, v34, v41);
  uint64_t v35 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__popoverShowing;
  LOBYTE(v49) = 1;
  id v36 = v42;
  sub_261528EE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v35, v36, v44);
  swift_getKeyPath();
  swift_getKeyPath();
  long long v49 = v45;
  swift_retain();
  sub_261528F00();
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v49 = v46;
  swift_retain();
  sub_261528F00();
  swift_getKeyPath();
  swift_getKeyPath();
  *(double *)&long long v49 = a6;
  *((double *)&v49 + 1) = a7;
  *(double *)&long long v50 = a8;
  *((double *)&v50 + 1) = a9;
  swift_retain();
  sub_261528F00();
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v49 = v47;
  swift_retain();
  sub_261528F00();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v49) = v48;
  swift_retain();
  sub_261528F00();
  return v9;
}

uint64_t sub_261525670(uint64_t a1)
{
  if (a1 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_261528EF0();
    swift_release();
    swift_release();
    uint64_t v1 = v7;
    uint64_t v2 = v8;
    uint64_t v3 = 3;
    char v4 = 0;
LABEL_5:
    uint64_t v5 = sub_2615221CC(v3, 1, v4, v1, v2);
    swift_bridgeObjectRelease();
    return v5;
  }
  if (!a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_261528EF0();
    swift_release();
    swift_release();
    uint64_t v1 = v7;
    uint64_t v2 = v8;
    uint64_t v3 = 2;
    char v4 = 1;
    goto LABEL_5;
  }
  uint64_t result = sub_261529450();
  __break(1u);
  return result;
}

uint64_t VCUIBadgedTextOverlayModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__text;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__type;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__focusRect;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__startIndex;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__popoverShowing;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  return v0;
}

uint64_t VCUIBadgedTextOverlayModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__text;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__type;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__focusRect;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__startIndex;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__popoverShowing;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v12 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v11, v12);
}

uint64_t sub_261525AF4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for VCUIBadgedTextOverlayModel();
  uint64_t result = sub_261528ED0();
  *a1 = result;
  return result;
}

id sub_261525B34()
{
  uint64_t v1 = v0;
  v32.receiver = v0;
  v32.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  objc_msgSendSuper2(&v32, sel_viewDidLoad);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController];
  objc_msgSend(v0, sel_addChildViewController_, v2);
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v4 = result;
  objc_msgSend(result, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = result;
  id v6 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = result;
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = result;
  objc_msgSend(v7, sel_addSubview_, result);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920B90);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_26152A550;
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v10 = result;
  id v11 = objc_msgSend(result, sel_leadingAnchor);

  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v12 = result;
  id v13 = objc_msgSend(result, sel_leadingAnchor);

  id v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(void *)(v9 + 32) = v14;
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v15 = result;
  id v16 = objc_msgSend(result, sel_trailingAnchor);

  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v17 = result;
  id v18 = objc_msgSend(result, sel_trailingAnchor);

  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(void *)(v9 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v19;
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v20 = result;
  id v21 = objc_msgSend(result, sel_topAnchor);

  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v22 = result;
  id v23 = objc_msgSend(result, sel_topAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_constant_, v23, 0.0);
  *(void *)(v9 + 48) = v24;
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v25 = result;
  id v26 = objc_msgSend(result, sel_bottomAnchor);

  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    uint64_t v27 = result;
    unint64_t v28 = self;
    id v29 = objc_msgSend(v27, sel_bottomAnchor);

    id v30 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v29);
    *(void *)(v9 + 56) = v30;
    sub_261529360();
    sub_261525FE0();
    uint64_t v31 = (void *)sub_261529350();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_activateConstraints_, v31);

    return objc_msgSend(v2, sel_didMoveToParentViewController_, v1);
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for VCUIBadgedTextOverlayController_Swift()
{
  return self;
}

unint64_t sub_261525FE0()
{
  unint64_t result = qword_26A920B98;
  if (!qword_26A920B98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A920B98);
  }
  return result;
}

void sub_2615260EC()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController), sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_intrinsicContentSize);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2615261C4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_261526270(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text);
  *uint64_t v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_261528F00();
  swift_release();
  return swift_release();
}

void (*sub_261526338(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text;
  v3[9] = v1;
  v3[10] = v4;
  uint64_t v5 = (uint64_t *)(v1 + v4);
  uint64_t v6 = *v5;
  v3[8] = v5[1];
  v3[7] = v6;
  swift_bridgeObjectRetain();
  return sub_2615263AC;
}

void sub_2615263AC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 56);
  uint64_t v5 = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = *(void *)(*(void *)a1 + 80);
  uint64_t v6 = *(void *)(*(void *)a1 + 64);
  uint64_t v7 = (void *)(v5 + v4);
  *uint64_t v7 = v3;
  v7[1] = v6;
  uint64_t v8 = v2[9];
  uint64_t v9 = v2[10];
  if (a2)
  {
    uint64_t v10 = (uint64_t *)(v8 + v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_261529060();
    uint64_t v12 = *v10;
    uint64_t v11 = v10[1];
    swift_getKeyPath();
    swift_getKeyPath();
    void *v2 = v12;
    v2[1] = v11;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_261528F00();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v13 = (uint64_t *)(v8 + v9);
    sub_261529060();
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    swift_getKeyPath();
    swift_getKeyPath();
    void *v2 = v15;
    v2[1] = v14;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_261528F00();
    swift_release();
    swift_release();
  }
  free(v2);
}

uint64_t sub_261526544()
{
  return *(void *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
}

uint64_t sub_2615265A8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type) = a1;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_261528F00();
  swift_release();
  return swift_release();
}

void (*sub_26152665C(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type;
  v3[8] = v1;
  v3[9] = v4;
  v3[7] = *(void *)(v1 + v4);
  return sub_2615266B8;
}

void sub_2615266B8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 64) + *(void *)(*(void *)a1 + 72)) = *(void *)(*(void *)a1 + 56);
  uint64_t v3 = v1[8];
  uint64_t v2 = v1[9];
  sub_261529060();
  uint64_t v4 = *(void *)(v3 + v2);
  swift_getKeyPath();
  swift_getKeyPath();
  void *v1 = v4;
  swift_retain();
  sub_261528F00();
  swift_release();
  swift_release();
  free(v1);
}

double sub_261526794()
{
  return *(double *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
}

uint64_t sub_261526824(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = (double *)(v4 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  *uint64_t v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_261528F00();
  swift_release();
  return swift_release();
}

void (*sub_2615268F4(void *a1))(uint64_t a1)
{
  uint64_t v3 = (char *)malloc(0x68uLL);
  uint64_t v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect;
  long long v5 = *(_OWORD *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  *(_OWORD *)(v3 + 72) = *(_OWORD *)(v1
                                   + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect
                                   + 16);
  *a1 = v3;
  *((void *)v3 + 11) = v1;
  *((void *)v3 + 12) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  return sub_261526958;
}

void sub_261526958(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = (void *)(*(void *)(*(void *)a1 + 88) + *(void *)(*(void *)a1 + 96));
  uint64_t v3 = *(void *)(*(void *)a1 + 56);
  uint64_t v4 = *(void *)(*(void *)a1 + 64);
  uint64_t v5 = *(void *)(*(void *)a1 + 72);
  uint64_t v6 = *(void *)(*(void *)a1 + 80);
  void *v2 = v3;
  v2[1] = v4;
  v2[2] = v5;
  v2[3] = v6;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  void *v1 = v3;
  v1[1] = v4;
  v1[2] = v5;
  v1[3] = v6;
  swift_retain();
  sub_261528F00();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_261526A44()
{
  return *(void *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex);
}

uint64_t sub_261526AA8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex) = a1;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_261528F00();
  swift_release();
  return swift_release();
}

void (*sub_261526B58(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex;
  v3[8] = v1;
  v3[9] = v4;
  v3[7] = *(void *)(v1 + v4);
  return sub_261526BB4;
}

void sub_261526BB4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 56);
  *(void *)(*(void *)(*(void *)a1 + 64) + *(void *)(*(void *)a1 + 72)) = v2;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  void *v1 = v2;
  swift_retain();
  sub_261528F00();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_261526C80()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing);
}

uint64_t sub_261526CE4(char a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing) = a1;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_261528F00();
  swift_release();
  return swift_release();
}

void (*sub_261526D94(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing;
  v3[7] = v1;
  v3[8] = v4;
  *((unsigned char *)v3 + 49) = *(unsigned char *)(v1 + v4);
  return sub_261526DF0;
}

void sub_261526DF0(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 49);
  *(unsigned char *)(*(void *)(*(void *)a1 + 56) + *(void *)(*(void *)a1 + 64)) = v2;
  sub_261529060();
  swift_getKeyPath();
  swift_getKeyPath();
  unsigned char *v1 = v2;
  swift_retain();
  sub_261528F00();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_261526EF4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_261526F88(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261526FD4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261527078()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_26152710C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261527158())()
{
  return j__swift_endAccess;
}

uint64_t sub_2615271B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 == 1)
  {
    uint64_t v8 = 3;
    uint64_t v9 = a4;
    char v10 = 0;
    return sub_2615221CC(v8, v9, v10, a1, a2);
  }
  if (!a3)
  {
    uint64_t v8 = 2;
    uint64_t v9 = a4;
    char v10 = 1;
    return sub_2615221CC(v8, v9, v10, a1, a2);
  }
  uint64_t result = sub_261529450();
  __break(1u);
  return result;
}

uint64_t sub_261527340()
{
  sub_261529060();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
  swift_retain();
  uint64_t v2 = sub_261525670(v1);
  swift_release_n();
  swift_release();
  return v2;
}

uint64_t sub_261527480()
{
  return 1;
}

id VCUIBadgedTextOverlayController_Swift.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_261529310();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id VCUIBadgedTextOverlayController_Swift.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController;
  id v7 = v3;
  sub_261527CCC((uint64_t)v15);
  id v8 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A920BD8));
  *(void *)&v3[v6] = sub_261529050();
  uint64_t v9 = &v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0xE000000000000000;
  *(void *)&v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type] = 1;
  char v10 = &v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect];
  *(_OWORD *)char v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(void *)&v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex] = 1;
  v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing] = 0;
  *(void *)&v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder] = 10;
  v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay] = 1;

  if (a2)
  {
    uint64_t v11 = (void *)sub_261529310();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v11, a3);

  return v12;
}

id VCUIBadgedTextOverlayController_Swift.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id VCUIBadgedTextOverlayController_Swift.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController;
  uint64_t v4 = v1;
  sub_261527CCC((uint64_t)v11);
  id v5 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A920BD8));
  *(void *)&v1[v3] = sub_261529050();
  uint64_t v6 = &v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0xE000000000000000;
  *(void *)&v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type] = 1;
  id v7 = &v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect];
  *(_OWORD *)id v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *(void *)&v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex] = 1;
  v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder] = 10;
  v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay] = 1;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  id v8 = objc_msgSendSuper2(&v10, sel_initWithCoder_, a1);

  return v8;
}

id VCUIBadgedTextOverlayController_Swift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2615278AC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_261527930()
{
  return sub_261528F00();
}

uint64_t sub_2615279B8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_261527A3C()
{
  return sub_261528F00();
}

double sub_261527AB4@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_261527B38()
{
  return sub_261528F00();
}

uint64_t sub_261527BC8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_261528EF0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_261527C4C()
{
  return sub_261528F00();
}

double sub_261527CCC@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for VCUIBadgedTextOverlayModel();
  swift_allocObject();
  sub_2615250D4(0, 0xE000000000000000, 1, 1, 1, 0.0, 0.0, 0.0, 0.0);
  sub_261521620();
  uint64_t v2 = sub_261528FD0();
  uint64_t v4 = v3;
  sub_261529240();
  double result = 300.0;
  *(_OWORD *)a1 = xmmword_26152A560;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v6;
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v7;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_261527D9C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_261527DA8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = (void *)(*a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text);
  uint64_t v3 = v2[1];
  *a2 = *v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_261527DC4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_261526270(v1, v2);
}

void *sub_261527E04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*result + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
  return result;
}

uint64_t sub_261527E1C(uint64_t *a1)
{
  return sub_2615265A8(*a1);
}

__n128 sub_261527E44@<Q0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2 = *a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect;
  __n128 result = *(__n128 *)v2;
  long long v4 = *(_OWORD *)(v2 + 16);
  *a2 = *(_OWORD *)v2;
  a2[1] = v4;
  return result;
}

uint64_t sub_261527E60(double *a1)
{
  return sub_261526824(*a1, a1[1], a1[2], a1[3]);
}

void *sub_261527E8C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*result + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex);
  return result;
}

uint64_t sub_261527EA4(uint64_t *a1)
{
  return sub_261526AA8(*a1);
}

void *sub_261527ECC@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*result + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing);
  return result;
}

uint64_t sub_261527EE4(char *a1)
{
  return sub_261526CE4(*a1);
}

uint64_t sub_261527F0C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_261527F60(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_261527FB0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_261528004(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_261528054()
{
  return type metadata accessor for VCUIBadgedTextOverlayModel();
}

uint64_t type metadata accessor for VCUIBadgedTextOverlayModel()
{
  uint64_t result = qword_26A920BE0;
  if (!qword_26A920BE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2615280A8()
{
  sub_2615282F8(319, &qword_26A920BF0);
  if (v0 <= 0x3F)
  {
    sub_2615282A4(319, &qword_26A920BF8, type metadata accessor for VCUIOverlayTextOverlayType);
    if (v1 <= 0x3F)
    {
      sub_2615282A4(319, &qword_26A920C00, type metadata accessor for CGRect);
      if (v2 <= 0x3F)
      {
        sub_2615282F8(319, &qword_26A920C08);
        if (v3 <= 0x3F)
        {
          sub_2615282F8(319, (unint64_t *)&unk_26A920C10);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t method lookup function for VCUIBadgedTextOverlayModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VCUIBadgedTextOverlayModel);
}

void sub_2615282A4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_261528F10();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_2615282F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_261528F10();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t method lookup function for VCUIBadgedTextOverlayController_Swift(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VCUIBadgedTextOverlayController_Swift);
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.text.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.text.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.text.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.type.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.type.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.type.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.focusRect.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.focusRect.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.focusRect.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.startIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.startIndex.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.startIndex.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.popoverShowing.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.popoverShowing.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.popoverShowing.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.zOrder.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.zOrder.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.zOrder.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.isOverlay.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.isOverlay.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.isOverlay.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of static VCUIBadgedTextOverlayController_Swift.textSegmentModels(forText:type:start:)()
{
  return (*(uint64_t (**)(void))(v0 + 432))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.displayedTextSegmentModels()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t sub_261528864()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  if (qword_26A921390 == -1)
  {
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_26A921390, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_26A921384 > a2) {
    return 1;
  }
  return dword_26A921384 >= a2 && dword_26A921388 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_26A921398 == -1)
  {
    if (qword_26A9213A0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_26A921398, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_26A9213A0) {
      return _availability_version_check();
    }
  }
  if (qword_26A921390 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_26A921390, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_26A921384 > a3) {
    return 1;
  }
  return dword_26A921384 >= a3 && dword_26A921388 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_26A9213A0;
  if (qword_26A9213A0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_26A9213A0 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  objc_super v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    unint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        id v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          id v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x263E390A0](v13);
                          if (v14 < 0)
                          {
                            id v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            id v16 = malloc(v15);
                            if (v16)
                            {
                              id v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  id v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_26A921384, &dword_26A921388);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    id v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  id v19 = v13;
                                }
                                id v16 = v26;
                              }
                              else
                              {
                                id v16 = v26;
                                id v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          id v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_261528E70()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_261528E80()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_261528E90()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_261528EA0()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_261528EB0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_261528EC0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_261528ED0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_261528EE0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_261528EF0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_261528F00()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_261528F10()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_261528F20()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_261528F30()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_261528F40()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_261528F50()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_261528F60()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_261528F70()
{
  return MEMORY[0x270EFF7C8]();
}

uint64_t sub_261528F80()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_261528F90()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_261528FA0()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_261528FB0()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_261528FC0()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_261528FD0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_261528FE0()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_261528FF0()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_261529000()
{
  return MEMORY[0x270EFFD40]();
}

uint64_t sub_261529010()
{
  return MEMORY[0x270EFFD48]();
}

uint64_t sub_261529020()
{
  return MEMORY[0x270EFFD58]();
}

uint64_t sub_261529030()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_261529040()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_261529050()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_261529060()
{
  return MEMORY[0x270F016B8]();
}

uint64_t sub_261529070()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_261529080()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_2615290A0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_2615290B0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_2615290C0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_2615290D0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_2615290E0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_2615290F0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_261529110()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_261529120()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_261529130()
{
  return MEMORY[0x270F01DB8]();
}

uint64_t sub_261529140()
{
  return MEMORY[0x270F01DC0]();
}

uint64_t sub_261529150()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_261529160()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_261529170()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_261529180()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_261529190()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2615291A0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2615291B0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2615291C0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2615291D0()
{
  return MEMORY[0x270F02A98]();
}

uint64_t sub_2615291E0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2615291F0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_261529200()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_261529210()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_261529220()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_261529230()
{
  return MEMORY[0x270F03E70]();
}

uint64_t sub_261529240()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_261529250()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_261529260()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_261529270()
{
  return MEMORY[0x270F04868]();
}

uint64_t sub_261529280()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_261529290()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_2615292A0()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_2615292B0()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_2615292C0()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_2615292D0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2615292E0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2615292F0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_261529300()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_261529310()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_261529320()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_261529330()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_261529340()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_261529350()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_261529360()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_261529370()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_261529380()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_261529390()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2615293A0()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_2615293B0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2615293C0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2615293D0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2615293E0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_2615293F0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_261529400()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_261529410()
{
  return MEMORY[0x270EF2490]();
}

uint64_t sub_261529420()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_261529430()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_261529440()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_261529450()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_261529460()
{
  return MEMORY[0x270F9F080]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}