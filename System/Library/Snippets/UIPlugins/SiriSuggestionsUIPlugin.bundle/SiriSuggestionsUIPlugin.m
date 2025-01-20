uint64_t sub_37FC()
{
  uint64_t v0;

  v0 = sub_18430();
  sub_399C(v0, static Logger.uiCategory);
  sub_38BC(v0, (uint64_t)static Logger.uiCategory);
  sub_183F0();
  return sub_18420();
}

uint64_t Logger.uiCategory.unsafeMutableAddressor()
{
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_18430();

  return sub_38BC(v0, (uint64_t)static Logger.uiCategory);
}

uint64_t sub_38BC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.uiCategory.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_18430();
  uint64_t v3 = sub_38BC(v2, (uint64_t)static Logger.uiCategory);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t *sub_399C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t HintComponentView.init(text1:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  sub_4298(a1, v2);
  sub_4B68();
  __chkstk_darwin();
  sub_4B80();
  uint64_t v5 = v4 - v3;
  (*(void (**)(uint64_t))(v6 + 16))(v4 - v3);
  uint64_t v7 = sub_4228(v5, v2);
  sub_42E8(a1);
  return v7;
}

uint64_t HintComponentView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_4338(&qword_20168);
  sub_4B68();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_4B80();
  uint64_t v9 = v8 - v7;
  sub_18B20();
  sub_437C();
  swift_retain();
  v10 = (void *)sub_18510();
  uint64_t v12 = v11;
  uint64_t v13 = sub_18870();
  sub_3DBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v40, 0.0, 1, 0.0, 1, v13, v14, a1, v10, v12);
  swift_release();

  LOBYTE(v12) = sub_18630();
  unsigned __int8 v15 = sub_18620();
  char v16 = sub_18650();
  sub_18650();
  if (sub_18650() != v12) {
    char v16 = sub_18650();
  }
  sub_18650();
  if (sub_18650() != v15) {
    char v16 = sub_18650();
  }
  sub_18440();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  unsigned __int8 v25 = sub_18640();
  unsigned __int8 v26 = sub_18660();
  char v27 = sub_18650();
  sub_18650();
  if (sub_18650() != v25) {
    char v27 = sub_18650();
  }
  sub_18650();
  if (sub_18650() != v26) {
    char v27 = sub_18650();
  }
  memcpy(v39, v40, 0x88uLL);
  v38[248] = 0;
  sub_18440();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  v38[256] = 0;
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v39[17]) = v16;
  v39[18] = v18;
  v39[19] = v20;
  v39[20] = v22;
  v39[21] = v24;
  LOBYTE(v39[22]) = 0;
  LOBYTE(v39[23]) = v27;
  v39[24] = v29;
  v39[25] = v31;
  v39[26] = v33;
  v39[27] = v35;
  LOBYTE(v39[28]) = 0;
  v39[29] = KeyPath;
  LOBYTE(v39[30]) = 1;
  memcpy(v38, v39, 0xF1uLL);
  sub_4338(&qword_20178);
  sub_4414();
  sub_187C0();
  sub_469C((uint64_t)v39);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a2, v9, v4);
}

uint64_t sub_3DBC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, void *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
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
    sub_18C40();
    char v27 = (void *)sub_18610();
    sub_18400();
  }
  sub_184F0();
  *a9 = a16;
  a9[1] = a17;
  a9[2] = a18;
  memcpy(a9 + 3, __src, 0x70uLL);
  id v28 = a17;

  return swift_retain();
}

uint64_t sub_3F68()
{
  return sub_18760();
}

uint64_t sub_3F80()
{
  return sub_18770();
}

uint64_t sub_3F98()
{
  return sub_187B0();
}

uint64_t sub_3FB4@<X0>(uint64_t a1@<X8>)
{
  return HintComponentView.body.getter(*v1, a1);
}

uint64_t sub_3FBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_4338(&qword_201E0) - 8;
  __chkstk_darwin();
  sub_4B80();
  uint64_t v7 = v6 - v5;
  sub_18670();
  uint64_t v8 = sub_18690();
  sub_4B68();
  uint64_t v10 = v9;
  __chkstk_darwin();
  sub_4B80();
  uint64_t v13 = v12 - v11;
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v12 - v11, enum case for Font.Leading.tight(_:), v8);
  uint64_t v14 = sub_186B0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = sub_4338(&qword_201E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v7, a1, v16);
  uint64_t v17 = (uint64_t *)(v7 + *(int *)(v4 + 44));
  *uint64_t v17 = KeyPath;
  v17[1] = v14;
  uint64_t v18 = sub_187D0();
  sub_492C(v7, a2);
  *(void *)(a2 + *(int *)(sub_4338(&qword_201F0) + 36)) = v18;
  return sub_4994(v7);
}

uint64_t sub_4180()
{
  return sub_18450();
}

uint64_t sub_4198()
{
  return sub_18460();
}

uint64_t sub_41B0()
{
  return sub_18470();
}

uint64_t sub_41D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18550();
  *a1 = result;
  return result;
}

uint64_t sub_41FC()
{
  return sub_18560();
}

uint64_t sub_4228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_189D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_4298(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_42E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_4338(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_437C()
{
  unint64_t result = qword_20170;
  if (!qword_20170)
  {
    sub_18B20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20170);
  }
  return result;
}

uint64_t sub_43C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_18530();
  *a1 = result;
  return result;
}

uint64_t sub_43EC()
{
  return sub_18540();
}

unint64_t sub_4414()
{
  unint64_t result = qword_20180;
  if (!qword_20180)
  {
    sub_44C8(&qword_20178);
    sub_4540(&qword_20188, &qword_20190, (void (*)(void))sub_4510);
    sub_4B20(&qword_201D0, &qword_201D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20180);
  }
  return result;
}

uint64_t sub_44C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4510()
{
  return sub_4540(&qword_20198, &qword_201A0, (void (*)(void))sub_45B0);
}

uint64_t sub_4540(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_44C8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_45B0()
{
  return sub_4540(&qword_201A8, &qword_201B0, (void (*)(void))sub_45E0);
}

unint64_t sub_45E0()
{
  unint64_t result = qword_201B8;
  if (!qword_201B8)
  {
    sub_44C8(&qword_201C0);
    sub_4650();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_201B8);
  }
  return result;
}

unint64_t sub_4650()
{
  unint64_t result = qword_201C8;
  if (!qword_201C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_201C8);
  }
  return result;
}

uint64_t sub_469C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  swift_release();
  swift_release();

  return a1;
}

uint64_t sub_46E0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for HintComponentView()
{
  return &type metadata for HintComponentView;
}

uint64_t sub_470C()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for TextAppearanceModifier(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for TextAppearanceModifier(id *a1)
{
}

uint64_t assignWithCopy for TextAppearanceModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

__n128 initializeWithTake for TextAppearanceModifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for TextAppearanceModifier(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for TextAppearanceModifier(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16))
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

uint64_t storeEnumTagSinglePayload for TextAppearanceModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TextAppearanceModifier()
{
  return &type metadata for TextAppearanceModifier;
}

uint64_t sub_48E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_48FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18550();
  *a1 = result;
  return result;
}

uint64_t sub_492C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4338(&qword_201E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_4994(uint64_t a1)
{
  uint64_t v2 = sub_4338(&qword_201E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_49F8()
{
  unint64_t result = qword_201F8;
  if (!qword_201F8)
  {
    sub_44C8(&qword_201F0);
    sub_4A80();
    sub_4B20(&qword_20220, &qword_20228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_201F8);
  }
  return result;
}

unint64_t sub_4A80()
{
  unint64_t result = qword_20200;
  if (!qword_20200)
  {
    sub_44C8(&qword_201E0);
    sub_4B20(&qword_20208, &qword_201E8);
    sub_4B20((unint64_t *)&qword_20210, &qword_20218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20200);
  }
  return result;
}

uint64_t sub_4B20(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_44C8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_4B90(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_181E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    void *v10 = v13;
    v10[1] = v12;
    uint64_t v14 = (char *)a1 + v9;
    unsigned __int8 v15 = (char *)a2 + v9;
    *uint64_t v14 = *v15;
    *((void *)v14 + 1) = *((void *)v15 + 1);
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_18920();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    id v21 = v13;
    swift_retain();
    v20(v17, v18, v19);
  }
  return a1;
}

uint64_t sub_4CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_181E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_18920();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_4DA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_181E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = a1 + v8;
  uint64_t v14 = a2 + v8;
  *(unsigned char *)uint64_t v13 = *(unsigned char *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_18920();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  id v20 = v12;
  swift_retain();
  v19(v16, v17, v18);
  return a1;
}

uint64_t sub_4EAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_181E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t sub_4FC0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_181E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_508C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_181E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_5194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_51A8);
}

uint64_t sub_51A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_181E0();
  sub_F21C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    if (a2 == 2147483646) {
      return sub_F260(*(void *)(a1 + *(int *)(a3 + 20)));
    }
    uint64_t v8 = sub_18920();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
  }

  return sub_524C(v9, a2, v8);
}

uint64_t sub_524C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_5274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5288);
}

void sub_5288(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_181E0();
  sub_F21C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_18920();
    uint64_t v11 = a1 + *(int *)(a4 + 28);
  }

  sub_5334(v11, a2, a2, v10);
}

uint64_t sub_5334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for SiriHelpSMARTView(uint64_t a1)
{
  return sub_5B6C(a1, qword_20288);
}

uint64_t sub_537C()
{
  uint64_t result = sub_181E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_18920();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

char *sub_5450(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_181E0();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_18920();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v7;
}

uint64_t sub_5590(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_181E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_18920();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *sub_5650(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_181E0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v7;
  v12(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_18920();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t sub_573C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_181E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

_OWORD *sub_5824(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_181E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_18920();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_58F8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_181E0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_18920();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_59DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_59F0);
}

uint64_t sub_59F0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646) {
    return sub_F260(*a1);
  }
  sub_181E0();
  sub_F21C();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(int *)(a3 + 20);
  }
  else
  {
    uint64_t v9 = sub_18920();
    uint64_t v10 = *(int *)(a3 + 24);
  }

  return sub_524C((uint64_t)a1 + v10, a2, v9);
}

uint64_t sub_5A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5AA4);
}

void *sub_5AA4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    sub_181E0();
    sub_F21C();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_18920();
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return (void *)sub_5334((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SiriHelpSnippetView(uint64_t a1)
{
  return sub_5B6C(a1, qword_20320);
}

uint64_t sub_5B6C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_5BA0()
{
  uint64_t result = sub_181E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_18920();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_5C74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5C90@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_F0E0(*a1, a2, &qword_20380);
  uint64_t v4 = (int *)sub_4338(&qword_20458);
  sub_F0E0(a1[1], a2 + v4[12], &qword_20398);
  sub_F0E0(a1[2], a2 + v4[16], &qword_203A8);
  sub_F0E0(a1[3], a2 + v4[20], &qword_203C8);
  sub_F0E0(a1[4], a2 + v4[24], &qword_203A8);
  sub_F0E0(a1[5], a2 + v4[28], &qword_203D0);
  return sub_F0E0(a1[6], a2 + v4[32], &qword_203D8);
}

uint64_t sub_5D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v1 = sub_17F20();
  uint64_t v15 = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_17F40();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SiriHelpSnippetView(0);
  v14[1] = sub_18150();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for ImageElement.ImageStyle.default(_:), v1);
  sub_4338(&qword_204A8);
  uint64_t v9 = sub_17F10();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_19300;
  (*(void (**)(unint64_t, void, uint64_t))(v10 + 104))(v12 + v11, enum case for _ProtoIdiom.default(_:), v9);
  sub_D890(v12);
  sub_17F30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v15);
  sub_17FE0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_6024@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v63 = a2;
  uint64_t v3 = type metadata accessor for SiriHelpSnippetView(0);
  uint64_t v57 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v58 = v4;
  v60 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_180D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = v8;
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = sub_180C0();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v64 = a1;
  v50 = v15;
  v15(v11, a1, v5);
  if (!v14)
  {
    uint64_t v12 = sub_18080();
    uint64_t v14 = v16;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  uint64_t v77 = v12;
  uint64_t v78 = v14;
  sub_DDB8();
  uint64_t v17 = sub_186F0();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = v5;
  int v24 = v23 & 1;
  uint64_t v59 = sub_4338(&qword_20480);
  v62 = &v44;
  uint64_t v61 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  v54 = (char *)&v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_4338(&qword_20488);
  v55 = &v44;
  uint64_t v52 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  v44 = (char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_18AC0();
  v46 = &v44;
  uint64_t v45 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v44 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = &type metadata for Text;
  v80 = &protocol witness table for Text;
  uint64_t v30 = swift_allocObject();
  uint64_t v77 = v30;
  uint64_t v49 = v17;
  *(void *)(v30 + 16) = v17;
  *(void *)(v30 + 24) = v19;
  uint64_t v48 = v19;
  int v47 = v24;
  *(unsigned char *)(v30 + 32) = v24;
  uint64_t v53 = v21;
  *(void *)(v30 + 40) = v21;
  uint64_t v76 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v73 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v70 = 0;
  long long v69 = 0u;
  long long v68 = 0u;
  uint64_t v67 = 0;
  long long v66 = 0u;
  long long v65 = 0u;
  swift_bridgeObjectRetain();
  sub_E3A8(v17, v19, v24);
  sub_18AB0();
  v50(v9, v64, v22);
  sub_E634();
  unint64_t v31 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v32 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v32 + v31, v9, v22);
  sub_E680();
  uint64_t v33 = sub_EE00(&qword_20490, (void (*)(uint64_t))&type metadata accessor for SimpleItemReverseRichView);
  uint64_t v34 = v44;
  sub_187A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v27);
  uint64_t v77 = v27;
  uint64_t v78 = v33;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v36 = v54;
  uint64_t v37 = v51;
  sub_18750();
  uint64_t v38 = v37;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v34, v37);
  sub_18090();
  uint64_t v39 = sub_4338(&qword_20498);
  v40 = v63;
  v63[3] = v39;
  uint64_t v77 = v38;
  uint64_t v78 = OpaqueTypeConformance2;
  uint64_t v41 = swift_getOpaqueTypeConformance2();
  uint64_t v42 = v59;
  uint64_t v77 = v59;
  uint64_t v78 = v41;
  v40[4] = swift_getOpaqueTypeConformance2();
  sub_E1CC(v40);
  sub_18730();
  sub_DE48(v49, v48, v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v36, v42);
}

