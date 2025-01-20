BOOL sub_100004808(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000481C()
{
  Swift::UInt v1 = *v0;
  sub_10004F470();
  sub_10004F480(v1);
  return sub_10004F490();
}

void sub_100004864()
{
  sub_10004F480(*v0);
}

Swift::Int sub_100004890()
{
  Swift::UInt v1 = *v0;
  sub_10004F470();
  sub_10004F480(v1);
  return sub_10004F490();
}

uint64_t sub_1000048D4(uint64_t a1)
{
  return sub_1000048FC(a1, &qword_100061108);
}

uint64_t sub_1000048E8(uint64_t a1)
{
  return sub_1000048FC(a1, &qword_100061118);
}

uint64_t sub_1000048FC(uint64_t a1, uint64_t *a2)
{
  sub_10004ECB0();
  __chkstk_darwin();
  (*(void (**)(char *, void))(v4 + 104))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t result = sub_10004ED00();
  *a2 = result;
  return result;
}

uint64_t sub_1000049E0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  int v44 = a1;
  int v2 = a1;
  uint64_t v43 = sub_10004E620();
  __chkstk_darwin();
  uint64_t v4 = (_OWORD *)((char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_10004EDE0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100004F98(&qword_100061200);
  __chkstk_darwin();
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100004F98(&qword_100061208);
  __chkstk_darwin();
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100004F98(&qword_100061210);
  __chkstk_darwin();
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100004F98(&qword_100061218);
  __chkstk_darwin();
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100004F98(&qword_100061220);
  __chkstk_darwin();
  uint64_t v39 = (uint64_t)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004EDD0();
  if (v2 == 2)
  {
    if (qword_100061110 != -1) {
      swift_once();
    }
    v18 = &qword_100061118;
  }
  else
  {
    if (qword_100061100 != -1) {
      swift_once();
    }
    v18 = &qword_100061108;
  }
  uint64_t v19 = *v18;
  swift_retain();
  char v20 = sub_10004E9D0();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v5);
  v21 = &v10[*(int *)(v37 + 36)];
  *(void *)v21 = v19;
  v21[8] = v20;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v22 = (char *)v4 + *(int *)(v43 + 20);
  uint64_t v23 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v24 = sub_10004E8A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v22, v23, v24);
  __asm { FMOV            V0.2D, #0.5 }
  *uint64_t v4 = _Q0;
  uint64_t v30 = (uint64_t)&v12[*(int *)(v38 + 36)];
  sub_100004FDC((uint64_t)v4, v30);
  *(_WORD *)(v30 + *(int *)(sub_100004F98(&qword_100061228) + 36)) = 256;
  sub_10000509C((uint64_t)v10, (uint64_t)v12, &qword_100061200);
  sub_100005040((uint64_t)v4);
  sub_100005100((uint64_t)v10, &qword_100061200);
  LOBYTE(v30) = sub_10004E9C0();
  sub_10000509C((uint64_t)v12, (uint64_t)v14, &qword_100061208);
  v14[*(int *)(v40 + 36)] = v30;
  sub_100005100((uint64_t)v12, &qword_100061208);
  sub_10004EE50();
  sub_10004E590();
  sub_10000509C((uint64_t)v14, (uint64_t)v16, &qword_100061210);
  v31 = &v16[*(int *)(v41 + 36)];
  long long v32 = v47;
  *(_OWORD *)v31 = v46;
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v48;
  sub_100005100((uint64_t)v14, &qword_100061210);
  if ((_BYTE)v44) {
    double v33 = 1.0;
  }
  else {
    double v33 = 0.0;
  }
  uint64_t v34 = v39;
  sub_10000509C((uint64_t)v16, v39, &qword_100061218);
  *(double *)(v34 + *(int *)(v42 + 36)) = v33;
  sub_100005100((uint64_t)v16, &qword_100061218);
  return sub_10000515C(v34, v45);
}

uint64_t sub_100004F24()
{
  return sub_10004EC60();
}

uint64_t sub_100004F40@<X0>(uint64_t a1@<X8>)
{
  return sub_1000049E0(*v1, a1);
}

void sub_100004F48(void *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *initializeBufferWithCopyOfBuffer for ChartSeparatorType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ChartSeparator()
{
  return &type metadata for ChartSeparator;
}

uint64_t sub_100004F7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004F98(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005040(uint64_t a1)
{
  uint64_t v2 = sub_10004E620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000509C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004F98(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005100(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004F98(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000515C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100061220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s13FitnessWidget18ChartSeparatorTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13FitnessWidget18ChartSeparatorTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100005320);
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

uint64_t sub_100005348(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005354(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChartSeparatorType()
{
  return &type metadata for ChartSeparatorType;
}

uint64_t sub_10000536C()
{
  return sub_100005428(&qword_100061230, &qword_100061220, (void (*)(void))sub_1000053F8);
}

uint64_t sub_1000053B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000053F8()
{
  return sub_100005428(&qword_100061238, &qword_100061218, (void (*)(void))sub_1000054A4);
}

uint64_t sub_100005428(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000053B0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000054A4()
{
  return sub_100005428(&qword_100061240, &qword_100061210, (void (*)(void))sub_1000054D4);
}

unint64_t sub_1000054D4()
{
  unint64_t result = qword_100061248;
  if (!qword_100061248)
  {
    sub_1000053B0(&qword_100061208);
    sub_100005574();
    sub_10000566C(&qword_100061270, &qword_100061228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061248);
  }
  return result;
}

unint64_t sub_100005574()
{
  unint64_t result = qword_100061250;
  if (!qword_100061250)
  {
    sub_1000053B0(&qword_100061200);
    sub_100005614();
    sub_10000566C(&qword_100061260, &qword_100061268);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061250);
  }
  return result;
}

unint64_t sub_100005614()
{
  unint64_t result = qword_100061258;
  if (!qword_100061258)
  {
    sub_10004EDE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061258);
  }
  return result;
}

uint64_t sub_10000566C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000053B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000056B4()
{
  unint64_t result = qword_100061278;
  if (!qword_100061278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061278);
  }
  return result;
}

char *sub_10000570C(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10004E400();
    uint64_t v8 = *(void *)(v7 - 8);
    v29 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v29(a1, a2, v7);
    uint64_t v9 = a3[5];
    v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_10004F040();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_100004F98(&qword_100061280);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = a3[7];
    v18 = *(void **)&a2[v16];
    *(void *)&a1[v16] = v18;
    uint64_t v19 = &a1[v17];
    char v20 = &a2[v17];
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    id v22 = v18;
    if (v21(v20, 1, v7))
    {
      uint64_t v23 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      v29(v19, v20, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v19, 0, 1, v7);
    }
    uint64_t v24 = a3[8];
    uint64_t v25 = a3[9];
    v26 = *(void **)&a2[v24];
    *(void *)&a1[v24] = v26;
    a1[v25] = a2[v25];
    a1[a3[10]] = a2[a3[10]];
    id v27 = v26;
  }
  return a1;
}

void sub_1000059C4(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_10004E400();
  uint64_t v5 = *(void *)(v4 - 8);
  unsigned int v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + a2[5];
  uint64_t v8 = sub_10004F040();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  uint64_t v10 = a1 + a2[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4)) {
    v6(v10, v4);
  }
  uint64_t v11 = *(void **)(a1 + a2[8]);
}

char *sub_100005B4C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  id v27 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v27(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_10004F040();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100004F98(&qword_100061280);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = a3[7];
  uint64_t v16 = *(void **)&a2[v14];
  *(void *)&a1[v14] = v16;
  uint64_t v17 = &a1[v15];
  v18 = &a2[v15];
  uint64_t v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  id v20 = v16;
  if (v19(v18, 1, v6))
  {
    uint64_t v21 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v27(v17, v18, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v6);
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  uint64_t v24 = *(void **)&a2[v22];
  *(void *)&a1[v22] = v24;
  a1[v23] = a2[v23];
  a1[a3[10]] = a2[a3[10]];
  id v25 = v24;
  return a1;
}

uint64_t sub_100005DB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v33 = *(void *)(v6 - 8);
  long long v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 24);
  v32(a1, a2, v6);
  uint64_t v34 = a3;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_10004F040();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100004F98(&qword_100061280);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = v34[6];
  uint64_t v17 = *(void **)(a1 + v16);
  v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  id v19 = v18;

  uint64_t v20 = v34[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  int v24 = v23(a1 + v20, 1, v6);
  int v25 = v23((uint64_t)v22, 1, v6);
  if (!v24)
  {
    if (!v25)
    {
      v32((uint64_t)v21, (uint64_t)v22, v6);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v21, v6);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    uint64_t v26 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v21, v22, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v21, 0, 1, v6);
LABEL_13:
  uint64_t v27 = v34[8];
  v28 = *(void **)(a1 + v27);
  v29 = *(void **)(a2 + v27);
  *(void *)(a1 + v27) = v29;
  id v30 = v29;

  *(unsigned char *)(a1 + v34[9]) = *(unsigned char *)(a2 + v34[9]);
  *(unsigned char *)(a1 + v34[10]) = *(unsigned char *)(a2 + v34[10]);
  return a1;
}

char *sub_1000060F8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v20 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v20(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_10004F040();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100004F98(&qword_100061280);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v14], 1, v6))
  {
    uint64_t v17 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v20(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  uint64_t v18 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  a1[v18] = a2[v18];
  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_100006358(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v30 = *(void *)(v6 - 8);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 40);
  v29(a1, a2, v6);
  v31 = a3;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_10004F040();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100004F98(&qword_100061280);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = v31[6];
  uint64_t v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);

  uint64_t v18 = v31[7];
  id v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
  int v22 = v21(a1 + v18, 1, v6);
  int v23 = v21((uint64_t)v20, 1, v6);
  if (!v22)
  {
    if (!v23)
    {
      v29((uint64_t)v19, (uint64_t)v20, v6);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v30 + 8))(v19, v6);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v30 + 32))(v19, v20, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v19, 0, 1, v6);
LABEL_13:
  uint64_t v25 = v31[8];
  uint64_t v26 = *(void **)(a1 + v25);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);

  uint64_t v27 = v31[10];
  *(unsigned char *)(a1 + v31[9]) = *(unsigned char *)(a2 + v31[9]);
  *(unsigned char *)(a1 + v27) = *(unsigned char *)(a2 + v27);
  return a1;
}

uint64_t sub_100006690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000066A4);
}

uint64_t sub_1000066A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061280);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 2147483646)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    int v15 = v14 - 1;
    if (v15 < 0) {
      int v15 = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[7];
    return v17(v19, a2, v18);
  }
}

uint64_t sub_100006838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000684C);
}

uint64_t sub_10000684C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_10004E400();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100004F98(&qword_100061280);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[6]) = a2;
  }
  else
  {
    uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t type metadata accessor for FitnessWidgetProvider.ActivityEntry()
{
  uint64_t result = qword_1000612E0;
  if (!qword_1000612E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006A20()
{
  sub_10004E400();
  if (v0 <= 0x3F)
  {
    sub_100006B70(319, (unint64_t *)&unk_1000612F0, (void (*)(uint64_t))&type metadata accessor for TimelineEntryRelevance);
    if (v1 <= 0x3F)
    {
      sub_100006B70(319, (unint64_t *)&qword_100061720, (void (*)(uint64_t))&type metadata accessor for Date);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100006B70(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004F2A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for FitnessWidgetProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for FitnessWidgetProvider(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  id v6 = v5;

  return a1;
}

__n128 initializeWithTake for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessWidgetProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FitnessWidgetProvider(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessWidgetProvider()
{
  return &type metadata for FitnessWidgetProvider;
}

uint64_t sub_100006E3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10004E400();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100006EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000BAFC(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_100006EB4()
{
  return sub_10000B6B4(qword_100061338, (void (*)(uint64_t))type metadata accessor for FitnessWidgetProvider.ActivityEntry);
}

uint64_t sub_100006EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = a3;
  uint64_t v46 = a2;
  uint64_t v3 = sub_10004EEF0();
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  v52 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10004EF10();
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  v49 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v43 - v11;
  sub_10004F1B0();
  id v13 = HKLogActivity;
  sub_10004E4E0();

  sub_10004E3F0();
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  sub_10004F1E0();
  id v15 = HKLogActivity;
  sub_10004E4E0();

  if (qword_1000611F8 != -1) {
    swift_once();
  }
  int v44 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v44(v10, v12, v6);
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v45 = v7;
  uint64_t v57 = v16 | 7;
  uint64_t v17 = (v16 + 16) & ~v16;
  uint64_t v43 = v17;
  unint64_t v58 = ((v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v56 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (uint64_t)v12;
  uint64_t v19 = swift_allocObject();
  v55 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v55(v19 + v17, v10, v6);
  *(void *)(v19 + ((v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = v14;
  uint64_t v20 = v14;
  sub_1000121FC(v18, 1, (uint64_t)sub_10000B81C, v19);
  swift_release();
  dispatch_group_enter(v20);
  sub_10004F1E0();
  id v21 = HKLogActivity;
  sub_10004E4E0();

  int v22 = (void (*)(char *, uint64_t, uint64_t))v44;
  v44(v10, (char *)v18, v6);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v43;
  v55(v23 + v43, v10, v6);
  *(void *)(v23 + v56) = v20;
  uint64_t v25 = v20;
  sub_100013CC0(v18, 1, sub_10000B8EC, v23);
  swift_release();
  dispatch_group_enter(v25);
  sub_10004F1E0();
  id v26 = HKLogActivity;
  sub_10004E4E0();

  v22(v10, v18, v6);
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = v27 + v24;
  uint64_t v29 = v6;
  v55(v28, v10, v6);
  *(void *)(v27 + v56) = v25;
  uint64_t v30 = v25;
  uint64_t v31 = v18;
  sub_100012B0C(v18, 1, (uint64_t)sub_10000B6B0, v27);
  swift_release();
  sub_10000B4A8();
  long long v32 = (void *)sub_10004F230();
  uint64_t v33 = v47;
  long long v34 = *(_OWORD *)((char *)v47 + 8);
  long long v62 = *(_OWORD *)((char *)v47 + 24);
  long long v63 = v34;
  sub_10000B630((uint64_t)v47 + 40, (uint64_t)&v61, &qword_100061358);
  uint64_t v35 = swift_allocObject();
  uint64_t v36 = v48;
  *(void *)(v35 + 16) = v46;
  *(void *)(v35 + 24) = v36;
  long long v37 = v33[1];
  *(_OWORD *)(v35 + 32) = *v33;
  *(_OWORD *)(v35 + 48) = v37;
  *(_OWORD *)(v35 + 64) = v33[2];
  aBlock[4] = sub_10000BA94;
  aBlock[5] = v35;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000112DC;
  aBlock[3] = &unk_10005E770;
  uint64_t v38 = _Block_copy(aBlock);
  swift_retain();
  sub_10000A814((uint64_t)&v63);
  sub_10000A814((uint64_t)&v62);
  sub_10000A840(&v61);
  uint64_t v39 = v49;
  sub_10004EF00();
  v59 = &_swiftEmptyArrayStorage;
  sub_10000B6B4(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_10000B580();
  uint64_t v40 = v52;
  uint64_t v41 = v54;
  sub_10004F2F0();
  sub_10004F1F0();
  _Block_release(v38);

  (*(void (**)(char *, uint64_t))(v53 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v39, v51);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v31, v29);
  return swift_release();
}

uint64_t sub_100007690(void (*a1)(char *), uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v27 = a1;
  sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin();
  uint64_t v24 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004F98(&qword_100061280);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10004E400();
  uint64_t v5 = *(void *)(v25 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  __chkstk_darwin();
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000611F8 != -1) {
    swift_once();
  }
  sub_100004F98((uint64_t *)&unk_100061990);
  sub_10004F240();
  uint64_t v11 = v28;
  if (v28 && (BOOL v12 = sub_10001ED58(), v11, v12))
  {
    sub_10004E3F0();
    uint64_t v13 = sub_10004F040();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
    sub_10004F240();
    uint64_t v23 = v28;
    uint64_t v14 = (uint64_t)v24;
    sub_10004F240();
    sub_100004F98(&qword_1000613A0);
    sub_10004F240();
    id v15 = v28;
    char v16 = *(unsigned char *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v25);
    sub_10000B630((uint64_t)v4, (uint64_t)&v10[v8[5]], &qword_100061280);
    *(void *)&v10[v8[6]] = v23;
    sub_10000B630(v14, (uint64_t)&v10[v8[7]], (uint64_t *)&unk_100061980);
    char v17 = 0;
  }
  else
  {
    sub_10004F1E0();
    id v18 = HKLogActivity;
    sub_10004E4E0();

    sub_10004E3F0();
    uint64_t v19 = &v10[v8[5]];
    uint64_t v20 = sub_10004F040();
    char v17 = 1;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(&v10[v8[7]], 1, 1, v25);
    id v15 = 0;
    char v16 = *(unsigned char *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    *(void *)&v10[v8[6]] = 0;
  }
  *(void *)&v10[v8[8]] = v15;
  v10[v8[9]] = v17;
  v10[v8[10]] = v16;
  v27(v10);
  return sub_10000BAA0((uint64_t)v10);
}

uint64_t sub_100007B34(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v91 = a3;
  v92 = a2;
  uint64_t v89 = a1;
  uint64_t v5 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v5 - 8);
  uint64_t v85 = (uint64_t)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_10004E400();
  uint64_t v88 = *(void *)(v90 - 8);
  uint64_t v7 = *(void *)(v88 + 64);
  __chkstk_darwin(v90);
  v83 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v87 = (char *)&v81 - v9;
  __chkstk_darwin(v10);
  v86 = (char *)&v81 - v11;
  __chkstk_darwin(v12);
  v82 = (char *)&v81 - v13;
  v94 = (void **)sub_10004F060();
  uint64_t v14 = (uint64_t)*(v94 - 1);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v94);
  v93 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v18 = (char *)&v81 - v17;
  uint64_t v19 = sub_10004F020();
  __chkstk_darwin(v19 - 8);
  uint64_t v20 = sub_100004F98(&qword_100061350);
  uint64_t v84 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004F1E0();
  id v23 = HKLogActivity;
  sub_10004E4E0();

  sub_10000B630((uint64_t)v3 + 40, (uint64_t)&v102, &qword_100061358);
  sub_10000B630((uint64_t)&v102, (uint64_t)&v103, &qword_100061358);
  uint64_t v24 = v103;
  if (v103)
  {
    NSString v25 = sub_10004F0D0();
    unsigned int v26 = [v24 BOOLForKey:v25];

    if (v26)
    {
      sub_10004F1E0();
      id v27 = HKLogActivity;
      sub_10004E4E0();

      sub_10000AF38(5);
      sub_10004F010();
      type metadata accessor for FitnessWidgetProvider.ActivityEntry();
      sub_10000B6B4(qword_100061338, (void (*)(uint64_t))type metadata accessor for FitnessWidgetProvider.ActivityEntry);
      sub_10004F070();
      v92(v22);
      return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v22, v20);
    }
  }
  uint64_t v29 = *(void (**)(char *, uint64_t, void **))(v14 + 16);
  uint64_t v30 = v94;
  v29(v18, v89, v94);
  v29(v93, (uint64_t)v18, v30);
  uint64_t v31 = *((void *)v4 + 2);
  uint64_t v84 = *((void *)v4 + 1);
  long long v101 = *(long long *)((char *)v4 + 24);
  unint64_t v32 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v33 = (v15 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = swift_allocObject();
  (*(void (**)(unint64_t, char *, void **))(v14 + 32))(v34 + v32, v18, v30);
  uint64_t v35 = (void (**)(char *))(v34 + v33);
  uint64_t v37 = v91;
  uint64_t v36 = v92;
  *uint64_t v35 = v92;
  v35[1] = (void (*)(char *))v37;
  uint64_t v89 = v34;
  uint64_t v38 = (_OWORD *)(v34 + ((v33 + 23) & 0xFFFFFFFFFFFFFFF8));
  long long v39 = v4[2];
  long long v40 = *v4;
  v38[1] = v4[1];
  v38[2] = v39;
  *uint64_t v38 = v40;
  uint64_t v41 = self;
  uint64_t v81 = v31;
  swift_bridgeObjectRetain();
  sub_10000A814((uint64_t)&v101);
  swift_retain();
  sub_10000A840(&v102);
  id v42 = [v41 sharedBehavior];
  if (v42)
  {
    uint64_t v43 = v42;
    unsigned __int8 v44 = [v42 isStandalonePhoneFitnessMode];

    uint64_t v45 = v90;
    if (v44)
    {
      sub_10004F1E0();
      id v46 = HKLogActivity;
      sub_10004E4E0();

      uint64_t v47 = (uint64_t)v93;
      sub_100008684((uint64_t)v93, (uint64_t)v36, v37, v4);
      swift_release();
      return (*(uint64_t (**)(uint64_t, void **))(v14 + 8))(v47, v94);
    }
    uint64_t v48 = v85;
    sub_100009B0C(v85);
    uint64_t v49 = v88;
    int v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v48, 1, v45);
    uint64_t v51 = v89;
    if (v50 == 1)
    {
      (*(void (**)(char *, void **))(v14 + 8))(v93, v94);
      sub_100005100(v48, (uint64_t *)&unk_100061980);
    }
    else
    {
      v52 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v82, v48, v45);
      uint64_t v53 = v86;
      sub_10004E3F0();
      sub_10004E3A0();
      double v55 = v54;
      unint64_t v56 = *(void (**)(char *, uint64_t))(v49 + 8);
      v56(v53, v45);
      if (v55 < 300.0)
      {
        sub_10004F1E0();
        uint64_t v57 = v52;
        id v58 = HKLogActivity;
        sub_10004E4E0();

        uint64_t v47 = (uint64_t)v93;
        sub_100008684((uint64_t)v93, (uint64_t)v92, v37, v4);
        swift_release();
        v56(v57, v45);
        return (*(uint64_t (**)(uint64_t, void **))(v14 + 8))(v47, v94);
      }
      v56(v52, v45);
      (*(void (**)(char *, void **))(v14 + 8))(v93, v94);
    }
    v59 = self;
    v60 = (void *)swift_allocObject();
    v60[2] = 0x4010000000000000;
    v60[3] = sub_10000A778;
    v60[4] = v51;
    v99 = sub_10000A8A4;
    v100 = v60;
    uint64_t v96 = 1107296256;
    v94 = &v97;
    aBlock = _NSConcreteStackBlock;
    v97 = sub_100009D6C;
    v98 = &unk_10005E540;
    id v61 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v62 = [v59 scheduledTimerWithTimeInterval:0 repeats:v61 block:4.0];
    _Block_release(v61);
    long long v63 = v87;
    sub_10004E3F0();
    uint64_t v64 = v88;
    v65 = (id (*)())v51;
    if (qword_1000611E8 != -1) {
      swift_once();
    }
    id v66 = [objc_allocWithZone((Class)HKNanoSyncControl) initWithHealthStore:qword_1000648F0];
    v67 = v86;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v86, v63, v45);
    unint64_t v68 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    unint64_t v69 = (v7 + v68 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v70 = swift_allocObject();
    unint64_t v71 = v70 + v68;
    uint64_t v72 = v90;
    (*(void (**)(unint64_t, char *, uint64_t))(v64 + 32))(v71, v67, v90);
    *(void *)(v70 + v69) = v62;
    v73 = (id (**)())(v70 + ((v69 + 15) & 0xFFFFFFFFFFFFFFF8));
    *v73 = sub_10000A778;
    v73[1] = v65;
    v99 = sub_10000A988;
    v100 = (void *)v70;
    aBlock = _NSConcreteStackBlock;
    uint64_t v96 = 1107296256;
    v97 = sub_10000A224;
    v98 = &unk_10005E590;
    v74 = _Block_copy(&aBlock);
    swift_retain();
    id v75 = v62;
    swift_release();
    [v66 forceNanoSyncWithOptions:1 completion:v74];
    _Block_release(v74);
    v76 = v83;
    sub_10004E3F0();
    sub_10000B630((uint64_t)&v102, (uint64_t)&aBlock, &qword_100061358);
    v77 = aBlock;
    if (aBlock)
    {
      Class isa = sub_10004E3C0().super.isa;
      NSString v79 = sub_10004F0D0();
      [v77 setObject:isa forKey:v79];
      swift_release();
    }
    else
    {
      swift_release();
    }
    v80 = *(void (**)(char *, uint64_t))(v64 + 8);
    v80(v76, v72);
    return ((uint64_t (*)(char *, uint64_t))v80)(v87, v72);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, void **))(v14 + 8))(v93, v94);
    __break(1u);
  }
  return result;
}

id sub_100008684(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  v60 = a4;
  uint64_t v61 = a3;
  uint64_t v59 = a2;
  uint64_t v74 = a1;
  uint64_t v68 = sub_10004EEF0();
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  v65 = (char *)v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_10004EF10();
  uint64_t v64 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  long long v63 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10004EFB0();
  uint64_t v73 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v72 = (char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v71 = (char *)v55 - v8;
  uint64_t v9 = sub_10004E400();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v55 - v14;
  sub_10004E3F0();
  uint64_t v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  sub_10004F1E0();
  id v17 = HKLogActivity;
  sub_10004E4E0();

  if (qword_1000611F8 != -1) {
    swift_once();
  }
  dispatch_group_t v75 = (dispatch_group_t)qword_100064900;
  NSString v79 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v79(v12, v15, v9);
  uint64_t v18 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v69 = v9;
  uint64_t v19 = (v18 + 16) & ~v18;
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v77 = v20 + 8;
  uint64_t v78 = v18 | 7;
  uint64_t v21 = swift_allocObject();
  uint64_t v62 = v10;
  v76 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
  v76(v21 + v19, v12, v9);
  *(void *)(v21 + v20) = v16;
  uint64_t v22 = v16;
  sub_1000121FC((uint64_t)v15, 0, (uint64_t)sub_10000B698, v21);
  swift_release();
  sub_10004F1E0();
  id v23 = HKLogActivity;
  sub_10004E4E0();

  dispatch_group_enter(v22);
  uint64_t v24 = v12;
  NSString v25 = v15;
  uint64_t v26 = (uint64_t)v15;
  uint64_t v27 = v69;
  uint64_t v57 = v10 + 16;
  v79(v12, v25, v69);
  uint64_t v28 = swift_allocObject();
  uint64_t v56 = v19;
  v55[1] = v10 + 32;
  v76(v28 + v19, v12, v27);
  unint64_t v58 = v20;
  *(void *)(v28 + v20) = v22;
  dispatch_group_t v75 = v22;
  sub_100012B0C(v26, 0, (uint64_t)sub_10000B6B0, v28);
  swift_release();
  uint64_t v29 = v71;
  sub_10004F050();
  uint64_t v30 = v72;
  uint64_t v31 = v73;
  uint64_t v32 = v70;
  (*(void (**)(char *, void, uint64_t))(v73 + 104))(v72, enum case for WidgetFamily.systemMedium(_:), v70);
  sub_10000B6B4((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v33 = aBlock[0];
  uint64_t v34 = v84;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v31 + 8);
  v35(v30, v32);
  v35(v29, v32);
  if (v33 != v34) {
    goto LABEL_7;
  }
  uint64_t v36 = v24;
  id result = [self sharedBehavior];
  if (result)
  {
    uint64_t v38 = result;
    unsigned __int8 v39 = [result isStandalonePhoneFitnessMode];

    if ((v39 & 1) == 0)
    {
      dispatch_group_t v40 = v75;
      dispatch_group_enter(v75);
      sub_10004F1E0();
      id v41 = HKLogActivity;
      sub_10004E4E0();

      v79(v36, (char *)v26, v27);
      uint64_t v42 = swift_allocObject();
      v76(v42 + v56, v36, v27);
      *(void *)(v42 + v58) = v40;
      uint64_t v43 = v40;
      sub_100013CC0(v26, 0, sub_10000B710, v42);
      swift_release();
    }
LABEL_7:
    sub_10000B4A8();
    unsigned __int8 v44 = (void *)sub_10004F230();
    uint64_t v45 = v60;
    long long v46 = *(_OWORD *)((char *)v60 + 8);
    long long v83 = *(_OWORD *)((char *)v60 + 24);
    long long v84 = v46;
    sub_10000B630((uint64_t)v60 + 40, (uint64_t)&v82, &qword_100061358);
    uint64_t v47 = swift_allocObject();
    uint64_t v48 = v61;
    *(void *)(v47 + 16) = v59;
    *(void *)(v47 + 24) = v48;
    long long v49 = v45[1];
    *(_OWORD *)(v47 + 32) = *v45;
    *(_OWORD *)(v47 + 48) = v49;
    *(_OWORD *)(v47 + 64) = v45[2];
    aBlock[4] = sub_10000B700;
    aBlock[5] = v47;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000112DC;
    aBlock[3] = &unk_10005E680;
    int v50 = _Block_copy(aBlock);
    swift_retain();
    sub_10000A814((uint64_t)&v84);
    sub_10000A814((uint64_t)&v83);
    sub_10000A840(&v82);
    uint64_t v51 = v63;
    sub_10004EF00();
    v80 = &_swiftEmptyArrayStorage;
    sub_10000B6B4(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004F98((uint64_t *)&unk_100061960);
    sub_10000B580();
    v52 = v65;
    uint64_t v53 = v68;
    sub_10004F2F0();
    dispatch_group_t v54 = v75;
    sub_10004F1F0();
    _Block_release(v50);

    (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v53);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v51, v66);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v26, v27);
    return (id)swift_release();
  }
  __break(1u);
  return result;
}

void sub_100008FF8(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  sub_10004F1E0();
  uint64_t v5 = (void *)HKLogActivity;
  sub_100004F98(&qword_100061368);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004FC80;
  id v7 = v5;
  sub_10004E3D0();
  *(void *)(v6 + 56) = &type metadata for Double;
  *(void *)(v6 + 64) = &protocol witness table for Double;
  *(double *)(v6 + 32) = -v8;
  sub_100004F98(&qword_100061380);
  uint64_t v9 = sub_10004F290();
  uint64_t v11 = v10;
  *(void *)(v6 + 96) = &type metadata for String;
  *(void *)(v6 + 104) = sub_10000B5DC();
  *(void *)(v6 + 72) = v9;
  *(void *)(v6 + 80) = v11;
  sub_10004E4E0();

  swift_bridgeObjectRelease();
  sub_10004F1E0();
  id v12 = HKLogActivity;
  sub_10004E4E0();

  dispatch_group_leave(a4);
}

void sub_100009164(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  sub_10004F1E0();
  uint64_t v5 = (void *)HKLogActivity;
  sub_100004F98(&qword_100061368);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004FC80;
  id v7 = v5;
  sub_10004E3D0();
  *(void *)(v6 + 56) = &type metadata for Double;
  *(void *)(v6 + 64) = &protocol witness table for Double;
  *(double *)(v6 + 32) = -v8;
  sub_100004F98(&qword_100061380);
  uint64_t v9 = sub_10004F290();
  uint64_t v11 = v10;
  *(void *)(v6 + 96) = &type metadata for String;
  *(void *)(v6 + 104) = sub_10000B5DC();
  *(void *)(v6 + 72) = v9;
  *(void *)(v6 + 80) = v11;
  sub_10004E4E0();

  swift_bridgeObjectRelease();
  dispatch_group_leave(a4);
}

void sub_10000927C(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  sub_10004F1E0();
  uint64_t v5 = (void *)HKLogActivity;
  sub_100004F98(&qword_100061368);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004FC80;
  id v7 = v5;
  sub_10004E3D0();
  *(void *)(v6 + 56) = &type metadata for Double;
  *(void *)(v6 + 64) = &protocol witness table for Double;
  *(double *)(v6 + 32) = -v8;
  sub_100004F98(&qword_100061380);
  uint64_t v9 = sub_10004F290();
  uint64_t v11 = v10;
  *(void *)(v6 + 96) = &type metadata for String;
  *(void *)(v6 + 104) = sub_10000B5DC();
  *(void *)(v6 + 72) = v9;
  *(void *)(v6 + 80) = v11;
  sub_10004E4E0();

  swift_bridgeObjectRelease();
  dispatch_group_leave(a4);
}

uint64_t sub_10000939C(void (*a1)(void), uint64_t a2)
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_10004F020();
  __chkstk_darwin(v3 - 8);
  uint64_t v43 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v41);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004F98(&qword_100061280);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_10004E400();
  uint64_t v10 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  id v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004F98(&qword_100061350);
  uint64_t v45 = *(void *)(v13 - 8);
  uint64_t v46 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000611F8 != -1) {
    swift_once();
  }
  sub_100004F98((uint64_t *)&unk_100061990);
  sub_10004F240();
  uint64_t v16 = v47;
  if (v47 && (BOOL v17 = sub_10001ED58(), v16, v17))
  {
    sub_100004F98(&qword_100061360);
    uint64_t v18 = type metadata accessor for FitnessWidgetProvider.ActivityEntry();
    dispatch_group_t v40 = a1;
    uint64_t v19 = (int *)v18;
    unint64_t v20 = (*(unsigned __int8 *)(*(void *)(v18 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v18 - 8) + 80);
    uint64_t v21 = swift_allocObject();
    uint64_t v38 = v12;
    uint64_t v39 = v21;
    *(_OWORD *)(v21 + 16) = xmmword_10004FC90;
    unint64_t v22 = v21 + v20;
    sub_10004E3F0();
    sub_100014D54((uint64_t)v9);
    uint64_t v23 = sub_10004F040();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v9, 0, 1, v23);
    sub_10004F240();
    uint64_t v37 = v47;
    uint64_t v24 = (uint64_t)v6;
    sub_10004F240();
    sub_100004F98(&qword_1000613A0);
    sub_10004F240();
    NSString v25 = v47;
    char v26 = *(unsigned char *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v22, v38, v42);
    sub_10000B630((uint64_t)v9, v22 + v19[5], &qword_100061280);
    *(void *)(v22 + v19[6]) = v37;
    sub_10000B630(v24, v22 + v19[7], (uint64_t *)&unk_100061980);
    *(void *)(v22 + v19[8]) = v25;
    *(unsigned char *)(v22 + v19[9]) = 0;
    *(unsigned char *)(v22 + v19[10]) = v26;
    sub_10004F010();
    sub_10000B6B4(qword_100061338, (void (*)(uint64_t))type metadata accessor for FitnessWidgetProvider.ActivityEntry);
    a1 = v40;
    sub_10004F070();
    sub_10004F1E0();
    id v27 = HKLogActivity;
    sub_10004E4E0();
  }
  else
  {
    sub_10004F1E0();
    id v28 = HKLogActivity;
    sub_10004E4E0();

    sub_100004F98(&qword_100061360);
    uint64_t v29 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry();
    unint64_t v30 = (*(unsigned __int8 *)(*((void *)v29 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v29 - 1) + 80);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_10004FC90;
    unint64_t v32 = v31 + v30;
    sub_10004E3F0();
    unint64_t v33 = v32 + v29[5];
    uint64_t v34 = sub_10004F040();
    (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 1, 1, v34);
    (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v32 + v29[7], 1, 1, v42);
    char v35 = *(unsigned char *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    *(void *)(v32 + v29[6]) = 0;
    *(void *)(v32 + v29[8]) = 0;
    *(unsigned char *)(v32 + v29[9]) = 1;
    *(unsigned char *)(v32 + v29[10]) = v35;
    sub_10004F010();
    sub_10000B6B4(qword_100061338, (void (*)(uint64_t))type metadata accessor for FitnessWidgetProvider.ActivityEntry);
    sub_10004F070();
  }
  a1(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v15, v46);
}

uint64_t sub_100009B0C@<X0>(uint64_t a1@<X8>)
{
  sub_10000B630(v1 + 40, (uint64_t)v13, &qword_100061358);
  sub_10000B630((uint64_t)v13, (uint64_t)&v14, &qword_100061358);
  uint64_t v3 = v14;
  if (v14)
  {
    NSString v4 = sub_10004F0D0();
    id v5 = [v3 objectForKey:v4];

    if (v5)
    {
      sub_10004F2E0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v10, 0, sizeof(v10));
    }
    sub_10000B630((uint64_t)v10, (uint64_t)&v11, &qword_100061390);
    if (*((void *)&v12 + 1))
    {
      uint64_t v6 = sub_10004E400();
      int v7 = swift_dynamicCast();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, v7 ^ 1u, 1, v6);
    }
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_100005100((uint64_t)&v11, &qword_100061390);
  uint64_t v9 = sub_10004E400();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
}

uint64_t sub_100009C94(double a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  sub_10004F1E0();
  id v5 = (void *)HKLogActivity;
  sub_100004F98(&qword_100061368);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004FC90;
  *(void *)(v6 + 56) = &type metadata for Double;
  *(void *)(v6 + 64) = &protocol witness table for Double;
  *(double *)(v6 + 32) = a1;
  id v7 = v5;
  sub_10004E4E0();

  uint64_t v8 = swift_bridgeObjectRelease();
  return a3(v8);
}

void sub_100009D6C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100009DD4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = a4;
  uint64_t v39 = a6;
  uint64_t v36 = a5;
  uint64_t v37 = sub_10004EEF0();
  uint64_t v7 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004EF10();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    sub_10004F1C0();
    uint64_t v35 = v11;
    uint64_t v14 = (void *)HKLogActivity;
    sub_100004F98(&qword_100061368);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10004FC80;
    id v16 = v14;
    sub_10004E3D0();
    *(void *)(v15 + 56) = &type metadata for Double;
    *(void *)(v15 + 64) = &protocol witness table for Double;
    *(double *)(v15 + 32) = -v17;
    aBlock[0] = a2;
    sub_100004F98(&qword_100061380);
    uint64_t v18 = sub_10004F290();
    uint64_t v20 = v19;
    *(void *)(v15 + 96) = &type metadata for String;
    *(void *)(v15 + 104) = sub_10000B5DC();
    *(void *)(v15 + 72) = v18;
    *(void *)(v15 + 80) = v20;
    uint64_t v11 = v35;
    sub_10004E4E0();
  }
  else
  {
    sub_10004F1E0();
    uint64_t v21 = (void *)HKLogActivity;
    sub_100004F98(&qword_100061368);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_10004FC90;
    id v23 = v21;
    sub_10004E3D0();
    *(void *)(v22 + 56) = &type metadata for Double;
    *(void *)(v22 + 64) = &protocol witness table for Double;
    *(double *)(v22 + 32) = -v24;
    sub_10004E4E0();
  }
  swift_bridgeObjectRelease();
  sub_10000B4A8();
  NSString v25 = (void *)sub_10004F230();
  char v26 = (void *)swift_allocObject();
  id v27 = v38;
  uint64_t v28 = v39;
  uint64_t v29 = v36;
  v26[2] = v38;
  v26[3] = v29;
  v26[4] = v28;
  aBlock[4] = sub_10000B528;
  aBlock[5] = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000112DC;
  aBlock[3] = &unk_10005E5E0;
  unint64_t v30 = _Block_copy(aBlock);
  id v31 = v27;
  swift_retain();
  swift_release();
  sub_10004EF00();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000B6B4(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_10000B580();
  uint64_t v32 = v37;
  sub_10004F2F0();
  sub_10004F250();
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_10000A224(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_10000A29C@<X0>(uint64_t a1@<X8>)
{
  sub_10004E3F0();
  uint64_t v2 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  uint64_t v3 = a1 + v2[5];
  uint64_t v4 = sub_10004F040();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = a1 + v2[7];
  uint64_t v6 = sub_10004E400();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  if (qword_1000611F8 != -1) {
    uint64_t result = swift_once();
  }
  char v8 = *(unsigned char *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
  *(void *)(a1 + v2[6]) = 0;
  *(void *)(a1 + v2[8]) = 0;
  *(unsigned char *)(a1 + v2[9]) = 1;
  *(unsigned char *)(a1 + v2[10]) = v8;
  return result;
}

uint64_t sub_10000A3D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006EFC(a1, a2, a3);
}

uint64_t sub_10000A40C(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_100007B34(a1, a2, a3);
}

uint64_t sub_10000A448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000A4FC;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000A4FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000BB84;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10000A6A4()
{
  uint64_t v1 = sub_10004F060();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6 + 48, v5);
}

id sub_10000A778()
{
  uint64_t v1 = *(void *)(sub_10004F060() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + v3 + 8);

  return sub_100008684(v0 + v2, v4, v5, (_OWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_10000A814(uint64_t a1)
{
  return a1;
}

id *sub_10000A840(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_10000A86C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A8A4(uint64_t a1)
{
  return sub_100009C94(*(double *)(v1 + 16), a1, *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_10000A8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A8C0()
{
  return swift_release();
}

uint64_t sub_10000A8C8()
{
  uint64_t v1 = sub_10004E400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();

  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_10000A988(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10004E400() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v2 + v6;
  uint64_t v9 = *(void **)(v2 + v7);
  uint64_t v10 = (uint64_t *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];

  return sub_100009DD4(a1, a2, v8, v9, v11, v12);
}

size_t sub_10000AA44(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_10000AA64(a1, a2, a3, a4, &qword_1000613C0, (uint64_t (*)(void))&type metadata accessor for Date);
}

size_t sub_10000AA64(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    id v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004F98(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  id v16 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

size_t sub_10000AC40(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_10000AC68(a1, a2, a3, a4, &qword_1000613C8, (uint64_t *)&unk_100061980);
}

size_t sub_10000AC54(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_10000AC68(a1, a2, a3, a4, &qword_1000613B0, &qword_1000613B8);
}

size_t sub_10000AC68(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    id v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004F98(a5);
  uint64_t v13 = *(void *)(sub_100004F98(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  id v16 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(sub_100004F98(a6) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

char *sub_10000AE3C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004F98(&qword_1000613A8);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000AF38(uint64_t a1)
{
  uint64_t v2 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v2 - 8);
  uint64_t v39 = (uint64_t)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004F98(&qword_100061280);
  __chkstk_darwin(v4 - 8);
  uint64_t v38 = (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  uint64_t v37 = *((void *)v6 - 1);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_10004E400();
  uint64_t v9 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  int64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v33 - v13;
  uint64_t result = sub_10004E3F0();
  if (a1 < 0)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  uint64_t v34 = v9;
  if (a1)
  {
    uint64_t v16 = 0;
    double v17 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v18 = (void (**)(char *, char *, uint64_t))(v9 + 32);
    unint64_t v19 = &_swiftEmptyArrayStorage;
    double v20 = 0.0;
    uint64_t v35 = a1;
    while (v16 != a1)
    {
      uint64_t v21 = 0;
      uint64_t v36 = v16 + 1;
      double v22 = v20;
      do
      {
        double v23 = *(double *)((char *)&off_10005E078 + v21 + 32);
        double v24 = *(double *)((char *)&off_10005E078 + v21 + 40);
        double v25 = *(double *)((char *)&off_10005E078 + v21 + 48);
        double v26 = *(double *)((char *)&off_10005E078 + v21 + 56);
        double v27 = *(double *)((char *)&off_10005E078 + v21 + 64);
        double v20 = v22 + 1.0;
        sub_10004E3B0();
        uint64_t v28 = sub_10004F040();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v38, 1, 1, v28);
        id v29 = 0;
        if (v23 >= 0.0) {
          id v29 = sub_10001F778(v23, v24, v25, v26, v27);
        }
        uint64_t result = (*v17)(v39, 1, 1, v40);
        if (v23 >= 0.0)
        {
          if ((~*(void *)&v22 & 0x7FF0000000000000) == 0)
          {
            __break(1u);
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
            goto LABEL_26;
          }
          if (v22 <= -9.22337204e18) {
            goto LABEL_24;
          }
          if (v22 >= 9.22337204e18) {
            goto LABEL_25;
          }
          id v30 = sub_10001FD30((uint64_t)v22 % 14);
        }
        else
        {
          id v30 = 0;
        }
        (*v18)(v8, v11, v40);
        sub_10000B630(v38, (uint64_t)&v8[v6[5]], &qword_100061280);
        *(void *)&v8[v6[6]] = v29;
        sub_10000B630(v39, (uint64_t)&v8[v6[7]], (uint64_t *)&unk_100061980);
        *(void *)&v8[v6[8]] = v30;
        v8[v6[9]] = 0;
        v8[v6[10]] = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v19 = (void *)sub_10000AA64(0, v19[2] + 1, 1, v19, &qword_100061360, (uint64_t (*)(void))type metadata accessor for FitnessWidgetProvider.ActivityEntry);
        }
        unint64_t v32 = v19[2];
        unint64_t v31 = v19[3];
        if (v32 >= v31 >> 1) {
          unint64_t v19 = (void *)sub_10000AA64(v31 > 1, v32 + 1, 1, v19, &qword_100061360, (uint64_t (*)(void))type metadata accessor for FitnessWidgetProvider.ActivityEntry);
        }
        v19[2] = v32 + 1;
        uint64_t result = sub_10000B440((uint64_t)v8, (uint64_t)v19+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(void *)(v37 + 72) * v32);
        v21 += 40;
        double v22 = v22 + 1.0;
      }
      while (v21 != 560);
      a1 = v35;
      uint64_t v16 = v36;
      if (v36 == v35) {
        goto LABEL_22;
      }
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v19 = &_swiftEmptyArrayStorage;
LABEL_22:
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v40);
  return (uint64_t)v19;
}

uint64_t sub_10000B440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B4A8()
{
  unint64_t result = qword_100061950;
  if (!qword_100061950)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100061950);
  }
  return result;
}

uint64_t sub_10000B4E8()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_10000B528()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 24);
  id result = [v1 isValid];
  if (result) {
    return (id)v2([v1 invalidate]);
  }
  return result;
}

unint64_t sub_10000B580()
{
  unint64_t result = qword_100061378;
  if (!qword_100061378)
  {
    sub_1000053B0((uint64_t *)&unk_100061960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061378);
  }
  return result;
}

unint64_t sub_10000B5DC()
{
  unint64_t result = qword_100061388;
  if (!qword_100061388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061388);
  }
  return result;
}

uint64_t sub_10000B630(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004F98(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_10000B698(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000B6B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000B700()
{
  return sub_10000939C(*(void (**)(void))(v0 + 16), *(void *)(v0 + 24));
}

void sub_10000B710(uint64_t a1, uint64_t a2)
{
}

void sub_10000B71C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10004E400() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_10000927C(a1, a2, v2 + v6, *(NSObject **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

id sub_10000B7C4@<X0>(void *a1@<X8>)
{
  return sub_10001132C(v1, a1);
}

uint64_t sub_10000B7E0@<X0>(uint64_t a1@<X8>)
{
  return sub_100011438(v1, a1);
}

id sub_10000B7FC@<X0>(void *a1@<X8>)
{
  return sub_10001192C(v1, a1);
}

void sub_10000B81C(uint64_t a1, uint64_t a2)
{
}

void sub_10000B830(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10004E400() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100008FF8(a1, a2, v2 + v6, *(NSObject **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_10000B8EC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000B8FC()
{
  uint64_t v1 = sub_10004E400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_10000B9A0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10004E400() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100009164(a1, a2, v2 + v6, *(NSObject **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_10000BA44()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10000BA94()
{
  return sub_100007690(*(void (**)(char *))(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000BAA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000BAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100061280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000BB88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100004F98(&qword_1000613D0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)v4 + v8);
    int64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10000BC70(uint64_t a1)
{
  uint64_t v2 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_10000BCF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_10000BD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000BE50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_10000BED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_10000BF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BF90);
}

uint64_t sub_10000BF90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_1000613D0);
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

uint64_t sub_10000C058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C06C);
}

uint64_t sub_10000C06C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004F98(&qword_1000613D0);
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

uint64_t type metadata accessor for HeaderLabel()
{
  uint64_t result = qword_100061430;
  if (!qword_100061430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C17C()
{
  sub_10000C220();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000C220()
{
  if (!qword_100061440)
  {
    sub_10000C27C();
    unint64_t v0 = sub_10004E570();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100061440);
    }
  }
}

unint64_t sub_10000C27C()
{
  unint64_t result = qword_100061448;
  if (!qword_100061448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061448);
  }
  return result;
}

uint64_t sub_10000C2D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C2EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100004F98(&qword_100061480);
  __chkstk_darwin(v3 - 8);
  int v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t *)(v1 + *(int *)(type metadata accessor for HeaderLabel() + 20));
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  uint64_t v32 = v8;
  uint64_t v33 = v7;
  sub_10000C56C();
  uint64_t v32 = sub_10004F2B0();
  uint64_t v33 = v9;
  uint64_t v10 = sub_10004EBE0();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  uint64_t v15 = sub_10004EB50();
  uint64_t v17 = v16;
  v31[1] = v18;
  char v20 = v19 & 1;
  sub_10000C5C0(v10, v12, v14);
  swift_bridgeObjectRelease();
  sub_100004F98(&qword_1000613D0);
  sub_10004E560();
  sub_10004EA70();
  uint64_t v21 = enum case for Font.Design.rounded(_:);
  uint64_t v22 = sub_10004EA50();
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v5, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v5, 0, 1, v22);
  sub_10004EA80();
  sub_10000C5D0((uint64_t)v5);
  uint64_t v24 = sub_10004EB90();
  uint64_t v26 = v25;
  LOBYTE(v22) = v27;
  uint64_t v29 = v28;
  swift_release();
  sub_10000C5C0(v15, v17, v20);
  swift_bridgeObjectRelease();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v24;
  *(void *)(a1 + 8) = v26;
  *(unsigned char *)(a1 + 16) = v22 & 1;
  *(void *)(a1 + 24) = v29;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

unint64_t sub_10000C56C()
{
  unint64_t result = qword_100061488;
  if (!qword_100061488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061488);
  }
  return result;
}

uint64_t sub_10000C5C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000C5D0(uint64_t a1)
{
  uint64_t v2 = sub_100004F98(&qword_100061480);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000C63C()
{
  unint64_t result = qword_100061490;
  if (!qword_100061490)
  {
    sub_1000053B0(&qword_100061498);
    sub_10000C6B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061490);
  }
  return result;
}

unint64_t sub_10000C6B8()
{
  unint64_t result = qword_1000614A0;
  if (!qword_1000614A0)
  {
    sub_1000053B0(&qword_1000614A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000614A0);
  }
  return result;
}

uint64_t destroy for StandChart()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StandChart(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StandChart(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for StandChart(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for StandChart(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for StandChart(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StandChart(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StandChart()
{
  return &type metadata for StandChart;
}

uint64_t sub_10000C8E0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_10000C8FC(uint64_t a1)
{
}

void sub_10000C910(uint64_t a1)
{
}

void sub_10000C924(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v5 = [self sedentaryColors];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [v5 *a2];

    if (v7)
    {
      *a3 = sub_10004ED20();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10000C9A8()
{
  uint64_t v0 = sub_10004ECB0();
  __n128 v1 = __chkstk_darwin(v0);
  (*(void (**)(char *, void, __n128))(v3 + 104))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:), v1);
  uint64_t result = sub_10004ED10();
  qword_1000614C0 = result;
  return result;
}

uint64_t sub_10000CA7C@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v66 = a6;
  uint64_t v67 = a5;
  int v54 = a3;
  int v55 = a1;
  uint64_t v8 = sub_10004E970();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v65 = v8;
  __chkstk_darwin(v8);
  long long v63 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_10004E830();
  uint64_t v59 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  unint64_t v58 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004E600();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  char v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004F98(&qword_1000614C8);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100004F98(&qword_1000614D0);
  __chkstk_darwin(v50);
  char v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100004F98(&qword_1000614D8);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v56 = v20;
  uint64_t v57 = v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100004F98(&qword_1000614E0);
  uint64_t v62 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v53 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10000F044(a2, a4);
  uint64_t v51 = a2;
  uint64_t v52 = a4;
  unint64_t v26 = sub_10000EA00(a2, a4);
  *(void *)uint64_t v17 = sub_10004E8D0();
  *((void *)v17 + 1) = 0x4008000000000000;
  v17[16] = 0;
  char v27 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))&v17[*(int *)(sub_100004F98(&qword_1000614E8) + 44)];
  v54 &= 0x101u;
  uint64_t v28 = a4;
  uint64_t v29 = v26;
  sub_10000D0AC(a2, v54, v28, v67, (uint64_t)v25, v26, v55, v27);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for LayoutDirection.leftToRight(_:), v11);
  uint64_t v31 = v50;
  uint64_t v32 = (uint64_t *)&v19[*(int *)(v50 + 36)];
  uint64_t v33 = sub_100004F98(&qword_1000614F0);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))((char *)v32 + *(int *)(v33 + 28), v14, v11);
  *uint64_t v32 = KeyPath;
  sub_10000509C((uint64_t)v17, (uint64_t)v19, &qword_1000614C8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_100005100((uint64_t)v17, &qword_1000614C8);
  uint64_t v35 = v58;
  uint64_t v34 = v59;
  uint64_t v36 = v61;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v58, enum case for ColorRenderingMode.nonLinear(_:), v61);
  unint64_t v37 = sub_10000F318();
  sub_10004EC30();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  sub_100005100((uint64_t)v19, &qword_1000614D0);
  uint64_t v38 = v63;
  sub_10004E950();
  uint64_t v68 = v31;
  unint64_t v69 = v37;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v40 = v53;
  uint64_t v41 = v56;
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v38, v65);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v23, v41);
  sub_10000DD6C(v29, v51, v54, v52);
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  LOBYTE(v14) = v46 & 1;
  swift_bridgeObjectRelease();
  uint64_t v68 = v41;
  unint64_t v69 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v47 = v60;
  sub_10004EC50();
  sub_10000C5C0(v43, v45, (char)v14);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v40, v47);
}

uint64_t sub_10000D0AC@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t (**a8)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  int v25 = a7;
  uint64_t v26 = a6;
  char v27 = a8;
  uint64_t v13 = sub_100004F98(&qword_100061528);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = &v24[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  uint64_t v18 = &v24[-v17];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(unsigned char *)(v19 + 24) = a2 & 1;
  *(unsigned char *)(v19 + 25) = HIBYTE(a2) & 1;
  *(void *)(v19 + 32) = a3;
  *(void *)(v19 + 40) = a4;
  *(void *)(v19 + 48) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_10004E810();
  *(void *)uint64_t v18 = result;
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_100004F98(&qword_100061530);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a1;
    *(unsigned char *)(v21 + 24) = a2 & 1;
    *(unsigned char *)(v21 + 25) = HIBYTE(a2) & 1;
    *(void *)(v21 + 32) = a3;
    *(void *)(v21 + 40) = a4;
    *(void *)(v21 + 48) = v26;
    *(unsigned char *)(v21 + 56) = v25 & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100004F98(&qword_100061538);
    sub_10000FE30();
    sub_10004EDF0();
    sub_10000509C((uint64_t)v18, (uint64_t)v15, &qword_100061528);
    uint64_t v22 = v27;
    *char v27 = sub_10000FD88;
    v22[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v19;
    uint64_t v23 = sub_100004F98(&qword_100061550);
    sub_10000509C((uint64_t)v15, (uint64_t)v22 + *(int *)(v23 + 48), &qword_100061528);
    swift_retain();
    sub_100005100((uint64_t)v18, &qword_100061528);
    sub_100005100((uint64_t)v15, &qword_100061528);
    return swift_release();
  }
  return result;
}

uint64_t sub_10000D2E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = sub_10004E820();
  *(void *)(a7 + 8) = 0;
  *(unsigned char *)(a7 + 16) = 0;
  uint64_t v14 = sub_100004F98(&qword_100061558);
  return sub_10000D374(a2, a3 & 0x101, a4, a5, a1, a6, a7 + *(int *)(v14 + 44));
}

uint64_t sub_10000D374@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v46 = a5;
  uint64_t v47 = a6;
  uint64_t v49 = a4;
  uint64_t v50 = a1;
  int v48 = a2;
  uint64_t v9 = sub_10004E5B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004F98(&qword_100061560);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v36 - v18;
  sub_10004EE50();
  uint64_t result = sub_10004E590();
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v44 = v55;
    uint64_t v45 = v56;
    int v43 = v54;
    uint64_t v42 = v53;
    int v41 = v52;
    uint64_t v40 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v46, v9);
    uint64_t v21 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v37 = v14;
    uint64_t v38 = v19;
    uint64_t v46 = v13;
    uint64_t v22 = (v21 + 48) & ~v21;
    uint64_t v39 = v16;
    uint64_t v23 = v47;
    unint64_t v24 = (v11 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v50;
    char v26 = BYTE1(v48);
    *(unsigned char *)(v25 + 24) = v48 & 1;
    *(unsigned char *)(v25 + 25) = v26 & 1;
    uint64_t v27 = v49;
    *(void *)(v25 + 32) = a3;
    *(void *)(v25 + 40) = v27;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v25 + v22, v12, v9);
    *(void *)(v25 + v24) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100004F98(&qword_100061568);
    sub_10000566C(&qword_100061570, &qword_100061568);
    uint64_t v28 = v38;
    sub_10004EDF0();
    uint64_t v29 = v37;
    id v30 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
    uint64_t v31 = v39;
    uint64_t v32 = v46;
    v30(v39, v28, v46);
    *(unsigned char *)a7 = 2;
    *(void *)(a7 + 8) = v40;
    *(unsigned char *)(a7 + 16) = v41;
    *(void *)(a7 + 24) = v42;
    *(unsigned char *)(a7 + 32) = v43;
    uint64_t v33 = v45;
    *(void *)(a7 + 40) = v44;
    *(void *)(a7 + 48) = v33;
    uint64_t v34 = sub_100004F98(&qword_100061578);
    v30((char *)(a7 + *(int *)(v34 + 48)), v31, v32);
    uint64_t v35 = *(void (**)(char *, uint64_t))(v29 + 8);
    v35(v28, v32);
    return ((uint64_t (*)(char *, uint64_t))v35)(v31, v32);
  }
  return result;
}

id sub_10000D710@<X0>(unint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  if (qword_100061128 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1000614B8;
  uint64_t v11 = qword_100061120;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1000614B0;
  swift_retain();
  id result = (id)sub_10004E5A0();
  double v15 = v14;
  double v16 = 0.0;
  if (a4)
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (*(void *)(a4 + 16) <= a1)
    {
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      return result;
    }
    id result = *(id *)(a4 + 8 * a1 + 32);
    if (result)
    {
      id result = [result state];
      double v17 = 0.4;
      if (result != (id)1) {
        double v17 = 0.0;
      }
      if (result) {
        double v16 = v17;
      }
      else {
        double v16 = 1.0;
      }
    }
  }
  if (__OFADD__(a1, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (!a3)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a2 == 0x8000000000000000 && a3 == -1) {
    goto LABEL_30;
  }
  uint64_t v18 = a2 / a3;
  if (!(a2 / a3)) {
    goto LABEL_27;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL && v18 == -1) {
    goto LABEL_31;
  }
  double v19 = (v15 + -2.0 - (double)a2 + 1.0) / (double)a2;
  if ((uint64_t)(a1 + 1) % v18) {
    char v20 = 1;
  }
  else {
    char v20 = 2;
  }
  sub_10004EE50();
  id result = (id)sub_10004E590();
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v12;
  *(double *)(a5 + 16) = v19;
  *(double *)(a5 + 24) = v16;
  *(unsigned char *)(a5 + 32) = v20;
  *(void *)(a5 + 40) = v21;
  *(unsigned char *)(a5 + 48) = v22;
  *(void *)(a5 + 56) = v23;
  *(unsigned char *)(a5 + 64) = v24;
  *(_OWORD *)(a5 + 72) = v25;
  return result;
}

void sub_10000D924(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, int a5@<W6>, uint64_t a6@<X8>)
{
  int v36 = a5;
  uint64_t v11 = sub_100004F98(&qword_100061480);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v14 - 8);
  double v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for StandChart.LegendLabel();
  __chkstk_darwin(v17);
  double v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v22 = __chkstk_darwin(v20);
  char v24 = (char *)&v35 - v23;
  if (!a3)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (a2 == 0x8000000000000000 && a3 == -1) {
    goto LABEL_19;
  }
  uint64_t v25 = a2 / a3;
  if (!(a2 / a3))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (a1 == 0x8000000000000000 && v25 == -1) {
    goto LABEL_20;
  }
  if (!(a1 % v25))
  {
    uint64_t v35 = v21;
    if (!a4)
    {
      uint64_t v29 = sub_10004E400();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v16, 1, 1, v29);
      goto LABEL_16;
    }
    if ((a1 & 0x8000000000000000) == 0)
    {
      if (*(void *)(a4 + 16) > (unint64_t)a1)
      {
        uint64_t v27 = sub_10004E400();
        uint64_t v28 = *(void *)(v27 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v16, a4+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * a1, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v16, 0, 1, v27);
LABEL_16:
        sub_10000FD18((uint64_t)v16, (uint64_t)v19);
        v19[*(int *)(v17 + 20)] = v36 & 1;
        uint64_t v30 = *(int *)(v17 + 24);
        sub_10004EA70();
        uint64_t v31 = enum case for Font.Design.rounded(_:);
        uint64_t v32 = sub_10004EA50();
        uint64_t v33 = *(void *)(v32 - 8);
        (*(void (**)(char *, uint64_t, uint64_t))(v33 + 104))(v13, v31, v32);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v13, 0, 1, v32);
        uint64_t v34 = sub_10004EA80();
        sub_100005100((uint64_t)v13, &qword_100061480);
        *(void *)&v19[v30] = v34;
        sub_10000FF20((uint64_t)v19, (uint64_t)v24);
        sub_10000FF20((uint64_t)v24, a6);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(a6, 0, 1, v17);
        return;
      }
LABEL_22:
      __break(1u);
      return;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v21 + 56);

  v26(a6, 1, 1, v17, v22);
}

void sub_10000DD6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000F3DC(0, a4, a1, a2);
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      int v37 = a3;
      uint64_t v39 = &_swiftEmptyArrayStorage;
      sub_10002B8FC(0, v14, 0);
      uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
      v36[1] = v13;
      uint64_t v16 = v13 + ((v15 + 32) & ~v15);
      uint64_t v17 = *(void *)(v9 + 72);
      uint64_t v18 = v39;
      uint64_t v38 = v17;
      do
      {
        sub_10000509C(v16, (uint64_t)v11, (uint64_t *)&unk_100061980);
        uint64_t v19 = sub_10000F910((uint64_t)v11);
        uint64_t v21 = v20;
        sub_100005100((uint64_t)v11, (uint64_t *)&unk_100061980);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10002B8FC(0, v18[2] + 1, 1);
          uint64_t v17 = v38;
          uint64_t v18 = v39;
        }
        unint64_t v23 = v18[2];
        unint64_t v22 = v18[3];
        if (v23 >= v22 >> 1)
        {
          sub_10002B8FC((char *)(v22 > 1), v23 + 1, 1);
          uint64_t v17 = v38;
          uint64_t v18 = v39;
        }
        v18[2] = v23 + 1;
        char v24 = (char *)&v18[2 * v23];
        *((void *)v24 + 4) = v19;
        *((void *)v24 + 5) = v21;
        v16 += v17;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = &_swiftEmptyArrayStorage;
    }
    id v25 = [self mainBundle];
    NSString v26 = sub_10004F0D0();
    NSString v27 = sub_10004F0D0();
    id v28 = [v25 localizedStringForKey:v26 value:0 table:v27];

    sub_10004F0F0();
    sub_100004F98(&qword_100061368);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10004FC90;
    uint64_t v39 = v18;
    sub_100004F98(&qword_100061510);
    sub_10000566C(&qword_100061518, &qword_100061510);
    uint64_t v30 = sub_10004F0A0();
    uint64_t v32 = v31;
    swift_bridgeObjectRelease();
    *(void *)(v29 + 56) = &type metadata for String;
    *(void *)(v29 + 64) = sub_10000B5DC();
    *(void *)(v29 + 32) = v30;
    *(void *)(v29 + 40) = v32;
    uint64_t v33 = sub_10004F0E0();
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v39 = (void *)v33;
    uint64_t v40 = v35;
    sub_10000C56C();
    sub_10004EBE0();
  }
}

uint64_t sub_10000E164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  if (a4 <= 5.0) {
    double v7 = a4;
  }
  else {
    double v7 = 5.0;
  }
  sub_100004F98(&qword_100061630);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10004FC80;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  uint64_t v19 = v8;
  sub_10004F180();
  swift_retain();
  swift_retain();
  sub_10004EE00();
  sub_10004EED0();
  sub_10004EEC0();
  sub_10004E5C0();
  sub_10004EE50();
  sub_10004E590();
  char v9 = sub_10004E9D0();
  uint64_t result = sub_10004E510();
  *(double *)a3 = v7;
  *(double *)(a3 + 8) = v7;
  *(void *)(a3 + 16) = v15;
  *(_OWORD *)(a3 + 24) = v16;
  *(void *)(a3 + 40) = v17;
  *(void *)(a3 + 48) = v18;
  *(_WORD *)(a3 + 56) = 256;
  *(void *)(a3 + 64) = v19;
  *(unsigned char *)(a3 + 72) = v20;
  *(void *)(a3 + 80) = v21;
  *(unsigned char *)(a3 + 88) = v22;
  *(void *)(a3 + 96) = v23;
  *(void *)(a3 + 104) = v24;
  *(unsigned char *)(a3 + 112) = v9;
  *(void *)(a3 + 120) = v11;
  *(void *)(a3 + 128) = v12;
  *(void *)(a3 + 136) = v13;
  *(void *)(a3 + 144) = v14;
  *(unsigned char *)(a3 + 152) = 0;
  return result;
}

uint64_t sub_10000E314@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E164(*(void *)v1, *(void *)(v1 + 8), a1, *(double *)(v1 + 16));
}

double sub_10000E320@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004E8A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004EB20();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for RoundedCornerStyle.continuous(_:), v2);
  uint64_t v11 = 0x3FF0000000000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0x3FF0000000000000;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  sub_10004EB00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v6 = v10;
  double result = *(double *)v9;
  long long v8 = v9[1];
  *(_OWORD *)a1 = v9[0];
  *(_OWORD *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_10000E488()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_10000E4A0(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004E4F0();
  return sub_10000E510;
}

void sub_10000E510(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_10000E55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100011284();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000E5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100011284();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000E624(uint64_t a1)
{
  unint64_t v2 = sub_100011284();

  return Shape.body.getter(a1, v2);
}

uint64_t sub_10000E670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for StandChart.LegendLabel();
  if (*(unsigned char *)(a1 + *(int *)(v4 + 20)) == 1)
  {
    id v5 = [self mainBundle];
    NSString v6 = sub_10004F0D0();
    NSString v7 = sub_10004F0D0();
    id v8 = [v5 localizedStringForKey:v6 value:0 table:v7];

    sub_10004F0F0();
  }
  else
  {
    sub_10000F910(a1);
  }
  sub_10000C56C();
  uint64_t v9 = sub_10004EBE0();
  uint64_t v22 = v10;
  uint64_t v23 = v9;
  char v12 = v11;
  uint64_t v21 = v13;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v14 = *(void *)(a1 + *(int *)(v4 + 24));
  uint64_t v15 = swift_getKeyPath();
  uint64_t v16 = qword_100061130;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_1000614C0;
  uint64_t v18 = swift_getKeyPath();
  uint64_t v19 = swift_getKeyPath();
  *(void *)a2 = v23;
  *(void *)(a2 + 8) = v22;
  *(unsigned char *)(a2 + 16) = v12 & 1;
  *(void *)(a2 + 24) = v21;
  *(void *)(a2 + 32) = KeyPath;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v14;
  *(void *)(a2 + 64) = v18;
  *(void *)(a2 + 72) = v17;
  *(void *)(a2 + 80) = v19;
  *(void *)(a2 + 88) = 0x3FEB333333333333;
  *(void *)(a2 + 96) = 0;
  *(unsigned char *)(a2 + 104) = 1;
  sub_100010F70(v23, v22, v12 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain_n();
  swift_retain();
  sub_10000C5C0(v23, v22, v12 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

__n128 sub_10000E934@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10004E820();
  sub_10000E670(v1, (uint64_t)&v14);
  char v4 = v15;
  char v5 = v17;
  __n128 result = v18;
  long long v7 = v19;
  uint64_t v8 = v20;
  uint64_t v9 = v21;
  uint64_t v10 = v22;
  char v11 = v23;
  long long v12 = v16;
  long long v13 = v14;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v13;
  *(unsigned char *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 48) = v12;
  *(unsigned char *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 72) = result;
  *(_OWORD *)(a1 + 88) = v7;
  *(void *)(a1 + 104) = v8;
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = v10;
  *(unsigned char *)(a1 + 128) = v11;
  return result;
}

uint64_t sub_10000E9DC@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 9)) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  return sub_10000CA7C(*(unsigned __int8 *)(v1 + 8), *(void *)v1, v2 | *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_10000EA00(unint64_t a1, uint64_t a2)
{
  uint64_t v68 = sub_10004E4A0();
  uint64_t v58 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v67 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v5 - 8);
  long long v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004E400();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v66 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v65 = (char *)&v52 - v12;
  __chkstk_darwin(v13);
  uint64_t v70 = (char *)&v52 - v14;
  __chkstk_darwin(v15);
  char v17 = (char *)&v52 - v16;
  uint64_t v18 = sub_10004E4B0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004E490();
  unint64_t v71 = v17;
  sub_10004E3F0();
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t v22 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_10004F3E0())
    {
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_10004F3E0();
      uint64_t v72 = a1;
      unint64_t result = swift_bridgeObjectRelease();
      if ((v23 & 0x8000000000000000) != 0) {
        goto LABEL_32;
      }
      a1 = v72;
      if (v23)
      {
LABEL_4:
        unint64_t result = sub_10002B870(v23);
        if ((a1 & 0xC000000000000001) != 0) {
          goto LABEL_29;
        }
        if ((result & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (result < *(void *)(v22 + 16))
        {
          for (id i = *(id *)(a1 + 8 * result + 32); ; id i = (id)sub_10004F3B0())
          {
            NSString v26 = i;
            swift_bridgeObjectRelease();
            [v26 timeStamp];
            NSString v27 = v70;
            sub_10004E380();

            id v28 = v71;
            (*(void (**)(char *, uint64_t))(v9 + 8))(v71, v8);
            (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v28, v27, v8);
LABEL_9:
            if ((a2 & 0x8000000000000000) == 0) {
              break;
            }
LABEL_28:
            __break(1u);
LABEL_29:
            ;
          }
          goto LABEL_10;
        }
        __break(1u);
LABEL_32:
        __break(1u);
        return result;
      }
      __break(1u);
    }
  }
  else
  {
    unint64_t v23 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v23) {
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRelease();
  if (a2 < 0) {
    goto LABEL_28;
  }
LABEL_10:
  if (a2)
  {
    uint64_t v53 = v19;
    uint64_t v54 = v18;
    uint64_t v64 = v7;
    uint64_t v72 = v8;
    uint64_t v29 = 0;
    uint64_t v30 = v58 + 104;
    long long v63 = *(void (**)(char *, void, uint64_t))(v58 + 104);
    unsigned int v62 = enum case for Calendar.Component.hour(_:);
    uint64_t v31 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v60 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    uint64_t v61 = (void (**)(char *, uint64_t))(v58 + 8);
    uint64_t v59 = (void (**)(char *, uint64_t, uint64_t))(v9 + 32);
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v9 + 16);
    uint64_t v56 = v9;
    unint64_t v69 = &_swiftEmptyArrayStorage;
    uint64_t v52 = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v57 = a2;
    v58 += 104;
    uint64_t v32 = a2;
    uint64_t v33 = v68;
    do
    {
      uint64_t v34 = v67;
      uint64_t v35 = v30;
      v63(v67, v62, v33);
      int v36 = v70;
      sub_10004E440();
      uint64_t v37 = (uint64_t)v64;
      sub_10004E480();
      uint64_t v38 = *v31;
      uint64_t v39 = v36;
      uint64_t v40 = v72;
      (*v31)(v39, v72);
      int v41 = v34;
      uint64_t v42 = v37;
      (*v61)(v41, v33);
      if ((*v60)(v37, 1, v40) == 1)
      {
        sub_100005100(v37, (uint64_t *)&unk_100061980);
        uint64_t v30 = v35;
      }
      else
      {
        int v43 = *v59;
        uint64_t v44 = v65;
        (*v59)(v65, v42, v40);
        (*v55)(v66, v44, v40);
        uint64_t v45 = v69;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v45 = (void *)sub_10000AA44(0, v45[2] + 1, 1, v45);
        }
        unint64_t v47 = v45[2];
        unint64_t v46 = v45[3];
        if (v47 >= v46 >> 1) {
          uint64_t v45 = (void *)sub_10000AA44(v46 > 1, v47 + 1, 1, v45);
        }
        v45[2] = v47 + 1;
        unint64_t v48 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
        unint64_t v69 = v45;
        uint64_t v49 = (char *)v45 + v48 + *(void *)(v56 + 72) * v47;
        uint64_t v50 = v72;
        v43(v49, (uint64_t)v66, v72);
        v38(v65, v50);
        uint64_t v32 = v57;
        uint64_t v30 = v58;
      }
      ++v29;
    }
    while (v32 != v29);
    uint64_t v19 = v53;
    uint64_t v8 = v72;
    uint64_t v18 = v54;
    uint64_t v51 = v69;
  }
  else
  {
    uint64_t v38 = *(void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v51 = &_swiftEmptyArrayStorage;
  }
  v38(v71, v8);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  return (unint64_t)v51;
}

void *sub_10000F044(int64_t a1, uint64_t a2)
{
  uint64_t v27 = sub_10004E400();
  uint64_t v4 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  NSString v26 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = (void *)sub_10000EA00(a1, a2);
  if (!result) {
    return result;
  }
  long long v7 = result;
  uint64_t v28 = result[2];
  uint64_t v29 = &_swiftEmptyArrayStorage;
  if (!v28)
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v8 = 0;
  uint64_t v24 = v4 + 8;
  uint64_t v25 = v4 + 16;
  uint64_t v9 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v21 = result;
  uint64_t v22 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v9 = a1;
  }
  uint64_t v20 = v9;
  unint64_t v23 = (unint64_t)a1 >> 62;
  while (!a1)
  {
LABEL_18:
    sub_10004F150();
    if (v29[2] >= v29[3] >> 1) {
      sub_10004F190();
    }
    ++v8;
    sub_10004F1A0();
    unint64_t result = (void *)sub_10004F180();
    if (v8 == v28)
    {
      swift_bridgeObjectRelease();
      return v29;
    }
  }
  if (v8 >= v7[2]) {
    goto LABEL_27;
  }
  unint64_t v10 = (unint64_t)v7
      + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
      + *(void *)(v4 + 72) * v8;
  uint64_t v11 = v26;
  uint64_t v12 = v27;
  (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v26, v10, v27);
  swift_bridgeObjectRetain();
  sub_10004E390();
  double v14 = v13;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v12);
  if (!v23)
  {
    uint64_t v15 = *(void *)(v22 + 16);
    if (v15) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10004F3E0();
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_17:
    long long v7 = v21;
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_10:
  uint64_t v16 = 4;
  while (1)
  {
    unint64_t result = (a1 & 0xC000000000000001) != 0 ? (void *)sub_10004F3B0() : *(id *)(a1 + 8 * v16);
    char v17 = result;
    uint64_t v18 = v16 - 3;
    if (__OFADD__(v16 - 4, 1)) {
      break;
    }
    [result timeStamp:v20];
    if (vabdd_f64(v19, v14) >= 2.22044605e-16)
    {

      ++v16;
      if (v18 != v15) {
        continue;
      }
    }
    goto LABEL_17;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_10000F318()
{
  unint64_t result = qword_1000614F8;
  if (!qword_1000614F8)
  {
    sub_1000053B0(&qword_1000614D0);
    sub_10000566C(&qword_100061500, &qword_1000614C8);
    sub_10000566C(&qword_100061508, &qword_1000614F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000614F8);
  }
  return result;
}

void sub_10000F3DC(int64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v50 = sub_10004E400();
  uint64_t v45 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v49 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004F98(&qword_100061520);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v37 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v44 = (uint64_t)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v14 = __chkstk_darwin(v13);
  uint64_t v36 = (uint64_t)v33 - v15;
  if (a1 == a2)
  {
    unint64_t v48 = &_swiftEmptyArrayStorage;
    return;
  }
  if (a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v43 = v45 + 16;
  uint64_t v40 = a4 & 0xFFFFFFFFFFFFFF8;
  if (a4 >= 0) {
    uint64_t v16 = a4 & 0xFFFFFFFFFFFFFF8;
  }
  else {
    uint64_t v16 = a4;
  }
  uint64_t v35 = (void (**)(char *, char *, uint64_t))(v45 + 32);
  v33[1] = v16;
  uint64_t v34 = (void (**)(char *, void, uint64_t, uint64_t))(v45 + 56);
  unint64_t v46 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56);
  int v41 = (void (**)(char *, uint64_t))(v45 + 8);
  unint64_t v48 = &_swiftEmptyArrayStorage;
  uint64_t v42 = (unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  while (a1 < a2)
  {
    if (!a3)
    {
      (*v46)(v11, 1, 1, v47);
      goto LABEL_10;
    }
    if (a1 < 0) {
      goto LABEL_40;
    }
    if ((unint64_t)a1 >= *(void *)(a3 + 16)) {
      goto LABEL_41;
    }
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v45 + 16))(v49, a3+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * a1, v50, v14);
    if (!a4) {
      goto LABEL_28;
    }
    swift_bridgeObjectRetain();
    sub_10004E390();
    double v18 = v17;
    if ((unint64_t)a4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_10004F3E0();
      swift_bridgeObjectRelease();
      if (!v19)
      {
LABEL_26:
        swift_bridgeObjectRelease();
        a2 = v38;
        a3 = v39;
LABEL_28:
        (*v41)(v49, v50);
        uint64_t v26 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v19 = *(void *)(v40 + 16);
      if (!v19) {
        goto LABEL_26;
      }
    }
    uint64_t v20 = 4;
    while (1)
    {
      if ((a4 & 0xC000000000000001) != 0) {
        id v21 = (id)sub_10004F3B0();
      }
      else {
        id v21 = *(id *)(a4 + 8 * v20);
      }
      uint64_t v22 = v21;
      uint64_t v23 = v20 - 3;
      if (__OFADD__(v20 - 4, 1))
      {
        __break(1u);
        goto LABEL_39;
      }
      [v21 timeStamp];
      if (vabdd_f64(v24, v18) < 2.22044605e-16) {
        break;
      }

      ++v20;
      if (v23 == v19) {
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRelease();
    id v25 = [v22 state];

    a2 = v38;
    a3 = v39;
    if (v25) {
      goto LABEL_28;
    }
    uint64_t v32 = v50;
    (*v35)(v11, v49, v50);
    (*v34)(v11, 0, 1, v32);
    uint64_t v26 = 0;
LABEL_29:
    uint64_t v27 = v47;
    (*v46)(v11, v26, 1, v47);
    if ((*v42)(v11, 1, v27) != 1)
    {
      uint64_t v28 = v36;
      sub_10000FD18((uint64_t)v11, v36);
      sub_10000FD18(v28, v44);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v48 = (void *)sub_10000AC40(0, v48[2] + 1, 1, v48);
      }
      unint64_t v30 = v48[2];
      unint64_t v29 = v48[3];
      if (v30 >= v29 >> 1) {
        unint64_t v48 = (void *)sub_10000AC40(v29 > 1, v30 + 1, 1, v48);
      }
      uint64_t v31 = v48;
      v48[2] = v30 + 1;
      sub_10000FD18(v44, (uint64_t)v31+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(void *)(v37 + 72) * v30);
      goto LABEL_11;
    }
LABEL_10:
    sub_100005100((uint64_t)v11, &qword_100061520);
LABEL_11:
    if (++a1 == a2) {
      return;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
}

uint64_t sub_10000F910(uint64_t a1)
{
  uint64_t v2 = sub_10004E430();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10004E400();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000509C(a1, (uint64_t)v8, (uint64_t *)&unk_100061980);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100005100((uint64_t)v8, (uint64_t *)&unk_100061980);
    id v13 = [self mainBundle];
    NSString v14 = sub_10004F0D0();
    NSString v15 = sub_10004F0D0();
    id v16 = [v13 localizedStringForKey:v14 value:0 table:v15];

    uint64_t v17 = sub_10004F0F0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    id v18 = [objc_allocWithZone((Class)NSDateFormatter) init];
    sub_10004E420();
    uint64_t v19 = sub_10004E410();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v21)
    {
      uint64_t v28 = v19;
      uint64_t v29 = v21;
      uint64_t v26 = 26746;
      unint64_t v27 = 0xE200000000000000;
      sub_10000C56C();
      if (sub_10004F2D0())
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v28 = v19;
        uint64_t v29 = v21;
        uint64_t v26 = 24938;
        unint64_t v27 = 0xE200000000000000;
        sub_10004F2D0();
        swift_bridgeObjectRelease();
      }
    }
    NSString v22 = sub_10004F0D0();
    [v18 setLocalizedDateFormatFromTemplate:v22];

    Class isa = sub_10004E3C0().super.isa;
    id v24 = [v18 stringFromDate:isa];

    uint64_t v17 = sub_10004F0F0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v17;
}

uint64_t sub_10000FD18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FD80()
{
  return sub_10000FDB8(56);
}

uint64_t sub_10000FD88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(v2 + 25)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  return sub_10000D2E4(a1, *(void *)(v2 + 16), v3 | *(unsigned __int8 *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), a2);
}

uint64_t sub_10000FDB0()
{
  return sub_10000FDB8(57);
}

uint64_t sub_10000FDB8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

void sub_10000FE04(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000D924(a1, *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(unsigned __int8 *)(v2 + 56), a2);
}

unint64_t sub_10000FE30()
{
  unint64_t result = qword_100061540;
  if (!qword_100061540)
  {
    sub_1000053B0(&qword_100061538);
    sub_100010ED0(&qword_100061548, (void (*)(uint64_t))type metadata accessor for StandChart.LegendLabel);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061540);
  }
  return result;
}

uint64_t type metadata accessor for StandChart.LegendLabel()
{
  uint64_t result = qword_1000615D8;
  if (!qword_1000615D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000FF20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandChart.LegendLabel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FF84()
{
  uint64_t v1 = sub_10004E5B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

id sub_10001006C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_10004E5B0() - 8);
  uint64_t v6 = *(void *)(v2 + 32);
  uint64_t v7 = *(void *)(v2 + 40);
  uint64_t v8 = *(void *)(v2
                 + ((*(void *)(v5 + 64)
                   + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10000D710(a1, v6, v7, v8, a2);
}

uint64_t *sub_100010138(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_10004E400();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v11) = *(uint64_t *)((char *)a2 + v11);
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000102B8(uint64_t a1)
{
  uint64_t v2 = sub_10004E400();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }

  return swift_release();
}

char *sub_100010384(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  swift_retain();
  return a1;
}

char *sub_1000104B8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_100010660(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *sub_100010790(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10004E400();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  swift_release();
  return a1;
}

uint64_t sub_10001092C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010940);
}

uint64_t sub_100010940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100010A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010A18);
}

uint64_t sub_100010A18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_100010AD8()
{
  sub_100010B7C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100010B7C()
{
  if (!qword_100061720)
  {
    sub_10004E400();
    unint64_t v0 = sub_10004F2A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100061720);
    }
  }
}

uint64_t destroy for StandChart.DotView()
{
  swift_release();

  return swift_release();
}

void *_s13FitnessWidget10StandChartV7DotViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for StandChart.DotView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for StandChart.DotView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StandChart.DotView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for StandChart.DotView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StandChart.DotView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StandChart.DotView()
{
  return &type metadata for StandChart.DotView;
}

unint64_t sub_100010DB4()
{
  unint64_t result = qword_100061618;
  if (!qword_100061618)
  {
    sub_1000053B0(&qword_100061620);
    sub_1000053B0(&qword_1000614D8);
    sub_1000053B0(&qword_1000614D0);
    sub_10000F318();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100010ED0((unint64_t *)&qword_100061628, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061618);
  }
  return result;
}

uint64_t sub_100010ED0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100010F18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010F34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010F70(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

__n128 initializeBufferWithCopyOfBuffer for StandChart.Dot(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StandChart.Dot(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StandChart.Dot(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StandChart.Dot()
{
  return &type metadata for StandChart.Dot;
}

uint64_t sub_100010FE4()
{
  return sub_10000566C(&qword_100061638, &qword_100061640);
}

unint64_t sub_100011024()
{
  unint64_t result = qword_100061648;
  if (!qword_100061648)
  {
    sub_1000053B0(&qword_100061650);
    sub_1000110A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061648);
  }
  return result;
}

unint64_t sub_1000110A0()
{
  unint64_t result = qword_100061658;
  if (!qword_100061658)
  {
    sub_1000053B0(&qword_100061660);
    sub_10000566C(&qword_100061668, &qword_100061670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061658);
  }
  return result;
}

uint64_t sub_100011140()
{
  return sub_10000566C(&qword_100061678, &qword_100061680);
}

unint64_t sub_100011180()
{
  unint64_t result = qword_100061688;
  if (!qword_100061688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061688);
  }
  return result;
}

unint64_t sub_1000111D8()
{
  unint64_t result = qword_100061690;
  if (!qword_100061690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061690);
  }
  return result;
}

unint64_t sub_100011230()
{
  unint64_t result = qword_100061698;
  if (!qword_100061698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061698);
  }
  return result;
}

unint64_t sub_100011284()
{
  unint64_t result = qword_1000616A0;
  if (!qword_1000616A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000616A0);
  }
  return result;
}

uint64_t sub_1000112E0()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id sub_10001132C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void **)(a1 + 56);
  *a2 = v2;
  return v2;
}

uint64_t sub_10001135C(void *a1)
{
  return sub_10001198C(a1, (uint64_t)&unk_10005EE30, (uint64_t)sub_100018170, (uint64_t)&unk_10005EE48);
}

void sub_100011384(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void **)(Strong + 56);
    *(void *)(Strong + 56) = a2;
    id v5 = a2;
    swift_release();
  }
}

uint64_t sub_1000113F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100011438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate;
  swift_beginAccess();
  return sub_10000509C(v3, a2, (uint64_t *)&unk_100061980);
}

uint64_t sub_1000114A4(uint64_t a1)
{
  v17[0] = a1;
  uint64_t v3 = sub_10004EEF0();
  uint64_t v20 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004EF10();
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9 - 8);
  v17[1] = *(void *)(v1 + 16);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  sub_10000509C(a1, (uint64_t)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_100061980);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  sub_10000B630((uint64_t)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, (uint64_t *)&unk_100061980);
  aBlock[4] = sub_10001805C;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000112DC;
  aBlock[3] = &unk_10005EDF8;
  NSString v15 = _Block_copy(aBlock);
  swift_retain();
  sub_10004EF00();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
  sub_10004F2F0();
  sub_10004F250();
  _Block_release(v15);
  sub_100005100(v17[0], (uint64_t *)&unk_100061980);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v19);
  swift_release();
  return swift_release();
}

uint64_t sub_100011838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v3 - 8);
  id v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    sub_10000509C(a2, (uint64_t)v5, (uint64_t *)&unk_100061980);
    uint64_t v8 = v7 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate;
    swift_beginAccess();
    sub_1000180C4((uint64_t)v5, v8);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

id sub_10001192C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics);
  *a2 = v2;
  return v2;
}

uint64_t sub_100011964(void *a1)
{
  return sub_10001198C(a1, (uint64_t)&unk_10005ED90, (uint64_t)sub_100017F2C, (uint64_t)&unk_10005EDA8);
}

uint64_t sub_10001198C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10004EEF0();
  uint64_t v21 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10004EF10();
  uint64_t v11 = *(void *)(v20 - 8);
  __chkstk_darwin();
  unint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v4 + 16);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = a1;
  aBlock[4] = a3;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000112DC;
  aBlock[3] = a4;
  id v16 = _Block_copy(aBlock);
  id v17 = a1;
  swift_retain();
  sub_10004EF00();
  NSString v22 = &_swiftEmptyArrayStorage;
  sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
  sub_10004F2F0();
  sub_10004F250();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  swift_release();
  return swift_release();
}

void sub_100011C68(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void **)(Strong + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics);
    *(void *)(Strong + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics) = a2;
    id v5 = a2;
    swift_release();
  }
}

uint64_t sub_100011CE0(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v30 = a1;
  uint64_t v28 = sub_10004F220();
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004F200();
  __chkstk_darwin();
  sub_10004EF10();
  __chkstk_darwin();
  uint64_t v29 = sub_100017EEC(0, (unint64_t *)&qword_100061950);
  sub_10004EF00();
  uint64_t v32 = &_swiftEmptyArrayStorage;
  uint64_t v27 = sub_1000182C8(&qword_1000619F8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v26 = sub_100004F98(&qword_100061A00);
  sub_100018310(&qword_100061A08, &qword_100061A00);
  sub_10004F2F0();
  uint64_t v6 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v7 = v3 + 104;
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  id v24 = v5;
  uint64_t v25 = v7;
  uint64_t v9 = v28;
  v8(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v28);
  *(void *)(v1 + 16) = sub_10004F260();
  sub_10004EF00();
  uint64_t v32 = &_swiftEmptyArrayStorage;
  sub_10004F2F0();
  v8(v24, v6, v9);
  *(void *)(v1 + 24) = sub_10004F260();
  *(_OWORD *)(v1 + 32) = xmmword_100050190;
  *(void *)(v1 + 48) = &_swiftEmptySetSingleton;
  *(void *)(v1 + 56) = 0;
  uint64_t v10 = v1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate;
  uint64_t v11 = sub_10004E400();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(void *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser) = 0;
  uint64_t v12 = (_OWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_layout);
  _OWORD *v12 = xmmword_1000501A0;
  v12[1] = xmmword_1000501B0;
  v12[2] = xmmword_1000501C0;
  *(void *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_ringsRenderer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_timeIntervalForRelevantWorkout) = 0x409C200000000000;
  unint64_t v13 = v30;
  *(void *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) = v30;
  id v14 = objc_allocWithZone((Class)_HKWheelchairUseCharacteristicCache);
  id v15 = v13;
  id v16 = [v14 initWithHealthStore:v15];
  if (!v16)
  {
    __break(1u);
    goto LABEL_9;
  }
  *(void *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_wheelchairCache) = v16;
  id v17 = MTLCreateSystemDefaultDevice();
  if (!v17)
  {
LABEL_9:
    uint64_t result = sub_10004F3D0();
    __break(1u);
    return result;
  }
  if ([v17 newCommandQueue])
  {
    uint64_t v31 = &OBJC_PROTOCOL___MTLCommandQueueSPI;
    uint64_t v18 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v18)
    {
      uint64_t v19 = v18;
      [v18 setBackgroundGPUPriority:2];
      id v20 = [objc_allocWithZone((Class)ARUIRenderer) initWithCommandQueue:v19];
      swift_unknownObjectRelease();
      uint64_t v21 = *(void **)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_ringsRenderer);
      *(void *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_ringsRenderer) = v20;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  sub_100016088();
  swift_unknownObjectRelease();

  return v2;
}

uint64_t sub_1000121FC(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v38 = a3;
  LODWORD(v39) = a2;
  uint64_t v42 = sub_10004EEF0();
  uint64_t v45 = *(void *)(v42 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v41 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10004EF10();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v40 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004EF30();
  uint64_t v37 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v36 = (char *)&v36 - v16;
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v17;
  v18[3] = a3;
  v18[4] = a4;
  id v19 = objc_allocWithZone((Class)_HKCurrentActivitySummaryQuery);
  uint64_t v50 = sub_100017E8C;
  uint64_t v51 = v18;
  aBlock = _NSConcreteStackBlock;
  uint64_t v47 = 1107296256;
  unint64_t v48 = sub_100016744;
  uint64_t v49 = &unk_10005ED08;
  id v20 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  id v21 = [v19 initWithUpdateHandler:v20];
  _Block_release(v20);
  swift_release();
  swift_release();
  id v22 = v21;
  NSString v23 = sub_10004F0D0();
  [v22 setDebugIdentifier:v23];

  sub_1000158C4(v22);
  [*(id *)(v5 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) executeQuery:v22];
  sub_100017EEC(0, (unint64_t *)&qword_100061950);
  id v24 = (void *)sub_10004F230();
  sub_10004EF20();
  sub_10004EF40();
  uint64_t v25 = v12 + 8;
  uint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v39 = v25;
  v26(v15, v11);
  uint64_t v27 = swift_allocObject();
  swift_weakInit();
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = v27;
  v28[3] = v22;
  v28[4] = v38;
  v28[5] = a4;
  uint64_t v50 = sub_100017EE0;
  uint64_t v51 = v28;
  aBlock = _NSConcreteStackBlock;
  uint64_t v47 = 1107296256;
  unint64_t v48 = sub_1000112DC;
  uint64_t v49 = &unk_10005ED58;
  uint64_t v29 = _Block_copy(&aBlock);
  swift_retain();
  id v30 = v22;
  swift_release();
  uint64_t v31 = v40;
  sub_10004EF00();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
  uint64_t v32 = v41;
  uint64_t v33 = v42;
  sub_10004F2F0();
  uint64_t v34 = v36;
  sub_10004F210();
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v44);
  return ((uint64_t (*)(char *, uint64_t))v26)(v34, v37);
}

uint64_t sub_100012790(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    if ((sub_100015D10(a1) & 1) == 0) {
      return swift_release();
    }
    [*(id *)(v10 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) stopQuery:a1];
    sub_100015984(a1);
    sub_100004F98((uint64_t *)&unk_100061990);
    sub_10004F240();
    if (v15)
    {
      if (a2)
      {
        sub_100017EEC(0, &qword_1000619F0);
        id v11 = a2;
        id v12 = v15;
        char v13 = sub_10004F280();

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    else if (!a2)
    {
      goto LABEL_11;
    }
    id v14 = a2;
    sub_10001135C(a2);
LABEL_11:
    a5(a2, a3);
    return swift_release();
  }
  return result;
}

void sub_100012908(uint64_t a1, void *a2, void (*a3)(void *, void))
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    if (sub_100015D10(a2))
    {
      sub_10004F1E0();
      id v7 = HKLogActivity;
      sub_10004E4E0();

      [*(id *)(v6 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) stopQuery:a2];
      sub_100015984(a2);
      sub_100004F98((uint64_t *)&unk_100061990);
      sub_10004F240();
      sub_10004F240();
      if (v11)
      {
        sub_100017EEC(0, &qword_1000619F0);
        id v8 = v11;
        id v9 = v11;
        char v10 = sub_10004F280();

        if ((v10 & 1) == 0)
        {
          id v8 = v11;
          sub_10001135C(v11);
        }
      }
      else
      {
        id v8 = 0;
      }
      a3(v11, 0);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

id sub_100012B0C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v39 = a2;
  uint64_t v8 = sub_10004EEF0();
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v47 = v8;
  __chkstk_darwin(v8);
  uint64_t v44 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_10004EF10();
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v42 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10004EF30();
  uint64_t v41 = *(void *)(v48 - 8);
  uint64_t v11 = __chkstk_darwin(v48);
  char v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v40 = (char *)&v38 - v14;
  sub_10004F0F0();
  id v15 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v16 = sub_10004F0D0();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithKey:v16 ascending:0];

  sub_100017EEC(0, &qword_1000619C8);
  id result = [(id)swift_getObjCClassFromMetadata() pauseRingsScheduleType];
  if (result)
  {
    id v19 = result;
    sub_100004F98(&qword_1000619D0);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1000501D0;
    *(void *)(v20 + 32) = v17;
    aBlock = (void **)v20;
    sub_10004F180();
    uint64_t v21 = swift_allocObject();
    swift_weakInit();
    id v22 = (void *)swift_allocObject();
    v22[2] = v21;
    v22[3] = a3;
    v22[4] = a4;
    id v23 = objc_allocWithZone((Class)HKSampleQuery);
    sub_100017EEC(0, &qword_1000619D8);
    id v38 = v17;
    swift_retain();
    swift_retain();
    Class isa = sub_10004F160().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_100017E30;
    uint64_t v54 = v22;
    aBlock = _NSConcreteStackBlock;
    uint64_t v50 = 1107296256;
    uint64_t v51 = sub_100016748;
    uint64_t v52 = &unk_10005EC68;
    uint64_t v25 = _Block_copy(&aBlock);
    id v26 = [v23 initWithSampleType:v19 predicate:0 limit:1 sortDescriptors:isa resultsHandler:v25];

    _Block_release(v25);
    swift_release();
    swift_release();
    id v27 = v26;
    NSString v28 = sub_10004F0D0();
    [v27 setDebugIdentifier:v28];

    sub_1000158C4(v27);
    [*(id *)(v5 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) executeQuery:v27];
    sub_100017EEC(0, (unint64_t *)&qword_100061950);
    uint64_t v29 = (void *)sub_10004F230();
    sub_10004EF20();
    id v30 = v40;
    sub_10004EF40();
    uint64_t v41 = *(void *)(v41 + 8);
    ((void (*)(char *, uint64_t))v41)(v13, v48);
    uint64_t v31 = swift_allocObject();
    swift_weakInit();
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v31;
    *(void *)(v32 + 24) = v27;
    uint64_t v53 = sub_100017E40;
    uint64_t v54 = (void *)v32;
    aBlock = _NSConcreteStackBlock;
    uint64_t v50 = 1107296256;
    uint64_t v51 = (uint64_t (*)(uint64_t, void *, uint64_t, void *))sub_1000112DC;
    uint64_t v52 = &unk_10005ECB8;
    uint64_t v33 = _Block_copy(&aBlock);
    id v34 = v27;
    swift_release();
    uint64_t v35 = v42;
    sub_10004EF00();
    aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004F98((uint64_t *)&unk_100061960);
    sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
    uint64_t v36 = v44;
    uint64_t v37 = v47;
    sub_10004F2F0();
    sub_10004F210();
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v36, v37);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v45);
    return (id)((uint64_t (*)(char *, uint64_t))v41)(v30, v48);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000131C0(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t), uint64_t a6)
{
  uint64_t v87 = a6;
  uint64_t v88 = a5;
  uint64_t v86 = a3;
  uint64_t v8 = sub_10004E330();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v82 = v8;
  uint64_t v83 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v76 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v81 = (char *)&v70 - v12;
  uint64_t v13 = sub_10004E400();
  uint64_t v89 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  unint64_t v77 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v17 = (char *)&v70 - v16;
  uint64_t v18 = sub_100004F98(&qword_1000619E8);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  v80 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  id v23 = (char *)&v70 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  id v26 = (char *)&v70 - v25;
  __chkstk_darwin(v24);
  uint64_t v84 = (uint64_t)&v70 - v27;
  uint64_t v28 = sub_10004E4B0();
  uint64_t v78 = *(void *)(v28 - 8);
  uint64_t v79 = v28;
  __chkstk_darwin(v28);
  uint64_t v85 = (char *)&v70 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v31 = __chkstk_darwin(v30 - 8);
  uint64_t v33 = (char *)&v70 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v70 - v34;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v37 = result;
    if ((sub_100015D10(a1) & 1) == 0) {
      return swift_release();
    }
    [*(id *)(v37 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) stopQuery:a1];
    sub_100015984(a1);
    if (a2)
    {
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_10004F3E0();
        if (v38)
        {
LABEL_6:
          unint64_t v39 = v38 - 1;
          if (__OFSUB__(v38, 1))
          {
            __break(1u);
          }
          else if ((a2 & 0xC000000000000001) == 0)
          {
            if ((v39 & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (v39 < *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              id v40 = *(id *)(a2 + 8 * v39 + 32);
LABEL_11:
              uint64_t v41 = v40;
              swift_bridgeObjectRelease();
              self;
              uint64_t v42 = (void *)swift_dynamicCastObjCClass();
              if (v42)
              {
                id v74 = v42;
                id v75 = v41;
                id v43 = [self hk_gregorianCalendar];
                sub_10004E460();

                sub_10004E3F0();
                Class isa = sub_10004E3C0().super.isa;
                uint64_t v72 = *(void (**)(char *, uint64_t))(v89 + 8);
                uint64_t v73 = v89 + 8;
                v72(v17, v13);
                Class v45 = sub_10004E450().super.isa;
                id v46 = (id)_HKActivityCacheDateComponentsFromDate();

                if (v46)
                {
                  sub_10004E300();

                  uint64_t v47 = v83;
                  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56);
                  uint64_t v49 = v26;
                  uint64_t v50 = 0;
                }
                else
                {
                  uint64_t v47 = v83;
                  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56);
                  uint64_t v49 = v26;
                  uint64_t v50 = 1;
                }
                uint64_t v51 = v82;
                unint64_t v71 = v48;
                v48(v49, v50, 1, v82);
                uint64_t v52 = v84;
                sub_10000B630((uint64_t)v26, v84, &qword_1000619E8);
                sub_10000509C(v52, (uint64_t)v23, &qword_1000619E8);
                uint64_t v70 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48);
                if (v70(v23, 1, v51) == 1)
                {
                  Class v53 = 0;
                }
                else
                {
                  uint64_t v54 = v51;
                  Class v53 = sub_10004E2F0().super.isa;
                  (*(void (**)(char *, uint64_t))(v47 + 8))(v23, v54);
                }
                id v17 = v80;
                uint64_t v55 = v81;
                uint64_t v56 = _HKCacheIndexFromDateComponents();

                id v57 = v74;
                if (v56 < (uint64_t)[v74 startDateIndex]
                  || v56 >= (uint64_t)[v57 endDateIndex])
                {
                  uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56);
                  v68(v35, 1, 1, v13);
                  sub_1000114A4((uint64_t)v35);
                  v68(v35, 1, 1, v13);
                  v88(v35, v86);
                  swift_release();

                  sub_100005100((uint64_t)v35, (uint64_t *)&unk_100061980);
                  goto LABEL_27;
                }
                [v57 endDateIndex];
                id v58 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
                if (v58)
                {
                  uint64_t v59 = v58;
                  uint64_t v60 = v76;
                  sub_10004E300();

                  uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v83 + 32);
                  unsigned int v62 = v60;
                  uint64_t v63 = v82;
                  v61(v17, v62, v82);
                  v71(v17, 0, 1, v63);
                  if (v70(v17, 1, v63) != 1)
                  {
                    v61(v55, v17, v63);
                    sub_10004E470();
                    uint64_t v64 = v89;
                    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v89 + 48))(v33, 1, v13) != 1)
                    {
                      uint64_t v65 = v77;
                      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v77, v33, v13);
                      uint64_t v66 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
                      v66(v35, v65, v13);
                      uint64_t v67 = *(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56);
                      v67(v35, 0, 1, v13);
                      sub_1000114A4((uint64_t)v35);
                      v66(v35, v65, v13);
                      v67(v35, 0, 1, v13);
                      v88(v35, v86);
                      swift_release();

                      sub_100005100((uint64_t)v35, (uint64_t *)&unk_100061980);
                      v72(v65, v13);
                      (*(void (**)(char *, uint64_t))(v83 + 8))(v81, v63);
LABEL_27:
                      sub_100005100(v84, &qword_1000619E8);
                      return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v85, v79);
                    }
                    sub_100005100((uint64_t)v33, (uint64_t *)&unk_100061980);
                    goto LABEL_39;
                  }
LABEL_37:
                  sub_100005100((uint64_t)v17, &qword_1000619E8);
LABEL_39:
                  uint64_t result = sub_10004F3D0();
                  __break(1u);
                  return result;
                }
LABEL_36:
                v71(v17, 1, 1, v82);
                goto LABEL_37;
              }

              goto LABEL_30;
            }
            __break(1u);
            goto LABEL_36;
          }
          id v40 = (id)sub_10004F3B0();
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v38 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v38) {
          goto LABEL_6;
        }
      }
      swift_bridgeObjectRelease();
    }
LABEL_30:
    unint64_t v69 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56);
    v69(v35, 1, 1, v13);
    sub_1000114A4((uint64_t)v35);
    v69(v35, 1, 1, v13);
    v88(v35, v86);
    swift_release();
    return sub_100005100((uint64_t)v35, (uint64_t *)&unk_100061980);
  }
  return result;
}

uint64_t sub_100013BE4(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    if (sub_100015D10(a2))
    {
      sub_10004F1E0();
      id v5 = HKLogActivity;
      sub_10004E4E0();

      [*(id *)(v4 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) stopQuery:a2];
      sub_100015984(a2);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_100013CC0(uint64_t a1, int a2, void (*a3)(void, uint64_t), uint64_t a4)
{
  v105 = a3;
  uint64_t v106 = a4;
  LODWORD(v90) = a2;
  uint64_t v4 = sub_10004EEF0();
  uint64_t v98 = *(void *)(v4 - 8);
  uint64_t v99 = v4;
  __chkstk_darwin(v4);
  uint64_t v96 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_10004EF10();
  uint64_t v95 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  v94 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_10004EF30();
  uint64_t v93 = *(void *)(v104 - 8);
  uint64_t v7 = __chkstk_darwin(v104);
  uint64_t v89 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v92 = (char *)&v81 - v9;
  uint64_t v10 = sub_100004F98(&qword_1000619A8);
  __chkstk_darwin(v10 - 8);
  uint64_t v86 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004F98(&qword_1000619B0);
  __chkstk_darwin(v12 - 8);
  uint64_t v85 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10004E330();
  uint64_t v101 = *(void *)(v14 - 8);
  uint64_t v102 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v88 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v87 = (char *)&v81 - v18;
  __chkstk_darwin(v17);
  v100 = (char *)&v81 - v19;
  uint64_t v20 = sub_10004E4A0();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v23 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v24 - 8);
  id v26 = (char *)&v81 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004E400();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v84 = (char *)&v81 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v83 = (char *)&v81 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v81 - v34;
  __chkstk_darwin(v33);
  uint64_t v37 = (char *)&v81 - v36;
  uint64_t v38 = sub_10004E4B0();
  uint64_t v108 = *(void *)(v38 - 8);
  uint64_t v109 = v38;
  __chkstk_darwin(v38);
  id v40 = (char *)&v81 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004E490();
  sub_10004E440();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, enum case for Calendar.Component.day(_:), v20);
  v107 = v37;
  v103 = v40;
  sub_10004E480();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  uint64_t v41 = (char *)v27;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1)
  {
    sub_100005100((uint64_t)v26, (uint64_t *)&unk_100061980);
    id v42 = [self mainBundle];
    NSString v43 = sub_10004F0D0();
    NSString v44 = sub_10004F0D0();
    id v45 = [v42 localizedStringForKey:v43 value:0 table:v44];

    uint64_t v46 = sub_10004F0F0();
    uint64_t v48 = v47;

    sub_100017D68();
    uint64_t v49 = swift_allocError();
    *uint64_t v50 = v46;
    v50[1] = v48;
    v105(0, v49);
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v107, v27);
  }
  else
  {
    uint64_t v81 = v28;
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    uint64_t v82 = v35;
    v51(v35, v26, v27);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v108 + 56))(v85, 1, 1, v109);
    uint64_t v52 = sub_10004E4C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v86, 1, 1, v52);
    Class v53 = v100;
    sub_10004E320();
    sub_10004E310();
    uint64_t v54 = *(void (**)(char *, char *, char *))(v28 + 16);
    uint64_t v55 = (uint64_t)v83;
    v54(v83, v107, v41);
    uint64_t v56 = (uint64_t)v84;
    v54(v84, v35, v41);
    uint64_t v57 = v102;
    id v58 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
    uint64_t v59 = (uint64_t)v87;
    v58(v87, v53, v102);
    uint64_t v60 = (uint64_t)v88;
    v58(v88, v53, v57);
    uint64_t v61 = (void *)swift_allocObject();
    uint64_t v62 = v91;
    uint64_t v86 = v41;
    uint64_t v64 = v105;
    uint64_t v63 = v106;
    v61[2] = v91;
    v61[3] = v64;
    v61[4] = v63;
    id v65 = objc_allocWithZone((Class)_HKActivityStatisticsQuery);
    swift_retain();
    swift_retain();
    id v66 = sub_100016800(v55, v56, v59, v60, (uint64_t)sub_100017DC0, (uint64_t)v61);
    NSString v67 = sub_10004F0D0();
    [v66 setDebugIdentifier:v67];

    sub_1000158C4(v66);
    [*(id *)(v62 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) executeQuery:v66];
    sub_100017EEC(0, (unint64_t *)&qword_100061950);
    uint64_t v90 = sub_10004F230();
    uint64_t v68 = v89;
    sub_10004EF20();
    unint64_t v69 = v92;
    sub_10004EF40();
    uint64_t v93 = *(void *)(v93 + 8);
    ((void (*)(char *, uint64_t))v93)(v68, v104);
    uint64_t v70 = swift_allocObject();
    swift_weakInit();
    unint64_t v71 = (void *)swift_allocObject();
    v71[2] = v70;
    v71[3] = v66;
    v71[4] = v62;
    v71[5] = v64;
    v71[6] = v63;
    aBlock[4] = sub_100017E1C;
    aBlock[5] = v71;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000112DC;
    aBlock[3] = &unk_10005EBF0;
    uint64_t v72 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v73 = v66;
    swift_release();
    id v74 = v94;
    sub_10004EF00();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004F98((uint64_t *)&unk_100061960);
    sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
    id v75 = v96;
    uint64_t v76 = v99;
    sub_10004F2F0();
    unint64_t v77 = (void *)v90;
    sub_10004F210();
    _Block_release(v72);

    (*(void (**)(char *, uint64_t))(v98 + 8))(v75, v76);
    (*(void (**)(char *, uint64_t))(v95 + 8))(v74, v97);
    ((void (*)(char *, uint64_t))v93)(v69, v104);
    (*(void (**)(char *, uint64_t))(v101 + 8))(v100, v102);
    uint64_t v78 = *(void (**)(char *, char *))(v81 + 8);
    uint64_t v79 = v86;
    v78(v82, v86);
    v78(v107, v79);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v103, v109);
}

uint64_t sub_1000149CC(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void *, uint64_t))
{
  uint64_t result = sub_100015D10(a1);
  if (result)
  {
    [*(id *)(a4 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) stopQuery:a1];
    sub_100015984(a1);
    sub_100004F98(&qword_1000613A0);
    sub_10004F240();
    if (v15)
    {
      if (a2)
      {
        sub_100017EEC(0, &qword_1000619C0);
        id v11 = a2;
        id v12 = v15;
        char v13 = sub_10004F280();

        if (v13) {
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    else if (!a2)
    {
      goto LABEL_10;
    }
    id v14 = a2;
    sub_100011964(a2);
LABEL_10:
    sub_100016088();
    return a5(a2, a3);
  }
  return result;
}

void sub_100014B1C(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void *, void))
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (sub_100015D10(a2))
    {
      sub_10004F1E0();
      id v7 = HKLogActivity;
      sub_10004E4E0();

      sub_100004F98(&qword_1000613A0);
      sub_10004F240();
      if (sub_100015D10(a2))
      {
        [*(id *)(a3 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) stopQuery:a2];
        sub_100015984(a2);
        sub_10004F240();
        if (v11)
        {
          sub_100017EEC(0, &qword_1000619C0);
          id v8 = v11;
          id v9 = v11;
          char v10 = sub_10004F280();

          if ((v10 & 1) == 0)
          {
            id v8 = v11;
            sub_100011964(v11);
          }
        }
        else
        {
          id v8 = 0;
        }
        sub_100016088();
        a4(v11, 0);
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
      swift_release();
    }
  }
}

void sub_100014D54(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004E400();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004F98((uint64_t *)&unk_100061990);
  sub_10004F240();
  id v6 = v32;
  if (!v32)
  {
    sub_10004F1E0();
    id v8 = HKLogActivity;
    sub_10004E4E0();

    sub_10004F030();
    return;
  }
  if ([v32 paused]) {
    goto LABEL_3;
  }
  id v9 = [v6 activityMoveMode];
  char v10 = &selRef__moveMinutesCompletionPercentage;
  if (v9 != (id)2) {
    char v10 = &selRef__activeEnergyCompletionPercentage;
  }
  [v6 *v10];
  if (v11 <= 0.0)
  {
    [v6 _exerciseTimeCompletionPercentage];
    if (v12 <= 0.0)
    {
      [v6 _standHoursCompletionPercentage];
      if (v13 <= 0.0)
      {
LABEL_3:
        sub_10004F1E0();
        id v7 = HKLogActivity;
        sub_10004E4E0();

        sub_10004F030();
LABEL_27:

        return;
      }
    }
  }
  sub_100004F98(&qword_1000613A0);
  sub_10004F240();
  id v14 = v32;
  if (!v32 || (id v15 = [v32 workoutResults], v14, !v15))
  {
LABEL_26:
    sub_10004F1E0();
    id v30 = HKLogActivity;
    sub_10004E4E0();

    sub_1000152C8(a1);
    goto LABEL_27;
  }
  sub_100017EEC(0, &qword_1000619A0);
  unint64_t v16 = sub_10004F170();

  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10004F3E0();
  swift_bridgeObjectRelease();
  if (!v17)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
LABEL_14:
  unint64_t v18 = v17 - 1;
  if (__OFSUB__(v17, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if ((v16 & 0xC000000000000001) != 0)
  {
LABEL_29:
    id v19 = (id)sub_10004F3B0();
    goto LABEL_19;
  }
  if ((v18 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v18 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_31:
    __break(1u);
    return;
  }
  id v19 = *(id *)(v16 + 8 * v18 + 32);
LABEL_19:
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  id v21 = [v20 endDate];
  sub_10004E3E0();

  sub_10004E3D0();
  double v23 = v22;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  double v24 = fabs(v23);
  if (v24 <= 1800.0)
  {
    double v26 = 1800.0 - v24;
    sub_10004F1E0();
    uint64_t v27 = (void *)HKLogActivity;
    sub_100004F98(&qword_100061368);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_10004FC90;
    *(void *)(v28 + 56) = &type metadata for Double;
    *(void *)(v28 + 64) = &protocol witness table for Double;
    *(double *)(v28 + 32) = v26;
    id v29 = v27;
    sub_10004E4E0();

    swift_bridgeObjectRelease();
    sub_10004F030();
  }
  else
  {
    sub_10004F1E0();
    id v25 = HKLogActivity;
    sub_10004E4E0();

    sub_1000152C8(a1);
  }
}

uint64_t sub_1000152C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v40 = sub_10004E400();
  uint64_t v1 = *(void *)(v40 - 8);
  uint64_t v2 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v40);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  id v6 = (char *)&v35 - v5;
  uint64_t v7 = sub_10004E4A0();
  uint64_t v39 = *(char **)(v7 - 8);
  id v8 = v39;
  __chkstk_darwin(v7);
  char v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004F98((uint64_t *)&unk_100061980);
  uint64_t v12 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v11 - 8);
  id v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v35 - v15;
  uint64_t v36 = sub_10004E4B0();
  uint64_t v41 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  unint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10004F040();
  uint64_t v37 = *(void *)(v19 - 8);
  uint64_t v38 = v19;
  __chkstk_darwin(v19);
  uint64_t v35 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004F030();
  sub_10004E490();
  (*((void (**)(char *, void, uint64_t))v8 + 13))(v10, enum case for Calendar.Component.day(_:), v7);
  sub_10004E3F0();
  sub_10004E440();
  id v21 = *(void (**)(char *, uint64_t))(v1 + 8);
  double v22 = v4;
  uint64_t v23 = v40;
  v21(v22, v40);
  sub_10004E480();
  v21(v6, v23);
  (*((void (**)(char *, uint64_t))v39 + 1))(v10, v7);
  sub_10000509C((uint64_t)v16, (uint64_t)v14, (uint64_t *)&unk_100061980);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v14, 1, v23) == 1)
  {
    sub_100005100((uint64_t)v14, (uint64_t *)&unk_100061980);
    sub_10004F1C0();
    id v24 = HKLogActivity;
    sub_10004E4E0();

    sub_100005100((uint64_t)v16, (uint64_t *)&unk_100061980);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v36);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v42, v35, v38);
  }
  else
  {
    uint64_t v39 = v18;
    uint64_t v26 = (uint64_t)v16;
    uint64_t v28 = v41;
    uint64_t v27 = v42;
    sub_10004E3D0();
    double v30 = v29;
    v21(v14, v23);
    sub_10004F1E0();
    uint64_t v31 = (void *)HKLogActivity;
    if (v30 < 0.0 || v30 >= 7200.0)
    {
      id v34 = HKLogActivity;
      sub_10004E4E0();

      sub_100005100(v26, (uint64_t *)&unk_100061980);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v39, v36);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v27, v35, v38);
    }
    else
    {
      sub_100004F98(&qword_100061368);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_10004FC90;
      *(void *)(v32 + 56) = &type metadata for Double;
      *(void *)(v32 + 64) = &protocol witness table for Double;
      *(double *)(v32 + 32) = v30;
      id v33 = v31;
      sub_10004E4E0();

      swift_bridgeObjectRelease();
      sub_10004F030();
      sub_100005100(v26, (uint64_t *)&unk_100061980);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v39, v36);
      return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v35, v38);
    }
  }
}

uint64_t sub_1000158C4(void *a1)
{
  return sub_1000159AC(a1, (uint64_t)&unk_10005EB60, (uint64_t)sub_100017CF8, (uint64_t)&unk_10005EB78);
}

void sub_1000158EC(uint64_t a1, void *a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    sub_100016A70(&v3, a2);
    swift_endAccess();
    swift_release();
  }
}

uint64_t sub_100015984(void *a1)
{
  return sub_1000159AC(a1, (uint64_t)&unk_10005EB10, (uint64_t)sub_10001673C, (uint64_t)&unk_10005EB28);
}

uint64_t sub_1000159AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v19[0] = a4;
  uint64_t v7 = sub_10004EEF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  char v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10004EF10();
  uint64_t v11 = *(void *)(v20 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(v4 + 24);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = a1;
  aBlock[4] = a3;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000112DC;
  aBlock[3] = v19[0];
  unint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  id v17 = a1;
  sub_10004EF00();
  id v21 = &_swiftEmptyArrayStorage;
  sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
  sub_10004F2F0();
  sub_10004F250();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  swift_release();
  return swift_release();
}

void sub_100015C80(uint64_t a1, void *a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    id v3 = (void *)sub_1000177DC(a2);
    swift_endAccess();
    swift_release();
  }
}

uint64_t sub_100015D10(void *a1)
{
  uint64_t v2 = v1;
  unsigned __int8 v12 = 0;
  uint64_t v4 = *(NSObject **)(v1 + 24);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = &v12;
  v5[3] = v2;
  v5[4] = a1;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1000166F4;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_100016710;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100016060;
  aBlock[3] = &unk_10005EAD8;
  uint64_t v7 = _Block_copy(aBlock);
  swift_retain();
  id v8 = a1;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_100015E88(unsigned char *a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  LOBYTE(a3) = sub_100015F00(a3, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = a3 & 1;
  return result;
}

uint64_t sub_100015F00(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_10004F360();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = sub_10004F270(*(void *)(a2 + 40)),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_100017EEC(0, &qword_100061970);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_10004F280();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_10004F280();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

uint64_t sub_100016060(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100016088()
{
  uint64_t v0 = sub_10004EEF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10004EF10();
  uint64_t v4 = *(void *)(v12 - 8);
  __chkstk_darwin();
  Swift::Int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017EEC(0, (unint64_t *)&qword_100061950);
  uint64_t v7 = (void *)sub_10004F230();
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_100016694;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000112DC;
  aBlock[3] = &unk_10005EA60;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  sub_10004EF00();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000182C8(&qword_100061370, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004F98((uint64_t *)&unk_100061960);
  sub_100018310((unint64_t *)&qword_100061378, (uint64_t *)&unk_100061960);
  sub_10004F2F0();
  sub_10004F250();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v12);
}

uint64_t sub_100016358()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    unsigned __int8 v2 = [*(id *)(result + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_wheelchairCache) isWheelchairUser];
    *(unsigned char *)(v1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser) = v2;
    return swift_release();
  }
  return result;
}

id *sub_1000163D0()
{
  swift_bridgeObjectRelease();
  sub_100005100((uint64_t)v0 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate, (uint64_t *)&unk_100061980);

  return v0;
}

uint64_t sub_100016460()
{
  sub_1000163D0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000164B8()
{
  return type metadata accessor for FitnessWidgetDataProvider();
}

uint64_t type metadata accessor for FitnessWidgetDataProvider()
{
  uint64_t result = qword_100061710;
  if (!qword_100061710) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001650C()
{
  sub_100010B7C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t getEnumTagSinglePayload for FitnessWidgetDataProvider.Layout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FitnessWidgetDataProvider.Layout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FitnessWidgetDataProvider.Layout()
{
  return &type metadata for FitnessWidgetDataProvider.Layout;
}

uint64_t sub_10001665C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016694()
{
  return sub_100016358();
}

uint64_t sub_10001669C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000166AC()
{
  return swift_release();
}

uint64_t sub_1000166B4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000166F4()
{
  return sub_100015E88(*(unsigned char **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_100016700()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016710()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_10001673C()
{
  sub_100015C80(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100016748(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_100017EEC(0, &qword_1000619E0);
    uint64_t v5 = sub_10004F170();
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_100016800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  Class isa = sub_10004E3C0().super.isa;
  Class v14 = sub_10004E3C0().super.isa;
  Class v15 = sub_10004E2F0().super.isa;
  Class v16 = sub_10004E2F0().super.isa;
  aBlock[4] = a5;
  aBlock[5] = a6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100016744;
  aBlock[3] = &unk_10005EC18;
  id v17 = _Block_copy(aBlock);
  id v18 = [v7 initWithStartDate:isa endDate:v14 moveIntervalComponents:v15 exerciseIntervalComponents:v16 initialQueryResultsHandler:v17];
  _Block_release(v17);

  uint64_t v19 = sub_10004E330();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8);
  v20(a4, v19);
  v20(a3, v19);
  uint64_t v21 = sub_10004E400();
  double v22 = *(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8);
  v22(a2, v21);
  v22(a1, v21);
  swift_release();
  return v18;
}

void sub_1000169D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, a3, a4);
  swift_release();
}

uint64_t sub_100016A70(void *a1, void *a2)
{
  char v3 = v2;
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
    uint64_t v9 = sub_10004F340();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100017EEC(0, &qword_100061970);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_10004F330();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100016D10(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100016F08();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_1000171A8((uint64_t)v8, v23);
    *char v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_10004F270(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100017EEC(0, &qword_100061970);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_10004F280();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_10004F280();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *char v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10001722C((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *char v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100016D10(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100004F98(&qword_100061978);
    uint64_t v2 = sub_10004F390();
    uint64_t v14 = v2;
    sub_10004F320();
    if (sub_10004F350())
    {
      sub_100017EEC(0, &qword_100061970);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100016F08();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_10004F270(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_10004F350());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100016F08()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004F98(&qword_100061978);
  uint64_t v3 = sub_10004F380();
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
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_10004F270(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_1000171A8(uint64_t a1, void *a2)
{
  sub_10004F270(a2[5]);
  unint64_t result = sub_10004F310();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10001722C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100016F08();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000173B4();
      goto LABEL_14;
    }
    sub_100017560();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_10004F270(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100017EEC(0, &qword_100061970);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_10004F280();

    if (v12)
    {
LABEL_13:
      sub_10004F420();
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
        char v15 = sub_10004F280();

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

id sub_1000173B4()
{
  uint64_t v1 = v0;
  sub_100004F98(&qword_100061978);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10004F370();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100017560()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004F98(&qword_100061978);
  uint64_t v3 = sub_10004F380();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_10004F270(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000177DC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = sub_10004F360();

    if (v6)
    {
      uint64_t v7 = sub_1000179B4();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = sub_10004F270(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  sub_100017EEC(0, &qword_100061970);
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = sub_10004F280();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = sub_10004F280();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000173B4();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_100017B50(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000179B4()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_10004F330();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_100016D10(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = sub_10004F270(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_100017EEC(0, &qword_100061970);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = sub_10004F280();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_100017B50(v8);
      if (sub_10004F280())
      {
        *uint64_t v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = sub_10004F280();

        if (v13) {
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

unint64_t sub_100017B50(unint64_t result)
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
    uint64_t v8 = sub_10004F300();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = sub_10004F270(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
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

void sub_100017CF8()
{
  sub_1000158EC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_100017D00@<X0>(void *a1@<X8>)
{
  int64_t v2 = *(void **)(v1 + 56);
  *a1 = v2;
  return v2;
}

id sub_100017D30@<X0>(void *a1@<X8>)
{
  int64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics);
  *a1 = v2;
  return v2;
}

unint64_t sub_100017D68()
{
  unint64_t result = qword_1000619B8;
  if (!qword_1000619B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000619B8);
  }
  return result;
}

uint64_t sub_100017DC0(void *a1, void *a2, uint64_t a3)
{
  return sub_1000149CC(a1, a2, a3, *(void *)(v3 + 16), *(uint64_t (**)(void *, uint64_t))(v3 + 24));
}

uint64_t sub_100017DCC()
{
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100017E1C()
{
  sub_100014B1C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void (**)(void *, void))(v0 + 40));
}

uint64_t sub_100017E30(void *a1, unint64_t a2, uint64_t a3)
{
  return sub_1000131C0(a1, a2, a3, *(void *)(v3 + 16), *(void (**)(char *, uint64_t))(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_100017E40()
{
  return sub_100013BE4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100017E4C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100017E8C(void *a1, void *a2, uint64_t a3)
{
  return sub_100012790(a1, a2, a3, *(void *)(v3 + 16), *(void (**)(void *, uint64_t))(v3 + 24));
}

uint64_t sub_100017E98()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100017EE0()
{
  sub_100012908(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void *, void))(v0 + 32));
}

uint64_t sub_100017EEC(uint64_t a1, unint64_t *a2)
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

void sub_100017F2C()
{
  sub_100011C68(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100017F34()
{
  uint64_t v1 = *(void *)(sub_100004F98((uint64_t *)&unk_100061980) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = sub_10004E400();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10001805C()
{
  uint64_t v1 = *(void *)(sub_100004F98((uint64_t *)&unk_100061980) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100011838(v2, v3);
}

uint64_t sub_1000180C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018130()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100018170()
{
  sub_100011384(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void *initializeBufferWithCopyOfBuffer for DataProviderError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DataProviderError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DataProviderError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for DataProviderError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataProviderError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataProviderError(uint64_t result, int a2, int a3)
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

uint64_t sub_1000182AC()
{
  return 0;
}

ValueMetadata *type metadata accessor for DataProviderError()
{
  return &type metadata for DataProviderError;
}

uint64_t sub_1000182C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018310(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000053B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100018360@<X0>(void *a1@<X8>)
{
  return sub_100017D00(a1);
}

id sub_1000183D8@<X0>(void *a1@<X8>)
{
  return sub_100017D30(a1);
}

uint64_t destroy for CircularView(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CircularView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CircularView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  Swift::Int v10 = *(void **)(a1 + 24);
  id v11 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v11;
  id v12 = v11;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CircularView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CircularView()
{
  return &type metadata for CircularView;
}

uint64_t sub_1000185AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000185C8@<X0>(uint64_t a1@<X8>)
{
  v24[0] = a1;
  uint64_t v2 = sub_10004E970();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004F98(&qword_100061B30);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018EB4(v1, (uint64_t)&v28);
  id v11 = *(void **)(v1 + 16);
  Swift::Int v10 = *(void **)(v1 + 24);
  long long v27 = *(_OWORD *)(v1 + 32);
  id v12 = (_OWORD *)swift_allocObject();
  long long v13 = *(_OWORD *)(v1 + 16);
  v12[1] = *(_OWORD *)v1;
  v12[2] = v13;
  v12[3] = *(_OWORD *)(v1 + 32);
  uint64_t v25 = (uint64_t)sub_100018F6C;
  BOOL v26 = v12;
  sub_10000A840(&v28);
  id v14 = v10;
  id v15 = v11;
  sub_10000A814((uint64_t)&v27);
  sub_10004E950();
  uint64_t v16 = sub_100004F98(&qword_100061B38);
  unint64_t v17 = sub_100018F74();
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_release();
  uint64_t v25 = (uint64_t)sub_10004A568(v10);
  BOOL v26 = v18;
  sub_10000C56C();
  uint64_t v19 = sub_10004EBE0();
  uint64_t v21 = v20;
  LOBYTE(v3) = v22 & 1;
  uint64_t v25 = v16;
  BOOL v26 = (_OWORD *)v17;
  swift_getOpaqueTypeConformance2();
  sub_10004EC50();
  sub_10000C5C0(v19, v21, v3);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_100018870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_10004EE50();
  a3[1] = v6;
  uint64_t v7 = sub_100004F98(&qword_100061B48);
  return sub_1000188C8(a2, a1, (uint64_t)a3 + *(int *)(v7 + 44));
}

id sub_1000188C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v5 = sub_10004ED30();
  uint64_t KeyPath = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  __chkstk_darwin(v5);
  id v45 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004F98(&qword_100061B50);
  __chkstk_darwin(v7);
  id v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for StandalonePhoneRingView(0);
  __chkstk_darwin(v10);
  id v12 = (uint64_t *)((char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_100004F98(&qword_100061B58);
  __chkstk_darwin(v13 - 8);
  uint64_t v50 = (uint64_t)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v51 = (uint64_t)&v44 - v16;
  unint64_t v17 = self;
  id result = [v17 sharedBehavior];
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v19 = result;
  unsigned int v20 = [result isStandalonePhoneFitnessMode];

  uint64_t v21 = *(void **)a1;
  char v22 = *(unsigned char *)(a1 + 8);
  id v23 = v21;
  uint64_t v24 = sub_10004ECC0();
  if (v20)
  {
    sub_10002C918(v21, v22, 0, v24, v12);
    sub_100019238((uint64_t)v12, (uint64_t)v9);
    swift_storeEnumTagMultiPayload();
    sub_1000193DC(&qword_100061B60, (void (*)(uint64_t))type metadata accessor for StandalonePhoneRingView);
    sub_100019028();
    sub_10004E920();
    sub_10001929C((uint64_t)v12);
  }
  else
  {
    sub_10002F908(v21, v22, v24, (uint64_t)v52);
    swift_release();
    long long v25 = v52[1];
    *(_OWORD *)id v9 = v52[0];
    *((_OWORD *)v9 + 1) = v25;
    *((void *)v9 + 4) = v53;
    swift_storeEnumTagMultiPayload();
    sub_1000193DC(&qword_100061B60, (void (*)(uint64_t))type metadata accessor for StandalonePhoneRingView);
    sub_100019028();
    sub_10004E920();
  }
  id result = [v17 sharedBehavior];
  if (!result) {
    goto LABEL_11;
  }
  BOOL v26 = result;
  uint64_t v27 = a3;
  unsigned int v28 = [result isStandalonePhoneFitnessMode];

  if (v28)
  {
    sub_10004ED40();
    uint64_t v30 = KeyPath;
    uint64_t v29 = v48;
    uint64_t v31 = v45;
    (*(void (**)(char *, void, uint64_t))(KeyPath + 104))(v45, enum case for Image.ResizingMode.stretch(_:), v48);
    uint64_t v49 = sub_10004ED50();
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v29);
    sub_10004EA40();
    sub_10004EA60();
    uint64_t v48 = sub_10004EAA0();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    sub_10004E5A0();
    sub_10004EE50();
    uint64_t v32 = 1;
    sub_10004E590();
    uint64_t v33 = v54;
    uint64_t v34 = v55;
    uint64_t v35 = v56;
    uint64_t v46 = v57;
    uint64_t v44 = v59;
    id v45 = v58;
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v32 = 0;
    uint64_t v46 = 0;
    uint64_t KeyPath = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v44 = 0;
    id v45 = 0;
  }
  uint64_t v36 = v50;
  sub_10001907C(v51, v50);
  sub_10001907C(v36, v27);
  uint64_t v37 = (uint64_t *)(v27 + *(int *)(sub_100004F98(&qword_100061B70) + 48));
  uint64_t v38 = v48;
  uint64_t v39 = v49;
  *uint64_t v37 = v49;
  v37[1] = 0;
  uint64_t v40 = v46;
  uint64_t v41 = KeyPath;
  v37[2] = v32;
  v37[3] = v41;
  v37[4] = v38;
  v37[5] = v33;
  v37[6] = v34;
  v37[7] = v35;
  uint64_t v43 = v44;
  uint64_t v42 = v45;
  v37[8] = v40;
  v37[9] = (uint64_t)v42;
  v37[10] = v43;
  sub_1000190E4(v39);
  sub_100019134(v51);
  sub_100019194(v39);
  return (id)sub_100019134(v50);
}

uint64_t sub_100018E78@<X0>(uint64_t a1@<X8>)
{
  return sub_1000185C8(a1);
}

uint64_t sub_100018EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018F1C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

id sub_100018F6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100018870(a1, v2 + 16, a2);
}

unint64_t sub_100018F74()
{
  unint64_t result = qword_100061B40;
  if (!qword_100061B40)
  {
    sub_1000053B0(&qword_100061B38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B40);
  }
  return result;
}

uint64_t sub_100018FD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004E750();
  *a1 = result;
  return result;
}

uint64_t sub_100018FFC()
{
  return sub_10004E760();
}

unint64_t sub_100019028()
{
  unint64_t result = qword_100061B68;
  if (!qword_100061B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B68);
  }
  return result;
}

uint64_t sub_10001907C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100061B58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000190E4(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100019134(uint64_t a1)
{
  uint64_t v2 = sub_100004F98(&qword_100061B58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100019194(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000191E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004E750();
  *a1 = result;
  return result;
}

uint64_t sub_10001920C()
{
  return sub_10004E760();
}

uint64_t sub_100019238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandalonePhoneRingView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001929C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StandalonePhoneRingView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000192FC()
{
  unint64_t result = qword_100061B78;
  if (!qword_100061B78)
  {
    sub_1000053B0(&qword_100061B80);
    sub_1000053B0(&qword_100061B38);
    sub_100018F74();
    swift_getOpaqueTypeConformance2();
    sub_1000193DC((unint64_t *)&qword_100061628, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B78);
  }
  return result;
}

uint64_t sub_1000193DC(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_100019424(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
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
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = v15[8];
    sub_100019708(*(void *)v15, v17);
    *(void *)uint64_t v14 = v16;
    v14[8] = v17;
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    unsigned int v20 = *(void **)((char *)a2 + v18);
    *(void *)((char *)a1 + v18) = v20;
    uint64_t v21 = (char *)a1 + v19;
    char v22 = (char *)a2 + v19;
    uint64_t v23 = sub_10004E400();
    uint64_t v24 = *(void *)(v23 - 8);
    long long v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
    id v26 = v20;
    if (v25(v22, 1, v23))
    {
      uint64_t v27 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(v21, v22, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    uint64_t v28 = a3[9];
    uint64_t v29 = a3[10];
    uint64_t v30 = *(void **)((char *)a2 + v28);
    *(void *)((char *)a1 + v28) = v30;
    *((unsigned char *)a1 + v29) = *((unsigned char *)a2 + v29);
    id v31 = v30;
  }
  return a1;
}

uint64_t sub_100019708(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

void sub_100019714(uint64_t a1, int *a2)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_1000198CC(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));

  uint64_t v7 = a1 + a2[8];
  uint64_t v8 = sub_10004E400();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = *(void **)(a1 + a2[9]);
}

uint64_t sub_1000198CC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *sub_1000198D8(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004E5F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_100019708(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = *(void **)((char *)a2 + v16);
  *(void *)((char *)a1 + v16) = v18;
  uint64_t v19 = (char *)a1 + v17;
  unsigned int v20 = (char *)a2 + v17;
  uint64_t v21 = sub_10004E400();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  id v24 = v18;
  if (v23(v20, 1, v21))
  {
    uint64_t v25 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v26 = a3[9];
  uint64_t v27 = a3[10];
  uint64_t v28 = *(void **)((char *)a2 + v26);
  *(void *)((char *)a1 + v26) = v28;
  *((unsigned char *)a1 + v27) = *((unsigned char *)a2 + v27);
  id v29 = v28;
  return a1;
}

void *sub_100019B6C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005100((uint64_t)a1 + v7, &qword_100061B90);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_100019708(*(void *)v13, v15);
  uint64_t v16 = *(void *)v12;
  char v17 = v12[8];
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  sub_1000198CC(v16, v17);
  uint64_t v18 = a3[7];
  uint64_t v19 = *(void **)((char *)a1 + v18);
  unsigned int v20 = *(void **)((char *)a2 + v18);
  *(void *)((char *)a1 + v18) = v20;
  id v21 = v20;

  uint64_t v22 = a3[8];
  uint64_t v23 = (char *)a1 + v22;
  id v24 = (char *)a2 + v22;
  uint64_t v25 = sub_10004E400();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v23, v24, v25);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_14;
  }
  if (v29)
  {
LABEL_14:
    uint64_t v30 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_15:
  uint64_t v31 = a3[9];
  uint64_t v32 = *(void **)((char *)a1 + v31);
  uint64_t v33 = *(void **)((char *)a2 + v31);
  *(void *)((char *)a1 + v31) = v33;
  id v34 = v33;

  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  return a1;
}

char *sub_100019EA8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004E5F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  char v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)char v15 = *(void *)v16;
  uint64_t v17 = *(void *)&a2[v14];
  v15[8] = v16[8];
  *(void *)&a1[v14] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = &a1[v18];
  unsigned int v20 = &a2[v18];
  uint64_t v21 = sub_10004E400();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v24 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  a1[v24] = a2[v24];
  return a1;
}

char *sub_10001A130(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    uint64_t v6 = sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005100((uint64_t)&a1[v8], &qword_100061B90);
    uint64_t v11 = sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004E5F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  uint64_t v16 = *(void *)v15;
  LOBYTE(v15) = v15[8];
  uint64_t v17 = *(void *)v14;
  char v18 = v14[8];
  *(void *)uint64_t v14 = v16;
  v14[8] = (char)v15;
  sub_1000198CC(v17, v18);
  uint64_t v19 = a3[7];
  unsigned int v20 = *(void **)&a1[v19];
  *(void *)&a1[v19] = *(void *)&a2[v19];

  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_10004E400();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_13;
  }
  if (v28)
  {
LABEL_13:
    uint64_t v29 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
LABEL_14:
  uint64_t v30 = a3[9];
  uint64_t v31 = *(void **)&a1[v30];
  *(void *)&a1[v30] = *(void *)&a2[v30];

  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_10001A468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A47C);
}

uint64_t sub_10001A47C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061BA0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 2147483646)
  {
    unint64_t v14 = *(void *)(a1 + a3[7]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    int v15 = v14 - 1;
    if (v15 < 0) {
      int v15 = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[8];
    return v17(v19, a2, v18);
  }
}

uint64_t sub_10001A614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A628);
}

uint64_t sub_10001A628(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004F98(&qword_100061B98);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100004F98(&qword_100061BA0);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[7]) = a2;
  }
  else
  {
    uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[8];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t type metadata accessor for FitnessWidgetView()
{
  uint64_t result = qword_100061C00;
  if (!qword_100061C00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001A800()
{
  sub_10001A9B4(319, &qword_100061C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_10001A9B4(319, (unint64_t *)&unk_100061C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F)
    {
      sub_10001A9B4(319, (unint64_t *)&qword_100061720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_10001A9B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_10001AA18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001AA34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v3 = sub_10004E990();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004F98(&qword_100061C60);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004F98(&qword_100061C68);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004F98(&qword_100061C70);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v37 = v12;
  uint64_t v38 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004F98(&qword_100061C78);
  uint64_t v35 = *(void *)(v16 - 8);
  uint64_t v36 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AE4C(v2, (uint64_t)v8);
  uint64_t v19 = v2 + *(int *)(type metadata accessor for FitnessWidgetView() + 24);
  uint64_t v20 = *(void *)v19;
  char v21 = *(unsigned char *)(v19 + 8);
  sub_100019708(*(void *)v19, v21);
  sub_10001D64C(v20, v21);
  sub_1000198CC(v20, v21);
  LOBYTE(v20) = sub_10004E9D0();
  sub_10004E510();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_10000509C((uint64_t)v8, (uint64_t)v11, &qword_100061C60);
  uint64_t v30 = &v11[*(int *)(v9 + 36)];
  *uint64_t v30 = v20;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_100005100((uint64_t)v8, &qword_100061C60);
  sub_10004E980();
  sub_10004EE50();
  unint64_t v31 = sub_10001D824();
  sub_10004EC80();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v5, v40);
  sub_100005100((uint64_t)v11, &qword_100061C68);
  uint64_t v42 = v9;
  uint64_t v43 = &type metadata for Color;
  unint64_t v44 = v31;
  id v45 = &protocol witness table for Color;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = v37;
  sub_10004EC20();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v32);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v41, v18, v36);
}

uint64_t sub_10001AE4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v93 = sub_100004F98(&qword_100061CF0);
  uint64_t v75 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v76 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v77 = (char *)&v74 - v5;
  uint64_t v91 = sub_100004F98(&qword_100061CC0);
  __chkstk_darwin(v91);
  uint64_t v80 = (uint64_t)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for FitnessWidgetView();
  uint64_t v81 = *((void *)v7 - 1);
  uint64_t v8 = *(void *)(v81 + 64);
  __chkstk_darwin(v7);
  uint64_t v82 = (ValueMetadata *)((char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v87 = sub_100004F98(&qword_100061CF8);
  uint64_t v78 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  id v74 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v79 = (char *)&v74 - v11;
  uint64_t v12 = sub_10004EFB0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v74 - v17;
  uint64_t v88 = sub_100004F98(&qword_100061D00);
  __chkstk_darwin(v88);
  uint64_t v90 = (uint64_t)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100004F98(&qword_100061D08);
  __chkstk_darwin(v83);
  uint64_t v85 = (uint64_t)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_100004F98(&qword_100061CA8);
  __chkstk_darwin(v89);
  uint64_t v86 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = type metadata accessor for StandaloneSummaryView();
  __chkstk_darwin(v84);
  v94 = (uint64_t *)((char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = (uint64_t)[self sharedBehavior];
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v27 = (void *)result;
  unsigned int v28 = [(id)result isStandalonePhoneFitnessMode];

  if (!v28)
  {
    uint64_t v44 = a1;
    sub_10001DC08(&qword_100061B88, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v18);
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for WidgetFamily.systemMedium(_:), v12);
    sub_10001E8BC((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    id v45 = v95;
    uint64_t v46 = v100;
    uint64_t v47 = *(void (**)(char *, uint64_t))(v13 + 8);
    v47(v15, v12);
    v47(v18, v12);
    uint64_t v48 = (uint64_t)v82;
    sub_10001E7F4(v44, (uint64_t)v82, (uint64_t (*)(void))type metadata accessor for FitnessWidgetView);
    unint64_t v49 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
    if (v45 == v46)
    {
      uint64_t v50 = swift_allocObject();
      sub_10001E78C(v48, v50 + v49, (uint64_t (*)(void))type metadata accessor for FitnessWidgetView);
      uint64_t v95 = sub_10001E610;
      uint64_t v96 = v50;
      uint64_t v51 = v80;
      sub_10001CF44(v80);
      sub_10004E5F0();
      sub_10001E8BC(&qword_100061D10, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      uint64_t result = sub_10004F0C0();
      if (result)
      {
        uint64_t v52 = sub_100004F98(&qword_100061CB8);
        v94 = (uint64_t *)&protocol conformance descriptor for GeometryReader<A>;
        uint64_t v53 = sub_10000566C(&qword_100061CC8, &qword_100061CB8);
        uint64_t v54 = sub_10000566C(&qword_100061CD0, &qword_100061CC0);
        unsigned __int8 v55 = v74;
        uint64_t v56 = v91;
        unsigned __int8 v57 = (ValueMetadata *)v54;
        uint64_t v82 = (ValueMetadata *)v54;
        sub_10004EC70();
        sub_100005100(v51, &qword_100061CC0);
        swift_release();
        uint64_t v58 = v78;
        uint64_t v59 = v79;
        uint64_t v60 = v87;
        (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v79, v55, v87);
        (*(void (**)(uint64_t, char *, uint64_t))(v58 + 16))(v85, v59, v60);
        swift_storeEnumTagMultiPayload();
        sub_10001E8BC(&qword_100061CB0, (void (*)(uint64_t))type metadata accessor for StandaloneSummaryView);
        uint64_t v95 = (uint64_t (*)(uint64_t))v52;
        uint64_t v96 = v56;
        uint64_t v97 = v53;
        uint64_t v98 = v57;
        swift_getOpaqueTypeConformance2();
        uint64_t v61 = (uint64_t)v86;
        sub_10004E920();
        sub_10000509C(v61, v90, &qword_100061CA8);
        swift_storeEnumTagMultiPayload();
        sub_10001DA38();
        uint64_t v62 = sub_1000053B0(&qword_100061CD8);
        uint64_t v63 = sub_10000566C(&qword_100061CE0, &qword_100061CD8);
        uint64_t v95 = (uint64_t (*)(uint64_t))v62;
        uint64_t v96 = v56;
        uint64_t v97 = v63;
        uint64_t v98 = v82;
        swift_getOpaqueTypeConformance2();
        sub_10004E920();
        sub_100005100(v61, &qword_100061CA8);
        return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v79, v60);
      }
      __break(1u);
    }
    else
    {
      uint64_t v64 = swift_allocObject();
      sub_10001E78C(v48, v64 + v49, (uint64_t (*)(void))type metadata accessor for FitnessWidgetView);
      uint64_t v95 = sub_10001E3BC;
      uint64_t v96 = v64;
      uint64_t v65 = v80;
      sub_10001CF44(v80);
      sub_10004E5F0();
      sub_10001E8BC(&qword_100061D10, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      uint64_t result = sub_10004F0C0();
      if (result)
      {
        uint64_t v66 = sub_100004F98(&qword_100061CD8);
        uint64_t v67 = sub_10000566C(&qword_100061CE0, &qword_100061CD8);
        uint64_t v68 = sub_10000566C(&qword_100061CD0, &qword_100061CC0);
        unint64_t v69 = v76;
        uint64_t v70 = v91;
        sub_10004EC70();
        sub_100005100(v65, &qword_100061CC0);
        swift_release();
        uint64_t v71 = v75;
        uint64_t v72 = v77;
        uint64_t v73 = v93;
        (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v77, v69, v93);
        (*(void (**)(uint64_t, char *, uint64_t))(v71 + 16))(v90, v72, v73);
        swift_storeEnumTagMultiPayload();
        sub_10001DA38();
        uint64_t v95 = (uint64_t (*)(uint64_t))v66;
        uint64_t v96 = v70;
        uint64_t v97 = v67;
        uint64_t v98 = (ValueMetadata *)v68;
        swift_getOpaqueTypeConformance2();
        sub_10004E920();
        return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v72, v73);
      }
    }
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v98 = &type metadata for WidgetFeatureFlags;
  unint64_t v99 = sub_10001E6BC();
  char v29 = sub_10004E4D0();
  sub_10001E710((uint64_t)&v95);
  if (qword_1000611F0 != -1) {
    swift_once();
  }
  char v30 = *(unsigned char *)(a1 + v7[10]);
  unint64_t v31 = (void *)qword_1000648F8;
  uint64_t v32 = *(void **)(a1 + v7[7]);
  sub_10000509C(a1 + v7[8], (uint64_t)v24, (uint64_t *)&unk_100061980);
  id v33 = v32;
  id v34 = v31;
  char v35 = v29 & 1;
  uint64_t v36 = v94;
  sub_100033838(v35, v34, v30, v32, (uint64_t)v24, v94);
  sub_10001E7F4((uint64_t)v36, v85, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  swift_storeEnumTagMultiPayload();
  sub_10001E8BC(&qword_100061CB0, (void (*)(uint64_t))type metadata accessor for StandaloneSummaryView);
  uint64_t v37 = sub_1000053B0(&qword_100061CB8);
  uint64_t v38 = sub_10000566C(&qword_100061CC8, &qword_100061CB8);
  uint64_t v39 = sub_10000566C(&qword_100061CD0, &qword_100061CC0);
  uint64_t v40 = v91;
  uint64_t v95 = (uint64_t (*)(uint64_t))v37;
  uint64_t v96 = v91;
  uint64_t v97 = v38;
  uint64_t v98 = (ValueMetadata *)v39;
  swift_getOpaqueTypeConformance2();
  uint64_t v41 = (uint64_t)v86;
  sub_10004E920();
  sub_10000509C(v41, v90, &qword_100061CA8);
  swift_storeEnumTagMultiPayload();
  sub_10001DA38();
  uint64_t v42 = sub_1000053B0(&qword_100061CD8);
  uint64_t v43 = sub_10000566C(&qword_100061CE0, &qword_100061CD8);
  uint64_t v95 = (uint64_t (*)(uint64_t))v42;
  uint64_t v96 = v40;
  uint64_t v97 = v43;
  uint64_t v98 = (ValueMetadata *)v39;
  swift_getOpaqueTypeConformance2();
  sub_10004E920();
  sub_100005100(v41, &qword_100061CA8);
  return sub_10001E85C((uint64_t)v94, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
}

uint64_t sub_10001BC38@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_10004E800();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_100004F98(&qword_100061D20);
  return sub_10001BC98(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_10001BC98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v131 = a2;
  uint64_t v127 = type metadata accessor for ChartsSection();
  __chkstk_darwin(v127);
  v118 = (uint64_t *)((char *)&v115 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  uint64_t v119 = (uint64_t)&v115 - v5;
  uint64_t v124 = sub_100004F98(&qword_100061D28);
  __chkstk_darwin(v124);
  uint64_t v126 = (uint64_t)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = type metadata accessor for PauseRingsLabel();
  __chkstk_darwin(v125);
  v121 = (uint64_t *)((char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  uint64_t v123 = (uint64_t)&v115 - v9;
  uint64_t v134 = sub_10004E400();
  uint64_t v145 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  v122 = (char *)&v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004F98(&qword_100061D30);
  __chkstk_darwin(v11 - 8);
  v130 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v129 = (uint64_t)&v115 - v14;
  uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v15 - 8);
  v143 = (char *)&v115 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v142 = (uint64_t)&v115 - v18;
  __chkstk_darwin(v19);
  uint64_t v140 = (uint64_t)&v115 - v20;
  __chkstk_darwin(v21);
  uint64_t v132 = (uint64_t)&v115 - v22;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v115 - v24;
  __chkstk_darwin(v26);
  unsigned int v28 = (char *)&v115 - v27;
  uint64_t v29 = type metadata accessor for SummarySection();
  __chkstk_darwin(v29 - 8);
  unint64_t v31 = (uint64_t *)((char *)&v115 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v135 = sub_100004F98(&qword_100061D38);
  __chkstk_darwin(v135);
  uint64_t v137 = (uint64_t)&v115 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_100004F98(&qword_100061D40);
  __chkstk_darwin(v136);
  uint64_t v141 = (uint64_t)&v115 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100004F98(&qword_100061D48);
  __chkstk_darwin(v139);
  v128 = (char *)&v115 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  uint64_t v138 = (uint64_t)&v115 - v36;
  __chkstk_darwin(v37);
  uint64_t v144 = (uint64_t)&v115 - v38;
  uint64_t v39 = (int *)type metadata accessor for FitnessWidgetView();
  uint64_t v116 = v39[7];
  uint64_t v40 = *(void **)(a1 + v116);
  *((void *)&v147 + 1) = &type metadata for WidgetFeatureFlags;
  *(void *)&long long v148 = sub_10001E6BC();
  id v41 = v40;
  char v42 = sub_10004E4D0();
  sub_10001E710((uint64_t)&v146);
  sub_10004E5A0();
  double v44 = v43;
  uint64_t v115 = v39[10];
  char v45 = *(unsigned char *)(a1 + v115);
  v117 = v39;
  uint64_t v46 = a1 + v39[8];
  sub_10000509C(v46, (uint64_t)v28, (uint64_t *)&unk_100061980);
  v133 = v31;
  uint64_t v47 = v31;
  v120 = v28;
  uint64_t v48 = v134;
  sub_1000222E8(v40, v42 & 1, v45, (uint64_t)v28, v47, v44);
  sub_10004E5A0();
  sub_10000509C(v46, (uint64_t)v25, (uint64_t *)&unk_100061980);
  unint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v145 + 48);
  int v50 = v49(v25, 1, v48);
  uint64_t v51 = a1;
  sub_100005100((uint64_t)v25, (uint64_t *)&unk_100061980);
  if (v50 == 1) {
    sub_10001CB64();
  }
  uint64_t v52 = v132;
  sub_10000509C(v46, v132, (uint64_t *)&unk_100061980);
  int v53 = v49((char *)v52, 1, v48);
  sub_100005100(v52, (uint64_t *)&unk_100061980);
  if (v53 == 1) {
    sub_10001CB64();
  }
  sub_10004EE50();
  sub_10004E590();
  uint64_t v54 = (uint64_t)v133;
  uint64_t v55 = v137;
  sub_10001E7F4((uint64_t)v133, v137, (uint64_t (*)(void))type metadata accessor for SummarySection);
  uint64_t v56 = (_OWORD *)(v55 + *(int *)(v135 + 36));
  long long v57 = v147;
  *uint64_t v56 = v146;
  v56[1] = v57;
  v56[2] = v148;
  sub_10001E85C(v54, (uint64_t (*)(void))type metadata accessor for SummarySection);
  char v58 = sub_10004EA10();
  uint64_t v59 = v140;
  sub_10000509C(v46, v140, (uint64_t *)&unk_100061980);
  int v60 = v49((char *)v59, 1, v48);
  sub_100005100(v59, (uint64_t *)&unk_100061980);
  if (v60 == 1) {
    sub_10001CB64();
  }
  sub_10004E510();
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  uint64_t v69 = v141;
  sub_10000509C(v55, v141, &qword_100061D38);
  uint64_t v70 = v69 + *(int *)(v136 + 36);
  *(unsigned char *)uint64_t v70 = v58;
  *(void *)(v70 + 8) = v62;
  *(void *)(v70 + 16) = v64;
  *(void *)(v70 + 24) = v66;
  *(void *)(v70 + 32) = v68;
  *(unsigned char *)(v70 + 40) = 0;
  sub_100005100(v55, &qword_100061D38);
  char v71 = sub_10004E9F0();
  sub_10001CB64();
  sub_10004E510();
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v79 = v78;
  uint64_t v80 = v138;
  sub_10000509C(v69, v138, &qword_100061D40);
  uint64_t v81 = v80 + *(int *)(v139 + 36);
  *(unsigned char *)uint64_t v81 = v71;
  *(void *)(v81 + 8) = v73;
  *(void *)(v81 + 16) = v75;
  *(void *)(v81 + 24) = v77;
  *(void *)(v81 + 32) = v79;
  *(unsigned char *)(v81 + 40) = 0;
  sub_100005100(v69, &qword_100061D40);
  uint64_t v82 = v80;
  uint64_t v83 = v144;
  sub_10000B630(v82, v144, &qword_100061D48);
  uint64_t v84 = v142;
  sub_10000509C(v46, v142, (uint64_t *)&unk_100061980);
  int v85 = v49((char *)v84, 1, v48);
  sub_100005100(v84, (uint64_t *)&unk_100061980);
  uint64_t v86 = v143;
  sub_10000509C(v46, (uint64_t)v143, (uint64_t *)&unk_100061980);
  if (v49(v86, 1, v48) == 1)
  {
    sub_100005100((uint64_t)v86, (uint64_t *)&unk_100061980);
    char v87 = sub_10001CB64();
    uint64_t v88 = v131;
    uint64_t v89 = (uint64_t)v130;
    uint64_t v90 = v129;
    uint64_t v91 = (uint64_t)v128;
    if (v87)
    {
      uint64_t v92 = sub_100004F98(&qword_100061D68);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))(v90, 1, 1, v92);
    }
    else
    {
      uint64_t v101 = *(void **)(v51 + v116);
      v143 = *(char **)(v51 + v117[9]);
      uint64_t v102 = v143;
      char v103 = *(unsigned char *)(v51 + v115);
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v105 = (uint64_t)v118;
      uint64_t *v118 = KeyPath;
      sub_100004F98(&qword_100061D50);
      swift_storeEnumTagMultiPayload();
      LODWORD(v145) = v85;
      uint64_t v106 = v127;
      *(void *)(v105 + *(int *)(v127 + 20)) = v101;
      *(void *)(v105 + *(int *)(v106 + 24)) = v102;
      *(unsigned char *)(v105 + *(int *)(v106 + 28)) = v103;
      uint64_t v107 = v119;
      sub_10001E78C(v105, v119, (uint64_t (*)(void))type metadata accessor for ChartsSection);
      sub_10001E7F4(v107, v126, (uint64_t (*)(void))type metadata accessor for ChartsSection);
      swift_storeEnumTagMultiPayload();
      sub_10001E8BC(&qword_100061D58, (void (*)(uint64_t))type metadata accessor for PauseRingsLabel);
      sub_10001E8BC(&qword_100061D60, (void (*)(uint64_t))type metadata accessor for ChartsSection);
      id v108 = v101;
      uint64_t v83 = v144;
      uint64_t v109 = v143;
      int v85 = v145;
      sub_10004E920();
      sub_10001E85C(v107, (uint64_t (*)(void))type metadata accessor for ChartsSection);
      uint64_t v110 = sub_100004F98(&qword_100061D68);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v89, 0, 1, v110);
      sub_10000B630(v89, v90, &qword_100061D30);
    }
  }
  else
  {
    int v93 = v85;
    uint64_t v94 = v145;
    uint64_t v95 = v122;
    (*(void (**)(char *, char *, uint64_t))(v145 + 32))(v122, v86, v48);
    uint64_t v96 = (uint64_t)v120;
    (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v120, v95, v48);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v94 + 56))(v96, 0, 1, v48);
    uint64_t v97 = swift_getKeyPath();
    uint64_t v98 = (uint64_t)v121;
    uint64_t *v121 = v97;
    sub_100004F98(&qword_100061B88);
    swift_storeEnumTagMultiPayload();
    sub_10000B630(v96, v98 + *(int *)(v125 + 20), (uint64_t *)&unk_100061980);
    uint64_t v99 = v123;
    sub_10001E78C(v98, v123, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
    sub_10001E7F4(v99, v126, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
    swift_storeEnumTagMultiPayload();
    sub_10001E8BC(&qword_100061D58, (void (*)(uint64_t))type metadata accessor for PauseRingsLabel);
    sub_10001E8BC(&qword_100061D60, (void (*)(uint64_t))type metadata accessor for ChartsSection);
    uint64_t v89 = (uint64_t)v130;
    sub_10004E920();
    sub_10001E85C(v99, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
    (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v48);
    int v85 = v93;
    uint64_t v100 = sub_100004F98(&qword_100061D68);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v89, 0, 1, v100);
    uint64_t v90 = v129;
    sub_10000B630(v89, v129, &qword_100061D30);
    uint64_t v88 = v131;
    uint64_t v91 = (uint64_t)v128;
  }
  if (v85 == 1) {
    uint64_t v111 = 0x4034000000000000;
  }
  else {
    uint64_t v111 = 0x4024000000000000;
  }
  sub_10000509C(v83, v91, &qword_100061D48);
  sub_10000509C(v90, v89, &qword_100061D30);
  sub_10000509C(v91, v88, &qword_100061D48);
  uint64_t v112 = sub_100004F98(&qword_100061D70);
  uint64_t v113 = v88 + *(int *)(v112 + 48);
  *(void *)uint64_t v113 = v111;
  *(unsigned char *)(v113 + 8) = 0;
  sub_10000509C(v89, v88 + *(int *)(v112 + 64), &qword_100061D30);
  sub_100005100(v90, &qword_100061D30);
  sub_100005100(v83, &qword_100061D48);
  sub_100005100(v89, &qword_100061D30);
  return sub_100005100(v91, &qword_100061D48);
}

uint64_t sub_10001CB64()
{
  uint64_t v0 = sub_10004E5F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v23 - v5;
  uint64_t v7 = sub_10004EFB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v23 - v12;
  v26[3] = &type metadata for WidgetFeatureFlags;
  v26[4] = sub_10001E6BC();
  char v14 = sub_10004E4D0();
  sub_10001E710((uint64_t)v26);
  if (v14)
  {
    char v15 = 1;
  }
  else
  {
    uint64_t v23 = v3;
    uint64_t v24 = v1;
    sub_10001DC08(&qword_100061B88, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v13);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemSmall(_:), v7);
    sub_10001E8BC((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    uint64_t v16 = v25;
    uint64_t v17 = v26[0];
    uint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
    v18(v10, v7);
    v18(v13, v7);
    type metadata accessor for FitnessWidgetView();
    sub_10001DC08(&qword_100061B90, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, (uint64_t)v6);
    if (v17 == v16)
    {
      char v15 = sub_10004E5E0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v0);
    }
    else
    {
      uint64_t v19 = v23;
      uint64_t v20 = v24;
      (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for DynamicTypeSize.accessibility2(_:), v0);
      sub_10001E8BC(&qword_100061D78, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      char v15 = sub_10004F0B0() ^ 1;
      uint64_t v21 = *(void (**)(char *, uint64_t))(v20 + 8);
      v21(v19, v0);
      v21(v6, v0);
    }
  }
  return v15 & 1;
}

uint64_t sub_10001CF44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004EFB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v28 - v12;
  sub_10001DC08(&qword_100061B88, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v28 - v12);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemSmall(_:), v7);
  sub_10001E8BC((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v15 = v28[0];
  uint64_t v14 = v28[1];
  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
  char v17 = sub_10001CB64();
  char v18 = v17;
  if (v14 == v15)
  {
    uint64_t v19 = sub_10004E5F0();
    if (v18) {
      uint64_t v20 = (unsigned int *)&enum case for DynamicTypeSize.accessibility5(_:);
    }
    else {
      uint64_t v20 = (unsigned int *)&enum case for DynamicTypeSize.xLarge(_:);
    }
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(a1, *v20, v19);
  }
  else
  {
    if ((v17 & 1) != 0
      && (uint64_t v21 = type metadata accessor for FitnessWidgetView(),
          sub_10000509C(v2 + *(int *)(v21 + 32), (uint64_t)v6, (uint64_t *)&unk_100061980),
          uint64_t v22 = sub_10004E400(),
          int v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v6, 1, v22),
          sub_100005100((uint64_t)v6, (uint64_t *)&unk_100061980),
          v23 == 1))
    {
      uint64_t v24 = (unsigned int *)&enum case for DynamicTypeSize.accessibility2(_:);
    }
    else
    {
      uint64_t v24 = (unsigned int *)&enum case for DynamicTypeSize.xxLarge(_:);
    }
    uint64_t v25 = *v24;
    uint64_t v26 = sub_10004E5F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(a1, v25, v26);
  }
}

uint64_t sub_10001D298@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v32[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v6 = type metadata accessor for SummarySection();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (uint64_t *)&v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v9 = sub_100004F98(&qword_100061D80);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v13 = (int *)type metadata accessor for FitnessWidgetView();
  uint64_t v14 = *(void **)(a1 + v13[7]);
  uint64_t v33 = &type metadata for WidgetFeatureFlags;
  unint64_t v34 = sub_10001E6BC();
  id v15 = v14;
  char v16 = sub_10004E4D0();
  sub_10001E710((uint64_t)v32);
  sub_10004E5A0();
  double v18 = v17;
  char v19 = *(unsigned char *)(a1 + v13[10]);
  sub_10000509C(a1 + v13[8], (uint64_t)v5, (uint64_t *)&unk_100061980);
  sub_1000222E8(v14, v16 & 1, v19, (uint64_t)v5, v8, v18);
  char v20 = sub_10004E9F0();
  sub_10001CB64();
  sub_10004E510();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  sub_10001E7F4((uint64_t)v8, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SummarySection);
  uint64_t v29 = &v12[*(int *)(v10 + 44)];
  char *v29 = v20;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  sub_10001E85C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for SummarySection);
  return sub_10000B630((uint64_t)v12, v31, &qword_100061D80);
}

uint64_t sub_10001D4F0@<X0>(void *a1@<X8>)
{
  if (qword_100061138 != -1) {
    swift_once();
  }
  *a1 = qword_100064860;

  return swift_retain();
}

uint64_t sub_10001D560()
{
  return sub_10004E670();
}

uint64_t sub_10001D584(uint64_t a1)
{
  uint64_t v2 = sub_10004E8B0();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_10004E680();
}

uint64_t sub_10001D64C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10004E7E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_10004F1D0();
  uint64_t v9 = sub_10004E9B0();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_10001DF00(1819242306, 0xE400000000000000, &v12);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10004E7D0();
  swift_getAtKeyPath();
  sub_1000198CC(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

unint64_t sub_10001D824()
{
  unint64_t result = qword_100061C80;
  if (!qword_100061C80)
  {
    sub_1000053B0(&qword_100061C68);
    sub_10001D8A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061C80);
  }
  return result;
}

unint64_t sub_10001D8A0()
{
  unint64_t result = qword_100061C88;
  if (!qword_100061C88)
  {
    sub_1000053B0(&qword_100061C60);
    sub_10001D914();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061C88);
  }
  return result;
}

unint64_t sub_10001D914()
{
  unint64_t result = qword_100061C90;
  if (!qword_100061C90)
  {
    sub_1000053B0(&qword_100061C98);
    sub_10001DA38();
    sub_1000053B0(&qword_100061CD8);
    sub_1000053B0(&qword_100061CC0);
    sub_10000566C(&qword_100061CE0, &qword_100061CD8);
    sub_10000566C(&qword_100061CD0, &qword_100061CC0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061C90);
  }
  return result;
}

unint64_t sub_10001DA38()
{
  unint64_t result = qword_100061CA0;
  if (!qword_100061CA0)
  {
    sub_1000053B0(&qword_100061CA8);
    sub_10001E8BC(&qword_100061CB0, (void (*)(uint64_t))type metadata accessor for StandaloneSummaryView);
    sub_1000053B0(&qword_100061CB8);
    sub_1000053B0(&qword_100061CC0);
    sub_10000566C(&qword_100061CC8, &qword_100061CB8);
    sub_10000566C(&qword_100061CD0, &qword_100061CC0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061CA0);
  }
  return result;
}

uint64_t sub_10001DB8C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DC08(&qword_100061B88, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_10001DBC8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DC08(&qword_100061B90, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_10001DC08@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_10004E7E0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004F98(a1);
  __chkstk_darwin(v15);
  double v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000509C(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_10004F1D0();
    uint64_t v21 = sub_10004E9B0();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_10001DF00(a3, v23, &v24);
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10004E7D0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_10001DE90@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DC08(&qword_100061D88, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x80000001000590D0, a1);
}

uint64_t sub_10001DEC8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DC08(&qword_100061D50, (uint64_t (*)(void))&type metadata accessor for ContentSizeCategory, 0xD000000000000013, 0x80000001000590B0, a1);
}

unint64_t sub_10001DF00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_10001DFD4(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001E0D4((uint64_t)v12, *a3);
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
      sub_10001E0D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001E710((uint64_t)v12);
  return v7;
}

unint64_t sub_10001DFD4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_10001E130(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_10004F3C0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10001E0D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_10001E130(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_10001E1C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001E2CC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001E2CC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_10001E1C8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_10001E264(v2, 0);
      unint64_t result = (void *)sub_10004F3A0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_10004F130();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001E264(uint64_t a1, uint64_t a2)
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
  sub_100004F98(&qword_100061CE8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10001E2CC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004F98(&qword_100061CE8);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001E3BC(uint64_t a1)
{
  return sub_10001E628(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10001D298);
}

uint64_t sub_10001E3D8()
{
  uint64_t v1 = (int *)type metadata accessor for FitnessWidgetView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_1000198CC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));

  uint64_t v9 = v5 + v1[8];
  uint64_t v10 = sub_10004E400();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10001E610(uint64_t a1)
{
  return sub_10001E628(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10001BC38);
}

uint64_t sub_10001E628(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for FitnessWidgetView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_10001E6BC()
{
  unint64_t result = qword_100061D18;
  if (!qword_100061D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061D18);
  }
  return result;
}

uint64_t sub_10001E710(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001E760()
{
  return sub_10004E670();
}

uint64_t sub_10001E78C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001E7F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001E85C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001E8BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001E904()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001E9A8(uint64_t a1)
{
  return sub_10001EB8C(a1, &qword_100064860);
}

uint64_t sub_10001E9CC()
{
  uint64_t v0 = sub_10004ECB0();
  __n128 v1 = __chkstk_darwin(v0);
  (*(void (**)(char *, void, __n128))(v3 + 104))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:), v1);
  uint64_t result = sub_10004ED10();
  qword_100064868 = result;
  return result;
}

void sub_10001EAA4(uint64_t a1)
{
}

void sub_10001EAC0(uint64_t a1)
{
}

void sub_10001EADC(uint64_t a1)
{
}

void sub_10001EAF8(uint64_t a1)
{
}

void sub_10001EB14(uint64_t a1)
{
}

void sub_10001EB30(uint64_t a1)
{
}

void sub_10001EB4C(uint64_t a1)
{
}

uint64_t sub_10001EB68(uint64_t a1)
{
  return sub_10001EB8C(a1, &qword_1000648A8);
}

uint64_t sub_10001EB8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10004ECB0();
  __n128 v4 = __chkstk_darwin(v3);
  (*(void (**)(char *, void, __n128))(v6 + 104))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:), v4);
  uint64_t result = sub_10004ED00();
  *a2 = result;
  return result;
}

void sub_10001EC80(uint64_t a1)
{
}

void sub_10001EC9C(uint64_t a1)
{
}

void sub_10001ECB8(uint64_t a1)
{
}

void sub_10001ECD4(uint64_t a1, SEL *a2, SEL *a3, uint64_t *a4)
{
  id v6 = [self *a2];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 *a3];

    if (v8)
    {
      *a4 = sub_10004ED20();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

BOOL sub_10001ED58()
{
  if ([v0 activityMoveMode] == (id)2)
  {
    id v1 = [v0 appleMoveTimeGoal];
    id v2 = [self minuteUnit];
  }
  else
  {
    id v1 = [v0 activeEnergyBurnedGoal];
    id v2 = [self smallCalorieUnit];
  }
  id v3 = v2;
  [v1 doubleValueForUnit:v3];
  double v5 = v4;

  return v5 > 0.0;
}

void sub_10001EE38()
{
  qword_1000648C8 = (uint64_t)&off_10005DAB8;
}

void sub_10001EE4C()
{
  qword_1000648D0 = (uint64_t)&off_10005DD38;
}

void sub_10001EE60()
{
  qword_1000648D8 = (uint64_t)&off_10005DFB8;
}

int64_t sub_10001EE74(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001EEB8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v50 = *(double *)&a2;
  uint64_t v51 = a7;
  uint64_t v53 = a6;
  uint64_t v54 = a4;
  uint64_t v10 = sub_10004E4A0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v14 - 8);
  uint64_t v52 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v55 = sub_10004E400();
  uint64_t v19 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  __n128 v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v42 - v23;
  id v25 = 0;
  if (a3) {
    return (uint64_t)v25;
  }
  uint64_t v45 = v21;
  unsigned int v26 = enum case for Calendar.Component.minute(_:);
  unint64_t v49 = *(uint64_t (**)(char *, void, uint64_t, __n128))(v11 + 104);
  uint64_t result = v49(v13, enum case for Calendar.Component.minute(_:), v10, v22);
  if ((unsigned __int128)(a1 * (__int128)a5) >> 64 == (a1 * a5) >> 63)
  {
    unsigned int v46 = v26;
    uint64_t v47 = a5;
    uint64_t v48 = v24;
    sub_10004E480();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v11 + 8);
    v28(v13, v10);
    uint64_t v53 = v19;
    uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    if (v29(v18, 1, v55) == 1)
    {
      uint64_t v30 = (uint64_t)v18;
    }
    else
    {
      uint64_t v31 = v48;
      double v43 = *(void (**)(void))(v53 + 32);
      uint64_t v44 = v53 + 32;
      v43();
      ((void (*)(char *, void, uint64_t))v49)(v13, v46, v10);
      uint64_t v32 = v52;
      sub_10004E480();
      uint64_t v33 = v55;
      v28(v13, v10);
      if (v29(v32, 1, v33) != 1)
      {
        double v34 = v50;
        uint64_t v35 = v45;
        ((void (*)(uint64_t, char *, uint64_t))v43)(v45, v32, v33);
        id v36 = objc_allocWithZone((Class)_HKActivityStatisticsQuantityInfo);
        uint64_t v37 = v33;
        Class isa = sub_10004E3C0().super.isa;
        Class v39 = sub_10004E3C0().super.isa;
        id v25 = [v36 initWithStartDate:isa endDate:v39];

        id v40 = [self quantityWithUnit:v51 doubleValue:v34];
        [v25 setQuantityValue:v40];

        id v41 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
        v41(v35, v37);
        v41((uint64_t)v31, v37);
        return (uint64_t)v25;
      }
      (*(void (**)(char *, uint64_t))(v53 + 8))(v31, v33);
      uint64_t v30 = (uint64_t)v32;
    }
    sub_1000205CC(v30);
    return 0;
  }
  __break(1u);
  return result;
}

id sub_10001F308(double a1)
{
  uint64_t v2 = sub_10004E4A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  double v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10004E400();
  uint64_t v10 = *(void *)(v9 - 8);
  __n128 v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v3 + 104))(v5, enum case for Calendar.Component.hour(_:), v2, v11);
  sub_10004E480();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
    sub_10004E390();
    if (a1 == 1.0)
    {
      id v16 = [objc_allocWithZone((Class)_HKActivityStatisticsStandHourInfo) initWithTimeStamp:0 state:v15];
    }
    else
    {
      if (a1 != 2.0)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
        return 0;
      }
      id v16 = [objc_allocWithZone((Class)_HKActivityStatisticsStandHourInfo) initWithTimeStamp:1 state:v15];
    }
    id v14 = v16;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    return v14;
  }
  sub_1000205CC((uint64_t)v8);
  return 0;
}

void sub_10001F5E8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      id v8 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        memcpy(v8 + 4, (const void *)(a2 + 8 * a3), 8 * v5);
        return;
      }
    }
    else
    {
      sub_100004F98(&qword_1000613A8);
      id v8 = (void *)swift_allocObject();
      int64_t v9 = j__malloc_size(v8);
      uint64_t v10 = v9 - 32;
      if (v9 < 32) {
        uint64_t v10 = v9 - 25;
      }
      v8[2] = v5;
      v8[3] = 2 * (v10 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_10001F6B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      id v8 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        memcpy(v8 + 4, (const void *)(a2 + 16 * a3), 16 * v5);
        return;
      }
    }
    else
    {
      sub_100004F98(&qword_100061DA0);
      id v8 = (void *)swift_allocObject();
      int64_t v9 = j__malloc_size(v8);
      uint64_t v10 = v9 - 32;
      if (v9 < 32) {
        uint64_t v10 = v9 - 17;
      }
      v8[2] = v5;
      v8[3] = 2 * (v10 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

id sub_10001F778(double a1, double a2, double a3, double a4, double a5)
{
  id result = [self sharedBehavior];
  if (result)
  {
    __n128 v11 = result;
    unsigned int v12 = [result isStandalonePhoneFitnessMode];

    id v13 = [objc_allocWithZone((Class)HKActivitySummary) init];
    id v14 = self;
    id v15 = [v14 kilocalorieUnit];
    id v16 = self;
    id v17 = [v16 quantityWithUnit:v15 doubleValue:500.0];

    [v13 setActiveEnergyBurnedGoal:v17];
    id v18 = [v14 kilocalorieUnit];
    id v19 = [v16 quantityWithUnit:v18 doubleValue:a1];

    [v13 setActiveEnergyBurned:v19];
    id v20 = [v14 minuteUnit];
    double v21 = 30.0;
    if (v12)
    {
      double v21 = 0.0;
      double v22 = 0.0;
    }
    else
    {
      double v22 = a2;
    }
    if (v12) {
      double v23 = 0.0;
    }
    else {
      double v23 = 8.0;
    }
    if (v12) {
      a3 = 0.0;
    }
    id v24 = [v16 quantityWithUnit:v20 doubleValue:v21];

    [v13 setAppleExerciseTimeGoal:v24];
    id v25 = [v14 minuteUnit];
    id v26 = [v16 quantityWithUnit:v25 doubleValue:v22];

    [v13 setAppleExerciseTime:v26];
    id v27 = [v14 countUnit];
    id v28 = [v16 quantityWithUnit:v27 doubleValue:v23];

    [v13 setAppleStandHoursGoal:v28];
    id v29 = [v14 countUnit];
    id v30 = [v16 quantityWithUnit:v29 doubleValue:a3];

    [v13 setAppleStandHours:v30];
    id v31 = [v14 countUnit];
    id v32 = [v16 quantityWithUnit:v31 doubleValue:a4];

    [v13 setStepCount:v32];
    id v33 = [v14 mileUnit];
    id v34 = [v16 quantityWithUnit:v33 doubleValue:a5];

    [v13 setDistanceWalkingRunning:v34];
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_10001FB28(uint64_t a1, uint64_t (*a2)(uint64_t, void, void))
{
  id result = &_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    uint64_t v7 = (unsigned __int8 *)(a1 + 40);
    do
    {
      if (a2(v6, *((void *)v7 - 1), *v7))
      {
        sub_10004F150();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10004F190();
        }
        sub_10004F1A0();
        sub_10004F180();
      }
      ++v6;
      v7 += 16;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001FC34(uint64_t a1, uint64_t (*a2)(uint64_t, double))
{
  id result = &_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (a2(i, *(double *)(a1 + 8 * i + 32)))
      {
        sub_10004F150();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10004F190();
        }
        sub_10004F1A0();
        sub_10004F180();
      }
    }
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

id sub_10001FD30(uint64_t a1)
{
  uint64_t v69 = sub_10004E400();
  uint64_t v3 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v70 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t (*)(char *, uint64_t))((char *)&v62 - v6);
  uint64_t v8 = sub_10004E4B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  __n128 v11 = (uint64_t (*)(char *, uint64_t))((char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v12 = a1 + 7;
  if (__OFADD__(a1, 7))
  {
    __break(1u);
  }
  else if (qword_1000611A0 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  if (a1 + 0x4000000000000007 >= 0)
  {
    uint64_t v71 = v8;
    uint64_t v72 = v9;
    uint64_t v68 = v7;
    int64_t v1 = 2 * v12;
    int64_t v13 = sub_10001EE74(2 * v12, qword_1000648C8);
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    unint64_t v19 = v18;
    if (v18)
    {
      sub_10004F410();
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      id v20 = (void *)swift_dynamicCastClass();
      if (!v20)
      {
        swift_unknownObjectRelease();
        id v20 = &_swiftEmptyArrayStorage;
      }
      uint64_t v21 = v20[2];
      swift_release();
      if (__OFSUB__(v19 >> 1, v17))
      {
        __break(1u);
      }
      else if (v21 == (v19 >> 1) - v17)
      {
        if (!swift_dynamicCastClass()) {
          swift_unknownObjectRelease();
        }
LABEL_13:
        swift_unknownObjectRelease();
        if (qword_1000611A8 == -1) {
          goto LABEL_14;
        }
        goto LABEL_38;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    sub_10001F6B0(v13, v15, v17, v19);
    goto LABEL_13;
  }
  __break(1u);
LABEL_38:
  swift_once();
LABEL_14:
  int64_t v22 = sub_10001EE74(v1, qword_1000648D0);
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  unint64_t v28 = v27;
  if ((v27 & 1) == 0)
  {
    swift_bridgeObjectRetain();
LABEL_16:
    sub_10001F6B0(v22, v24, v26, v28);
    goto LABEL_23;
  }
  sub_10004F410();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  id v30 = (void *)swift_dynamicCastClass();
  if (!v30)
  {
    swift_unknownObjectRelease();
    id v30 = &_swiftEmptyArrayStorage;
  }
  uint64_t v31 = v30[2];
  swift_release();
  if (__OFSUB__(v28 >> 1, v26))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v31 != (v28 >> 1) - v26)
  {
LABEL_42:
    swift_unknownObjectRelease();
    goto LABEL_16;
  }
  id v29 = (void *)swift_dynamicCastClass();
  if (!v29)
  {
    swift_unknownObjectRelease();
    id v29 = &_swiftEmptyArrayStorage;
  }
LABEL_23:
  uint64_t v67 = v29;
  swift_unknownObjectRelease();
  if (qword_1000611B0 != -1) {
    swift_once();
  }
  int64_t v32 = sub_10001EE74(v12, qword_1000648D8);
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  unint64_t v38 = v37;
  if ((v37 & 1) == 0)
  {
    swift_bridgeObjectRetain();
LABEL_27:
    sub_10001F5E8(v32, v34, v36, v38);
    goto LABEL_34;
  }
  sub_10004F410();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  id v40 = (void *)swift_dynamicCastClass();
  if (!v40)
  {
    swift_unknownObjectRelease();
    id v40 = &_swiftEmptyArrayStorage;
  }
  uint64_t v41 = v40[2];
  swift_release();
  if (__OFSUB__(v38 >> 1, v36))
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v41 != (v38 >> 1) - v36)
  {
LABEL_44:
    swift_unknownObjectRelease();
    goto LABEL_27;
  }
  Class v39 = (void *)swift_dynamicCastClass();
  if (!v39)
  {
    swift_unknownObjectRelease();
    Class v39 = &_swiftEmptyArrayStorage;
  }
LABEL_34:
  uint64_t v66 = v39;
  swift_unknownObjectRelease();
  id v64 = self;
  uint64_t v42 = (uint64_t (*)(char *, uint64_t))[v64 kilocalorieUnit];
  sub_10004E490();
  double v43 = v70;
  sub_10004E3F0();
  uint64_t v44 = v68;
  sub_10004E440();
  uint64_t v45 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t v46 = v69;
  uint64_t v47 = v45(v43, v69);
  __chkstk_darwin(v47);
  *(&v62 - 4) = v11;
  *(&v62 - 3) = (uint64_t (*)(char *, uint64_t))30;
  *(&v62 - 2) = v44;
  *(&v62 - 1) = v42;
  uint64_t v48 = swift_retain();
  uint64_t v65 = sub_10001FB28(v48, (uint64_t (*)(uint64_t, void, void))sub_1000205B0);
  swift_release();
  v45((char *)v44, v46);
  unint64_t v49 = *(void (**)(char *, uint64_t))(v72 + 8);
  uint64_t v62 = v45;
  uint64_t v63 = v49;
  v72 += 8;
  v49((char *)v11, v71);

  swift_release();
  double v50 = (uint64_t (*)(char *, uint64_t))[v64 minuteUnit];
  sub_10004E490();
  sub_10004E3F0();
  sub_10004E440();
  uint64_t v51 = v45(v43, v46);
  __chkstk_darwin(v51);
  *(&v62 - 4) = v11;
  *(&v62 - 3) = (uint64_t (*)(char *, uint64_t))30;
  *(&v62 - 2) = v44;
  *(&v62 - 1) = v50;
  uint64_t v52 = swift_retain();
  id v64 = sub_10001FB28(v52, (uint64_t (*)(uint64_t, void, void))sub_1000205B0);
  swift_release();
  uint64_t v53 = v62;
  v62((char *)v44, v46);
  uint64_t v54 = v63;
  v63((char *)v11, v71);

  swift_release();
  sub_10004E490();
  sub_10004E3F0();
  sub_10004E440();
  uint64_t v55 = v53(v43, v46);
  __chkstk_darwin(v55);
  *(&v62 - 2) = v11;
  *(&v62 - 1) = v44;
  uint64_t v56 = swift_retain();
  sub_10001FC34(v56, (uint64_t (*)(uint64_t, double))sub_1000205C4);
  swift_release();
  v53((char *)v44, v46);
  v54((char *)v11, v71);
  swift_release();
  id v57 = [objc_allocWithZone((Class)_HKActivityStatisticsQueryResult) init];
  sub_100017EEC(0, &qword_100061D90);
  Class isa = sub_10004F160().super.isa;
  swift_bridgeObjectRelease();
  [v57 setActiveEnergyResults:isa];

  Class v59 = sub_10004F160().super.isa;
  swift_bridgeObjectRelease();
  [v57 setAppleExerciseTimeResults:v59];

  sub_100017EEC(0, &qword_100061D98);
  Class v60 = sub_10004F160().super.isa;
  swift_bridgeObjectRelease();
  [v57 setAppleStandHourResults:v60];

  return v57;
}

uint64_t sub_1000205B4(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10001EEB8(a1, a2, a3 & 1, v3[2], v3[3], v3[4], v3[5]);
}

id sub_1000205C4(double a1)
{
  return sub_10001F308(a1);
}

uint64_t sub_1000205CC(uint64_t a1)
{
  uint64_t v2 = sub_100004F98((uint64_t *)&unk_100061980);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_10002062C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    __n128 v11 = (char *)a2 + v9;
    uint64_t v12 = sub_10004E400();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t sub_100020830(uint64_t a1, uint64_t a2)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_10004E400();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

void *sub_100020970(void *a1, void *a2, uint64_t a3)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10004E400();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

void *sub_100020B24(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10004E400();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_11;
  }
  if (v14)
  {
LABEL_11:
    uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

char *sub_100020D54(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_10004E400();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

char *sub_100020F10(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    uint64_t v6 = sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_10004E400();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_10;
  }
  if (v15)
  {
LABEL_10:
    uint64_t v16 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_100021148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002115C);
}

uint64_t sub_10002115C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10002125C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100021270);
}

uint64_t sub_100021270(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004F98(&qword_100061B98);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for PauseRingsLabel()
{
  uint64_t result = qword_100061E00;
  if (!qword_100061E00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000213C8()
{
  sub_1000214F0(319, &qword_100061C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_1000214F0(319, (unint64_t *)&qword_100061720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000214F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_100021554()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_100021570()
{
  uint64_t v0 = sub_10004EFB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v14 - v5;
  sub_10001DB8C((uint64_t)v14 - v5);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for WidgetFamily.systemSmall(_:), v0);
  sub_100022140();
  sub_10004F140();
  sub_10004F140();
  uint64_t v8 = v14[0];
  uint64_t v7 = v14[1];
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v3, v0);
  v9(v6, v0);
  id result = [self sharedBehavior];
  uint64_t v11 = result;
  if (v7 == v8)
  {
    if (result)
    {
      unsigned int v12 = [result isStandalonePhoneFitnessMode];

      if (v12) {
        return (id)0xD00000000000001CLL;
      }
      else {
        return (id)0xD00000000000001DLL;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  if (!result) {
    goto LABEL_12;
  }
  unsigned int v13 = [result isStandalonePhoneFitnessMode];

  if (v13) {
    return (id)0xD000000000000016;
  }
  else {
    return (id)0xD000000000000017;
  }
}

uint64_t sub_1000217B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v102 = a2;
  uint64_t v3 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v3 - 8);
  uint64_t v98 = &v91[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v101 = sub_10004E400();
  uint64_t v103 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  uint64_t v100 = &v91[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_10004EFB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v91[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  unsigned int v12 = &v91[-v11];
  sub_100021570();
  id v95 = self;
  id v13 = [v95 mainBundle];
  NSString v14 = sub_10004F0D0();
  NSString v15 = sub_10004F0D0();
  id v16 = [v13 localizedStringForKey:v14 value:0 table:v15];

  uint64_t v17 = sub_10004F0F0();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();

  uint64_t v107 = v17;
  uint64_t v108 = v19;
  unint64_t v96 = sub_10000C56C();
  uint64_t v20 = sub_10004EBE0();
  uint64_t v22 = v21;
  int v99 = v23;
  uint64_t v97 = a1;
  sub_10001DB8C((uint64_t)v12);
  (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v9, enum case for WidgetFamily.systemMedium(_:), v6);
  sub_100022140();
  sub_10004F140();
  sub_10004F140();
  uint64_t v25 = v106;
  uint64_t v24 = v107;
  uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v26(v9, v6);
  v26(v12, v6);
  if (v24 == v25) {
    sub_10004EA30();
  }
  else {
    sub_10004EA20();
  }
  char v27 = v99 & 1;
  uint64_t v28 = sub_10004EB90();
  uint64_t v30 = v29;
  char v32 = v31;
  swift_release();
  sub_10000C5C0(v20, v22, v27);
  swift_bridgeObjectRelease();
  sub_10004EA70();
  uint64_t v33 = sub_10004EB30();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_10000C5C0(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  uint64_t v107 = sub_10004ECD0();
  uint64_t v38 = sub_10004EB60();
  uint64_t v40 = v39;
  LODWORD(v42) = v41;
  uint64_t v44 = v43;
  sub_10000C5C0(v33, v35, v37);
  swift_release();
  swift_bridgeObjectRelease();
  int v99 = sub_10004E9F0();
  sub_10004E510();
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v53 = type metadata accessor for PauseRingsLabel();
  uint64_t v54 = v98;
  sub_100022198(v97 + *(int *)(v53 + 20), (uint64_t)v98);
  uint64_t v55 = v103;
  uint64_t v56 = v101;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v103 + 48))(v54, 1, v101) == 1)
  {
    sub_100005100((uint64_t)v54, (uint64_t *)&unk_100061980);
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
  }
  else
  {
    int v92 = v42;
    uint64_t v93 = v40;
    uint64_t v94 = v38;
    uint64_t v97 = v44;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 32))(v100, v54, v56);
    id v61 = [v95 mainBundle];
    NSString v62 = sub_10004F0D0();
    NSString v63 = sub_10004F0D0();
    id v64 = [v61 localizedStringForKey:v62 value:0 table:v63];

    sub_10004F0F0();
    sub_100004F98(&qword_100061368);
    uint64_t v65 = swift_allocObject();
    *(_OWORD *)(v65 + 16) = xmmword_10004FC90;
    id v66 = [objc_allocWithZone((Class)NSDateFormatter) init];
    NSString v67 = sub_10004F0D0();
    [v66 setDateFormat:v67];

    Class isa = sub_10004E3C0().super.isa;
    id v69 = [v66 stringFromDate:isa];

    uint64_t v70 = sub_10004F0F0();
    uint64_t v72 = v71;

    *(void *)(v65 + 56) = &type metadata for String;
    *(void *)(v65 + 64) = sub_10000B5DC();
    *(void *)(v65 + 32) = v70;
    *(void *)(v65 + 40) = v72;
    uint64_t v73 = sub_10004F100();
    uint64_t v75 = v74;
    swift_bridgeObjectRelease();
    uint64_t v107 = v73;
    uint64_t v108 = v75;
    uint64_t v76 = sub_10004EBE0();
    uint64_t v78 = v77;
    char v80 = v79 & 1;
    sub_10004EAC0();
    uint64_t v42 = sub_10004EB90();
    uint64_t v82 = v81;
    char v84 = v83;
    swift_release();
    sub_10000C5C0(v76, v78, v80);
    swift_bridgeObjectRelease();
    if (qword_100061198 != -1) {
      swift_once();
    }
    uint64_t v107 = qword_1000648C0;
    swift_retain();
    char v85 = v84 & 1;
    uint64_t v57 = sub_10004EB60();
    uint64_t v58 = v86;
    uint64_t v60 = v87;
    uint64_t v59 = v88 & 1;
    sub_10000C5C0(v42, v82, v85);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v103 + 8))(v100, v56);
    uint64_t v44 = v97;
    uint64_t v38 = v94;
    uint64_t v40 = v93;
    LOBYTE(v42) = v92;
  }
  LOBYTE(v107) = 1;
  LOBYTE(v106) = v42 & 1;
  char v105 = 0;
  char v104 = 1;
  uint64_t v89 = v102;
  *uint64_t v102 = 0;
  *((unsigned char *)v89 + 8) = 1;
  v89[2] = v38;
  v89[3] = v40;
  *((unsigned char *)v89 + 32) = v42 & 1;
  v89[5] = v44;
  *((unsigned char *)v89 + 48) = v99;
  v89[7] = v46;
  v89[8] = v48;
  v89[9] = v50;
  v89[10] = v52;
  *((unsigned char *)v89 + 88) = 0;
  v89[12] = v57;
  v89[13] = v58;
  v89[14] = v59;
  v89[15] = v60;
  v89[16] = 0;
  *((unsigned char *)v89 + 136) = 1;
  sub_100010F70(v38, v40, v42 & 1);
  swift_bridgeObjectRetain();
  sub_100022200(v57, v58, v59, v60);
  sub_100022244(v57, v58, v59, v60);
  sub_10000C5C0(v38, v40, v42 & 1);
  return swift_bridgeObjectRelease();
}

double sub_100022074@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10004E8D0();
  sub_1000217B0(v1, v9);
  *(_OWORD *)&v11[103] = v9[6];
  *(_OWORD *)&v11[87] = v9[5];
  *(_OWORD *)&v11[39] = v9[2];
  *(_OWORD *)&v11[23] = v9[1];
  *(_OWORD *)&v11[119] = v10[0];
  *(_OWORD *)&v11[128] = *(_OWORD *)((char *)v10 + 9);
  *(_OWORD *)&v11[55] = v9[3];
  *(_OWORD *)&v11[71] = v9[4];
  *(_OWORD *)&v11[7] = v9[0];
  long long v4 = *(_OWORD *)&v11[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v11[80];
  long long v5 = *(_OWORD *)&v11[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v11[96];
  *(_OWORD *)(a1 + 129) = v5;
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v11[128];
  long long v6 = *(_OWORD *)v11;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v11[16];
  double result = *(double *)&v11[32];
  long long v8 = *(_OWORD *)&v11[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v11[32];
  *(_OWORD *)(a1 + 65) = v8;
  *(_OWORD *)(a1 + 81) = v4;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 17) = v6;
  return result;
}

unint64_t sub_100022140()
{
  unint64_t result = qword_100061398;
  if (!qword_100061398)
  {
    sub_10004EFB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061398);
  }
  return result;
}

uint64_t sub_100022198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022200(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100010F70(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100022244(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000C5C0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10002228C()
{
  unint64_t result = qword_100061E38;
  if (!qword_100061E38)
  {
    sub_1000053B0(&qword_100061E40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061E38);
  }
  return result;
}

uint64_t sub_1000222E8@<X0>(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>, double a6@<D0>)
{
  *a5 = swift_getKeyPath();
  sub_100004F98(&qword_100061B88);
  swift_storeEnumTagMultiPayload();
  unsigned int v12 = (int *)type metadata accessor for SummarySection();
  id v13 = (uint64_t *)((char *)a5 + v12[5]);
  *id v13 = swift_getKeyPath();
  sub_100004F98(&qword_100061B90);
  swift_storeEnumTagMultiPayload();
  NSString v14 = (uint64_t *)((char *)a5 + v12[6]);
  uint64_t *v14 = swift_getKeyPath();
  sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)a5 + v12[7]) = (uint64_t)a1;
  *((unsigned char *)a5 + v12[8]) = a2;
  *(double *)((char *)a5 + v12[9]) = a6;
  *((unsigned char *)a5 + v12[10]) = a3;
  uint64_t v15 = sub_10004E400();
  *((unsigned char *)a5 + v12[11]) = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(a4, 1, v15) != 1;
  sub_10000509C(a4, (uint64_t)a5 + v12[12], (uint64_t *)&unk_100061980);
  uint64_t v16 = qword_1000611F0;
  id v17 = a1;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = (void *)qword_1000648F8;
  uint64_t v19 = self;
  id v20 = v18;
  id v21 = [v19 mainBundle];
  NSString v22 = sub_10004F0D0();
  NSString v23 = sub_10004F0D0();
  id v24 = [v21 localizedStringForKey:v22 value:0 table:v23];

  uint64_t v25 = sub_10004F0F0();
  uint64_t v27 = v26;

  uint64_t result = sub_100005100(a4, (uint64_t *)&unk_100061980);
  uint64_t v29 = (uint64_t *)((char *)a5 + v12[13]);
  void *v29 = v20;
  v29[1] = a1;
  v29[2] = v25;
  v29[3] = v27;
  return result;
}

uint64_t type metadata accessor for SummarySection()
{
  uint64_t result = qword_100061EA8;
  if (!qword_100061EA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000225D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004E5F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_10004EFB0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unsigned int v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v25 - v14;
  if (*(unsigned char *)(v1 + *(int *)(type metadata accessor for SummarySection() + 32)))
  {
    char v16 = 1;
  }
  else
  {
    uint64_t v26 = v5;
    uint64_t v27 = v3;
    uint64_t v28 = v2;
    sub_10001DB8C((uint64_t)v15);
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for WidgetFamily.systemSmall(_:), v9);
    sub_1000283E0((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    uint64_t v17 = v29;
    uint64_t v18 = v30;
    uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
    v19(v12, v9);
    v19(v15, v9);
    sub_10001DBC8((uint64_t)v8);
    if (v18 == v17)
    {
      char v16 = sub_10004E5E0();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v28);
    }
    else
    {
      id v21 = v26;
      uint64_t v20 = v27;
      uint64_t v22 = v28;
      (*(void (**)(char *, void, uint64_t))(v27 + 104))(v26, enum case for DynamicTypeSize.accessibility2(_:), v28);
      sub_1000283E0(&qword_100061D78, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      char v16 = sub_10004F0B0() ^ 1;
      NSString v23 = *(void (**)(char *, uint64_t))(v20 + 8);
      v23(v21, v22);
      v23(v8, v22);
    }
  }
  return v16 & 1;
}

uint64_t sub_100022928@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v2 = type metadata accessor for SummarySection();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_10004EF70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100004F98(&qword_100061F08);
  uint64_t v9 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = sub_1000225D4();
  uint64_t v13 = (unsigned int *)&enum case for AdaptiveStackType.horizontal(_:);
  if ((v12 & 1) == 0) {
    uint64_t v13 = (unsigned int *)&enum case for AdaptiveStackType.vertical(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *v13, v5);
  sub_10004E820();
  sub_10004E8D0();
  sub_1000225D4();
  sub_100028194(v1, (uint64_t)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SummarySection);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  sub_100028124((uint64_t)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, (uint64_t (*)(void))type metadata accessor for SummarySection);
  sub_100004F98(&qword_100061F10);
  sub_10000566C(&qword_100061F18, &qword_100061F10);
  sub_10004EF50();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v18, v11, v17);
}

uint64_t sub_100022C20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v138 = a2;
  uint64_t v132 = sub_100004F98(&qword_100061F20);
  __chkstk_darwin(v132);
  uint64_t v127 = (uint64_t *)((char *)&v114 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v122 = sub_10004E830();
  uint64_t v121 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  v120 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100004F98(&qword_100061F28);
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  uint64_t v123 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v124 = (char *)&v114 - v7;
  uint64_t v128 = sub_100004F98(&qword_100061F30);
  __chkstk_darwin(v128);
  uint64_t v130 = (uint64_t)&v114 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v9 - 8);
  uint64_t v115 = (uint64_t)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = type metadata accessor for PauseRingsLabel();
  __chkstk_darwin(v129);
  v114 = (uint64_t *)((char *)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  uint64_t v116 = (uint64_t)&v114 - v13;
  uint64_t v137 = sub_100004F98(&qword_100061F38);
  uint64_t v136 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v131 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v133 = (uint64_t)&v114 - v16;
  uint64_t v17 = sub_10004EFB0();
  uint64_t v141 = *(void *)(v17 - 8);
  uint64_t v142 = v17;
  __chkstk_darwin(v17);
  uint64_t v140 = (char *)&v114 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v139 = (uint64_t)&v114 - v20;
  uint64_t v21 = type metadata accessor for SummarySection();
  uint64_t v117 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v119 = (uint64_t)&v114 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = v22;
  __chkstk_darwin(v23);
  uint64_t v149 = (uint64_t)&v114 - v24;
  uint64_t v25 = sub_100004F98(&qword_100061F40);
  __chkstk_darwin(v25 - 8);
  uint64_t v135 = (char *)&v114 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v143 = (uint64_t)&v114 - v28;
  uint64_t v147 = sub_10004E970();
  uint64_t v29 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  char v31 = (char *)&v114 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100004F98(&qword_100061F48);
  __chkstk_darwin(v32 - 8);
  uint64_t v34 = (char *)&v114 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100004F98(&qword_100061F50);
  __chkstk_darwin(v35);
  char v37 = (char *)&v114 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_100004F98(&qword_100061F58);
  uint64_t v148 = *(void *)(v145 - 8);
  __chkstk_darwin(v145);
  uint64_t v39 = (char *)&v114 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_100004F98(&qword_100061F60);
  __chkstk_darwin(v146);
  uint64_t v134 = (char *)&v114 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v41);
  uint64_t v43 = (uint64_t)&v114 - v42;
  __chkstk_darwin(v44);
  uint64_t v144 = (char *)&v114 - v45;
  __chkstk_darwin(v46);
  uint64_t v150 = (uint64_t)&v114 - v47;
  *(void *)uint64_t v34 = sub_10004E820();
  *((void *)v34 + 1) = 0;
  v34[16] = 1;
  uint64_t v48 = sub_100004F98(&qword_100061F68);
  sub_100023EA8(a1, &v34[*(int *)(v48 + 44)]);
  sub_1000244F0(*(double *)(a1 + *(int *)(v21 + 36)));
  sub_10004EE50();
  sub_10004E590();
  sub_10000509C((uint64_t)v34, (uint64_t)v37, &qword_100061F48);
  uint64_t v49 = &v37[*(int *)(v35 + 36)];
  long long v50 = v155;
  *(_OWORD *)uint64_t v49 = v154;
  *((_OWORD *)v49 + 1) = v50;
  *((_OWORD *)v49 + 2) = v156;
  sub_100005100((uint64_t)v34, &qword_100061F48);
  sub_10004E950();
  unint64_t v51 = sub_100027D5C();
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v147);
  sub_100005100((uint64_t)v37, &qword_100061F50);
  uint64_t v147 = v21;
  uint64_t v152 = (uint64_t)sub_10004A568(*(id *)(a1 + *(int *)(v21 + 52) + 8));
  unint64_t v153 = v52;
  sub_10000C56C();
  uint64_t v53 = sub_10004EBE0();
  uint64_t v55 = v54;
  LOBYTE(v21) = v56 & 1;
  uint64_t v152 = v35;
  unint64_t v153 = v51;
  swift_getOpaqueTypeConformance2();
  uint64_t v57 = v145;
  sub_10004EC50();
  uint64_t v58 = v53;
  uint64_t v59 = a1;
  sub_10000C5C0(v58, v55, v21);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v148 + 8))(v39, v57);
  uint64_t v60 = (uint64_t)v144;
  sub_10004E610();
  sub_100005100(v43, &qword_100061F60);
  sub_10000B630(v60, v150, &qword_100061F60);
  char v61 = sub_1000225D4();
  uint64_t v62 = v149;
  LOBYTE(v43) = v61;
  sub_100028194(a1, v149, (uint64_t (*)(void))type metadata accessor for SummarySection);
  if ((v43 & 1) == 0)
  {
    sub_1000281FC(v62, (uint64_t (*)(void))type metadata accessor for SummarySection);
    uint64_t v71 = v141;
    uint64_t v70 = v142;
    uint64_t v72 = v140;
    uint64_t v63 = v139;
LABEL_5:
    uint64_t v80 = v147;
    uint64_t v81 = *(int *)(v147 + 44);
    if (*(unsigned char *)(v59 + v81) == 1)
    {
      sub_10001DB8C(v63);
      (*(void (**)(char *, void, uint64_t))(v71 + 104))(v72, enum case for WidgetFamily.systemMedium(_:), v70);
      sub_1000283E0(&qword_100061FB0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
      char v82 = sub_10004F0C0();
      char v83 = *(void (**)(char *, uint64_t))(v71 + 8);
      v83(v72, v70);
      v83((char *)v63, v70);
      if ((v82 & 1) == 0)
      {
        uint64_t v104 = v115;
        sub_10000509C(v59 + *(int *)(v80 + 48), v115, (uint64_t *)&unk_100061980);
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v106 = (uint64_t)v114;
        uint64_t *v114 = KeyPath;
        sub_100004F98(&qword_100061B88);
        swift_storeEnumTagMultiPayload();
        sub_10000B630(v104, v106 + *(int *)(v129 + 20), (uint64_t *)&unk_100061980);
        uint64_t v107 = v116;
        sub_100028124(v106, v116, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
        sub_100028194(v107, v130, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
        swift_storeEnumTagMultiPayload();
        sub_1000283E0(&qword_100061D58, (void (*)(uint64_t))type metadata accessor for PauseRingsLabel);
        sub_10000566C(&qword_100061F98, &qword_100061F20);
        uint64_t v108 = v131;
        sub_10004E920();
        sub_1000281FC(v107, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
        uint64_t v109 = sub_100004F98(&qword_100061FA0);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56))(v108, 0, 1, v109);
        uint64_t v103 = (uint64_t)v108;
LABEL_14:
        uint64_t v85 = v133;
        sub_10000B630(v103, v133, &qword_100061F38);
        goto LABEL_15;
      }
      if (*(unsigned char *)(v59 + v81))
      {
        uint64_t v84 = sub_100004F98(&qword_100061FA0);
        uint64_t v85 = v133;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56))(v133, 1, 1, v84);
LABEL_15:
        uint64_t v74 = v138;
        uint64_t v75 = v137;
        uint64_t v76 = v136;
        uint64_t v77 = (uint64_t)v135;
        uint64_t v79 = (uint64_t)v134;
        uint64_t v110 = v85;
        uint64_t v78 = v143;
        sub_10000B630(v110, v143, &qword_100061F38);
        uint64_t v73 = 0;
        goto LABEL_16;
      }
    }
    if (sub_1000225D4()) {
      uint64_t v86 = 0;
    }
    else {
      uint64_t v86 = 0x4010000000000000;
    }
    uint64_t v87 = v119;
    sub_100028194(v59, v119, (uint64_t (*)(void))type metadata accessor for SummarySection);
    unint64_t v88 = (*(unsigned __int8 *)(v117 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80);
    uint64_t v89 = swift_allocObject();
    sub_100028124(v87, v89 + v88, (uint64_t (*)(void))type metadata accessor for SummarySection);
    uint64_t v152 = (uint64_t)sub_1000280A4;
    unint64_t v153 = v89;
    uint64_t v90 = v121;
    uint64_t v91 = v120;
    uint64_t v92 = v122;
    (*(void (**)(char *, void, uint64_t))(v121 + 104))(v120, enum case for ColorRenderingMode.nonLinear(_:), v122);
    sub_100004F98(&qword_100061F80);
    sub_10000566C(&qword_100061F88, &qword_100061F80);
    uint64_t v93 = v123;
    sub_10004EC30();
    (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v92);
    swift_release();
    uint64_t v94 = v125;
    id v95 = v124;
    uint64_t v96 = v126;
    (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v124, v93, v126);
    uint64_t v97 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
    v97(v93, v95, v96);
    uint64_t v98 = (uint64_t)v127;
    *uint64_t v127 = v86;
    *(unsigned char *)(v98 + 8) = 0;
    uint64_t v99 = sub_100004F98(&qword_100061F90);
    v97((char *)(v98 + *(int *)(v99 + 48)), v93, v96);
    uint64_t v100 = *(void (**)(char *, uint64_t))(v94 + 8);
    v100(v93, v96);
    sub_10000509C(v98, v130, &qword_100061F20);
    swift_storeEnumTagMultiPayload();
    sub_1000283E0(&qword_100061D58, (void (*)(uint64_t))type metadata accessor for PauseRingsLabel);
    sub_10000566C(&qword_100061F98, &qword_100061F20);
    uint64_t v101 = v131;
    sub_10004E920();
    sub_100005100(v98, &qword_100061F20);
    v100(v95, v96);
    uint64_t v102 = sub_100004F98(&qword_100061FA0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v101, 0, 1, v102);
    uint64_t v103 = (uint64_t)v101;
    goto LABEL_14;
  }
  uint64_t v63 = v139;
  sub_10001DB8C(v139);
  uint64_t v65 = v140;
  uint64_t v64 = v141;
  uint64_t v66 = v142;
  (*(void (**)(char *, void, uint64_t))(v141 + 104))(v140, enum case for WidgetFamily.systemMedium(_:), v142);
  sub_1000283E0((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v67 = v152;
  uint64_t v68 = v151;
  id v69 = *(void (**)(char *, uint64_t))(v64 + 8);
  v69(v65, v66);
  v69((char *)v63, v66);
  sub_1000281FC(v62, (uint64_t (*)(void))type metadata accessor for SummarySection);
  uint64_t v70 = v66;
  uint64_t v71 = v64;
  uint64_t v72 = v65;
  if (v67 == v68) {
    goto LABEL_5;
  }
  uint64_t v73 = 1;
  uint64_t v74 = v138;
  uint64_t v75 = v137;
  uint64_t v76 = v136;
  uint64_t v77 = (uint64_t)v135;
  uint64_t v78 = v143;
  uint64_t v79 = (uint64_t)v134;
LABEL_16:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(v78, v73, 1, v75);
  uint64_t v111 = v150;
  sub_10000509C(v150, v79, &qword_100061F60);
  sub_10000509C(v78, v77, &qword_100061F40);
  sub_10000509C(v79, v74, &qword_100061F60);
  uint64_t v112 = sub_100004F98(&qword_100061FA8);
  sub_10000509C(v77, v74 + *(int *)(v112 + 48), &qword_100061F40);
  sub_100005100(v78, &qword_100061F40);
  sub_100005100(v111, &qword_100061F60);
  sub_100005100(v77, &qword_100061F40);
  return sub_100005100(v79, &qword_100061F60);
}

uint64_t sub_100023EA8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *(void *)&long long v52 = sub_100004F98(&qword_100062000);
  uint64_t v55 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v5 = &v49[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  unint64_t v51 = &v49[-v7];
  __chkstk_darwin(v8);
  char v56 = &v49[-v9];
  uint64_t v10 = sub_10004EFB0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v49[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v16 = &v49[-v15];
  uint64_t v17 = (int *)type metadata accessor for SummarySection();
  __chkstk_darwin(v17);
  uint64_t v19 = &v49[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v20 = sub_1000225D4();
  sub_100028194(a1, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for SummarySection);
  uint64_t v54 = a2;
  uint64_t v53 = v5;
  if (v20)
  {
    sub_10001DB8C((uint64_t)v16);
    (*(void (**)(unsigned char *, void, uint64_t))(v11 + 104))(v13, enum case for WidgetFamily.systemSmall(_:), v10);
    sub_1000283E0((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    uint64_t v21 = v59;
    uint64_t v22 = v75;
    uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v11 + 8);
    v23(v13, v10);
    v23(v16, v10);
    sub_1000281FC((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for SummarySection);
    BOOL v24 = v21 == v22;
    uint64_t v25 = v52;
    uint64_t v26 = v51;
    if (v24)
    {
      int v50 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    sub_1000281FC((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for SummarySection);
    uint64_t v25 = v52;
    uint64_t v26 = v51;
  }
  int v50 = 1;
LABEL_7:
  uint64_t v27 = *(void **)(a1 + v17[7]);
  int v28 = *(unsigned __int8 *)(a1 + v17[11]);
  id v29 = v27;
  sub_10002F908(v27, v28, 0, (uint64_t)&v70);
  long long v52 = v70;
  uint64_t v30 = v71;
  char v31 = v72;
  char v32 = v73;
  uint64_t v33 = v74;
  double v34 = *(double *)(a1 + v17[9]);
  sub_1000244F0(v34);
  sub_1000244F0(v34);
  sub_10004EE50();
  sub_10004E590();
  double v35 = 0.36;
  if (!v28) {
    double v35 = 1.0;
  }
  long long v59 = v52;
  uint64_t v60 = v30;
  char v61 = v31;
  char v62 = v32;
  uint64_t v63 = v33;
  uint64_t v64 = v75;
  char v65 = v76;
  uint64_t v66 = v77;
  char v67 = v78;
  long long v68 = v79;
  double v69 = v35;
  sub_100004F98(&qword_100062008);
  sub_100028308(&qword_100062010, &qword_100062008, (void (*)(void))sub_100028384);
  sub_10004EBF0();
  sub_1000283B4((uint64_t)&v70);
  uint64_t v36 = v55;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 32))(v56, v26, v25);
  uint64_t v37 = v25;
  if (sub_1000225D4())
  {
    uint64_t v57 = 0;
    __int16 v58 = 0;
  }
  else
  {
    uint64_t v57 = 0;
    __int16 v58 = 257;
  }
  sub_10004E920();
  *(void *)&long long v52 = v59;
  char v38 = BYTE8(v59);
  char v39 = BYTE9(v59);
  char v40 = v50;
  uint64_t v41 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v36 + 16);
  uint64_t v42 = v53;
  uint64_t v43 = v56;
  v41(v53, v56, v37);
  uint64_t v44 = v54;
  *uint64_t v54 = 0;
  *((unsigned char *)v44 + 8) = 0;
  *((unsigned char *)v44 + 9) = v40;
  uint64_t v45 = sub_100004F98(&qword_100062028);
  v41((unsigned char *)v44 + *(int *)(v45 + 48), v42, v37);
  uint64_t v46 = (char *)v44 + *(int *)(v45 + 64);
  *(void *)uint64_t v46 = v52;
  v46[8] = v38;
  v46[9] = v39;
  uint64_t v47 = *(void (**)(unsigned char *, uint64_t))(v36 + 8);
  v47(v43, v37);
  return ((uint64_t (*)(unsigned char *, uint64_t))v47)(v42, v37);
}

double sub_1000244F0(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10004E5F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004EFB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = type metadata accessor for SummarySection();
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v2 + *(int *)(v18 + 32)) & 1) == 0)
  {
    uint64_t v31 = v5;
    int v19 = *(unsigned __int8 *)(v2 + *(int *)(v15 + 44));
    sub_100028194(v2, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SummarySection);
    if (v19 == 1)
    {
      sub_10001DB8C((uint64_t)v14);
      (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for WidgetFamily.systemMedium(_:), v8);
      sub_1000283E0((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
      uint64_t v30 = v4;
      sub_10004F140();
      sub_10004F140();
      uint64_t v20 = v32;
      uint64_t v29 = v33;
      uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
      v21(v11, v8);
      v21(v14, v8);
      sub_1000281FC((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SummarySection);
      BOOL v24 = v29 == v20;
      uint64_t v4 = v30;
      if (v24) {
        return a1;
      }
    }
    else
    {
      sub_1000281FC((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SummarySection);
    }
    sub_10001DBC8((uint64_t)v7);
    uint64_t v22 = v31;
    int v23 = (*(uint64_t (**)(char *, uint64_t))(v31 + 88))(v7, v4);
    BOOL v24 = v23 == enum case for DynamicTypeSize.xSmall(_:) || v23 == enum case for DynamicTypeSize.small(_:);
    if (v24 || v23 == enum case for DynamicTypeSize.medium(_:)) {
      return 54.5;
    }
    if (v23 == enum case for DynamicTypeSize.large(_:)) {
      return 50.5;
    }
    if (v23 == enum case for DynamicTypeSize.xLarge(_:)) {
      return 46.5;
    }
    if (v23 != enum case for DynamicTypeSize.accessibility1(_:)
      && v23 != enum case for DynamicTypeSize.accessibility2(_:)
      && v23 != enum case for DynamicTypeSize.accessibility3(_:)
      && v23 != enum case for DynamicTypeSize.accessibility4(_:)
      && v23 != enum case for DynamicTypeSize.accessibility5(_:))
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v4);
      return 42.5;
    }
  }
  return a1;
}

uint64_t sub_100024934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100004F98(&qword_100061FB8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_10004E8D0();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v9 = sub_100004F98(&qword_100061FC0);
  sub_100024A5C(a2, a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_10004E5A0();
  sub_10004EE50();
  sub_10004E590();
  sub_10000509C((uint64_t)v8, a3, &qword_100061FB8);
  uint64_t v10 = (_OWORD *)(a3 + *(int *)(sub_100004F98(&qword_100061FC8) + 36));
  long long v11 = v13[1];
  _OWORD *v10 = v13[0];
  v10[1] = v11;
  _OWORD v10[2] = v13[2];
  return sub_100005100((uint64_t)v8, &qword_100061FB8);
}

id sub_100024A5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v198 = a2;
  uint64_t v179 = a3;
  uint64_t v200 = sub_10004E970();
  uint64_t v203 = *(void *)(v200 - 8);
  __chkstk_darwin(v200);
  v199 = (char *)&v166 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for SummarySection();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v166 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for FractionView();
  __chkstk_darwin(v8);
  v174 = (uint64_t *)((char *)&v166 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  v167 = (uint64_t *)((char *)&v166 - v11);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v166 - v13);
  uint64_t v196 = sub_100004F98(&qword_100061FD0);
  __chkstk_darwin(v196);
  uint64_t v172 = (uint64_t)&v166 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v170 = (char *)&v166 - v17;
  __chkstk_darwin(v18);
  uint64_t v191 = (uint64_t)&v166 - v19;
  uint64_t v197 = sub_100004F98(&qword_100061FD8);
  uint64_t v202 = *(void *)(v197 - 8);
  __chkstk_darwin(v197);
  v173 = (char *)&v166 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v171 = (char *)&v166 - v22;
  __chkstk_darwin(v23);
  v182 = (uint64_t (*)())((char *)&v166 - v24);
  uint64_t v195 = sub_100004F98(&qword_100061FE0);
  __chkstk_darwin(v195);
  uint64_t v178 = (uint64_t)&v166 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v177 = (char *)&v166 - v27;
  __chkstk_darwin(v28);
  v176 = (char *)&v166 - v29;
  __chkstk_darwin(v30);
  uint64_t v175 = (uint64_t)&v166 - v31;
  __chkstk_darwin(v32);
  v169 = (char *)&v166 - v33;
  __chkstk_darwin(v34);
  v168 = (char *)&v166 - v35;
  __chkstk_darwin(v36);
  uint64_t v192 = (uint64_t)&v166 - v37;
  __chkstk_darwin(v38);
  v181 = (uint64_t (*)())((char *)&v166 - v39);
  __chkstk_darwin(v40);
  v180 = (char *)&v166 - v41;
  __chkstk_darwin(v42);
  uint64_t v193 = (uint64_t)&v166 - v43;
  uint64_t v187 = sub_100025DD0(&qword_100061148);
  uint64_t v44 = a1 + v5[13];
  id v45 = *(id *)v44;
  uint64_t v46 = *(void **)(v44 + 8);
  uint64_t v48 = *(void *)(v44 + 16);
  uint64_t v47 = *(void *)(v44 + 24);
  v194 = (id *)v44;
  sub_10004A1B4(v45, v46, v48, v47);
  v186 = v49;
  unint64_t v185 = v50;
  sub_10004A1C8(v45, v46, v48, v47);
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  LODWORD(v47) = *(unsigned __int8 *)(a1 + v5[10]);
  uint64_t v201 = a1;
  sub_100028194(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SummarySection);
  if (v47 == 1)
  {
    sub_1000281FC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SummarySection);
LABEL_4:
    id v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    goto LABEL_6;
  }
  int v55 = v7[v5[11]];
  sub_1000281FC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SummarySection);
  if (v55 == 1) {
    goto LABEL_4;
  }
  id v56 = sub_10004B0E4(*v194, v194[1]);
  unint64_t v57 = v58;
LABEL_6:
  uint64_t v59 = v203;
  uint64_t v60 = v191;
  uint64_t v191 = v5[8];
  char v61 = *(unsigned char *)(v201 + v191);
  uint64_t *v14 = swift_getKeyPath();
  uint64_t v190 = sub_100004F98(&qword_100061D50);
  swift_storeEnumTagMultiPayload();
  char v62 = (uint64_t *)((char *)v14 + v8[5]);
  *char v62 = swift_getKeyPath();
  uint64_t v189 = sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  *(void *)&long long v212 = 0x4034000000000000;
  unint64_t v188 = sub_10000C27C();
  sub_10004E550();
  *(uint64_t *)((char *)v14 + v8[7]) = v187;
  uint64_t v63 = (void (**)(char *, uint64_t))((char *)v14 + v8[8]);
  unint64_t v64 = v185;
  *uint64_t v63 = v186;
  v63[1] = (void (*)(char *, uint64_t))v64;
  char v65 = (uint64_t *)((char *)v14 + v8[9]);
  void *v65 = v52;
  v65[1] = v54;
  uint64_t v66 = (uint64_t *)((char *)v14 + v8[10]);
  *uint64_t v66 = v56;
  v66[1] = v57;
  *((unsigned char *)v14 + v8[11]) = v61;
  *(uint64_t *)((char *)v14 + v8[12]) = 0;
  sub_10004E5A0();
  sub_10004EE50();
  sub_10004E590();
  sub_100028194((uint64_t)v14, v60, (uint64_t (*)(void))type metadata accessor for FractionView);
  uint64_t v67 = v196;
  long long v68 = (_OWORD *)(v60 + *(int *)(v196 + 36));
  long long v69 = v207;
  *long long v68 = v206;
  v68[1] = v69;
  v68[2] = v208;
  sub_1000281FC((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for FractionView);
  long long v70 = v199;
  sub_10004E950();
  unint64_t v71 = sub_10002825C();
  char v72 = v182;
  sub_10004EC90();
  char v73 = *(void (**)(char *, uint64_t))(v59 + 8);
  uint64_t v203 = v59 + 8;
  v186 = v73;
  v73(v70, v200);
  sub_100005100(v60, &qword_100061FD0);
  uint64_t v74 = v194;
  sub_10004AA6C(v194[1]);
  *(void *)&long long v212 = v75;
  *((void *)&v212 + 1) = v76;
  unint64_t v185 = sub_10000C56C();
  uint64_t v77 = sub_10004EBE0();
  uint64_t v79 = v78;
  LOBYTE(v59) = v80 & 1;
  *(void *)&long long v212 = v67;
  *((void *)&v212 + 1) = v71;
  uint64_t v187 = v71;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v82 = (uint64_t)v181;
  uint64_t v83 = v197;
  uint64_t v184 = OpaqueTypeConformance2;
  sub_10004EC50();
  sub_10000C5C0(v77, v79, v59);
  swift_bridgeObjectRelease();
  uint64_t v84 = v202 + 8;
  uint64_t v85 = *(void (**)(uint64_t (*)(), uint64_t))(v202 + 8);
  v85(v72, v83);
  uint64_t v86 = (uint64_t)v180;
  sub_10004E610();
  sub_100005100(v82, &qword_100061FE0);
  sub_10000B630(v86, v193, &qword_100061FE0);
  uint64_t v87 = sub_100025DD0(&qword_100061150);
  id v89 = *v74;
  id v88 = v74[1];
  uint64_t v91 = (uint64_t)v74[2];
  uint64_t v90 = (uint64_t)v74[3];
  uint64_t v92 = (uint64_t (*)())sub_10004A308(*v74, v88, v91, v90);
  uint64_t v202 = v84;
  v183 = (void (*)(char *, uint64_t))v85;
  v182 = v92;
  v181 = v93;
  if (!v88)
  {
LABEL_9:
    uint64_t v95 = v87;
    swift_bridgeObjectRetain();
LABEL_12:
    uint64_t v100 = v201;
    uint64_t v101 = sub_100025C1C();
    uint64_t v103 = v102;
    char v104 = *(unsigned char *)(v100 + v191);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v106 = (uint64_t)v167;
    uint64_t *v167 = KeyPath;
    swift_storeEnumTagMultiPayload();
    uint64_t v107 = (uint64_t *)(v106 + v8[5]);
    uint64_t *v107 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v212 = 0x4034000000000000;
    sub_10004E550();
    *(void *)(v106 + v8[7]) = v95;
    uint64_t v108 = (uint64_t (**)())(v106 + v8[8]);
    uint64_t v109 = v181;
    *uint64_t v108 = v182;
    v108[1] = v109;
    uint64_t v110 = (uint64_t *)(v106 + v8[9]);
    *uint64_t v110 = v91;
    v110[1] = v90;
    uint64_t v111 = (uint64_t *)(v106 + v8[10]);
    *uint64_t v111 = v101;
    v111[1] = v103;
    *(unsigned char *)(v106 + v8[11]) = v104;
    *(void *)(v106 + v8[12]) = 0x3FC3333333333333;
    sub_10004E5A0();
    sub_10004EE50();
    sub_10004E590();
    uint64_t v112 = v170;
    v182 = type metadata accessor for FractionView;
    sub_100028194(v106, (uint64_t)v170, (uint64_t (*)(void))type metadata accessor for FractionView);
    uint64_t v113 = &v112[*(int *)(v196 + 36)];
    long long v114 = v210;
    *(_OWORD *)uint64_t v113 = v209;
    *((_OWORD *)v113 + 1) = v114;
    *((_OWORD *)v113 + 2) = v211;
    sub_1000281FC(v106, (uint64_t (*)(void))type metadata accessor for FractionView);
    uint64_t v115 = v199;
    sub_10004E950();
    uint64_t v116 = v171;
    sub_10004EC90();
    v186(v115, v200);
    sub_100005100((uint64_t)v112, &qword_100061FD0);
    uint64_t v117 = v194;
    sub_10004B20C(v194[1]);
    *(void *)&long long v212 = v118;
    *((void *)&v212 + 1) = v119;
    uint64_t v120 = sub_10004EBE0();
    uint64_t v122 = v121;
    char v124 = v123 & 1;
    uint64_t v125 = (uint64_t)v169;
    uint64_t v126 = v197;
    sub_10004EC50();
    sub_10000C5C0(v120, v122, v124);
    swift_bridgeObjectRelease();
    v183(v116, v126);
    uint64_t v127 = (uint64_t)v168;
    sub_10004E610();
    sub_100005100(v125, &qword_100061FE0);
    sub_10000B630(v127, v192, &qword_100061FE0);
    uint64_t v128 = v201;
    v181 = (uint64_t (*)())sub_100025DD0(&qword_100061158);
    id v129 = *v117;
    id v130 = v117[1];
    uint64_t v131 = (uint64_t)v117[2];
    uint64_t v132 = (uint64_t)v117[3];
    v180 = (char *)sub_10004A31C(*v117, v130, v131, v132);
    v171 = v133;
    v170 = (char *)sub_10004A330(v129, v130, v131, v132);
    uint64_t v135 = v134;
    uint64_t v136 = sub_100025F90();
    uint64_t v138 = v137;
    LOBYTE(v130) = *(unsigned char *)(v128 + v191);
    uint64_t v139 = swift_getKeyPath();
    uint64_t v140 = (uint64_t)v174;
    uint64_t *v174 = v139;
    swift_storeEnumTagMultiPayload();
    uint64_t v141 = (uint64_t *)(v140 + v8[5]);
    *uint64_t v141 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v212 = 0x4034000000000000;
    sub_10004E550();
    *(void *)(v140 + v8[7]) = v181;
    uint64_t v142 = (void *)(v140 + v8[8]);
    uint64_t v143 = v171;
    *uint64_t v142 = v180;
    v142[1] = v143;
    uint64_t v144 = (void *)(v140 + v8[9]);
    *uint64_t v144 = v170;
    v144[1] = v135;
    uint64_t v145 = (uint64_t *)(v140 + v8[10]);
    *uint64_t v145 = v136;
    v145[1] = v138;
    *(unsigned char *)(v140 + v8[11]) = (_BYTE)v130;
    *(void *)(v140 + v8[12]) = 0x3FD3333333333333;
    sub_10004E5A0();
    sub_10004EE50();
    sub_10004E590();
    uint64_t v146 = v172;
    uint64_t v147 = v182;
    sub_100028194(v140, v172, (uint64_t (*)(void))v182);
    uint64_t v148 = (_OWORD *)(v146 + *(int *)(v196 + 36));
    long long v149 = v213;
    *uint64_t v148 = v212;
    v148[1] = v149;
    v148[2] = v214;
    sub_1000281FC(v140, (uint64_t (*)(void))v147);
    uint64_t v150 = v199;
    sub_10004E950();
    uint64_t v151 = v173;
    sub_10004EC90();
    v186(v150, v200);
    sub_100005100(v146, &qword_100061FD0);
    uint64_t v204 = sub_10004B4E8(v117[1]);
    uint64_t v205 = v152;
    uint64_t v153 = sub_10004EBE0();
    uint64_t v155 = v154;
    LOBYTE(v140) = v156 & 1;
    uint64_t v157 = (uint64_t)v177;
    uint64_t v158 = v197;
    sub_10004EC50();
    sub_10000C5C0(v153, v155, v140);
    swift_bridgeObjectRelease();
    v183(v151, v158);
    uint64_t v159 = (uint64_t)v176;
    sub_10004E610();
    sub_100005100(v157, &qword_100061FE0);
    uint64_t v160 = v175;
    sub_10000B630(v159, v175, &qword_100061FE0);
    uint64_t v161 = v193;
    sub_10000509C(v193, v159, &qword_100061FE0);
    uint64_t v162 = v192;
    sub_10000509C(v192, v157, &qword_100061FE0);
    uint64_t v163 = v178;
    sub_10000509C(v160, v178, &qword_100061FE0);
    uint64_t v164 = v179;
    sub_10000509C(v159, v179, &qword_100061FE0);
    uint64_t v165 = sub_100004F98(&qword_100061FF8);
    sub_10000509C(v157, v164 + *(int *)(v165 + 48), &qword_100061FE0);
    sub_10000509C(v163, v164 + *(int *)(v165 + 64), &qword_100061FE0);
    sub_100005100(v160, &qword_100061FE0);
    sub_100005100(v162, &qword_100061FE0);
    sub_100005100(v161, &qword_100061FE0);
    sub_100005100(v163, &qword_100061FE0);
    sub_100005100(v157, &qword_100061FE0);
    return (id)sub_100005100(v159, &qword_100061FE0);
  }
  id v94 = v88;
  if ([v94 paused])
  {

    goto LABEL_9;
  }
  id v96 = [v94 exerciseTimeGoal];
  id result = [v89 localizedStringWithBriskMinutes:v96];
  if (result)
  {
    uint64_t v98 = result;
    uint64_t v95 = v87;
    uint64_t v91 = sub_10004F0F0();
    uint64_t v90 = v99;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025C1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SummarySection();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = *(unsigned __int8 *)(v1 + *(int *)(v5 + 40));
  sub_100028194(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SummarySection);
  if (v6 == 1)
  {
    sub_1000281FC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SummarySection);
  }
  else
  {
    char v7 = v4[*(int *)(v2 + 44)];
    sub_1000281FC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SummarySection);
    if ((v7 & 1) == 0)
    {
      id v9 = [self mainBundle];
      NSString v10 = sub_10004F0D0();
      NSString v11 = sub_10004F0D0();
      id v12 = [v9 localizedStringForKey:v10 value:0 table:v11];

      uint64_t v8 = sub_10004F0F0();
      return v8;
    }
  }
  return 0;
}

uint64_t sub_100025DD0(void *a1)
{
  uint64_t v3 = sub_10004EFA0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  int v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v9 = (char *)&v13 - v8;
  if (*(unsigned char *)(v1 + *(int *)(type metadata accessor for SummarySection() + 44)) == 1)
  {
    if (qword_100061198 == -1) {
      return swift_retain();
    }
LABEL_8:
    swift_once();
    return swift_retain();
  }
  sub_10001DE90((uint64_t)v9);
  sub_10004EF90();
  char v11 = sub_10004EF80();
  id v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v12(v9, v3);
  if (v11)
  {
    if (*a1 == -1) {
      return swift_retain();
    }
    goto LABEL_8;
  }
  return sub_10004ECD0();
}

uint64_t sub_100025F90()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SummarySection();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = *(unsigned __int8 *)(v1 + *(int *)(v5 + 40));
  sub_100028194(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SummarySection);
  if (v6 == 1)
  {
    sub_1000281FC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SummarySection);
  }
  else
  {
    char v7 = v4[*(int *)(v2 + 44)];
    sub_1000281FC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SummarySection);
    if ((v7 & 1) == 0)
    {
      id v9 = [self mainBundle];
      NSString v10 = sub_10004F0D0();
      NSString v11 = sub_10004F0D0();
      id v12 = [v9 localizedStringForKey:v10 value:0 table:v11];

      uint64_t v8 = sub_10004F0F0();
      return v8;
    }
  }
  return 0;
}

uint64_t sub_100026150()
{
  return sub_10004E790();
}

uint64_t sub_100026174()
{
  return sub_10004E790();
}

uint64_t sub_100026198(uint64_t a1)
{
  uint64_t v2 = sub_10004EFA0();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_10004E7A0();
}

void *sub_100026264(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    NSString v10 = (void *)((char *)a1 + v9);
    NSString v11 = (void *)((char *)a2 + v9);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = *(void **)((char *)a2 + v17);
    *(void *)((char *)a1 + v17) = v19;
    *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
    uint64_t v20 = a3[10];
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
    uint64_t v21 = a3[12];
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = sub_10004E400();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    id v27 = v19;
    if (v26(v23, 1, v24))
    {
      uint64_t v28 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(v22, v23, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    uint64_t v29 = a3[13];
    uint64_t v30 = (void *)((char *)a1 + v29);
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = *(void **)v31;
    uint64_t v33 = (void *)*((void *)v31 + 1);
    *uint64_t v30 = *(void *)v31;
    v30[1] = v33;
    uint64_t v34 = *((void *)v31 + 3);
    v30[2] = *((void *)v31 + 2);
    v30[3] = v34;
    id v35 = v32;
    id v36 = v33;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000265F4(uint64_t a1, int *a2)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  uint64_t v9 = a1 + a2[12];
  uint64_t v10 = sub_10004E400();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = (id *)(a1 + a2[13]);

  return swift_bridgeObjectRelease();
}

void *sub_100026818(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004E5F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_10004EFA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    void *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
  uint64_t v18 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  uint64_t v19 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_10004E400();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  id v25 = v17;
  if (v24(v21, 1, v22))
  {
    uint64_t v26 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v20, v21, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  uint64_t v27 = a3[13];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = *(void **)v29;
  uint64_t v31 = (void *)*((void *)v29 + 1);
  void *v28 = *(void *)v29;
  v28[1] = v31;
  uint64_t v32 = *((void *)v29 + 3);
  void v28[2] = *((void *)v29 + 2);
  v28[3] = v32;
  id v33 = v30;
  id v34 = v31;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100026B58(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005100((uint64_t)a1 + v7, &qword_100061B90);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)((char *)a1 + v11);
    uint64_t v13 = (void *)((char *)a2 + v11);
    sub_100005100((uint64_t)a1 + v11, &qword_100061D88);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      void *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = *(void **)((char *)a1 + v15);
  uint64_t v17 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  id v18 = v17;

  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v19 = a3[12];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_10004E400();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      goto LABEL_18;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_17;
  }
  if (v26)
  {
LABEL_17:
    uint64_t v27 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
LABEL_18:
  uint64_t v28 = a3[13];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void **)v30;
  uint64_t v32 = *(void **)v29;
  *(void *)uint64_t v29 = *(void *)v30;
  id v33 = v31;

  id v34 = (void *)*((void *)v29 + 1);
  id v35 = (void *)*((void *)v30 + 1);
  *((void *)v29 + 1) = v35;
  id v36 = v35;

  *((void *)v29 + 2) = *((void *)v30 + 2);
  *((void *)v29 + 3) = *((void *)v30 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_100026F68(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004E5F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_10004EFA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  a1[v18] = a2[v18];
  uint64_t v19 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  a1[v19] = a2[v19];
  uint64_t v20 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = sub_10004E400();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  uint64_t v26 = a3[13];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  long long v29 = *((_OWORD *)v28 + 1);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *((_OWORD *)v27 + 1) = v29;
  return a1;
}

char *sub_10002729C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    uint64_t v6 = sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005100((uint64_t)&a1[v8], &qword_100061B90);
    uint64_t v11 = sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004E5F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v13 = a3[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    sub_100005100((uint64_t)&a1[v13], &qword_100061D88);
    uint64_t v16 = sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_10004EFA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = *(void **)&a1[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];

  uint64_t v20 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  uint64_t v21 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v21] = a2[v21];
  uint64_t v22 = a3[12];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = sub_10004E400();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
      goto LABEL_17;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_16;
  }
  if (v29)
  {
LABEL_16:
    uint64_t v30 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_17:
  uint64_t v31 = a3[13];
  uint64_t v32 = &a1[v31];
  id v33 = &a2[v31];
  id v34 = *(void **)&a1[v31];
  *(void *)&a1[v31] = *(void *)v33;

  id v35 = (void *)*((void *)v32 + 1);
  *((void *)v32 + 1) = *((void *)v33 + 1);

  uint64_t v36 = *((void *)v33 + 3);
  *((void *)v32 + 2) = *((void *)v33 + 2);
  *((void *)v32 + 3) = v36;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000276A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000276B4);
}

uint64_t sub_1000276B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_10:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061BA0);
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
  uint64_t v14 = sub_100004F98(&qword_100061E48);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_9;
  }
  uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[12];
    goto LABEL_9;
  }
  unint64_t v17 = *(void *)(a1 + a3[13]);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

uint64_t sub_100027870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100027884);
}

uint64_t sub_100027884(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004F98(&qword_100061B98);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100004F98(&qword_100061BA0);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t v16 = sub_100004F98(&qword_100061E48);
      if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
      {
        uint64_t v10 = v16;
        uint64_t v14 = *(void *)(v16 - 8);
        uint64_t v15 = a4[6];
      }
      else
      {
        uint64_t result = sub_100004F98((uint64_t *)&unk_100061980);
        if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
        {
          *(void *)(a1 + a4[13]) = (a2 - 1);
          return result;
        }
        uint64_t v10 = result;
        uint64_t v14 = *(void *)(result - 8);
        uint64_t v15 = a4[12];
      }
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100027A3C()
{
  sub_100027C68(319, &qword_100061C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_100027C68(319, (unint64_t *)&unk_100061C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F)
    {
      sub_100027C68(319, (unint64_t *)&qword_100061EB8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F)
      {
        sub_100027C68(319, (unint64_t *)&qword_100061720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_100027C68(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_100027CCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100027CEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for SummarySection() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100022C20(v4, a1);
}

unint64_t sub_100027D5C()
{
  unint64_t result = qword_100061F70;
  if (!qword_100061F70)
  {
    sub_1000053B0(&qword_100061F50);
    sub_10000566C(&qword_100061F78, &qword_100061F48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061F70);
  }
  return result;
}

uint64_t sub_100027E00()
{
  uint64_t v1 = (int *)type metadata accessor for SummarySection();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v5 + v1[6];
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }

  uint64_t v11 = v5 + v1[12];
  uint64_t v12 = sub_10004E400();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  uint64_t v14 = (id *)(v5 + v1[13]);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000280A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SummarySection() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100024934(a1, v6, a2);
}

uint64_t sub_100028124(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100028194(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000281FC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10002825C()
{
  unint64_t result = qword_100061FE8;
  if (!qword_100061FE8)
  {
    sub_1000053B0(&qword_100061FD0);
    sub_1000283E0(&qword_100061FF0, (void (*)(uint64_t))type metadata accessor for FractionView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061FE8);
  }
  return result;
}

uint64_t sub_100028308(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000053B0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100028384()
{
  return sub_100028308(&qword_100062018, &qword_100062020, (void (*)(void))sub_100019028);
}

uint64_t sub_1000283B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000283E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100028428()
{
  return sub_10000566C(&qword_100062030, &qword_100061F08);
}

uint64_t destroy for QuantityChart(uint64_t a1)
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for QuantityChart(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_retain();
  swift_retain();
  id v7 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for QuantityChart(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

__n128 initializeWithTake for QuantityChart(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for QuantityChart(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  long long v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for QuantityChart(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuantityChart(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuantityChart()
{
  return &type metadata for QuantityChart;
}

uint64_t sub_10002871C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100028738()
{
  return sub_10004E6D0();
}

uint64_t sub_10002875C(uint64_t a1)
{
  uint64_t v2 = sub_10004E600();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_10004E6E0();
}

uint64_t sub_100028824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10004E970();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004E830();
  uint64_t v70 = *(void *)(v8 - 8);
  uint64_t v71 = v8;
  __chkstk_darwin(v8);
  long long v68 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100004F98(&qword_1000614F0);
  __chkstk_darwin(v57);
  uint64_t v60 = (uint64_t *)((char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v59 = sub_10004E600();
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  char v61 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_100004F98(&qword_100062038);
  __chkstk_darwin(v63);
  uint64_t v13 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v66 = sub_100004F98(&qword_100062040);
  uint64_t v64 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  char v62 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004F98(&qword_100062048);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  char v65 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100028F28(v1[5], v1[6]);
  uint64_t v19 = v18;
  uint64_t v74 = v4;
  uint64_t v75 = a1;
  char v72 = v7;
  uint64_t v73 = v5;
  uint64_t v69 = v15;
  uint64_t v67 = v16;
  if (v18)
  {
    uint64_t v20 = *(void *)(v18 + 16);
    if (v20)
    {
      uint64_t v21 = v1[2];
      swift_bridgeObjectRetain();
      uint64_t v22 = 0;
      double v23 = 0.0;
      while (1)
      {
        double v24 = v23;
        uint64_t v25 = *(void **)(v19 + 8 * v22 + 32);
        if (v25)
        {
          id v26 = v25;
          id v27 = [v26 quantityValue];
          if (v27)
          {
            int v28 = v27;
            [v27 doubleValueForUnit:v21];
            double v23 = v29;

            if (v24 < v23) {
              goto LABEL_6;
            }
          }
          else
          {
          }
        }
        double v23 = v24;
LABEL_6:
        if (v20 == ++v22)
        {
          swift_bridgeObjectRelease();
          goto LABEL_13;
        }
      }
    }
  }
  double v23 = 0.0;
LABEL_13:
  uint64_t v30 = v60;
  uint64_t v31 = v59;
  uint64_t v32 = v58;
  uint64_t v33 = v57;
  uint64_t v34 = swift_allocObject();
  long long v35 = v2[1];
  *(_OWORD *)(v34 + 16) = *v2;
  *(_OWORD *)(v34 + 32) = v35;
  long long v36 = v2[3];
  *(_OWORD *)(v34 + 48) = v2[2];
  *(_OWORD *)(v34 + 64) = v36;
  *(void *)(v34 + 80) = v19;
  *(double *)(v34 + 88) = v23;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = v61;
  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v61, enum case for LayoutDirection.leftToRight(_:), v31);
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))((char *)v30 + *(int *)(v33 + 28), v38, v31);
  *uint64_t v30 = KeyPath;
  uint64_t v39 = v63;
  sub_10000509C((uint64_t)v30, (uint64_t)v13 + *(int *)(v63 + 36), &qword_1000614F0);
  *uint64_t v13 = sub_10002A8EC;
  v13[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v34;
  swift_bridgeObjectRetain();
  sub_10002A924((uint64_t)v2);
  swift_retain();
  sub_100005100((uint64_t)v30, &qword_1000614F0);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v38, v31);
  swift_release();
  uint64_t v40 = v70;
  uint64_t v41 = v71;
  uint64_t v42 = v68;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v68, enum case for ColorRenderingMode.nonLinear(_:), v71);
  unint64_t v43 = sub_10002A984();
  uint64_t v44 = v62;
  sub_10004EC30();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v41);
  sub_100005100((uint64_t)v13, &qword_100062038);
  id v45 = v72;
  sub_10004E950();
  uint64_t v76 = v39;
  unint64_t v77 = v43;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v48 = v65;
  uint64_t v47 = v66;
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v45, v74);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v44, v47);
  sub_100029F4C(v19);
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  LOBYTE(v34) = v53;
  swift_bridgeObjectRelease();
  uint64_t v76 = v47;
  unint64_t v77 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v54 = v69;
  sub_10004EC50();
  sub_10000C5C0(v50, v52, v34 & 1);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v48, v54);
}

void sub_100028F28(unint64_t a1, uint64_t a2)
{
  uint64_t v67 = sub_10004E4A0();
  uint64_t v5 = *(char **)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v8 - 8);
  uint64_t v63 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004E400();
  uint64_t v60 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v62 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v47 - v13;
  __chkstk_darwin(v15);
  char v61 = (char *)&v47 - v16;
  __chkstk_darwin(v17);
  char v65 = (char *)&v47 - v18;
  uint64_t v19 = sub_10004E4B0();
  uint64_t v20 = *(id **)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v64 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return;
  }
  uint64_t v52 = a2;
  uint64_t v22 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v68 = v10;
  if (a1 >> 62) {
    goto LABEL_47;
  }
  unint64_t v23 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v23) {
    return;
  }
  while (2)
  {
    unint64_t v24 = sub_10002B870(v23);
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v25 = (id)sub_10004F3B0();
    }
    else
    {
      if ((v24 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        return;
      }
      if (v24 >= *(void *)(v22 + 16)) {
        goto LABEL_54;
      }
      id v25 = *(id *)(a1 + 8 * v24 + 32);
    }
    id v26 = v25;
    sub_10004E490();
    id v27 = [v26 startDate];
    sub_10004E3E0();

    if (v52 < 0) {
      goto LABEL_55;
    }
    uint64_t v47 = v2;
    id v48 = v26;
    uint64_t v49 = v20;
    uint64_t v50 = v19;
    if (v52)
    {
      uint64_t v22 = v52;
      uint64_t v58 = v7;
      uint64_t v28 = 0;
      uint64_t v7 = 0;
      unsigned int v57 = enum case for Calendar.Component.minute(_:);
      double v29 = (void (*)(char *, void, uint64_t))*((void *)v5 + 13);
      a1 = v60 + 8;
      uint64_t v59 = v5 + 104;
      int v55 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v56 = v29;
      char v53 = (void (**)(char *, uint64_t, uint64_t))(v60 + 32);
      uint64_t v54 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48);
      uint64_t v51 = (void (**)(char *, char *, uint64_t))(v60 + 16);
      uint64_t v66 = &_swiftEmptyArrayStorage;
      uint64_t v2 = v67;
      uint64_t v5 = v58;
      uint64_t v19 = (uint64_t)v63;
      v29(v58, enum case for Calendar.Component.minute(_:), v67);
      while (1)
      {
        if (v7 == (char *)0x16C16C16C16C17) {
          goto LABEL_46;
        }
        sub_10004E440();
        sub_10004E480();
        uint64_t v2 = v67;
        uint64_t v20 = *(id **)a1;
        (*(void (**)(char *, uint64_t))a1)(v14, v10);
        (*v55)(v5, v2);
        if ((*v54)(v19, 1, v10) == 1)
        {
          sub_100005100(v19, (uint64_t *)&unk_100061980);
        }
        else
        {
          uint64_t v30 = *v53;
          uint64_t v31 = v61;
          (*v53)(v61, v19, v10);
          (*v51)(v62, v31, v10);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v66 = (void *)sub_10000AA44(0, v66[2] + 1, 1, v66);
          }
          unint64_t v33 = v66[2];
          unint64_t v32 = v66[3];
          if (v33 >= v32 >> 1) {
            uint64_t v66 = (void *)sub_10000AA44(v32 > 1, v33 + 1, 1, v66);
          }
          uint64_t v34 = v66;
          v66[2] = v33 + 1;
          unint64_t v35 = (unint64_t)v34
              + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))
              + *(void *)(v60 + 72) * v33;
          uint64_t v10 = v68;
          v30((char *)v35, (uint64_t)v62, v68);
          ((void (*)(char *, uint64_t))v20)(v61, v10);
          uint64_t v22 = v52;
          uint64_t v2 = v67;
        }
        ++v7;
        v28 += 1440;
        if ((char *)v22 == v7) {
          break;
        }
        v56(v5, v57, v2);
      }
    }
    else
    {
      uint64_t v66 = &_swiftEmptyArrayStorage;
    }
    uint64_t v69 = &_swiftEmptyArrayStorage;
    long long v36 = v66;
    uint64_t v37 = (char *)v66[2];
    if (!v37)
    {
LABEL_44:
      swift_bridgeObjectRelease();

      (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v10);
      ((void (*)(char *, uint64_t))v49[1])(v64, v50);
      return;
    }
    sub_10000B630(v47 + 40, (uint64_t)v70, &qword_1000620B0);
    uint64_t v7 = 0;
    char v62 = v37;
    uint64_t v63 = (char *)(v60 + 16);
    uint64_t v67 = v60 + 8;
    while (1)
    {
      sub_10000B630((uint64_t)v70, (uint64_t)&v71, &qword_1000620B0);
      uint64_t v20 = v71;
      if (v71)
      {
        if ((unint64_t)v7 < v36[2]) {
          break;
        }
      }
LABEL_41:
      sub_10004F150();
      if (v69[2] >= v69[3] >> 1) {
        sub_10004F190();
      }
      ++v7;
      sub_10004F1A0();
      sub_10004F180();
      if (v7 == v37) {
        goto LABEL_44;
      }
    }
    uint64_t v38 = v60;
    (*(void (**)(char *, unint64_t, uint64_t))(v60 + 16))(v14, (unint64_t)v36+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * (void)v7, v10);
    swift_bridgeObjectRetain();
    sub_10002C080((uint64_t)v70);
    sub_10004E390();
    double v40 = v39;
    uint64_t v5 = *(char **)(v38 + 8);
    ((void (*)(char *, uint64_t))v5)(v14, v10);
    if (!((unint64_t)v20 >> 62))
    {
      a1 = *(void *)(((unint64_t)v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (a1) {
        goto LABEL_28;
      }
      goto LABEL_39;
    }
    swift_bridgeObjectRetain();
    a1 = sub_10004F3E0();
    sub_10002C0AC((uint64_t)v70);
    if (!a1)
    {
LABEL_39:
      sub_10002C0AC((uint64_t)v70);
      long long v36 = v66;
      swift_bridgeObjectRelease();
LABEL_40:
      uint64_t v37 = v62;
      goto LABEL_41;
    }
LABEL_28:
    uint64_t v22 = 4;
    while (1)
    {
      uint64_t v2 = v22 - 4;
      id v41 = ((unint64_t)v20 & 0xC000000000000001) != 0 ? (id)sub_10004F3B0() : v20[v22];
      uint64_t v42 = v41;
      uint64_t v19 = v22 - 3;
      if (__OFADD__(v2, 1)) {
        break;
      }
      id v43 = [v41 startDate];
      sub_10004E3E0();

      sub_10004E390();
      double v45 = v44;
      ((void (*)(char *, uint64_t))v5)(v14, v68);
      if (vabdd_f64(v45, v40) >= 2.22044605e-16)
      {

        ++v22;
        if (v19 != a1) {
          continue;
        }
      }
      sub_10002C0AC((uint64_t)v70);
      long long v36 = v66;
      swift_bridgeObjectRelease();
      uint64_t v10 = v68;
      goto LABEL_40;
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_10004F3E0();
    swift_bridgeObjectRelease();
    if (v46)
    {
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_10004F3E0();
      swift_bridgeObjectRelease();
      if ((v23 & 0x8000000000000000) != 0) {
        goto LABEL_56;
      }
      uint64_t v10 = v68;
      if (!v23)
      {
        __break(1u);
        return;
      }
      continue;
    }
    break;
  }
}

uint64_t sub_100029808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  *(void *)a4 = sub_10004E800();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t v10 = sub_100004F98(&qword_100062070);
  return sub_10002987C(a2, a1, a3, a4 + *(int *)(v10 + 44), a5);
}

uint64_t sub_10002987C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v47 = a3;
  uint64_t v9 = sub_10004E5B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004F98(&qword_100062078);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v45 = v13;
  uint64_t v46 = v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v35 - v18;
  sub_10004E5A0();
  sub_10004EE50();
  uint64_t result = sub_10004E590();
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v43 = v52;
    uint64_t v44 = v53;
    int v42 = v51;
    uint64_t v41 = v50;
    int v40 = v49;
    uint64_t v38 = v21;
    uint64_t v39 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v9);
    unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    unint64_t v23 = (v11 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    long long v36 = v19;
    uint64_t v37 = v16;
    uint64_t v24 = v46;
    id v25 = (char *)swift_allocObject();
    long long v26 = *(_OWORD *)(a1 + 16);
    *((_OWORD *)v25 + 1) = *(_OWORD *)a1;
    *((_OWORD *)v25 + 2) = v26;
    long long v27 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v25 + 3) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v25 + 4) = v27;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v25[v22], v12, v9);
    *(void *)&v25[v23] = v47;
    *(double *)&v25[(v23 + 15) & 0xFFFFFFFFFFFFFFF8] = a5;
    sub_10002A924(a1);
    swift_bridgeObjectRetain();
    sub_100004F98(&qword_100062080);
    sub_10000566C(&qword_100062088, &qword_100062080);
    uint64_t v28 = v36;
    sub_10004EDF0();
    double v29 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
    uint64_t v30 = v37;
    uint64_t v31 = v45;
    v29(v37, v28, v45);
    *(unsigned char *)a4 = 2;
    *(void *)(a4 + 8) = v39;
    *(unsigned char *)(a4 + 16) = v40;
    *(void *)(a4 + 24) = v41;
    *(unsigned char *)(a4 + 32) = v42;
    uint64_t v32 = v44;
    *(void *)(a4 + 40) = v43;
    *(void *)(a4 + 48) = v32;
    uint64_t v33 = sub_100004F98(&qword_100062090);
    v29((char *)(a4 + *(int *)(v33 + 48)), v30, v31);
    uint64_t v34 = *(void (**)(char *, uint64_t))(v24 + 8);
    v34(v28, v31);
    return ((uint64_t (*)(char *, uint64_t))v34)(v30, v31);
  }
  return result;
}

uint64_t sub_100029C24@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>, double a5@<D0>)
{
  sub_10004E5A0();
  double v11 = v10;
  uint64_t result = sub_10004E5A0();
  double v14 = v13;
  if (a3)
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > a1)
    {
      uint64_t v15 = *(void **)(a3 + 8 * a1 + 32);
      uint64_t v16 = (void *)a2[2];
      double v17 = 0.0;
      if (v15)
      {
        id v18 = v15;
        id v19 = [v18 quantityValue];
        if (v19)
        {
          uint64_t v20 = v19;
          if (a5 == 0.0)
          {
          }
          else
          {
            [v19 doubleValueForUnit:v16];
            double v22 = v21;

            double v17 = v22 / a5;
          }
        }
        else
        {
        }
      }
      goto LABEL_11;
    }
    __break(1u);
    return result;
  }
  uint64_t v16 = (void *)a2[2];
  double v17 = 0.0;
LABEL_11:
  if (v14 > 19.0) {
    double v14 = 19.0;
  }
  double v23 = (v11 - (double)a2[6] + 1.0) / (double)a2[6];
  uint64_t v24 = *a2;
  uint64_t v25 = a2[1];
  swift_retain();
  swift_retain();
  id v26 = v16;
  sub_10004E5A0();
  sub_100029DC0(a1, &v28);
  uint64_t v27 = v28;
  *(double *)a4 = v23;
  *(double *)(a4 + 8) = v14;
  *(double *)(a4 + 16) = v17;
  *(void *)(a4 + 24) = v24;
  *(void *)(a4 + 32) = v25;
  *(void *)(a4 + 40) = v26;
  *(void *)(a4 + 48) = v27;
  swift_retain();
  swift_retain();
  swift_release();
  return swift_release();
}

uint64_t sub_100029DC0@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if (__OFADD__(result, 1))
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v4 = *(void *)(v2 + 48);
  if ((unint64_t)(v4 + 1) < 3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v4 >= 0) {
    uint64_t v5 = *(void *)(v2 + 48);
  }
  else {
    uint64_t v5 = v4 + 1;
  }
  uint64_t v6 = v4 / (v5 >> 1);
  if (!v6) {
    goto LABEL_21;
  }
  if (result == 0x7FFFFFFFFFFFFFFFLL && v6 == -1) {
    goto LABEL_22;
  }
  if ((result + 1) % v6)
  {
    sub_10002BFB0();
LABEL_18:
    uint64_t result = sub_10004EDC0();
    *a2 = result;
    return result;
  }
  uint64_t v7 = *(void *)(v2 + 56);
  if (!v7) {
    goto LABEL_23;
  }
  if (v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_25;
  }
  uint64_t v8 = v4 / v7;
  if (!v8)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (result != 0x7FFFFFFFFFFFFFFFLL || v8 != -1)
  {
    sub_10004EE50();
    sub_10004E590();
    sub_100004F98(&qword_1000620A0);
    sub_10002C004();
    goto LABEL_18;
  }
LABEL_26:
  __break(1u);
  return result;
}

void sub_100029F4C(uint64_t a1)
{
  uint64_t v3 = sub_10004E870();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = sub_10002AA48(v1[5]);
  int v40 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v7 = v1[7];
  if (!v7)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v8 = v1[6];
  if (v8 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_44;
  }
  if (v8 < 0) {
    goto LABEL_41;
  }
  uint64_t v34 = v5;
  int64_t v35 = v7;
  unint64_t v36 = v6;
  if (v8)
  {
    uint64_t v10 = v8 / v7;
    if (v8 / v7)
    {
      if (!__OFSUB__(v10, 1))
      {
        uint64_t v11 = 0;
        uint64_t v33 = v8 - 1;
        uint64_t v37 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if (v11 <= v8) {
            uint64_t v12 = v8;
          }
          else {
            uint64_t v12 = v11;
          }
          double v13 = 0.0;
          uint64_t v14 = v11;
          while (1)
          {
            if (v12 == v14)
            {
              __break(1u);
LABEL_39:
              __break(1u);
              goto LABEL_40;
            }
            if (a1)
            {
              if ((unint64_t)v14 >= *(void *)(a1 + 16)) {
                goto LABEL_39;
              }
              uint64_t v15 = *(void **)(a1 + 32 + 8 * v14);
              if (v15)
              {
                id v16 = v15;
                id v17 = [v16 quantityValue];
                if (v17)
                {
                  id v18 = v17;
                  [v17 doubleValueForUnit:v1[2]];
                  double v20 = v19;
                }
                else
                {
                  double v20 = 0.0;
                }

                double v13 = v13 + v20;
              }
            }
            if (v14 % v10 == v10 - 1) {
              break;
            }
            if (v8 == ++v14) {
              goto LABEL_33;
            }
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v37 = sub_10000AE3C(0, *((void *)v37 + 2) + 1, 1, v37);
          }
          unint64_t v22 = *((void *)v37 + 2);
          unint64_t v21 = *((void *)v37 + 3);
          if (v22 >= v21 >> 1) {
            uint64_t v37 = sub_10000AE3C((char *)(v21 > 1), v22 + 1, 1, v37);
          }
          uint64_t v11 = v14 + 1;
          double v23 = v37;
          *((void *)v37 + 2) = v22 + 1;
          *(double *)&v23[8 * v22 + 32] = v13;
          int v40 = v23;
        }
        while (v33 != v14);
        goto LABEL_33;
      }
      goto LABEL_43;
    }
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return;
  }
  uint64_t v37 = (char *)&_swiftEmptyArrayStorage;
LABEL_33:
  int64_t v24 = v35;
  uint64_t v25 = v36;
  uint64_t v26 = *(void *)(v36 + 16);
  uint64_t v27 = v37;
  if (v26 == v35 && v26 == *((void *)v37 + 2))
  {
    sub_10002A924((uint64_t)v1);
    uint64_t v28 = sub_10002BC28(0, v24, (uint64_t)v1, v25, (uint64_t)&v40);
    swift_bridgeObjectRelease();
    sub_10002BD80((uint64_t)v1);
    uint64_t v38 = v28;
    sub_100004F98(&qword_100061510);
    sub_10000566C(&qword_100061518, &qword_100061510);
    uint64_t v29 = sub_10004F0A0();
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    uint64_t v38 = v29;
    uint64_t v39 = v31;
    sub_10000C56C();
    sub_10004EBE0();
  }
  else
  {
    sub_10004E860();
    v41._object = (void *)0x80000001000591F0;
    v41._countAndFlagsBits = 0xD000000000000015;
    sub_10004E850(v41);
    swift_bridgeObjectRelease();
    uint64_t v38 = v26;
    sub_10004E840();
    v42._countAndFlagsBits = 0x20736D7573202CLL;
    v42._object = (void *)0xE700000000000000;
    sub_10004E850(v42);
    uint64_t v38 = *((void *)v27 + 2);
    sub_10004E840();
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    sub_10004E850(v43);
    sub_10004E890();
    sub_10004EBD0();
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_10002A384@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  double v4 = *(double *)(a1 + 8);
  double v5 = fmax(*(double *)a1, 1.0);
  double v6 = *(double *)(a1 + 16);
  if (v4 * v6 >= 2.0) {
    double v7 = v4 * v6;
  }
  else {
    double v7 = 2.0;
  }
  sub_100004F98(&qword_100061630);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10004FC80;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 24);
  uint64_t v21 = v9;
  *(void *)(v8 + 32) = v22;
  *(void *)(v8 + 40) = v9;
  uint64_t v16 = v8;
  sub_10004F180();
  sub_10002C4B4((uint64_t)&v22);
  sub_10002C4B4((uint64_t)&v21);
  sub_10004EE00();
  sub_10004EED0();
  sub_10004EEC0();
  sub_10004E5C0();
  sub_10004EE50();
  uint64_t result = sub_10004E590();
  double v11 = 0.3;
  if (v6 != 0.0) {
    double v11 = 1.0;
  }
  *(double *)a2 = v5;
  *(double *)(a2 + 8) = v7;
  *(double *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v12;
  *(_OWORD *)(a2 + 32) = v13;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  *(_WORD *)(a2 + 64) = 256;
  *(void *)(a2 + 72) = v16;
  *(unsigned char *)(a2 + 80) = v17;
  *(void *)(a2 + 88) = v18;
  *(unsigned char *)(a2 + 96) = v19;
  *(_OWORD *)(a2 + 104) = v20;
  *(double *)(a2 + 120) = v11;
  return result;
}

id sub_10002A534@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 32);
  id v7 = *(id *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v3 = v8;
  uint64_t v9 = v4;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v1;
  *(void *)(v5 + 32) = *(void *)(v1 + 16);
  *(void *)(v5 + 40) = v3;
  *(void *)(v5 + 48) = v4;
  *(void *)(v5 + 56) = v7;
  *a1 = sub_10002C4AC;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v5;
  sub_10002C4B4((uint64_t)&v8);
  sub_10002C4B4((uint64_t)&v9);

  return v7;
}

double sub_10002A5D8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004E8A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004EB20();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for RoundedCornerStyle.continuous(_:), v2);
  uint64_t v11 = 0x3FF0000000000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0x3FF0000000000000;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  sub_10004EB00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v6 = v10;
  double result = *(double *)v9;
  long long v8 = v9[1];
  *(_OWORD *)a1 = v9[0];
  *(_OWORD *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_10002A73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10002C664();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10002A7A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10002C664();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10002A804(uint64_t a1)
{
  unint64_t v2 = sub_10002C664();

  return Shape.body.getter(a1, v2);
}

uint64_t sub_10002A850@<X0>(uint64_t a1@<X8>)
{
  return sub_100028824(a1);
}

uint64_t sub_10002A88C()
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10002A8EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100029808(a1, v2 + 16, *(void *)(v2 + 80), a2, *(double *)(v2 + 88));
}

uint64_t sub_10002A8FC()
{
  return sub_10004E6D0();
}

uint64_t sub_10002A924(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_10002A984()
{
  unint64_t result = qword_100062050;
  if (!qword_100062050)
  {
    sub_1000053B0(&qword_100062038);
    sub_10000566C(&qword_100062058, &qword_100062060);
    sub_10000566C(&qword_100061508, &qword_1000614F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062050);
  }
  return result;
}

unint64_t sub_10002AA48(unint64_t a1)
{
  uint64_t v80 = sub_100004F98(&qword_1000613B8);
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v84 = (uint64_t)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_10004E4A0();
  uint64_t v98 = *(unsigned int (***)(uint64_t, uint64_t, uint64_t))(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v91 = (char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v103 = (uint64_t)&v73 - v8;
  __chkstk_darwin(v9);
  uint64_t v90 = (char *)&v73 - v10;
  __chkstk_darwin(v11);
  uint64_t v99 = (uint64_t)&v73 - v12;
  __chkstk_darwin(v13);
  uint64_t v101 = (uint64_t)&v73 - v14;
  uint64_t v102 = sub_10004E400();
  uint64_t v15 = *(void *)(v102 - 8);
  uint64_t v16 = v15;
  __chkstk_darwin(v102);
  uint64_t v83 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  long long v20 = (char *)&v73 - v19;
  __chkstk_darwin(v21);
  uint64_t v93 = (char *)&v73 - v22;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v73 - v24;
  uint64_t v75 = sub_10004E4B0();
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  id v94 = (char *)&v73 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004E490();
  uint64_t v95 = v25;
  sub_10004E3F0();
  uint64_t v27 = (uint64_t)v6;
  uint64_t v81 = v6;
  if (!a1) {
    goto LABEL_15;
  }
  if (!(a1 >> 62))
  {
    unint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v28) {
      goto LABEL_4;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  if (!sub_10004F3E0()) {
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  unint64_t v28 = sub_10004F3E0();
  unint64_t result = swift_bridgeObjectRelease();
  if ((v28 & 0x8000000000000000) != 0)
  {
LABEL_38:
    __break(1u);
    return result;
  }
  if (!v28)
  {
    __break(1u);
    goto LABEL_13;
  }
LABEL_4:
  unint64_t result = sub_10002B870(v28);
  if ((a1 & 0xC000000000000001) != 0) {
    goto LABEL_35;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (result >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  for (id i = *(id *)(a1 + 8 * result + 32); ; id i = (id)sub_10004F3B0())
  {
    uint64_t v31 = i;
    swift_bridgeObjectRelease();
    id v32 = [v31 startDate];
    uint64_t v33 = v93;
    sub_10004E3E0();

    uint64_t v34 = v95;
    uint64_t v35 = v102;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v95, v102);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v34, v33, v35);
LABEL_14:
    uint64_t v27 = (uint64_t)v81;
LABEL_15:
    uint64_t v36 = *(void *)(v100 + 56);
    if (!v36)
    {
      __break(1u);
      goto LABEL_34;
    }
    uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    v16 += 56;
    uint64_t v38 = 24 / v36;
    uint64_t v39 = v102;
    v37(v101, 1, 1, v102);
    uint64_t v78 = v16;
    unint64_t v77 = v37;
    v37(v99, 1, 1, v39);
    if (v38) {
      break;
    }
LABEL_34:
    __break(1u);
LABEL_35:
    ;
  }
  uint64_t v40 = v38;
  uint64_t v85 = v20;
  uint64_t v96 = v38 - 1;
  unsigned int v89 = enum case for Calendar.Component.hour(_:);
  uint64_t v100 = v15 + 8;
  uint64_t v87 = (void (**)(char *, uint64_t))(v98 + 1);
  id v88 = (void (**)(char *, void, uint64_t))(v98 + 13);
  Swift::String v41 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  Swift::String v42 = (void (**)(char *, uint64_t, uint64_t))(v15 + 32);
  uint64_t v86 = &_swiftEmptyArrayStorage;
  uint64_t v76 = (void (**)(void))(v15 + 16);
  uint64_t v43 = 1;
  uint64_t v97 = v38;
  uint64_t v98 = v41;
  uint64_t v82 = v42;
  do
  {
    uint64_t v44 = (v43 - 1) % v40;
    if (!v44)
    {
      uint64_t v46 = v91;
      uint64_t v45 = v92;
      (*v88)(v91, v89, v92);
      uint64_t v47 = v93;
      sub_10004E440();
      uint64_t v48 = v90;
      sub_10004E480();
      (*(void (**)(char *, uint64_t))v100)(v47, v102);
      uint64_t v27 = (uint64_t)v81;
      (*v87)(v46, v45);
      uint64_t v49 = v101;
      sub_100005100(v101, (uint64_t *)&unk_100061980);
      uint64_t v50 = (uint64_t)v48;
      Swift::String v41 = v98;
      sub_10000B630(v50, v49, (uint64_t *)&unk_100061980);
    }
    uint64_t v51 = v102;
    if (v44 == v96)
    {
      uint64_t v53 = v91;
      uint64_t v52 = v92;
      (*v88)(v91, v89, v92);
      uint64_t v54 = v93;
      sub_10004E440();
      int v55 = v90;
      sub_10004E480();
      (*(void (**)(char *, uint64_t))v100)(v54, v51);
      (*v87)(v53, v52);
      uint64_t v56 = v99;
      sub_100005100(v99, (uint64_t *)&unk_100061980);
      uint64_t v57 = (uint64_t)v55;
      Swift::String v41 = v98;
      sub_10000B630(v57, v56, (uint64_t *)&unk_100061980);
    }
    uint64_t v58 = v103;
    sub_10000509C(v101, v103, (uint64_t *)&unk_100061980);
    uint64_t v59 = *v41;
    if ((*v41)(v58, 1, v51) == 1)
    {
      sub_100005100(v103, (uint64_t *)&unk_100061980);
    }
    else
    {
      uint64_t v60 = *v82;
      char v61 = v85;
      (*v82)(v85, v103, v51);
      sub_10000509C(v99, v27, (uint64_t *)&unk_100061980);
      if (v59(v27, 1, v51) == 1)
      {
        (*(void (**)(char *, uint64_t))v100)(v61, v51);
        sub_100005100(v27, (uint64_t *)&unk_100061980);
      }
      else
      {
        char v62 = v83;
        v60(v83, v27, v51);
        uint64_t v63 = v84 + *(int *)(v80 + 48);
        uint64_t v64 = *v76;
        (*v76)();
        ((void (*)(uint64_t, char *, uint64_t))v64)(v63, v62, v51);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v86 = (void *)sub_10000AC54(0, v86[2] + 1, 1, v86);
        }
        unint64_t v66 = v86[2];
        unint64_t v65 = v86[3];
        uint64_t v67 = v102;
        if (v66 >= v65 >> 1) {
          uint64_t v86 = (void *)sub_10000AC54(v65 > 1, v66 + 1, 1, v86);
        }
        uint64_t v68 = v86;
        v86[2] = v66 + 1;
        sub_10000B630(v84, (uint64_t)v68+ ((*(unsigned __int8 *)(v79 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80))+ *(void *)(v79 + 72) * v66, &qword_1000613B8);
        uint64_t v69 = *(void (**)(char *, uint64_t))v100;
        (*(void (**)(char *, uint64_t))v100)(v83, v67);
        v69(v85, v67);
        uint64_t v70 = v99;
        sub_100005100(v99, (uint64_t *)&unk_100061980);
        uint64_t v71 = v101;
        sub_100005100(v101, (uint64_t *)&unk_100061980);
        char v72 = v77;
        v77(v71, 1, 1, v67);
        v72(v70, 1, 1, v67);
        Swift::String v41 = v98;
      }
    }
    ++v43;
    uint64_t v40 = v97;
  }
  while (v43 != 25);
  sub_100005100(v99, (uint64_t *)&unk_100061980);
  sub_100005100(v101, (uint64_t *)&unk_100061980);
  (*(void (**)(char *, uint64_t))v100)(v95, v102);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v94, v75);
  return (unint64_t)v86;
}

uint64_t sub_10002B49C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v43 = a5;
  uint64_t v47 = a4;
  uint64_t v46 = sub_100004F98(&qword_1000613B8);
  uint64_t v8 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *a1;
  id v12 = [self mainBundle];
  NSString v13 = sub_10004F0D0();
  NSString v14 = sub_10004F0D0();
  id v15 = [v12 localizedStringForKey:v13 value:0 table:v14];

  uint64_t v16 = sub_10004F0F0();
  uint64_t v18 = v17;

  sub_100004F98(&qword_100061368);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_100050710;
  long long v49 = *(_OWORD *)(a2 + 24);
  *(void *)(v19 + 56) = &type metadata for String;
  uint64_t result = sub_10000B5DC();
  uint64_t v48 = result;
  *(void *)(v19 + 64) = result;
  *(_OWORD *)(v19 + 32) = *(_OWORD *)(a2 + 24);
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v11 >= *(void *)(a3 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v42[1] = v16;
  v42[2] = v18;
  uint64_t v21 = a3
      + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + *(void *)(v8 + 72) * v11;
  unint64_t v45 = v11;
  sub_10000509C(v21, (uint64_t)v10, &qword_1000613B8);
  uint64_t v22 = v46;
  uint64_t v23 = &v10[*(int *)(v46 + 48)];
  sub_10000A814((uint64_t)&v49);
  uint64_t v44 = sub_10002BA20();
  uint64_t v25 = v24;
  uint64_t v26 = sub_10004E400();
  uint64_t v27 = *(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8);
  v27(v23, v26);
  v27(v10, v26);
  uint64_t v28 = v48;
  *(void *)(v19 + 96) = &type metadata for String;
  *(void *)(v19 + 104) = v28;
  *(void *)(v19 + 72) = v44;
  *(void *)(v19 + 80) = v25;
  sub_10000509C(v21, (uint64_t)v10, &qword_1000613B8);
  uint64_t v29 = &v10[*(int *)(v22 + 48)];
  uint64_t v30 = sub_10002BA20();
  uint64_t v32 = v31;
  v27(v29, v26);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v27)(v10, v26);
  unint64_t v33 = v45;
  *(void *)(v19 + 136) = &type metadata for String;
  *(void *)(v19 + 144) = v28;
  *(void *)(v19 + 112) = v30;
  *(void *)(v19 + 120) = v32;
  if (v33 >= *(void *)(*(void *)v47 + 16))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  double v34 = *(double *)(*(void *)v47 + 8 * v33 + 32);
  if ((~*(void *)&v34 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v34 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v34 < 9.22337204e18)
  {
    uint64_t v50 = (uint64_t)v34;
    uint64_t v35 = sub_10004F3F0();
    uint64_t v36 = v48;
    *(void *)(v19 + 176) = &type metadata for String;
    *(void *)(v19 + 184) = v36;
    *(void *)(v19 + 152) = v35;
    *(void *)(v19 + 160) = v37;
    uint64_t v38 = sub_10004F0E0();
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    Swift::String v41 = v43;
    *uint64_t v43 = v38;
    v41[1] = v40;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t sub_10002B870(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_10002B8FC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002B91C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10002B91C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004F98(&qword_100062068);
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
  NSString v13 = v10 + 32;
  NSString v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
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

uint64_t sub_10002BA20()
{
  uint64_t v0 = sub_10004E430();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_10004E420();
  uint64_t v5 = sub_10004E410();
  uint64_t v7 = v6;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v7)
  {
    uint64_t v15 = v5;
    uint64_t v16 = v7;
    uint64_t v13 = 26746;
    unint64_t v14 = 0xE200000000000000;
    sub_10000C56C();
    if (sub_10004F2D0())
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = v5;
      uint64_t v16 = v7;
      uint64_t v13 = 24938;
      unint64_t v14 = 0xE200000000000000;
      sub_10004F2D0();
      swift_bridgeObjectRelease();
    }
  }
  NSString v8 = sub_10004F0D0();
  [v4 setLocalizedDateFormatFromTemplate:v8];

  Class isa = sub_10004E3C0().super.isa;
  id v10 = [v4 stringFromDate:isa];

  uint64_t v11 = sub_10004F0F0();
  return v11;
}

uint64_t sub_10002BC28(uint64_t result, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v7 = v5;
  NSString v8 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v6) {
    return (uint64_t)v8;
  }
  int64_t v10 = result;
  uint64_t v24 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t result = (uint64_t)sub_10002B8FC(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    NSString v8 = v24;
    if (a2 <= v10) {
      int64_t v11 = v10;
    }
    else {
      int64_t v11 = a2;
    }
    int64_t v18 = v11;
    unint64_t v12 = v10;
    while (a2 != v12)
    {
      unint64_t v22 = v12;
      uint64_t result = sub_10002B49C(&v22, a3, a4, a5, v23);
      if (v7)
      {
        swift_release();
        return (uint64_t)v8;
      }
      uint64_t v7 = 0;
      uint64_t v13 = v23[0];
      uint64_t v14 = v23[1];
      uint64_t v24 = v8;
      unint64_t v16 = v8[2];
      unint64_t v15 = v8[3];
      if (v16 >= v15 >> 1)
      {
        uint64_t result = (uint64_t)sub_10002B8FC((char *)(v15 > 1), v16 + 1, 1);
        NSString v8 = v24;
      }
      v8[2] = v16 + 1;
      uint64_t v17 = &v8[2 * v16];
      v17[4] = v13;
      v17[5] = v14;
      if (a2 < v10) {
        goto LABEL_19;
      }
      if (v18 == v12) {
        goto LABEL_20;
      }
      if (a2 == ++v12) {
        return (uint64_t)v8;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_10002BD80(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002BDE4()
{
  uint64_t v1 = sub_10004E5B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10002BEF4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_10004E5B0() - 8);
  unint64_t v6 = (*(void *)(v5 + 64)
      + ((*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v2 + v6);
  double v8 = *(double *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_100029C24(a1, (uint64_t *)(v2 + 16), v7, a2, v8);
}

unint64_t sub_10002BFB0()
{
  unint64_t result = qword_100062098;
  if (!qword_100062098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062098);
  }
  return result;
}

unint64_t sub_10002C004()
{
  unint64_t result = qword_1000620A8;
  if (!qword_1000620A8)
  {
    sub_1000053B0(&qword_1000620A0);
    sub_10002BFB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620A8);
  }
  return result;
}

uint64_t sub_10002C080(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002C0AC(uint64_t a1)
{
  return a1;
}

void destroy for QuantityChart.BarView(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for QuantityChart.BarView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for QuantityChart.BarView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[5];
  id v5 = (void *)a1[5];
  a1[5] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for QuantityChart.BarView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for QuantityChart.BarView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuantityChart.BarView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuantityChart.BarView()
{
  return &type metadata for QuantityChart.BarView;
}

unint64_t sub_10002C304()
{
  unint64_t result = qword_1000620B8;
  if (!qword_1000620B8)
  {
    sub_1000053B0(&qword_1000620C0);
    sub_1000053B0(&qword_100062040);
    sub_1000053B0(&qword_100062038);
    sub_10002A984();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_10002C3F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620B8);
  }
  return result;
}

unint64_t sub_10002C3F0()
{
  unint64_t result = qword_100061628;
  if (!qword_100061628)
  {
    sub_10004E9A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061628);
  }
  return result;
}

uint64_t sub_10002C448()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002C464()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002C4AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002A384(v1 + 16, a1);
}

uint64_t sub_10002C4B4(uint64_t a1)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for QuantityChart.Bar(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for QuantityChart.Bar(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for QuantityChart.Bar()
{
  return &type metadata for QuantityChart.Bar;
}

uint64_t sub_10002C53C()
{
  return sub_10000566C(&qword_1000620C8, &qword_1000620D0);
}

uint64_t sub_10002C578()
{
  return sub_10000566C(&qword_1000620D8, &qword_1000620E0);
}

unint64_t sub_10002C5B8()
{
  unint64_t result = qword_1000620E8;
  if (!qword_1000620E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620E8);
  }
  return result;
}

unint64_t sub_10002C610()
{
  unint64_t result = qword_1000620F0;
  if (!qword_1000620F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620F0);
  }
  return result;
}

unint64_t sub_10002C664()
{
  unint64_t result = qword_1000620F8;
  if (!qword_1000620F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WidgetFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WidgetFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10002C7ACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetFeatureFlags()
{
  return &type metadata for WidgetFeatureFlags;
}

unint64_t sub_10002C7E8()
{
  unint64_t result = qword_100062100;
  if (!qword_100062100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062100);
  }
  return result;
}

uint64_t sub_10002C83C()
{
  return 1;
}

Swift::Int sub_10002C844()
{
  return sub_10004F490();
}

void sub_10002C888()
{
}

Swift::Int sub_10002C8B0()
{
  return sub_10004F490();
}

const char *sub_10002C8F0()
{
  return "Fitness";
}

const char *sub_10002C904()
{
  return "ForceAccessibilityLayout";
}

void sub_10002C918(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = swift_getKeyPath();
  sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  int64_t v10 = (int *)type metadata accessor for StandalonePhoneRingView(0);
  int64_t v11 = v10;
  uint64_t v12 = v10[9];
  *((unsigned char *)a5 + v10[6]) = a3;
  *(uint64_t *)((char *)a5 + v12) = a4;
  if (a1)
  {
    *((unsigned char *)a5 + v10[7]) = 0;
    uint64_t v13 = v10 + 8;
    if (a2)
    {

      *(uint64_t *)((char *)a5 + v11[5]) = 0x3FF0000000000000;
      char v14 = 4;
    }
    else
    {
      swift_retain();
      if ([a1 activityMoveMode] == (id)2) {
        [a1 _moveMinutesCompletionPercentage];
      }
      else {
        [a1 _activeEnergyCompletionPercentage];
      }
      uint64_t v18 = v17;

      swift_release();
      *(uint64_t *)((char *)a5 + v11[5]) = v18;
      char v14 = 3;
    }
  }
  else
  {
    if (a2) {
      char v15 = 4;
    }
    else {
      char v15 = 3;
    }
    double v16 = 0.0;
    *((unsigned char *)a5 + v10[8]) = v15;
    if (a2) {
      double v16 = 1.0;
    }
    *(double *)((char *)a5 + v10[5]) = v16;
    uint64_t v13 = v10 + 7;
    char v14 = 1;
  }
  *((unsigned char *)a5 + *v13) = v14;
}

uint64_t sub_10002CA68@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004F98(&qword_100062200);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004E5A0();
  double v8 = v7;
  sub_10004E5A0();
  if (v9 < v8) {
    double v8 = v9;
  }
  double v10 = (v8 + -29.0) / 114.0;
  double v11 = v10 * -0.0288461538 + 0.0432692308;
  if (v10 >= 1.0) {
    double v11 = 0.0144230769;
  }
  if (v10 > 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0432692308;
  }
  sub_10002CBE8(a1, (uint64_t)v6, v8 * 0.105769231, v8, v8 * 0.105769231 + v8 * v12);
  sub_10004EE50();
  sub_10004E590();
  sub_10000509C((uint64_t)v6, a2, &qword_100062200);
  uint64_t v13 = (_OWORD *)(a2 + *(int *)(sub_100004F98(&qword_100062208) + 36));
  long long v14 = v16[1];
  *uint64_t v13 = v16[0];
  v13[1] = v14;
  v13[2] = v16[2];
  return sub_100005100((uint64_t)v6, &qword_100062200);
}

uint64_t sub_10002CBE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v81 = a2;
  uint64_t v9 = sub_100004F98(&qword_100062210);
  __chkstk_darwin(v9);
  uint64_t v83 = (uint64_t)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v82 = (uint64_t)&v74 - v12;
  __chkstk_darwin(v13);
  uint64_t v77 = (uint64_t)&v74 - v14;
  __chkstk_darwin(v15);
  uint64_t v80 = (uint64_t)&v74 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v74 - v18;
  __chkstk_darwin(v20);
  uint64_t v79 = (char *)&v74 - v21;
  unint64_t v22 = (int *)type metadata accessor for ActivityRing(0);
  __chkstk_darwin(v22);
  uint64_t v78 = (uint64_t)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v26 = (uint64_t *)((char *)&v74 - v25);
  __chkstk_darwin(v27);
  uint64_t v29 = (uint64_t *)((char *)&v74 - v28);
  __chkstk_darwin(v30);
  uint64_t v32 = (uint64_t *)((char *)&v74 - v31);
  __chkstk_darwin(v33);
  uint64_t v85 = (uint64_t)&v74 - v34;
  double v35 = 1.0;
  int v84 = *(unsigned __int8 *)(a1 + 25);
  uint64_t v76 = v9;
  if (v84)
  {
    char v36 = 4;
    double v37 = 1.0;
  }
  else
  {
    char v36 = 0;
    double v37 = *(double *)a1;
  }
  char v38 = *(unsigned char *)(a1 + 24);
  sub_10000B630(a1 + 32, (uint64_t)v86, &qword_1000621F8);
  *uint64_t v32 = swift_getKeyPath();
  sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v32 + v22[5]) = v36;
  *(double *)((char *)v32 + v22[6]) = v37;
  *(double *)((char *)v32 + v22[7]) = a3;
  *(double *)((char *)v32 + v22[8]) = a4;
  *((unsigned char *)v32 + v22[9]) = v38;
  sub_10000B630((uint64_t)v86, (uint64_t)v32 + v22[10], &qword_1000621F8);
  sub_1000307F4((uint64_t)v32, v85, type metadata accessor for ActivityRing);
  uint64_t v75 = a1;
  if (v84)
  {
    char v39 = 4;
  }
  else
  {
    double v35 = *(double *)(a1 + 8);
    char v39 = 1;
  }
  uint64_t v40 = (uint64_t)v79;
  uint64_t v41 = v76;
  uint64_t *v29 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v29 + v22[5]) = v39;
  *(double *)((char *)v29 + v22[6]) = v35;
  *(double *)((char *)v29 + v22[7]) = a3;
  *(double *)((char *)v29 + v22[8]) = a4 - a5;
  *((unsigned char *)v29 + v22[9]) = v38;
  sub_10000B630((uint64_t)v86, (uint64_t)v29 + v22[10], &qword_1000621F8);
  sub_10002C4B4((uint64_t)v86);
  sub_10002C4B4((uint64_t)v86);
  char v42 = sub_10004E9D0();
  sub_10004E510();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  sub_100030694((uint64_t)v29, (uint64_t)v19, type metadata accessor for ActivityRing);
  uint64_t v51 = &v19[*(int *)(v41 + 36)];
  *uint64_t v51 = v42;
  *((void *)v51 + 1) = v44;
  *((void *)v51 + 2) = v46;
  *((void *)v51 + 3) = v48;
  *((void *)v51 + 4) = v50;
  v51[40] = 0;
  sub_100030754((uint64_t)v29, type metadata accessor for ActivityRing);
  sub_10000B630((uint64_t)v19, v40, &qword_100062210);
  uint64_t v52 = v40;
  if (v84)
  {
    char v54 = 4;
    double v53 = 1.0;
  }
  else
  {
    double v53 = *(double *)(v75 + 16);
    char v54 = 2;
  }
  uint64_t *v26 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v26 + v22[5]) = v54;
  *(double *)((char *)v26 + v22[6]) = v53;
  *(double *)((char *)v26 + v22[7]) = a3;
  *(double *)((char *)v26 + v22[8]) = a4 - (a5 + a5);
  *((unsigned char *)v26 + v22[9]) = v38;
  sub_10000B630((uint64_t)v86, (uint64_t)v26 + v22[10], &qword_1000621F8);
  sub_10002C4B4((uint64_t)v86);
  char v55 = sub_10004E9D0();
  sub_10004E510();
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v64 = v77;
  sub_100030694((uint64_t)v26, v77, type metadata accessor for ActivityRing);
  uint64_t v65 = v64 + *(int *)(v41 + 36);
  *(unsigned char *)uint64_t v65 = v55;
  *(void *)(v65 + 8) = v57;
  *(void *)(v65 + 16) = v59;
  *(void *)(v65 + 24) = v61;
  *(void *)(v65 + 32) = v63;
  *(unsigned char *)(v65 + 40) = 0;
  sub_100030754((uint64_t)v26, type metadata accessor for ActivityRing);
  uint64_t v66 = v80;
  sub_10000B630(v64, v80, &qword_100062210);
  uint64_t v67 = v85;
  uint64_t v68 = v78;
  sub_100030694(v85, v78, type metadata accessor for ActivityRing);
  uint64_t v69 = v82;
  sub_10000509C(v52, v82, &qword_100062210);
  uint64_t v70 = v83;
  sub_10000509C(v66, v83, &qword_100062210);
  uint64_t v71 = v81;
  sub_100030694(v68, v81, type metadata accessor for ActivityRing);
  uint64_t v72 = sub_100004F98(&qword_100062218);
  sub_10000509C(v69, v71 + *(int *)(v72 + 48), &qword_100062210);
  sub_10000509C(v70, v71 + *(int *)(v72 + 64), &qword_100062210);
  sub_100005100(v66, &qword_100062210);
  sub_100005100(v52, &qword_100062210);
  sub_100030754(v67, type metadata accessor for ActivityRing);
  sub_100005100(v70, &qword_100062210);
  sub_100005100(v69, &qword_100062210);
  return sub_100030754(v68, type metadata accessor for ActivityRing);
}

uint64_t sub_10002D234@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = *(void *)(v1 + 32);
  *a1 = sub_1000307EC;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;
  sub_10000B630((uint64_t)&v6, (uint64_t)v7, &qword_1000621F8);
  return sub_10002C4B4((uint64_t)v7);
}

uint64_t sub_10002D2D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004F98(&qword_1000621A8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004E5A0();
  double v8 = v7;
  sub_10004E5A0();
  if (v9 < v8) {
    double v8 = v9;
  }
  *uint64_t v6 = sub_10004EE40();
  v6[1] = v10;
  uint64_t v11 = sub_100004F98(&qword_1000621B0);
  sub_10002D408(a1, (uint64_t)v6 + *(int *)(v11 + 44), v8);
  sub_10004EE50();
  sub_10004E590();
  sub_10000509C((uint64_t)v6, a2, &qword_1000621A8);
  uint64_t v12 = (_OWORD *)(a2 + *(int *)(sub_100004F98(&qword_1000621B8) + 36));
  long long v13 = v15[1];
  _OWORD *v12 = v15[0];
  v12[1] = v13;
  void v12[2] = v15[2];
  return sub_100005100((uint64_t)v6, &qword_1000621A8);
}

uint64_t sub_10002D408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v93 = a2;
  uint64_t v5 = sub_10004E630();
  __chkstk_darwin(v5 - 8);
  uint64_t v85 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_10004EEA0();
  uint64_t v83 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v81 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_10004ED30();
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v76 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100004F98(&qword_1000621C0);
  __chkstk_darwin(v79);
  int v84 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100004F98(&qword_1000621C8);
  __chkstk_darwin(v80);
  uint64_t v87 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100004F98(&qword_1000621D0);
  uint64_t v91 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v82 = (uint64_t)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004F98(&qword_1000621D8);
  __chkstk_darwin(v12 - 8);
  uint64_t v92 = (uint64_t)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unsigned int v89 = (char *)&v75 - v15;
  uint64_t v16 = type metadata accessor for ActivityRing(0);
  uint64_t v17 = (int *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (uint64_t *)((char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = sub_100004F98(&qword_1000621E0);
  uint64_t v21 = v20 - 8;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100004F98(&qword_1000621E8);
  uint64_t v25 = v24 - 8;
  __chkstk_darwin(v24);
  uint64_t v90 = (uint64_t)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v75 - v28;
  __chkstk_darwin(v30);
  uint64_t v95 = (uint64_t)&v75 - v31;
  uint64_t v32 = (int *)type metadata accessor for StandalonePhoneRingView(0);
  uint64_t v34 = v32[7];
  uint64_t v33 = v32[8];
  uint64_t v88 = a1;
  int v35 = *(unsigned __int8 *)(a1 + v33);
  uint64_t v36 = *(void *)(a1 + v32[5]);
  char v37 = *(unsigned char *)(a1 + v34);
  uint64_t v38 = *(void *)(a1 + v32[9]);
  *uint64_t v19 = swift_getKeyPath();
  sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v19 + v17[7]) = v35;
  *(uint64_t *)((char *)v19 + v17[8]) = v36;
  *(double *)((char *)v19 + v17[9]) = a3 * 0.2;
  *(double *)((char *)v19 + v17[10]) = a3;
  *((unsigned char *)v19 + v17[11]) = v37;
  uint64_t v39 = (uint64_t)v89;
  *(uint64_t *)((char *)v19 + v17[12]) = v38;
  swift_retain();
  sub_10004EE50();
  sub_10004E590();
  sub_100030694((uint64_t)v19, (uint64_t)v23, type metadata accessor for ActivityRing);
  uint64_t v40 = &v23[*(int *)(v21 + 44)];
  long long v41 = v97;
  *(_OWORD *)uint64_t v40 = v96;
  *((_OWORD *)v40 + 1) = v41;
  *((_OWORD *)v40 + 2) = v98;
  sub_100030754((uint64_t)v19, type metadata accessor for ActivityRing);
  if (v35 == 4) {
    double v42 = 0.36;
  }
  else {
    double v42 = 1.0;
  }
  sub_10000509C((uint64_t)v23, (uint64_t)v29, &qword_1000621E0);
  *(double *)&v29[*(int *)(v25 + 44)] = v42;
  sub_100005100((uint64_t)v23, &qword_1000621E0);
  sub_10000B630((uint64_t)v29, v95, &qword_1000621E8);
  uint64_t v43 = 1;
  if (*(unsigned char *)(v88 + v32[6]) == 1)
  {
    sub_10004ED40();
    uint64_t v44 = v77;
    uint64_t v45 = v76;
    uint64_t v46 = v78;
    (*(void (**)(char *, void, uint64_t))(v77 + 104))(v76, enum case for Image.ResizingMode.stretch(_:), v78);
    uint64_t v47 = sub_10004ED50();
    swift_release();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
    uint64_t v48 = sub_10004ECC0();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v50 = v83;
    uint64_t v51 = v81;
    uint64_t v52 = v86;
    (*(void (**)(char *, void, uint64_t))(v83 + 104))(v81, enum case for BlendMode.destinationOut(_:), v86);
    uint64_t v53 = (uint64_t)v85;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v85, v51, v52);
    uint64_t v54 = (uint64_t)v84;
    sub_100030694(v53, (uint64_t)&v84[*(int *)(v79 + 36)], (uint64_t (*)(void))&type metadata accessor for _BlendModeEffect);
    *(void *)uint64_t v54 = v47;
    *(void *)(v54 + 8) = 0;
    *(_WORD *)(v54 + 16) = 1;
    *(void *)(v54 + 24) = KeyPath;
    *(void *)(v54 + 32) = v48;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100030754(v53, (uint64_t (*)(void))&type metadata accessor for _BlendModeEffect);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
    swift_release();
    swift_release();
    swift_release();
    sub_10004EE50();
    sub_10004E590();
    uint64_t v55 = v87;
    sub_10000509C(v54, v87, &qword_1000621C0);
    uint64_t v56 = (_OWORD *)(v55 + *(int *)(v80 + 36));
    long long v57 = v100;
    *uint64_t v56 = v99;
    v56[1] = v57;
    v56[2] = v101;
    sub_100005100(v54, &qword_1000621C0);
    char v58 = sub_10004E9E0();
    sub_10004E510();
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v67 = v82;
    sub_10000509C(v55, v82, &qword_1000621C8);
    uint64_t v68 = v67 + *(int *)(v94 + 36);
    *(unsigned char *)uint64_t v68 = v58;
    *(void *)(v68 + 8) = v60;
    *(void *)(v68 + 16) = v62;
    *(void *)(v68 + 24) = v64;
    *(void *)(v68 + 32) = v66;
    *(unsigned char *)(v68 + 40) = 0;
    sub_100005100(v55, &qword_1000621C8);
    sub_10000B630(v67, v39, &qword_1000621D0);
    uint64_t v43 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v91 + 56))(v39, v43, 1, v94);
  uint64_t v69 = v95;
  uint64_t v70 = v90;
  sub_10000509C(v95, v90, &qword_1000621E8);
  uint64_t v71 = v92;
  sub_10000509C(v39, v92, &qword_1000621D8);
  uint64_t v72 = v93;
  sub_10000509C(v70, v93, &qword_1000621E8);
  uint64_t v73 = sub_100004F98(&qword_1000621F0);
  sub_10000509C(v71, v72 + *(int *)(v73 + 48), &qword_1000621D8);
  sub_100005100(v39, &qword_1000621D8);
  sub_100005100(v69, &qword_1000621E8);
  sub_100005100(v71, &qword_1000621D8);
  return sub_100005100(v70, &qword_1000621E8);
}

uint64_t sub_10002DDDC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_100030694(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for StandalonePhoneRingView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000307F4((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for StandalonePhoneRingView);
  *a2 = sub_100030610;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

uint64_t sub_10002DEF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = (int *)type metadata accessor for ActivityRing(0);
  uint64_t v33 = *((void *)v4 - 1);
  uint64_t v5 = *(void *)(v33 + 64);
  __chkstk_darwin(v4);
  uint64_t v34 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004EFA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v32 - v11;
  sub_10001DE90((uint64_t)&v32 - v11);
  sub_10004EF90();
  sub_100031394();
  char v13 = sub_10004F0C0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v9, v6);
  v14(v12, v6);
  if ((v13 & 1) != 0 || (uint64_t v15 = *(void *)(v2 + v4[10])) == 0)
  {
    sub_10002EC68();
    uint64_t v15 = sub_10004ECE0();
    swift_release();
  }
  else
  {
    swift_retain();
  }
  sub_10004E530();
  double v16 = v35;
  uint64_t v17 = v36;
  uint64_t v18 = v37;
  uint64_t v19 = v38;
  uint64_t v20 = v39;
  uint64_t v21 = sub_10004EE50();
  uint64_t v23 = v22;
  if (*(unsigned char *)(v2 + v4[9]))
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v28 = v34;
    sub_100030694(v2, v34, type metadata accessor for ActivityRing);
    unint64_t v29 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v25 = swift_allocObject();
    sub_1000307F4(v28, v25 + v29, type metadata accessor for ActivityRing);
    uint64_t v30 = *(void *)(v2 + v4[6]);
    uint64_t v26 = sub_10004EE70();
    uint64_t v27 = v30;
    uint64_t v24 = sub_10003150C;
  }
  *(double *)a1 = v16 * 0.5;
  *(double *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v18;
  *(void *)(a1 + 32) = v19;
  *(void *)(a1 + 40) = v20;
  *(void *)(a1 + 48) = v15;
  *(_WORD *)(a1 + 56) = 256;
  *(void *)(a1 + 64) = v21;
  *(void *)(a1 + 72) = v23;
  *(void *)(a1 + 80) = v24;
  *(void *)(a1 + 88) = v25;
  *(void *)(a1 + 96) = v26;
  *(void *)(a1 + 104) = v27;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000315D0((uint64_t)v24);
  sub_100031614((uint64_t)v24);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002E2E0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004ECB0();
  uint64_t v88 = *(void *)(v4 - 8);
  uint64_t v89 = v4;
  __chkstk_darwin(v4);
  uint64_t v87 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004E630();
  __chkstk_darwin(v6 - 8);
  uint64_t v82 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_10004EEA0();
  uint64_t v81 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v80 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100004F98(&qword_1000622F8);
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v79 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004EFA0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  double v16 = (char *)&v70 - v15;
  uint64_t v17 = sub_100004F98(&qword_100062300);
  __chkstk_darwin(v17 - 8);
  uint64_t v86 = (uint64_t)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v93 = (uint64_t)&v70 - v20;
  uint64_t v21 = sub_100004F98(&qword_100062308);
  __chkstk_darwin(v21 - 8);
  uint64_t v92 = (uint64_t)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v70 - v24;
  uint64_t v26 = (int *)type metadata accessor for ActivityRing(0);
  uint64_t v27 = v26[6];
  uint64_t v90 = v26[7];
  uint64_t v91 = v27;
  uint64_t v28 = *(void *)(a1 + v27);
  uint64_t v29 = *(void *)(a1 + v90);
  sub_100004F98(&qword_100061630);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_10004FC80;
  sub_10002EC68();
  *(void *)(v30 + 32) = v31;
  sub_10002EC68();
  *(void *)(v30 + 40) = v32;
  uint64_t v94 = v30;
  sub_10004F180();
  sub_10004EE00();
  sub_10004EEE0();
  sub_10004E5D0();
  uint64_t v33 = v94;
  uint64_t v34 = v95;
  uint64_t v35 = v96;
  uint64_t v36 = v97;
  uint64_t v37 = v98;
  if (*(unsigned char *)(a1 + v26[5]) == 4)
  {
    uint64_t v38 = sub_100004F98(&qword_100062318);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v25, 1, 1, v38);
    uint64_t v39 = v92;
  }
  else
  {
    uint64_t v70 = v26;
    uint64_t v72 = v96;
    uint64_t v73 = v95;
    uint64_t v76 = v94;
    uint64_t v77 = v29;
    uint64_t v78 = v25;
    sub_10001DE90((uint64_t)v16);
    sub_10004EF90();
    sub_100031394();
    char v40 = sub_10004F0C0();
    long long v41 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v71 = v13;
    v41(v13, v10);
    uint64_t v42 = (uint64_t)v16;
    uint64_t v74 = v10;
    uint64_t v75 = v11 + 8;
    v41(v16, v10);
    uint64_t v43 = 1;
    uint64_t v44 = v85;
    if ((v40 & 1) == 0)
    {
      uint64_t v45 = *(void *)(a1 + v91);
      uint64_t v46 = *(void *)(a1 + v90);
      uint64_t v47 = v81;
      uint64_t v48 = v80;
      uint64_t v49 = v83;
      (*(void (**)(char *, void, uint64_t))(v81 + 104))(v80, enum case for BlendMode.destinationOut(_:), v83);
      uint64_t v50 = (uint64_t)v82;
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v82, v48, v49);
      uint64_t v51 = (uint64_t)v79;
      sub_100030694(v50, (uint64_t)&v79[*(int *)(v44 + 36)], (uint64_t (*)(void))&type metadata accessor for _BlendModeEffect);
      *(void *)uint64_t v51 = v45;
      *(void *)(v51 + 8) = v46;
      *(unsigned char *)(v51 + 16) = 3;
      *(void *)(v51 + 24) = v45;
      *(void *)(v51 + 32) = v46;
      *(_WORD *)(v51 + 40) = 2;
      *(unsigned char *)(v51 + 42) = 0;
      sub_100030754(v50, (uint64_t (*)(void))&type metadata accessor for _BlendModeEffect);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
      sub_10000B630(v51, v93, &qword_1000622F8);
      uint64_t v43 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v93, v43, 1, v44);
    uint64_t v53 = v90;
    uint64_t v52 = v91;
    uint64_t v54 = *(void *)(a1 + v91);
    uint64_t v55 = *(void *)(a1 + v90);
    sub_10002EC68();
    uint64_t v57 = v56;
    sub_10001DE90(v42);
    char v58 = v71;
    sub_10004EF90();
    sub_10004EF80();
    uint64_t v59 = v74;
    v41(v58, v74);
    v41((char *)v42, v59);
    (*(void (**)(char *, void, uint64_t))(v88 + 104))(v87, enum case for Color.RGBColorSpace.sRGB(_:), v89);
    uint64_t v60 = sub_10004ED10();
    double v61 = *(double *)(a1 + v70[8]) / 15.0;
    uint64_t v62 = *(void *)(a1 + v52);
    uint64_t v63 = *(void *)(a1 + v53);
    uint64_t v64 = v93;
    uint64_t v65 = v86;
    sub_10000509C(v93, v86, &qword_100062300);
    uint64_t v39 = v92;
    sub_10000509C(v65, v92, &qword_100062300);
    uint64_t v66 = v39 + *(int *)(sub_100004F98(&qword_100062310) + 48);
    *(void *)uint64_t v66 = v54;
    *(void *)(v66 + 8) = v55;
    *(unsigned char *)(v66 + 16) = 1;
    *(void *)(v66 + 24) = v57;
    *(_WORD *)(v66 + 32) = 256;
    *(void *)(v66 + 40) = v60;
    *(double *)(v66 + 48) = v61;
    *(void *)(v66 + 56) = 0;
    *(void *)(v66 + 64) = 0;
    *(void *)(v66 + 72) = v62;
    *(void *)(v66 + 80) = v63;
    *(_WORD *)(v66 + 88) = 2;
    *(unsigned char *)(v66 + 90) = 0;
    swift_retain();
    swift_retain();
    sub_100005100(v64, &qword_100062300);
    swift_release();
    swift_release();
    sub_100005100(v65, &qword_100062300);
    uint64_t v67 = sub_100004F98(&qword_100062318);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v39, 0, 1, v67);
    uint64_t v25 = v78;
    sub_10000B630(v39, (uint64_t)v78, &qword_100062308);
    uint64_t v29 = v77;
    uint64_t v33 = v76;
    uint64_t v34 = v73;
    uint64_t v35 = v72;
  }
  sub_10000509C((uint64_t)v25, v39, &qword_100062308);
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v29;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v33;
  *(void *)(a2 + 32) = v34;
  *(void *)(a2 + 40) = v35;
  *(void *)(a2 + 48) = v36;
  *(void *)(a2 + 56) = v37;
  *(_WORD *)(a2 + 64) = 256;
  uint64_t v68 = sub_100004F98(&qword_100062320);
  sub_10000509C(v39, a2 + *(int *)(v68 + 48), &qword_100062308);
  swift_bridgeObjectRetain();
  sub_100005100((uint64_t)v25, &qword_100062308);
  sub_100005100(v39, &qword_100062308);
  return swift_bridgeObjectRelease();
}

void sub_10002EC68()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004EFA0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v14 - v7;
  sub_10001DE90((uint64_t)&v14 - v7);
  sub_10004EF90();
  sub_100031394();
  char v9 = sub_10004F0C0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  v10(v8, v2);
  if (v9)
  {
    sub_10002EE30();
    return;
  }
  if (*(unsigned char *)(v1 + *(int *)(type metadata accessor for ActivityRing(0) + 20)) == 4)
  {
    id v11 = [self grayColors];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = [v11 gradientDarkColor];

      if (v13)
      {
        sub_10004ECA0();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    sub_10004ECD0();
  }
}

uint64_t sub_10002EE30()
{
  uint64_t v1 = sub_10004ECB0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  switch(*(unsigned char *)(v0 + *(int *)(type metadata accessor for ActivityRing(0) + 20)))
  {
    case 1:
      goto LABEL_7;
    case 2:
      goto LABEL_12;
    case 3:
      goto LABEL_17;
    case 4:
      goto LABEL_22;
    default:
      uint64_t v5 = self;
      id v6 = [v5 energyColors];
      if (!v6)
      {
        __break(1u);
        goto LABEL_28;
      }
      uint64_t v7 = v6;
      id v8 = [v6 gradientDarkColor];

      if (!v8)
      {
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      [v8 getRed:&v43 green:&v42 blue:&v41 alpha:0];

      id v9 = [v5 energyColors];
      if (!v9)
      {
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      uint64_t v10 = v9;
      id v11 = [v9 gradientLightColor];

      if (v11) {
        goto LABEL_26;
      }
      __break(1u);
LABEL_7:
      uint64_t v12 = self;
      id v13 = [v12 briskColors];
      if (!v13) {
        goto LABEL_30;
      }
      uint64_t v14 = v13;
      id v15 = [v13 gradientDarkColor];

      if (!v15)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      [v15 getRed:&v43 green:&v42 blue:&v41 alpha:0];

      id v16 = [v12 briskColors];
      if (!v16)
      {
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      uint64_t v17 = v16;
      id v11 = [v16 gradientLightColor];

      if (v11) {
        goto LABEL_26;
      }
      __break(1u);
LABEL_12:
      uint64_t v18 = self;
      id v19 = [v18 sedentaryColors];
      if (!v19) {
        goto LABEL_33;
      }
      uint64_t v20 = v19;
      id v21 = [v19 gradientDarkColor];

      if (!v21)
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      [v21 getRed:&v43 green:&v42 blue:&v41 alpha:0];

      id v22 = [v18 sedentaryColors];
      if (!v22)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v23 = v22;
      id v11 = [v22 gradientLightColor];

      if (v11) {
        goto LABEL_26;
      }
      __break(1u);
LABEL_17:
      uint64_t v24 = self;
      id v25 = [v24 energyColors];
      if (!v25) {
        goto LABEL_36;
      }
      uint64_t v26 = v25;
      id v27 = [v25 nonGradientTextColor];

      if (!v27)
      {
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
      [v27 getRed:&v43 green:&v42 blue:&v41 alpha:0];

      id v28 = [v24 energyColors];
      if (!v28)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      uint64_t v29 = v28;
      id v11 = [v28 nonGradientTextColor];

      if (!v11)
      {
        __break(1u);
LABEL_22:
        uint64_t v30 = self;
        id v31 = [v30 grayColors];
        if (v31)
        {
          uint64_t v32 = v31;
          id v33 = [v31 gradientDarkColor];

          if (v33)
          {
            [v33 getRed:&v43 green:&v42 blue:&v41 alpha:0];

            id v34 = [v30 grayColors];
            if (v34)
            {
              uint64_t v35 = v34;
              id v11 = [v34 gradientLightColor];

              if (v11) {
                goto LABEL_26;
              }
LABEL_42:
              __break(1u);
              JUMPOUT(0x10002F398);
            }
LABEL_41:
            __break(1u);
            goto LABEL_42;
          }
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_26:
      [v11 getRed:&v40 green:&v39 blue:&v38 alpha:0];

      (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Color.RGBColorSpace.sRGB(_:), v1);
      return sub_10004ED00();
  }
}

double sub_10002F3AC@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  CGRectGetMidX(*(CGRect *)&a2);
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  CGRectGetMidY(v28);
  v29.origin.x = a2;
  v29.origin.y = a3;
  v29.size.width = a4;
  v29.size.height = a5;
  CGRectGetWidth(v29);
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  CGRectGetHeight(v30);
  sub_10004EB20();
  uint64_t v21 = 0x3FF0000000000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0x3FF0000000000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  sub_10004EB10();
  v19[0] = v12;
  v19[1] = v13;
  char v20 = v14;
  sub_10003182C((uint64_t)v19, (uint64_t)v27);
  sub_1000318CC((uint64_t)v27, (void (*)(void, void, void, void, void))sub_100031888);
  sub_10004E530();
  sub_10004EAF0();
  sub_1000318A0((uint64_t)v15);
  sub_1000318CC((uint64_t)v19, (void (*)(void, void, void, void, void))sub_10003190C);
  sub_1000318CC((uint64_t)v19, (void (*)(void, void, void, void, void))sub_10003190C);
  double result = *(double *)&v16;
  long long v11 = v17;
  *(_OWORD *)a1 = v16;
  *(_OWORD *)(a1 + 16) = v11;
  *(unsigned char *)(a1 + 32) = v18;
  return result;
}

double sub_10002F6B0@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_10002F3AC((uint64_t)v8, a2, a3, a4, a5);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 32) = v9;
  return result;
}

uint64_t sub_10002F6FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for LayoutDirectionBehavior.fixed(_:);
  uint64_t v3 = sub_10004E940();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_10002F770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100031924();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10002F7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100031924();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10002F838(uint64_t a1)
{
  unint64_t v2 = sub_100031924();

  return Shape.body.getter(a1, v2);
}

uint64_t type metadata accessor for StandalonePhoneRingView(uint64_t a1)
{
  return sub_10003065C(a1, qword_100062160);
}

uint64_t sub_10002F8B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004E6B0();
  *a1 = result;
  return result;
}

uint64_t sub_10002F8DC()
{
  return sub_10004E6C0();
}

void sub_10002F908(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a1)
  {
    swift_retain();
    id v8 = [a1 activityMoveMode];
    char v9 = &selRef__moveMinutesCompletionPercentage;
    if (v8 != (id)2) {
      char v9 = &selRef__activeEnergyCompletionPercentage;
    }
    [a1 *v9];
    uint64_t v11 = v10;
    [a1 _exerciseTimeCompletionPercentage];
    uint64_t v13 = v12;
    [a1 _standHoursCompletionPercentage];
    uint64_t v15 = v14;
  }
  else
  {
    swift_retain();
    uint64_t v15 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
  }
  *(void *)a4 = v11;
  *(void *)(a4 + 8) = v13;
  *(void *)(a4 + 16) = v15;
  *(unsigned char *)(a4 + 24) = a1 == 0;
  *(unsigned char *)(a4 + 25) = a2 & 1;
  *(void *)(a4 + 32) = a3;
}

void *sub_10002F9F4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v10 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  }
  swift_retain();
  return a1;
}

uint64_t sub_10002FB38(uint64_t a1)
{
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_10002FBD8(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *((unsigned char *)a1 + v7) = *((unsigned char *)a2 + v7);
  uint64_t v8 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_retain();
  return a1;
}

void *sub_10002FCD0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D88);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_10002FDF4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v9] = a2[v9];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  return a1;
}

char *sub_10002FEF0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D88);
    uint64_t v6 = sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v9] = a2[v9];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_release();
  return a1;
}

uint64_t sub_10003000C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100030020);
}

uint64_t sub_100030020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061E48);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36));
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

uint64_t sub_1000300F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100030104);
}

uint64_t sub_100030104(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004F98(&qword_100061E48);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = a2;
  }
  return result;
}

void sub_1000301C4()
{
  sub_10003027C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10003027C()
{
  if (!qword_100061EB8)
  {
    sub_10004EFA0();
    unint64_t v0 = sub_10004E520();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100061EB8);
    }
  }
}

uint64_t destroy for ActivityRingsView()
{
  return swift_release();
}

uint64_t initializeWithCopy for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityRingsView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityRingsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityRingsView()
{
  return &type metadata for ActivityRingsView;
}

uint64_t sub_1000304B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000304D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000304F0()
{
  uint64_t v1 = *(void *)(type metadata accessor for StandalonePhoneRingView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100030610(uint64_t a1)
{
  return sub_100031538(a1, type metadata accessor for StandalonePhoneRingView, (uint64_t (*)(uint64_t, uint64_t))sub_10002D2D0);
}

uint64_t type metadata accessor for ActivityRing(uint64_t a1)
{
  return sub_10003065C(a1, qword_100062278);
}

uint64_t sub_10003065C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100030694(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000306FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004E6B0();
  *a1 = result;
  return result;
}

uint64_t sub_100030728()
{
  return sub_10004E6C0();
}

uint64_t sub_100030754(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000307B4()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000307EC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002CA68(v1 + 16, a1);
}

uint64_t sub_1000307F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_10003085C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
    uint64_t v11 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000309A8(uint64_t a1)
{
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_100030A48(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  uint64_t v9 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
  swift_retain();
  return a1;
}

void *sub_100030B48(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D88);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_100030C78(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  uint64_t v10 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  return a1;
}

char *sub_100030D7C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D88);
    uint64_t v6 = sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  uint64_t v10 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  swift_release();
  return a1;
}

uint64_t sub_100030EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100030EB4);
}

uint64_t sub_100030EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061E48);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 40));
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

uint64_t sub_100030F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100030F98);
}

uint64_t sub_100030F98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004F98(&qword_100061E48);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40)) = a2;
  }
  return result;
}

void sub_100031058()
{
  sub_10003027C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for ActivityRing.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ActivityRing.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100031270);
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

ValueMetadata *type metadata accessor for ActivityRing.Kind()
{
  return &type metadata for ActivityRing.Kind;
}

uint64_t sub_1000312A8()
{
  return sub_10000566C(&qword_1000622C8, &qword_1000622D0);
}

uint64_t sub_1000312E4()
{
  return sub_10000566C(&qword_1000622D8, &qword_1000622E0);
}

unint64_t sub_100031324()
{
  unint64_t result = qword_1000622E8;
  if (!qword_1000622E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000622E8);
  }
  return result;
}

uint64_t sub_100031378()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100031394()
{
  unint64_t result = qword_1000622F0;
  if (!qword_1000622F0)
  {
    sub_10004EFA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000622F0);
  }
  return result;
}

uint64_t sub_1000313EC()
{
  uint64_t v1 = *(void *)(type metadata accessor for ActivityRing(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003150C(uint64_t a1)
{
  return sub_100031538(a1, type metadata accessor for ActivityRing, (uint64_t (*)(uint64_t, uint64_t))sub_10002E2E0);
}

uint64_t sub_100031538(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_1000315D0(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100031614(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for ActivityRing.Arc(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityRing.Arc(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityRing.Arc(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityRing.Arc()
{
  return &type metadata for ActivityRing.Arc;
}

uint64_t sub_100031704()
{
  return sub_10000566C(&qword_100062328, &qword_100062330);
}

uint64_t sub_100031740()
{
  return sub_10000566C(&qword_100062338, &qword_100062340);
}

unint64_t sub_100031780()
{
  unint64_t result = qword_100062348;
  if (!qword_100062348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062348);
  }
  return result;
}

unint64_t sub_1000317D8()
{
  unint64_t result = qword_100062350;
  if (!qword_100062350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062350);
  }
  return result;
}

uint64_t sub_10003182C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100031888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000318A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000318CC(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10003190C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100031924()
{
  unint64_t result = qword_100062358;
  if (!qword_100062358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062358);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityRing.Arc.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ActivityRing.Arc.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100031AD4);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityRing.Arc.Kind()
{
  return &type metadata for ActivityRing.Arc.Kind;
}

unint64_t sub_100031B10()
{
  unint64_t result = qword_100062360;
  if (!qword_100062360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062360);
  }
  return result;
}

void *sub_100031B74(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    int v11 = *(void **)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v11;
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = *(void **)((char *)a2 + v12);
    *(void *)((char *)a1 + v12) = v14;
    uint64_t v15 = (char *)a1 + v13;
    long long v16 = (char *)a2 + v13;
    uint64_t v17 = sub_10004E400();
    uint64_t v18 = *(void *)(v17 - 8);
    id v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    id v20 = v11;
    id v21 = v14;
    if (v19(v16, 1, v17))
    {
      uint64_t v22 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return a1;
}

uint64_t sub_100031D98(uint64_t a1, int *a2)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = a1 + a2[8];
  uint64_t v6 = sub_10004E400();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

void *sub_100031EDC(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = *(void **)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = v12;
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  uint64_t v15 = sub_10004E400();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  id v18 = v9;
  id v19 = v12;
  if (v17(v14, 1, v15))
  {
    uint64_t v20 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

void *sub_1000320B0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)((char *)a2 + v7);
  uint64_t v9 = *(void **)((char *)a1 + v7);
  *(void *)((char *)a1 + v7) = v8;
  id v10 = v8;

  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = *(void **)((char *)a1 + v11);
  uint64_t v13 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v13;
  id v14 = v13;

  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_10004E400();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_11;
  }
  if (v22)
  {
LABEL_11:
    uint64_t v23 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

char *sub_100032308(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  id v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_10004E400();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *sub_1000324CC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    uint64_t v6 = sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  uint64_t v10 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v11 = *(void **)&a1[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];

  uint64_t v12 = a3[8];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_10004E400();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_10;
  }
  if (v19)
  {
LABEL_10:
    uint64_t v20 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_100032720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100032734);
}

uint64_t sub_100032734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 32);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_100032868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003287C);
}

uint64_t sub_10003287C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004F98(&qword_100061B98);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_100004F98((uint64_t *)&unk_100061980);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for FitnessComplicationView()
{
  uint64_t result = qword_1000623C0;
  if (!qword_1000623C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000329FC()
{
  sub_1000214F0(319, &qword_100061C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_1000214F0(319, (unint64_t *)&qword_100061720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_100032B44()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100032B60(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004EFB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DB8C((uint64_t)v10);
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v10, v7);
  if (v11 == enum case for WidgetFamily.accessoryCircular(_:))
  {
    uint64_t v12 = (int *)type metadata accessor for FitnessComplicationView();
    uint64_t v13 = *(void **)(a1 + v12[5]);
    uint64_t v14 = *(void **)(a1 + v12[7]);
    sub_100022198(a1 + v12[8], (uint64_t)v6);
    uint64_t v15 = sub_10004E400();
    BOOL v16 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v6, 1, v15) != 1;
    id v17 = v14;
    id v18 = v13;
    sub_100005100((uint64_t)v6, (uint64_t *)&unk_100061980);
    int v19 = self;
    id v20 = v17;
    id v21 = [v19 mainBundle];
    NSString v22 = sub_10004F0D0();
    NSString v23 = sub_10004F0D0();
    id v24 = [v21 localizedStringForKey:v22 value:0 table:v23];

    uint64_t v25 = sub_10004F0F0();
    uint64_t v27 = v26;

    *(void *)&long long v63 = v14;
    *((void *)&v63 + 1) = v16;
    *(void *)&long long v64 = v18;
    *((void *)&v64 + 1) = v14;
    *(void *)&long long v65 = v25;
    *((void *)&v65 + 1) = v27;
    uint64_t v67 = 0;
    long long v66 = 0uLL;
    char v68 = 0;
    sub_100033440();
    sub_100033494();
    id v28 = v18;
    id v29 = v20;
    swift_bridgeObjectRetain();
    sub_10004E920();
    long long v51 = v57;
    long long v52 = v58;
    long long v53 = v59;
    long long v54 = v60;
    uint64_t v55 = v61;
    __int16 v56 = v62;
    sub_100004F98(&qword_100062430);
    sub_100004F98(&qword_100062450);
    sub_10003337C();
    sub_1000334E8();
    sub_10004E920();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v11 == enum case for WidgetFamily.accessoryRectangular(_:))
    {
      CGRect v30 = (int *)type metadata accessor for FitnessComplicationView();
      id v31 = *(void **)(a1 + v30[5]);
      char v32 = *(unsigned char *)(a1 + v30[6]);
      id v33 = *(void **)(a1 + v30[7]);
      id v34 = v33;
      sub_10003B2D4(v31, v32, v33, (uint64_t)&v70);
      *(void *)&long long v63 = v70;
      *((void *)&v63 + 1) = v71;
      long long v64 = v72;
      long long v65 = v73;
      long long v66 = v74;
      uint64_t v67 = v75;
      char v68 = 1;
      sub_100033710((uint64_t)&v70);
      sub_100033440();
      sub_100033494();
      sub_10004E920();
      long long v51 = v57;
      long long v52 = v58;
      long long v53 = v59;
      long long v54 = v60;
      uint64_t v55 = v61;
      __int16 v56 = v62;
    }
    else
    {
      if (v11 != enum case for WidgetFamily.accessoryInline(_:))
      {
        uint64_t v67 = 0;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        char v68 = 1;
        sub_100033564();
        sub_10004E920();
        long long v51 = v57;
        long long v52 = v58;
        long long v53 = v59;
        long long v54 = v60;
        uint64_t v55 = v61;
        LOBYTE(v56) = v62;
        HIBYTE(v56) = 1;
        sub_100004F98(&qword_100062430);
        sub_100004F98(&qword_100062450);
        sub_10003337C();
        sub_1000334E8();
        sub_10004E920();
        long long v49 = v64;
        long long v50 = v63;
        long long v47 = v66;
        long long v48 = v65;
        uint64_t v44 = v67;
        char v45 = v68;
        char v46 = v69;
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        long long v43 = v47;
        long long v42 = v48;
        long long v41 = v49;
        long long v40 = v50;
        goto LABEL_9;
      }
      uint64_t v35 = (int *)type metadata accessor for FitnessComplicationView();
      uint64_t v36 = *(void **)(a1 + v35[5]);
      char v37 = *(unsigned char *)(a1 + v35[6]);
      uint64_t v38 = *(void **)(a1 + v35[7]);
      id v39 = v38;
      sub_10003B2D4(v36, v37, v38, (uint64_t)&v70);
      *(void *)&long long v63 = v70;
      *((void *)&v63 + 1) = v71;
      long long v64 = v72;
      long long v65 = v73;
      long long v66 = v74;
      uint64_t v67 = v75;
      char v68 = 0;
      sub_100033710((uint64_t)&v70);
      sub_100033564();
      sub_10004E920();
      long long v51 = v57;
      long long v52 = v58;
      long long v53 = v59;
      long long v54 = v60;
      uint64_t v55 = v61;
      LOBYTE(v56) = v62;
      HIBYTE(v56) = 1;
    }
    sub_100004F98(&qword_100062430);
    sub_100004F98(&qword_100062450);
    sub_10003337C();
    sub_1000334E8();
    sub_10004E920();
    sub_100033778((uint64_t)&v70);
  }
  long long v40 = v63;
  long long v41 = v64;
  long long v42 = v65;
  long long v43 = v66;
  uint64_t v44 = v67;
  char v45 = v68;
  char v46 = v69;
LABEL_9:
  *(_OWORD *)a2 = v40;
  *(_OWORD *)(a2 + 16) = v41;
  *(_OWORD *)(a2 + 32) = v42;
  *(_OWORD *)(a2 + 48) = v43;
  *(void *)(a2 + 64) = v44;
  *(unsigned char *)(a2 + 72) = v45;
  *(unsigned char *)(a2 + 73) = v46;
}

void sub_1000331E8()
{
  sub_100032B60(v0, (uint64_t)v12);
  uint64_t v10 = v12[1];
  int v11 = (void *)v12[0];
  unint64_t v1 = (void *)v12[3];
  uint64_t v9 = (void *)v12[2];
  int v2 = (void *)v12[4];
  uint64_t v3 = v12[5];
  uint64_t v4 = v12[6];
  uint64_t v5 = v12[7];
  uint64_t v6 = v12[8];
  char v7 = v13;
  char v8 = v14;
  sub_100004F98(&qword_100062408);
  sub_1000332D0();
  sub_10004EC20();
  sub_1000335B8(v11, v10, v9, v1, v2, v3, v4, v5, v6, v7, v8);
}

unint64_t sub_1000332D0()
{
  unint64_t result = qword_100062410;
  if (!qword_100062410)
  {
    sub_1000053B0(&qword_100062408);
    sub_1000333B8(&qword_100062418, &qword_100062420, (void (*)(void))sub_10003337C, (void (*)(void))sub_1000334E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062410);
  }
  return result;
}

uint64_t sub_10003337C()
{
  return sub_1000333B8(&qword_100062428, &qword_100062430, (void (*)(void))sub_100033440, (void (*)(void))sub_100033494);
}

uint64_t sub_1000333B8(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000053B0(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100033440()
{
  unint64_t result = qword_100062438;
  if (!qword_100062438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062438);
  }
  return result;
}

unint64_t sub_100033494()
{
  unint64_t result = qword_100062440;
  if (!qword_100062440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062440);
  }
  return result;
}

unint64_t sub_1000334E8()
{
  unint64_t result = qword_100062448;
  if (!qword_100062448)
  {
    sub_1000053B0(&qword_100062450);
    sub_100033564();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062448);
  }
  return result;
}

unint64_t sub_100033564()
{
  unint64_t result = qword_100062458;
  if (!qword_100062458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062458);
  }
  return result;
}

void sub_1000335B8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11)
{
  if (a11) {
    sub_100033684(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  }
  else {
    sub_1000335E8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  }
}

void sub_1000335E8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  int v11 = a1;
  if (a10)
  {

    swift_bridgeObjectRelease();
    int v11 = a3;
    a4 = a5;
  }
  else
  {
  }
  swift_bridgeObjectRelease();
}

void sub_100033684(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if ((a10 & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100033710(uint64_t a1)
{
  int v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  return a1;
}

uint64_t sub_100033778(uint64_t a1)
{
  int v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_1000337DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100033838@<X0>(char a1@<W0>, void *a2@<X1>, char a3@<W2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  *a6 = swift_getKeyPath();
  sub_100004F98(&qword_100061B88);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (int *)type metadata accessor for StandaloneSummaryView();
  char v13 = (uint64_t *)((char *)a6 + v12[5]);
  *char v13 = swift_getKeyPath();
  sub_100004F98(&qword_100061B90);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a6 + v12[6]) = a1;
  *(uint64_t *)((char *)a6 + v12[7]) = (uint64_t)a2;
  *((unsigned char *)a6 + v12[8]) = a3;
  *(uint64_t *)((char *)a6 + v12[9]) = (uint64_t)a4;
  sub_10000509C(a5, (uint64_t)a6 + v12[10], (uint64_t *)&unk_100061980);
  char v14 = self;
  id v15 = a4;
  id v16 = a2;
  id v17 = [v14 mainBundle];
  NSString v18 = sub_10004F0D0();
  NSString v19 = sub_10004F0D0();
  id v20 = [v17 localizedStringForKey:v18 value:0 table:v19];

  uint64_t v21 = sub_10004F0F0();
  uint64_t v23 = v22;

  uint64_t result = sub_100005100(a5, (uint64_t *)&unk_100061980);
  uint64_t v25 = (uint64_t *)((char *)a6 + v12[11]);
  *uint64_t v25 = v16;
  v25[1] = a4;
  v25[2] = v21;
  v25[3] = v23;
  return result;
}

uint64_t type metadata accessor for StandaloneSummaryView()
{
  uint64_t result = qword_1000624B8;
  if (!qword_1000624B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100033A68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v37 = a3;
  uint64_t v34 = sub_10004E5B0();
  uint64_t v4 = *(void *)(v34 - 8);
  uint64_t v35 = *(void *)(v4 + 64);
  __chkstk_darwin(v34);
  id v31 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for StandaloneSummaryView();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v30 + 64);
  __chkstk_darwin(v6 - 8);
  v29[0] = (uint64_t)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004EF70();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  char v14 = (char *)v29 - v13;
  __chkstk_darwin(v15);
  id v17 = (char *)v29 - v16;
  v29[3] = (uint64_t)v29 - v16;
  uint64_t v18 = sub_100004F98(&qword_100062508);
  uint64_t v32 = *(void *)(v18 - 8);
  uint64_t v33 = v18;
  __chkstk_darwin(v18);
  id v20 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100033EB0((uint64_t)v17);
  v29[2] = sub_10004E820();
  v29[1] = sub_10004E8D0();
  sub_100033EB0((uint64_t)v14);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for AdaptiveStackType.vertical(_:), v8);
  sub_10004EF60();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v11, v8);
  v21(v14, v8);
  uint64_t v22 = v29[0];
  sub_100038BBC(a2, v29[0], (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  uint64_t v23 = v31;
  uint64_t v24 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v31, v36, v34);
  unint64_t v25 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v26 = (v7 + *(unsigned __int8 *)(v4 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v27 = swift_allocObject();
  sub_1000384AC(v22, v27 + v25);
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v27 + v26, v23, v24);
  sub_100004F98(&qword_100062510);
  sub_10000566C(&qword_100062518, &qword_100062510);
  sub_10004EF50();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v37, v20, v33);
}

uint64_t sub_100033EB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for StandaloneSummaryView();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004EFB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v22 - v12;
  sub_10001DB8C((uint64_t)v22 - v12);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemSmall(_:), v7);
  sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v15 = v22[0];
  uint64_t v14 = v22[1];
  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
  sub_100038BBC(v2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  if (v14 != v15)
  {
    sub_100038C24((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
    goto LABEL_5;
  }
  char v17 = sub_100035E48();
  sub_100038C24((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  if (v17)
  {
LABEL_5:
    uint64_t v18 = (unsigned int *)&enum case for AdaptiveStackType.horizontal(_:);
    goto LABEL_6;
  }
  uint64_t v18 = (unsigned int *)&enum case for AdaptiveStackType.vertical(_:);
LABEL_6:
  uint64_t v19 = *v18;
  uint64_t v20 = sub_10004EF70();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(a1, v19, v20);
}

uint64_t sub_10003415C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v152 = a3;
  uint64_t v124 = sub_10004EF70();
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v121 = (uint64_t)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_100004F98(&qword_100061CC0);
  __chkstk_darwin(v115);
  uint64_t v135 = (char *)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_10004EFB0();
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v113 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v130 = (uint64_t)&v113 - v9;
  uint64_t v114 = type metadata accessor for StandaloneMetricsStack();
  __chkstk_darwin(v114);
  uint64_t v134 = (uint64_t *)((char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v120 = sub_100004F98(&qword_100062520);
  uint64_t v118 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v117 = (char *)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_100004F98(&qword_100062528);
  __chkstk_darwin(v140);
  uint64_t v116 = (char *)&v113 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v119 = (uint64_t)&v113 - v14;
  uint64_t v138 = sub_100004F98(&qword_100062530);
  __chkstk_darwin(v138);
  uint64_t v139 = (uint64_t)&v113 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = type metadata accessor for PauseRingsLabel();
  __chkstk_darwin(v127);
  uint64_t v128 = (uint64_t *)((char *)&v113 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v137 = sub_100004F98(&qword_100062538);
  __chkstk_darwin(v137);
  uint64_t v126 = (uint64_t)&v113 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v129 = (uint64_t)&v113 - v19;
  uint64_t v20 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v20 - 8);
  uint64_t v125 = (char *)&v113 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v141 = (uint64_t)&v113 - v23;
  uint64_t v144 = sub_10004E400();
  uint64_t v143 = *(void *)(v144 - 8);
  __chkstk_darwin(v144);
  uint64_t v142 = (char *)&v113 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100004F98(&qword_100062540);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v154 = v25;
  uint64_t v155 = v26;
  __chkstk_darwin(v25);
  uint64_t v136 = (char *)&v113 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100004F98(&qword_100062548);
  __chkstk_darwin(v28 - 8);
  uint64_t v153 = (char *)&v113 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v151 = (char *)&v113 - v31;
  uint64_t v147 = sub_10004E970();
  uint64_t v32 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v34 = (char *)&v113 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100004F98(&qword_100062550);
  __chkstk_darwin(v35 - 8);
  uint64_t v37 = (char *)&v113 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100004F98(&qword_100062558);
  __chkstk_darwin(v38);
  long long v40 = (char *)&v113 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_100004F98(&qword_100062560);
  long long v149 = *(void (***)(char *, uint64_t))(v146 - 8);
  __chkstk_darwin(v146);
  long long v42 = (char *)&v113 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_100004F98(&qword_100062568);
  __chkstk_darwin(v148);
  uint64_t v44 = (void (**)(char *, uint64_t))((char *)&v113 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v45);
  long long v47 = (char *)&v113 - v46;
  __chkstk_darwin(v48);
  uint64_t v145 = (char *)&v113 - v49;
  __chkstk_darwin(v50);
  uint64_t v150 = (char *)&v113 - v51;
  *(void *)uint64_t v37 = sub_10004E820();
  *((void *)v37 + 1) = 0;
  v37[16] = 0;
  long long v52 = &v37[*(int *)(sub_100004F98(&qword_100062570) + 44)];
  uint64_t v122 = a2;
  sub_1000353E4(a1, a2, v52);
  sub_10004EE50();
  sub_10003619C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v40, 0.0, 1, INFINITY, 0);
  sub_100005100((uint64_t)v37, &qword_100062550);
  sub_10004E950();
  unint64_t v53 = sub_100038944();
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v147);
  sub_100005100((uint64_t)v40, &qword_100062558);
  uint64_t v147 = type metadata accessor for StandaloneSummaryView();
  long long v54 = (uint64_t *)a1;
  *(void *)&long long v157 = sub_10004A568(*(id *)(a1 + *(int *)(v147 + 44) + 8));
  *((void *)&v157 + 1) = v55;
  sub_10000C56C();
  uint64_t v56 = sub_10004EBE0();
  uint64_t v58 = v57;
  LOBYTE(a1) = v59 & 1;
  *(void *)&long long v157 = v38;
  *((void *)&v157 + 1) = v53;
  swift_getOpaqueTypeConformance2();
  uint64_t v60 = v146;
  sub_10004EC50();
  uint64_t v61 = v56;
  uint64_t v62 = v152;
  sub_10000C5C0(v61, v58, a1);
  uint64_t v63 = (uint64_t)v151;
  swift_bridgeObjectRelease();
  long long v64 = v42;
  uint64_t v65 = (uint64_t)v150;
  v149[1](v64, v60);
  uint64_t v66 = (uint64_t)v145;
  sub_10004E610();
  uint64_t v67 = (uint64_t)v47;
  uint64_t v68 = (uint64_t)v153;
  sub_100005100(v67, &qword_100062568);
  sub_10000B630(v66, v65, &qword_100062568);
  BOOL v69 = sub_10003672C();
  uint64_t v70 = 1;
  uint64_t v71 = v154;
  uint64_t v72 = v155;
  if (v69) {
    goto LABEL_13;
  }
  long long v149 = v44;
  long long v73 = (int *)v147;
  uint64_t v74 = v141;
  sub_10000509C((uint64_t)v54 + *(int *)(v147 + 40), v141, (uint64_t *)&unk_100061980);
  uint64_t v75 = v143;
  uint64_t v76 = v144;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v143 + 48))(v74, 1, v144) != 1)
  {
    uint64_t v90 = v142;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 32))(v142, v74, v76);
    uint64_t v91 = (uint64_t)v125;
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v125, v90, v76);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v91, 0, 1, v76);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v93 = (uint64_t)v128;
    uint64_t *v128 = KeyPath;
    sub_100004F98(&qword_100061B88);
    swift_storeEnumTagMultiPayload();
    sub_10000B630(v91, v93 + *(int *)(v127 + 20), (uint64_t *)&unk_100061980);
    uint64_t v94 = v126;
    sub_100038BBC(v93, v126, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
    *(_WORD *)(v94 + *(int *)(v137 + 36)) = 256;
    sub_100038C24(v93, (uint64_t (*)(void))type metadata accessor for PauseRingsLabel);
    uint64_t v95 = v129;
    sub_10000B630(v94, v129, &qword_100062538);
    sub_10000509C(v95, v139, &qword_100062538);
    swift_storeEnumTagMultiPayload();
    sub_1000389E4();
    sub_100038A90();
    uint64_t v96 = (uint64_t)v136;
    sub_10004E920();
    sub_100005100(v95, &qword_100062538);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v142, v76);
LABEL_12:
    sub_10000B630(v96, v63, &qword_100062540);
    uint64_t v70 = 0;
    uint64_t v62 = v152;
    uint64_t v68 = (uint64_t)v153;
    uint64_t v71 = v154;
    uint64_t v72 = v155;
    uint64_t v44 = v149;
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56))(v63, v70, 1, v71);
    sub_10000509C(v65, (uint64_t)v44, &qword_100062568);
    sub_10000509C(v63, v68, &qword_100062548);
    sub_10000509C((uint64_t)v44, v62, &qword_100062568);
    uint64_t v111 = sub_100004F98(&qword_1000625A0);
    sub_10000509C(v68, v62 + *(int *)(v111 + 48), &qword_100062548);
    sub_100005100(v63, &qword_100062548);
    sub_100005100(v65, &qword_100062568);
    sub_100005100(v68, &qword_100062548);
    return sub_100005100((uint64_t)v44, &qword_100062568);
  }
  sub_100005100(v74, (uint64_t *)&unk_100061980);
  uint64_t v77 = v73[7];
  LODWORD(v148) = *((unsigned __int8 *)v54 + v73[6]);
  uint64_t v78 = *(void **)((char *)v54 + v77);
  uint64_t v79 = v73;
  LODWORD(v146) = *((unsigned __int8 *)v54 + v73[8]);
  id v80 = v78;
  LODWORD(v145) = sub_100035E48();
  uint64_t v81 = v130;
  uint64_t v82 = v54;
  sub_10001DB8C(v130);
  uint64_t v83 = v132;
  uint64_t v84 = v131;
  uint64_t v85 = v133;
  (*(void (**)(char *, void, uint64_t))(v132 + 104))(v131, enum case for WidgetFamily.systemMedium(_:), v133);
  sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v86 = v157;
  uint64_t v87 = v156;
  uint64_t v88 = *(void (**)(char *, uint64_t))(v83 + 8);
  v88(v84, v85);
  v88((char *)v81, v85);
  if (v86 != v87)
  {
    char v89 = 0;
    goto LABEL_8;
  }
  if (qword_1000611F8 != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    char v89 = *(unsigned char *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser) ^ 1;
LABEL_8:
    char v97 = v148;
    char v98 = v146;
    char v99 = (char)v145;
    long long v100 = *(void **)((char *)v82 + v79[9]);
    id v101 = v100;
    uint64_t v82 = v134;
    sub_10004662C(v97, v80, v98, (v99 & 1) == 0, v89 & 1, v100, v134);
    id v80 = v135;
    sub_100036964((uint64_t)v135);
    sub_10004E5F0();
    sub_100038D30(&qword_100061D10, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    if (sub_10004F0C0()) {
      break;
    }
    __break(1u);
LABEL_15:
    swift_once();
  }
  sub_100038D30(&qword_100062588, (void (*)(uint64_t))type metadata accessor for StandaloneMetricsStack);
  sub_10000566C(&qword_100061CD0, &qword_100061CC0);
  uint64_t v102 = v117;
  sub_10004EC70();
  sub_100005100((uint64_t)v80, &qword_100061CC0);
  sub_100038C24((uint64_t)v82, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
  sub_10004E5A0();
  uint64_t v103 = v121;
  sub_100033EB0(v121);
  int v104 = (*(uint64_t (**)(uint64_t, uint64_t))(v123 + 88))(v103, v124);
  if (v104 == enum case for AdaptiveStackType.horizontal(_:) || v104 == enum case for AdaptiveStackType.vertical(_:))
  {
    sub_10004EE50();
    sub_10004E590();
    uint64_t v105 = v118;
    uint64_t v106 = (uint64_t)v116;
    uint64_t v107 = v120;
    (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v116, v102, v120);
    uint64_t v108 = (_OWORD *)(v106 + *(int *)(v140 + 36));
    long long v109 = v158;
    *uint64_t v108 = v157;
    v108[1] = v109;
    v108[2] = v159;
    (*(void (**)(char *, uint64_t))(v105 + 8))(v102, v107);
    uint64_t v110 = v119;
    sub_10000B630(v106, v119, &qword_100062528);
    sub_10000509C(v110, v139, &qword_100062528);
    swift_storeEnumTagMultiPayload();
    sub_1000389E4();
    sub_100038A90();
    uint64_t v96 = (uint64_t)v136;
    sub_10004E920();
    sub_100005100(v110, &qword_100062528);
    uint64_t v65 = (uint64_t)v150;
    uint64_t v63 = (uint64_t)v151;
    goto LABEL_12;
  }
  uint64_t result = sub_10004F400();
  __break(1u);
  return result;
}

uint64_t sub_1000353E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v79[1] = a2;
  uint64_t v96 = a3;
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v4 - 8);
  uint64_t v83 = (uint64_t)v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v82 = (uint64_t)v79 - v7;
  uint64_t v8 = type metadata accessor for StandalonePhoneRingView(0);
  __chkstk_darwin(v8 - 8);
  uint64_t v87 = (void *)((char *)v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v88 = sub_100004F98(&qword_1000625A8);
  __chkstk_darwin(v88);
  uint64_t v86 = (uint64_t)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004F98(&qword_1000625B0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v93 = (char *)v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v85 = (char *)v79 - v15;
  __chkstk_darwin(v16);
  char v98 = (char *)v79 - v17;
  uint64_t v18 = sub_10004EFB0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)v79 - v23;
  uint64_t v25 = type metadata accessor for StandaloneSummaryView();
  __chkstk_darwin(v25);
  uint64_t v89 = (uint64_t)v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v81 = (uint64_t)v79 - v28;
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)v79 - v30;
  char v32 = sub_100035E48();
  uint64_t v97 = a1;
  sub_100038BBC(a1, (uint64_t)v31, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  uint64_t v91 = v21;
  uint64_t v92 = v19;
  uint64_t v94 = v12;
  uint64_t v95 = v11;
  uint64_t v90 = v24;
  uint64_t v80 = v18;
  if (v32)
  {
    sub_10001DB8C((uint64_t)v24);
    (*(void (**)(char *, void, uint64_t))(v19 + 104))(v21, enum case for WidgetFamily.systemSmall(_:), v18);
    sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v33 = v21;
    sub_10004F140();
    sub_10004F140();
    uint64_t v34 = v104;
    uint64_t v35 = v101;
    uint64_t v36 = *(void (**)(char *, uint64_t))(v19 + 8);
    v36(v33, v18);
    v36(v24, v18);
    sub_100038C24((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
    if (v34 == v35)
    {
      int v84 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    sub_100038C24((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  }
  int v84 = 1;
LABEL_6:
  uint64_t v37 = v87;
  uint64_t v38 = v97;
  uint64_t v39 = *(void **)(v97 + *(int *)(v25 + 36));
  uint64_t v40 = v97 + *(int *)(v25 + 40);
  uint64_t v41 = v82;
  sub_10000509C(v40, v82, (uint64_t *)&unk_100061980);
  uint64_t v42 = sub_10004E400();
  uint64_t v43 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48);
  char v44 = v43(v41, 1, v42) != 1;
  id v45 = v39;
  sub_100005100(v41, (uint64_t *)&unk_100061980);
  uint64_t v46 = v83;
  sub_10000509C(v40, v83, (uint64_t *)&unk_100061980);
  LOBYTE(v40) = v43(v46, 1, v42) == 1;
  sub_100005100(v46, (uint64_t *)&unk_100061980);
  sub_10002C918(v39, v44, v40, 0, v37);
  LOBYTE(v39) = sub_100035E48();
  uint64_t v47 = v81;
  sub_100038BBC(v38, v81, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  if (v39)
  {
    sub_100038C24(v47, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
    uint64_t v49 = v94;
    uint64_t v48 = v95;
    uint64_t v51 = (uint64_t)v90;
    uint64_t v50 = v91;
    uint64_t v52 = v80;
  }
  else
  {
    uint64_t v51 = (uint64_t)v90;
    sub_10001DB8C((uint64_t)v90);
    uint64_t v50 = v91;
    uint64_t v53 = v92;
    uint64_t v52 = v80;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v91, enum case for WidgetFamily.systemSmall(_:), v80);
    sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    uint64_t v54 = v104;
    uint64_t v55 = v101;
    uint64_t v56 = *(void (**)(char *, uint64_t))(v53 + 8);
    v56(v50, v52);
    v56((char *)v51, v52);
    sub_100038C24(v47, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
    uint64_t v49 = v94;
    uint64_t v48 = v95;
    if (v54 == v55) {
      goto LABEL_10;
    }
  }
  sub_10004E5A0();
LABEL_10:
  sub_10004EE50();
  sub_10004E590();
  uint64_t v57 = v86;
  sub_100038BBC((uint64_t)v37, v86, type metadata accessor for StandalonePhoneRingView);
  uint64_t v58 = (_OWORD *)(v57 + *(int *)(v88 + 36));
  long long v59 = v105;
  *uint64_t v58 = v104;
  v58[1] = v59;
  v58[2] = v106;
  sub_100038C24((uint64_t)v37, type metadata accessor for StandalonePhoneRingView);
  sub_100038C84();
  uint64_t v60 = v85;
  sub_10004EBF0();
  sub_100005100(v57, &qword_1000625A8);
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v98, v60, v48);
  uint64_t v61 = v97;
  char v62 = sub_100035E48();
  uint64_t v63 = v89;
  sub_100038BBC(v61, v89, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  if (v62)
  {
    sub_100038C24(v63, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
LABEL_14:
    uint64_t v99 = 0;
    __int16 v68 = 256;
    goto LABEL_15;
  }
  sub_10001DB8C(v51);
  uint64_t v64 = v92;
  (*(void (**)(char *, void, uint64_t))(v92 + 104))(v50, enum case for WidgetFamily.systemSmall(_:), v52);
  sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v65 = v101;
  uint64_t v66 = v99;
  uint64_t v67 = *(void (**)(char *, uint64_t))(v64 + 8);
  v67(v50, v52);
  v67((char *)v51, v52);
  sub_100038C24(v63, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  if (v65 != v66) {
    goto LABEL_14;
  }
  uint64_t v99 = 0;
  __int16 v68 = 1;
LABEL_15:
  __int16 v100 = v68;
  sub_10004E920();
  uint64_t v97 = v101;
  char v69 = v102;
  char v70 = v103;
  uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  uint64_t v72 = v93;
  long long v73 = v98;
  v71(v93, v98, v48);
  uint64_t v74 = v96;
  *uint64_t v96 = 0;
  *((unsigned char *)v74 + 8) = 0;
  *((unsigned char *)v74 + 9) = v84;
  uint64_t v75 = sub_100004F98(&qword_1000625C0);
  v71((char *)v74 + *(int *)(v75 + 48), v72, v48);
  uint64_t v76 = (char *)v74 + *(int *)(v75 + 64);
  *(void *)uint64_t v76 = v97;
  v76[8] = v69;
  v76[9] = v70;
  uint64_t v77 = *(void (**)(char *, uint64_t))(v49 + 8);
  v77(v73, v48);
  return ((uint64_t (*)(char *, uint64_t))v77)(v72, v48);
}

uint64_t sub_100035E48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004E5F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_10004EFB0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v25 - v14;
  if (*(unsigned char *)(v1 + *(int *)(type metadata accessor for StandaloneSummaryView() + 24)))
  {
    char v16 = 1;
  }
  else
  {
    uint64_t v26 = v5;
    uint64_t v27 = v3;
    uint64_t v28 = v2;
    sub_10001DB8C((uint64_t)v15);
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for WidgetFamily.systemSmall(_:), v9);
    sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    uint64_t v17 = v29;
    uint64_t v18 = v30;
    uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
    v19(v12, v9);
    v19(v15, v9);
    sub_10001DBC8((uint64_t)v8);
    if (v18 == v17)
    {
      char v16 = sub_10004E5E0();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v28);
    }
    else
    {
      uint64_t v21 = v26;
      uint64_t v20 = v27;
      uint64_t v22 = v28;
      (*(void (**)(char *, void, uint64_t))(v27 + 104))(v26, enum case for DynamicTypeSize.accessibility2(_:), v28);
      sub_100038D30(&qword_100061D78, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      char v16 = sub_10004F0B0() ^ 1;
      uint64_t v23 = *(void (**)(char *, uint64_t))(v20 + 8);
      v23(v21, v22);
      v23(v8, v22);
    }
  }
  return v16 & 1;
}

__n128 sub_10003619C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004F1D0();
    uint64_t v23 = (void *)sub_10004E9B0();
    sub_10004E4E0();
  }
  sub_10004E640();
  sub_10000509C(v13, a9, &qword_100062550);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100004F98(&qword_100062558) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  void v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_10003635C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v20 = a17;
  uint64_t v19 = a18;
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
    sub_10004F1D0();
    __n128 v29 = (void *)sub_10004E9B0();
    sub_10004E4E0();

    uint64_t v20 = a17;
    uint64_t v19 = a18;
  }
  sub_10004E640();
  *(_OWORD *)(a9 + 72) = v34;
  *(_OWORD *)(a9 + 88) = v35;
  *(_OWORD *)(a9 + 104) = v36;
  *(_OWORD *)(a9 + 120) = v37;
  *(_OWORD *)(a9 + 24) = v31;
  *(_OWORD *)(a9 + 40) = v32;
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v20;
  *(void *)(a9 + 16) = v19;
  *(_OWORD *)(a9 + 56) = v33;
  swift_retain();
  swift_retain();

  return swift_retain();
}

uint64_t sub_100036544@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004F1D0();
    uint64_t v23 = (void *)sub_10004E9B0();
    sub_10004E4E0();
  }
  sub_10004E640();
  long long v24 = v13[1];
  long long v37 = *v13;
  long long v38 = v24;
  sub_100038DB4((uint64_t)&v37, (uint64_t)v40);
  long long v26 = v13[1];
  long long v35 = v13[2];
  long long v25 = v35;
  *(_OWORD *)a9 = *v13;
  *(_OWORD *)(a9 + 16) = v26;
  *(_OWORD *)(a9 + 32) = v25;
  *(_OWORD *)(a9 + 152) = v34;
  *(_OWORD *)(a9 + 136) = v33;
  *(_OWORD *)(a9 + 120) = v32;
  *(_OWORD *)(a9 + 104) = v31;
  *(_OWORD *)(a9 + 56) = v28;
  uint64_t v39 = *((void *)&v38 + 1);
  char v36 = *((unsigned char *)v13 + 48);
  *(unsigned char *)(a9 + 48) = v36;
  *(_OWORD *)(a9 + 72) = v29;
  *(_OWORD *)(a9 + 88) = v30;
  sub_100038E10((uint64_t)v40);
  sub_10002C080((uint64_t)&v39);
  return sub_10002C4B4((uint64_t)&v35);
}

BOOL sub_10003672C()
{
  uint64_t v1 = sub_10004EFB0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v15 - v6;
  uint64_t v8 = type metadata accessor for StandaloneSummaryView();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = sub_100035E48();
  sub_100038BBC(v0, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  if (v11)
  {
    sub_10001DB8C((uint64_t)v7);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for WidgetFamily.systemSmall(_:), v1);
    sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10004F140();
    sub_10004F140();
    BOOL v12 = v15[1] == v15[0];
    uint64_t v13 = *(void (**)(char *, uint64_t))(v2 + 8);
    v13(v4, v1);
    v13(v7, v1);
  }
  else
  {
    BOOL v12 = 0;
  }
  sub_100038C24((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  return v12;
}

uint64_t sub_100036964@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004EFB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v17 - v7;
  sub_10001DB8C((uint64_t)v17 - v7);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for WidgetFamily.systemSmall(_:), v2);
  sub_100038D30((unint64_t *)&qword_100061398, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004F140();
  sub_10004F140();
  uint64_t v10 = v17[0];
  uint64_t v9 = v17[1];
  char v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v5, v2);
  v11(v8, v2);
  char v12 = sub_100035E48();
  uint64_t v13 = sub_10004E5F0();
  uint64_t v14 = (unsigned int *)&enum case for DynamicTypeSize.accessibility5(_:);
  if ((v12 & 1) == 0) {
    uint64_t v14 = (unsigned int *)&enum case for DynamicTypeSize.large(_:);
  }
  uint64_t v15 = (unsigned int *)&enum case for DynamicTypeSize.accessibility1(_:);
  if ((v12 & 1) == 0) {
    uint64_t v15 = (unsigned int *)&enum case for DynamicTypeSize.xxLarge(_:);
  }
  if (v9 != v10) {
    uint64_t v14 = v15;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(a1, *v14, v13);
}

uint64_t sub_100036B84@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_100038BBC(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for StandaloneSummaryView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000384AC((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_100038510;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

void *sub_100036C8C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    char v11 = (void *)((char *)a2 + v9);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    uint64_t v14 = *(void **)((char *)a2 + v13);
    *(void *)((char *)a1 + v13) = v14;
    uint64_t v15 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    char v16 = *(void **)((char *)a2 + v15);
    *(void *)((char *)a1 + v15) = v16;
    uint64_t v17 = a3[10];
    __dst = (char *)a1 + v17;
    uint64_t v18 = (char *)a2 + v17;
    uint64_t v19 = sub_10004E400();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    id v22 = v14;
    id v23 = v16;
    if (v21(v18, 1, v19))
    {
      uint64_t v24 = sub_100004F98((uint64_t *)&unk_100061980);
      memcpy(__dst, v18, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(__dst, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    uint64_t v25 = a3[11];
    long long v26 = (void *)((char *)a1 + v25);
    long long v27 = (char *)a2 + v25;
    long long v28 = *(void **)v27;
    long long v29 = (void *)*((void *)v27 + 1);
    void *v26 = *(void *)v27;
    v26[1] = v29;
    uint64_t v30 = *((void *)v27 + 3);
    v26[2] = *((void *)v27 + 2);
    v26[3] = v30;
    id v31 = v28;
    id v32 = v29;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100036F90(uint64_t a1, int *a2)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  uint64_t v7 = a1 + a2[10];
  uint64_t v8 = sub_10004E400();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = (id *)(a1 + a2[11]);

  return swift_bridgeObjectRelease();
}

void *sub_100037154(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004E5F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v12 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v12;
  uint64_t v13 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  uint64_t v14 = *(void **)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = v14;
  uint64_t v15 = a3[10];
  __dst = (char *)a1 + v15;
  char v16 = (char *)a2 + v15;
  uint64_t v17 = sub_10004E400();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  id v20 = v12;
  id v21 = v14;
  if (v19(v16, 1, v17))
  {
    uint64_t v22 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(__dst, v16, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(__dst, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
  }
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (char *)a2 + v23;
  long long v26 = *(void **)v25;
  long long v27 = (void *)*((void *)v25 + 1);
  *uint64_t v24 = *(void *)v25;
  v24[1] = v27;
  uint64_t v28 = *((void *)v25 + 3);
  void v24[2] = *((void *)v25 + 2);
  v24[3] = v28;
  id v29 = v26;
  id v30 = v27;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100037408(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005100((uint64_t)a1 + v7, &qword_100061B90);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = *(void **)((char *)a2 + v11);
  uint64_t v13 = *(void **)((char *)a1 + v11);
  *(void *)((char *)a1 + v11) = v12;
  id v14 = v12;

  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  uint64_t v15 = a3[9];
  char v16 = *(void **)((char *)a1 + v15);
  uint64_t v17 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  id v18 = v17;

  uint64_t v19 = a3[10];
  id v20 = (char *)a1 + v19;
  id v21 = (char *)a2 + v19;
  uint64_t v22 = sub_10004E400();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_14;
  }
  if (v26)
  {
LABEL_14:
    uint64_t v27 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
LABEL_15:
  uint64_t v28 = a3[11];
  id v29 = (char *)a1 + v28;
  id v30 = (char *)a2 + v28;
  id v31 = *(void **)v30;
  id v32 = *(void **)v29;
  *(void *)id v29 = *(void *)v30;
  id v33 = v31;

  long long v34 = (void *)*((void *)v29 + 1);
  long long v35 = (void *)*((void *)v30 + 1);
  *((void *)v29 + 1) = v35;
  id v36 = v35;

  *((void *)v29 + 2) = *((void *)v30 + 2);
  *((void *)v29 + 3) = *((void *)v30 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_100037770(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004EFB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004E5F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  uint64_t v14 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v15 = a3[10];
  char v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = sub_10004E400();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v21 = a3[11];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  long long v24 = *((_OWORD *)v23 + 1);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *((_OWORD *)v22 + 1) = v24;
  return a1;
}

char *sub_1000379FC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B88);
    uint64_t v6 = sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004EFB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005100((uint64_t)&a1[v8], &qword_100061B90);
    uint64_t v11 = sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004E5F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  uint64_t v15 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  char v16 = *(void **)&a1[v15];
  *(void *)&a1[v15] = *(void *)&a2[v15];

  uint64_t v17 = a3[10];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = sub_10004E400();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_13;
  }
  if (v24)
  {
LABEL_13:
    uint64_t v25 = sub_100004F98((uint64_t *)&unk_100061980);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
LABEL_14:
  uint64_t v26 = a3[11];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  id v29 = *(void **)&a1[v26];
  *(void *)&a1[v26] = *(void *)v28;

  id v30 = (void *)*((void *)v27 + 1);
  *((void *)v27 + 1) = *((void *)v28 + 1);

  uint64_t v31 = *((void *)v28 + 3);
  *((void *)v27 + 2) = *((void *)v28 + 2);
  *((void *)v27 + 3) = v31;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100037D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100037D60);
}

uint64_t sub_100037D60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061BA0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[7]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
    char v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[10];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_100037EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100037F00);
}

uint64_t sub_100037F00(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004F98(&qword_100061B98);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100004F98(&qword_100061BA0);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[7]) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = sub_100004F98((uint64_t *)&unk_100061980);
    char v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[10];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_10003808C()
{
  sub_10001A9B4(319, &qword_100061C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_10001A9B4(319, (unint64_t *)&unk_100061C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F)
    {
      sub_10001A9B4(319, (unint64_t *)&qword_100061720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_10003824C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100038268()
{
  unint64_t v1 = (int *)type metadata accessor for StandaloneSummaryView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  uint64_t v9 = v5 + v1[10];
  uint64_t v10 = sub_10004E400();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = (id *)(v5 + v1[11]);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000384AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandaloneSummaryView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for StandaloneSummaryView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100033A68(a1, v6, a2);
}

uint64_t sub_100038590()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for StandaloneSummaryView();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = sub_10004E5B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = v1 + v4;
  sub_100004F98(&qword_100061B88);
  uint64_t v21 = v5;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v1 + v4, v11);
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = v10 + v2[5];
  sub_100004F98(&qword_100061B90);
  uint64_t v22 = v6;
  uint64_t v20 = v1;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }

  uint64_t v14 = v10 + v2[10];
  uint64_t v15 = sub_10004E400();
  uint64_t v16 = *(void *)(v15 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  uint64_t v17 = (v4 + v21 + v8) & ~v8;
  uint64_t v18 = (id *)(v10 + v2[11]);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v20 + v17, v22);

  return _swift_deallocObject(v20, v17 + v9, v3 | v8 | 7);
}

uint64_t sub_100038870@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for StandaloneSummaryView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_10004E5B0() - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_10003415C(v1 + v4, v7, a1);
}

unint64_t sub_100038944()
{
  unint64_t result = qword_100062578;
  if (!qword_100062578)
  {
    sub_1000053B0(&qword_100062558);
    sub_10000566C(&qword_100062580, &qword_100062550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062578);
  }
  return result;
}

unint64_t sub_1000389E4()
{
  unint64_t result = qword_100062590;
  if (!qword_100062590)
  {
    sub_1000053B0(&qword_100062538);
    sub_100038D30(&qword_100061D58, (void (*)(uint64_t))type metadata accessor for PauseRingsLabel);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062590);
  }
  return result;
}

unint64_t sub_100038A90()
{
  unint64_t result = qword_100062598;
  if (!qword_100062598)
  {
    sub_1000053B0(&qword_100062528);
    type metadata accessor for StandaloneMetricsStack();
    sub_1000053B0(&qword_100061CC0);
    sub_100038D30(&qword_100062588, (void (*)(uint64_t))type metadata accessor for StandaloneMetricsStack);
    sub_10000566C(&qword_100061CD0, &qword_100061CC0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062598);
  }
  return result;
}

uint64_t sub_100038BBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100038C24(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100038C84()
{
  unint64_t result = qword_1000625B8;
  if (!qword_1000625B8)
  {
    sub_1000053B0(&qword_1000625A8);
    sub_100038D30(&qword_100061B60, (void (*)(uint64_t))type metadata accessor for StandalonePhoneRingView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000625B8);
  }
  return result;
}

uint64_t sub_100038D30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100038D78()
{
  return sub_10000566C(&qword_1000625C8, &qword_1000625D0);
}

uint64_t sub_100038DB4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100038E10(uint64_t a1)
{
  return a1;
}

id sub_100038E44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v180 = sub_10004E660();
  uint64_t v179 = *(void *)(v180 - 8);
  __chkstk_darwin(v180);
  uint64_t v178 = (char *)&v166 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v185 = sub_10004EBB0();
  uint64_t v189 = *(void *)(v185 - 8);
  __chkstk_darwin(v185);
  uint64_t v184 = (char *)&v166 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = sub_100004F98(&qword_1000625D8);
  __chkstk_darwin(v187);
  uint64_t v5 = (void (**)(char *, uint64_t))((char *)&v166 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_100004F98(&qword_1000625E0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v166 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10004E970();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v166 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = sub_100004F98(&qword_1000625E8);
  v176 = *(void (***)(char *, uint64_t))(v188 - 8);
  __chkstk_darwin(v188);
  uint64_t v14 = (char *)&v166 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = sub_100004F98(&qword_1000625F0);
  __chkstk_darwin(v186);
  uint64_t v175 = (void (*)(char *, uint64_t))((char *)&v166 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v16);
  v177 = (char *)&v166 - v17;
  id result = [self sharedBehavior];
  if (result)
  {
    uint64_t v19 = result;
    unsigned int v20 = [result isStandalonePhoneFitnessMode];

    uint64_t v183 = a1;
    v182 = v8;
    uint64_t v181 = v6;
    if (v20)
    {
      uint64_t v21 = sub_10004E820();
      sub_100039F1C((uint64_t)v190, (uint64_t *)&v191);
      uint64_t v22 = *(void *)&v192[16];
      char v23 = v193;
      uint64_t v24 = *((void *)&v193 + 1);
      long long v25 = *(_OWORD *)v192;
      long long v26 = v191;
      long long v191 = (unint64_t)v21;
      v192[0] = 0;
      *(_OWORD *)&v192[8] = v26;
      long long v193 = v25;
      uint64_t v194 = v22;
      char v195 = v23;
      uint64_t v196 = v24;
      sub_10004E950();
      uint64_t v27 = sub_100004F98(&qword_100062600);
      unint64_t v28 = sub_10003B86C();
      sub_10004EC90();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      uint64_t v29 = *((void *)&v193 + 1);
      uint64_t v30 = v194;
      char v31 = v195;
      swift_release();
      swift_release();
      swift_release();
      sub_10000C5C0(v29, v30, v31);
      swift_bridgeObjectRelease();
      *(void *)&long long v191 = sub_10003A584();
      *((void *)&v191 + 1) = v32;
      sub_10000C56C();
      uint64_t v33 = sub_10004EBE0();
      uint64_t v35 = v34;
      char v37 = v36 & 1;
      *(void *)&long long v191 = v27;
      *((void *)&v191 + 1) = v28;
      swift_getOpaqueTypeConformance2();
      uint64_t v38 = (uint64_t)v175;
      uint64_t v39 = v188;
      sub_10004EC50();
      sub_10000C5C0(v33, v35, v37);
      swift_bridgeObjectRelease();
      v176[1](v14, v39);
      uint64_t v40 = &qword_1000625F0;
      uint64_t v41 = (uint64_t)v177;
      sub_10000B630(v38, (uint64_t)v177, &qword_1000625F0);
      sub_10000509C(v41, (uint64_t)v182, &qword_1000625F0);
      swift_storeEnumTagMultiPayload();
      sub_10003B7BC();
      sub_10003B8C8();
      sub_10004E920();
      uint64_t v42 = v41;
    }
    else
    {
      uint64_t v43 = (void *)v190[3];
      uint64_t v44 = v190[5];
      uint64_t v45 = v190[6];
      v177 = (char *)v190[4];
      uint64_t v174 = v44;
      uint64_t v173 = v45;
      sub_10004A1B4(v43, v177, v44, v45);
      *(void *)&long long v191 = v46;
      *((void *)&v191 + 1) = v47;
      unint64_t v48 = sub_10000C56C();
      uint64_t v49 = sub_10004EBE0();
      uint64_t v51 = v50;
      char v53 = v52;
      if (qword_1000611C0 != -1) {
        swift_once();
      }
      v176 = v5;
      uint64_t v54 = sub_10004EB90();
      uint64_t v167 = v55;
      LODWORD(v171) = v56;
      uint64_t v168 = v57;
      sub_10000C5C0(v49, v51, v53 & 1);
      swift_bridgeObjectRelease();
      *(void *)&long long v191 = sub_10004B0E4(v43, v177);
      *((void *)&v191 + 1) = v58;
      uint64_t v59 = sub_10004F2B0();
      uint64_t v61 = v60;
      swift_bridgeObjectRelease();
      *(void *)&long long v191 = v59;
      *((void *)&v191 + 1) = v61;
      uint64_t v62 = sub_10004EBE0();
      uint64_t v64 = v63;
      char v66 = v65;
      uint64_t v188 = v48;
      uint64_t v172 = v43;
      if (qword_1000611B8 != -1) {
        swift_once();
      }
      uint64_t v67 = sub_10004EB90();
      uint64_t v69 = v68;
      char v71 = v70 & 1;
      sub_10000C5C0(v62, v64, v66 & 1);
      swift_bridgeObjectRelease();
      uint64_t v72 = v184;
      sub_10004EBA0();
      uint64_t v73 = sub_10004EBC0();
      uint64_t v75 = v74;
      char v77 = v76 & 1;
      sub_10000C5C0(v67, v69, v71);
      swift_bridgeObjectRelease();
      uint64_t v78 = *(void (**)(char *, uint64_t))(v189 + 8);
      v189 += 8;
      uint64_t v175 = v78;
      v78(v72, v185);
      char v79 = v171 & 1;
      uint64_t v80 = v167;
      uint64_t v170 = sub_10004EB80();
      uint64_t v169 = v81;
      uint64_t v171 = v82;
      LOBYTE(v67) = v83 & 1;
      sub_10000C5C0(v73, v75, v77);
      swift_bridgeObjectRelease();
      sub_10000C5C0(v54, v80, v79);
      swift_bridgeObjectRelease();
      int v84 = self;
      id v85 = [v84 mainBundle];
      NSString v86 = sub_10004F0D0();
      NSString v87 = sub_10004F0D0();
      id v88 = [v85 localizedStringForKey:v86 value:0 table:v87];

      uint64_t v89 = sub_10004F0F0();
      uint64_t v91 = v90;

      id v92 = sub_10004A308(v172, v177, v174, v173);
      uint64_t v94 = v93;
      *(void *)&long long v191 = v89;
      *((void *)&v191 + 1) = v91;
      swift_bridgeObjectRetain();
      v199._countAndFlagsBits = (uint64_t)v92;
      v199._object = v94;
      sub_10004F120(v199);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v95 = sub_10004EBE0();
      uint64_t v97 = v96;
      LOBYTE(v94) = v98 & 1;
      uint64_t v99 = sub_10004EB90();
      uint64_t v101 = v100;
      char v103 = v102 & 1;
      sub_10000C5C0(v95, v97, (char)v94);
      swift_bridgeObjectRelease();
      uint64_t v104 = v170;
      uint64_t v105 = v169;
      uint64_t v174 = sub_10004EB80();
      uint64_t v173 = v106;
      v177 = v107;
      LODWORD(v172) = v108 & 1;
      sub_10000C5C0(v99, v101, v103);
      swift_bridgeObjectRelease();
      sub_10000C5C0(v104, v105, v67);
      swift_bridgeObjectRelease();
      id v109 = [v84 mainBundle];
      NSString v110 = sub_10004F0D0();
      NSString v111 = sub_10004F0D0();
      id v112 = [v109 localizedStringForKey:v110 value:0 table:v111];

      uint64_t v113 = sub_10004F0F0();
      uint64_t v115 = v114;

      *(void *)&long long v191 = v113;
      *((void *)&v191 + 1) = v115;
      uint64_t v116 = sub_10004F2B0();
      uint64_t v118 = v117;
      swift_bridgeObjectRelease();
      *(void *)&long long v191 = v116;
      *((void *)&v191 + 1) = v118;
      uint64_t v119 = sub_10004EBE0();
      uint64_t v121 = v120;
      LOBYTE(v112) = v122 & 1;
      uint64_t v123 = sub_10004EB90();
      uint64_t v125 = v124;
      LOBYTE(v101) = v126 & 1;
      sub_10000C5C0(v119, v121, (char)v112);
      swift_bridgeObjectRelease();
      uint64_t v127 = v184;
      sub_10004EBA0();
      uint64_t v128 = sub_10004EBC0();
      uint64_t v130 = v129;
      LOBYTE(v119) = v131 & 1;
      sub_10000C5C0(v123, v125, v101);
      swift_bridgeObjectRelease();
      v175(v127, v185);
      uint64_t v132 = v174;
      uint64_t v133 = v173;
      LOBYTE(v99) = (_BYTE)v172;
      uint64_t v134 = sub_10004EB80();
      uint64_t v185 = v135;
      uint64_t v189 = v136;
      LODWORD(v184) = v137 & 1;
      sub_10000C5C0(v128, v130, v119);
      swift_bridgeObjectRelease();
      sub_10000C5C0(v132, v133, v99);
      swift_bridgeObjectRelease();
      *(void *)&long long v191 = sub_10003A7A8();
      *((void *)&v191 + 1) = v138;
      uint64_t v139 = sub_10004EBE0();
      uint64_t v141 = v140;
      LOBYTE(v130) = v142 & 1;
      uint64_t v143 = sub_10004EB90();
      uint64_t v145 = v144;
      LOBYTE(v127) = v146 & 1;
      sub_10000C5C0(v139, v141, v130);
      swift_bridgeObjectRelease();
      uint64_t v147 = v185;
      LOBYTE(v141) = (_BYTE)v184;
      uint64_t v175 = (void (*)(char *, uint64_t))sub_10004EB80();
      uint64_t v149 = v148;
      v177 = v150;
      LOBYTE(v139) = v151 & 1;
      sub_10000C5C0(v143, v145, (char)v127);
      swift_bridgeObjectRelease();
      sub_10000C5C0(v134, v147, v141);
      swift_bridgeObjectRelease();
      uint64_t v152 = v178;
      sub_10004E650();
      uint64_t v153 = (uint64_t)v175;
      uint64_t v154 = sub_10004EB70();
      uint64_t v156 = v155;
      uint64_t v158 = v157;
      LOBYTE(v105) = v159 & 1;
      sub_10000C5C0(v153, v149, v139);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v179 + 8))(v152, v180);
      *(void *)&long long v191 = v154;
      *((void *)&v191 + 1) = v156;
      v192[0] = v105;
      *(void *)&v192[8] = v158;
      uint64_t v197 = sub_10003AA1C();
      uint64_t v198 = v160;
      uint64_t v161 = sub_10004EBE0();
      uint64_t v163 = v162;
      LOBYTE(v152) = v164 & 1;
      uint64_t v165 = (uint64_t)v176;
      sub_10004EC50();
      sub_10000C5C0(v161, v163, (char)v152);
      swift_bridgeObjectRelease();
      sub_10000C5C0(v154, v156, v105);
      swift_bridgeObjectRelease();
      uint64_t v40 = &qword_1000625D8;
      sub_10000509C(v165, (uint64_t)v182, &qword_1000625D8);
      swift_storeEnumTagMultiPayload();
      sub_10003B7BC();
      sub_10003B8C8();
      sub_10004E920();
      uint64_t v42 = v165;
    }
    return (id)sub_100005100(v42, v40);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100039F1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v3 = sub_10004E660();
  uint64_t v69 = *(void *)(v3 - 8);
  uint64_t v70 = v3;
  __chkstk_darwin(v3);
  uint64_t v68 = &v58[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_10004EBB0();
  uint64_t v64 = *(void *)(v5 - 8);
  uint64_t v65 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = &v58[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v71 = sub_10004ED40();
  sub_10004EA40();
  sub_10004EA60();
  uint64_t v67 = sub_10004EAA0();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v72 = sub_10003A3F0();
  uint64_t v73 = v8;
  sub_10000C56C();
  uint64_t v9 = sub_10004EBE0();
  uint64_t v11 = v10;
  char v13 = v12;
  if (qword_1000611C0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10004EB90();
  uint64_t v60 = v15;
  uint64_t v61 = v14;
  char v17 = v16;
  uint64_t v62 = v18;
  sub_10000C5C0(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  uint64_t v72 = (uint64_t)sub_10004B0E4(*(id *)(a1 + 24), *(id *)(a1 + 32));
  uint64_t v73 = v19;
  uint64_t v20 = sub_10004F2B0();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t v72 = v20;
  uint64_t v73 = v22;
  uint64_t v23 = sub_10004EBE0();
  uint64_t v25 = v24;
  char v27 = v26;
  if (qword_1000611B8 != -1) {
    swift_once();
  }
  int v59 = v17 & 1;
  uint64_t v28 = sub_10004EB90();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_10000C5C0(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  sub_10004EBA0();
  uint64_t v33 = sub_10004EBC0();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_10000C5C0(v28, v30, v32);
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v64 + 8))(v7, v65);
  uint64_t v39 = v60;
  uint64_t v38 = v61;
  char v40 = v59;
  uint64_t v64 = sub_10004EB80();
  uint64_t v65 = v41;
  uint64_t v43 = v42;
  LOBYTE(v30) = v44 & 1;
  sub_10000C5C0(v33, v35, v37);
  swift_bridgeObjectRelease();
  sub_10000C5C0(v38, v39, v40);
  swift_bridgeObjectRelease();
  uint64_t v45 = v68;
  sub_10004E650();
  uint64_t v46 = v64;
  uint64_t v47 = sub_10004EB70();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  char v53 = v52 & 1;
  sub_10000C5C0(v46, v43, v30);
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v45, v70);
  uint64_t v54 = v63;
  uint64_t v56 = KeyPath;
  uint64_t v55 = v67;
  *uint64_t v63 = v71;
  v54[1] = v56;
  v54[2] = v55;
  v54[3] = v47;
  v54[4] = v49;
  *((unsigned char *)v54 + 40) = v53;
  v54[6] = v51;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100010F70(v47, v49, v53);
  swift_bridgeObjectRetain();
  sub_10000C5C0(v47, v49, v53);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003A3F0()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10004A1B4(v1, v2, v3, v4);
  uint64_t v6 = v5;
  id v7 = [self mainBundle];
  NSString v8 = sub_10004F0D0();
  NSString v9 = sub_10004F0D0();
  id v10 = [v7 localizedStringForKey:v8 value:0 table:v9];

  uint64_t v11 = sub_10004F0F0();
  char v13 = v12;

  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = v11;
  v19._object = v13;
  sub_10004F120(v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004A1C8(v1, v2, v3, v4);
  uint64_t v15 = v14;
  char v17 = v16;
  swift_bridgeObjectRetain();
  v20._countAndFlagsBits = v15;
  v20._object = v17;
  sub_10004F120(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10003A584()
{
  sub_10000B630(v0 + 16, (uint64_t)v15, (uint64_t *)&unk_100061990);
  sub_10000B630((uint64_t)v15, (uint64_t)&v16, (uint64_t *)&unk_100061990);
  if (v16 && [v16 paused])
  {
    id v1 = [self mainBundle];
    NSString v2 = sub_10004F0D0();
    NSString v3 = sub_10004F0D0();
    id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

    uint64_t v5 = sub_10004F0F0();
  }
  else
  {
    id v6 = [self mainBundle];
    NSString v7 = sub_10004F0D0();
    NSString v8 = sub_10004F0D0();
    id v9 = [v6 localizedStringForKey:v7 value:0 table:v8];

    uint64_t v5 = sub_10004F0F0();
    sub_10004AA6C(*(id *)(v0 + 32));
    uint64_t v11 = v10;
    char v13 = v12;
    swift_bridgeObjectRetain();
    v17._countAndFlagsBits = v11;
    v17._object = v13;
    sub_10004F120(v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_10003A7A8()
{
  id v1 = self;
  id v2 = [v1 mainBundle];
  NSString v3 = sub_10004F0D0();
  NSString v4 = sub_10004F0D0();
  id v5 = [v2 localizedStringForKey:v3 value:0 table:v4];

  uint64_t v6 = sub_10004F0F0();
  NSString v7 = (void *)v0[3];
  NSString v8 = (void *)v0[4];
  uint64_t v9 = v0[5];
  uint64_t v10 = v0[6];
  id v11 = sub_10004A31C(v7, v8, v9, v10);
  char v13 = v12;
  swift_bridgeObjectRetain();
  v25._countAndFlagsBits = (uint64_t)v11;
  v25._object = v13;
  sub_10004F120(v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v14 = [v1 mainBundle];
  NSString v15 = sub_10004F0D0();
  NSString v16 = sub_10004F0D0();
  id v17 = [v14 localizedStringForKey:v15 value:0 table:v16];

  uint64_t v18 = sub_10004F0F0();
  Swift::String v20 = v19;

  swift_bridgeObjectRetain();
  v26._countAndFlagsBits = v18;
  v26._object = v20;
  sub_10004F120(v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v21 = sub_10004A330(v7, v8, v9, v10);
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  v27._countAndFlagsBits = (uint64_t)v21;
  v27._object = v23;
  sub_10004F120(v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10003AA1C()
{
  uint64_t v1 = v0;
  sub_10000B630(v0 + 16, (uint64_t)v41, (uint64_t *)&unk_100061990);
  sub_10000B630((uint64_t)v41, (uint64_t)&v42, (uint64_t *)&unk_100061990);
  if (v42 && [v42 paused])
  {
    id v2 = [self mainBundle];
    NSString v3 = sub_10004F0D0();
    NSString v4 = sub_10004F0D0();
    id v5 = [v2 localizedStringForKey:v3 value:0 table:v4];

    uint64_t v6 = sub_10004F0F0();
  }
  else
  {
    NSString v7 = self;
    id v8 = [v7 mainBundle];
    NSString v9 = sub_10004F0D0();
    NSString v10 = sub_10004F0D0();
    id v11 = [v8 localizedStringForKey:v9 value:0 table:v10];

    uint64_t v12 = sub_10004F0F0();
    char v13 = *(void **)(v1 + 32);
    sub_10004B82C(v13);
    uint64_t v15 = v14;
    id v17 = v16;
    swift_bridgeObjectRetain();
    v43._countAndFlagsBits = v15;
    v43._object = v17;
    sub_10004F120(v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v12;
    id v19 = [v7 mainBundle];
    NSString v20 = sub_10004F0D0();
    NSString v21 = sub_10004F0D0();
    id v22 = [v19 localizedStringForKey:v20 value:0 table:v21];

    uint64_t v23 = sub_10004F0F0();
    Swift::String v25 = v24;

    swift_bridgeObjectRetain();
    v44._countAndFlagsBits = v23;
    v44._object = v25;
    sub_10004F120(v44);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10004BCF8(v13);
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    swift_bridgeObjectRetain();
    v45._countAndFlagsBits = v27;
    v45._object = v29;
    sub_10004F120(v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v30 = [v7 mainBundle];
    NSString v31 = sub_10004F0D0();
    NSString v32 = sub_10004F0D0();
    id v33 = [v30 localizedStringForKey:v31 value:0 table:v32];

    uint64_t v34 = sub_10004F0F0();
    char v36 = v35;

    swift_bridgeObjectRetain();
    v46._countAndFlagsBits = v34;
    v46._object = v36;
    sub_10004F120(v46);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v37 = sub_10004B4E8(v13);
    uint64_t v39 = v38;
    swift_bridgeObjectRetain();
    v47._countAndFlagsBits = v37;
    v47._object = v39;
    sub_10004F120(v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v18;
  }
  return v6;
}

id sub_10003AE9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100038E44(a1);
}

uint64_t sub_10003AEE0()
{
  uint64_t v0 = sub_100004F98(&qword_100061480);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004EAE0();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  NSString v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for Font.TextStyle.body(_:), v3, v5);
  uint64_t v8 = enum case for Font.Design.rounded(_:);
  uint64_t v9 = sub_10004EA50();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v2, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v9);
  uint64_t v11 = sub_10004EA90();
  sub_100005100((uint64_t)v2, &qword_100061480);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  qword_1000648E0 = v11;
  return result;
}

uint64_t sub_10003B0CC()
{
  uint64_t v0 = sub_100004F98(&qword_100061480);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004EAE0();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  NSString v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for Font.TextStyle.body(_:), v3, v5);
  uint64_t v8 = enum case for Font.Design.rounded(_:);
  uint64_t v9 = sub_10004EA50();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v2, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v9);
  sub_10004EA90();
  sub_100005100((uint64_t)v2, &qword_100061480);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  uint64_t v11 = sub_10004EAB0();
  uint64_t result = swift_release();
  qword_1000648E8 = v11;
  return result;
}

void sub_10003B2D4(void *a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  NSString v7 = self;
  id v8 = [v7 mainBundle];
  NSString v9 = sub_10004F0D0();
  NSString v10 = sub_10004F0D0();
  id v11 = [v8 localizedStringForKey:v9 value:0 table:v10];

  uint64_t v12 = sub_10004F0F0();
  uint64_t v14 = v13;

  id v15 = a3;
  id v16 = a1;
  id v17 = [v7 mainBundle];
  NSString v18 = sub_10004F0D0();
  NSString v19 = sub_10004F0D0();
  id v20 = [v17 localizedStringForKey:v18 value:0 table:v19];

  uint64_t v21 = sub_10004F0F0();
  uint64_t v23 = v22;

  *(void *)a4 = v16;
  *(unsigned char *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  *(void *)(a4 + 24) = v16;
  *(void *)(a4 + 32) = a3;
  *(void *)(a4 + 40) = v21;
  *(void *)(a4 + 48) = v23;
  *(void *)(a4 + 56) = v12;
  *(void *)(a4 + 64) = v14;
}

uint64_t destroy for InlineView(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InlineView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  __n128 v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  NSString v7 = *(void **)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v6;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  id v12 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InlineView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  __n128 v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  NSString v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v8;
  id v9 = v8;

  id v10 = *(void **)(a2 + 24);
  id v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v14;
  id v15 = v14;

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

__n128 initializeWithTake for InlineView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for InlineView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  __n128 v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InlineView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InlineView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InlineView()
{
  return &type metadata for InlineView;
}

uint64_t sub_10003B7A0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10003B7BC()
{
  unint64_t result = qword_1000625F8;
  if (!qword_1000625F8)
  {
    sub_1000053B0(&qword_1000625F0);
    sub_1000053B0(&qword_100062600);
    sub_10003B86C();
    swift_getOpaqueTypeConformance2();
    sub_10002C3F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000625F8);
  }
  return result;
}

unint64_t sub_10003B86C()
{
  unint64_t result = qword_100062608;
  if (!qword_100062608)
  {
    sub_1000053B0(&qword_100062600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062608);
  }
  return result;
}

unint64_t sub_10003B8C8()
{
  unint64_t result = qword_100062610;
  if (!qword_100062610)
  {
    sub_1000053B0(&qword_1000625D8);
    sub_10002C3F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062610);
  }
  return result;
}

unint64_t sub_10003B950()
{
  unint64_t result = qword_100062618;
  if (!qword_100062618)
  {
    sub_1000053B0(&qword_100062620);
    sub_10003B7BC();
    sub_10003B8C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062618);
  }
  return result;
}

void *sub_10003B9CC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E8B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    id v11 = *(void **)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v11;
    id v12 = *(void **)((char *)a2 + v10);
    *(void *)((char *)a1 + v10) = v12;
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    id v13 = v11;
    id v14 = v12;
  }
  return a1;
}

void sub_10003BB04(uint64_t a1, uint64_t a2)
{
  sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004E8B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

void *sub_10003BBB0(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E8B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  uint64_t v10 = *(void **)((char *)a2 + v8);
  *(void *)((char *)a1 + v8) = v10;
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  id v11 = v9;
  id v12 = v10;
  return a1;
}

void *sub_10003BC98(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D50);
    sub_100004F98(&qword_100061D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004E8B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)((char *)a1 + v7);
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  id v10 = v9;

  uint64_t v11 = a3[6];
  id v12 = *(void **)((char *)a1 + v11);
  id v13 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v13;
  id v14 = v13;

  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

char *sub_10003BDAC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004E8B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_10003BE94(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D50);
    uint64_t v6 = sub_100004F98(&qword_100061D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E8B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  uint64_t v10 = a3[6];
  uint64_t v11 = *(void **)&a1[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];

  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_10003BFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003BFBC);
}

uint64_t sub_10003BFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004F98(&qword_100062648);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
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

uint64_t sub_10003C08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003C0A0);
}

uint64_t sub_10003C0A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004F98(&qword_100062648);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for ChartsSection()
{
  uint64_t result = qword_1000626A8;
  if (!qword_1000626A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003C1AC()
{
  sub_10003C24C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10003C24C()
{
  if (!qword_1000626B8)
  {
    sub_10004E8B0();
    unint64_t v0 = sub_10004E520();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000626B8);
    }
  }
}

uint64_t sub_10003C2A4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_10003C2C0()
{
  qword_100062628 = 0x4042000000000000;
}

void sub_10003C2D0()
{
  qword_100062630 = 0x4043800000000000;
}

void sub_10003C2E4()
{
  qword_100062638 = 0x4044800000000000;
}

void sub_10003C2F8()
{
  qword_100062640 = 0x4045000000000000;
}

uint64_t sub_10003C308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_10004E8D0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = sub_100004F98(&qword_1000626F0);
  return sub_10003C364(a2, a1, a3 + *(int *)(v6 + 44));
}

uint64_t sub_10003C364@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v137 = a2;
  uint64_t v127 = a3;
  uint64_t v119 = sub_10004E8B0();
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v128 = (uint64_t)&v113 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_10004E970();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (char *)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100004F98(&qword_1000626F8);
  uint64_t v132 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v123 = (char *)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v117 = (char *)&v113 - v8;
  __chkstk_darwin(v9);
  int v11 = (char *)&v113 - v10;
  uint64_t v12 = sub_100004F98(&qword_100062700);
  __chkstk_darwin(v12 - 8);
  uint64_t v126 = (uint64_t)&v113 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v125 = (uint64_t)&v113 - v15;
  __chkstk_darwin(v16);
  uint64_t v124 = (uint64_t)&v113 - v17;
  __chkstk_darwin(v18);
  uint64_t v120 = (char *)&v113 - v19;
  __chkstk_darwin(v20);
  uint64_t v122 = (uint64_t)&v113 - v21;
  __chkstk_darwin(v22);
  uint64_t v116 = (char *)&v113 - v23;
  __chkstk_darwin(v24);
  uint64_t v121 = (uint64_t)&v113 - v25;
  __chkstk_darwin(v26);
  uint64_t v115 = (char *)&v113 - v27;
  __chkstk_darwin(v28);
  uint64_t v138 = (uint64_t)&v113 - v29;
  id v114 = self;
  id v30 = [v114 mainBundle];
  NSString v31 = sub_10004F0D0();
  NSString v32 = sub_10004F0D0();
  id v33 = [v30 localizedStringForKey:v31 value:0 table:v32];

  uint64_t v34 = sub_10004F0F0();
  unint64_t v36 = v35;

  uint64_t v37 = type metadata accessor for ChartsSection();
  uint64_t v38 = v37;
  unint64_t v130 = *(int *)(v37 + 20);
  uint64_t v39 = *(void **)(a1 + v130);
  if (v39)
  {
    if ([v39 paused]) {
      char v40 = 3;
    }
    else {
      char v40 = 0;
    }
    uint64_t v41 = *(void **)(a1 + *(int *)(v38 + 24));
    id v42 = v41;
    id v43 = v39;
    id v44 = [v43 activityMoveMode];
    Swift::String v45 = &selRef__moveMinutesCompletionPercentage;
    if (v44 != (id)2) {
      Swift::String v45 = &selRef__activeEnergyCompletionPercentage;
    }
    [v43 *v45];
    uint64_t v47 = v46;
  }
  else
  {
    uint64_t v41 = *(void **)(a1 + *(int *)(v37 + 24));
    id v48 = v41;
    char v40 = 0;
    uint64_t v47 = 0;
  }
  uint64_t v49 = *(int *)(v38 + 28);
  uint64_t v131 = v38;
  uint64_t v129 = v49;
  char v50 = *(unsigned char *)(a1 + v49);
  sub_10004E5A0();
  sub_10003D26C(v51);
  sub_10004EE50();
  sub_10004E590();
  uint64_t v143 = v34;
  unint64_t v144 = v36;
  char v145 = v40;
  char v146 = v39;
  uint64_t v147 = v41;
  uint64_t v148 = v47;
  BOOL v149 = v39 == 0;
  char v150 = v50;
  uint64_t v151 = v156;
  char v152 = v157;
  uint64_t v153 = v158;
  char v154 = v159;
  long long v155 = v160;
  char v52 = v139;
  sub_10004E960();
  uint64_t v53 = sub_100004F98(&qword_100062708);
  unint64_t v54 = sub_10003D75C();
  sub_10004EC90();
  uint64_t v55 = *(void (**)(char *, uint64_t))(v140 + 8);
  v140 += 8;
  uint64_t v134 = v55;
  v55(v52, v141);
  uint64_t v56 = v146;
  uint64_t v57 = v147;
  swift_bridgeObjectRelease();

  uint64_t v136 = v53;
  uint64_t v143 = v53;
  unint64_t v135 = v54;
  unint64_t v144 = v54;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v59 = (uint64_t)v115;
  uint64_t v60 = v142;
  uint64_t v133 = OpaqueTypeConformance2;
  sub_10004EC40();
  uint64_t v132 = *(void *)(v132 + 8);
  ((void (*)(char *, uint64_t))v132)(v11, v60);
  sub_10003D82C(v59, v138);
  id v61 = [v114 mainBundle];
  NSString v62 = sub_10004F0D0();
  NSString v63 = sub_10004F0D0();
  id v64 = [v61 localizedStringForKey:v62 value:0 table:v63];

  uint64_t v65 = sub_10004F0F0();
  unint64_t v67 = v66;

  uint64_t v68 = *(void **)(a1 + v130);
  if (v68)
  {
    if ([v68 paused]) {
      char v69 = 3;
    }
    else {
      char v69 = 1;
    }
    uint64_t v70 = *(void **)(a1 + *(int *)(v131 + 24));
    id v71 = v70;
    [v68 _exerciseTimeCompletionPercentage];
    uint64_t v73 = v72;
  }
  else
  {
    uint64_t v70 = *(void **)(a1 + *(int *)(v131 + 24));
    id v74 = v70;
    char v69 = 1;
    uint64_t v73 = 0;
  }
  char v75 = *(unsigned char *)(a1 + v129);
  sub_10004E5A0();
  sub_10003D26C(v76);
  sub_10004EE50();
  sub_10004E590();
  uint64_t v143 = v65;
  unint64_t v144 = v67;
  char v145 = v69;
  char v146 = v68;
  uint64_t v147 = v70;
  uint64_t v148 = v73;
  BOOL v149 = v68 == 0;
  char v150 = v75;
  uint64_t v151 = v161;
  char v152 = v162;
  uint64_t v153 = v163;
  char v154 = v164;
  long long v155 = v165;
  char v77 = v139;
  sub_10004E960();
  uint64_t v78 = v117;
  sub_10004EC90();
  v134(v77, v141);
  char v79 = v146;
  uint64_t v80 = v147;
  swift_bridgeObjectRelease();

  uint64_t v81 = (uint64_t)v116;
  uint64_t v82 = v142;
  sub_10004EC40();
  ((void (*)(char *, uint64_t))v132)(v78, v82);
  uint64_t v83 = v121;
  sub_10003D82C(v81, v121);
  int v84 = *(void **)(a1 + v130);
  uint64_t v137 = sub_10003E298();
  unint64_t v130 = v85;
  if (v84)
  {
    if ([v84 paused]) {
      char v86 = 3;
    }
    else {
      char v86 = 2;
    }
    NSString v87 = *(void **)(a1 + *(int *)(v131 + 24));
    id v88 = v87;
    [v84 _standHoursCompletionPercentage];
    uint64_t v90 = v89;
  }
  else
  {
    NSString v87 = *(void **)(a1 + *(int *)(v131 + 24));
    id v91 = v87;
    char v86 = 2;
    uint64_t v90 = 0;
  }
  char v92 = *(unsigned char *)(a1 + v129);
  uint64_t v93 = v128;
  sub_10001DEC8(v128);
  uint64_t v94 = v118;
  uint64_t v95 = v119;
  int v96 = (*(uint64_t (**)(uint64_t, uint64_t))(v118 + 88))(v93, v119);
  if (v96 == enum case for ContentSizeCategory.extraSmall(_:)
    || v96 == enum case for ContentSizeCategory.small(_:)
    || v96 == enum case for ContentSizeCategory.medium(_:))
  {
    if (qword_1000611C8 == -1) {
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v96 == enum case for ContentSizeCategory.large(_:))
  {
    if (qword_1000611D0 == -1) {
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v96 == enum case for ContentSizeCategory.extraLarge(_:))
  {
    if (qword_1000611D8 == -1) {
      goto LABEL_35;
    }
LABEL_36:
    swift_once();
    goto LABEL_35;
  }
  if (qword_1000611E0 != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v128, v95);
LABEL_35:
  sub_10004EE50();
  sub_10004E590();
  uint64_t v143 = v137;
  unint64_t v144 = v130;
  char v145 = v86;
  char v146 = v84;
  uint64_t v147 = v87;
  uint64_t v148 = v90;
  BOOL v149 = v84 == 0;
  char v150 = v92;
  uint64_t v151 = v166;
  char v152 = v167;
  uint64_t v153 = v168;
  char v154 = v169;
  long long v155 = v170;
  uint64_t v97 = v139;
  sub_10004E960();
  char v98 = v123;
  sub_10004EC90();
  v134(v97, v141);
  uint64_t v99 = v146;
  uint64_t v100 = v147;
  swift_bridgeObjectRelease();

  uint64_t v101 = (uint64_t)v120;
  uint64_t v102 = v142;
  sub_10004EC40();
  ((void (*)(char *, uint64_t))v132)(v98, v102);
  uint64_t v103 = v122;
  sub_10003D82C(v101, v122);
  uint64_t v104 = v138;
  uint64_t v105 = v124;
  sub_10003E3E0(v138, v124);
  uint64_t v106 = v125;
  sub_10003E3E0(v83, v125);
  uint64_t v107 = v126;
  sub_10003E3E0(v103, v126);
  uint64_t v108 = v127;
  sub_10003E3E0(v105, v127);
  id v109 = (int *)sub_100004F98(&qword_100062720);
  uint64_t v110 = v108 + v109[12];
  *(void *)uint64_t v110 = 0x401A000000000000;
  *(unsigned char *)(v110 + 8) = 0;
  sub_10003E3E0(v106, v108 + v109[16]);
  uint64_t v111 = v108 + v109[20];
  *(void *)uint64_t v111 = 0x401A000000000000;
  *(unsigned char *)(v111 + 8) = 0;
  sub_10003E3E0(v107, v108 + v109[24]);
  sub_100005100(v103, &qword_100062700);
  sub_100005100(v83, &qword_100062700);
  sub_100005100(v104, &qword_100062700);
  sub_100005100(v107, &qword_100062700);
  sub_100005100(v106, &qword_100062700);
  return sub_100005100(v105, &qword_100062700);
}

double sub_10003D26C(double a1)
{
  uint64_t v2 = sub_10004E8B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DEC8((uint64_t)v5);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for ContentSizeCategory.extraSmall(_:)
    || v6 == enum case for ContentSizeCategory.small(_:)
    || v6 == enum case for ContentSizeCategory.medium(_:))
  {
    if (qword_1000611C8 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_100062628;
  }
  else if (v6 == enum case for ContentSizeCategory.large(_:))
  {
    if (qword_1000611D0 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_100062630;
  }
  else if (v6 == enum case for ContentSizeCategory.extraLarge(_:))
  {
    if (qword_1000611D8 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_100062638;
  }
  else
  {
    if (qword_1000611E0 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_100062640;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return (a1 - *(double *)&v9) * 0.5;
}

uint64_t sub_10003D4A8@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10003E778(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ChartsSection);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10003E710((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for ChartsSection);
  *a2 = sub_10003D6DC;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_10003D5B0()
{
  uint64_t v1 = type metadata accessor for ChartsSection();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E8B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003D6DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ChartsSection() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10003C308(a1, v6, a2);
}

unint64_t sub_10003D75C()
{
  unint64_t result = qword_100062710;
  if (!qword_100062710)
  {
    sub_1000053B0(&qword_100062708);
    sub_10003D7D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062710);
  }
  return result;
}

unint64_t sub_10003D7D8()
{
  unint64_t result = qword_100062718;
  if (!qword_100062718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062718);
  }
  return result;
}

uint64_t sub_10003D82C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100062700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003D894@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = type metadata accessor for HeaderLabel();
  __chkstk_darwin(v3);
  uint64_t v5 = &v41[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v8 = &v41[-v7];
  __chkstk_darwin(v9);
  uint64_t v11 = &v41[-v10];
  int v42 = *(unsigned __int8 *)(a1 + 49);
  if (v42 == 1)
  {
    id v12 = [self mainBundle];
    NSString v13 = sub_10004F0D0();
    NSString v14 = sub_10004F0D0();
    id v15 = [v12 localizedStringForKey:v13 value:0 table:v14];

    uint64_t v16 = sub_10004F0F0();
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = *(void *)a1;
    uint64_t v18 = *(void *)(a1 + 8);
    swift_bridgeObjectRetain();
  }
  int v19 = *(unsigned __int8 *)(a1 + 16);
  if (v19 == 3)
  {
    if (qword_100061198 != -1) {
      swift_once();
    }
    uint64_t v20 = &qword_1000648C0;
  }
  else
  {
    if (qword_100061140 != -1) {
      swift_once();
    }
    uint64_t v20 = &qword_100064868;
  }
  uint64_t v21 = *v20;
  swift_retain();
  uint64_t v44 = 0x4026000000000000;
  sub_10000C27C();
  sub_10004E550();
  uint64_t v22 = (uint64_t *)&v8[*(int *)(v3 + 20)];
  uint64_t *v22 = v16;
  v22[1] = v18;
  *(void *)&v8[*(int *)(v3 + 24)] = v21;
  sub_10003E710((uint64_t)v8, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for HeaderLabel);
  uint64_t v23 = *(void **)(a1 + 24);
  uint64_t v24 = *(void **)(a1 + 32);
  id v25 = v24;
  id v26 = v23;
  char v27 = sub_10004EA00();
  sub_10004E510();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_10003E778((uint64_t)v11, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HeaderLabel);
  uint64_t v36 = v43;
  sub_10003E778((uint64_t)v5, v43, (uint64_t (*)(void))type metadata accessor for HeaderLabel);
  uint64_t v37 = v36 + *(int *)(sub_100004F98(&qword_100062740) + 48);
  *(unsigned char *)uint64_t v37 = v19;
  *(void *)(v37 + 8) = v23;
  *(void *)(v37 + 16) = v24;
  *(unsigned char *)(v37 + 24) = v42;
  *(unsigned char *)(v37 + 32) = v27;
  *(void *)(v37 + 40) = v29;
  *(void *)(v37 + 48) = v31;
  *(void *)(v37 + 56) = v33;
  *(void *)(v37 + 64) = v35;
  *(unsigned char *)(v37 + 72) = 0;
  id v38 = v26;
  id v39 = v25;
  sub_10003E7E0((uint64_t)v11);

  return sub_10003E7E0((uint64_t)v5);
}

uint64_t sub_10003DBE8@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(v1 + 32);
  __int16 v7 = *(_WORD *)(v1 + 48);
  *(void *)a1 = sub_10004E8D0();
  *(void *)(a1 + 8) = 0x4008000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = sub_100004F98(&qword_100062738);
  return sub_10003D894((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

uint64_t sub_10003DC54@<X0>(id a1@<X2>, char a2@<W0>, void *a3@<X1>, void *a4@<X8>)
{
  switch(a2)
  {
    case 1:
      if (qword_100061170 != -1) {
        swift_once();
      }
      uint64_t v19 = qword_100061178;
      swift_retain();
      if (v19 != -1) {
        swift_once();
      }
      uint64_t v20 = self;
      swift_retain();
      [v20 minuteUnit];
      sub_10003EC00(1, a3);
      if (a1)
      {
        id v21 = [a1 appleExerciseTimeResults];
        if (v21)
        {
          uint64_t v22 = v21;
          sub_100017EEC(0, &qword_100061D90);
          sub_10004F170();
        }
      }
      break;
    case 2:
      if (a1)
      {
        id v12 = [a1 appleStandHourResults];
        if (v12)
        {
          NSString v13 = v12;
          sub_100017EEC(0, &qword_100061D98);
          sub_10004F170();
        }
      }
      if (qword_1000611F8 != -1) {
        swift_once();
      }
      sub_10003EED0();
      goto LABEL_38;
    case 3:
      if (qword_100061188 != -1) {
        swift_once();
      }
      uint64_t v14 = qword_100061190;
      swift_retain();
      if (v14 != -1) {
        swift_once();
      }
      uint64_t v15 = qword_1000611F0;
      swift_retain();
      if (v15 != -1) {
        swift_once();
      }
      id v16 = [(id)qword_1000648F8 unitManager];
      if (!v16)
      {
        __break(1u);
LABEL_40:
        __break(1u);
        JUMPOUT(0x10003E1C0);
      }
      uint64_t v17 = v16;
      id v18 = [v16 userActiveEnergyBurnedUnit];

      if (a3 && [a3 activityMoveMode] == (id)2)
      {
        [self minuteUnit];
      }
      break;
    default:
      if (qword_100061160 != -1) {
        swift_once();
      }
      uint64_t v7 = qword_100061168;
      swift_retain();
      if (v7 != -1) {
        swift_once();
      }
      uint64_t v8 = qword_1000611F0;
      swift_retain();
      if (v8 != -1) {
        swift_once();
      }
      id v9 = [(id)qword_1000648F8 unitManager];
      if (!v9) {
        goto LABEL_40;
      }
      uint64_t v10 = v9;
      id v11 = [v9 userActiveEnergyBurnedUnit];

      if (a3 && [a3 activityMoveMode] == (id)2)
      {
        [self minuteUnit];
      }
      sub_10003EC00(0, a3);
      sub_10003E1D0(0, a3, a1);
      break;
  }
  sub_10003EE7C();
LABEL_38:
  uint64_t result = sub_10004EDC0();
  *a4 = result;
  return result;
}

uint64_t sub_10003E1D0(int a1, id a2, id a3)
{
  if (a2 && [a2 activityMoveMode] == (id)2)
  {
    if (a3)
    {
      id v4 = [a3 appleMoveTimeResults];
      goto LABEL_7;
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
  id v4 = [a3 activeEnergyResults];
LABEL_7:
  id v5 = v4;
  if (!v5) {
    return 0;
  }
  sub_100017EEC(0, &qword_100061D90);
  uint64_t v6 = sub_10004F170();

  return v6;
}

uint64_t sub_10003E288@<X0>(void *a1@<X8>)
{
  return sub_10003DC54(*(id *)(v1 + 16), *(unsigned char *)v1, *(void **)(v1 + 8), a1);
}

uint64_t sub_10003E298()
{
  if (qword_1000611F8 != -1) {
    swift_once();
  }
  id v0 = [self mainBundle];
  NSString v1 = sub_10004F0D0();
  NSString v2 = sub_10004F0D0();
  id v3 = [v0 localizedStringForKey:v1 value:0 table:v2];

  uint64_t v4 = sub_10004F0F0();
  return v4;
}

uint64_t sub_10003E3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100062700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void destroy for ChartContainer(uint64_t a1)
{
  swift_bridgeObjectRelease();

  NSString v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for ChartContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 24);
  id v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  return a1;
}

uint64_t assignWithCopy for ChartContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v8;
  id v9 = v8;

  uint64_t v10 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

__n128 initializeWithTake for ChartContainer(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ChartContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);

  id v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChartContainer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 50)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChartContainer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 50) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartContainer()
{
  return &type metadata for ChartContainer;
}

uint64_t sub_10003E6B8()
{
  return sub_10000566C(&qword_100062728, &qword_100062730);
}

uint64_t sub_10003E6F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003E710(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003E778(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003E7E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HeaderLabel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void destroy for Chart(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for Chart(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for Chart(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a1 + 8);
  id v5 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for Chart(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Chart(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;

  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Chart(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25)) {
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

uint64_t storeEnumTagSinglePayload for Chart(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Chart()
{
  return &type metadata for Chart;
}

unsigned char *storeEnumTagSinglePayload for ChartType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x10003EB18);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartType()
{
  return &type metadata for ChartType;
}

uint64_t sub_10003EB50()
{
  return sub_10000566C(&qword_100062748, &qword_100062750);
}

unint64_t sub_10003EB90()
{
  unint64_t result = qword_100062758;
  if (!qword_100062758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062758);
  }
  return result;
}

uint64_t sub_10003EBE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003EC00(char a1, id a2)
{
  uint64_t v2 = 0;
  switch(a1)
  {
    case 1:
    case 2:
      goto LABEL_8;
    case 3:
      return v2;
    default:
      if (a2 && [a2 activityMoveMode] == (id)2)
      {
        if (qword_1000611F0 != -1) {
          swift_once();
        }
        id v3 = [(id)qword_1000648F8 localizedLongMoveMinutesUnitString];
        if (!v3)
        {
          __break(1u);
LABEL_8:
          id v4 = [self mainBundle];
          NSString v5 = sub_10004F0D0();
          NSString v6 = sub_10004F0D0();
          id v3 = [v4 localizedStringForKey:v5 value:0 table:v6];
        }
      }
      else
      {
        if (qword_1000611F0 != -1) {
          swift_once();
        }
        id v3 = [(id)qword_1000648F8 localizedLongActiveEnergyUnitString];
        if (!v3)
        {
          __break(1u);
          JUMPOUT(0x10003EE6CLL);
        }
      }
      uint64_t v2 = sub_10004F0F0();

      break;
  }
  return v2;
}

unint64_t sub_10003EE7C()
{
  unint64_t result = qword_100062760;
  if (!qword_100062760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062760);
  }
  return result;
}

unint64_t sub_10003EED0()
{
  unint64_t result = qword_100062768;
  if (!qword_100062768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062768);
  }
  return result;
}

void *sub_10003EF24()
{
  return &protocol witness table for AnyView;
}

void *sub_10003EF30(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    id v11 = (void *)((char *)a2 + v9);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100004F98(&qword_1000613D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    id v18 = (void *)((char *)a1 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[9];
    uint64_t v22 = a3[10];
    uint64_t v23 = (void *)((char *)a1 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    *((unsigned char *)a1 + v22) = *((unsigned char *)a2 + v22);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10003F178(uint64_t a1, uint64_t a2)
{
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10003F2F0(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E5F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004EFA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[9];
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)((char *)a1 + v19);
  uint64_t v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10003F4E8(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B90);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005100((uint64_t)a1 + v7, &qword_100061D88);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  return a1;
}

char *sub_10003F73C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004E5F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004EFA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  uint64_t v18 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  a1[v18] = a2[v18];
  return a1;
}

char *sub_10003F920(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B90);
    uint64_t v6 = sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E5F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005100((uint64_t)&a1[v8], &qword_100061D88);
    uint64_t v11 = sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004EFA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_release();
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v26 = *(void *)v24;
  uint64_t v25 = *((void *)v24 + 1);
  *(void *)uint64_t v23 = v26;
  *((void *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_10003FB5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003FB70);
}

uint64_t sub_10003FB70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061BA0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061E48);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_100004F98(&qword_1000613D0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_10003FCDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003FCF0);
}

uint64_t sub_10003FCF0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004F98(&qword_100061BA0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100004F98(&qword_100061E48);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_100004F98(&qword_1000613D0);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for StandaloneMetricView()
{
  uint64_t result = qword_1000627C8;
  if (!qword_1000627C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003FEA4()
{
  sub_100040004(319, (unint64_t *)&unk_100061C18, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v0 <= 0x3F)
  {
    sub_100040004(319, (unint64_t *)&qword_100061EB8, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F)
    {
      sub_10000C220();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100040004(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004E520();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100040058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100040074@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v113 = a1;
  uint64_t v108 = sub_100004F98(&qword_100062818);
  __chkstk_darwin(v108);
  id v112 = (void *)((char *)v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_10004E660();
  uint64_t v110 = *(void *)(v4 - 8);
  uint64_t v111 = v4;
  __chkstk_darwin(v4);
  id v109 = (char *)v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004F98(&qword_100061480);
  __chkstk_darwin(v6 - 8);
  uint64_t v100 = (char *)v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_10004EFA0();
  uint64_t v98 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  int v96 = (char *)v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v94 = (uint64_t)v86 - v10;
  uint64_t v95 = sub_10004EBB0();
  uint64_t v93 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v89 = (char *)v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100004F98(&qword_100062820);
  __chkstk_darwin(v99);
  uint64_t v105 = (char *)v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_100004F98(&qword_100062828);
  __chkstk_darwin(v101);
  uint64_t v106 = (uint64_t)v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100004F98(&qword_100062830);
  __chkstk_darwin(v102);
  uint64_t v107 = (uint64_t)v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_100004F98(&qword_100062838);
  __chkstk_darwin(v104);
  uint64_t v103 = (uint64_t)v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = (int *)type metadata accessor for StandaloneMetricView();
  uint64_t v17 = (uint64_t *)(v1 + v16[8]);
  uint64_t v18 = v17[1];
  uint64_t v114 = *v17;
  uint64_t v115 = v18;
  sub_10000C56C();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_10004EBE0();
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  v86[1] = v16[7];
  uint64_t v91 = sub_10004EB50();
  uint64_t v90 = v24;
  int v88 = v25;
  uint64_t v92 = v26;
  sub_10000C5C0(v19, v21, v23);
  swift_bridgeObjectRelease();
  char v27 = (uint64_t *)(v2 + v16[9]);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  uint64_t v114 = v29;
  uint64_t v115 = v28;
  uint64_t v114 = sub_10004F2B0();
  uint64_t v115 = v30;
  uint64_t v31 = sub_10004EBE0();
  uint64_t v33 = v32;
  char v35 = v34 & 1;
  uint64_t v36 = v89;
  sub_10004EBA0();
  uint64_t v37 = sub_10004EBC0();
  uint64_t v39 = v38;
  int v87 = v40;
  sub_10000C5C0(v31, v33, v35);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v36, v95);
  uint64_t v95 = (uint64_t)v16;
  uint64_t v41 = v94;
  sub_10001DE90(v94);
  int v42 = v96;
  sub_10004EF90();
  sub_100031394();
  uint64_t v43 = v97;
  LOBYTE(v31) = sub_10004F0C0();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v98 + 8);
  v44(v42, v43);
  v44((char *)v41, v43);
  v86[2] = v2;
  if (v31) {
    swift_retain();
  }
  else {
    sub_10004ECF0();
  }
  char v45 = v87 & 1;
  char v46 = v88 & 1;
  uint64_t v47 = sub_10004EB50();
  uint64_t v49 = v48;
  char v51 = v50;
  swift_release();
  sub_10000C5C0(v37, v39, v45);
  swift_bridgeObjectRelease();
  uint64_t v52 = v91;
  uint64_t v53 = v90;
  uint64_t v54 = sub_10004EB80();
  uint64_t v97 = v55;
  uint64_t v98 = v56;
  char v58 = v57 & 1;
  sub_10000C5C0(v47, v49, v51 & 1);
  swift_bridgeObjectRelease();
  sub_10000C5C0(v52, v53, v46);
  swift_bridgeObjectRelease();
  sub_100004F98(&qword_1000613D0);
  sub_10004E560();
  sub_10004EA70();
  uint64_t v59 = enum case for Font.Design.rounded(_:);
  uint64_t v60 = sub_10004EA50();
  uint64_t v61 = *(void *)(v60 - 8);
  uint64_t v62 = (uint64_t)v100;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 104))(v100, v59, v60);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 56))(v62, 0, 1, v60);
  sub_10004EA80();
  sub_100005100(v62, &qword_100061480);
  uint64_t v63 = v97;
  uint64_t v64 = sub_10004EB90();
  uint64_t v66 = v65;
  LOBYTE(v61) = v67;
  uint64_t v69 = v68;
  swift_release();
  LOBYTE(v53) = v61 & 1;
  sub_10000C5C0(v54, v63, v58);
  swift_bridgeObjectRelease();
  uint64_t v70 = v109;
  sub_10004E650();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v73 = v111;
  uint64_t v72 = v112;
  uint64_t v74 = v110;
  (*(void (**)(char *, char *, uint64_t))(v110 + 16))((char *)v112 + *(int *)(v108 + 28), v70, v111);
  *uint64_t v72 = KeyPath;
  uint64_t v75 = (uint64_t)v105;
  sub_10000509C((uint64_t)v72, (uint64_t)&v105[*(int *)(v99 + 36)], &qword_100062818);
  *(void *)uint64_t v75 = v64;
  *(void *)(v75 + 8) = v66;
  *(unsigned char *)(v75 + 16) = v53;
  *(void *)(v75 + 24) = v69;
  sub_100010F70(v64, v66, v53);
  swift_bridgeObjectRetain();
  sub_100005100((uint64_t)v72, &qword_100062818);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v70, v73);
  sub_10000C5C0(v64, v66, v53);
  swift_bridgeObjectRelease();
  uint64_t v76 = swift_getKeyPath();
  uint64_t v77 = v106;
  sub_10000509C(v75, v106, &qword_100062820);
  uint64_t v78 = (uint64_t *)(v77 + *(int *)(v101 + 36));
  *uint64_t v78 = v76;
  v78[1] = 0x3FE3333333333333;
  sub_100005100(v75, &qword_100062820);
  uint64_t v79 = swift_getKeyPath();
  uint64_t v80 = v107;
  sub_10000509C(v77, v107, &qword_100062828);
  uint64_t v81 = v80 + *(int *)(v102 + 36);
  *(void *)uint64_t v81 = v79;
  *(unsigned char *)(v81 + 8) = 1;
  sub_100005100(v77, &qword_100062828);
  uint64_t v82 = swift_getKeyPath();
  uint64_t v83 = v103;
  sub_10000509C(v80, v103, &qword_100062830);
  uint64_t v84 = v83 + *(int *)(v104 + 36);
  *(void *)uint64_t v84 = v82;
  *(void *)(v84 + 8) = 1;
  *(unsigned char *)(v84 + 16) = 0;
  sub_100005100(v80, &qword_100062830);
  return sub_100040AD0(v83, v113);
}

uint64_t sub_100040AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100062838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100040B3C()
{
  unint64_t result = qword_100062840;
  if (!qword_100062840)
  {
    sub_1000053B0(&qword_100062838);
    sub_100040BC8();
    sub_100040D6C((unint64_t *)&qword_1000614A0, &qword_1000614A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062840);
  }
  return result;
}

unint64_t sub_100040BC8()
{
  unint64_t result = qword_100062848;
  if (!qword_100062848)
  {
    sub_1000053B0(&qword_100062830);
    sub_100040C54();
    sub_100040D6C(&qword_100062878, &qword_100062880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062848);
  }
  return result;
}

unint64_t sub_100040C54()
{
  unint64_t result = qword_100062850;
  if (!qword_100062850)
  {
    sub_1000053B0(&qword_100062828);
    sub_100040CE0();
    sub_100040D6C(&qword_100062868, &qword_100062870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062850);
  }
  return result;
}

unint64_t sub_100040CE0()
{
  unint64_t result = qword_100062858;
  if (!qword_100062858)
  {
    sub_1000053B0(&qword_100062820);
    sub_100040D6C(&qword_100062860, &qword_100062818);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062858);
  }
  return result;
}

uint64_t sub_100040D6C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000053B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100040DBC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E8B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
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
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100004F98(&qword_1000613D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    uint64_t v18 = (void *)((char *)a1 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[9];
    uint64_t v22 = a3[10];
    char v23 = (void *)((char *)a1 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *char v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = (void *)((char *)a1 + v22);
    char v27 = (void *)((char *)a2 + v22);
    uint64_t v28 = v27[1];
    void *v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[12];
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100041028(uint64_t a1, uint64_t a2)
{
  sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004E8B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1000411B0(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E8B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004EFA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[9];
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)((char *)a1 + v19);
  uint64_t v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = (void *)((char *)a1 + v20);
  uint64_t v25 = (void *)((char *)a2 + v20);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(void *)((char *)a1 + v27) = *(void *)((char *)a2 + v27);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1000413CC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D50);
    sub_100004F98(&qword_100061D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004E8B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005100((uint64_t)a1 + v7, &qword_100061D88);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  return a1;
}

char *sub_100041658(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004E8B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004EFA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  uint64_t v18 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  uint64_t v19 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  return a1;
}

char *sub_100041850(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061D50);
    uint64_t v6 = sub_100004F98(&qword_100061D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E8B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005100((uint64_t)&a1[v8], &qword_100061D88);
    uint64_t v11 = sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004EFA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100004F98(&qword_1000613D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_release();
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v26 = *(void *)v24;
  uint64_t v25 = *((void *)v24 + 1);
  *(void *)uint64_t v23 = v26;
  *((void *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[10];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v31 = *(void *)v29;
  uint64_t v30 = *((void *)v29 + 1);
  *(void *)uint64_t v28 = v31;
  *((void *)v28 + 1) = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  *(void *)&a1[v32] = *(void *)&a2[v32];
  return a1;
}

uint64_t sub_100041AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100041AC4);
}

uint64_t sub_100041AC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100062648);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061E48);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_100004F98(&qword_1000613D0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_100041C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100041C44);
}

uint64_t sub_100041C44(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004F98(&qword_100062648);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100004F98(&qword_100061E48);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_100004F98(&qword_1000613D0);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for FractionView()
{
  uint64_t result = qword_1000628E0;
  if (!qword_1000628E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100041DF8()
{
  sub_100041F68(319, (unint64_t *)&qword_1000626B8, (void (*)(uint64_t))&type metadata accessor for ContentSizeCategory);
  if (v0 <= 0x3F)
  {
    sub_100041F68(319, (unint64_t *)&qword_100061EB8, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F)
    {
      sub_10000C220();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100041F68(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004E520();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100041FBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100041FD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v164 = a1;
  uint64_t v159 = sub_100004F98(&qword_100062818);
  __chkstk_darwin(v159);
  uint64_t v163 = (uint64_t *)((char *)&v125 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = sub_10004E660();
  uint64_t v161 = *(void *)(v3 - 8);
  uint64_t v162 = v3;
  __chkstk_darwin(v3);
  long long v160 = (char *)&v125 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004F98(&qword_100061480);
  __chkstk_darwin(v5 - 8);
  BOOL v149 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_10004EFA0();
  uint64_t v145 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  unint64_t v144 = (char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v143 = (uint64_t)&v125 - v9;
  uint64_t v142 = sub_10004EBB0();
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_100004F98(&qword_100062820);
  __chkstk_darwin(v148);
  long long v155 = (char *)&v125 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_100004F98(&qword_100062938);
  __chkstk_darwin(v150);
  uint64_t v156 = (uint64_t)&v125 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_100004F98(&qword_100062940);
  __chkstk_darwin(v151);
  uint64_t v157 = (uint64_t)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = sub_100004F98(&qword_100062948);
  __chkstk_darwin(v152);
  uint64_t v158 = (uint64_t)&v125 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_100004F98(&qword_100062950);
  __chkstk_darwin(v153);
  uint64_t v154 = (uint64_t)&v125 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = type metadata accessor for FractionView();
  unint64_t v16 = (uint64_t *)(v1 + *(int *)(v165 + 32));
  unint64_t v17 = v16[1];
  uint64_t v135 = *v16;
  uint64_t v147 = v16;
  unint64_t v134 = v17;
  uint64_t v167 = v135;
  unint64_t v168 = v17;
  unint64_t v18 = sub_10000C56C();
  swift_bridgeObjectRetain();
  uint64_t v138 = sub_10004EBE0();
  uint64_t v137 = v19;
  uint64_t v139 = v20;
  char v22 = v21 & 1;
  sub_10004E880();
  uint64_t v23 = sub_10004EBD0();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  uint64_t v28 = sub_10004EB40();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_10000C5C0(v23, v25, v27);
  swift_bridgeObjectRelease();
  uint64_t v33 = v138;
  uint64_t v34 = v137;
  uint64_t v133 = sub_10004EB80();
  uint64_t v130 = v35;
  uint64_t v128 = v36;
  int v129 = v37 & 1;
  sub_10000C5C0(v28, v30, v32);
  swift_bridgeObjectRelease();
  sub_10000C5C0(v33, v34, v22);
  swift_bridgeObjectRelease();
  uint64_t v38 = v165;
  uint64_t v39 = (uint64_t *)(v166 + *(int *)(v165 + 36));
  unint64_t v40 = v39[1];
  uint64_t v132 = *v39;
  uint64_t v167 = v132;
  unint64_t v168 = v40;
  unint64_t v131 = v40;
  swift_bridgeObjectRetain();
  unint64_t v136 = v18;
  uint64_t v41 = sub_10004EBE0();
  uint64_t v43 = v42;
  LOBYTE(v28) = v44 & 1;
  uint64_t v45 = v133;
  uint64_t v46 = v130;
  char v47 = v129;
  uint64_t v126 = sub_10004EB80();
  uint64_t v49 = v48;
  uint64_t v127 = v50;
  LOBYTE(v34) = v51 & 1;
  sub_10000C5C0(v41, v43, v28);
  uint64_t v52 = v166;
  swift_bridgeObjectRelease();
  sub_10000C5C0(v45, v46, v47);
  swift_bridgeObjectRelease();
  uint64_t v130 = *(int *)(v38 + 28);
  uint64_t v53 = v126;
  uint64_t v138 = sub_10004EB50();
  uint64_t v137 = v54;
  LODWORD(v133) = v55;
  uint64_t v139 = v56;
  sub_10000C5C0(v53, v49, v34);
  swift_bridgeObjectRelease();
  if (sub_100042D8C())
  {
    char v57 = (uint64_t *)(v52 + *(int *)(v38 + 40));
    uint64_t v59 = *v57;
    unint64_t v58 = v57[1];
    uint64_t v167 = v59;
    unint64_t v168 = v58;
    uint64_t v60 = sub_10004F2B0();
  }
  else
  {
    uint64_t v60 = 0;
    unint64_t v61 = 0xE000000000000000;
  }
  uint64_t v167 = v60;
  unint64_t v168 = v61;
  uint64_t v62 = sub_10004EBE0();
  uint64_t v64 = v63;
  char v66 = v65 & 1;
  char v67 = v140;
  sub_10004EBA0();
  uint64_t v68 = sub_10004EBC0();
  uint64_t v70 = v69;
  char v72 = v71;
  unint64_t v136 = v73;
  sub_10000C5C0(v62, v64, v66);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v141 + 8))(v67, v142);
  uint64_t v74 = v143;
  sub_10001DE90(v143);
  uint64_t v75 = v144;
  sub_10004EF90();
  sub_100031394();
  uint64_t v76 = v146;
  LOBYTE(v62) = sub_10004F0C0();
  uint64_t v77 = *(void (**)(char *, uint64_t))(v145 + 8);
  v77(v75, v76);
  v77((char *)v74, v76);
  if (v62) {
    swift_retain();
  }
  else {
    sub_10004ECF0();
  }
  char v78 = v133 & 1;
  uint64_t v79 = sub_10004EB50();
  uint64_t v81 = v80;
  char v83 = v82;
  swift_release();
  char v84 = v83 & 1;
  sub_10000C5C0(v68, v70, v72 & 1);
  swift_bridgeObjectRelease();
  uint64_t v85 = v138;
  uint64_t v86 = v137;
  uint64_t v87 = sub_10004EB80();
  uint64_t v145 = v88;
  uint64_t v146 = v89;
  char v91 = v90 & 1;
  sub_10000C5C0(v79, v81, v84);
  swift_bridgeObjectRelease();
  sub_10000C5C0(v85, v86, v78);
  swift_bridgeObjectRelease();
  sub_100004F98(&qword_1000613D0);
  sub_10004E560();
  sub_10004EA70();
  uint64_t v92 = enum case for Font.Design.rounded(_:);
  uint64_t v93 = sub_10004EA50();
  uint64_t v94 = *(void *)(v93 - 8);
  uint64_t v95 = (uint64_t)v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v94 + 104))(v149, v92, v93);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v94 + 56))(v95, 0, 1, v93);
  sub_10004EA80();
  sub_100005100(v95, &qword_100061480);
  uint64_t v96 = v145;
  uint64_t v97 = sub_10004EB90();
  uint64_t v99 = v98;
  LOBYTE(v95) = v100;
  uint64_t v102 = v101;
  swift_release();
  char v103 = v95 & 1;
  sub_10000C5C0(v87, v96, v91);
  swift_bridgeObjectRelease();
  uint64_t v104 = v160;
  sub_10004E650();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v107 = v162;
  uint64_t v106 = v163;
  uint64_t v108 = v161;
  (*(void (**)(char *, char *, uint64_t))(v161 + 16))((char *)v163 + *(int *)(v159 + 28), v104, v162);
  *uint64_t v106 = KeyPath;
  uint64_t v109 = (uint64_t)v155;
  sub_10000509C((uint64_t)v106, (uint64_t)&v155[*(int *)(v148 + 36)], &qword_100062818);
  *(void *)uint64_t v109 = v97;
  *(void *)(v109 + 8) = v99;
  *(unsigned char *)(v109 + 16) = v103;
  *(void *)(v109 + 24) = v102;
  sub_100010F70(v97, v99, v103);
  swift_bridgeObjectRetain();
  sub_100005100((uint64_t)v106, &qword_100062818);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v104, v107);
  sub_10000C5C0(v97, v99, v103);
  swift_bridgeObjectRelease();
  sub_10004EE90();
  uint64_t v110 = sub_10004EE80();
  swift_release();
  uint64_t v112 = *v147;
  uint64_t v111 = v147[1];
  uint64_t v113 = v156;
  sub_10000509C(v109, v156, &qword_100062820);
  uint64_t v114 = (uint64_t *)(v113 + *(int *)(v150 + 36));
  uint64_t *v114 = v110;
  v114[1] = v112;
  v114[2] = v111;
  swift_bridgeObjectRetain();
  sub_100005100(v109, &qword_100062820);
  uint64_t v115 = swift_getKeyPath();
  uint64_t v116 = v157;
  sub_10000509C(v113, v157, &qword_100062938);
  uint64_t v117 = (uint64_t *)(v116 + *(int *)(v151 + 36));
  uint64_t *v117 = v115;
  v117[1] = 0x3FE3333333333333;
  sub_100005100(v113, &qword_100062938);
  uint64_t v118 = swift_getKeyPath();
  uint64_t v119 = v158;
  sub_10000509C(v116, v158, &qword_100062940);
  uint64_t v120 = v119 + *(int *)(v152 + 36);
  *(void *)uint64_t v120 = v118;
  *(unsigned char *)(v120 + 8) = 1;
  sub_100005100(v116, &qword_100062940);
  uint64_t v121 = swift_getKeyPath();
  uint64_t v122 = v154;
  sub_10000509C(v119, v154, &qword_100062948);
  uint64_t v123 = v122 + *(int *)(v153 + 36);
  *(void *)uint64_t v123 = v121;
  *(void *)(v123 + 8) = 1;
  *(unsigned char *)(v123 + 16) = 0;
  sub_100005100(v119, &qword_100062948);
  return sub_100043060(v122, v164);
}

BOOL sub_100042D8C()
{
  sub_10000C56C();
  sub_10004F2C0();
  sub_10004F2C0();
  uint64_t v0 = sub_10004F110();
  swift_bridgeObjectRelease();
  if (v0 < 6)
  {
    uint64_t v2 = sub_10004F110();
    swift_bridgeObjectRelease();
    return v2 < 6;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t sub_100042EE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10004E7B0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100042F14()
{
  return sub_10004E7C0();
}

uint64_t sub_100042F44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004E6F0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100042F74()
{
  return sub_10004E700();
}

uint64_t sub_100042FA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004E6F0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100042FD4()
{
  return sub_10004E700();
}

uint64_t sub_100042FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10004E7B0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100043030()
{
  return sub_10004E7C0();
}

uint64_t sub_100043060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004F98(&qword_100062950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000430CC()
{
  unint64_t result = qword_100062958;
  if (!qword_100062958)
  {
    sub_1000053B0(&qword_100062950);
    sub_10004316C();
    sub_10000566C((unint64_t *)&qword_1000614A0, &qword_1000614A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062958);
  }
  return result;
}

unint64_t sub_10004316C()
{
  unint64_t result = qword_100062960;
  if (!qword_100062960)
  {
    sub_1000053B0(&qword_100062948);
    sub_10004320C();
    sub_10000566C(&qword_100062878, &qword_100062880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062960);
  }
  return result;
}

unint64_t sub_10004320C()
{
  unint64_t result = qword_100062968;
  if (!qword_100062968)
  {
    sub_1000053B0(&qword_100062940);
    sub_1000432AC();
    sub_10000566C(&qword_100062868, &qword_100062870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062968);
  }
  return result;
}

unint64_t sub_1000432AC()
{
  unint64_t result = qword_100062970;
  if (!qword_100062970)
  {
    sub_1000053B0(&qword_100062938);
    sub_100040CE0();
    sub_10000566C(&qword_100062978, &qword_100062980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062970);
  }
  return result;
}

id sub_10004334C()
{
  uint64_t v1 = sub_100004F98(&qword_100062988);
  __chkstk_darwin(v1);
  char v3 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100004F98(&qword_100062990);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [self sharedBehavior];
  if (result)
  {
    uint64_t v8 = result;
    unsigned int v9 = [result isStandalonePhoneFitnessMode];

    if (v9)
    {
      sub_1000435BC((uint64_t)v6);
      sub_10000509C((uint64_t)v6, (uint64_t)v3, &qword_100062990);
      swift_storeEnumTagMultiPayload();
      sub_100004F98(&qword_100062998);
      sub_100045D78();
      sub_10000566C(&qword_1000629B8, &qword_100062998);
      sub_10004E920();
      return (id)sub_100005100((uint64_t)v6, &qword_100062990);
    }
    else
    {
      uint64_t v10 = swift_allocObject();
      long long v11 = *(_OWORD *)(v0 + 48);
      *(_OWORD *)(v10 + 48) = *(_OWORD *)(v0 + 32);
      *(_OWORD *)(v10 + 64) = v11;
      *(void *)(v10 + 80) = *(void *)(v0 + 64);
      long long v12 = *(_OWORD *)(v0 + 16);
      *(_OWORD *)(v10 + 16) = *(_OWORD *)v0;
      *(_OWORD *)(v10 + 32) = v12;
      *char v3 = sub_100045D70;
      v3[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v10;
      swift_storeEnumTagMultiPayload();
      sub_100033710(v0);
      sub_100004F98(&qword_100062998);
      sub_100045D78();
      sub_10000566C(&qword_1000629B8, &qword_100062998);
      return (id)sub_10004E920();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000435BC@<X0>(uint64_t a1@<X8>)
{
  v20[0] = a1;
  uint64_t v1 = sub_10004E970();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004F98(&qword_1000629A8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004F98(&qword_1000629C0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  long long v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_10004E8D0();
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  uint64_t v12 = sub_100004F98(&qword_1000629C8);
  sub_100043894((uint64_t)&v7[*(int *)(v12 + 44)]);
  sub_10004E950();
  uint64_t v13 = sub_10000566C(&qword_1000629B0, &qword_1000629A8);
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_100005100((uint64_t)v7, &qword_1000629A8);
  uint64_t v21 = sub_10003A584();
  uint64_t v22 = v14;
  sub_10000C56C();
  uint64_t v15 = sub_10004EBE0();
  uint64_t v17 = v16;
  LOBYTE(v4) = v18 & 1;
  uint64_t v21 = v5;
  uint64_t v22 = v13;
  swift_getOpaqueTypeConformance2();
  sub_10004EC50();
  sub_10000C5C0(v15, v17, (char)v4);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100043894@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004F98(&qword_100062818) - 8;
  __chkstk_darwin(v2);
  uint64_t v46 = (uint64_t *)((char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = sub_10004E660();
  uint64_t v44 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  char v57 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100004F98(&qword_1000629D0) - 8;
  __chkstk_darwin(v43);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v58 = (uint64_t)&v40 - v8;
  uint64_t v56 = sub_10004E820();
  sub_100043E9C((uint64_t)&v59);
  uint64_t v49 = v60;
  uint64_t v50 = v59;
  uint64_t v48 = v61;
  uint64_t v52 = v63;
  uint64_t v53 = v62;
  int v51 = v64;
  uint64_t v47 = v65;
  uint64_t v55 = v66;
  int v54 = v67;
  uint64_t v59 = sub_100045538((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10004A1B4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10004A1C8);
  uint64_t v60 = v9;
  sub_10000C56C();
  uint64_t v10 = sub_10004EBE0();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  sub_10004EA40();
  sub_10004EAB0();
  swift_release();
  uint64_t v15 = sub_10004EB90();
  uint64_t v41 = v16;
  char v18 = v17;
  uint64_t v42 = v19;
  swift_release();
  char v20 = v18 & 1;
  sub_10000C5C0(v10, v12, v14);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = v57;
  sub_10004E650();
  uint64_t v23 = swift_getKeyPath();
  uint64_t v24 = *(int *)(v2 + 36);
  uint64_t v25 = v46;
  uint64_t v26 = v44;
  uint64_t v27 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))((char *)v46 + v24, v22, v45);
  *uint64_t v25 = v23;
  sub_10000509C((uint64_t)v25, (uint64_t)&v6[*(int *)(v43 + 44)], &qword_100062818);
  uint64_t v28 = v41;
  *(void *)uint64_t v6 = v15;
  *((void *)v6 + 1) = v28;
  v6[16] = v20;
  *((void *)v6 + 3) = v42;
  *((void *)v6 + 4) = KeyPath;
  *((void *)v6 + 5) = 0x3FE3333333333333;
  sub_100010F70(v15, v28, v20);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100005100((uint64_t)v25, &qword_100062818);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v57, v27);
  sub_10000C5C0(v15, v28, v20);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v29 = v58;
  sub_10000B630((uint64_t)v6, v58, &qword_1000629D0);
  id v30 = [self preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v30 descender];

  sub_10004EE50();
  sub_10004E590();
  char v57 = (char *)v59;
  LODWORD(v46) = v60;
  uint64_t v45 = v61;
  LODWORD(v44) = v62;
  uint64_t v43 = v63;
  uint64_t v42 = v64;
  sub_10000509C(v29, (uint64_t)v6, &qword_1000629D0);
  *(void *)a1 = v56;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v31 = v49;
  *(void *)(a1 + 24) = v50;
  *(void *)(a1 + 32) = v31;
  uint64_t v33 = v52;
  uint64_t v32 = v53;
  *(void *)(a1 + 40) = v48;
  *(void *)(a1 + 48) = v32;
  *(void *)(a1 + 56) = v33;
  char v34 = v51;
  *(unsigned char *)(a1 + 64) = v51;
  uint64_t v35 = v55;
  *(void *)(a1 + 72) = v47;
  *(void *)(a1 + 80) = v35;
  *(unsigned char *)(a1 + 88) = v54;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  uint64_t v36 = sub_100004F98(&qword_1000629D8);
  sub_10000509C((uint64_t)v6, a1 + *(int *)(v36 + 64), &qword_1000629D0);
  uint64_t v37 = a1 + *(int *)(v36 + 80);
  *(void *)uint64_t v37 = 0;
  *(unsigned char *)(v37 + 8) = 1;
  *(void *)(v37 + 16) = v57;
  *(unsigned char *)(v37 + 24) = (_BYTE)v46;
  *(void *)(v37 + 32) = v45;
  *(unsigned char *)(v37 + 40) = v44;
  uint64_t v38 = v42;
  *(void *)(v37 + 48) = v43;
  *(void *)(v37 + 56) = v38;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100010F70(v32, v33, v34);
  swift_bridgeObjectRetain();
  sub_100005100(v58, &qword_1000629D0);
  sub_100005100((uint64_t)v6, &qword_1000629D0);
  swift_release();
  swift_release();
  swift_release();
  sub_10000C5C0(v32, v33, v34);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100043E9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = sub_10004ED40();
  uint64_t v27 = sub_10004EAD0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v2 = self;
  id v3 = [v2 mainBundle];
  NSString v4 = sub_10004F0D0();
  NSString v5 = sub_10004F0D0();
  id v6 = [v3 localizedStringForKey:v4 value:0 table:v5];

  sub_10004F0F0();
  id v7 = [v2 mainBundle];
  NSString v8 = sub_10004F0D0();
  NSString v9 = sub_10004F0D0();
  id v10 = [v7 localizedStringForKey:v8 value:0 table:v9];

  sub_10004F0F0();
  sub_10000C56C();
  uint64_t v11 = sub_10004F2B0();
  char v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v29._countAndFlagsBits = v11;
  v29._object = v13;
  sub_10004F120(v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_10004EBE0();
  uint64_t v16 = v15;
  LOBYTE(v4) = v17 & 1;
  sub_10004EAD0();
  uint64_t v18 = sub_10004EB90();
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  swift_release();
  v22 &= 1u;
  sub_10000C5C0(v14, v16, (char)v4);
  swift_bridgeObjectRelease();
  *(void *)a1 = v28;
  *(void *)(a1 + 8) = KeyPath;
  *(void *)(a1 + 16) = v27;
  *(void *)(a1 + 24) = v18;
  *(void *)(a1 + 32) = v20;
  *(unsigned char *)(a1 + 40) = v22;
  *(void *)(a1 + 48) = v24;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100010F70(v18, v20, v22);
  swift_bridgeObjectRetain();
  sub_10000C5C0(v18, v20, v22);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000441D8@<X0>(_OWORD *a1@<X8>)
{
  char v91 = a1;
  uint64_t v87 = sub_100004F98(&qword_100062818) - 8;
  __chkstk_darwin(v87);
  uint64_t v86 = (uint64_t *)((char *)&v77 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = sub_10004E660();
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v85 = v3;
  __chkstk_darwin(v3);
  uint64_t v81 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100004F98(&qword_100062A28) - 8;
  __chkstk_darwin(v83);
  char v82 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_100004F98(&qword_100062A30) - 8;
  __chkstk_darwin(v89);
  uint64_t v88 = (uint64_t)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v90 = (uint64_t)&v77 - v8;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10004ED40();
  uint64_t v10 = sub_10004EAD0();
  uint64_t KeyPath = swift_getKeyPath();
  double v93 = *(double *)(v1 + 48);
  double v12 = v93;
  uint64_t v13 = sub_10004EE50();
  sub_10003635C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v108, 0.0, 1, v12, 0, v13, v14, v9, KeyPath, v10);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v92 = v1;
  uint64_t v15 = *(void *)(v1 + 16);
  uint64_t v16 = *(void *)(v1 + 24);
  *(void *)&long long v143 = v15;
  *((void *)&v143 + 1) = v16;
  unint64_t v78 = sub_10000C56C();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10004EBE0();
  uint64_t v19 = v18;
  LOBYTE(v9) = v20 & 1;
  sub_10004EAD0();
  uint64_t v21 = sub_10004EB90();
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v80 = v26;
  swift_release();
  sub_10000C5C0(v17, v19, v9);
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_getKeyPath();
  uint64_t v101 = v21;
  uint64_t v102 = v23;
  char v103 = v25 & 1;
  uint64_t v104 = v80;
  uint64_t v105 = v27;
  uint64_t v106 = 1;
  char v107 = 0;
  sub_10004EE50();
  sub_100036544(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v143, 0.0, 1, v93, 0);
  sub_10000C5C0(v21, v23, v25 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  long long v125 = v151;
  long long v126 = v152;
  uint64_t v127 = v153;
  long long v121 = v147;
  long long v122 = v148;
  long long v123 = v149;
  long long v124 = v150;
  long long v117 = v143;
  long long v118 = v144;
  long long v119 = v145;
  long long v120 = v146;
  uint64_t v28 = *(void *)(v92 + 32);
  uint64_t v79 = *(void *)(v92 + 40);
  uint64_t v80 = v28;
  *(void *)&long long v143 = v28;
  *((void *)&v143 + 1) = v79;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_10004EBE0();
  uint64_t v31 = v30;
  LOBYTE(v19) = v32 & 1;
  sub_10004EA30();
  sub_10004EAB0();
  swift_release();
  uint64_t v33 = sub_10004EB90();
  uint64_t v35 = v34;
  LOBYTE(v21) = v36;
  unint64_t v78 = v37;
  swift_release();
  sub_10000C5C0(v29, v31, v19);
  swift_bridgeObjectRelease();
  uint64_t v38 = swift_getKeyPath();
  uint64_t v94 = v33;
  uint64_t v95 = v35;
  char v96 = v21 & 1;
  unint64_t v97 = v78;
  uint64_t v98 = v38;
  uint64_t v99 = 1;
  char v100 = 0;
  sub_10004EE50();
  sub_100036544(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v143, 0.0, 1, v93, 0);
  sub_10000C5C0(v33, v35, v21 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  long long v136 = v151;
  long long v137 = v152;
  uint64_t v138 = v153;
  long long v132 = v147;
  long long v133 = v148;
  long long v134 = v149;
  long long v135 = v150;
  long long v128 = v143;
  long long v129 = v144;
  long long v130 = v145;
  long long v131 = v146;
  uint64_t v39 = v81;
  sub_10004E650();
  uint64_t v40 = swift_getKeyPath();
  uint64_t v41 = v86;
  uint64_t v43 = v84;
  uint64_t v42 = v85;
  (*(void (**)(char *, char *, uint64_t))(v84 + 16))((char *)v86 + *(int *)(v87 + 36), v39, v85);
  uint64_t v44 = (uint64_t)v41;
  *uint64_t v41 = v40;
  uint64_t v45 = (uint64_t)v82;
  sub_10000509C(v44, (uint64_t)&v82[*(int *)(v83 + 44)], &qword_100062818);
  long long v46 = v137;
  *(_OWORD *)(v45 + 128) = v136;
  *(_OWORD *)(v45 + 144) = v46;
  *(void *)(v45 + 160) = v138;
  long long v47 = v133;
  *(_OWORD *)(v45 + 64) = v132;
  *(_OWORD *)(v45 + 80) = v47;
  long long v48 = v135;
  *(_OWORD *)(v45 + 96) = v134;
  *(_OWORD *)(v45 + 112) = v48;
  long long v49 = v129;
  *(_OWORD *)uint64_t v45 = v128;
  *(_OWORD *)(v45 + 16) = v49;
  long long v50 = v131;
  *(_OWORD *)(v45 + 32) = v130;
  *(_OWORD *)(v45 + 48) = v50;
  sub_1000464C0((uint64_t)&v128);
  sub_100005100(v44, &qword_100062818);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v39, v42);
  sub_100046510((uint64_t)&v128);
  sub_10004EE90();
  uint64_t v51 = sub_10004EE80();
  swift_release();
  uint64_t v52 = v88;
  sub_10000509C(v45, v88, &qword_100062A28);
  uint64_t v53 = (uint64_t *)(v52 + *(int *)(v89 + 44));
  uint64_t v54 = v79;
  uint64_t v55 = v80;
  *uint64_t v53 = v51;
  v53[1] = v55;
  v53[2] = v54;
  swift_bridgeObjectRetain();
  sub_100005100(v45, &qword_100062A28);
  uint64_t v56 = v90;
  sub_10000B630(v52, v90, &qword_100062A30);
  sub_10000509C(v56, v52, &qword_100062A30);
  long long v57 = v115;
  v139[6] = v114;
  v139[7] = v115;
  long long v58 = v110;
  long long v59 = v111;
  v139[2] = v110;
  v139[3] = v111;
  long long v60 = v113;
  long long v61 = v112;
  v139[4] = v112;
  v139[5] = v113;
  long long v62 = v109;
  long long v63 = v108;
  v139[0] = v108;
  v139[1] = v109;
  uint64_t v64 = v91;
  v91[6] = v114;
  v64[7] = v57;
  v64[2] = v58;
  v64[3] = v59;
  v64[4] = v61;
  v64[5] = v60;
  *uint64_t v64 = v63;
  v64[1] = v62;
  uint64_t v65 = v64;
  long long v66 = v125;
  v141[8] = v125;
  v141[9] = v126;
  long long v67 = v120;
  long long v68 = v121;
  v141[4] = v121;
  v141[5] = v122;
  long long v69 = v122;
  long long v70 = v123;
  v141[6] = v123;
  v141[7] = v124;
  v141[0] = v117;
  v141[1] = v118;
  long long v72 = v117;
  long long v71 = v118;
  long long v73 = v119;
  v141[2] = v119;
  v141[3] = v120;
  uint64_t v64 = (_OWORD *)((char *)v64 + 136);
  *(_OWORD *)((char *)v65 + 248) = v124;
  long long v74 = v126;
  v64[8] = v66;
  v64[9] = v74;
  *(_OWORD *)((char *)v65 + 184) = v67;
  *(_OWORD *)((char *)v65 + 200) = v68;
  *(_OWORD *)((char *)v65 + 216) = v69;
  *(_OWORD *)((char *)v65 + 232) = v70;
  *(_OWORD *)((char *)v65 + 136) = v72;
  *(_OWORD *)((char *)v65 + 152) = v71;
  uint64_t v140 = v116;
  *((void *)v65 + 16) = v116;
  uint64_t v142 = v127;
  *((void *)v65 + 37) = v127;
  *(_OWORD *)((char *)v65 + 168) = v73;
  uint64_t v75 = sub_100004F98(&qword_100062A38);
  sub_10000509C(v52, (uint64_t)v65 + *(int *)(v75 + 64), &qword_100062A30);
  sub_100046560((uint64_t)v139);
  sub_1000464C0((uint64_t)v141);
  sub_100005100(v56, &qword_100062A30);
  sub_100005100(v52, &qword_100062A30);
  long long v151 = v125;
  long long v152 = v126;
  uint64_t v153 = v127;
  long long v147 = v121;
  long long v148 = v122;
  long long v149 = v123;
  long long v150 = v124;
  long long v143 = v117;
  long long v144 = v118;
  long long v145 = v119;
  long long v146 = v120;
  sub_100046510((uint64_t)&v143);
  v154[6] = v114;
  v154[7] = v115;
  uint64_t v155 = v116;
  v154[2] = v110;
  v154[3] = v111;
  v154[4] = v112;
  v154[5] = v113;
  v154[0] = v108;
  v154[1] = v109;
  return sub_1000465A8((uint64_t)v154);
}

uint64_t sub_100044AB4@<X0>(_OWORD *a1@<X8>)
{
  return sub_1000441D8(a1);
}

uint64_t sub_100044AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v29 = a3;
  uint64_t v5 = sub_10004E970();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004E930();
  __chkstk_darwin(v8);
  uint64_t v9 = sub_100004F98(&qword_1000629E0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100004F98(&qword_1000629E8);
  uint64_t v28 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004E5A0();
  sub_100045F08(v15);
  uint64_t v30 = a2;
  uint64_t v31 = a1;
  sub_10004E8C0();
  LODWORD(v32) = 0;
  sub_100046164(&qword_1000629F0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_10004F4A0();
  sub_100004F98(&qword_1000629F8);
  sub_10000566C(&qword_100062A00, &qword_1000629F8);
  sub_10004EEB0();
  sub_10004E950();
  uint64_t v16 = sub_10000566C(&qword_100062A08, &qword_1000629E0);
  sub_10004EC90();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v27);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v32 = sub_1000456E0();
  uint64_t v33 = v17;
  sub_10000C56C();
  uint64_t v18 = sub_10004EBE0();
  uint64_t v20 = v19;
  LOBYTE(v12) = v21 & 1;
  uint64_t v32 = v9;
  uint64_t v33 = v16;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v25;
  sub_10004EC50();
  sub_10000C5C0(v18, v20, (char)v12);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v14, v22);
}

uint64_t sub_100044F0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10004B0E4(*(id *)(a1 + 24), *(id *)(a1 + 32));
  sub_10000C56C();
  uint64_t v4 = sub_10004F2B0();
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_100045538((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10004A1B4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10004A1C8);
  uint64_t v7 = v6;
  sub_10004E5A0();
  double v9 = v8;
  uint64_t v10 = self;
  id v11 = [v10 mainBundle];
  NSString v12 = sub_10004F0D0();
  NSString v13 = sub_10004F0D0();
  id v14 = [v11 localizedStringForKey:v12 value:0 table:v13];

  sub_10004F0F0();
  uint64_t v37 = sub_10004F2B0();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  id v17 = sub_100045338();
  uint64_t v35 = v18;
  id v36 = v17;
  sub_10004E5A0();
  unint64_t v20 = 0xED00006C6C6F722ELL;
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    unint64_t v20 = 0xEE00646E6174732ELL;
  }
  unint64_t v34 = v20;
  double v21 = v19 / 3.0;
  id v22 = [v10 mainBundle];
  NSString v23 = sub_10004F0D0();
  NSString v24 = sub_10004F0D0();
  id v25 = [v22 localizedStringForKey:v23 value:0 table:v24];

  sub_10004F0F0();
  uint64_t v26 = sub_10004F2B0();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_100045538((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10004A31C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10004A330);
  uint64_t v31 = v30;
  sub_10004E5A0();
  strcpy((char *)a2, "activity.move");
  *(_WORD *)(a2 + 14) = -4864;
  *(void *)(a2 + 16) = v40;
  *(void *)(a2 + 24) = v39;
  *(void *)(a2 + 32) = v38;
  *(void *)(a2 + 40) = v7;
  *(double *)(a2 + 48) = v9 / 3.0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0xD000000000000011;
  *(void *)(a2 + 72) = 0x80000001000593F0;
  *(void *)(a2 + 80) = v37;
  *(void *)(a2 + 88) = v16;
  *(void *)(a2 + 96) = v36;
  *(void *)(a2 + 104) = v35;
  *(double *)(a2 + 112) = v21;
  *(void *)(a2 + 120) = 0x3FC3333333333333;
  *(void *)(a2 + 128) = 0x7974697669746361;
  *(void *)(a2 + 136) = v34;
  *(void *)(a2 + 144) = v26;
  *(void *)(a2 + 152) = v28;
  *(void *)(a2 + 160) = v29;
  *(void *)(a2 + 168) = v31;
  *(double *)(a2 + 176) = v32 / 3.0;
  *(void *)(a2 + 184) = 0x3FD3333333333333;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id sub_100045338()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v3 = (void *)v0[6];
  id v5 = sub_10004A308(v1, v2, v4, (uint64_t)v3);
  id v6 = [self mainBundle];
  NSString v7 = sub_10004F0D0();
  NSString v8 = sub_10004F0D0();
  id v9 = [v6 localizedStringForKey:v7 value:0 table:v8];

  uint64_t v10 = sub_10004F0F0();
  NSString v12 = v11;

  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = v10;
  v19._object = v12;
  sub_10004F120(v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v13 = v5;
  if (!v2) {
    goto LABEL_4;
  }
  id v14 = v2;
  if ([v14 paused])
  {

LABEL_4:
    swift_bridgeObjectRetain();
LABEL_7:
    swift_bridgeObjectRetain();
    v20._countAndFlagsBits = v4;
    v20._object = v3;
    sub_10004F120(v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13;
  }
  id v15 = [v14 exerciseTimeGoal];
  id result = [v1 localizedStringWithBriskMinutes:v15];
  if (result)
  {
    id v17 = result;
    uint64_t v4 = sub_10004F0F0();
    uint64_t v3 = v18;

    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100045538(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[5];
  uint64_t v6 = v2[6];
  uint64_t v7 = a1(v3, v4, v5, v6);
  id v8 = [self mainBundle];
  NSString v9 = sub_10004F0D0();
  NSString v10 = sub_10004F0D0();
  id v11 = [v8 localizedStringForKey:v9 value:0 table:v10];

  uint64_t v12 = sub_10004F0F0();
  id v14 = v13;

  swift_bridgeObjectRetain();
  v20._countAndFlagsBits = v12;
  v20._object = v14;
  sub_10004F120(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = a2(v3, v4, v5, v6);
  id v17 = v16;
  swift_bridgeObjectRetain();
  v21._countAndFlagsBits = v15;
  v21._object = v17;
  sub_10004F120(v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000456E0()
{
  uint64_t v1 = v0;
  sub_10000B630(v0 + 16, (uint64_t)v41, (uint64_t *)&unk_100061990);
  sub_10000B630((uint64_t)v41, (uint64_t)&v42, (uint64_t *)&unk_100061990);
  if (v42 && [v42 paused])
  {
    id v2 = [self mainBundle];
    NSString v3 = sub_10004F0D0();
    NSString v4 = sub_10004F0D0();
    id v5 = [v2 localizedStringForKey:v3 value:0 table:v4];

    uint64_t v6 = sub_10004F0F0();
  }
  else
  {
    uint64_t v7 = self;
    id v8 = [v7 mainBundle];
    NSString v9 = sub_10004F0D0();
    NSString v10 = sub_10004F0D0();
    id v11 = [v8 localizedStringForKey:v9 value:0 table:v10];

    uint64_t v12 = sub_10004F0F0();
    id v13 = *(void **)(v1 + 32);
    sub_10004AA6C(v13);
    uint64_t v15 = v14;
    id v17 = v16;
    swift_bridgeObjectRetain();
    v43._countAndFlagsBits = v15;
    v43._object = v17;
    sub_10004F120(v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v12;
    id v19 = [v7 mainBundle];
    NSString v20 = sub_10004F0D0();
    NSString v21 = sub_10004F0D0();
    id v22 = [v19 localizedStringForKey:v20 value:0 table:v21];

    uint64_t v23 = sub_10004F0F0();
    id v25 = v24;

    swift_bridgeObjectRetain();
    v44._countAndFlagsBits = v23;
    v44._object = v25;
    sub_10004F120(v44);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10004B20C(v13);
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    swift_bridgeObjectRetain();
    v45._countAndFlagsBits = v27;
    v45._object = v29;
    sub_10004F120(v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v30 = [v7 mainBundle];
    NSString v31 = sub_10004F0D0();
    NSString v32 = sub_10004F0D0();
    id v33 = [v30 localizedStringForKey:v31 value:0 table:v32];

    uint64_t v34 = sub_10004F0F0();
    id v36 = v35;

    swift_bridgeObjectRetain();
    v46._countAndFlagsBits = v34;
    v46._object = v36;
    sub_10004F120(v46);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v37 = sub_10004B4E8(v13);
    uint64_t v39 = v38;
    swift_bridgeObjectRetain();
    v47._countAndFlagsBits = v37;
    v47._object = v39;
    sub_10004F120(v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v18;
  }
  return v6;
}

id sub_100045B60()
{
  return sub_10004334C();
}

uint64_t sub_100045BA4()
{
  return sub_10004E710();
}

uint64_t sub_100045BC8(uint64_t a1)
{
  uint64_t v2 = sub_10004E660();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_10004E720();
}

uint64_t sub_100045C90@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004E730();
  *a1 = v3;
  return result;
}

uint64_t sub_100045CBC()
{
  return sub_10004E740();
}

ValueMetadata *type metadata accessor for RectangularView()
{
  return &type metadata for RectangularView;
}

uint64_t sub_100045CF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100045D10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_100045D70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100044AF0(a1, v2 + 16, a2);
}

unint64_t sub_100045D78()
{
  unint64_t result = qword_1000629A0;
  if (!qword_1000629A0)
  {
    sub_1000053B0(&qword_100062990);
    sub_1000053B0(&qword_1000629A8);
    sub_10000566C(&qword_1000629B0, &qword_1000629A8);
    swift_getOpaqueTypeConformance2();
    sub_100046164((unint64_t *)&qword_100061628, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000629A0);
  }
  return result;
}

uint64_t sub_100045E84@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004E730();
  *a1 = v3;
  return result;
}

uint64_t sub_100045EB0()
{
  return sub_10004E740();
}

uint64_t sub_100045ED8()
{
  return sub_10004E710();
}

uint64_t sub_100045F08(double a1)
{
  uint64_t v2 = sub_10004EE10();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100004F98(&qword_100062A10);
  sub_10004EE20();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100051550;
  *uint64_t v5 = 0x4034000000000000;
  uint64_t v7 = enum case for GridItem.Size.fixed(_:);
  id v8 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
  v8(v5, enum case for GridItem.Size.fixed(_:), v2);
  sub_10004EE60();
  sub_10004EE30();
  *(_OWORD *)uint64_t v5 = xmmword_100051560;
  v8(v5, enum case for GridItem.Size.flexible(_:), v2);
  sub_10004EE60();
  sub_10004EE30();
  *(double *)uint64_t v5 = a1 * 0.5 + 6.0;
  v8(v5, v7, v2);
  sub_10004EE60();
  sub_10004EE30();
  return v6;
}

uint64_t sub_10004615C@<X0>(uint64_t a1@<X8>)
{
  return sub_100044F0C(*(void *)(v1 + 16), a1);
}

uint64_t sub_100046164(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for RectangularView.GridRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RectangularView.GridRow(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RectangularView.GridRow(void *a1, void *a2)
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
  return a1;
}

uint64_t assignWithTake for RectangularView.GridRow(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for RectangularView.GridRow(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RectangularView.GridRow(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RectangularView.GridRow()
{
  return &type metadata for RectangularView.GridRow;
}

unint64_t sub_1000463FC()
{
  unint64_t result = qword_100062A18;
  if (!qword_100062A18)
  {
    sub_1000053B0(&qword_100062A20);
    sub_100045D78();
    sub_10000566C(&qword_1000629B8, &qword_100062998);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062A18);
  }
  return result;
}

uint64_t sub_10004649C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000464C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100046510(uint64_t a1)
{
  return a1;
}

uint64_t sub_100046560(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000465A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000465F0()
{
  return sub_10000566C(&qword_100062A40, &qword_100062A48);
}

void sub_10004662C(char a1@<W0>, void *a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, void *a6@<X5>, uint64_t *a7@<X8>)
{
  *a7 = swift_getKeyPath();
  sub_100004F98(&qword_100061B90);
  swift_storeEnumTagMultiPayload();
  NSString v9 = (int *)type metadata accessor for StandaloneMetricsStack();
  uint64_t v10 = (uint64_t *)((char *)a7 + v9[5]);
  uint64_t *v10 = swift_getKeyPath();
  sub_100004F98(&qword_100061B88);
  swift_storeEnumTagMultiPayload();
  id v11 = (uint64_t *)((char *)a7 + v9[6]);
  *id v11 = swift_getKeyPath();
  sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (uint64_t *)((char *)a7 + v9[14]);
  id v13 = self;
  id v14 = [v13 mainBundle];
  NSString v15 = sub_10004F0D0();
  NSString v16 = sub_10004F0D0();
  id v17 = [v14 localizedStringForKey:v15 value:0 table:v16];

  uint64_t v18 = sub_10004F0F0();
  uint64_t v20 = v19;

  uint64_t *v12 = v18;
  v12[1] = v20;
  *((unsigned char *)a7 + v9[7]) = a1;
  *(uint64_t *)((char *)a7 + v9[8]) = (uint64_t)a2;
  *((unsigned char *)a7 + v9[12]) = a5;
  *((unsigned char *)a7 + v9[9]) = a3;
  id v21 = a2;
  if (a6) {
    unsigned __int8 v22 = [a6 paused];
  }
  else {
    unsigned __int8 v22 = 0;
  }
  *((unsigned char *)a7 + v9[10]) = v22;
  *((unsigned char *)a7 + v9[11]) = a4 & 1;
  *(uint64_t *)((char *)a7 + v9[13]) = (uint64_t)a6;
  id v23 = a6;
  id v24 = [v13 mainBundle];
  NSString v25 = sub_10004F0D0();
  NSString v26 = sub_10004F0D0();
  id v27 = [v24 localizedStringForKey:v25 value:0 table:v26];

  uint64_t v28 = sub_10004F0F0();
  uint64_t v30 = v29;

  NSString v31 = (uint64_t *)((char *)a7 + v9[15]);
  void *v31 = v21;
  v31[1] = a6;
  v31[2] = v28;
  v31[3] = v30;
}

uint64_t sub_100046910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004F98(&qword_100062B10);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v9 = (char *)&v13 - v8;
  *(void *)NSString v9 = sub_10004E8D0();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v10 = sub_100004F98(&qword_100062B18);
  sub_100046A30(a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  sub_10000509C((uint64_t)v9, (uint64_t)v6, &qword_100062B10);
  sub_10000509C((uint64_t)v6, a2, &qword_100062B10);
  uint64_t v11 = a2 + *(int *)(sub_100004F98(&qword_100062B20) + 48);
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 0;
  sub_100005100((uint64_t)v9, &qword_100062B10);
  return sub_100005100((uint64_t)v6, &qword_100062B10);
}

uint64_t sub_100046A30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v275 = a2;
  uint64_t v3 = (int *)type metadata accessor for StandaloneMetricsStack();
  __chkstk_darwin(v3);
  v246 = (char *)&v241 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v267 = sub_10004EFA0();
  uint64_t v280 = *(void *)(v267 - 8);
  __chkstk_darwin(v267);
  v266 = (char *)&v241 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v265 = (uint64_t)&v241 - v7;
  uint64_t v269 = type metadata accessor for StandaloneMetricView();
  __chkstk_darwin(v269);
  uint64_t v249 = (uint64_t)&v241 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v268 = (uint64_t *)((char *)&v241 - v10);
  __chkstk_darwin(v11);
  uint64_t v243 = (uint64_t)&v241 - v12;
  uint64_t v272 = sub_100004F98(&qword_100062B28);
  uint64_t v283 = *(void *)(v272 - 8);
  __chkstk_darwin(v272);
  v250 = (char *)&v241 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v244 = (char *)&v241 - v15;
  uint64_t v270 = sub_100004F98(&qword_100062B30);
  __chkstk_darwin(v270);
  uint64_t v252 = (uint64_t)&v241 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v253 = (uint64_t)&v241 - v18;
  __chkstk_darwin(v19);
  v248 = (char *)&v241 - v20;
  __chkstk_darwin(v21);
  v247 = (char *)&v241 - v22;
  __chkstk_darwin(v23);
  uint64_t v251 = (uint64_t)&v241 - v24;
  __chkstk_darwin(v25);
  v242 = (char *)&v241 - v26;
  __chkstk_darwin(v27);
  v241 = (char *)&v241 - v28;
  __chkstk_darwin(v29);
  uint64_t v284 = (uint64_t)&v241 - v30;
  uint64_t v31 = sub_100004F98(&qword_100062B38);
  __chkstk_darwin(v31 - 8);
  v274 = (char **)((char *)&v241 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v33);
  uint64_t v273 = (uint64_t)&v241 - v34;
  uint64_t v289 = sub_10004E970();
  uint64_t v291 = *(void *)(v289 - 8);
  __chkstk_darwin(v289);
  v288 = (char *)&v241 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v254 = type metadata accessor for FractionView();
  __chkstk_darwin(v254);
  uint64_t v37 = (uint64_t *)((char *)&v241 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v259 = sub_100004F98(&qword_100062B40);
  v258 = *(void (***)(char *, uint64_t))(v259 - 8);
  __chkstk_darwin(v259);
  v257 = (char *)&v241 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v256 = sub_100004F98(&qword_100062B48);
  __chkstk_darwin(v256);
  v255 = (char *)&v241 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  v286 = (char *)&v241 - v41;
  __chkstk_darwin(v42);
  uint64_t v285 = (uint64_t)&v241 - v43;
  uint64_t v44 = type metadata accessor for HeaderLabel();
  uint64_t v45 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  Swift::String v47 = (char *)&v241 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v48);
  long long v50 = (char *)&v241 - v49;
  uint64_t v51 = sub_100004F98(&qword_100062B50);
  __chkstk_darwin(v51 - 8);
  uint64_t v245 = (uint64_t)&v241 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v53);
  uint64_t v271 = (uint64_t)&v241 - v54;
  __chkstk_darwin(v55);
  uint64_t v276 = (uint64_t)&v241 - v56;
  __chkstk_darwin(v57);
  uint64_t v281 = (uint64_t)&v241 - v58;
  __n128 v60 = __chkstk_darwin(v59);
  uint64_t v260 = v3[11];
  BOOL v61 = *(unsigned char *)(a1 + v260) == 1;
  uint64_t v287 = a1;
  uint64_t v282 = (uint64_t)&v241 - v62;
  v292 = v3;
  uint64_t v279 = v44;
  uint64_t v278 = v45;
  if (v61)
  {
    uint64_t v63 = a1;
    id v64 = [self mainBundle];
    NSString v65 = sub_10004F0D0();
    NSString v66 = sub_10004F0D0();
    id v67 = [v64 localizedStringForKey:v65 value:0 table:v66];

    uint64_t v3 = v292;
    uint64_t v68 = sub_10004F0F0();
    uint64_t v70 = v69;

    if (*(unsigned char *)(v63 + v3[10]) == 1)
    {
      if (qword_100061198 != -1) {
        swift_once();
      }
      long long v71 = &qword_1000648C0;
    }
    else
    {
      if (qword_100061140 != -1) {
        swift_once();
      }
      long long v71 = &qword_100064868;
    }
    uint64_t v72 = v282;
    uint64_t v73 = *v71;
    swift_retain();
    uint64_t v293 = 0x4026000000000000;
    sub_10000C27C();
    sub_10004E550();
    uint64_t v74 = v279;
    uint64_t v75 = (uint64_t *)&v47[*(int *)(v279 + 20)];
    *uint64_t v75 = v68;
    v75[1] = v70;
    *(void *)&v47[*(int *)(v74 + 24)] = v73;
    sub_10004A0EC((uint64_t)v47, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for HeaderLabel);
    sub_10004A0EC((uint64_t)v50, v72, (uint64_t (*)(void))type metadata accessor for HeaderLabel);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v278 + 56))(v72, 0, 1, v74);
  }
  else
  {
    (*(void (**)(__n128))(v45 + 56))(v60);
  }
  uint64_t v76 = v287;
  uint64_t v77 = sub_10004862C();
  uint64_t v78 = v76 + v3[15];
  uint64_t v79 = *(void **)v78;
  uint64_t v80 = *(void **)(v78 + 8);
  uint64_t v81 = *(void *)(v78 + 16);
  uint64_t v82 = *(void *)(v78 + 24);
  sub_10004A1B4(*(void **)v78, v80, v81, v82);
  uint64_t v290 = v83;
  v262 = v84;
  sub_10004A1C8(v79, v80, v81, v82);
  uint64_t v86 = v85;
  unint64_t v261 = v87;
  id v88 = sub_1000487E8();
  uint64_t v90 = v89;
  uint64_t v264 = v292[7];
  LOBYTE(v79) = *(unsigned char *)(v76 + v264);
  *uint64_t v37 = swift_getKeyPath();
  sub_100004F98(&qword_100061D50);
  swift_storeEnumTagMultiPayload();
  char v91 = (int *)v254;
  uint64_t v92 = (uint64_t *)((char *)v37 + *(int *)(v254 + 20));
  uint64_t *v92 = swift_getKeyPath();
  uint64_t v263 = sub_100004F98(&qword_100061D88);
  swift_storeEnumTagMultiPayload();
  uint64_t v293 = 0x4034000000000000;
  unint64_t v277 = sub_10000C27C();
  sub_10004E550();
  *(uint64_t *)((char *)v37 + v91[7]) = v77;
  double v93 = (uint64_t *)((char *)v37 + v91[8]);
  uint64_t v94 = v262;
  void *v93 = v290;
  v93[1] = v94;
  uint64_t v95 = (uint64_t *)((char *)v37 + v91[9]);
  unint64_t v96 = v261;
  *uint64_t v95 = v86;
  v95[1] = v96;
  unint64_t v97 = (uint64_t *)((char *)v37 + v91[10]);
  void *v97 = v88;
  v97[1] = v90;
  *((unsigned char *)v37 + v91[11]) = (_BYTE)v79;
  *(uint64_t *)((char *)v37 + v91[12]) = 0;
  uint64_t v98 = v288;
  sub_10004E950();
  uint64_t v99 = sub_100049FE0(&qword_100061FF0, (void (*)(uint64_t))type metadata accessor for FractionView);
  char v100 = v257;
  sub_10004EC90();
  uint64_t v101 = *(void (**)(void, void))(v291 + 8);
  v291 += 8;
  v262 = v101;
  v101(v98, v289);
  sub_10004A08C((uint64_t)v37, (uint64_t (*)(void))type metadata accessor for FractionView);
  uint64_t v290 = v78;
  sub_10004AA6C(*(id *)(v78 + 8));
  uint64_t v293 = v102;
  uint64_t v294 = v103;
  unint64_t v261 = sub_10000C56C();
  uint64_t v104 = sub_10004EBE0();
  uint64_t v106 = v105;
  LOBYTE(v90) = v107 & 1;
  uint64_t v293 = (uint64_t)v91;
  uint64_t v294 = v99;
  uint64_t v108 = v76;
  swift_getOpaqueTypeConformance2();
  uint64_t v109 = (uint64_t)v255;
  uint64_t v110 = v259;
  sub_10004EC50();
  uint64_t v111 = v106;
  long long v112 = v292;
  sub_10000C5C0(v104, v111, v90);
  swift_bridgeObjectRelease();
  v258[1](v100, v110);
  uint64_t v113 = (uint64_t)v286;
  sub_10004E610();
  sub_100005100(v109, &qword_100062B48);
  uint64_t v114 = v285;
  sub_10000B630(v113, v285, &qword_100062B48);
  if (*(unsigned char *)(v108 + v112[12]) == 1)
  {
    uint64_t v115 = v280;
    if (*(unsigned char *)(v108 + v260) == 1)
    {
      id v116 = [self mainBundle];
      NSString v117 = sub_10004F0D0();
      NSString v118 = sub_10004F0D0();
      id v119 = [v116 localizedStringForKey:v117 value:0 table:v118];

      uint64_t v120 = sub_10004F0F0();
      uint64_t v122 = v121;

      uint64_t v123 = v279;
      uint64_t v124 = v278;
      if (qword_100061140 != -1) {
        swift_once();
      }
      uint64_t v125 = qword_100064868;
      uint64_t v293 = 0x4026000000000000;
      swift_retain();
      uint64_t v126 = v281;
      sub_10004E550();
      uint64_t v127 = (uint64_t *)(v126 + *(int *)(v123 + 20));
      *uint64_t v127 = v120;
      v127[1] = v122;
      *(void *)(v126 + *(int *)(v123 + 24)) = v125;
      long long v128 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v124 + 56);
      v128(v126, 0, 1, v123);
      uint64_t v108 = v287;
    }
    else
    {
      long long v128 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v278 + 56);
      v128(v281, 1, 1, v279);
    }
    uint64_t v133 = v265;
    v257 = (char *)(v108 + v112[6]);
    sub_10001DE90(v265);
    long long v134 = v266;
    sub_10004EF90();
    char v135 = sub_10004EF80();
    long long v137 = *(void (***)(char *, uint64_t))(v115 + 8);
    uint64_t v136 = v115 + 8;
    uint64_t v138 = v134;
    uint64_t v139 = v267;
    ((void (*)(char *, uint64_t))v137)(v138, v267);
    v258 = v137;
    ((void (*)(uint64_t, uint64_t))v137)(v133, v139);
    if (v135)
    {
      if (qword_100061180 != -1) {
        swift_once();
      }
      uint64_t v140 = qword_1000648A8;
      swift_retain();
    }
    else
    {
      uint64_t v140 = sub_10004ECD0();
    }
    uint64_t v141 = *(void **)(v290 + 8);
    uint64_t v142 = *(void *)(v290 + 16);
    uint64_t v143 = *(void *)(v290 + 24);
    uint64_t v280 = v136;
    uint64_t v259 = (uint64_t)v128;
    if (v141)
    {
      id v144 = v141;
      id v145 = [v144 stepCount];
      id v146 = [self countUnit];
      [v145 doubleValueForUnit:v146];
      double v148 = v147;

      long long v149 = self;
      id v150 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v148];
      id v151 = [v149 stringWithNumber:v150 decimalPrecision:1 roundingMode:4];

      if (v151)
      {
        uint64_t v142 = sub_10004F0F0();
        uint64_t v143 = v152;

        goto LABEL_28;
      }
    }
    swift_bridgeObjectRetain();
LABEL_28:
    uint64_t v153 = v287;
    char v154 = *(unsigned char *)(v287 + v264);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v156 = (uint64_t)v268;
    uint64_t *v268 = KeyPath;
    uint64_t v256 = sub_100004F98(&qword_100061B90);
    swift_storeEnumTagMultiPayload();
    uint64_t v157 = (int *)v269;
    uint64_t v158 = (uint64_t *)(v156 + *(int *)(v269 + 20));
    *uint64_t v158 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    uint64_t v293 = 0x4034000000000000;
    sub_10004E550();
    *(void *)(v156 + v157[7]) = v140;
    uint64_t v159 = (uint64_t *)(v156 + v157[8]);
    *uint64_t v159 = v142;
    v159[1] = v143;
    uint64_t v160 = v153;
    uint64_t v161 = (void *)(v156 + v157[9]);
    *uint64_t v161 = 0;
    v161[1] = 0xE000000000000000;
    *(unsigned char *)(v156 + v157[10]) = v154;
    uint64_t v162 = v243;
    sub_10004A0EC(v156, v243, (uint64_t (*)(void))type metadata accessor for StandaloneMetricView);
    uint64_t v163 = v288;
    sub_10004E950();
    uint64_t v164 = sub_100049FE0(&qword_100062B68, (void (*)(uint64_t))type metadata accessor for StandaloneMetricView);
    uint64_t v165 = v244;
    sub_10004EC90();
    v262(v163, v289);
    sub_10004A08C(v162, (uint64_t (*)(void))type metadata accessor for StandaloneMetricView);
    sub_10004C0AC(*(void **)(v290 + 8));
    uint64_t v293 = v166;
    uint64_t v294 = v167;
    uint64_t v168 = sub_10004EBE0();
    uint64_t v170 = v169;
    char v172 = v171 & 1;
    uint64_t v293 = (uint64_t)v157;
    uint64_t v294 = v164;
    v255 = (char *)v164;
    uint64_t v173 = 1;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v175 = (uint64_t)v242;
    uint64_t v176 = v272;
    uint64_t v254 = OpaqueTypeConformance2;
    sub_10004EC50();
    sub_10000C5C0(v168, v170, v172);
    swift_bridgeObjectRelease();
    v177 = *(char **)(v283 + 8);
    v283 += 8;
    v244 = v177;
    ((void (*)(char *, uint64_t))v177)(v165, v176);
    uint64_t v178 = (uint64_t)v241;
    sub_10004E610();
    sub_100005100(v175, &qword_100062B30);
    sub_10000B630(v178, v284, &qword_100062B30);
    uint64_t v179 = (uint64_t)v246;
    uint64_t v180 = v279;
    uint64_t v181 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v259;
    if (*(unsigned char *)(v160 + v260) == 1)
    {
      id v182 = [self mainBundle];
      NSString v183 = sub_10004F0D0();
      NSString v184 = sub_10004F0D0();
      id v185 = [v182 localizedStringForKey:v183 value:0 table:v184];

      uint64_t v186 = sub_10004F0F0();
      uint64_t v188 = v187;

      if (qword_100061140 != -1) {
        swift_once();
      }
      uint64_t v189 = qword_100064868;
      uint64_t v293 = 0x4026000000000000;
      swift_retain();
      uint64_t v190 = v276;
      sub_10004E550();
      uint64_t v173 = 0;
      long long v191 = (uint64_t *)(v190 + *(int *)(v180 + 20));
      *long long v191 = v186;
      v191[1] = v188;
      *(void *)(v190 + *(int *)(v180 + 24)) = v189;
    }
    v181(v276, v173, 1, v180);
    uint64_t v192 = v265;
    sub_10001DE90(v265);
    long long v193 = v266;
    sub_10004EF90();
    char v194 = sub_10004EF80();
    char v195 = v193;
    uint64_t v196 = v267;
    uint64_t v197 = v258;
    ((void (*)(char *, uint64_t))v258)(v195, v267);
    ((void (*)(uint64_t, uint64_t))v197)(v192, v196);
    if (v194)
    {
      if (qword_100061180 != -1) {
        swift_once();
      }
      uint64_t v198 = qword_1000648A8;
      swift_retain();
    }
    else
    {
      uint64_t v198 = sub_10004ECD0();
    }
    id v199 = sub_10004A40C(*(void **)v290, *(void **)(v290 + 8), *(void *)(v290 + 16));
    uint64_t v201 = v200;
    uint64_t v202 = v292;
    int v203 = *(unsigned __int8 *)(v160 + v292[9]);
    sub_10004A028(v160, v179);
    if (v203 == 1)
    {
      sub_10004A08C(v179, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
    }
    else
    {
      int v204 = *(unsigned __int8 *)(v179 + v202[10]);
      sub_10004A08C(v179, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
      if (v204 != 1)
      {
        id v205 = sub_10004C4B8(*(void **)v290);
        unint64_t v206 = v207;
        goto LABEL_42;
      }
    }
    id v205 = 0;
    unint64_t v206 = 0xE000000000000000;
LABEL_42:
    char v208 = *(unsigned char *)(v160 + v264);
    uint64_t v209 = swift_getKeyPath();
    uint64_t v210 = (uint64_t)v268;
    uint64_t *v268 = v209;
    swift_storeEnumTagMultiPayload();
    long long v211 = (int *)v269;
    long long v212 = (uint64_t *)(v210 + *(int *)(v269 + 20));
    *long long v212 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    uint64_t v293 = 0x4034000000000000;
    sub_10004E550();
    *(void *)(v210 + v211[7]) = v198;
    long long v213 = (void *)(v210 + v211[8]);
    *long long v213 = v199;
    v213[1] = v201;
    long long v214 = (void *)(v210 + v211[9]);
    *long long v214 = v205;
    v214[1] = v206;
    *(unsigned char *)(v210 + v211[10]) = v208;
    uint64_t v215 = v249;
    sub_10004A0EC(v210, v249, (uint64_t (*)(void))type metadata accessor for StandaloneMetricView);
    v216 = v288;
    sub_10004E950();
    v217 = v250;
    sub_10004EC90();
    v262(v216, v289);
    sub_10004A08C(v215, (uint64_t (*)(void))type metadata accessor for StandaloneMetricView);
    uint64_t v293 = (uint64_t)sub_10004C264(*(void **)v290, *(void **)(v290 + 8));
    uint64_t v294 = v218;
    uint64_t v219 = sub_10004EBE0();
    uint64_t v221 = v220;
    char v223 = v222 & 1;
    uint64_t v224 = (uint64_t)v248;
    uint64_t v225 = v272;
    sub_10004EC50();
    sub_10000C5C0(v219, v221, v223);
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v244)(v217, v225);
    uint64_t v226 = (uint64_t)v247;
    sub_10004E610();
    sub_100005100(v224, &qword_100062B30);
    uint64_t v227 = v251;
    sub_10000B630(v226, v251, &qword_100062B30);
    uint64_t v228 = v271;
    sub_10000509C(v281, v271, &qword_100062B50);
    uint64_t v229 = v253;
    sub_10000509C(v284, v253, &qword_100062B30);
    uint64_t v230 = v276;
    uint64_t v231 = v245;
    sub_10000509C(v276, v245, &qword_100062B50);
    uint64_t v232 = v252;
    sub_10000509C(v227, v252, &qword_100062B30);
    uint64_t v131 = (uint64_t)v274;
    void *v274 = 0;
    *(unsigned char *)(v131 + 8) = 0;
    v233 = (int *)sub_100004F98(&qword_100062B70);
    sub_10000509C(v228, v131 + v233[12], &qword_100062B50);
    sub_10000509C(v229, v131 + v233[16], &qword_100062B30);
    uint64_t v234 = v131 + v233[20];
    *(void *)uint64_t v234 = 0;
    *(unsigned char *)(v234 + 8) = 0;
    sub_10000509C(v231, v131 + v233[24], &qword_100062B50);
    uint64_t v235 = v233[28];
    uint64_t v132 = v228;
    sub_10000509C(v232, v131 + v235, &qword_100062B30);
    sub_100005100(v227, &qword_100062B30);
    sub_100005100(v230, &qword_100062B50);
    sub_100005100(v284, &qword_100062B30);
    sub_100005100(v281, &qword_100062B50);
    sub_100005100(v232, &qword_100062B30);
    sub_100005100(v231, &qword_100062B50);
    sub_100005100(v229, &qword_100062B30);
    sub_100005100(v228, &qword_100062B50);
    uint64_t v236 = sub_100004F98(&qword_100062B58);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v236 - 8) + 56))(v131, 0, 1, v236);
    uint64_t v130 = v273;
    sub_10000B630(v131, v273, &qword_100062B38);
    uint64_t v114 = v285;
    uint64_t v113 = (uint64_t)v286;
    goto LABEL_43;
  }
  uint64_t v129 = sub_100004F98(&qword_100062B58);
  uint64_t v130 = v273;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v129 - 8) + 56))(v273, 1, 1, v129);
  uint64_t v131 = (uint64_t)v274;
  uint64_t v132 = v271;
LABEL_43:
  uint64_t v237 = v282;
  sub_10000509C(v282, v132, &qword_100062B50);
  sub_10000509C(v114, v113, &qword_100062B48);
  sub_10000509C(v130, v131, &qword_100062B38);
  uint64_t v238 = v275;
  sub_10000509C(v132, v275, &qword_100062B50);
  uint64_t v239 = sub_100004F98(&qword_100062B60);
  sub_10000509C(v113, v238 + *(int *)(v239 + 48), &qword_100062B48);
  sub_10000509C(v131, v238 + *(int *)(v239 + 64), &qword_100062B38);
  sub_100005100(v130, &qword_100062B38);
  sub_100005100(v114, &qword_100062B48);
  sub_100005100(v237, &qword_100062B50);
  sub_100005100(v131, &qword_100062B38);
  sub_100005100(v113, &qword_100062B48);
  return sub_100005100(v132, &qword_100062B50);
}

uint64_t sub_10004862C()
{
  uint64_t v1 = sub_10004EFA0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v11 - v6;
  if (*(unsigned char *)(v0 + *(int *)(type metadata accessor for StandaloneMetricsStack() + 40)) == 1)
  {
    if (qword_100061198 == -1) {
      return swift_retain();
    }
LABEL_8:
    swift_once();
    return swift_retain();
  }
  sub_10001DE90((uint64_t)v7);
  sub_10004EF90();
  char v9 = sub_10004EF80();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v4, v1);
  v10(v7, v1);
  if (v9)
  {
    if (qword_100061148 == -1) {
      return swift_retain();
    }
    goto LABEL_8;
  }
  return sub_10004ECD0();
}

id sub_1000487E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004E5F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (int *)type metadata accessor for StandaloneMetricsStack();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v22 - v10;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v22 - v13;
  char v16 = *(unsigned char *)(v1 + *(int *)(v15 + 36));
  sub_10004A028(v1, (uint64_t)&v22 - v13);
  if (v16)
  {
    sub_10004A08C((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
    sub_10004A028(v1, (uint64_t)v11);
LABEL_4:
    uint64_t v18 = (uint64_t)v11;
LABEL_5:
    sub_10004A08C(v18, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
    return 0;
  }
  char v17 = v14[v6[10]];
  sub_10004A08C((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
  sub_10004A028(v1, (uint64_t)v11);
  if (v17) {
    goto LABEL_4;
  }
  sub_10001DBC8((uint64_t)v5);
  char v20 = sub_10004E5E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10004A028((uint64_t)v11, (uint64_t)v8);
  if (v20)
  {
    sub_10004A08C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
    uint64_t v18 = (uint64_t)v11;
    goto LABEL_5;
  }
  char v21 = v8[v6[7]];
  sub_10004A08C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
  sub_10004A08C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for StandaloneMetricsStack);
  if ((v21 & 1) == 0) {
    return sub_10004B0E4(*(id *)(v1 + v6[15]), *(id *)(v1 + v6[15] + 8));
  }
  return 0;
}

uint64_t sub_100048A84@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_10004E820();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_100004F98(&qword_100062B08);
  return sub_100046910(v1, a1 + *(int *)(v3 + 44));
}

uint64_t type metadata accessor for StandaloneMetricsStack()
{
  uint64_t result = qword_100062AA8;
  if (!qword_100062AA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_100048B2C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
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
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    uint64_t v18 = *(void **)((char *)a2 + v17);
    *(void *)((char *)a1 + v17) = v18;
    uint64_t v19 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *((unsigned char *)a1 + v19) = *((unsigned char *)a2 + v19);
    uint64_t v20 = a3[12];
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
    uint64_t v21 = a3[13];
    uint64_t v22 = a3[14];
    uint64_t v23 = *(void **)((char *)a2 + v21);
    *(void *)((char *)a1 + v21) = v23;
    uint64_t v24 = (void *)((char *)a1 + v22);
    uint64_t v25 = (void *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = a3[15];
    uint64_t v28 = (void *)((char *)a1 + v27);
    uint64_t v29 = (char *)a2 + v27;
    uint64_t v30 = *(void **)v29;
    uint64_t v31 = (void *)*((void *)v29 + 1);
    void *v28 = *(void *)v29;
    v28[1] = v31;
    uint64_t v32 = *((void *)v29 + 3);
    void v28[2] = *((void *)v29 + 2);
    v28[3] = v32;
    id v33 = v18;
    id v34 = v23;
    swift_bridgeObjectRetain();
    id v35 = v30;
    id v36 = v31;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100048E08(uint64_t a1, int *a2)
{
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10004E5F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004EFB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004EFA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  uint64_t v9 = (id *)(a1 + a2[15]);

  return swift_bridgeObjectRelease();
}

void *sub_100048FC4(void *a1, void *a2, int *a3)
{
  sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E5F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004EFB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_10004EFA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    void *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v16 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v16;
  uint64_t v17 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
  uint64_t v18 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  uint64_t v19 = a3[13];
  uint64_t v20 = a3[14];
  uint64_t v21 = *(void **)((char *)a2 + v19);
  *(void *)((char *)a1 + v19) = v21;
  uint64_t v22 = (void *)((char *)a1 + v20);
  uint64_t v23 = (void *)((char *)a2 + v20);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a3[15];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void **)v27;
  uint64_t v29 = (void *)*((void *)v27 + 1);
  void *v26 = *(void *)v27;
  v26[1] = v29;
  uint64_t v30 = *((void *)v27 + 3);
  v26[2] = *((void *)v27 + 2);
  v26[3] = v30;
  id v31 = v16;
  id v32 = v21;
  swift_bridgeObjectRetain();
  id v33 = v28;
  id v34 = v29;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100049250(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B90);
    sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10004E5F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005100((uint64_t)a1 + v7, &qword_100061B88);
    sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004EFB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)((char *)a1 + v11);
    uint64_t v13 = (void *)((char *)a2 + v11);
    sub_100005100((uint64_t)a1 + v11, &qword_100061D88);
    sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_10004EFA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      void *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v15 = a3[8];
  uint64_t v16 = *(void **)((char *)a2 + v15);
  uint64_t v17 = *(void **)((char *)a1 + v15);
  *(void *)((char *)a1 + v15) = v16;
  id v18 = v16;

  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  uint64_t v19 = a3[13];
  uint64_t v20 = *(void **)((char *)a1 + v19);
  uint64_t v21 = *(void **)((char *)a2 + v19);
  *(void *)((char *)a1 + v19) = v21;
  id v22 = v21;

  uint64_t v23 = a3[14];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[15];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = *(void **)v28;
  uint64_t v30 = *(void **)v27;
  *(void *)uint64_t v27 = *(void *)v28;
  id v31 = v29;

  id v32 = (void *)*((void *)v27 + 1);
  id v33 = (void *)*((void *)v28 + 1);
  *((void *)v27 + 1) = v33;
  id v34 = v33;

  *((void *)v27 + 2) = *((void *)v28 + 2);
  *((void *)v27 + 3) = *((void *)v28 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_10004956C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061B90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004E5F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100004F98(&qword_100061B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004EFB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100004F98(&qword_100061D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_10004EFA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v19] = a2[v19];
  uint64_t v20 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  a1[v20] = a2[v20];
  uint64_t v21 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  uint64_t v22 = a3[15];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  long long v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  return a1;
}

char *sub_1000497E0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005100((uint64_t)a1, &qword_100061B90);
    uint64_t v6 = sub_100004F98(&qword_100061B90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10004E5F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005100((uint64_t)&a1[v8], &qword_100061B88);
    uint64_t v11 = sub_100004F98(&qword_100061B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004EFB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v13 = a3[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    sub_100005100((uint64_t)&a1[v13], &qword_100061D88);
    uint64_t v16 = sub_100004F98(&qword_100061D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_10004EFA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v18 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  uint64_t v19 = *(void **)&a1[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];

  uint64_t v20 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v20] = a2[v20];
  uint64_t v21 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  a1[v21] = a2[v21];
  uint64_t v22 = a3[13];
  uint64_t v23 = *(void **)&a1[v22];
  *(void *)&a1[v22] = *(void *)&a2[v22];

  uint64_t v24 = a3[14];
  long long v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v28 = *(void *)v26;
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)long long v25 = v28;
  *((void *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[15];
  uint64_t v30 = &a1[v29];
  id v31 = &a2[v29];
  id v32 = *(void **)&a1[v29];
  *(void *)&a1[v29] = *(void *)v31;

  id v33 = (void *)*((void *)v30 + 1);
  *((void *)v30 + 1) = *((void *)v31 + 1);

  uint64_t v34 = *((void *)v31 + 3);
  *((void *)v30 + 2) = *((void *)v31 + 2);
  *((void *)v30 + 3) = v34;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100049AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100049AEC);
}

uint64_t sub_100049AEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004F98(&qword_100061BA0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004F98(&qword_100061B98);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_100004F98(&qword_100061E48);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[8]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_100049C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100049C6C);
}

uint64_t sub_100049C6C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004F98(&qword_100061BA0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100004F98(&qword_100061B98);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_100004F98(&qword_100061E48);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[8]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100049DD4()
{
  sub_100049F68(319, (unint64_t *)&unk_100061C18, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v0 <= 0x3F)
  {
    sub_100049F68(319, &qword_100061C10, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v1 <= 0x3F)
    {
      sub_100049F68(319, (unint64_t *)&qword_100061EB8, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100049F68(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004E520();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100049FBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100049FE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004A028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandaloneMetricsStack();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004A08C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004A0EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10004A158()
{
  unint64_t result = qword_100062B78;
  if (!qword_100062B78)
  {
    sub_1000053B0(&qword_100062B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062B78);
  }
  return result;
}

void sub_10004A1B4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void sub_10004A1C8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void sub_10004A1DC(id a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5, SEL *a6)
{
  if (!a2) {
    goto LABEL_4;
  }
  id v9 = a2;
  if ([v9 paused])
  {

LABEL_4:
    swift_bridgeObjectRetain();
    return;
  }
  if ([v9 activityMoveMode] == (id)2)
  {
    id v10 = [v9 *a5];
    a1 = [a1 localizedStringWithMoveMinutes:v10];

    if (a1)
    {
LABEL_9:
      sub_10004F0F0();

      return;
    }
    __break(1u);
  }
  id v11 = [v9 *a6];
  a1 = [a1 localizedStringWithActiveEnergy:v11];

  if (a1) {
    goto LABEL_9;
  }
  __break(1u);
}

id sub_10004A308(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_10004A344(a1, a2, a3, a4, (SEL *)&selRef_appleExerciseTime, (SEL *)&selRef_localizedStringWithBriskMinutes_);
}

id sub_10004A31C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_10004A344(a1, a2, a3, a4, (SEL *)&selRef_appleStandHours, (SEL *)&selRef_localizedStringWithActiveHours_);
}

id sub_10004A330(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_10004A344(a1, a2, a3, a4, (SEL *)&selRef_appleStandHoursGoal, (SEL *)&selRef_localizedStringWithActiveHours_);
}

id sub_10004A344(void *a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5, SEL *a6)
{
  if (!a2) {
    goto LABEL_4;
  }
  id v10 = a2;
  if ([v10 paused])
  {

LABEL_4:
    swift_bridgeObjectRetain();
    return (id)a3;
  }
  id v11 = [v10 *a5];
  id result = [a1 *a6:v11];
  if (result)
  {
    uint64_t v13 = result;
    a3 = sub_10004F0F0();

    return (id)a3;
  }
  __break(1u);
  return result;
}

id sub_10004A40C(void *a1, void *a2, uint64_t a3)
{
  if (!a2) {
    goto LABEL_6;
  }
  id v5 = a2;
  id result = [a1 unitManager];
  if (result)
  {
    uint64_t v7 = result;
    id v8 = [result userDistanceHKUnitForDistanceType:1];

    id v9 = [v5 distanceWalkingRunning];
    [v9 doubleValueForUnit:v8];
    double v11 = v10;

    uint64_t v12 = self;
    id v13 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v11];
    id v14 = [v12 stringWithNumber:v13 decimalPrecision:2 roundingMode:4];

    if (v14)
    {
      a3 = sub_10004F0F0();

      return (id)a3;
    }

LABEL_6:
    swift_bridgeObjectRetain();
    return (id)a3;
  }
  __break(1u);
  return result;
}

id sub_10004A568(id a1)
{
  if (a1)
  {
    if ([a1 paused])
    {
      id v5 = (objc_class *)[self mainBundle];
      v29._countAndFlagsBits = 0xE000000000000000;
      v30._object = (void *)0x80000001000592F0;
      v30._countAndFlagsBits = 0xD000000000000020;
      v31.value._countAndFlagsBits = 0;
      v31.value._object = 0;
      v6.super.Class isa = v5;
      v32._countAndFlagsBits = 0;
      v32._object = (void *)0xE000000000000000;
      uint64_t v7 = sub_10004E370(v30, v31, v6, v32, v29);

      return (id)v7;
    }
    id v10 = [a1 activityMoveMode];
    double v11 = &selRef__moveMinutesCompletionPercentage;
    if (v10 != (id)2) {
      double v11 = &selRef__activeEnergyCompletionPercentage;
    }
    [a1 *v11];
    double v9 = v12 * 100.0;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v9 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id result = [self sharedBehavior];
  if (result)
  {
    id v13 = result;
    uint64_t v1 = (uint64_t)v9;
    unsigned int v14 = [result isStandalonePhoneFitnessMode];

    if (v14)
    {
      id v15 = [self mainBundle];
      NSString v16 = sub_10004F0D0();
      NSString v17 = sub_10004F0D0();
      id v18 = [v15 localizedStringForKey:v16 value:0 table:v17];

      sub_10004F0F0();
      sub_100004F98(&qword_100061368);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_10004FC90;
      *(void *)(v19 + 56) = &type metadata for Int;
      *(void *)(v19 + 64) = &protocol witness table for Int;
      *(void *)(v19 + 32) = v1;
LABEL_25:
      uint64_t v28 = sub_10004F0E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (id)v28;
    }
    if (!a1)
    {
      uint64_t v2 = 0;
      double v3 = 0.0;
LABEL_23:
      if (qword_1000611F8 == -1)
      {
LABEL_24:
        id v23 = [self mainBundle];
        NSString v24 = sub_10004F0D0();
        NSString v25 = sub_10004F0D0();
        id v26 = [v23 localizedStringForKey:v24 value:0 table:v25];

        sub_10004F0F0();
        sub_100004F98(&qword_100061368);
        uint64_t v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_100051550;
        *(void *)(v27 + 56) = &type metadata for Int;
        *(void *)(v27 + 64) = &protocol witness table for Int;
        *(void *)(v27 + 32) = v1;
        *(void *)(v27 + 96) = &type metadata for Int;
        *(void *)(v27 + 104) = &protocol witness table for Int;
        *(void *)(v27 + 72) = v2;
        *(void *)(v27 + 136) = &type metadata for Int;
        *(void *)(v27 + 144) = &protocol witness table for Int;
        *(void *)(v27 + 112) = (uint64_t)v3;
        goto LABEL_25;
      }
LABEL_33:
      swift_once();
      goto LABEL_24;
    }
    id result = [a1 _exerciseTimeCompletionPercentage];
    double v21 = v20 * 100.0;
    if ((~COERCE__INT64(v20 * 100.0) & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (v21 > -9.22337204e18)
    {
      if (v21 < 9.22337204e18)
      {
        id result = [a1 _standHoursCompletionPercentage];
        double v3 = v22 * 100.0;
        if ((~COERCE__INT64(v22 * 100.0) & 0x7FF0000000000000) != 0)
        {
          if (v3 > -9.22337204e18)
          {
            if (v3 < 9.22337204e18)
            {
              uint64_t v2 = (uint64_t)v21;
              goto LABEL_23;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        goto LABEL_35;
      }
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
LABEL_36:
  __break(1u);
  return result;
}

void sub_10004AA6C(id a1)
{
  if (a1)
  {
    if ([a1 paused])
    {
      uint64_t v2 = (objc_class *)[self mainBundle];
      v37._countAndFlagsBits = 0xD000000000000024;
      v36._countAndFlagsBits = 0xE000000000000000;
      v37._object = (void *)0x8000000100059590;
      v40.value._countAndFlagsBits = 0;
      v40.value._object = 0;
      v3.super.Class isa = v2;
      v43._countAndFlagsBits = 0;
      v43._object = (void *)0xE000000000000000;
      sub_10004E370(v37, v40, v3, v43, v36);

      return;
    }
    if ([a1 activityMoveMode] == (id)2)
    {
      id v4 = [a1 appleMoveTime];
      id v5 = self;
      id v6 = [v5 minuteUnit];
      [v4 doubleValueForUnit:v6];
      double v8 = v7;

      if ((~*(void *)&v8 & 0x7FF0000000000000) != 0)
      {
        if (v8 > -9.22337204e18)
        {
          if (v8 < 9.22337204e18)
          {
            id v9 = [a1 appleMoveTimeGoal];
            id v10 = [v5 minuteUnit];
            [v9 doubleValueForUnit:v10];
            double v12 = v11;

            if ((~*(void *)&v12 & 0x7FF0000000000000) != 0)
            {
              if (v12 > -9.22337204e18)
              {
                if (v12 < 9.22337204e18)
                {
                  id v13 = (objc_class *)[self mainBundle];
                  v36._countAndFlagsBits = 0xE000000000000000;
                  v38._object = (void *)0x8000000100059570;
                  v38._countAndFlagsBits = 0xD00000000000001BLL;
                  v41.value._countAndFlagsBits = 0;
                  v41.value._object = 0;
                  v14.super.Class isa = v13;
                  v44._countAndFlagsBits = 0;
                  v44._object = (void *)0xE000000000000000;
                  sub_10004E370(v38, v41, v14, v44, v36);

                  sub_100004F98(&qword_100061368);
                  uint64_t v15 = swift_allocObject();
                  *(_OWORD *)(v15 + 16) = xmmword_10004FC80;
                  *(void *)(v15 + 56) = &type metadata for Int;
                  *(void *)(v15 + 64) = &protocol witness table for Int;
                  *(void *)(v15 + 32) = (uint64_t)v8;
                  *(void *)(v15 + 96) = &type metadata for Int;
                  *(void *)(v15 + 104) = &protocol witness table for Int;
                  *(void *)(v15 + 72) = (uint64_t)v12;
                  sub_10004F0E0();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  return;
                }
                goto LABEL_44;
              }
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
              return;
            }
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
  }
  if (qword_1000611F0 != -1) {
    swift_once();
  }
  id v16 = [(id)qword_1000648F8 unitManager];
  if (!v16) {
    goto LABEL_45;
  }
  NSString v17 = v16;
  id v18 = [v16 userActiveEnergyBurnedUnit];

  if (!a1)
  {
    uint64_t v25 = 0;
    double v24 = 0.0;
    goto LABEL_24;
  }
  id v19 = [a1 activeEnergyBurned];
  [v19 doubleValueForUnit:v18];
  double v21 = v20;

  if ((~*(void *)&v21 & 0x7FF0000000000000) == 0) {
    goto LABEL_37;
  }
  if (v21 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v22 = [a1 activeEnergyBurnedGoal];
  [v22 doubleValueForUnit:v18];
  double v24 = v23;

  if ((~*(void *)&v24 & 0x7FF0000000000000) == 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v24 <= -9.22337204e18) {
    goto LABEL_35;
  }
  if (v24 >= 9.22337204e18)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v25 = (uint64_t)v21;
LABEL_24:
  sub_10004B0A4();
  id v26 = self;
  id v27 = [v26 kilocalorieUnit];
  char v28 = sub_10004F280();

  if (v28)
  {
    uint64_t v29 = 0xD000000000000025;
    Swift::String v30 = (void *)0x8000000100059540;
  }
  else
  {
    id v31 = [v26 jouleUnitWithMetricPrefix:9];
    char v32 = sub_10004F280();

    if (v32) {
      uint64_t v29 = 0xD000000000000023;
    }
    else {
      uint64_t v29 = 0xD000000000000021;
    }
    if (v32) {
      Swift::String v30 = (void *)0x8000000100059510;
    }
    else {
      Swift::String v30 = (void *)0x80000001000594E0;
    }
  }
  id v33 = (objc_class *)[self mainBundle];
  v36._countAndFlagsBits = 0xE000000000000000;
  v39._countAndFlagsBits = v29;
  v39._object = v30;
  v42.value._countAndFlagsBits = 0;
  v42.value._object = 0;
  v34.super.Class isa = v33;
  v45._countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  sub_10004E370(v39, v42, v34, v45, v36);
  swift_bridgeObjectRelease();

  sub_100004F98(&qword_100061368);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_10004FC80;
  *(void *)(v35 + 56) = &type metadata for Int;
  *(void *)(v35 + 64) = &protocol witness table for Int;
  *(void *)(v35 + 32) = v25;
  *(void *)(v35 + 96) = &type metadata for Int;
  *(void *)(v35 + 104) = &protocol witness table for Int;
  *(void *)(v35 + 72) = (uint64_t)v24;
  sub_10004F0E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

unint64_t sub_10004B0A4()
{
  unint64_t result = qword_100062B88;
  if (!qword_100062B88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100062B88);
  }
  return result;
}

id sub_10004B0E4(id a1, id a2)
{
  if (a2 && [a2 activityMoveMode] == (id)2)
  {
    id v3 = [self mainBundle];
    NSString v4 = sub_10004F0D0();
    NSString v5 = sub_10004F0D0();
    id v6 = [v3 localizedStringForKey:v4 value:0 table:v5];

LABEL_5:
    uint64_t v8 = sub_10004F0F0();

    return (id)v8;
  }
  id result = [a1 localizedShortActiveEnergyUnitString];
  id v6 = result;
  if (result) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void sub_10004B20C(id a1)
{
  if (a1 && [a1 paused])
  {
    uint64_t v2 = (objc_class *)[self mainBundle];
    v16._countAndFlagsBits = 0xD000000000000028;
    v15._countAndFlagsBits = 0xE000000000000000;
    v16._object = (void *)0x8000000100059640;
    v18.value._countAndFlagsBits = 0;
    v18.value._object = 0;
    v3.super.Class isa = v2;
    v20._countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    sub_10004E370(v16, v18, v3, v20, v15);

    return;
  }
  id v4 = [self minuteUnit];
  if (!a1)
  {
    uint64_t v11 = 0;
    double v10 = 0.0;
    goto LABEL_13;
  }
  id v5 = [a1 appleExerciseTime];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  if ((~*(void *)&v7 & 0x7FF0000000000000) == 0) {
    goto LABEL_18;
  }
  if (v7 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v8 = [a1 appleExerciseTimeGoal];
  [v8 doubleValueForUnit:v4];
  double v10 = v9;

  if ((~*(void *)&v10 & 0x7FF0000000000000) != 0)
  {
    if (v10 > -9.22337204e18)
    {
      if (v10 < 9.22337204e18)
      {
        uint64_t v11 = (uint64_t)v7;
LABEL_13:
        double v12 = (objc_class *)[self mainBundle];
        v15._countAndFlagsBits = 0xE000000000000000;
        v17._object = (void *)0x8000000100059570;
        v17._countAndFlagsBits = 0xD00000000000001BLL;
        v19.value._countAndFlagsBits = 0;
        v19.value._object = 0;
        v13.super.Class isa = v12;
        v21._countAndFlagsBits = 0;
        v21._object = (void *)0xE000000000000000;
        sub_10004E370(v17, v19, v13, v21, v15);

        sub_100004F98(&qword_100061368);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_10004FC80;
        *(void *)(v14 + 56) = &type metadata for Int;
        *(void *)(v14 + 64) = &protocol witness table for Int;
        *(void *)(v14 + 32) = v11;
        *(void *)(v14 + 96) = &type metadata for Int;
        *(void *)(v14 + 104) = &protocol witness table for Int;
        *(void *)(v14 + 72) = (uint64_t)v10;
        sub_10004F0E0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_17;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10004B4E8(id a1)
{
  if (!a1 || ![a1 paused])
  {
    id v6 = [self countUnit];
    if (!a1)
    {
      uint64_t v13 = 0;
      double v12 = 0.0;
      goto LABEL_15;
    }
    id v7 = [a1 appleStandHours];
    [v7 doubleValueForUnit:v6];
    double v9 = v8;

    if ((~*(void *)&v9 & 0x7FF0000000000000) == 0) {
      goto LABEL_22;
    }
    if (v9 <= -9.22337204e18)
    {
      __break(1u);
    }
    else if (v9 < 9.22337204e18)
    {
      id v10 = [a1 appleStandHoursGoal];
      [v10 doubleValueForUnit:v6];
      double v12 = v11;

      if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (v12 > -9.22337204e18)
      {
        if (v12 < 9.22337204e18)
        {
          uint64_t v13 = (uint64_t)v9;
LABEL_15:
          uint64_t v14 = (objc_class *)[self mainBundle];
          v21._countAndFlagsBits = 0xE000000000000000;
          v22._object = (void *)0x80000001000595C0;
          v22._countAndFlagsBits = 0xD000000000000019;
          v23.value._countAndFlagsBits = 0;
          v23.value._object = 0;
          v15.super.Class isa = v14;
          v25._countAndFlagsBits = 0;
          v25._object = (void *)0xE000000000000000;
          sub_10004E370(v22, v23, v15, v25, v21);

          sub_100004F98(&qword_100061368);
          uint64_t v16 = swift_allocObject();
          *(_OWORD *)(v16 + 16) = xmmword_10004FC80;
          *(void *)(v16 + 56) = &type metadata for Int;
          *(void *)(v16 + 64) = &protocol witness table for Int;
          *(void *)(v16 + 32) = v13;
          *(void *)(v16 + 96) = &type metadata for Int;
          *(void *)(v16 + 104) = &protocol witness table for Int;
          *(void *)(v16 + 72) = (uint64_t)v12;
          uint64_t v17 = sub_10004F0E0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v17;
        }
        goto LABEL_21;
      }
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    __break(1u);
    goto LABEL_20;
  }
  if (qword_1000611F8 != -1) {
LABEL_24:
  }
    swift_once();
  int v2 = *(unsigned __int8 *)(qword_100064900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
  NSBundle v3 = (objc_class *)[self mainBundle];
  if (v2 == 1)
  {
    v4._countAndFlagsBits = 0xD00000000000002ALL;
    v21._countAndFlagsBits = 0xE000000000000000;
    id v5 = "ACCESSIBILITY_PAUSED_WHEELCHAIR_DATA_LABEL";
  }
  else
  {
    v4._countAndFlagsBits = 0xD000000000000025;
    v21._countAndFlagsBits = 0xE000000000000000;
    id v5 = "ACCESSIBILITY_PAUSED_STAND_DATA_LABEL";
  }
  v4._object = (void *)((unint64_t)(v5 - 32) | 0x8000000000000000);
  v24.value._countAndFlagsBits = 0;
  v24.value._object = 0;
  v19.super.Class isa = v3;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  uint64_t v20 = sub_10004E370(v4, v24, v19, v26, v21);

  return v20;
}

void sub_10004B82C(id a1)
{
  if (a1 && [a1 activityMoveMode] == (id)2)
  {
    id v2 = [a1 appleMoveTime];
    id v3 = [self minuteUnit];
    [v2 doubleValueForUnit:v3];
    double v5 = v4;

    if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
    {
      if (v5 > -9.22337204e18)
      {
        if (v5 < 9.22337204e18)
        {
          id v6 = [self mainBundle];
          NSString v7 = sub_10004F0D0();
          NSString v8 = sub_10004F0D0();
          id v9 = [v6 localizedStringForKey:v7 value:0 table:v8];

          sub_10004F0F0();
          sub_100004F98(&qword_100061368);
          uint64_t v10 = swift_allocObject();
          *(_OWORD *)(v10 + 16) = xmmword_10004FC90;
          *(void *)(v10 + 56) = &type metadata for Int;
          *(void *)(v10 + 64) = &protocol witness table for Int;
          *(void *)(v10 + 32) = (uint64_t)v5;
          sub_10004F0E0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_29;
      }
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      return;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (qword_1000611F0 != -1) {
    swift_once();
  }
  id v11 = [(id)qword_1000648F8 unitManager];
  if (!v11) {
    goto LABEL_30;
  }
  double v12 = v11;
  id v13 = [v11 userActiveEnergyBurnedUnit];

  if (!a1) {
    goto LABEL_15;
  }
  id v14 = [a1 activeEnergyBurned];
  [v14 doubleValueForUnit:v13];
  double v16 = v15;

  if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v16 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v16 >= 9.22337204e18)
  {
    __break(1u);
LABEL_15:
    double v16 = 0.0;
  }
  sub_10004B0A4();
  uint64_t v17 = self;
  id v18 = [v17 kilocalorieUnit];
  char v19 = sub_10004F280();

  if (v19)
  {
    uint64_t v20 = 0xD00000000000002ELL;
    Swift::String v21 = (void *)0x8000000100059700;
  }
  else
  {
    id v22 = [v17 jouleUnitWithMetricPrefix:9];
    char v23 = sub_10004F280();

    if (v23) {
      uint64_t v20 = 0xD00000000000002CLL;
    }
    else {
      uint64_t v20 = 0xD00000000000002ALL;
    }
    if (v23) {
      Swift::String v21 = (void *)0x80000001000596D0;
    }
    else {
      Swift::String v21 = (void *)0x80000001000596A0;
    }
  }
  Swift::String_optional v24 = (objc_class *)[self mainBundle];
  v27._countAndFlagsBits = 0xE000000000000000;
  v28._countAndFlagsBits = v20;
  v28._object = v21;
  v29.value._countAndFlagsBits = 0;
  v29.value._object = 0;
  v25.super.Class isa = v24;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10004E370(v28, v29, v25, v30, v27);
  swift_bridgeObjectRelease();

  sub_100004F98(&qword_100061368);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_10004FC90;
  *(void *)(v26 + 56) = &type metadata for Int;
  *(void *)(v26 + 64) = &protocol witness table for Int;
  *(void *)(v26 + 32) = (uint64_t)v16;
  sub_10004F0E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_10004BCF8(void *a1)
{
  id v2 = [self minuteUnit];
  if (!a1) {
    goto LABEL_6;
  }
  id v3 = [a1 appleExerciseTime];
  [v3 doubleValueForUnit:v2];
  double v5 = v4;

  if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      if (v5 < 9.22337204e18)
      {
LABEL_7:
        id v6 = (objc_class *)[self mainBundle];
        v9._countAndFlagsBits = 0xE000000000000000;
        v10._object = (void *)0x8000000100059670;
        v10._countAndFlagsBits = 0xD000000000000024;
        v11.value._countAndFlagsBits = 0;
        v11.value._object = 0;
        v7.super.Class isa = v6;
        v12._countAndFlagsBits = 0;
        v12._object = (void *)0xE000000000000000;
        sub_10004E370(v10, v11, v7, v12, v9);

        sub_100004F98(&qword_100061368);
        uint64_t v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = xmmword_10004FC90;
        *(void *)(v8 + 56) = &type metadata for Int;
        *(void *)(v8 + 64) = &protocol witness table for Int;
        *(void *)(v8 + 32) = (uint64_t)v5;
        sub_10004F0E0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      __break(1u);
LABEL_6:
      double v5 = 0.0;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t destroy for SummaryFormattingHelper(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SummaryFormattingHelper(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  double v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  id v7 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SummaryFormattingHelper(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SummaryFormattingHelper(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SummaryFormattingHelper(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SummaryFormattingHelper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)id result = a2 ^ 0x80000000;
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
      *(void *)id result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SummaryFormattingHelper()
{
  return &type metadata for SummaryFormattingHelper;
}

void sub_10004C0AC(void *a1)
{
  if (!a1) {
    goto LABEL_6;
  }
  id v1 = [a1 stepCount];
  id v2 = [self countUnit];
  [v1 doubleValueForUnit:v2];
  double v4 = v3;

  if ((~*(void *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18)
      {
LABEL_7:
        uint64_t v5 = (objc_class *)[self mainBundle];
        v8._countAndFlagsBits = 0xE000000000000000;
        v9._object = (void *)0x8000000100059790;
        v9._countAndFlagsBits = 0xD000000000000019;
        v10.value._countAndFlagsBits = 0;
        v10.value._object = 0;
        v6.super.Class isa = v5;
        v11._countAndFlagsBits = 0;
        v11._object = (void *)0xE000000000000000;
        sub_10004E370(v9, v10, v6, v11, v8);

        sub_100004F98(&qword_100061368);
        uint64_t v7 = swift_allocObject();
        *(_OWORD *)(v7 + 16) = xmmword_10004FC90;
        *(void *)(v7 + 56) = &type metadata for Int;
        *(void *)(v7 + 64) = &protocol witness table for Int;
        *(void *)(v7 + 32) = (uint64_t)v4;
        sub_10004F0E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      __break(1u);
LABEL_6:
      double v4 = 0.0;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
}

id sub_10004C264(void *a1, void *a2)
{
  id result = [a1 unitManager];
  if (result)
  {
    double v4 = result;
    id v5 = [result userDistanceHKUnitForDistanceType:1];

    if (a2)
    {
      id v6 = [a2 distanceWalkingRunning];
      [v6 doubleValueForUnit:v5];
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
    sub_10004B0A4();
    id v9 = [self mileUnit];
    sub_10004F280();

    id v10 = [self mainBundle];
    NSString v11 = sub_10004F0D0();
    NSString v12 = sub_10004F0D0();
    id v13 = [v10 localizedStringForKey:v11 value:0 table:v12];

    sub_10004F0F0();
    swift_bridgeObjectRelease();

    sub_100004F98(&qword_100061368);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_10004FC90;
    *(void *)(v14 + 56) = &type metadata for Double;
    *(void *)(v14 + 64) = &protocol witness table for Double;
    *(void *)(v14 + 32) = v8;
    uint64_t v15 = sub_10004F0E0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10004C4B8(void *a1)
{
  id result = [a1 unitManager];
  if (result)
  {
    double v3 = result;
    id v4 = [result userDistanceUnitForDistanceType:1];

    id v5 = [a1 localizedShortUnitStringForDistanceUnit:v4];
    if (v5)
    {
      sub_10004F0F0();

      sub_10000C56C();
      id v5 = (id)sub_10004F2B0();
      swift_bridgeObjectRelease();
    }
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10004C594()
{
  return sub_10004E780();
}

id sub_10004C5B8()
{
  id result = [objc_allocWithZone((Class)HKHealthStore) init];
  qword_1000648F0 = (uint64_t)result;
  return result;
}

void sub_10004C5EC()
{
  if (qword_1000611E8 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1000648F0;
  id v1 = objc_allocWithZone((Class)FIUIUnitManager);
  id v2 = v0;
  id v3 = [v1 initWithHealthStore:v2];

  id v4 = [objc_allocWithZone((Class)FIUIFormattingManager) initWithUnitManager:v3];
  if (v4) {
    qword_1000648F8 = (uint64_t)v4;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_10004C6B0()
{
  if (qword_1000611E8 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1000648F0;
  type metadata accessor for FitnessWidgetDataProvider();
  swift_allocObject();
  uint64_t result = sub_100011CE0(v0);
  qword_100064900 = result;
  return result;
}

uint64_t sub_10004C72C()
{
  uint64_t v0 = sub_100004F98(&qword_100062B98);
  __chkstk_darwin(v0);
  id v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004F090();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v9 = (char *)&v14 - v8;
  if (qword_1000611E8 != -1) {
    swift_once();
  }
  id v10 = (id)qword_1000648F0;
  sub_10004F080();
  NSString v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v6, v9, v3);
  v11(v2, v6, v3);
  sub_10004E540();
  NSString v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v9, v3);
  return ((uint64_t (*)(char *, uint64_t))v12)(v6, v3);
}

uint64_t sub_10004C914@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v1 = sub_100004F98(&qword_100062BB0);
  uint64_t v38 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004F98(&qword_100062BB8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v42 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004F98(&qword_100062BC0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v44 = v9;
  __chkstk_darwin(v8);
  NSString v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004F98(&qword_100062BC8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v45 = v12;
  uint64_t v46 = v13;
  __chkstk_darwin(v12);
  Swift::String_optional v40 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004F0F0();
  id v15 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v16 = sub_10004F0D0();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithSuiteName:v16];

  sub_10004F1E0();
  id v18 = (void *)HKLogActivity;
  sub_100004F98(&qword_100061368);
  uint64_t v19 = swift_allocObject();
  long long v39 = xmmword_10004FC90;
  *(_OWORD *)(v19 + 16) = xmmword_10004FC90;
  *(void *)(v19 + 56) = &type metadata for Bool;
  *(void *)(v19 + 64) = &protocol witness table for Bool;
  *(unsigned char *)(v19 + 32) = 1;
  id v20 = v18;
  sub_10004E4E0();

  swift_bridgeObjectRelease();
  LOBYTE(v48) = 1;
  unint64_t v49 = 0xD00000000000001ELL;
  unint64_t v50 = 0x80000001000597D0;
  unint64_t v51 = 0xD000000000000011;
  unint64_t v52 = 0x80000001000597F0;
  id v53 = v17;
  type metadata accessor for FitnessWidgetView();
  sub_10004DED4(&qword_100062BD0, (void (*)(uint64_t))type metadata accessor for FitnessWidgetView);
  sub_10004DA80();
  sub_10004F000();
  sub_10004E880();
  uint64_t v21 = sub_10004EBD0();
  uint64_t v23 = v22;
  LOBYTE(v18) = v24 & 1;
  uint64_t v25 = sub_10000566C(&qword_100062BE0, &qword_100062BB0);
  sub_10004E910();
  sub_10000C5C0(v21, v23, (char)v18);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v3, v1);
  sub_10004E880();
  uint64_t v26 = sub_10004EBD0();
  uint64_t v28 = v27;
  LOBYTE(v20) = v29 & 1;
  uint64_t v48 = v1;
  unint64_t v49 = v25;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = v41;
  sub_10004E8E0();
  sub_10000C5C0(v26, v28, (char)v20);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v31);
  sub_10004DCCC();
  uint64_t v48 = v31;
  unint64_t v49 = OpaqueTypeConformance2;
  uint64_t v32 = swift_getOpaqueTypeConformance2();
  id v33 = v40;
  uint64_t v34 = v43;
  sub_10004E8F0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v34);
  sub_100004F98(&qword_100062BE8);
  sub_10004EFD0();
  *(_OWORD *)(swift_allocObject() + 16) = v39;
  sub_10004EFC0();
  sub_10004DCCC();
  uint64_t v48 = v34;
  unint64_t v49 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v35 = v45;
  sub_10004E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v33, v35);
}

id sub_10004D04C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FitnessWidgetView();
  uint64_t v8 = (int *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  NSString v11 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  uint64_t v12 = v11[7];
  uint64_t v22 = *(void **)(a1 + v11[6]);
  sub_100022198(a1 + v12, (uint64_t)v6);
  uint64_t v13 = *(void **)(a1 + v11[8]);
  char v14 = *(unsigned char *)(a1 + v11[9]);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t *v10 = swift_getKeyPath();
  sub_100004F98(&qword_100061B88);
  swift_storeEnumTagMultiPayload();
  NSString v16 = (uint64_t *)((char *)v10 + v8[7]);
  uint64_t *v16 = swift_getKeyPath();
  sub_100004F98(&qword_100061B90);
  swift_storeEnumTagMultiPayload();
  id v17 = (char *)v10 + v8[8];
  *(void *)id v17 = KeyPath;
  v17[8] = 0;
  *(uint64_t *)((char *)v10 + v8[9]) = (uint64_t)v22;
  sub_10000FD18((uint64_t)v6, (uint64_t)v10 + v8[10]);
  *(uint64_t *)((char *)v10 + v8[11]) = (uint64_t)v13;
  *((unsigned char *)v10 + v8[12]) = v14;
  sub_10004DE70((uint64_t)v10, a2);
  id v18 = v13;
  uint64_t v19 = v22;

  return v19;
}

uint64_t sub_10004D224@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v1 = sub_100004F98(&qword_100062C00);
  uint64_t v30 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004F98(&qword_100062C08);
  uint64_t v31 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004F98(&qword_100062C10);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v32 = v7;
  uint64_t v33 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004F0F0();
  id v11 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v12 = sub_10004F0D0();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithSuiteName:v12];

  sub_10004F1E0();
  char v14 = (void *)HKLogActivity;
  sub_100004F98(&qword_100061368);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004FC90;
  *(void *)(v15 + 56) = &type metadata for Bool;
  *(void *)(v15 + 64) = &protocol witness table for Bool;
  *(unsigned char *)(v15 + 32) = 0;
  id v16 = v14;
  sub_10004E4E0();

  swift_bridgeObjectRelease();
  LOBYTE(v35) = 0;
  unint64_t v36 = 0xD00000000000001ELL;
  unint64_t v37 = 0x80000001000597D0;
  unint64_t v38 = 0xD000000000000011;
  unint64_t v39 = 0x80000001000597F0;
  id v40 = v13;
  type metadata accessor for FitnessComplicationView();
  sub_10004DED4(&qword_100062C18, (void (*)(uint64_t))type metadata accessor for FitnessComplicationView);
  sub_10004DA80();
  sub_10004F000();
  sub_10004E880();
  uint64_t v17 = sub_10004EBD0();
  uint64_t v19 = v18;
  LOBYTE(v14) = v20 & 1;
  uint64_t v21 = sub_10000566C(&qword_100062C20, &qword_100062C00);
  sub_10004E910();
  sub_10000C5C0(v17, v19, (char)v14);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v1);
  sub_10004E880();
  uint64_t v22 = sub_10004EBD0();
  uint64_t v24 = v23;
  LOBYTE(v16) = v25 & 1;
  uint64_t v35 = v1;
  unint64_t v36 = v21;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_10004E8E0();
  sub_10000C5C0(v22, v24, (char)v16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v4);
  sub_10004DF1C();
  uint64_t v35 = v4;
  unint64_t v36 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v32;
  sub_10004E8F0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v10, v27);
}

id sub_10004D7D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100004F98((uint64_t *)&unk_100061980);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000611F0 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_1000648F8;
  uint64_t v7 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry();
  char v8 = *(unsigned char *)(a1 + v7[10]);
  uint64_t v9 = *(void **)(a1 + v7[6]);
  sub_100022198(a1 + v7[7], (uint64_t)v6);
  *a2 = swift_getKeyPath();
  sub_100004F98(&qword_100061B88);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (int *)type metadata accessor for FitnessComplicationView();
  *(uint64_t *)((char *)a2 + v10[5]) = v15;
  *((unsigned char *)a2 + v10[6]) = v8;
  *(uint64_t *)((char *)a2 + v10[7]) = (uint64_t)v9;
  sub_10000FD18((uint64_t)v6, (uint64_t)a2 + v10[8]);
  id v11 = v9;
  NSString v12 = (void *)v15;

  return v12;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10004D96C()
{
  unint64_t result = qword_100062B90;
  if (!qword_100062B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062B90);
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetGroup()
{
  return &type metadata for WidgetGroup;
}

uint64_t sub_10004D9D0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for FitnessWidget()
{
  return &type metadata for FitnessWidget;
}

ValueMetadata *type metadata accessor for FitnessComplication()
{
  return &type metadata for FitnessComplication;
}

uint64_t sub_10004DA0C()
{
  return sub_10000566C(&qword_100062BA0, &qword_100062BA8);
}

uint64_t sub_10004DA48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004DA64()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10004DA80()
{
  unint64_t result = qword_100062BD8;
  if (!qword_100062BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062BD8);
  }
  return result;
}

uint64_t sub_10004DAD4()
{
  return sub_10004E690();
}

uint64_t sub_10004DAF8(uint64_t a1)
{
  uint64_t v2 = sub_10004E5F0();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_10004E6A0();
}

uint64_t sub_10004DBC0()
{
  sub_10004E770();
  sub_10004DED4(&qword_100062BF8, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_10004E7F0();
  return v1;
}

uint64_t sub_10004DC3C@<X0>(unsigned char *a1@<X8>)
{
  sub_10004E770();
  sub_10004DED4(&qword_100062BF8, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  uint64_t result = sub_10004E7F0();
  *a1 = v3;
  return result;
}

_OWORD *sub_10004DCCC()
{
  NSString v0 = sub_10004F0D0();
  int v1 = MGGetSInt32Answer();

  id v2 = MTLCreateSystemDefaultDevice();
  swift_unknownObjectRelease();
  char v3 = &_swiftEmptyArrayStorage;
  if (v2 && v1 != 3)
  {
    sub_100004F98(&qword_100062BF0);
    uint64_t v4 = sub_10004EFB0();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)(v5 + 72);
    unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    char v3 = (_OWORD *)swift_allocObject();
    v3[1] = xmmword_10004FC80;
    char v8 = (char *)v3 + v7;
    uint64_t v9 = *(void (**)(char *, void, uint64_t))(v5 + 104);
    v9(v8, enum case for WidgetFamily.systemSmall(_:), v4);
    v9(&v8[v6], enum case for WidgetFamily.systemMedium(_:), v4);
  }
  return v3;
}

uint64_t sub_10004DE24()
{
  return sub_10004E780();
}

uint64_t sub_10004DE48()
{
  return sub_10004E690();
}

uint64_t sub_10004DE70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FitnessWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004DED4(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_10004DF1C()
{
  NSString v0 = sub_10004F0D0();
  int v1 = MGGetSInt32Answer();

  id v2 = MTLCreateSystemDefaultDevice();
  swift_unknownObjectRelease();
  char v3 = &_swiftEmptyArrayStorage;
  if (v2 && v1 != 3)
  {
    sub_100004F98(&qword_100062BF0);
    uint64_t v4 = sub_10004EFB0();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)(v5 + 72);
    unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    char v3 = (_OWORD *)swift_allocObject();
    v3[1] = xmmword_100051550;
    char v8 = (char *)v3 + v7;
    uint64_t v9 = *(void (**)(char *, void, uint64_t))(v5 + 104);
    v9(v8, enum case for WidgetFamily.accessoryCircular(_:), v4);
    v9(&v8[v6], enum case for WidgetFamily.accessoryInline(_:), v4);
    v9(&v8[2 * v6], enum case for WidgetFamily.accessoryRectangular(_:), v4);
  }
  return v3;
}

uint64_t sub_10004E0A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004E1CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004E2BC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

NSDateComponents sub_10004E2F0()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_10004E300()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004E310()
{
  return DateComponents.minute.setter();
}

uint64_t sub_10004E320()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_10004E330()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10004E340()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_10004E350()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_10004E360()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_10004E370(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10004E380()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_10004E390()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_10004E3A0()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10004E3B0()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_10004E3C0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10004E3D0()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_10004E3E0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004E3F0()
{
  return Date.init()();
}

uint64_t sub_10004E400()
{
  return type metadata accessor for Date();
}

uint64_t sub_10004E410()
{
  return Locale.languageCode.getter();
}

uint64_t sub_10004E420()
{
  return static Locale.current.getter();
}

uint64_t sub_10004E430()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10004E440()
{
  return Calendar.startOfDay(for:)();
}

NSCalendar sub_10004E450()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_10004E460()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004E470()
{
  return Calendar.date(from:)();
}

uint64_t sub_10004E480()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_10004E490()
{
  return static Calendar.current.getter();
}

uint64_t sub_10004E4A0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10004E4B0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10004E4C0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10004E4D0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_10004E4E0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10004E4F0()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_10004E500()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_10004E510()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10004E520()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10004E530()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_10004E540()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_10004E550()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t sub_10004E560()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_10004E570()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_10004E580()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10004E590()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10004E5A0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_10004E5B0()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_10004E5C0()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_10004E5D0()
{
  return AngularGradient.init(gradient:center:startAngle:endAngle:)();
}

uint64_t sub_10004E5E0()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_10004E5F0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_10004E600()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_10004E610()
{
  return ModifiedContent<>.accessibility(sortPriority:)();
}

uint64_t sub_10004E620()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_10004E630()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t sub_10004E640()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10004E650()
{
  return static ContentTransition.numericText(countsDown:)();
}

uint64_t sub_10004E660()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_10004E670()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_10004E680()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_10004E690()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_10004E6A0()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_10004E6B0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10004E6C0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10004E6D0()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_10004E6E0()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_10004E6F0()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_10004E700()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_10004E710()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_10004E720()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_10004E730()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_10004E740()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_10004E750()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10004E760()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10004E770()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_10004E780()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10004E790()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_10004E7A0()
{
  return EnvironmentValues.widgetRenderingMode.setter();
}

uint64_t sub_10004E7B0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10004E7C0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10004E7D0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10004E7E0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10004E7F0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_10004E800()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_10004E810()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t sub_10004E820()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10004E830()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t sub_10004E840()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_10004E850(Swift::String a1)
{
}

uint64_t sub_10004E860()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10004E870()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_10004E880()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10004E890()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_10004E8A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10004E8B0()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_10004E8C0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10004E8D0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10004E8E0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10004E8F0()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_10004E900()
{
  return WidgetConfiguration.disfavoredLocations(_:for:)();
}

uint64_t sub_10004E910()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10004E920()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10004E930()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t sub_10004E940()
{
  return type metadata accessor for LayoutDirectionBehavior();
}

uint64_t sub_10004E950()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_10004E960()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_10004E970()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_10004E980()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_10004E990()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_10004E9A0()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_10004E9B0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10004E9C0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_10004E9D0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10004E9E0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10004E9F0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10004EA00()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10004EA10()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10004EA20()
{
  return static Font.subheadline.getter();
}

uint64_t sub_10004EA30()
{
  return static Font.body.getter();
}

uint64_t sub_10004EA40()
{
  return static Font.title.getter();
}

uint64_t sub_10004EA50()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10004EA60()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_10004EA70()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_10004EA80()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10004EA90()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_10004EAA0()
{
  return Font.weight(_:)();
}

uint64_t sub_10004EAB0()
{
  return Font.feature(_:)();
}

uint64_t sub_10004EAC0()
{
  return static Font.footnote.getter();
}

uint64_t sub_10004EAD0()
{
  return static Font.headline.getter();
}

uint64_t sub_10004EAE0()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_10004EAF0()
{
  return Path.strokedPath(_:)();
}

uint64_t sub_10004EB00()
{
  return Path.addRoundedRect(in:cornerSize:style:transform:)();
}

uint64_t sub_10004EB10()
{
  return Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
}

uint64_t sub_10004EB20()
{
  return Path.init()();
}

uint64_t sub_10004EB30()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_10004EB40()
{
  return Text.baselineOffset(_:)();
}

uint64_t sub_10004EB50()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_10004EB60()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_10004EB70()
{
  return Text.contentTransition(_:)();
}

uint64_t sub_10004EB80()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_10004EB90()
{
  return Text.font(_:)();
}

uint64_t sub_10004EBA0()
{
  return static Text.Scale.secondary.getter();
}

uint64_t sub_10004EBB0()
{
  return type metadata accessor for Text.Scale();
}

uint64_t sub_10004EBC0()
{
  return Text.textScale(_:isEnabled:)();
}

uint64_t sub_10004EBD0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10004EBE0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10004EBF0()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_10004EC00()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10004EC10()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10004EC20()
{
  return View.unredacted()();
}

uint64_t sub_10004EC30()
{
  return View.drawingGroup(opaque:colorMode:)();
}

uint64_t sub_10004EC40()
{
  return View.accessibility(sortPriority:)();
}

uint64_t sub_10004EC50()
{
  return View.accessibility(label:)();
}

uint64_t sub_10004EC60()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10004EC70()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_10004EC80()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_10004EC90()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_10004ECA0()
{
  return Color.init(uiColor:)();
}

uint64_t sub_10004ECB0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10004ECC0()
{
  return static Color.black.getter();
}

uint64_t sub_10004ECD0()
{
  return static Color.white.getter();
}

uint64_t sub_10004ECE0()
{
  return Color.opacity(_:)();
}

uint64_t sub_10004ECF0()
{
  return static Color.secondary.getter();
}

uint64_t sub_10004ED00()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_10004ED10()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10004ED20()
{
  return Color.init(_:)();
}

uint64_t sub_10004ED30()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10004ED40()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_10004ED50()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10004ED80()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_10004EDA0()
{
  return static Shape.role.getter();
}

uint64_t sub_10004EDC0()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_10004EDD0()
{
  return Divider.init()();
}

uint64_t sub_10004EDE0()
{
  return type metadata accessor for Divider();
}

uint64_t sub_10004EDF0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10004EE00()
{
  return Gradient.init(colors:)();
}

uint64_t sub_10004EE10()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t sub_10004EE20()
{
  return type metadata accessor for GridItem();
}

uint64_t sub_10004EE30()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t sub_10004EE40()
{
  return static Alignment.top.getter();
}

uint64_t sub_10004EE50()
{
  return static Alignment.center.getter();
}

uint64_t sub_10004EE60()
{
  return static Alignment.leading.getter();
}

uint64_t sub_10004EE70()
{
  return static Animation.timingCurve(_:_:_:_:duration:)();
}

uint64_t sub_10004EE80()
{
  return Animation.delay(_:)();
}

uint64_t sub_10004EE90()
{
  return static Animation.easeInOut.getter();
}

uint64_t sub_10004EEA0()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_10004EEB0()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_10004EEC0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_10004EED0()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_10004EEE0()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_10004EEF0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10004EF00()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10004EF10()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10004EF20()
{
  return static DispatchTime.now()();
}

uint64_t sub_10004EF30()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10004EF40()
{
  return + infix(_:_:)();
}

uint64_t sub_10004EF50()
{
  return AdaptiveStack.init(type:verticalAlignment:horizontalAlignment:spacing:content:)();
}

uint64_t sub_10004EF60()
{
  return static AdaptiveStackType.== infix(_:_:)();
}

uint64_t sub_10004EF70()
{
  return type metadata accessor for AdaptiveStackType();
}

uint64_t sub_10004EF80()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_10004EF90()
{
  return static WidgetRenderingMode.fullColor.getter();
}

uint64_t sub_10004EFA0()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_10004EFB0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_10004EFC0()
{
  return static WidgetLocation.standBy.getter();
}

uint64_t sub_10004EFD0()
{
  return type metadata accessor for WidgetLocation();
}

uint64_t sub_10004F000()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_10004F010()
{
  return static TimelineReloadPolicy.atEnd.getter();
}

uint64_t sub_10004F020()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_10004F030()
{
  return TimelineEntryRelevance.init(score:duration:)();
}

uint64_t sub_10004F040()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_10004F050()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_10004F060()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_10004F070()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_10004F080()
{
  return TrainingLoadDayWidget.init(healthStore:)();
}

uint64_t sub_10004F090()
{
  return type metadata accessor for TrainingLoadDayWidget();
}

uint64_t sub_10004F0A0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_10004F0B0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_10004F0C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10004F0D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10004F0E0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_10004F0F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004F100()
{
  return String.init(format:_:)();
}

uint64_t sub_10004F110()
{
  return String.count.getter();
}

void sub_10004F120(Swift::String a1)
{
}

Swift::Int sub_10004F130()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10004F140()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10004F150()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10004F160()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10004F170()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004F180()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10004F190()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10004F1A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10004F1B0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10004F1C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10004F1D0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10004F1E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10004F1F0()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_10004F200()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10004F210()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10004F220()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10004F230()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10004F240()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10004F250()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10004F260()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::Int sub_10004F270(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_10004F280()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10004F290()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_10004F2A0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10004F2B0()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_10004F2C0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_10004F2D0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_10004F2E0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10004F2F0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10004F300()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10004F310()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_10004F320()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10004F330()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_10004F340()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_10004F350()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_10004F360()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_10004F370()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10004F380()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10004F390()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_10004F3A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10004F3B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10004F3C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10004F3D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10004F3E0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10004F3F0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10004F400()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_10004F410()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10004F420()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10004F430()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10004F440()
{
  return Error._code.getter();
}

uint64_t sub_10004F450()
{
  return Error._domain.getter();
}

uint64_t sub_10004F460()
{
  return Error._userInfo.getter();
}

uint64_t sub_10004F470()
{
  return Hasher.init(_seed:)();
}

void sub_10004F480(Swift::UInt a1)
{
}

Swift::Int sub_10004F490()
{
  return Hasher._finalize()();
}

uint64_t sub_10004F4A0()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return __HKActivityCacheDateComponentsFromCacheIndex();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return __HKActivityCacheDateComponentsFromDate();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return __HKCacheIndexFromDateComponents();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}