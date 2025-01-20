__n128 initializeWithTake for RGControlView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_49B8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_49D8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for VRXMode(uint64_t a1)
{
}

uint64_t sub_4A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_4A30()
{
  uint64_t result = sub_1DCD8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_4AD0(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *(void *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = *a2;
      *(void *)a1 = *a2;
      v8 = v7;
    }
    else
    {
      uint64_t v10 = sub_1DCD8();
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_4BF4(void **a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    int v5 = *a1;
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v3 = sub_1DCD8();
    v4 = *(void (**)(void **, uint64_t))(*(void *)(v3 - 8) + 8);
    v4(a1, v3);
  }
}

void **sub_4C9C(void **a1, void **a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    int v5 = *a2;
    *a1 = *a2;
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = sub_1DCD8();
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_4D70(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    (*(void (**)(void **, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      id v6 = *a2;
      *a1 = *a2;
      id v7 = v6;
    }
    else
    {
      uint64_t v8 = sub_1DCD8();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_4E7C(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_1DCD8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_4F30(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
    else
    {
      uint64_t v6 = sub_1DCD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_5038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_5060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_5090()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for ActionableRow.ActionType()
{
  return sub_70C8();
}

uint64_t sub_50B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_50C0()
{
  uint64_t result = sub_1E518();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ActionableRow.ActionType();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_51A0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1E518();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[9];
    uint64_t v9 = a3[10];
    uint64_t v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    uint64_t v12 = *(void *)v11;
    LOBYTE(v11) = v11[8];
    *(void *)uint64_t v10 = v12;
    v10[8] = (char)v11;
    v13 = (void **)((char *)a1 + v9);
    v14 = (void **)((char *)a2 + v9);
    type metadata accessor for ActionableRow.ActionType();
    swift_retain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v16 = *v14;
      *v13 = *v14;
      id v17 = v16;
    }
    else
    {
      uint64_t v19 = sub_1DCD8();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v19 - 8) + 16))(v13, v14, v19);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[11];
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
  }
  swift_retain();
  return a1;
}

uint64_t sub_533C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  int v5 = (id *)(a1 + *(int *)(a2 + 40));
  type metadata accessor for ActionableRow.ActionType();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_1DCD8();
    (*(void (**)(id *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }

  return swift_release();
}

uint64_t sub_5440(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v10;
  LOBYTE(v10) = *((unsigned char *)v10 + 8);
  *(void *)uint64_t v9 = v11;
  *(unsigned char *)(v9 + 8) = (_BYTE)v10;
  uint64_t v12 = (void **)(a1 + v8);
  v13 = (void **)(a2 + v8);
  type metadata accessor for ActionableRow.ActionType();
  swift_retain();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v15 = *v13;
    *uint64_t v12 = *v13;
    id v16 = v15;
  }
  else
  {
    uint64_t v17 = sub_1DCD8();
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v17 - 8) + 16))(v12, v13, v17);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = a3[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_retain();
  return a1;
}

uint64_t sub_5590(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v11 = a3[10];
    uint64_t v12 = (void **)(a1 + v11);
    v13 = (void **)(a2 + v11);
    uint64_t v14 = type metadata accessor for ActionableRow.ActionType();
    (*(void (**)(void **, uint64_t))(*(void *)(v14 - 8) + 8))(v12, v14);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      id v16 = *v13;
      *uint64_t v12 = *v13;
      id v17 = v16;
    }
    else
    {
      uint64_t v18 = sub_1DCD8();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v18 - 8) + 16))(v12, v13, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = a3[11];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_5730(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = (void *)(a1 + v8);
  uint64_t v12 = (const void *)(a2 + v8);
  uint64_t v13 = type metadata accessor for ActionableRow.ActionType();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_1DCD8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_5868(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v11 = a3[10];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    uint64_t v14 = type metadata accessor for ActionableRow.ActionType();
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v12, v13, *(void *)(v15 + 64));
    }
    else
    {
      uint64_t v16 = sub_1DCD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v12, v13, v16);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  swift_release();
  return a1;
}

uint64_t sub_5A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5A14);
}

uint64_t sub_5A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for ActionableRow.ActionType();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 40);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 44));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_5B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5B40);
}

uint64_t sub_5B40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1E518();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = type metadata accessor for ActionableRow.ActionType();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 44)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 40);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for ActionableRow()
{
  return sub_70C8();
}

void type metadata accessor for CHSControlType(uint64_t a1)
{
}

void sub_5C80(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_5CC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5D10(uint64_t a1)
{
  char v2 = *(unsigned char *)(v1 + *(int *)(a1 + 36) + 8);
  uint64_t v3 = swift_retain();
  uint64_t v4 = sub_180F0(v3, v2);
  swift_release();
  return v4;
}

uint64_t sub_5D5C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v58 = a2;
  uint64_t v4 = sub_1DF68();
  uint64_t v42 = v4;
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  v48 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v5);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v44 = *(void *)(a1 + 16);
  uint64_t v10 = sub_1E2C8();
  uint64_t v50 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v43 = (char *)&v40 - v11;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v41 = WitnessTable;
  uint64_t v40 = sub_6FF8(&qword_29510, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v63 = v10;
  uint64_t v64 = v4;
  uint64_t v65 = WitnessTable;
  uint64_t v66 = v40;
  v53 = &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v54 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v14 = (char *)&v40 - v13;
  sub_6D2C(&qword_29518);
  uint64_t v51 = sub_1DF48();
  uint64_t v56 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  v45 = (char *)&v40 - v15;
  uint64_t v46 = sub_1DF48();
  uint64_t v55 = *(void *)(v46 - 8);
  uint64_t v16 = __chkstk_darwin(v46);
  v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v52 = (char *)&v40 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v44;
  *(void *)(v20 + 24) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v20 + v19, (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v21 = v43;
  sub_1E2B8();
  uint64_t v22 = v48;
  sub_1DF58();
  uint64_t v23 = v14;
  uint64_t v24 = v42;
  uint64_t v25 = v41;
  uint64_t v26 = v40;
  sub_1E1E8();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v22, v24);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v21, v10);
  sub_5D10(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v63 = v10;
  uint64_t v64 = v24;
  uint64_t v65 = v25;
  uint64_t v66 = v26;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v28 = v45;
  uint64_t v29 = OpaqueTypeMetadata2;
  sub_1E218();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v23, v29);
  sub_1E148();
  uint64_t v30 = sub_7084(&qword_29520, &qword_29518);
  uint64_t v61 = OpaqueTypeConformance2;
  uint64_t v62 = v30;
  uint64_t v31 = v51;
  uint64_t v32 = swift_getWitnessTable();
  v33 = v47;
  sub_1E208();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v28, v31);
  uint64_t v59 = v32;
  v60 = &protocol witness table for _PaddingLayout;
  uint64_t v34 = v46;
  swift_getWitnessTable();
  uint64_t v35 = v55;
  v36 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  v37 = v52;
  v36(v52, v33, v34);
  v38 = *(void (**)(char *, uint64_t))(v35 + 8);
  v38(v33, v34);
  v36(v58, v37, v34);
  return ((uint64_t (*)(char *, uint64_t))v38)(v37, v34);
}

uint64_t sub_6484(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t))
{
  uint64_t v5 = sub_1E3A8();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v36 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1E3C8();
  uint64_t v35 = *(void *)(v37 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v34 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E3E8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  uint64_t v42 = v9;
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v40 = (char *)&v31 - v13;
  v33 = a3;
  uint64_t v14 = type metadata accessor for ActionableRow();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_5D10(v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v14);
  sub_6F9C(0, &qword_29528);
  uint64_t v20 = self;
  id v21 = [(id)v20 currentThread];
  id v22 = [(id)v20 mainThread];
  LOBYTE(v20) = sub_1E6A8();

  if (v20)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1DEB8();
    swift_release();
    swift_release();
    if ((aBlock[0] & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock[0]) = 1;
      swift_retain();
      sub_1DEC8();
      sub_6A44((uint64_t)v18);
      sub_6F9C(0, &qword_29530);
      uint64_t v32 = sub_1E698();
      sub_1E3D8();
      sub_1E3F8();
      uint64_t v23 = *(void (**)(char *, uint64_t))(v42 + 8);
      v42 += 8;
      v33 = v23;
      v23(v12, v41);
      aBlock[4] = sub_6FD8;
      aBlock[5] = v19;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1366C;
      aBlock[3] = &unk_255A8;
      uint64_t v24 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      uint64_t v25 = v34;
      sub_1E3B8();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_6FF8(&qword_29538, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_7040(&qword_29540);
      sub_7084(&qword_29548, &qword_29540);
      uint64_t v26 = v36;
      uint64_t v27 = v39;
      sub_1E6D8();
      v28 = v40;
      uint64_t v29 = (void *)v32;
      sub_1E688();
      _Block_release(v24);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v27);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v25, v37);
      v33(v28, v41);
    }
  }
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

uint64_t sub_6A44(uint64_t a1)
{
  uint64_t v18 = sub_1E578();
  uint64_t v2 = *(void *)(v18 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DCD8();
  uint64_t v17 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ActionableRow.ActionType();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (void **)((char *)&v17 - v10);
  uint64_t v12 = type metadata accessor for ActionableRow();
  (*(void (**)(void **, uint64_t, uint64_t))(v9 + 16))(v11, a1 + *(int *)(v12 + 40), v8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v14 = *v11;
    if (EnumCaseMultiPayload == 1)
    {
      sub_1E4F8();
      sub_1E558();
    }
    else
    {
      sub_1E4F8();
      sub_1E568();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  }
  else
  {
    uint64_t v15 = v17;
    (*(void (**)(char *, void **, uint64_t))(v17 + 32))(v7, v11, v5);
    sub_1E4F8();
    sub_1E548();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v7, v5);
  }
}

uint64_t sub_6D0C()
{
  return sub_1E1F8();
}

uint64_t sub_6D2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6D74()
{
  uint64_t v1 = type metadata accessor for ActionableRow();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  swift_release();
  uint64_t v6 = (id *)(v0 + v3 + *(int *)(v1 + 40));
  type metadata accessor for ActionableRow.ActionType();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v8 = sub_1DCD8();
    (*(void (**)(id *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_6F10()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void (**)(char *, uint64_t))(v0 + 24);
  uint64_t v3 = *(void *)(type metadata accessor for ActionableRow() - 8);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_6484(v4, v1, v2);
}

uint64_t sub_6F9C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_6FD8()
{
  return sub_1BD3C();
}

uint64_t sub_6FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_6FF0()
{
  return swift_release();
}

uint64_t sub_6FF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_7040(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7084(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6D2C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_70C8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_70F8()
{
  return swift_getWitnessTable();
}

unint64_t sub_729C()
{
  uint64_t v0 = sub_1DE08();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v4 = sub_1DD58();
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  uint64_t v7 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  uint64_t v6 = v1 + 16;
  v17[1] = v4;
  uint64_t v18 = v7;
  unint64_t v8 = v4 + ((*(unsigned __int8 *)(v6 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 64));
  uint64_t v9 = (void (**)(char *, uint64_t))(v6 - 8);
  uint64_t v10 = *(void *)(v6 + 56);
  while (1)
  {
    v18(v3, v8, v0);
    unint64_t result = (unint64_t)sub_7504();
    unint64_t v12 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_1E7A8();
      unint64_t result = swift_bridgeObjectRelease();
      if (!v16)
      {
LABEL_16:
        swift_bridgeObjectRelease();
        (*v9)(v3, v0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    else if (!*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)))
    {
      goto LABEL_16;
    }
    if ((v12 & 0xC000000000000001) != 0)
    {
      id v13 = (id)sub_1E748();
      goto LABEL_8;
    }
    if (!*(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8))) {
      break;
    }
    id v13 = *(id *)(v12 + 32);
LABEL_8:
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    id v15 = v14;
    sub_1E618();
    if (*(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v19 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_1E658();
    sub_1E668();
    sub_1E648();

    (*v9)(v3, v0);
    v8 += v10;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      return v19;
    }
  }
  __break(1u);
  return result;
}

void *sub_7504()
{
  uint64_t v0 = sub_7040(&qword_297F0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1DCC8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (void *)((char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v32 - v8;
  uint64_t v10 = sub_1DDB8();
  if (!v11) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v11;
  if (v10 == sub_1DCB8() && v12 == v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = sub_1E858();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0) {
      return &_swiftEmptyArrayStorage;
    }
  }
  uint64_t v15 = sub_1DDC8();
  if (v16 >> 60 == 15) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v17 = v15;
  unint64_t v18 = v16;
  sub_1DBD8();
  swift_allocObject();
  sub_1DBC8();
  sub_7988();
  sub_1DBB8();
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
  (*(void (**)(uint64_t *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v4 + 88))(v7, v3) != enum case for RGPluginModel.card(_:))
  {
    uint64_t v30 = *(void (**)(uint64_t *, uint64_t))(v4 + 8);
    v30(v7, v3);
    sub_7A40(v17, v18);
    v30((uint64_t *)v9, v3);
    return &_swiftEmptyArrayStorage;
  }
  (*(void (**)(uint64_t *, uint64_t))(v4 + 96))(v7, v3);
  uint64_t v20 = *v7;
  unint64_t v19 = v7[1];
  id v21 = objc_allocWithZone((Class)_SFPBCard);
  sub_7AAC(v20, v19);
  Class isa = sub_1DBF8().super.isa;
  sub_7A54(v20, v19);
  id v23 = [v21 initWithData:isa];

  if (!v23)
  {
    sub_7A40(v17, v18);
LABEL_15:
    sub_7A54(v20, v19);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    return &_swiftEmptyArrayStorage;
  }
  id v24 = [objc_allocWithZone((Class)SFCard) initWithProtobuf:v23];
  if (!v24)
  {
    sub_7A40(v17, v18);

    goto LABEL_15;
  }
  uint64_t v25 = v24;
  id v26 = [v24 cardSections];
  if (v26)
  {
    id v27 = v26;
    sub_7B04();
    uint64_t v28 = sub_1E638();
    v32[0] = v27;
    uint64_t v29 = (void *)v28;

    uint64_t v25 = (void *)v32[0];
  }
  else
  {
    uint64_t v29 = &_swiftEmptyArrayStorage;
  }

  sub_7A40(v17, v18);
  sub_7A54(v20, v19);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v29;
}

unint64_t sub_7988()
{
  unint64_t result = qword_297F8;
  if (!qword_297F8)
  {
    sub_1DCC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_297F8);
  }
  return result;
}

uint64_t sub_79E0(uint64_t a1)
{
  uint64_t v2 = sub_7040(&qword_297F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_7A40(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_7A54(a1, a2);
  }
  return a1;
}

uint64_t sub_7A54(uint64_t a1, unint64_t a2)
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

uint64_t sub_7AAC(uint64_t a1, unint64_t a2)
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

unint64_t sub_7B04()
{
  unint64_t result = qword_29800;
  if (!qword_29800)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_29800);
  }
  return result;
}

unint64_t sub_7B44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_7040(&qword_29A10);
  uint64_t v2 = (void *)sub_1E7E8();
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
    unint64_t result = sub_B03C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

unint64_t sub_7C60(uint64_t a1)
{
  return sub_7C90(a1, (uint64_t (*)(_OWORD *))sub_B0B4);
}

unint64_t sub_7C78(uint64_t a1)
{
  return sub_7C90(a1, (uint64_t (*)(_OWORD *))sub_D9FC);
}

unint64_t sub_7C90(uint64_t a1, uint64_t (*a2)(_OWORD *))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_7040(&qword_29A30);
  uint64_t v4 = sub_1E7E8();
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  uint64_t v7 = v4 + 64;
  uint64_t v8 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_CC9C(v8, (uint64_t)v17, &qword_29A38);
    unint64_t result = a2(v17);
    if (v10) {
      break;
    }
    *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = v5[6] + 40 * result;
    long long v12 = v17[0];
    long long v13 = v17[1];
    *(void *)(v11 + 32) = v18;
    *(_OWORD *)uint64_t v11 = v12;
    *(_OWORD *)(v11 + 16) = v13;
    unint64_t result = (unint64_t)sub_BBE8(&v19, (_OWORD *)(v5[7] + 32 * result));
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5[2] = v16;
    v8 += 72;
    if (!--v6)
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

uint64_t sub_7DDC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v5 = (int *)type metadata accessor for RGSFCardView(0);
  uint64_t v46 = *((void *)v5 - 1);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E508();
  uint64_t v45 = v5[6];
  *(void *)&v7[v45] = 0;
  uint64_t v8 = v5[7];
  unint64_t v9 = sub_7B44((uint64_t)&_swiftEmptyArrayStorage);
  v44[1] = v8;
  *(void *)&v7[v8] = v9;
  *(void *)&v7[v5[8]] = 3;
  char v10 = &v7[v5[9]];
  LOBYTE(v48) = 1;
  sub_1E278();
  uint64_t v11 = v50;
  *char v10 = v49;
  v44[0] = v10;
  *((void *)v10 + 1) = v11;
  long long v12 = &v7[v5[10]];
  *(void *)long long v12 = sub_8C90;
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  long long v13 = &v7[v5[11]];
  uint64_t v14 = self;
  id v15 = [v14 mainScreen];
  [v15 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v51.origin.x = v17;
  v51.origin.y = v19;
  v51.size.width = v21;
  v51.size.height = v23;
  double Width = CGRectGetWidth(v51);
  id v25 = [v14 mainScreen];
  [v25 bounds];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v52.origin.x = v27;
  v52.origin.y = v29;
  v52.size.width = v31;
  v52.size.height = v33;
  double v48 = Width + CGRectGetWidth(v52) * -0.0667;
  sub_1E278();
  uint64_t v34 = v50;
  *(void *)long long v13 = v49;
  *((void *)v13 + 1) = v34;
  id v35 = objc_allocWithZone((Class)_SFPBCard);
  sub_7AAC(a1, a2);
  Class isa = sub_1DBF8().super.isa;
  sub_7A54(a1, a2);
  id v37 = [v35 initWithData:isa];

  if (v37)
  {
    id v38 = [objc_allocWithZone((Class)SFCard) initWithProtobuf:v37];
    if (v38)
    {
      *(void *)&v7[v5[5]] = v38;
      id v39 = v38;
      uint64_t v40 = sub_81EC();
      sub_7A54(a1, a2);

      *(void *)&v7[v45] = v40;
      uint64_t v41 = v47;
      sub_CB6C((uint64_t)v7, v47, type metadata accessor for RGSFCardView);
      (*(void (**)(uint64_t, void, uint64_t, int *))(v46 + 56))(v41, 0, 1, v5);
      return sub_CBD4((uint64_t)v7, type metadata accessor for RGSFCardView);
    }
    sub_7A54(a1, a2);
  }
  else
  {
    sub_7A54(a1, a2);
  }
  uint64_t v43 = sub_1E518();
  (*(void (**)(char *, uint64_t))(*(void *)(v43 - 8) + 8))(v7, v43);

  swift_bridgeObjectRelease();
  swift_release();
  sub_BCB0();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v46 + 56))(v47, 1, 1, v5);
}

void *sub_81EC()
{
  uint64_t v3 = type metadata accessor for RGSFCardView(0);
  [*(id *)(v0 + *(int *)(v3 + 20)) copy];
  sub_1E6C8();
  swift_unknownObjectRelease();
  sub_6F9C(0, &qword_29A40);
  swift_dynamicCast();
  uint64_t v4 = v33;
  id v5 = [v33 cardSections];
  if (!v5) {
    goto LABEL_58;
  }
  uint64_t v6 = v5;
  uint64_t v30 = v3;
  uint64_t v32 = v0;
  uint64_t v29 = sub_6F9C(0, (unint64_t *)&qword_29800);
  uint64_t v7 = sub_1E638();

  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0) {
      uint64_t v0 = v7;
    }
    else {
      uint64_t v0 = v7 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1E7A8();
    if (v8) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_4:
      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v2 = (uint64_t)"Duplicate values for key: '";
        while (1)
        {
          if ((v7 & 0xC000000000000001) != 0) {
            id v11 = (id)sub_1E748();
          }
          else {
            id v11 = *(id *)(v7 + 8 * v9 + 32);
          }
          long long v12 = v11;
          id v13 = objc_msgSend(v11, "commandDetail", v29);
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = sub_1E5C8();
            uint64_t v17 = v16;

            if (v15 == 0xD000000000000010 && v17 == 0x8000000000022BD0)
            {
              swift_bridgeObjectRelease();
LABEL_7:
              id v10 = v12;
              sub_1E618();
              if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
                sub_1E658();
              }
              sub_1E668();
              sub_1E648();
              goto LABEL_10;
            }
            char v18 = sub_1E858();
            swift_bridgeObjectRelease();
            if (v18) {
              goto LABEL_7;
            }
          }
LABEL_10:
          ++v9;

          if (v8 == v9) {
            goto LABEL_24;
          }
        }
      }
      __break(1u);
      goto LABEL_61;
    }
  }
