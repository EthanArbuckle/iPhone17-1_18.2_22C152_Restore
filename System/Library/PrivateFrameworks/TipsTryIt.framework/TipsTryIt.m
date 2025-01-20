__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

uint64_t sub_25F73B31C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F73B33C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
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

uint64_t sub_25F73B384(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F73B3A4(uint64_t result, int a2, int a3)
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

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for CompletionView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CompletionView(uint64_t a1)
{
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CompletionView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  v7 = *(void **)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v6;
  swift_retain();
  id v8 = v5;
  swift_retain();
  id v9 = v7;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompletionView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(void **)(a1 + 16);
  uint64_t v6 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v6;
  id v7 = v6;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  id v8 = *(void **)(a1 + 32);
  id v9 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v9;
  id v10 = v9;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for CompletionView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CompletionView(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompletionView()
{
  return &type metadata for CompletionView;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_25F73B710()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_25F73B72C()
{
  unk_26A7BB617 = -18;
}

double sub_25F73B75C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB748);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 3;
  *(_OWORD *)(v0 + 16) = xmmword_25F78CCA0;
  *(void *)(v0 + 32) = 0x656B636568636E55;
  *(void *)(v0 + 40) = 0xE900000000000064;
  *(void *)(v0 + 48) = 0x64656B63656843;
  *(void *)(v0 + 56) = 0xE700000000000000;
  *(void *)(v0 + 64) = 1702060354;
  *(void *)(v0 + 72) = 0xE400000000000000;
  off_26A7BB620 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_25F73B7E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB750);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB758);
  MEMORY[0x270FA5388](v27);
  id v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB760);
  uint64_t v10 = MEMORY[0x270FA5388](v30);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v28 = (uint64_t)v26 - v13;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB768);
  MEMORY[0x270FA5388](v29);
  v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v39 = *((_OWORD *)a1 + 1);
  long long v31 = *((_OWORD *)a1 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB738);
  sub_25F78BC80();
  v16 = (void *)v34;
  if ((void)v34)
  {
    sub_25F73D51C((uint64_t)&v39, (uint64_t)v41, &qword_26A7BB710);
    sub_25F73D51C((uint64_t)&v39 + 8, (uint64_t)v40, &qword_26A7BB718);
    sub_25F73D7A4(0, &qword_26A7BB770);
    uint64_t v17 = swift_allocObject();
    v26[1] = a2;
    *(void *)(v17 + 16) = v16;
    id v18 = v16;
    sub_25F78B210();
    sub_25F78BDE0();
    sub_25F78B220();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v4);
    v19 = &v9[*(int *)(v27 + 36)];
    long long v20 = v32;
    *(_OWORD *)v19 = v31;
    *((_OWORD *)v19 + 1) = v20;
    *((_OWORD *)v19 + 2) = v33;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v37 = *a1;
    char v38 = *((unsigned char *)a1 + 8);
    long long v34 = *((_OWORD *)a1 + 2);
    sub_25F73D51C((uint64_t)&v34, (uint64_t)&v36, &qword_26A7BB720);
    sub_25F73D51C((uint64_t)&v34 + 8, (uint64_t)v35, &qword_26A7BB728);
    v21 = (uint64_t (*)())swift_allocObject();
    long long v22 = *((_OWORD *)a1 + 1);
    *((_OWORD *)v21 + 1) = *(_OWORD *)a1;
    *((_OWORD *)v21 + 2) = v22;
    *((_OWORD *)v21 + 3) = *((_OWORD *)a1 + 2);
    sub_25F73D580((uint64_t)v9, (uint64_t)v12, &qword_26A7BB758);
    v23 = (uint64_t (**)())&v12[*(int *)(v30 + 36)];
    *v23 = sub_25F73D514;
    v23[1] = v21;
    v23[2] = 0;
    v23[3] = 0;
    sub_25F73CE14((uint64_t)&v37);
    sub_25F73CDE8(v41);
    sub_25F73CE14((uint64_t)v40);
    sub_25F73CDE8(&v36);
    sub_25F73CE14((uint64_t)v35);
    sub_25F73D748((uint64_t)v9, &qword_26A7BB758);
    uint64_t v24 = v28;
    sub_25F73D51C((uint64_t)v12, v28, &qword_26A7BB760);
    sub_25F73D580(v24, (uint64_t)v15, &qword_26A7BB760);
    swift_storeEnumTagMultiPayload();
    sub_25F73D5E4();
    sub_25F78B6F0();

    return sub_25F73D748(v24, &qword_26A7BB760);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_25F73D5E4();
    return sub_25F78B6F0();
  }
}

uint64_t sub_25F73BC90(uint64_t *a1)
{
  uint64_t v2 = sub_25F78BEC0();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF00();
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v24 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25F78BF20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - v13;
  sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
  uint64_t v21 = sub_25F78C210();
  sub_25F78BF10();
  MEMORY[0x2611FE2F0](v12, 0.5);
  long long v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v12, v8);
  uint64_t v33 = *a1;
  char v34 = *((unsigned char *)a1 + 8);
  long long v30 = *((_OWORD *)a1 + 1);
  sub_25F73D51C((uint64_t)&v30, (uint64_t)&v32, &qword_26A7BB710);
  sub_25F73D51C((uint64_t)&v30 + 8, (uint64_t)v31, &qword_26A7BB718);
  long long v27 = *((_OWORD *)a1 + 2);
  sub_25F73D51C((uint64_t)&v27, (uint64_t)&v29, &qword_26A7BB720);
  sub_25F73D51C((uint64_t)&v27 + 8, (uint64_t)v28, &qword_26A7BB728);
  v15 = (_OWORD *)swift_allocObject();
  long long v16 = *((_OWORD *)a1 + 1);
  v15[1] = *(_OWORD *)a1;
  v15[2] = v16;
  v15[3] = *((_OWORD *)a1 + 2);
  aBlock[4] = sub_25F73D7E4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F770630;
  aBlock[3] = &block_descriptor;
  uint64_t v17 = _Block_copy(aBlock);
  sub_25F73CE14((uint64_t)&v33);
  sub_25F73CDE8(&v32);
  sub_25F73CE14((uint64_t)v31);
  sub_25F73CDE8(&v29);
  sub_25F73CE14((uint64_t)v28);
  swift_release();
  sub_25F78BEE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25F73CD04((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  sub_25F78C2E0();
  id v18 = (void *)v21;
  MEMORY[0x2611FE5B0](v14, v7, v4, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v24);
  return ((uint64_t (*)(char *, uint64_t))v22)(v14, v8);
}

uint64_t sub_25F73C104(uint64_t *a1)
{
  uint64_t v30 = sub_25F78BEC0();
  uint64_t v33 = *(void *)(v30 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v29 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25F78BF00();
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_25F78BF20();
  uint64_t v6 = *(void *)(v26 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - v10;
  v12 = (void *)a1[4];
  uint64_t v13 = (void *)a1[2];
  sub_25F73CE40();
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82830]), sel_initWithStyle_, 1);
  objc_msgSend(v14, sel_impactOccurred);

  sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
  uint64_t v27 = sub_25F78C210();
  sub_25F78BF10();
  MEMORY[0x2611FE2F0](v9, 1.5);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15 = v9;
  uint64_t v16 = v26;
  v28(v15, v26);
  uint64_t v35 = *a1;
  char v36 = *((unsigned char *)a1 + 8);
  uint64_t v17 = (_OWORD *)swift_allocObject();
  long long v18 = *((_OWORD *)a1 + 1);
  v17[1] = *(_OWORD *)a1;
  v17[2] = v18;
  v17[3] = *((_OWORD *)a1 + 2);
  aBlock[4] = sub_25F73D860;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F770630;
  aBlock[3] = &block_descriptor_44;
  v19 = _Block_copy(aBlock);
  sub_25F73CE14((uint64_t)&v35);
  swift_retain();
  id v20 = v13;
  swift_retain();
  id v21 = v12;
  swift_release();
  sub_25F78BEE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25F73CD04((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  long long v22 = v29;
  uint64_t v23 = v30;
  sub_25F78C2E0();
  uint64_t v24 = (void *)v27;
  MEMORY[0x2611FE5B0](v11, v5, v22, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v22, v23);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v32);
  return ((uint64_t (*)(char *, uint64_t))v28)(v11, v16);
}

uint64_t sub_25F73C55C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  sub_25F76A324(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_25F73CD04((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B030();
  swift_release();
  return swift_release();
}

uint64_t sub_25F73C65C()
{
  return sub_25F78BAD0();
}

uint64_t sub_25F73C678@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB700);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = v1[1];
  long long v12 = *v1;
  long long v13 = v6;
  long long v14 = v1[2];
  *(void *)uint64_t v5 = sub_25F78B600();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB708);
  sub_25F73B7E0((uint64_t *)&v12, (uint64_t)&v5[*(int *)(v7 + 44)]);
  uint64_t v15 = v12;
  char v16 = BYTE8(v12);
  long long v17 = v13;
  sub_25F73D51C((uint64_t)&v17, (uint64_t)&v19, &qword_26A7BB710);
  sub_25F73D51C((uint64_t)&v17 + 8, (uint64_t)v18, &qword_26A7BB718);
  long long v20 = v14;
  sub_25F73D51C((uint64_t)&v20, (uint64_t)&v22, &qword_26A7BB720);
  sub_25F73D51C((uint64_t)&v20 + 8, (uint64_t)v21, &qword_26A7BB728);
  uint64_t v8 = (void (*)())swift_allocObject();
  long long v9 = v13;
  *((_OWORD *)v8 + 1) = v12;
  *((_OWORD *)v8 + 2) = v9;
  *((_OWORD *)v8 + 3) = v14;
  sub_25F73D580((uint64_t)v5, a1, &qword_26A7BB700);
  uint64_t v10 = (void (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB730) + 36));
  *uint64_t v10 = sub_25F73CDDC;
  v10[1] = v8;
  v10[2] = 0;
  v10[3] = 0;
  sub_25F73CE14((uint64_t)&v15);
  sub_25F73CDE8(&v19);
  sub_25F73CE14((uint64_t)v18);
  sub_25F73CDE8(&v22);
  sub_25F73CE14((uint64_t)v21);
  return sub_25F73D748((uint64_t)v5, &qword_26A7BB700);
}

uint64_t sub_25F73C840(uint64_t a1, uint64_t a2)
{
  return sub_25F73C938(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25F73C858()
{
  sub_25F78BFD0();
  sub_25F78C020();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F73C8AC()
{
  sub_25F78BFD0();
  sub_25F78C450();
  sub_25F78C020();
  uint64_t v0 = sub_25F78C470();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25F73C920(uint64_t a1, uint64_t a2)
{
  return sub_25F73C938(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25F73C938(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25F78BFD0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25F73C97C(uint64_t a1, id *a2)
{
  uint64_t result = sub_25F78BFB0();
  *a2 = 0;
  return result;
}

uint64_t sub_25F73C9F4(uint64_t a1, id *a2)
{
  char v3 = sub_25F78BFC0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25F73CA74@<X0>(uint64_t *a1@<X8>)
{
  sub_25F78BFD0();
  uint64_t v2 = sub_25F78BFA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25F73CAB8()
{
  uint64_t v0 = sub_25F78BFD0();
  uint64_t v2 = v1;
  if (v0 == sub_25F78BFD0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25F78C410();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25F73CB44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25F78BFA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25F73CB8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F78BFD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25F73CBB8(uint64_t a1)
{
  uint64_t v2 = sub_25F73CD04(&qword_26A7BB6F0, type metadata accessor for Key);
  uint64_t v3 = sub_25F73CD04(&qword_26A7BB6F8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F73CC74()
{
  return sub_25F73CD04(&qword_26A7BB6D8, type metadata accessor for Key);
}

uint64_t sub_25F73CCBC()
{
  return sub_25F73CD04(&qword_26A7BB6E0, type metadata accessor for Key);
}

uint64_t sub_25F73CD04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F73CD4C()
{
  return sub_25F73CD04(&qword_26A7BB6E8, type metadata accessor for Key);
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

void sub_25F73CDDC()
{
  sub_25F73CFD4(v0[4], v0[5], v0[6], v0[7]);
}

id *sub_25F73CDE8(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_25F73CE14(uint64_t a1)
{
  return a1;
}

void sub_25F73CE40()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB738);
  sub_25F78BC80();
  if (v7)
  {
    if (qword_26A7BB618 != -1) {
      goto LABEL_11;
    }
    while (1)
    {
      unint64_t v0 = *((void *)off_26A7BB620 + 2);
      if (v0 < 2) {
        break;
      }
      uint64_t v1 = 0;
      unint64_t v2 = 1;
      while (v2 < *((void *)off_26A7BB620 + 2))
      {
        swift_bridgeObjectRetain();
        uint64_t v3 = (void *)sub_25F78BFA0();
        swift_bridgeObjectRelease();
        id v4 = objc_msgSend(v7, sel_stateWithName_, v3);

        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB740);
        sub_25F78BC80();
        id v5 = v7;
        LODWORD(v6) = 1.0;
        objc_msgSend(v7, sel_setState_ofLayer_transitionSpeed_, v4, v5, v6);

        ++v2;
        v1 += 16;
        if (v0 == v2) {
          goto LABEL_8;
        }
      }
      __break(1u);
LABEL_11:
      swift_once();
    }
LABEL_8:
  }
}

void sub_25F73CFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (qword_26A7BB600 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26A7BB688;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  long long v9 = (void *)qword_26A7BC948;
  id v10 = objc_allocWithZone(MEMORY[0x263F81638]);
  id v11 = v9;
  long long v12 = (void *)sub_25F78BFA0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithName_bundle_, v12, v11);

  if (v13)
  {
    id v14 = objc_msgSend(v13, sel_data);

    uint64_t v15 = sub_25F78AFD0();
    unint64_t v17 = v16;

    sub_25F73D420(v15, v17);
    long long v18 = (void *)sub_25F78AFC0();
    id v19 = (void *)sub_25F78BFA0();
    v31.m11 = 0.0;
    id v20 = objc_msgSend(self, sel_packageWithData_type_options_error_, v18, v19, 0, &v31);

    if (v20)
    {
      id v21 = *(id *)&v31.m11;
      sub_25F73D478(v15, v17);
      id v22 = objc_msgSend(v20, sel_rootLayer);
      if (v22)
      {
        *(void *)&v31.m11 = a1;
        *(void *)&v31.m12 = a2;
        id v32 = v22;
        id v23 = v22;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB738);
        sub_25F78BC90();
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F158B0]), sel_initWithLayer_, v23);
        *(void *)&v31.m11 = a3;
        *(void *)&v31.m12 = a4;
        id v32 = v24;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB740);
        sub_25F78BC90();
        CATransform3DMakeScale(&v31, 1.0, -1.0, 1.0);
        objc_msgSend(v23, sel_setTransform_, &v31);
        if (qword_26A7BB618 != -1) {
          swift_once();
        }
        if (*((void *)off_26A7BB620 + 2))
        {
          swift_bridgeObjectRetain();
          uint64_t v25 = (void *)sub_25F78BFA0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v25 = 0;
        }
        id v28 = objc_msgSend(v23, sel_stateWithName_, v25);

        *(void *)&v31.m11 = a3;
        *(void *)&v31.m12 = a4;
        sub_25F78BC80();
        id v29 = v32;
        if (v32)
        {
          id v30 = v23;
          objc_msgSend(v29, sel_setState_ofLayer_, v28, v30);
          sub_25F73D478(v15, v17);
        }
        else
        {
          sub_25F73D478(v15, v17);
        }
      }
      else
      {

        sub_25F73D478(v15, v17);
      }
    }
    else
    {
      id v26 = *(id *)&v31.m11;
      uint64_t v27 = (void *)sub_25F78AF20();

      swift_willThrow();
      sub_25F73D478(v15, v17);
      sub_25F73D478(v15, v17);
    }
  }
}

uint64_t sub_25F73D420(uint64_t a1, unint64_t a2)
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

uint64_t sub_25F73D478(uint64_t a1, unint64_t a2)
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

uint64_t sub_25F73D4D0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25F73D508(void *a1)
{
  return sub_25F78775C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25F73D514()
{
  return sub_25F73BC90((uint64_t *)(v0 + 16));
}

uint64_t sub_25F73D51C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F73D580(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25F73D5E4()
{
  unint64_t result = qword_26A7BB778;
  if (!qword_26A7BB778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BB760);
    sub_25F73D6A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB778);
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

unint64_t sub_25F73D6A8()
{
  unint64_t result = qword_26A7BB780;
  if (!qword_26A7BB780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BB758);
    sub_25F73D9A4(&qword_26A7BB788, &qword_26A7BB750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB780);
  }
  return result;
}

uint64_t sub_25F73D748(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25F73D7A4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25F73D7E4()
{
  return sub_25F73C104((uint64_t *)(v0 + 16));
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

uint64_t objectdestroyTm()
{
  swift_release();

  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25F73D860()
{
  return sub_25F73C55C(v0 + 16);
}

uint64_t sub_25F73D870()
{
  return sub_25F762BAC(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void sub_25F73D8B8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_25F73D904()
{
  unint64_t result = qword_26A7BB7B8;
  if (!qword_26A7BB7B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BB730);
    sub_25F73D9A4((unint64_t *)&unk_26A7BB7C0, &qword_26A7BB700);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB7B8);
  }
  return result;
}

uint64_t sub_25F73D9A4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25F73DA04()
{
  uint64_t v0 = sub_25F78B020();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25F78AF40();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_25F78AF50();
  MEMORY[0x270FA5388](v6 - 8);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v1, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t result = sub_25F78BFF0();
  qword_26A7BE380 = result;
  *(void *)algn_26A7BE388 = v9;
  return result;
}

uint64_t sub_25F73DC40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v37 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8D8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (int *)type metadata accessor for SelectTextView();
  uint64_t v7 = v1 + v6[7];
  char v8 = *(unsigned char *)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  LOBYTE(v41) = v8;
  uint64_t v42 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BCA0();
  uint64_t v39 = v44;
  uint64_t v40 = v43;
  int v36 = v45;
  uint64_t v10 = v1 + v6[6];
  char v11 = *(unsigned char *)v10;
  uint64_t v12 = *(void *)(v10 + 8);
  LOBYTE(v41) = v11;
  uint64_t v42 = v12;
  sub_25F78BCA0();
  uint64_t v13 = v44;
  uint64_t v38 = v43;
  char v14 = v45;
  uint64_t v15 = (uint64_t *)(v1 + v6[9]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v41 = v16;
  uint64_t v42 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BCA0();
  uint64_t v18 = v43;
  uint64_t v19 = v44;
  uint64_t v20 = v45;
  char v21 = *(unsigned char *)(v2 + v6[5] + 8);
  uint64_t v22 = swift_retain();
  uint64_t v23 = sub_25F76A324(v22, v21);
  swift_release();
  if (qword_26A7BB628 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_26A7BE380;
  uint64_t v24 = *(void *)algn_26A7BE388;
  id v26 = objc_allocWithZone(MEMORY[0x263F82D60]);
  swift_bridgeObjectRetain();
  id v27 = objc_msgSend(v26, sel_init);
  uint64_t v43 = v40;
  uint64_t v44 = v39;
  LOBYTE(v45) = v36;
  uint64_t v46 = v38;
  uint64_t v47 = v13;
  char v48 = v14;
  uint64_t v49 = v18;
  uint64_t v50 = v19;
  uint64_t v51 = v20;
  uint64_t v52 = v23;
  id v53 = v27;
  uint64_t v54 = v25;
  uint64_t v55 = v24;
  uint64_t *v5 = sub_25F78BDE0();
  v5[1] = v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8F0);
  sub_25F73DF58(v2, (uint64_t)&v43, (uint64_t)v5 + *(int *)(v29 + 44));
  if (qword_26A7BB678 != -1) {
    swift_once();
  }
  uint64_t v30 = qword_26A7BE3B8;
  swift_retain();
  char v31 = sub_25F78B8C0();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v32 = v37;
  sub_25F73D580((uint64_t)v5, v37, &qword_26A7BB8D8);
  uint64_t v33 = v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8F8) + 36);
  *(void *)uint64_t v33 = v30;
  *(unsigned char *)(v33 + 8) = v31;
  return sub_25F73D748((uint64_t)v5, &qword_26A7BB8D8);
}

uint64_t sub_25F73DF58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB900);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = &v22[-v11];
  MEMORY[0x270FA5388](v10);
  char v14 = &v22[-v13];
  *(void *)uint64_t v12 = sub_25F78B600();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB908);
  sub_25F73E118(a1, a2, (uint64_t)&v12[*(int *)(v15 + 44)]);
  sub_25F742E20((uint64_t)v12, (uint64_t)v14);
  uint64_t v16 = a1 + *(int *)(type metadata accessor for SelectTextView() + 24);
  char v17 = *(unsigned char *)v16;
  uint64_t v18 = *(void *)(v16 + 8);
  v22[8] = v17;
  uint64_t v23 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  if (v24) {
    float v19 = 0.01;
  }
  else {
    float v19 = 0.0;
  }
  sub_25F73D580((uint64_t)v14, (uint64_t)v9, &qword_26A7BB900);
  sub_25F73D580((uint64_t)v9, a3, &qword_26A7BB900);
  uint64_t v20 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB910) + 48);
  *(float *)uint64_t v20 = v19;
  *(_WORD *)(v20 + 4) = 256;
  sub_25F73D748((uint64_t)v14, &qword_26A7BB900);
  return sub_25F73D748((uint64_t)v9, &qword_26A7BB900);
}

uint64_t sub_25F73E118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v112 = a3;
  uint64_t v5 = type metadata accessor for SelectTextView();
  uint64_t v104 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v117 = v6;
  v118 = &v89[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB918);
  uint64_t v108 = *(void *)(v7 - 8);
  uint64_t v109 = v7;
  MEMORY[0x270FA5388](v7);
  v107 = &v89[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB920);
  uint64_t v113 = *(void *)(v9 - 8);
  uint64_t v114 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v111 = &v89[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v106 = &v89[-v13];
  MEMORY[0x270FA5388](v12);
  v110 = &v89[-v14];
  uint64_t v120 = sub_25F78B540();
  sub_25F73ED9C(a1, (uint64_t)v164);
  *(_OWORD *)((char *)&v166[2] + 7) = v164[2];
  *(_OWORD *)((char *)&v166[1] + 7) = v164[1];
  *(_OWORD *)((char *)&v166[6] + 7) = v164[6];
  *(_OWORD *)((char *)&v166[5] + 7) = v164[5];
  *(_OWORD *)((char *)&v166[7] + 7) = v165[0];
  v166[8] = *(_OWORD *)((char *)v165 + 9);
  *(_OWORD *)((char *)&v166[3] + 7) = v164[3];
  char v167 = 1;
  *(_OWORD *)((char *)&v166[4] + 7) = v164[4];
  *(_OWORD *)((char *)v166 + 7) = v164[0];
  int v119 = 1;
  long long v171 = v166[3];
  long long v170 = v166[2];
  long long v176 = *(_OWORD *)((char *)v165 + 9);
  long long v175 = v166[7];
  long long v174 = v166[6];
  long long v172 = v166[4];
  long long v173 = v166[5];
  long long v169 = v166[1];
  long long v168 = v166[0];
  uint64_t v15 = (uint64_t *)(a1 + *(int *)(v5 + 32));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  v130[0] = v16;
  v130[1] = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC80();
  double v18 = *(double *)v122;
  sub_25F78BDE0();
  sub_25F75136C(0.0, 1, 0.0, 1, v18, 0, 0.0, 1, (uint64_t)v177, 0.0, 1, 0.0, 1);
  uint64_t v105 = v5;
  uint64_t v19 = *(int *)(v5 + 36);
  uint64_t v121 = a1;
  uint64_t v20 = (uint64_t *)(a1 + v19);
  uint64_t v21 = *v20;
  uint64_t v22 = v20[1];
  v130[0] = v21;
  v130[1] = v22;
  sub_25F78BC80();
  sub_25F78BDE0();
  sub_25F78B3C0();
  int v23 = v151;
  uint64_t v101 = v152;
  uint64_t v102 = v150;
  int v100 = v153;
  uint64_t v98 = v156;
  uint64_t v99 = v154;
  int v115 = v157;
  int v116 = v155;
  unsigned __int8 v24 = v159;
  uint64_t v96 = v160;
  uint64_t v97 = v158;
  unsigned __int8 v25 = v161;
  uint64_t v94 = v163;
  uint64_t v95 = v162;
  LOBYTE(a1) = sub_25F78B8F0();
  unsigned __int8 v26 = sub_25F78B910();
  char v27 = sub_25F78B900();
  sub_25F78B900();
  if (sub_25F78B900() != a1) {
    char v27 = sub_25F78B900();
  }
  sub_25F78B900();
  if (sub_25F78B900() != v26) {
    char v27 = sub_25F78B900();
  }
  char v128 = v23;
  char v28 = v100;
  char v127 = v100;
  char v126 = v116;
  char v125 = v115;
  unsigned __int8 v124 = v24;
  unsigned __int8 v123 = v25;
  int v91 = v24;
  int v92 = v25;
  sub_25F78B110();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  char v129 = 0;
  uint64_t v37 = v118;
  sub_25F742E88(v121, (uint64_t)v118);
  uint64_t v38 = *(unsigned __int8 *)(v104 + 80);
  uint64_t v103 = (v38 + 16) & ~v38;
  uint64_t v104 = v103 + v117;
  int v90 = v23;
  uint64_t v93 = v38 | 7;
  unint64_t v39 = (v103 + v117 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v40 = swift_allocObject();
  sub_25F7430FC((uint64_t)v37, v40 + ((v38 + 16) & ~v38));
  unint64_t v41 = v40 + v39;
  long long v42 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v41 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v41 + 80) = v42;
  *(void *)(v41 + 96) = *(void *)(a2 + 96);
  long long v43 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v41 = *(_OWORD *)a2;
  *(_OWORD *)(v41 + 16) = v43;
  long long v44 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v41 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v41 + 48) = v44;
  v122[10] = v177[10];
  v122[11] = v177[11];
  v122[12] = v177[12];
  v122[6] = v177[6];
  v122[7] = v177[7];
  v122[8] = v177[8];
  v122[9] = v177[9];
  v122[2] = v177[2];
  v122[3] = v177[3];
  v122[4] = v177[4];
  v122[5] = v177[5];
  v122[0] = v177[0];
  v122[1] = v177[1];
  *(void *)&v122[13] = v178;
  *((void *)&v122[13] + 1) = v102;
  LOBYTE(v122[14]) = v90;
  *((void *)&v122[14] + 1) = v101;
  LOBYTE(v122[15]) = v28;
  *((void *)&v122[15] + 1) = v99;
  LOBYTE(v122[16]) = v116;
  *((void *)&v122[16] + 1) = v98;
  LOBYTE(v122[17]) = v115;
  *((void *)&v122[17] + 1) = v97;
  LOBYTE(v122[18]) = v91;
  *((void *)&v122[18] + 1) = v96;
  LOBYTE(v122[19]) = v92;
  *((void *)&v122[19] + 1) = v95;
  *(void *)&v122[20] = v94;
  WORD4(v122[20]) = 256;
  LOBYTE(v122[21]) = v27;
  *((void *)&v122[21] + 1) = v30;
  *(void *)&v122[22] = v32;
  *((void *)&v122[22] + 1) = v34;
  *(void *)&v122[23] = v36;
  BYTE8(v122[23]) = v129;
  *(void *)&v122[24] = sub_25F743160;
  *((void *)&v122[24] + 1) = v40;
  v122[25] = 0uLL;
  uint64_t v45 = v105;
  uint64_t v46 = v121;
  LOBYTE(v39) = *(unsigned char *)(v121 + *(int *)(v105 + 20) + 8);
  sub_25F7431EC(a2);
  uint64_t v47 = swift_retain();
  uint64_t v48 = sub_25F76A324(v47, v39);
  swift_release();
  swift_getKeyPath();
  v130[0] = v48;
  sub_25F743C48((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  char v49 = *(unsigned char *)(v48 + 51);
  swift_release();
  LOBYTE(v139[0]) = v49;
  uint64_t v50 = v46;
  uint64_t v51 = v118;
  sub_25F742E88(v50, (uint64_t)v118);
  uint64_t v52 = swift_allocObject();
  long long v53 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v52 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v52 + 96) = v53;
  *(void *)(v52 + 112) = *(void *)(a2 + 96);
  long long v54 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v52 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v52 + 32) = v54;
  long long v55 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v52 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v52 + 64) = v55;
  sub_25F7430FC((uint64_t)v51, v52 + ((v38 + 120) & ~v38));
  sub_25F7431EC(a2);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB930);
  uint64_t v57 = sub_25F743544(&qword_26A7BB938, &qword_26A7BB930, (void (*)(void))sub_25F743514);
  uint64_t v58 = MEMORY[0x263F8D4F8];
  v59 = v107;
  sub_25F78BB80();
  swift_release();
  memcpy(v130, v122, sizeof(v130));
  sub_25F7436A4(v130);
  uint64_t v60 = v121;
  v61 = (char *)(v121 + *(int *)(v45 + 28));
  char v62 = *v61;
  uint64_t v63 = *((void *)v61 + 1);
  LOBYTE(v122[0]) = v62;
  *((void *)&v122[0] + 1) = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  sub_25F742E88(v60, (uint64_t)v51);
  uint64_t v64 = swift_allocObject();
  sub_25F7430FC((uint64_t)v51, v64 + v103);
  *(void *)&v122[0] = v56;
  *((void *)&v122[0] + 1) = v58;
  *(void *)&v122[1] = v57;
  *((void *)&v122[1] + 1) = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  v65 = v106;
  uint64_t v66 = v109;
  sub_25F78BB80();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v108 + 8))(v59, v66);
  uint64_t v68 = v113;
  uint64_t v67 = v114;
  v69 = v110;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v113 + 32))(v110, v65, v114);
  v118 = (unsigned char *)sub_25F78B540();
  sub_25F73FBB0(v60, v131);
  *(_OWORD *)((char *)&v133[5] + 7) = v131[5];
  *(_OWORD *)((char *)&v133[6] + 7) = v131[6];
  *(_OWORD *)((char *)&v133[7] + 7) = v132[0];
  v133[8] = *(_OWORD *)((char *)v132 + 9);
  *(_OWORD *)((char *)&v133[1] + 7) = v131[1];
  *(_OWORD *)((char *)&v133[2] + 7) = v131[2];
  *(_OWORD *)((char *)&v133[3] + 7) = v131[3];
  *(_OWORD *)((char *)&v133[4] + 7) = v131[4];
  char v134 = 1;
  *(_OWORD *)((char *)v133 + 7) = v131[0];
  LODWORD(v121) = 1;
  v70 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v68 + 16);
  v71 = v111;
  v70(v111, v69, v67);
  *(_OWORD *)&v136[33] = v170;
  *(_OWORD *)&v136[17] = v169;
  *(_OWORD *)&v136[81] = v173;
  *(_OWORD *)&v136[97] = v174;
  *(_OWORD *)&v136[113] = v175;
  *(_OWORD *)&v136[129] = v176;
  *(_OWORD *)&v136[49] = v171;
  long long v135 = (unint64_t)v120;
  v136[0] = v119;
  *(_OWORD *)&v136[65] = v172;
  *(_OWORD *)&v136[1] = v168;
  long long v72 = *(_OWORD *)&v136[128];
  uint64_t v73 = v112;
  *(_OWORD *)(v112 + 128) = *(_OWORD *)&v136[112];
  *(_OWORD *)(v73 + 144) = v72;
  *(unsigned char *)(v73 + 160) = v136[144];
  long long v74 = *(_OWORD *)&v136[64];
  *(_OWORD *)(v73 + 64) = *(_OWORD *)&v136[48];
  *(_OWORD *)(v73 + 80) = v74;
  long long v75 = *(_OWORD *)&v136[96];
  *(_OWORD *)(v73 + 96) = *(_OWORD *)&v136[80];
  *(_OWORD *)(v73 + 112) = v75;
  long long v76 = *(_OWORD *)v136;
  *(_OWORD *)uint64_t v73 = v135;
  *(_OWORD *)(v73 + 16) = v76;
  long long v77 = *(_OWORD *)&v136[32];
  *(_OWORD *)(v73 + 32) = *(_OWORD *)&v136[16];
  *(_OWORD *)(v73 + 48) = v77;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB988);
  v70((unsigned char *)(v73 + *(int *)(v78 + 48)), v71, v67);
  uint64_t v79 = *(int *)(v78 + 64);
  *(_OWORD *)&v138[81] = v133[5];
  *(_OWORD *)&v138[97] = v133[6];
  *(_OWORD *)&v138[113] = v133[7];
  *(_OWORD *)&v138[129] = v133[8];
  *(_OWORD *)&v138[33] = v133[2];
  *(_OWORD *)&v138[17] = v133[1];
  *(_OWORD *)&v138[49] = v133[3];
  uint64_t v80 = v73 + v79;
  v81 = v118;
  long long v137 = (unint64_t)v118;
  LOBYTE(v65) = v121;
  v138[0] = v121;
  *(_OWORD *)&v138[65] = v133[4];
  *(_OWORD *)&v138[1] = v133[0];
  long long v82 = *(_OWORD *)&v138[128];
  *(_OWORD *)(v80 + 128) = *(_OWORD *)&v138[112];
  *(_OWORD *)(v80 + 144) = v82;
  *(unsigned char *)(v80 + 160) = v138[144];
  long long v83 = *(_OWORD *)&v138[64];
  *(_OWORD *)(v80 + 64) = *(_OWORD *)&v138[48];
  *(_OWORD *)(v80 + 80) = v83;
  long long v84 = *(_OWORD *)&v138[96];
  *(_OWORD *)(v80 + 96) = *(_OWORD *)&v138[80];
  *(_OWORD *)(v80 + 112) = v84;
  long long v85 = *(_OWORD *)v138;
  *(_OWORD *)uint64_t v80 = v137;
  *(_OWORD *)(v80 + 16) = v85;
  long long v86 = *(_OWORD *)&v138[32];
  *(_OWORD *)(v80 + 32) = *(_OWORD *)&v138[16];
  *(_OWORD *)(v80 + 48) = v86;
  sub_25F7439B4((uint64_t)&v135);
  sub_25F7439FC((uint64_t)&v137);
  v87 = *(void (**)(unsigned char *, uint64_t))(v68 + 8);
  v87(v69, v67);
  long long v146 = v133[5];
  long long v147 = v133[6];
  long long v148 = v133[7];
  long long v149 = v133[8];
  long long v142 = v133[1];
  long long v143 = v133[2];
  long long v144 = v133[3];
  long long v145 = v133[4];
  v139[0] = v81;
  v139[1] = 0;
  char v140 = (char)v65;
  long long v141 = v133[0];
  sub_25F743A38((uint64_t)v139);
  v87(v71, v67);
  *(_OWORD *)((char *)&v122[6] + 1) = v173;
  *(_OWORD *)((char *)&v122[7] + 1) = v174;
  *(_OWORD *)((char *)&v122[8] + 1) = v175;
  *(_OWORD *)((char *)&v122[9] + 1) = v176;
  *(_OWORD *)((char *)&v122[2] + 1) = v169;
  *(_OWORD *)((char *)&v122[3] + 1) = v170;
  *(_OWORD *)((char *)&v122[4] + 1) = v171;
  *(_OWORD *)((char *)&v122[5] + 1) = v172;
  v122[0] = (unint64_t)v120;
  LOBYTE(v122[1]) = v119;
  *(_OWORD *)((char *)&v122[1] + 1) = v168;
  return sub_25F743A80((uint64_t)v122);
}

uint64_t sub_25F73ED9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v83 = a2;
  uint64_t v3 = sub_25F78B730();
  uint64_t v4 = *(void **)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v70 = &v66[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v66[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v66[-v10];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v71 = &v66[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v85 = &v66[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v80 = &v66[-v18];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  long long v72 = &v66[-v20];
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  int v23 = &v66[-v22];
  MEMORY[0x270FA5388](v21);
  unsigned __int8 v25 = &v66[-v24];
  unsigned __int8 v26 = off_26A7BB7D8;
  *(void *)&long long v82 = qword_26A7BB7D0;
  uint64_t KeyPath = swift_getKeyPath();
  *((void *)&v82 + 1) = v26;
  swift_bridgeObjectRetain();
  uint64_t v78 = a1;
  sub_25F76AB88((uint64_t)v25);
  char v27 = (void (*)(void))v4[13];
  unsigned int v77 = *MEMORY[0x263F19F00];
  long long v75 = (void (*)(unsigned char *, void, uint64_t))v27;
  long long v76 = v4 + 13;
  v27(v23);
  uint64_t v73 = (void (*)(unsigned char *, void, uint64_t, uint64_t))v4[7];
  long long v74 = v4 + 7;
  v73(v23, 0, 1, v3);
  uint64_t v79 = v6;
  uint64_t v28 = *(int *)(v6 + 48);
  uint64_t v29 = (uint64_t)v11;
  uint64_t v30 = (uint64_t)&v11[v28];
  sub_25F73D580((uint64_t)v25, (uint64_t)v11, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v23, v30, &qword_26A7BB8A0);
  long long v84 = v4;
  uint64_t v31 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v4[6];
  if (v31(v29, 1, v3) == 1)
  {
    sub_25F73D748((uint64_t)v23, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v25, &qword_26A7BB8A0);
    if (v31(v30, 1, v3) == 1)
    {
      uint64_t v32 = v31;
      sub_25F73D748(v29, &qword_26A7BB8A0);
      uint64_t v33 = (uint64_t)v80;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  sub_25F73D580(v29, (uint64_t)v72, &qword_26A7BB8A0);
  if (v31(v30, 1, v3) == 1)
  {
    sub_25F73D748((uint64_t)v23, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v25, &qword_26A7BB8A0);
    ((void (*)(unsigned char *, uint64_t))v84[1])(v72, v3);
LABEL_6:
    sub_25F73D748(v29, &qword_26A7BB990);
    uint64_t v33 = (uint64_t)v80;
    goto LABEL_9;
  }
  uint64_t v34 = (void (*)(unsigned char *, uint64_t, uint64_t))v84[4];
  uint64_t v68 = v29;
  uint64_t v35 = v70;
  v34(v70, v30, v3);
  sub_25F743C48(&qword_26A7BB998, MEMORY[0x263F19F18]);
  uint64_t v36 = v72;
  int v67 = sub_25F78BF70();
  v69 = v9;
  uint64_t v37 = (void (*)(unsigned char *, uint64_t))v84[1];
  v37(v35, v3);
  sub_25F73D748((uint64_t)v23, &qword_26A7BB8A0);
  sub_25F73D748((uint64_t)v25, &qword_26A7BB8A0);
  v37(v36, v3);
  uint64_t v9 = v69;
  sub_25F73D748(v68, &qword_26A7BB8A0);
  uint64_t v33 = (uint64_t)v80;
  if (v67)
  {
    uint64_t v32 = v31;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v32 = v31;
LABEL_10:
  sub_25F76AB88(v33);
  uint64_t v38 = v85;
  v75(v85, v77, v3);
  v73(v38, 0, 1, v3);
  uint64_t v39 = (uint64_t)&v9[*(int *)(v79 + 48)];
  sub_25F73D580(v33, (uint64_t)v9, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v38, v39, &qword_26A7BB8A0);
  if (v32((uint64_t)v9, 1, v3) != 1)
  {
    uint64_t v40 = v71;
    sub_25F73D580((uint64_t)v9, (uint64_t)v71, &qword_26A7BB8A0);
    if (v32(v39, 1, v3) != 1)
    {
      unint64_t v41 = v84;
      long long v42 = v70;
      ((void (*)(unsigned char *, uint64_t, uint64_t))v84[4])(v70, v39, v3);
      sub_25F743C48(&qword_26A7BB998, MEMORY[0x263F19F18]);
      sub_25F78BF70();
      long long v43 = (void (*)(unsigned char *, uint64_t))v41[1];
      v43(v42, v3);
      sub_25F73D748((uint64_t)v85, &qword_26A7BB8A0);
      sub_25F73D748(v33, &qword_26A7BB8A0);
      v43(v40, v3);
      sub_25F73D748((uint64_t)v9, &qword_26A7BB8A0);
      goto LABEL_17;
    }
    sub_25F73D748((uint64_t)v85, &qword_26A7BB8A0);
    sub_25F73D748(v33, &qword_26A7BB8A0);
    ((void (*)(unsigned char *, uint64_t))v84[1])(v40, v3);
    goto LABEL_15;
  }
  sub_25F73D748((uint64_t)v38, &qword_26A7BB8A0);
  sub_25F73D748(v33, &qword_26A7BB8A0);
  if (v32(v39, 1, v3) != 1)
  {
LABEL_15:
    sub_25F73D748((uint64_t)v9, &qword_26A7BB990);
    goto LABEL_17;
  }
  sub_25F73D748((uint64_t)v9, &qword_26A7BB8A0);
LABEL_17:
  sub_25F78BDF0();
  sub_25F78B220();
  uint64_t v44 = v113;
  char v45 = v114;
  uint64_t v46 = v115;
  char v47 = v116;
  uint64_t v48 = v117;
  uint64_t v49 = v118;
  char v50 = sub_25F78B8F0();
  sub_25F78B110();
  char v89 = 0;
  char v88 = v45;
  char v87 = v47;
  char v86 = 0;
  uint64_t v52 = KeyPath;
  uint64_t v51 = v82;
  *(void *)&v90[0] = KeyPath;
  BYTE8(v90[0]) = 0;
  uint64_t v54 = *((void *)&v82 + 1);
  uint64_t v53 = v83;
  v90[1] = v82;
  *(void *)&long long v91 = v44;
  BYTE8(v91) = v45;
  *(void *)&long long v92 = v46;
  BYTE8(v92) = v47;
  *(void *)&long long v93 = v48;
  *((void *)&v93 + 1) = v49;
  LOBYTE(v94) = v50;
  *((void *)&v94 + 1) = v55;
  *(void *)&v95[0] = v56;
  *((void *)&v95[0] + 1) = v57;
  *(void *)&v95[1] = v58;
  BYTE8(v95[1]) = 0;
  long long v59 = v90[0];
  long long v60 = v82;
  long long v61 = v92;
  *(_OWORD *)(v83 + 32) = v91;
  *(_OWORD *)(v53 + 48) = v61;
  *(_OWORD *)uint64_t v53 = v59;
  *(_OWORD *)(v53 + 16) = v60;
  long long v62 = v93;
  long long v63 = v94;
  long long v64 = v95[0];
  *(_OWORD *)(v53 + 105) = *(_OWORD *)((char *)v95 + 9);
  *(_OWORD *)(v53 + 80) = v63;
  *(_OWORD *)(v53 + 96) = v64;
  *(_OWORD *)(v53 + 64) = v62;
  char v96 = 1;
  *(void *)(v53 + 128) = 0;
  *(unsigned char *)(v53 + 136) = 1;
  uint64_t v97 = v52;
  char v98 = 0;
  uint64_t v99 = v51;
  uint64_t v100 = v54;
  uint64_t v101 = v44;
  char v102 = v45;
  uint64_t v103 = v46;
  char v104 = v47;
  uint64_t v105 = v48;
  uint64_t v106 = v49;
  char v107 = v50;
  uint64_t v108 = v55;
  uint64_t v109 = v56;
  uint64_t v110 = v57;
  uint64_t v111 = v58;
  char v112 = 0;
  sub_25F743AC4((uint64_t)v90);
  return sub_25F743B00((uint64_t)&v97);
}

uint64_t sub_25F73F61C(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = type metadata accessor for SelectTextView();
  char v5 = *(unsigned char *)(a1 + *(int *)(v4 + 20) + 8);
  uint64_t v6 = swift_retain();
  uint64_t v7 = sub_25F76A324(v6, v5);
  swift_release();
  swift_getKeyPath();
  v23[5] = v7;
  char v24 = 1;
  sub_25F743C48((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B030();
  swift_release();
  swift_release();
  uint64_t v8 = swift_retain();
  uint64_t v9 = sub_25F76A324(v8, v5);
  swift_release();
  *(unsigned char *)(v9 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 4;
  swift_release();
  v23[0] = 0;
  v23[1] = 0;
  id v10 = objc_msgSend(*(id *)(a2 + 80), sel_attributedText);
  if (!v10) {
    __break(1u);
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_attributesAtIndex_effectiveRange_, 0, v23);

  type metadata accessor for Key(0);
  sub_25F743C48(&qword_26A7BB6F0, type metadata accessor for Key);
  sub_25F78BF50();

  if (qword_26A7BB628 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_26A7BE380;
  uint64_t v26 = *(void *)algn_26A7BE388;
  sub_25F743B64();
  uint64_t v13 = sub_25F78C2C0();
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    uint64_t v15 = v14 - 1;
    if (v14 == 1)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = v13 + 56;
      do
      {
        swift_bridgeObjectRetain();
        sub_25F78C030();
        sub_25F78C030();
        v17 += 16;
        swift_bridgeObjectRelease();
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)sub_25F78BFA0();
    swift_bridgeObjectRelease();
    uint64_t v19 = (void *)sub_25F78BF40();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_sizeWithAttributes_, v19);

    uint64_t v20 = (uint64_t *)(a1 + *(int *)(v4 + 32));
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v25 = v21;
    uint64_t v26 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
    return sub_25F78BC90();
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void sub_25F73FA3C(uint64_t a1, unsigned char *a2)
{
  if (*a2 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB9A0);
    sub_25F78BCF0();
    type metadata accessor for SelectTextView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
    sub_25F78BC90();
  }
}

void sub_25F73FAE4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (*a2 == 1)
  {
    uint64_t v4 = type metadata accessor for SelectTextView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
    sub_25F78BC90();
    char v5 = *(unsigned char *)(a3 + *(int *)(v4 + 20) + 8);
    uint64_t v6 = swift_retain();
    uint64_t v7 = sub_25F76A324(v6, v5);
    swift_release();
    *(unsigned char *)(v7 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 4;
    swift_release();
  }
}

uint64_t sub_25F73FBB0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v82 = a2;
  uint64_t v3 = sub_25F78B730();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v68 = &v65[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v79 = &v65[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  id v10 = &v65[-v9];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  int v67 = &v65[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unsigned int v77 = &v65[-v15];
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v78 = &v65[-v17];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v83 = (uint64_t)&v65[-v19];
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = &v65[-v21];
  MEMORY[0x270FA5388](v20);
  char v24 = &v65[-v23];
  uint64_t v25 = off_26A7BB7E8;
  *(void *)&long long v81 = qword_26A7BB7E0;
  uint64_t KeyPath = swift_getKeyPath();
  *((void *)&v81 + 1) = v25;
  swift_bridgeObjectRetain();
  uint64_t v76 = a1;
  sub_25F76AB88((uint64_t)v24);
  uint64_t v26 = *(void (**)(void))(v4 + 104);
  unsigned int v73 = *MEMORY[0x263F19F00];
  v71 = (void (*)(uint64_t, void, uint64_t))v26;
  uint64_t v72 = v4 + 104;
  v26(v22);
  v70 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56);
  v70(v22, 0, 1, v3);
  uint64_t v75 = v6;
  uint64_t v27 = (uint64_t)&v10[*(int *)(v6 + 48)];
  sub_25F73D580((uint64_t)v24, (uint64_t)v10, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v22, v27, &qword_26A7BB8A0);
  uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  unsigned int v29 = v28((uint64_t)v10, 1, v3);
  uint64_t v69 = v4;
  long long v74 = v28;
  if (v29 == 1)
  {
    sub_25F73D748((uint64_t)v22, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v24, &qword_26A7BB8A0);
    if (v28(v27, 1, v3) == 1)
    {
      sub_25F73D748((uint64_t)v10, &qword_26A7BB8A0);
      uint64_t v83 = 0x4054000000000000;
      uint64_t v30 = (uint64_t)v78;
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  sub_25F73D580((uint64_t)v10, v83, &qword_26A7BB8A0);
  if (v28(v27, 1, v3) == 1)
  {
    sub_25F73D748((uint64_t)v22, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v24, &qword_26A7BB8A0);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v83, v3);
LABEL_6:
    sub_25F73D748((uint64_t)v10, &qword_26A7BB990);
    uint64_t v30 = (uint64_t)v78;
LABEL_9:
    uint64_t v33 = 0x405E000000000000;
    goto LABEL_10;
  }
  uint64_t v31 = v68;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 32))(v68, v27, v3);
  sub_25F743C48(&qword_26A7BB998, MEMORY[0x263F19F18]);
  int v66 = sub_25F78BF70();
  uint64_t v32 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v32(v31, v3);
  sub_25F73D748((uint64_t)v22, &qword_26A7BB8A0);
  sub_25F73D748((uint64_t)v24, &qword_26A7BB8A0);
  v32((unsigned char *)v83, v3);
  sub_25F73D748((uint64_t)v10, &qword_26A7BB8A0);
  uint64_t v30 = (uint64_t)v78;
  if ((v66 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v33 = 0x4054000000000000;
LABEL_10:
  uint64_t v83 = v33;
LABEL_11:
  uint64_t v34 = (uint64_t)v77;
  sub_25F76AB88(v30);
  v71(v34, v73, v3);
  v70((unsigned char *)v34, 0, 1, v3);
  uint64_t v35 = v79;
  uint64_t v36 = (uint64_t)&v79[*(int *)(v75 + 48)];
  sub_25F73D580(v30, (uint64_t)v79, &qword_26A7BB8A0);
  sub_25F73D580(v34, v36, &qword_26A7BB8A0);
  uint64_t v37 = v74;
  if (v74((uint64_t)v35, 1, v3) != 1)
  {
    uint64_t v38 = v37;
    uint64_t v39 = v67;
    sub_25F73D580((uint64_t)v35, (uint64_t)v67, &qword_26A7BB8A0);
    if (v38(v36, 1, v3) != 1)
    {
      uint64_t v40 = v68;
      uint64_t v41 = v69;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v69 + 32))(v68, v36, v3);
      sub_25F743C48(&qword_26A7BB998, MEMORY[0x263F19F18]);
      LODWORD(v78) = sub_25F78BF70();
      long long v42 = *(void (**)(unsigned char *, uint64_t))(v41 + 8);
      v42(v40, v3);
      sub_25F73D748(v34, &qword_26A7BB8A0);
      sub_25F73D748(v30, &qword_26A7BB8A0);
      v42(v39, v3);
      sub_25F73D748((uint64_t)v35, &qword_26A7BB8A0);
      goto LABEL_18;
    }
    sub_25F73D748(v34, &qword_26A7BB8A0);
    sub_25F73D748(v30, &qword_26A7BB8A0);
    (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v39, v3);
    goto LABEL_16;
  }
  sub_25F73D748(v34, &qword_26A7BB8A0);
  sub_25F73D748(v30, &qword_26A7BB8A0);
  if (v37(v36, 1, v3) != 1)
  {
LABEL_16:
    sub_25F73D748((uint64_t)v35, &qword_26A7BB990);
    goto LABEL_18;
  }
  sub_25F73D748((uint64_t)v35, &qword_26A7BB8A0);
LABEL_18:
  sub_25F78BE00();
  sub_25F78B220();
  uint64_t v43 = v112;
  char v44 = v113;
  uint64_t v45 = v114;
  char v46 = v115;
  uint64_t v47 = v116;
  uint64_t v48 = v117;
  char v49 = sub_25F78B910();
  sub_25F78B110();
  char v87 = 0;
  char v86 = v44;
  char v85 = v46;
  char v84 = 0;
  uint64_t v51 = KeyPath;
  uint64_t v50 = v81;
  *(void *)&v88[0] = KeyPath;
  BYTE8(v88[0]) = 0;
  uint64_t v52 = *((void *)&v81 + 1);
  v88[1] = v81;
  *(void *)&long long v89 = v43;
  BYTE8(v89) = v44;
  *(void *)&long long v90 = v45;
  BYTE8(v90) = v46;
  *(void *)&long long v91 = v47;
  *((void *)&v91 + 1) = v48;
  LOBYTE(v92) = v49;
  *((void *)&v92 + 1) = v53;
  *(void *)&v93[0] = v54;
  *((void *)&v93[0] + 1) = v55;
  *(void *)&v93[1] = v56;
  BYTE8(v93[1]) = 0;
  char v95 = 1;
  *(_OWORD *)((char *)&v94[3] + 7) = v90;
  *(_OWORD *)((char *)&v94[2] + 7) = v89;
  *(_OWORD *)((char *)&v94[1] + 7) = v81;
  *(_OWORD *)((char *)v94 + 7) = v88[0];
  v94[7] = *(_OWORD *)((char *)v93 + 9);
  *(_OWORD *)((char *)&v94[6] + 7) = v93[0];
  *(_OWORD *)((char *)&v94[5] + 7) = v92;
  *(_OWORD *)((char *)&v94[4] + 7) = v91;
  uint64_t v57 = v82;
  *long long v82 = 0;
  *((unsigned char *)v57 + 8) = 1;
  long long v58 = v94[0];
  long long v59 = v94[1];
  long long v60 = v94[2];
  *(_OWORD *)((char *)v57 + 57) = v94[3];
  *(_OWORD *)((char *)v57 + 41) = v60;
  *(_OWORD *)((char *)v57 + 25) = v59;
  *(_OWORD *)((char *)v57 + 9) = v58;
  long long v61 = v94[4];
  long long v62 = v94[5];
  long long v63 = v94[6];
  *(_OWORD *)((char *)v57 + 121) = v94[7];
  *(_OWORD *)((char *)v57 + 105) = v63;
  *(_OWORD *)((char *)v57 + 89) = v62;
  *(_OWORD *)((char *)v57 + 73) = v61;
  uint64_t v96 = v51;
  char v97 = 0;
  uint64_t v98 = v50;
  uint64_t v99 = v52;
  uint64_t v100 = v43;
  char v101 = v44;
  uint64_t v102 = v45;
  char v103 = v46;
  uint64_t v104 = v47;
  uint64_t v105 = v48;
  char v106 = v49;
  uint64_t v107 = v53;
  uint64_t v108 = v54;
  uint64_t v109 = v55;
  uint64_t v110 = v56;
  char v111 = 0;
  sub_25F743AC4((uint64_t)v88);
  return sub_25F743B00((uint64_t)&v96);
}

double sub_25F740470@<D0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (int *)type metadata accessor for SelectTextView();
  uint64_t v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_25F743C48((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  *(void *)uint64_t v3 = sub_25F78B190();
  v3[8] = v4 & 1;
  uint64_t v5 = (char *)a1 + v2[6];
  sub_25F78BC70();
  char *v5 = LOBYTE(v19);
  *((void *)v5 + 1) = v20;
  uint64_t v6 = (char *)a1 + v2[7];
  sub_25F78BC70();
  *uint64_t v6 = LOBYTE(v19);
  *((void *)v6 + 1) = v20;
  uint64_t v7 = (double *)((char *)a1 + v2[8]);
  id v8 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  CGRectGetWidth(v21);
  sub_25F78BC70();
  double *v7 = v19;
  *((void *)v7 + 1) = v20;
  uint64_t v17 = (double *)((char *)a1 + v2[9]);
  sub_25F78BC70();
  double result = v19;
  *uint64_t v17 = v19;
  *((void *)v17 + 1) = v20;
  return result;
}

uint64_t sub_25F740668(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25F78BEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25F78BF00();
  uint64_t v8 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  CGFloat v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = (void *)sub_25F78BFA0();
  objc_msgSend(a1, sel_setText_, v11);

  long long aBlock = *(_OWORD *)v2;
  LOBYTE(v25) = *(unsigned char *)(v2 + 16);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB9A0);
  MEMORY[0x2611FE0A0](&v29, v12);
  if (v29 == 1) {
    objc_msgSend(a1, sel_setSelectedTextRange_, 0);
  }
  sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
  double v13 = (void *)sub_25F78C210();
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v14 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v14 + 96) = v15;
  uint64_t v16 = *(void *)(v2 + 96);
  long long v17 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v14 + 32) = v17;
  long long v18 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v14 + 64) = v18;
  *(void *)(v14 + 112) = v16;
  *(void *)(v14 + 120) = a1;
  uint64_t v27 = sub_25F744B34;
  uint64_t v28 = v14;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v25 = sub_25F770630;
  uint64_t v26 = &block_descriptor_67;
  double v19 = _Block_copy(&aBlock);
  sub_25F7431EC(v2);
  id v20 = a1;
  swift_release();
  sub_25F78BEE0();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_25F743C48((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  sub_25F78C2E0();
  MEMORY[0x2611FE5E0](0, v10, v7, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v23);
}

uint64_t sub_25F7409DC(int a1, id a2)
{
  objc_msgSend(a2, sel_bounds);
  objc_msgSend(a2, sel_sizeThatFits_, CGRectGetWidth(v4), INFINITY);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBA08);
  return sub_25F78BCF0();
}

id sub_25F740A64()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void **)(v0 + 80);
  long long v17 = *(_OWORD *)(v0 + 88);
  v12[1] = *(objc_super *)(v0 + 24);
  char v13 = *(unsigned char *)(v0 + 40);
  swift_retain();
  id v3 = v2;
  sub_25F744A88((uint64_t)&v17);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB9A0);
  sub_25F78BD00();
  uint64_t v4 = v14;
  uint64_t v5 = v15;
  char v6 = v16;
  uint64_t v7 = (objc_class *)type metadata accessor for UITextViewRepresentable.Coordinator();
  uint64_t v8 = objc_allocWithZone(v7);
  v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected] = 0;
  v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete] = 0;
  *(void *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength] = 0;
  uint64_t v9 = &v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange];
  *uint64_t v9 = 0;
  v9[1] = 0;
  *(_OWORD *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_text] = v17;
  CGFloat v10 = &v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator__disableInteraction];
  *(void *)CGFloat v10 = v4;
  *((void *)v10 + 1) = v5;
  v10[16] = v6;
  *(void *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_textView] = v3;
  *(void *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager] = v1;
  v12[0].receiver = v8;
  v12[0].super_class = v7;
  return [(objc_super *)v12 init];
}

void sub_25F740B7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1 + 16;
  swift_beginAccess();
  CGFloat v10 = (unsigned char *)MEMORY[0x2611FEE90](a1 + 16);
  if (v10)
  {
    char v11 = v10[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected];

    if ((v11 & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v12 = MEMORY[0x2611FEE90](v9);
      if (v12)
      {
        char v13 = (void *)v12;
        swift_retain();

        sub_25F78BF80();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
        sub_25F763E6C((uint64_t)v8, 1, (uint64_t)v4);
        swift_release();
        sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
      swift_beginAccess();
      uint64_t v14 = MEMORY[0x2611FEE90](v9);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = *(void *)(v14 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager);
        swift_retain();

        uint64_t v17 = *(void *)(v16 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
        BOOL v18 = __OFADD__(v17, 1);
        uint64_t v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
        }
        else
        {
          *(void *)(v16 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v19;
          swift_release();
        }
      }
    }
  }
}

id sub_25F740EE0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25F78BEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v49 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78BF00();
  uint64_t v50 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v47 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_25F78BF20();
  uint64_t v48 = *(void *)(v51 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v51);
  char v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v13 = (char *)&v44 - v12;
  id result = objc_msgSend(a1, sel_selectedRange);
  uint64_t v16 = v15;
  uint64_t v17 = OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete;
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete) == 1)
  {
    uint64_t v46 = v7;
    uint64_t v44 = v4;
    uint64_t v18 = *(void *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager)
        + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(unsigned char *)(v18 + 93) = 5;
    uint64_t v19 = OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength;
    uint64_t v20 = *(void *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength);
    uint64_t v21 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_12:
      __break(1u);
      return result;
    }
    uint64_t v45 = v5;
    v58.location = (NSUInteger)objc_msgSend(a1, sel_selectedRange);
    uint64_t v22 = (void *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange);
    NSRange v23 = NSIntersectionRange(v58, *(NSRange *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange));
    id result = (id)v23.location;
    if (v21 < v16 && (uint64_t)v23.length >= 1)
    {
      uint64_t v24 = *(void *)(v18 + 64);
      BOOL v25 = __OFADD__(v24, 1);
      uint64_t v26 = v24 + 1;
      if (!v25)
      {
        *(void *)(v18 + 64) = v26;
        sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
        uint64_t v27 = (void *)sub_25F78C210();
        sub_25F78BF10();
        MEMORY[0x2611FE2F0](v11, 1.0);
        uint64_t v48 = *(void *)(v48 + 8);
        ((void (*)(char *, uint64_t))v48)(v11, v51);
        uint64_t v28 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v56 = sub_25F743C90;
        uint64_t v57 = v28;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v53 = 1107296256;
        uint64_t v54 = sub_25F770630;
        uint64_t v55 = &block_descriptor_48;
        uint64_t v29 = _Block_copy(&aBlock);
        swift_release();
        uint64_t v30 = v47;
        sub_25F78BEE0();
        uint64_t aBlock = MEMORY[0x263F8EE78];
        sub_25F743C48((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
        sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
        uint64_t v31 = v49;
        uint64_t v32 = v44;
        sub_25F78C2E0();
        MEMORY[0x2611FE5B0](v13, v30, v31, v29);
        _Block_release(v29);

        (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v32);
        (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v46);
        return (id)((uint64_t (*)(char *, uint64_t))v48)(v13, v51);
      }
      goto LABEL_12;
    }
    *(void *)(v2 + v19) = v16;
    id result = objc_msgSend(a1, sel_selectedRange, v44);
    *uint64_t v22 = result;
    v22[1] = v43;
  }
  else if (v15 >= 1)
  {
    uint64_t v46 = v7;
    uint64_t v33 = *(void *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager);
    uint64_t v45 = v5;
    uint64_t v34 = v33 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(void *)(v34 + 48) = 0;
    *(void *)(v34 + 56) = 0;
    swift_bridgeObjectRelease();
    sub_25F7657C8();
    *(void *)(v34 + 48) = 0;
    *(void *)(v34 + 56) = 0;
    swift_bridgeObjectRelease();
    *(unsigned char *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected) = 1;
    *(unsigned char *)(v2 + v17) = 1;
    *(void *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength) = v16;
    id v35 = objc_msgSend(a1, sel_selectedRange);
    uint64_t v36 = (void *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange);
    *uint64_t v36 = v35;
    v36[1] = v37;
    sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
    uint64_t v38 = (void *)sub_25F78C210();
    sub_25F78BF10();
    MEMORY[0x2611FE2F0](v11, 0.25);
    uint64_t v48 = *(void *)(v48 + 8);
    ((void (*)(char *, uint64_t))v48)(v11, v51);
    uint64_t v39 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v56 = sub_25F743C28;
    uint64_t v57 = v39;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v53 = 1107296256;
    uint64_t v54 = sub_25F770630;
    uint64_t v55 = &block_descriptor_0;
    uint64_t v40 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v41 = v47;
    sub_25F78BEE0();
    uint64_t aBlock = MEMORY[0x263F8EE78];
    sub_25F743C48((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
    sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
    long long v42 = v49;
    sub_25F78C2E0();
    MEMORY[0x2611FE5B0](v13, v41, v42, v40);
    _Block_release(v40);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v4);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v41, v46);
    return (id)((uint64_t (*)(char *, uint64_t))v48)(v13, v51);
  }
  return result;
}

void sub_25F74162C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2611FEE90](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    swift_retain();

    sub_25F763334(1, 1, 0);
    swift_release();
  }
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611FEE90](v1);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    swift_retain();

    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_25F743C48((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
    sub_25F78B030();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x2611FEE90](v1);
  if (v7)
  {
    uint64_t v8 = (unsigned char *)v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB9A0);
    sub_25F78BCF0();
    v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected] = 0;
    v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete] = 0;
    *(void *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength] = 0;
    uint64_t v9 = &v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange];
    *uint64_t v9 = 0;
    v9[1] = 0;
  }
}

uint64_t sub_25F74185C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611FEE90](a1 + 16);
  if (result)
  {
    uint64_t v10 = (void *)result;
    swift_retain();

    sub_25F78BF80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    sub_25F763E6C((uint64_t)v8, 0, (uint64_t)v4);
    swift_release();
    sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

id sub_25F741AB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UITextViewRepresentable.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UITextViewRepresentable.Coordinator()
{
  return self;
}

uint64_t *sub_25F741B88(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    char v13 = (char *)v4 + v11;
    uint64_t v14 = (char *)a2 + v11;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v14) = v14[8];
    *(void *)char v13 = v15;
    v13[8] = (char)v14;
    uint64_t v16 = (char *)v4 + v12;
    uint64_t v17 = (char *)a2 + v12;
    char *v16 = *v17;
    *((void *)v16 + 1) = *((void *)v17 + 1);
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)v4 + v18;
    uint64_t v21 = (char *)a2 + v18;
    *uint64_t v20 = *v21;
    *((void *)v20 + 1) = *((void *)v21 + 1);
    uint64_t v22 = (uint64_t *)((char *)v4 + v19);
    NSRange v23 = (uint64_t *)((char *)a2 + v19);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[9];
    uint64_t v26 = (uint64_t *)((char *)v4 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_25F741DD8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25F78B730();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_25F741F10(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v9;
  uint64_t v12 = (char *)a2 + v9;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  uint64_t v14 = (char *)a1 + v10;
  uint64_t v15 = (char *)a2 + v10;
  *uint64_t v14 = *v15;
  *((void *)v14 + 1) = *((void *)v15 + 1);
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *uint64_t v18 = *v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  uint64_t v20 = (void *)((char *)a1 + v17);
  uint64_t v21 = (void *)((char *)a2 + v17);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[9];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_25F742114(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *uint64_t v14 = *v15;
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *uint64_t v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_retain();
  swift_release();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_25F742374(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  uint64_t v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  return a1;
}

char *sub_25F74252C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  char *v15 = *v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *uint64_t v18 = *v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  uint64_t v23 = a3[9];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_release();
  return a1;
}

uint64_t sub_25F74276C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F742780);
}

uint64_t sub_25F742780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_25F742854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F742868);
}

uint64_t sub_25F742868(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for SelectTextView()
{
  uint64_t result = qword_26A7BB8B8;
  if (!qword_26A7BB8B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F742978()
{
  sub_25F742A1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25F742A1C()
{
  if (!qword_26A7BB8C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BB8A0);
    unint64_t v0 = sub_25F78B180();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7BB8C8);
    }
  }
}

uint64_t sub_25F742A78()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_25F742A94()
{
  unint64_t v0 = sub_25F743CC0();
  return v0;
}

uint64_t sub_25F742AF4(void *a1)
{
  return sub_25F740668(a1);
}

id sub_25F742B48@<X0>(void *a1@<X8>)
{
  id result = sub_25F740A64();
  *a1 = result;
  return result;
}

uint64_t sub_25F742B74()
{
  return sub_25F78B660();
}

uint64_t sub_25F742BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25F744A34();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_25F742C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25F744A34();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_25F742C80()
{
}

uint64_t sub_25F742CA8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F743C48((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 52);
  return result;
}

uint64_t sub_25F742D50()
{
  return swift_release();
}

uint64_t sub_25F742E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F742E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SelectTextView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F742EEC()
{
  uint64_t v1 = *(void *)(type metadata accessor for SelectTextView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v7 + 104, v2 | 7);
}

uint64_t sub_25F7430FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SelectTextView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F743160()
{
  uint64_t v1 = *(void *)(type metadata accessor for SelectTextView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_25F73F61C(v0 + v2, v3);
}

uint64_t sub_25F7431EC(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_25F743290()
{
  uint64_t v1 = *(void *)(type metadata accessor for SelectTextView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 120) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_25F743490(uint64_t a1, unsigned char *a2)
{
  type metadata accessor for SelectTextView();
  sub_25F73FA3C(a1, a2);
}

uint64_t sub_25F743514()
{
  return sub_25F743544(&qword_26A7BB940, &qword_26A7BB948, (void (*)(void))sub_25F7435C0);
}

uint64_t sub_25F743544(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_25F7435C0()
{
  return sub_25F743544(&qword_26A7BB950, &qword_26A7BB958, (void (*)(void))sub_25F7435F0);
}

uint64_t sub_25F7435F0()
{
  return sub_25F743544(&qword_26A7BB960, &qword_26A7BB968, (void (*)(void))sub_25F743620);
}

uint64_t sub_25F743620()
{
  return sub_25F743544(&qword_26A7BB970, &qword_26A7BB978, (void (*)(void))sub_25F743650);
}

unint64_t sub_25F743650()
{
  unint64_t result = qword_26A7BB980;
  if (!qword_26A7BB980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB980);
  }
  return result;
}

void *sub_25F7436A4(void *a1)
{
  uint64_t v2 = (void *)a1[10];
  uint64_t v3 = a1[48];
  uint64_t v5 = a1[50];
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_25F74376C(v3);
  sub_25F74376C(v5);
  return a1;
}

uint64_t sub_25F74376C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25F74377C()
{
  uint64_t v1 = *(void *)(type metadata accessor for SelectTextView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_25F743934(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for SelectTextView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  sub_25F73FAE4(a1, a2, v6);
}

uint64_t sub_25F7439B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F7439F0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25F7439FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F743A38(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F743A74(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25F743A80(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F743AC4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F743B00(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F743B44()
{
  return sub_25F762A1C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_25F743B64()
{
  unint64_t result = qword_26A7BB9B0;
  if (!qword_26A7BB9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB9B0);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25F743BF0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F743C28()
{
  return sub_25F74185C(v0);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_25F743C48(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_25F743C90()
{
  sub_25F74162C(v0);
}

uint64_t sub_25F743CA0()
{
  return sub_25F76292C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void *sub_25F743CC0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBA10);
  sub_25F78B7D0();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v31, sel_handleTapWithSender_);

  id v3 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x263F83570]);
  id v4 = objc_msgSend(v3, sel_fontDescriptorWithDesign_, *MEMORY[0x263F81790]);

  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_fontDescriptorWithSize_, 54.0);

    if (v5)
    {
      id v6 = objc_msgSend(self, sel_fontWithDescriptor_size_, v5, 54.0);
      id v30 = v2;
      id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
      objc_msgSend(v7, sel_setLineSpacing_, -5.4);
      objc_msgSend(v7, sel_setAlignment_, 1);
      LODWORD(v8) = 1045220557;
      objc_msgSend(v7, sel_setHyphenationFactor_, v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBA20);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25F78CCA0;
      unint64_t v10 = (void *)*MEMORY[0x263F814F0];
      *(void *)(inited + 32) = *MEMORY[0x263F814F0];
      uint64_t v11 = sub_25F73D7A4(0, &qword_26A7BBA28);
      *(void *)(inited + 40) = v6;
      uint64_t v12 = (void *)*MEMORY[0x263F81540];
      *(void *)(inited + 64) = v11;
      *(void *)(inited + 72) = v12;
      uint64_t v13 = sub_25F73D7A4(0, (unint64_t *)&unk_26A7BBA30);
      *(void *)(inited + 80) = v7;
      uint64_t v14 = (void *)*MEMORY[0x263F81510];
      *(void *)(inited + 104) = v13;
      *(void *)(inited + 112) = v14;
      *(void *)(inited + 144) = MEMORY[0x263F8D538];
      *(void *)(inited + 120) = 0xBFF0000000000000;
      id v15 = v10;
      id v16 = v6;
      id v17 = v12;
      id v18 = v7;
      id v19 = v14;
      sub_25F757258(inited);
      id v20 = objc_allocWithZone(MEMORY[0x263F089B8]);
      swift_bridgeObjectRetain();
      uint64_t v21 = (void *)sub_25F78BFA0();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_25F743C48(&qword_26A7BB6F0, type metadata accessor for Key);
      uint64_t v22 = (void *)sub_25F78BF40();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v20, sel_initWithString_attributes_, v21, v22);

      objc_msgSend(*(id *)(v1 + 80), sel_setAttributedText_, v23);
      id v2 = v30;
    }
  }
  uint64_t v24 = *(void **)(v1 + 80);
  objc_msgSend(v24, sel_addGestureRecognizer_, v2);
  id v25 = objc_msgSend(v24, sel_textContainer);
  objc_msgSend(v25, sel_setLineBreakMode_, 0);

  LODWORD(v26) = 1132068864;
  objc_msgSend(v24, sel_setContentCompressionResistancePriority_forAxis_, 0, v26);
  sub_25F73D7A4(0, &qword_26A7BBA18);
  if (qword_26A7BB680 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v27 = (void *)sub_25F78C270();
  objc_msgSend(v24, sel_setTextColor_, v27);

  id v28 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v28);

  sub_25F78B7D0();
  objc_msgSend(v24, sel_setDelegate_, v31);

  objc_msgSend(v24, sel_setScrollEnabled_, 0);
  objc_msgSend(v24, sel_setEditable_, 0);

  return v24;
}

uint64_t sub_25F74419C()
{
  uint64_t v0 = sub_25F78BEC0();
  uint64_t v22 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25F78BF00();
  uint64_t v20 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25F78BF20();
  uint64_t v19 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
  uint64_t v13 = (void *)sub_25F78C210();
  sub_25F78BF10();
  MEMORY[0x2611FE2F0](v10, 0.25);
  id v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  v18(v10, v6);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_25F744564;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F770630;
  aBlock[3] = &block_descriptor_56;
  id v15 = _Block_copy(aBlock);
  swift_release();
  sub_25F78BEE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25F743C48((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  sub_25F78C2E0();
  MEMORY[0x2611FE5B0](v12, v5, v2, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v21);
  return ((uint64_t (*)(char *, uint64_t))v18)(v12, v19);
}

void sub_25F744564()
{
  sub_25F740B7C(v0);
}

uint64_t destroy for UITextViewRepresentable(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UITextViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v8 = *(void **)(a2 + 80);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v9 = v8;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UITextViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a2 + 80);
  uint64_t v5 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v4;
  id v6 = v4;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for UITextViewRepresentable(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);

  uint64_t v5 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UITextViewRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UITextViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UITextViewRepresentable()
{
  return &type metadata for UITextViewRepresentable;
}

unint64_t sub_25F744960()
{
  unint64_t result = qword_26A7BB9E0;
  if (!qword_26A7BB9E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BB8F8);
    sub_25F73D9A4(&qword_26A7BB9E8, &qword_26A7BB8D8);
    sub_25F73D9A4(&qword_26A7BB9F0, &qword_26A7BB9F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB9E0);
  }
  return result;
}

uint64_t sub_25F744A28()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_25F744A34()
{
  unint64_t result = qword_26A7BBA00;
  if (!qword_26A7BBA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBA00);
  }
  return result;
}

uint64_t sub_25F744A88(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F744AB4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_25F744B34()
{
  return sub_25F7409DC((int)v0 + 16, *(id *)(v0 + 120));
}

uint64_t sub_25F744B5C()
{
  return sub_25F743B44();
}

uint64_t *sub_25F744B74(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25F78BF90();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *id v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25F744C4C(uint64_t a1)
{
  uint64_t v2 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F744CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25F744D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25F744DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25F744E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25F744EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F744F04);
}

uint64_t sub_25F744F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F78BF90();
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

uint64_t sub_25F744FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F744FDC);
}

uint64_t sub_25F744FDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25F78BF90();
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

uint64_t type metadata accessor for LocationItemView()
{
  uint64_t result = qword_26A7BBB00;
  if (!qword_26A7BBB00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25F7450E8()
{
  uint64_t result = sub_25F78BF90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25F74517C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F745198@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v50 = a1;
  uint64_t v48 = sub_25F78B390();
  MEMORY[0x270FA5388](v48);
  char v49 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB10);
  MEMORY[0x270FA5388](v46);
  uint64_t v47 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78B5C0();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_25F78BC30();
  uint64_t v8 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  unint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB18);
  uint64_t v11 = MEMORY[0x270FA5388](v43);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v41 - v14;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB20);
  MEMORY[0x270FA5388](v42);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25F78B600();
  sub_25F745794(v2, v57);
  v58[288] = 1;
  memcpy(&v58[7], v57, 0x119uLL);
  uint64_t v53 = v18;
  uint64_t v54 = 0;
  char v55 = 1;
  memcpy(v56, v58, sizeof(v56));
  sub_25F78BDE0();
  sub_25F751540(0.0, 0, 0.0, 1, 353.0, 0, 0.0, 1, (uint64_t)v52, 0.0, 1, 110.0, 0);
  sub_25F745FE8((uint64_t)v57);
  memcpy(v59, v52, 0x1A8uLL);
  type metadata accessor for LocationItemView();
  uint64_t v19 = qword_26A7BB688;
  swift_bridgeObjectRetain();
  if (v19 != -1) {
    swift_once();
  }
  id v20 = (id)qword_26A7BC948;
  sub_25F78BC60();
  uint64_t v21 = v41;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B4B8], v41);
  uint64_t v22 = sub_25F78BC50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  uint64_t v51 = v22;
  sub_25F78B5B0();
  sub_25F78BB50();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v45);
  swift_release();
  sub_25F78B310();
  sub_25F73D748((uint64_t)v13, &qword_26A7BBB18);
  uint64_t v23 = sub_25F78BDE0();
  uint64_t v25 = v24;
  uint64_t v26 = v47;
  sub_25F73D580((uint64_t)v15, v47, &qword_26A7BBB18);
  uint64_t v27 = (uint64_t *)(v26 + *(int *)(v46 + 36));
  *uint64_t v27 = v23;
  v27[1] = v25;
  sub_25F73D580(v26, (uint64_t)&v17[*(int *)(v42 + 36)], &qword_26A7BBB10);
  memcpy(v17, v59, 0x1A8uLL);
  sub_25F745E1C((uint64_t)v59);
  sub_25F73D748(v26, &qword_26A7BBB10);
  sub_25F73D748((uint64_t)v15, &qword_26A7BBB18);
  sub_25F745E80((uint64_t)v59);
  id v28 = v49;
  uint64_t v29 = &v49[*(int *)(v48 + 20)];
  uint64_t v30 = *MEMORY[0x263F19860];
  uint64_t v31 = sub_25F78B5A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v29, v30, v31);
  __asm { FMOV            V0.2D, #16.0 }
  *id v28 = _Q0;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB28);
  uint64_t v38 = v50;
  uint64_t v39 = v50 + *(int *)(v37 + 36);
  sub_25F745ED4((uint64_t)v28, v39);
  *(_WORD *)(v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB30) + 36)) = 256;
  sub_25F73D580((uint64_t)v17, v38, &qword_26A7BBB20);
  sub_25F745F38((uint64_t)v28);
  return sub_25F73D748((uint64_t)v17, &qword_26A7BBB20);
}

uint64_t sub_25F745794@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *(void *)&long long v58 = a1;
  long long v59 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB38);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78B020();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_25F78AF40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25F78BF90();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25F78AF50();
  MEMORY[0x270FA5388](v14 - 8);
  (*(void (**)(char *, void, uint64_t))(v11 + 16))(v13, v58, v10);
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v6, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v16 = sub_25F78BA10();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t v21 = sub_25F78B940();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  sub_25F78B970();
  sub_25F73D748((uint64_t)v4, &qword_26A7BBB38);
  sub_25F78B950();
  sub_25F78B980();
  swift_release();
  uint64_t v22 = sub_25F78BA00();
  uint64_t v24 = v23;
  char v26 = v25;
  swift_release();
  char v27 = v26 & 1;
  sub_25F745E0C(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_25F78BBD0();
  uint64_t v28 = sub_25F78B9F0();
  uint64_t v30 = v29;
  char v32 = v31;
  uint64_t v34 = v33;
  swift_release();
  sub_25F745E0C(v22, v24, v27);
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_25F78BDB0();
  sub_25F751704(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v76, 0.0, 1, 40.0, 0, v35, v36, v28, v30, v32 & 1, v34);
  sub_25F745E0C(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  long long v66 = v82;
  long long v67 = v83;
  long long v68 = v84;
  long long v62 = v78;
  long long v63 = v79;
  long long v64 = v80;
  long long v65 = v81;
  long long v60 = v76;
  long long v61 = v77;
  sub_25F78BBB0();
  uint64_t v37 = sub_25F78BBE0();
  swift_release();
  char v38 = sub_25F78B8D0();
  sub_25F78B110();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  char v69 = 0;
  LOBYTE(v28) = sub_25F78B8B0();
  sub_25F78B110();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  *(_DWORD *)long long v89 = *(_DWORD *)v70;
  char v55 = v69;
  char v71 = 0;
  *(_DWORD *)char v95 = *(_DWORD *)v73;
  *(_DWORD *)&v89[3] = *(_DWORD *)&v70[3];
  *(_DWORD *)&v95[3] = *(_DWORD *)&v73[3];
  *(_DWORD *)&v97[3] = *(_DWORD *)&v72[3];
  *(_DWORD *)char v97 = *(_DWORD *)v72;
  v74[2] = v62;
  v74[3] = v63;
  v74[0] = v60;
  v74[1] = v61;
  v74[7] = v67;
  v74[8] = v68;
  v74[5] = v65;
  v74[6] = v66;
  v74[4] = v64;
  long long v58 = xmmword_25F78D1E0;
  *(_OWORD *)((char *)&v74[9] + 8) = xmmword_25F78D1E0;
  *(void *)&v74[9] = v37;
  *((void *)&v74[10] + 1) = 0x4000000000000000;
  LOBYTE(v74[11]) = v38;
  *(_DWORD *)((char *)&v74[11] + 1) = *(_DWORD *)v70;
  DWORD1(v74[11]) = *(_DWORD *)&v70[3];
  *((void *)&v74[11] + 1) = v40;
  *(void *)&v74[12] = v42;
  *((void *)&v74[12] + 1) = v44;
  *(void *)&v74[13] = v46;
  BYTE8(v74[13]) = v69;
  *(_DWORD *)((char *)&v74[13] + 9) = *(_DWORD *)v73;
  HIDWORD(v74[13]) = *(_DWORD *)&v73[3];
  LOBYTE(v74[14]) = v28;
  DWORD1(v74[14]) = *(_DWORD *)&v72[3];
  *(_DWORD *)((char *)&v74[14] + 1) = *(_DWORD *)v72;
  *((void *)&v74[14] + 1) = v47;
  *(void *)&v74[15] = v49;
  *((void *)&v74[15] + 1) = v51;
  *(void *)&v74[16] = v53;
  BYTE8(v74[16]) = 0;
  uint64_t v56 = v59;
  memcpy(v59, v74, 0x109uLL);
  char v75 = 1;
  v56[34] = 0;
  *((unsigned char *)v56 + 280) = 1;
  long long v82 = v66;
  long long v83 = v67;
  long long v84 = v68;
  long long v78 = v62;
  long long v79 = v63;
  long long v80 = v64;
  long long v81 = v65;
  long long v76 = v60;
  long long v77 = v61;
  long long v86 = v58;
  uint64_t v85 = v37;
  uint64_t v87 = 0x4000000000000000;
  char v88 = v38;
  uint64_t v90 = v40;
  uint64_t v91 = v42;
  uint64_t v92 = v44;
  uint64_t v93 = v46;
  char v94 = v55;
  char v96 = v28;
  uint64_t v98 = v48;
  uint64_t v99 = v50;
  uint64_t v100 = v52;
  uint64_t v101 = v54;
  char v102 = 0;
  sub_25F745F94((uint64_t)v74);
  return sub_25F745FE8((uint64_t)&v76);
}

uint64_t sub_25F745E0C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25F745E1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F745E70(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25F745E80(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F745ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F78B390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F745F38(uint64_t a1)
{
  uint64_t v2 = sub_25F78B390();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F745F94(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F745FE8(uint64_t a1)
{
  return a1;
}

unint64_t sub_25F746040()
{
  unint64_t result = qword_26A7BBB40;
  if (!qword_26A7BBB40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBB28);
    sub_25F7460E0();
    sub_25F73D9A4(&qword_26A7BBB78, &qword_26A7BBB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBB40);
  }
  return result;
}

unint64_t sub_25F7460E0()
{
  unint64_t result = qword_26A7BBB48;
  if (!qword_26A7BBB48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBB20);
    sub_25F746180();
    sub_25F73D9A4(&qword_26A7BBB70, &qword_26A7BBB10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBB48);
  }
  return result;
}

unint64_t sub_25F746180()
{
  unint64_t result = qword_26A7BBB50;
  if (!qword_26A7BBB50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBB58);
    sub_25F73D9A4(&qword_26A7BBB60, &qword_26A7BBB68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBB50);
  }
  return result;
}

uint64_t *sub_25F746220(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)v4 + v11;
    uint64_t v14 = (char *)a2 + v11;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v14) = v14[8];
    *(void *)uint64_t v13 = v15;
    v13[8] = (char)v14;
    uint64_t v16 = (uint64_t *)((char *)v4 + v12);
    uint64_t v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    uint64_t v21 = (uint64_t *)((char *)v4 + v19);
    uint64_t v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = (char *)v4 + v20;
    char v25 = (char *)a2 + v20;
    *uint64_t v24 = *v25;
    *((void *)v24 + 1) = *((void *)v25 + 1);
    uint64_t v26 = a3[9];
    uint64_t v27 = a3[10];
    uint64_t v28 = (uint64_t *)((char *)v4 + v26);
    uint64_t v29 = (uint64_t *)((char *)a2 + v26);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    char v31 = (uint64_t *)((char *)v4 + v27);
    char v32 = (uint64_t *)((char *)a2 + v27);
    uint64_t v33 = v32[1];
    *char v31 = *v32;
    v31[1] = v33;
    uint64_t v34 = a3[11];
    uint64_t v35 = a3[12];
    uint64_t v36 = (char *)v4 + v34;
    uint64_t v37 = (char *)a2 + v34;
    *uint64_t v36 = *v37;
    *((void *)v36 + 1) = *((void *)v37 + 1);
    char v38 = (uint64_t *)((char *)v4 + v35);
    uint64_t v39 = (uint64_t *)((char *)a2 + v35);
    uint64_t v40 = v39[1];
    *char v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = a3[14];
    *(uint64_t *)((char *)v4 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)v4 + v41) = *(uint64_t *)((char *)a2 + v41);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_25F7464E0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25F78B730();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_25F746648(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v9;
  uint64_t v12 = (char *)a2 + v9;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  uint64_t v14 = (void *)((char *)a1 + v10);
  uint64_t v15 = (void *)((char *)a2 + v10);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (char *)a1 + v18;
  uint64_t v23 = (char *)a2 + v18;
  *uint64_t v22 = *v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  uint64_t v24 = a3[9];
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v24);
  uint64_t v27 = (void *)((char *)a2 + v24);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = (void *)((char *)a1 + v25);
  uint64_t v30 = (void *)((char *)a2 + v25);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a3[11];
  uint64_t v33 = a3[12];
  uint64_t v34 = (char *)a1 + v32;
  uint64_t v35 = (char *)a2 + v32;
  *uint64_t v34 = *v35;
  *((void *)v34 + 1) = *((void *)v35 + 1);
  uint64_t v36 = (void *)((char *)a1 + v33);
  uint64_t v37 = (void *)((char *)a2 + v33);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *(void *)((char *)a1 + v39) = *(void *)((char *)a2 + v39);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_25F7468BC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *uint64_t v20 = *v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_retain();
  swift_release();
  uint64_t v28 = a3[11];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  *uint64_t v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  return a1;
}

char *sub_25F746BB8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  uint64_t v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  uint64_t v15 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v15] = *(_OWORD *)&a2[v15];
  uint64_t v16 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  uint64_t v17 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  return a1;
}

char *sub_25F746DA0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;
  swift_release();
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v23 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = v23;
  *((void *)v20 + 1) = v22;
  swift_release();
  uint64_t v24 = a3[8];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *uint64_t v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_release();
  uint64_t v27 = a3[9];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *(void *)uint64_t v28 = *(void *)v29;
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_release();
  uint64_t v30 = a3[10];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  *(void *)uint64_t v31 = *(void *)v32;
  *((void *)v31 + 1) = *((void *)v32 + 1);
  swift_release();
  uint64_t v33 = a3[11];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  *uint64_t v34 = *v35;
  *((void *)v34 + 1) = *((void *)v35 + 1);
  swift_release();
  uint64_t v36 = a3[12];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  *(void *)uint64_t v37 = *(void *)v38;
  *((void *)v37 + 1) = *((void *)v38 + 1);
  swift_release();
  uint64_t v39 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(void *)&a1[v39] = *(void *)&a2[v39];
  return a1;
}

uint64_t sub_25F747050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F747064);
}

uint64_t sub_25F747064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_25F747138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F74714C);
}

uint64_t sub_25F74714C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for TapView()
{
  uint64_t result = qword_26A7BBB80;
  if (!qword_26A7BBB80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F74725C()
{
  sub_25F742A1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25F747318()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F747334(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TapView();
  char v8 = *(unsigned char *)(v1 + *(int *)(v7 + 20) + 8);
  uint64_t v9 = swift_retain();
  uint64_t v10 = sub_25F76A324(v9, v8);
  swift_release();
  swift_getKeyPath();
  uint64_t v24 = v10;
  sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  char v11 = *(unsigned char *)(v10 + 48);
  uint64_t result = swift_release();
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = (uint64_t *)(v2 + *(int *)(v7 + 24));
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    uint64_t v24 = *v13;
    uint64_t v25 = v14;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
    uint64_t result = sub_25F78BC80();
    if (__OFADD__(v26, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v24 = v15;
      uint64_t v25 = v14;
      uint64_t v23 = v26 + 1;
      sub_25F78BC90();
      swift_release();
      uint64_t v16 = swift_retain();
      uint64_t v17 = sub_25F76A324(v16, v8);
      uint64_t result = swift_release();
      uint64_t v18 = *(void *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
      BOOL v19 = __OFADD__(v18, 1);
      uint64_t v20 = v18 + 1;
      if (!v19)
      {
        *(void *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v20;
        swift_release();
        uint64_t v21 = swift_retain();
        sub_25F76A324(v21, v8);
        swift_release();
        uint64_t v22 = sub_25F78BF90();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
        sub_25F763E6C(a1, 1, (uint64_t)v6);
        swift_release();
        return sub_25F73D748((uint64_t)v6, &qword_26A7BB9D8);
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25F7475A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v5 = (int *)type metadata accessor for TapView();
  MEMORY[0x270FA5388](v5);
  uint64_t v29 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB90);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB98);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBA0);
  uint64_t v31 = *(void *)(v14 - 8);
  uint64_t v32 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v30 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a2;
  uint64_t v35 = a1;
  sub_25F78B8A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBA8);
  sub_25F73D9A4(&qword_26A7BBBB0, &qword_26A7BBBA8);
  sub_25F78B120();
  uint64_t v16 = (uint64_t *)(a2 + v5[12]);
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  *(void *)&long long v36 = v17;
  *((void *)&v36 + 1) = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC80();
  uint64_t v19 = v37;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  uint64_t v20 = &v13[*(int *)(v11 + 36)];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = v19;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v21 = (uint64_t)v29;
  long long v36 = *(_OWORD *)(a2 + v5[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v22 = v37;
  sub_25F74E42C(a2, v21, (uint64_t (*)(void))type metadata accessor for TapView);
  if (v22 >= 4)
  {
    uint64_t v23 = v21 + v5[8];
    char v24 = *(unsigned char *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    LOBYTE(v36) = v24;
    *((void *)&v36 + 1) = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
    sub_25F78BC80();
  }
  sub_25F74E494(v21, (uint64_t (*)(void))type metadata accessor for TapView);
  sub_25F74D9D0();
  uint64_t v26 = v30;
  sub_25F78BAE0();
  sub_25F73D748((uint64_t)v13, &qword_26A7BBB98);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(v33, v26, v32);
}

uint64_t sub_25F747974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_25F78B600();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBD0);
  return sub_25F7479D4(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_25F7479D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v100 = a2;
  uint64_t v92 = a3;
  uint64_t v87 = type metadata accessor for HapticTouchButtonView();
  uint64_t v4 = MEMORY[0x270FA5388](v87);
  long long v86 = (uint64_t *)((char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v84 = (uint64_t)&v84 - v6;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBD8);
  uint64_t v89 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  uint64_t v85 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBE0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v91 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v88 = (char *)&v84 - v11;
  uint64_t v97 = sub_25F78B340();
  uint64_t v95 = *(void *)(v97 - 8);
  uint64_t v98 = *(void *)(v95 + 64);
  MEMORY[0x270FA5388](v97);
  uint64_t v13 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v102 = (int *)type metadata accessor for TapView();
  uint64_t v96 = *((void *)v102 - 1);
  uint64_t v14 = *(void *)(v96 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v102);
  uint64_t v99 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v84 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBE8);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (uint64_t *)((char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBF0);
  uint64_t v22 = v21 - 8;
  MEMORY[0x270FA5388](v21);
  char v24 = (char *)&v84 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBF8);
  uint64_t v26 = v25 - 8;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v101 = (uint64_t)&v84 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v84 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v103 = (uint64_t)&v84 - v32;
  *uint64_t v20 = sub_25F78BDE0();
  v20[1] = v33;
  uint64_t v34 = (char *)v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC00) + 44);
  uint64_t v93 = a1;
  sub_25F7482C8(a1, v34);
  sub_25F73D580((uint64_t)v20, (uint64_t)v24, &qword_26A7BBBE8);
  uint64_t v35 = &v24[*(int *)(v22 + 60)];
  *(void *)uint64_t v35 = 0x7267206F746F6870;
  *((void *)v35 + 1) = 0xEA00000000006469;
  sub_25F73D748((uint64_t)v20, &qword_26A7BBBE8);
  char v94 = type metadata accessor for TapView;
  sub_25F74E42C(a1, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TapView);
  uint64_t v36 = v95;
  uint64_t v37 = v13;
  uint64_t v38 = v97;
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v13, v100, v97);
  unint64_t v39 = (*(unsigned __int8 *)(v96 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
  unint64_t v40 = (v14 + *(unsigned __int8 *)(v36 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v41 = swift_allocObject();
  sub_25F74E038((uint64_t)v17, v41 + v39, (uint64_t (*)(void))type metadata accessor for TapView);
  (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v41 + v40, v37, v38);
  uint64_t v42 = sub_25F78BDE0();
  uint64_t v44 = v43;
  sub_25F73D580((uint64_t)v24, (uint64_t)v31, &qword_26A7BBBF0);
  uint64_t v45 = *(int *)(v26 + 44);
  uint64_t v46 = v93;
  uint64_t v47 = (uint64_t (**)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>))&v31[v45];
  *uint64_t v47 = sub_25F74DA74;
  v47[1] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>))v41;
  v47[2] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>))v42;
  v47[3] = v44;
  uint64_t v48 = (uint64_t)v24;
  uint64_t v49 = (uint64_t)v99;
  sub_25F73D748(v48, &qword_26A7BBBF0);
  sub_25F73D51C((uint64_t)v31, v103, &qword_26A7BBBF8);
  long long v104 = *(_OWORD *)(v46 + v102[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v50 = v105;
  sub_25F74E42C(v46, v49, (uint64_t (*)(void))v94);
  if (v50 < 4)
  {
    sub_25F74E494(v49, (uint64_t (*)(void))type metadata accessor for TapView);
    uint64_t v62 = 1;
    uint64_t v58 = (uint64_t)v91;
    uint64_t v57 = v92;
    uint64_t v59 = v90;
    uint64_t v60 = v89;
    uint64_t v61 = (uint64_t)v88;
  }
  else
  {
    uint64_t v51 = v87;
    uint64_t v52 = v86;
    uint64_t v53 = v49 + v102[8];
    char v54 = *(unsigned char *)v53;
    uint64_t v55 = *(void *)(v53 + 8);
    LOBYTE(v104) = v54;
    *((void *)&v104 + 1) = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
    sub_25F78BC80();
    char v56 = v105;
    sub_25F74E494(v49, (uint64_t (*)(void))type metadata accessor for TapView);
    uint64_t v58 = (uint64_t)v91;
    uint64_t v57 = v92;
    uint64_t v59 = v90;
    uint64_t v60 = v89;
    uint64_t v61 = (uint64_t)v88;
    if (v56)
    {
      uint64_t v62 = 1;
    }
    else
    {
      *uint64_t v52 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
      swift_storeEnumTagMultiPayload();
      long long v63 = (char *)v52 + *(int *)(v51 + 20);
      type metadata accessor for TrainingManager();
      sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
      *(void *)long long v63 = sub_25F78B190();
      v63[8] = v64 & 1;
      uint64_t v65 = v84;
      sub_25F74E038((uint64_t)v52, v84, (uint64_t (*)(void))type metadata accessor for HapticTouchButtonView);
      char v66 = sub_25F78B8E0();
      long long v67 = (uint64_t *)(v46 + v102[12]);
      uint64_t v68 = *v67;
      uint64_t v69 = v67[1];
      *(void *)&long long v104 = v68;
      *((void *)&v104 + 1) = v69;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
      sub_25F78BC80();
      sub_25F78B110();
      uint64_t v71 = v70;
      uint64_t v73 = v72;
      uint64_t v75 = v74;
      uint64_t v77 = v76;
      uint64_t v78 = v85;
      sub_25F74E42C(v65, v85, (uint64_t (*)(void))type metadata accessor for HapticTouchButtonView);
      uint64_t v79 = v78 + *(int *)(v59 + 36);
      *(unsigned char *)uint64_t v79 = v66;
      *(void *)(v79 + 8) = v71;
      *(void *)(v79 + 16) = v73;
      *(void *)(v79 + 24) = v75;
      *(void *)(v79 + 32) = v77;
      *(unsigned char *)(v79 + 40) = 0;
      sub_25F74E494(v65, (uint64_t (*)(void))type metadata accessor for HapticTouchButtonView);
      sub_25F73D51C(v78, v61, &qword_26A7BBBD8);
      uint64_t v62 = 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 56))(v61, v62, 1, v59);
  uint64_t v80 = v103;
  uint64_t v81 = v101;
  sub_25F73D580(v103, v101, &qword_26A7BBBF8);
  sub_25F73D580(v61, v58, &qword_26A7BBBE0);
  sub_25F73D580(v81, v57, &qword_26A7BBBF8);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC08);
  sub_25F73D580(v58, v57 + *(int *)(v82 + 48), &qword_26A7BBBE0);
  sub_25F73D748(v61, &qword_26A7BBBE0);
  sub_25F73D748(v80, &qword_26A7BBBF8);
  sub_25F73D748(v58, &qword_26A7BBBE0);
  return sub_25F73D748(v81, &qword_26A7BBBF8);
}

uint64_t sub_25F7482C8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v138 = a2;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD30) - 8;
  MEMORY[0x270FA5388](v137);
  uint64_t v136 = (uint64_t)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_25F78B720();
  MEMORY[0x270FA5388](v130);
  char v128 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_25F78BD60();
  uint64_t v117 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v116 = (_OWORD *)((char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_25F78BD70();
  uint64_t v121 = *(void *)(v6 - 8);
  uint64_t v122 = v6 - 8;
  uint64_t v118 = v6;
  uint64_t v119 = v121;
  MEMORY[0x270FA5388](v6);
  uint64_t v114 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD38);
  uint64_t v129 = *(void *)(v132 - 8);
  MEMORY[0x270FA5388](v132);
  unsigned __int8 v124 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD40);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v123 = (uint64_t)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD48) - 8;
  MEMORY[0x270FA5388](v126);
  uint64_t v125 = (uint64_t)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD50) - 8;
  MEMORY[0x270FA5388](v131);
  uint64_t v127 = (uint64_t)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD58) - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v134);
  uint64_t v133 = (uint64_t)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v135 = (uint64_t)&v97 - v15;
  uint64_t v16 = sub_25F78B360();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v105 = v16;
  uint64_t v106 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v101 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD60);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v107 = v19;
  uint64_t v108 = v20;
  MEMORY[0x270FA5388](v19);
  char v102 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for TapView();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v115 = v22 - 8;
  uint64_t v24 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD68);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v103 = v25;
  uint64_t v104 = v26;
  MEMORY[0x270FA5388](v25);
  v139 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD70);
  uint64_t v141 = *(void *)(v143 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v143);
  char v140 = (char *)&v97 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  long long v142 = (char *)&v97 - v30;
  uint64_t v31 = sub_25F78BBC0();
  uint64_t v32 = sub_25F78BDE0();
  sub_25F7518F8(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, (uint64_t)v146, 0.0, 1, 333.0, 0, v32, v33, v31, 0, 1, 0);
  swift_release();
  uint64_t v100 = a1;
  uint64_t v98 = (uint64_t)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v113 = type metadata accessor for TapView;
  sub_25F74E42C(a1, v98, (uint64_t (*)(void))type metadata accessor for TapView);
  uint64_t v34 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v35 = (v34 + 16) & ~v34;
  uint64_t v110 = v34 | 7;
  uint64_t v111 = v35 + v24;
  uint64_t v36 = swift_allocObject();
  uint64_t v112 = v35;
  uint64_t v109 = type metadata accessor for TapView;
  sub_25F74E038((uint64_t)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v36 + v35, (uint64_t (*)(void))type metadata accessor for TapView);
  *(void *)&long long v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD78);
  *((void *)&v99 + 1) = sub_25F74F95C(&qword_26A7BBD80, &qword_26A7BBD78, (void (*)(void))sub_25F74F430);
  sub_25F78BAC0();
  swift_release();
  v147[4] = v146[4];
  v147[5] = v146[5];
  v147[6] = v146[6];
  v147[7] = v146[7];
  v147[0] = v146[0];
  v147[1] = v146[1];
  v147[2] = v146[2];
  v147[3] = v146[3];
  sub_25F74F4F4((uint64_t)v147);
  uint64_t v37 = v101;
  sub_25F78B350();
  uint64_t v38 = v98;
  sub_25F74E42C(a1, v98, (uint64_t (*)(void))type metadata accessor for TapView);
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v38;
  sub_25F74E038(v38, v39 + v35, (uint64_t (*)(void))type metadata accessor for TapView);
  sub_25F74FAC4(&qword_26A7BBDB8, MEMORY[0x263F18F90]);
  uint64_t v41 = v102;
  uint64_t v42 = v105;
  sub_25F78BD30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v106 + 8))(v37, v42);
  sub_25F78B1A0();
  v146[0] = v99;
  swift_getOpaqueTypeConformance2();
  sub_25F73D9A4(&qword_26A7BBDC0, &qword_26A7BBD60);
  uint64_t v43 = v140;
  uint64_t v44 = v103;
  uint64_t v45 = v107;
  uint64_t v46 = v139;
  sub_25F78BB30();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v41, v45);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v46, v44);
  (*(void (**)(char *, char *, uint64_t))(v141 + 32))(v142, v43, v143);
  uint64_t v48 = v116;
  uint64_t v47 = v117;
  *uint64_t v116 = xmmword_25F78D280;
  (*(void (**)(_OWORD *, void, uint64_t))(v47 + 104))(v48, *MEMORY[0x263F1B8C8], v120);
  uint64_t v49 = v114;
  sub_25F78BD80();
  uint64_t v50 = v118;
  uint64_t v51 = sub_25F78C100();
  *(void *)(v51 + 16) = 3;
  unint64_t v52 = v51 + ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80));
  uint64_t v53 = v119;
  char v54 = *(void (**)(unint64_t, char *, uint64_t))(v119 + 16);
  v54(v52, v49, v50);
  uint64_t v55 = *(void *)(v121 + 72);
  v54(v52 + v55, v49, v50);
  (*(void (**)(unint64_t, char *, uint64_t))(v53 + 32))(v52 + 2 * v55, v49, v50);
  sub_25F78B600();
  uint64_t v56 = v100;
  uint64_t v144 = v100;
  LODWORD(v146[0]) = 0;
  sub_25F74FAC4(&qword_26A7BBDC8, MEMORY[0x263F19D28]);
  sub_25F78C490();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBDD0);
  sub_25F74F548();
  uint64_t v57 = v124;
  sub_25F78BE90();
  uint64_t v58 = sub_25F78BDE0();
  uint64_t v59 = v123;
  double v61 = sub_25F751ACC(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, v123, 0.0, 1, 333.0, 0, v58, v60);
  (*(void (**)(char *, uint64_t, double))(v129 + 8))(v57, v132, v61);
  LOBYTE(v52) = sub_25F78B8B0();
  sub_25F78B110();
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v70 = v125;
  sub_25F73D580(v59, v125, &qword_26A7BBD40);
  uint64_t v71 = v70 + *(int *)(v126 + 44);
  *(unsigned char *)uint64_t v71 = v52;
  *(void *)(v71 + 8) = v63;
  *(void *)(v71 + 16) = v65;
  *(void *)(v71 + 24) = v67;
  *(void *)(v71 + 32) = v69;
  *(unsigned char *)(v71 + 40) = 0;
  sub_25F73D748(v59, &qword_26A7BBD40);
  uint64_t v72 = (uint64_t *)(v56 + *(int *)(v115 + 44));
  uint64_t v73 = *v72;
  uint64_t v74 = v72[1];
  *(void *)&v146[0] = v73;
  *((void *)&v146[0] + 1) = v74;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC60);
  sub_25F78BC80();
  uint64_t v75 = v145;
  uint64_t v76 = v127;
  sub_25F73D580(v70, v127, &qword_26A7BBD48);
  uint64_t v77 = (void *)(v76 + *(int *)(v131 + 44));
  *uint64_t v77 = v75;
  v77[1] = 0;
  sub_25F73D748(v70, &qword_26A7BBD48);
  sub_25F74E42C(v56, v40, (uint64_t (*)(void))v113);
  uint64_t v78 = swift_allocObject();
  sub_25F74E038(v40, v78 + v112, (uint64_t (*)(void))v109);
  uint64_t v79 = sub_25F78BDE0();
  uint64_t v81 = v80;
  uint64_t v82 = v136;
  sub_25F73D580(v76, v136, &qword_26A7BBD50);
  long long v83 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v82 + *(int *)(v137 + 44));
  *long long v83 = sub_25F757194;
  v83[1] = 0;
  v83[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v79;
  v83[3] = v81;
  uint64_t v84 = swift_allocObject();
  *(void *)(v84 + 16) = sub_25F74FA0C;
  *(void *)(v84 + 24) = v78;
  uint64_t v85 = v133;
  sub_25F73D580(v82, v133, &qword_26A7BBD30);
  long long v86 = (uint64_t (**)(double *))(v85 + *(int *)(v134 + 44));
  *long long v86 = sub_25F74FABC;
  v86[1] = (uint64_t (*)(double *))v84;
  sub_25F73D748(v82, &qword_26A7BBD30);
  sub_25F73D748(v76, &qword_26A7BBD50);
  uint64_t v87 = v135;
  sub_25F73D51C(v85, v135, &qword_26A7BBD58);
  char v88 = v140;
  uint64_t v89 = v141;
  uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v141 + 16);
  uint64_t v91 = v142;
  uint64_t v92 = v143;
  v90(v140, v142, v143);
  sub_25F73D580(v87, v85, &qword_26A7BBD58);
  uint64_t v93 = v138;
  v90(v138, v88, v92);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE68);
  sub_25F73D580(v85, (uint64_t)&v93[*(int *)(v94 + 48)], &qword_26A7BBD58);
  sub_25F73D748(v87, &qword_26A7BBD58);
  uint64_t v95 = *(void (**)(char *, uint64_t))(v89 + 8);
  v95(v91, v92);
  sub_25F73D748(v85, &qword_26A7BBD58);
  return ((uint64_t (*)(char *, uint64_t))v95)(v88, v92);
}

uint64_t sub_25F749180()
{
  uint64_t v0 = sub_25F78BF90();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78BF80();
  sub_25F747334((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25F749264(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TapView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  long long v8 = xmmword_25F78D290;
  swift_getKeyPath();
  sub_25F74E42C(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TapView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_25F74E038((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(void))type metadata accessor for TapView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBDE8);
  sub_25F74FB90();
  sub_25F74F5BC();
  return sub_25F78BD20();
}

uint64_t sub_25F749400@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v98 = a3;
  uint64_t v95 = sub_25F78B360();
  uint64_t v93 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v92 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD60);
  uint64_t v96 = *(void *)(v6 - 8);
  uint64_t v97 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v94 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25F78B580();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v119 = (uint64_t (*)())((char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_25F78B020();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v118 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25F78AF40();
  uint64_t v115 = *(void *)(v12 - 8);
  uint64_t v116 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v117 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25F78BF90();
  MEMORY[0x270FA5388](v14 - 8);
  char v113 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25F78AF50();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v114 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB30) - 8;
  MEMORY[0x270FA5388](v109);
  unint64_t v106 = (unint64_t)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_25F78B390() - 8;
  MEMORY[0x270FA5388](v102);
  uint64_t v104 = (char *)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for TapView();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 64);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v23 = (char *)&v88 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE18) - 8;
  MEMORY[0x270FA5388](v103);
  uint64_t v25 = (_OWORD *)((char *)&v88 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE00);
  MEMORY[0x270FA5388](v107);
  uint64_t v105 = (uint64_t)&v88 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE88);
  uint64_t v111 = *(void *)(v27 - 8);
  uint64_t v112 = v27;
  MEMORY[0x270FA5388](v27);
  uint64_t v108 = (char *)&v88 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBDF0);
  uint64_t v29 = MEMORY[0x270FA5388](v120);
  uint64_t v110 = (char *)&v88 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  char v88 = (char *)&v88 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE90);
  uint64_t v90 = *(void *)(v32 - 8);
  uint64_t v91 = v32;
  MEMORY[0x270FA5388](v32);
  uint64_t v89 = (char *)&v88 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = *a1;
  strcpy((char *)v141, "TapTouchGrid");
  BYTE5(v141[1]) = 0;
  HIWORD(v141[1]) = -5120;
  *(void *)&long long v130 = v121;
  sub_25F78C400();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  uint64_t v34 = v141[0];
  uint64_t v35 = v141[1];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v101 = type metadata accessor for TapView;
  long long v99 = v23;
  sub_25F74E42C(a2, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for TapView);
  uint64_t v37 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v38 = (v37 + 16) & ~v37;
  uint64_t v122 = v38;
  uint64_t v123 = (uint64_t (*)())(v38 + v22);
  uint64_t v124 = v37 | 7;
  uint64_t v39 = swift_allocObject();
  uint64_t v100 = type metadata accessor for TapView;
  sub_25F74E038((uint64_t)v23, v39 + v38, (uint64_t (*)(void))type metadata accessor for TapView);
  v141[2] = KeyPath;
  char v142 = 0;
  uint64_t v143 = v34;
  uint64_t v144 = v35;
  uint64_t v145 = sub_25F74FC64;
  uint64_t v146 = v39;
  uint64_t v147 = 0;
  uint64_t v148 = 0;
  sub_25F78BDE0();
  sub_25F751B28(0.0, 0, 0.0, 1, 103.0, 0, 0.0, 0, &v130, 0.0, 1, 103.0, 0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v129[8] = v138;
  v129[9] = v139;
  v129[10] = v140[0];
  v129[4] = v134;
  v129[5] = v135;
  v129[6] = v136;
  v129[7] = v137;
  v129[0] = v130;
  v129[1] = v131;
  v129[2] = v132;
  v129[3] = v133;
  *(void *)&v140[1] = 0x3FF0000000000000;
  WORD4(v140[1]) = 256;
  uint64_t v40 = v104;
  uint64_t v41 = &v104[*(int *)(v102 + 28)];
  uint64_t v42 = *MEMORY[0x263F19860];
  uint64_t v43 = sub_25F78B5A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v41, v42, v43);
  __asm { FMOV            V0.2D, #10.0 }
  *uint64_t v40 = _Q0;
  uint64_t v49 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v50 = v106;
  sub_25F74E42C((uint64_t)v40, v106, MEMORY[0x263F19048]);
  *(_WORD *)(v50 + *(int *)(v109 + 44)) = 256;
  uint64_t v51 = v121;
  sub_25F73D580(v50, (uint64_t)v25 + *(int *)(v103 + 44), &qword_26A7BBB30);
  long long v52 = v139;
  v25[8] = v138;
  v25[9] = v52;
  v25[10] = v140[0];
  *(_OWORD *)((char *)v25 + 170) = *(_OWORD *)((char *)v140 + 10);
  long long v53 = v135;
  v25[4] = v134;
  v25[5] = v53;
  long long v54 = v137;
  v25[6] = v136;
  v25[7] = v54;
  long long v55 = v131;
  *uint64_t v25 = v130;
  v25[1] = v55;
  long long v56 = v133;
  v25[2] = v132;
  v25[3] = v56;
  sub_25F74FCF0((uint64_t)&v130);
  sub_25F73D748(v50, &qword_26A7BBB30);
  sub_25F74E494((uint64_t)v40, v49);
  sub_25F74FD6C((uint64_t)v129);
  uint64_t v57 = swift_getKeyPath();
  uint64_t v58 = v105;
  sub_25F73D580((uint64_t)v25, v105, &qword_26A7BBE18);
  uint64_t v59 = v107;
  uint64_t v60 = v58 + *(int *)(v107 + 36);
  *(void *)uint64_t v60 = v57;
  *(unsigned char *)(v60 + 8) = 1;
  sub_25F73D748((uint64_t)v25, &qword_26A7BBE18);
  uint64_t v109 = a2;
  uint64_t v61 = (uint64_t)v99;
  sub_25F74E42C(a2, (uint64_t)v99, (uint64_t (*)(void))v101);
  unint64_t v62 = ((unint64_t)v123 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v104 = (char *)(v62 + 8);
  uint64_t v63 = swift_allocObject();
  uint64_t v64 = v61;
  sub_25F74E038(v61, v63 + v122, (uint64_t (*)(void))v100);
  unint64_t v106 = v62;
  *(void *)(v63 + v62) = v51;
  unint64_t v65 = sub_25F74F7C0();
  uint64_t v66 = v108;
  sub_25F78BAC0();
  swift_release();
  sub_25F73D748(v58, &qword_26A7BBE00);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v67 = v116;
  uint64_t v68 = __swift_project_value_buffer(v116, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v115 + 16))(v117, v68, v67);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v127 = sub_25F78BFF0();
  uint64_t v128 = v69;
  uint64_t v125 = v59;
  unint64_t v126 = v65;
  swift_getOpaqueTypeConformance2();
  sub_25F743B64();
  uint64_t v70 = (uint64_t)v110;
  uint64_t v71 = v112;
  sub_25F78BB00();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v66, v71);
  sub_25F78B570();
  uint64_t result = sub_25F78B560();
  if (__OFADD__(v51, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v127 = v51 + 1;
    sub_25F78B550();
    sub_25F78B560();
    sub_25F78B590();
    uint64_t v73 = (uint64_t)v88;
    sub_25F78B300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25F73D748(v70, &qword_26A7BBDF0);
    uint64_t v74 = v92;
    sub_25F78B350();
    uint64_t v119 = type metadata accessor for TapView;
    uint64_t v75 = v109;
    sub_25F74E42C(v109, v64, (uint64_t (*)(void))type metadata accessor for TapView);
    uint64_t v76 = swift_allocObject();
    uint64_t v77 = v122;
    uint64_t v123 = type metadata accessor for TapView;
    sub_25F74E038(v64, v76 + v122, (uint64_t (*)(void))type metadata accessor for TapView);
    sub_25F74FAC4(&qword_26A7BBDB8, MEMORY[0x263F18F90]);
    uint64_t v78 = v94;
    uint64_t v79 = v95;
    sub_25F78BD30();
    swift_release();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v74, v79);
    sub_25F78B1A0();
    sub_25F74F6E0();
    sub_25F73D9A4(&qword_26A7BBDC0, &qword_26A7BBD60);
    uint64_t v80 = v89;
    uint64_t v81 = v97;
    sub_25F78BB30();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v78, v81);
    sub_25F73D748(v73, &qword_26A7BBDF0);
    uint64_t v82 = sub_25F78BCC0();
    sub_25F74E42C(v75, v64, (uint64_t (*)(void))v119);
    uint64_t v83 = swift_allocObject();
    sub_25F74E038(v64, v83 + v77, (uint64_t (*)(void))v123);
    *(void *)(v83 + v106) = v121;
    uint64_t v85 = v90;
    uint64_t v84 = v91;
    uint64_t v86 = v98;
    (*(void (**)(uint64_t, char *, uint64_t))(v90 + 16))(v98, v80, v91);
    uint64_t v87 = (uint64_t *)(v86 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBDE8) + 36));
    *uint64_t v87 = v82;
    v87[1] = (uint64_t)sub_25F7502E4;
    v87[2] = v83;
    return (*(uint64_t (**)(char *, uint64_t))(v85 + 8))(v80, v84);
  }
  return result;
}

uint64_t sub_25F74A254(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + *(int *)(type metadata accessor for TapView() + 20) + 8);
  uint64_t v2 = swift_retain();
  uint64_t v3 = sub_25F76A324(v2, v1);
  swift_release();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 0;
  return swift_release();
}

uint64_t sub_25F74A2D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TapView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC90();
  char v3 = *(unsigned char *)(a1 + *(int *)(v2 + 20) + 8);
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_25F76A324(v4, v3);
  uint64_t result = swift_release();
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v5 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v9;
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
    sub_25F78BC90();
    uint64_t v10 = swift_retain();
    uint64_t v11 = sub_25F76A324(v10, v3);
    swift_release();
    *(unsigned char *)(v11 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 88) = 1;
    swift_release();
    uint64_t v12 = swift_retain();
    uint64_t v13 = sub_25F76A324(v12, v3);
    swift_release();
    uint64_t v14 = v13 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(void *)(v14 + 48) = 0;
    *(void *)(v14 + 56) = 0;
    swift_bridgeObjectRelease();
    sub_25F7657C8();
    *(void *)(v14 + 48) = 0;
    *(void *)(v14 + 56) = 0;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25F74A454()
{
  uint64_t v0 = sub_25F78BF90();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78BF80();
  sub_25F747334((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25F74A53C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for TapView();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = a2 + *(int *)(v15 + 32);
  char v19 = *(unsigned char *)v18;
  uint64_t v20 = *(void *)(v18 + 8);
  LOBYTE(v28) = v19;
  *((void *)&v28 + 1) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  int v21 = v27;
  sub_25F74E42C(a2, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TapView);
  if (v21 != 1)
  {
    sub_25F74E494((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TapView);
    sub_25F74E42C(a2, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TapView);
    goto LABEL_7;
  }
  long long v28 = *(_OWORD *)&v17[*(int *)(v8 + 28)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v22 = v27;
  sub_25F74E494((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TapView);
  sub_25F74E42C(a2, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TapView);
  if (v22 != a3)
  {
LABEL_7:
    sub_25F74E494((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TapView);
    sub_25F74E42C(a2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TapView);
    goto LABEL_8;
  }
  long long v28 = *(_OWORD *)&v14[*(int *)(v8 + 28)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v23 = v27;
  sub_25F74E494((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TapView);
  sub_25F74E42C(a2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TapView);
  if (v23 < 0)
  {
LABEL_8:
    uint64_t result = sub_25F74E494((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TapView);
    goto LABEL_9;
  }
  long long v28 = *(_OWORD *)&v11[*(int *)(v8 + 28)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v24 = v27;
  uint64_t result = sub_25F74E494((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TapView);
  if (v24 >= 9)
  {
LABEL_9:
    a1 = 0;
    goto LABEL_10;
  }
  uint64_t result = swift_retain();
LABEL_10:
  *a4 = a1;
  return result;
}

uint64_t sub_25F74A810(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = sub_25F78B730();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  char v19 = (char *)&v37 - v18;
  MEMORY[0x270FA5388](v17);
  int v21 = (char *)&v37 - v20;
  uint64_t v37 = a1;
  sub_25F76AB88((uint64_t)&v37 - v20);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v19, *MEMORY[0x263F19F00], v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  uint64_t v22 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_25F73D580((uint64_t)v21, (uint64_t)v12, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v19, v22, &qword_26A7BB8A0);
  uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v23((uint64_t)v12, 1, v5) == 1)
  {
    sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
    if (v23(v22, 1, v5) == 1)
    {
      sub_25F73D748((uint64_t)v12, &qword_26A7BB8A0);
      uint64_t v24 = v37;
LABEL_8:
      double v25 = *(double *)(v24 + *(int *)(type metadata accessor for TapView() + 56)) * 0.5;
      goto LABEL_10;
    }
  }
  else
  {
    sub_25F73D580((uint64_t)v12, (uint64_t)v16, &qword_26A7BB8A0);
    if (v23(v22, 1, v5) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v22, v5);
      sub_25F74FAC4(&qword_26A7BB998, MEMORY[0x263F19F18]);
      char v26 = sub_25F78BF70();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
      v27(v8, v5);
      sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
      sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
      v27(v16, v5);
      sub_25F73D748((uint64_t)v12, &qword_26A7BB8A0);
      uint64_t v24 = v37;
      if ((v26 & 1) == 0)
      {
        double v25 = 373.0;
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
  }
  sub_25F73D748((uint64_t)v12, &qword_26A7BB990);
  double v25 = 373.0;
  uint64_t v24 = v37;
LABEL_10:
  double v28 = v25 + a3 * -0.5;
  uint64_t v29 = type metadata accessor for TapView();
  uint64_t v30 = (uint64_t *)(v24 + *(int *)(v29 + 48));
  uint64_t v31 = *v30;
  uint64_t v32 = v30[1];
  double v38 = v28;
  uint64_t v39 = v31;
  uint64_t v40 = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC90();
  char v33 = *(unsigned char *)(v24 + *(int *)(v29 + 20) + 8);
  uint64_t v34 = swift_retain();
  uint64_t v35 = sub_25F76A324(v34, v33);
  swift_release();
  uint64_t v39 = v31;
  uint64_t v40 = v32;
  sub_25F78BC80();
  *(double *)(v35 + 64) = v38;
  return swift_release();
}

uint64_t sub_25F74ACE0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X2>, uint64_t (**a4)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v7 = sub_25F78B340();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = type metadata accessor for TapView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  if (v14)
  {
    sub_25F74E42C(a2, (uint64_t)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TapView);
    (*(void (**)(char *, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>), uint64_t))(v8 + 16))((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v7);
    unint64_t v15 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    unint64_t v16 = (v12 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v17 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v24 = a4;
    uint64_t v18 = (v17 + v16 + 8) & ~v17;
    uint64_t v19 = swift_allocObject();
    sub_25F74E038((uint64_t)v13, v19 + v15, (uint64_t (*)(void))type metadata accessor for TapView);
    *(void *)(v19 + v16) = v14;
    uint64_t v20 = v19 + v18;
    a4 = v24;
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v20, (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    int v21 = sub_25F74E330;
  }
  else
  {
    int v21 = 0;
    uint64_t v19 = 0;
  }
  *a4 = v21;
  a4[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v19;
  return swift_retain();
}

uint64_t sub_25F74AF18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)()@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v133 = a4;
  uint64_t v123 = a3;
  uint64_t v121 = a1;
  uint64_t v103 = a5;
  uint64_t v6 = sub_25F78B580();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v145 = (char *)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25F78B020();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v144 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25F78AF40();
  uint64_t v141 = *(void *)(v10 - 8);
  uint64_t v142 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v143 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25F78BF90();
  MEMORY[0x270FA5388](v12 - 8);
  char v140 = (char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25F78AF50();
  MEMORY[0x270FA5388](v14 - 8);
  long long v139 = (char *)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25F78C170();
  uint64_t v137 = *(void *)(v16 - 8);
  uint64_t v138 = v16;
  MEMORY[0x270FA5388](v16);
  long long v135 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25F78B340();
  uint64_t v126 = *(void *)(v18 - 8);
  uint64_t v127 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v122 = v19;
  uint64_t v125 = (char *)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for TapView();
  uint64_t v118 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v119 = v21;
  uint64_t v128 = (uint64_t)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB30) - 8;
  MEMORY[0x270FA5388](v111);
  uint64_t v110 = (uint64_t)&v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_25F78B390() - 8;
  MEMORY[0x270FA5388](v108);
  uint64_t v107 = (double *)((char *)&v101 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC10) - 8;
  MEMORY[0x270FA5388](v109);
  double v25 = (char *)&v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC18) - 8;
  MEMORY[0x270FA5388](v146);
  unint64_t v106 = (char *)&v101 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC20);
  MEMORY[0x270FA5388](v112);
  uint64_t v114 = (uint64_t)&v101 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC28);
  MEMORY[0x270FA5388](v113);
  uint64_t v116 = (uint64_t)&v101 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC30);
  MEMORY[0x270FA5388](v115);
  uint64_t v120 = (uint64_t)&v101 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC38);
  MEMORY[0x270FA5388](v117);
  uint64_t v124 = (char *)&v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC40);
  MEMORY[0x270FA5388](v131);
  uint64_t v132 = (uint64_t)&v101 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC48);
  uint64_t v32 = MEMORY[0x270FA5388](v101);
  long long v136 = (char *)&v101 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v102 = (char *)&v101 - v34;
  strcpy((char *)v161, "TapTouchGrid");
  BYTE13(v161[0]) = 0;
  HIWORD(v161[0]) = -5120;
  uint64_t v130 = *(int *)(v20 + 28);
  long long v151 = *(_OWORD *)(a2 + v130);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  sub_25F78C400();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  uint64_t v35 = *((void *)&v161[0] + 1);
  uint64_t v105 = *(void *)&v161[0];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v134 = v20;
  uint64_t v147 = a2 + *(int *)(v20 + 44);
  uint64_t v148 = a2;
  char v37 = *(unsigned char *)v147;
  CGFloat v38 = *(double *)(v147 + 8);
  LOBYTE(v161[0]) = *(unsigned char *)v147;
  *((CGFloat *)v161 + 1) = v38;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  if ((_BYTE)v151) {
    double v40 = INFINITY;
  }
  else {
    double v40 = 103.0;
  }
  double v104 = v40;
  LOBYTE(v161[0]) = v37;
  *((CGFloat *)v161 + 1) = v38;
  sub_25F78BC80();
  if ((_BYTE)v151) {
    double v41 = INFINITY;
  }
  else {
    double v41 = 103.0;
  }
  uint64_t v163 = KeyPath;
  char v164 = 0;
  uint64_t v165 = v105;
  uint64_t v166 = v35;
  uint64_t v167 = 0x3FF0000000000000;
  sub_25F78BDE0();
  sub_25F751D08(0.0, 1, 0.0, 1, v104, 0, 0.0, 1, (uint64_t)v161, 0.0, 1, v41, 0);
  swift_bridgeObjectRelease();
  uint64_t v42 = (uint64_t)v106;
  swift_release();
  long long v157 = v161[6];
  long long v158 = v161[7];
  long long v159 = v161[8];
  uint64_t v160 = v162;
  long long v153 = v161[2];
  long long v154 = v161[3];
  long long v155 = v161[4];
  long long v156 = v161[5];
  long long v151 = v161[0];
  long long v152 = v161[1];
  LOBYTE(v150.origin.x) = v37;
  v150.origin.y = v38;
  sub_25F78BC80();
  int v43 = v149;
  uint64_t v44 = v107;
  uint64_t v45 = (char *)v107 + *(int *)(v108 + 28);
  uint64_t v46 = *MEMORY[0x263F19860];
  uint64_t v47 = sub_25F78B5A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v45, v46, v47);
  double v48 = 10.0;
  if (v43) {
    double v48 = 0.0;
  }
  *uint64_t v44 = v48;
  v44[1] = v48;
  uint64_t v49 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v50 = v110;
  sub_25F74E42C((uint64_t)v44, v110, MEMORY[0x263F19048]);
  *(_WORD *)(v50 + *(int *)(v111 + 44)) = 256;
  sub_25F73D580(v50, (uint64_t)&v25[*(int *)(v109 + 44)], &qword_26A7BBB30);
  long long v51 = v158;
  *((_OWORD *)v25 + 6) = v157;
  *((_OWORD *)v25 + 7) = v51;
  *((_OWORD *)v25 + 8) = v159;
  *((void *)v25 + 18) = v160;
  long long v52 = v154;
  *((_OWORD *)v25 + 2) = v153;
  *((_OWORD *)v25 + 3) = v52;
  long long v53 = v156;
  *((_OWORD *)v25 + 4) = v155;
  *((_OWORD *)v25 + 5) = v53;
  long long v54 = v152;
  *(_OWORD *)double v25 = v151;
  *((_OWORD *)v25 + 1) = v54;
  sub_25F743AC4((uint64_t)&v151);
  sub_25F73D748(v50, &qword_26A7BBB30);
  sub_25F74E494((uint64_t)v44, v49);
  sub_25F743B00((uint64_t)&v151);
  uint64_t v55 = swift_getKeyPath();
  sub_25F73D580((uint64_t)v25, v42, &qword_26A7BBC10);
  uint64_t v56 = v42 + *(int *)(v146 + 44);
  *(void *)uint64_t v56 = v55;
  *(unsigned char *)(v56 + 8) = 1;
  sub_25F73D748((uint64_t)v25, &qword_26A7BBC10);
  char v57 = *(unsigned char *)v147;
  CGFloat v58 = *(double *)(v147 + 8);
  LOBYTE(v150.origin.x) = *(unsigned char *)v147;
  v150.origin.y = v58;
  uint64_t v146 = v39;
  sub_25F78BC80();
  if (v149 == 1)
  {
    sub_25F78B240();
    double MidX = v59 * 0.5;
  }
  else
  {
    type metadata accessor for CGRect(0);
    sub_25F78B270();
    double MidX = CGRectGetMidX(v150);
  }
  LOBYTE(v150.origin.x) = v57;
  v150.origin.y = v58;
  sub_25F78BC80();
  uint64_t v61 = v148;
  if (v149 == 1)
  {
    sub_25F78B240();
    double MidY = v62 * 0.5;
  }
  else
  {
    type metadata accessor for CGRect(0);
    sub_25F78B270();
    double MidY = CGRectGetMidY(v150);
  }
  uint64_t v64 = v114;
  sub_25F73D580(v42, v114, &qword_26A7BBC18);
  unint64_t v65 = (double *)(v64 + *(int *)(v112 + 36));
  double *v65 = MidX;
  v65[1] = MidY;
  sub_25F73D748(v42, &qword_26A7BBC18);
  uint64_t v123 = type metadata accessor for TapView;
  uint64_t v66 = v128;
  sub_25F74E42C(v61, v128, (uint64_t (*)(void))type metadata accessor for TapView);
  uint64_t v68 = v125;
  uint64_t v67 = v126;
  uint64_t v69 = v127;
  (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v125, v133, v127);
  uint64_t v70 = *(unsigned __int8 *)(v118 + 80);
  uint64_t v71 = (v70 + 16) & ~v70;
  uint64_t v133 = v71 + v119;
  uint64_t v121 = v70 | 7;
  unint64_t v72 = (v71 + v119 + *(unsigned __int8 *)(v67 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  uint64_t v73 = swift_allocObject();
  sub_25F74E038(v66, v73 + v71, (uint64_t (*)(void))type metadata accessor for TapView);
  (*(void (**)(unint64_t, char *, uint64_t))(v67 + 32))(v73 + v72, v68, v69);
  uint64_t v74 = v116;
  sub_25F73D580(v64, v116, &qword_26A7BBC20);
  uint64_t v75 = (uint64_t (**)())(v74 + *(int *)(v113 + 36));
  *uint64_t v75 = sub_25F74E774;
  v75[1] = (uint64_t (*)())v73;
  v75[2] = 0;
  v75[3] = 0;
  sub_25F73D748(v64, &qword_26A7BBC20);
  uint64_t v76 = sub_25F78BE60();
  CGFloat v77 = *(double *)(v147 + 8);
  LOBYTE(v150.origin.x) = *(unsigned char *)v147;
  v150.origin.y = v77;
  sub_25F78BC80();
  LOBYTE(v72) = v149;
  uint64_t v78 = v120;
  sub_25F73D580(v74, v120, &qword_26A7BBC28);
  uint64_t v79 = v78 + *(int *)(v115 + 36);
  *(void *)uint64_t v79 = v76;
  *(unsigned char *)(v79 + 8) = v72;
  sub_25F73D748(v74, &qword_26A7BBC28);
  sub_25F74E42C(v148, v66, (uint64_t (*)(void))v123);
  uint64_t v80 = swift_allocObject();
  uint64_t v81 = v80 + v71;
  uint64_t v82 = v148;
  sub_25F74E038(v66, v81, (uint64_t (*)(void))type metadata accessor for TapView);
  uint64_t v83 = v135;
  sub_25F78C150();
  uint64_t v84 = (uint64_t)v124;
  uint64_t v85 = &v124[*(int *)(v117 + 36)];
  uint64_t v86 = sub_25F78B2A0();
  uint64_t v88 = v137;
  uint64_t v87 = v138;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(&v85[*(int *)(v86 + 20)], v83, v138);
  *(void *)uint64_t v85 = &unk_26A7BBC58;
  *((void *)v85 + 1) = v80;
  sub_25F73D580(v78, v84, &qword_26A7BBC30);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v83, v87);
  sub_25F73D748(v78, &qword_26A7BBC30);
  uint64_t v89 = (CGFloat *)(v82 + *(int *)(v134 + 40));
  CGFloat v90 = *v89;
  CGFloat v91 = v89[1];
  v150.origin.x = v90;
  v150.origin.y = v91;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC60);
  sub_25F78BC80();
  uint64_t v92 = v149;
  uint64_t v93 = v132;
  sub_25F73D580(v84, v132, &qword_26A7BBC38);
  uint64_t v94 = (void *)(v93 + *(int *)(v131 + 36));
  *uint64_t v94 = v92;
  v94[1] = 0;
  sub_25F73D748(v84, &qword_26A7BBC38);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v95 = v142;
  uint64_t v96 = __swift_project_value_buffer(v142, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v143, v96, v95);
  sub_25F78B010();
  sub_25F78AF60();
  *(void *)&v150.origin.x = sub_25F78BFF0();
  v150.origin.y = v97;
  sub_25F74F95C(&qword_26A7BBC68, &qword_26A7BBC40, (void (*)(void))sub_25F74EA04);
  sub_25F743B64();
  uint64_t v98 = (uint64_t)v136;
  sub_25F78BB00();
  swift_bridgeObjectRelease();
  sub_25F73D748(v93, &qword_26A7BBC40);
  sub_25F78B570();
  sub_25F78B560();
  v150.origin = *(CGPoint *)(v82 + v130);
  uint64_t result = sub_25F78BC80();
  if (__OFADD__(v149, 1))
  {
    __break(1u);
  }
  else
  {
    *(void *)&v150.origin.x = v149 + 1;
    sub_25F78B550();
    sub_25F78B560();
    sub_25F78B590();
    uint64_t v100 = (uint64_t)v102;
    sub_25F78B300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25F73D748(v98, &qword_26A7BBC48);
    return sub_25F73D51C(v100, v103, &qword_26A7BBC48);
  }
  return result;
}

uint64_t sub_25F74BF6C()
{
  return sub_25F78B330();
}

uint64_t sub_25F74C020(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_25F78C350();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  v1[8] = sub_25F78C140();
  v1[9] = sub_25F78C130();
  char v3 = (void *)swift_task_alloc();
  v1[10] = v3;
  *char v3 = v1;
  v3[1] = sub_25F74C13C;
  return sub_25F74CD2C();
}

uint64_t sub_25F74C13C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = sub_25F78C120();
  *(void *)(v1 + 88) = v3;
  *(void *)(v1 + 96) = v2;
  return MEMORY[0x270FA2498](sub_25F74C280, v3, v2);
}

uint64_t sub_25F74C280()
{
  uint64_t v1 = sub_25F78C480();
  uint64_t v3 = v2;
  sub_25F78C340();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_26A7BBD10 + dword_26A7BBD10);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25F74C35C;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_25F74C35C()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v2[14] = v0;
  swift_task_dealloc();
  uint64_t v4 = v2[7];
  uint64_t v5 = v2[5];
  uint64_t v6 = v2[4];
  if (v0)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v2[11];
    uint64_t v8 = v2[12];
    return MEMORY[0x270FA2498](sub_25F74C8DC, v7, v8);
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v2[15] = v9;
    v2[16] = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v9(v4, v6);
    uint64_t v10 = (void *)swift_task_alloc();
    v2[17] = v10;
    *uint64_t v10 = v3;
    v10[1] = sub_25F74C538;
    return sub_25F74D2E4();
  }
}

uint64_t sub_25F74C538()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_25F74C658, v3, v2);
}

uint64_t sub_25F74C658()
{
  uint64_t v1 = sub_25F78C480();
  uint64_t v3 = v2;
  sub_25F78C340();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_26A7BBD10 + dword_26A7BBD10);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25F74C734;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_25F74C734()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 120);
  uint64_t v4 = *(void *)(*v1 + 48);
  uint64_t v5 = *(void *)(*v1 + 32);
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  uint64_t v6 = *(void *)(v2 + 96);
  uint64_t v7 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v8 = sub_25F74CB60;
  }
  else {
    uint64_t v8 = sub_25F74CAA8;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_25F74C8DC()
{
  uint64_t v9 = v0;
  uint64_t v1 = (void *)v0[14];
  swift_release();
  if (qword_26A7BB690 != -1) {
    swift_once();
  }
  uint64_t v2 = (id)qword_26A7BCBA8;
  os_log_type_t v3 = sub_25F78C1B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[2] = sub_25F789928(0xD000000000000064, 0x800000025F78EE70, &v8);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v5, -1, -1);
    MEMORY[0x2611FEDE0](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_25F74CAA8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  char v2 = *(unsigned char *)(v1 + *(int *)(type metadata accessor for TapView() + 20) + 8);
  uint64_t v3 = swift_retain();
  sub_25F76A324(v3, v2);
  swift_release();
  sub_25F764560();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25F74CB60()
{
  uint64_t v9 = v0;
  uint64_t v1 = (void *)v0[19];
  swift_release();
  if (qword_26A7BB690 != -1) {
    swift_once();
  }
  char v2 = (id)qword_26A7BCBA8;
  os_log_type_t v3 = sub_25F78C1B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[2] = sub_25F789928(0xD000000000000064, 0x800000025F78EE70, &v8);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v5, -1, -1);
    MEMORY[0x2611FEDE0](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_25F74CD2C()
{
  v1[6] = v0;
  sub_25F78B020();
  v1[7] = swift_task_alloc();
  uint64_t v2 = sub_25F78AF40();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  sub_25F78BF90();
  v1[11] = swift_task_alloc();
  sub_25F78AF50();
  v1[12] = swift_task_alloc();
  sub_25F78C140();
  v1[13] = sub_25F78C130();
  uint64_t v4 = sub_25F78C120();
  return MEMORY[0x270FA2498](sub_25F74CEA4, v4, v3);
}

uint64_t sub_25F74CEA4()
{
  uint64_t v1 = v0[6];
  swift_release();
  char v2 = *(unsigned char *)(v1 + *(int *)(type metadata accessor for TapView() + 20) + 8);
  uint64_t v3 = swift_retain();
  uint64_t v4 = sub_25F76A324(v3, v2);
  swift_release();
  swift_getKeyPath();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v4;
  *(unsigned char *)(v5 + 24) = 1;
  v0[2] = v4;
  sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B030();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v6 = swift_retain();
  uint64_t v7 = sub_25F76A324(v6, v2);
  swift_release();
  swift_getKeyPath();
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = v7;
  *(unsigned char *)(v8 + 24) = 0;
  v0[3] = v7;
  sub_25F78B030();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v9 = swift_retain();
  uint64_t v10 = sub_25F76A324(v9, v2);
  swift_release();
  swift_getKeyPath();
  uint64_t v11 = swift_task_alloc();
  *(void *)(v11 + 16) = v10;
  *(unsigned char *)(v11 + 24) = 1;
  v0[4] = v10;
  sub_25F78B030();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v12 = swift_retain();
  uint64_t v13 = sub_25F76A324(v12, v2);
  swift_release();
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v14 = v0[9];
  uint64_t v15 = v0[10];
  uint64_t v16 = v0[8];
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_26A7BE398);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v17, v16);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v18 = sub_25F78BFF0();
  uint64_t v20 = v19;
  swift_getKeyPath();
  uint64_t v21 = (void *)swift_task_alloc();
  v21[2] = v13;
  v21[3] = v18;
  v21[4] = v20;
  v0[5] = v13;
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_25F74D2E4()
{
  *(void *)(v1 + 40) = v0;
  sub_25F78C140();
  *(void *)(v1 + 48) = sub_25F78C130();
  uint64_t v3 = sub_25F78C120();
  return MEMORY[0x270FA2498](sub_25F74D37C, v3, v2);
}

uint64_t sub_25F74D37C()
{
  uint64_t v1 = v0[5];
  swift_release();
  uint64_t v2 = type metadata accessor for TapView();
  uint64_t v3 = *(void *)(v1 + *(int *)(v2 + 52));
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(v2 + 36));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v0[2] = v5;
  v0[3] = v6;
  v0[4] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC60);
  sub_25F78BC90();
  sub_25F78BE60();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_25F78B2C0();
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25F74D494()
{
  return sub_25F78BC90();
}

void sub_25F74D554(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (int *)type metadata accessor for TapView();
  uint64_t v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  *(void *)uint64_t v3 = sub_25F78B190();
  v3[8] = v4 & 1;
  uint64_t v5 = v2[6];
  sub_25F78BC70();
  *(_OWORD *)((char *)a1 + v5) = v33;
  uint64_t v6 = v2[7];
  sub_25F78BC70();
  *(_OWORD *)((char *)a1 + v6) = v33;
  uint64_t v7 = (char *)a1 + v2[8];
  sub_25F78BC70();
  char *v7 = v33;
  *((void *)v7 + 1) = *((void *)&v33 + 1);
  uint64_t v8 = (_OWORD *)((char *)a1 + v2[9]);
  sub_25F78BC70();
  *uint64_t v8 = v33;
  uint64_t v9 = (_OWORD *)((char *)a1 + v2[10]);
  sub_25F78BC70();
  *uint64_t v9 = v33;
  uint64_t v10 = (char *)a1 + v2[11];
  sub_25F78BC70();
  *uint64_t v10 = v33;
  *((void *)v10 + 1) = *((void *)&v33 + 1);
  uint64_t v11 = (_OWORD *)((char *)a1 + v2[12]);
  sub_25F78BC70();
  *uint64_t v11 = v33;
  uint64_t v12 = v2[13];
  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_mainScreen);
  objc_msgSend(v14, sel_bounds);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v34.origin.x = v16;
  v34.origin.y = v18;
  v34.size.width = v20;
  v34.size.height = v22;
  *(CGFloat *)((char *)a1 + v12) = CGRectGetWidth(v34);
  uint64_t v23 = v2[14];
  id v24 = objc_msgSend(v13, sel_mainScreen);
  objc_msgSend(v24, sel_bounds);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v35.origin.x = v26;
  v35.origin.y = v28;
  v35.size.width = v30;
  v35.size.height = v32;
  *(CGFloat *)((char *)a1 + v23) = CGRectGetHeight(v35);
}

uint64_t sub_25F74D830@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_25F74E42C(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TapView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_25F74E038((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for TapView);
  *a2 = sub_25F74D948;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_25F74D948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F7475A8(a1, v6, a2);
}

uint64_t sub_25F74D9C8@<X0>(uint64_t a1@<X8>)
{
  return sub_25F747974(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_25F74D9D0()
{
  unint64_t result = qword_26A7BBBC0;
  if (!qword_26A7BBBC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBB98);
    sub_25F73D9A4(&qword_26A7BBBC8, &qword_26A7BBB90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBBC0);
  }
  return result;
}

uint64_t sub_25F74DA74@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TapView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_25F78B340() - 8);
  uint64_t v9 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v2
                                                                + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)));
  return sub_25F74ACE0(a1, v2 + v6, v9, a2);
}

void sub_25F74DB58(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25F74DB60(void *result, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2 = result;
  uint64_t v3 = *result;
  if (!*result)
  {
    unint64_t result = a2(&v4);
    uint64_t v3 = v4;
  }
  *uint64_t v2 = v3;
  return result;
}

uint64_t sub_25F74DBB0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F74DC5C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F74DD40@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 48);
  return result;
}

uint64_t sub_25F74DDE8()
{
  return swift_release();
}

uint64_t sub_25F74DEB8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F74FAC4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 50);
  return result;
}

uint64_t sub_25F74DF60()
{
  return swift_release();
}

uint64_t sub_25F74E038(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F74E0A0()
{
  uint64_t v1 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v11 = *(void *)(v1 + 64);
  uint64_t v12 = sub_25F78B340();
  uint64_t v4 = *(void *)(v12 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v3, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v3, v7);
    }
  }
  else
  {
    swift_release();
  }
  unint64_t v9 = (((v11 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + v5 + 8) & ~v5;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v9, v12);
  return MEMORY[0x270FA0238](v0, v9 + v6, v2 | v5 | 7);
}

uint64_t sub_25F74E330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TapView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(sub_25F78B340() - 8);
  unint64_t v9 = *(uint64_t (**)())(v2 + v7);
  uint64_t v10 = v2 + ((v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return sub_25F74AF18(a1, v2 + v6, v9, v10, a2);
}

uint64_t sub_25F74E42C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F74E494(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v11 = *(void *)(v1 + 64);
  uint64_t v12 = sub_25F78B340();
  uint64_t v4 = *(void *)(v12 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v3, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v3, v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = (v3 + v11 + v5) & ~v5;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v9, v12);
  return MEMORY[0x270FA0238](v0, v9 + v6, v2 | v5 | 7);
}

uint64_t sub_25F74E774()
{
  type metadata accessor for TapView();
  sub_25F78B340();
  return sub_25F74BF6C();
}

uint64_t sub_25F74E844()
{
  uint64_t v2 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_25F74E910;
  return sub_25F74C020(v3);
}

uint64_t sub_25F74E910()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_25F74EA04()
{
  unint64_t result = qword_26A7BBC70;
  if (!qword_26A7BBC70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBC38);
    sub_25F74EAB0();
    sub_25F74FAC4(&qword_26A7BBD00, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBC70);
  }
  return result;
}

unint64_t sub_25F74EAB0()
{
  unint64_t result = qword_26A7BBC78;
  if (!qword_26A7BBC78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBC30);
    sub_25F74F95C(&qword_26A7BBC80, &qword_26A7BBC28, (void (*)(void))sub_25F74EB7C);
    sub_25F73D9A4(&qword_26A7BBCF0, &qword_26A7BBCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBC78);
  }
  return result;
}

unint64_t sub_25F74EB7C()
{
  unint64_t result = qword_26A7BBC88;
  if (!qword_26A7BBC88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBC20);
    sub_25F74EBF8();
    sub_25F74EE58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBC88);
  }
  return result;
}

unint64_t sub_25F74EBF8()
{
  unint64_t result = qword_26A7BBC90;
  if (!qword_26A7BBC90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBC18);
    sub_25F74EC98();
    sub_25F73D9A4(&qword_26A7BBCD8, &qword_26A7BBCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBC90);
  }
  return result;
}

unint64_t sub_25F74EC98()
{
  unint64_t result = qword_26A7BBC98;
  if (!qword_26A7BBC98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBC10);
    sub_25F74F95C(&qword_26A7BBCA0, &qword_26A7BBCA8, (void (*)(void))sub_25F74ED64);
    sub_25F73D9A4(&qword_26A7BBB78, &qword_26A7BBB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBC98);
  }
  return result;
}

unint64_t sub_25F74ED64()
{
  unint64_t result = qword_26A7BBCB0;
  if (!qword_26A7BBCB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBCB8);
    sub_25F74EE04();
    sub_25F73D9A4(&qword_26A7BBCC8, &qword_26A7BBCD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBCB0);
  }
  return result;
}

unint64_t sub_25F74EE04()
{
  unint64_t result = qword_26A7BBCC0;
  if (!qword_26A7BBCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBCC0);
  }
  return result;
}

unint64_t sub_25F74EE58()
{
  unint64_t result = qword_26A7BBCE8;
  if (!qword_26A7BBCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBCE8);
  }
  return result;
}

uint64_t sub_25F74EEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_25F78C330();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_25F74EFB0, 0, 0);
}

uint64_t sub_25F74EFB0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_25F78C350();
  uint64_t v5 = sub_25F74FAC4(&qword_26A7BBD20, MEMORY[0x263F8F710]);
  sub_25F78C430();
  sub_25F74FAC4(&qword_26A7BBD28, MEMORY[0x263F8F6D8]);
  sub_25F78C360();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_25F74F150;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_25F74F150()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25F74F30C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_25F74F30C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25F74F378()
{
  return sub_25F74D494();
}

uint64_t sub_25F74F39C()
{
  return sub_25F76283C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_25F74F3C4()
{
  return sub_25F7629A4(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_25F74F3F4()
{
  return sub_25F762578(v0[2], v0[3], v0[4]);
}

uint64_t sub_25F74F418()
{
  return sub_25F74FC7C((uint64_t (*)(uint64_t))sub_25F749180);
}

unint64_t sub_25F74F430()
{
  unint64_t result = qword_26A7BBD88;
  if (!qword_26A7BBD88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBD90);
    sub_25F73D9A4(&qword_26A7BBD98, &qword_26A7BBDA0);
    sub_25F73D9A4(&qword_26A7BBDA8, &qword_26A7BBDB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBD88);
  }
  return result;
}

uint64_t sub_25F74F4F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F74F524()
{
  return sub_25F750070();
}

uint64_t sub_25F74F540()
{
  return sub_25F749264(*(void *)(v0 + 16));
}

unint64_t sub_25F74F548()
{
  unint64_t result = qword_26A7BBDD8;
  if (!qword_26A7BBDD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBDD0);
    sub_25F74F5BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBDD8);
  }
  return result;
}

unint64_t sub_25F74F5BC()
{
  unint64_t result = qword_26A7BBDE0;
  if (!qword_26A7BBDE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBDE8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBDF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBD60);
    sub_25F74F6E0();
    sub_25F73D9A4(&qword_26A7BBDC0, &qword_26A7BBD60);
    swift_getOpaqueTypeConformance2();
    sub_25F73D9A4(&qword_26A7BBE58, &qword_26A7BBE60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBDE0);
  }
  return result;
}

unint64_t sub_25F74F6E0()
{
  unint64_t result = qword_26A7BBDF8;
  if (!qword_26A7BBDF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBDF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBE00);
    sub_25F74F7C0();
    swift_getOpaqueTypeConformance2();
    sub_25F74FAC4(&qword_26A7BBE50, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBDF8);
  }
  return result;
}

unint64_t sub_25F74F7C0()
{
  unint64_t result = qword_26A7BBE08;
  if (!qword_26A7BBE08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBE00);
    sub_25F74F860();
    sub_25F73D9A4(&qword_26A7BBCD8, &qword_26A7BBCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBE08);
  }
  return result;
}

unint64_t sub_25F74F860()
{
  unint64_t result = qword_26A7BBE10;
  if (!qword_26A7BBE10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBE18);
    sub_25F74F95C(&qword_26A7BBE20, &qword_26A7BBE28, (void (*)(void))sub_25F74F92C);
    sub_25F73D9A4(&qword_26A7BBB78, &qword_26A7BBB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBE10);
  }
  return result;
}

uint64_t sub_25F74F92C()
{
  return sub_25F74F95C(&qword_26A7BBE30, &qword_26A7BBE38, (void (*)(void))sub_25F74F9D8);
}

uint64_t sub_25F74F95C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_25F74F9D8()
{
  return sub_25F74F95C(&qword_26A7BBE40, &qword_26A7BBE48, (void (*)(void))sub_25F74EE04);
}

uint64_t sub_25F74FA0C(double a1, double a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F74A810(v6, a1, a2);
}

uint64_t sub_25F74FA84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F74FABC(double *a1)
{
  return sub_25F754CC4(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

uint64_t sub_25F74FAC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F74FB10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F749400(a1, v6, a2);
}

unint64_t sub_25F74FB90()
{
  unint64_t result = qword_26A7BBE78;
  if (!qword_26A7BBE78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBE70);
    sub_25F74FC0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBE78);
  }
  return result;
}

unint64_t sub_25F74FC0C()
{
  unint64_t result = qword_26A7BBE80;
  if (!qword_26A7BBE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBE80);
  }
  return result;
}

uint64_t sub_25F74FC64()
{
  return sub_25F74FC7C(sub_25F74A254);
}

uint64_t sub_25F74FC7C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25F74FCF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  sub_25F7439F0(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_bridgeObjectRetain();
  sub_25F74FD5C(v2);
  sub_25F74FD5C(v3);
  return a1;
}

uint64_t sub_25F74FD5C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25F74FD6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  sub_25F743A74(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_bridgeObjectRelease();
  sub_25F74376C(v2);
  sub_25F74376C(v3);
  return a1;
}

uint64_t sub_25F74FDDC()
{
  uint64_t v1 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25F74A2D0(v2);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F750054()
{
  return sub_25F750070();
}

uint64_t sub_25F750070()
{
  return sub_25F74A454();
}

uint64_t objectdestroy_67Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for TapView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_25F7502E4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TapView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_25F74A53C(a1, v2 + v6, v7, a2);
}

ValueMetadata *type metadata accessor for BoundsKey()
{
  return &type metadata for BoundsKey;
}

uint64_t sub_25F7503A0()
{
  return sub_25F73D9A4(&qword_26A7BBE98, &qword_26A7BBEA0);
}

uint64_t sub_25F7503DC()
{
  return sub_25F743CA0();
}

uint64_t sub_25F7503F4()
{
  return sub_25F74F39C();
}

uint64_t sub_25F75040C()
{
  return sub_25F74F3F4();
}

uint64_t *sub_25F750424(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v11;
    uint64_t v14 = (char *)a2 + v11;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v14) = v14[8];
    *(void *)uint64_t v13 = v15;
    v13[8] = (char)v14;
    CGFloat v16 = (char *)a1 + v12;
    double v17 = (char *)a2 + v12;
    long long v18 = *((_OWORD *)v17 + 1);
    *(_OWORD *)CGFloat v16 = *(_OWORD *)v17;
    *((_OWORD *)v16 + 1) = v18;
    *((void *)v16 + 4) = *((void *)v17 + 4);
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    double v21 = (uint64_t *)((char *)a1 + v19);
    CGFloat v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *double v21 = *v22;
    v21[1] = v23;
    id v24 = (uint64_t *)((char *)a1 + v20);
    double v25 = (uint64_t *)((char *)a2 + v20);
    uint64_t v26 = v25[1];
    *id v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v27) = *(uint64_t *)((char *)a2 + v27);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25F750688(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25F78B730();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_25F7507CC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v9;
  uint64_t v12 = (char *)a2 + v9;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  uint64_t v14 = (char *)a1 + v10;
  uint64_t v15 = (char *)a2 + v10;
  long long v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *((void *)v14 + 4) = *((void *)v15 + 4);
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  CGFloat v22 = (void *)((char *)a1 + v18);
  uint64_t v23 = (void *)((char *)a2 + v18);
  uint64_t v24 = v23[1];
  *CGFloat v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v25) = *(void *)((char *)a2 + v25);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25F7509E0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  v14[2] = v15[2];
  v14[3] = v15[3];
  v14[4] = v15[4];
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

char *sub_25F750C74(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = &a1[v11];
  uint64_t v15 = &a2[v11];
  long long v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *((void *)v14 + 4) = *((void *)v15 + 4);
  uint64_t v17 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  return a1;
}

char *sub_25F750E44(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  long long v16 = &a2[v14];
  long long v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  *((void *)v15 + 4) = *((void *)v16 + 4);
  swift_release();
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  swift_bridgeObjectRelease();
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_release();
  uint64_t v21 = a3[8];
  CGFloat v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  swift_bridgeObjectRelease();
  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_release();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  return a1;
}

uint64_t sub_25F751090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F7510A4);
}

uint64_t sub_25F7510A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25F751168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F75117C);
}

uint64_t sub_25F75117C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for DragView()
{
  uint64_t result = qword_26A7BBEA8;
  if (!qword_26A7BBEA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F751288()
{
  sub_25F742A1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25F751350()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F75136C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    uint64_t v23 = (void *)sub_25F78B890();
    sub_25F78B100();
  }
  sub_25F78B3C0();
  long long v24 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v24;
  *(void *)(a9 + 96) = *(void *)(v13 + 96);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  long long v26 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v26;
  *(_OWORD *)(a9 + 104) = v28;
  *(_OWORD *)(a9 + 120) = v29;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 200) = v34;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 152) = v31;
  return sub_25F7431EC(v13);
}

uint64_t sub_25F751540@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v14 = v13;
  uint64_t v15 = a9;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v24 = (void *)sub_25F78B890();
    sub_25F78B100();

    uint64_t v15 = a9;
  }
  sub_25F78B3C0();
  memcpy((void *)v15, v14, 0x131uLL);
  *(_OWORD *)(v15 + 376) = v31;
  *(_OWORD *)(v15 + 392) = v32;
  *(_OWORD *)(v15 + 408) = v33;
  *(_OWORD *)(v15 + 312) = v27;
  *(_OWORD *)(v15 + 328) = v28;
  *(_OWORD *)(v15 + 344) = v29;
  *(_OWORD *)(v15 + 360) = v30;
  return sub_25F745E1C((uint64_t)v14);
}

uint64_t sub_25F751704@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v31 = (void *)sub_25F78B890();
    sub_25F78B100();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_25F78B3C0();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_25F745E70(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F7518F8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18, char a19)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v28 = (void *)sub_25F78B890();
    sub_25F78B100();
  }
  sub_25F78B3C0();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = a17 & 1;
  *(unsigned char *)(a9 + 9) = a18 & 1;
  *(unsigned char *)(a9 + 10) = a19 & 1;
  *(_OWORD *)(a9 + 80) = v34;
  *(_OWORD *)(a9 + 96) = v35;
  *(_OWORD *)(a9 + 112) = v36;
  *(_OWORD *)(a9 + 16) = v30;
  *(_OWORD *)(a9 + 32) = v31;
  *(_OWORD *)(a9 + 48) = v32;
  *(_OWORD *)(a9 + 64) = v33;
  return swift_retain();
}

double sub_25F751ACC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_25F752344(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_26A7BBD38, &qword_26A7BBD40).n128_u64[0];
  return result;
}

uint64_t sub_25F751B28@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    uint64_t v23 = (void *)sub_25F78B890();
    sub_25F78B100();
  }
  sub_25F78B3C0();
  long long v35 = *v13;
  long long v36 = v13[1];
  uint64_t v38 = *(void *)v13;
  char v39 = *((unsigned char *)v13 + 8);
  long long v37 = v36;
  uint64_t v24 = *((void *)v13 + 4);
  uint64_t v25 = *((void *)v13 + 6);
  *a9 = v35;
  a9[1] = v36;
  long long v26 = v13[3];
  a9[2] = v13[2];
  a9[3] = v26;
  a9[4] = v28;
  a9[5] = v29;
  a9[9] = v33;
  a9[10] = v34;
  a9[6] = v30;
  a9[7] = v31;
  a9[8] = v32;
  sub_25F7570E8((uint64_t)&v38);
  sub_25F744A88((uint64_t)&v37);
  sub_25F74FD5C(v24);
  return sub_25F74FD5C(v25);
}

uint64_t sub_25F751D08@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    uint64_t v23 = (void *)sub_25F78B890();
    sub_25F78B100();
  }
  sub_25F78B3C0();
  long long v32 = *v13;
  long long v34 = v13[1];
  long long v33 = v34;
  *(_OWORD *)a9 = v32;
  *(_OWORD *)(a9 + 16) = v33;
  *(_OWORD *)(a9 + 40) = v25;
  *(_OWORD *)(a9 + 56) = v26;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 120) = v30;
  uint64_t v35 = *(void *)v13;
  char v36 = *((unsigned char *)v13 + 8);
  *(void *)(a9 + 32) = *((void *)v13 + 4);
  *(_OWORD *)(a9 + 104) = v29;
  *(_OWORD *)(a9 + 88) = v28;
  sub_25F7570E8((uint64_t)&v35);
  return sub_25F744A88((uint64_t)&v34);
}

uint64_t sub_25F751ED4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19)
{
  char v20 = a17;
  uint64_t v21 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v30 = (void *)sub_25F78B890();
    sub_25F78B100();

    char v20 = a17;
    uint64_t v21 = a16;
  }
  sub_25F78B3C0();
  *(void *)a9 = v21;
  *(unsigned char *)(a9 + 8) = v20 & 1;
  *(void *)(a9 + 16) = a18;
  *(void *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  swift_retain();
  return swift_retain();
}

double sub_25F7520BC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_25F752118(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_26A7BBFC0, &qword_26A7BBFC8).n128_u64[0];
  return result;
}

__n128 sub_25F752118@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v28 = (void *)sub_25F78B890();
    sub_25F78B100();

    uint64_t v19 = a17;
  }
  sub_25F78B3C0();
  sub_25F73D580(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *long long v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

double sub_25F7522E8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_25F752344(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_26A7BBFB0, &qword_26A7BBFB8).n128_u64[0];
  return result;
}

__n128 sub_25F752344@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v28 = (void *)sub_25F78B890();
    sub_25F78B100();

    uint64_t v19 = a16;
  }
  sub_25F78B3C0();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  long long v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *long long v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t sub_25F752540@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19)
{
  char v20 = a17;
  uint64_t v21 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25F78C1C0();
    long long v30 = (void *)sub_25F78B890();
    sub_25F78B100();

    char v20 = a17;
    uint64_t v21 = a16;
  }
  sub_25F78B3C0();
  *(void *)a9 = v21;
  *(unsigned char *)(a9 + 8) = v20 & 1;
  *(void *)(a9 + 16) = a18;
  *(void *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  sub_25F7439F0(v21, v20 & 1);
  return swift_bridgeObjectRetain();
}

unint64_t sub_25F752728()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF98);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFA0) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25F78CCA0;
  uint64_t v4 = (void *)(v3 + v2);
  *uint64_t v4 = 0x6B726F592077654ELL;
  v4[1] = 0xE800000000000000;
  sub_25F78BF80();
  int v5 = (void *)((char *)v4 + v1);
  void *v5 = 0x79656E647953;
  v5[1] = 0xE600000000000000;
  sub_25F78BF80();
  uint64_t v6 = (void *)((char *)v4 + 2 * v1);
  *uint64_t v6 = 0x6F796B6F54;
  v6[1] = 0xE500000000000000;
  sub_25F78BF80();
  unint64_t result = sub_25F757388(v3);
  qword_26A7BE390 = result;
  return result;
}

uint64_t sub_25F7528B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = sub_25F78C250();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x270FA5388](v3);
  int v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DragView();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBEB8);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F754B78(v2, (uint64_t)v10);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = swift_allocObject();
  sub_25F754BE0((uint64_t)v10, v15 + v14);
  long long v37 = sub_25F754C44;
  uint64_t v38 = v15;
  LOBYTE(v7) = *(unsigned char *)(v2 + *(int *)(v7 + 28) + 8);
  uint64_t v16 = swift_retain();
  uint64_t v17 = sub_25F76A324(v16, v7);
  swift_release();
  swift_getKeyPath();
  uint64_t v36 = v17;
  sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  LOBYTE(v15) = *(unsigned char *)(v17 + 51);
  swift_release();
  LOBYTE(v36) = v15;
  sub_25F754B78(v2, (uint64_t)v10);
  uint64_t v18 = swift_allocObject();
  sub_25F754BE0((uint64_t)v10, v18 + v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBEC0);
  sub_25F73D9A4(&qword_26A7BBEC8, &qword_26A7BBEC0);
  sub_25F78BB90();
  swift_release();
  swift_release();
  id v19 = objc_msgSend(self, sel_defaultCenter);
  sub_25F78C260();

  sub_25F754B78(v2, (uint64_t)v10);
  uint64_t v20 = swift_allocObject();
  sub_25F754BE0((uint64_t)v10, v20 + v14);
  uint64_t v22 = v31;
  uint64_t v21 = v32;
  uint64_t v23 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v33, v13, v32);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBED0);
  uint64_t v25 = v23 + *(int *)(v24 + 52);
  uint64_t v26 = v23;
  uint64_t v28 = v34;
  uint64_t v27 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v25, v5, v35);
  uint64_t v29 = (uint64_t (**)(uint64_t))(v26 + *(int *)(v24 + 56));
  *uint64_t v29 = sub_25F754ED8;
  v29[1] = (uint64_t (*)(uint64_t))v20;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v13, v21);
}

uint64_t sub_25F752D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v91 = a3;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBEE0) - 8;
  MEMORY[0x270FA5388](v90);
  uint64_t v89 = (uint64_t)v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_25F78B260();
  uint64_t v97 = *(void *)(v95 - 8);
  uint64_t v88 = *(void *)(v97 + 64);
  MEMORY[0x270FA5388](v95);
  uint64_t v94 = (char *)v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DragView();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBEE8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBEF0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBEF8) - 8;
  MEMORY[0x270FA5388](v83);
  uint64_t v93 = (uint64_t)v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF00) - 8;
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (uint64_t)v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF08);
  MEMORY[0x270FA5388](v87);
  uint64_t v86 = (uint64_t)v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = sub_25F78B600();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  uint64_t v79 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF10) + 44)];
  uint64_t v19 = *(int *)(v7 + 44);
  uint64_t v92 = a2;
  uint64_t v20 = *(void *)(a2 + v19);
  uint64_t v21 = *(void *)(v20 + 16);
  swift_bridgeObjectRetain();
  int64_t v22 = sub_25F756228(0, v21, v20);
  swift_bridgeObjectRelease();
  int64_t v102 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  sub_25F754B78(a2, (uint64_t)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v80 = ((v23 + 16) & ~v23) + v9;
  uint64_t v24 = (v23 + 16) & ~v23;
  uint64_t v82 = v24;
  uint64_t v81 = v23 | 7;
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = (char *)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F754BE0((uint64_t)v26, v25 + v24);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = sub_25F7565A0;
  *(void *)(v27 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF20);
  sub_25F73D9A4(&qword_26A7BBF28, &qword_26A7BBF18);
  uint64_t v28 = type metadata accessor for DraggableLocationItem();
  uint64_t v29 = type metadata accessor for TrainingManager();
  uint64_t v30 = sub_25F756FD8(&qword_26A7BBF30, (void (*)(uint64_t))type metadata accessor for DraggableLocationItem);
  uint64_t v31 = sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  uint64_t v98 = v28;
  uint64_t v99 = v29;
  uint64_t v100 = v30;
  uint64_t v101 = v31;
  swift_getOpaqueTypeConformance2();
  sub_25F78BD20();
  uint64_t v32 = sub_25F78BDE0();
  sub_25F752118(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v15, 0.0, 1, INFINITY, 0, v32, v33, &qword_26A7BBEE8, &qword_26A7BBEF0);
  sub_25F73D748((uint64_t)v12, &qword_26A7BBEE8);
  LOBYTE(v24) = sub_25F78B8B0();
  sub_25F78B110();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v42 = v93;
  sub_25F73D580((uint64_t)v15, v93, &qword_26A7BBEF0);
  uint64_t v43 = v42 + *(int *)(v83 + 44);
  *(unsigned char *)uint64_t v43 = v24;
  *(void *)(v43 + 8) = v35;
  *(void *)(v43 + 16) = v37;
  *(void *)(v43 + 24) = v39;
  *(void *)(v43 + 32) = v41;
  *(unsigned char *)(v43 + 40) = 0;
  sub_25F73D748((uint64_t)v15, &qword_26A7BBEF0);
  uint64_t v44 = v92;
  sub_25F754B78(v92, (uint64_t)v26);
  uint64_t v45 = v97;
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
  uint64_t v79 = (char *)(v97 + 16);
  uint64_t v83 = (uint64_t)v46;
  uint64_t v47 = v94;
  uint64_t v48 = v95;
  v46(v94, v96, v95);
  uint64_t v49 = *(unsigned __int8 *)(v45 + 80);
  uint64_t v50 = v45;
  uint64_t v51 = (v80 + v49) & ~v49;
  v88 += v51;
  uint64_t KeyPath = v51;
  v77[1] = v81 | v49;
  uint64_t v52 = swift_allocObject();
  uint64_t v53 = v82;
  sub_25F754BE0((uint64_t)v26, v52 + v82);
  long long v54 = *(void (**)(uint64_t, char *, uint64_t))(v50 + 32);
  uint64_t v97 = v50 + 32;
  v77[0] = v54;
  v54(v52 + v51, v47, v48);
  uint64_t v55 = v93;
  uint64_t v56 = v84;
  sub_25F73D580(v93, v84, &qword_26A7BBEF8);
  char v57 = (uint64_t (**)())(v56 + *(int *)(v85 + 44));
  *char v57 = sub_25F7566A8;
  v57[1] = (uint64_t (*)())v52;
  v57[2] = 0;
  v57[3] = 0;
  sub_25F73D748(v55, &qword_26A7BBEF8);
  sub_25F754B78(v44, (uint64_t)v26);
  uint64_t v58 = swift_allocObject();
  uint64_t v59 = v53;
  uint64_t v60 = (uint64_t)v26;
  sub_25F754BE0((uint64_t)v26, v58 + v53);
  uint64_t v61 = sub_25F78BDE0();
  uint64_t v63 = v62;
  uint64_t v64 = v89;
  sub_25F73D580(v56, v89, &qword_26A7BBF00);
  unint64_t v65 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v64 + *(int *)(v90 + 44));
  double *v65 = sub_25F757194;
  v65[1] = 0;
  v65[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v61;
  v65[3] = v63;
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = sub_25F75693C;
  *(void *)(v66 + 24) = v58;
  uint64_t v67 = v86;
  sub_25F73D580(v64, v86, &qword_26A7BBEE0);
  uint64_t v68 = (uint64_t (**)(double *))(v67 + *(int *)(v87 + 36));
  *uint64_t v68 = sub_25F7569B4;
  v68[1] = (uint64_t (*)(double *))v66;
  sub_25F73D748(v64, &qword_26A7BBEE0);
  sub_25F73D748(v56, &qword_26A7BBF00);
  uint64_t v69 = v96;
  sub_25F78B240();
  uint64_t v98 = v70;
  uint64_t v99 = v71;
  sub_25F754B78(v92, v60);
  unint64_t v72 = v94;
  uint64_t v73 = v69;
  uint64_t v74 = v95;
  ((void (*)(char *, uint64_t, uint64_t))v83)(v94, v73, v95);
  uint64_t v75 = swift_allocObject();
  sub_25F754BE0(v60, v75 + v59);
  ((void (*)(uint64_t, char *, uint64_t))v77[0])(v75 + KeyPath, v72, v74);
  type metadata accessor for CGSize(0);
  sub_25F756D20();
  sub_25F756FD8(&qword_26A7BBF88, type metadata accessor for CGSize);
  sub_25F78BB80();
  swift_release();
  return sub_25F73D748(v67, &qword_26A7BBF08);
}

uint64_t sub_25F7536F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v55 = a2;
  uint64_t v56 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v43 - v11;
  uint64_t v13 = sub_25F78BF90();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v49 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for DraggableLocationItem();
  MEMORY[0x270FA5388](v52);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF20);
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v50 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (int *)type metadata accessor for DragView();
  uint64_t v20 = (uint64_t *)(a4 + v19[7]);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *(void *)&long long v57 = v22;
  *((void *)&v57 + 1) = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBED8);
  sub_25F78BCA0();
  uint64_t v47 = *((void *)&v60 + 1);
  uint64_t v48 = v60;
  uint64_t v46 = v61;
  uint64_t v23 = (uint64_t *)(a4 + v19[8]);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *(void *)&long long v57 = v25;
  *((void *)&v57 + 1) = v24;
  sub_25F78BCA0();
  uint64_t v44 = *((void *)&v60 + 1);
  uint64_t v45 = v60;
  uint64_t v43 = v61;
  uint64_t v26 = (long long *)(a4 + v19[6]);
  uint64_t v27 = *((void *)v26 + 4);
  long long v28 = v26[1];
  long long v57 = *v26;
  long long v58 = v28;
  uint64_t v59 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF90);
  sub_25F78BCA0();
  uint64_t v29 = qword_26A7BB630;
  swift_bridgeObjectRetain();
  if (v29 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v30 = qword_26A7BE390;
  if (*(void *)(qword_26A7BE390 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = v55;
    unint64_t v32 = sub_25F754FDC(v55, a3);
    if (v33)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, *(void *)(v30 + 56) + *(void *)(v14 + 72) * v32, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    swift_bridgeObjectRetain();
    uint64_t v31 = v55;
  }
  sub_25F757020((uint64_t)v12, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13) == 1)
  {
    uint64_t v34 = (uint64_t)v49;
    sub_25F78BF80();
    sub_25F73D748((uint64_t)v10, &qword_26A7BB9D8);
  }
  else
  {
    uint64_t v34 = (uint64_t)v49;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v49, v10, v13);
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  type metadata accessor for TrainingManager();
  sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  uint64_t v35 = sub_25F78B190();
  *((void *)&v42 + 1) = v31;
  *(void *)&long long v42 = v54;
  BYTE4(v41) = 0;
  LODWORD(v41) = 0x10000;
  sub_25F7757C8(v35, v36 & 1, v48, v47, v46, v45, v44, v43, (uint64_t)v17, &v60, v41, v42, a3, v34);
  char v37 = *(unsigned char *)(a4 + v19[5] + 8);
  uint64_t v38 = swift_retain();
  sub_25F76A324(v38, v37);
  swift_release();
  sub_25F756FD8(&qword_26A7BBF30, (void (*)(uint64_t))type metadata accessor for DraggableLocationItem);
  uint64_t v39 = v50;
  sub_25F78BAB0();
  swift_release();
  sub_25F757088((uint64_t)v17);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v51 + 32))(v56, v39, v53);
}

uint64_t sub_25F753CB8(uint64_t a1)
{
  uint64_t v2 = sub_25F78B710();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DragView();
  char v7 = *(unsigned char *)(a1 + *(int *)(v6 + 20) + 8);
  uint64_t v8 = swift_retain();
  uint64_t v9 = sub_25F76A324(v8, v7);
  swift_release();
  *(unsigned char *)(v9 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 2;
  swift_release();
  sub_25F78B750();
  sub_25F78B250();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v18 = (long long *)(a1 + *(int *)(v6 + 24));
  uint64_t v19 = *((void *)v18 + 4);
  long long v20 = v18[1];
  long long v23 = *v18;
  long long v24 = v20;
  uint64_t v25 = v19;
  v22[0] = v11;
  v22[1] = v13;
  v22[2] = v15;
  v22[3] = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF90);
  return sub_25F78BC90();
}

uint64_t sub_25F753E5C(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = sub_25F78B730();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v36 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v34[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v39 = &v34[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = &v34[-v16];
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v34[-v18];
  uint64_t v37 = type metadata accessor for DragView();
  uint64_t v20 = a1 + *(int *)(v37 + 20);
  char v21 = *(unsigned char *)(v20 + 8);
  uint64_t v22 = swift_retain();
  uint64_t v40 = sub_25F76A324(v22, v21);
  swift_release();
  uint64_t v38 = a1;
  sub_25F76AB88((uint64_t)v19);
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v17, *MEMORY[0x263F19F00], v5);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
  uint64_t v23 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_25F73D580((uint64_t)v19, (uint64_t)v11, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v17, v23, &qword_26A7BB8A0);
  long long v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v24((uint64_t)v11, 1, v5) != 1)
  {
    sub_25F73D580((uint64_t)v11, (uint64_t)v39, &qword_26A7BB8A0);
    if (v24(v23, 1, v5) != 1)
    {
      uint64_t v25 = v36;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 32))(v36, v23, v5);
      sub_25F756FD8(&qword_26A7BB998, MEMORY[0x263F19F18]);
      uint64_t v26 = v39;
      int v35 = sub_25F78BF70();
      uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
      v27(v25, v5);
      sub_25F73D748((uint64_t)v17, &qword_26A7BB8A0);
      sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
      v27(v26, v5);
      sub_25F73D748((uint64_t)v11, &qword_26A7BB8A0);
      if (v35) {
        goto LABEL_8;
      }
LABEL_9:
      double v29 = a3 * 0.5;
      double v28 = 373.0;
      goto LABEL_10;
    }
    sub_25F73D748((uint64_t)v17, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v39, v5);
LABEL_6:
    sub_25F73D748((uint64_t)v11, &qword_26A7BB990);
    goto LABEL_9;
  }
  sub_25F73D748((uint64_t)v17, &qword_26A7BB8A0);
  sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
  if (v24(v23, 1, v5) != 1) {
    goto LABEL_6;
  }
  sub_25F73D748((uint64_t)v11, &qword_26A7BB8A0);
LABEL_8:
  double v28 = *(double *)(v38 + *(int *)(v37 + 40)) * 0.5;
  double v29 = a3 * 0.5;
LABEL_10:
  *(double *)(v40 + 64) = v28 - v29;
  swift_release();
  char v30 = *(unsigned char *)(v20 + 8);
  uint64_t v31 = swift_retain();
  uint64_t v32 = sub_25F76A324(v31, v30);
  swift_release();
  *(double *)(v32 + 56) = v29;
  return swift_release();
}

uint64_t sub_25F7542FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_25F78B710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78B750();
  sub_25F78B250();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v16 = (long long *)(a3 + *(int *)(type metadata accessor for DragView() + 24));
  uint64_t v17 = *((void *)v16 + 4);
  long long v18 = v16[1];
  long long v21 = *v16;
  long long v22 = v18;
  uint64_t v23 = v17;
  v20[0] = v9;
  v20[1] = v11;
  v20[2] = v13;
  v20[3] = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBF90);
  return sub_25F78BC90();
}

uint64_t sub_25F754448(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DragView();
  uint64_t v9 = a1 + *(int *)(v8 + 20);
  char v10 = *(unsigned char *)(v9 + 8);
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_25F76A324(v11, v10);
  swift_release();
  swift_getKeyPath();
  uint64_t v30 = v12;
  v26[1] = sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  int v13 = *(unsigned __int8 *)(v12 + 51);
  uint64_t result = swift_release();
  if (v13 == 1)
  {
    uint64_t v15 = (void *)sub_25F78C100();
    v15[2] = 3;
    v15[5] = 0;
    v15[6] = 0;
    v15[4] = 0;
    uint64_t v16 = (uint64_t *)(a1 + *(int *)(v8 + 32));
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v30 = v18;
    uint64_t v31 = v17;
    double v29 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBED8);
    sub_25F78BC90();
    uint64_t v19 = swift_retain();
    sub_25F76A324(v19, v10);
    swift_release();
    sub_25F78BF80();
    uint64_t v21 = v27;
    uint64_t v20 = v28;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v4, 1, 1, v28);
    sub_25F763E6C((uint64_t)v7, 0, (uint64_t)v4);
    swift_release();
    sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
    char v22 = *(unsigned char *)(v9 + 8);
    uint64_t v23 = swift_retain();
    uint64_t v24 = sub_25F76A324(v23, v22);
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    v26[-2] = v24;
    LOBYTE(v26[-1]) = 0;
    uint64_t v30 = v24;
    sub_25F78B030();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F7547B4(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + *(int *)(type metadata accessor for DragView() + 20) + 8);
  uint64_t v3 = swift_retain();
  sub_25F76A324(v3, v2);
  swift_release();
  swift_getKeyPath();
  sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B030();
  swift_release();
  return swift_release();
}

void sub_25F7548C0(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  char v2 = (int *)type metadata accessor for DragView();
  uint64_t v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  *(void *)uint64_t v3 = sub_25F78B190();
  v3[8] = v4 & 1;
  uint64_t v5 = (char *)a1 + v2[6];
  type metadata accessor for CGRect(0);
  memset(v26, 0, sizeof(v26));
  sub_25F78BC70();
  uint64_t v6 = v29;
  long long v7 = v28;
  *(_OWORD *)uint64_t v5 = v27;
  *((_OWORD *)v5 + 1) = v7;
  *((void *)v5 + 4) = v6;
  uint64_t v8 = (uint64_t *)((char *)a1 + v2[7]);
  uint64_t v9 = (void *)sub_25F78C100();
  v9[2] = 3;
  v9[5] = 0;
  v9[6] = 0;
  v9[4] = 0;
  *(void *)&v26[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFD0);
  sub_25F78BC70();
  uint64_t v10 = *((void *)&v27 + 1);
  *uint64_t v8 = v27;
  v8[1] = v10;
  uint64_t v11 = (uint64_t *)((char *)a1 + v2[8]);
  uint64_t v12 = (void *)sub_25F78C100();
  objc_super v12[2] = 3;
  v12[5] = 0;
  v12[6] = 0;
  v12[4] = 0;
  *(void *)&v26[0] = v12;
  sub_25F78BC70();
  uint64_t v13 = *((void *)&v27 + 1);
  *uint64_t v11 = v27;
  v11[1] = v13;
  if (qword_26A7BB630 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_25F75531C(v14);
  swift_bridgeObjectRelease();
  *(void *)&v26[0] = v15;
  swift_retain();
  sub_25F7552B0((uint64_t *)v26);
  swift_release();
  *(uint64_t *)((char *)a1 + v2[9]) = *(void *)&v26[0];
  uint64_t v16 = v2[10];
  id v17 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v17, sel_bounds);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v30.origin.x = v19;
  v30.origin.y = v21;
  v30.size.width = v23;
  v30.size.height = v25;
  *(CGFloat *)((char *)a1 + v16) = CGRectGetHeight(v30);
}

uint64_t sub_25F754B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DragView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F754BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DragView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F754C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F752D40(a1, v6, a2);
}

uint64_t sub_25F754CC4(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_25F754CF0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F756FD8((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 51);
  return result;
}

uint64_t sub_25F754D98()
{
  return swift_release();
}

uint64_t sub_25F754E74()
{
  uint64_t v1 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25F754448(v2);
}

uint64_t sub_25F754ED8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25F7547B4(a1, v4);
}

unint64_t sub_25F754F48(uint64_t a1)
{
  sub_25F78BFD0();
  sub_25F78C450();
  sub_25F78C020();
  uint64_t v2 = sub_25F78C470();
  swift_bridgeObjectRelease();
  return sub_25F755054(a1, v2);
}

unint64_t sub_25F754FDC(uint64_t a1, uint64_t a2)
{
  sub_25F78C450();
  sub_25F78C020();
  uint64_t v4 = sub_25F78C470();
  return sub_25F7551CC(a1, a2, v4);
}

unint64_t sub_25F755054(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_25F78BFD0();
    uint64_t v8 = v7;
    if (v6 == sub_25F78BFD0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_25F78C410();
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
          uint64_t v13 = sub_25F78BFD0();
          uint64_t v15 = v14;
          if (v13 == sub_25F78BFD0() && v15 == v16) {
            break;
          }
          char v18 = sub_25F78C410();
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

unint64_t sub_25F7551CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25F78C410() & 1) == 0)
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
      while (!v14 && (sub_25F78C410() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25F7552B0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25F757120(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_25F755404(v5);
  *a1 = v2;
  return result;
}

void *sub_25F75531C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB748);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_25F756028((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25F757134();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_25F755404(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25F78C3F0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_25F755AF0(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  int64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      BOOL v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_25F755BC0((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_25F756014((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_25F78C100();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  BOOL v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    BOOL v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    id v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_25F78C410();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    CGFloat v21 = (void *)(v103 + 16 * v20);
    do
    {
      CGFloat v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_25F78C410()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v11 = sub_25F755E5C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      BOOL v11 = sub_25F755E5C((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    long long v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          long long v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        double v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_25F755BC0((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        BOOL v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        long long v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      char v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_25F78C410() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
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
  uint64_t result = sub_25F78C370();
  __break(1u);
  return result;
}

uint64_t sub_25F755AF0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_25F78C410(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25F755BC0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      id v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        char v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_25F78C410() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)char v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)char v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    BOOL v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_25F78C410() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_25F755F58((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_25F78C3C0();
  __break(1u);
  return result;
}

char *sub_25F755E5C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFD8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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

char *sub_25F755F58(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_25F78C3C0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_25F756014(uint64_t a1)
{
  return sub_25F755E5C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25F756028(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    void *v5 = a4;
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

int64_t sub_25F756228(int64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v3 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v5 = a2;
  int64_t v6 = result;
  unint64_t v7 = *(void *)(a3 + 16);
  if ((uint64_t)v7 >= v3) {
    uint64_t v8 = a2 - result;
  }
  else {
    uint64_t v8 = *(void *)(a3 + 16);
  }
  if (v8 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFA8);
    unint64_t v9 = (void *)swift_allocObject();
    uint64_t result = _swift_stdlib_malloc_size(v9);
    uint64_t v10 = (result - 32) / 24;
    v9[2] = v8;
    v9[3] = 2 * v10;
    if (v5 < v6)
    {
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    if (!v7)
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if (v8 - 1 >= v7)
    {
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    uint64_t v11 = 0;
    uint64_t v12 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - v8;
    uint64_t v13 = (uint64_t *)(a3 + 40);
    int64_t v14 = v9 + 7;
    while (v3 != v11)
    {
      if (v7 == v11) {
        goto LABEL_54;
      }
      uint64_t v16 = *(v13 - 1);
      uint64_t v15 = *v13;
      *(v14 - 3) = v6 + v11;
      *(v14 - 2) = v16;
      *(v14 - 1) = v15;
      if (v8 - 1 == v11) {
        goto LABEL_15;
      }
      uint64_t result = swift_bridgeObjectRetain();
      ++v11;
      v13 += 2;
      v14 += 3;
      if (v6 + v11 < v6)
      {
        __break(1u);
LABEL_15:
        uint64_t result = swift_bridgeObjectRetain();
        if (v3 - 1 == v11) {
          goto LABEL_47;
        }
        uint64_t v17 = v6 + v11 + 1;
        uint64_t v5 = a2;
        if (a2 < v6) {
          goto LABEL_52;
        }
        goto LABEL_17;
      }
    }
    goto LABEL_53;
  }
  if (v8 < 0)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  unint64_t v9 = (void *)MEMORY[0x263F8EE78];
  uint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 24) >> 1;
  if (result == a2) {
    goto LABEL_47;
  }
  int64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
  uint64_t v17 = result;
  if (a2 < result)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
LABEL_17:
  if (v17 < v6)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v17 >= v5)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if ((uint64_t)v7 <= v3)
  {
LABEL_47:
    unint64_t v33 = v9[3];
    if (v33 >= 2)
    {
      unint64_t v34 = v33 >> 1;
      BOOL v22 = __OFSUB__(v34, v12);
      unint64_t v35 = v34 - v12;
      if (v22)
      {
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      v9[2] = v35;
    }
    return (int64_t)v9;
  }
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v37 = v7 - v8;
  if (v7 > v8)
  {
    uint64_t v18 = 0;
    uint64_t v38 = ~v17 + v5;
    int64_t v19 = (uint64_t *)(result + 16 * v8 + 40);
    do
    {
      uint64_t v20 = *(v19 - 1);
      uint64_t v21 = *v19;
      if (v12)
      {
        uint64_t result = swift_bridgeObjectRetain();
        BOOL v22 = __OFSUB__(v12--, 1);
        if (v22) {
          goto LABEL_55;
        }
      }
      else
      {
        unint64_t v23 = v9[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_57;
        }
        int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v24;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFA8);
        uint64_t v26 = (void *)swift_allocObject();
        uint64_t v27 = (uint64_t)(_swift_stdlib_malloc_size(v26) - 32) / 24;
        _OWORD v26[2] = v25;
        v26[3] = 2 * v27;
        uint64_t v28 = v26 + 4;
        uint64_t v29 = v9[3] >> 1;
        int64_t v14 = &v26[3 * v29 + 4];
        uint64_t v30 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
        if (v9[2])
        {
          if (v26 != v9 || v28 >= &v9[3 * v29 + 4]) {
            memmove(v28, v9 + 4, 24 * v29);
          }
          swift_bridgeObjectRetain();
          v9[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        uint64_t result = swift_release();
        unint64_t v9 = v26;
        uint64_t v5 = a2;
        BOOL v22 = __OFSUB__(v30, 1);
        uint64_t v12 = v30 - 1;
        if (v22) {
          goto LABEL_55;
        }
      }
      *int64_t v14 = v17 + v18;
      v14[1] = v20;
      v14[2] = v21;
      if (v38 == v18) {
        break;
      }
      uint64_t v32 = v17 + v18 + 1;
      if (v32 < v6 || v32 >= v5) {
        goto LABEL_56;
      }
      v19 += 2;
      v14 += 3;
      ++v18;
    }
    while (v37 != v18);
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_47;
  }
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_25F7565A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v10 = v4 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return sub_25F7536F4(a1, a2, a3, v10, a4);
}

uint64_t sub_25F756638()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F756670(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

uint64_t sub_25F7566A8()
{
  uint64_t v1 = *(void *)(type metadata accessor for DragView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_25F78B260();
  return sub_25F753CB8(v0 + v2);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F75693C(double a1, double a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F753E5C(v6, a1, a2);
}

uint64_t sub_25F7569B4(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for DragView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v11 = *(void *)(v1 + 64);
  uint64_t v12 = sub_25F78B260();
  uint64_t v4 = *(void *)(v12 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v3, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v3, v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = (v3 + v11 + v5) & ~v5;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v9, v12);
  return MEMORY[0x270FA0238](v0, v9 + v6, v2 | v5 | 7);
}

uint64_t sub_25F756C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for DragView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_25F78B260();
  return sub_25F7542FC(a1, a2, v2 + v6);
}

unint64_t sub_25F756D20()
{
  unint64_t result = qword_26A7BBF38;
  if (!qword_26A7BBF38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBF08);
    sub_25F756DC0();
    sub_25F73D9A4(&qword_26A7BBF78, &qword_26A7BBF80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBF38);
  }
  return result;
}

unint64_t sub_25F756DC0()
{
  unint64_t result = qword_26A7BBF40;
  if (!qword_26A7BBF40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBEE0);
    sub_25F756EBC(&qword_26A7BBF48, &qword_26A7BBF00, (void (*)(void))sub_25F756E8C);
    sub_25F73D9A4(&qword_26A7BBF68, &qword_26A7BBF70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBF40);
  }
  return result;
}

uint64_t sub_25F756E8C()
{
  return sub_25F756EBC(&qword_26A7BBF50, &qword_26A7BBEF8, (void (*)(void))sub_25F756F38);
}

uint64_t sub_25F756EBC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25F756F38()
{
  unint64_t result = qword_26A7BBF58;
  if (!qword_26A7BBF58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBEF0);
    sub_25F73D9A4(&qword_26A7BBF60, &qword_26A7BBEE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BBF58);
  }
  return result;
}

uint64_t sub_25F756FD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F757020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F757088(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DraggableLocationItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F7570E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F757120(uint64_t a1)
{
  return sub_25F7883B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25F757134()
{
  return swift_release();
}

uint64_t sub_25F75713C()
{
  return sub_25F73D9A4(&qword_26A7BBFE0, &qword_26A7BBED0);
}

uint64_t sub_25F75717C()
{
  return sub_25F74F3C4();
}

uint64_t sub_25F757194@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25F78BBC0();
  uint64_t result = sub_25F78B240();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

void sub_25F7571E4()
{
  xmmword_26A7BBFE8 = 0uLL;
}

double sub_25F7571F4@<D0>(_OWORD *a1@<X8>)
{
  if (qword_26A7BB638 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_26A7BBFE8;
  *a1 = xmmword_26A7BBFE8;
  return result;
}

unint64_t sub_25F757258(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC008);
  uint64_t v2 = sub_25F78C3B0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25F73D580(v6, (uint64_t)&v13, &qword_26A7BC010);
    uint64_t v7 = v13;
    unint64_t result = sub_25F754F48(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25F7584E8(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

unint64_t sub_25F757388(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFA0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFF8);
  uint64_t v6 = sub_25F78C3B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25F73D580(v12, (uint64_t)v5, &qword_26A7BBFA0);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_25F754FDC(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_25F78BF90();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
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

unint64_t sub_25F757588(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC000);
  uint64_t v2 = (void *)sub_25F78C3B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25F754FDC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

uint64_t TryItAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17 = swift_allocObject();
  TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v17;
}

uint64_t TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_OWORD *)(v10 + 64) = 0u;
  *(_OWORD *)(v10 + 80) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  *(void *)(v10 + 32) = a3;
  *(void *)(v10 + 40) = a4;
  swift_bridgeObjectRelease();
  *(void *)(v10 + 48) = a5;
  *(void *)(v10 + 56) = a6;
  swift_bridgeObjectRelease();
  *(void *)(v10 + 64) = a7;
  *(void *)(v10 + 72) = a8;
  swift_bridgeObjectRelease();
  *(void *)(v10 + 80) = a9;
  *(void *)(v10 + 88) = a10;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_25F7577D8()
{
  uint64_t v1 = v0;
  unint64_t v2 = sub_25F757588(MEMORY[0x263F8EE78]);
  unint64_t v15 = v2;
  if (v0[5])
  {
    unint64_t v3 = v2;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25F78BFA0();
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_25F758148(v4, 0x64695F706974, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    unint64_t v15 = v3;
    swift_bridgeObjectRelease();
    if (v1[7]) {
      goto LABEL_3;
    }
  }
  else
  {

    if (v0[7])
    {
LABEL_3:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_25F78BFA0();
      swift_bridgeObjectRelease();
      char v7 = swift_isUniquelyReferenced_nonNull_native();
      sub_25F758148(v6, 0xD000000000000012, 0x800000025F78F0C0, v7);
      swift_bridgeObjectRelease();
      if (v1[9]) {
        goto LABEL_4;
      }
LABEL_8:

      if (v1[11]) {
        goto LABEL_5;
      }
LABEL_9:

      goto LABEL_10;
    }
  }

  if (!v1[9]) {
    goto LABEL_8;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25F78BFA0();
  swift_bridgeObjectRelease();
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v8, 0x697463656C6C6F63, 0xED000044495F6E6FLL, v9);
  swift_bridgeObjectRelease();
  if (!v1[11]) {
    goto LABEL_9;
  }
LABEL_5:
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25F78BFA0();
  swift_bridgeObjectRelease();
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v10, 0x495F6E6F7373656CLL, 0xE900000000000044, v11);
  swift_bridgeObjectRelease();
LABEL_10:
  objc_msgSend(self, sel_isSeniorUser);
  uint64_t v12 = sub_25F78C110();
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v12, 0x67616C665F353675, 0xE800000000000000, v13);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t TryItAnalyticsEvent.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TryItAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t sub_25F757B90(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25F754FDC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25F758334();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_25F757F70(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25F757C60(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC000);
  char v38 = a2;
  uint64_t v6 = sub_25F78C3A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_25F78C450();
    sub_25F78C020();
    uint64_t result = sub_25F78C470();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_25F757F70(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25F78C2F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25F78C450();
        swift_bridgeObjectRetain();
        sub_25F78C020();
        uint64_t v9 = sub_25F78C470();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_25F758148(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25F754FDC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_25F758334();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_25F757C60(v15, a4 & 1);
  unint64_t v20 = sub_25F754FDC(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_25F78C420();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for TryItAnalyticsEvent()
{
  return self;
}

uint64_t method lookup function for TryItAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TryItAnalyticsEvent);
}

uint64_t dispatch thunk of TryItAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of TryItAnalyticsEvent.eventRepresentation()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

id sub_25F758334()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC000);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F78C390();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

_OWORD *sub_25F7584E8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25F7584F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v71 = a1;
  uint64_t v2 = sub_25F78B0F0();
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v68 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_25F78B0B0();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v58 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PinchZoomView();
  uint64_t v73 = *(void *)(v5 - 8);
  uint64_t v56 = *(void *)(v73 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v54 = (uint64_t)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78B0D0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC038);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC040);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC048);
  uint64_t v12 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  unint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC050);
  MEMORY[0x270FA5388](v53);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC058);
  uint64_t v62 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  BOOL v55 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC060);
  uint64_t v67 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  long long v57 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC068);
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v59 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  sub_25F78BCA0();
  uint64_t v20 = sub_25F78B080();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  sub_25F78B0C0();
  sub_25F78B070();
  uint64_t v74 = v1;
  uint64_t v21 = v54;
  sub_25F759B28(v1, v54);
  uint64_t v22 = *(unsigned __int8 *)(v73 + 80);
  uint64_t v72 = (v22 + 16) & ~v22;
  uint64_t v73 = v72 + v56;
  uint64_t v23 = v72;
  uint64_t v56 = v22 | 7;
  uint64_t v24 = swift_allocObject();
  sub_25F759B90(v21, v24 + v23);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v51 = v16;
  unint64_t v26 = v14;
  BOOL v27 = v14;
  uint64_t v28 = v52;
  v25(v16, v27, v52);
  uint64_t v29 = v53;
  uint64_t v30 = (uint64_t (**)())&v16[*(int *)(v53 + 36)];
  *uint64_t v30 = sub_25F759BF4;
  v30[1] = (uint64_t (*)())v24;
  v30[2] = 0;
  v30[3] = 0;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v26, v28);
  uint64_t v31 = v58;
  sub_25F78BC80();
  sub_25F78B090();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v63);
  sub_25F759C0C((uint64_t)v79, (uint64_t)v80);
  uint64_t v32 = v81;
  uint64_t v33 = v82;
  if (v83)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }
  uint64_t v75 = v32;
  uint64_t v76 = v33;
  LOBYTE(v77) = v83;
  sub_25F759B28(v1, v21);
  uint64_t v34 = swift_allocObject();
  uint64_t v35 = v72;
  sub_25F759B90(v21, v34 + v72);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC078);
  unint64_t v37 = sub_25F759C90();
  unint64_t v38 = sub_25F759D68();
  BOOL v39 = v55;
  uint64_t v40 = (uint64_t)v51;
  sub_25F78BB90();
  swift_release();
  sub_25F73D748(v40, &qword_26A7BC050);
  unint64_t v41 = v68;
  sub_25F78B0E0();
  sub_25F759B28(v74, v21);
  uint64_t v42 = swift_allocObject();
  sub_25F759B90(v21, v42 + v35);
  uint64_t v75 = v29;
  uint64_t v76 = v36;
  unint64_t v77 = v37;
  unint64_t v78 = v38;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v44 = v57;
  uint64_t v45 = v60;
  sub_25F78BA30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v41, v70);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v45);
  sub_25F759B28(v74, v21);
  uint64_t v46 = swift_allocObject();
  sub_25F759B90(v21, v46 + v72);
  uint64_t v75 = v45;
  uint64_t v76 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v47 = v59;
  uint64_t v48 = v66;
  sub_25F78BAC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v44, v48);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v64 + 32))(v71, v47, v65);
}

uint64_t sub_25F758E84(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  sub_25F76A324(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_25F759FD4((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B030();
  swift_release();
  swift_release();
  uint64_t v3 = swift_retain();
  uint64_t v4 = sub_25F76A324(v3, v1);
  swift_release();
  *(unsigned char *)(v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 3;
  return swift_release();
}

uint64_t sub_25F758FC0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  uint64_t result = sub_25F78BC80();
  if ((v1 & 1) == 0) {
    return sub_25F78BC90();
  }
  return result;
}

uint64_t sub_25F759040(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  uint64_t result = sub_25F78BC80();
  if (v10 == 1)
  {
    char v3 = *(unsigned char *)(a1 + 8);
    uint64_t v4 = swift_retain();
    sub_25F76A324(v4, v3);
    swift_release();
    sub_25F763334(1, 1, 0);
    swift_release();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_25F76A324(v5, v3);
    uint64_t result = swift_release();
    uint64_t v7 = *(void *)(v6 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
    BOOL v8 = __OFADD__(v7, 1);
    uint64_t v9 = v7 + 1;
    if (v8)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v6 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v9;
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25F759128(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *(unsigned char *)(a1 + 8);
  uint64_t v10 = swift_retain();
  sub_25F76A324(v10, v9);
  swift_release();
  sub_25F78BF80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  sub_25F763E6C((uint64_t)v8, 1, (uint64_t)v4);
  swift_release();
  sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(a1) = *(unsigned char *)(a1 + 8);
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_25F76A324(v11, a1);
  uint64_t result = swift_release();
  uint64_t v14 = *(void *)(v12 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v12 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v16;
    return swift_release();
  }
  return result;
}

BOOL static MKCoordinateSpan.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

BOOL sub_25F759338(double *a1, double *a2)
{
  return a1[1] == a2[1] && *a1 == *a2;
}

void *sub_25F759354(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    char v5 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v5;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = a1 + v6;
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_25F78B0B0();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_retain();
    swift_retain();
    v10(v7, v8, v9);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
    *(void *)(v7 + *(int *)(v11 + 28)) = *(void *)(v8 + *(int *)(v11 + 28));
  }
  swift_retain();
  return v3;
}

uint64_t sub_25F759474(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25F78B0B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  return swift_release();
}

uint64_t sub_25F75950C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_25F78B0B0();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_retain();
  swift_retain();
  v9(v6, v7, v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  *(void *)(v6 + *(int *)(v10 + 28)) = *(void *)(v7 + *(int *)(v10 + 28));
  swift_retain();
  return a1;
}

uint64_t sub_25F7595E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25F78B0B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  *(void *)(v8 + *(int *)(v11 + 28)) = *(void *)(v9 + *(int *)(v11 + 28));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25F7596C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25F78B0B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  *(void *)(v5 + *(int *)(v8 + 28)) = *(void *)(v6 + *(int *)(v8 + 28));
  return a1;
}

uint64_t sub_25F759768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25F78B0B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  *(void *)(v8 + *(int *)(v11 + 28)) = *(void *)(v9 + *(int *)(v11 + 28));
  swift_release();
  return a1;
}

uint64_t sub_25F759834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F759848);
}

uint64_t sub_25F759848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_25F759908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F75991C);
}

uint64_t sub_25F75991C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PinchZoomView()
{
  uint64_t result = qword_26A7BC020;
  if (!qword_26A7BC020) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F759A14()
{
  sub_25F759AB4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25F759AB4()
{
  if (!qword_26A7BC030)
  {
    sub_25F78B0B0();
    unint64_t v0 = sub_25F78BCB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7BC030);
    }
  }
}

uint64_t sub_25F759B0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F759B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PinchZoomView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F759B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PinchZoomView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F759BF4()
{
  return sub_25F759F58(sub_25F758E84);
}

uint64_t sub_25F759C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F759C78()
{
  return sub_25F759F58((uint64_t (*)(uint64_t))sub_25F758FC0);
}

unint64_t sub_25F759C90()
{
  unint64_t result = qword_26A7BC080;
  if (!qword_26A7BC080)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC050);
    sub_25F759D0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC080);
  }
  return result;
}

unint64_t sub_25F759D0C()
{
  unint64_t result = qword_26A7BC088;
  if (!qword_26A7BC088)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC088);
  }
  return result;
}

unint64_t sub_25F759D68()
{
  unint64_t result = qword_26A7BC090;
  if (!qword_26A7BC090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC078);
    sub_25F759FD4(&qword_26A7BC098, type metadata accessor for MKCoordinateSpan);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC090);
  }
  return result;
}

uint64_t sub_25F759E10()
{
  return sub_25F759F58(sub_25F759040);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = (int *)(type metadata accessor for PinchZoomView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_25F78B0B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC018);
  swift_release();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25F759F40()
{
  return sub_25F759F58(sub_25F759128);
}

uint64_t sub_25F759F58(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for PinchZoomView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25F759FD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F75A01C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F75A10C()
{
  uint64_t v0 = sub_25F78AFB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25F78AF40();
  __swift_allocate_value_buffer(v4, qword_26A7BE398);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26A7BE398);
  if (qword_26A7BB688 != -1) {
    swift_once();
  }
  id v6 = objc_msgSend((id)qword_26A7BC948, sel_bundleURL);
  sub_25F78AF90();

  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 104))(v5, *MEMORY[0x263F06D20], v4);
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

uint64_t TipsTryItView.init(lesson:tipId:collectionId:correlationId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v30 = a6;
  uint64_t v28 = a2;
  uint64_t v13 = sub_25F78B9A0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (int *)type metadata accessor for TipsTryItView();
  uint64_t v18 = (uint64_t *)((char *)a8 + v17[5]);
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = (uint64_t *)((char *)a8 + v17[6]);
  uint64_t *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = 0x3FF8000000000000;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F1A6C8], v13);
  sub_25F75E9F0();
  sub_25F78B1B0();
  uint64_t v20 = (char *)a8 + v17[8];
  LOBYTE(v31) = 0;
  sub_25F78BC70();
  uint64_t v21 = v33;
  *uint64_t v20 = v32;
  *((void *)v20 + 1) = v21;
  uint64_t v22 = (uint64_t *)((char *)a8 + v17[9]);
  uint64_t v31 = 0;
  sub_25F78BC70();
  uint64_t v23 = v33;
  *uint64_t v22 = v32;
  v22[1] = v23;
  uint64_t v24 = (uint64_t *)((char *)a8 + v17[10]);
  uint64_t v31 = 0;
  sub_25F78BC70();
  uint64_t v25 = v33;
  *uint64_t v24 = v32;
  v24[1] = v25;
  uint64_t v26 = v17[11];
  type metadata accessor for TrainingManager();
  swift_allocObject();
  *(uint64_t *)((char *)a8 + v26) = sub_25F765CE4();
  swift_retain();
  sub_25F762BB4(a1, v28, a3, v29, a5, v30, a7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t TipsTryItView.init(lesson:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_25F78B9A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (int *)type metadata accessor for TipsTryItView();
  uint64_t v9 = (uint64_t *)((char *)a2 + v8[5]);
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (uint64_t *)((char *)a2 + v8[6]);
  *uint64_t v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = 0x3FF8000000000000;
  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1A6C8], v4);
  sub_25F75E9F0();
  sub_25F78B1B0();
  uint64_t v11 = (char *)a2 + v8[8];
  LOBYTE(v23) = 0;
  sub_25F78BC70();
  uint64_t v12 = v25;
  *uint64_t v11 = v24;
  *((void *)v11 + 1) = v12;
  uint64_t v13 = (uint64_t *)((char *)a2 + v8[9]);
  uint64_t v23 = 0;
  sub_25F78BC70();
  uint64_t v14 = v25;
  *uint64_t v13 = v24;
  v13[1] = v14;
  uint64_t v15 = (uint64_t *)((char *)a2 + v8[10]);
  uint64_t v23 = 0;
  sub_25F78BC70();
  uint64_t v16 = v25;
  uint64_t *v15 = v24;
  v15[1] = v16;
  uint64_t v17 = v8[11];
  type metadata accessor for TrainingManager();
  swift_allocObject();
  uint64_t v18 = sub_25F765CE4();
  *(uint64_t *)((char *)a2 + v17) = v18;
  swift_getKeyPath();
  uint64_t v21 = v18;
  uint64_t v22 = a1;
  uint64_t v24 = v18;
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  swift_retain();
  sub_25F78B030();
  swift_release();
  return swift_release();
}

uint64_t TipsTryItView.init(lessons:tipId:collectionId:correlationId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v30 = a6;
  uint64_t v28 = a2;
  uint64_t v13 = sub_25F78B9A0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (int *)type metadata accessor for TipsTryItView();
  uint64_t v18 = (uint64_t *)((char *)a8 + v17[5]);
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = (uint64_t *)((char *)a8 + v17[6]);
  uint64_t *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = 0x3FF8000000000000;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F1A6C8], v13);
  sub_25F75E9F0();
  sub_25F78B1B0();
  uint64_t v20 = (char *)a8 + v17[8];
  LOBYTE(v31) = 0;
  sub_25F78BC70();
  uint64_t v21 = v33;
  *uint64_t v20 = v32;
  *((void *)v20 + 1) = v21;
  uint64_t v22 = (uint64_t *)((char *)a8 + v17[9]);
  uint64_t v31 = 0;
  sub_25F78BC70();
  uint64_t v23 = v33;
  *uint64_t v22 = v32;
  v22[1] = v23;
  uint64_t v24 = (uint64_t *)((char *)a8 + v17[10]);
  uint64_t v31 = 0;
  sub_25F78BC70();
  uint64_t v25 = v33;
  *uint64_t v24 = v32;
  v24[1] = v25;
  uint64_t v26 = v17[11];
  type metadata accessor for TrainingManager();
  swift_allocObject();
  *(uint64_t *)((char *)a8 + v26) = sub_25F765CE4();
  swift_retain();
  sub_25F762E54(a1, v28, a3, v29, a5, v30, a7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall TipsTryItView.logEndSession()()
{
}

uint64_t TipsTryItView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v18 = sub_25F78B7A0();
  uint64_t v2 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v1;
  v17[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0C0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0C8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0D0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0D8);
  uint64_t v12 = sub_25F73D9A4(&qword_26A7BC0E0, &qword_26A7BC0D0);
  uint64_t v13 = sub_25F760E2C(&qword_26A7BC0E8, &qword_26A7BC0D8, (void (*)(void))sub_25F75EA70);
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v9;
  uint64_t v22 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_25F78B2F0();
  sub_25F78B790();
  sub_25F73D9A4(&qword_26A7BC110, &qword_26A7BC0B8);
  sub_25F761FC0(&qword_26A7BC118, MEMORY[0x263F1A128]);
  uint64_t v15 = v18;
  sub_25F78BA40();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25F75AED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC108);
  uint64_t v54 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v53 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0F8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0D8);
  MEMORY[0x270FA5388](v56);
  uint64_t v52 = (uint64_t)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TipsTryItView();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0C8);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v58 = v13;
  uint64_t v59 = v14;
  MEMORY[0x270FA5388](v13);
  BOOL v55 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25F78B600();
  sub_25F76106C(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  sub_25F7606E0((uint64_t)v12, v18 + v17);
  uint64_t v61 = v16;
  uint64_t v62 = 0;
  LOBYTE(v63) = 1;
  uint64_t v64 = sub_25F760744;
  uint64_t v65 = v18;
  sub_25F76106C(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  uint64_t v19 = swift_allocObject();
  sub_25F7606E0((uint64_t)v12, v19 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC168);
  sub_25F7607E0();
  uint64_t v20 = v53;
  sub_25F78BCD0();
  LOBYTE(v12) = sub_25F78B910();
  sub_25F78B110();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v29 = v54;
  uint64_t v30 = v57;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v7, v20, v57);
  uint64_t v31 = &v7[*(int *)(v5 + 44)];
  *uint64_t v31 = (char)v12;
  *((void *)v31 + 1) = v22;
  *((void *)v31 + 2) = v24;
  *((void *)v31 + 3) = v26;
  *((void *)v31 + 4) = v28;
  v31[40] = 0;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v30);
  LOBYTE(v5) = sub_25F78B8E0();
  sub_25F78B110();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v40 = v52;
  sub_25F73D580((uint64_t)v7, v52, &qword_26A7BC0F8);
  uint64_t v41 = v56;
  uint64_t v42 = v40 + *(int *)(v56 + 36);
  *(unsigned char *)uint64_t v42 = v5;
  *(void *)(v42 + 8) = v33;
  *(void *)(v42 + 16) = v35;
  *(void *)(v42 + 24) = v37;
  *(void *)(v42 + 32) = v39;
  *(unsigned char *)(v42 + 40) = 0;
  sub_25F73D748((uint64_t)v7, &qword_26A7BC0F8);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0D0);
  uint64_t v44 = sub_25F73D9A4(&qword_26A7BC0E0, &qword_26A7BC0D0);
  uint64_t v45 = sub_25F760E2C(&qword_26A7BC0E8, &qword_26A7BC0D8, (void (*)(void))sub_25F75EA70);
  uint64_t v46 = v55;
  uint64_t v47 = v41;
  sub_25F78BB10();
  sub_25F73D748(v40, &qword_26A7BC0D8);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1C8);
  sub_25F78B3B0();
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_25F78D770;
  sub_25F78B3A0();
  uint64_t v61 = v43;
  uint64_t v62 = v47;
  uint64_t v63 = v44;
  uint64_t v64 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v45;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v50 = v58;
  MEMORY[0x2611FDEB0](2, v48, v58, OpaqueTypeConformance2);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v46, v50);
}

uint64_t sub_25F75B4D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_25F78BDE0();
  a3[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1D8);
  return sub_25F75B52C(a1, a2, (char *)a3 + *(int *)(v7 + 44));
}

uint64_t sub_25F75B52C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v99 = a3;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1E0);
  MEMORY[0x270FA5388](v92);
  unint64_t v89 = (uint64_t *)((char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1E8);
  uint64_t v95 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v90 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1F0) - 8;
  MEMORY[0x270FA5388](v93);
  uint64_t v91 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1F8) - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v98);
  uint64_t v94 = (uint64_t)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v97 = (uint64_t)&v76 - v10;
  uint64_t v11 = type metadata accessor for TipsTryItView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v88 = v11 - 8;
  uint64_t v104 = v12;
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = sub_25F78B700();
  MEMORY[0x270FA5388](v14);
  uint64_t v78 = sub_25F78B170();
  uint64_t v15 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  unint64_t v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC200);
  uint64_t v81 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC208);
  uint64_t v83 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  unint64_t v77 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC210);
  uint64_t v87 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  uint64_t v79 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC218);
  uint64_t v106 = *(void *)(v22 - 8);
  uint64_t v107 = v22;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v105 = (char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v84 = (char *)&v76 - v25;
  uint64_t v85 = a1;
  sub_25F78B240();
  sub_25F78B240();
  sub_25F78BDE0();
  sub_25F78B220();
  *(void *)&long long v108 = v113;
  BYTE8(v108) = v114;
  *(void *)&long long v109 = v115;
  BYTE8(v109) = v116;
  long long v110 = v117;
  long long v111 = xmmword_25F78D780;
  uint64_t v112 = 0;
  sub_25F78B740();
  sub_25F78B150();
  uint64_t v103 = type metadata accessor for TipsTryItView;
  uint64_t v26 = a2;
  uint64_t v76 = a2;
  uint64_t v100 = (uint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F76106C(a2, v100, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  uint64_t v27 = *(unsigned __int8 *)(v104 + 80);
  uint64_t v28 = (v27 + 16) & ~v27;
  uint64_t v102 = v28;
  uint64_t v101 = v27 | 7;
  uint64_t v104 = v28 + v13;
  uint64_t v29 = swift_allocObject();
  sub_25F7606E0((uint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28);
  sub_25F761FC0(&qword_26A7BC220, MEMORY[0x263F185B8]);
  uint64_t v30 = v78;
  sub_25F78BD30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v30);
  sub_25F78B1A0();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC228);
  unint64_t v32 = sub_25F760C90();
  uint64_t v33 = sub_25F73D9A4(&qword_26A7BC280, &qword_26A7BC200);
  uint64_t v34 = v77;
  uint64_t v35 = v80;
  sub_25F78BB70();
  uint64_t v36 = v35;
  (*(void (**)(char *, uint64_t))(v81 + 8))(v19, v35);
  uint64_t v37 = v100;
  uint64_t v38 = v103;
  sub_25F76106C(v26, v100, (uint64_t (*)(void))v103);
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v102;
  sub_25F7606E0(v37, v39 + v102);
  *(void *)&long long v108 = v31;
  *((void *)&v108 + 1) = v36;
  *(void *)&long long v109 = v32;
  *((void *)&v109 + 1) = v33;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v42 = v79;
  uint64_t v43 = v82;
  sub_25F78BAC0();
  swift_release();
  uint64_t v44 = v43;
  (*(void (**)(char *, uint64_t))(v83 + 8))(v34, v43);
  uint64_t v45 = v76;
  uint64_t v46 = v100;
  sub_25F76106C(v76, v100, (uint64_t (*)(void))v38);
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v46;
  sub_25F7606E0(v46, v47 + v40);
  *(void *)&long long v108 = v44;
  *((void *)&v108 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v49 = v105;
  uint64_t v50 = v86;
  sub_25F78BB20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v42, v50);
  uint64_t v51 = v84;
  (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v84, v49, v107);
  uint64_t v52 = sub_25F78BDC0();
  uint64_t v53 = (uint64_t)v89;
  *unint64_t v89 = v52;
  *(void *)(v53 + 8) = v54;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC288);
  sub_25F75C5CC(v45, v85, v53 + *(int *)(v55 + 44));
  type metadata accessor for TrainingManager();
  sub_25F73D9A4(&qword_26A7BC290, &qword_26A7BC1E0);
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  uint64_t v56 = v90;
  sub_25F78BAB0();
  sub_25F73D748(v53, &qword_26A7BC1E0);
  sub_25F78B240();
  sub_25F78B240();
  sub_25F78BDE0();
  sub_25F78B220();
  uint64_t v57 = v95;
  uint64_t v58 = v91;
  uint64_t v59 = v56;
  uint64_t v60 = v96;
  (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v91, v56, v96);
  uint64_t v61 = &v58[*(int *)(v93 + 44)];
  uint64_t v62 = (uint64_t)v58;
  long long v63 = v109;
  *(_OWORD *)uint64_t v61 = v108;
  *((_OWORD *)v61 + 1) = v63;
  *((_OWORD *)v61 + 2) = v110;
  (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v60);
  sub_25F76106C(v45, v48, (uint64_t (*)(void))v103);
  uint64_t v64 = swift_allocObject();
  sub_25F7606E0(v48, v64 + v102);
  uint64_t v65 = v94;
  sub_25F73D580(v62, v94, &qword_26A7BC1F0);
  uint64_t v66 = (void *)(v65 + *(int *)(v98 + 44));
  *uint64_t v66 = 0;
  v66[1] = 0;
  v66[2] = sub_25F760FAC;
  v66[3] = v64;
  sub_25F73D748(v62, &qword_26A7BC1F0);
  uint64_t v67 = v97;
  sub_25F761004(v65, v97);
  uint64_t v68 = v105;
  uint64_t v69 = v106;
  uint64_t v70 = *(void (**)(char *, char *, uint64_t))(v106 + 16);
  uint64_t v71 = v107;
  v70(v105, v51, v107);
  sub_25F73D580(v67, v65, &qword_26A7BC1F8);
  uint64_t v72 = v99;
  v70(v99, v68, v71);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC298);
  sub_25F73D580(v65, (uint64_t)&v72[*(int *)(v73 + 48)], &qword_26A7BC1F8);
  sub_25F73D748(v67, &qword_26A7BC1F8);
  uint64_t v74 = *(void (**)(char *, uint64_t))(v69 + 8);
  v74(v51, v71);
  sub_25F73D748(v65, &qword_26A7BC1F8);
  return ((uint64_t (*)(char *, uint64_t))v74)(v68, v71);
}

uint64_t sub_25F75C200(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + *(int *)(type metadata accessor for TipsTryItView() + 44));
  swift_getKeyPath();
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v2 + 48) & 1) == 0)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_25F78B030();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F75C344(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 44));
  swift_getKeyPath();
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 48) & 1) == 0)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_25F78B030();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F75C488(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 44));
  swift_getKeyPath();
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 48) & 1) == 0)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_25F78B030();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F75C5CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for InstructionView();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)&v25[-v10];
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 36));
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  v27[0] = v13;
  v27[1] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BCA0();
  uint64_t v15 = v28;
  uint64_t v16 = v29;
  double v17 = *(double *)v30;
  type metadata accessor for TrainingManager();
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  uint64_t v18 = sub_25F78B190();
  sub_25F770674(v18, v19 & 1, v15, v16, v11, v17);
  uint64_t v20 = sub_25F78BDE0();
  uint64_t v22 = v21;
  sub_25F75C868(a1, a2, (uint64_t)v25);
  LOBYTE(a2) = sub_25F78B8C0();
  sub_25F76106C((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for InstructionView);
  sub_25F76106C((uint64_t)v9, a3, (uint64_t (*)(void))type metadata accessor for InstructionView);
  uint64_t v23 = (void *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC2A0) + 48));
  v27[0] = v20;
  v27[1] = v22;
  memcpy(&v27[2], v25, 0x160uLL);
  LOBYTE(v27[46]) = a2;
  *(_DWORD *)((char *)&v27[46] + 1) = *(_DWORD *)v26;
  HIDWORD(v27[46]) = *(_DWORD *)&v26[3];
  v27[47] = 0xBFF0000000000000;
  memcpy(v23, v27, 0x180uLL);
  sub_25F7610D4((uint64_t)v27);
  sub_25F76120C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for InstructionView);
  uint64_t v28 = v20;
  uint64_t v29 = v22;
  memcpy(v30, v25, sizeof(v30));
  char v31 = a2;
  *(_DWORD *)unint64_t v32 = *(_DWORD *)v26;
  *(_DWORD *)&v32[3] = *(_DWORD *)&v26[3];
  unint64_t v33 = 0xBFF0000000000000;
  sub_25F76116C((uint64_t)&v28);
  return sub_25F76120C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for InstructionView);
}

uint64_t sub_25F75C868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v5 = sub_25F78B260();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = v6;
  uint64_t v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TipsTryItView();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v31 - v11;
  type metadata accessor for TrainingManager();
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  uint64_t v41 = sub_25F78B190();
  int v38 = v13;
  uint64_t v14 = *(void *)(a1 + *(int *)(v7 + 44));
  swift_getKeyPath();
  v47[0] = v14;
  sub_25F78B040();
  swift_release();
  int v15 = *(unsigned __int8 *)(v14 + 48);
  sub_25F76106C(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  if (v15 == 1)
  {
    uint64_t v16 = *(void *)&v12[*(int *)(v7 + 44)];
    swift_getKeyPath();
    v47[0] = v16;
    sub_25F78B040();
    swift_release();
    char v17 = *(unsigned char *)(v16 + 50);
  }
  else
  {
    char v17 = 0;
  }
  sub_25F76120C((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = swift_allocObject();
  *(unsigned char *)(v31 + 16) = v17;
  uint64_t v18 = a1;
  sub_25F76106C(a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  uint64_t v19 = v39;
  uint64_t v20 = v40;
  uint64_t v21 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v37, v36, v40);
  unint64_t v22 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  unint64_t v23 = (v34 + *(unsigned __int8 *)(v19 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v24 = swift_allocObject();
  sub_25F7606E0((uint64_t)v10, v24 + v22);
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v24 + v23, v21, v20);
  uint64_t v25 = sub_25F78BDE0();
  uint64_t v40 = v26;
  uint64_t v27 = sub_25F78B600();
  sub_25F75D2D8(v18, (uint64_t)v42);
  *(_OWORD *)&v43[199] = v42[12];
  *(_OWORD *)&v43[215] = v42[13];
  *(_OWORD *)&v43[231] = v42[14];
  *(_OWORD *)&v43[247] = v42[15];
  *(_OWORD *)&v43[135] = v42[8];
  *(_OWORD *)&v43[151] = v42[9];
  *(_OWORD *)&v43[167] = v42[10];
  *(_OWORD *)&v43[183] = v42[11];
  *(_OWORD *)&v43[71] = v42[4];
  *(_OWORD *)&v43[87] = v42[5];
  *(_OWORD *)&v43[103] = v42[6];
  *(_OWORD *)&v43[119] = v42[7];
  *(_OWORD *)&v43[7] = v42[0];
  *(_OWORD *)&v43[23] = v42[1];
  *(_OWORD *)&v43[39] = v42[2];
  v43[264] = 1;
  *(_OWORD *)&v43[55] = v42[3];
  v44[0] = v27;
  v44[1] = 0;
  LOBYTE(v44[2]) = 1;
  memcpy((char *)&v44[2] + 1, v43, 0x107uLL);
  char v46 = v38 & 1;
  memcpy((void *)(a3 + 72), v44, 0x118uLL);
  char v28 = v46;
  *(_DWORD *)(a3 + 9) = *(_DWORD *)v45;
  *(_DWORD *)(a3 + 12) = *(_DWORD *)&v45[3];
  *(void *)a3 = v41;
  *(unsigned char *)(a3 + 8) = v28;
  uint64_t v29 = v31;
  *(void *)(a3 + 16) = KeyPath;
  *(void *)(a3 + 24) = sub_25F7612D4;
  *(void *)(a3 + 32) = v29;
  *(void *)(a3 + 40) = sub_25F761668;
  *(void *)(a3 + 48) = v24;
  *(void *)(a3 + 56) = v25;
  *(void *)(a3 + 64) = v40;
  v47[0] = v27;
  v47[1] = 0;
  char v48 = 1;
  memcpy(v49, v43, sizeof(v49));
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25F76174C((uint64_t)v44);
  sub_25F7617A4((uint64_t)v47);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25F75CDB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v27 = a1;
  uint64_t v6 = sub_25F78B260();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t v13 = type metadata accessor for TipsTryItView();
  uint64_t v24 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v13 - 8);
  int v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25F78BBC0();
  sub_25F76106C(a2, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(v12, v26, v6);
  v16(v10, v27, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v18 = *(unsigned __int8 *)(v7 + 80);
  unint64_t v19 = (v14 + v18 + v17) & ~v18;
  unint64_t v20 = (v8 + v18 + v19) & ~v18;
  uint64_t v21 = swift_allocObject();
  sub_25F7606E0((uint64_t)v15, v21 + v17);
  unint64_t v22 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  v22(v21 + v19, v12, v6);
  uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v22)(v21 + v20, v10, v6);
  *a4 = v25;
  a4[1] = (uint64_t)sub_25F7623A4;
  a4[2] = v21;
  a4[3] = 0;
  a4[4] = 0;
  return result;
}

uint64_t sub_25F75D014(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_25F78B700();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78B710();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = type metadata accessor for TipsTryItView();
  uint64_t v12 = result;
  uint64_t v13 = *(int *)(result + 44);
  uint64_t v14 = *(void *)(a1 + v13);
  double MinY = *(double *)(v14 + 64);
  if (MinY != 0.0)
  {
    if (MinY <= 0.0)
    {
      sub_25F78B750();
      sub_25F78B250();
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v44.origin.x = v17;
      v44.origin.y = v19;
      v44.size.width = v21;
      v44.size.height = v23;
      double MinY = CGRectGetMinY(v44);
    }
    sub_25F78B230();
    uint64_t v24 = (uint64_t *)(a1 + *(int *)(v12 + 36));
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    double v41 = MinY - v27;
    uint64_t v42 = v25;
    uint64_t v43 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
    uint64_t result = sub_25F78BC90();
    uint64_t v14 = *(void *)(a1 + v13);
  }
  if (*(double *)(v14 + 56) != 0.0)
  {
    sub_25F78B740();
    sub_25F78B250();
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v45.origin.x = v29;
    v45.origin.y = v31;
    v45.size.width = v33;
    v45.size.height = v35;
    CGFloat MaxY = CGRectGetMaxY(v45);
    uint64_t v37 = (uint64_t *)(a1 + *(int *)(v12 + 40));
    uint64_t v38 = *v37;
    uint64_t v39 = v37[1];
    double v41 = MaxY * 0.5 - *(double *)(*(void *)(a1 + v13) + 56);
    uint64_t v42 = v38;
    uint64_t v43 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
    return sub_25F78BC90();
  }
  return result;
}

uint64_t sub_25F75D2D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v116 = a2;
  uint64_t v109 = sub_25F78B730();
  uint64_t v118 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v104 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  MEMORY[0x270FA5388](v106);
  uint64_t v108 = (uint64_t)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v105 = (uint64_t)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v117 = (uint64_t)&v103 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v107 = (uint64_t)&v103 - v10;
  uint64_t v120 = sub_25F78B5F0();
  uint64_t v11 = *(void *)(v120 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v120);
  uint64_t v112 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v111 = (uint64_t)&v103 - v14;
  uint64_t v15 = type metadata accessor for TipsTryItView();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v115 = (uint64_t)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v114 = (uint64_t)&v103 - v20;
  MEMORY[0x270FA5388](v19);
  double v22 = (char *)&v103 - v21;
  uint64_t v113 = type metadata accessor for TipsTryItView;
  sub_25F76106C(a1, (uint64_t)&v103 - v21, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  unint64_t v23 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v24 = swift_allocObject();
  sub_25F7606E0((uint64_t)v22, v24 + v23);
  type metadata accessor for TrainingManager();
  uint64_t v119 = sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  uint64_t v25 = sub_25F78B190();
  char v27 = v26;
  double v28 = (void *)(a1 + *(int *)(v15 + 40));
  uint64_t v29 = v28[1];
  *(void *)uint64_t v128 = *v28;
  *(void *)&v128[8] = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC80();
  double v30 = *(double *)v130;
  uint64_t v31 = sub_25F78BDD0();
  sub_25F751ED4(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v144, 0.0, 1, v30, 0, v31, v32, v25, v27 & 1, (uint64_t)sub_25F760FAC, v24);
  swift_release();
  uint64_t v33 = v15;
  swift_release();
  uint64_t v34 = a1;
  uint64_t v35 = v111;
  sub_25F76AE68(v111);
  uint64_t v36 = (uint64_t)v112;
  uint64_t v37 = v120;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v112, *MEMORY[0x263F199D0], v120);
  BOOL v110 = sub_25F761AE8(v35, v36);
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v38(v36, v37);
  v38(v35, v37);
  uint64_t v39 = v34;
  uint64_t KeyPath = swift_getKeyPath();
  int v41 = sub_25F78B8E0();
  uint64_t v42 = v28[1];
  *(void *)uint64_t v128 = *v28;
  *(void *)&v128[8] = v42;
  sub_25F78BC80();
  double v43 = *(double *)v130;
  uint64_t v120 = v39;
  uint64_t v44 = v39;
  uint64_t v45 = v114;
  sub_25F76106C(v44, v114, (uint64_t (*)(void))v113);
  LODWORD(v112) = v41;
  uint64_t v111 = KeyPath;
  if (v43 <= 0.0)
  {
    sub_25F76120C(v45, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
    uint64_t v47 = v33;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
    sub_25F78B1C0();
    double v46 = *(double *)v128;
    sub_25F76120C(v45, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
    uint64_t v47 = v33;
    if (v46 > 0.0)
    {
      uint64_t v48 = v28[1];
      *(void *)uint64_t v128 = *v28;
      *(void *)&v128[8] = v48;
      sub_25F78BC80();
      sub_25F78B1C0();
      goto LABEL_12;
    }
  }
  uint64_t v49 = v107;
  sub_25F76AB88(v107);
  uint64_t v51 = v117;
  uint64_t v50 = v118;
  uint64_t v52 = v109;
  (*(void (**)(uint64_t, void, uint64_t))(v118 + 104))(v117, *MEMORY[0x263F19F00], v109);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v51, 0, 1, v52);
  uint64_t v53 = v108;
  uint64_t v54 = v108 + *(int *)(v106 + 48);
  sub_25F73D580(v49, v108, &qword_26A7BB8A0);
  sub_25F73D580(v51, v54, &qword_26A7BB8A0);
  uint64_t v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
  if (v55(v53, 1, v52) == 1)
  {
    sub_25F73D748(v51, &qword_26A7BB8A0);
    sub_25F73D748(v49, &qword_26A7BB8A0);
    if (v55(v54, 1, v52) == 1)
    {
      sub_25F73D748(v53, &qword_26A7BB8A0);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v56 = v105;
  sub_25F73D580(v53, v105, &qword_26A7BB8A0);
  if (v55(v54, 1, v52) == 1)
  {
    sub_25F73D748(v117, &qword_26A7BB8A0);
    sub_25F73D748(v49, &qword_26A7BB8A0);
    (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v56, v52);
LABEL_10:
    sub_25F73D748(v53, &qword_26A7BB990);
    goto LABEL_12;
  }
  uint64_t v57 = v118;
  uint64_t v58 = v49;
  uint64_t v59 = v56;
  uint64_t v60 = v104;
  (*(void (**)(char *, uint64_t, uint64_t))(v118 + 32))(v104, v54, v52);
  sub_25F761FC0(&qword_26A7BB998, MEMORY[0x263F19F18]);
  sub_25F78BF70();
  uint64_t v61 = *(void (**)(char *, uint64_t))(v57 + 8);
  v61(v60, v52);
  sub_25F73D748(v117, &qword_26A7BB8A0);
  sub_25F73D748(v58, &qword_26A7BB8A0);
  v61((char *)v59, v52);
  sub_25F73D748(v53, &qword_26A7BB8A0);
LABEL_12:
  sub_25F78B110();
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v70 = *(int *)(v47 + 44);
  uint64_t v71 = v120;
  uint64_t v72 = *(void *)(v120 + v70);
  swift_getKeyPath();
  *(void *)uint64_t v128 = v72;
  sub_25F78B040();
  swift_release();
  int v73 = *(unsigned __int8 *)(v72 + 53);
  uint64_t v74 = v115;
  sub_25F76106C(v71, v115, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  if (v73 != 1)
  {
    sub_25F76120C(v74, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
    uint64_t v77 = v111;
    char v78 = (char)v112;
    BOOL v79 = v110;
    goto LABEL_16;
  }
  BOOL v75 = sub_25F763140();
  sub_25F76120C(v74, (uint64_t (*)(void))type metadata accessor for TipsTryItView);
  double v76 = 1.0;
  uint64_t v77 = v111;
  char v78 = (char)v112;
  BOOL v79 = v110;
  if (!v75) {
LABEL_16:
  }
    double v76 = 0.0;
  if (v79) {
    double v80 = 0.5;
  }
  else {
    double v80 = 1.0;
  }
  char v143 = 0;
  uint64_t v81 = sub_25F78BE40();
  uint64_t v82 = *(void *)(v120 + v70);
  swift_getKeyPath();
  *(void *)uint64_t v128 = v82;
  sub_25F78B040();
  swift_release();
  double v83 = 0.0;
  if (*(unsigned char *)(v82 + 53)) {
    double v83 = 1.0;
  }
  char v84 = v143;
  long long v85 = v150;
  long long v86 = v151;
  v121[6] = v150;
  v121[7] = v151;
  long long v87 = v152;
  v121[8] = v152;
  long long v88 = v146;
  long long v89 = v147;
  v121[2] = v146;
  v121[3] = v147;
  long long v91 = v148;
  long long v90 = v149;
  v121[4] = v148;
  v121[5] = v149;
  long long v93 = v144;
  long long v92 = v145;
  v121[0] = v144;
  v121[1] = v145;
  *(void *)&long long v122 = v77;
  *((double *)&v122 + 1) = v80;
  LOBYTE(v123) = v78;
  *((void *)&v123 + 1) = v63;
  *(void *)&long long v124 = v65;
  *((void *)&v124 + 1) = v67;
  *(void *)&long long v125 = v69;
  BYTE8(v125) = v143;
  *(double *)&long long v126 = v76;
  *((void *)&v126 + 1) = v81;
  *(_OWORD *)&v128[87] = v149;
  *(_OWORD *)&v128[23] = v145;
  *(_OWORD *)&v128[119] = v151;
  *(_OWORD *)&v128[135] = v152;
  *(_OWORD *)&v128[55] = v147;
  *(_OWORD *)&v128[71] = v148;
  *(_OWORD *)&v128[103] = v150;
  *(_OWORD *)&v128[7] = v144;
  *(_OWORD *)&v128[39] = v146;
  *(_OWORD *)&v128[183] = v124;
  *(_OWORD *)&v128[199] = v125;
  *(double *)&long long v127 = v83;
  *((void *)&v127 + 1) = 0x4000000000000000;
  *(_OWORD *)&v128[215] = v126;
  *(_OWORD *)&v128[231] = v127;
  *(_OWORD *)&v128[151] = v122;
  *(_OWORD *)&v128[167] = v123;
  long long v94 = *(_OWORD *)&v128[208];
  uint64_t v95 = v116;
  *(_OWORD *)(v116 + 201) = *(_OWORD *)&v128[192];
  *(_OWORD *)(v95 + 217) = v94;
  *(_OWORD *)(v95 + 233) = *(_OWORD *)&v128[224];
  long long v96 = *(_OWORD *)&v128[144];
  *(_OWORD *)(v95 + 137) = *(_OWORD *)&v128[128];
  *(_OWORD *)(v95 + 153) = v96;
  long long v97 = *(_OWORD *)&v128[176];
  *(_OWORD *)(v95 + 169) = *(_OWORD *)&v128[160];
  *(_OWORD *)(v95 + 185) = v97;
  long long v98 = *(_OWORD *)&v128[80];
  *(_OWORD *)(v95 + 73) = *(_OWORD *)&v128[64];
  *(_OWORD *)(v95 + 89) = v98;
  long long v99 = *(_OWORD *)&v128[112];
  *(_OWORD *)(v95 + 105) = *(_OWORD *)&v128[96];
  *(_OWORD *)(v95 + 121) = v99;
  long long v100 = *(_OWORD *)&v128[16];
  *(_OWORD *)(v95 + 9) = *(_OWORD *)v128;
  *(_OWORD *)(v95 + 25) = v100;
  long long v101 = *(_OWORD *)&v128[48];
  *(_OWORD *)(v95 + 41) = *(_OWORD *)&v128[32];
  *(_OWORD *)(v95 + 57) = v101;
  v130[6] = v85;
  v130[7] = v86;
  v130[8] = v87;
  v130[2] = v88;
  v130[3] = v89;
  char v129 = 1;
  *(void *)uint64_t v95 = 0;
  *(unsigned char *)(v95 + 8) = 1;
  *(void *)(v95 + 248) = *(void *)&v128[239];
  v130[4] = v91;
  v130[5] = v90;
  v130[0] = v93;
  v130[1] = v92;
  uint64_t v131 = v77;
  double v132 = v80;
  char v133 = v78;
  uint64_t v134 = v63;
  uint64_t v135 = v65;
  uint64_t v136 = v67;
  uint64_t v137 = v69;
  char v138 = v84;
  double v139 = v76;
  uint64_t v140 = v81;
  double v141 = v83;
  uint64_t v142 = 0x4000000000000000;
  sub_25F761F10((uint64_t)v121);
  return sub_25F761F68((uint64_t)v130);
}

uint64_t sub_25F75DE94(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 44))
                 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask))
  {
    swift_retain();
    sub_25F78C180();
    swift_release();
  }
  sub_25F764C9C();
  return sub_25F764A08();
}

uint64_t sub_25F75DF0C()
{
  uint64_t v0 = sub_25F78B380();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TipsTryItView();
  sub_25F76ABB4((uint64_t)v3);
  MEMORY[0x2611FE0A0](v1);
  sub_25F78B370();
  sub_25F78BCF0();
  sub_25F73D748((uint64_t)v3, &qword_26A7BC120);
  return sub_25F765530();
}

uint64_t sub_25F75E03C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1B0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1D0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB38);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC180);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_25F78BC20();
  uint64_t v17 = sub_25F78B940();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_25F78B970();
  sub_25F73D748((uint64_t)v11, &qword_26A7BBB38);
  uint64_t KeyPath = swift_getKeyPath();
  sub_25F78B610();
  uint64_t v20 = sub_25F78B620();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 0, 1, v20);
  uint64_t v21 = swift_getKeyPath();
  sub_25F73D580((uint64_t)v8, (uint64_t)v5 + *(int *)(v3 + 36), &qword_26A7BC1D0);
  uint64_t *v5 = v21;
  sub_25F73D580((uint64_t)v5, (uint64_t)v15 + *(int *)(v13 + 44), &qword_26A7BC1B0);
  uint64_t *v15 = v16;
  v15[1] = KeyPath;
  v15[2] = v18;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25F73D748((uint64_t)v5, &qword_26A7BC1B0);
  sub_25F73D748((uint64_t)v8, &qword_26A7BC1D0);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = sub_25F78BBF0();
  uint64_t v23 = swift_getKeyPath();
  sub_25F73D580((uint64_t)v15, a1, &qword_26A7BC180);
  uint64_t v24 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC168) + 36));
  *uint64_t v24 = v23;
  v24[1] = v22;
  return sub_25F73D748((uint64_t)v15, &qword_26A7BC180);
}

uint64_t sub_25F75E378@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v18 = sub_25F78B7A0();
  uint64_t v2 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v1;
  v17[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0C0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0C8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0D0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0D8);
  uint64_t v12 = sub_25F73D9A4(&qword_26A7BC0E0, &qword_26A7BC0D0);
  uint64_t v13 = sub_25F760E2C(&qword_26A7BC0E8, &qword_26A7BC0D8, (void (*)(void))sub_25F75EA70);
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v9;
  uint64_t v22 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_25F78B2F0();
  sub_25F78B790();
  sub_25F73D9A4(&qword_26A7BC110, &qword_26A7BC0B8);
  sub_25F761FC0(&qword_26A7BC118, MEMORY[0x263F1A128]);
  uint64_t v15 = v18;
  sub_25F78BA40();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25F75E680@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F761FC0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(void *)(v3 + 32);
  return result;
}

uint64_t sub_25F75E728()
{
  return swift_release();
}

uint64_t sub_25F75E7F4()
{
  return sub_25F78B480();
}

uint64_t sub_25F75E818()
{
  return sub_25F78B480();
}

uint64_t sub_25F75E83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25F760A94(a1, a2, a3, a4, &qword_26A7BB8A0, MEMORY[0x263F19448]);
}

uint64_t sub_25F75E85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25F760A94(a1, a2, a3, a4, &qword_26A7BB8A0, MEMORY[0x263F19448]);
}

uint64_t type metadata accessor for TipsTryItView()
{
  uint64_t result = qword_26A7BC140;
  if (!qword_26A7BC140) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25F75E8DC()
{
  return sub_25F78B440();
}

uint64_t sub_25F75E900()
{
  return sub_25F78B400();
}

uint64_t sub_25F75E924(uint64_t a1)
{
  uint64_t v2 = sub_25F78B5F0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25F78B410();
}

unint64_t sub_25F75E9F0()
{
  unint64_t result = qword_26A7BC0B0;
  if (!qword_26A7BC0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC0B0);
  }
  return result;
}

uint64_t sub_25F75EA4C()
{
  return sub_25F762624(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25F75EA68@<X0>(uint64_t a1@<X8>)
{
  return sub_25F75AED4(*(void *)(v1 + 16), a1);
}

unint64_t sub_25F75EA70()
{
  unint64_t result = qword_26A7BC0F0;
  if (!qword_26A7BC0F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC0F8);
    sub_25F73D9A4(&qword_26A7BC100, &qword_26A7BC108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC0F0);
  }
  return result;
}

uint64_t sub_25F75EB10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TipsTryItView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = (uint64_t *)((char *)v4 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    void *v12 = *v13;
    if (EnumCaseMultiPayload == 1)
    {
      v12[1] = v13[1];
      swift_retain();
      swift_retain();
      uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
      uint64_t v16 = (char *)v12 + v15;
      uint64_t v17 = (char *)v13 + v15;
      uint64_t v18 = sub_25F78B380();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = a3[6];
    uint64_t v20 = (uint64_t *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_25F78B5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = a3[7];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    uint64_t v27 = a3[8];
    uint64_t v28 = a3[9];
    uint64_t v29 = (char *)v4 + v27;
    double v30 = (char *)a2 + v27;
    *uint64_t v29 = *v30;
    *((void *)v29 + 1) = *((void *)v30 + 1);
    uint64_t v31 = (uint64_t *)((char *)v4 + v28);
    uint64_t v32 = (uint64_t *)((char *)a2 + v28);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    uint64_t v34 = a3[10];
    uint64_t v35 = a3[11];
    uint64_t v36 = (uint64_t *)((char *)v4 + v34);
    uint64_t v37 = (uint64_t *)((char *)a2 + v34);
    uint64_t v38 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v38;
    *(uint64_t *)((char *)v4 + v35) = *(uint64_t *)((char *)a2 + v35);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for TipsTryItView(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25F78B730();
    uint64_t v5 = *(void *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
    uint64_t v9 = sub_25F78B380();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  uint64_t v10 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25F78B5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = a1 + a2[7];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for TipsTryItView(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *uint64_t v10 = *v11;
  if (EnumCaseMultiPayload == 1)
  {
    v10[1] = v11[1];
    swift_retain();
    swift_retain();
    uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
    uint64_t v14 = (char *)v10 + v13;
    uint64_t v15 = (char *)v11 + v13;
    uint64_t v16 = sub_25F78B380();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a3[6];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_25F78B5F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *uint64_t v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = a3[7];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  uint64_t v25 = a3[8];
  uint64_t v26 = a3[9];
  uint64_t v27 = (char *)a1 + v25;
  uint64_t v28 = (char *)a2 + v25;
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  uint64_t v29 = (void *)((char *)a1 + v26);
  double v30 = (void *)((char *)a2 + v26);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a3[10];
  uint64_t v33 = a3[11];
  uint64_t v34 = (void *)((char *)a1 + v32);
  uint64_t v35 = (void *)((char *)a2 + v32);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  *(void *)((char *)a1 + v33) = *(void *)((char *)a2 + v33);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for TipsTryItView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    sub_25F73D748((uint64_t)a1 + v9, &qword_26A7BC0A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v10 = *v11;
    if (EnumCaseMultiPayload == 1)
    {
      v10[1] = v11[1];
      swift_retain();
      swift_retain();
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
      uint64_t v14 = (char *)v10 + v13;
      uint64_t v15 = (char *)v11 + v13;
      uint64_t v16 = sub_25F78B380();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[6];
    uint64_t v18 = (void *)((char *)a1 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    sub_25F73D748((uint64_t)a1 + v17, &qword_26A7BC0A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_25F78B5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v21 = a3[7];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  uint64_t v25 = a3[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_retain();
  swift_release();
  uint64_t v28 = a3[9];
  uint64_t v29 = (void *)((char *)a1 + v28);
  double v30 = (void *)((char *)a2 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_retain();
  swift_release();
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for TipsTryItView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v14;
    uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
    uint64_t v16 = &v11[v15];
    uint64_t v17 = &v12[v15];
    uint64_t v18 = sub_25F78B380();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v19 = a3[6];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_25F78B5F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
  uint64_t v28 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v28] = *(_OWORD *)&a2[v28];
  uint64_t v29 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(void *)&a1[v29] = *(void *)&a2[v29];
  return a1;
}

char *assignWithTake for TipsTryItView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v10 = a3[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    sub_25F73D748((uint64_t)&a1[v10], &qword_26A7BC0A0);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = *((void *)v12 + 1);
      *(void *)uint64_t v11 = *(void *)v12;
      *((void *)v11 + 1) = v14;
      uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
      uint64_t v16 = &v11[v15];
      uint64_t v17 = &v12[v15];
      uint64_t v18 = sub_25F78B380();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    uint64_t v19 = a3[6];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    sub_25F73D748((uint64_t)&a1[v19], &qword_26A7BC0A8);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_25F78B5F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
  }
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  uint64_t v28 = a3[8];
  uint64_t v29 = &a1[v28];
  double v30 = &a2[v28];
  *uint64_t v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_release();
  uint64_t v31 = a3[9];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  *(void *)uint64_t v32 = *(void *)v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_release();
  uint64_t v34 = a3[10];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  swift_release();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipsTryItView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F760004);
}

uint64_t sub_25F760004(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_10:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC130);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_9:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_10;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC138);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_9;
  }
  unint64_t v17 = *(void *)(a1 + a3[11]);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

uint64_t storeEnumTagSinglePayload for TipsTryItView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F7601D4);
}

uint64_t sub_25F7601D4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC130);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC138);
      if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
      {
        uint64_t v10 = v16;
        uint64_t v14 = *(void *)(v16 - 8);
        uint64_t v15 = a4[6];
      }
      else
      {
        uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
        if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
        {
          *(void *)(a1 + a4[11]) = (a2 - 1);
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

void sub_25F76038C()
{
  sub_25F760508(319, (unint64_t *)&qword_26A7BB8C8, &qword_26A7BB8A0);
  if (v0 <= 0x3F)
  {
    sub_25F760508(319, &qword_26A7BC150, &qword_26A7BC120);
    if (v1 <= 0x3F)
    {
      sub_25F760558();
      if (v2 <= 0x3F)
      {
        sub_25F7605B0();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_25F760508(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_25F78B180();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_25F760558()
{
  if (!qword_26A7BC158)
  {
    sub_25F78B5F0();
    unint64_t v0 = sub_25F78B180();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7BC158);
    }
  }
}

void sub_25F7605B0()
{
  if (!qword_26A7BC160)
  {
    sub_25F75E9F0();
    unint64_t v0 = sub_25F78B1D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7BC160);
    }
  }
}

uint64_t sub_25F76060C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F7606E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipsTryItView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F760744@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TipsTryItView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F75B4D4(a1, v6, a2);
}

uint64_t sub_25F7607C8()
{
  return sub_25F760F18((uint64_t (*)(uint64_t))sub_25F75DF0C);
}

unint64_t sub_25F7607E0()
{
  unint64_t result = qword_26A7BC170;
  if (!qword_26A7BC170)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC168);
    sub_25F760880();
    sub_25F73D9A4(&qword_26A7BC1B8, &qword_26A7BC1C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC170);
  }
  return result;
}

unint64_t sub_25F760880()
{
  unint64_t result = qword_26A7BC178;
  if (!qword_26A7BC178)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC180);
    sub_25F760920();
    sub_25F73D9A4(&qword_26A7BC1A8, &qword_26A7BC1B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC178);
  }
  return result;
}

unint64_t sub_25F760920()
{
  unint64_t result = qword_26A7BC188;
  if (!qword_26A7BC188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC190);
    sub_25F73D9A4(&qword_26A7BC198, &qword_26A7BC1A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC188);
  }
  return result;
}

uint64_t sub_25F7609C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F78B4C0();
  *a1 = result;
  return result;
}

uint64_t sub_25F7609EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F78B4C0();
  *a1 = result;
  return result;
}

uint64_t sub_25F760A18()
{
  return sub_25F78B4D0();
}

uint64_t sub_25F760A44()
{
  return sub_25F78B4D0();
}

uint64_t sub_25F760A70()
{
  return sub_25F78B490();
}

uint64_t sub_25F760A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F73D580(a1, (uint64_t)v11, a5);
  return a6(v11);
}

uint64_t sub_25F760B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25F760A94(a1, a2, a3, a4, &qword_26A7BC1D0, MEMORY[0x263F19460]);
}

uint64_t sub_25F760B6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F78B420();
  *a1 = result;
  return result;
}

uint64_t sub_25F760B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F78B420();
  *a1 = result;
  return result;
}

uint64_t sub_25F760BC4()
{
  return sub_25F78B430();
}

uint64_t sub_25F760BF0()
{
  return sub_25F78B430();
}

uint64_t sub_25F760C20(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for TipsTryItView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25F75C200(a1, v4);
}

unint64_t sub_25F760C90()
{
  unint64_t result = qword_26A7BC230;
  if (!qword_26A7BC230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC228);
    sub_25F760D30();
    sub_25F73D9A4(&qword_26A7BBCC8, &qword_26A7BBCD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC230);
  }
  return result;
}

unint64_t sub_25F760D30()
{
  unint64_t result = qword_26A7BC238;
  if (!qword_26A7BC238)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC240);
    sub_25F760E2C(&qword_26A7BC248, &qword_26A7BC250, (void (*)(void))sub_25F760DFC);
    sub_25F73D9A4(&qword_26A7BC270, &qword_26A7BC278);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC238);
  }
  return result;
}

uint64_t sub_25F760DFC()
{
  return sub_25F760E2C(&qword_26A7BC258, &qword_26A7BC260, (void (*)(void))sub_25F760EA8);
}

uint64_t sub_25F760E2C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25F760EA8()
{
  unint64_t result = qword_26A7BC268;
  if (!qword_26A7BC268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC268);
  }
  return result;
}

uint64_t sub_25F760F00()
{
  return sub_25F760F18(sub_25F75C344);
}

uint64_t sub_25F760F18(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TipsTryItView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25F760F90()
{
  return sub_25F760F18(sub_25F75C488);
}

uint64_t sub_25F760FB0()
{
  uint64_t v1 = *(void *)(type metadata accessor for TipsTryItView() - 8);
  return sub_25F75DE94(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_25F761004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC1F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F76106C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F7610D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F76116C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F76120C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25F76126C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25F78B4E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25F76129C()
{
  return sub_25F78B4F0();
}

uint64_t sub_25F7612C4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_25F7612D4(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_25F7612EC()
{
  uint64_t v1 = (int *)type metadata accessor for TipsTryItView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v22 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = sub_25F78B260();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v21 = *(void *)(v5 + 64);
  uint64_t v7 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25F78B730();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v3, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v3, v8);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v7 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v12 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
    uint64_t v13 = sub_25F78B380();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  uint64_t v14 = v7 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_25F78B5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v2 | v6 | 7;
  uint64_t v17 = (v3 + v22 + v6) & ~v6;
  uint64_t v18 = v7 + v1[7];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v17, v4);
  return MEMORY[0x270FA0238](v0, v17 + v21, v16);
}

uint64_t sub_25F761668@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TipsTryItView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_25F78B260() - 8);
  uint64_t v9 = v2 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return sub_25F75CDB4(a1, v2 + v6, v9, a2);
}

uint64_t sub_25F76174C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F7617A4(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = (int *)type metadata accessor for TipsTryItView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v10 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
    uint64_t v11 = sub_25F78B380();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  uint64_t v12 = v5 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_25F78B5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  uint64_t v14 = v2 | 7;
  uint64_t v15 = v5 + v1[7];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v14);
}

BOOL sub_25F761AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v3 = sub_25F78B5F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a2, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = *MEMORY[0x263F199C0];
  if (v12 != *MEMORY[0x263F199C0])
  {
    if (v12 == *MEMORY[0x263F199F0])
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199F8])
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199E8]) {
      goto LABEL_7;
    }
    if (v12 == *MEMORY[0x263F199B8])
    {
      unint64_t v13 = 4;
    }
    else if (v12 == *MEMORY[0x263F199C8])
    {
      unint64_t v13 = 5;
    }
    else if (v12 == *MEMORY[0x263F199A0])
    {
      unint64_t v13 = 6;
    }
    else if (v12 == *MEMORY[0x263F199D8])
    {
      unint64_t v13 = 7;
    }
    else if (v12 == *MEMORY[0x263F199D0])
    {
      unint64_t v13 = 8;
    }
    else if (v12 == *MEMORY[0x263F199E0])
    {
      unint64_t v13 = 9;
    }
    else if (v12 == *MEMORY[0x263F199A8])
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != *MEMORY[0x263F199B0])
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == *MEMORY[0x263F199F0])
  {
    unint64_t v16 = 1;
  }
  else if (v15 == *MEMORY[0x263F199F8])
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != *MEMORY[0x263F199E8])
    {
      if (v15 == *MEMORY[0x263F199B8])
      {
        unint64_t v16 = 4;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199C8])
      {
        unint64_t v16 = 5;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199A0])
      {
        unint64_t v16 = 6;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199D8])
      {
        unint64_t v16 = 7;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199D0])
      {
        unint64_t v16 = 8;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199E0])
      {
        unint64_t v16 = 9;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199A8])
      {
        unint64_t v16 = 10;
        return v13 < v16;
      }
      if (v15 == *MEMORY[0x263F199B0])
      {
        unint64_t v16 = 11;
        return v13 < v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 < v16;
}

uint64_t sub_25F761F10(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F761F68(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F761FC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F762008()
{
  uint64_t v1 = (int *)type metadata accessor for TipsTryItView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v25 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v26 = sub_25F78B260();
  uint64_t v4 = *(void *)(v26 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25F78B730();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v3, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v3, v8);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v7 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v12 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC120) + 32);
    uint64_t v13 = sub_25F78B380();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  uint64_t v14 = v7 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_25F78B5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = (v3 + v25 + v5) & ~v5;
  uint64_t v17 = v6;
  uint64_t v18 = (v6 + v5 + v16) & ~v5;
  uint64_t v19 = v18 + v17;
  uint64_t v20 = v2 | v5 | 7;
  uint64_t v21 = v7 + v1[7];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC128);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v23(v0 + v16, v26);
  v23(v0 + v18, v26);
  return MEMORY[0x270FA0238](v0, v19, v20);
}

uint64_t sub_25F7623A4()
{
  uint64_t v1 = *(void *)(type metadata accessor for TipsTryItView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(sub_25F78B260() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25F75D014(v0 + v2, v5);
}

uint64_t sub_25F7624A4()
{
  return sub_25F7628B4(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_25F7624C8()
{
  return sub_25F7624A4();
}

uint64_t sub_25F7624E0()
{
  return sub_25F75EA4C();
}

uint64_t sub_25F7624F8()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25F762578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F7625B4()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(void *)(v0 + 32);
}

uint64_t sub_25F762624(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t sub_25F76262C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F7626A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  *a2 = *(void *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F76271C()
{
  return swift_release();
}

uint64_t sub_25F7627CC()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_25F76283C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 48) = a2;
  return result;
}

uint64_t sub_25F762844()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t sub_25F7628B4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 49) = a2;
  return result;
}

uint64_t sub_25F7628BC()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t sub_25F76292C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 50) = a2;
  return result;
}

uint64_t sub_25F762934()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(unsigned __int8 *)(v0 + 51);
}

uint64_t sub_25F7629A4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 51) = a2;
  return result;
}

uint64_t sub_25F7629AC()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(unsigned __int8 *)(v0 + 52);
}

uint64_t sub_25F762A1C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 52) = a2;
  return result;
}

uint64_t sub_25F762A24()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  return *(unsigned __int8 *)(v0 + 53);
}

uint64_t sub_25F762A94@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 53);
  return result;
}

uint64_t sub_25F762B0C()
{
  return swift_release();
}

uint64_t sub_25F762BAC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 53) = a2;
  return result;
}

uint64_t sub_25F762BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = sub_25F78AF50();
  MEMORY[0x270FA5388](v10 - 8);
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B030();
  swift_release();
  swift_getKeyPath();
  sub_25F78B040();
  swift_release();
  TryItLesson.initialInstruction.getter(*(void *)(v7 + 32));
  sub_25F78BFF0();
  swift_getKeyPath();
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  sub_25F78B040();
  swift_release();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v11 = (void *)(v7 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  *uint64_t v11 = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[2] = a4;
  v11[3] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[4] = a6;
  v11[5] = a7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_25F7653E0();
}

uint64_t sub_25F762E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v10 = sub_25F78AF50();
  MEMORY[0x270FA5388](v10 - 8);
  if (*(void *)(a1 + 16)) {
    uint64_t v11 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v23 - 2) = v8;
  *(&v23 - 1) = v11;
  uint64_t v29 = v8;
  sub_25F765DC4();
  sub_25F78B030();
  swift_release();
  swift_getKeyPath();
  uint64_t v29 = v8;
  sub_25F78B040();
  swift_release();
  TryItLesson.initialInstruction.getter(*(void *)(v8 + 32));
  uint64_t v13 = sub_25F78BFF0();
  uint64_t v15 = v14;
  uint64_t v16 = swift_getKeyPath();
  MEMORY[0x270FA5388](v16);
  *(&v23 - 4) = v8;
  *(&v23 - 3) = v13;
  *(&v23 - 2) = v15;
  uint64_t v29 = v8;
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v17 = swift_getKeyPath();
  MEMORY[0x270FA5388](v17);
  *(&v23 - 2) = v8;
  *(&v23 - 1) = a1;
  uint64_t v29 = v8;
  swift_bridgeObjectRetain();
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v18 = (void *)(v8 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  uint64_t v19 = v24;
  *uint64_t v18 = v23;
  v18[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v26;
  v18[2] = v25;
  v18[3] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v28;
  v18[4] = v27;
  v18[5] = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_25F7653E0();
}

BOOL sub_25F763140()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_getKeyPath();
  sub_25F78B040();
  swift_release();
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3 && v1 == *(void *)(v2 + 8 * v3 + 24))
  {
    return 1;
  }
  else
  {
    swift_getKeyPath();
    sub_25F78B040();
    swift_release();
    return sub_25F76324C(*(void **)(v0 + 40), MEMORY[0x263F8EE78]);
  }
}

BOOL sub_25F76324C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = a1 + 5;
  uint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_25F7632C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (double *)(a1 + 40);
  uint64_t v6 = (double *)(a2 + 40);
  do
  {
    double v7 = *v5++;
    double v8 = v7;
    double v9 = *v6++;
    double v10 = v9;
    BOOL v12 = v4-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

uint64_t sub_25F763334(char a1, int a2, int a3)
{
  uint64_t v4 = v3;
  int v41 = a2;
  int v42 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC2E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v36 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25F78B020();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v39 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_25F78AF40();
  uint64_t v10 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v38 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25F78BF90();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = sub_25F78AF50();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v35 = OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask;
  if (*(void *)(v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask))
  {
    swift_retain();
    sub_25F78C180();
    swift_release();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v35 - 2) = v4;
  *((unsigned char *)&v35 - 8) = a1 & 1;
  uint64_t v15 = v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager___observationRegistrar;
  uint64_t v43 = v4;
  sub_25F765DC4();
  uint64_t v40 = v15;
  sub_25F78B030();
  swift_release();
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v16 = v37;
  uint64_t v17 = __swift_project_value_buffer(v37, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v38, v17, v16);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v18 = sub_25F78BFF0();
  uint64_t v20 = v19;
  uint64_t v21 = swift_getKeyPath();
  MEMORY[0x270FA5388](v21);
  *(&v35 - 4) = v4;
  *(&v35 - 3) = v18;
  *(&v35 - 2) = v20;
  uint64_t v43 = v4;
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v22 = v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
  *(void *)(v22 + 48) = 0;
  *(void *)(v22 + 56) = 0;
  swift_bridgeObjectRelease();
  sub_25F7657C8();
  *(void *)(v22 + 48) = 0;
  *(void *)(v22 + 56) = 0;
  swift_bridgeObjectRelease();
  uint64_t v23 = swift_getKeyPath();
  MEMORY[0x270FA5388](v23);
  *(&v35 - 2) = v4;
  *((unsigned char *)&v35 - 8) = 0;
  uint64_t v43 = v4;
  sub_25F78B030();
  swift_release();
  uint64_t v24 = swift_getKeyPath();
  MEMORY[0x270FA5388](v24);
  *(&v35 - 2) = v4;
  *((unsigned char *)&v35 - 8) = v41 & 1;
  uint64_t v43 = v4;
  sub_25F78B030();
  uint64_t result = swift_release();
  if (v42)
  {
    uint64_t v26 = *(void *)(v22 + 72);
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (!v27)
    {
      *(void *)(v22 + 72) = v28;
      *(unsigned char *)(v22 + 89) = 1;
LABEL_10:
      uint64_t v31 = sub_25F78C170();
      uint64_t v32 = (uint64_t)v36;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v36, 1, 1, v31);
      uint64_t v33 = (void *)swift_allocObject();
      v33[2] = 0;
      v33[3] = 0;
      v33[4] = v4;
      swift_retain();
      uint64_t v34 = sub_25F77D6A4(v32, (uint64_t)&unk_26A7BC300, (uint64_t)v33);
      *(void *)(v4 + v35) = v34;
      return swift_release();
    }
    __break(1u);
  }
  else
  {
    uint64_t v29 = *(void *)(v22 + 64);
    BOOL v27 = __OFADD__(v29, 1);
    uint64_t v30 = v29 + 1;
    if (!v27)
    {
      *(void *)(v22 + 64) = v30;
      *(unsigned char *)(v22 + 88) = 1;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25F763950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v5 = sub_25F78C350();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F763A10, 0, 0);
}

uint64_t sub_25F763A10()
{
  sub_25F78C340();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_26A7BBD10 + dword_26A7BBD10);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25F763AD8;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_25F763AD8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_25F763CB0;
  }
  else {
    uint64_t v5 = sub_25F763C48;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25F763C48()
{
  sub_25F764560();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25F763CB0()
{
  uint64_t v10 = v0;
  if (qword_26A7BB690 != -1) {
    swift_once();
  }
  uint64_t v1 = (id)qword_26A7BCBA8;
  os_log_type_t v2 = sub_25F78C1D0();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = (void *)v0[8];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = sub_25F789928(0xD000000000000038, 0x800000025F78F410, &v9);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v6, -1, -1);
    MEMORY[0x2611FEDE0](v5, -1, -1);
  }

  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25F763E6C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v57 = a3;
  uint64_t v53 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC2E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v55 = (uint64_t)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25F78B020();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_25F78AF40();
  uint64_t v54 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25F78BF90();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v58 = (char *)&v44 - v21;
  uint64_t v22 = sub_25F78AF50();
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v59 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = OBJC_IVAR____TtC9TipsTryIt15TrainingManager_delayedInstructionTask;
  if (*(void *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_delayedInstructionTask))
  {
    swift_retain();
    sub_25F78C180();
    swift_release();
  }
  uint64_t v61 = v15;
  uint64_t v56 = v13;
  if (a2)
  {
    uint64_t v24 = v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(_OWORD *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 48) = xmmword_25F78DA60;
    swift_bridgeObjectRelease();
    sub_25F7657C8();
    *(void *)(v24 + 48) = 0;
    *(void *)(v24 + 56) = 0;
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  uint64_t v62 = v3;
  sub_25F765DC4();
  sub_25F78B040();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v3 + 48) & 1) == 0)
  {
    uint64_t v48 = v20;
    uint64_t v49 = v8;
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(&v44 - 2) = v3;
    *((unsigned char *)&v44 - 8) = a2 & 1;
    uint64_t v62 = v3;
    uint64_t v50 = MEMORY[0x263F8EE60] + 8;
    sub_25F78B030();
    swift_release();
    uint64_t v51 = v17;
    double v46 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    uint64_t v47 = v17 + 16;
    v46(v58, v53, v16);
    uint64_t v53 = v16;
    if (qword_26A7BB640 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v60, (uint64_t)qword_26A7BE398);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v54 + 16);
    uint64_t v54 = v27;
    uint64_t v45 = v28;
    ((void (*)(char *))v28)(v61);
    sub_25F78B010();
    sub_25F78AF60();
    uint64_t v29 = sub_25F78BFF0();
    uint64_t v31 = v30;
    uint64_t v32 = swift_getKeyPath();
    MEMORY[0x270FA5388](v32);
    *(&v44 - 4) = v3;
    *(&v44 - 3) = v29;
    *(&v44 - 2) = v31;
    uint64_t v62 = v3;
    sub_25F78B030();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v33 = v55;
    sub_25F765EC8(v57, v55);
    uint64_t v34 = v51;
    uint64_t v35 = v53;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v33, 1, v53) == 1)
    {
      return sub_25F765F30(v33);
    }
    else
    {
      uint64_t v36 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v48, v33, v35);
      v46(v58, (uint64_t)v36, v35);
      v45(v61, v54, v60);
      sub_25F78B010();
      sub_25F78AF60();
      uint64_t v37 = sub_25F78BFF0();
      uint64_t v39 = v38;
      uint64_t v40 = sub_25F78C170();
      uint64_t v41 = (uint64_t)v49;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v49, 1, 1, v40);
      int v42 = (void *)swift_allocObject();
      v42[2] = 0;
      v42[3] = 0;
      v42[4] = v4;
      v42[5] = v37;
      v42[6] = v39;
      swift_retain();
      uint64_t v43 = sub_25F77D6A4(v41, (uint64_t)&unk_26A7BC2F0, (uint64_t)v42);
      *(void *)(v4 + v52) = v43;
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v36, v35);
    }
  }
  return result;
}

void sub_25F764560()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  v15[0] = v0;
  sub_25F765DC4();
  sub_25F78B040();
  swift_release();
  uint64_t v2 = *(void *)(v0 + 40);
  swift_getKeyPath();
  v15[0] = v0;
  swift_bridgeObjectRetain();
  sub_25F78B040();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    if (qword_26A7BB690 != -1) {
      swift_once();
    }
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    uint64_t v10 = (id)qword_26A7BCBA8;
    sub_25F78C300();
    sub_25F78C040();
    swift_getKeyPath();
    sub_25F78B040();
    swift_release();
    sub_25F78C000();
    sub_25F78C040();
    swift_bridgeObjectRelease();
    sub_25F78C040();
    swift_getKeyPath();
    sub_25F78B040();
    swift_release();
    uint64_t v11 = swift_bridgeObjectRetain();
    MEMORY[0x2611FE4A0](v11, &type metadata for TryItLesson);
    sub_25F78C040();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    os_log_type_t v12 = sub_25F78C1B0();
    if (os_log_type_enabled(v10, v12))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v15[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_25F789928(0, 0xE000000000000000, v15);
      sub_25F78C2A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F739000, v10, v12, "%s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611FEDE0](v14, -1, -1);
      MEMORY[0x2611FEDE0](v13, -1, -1);
    }
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v4 = *(void *)(v0 + 32);
  if (*(void *)(v2 + 32) != v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v3 - 1;
    while (v6 != v5)
    {
      uint64_t v7 = *(void *)(v2 + 40 + 8 * v5++);
      if (v7 == v4) {
        goto LABEL_7;
      }
    }
    goto LABEL_12;
  }
  uint64_t v5 = 0;
LABEL_7:
  swift_bridgeObjectRelease();
  unint64_t v8 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_19;
  }
  swift_getKeyPath();
  v15[0] = v1;
  sub_25F78B040();
  swift_release();
  if ((int64_t)v8 < *(void *)(*(void *)(v1 + 40) + 16))
  {
    swift_getKeyPath();
    v15[0] = v1;
    sub_25F78B040();
    swift_release();
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v8 < *(void *)(*(void *)(v1 + 40) + 16))
      {
        uint64_t KeyPath = swift_getKeyPath();
        MEMORY[0x270FA5388](KeyPath);
        v15[0] = v1;
        sub_25F78B030();
        swift_release();
        sub_25F764A08();
        return;
      }
      goto LABEL_20;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
  }
}

uint64_t sub_25F764A08()
{
  uint64_t v1 = sub_25F78AF50();
  MEMORY[0x270FA5388](v1 - 8);
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B030();
  swift_release();
  swift_getKeyPath();
  sub_25F78B030();
  swift_release();
  swift_getKeyPath();
  sub_25F78B030();
  swift_release();
  swift_getKeyPath();
  sub_25F78B040();
  swift_release();
  TryItLesson.initialInstruction.getter(*(void *)(v0 + 32));
  sub_25F78BFF0();
  swift_getKeyPath();
  sub_25F78B030();
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  sub_25F78B030();
  return swift_release();
}

uint64_t sub_25F764C9C()
{
  swift_getKeyPath();
  sub_25F765DC4();
  sub_25F78B040();
  uint64_t result = swift_release();
  if (*(void *)(*(void *)(v0 + 40) + 16))
  {
    swift_getKeyPath();
    sub_25F78B040();
    swift_release();
    uint64_t v2 = *(void *)(v0 + 32);
    swift_getKeyPath();
    sub_25F78B040();
    uint64_t result = swift_release();
    uint64_t v3 = *(void *)(v0 + 40);
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      if (v2 == *(void *)(v3 + 8 * v4 + 24))
      {
        uint64_t KeyPath = swift_getKeyPath();
        MEMORY[0x270FA5388](KeyPath);
        sub_25F78B030();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_25F764E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = sub_25F78C350();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F764EDC, 0, 0);
}

uint64_t sub_25F764EDC()
{
  sub_25F78C340();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_26A7BBD10 + dword_26A7BBD10);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25F764FA4;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_25F764FA4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
  if (v0) {
    uint64_t v3 = sub_25F765224;
  }
  else {
    uint64_t v3 = sub_25F76510C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25F76510C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  swift_getKeyPath();
  uint64_t v4 = (void *)swift_task_alloc();
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  v0[3] = v3;
  sub_25F765DC4();
  swift_bridgeObjectRetain();
  sub_25F78B030();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25F765224()
{
  uint64_t v10 = v0;
  if (qword_26A7BB690 != -1) {
    swift_once();
  }
  uint64_t v1 = (id)qword_26A7BCBA8;
  os_log_type_t v2 = sub_25F78C1D0();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = (void *)v0[11];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = sub_25F789928(0xD00000000000002BLL, 0x800000025F78F3E0, &v9);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v6, -1, -1);
    MEMORY[0x2611FEDE0](v5, -1, -1);
  }

  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25F7653E0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 8);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 32);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 40);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 16);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 24);
  swift_getKeyPath();
  sub_25F765DC4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25F78B040();
  swift_release();
  uint64_t v7 = sub_25F78C400();
  uint64_t v9 = v8;
  type metadata accessor for TryItLaunchAnalyticsEvent();
  swift_allocObject();
  uint64_t v10 = TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001BLL, 0x800000025F78F360, v1, v2, v3, v4, v5, v6, v7, v9);
  sub_25F786634(v10);
  return swift_release();
}

uint64_t sub_25F765530()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25F78B000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78AFF0();
  sub_25F78AFE0();
  double v7 = v6;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  double v9 = ceil(v7 / 60.0);
  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v9 < 9.22337204e18)
  {
    uint64_t v10 = v1 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(void *)(v10 + 80) = (uint64_t)v9;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t v13 = *(void *)(v10 + 40);
    uint64_t v27 = *(void *)(v10 + 32);
    uint64_t v28 = v11;
    uint64_t v14 = *(void *)(v10 + 16);
    uint64_t v15 = *(void *)(v10 + 24);
    uint64_t v25 = v12;
    uint64_t v26 = v14;
    swift_getKeyPath();
    uint64_t v29 = v1;
    sub_25F765DC4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25F78B040();
    swift_release();
    uint64_t v29 = *(void *)(v1 + 32);
    uint64_t v16 = sub_25F78C400();
    uint64_t v18 = v17;
    long long v24 = *(_OWORD *)(v10 + 64);
    uint64_t v19 = *(void *)(v10 + 80);
    char v20 = *(unsigned char *)(v10 + 88);
    char v21 = *(unsigned char *)(v10 + 89);
    LOBYTE(v12) = *(unsigned char *)(v10 + 90);
    LOBYTE(v10) = *(unsigned char *)(v10 + 91);
    type metadata accessor for TryItSessionAnalyticsEvent();
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 96) = v24;
    *(void *)(v22 + 112) = v19;
    *(unsigned char *)(v22 + 120) = v20;
    *(unsigned char *)(v22 + 121) = v21;
    *(unsigned char *)(v22 + 122) = v12;
    *(unsigned char *)(v22 + 123) = v10;
    uint64_t v23 = TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x800000025F78F450, v28, v25, v27, v13, v26, v15, v16, v18);
    sub_25F786634(v23);
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25F7657C8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 8);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 40);
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 32);
  uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 24);
  uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  type metadata accessor for TryItAttemptAnalyticsEvent();
  uint64_t v7 = swift_allocObject();
  if (v5) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v5;
  *(unsigned char *)(v7 + 112) = v5 == 0;
  swift_bridgeObjectRetain();
  uint64_t v9 = TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x800000025F78F340, v13, v2, v12, v3, v11, v4, 0, 0xE000000000000000);
  sub_25F786634(v9);
  return swift_release();
}

uint64_t sub_25F7659E4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_startTime;
  uint64_t v2 = sub_25F78B000();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager___observationRegistrar;
  uint64_t v4 = sub_25F78B060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_25F765B0C()
{
  sub_25F7659E4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25F765B64()
{
  return type metadata accessor for TrainingManager();
}

uint64_t type metadata accessor for TrainingManager()
{
  uint64_t result = qword_26A7BC2D0;
  if (!qword_26A7BC2D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25F765BB8()
{
  uint64_t result = sub_25F78B000();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25F78B060();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_25F765CE4()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = v1;
  *(_DWORD *)(v0 + 48) = 0x10000;
  *(_WORD *)(v0 + 52) = 0;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0;
  sub_25F78AFF0();
  uint64_t v2 = OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsManager;
  type metadata accessor for TryItAnalyticsManager();
  swift_allocObject();
  *(void *)(v0 + v2) = sub_25F7870E8();
  uint64_t v3 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
  *(_OWORD *)(v3 + 77) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *(unsigned char *)(v3 + 93) = 6;
  *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_delayedInstructionTask) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask) = 0;
  sub_25F78B050();
  return v0;
}

unint64_t sub_25F765DC4()
{
  unint64_t result = qword_26A7BB7A0;
  if (!qword_26A7BB7A0)
  {
    type metadata accessor for TrainingManager();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB7A0);
  }
  return result;
}

void sub_25F765E24()
{
  *(void *)(*(void *)(v0 + 16) + 32) = *(void *)(v0 + 24);
}

uint64_t sub_25F765E30()
{
  return sub_25F7661F4();
}

void sub_25F765E50()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 48) = *(unsigned char *)(v0 + 24);
}

void sub_25F765E68()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 49) = *(unsigned char *)(v0 + 24);
}

void sub_25F765E80()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 51) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_25F765E98()
{
  return sub_25F7661B4();
}

void sub_25F765EB8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 53) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_25F765EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F765F30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F765F90()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25F765FD8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25F7662A8;
  return sub_25F764E18(a1, v4, v5, v6, v7, v8);
}

void sub_25F7660A8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 50) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_25F7660B8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25F7660F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_25F74E910;
  return sub_25F763950(a1, v4, v5, v6);
}

uint64_t sub_25F7661B4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 16) = v0[3];
  *(void *)(v1 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F7661F4()
{
  *(void *)(*(void *)(v0 + 16) + 40) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_25F766230()
{
}

void sub_25F766248()
{
}

void sub_25F766260()
{
}

void sub_25F766278()
{
}

void sub_25F766290()
{
}

uint64_t destroy for ImageView(uint64_t a1)
{
  sub_25F743A74(*(void *)a1, *(unsigned char *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_25F7439F0(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ImageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_25F7439F0(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_25F743A74(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ImageView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_25F743A74(v6, v7);
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageView()
{
  return &type metadata for ImageView;
}

uint64_t sub_25F7664A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F7664C4@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25F78BC30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_25F78BFA0();
  id v11 = objc_msgSend(self, sel_bundleWithIdentifier_, v10);

  sub_25F78BC60();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B4B8], v6);
  uint64_t v12 = sub_25F78BC50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  a2 &= 1u;
  sub_25F7439F0(a1, a2);
  LOBYTE(v6) = sub_25F76B120(a1, a2) & 1;
  uint64_t result = sub_25F743A74(a1, a2);
  *(void *)a3 = v12;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  *(unsigned char *)(a3 + 17) = v6;
  return result;
}

uint64_t sub_25F76669C@<X0>(uint64_t a1@<X8>)
{
  return sub_25F7664C4(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

unint64_t sub_25F7666B8()
{
  unint64_t result = qword_26A7BC308;
  if (!qword_26A7BC308)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC308);
  }
  return result;
}

uint64_t *sub_25F76672C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = *(void *)v13;
    LOBYTE(v13) = v13[8];
    *(void *)uint64_t v12 = v14;
    v12[8] = (char)v13;
  }
  swift_retain();
  return a1;
}

uint64_t sub_25F766904(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25F78B730();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

void *sub_25F7669FC(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  return a1;
}

void *sub_25F766B88(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_25F766D38(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  return a1;
}

char *sub_25F766EC8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  return a1;
}

uint64_t sub_25F767078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F76708C);
}

uint64_t sub_25F76708C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25F767150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F767164);
}

uint64_t sub_25F767164(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  return result;
}

uint64_t type metadata accessor for HapticTouchButtonView()
{
  uint64_t result = qword_26A7BC358;
  if (!qword_26A7BC358) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F767274()
{
  sub_25F742A1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25F767308()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F767324()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC3B8);
  __swift_allocate_value_buffer(v0, qword_26A7BC318);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7BC318);
  return sub_25F78AFA0();
}

uint64_t sub_25F76738C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v71 = a1;
  uint64_t v2 = sub_25F78B730();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v69 = &v67[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  long long v87 = &v67[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v67[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  double v83 = &v67[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v81 = &v67[-v14];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v82 = &v67[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  long long v88 = &v67[-v18];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  char v21 = &v67[-v20];
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = &v67[-v22];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC368);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = &v67[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC370);
  MEMORY[0x270FA5388](v78);
  long long v86 = &v67[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC378);
  MEMORY[0x270FA5388](v84);
  long long v85 = &v67[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v26 = sub_25F78B600();
  *((void *)v26 + 1) = 0;
  v26[16] = 1;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC380);
  sub_25F767DA4(v1, (uint64_t *)&v26[*(int *)(v29 + 44)]);
  int v72 = sub_25F78B8D0();
  uint64_t v80 = v1;
  sub_25F76AB88((uint64_t)v23);
  uint64_t v30 = *(void (**)(void))(v3 + 104);
  unsigned int v76 = *MEMORY[0x263F19F00];
  uint64_t v74 = (void (*)(uint64_t, void, uint64_t))v30;
  uint64_t v75 = v3 + 104;
  v30(v21);
  int v73 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v3 + 56);
  v73(v21, 0, 1, v2);
  uint64_t v79 = v5;
  uint64_t v31 = (uint64_t)&v9[*(int *)(v5 + 48)];
  sub_25F73D580((uint64_t)v23, (uint64_t)v9, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v21, v31, &qword_26A7BB8A0);
  uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  unsigned int v33 = v32((uint64_t)v9, 1, v2);
  uint64_t v77 = v32;
  uint64_t v70 = v3;
  if (v33 == 1)
  {
    sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v23, &qword_26A7BB8A0);
    if (v32(v31, 1, v2) == 1)
    {
      sub_25F73D748((uint64_t)v9, &qword_26A7BB8A0);
      uint64_t v34 = (uint64_t)v86;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_25F73D580((uint64_t)v9, (uint64_t)v88, &qword_26A7BB8A0);
  if (v32(v31, 1, v2) == 1)
  {
    sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v23, &qword_26A7BB8A0);
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v88, v2);
LABEL_6:
    sub_25F73D748((uint64_t)v9, &qword_26A7BB990);
    uint64_t v34 = (uint64_t)v86;
    goto LABEL_10;
  }
  uint64_t v35 = v69;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 32))(v69, v31, v2);
  sub_25F7690E4(&qword_26A7BB998, MEMORY[0x263F19F18]);
  int v68 = sub_25F78BF70();
  uint64_t v36 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v36(v35, v2);
  sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
  sub_25F73D748((uint64_t)v23, &qword_26A7BB8A0);
  v36(v88, v2);
  sub_25F73D748((uint64_t)v9, &qword_26A7BB8A0);
  uint64_t v34 = (uint64_t)v86;
  if ((v68 & 1) == 0)
  {
LABEL_10:
    uint64_t v37 = (uint64_t)v81;
    if (qword_26A7BB670 == -1) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_8:
  uint64_t v37 = (uint64_t)v81;
  if (qword_26A7BB668 != -1) {
LABEL_22:
  }
    swift_once();
LABEL_11:
  uint64_t v38 = v70;
  sub_25F78B110();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  sub_25F73D580((uint64_t)v26, v34, &qword_26A7BC368);
  uint64_t v47 = v34 + *(int *)(v78 + 36);
  *(unsigned char *)uint64_t v47 = v72;
  *(void *)(v47 + 8) = v40;
  *(void *)(v47 + 16) = v42;
  *(void *)(v47 + 24) = v44;
  *(void *)(v47 + 32) = v46;
  *(unsigned char *)(v47 + 40) = 0;
  sub_25F73D748((uint64_t)v26, &qword_26A7BC368);
  LODWORD(v88) = sub_25F78B8B0();
  uint64_t v48 = v82;
  sub_25F76AB88((uint64_t)v82);
  v74(v37, v76, v2);
  v73((unsigned char *)v37, 0, 1, v2);
  uint64_t v49 = v87;
  uint64_t v50 = (uint64_t)&v87[*(int *)(v79 + 48)];
  sub_25F73D580((uint64_t)v48, (uint64_t)v87, &qword_26A7BB8A0);
  sub_25F73D580(v37, v50, &qword_26A7BB8A0);
  uint64_t v51 = v77;
  if (v77((uint64_t)v49, 1, v2) == 1)
  {
    sub_25F73D748(v37, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v48, &qword_26A7BB8A0);
    if (v51(v50, 1, v2) == 1)
    {
      sub_25F73D748((uint64_t)v49, &qword_26A7BB8A0);
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  sub_25F73D580((uint64_t)v49, (uint64_t)v83, &qword_26A7BB8A0);
  if (v51(v50, 1, v2) == 1)
  {
    sub_25F73D748(v37, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v48, &qword_26A7BB8A0);
    (*(void (**)(unsigned char *, uint64_t))(v38 + 8))(v83, v2);
LABEL_16:
    sub_25F73D748((uint64_t)v49, &qword_26A7BB990);
    goto LABEL_20;
  }
  uint64_t v52 = v69;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v38 + 32))(v69, v50, v2);
  sub_25F7690E4(&qword_26A7BB998, MEMORY[0x263F19F18]);
  uint64_t v53 = v83;
  LODWORD(v86) = sub_25F78BF70();
  uint64_t v54 = *(void (**)(unsigned char *, uint64_t))(v38 + 8);
  v54(v52, v2);
  sub_25F73D748(v37, &qword_26A7BB8A0);
  sub_25F73D748((uint64_t)v48, &qword_26A7BB8A0);
  v54(v53, v2);
  sub_25F73D748((uint64_t)v49, &qword_26A7BB8A0);
  if (v86)
  {
LABEL_18:
    if (qword_26A7BB658 == -1) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
LABEL_20:
  if (qword_26A7BB660 != -1) {
LABEL_23:
  }
    swift_once();
LABEL_21:
  uint64_t v55 = v71;
  sub_25F78B110();
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v64 = v85;
  sub_25F73D580(v34, (uint64_t)v85, &qword_26A7BC370);
  uint64_t v65 = &v64[*(int *)(v84 + 36)];
  unsigned char *v65 = (_BYTE)v88;
  *((void *)v65 + 1) = v57;
  *((void *)v65 + 2) = v59;
  *((void *)v65 + 3) = v61;
  *((void *)v65 + 4) = v63;
  v65[40] = 0;
  sub_25F73D748(v34, &qword_26A7BC370);
  return sub_25F73D51C((uint64_t)v64, v55, &qword_26A7BC378);
}

uint64_t sub_25F767DA4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v69 = a1;
  uint64_t v80 = a2;
  uint64_t v2 = sub_25F78B5E0();
  uint64_t v77 = *(void *)(v2 - 8);
  uint64_t v78 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v74 = &v64[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for HapticTouchButtonView();
  uint64_t v66 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v67 = v5;
  int v68 = &v64[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC388);
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v73 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v70 = &v64[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC390);
  uint64_t v75 = *(void *)(v8 - 8);
  uint64_t v76 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v81 = &v64[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC398);
  uint64_t v10 = MEMORY[0x270FA5388](v71);
  uint64_t v12 = &v64[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v79 = &v64[-v13];
  uint64_t v14 = sub_25F78B020();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v15 = sub_25F78AF40();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = &v64[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_25F78BF90();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v20 = sub_25F78AF50();
  MEMORY[0x270FA5388](v20 - 8);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v15, (uint64_t)qword_26A7BE398);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16))(v18, v21, v15);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v22 = sub_25F78BA10();
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  sub_25F78B990();
  uint64_t v27 = sub_25F78BA00();
  uint64_t v29 = v28;
  char v31 = v30;
  swift_release();
  sub_25F745E0C(v22, v24, v26);
  swift_bridgeObjectRelease();
  sub_25F78BBF0();
  uint64_t v32 = sub_25F78B9F0();
  uint64_t v34 = v33;
  int v65 = v35;
  uint64_t v37 = v36;
  swift_release();
  sub_25F745E0C(v27, v29, v31 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = v68;
  sub_25F768DEC(v69, (uint64_t)v68);
  unint64_t v40 = (*(unsigned __int8 *)(v66 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  uint64_t v41 = swift_allocObject();
  sub_25F768FC8((uint64_t)v39, v41 + v40);
  uint64_t v42 = v70;
  sub_25F78BCD0();
  uint64_t v43 = v74;
  sub_25F78B5D0();
  sub_25F73D9A4(&qword_26A7BC3A0, &qword_26A7BC388);
  sub_25F7690E4(&qword_26A7BC3A8, MEMORY[0x263F19958]);
  uint64_t v44 = v73;
  uint64_t v45 = v78;
  sub_25F78BA80();
  (*(void (**)(unsigned char *, uint64_t))(v77 + 8))(v43, v45);
  (*(void (**)(unsigned char *, uint64_t))(v72 + 8))(v42, v44);
  char v46 = sub_25F78B920();
  if (qword_26A7BB650 != -1) {
    swift_once();
  }
  char v47 = v65 & 1;
  sub_25F78B110();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v75;
  uint64_t v56 = v76;
  uint64_t v58 = v81;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v75 + 16))(v12, v81, v76);
  uint64_t v59 = &v12[*(int *)(v71 + 36)];
  unsigned char *v59 = v46;
  *((void *)v59 + 1) = v49;
  *((void *)v59 + 2) = v51;
  *((void *)v59 + 3) = v53;
  *((void *)v59 + 4) = v55;
  v59[40] = 0;
  (*(void (**)(unsigned char *, uint64_t))(v57 + 8))(v58, v56);
  uint64_t v60 = v79;
  sub_25F73D51C((uint64_t)v12, (uint64_t)v79, &qword_26A7BC398);
  sub_25F73D580((uint64_t)v60, (uint64_t)v12, &qword_26A7BC398);
  uint64_t v61 = v80;
  *uint64_t v80 = v32;
  v61[1] = v34;
  *((unsigned char *)v61 + 16) = v47;
  v61[3] = v37;
  v61[4] = KeyPath;
  *((unsigned char *)v61 + 40) = 1;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC3B0);
  sub_25F73D580((uint64_t)v12, (uint64_t)v61 + *(int *)(v62 + 48), &qword_26A7BC398);
  sub_25F745E70(v32, v34, v47);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25F73D748((uint64_t)v60, &qword_26A7BC398);
  sub_25F73D748((uint64_t)v12, &qword_26A7BC398);
  sub_25F745E0C(v32, v34, v47);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F7685EC(uint64_t a1)
{
  uint64_t v2 = sub_25F78BEC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = sub_25F78BF00();
  uint64_t v6 = *(void *)(v19[0] - 8);
  MEMORY[0x270FA5388](v19[0]);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25F78BED0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = *(unsigned char *)(a1 + *(int *)(type metadata accessor for HapticTouchButtonView() + 20) + 8);
  uint64_t v14 = swift_retain();
  uint64_t v15 = sub_25F76A324(v14, v13);
  swift_release();
  *(unsigned char *)(v15 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 91) = 1;
  swift_release();
  sub_25F76908C();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8F040], v9);
  uint64_t v16 = (void *)sub_25F78C240();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  aBlock[4] = sub_25F7689A4;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F770630;
  aBlock[3] = &block_descriptor_1;
  uint64_t v17 = _Block_copy(aBlock);
  sub_25F78BEE0();
  v19[1] = MEMORY[0x263F8EE78];
  sub_25F7690E4((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  sub_25F78C2E0();
  MEMORY[0x2611FE5E0](0, v8, v5, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, void))(v6 + 8))(v8, v19[0]);
}

void sub_25F7689A4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC3B8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = objc_msgSend(self, sel_defaultWorkspace);
  if (v3)
  {
    uint64_t v4 = v3;
    if (qword_26A7BB648 != -1) {
      swift_once();
    }
    uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_26A7BC318);
    sub_25F73D580(v5, (uint64_t)v2, &qword_26A7BC3B8);
    uint64_t v6 = sub_25F78AFB0();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v2, 1, v6) != 1)
    {
      uint64_t v8 = (void *)sub_25F78AF80();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v6);
    }
    objc_msgSend(v4, sel_openSensitiveURL_withOptions_, v8, 0);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25F768B44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25F78B020();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25F78AF40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78BF90();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_25F78AF50();
  MEMORY[0x270FA5388](v8 - 8);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t result = sub_25F78BA10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v11;
  *(unsigned char *)(a1 + 16) = v12 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

void sub_25F768D94()
{
  qword_26A7BC330 = 0x403B000000000000;
}

void sub_25F768DA4()
{
  qword_26A7BC338 = 0x403E000000000000;
}

void sub_25F768DB4()
{
  qword_26A7BC340 = 0x404E000000000000;
}

void sub_25F768DC4()
{
  qword_26A7BC348 = 0x404E000000000000;
}

void sub_25F768DD4()
{
  qword_26A7BC350 = 0x4049000000000000;
}

uint64_t sub_25F768DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HapticTouchButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F768E50()
{
  uint64_t v1 = *(void *)(type metadata accessor for HapticTouchButtonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F768FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HapticTouchButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F76902C()
{
  uint64_t v1 = *(void *)(type metadata accessor for HapticTouchButtonView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25F7685EC(v2);
}

unint64_t sub_25F76908C()
{
  unint64_t result = qword_26A7BB790;
  if (!qword_26A7BB790)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A7BB790);
  }
  return result;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25F7690E4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25F769130()
{
  unint64_t result = qword_26A7BC3C0;
  if (!qword_26A7BC3C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC378);
    sub_25F7691AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC3C0);
  }
  return result;
}

unint64_t sub_25F7691AC()
{
  unint64_t result = qword_26A7BC3C8;
  if (!qword_26A7BC3C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC370);
    sub_25F73D9A4(&qword_26A7BC3D0, &qword_26A7BC368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC3C8);
  }
  return result;
}

double static Double.dragCellOpacityDragging.getter()
{
  return 0.85;
}

double static Double.dragCellAnimationSpeed.getter()
{
  return 1.0;
}

uint64_t SelectTrainingView.body.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC3D8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v4 = *(unsigned char *)(v0 + 8);
  sub_25F7693A4(v4, (uint64_t)v3);
  uint64_t v5 = swift_retain();
  sub_25F76A324(v5, v4);
  swift_release();
  type metadata accessor for TrainingManager();
  sub_25F76A534();
  sub_25F76A908((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78BAB0();
  swift_release();
  return sub_25F73D748((uint64_t)v3, &qword_26A7BC3D8);
}

uint64_t sub_25F7693A4@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  char v2 = a1 & 1;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC460);
  MEMORY[0x270FA5388](v68);
  uint64_t v69 = (uint64_t)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC450);
  MEMORY[0x270FA5388](v78);
  uint64_t v70 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_25F78B0B0();
  uint64_t v58 = *(void *)(v59 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v59);
  uint64_t v56 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v55 = (char *)&v52 - v7;
  uint64_t v67 = type metadata accessor for PinchZoomView();
  uint64_t v8 = MEMORY[0x270FA5388](v67);
  uint64_t v54 = (uint64_t *)((char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v60 = (uint64_t)&v52 - v10;
  uint64_t v65 = type metadata accessor for SelectTextView();
  MEMORY[0x270FA5388](v65);
  uint64_t v57 = (uint64_t *)((char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC468);
  MEMORY[0x270FA5388](v61);
  uint64_t v64 = (uint64_t)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC430);
  MEMORY[0x270FA5388](v73);
  uint64_t v66 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for TouchHoldView();
  MEMORY[0x270FA5388](v63);
  uint64_t v53 = (uint64_t *)((char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v62 = type metadata accessor for TapView();
  MEMORY[0x270FA5388](v62);
  uint64_t v52 = (uint64_t *)((char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC470);
  MEMORY[0x270FA5388](v75);
  uint64_t v77 = (uint64_t)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC478);
  MEMORY[0x270FA5388](v71);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC480);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC410);
  MEMORY[0x270FA5388](v72);
  uint64_t v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC400);
  MEMORY[0x270FA5388](v76);
  uint64_t v74 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for DragView();
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (uint64_t *)((char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v28 = swift_retain();
  uint64_t v29 = sub_25F76A324(v28, v2);
  swift_release();
  swift_getKeyPath();
  uint64_t v81 = v29;
  sub_25F76A908((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  uint64_t v30 = *(void *)(v29 + 32);
  swift_release();
  switch(v30)
  {
    case 1:
      sub_25F7548C0(v27);
      char v31 = type metadata accessor for DragView;
      sub_25F76B33C((uint64_t)v27, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for DragView);
      swift_storeEnumTagMultiPayload();
      sub_25F76A908(&qword_26A7BC418, (void (*)(uint64_t))type metadata accessor for DragView);
      sub_25F76A908(&qword_26A7BC420, (void (*)(uint64_t))type metadata accessor for TapView);
      sub_25F78B6F0();
      sub_25F73D580((uint64_t)v23, (uint64_t)v18, &qword_26A7BC410);
      swift_storeEnumTagMultiPayload();
      sub_25F76A6A4();
      sub_25F76A780();
      uint64_t v32 = (uint64_t)v74;
      sub_25F78B6F0();
      sub_25F73D748((uint64_t)v23, &qword_26A7BC410);
      sub_25F73D580(v32, v77, &qword_26A7BC400);
      swift_storeEnumTagMultiPayload();
      sub_25F76A5E0();
      sub_25F76A85C();
      sub_25F78B6F0();
      sub_25F73D748(v32, &qword_26A7BC400);
      uint64_t v33 = (uint64_t)v27;
      goto LABEL_5;
    case 2:
      uint64_t v36 = v52;
      sub_25F74D554(v52);
      char v31 = type metadata accessor for TapView;
      sub_25F76B33C((uint64_t)v36, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for TapView);
      swift_storeEnumTagMultiPayload();
      sub_25F76A908(&qword_26A7BC418, (void (*)(uint64_t))type metadata accessor for DragView);
      sub_25F76A908(&qword_26A7BC420, (void (*)(uint64_t))type metadata accessor for TapView);
      sub_25F78B6F0();
      sub_25F73D580((uint64_t)v23, (uint64_t)v18, &qword_26A7BC410);
      swift_storeEnumTagMultiPayload();
      sub_25F76A6A4();
      sub_25F76A780();
      uint64_t v37 = (uint64_t)v74;
      sub_25F78B6F0();
      sub_25F73D748((uint64_t)v23, &qword_26A7BC410);
      sub_25F73D580(v37, v77, &qword_26A7BC400);
      swift_storeEnumTagMultiPayload();
      sub_25F76A5E0();
      sub_25F76A85C();
      sub_25F78B6F0();
      sub_25F73D748(v37, &qword_26A7BC400);
      uint64_t v33 = (uint64_t)v36;
LABEL_5:
      uint64_t v38 = v31;
      goto LABEL_11;
    case 3:
      uint64_t v39 = v53;
      sub_25F77D850(v53);
      unint64_t v40 = type metadata accessor for TouchHoldView;
      sub_25F76B33C((uint64_t)v39, v64, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
      goto LABEL_8;
    case 4:
      uint64_t v39 = v57;
      sub_25F740470(v57);
      unint64_t v40 = type metadata accessor for SelectTextView;
      sub_25F76B33C((uint64_t)v39, v64, (uint64_t (*)(void))type metadata accessor for SelectTextView);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      sub_25F76A908(&qword_26A7BC438, (void (*)(uint64_t))type metadata accessor for TouchHoldView);
      sub_25F76A908(&qword_26A7BC440, (void (*)(uint64_t))type metadata accessor for SelectTextView);
      uint64_t v41 = (uint64_t)v66;
      sub_25F78B6F0();
      sub_25F73D580(v41, (uint64_t)v18, &qword_26A7BC430);
      swift_storeEnumTagMultiPayload();
      sub_25F76A6A4();
      sub_25F76A780();
      uint64_t v42 = (uint64_t)v74;
      sub_25F78B6F0();
      sub_25F73D748(v41, &qword_26A7BC430);
      sub_25F73D580(v42, v77, &qword_26A7BC400);
      swift_storeEnumTagMultiPayload();
      sub_25F76A5E0();
      sub_25F76A85C();
      sub_25F78B6F0();
      sub_25F73D748(v42, &qword_26A7BC400);
      uint64_t v33 = (uint64_t)v39;
      goto LABEL_10;
    case 5:
      type metadata accessor for TrainingManager();
      uint64_t v43 = sub_25F78B190();
      uint64_t v44 = (uint64_t)v54;
      *uint64_t v54 = v43;
      *(unsigned char *)(v44 + 8) = v45 & 1;
      char v80 = 0;
      sub_25F78BC70();
      uint64_t v46 = v82;
      *(unsigned char *)(v44 + 16) = v81;
      *(void *)(v44 + 24) = v46;
      char v47 = v55;
      sub_25F78B0A0();
      uint64_t v48 = v58;
      uint64_t v49 = v59;
      (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v56, v47, v59);
      sub_25F78BC70();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
      uint64_t v50 = v60;
      sub_25F759B90(v44, v60);
      unint64_t v40 = type metadata accessor for PinchZoomView;
      sub_25F76B33C(v50, v69, (uint64_t (*)(void))type metadata accessor for PinchZoomView);
      swift_storeEnumTagMultiPayload();
      sub_25F76A908(&qword_26A7BC458, (void (*)(uint64_t))type metadata accessor for PinchZoomView);
      uint64_t v51 = (uint64_t)v70;
      sub_25F78B6F0();
      sub_25F73D580(v51, v77, &qword_26A7BC450);
      swift_storeEnumTagMultiPayload();
      sub_25F76A5E0();
      sub_25F76A85C();
      sub_25F78B6F0();
      sub_25F73D748(v51, &qword_26A7BC450);
      uint64_t v33 = v50;
LABEL_10:
      uint64_t v38 = v40;
LABEL_11:
      uint64_t result = sub_25F76B3A4(v33, (uint64_t (*)(void))v38);
      break;
    default:
      swift_storeEnumTagMultiPayload();
      sub_25F76A908(&qword_26A7BC458, (void (*)(uint64_t))type metadata accessor for PinchZoomView);
      uint64_t v34 = (uint64_t)v70;
      sub_25F78B6F0();
      sub_25F73D580(v34, v77, &qword_26A7BC450);
      swift_storeEnumTagMultiPayload();
      sub_25F76A5E0();
      sub_25F76A85C();
      sub_25F78B6F0();
      uint64_t result = sub_25F73D748(v34, &qword_26A7BC450);
      break;
  }
  return result;
}

uint64_t sub_25F76A1E4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC3D8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v4 = *(unsigned char *)(v0 + 8);
  sub_25F7693A4(v4, (uint64_t)v3);
  uint64_t v5 = swift_retain();
  sub_25F76A324(v5, v4);
  swift_release();
  type metadata accessor for TrainingManager();
  sub_25F76A534();
  sub_25F76A908((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78BAB0();
  swift_release();
  return sub_25F73D748((uint64_t)v3, &qword_26A7BC3D8);
}

uint64_t sub_25F76A324(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25F78B510();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_25F78C1C0();
    uint64_t v9 = sub_25F78B890();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v14 = sub_25F789928(0x676E696E69617254, 0xEF726567616E614DLL, &v15);
      sub_25F78C2A0();
      _os_log_impl(&dword_25F739000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611FEDE0](v12, -1, -1);
      MEMORY[0x2611FEDE0](v11, -1, -1);
    }

    sub_25F78B500();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

unint64_t sub_25F76A534()
{
  unint64_t result = qword_26A7BC3E0;
  if (!qword_26A7BC3E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC3D8);
    sub_25F76A61C(&qword_26A7BC3E8, &qword_26A7BC3F0, (void (*)(void))sub_25F76A5E0, (void (*)(void))sub_25F76A85C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC3E0);
  }
  return result;
}

uint64_t sub_25F76A5E0()
{
  return sub_25F76A61C(&qword_26A7BC3F8, &qword_26A7BC400, (void (*)(void))sub_25F76A6A4, (void (*)(void))sub_25F76A780);
}

uint64_t sub_25F76A61C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25F76A6A4()
{
  unint64_t result = qword_26A7BC408;
  if (!qword_26A7BC408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC410);
    sub_25F76A908(&qword_26A7BC418, (void (*)(uint64_t))type metadata accessor for DragView);
    sub_25F76A908(&qword_26A7BC420, (void (*)(uint64_t))type metadata accessor for TapView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC408);
  }
  return result;
}

unint64_t sub_25F76A780()
{
  unint64_t result = qword_26A7BC428;
  if (!qword_26A7BC428)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC430);
    sub_25F76A908(&qword_26A7BC438, (void (*)(uint64_t))type metadata accessor for TouchHoldView);
    sub_25F76A908(&qword_26A7BC440, (void (*)(uint64_t))type metadata accessor for SelectTextView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC428);
  }
  return result;
}

unint64_t sub_25F76A85C()
{
  unint64_t result = qword_26A7BC448;
  if (!qword_26A7BC448)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC450);
    sub_25F76A908(&qword_26A7BC458, (void (*)(uint64_t))type metadata accessor for PinchZoomView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC448);
  }
  return result;
}

uint64_t sub_25F76A908(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F76A950()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for SelectTrainingView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SelectTrainingView()
{
  return swift_release();
}

uint64_t assignWithCopy for SelectTrainingView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for SelectTrainingView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SelectTrainingView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SelectTrainingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
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

ValueMetadata *type metadata accessor for SelectTrainingView()
{
  return &type metadata for SelectTrainingView;
}

uint64_t sub_25F76AADC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F76AB88@<X0>(uint64_t a1@<X8>)
{
  return sub_25F76ABE0(&qword_26A7BB898, &qword_26A7BB8A0, 0xD000000000000020, 0x800000025F78F5F0, a1);
}

uint64_t sub_25F76ABB4@<X0>(uint64_t a1@<X8>)
{
  return sub_25F76ABE0(&qword_26A7BC0A0, &qword_26A7BC120, 0xD000000000000019, 0x800000025F78F620, a1);
}

uint64_t sub_25F76ABE0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_25F78B510();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F73D580(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_25F73D51C((uint64_t)v17, a5, a2);
  }
  os_log_type_t v19 = sub_25F78C1C0();
  uint64_t v20 = sub_25F78B890();
  if (os_log_type_enabled(v20, v19))
  {
    unint64_t v25 = a4;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v26 = a5;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v29 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v28 = sub_25F789928(v27, v25, &v29);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v23, -1, -1);
    MEMORY[0x2611FEDE0](v22, -1, -1);
  }

  sub_25F78B500();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_25F76AE68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25F78B510();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC0A8);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F73D580(v2, (uint64_t)v10, &qword_26A7BC0A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25F78B5F0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_25F78C1C0();
    uint64_t v14 = sub_25F78B890();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      void v19[2] = sub_25F789928(0xD000000000000013, 0x800000025F78F640, &v20);
      sub_25F78C2A0();
      _os_log_impl(&dword_25F739000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611FEDE0](v18, -1, -1);
      MEMORY[0x2611FEDE0](v16, -1, -1);
    }

    sub_25F78B500();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_25F76B120(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25F78B510();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_25F78C1C0();
  uint64_t v9 = sub_25F78B890();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_25F789928(0x4D746E65746E6F43, 0xEB0000000065646FLL, &v15);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v12, -1, -1);
    MEMORY[0x2611FEDE0](v11, -1, -1);
  }

  sub_25F78B500();
  swift_getAtKeyPath();
  sub_25F743A74(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_25F76B33C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F76B3A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_25F76B408(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25F76B4D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25F76B540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25F76B5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25F76B640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25F76B6C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25F76B740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F76B754);
}

uint64_t sub_25F76B754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25F76B7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F76B7D8);
}

uint64_t sub_25F76B7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SystemFontScaledSupport()
{
  uint64_t result = qword_26A7BC490;
  if (!qword_26A7BC490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F76B898()
{
  sub_25F76B930();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25F76B930()
{
  if (!qword_26A7BC4A0)
  {
    sub_25F76B98C();
    unint64_t v0 = sub_25F78B1D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7BC4A0);
    }
  }
}

unint64_t sub_25F76B98C()
{
  unint64_t result = qword_26A7BC4A8;
  if (!qword_26A7BC4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC4A8);
  }
  return result;
}

uint64_t sub_25F76B9E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F76BA04()
{
  return sub_25F78B200();
}

uint64_t sub_25F76BA20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB38);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  sub_25F78B1C0();
  uint64_t v7 = sub_25F78B940();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_25F78B970();
  sub_25F76BBAC((uint64_t)v6);
  uint64_t v8 = sub_25F78B980();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, a1, v10);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC4B8);
  uint64_t v12 = (uint64_t *)(a2 + *(int *)(result + 36));
  uint64_t *v12 = KeyPath;
  v12[1] = v8;
  return result;
}

uint64_t sub_25F76BBAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25F76BC18()
{
  unint64_t result = qword_26A7BC4C0;
  if (!qword_26A7BC4C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC4B8);
    sub_25F73D9A4(&qword_26A7BC4C8, &qword_26A7BC4B0);
    sub_25F73D9A4(&qword_26A7BC198, &qword_26A7BC1A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC4C0);
  }
  return result;
}

uint64_t TryItLesson.initialInstruction.getter(uint64_t a1)
{
  uint64_t v2 = sub_25F78B020();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25F78AF40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78BF90();
  MEMORY[0x270FA5388](v7 - 8);
  switch(a1)
  {
    case 1:
      sub_25F78BF80();
      if (qword_26A7BB640 != -1) {
        goto LABEL_15;
      }
      goto LABEL_14;
    case 2:
      sub_25F78BF80();
      if (qword_26A7BB640 == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 3:
      sub_25F78BF80();
      if (qword_26A7BB640 == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 4:
      sub_25F78BF80();
      if (qword_26A7BB640 == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 5:
      sub_25F78BF80();
      if (qword_26A7BB640 == -1) {
        goto LABEL_14;
      }
LABEL_15:
      swift_once();
LABEL_14:
      uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26A7BE398);
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
      sub_25F78B010();
      uint64_t result = sub_25F78AF60();
      break;
    default:
      uint64_t result = MEMORY[0x270EEF868](0, 0xE000000000000000);
      break;
  }
  return result;
}

uint64_t TryItLesson.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t result = 1734439492;
      break;
    case 2:
      uint64_t result = 7364948;
      break;
    case 3:
      uint64_t result = 0x6E61206863756F54;
      break;
    case 4:
      uint64_t result = 0x54207463656C6553;
      break;
    case 5:
      uint64_t result = 1836019546;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

unint64_t TryItLesson.init(rawValue:)(unint64_t a1)
{
  return sub_25F76C3F4(a1);
}

void *static TryItLesson.allCases.getter()
{
  return &unk_270BBA098;
}

BOOL sub_25F76C2D8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25F76C2EC()
{
  return sub_25F78C470();
}

uint64_t sub_25F76C334()
{
  return sub_25F78C460();
}

uint64_t sub_25F76C360()
{
  return sub_25F78C470();
}

unint64_t sub_25F76C3A4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25F76C3F4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_25F76C3D8(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_25F76C3E4(void *a1@<X8>)
{
  *a1 = &unk_270BBA098;
}

unint64_t sub_25F76C3F4(unint64_t result)
{
  if (result > 5) {
    return 0;
  }
  return result;
}

unint64_t sub_25F76C408()
{
  unint64_t result = qword_26A7BC4D0;
  if (!qword_26A7BC4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC4D0);
  }
  return result;
}

unint64_t sub_25F76C460()
{
  unint64_t result = qword_26A7BC4D8;
  if (!qword_26A7BC4D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC4E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC4D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TryItLesson()
{
  return &type metadata for TryItLesson;
}

uint64_t destroy for PracticeAgainButton()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PracticeAgainButton(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PracticeAgainButton(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PracticeAgainButton(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PracticeAgainButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PracticeAgainButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PracticeAgainButton()
{
  return &type metadata for PracticeAgainButton;
}

uint64_t sub_25F76C6A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F76C6BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v101 = a1;
  uint64_t v1 = sub_25F78BD10();
  MEMORY[0x270FA5388](v1 - 8);
  long long v100 = (char *)&v79 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25F78B3E0();
  uint64_t v98 = *(void *)(v3 - 8);
  uint64_t v99 = v3;
  MEMORY[0x270FA5388](v3);
  long long v97 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BDA0();
  uint64_t v95 = *(void *)(v5 - 8);
  uint64_t v96 = v5;
  MEMORY[0x270FA5388](v5);
  long long v92 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78B760();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC530);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC538);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC540) - 8;
  MEMORY[0x270FA5388](v82);
  uint64_t v20 = (char *)&v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC548) - 8;
  MEMORY[0x270FA5388](v84);
  uint64_t v80 = (uint64_t)&v79 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC550) - 8;
  MEMORY[0x270FA5388](v83);
  uint64_t v81 = (char *)&v79 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC558) - 8;
  MEMORY[0x270FA5388](v86);
  long long v85 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC560);
  MEMORY[0x270FA5388](v88);
  long long v87 = (char *)&v79 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC568);
  uint64_t v93 = *(void *)(v25 - 8);
  uint64_t v94 = v25;
  MEMORY[0x270FA5388](v25);
  long long v89 = (char *)&v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC570) - 8;
  MEMORY[0x270FA5388](v91);
  long long v90 = (char *)&v79 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78B770();
  char v28 = sub_25F78B8B0();
  sub_25F78B110();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
  uint64_t v37 = &v14[*(int *)(v12 + 44)];
  *uint64_t v37 = v28;
  *((void *)v37 + 1) = v30;
  *((void *)v37 + 2) = v32;
  *((void *)v37 + 3) = v34;
  *((void *)v37 + 4) = v36;
  v37[40] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  LOBYTE(v12) = sub_25F78B920();
  sub_25F78B110();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  sub_25F73D580((uint64_t)v14, (uint64_t)v18, &qword_26A7BC530);
  uint64_t v46 = &v18[*(int *)(v16 + 44)];
  *uint64_t v46 = v12;
  *((void *)v46 + 1) = v39;
  *((void *)v46 + 2) = v41;
  *((void *)v46 + 3) = v43;
  *((void *)v46 + 4) = v45;
  v46[40] = 0;
  sub_25F73D748((uint64_t)v14, &qword_26A7BC530);
  id v47 = objc_msgSend(self, sel_systemBlueColor);
  uint64_t v48 = MEMORY[0x2611FDFD0](v47);
  uint64_t KeyPath = swift_getKeyPath();
  sub_25F73D580((uint64_t)v18, (uint64_t)v20, &qword_26A7BC538);
  uint64_t v50 = (uint64_t *)&v20[*(int *)(v82 + 44)];
  *uint64_t v50 = KeyPath;
  v50[1] = v48;
  sub_25F73D748((uint64_t)v18, &qword_26A7BC538);
  if (sub_25F78B780()) {
    double v51 = 0.5;
  }
  else {
    double v51 = 1.0;
  }
  uint64_t v52 = v80;
  sub_25F73D580((uint64_t)v20, v80, &qword_26A7BC540);
  *(double *)(v52 + *(int *)(v84 + 44)) = v51;
  sub_25F73D748((uint64_t)v20, &qword_26A7BC540);
  uint64_t v53 = v92;
  sub_25F78BD90();
  char v54 = sub_25F78B8C0();
  uint64_t v55 = (uint64_t)v81;
  uint64_t v56 = &v81[*(int *)(v83 + 44)];
  uint64_t v58 = v95;
  uint64_t v57 = v96;
  (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v56, v53, v96);
  v56[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC578) + 36)] = v54;
  sub_25F73D580(v52, v55, &qword_26A7BC548);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v53, v57);
  sub_25F73D748(v52, &qword_26A7BC548);
  uint64_t v59 = v97;
  sub_25F78B3D0();
  uint64_t v60 = swift_getKeyPath();
  uint64_t v61 = (uint64_t)v85;
  uint64_t v62 = (uint64_t *)&v85[*(int *)(v86 + 44)];
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC580);
  uint64_t v65 = v98;
  uint64_t v64 = v99;
  (*(void (**)(char *, char *, uint64_t))(v98 + 16))((char *)v62 + *(int *)(v63 + 28), v59, v99);
  *uint64_t v62 = v60;
  sub_25F73D580(v55, v61, &qword_26A7BC550);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v59, v64);
  sub_25F73D748(v55, &qword_26A7BC550);
  uint64_t v66 = *MEMORY[0x263F19860];
  uint64_t v67 = sub_25F78B5A0();
  uint64_t v68 = (uint64_t)v100;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104))(v100, v66, v67);
  uint64_t v69 = (uint64_t)v87;
  uint64_t v70 = (uint64_t)&v87[*(int *)(v88 + 36)];
  sub_25F76DB10(v68, v70);
  *(_WORD *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC588) + 36)) = 256;
  uint64_t v71 = v69;
  sub_25F73D580(v61, v69, &qword_26A7BC558);
  sub_25F76DB74(v68);
  sub_25F73D748(v61, &qword_26A7BC558);
  sub_25F78B960();
  sub_25F76DBD0();
  uint64_t v72 = v89;
  sub_25F78BA70();
  sub_25F73D748(v71, &qword_26A7BC560);
  uint64_t v73 = sub_25F78BE30();
  uint64_t v75 = v93;
  uint64_t v74 = v94;
  uint64_t v76 = (uint64_t)v90;
  (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v90, v72, v94);
  uint64_t v77 = (uint64_t *)(v76 + *(int *)(v91 + 44));
  *uint64_t v77 = v73;
  v77[1] = 0;
  (*(void (**)(char *, uint64_t))(v75 + 8))(v72, v74);
  return sub_25F73D51C(v76, v101, &qword_26A7BC570);
}

uint64_t sub_25F76D008(uint64_t a1, char a2, void (*a3)(void))
{
  char v3 = a2 & 1;
  a3();
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_25F76A324(v4, v3);
  swift_release();
  *(unsigned char *)(v5 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 90) = 1;
  return swift_release();
}

uint64_t sub_25F76D088@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_25F78B540();
  *(void *)(a1 + 8) = 0x4000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC510);
  return sub_25F76D0D0(a1 + *(int *)(v2 + 44));
}

uint64_t sub_25F76D0D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v1 = sub_25F78B020();
  MEMORY[0x270FA5388](v1 - 8);
  id v47 = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25F78AF40();
  uint64_t v44 = *(void *)(v3 - 8);
  uint64_t v45 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v46 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  MEMORY[0x270FA5388](v5 - 8);
  v41[1] = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78AF50();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v43 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC518);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (void *)((char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_25F78BC40();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC520);
  uint64_t v18 = v17 - 8;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v42 = (uint64_t)v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (void *)((char *)v41 - v22);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v41 - v24;
  uint64_t v26 = sub_25F78BC20();
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F1B538], v13);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)v12 + *(int *)(v10 + 36), v16, v13);
  uint64_t *v12 = KeyPath;
  sub_25F73D580((uint64_t)v12, (uint64_t)v23 + *(int *)(v18 + 44), &qword_26A7BC518);
  *uint64_t v23 = v26;
  swift_retain();
  sub_25F73D748((uint64_t)v12, &qword_26A7BC518);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_release();
  sub_25F73D51C((uint64_t)v23, (uint64_t)v25, &qword_26A7BC520);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v28 = v45;
  uint64_t v29 = __swift_project_value_buffer(v45, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v46, v29, v28);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v30 = sub_25F78BA10();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  uint64_t v37 = v42;
  sub_25F73D580((uint64_t)v25, v42, &qword_26A7BC520);
  uint64_t v38 = v48;
  sub_25F73D580(v37, v48, &qword_26A7BC520);
  uint64_t v39 = v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC528) + 48);
  *(void *)uint64_t v39 = v30;
  *(void *)(v39 + 8) = v32;
  *(unsigned char *)(v39 + 16) = v36;
  *(void *)(v39 + 24) = v34;
  sub_25F745E70(v30, v32, v36);
  swift_bridgeObjectRetain();
  sub_25F73D748((uint64_t)v25, &qword_26A7BC520);
  sub_25F745E0C(v30, v32, v36);
  swift_bridgeObjectRelease();
  return sub_25F73D748(v37, &qword_26A7BC520);
}

uint64_t sub_25F76D624()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC4E8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  char v6 = *((unsigned char *)v0 + 8);
  uint64_t v8 = v0[2];
  uint64_t v7 = v0[3];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  *(unsigned char *)(v9 + 24) = v6;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = v7;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC4F0);
  sub_25F73D9A4(&qword_26A7BC4F8, &qword_26A7BC4F0);
  sub_25F78BCD0();
  sub_25F73D9A4(&qword_26A7BC500, &qword_26A7BC4E8);
  sub_25F76D85C();
  sub_25F78BA90();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_25F76D804()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25F76D844()
{
  return sub_25F76D008(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void (**)(void))(v0 + 32));
}

unint64_t sub_25F76D85C()
{
  unint64_t result = qword_26A7BC508;
  if (!qword_26A7BC508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC508);
  }
  return result;
}

uint64_t sub_25F76D8B0()
{
  return sub_25F78B3F0();
}

uint64_t sub_25F76D8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_25F76D9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25F76D8D4(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

ValueMetadata *type metadata accessor for PracticeAgainButtonStyle()
{
  return &type metadata for PracticeAgainButtonStyle;
}

uint64_t sub_25F76D9F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F76DA88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F76DAAC()
{
  return sub_25F78B450();
}

uint64_t sub_25F76DAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25F76D8D4(a1, a2, a3, a4, MEMORY[0x263F19168], MEMORY[0x263F193E0]);
}

uint64_t sub_25F76DB10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F78BD10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F76DB74(uint64_t a1)
{
  uint64_t v2 = sub_25F78BD10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25F76DBD0()
{
  unint64_t result = qword_26A7BC590;
  if (!qword_26A7BC590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC560);
    sub_25F76DC70();
    sub_25F73D9A4(&qword_26A7BC5E0, &qword_26A7BC588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC590);
  }
  return result;
}

unint64_t sub_25F76DC70()
{
  unint64_t result = qword_26A7BC598;
  if (!qword_26A7BC598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC558);
    sub_25F76DD10();
    sub_25F73D9A4(&qword_26A7BC5D8, &qword_26A7BC580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC598);
  }
  return result;
}

unint64_t sub_25F76DD10()
{
  unint64_t result = qword_26A7BC5A0;
  if (!qword_26A7BC5A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC550);
    sub_25F76DEA8(&qword_26A7BC5A8, &qword_26A7BC548, (void (*)(void))sub_25F76DDDC);
    sub_25F73D9A4(&qword_26A7BC5D0, &qword_26A7BC578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC5A0);
  }
  return result;
}

unint64_t sub_25F76DDDC()
{
  unint64_t result = qword_26A7BC5B0;
  if (!qword_26A7BC5B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC540);
    sub_25F76DEA8(&qword_26A7BC5B8, &qword_26A7BC538, (void (*)(void))sub_25F76DF24);
    sub_25F73D9A4(&qword_26A7BC1B8, &qword_26A7BC1C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC5B0);
  }
  return result;
}

uint64_t sub_25F76DEA8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_25F76DF24()
{
  return sub_25F76DEA8(&qword_26A7BC5C0, &qword_26A7BC530, (void (*)(void))sub_25F76DF54);
}

unint64_t sub_25F76DF54()
{
  unint64_t result = qword_26A7BC5C8;
  if (!qword_26A7BC5C8)
  {
    sub_25F78B760();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC5C8);
  }
  return result;
}

unint64_t sub_25F76DFB0()
{
  unint64_t result = qword_26A7BC5E8;
  if (!qword_26A7BC5E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC570);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC560);
    sub_25F76DBD0();
    swift_getOpaqueTypeConformance2();
    sub_25F73D9A4(&qword_26A7BC5F0, &qword_26A7BC5F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC5E8);
  }
  return result;
}

char *TryItViewController.__allocating_init(lessonURL:tipID:collectionID:correlationID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)(a1, a2, a3, a4, a5, a6, a7);
}

char *TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  uint64_t v27 = a5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC600);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (uint64_t *)((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&v7[OBJC_IVAR___TryItViewController_hostingController] = 0;
  *(void *)&v7[OBJC_IVAR___TryItViewController_delegate] = 0;
  id v15 = &v7[OBJC_IVAR___TryItViewController_tryItView];
  uint64_t v16 = type metadata accessor for TipsTryItView();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  uint64_t v18 = (objc_class *)type metadata accessor for TryItViewController();
  v30.receiver = v7;
  v30.super_class = v18;
  uint64_t v19 = (char *)objc_msgSendSuper2(&v30, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v20 = sub_25F7889A8(a1);
  TipsTryItView.init(lessons:tipId:collectionId:correlationId:)((uint64_t)v20, a2, a3, a4, v27, v28, v29, v14);
  v17((char *)v14, 0, 1, v16);
  uint64_t v21 = (uint64_t)&v19[OBJC_IVAR___TryItViewController_tryItView];
  swift_beginAccess();
  sub_25F76EE04((uint64_t)v14, v21);
  swift_endAccess();
  sub_25F76EE6C(v21, (uint64_t)v14);
  id v22 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC620));
  uint64_t v23 = sub_25F78B630();

  uint64_t v24 = sub_25F78AFB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(a1, v24);
  uint64_t v25 = *(void **)&v19[OBJC_IVAR___TryItViewController_hostingController];
  *(void *)&v19[OBJC_IVAR___TryItViewController_hostingController] = v23;

  return v19;
}

uint64_t type metadata accessor for TryItViewController()
{
  uint64_t result = qword_26A7BC630;
  if (!qword_26A7BC630) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25F76E5D8()
{
  uint64_t v1 = type metadata accessor for TipsTryItView();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC600);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v0 + OBJC_IVAR___TryItViewController_tryItView;
  swift_beginAccess();
  sub_25F76EE6C(v8, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1)) {
    return sub_25F76EED4((uint64_t)v7);
  }
  sub_25F76EF34((uint64_t)v7, (uint64_t)v4);
  sub_25F76EED4((uint64_t)v7);
  sub_25F765530();
  return sub_25F76EF98((uint64_t)v4);
}

void sub_25F76E7F4()
{
  uint64_t v1 = v0;
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for TryItViewController();
  objc_msgSendSuper2(&v33, sel_loadView);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___TryItViewController_hostingController];
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v3, sel_view);
    if (!v4)
    {
LABEL_10:

      return;
    }
    uint64_t v5 = v4;
    objc_msgSend(v0, sel_addChildViewController_, v3);
    id v6 = objc_msgSend(v0, sel_view);
    if (v6)
    {
      uint64_t v7 = v6;
      objc_msgSend(v6, sel_addSubview_, v5);

      id v8 = objc_msgSend(self, sel_systemBackgroundColor);
      objc_msgSend(v5, sel_setBackgroundColor_, v8);

      objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      id v9 = objc_msgSend(v1, sel_view);
      if (v9)
      {
        uint64_t v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BCCA0);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_25F78E190;
        id v12 = objc_msgSend(v5, sel_leadingAnchor);
        id v13 = objc_msgSend(v1, sel_view);
        if (v13)
        {
          uint64_t v14 = v13;
          id v15 = objc_msgSend(v13, sel_leadingAnchor);

          id v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
          *(void *)(v11 + 32) = v16;
          id v17 = objc_msgSend(v5, sel_topAnchor);
          id v18 = objc_msgSend(v1, sel_view);
          if (v18)
          {
            uint64_t v19 = v18;
            id v20 = objc_msgSend(v18, sel_topAnchor);

            id v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
            *(void *)(v11 + 40) = v21;
            id v22 = objc_msgSend(v5, sel_trailingAnchor);
            id v23 = objc_msgSend(v1, sel_view);
            if (v23)
            {
              uint64_t v24 = v23;
              id v25 = objc_msgSend(v23, sel_trailingAnchor);

              id v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
              *(void *)(v11 + 48) = v26;
              id v27 = objc_msgSend(v5, sel_bottomAnchor);
              id v28 = objc_msgSend(v1, sel_view);
              if (v28)
              {
                uint64_t v29 = v28;
                id v30 = objc_msgSend(v28, sel_bottomAnchor);

                id v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
                *(void *)(v11 + 56) = v31;
                sub_25F78C0F0();
                sub_25F76F0D8();
                uint64_t v32 = (void *)sub_25F78C0D0();
                swift_bridgeObjectRelease();
                objc_msgSend(v10, sel_addConstraints_, v32);

                objc_msgSend(v3, sel_didMoveToParentViewController_, v1);
                goto LABEL_10;
              }
LABEL_17:
              __break(1u);
              return;
            }
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

id TryItViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_25F78BFA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void TryItViewController.init(nibName:bundle:)()
{
}

id TryItViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TryItViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25F76EE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F76EE6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F76EED4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC600);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F76EF34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipsTryItView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F76EF98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TipsTryItView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25F76F0D8()
{
  unint64_t result = qword_26A7BC628;
  if (!qword_26A7BC628)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A7BC628);
  }
  return result;
}

uint64_t sub_25F76F118()
{
  return type metadata accessor for TryItViewController();
}

void sub_25F76F120()
{
  sub_25F76F21C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for TryItViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TryItViewController);
}

uint64_t dispatch thunk of TryItViewController.__allocating_init(lessonURL:tipID:collectionID:correlationID:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of TryItViewController.logEndSession()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

void sub_25F76F21C()
{
  if (!qword_26A7BC640)
  {
    type metadata accessor for TipsTryItView();
    unint64_t v0 = sub_25F78C290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7BC640);
    }
  }
}

uint64_t *sub_25F76F274(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    id v13 = (char *)a1 + v11;
    uint64_t v14 = (char *)a2 + v11;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v14) = v14[8];
    *(void *)id v13 = v15;
    v13[8] = (char)v14;
    id v16 = (uint64_t *)((char *)a1 + v12);
    id v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    v16[2] = v17[2];
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    id v21 = (char *)a1 + v19;
    id v22 = (char *)a2 + v19;
    *id v21 = *v22;
    *((void *)v21 + 1) = *((void *)v22 + 1);
    id v23 = (char *)a1 + v20;
    uint64_t v24 = (char *)a2 + v20;
    *id v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v25 = a3[9];
    uint64_t v26 = a3[10];
    id v27 = (uint64_t *)((char *)a1 + v25);
    id v28 = (uint64_t *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *id v27 = *v28;
    v27[1] = v29;
    id v30 = (char *)a1 + v26;
    id v31 = (char *)a2 + v26;
    *(_OWORD *)id v30 = *(_OWORD *)v31;
    *((void *)v30 + 2) = *((void *)v31 + 2);
    uint64_t v32 = a3[11];
    uint64_t v33 = a3[12];
    uint64_t v34 = (uint64_t *)((char *)a1 + v32);
    char v35 = (uint64_t *)((char *)a2 + v32);
    uint64_t v36 = v35[1];
    uint64_t v41 = (char *)a2 + v33;
    uint64_t v40 = (char *)a1 + v33;
    *uint64_t v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = sub_25F78B9E0();
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v39(v40, v41, v37);
  }
  return a1;
}

uint64_t sub_25F76F58C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25F78B730();
    uint64_t v5 = *(void *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 48);
  uint64_t v7 = sub_25F78B9E0();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *sub_25F76F734(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v9;
  uint64_t v12 = (char *)a2 + v9;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  uint64_t v14 = (void *)((char *)a1 + v10);
  uint64_t v15 = (void *)((char *)a2 + v10);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  v14[2] = v15[2];
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  char *v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  id v21 = (char *)a1 + v18;
  id v22 = (char *)a2 + v18;
  *id v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  uint64_t v23 = a3[9];
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v23);
  uint64_t v26 = (void *)((char *)a2 + v23);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  id v28 = (char *)a1 + v24;
  uint64_t v29 = (char *)a2 + v24;
  *(_OWORD *)id v28 = *(_OWORD *)v29;
  *((void *)v28 + 2) = *((void *)v29 + 2);
  uint64_t v30 = a3[11];
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)((char *)a1 + v30);
  uint64_t v33 = (void *)((char *)a2 + v30);
  uint64_t v34 = v33[1];
  uint64_t v39 = (char *)a2 + v31;
  uint64_t v38 = (char *)a1 + v31;
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = sub_25F78B9E0();
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v37(v38, v39, v35);
  return a1;
}

void *sub_25F76F9FC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_retain();
  swift_release();
  *((void *)v14 + 2) = *((void *)v15 + 2);
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *uint64_t v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  id v21 = (char *)a2 + v19;
  *uint64_t v20 = *v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  _OWORD v26[2] = v27[2];
  swift_retain();
  swift_release();
  uint64_t v28 = a3[11];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  swift_retain();
  swift_release();
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[12];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = sub_25F78B9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  return a1;
}

char *sub_25F76FD2C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = &a1[v11];
  uint64_t v15 = &a2[v11];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((void *)v14 + 2) = *((void *)v15 + 2);
  uint64_t v16 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  uint64_t v17 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *((void *)v18 + 2) = *((void *)v19 + 2);
  long long v20 = *(_OWORD *)v19;
  uint64_t v21 = a3[11];
  uint64_t v22 = a3[12];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  *(_OWORD *)uint64_t v18 = v20;
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  uint64_t v25 = sub_25F78B9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
  return a1;
}

char *sub_25F76FF5C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  *((void *)v15 + 2) = *((void *)v16 + 2);
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *uint64_t v18 = *v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *uint64_t v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  uint64_t v23 = a3[9];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_release();
  uint64_t v26 = a3[10];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *((void *)v27 + 2) = *((void *)v28 + 2);
  swift_release();
  uint64_t v29 = a3[11];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  *(void *)&a1[v29] = *(void *)&a2[v29];
  swift_release();
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_release();
  uint64_t v32 = a3[12];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  uint64_t v35 = sub_25F78B9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
  return a1;
}

uint64_t sub_25F770244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F770258);
}

uint64_t sub_25F770258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
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
    uint64_t v11 = sub_25F78B9E0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 48);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_25F77038C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F7703A0);
}

uint64_t sub_25F7703A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
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
    uint64_t v11 = sub_25F78B9E0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 48);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for InstructionView()
{
  uint64_t result = qword_26A7BC648;
  if (!qword_26A7BC648) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F770520()
{
  sub_25F742A1C();
  if (v0 <= 0x3F)
  {
    sub_25F78B9E0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_25F770614()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F770630(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25F770674@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>, double a6@<D0>)
{
  *a5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (int *)type metadata accessor for InstructionView();
  uint64_t v13 = (char *)a5 + v12[5];
  *(void *)uint64_t v13 = a1;
  v13[8] = a2 & 1;
  uint64_t v14 = (char *)a5 + v12[6];
  *(void *)uint64_t v14 = a3;
  *((void *)v14 + 1) = a4;
  *((double *)v14 + 2) = a6;
  uint64_t v15 = (char *)a5 + v12[7];
  sub_25F78BC70();
  char *v15 = v21;
  *((void *)v15 + 1) = *((void *)&v21 + 1);
  uint64_t v16 = (char *)a5 + v12[8];
  sub_25F78BC70();
  char *v16 = v21;
  *((void *)v16 + 1) = *((void *)&v21 + 1);
  uint64_t v17 = (_OWORD *)((char *)a5 + v12[9]);
  sub_25F78BC70();
  *uint64_t v17 = v21;
  uint64_t v18 = (char *)a5 + v12[10];
  type metadata accessor for CGSize(0);
  sub_25F78BC70();
  *(_OWORD *)uint64_t v18 = v21;
  *((void *)v18 + 2) = v22;
  uint64_t v19 = v12[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC7A8);
  sub_25F78BC70();
  *(_OWORD *)((char *)a5 + v19) = v21;
  return sub_25F78B9D0();
}

uint64_t sub_25F770824@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25F77538C((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 49);
  return result;
}

uint64_t sub_25F7708CC()
{
  return swift_release();
}

uint64_t sub_25F77099C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v127 = a1;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC658) - 8;
  MEMORY[0x270FA5388](v111);
  uint64_t v3 = (char *)&v103 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InstructionView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v118 = v4 - 8;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC660);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFC0);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFC8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v105 = (uint64_t)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC668) - 8;
  MEMORY[0x270FA5388](v110);
  uint64_t v17 = (char *)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC670) - 8;
  MEMORY[0x270FA5388](v115);
  uint64_t v19 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC678) - 8;
  MEMORY[0x270FA5388](v116);
  uint64_t v112 = (uint64_t)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC680);
  MEMORY[0x270FA5388](v114);
  uint64_t v113 = (uint64_t)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC688);
  uint64_t v122 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v117 = (char *)&v103 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC690);
  MEMORY[0x270FA5388](v119);
  long long v126 = (char *)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC698);
  MEMORY[0x270FA5388](v123);
  uint64_t v125 = (uint64_t)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC6A0);
  MEMORY[0x270FA5388](v121);
  uint64_t v120 = (uint64_t)&v103 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_25F78B600();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v26 = (uint64_t *)&v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC6A8) + 44)];
  uint64_t v103 = v1;
  sub_25F771684(v1, v26);
  uint64_t v109 = type metadata accessor for InstructionView;
  uint64_t v27 = v1;
  uint64_t v28 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = v28;
  sub_25F774CE0(v27, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for InstructionView);
  uint64_t v29 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v107 = ((v29 + 16) & ~v29) + v6;
  uint64_t v30 = (v29 + 16) & ~v29;
  uint64_t v108 = v30;
  uint64_t v106 = v29 | 7;
  uint64_t v31 = swift_allocObject();
  sub_25F774024((uint64_t)v28, v31 + v30);
  uint64_t v32 = sub_25F78BDE0();
  uint64_t v34 = v33;
  sub_25F73D580((uint64_t)v9, (uint64_t)v3, &qword_26A7BC660);
  uint64_t v35 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v3[*(int *)(v111 + 44)];
  *uint64_t v35 = sub_25F757194;
  v35[1] = 0;
  v35[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v32;
  v35[3] = v34;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = sub_25F774088;
  *(void *)(v36 + 24) = v31;
  sub_25F73D580((uint64_t)v3, (uint64_t)v13, &qword_26A7BC658);
  uint64_t v37 = (uint64_t (**)(double *))&v13[*(int *)(v11 + 44)];
  *uint64_t v37 = sub_25F74FABC;
  v37[1] = (uint64_t (*)(double *))v36;
  sub_25F73D748((uint64_t)v3, &qword_26A7BC658);
  sub_25F73D748((uint64_t)v9, &qword_26A7BC660);
  uint64_t v38 = sub_25F78BDE0();
  uint64_t v39 = v105;
  sub_25F7520BC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v105, 0.0, 1, 0.0, 1, v38, v40);
  sub_25F73D748((uint64_t)v13, &qword_26A7BBFC0);
  LOBYTE(v31) = sub_25F78B8E0();
  sub_25F78B110();
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  sub_25F73D580(v39, (uint64_t)v17, &qword_26A7BBFC8);
  uint64_t v49 = &v17[*(int *)(v110 + 44)];
  *uint64_t v49 = v31;
  *((void *)v49 + 1) = v42;
  *((void *)v49 + 2) = v44;
  *((void *)v49 + 3) = v46;
  *((void *)v49 + 4) = v48;
  v49[40] = 0;
  sub_25F73D748(v39, &qword_26A7BBFC8);
  LOBYTE(v31) = sub_25F78B8B0();
  sub_25F78B110();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  sub_25F73D580((uint64_t)v17, (uint64_t)v19, &qword_26A7BC668);
  uint64_t v58 = &v19[*(int *)(v115 + 44)];
  *uint64_t v58 = v31;
  *((void *)v58 + 1) = v51;
  *((void *)v58 + 2) = v53;
  *((void *)v58 + 3) = v55;
  *((void *)v58 + 4) = v57;
  v58[40] = 0;
  sub_25F73D748((uint64_t)v17, &qword_26A7BC668);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v60 = v112;
  sub_25F73D580((uint64_t)v19, v112, &qword_26A7BC670);
  uint64_t v61 = v60 + *(int *)(v116 + 44);
  *(void *)uint64_t v61 = KeyPath;
  *(unsigned char *)(v61 + 8) = 1;
  sub_25F73D748((uint64_t)v19, &qword_26A7BC670);
  uint64_t v62 = v118;
  uint64_t v63 = v103;
  uint64_t v64 = v103 + *(int *)(v118 + 36);
  char v65 = *(unsigned char *)v64;
  uint64_t v116 = v64;
  uint64_t v66 = *(void *)(v64 + 8);
  LOBYTE(v131) = v65;
  uint64_t v132 = v66;
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  if (v128) {
    double v67 = -10.0;
  }
  else {
    double v67 = 0.0;
  }
  uint64_t v68 = v113;
  sub_25F73D580(v60, v113, &qword_26A7BC678);
  uint64_t v69 = v68 + *(int *)(v114 + 36);
  *(double *)uint64_t v69 = v67;
  *(void *)(v69 + 8) = 0;
  sub_25F73D748(v60, &qword_26A7BC678);
  uint64_t v70 = v63 + *(int *)(v62 + 28);
  char v71 = *(unsigned char *)(v70 + 8);
  uint64_t v72 = swift_retain();
  uint64_t v73 = sub_25F76A324(v72, v71);
  swift_release();
  swift_getKeyPath();
  uint64_t v131 = v73;
  sub_25F77538C((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  char v74 = *(unsigned char *)(v73 + 49);
  swift_release();
  LOBYTE(v131) = v74;
  uint64_t v75 = (uint64_t)v104;
  sub_25F774CE0(v63, (uint64_t)v104, (uint64_t (*)(void))v109);
  uint64_t v76 = swift_allocObject();
  sub_25F774024(v75, v76 + v108);
  sub_25F7746E8(&qword_26A7BC6B0, &qword_26A7BC680, (void (*)(void))sub_25F77461C);
  uint64_t v77 = v117;
  sub_25F78BB80();
  swift_release();
  sub_25F73D748(v68, &qword_26A7BC680);
  LOBYTE(v73) = *(unsigned char *)(v70 + 8);
  uint64_t v78 = swift_retain();
  uint64_t v79 = sub_25F76A324(v78, v73);
  swift_release();
  swift_getKeyPath();
  uint64_t v131 = v79;
  sub_25F78B040();
  swift_release();
  int v80 = *(unsigned __int8 *)(v79 + 52);
  swift_release();
  if (v80 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC700);
    uint64_t v81 = swift_allocObject();
    *(_OWORD *)(v81 + 16) = xmmword_25F78E1F0;
    id v82 = objc_msgSend(self, sel_systemBackgroundColor);
    *(void *)(v81 + 32) = MEMORY[0x2611FDFD0](v82);
    *(void *)(v81 + 40) = sub_25F78BBC0();
    uint64_t v131 = v81;
    sub_25F78C0F0();
    uint64_t v83 = v131;
    sub_25F78BEB0();
    sub_25F78BEA0();
    MEMORY[0x2611FE110](v83);
    sub_25F78B2E0();
    uint64_t v118 = v131;
    uint64_t v114 = v132;
    uint64_t v84 = v134;
    uint64_t v113 = v133;
    uint64_t v85 = v135;
    uint64_t v86 = sub_25F78B320();
    char v87 = sub_25F78B8C0();
  }
  else
  {
    uint64_t v118 = 0;
    uint64_t v114 = 0;
    uint64_t v113 = 0;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    char v87 = 0;
  }
  uint64_t v88 = sub_25F78BDE0();
  uint64_t v90 = v89;
  uint64_t v91 = v122;
  uint64_t v92 = (uint64_t)v126;
  uint64_t v93 = v124;
  (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v126, v77, v124);
  uint64_t v94 = v92 + *(int *)(v119 + 36);
  uint64_t v95 = v114;
  *(void *)uint64_t v94 = v118;
  *(void *)(v94 + 8) = v95;
  *(void *)(v94 + 16) = v113;
  *(void *)(v94 + 24) = v84;
  *(void *)(v94 + 32) = v85;
  *(void *)(v94 + 40) = v86;
  *(unsigned char *)(v94 + 48) = v87;
  *(void *)(v94 + 56) = v88;
  *(void *)(v94 + 64) = v90;
  (*(void (**)(char *, uint64_t))(v91 + 8))(v77, v93);
  sub_25F78BE80();
  uint64_t v96 = sub_25F78BE10();
  swift_release();
  uint64_t v97 = *(void *)(v116 + 8);
  char v128 = *(unsigned char *)v116;
  uint64_t v129 = v97;
  sub_25F78BC80();
  char v98 = v130;
  uint64_t v99 = v125;
  sub_25F73D580(v92, v125, &qword_26A7BC690);
  uint64_t v100 = v99 + *(int *)(v123 + 36);
  *(void *)uint64_t v100 = v96;
  *(unsigned char *)(v100 + 8) = v98;
  sub_25F73D748(v92, &qword_26A7BC690);
  uint64_t v101 = v120;
  sub_25F73D580(v99, v120, &qword_26A7BC698);
  *(unsigned char *)(v101 + *(int *)(v121 + 36)) = 0;
  sub_25F73D748(v99, &qword_26A7BC698);
  return sub_25F774930(v101, v127);
}

uint64_t sub_25F771684@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v176 = a2;
  uint64_t v3 = type metadata accessor for InstructionView();
  uint64_t v172 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v173 = v4;
  uint64_t v174 = (uint64_t)&v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_25F78B730();
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  double v139 = (char *)&v136 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v6 = MEMORY[0x270FA5388](v155);
  uint64_t v140 = (uint64_t)&v136 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v141 = (uint64_t)&v136 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v138 = (uint64_t)&v136 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v143 = (uint64_t)&v136 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v145 = (uint64_t)&v136 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v137 = (uint64_t)&v136 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v142 = (uint64_t)&v136 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v144 = (uint64_t)&v136 - v20;
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC488);
  uint64_t v153 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  long long v152 = (char *)&v136 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = type metadata accessor for SystemFontScaledSupport();
  MEMORY[0x270FA5388](v151);
  long long v150 = (char *)&v136 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_25F78B9A0();
  uint64_t v23 = *(void *)(v148 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v148);
  long long v149 = (char *)&v136 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v136 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v136 - v29;
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC728);
  MEMORY[0x270FA5388](v147);
  uint64_t v179 = (uint64_t)&v136 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC730);
  MEMORY[0x270FA5388](v158);
  uint64_t v160 = (uint64_t)&v136 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC738);
  MEMORY[0x270FA5388](v159);
  uint64_t v162 = (uint64_t)&v136 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC740);
  MEMORY[0x270FA5388](v161);
  uint64_t v163 = (uint64_t)&v136 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC748);
  MEMORY[0x270FA5388](v182);
  uint64_t v168 = (uint64_t)&v136 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC750);
  uint64_t v170 = *(void *)(v171 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v171);
  long long v169 = (char *)&v136 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v167 = (char *)&v136 - v39;
  MEMORY[0x270FA5388](v38);
  v183 = (char *)&v136 - v40;
  v184 = (int *)v3;
  uint64_t v41 = *(int *)(v3 + 20);
  uint64_t v175 = a1;
  uint64_t v42 = a1 + v41;
  char v43 = *(unsigned char *)(a1 + v41 + 8);
  uint64_t v44 = swift_retain();
  uint64_t v45 = sub_25F76A324(v44, v43);
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v188 = v45;
  uint64_t v46 = sub_25F77538C((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  LODWORD(a1) = *(unsigned __int8 *)(v45 + 48);
  swift_release();
  uint64_t v178 = v42;
  if (a1 == 1)
  {
    type metadata accessor for TrainingManager();
    uint64_t v166 = sub_25F78B190();
    uint64_t v165 = v47 & 1;
    double v185 = 0.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB710);
    sub_25F78BC70();
    long long v164 = v188;
    double v185 = 0.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB720);
    sub_25F78BC70();
    uint64_t v180 = *((void *)&v188 + 1);
    v181 = (void *)v188;
    char v43 = *(unsigned char *)(v42 + 8);
  }
  else
  {
    uint64_t v166 = 0;
    uint64_t v165 = 0;
    uint64_t v180 = 0;
    v181 = 0;
    long long v164 = 1uLL;
  }
  uint64_t v48 = swift_retain();
  uint64_t v49 = sub_25F76A324(v48, v43);
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v188 = v49;
  uint64_t v177 = v46;
  sub_25F78B040();
  swift_release();
  uint64_t v50 = *(void *)(v49 + 24);
  uint64_t v146 = *(void *)(v49 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v51 = v175;
  uint64_t v52 = (uint64_t *)(v175 + v184[9]);
  uint64_t v53 = *v52;
  uint64_t v54 = v52[1];
  *(void *)&long long v188 = v53;
  *((void *)&v188 + 1) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC80();
  double v55 = v185;
  uint64_t v56 = v23;
  uint64_t v57 = *(void (**)(char *, void, uint64_t))(v23 + 104);
  uint64_t v58 = v148;
  v57(v30, *MEMORY[0x263F1A6D8], v148);
  sub_25F78B950();
  uint64_t v60 = v59;
  uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  v61(v28, v30, v58);
  *(double *)&long long v188 = v55;
  v61(v149, v28, v58);
  sub_25F76B98C();
  uint64_t v62 = v152;
  sub_25F78B1B0();
  uint64_t v63 = *(void (**)(char *, uint64_t))(v56 + 8);
  v63(v28, v58);
  uint64_t v64 = (uint64_t)v150;
  (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v150, v62, v154);
  *(void *)(v64 + *(int *)(v151 + 20)) = v60;
  uint64_t v65 = v179;
  sub_25F774CE0(v64, v179 + *(int *)(v147 + 36), (uint64_t (*)(void))type metadata accessor for SystemFontScaledSupport);
  *(void *)uint64_t v65 = v146;
  *(void *)(v65 + 8) = v50;
  *(unsigned char *)(v65 + 16) = 0;
  *(void *)(v65 + 24) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_25F77505C(v64, (uint64_t (*)(void))type metadata accessor for SystemFontScaledSupport);
  v63(v30, v58);
  swift_bridgeObjectRelease();
  uint64_t v66 = (uint64_t *)(v51 + v184[6]);
  uint64_t v67 = *v66;
  uint64_t v68 = v66[1];
  uint64_t v69 = v66[2];
  *(void *)&long long v188 = *v66;
  *((void *)&v188 + 1) = v68;
  *(void *)&long long v189 = v69;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBA08);
  MEMORY[0x2611FE0A0](&v185);
  if (v185 <= 0.0)
  {
    uint64_t v79 = v145;
    uint64_t v72 = v51;
    sub_25F76AB88(v145);
    uint64_t v80 = v156;
    uint64_t v81 = v143;
    uint64_t v82 = v157;
    (*(void (**)(uint64_t, void, uint64_t))(v156 + 104))(v143, *MEMORY[0x263F19F00], v157);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v80 + 56))(v81, 0, 1, v82);
    uint64_t v76 = v140;
    uint64_t v83 = v140 + *(int *)(v155 + 48);
    sub_25F73D580(v79, v140, &qword_26A7BB8A0);
    sub_25F73D580(v81, v83, &qword_26A7BB8A0);
    uint64_t v84 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
    if (v84(v76, 1, v82) == 1)
    {
      sub_25F73D748(v81, &qword_26A7BB8A0);
      sub_25F73D748(v79, &qword_26A7BB8A0);
      if (v84(v83, 1, v82) == 1)
      {
LABEL_10:
        sub_25F73D748(v76, &qword_26A7BB8A0);
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    uint64_t v86 = v138;
    sub_25F73D580(v76, v138, &qword_26A7BB8A0);
    if (v84(v83, 1, v82) == 1)
    {
      sub_25F73D748(v143, &qword_26A7BB8A0);
      sub_25F73D748(v145, &qword_26A7BB8A0);
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v86, v82);
LABEL_16:
      sub_25F73D748(v76, &qword_26A7BB990);
      goto LABEL_19;
    }
    uint64_t v89 = v139;
    (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v139, v83, v82);
    sub_25F77538C(&qword_26A7BB998, MEMORY[0x263F19F18]);
    sub_25F78BF70();
    uint64_t v90 = *(void (**)(char *, uint64_t))(v80 + 8);
    v90(v89, v82);
    sub_25F73D748(v143, &qword_26A7BB8A0);
    sub_25F73D748(v145, &qword_26A7BB8A0);
    v90((char *)v86, v82);
    sub_25F73D748(v76, &qword_26A7BB8A0);
  }
  else
  {
    *(void *)&long long v188 = v67;
    *((void *)&v188 + 1) = v68;
    *(void *)&long long v189 = v69;
    MEMORY[0x2611FE0A0](&v185, v70, v185);
    uint64_t v71 = v144;
    uint64_t v72 = v51;
    sub_25F76AB88(v144);
    uint64_t v73 = v156;
    uint64_t v74 = v142;
    uint64_t v75 = v157;
    (*(void (**)(uint64_t, void, uint64_t))(v156 + 104))(v142, *MEMORY[0x263F19F00], v157);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v73 + 56))(v74, 0, 1, v75);
    uint64_t v76 = v141;
    uint64_t v77 = v141 + *(int *)(v155 + 48);
    sub_25F73D580(v71, v141, &qword_26A7BB8A0);
    sub_25F73D580(v74, v77, &qword_26A7BB8A0);
    uint64_t v78 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48);
    if (v78(v76, 1, v75) == 1)
    {
      sub_25F73D748(v74, &qword_26A7BB8A0);
      sub_25F73D748(v71, &qword_26A7BB8A0);
      if (v78(v77, 1, v75) == 1) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
    uint64_t v85 = v137;
    sub_25F73D580(v76, v137, &qword_26A7BB8A0);
    if (v78(v77, 1, v75) == 1)
    {
      sub_25F73D748(v142, &qword_26A7BB8A0);
      sub_25F73D748(v144, &qword_26A7BB8A0);
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v85, v75);
      goto LABEL_16;
    }
    char v87 = v139;
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 32))(v139, v77, v75);
    sub_25F77538C(&qword_26A7BB998, MEMORY[0x263F19F18]);
    sub_25F78BF70();
    uint64_t v88 = *(void (**)(char *, uint64_t))(v73 + 8);
    v88(v87, v75);
    sub_25F73D748(v142, &qword_26A7BB8A0);
    sub_25F73D748(v144, &qword_26A7BB8A0);
    v88((char *)v85, v75);
    sub_25F73D748(v76, &qword_26A7BB8A0);
  }
LABEL_19:
  char v91 = *(unsigned char *)(v178 + 8);
  uint64_t v92 = swift_retain();
  uint64_t v93 = sub_25F76A324(v92, v91);
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v188 = v93;
  sub_25F78B040();
  swift_release();
  int v94 = *(unsigned __int8 *)(v93 + 48);
  swift_release();
  if (v94 == 1) {
    sub_25F78BDC0();
  }
  else {
    sub_25F78BDE0();
  }
  sub_25F78B220();
  uint64_t v95 = v179;
  uint64_t v96 = v160;
  sub_25F73D580(v179, v160, &qword_26A7BC728);
  uint64_t v97 = (_OWORD *)(v96 + *(int *)(v158 + 36));
  long long v98 = v189;
  *uint64_t v97 = v188;
  v97[1] = v98;
  v97[2] = v190;
  sub_25F73D748(v95, &qword_26A7BC728);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v100 = v162;
  sub_25F73D580(v96, v162, &qword_26A7BC730);
  uint64_t v101 = (uint64_t *)(v100 + *(int *)(v159 + 36));
  *uint64_t v101 = KeyPath;
  v101[1] = 0x3FE0000000000000;
  sub_25F73D748(v96, &qword_26A7BC730);
  uint64_t v102 = v72;
  uint64_t v103 = v72 + v184[8];
  char v104 = *(unsigned char *)v103;
  uint64_t v105 = *(void *)(v103 + 8);
  LOBYTE(v185) = v104;
  uint64_t v186 = v105;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  if (v187) {
    double v106 = 1.0;
  }
  else {
    double v106 = 0.0;
  }
  uint64_t v107 = v163;
  sub_25F73D580(v100, v163, &qword_26A7BC738);
  *(double *)(v107 + *(int *)(v161 + 36)) = v106;
  sub_25F73D748(v100, &qword_26A7BC738);
  uint64_t v108 = v72;
  uint64_t v109 = v174;
  sub_25F774CE0(v108, v174, (uint64_t (*)(void))type metadata accessor for InstructionView);
  unint64_t v110 = (*(unsigned __int8 *)(v172 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v172 + 80);
  uint64_t v111 = swift_allocObject();
  sub_25F774024(v109, v111 + v110);
  uint64_t v112 = v168;
  sub_25F73D580(v107, v168, &qword_26A7BC740);
  uint64_t v113 = (uint64_t (**)())(v112 + *(int *)(v182 + 36));
  *uint64_t v113 = sub_25F774DA0;
  v113[1] = (uint64_t (*)())v111;
  v113[2] = 0;
  v113[3] = 0;
  sub_25F73D748(v107, &qword_26A7BC740);
  char v114 = *(unsigned char *)(v178 + 8);
  uint64_t v115 = swift_retain();
  *(double *)&uint64_t v116 = COERCE_DOUBLE(sub_25F76A324(v115, v114));
  swift_release();
  swift_getKeyPath();
  double v185 = *(double *)&v116;
  sub_25F78B040();
  swift_release();
  double v118 = *(double *)(v116 + 16);
  uint64_t v117 = *(void *)(v116 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  double v185 = v118;
  uint64_t v186 = v117;
  sub_25F774CE0(v102, v109, (uint64_t (*)(void))type metadata accessor for InstructionView);
  uint64_t v119 = swift_allocObject();
  sub_25F774024(v109, v119 + v110);
  sub_25F7746E8(&qword_26A7BC758, &qword_26A7BC748, (void (*)(void))sub_25F774DD4);
  uint64_t v120 = v167;
  sub_25F78BB90();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25F73D748(v112, &qword_26A7BC748);
  uint64_t v121 = v170;
  uint64_t v122 = v183;
  uint64_t v123 = v120;
  uint64_t v124 = v171;
  (*(void (**)(char *, char *, uint64_t))(v170 + 32))(v183, v123, v171);
  uint64_t v125 = *(void (**)(char *, char *, uint64_t))(v121 + 16);
  long long v126 = v169;
  v125(v169, v122, v124);
  uint64_t v127 = v176;
  uint64_t v128 = v166;
  uint64_t v129 = v165;
  *long long v176 = v166;
  v127[1] = v129;
  long long v130 = v164;
  *((_OWORD *)v127 + 1) = v164;
  uint64_t v131 = v180;
  v127[4] = (uint64_t)v181;
  v127[5] = v131;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC798);
  v125((char *)v127 + *(int *)(v132 + 48), v126, v124);
  uint64_t v133 = v181;
  sub_25F774F7C(v128, v129, (void *)v130, *((uint64_t *)&v130 + 1), v181);
  uint64_t v134 = *(void (**)(char *, uint64_t))(v121 + 8);
  v134(v183, v124);
  v134(v126, v124);
  return sub_25F774FF4(v128, v129, (void *)v130, *((uint64_t *)&v130 + 1), v133);
}

uint64_t sub_25F772C6C(uint64_t a1)
{
  uint64_t v29 = sub_25F78BEC0();
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v28 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25F78BF00();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for InstructionView();
  uint64_t v7 = v6 - 8;
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v25 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = sub_25F78BF20();
  uint64_t v27 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v16 = a1 + *(int *)(v7 + 48);
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v16 + 16);
  long long aBlock = *(_OWORD *)v16;
  uint64_t v34 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC720);
  sub_25F78BC80();
  sub_25F773110(v38, v39);
  sub_25F76908C();
  uint64_t v18 = (void *)sub_25F78C210();
  sub_25F78BF10();
  MEMORY[0x2611FE2F0](v13, 0.5);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26(v13, v9);
  sub_25F774CE0(a1, (uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for InstructionView);
  unint64_t v19 = (*(unsigned __int8 *)(v25 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v20 = swift_allocObject();
  sub_25F774024((uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  uint64_t v36 = sub_25F7752E8;
  uint64_t v37 = v20;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v34 = sub_25F770630;
  uint64_t v35 = &block_descriptor_2;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  sub_25F78BEE0();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_25F77538C((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  uint64_t v22 = v28;
  uint64_t v23 = v29;
  sub_25F78C2E0();
  MEMORY[0x2611FE5B0](v15, v5, v22, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v23);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v31);
  return ((uint64_t (*)(char *, uint64_t))v26)(v15, v27);
}

uint64_t sub_25F773110(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for InstructionView();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F774CE0(v2, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InstructionView);
  if (a1 == 0.0 && a2 == 0.0) {
    return sub_25F77505C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InstructionView);
  }
  char v10 = v8[*(int *)(v6 + 20) + 8];
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_25F76A324(v11, v10);
  swift_release();
  swift_getKeyPath();
  uint64_t v25 = v12;
  sub_25F77538C((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  uint64_t v13 = *(void *)(v12 + 16);
  unint64_t v14 = *(void *)(v12 + 24);
  swift_release();
  if ((v14 & 0x2000000000000000) != 0) {
    uint64_t v15 = HIBYTE(v14) & 0xF;
  }
  else {
    uint64_t v15 = v13 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = sub_25F77505C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InstructionView);
  if (v15)
  {
    sub_25F78B930();
    unint64_t v16 = sub_25F774138();
    swift_release();
    if (v16 <= 2)
    {
      uint64_t v21 = (uint64_t *)(v3 + *(int *)(v6 + 36));
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      uint64_t v25 = v22;
      uint64_t v26 = v23;
      uint64_t v20 = 0x403C000000000000;
    }
    else
    {
      uint64_t v17 = (uint64_t *)(v3 + *(int *)(v6 + 36));
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      if (v16 == 3) {
        uint64_t v20 = 0x4033000000000000;
      }
      else {
        uint64_t v20 = 0x4030000000000000;
      }
    }
    v24[1] = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
    return sub_25F78BC90();
  }
  return result;
}

uint64_t sub_25F773368()
{
  return swift_release();
}

uint64_t sub_25F7733E4()
{
  return swift_release();
}

uint64_t sub_25F773498()
{
  type metadata accessor for InstructionView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC720);
  sub_25F78BC80();
  return sub_25F773110(v1, v2);
}

uint64_t sub_25F773504()
{
  return sub_25F78BC90();
}

void sub_25F77357C(uint64_t a1, unsigned char *a2)
{
  if (*a2 == 1)
  {
    uint64_t v2 = sub_25F78BE60();
    MEMORY[0x270FA5388](v2);
    sub_25F78B2C0();
    swift_release();
  }
}

uint64_t sub_25F773628(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InstructionView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC2E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1 + *(int *)(v2 + 28);
  char v10 = *(unsigned char *)v9;
  uint64_t v11 = *(void *)(v9 + 8);
  LOBYTE(v20) = v10;
  *((void *)&v20 + 1) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  uint64_t result = sub_25F78BC80();
  if ((v21 & 1) == 0)
  {
    uint64_t v13 = *(int *)(v2 + 44);
    long long v20 = *(_OWORD *)(a1 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC708);
    sub_25F78BC80();
    if (v21)
    {
      sub_25F78C180();
      swift_release();
    }
    uint64_t v14 = sub_25F78C170();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
    sub_25F774CE0(a1, (uint64_t)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for InstructionView);
    sub_25F78C140();
    uint64_t v15 = sub_25F78C130();
    unint64_t v16 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = MEMORY[0x263F8F500];
    *(void *)(v17 + 16) = v15;
    *(void *)(v17 + 24) = v18;
    sub_25F774024((uint64_t)v5, v17 + v16);
    uint64_t v19 = sub_25F77D6A4((uint64_t)v8, (uint64_t)&unk_26A7BC718, v17);
    long long v20 = *(_OWORD *)(a1 + v13);
    uint64_t v21 = v19;
    return sub_25F78BC90();
  }
  return result;
}

uint64_t sub_25F7738B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  uint64_t v5 = sub_25F78C350();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  sub_25F78C140();
  v4[13] = sub_25F78C130();
  uint64_t v7 = sub_25F78C120();
  v4[14] = v7;
  v4[15] = v6;
  return MEMORY[0x270FA2498](sub_25F7739A8, v7, v6);
}

uint64_t sub_25F7739A8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = type metadata accessor for InstructionView();
  *(void *)(v0 + 128) = v2;
  uint64_t v3 = *(int *)(v2 + 28);
  *(_DWORD *)(v0 + 160) = v3;
  uint64_t v4 = (char *)(v1 + v3);
  char v5 = *v4;
  uint64_t v6 = *((void *)v4 + 1);
  *(unsigned char *)(v0 + 16) = v5;
  *(void *)(v0 + 24) = v6;
  *(unsigned char *)(v0 + 164) = 1;
  *(void *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC90();
  uint64_t v7 = sub_25F78C480();
  uint64_t v9 = v8;
  sub_25F78C340();
  uint64_t v12 = (char *)&dword_26A7BBD10 + dword_26A7BBD10;
  char v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v10;
  *char v10 = v0;
  v10[1] = sub_25F773AE8;
  return ((uint64_t (*)(uint64_t, uint64_t, void, void, uint64_t))v12)(v7, v9, 0, 0, 1);
}

uint64_t sub_25F773AE8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[11] + 8))(v2[12], v2[10]);
  uint64_t v3 = v2[15];
  uint64_t v4 = v2[14];
  if (v0) {
    char v5 = sub_25F773E58;
  }
  else {
    char v5 = sub_25F773C70;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25F773C70()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 72);
  swift_release();
  LOBYTE(v2) = *(unsigned char *)(v2 + *(int *)(v1 + 20) + 8);
  uint64_t v3 = swift_retain();
  uint64_t v4 = sub_25F76A324(v3, v2);
  swift_release();
  swift_getKeyPath();
  *(void *)(v0 + 56) = v4;
  sub_25F77538C((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  if (*(unsigned char *)(v4 + 48) == 1)
  {
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    uint64_t v5 = swift_task_alloc();
    *(void *)(v5 + 16) = v4;
    *(unsigned char *)(v5 + 24) = 0;
    *(void *)(v0 + 64) = v4;
    sub_25F78B030();
    swift_release();
    swift_release();
    swift_task_dealloc();
  }
  uint64_t v6 = (char *)(*(void *)(v0 + 72) + *(int *)(v0 + 160));
  char v7 = *v6;
  uint64_t v8 = *((void *)v6 + 1);
  *(unsigned char *)(v0 + 32) = v7;
  *(void *)(v0 + 40) = v8;
  *(unsigned char *)(v0 + 165) = 0;
  sub_25F78BC90();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_25F773E58()
{
  char v10 = v0;
  swift_release();
  if (qword_26A7BB690 != -1) {
    swift_once();
  }
  uint64_t v1 = (id)qword_26A7BCBA8;
  os_log_type_t v2 = sub_25F78C1D0();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = (void *)v0[19];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[6] = sub_25F789928(0xD000000000000023, 0x800000025F78F9F0, &v9);
    sub_25F78C2A0();
    _os_log_impl(&dword_25F739000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v6, -1, -1);
    MEMORY[0x2611FEDE0](v5, -1, -1);
  }

  swift_task_dealloc();
  char v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25F774024(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstructionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F774088()
{
  type metadata accessor for InstructionView();
  return sub_25F773504();
}

uint64_t sub_25F774100()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F774138()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC7A0);
  MEMORY[0x270FA5388](v1 - 8);
  BOOL v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25F78BA00();
  uint64_t v41 = v5;
  uint64_t v42 = v4;
  uint64_t v43 = v6;
  int v40 = v7 & 1;
  char v8 = *(unsigned char *)(v0 + *(int *)(type metadata accessor for InstructionView() + 20) + 8);
  uint64_t v9 = swift_retain();
  uint64_t v10 = sub_25F76A324(v9, v8);
  swift_release();
  swift_getKeyPath();
  uint64_t v44 = v10;
  sub_25F77538C((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  uint64_t v12 = *(void *)(v10 + 16);
  uint64_t v11 = *(void *)(v10 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v44 = v12;
  uint64_t v45 = v11;
  sub_25F743B64();
  uint64_t v13 = sub_25F78BA20();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  uint64_t v18 = sub_25F78BA00();
  uint64_t v37 = v19;
  uint64_t v38 = v18;
  uint64_t v39 = v20;
  HIDWORD(v36) = v21 & 1;
  sub_25F745E0C(v13, v15, v17);
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_25F78B9B0();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v3, 1, 1, v22);
  uint64_t v25 = v41;
  uint64_t v24 = v42;
  char v26 = v40;
  sub_25F78B9C0();
  double v28 = v27;
  sub_25F73D748((uint64_t)v3, &qword_26A7BC7A0);
  v23(v3, 1, 1, v22);
  uint64_t v30 = v37;
  uint64_t v29 = v38;
  char v31 = BYTE4(v36);
  sub_25F78B9C0();
  double v33 = v32;
  sub_25F73D748((uint64_t)v3, &qword_26A7BC7A0);
  double v34 = round(v33 / v28);
  sub_25F745E0C(v29, v30, v31);
  swift_bridgeObjectRelease();
  sub_25F745E0C(v24, v25, v26);
  uint64_t result = swift_bridgeObjectRelease();
  if ((~*(void *)&v34 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v34 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v34 < 9.22337204e18) {
    return (uint64_t)v34;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25F774494@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25F78B460();
  *a1 = v3;
  return result;
}

uint64_t sub_25F7744C0()
{
  return sub_25F78B470();
}

uint64_t sub_25F7744E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25F78B4A0();
  *a1 = result;
  return result;
}

uint64_t sub_25F774514@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25F78B4A0();
  *a1 = result;
  return result;
}

uint64_t sub_25F774540()
{
  return sub_25F78B4B0();
}

uint64_t sub_25F774568()
{
  return sub_25F78B4B0();
}

void sub_25F77459C(uint64_t a1, unsigned char *a2)
{
  type metadata accessor for InstructionView();
  sub_25F77357C(a1, a2);
}

unint64_t sub_25F77461C()
{
  unint64_t result = qword_26A7BC6B8;
  if (!qword_26A7BC6B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC678);
    sub_25F7746E8(&qword_26A7BC6C0, &qword_26A7BC670, (void (*)(void))sub_25F774764);
    sub_25F73D9A4(&qword_26A7BC6F0, &qword_26A7BC6F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC6B8);
  }
  return result;
}

uint64_t sub_25F7746E8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_25F774764()
{
  return sub_25F7746E8(&qword_26A7BC6C8, &qword_26A7BC668, (void (*)(void))sub_25F774794);
}

uint64_t sub_25F774794()
{
  return sub_25F7746E8(&qword_26A7BC6D0, &qword_26A7BBFC8, (void (*)(void))sub_25F7747C4);
}

unint64_t sub_25F7747C4()
{
  unint64_t result = qword_26A7BC6D8;
  if (!qword_26A7BC6D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BBFC0);
    sub_25F774864();
    sub_25F73D9A4(&qword_26A7BBF78, &qword_26A7BBF80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC6D8);
  }
  return result;
}

unint64_t sub_25F774864()
{
  unint64_t result = qword_26A7BC6E0;
  if (!qword_26A7BC6E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC658);
    sub_25F73D9A4(&qword_26A7BC6E8, &qword_26A7BC660);
    sub_25F73D9A4(&qword_26A7BBF68, &qword_26A7BBF70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC6E0);
  }
  return result;
}

uint64_t sub_25F774930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC6A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F774998()
{
  return sub_25F773628(*(void *)(v0 + 16));
}

uint64_t sub_25F7749B4()
{
  uint64_t v1 = type metadata accessor for InstructionView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 48);
  uint64_t v8 = sub_25F78B9E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F774BE4(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for InstructionView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_25F74E910;
  return sub_25F7738B4(a1, v5, v6, v7);
}

uint64_t sub_25F774CE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F774D48@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25F78B460();
  *a1 = v3;
  return result;
}

uint64_t sub_25F774D74()
{
  return sub_25F78B470();
}

uint64_t sub_25F774DA0()
{
  return sub_25F775300(sub_25F772C6C);
}

uint64_t sub_25F774DBC()
{
  return sub_25F775300((uint64_t (*)(uint64_t))sub_25F773498);
}

uint64_t sub_25F774DD4()
{
  return sub_25F7746E8(&qword_26A7BC760, &qword_26A7BC740, (void (*)(void))sub_25F774E04);
}

unint64_t sub_25F774E04()
{
  unint64_t result = qword_26A7BC768;
  if (!qword_26A7BC768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC738);
    sub_25F7746E8(&qword_26A7BC770, &qword_26A7BC730, (void (*)(void))sub_25F774ED0);
    sub_25F73D9A4(&qword_26A7BC788, &qword_26A7BC790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC768);
  }
  return result;
}

unint64_t sub_25F774ED0()
{
  unint64_t result = qword_26A7BC778;
  if (!qword_26A7BC778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC728);
    sub_25F77538C(&qword_26A7BC780, (void (*)(uint64_t))type metadata accessor for SystemFontScaledSupport);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC778);
  }
  return result;
}

void sub_25F774F7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a3 != (void *)1)
  {
    swift_retain();
    swift_retain();
    id v7 = a3;
    swift_retain();
    id v8 = a5;
  }
}

uint64_t sub_25F774FF4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a3 != (void *)1)
  {
    swift_release();

    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F77505C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroyTm_4()
{
  uint64_t v1 = type metadata accessor for InstructionView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 48);
  uint64_t v8 = sub_25F78B9E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F7752E8()
{
  return sub_25F775300((uint64_t (*)(uint64_t))sub_25F773368);
}

uint64_t sub_25F775300(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for InstructionView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25F77538C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F7753D4()
{
  return sub_25F7733E4();
}

unint64_t sub_25F7753FC()
{
  unint64_t result = qword_26A7BC7B0;
  if (!qword_26A7BC7B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC6A0);
    sub_25F775478();
    sub_25F775634();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC7B0);
  }
  return result;
}

unint64_t sub_25F775478()
{
  unint64_t result = qword_26A7BC7B8;
  if (!qword_26A7BC7B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC698);
    sub_25F775518();
    sub_25F73D9A4(&qword_26A7BBCF0, &qword_26A7BBCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC7B8);
  }
  return result;
}

unint64_t sub_25F775518()
{
  unint64_t result = qword_26A7BC7C0;
  if (!qword_26A7BC7C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC690);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC680);
    sub_25F7746E8(&qword_26A7BC6B0, &qword_26A7BC680, (void (*)(void))sub_25F77461C);
    swift_getOpaqueTypeConformance2();
    sub_25F73D9A4(&qword_26A7BC7C8, &qword_26A7BC7D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC7C0);
  }
  return result;
}

unint64_t sub_25F775634()
{
  unint64_t result = qword_26A7BC7D8;
  if (!qword_26A7BC7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC7D8);
  }
  return result;
}

uint64_t sub_25F775688(uint64_t a1)
{
  return sub_25F7756D4(0.992156863, 0.854901961, 1.0, a1, &qword_26A7BE3B8);
}

uint64_t sub_25F7756A8(uint64_t a1)
{
  return sub_25F7756D4(0.231372549, 0.0274509804, 0.333333333, a1, &qword_26A7BE3C0);
}

uint64_t sub_25F7756D4(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = sub_25F78BBA0();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v12 + 104))(v11, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x2611FDFC0](v11, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t sub_25F7757C8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, _OWORD *a10, uint64_t a11, long long a12, uint64_t a13, uint64_t a14)
{
  *(void *)a9 = a1;
  *(unsigned char *)(a9 + 8) = a2 & 1;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  long long v15 = a10[1];
  *(_OWORD *)(a9 + 64) = *a10;
  *(_OWORD *)(a9 + 80) = v15;
  *(_OWORD *)(a9 + 96) = a10[2];
  sub_25F78BC70();
  *(unsigned char *)(a9 + 112) = v19;
  *(void *)(a9 + 120) = v20;
  sub_25F78BC70();
  *(unsigned char *)(a9 + 128) = v19;
  *(void *)(a9 + 136) = v20;
  sub_25F78BC70();
  *(unsigned char *)(a9 + 144) = v19;
  *(void *)(a9 + 152) = v20;
  sub_25F78BC70();
  *(unsigned char *)(a9 + 160) = v19;
  *(void *)(a9 + 168) = v20;
  sub_25F78BC70();
  *(void *)(a9 + 176) = v19;
  *(void *)(a9 + 184) = v20;
  sub_25F78BC70();
  *(unsigned char *)(a9 + 192) = v19;
  *(void *)(a9 + 200) = v20;
  *(_OWORD *)(a9 + 208) = a12;
  *(void *)(a9 + 224) = a13;
  uint64_t v16 = a9 + *(int *)(type metadata accessor for DraggableLocationItem() + 64);
  uint64_t v17 = sub_25F78BF90();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v16, a14, v17);
}

uint64_t type metadata accessor for DraggableLocationItem()
{
  uint64_t result = qword_26A7BC7E0;
  if (!qword_26A7BC7E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DraggableLocationItem.GestureState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DraggableLocationItem.GestureState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F775B54);
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

uint64_t sub_25F775B7C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25F775B84(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DraggableLocationItem.GestureState()
{
  return &type metadata for DraggableLocationItem.GestureState;
}

void *sub_25F775B9C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    char v5 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v8;
    uint64_t v9 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v9;
    long long v10 = *((_OWORD *)a2 + 6);
    *(_OWORD *)(a1 + 80) = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 96) = v10;
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    *(void *)(a1 + 120) = a2[15];
    *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
    *(void *)(a1 + 136) = a2[17];
    *(unsigned char *)(a1 + 144) = *((unsigned char *)a2 + 144);
    *(void *)(a1 + 152) = a2[19];
    *(unsigned char *)(a1 + 160) = *((unsigned char *)a2 + 160);
    uint64_t v11 = a2[22];
    *(void *)(a1 + 168) = a2[21];
    *(void *)(a1 + 176) = v11;
    *(void *)(a1 + 184) = a2[23];
    *(unsigned char *)(a1 + 192) = *((unsigned char *)a2 + 192);
    *(void *)(a1 + 200) = a2[25];
    *(_OWORD *)(a1 + 208) = *((_OWORD *)a2 + 13);
    uint64_t v12 = *(int *)(a3 + 64);
    uint64_t v17 = (uint64_t)a2 + v12;
    uint64_t v18 = a1 + v12;
    *(void *)(a1 + 224) = a2[28];
    uint64_t v13 = sub_25F78BF90();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v16(v18, v17, v13);
  }
  return v3;
}

uint64_t sub_25F775DC4(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 64);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_25F775EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  long long v9 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v9;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  uint64_t v10 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v10;
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  uint64_t v11 = *(int *)(a3 + 64);
  uint64_t v15 = a2 + v11;
  uint64_t v16 = a1 + v11;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  uint64_t v12 = sub_25F78BF90();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v14(v16, v15, v12);
  return a1;
}

uint64_t sub_25F77608C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_retain();
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_retain();
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 64);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_25F7762F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  long long v6 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v6;
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  uint64_t v8 = *(int *)(a3 + 64);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  uint64_t v11 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_25F7763CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  long long v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_release();
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_release();
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 64);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_25F776590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F7765A4);
}

uint64_t sub_25F7765A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25F78BF90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 64);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25F776654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F776668);
}

uint64_t sub_25F776668(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25F78BF90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 64);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25F776710()
{
  uint64_t result = sub_25F78BF90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25F7767EC()
{
  unint64_t result = qword_26A7BC7F0;
  if (!qword_26A7BC7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC7F0);
  }
  return result;
}

void *sub_25F776840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v193 = a1;
  uint64_t v176 = sub_25F78B700();
  MEMORY[0x270FA5388](v176);
  uint64_t v174 = (char *)&v158 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = sub_25F78B170();
  uint64_t v185 = *(void *)(v186 - 8);
  MEMORY[0x270FA5388](v186);
  v184 = (char *)&v158 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC7F8);
  uint64_t v191 = *(void *)(v192 - 8);
  MEMORY[0x270FA5388](v192);
  long long v188 = (char *)&v158 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC800);
  uint64_t v189 = *(void *)(v190 - 8);
  MEMORY[0x270FA5388](v190);
  char v187 = (char *)&v158 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v211 = sub_25F78B360();
  uint64_t v218 = *(void *)(v211 - 8);
  MEMORY[0x270FA5388](v211);
  v210 = (char *)&v158 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v219 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD60);
  uint64_t v213 = *(void *)(v219 - 8);
  MEMORY[0x270FA5388](v219);
  v212 = (char *)&v158 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_25F78B140();
  uint64_t v161 = *(void *)(v162 - 8);
  MEMORY[0x270FA5388](v162);
  uint64_t v159 = (char *)&v158 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC808);
  uint64_t v168 = *(void *)(v169 - 8);
  MEMORY[0x270FA5388](v169);
  uint64_t v167 = (char *)&v158 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC810);
  MEMORY[0x270FA5388](v166);
  uint64_t v209 = (uint64_t)&v158 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC818);
  MEMORY[0x270FA5388](v175);
  uint64_t v173 = (uint64_t)&v158 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DraggableLocationItem();
  uint64_t v14 = v13 - 8;
  uint64_t v221 = *(void *)(v13 - 8);
  uint64_t v217 = *(void *)(v221 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v220 = (uint64_t)&v158 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = sub_25F78B390() - 8;
  MEMORY[0x270FA5388](v215);
  uint64_t v17 = (_OWORD *)((char *)&v158 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v196 = sub_25F78B7C0();
  uint64_t v195 = *(void *)(v196 - 8);
  MEMORY[0x270FA5388](v196);
  uint64_t v19 = (char *)&v158 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for LocationItemView();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v158 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC820);
  uint64_t v198 = *(void *)(v200 - 8);
  MEMORY[0x270FA5388](v200);
  v194 = (char *)&v158 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC828);
  uint64_t v25 = v24 - 8;
  MEMORY[0x270FA5388](v24);
  double v27 = (char *)&v158 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC830) - 8;
  MEMORY[0x270FA5388](v197);
  uint64_t v29 = (char *)&v158 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC838) - 8;
  MEMORY[0x270FA5388](v201);
  char v31 = (char *)&v158 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC840) - 8;
  MEMORY[0x270FA5388](v203);
  uint64_t v202 = (uint64_t)&v158 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC848) - 8;
  MEMORY[0x270FA5388](v205);
  uint64_t v204 = (uint64_t)&v158 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v216 = (uint64_t (*)())(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC850) - 8);
  MEMORY[0x270FA5388](v216);
  v199 = (char *)&v158 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC858);
  MEMORY[0x270FA5388](v206);
  uint64_t v207 = (uint64_t)&v158 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC860);
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  uint64_t v160 = (char *)&v158 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC868);
  MEMORY[0x270FA5388](v158);
  uint64_t v165 = (char *)&v158 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC870);
  MEMORY[0x270FA5388](v208);
  uint64_t v170 = (uint64_t)&v158 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC878);
  uint64_t v172 = *(void *)(v179 - 8);
  MEMORY[0x270FA5388](v179);
  uint64_t v171 = (char *)&v158 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC880);
  uint64_t v182 = *(void *)(v183 - 8);
  MEMORY[0x270FA5388](v183);
  uint64_t v180 = (char *)&v158 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC888);
  uint64_t v178 = *(void *)(v181 - 8);
  MEMORY[0x270FA5388](v181);
  uint64_t v177 = (char *)&v158 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = v2 + *(int *)(v14 + 72);
  uint64_t v43 = sub_25F78BF90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v22, v42, v43);
  uint64_t v44 = *(void *)(v2 + 224);
  uint64_t v45 = &v22[*(int *)(v20 + 20)];
  *(void *)uint64_t v45 = *(void *)(v2 + 216);
  *((void *)v45 + 1) = v44;
  swift_bridgeObjectRetain();
  sub_25F78B7B0();
  sub_25F77BFD0(&qword_26A7BC890, (void (*)(uint64_t))type metadata accessor for LocationItemView);
  uint64_t v46 = v194;
  sub_25F78BB40();
  (*(void (**)(char *, uint64_t))(v195 + 8))(v19, v196);
  sub_25F77B90C((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for LocationItemView);
  char v47 = (char *)v17 + *(int *)(v215 + 28);
  uint64_t v48 = *MEMORY[0x263F19860];
  uint64_t v49 = sub_25F78B5A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v47, v48, v49);
  __asm { FMOV            V0.2D, #16.0 }
  *uint64_t v17 = _Q0;
  uint64_t v55 = (uint64_t)&v27[*(int *)(v25 + 44)];
  sub_25F77AF64((uint64_t)v17, v55, MEMORY[0x263F19048]);
  *(_WORD *)(v55 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB30) + 36)) = 256;
  uint64_t v56 = v198;
  uint64_t v57 = v200;
  (*(void (**)(char *, char *, uint64_t))(v198 + 16))(v27, v46, v200);
  sub_25F77B90C((uint64_t)v17, MEMORY[0x263F19048]);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v46, v57);
  uint64_t v58 = sub_25F78BBC0();
  LOBYTE(v48) = sub_25F78B8C0();
  sub_25F73D580((uint64_t)v27, (uint64_t)v29, &qword_26A7BC828);
  uint64_t v59 = &v29[*(int *)(v197 + 44)];
  *(void *)uint64_t v59 = v58;
  v59[8] = v48;
  sub_25F73D748((uint64_t)v27, &qword_26A7BC828);
  uint64_t v60 = v220;
  sub_25F77AF64(v2, v220, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  uint64_t v61 = *(unsigned __int8 *)(v221 + 80);
  uint64_t v62 = (v61 + 16) & ~v61;
  uint64_t v63 = v62 + v217;
  uint64_t v64 = v61 | 7;
  uint64_t v65 = swift_allocObject();
  sub_25F77AFD0(v60, v65 + v62);
  sub_25F73D580((uint64_t)v29, (uint64_t)v31, &qword_26A7BC830);
  uint64_t v66 = (void (**)(CGFloat *@<X8>))&v31[*(int *)(v201 + 44)];
  *uint64_t v66 = sub_25F778520;
  v66[1] = 0;
  v66[2] = (void (*)(CGFloat *@<X8>))sub_25F77B034;
  v66[3] = (void (*)(CGFloat *@<X8>))v65;
  sub_25F73D748((uint64_t)v29, &qword_26A7BC830);
  sub_25F77AF64(v2, v60, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  uint64_t v217 = v63;
  uint64_t v221 = v64;
  uint64_t v67 = swift_allocObject();
  uint64_t v68 = v60;
  sub_25F77AFD0(v60, v67 + v62);
  uint64_t v69 = sub_25F78BDE0();
  uint64_t v71 = v70;
  uint64_t v72 = v202;
  sub_25F73D580((uint64_t)v31, v202, &qword_26A7BC838);
  uint64_t v73 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v72 + *(int *)(v203 + 44));
  *uint64_t v73 = sub_25F77B0A8;
  v73[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v67;
  v73[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v69;
  v73[3] = v71;
  uint64_t v74 = (uint64_t)v199;
  sub_25F73D748((uint64_t)v31, &qword_26A7BC838);
  uint64_t v75 = *(void *)(v2 + 200);
  LOBYTE(v222) = *(unsigned char *)(v2 + 192);
  *(void *)&long long v223 = v75;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
  sub_25F78BC80();
  if (v225 == 1) {
    double v77 = 1.03;
  }
  else {
    double v77 = 1.0;
  }
  sub_25F78BEB0();
  uint64_t v79 = v78;
  uint64_t v81 = v80;
  uint64_t v82 = v204;
  sub_25F73D580(v72, v204, &qword_26A7BC840);
  uint64_t v83 = v82 + *(int *)(v205 + 44);
  *(double *)uint64_t v83 = v77;
  *(double *)(v83 + 8) = v77;
  *(void *)(v83 + 16) = v79;
  *(void *)(v83 + 24) = v81;
  sub_25F73D748(v72, &qword_26A7BC840);
  uint64_t v84 = sub_25F78BE70();
  uint64_t v85 = *(void *)(v2 + 200);
  LOBYTE(v222) = *(unsigned char *)(v2 + 192);
  *(void *)&long long v223 = v85;
  sub_25F78BC80();
  BOOL v86 = v225 == 1;
  sub_25F73D580(v82, v74, &qword_26A7BC848);
  uint64_t v87 = v74 + *((int *)v216 + 11);
  *(void *)uint64_t v87 = v84;
  *(unsigned char *)(v87 + 8) = v86;
  sub_25F73D748(v82, &qword_26A7BC848);
  unint64_t v88 = *(void *)(v2 + 208);
  uint64_t v222 = *(void *)(v2 + 40);
  long long v223 = *(_OWORD *)(v2 + 48);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
  unint64_t result = MEMORY[0x2611FE0A0](&v225, v89);
  if ((v88 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t result = v225;
  if (v88 >= v225[2])
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v91 = v225[v88 + 4];
  swift_bridgeObjectRelease();
  uint64_t v92 = v207;
  sub_25F73D580(v74, v207, &qword_26A7BC850);
  uint64_t v93 = (void *)(v92 + *(int *)(v206 + 36));
  *uint64_t v93 = 0;
  v93[1] = v91;
  sub_25F73D748(v74, &qword_26A7BC850);
  int v94 = v159;
  sub_25F78B130();
  uint64_t v214 = v2;
  uint64_t v95 = v68;
  v216 = type metadata accessor for DraggableLocationItem;
  sub_25F77AF64(v2, v68, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  uint64_t v205 = v76;
  uint64_t v96 = swift_allocObject();
  sub_25F77AFD0(v68, v96 + v62);
  uint64_t v97 = swift_allocObject();
  *(void *)(v97 + 16) = sub_25F77B12C;
  *(void *)(v97 + 24) = v96;
  long long v98 = v167;
  uint64_t v99 = v162;
  sub_25F78BD30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v161 + 8))(v94, v99);
  uint64_t v100 = v210;
  sub_25F78B350();
  sub_25F77AF64(v2, v95, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  uint64_t v101 = swift_allocObject();
  sub_25F77AFD0(v95, v101 + v62);
  uint64_t v204 = sub_25F77BFD0(&qword_26A7BBDB8, MEMORY[0x263F18F90]);
  uint64_t v102 = v211;
  uint64_t v103 = v212;
  sub_25F78BD30();
  swift_release();
  char v104 = *(void (**)(char *, uint64_t))(v218 + 8);
  v218 += 8;
  uint64_t v203 = (uint64_t)v104;
  v104(v100, v102);
  uint64_t v105 = v168;
  uint64_t v106 = v62;
  uint64_t v107 = v209;
  uint64_t v108 = v169;
  (*(void (**)(uint64_t, char *, uint64_t))(v168 + 16))(v209, v98, v169);
  (*(void (**)(uint64_t, char *, uint64_t))(v213 + 32))(v107 + *(int *)(v166 + 52), v103, v219);
  (*(void (**)(char *, uint64_t))(v105 + 8))(v98, v108);
  sub_25F78B740();
  uint64_t v109 = v184;
  sub_25F78B150();
  uint64_t v110 = v214;
  uint64_t v111 = v216;
  sub_25F77AF64(v214, v95, (uint64_t (*)(void))v216);
  uint64_t v112 = swift_allocObject();
  uint64_t v113 = v106;
  uint64_t v215 = v106;
  sub_25F77AFD0(v95, v112 + v106);
  sub_25F77BFD0(&qword_26A7BC220, MEMORY[0x263F185B8]);
  sub_25F77BFD0(&qword_26A7BC8A8, MEMORY[0x263F18588]);
  char v114 = v188;
  uint64_t v115 = v186;
  sub_25F78BD40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v185 + 8))(v109, v115);
  sub_25F77AF64(v110, v95, (uint64_t (*)(void))v111);
  uint64_t v116 = swift_allocObject();
  sub_25F77AFD0(v95, v116 + v113);
  sub_25F73D9A4(&qword_26A7BC8B0, &qword_26A7BC7F8);
  uint64_t v117 = v187;
  uint64_t v118 = v192;
  sub_25F78BD30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v191 + 8))(v114, v118);
  uint64_t v119 = v209;
  uint64_t v120 = v173;
  sub_25F73D580(v209, v173, &qword_26A7BC810);
  (*(void (**)(uint64_t, char *, uint64_t))(v189 + 32))(v120 + *(int *)(v175 + 52), v117, v190);
  sub_25F73D748(v119, &qword_26A7BC810);
  sub_25F78B1A0();
  sub_25F77B348(&qword_26A7BC8B8, &qword_26A7BC858, (void (*)(void))sub_25F77B27C);
  sub_25F73D9A4(&qword_26A7BC910, &qword_26A7BC818);
  uint64_t v121 = v160;
  uint64_t v122 = v207;
  sub_25F78BB70();
  sub_25F73D748(v120, &qword_26A7BC818);
  sub_25F73D748(v122, &qword_26A7BC858);
  uint64_t v123 = v214;
  uint64_t v124 = *(void *)(v214 + 200);
  LOBYTE(v222) = *(unsigned char *)(v214 + 192);
  *(void *)&long long v223 = v124;
  sub_25F78BC80();
  double v125 = 1.0;
  if ((_BYTE)v225) {
    double v126 = 1.0;
  }
  else {
    double v126 = 0.0;
  }
  uint64_t v127 = v163;
  uint64_t v128 = (uint64_t)v165;
  uint64_t v129 = v164;
  (*(void (**)(char *, char *, uint64_t))(v163 + 16))(v165, v121, v164);
  *(double *)(v128 + *(int *)(v158 + 36)) = v126;
  (*(void (**)(char *, uint64_t))(v127 + 8))(v121, v129);
  uint64_t v130 = *(void *)(v123 + 120);
  LOBYTE(v222) = *(unsigned char *)(v123 + 112);
  *(void *)&long long v223 = v130;
  uint64_t v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  if ((_BYTE)v225) {
    double v125 = 0.85;
  }
  uint64_t v131 = v170;
  sub_25F73D580(v128, v170, &qword_26A7BC868);
  *(double *)(v131 + *(int *)(v208 + 36)) = v125;
  sub_25F73D748(v128, &qword_26A7BC868);
  uint64_t v132 = v210;
  sub_25F78B350();
  uint64_t v133 = v220;
  uint64_t v134 = v216;
  sub_25F77AF64(v123, v220, (uint64_t (*)(void))v216);
  uint64_t v135 = swift_allocObject();
  sub_25F77AFD0(v133, v135 + v215);
  uint64_t v136 = v211;
  uint64_t v137 = v212;
  sub_25F78BD30();
  swift_release();
  ((void (*)(char *, uint64_t))v203)(v132, v136);
  sub_25F78B1A0();
  uint64_t v138 = sub_25F77B348(&qword_26A7BC918, &qword_26A7BC870, (void (*)(void))sub_25F77B744);
  uint64_t v139 = sub_25F73D9A4(&qword_26A7BBDC0, &qword_26A7BBD60);
  uint64_t v140 = v171;
  uint64_t v141 = v208;
  uint64_t v142 = v219;
  sub_25F78BB30();
  (*(void (**)(char *, uint64_t))(v213 + 8))(v137, v142);
  sub_25F73D748(v131, &qword_26A7BC870);
  uint64_t v143 = v214;
  uint64_t v144 = *(void *)(v214 + 152);
  LOBYTE(v222) = *(unsigned char *)(v214 + 144);
  *(void *)&long long v223 = v144;
  sub_25F78BC80();
  uint64_t v145 = v220;
  sub_25F77AF64(v143, v220, (uint64_t (*)(void))v134);
  uint64_t v146 = swift_allocObject();
  uint64_t v147 = v145;
  sub_25F77AFD0(v145, v146 + v215);
  uint64_t v222 = v141;
  *(void *)&long long v223 = v219;
  *((void *)&v223 + 1) = v138;
  uint64_t v224 = v139;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v149 = MEMORY[0x263F8D4F8];
  long long v150 = v180;
  uint64_t v151 = v179;
  sub_25F78BB90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v172 + 8))(v140, v151);
  char v152 = *(unsigned char *)(v143 + 8);
  uint64_t v153 = swift_retain();
  uint64_t v154 = sub_25F76A324(v153, v152);
  swift_release();
  swift_getKeyPath();
  uint64_t v222 = v154;
  sub_25F77BFD0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  LOBYTE(v132) = *(unsigned char *)(v154 + 51);
  swift_release();
  LOBYTE(v225) = (_BYTE)v132;
  sub_25F77AF64(v143, v147, (uint64_t (*)(void))v216);
  uint64_t v155 = swift_allocObject();
  sub_25F77AFD0(v147, v155 + v215);
  uint64_t v222 = v151;
  *(void *)&long long v223 = v149;
  *((void *)&v223 + 1) = OpaqueTypeConformance2;
  uint64_t v224 = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  uint64_t v156 = v177;
  uint64_t v157 = v183;
  sub_25F78BB90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v182 + 8))(v150, v157);
  return (void *)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v178 + 32))(v193, v156, v181);
}

void sub_25F778520(CGFloat *a1@<X8>)
{
  uint64_t v2 = sub_25F78B710();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78B750();
  sub_25F78B250();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15.origin.x = v7;
  v15.origin.y = v9;
  v15.size.width = v11;
  v15.size.height = v13;
  *a1 = CGRectGetMidY(v15);
}

uint64_t sub_25F77863C()
{
  return sub_25F78BC90();
}

uint64_t sub_25F778690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v30 = a3;
  uint64_t v31 = a1;
  uint64_t v4 = sub_25F78B260();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  CGFloat v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DraggableLocationItem();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  CGFloat v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25F78BBC0();
  uint64_t v29 = type metadata accessor for DraggableLocationItem;
  sub_25F77AF64(a2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v28(v7, v31, v4);
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (v12 + 16) & ~v12;
  uint64_t v14 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (v10 + v14 + v13) & ~v14;
  uint64_t v26 = v12 | v14 | 7;
  uint64_t v27 = v15 + v6;
  uint64_t v16 = swift_allocObject();
  sub_25F77AFD0((uint64_t)v11, v16 + v13);
  uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v17(v16 + v15, v7, v4);
  uint64_t v36 = v25;
  uint64_t v37 = sub_25F77BBB8;
  uint64_t v38 = v16;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v18 = *(void *)(a2 + 72);
  *(void *)&long long v32 = *(void *)(a2 + 64);
  *((void *)&v32 + 1) = v18;
  long long v19 = *(_OWORD *)(a2 + 96);
  long long v33 = *(_OWORD *)(a2 + 80);
  long long v34 = v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC928);
  MEMORY[0x2611FE0A0](v35, v20);
  long long v32 = v35[0];
  long long v33 = v35[1];
  sub_25F77AF64(a2, (uint64_t)v11, (uint64_t (*)(void))v29);
  uint64_t v21 = v4;
  v28(v7, v31, v4);
  uint64_t v22 = swift_allocObject();
  sub_25F77AFD0((uint64_t)v11, v22 + v13);
  v17(v22 + v15, v7, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC930);
  type metadata accessor for CGRect(0);
  sub_25F77BF5C();
  sub_25F77BFD0(&qword_26A7BC940, type metadata accessor for CGRect);
  sub_25F78BB80();
  swift_release();
  swift_release();
  sub_25F74376C((uint64_t)v37);
  return sub_25F74376C(v39);
}

uint64_t sub_25F7789EC(void *a1)
{
  uint64_t v2 = sub_25F78B710();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = a1[26];
  sub_25F78B750();
  sub_25F78B250();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  CGFloat MidY = CGRectGetMidY(v26);
  uint64_t v16 = a1[2];
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  uint64_t v22 = v16;
  uint64_t v23 = v17;
  uint64_t v24 = v18;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
  MEMORY[0x2611FE0A0](&v25);
  long long v19 = v25;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if ((v6 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = (uint64_t)sub_25F77B98C(v19);
  long long v19 = (void *)result;
  if ((v6 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (v6 < v19[2])
  {
    *(CGFloat *)&v19[v6 + 4] = MidY;
    uint64_t v22 = v16;
    uint64_t v23 = v17;
    uint64_t v24 = v18;
    v21[1] = v19;
    sub_25F78BCF0();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25F778BC8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_25F78B710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = a3[26];
  sub_25F78B750();
  sub_25F78B250();
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  CGFloat MidY = CGRectGetMidY(v28);
  uint64_t v18 = a3[2];
  uint64_t v19 = a3[3];
  uint64_t v20 = a3[4];
  uint64_t v24 = v18;
  uint64_t v25 = v19;
  uint64_t v26 = v20;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
  MEMORY[0x2611FE0A0](&v27);
  uint64_t v21 = v27;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = (uint64_t)sub_25F77B98C(v21);
  uint64_t v21 = (void *)result;
  if ((v8 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (v8 < v21[2])
  {
    *(CGFloat *)&v21[v8 + 4] = MidY;
    uint64_t v24 = v18;
    uint64_t v25 = v19;
    uint64_t v26 = v20;
    v23[1] = v21;
    sub_25F78BCF0();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25F778DA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *(unsigned char *)(a1 + 8);
  uint64_t v10 = swift_retain();
  sub_25F76A324(v10, v9);
  swift_release();
  sub_25F78BF80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  sub_25F763E6C((uint64_t)v8, 1, (uint64_t)v4);
  swift_release();
  sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = *(void *)(a1 + 120);
  char v15 = *(unsigned char *)(a1 + 112);
  uint64_t v16 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  uint64_t result = sub_25F78BC80();
  if ((v17 & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 200);
    char v15 = *(unsigned char *)(a1 + 192);
    uint64_t v16 = v13;
    char v17 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
    return sub_25F78BC90();
  }
  return result;
}

uint64_t sub_25F778FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v27 = sub_25F78BEC0();
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25F78BF00();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DraggableLocationItem();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = sub_25F78BF20();
  uint64_t v26 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v23 - v15;
  sub_25F76908C();
  uint64_t v23 = sub_25F78C210();
  sub_25F78BF10();
  MEMORY[0x2611FE2F0](v14, 0.05);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v14, v10);
  sub_25F77AF64(v24, (uint64_t)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  sub_25F77AFD0((uint64_t)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  aBlock[4] = sub_25F77BB10;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F770630;
  aBlock[3] = &block_descriptor_3;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release();
  sub_25F78BEE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25F77BFD0((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F73D9A4(&qword_26A7BB9D0, &qword_26A7BB798);
  uint64_t v20 = v27;
  sub_25F78C2E0();
  uint64_t v21 = (void *)v23;
  MEMORY[0x2611FE5B0](v16, v6, v3, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v20);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v29);
  return ((uint64_t (*)(char *, uint64_t))v25)(v16, v26);
}

uint64_t sub_25F779408(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 120);
  char v15 = *(unsigned char *)(a1 + 112);
  uint64_t v16 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  uint64_t result = sub_25F78BC80();
  if ((v17 & 1) == 0)
  {
    char v11 = *(unsigned char *)(a1 + 8);
    uint64_t v12 = swift_retain();
    sub_25F76A324(v12, v11);
    swift_release();
    sub_25F78BF80();
    sub_25F78BF80();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    sub_25F763E6C((uint64_t)v8, 1, (uint64_t)v4);
    swift_release();
    sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = *(void *)(a1 + 200);
    char v15 = *(unsigned char *)(a1 + 192);
    uint64_t v16 = v13;
    char v17 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
    return sub_25F78BC90();
  }
  return result;
}

uint64_t sub_25F779638(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
  sub_25F78BC80();
  LOBYTE(v5) = 0;
  sub_25F78BC90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC60);
  sub_25F78BC80();
  sub_25F7797BC(*(void *)(a2 + 208), v5);
  sub_25F78BE50();
  sub_25F78BE20();
  uint64_t v3 = swift_release();
  MEMORY[0x270FA5388](v3);
  sub_25F78B2C0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F7797BC(unint64_t a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DraggableLocationItem();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v47 = (uint64_t)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  char v11 = (char *)&v46 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v46 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v46 - v15;
  uint64_t v48 = *(void *)(v2 + 16);
  long long v49 = *(_OWORD *)(v2 + 24);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
  MEMORY[0x2611FE0A0](&v50);
  int64_t v18 = *(void *)(v50 + 16);
  swift_bridgeObjectRelease();
  sub_25F77AF64(v3, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  if (v18 <= (uint64_t)a1) {
    goto LABEL_61;
  }
  uint64_t v48 = *((void *)v16 + 2);
  long long v49 = *(_OWORD *)(v16 + 24);
  MEMORY[0x2611FE0A0](&v50, v17);
  uint64_t v19 = *(void *)(v50 + 16);
  swift_bridgeObjectRelease();
  sub_25F77B90C((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
  if (v19 == 3)
  {
    uint64_t v16 = (char *)sub_25F78C100();
    *((void *)v16 + 2) = 3;
    *((void *)v16 + 4) = 0;
    uint64_t v46 = (double *)(v16 + 32);
    *((void *)v16 + 5) = 0;
    *((void *)v16 + 6) = 0;
    uint64_t v21 = *(void *)(v3 + 16);
    uint64_t v20 = *(void *)(v3 + 24);
    uint64_t v22 = *(void *)(v3 + 32);
    uint64_t v48 = v21;
    *(void *)&long long v49 = v20;
    *((void *)&v49 + 1) = v22;
    MEMORY[0x2611FE0A0](&v50, v17);
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(v50 + 16) > a1)
    {
      double v23 = *(double *)(v50 + 8 * a1 + 32);
      swift_bridgeObjectRelease();
      uint64_t v48 = v21;
      *(void *)&long long v49 = v20;
      *((void *)&v49 + 1) = v22;
      MEMORY[0x2611FE0A0](&v50, v17);
      if (*(void *)(v50 + 16) > a1)
      {
        double v24 = *(double *)(v50 + 8 * a1 + 32);
        swift_bridgeObjectRelease();
        uint64_t v48 = v21;
        *(void *)&long long v49 = v20;
        *((void *)&v49 + 1) = v22;
        MEMORY[0x2611FE0A0](&v50, v17);
        if (*(void *)(v50 + 16) >= 2uLL)
        {
          double v25 = *(double *)(v50 + 40);
          swift_bridgeObjectRelease();
          uint64_t v48 = v21;
          *(void *)&long long v49 = v20;
          *((void *)&v49 + 1) = v22;
          MEMORY[0x2611FE0A0](&v50, v17);
          if (*(void *)(v50 + 16))
          {
            double v26 = *(double *)(v50 + 32);
            swift_bridgeObjectRelease();
            sub_25F77AF64(v3, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
            if (a1)
            {
              sub_25F77B90C((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              sub_25F77AF64(v3, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              uint64_t v27 = v47;
              sub_25F77AF64((uint64_t)v11, v47, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              if (a1 == 2)
              {
                uint64_t v48 = *(void *)(v27 + 16);
                long long v49 = *(_OWORD *)(v27 + 24);
                MEMORY[0x2611FE0A0](&v50, v17);
                if (*(void *)(v50 + 16) >= 3uLL)
                {
                  double v28 = *(double *)(v50 + 48);
                  swift_bridgeObjectRelease();
                  sub_25F77B90C(v27, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
                  sub_25F77B90C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
                  if (v28 < a2) {
                    return (uint64_t)v16;
                  }
                  char v29 = 0;
                  goto LABEL_18;
                }
LABEL_51:
                __break(1u);
                goto LABEL_52;
              }
LABEL_17:
              sub_25F77B90C(v27, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              sub_25F77B90C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              char v29 = 1;
LABEL_18:
              double v31 = a2 + 55.0 - v23;
              double v32 = a2 + -55.0 - v24;
              double v33 = v25 - v26;
              double v34 = fabs(v32);
              double v35 = fabs(v31);
              if (v33 > v34 && v33 > v35) {
                return (uint64_t)v16;
              }
              uint64_t v36 = *(void *)(v3 + 136);
              LOBYTE(v48) = *(unsigned char *)(v3 + 128);
              *(void *)&long long v49 = v36;
              LOBYTE(v50) = 1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
              sub_25F78BC90();
              uint64_t v37 = *(void *)(v3 + 152);
              LOBYTE(v48) = *(unsigned char *)(v3 + 144);
              *(void *)&long long v49 = v37;
              LOBYTE(v50) = 1;
              sub_25F78BC90();
              if (v32 >= 0.0)
              {
LABEL_28:
                if (v31 > 0.0)
                {
                  unint64_t v42 = *((void *)v16 + 2);
                  if (v35 / v33 >= 2.0 && a1 == 0)
                  {
                    if (v42)
                    {
                      *uint64_t v46 = v33 + v33;
                      if (v42 != 1)
                      {
                        *((double *)v16 + 5) = -v33;
                        if (v42 >= 3)
                        {
                          *((double *)v16 + 6) = -v33;
                          return (uint64_t)v16;
                        }
                        goto LABEL_60;
                      }
LABEL_59:
                      __break(1u);
LABEL_60:
                      __break(1u);
LABEL_61:
                      sub_25F77B90C((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
                      goto LABEL_62;
                    }
                    goto LABEL_57;
                  }
                  uint64_t v44 = v46;
                  if (v42 > a1)
                  {
                    v46[a1] = v33;
                    if (a1 + 1 < v42)
                    {
                      v44[a1 + 1] = -v33;
                      return (uint64_t)v16;
                    }
                    goto LABEL_58;
                  }
LABEL_56:
                  __break(1u);
LABEL_57:
                  __break(1u);
LABEL_58:
                  __break(1u);
                  goto LABEL_59;
                }
                return (uint64_t)v16;
              }
              if (v34 / v33 < 2.0) {
                char v38 = 1;
              }
              else {
                char v38 = v29;
              }
              unint64_t v39 = *((void *)v16 + 2);
              if ((v38 & 1) == 0)
              {
                uint64_t v40 = v46;
                if (v39 > a1)
                {
                  v46[a1] = v33 * -2.0;
                  if (a1 - 1 < v39)
                  {
                    v40[a1 - 1] = v33;
                    unint64_t v41 = a1 - 2;
                    if (a1 - 2 < v39) {
                      goto LABEL_39;
                    }
LABEL_55:
                    __break(1u);
                    goto LABEL_56;
                  }
LABEL_54:
                  __break(1u);
                  goto LABEL_55;
                }
LABEL_53:
                __break(1u);
                goto LABEL_54;
              }
              uint64_t v40 = v46;
              if (v39 > a1)
              {
                v46[a1] = -v33;
                unint64_t v41 = a1 - 1;
                if (a1 - 1 >= v39)
                {
                  __break(1u);
                  goto LABEL_28;
                }
LABEL_39:
                v40[v41] = v33;
                return (uint64_t)v16;
              }
LABEL_52:
              __break(1u);
              goto LABEL_53;
            }
            uint64_t v48 = *((void *)v14 + 2);
            long long v49 = *(_OWORD *)(v14 + 24);
            MEMORY[0x2611FE0A0](&v50, v17);
            if (*(void *)(v50 + 16))
            {
              double v30 = *(double *)(v50 + 32);
              swift_bridgeObjectRelease();
              sub_25F77B90C((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              sub_25F77AF64(v3, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              if (v30 > a2)
              {
                sub_25F77B90C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
                return (uint64_t)v16;
              }
              uint64_t v27 = v47;
              sub_25F77AF64((uint64_t)v11, v47, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
              goto LABEL_17;
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
    __break(1u);
    goto LABEL_47;
  }
LABEL_62:
  uint64_t result = sub_25F78C380();
  __break(1u);
  return result;
}

uint64_t sub_25F779E84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a1 + 200);
  LOBYTE(v16) = *(unsigned char *)(a1 + 192);
  *(void *)&long long v17 = v5;
  LOBYTE(v18) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
  sub_25F78BC90();
  uint64_t v6 = *(void *)(a2 + 16);
  unint64_t v7 = *(void *)(v4 + 208);
  if (v6)
  {
    unint64_t v8 = 0;
    uint64_t v15 = a2 + 32;
    do
    {
      if (v7 != v8)
      {
        double v2 = *(double *)(v15 + 8 * v8);
        a2 = *(void *)(v4 + 40);
        uint64_t v9 = *(void *)(v4 + 48);
        uint64_t v10 = *(void *)(v4 + 56);
        uint64_t v16 = a2;
        *(void *)&long long v17 = v9;
        *((void *)&v17 + 1) = v10;
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
        MEMORY[0x2611FE0A0](&v18);
        char v11 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v11 = sub_25F77B98C(v11);
        }
        if (v8 >= v11[2])
        {
          __break(1u);
          goto LABEL_15;
        }
        *(double *)&v11[v8 + 4] = v2;
        uint64_t v16 = a2;
        *(void *)&long long v17 = v9;
        *((void *)&v17 + 1) = v10;
        sub_25F78BCF0();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
      }
      ++v8;
    }
    while (v6 != v8);
  }
  uint64_t v16 = *(void *)(v4 + 16);
  long long v17 = *(_OWORD *)(v4 + 24);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
  char v11 = &v16;
  MEMORY[0x2611FE0A0](&v18);
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
  }
  else if (v7 < v18[2])
  {
    double v13 = *(double *)&v18[v7 + 4];
    swift_bridgeObjectRelease();
    double v2 = sub_25F77A118(v13, 110.0);
    uint64_t v6 = *(void *)(v4 + 40);
    a2 = *(void *)(v4 + 48);
    uint64_t v4 = *(void *)(v4 + 56);
    uint64_t v16 = v6;
    *(void *)&long long v17 = a2;
    *((void *)&v17 + 1) = v4;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x2611FE0A0](&v18, v12);
    char v11 = v18;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  __break(1u);
LABEL_17:
  uint64_t result = (uint64_t)sub_25F77B98C(v11);
  char v11 = (uint64_t *)result;
LABEL_13:
  if (v7 >= v11[2])
  {
    __break(1u);
  }
  else
  {
    *(double *)&v11[v7 + 4] = v2;
    uint64_t v16 = v6;
    *(void *)&long long v17 = a2;
    *((void *)&v17 + 1) = v4;
    sub_25F78BCF0();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

double sub_25F77A118(double a1, double a2)
{
  sub_25F78B160();
  double v5 = v4 + a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC928);
  MEMORY[0x2611FE0A0](&v14);
  double v7 = a2 * 0.5;
  double v8 = v7 + CGRectGetMinY(v14) + 2.0;
  MEMORY[0x2611FE0A0](&v14, v6);
  double v9 = CGRectGetMaxY(v14) - v7 + -2.0;
  BOOL v10 = v5 < v8;
  if (v5 > v8) {
    double v11 = v5;
  }
  else {
    double v11 = v8;
  }
  if (v9 < v5) {
    BOOL v10 = 1;
  }
  LOBYTE(v14.origin.x) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC90();
  if (v9 >= v11) {
    double v12 = v11;
  }
  else {
    double v12 = v9;
  }
  return v12 - a1;
}

uint64_t sub_25F77A25C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25F78B7F0();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v57 = &v51[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for DraggableLocationItem();
  uint64_t v54 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v55 = v6;
  uint64_t v56 = &v51[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v7 - 8);
  double v9 = &v51[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_25F78BF90();
  uint64_t v53 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  double v13 = &v51[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v51[-v14];
  uint64_t v16 = *(void *)(a2 + 120);
  LOBYTE(v61) = *(unsigned char *)(a2 + 112);
  uint64_t v62 = v16;
  LOBYTE(v60) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC90();
  char v17 = *(unsigned char *)(a2 + 192);
  uint64_t v18 = *(void *)(a2 + 200);
  LOBYTE(v61) = v17;
  uint64_t v62 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
  uint64_t result = sub_25F78BC80();
  if (LOBYTE(v60) == 1)
  {
    LOBYTE(v61) = v17;
    uint64_t v62 = v18;
    LOBYTE(v60) = 2;
    sub_25F78BC90();
    char v20 = *(unsigned char *)(a2 + 128);
    uint64_t v21 = *(void *)(a2 + 136);
    LOBYTE(v61) = v20;
    uint64_t v62 = v21;
    sub_25F78BC80();
    if (LOBYTE(v60) == 1)
    {
      uint64_t v22 = *(void *)(a2 + 184);
      uint64_t v61 = *(void *)(a2 + 176);
      uint64_t v62 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC60);
      sub_25F78BC80();
      uint64_t v23 = sub_25F7797BC(*(void *)(a2 + 208), v60);
      double v24 = (void *)sub_25F78C100();
      void v24[2] = 3;
      v24[5] = 0;
      v24[6] = 0;
      v24[4] = 0;
      BOOL v25 = sub_25F7632C0(v23, (uint64_t)v24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v25)
      {
        LOBYTE(v61) = v20;
        uint64_t v62 = v21;
        LOBYTE(v60) = 0;
        sub_25F78BC90();
        unsigned __int8 v26 = *(unsigned char *)(a2 + 8);
        int v52 = v26;
        uint64_t v27 = swift_retain();
        uint64_t v28 = sub_25F76A324(v27, v26);
        swift_release();
        uint64_t v29 = v28 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
        *(void *)(v29 + 48) = 0;
        *(void *)(v29 + 56) = 0;
        swift_bridgeObjectRelease();
        sub_25F7657C8();
        *(void *)(v29 + 48) = 0;
        *(void *)(v29 + 56) = 0;
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v30 = swift_retain();
        sub_25F76A324(v30, v52);
        swift_release();
        sub_25F78BF80();
        uint64_t v31 = v53;
        (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v9, 1, 1, v10);
        sub_25F763E6C((uint64_t)v15, 0, (uint64_t)v9);
        swift_release();
        sub_25F73D748((uint64_t)v9, &qword_26A7BB9D8);
        (*(void (**)(unsigned char *, uint64_t))(v31 + 8))(v15, v10);
      }
      else
      {
        char v35 = *(unsigned char *)(a2 + 8);
        uint64_t v36 = swift_retain();
        sub_25F76A324(v36, v35);
        swift_release();
        sub_25F763334(1, 1, 0);
        swift_release();
      }
    }
    else
    {
      char v32 = *(unsigned char *)(a2 + 8);
      uint64_t v33 = swift_retain();
      sub_25F76A324(v33, v32);
      swift_release();
      uint64_t v34 = *(void *)(a2 + 168);
      LOBYTE(v61) = *(unsigned char *)(a2 + 160);
      uint64_t v62 = v34;
      sub_25F78BC80();
      sub_25F78BF80();
      sub_25F78BF80();
      uint64_t v37 = v53;
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v53 + 56))(v9, 0, 1, v10);
      sub_25F763E6C((uint64_t)v13, 1, (uint64_t)v9);
      swift_release();
      sub_25F73D748((uint64_t)v9, &qword_26A7BB9D8);
      (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v13, v10);
      uint64_t v38 = *(void *)(a2 + 168);
      LOBYTE(v61) = *(unsigned char *)(a2 + 160);
      uint64_t v62 = v38;
      LOBYTE(v60) = 0;
      sub_25F78BC90();
    }
    char v39 = *(unsigned char *)(a2 + 8);
    uint64_t v40 = swift_retain();
    uint64_t v41 = sub_25F76A324(v40, v39);
    uint64_t result = swift_release();
    uint64_t v42 = *(void *)(v41 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
    BOOL v43 = __OFADD__(v42, 1);
    uint64_t v44 = v42 + 1;
    if (v43)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v41 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v44;
      swift_release();
      sub_25F78BE50();
      sub_25F78BE20();
      uint64_t v45 = swift_release();
      MEMORY[0x270FA5388](v45);
      *(void *)&v51[-16] = a2;
      uint64_t v46 = v56;
      sub_25F77AF64(a2, (uint64_t)v56, (uint64_t (*)(void))type metadata accessor for DraggableLocationItem);
      unint64_t v47 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
      uint64_t v48 = swift_allocObject();
      sub_25F77AFD0((uint64_t)v46, v48 + v47);
      long long v49 = v57;
      sub_25F78B7E0();
      sub_25F78B2B0();
      swift_release();
      swift_release();
      (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v49, v59);
      uint64_t v50 = *(void *)(a2 + 152);
      LOBYTE(v61) = *(unsigned char *)(a2 + 144);
      uint64_t v62 = v50;
      LOBYTE(v60) = 1;
      return sub_25F78BC90();
    }
  }
  return result;
}

uint64_t sub_25F77A9DC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBC60);
  sub_25F78BC80();
  sub_25F7797BC(*(void *)(a1 + 208), v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC8A0);
  return sub_25F78BCF0();
}

uint64_t sub_25F77AA7C()
{
  return sub_25F78BC90();
}

uint64_t sub_25F77AAD0()
{
  return sub_25F78BC90();
}

uint64_t sub_25F77AB28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F78BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 120);
  char v15 = *(unsigned char *)(a1 + 112);
  uint64_t v16 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  uint64_t result = sub_25F78BC80();
  if (v17 == 1)
  {
    uint64_t v11 = *(void *)(a1 + 152);
    char v15 = *(unsigned char *)(a1 + 144);
    uint64_t v16 = v11;
    sub_25F78BC80();
    char v12 = *(unsigned char *)(a1 + 8);
    uint64_t v13 = swift_retain();
    sub_25F76A324(v13, v12);
    swift_release();
    sub_25F78BF80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    sub_25F763E6C((uint64_t)v8, 0, (uint64_t)v4);
    swift_release();
    sub_25F73D748((uint64_t)v4, &qword_26A7BB9D8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t sub_25F77AD44(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  uint64_t v3 = sub_25F76A324(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_25F77BFD0((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  int v4 = *(unsigned __int8 *)(v3 + 51);
  uint64_t result = swift_release();
  if (v4 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC898);
    sub_25F78BC90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
    return sub_25F78BC90();
  }
  return result;
}

BOOL sub_25F77AE7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25F77AE90()
{
  return sub_25F78C470();
}

uint64_t sub_25F77AED8()
{
  return sub_25F78C460();
}

uint64_t sub_25F77AF04()
{
  return sub_25F78C470();
}

uint64_t sub_25F77AF48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F77AF64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F77AFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DraggableLocationItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F77B034()
{
  type metadata accessor for DraggableLocationItem();
  return sub_25F77863C();
}

uint64_t sub_25F77B0A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for DraggableLocationItem() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F778690(a1, v6, a2);
}

uint64_t sub_25F77B12C()
{
  return sub_25F77BB28(sub_25F778DA4);
}

uint64_t sub_25F77B144()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F77B17C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25F77B1A8(uint64_t a1)
{
  return sub_25F77B6C0(a1, sub_25F778FAC);
}

uint64_t sub_25F77B1C4(uint64_t a1)
{
  return sub_25F77B1F8(a1, sub_25F779638);
}

uint64_t sub_25F77B1E0(uint64_t a1)
{
  return sub_25F77B1F8(a1, sub_25F77A25C);
}

uint64_t sub_25F77B1F8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for DraggableLocationItem() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

unint64_t sub_25F77B27C()
{
  unint64_t result = qword_26A7BC8C0;
  if (!qword_26A7BC8C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC850);
    sub_25F77B348(&qword_26A7BC8C8, &qword_26A7BC848, (void (*)(void))sub_25F77B3C4);
    sub_25F73D9A4(&qword_26A7BBCF0, &qword_26A7BBCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC8C0);
  }
  return result;
}

uint64_t sub_25F77B348(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25F77B3C4()
{
  unint64_t result = qword_26A7BC8D0;
  if (!qword_26A7BC8D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC840);
    sub_25F77B464();
    sub_25F73D9A4(&qword_26A7BC900, &qword_26A7BC908);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC8D0);
  }
  return result;
}

unint64_t sub_25F77B464()
{
  unint64_t result = qword_26A7BC8D8;
  if (!qword_26A7BC8D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC838);
    sub_25F77B504();
    sub_25F73D9A4(&qword_26A7BC8F0, &qword_26A7BC8F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC8D8);
  }
  return result;
}

unint64_t sub_25F77B504()
{
  unint64_t result = qword_26A7BC8E0;
  if (!qword_26A7BC8E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC830);
    sub_25F77B5A4();
    sub_25F73D9A4(&qword_26A7BB9F0, &qword_26A7BB9F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC8E0);
  }
  return result;
}

unint64_t sub_25F77B5A4()
{
  unint64_t result = qword_26A7BC8E8;
  if (!qword_26A7BC8E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC828);
    type metadata accessor for LocationItemView();
    sub_25F77BFD0(&qword_26A7BC890, (void (*)(uint64_t))type metadata accessor for LocationItemView);
    swift_getOpaqueTypeConformance2();
    sub_25F73D9A4(&qword_26A7BBB78, &qword_26A7BBB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC8E8);
  }
  return result;
}

uint64_t sub_25F77B6A8(uint64_t a1)
{
  return sub_25F77B6C0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_25F77AAD0);
}

uint64_t sub_25F77B6C0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for DraggableLocationItem() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

unint64_t sub_25F77B744()
{
  unint64_t result = qword_26A7BC920;
  if (!qword_26A7BC920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC868);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC858);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC818);
    sub_25F77B348(&qword_26A7BC8B8, &qword_26A7BC858, (void (*)(void))sub_25F77B27C);
    sub_25F73D9A4(&qword_26A7BC910, &qword_26A7BC818);
    swift_getOpaqueTypeConformance2();
    sub_25F73D9A4(&qword_26A7BBCC8, &qword_26A7BBCD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC920);
  }
  return result;
}

uint64_t sub_25F77B898()
{
  return sub_25F77BB28(sub_25F77AB28);
}

uint64_t sub_25F77B8BC()
{
  return sub_25F77BB28(sub_25F77AD44);
}

uint64_t sub_25F77B8D4()
{
  return sub_25F77A9DC(*(void *)(v0 + 16));
}

uint64_t sub_25F77B8F4()
{
  return sub_25F77BB28((uint64_t (*)(uint64_t))sub_25F77AA7C);
}

uint64_t sub_25F77B90C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25F77B96C()
{
  return sub_25F779E84(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_25F77B98C(void *a1)
{
  return sub_25F78792C(0, a1[2], 0, a1);
}

uint64_t objectdestroyTm_5()
{
  char v1 = (int *)(type metadata accessor for DraggableLocationItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[18];
  uint64_t v8 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25F77BB10()
{
  return sub_25F77BB28(sub_25F779408);
}

uint64_t sub_25F77BB28(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for DraggableLocationItem() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_25F77BBB8()
{
  uint64_t v1 = *(void *)(type metadata accessor for DraggableLocationItem() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_25F78B260();
  return sub_25F7789EC((void *)(v0 + v2));
}

uint64_t objectdestroy_44Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for DraggableLocationItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_25F78B260();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v3 + v1[18];
  uint64_t v12 = sub_25F78BF90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_25F77BE78(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for DraggableLocationItem() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_25F78B260();
  return sub_25F778BC8(a1, a2, (void *)(v2 + v6));
}

unint64_t sub_25F77BF5C()
{
  unint64_t result = qword_26A7BC938;
  if (!qword_26A7BC938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC938);
  }
  return result;
}

uint64_t sub_25F77BFD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F77C018()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F77C164()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_25F77C174()
{
  _s16TryItBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26A7BC948 = (uint64_t)result;
  return result;
}

id static NSBundle.tipsTryItFrameworkBundle.getter()
{
  if (qword_26A7BB688 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A7BC948;
  return v0;
}

uint64_t _s16TryItBundleClassCMa()
{
  return self;
}

uint64_t static ContentModeKey.defaultValue.getter()
{
  return 0;
}

void sub_25F77C254(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25F77C25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_25F77C584();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t EnvironmentValues.contentMode.getter()
{
  sub_25F77C2FC();
  sub_25F78B520();
  return v1;
}

unint64_t sub_25F77C2FC()
{
  unint64_t result = qword_26A7BC950;
  if (!qword_26A7BC950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC950);
  }
  return result;
}

uint64_t sub_25F77C350@<X0>(unsigned char *a1@<X8>)
{
  sub_25F77C2FC();
  uint64_t result = sub_25F78B520();
  *a1 = v3;
  return result;
}

uint64_t sub_25F77C3A0()
{
  return sub_25F78B530();
}

uint64_t EnvironmentValues.contentMode.setter()
{
  return sub_25F78B530();
}

uint64_t (*EnvironmentValues.contentMode.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_25F77C2FC();
  sub_25F78B520();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_25F77C4A0;
}

uint64_t sub_25F77C4A0(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_25F78B530();
}

uint64_t sub_25F77C4D8@<X0>(unsigned char *a1@<X8>)
{
  sub_25F77C2FC();
  uint64_t result = sub_25F78B520();
  *a1 = v3;
  return result;
}

uint64_t sub_25F77C528()
{
  return sub_25F78B530();
}

ValueMetadata *type metadata accessor for ContentModeKey()
{
  return &type metadata for ContentModeKey;
}

unint64_t sub_25F77C584()
{
  unint64_t result = qword_26A7BC958;
  if (!qword_26A7BC958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC958);
  }
  return result;
}

uint64_t *sub_25F77C5D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)v4 + v11;
    uint64_t v14 = (char *)a2 + v11;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v14) = v14[8];
    *(void *)uint64_t v13 = v15;
    v13[8] = (char)v14;
    uint64_t v16 = (uint64_t *)((char *)v4 + v12);
    char v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    uint64_t v21 = (char *)v4 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *uint64_t v21 = *v22;
    *((void *)v21 + 1) = *((void *)v22 + 1);
    uint64_t v23 = (char *)v4 + v20;
    double v24 = (char *)a2 + v20;
    *uint64_t v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v25 = a3[9];
    uint64_t v26 = a3[10];
    uint64_t v27 = (uint64_t *)((char *)v4 + v25);
    uint64_t v28 = (uint64_t *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    v27[2] = v28[2];
    uint64_t v30 = (uint64_t *)((char *)v4 + v26);
    uint64_t v31 = (uint64_t *)((char *)a2 + v26);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    uint64_t v33 = a3[11];
    uint64_t v34 = a3[12];
    char v35 = (uint64_t *)((char *)v4 + v33);
    uint64_t v36 = (uint64_t *)((char *)a2 + v33);
    uint64_t v37 = v36[1];
    *char v35 = *v36;
    v35[1] = v37;
    *(uint64_t *)((char *)v4 + v34) = *(uint64_t *)((char *)a2 + v34);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_25F77C88C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25F78B730();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_25F77C9F4(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25F78B730();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v9;
  uint64_t v12 = (char *)a2 + v9;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  uint64_t v14 = (void *)((char *)a1 + v10);
  uint64_t v15 = (void *)((char *)a2 + v10);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  char *v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  uint64_t v21 = (char *)a1 + v18;
  uint64_t v22 = (char *)a2 + v18;
  *uint64_t v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  uint64_t v23 = a3[9];
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v23);
  uint64_t v26 = (void *)((char *)a2 + v23);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  void v25[2] = v26[2];
  uint64_t v28 = (void *)((char *)a1 + v24);
  uint64_t v29 = (void *)((char *)a2 + v24);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = a3[11];
  uint64_t v32 = a3[12];
  uint64_t v33 = (void *)((char *)a1 + v31);
  uint64_t v34 = (void *)((char *)a2 + v31);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  *(void *)((char *)a1 + v32) = *(void *)((char *)a2 + v32);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_25F77CC5C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25F78B730();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)v11;
  LOBYTE(v11) = v11[8];
  *(void *)uint64_t v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *uint64_t v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *uint64_t v20 = *v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (char *)a2 + v22;
  *uint64_t v23 = *(void *)((char *)a2 + v22);
  v23[1] = *(void *)((char *)a2 + v22 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v23[2] = *((void *)v24 + 2);
  swift_retain();
  swift_release();
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_retain();
  swift_release();
  uint64_t v28 = a3[11];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  swift_retain();
  swift_release();
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  return a1;
}

char *sub_25F77CF48(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  uint64_t v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  uint64_t v15 = a3[9];
  uint64_t v16 = a3[10];
  uint64_t v17 = &a1[v15];
  uint64_t v18 = &a2[v15];
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *((void *)v17 + 2) = *((void *)v18 + 2);
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  uint64_t v19 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  return a1;
}

char *sub_25F77D12C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25F73D748((uint64_t)a1, &qword_26A7BB898);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25F78B730();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;
  swift_release();
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *uint64_t v20 = *v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_release();
  uint64_t v22 = a3[8];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  *uint64_t v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_release();
  uint64_t v25 = a3[9];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v28 = *(void *)&a2[v25 + 8];
  *(void *)uint64_t v26 = *(void *)&a2[v25];
  *((void *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
  *((void *)v26 + 2) = *((void *)v27 + 2);
  swift_release();
  uint64_t v29 = a3[10];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  *(void *)uint64_t v30 = *(void *)v31;
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_release();
  uint64_t v32 = a3[11];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  *(void *)&a1[v32] = *(void *)&a2[v32];
  swift_release();
  *((void *)v33 + 1) = *((void *)v34 + 1);
  swift_release();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  return a1;
}

uint64_t sub_25F77D3C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F77D3DC);
}

uint64_t sub_25F77D3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25F77D4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F77D4B8);
}

uint64_t sub_25F77D4B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB8A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for TouchHoldView()
{
  uint64_t result = qword_26A7BC960;
  if (!qword_26A7BC960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25F77D5C8()
{
  sub_25F742A1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25F77D688()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25F77D6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F78C170();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25F78C160();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25F73D748(a1, &qword_26A7BC2E0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25F78C120();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_25F77D850(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (int *)type metadata accessor for TouchHoldView();
  uint64_t v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_25F783F08((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  *(void *)uint64_t v3 = sub_25F78B190();
  v3[8] = v4 & 1;
  uint64_t v5 = v2[6];
  sub_25F78BC70();
  *(_OWORD *)((char *)a1 + v5) = v21;
  uint64_t v6 = (char *)a1 + v2[7];
  sub_25F78BC70();
  *uint64_t v6 = v21;
  *((void *)v6 + 1) = *((void *)&v21 + 1);
  uint64_t v7 = (char *)a1 + v2[8];
  sub_25F78BC70();
  char *v7 = v21;
  *((void *)v7 + 1) = *((void *)&v21 + 1);
  uint64_t v8 = (char *)a1 + v2[9];
  sub_25F78BC70();
  *(_OWORD *)uint64_t v8 = v21;
  *((void *)v8 + 2) = v22;
  uint64_t v9 = (_OWORD *)((char *)a1 + v2[10]);
  sub_25F78BC70();
  *uint64_t v9 = v21;
  uint64_t v10 = v2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC7A8);
  sub_25F78BC70();
  *(_OWORD *)((char *)a1 + v10) = v21;
  uint64_t v11 = v2[12];
  id v12 = objc_msgSend(self, sel_mainScreen, 0, 0xE000000000000000);
  objc_msgSend(v12, sel_bounds);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  *(CGFloat *)((char *)a1 + v11) = CGRectGetHeight(v23);
}

uint64_t sub_25F77DAA4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TouchHoldView();
  char v8 = *(unsigned char *)(v1 + *(int *)(v7 + 20) + 8);
  uint64_t v9 = swift_retain();
  uint64_t v10 = sub_25F76A324(v9, v8);
  swift_release();
  swift_getKeyPath();
  uint64_t v24 = v10;
  sub_25F783F08((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
  sub_25F78B040();
  swift_release();
  char v11 = *(unsigned char *)(v10 + 48);
  uint64_t result = swift_release();
  if ((v11 & 1) == 0)
  {
    double v13 = (uint64_t *)(v2 + *(int *)(v7 + 24));
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    uint64_t v24 = *v13;
    uint64_t v25 = v14;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
    uint64_t result = sub_25F78BC80();
    if (__OFADD__(v26, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v24 = v15;
      uint64_t v25 = v14;
      uint64_t v23 = v26 + 1;
      sub_25F78BC90();
      swift_release();
      uint64_t v16 = swift_retain();
      uint64_t v17 = sub_25F76A324(v16, v8);
      uint64_t result = swift_release();
      uint64_t v18 = *(void *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 72);
      BOOL v19 = __OFADD__(v18, 1);
      uint64_t v20 = v18 + 1;
      if (!v19)
      {
        *(void *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 72) = v20;
        swift_release();
        uint64_t v21 = swift_retain();
        sub_25F76A324(v21, v8);
        swift_release();
        uint64_t v22 = sub_25F78BF90();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
        sub_25F763E6C(a1, 1, (uint64_t)v6);
        swift_release();
        return sub_25F73D748((uint64_t)v6, &qword_26A7BB9D8);
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25F77DD18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v49 = a3;
  uint64_t v5 = (int *)type metadata accessor for TouchHoldView();
  uint64_t v46 = *((void *)v5 - 1);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v47 = v7;
  uint64_t v48 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (char *)&v40 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC970);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC978);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC980);
  uint64_t v44 = *(void *)(v16 - 8);
  uint64_t v45 = v16;
  MEMORY[0x270FA5388](v16);
  BOOL v43 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC988);
  MEMORY[0x270FA5388](v42);
  uint64_t v40 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = a2;
  uint64_t v51 = a1;
  sub_25F78B8A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC990);
  sub_25F73D9A4(&qword_26A7BC998, &qword_26A7BC990);
  sub_25F78B120();
  BOOL v19 = (uint64_t *)(a2 + v5[10]);
  uint64_t v20 = *v19;
  uint64_t v21 = v19[1];
  *(void *)&long long v52 = v20;
  *((void *)&v52 + 1) = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC80();
  uint64_t v22 = v53;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v12, v9);
  uint64_t v23 = &v15[*(int *)(v13 + 36)];
  *(void *)uint64_t v23 = 0;
  *((void *)v23 + 1) = v22;
  uint64_t v24 = v12;
  uint64_t v25 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v24, v9);
  long long v52 = *(_OWORD *)(a2 + v5[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v26 = v53;
  sub_25F7842B8(a2, v25, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  if (v26 >= 4)
  {
    char v27 = *(unsigned char *)(v25 + v5[5] + 8);
    uint64_t v28 = swift_retain();
    uint64_t v29 = sub_25F76A324(v28, v27);
    swift_release();
    swift_getKeyPath();
    *(void *)&long long v52 = v29;
    sub_25F783F08((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
    sub_25F78B040();
    swift_release();
    swift_release();
  }
  sub_25F784320(v25, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  sub_25F782C5C();
  uint64_t v30 = v43;
  sub_25F78BAE0();
  sub_25F73D748((uint64_t)v15, &qword_26A7BC978);
  uint64_t v31 = a2;
  uint64_t v32 = v48;
  sub_25F7842B8(v31, v48, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v33 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  uint64_t v34 = swift_allocObject();
  sub_25F783954(v32, v34 + v33, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  uint64_t v36 = v44;
  uint64_t v35 = v45;
  uint64_t v37 = (uint64_t)v40;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v40, v30, v45);
  uint64_t v38 = (uint64_t (**)())(v37 + *(int *)(v42 + 36));
  *uint64_t v38 = sub_25F782D00;
  v38[1] = (uint64_t (*)())v34;
  v38[2] = 0;
  v38[3] = 0;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v35);
  return sub_25F73D51C(v37, v49, &qword_26A7BC988);
}

uint64_t sub_25F77E2BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_25F78B600();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9B0);
  return sub_25F77E31C(a1, a2, (char *)(a3 + *(int *)(v6 + 44)));
}

uint64_t sub_25F77E31C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v89 = a3;
  uint64_t v84 = type metadata accessor for HapticTouchButtonView();
  uint64_t v5 = MEMORY[0x270FA5388](v84);
  uint64_t v83 = (uint64_t *)((char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v81 = (uint64_t)&v81 - v7;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBD8);
  uint64_t v85 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v82 = (uint64_t)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBE0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  unint64_t v88 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  BOOL v86 = (char *)&v81 - v12;
  uint64_t v13 = type metadata accessor for TouchHoldView();
  uint64_t v96 = (int *)v13;
  int v94 = *(char **)(v13 - 8);
  uint64_t v14 = *((void *)v94 + 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v93 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v81 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9B8);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (uint64_t *)((char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9C0);
  uint64_t v90 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9C8);
  uint64_t v97 = *(void *)(v24 - 8);
  uint64_t v98 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v95 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v92 = (char *)&v81 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v81 - v29;
  *uint64_t v20 = sub_25F78BDE0();
  v20[1] = v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9D0);
  sub_25F77ECAC(a1, a2, (char *)v20 + *(int *)(v32 + 44));
  sub_25F73D580((uint64_t)v20, (uint64_t)v23, &qword_26A7BC9B8);
  unint64_t v33 = &v23[*(int *)(v21 + 52)];
  *(void *)unint64_t v33 = 0x7267206F746F6870;
  *((void *)v33 + 1) = 0xEA00000000006469;
  sub_25F73D748((uint64_t)v20, &qword_26A7BC9B8);
  uint64_t v34 = a1 + *(int *)(v13 + 32);
  char v35 = *(unsigned char *)v34;
  uint64_t v36 = *(void *)(v34 + 8);
  LOBYTE(v99) = v35;
  uint64_t v100 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BCA0();
  uint64_t v91 = type metadata accessor for TouchHoldView;
  sub_25F7842B8(a1, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v37 = (v94[80] + 16) & ~(unint64_t)v94[80];
  uint64_t v38 = swift_allocObject();
  sub_25F783954((uint64_t)v17, v38 + v37, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9D8);
  sub_25F73D9A4(&qword_26A7BC9E0, &qword_26A7BC9C0);
  sub_25F783ACC(&qword_26A7BC9E8, &qword_26A7BC9D8, (void (*)(void))sub_25F7838F8);
  char v39 = v92;
  sub_25F78BB60();
  swift_release();
  uint64_t v40 = a1;
  swift_release();
  swift_release();
  sub_25F73D748((uint64_t)v23, &qword_26A7BC9C0);
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v97 + 32);
  int v94 = v30;
  uint64_t v42 = (uint64_t)v93;
  v41(v30, v39, v98);
  long long v101 = *(_OWORD *)(a1 + v96[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBBB8);
  sub_25F78BC80();
  uint64_t v43 = v99;
  sub_25F7842B8(a1, v42, (uint64_t (*)(void))v91);
  if (v43 < 4)
  {
    sub_25F784320(v42, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
    uint64_t v55 = 1;
    uint64_t v51 = (uint64_t)v88;
    uint64_t v50 = v89;
    uint64_t v52 = v87;
    uint64_t v53 = (uint64_t)v86;
    uint64_t v54 = v85;
  }
  else
  {
    uint64_t v44 = v84;
    uint64_t v45 = v83;
    char v46 = *(unsigned char *)(v42 + v96[5] + 8);
    uint64_t v47 = swift_retain();
    uint64_t v48 = sub_25F76A324(v47, v46);
    swift_release();
    swift_getKeyPath();
    *(void *)&long long v101 = v48;
    sub_25F783F08((unint64_t *)&qword_26A7BB7A0, (void (*)(uint64_t))type metadata accessor for TrainingManager);
    sub_25F78B040();
    swift_release();
    char v49 = *(unsigned char *)(v48 + 48);
    swift_release();
    sub_25F784320(v42, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
    uint64_t v51 = (uint64_t)v88;
    uint64_t v50 = v89;
    uint64_t v52 = v87;
    uint64_t v53 = (uint64_t)v86;
    uint64_t v54 = v85;
    if (v49)
    {
      uint64_t v55 = 1;
    }
    else
    {
      *uint64_t v45 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
      swift_storeEnumTagMultiPayload();
      uint64_t v56 = (char *)v45 + *(int *)(v44 + 20);
      type metadata accessor for TrainingManager();
      *(void *)uint64_t v56 = sub_25F78B190();
      v56[8] = v57 & 1;
      uint64_t v58 = v81;
      sub_25F783954((uint64_t)v45, v81, (uint64_t (*)(void))type metadata accessor for HapticTouchButtonView);
      char v59 = sub_25F78B8E0();
      double v60 = (uint64_t *)(v40 + v96[10]);
      uint64_t v61 = *v60;
      uint64_t v62 = v60[1];
      *(void *)&long long v101 = v61;
      *((void *)&v101 + 1) = v62;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
      sub_25F78BC80();
      sub_25F78B110();
      uint64_t v64 = v63;
      uint64_t v66 = v65;
      uint64_t v68 = v67;
      uint64_t v70 = v69;
      uint64_t v71 = v82;
      sub_25F7842B8(v58, v82, (uint64_t (*)(void))type metadata accessor for HapticTouchButtonView);
      uint64_t v72 = v71 + *(int *)(v52 + 36);
      *(unsigned char *)uint64_t v72 = v59;
      *(void *)(v72 + 8) = v64;
      *(void *)(v72 + 16) = v66;
      *(void *)(v72 + 24) = v68;
      *(void *)(v72 + 32) = v70;
      *(unsigned char *)(v72 + 40) = 0;
      sub_25F784320(v58, (uint64_t (*)(void))type metadata accessor for HapticTouchButtonView);
      sub_25F73D51C(v71, v53, &qword_26A7BBBD8);
      uint64_t v55 = 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56))(v53, v55, 1, v52);
  uint64_t v74 = v97;
  uint64_t v73 = v98;
  uint64_t v75 = *(void (**)(char *, char *, uint64_t))(v97 + 16);
  double v77 = v94;
  uint64_t v76 = v95;
  v75(v95, v94, v98);
  sub_25F73D580(v53, v51, &qword_26A7BBBE0);
  v75(v50, v76, v73);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9F0);
  sub_25F73D580(v51, (uint64_t)&v50[*(int *)(v78 + 48)], &qword_26A7BBBE0);
  sub_25F73D748(v53, &qword_26A7BBBE0);
  uint64_t v79 = *(void (**)(char *, uint64_t))(v74 + 8);
  v79(v77, v73);
  sub_25F73D748(v51, &qword_26A7BBBE0);
  return ((uint64_t (*)(char *, uint64_t))v79)(v76, v73);
}

uint64_t sub_25F77ECAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v126 = a2;
  uint64_t v132 = a3;
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA00) - 8;
  MEMORY[0x270FA5388](v131);
  uint64_t v130 = (uint64_t)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_25F78B720();
  MEMORY[0x270FA5388](v123);
  uint64_t v122 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_25F78BD60();
  uint64_t v112 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115);
  uint64_t v111 = (_OWORD *)((char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_25F78BD70();
  uint64_t v116 = *(void *)(v7 - 8);
  uint64_t v117 = v7 - 8;
  uint64_t v113 = v7;
  uint64_t v114 = v116;
  MEMORY[0x270FA5388](v7);
  uint64_t v110 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFB0);
  uint64_t v124 = *(void *)(v9 - 8);
  uint64_t v125 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v119 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBFB8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v118 = (uint64_t)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA08) - 8;
  MEMORY[0x270FA5388](v121);
  uint64_t v120 = (uint64_t)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA10) - 8;
  uint64_t v14 = MEMORY[0x270FA5388](v128);
  uint64_t v127 = (uint64_t)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v129 = (uint64_t)&v93 - v16;
  uint64_t v17 = sub_25F78B360();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v101 = v17;
  uint64_t v102 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v97 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD60);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v108 = v20;
  uint64_t v109 = v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v98 = (char *)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for TouchHoldView();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD68);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v99 = v26;
  uint64_t v100 = v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v133 = (char *)&v93 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD70);
  uint64_t v135 = *(void *)(v137 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v137);
  uint64_t v134 = (char *)&v93 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v136 = (char *)&v93 - v31;
  uint64_t v32 = sub_25F78BBC0();
  uint64_t v33 = sub_25F78BDE0();
  sub_25F7518F8(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, (uint64_t)v140, 0.0, 1, 333.0, 0, v33, v34, v32, 0, 1, 0);
  swift_release();
  uint64_t v96 = a1;
  uint64_t v94 = (uint64_t)&v93 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for TouchHoldView;
  sub_25F7842B8(a1, v94, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  uint64_t v35 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v36 = (v35 + 16) & ~v35;
  uint64_t v104 = v35 | 7;
  uint64_t v105 = v36 + v25;
  uint64_t v37 = swift_allocObject();
  uint64_t v106 = v36;
  uint64_t v103 = type metadata accessor for TouchHoldView;
  sub_25F783954((uint64_t)&v93 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v37 + v36, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  *(void *)&long long v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBD78);
  *((void *)&v95 + 1) = sub_25F78462C(&qword_26A7BBD80, &qword_26A7BBD78, (void (*)(void))sub_25F74F430);
  sub_25F78BAC0();
  swift_release();
  v141[4] = v140[4];
  v141[5] = v140[5];
  v141[6] = v140[6];
  v141[7] = v140[7];
  v141[0] = v140[0];
  v141[1] = v140[1];
  v141[2] = v140[2];
  void v141[3] = v140[3];
  sub_25F74F4F4((uint64_t)v141);
  uint64_t v38 = v97;
  sub_25F78B350();
  uint64_t v39 = v94;
  sub_25F7842B8(a1, v94, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  uint64_t v40 = swift_allocObject();
  uint64_t v41 = v39;
  sub_25F783954(v39, v40 + v36, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  sub_25F783F08(&qword_26A7BBDB8, MEMORY[0x263F18F90]);
  uint64_t v42 = v98;
  uint64_t v43 = v101;
  sub_25F78BD30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v38, v43);
  sub_25F78B1A0();
  v140[0] = v95;
  swift_getOpaqueTypeConformance2();
  sub_25F73D9A4(&qword_26A7BBDC0, &qword_26A7BBD60);
  uint64_t v44 = v134;
  uint64_t v45 = v42;
  uint64_t v46 = v99;
  uint64_t v47 = v108;
  uint64_t v48 = v133;
  sub_25F78BB30();
  (*(void (**)(char *, uint64_t))(v109 + 8))(v45, v47);
  (*(void (**)(char *, uint64_t))(v100 + 8))(v48, v46);
  (*(void (**)(char *, char *, uint64_t))(v135 + 32))(v136, v44, v137);
  uint64_t v50 = v111;
  uint64_t v49 = v112;
  _OWORD *v111 = xmmword_25F78D280;
  (*(void (**)(_OWORD *, void, uint64_t))(v49 + 104))(v50, *MEMORY[0x263F1B8C8], v115);
  uint64_t v51 = v110;
  sub_25F78BD80();
  uint64_t v52 = v113;
  uint64_t v53 = sub_25F78C100();
  *(void *)(v53 + 16) = 3;
  unint64_t v54 = v53 + ((*(unsigned __int8 *)(v114 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80));
  uint64_t v55 = v114;
  uint64_t v56 = *(void (**)(unint64_t, char *, uint64_t))(v114 + 16);
  v56(v54, v51, v52);
  uint64_t v57 = *(void *)(v116 + 72);
  v56(v54 + v57, v51, v52);
  (*(void (**)(unint64_t, char *, uint64_t))(v55 + 32))(v54 + 2 * v57, v51, v52);
  sub_25F78B600();
  uint64_t v58 = v96;
  uint64_t v138 = v96;
  uint64_t v139 = v126;
  LODWORD(v140[0]) = 0;
  sub_25F783F08(&qword_26A7BBDC8, MEMORY[0x263F19D28]);
  sub_25F78C490();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA18);
  sub_25F783ACC(&qword_26A7BCA20, &qword_26A7BCA18, (void (*)(void))sub_25F783B38);
  char v59 = v119;
  sub_25F78BE90();
  uint64_t v60 = sub_25F78BDE0();
  uint64_t v61 = v118;
  double v63 = sub_25F7522E8(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, v118, 0.0, 1, 333.0, 0, v60, v62);
  (*(void (**)(char *, uint64_t, double))(v124 + 8))(v59, v125, v63);
  LOBYTE(v59) = sub_25F78B8B0();
  sub_25F78B110();
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v72 = v120;
  sub_25F73D580(v61, v120, &qword_26A7BBFB8);
  uint64_t v73 = v72 + *(int *)(v121 + 44);
  *(unsigned char *)uint64_t v73 = (_BYTE)v59;
  *(void *)(v73 + 8) = v65;
  *(void *)(v73 + 16) = v67;
  *(void *)(v73 + 24) = v69;
  *(void *)(v73 + 32) = v71;
  *(unsigned char *)(v73 + 40) = 0;
  sub_25F73D748(v61, &qword_26A7BBFB8);
  sub_25F7842B8(v58, v41, (uint64_t (*)(void))v107);
  uint64_t v74 = swift_allocObject();
  sub_25F783954(v41, v74 + v106, (uint64_t (*)(void))v103);
  uint64_t v75 = sub_25F78BDE0();
  double v77 = v76;
  uint64_t v78 = v130;
  sub_25F73D580(v72, v130, &qword_26A7BCA08);
  uint64_t v79 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v78 + *(int *)(v131 + 44));
  *uint64_t v79 = sub_25F757194;
  v79[1] = 0;
  v79[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v75;
  v79[3] = v77;
  uint64_t v80 = swift_allocObject();
  *(void *)(v80 + 16) = sub_25F783E58;
  *(void *)(v80 + 24) = v74;
  uint64_t v81 = v127;
  sub_25F73D580(v78, v127, &qword_26A7BCA00);
  uint64_t v82 = (uint64_t (**)(double *))(v81 + *(int *)(v128 + 44));
  *uint64_t v82 = sub_25F74FABC;
  v82[1] = (uint64_t (*)(double *))v80;
  sub_25F73D748(v78, &qword_26A7BCA00);
  sub_25F73D748(v72, &qword_26A7BCA08);
  uint64_t v83 = v129;
  sub_25F73D51C(v81, v129, &qword_26A7BCA10);
  uint64_t v84 = v134;
  uint64_t v85 = v135;
  BOOL v86 = *(void (**)(char *, char *, uint64_t))(v135 + 16);
  unint64_t v88 = v136;
  uint64_t v87 = v137;
  v86(v134, v136, v137);
  sub_25F73D580(v83, v81, &qword_26A7BCA10);
  uint64_t v89 = v132;
  v86(v132, v84, v87);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA98);
  sub_25F73D580(v81, (uint64_t)&v89[*(int *)(v90 + 48)], &qword_26A7BCA10);
  sub_25F73D748(v83, &qword_26A7BCA10);
  uint64_t v91 = *(void (**)(char *, uint64_t))(v85 + 8);
  v91(v88, v87);
  sub_25F73D748(v81, &qword_26A7BCA10);
  return ((uint64_t (*)(char *, uint64_t))v91)(v84, v87);
}

uint64_t sub_25F77FAD0()
{
  uint64_t v0 = sub_25F78BF90();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78BF80();
  sub_25F77DAA4((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25F77FBB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v15[1] = a3;
  uint64_t v5 = sub_25F78B340();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = type metadata accessor for TouchHoldView();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  long long v16 = xmmword_25F78D290;
  swift_getKeyPath();
  sub_25F7842B8(a1, (uint64_t)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v5);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v12 = (v10 + *(unsigned __int8 *)(v6 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  sub_25F783954((uint64_t)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v11, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v13 + v12, (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBE70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA30);
  sub_25F74FB90();
  sub_25F783B38();
  return sub_25F78BD20();
}

uint64_t sub_25F77FE2C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v90 = a3;
  uint64_t v88 = a2;
  v70[1] = a4;
  uint64_t v5 = sub_25F78B580();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v92 = (char *)v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78B020();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v91 = (char *)v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25F78BF90();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v89 = (char *)v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAA0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v87 = (uint64_t)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TouchHoldView();
  uint64_t v86 = *(void *)(v13 - 8);
  uint64_t v85 = *(void *)(v86 + 64);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v84 = (uint64_t)v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB30) - 8;
  MEMORY[0x270FA5388](v77);
  uint64_t v76 = (uint64_t)v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_25F78B5A0();
  uint64_t v16 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v18 = (char *)v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25F78B390();
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA60);
  uint64_t v24 = v23 - 8;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (_OWORD *)((char *)v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA48);
  MEMORY[0x270FA5388](v75);
  uint64_t v73 = (uint64_t)v70 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAA8);
  uint64_t v82 = *(void *)(v28 - 8);
  uint64_t v83 = v28;
  MEMORY[0x270FA5388](v28);
  uint64_t v78 = (char *)v70 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA40);
  MEMORY[0x270FA5388](v81);
  uint64_t v79 = (char *)v70 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA30);
  MEMORY[0x270FA5388](v70[0]);
  uint64_t v80 = (char *)v70 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = *a1;
  strcpy((char *)v105, "TapTouchGrid");
  BYTE5(v105[1]) = 0;
  HIWORD(v105[1]) = -5120;
  *(void *)&long long v96 = v74;
  sub_25F78C400();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  uint64_t v33 = v105[0];
  uint64_t v32 = v105[1];
  uint64_t v71 = v105[0];
  uint64_t KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_25F78BDE0();
  sub_25F752540(0.0, 0, 0.0, 1, 103.0, 0, 0.0, 0, (uint64_t)&v96, 0.0, 1, 103.0, 0, v35, v36, KeyPath, 0, v33, v32);
  swift_bridgeObjectRelease();
  swift_release();
  v95[6] = v102;
  unsigned char v95[7] = v103;
  v95[8] = v104[0];
  _OWORD v95[2] = v98;
  v95[3] = v99;
  v95[4] = v100;
  v95[5] = v101;
  v95[0] = v96;
  v95[1] = v97;
  *(void *)&v104[1] = 0x3FF0000000000000;
  WORD4(v104[1]) = 256;
  uint64_t v37 = v72;
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F19860], v72);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(&v22[*(int *)(v20 + 28)], v18, v37);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)uint64_t v22 = _Q0;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v37);
  uint64_t v43 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v44 = v76;
  sub_25F7842B8((uint64_t)v22, v76, MEMORY[0x263F19048]);
  *(_WORD *)(v44 + *(int *)(v77 + 44)) = 256;
  sub_25F73D580(v44, (uint64_t)v26 + *(int *)(v24 + 44), &qword_26A7BBB30);
  long long v45 = v103;
  v26[6] = v102;
  unsigned char v26[7] = v45;
  v26[8] = v104[0];
  *(_OWORD *)((char *)v26 + 138) = *(_OWORD *)((char *)v104 + 10);
  long long v46 = v99;
  _OWORD v26[2] = v98;
  v26[3] = v46;
  long long v47 = v101;
  v26[4] = v100;
  v26[5] = v47;
  long long v48 = v97;
  *uint64_t v26 = v96;
  v26[1] = v48;
  sub_25F743AC4((uint64_t)&v96);
  sub_25F73D748(v44, &qword_26A7BBB30);
  sub_25F784320((uint64_t)v22, v43);
  sub_25F743B00((uint64_t)v95);
  uint64_t v49 = swift_getKeyPath();
  uint64_t v50 = v73;
  sub_25F73D580((uint64_t)v26, v73, &qword_26A7BCA60);
  uint64_t v51 = v50 + *(int *)(v75 + 36);
  *(void *)uint64_t v51 = v49;
  *(unsigned char *)(v51 + 8) = 1;
  sub_25F73D748((uint64_t)v26, &qword_26A7BCA60);
  uint64_t v52 = v88;
  uint64_t v53 = v84;
  sub_25F7842B8(v88, v84, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v54 = (*(unsigned __int8 *)(v86 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
  uint64_t v55 = swift_allocObject();
  sub_25F783954(v53, v55 + v54, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  sub_25F783CB8();
  uint64_t v56 = v78;
  sub_25F78BAC0();
  swift_release();
  sub_25F73D748(v50, &qword_26A7BCA48);
  uint64_t v57 = v87;
  uint64_t v58 = v74;
  sub_25F78086C(v52, v71, v32, v90, v74, v87);
  swift_bridgeObjectRelease();
  uint64_t v59 = sub_25F78BDE0();
  uint64_t v61 = v60;
  uint64_t v62 = (uint64_t)v79;
  uint64_t v63 = (uint64_t)&v79[*(int *)(v81 + 36)];
  sub_25F73D580(v57, v63, &qword_26A7BCAA0);
  uint64_t v64 = (uint64_t *)(v63 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCA90) + 36));
  *uint64_t v64 = v59;
  v64[1] = v61;
  uint64_t v66 = v82;
  uint64_t v65 = v83;
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 16))(v62, v56, v83);
  uint64_t v67 = (uint64_t)v80;
  sub_25F73D748(v57, &qword_26A7BCAA0);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v65);
  sub_25F78BF80();
  sub_25F78B010();
  uint64_t v93 = sub_25F78BFE0();
  uint64_t v94 = v68;
  sub_25F783BE4();
  sub_25F743B64();
  sub_25F78BB00();
  swift_bridgeObjectRelease();
  sub_25F73D748(v62, &qword_26A7BCA40);
  sub_25F78B570();
  uint64_t result = sub_25F78B560();
  if (__OFADD__(v58, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v93 = v58 + 1;
    sub_25F78B550();
    sub_25F78B560();
    sub_25F78B590();
    sub_25F78B300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_25F73D748(v67, &qword_26A7BCA30);
  }
  return result;
}

uint64_t sub_25F78086C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v103 = a2;
  uint64_t v104 = a5;
  uint64_t v98 = a4;
  uint64_t v96 = a3;
  uint64_t v102 = a6;
  uint64_t v7 = sub_25F78B580();
  MEMORY[0x270FA5388](v7 - 8);
  long long v101 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25F78B020();
  MEMORY[0x270FA5388](v9 - 8);
  long long v100 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25F78BF90();
  MEMORY[0x270FA5388](v11 - 8);
  long long v99 = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TouchHoldView();
  uint64_t v14 = v13 - 8;
  uint64_t v86 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v88 = v15;
  uint64_t v89 = (uint64_t *)((char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BBB30);
  MEMORY[0x270FA5388](v82);
  uint64_t v83 = (uint64_t)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25F78B5A0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_25F78B390();
  MEMORY[0x270FA5388](v80);
  uint64_t v22 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAB0);
  MEMORY[0x270FA5388](v81);
  uint64_t v24 = (_OWORD *)((char *)&v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAB8);
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (uint64_t)&v77 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAC0);
  uint64_t v90 = *(void *)(v26 - 8);
  uint64_t v91 = v26;
  MEMORY[0x270FA5388](v26);
  uint64_t v87 = (char *)&v77 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAC8);
  uint64_t v93 = *(void *)(v28 - 8);
  uint64_t v94 = v28;
  MEMORY[0x270FA5388](v28);
  uint64_t v92 = (char *)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAD0);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  long long v95 = (char *)&v77 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v79 = (char *)&v77 - v34;
  uint64_t v35 = *(int *)(v14 + 36);
  uint64_t v97 = a1;
  uint64_t v36 = (char *)(a1 + v35);
  char v37 = *v36;
  uint64_t v38 = *((void *)v36 + 1);
  LOBYTE(v116) = v37;
  *((void *)&v116 + 1) = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC80();
  if (v107 != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v102, 1, 1, v30);
  }
  uint64_t v77 = v31;
  uint64_t v78 = v30;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v40 = v96;
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_25F78BDE0();
  sub_25F752540(0.0, 0, 0.0, 1, 103.0, 0, 0.0, 0, (uint64_t)&v107, 0.0, 1, 103.0, 0, v41, v42, KeyPath, 0, v103, v40);
  swift_bridgeObjectRelease();
  swift_release();
  long long v122 = v113;
  long long v123 = v114;
  long long v124 = v115;
  long long v118 = v109;
  long long v119 = v110;
  long long v120 = v111;
  long long v121 = v112;
  long long v116 = v107;
  long long v117 = v108;
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F19860], v17);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(&v22[*(int *)(v80 + 20)], v20, v17);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)uint64_t v22 = _Q0;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  long long v48 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v49 = v83;
  sub_25F7842B8((uint64_t)v22, v83, MEMORY[0x263F19048]);
  *(_WORD *)(v49 + *(int *)(v82 + 36)) = 256;
  sub_25F73D580(v49, (uint64_t)v24 + *(int *)(v81 + 36), &qword_26A7BBB30);
  long long v50 = v123;
  v24[6] = v122;
  v24[7] = v50;
  v24[8] = v124;
  long long v51 = v119;
  void v24[2] = v118;
  v24[3] = v51;
  long long v52 = v121;
  v24[4] = v120;
  v24[5] = v52;
  long long v53 = v117;
  *uint64_t v24 = v116;
  v24[1] = v53;
  sub_25F743AC4((uint64_t)&v116);
  sub_25F73D748(v49, &qword_26A7BBB30);
  sub_25F784320((uint64_t)v22, v48);
  sub_25F743B00((uint64_t)&v116);
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = v84;
  sub_25F73D580((uint64_t)v24, v84, &qword_26A7BCAB0);
  uint64_t v56 = v85;
  uint64_t v57 = v55 + *(int *)(v85 + 36);
  *(void *)uint64_t v57 = v54;
  *(unsigned char *)(v57 + 8) = 1;
  sub_25F73D748((uint64_t)v24, &qword_26A7BCAB0);
  uint64_t v58 = (uint64_t)v89;
  sub_25F7842B8(v97, (uint64_t)v89, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v59 = (*(unsigned __int8 *)(v86 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
  uint64_t v60 = swift_allocObject();
  sub_25F783954(v58, v60 + v59, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v61 = sub_25F7843A4();
  uint64_t v62 = v87;
  sub_25F78BAC0();
  swift_release();
  uint64_t v63 = sub_25F73D748(v55, &qword_26A7BCAB8);
  uint64_t v89 = &v77;
  uint64_t v64 = MEMORY[0x270FA5388](v63);
  MEMORY[0x270FA5388](v64);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAE8);
  *(void *)&long long v107 = v56;
  *((void *)&v107 + 1) = v61;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v76 = sub_25F784500();
  *((void *)&v76 + 1) = sub_25F784554();
  uint64_t v67 = v91;
  uint64_t v68 = v92;
  sub_25F78BAA0();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v62, v67);
  sub_25F78BF80();
  sub_25F78B010();
  uint64_t v105 = sub_25F78BFE0();
  uint64_t v106 = v69;
  *(void *)&long long v107 = v67;
  *((void *)&v107 + 1) = &type metadata for ContextMenuView;
  *(void *)&long long v108 = v65;
  *((void *)&v108 + 1) = OpaqueTypeConformance2;
  long long v109 = v76;
  swift_getOpaqueTypeConformance2();
  sub_25F743B64();
  uint64_t v70 = v94;
  uint64_t v71 = (uint64_t)v95;
  sub_25F78BB00();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v68, v70);
  sub_25F78B570();
  uint64_t result = sub_25F78B560();
  if (__OFADD__(v104, 1))
  {
    __break(1u);
  }
  else
  {
    *(void *)&long long v107 = v104 + 1;
    sub_25F78B550();
    sub_25F78B560();
    sub_25F78B590();
    uint64_t v73 = v78;
    uint64_t v74 = (uint64_t)v79;
    sub_25F78B300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25F73D748(v71, &qword_26A7BCAD0);
    uint64_t v75 = v102;
    sub_25F73D51C(v74, v102, &qword_26A7BCAD0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v77 + 56))(v75, 0, 1, v73);
  }
  return result;
}

uint64_t sub_25F7813C0()
{
  uint64_t v0 = sub_25F78BF90();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78BF80();
  sub_25F77DAA4((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25F7814A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  type metadata accessor for TouchHoldView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BCA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9F8);
  sub_25F78BCA0();
  *(_OWORD *)a3 = v7;
  *(unsigned char *)(a3 + 16) = v8;
  *(_OWORD *)(a3 + 24) = v7;
  *(void *)(a3 + 40) = v8;
  *(void *)(a3 + 48) = v9;
  *(void *)(a3 + 56) = a1;
  *(void *)(a3 + 64) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F781594@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v43 = a5;
  uint64_t v36 = a4;
  uint64_t v44 = a2;
  uint64_t v41 = a1;
  v34[1] = a6;
  uint64_t v8 = sub_25F78B580();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v42 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25F78B020();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v40 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25F78BF90();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v39 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TouchHoldView();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v37 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25F78B340();
  uint64_t v35 = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  MEMORY[0x270FA5388](v18);
  v34[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCAE8);
  MEMORY[0x270FA5388](v34[0]);
  uint64_t v22 = (char *)v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v18);
  sub_25F7842B8(a4, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v23 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v24 = *(unsigned __int8 *)(v15 + 80);
  unint64_t v25 = (v20 + v24 + v23) & ~v24;
  uint64_t v26 = swift_allocObject();
  unint64_t v27 = v26 + v23;
  uint64_t v28 = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v27, (char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v35);
  sub_25F783954((uint64_t)v17, v28 + v25, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  sub_25F7842B8(v36, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  uint64_t v29 = swift_allocObject();
  sub_25F783954((uint64_t)v17, v29 + ((v24 + 16) & ~v24), (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  uint64_t v30 = KeyPath;
  uint64_t v47 = KeyPath;
  char v48 = 0;
  uint64_t v49 = v41;
  uint64_t v50 = v44;
  long long v51 = sub_25F784914;
  uint64_t v52 = v28;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v55 = sub_25F784BCC;
  uint64_t v56 = v29;
  swift_bridgeObjectRetain();
  sub_25F78BF80();
  sub_25F78B010();
  uint64_t v45 = sub_25F78BFE0();
  uint64_t v46 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB08);
  sub_25F78462C(&qword_26A7BCB00, &qword_26A7BCB08, (void (*)(void))sub_25F74F9D8);
  sub_25F743B64();
  uint64_t v41 = v22;
  sub_25F78BB00();
  swift_bridgeObjectRelease();
  sub_25F743A74(v30, 0);
  swift_bridgeObjectRelease();
  sub_25F74376C((uint64_t)sub_25F784914);
  sub_25F74376C(0);
  sub_25F74376C(0);
  sub_25F74376C((uint64_t)sub_25F784BCC);
  sub_25F78B570();
  uint64_t result = sub_25F78B560();
  if (__OFADD__(v43, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v47 = v43 + 1;
    sub_25F78B550();
    sub_25F78B560();
    sub_25F78B590();
    uint64_t v33 = (uint64_t)v41;
    sub_25F78B300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_25F73D748(v33, &qword_26A7BCAE8);
  }
  return result;
}

uint64_t sub_25F781B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TouchHoldView();
  uint64_t v4 = v3 - 8;
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (uint64_t)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC2E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB9D8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25F78BF90();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v32 = 0x7267206F746F6870;
  *((void *)&v32 + 1) = 0xEA00000000006469;
  sub_25F78B330();
  char v16 = *(unsigned char *)(a2 + *(int *)(v4 + 28) + 8);
  uint64_t v17 = swift_retain();
  sub_25F76A324(v17, v16);
  swift_release();
  sub_25F78BF80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  sub_25F763E6C((uint64_t)v15, 0, (uint64_t)v11);
  swift_release();
  sub_25F73D748((uint64_t)v11, &qword_26A7BB9D8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v18 = sub_25F78C170();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  uint64_t v19 = a2;
  uint64_t v20 = a2;
  uint64_t v21 = v29;
  sub_25F7842B8(v20, v29, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  sub_25F78C140();
  uint64_t v22 = sub_25F78C130();
  unint64_t v23 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8F500];
  *(void *)(v24 + 16) = v22;
  *(void *)(v24 + 24) = v25;
  sub_25F783954(v21, v24 + v23, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  uint64_t v26 = sub_25F77D6A4((uint64_t)v8, (uint64_t)&unk_26A7BCB18, v24);
  long long v32 = *(_OWORD *)(v19 + *(int *)(v4 + 52));
  uint64_t v31 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC708);
  return sub_25F78BC90();
}

uint64_t sub_25F781F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  uint64_t v5 = sub_25F78C350();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  sub_25F78C140();
  v4[8] = sub_25F78C130();
  uint64_t v7 = sub_25F78C120();
  v4[9] = v7;
  v4[10] = v6;
  return MEMORY[0x270FA2498](sub_25F78202C, v7, v6);
}

uint64_t sub_25F78202C()
{
  sub_25F78C340();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_26A7BBD10 + dword_26A7BBD10);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25F7820F4;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_25F7820F4()
{
  uint64_t v3 = (void *)*v1;
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[7];
  uint64_t v5 = v2[6];
  uint64_t v6 = v2[5];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    uint64_t v9 = sub_25F78564C;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    uint64_t v9 = sub_25F782288;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_25F782288()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v2 = (char *)(v1 + *(int *)(type metadata accessor for TouchHoldView() + 28));
  char v3 = *v2;
  uint64_t v4 = *((void *)v2 + 1);
  *(unsigned char *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v4;
  *(unsigned char *)(v0 + 96) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E0);
  sub_25F78BC90();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_25F782340(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TouchHoldView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC708);
  sub_25F78BC80();
  if (v6)
  {
    sub_25F78C180();
    swift_release();
  }
  char v3 = *(unsigned char *)(a1 + *(int *)(v2 + 20) + 8);
  uint64_t v4 = swift_retain();
  sub_25F76A324(v4, v3);
  swift_release();
  sub_25F763334(1, 0, 1);
  return swift_release();
}

uint64_t sub_25F782418(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = sub_25F78B730();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB990);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8A0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  char v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v38 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v38 - v20;
  uint64_t v38 = a1;
  sub_25F76AB88((uint64_t)&v38 - v20);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v19, *MEMORY[0x263F19F00], v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  uint64_t v22 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_25F73D580((uint64_t)v21, (uint64_t)v12, &qword_26A7BB8A0);
  sub_25F73D580((uint64_t)v19, v22, &qword_26A7BB8A0);
  unint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v23((uint64_t)v12, 1, v5) == 1)
  {
    sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
    if (v23(v22, 1, v5) == 1)
    {
      sub_25F73D748((uint64_t)v12, &qword_26A7BB8A0);
      uint64_t v24 = v38;
LABEL_8:
      double v25 = *(double *)(v24 + *(int *)(type metadata accessor for TouchHoldView() + 48)) * 0.5;
      goto LABEL_10;
    }
  }
  else
  {
    sub_25F73D580((uint64_t)v12, (uint64_t)v16, &qword_26A7BB8A0);
    if (v23(v22, 1, v5) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v22, v5);
      sub_25F783F08(&qword_26A7BB998, MEMORY[0x263F19F18]);
      char v26 = sub_25F78BF70();
      unint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
      v27(v8, v5);
      sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
      sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
      v27(v16, v5);
      sub_25F73D748((uint64_t)v12, &qword_26A7BB8A0);
      uint64_t v24 = v38;
      if ((v26 & 1) == 0)
      {
        double v25 = 373.0;
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    sub_25F73D748((uint64_t)v19, &qword_26A7BB8A0);
    sub_25F73D748((uint64_t)v21, &qword_26A7BB8A0);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
  }
  sub_25F73D748((uint64_t)v12, &qword_26A7BB990);
  double v25 = 373.0;
  uint64_t v24 = v38;
LABEL_10:
  double v28 = v25 + a3 * -0.5;
  uint64_t v29 = type metadata accessor for TouchHoldView();
  uint64_t v30 = (uint64_t *)(v24 + *(int *)(v29 + 40));
  uint64_t v31 = *v30;
  uint64_t v32 = v30[1];
  double v39 = v28;
  uint64_t v40 = v31;
  uint64_t v41 = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB8E8);
  sub_25F78BC90();
  LOBYTE(v29) = *(unsigned char *)(v24 + *(int *)(v29 + 20) + 8);
  uint64_t v33 = swift_retain();
  uint64_t v34 = sub_25F76A324(v33, v29);
  swift_release();
  uint64_t v40 = v31;
  uint64_t v41 = v32;
  sub_25F78BC80();
  *(double *)(v34 + 64) = v39;
  swift_release();
  uint64_t v35 = swift_retain();
  uint64_t v36 = sub_25F76A324(v35, v29);
  swift_release();
  uint64_t v40 = v31;
  uint64_t v41 = v32;
  sub_25F78BC80();
  *(double *)(v36 + 56) = v39;
  return swift_release();
}

void sub_25F782924(void *a1@<X8>)
{
  type metadata accessor for TouchHoldView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BC9F8);
  sub_25F78BC80();
  uint64_t v2 = (void *)sub_25F78BFA0();
  id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

  uint64_t v4 = (void *)sub_25F78BFA0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v4, v3, 0);

  *a1 = v5;
}

uint64_t sub_25F782A3C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + *(int *)(type metadata accessor for TouchHoldView() + 20) + 8);
  uint64_t v2 = swift_retain();
  uint64_t v3 = sub_25F76A324(v2, v1);
  swift_release();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 1;
  return swift_release();
}

uint64_t sub_25F782ABC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_25F7842B8(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_25F783954((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for TouchHoldView);
  *a2 = sub_25F782BD4;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_25F782BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F77DD18(a1, v6, a2);
}

uint64_t sub_25F782C54@<X0>(uint64_t a1@<X8>)
{
  return sub_25F77E2BC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_25F782C5C()
{
  unint64_t result = qword_26A7BC9A0;
  if (!qword_26A7BC9A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BC978);
    sub_25F73D9A4(&qword_26A7BC9A8, &qword_26A7BC970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BC9A0);
  }
  return result;
}

uint64_t sub_25F782D00()
{
  return sub_25F784BE4(sub_25F782A3C);
}

uint64_t sub_25F782D18@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  double v28 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB40);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v27 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = swift_allocObject();
  long long v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v16 + 64) = v17;
  *(void *)(v16 + 80) = *(void *)(v2 + 64);
  long long v18 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v18;
  sub_25F78552C(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB48);
  sub_25F73D9A4(&qword_26A7BCB50, &qword_26A7BCB48);
  sub_25F78BCD0();
  uint64_t v19 = swift_allocObject();
  long long v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v19 + 64) = v20;
  *(void *)(v19 + 80) = *(void *)(v2 + 64);
  long long v21 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v19 + 32) = v21;
  sub_25F78552C(v2);
  sub_25F78BCD0();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v22(v10, v15, v3);
  v22(v7, v13, v3);
  unint64_t v23 = v28;
  v22(v28, v10, v3);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB58);
  v22(&v23[*(int *)(v24 + 48)], v7, v3);
  double v25 = *(void (**)(char *, uint64_t))(v4 + 8);
  v25(v13, v3);
  v25(v15, v3);
  v25(v7, v3);
  return ((uint64_t (*)(char *, uint64_t))v25)(v10, v3);
}

void sub_25F78303C()
{
  id v0 = objc_msgSend(self, sel_generalPasteboard);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_25F78BFA0();
  id v2 = objc_msgSend(self, sel_bundleWithIdentifier_, v1);

  uint64_t v3 = (void *)sub_25F78BFA0();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v3, v2, 0);

  objc_msgSend(v0, sel_setImage_, v4);
}

double sub_25F78316C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25F783524((void (*)(long long *__return_ptr))sub_25F783184, a1).n128_u64[0];
  return result;
}

uint64_t sub_25F783184@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25F78B020();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25F78AF40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78BF90();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_25F78AF50();
  MEMORY[0x270FA5388](v8 - 8);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v10 = sub_25F78BA10();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t v17 = sub_25F78BC20();
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = v17;
  sub_25F745E70(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_25F745E0C(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F783428(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v13 = v3;
  *(void *)&long long v10 = v3;
  *((void *)&v10 + 1) = v2;
  LOBYTE(v11) = v4;
  sub_25F73CE14((uint64_t)&v13);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BB9A0);
  MEMORY[0x2611FE0A0](v9);
  *(void *)&long long v10 = v3;
  *((void *)&v10 + 1) = v2;
  LOBYTE(v11) = v4;
  BOOL v12 = (v9[0] & 1) == 0;
  sub_25F78BCF0();
  sub_25F74F4F4((uint64_t)&v13);
  swift_release();
  uint64_t v6 = a1[7];
  uint64_t v5 = a1[8];
  long long v7 = *(_OWORD *)(a1 + 5);
  long long v10 = *(_OWORD *)(a1 + 3);
  long long v11 = v7;
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB60);
  return sub_25F78BCF0();
}

double sub_25F78350C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25F783524((void (*)(long long *__return_ptr))sub_25F783590, a1).n128_u64[0];
  return result;
}

__n128 sub_25F783524@<Q0>(void (*a1)(long long *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25F78B540();
  a1(&v8);
  char v5 = v9;
  __n128 result = v10;
  long long v7 = v8;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(_OWORD *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 40) = v5;
  *(__n128 *)(a2 + 48) = result;
  return result;
}

uint64_t sub_25F783590@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25F78B020();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25F78AF40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78BF90();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_25F78AF50();
  MEMORY[0x270FA5388](v8 - 8);
  sub_25F78BF80();
  if (qword_26A7BB640 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)qword_26A7BE398);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_25F78B010();
  sub_25F78AF60();
  uint64_t v10 = sub_25F78BA10();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t v17 = sub_25F78BC20();
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = v17;
  sub_25F745E70(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_25F745E0C(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F783838@<X0>(char *a1@<X8>)
{
  return sub_25F782D18(a1);
}

void sub_25F783888(void *a1@<X8>)
{
  type metadata accessor for TouchHoldView();
  sub_25F782924(a1);
}

unint64_t sub_25F7838F8()
{
  unint64_t result = qword_26A7BCCB0;
  if (!qword_26A7BCCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCCB0);
  }
  return result;
}

uint64_t sub_25F783954(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F7839C0()
{
  return sub_25F7839DC();
}

uint64_t sub_25F7839DC()
{
  return sub_25F7813C0();
}

uint64_t sub_25F783A54()
{
  type metadata accessor for TouchHoldView();
  return sub_25F77FAD0();
}

uint64_t sub_25F783AC4@<X0>(uint64_t a1@<X8>)
{
  return sub_25F77FBB4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_25F783ACC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25F783B38()
{
  unint64_t result = qword_26A7BCA28;
  if (!qword_26A7BCA28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCA30);
    sub_25F783BE4();
    sub_25F783F08(&qword_26A7BBE50, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCA28);
  }
  return result;
}

unint64_t sub_25F783BE4()
{
  unint64_t result = qword_26A7BCA38;
  if (!qword_26A7BCA38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCA40);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCA48);
    sub_25F783CB8();
    swift_getOpaqueTypeConformance2();
    sub_25F73D9A4(&qword_26A7BCA88, &qword_26A7BCA90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCA38);
  }
  return result;
}

unint64_t sub_25F783CB8()
{
  unint64_t result = qword_26A7BCA50;
  if (!qword_26A7BCA50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCA48);
    sub_25F783D58();
    sub_25F73D9A4(&qword_26A7BBCD8, &qword_26A7BBCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCA50);
  }
  return result;
}

unint64_t sub_25F783D58()
{
  unint64_t result = qword_26A7BCA58;
  if (!qword_26A7BCA58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCA60);
    sub_25F78462C(&qword_26A7BCA68, &qword_26A7BCA70, (void (*)(void))sub_25F783E24);
    sub_25F73D9A4(&qword_26A7BBB78, &qword_26A7BBB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCA58);
  }
  return result;
}

uint64_t sub_25F783E24()
{
  return sub_25F78462C(&qword_26A7BCA78, &qword_26A7BCA80, (void (*)(void))sub_25F74EE04);
}

uint64_t sub_25F783E58(double a1, double a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F782418(v6, a1, a2);
}

uint64_t sub_25F783ED0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F783F08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F783F50()
{
  uint64_t v1 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v11 = *(void *)(v1 + 64);
  uint64_t v12 = sub_25F78B340();
  uint64_t v4 = *(void *)(v12 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25F78B730();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v3, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v3, v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = (v3 + v11 + v5) & ~v5;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v9, v12);
  return MEMORY[0x270FA0238](v0, v9 + v6, v2 | v5 | 7);
}

uint64_t sub_25F7841CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_25F78B340() - 8);
  uint64_t v9 = v2 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return sub_25F77FE2C(a1, v2 + v6, v9, a2);
}

uint64_t sub_25F7842B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F784320(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25F784384()
{
  return sub_25F7839DC();
}

unint64_t sub_25F7843A4()
{
  unint64_t result = qword_26A7BCAD8;
  if (!qword_26A7BCAD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCAB8);
    sub_25F784444();
    sub_25F73D9A4(&qword_26A7BBCD8, &qword_26A7BBCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCAD8);
  }
  return result;
}

unint64_t sub_25F784444()
{
  unint64_t result = qword_26A7BCAE0;
  if (!qword_26A7BCAE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCAB0);
    sub_25F783E24();
    sub_25F73D9A4(&qword_26A7BBB78, &qword_26A7BBB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCAE0);
  }
  return result;
}

uint64_t sub_25F7844E4@<X0>(uint64_t a1@<X8>)
{
  return sub_25F7814A8(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t sub_25F7844F0@<X0>(uint64_t a1@<X8>)
{
  return sub_25F781594(*(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), a1);
}

unint64_t sub_25F784500()
{
  unint64_t result = qword_26A7BCAF0;
  if (!qword_26A7BCAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCAF0);
  }
  return result;
}

unint64_t sub_25F784554()
{
  unint64_t result = qword_26A7BCAF8;
  if (!qword_26A7BCAF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCAE8);
    sub_25F78462C(&qword_26A7BCB00, &qword_26A7BCB08, (void (*)(void))sub_25F74F9D8);
    sub_25F783F08(&qword_26A7BBE50, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCAF8);
  }
  return result;
}

uint64_t sub_25F78462C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_25F7846A8()
{
  uint64_t v1 = sub_25F78B340();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_25F78B730();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v8, v10);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_25F784914()
{
  uint64_t v1 = *(void *)(sub_25F78B340() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25F781B6C(v0 + v2, v5);
}

uint64_t objectdestroyTm_6()
{
  uint64_t v1 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F784BCC()
{
  return sub_25F784BE4(sub_25F782340);
}

uint64_t sub_25F784BE4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25F784C58()
{
  uint64_t v1 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB898);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25F78B730();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25F784E48(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for TouchHoldView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_25F74E910;
  return sub_25F781F38(a1, v5, v6, v7);
}

uint64_t sub_25F784F34(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25F785010;
  return v6(a1);
}

uint64_t sub_25F785010()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25F785108(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25F74E910;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A7BCB20 + dword_26A7BCB20);
  return v6(a1, v4);
}

uint64_t destroy for ContextMenuView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ContextMenuView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContextMenuView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ContextMenuView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContextMenuView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextMenuView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextMenuView()
{
  return &type metadata for ContextMenuView;
}

uint64_t sub_25F7854C8()
{
  return sub_25F73D9A4(&qword_26A7BCB30, &qword_26A7BCB38);
}

uint64_t sub_25F785504()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_25F785524()
{
}

uint64_t sub_25F78552C(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroy_59Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_25F785604()
{
  return sub_25F783428((uint64_t *)(v0 + 16));
}

uint64_t sub_25F78560C()
{
  return sub_25F73D9A4(&qword_26A7BCB68, &qword_26A7BCB70);
}

void sub_25F785650()
{
}

uint64_t sub_25F785680()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for TryItLaunchAnalyticsEvent()
{
  return self;
}

uint64_t sub_25F7856FC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE000000000000000;
  uint64_t v3 = a1;
  uint64_t v4 = 0;
  switch(v3)
  {
    case 1:
      uint64_t v4 = 0x646E616863756F74;
      unint64_t v2 = 0xEC000000646C6F68;
      break;
    case 2:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v4 = 1734439524;
      break;
    case 3:
      uint64_t v4 = 0x7A6F7468636E6970;
      unint64_t v2 = 0xEB000000006D6F6FLL;
      break;
    case 4:
      uint64_t v4 = 0x65747463656C6573;
      unint64_t v2 = 0xEA00000000007478;
      break;
    case 5:
      uint64_t v4 = 0x6F6D7463656C6573;
      unint64_t v2 = 0xEE00747865746572;
      break;
    case 6:
      break;
    default:
      unint64_t v2 = 0xE300000000000000;
      uint64_t v4 = 7364980;
      break;
  }
  unint64_t v5 = 0xE000000000000000;
  uint64_t v6 = 0;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xEC000000646C6F68;
      if (v4 == 0x646E616863756F74) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v5 = 0xE400000000000000;
      if (v4 != 1734439524) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v5 = 0xEB000000006D6F6FLL;
      if (v4 != 0x7A6F7468636E6970) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      uint64_t v6 = 0x65747463656C6573;
      unint64_t v5 = 0xEA00000000007478;
      goto LABEL_18;
    case 5:
      unint64_t v5 = 0xEE00747865746572;
      if (v4 != 0x6F6D7463656C6573) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 6:
LABEL_18:
      if (v4 == v6) {
        goto LABEL_19;
      }
      goto LABEL_22;
    default:
      unint64_t v5 = 0xE300000000000000;
      if (v4 != 7364980) {
        goto LABEL_22;
      }
LABEL_19:
      if (v2 == v5) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_25F78C410();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25F785954()
{
  sub_25F78C020();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F785A74()
{
  return sub_25F78C470();
}

uint64_t sub_25F785BA4(unsigned __int8 a1)
{
  uint64_t v1 = a1;
  uint64_t result = 0;
  switch(v1)
  {
    case 1:
      uint64_t result = 0x646E616863756F74;
      break;
    case 2:
      uint64_t result = 1734439524;
      break;
    case 3:
      uint64_t result = 0x7A6F7468636E6970;
      break;
    case 4:
      uint64_t result = 0x65747463656C6573;
      break;
    case 5:
      uint64_t result = 0x6F6D7463656C6573;
      break;
    case 6:
      return result;
    default:
      uint64_t result = 7364980;
      break;
  }
  return result;
}

uint64_t TryItAttemptAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:error:success:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v17 = swift_allocObject();
  if (a10) {
    uint64_t v18 = a9;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)(v17 + 96) = v18;
  *(void *)(v17 + 104) = a10;
  *(unsigned char *)(v17 + 112) = a11;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x800000025F78F340, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_25F785D50(unsigned __int8 *a1, char *a2)
{
  return sub_25F7856FC(*a1, *a2);
}

uint64_t sub_25F785D5C()
{
  return sub_25F785A74();
}

uint64_t sub_25F785D68()
{
  return sub_25F785954();
}

uint64_t sub_25F785D70()
{
  return sub_25F785A74();
}

uint64_t sub_25F785D78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25F7865E4();
  *a1 = result;
  return result;
}

uint64_t sub_25F785DA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F785BA4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t TryItAttemptAnalyticsEvent.init(tipId:correlationId:collectionId:lessonId:error:success:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (!a10) {
    a9 = 0;
  }
  *(void *)(v11 + 96) = a9;
  *(void *)(v11 + 104) = a10;
  *(unsigned char *)(v11 + 112) = a11;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x800000025F78F340, a1, a2, a3, a4, a5, a6, a7, a8);
}

unint64_t sub_25F785E2C()
{
  unint64_t v0 = sub_25F7577D8();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_25F78BFA0();
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v1, 0x726F727265, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_25F78C110();
  char v4 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v3, 0x73736563637573, 0xE700000000000000, v4);
  swift_bridgeObjectRelease();
  sub_25F785F74();
  uint64_t v5 = sub_25F78C110();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v5, 0x72745F7473726966, 0xE900000000000079, v6);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25F785F74()
{
  if (*(void *)(v0 + 88))
  {
    uint64_t v1 = self;
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_25F78BFA0();
    id v3 = objc_msgSend(v1, sel_persistedObjectForKey_, v2);

    if (!v3)
    {
      memset(v8, 0, sizeof(v8));
      sub_25F786398((uint64_t)v8);
      uint64_t v4 = 1;
      uint64_t v5 = (void *)sub_25F78C110();
      char v6 = (void *)sub_25F78BFA0();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_persistObject_forKey_, v5, v6);

      return v4;
    }
    sub_25F78C2D0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    sub_25F786398((uint64_t)v8);
  }
  return 0;
}

void TryItAttemptAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
}

void TryItAttemptAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
}

uint64_t sub_25F7860EC()
{
  return swift_bridgeObjectRelease();
}

uint64_t TryItAttemptAnalyticsEvent.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TryItAttemptAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 113, 7);
}

uint64_t type metadata accessor for TryItAttemptAnalyticsEvent()
{
  return self;
}

uint64_t method lookup function for TryItAttemptAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TryItAttemptAnalyticsEvent);
}

uint64_t dispatch thunk of TryItAttemptAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:error:success:)()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

void *initializeBufferWithCopyOfBuffer for TryItAttemptAnalyticsEvent.ErrorState(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TryItAttemptAnalyticsEvent.ErrorState()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for TryItAttemptAnalyticsEvent.ErrorState(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for TryItAttemptAnalyticsEvent.ErrorState(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TryItAttemptAnalyticsEvent.ErrorState(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TryItAttemptAnalyticsEvent.ErrorState(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25F786350(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25F786368(void *result, int a2)
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

ValueMetadata *type metadata accessor for TryItAttemptAnalyticsEvent.ErrorState()
{
  return &type metadata for TryItAttemptAnalyticsEvent.ErrorState;
}

uint64_t sub_25F786398(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for TryItLessonStepId(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TryItLessonStepId(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F786554);
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

ValueMetadata *type metadata accessor for TryItLessonStepId()
{
  return &type metadata for TryItLessonStepId;
}

unint64_t sub_25F786590()
{
  unint64_t result = qword_26A7BCB80;
  if (!qword_26A7BCB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCB80);
  }
  return result;
}

uint64_t sub_25F7865E4()
{
  unint64_t v0 = sub_25F78C3E0();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

uint64_t sub_25F786634(uint64_t a1)
{
  uint64_t v3 = sub_25F78BEC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F78BF00();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(void *)(v1 + 16);
  aBlock[4] = sub_25F786C00;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F770630;
  aBlock[3] = &block_descriptor_4;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  sub_25F78BEE0();
  v13[1] = MEMORY[0x263F8EE78];
  sub_25F787364((unint64_t *)&unk_26A7BB9C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB798);
  sub_25F7873AC(&qword_26A7BB9D0, &qword_26A7BB798);
  sub_25F78C2E0();
  MEMORY[0x2611FE5E0](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_25F7868C8(uint64_t a1)
{
  if (qword_26A7BB698 != -1) {
    swift_once();
  }
  int v2 = (id)qword_26A7BCBB0;
  sub_25F78C300();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0xD000000000000018;
  unint64_t v10 = 0x800000025F78FE30;
  swift_bridgeObjectRetain();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_25F78C040();
  (*(void (**)(uint64_t))(*(void *)a1 + 248))(v3);
  sub_25F73D7A4(0, &qword_26A7BCB88);
  sub_25F78BF60();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v4 = sub_25F78C1A0();
  if (os_log_type_enabled(v2, v4))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t aBlock = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    sub_25F789928(0xD000000000000018, 0x800000025F78FE30, &aBlock);
    sub_25F78C2A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25F739000, v2, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v6, -1, -1);
    MEMORY[0x2611FEDE0](v5, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_25F78BFA0();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25F787340;
  uint64_t v14 = a1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v10 = 1107296256;
  uint64_t v11 = sub_25F786C20;
  uint64_t v12 = &block_descriptor_5;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);
}

void sub_25F786C00()
{
  sub_25F7868C8(v0);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

id sub_25F786C20(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_25F73D7A4(0, &qword_26A7BCB88);
    os_log_type_t v4 = (void *)sub_25F78BF40();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v4 = 0;
  }
  return v4;
}

uint64_t TryItAnalyticsManager.deinit()
{
  return v0;
}

uint64_t TryItAnalyticsManager.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for TryItAnalyticsManager()
{
  return self;
}

uint64_t method lookup function for TryItAnalyticsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TryItAnalyticsManager);
}

uint64_t dispatch thunk of TryItAnalyticsManager.log(event:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t destroy for TryItAnalyticsLessonKeys()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TryItAnalyticsLessonKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_WORD *)(a1 + 92) = *(_WORD *)(a2 + 92);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TryItAnalyticsLessonKeys(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(unsigned char *)(a1 + 90) = *(unsigned char *)(a2 + 90);
  *(unsigned char *)(a1 + 91) = *(unsigned char *)(a2 + 91);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(unsigned char *)(a1 + 93) = *(unsigned char *)(a2 + 93);
  return a1;
}

__n128 __swift_memcpy94_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 78) = *(_OWORD *)(a2 + 78);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for TryItAnalyticsLessonKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(unsigned char *)(a1 + 90) = *(unsigned char *)(a2 + 90);
  *(unsigned char *)(a1 + 91) = *(unsigned char *)(a2 + 91);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(unsigned char *)(a1 + 93) = *(unsigned char *)(a2 + 93);
  return a1;
}

uint64_t getEnumTagSinglePayload for TryItAnalyticsLessonKeys(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 94)) {
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

uint64_t storeEnumTagSinglePayload for TryItAnalyticsLessonKeys(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 92) = 0;
    *(_DWORD *)(result + 88) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 94) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 94) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TryItAnalyticsLessonKeys()
{
  return &type metadata for TryItAnalyticsLessonKeys;
}

uint64_t sub_25F7870E8()
{
  uint64_t v0 = sub_25F78C200();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25F78C1E0();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_25F78BF00();
  MEMORY[0x270FA5388](v5 - 8);
  sub_25F73D7A4(0, (unint64_t *)&qword_26A7BB790);
  sub_25F78BEF0();
  v9[1] = MEMORY[0x263F8EE78];
  sub_25F787364(&qword_26A7BCB90, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCB98);
  sub_25F7873AC(&qword_26A7BCBA0, &qword_26A7BCB98);
  sub_25F78C2E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t v6 = sub_25F78C230();
  uint64_t v7 = v9[0];
  *(void *)(v9[0] + 16) = v6;
  return v7;
}

uint64_t sub_25F787340()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t sub_25F787364(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F7873AC(unint64_t *a1, uint64_t *a2)
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

Swift::Void __swiftcall TryItLog.log(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall TryItLog.debug(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall TryItLog.info(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall TryItLog.error(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall TryItLog.fault(_:)(Swift::String a1)
{
}

uint64_t sub_25F78747C(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = *v3;
  os_log_type_t v7 = a3();
  uint64_t result = os_log_type_enabled(v6, v7);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_25F789928(a1, a2, &v11);
    sub_25F78C2A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25F739000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v10, -1, -1);
    return MEMORY[0x2611FEDE0](v9, -1, -1);
  }
  return result;
}

uint64_t sub_25F7875C4(uint64_t a1)
{
  return sub_25F78762C(a1, 0x746C7561666544, 0xE700000000000000, &qword_26A7BCBA8);
}

id static TryItLog.default.getter@<X0>(void **a1@<X8>)
{
  return sub_25F7876B8(&qword_26A7BB690, (void **)&qword_26A7BCBA8, a1);
}

uint64_t sub_25F787608(uint64_t a1)
{
  return sub_25F78762C(a1, 0x636974796C616E41, 0xE900000000000073, &qword_26A7BCBB0);
}

uint64_t sub_25F78762C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_25F78771C();
  uint64_t result = sub_25F78C280();
  *a4 = result;
  return result;
}

id static TryItLog.analytics.getter@<X0>(void **a1@<X8>)
{
  return sub_25F7876B8(&qword_26A7BB698, (void **)&qword_26A7BCBB0, a1);
}

id sub_25F7876B8@<X0>(void *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = *a2;
  *a3 = *a2;
  return v5;
}

ValueMetadata *type metadata accessor for TryItLog()
{
  return &type metadata for TryItLog;
}

unint64_t sub_25F78771C()
{
  unint64_t result = qword_26A7BCBB8;
  if (!qword_26A7BCBB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A7BCBB8);
  }
  return result;
}

id sub_25F78775C(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_addSublayer_, a2);
  return objc_msgSend(a1, sel_setNeedsDisplay);
}

void sub_25F7877A8()
{
  qword_26A7BCBC0 = 0x6E6F7373656CLL;
  *(void *)algn_26A7BCBC8 = 0xE600000000000000;
}

uint64_t TryItLauncher.deinit()
{
  return v0;
}

uint64_t TryItLauncher.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for TryItLauncher()
{
  return self;
}

uint64_t method lookup function for TryItLauncher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TryItLauncher);
}

void *sub_25F78781C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBE0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25F7888BC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25F78792C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCC00);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25F7888BC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25F787A3C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBF0);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25F787AA4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25F78C0A0();
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
    uint64_t v5 = MEMORY[0x2611FE430](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_25F787B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25F78C0B0();
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
  uint64_t v5 = sub_25F787E84();
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
    unint64_t v7 = (unsigned __int8 *)sub_25F78C320();
  }
LABEL_7:
  uint64_t v11 = sub_25F787C08(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_25F787C08(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (i = result + 1; ; ++i)
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

uint64_t sub_25F787E84()
{
  unint64_t v0 = sub_25F78C0C0();
  uint64_t v4 = sub_25F787F04(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25F787F04(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25F78805C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25F787A3C(v9, 0);
      unint64_t v12 = sub_25F78815C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25F78C320();
LABEL_4:
        JUMPOUT(0x2611FE3D0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611FE3D0](v11 + 4, v11[2]);
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
    return MEMORY[0x2611FE3D0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25F78805C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25F787AA4(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25F787AA4(v6, v5, v4);
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

unint64_t sub_25F78815C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void v9[2] = a6;
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
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_25F787AA4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_25F78C090();
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
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_25F78C320();
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
    unint64_t result = sub_25F787AA4(v12, a6, a7);
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
    unint64_t v12 = sub_25F78C060();
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

uint64_t sub_25F788370(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F78851C(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25F788390(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F78867C(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_25F7883B0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BB748);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25F78C3C0();
  __break(1u);
  return result;
}

uint64_t sub_25F78851C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBE8);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25F78C3C0();
  __break(1u);
  return result;
}

uint64_t sub_25F78867C(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBF8);
  uint64_t v10 = *(void *)(sub_25F78AEE0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
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
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25F78AEE0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  char v19 = (char *)a4 + v17;
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_25F78C3C0();
  __break(1u);
  return result;
}

char *sub_25F7888BC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25F78C3C0();
  __break(1u);
  return result;
}

void *sub_25F7889A8(uint64_t a1)
{
  uint64_t v2 = sub_25F78AEE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v88 = v2;
  uint64_t v89 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v92 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v82 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBD0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBD8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25F78AF10();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78AF00();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_25F73D748((uint64_t)v13, &qword_26A7BCBD8);
    goto LABEL_94;
  }
  uint64_t v85 = v10;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  uint64_t v86 = v17;
  uint64_t v18 = sub_25F78AEF0();
  if (!v18)
  {
LABEL_93:
    (*(void (**)(char *, uint64_t))(v15 + 8))(v86, v14);
LABEL_94:
    if (qword_26A7BB690 != -1) {
      goto LABEL_109;
    }
    goto LABEL_95;
  }
  uint64_t v19 = v18;
  uint64_t v20 = MEMORY[0x263F8EE78];
  v95._uint64_t countAndFlagsBits = MEMORY[0x263F8EE78];
  uint64_t v91 = *(char **)(v18 + 16);
  uint64_t v83 = v15;
  uint64_t v84 = v14;
  if (!v91)
  {
    uint64_t v22 = v88;
LABEL_25:
    swift_bridgeObjectRelease();
    if (*(void *)(v20 + 16))
    {
      uint64_t v37 = v89;
      uint64_t v38 = (uint64_t)v85;
      (*(void (**)(char *, unint64_t, uint64_t))(v89 + 16))(v85, v20 + ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80)), v22);
      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = 1;
      uint64_t v37 = v89;
      uint64_t v38 = (uint64_t)v85;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(v38, v39, 1, v22);
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v38, 1, v22) == 1)
    {
      sub_25F73D748(v38, &qword_26A7BCBD0);
      goto LABEL_93;
    }
    uint64_t v40 = sub_25F78AED0();
    uint64_t v42 = v41;
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v22);
    if (!v42) {
      goto LABEL_93;
    }
    v95._uint64_t countAndFlagsBits = v40;
    v95._object = v42;
    uint64_t v93 = 44;
    unint64_t v94 = 0xE100000000000000;
    sub_25F743B64();
    uint64_t v43 = sub_25F78C2C0();
    swift_bridgeObjectRelease();
    uint64_t v44 = *(void *)(v43 + 16);
    if (!v44)
    {
      swift_bridgeObjectRelease();
      uint64_t v46 = (void *)MEMORY[0x263F8EE78];
LABEL_99:
      if (qword_26A7BB690 != -1) {
LABEL_112:
      }
        swift_once();
      v95._uint64_t countAndFlagsBits = 0;
      v95._object = (void *)0xE000000000000000;
      id v74 = (id)qword_26A7BCBA8;
      sub_25F78C300();
      swift_bridgeObjectRelease();
      v95._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
      v95._object = (void *)0x800000025F78FEC0;
      int64_t v75 = v46[2];
      uint64_t v76 = MEMORY[0x263F8EE78];
      if (v75)
      {
        uint64_t v93 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        sub_25F788370(0, v75, 0);
        uint64_t v77 = 0;
        uint64_t v76 = v93;
        unint64_t v78 = *(void *)(v93 + 16);
        do
        {
          uint64_t v79 = v46[v77 + 4];
          uint64_t v93 = v76;
          unint64_t v80 = *(void *)(v76 + 24);
          if (v78 >= v80 >> 1)
          {
            sub_25F788370(v80 > 1, v78 + 1, 1);
            uint64_t v76 = v93;
          }
          ++v77;
          *(void *)(v76 + 16) = v78 + 1;
          *(void *)(v76 + 8 * v78++ + 32) = v79;
        }
        while (v75 != v77);
        swift_bridgeObjectRelease();
      }
      MEMORY[0x2611FE4A0](v76, MEMORY[0x263F8D6C8]);
      sub_25F78C040();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Swift::String v81 = v95;
      v95._uint64_t countAndFlagsBits = (uint64_t)v74;
      TryItLog.debug(_:)(v81);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v83 + 8))(v86, v84);
      return v46;
    }
    unint64_t v45 = 0;
    uint64_t v91 = (char *)&v95._countAndFlagsBits + 2;
    uint64_t v92 = (char *)&v95._countAndFlagsBits + 3;
    uint64_t v46 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      if (v45 >= *(void *)(v43 + 16)) {
        goto LABEL_108;
      }
      uint64_t v47 = (uint64_t *)(v43 + 32 + 16 * v45);
      uint64_t v48 = *v47;
      unint64_t v49 = v47[1];
      uint64_t v50 = HIBYTE(v49) & 0xF;
      uint64_t v51 = v48 & 0xFFFFFFFFFFFFLL;
      if ((v49 & 0x2000000000000000) != 0 ? HIBYTE(v49) & 0xF : v48 & 0xFFFFFFFFFFFFLL) {
        break;
      }
LABEL_34:
      if (++v45 == v44)
      {
        swift_bridgeObjectRelease();
        goto LABEL_99;
      }
    }
    if ((v49 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v54 = (uint64_t)sub_25F787B20(v48, v49, 10);
      LOBYTE(v48) = v70;
      swift_bridgeObjectRelease();
      goto LABEL_69;
    }
    if ((v49 & 0x2000000000000000) == 0)
    {
      if ((v48 & 0x1000000000000000) != 0) {
        long long v53 = (unsigned __int8 *)((v49 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        long long v53 = (unsigned __int8 *)sub_25F78C320();
      }
      uint64_t v54 = (uint64_t)sub_25F787C08(v53, v51, 10);
      LOBYTE(v48) = v55 & 1;
LABEL_69:
      if ((v48 & 1) == 0 && (unint64_t)v54 < 6)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v46 = sub_25F78781C(0, v46[2] + 1, 1, v46);
        }
        unint64_t v61 = v46[2];
        unint64_t v60 = v46[3];
        if (v61 >= v60 >> 1) {
          uint64_t v46 = sub_25F78781C((void *)(v60 > 1), v61 + 1, 1, v46);
        }
        v46[2] = v61 + 1;
        v46[v61 + 4] = v54;
      }
      goto LABEL_34;
    }
    v95._uint64_t countAndFlagsBits = v48;
    v95._object = (void *)(v49 & 0xFFFFFFFFFFFFFFLL);
    if (v48 == 43)
    {
      if (!v50) {
        goto LABEL_111;
      }
      if (v50 == 1 || (BYTE1(v48) - 48) > 9u) {
        goto LABEL_66;
      }
      uint64_t v54 = (BYTE1(v48) - 48);
      if (v50 == 2) {
        goto LABEL_68;
      }
      if ((BYTE2(v48) - 48) <= 9u)
      {
        uint64_t v54 = 10 * (BYTE1(v48) - 48) + (BYTE2(v48) - 48);
        uint64_t v56 = v50 - 3;
        if (v56)
        {
          uint64_t v57 = v92;
          while (1)
          {
            unsigned int v58 = *v57 - 48;
            if (v58 > 9) {
              goto LABEL_66;
            }
            uint64_t v59 = 10 * v54;
            if ((unsigned __int128)(v54 * (__int128)10) >> 64 != (10 * v54) >> 63) {
              goto LABEL_66;
            }
            uint64_t v54 = v59 + v58;
            if (__OFADD__(v59, v58)) {
              goto LABEL_66;
            }
            LOBYTE(v48) = 0;
            ++v57;
            if (!--v56) {
              goto LABEL_69;
            }
          }
        }
        goto LABEL_68;
      }
    }
    else if (v48 == 45)
    {
      if (!v50)
      {
        __break(1u);
LABEL_111:
        __break(1u);
        goto LABEL_112;
      }
      if (v50 != 1 && (BYTE1(v48) - 48) <= 9u)
      {
        if (v50 == 2)
        {
          LOBYTE(v48) = 0;
          uint64_t v54 = -(uint64_t)(BYTE1(v48) - 48);
          goto LABEL_69;
        }
        if ((BYTE2(v48) - 48) <= 9u)
        {
          uint64_t v54 = -10 * (BYTE1(v48) - 48) - (BYTE2(v48) - 48);
          uint64_t v66 = v50 - 3;
          if (v66)
          {
            uint64_t v67 = v92;
            while (1)
            {
              unsigned int v68 = *v67 - 48;
              if (v68 > 9) {
                goto LABEL_66;
              }
              uint64_t v69 = 10 * v54;
              if ((unsigned __int128)(v54 * (__int128)10) >> 64 != (10 * v54) >> 63) {
                goto LABEL_66;
              }
              uint64_t v54 = v69 - v68;
              if (__OFSUB__(v69, v68)) {
                goto LABEL_66;
              }
              LOBYTE(v48) = 0;
              ++v67;
              if (!--v66) {
                goto LABEL_69;
              }
            }
          }
LABEL_68:
          LOBYTE(v48) = 0;
          goto LABEL_69;
        }
      }
    }
    else if (v50 && (v48 - 48) <= 9u)
    {
      uint64_t v54 = (v48 - 48);
      if (v50 == 1) {
        goto LABEL_68;
      }
      if ((BYTE1(v48) - 48) <= 9u)
      {
        uint64_t v54 = 10 * (v48 - 48) + (BYTE1(v48) - 48);
        uint64_t v62 = v50 - 2;
        if (v62)
        {
          uint64_t v63 = v91;
          while (1)
          {
            unsigned int v64 = *v63 - 48;
            if (v64 > 9) {
              goto LABEL_66;
            }
            uint64_t v65 = 10 * v54;
            if ((unsigned __int128)(v54 * (__int128)10) >> 64 != (10 * v54) >> 63) {
              goto LABEL_66;
            }
            uint64_t v54 = v65 + v64;
            if (__OFADD__(v65, v64)) {
              goto LABEL_66;
            }
            LOBYTE(v48) = 0;
            ++v63;
            if (!--v62) {
              goto LABEL_69;
            }
          }
        }
        goto LABEL_68;
      }
    }
LABEL_66:
    uint64_t v54 = 0;
    LOBYTE(v48) = 1;
    goto LABEL_69;
  }
  uint64_t v82 = a1;
  unint64_t v21 = 0;
  uint64_t v22 = v88;
  uint64_t v23 = v89;
  uint64_t v90 = v89 + 16;
  uint64_t v87 = (void (**)(char *, uint64_t))(v89 + 8);
  unsigned __int8 v24 = (void (**)(char *, char *, uint64_t))(v89 + 32);
  while (v21 < *(void *)(v19 + 16))
  {
    unint64_t v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v26 = *(void *)(v23 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v23 + 16))(v7, v19 + v25 + v26 * v21, v22);
    uint64_t v27 = sub_25F78AEC0();
    uint64_t v29 = v28;
    if (qword_26A7BB6A0 != -1) {
      swift_once();
    }
    if (v27 == qword_26A7BCBC0 && v29 == *(void *)algn_26A7BCBC8)
    {
      swift_bridgeObjectRelease();
LABEL_18:
      uint64_t v32 = *v24;
      (*v24)(v92, v7, v22);
      uint64_t countAndFlagsBits = v95._countAndFlagsBits;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25F788390(0, *(void *)(countAndFlagsBits + 16) + 1, 1);
        uint64_t countAndFlagsBits = v95._countAndFlagsBits;
      }
      unint64_t v35 = *(void *)(countAndFlagsBits + 16);
      unint64_t v34 = *(void *)(countAndFlagsBits + 24);
      if (v35 >= v34 >> 1)
      {
        sub_25F788390(v34 > 1, v35 + 1, 1);
        uint64_t countAndFlagsBits = v95._countAndFlagsBits;
      }
      *(void *)(countAndFlagsBits + 16) = v35 + 1;
      unint64_t v36 = countAndFlagsBits + v25 + v35 * v26;
      uint64_t v22 = v88;
      v32((char *)v36, v92, v88);
      v95._uint64_t countAndFlagsBits = countAndFlagsBits;
      uint64_t v23 = v89;
      goto LABEL_7;
    }
    char v31 = sub_25F78C410();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_18;
    }
    (*v87)(v7, v22);
LABEL_7:
    if (v91 == (char *)++v21)
    {
      uint64_t v20 = v95._countAndFlagsBits;
      uint64_t v15 = v83;
      uint64_t v14 = v84;
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_108:
  __break(1u);
LABEL_109:
  swift_once();
LABEL_95:
  v95._uint64_t countAndFlagsBits = 0;
  v95._object = (void *)0xE000000000000000;
  id v71 = (id)qword_26A7BCBA8;
  sub_25F78C300();
  swift_bridgeObjectRelease();
  v95._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
  v95._object = (void *)0x800000025F78FE90;
  sub_25F78AF70();
  sub_25F78C040();
  swift_bridgeObjectRelease();
  Swift::String v72 = v95;
  v95._uint64_t countAndFlagsBits = (uint64_t)v71;
  TryItLog.debug(_:)(v72);

  swift_bridgeObjectRelease();
  return (void *)MEMORY[0x263F8EE78];
}

double static CGFloat.flowerAssetCompactWidth.getter()
{
  return 80.0;
}

double static CGFloat.flowerAssetWidth.getter()
{
  return 120.0;
}

double static CGFloat.flowerAssetCompactHeight.getter()
{
  return 92.0;
}

double static CGFloat.flowerAssetHeight.getter()
{
  return 138.0;
}

double static CGFloat.horizontalButtonPadding.getter()
{
  return 12.0;
}

double static CGFloat.horizontalTextPadding.getter()
{
  return 20.0;
}

double static CGFloat.defaultHyphenationFactor.getter()
{
  return 0.2;
}

double static CGFloat.dragCellWidth.getter()
{
  return 353.0;
}

double static CGFloat.dragCellHeight.getter()
{
  return 110.0;
}

double static CGFloat.imageGridWidth.getter()
{
  return 333.0;
}

double static CGFloat.imageGridHeight.getter()
{
  return 333.0;
}

double static CGFloat.imageWidth.getter()
{
  return 103.0;
}

double static CGFloat.imageGridSpacing.getter()
{
  return 12.0;
}

double static CGFloat.preferredContentSizeHeight.getter()
{
  return 746.0;
}

double static CGFloat.practiceAgainMinimumCompactBottomPadding.getter()
{
  return 50.0;
}

double static CGFloat.practiceAgainMinimumBottomPadding.getter()
{
  return 70.0;
}

double static CGFloat.verticalButtonPadding.getter()
{
  return 8.0;
}

double static CGFloat.preferredCompactContentSizeWidth.getter()
{
  return 644.0;
}

double static CGFloat.preferredCompactContentSizeHeight.getter()
{
  return 656.0;
}

double static CGFloat.preferredContentSizeWidth.getter()
{
  return 704.0;
}

double static CGFloat.dragCellCornerRadius.getter()
{
  return 16.0;
}

double static CGFloat.dragCellScaleDragging.getter()
{
  return 1.03;
}

double static CGFloat.closeButtonTrailingPadding.getter()
{
  return 18.0;
}

double static CGFloat.imageHeight.getter()
{
  return 103.0;
}

uint64_t tryItLogError(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_25F7896F0(a1, a2, a3, MEMORY[0x263F90280]);
}

uint64_t tryItLog(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_25F7896F0(a1, a2, a3, MEMORY[0x263F90290]);
}

uint64_t tryItLogDebug(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_25F7896F0(a1, a2, a3, MEMORY[0x263F90278]);
}

uint64_t tryItLog(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F789850(a1, a2, a3, a4, a5, MEMORY[0x263F90290]);
}

uint64_t tryItLogDebug(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F789850(a1, a2, a3, a4, a5, MEMORY[0x263F90278]);
}

uint64_t tryItLogInfo(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_25F7896F0(a1, a2, a3, MEMORY[0x263F90270]);
}

uint64_t tryItLogInfo(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F789850(a1, a2, a3, a4, a5, MEMORY[0x263F90270]);
}

uint64_t tryItLogError(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F789850(a1, a2, a3, a4, a5, MEMORY[0x263F90280]);
}

uint64_t tryItLogFault(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_25F7896F0(a1, a2, a3, MEMORY[0x263F90288]);
}

uint64_t sub_25F7896F0(NSObject **a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = *a1;
  os_log_type_t v7 = a4();
  uint64_t result = os_log_type_enabled(v6, v7);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_25F789928(a2, a3, &v11);
    sub_25F78C2A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25F739000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FEDE0](v10, -1, -1);
    return MEMORY[0x2611FEDE0](v9, -1, -1);
  }
  return result;
}

uint64_t tryItLogFault(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F789850(a1, a2, a3, a4, a5, MEMORY[0x263F90288]);
}

uint64_t sub_25F789850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  a6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCC08);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25F78D770;
  *(void *)(v7 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCC10);
  *(void *)(v7 + 64) = sub_25F789F18();
  *(void *)(v7 + 32) = a5;
  swift_bridgeObjectRetain();
  sub_25F78B100();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F789928(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25F7899FC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25F789FC4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25F789FC4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25F7899FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25F78C2B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25F789BB8(a5, a6);
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
  uint64_t v8 = sub_25F78C320();
  if (!v8)
  {
    sub_25F78C370();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25F78C3C0();
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

uint64_t sub_25F789BB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25F789C50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25F789DC8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25F789DC8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25F789C50(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25F787A3C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25F78C310();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25F78C370();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25F78C050();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25F78C3C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25F78C370();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25F789DC8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7BCBF0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25F78C3C0();
  __break(1u);
  return result;
}

unint64_t sub_25F789F18()
{
  unint64_t result = qword_26A7BCC18;
  if (!qword_26A7BCC18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7BCC10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCC18);
  }
  return result;
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

uint64_t sub_25F789FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_25F78A020()
{
  uint64_t v1 = *v0;
  id v2 = objc_allocWithZone((Class)type metadata accessor for ActivityItemController());
  return sub_25F78A18C(v1);
}

uint64_t sub_25F78A060()
{
  return sub_25F78B820();
}

uint64_t sub_25F78A09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25F78A930();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_25F78A100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25F78A930();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_25F78A164()
{
}

id sub_25F78A18C(void *a1)
{
  uint64_t v3 = (objc_class *)type metadata accessor for UIImageActivityType();
  unint64_t v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image] = a1;
  v16.receiver = v4;
  v16.super_class = v3;
  uint64_t v5 = v1;
  id v6 = a1;
  id v7 = objc_msgSendSuper2(&v16, sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BCCC0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25F78D770;
  *(void *)(v8 + 56) = v3;
  *(void *)(v8 + 32) = v7;
  id v9 = objc_allocWithZone(MEMORY[0x263F1C3E8]);
  id v10 = v7;
  size_t v11 = (void *)sub_25F78C0D0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_initWithActivityItems_applicationActivities_, v11, 0);

  *(void *)&v5[OBJC_IVAR____TtC9TipsTryIt22ActivityItemController_hostingController] = v12;
  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for ActivityItemController();
  id v13 = objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);

  return v13;
}

void sub_25F78A32C()
{
  uint64_t v1 = v0;
  v31.receiver = v0;
  v31.super_class = (Class)type metadata accessor for ActivityItemController();
  objc_msgSendSuper2(&v31, sel_loadView);
  uint64_t v2 = OBJC_IVAR____TtC9TipsTryIt22ActivityItemController_hostingController;
  id v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9TipsTryIt22ActivityItemController_hostingController], sel_view);
  if (v3)
  {
    unint64_t v4 = v3;
    objc_msgSend(v0, sel_addChildViewController_, *(void *)&v0[v2]);
    id v5 = objc_msgSend(v0, sel_view);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v5, sel_addSubview_, v4);

      objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      id v7 = objc_msgSend(v1, sel_view);
      if (v7)
      {
        uint64_t v8 = v7;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7BCCA0);
        uint64_t v9 = swift_allocObject();
        *(_OWORD *)(v9 + 16) = xmmword_25F78E190;
        id v10 = objc_msgSend(v4, sel_leadingAnchor);
        id v11 = objc_msgSend(v1, sel_view);
        if (v11)
        {
          id v12 = v11;
          id v13 = objc_msgSend(v11, sel_leadingAnchor);

          id v14 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v13);
          *(void *)(v9 + 32) = v14;
          id v15 = objc_msgSend(v4, sel_topAnchor);
          id v16 = objc_msgSend(v1, sel_view);
          if (v16)
          {
            unint64_t v17 = v16;
            id v18 = objc_msgSend(v16, sel_topAnchor);

            id v19 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v18);
            *(void *)(v9 + 40) = v19;
            id v20 = objc_msgSend(v4, sel_trailingAnchor);
            id v21 = objc_msgSend(v1, sel_view);
            if (v21)
            {
              uint64_t v22 = v21;
              id v23 = objc_msgSend(v21, sel_trailingAnchor);

              id v24 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v23);
              *(void *)(v9 + 48) = v24;
              id v25 = objc_msgSend(v4, sel_bottomAnchor);
              id v26 = objc_msgSend(v1, sel_view);
              if (v26)
              {
                uint64_t v27 = v26;
                id v28 = objc_msgSend(v26, sel_bottomAnchor);

                id v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v28);
                *(void *)(v9 + 56) = v29;
                sub_25F78C0F0();
                sub_25F76F0D8();
                uint64_t v30 = (void *)sub_25F78C0D0();
                swift_bridgeObjectRelease();
                objc_msgSend(v8, sel_addConstraints_, v30);

                objc_msgSend(*(id *)&v1[v2], sel_didMoveToParentViewController_, v1);
                return;
              }
LABEL_15:
              __break(1u);
              return;
            }
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

id sub_25F78A72C()
{
  return sub_25F78A8B0(type metadata accessor for ActivityItemController);
}

uint64_t type metadata accessor for ActivityItemController()
{
  return self;
}

id sub_25F78A898()
{
  return sub_25F78A8B0(type metadata accessor for UIImageActivityType);
}

id sub_25F78A8B0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for UIImageActivityType()
{
  return self;
}

ValueMetadata *type metadata accessor for ShareSheetView()
{
  return &type metadata for ShareSheetView;
}

unint64_t sub_25F78A930()
{
  unint64_t result = qword_26A7BCCB8;
  if (!qword_26A7BCCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BCCB8);
  }
  return result;
}

uint64_t TryItSessionAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:attempts:secondLessonAttempts:timeSpent:finishedLesson:finishedSecondLesson:replayed:linkTapped:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, char a11, char a12, char a13, char a14)
{
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 96) = a9;
  *(void *)(v18 + 112) = a10;
  *(unsigned char *)(v18 + 120) = a11;
  *(unsigned char *)(v18 + 121) = a12;
  *(unsigned char *)(v18 + 122) = a13;
  *(unsigned char *)(v18 + 123) = a14;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x800000025F78F450, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t TryItSessionAnalyticsEvent.init(tipId:correlationId:collectionId:lessonId:attempts:secondLessonAttempts:timeSpent:finishedLesson:finishedSecondLesson:replayed:linkTapped:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, char a11, char a12, char a13, char a14)
{
  *(_OWORD *)(v14 + 96) = a9;
  *(void *)(v14 + 112) = a10;
  *(unsigned char *)(v14 + 120) = a11;
  *(unsigned char *)(v14 + 121) = a12;
  *(unsigned char *)(v14 + 122) = a13;
  *(unsigned char *)(v14 + 123) = a14;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x800000025F78F450, a1, a2, a3, a4, a5, a6, a7, a8);
}

unint64_t sub_25F78AACC()
{
  unint64_t v0 = sub_25F7577D8();
  uint64_t v1 = sub_25F78C190();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v1, 0x7374706D65747461, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_25F78C190();
  char v4 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v3, 0x7374706D65747461, 0xEB0000000032765FLL, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_25F78C190();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v5, 0x6570735F656D6974, 0xEA0000000000746ELL, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_25F78C110();
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v7, 0x64656873696E6966, 0xEF6E6F7373656C5FLL, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_25F78C110();
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v9, 0xD000000000000012, 0x800000025F790270, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_25F78C110();
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v11, 0x646579616C706572, 0xE800000000000000, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25F78C110();
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  sub_25F758148(v13, 0x7061745F6B6E696CLL, 0xEB00000000646570, v14);
  swift_bridgeObjectRelease();
  return v0;
}

void TryItSessionAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
}

void TryItSessionAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
}

uint64_t TryItSessionAnalyticsEvent.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TryItSessionAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 124, 7);
}

uint64_t type metadata accessor for TryItSessionAnalyticsEvent()
{
  return self;
}

uint64_t method lookup function for TryItSessionAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TryItSessionAnalyticsEvent);
}

uint64_t dispatch thunk of TryItSessionAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:attempts:secondLessonAttempts:timeSpent:finishedLesson:finishedSecondLesson:replayed:linkTapped:)()
{
  return (*(uint64_t (**)(void))(v0 + 480))();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_25F78AEC0()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_25F78AED0()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_25F78AEE0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25F78AEF0()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_25F78AF00()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_25F78AF10()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25F78AF20()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25F78AF40()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_25F78AF50()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25F78AF60()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_25F78AF70()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25F78AF80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25F78AF90()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25F78AFA0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25F78AFB0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25F78AFC0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25F78AFD0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25F78AFE0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25F78AFF0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25F78B000()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25F78B010()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25F78B020()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25F78B030()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_25F78B040()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_25F78B050()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_25F78B060()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_25F78B070()
{
  return MEMORY[0x270F07F40]();
}

uint64_t sub_25F78B080()
{
  return MEMORY[0x270F07F78]();
}

uint64_t sub_25F78B090()
{
  return MEMORY[0x270F07FB0]();
}

uint64_t sub_25F78B0A0()
{
  return MEMORY[0x270F07FB8]();
}

uint64_t sub_25F78B0B0()
{
  return MEMORY[0x270F07FC8]();
}

uint64_t sub_25F78B0C0()
{
  return MEMORY[0x270F07FE0]();
}

uint64_t sub_25F78B0D0()
{
  return MEMORY[0x270F07FE8]();
}

uint64_t sub_25F78B0E0()
{
  return MEMORY[0x270F08010]();
}

uint64_t sub_25F78B0F0()
{
  return MEMORY[0x270F08018]();
}

uint64_t sub_25F78B100()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25F78B110()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25F78B120()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_25F78B130()
{
  return MEMORY[0x270EFEE70]();
}

uint64_t sub_25F78B140()
{
  return MEMORY[0x270EFEE78]();
}

uint64_t sub_25F78B150()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_25F78B160()
{
  return MEMORY[0x270EFEF68]();
}

uint64_t sub_25F78B170()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_25F78B180()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25F78B190()
{
  return MEMORY[0x270EFEFF0]();
}

uint64_t sub_25F78B1A0()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_25F78B1B0()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_25F78B1C0()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_25F78B1D0()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_25F78B1E0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_25F78B1F0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_25F78B200()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_25F78B210()
{
  return MEMORY[0x270EFF588]();
}

uint64_t sub_25F78B220()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25F78B230()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_25F78B240()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_25F78B250()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_25F78B260()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_25F78B270()
{
  return MEMORY[0x270EFF700]();
}

uint64_t sub_25F78B280()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_25F78B290()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_25F78B2A0()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_25F78B2B0()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_25F78B2C0()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_25F78B2E0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_25F78B2F0()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_25F78B300()
{
  return MEMORY[0x270F000E8]();
}

uint64_t sub_25F78B310()
{
  return MEMORY[0x270F00120]();
}

uint64_t sub_25F78B320()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_25F78B330()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_25F78B340()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_25F78B350()
{
  return MEMORY[0x270F00478]();
}

uint64_t sub_25F78B360()
{
  return MEMORY[0x270F00480]();
}

uint64_t sub_25F78B370()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_25F78B380()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_25F78B390()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25F78B3A0()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_25F78B3B0()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_25F78B3C0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_25F78B3D0()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_25F78B3E0()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_25F78B3F0()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_25F78B400()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_25F78B410()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_25F78B420()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25F78B430()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25F78B440()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_25F78B450()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_25F78B460()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_25F78B470()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_25F78B480()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_25F78B490()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_25F78B4A0()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25F78B4B0()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25F78B4C0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25F78B4D0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25F78B4E0()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25F78B4F0()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25F78B500()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25F78B510()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25F78B520()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_25F78B530()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_25F78B540()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25F78B550()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_25F78B560()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_25F78B570()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_25F78B580()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_25F78B590()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_25F78B5A0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25F78B5B0()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_25F78B5C0()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_25F78B5D0()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_25F78B5E0()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_25F78B5F0()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_25F78B600()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25F78B610()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_25F78B620()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_25F78B630()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25F78B640()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_25F78B650()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_25F78B660()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_25F78B680()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_25F78B690()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_25F78B6A0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_25F78B6B0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_25F78B6C0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_25F78B6D0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_25F78B6F0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25F78B700()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_25F78B710()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_25F78B720()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_25F78B730()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_25F78B740()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_25F78B750()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_25F78B760()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_25F78B770()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_25F78B780()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_25F78B790()
{
  return MEMORY[0x270F021E0]();
}

uint64_t sub_25F78B7A0()
{
  return MEMORY[0x270F021E8]();
}

uint64_t sub_25F78B7B0()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_25F78B7C0()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_25F78B7D0()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_25F78B7E0()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_25F78B7F0()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_25F78B800()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25F78B810()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25F78B820()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25F78B840()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25F78B850()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25F78B860()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25F78B880()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_25F78B890()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25F78B8A0()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_25F78B8B0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_25F78B8C0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25F78B8D0()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_25F78B8E0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25F78B8F0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_25F78B900()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25F78B910()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25F78B920()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_25F78B930()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_25F78B940()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_25F78B950()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_25F78B960()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_25F78B970()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_25F78B980()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_25F78B990()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_25F78B9A0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_25F78B9B0()
{
  return MEMORY[0x270F02F50]();
}

uint64_t sub_25F78B9C0()
{
  return MEMORY[0x270F02F60]();
}

uint64_t sub_25F78B9D0()
{
  return MEMORY[0x270F02F68]();
}

uint64_t sub_25F78B9E0()
{
  return MEMORY[0x270F02F70]();
}

uint64_t sub_25F78B9F0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25F78BA00()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25F78BA10()
{
  return MEMORY[0x270F03248]();
}

uint64_t sub_25F78BA20()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25F78BA30()
{
  return MEMORY[0x270F08190]();
}

uint64_t sub_25F78BA40()
{
  return MEMORY[0x270F03290]();
}

uint64_t sub_25F78BA50()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25F78BA60()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25F78BA70()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_25F78BA80()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_25F78BA90()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_25F78BAA0()
{
  return MEMORY[0x270F03478]();
}

uint64_t sub_25F78BAB0()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_25F78BAC0()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25F78BAD0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25F78BAE0()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_25F78BAF0()
{
  return MEMORY[0x270F03968]();
}

uint64_t sub_25F78BB00()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_25F78BB10()
{
  return MEMORY[0x270F03A58]();
}

uint64_t sub_25F78BB20()
{
  return MEMORY[0x270F03A78]();
}

uint64_t sub_25F78BB30()
{
  return MEMORY[0x270F03B78]();
}

uint64_t sub_25F78BB40()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_25F78BB50()
{
  return MEMORY[0x270F03DB8]();
}

uint64_t sub_25F78BB60()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_25F78BB70()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_25F78BB80()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25F78BB90()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_25F78BBA0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_25F78BBB0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25F78BBC0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25F78BBD0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25F78BBE0()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_25F78BBF0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_25F78BC00()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_25F78BC10()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_25F78BC20()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25F78BC30()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25F78BC40()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_25F78BC50()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25F78BC60()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_25F78BC70()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25F78BC80()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25F78BC90()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25F78BCA0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25F78BCB0()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_25F78BCC0()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_25F78BCD0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25F78BCE0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25F78BCF0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25F78BD00()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_25F78BD10()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_25F78BD20()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_25F78BD30()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_25F78BD40()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_25F78BD50()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_25F78BD60()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_25F78BD70()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_25F78BD80()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_25F78BD90()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_25F78BDA0()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_25F78BDB0()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_25F78BDC0()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_25F78BDD0()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_25F78BDE0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25F78BDF0()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_25F78BE00()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_25F78BE10()
{
  return MEMORY[0x270F050A8]();
}

uint64_t sub_25F78BE20()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_25F78BE30()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_25F78BE40()
{
  return MEMORY[0x270F05108]();
}

uint64_t sub_25F78BE50()
{
  return MEMORY[0x270F05118]();
}

uint64_t sub_25F78BE60()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_25F78BE70()
{
  return MEMORY[0x270F05158]();
}

uint64_t sub_25F78BE80()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_25F78BE90()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_25F78BEA0()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_25F78BEB0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_25F78BEC0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25F78BED0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25F78BEE0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25F78BEF0()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_25F78BF00()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25F78BF10()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25F78BF20()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25F78BF30()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25F78BF40()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25F78BF50()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25F78BF60()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25F78BF70()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25F78BF80()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25F78BF90()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25F78BFA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25F78BFB0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25F78BFC0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25F78BFD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25F78BFE0()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_25F78BFF0()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_25F78C000()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25F78C010()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25F78C020()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25F78C030()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25F78C040()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25F78C050()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25F78C060()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25F78C070()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25F78C090()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25F78C0A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25F78C0B0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25F78C0C0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25F78C0D0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25F78C0E0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25F78C0F0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25F78C100()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25F78C110()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25F78C120()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25F78C130()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25F78C140()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25F78C150()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_25F78C160()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25F78C170()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25F78C180()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25F78C190()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25F78C1A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25F78C1B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25F78C1C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25F78C1D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25F78C1E0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25F78C1F0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25F78C200()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25F78C210()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25F78C220()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25F78C230()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25F78C240()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25F78C250()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_25F78C260()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_25F78C270()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_25F78C280()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25F78C290()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25F78C2A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25F78C2B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25F78C2C0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25F78C2D0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25F78C2E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25F78C2F0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25F78C300()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25F78C310()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25F78C320()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25F78C330()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25F78C340()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25F78C350()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25F78C360()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25F78C370()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25F78C380()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25F78C390()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25F78C3A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25F78C3B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25F78C3C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25F78C3E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25F78C3F0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25F78C400()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25F78C410()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25F78C420()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25F78C430()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25F78C450()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25F78C460()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25F78C470()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25F78C480()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_25F78C490()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
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

void bzero(void *a1, size_t a2)
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}