void sub_6788(uint64_t *a1, id *a2)
{
  v44 = a2;
  uint64_t v3 = sub_183C0();
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  __chkstk_darwin(v3);
  uint64_t v41 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_18000();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v40 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_180D0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_18430();
  sub_38BC(v12, (uint64_t)static Logger.uiCategory);
  (*(void (**)(char *, uint64_t *, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v13 = sub_18410();
  os_log_type_t v14 = sub_18C20();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v37 = v6;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v39 = a1;
    uint64_t v46 = v17;
    uint64_t v38 = v5;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v18 = sub_18090();
    if (v19)
    {
      unint64_t v20 = v19;
    }
    else
    {
      uint64_t v18 = 0;
      unint64_t v20 = 0xE000000000000000;
    }
    uint64_t v45 = sub_1028C(v18, v20, &v46);
    uint64_t v5 = v38;
    sub_18C70();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_0, v13, v14, "SiriHelp Component was tapped for suggestionID: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v37;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v40, enum case for Command.noOp(_:), v5);
  uint64_t v21 = sub_18960();
  uint64_t v39 = &v37;
  __chkstk_darwin(v21);
  (*(void (**)(char *, void))(v23 + 104))((char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InteractionType.buttonTapped(_:));
  uint64_t v24 = sub_4338(&qword_204A0);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v37 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18930();
  uint64_t v27 = sub_18940();
  sub_5334((uint64_t)v26, 0, 1, v27);
  uint64_t v28 = v41;
  uint64_t v29 = v42;
  uint64_t v30 = v43;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, enum case for DeliveryVehicle.siriHelp(_:), v43);
  v31._countAndFlagsBits = sub_18090();
  if (v31._object)
  {
    object = v31._object;
  }
  else
  {
    v31._countAndFlagsBits = 0;
    object = (void *)0xE000000000000000;
  }
  v31._object = object;
  sub_183B0(v31);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
  id v33 = objc_allocWithZone((Class)sub_18A80());
  uint64_t v34 = sub_18A70();
  if (*v44)
  {
    uint64_t v35 = (void *)v34;
    id v36 = *v44;
    sub_18B10();
  }
  else
  {
    sub_18B20();
    sub_EE00((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18500();
    __break(1u);
  }
}

uint64_t sub_6D74()
{
  uint64_t v0 = type metadata accessor for SiriHelpSnippetView(0);
  uint64_t v1 = sub_F1E8(v0);
  __chkstk_darwin(v1);
  sub_F2F8();
  sub_E634();
  sub_F2E0();
  swift_allocObject();
  sub_F34C();
  sub_4338(&qword_20360);
  sub_4B20(&qword_20368, &qword_20360);
  return sub_18950();
}

uint64_t sub_6E70@<X0>(char **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v291 = a2;
  uint64_t v3 = type metadata accessor for SiriHelpSnippetView(0);
  uint64_t v4 = v3 - 8;
  v302 = *(char **)(v3 - 8);
  uint64_t v294 = *((void *)v302 + 8);
  __chkstk_darwin(v3);
  v300 = (char *)&v256 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_17FD0();
  __chkstk_darwin(v6 - 8);
  v295 = (char *)&v256 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4338(&qword_20370);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v303 = (char **)((char *)&v256 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v298 = (char **)((char *)&v256 - v11);
  uint64_t v12 = sub_4338(&qword_20378);
  __chkstk_darwin(v12 - 8);
  v290 = (char **)((char *)&v256 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_17F50();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v256 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = sub_17F70();
  __chkstk_darwin(v18 - 8);
  unint64_t v292 = (unint64_t)&v256 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v299 = (char **)(sub_4338(&qword_20380) - 8);
  uint64_t v20 = __chkstk_darwin(v299);
  uint64_t v304 = (uint64_t)&v256 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v273 = v21;
  __chkstk_darwin(v20);
  uint64_t v297 = (uint64_t)&v256 - v22;
  v296 = (char **)sub_4338(&qword_20388);
  v293 = (char **)*(v296 - 1);
  __chkstk_darwin(v296);
  uint64_t v24 = (char *)&v256 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v289 = (char **)sub_189A0();
  uint64_t v25 = (uint64_t)*(v289 - 1);
  __chkstk_darwin(v289);
  uint64_t v27 = (char *)&v256 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *(int *)(v4 + 28);
  v301 = a1;
  v305 = (char **)((char *)a1 + v28);
  *uint64_t v17 = sub_18100();
  v17[1] = v29;
  (*(void (**)(uint64_t *, void, uint64_t))(v15 + 104))(v17, enum case for SashStandard.Title.text(_:), v14);
  uint64_t v30 = (uint64_t)v290;
  sub_5D70((uint64_t)v290);
  uint64_t v31 = sub_17FB0();
  sub_5334(v30, 0, 1, v31);
  uint64_t v32 = sub_17FF0();
  sub_5334((uint64_t)v298, 1, 1, v32);
  sub_5334((uint64_t)v303, 1, 1, v32);
  v320 = 0;
  long long v318 = 0u;
  long long v319 = 0u;
  sub_18150();
  sub_17F60();
  sub_18990();
  sub_EE00(&qword_20390, (void (*)(uint64_t))&type metadata accessor for SashStandardView);
  id v33 = v289;
  sub_18730();
  (*(void (**)(char *, char **))(v25 + 8))(v27, v33);
  uint64_t v34 = v293;
  id v36 = v296;
  uint64_t v35 = v297;
  ((void (*)(uint64_t, char *, char **))v293[2])(v297, v24, v296);
  uint64_t v37 = v35 + *((int *)v299 + 15);
  strcpy((char *)v37, "Response_sash");
  *(_WORD *)(v37 + 14) = -4864;
  ((void (*)(char *, char **))v34[1])(v24, v36);
  sub_E9EC(v35, v304, &qword_20380);
  uint64_t v297 = sub_4338(&qword_20398);
  v290 = &v256;
  uint64_t v38 = __chkstk_darwin(v297);
  v40 = (char **)((char *)&v256 - (((unint64_t)v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  v303 = &v256;
  v296 = v39;
  __chkstk_darwin(v38);
  v269 = v41;
  uint64_t v42 = (char *)((char *)&v256 - v41);
  uint64_t v43 = sub_4338(&qword_203A0);
  v299 = &v256;
  __chkstk_darwin(v43);
  v267 = (char *)((unint64_t)(v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v268 = v44;
  uint64_t v45 = (char *)((char *)&v256 - v267);
  uint64_t v46 = sub_18AE0();
  v298 = &v256;
  uint64_t v47 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  v266 = v48;
  v264 = (char *)(((unint64_t)v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = (char *)((char *)&v256 - v264);
  uint64_t v50 = sub_18190();
  *((void *)&v319 + 1) = &type metadata for String;
  v320 = &protocol witness table for String;
  *(void *)&long long v318 = v50;
  *((void *)&v318 + 1) = v51;
  uint64_t v325 = 0;
  long long v323 = 0u;
  long long v324 = 0u;
  sub_17FC0();
  sub_18AD0();
  uint64_t v52 = sub_18670();
  uint64_t KeyPath = swift_getKeyPath();
  v54 = *(char ***)(v47 + 16);
  v265 = (char **)(v47 + 16);
  v263 = v54;
  ((void (*)(char *, char *, uint64_t))v54)(v45, v49, v46);
  v271 = (char **)v46;
  v272 = (char **)v43;
  v55 = (uint64_t *)&v45[*(int *)(v43 + 36)];
  uint64_t *v55 = KeyPath;
  v55[1] = v52;
  uint64_t v56 = *(char **)(v47 + 8);
  v270 = (char *)(v47 + 8);
  v262 = v56;
  ((void (*)(char *, uint64_t))v56)(v49, v46);
  sub_F0E0((uint64_t)v45, (uint64_t)v42, &qword_203A0);
  uint64_t v57 = &v42[*(int *)(v297 + 52)];
  strcpy(v57, "Response-tag");
  v57[13] = 0;
  *((_WORD *)v57 + 7) = -5120;
  sub_EC04((uint64_t)v45, &qword_203A0);
  v299 = v40;
  sub_E9EC((uint64_t)v42, (uint64_t)v40, &qword_20398);
  uint64_t v58 = sub_4338(&qword_203A8);
  v289 = &v256;
  uint64_t v59 = __chkstk_darwin(v58);
  v303 = (char **)((char *)&v256 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
  v288 = &v256;
  v298 = (char **)v60;
  __chkstk_darwin(v59);
  v286 = v61;
  v62 = (char *)((char *)&v256 - v61);
  uint64_t v63 = sub_4338(&qword_203B0);
  v287 = &v256;
  uint64_t v64 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  unint64_t v277 = v65;
  unint64_t v275 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  long long v66 = (char *)&v256 - v275;
  sub_E634();
  unint64_t v67 = v302[80];
  uint64_t v68 = (v67 + 16) & ~v67;
  v274 = (char **)(v68 + v294);
  unint64_t v292 = v67;
  v293 = (char **)(v67 | 7);
  swift_allocObject();
  v276 = (char **)v68;
  sub_E680();
  uint64_t v69 = sub_4338(&qword_203B8);
  unint64_t v70 = sub_DD20();
  sub_18950();
  v279 = *(char ***)(v64 + 16);
  ((void (*)(char *, char *, uint64_t))v279)(v62, v66, v63);
  v284 = (char **)v63;
  uint64_t v285 = v58;
  long long v71 = &v62[*(int *)(v58 + 52)];
  strcpy(v71, "Response_full");
  *((_WORD *)v71 + 7) = -4864;
  long long v72 = *(void (**)(void, void))(v64 + 8);
  v283 = (char **)(v64 + 8);
  v278 = v72;
  v72(v66, v63);
  sub_E9EC((uint64_t)v62, (uint64_t)v303, &qword_203A8);
  uint64_t v73 = sub_4338(&qword_203C8);
  long long v74 = *(char ***)(*(void *)(v73 - 8) + 64);
  __chkstk_darwin(v73 - 8);
  long long v75 = (char *)&v256 - (((unint64_t)v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = *(void *)(sub_18120() + 16);
  uint64_t v77 = swift_bridgeObjectRelease();
  v302 = v75;
  v287 = v74;
  v288 = &v256;
  v281 = (char **)v70;
  uint64_t v282 = v69;
  v280 = (char **)(v64 + 16);
  if (v76)
  {
    uint64_t v78 = __chkstk_darwin(v77);
    v79 = (char *)((char *)&v256 - v269);
    uint64_t v80 = __chkstk_darwin(v78);
    v81 = (char *)((char *)&v256 - v267);
    __chkstk_darwin(v80);
    v82 = (char *)((char *)&v256 - v264);
    uint64_t v83 = sub_18140();
    *((void *)&v319 + 1) = &type metadata for String;
    v320 = &protocol witness table for String;
    *(void *)&long long v318 = v83;
    *((void *)&v318 + 1) = v84;
    uint64_t v325 = 0;
    long long v323 = 0u;
    long long v324 = 0u;
    sub_17FC0();
    sub_18AD0();
    uint64_t v85 = sub_18670();
    uint64_t v86 = swift_getKeyPath();
    v87 = v271;
    ((void (*)(char *, char *, char **))v263)(v81, v82, v271);
    v88 = (uint64_t *)&v81[*((int *)v272 + 9)];
    uint64_t *v88 = v86;
    v88[1] = v85;
    v89 = v82;
    long long v75 = v302;
    ((void (*)(char *, char **))v262)(v89, v87);
    sub_F0E0((uint64_t)v81, (uint64_t)v79, &qword_203A0);
    uint64_t v90 = v297;
    v91 = &v79[*(int *)(v297 + 52)];
    *(void *)v91 = 0xD000000000000013;
    *((void *)v91 + 1) = 0x800000000001AEF0;
    sub_EC04((uint64_t)v81, &qword_203A0);
    sub_E9EC((uint64_t)v79, (uint64_t)v75, &qword_20398);
    uint64_t v92 = 0;
    uint64_t v93 = v90;
  }
  else
  {
    uint64_t v93 = v297;
    uint64_t v92 = 1;
  }
  v94 = v286;
  unint64_t v95 = v275;
  unint64_t v277 = ~v292;
  uint64_t v96 = sub_5334((uint64_t)v75, v92, 1, v93);
  v286 = (char *)&v256;
  uint64_t v97 = __chkstk_darwin(v96);
  uint64_t v98 = __chkstk_darwin(v97);
  __chkstk_darwin(v98);
  v99 = (char *)&v256 - v95;
  sub_E634();
  swift_allocObject();
  sub_E680();
  sub_18950();
  v100 = v284;
  ((void (*)(int64_t, char *, char **))v279)((char *)&v256 - v94, v99, v284);
  v101 = (char *)((char *)&v256 - v94 + *(int *)(v285 + 52));
  strcpy(v101, "Response_full2");
  v101[15] = -18;
  v278(v99, v100);
  uint64_t v285 = (char *)&v256 - v94;
  sub_E9EC(v285, v285, &qword_203A8);
  uint64_t v102 = sub_4338(&qword_203D0);
  uint64_t v103 = *(void *)(*(void *)(v102 - 8) + 64);
  __chkstk_darwin(v102 - 8);
  uint64_t v297 = (uint64_t)&v256 - ((v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_180F0();
  uint64_t v105 = v104;
  swift_bridgeObjectRelease();
  uint64_t v106 = sub_4338(&qword_203D8);
  uint64_t v107 = v106;
  v284 = &v256;
  if (v105)
  {
    v295 = (char *)v103;
    v283 = &v256;
    __chkstk_darwin(v106);
    v109 = (char *)&v256 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_180F0();
    if (v110)
    {
      v280 = (char **)sub_4338(&qword_203E0);
      v281 = &v256;
      __chkstk_darwin(v280);
      v112 = (char *)&v256 - ((v111 + 15) & 0xFFFFFFFFFFFFFFF0);
      v278 = (void (*)(void, void))sub_17EC0();
      unint64_t v114 = v113;
      swift_bridgeObjectRelease();
      uint64_t v115 = sub_4338(&qword_203E8);
      uint64_t v282 = v115;
      v279 = (char **)v114;
      if (v114 >> 60 == 15)
      {
        sub_5334((uint64_t)v112, 1, 1, v282);
      }
      else
      {
        v276 = &v256;
        __chkstk_darwin(v115);
        unint64_t v275 = (unint64_t)&v256 - ((v118 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_E230(0, &qword_20428);
        v120 = v278;
        unint64_t v119 = (unint64_t)v279;
        sub_DFAC((uint64_t)v278, (unint64_t)v279);
        v121 = (char *)sub_9B18((uint64_t)v120, v119);
        if (v121)
        {
          v261 = v121;
          v271 = (char **)sub_4338(&qword_203F0);
          v272 = &v256;
          __chkstk_darwin(v271);
          v268 = (char *)&v256 - ((v122 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v123 = sub_4338(&qword_203F8);
          v269 = v112;
          v270 = (char *)&v256;
          v266 = *(void (***)(char *, char *))(v123 - 8);
          v267 = (char *)v123;
          __chkstk_darwin(v123);
          v264 = (char *)&v256 - ((v124 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v125 = sub_4338(&qword_20400);
          v265 = &v256;
          v126 = *(char ***)(v125 - 8);
          v262 = (char *)v125;
          v263 = v126;
          __chkstk_darwin(v125);
          v259 = (char *)&v256 - ((v127 + 15) & 0xFFFFFFFFFFFFFFF0);
          v274 = (char **)sub_4338(&qword_20408);
          v260 = &v256;
          __chkstk_darwin(v274);
          v129 = (char *)&v256 - ((v128 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v257 = sub_18AA0();
          v258 = &v256;
          uint64_t v130 = *(void *)(v257 - 8);
          __chkstk_darwin(v257);
          v132 = (char *)&v256 - ((v131 + 15) & 0xFFFFFFFFFFFFFFF0);
          *(void *)&long long v318 = sub_181D0();
          *((void *)&v318 + 1) = v133;
          sub_DDB8();
          uint64_t v134 = sub_186F0();
          uint64_t v136 = v135;
          char v138 = v137;
          uint64_t v140 = v139;
          *((void *)&v319 + 1) = &type metadata for Text;
          v320 = &protocol witness table for Text;
          uint64_t v141 = swift_allocObject();
          *(void *)&long long v318 = v141;
          *(void *)(v141 + 16) = v134;
          *(void *)(v141 + 24) = v136;
          *(unsigned char *)(v141 + 32) = v138 & 1;
          *(void *)(v141 + 40) = v140;
          uint64_t v325 = 0;
          long long v323 = 0u;
          long long v324 = 0u;
          uint64_t v317 = 0;
          long long v315 = 0u;
          long long v316 = 0u;
          uint64_t v314 = 0;
          long long v312 = 0u;
          long long v313 = 0u;
          uint64_t v311 = 0;
          long long v309 = 0u;
          long long v310 = 0u;
          uint64_t v308 = 0;
          long long v306 = 0u;
          long long v307 = 0u;
          sub_18A90();
          uint64_t v142 = sub_186C0();
          uint64_t v143 = swift_getKeyPath();
          v144 = *(void (**)(void, void, void))(v130 + 16);
          v145 = v129;
          v256 = v129;
          v146 = v129;
          uint64_t v147 = v257;
          v144(v146, v132, v257);
          v148 = (uint64_t *)&v145[*((int *)v274 + 9)];
          uint64_t *v148 = v143;
          v148[1] = v142;
          (*(void (**)(char *, uint64_t))(v130 + 8))(v132, v147);
          sub_E634();
          uint64_t v149 = swift_allocObject();
          v150 = v261;
          *(void *)(v149 + 16) = v261;
          sub_E680();
          unint64_t v151 = sub_E004();
          id v152 = v150;
          v153 = v259;
          v154 = v274;
          uint64_t v155 = (uint64_t)v256;
          sub_18740();
          swift_release();
          sub_EC04(v155, &qword_20408);
          *(void *)&long long v318 = v154;
          *((void *)&v318 + 1) = v151;
          swift_getOpaqueTypeConformance2();
          v156 = v264;
          v157 = v262;
          sub_18730();
          ((void (*)(char *, char *))v263[1])(v153, v157);
          sub_E0A4((uint64_t)v278, (unint64_t)v279);

          v158 = v266;
          uint64_t v159 = (uint64_t)v268;
          v160 = v156;
          uint64_t v161 = v107;
          v162 = v156;
          v163 = v267;
          ((void (*)(char *, char *, char *))v266[2])(v268, v160, v267);
          v164 = v271;
          v165 = (void *)(v159 + *((int *)v271 + 13));
          void *v165 = 0xD000000000000018;
          v165[1] = 0x800000000001AF50;
          v166 = v158;
          v112 = v269;
          v167 = v162;
          uint64_t v107 = v161;
          v166[1](v167, v163);
          uint64_t v168 = v275;
          sub_E9EC(v159, v275, &qword_203F0);
          uint64_t v169 = v168;
          uint64_t v170 = 0;
          uint64_t v171 = (uint64_t)v164;
        }
        else
        {
          sub_E0A4((uint64_t)v278, (unint64_t)v279);
          uint64_t v171 = sub_4338(&qword_203F0);
          uint64_t v168 = v275;
          uint64_t v169 = v275;
          uint64_t v170 = 1;
        }
        sub_5334(v169, v170, 1, v171);
        sub_E9EC(v168, (uint64_t)v112, &qword_203E8);
        sub_5334((uint64_t)v112, 0, 1, v282);
      }
      sub_E9EC((uint64_t)v112, (uint64_t)v109, &qword_203E0);
      sub_5334((uint64_t)v109, 0, 1, (uint64_t)v280);
      v116 = v296;
    }
    else
    {
      uint64_t v117 = sub_4338(&qword_203E0);
      sub_5334((uint64_t)v109, 1, 1, v117);
      v116 = v296;
    }
    uint64_t v172 = v297;
    sub_E9EC((uint64_t)v109, v297, &qword_203D8);
    sub_5334(v172, 0, 1, v107);
    uint64_t v103 = (uint64_t)v295;
  }
  else
  {
    sub_5334(v297, 1, 1, v106);
    v116 = v296;
  }
  uint64_t v173 = sub_4338(&qword_203D8);
  __chkstk_darwin(v173 - 8);
  uint64_t v282 = v174;
  v175 = (char *)&v256 - ((v174 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_181B0();
  uint64_t v177 = v176;
  swift_bridgeObjectRelease();
  uint64_t v178 = sub_4338(&qword_203E0);
  v283 = &v256;
  v295 = v175;
  if (v177)
  {
    v280 = &v256;
    v281 = (char **)v178;
    __chkstk_darwin(v178);
    v180 = (char *)&v256 - ((v179 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_181B0();
    if (v181)
    {
      v278 = (void (*)(void, void))sub_4338(&qword_203E8);
      v279 = &v256;
      __chkstk_darwin((void (*)(char *, char **))v278);
      v276 = (char **)((char *)&v256 - ((v182 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v183 = sub_17EC0();
      unint64_t v185 = (unint64_t)v184;
      swift_bridgeObjectRelease();
      if (v185 >> 60 == 15)
      {
        uint64_t v186 = sub_4338(&qword_203F0);
        uint64_t v187 = (uint64_t)v276;
        uint64_t v188 = (uint64_t)v276;
        uint64_t v189 = 1;
      }
      else
      {
        v272 = (char **)sub_4338(&qword_203F0);
        v274 = &v256;
        __chkstk_darwin(v272);
        v270 = (char *)&v256 - ((v195 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v196 = sub_4338(&qword_203F8);
        v271 = &v256;
        v268 = *(char **)(v196 - 8);
        v269 = (char *)v196;
        __chkstk_darwin(v196);
        v266 = (void (**)(char *, char *))((char *)&v256 - ((v197 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t v198 = sub_4338(&qword_20400);
        v267 = (char *)&v256;
        v199 = *(char ***)(v198 - 8);
        v264 = (char *)v198;
        v265 = v199;
        __chkstk_darwin(v198);
        v262 = (char *)&v256 - ((v200 + 15) & 0xFFFFFFFFFFFFFFF0);
        v260 = (char **)sub_4338(&qword_20408);
        v263 = &v256;
        __chkstk_darwin(v260);
        v261 = v180;
        v202 = (char *)&v256 - ((v201 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v203 = sub_18AA0();
        v258 = &v256;
        uint64_t v204 = *(void *)(v203 - 8);
        __chkstk_darwin(v203);
        v259 = (char *)v185;
        v206 = (char *)&v256 - ((v205 + 15) & 0xFFFFFFFFFFFFFFF0);
        *(void *)&long long v318 = sub_18180();
        *((void *)&v318 + 1) = v207;
        sub_DDB8();
        uint64_t v208 = sub_186F0();
        unint64_t v275 = v183;
        uint64_t v210 = v209;
        uint64_t v211 = v103;
        char v213 = v212;
        uint64_t v215 = v214;
        *((void *)&v319 + 1) = &type metadata for Text;
        v320 = &protocol witness table for Text;
        uint64_t v216 = swift_allocObject();
        *(void *)&long long v318 = v216;
        *(void *)(v216 + 16) = v208;
        *(void *)(v216 + 24) = v210;
        char v217 = v213 & 1;
        uint64_t v103 = v211;
        *(unsigned char *)(v216 + 32) = v217;
        *(void *)(v216 + 40) = v215;
        uint64_t v325 = 0;
        long long v323 = 0u;
        long long v324 = 0u;
        uint64_t v317 = 0;
        long long v315 = 0u;
        long long v316 = 0u;
        uint64_t v314 = 0;
        long long v312 = 0u;
        long long v313 = 0u;
        uint64_t v311 = 0;
        long long v309 = 0u;
        long long v310 = 0u;
        uint64_t v308 = 0;
        long long v306 = 0u;
        long long v307 = 0u;
        sub_18A90();
        uint64_t v218 = sub_186C0();
        uint64_t v219 = swift_getKeyPath();
        (*(void (**)(char *, char *, uint64_t))(v204 + 16))(v202, v206, v203);
        v220 = v260;
        v221 = (uint64_t *)&v202[*((int *)v260 + 9)];
        uint64_t *v221 = v219;
        v221[1] = v218;
        (*(void (**)(char *, uint64_t))(v204 + 8))(v206, v203);
        sub_E634();
        uint64_t v222 = swift_allocObject();
        unint64_t v223 = v275;
        unint64_t v224 = (unint64_t)v259;
        *(void *)(v222 + 16) = v275;
        *(void *)(v222 + 24) = v224;
        v116 = v296;
        sub_E680();
        uint64_t v225 = v223;
        unint64_t v226 = v224;
        sub_DFAC(v225, v224);
        unint64_t v227 = sub_E004();
        v228 = v262;
        sub_18740();
        swift_release();
        uint64_t v229 = (uint64_t)v202;
        v180 = v261;
        sub_EC04(v229, &qword_20408);
        *(void *)&long long v318 = v220;
        *((void *)&v318 + 1) = v227;
        swift_getOpaqueTypeConformance2();
        v230 = (char *)v266;
        v231 = v264;
        sub_18730();
        ((void (*)(char *, char *))v265[1])(v228, v231);
        sub_E0A4(v275, v226);
        v232 = v268;
        uint64_t v233 = (uint64_t)v270;
        v234 = v230;
        v235 = v230;
        v236 = v269;
        (*((void (**)(char *, char *, char *))v268 + 2))(v270, v234, v269);
        v237 = v272;
        v238 = (void *)(v233 + *((int *)v272 + 13));
        void *v238 = 0xD000000000000019;
        v238[1] = 0x800000000001AF30;
        (*((void (**)(char *, char *))v232 + 1))(v235, v236);
        uint64_t v187 = (uint64_t)v276;
        sub_E9EC(v233, (uint64_t)v276, &qword_203F0);
        uint64_t v188 = v187;
        uint64_t v189 = 0;
        uint64_t v186 = (uint64_t)v237;
      }
      sub_5334(v188, v189, 1, v186);
      uint64_t v191 = v273;
      uint64_t v194 = (uint64_t)v295;
      uint64_t v192 = v282;
      sub_E9EC(v187, (uint64_t)v180, &qword_203E8);
      sub_5334((uint64_t)v180, 0, 1, (uint64_t)v278);
    }
    else
    {
      uint64_t v193 = sub_4338(&qword_203E8);
      sub_5334((uint64_t)v180, 1, 1, v193);
      uint64_t v191 = v273;
      uint64_t v194 = (uint64_t)v295;
      uint64_t v192 = v282;
    }
    sub_E9EC((uint64_t)v180, v194, &qword_203E0);
    uint64_t v190 = sub_5334(v194, 0, 1, (uint64_t)v281);
  }
  else
  {
    uint64_t v190 = sub_5334((uint64_t)v175, 1, 1, v178);
    uint64_t v191 = v273;
    uint64_t v192 = v282;
  }
  v305 = &v256;
  __chkstk_darwin(v190);
  v239 = (char *)&v256 - ((v191 + 15) & 0xFFFFFFFFFFFFFFF0);
  v300 = v239;
  uint64_t v240 = sub_F0E0(v304, (uint64_t)v239, &qword_20380);
  v301 = &v256;
  *(void *)&long long v318 = v239;
  __chkstk_darwin(v240);
  uint64_t v294 = (uint64_t)&v256 - (((unint64_t)v116 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v241 = sub_F0E0((uint64_t)v299, v294, &qword_20398);
  v296 = &v256;
  *((void *)&v318 + 1) = (char *)&v256 - (((unint64_t)v116 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v242 = (uint64_t)v298;
  __chkstk_darwin(v241);
  v243 = (char *)&v256 - ((v242 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v244 = sub_F0E0((uint64_t)v303, (uint64_t)v243, &qword_203A8);
  v293 = &v256;
  *(void *)&long long v319 = v243;
  __chkstk_darwin(v244);
  v246 = (char *)&v256 - ((v245 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v247 = sub_F0E0((uint64_t)v302, (uint64_t)v246, &qword_203C8);
  unint64_t v292 = (unint64_t)&v256;
  *((void *)&v319 + 1) = v246;
  __chkstk_darwin(v247);
  uint64_t v248 = v285;
  uint64_t v249 = sub_F0E0(v285, (uint64_t)v243, &qword_203A8);
  v298 = &v256;
  v320 = v243;
  __chkstk_darwin(v249);
  v250 = (char *)&v256 - ((v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v251 = v297;
  uint64_t v252 = sub_F0E0(v297, (uint64_t)v250, &qword_203D0);
  v287 = &v256;
  v321 = v250;
  __chkstk_darwin(v252);
  v253 = (char *)&v256 - ((v192 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v254 = (uint64_t)v295;
  sub_F0E0((uint64_t)v295, (uint64_t)v253, &qword_203D8);
  v322 = v253;
  sub_5C90((uint64_t *)&v318, v291);
  sub_EC04(v254, &qword_203D8);
  sub_EC04(v251, &qword_203D0);
  sub_EC04(v248, &qword_203A8);
  sub_EC04((uint64_t)v302, &qword_203C8);
  sub_EC04((uint64_t)v303, &qword_203A8);
  sub_EC04((uint64_t)v299, &qword_20398);
  sub_EC04(v304, &qword_20380);
  sub_EC04((uint64_t)v253, &qword_203D8);
  sub_EC04((uint64_t)v250, &qword_203D0);
  sub_EC04((uint64_t)v243, &qword_203A8);
  sub_EC04((uint64_t)v246, &qword_203C8);
  sub_EC04((uint64_t)v243, &qword_203A8);
  sub_EC04(v294, &qword_20398);
  return sub_EC04((uint64_t)v300, &qword_20380);
}

uint64_t sub_90C8()
{
  return sub_180A0();
}

uint64_t sub_9108(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = type metadata accessor for SiriHelpSnippetView(0);
  uint64_t v4 = sub_F1E8(v3);
  __chkstk_darwin(v4);
  a2();
  swift_getKeyPath();
  sub_E634();
  swift_allocObject();
  sub_E680();
  sub_4338(&qword_20460);
  sub_E2A4();
  sub_E2F8();
  return sub_18860();
}

uint64_t sub_927C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_6024(a1, v5);
  sub_E364(v5, v5[3]);
  uint64_t v3 = sub_18700();
  uint64_t result = sub_42E8((uint64_t)v5);
  *a2 = v3;
  return result;
}

uint64_t sub_92EC(void *a1)
{
  uint64_t v2 = sub_4338(&qword_20430);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_17F80();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4338(&qword_20438);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19300;
  uint64_t v10 = sub_18000();
  *(void *)(v9 + 56) = v10;
  *(void *)(v9 + 64) = &protocol witness table for Command;
  uint64_t v11 = sub_E1CC((uint64_t *)(v9 + 32));
  *uint64_t v11 = (uint64_t)a1;
  *((unsigned char *)v11 + 8) = 1;
  (*(void (**)(void))(*(void *)(v10 - 8) + 104))();
  id v12 = a1;
  sub_17F90();
  uint64_t v13 = sub_4338(&qword_20440);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SiriHelpSnippetView(0);
  sub_18900();
  uint64_t v16 = sub_18A60();
  if (sub_524C((uint64_t)v15, 1, v16) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return sub_EC04((uint64_t)v15, &qword_20440);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v4, v8, v5);
    sub_5334((uint64_t)v4, 0, 1, v5);
    uint64_t v18 = sub_4338(&qword_20448);
    __chkstk_darwin(v18 - 8);
    uint64_t v20 = (char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = sub_18960();
    sub_5334((uint64_t)v20, 1, 1, v21);
    sub_18A50();
    sub_EC04((uint64_t)v20, &qword_20448);
    sub_EC04((uint64_t)v4, &qword_20430);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  }
}

id sub_9684(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_4338(&qword_20430);
  __chkstk_darwin(v4 - 8);
  uint64_t v29 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_17F80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_18000();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E230(0, &qword_20450);
  sub_DFAC(a1, a2);
  id result = sub_9B18(a1, a2);
  if (result)
  {
    *(void *)uint64_t v13 = result;
    v13[8] = 0;
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Command.aceCommand(_:), v10);
    sub_4338(&qword_20438);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_19300;
    *(void *)(v15 + 56) = v10;
    *(void *)(v15 + 64) = &protocol witness table for Command;
    uint64_t v16 = sub_E1CC((uint64_t *)(v15 + 32));
    (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
    sub_17F90();
    uint64_t v17 = sub_4338(&qword_20440);
    __chkstk_darwin(v17 - 8);
    uint64_t v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    type metadata accessor for SiriHelpSnippetView(0);
    sub_18900();
    uint64_t v20 = sub_18A60();
    if (sub_524C((uint64_t)v19, 1, v20) == 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return (id)sub_EC04((uint64_t)v19, &qword_20440);
    }
    else
    {
      v28[2] = v28;
      uint64_t v21 = v7;
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      uint64_t v23 = (uint64_t)v29;
      v22(v29, v9, v6);
      sub_5334(v23, 0, 1, v6);
      uint64_t v24 = sub_4338(&qword_20448);
      v28[1] = v28;
      __chkstk_darwin(v24 - 8);
      v28[0] = v6;
      uint64_t v26 = (char *)v28 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v27 = sub_18960();
      sub_5334((uint64_t)v26, 1, 1, v27);
      sub_18A50();
      sub_EC04((uint64_t)v26, &qword_20448);
      sub_EC04(v23, &qword_20430);
      (*(void (**)(char *, void))(v21 + 8))(v9, v28[0]);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return (id)(*(uint64_t (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_9B18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = (void *)sub_17ED0();
    sub_E0A4(a1, a2);
  }
  id v5 = [(id)swift_getObjCClassFromMetadata() aceObjectWithPlistData:v2];

  return v5;
}

uint64_t sub_9B9C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v91 = a1;
  uint64_t v86 = a3;
  uint64_t v4 = type metadata accessor for SiriHelpSMARTView(0);
  uint64_t v83 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v84 = v5;
  uint64_t v85 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4338(&qword_20430);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_180D0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v79 = v12;
  uint64_t v80 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v71 - v13;
  uint64_t v81 = v10;
  if (a2)
  {
    uint64_t v15 = sub_18080();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v18 = v91;
    uint64_t v15 = sub_180C0();
    uint64_t v17 = v19;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, v18, v9);
    if (!v17)
    {
      uint64_t v15 = sub_18080();
      uint64_t v17 = v20;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  }
  uint64_t v82 = v9;
  uint64_t v116 = v15;
  uint64_t v117 = v17;
  sub_DDB8();
  uint64_t v21 = sub_186F0();
  uint64_t v89 = v22;
  uint64_t v90 = v21;
  char v24 = v23;
  uint64_t v88 = v25;
  uint64_t v78 = swift_allocBox();
  uint64_t v27 = v26;
  uint64_t v28 = sub_17F80();
  sub_5334(v27, 1, 1, v28);
  if (a2)
  {
    sub_180B0();
    if (v29)
    {
      uint64_t v30 = sub_17EC0();
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      if (v32 >> 60 != 15)
      {
        sub_E230(0, &qword_20428);
        sub_DFAC(v30, v32);
        id v33 = sub_9B18(v30, v32);
        if (v33)
        {
          uint64_t v34 = v33;
          sub_4338(&qword_20438);
          uint64_t v35 = swift_allocObject();
          *(_OWORD *)(v35 + 16) = xmmword_19300;
          v87 = (uint64_t *)(v35 + 32);
          uint64_t v36 = sub_18000();
          *(void *)(v35 + 56) = v36;
          *(void *)(v35 + 64) = &protocol witness table for Command;
          uint64_t v37 = sub_E1CC(v87);
          *uint64_t v37 = (uint64_t)v34;
          *((unsigned char *)v37 + 8) = 0;
          (*(void (**)(void))(*(void *)(v36 - 8) + 104))();
          id v38 = v34;
          sub_17F90();
          sub_E0A4(v30, v32);

          sub_5334((uint64_t)v8, 0, 1, v28);
          sub_F078((uint64_t)v8, v27);
        }
        else
        {
          sub_E0A4(v30, v32);
        }
      }
    }
  }
  int v39 = v24 & 1;
  uint64_t v40 = sub_4338(&qword_20608);
  uint64_t v77 = &v71;
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v75 = v40;
  uint64_t v76 = v41;
  __chkstk_darwin(v40);
  v87 = (uint64_t *)((char *)&v71 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = sub_4338(&qword_20610);
  uint64_t v73 = &v71;
  uint64_t v44 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v46 = (char *)&v71 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_18A00();
  long long v72 = &v71;
  uint64_t v48 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v50 = (char *)&v71 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = &type metadata for Text;
  unint64_t v119 = &protocol witness table for Text;
  uint64_t v51 = swift_allocObject();
  uint64_t v116 = v51;
  uint64_t v53 = v89;
  uint64_t v52 = v90;
  *(void *)(v51 + 16) = v90;
  *(void *)(v51 + 24) = v53;
  int v74 = v39;
  *(unsigned char *)(v51 + 32) = v39;
  *(void *)(v51 + 40) = v88;
  uint64_t v115 = 0;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v112 = 0;
  long long v110 = 0u;
  long long v111 = 0u;
  uint64_t v109 = 0;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v106 = 0;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v103 = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v100 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v97 = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v94 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  swift_bridgeObjectRetain();
  sub_E3A8(v52, v53, v39);
  sub_189F0();
  sub_18680();
  uint64_t v54 = sub_EE00(&qword_20618, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  uint64_t v55 = v91;
  uint64_t v56 = v54;
  sub_18780();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v47);
  sub_18090();
  uint64_t v116 = v47;
  uint64_t v117 = (void *)v56;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v71 = v43;
  long long v72 = (void *)OpaqueTypeConformance2;
  sub_18730();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v43);
  uint64_t v59 = v80;
  uint64_t v58 = v81;
  uint64_t v60 = v55;
  uint64_t v61 = v82;
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v80, v60, v82);
  sub_E634();
  unint64_t v62 = (*(unsigned __int8 *)(v58 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  unint64_t v63 = (v79 + v62 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v64 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v58 + 32))(v64 + v62, v59, v61);
  *(void *)(v64 + v63) = v78;
  sub_E680();
  uint64_t v65 = sub_4338(&qword_20620);
  long long v66 = v86;
  v86[3] = v65;
  uint64_t v116 = v71;
  uint64_t v117 = v72;
  uint64_t v67 = swift_getOpaqueTypeConformance2();
  uint64_t v68 = v75;
  uint64_t v116 = v75;
  uint64_t v117 = (void *)v67;
  v66[4] = swift_getOpaqueTypeConformance2();
  sub_E1CC(v66);
  swift_retain();
  uint64_t v69 = v87;
  sub_18740();
  swift_release();
  sub_DE48(v90, v89, v74);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *, uint64_t))(v76 + 8))(v69, v68);
  return swift_release();
}

void sub_A494(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v76 = a3;
  uint64_t v4 = sub_4338(&qword_20430);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v65 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v73 = (uint64_t)&v63 - v7;
  uint64_t v8 = sub_17F80();
  uint64_t v74 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_183C0();
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v72 = v11;
  __chkstk_darwin(v11);
  unint64_t v70 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_18000();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v69 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_180D0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = swift_projectBox();
  if (qword_20160 != -1) {
    swift_once();
  }
  long long v66 = v10;
  uint64_t v20 = sub_18430();
  sub_38BC(v20, (uint64_t)static Logger.uiCategory);
  (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 16))(v19, a1, v16);
  uint64_t v21 = sub_18410();
  os_log_type_t v22 = sub_18C20();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v64 = v14;
    char v24 = (uint8_t *)v23;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v67 = a1;
    uint64_t v63 = v25;
    v78[0] = v25;
    *(_DWORD *)char v24 = 136315138;
    uint64_t v26 = sub_18090();
    if (v27)
    {
      unint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
    uint64_t v77 = sub_1028C(v26, v28, v78);
    sub_18C70();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    _os_log_impl(&dword_0, v21, v22, "SiriHelp Component was tapped for suggestionID: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v14 = v64;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }

  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v69, enum case for Command.noOp(_:), v13);
  uint64_t v29 = sub_18960();
  uint64_t v67 = &v63;
  __chkstk_darwin(v29);
  unint64_t v31 = (char *)&v63 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v33 = *(void (**)(char *, void))(v32 + 104);
  uint64_t v64 = v34;
  v33(v31, enum case for InteractionType.buttonTapped(_:));
  uint64_t v35 = sub_4338(&qword_204A0);
  __chkstk_darwin(v35 - 8);
  uint64_t v37 = (char *)&v63 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18930();
  uint64_t v38 = sub_18940();
  sub_5334((uint64_t)v37, 0, 1, v38);
  uint64_t v40 = v70;
  uint64_t v39 = v71;
  uint64_t v41 = v72;
  (*(void (**)(char *, void, uint64_t))(v71 + 104))(v70, enum case for DeliveryVehicle.siriHelp(_:), v72);
  v42._countAndFlagsBits = sub_18090();
  if (v42._object)
  {
    object = v42._object;
  }
  else
  {
    v42._countAndFlagsBits = 0;
    object = (void *)0xE000000000000000;
  }
  v42._object = object;
  sub_183B0(v42);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  id v44 = objc_allocWithZone((Class)sub_18A80());
  uint64_t v45 = (void *)sub_18A70();
  uint64_t v46 = v68;
  swift_beginAccess();
  uint64_t v47 = v46;
  uint64_t v48 = v73;
  sub_F0E0(v47, v73, &qword_20430);
  uint64_t v49 = v75;
  if (sub_524C(v48, 1, v75) == 1)
  {
    sub_EC04(v48, &qword_20430);
  }
  else
  {
    uint64_t v50 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v66, v48, v49);
    uint64_t v51 = sub_4338(&qword_20440);
    __chkstk_darwin(v51 - 8);
    uint64_t v53 = (char *)&v63 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
    type metadata accessor for SiriHelpSMARTView(0);
    sub_18900();
    uint64_t v54 = sub_18A60();
    if (sub_524C((uint64_t)v53, 1, v54) == 1)
    {
      (*(void (**)(char *, uint64_t))(v74 + 8))(v50, v49);
      sub_EC04((uint64_t)v53, &qword_20440);
    }
    else
    {
      uint64_t v55 = v74;
      uint64_t v56 = (uint64_t)v65;
      (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v65, v50, v49);
      sub_5334(v56, 0, 1, v49);
      uint64_t v57 = sub_4338(&qword_20448);
      __chkstk_darwin(v57 - 8);
      uint64_t v59 = v50;
      uint64_t v60 = (char *)&v63 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_5334((uint64_t)v60, 1, 1, v64);
      sub_18A50();
      sub_EC04((uint64_t)v60, &qword_20448);
      sub_EC04(v56, &qword_20430);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v59, v75);
      (*(void (**)(char *, uint64_t))(*(void *)(v54 - 8) + 8))(v53, v54);
    }
  }
  uint64_t v61 = *(void **)(v76 + *(int *)(type metadata accessor for SiriHelpSMARTView(0) + 20));
  if (v61)
  {
    id v62 = v61;
    sub_18B10();
  }
  else
  {
    sub_18B20();
    sub_EE00((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18500();
    __break(1u);
  }
}

uint64_t sub_ADEC@<X0>(uint64_t a1@<X8>)
{
  return sub_AE1C((void (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpHeader.getter, a1);
}

uint64_t sub_AE04@<X0>(uint64_t a1@<X8>)
{
  return sub_AE1C((void (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.unsupportedAppHeader.getter, a1);
}

uint64_t sub_AE1C@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_4338(&qword_20590);
  sub_F200();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_4B80();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_4338(&qword_20598);
  sub_F1D8();
  __chkstk_darwin(v11);
  sub_4B80();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_18A40();
  sub_F200();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_4B80();
  uint64_t v21 = v20 - v19;
  a1();
  sub_18A30();
  uint64_t v22 = sub_186D0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v14, v21, v15);
  char v24 = (uint64_t *)(v14 + *(int *)(v10 + 36));
  *char v24 = KeyPath;
  v24[1] = v22;
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
  sub_EAC0();
  sub_18730();
  sub_EC04(v14, &qword_20598);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, v9, v3);
  uint64_t v25 = a2 + *(int *)(sub_4338(&qword_20528) + 52);
  strcpy((char *)v25, "Response_sash");
  *(_WORD *)(v25 + 14) = -4864;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_B0D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char v4 = sub_18170();
  sub_9B9C(a1, v4 & 1, v7);
  sub_E364(v7, v7[3]);
  uint64_t v5 = sub_18700();
  uint64_t result = sub_42E8((uint64_t)v7);
  *a2 = v5;
  return result;
}

uint64_t sub_B154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SiriHelpSMARTView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_17FA0();
  uint64_t v80 = *(void *)(v5 - 8);
  uint64_t v81 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_18040();
  __chkstk_darwin(v8 - 8);
  sub_181B0();
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  if (v10
    && (uint64_t result = sub_181B0(), v12)
    && (uint64_t v13 = sub_17EC0(), v15 = v14, result = swift_bridgeObjectRelease(), v15 >> 60 != 15))
  {
    uint64_t v77 = sub_4338(&qword_205B0);
    uint64_t v78 = v59;
    uint64_t v76 = *(void *)(v77 - 8);
    __chkstk_darwin(v77);
    uint64_t v74 = (char *)v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v72 = sub_4338(&qword_205B8);
    uint64_t v75 = v59;
    uint64_t v73 = *(void *)(v72 - 8);
    __chkstk_darwin(v72);
    uint64_t v69 = (char *)v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v68 = sub_4338(&qword_205C0);
    uint64_t v71 = v59;
    uint64_t v70 = *(void *)(v68 - 8);
    __chkstk_darwin(v68);
    uint64_t v79 = (char *)v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v64 = sub_189C0();
    uint64_t v67 = v59;
    uint64_t v66 = *(void *)(v64 - 8);
    __chkstk_darwin(v64);
    uint64_t v61 = (char *)v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v88 = sub_18180();
    uint64_t v89 = v20;
    sub_DDB8();
    uint64_t v21 = sub_186F0();
    unint64_t v65 = v15;
    uint64_t v23 = v22;
    id v62 = (char *)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v25 = v24;
    uint64_t v63 = v3;
    uint64_t v27 = v26;
    uint64_t v90 = &type metadata for Text;
    uint64_t v91 = &protocol witness table for Text;
    uint64_t v28 = swift_allocObject();
    uint64_t v88 = v28;
    *(void *)(v28 + 16) = v21;
    *(void *)(v28 + 24) = v23;
    *(unsigned char *)(v28 + 32) = v25 & 1;
    *(void *)(v28 + 40) = v27;
    uint64_t v87 = 0;
    long long v85 = 0u;
    long long v86 = 0u;
    uint64_t v29 = sub_4338(&qword_205C8);
    v59[2] = v59;
    __chkstk_darwin(v29);
    unint64_t v31 = (char *)v59 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v32 = sub_188E0();
    v59[1] = v59;
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v60 = v13;
    uint64_t v34 = v33;
    __chkstk_darwin(v32);
    uint64_t v36 = (char *)v59 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_18030();
    sub_188F0();
    int v37 = sub_18600();
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v36, v32);
    *(_DWORD *)&v31[*(int *)(v29 + 36)] = v37;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v32);
    sub_EB64();
    uint64_t v38 = sub_18700();
    sub_EC04((uint64_t)v31, &qword_205C8);
    uint64_t v83 = &type metadata for AnyView;
    uint64_t v84 = &protocol witness table for AnyView;
    uint64_t v82 = v38;
    uint64_t v39 = v61;
    sub_189B0();
    uint64_t v41 = v80;
    uint64_t v40 = v81;
    (*(void (**)(char *, void, uint64_t))(v80 + 104))(v7, enum case for SeparatorStyle.remove(_:), v81);
    uint64_t v42 = sub_EE00(&qword_205F0, (void (*)(uint64_t))&type metadata accessor for ReferenceRichView);
    uint64_t v43 = v64;
    sub_18720();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v40);
    uint64_t v44 = v43;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v39, v43);
    sub_E634();
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = v60;
    unint64_t v47 = v65;
    *(void *)(v45 + 16) = v60;
    *(void *)(v45 + 24) = v47;
    sub_E680();
    sub_EDEC(v46, v47);
    uint64_t v88 = v44;
    uint64_t v89 = v42;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v49 = v69;
    uint64_t v50 = v68;
    uint64_t v51 = v79;
    sub_18740();
    swift_release();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v51, v50);
    uint64_t v88 = v50;
    uint64_t v89 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v52 = v74;
    uint64_t v53 = v72;
    sub_18730();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v49, v53);
    sub_E0A4(v46, v47);
    uint64_t v54 = sub_4338(&qword_205F8);
    *(void *)(a1 + 24) = v54;
    *(void *)(a1 + 32) = sub_4B20(&qword_20600, &qword_205F8);
    uint64_t v55 = sub_E1CC((uint64_t *)a1);
    uint64_t v56 = v76;
    uint64_t v57 = v77;
    (*(void (**)(uint64_t *, char *, uint64_t))(v76 + 16))(v55, v52, v77);
    uint64_t v58 = (uint64_t *)((char *)v55 + *(int *)(v54 + 52));
    *uint64_t v58 = 0xD000000000000019;
    v58[1] = 0x800000000001AF30;
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v52, v57);
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

id sub_BAE8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_4338(&qword_20430);
  __chkstk_darwin(v4 - 8);
  uint64_t v29 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_17F80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_18000();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E230(0, &qword_20450);
  sub_DFAC(a1, a2);
  id result = sub_9B18(a1, a2);
  if (result)
  {
    *(void *)uint64_t v13 = result;
    v13[8] = 1;
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Command.aceCommand(_:), v10);
    sub_4338(&qword_20438);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_19300;
    *(void *)(v15 + 56) = v10;
    *(void *)(v15 + 64) = &protocol witness table for Command;
    uint64_t v16 = sub_E1CC((uint64_t *)(v15 + 32));
    (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
    sub_17F90();
    uint64_t v17 = sub_4338(&qword_20440);
    __chkstk_darwin(v17 - 8);
    uint64_t v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    type metadata accessor for SiriHelpSMARTView(0);
    sub_18900();
    uint64_t v20 = sub_18A60();
    if (sub_524C((uint64_t)v19, 1, v20) == 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return (id)sub_EC04((uint64_t)v19, &qword_20440);
    }
    else
    {
      v28[2] = v28;
      uint64_t v21 = v7;
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      uint64_t v23 = (uint64_t)v29;
      v22(v29, v9, v6);
      sub_5334(v23, 0, 1, v6);
      uint64_t v24 = sub_4338(&qword_20448);
      v28[1] = v28;
      __chkstk_darwin(v24 - 8);
      v28[0] = v6;
      uint64_t v26 = (char *)v28 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v27 = sub_18960();
      sub_5334((uint64_t)v26, 1, 1, v27);
      sub_18A50();
      sub_EC04((uint64_t)v26, &qword_20448);
      sub_EC04(v23, &qword_20430);
      (*(void (**)(char *, void))(v21 + 8))(v9, v28[0]);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return (id)(*(uint64_t (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_BF80()
{
  uint64_t v0 = type metadata accessor for SiriHelpSMARTView(0);
  uint64_t v1 = sub_F1E8(v0);
  __chkstk_darwin(v1);
  sub_F2F8();
  sub_E634();
  sub_F2E0();
  swift_allocObject();
  sub_F34C();
  sub_4338(&qword_204C8);
  sub_E778();
  return sub_18950();
}

uint64_t sub_C064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_17FA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriHelpSMARTView(0);
  uint64_t v9 = *(uint64_t **)(v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&KeyPath - ((v9[8] + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = (char *)(a1 + *(int *)(__chkstk_darwin(v8 - 8) + 32));
  char v12 = *v11;
  uint64_t v13 = *((void *)v11 + 1);
  LOBYTE(v116) = v12;
  uint64_t v117 = v13;
  sub_4338(&qword_20518);
  sub_18820();
  uint64_t v112 = a2;
  if (v113 == 1)
  {
    uint64_t v14 = sub_4338(&qword_20528);
    long long v111 = &KeyPath;
    uint64_t v15 = *(void *)(*(void *)(v14 - 8) + 64);
    __chkstk_darwin(v14 - 8);
    uint64_t v16 = (uint64_t *)((char *)&KeyPath - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v103 = (uint64_t *)((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v104 = v16;
    sub_AE1C((void (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.unsupportedAppHeader.getter, (uint64_t)v16);
    uint64_t v100 = (uint64_t *)sub_4338(&qword_20580);
    uint64_t v109 = &KeyPath;
    p_uint64_t KeyPath = (uint64_t *)*(v100 - 1);
    uint64_t v17 = p_KeyPath[8];
    __chkstk_darwin(v100);
    uint64_t v116 = sub_18130();
    uint64_t v117 = v18;
    sub_E634();
    swift_allocObject();
    sub_E680();
    sub_DDB8();
    long long v102 = (char *)&KeyPath - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_18850();
    uint64_t v106 = (uint64_t *)sub_4338(&qword_204E0);
    long long v108 = &KeyPath;
    __chkstk_darwin(v106);
    uint64_t v20 = (char *)&KeyPath - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t KeyPath = sub_4338(&qword_204F0);
    long long v107 = &KeyPath;
    uint64_t v21 = __chkstk_darwin(KeyPath);
    uint64_t v23 = (char *)&KeyPath - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v105 = &KeyPath;
    __chkstk_darwin(v21);
    uint64_t v24 = (char *)((char *)&KeyPath - (char *)v103);
    uint64_t v25 = sub_F0E0((uint64_t)v16, (char *)&KeyPath - (char *)v103, &qword_20528);
    uint64_t v103 = &KeyPath;
    __chkstk_darwin(v25);
    uint64_t v26 = (char *)&KeyPath - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v27 = p_KeyPath;
    uint64_t v28 = (void (*)(char *, char *, uint64_t *))p_KeyPath[2];
    uint64_t v29 = v100;
    v28(v26, v26, v100);
    sub_F0E0((uint64_t)v24, (uint64_t)v23, &qword_20528);
    uint64_t v30 = sub_4338(&qword_20588);
    v28(&v23[*(int *)(v30 + 48)], v26, v29);
    unint64_t v31 = (uint64_t *)v27[1];
    p_uint64_t KeyPath = v27 + 1;
    long long v101 = v31;
    ((void (*)(char *, uint64_t *))v31)(v26, v29);
    sub_EC04((uint64_t)v24, &qword_20528);
    uint64_t v32 = sub_4338(&qword_20578);
    __chkstk_darwin(v32);
    sub_F0E0((uint64_t)v23, (uint64_t)&KeyPath - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_204F0);
    swift_storeEnumTagMultiPayload();
    sub_4338(&qword_20500);
    sub_4B20(&qword_204E8, &qword_204F0);
    sub_4B20(&qword_204F8, &qword_20500);
    sub_185F0();
    sub_EC04((uint64_t)v23, &qword_204F0);
    uint64_t v34 = sub_4338(&qword_20550);
    __chkstk_darwin(v34);
    sub_F0E0((uint64_t)v20, (uint64_t)&KeyPath - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_204E0);
    swift_storeEnumTagMultiPayload();
    sub_4338(&qword_20510);
    sub_E800();
    sub_4B20(&qword_20508, &qword_20510);
    sub_185F0();
    sub_EC04((uint64_t)v20, &qword_204E0);
    ((void (*)(char *, uint64_t *))v101)(v102, v29);
    return sub_EC04((uint64_t)v104, &qword_20528);
  }
  else
  {
    uint64_t v109 = v9;
    p_uint64_t KeyPath = v10;
    if (sub_18170())
    {
      uint64_t v37 = sub_4338(&qword_20558);
      long long v111 = &KeyPath;
      long long v107 = *(uint64_t **)(v37 - 8);
      long long v108 = (uint64_t *)v37;
      uint64_t v38 = v107[8];
      __chkstk_darwin(v37);
      uint64_t v39 = sub_18A20();
      uint64_t v106 = &KeyPath;
      uint64_t v40 = *(void *)(v39 - 8);
      uint64_t v41 = __chkstk_darwin(v39);
      __chkstk_darwin(v41);
      uint64_t v43 = (char *)&KeyPath - v42;
      uint64_t v44 = sub_18110();
      uint64_t v118 = &type metadata for String;
      unint64_t v119 = &protocol witness table for String;
      uint64_t v116 = v44;
      uint64_t v117 = v45;
      uint64_t v115 = 0;
      long long v113 = 0u;
      long long v114 = 0u;
      sub_18A10();
      sub_EE00(&qword_20560, (void (*)(uint64_t))&type metadata accessor for DisambiguationTitle);
      uint64_t v46 = sub_18700();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v39);
      uint64_t v118 = &type metadata for AnyView;
      unint64_t v119 = &protocol witness table for AnyView;
      uint64_t v116 = v46;
      uint64_t v115 = 0;
      long long v113 = 0u;
      long long v114 = 0u;
      sub_18A10();
      sub_E634();
      swift_allocObject();
      sub_E680();
      sub_4338(&qword_20538);
      sub_4B20(&qword_20568, &qword_20538);
      p_uint64_t KeyPath = (uint64_t *)((char *)&KeyPath - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
      sub_189E0();
      sub_B154((uint64_t)&v113);
      if (*((void *)&v114 + 1))
      {
        sub_EA3C(&v113, (uint64_t)&v116);
        sub_E364(&v116, (uint64_t)v118);
        uint64_t v47 = sub_18700();
        sub_42E8((uint64_t)&v116);
      }
      else
      {
        sub_EC04((uint64_t)&v113, &qword_20540);
        uint64_t v47 = 0;
      }
      long long v102 = (char *)v47;
      long long v105 = (uint64_t *)sub_4338(&qword_204E0);
      uint64_t v109 = &KeyPath;
      __chkstk_darwin(v105);
      uint64_t v72 = (char *)&KeyPath - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v103 = (uint64_t *)sub_4338(&qword_20500);
      uint64_t v106 = &KeyPath;
      uint64_t v73 = __chkstk_darwin(v103);
      uint64_t v75 = (char *)&KeyPath - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
      long long v104 = &KeyPath;
      __chkstk_darwin(v73);
      uint64_t v77 = v107;
      uint64_t v76 = v108;
      uint64_t v78 = (void (*)(char *, uint64_t *, uint64_t *))v107[2];
      v78((char *)&KeyPath - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0), p_KeyPath, v108);
      v78(v75, (uint64_t *)((char *)&KeyPath - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0)), v76);
      *(void *)&v75[*(int *)(sub_4338(&qword_20570) + 48)] = v47;
      long long v107 = (uint64_t *)v77[1];
      uint64_t v79 = v107;
      swift_retain();
      ((void (*)(char *, uint64_t *))v79)((char *)&KeyPath - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0), v76);
      uint64_t v80 = sub_4338(&qword_20578);
      __chkstk_darwin(v80);
      sub_F0E0((uint64_t)v75, (uint64_t)&KeyPath - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_20500);
      swift_storeEnumTagMultiPayload();
      sub_4338(&qword_204F0);
      sub_4B20(&qword_204E8, &qword_204F0);
      sub_4B20(&qword_204F8, &qword_20500);
      sub_185F0();
      sub_EC04((uint64_t)v75, &qword_20500);
      uint64_t v82 = sub_4338(&qword_20550);
      __chkstk_darwin(v82);
      sub_F0E0((uint64_t)v72, (uint64_t)&KeyPath - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_204E0);
      swift_storeEnumTagMultiPayload();
      sub_4338(&qword_20510);
      sub_E800();
      sub_4B20(&qword_20508, &qword_20510);
      sub_185F0();
      swift_release();
      sub_EC04((uint64_t)v72, &qword_204E0);
      return ((uint64_t (*)(uint64_t *, uint64_t *))v107)(p_KeyPath, v76);
    }
    else
    {
      uint64_t v48 = sub_4338(&qword_20520);
      long long v111 = &KeyPath;
      long long v107 = *(uint64_t **)(v48 - 8);
      long long v108 = (uint64_t *)v48;
      uint64_t v49 = __chkstk_darwin(v48);
      uint64_t v51 = (uint64_t *)((char *)&KeyPath - (((unint64_t)v50 + 15) & 0xFFFFFFFFFFFFFFF0));
      long long v105 = &KeyPath;
      uint64_t v103 = v50;
      __chkstk_darwin(v49);
      uint64_t v53 = (char *)&KeyPath - v52;
      uint64_t v54 = sub_4338(&qword_20528);
      uint64_t v106 = &KeyPath;
      __chkstk_darwin(v54);
      uint64_t v56 = (char *)&KeyPath - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_AE1C((void (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpHeader.getter, (uint64_t)v56);
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for SeparatorStyle.remove(_:), v4);
      sub_4B20(&qword_20530, &qword_20528);
      sub_18720();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      sub_EC04((uint64_t)v56, &qword_20528);
      uint64_t v57 = (void (*)(uint64_t *, char *, uint64_t *))v107[4];
      uint64_t v106 = v51;
      v57(v51, v53, v108);
      uint64_t v58 = sub_4338(&qword_20538);
      long long v104 = &KeyPath;
      uint64_t v59 = v58 - 8;
      uint64_t v60 = __chkstk_darwin(v58);
      long long v105 = (uint64_t *)((char *)&KeyPath - ((unint64_t)(v61 + 15) & 0xFFFFFFFFFFFFFFF0));
      long long v101 = &KeyPath;
      long long v102 = v61;
      __chkstk_darwin(v60);
      uint64_t v63 = (char *)&KeyPath - v62;
      uint64_t v64 = sub_4338(&qword_203B8);
      uint64_t v100 = &KeyPath;
      uint64_t v65 = *(void *)(v64 - 8);
      __chkstk_darwin(v64);
      uint64_t v67 = (char *)&KeyPath - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v116 = sub_18160();
      uint64_t KeyPath = swift_getKeyPath();
      sub_E634();
      swift_allocObject();
      sub_E680();
      sub_4338(&qword_20460);
      sub_E2A4();
      sub_E2F8();
      sub_18860();
      (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v63, v67, v64);
      uint64_t v68 = &v63[*(int *)(v59 + 60)];
      strcpy(v68, "Response_full");
      *((_WORD *)v68 + 7) = -4864;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
      uint64_t v69 = (uint64_t)v105;
      sub_E9EC((uint64_t)v63, (uint64_t)v105, &qword_20538);
      sub_B154((uint64_t)&v113);
      if (*((void *)&v114 + 1))
      {
        sub_EA3C(&v113, (uint64_t)&v116);
        sub_E364(&v116, (uint64_t)v118);
        uint64_t v70 = sub_18700();
        sub_42E8((uint64_t)&v116);
      }
      else
      {
        sub_EC04((uint64_t)&v113, &qword_20540);
        uint64_t v70 = 0;
      }
      long long v101 = (uint64_t *)sub_4338(&qword_20510);
      p_uint64_t KeyPath = &KeyPath;
      uint64_t v84 = __chkstk_darwin(v101);
      long long v86 = (char *)&KeyPath - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v109 = &KeyPath;
      __chkstk_darwin(v84);
      uint64_t v88 = (char *)&KeyPath - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v89 = v107;
      uint64_t v90 = (uint64_t (*)(char *, uint64_t *, uint64_t *))v107[2];
      uint64_t v91 = v108;
      uint64_t v92 = v90(v88, v106, v108);
      uint64_t v103 = &KeyPath;
      __chkstk_darwin(v92);
      uint64_t v94 = (char *)&KeyPath - ((v93 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_F0E0(v69, (uint64_t)v94, &qword_20538);
      v90(v86, (uint64_t *)v88, v91);
      uint64_t v95 = sub_4338(&qword_20548);
      sub_F0E0((uint64_t)v94, (uint64_t)&v86[*(int *)(v95 + 48)], &qword_20538);
      *(void *)&v86[*(int *)(v95 + 64)] = v70;
      swift_retain();
      sub_EC04((uint64_t)v94, &qword_20538);
      long long v96 = (void (*)(char *, uint64_t *))v89[1];
      v96(v88, v91);
      uint64_t v97 = sub_4338(&qword_20550);
      __chkstk_darwin(v97);
      sub_F0E0((uint64_t)v86, (uint64_t)&KeyPath - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_20510);
      swift_storeEnumTagMultiPayload();
      sub_4338(&qword_204E0);
      sub_E800();
      sub_4B20(&qword_20508, &qword_20510);
      sub_185F0();
      swift_release();
      sub_EC04((uint64_t)v86, &qword_20510);
      sub_EC04((uint64_t)v105, &qword_20538);
      return ((uint64_t (*)(uint64_t *, uint64_t *))v96)(v106, v91);
    }
  }
}

uint64_t sub_D558()
{
  return sub_18830();
}

uint64_t sub_D5C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SiriHelpSMARTView(0);
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_4338(&qword_203B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[1] = sub_18160();
  swift_getKeyPath();
  sub_E634();
  swift_allocObject();
  sub_E680();
  sub_4338(&qword_20460);
  sub_E2A4();
  sub_E2F8();
  sub_18860();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(a1, v6, v3);
  uint64_t v7 = a1 + *(int *)(sub_4338(&qword_20538) + 52);
  strcpy((char *)v7, "Response_full");
  *(_WORD *)(v7 + 14) = -4864;
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_D844()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D864()
{
  return sub_E6F4(type metadata accessor for SiriHelpSnippetView, (uint64_t (*)(uint64_t))sub_6E70);
}

uint64_t sub_D890(uint64_t a1)
{
  uint64_t v2 = sub_17F10();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v35 = (char *)&v26 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }
  sub_4338(&qword_204B0);
  uint64_t result = sub_18CA0();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (uint64_t)v8;
  }
  unint64_t v9 = 0;
  uint64_t v29 = a1 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
  uint64_t v33 = v31 + 16;
  uint64_t v34 = result + 56;
  uint64_t v10 = (void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v31 + 72);
    char v12 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v12(v35, v29 + v11 * v9, v2);
    sub_E5F0(&qword_204B8);
    uint64_t v13 = sub_18B50();
    uint64_t v14 = -1 << v8[32];
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
    uint64_t v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      unint64_t v32 = v9;
      uint64_t v19 = ~v14;
      while (1)
      {
        v12(v5, *((void *)v8 + 6) + v15 * v11, v2);
        sub_E5F0(&qword_204C0);
        char v20 = sub_18B60();
        uint64_t v21 = *v10;
        (*v10)(v5, v2);
        if (v20) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v19;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
        uint64_t v18 = 1 << v15;
        if ((v17 & (1 << v15)) == 0)
        {
          a1 = v27;
          unint64_t v9 = v32;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v35, v2);
      a1 = v27;
      unint64_t v9 = v32;
    }
    else
    {
LABEL_10:
      uint64_t v22 = v35;
      *(void *)(v34 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*((void *)v8 + 6) + v15 * v11, v22, v2);
      uint64_t v23 = *((void *)v8 + 2);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_18;
      }
      *((void *)v8 + 2) = v25;
    }
    if (++v9 == v30) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_DBC0()
{
  type metadata accessor for SiriHelpSnippetView(0);
  sub_F1BC();

  sub_F2C4();
  sub_F1A8();
  sub_F244();
  v2();
  sub_F280();
  sub_F1A8();
  uint64_t v3 = sub_F234();
  v4(v3);
  uint64_t v5 = sub_F250();

  return _swift_deallocObject(v5);
}

uint64_t sub_DC88()
{
  return sub_DCBC((void (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.suggestions.getter);
}

uint64_t sub_DCBC(void (*a1)(void))
{
  uint64_t v2 = type metadata accessor for SiriHelpSnippetView(0);
  sub_F194(v2);
  uint64_t v4 = sub_F2B4(*(unsigned __int8 *)(v3 + 80));
  return sub_9108(v4, a1);
}

unint64_t sub_DD20()
{
  unint64_t result = qword_203C0;
  if (!qword_203C0)
  {
    sub_44C8(&qword_203B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_203C0);
  }
  return result;
}

uint64_t sub_DD84()
{
  return sub_DCBC((void (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.otherSuggestions.getter);
}

unint64_t sub_DDB8()
{
  unint64_t result = qword_20410;
  if (!qword_20410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20410);
  }
  return result;
}

uint64_t sub_DE04()
{
  sub_DE48(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0);
}

uint64_t sub_DE48(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_DE58()
{
  type metadata accessor for SiriHelpSnippetView(0);
  sub_F1BC();
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_DF28(*(void *)(v0 + 16), *(void *)(v0 + 24));

  sub_F2C4();
  sub_F1A8();
  sub_F244();
  v3();
  sub_F280();
  sub_F1A8();
  uint64_t v4 = sub_F234();
  v5(v4);
  uint64_t v6 = sub_F250();

  return _swift_deallocObject(v6);
}

uint64_t sub_DF28(uint64_t a1, unint64_t a2)
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

uint64_t sub_DF80()
{
  return sub_ED6C(type metadata accessor for SiriHelpSnippetView, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_9684);
}

uint64_t sub_DFAC(uint64_t a1, unint64_t a2)
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

unint64_t sub_E004()
{
  unint64_t result = qword_20418;
  if (!qword_20418)
  {
    sub_44C8(&qword_20408);
    sub_EE00(&qword_20420, (void (*)(uint64_t))&type metadata accessor for SimpleItemStandardView);
    sub_4B20((unint64_t *)&qword_20210, &qword_20218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20418);
  }
  return result;
}

uint64_t sub_E0A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_DF28(a1, a2);
  }
  return a1;
}

uint64_t sub_E0B8()
{
  type metadata accessor for SiriHelpSnippetView(0);
  sub_F1BC();
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);

  sub_F2C4();
  sub_F1A8();
  sub_F244();
  v3();
  sub_F280();
  sub_F1A8();
  uint64_t v4 = sub_F234();
  v5(v4);
  uint64_t v6 = sub_F250();

  return _swift_deallocObject(v6);
}

uint64_t sub_E188()
{
  uint64_t v1 = type metadata accessor for SiriHelpSnippetView(0);
  sub_F194(v1);
  unint64_t v2 = *(void **)(v0 + 16);

  return sub_92EC(v2);
}

uint64_t *sub_E1CC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_E230(uint64_t a1, unint64_t *a2)
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

uint64_t sub_E26C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18090();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_E2A4()
{
  unint64_t result = qword_20468;
  if (!qword_20468)
  {
    sub_44C8(&qword_20460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20468);
  }
  return result;
}

unint64_t sub_E2F8()
{
  unint64_t result = qword_20470;
  if (!qword_20470)
  {
    sub_44C8(&qword_20478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20470);
  }
  return result;
}

void *sub_E364(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_E3A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_E3B8()
{
  uint64_t v1 = sub_180D0();
  sub_F200();
  uint64_t v3 = v2;
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriHelpSnippetView(0) - 8) + 80);
  unint64_t v8 = (v4 + v6 + v7) & ~v7;
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v1);

  sub_181E0();
  sub_F1A8();
  uint64_t v9 = sub_F234();
  v10(v9);
  sub_18920();
  sub_F1A8();
  uint64_t v11 = sub_F234();
  v12(v11);

  return _swift_deallocObject(v0);
}

void sub_E520()
{
  uint64_t v1 = sub_180D0();
  sub_F1E8(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for SiriHelpSnippetView(0);
  sub_F194(v6);
  unint64_t v8 = (id *)(v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));

  sub_6788((uint64_t *)(v0 + v3), v8);
}

uint64_t sub_E5AC()
{
  uint64_t v0 = type metadata accessor for SiriHelpSnippetView(0);
  sub_F194(v0);
  uint64_t v1 = sub_F29C();
  return sub_927C(v1, v2);
}

uint64_t sub_E5F0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_17F10();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_E634()
{
  uint64_t v1 = sub_F338();
  v2(v1);
  sub_F1D8();
  uint64_t v3 = sub_F324();
  v4(v3);
  return v0;
}

uint64_t sub_E680()
{
  uint64_t v1 = sub_F338();
  v2(v1);
  sub_F1D8();
  uint64_t v3 = sub_F310();
  v4(v3);
  return v0;
}

uint64_t sub_E6C8()
{
  return sub_E6F4(type metadata accessor for SiriHelpSMARTView, (uint64_t (*)(uint64_t))sub_C064);
}

uint64_t sub_E6F4(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v2 = *(void *)(a1(0) - 8);
  uint64_t v3 = sub_F2B4(*(unsigned __int8 *)(v2 + 80));

  return a2(v3);
}

unint64_t sub_E778()
{
  unint64_t result = qword_204D0;
  if (!qword_204D0)
  {
    sub_44C8(&qword_204C8);
    sub_E800();
    sub_4B20(&qword_20508, &qword_20510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_204D0);
  }
  return result;
}

unint64_t sub_E800()
{
  unint64_t result = qword_204D8;
  if (!qword_204D8)
  {
    sub_44C8(&qword_204E0);
    sub_4B20(&qword_204E8, &qword_204F0);
    sub_4B20(&qword_204F8, &qword_20500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_204D8);
  }
  return result;
}

uint64_t sub_E8AC()
{
  type metadata accessor for SiriHelpSMARTView(0);
  sub_F1BC();
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  sub_181E0();
  sub_F1A8();
  sub_F244();
  v4();

  swift_release();
  sub_18920();
  sub_F1A8();
  uint64_t v5 = sub_F234();
  v6(v5);
  uint64_t v7 = sub_F250();

  return _swift_deallocObject(v7);
}

uint64_t sub_E99C()
{
  uint64_t v0 = type metadata accessor for SiriHelpSMARTView(0);
  sub_F194(v0);
  uint64_t v1 = sub_F29C();

  return sub_B0D4(v1, v2);
}

uint64_t sub_E9EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_4338(a3);
  sub_F1D8();
  uint64_t v4 = sub_F310();
  v5(v4);
  return a2;
}

uint64_t sub_EA3C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_EA58()
{
  return sub_E6F4(type metadata accessor for SiriHelpSMARTView, (uint64_t (*)(uint64_t))sub_D5C0);
}

uint64_t sub_EA88()
{
  uint64_t v0 = type metadata accessor for SiriHelpSMARTView(0);
  sub_F194(v0);
  sub_F2B4(*(unsigned __int8 *)(v1 + 80));

  return sub_D558();
}

unint64_t sub_EAC0()
{
  unint64_t result = qword_205A0;
  if (!qword_205A0)
  {
    sub_44C8(&qword_20598);
    sub_EE00(&qword_205A8, (void (*)(uint64_t))&type metadata accessor for PrimaryHeaderRichView);
    sub_4B20((unint64_t *)&qword_20210, &qword_20218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_205A0);
  }
  return result;
}

unint64_t sub_EB64()
{
  unint64_t result = qword_205D0;
  if (!qword_205D0)
  {
    sub_44C8(&qword_205C8);
    sub_EE00(&qword_205D8, (void (*)(uint64_t))&type metadata accessor for RFImageView);
    sub_4B20(&qword_205E0, &qword_205E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_205D0);
  }
  return result;
}

uint64_t sub_EC04(uint64_t a1, uint64_t *a2)
{
  sub_4338(a2);
  sub_F1A8();
  uint64_t v3 = sub_F234();
  v4(v3);
  return a1;
}

uint64_t sub_EC4C()
{
  type metadata accessor for SiriHelpSMARTView(0);
  sub_F1BC();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  sub_DF28(*(void *)(v1 + 16), *(void *)(v1 + 24));
  sub_181E0();
  sub_F1A8();
  sub_F244();
  v4();

  swift_release();
  sub_18920();
  sub_F1A8();
  uint64_t v5 = sub_F234();
  v6(v5);
  uint64_t v7 = sub_F250();

  return _swift_deallocObject(v7);
}

uint64_t sub_ED40()
{
  return sub_ED6C(type metadata accessor for SiriHelpSMARTView, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_BAE8);
}

uint64_t sub_ED6C(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a2(v4, v5, v6);
}

uint64_t sub_EDEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_DFAC(a1, a2);
  }
  return a1;
}

uint64_t sub_EE00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_EE48()
{
  uint64_t v1 = sub_180D0();
  sub_F200();
  uint64_t v3 = v2;
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v6 = (*(void *)(v5 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = (int *)(type metadata accessor for SiriHelpSMARTView(0) - 8);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(*(void *)v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v7 + 80);
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v1);
  swift_release();
  sub_181E0();
  sub_F1A8();
  sub_F244();
  v9();

  swift_release();
  sub_18920();
  sub_F1A8();
  sub_F244();
  v10();

  return _swift_deallocObject(v0);
}

void sub_EFE0()
{
  uint64_t v1 = sub_180D0();
  sub_F1E8(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v5 = (*(void *)(v4 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for SiriHelpSMARTView(0);
  sub_F194(v6);
  uint64_t v8 = *(void *)(v0 + v5);
  uint64_t v9 = v0 + ((v5 + *(unsigned __int8 *)(v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  sub_A494((uint64_t *)(v0 + v3), v8, v9);
}

uint64_t sub_F078(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4338(&qword_20430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_F0E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_4338(a3);
  sub_F1D8();
  uint64_t v4 = sub_F324();
  v5(v4);
  return a2;
}

uint64_t sub_F130()
{
  return sub_4B20(&qword_20628, &qword_20630);
}

uint64_t sub_F160()
{
  return sub_4B20(&qword_20638, &qword_20640);
}

uint64_t sub_F194(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_F1E8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_F234()
{
  return v0;
}

uint64_t sub_F250()
{
  return v0;
}

uint64_t sub_F260@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  int v1 = a1 - 1;
  if (v1 < 0) {
    int v1 = -1;
  }
  return (v1 + 1);
}

uint64_t sub_F280()
{
  return sub_18920();
}

uint64_t sub_F29C()
{
  return v0;
}

uint64_t sub_F2B4@<X0>(uint64_t a1@<X8>)
{
  return v1 + ((a1 + 16) & ~a1);
}

uint64_t sub_F2C4()
{
  return sub_181E0();
}

uint64_t sub_F310()
{
  return v0;
}

uint64_t sub_F324()
{
  return v0;
}

uint64_t sub_F338()
{
  return 0;
}

uint64_t sub_F34C()
{
  return sub_E680();
}

uint64_t SiriSuggestionsUIPlugin.__allocating_init()()
{
  sub_182D0();
  uint64_t v0 = sub_182C0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t SiriSuggestionsUIPlugin.__allocating_init(suggestionsFacade:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t SiriSuggestionsUIPlugin.init(suggestionsFacade:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t SiriSuggestionsUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v107 = a1;
  uint64_t v2 = v1;
  uint64_t v96 = type metadata accessor for SiriHelpSnippetView(0);
  sub_F1D8();
  __chkstk_darwin(v3);
  sub_10BC0();
  uint64_t v97 = v4;
  uint64_t v5 = sub_10BEC();
  uint64_t v98 = type metadata accessor for SiriHelpSMARTView(v5);
  sub_F1D8();
  __chkstk_darwin(v6);
  sub_10BC0();
  uint64_t v99 = v7;
  sub_10BEC();
  sub_181E0();
  sub_F200();
  uint64_t v101 = v9;
  uint64_t v102 = v8;
  __chkstk_darwin(v8);
  sub_10BC0();
  uint64_t v100 = v10;
  sub_10BEC();
  uint64_t v92 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_F1D8();
  __chkstk_darwin(v11);
  sub_10BC0();
  uint64_t v94 = v12;
  sub_10BEC();
  uint64_t v95 = sub_18290();
  sub_F200();
  uint64_t v93 = v13;
  __chkstk_darwin(v14);
  sub_10BC0();
  uint64_t v91 = v15;
  sub_10BEC();
  uint64_t v104 = type metadata accessor for SiriHintsSnippetView();
  sub_F1D8();
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v89 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_18220();
  sub_F200();
  uint64_t v105 = v20;
  __chkstk_darwin(v21);
  sub_10BF8();
  uint64_t v103 = v22;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v89 - v24;
  uint64_t v108 = sub_182A0();
  sub_F200();
  uint64_t v27 = v26;
  __chkstk_darwin(v28);
  sub_10BF8();
  uint64_t v90 = v29;
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v89 - v32;
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v89 - v34;
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_18430();
  uint64_t v106 = sub_38BC(v36, (uint64_t)static Logger.uiCategory);
  uint64_t v37 = sub_18410();
  os_log_type_t v38 = sub_18C10();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)sub_10C20();
    uint64_t v89 = v25;
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_0, v37, v38, "Running Suggestions UI plugin", v39, 2u);
    uint64_t v25 = v89;
    sub_10BD4();
  }

  uint64_t v40 = *(void *)(v2 + 16);
  if (v40)
  {
    uint64_t v89 = v33;
    uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
    uint64_t v42 = v108;
    v41(v35, v107, v108);
    int v43 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v35, v42);
    if (v43 == enum case for SuggestionsRFDataModels.hintsView(_:))
    {
      (*(void (**)(char *, uint64_t))(v27 + 96))(v35, v42);
      uint64_t v44 = v105;
      (*(void (**)(char *, char *, uint64_t))(v105 + 32))(v25, v35, v19);
      uint64_t v45 = v103;
      (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v103, v25, v19);
      uint64_t v46 = swift_retain_n();
      sub_114F0(v46, v45, (uint64_t)v18);
      sub_10AF4(&qword_20668, (void (*)(uint64_t))type metadata accessor for SiriHintsSnippetView);
      uint64_t v47 = sub_18700();
      swift_release();
      sub_10A54((uint64_t)v18, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v19);
    }
    else if (v43 == enum case for SuggestionsRFDataModels.helpView(_:))
    {
      (*(void (**)(char *, uint64_t))(v27 + 96))(v35, v108);
      uint64_t v53 = v100;
      uint64_t v52 = v101;
      uint64_t v54 = v102;
      (*(void (**)(uint64_t, char *, uint64_t))(v101 + 32))(v100, v35, v102);
      swift_retain();
      char v55 = sub_181A0();
      uint64_t v56 = sub_18410();
      os_log_type_t v57 = sub_18C10();
      BOOL v58 = os_log_type_enabled(v56, v57);
      if (v55)
      {
        if (v58)
        {
          uint64_t v59 = (uint8_t *)sub_10C20();
          *(_WORD *)uint64_t v59 = 0;
          _os_log_impl(&dword_0, v56, v57, "returning Siri Help SMART snippet", v59, 2u);
          sub_10BD4();
        }

        uint64_t v60 = v99;
        sub_10C0C();
        v61();
        char v62 = sub_181C0();
        uint64_t v63 = v98;
        uint64_t v64 = (uint64_t *)(v60 + *(int *)(v98 + 20));
        sub_18B20();
        sub_437C();
        *uint64_t v64 = sub_18510();
        v64[1] = v65;
        uint64_t v66 = v60 + *(int *)(v63 + 24);
        LOBYTE(v111) = v62 & 1;
        sub_18810();
        uint64_t v67 = v110;
        *(unsigned char *)uint64_t v66 = v109;
        *(void *)(v66 + 8) = v67;
        sub_18910();
        sub_10AF4(&qword_20658, (void (*)(uint64_t))type metadata accessor for SiriHelpSMARTView);
        uint64_t v47 = sub_18700();
        swift_release();
        uint64_t v68 = type metadata accessor for SiriHelpSMARTView;
        uint64_t v69 = v60;
      }
      else
      {
        if (v58)
        {
          uint64_t v76 = (uint8_t *)sub_10C20();
          *(_WORD *)uint64_t v76 = 0;
          _os_log_impl(&dword_0, v56, v57, "returning old RF2 snippet", v76, 2u);
          sub_10BD4();
        }

        uint64_t v77 = v97;
        sub_10C0C();
        v78();
        sub_18B20();
        sub_437C();
        *uint64_t v77 = sub_18510();
        v77[1] = v79;
        sub_18910();
        sub_10AF4(&qword_20650, (void (*)(uint64_t))type metadata accessor for SiriHelpSnippetView);
        uint64_t v47 = sub_18700();
        swift_release();
        uint64_t v68 = type metadata accessor for SiriHelpSnippetView;
        uint64_t v69 = (uint64_t)v77;
      }
      sub_10A54(v69, (void (*)(void))v68);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v53, v54);
    }
    else
    {
      uint64_t v70 = v108;
      if (v43 == enum case for SuggestionsRFDataModels.announcementsView(_:))
      {
        (*(void (**)(char *, uint64_t))(v27 + 96))(v35, v108);
        uint64_t v71 = v93;
        uint64_t v72 = v91;
        uint64_t v73 = v95;
        (*(void (**)(uint64_t, char *, uint64_t))(v93 + 32))(v91, v35, v95);
        uint64_t v74 = v94;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16))(v94 + *(int *)(v92 + 20), v72, v73);
        LOBYTE(v111) = 1;
        swift_retain();
        sub_18810();
        uint64_t v75 = v110;
        *(unsigned char *)uint64_t v74 = v109;
        *(void *)(v74 + 8) = v75;
        sub_18910();
        sub_10AF4(&qword_20660, (void (*)(uint64_t))type metadata accessor for SiriFeatureAnnouncementSnippetView);
        uint64_t v47 = sub_18700();
        swift_release();
        sub_10A54(v74, (void (*)(void))type metadata accessor for SiriFeatureAnnouncementSnippetView);
        (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v73);
      }
      else
      {
        uint64_t v80 = v89;
        v41(v89, v107, v108);
        uint64_t v107 = v40;
        swift_retain();
        uint64_t v81 = sub_18410();
        os_log_type_t v82 = sub_18C30();
        uint64_t v106 = v81;
        if (os_log_type_enabled(v81, v82))
        {
          uint64_t v83 = (uint8_t *)swift_slowAlloc();
          uint64_t v105 = swift_slowAlloc();
          uint64_t v109 = v105;
          *(_DWORD *)uint64_t v83 = 136315138;
          uint64_t v104 = (uint64_t)(v83 + 4);
          v41(v90, (uint64_t)v80, v108);
          uint64_t v84 = sub_18B70();
          uint64_t v111 = sub_1028C(v84, v85, &v109);
          sub_18C70();
          swift_bridgeObjectRelease();
          uint64_t v86 = sub_10C38();
          ((void (*)(uint64_t, uint64_t))v41)(v86, v108);
          uint64_t v87 = v106;
          _os_log_impl(&dword_0, v106, v82, "Unknown model type: %s", v83, 0xCu);
          swift_arrayDestroy();
          uint64_t v70 = v108;
          sub_10BD4();
          sub_10BD4();
        }
        else
        {
          uint64_t v88 = sub_10C38();
          ((void (*)(uint64_t, uint64_t))v41)(v88, v70);
        }
        uint64_t v47 = sub_18700();
        swift_release();
        ((void (*)(char *, uint64_t))v41)(v35, v70);
      }
    }
    return v47;
  }
  else
  {
    uint64_t v48 = sub_18410();
    uint64_t v49 = sub_18C30();
    if (os_log_type_enabled(v48, (os_log_type_t)v49))
    {
      uint64_t v50 = (uint8_t *)sub_10C20();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_0, v48, (os_log_type_t)v49, "Unable to fetch suggestions from facade. Check initalisation errors", v50, 2u);
      sub_10BD4();
    }

    return sub_18700();
  }
}

uint64_t SiriSuggestionsUIPlugin.deinit()
{
  swift_release();
  return v0;
}

uint64_t SiriSuggestionsUIPlugin.__deallocating_deinit()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10154@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriSuggestionsUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_1017C(uint64_t a1)
{
  return SiriSuggestionsUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t sub_101A0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_101B0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_101EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10214(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1028C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_18C70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1028C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10360(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10B60((uint64_t)v12, *a3);
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
      sub_10B60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_42E8((uint64_t)v12);
  return v7;
}

uint64_t sub_10360(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_104B8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_18C80();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10590(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_18CD0();
    if (!v8)
    {
      uint64_t result = sub_18CE0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_104B8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_18CF0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10590(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10628(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10804(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10804((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10628(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_18B90();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_1079C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_18CC0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_18CF0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_18CE0();
  __break(1u);
  return result;
}

void *sub_1079C(uint64_t a1, uint64_t a2)
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
  sub_4338(&qword_20718);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10804(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_4338(&qword_20718);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_109B4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_108DC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_108DC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_18CF0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_109B4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_18CF0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_10A44(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10A54(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_F1D8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10AAC()
{
  return sub_10AF4(&qword_20670, (void (*)(uint64_t))&type metadata accessor for SuggestionsRFDataModels);
}

uint64_t sub_10AF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for SiriSuggestionsUIPlugin()
{
  return self;
}

uint64_t sub_10B60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10BD4()
{
  return swift_slowDealloc();
}

uint64_t sub_10BEC()
{
  return 0;
}

uint64_t sub_10C20()
{
  return swift_slowAlloc();
}

uint64_t sub_10C38()
{
  return v0;
}

char *sub_10C4C(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    char v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    char v5 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    unint64_t v6 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v6;
    int64_t v7 = a2[6];
    *((void *)a1 + 5) = a2[5];
    *((void *)a1 + 6) = v7;
    int64_t v8 = a2[8];
    *((void *)a1 + 7) = a2[7];
    *((void *)a1 + 8) = v8;
    uint64_t v10 = a2[9];
    int64_t v9 = a2[10];
    a1[88] = *((unsigned char *)a2 + 88);
    *((void *)a1 + 9) = v10;
    *((void *)a1 + 10) = v9;
    size_t v11 = a2[13];
    uint64_t v12 = *(int *)(a3 + 40);
    uint64_t v17 = (uint64_t)a2 + v12;
    uint64_t v18 = &a1[v12];
    *((void *)a1 + 12) = a2[12];
    *((void *)a1 + 13) = v11;
    uint64_t v13 = sub_18220();
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    uint64_t v14 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v16(v18, v17, v13);
  }
  return v5;
}

uint64_t sub_10DB0(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_18220();
  unint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v8 = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v8;
  uint64_t v10 = *(void *)(a2 + 104);
  uint64_t v11 = *(int *)(a3 + 40);
  uint64_t v16 = a2 + v11;
  uint64_t v17 = a1 + v11;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v12 = sub_18220();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  id v13 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v15(v17, v16, v12);
  return a1;
}

uint64_t sub_10F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = v9;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_18220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_110E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v10 = sub_18220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, v8, v10);
  return a1;
}

uint64_t sub_11184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_18220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_112A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_112B4);
}

uint64_t sub_112B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_18220();
    uint64_t v9 = a1 + *(int *)(a3 + 40);
    return sub_524C(v9, a2, v8);
  }
}

uint64_t sub_1133C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11350);
}

uint64_t sub_11350(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_18220();
    uint64_t v8 = v5 + *(int *)(a4 + 40);
    return sub_5334(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SiriHintsSnippetView()
{
  uint64_t result = qword_20778;
  if (!qword_20778) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_11418()
{
  uint64_t result = sub_18220();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_114D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_114F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_18B20();
  sub_1480C((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
  *(void *)a3 = sub_18510();
  *(void *)(a3 + 8) = v6;
  sub_18810();
  *(_OWORD *)(a3 + 16) = v10;
  *(void *)(a3 + 32) = v11;
  sub_18810();
  *(_OWORD *)(a3 + 40) = v10;
  *(void *)(a3 + 56) = v11;
  sub_18810();
  *(_OWORD *)(a3 + 64) = v10;
  sub_4338(&qword_20870);
  sub_18810();
  *(void *)(a3 + 80) = v10;
  *(unsigned char *)(a3 + 88) = BYTE8(v10);
  *(void *)(a3 + 96) = v11;
  *(void *)(a3 + 104) = a1;
  uint64_t v7 = a3 + *(int *)(type metadata accessor for SiriHintsSnippetView() + 40);
  sub_18220();
  sub_F1D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(v7, a2);
}

uint64_t sub_1168C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v129 = a1;
  sub_18C00();
  sub_F200();
  uint64_t v126 = v4;
  uint64_t v127 = v3;
  __chkstk_darwin(v3);
  sub_10BC0();
  uint64_t v125 = v5;
  uint64_t v6 = type metadata accessor for SiriHintsSnippetView();
  uint64_t v124 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v124 + 64);
  __chkstk_darwin(v6);
  uint64_t v130 = (uint64_t)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4338(&qword_207C8);
  uint64_t v9 = sub_14974(v8);
  __chkstk_darwin(v9);
  sub_4B80();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_18320();
  sub_F200();
  uint64_t v15 = v14;
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v108 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v108 - v21;
  sub_181F0();
  if (sub_524C(v12, 1, v13) == 1)
  {
    sub_14854(v12, &qword_207C8);
    sub_4338(&qword_207D0);
    uint64_t v128 = &v108;
    sub_F200();
    uint64_t v121 = v24;
    uint64_t v122 = v23;
    __chkstk_darwin(v23);
    sub_10BF8();
    uint64_t v119 = v25;
    v120 = &v108;
    __chkstk_darwin(v26);
    sub_149A4((uint64_t)&v108 - v27);
    uint64_t v116 = (uint64_t *)sub_4338(&qword_207D8);
    uint64_t v118 = &v108;
    sub_F1D8();
    __chkstk_darwin(v28);
    sub_10BC0();
    sub_149A4(v29);
    uint64_t v30 = sub_4338(&qword_207E0);
    uint64_t v115 = &v108;
    long long v113 = (uint64_t (*)())(v30 - 8);
    __chkstk_darwin(v30 - 8);
    sub_4B80();
    uint64_t v33 = v32 - v31;
    uint64_t v123 = sub_4338(&qword_207E8);
    uint64_t v112 = &v108;
    sub_F1D8();
    __chkstk_darwin(v34);
    sub_4B80();
    uint64_t v37 = (uint64_t *)(v36 - v35);
    uint64_t v38 = *(void *)(v1 + 32);
    long long v133 = *(_OWORD *)(v1 + 16);
    *(void *)&long long v134 = v38;
    sub_4338(&qword_207F0);
    sub_18820();
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_18BA0();
    swift_bridgeObjectRelease_n();
    uint64_t v111 = type metadata accessor for SiriHintsSnippetView;
    uint64_t v40 = v130;
    sub_14128(v2, v130, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    uint64_t v41 = *(unsigned __int8 *)(v124 + 80);
    uint64_t v110 = ((v41 + 16) & ~v41) + v7;
    uint64_t v42 = (v41 + 16) & ~v41;
    uint64_t v124 = v42;
    uint64_t v109 = v41 | 7;
    uint64_t v43 = swift_allocObject();
    sub_13F24(v40, v43 + v42);
    uint64_t v44 = v125;
    sub_18BF0();
    uint64_t v45 = sub_184C0();
    uint64_t v46 = sub_14974(v45);
    __chkstk_darwin(v46);
    sub_4B80();
    uint64_t v49 = (void *)(v48 - v47);
    uint64_t v51 = v126;
    uint64_t v50 = v127;
    sub_149B0();
    sub_14998();
    v52();
    *uint64_t v49 = &unk_20800;
    v49[1] = v43;
    sub_14128((uint64_t)v49, (uint64_t)v37 + *(int *)(v123 + 36), (void (*)(void))&type metadata accessor for _TaskModifier);
    *uint64_t v37 = v39;
    swift_retain();
    sub_147B8((uint64_t)v49, (void (*)(void))&type metadata accessor for _TaskModifier);
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v44, v50);
    swift_release();
    uint64_t v53 = *(void *)(v2 + 72);
    *(void *)&long long v133 = *(void *)(v2 + 64);
    *((void *)&v133 + 1) = v53;
    sub_4338(&qword_20808);
    sub_18820();
    char v54 = *(unsigned char *)(v2 + 88);
    uint64_t v55 = *(void *)(v2 + 96);
    *(void *)&long long v133 = *(void *)(v2 + 80);
    BYTE8(v133) = v54;
    *(void *)&long long v134 = v55;
    sub_4338(&qword_20810);
    sub_18820();
    sub_18870();
    sub_18480();
    sub_F0E0((uint64_t)v37, v33, &qword_207E8);
    uint64_t v56 = (_OWORD *)(v33 + *((int *)v113 + 11));
    long long v57 = v134;
    *uint64_t v56 = v133;
    v56[1] = v57;
    v56[2] = v135;
    sub_14854((uint64_t)v37, &qword_207E8);
    uint64_t v58 = sub_186A0();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v60 = v114;
    sub_F0E0(v33, (uint64_t)v114, &qword_207E0);
    uint64_t v61 = v116;
    char v62 = (uint64_t *)&v60[*((int *)v116 + 9)];
    uint64_t *v62 = KeyPath;
    v62[1] = v58;
    sub_14854(v33, &qword_207E0);
    uint64_t v63 = v130;
    sub_14128(v2, v130, (void (*)(void))v111);
    uint64_t v64 = swift_allocObject();
    sub_13F24(v63, v64 + v124);
    unint64_t v65 = sub_141A0();
    uint64_t v66 = v117;
    sub_187A0();
    swift_release();
    sub_14854((uint64_t)v60, &qword_207D8);
    (*(void (**)(uint64_t, uint64_t, char *))(v121 + 32))(v119, v66, v122);
    sub_4338(&qword_20840);
    sub_F1D8();
    __chkstk_darwin(v67);
    sub_4B80();
    sub_149B0();
    sub_14998();
    v68();
    swift_storeEnumTagMultiPayload();
    sub_4338(&qword_20848);
    unint64_t v69 = sub_14280();
    uint64_t v131 = v123;
    unint64_t v132 = v69;
    swift_getOpaqueTypeConformance2();
    uint64_t v131 = (uint64_t)v61;
    unint64_t v132 = v65;
    swift_getOpaqueTypeConformance2();
    sub_185F0();
    uint64_t v70 = sub_14980();
  }
  else
  {
    uint64_t v123 = v15;
    long long v114 = *(char **)(v15 + 32);
    ((void (*)(char *, uint64_t, uint64_t))v114)(v22, v12, v13);
    sub_4338(&qword_20848);
    uint64_t v128 = &v108;
    sub_F200();
    v120 = v74;
    uint64_t v121 = v73;
    __chkstk_darwin(v73);
    sub_10BF8();
    uint64_t v117 = v75;
    uint64_t v118 = &v108;
    __chkstk_darwin(v76);
    sub_149A4((uint64_t)&v108 - v77);
    uint64_t v112 = (uint64_t *)sub_4338(&qword_207E8);
    uint64_t v116 = &v108;
    sub_F1D8();
    __chkstk_darwin(v78);
    sub_10BC0();
    sub_149A4(v79);
    uint64_t v122 = v22;
    sub_18300();
    uint64_t v109 = sub_18BA0();
    swift_bridgeObjectRelease();
    long long v113 = type metadata accessor for SiriHintsSnippetView;
    uint64_t v80 = v130;
    sub_14128(v1, v130, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    uint64_t v81 = v123;
    sub_149B0();
    sub_149BC();
    uint64_t v119 = v13;
    sub_14998();
    v82();
    uint64_t v83 = *(unsigned __int8 *)(v124 + 80);
    uint64_t v84 = (v83 + 16) & ~v83;
    uint64_t v124 = v84 + v7;
    uint64_t v110 = v83 | 7;
    uint64_t v85 = *(unsigned __int8 *)(v81 + 80);
    uint64_t v108 = v1;
    uint64_t v86 = (v84 + v7 + v85) & ~v85;
    uint64_t v87 = swift_allocObject();
    sub_13F24(v80, v87 + v84);
    ((void (*)(uint64_t, char *, uint64_t))v114)(v87 + v86, v20, v13);
    uint64_t v88 = v125;
    sub_18BF0();
    uint64_t v89 = sub_184C0();
    uint64_t v90 = sub_14974(v89);
    __chkstk_darwin(v90);
    sub_4B80();
    uint64_t v93 = (void *)(v92 - v91);
    uint64_t v95 = v126;
    uint64_t v94 = v127;
    sub_14998();
    v96();
    *uint64_t v93 = &unk_20858;
    v93[1] = v87;
    uint64_t v97 = v112;
    uint64_t v98 = (uint64_t *)v111;
    sub_14128((uint64_t)v93, (uint64_t)v111 + *((int *)v112 + 9), (void (*)(void))&type metadata accessor for _TaskModifier);
    *uint64_t v98 = v109;
    swift_retain();
    sub_147B8((uint64_t)v93, (void (*)(void))&type metadata accessor for _TaskModifier);
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v88, v94);
    swift_release();
    sub_14128(v108, v80, (void (*)(void))v113);
    uint64_t v99 = swift_allocObject();
    sub_13F24(v80, v99 + v84);
    unint64_t v100 = sub_14280();
    uint64_t v101 = v115;
    sub_187A0();
    swift_release();
    sub_14854((uint64_t)v98, &qword_207E8);
    ((void (*)(uint64_t, uint64_t *, uint64_t))v120[4])(v117, v101, v121);
    uint64_t v102 = sub_4338(&qword_20840);
    __chkstk_darwin(v102);
    sub_4B80();
    sub_149B0();
    sub_14998();
    v103();
    swift_storeEnumTagMultiPayload();
    sub_4338(&qword_207D0);
    *(void *)&long long v133 = v97;
    *((void *)&v133 + 1) = v100;
    swift_getOpaqueTypeConformance2();
    uint64_t v104 = sub_44C8(&qword_207D8);
    unint64_t v105 = sub_141A0();
    *(void *)&long long v133 = v104;
    *((void *)&v133 + 1) = v105;
    swift_getOpaqueTypeConformance2();
    sub_185F0();
    sub_14980();
    sub_F244();
    v106();
    uint64_t v70 = (uint64_t)v122;
    uint64_t v72 = *(uint64_t (**)(uint64_t, uint64_t))(v123 + 8);
    uint64_t v71 = v119;
  }
  return v72(v70, v71);
}

uint64_t sub_12348(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = a2;
  uint64_t v3 = sub_18340();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  sub_18BE0();
  v2[17] = sub_18BD0();
  uint64_t v5 = sub_18BC0();
  return _swift_task_switch(sub_1243C, v5, v4);
}

uint64_t sub_1243C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[12];
  swift_release();
  sub_18CB0(18);
  swift_bridgeObjectRelease();
  sub_18310();
  uint64_t v5 = sub_18330();
  uint64_t v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v21._countAndFlagsBits = v5;
  v21._object = v7;
  sub_18B80(v21);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v4 + 40);
  uint64_t v9 = *(void *)(v4 + 48);
  uint64_t v10 = *(void *)(v4 + 56);
  v0[2] = v8;
  v0[3] = v9;
  v0[4] = v10;
  v0[8] = 0xD000000000000010;
  v0[9] = 0x800000000001B320;
  sub_4338(&qword_207F0);
  sub_18830();
  v0[5] = v8;
  v0[6] = v9;
  v0[7] = v10;
  sub_18820();
  uint64_t v11 = sub_4338(&qword_204A0);
  sub_14974(v11);
  sub_14A40();
  sub_18930();
  uint64_t v12 = sub_18940();
  id v13 = objc_allocWithZone((Class)sub_149E8(v12));
  uint64_t v14 = sub_149BC();
  uint64_t v16 = (void *)sub_149C8(v14, v15);
  swift_task_dealloc();
  if (*(void *)v4)
  {
    id v17 = *(id *)v4;
    sub_18B10();

    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  else
  {
    sub_18B20();
    sub_1480C((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
    return sub_14A20();
  }
}

void sub_1266C(uint64_t a1)
{
  uint64_t v2 = sub_18000();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SiriHintsSnippetView();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_18430();
  sub_38BC(v9, (uint64_t)static Logger.uiCategory);
  sub_14128(a1, (uint64_t)v8, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
  uint64_t v10 = sub_18410();
  os_log_type_t v11 = sub_18C20();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v28 = v5;
    uint64_t v29 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v27 = v3;
    uint64_t v14 = *((void *)v8 + 7);
    long long v30 = *(_OWORD *)(v8 + 40);
    uint64_t v31 = v14;
    sub_4338(&qword_207F0);
    sub_18820();
    *(void *)&long long v30 = sub_1028C(v32, v33, &v29);
    uint64_t v3 = v27;
    sub_18C70();
    swift_bridgeObjectRelease();
    sub_147B8((uint64_t)v8, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    _os_log_impl(&dword_0, v10, v11, "Component was tapped for suggestion with loggingId: %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v28;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_147B8((uint64_t)v8, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
  }

  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Command.noOp(_:), v2);
  uint64_t v15 = sub_18960();
  __chkstk_darwin(v15);
  (*(void (**)(char *, void))(v17 + 104))((char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InteractionType.buttonTapped(_:));
  uint64_t v18 = sub_4338(&qword_204A0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18930();
  uint64_t v21 = sub_18940();
  sub_5334((uint64_t)v20, 0, 1, v21);
  uint64_t v22 = *(void *)(a1 + 56);
  long long v30 = *(_OWORD *)(a1 + 40);
  uint64_t v31 = v22;
  sub_4338(&qword_207F0);
  sub_18820();
  id v23 = objc_allocWithZone((Class)sub_18A80());
  uint64_t v24 = sub_18A70();
  if (*(void *)a1)
  {
    uint64_t v25 = (void *)v24;
    id v26 = *(id *)a1;
    sub_18B10();
  }
  else
  {
    sub_18B20();
    sub_1480C((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18500();
    __break(1u);
  }
}

uint64_t sub_12B64(uint64_t a1)
{
  v1[32] = a1;
  uint64_t v2 = sub_183E0();
  v1[33] = v2;
  v1[34] = *(void *)(v2 - 8);
  v1[35] = swift_task_alloc();
  uint64_t v3 = sub_183A0();
  v1[36] = v3;
  v1[37] = *(void *)(v3 - 8);
  v1[38] = swift_task_alloc();
  uint64_t v4 = sub_18380();
  v1[39] = v4;
  v1[40] = *(void *)(v4 - 8);
  v1[41] = swift_task_alloc();
  uint64_t v5 = sub_183C0();
  v1[42] = v5;
  v1[43] = *(void *)(v5 - 8);
  v1[44] = swift_task_alloc();
  sub_4338(&qword_20860);
  v1[45] = swift_task_alloc();
  uint64_t v6 = sub_18070();
  v1[46] = v6;
  v1[47] = *(void *)(v6 - 8);
  v1[48] = swift_task_alloc();
  v1[49] = type metadata accessor for SiriHintsSnippetView();
  v1[50] = swift_task_alloc();
  v1[51] = swift_task_alloc();
  sub_18BE0();
  v1[52] = sub_18BD0();
  uint64_t v8 = sub_18BC0();
  v1[53] = v8;
  v1[54] = v7;
  return _swift_task_switch(sub_12E38, v8, v7);
}

uint64_t sub_12E38()
{
  long long v30 = v0;
  uint64_t v1 = sub_17F00();
  v0[55] = v1;
  sub_F200();
  uint64_t v3 = v2;
  v0[56] = v2;
  uint64_t v4 = sub_14A40();
  v0[57] = v4;
  uint64_t v5 = sub_4338(&qword_20868);
  sub_14974(v5);
  uint64_t v6 = sub_14A40();
  sub_18210();
  sub_17EE0();
  swift_bridgeObjectRelease();
  if (sub_524C(v6, 1, v1) == 1)
  {
    sub_14854(v6, &qword_20868);
    swift_task_dealloc();
    if (qword_20160 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[51];
    uint64_t v8 = v0[32];
    uint64_t v9 = sub_18430();
    sub_38BC(v9, (uint64_t)static Logger.uiCategory);
    sub_14128(v8, v7, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    uint64_t v10 = sub_18410();
    os_log_type_t v11 = sub_18C30();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = v0[51];
    if (v12)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v15 = sub_18210();
      v0[31] = sub_1028C(v15, v16, &v29);
      sub_18C70();
      swift_bridgeObjectRelease();
      sub_147B8(v13, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
      _os_log_impl(&dword_0, v10, v11, "unable to create requestID from %s", v14, 0xCu);
      swift_arrayDestroy();
      sub_10BD4();
      sub_10BD4();
    }
    else
    {
      sub_147B8(v0[51], (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    }

    sub_17EF0();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v4, v6, v1);
    swift_task_dealloc();
  }
  uint64_t v18 = v0[43];
  uint64_t v17 = v0[44];
  uint64_t v19 = v0[42];
  uint64_t v20 = enum case for SiriHintsMode.display(_:);
  sub_18350();
  sub_F1D8();
  (*(void (**)(uint64_t, uint64_t))(v21 + 104))(v17, v20);
  (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v17, enum case for DeliveryVehicle.siriHints(_:), v19);
  sub_18200();
  unint64_t v23 = v22;
  uint64_t v24 = (void *)swift_task_alloc();
  v0[58] = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_1321C;
  uint64_t v26 = v0[44];
  uint64_t v25 = v0[45];
  v27.n128_u64[0] = v23;
  return SiriSuggestionsFacade.fetchTopPreGeneratedSiriHint(requestUUID:forDeliveryVehicle:timeoutSeconds:)(v25, v4, v26, v27);
}

uint64_t sub_1321C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 352);
  uint64_t v3 = *(void *)(*v0 + 344);
  uint64_t v4 = *(void *)(*v0 + 336);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 432);
  uint64_t v6 = *(void *)(v1 + 424);
  return _swift_task_switch(sub_133A0, v6, v5);
}

uint64_t sub_133A0()
{
  uint64_t v58 = v0;
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 368);
  swift_release();
  if (sub_524C(v1, 1, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 360);
    (*(void (**)(void, void))(*(void *)(v0 + 448) + 8))(*(void *)(v0 + 456), *(void *)(v0 + 440));
    sub_14854(v3, &qword_20860);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 320);
    uint64_t v4 = *(void *)(v0 + 328);
    uint64_t v7 = *(void *)(v0 + 304);
    uint64_t v6 = *(void *)(v0 + 312);
    uint64_t v8 = *(void *)(v0 + 296);
    uint64_t v53 = *(void *)(v0 + 288);
    uint64_t v55 = v6;
    uint64_t v9 = *(void *)(v0 + 256);
    (*(void (**)(void, void, void))(*(void *)(v0 + 376) + 32))(*(void *)(v0 + 384), *(void *)(v0 + 360), *(void *)(v0 + 368));
    sub_18050();
    sub_18360();
    char v54 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v54(v4, v6);
    uint64_t v10 = sub_18390();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v53);
    uint64_t v13 = *(void *)(v9 + 32);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v9 + 16);
    *(void *)(v0 + 32) = v13;
    *(void *)(v0 + 200) = v10;
    *(void *)(v0 + 208) = v12;
    sub_4338(&qword_207F0);
    sub_18830();
    sub_18050();
    sub_18370();
    v54(v4, v55);
    uint64_t v14 = v9;
    uint64_t v15 = sub_183D0();
    uint64_t v17 = v16;
    sub_F244();
    v18();
    uint64_t v19 = *(void *)(v9 + 56);
    *(_OWORD *)(v0 + 64) = *(_OWORD *)(v9 + 40);
    *(void *)(v0 + 80) = v19;
    *(void *)(v0 + 152) = v15;
    *(void *)(v0 + 160) = v17;
    sub_18830();
    uint64_t v20 = *(void *)(v9 + 72);
    *(void *)(v0 + 136) = *(void *)(v9 + 64);
    *(void *)(v0 + 144) = v20;
    *(void *)(v0 + 232) = 0x7FF0000000000000;
    sub_4338(&qword_20808);
    sub_18830();
    char v21 = *(unsigned char *)(v9 + 88);
    uint64_t v22 = *(void *)(v9 + 96);
    *(void *)(v0 + 88) = *(void *)(v9 + 80);
    *(unsigned char *)(v0 + 96) = v21;
    *(void *)(v0 + 104) = v22;
    *(void *)(v0 + 216) = 0;
    *(unsigned char *)(v0 + 224) = 1;
    sub_4338(&qword_20810);
    sub_18830();
    if (qword_20160 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_18430();
    sub_38BC(v23, (uint64_t)static Logger.uiCategory);
    uint64_t v24 = sub_149BC();
    sub_14128(v24, v25, v26);
    __n128 v27 = sub_18410();
    os_log_type_t v28 = sub_18C10();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = *(void *)(v0 + 400);
    if (v29)
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      uint64_t v56 = v32;
      uint64_t v33 = *(void *)(v30 + 56);
      *(_OWORD *)(v0 + 112) = *(_OWORD *)(v30 + 40);
      *(void *)(v0 + 128) = v33;
      sub_18820();
      *(void *)(v0 + 240) = sub_1028C(*(void *)(v0 + 168), *(void *)(v0 + 176), &v56);
      sub_18C70();
      swift_bridgeObjectRelease();
      sub_147B8(v30, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
      _os_log_impl(&dword_0, v27, v28, "Showing suggestion with loggingId - %s", v31, 0xCu);
      swift_arrayDestroy();
      sub_10BD4();
      sub_10BD4();
    }
    else
    {
      sub_147B8(*(void *)(v0 + 400), (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    }

    uint64_t v34 = *(void ***)(v0 + 256);
    uint64_t v35 = (void (*)(void))sub_18060();
    v35();
    swift_release();
    uint64_t v56 = 0x746E694869726953;
    unint64_t v57 = 0xE900000000000023;
    uint64_t v36 = *(void *)(v14 + 56);
    *(_OWORD *)(v0 + 40) = *(_OWORD *)(v14 + 40);
    *(void *)(v0 + 56) = v36;
    sub_18820();
    sub_18B80(*(Swift::String *)(v0 + 184));
    swift_bridgeObjectRelease();
    uint64_t v38 = v56;
    uint64_t v37 = v57;
    uint64_t v39 = sub_4338(&qword_204A0);
    sub_14974(v39);
    sub_14A40();
    sub_18930();
    uint64_t v40 = sub_18940();
    id v41 = objc_allocWithZone((Class)sub_149E8(v40));
    uint64_t v42 = (void *)sub_149C8(v38, v37);
    swift_task_dealloc();
    uint64_t v43 = *v34;
    if (!*v34)
    {
      sub_18B20();
      sub_1480C((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
      return sub_14A20();
    }
    uint64_t v45 = *(void *)(v0 + 448);
    uint64_t v44 = *(void *)(v0 + 456);
    uint64_t v46 = *(void *)(v0 + 440);
    uint64_t v48 = *(void *)(v0 + 376);
    uint64_t v47 = *(void *)(v0 + 384);
    uint64_t v49 = *(void *)(v0 + 368);
    id v50 = v43;
    sub_18B10();

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
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
  uint64_t v51 = *(uint64_t (**)(void))(v0 + 8);
  return v51();
}

void sub_139F0(uint64_t a1)
{
  uint64_t v2 = sub_18000();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SiriHintsSnippetView();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_18430();
  sub_38BC(v9, (uint64_t)static Logger.uiCategory);
  sub_14128(a1, (uint64_t)v8, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
  uint64_t v10 = sub_18410();
  os_log_type_t v11 = sub_18C20();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    BOOL v29 = v5;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v28 = v3;
    uint64_t v14 = *((void *)v8 + 7);
    long long v30 = *(_OWORD *)(v8 + 40);
    uint64_t v31 = v14;
    v32._countAndFlagsBits = v13;
    sub_4338(&qword_207F0);
    sub_18820();
    *(void *)&long long v30 = sub_1028C(v33, v34, &v32._countAndFlagsBits);
    uint64_t v3 = v28;
    sub_18C70();
    swift_bridgeObjectRelease();
    sub_147B8((uint64_t)v8, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
    _os_log_impl(&dword_0, v10, v11, "Component was tapped for suggestion with loggingID: %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v29;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_147B8((uint64_t)v8, (void (*)(void))type metadata accessor for SiriHintsSnippetView);
  }

  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Command.noOp(_:), v2);
  uint64_t v15 = sub_18960();
  __chkstk_darwin(v15);
  (*(void (**)(char *, void))(v17 + 104))((char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InteractionType.buttonTapped(_:));
  uint64_t v18 = sub_4338(&qword_204A0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18930();
  uint64_t v21 = sub_18940();
  sub_5334((uint64_t)v20, 0, 1, v21);
  uint64_t v33 = 0x746E694869726953;
  unint64_t v34 = 0xE900000000000023;
  uint64_t v22 = *(void *)(a1 + 56);
  long long v30 = *(_OWORD *)(a1 + 40);
  uint64_t v31 = v22;
  sub_4338(&qword_207F0);
  sub_18820();
  sub_18B80(v32);
  swift_bridgeObjectRelease();
  id v23 = objc_allocWithZone((Class)sub_18A80());
  uint64_t v24 = sub_18A70();
  if (*(void *)a1)
  {
    uint64_t v25 = (void *)v24;
    id v26 = *(id *)a1;
    sub_18B10();
  }
  else
  {
    sub_18B20();
    sub_1480C((unint64_t *)&qword_20170, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18500();
    __break(1u);
  }
}

uint64_t sub_13F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriHintsSnippetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_13F88()
{
  uint64_t v2 = type metadata accessor for SiriHintsSnippetView();
  sub_F194(v2);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_14034;
  return sub_12B64(v4);
}

uint64_t sub_14034()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_14128(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_F1D8();
  uint64_t v4 = sub_F324();
  v5(v4);
  return a2;
}

uint64_t sub_14188()
{
  return sub_14764((uint64_t (*)(uint64_t))sub_139F0);
}

unint64_t sub_141A0()
{
  unint64_t result = qword_20818;
  if (!qword_20818)
  {
    sub_44C8(&qword_207D8);
    sub_14210();
    sub_14354();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20818);
  }
  return result;
}

unint64_t sub_14210()
{
  unint64_t result = qword_20820;
  if (!qword_20820)
  {
    sub_44C8(&qword_207E0);
    sub_14280();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20820);
  }
  return result;
}

unint64_t sub_14280()
{
  unint64_t result = qword_20828;
  if (!qword_20828)
  {
    sub_44C8(&qword_207E8);
    sub_14308();
    sub_1480C(&qword_20838, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20828);
  }
  return result;
}

unint64_t sub_14308()
{
  unint64_t result = qword_20830;
  if (!qword_20830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20830);
  }
  return result;
}

unint64_t sub_14354()
{
  unint64_t result = qword_20210;
  if (!qword_20210)
  {
    sub_44C8(&qword_20218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20210);
  }
  return result;
}

uint64_t sub_1439C()
{
  uint64_t v1 = *(void *)(type metadata accessor for SiriHintsSnippetView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = sub_18320();
  sub_F200();
  uint64_t v6 = v5;
  unint64_t v7 = (v2 + v3 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18220();
  sub_F1D8();
  sub_F244();
  v8();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v4);

  return _swift_deallocObject(v0);
}

uint64_t sub_14518()
{
  type metadata accessor for SiriHintsSnippetView();
  uint64_t v1 = sub_18320();
  sub_F194(v1);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *unint64_t v2 = v0;
  v2[1] = sub_14970;
  uint64_t v3 = sub_149BC();
  return sub_12348(v3, v4);
}

uint64_t sub_1462C()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriHintsSnippetView() - 8) + 80);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18220();
  sub_F1D8();
  sub_F244();
  v2();

  return _swift_deallocObject(v0);
}

uint64_t sub_1474C()
{
  return sub_14764((uint64_t (*)(uint64_t))sub_1266C);
}

uint64_t sub_14764(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SiriHintsSnippetView();
  sub_F194(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t sub_147B8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_F1D8();
  sub_F244();
  v3();
  return a1;
}

uint64_t sub_1480C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_14854(uint64_t a1, uint64_t *a2)
{
  sub_4338(a2);
  sub_F1D8();
  sub_F244();
  v3();
  return a1;
}

unint64_t sub_148A8()
{
  unint64_t result = qword_20878;
  if (!qword_20878)
  {
    sub_44C8(&qword_20880);
    sub_44C8(&qword_207E8);
    sub_14280();
    swift_getOpaqueTypeConformance2();
    sub_44C8(&qword_207D8);
    sub_141A0();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20878);
  }
  return result;
}

uint64_t sub_14974(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_14980()
{
  return v0;
}

void sub_149A4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_149BC()
{
  return v0;
}

uint64_t sub_149C8(uint64_t a1, uint64_t a2)
{
  return RFComponentShown.init(componentName:componentType:componentIndex:)(a1, a2, v2, 0, 1);
}

uint64_t sub_149E8(uint64_t a1)
{
  sub_5334(v1, 0, 1, a1);
  return type metadata accessor for RFComponentShown(0);
}

uint64_t sub_14A20()
{
  return sub_18500();
}

uint64_t sub_14A40()
{
  return swift_task_alloc();
}

uint64_t *sub_14A58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_18290();
    os_log_type_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    v11(v8, v9, v10);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_18920();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return v4;
}

uint64_t sub_14BA0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_18290();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_18920();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t sub_14C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_18290();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_14D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_18290();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_14E44(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_18290();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_18920();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_14F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_18290();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_18920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_14FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_15010);
}

uint64_t sub_15010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
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
    sub_18290();
    sub_F21C();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v11 = sub_18920();
      uint64_t v12 = *(int *)(a3 + 24);
    }
    return sub_524C(a1 + v12, a2, v11);
  }
}

uint64_t sub_150C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_150DC);
}

uint64_t sub_150DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    sub_18290();
    sub_F21C();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_18920();
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return sub_5334(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SiriFeatureAnnouncementSnippetView()
{
  uint64_t result = qword_208E0;
  if (!qword_208E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_151CC()
{
  uint64_t result = sub_18290();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_18920();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_152A0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_152BC(uint64_t *a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v2 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  uint64_t v3 = sub_F1E8(v2);
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v3);
  uint64_t v32 = sub_4338(&qword_20988);
  sub_F200();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_4B80();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_4338(&qword_20990);
  sub_F200();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_17DF4();
  sub_172AC(v1, (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v19 = swift_allocObject();
  sub_17314((uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  sub_4338(&qword_20998);
  sub_178D8();
  sub_18840();
  uint64_t v20 = sub_184E0();
  sub_F200();
  uint64_t v22 = v21;
  __chkstk_darwin(v23);
  sub_4B80();
  uint64_t v26 = v25 - v24;
  sub_184D0();
  uint64_t v27 = sub_4B20(&qword_209C8, &qword_20990);
  uint64_t v28 = sub_17C4C(&qword_209D0, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  sub_18790();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v26, v20);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v1, v14);
  uint64_t v34 = v14;
  uint64_t v35 = v20;
  uint64_t v36 = v27;
  uint64_t v37 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v32;
  uint64_t v30 = sub_18700();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v29);
  uint64_t v31 = v33;
  v33[3] = (uint64_t)&type metadata for AnyView;
  v31[4] = (uint64_t)&protocol witness table for AnyView;
  *uint64_t v31 = v30;
  sub_17DC0();
}

uint64_t sub_155B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  sub_17A90();
  uint64_t v29 = sub_18C60();
  uint64_t v5 = sub_188C0();
  uint64_t v27 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v26 - v10;
  sub_188B0();
  sub_188D0();
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v26 = v6 + 8;
  uint64_t v28 = v12;
  v12(v11, v5);
  sub_172AC(a1, (uint64_t)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v14 = swift_allocObject();
  sub_17314((uint64_t)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  aBlock[4] = sub_17BC8;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_15A14;
  aBlock[3] = &unk_1D6C0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  uint64_t v16 = sub_188A0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18890();
  uint64_t v20 = sub_18880();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_17C4C(&qword_209E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4338(&qword_209F0);
  sub_17C94();
  sub_18C90();
  uint64_t v24 = (void *)v29;
  sub_18C50();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  return v28(v9, v27);
}

uint64_t sub_159C0()
{
  return sub_18830();
}

uint64_t sub_15A14(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_15A58@<X0>(uint64_t *a1@<X8>)
{
  sub_187E0();
  uint64_t v2 = sub_4338(&qword_209D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_185D0();
  uint64_t v5 = sub_185E0();
  sub_5334((uint64_t)v4, 0, 1, v5);
  uint64_t v6 = sub_187F0();
  swift_release();
  sub_14854((uint64_t)v4, &qword_209D8);
  uint64_t v7 = sub_187D0();
  uint64_t v8 = sub_18800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.Scale.medium(_:), v8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = sub_4338(&qword_209C0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (uint64_t *)((char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v16 + *(int *)(v14 + 36), v11, v8);
  *uint64_t v16 = KeyPath;
  uint64_t v17 = sub_4338(&qword_20998);
  sub_17A34((uint64_t)v16, (uint64_t)a1 + *(int *)(v17 + 36), &qword_209C0);
  *a1 = v6;
  a1[1] = v7;
  swift_retain();
  swift_retain();
  sub_14854((uint64_t)v16, &qword_209C0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

void sub_15CEC(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  uint64_t v5 = sub_F1E8(v4);
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = v1 + *(int *)(__chkstk_darwin(v5) + 28);
  sub_18260();
  if (!v11)
  {
    if (qword_20160 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_18430();
    sub_38BC(v19, (uint64_t)static Logger.uiCategory);
    uint64_t v20 = (void *)sub_18410();
    os_log_type_t v21 = sub_18C30();
    if (!sub_17D88(v21)) {
      goto LABEL_15;
    }
    uint64_t v22 = (_WORD *)sub_10C20();
    sub_17E24(v22);
    uint64_t v25 = "Button label is nil, returning empty announcement view";
    goto LABEL_14;
  }
  uint64_t v12 = sub_18270();
  if (v13)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    uint64_t v70 = v7;
    uint64_t v16 = sub_4338(&qword_20960);
    uint64_t v17 = sub_14974(v16);
    __chkstk_darwin(v17);
    sub_17DA4();
    sub_17EA0();
    uint64_t v18 = sub_17EB0();
    if (sub_524C(v10, 1, v18) != 1)
    {
      sub_14854(v10, &qword_20960);
      uint64_t v68 = sub_4338(&qword_20968);
      unint64_t v69 = &v60;
      sub_F1D8();
      __chkstk_darwin(v29);
      sub_4B80();
      uint64_t v66 = (uint64_t *)a1;
      uint64_t v32 = v31 - v30;
      uint64_t v33 = sub_185B0();
      uint64_t v67 = &v60;
      uint64_t v34 = sub_14974(v33);
      __chkstk_darwin(v34);
      sub_17DA4();
      sub_185A0();
      sub_18590();
      sub_18580();
      swift_bridgeObjectRelease();
      sub_18590();
      uint64_t v35 = v14;
      sub_18580();
      sub_18590();
      sub_185C0();
      uint64_t v36 = sub_186E0();
      uint64_t v64 = v37;
      uint64_t v65 = v36;
      uint64_t v62 = v38;
      int v63 = v39 & 1;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v40 = sub_184B0();
      uint64_t v67 = &v60;
      sub_F200();
      uint64_t v42 = v41;
      __chkstk_darwin(v43);
      sub_4B80();
      uint64_t v46 = v45 - v44;
      sub_172AC(v2, (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
      unint64_t v47 = (*((unsigned __int8 *)v70 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v70 + 80);
      uint64_t v48 = swift_allocObject();
      sub_17314((uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v48 + v47);
      uint64_t v49 = (uint64_t *)(v48 + ((v9 + v47 + 7) & 0xFFFFFFFFFFFFFFF8));
      *uint64_t v49 = v35;
      v49[1] = v15;
      sub_184A0();
      uint64_t v50 = sub_4338(&qword_20970);
      uint64_t v70 = &v60;
      uint64_t v51 = sub_14974(v50);
      __chkstk_darwin(v51);
      sub_4B80();
      char v54 = (uint64_t *)(v53 - v52);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v53 - v52 + *(int *)(v55 + 36), v46, v40);
      uint64_t *v54 = KeyPath;
      sub_17A34((uint64_t)v54, v32 + *(int *)(v68 + 36), &qword_20970);
      uint64_t v57 = v64;
      uint64_t v56 = v65;
      *(void *)uint64_t v32 = v65;
      *(void *)(v32 + 8) = v57;
      LOBYTE(v35) = v63;
      *(unsigned char *)(v32 + 16) = v63;
      *(void *)(v32 + 24) = v62;
      sub_E3A8(v56, v57, v35);
      swift_bridgeObjectRetain();
      sub_14854((uint64_t)v54, &qword_20970);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v46, v40);
      sub_DE48(v56, v57, v35);
      swift_bridgeObjectRelease();
      sub_17708();
      uint64_t v58 = sub_18700();
      sub_14854(v32, &qword_20968);
      uint64_t v59 = v66;
      v66[3] = (uint64_t)&type metadata for AnyView;
      v59[4] = (uint64_t)&protocol witness table for AnyView;
      *uint64_t v59 = v58;
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_14854(v10, &qword_20960);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_18430();
  sub_38BC(v26, (uint64_t)static Logger.uiCategory);
  uint64_t v20 = (void *)sub_18410();
  os_log_type_t v27 = sub_18C30();
  if (sub_17D88(v27))
  {
    uint64_t v28 = (_WORD *)sub_10C20();
    sub_17E24(v28);
    uint64_t v25 = "Button link is nil, returning empty announcement view";
LABEL_14:
    sub_17D68(&dword_0, v23, v24, v25);
    sub_17DD8();
  }
LABEL_15:

  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
LABEL_16:
  sub_17DC0();
}

id sub_162A4()
{
  uint64_t v0 = sub_182F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v24 - v5;
  type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_18230();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for FeatureType.panIndia(_:), v0);
  char v7 = sub_16674();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if (v7)
  {
    id result = [self defaultWorkspace];
    if (!result)
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v11 = sub_4338(&qword_20960);
    __chkstk_darwin(v11 - 8);
    uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_17EA0();
    uint64_t v14 = sub_17EB0();
    uint64_t v15 = 0;
    if (sub_524C((uint64_t)v13, 1, v14) != 1)
    {
      uint64_t v15 = (void *)sub_17E90();
      (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
    }
    uint64_t v16 = sub_18B40();
    sub_17838((uint64_t)v15, v16, v10);
  }
  id result = [self defaultWorkspace];
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v17 = result;
  uint64_t v18 = sub_4338(&qword_20960);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17EA0();
  uint64_t v21 = sub_17EB0();
  uint64_t v22 = 0;
  if (sub_524C((uint64_t)v20, 1, v21) != 1)
  {
    uint64_t v22 = (void *)sub_17E90();
    (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  }
  uint64_t v23 = sub_18B40();
  sub_17838((uint64_t)v22, v23, v17);

  return (id)sub_18490();
}

uint64_t sub_16674()
{
  sub_182F0();
  sub_17CE8();
  sub_18BB0();
  sub_18BB0();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_18D00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

void sub_16728(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_17F20();
  sub_F200();
  uint64_t v95 = v5;
  uint64_t v96 = v4;
  __chkstk_darwin(v4);
  sub_10BC0();
  uint64_t v94 = v6;
  sub_18010();
  sub_F200();
  uint64_t v92 = v8;
  uint64_t v93 = v7;
  __chkstk_darwin(v7);
  sub_4B80();
  uint64_t v11 = (uint64_t *)(v10 - v9);
  uint64_t v12 = sub_18040();
  uint64_t v13 = sub_14974(v12);
  __chkstk_darwin(v13);
  sub_10BC0();
  uint64_t v91 = v14;
  uint64_t v15 = sub_182F0();
  sub_F200();
  uint64_t v17 = v16;
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)v89 - v22;
  type metadata accessor for SiriFeatureAnnouncementSnippetView();
  uint64_t v24 = sub_18280();
  if (v25)
  {
    v89[4] = v24;
    v89[5] = v25;
    uint64_t v90 = a1;
    sub_18230();
    (*(void (**)(char *, void, uint64_t))(v17 + 104))(v21, enum case for FeatureType.panIndia(_:), v15);
    char v26 = sub_16674();
    os_log_type_t v27 = *(void (**)(char *, uint64_t))(v17 + 8);
    v27(v21, v15);
    v27(v23, v15);
    if (v26)
    {
      sub_15CEC((uint64_t)&v114);
      if (!v116)
      {
        swift_bridgeObjectRelease();
        sub_14854((uint64_t)&v114, &qword_20958);
        if (qword_20160 != -1) {
          swift_once();
        }
        uint64_t v81 = sub_18430();
        sub_38BC(v81, (uint64_t)static Logger.uiCategory);
        os_log_type_t v82 = (void *)sub_18410();
        os_log_type_t v83 = sub_18C30();
        BOOL v84 = sub_17D88(v83);
        uint64_t v85 = v90;
        if (v84)
        {
          uint64_t v86 = (_WORD *)sub_10C20();
          sub_17E24(v86);
          sub_17D68(&dword_0, v87, v88, "Announcement button is nil, returning empty announcement view");
          sub_17DD8();
        }

        uint64_t v78 = sub_18B00();
        uint64_t v79 = v85;
        uint64_t v80 = 1;
        goto LABEL_14;
      }
      sub_14854((uint64_t)&v114, &qword_20958);
      uint64_t v114 = sub_18250();
      uint64_t v115 = v28;
      sub_DDB8();
      uint64_t v29 = sub_186F0();
      uint64_t v31 = v30;
      char v33 = v32;
      uint64_t v35 = v34;
      uint64_t v116 = &type metadata for Text;
      uint64_t v117 = &protocol witness table for Text;
      uint64_t v36 = sub_17E44();
      uint64_t v113 = 0;
      uint64_t v114 = v36;
      *(void *)(v36 + 16) = v29;
      *(void *)(v36 + 24) = v31;
      *(unsigned char *)(v36 + 32) = v33 & 1;
      *(void *)(v36 + 40) = v35;
      long long v111 = 0u;
      long long v112 = 0u;
      uint64_t v107 = sub_18240();
      uint64_t v108 = v37;
      sub_186F0();
      sub_17E30();
      uint64_t v109 = &type metadata for Text;
      uint64_t v110 = &protocol witness table for Text;
      uint64_t v38 = sub_17E44();
      sub_17E0C(v38);
      uint64_t v39 = v2;
      sub_15CEC((uint64_t)v105);
    }
    else
    {
      uint64_t v114 = sub_18250();
      uint64_t v115 = v51;
      sub_DDB8();
      uint64_t v52 = sub_186F0();
      uint64_t v54 = v53;
      char v56 = v55;
      uint64_t v58 = v57;
      uint64_t v116 = &type metadata for Text;
      uint64_t v117 = &protocol witness table for Text;
      uint64_t v59 = sub_17E44();
      uint64_t v113 = 0;
      uint64_t v114 = v59;
      *(void *)(v59 + 16) = v52;
      *(void *)(v59 + 24) = v54;
      *(unsigned char *)(v59 + 32) = v56 & 1;
      *(void *)(v59 + 40) = v58;
      long long v111 = 0u;
      long long v112 = 0u;
      uint64_t v107 = sub_18240();
      uint64_t v108 = v60;
      sub_186F0();
      sub_17E30();
      uint64_t v109 = &type metadata for Text;
      uint64_t v110 = &protocol witness table for Text;
      uint64_t v61 = sub_17E44();
      sub_17E0C(v61);
      uint64_t v106 = 0;
      memset(v105, 0, sizeof(v105));
      uint64_t v39 = v2;
    }
    sub_152BC(v104);
    uint64_t v103 = 0;
    long long v101 = 0u;
    long long v102 = 0u;
    sub_4338(&qword_20950);
    v89[3] = v89;
    sub_F200();
    v89[1] = v62;
    v89[2] = v63;
    __chkstk_darwin(v62);
    sub_4B80();
    uint64_t v64 = sub_188E0();
    v89[0] = v89;
    sub_F200();
    uint64_t v66 = v65;
    __chkstk_darwin(v67);
    sub_17DF4();
    *uint64_t v11 = sub_180E0();
    v11[1] = v68;
    uint64_t v70 = v92;
    uint64_t v69 = v93;
    (*(void (**)(uint64_t *, void, uint64_t))(v92 + 104))(v11, enum case for RFImage.Bundle.Location.path(_:), v93);
    sub_18020();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *, uint64_t))(v70 + 8))(v11, v69);
    sub_188F0();
    uint64_t v71 = v94;
    uint64_t v72 = v95;
    uint64_t v73 = v96;
    (*(void (**)(uint64_t, void, uint64_t))(v95 + 104))(v94, enum case for ImageElement.ImageStyle.image5(_:), v96);
    uint64_t v74 = sub_17C4C(&qword_205D8, (void (*)(uint64_t))&type metadata accessor for RFImageView);
    sub_18710();
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v39, v64);
    uint64_t v97 = v64;
    uint64_t v98 = v74;
    swift_getOpaqueTypeConformance2();
    uint64_t v75 = sub_18700();
    sub_F244();
    v76();
    uint64_t v99 = &type metadata for AnyView;
    unint64_t v100 = &protocol witness table for AnyView;
    uint64_t v97 = v75;
    uint64_t v77 = v90;
    sub_18AF0();
    uint64_t v78 = sub_18B00();
    uint64_t v79 = v77;
    uint64_t v80 = 0;
LABEL_14:
    sub_5334(v79, v80, 1, v78);
    sub_17DC0();
    return;
  }
  if (qword_20160 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_18430();
  sub_38BC(v40, (uint64_t)static Logger.uiCategory);
  uint64_t v41 = (void *)sub_18410();
  os_log_type_t v42 = sub_18C30();
  if (sub_17D88(v42))
  {
    uint64_t v43 = (_WORD *)sub_10C20();
    sub_17E24(v43);
    sub_17D68(&dword_0, v44, v45, "Announcement icon is nil, returning empty announcement view");
    sub_17DD8();
  }

  sub_18B00();
  sub_17DC0();
  sub_5334(v46, v47, v48, v49);
}

uint64_t sub_16EDC()
{
  uint64_t v1 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  uint64_t v2 = sub_F1E8(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v2);
  sub_172AC(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_17314((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  sub_4338(&qword_20920);
  sub_173C8();
  return sub_18950();
}

uint64_t sub_16FD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_182F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(void *)(a1 + 8);
  LOBYTE(v26) = *(unsigned char *)a1;
  unint64_t v27 = v8;
  sub_4338(&qword_20518);
  sub_18820();
  int v9 = v28;
  uint64_t v10 = sub_4338(&qword_20948);
  uint64_t v11 = v10;
  if (v9 == 1)
  {
    uint64_t v25 = &v21;
    uint64_t v24 = *(void *)(v10 - 8);
    __chkstk_darwin(v10);
    uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = sub_4338(&qword_20930);
    uint64_t v23 = &v21;
    __chkstk_darwin(v22);
    uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_16728((uint64_t)v15);
    type metadata accessor for SiriFeatureAnnouncementSnippetView();
    sub_18230();
    uint64_t v16 = sub_182E0();
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    unint64_t v26 = 0xD000000000000014;
    unint64_t v27 = 0x800000000001B360;
    v29._countAndFlagsBits = v16;
    v29._object = v18;
    sub_18B80(v29);
    swift_bridgeObjectRelease();
    sub_17458();
    sub_18730();
    swift_bridgeObjectRelease();
    sub_14854((uint64_t)v15, &qword_20930);
    (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(a2, v13, v11);
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  return sub_5334(a2, v19, 1, v11);
}

uint64_t sub_172AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_17314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_17378@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_F194(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_16FD4(v5, a1);
}

unint64_t sub_173C8()
{
  unint64_t result = qword_20928;
  if (!qword_20928)
  {
    sub_44C8(&qword_20920);
    sub_44C8(&qword_20930);
    sub_17458();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20928);
  }
  return result;
}

unint64_t sub_17458()
{
  unint64_t result = qword_20938;
  if (!qword_20938)
  {
    sub_44C8(&qword_20930);
    sub_17C4C(&qword_20940, (void (*)(uint64_t))&type metadata accessor for SummaryItemDetailedTextView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20938);
  }
  return result;
}

uint64_t sub_174D8()
{
  sub_DE48(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0);
}

uint64_t sub_1751C()
{
  return sub_18570();
}

uint64_t sub_17540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_17790(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for OpenURLAction, (uint64_t (*)(char *))&EnvironmentValues.openURL.setter);
}

uint64_t sub_17568()
{
  type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_F1BC();
  swift_release();
  sub_18290();
  sub_F1D8();
  sub_F244();
  v1();
  sub_18920();
  sub_F1D8();
  sub_F244();
  v2();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0);
}

id sub_1767C()
{
  uint64_t v0 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_F1E8(v0);

  return sub_162A4();
}

unint64_t sub_17708()
{
  unint64_t result = qword_20978;
  if (!qword_20978)
  {
    sub_44C8(&qword_20968);
    sub_4B20(&qword_20980, &qword_20970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20978);
  }
  return result;
}

uint64_t sub_17790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  sub_F200();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

id sub_17838(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)sub_18B30();
  swift_bridgeObjectRelease();
  id v6 = [a3 openSensitiveURL:a1 withOptions:v5];

  return v6;
}

uint64_t sub_178C0()
{
  return sub_17BE0(sub_155B0);
}

unint64_t sub_178D8()
{
  unint64_t result = qword_209A0;
  if (!qword_209A0)
  {
    sub_44C8(&qword_20998);
    sub_17960();
    sub_4B20(&qword_209B8, &qword_209C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_209A0);
  }
  return result;
}

unint64_t sub_17960()
{
  unint64_t result = qword_209A8;
  if (!qword_209A8)
  {
    sub_44C8(&qword_209B0);
    sub_4B20(&qword_20220, &qword_20228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_209A8);
  }
  return result;
}

uint64_t sub_179E8()
{
  return sub_18520();
}

uint64_t sub_17A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_17790(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

uint64_t sub_17A34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_4338(a3);
  sub_F1D8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_17A90()
{
  unint64_t result = qword_209E0;
  if (!qword_209E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_209E0);
  }
  return result;
}

uint64_t sub_17AD4()
{
  type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_F1BC();
  swift_release();
  sub_18290();
  sub_F1D8();
  sub_F244();
  v1();
  sub_18920();
  sub_F1D8();
  sub_F244();
  v2();

  return _swift_deallocObject(v0);
}

uint64_t sub_17BC8()
{
  return sub_17BE0((uint64_t (*)(uint64_t))sub_159C0);
}

uint64_t sub_17BE0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SiriFeatureAnnouncementSnippetView();
  sub_F194(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t sub_17C34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_17C44()
{
  return swift_release();
}

uint64_t sub_17C4C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_17C94()
{
  unint64_t result = qword_209F8;
  if (!qword_209F8)
  {
    sub_44C8(&qword_209F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_209F8);
  }
  return result;
}

unint64_t sub_17CE8()
{
  unint64_t result = qword_20A00;
  if (!qword_20A00)
  {
    sub_182F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20A00);
  }
  return result;
}

uint64_t sub_17D38()
{
  return sub_4B20(&qword_20A08, &qword_20A10);
}

void sub_17D68(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL sub_17D88(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_17DD8()
{
  return swift_slowDealloc();
}

uint64_t sub_17E0C(uint64_t result)
{
  *(void *)(v5 - 216) = result;
  *(void *)(result + 16) = v1;
  *(void *)(result + 24) = v2;
  *(unsigned char *)(result + 32) = v3 & 1;
  *(void *)(result + 40) = v4;
  return result;
}

_WORD *sub_17E24(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_17E44()
{
  return swift_allocObject();
}

uint64_t sub_17E5C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_17E90()
{
  return URL._bridgeToObjectiveC()();
}

uint64_t sub_17EA0()
{
  return URL.init(string:)();
}

uint64_t sub_17EB0()
{
  return type metadata accessor for URL();
}

uint64_t sub_17EC0()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_17ED0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_17EE0()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_17EF0()
{
  return UUID.init()();
}

uint64_t sub_17F00()
{
  return type metadata accessor for UUID();
}

uint64_t sub_17F10()
{
  return type metadata accessor for _ProtoIdiom();
}

uint64_t sub_17F20()
{
  return type metadata accessor for ImageElement.ImageStyle();
}

uint64_t sub_17F30()
{
  return static ImageElement.appIcon(_:imageStyle:idioms:)();
}

uint64_t sub_17F40()
{
  return type metadata accessor for ImageElement();
}

uint64_t sub_17F50()
{
  return type metadata accessor for SashStandard.Title();
}

uint64_t sub_17F60()
{
  return SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)();
}

uint64_t sub_17F70()
{
  return type metadata accessor for SashStandard();
}

uint64_t sub_17F80()
{
  return type metadata accessor for ActionProperty();
}

uint64_t sub_17F90()
{
  return ActionProperty.init(_:actionName:)();
}

uint64_t sub_17FA0()
{
  return type metadata accessor for SeparatorStyle();
}

uint64_t sub_17FB0()
{
  return type metadata accessor for VisualProperty();
}

uint64_t sub_17FC0()
{
  return SecondaryHeaderStandard.init(text1:action:)();
}

uint64_t sub_17FD0()
{
  return type metadata accessor for SecondaryHeaderStandard();
}

uint64_t sub_17FE0()
{
  return VisualPropertyConvertible<>.asVisualProperty()();
}

uint64_t sub_17FF0()
{
  return type metadata accessor for Color();
}

uint64_t sub_18000()
{
  return type metadata accessor for Command();
}

uint64_t sub_18010()
{
  return type metadata accessor for RFImage.Bundle.Location();
}

uint64_t sub_18020()
{
  return static RFImage.bundle(_:darkName:location:)();
}

uint64_t sub_18030()
{
  return static RFImage.symbol(_:dark:)();
}

uint64_t sub_18040()
{
  return type metadata accessor for RFImage();
}

uint64_t sub_18050()
{
  return PreGeneratedSiriHint.topHint.getter();
}

uint64_t sub_18060()
{
  return PreGeneratedSiriHint.exposureCallback.getter();
}

uint64_t sub_18070()
{
  return type metadata accessor for PreGeneratedSiriHint();
}

uint64_t sub_18080()
{
  return SiriHelpSuggestion.displayText.getter();
}

uint64_t sub_18090()
{
  return SiriHelpSuggestion.suggestionId.getter();
}

uint64_t sub_180A0()
{
  return SiriHelpSuggestion.suggestionId.setter();
}

uint64_t sub_180B0()
{
  return SiriHelpSuggestion.directInvocation.getter();
}

uint64_t sub_180C0()
{
  return SiriHelpSuggestion.formattedDisplayText.getter();
}

uint64_t sub_180D0()
{
  return type metadata accessor for SiriHelpSuggestion();
}

uint64_t sub_180E0()
{
  return static SuggestionsRFDataModels.bundlePath.getter();
}

uint64_t sub_180F0()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.moreSuggestionsDirectInvocation.getter();
}

uint64_t sub_18100()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpWithAppNameCat.getter();
}

uint64_t sub_18110()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpHeader.getter();
}

uint64_t sub_18120()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.otherSuggestions.getter();
}

uint64_t sub_18130()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.seeOtherSuggestionsButton.getter();
}

uint64_t sub_18140()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.otherIntro.getter();
}

uint64_t sub_18150()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.appBundleId.getter();
}

uint64_t sub_18160()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.suggestions.getter();
}

uint64_t sub_18170()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.isSaeEnabled.getter();
}

uint64_t sub_18180()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.learnMoreCat.getter();
}

uint64_t sub_18190()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.trySayingCat.getter();
}

uint64_t sub_181A0()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.isSmartSnippet.getter();
}

uint64_t sub_181B0()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.learnMorePunchout.getter();
}

uint64_t sub_181C0()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.isUnsupportedSnippet.getter();
}

uint64_t sub_181D0()
{
  return SuggestionsRFDataModels.SuggestionHelpDataModel.moreCat.getter();
}

uint64_t sub_181E0()
{
  return type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel();
}

uint64_t sub_181F0()
{
  return SuggestionsRFDataModels.SuggestionHintsDataModel.crossDomainHint.getter();
}

uint64_t sub_18200()
{
  return SuggestionsRFDataModels.SuggestionHintsDataModel.uiDisplayTimeout.getter();
}

uint64_t sub_18210()
{
  return SuggestionsRFDataModels.SuggestionHintsDataModel.requestId.getter();
}

uint64_t sub_18220()
{
  return type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel();
}

uint64_t sub_18230()
{
  return SuggestionsRFDataModels.FeatureAnnouncementDataModel.featureType.getter();
}

uint64_t sub_18240()
{
  return SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementText.getter();
}

uint64_t sub_18250()
{
  return SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementTitle.getter();
}

uint64_t sub_18260()
{
  return SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementButtonLabel.getter();
}

uint64_t sub_18270()
{
  return SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementPunchOutUri.getter();
}

uint64_t sub_18280()
{
  return SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementThumbnailName.getter();
}

uint64_t sub_18290()
{
  return type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel();
}

uint64_t sub_182A0()
{
  return type metadata accessor for SuggestionsRFDataModels();
}

uint64_t sub_182C0()
{
  return SiriSuggestionsFacade.__allocating_init()();
}

uint64_t sub_182D0()
{
  return type metadata accessor for SiriSuggestionsFacade();
}

uint64_t sub_182E0()
{
  return FeatureType.rawValue.getter();
}

uint64_t sub_182F0()
{
  return type metadata accessor for FeatureType();
}

uint64_t sub_18300()
{
  return CrossDomainHint.hintText.getter();
}

uint64_t sub_18310()
{
  return CrossDomainHint.hintType.getter();
}

uint64_t sub_18320()
{
  return type metadata accessor for CrossDomainHint();
}

uint64_t sub_18330()
{
  return CrossDomainHintType.rawValue.getter();
}

uint64_t sub_18340()
{
  return type metadata accessor for CrossDomainHintType();
}

uint64_t sub_18350()
{
  return type metadata accessor for SiriHintsMode();
}

uint64_t sub_18360()
{
  return SiriSuggestions.Suggestion.presentation.getter();
}

uint64_t sub_18370()
{
  return SiriSuggestions.Suggestion.loggingAction.getter();
}

uint64_t sub_18380()
{
  return type metadata accessor for SiriSuggestions.Suggestion();
}

uint64_t sub_18390()
{
  return SiriSuggestions.SuggestionPresentation.displayText.getter();
}

uint64_t sub_183A0()
{
  return type metadata accessor for SiriSuggestions.SuggestionPresentation();
}

uint64_t sub_183B0(Swift::String suggestionId)
{
  return DeliveryVehicle.getComponentName(suggestionId:)(suggestionId)._countAndFlagsBits;
}

uint64_t sub_183C0()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t sub_183D0()
{
  return Action.loggingId.getter();
}

uint64_t sub_183E0()
{
  return type metadata accessor for Action();
}

uint64_t sub_183F0()
{
  return static Logger.subsystem.getter();
}

uint64_t sub_18400()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_18410()
{
  return Logger.logObject.getter();
}

uint64_t sub_18420()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_18430()
{
  return type metadata accessor for Logger();
}

uint64_t sub_18440()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_18450()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_18460()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_18470()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_18480()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_18490()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_184A0()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_184B0()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_184C0()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t sub_184D0()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_184E0()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_184F0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_18500()
{
  return EnvironmentObject.error()();
}

uint64_t sub_18510()
{
  return EnvironmentObject.init()();
}

uint64_t sub_18520()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_18530()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_18540()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_18550()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_18560()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_18570()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_18580()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_18590()
{
  return LocalizedStringKey.StringInterpolation.appendLiteral(_:)();
}

uint64_t sub_185A0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_185B0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_185C0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_185D0()
{
  return static SymbolRenderingMode.monochrome.getter();
}

uint64_t sub_185E0()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_185F0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_18600()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_18610()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_18620()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_18630()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_18640()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_18650()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_18660()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_18670()
{
  return static Font.subheadline.getter();
}

uint64_t sub_18680()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_18690()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_186A0()
{
  return static Font.caption.getter();
}

uint64_t sub_186B0()
{
  return Font.leading(_:)();
}

uint64_t sub_186C0()
{
  return static Font.footnote.getter();
}

uint64_t sub_186D0()
{
  return static Font.headline.getter();
}

uint64_t sub_186E0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_186F0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_18700()
{
  return View.eraseToAnyView()();
}

uint64_t sub_18710()
{
  return View.imageStyle(_:)();
}

uint64_t sub_18720()
{
  return View.separators(_:isOverride:)();
}

uint64_t sub_18730()
{
  return View.componentName(_:)();
}

uint64_t sub_18740()
{
  return View.componentTapped(isNavigation:perform:)();
}

uint64_t sub_18750()
{
  return View.componentSpacing(top:bottom:)();
}

uint64_t sub_18760()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_18770()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_18780()
{
  return View.fontWeight(_:)();
}

uint64_t sub_18790()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_187A0()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_187B0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_187C0()
{
  return View.privacySensitive(_:)();
}

uint64_t sub_187D0()
{
  return static Color.gray.getter();
}

uint64_t sub_187E0()
{
  return Image.init(systemName:)();
}

uint64_t sub_187F0()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_18800()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_18810()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_18820()
{
  return State.wrappedValue.getter();
}

uint64_t sub_18830()
{
  return State.wrappedValue.setter();
}

uint64_t sub_18840()
{
  return Button.init(action:label:)();
}

uint64_t sub_18850()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_18860()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_18870()
{
  return static Alignment.center.getter();
}

uint64_t sub_18880()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_18890()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_188A0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_188B0()
{
  return static DispatchTime.now()();
}

uint64_t sub_188C0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_188D0()
{
  return + infix(_:_:)();
}

uint64_t sub_188E0()
{
  return type metadata accessor for RFImageView();
}

uint64_t sub_188F0()
{
  return RFImageView.init(_:)();
}

uint64_t sub_18900()
{
  return ActionHandler.wrappedValue.getter();
}

uint64_t sub_18910()
{
  return ActionHandler.init()();
}

uint64_t sub_18920()
{
  return type metadata accessor for ActionHandler();
}

uint64_t sub_18930()
{
  return static ComponentType.customCanvas.getter();
}

uint64_t sub_18940()
{
  return type metadata accessor for ComponentType();
}

uint64_t sub_18950()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_18960()
{
  return type metadata accessor for InteractionType();
}

uint64_t sub_18990()
{
  return SashStandardView.init(model:)();
}

uint64_t sub_189A0()
{
  return type metadata accessor for SashStandardView();
}

uint64_t sub_189B0()
{
  return ReferenceRichView.init(text1:text2:thumbnail:addTint:)();
}

uint64_t sub_189C0()
{
  return type metadata accessor for ReferenceRichView();
}

uint64_t sub_189D0()
{
  return dispatch thunk of AnyViewConvertible.asAnyView()();
}

uint64_t sub_189E0()
{
  return DisambiguationView.init(title:content:)();
}

uint64_t sub_189F0()
{
  return SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
}

uint64_t sub_18A00()
{
  return type metadata accessor for SimpleItemRichView();
}

uint64_t sub_18A10()
{
  return DisambiguationTitle.init(text1:thumbnail:)();
}

uint64_t sub_18A20()
{
  return type metadata accessor for DisambiguationTitle();
}

uint64_t sub_18A30()
{
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
}

uint64_t sub_18A40()
{
  return type metadata accessor for PrimaryHeaderRichView();
}

uint64_t sub_18A50()
{
  return StandardActionHandler.perform(_:interactionType:)();
}

uint64_t sub_18A60()
{
  return type metadata accessor for StandardActionHandler();
}

uint64_t sub_18A70()
{
  return RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)();
}

uint64_t sub_18A80()
{
  return type metadata accessor for RFInteractionPerformed();
}

uint64_t sub_18A90()
{
  return SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)();
}

uint64_t sub_18AA0()
{
  return type metadata accessor for SimpleItemStandardView();
}

uint64_t sub_18AB0()
{
  return SimpleItemReverseRichView.init(text1:text2:text3:text4:thumbnail:)();
}

uint64_t sub_18AC0()
{
  return type metadata accessor for SimpleItemReverseRichView();
}

uint64_t sub_18AD0()
{
  return SecondaryHeaderStandardView.init(model:)();
}

uint64_t sub_18AE0()
{
  return type metadata accessor for SecondaryHeaderStandardView();
}

uint64_t sub_18AF0()
{
  return SummaryItemDetailedTextView.init(text1:text2:text3:text4:text5:text6:thumbnail:)();
}

uint64_t sub_18B00()
{
  return type metadata accessor for SummaryItemDetailedTextView();
}

uint64_t sub_18B10()
{
  return dispatch thunk of Context.emit(_:)();
}

uint64_t sub_18B20()
{
  return type metadata accessor for Context();
}

uint64_t sub_18B30()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_18B40()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_18B50()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_18B60()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_18B70()
{
  return String.init<A>(describing:)();
}

void sub_18B80(Swift::String a1)
{
}

Swift::Int sub_18B90()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_18BA0()
{
  return String.asAnyView()();
}

uint64_t sub_18BB0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_18BC0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_18BD0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_18BE0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_18BF0()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_18C00()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_18C10()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_18C20()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_18C30()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_18C40()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_18C50()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_18C60()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_18C70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_18C80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_18C90()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_18CA0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_18CB0(Swift::Int a1)
{
}

uint64_t sub_18CC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_18CD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_18CE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_18CF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_18D00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}