LABEL_24:
  swift_bridgeObjectRelease();
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1E7A8();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_26;
    }
  }
  else if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_26:
    swift_bridgeObjectRelease();
LABEL_58:
    sub_6F9C(0, (unint64_t *)&qword_29800);
    Class isa = sub_1E628().super.isa;
    swift_bridgeObjectRelease();
    [v4 setCardSections:isa];

    return v4;
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)((unint64_t)v7 >> 62);
  unint64_t v31 = (unint64_t)v7 >> 62;
  if ((unint64_t)v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_1E7A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
  }
  unint64_t v1 = *(void *)(v32 + *(int *)(v30 + 32));
  if (v0 >= (uint64_t)v1)
  {
    if ((v1 & 0x8000000000000000) != 0)
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if (v31)
    {
      if (v7 < 0) {
        uint64_t v0 = v7;
      }
      else {
        uint64_t v0 = v7 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_1E7A8();
      swift_bridgeObjectRelease();
      if (v2 < 0) {
        goto LABEL_63;
      }
      swift_bridgeObjectRetain();
      uint64_t v0 = sub_1E7A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v0 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
    }
    if (v0 < (uint64_t)v1)
    {
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if ((v7 & 0xC000000000000001) != 0 && v1)
    {
      Swift::Int v20 = 0;
      do
      {
        Swift::Int v21 = v20 + 1;
        sub_1E738(v20);
        Swift::Int v20 = v21;
      }
      while (v1 != v21);
    }
    if (v31)
    {
      swift_bridgeObjectRetain();
      uint64_t v0 = sub_1E7B8();
      uint64_t v2 = v22;
      uint64_t v6 = v23;
      unint64_t v1 = v24;
      swift_bridgeObjectRelease_n();
      if (v1) {
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v0 = v7 & 0xFFFFFFFFFFFFFF8;
      uint64_t v2 = (v7 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v1 = (2 * v1) | 1;
      if (v1)
      {
LABEL_51:
        sub_1E868();
        swift_unknownObjectRetain_n();
        id v25 = (void *)swift_dynamicCastClass();
        if (!v25)
        {
          swift_unknownObjectRelease();
          id v25 = &_swiftEmptyArrayStorage;
        }
        uint64_t v26 = v25[2];
        swift_release();
        if (!__OFSUB__(v1 >> 1, v6))
        {
          if (v26 == (v1 >> 1) - (void)v6)
          {
            uint64_t v4 = v33;
            if (!swift_dynamicCastClass()) {
              swift_unknownObjectRelease();
            }
            goto LABEL_57;
          }
          goto LABEL_65;
        }
LABEL_64:
        __break(1u);
LABEL_65:
        swift_unknownObjectRelease();
      }
    }
    sub_BAF4(v0, v2, (uint64_t)v6, v1);
    uint64_t v4 = v33;
LABEL_57:
    swift_unknownObjectRelease();
    goto LABEL_58;
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_8748@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_1E508();
  uint64_t v7 = (int *)type metadata accessor for RGSFCardView(0);
  uint64_t v8 = v7[6];
  *(void *)(a5 + v8) = 0;
  uint64_t v9 = v7[7];
  *(void *)(a5 + v9) = sub_7B44((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(a5 + v7[8]) = 3;
  uint64_t v10 = a5 + v7[9];
  sub_1E278();
  uint64_t v11 = v49;
  *(unsigned char *)uint64_t v10 = (_BYTE)v48;
  *(void *)(v10 + 8) = v11;
  uint64_t v12 = a5 + v7[10];
  *(void *)uint64_t v12 = sub_8C90;
  *(void *)(v12 + 8) = 0;
  *(unsigned char *)(v12 + 16) = 0;
  id v13 = (void *)(a5 + v7[11]);
  uint64_t v14 = self;
  id v15 = [v14 mainScreen];
  [v15 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v50.origin.x = v17;
  v50.origin.y = v19;
  v50.size.width = v21;
  v50.size.height = v23;
  CGRectGetWidth(v50);
  id v24 = [v14 mainScreen];
  [v24 bounds];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v51.origin.x = v26;
  v51.origin.y = v28;
  v51.size.width = v30;
  v51.size.height = v32;
  CGRectGetWidth(v51);
  sub_1E278();
  uint64_t v33 = v49;
  *id v13 = v48;
  v13[1] = v33;
  id v34 = [objc_allocWithZone((Class)SFCard) init];
  sub_6F9C(0, (unint64_t *)&qword_29800);
  Class isa = sub_1E628().super.isa;
  [v34 setCardSections:isa];

  *(void *)(a5 + v7[5]) = v34;
  id v36 = v34;
  *(void *)(a5 + v8) = sub_81EC();
  id v37 = sub_8AC8(a1);
  swift_bridgeObjectRelease();
  if (v37[2])
  {
    sub_7040(&qword_29A10);
    id v38 = (void *)sub_1E7E8();
  }
  else
  {
    id v38 = &_swiftEmptyDictionarySingleton;
  }
  double v48 = v38;
  id v39 = (void *)swift_bridgeObjectRetain();
  sub_B2A0(v39, 1, &v48);

  swift_bridgeObjectRelease();
  uint64_t v40 = v48;
  uint64_t v41 = sub_1DCA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8))(a4, v41);
  uint64_t v42 = sub_1DC08();
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(*(void *)(v42 - 8) + 8);
  v43(a3, v42);
  v43(a2, v42);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a5 + v9) = v40;
  return result;
}

void *sub_8AC8(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_1E7A8())
  {
    unint64_t v20 = v1 & 0xC000000000000001;
    uint64_t v3 = &_swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    unint64_t v19 = v1;
    while (1)
    {
      id v5 = v20 ? (id)sub_1E748() : *(id *)(v1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = sub_11C80(v7);
      id v9 = [v6 cardSectionId];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = v2;
        uint64_t v12 = sub_1E5C8();
        uint64_t v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_AF00(0, v3[2] + 1, 1, v3);
        }
        unint64_t v16 = v3[2];
        unint64_t v15 = v3[3];
        if (v16 >= v15 >> 1) {
          uint64_t v3 = sub_AF00((void *)(v15 > 1), v16 + 1, 1, v3);
        }
        v3[2] = v16 + 1;
        CGFloat v17 = &v3[3 * v16];
        v17[4] = v12;
        v17[5] = v14;
        v17[6] = v8;
        uint64_t v2 = v11;
        unint64_t v1 = v19;
      }
      else
      {
      }
      ++v4;
      if (v7 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_8C90()
{
  uint64_t v0 = sub_7040(&qword_29A50);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ObservableSize(0);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC26ResponseGenerationUIPlugin14ObservableSize__size;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  char v10 = 1;
  sub_7040((uint64_t *)&unk_29858);
  sub_1DEA8();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  char v10 = 1;
  swift_retain();
  sub_1DEC8();
  return v4;
}

uint64_t sub_8DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v101 = a2;
  uint64_t v83 = sub_1E498();
  uint64_t v82 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  v81 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_7040(&qword_29B40);
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  v78 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_7040(&qword_29B48);
  uint64_t v97 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  v77 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_7040(&qword_29B50);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v100 = (uint64_t)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v98 = (char *)&v77 - v9;
  char v10 = (int *)type metadata accessor for RGSFCardView(0);
  uint64_t v89 = *((void *)v10 - 1);
  uint64_t v88 = *(void *)(v89 + 64);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v94 = (uint64_t)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v90 = (char *)&v77 - v14;
  __chkstk_darwin(v13);
  uint64_t v102 = (uint64_t)&v77 - v15;
  uint64_t v16 = type metadata accessor for CardVC(0);
  CGFloat v17 = (int *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = (int **)((char *)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v87 = sub_7040(&qword_29B58) - 8;
  __chkstk_darwin(v87);
  uint64_t v103 = (uint64_t)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_7040(&qword_29B60);
  uint64_t v21 = __chkstk_darwin(v93);
  uint64_t v96 = (uint64_t)&v77 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v92 = (uint64_t)&v77 - v24;
  __chkstk_darwin(v23);
  v95 = (char *)&v77 - v25;
  v91 = *(int **)(a1 + v10[5]);
  uint64_t v85 = type metadata accessor for ObservableSize(0);
  uint64_t v86 = sub_CDC0(&qword_29B68, (void (*)(uint64_t))type metadata accessor for ObservableSize);
  v84 = v91;
  uint64_t v26 = sub_1DEE8();
  sub_1E4F8();
  double v27 = *(int **)(a1 + v10[7]);
  uint64_t v28 = a1 + v10[9];
  char v29 = *(unsigned char *)v28;
  uint64_t v30 = *(void *)(v28 + 8);
  LOBYTE(v104) = v29;
  uint64_t v105 = v30;
  swift_bridgeObjectRetain();
  sub_7040(&qword_29B38);
  sub_1E2A8();
  long long v31 = v106;
  char v32 = v107;
  v91 = v10;
  uint64_t v33 = *(int **)(a1 + v10[6]);
  *unint64_t v19 = v84;
  v19[1] = (int *)v26;
  *(int **)((char *)v19 + v17[9]) = v27;
  swift_unknownObjectWeakInit();
  id v34 = (char *)v19 + v17[11];
  *(_OWORD *)id v34 = v31;
  v34[16] = v32;
  *(int **)((char *)v19 + v17[12]) = v33;
  uint64_t v35 = v102;
  sub_CB6C(a1, v102, type metadata accessor for RGSFCardView);
  uint64_t v36 = *(unsigned __int8 *)(v89 + 80);
  uint64_t v37 = (v36 + 16) & ~v36;
  v88 += v37;
  v84 = (int *)(v36 | 7);
  uint64_t v38 = swift_allocObject();
  uint64_t v89 = v37;
  sub_C6EC(v35, v38 + v37);
  id v39 = v33;
  uint64_t v40 = sub_1E318();
  uint64_t v42 = v41;
  uint64_t v43 = v103;
  sub_CB6C((uint64_t)v19, v103, type metadata accessor for CardVC);
  uint64_t v44 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(v43 + *(int *)(v87 + 44));
  *uint64_t v44 = sub_CAEC;
  v44[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v38;
  void v44[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v40;
  v44[3] = v42;
  uint64_t v45 = a1;
  sub_CBD4((uint64_t)v19, type metadata accessor for CardVC);
  sub_1DEE8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  swift_release();
  uint64_t v46 = (uint64_t)v90;
  swift_release();
  LODWORD(v38) = v107;
  sub_CB6C(a1, v46, type metadata accessor for RGSFCardView);
  uint64_t v47 = v91;
  if (v38 == 1)
  {
    double v48 = (uint64_t *)(v46 + v91[11]);
    uint64_t v49 = *v48;
    uint64_t v50 = v48[1];
    *(void *)&long long v106 = v49;
    *((void *)&v106 + 1) = v50;
    sub_7040(&qword_29B70);
    sub_1E288();
  }
  sub_CBD4(v46, type metadata accessor for RGSFCardView);
  sub_1DEE8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  swift_release();
  swift_release();
  int v51 = v107;
  uint64_t v52 = v94;
  sub_CB6C(v45, v94, type metadata accessor for RGSFCardView);
  uint64_t v53 = (uint64_t)v95;
  if (v51 == 1)
  {
    uint64_t v54 = (uint64_t *)(v52 + v47[11]);
    uint64_t v55 = *v54;
    uint64_t v56 = v54[1];
    *(void *)&long long v106 = v55;
    *((void *)&v106 + 1) = v56;
    sub_7040(&qword_29B70);
    sub_1E288();
  }
  uint64_t v57 = (uint64_t)v98;
  sub_CBD4(v52, type metadata accessor for RGSFCardView);
  sub_1E318();
  sub_1DEF8();
  uint64_t v58 = v103;
  uint64_t v59 = v92;
  sub_CC9C(v103, v92, &qword_29B58);
  v60 = (_OWORD *)(v59 + *(int *)(v93 + 36));
  long long v61 = v107;
  _OWORD *v60 = v106;
  v60[1] = v61;
  v60[2] = v108;
  sub_CD00(v58, &qword_29B58);
  sub_CC34(v59, v53);
  if (sub_9BDC())
  {
    uint64_t v62 = v102;
    sub_CB6C(v45, v102, type metadata accessor for RGSFCardView);
    uint64_t v63 = swift_allocObject();
    sub_C6EC(v62, v63 + v89);
    uint64_t v64 = v78;
    sub_1E2B8();
    uint64_t v65 = v81;
    sub_1E098();
    sub_7084(&qword_29B80, &qword_29B40);
    sub_CDC0(&qword_29B88, (void (*)(uint64_t))&type metadata accessor for RFButtonStyle);
    uint64_t v66 = v77;
    uint64_t v67 = v80;
    uint64_t v68 = v83;
    sub_1E1E8();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v65, v68);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v64, v67);
    uint64_t v69 = v97;
    uint64_t v70 = v99;
    (*(void (**)(uint64_t, char *, uint64_t))(v97 + 32))(v57, v66, v99);
    uint64_t v71 = 0;
  }
  else
  {
    uint64_t v71 = 1;
    uint64_t v70 = v99;
    uint64_t v69 = v97;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v57, v71, 1, v70);
  uint64_t v72 = v96;
  sub_CC9C(v53, v96, &qword_29B60);
  uint64_t v73 = v100;
  sub_CC9C(v57, v100, &qword_29B50);
  uint64_t v74 = v101;
  sub_CC9C(v72, v101, &qword_29B60);
  uint64_t v75 = sub_7040(&qword_29B78);
  sub_CC9C(v73, v74 + *(int *)(v75 + 48), &qword_29B50);
  sub_CD00(v57, &qword_29B50);
  sub_CD00(v53, &qword_29B60);
  sub_CD00(v73, &qword_29B50);
  return sub_CD00(v72, &qword_29B60);
}

uint64_t sub_9968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v5 = sub_1DF18();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = type metadata accessor for RGSFCardView(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E238();
  sub_CB6C(a2, (uint64_t)v11, type metadata accessor for RGSFCardView);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v5);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v14 = (v10 + *(unsigned __int8 *)(v6 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = swift_allocObject();
  sub_C6EC((uint64_t)v11, v15 + v13);
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v15 + v14, (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  *a3 = v12;
  a3[1] = (uint64_t)sub_CFC8;
  a3[2] = v15;
  a3[3] = 0;
  a3[4] = 0;
  return result;
}

uint64_t sub_9B64()
{
  return sub_1E298();
}

id sub_9BDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RGSFCardView(0);
  sub_7040(&qword_29B38);
  sub_1E288();
  if (v24 != 1) {
    return 0;
  }
  unint64_t v3 = *(void *)&v0[*(int *)(v2 + 20)];
  uint64_t v4 = (const char *)&off_29000;
  id result = [(id)v3 cardSections];
  if (result)
  {
    uint64_t v6 = result;
    sub_6F9C(0, (unint64_t *)&qword_29800);
    unint64_t v7 = sub_1E638();

    if (v7 >> 62) {
      goto LABEL_29;
    }
    uint64_t v8 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
    while (1)
    {
      swift_bridgeObjectRelease();
      id result = *(id *)&v1[*(int *)(v2 + 24)];
      if (!result) {
        break;
      }
      id result = [result *((SEL *)v4 + 44)];
      if (!result) {
        break;
      }
      uint64_t v9 = result;
      unint64_t v10 = sub_1E638();

      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_1E7A8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
      }
      swift_bridgeObjectRelease();
      if (v11 >= v8) {
        return 0;
      }
      id v12 = [(id)v3 *((SEL *)v4 + 44)];
      if (!v12) {
        return &dword_0 + 1;
      }
      unint64_t v13 = v12;
      unint64_t v3 = sub_1E638();

      if (v3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_1E7A8();
        if (!v14)
        {
LABEL_32:
          swift_bridgeObjectRelease_n();
          return &dword_0 + 1;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (!v14) {
          goto LABEL_32;
        }
      }
      uint64_t v15 = 4;
      uint64_t v4 = "Duplicate values for key: '";
      while (1)
      {
        uint64_t v2 = v15 - 4;
        uint64_t v17 = (v3 & 0xC000000000000001) != 0 ? (char *)sub_1E748() : (char *)*(id *)(v3 + 8 * v15);
        uint64_t v1 = v17;
        uint64_t v18 = v15 - 3;
        if (__OFADD__(v2, 1)) {
          break;
        }
        id v19 = [v17 commandDetail];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = sub_1E5C8();
          uint64_t v23 = v22;

          if (v21 == 0xD000000000000010 && v23 == 0x8000000000022BD0)
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
LABEL_25:

            return 0;
          }
          char v16 = sub_1E858();
          swift_bridgeObjectRelease();
          if (v16)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_25;
          }
        }

        ++v15;
        if (v18 == v14) {
          goto LABEL_32;
        }
      }
      __break(1u);
LABEL_29:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1E7A8();
      swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_9F0C()
{
  return sub_1E298();
}

uint64_t sub_9F74@<X0>(uint64_t a1@<X8>)
{
  sub_1E018();
  uint64_t result = sub_1E168();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_9FEC()
{
  return sub_1E298();
}

uint64_t sub_A058()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_A0D0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v5 = sub_7040(&qword_29B00);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8DF0(v2, (uint64_t)v7);
  sub_CB6C(v2, (uint64_t)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for RGSFCardView);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  sub_C6EC((uint64_t)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  sub_C7C0();
  sub_C858();
  sub_C8AC();
  sub_C900();
  sub_1E1B8();
  swift_release();
  return sub_CD00((uint64_t)v7, &qword_29B00);
}

uint64_t sub_A29C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC26ResponseGenerationUIPlugin14ObservableSize__size;
  uint64_t v2 = sub_7040(&qword_29A50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_A340()
{
  return type metadata accessor for ObservableSize(0);
}

uint64_t type metadata accessor for ObservableSize(uint64_t a1)
{
  return sub_C974(a1, (uint64_t *)&unk_29840);
}

void sub_A368()
{
  sub_A3F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_A3F8()
{
  if (!qword_29850)
  {
    sub_6D2C((uint64_t *)&unk_29858);
    unint64_t v0 = sub_1DED8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_29850);
    }
  }
}

uint64_t sub_A454@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ObservableSize(0);
  uint64_t result = sub_1DE98();
  *a1 = result;
  return result;
}

void *sub_A518(void *result)
{
  if (result)
  {
    uint64_t v2 = v1;
    id v3 = [result cardSectionId];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_1E5C8();
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v7 = 0xE000000000000000;
    }
    uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC26ResponseGenerationUIPlugin11Coordinator_commandMap);
    if (*(void *)(v8 + 16) && (unint64_t v9 = sub_B03C(v5, v7), (v10 & 1) != 0))
    {
      id v11 = *(id *)(*(void *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRelease();
      sub_1E568();

      return 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      return &dword_0 + 1;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_A66C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_A744()
{
  return type metadata accessor for Coordinator(0);
}

uint64_t type metadata accessor for Coordinator(uint64_t a1)
{
  return sub_C974(a1, qword_299F8);
}

uint64_t sub_A76C()
{
  uint64_t result = sub_1E578();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_A824()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t type metadata accessor for RGSFCardView(uint64_t a1)
{
  return sub_C974(a1, qword_29AB0);
}

id sub_A850()
{
  uint64_t v1 = sub_1E578();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + 8);
  uint64_t v6 = type metadata accessor for CardVC(0);
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v7(v4, v0 + *(int *)(v6 + 24), v1);
  uint64_t v8 = *(void *)(v0 + *(int *)(v6 + 28));
  unint64_t v9 = (objc_class *)type metadata accessor for Coordinator(0);
  char v10 = (char *)objc_allocWithZone(v9);
  swift_unknownObjectWeakInit();
  *(void *)&v10[OBJC_IVAR____TtC26ResponseGenerationUIPlugin11Coordinator_observableSize] = v5;
  v7(&v10[OBJC_IVAR____TtC26ResponseGenerationUIPlugin11Coordinator_interactionDelegate], (uint64_t)v4, v1);
  *(void *)&v10[OBJC_IVAR____TtC26ResponseGenerationUIPlugin11Coordinator_commandMap] = v8;
  v13.receiver = v10;
  v13.super_class = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  id v11 = objc_msgSendSuper2(&v13, "init");
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v11;
}

id sub_A9F0()
{
  sub_7040(&qword_29C48);
  sub_1E128();
  uint64_t v1 = v7;
  id v2 = [self cardViewControllerForCard:*v0 feedbackDelegate:v7];
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = v2;
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (!v4)
  {

LABEL_5:
    id v5 = [objc_allocWithZone((Class)UIViewController) init];
    goto LABEL_6;
  }
  id v5 = v4;
  [v4 setThreeDTouchEnabled:0];
  [v5 setDelegate:v7];
  [v5 setScrollEnabled:0];
  sub_1E128();

  uint64_t v1 = v7;
  swift_unknownObjectWeakAssign();
LABEL_6:

  return v5;
}

void sub_AB24(void *a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for CardVC(0);
  sub_7040(&qword_29C40);
  sub_1E2D8();
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (v10) {
      uint64_t v7 = *(void **)((char *)v2 + *(int *)(v4 + 40));
    }
    else {
      uint64_t v7 = *v2;
    }
    id v8 = v7;
    id v9 = a1;
    [v6 setCard:v8];
  }
}

id sub_AC10@<X0>(void *a1@<X8>)
{
  id result = sub_A850();
  *a1 = result;
  return result;
}

uint64_t sub_AC38()
{
  return sub_1E0C8();
}

uint64_t sub_AC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_CDC0((unint64_t *)&unk_29C50, (void (*)(uint64_t))type metadata accessor for CardVC);

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_AD08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_CDC0((unint64_t *)&unk_29C50, (void (*)(uint64_t))type metadata accessor for CardVC);

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_AD9C()
{
}

double sub_ADF4@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_AE7C()
{
  return sub_1DEC8();
}

void *sub_AF00(void *result, int64_t a2, char a3, void *a4)
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
    sub_7040(&qword_29A20);
    char v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    char v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_7040(&qword_29A28);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_B03C(uint64_t a1, uint64_t a2)
{
  sub_1E888();
  sub_1E5E8();
  Swift::Int v4 = sub_1E8A8();

  return sub_B0F4(a1, a2, v4);
}

unint64_t sub_B0B4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1E6E8(*(void *)(v2 + 40));
  return sub_B1D8(a1, v4);
}

unint64_t sub_B0F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E858() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        objc_super v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1E858() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_B1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_BBF8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1E6F8();
      sub_BC54((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_B2A0(void *a1, char a2, void *a3)
{
  if (!a1[2]) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v42 = a1[2];
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  id v10 = v8;
  unint64_t v12 = sub_B03C(v7, v6);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v9[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_B630();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v21 = (uint64_t *)(v20[6] + 16 * v12);
    uint64_t *v21 = v7;
    v21[1] = v6;
    *(void *)(v20[7] + 8 * v12) = v10;
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v42 - 1;
    if (v42 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (i = (void **)(a1 + 9); ; i += 3)
    {
      uint64_t v28 = (uint64_t)*(i - 2);
      uint64_t v27 = (uint64_t)*(i - 1);
      char v29 = *i;
      uint64_t v30 = (void *)*a3;
      swift_bridgeObjectRetain();
      id v10 = v29;
      unint64_t v31 = sub_B03C(v28, v27);
      uint64_t v33 = v30[2];
      BOOL v34 = (v32 & 1) == 0;
      BOOL v23 = __OFADD__(v33, v34);
      uint64_t v35 = v33 + v34;
      if (v23) {
        break;
      }
      char v36 = v32;
      if (v30[3] < v35)
      {
        sub_B7E4(v35, 1);
        unint64_t v31 = sub_B03C(v28, v27);
        if ((v36 & 1) != (v37 & 1)) {
          goto LABEL_25;
        }
      }
      if (v36) {
        goto LABEL_10;
      }
      uint64_t v38 = (void *)*a3;
      *(void *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      id v39 = (uint64_t *)(v38[6] + 16 * v31);
      *id v39 = v28;
      v39[1] = v27;
      *(void *)(v38[7] + 8 * v31) = v10;
      uint64_t v40 = v38[2];
      BOOL v23 = __OFADD__(v40, 1);
      uint64_t v41 = v40 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v38[2] = v41;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_B7E4(v15, a2 & 1);
  unint64_t v17 = sub_B03C(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_7040(&qword_29A18);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_1E878();
  __break(1u);
LABEL_26:
  sub_1E718(30);
  v43._object = (void *)0x8000000000022BB0;
  v43._countAndFlagsBits = 0xD00000000000001BLL;
  sub_1E5F8(v43);
  sub_1E788();
  v44._countAndFlagsBits = 39;
  v44._object = (void *)0xE100000000000000;
  sub_1E5F8(v44);
  uint64_t result = sub_1E798();
  __break(1u);
  return result;
}

id sub_B630()
{
  uint64_t v1 = v0;
  sub_7040(&qword_29A10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E7C8();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
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

uint64_t sub_B7E4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_7040(&qword_29A10);
  char v38 = a2;
  uint64_t v6 = sub_1E7D8();
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
  uint64_t v35 = v2;
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
    int64_t v22 = (void *)(v5 + 64);
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
          uint64_t v3 = v35;
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1E888();
    sub_1E5E8();
    uint64_t result = sub_1E8A8();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_BAF4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
      if (v4 != a3)
      {
LABEL_7:
        sub_6F9C(0, (unint64_t *)&qword_29800);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      sub_7040(&qword_29A48);
      uint64_t v7 = (void *)swift_allocObject();
      int64_t v8 = j__malloc_size(v7);
      uint64_t v9 = v8 - 32;
      if (v8 < 32) {
        uint64_t v9 = v8 - 25;
      }
      v7[2] = v5;
      v7[3] = (2 * (v9 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

_OWORD *sub_BBE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_BBF8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_BC54(uint64_t a1)
{
  return a1;
}

uint64_t sub_BCB0()
{
  return swift_release();
}

void sub_BCB8(void *a1)
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (a1)
  {
    if (Strong)
    {
      uint64_t v3 = Strong;

      if (v3 == a1) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (!Strong)
    {
LABEL_9:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_1DEC8();
      return;
    }
  }
}

void *sub_BDA4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    a1 = (void *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1E518();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unint64_t v10 = *(void **)((char *)a2 + v8);
    *(void *)((char *)a1 + v8) = v10;
    uint64_t v11 = *(void **)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v11;
    uint64_t v12 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
    uint64_t v13 = a3[9];
    uint64_t v14 = a3[10];
    unint64_t v15 = (char *)a1 + v13;
    unint64_t v16 = (char *)a2 + v13;
    char *v15 = *v16;
    *((void *)v15 + 1) = *((void *)v16 + 1);
    unint64_t v17 = (char *)a1 + v14;
    uint64_t v18 = *(void *)((char *)a2 + v14);
    uint64_t v19 = *(void *)((char *)a2 + v14 + 8);
    char v20 = *((unsigned char *)a2 + v14 + 16);
    id v21 = v10;
    id v22 = v11;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_BF14();
    *(void *)unint64_t v17 = v18;
    *((void *)v17 + 1) = v19;
    v17[16] = v20;
    uint64_t v23 = a3[11];
    int64_t v24 = (void *)((char *)a1 + v23);
    char v25 = (void *)((char *)a2 + v23);
    uint64_t v26 = v25[1];
    *int64_t v24 = *v25;
    v24[1] = v26;
  }
  swift_retain();
  return a1;
}

uint64_t sub_BF14()
{
  return swift_retain();
}

uint64_t sub_BF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();
  swift_release();
  sub_BCB0();

  return swift_release();
}

uint64_t sub_BFDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  unint64_t v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  uint64_t v16 = a1 + v13;
  uint64_t v17 = *(void *)(a2 + v13);
  uint64_t v18 = *(void *)(a2 + v13 + 8);
  char v19 = *(unsigned char *)(a2 + v13 + 16);
  id v20 = v9;
  id v21 = v10;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_BF14();
  *(void *)uint64_t v16 = v17;
  *(void *)(v16 + 8) = v18;
  *(unsigned char *)(v16 + 16) = v19;
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)(a1 + v22);
  int64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  swift_retain();
  return a1;
}

uint64_t sub_C100(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)(a1 + v11);
  uint64_t v13 = *(void **)(a2 + v11);
  *(void *)(a1 + v11) = v13;
  id v14 = v13;

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(unsigned char *)uint64_t v16 = *(unsigned char *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  swift_retain();
  swift_release();
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v18;
  id v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  uint64_t v22 = v20[1];
  char v23 = *((unsigned char *)v20 + 16);
  sub_BF14();
  *(void *)uint64_t v19 = v21;
  *(void *)(v19 + 8) = v22;
  *(unsigned char *)(v19 + 16) = v23;
  sub_BCB0();
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_C268(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *(unsigned char *)(v10 + 16) = *(unsigned char *)(v11 + 16);
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_C330(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = *(void **)(a1 + v9);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release();
  uint64_t v14 = a3[10];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  char v17 = *(unsigned char *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(unsigned char *)(v15 + 16) = v17;
  sub_BCB0();
  uint64_t v18 = a3[11];
  uint64_t v19 = (void *)(a1 + v18);
  id v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_release();
  return a1;
}

uint64_t sub_C454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C468);
}

uint64_t sub_C468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
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
    return (v10 + 1);
  }
}

uint64_t sub_C528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C53C);
}

uint64_t sub_C53C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1E518();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_C5F8()
{
  uint64_t result = sub_1E518();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_C6CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C6EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGSFCardView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C750()
{
  type metadata accessor for RGSFCardView(0);

  return sub_9FEC();
}

unint64_t sub_C7C0()
{
  unint64_t result = qword_29B08;
  if (!qword_29B08)
  {
    sub_6D2C(&qword_29B00);
    sub_7084(&qword_29B10, &qword_29B18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29B08);
  }
  return result;
}

unint64_t sub_C858()
{
  unint64_t result = qword_29B20;
  if (!qword_29B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29B20);
  }
  return result;
}

unint64_t sub_C8AC()
{
  unint64_t result = qword_29B28;
  if (!qword_29B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29B28);
  }
  return result;
}

unint64_t sub_C900()
{
  unint64_t result = qword_29B30;
  if (!qword_29B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29B30);
  }
  return result;
}

uint64_t type metadata accessor for CardVC(uint64_t a1)
{
  return sub_C974(a1, qword_29BE8);
}

uint64_t sub_C974(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_C9B0()
{
  unint64_t v1 = (int *)(type metadata accessor for RGSFCardView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  swift_bridgeObjectRelease();
  swift_release();
  sub_BCB0();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_CAEC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for RGSFCardView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_9968(a1, v6, a2);
}

uint64_t sub_CB6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_CBD4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_CC34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040(&qword_29B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_CC9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_7040(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_CD00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_7040(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_CD60()
{
  type metadata accessor for RGSFCardView(0);

  return sub_9F0C();
}

uint64_t sub_CDC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_CE08()
{
  unint64_t v1 = (int *)(type metadata accessor for RGSFCardView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_1DF18();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  uint64_t v11 = v0 + v3;
  uint64_t v12 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  swift_bridgeObjectRelease();
  swift_release();
  sub_BCB0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_CFC8()
{
  type metadata accessor for RGSFCardView(0);
  sub_1DF18();

  return sub_9B64();
}

char *sub_D094(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
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
    uint64_t v8 = a3[6];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_1E578();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    swift_retain();
    v12(v9, v10, v11);
    *(void *)&v7[a3[7]] = *(char **)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_unknownObjectWeakCopyInit();
    uint64_t v14 = a3[9];
    uint64_t v15 = a3[10];
    uint64_t v16 = &v7[v14];
    uint64_t v17 = (uint64_t)a2 + v14;
    uint64_t v18 = *(void *)(v17 + 8);
    *(void *)uint64_t v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    v16[16] = *(unsigned char *)(v17 + 16);
    uint64_t v19 = *(char **)((char *)a2 + v15);
    *(void *)&v7[v15] = v19;
    swift_retain();
    swift_retain();
    id v20 = v19;
  }
  return v7;
}

void sub_D1EC(id *a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1E578();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  uint64_t v6 = *(id *)((char *)a1 + *(int *)(a2 + 40));
}

void *sub_D2B0(void *a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1E578();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v7;
  swift_retain();
  v12(v9, v10, v11);
  *(void *)((char *)a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakCopyInit();
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (char *)a1 + v14;
  uint64_t v17 = a2 + v14;
  uint64_t v18 = *(void *)(v17 + 8);
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = v18;
  v16[16] = *(unsigned char *)(v17 + 16);
  uint64_t v19 = *(void **)(a2 + v15);
  *(void *)((char *)a1 + v15) = v19;
  swift_retain();
  swift_retain();
  id v20 = v19;
  return a1;
}

uint64_t sub_D3B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_1E578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakCopyAssign();
  uint64_t v13 = a3[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_retain();
  swift_release();
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  uint64_t v16 = a3[10];
  uint64_t v17 = *(void **)(a1 + v16);
  uint64_t v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  id v19 = v18;

  return a1;
}

_OWORD *sub_D4EC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E578();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_unknownObjectWeakTakeInit();
  uint64_t v10 = a3[9];
  uint64_t v11 = a3[10];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  v12[16] = v13[16];
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

uint64_t sub_D5B4(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E578();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakTakeAssign();
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)(a1 + v11) = *(void *)((char *)a2 + v11);
  swift_release();
  *(void *)(v12 + 8) = *((void *)v13 + 1);
  swift_release();
  *(unsigned char *)(v12 + 16) = v13[16];
  uint64_t v14 = a3[10];
  uint64_t v15 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = *(void *)((char *)a2 + v14);

  return a1;
}

uint64_t sub_D6C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D6D8);
}

uint64_t sub_D6D8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1E578();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_D788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D79C);
}

void *sub_D79C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1E578();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_D844()
{
  uint64_t result = sub_1E578();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_D918()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_D9A4()
{
  return &protocol witness table for Never;
}

uint64_t sub_D9B0()
{
  return sub_CDC0(&qword_29C38, (void (*)(uint64_t))type metadata accessor for CardVC);
}

uint64_t sub_DA00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_7040(&qword_29CC0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_7040(&qword_29CC8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E078();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1DD18();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v22[0] = a2;
  v16(a2, a1, v14);
  sub_1DD08();
  sub_1E058();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v14);
    sub_CD00((uint64_t)v9, &qword_29CC8);
    uint64_t v17 = v22[0] + *(int *)(type metadata accessor for RGArchivedView() + 20);
    uint64_t v18 = sub_1DF28();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_1E068();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v14);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v20 = sub_1DF28();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 0, 1, v20);
    uint64_t v21 = type metadata accessor for RGArchivedView();
    return sub_DE38((uint64_t)v6, v22[0] + *(int *)(v21 + 20));
  }
}

uint64_t type metadata accessor for RGArchivedView()
{
  uint64_t result = qword_29D28;
  if (!qword_29D28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_DE38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040(&qword_29CC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_DEA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1DD18();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1DF28();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_7040(&qword_29CC0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_E040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DD18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1DF28();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t sub_E140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1DF28();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_7040(&qword_29CC0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_E290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1DF28();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_7040(&qword_29CC0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_E444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1DF28();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_7040(&qword_29CC0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_E594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1DF28();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_7040(&qword_29CC0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_E748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_E75C);
}

uint64_t sub_E75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD18();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_7040(&qword_29CC0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_E858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_E86C);
}

uint64_t sub_E86C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1DD18();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_7040(&qword_29CC0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_E974()
{
  sub_1DD18();
  if (v0 <= 0x3F)
  {
    sub_EA3C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_EA3C()
{
  if (!qword_29D38)
  {
    sub_1DF28();
    unint64_t v0 = sub_1E6B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_29D38);
    }
  }
}

uint64_t sub_EA94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_EAB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_7040(&qword_29CC0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_EC60(v2 + *(int *)(a1 + 20), (uint64_t)v7);
  uint64_t v8 = sub_1DF28();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_CD00((uint64_t)v7, &qword_29CC0);
    uint64_t v10 = sub_7040(&qword_29D68);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a2, 1, 1, v10);
  }
  else
  {
    sub_ECC8();
    sub_1E1A8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v12 = sub_7040(&qword_29D68);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 0, 1, v12);
  }
}

uint64_t sub_EC60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040(&qword_29CC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_ECC8()
{
  unint64_t result = qword_29D70;
  if (!qword_29D70)
  {
    sub_1DF28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29D70);
  }
  return result;
}

unint64_t sub_ED24()
{
  unint64_t result = qword_29D78;
  if (!qword_29D78)
  {
    sub_6D2C(&qword_29D80);
    sub_1DF28();
    sub_ECC8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29D78);
  }
  return result;
}

uint64_t destroy for RGBinaryButtonView(id *a1)
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for RGBinaryButtonView(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = v5;
  id v6 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RGBinaryButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RGBinaryButtonView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for RGBinaryButtonView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RGBinaryButtonView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RGBinaryButtonView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RGBinaryButtonView()
{
  return &type metadata for RGBinaryButtonView;
}

uint64_t sub_F0A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_F0C4@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v30 = sub_1E408();
  uint64_t v3 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_7040(&qword_29B40);
  uint64_t v31 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_7040(&qword_29D88);
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (_OWORD *)swift_allocObject();
  long long v11 = v2[3];
  v10[3] = v2[2];
  v10[4] = v11;
  v10[5] = v2[4];
  long long v13 = *v2;
  long long v12 = v2[1];
  v10[1] = *v2;
  v10[2] = v12;
  *(_OWORD *)uint64_t v46 = v13;
  uint64_t v35 = *((void *)v2 + 3);
  uint64_t v14 = *((void *)v2 + 4);
  uint64_t v15 = *((void *)v2 + 5);
  uint64_t v29 = *((void *)v2 + 8);
  uint64_t v16 = *((void *)v2 + 9);
  uint64_t v39 = v14;
  uint64_t v40 = v15;
  uint64_t v34 = v15;
  sub_FB30(v46);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v17 = v16;
  swift_retain();
  sub_1E2B8();
  uint64_t v18 = v30;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ButtonItemButtonStyle.Role.preferred(_:), v30);
  uint64_t v19 = sub_FBFC(&qword_29B80);
  uint64_t v20 = v28;
  sub_1E198();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v20);
  uint64_t v42 = v20;
  uint64_t v43 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v32;
  uint64_t v22 = sub_1E188();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v21);
  Swift::String v44 = &type metadata for AnyView;
  uint64_t v45 = &protocol witness table for AnyView;
  uint64_t v42 = v22;
  char v23 = (_OWORD *)swift_allocObject();
  long long v24 = v2[3];
  v23[3] = v2[2];
  v23[4] = v24;
  v23[5] = v2[4];
  long long v25 = v2[1];
  v23[1] = *v2;
  v23[2] = v25;
  uint64_t v37 = v29;
  uint64_t v38 = v17;
  v41[3] = v20;
  v41[4] = sub_FBFC(&qword_29D90);
  sub_FC44(v41);
  sub_FB30(v46);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1E2B8();
  return sub_1E4C8();
}

uint64_t sub_F58C(uint64_t a1)
{
  uint64_t v2 = sub_7040(&qword_29D98);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E4B8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1DC48();
  __chkstk_darwin(v9 - 8);
  if (*(void *)a1)
  {
    uint64_t v10 = *(uint64_t (**)(void))(a1 + 16);
    id v11 = *(id *)a1;
    sub_7C78((uint64_t)&_swiftEmptyArrayStorage);
    sub_1DC38();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for InteractionType.buttonTapped(_:), v5);
    sub_1E478();
    uint64_t v12 = sub_1E488();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 0, 1, v12);
    id v13 = objc_allocWithZone((Class)sub_1E538());
    uint64_t v14 = (void *)sub_1E528();
    sub_1E588();

    return v10();
  }
  else
  {
    sub_1E598();
    sub_FEF8(&qword_29DA0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_1DF78();
    __break(1u);
  }
  return result;
}

uint64_t sub_F854(uint64_t a1)
{
  uint64_t v2 = sub_7040(&qword_29D98);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E4B8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1DC48();
  __chkstk_darwin(v9 - 8);
  if (*(void *)a1)
  {
    uint64_t v10 = *(uint64_t (**)(void))(a1 + 48);
    id v11 = *(id *)a1;
    sub_7C78((uint64_t)&_swiftEmptyArrayStorage);
    sub_1DC38();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for InteractionType.buttonTapped(_:), v5);
    sub_1E478();
    uint64_t v12 = sub_1E488();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 0, 1, v12);
    id v13 = objc_allocWithZone((Class)sub_1E538());
    uint64_t v14 = (void *)sub_1E528();
    sub_1E588();

    return v10();
  }
  else
  {
    sub_1E598();
    sub_FEF8(&qword_29DA0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_1DF78();
    __break(1u);
  }
  return result;
}

uint64_t sub_FB24()
{
  return sub_F58C(v0 + 16);
}

id *sub_FB30(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_FB60()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_FBB8()
{
  return sub_F854(v0 + 16);
}

uint64_t sub_FBC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_FBFC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6D2C(&qword_29B40);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_FC44(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t initializeBufferWithCopyOfBuffer for RGBinaryButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RGBinaryButton()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for RGBinaryButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for RGBinaryButton(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RGBinaryButton(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for RGBinaryButton(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RGBinaryButton(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RGBinaryButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RGBinaryButton()
{
  return &type metadata for RGBinaryButton;
}

uint64_t sub_FEB0()
{
  return sub_FEF8(&qword_29DA8, (void (*)(uint64_t))&type metadata accessor for BinaryButtonView);
}

uint64_t sub_FEF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_FF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_FFB0(uint64_t a1)
{
  uint64_t v2 = sub_1DE68();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10078(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_101A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_101B8);
}

uint64_t sub_101B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10238);
}

uint64_t sub_10238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DE68();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for RGToolDisambiguationView()
{
  uint64_t result = qword_29E08;
  if (!qword_29E08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_102F4()
{
  uint64_t result = sub_1DE68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10380()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1039C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v37 = a2;
  uint64_t v2 = type metadata accessor for RGToolDisambiguationView();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v34 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_7040(&qword_29E48);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v36 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = sub_1E2F8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_7040(&qword_29E50);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v32 - v19;
  sub_1E2E8();
  sub_1E318();
  sub_1DEF8();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v18, v13, v10);
  uint64_t v21 = &v18[*(int *)(v15 + 44)];
  long long v22 = v39;
  *(_OWORD *)uint64_t v21 = v38;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v40;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_11BE0((uint64_t)v18, (uint64_t)v20, &qword_29E50);
  uint64_t v23 = v33;
  sub_11568(v35, v33);
  unint64_t v24 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v25 = swift_allocObject();
  sub_115D0(v23, v25 + v24);
  sub_7040(&qword_29E58);
  sub_116A4();
  sub_1E4A8();
  sub_1173C((uint64_t)v20, (uint64_t)v18);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v27 = v36;
  v26(v36, v9, v4);
  uint64_t v28 = v37;
  sub_1173C((uint64_t)v18, v37);
  uint64_t v29 = sub_7040(&qword_29E78);
  v26((char *)(v28 + *(int *)(v29 + 48)), v27, v4);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v5 + 8);
  v30(v9, v4);
  sub_CD00((uint64_t)v20, &qword_29E50);
  v30(v27, v4);
  return sub_CD00((uint64_t)v18, &qword_29E50);
}

uint64_t sub_107A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RGToolDisambiguationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_1DE58();
  size_t v6 = sub_1890C(v5);
  swift_bridgeObjectRelease();
  v11[1] = v6;
  swift_getKeyPath();
  sub_11568(a1, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_115D0((uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_11880;
  *(void *)(v9 + 24) = v8;
  sub_7040(&qword_29E80);
  sub_7040(&qword_29E70);
  sub_7084(&qword_29E88, &qword_29E80);
  sub_7084(&qword_29E68, &qword_29E70);
  return sub_1E308();
}

uint64_t sub_109A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v55 = a1;
  uint64_t v66 = a4;
  uint64_t v65 = sub_7040(&qword_29E70) - 8;
  __chkstk_darwin(v65);
  uint64_t v64 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RGToolDisambiguationView();
  uint64_t v62 = *(void *)(v6 - 8);
  uint64_t v61 = *(void *)(v62 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v60 = (uint64_t)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DE08();
  uint64_t v57 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  uint64_t v59 = *(void *)(v57 + 64);
  __chkstk_darwin(v8);
  uint64_t v56 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1DCD8();
  uint64_t v53 = *(void *)(v10 - 8);
  uint64_t v54 = v10;
  __chkstk_darwin(v10);
  uint64_t v67 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_7040(&qword_29E98);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1DCA8();
  __chkstk_darwin(v15 - 8);
  uint64_t v52 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1DD78();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char **)((char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_1DC08();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v23 = sub_7040(&qword_29EA0);
  __chkstk_darwin(v23 - 8);
  uint64_t v25 = (char *)&v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1DDA8();
  uint64_t v51 = *(void *)(v68 - 8);
  uint64_t v26 = v51;
  __chkstk_darwin(v68);
  uint64_t v50 = (char *)&v50 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DE38();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v25, 0, 1, v21);
  sub_1DE48();
  *uint64_t v20 = v55;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v20, enum case for SystemPromptResolution.UserAction.disambiguationIndexSelected(_:), v17);
  sub_1DE28();
  uint64_t v28 = enum case for SystemPromptResolution.InputModality.touch(_:);
  uint64_t v29 = sub_1DD88();
  uint64_t v30 = *(void *)(v29 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 104))(v14, v28, v29);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v14, 0, 1, v29);
  uint64_t v31 = v50;
  sub_1DD98();
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  uint64_t v33 = v67;
  uint64_t v34 = v31;
  v32(v67, v31, v68);
  uint64_t v36 = v53;
  uint64_t v35 = v54;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v33, enum case for MessagePayload.systemPromptResolved(_:), v54);
  long long v38 = v56;
  uint64_t v37 = v57;
  uint64_t v39 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v56, v63, v58);
  uint64_t v40 = v60;
  sub_11568(a3, v60);
  uint64_t v41 = v37;
  unint64_t v42 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  unint64_t v43 = (v59 + *(unsigned __int8 *)(v62 + 80) + v42) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v44 + v42, v38, v39);
  sub_115D0(v40, v44 + v43);
  uint64_t v45 = (uint64_t)v64;
  sub_1E508();
  uint64_t v46 = v65;
  uint64_t v47 = v45 + *(int *)(v65 + 44);
  *(void *)uint64_t v47 = swift_getKeyPath();
  *(unsigned char *)(v47 + 8) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v45 + *(int *)(v46 + 48), v67, v35);
  sub_7040(&qword_29EA8);
  swift_storeEnumTagMultiPayload();
  double v48 = (uint64_t (**)@<X0>(uint64_t@<X8>))(v45 + *(int *)(v46 + 52));
  uint64_t *v48 = sub_11B04;
  v48[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v44;
  sub_11BE0(v45, v66, &qword_29E70);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v34, v68);
}

uint64_t sub_110BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_1DC78();
  __chkstk_darwin(v1 - 8);
  uint64_t v33 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1E458();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_7040(&qword_29EB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DBE8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - v13;
  uint64_t v15 = sub_1E4E8();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DDE8();
  uint64_t v19 = sub_1E5D8();
  uint64_t v63 = &type metadata for String;
  uint64_t v64 = &protocol witness table for String;
  uint64_t v61 = v19;
  uint64_t v62 = v20;
  sub_1DDF8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_CD00((uint64_t)v7, &qword_29EB0);
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v60 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v14, v12, v8);
    uint64_t v21 = sub_1E5D8();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    *((void *)&v59 + 1) = &type metadata for String;
    uint64_t v60 = &protocol witness table for String;
    *(void *)&long long v58 = v21;
    *((void *)&v58 + 1) = v23;
  }
  uint64_t v24 = v36;
  uint64_t v25 = v15;
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v42 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  sub_1DDB8();
  if (v26)
  {
    sub_1DC58();
    swift_bridgeObjectRelease();
    uint64_t v27 = v32;
    sub_1E468();
    uint64_t v28 = v35;
    *((void *)&v38 + 1) = v35;
    uint64_t v39 = &protocol witness table for RFImageView;
    uint64_t v29 = sub_FC44((uint64_t *)&v37);
    (*(void (**)(uint64_t *, char *, uint64_t))(v34 + 32))(v29, v27, v28);
  }
  else
  {
    uint64_t v39 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
  }
  sub_1E4D8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v24, v18, v25);
}

uint64_t sub_11520@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1E028();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_7040(&qword_29E40);
  return sub_1039C(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_11568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGToolDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_115D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGToolDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_11634()
{
  uint64_t v1 = *(void *)(type metadata accessor for RGToolDisambiguationView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_107A0(v2);
}

unint64_t sub_116A4()
{
  unint64_t result = qword_29E60;
  if (!qword_29E60)
  {
    sub_6D2C(&qword_29E58);
    sub_7084(&qword_29E68, &qword_29E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29E60);
  }
  return result;
}

uint64_t sub_1173C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040(&qword_29E50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_117A8()
{
  uint64_t v1 = *(void *)(type metadata accessor for RGToolDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1DE68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_11880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for RGToolDisambiguationView() - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_109A4(a1, a2, v8, a3);
}

uint64_t sub_11908()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_11940(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_7040(&qword_29E90);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_119A0()
{
  uint64_t v1 = sub_1DE08();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for RGToolDisambiguationView() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v11 = sub_1DE68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v0 + v8, v11);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_11B04@<X0>(uint64_t a1@<X8>)
{
  sub_1DE08();
  type metadata accessor for RGToolDisambiguationView();

  return sub_110BC(a1);
}

uint64_t sub_11BE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_7040(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_11C44()
{
  return sub_7084(&qword_29EB8, &qword_29EC0);
}

id sub_11C80(uint64_t a1)
{
  sub_1DC98();
  id v2 = objc_allocWithZone((Class)SKIDirectInvocationPayload);
  NSString v3 = sub_1E5B8();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithIdentifier:v3];

  sub_7040(&qword_29EC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1F570;
  sub_1DC88();
  sub_1E708();
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = a1;
  sub_7C60(inited);
  Class isa = sub_1E5A8().super.isa;
  swift_bridgeObjectRelease();
  [v4 setUserData:isa];

  uint64_t v7 = self;
  id v8 = [objc_allocWithZone((Class)SKIDirectInvocationContext) init];
  [v8 setInputOrigin:SAInputOriginDialogButtonTapValue];
  [v8 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
  [v8 setEyesFree:0];
  id v9 = [v7 runSiriKitExecutorCommandWithContext:v8 payload:v4];

  return v9;
}

uint64_t *sub_11E58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1E518();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v12 = *(void *)v11;
    LOBYTE(v11) = v11[8];
    *(void *)uint64_t v10 = v12;
    v10[8] = (char)v11;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = sub_1DE18();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_retain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_11F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_1DE18();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_12048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v10;
  LOBYTE(v10) = *((unsigned char *)v10 + 8);
  *(void *)uint64_t v9 = v11;
  *(unsigned char *)(v9 + 8) = (_BYTE)v10;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_1DE18();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_retain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_12134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1DE18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_12218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  uint64_t v13 = sub_1DE18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_122E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1DE18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_123C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_123D8);
}

uint64_t sub_123D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_1DE18();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_12500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_12514);
}

uint64_t sub_12514(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1E518();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  else
  {
    uint64_t v11 = sub_1DE18();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for RGActionConfirmationView()
{
  uint64_t result = qword_29F28;
  if (!qword_29F28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1268C()
{
  uint64_t result = sub_1E518();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1DE18();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1275C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_12778@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for RGActionConfirmationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4 - 8);
  uint64_t v8 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unsigned int v10 = (char *)&v18 - v9;
  sub_13224(a1, (uint64_t)&v18 - v9);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_1328C((uint64_t)v10, v12 + v11);
  sub_13224(a1, (uint64_t)v8);
  uint64_t v13 = swift_allocObject();
  sub_1328C((uint64_t)v8, v13 + v11);
  sub_13224(a1, (uint64_t)v10);
  uint64_t v14 = swift_allocObject();
  sub_1328C((uint64_t)v10, v14 + v11);
  sub_13224(a1, (uint64_t)v8);
  uint64_t v15 = swift_allocObject();
  sub_1328C((uint64_t)v8, v15 + v11);
  sub_1E598();
  sub_1372C(&qword_29DA0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_1DF88();
  *a2 = result;
  a2[1] = v17;
  a2[2] = (uint64_t)sub_133B8;
  a2[3] = v12;
  a2[4] = (uint64_t)sub_133F0;
  a2[5] = v13;
  a2[6] = (uint64_t)sub_1340C;
  a2[7] = v14;
  a2[8] = (uint64_t)sub_135F0;
  a2[9] = v15;
  return result;
}

uint64_t sub_129C4(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  long long v38 = a2;
  uint64_t v5 = sub_1E3A8();
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  __chkstk_darwin(v5);
  long long v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1E3C8();
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_1E3E8();
  uint64_t v42 = *(void *)(v48 - 8);
  uint64_t v9 = __chkstk_darwin(v48);
  unint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = sub_1E578();
  uint64_t v39 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for RGActionConfirmationView();
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v21 = *(unsigned char *)(a1 + *(int *)(v18 + 28) + 8);
  uint64_t v22 = swift_retain();
  uint64_t v23 = sub_180F0(v22, v21);
  swift_release();
  sub_13224(a1, (uint64_t)v20);
  sub_6F9C(0, &qword_29528);
  uint64_t v24 = self;
  id v25 = [v24 currentThread];
  id v26 = [v24 mainThread];
  LOBYTE(a1) = sub_1E6A8();

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1DEB8();
    swift_release();
    swift_release();
    if ((aBlock[0] & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock[0]) = 1;
      swift_retain();
      sub_1DEC8();
      uint64_t v27 = sub_1E4F8();
      uint64_t v28 = (void *)v38(v27);
      uint64_t v29 = self;
      id v30 = [objc_allocWithZone((Class)SKIDirectInvocationContext) init];
      [v30 setInputOrigin:SAInputOriginDialogButtonTapValue];
      [v30 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
      [v30 setEyesFree:0];
      id v31 = [v29 runSiriKitExecutorCommandWithContext:v30 payload:v28];

      sub_1E568();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v14);
      sub_6F9C(0, &qword_29530);
      uint64_t v39 = sub_1E698();
      sub_1E3D8();
      sub_1E3F8();
      uint64_t v42 = *(void *)(v42 + 8);
      ((void (*)(char *, uint64_t))v42)(v11, v48);
      aBlock[4] = v40;
      aBlock[5] = v23;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1366C;
      aBlock[3] = v41;
      uint64_t v32 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1E3B8();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_1372C(&qword_29538, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_7040(&qword_29540);
      sub_7084(&qword_29548, &qword_29540);
      uint64_t v33 = v44;
      uint64_t v34 = v47;
      sub_1E6D8();
      uint64_t v35 = (void *)v39;
      sub_1E688();
      _Block_release(v32);

      (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v34);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v45);
      ((void (*)(char *, uint64_t))v42)(v13, v48);
    }
  }
  swift_release();
  return sub_136B0((uint64_t)v20);
}

uint64_t sub_1307C(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = sub_1DBE8();
  __chkstk_darwin(v3 - 8);
  type metadata accessor for RGActionConfirmationView();
  a2();
  return sub_1E178();
}

uint64_t sub_1311C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_13224(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_1328C((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_13360();
  return sub_1E4A8();
}

uint64_t sub_13224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGActionConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1328C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGActionConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_132F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for RGActionConfirmationView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_12778(v4, a1);
}

unint64_t sub_13360()
{
  unint64_t result = qword_29F68;
  if (!qword_29F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29F68);
  }
  return result;
}

uint64_t sub_133B8()
{
  return sub_13440((uint64_t (*)(uint64_t))&static SiriKitDirectInvocationPayloads.confirm.getter, (uint64_t)sub_6FD8, (uint64_t)&unk_25958);
}

uint64_t sub_133F0()
{
  return sub_13608((void (*)(void))&RGActionConfirmationModel.affirmative.getter);
}

uint64_t sub_1340C()
{
  return sub_13440((uint64_t (*)(uint64_t))&static SiriKitDirectInvocationPayloads.reject.getter, (uint64_t)sub_6FD8, (uint64_t)&unk_25930);
}

uint64_t sub_13440(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for RGActionConfirmationView() - 8);
  return sub_129C4(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a1, a2, a3);
}

uint64_t sub_134C0()
{
  uint64_t v1 = (int *)(type metadata accessor for RGActionConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  uint64_t v8 = v6 + v1[8];
  uint64_t v9 = sub_1DE18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_135F0()
{
  return sub_13608((void (*)(void))&RGActionConfirmationModel.negative.getter);
}

uint64_t sub_13608(void (*a1)(void))
{
  uint64_t v3 = *(void *)(type metadata accessor for RGActionConfirmationView() - 8);
  return sub_1307C(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_1366C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_136B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RGActionConfirmationView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_13714(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_13724()
{
  return swift_release();
}

uint64_t sub_1372C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_13774()
{
  return sub_7084(&qword_29F70, &qword_29F78);
}

uint64_t sub_137B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v212 = a2;
  uint64_t v213 = a1;
  uint64_t v150 = sub_7040(&qword_2A110);
  uint64_t v147 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  v146 = (char *)&v143 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_1E358();
  uint64_t v148 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  v145 = (char *)&v143 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_1DCF8();
  uint64_t v151 = *(void *)(v158 - 8);
  uint64_t v4 = __chkstk_darwin(v158);
  v144 = (char *)&v143 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v157 = (char *)&v143 - v6;
  uint64_t v177 = type metadata accessor for RGToolDisambiguationView();
  __chkstk_darwin(v177);
  v166 = (char *)&v143 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_1DE68();
  uint64_t v165 = *(void *)(v167 - 8);
  __chkstk_darwin(v167);
  v168 = (char *)&v143 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_7040(&qword_2A118);
  __chkstk_darwin(v179);
  v181 = (_OWORD *)((char *)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v173 = sub_7040(&qword_2A120);
  __chkstk_darwin(v173);
  uint64_t v175 = (uint64_t)&v143 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = sub_7040(&qword_2A0C8);
  __chkstk_darwin(v180);
  v176 = (char *)&v143 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v211 = sub_7040(&qword_2A0B8);
  __chkstk_darwin(v211);
  v182 = (char *)&v143 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = type metadata accessor for RGParameterConfirmationView();
  __chkstk_darwin(v174);
  v171 = (char *)&v143 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_1DE88();
  uint64_t v170 = *(void *)(v172 - 8);
  uint64_t v14 = __chkstk_darwin(v172);
  v169 = (char *)&v143 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v188 = (char *)&v143 - v16;
  uint64_t v163 = sub_7040(&qword_2A0A8);
  __chkstk_darwin(v163);
  uint64_t v159 = (uint64_t)&v143 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_7040(&qword_2A128);
  __chkstk_darwin(v160);
  uint64_t v162 = (uint64_t)&v143 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v207 = sub_7040(&qword_2A090);
  __chkstk_darwin(v207);
  v164 = (char *)&v143 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = type metadata accessor for RGArchivedView();
  __chkstk_darwin(v161);
  uint64_t v155 = (uint64_t)&v143 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_1DD18();
  uint64_t v154 = *(void *)(v156 - 8);
  uint64_t v21 = __chkstk_darwin(v156);
  v152 = (char *)&v143 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v153 = (char *)&v143 - v23;
  uint64_t v192 = sub_1E518();
  uint64_t v191 = *(void *)(v192 - 8);
  __chkstk_darwin(v192);
  v190 = (char *)&v143 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v202 = type metadata accessor for RGActionConfirmationView();
  __chkstk_darwin(v202);
  v186 = (char *)&v143 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = sub_1DE18();
  uint64_t v185 = *(void *)(v187 - 8);
  uint64_t v26 = __chkstk_darwin(v187);
  v183 = (char *)&v143 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v184 = (char *)&v143 - v28;
  uint64_t v208 = sub_7040(&qword_2A130);
  __chkstk_darwin(v208);
  uint64_t v210 = (uint64_t)&v143 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = sub_7040(&qword_2A138);
  __chkstk_darwin(v203);
  uint64_t v205 = (uint64_t)&v143 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = sub_7040(&qword_2A140);
  __chkstk_darwin(v199);
  uint64_t v200 = (uint64_t)&v143 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = sub_7040(&qword_2A058);
  __chkstk_darwin(v204);
  v201 = (char *)&v143 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v209 = sub_7040(&qword_2A048);
  __chkstk_darwin(v209);
  v206 = (char *)&v143 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = type metadata accessor for RGDisambiguationView();
  __chkstk_darwin(v196);
  v189 = (char *)&v143 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = sub_7040(&qword_2A148);
  __chkstk_darwin(v193);
  uint64_t v195 = (uint64_t)&v143 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1DCA8();
  __chkstk_darwin(v36 - 8);
  v178 = (char *)&v143 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1DC08();
  uint64_t v39 = __chkstk_darwin(v38 - 8);
  uint64_t v41 = (char *)&v143 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  uint64_t v43 = (char *)&v143 - v42;
  uint64_t v194 = type metadata accessor for RGSFCardView(0);
  __chkstk_darwin(v194);
  uint64_t v45 = (char *)&v143 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = sub_7040(&qword_2A068);
  __chkstk_darwin(v198);
  v197 = (char *)&v143 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_1DD68();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = __chkstk_darwin(v47);
  uint64_t v51 = (char *)&v143 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v49);
  long long v53 = (char *)&v143 - v52;
  uint64_t v54 = sub_1DCC8();
  uint64_t v55 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v57 = (uint64_t *)((char *)&v143 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v55 + 16))(v57, v213, v54);
  int v58 = (*(uint64_t (**)(uint64_t *, uint64_t))(v55 + 88))(v57, v54);
  if (v58 == enum case for RGPluginModel.disambiguationModel(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v192 = v48;
    long long v59 = *(void (**)(char *, uint64_t *, uint64_t))(v48 + 32);
    uint64_t v213 = v47;
    v59(v53, v57, v47);
    unint64_t v60 = sub_729C();
    if (v60)
    {
      unint64_t v61 = v60;
      if (v60 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v132 = sub_1E7A8();
        swift_bridgeObjectRelease();
        if (v132) {
          goto LABEL_5;
        }
      }
      else if (*(void *)((char *)&dword_10 + (v60 & 0xFFFFFFFFFFFFFF8)))
      {
LABEL_5:
        sub_1DD38();
        sub_1DD48();
        uint64_t v62 = (uint64_t)v178;
        sub_1DD28();
        sub_8748(v61, (uint64_t)v43, (uint64_t)v41, v62, (uint64_t)v45);
        sub_16600((uint64_t)v45, v195, type metadata accessor for RGSFCardView);
        swift_storeEnumTagMultiPayload();
        sub_165B8(&qword_2A070, (void (*)(uint64_t))type metadata accessor for RGSFCardView);
        sub_165B8(&qword_2A078, (void (*)(uint64_t))type metadata accessor for RGDisambiguationView);
        uint64_t v63 = (uint64_t)v197;
        sub_1E088();
        sub_16668((uint64_t)v45, type metadata accessor for RGSFCardView);
        uint64_t v64 = v213;
        uint64_t v65 = v192;
LABEL_23:
        sub_CC9C(v63, v200, &qword_2A068);
        swift_storeEnumTagMultiPayload();
        sub_15FCC();
        sub_165B8(&qword_2A080, (void (*)(uint64_t))type metadata accessor for RGActionConfirmationView);
        uint64_t v141 = (uint64_t)v201;
        sub_1E088();
        sub_CC9C(v141, v205, &qword_2A058);
        swift_storeEnumTagMultiPayload();
        sub_15F20();
        sub_160A8();
        uint64_t v142 = (uint64_t)v206;
        sub_1E088();
        sub_CD00(v141, &qword_2A058);
        sub_CC9C(v142, v210, &qword_2A048);
        swift_storeEnumTagMultiPayload();
        sub_15E5C();
        sub_161F8();
        sub_1E088();
        sub_CD00(v142, &qword_2A048);
        sub_CD00(v63, &qword_2A068);
        v90 = *(uint64_t (**)(char *, uint64_t))(v65 + 8);
        uint64_t v97 = v53;
        return v90(v97, v64);
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v65 = v192;
    uint64_t v64 = v213;
    (*(void (**)(char *, char *, uint64_t))(v192 + 16))(v51, v53, v213);
    uint64_t KeyPath = swift_getKeyPath();
    sub_1E598();
    sub_165B8(&qword_29DA0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v134 = sub_1DF88();
    uint64_t v136 = v135;
    uint64_t v137 = (uint64_t)v189;
    v59(v189, (uint64_t *)v51, v64);
    uint64_t v138 = v196;
    uint64_t v139 = v137 + *(int *)(v196 + 20);
    *(void *)uint64_t v139 = KeyPath;
    *(unsigned char *)(v139 + 8) = 0;
    v140 = (uint64_t *)(v137 + *(int *)(v138 + 24));
    uint64_t *v140 = v134;
    v140[1] = v136;
    sub_16600(v137, v195, (uint64_t (*)(void))type metadata accessor for RGDisambiguationView);
    swift_storeEnumTagMultiPayload();
    sub_165B8(&qword_2A070, (void (*)(uint64_t))type metadata accessor for RGSFCardView);
    sub_165B8(&qword_2A078, (void (*)(uint64_t))type metadata accessor for RGDisambiguationView);
    uint64_t v63 = (uint64_t)v197;
    sub_1E088();
    sub_16668(v137, (uint64_t (*)(void))type metadata accessor for RGDisambiguationView);
    goto LABEL_23;
  }
  if (v58 == enum case for RGPluginModel.actionConfirmationModel(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v66 = v185;
    uint64_t v67 = *(void (**)(char *, uint64_t *, uint64_t))(v185 + 32);
    uint64_t v68 = v184;
    uint64_t v69 = v187;
    v67(v184, v57, v187);
    uint64_t v70 = v183;
    (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v183, v68, v69);
    uint64_t v71 = v190;
    sub_1E508();
    uint64_t v72 = swift_getKeyPath();
    uint64_t v73 = (uint64_t)v186;
    (*(void (**)(char *, char *, uint64_t))(v191 + 32))(v186, v71, v192);
    uint64_t v74 = v202;
    uint64_t v75 = v73 + *(int *)(v202 + 20);
    *(void *)uint64_t v75 = v72;
    *(unsigned char *)(v75 + 8) = 0;
    v67((char *)(v73 + *(int *)(v74 + 24)), (uint64_t *)v70, v69);
    sub_16600(v73, v200, (uint64_t (*)(void))type metadata accessor for RGActionConfirmationView);
    swift_storeEnumTagMultiPayload();
    sub_15FCC();
    sub_165B8(&qword_2A080, (void (*)(uint64_t))type metadata accessor for RGActionConfirmationView);
    uint64_t v76 = (uint64_t)v201;
    sub_1E088();
    sub_CC9C(v76, v205, &qword_2A058);
    swift_storeEnumTagMultiPayload();
    sub_15F20();
    sub_160A8();
    uint64_t v77 = (uint64_t)v206;
    sub_1E088();
    sub_CD00(v76, &qword_2A058);
    sub_CC9C(v77, v210, &qword_2A048);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_CD00(v77, &qword_2A048);
    sub_16668(v73, (uint64_t (*)(void))type metadata accessor for RGActionConfirmationView);
    return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v68, v69);
  }
  if (v58 == enum case for RGPluginModel.parameterConfirmationModel(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v79 = v170;
    uint64_t v80 = *(void (**)(char *, uint64_t *, uint64_t))(v170 + 32);
    v81 = v188;
    uint64_t v64 = v172;
    v80(v188, v57, v172);
    uint64_t v82 = v169;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v169, v81, v64);
    uint64_t v83 = v190;
    sub_1E508();
    uint64_t v84 = swift_getKeyPath();
    uint64_t v85 = (uint64_t)v171;
    (*(void (**)(char *, char *, uint64_t))(v191 + 32))(v171, v83, v192);
    uint64_t v86 = v174;
    uint64_t v87 = v85 + *(int *)(v174 + 20);
    *(void *)uint64_t v87 = v84;
    *(unsigned char *)(v87 + 8) = 0;
    v80((char *)(v85 + *(int *)(v86 + 24)), (uint64_t *)v82, v64);
    sub_16600(v85, v175, (uint64_t (*)(void))type metadata accessor for RGParameterConfirmationView);
    swift_storeEnumTagMultiPayload();
    sub_165B8(&qword_2A0D0, (void (*)(uint64_t))type metadata accessor for RGParameterConfirmationView);
    sub_165B8(&qword_2A0D8, (void (*)(uint64_t))type metadata accessor for RGToolDisambiguationView);
    uint64_t v88 = (uint64_t)v176;
    sub_1E088();
    sub_CC9C(v88, (uint64_t)v181, &qword_2A0C8);
    swift_storeEnumTagMultiPayload();
    sub_7040(&qword_2A0E8);
    sub_16234();
    sub_16310();
    uint64_t v89 = (uint64_t)v182;
    sub_1E088();
    sub_CD00(v88, &qword_2A0C8);
    sub_CC9C(v89, v210, &qword_2A0B8);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_CD00(v89, &qword_2A0B8);
    sub_16668(v85, (uint64_t (*)(void))type metadata accessor for RGParameterConfirmationView);
    v90 = *(uint64_t (**)(char *, uint64_t))(v79 + 8);
    v91 = (uint64_t *)&v219;
LABEL_12:
    uint64_t v97 = (char *)*(v91 - 32);
    return v90(v97, v64);
  }
  if (v58 == enum case for RGPluginModel.toolDisambiguationModel(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v92 = v165;
    uint64_t v93 = v168;
    uint64_t v64 = v167;
    (*(void (**)(char *, uint64_t *, uint64_t))(v165 + 32))(v168, v57, v167);
    uint64_t v94 = (uint64_t)v166;
    (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v166, v93, v64);
    sub_16600(v94, v175, (uint64_t (*)(void))type metadata accessor for RGToolDisambiguationView);
    swift_storeEnumTagMultiPayload();
    sub_165B8(&qword_2A0D0, (void (*)(uint64_t))type metadata accessor for RGParameterConfirmationView);
    sub_165B8(&qword_2A0D8, (void (*)(uint64_t))type metadata accessor for RGToolDisambiguationView);
    uint64_t v95 = (uint64_t)v176;
    sub_1E088();
    sub_CC9C(v95, (uint64_t)v181, &qword_2A0C8);
    swift_storeEnumTagMultiPayload();
    sub_7040(&qword_2A0E8);
    sub_16234();
    sub_16310();
    uint64_t v96 = (uint64_t)v182;
    sub_1E088();
    sub_CD00(v95, &qword_2A0C8);
    sub_CC9C(v96, v210, &qword_2A0B8);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_CD00(v96, &qword_2A0B8);
    sub_16668(v94, (uint64_t (*)(void))type metadata accessor for RGToolDisambiguationView);
    v90 = *(uint64_t (**)(char *, uint64_t))(v92 + 8);
    v91 = &v200;
    goto LABEL_12;
  }
  if (v58 == enum case for RGPluginModel.card(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v99 = *v57;
    unint64_t v98 = v57[1];
    sub_7AAC(v99, v98);
    uint64_t v100 = v159;
    sub_7DDC(v99, v98, v159);
    sub_CC9C(v100, v162, &qword_2A0A8);
    swift_storeEnumTagMultiPayload();
    sub_165B8(&qword_2A098, (void (*)(uint64_t))type metadata accessor for RGArchivedView);
    sub_16154();
    uint64_t v101 = (uint64_t)v164;
    sub_1E088();
    sub_CC9C(v101, v205, &qword_2A090);
    swift_storeEnumTagMultiPayload();
    sub_15F20();
    sub_160A8();
    uint64_t v102 = (uint64_t)v206;
    sub_1E088();
    sub_CD00(v101, &qword_2A090);
    sub_CC9C(v102, v210, &qword_2A048);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_7A54(v99, v98);
    sub_CD00(v102, &qword_2A048);
    return sub_CD00(v100, &qword_2A0A8);
  }
  else if (v58 == enum case for RGPluginModel.archivedView(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v103 = v154;
    uint64_t v104 = v153;
    uint64_t v105 = v156;
    (*(void (**)(char *, uint64_t *, uint64_t))(v154 + 32))(v153, v57, v156);
    uint64_t v106 = (uint64_t)v152;
    (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v152, v104, v105);
    uint64_t v107 = v155;
    sub_DA00(v106, v155);
    sub_16600(v107, v162, (uint64_t (*)(void))type metadata accessor for RGArchivedView);
    swift_storeEnumTagMultiPayload();
    sub_165B8(&qword_2A098, (void (*)(uint64_t))type metadata accessor for RGArchivedView);
    sub_16154();
    uint64_t v108 = (uint64_t)v164;
    sub_1E088();
    sub_CC9C(v108, v205, &qword_2A090);
    swift_storeEnumTagMultiPayload();
    sub_15F20();
    sub_160A8();
    uint64_t v109 = (uint64_t)v206;
    sub_1E088();
    sub_CD00(v108, &qword_2A090);
    sub_CC9C(v109, v210, &qword_2A048);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_CD00(v109, &qword_2A048);
    sub_16668(v107, (uint64_t (*)(void))type metadata accessor for RGArchivedView);
    return (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v104, v105);
  }
  else if (v58 == enum case for RGPluginModel.control(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v57, v54);
    uint64_t v110 = v151;
    v111 = v157;
    v112 = v57;
    uint64_t v113 = v158;
    (*(void (**)(char *, uint64_t *, uint64_t))(v151 + 32))(v157, v112, v158);
    v114 = v144;
    (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v144, v111, v113);
    v115 = v145;
    sub_1DCE8();
    v116 = v146;
    sub_1E348();
    v117 = *(void (**)(char *, uint64_t))(v148 + 8);
    uint64_t v118 = v149;
    v117(v115, v149);
    uint64_t v119 = v150;
    v120 = (void *)sub_1E328();
    (*(void (**)(char *, uint64_t))(v147 + 8))(v116, v119);
    sub_1DCE8();
    uint64_t v121 = sub_1E338();
    v122 = *(void (**)(char *, uint64_t))(v110 + 8);
    v123 = v114;
    uint64_t v124 = v158;
    v122(v123, v158);
    v117(v115, v118);
    uint64_t v214 = (uint64_t)v120;
    uint64_t v215 = v121;
    char v216 = 0;
    sub_1638C();
    id v125 = v120;
    sub_1E088();
    char v126 = v218;
    v127 = v181;
    _OWORD *v181 = v217;
    *((unsigned char *)v127 + 16) = v126;
    swift_storeEnumTagMultiPayload();
    sub_7040(&qword_2A0E8);
    sub_16234();
    sub_16310();
    uint64_t v128 = (uint64_t)v182;
    sub_1E088();
    sub_CC9C(v128, v210, &qword_2A0B8);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_CD00(v128, &qword_2A0B8);

    return ((uint64_t (*)(char *, uint64_t))v122)(v157, v124);
  }
  else
  {
    uint64_t v214 = sub_1E188();
    uint64_t v215 = 0;
    char v216 = 1;
    sub_1638C();
    swift_retain();
    sub_1E088();
    char v129 = v218;
    v130 = v181;
    _OWORD *v181 = v217;
    *((unsigned char *)v130 + 16) = v129;
    swift_storeEnumTagMultiPayload();
    sub_7040(&qword_2A0E8);
    sub_16234();
    sub_16310();
    uint64_t v131 = (uint64_t)v182;
    sub_1E088();
    sub_CC9C(v131, v210, &qword_2A0B8);
    swift_storeEnumTagMultiPayload();
    sub_15E5C();
    sub_161F8();
    sub_1E088();
    sub_CD00(v131, &qword_2A0B8);
    swift_release();
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v55 + 8))(v57, v54);
  }
}

uint64_t sub_15A2C()
{
  sub_1643C();
  sub_1DFF8();
  return v1;
}

uint64_t sub_15A68@<X0>(void *a1@<X8>)
{
  sub_1643C();
  uint64_t result = sub_1DFF8();
  *a1 = v3;
  return result;
}

uint64_t sub_15AB8()
{
  return sub_1E008();
}

uint64_t sub_15B18()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResponseGenerationUIPlugin()
{
  return self;
}

uint64_t sub_15B4C()
{
  return sub_165B8(&qword_2A018, (void (*)(uint64_t))&type metadata accessor for RGPluginModel);
}

uint64_t sub_15B94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_15BC8(uint64_t a1)
{
  uint64_t v2 = sub_7040(&qword_2A020);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_7040(&qword_2A028);
  __chkstk_darwin(v5);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_137B8(a1, (uint64_t)v4);
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CommandThrottle();
  uint64_t v9 = swift_allocObject();
  v13[15] = 0;
  sub_1DEA8();
  sub_CC9C((uint64_t)v4, (uint64_t)v7, &qword_2A020);
  uint64_t v10 = (uint64_t *)&v7[*(int *)(v5 + 36)];
  *uint64_t v10 = KeyPath;
  v10[1] = v9;
  sub_CD00((uint64_t)v4, &qword_2A020);
  sub_15DA8();
  uint64_t v11 = sub_1E188();
  sub_CD00((uint64_t)v7, &qword_2A028);
  return v11;
}

uint64_t sub_15D54@<X0>(void *a1@<X8>)
{
  sub_1643C();
  uint64_t result = sub_1DFF8();
  *a1 = v3;
  return result;
}

unint64_t sub_15DA8()
{
  unint64_t result = qword_2A030;
  if (!qword_2A030)
  {
    sub_6D2C(&qword_2A028);
    sub_15E98(&qword_2A038, &qword_2A020, (void (*)(void))sub_15E5C, (void (*)(void))sub_161F8);
    sub_163E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A030);
  }
  return result;
}

uint64_t sub_15E5C()
{
  return sub_15E98(&qword_2A040, &qword_2A048, (void (*)(void))sub_15F20, (void (*)(void))sub_160A8);
}

uint64_t sub_15E98(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6D2C(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_15F20()
{
  unint64_t result = qword_2A050;
  if (!qword_2A050)
  {
    sub_6D2C(&qword_2A058);
    sub_15FCC();
    sub_165B8(&qword_2A080, (void (*)(uint64_t))type metadata accessor for RGActionConfirmationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A050);
  }
  return result;
}

unint64_t sub_15FCC()
{
  unint64_t result = qword_2A060;
  if (!qword_2A060)
  {
    sub_6D2C(&qword_2A068);
    sub_165B8(&qword_2A070, (void (*)(uint64_t))type metadata accessor for RGSFCardView);
    sub_165B8(&qword_2A078, (void (*)(uint64_t))type metadata accessor for RGDisambiguationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A060);
  }
  return result;
}

unint64_t sub_160A8()
{
  unint64_t result = qword_2A088;
  if (!qword_2A088)
  {
    sub_6D2C(&qword_2A090);
    sub_165B8(&qword_2A098, (void (*)(uint64_t))type metadata accessor for RGArchivedView);
    sub_16154();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A088);
  }
  return result;
}

unint64_t sub_16154()
{
  unint64_t result = qword_2A0A0;
  if (!qword_2A0A0)
  {
    sub_6D2C(&qword_2A0A8);
    sub_165B8(&qword_2A070, (void (*)(uint64_t))type metadata accessor for RGSFCardView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A0A0);
  }
  return result;
}

uint64_t sub_161F8()
{
  return sub_15E98(&qword_2A0B0, &qword_2A0B8, (void (*)(void))sub_16234, (void (*)(void))sub_16310);
}

unint64_t sub_16234()
{
  unint64_t result = qword_2A0C0;
  if (!qword_2A0C0)
  {
    sub_6D2C(&qword_2A0C8);
    sub_165B8(&qword_2A0D0, (void (*)(uint64_t))type metadata accessor for RGParameterConfirmationView);
    sub_165B8(&qword_2A0D8, (void (*)(uint64_t))type metadata accessor for RGToolDisambiguationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A0C0);
  }
  return result;
}

unint64_t sub_16310()
{
  unint64_t result = qword_2A0E0;
  if (!qword_2A0E0)
  {
    sub_6D2C(&qword_2A0E8);
    sub_1638C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A0E0);
  }
  return result;
}

unint64_t sub_1638C()
{
  unint64_t result = qword_2A0F0;
  if (!qword_2A0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A0F0);
  }
  return result;
}

unint64_t sub_163E0()
{
  unint64_t result = qword_2A0F8;
  if (!qword_2A0F8)
  {
    sub_6D2C(&qword_2A100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A0F8);
  }
  return result;
}

unint64_t sub_1643C()
{
  unint64_t result = qword_2A108;
  if (!qword_2A108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A108);
  }
  return result;
}

uint64_t sub_16490()
{
  type metadata accessor for CommandThrottle();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_1DEA8();
  qword_2B9A8 = v0;
  return result;
}

uint64_t sub_164F4@<X0>(void *a1@<X8>)
{
  if (qword_29390 != -1) {
    swift_once();
  }
  *a1 = qword_2B9A8;

  return swift_retain();
}

uint64_t sub_16564@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DF98();
  *a1 = result;
  return result;
}

uint64_t sub_16590()
{
  return sub_1DFA8();
}

uint64_t sub_165B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_16600(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_16668(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *_s18CommandThrottleKeyVMa()
{
  return &_s18CommandThrottleKeyVN;
}

uint64_t *sub_166D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1DD68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)v10;
    char v12 = v10[8];
    sub_167E0(*(void *)v10, v12);
    *(void *)uint64_t v9 = v11;
    v9[8] = v12;
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v17 = *(void **)v15;
    uint64_t v16 = *((void *)v15 + 1);
    *uint64_t v14 = v17;
    v14[1] = v16;
    id v18 = v17;
  }
  return a1;
}

uint64_t sub_167E0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

void sub_167EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_16874(*(void *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_16874(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_16880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  sub_167E0(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = v11;
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v16 = *(void **)v14;
  uint64_t v15 = *(void *)(v14 + 8);
  *uint64_t v13 = v16;
  v13[1] = v15;
  id v17 = v16;
  return a1;
}

uint64_t sub_16938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  sub_167E0(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = *(unsigned char *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = v11;
  sub_16874(v12, v13);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  id v17 = *(void **)(a1 + v14);
  id v18 = *(void **)v16;
  void *v15 = *(void *)v16;
  id v19 = v18;

  v15[1] = *(void *)(v16 + 8);
  return a1;
}

uint64_t sub_16A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_16AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  uint64_t v11 = *(void *)v8;
  char v12 = *(unsigned char *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  sub_16874(v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = *(void **)(a1 + v13);
  *uint64_t v14 = *v15;

  v14[1] = v15[1];
  return a1;
}

uint64_t sub_16B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_16B70);
}

uint64_t sub_16B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD68();
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_16C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_16C50);
}

uint64_t sub_16C50(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1DD68();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for RGDisambiguationView()
{
  uint64_t result = qword_2A1A8;
  if (!qword_2A1A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_16D58()
{
  uint64_t result = sub_1DD68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_16DF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_16E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v37 = a2;
  uint64_t v2 = type metadata accessor for RGDisambiguationView();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v34 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_7040(&qword_2A1F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v36 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = sub_1E2F8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_7040(&qword_29E50);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = __chkstk_darwin(v14);
  id v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v32 - v19;
  sub_1E2E8();
  sub_1E318();
  sub_1DEF8();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v18, v13, v10);
  uint64_t v21 = &v18[*(int *)(v15 + 44)];
  long long v22 = v39;
  *(_OWORD *)uint64_t v21 = v38;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v40;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_11BE0((uint64_t)v18, (uint64_t)v20, &qword_29E50);
  uint64_t v23 = v33;
  sub_17F1C(v35, v33);
  unint64_t v24 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v25 = swift_allocObject();
  sub_17F84(v23, v25 + v24);
  sub_7040(&qword_2A1F8);
  sub_18058();
  sub_1E4A8();
  sub_1173C((uint64_t)v20, (uint64_t)v18);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v27 = v36;
  v26(v36, v9, v4);
  uint64_t v28 = v37;
  sub_1173C((uint64_t)v18, v37);
  uint64_t v29 = sub_7040(&qword_2A218);
  v26((char *)(v28 + *(int *)(v29 + 48)), v27, v4);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v5 + 8);
  v30(v9, v4);
  sub_CD00((uint64_t)v20, &qword_29E50);
  v30(v27, v4);
  return sub_CD00((uint64_t)v18, &qword_29E50);
}

uint64_t sub_17218(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RGDisambiguationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_1DD58();
  size_t v6 = sub_1890C(v5);
  swift_bridgeObjectRelease();
  v11[1] = v6;
  swift_getKeyPath();
  sub_17F1C(a1, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_17F84((uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_18DA4;
  *(void *)(v9 + 24) = v8;
  sub_7040(&qword_29E80);
  sub_7040(&qword_2A210);
  sub_7084(&qword_29E88, &qword_29E80);
  sub_7084(&qword_2A208, &qword_2A210);
  return sub_1E308();
}

uint64_t sub_1741C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v7 = type metadata accessor for RGDisambiguationView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = sub_1DE08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = a1 + 1;
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else
  {
    id v15 = sub_11C80(result);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v10);
    sub_17F1C(v23, (uint64_t)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    unint64_t v17 = (v12 + *(unsigned __int8 *)(v8 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v18 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v16, v13, v10);
    sub_17F84((uint64_t)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
    sub_1E508();
    uint64_t v19 = (int *)sub_7040(&qword_2A210);
    uint64_t v20 = a4 + v19[9];
    *(void *)uint64_t v20 = swift_getKeyPath();
    *(unsigned char *)(v20 + 8) = 0;
    *(void *)(a4 + v19[10]) = v15;
    sub_7040(&qword_2A220);
    uint64_t result = swift_storeEnumTagMultiPayload();
    uint64_t v21 = (uint64_t (**)@<X0>(uint64_t@<X8>))(a4 + v19[11]);
    char *v21 = sub_18FEC;
    v21[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v18;
  }
  return result;
}

uint64_t sub_17670@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v3 = sub_7040(&qword_2A228);
  __chkstk_darwin(v3 - 8);
  unint64_t v60 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_7040(&qword_29EB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DBE8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  int v58 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v54 - v12;
  uint64_t v66 = sub_1E4E8();
  uint64_t v62 = *(void *)(v66 - 8);
  uint64_t v14 = __chkstk_darwin(v66);
  long long v59 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v61 = (char *)&v54 - v16;
  uint64_t v63 = sub_7040(&qword_2A230);
  __chkstk_darwin(v63);
  uint64_t v64 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_1E428();
  uint64_t v57 = *(void *)(v65 - 8);
  uint64_t v18 = __chkstk_darwin(v65);
  uint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v54 - v21;
  uint64_t v23 = sub_1DDB8();
  if (!v24) {
    goto LABEL_4;
  }
  uint64_t v56 = v22;
  uint64_t v54 = v23;
  uint64_t v55 = a1;
  uint64_t v25 = sub_1DDC8();
  if (v26 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    sub_1DDE8();
    uint64_t v27 = sub_1E5D8();
    uint64_t v94 = &type metadata for String;
    uint64_t v95 = &protocol witness table for String;
    uint64_t v92 = v27;
    uint64_t v93 = v28;
    sub_1DDF8();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_CD00((uint64_t)v7, &qword_29EB0);
      long long v89 = 0u;
      long long v90 = 0u;
      v91 = 0;
    }
    else
    {
      uint64_t v29 = v58;
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v58, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v29, v8);
      uint64_t v30 = sub_1E5D8();
      uint64_t v32 = v31;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v29, v8);
      *((void *)&v90 + 1) = &type metadata for String;
      v91 = &protocol witness table for String;
      *(void *)&long long v89 = v30;
      *((void *)&v89 + 1) = v32;
    }
    uint64_t v88 = 0;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v85 = 0;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v82 = 0;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v79 = 0;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v76 = 0;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v73 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v33 = (uint64_t)v60;
    sub_1DDD8();
    uint64_t v34 = sub_1E368();
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) == 1)
    {
      sub_CD00(v33, &qword_2A228);
    }
    else
    {
      uint64_t v36 = sub_1B460();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
      if (v36)
      {
        *((void *)&v69 + 1) = &type metadata for AnyView;
        uint64_t v70 = &protocol witness table for AnyView;
        *(void *)&long long v68 = v36;
LABEL_12:
        uint64_t v37 = v59;
        sub_1E4D8();
        long long v39 = v61;
        uint64_t v38 = v62;
        uint64_t v40 = v66;
        (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v37, v66);
        (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v64, v39, v40);
        swift_storeEnumTagMultiPayload();
        sub_190DC(&qword_2A238, (void (*)(uint64_t))&type metadata accessor for PluginView);
        sub_190DC(&qword_2A240, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
        sub_1E088();
        return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v39, v40);
      }
    }
    uint64_t v70 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
    goto LABEL_12;
  }
  uint64_t v42 = v25;
  unint64_t v43 = v26;
  uint64_t v44 = type metadata accessor for RGDisambiguationView();
  uint64_t v45 = v55;
  uint64_t v46 = v55 + *(int *)(v44 + 20);
  uint64_t v47 = *(void *)v46;
  char v48 = *(unsigned char *)(v46 + 8);
  sub_190C8(v42, v43);
  sub_167E0(v47, v48);
  sub_182D4(v47, v48);
  sub_16874(v47, v48);
  uint64_t v49 = *(void **)(v45 + *(int *)(v44 + 24));
  if (v49)
  {
    id v50 = v49;
    sub_1E418();
    uint64_t v52 = v56;
    uint64_t v51 = v57;
    uint64_t v53 = v65;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v56, v20, v65);
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v64, v52, v53);
    swift_storeEnumTagMultiPayload();
    sub_190DC(&qword_2A238, (void (*)(uint64_t))&type metadata accessor for PluginView);
    sub_190DC(&qword_2A240, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    sub_1E088();
    sub_7A40(v42, v43);
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v52, v53);
  }
  else
  {
    sub_1E598();
    sub_190DC(&qword_29DA0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_1DF78();
    __break(1u);
  }
  return result;
}

uint64_t sub_17ED4@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1E028();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_7040(&qword_2A1E8);
  return sub_16E14(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_17F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_17F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_17FE8()
{
  uint64_t v1 = *(void *)(type metadata accessor for RGDisambiguationView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_17218(v2);
}

unint64_t sub_18058()
{
  unint64_t result = qword_2A200;
  if (!qword_2A200)
  {
    sub_6D2C(&qword_2A1F8);
    sub_7084(&qword_2A208, &qword_2A210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A200);
  }
  return result;
}

uint64_t sub_180F0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1DFE8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_1E678();
    uint64_t v9 = sub_1E138();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_184B0(0x54646E616D6D6F43, 0xEF656C74746F7268, &v13);
      _os_log_impl(&dword_0, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1DFD8();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v13;
  }
  return a1;
}

uint64_t sub_182D4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1DFE8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_1E678();
    uint64_t v9 = sub_1E138();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_184B0(0x65646F4D585256, 0xE700000000000000, &v13);
      _os_log_impl(&dword_0, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1DFD8();
    swift_getAtKeyPath();
    sub_16874(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v13;
  }
  return a1;
}

unint64_t sub_184B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_18584(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19174((uint64_t)v12, *a3);
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
      sub_19174((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_19124((uint64_t)v12);
  return v7;
}

unint64_t sub_18584(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = (unint64_t)sub_18684(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_1E778();
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

char *sub_18684(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_1871C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18820(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18820((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_1871C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_187B8(v2, 0);
      unint64_t result = (void *)sub_1E728();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1E608();
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

void *sub_187B8(uint64_t a1, uint64_t a2)
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
  sub_7040(&qword_2A248);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_18820(char *result, int64_t a2, char a3, char *a4)
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
    sub_7040(&qword_2A248);
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

size_t sub_1890C(uint64_t a1)
{
  uint64_t v57 = sub_7040(&qword_29E90);
  uint64_t v2 = __chkstk_darwin(v57);
  uint64_t v56 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v55 = (void *)((char *)v46 - v5);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)v46 - v6;
  uint64_t v58 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  size_t v11 = &_swiftEmptyArrayStorage;
  uint64_t v54 = v10;
  v46[0] = a1;
  if (v10)
  {
    uint64_t v47 = (v9 + 32) & ~v9;
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage + v47;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v53 = sub_1DE08();
    uint64_t v15 = *(void *)(v53 - 8);
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v51 = v15 + 16;
    uint64_t v52 = v16;
    uint64_t v17 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v49 = v7;
    id v50 = (void (**)(char *, char *, uint64_t))(v15 + 32);
    uint64_t v48 = *(void *)(v15 + 72);
    uint64_t v18 = &qword_29E90;
    v46[1] = v9 | 7;
    uint64_t v19 = &_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v21 = v57;
      uint64_t v22 = &v56[*(int *)(v57 + 48)];
      uint64_t v23 = v53;
      v52(v22, v17, v53);
      uint64_t v24 = *(int *)(v21 + 48);
      uint64_t v25 = v18;
      unint64_t v26 = v55;
      uint64_t v27 = (char *)v55 + v24;
      *uint64_t v55 = v13;
      (*v50)(v27, v22, v23);
      uint64_t v28 = (uint64_t)v26;
      uint64_t v18 = v25;
      size_t result = sub_11BE0(v28, (uint64_t)v7, v25);
      if (v14)
      {
        size_t v11 = v19;
        BOOL v20 = __OFSUB__(v14--, 1);
        if (v20) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v30 = v19[3];
        if ((uint64_t)((v30 >> 1) + 0x4000000000000000) < 0)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
        int64_t v31 = v30 & 0xFFFFFFFFFFFFFFFELL;
        if (v31 <= 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = v31;
        }
        sub_7040(&qword_2A250);
        uint64_t v33 = *(void *)(v58 + 72);
        uint64_t v34 = v47;
        size_t v11 = (void *)swift_allocObject();
        size_t result = j__malloc_size(v11);
        if (!v33) {
          goto LABEL_34;
        }
        int64_t v35 = result - v34;
        if (result - v34 == 0x8000000000000000 && v33 == -1) {
          goto LABEL_35;
        }
        uint64_t v37 = v35 / v33;
        void v11[2] = v32;
        v11[3] = 2 * (v35 / v33);
        uint64_t v38 = (char *)v11 + v34;
        uint64_t v39 = v19[3] >> 1;
        uint64_t v40 = v39 * v33;
        if (v19[2])
        {
          if (v11 < v19 || v38 >= (char *)v19 + v47 + v40)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v19)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v19[2] = 0;
        }
        uint64_t v12 = &v38[v40];
        uint64_t v42 = (v37 & 0x7FFFFFFFFFFFFFFFLL) - v39;
        swift_release();
        uint64_t v18 = v25;
        BOOL v20 = __OFSUB__(v42, 1);
        uint64_t v14 = v42 - 1;
        if (v20)
        {
LABEL_27:
          __break(1u);
          break;
        }
      }
      ++v13;
      int64_t v7 = v49;
      sub_11BE0((uint64_t)v49, (uint64_t)v12, v18);
      v12 += *(void *)(v58 + 72);
      v17 += v48;
      uint64_t v19 = v11;
      if (v54 == v13) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v43 = v11[3];
  if (v43 >= 2)
  {
    unint64_t v44 = v43 >> 1;
    BOOL v20 = __OFSUB__(v44, v14);
    uint64_t v45 = v44 - v14;
    if (v20) {
      goto LABEL_36;
    }
    void v11[2] = v45;
  }
  return (size_t)v11;
}

uint64_t sub_18CA0()
{
  uint64_t v1 = (int *)(type metadata accessor for RGDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  sub_16874(*(void *)(v6 + v1[7]), *(unsigned char *)(v6 + v1[7] + 8));

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_18DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for RGDisambiguationView() - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_1741C(a1, a2, v8, a3);
}

uint64_t sub_18E2C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_18E64()
{
  uint64_t v1 = sub_1DE08();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for RGDisambiguationView() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v11 = sub_1DD68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v0 + v8, v11);
  sub_16874(*(void *)(v0 + v8 + v6[7]), *(unsigned char *)(v0 + v8 + v6[7] + 8));

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_18FEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_1DE08() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for RGDisambiguationView() - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_17670(v7, a1);
}

uint64_t sub_190C8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_7AAC(a1, a2);
  }
  return a1;
}

uint64_t sub_190DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_19124(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_19174(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_191D0()
{
  return sub_7084(&qword_2A258, &qword_2A260);
}

void *initializeBufferWithCopyOfBuffer for RGControlView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for RGControlView(id *a1)
{
}

uint64_t assignWithCopy for RGControlView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for RGControlView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for RGControlView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RGControlView(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RGControlView()
{
  return &type metadata for RGControlView;
}

uint64_t sub_19364()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_19380()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  id v3 = v1;

  return ControlView.init(control:controlType:)(v3, v2);
}

unint64_t sub_193C4()
{
  unint64_t result = qword_2A268;
  if (!qword_2A268)
  {
    sub_1E448();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A268);
  }
  return result;
}

uint64_t *sub_19420(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1E518();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v12 = *(void *)v11;
    LOBYTE(v11) = v11[8];
    *(void *)uint64_t v10 = v12;
    v10[8] = (char)v11;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = sub_1DE88();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_retain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_1955C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_1DE88();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_19610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v10;
  LOBYTE(v10) = *((unsigned char *)v10 + 8);
  *(void *)uint64_t v9 = v11;
  *(unsigned char *)(v9 + 8) = (_BYTE)v10;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_1DE88();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_retain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_196FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1DE88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_197E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  uint64_t v13 = sub_1DE88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_198B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1DE88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1998C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_199A0);
}

uint64_t sub_199A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E518();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_1DE88();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_19AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_19ADC);
}

uint64_t sub_19ADC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1E518();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  else
  {
    uint64_t v11 = sub_1DE88();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for RGParameterConfirmationView()
{
  uint64_t result = qword_2A2C8;
  if (!qword_2A2C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_19C54()
{
  uint64_t result = sub_1E518();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1DE88();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_19D24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_19D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v91 = a1;
  uint64_t v89 = a2;
  uint64_t v2 = type metadata accessor for RGParameterConfirmationView();
  uint64_t v85 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  long long v86 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = v4;
  __chkstk_darwin(v3);
  uint64_t v88 = (uint64_t)&v76 - v5;
  uint64_t v6 = sub_7040(&qword_2A228);
  __chkstk_darwin(v6 - 8);
  long long v81 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_7040(&qword_29EB0);
  __chkstk_darwin(v8 - 8);
  uint64_t v80 = (uint64_t)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1DBE8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v78 = v10;
  uint64_t v79 = v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v76 - v15;
  uint64_t v82 = sub_1E4E8();
  uint64_t v84 = *(void *)(v82 - 8);
  uint64_t v17 = __chkstk_darwin(v82);
  uint64_t v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v76 - v20;
  uint64_t v22 = sub_7040(&qword_2A318);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1DE08();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v76 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_7040(&qword_2A320);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v87 = (uint64_t)&v76 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v90 = (uint64_t)&v76 - v32;
  sub_1DE78();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) != 1)
  {
    uint64_t v76 = v19;
    long long v77 = v21;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
    sub_1DDE8();
    uint64_t v40 = sub_1E5D8();
    uint64_t v118 = &type metadata for String;
    uint64_t v119 = &protocol witness table for String;
    uint64_t v116 = v40;
    uint64_t v117 = v41;
    uint64_t v42 = v80;
    sub_1DDF8();
    uint64_t v43 = v42;
    uint64_t v44 = v78;
    uint64_t v45 = v26;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v79 + 48))(v43, 1, v78) == 1)
    {
      sub_CD00(v80, &qword_29EB0);
      long long v113 = 0u;
      long long v114 = 0u;
      v115 = 0;
    }
    else
    {
      uint64_t v46 = v79;
      uint64_t v47 = v25;
      uint64_t v48 = v14;
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 32))(v14, v80, v44);
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v16, v14, v44);
      uint64_t v49 = sub_1E5D8();
      uint64_t v51 = v50;
      uint64_t v52 = v48;
      uint64_t v25 = v47;
      (*(void (**)(char *, uint64_t))(v46 + 8))(v52, v44);
      *((void *)&v114 + 1) = &type metadata for String;
      v115 = &protocol witness table for String;
      *(void *)&long long v113 = v49;
      *((void *)&v113 + 1) = v51;
    }
    uint64_t v34 = v90;
    uint64_t v38 = v82;
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
    sub_1DDD8();
    uint64_t v53 = (uint64_t)v81;
    uint64_t v54 = sub_1E368();
    uint64_t v55 = *(void *)(v54 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54) == 1)
    {
      sub_CD00(v53, &qword_2A228);
      uint64_t v56 = v76;
    }
    else
    {
      uint64_t v57 = sub_1B460();
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v53, v54);
      uint64_t v56 = v76;
      if (v57)
      {
        *((void *)&v93 + 1) = &type metadata for AnyView;
        uint64_t v94 = &protocol witness table for AnyView;
        *(void *)&long long v92 = v57;
LABEL_11:
        uint64_t v58 = v56;
        sub_1E4D8();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v25);
        uint64_t v39 = v84;
        long long v59 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
        unint64_t v60 = v77;
        v59(v77, v58, v38);
        v59((char *)v34, v60, v38);
        uint64_t v33 = 0;
        uint64_t v35 = v91;
        uint64_t v36 = v85;
        uint64_t v37 = (uint64_t)v86;
        goto LABEL_12;
      }
    }
    uint64_t v94 = 0;
    long long v92 = 0u;
    long long v93 = 0u;
    goto LABEL_11;
  }
  sub_CD00((uint64_t)v24, &qword_2A318);
  uint64_t v33 = 1;
  uint64_t v34 = v90;
  uint64_t v35 = v91;
  uint64_t v36 = v85;
  uint64_t v37 = (uint64_t)v86;
  uint64_t v38 = v82;
  uint64_t v39 = v84;
LABEL_12:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v34, v33, 1, v38);
  uint64_t v61 = v88;
  sub_1AF44(v35, v88);
  unint64_t v62 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v63 = swift_allocObject();
  sub_1AFAC(v61, v63 + v62);
  sub_1AF44(v35, v37);
  uint64_t v64 = swift_allocObject();
  sub_1AFAC(v37, v64 + v62);
  sub_1AF44(v35, v61);
  uint64_t v65 = swift_allocObject();
  sub_1AFAC(v61, v65 + v62);
  sub_1AF44(v35, v37);
  uint64_t v66 = swift_allocObject();
  sub_1AFAC(v37, v66 + v62);
  sub_1E598();
  sub_1372C(&qword_29DA0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t v67 = (void *)sub_1DF88();
  uint64_t v69 = v68;
  uint64_t v70 = v90;
  uint64_t v71 = v87;
  sub_1B338(v90, v87);
  uint64_t v72 = v89;
  sub_1B338(v71, v89);
  uint64_t v73 = (void *)(v72 + *(int *)(sub_7040(&qword_2A328) + 48));
  *uint64_t v73 = v67;
  v73[1] = v69;
  v73[2] = sub_1B084;
  v73[3] = v63;
  v73[4] = sub_1B0BC;
  v73[5] = v64;
  v73[6] = sub_1B0D8;
  v73[7] = v65;
  v73[8] = sub_1B2BC;
  v73[9] = v66;
  id v74 = v67;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_CD00(v70, &qword_2A320);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return sub_CD00(v71, &qword_2A320);
}

uint64_t sub_1A6B4(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  uint64_t v38 = a2;
  uint64_t v5 = sub_1E3A8();
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  __chkstk_darwin(v5);
  uint64_t v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1E3C8();
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_1E3E8();
  uint64_t v42 = *(void *)(v48 - 8);
  uint64_t v9 = __chkstk_darwin(v48);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = sub_1E578();
  uint64_t v39 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for RGParameterConfirmationView();
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v21 = *(unsigned char *)(a1 + *(int *)(v18 + 28) + 8);
  uint64_t v22 = swift_retain();
  uint64_t v23 = sub_180F0(v22, v21);
  swift_release();
  sub_1AF44(a1, (uint64_t)v20);
  sub_6F9C(0, &qword_29528);
  uint64_t v24 = self;
  id v25 = [v24 currentThread];
  id v26 = [v24 mainThread];
  LOBYTE(a1) = sub_1E6A8();

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1DEB8();
    swift_release();
    swift_release();
    if ((aBlock[0] & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock[0]) = 1;
      swift_retain();
      sub_1DEC8();
      uint64_t v27 = sub_1E4F8();
      uint64_t v28 = (void *)v38(v27);
      uint64_t v29 = self;
      id v30 = [objc_allocWithZone((Class)SKIDirectInvocationContext) init];
      [v30 setInputOrigin:SAInputOriginDialogButtonTapValue];
      [v30 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
      [v30 setEyesFree:0];
      id v31 = [v29 runSiriKitExecutorCommandWithContext:v30 payload:v28];

      sub_1E568();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v14);
      sub_6F9C(0, &qword_29530);
      uint64_t v39 = sub_1E698();
      sub_1E3D8();
      sub_1E3F8();
      uint64_t v42 = *(void *)(v42 + 8);
      ((void (*)(char *, uint64_t))v42)(v11, v48);
      aBlock[4] = v40;
      aBlock[5] = v23;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1366C;
      aBlock[3] = v41;
      uint64_t v32 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1E3B8();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_1372C(&qword_29538, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_7040(&qword_29540);
      sub_7084(&qword_29548, &qword_29540);
      uint64_t v33 = v44;
      uint64_t v34 = v47;
      sub_1E6D8();
      uint64_t v35 = (void *)v39;
      sub_1E688();
      _Block_release(v32);

      (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v34);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v45);
      ((void (*)(char *, uint64_t))v42)(v13, v48);
    }
  }
  swift_release();
  return sub_1B3A0((uint64_t)v20);
}

uint64_t sub_1AD6C(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = sub_1DBE8();
  __chkstk_darwin(v3 - 8);
  type metadata accessor for RGParameterConfirmationView();
  a2();
  return sub_1E178();
}

uint64_t sub_1AE0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1AF44(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_1AFAC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_7040(&qword_2A308);
  sub_7084(&qword_2A310, &qword_2A308);
  return sub_1E4A8();
}

uint64_t sub_1AF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGParameterConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGParameterConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B010@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for RGParameterConfirmationView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_19D40(v4, a1);
}

uint64_t sub_1B084()
{
  return sub_1B10C((uint64_t (*)(uint64_t))&static SiriKitDirectInvocationPayloads.confirm.getter, (uint64_t)sub_6FD8, (uint64_t)&unk_25BB0);
}

uint64_t sub_1B0BC()
{
  return sub_1B2D4((void (*)(void))&RGParameterConfirmationModel.affirmative.getter);
}

uint64_t sub_1B0D8()
{
  return sub_1B10C((uint64_t (*)(uint64_t))&static SiriKitDirectInvocationPayloads.reject.getter, (uint64_t)sub_6FD8, (uint64_t)&unk_25B88);
}

uint64_t sub_1B10C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for RGParameterConfirmationView() - 8);
  return sub_1A6B4(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a1, a2, a3);
}

uint64_t sub_1B18C()
{
  uint64_t v1 = (int *)(type metadata accessor for RGParameterConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1E518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  uint64_t v8 = v6 + v1[8];
  uint64_t v9 = sub_1DE88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1B2BC()
{
  return sub_1B2D4((void (*)(void))&RGParameterConfirmationModel.negative.getter);
}

uint64_t sub_1B2D4(void (*a1)(void))
{
  uint64_t v3 = *(void *)(type metadata accessor for RGParameterConfirmationView() - 8);
  return sub_1AD6C(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_1B338(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040(&qword_2A320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B3A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RGParameterConfirmationView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B404(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1B414()
{
  return swift_release();
}

uint64_t sub_1B41C()
{
  return sub_7084(&qword_2A330, &qword_2A338);
}

uint64_t sub_1B460()
{
  uint64_t v0 = sub_7040(&qword_2A340);
  __chkstk_darwin(v0 - 8);
  uint64_t v39 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_7040(&qword_2A348);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E398();
  uint64_t v38 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DC78();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_1E458();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1E368();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t *)((char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(v16, v40, v13);
  int v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 88))(v16, v13);
  if (v17 == enum case for DisplayRepresentation.Image.data(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v16, v13);
    uint64_t v18 = *v16;
    unint64_t v19 = v16[1];
    sub_1DC68();
    sub_1E468();
    sub_1BC70();
    uint64_t v20 = sub_1E188();
    sub_7A54(v18, v19);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    uint64_t v22 = v38;
    char v21 = v39;
    if (v17 == enum case for DisplayRepresentation.Image.symbol(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v16, v13);
      uint64_t v23 = v16;
      uint64_t v24 = v7;
      uint64_t v25 = v5;
      (*(void (**)(char *, uint64_t *, uint64_t))(v22 + 32))(v7, v23, v5);
      sub_1E378();
      sub_1E258();
      sub_1E038();
      uint64_t v26 = sub_1E048();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v4, 0, 1, v26);
      uint64_t v27 = sub_1E268();
      swift_release();
      sub_CD00((uint64_t)v4, &qword_2A348);
      uint64_t v28 = (uint64_t)v21;
      sub_1E388();
      uint64_t v29 = sub_7040(&qword_2A350);
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
      {
        sub_CD00(v28, &qword_2A340);
        uint64_t v31 = sub_1E248();
      }
      else
      {
        uint64_t v32 = (void *)sub_1E328();
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
        id v33 = [v32 CGColor];
        uint64_t v31 = sub_1E228();
      }
      uint64_t v34 = sub_1E158();
      uint64_t v35 = v22;
      uint64_t KeyPath = swift_getKeyPath();
      sub_1E318();
      sub_1DEF8();
      uint64_t v41 = v27;
      uint64_t v42 = v31;
      uint64_t v43 = KeyPath;
      uint64_t v44 = v34;
      uint64_t v45 = v50;
      char v46 = v51;
      uint64_t v47 = v52;
      char v48 = v53;
      long long v49 = v54;
      sub_7040(&qword_2A358);
      sub_1BAB4();
      uint64_t v20 = sub_1E188();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v25);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
      return 0;
    }
  }
  return v20;
}

uint64_t sub_1BA5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DFB8();
  *a1 = result;
  return result;
}

uint64_t sub_1BA88()
{
  return sub_1DFC8();
}

unint64_t sub_1BAB4()
{
  unint64_t result = qword_2A360;
  if (!qword_2A360)
  {
    sub_6D2C(&qword_2A358);
    sub_1BB30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A360);
  }
  return result;
}

unint64_t sub_1BB30()
{
  unint64_t result = qword_2A368;
  if (!qword_2A368)
  {
    sub_6D2C(&qword_2A370);
    sub_1BBD0();
    sub_7084(&qword_2A398, &qword_2A3A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A368);
  }
  return result;
}

unint64_t sub_1BBD0()
{
  unint64_t result = qword_2A378;
  if (!qword_2A378)
  {
    sub_6D2C(&qword_2A380);
    sub_7084(&qword_2A388, &qword_2A390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A378);
  }
  return result;
}

unint64_t sub_1BC70()
{
  unint64_t result = qword_2A3A8;
  if (!qword_2A3A8)
  {
    sub_1E458();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A3A8);
  }
  return result;
}

uint64_t sub_1BCC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1BD3C()
{
  return sub_1DEC8();
}

uint64_t sub_1BDAC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC26ResponseGenerationUIPlugin15CommandThrottle__throttling;
  uint64_t v2 = sub_7040(&qword_2A4A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1BE50()
{
  return type metadata accessor for CommandThrottle();
}

uint64_t type metadata accessor for CommandThrottle()
{
  uint64_t result = qword_2A3E0;
  if (!qword_2A3E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BEA4()
{
  sub_1BF34();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1BF34()
{
  if (!qword_2A3F0)
  {
    unint64_t v0 = sub_1DED8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2A3F0);
    }
  }
}

uint64_t sub_1BF8C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CommandThrottle();
  uint64_t result = sub_1DE98();
  *a1 = result;
  return result;
}

uint64_t sub_1BFCC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DEB8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1C050()
{
  return sub_1DEC8();
}

Swift::String *ShowInCompactKey.unsafeMutableAddressor()
{
  return &ShowInCompactKey;
}

BOOL static UpdatePresentation.__derived_struct_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t UpdatePresentation.style.getter(char a1)
{
  return a1 & 1;
}

void UpdatePresentation.PresentationStyle.hash(into:)(uint64_t a1, char a2)
{
}

BOOL sub_1C114(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_1C130()
{
  sub_1E898(*v0);
}

uint64_t sub_1C160()
{
  if (*v0) {
    return 0x657370616C6C6F63;
  }
  else {
    return 0x6465646E61707865;
  }
}

uint64_t sub_1C1A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1CCF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C1C8()
{
  return 0;
}

void sub_1C1D4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1C1E0(uint64_t a1)
{
  unint64_t v2 = sub_1C684();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C21C(uint64_t a1)
{
  unint64_t v2 = sub_1C684();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1C258()
{
  return 0;
}

void sub_1C264(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C270(uint64_t a1)
{
  unint64_t v2 = sub_1C6D8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C2AC(uint64_t a1)
{
  unint64_t v2 = sub_1C6D8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1C2E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1C318(uint64_t a1)
{
  unint64_t v2 = sub_1C72C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C354(uint64_t a1)
{
  unint64_t v2 = sub_1C72C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t UpdatePresentation.PresentationStyle.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_7040(&qword_2A4B0);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_7040(&qword_2A4B8);
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_7040(&qword_2A4C0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C640(a1, a1[3]);
  sub_1C684();
  sub_1E8C8();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_1C6D8();
    sub_1E838();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_1C72C();
    sub_1E838();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

void *sub_1C640(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C684()
{
  unint64_t result = qword_2A4C8;
  if (!qword_2A4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A4C8);
  }
  return result;
}

unint64_t sub_1C6D8()
{
  unint64_t result = qword_2A4D0;
  if (!qword_2A4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A4D0);
  }
  return result;
}

unint64_t sub_1C72C()
{
  unint64_t result = qword_2A4D8;
  if (!qword_2A4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A4D8);
  }
  return result;
}

Swift::Int UpdatePresentation.PresentationStyle.hashValue.getter(char a1)
{
  return sub_1E8A8();
}

uint64_t UpdatePresentation.PresentationStyle.init(from:)(uint64_t a1)
{
  return sub_1CDF8(a1) & 1;
}

Swift::Int sub_1C7E4()
{
  Swift::UInt v1 = *v0;
  sub_1E888();
  sub_1E898(v1);
  return sub_1E8A8();
}

Swift::Int sub_1C82C()
{
  Swift::UInt v1 = *v0;
  sub_1E888();
  sub_1E898(v1);
  return sub_1E8A8();
}

uint64_t sub_1C870@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1CDF8(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_1C8A0(void *a1)
{
  return UpdatePresentation.PresentationStyle.encode(to:)(a1, *v1);
}

uint64_t sub_1C8BC()
{
  return 1;
}

Swift::Int sub_1C8C4()
{
  return sub_1E8A8();
}

void sub_1C908()
{
}

Swift::Int sub_1C930()
{
  return sub_1E8A8();
}

uint64_t sub_1C970()
{
  return 0x656C797473;
}

uint64_t sub_1C984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x656C797473 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1E858();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1CA14(uint64_t a1)
{
  unint64_t v2 = sub_1D248();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1CA50(uint64_t a1)
{
  unint64_t v2 = sub_1D248();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t UpdatePresentation.encode(to:)(void *a1, char a2)
{
  char v3 = a2 & 1;
  uint64_t v4 = sub_7040(&qword_2A4E0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1C640(a1, a1[3]);
  sub_1D248();
  sub_1E8C8();
  v9[15] = v3;
  sub_1D29C();
  sub_1E848();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t UpdatePresentation.init(from:)(void *a1)
{
  return (unint64_t)sub_1D2F0(a1) & 1;
}

void *sub_1CBEC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D2F0(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_1CC1C(void *a1)
{
  return UpdatePresentation.encode(to:)(a1, *v1);
}

uint64_t sub_1CC38()
{
  return sub_1DC28();
}

uint64_t sub_1CCA4()
{
  return sub_1DC18();
}

uint64_t sub_1CCF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465646E61707865 && a2 == 0xE800000000000000;
  if (v2 || (sub_1E858() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657370616C6C6F63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1E858();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1CDF8(uint64_t a1)
{
  uint64_t v2 = sub_7040(&qword_2A560);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_7040(&qword_2A568);
  uint64_t v25 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_7040(&qword_2A570);
  uint64_t v24 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C640((void *)a1, *(void *)(a1 + 24));
  sub_1C684();
  uint64_t v12 = v26;
  sub_1E8B8();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_1E828();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_1E768();
    swift_allocError();
    int v18 = v17;
    sub_7040(&qword_2A578);
    *int v18 = &type metadata for UpdatePresentation.PresentationStyle;
    sub_1E808();
    sub_1E758();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, enum case for DecodingError.typeMismatch(_:), v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_19124(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_1C6D8();
    sub_1E7F8();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_1C72C();
    sub_1E7F8();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_19124(v26);
  return a1;
}

unint64_t sub_1D248()
{
  unint64_t result = qword_2A4E8;
  if (!qword_2A4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A4E8);
  }
  return result;
}

unint64_t sub_1D29C()
{
  unint64_t result = qword_2A4F0;
  if (!qword_2A4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A4F0);
  }
  return result;
}

void *sub_1D2F0(void *a1)
{
  uint64_t v3 = sub_7040(&qword_2A550);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1C640(a1, a1[3]);
  sub_1D248();
  sub_1E8B8();
  if (v1)
  {
    sub_19124((uint64_t)a1);
  }
  else
  {
    sub_1DB50();
    sub_1E818();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[15];
    sub_19124((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_1D460()
{
  unint64_t result = qword_2A4F8;
  if (!qword_2A4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A4F8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for UpdatePresentation(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for UpdatePresentation()
{
  return &type metadata for UpdatePresentation;
}

ValueMetadata *type metadata accessor for UpdatePresentation.PresentationStyle()
{
  return &type metadata for UpdatePresentation.PresentationStyle;
}

uint64_t getEnumTagSinglePayload for UpdatePresentation.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for UpdatePresentation.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D5D8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D600()
{
  return 0;
}

ValueMetadata *type metadata accessor for UpdatePresentation.CodingKeys()
{
  return &type metadata for UpdatePresentation.CodingKeys;
}

uint64_t _s26ResponseGenerationUIPlugin18UpdatePresentationVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s26ResponseGenerationUIPlugin18UpdatePresentationVwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1D774);
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

uint64_t sub_1D79C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1D7A4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UpdatePresentation.PresentationStyle.CodingKeys()
{
  return &type metadata for UpdatePresentation.PresentationStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for UpdatePresentation.PresentationStyle.ExpandedCodingKeys()
{
  return &type metadata for UpdatePresentation.PresentationStyle.ExpandedCodingKeys;
}

ValueMetadata *type metadata accessor for UpdatePresentation.PresentationStyle.CollapsedCodingKeys()
{
  return &type metadata for UpdatePresentation.PresentationStyle.CollapsedCodingKeys;
}

unint64_t sub_1D7E4()
{
  unint64_t result = qword_2A500;
  if (!qword_2A500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A500);
  }
  return result;
}

unint64_t sub_1D83C()
{
  unint64_t result = qword_2A508;
  if (!qword_2A508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A508);
  }
  return result;
}

unint64_t sub_1D894()
{
  unint64_t result = qword_2A510;
  if (!qword_2A510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A510);
  }
  return result;
}

unint64_t sub_1D8EC()
{
  unint64_t result = qword_2A518;
  if (!qword_2A518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A518);
  }
  return result;
}

unint64_t sub_1D944()
{
  unint64_t result = qword_2A520;
  if (!qword_2A520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A520);
  }
  return result;
}

unint64_t sub_1D99C()
{
  unint64_t result = qword_2A528;
  if (!qword_2A528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A528);
  }
  return result;
}

unint64_t sub_1D9F4()
{
  unint64_t result = qword_2A530;
  if (!qword_2A530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A530);
  }
  return result;
}

unint64_t sub_1DA4C()
{
  unint64_t result = qword_2A538;
  if (!qword_2A538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A538);
  }
  return result;
}

unint64_t sub_1DAA4()
{
  unint64_t result = qword_2A540;
  if (!qword_2A540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A540);
  }
  return result;
}

unint64_t sub_1DAFC()
{
  unint64_t result = qword_2A548;
  if (!qword_2A548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A548);
  }
  return result;
}

unint64_t sub_1DB50()
{
  unint64_t result = qword_2A558;
  if (!qword_2A558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2A558);
  }
  return result;
}

uint64_t sub_1DBB8()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1DBC8()
{
  return JSONDecoder.init()();
}

uint64_t sub_1DBD8()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1DBE8()
{
  return type metadata accessor for LocalizedStringResource();
}

NSData sub_1DBF8()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1DC08()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1DC18()
{
  return UpdateResponseCommand<>.serializeData()();
}

uint64_t sub_1DC28()
{
  return UpdateResponseCommand<>.init(_:)();
}

uint64_t sub_1DC38()
{
  return static Command.directInvocation(identifier:payload:isNavigation:)();
}

uint64_t sub_1DC48()
{
  return type metadata accessor for Command();
}

uint64_t sub_1DC58()
{
  return static RFImage.appIcon(_:)();
}

uint64_t sub_1DC68()
{
  return static RFImage.pngData(_:dark:)();
}

uint64_t sub_1DC78()
{
  return type metadata accessor for RFImage();
}

uint64_t sub_1DC88()
{
  return static SiriKitDirectInvocationPayloads.keySelection.getter();
}

uint64_t sub_1DC98()
{
  return static SiriKitDirectInvocationPayloads.selectIndexIdentifier.getter();
}

uint64_t sub_1DCA8()
{
  return type metadata accessor for StatementID();
}

uint64_t sub_1DCB8()
{
  return static RGPluginModel.bundleName.getter();
}

uint64_t sub_1DCC8()
{
  return type metadata accessor for RGPluginModel();
}

uint64_t sub_1DCD8()
{
  return type metadata accessor for MessagePayload();
}

uint64_t sub_1DCE8()
{
  return RGControlModel.controlMetadata.getter();
}

uint64_t sub_1DCF8()
{
  return type metadata accessor for RGControlModel();
}

uint64_t sub_1DD08()
{
  return ArchivedViewModel.viewData.getter();
}

uint64_t sub_1DD18()
{
  return type metadata accessor for ArchivedViewModel();
}

uint64_t sub_1DD28()
{
  return RGDisambiguationModel.statementID.getter();
}

uint64_t sub_1DD38()
{
  return RGDisambiguationModel.actionEventId.getter();
}

uint64_t sub_1DD48()
{
  return RGDisambiguationModel.systemResponseEventId.getter();
}

uint64_t sub_1DD58()
{
  return RGDisambiguationModel.itemDisplayRepresentations.getter();
}

uint64_t sub_1DD68()
{
  return type metadata accessor for RGDisambiguationModel();
}

uint64_t sub_1DD78()
{
  return type metadata accessor for SystemPromptResolution.UserAction();
}

uint64_t sub_1DD88()
{
  return type metadata accessor for SystemPromptResolution.InputModality();
}

uint64_t sub_1DD98()
{
  return SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:inputModality:)();
}

uint64_t sub_1DDA8()
{
  return type metadata accessor for SystemPromptResolution();
}

uint64_t sub_1DDB8()
{
  return RGDisplayRepresentation.bundleIdentifier.getter();
}

uint64_t sub_1DDC8()
{
  return RGDisplayRepresentation.snippetPluginModelData.getter();
}

uint64_t sub_1DDD8()
{
  return RGDisplayRepresentation.image.getter();
}

uint64_t sub_1DDE8()
{
  return RGDisplayRepresentation.title.getter();
}

uint64_t sub_1DDF8()
{
  return RGDisplayRepresentation.subtitle.getter();
}

uint64_t sub_1DE08()
{
  return type metadata accessor for RGDisplayRepresentation();
}

uint64_t sub_1DE18()
{
  return type metadata accessor for RGActionConfirmationModel();
}

uint64_t sub_1DE28()
{
  return RGToolDisambiguationModel.statementID.getter();
}

uint64_t sub_1DE38()
{
  return RGToolDisambiguationModel.actionEventId.getter();
}

uint64_t sub_1DE48()
{
  return RGToolDisambiguationModel.systemResponseEventId.getter();
}

uint64_t sub_1DE58()
{
  return RGToolDisambiguationModel.itemDisplayRepresentations.getter();
}

uint64_t sub_1DE68()
{
  return type metadata accessor for RGToolDisambiguationModel();
}

uint64_t sub_1DE78()
{
  return RGParameterConfirmationModel.parameterDisplayRepresentation.getter();
}

uint64_t sub_1DE88()
{
  return type metadata accessor for RGParameterConfirmationModel();
}

uint64_t sub_1DE98()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_1DEA8()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1DEB8()
{
  return static Published.subscript.getter();
}

uint64_t sub_1DEC8()
{
  return static Published.subscript.setter();
}

uint64_t sub_1DED8()
{
  return type metadata accessor for Published();
}

uint64_t sub_1DEE8()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_1DEF8()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1DF08()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1DF18()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_1DF28()
{
  return type metadata accessor for _ArchivedView();
}

uint64_t sub_1DF38()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_1DF48()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1DF58()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_1DF68()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_1DF78()
{
  return EnvironmentObject.error()();
}

uint64_t sub_1DF88()
{
  return EnvironmentObject.init()();
}

uint64_t sub_1DF98()
{
  return EnvironmentValues.mode.getter();
}

uint64_t sub_1DFA8()
{
  return EnvironmentValues.mode.setter();
}

uint64_t sub_1DFB8()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1DFC8()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1DFD8()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1DFE8()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1DFF8()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1E008()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1E018()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1E028()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1E038()
{
  return static SymbolRenderingMode.monochrome.getter();
}

uint64_t sub_1E048()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_1E058()
{
  return _ArchivedViewStates.init(data:)();
}

uint64_t sub_1E068()
{
  return _ArchivedViewStates.state(at:)();
}

uint64_t sub_1E078()
{
  return type metadata accessor for _ArchivedViewStates();
}

uint64_t sub_1E088()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1E098()
{
  return static PrimitiveButtonStyle<>.rfButton.getter();
}

uint64_t sub_1E0A8()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_1E0B8()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_1E0C8()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1E0E8()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_1E0F8()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_1E108()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_1E128()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_1E138()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1E148()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1E158()
{
  return static Font.title.getter();
}

uint64_t sub_1E168()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1E178()
{
  return Text.init(_:)();
}

uint64_t sub_1E188()
{
  return View.eraseToAnyView()();
}

uint64_t sub_1E198()
{
  return View.buttonRole(_:)();
}

uint64_t sub_1E1A8()
{
  return View.ambientDrawable(renderWithDrawingGroup:)();
}

uint64_t sub_1E1B8()
{
  return View.onUpdateResponseCommand<A>(_:perform:)();
}

uint64_t sub_1E1C8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1E1D8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1E1E8()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_1E1F8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1E208()
{
  return View.padding(_:_:)();
}

uint64_t sub_1E218()
{
  return View.disabled(_:)();
}

uint64_t sub_1E228()
{
  return Color.init(cgColor:)();
}

uint64_t sub_1E238()
{
  return static Color.clear.getter();
}

uint64_t sub_1E248()
{
  return static Color.primary.getter();
}

uint64_t sub_1E258()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_1E268()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_1E278()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1E288()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1E298()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1E2A8()
{
  return State.projectedValue.getter();
}

uint64_t sub_1E2B8()
{
  return Button.init(action:label:)();
}

uint64_t sub_1E2C8()
{
  return type metadata accessor for Button();
}

uint64_t sub_1E2D8()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_1E2E8()
{
  return Divider.init()();
}

uint64_t sub_1E2F8()
{
  return type metadata accessor for Divider();
}

uint64_t sub_1E308()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1E318()
{
  return static Alignment.center.getter();
}

uint64_t sub_1E328()
{
  return SecureCodable.wrappedValue.getter();
}

uint64_t sub_1E338()
{
  return ConfirmationView.ControlMetadata.type.getter();
}

uint64_t sub_1E348()
{
  return ConfirmationView.ControlMetadata.identity.getter();
}

uint64_t sub_1E358()
{
  return type metadata accessor for ConfirmationView.ControlMetadata();
}

uint64_t sub_1E368()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1E378()
{
  return DisplayRepresentation.Symbol.name.getter();
}

uint64_t sub_1E388()
{
  return DisplayRepresentation.Symbol.tintColor.getter();
}

uint64_t sub_1E398()
{
  return type metadata accessor for DisplayRepresentation.Symbol();
}

uint64_t sub_1E3A8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1E3B8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1E3C8()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1E3D8()
{
  return static DispatchTime.now()();
}

uint64_t sub_1E3E8()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1E3F8()
{
  return + infix(_:_:)();
}

uint64_t sub_1E408()
{
  return type metadata accessor for ButtonItemButtonStyle.Role();
}

uint64_t sub_1E418()
{
  return PluginView.init(snippetModel:bundleName:mode:context:)();
}

uint64_t sub_1E428()
{
  return type metadata accessor for PluginView();
}

uint64_t sub_1E448()
{
  return type metadata accessor for ControlView();
}

uint64_t sub_1E458()
{
  return type metadata accessor for RFImageView();
}

uint64_t sub_1E468()
{
  return RFImageView.init(_:)();
}

uint64_t sub_1E478()
{
  return static ComponentType.button.getter();
}

uint64_t sub_1E488()
{
  return type metadata accessor for ComponentType();
}

uint64_t sub_1E498()
{
  return type metadata accessor for RFButtonStyle();
}

uint64_t sub_1E4A8()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_1E4B8()
{
  return type metadata accessor for InteractionType();
}

uint64_t sub_1E4C8()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t sub_1E4D8()
{
  return SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
}

uint64_t sub_1E4E8()
{
  return type metadata accessor for SimpleItemRichView();
}

uint64_t sub_1E4F8()
{
  return InteractionDelegate.wrappedValue.getter();
}

uint64_t sub_1E508()
{
  return InteractionDelegate.init()();
}

uint64_t sub_1E518()
{
  return type metadata accessor for InteractionDelegate();
}

uint64_t sub_1E528()
{
  return RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)();
}

uint64_t sub_1E538()
{
  return type metadata accessor for RFInteractionPerformed();
}

uint64_t sub_1E548()
{
  return InteractionDelegateWrapper.submit(messagePayload:)();
}

uint64_t sub_1E558()
{
  return InteractionDelegateWrapper.perform(aceCommand:)();
}

uint64_t sub_1E568()
{
  return InteractionDelegateWrapper.perform(directInvocation:)();
}

uint64_t sub_1E578()
{
  return type metadata accessor for InteractionDelegateWrapper();
}

uint64_t sub_1E588()
{
  return dispatch thunk of Context.emit(_:)();
}

uint64_t sub_1E598()
{
  return type metadata accessor for Context();
}

NSDictionary sub_1E5A8()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_1E5B8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1E5C8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1E5D8()
{
  return String.init(localized:)();
}

uint64_t sub_1E5E8()
{
  return String.hash(into:)();
}

void sub_1E5F8(Swift::String a1)
{
}

Swift::Int sub_1E608()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1E618()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1E628()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1E638()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1E648()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1E658()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1E668()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1E678()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1E688()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_1E698()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1E6A8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1E6B8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1E6C8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1E6D8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_1E6E8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1E6F8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1E708()
{
  return AnyHashable.init<A>(_:)();
}

void sub_1E718(Swift::Int a1)
{
}

uint64_t sub_1E728()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_1E738(Swift::Int a1)
{
}

uint64_t sub_1E748()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1E758()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_1E768()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_1E778()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1E788()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1E798()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1E7A8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1E7B8()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_1E7C8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1E7D8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1E7E8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1E7F8()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1E808()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_1E818()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1E828()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1E838()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1E848()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1E858()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1E868()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_1E878()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1E888()
{
  return Hasher.init(_seed:)();
}

void sub_1E898(Swift::UInt a1)
{
}

Swift::Int sub_1E8A8()
{
  return Hasher._finalize()();
}

uint64_t sub_1E8B8()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1E8C8()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}