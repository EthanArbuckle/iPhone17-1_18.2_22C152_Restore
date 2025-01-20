uint64_t sub_25CEFCAE8@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  char v20;
  int v21;
  double v22;
  id v23;
  char v24;
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t *v31;
  uint64_t result;
  _OWORD v34[2];
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED68);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v4 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED70);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED78);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED80);
  OUTLINED_FUNCTION_0();
  v14 = v13;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v17 = v16 - v15;
  sub_25CEFCDFC();
  v18 = *(void **)(v1 + 32);
  if (v18)
  {
    v19 = v18;
    v20 = sub_25CF43C88();

    v21 = v20 & 1;
    if (v21) {
      v22 = 0.0;
    }
    else {
      v22 = 150.0;
    }
    sub_25CF43AB8();
    sub_25CEFCE9C(0.0, 1, 0.0, 1, 0.0, 1, v22, v21, v7, 0.0, 1, 0.0, 1);
    sub_25CEFDA54(v4, &qword_26A62ED68);
    v23 = v19;
    v24 = sub_25CF43C88();

    if ((v24 & 1) != 0 && (v25 = v23, sub_25CF43C98(), v27 = v26, v25, v27 > 1.0)) {
      v28 = sub_25CF436A8();
    }
    else {
      v28 = sub_25CF43698();
    }
    v29 = v28;
    KeyPath = swift_getKeyPath();
    sub_25CEFDAA8(v7, v11, &qword_26A62ED70);
    v31 = (uint64_t *)(v11 + *(int *)(v8 + 36));
    *v31 = KeyPath;
    v31[1] = v29;
    sub_25CEFDA54(v7, &qword_26A62ED70);
    sub_25CEFD814();
    memset(v34, 0, sizeof(v34));
    v35 = 0;
    sub_25CF43828();
    sub_25CEFDA54((uint64_t)v34, &qword_26A62EDC0);
    sub_25CEFDA54(v11, &qword_26A62ED78);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(a1, v17, v12);
  }
  else
  {
    sub_25CF43D18();
    sub_25CEFD0A0();
    result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CEFCDFC()
{
  return sub_25CF43AF8();
}

void *sub_25CEFCE9C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_25CF43E48();
    v23 = (void *)sub_25CF435E8();
    sub_25CF43028();
  }
  sub_25CF43248();
  sub_25CEFDAA8(v13, a9, &qword_26A62ED68);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED70);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t sub_25CEFD044()
{
  return sub_25CF43888();
}

uint64_t sub_25CEFD060@<X0>(uint64_t a1@<X8>)
{
  return sub_25CEFCAE8(a1);
}

unint64_t sub_25CEFD0A0()
{
  unint64_t result = qword_26A62FA10;
  if (!qword_26A62FA10)
  {
    sub_25CF43D18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FA10);
  }
  return result;
}

uint64_t variable initialization expression of MessageDetailView._isDeleted()
{
  return 0;
}

uint64_t sub_25CEFD104()
{
  return sub_25CF432C8();
}

uint64_t sub_25CEFD128(uint64_t a1)
{
  sub_25CF43138();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3 - v2, a1);
  return sub_25CF432D8();
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

uint64_t _s10SiriMailUI23DisambiguateHandlesViewV8_context33_02655CCF3E182CF00522AF51F5675876LL05SwiftC017EnvironmentObjectVy07SnippetC07ContextCGvpfi_0()
{
  sub_25CF43D18();
  sub_25CEFD0A0();
  return sub_25CF432A8();
}

uint64_t _s10SiriMailUI17MessageDetailViewV12_colorScheme33_BC78ACDBAA0B7BF762AE967D9842D200LL05SwiftC011EnvironmentVyAF05ColorH0OGvpfi_0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  return swift_storeEnumTagMultiPayload();
}

uint64_t variable initialization expression of SiriMailModel._attachments()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of SiriMailModel._to()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of SiriMailModel._cc()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of SiriMailModel._bcc()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of SiriMailModel._focusedField@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25CF42DF8();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t variable initialization expression of SiriMailModel._state@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F70738];
  sub_25CF42E08();
  OUTLINED_FUNCTION_2();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104);
  return v5(a1, v2, v3);
}

uint64_t variable initialization expression of SiriMailModel.snippetService()
{
  return sub_25CF42F78();
}

uint64_t variable initialization expression of SiriMailModel.subscription()
{
  return 0;
}

void type metadata accessor for VRXMode(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for BodyTextEditor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BodyTextEditor(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BodyTextEditor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BodyTextEditor(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  id v6 = v5;

  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
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

uint64_t assignWithTake for BodyTextEditor(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BodyTextEditor(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for BodyTextEditor(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BodyTextEditor()
{
  return &type metadata for BodyTextEditor;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25CEFD74C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25CEFD76C(uint64_t result, int a2, int a3)
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

void sub_25CEFD7A8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25CEFD7F0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25CEFD814()
{
  unint64_t result = qword_26A62ED88;
  if (!qword_26A62ED88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62ED78);
    sub_25CEFD8FC();
    sub_25CEFDA10(&qword_26A62EDB0, &qword_26A62EDB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62ED88);
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

unint64_t sub_25CEFD8FC()
{
  unint64_t result = qword_26A62ED90;
  if (!qword_26A62ED90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62ED70);
    sub_25CEFD978();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62ED90);
  }
  return result;
}

unint64_t sub_25CEFD978()
{
  unint64_t result = qword_26A62ED98;
  if (!qword_26A62ED98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62ED68);
    sub_25CEFDA10(&qword_26A62EDA0, &qword_26A62EDA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62ED98);
  }
  return result;
}

uint64_t sub_25CEFDA10(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25CEFDA54(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25CEFDAA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_25CEFDB04()
{
  unint64_t result = qword_26A62EDD0;
  if (!qword_26A62EDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EDD0);
  }
  return result;
}

uint64_t sub_25CEFDB50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return 0;
}

void sub_25CEFDBF4(void *a1)
{
  objc_msgSend(v1, sel_setBaseFont_, a1);
  id v2 = objc_msgSend(v1, sel_labelView);
  objc_msgSend(v2, sel_setFont_, a1);
}

id sub_25CEFDC74()
{
  v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33420]), sel_init);
  sub_25CEFDFAC();
  uint64_t v3 = (void *)sub_25CF43E98();
  objc_msgSend(v2, sel_setLabelLeadingPadding_, v3);

  uint64_t v4 = (void *)sub_25CF43E98();
  objc_msgSend(v2, sel_setTrailingButtonMidlineInsetFromLayoutMargin_, v4);

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ComposeRecipientTextView();
  id result = objc_msgSendSuper2(&v7, sel_initWithOptions_, v2);
  if (result)
  {
    id v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25CEFDD68(double a1, double a2, double a3, double a4)
{
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ComposeRecipientTextView();
  id v9 = objc_msgSendSuper2(&v12, sel_initWithFrame_, a1, a2, a3, a4);
  id v10 = objc_msgSend(v9, sel_labelView);
  objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);

  id v11 = objc_msgSend(v9, sel_textView);
  if (v11)
  {
    objc_msgSend(v11, sel_setAdjustsFontForContentSizeCategory_, 1);
  }
  else
  {
    __break(1u);
  }
}

void sub_25CEFDE74()
{
}

void sub_25CEFDEC8()
{
}

void sub_25CEFDF10()
{
}

id sub_25CEFDF54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComposeRecipientTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComposeRecipientTextView()
{
  return self;
}

unint64_t sub_25CEFDFAC()
{
  unint64_t result = qword_26A62EDD8;
  if (!qword_26A62EDD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A62EDD8);
  }
  return result;
}

void sub_25CEFDFEC()
{
  qword_26A633170 = 0xC028000000000000;
}

void sub_25CEFDFFC()
{
  qword_26A633178 = 0xC024000000000000;
}

uint64_t DisambiguateHandlesDataModel.init(contact:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25CF42C68();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v8 = sub_25CF42C58();
  uint64_t v9 = sub_25CEFE0D4(v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t result = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(void *)(a2 + *(int *)(result + 20)) = v9;
  return result;
}

uint64_t sub_25CEFE0D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IndexedHandle(0);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (void *)((char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EE90);
  uint64_t v5 = MEMORY[0x270FA5388](v37);
  v39 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v36 = (void *)((char *)v28 - v8);
  MEMORY[0x270FA5388](v7);
  v35 = (void *)((char *)v28 - v9);
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_25CF267F4();
  uint64_t v10 = v42;
  uint64_t v11 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v38 = v11;
  v28[1] = a1;
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v31 = sub_25CF42C28();
    uint64_t v13 = *(void *)(v31 - 8);
    v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v32 = v13 + 16;
    v33 = v14;
    v15 = (char *)(a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)));
    uint64_t v16 = *(void *)(v13 + 72);
    v29 = (void (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v30 = v16;
    v34 = v4;
    uint64_t v17 = v37;
    uint64_t v18 = v31;
    do
    {
      v19 = &v39[*(int *)(v17 + 48)];
      v20 = v33;
      v33(v19, v15, v18);
      v21 = v36;
      v22 = (char *)v36 + *(int *)(v17 + 48);
      void *v36 = v12;
      (*v29)(v22, v19, v18);
      uint64_t v23 = (uint64_t)v21;
      uint64_t v24 = v35;
      sub_25CF00104(v23, (uint64_t)v35);
      uint64_t v25 = *v24;
      v20((char *)v4 + *(int *)(v41 + 20), (char *)v24 + *(int *)(v17 + 48), v18);
      *uint64_t v4 = v25;
      sub_25CF0016C((uint64_t)v24);
      uint64_t v10 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25CF267F4();
        uint64_t v10 = v42;
      }
      unint64_t v26 = *(void *)(v10 + 16);
      if (v26 >= *(void *)(v10 + 24) >> 1)
      {
        sub_25CF267F4();
        uint64_t v10 = v42;
      }
      ++v12;
      *(void *)(v10 + 16) = v26 + 1;
      uint64_t v4 = v34;
      sub_25CF000A0((uint64_t)v34, v10+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v26);
      v15 += v30;
    }
    while (v38 != v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t type metadata accessor for DisambiguateHandlesDataModel(uint64_t a1)
{
  return sub_25CEFE8D8(a1, (uint64_t *)&unk_26A62EE30);
}

uint64_t sub_25CEFE434(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_25CF44148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4864657865646E69 && a2 == 0xEE0073656C646E61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25CF44148();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25CEFE548(char a1)
{
  if (a1) {
    return 0x4864657865646E69;
  }
  else {
    return 0x746361746E6F63;
  }
}

uint64_t sub_25CEFE590()
{
  return sub_25CEFE548(*v0);
}

uint64_t sub_25CEFE598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CEFE434(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CEFE5C0(uint64_t a1)
{
  unint64_t v2 = sub_25CEFE824();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CEFE5FC(uint64_t a1)
{
  unint64_t v2 = sub_25CEFE824();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DisambiguateHandlesDataModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EDE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CEFE824();
  OUTLINED_FUNCTION_7();
  sub_25CF42C68();
  sub_25CEFE870(&qword_26A62EDF0, MEMORY[0x263F6D458]);
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    type metadata accessor for DisambiguateHandlesDataModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EDF8);
    sub_25CEFEC6C(&qword_26A62EE00, &qword_26A62EE08);
    OUTLINED_FUNCTION_6();
  }
  uint64_t v4 = OUTLINED_FUNCTION_3_0();
  return v5(v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25CEFE824()
{
  unint64_t result = qword_26A62EDE8;
  if (!qword_26A62EDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EDE8);
  }
  return result;
}

uint64_t sub_25CEFE870(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for IndexedHandle(uint64_t a1)
{
  return sub_25CEFE8D8(a1, (uint64_t *)&unk_26A62EE40);
}

uint64_t sub_25CEFE8D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DisambiguateHandlesDataModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v27 = sub_25CF42C68();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v4;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EE10);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v8;
  uint64_t v26 = v9;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  uint64_t v10 = type metadata accessor for DisambiguateHandlesDataModel(0);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v13 = v12 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CEFE824();
  sub_25CF44198();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v22 = v10;
  uint64_t v14 = v24;
  char v30 = 0;
  sub_25CEFE870(&qword_26A62EE18, MEMORY[0x263F6D458]);
  uint64_t v15 = v27;
  sub_25CF44088();
  uint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  uint64_t v21 = v13;
  v16(v13, v7, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EDF8);
  char v29 = 1;
  sub_25CEFEC6C(&qword_26A62EE20, &qword_26A62EE28);
  sub_25CF44088();
  uint64_t v17 = OUTLINED_FUNCTION_2_0();
  v18(v17);
  uint64_t v19 = v21;
  *(void *)(v21 + *(int *)(v22 + 20)) = v28;
  sub_25CEFED00(v19, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25CEFED64(v19);
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

uint64_t sub_25CEFEC6C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62EDF8);
    sub_25CEFE870(a2, (void (*)(uint64_t))type metadata accessor for IndexedHandle);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25CEFED00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DisambiguateHandlesDataModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CEFED64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DisambiguateHandlesDataModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CEFEDC0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DisambiguateHandlesDataModel.init(from:)(a1, a2);
}

uint64_t sub_25CEFEDD8(void *a1)
{
  return DisambiguateHandlesDataModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguateHandlesDataModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25CF42C68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DisambiguateHandlesDataModel(uint64_t a1)
{
  uint64_t v2 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CEFF154);
}

uint64_t sub_25CEFF154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25CF42C68();
  OUTLINED_FUNCTION_1_0();
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CEFF21C);
}

void sub_25CEFF21C(uint64_t a1, int a2, int a3, uint64_t a4)
{
  sub_25CF42C68();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_8();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t sub_25CEFF298()
{
  uint64_t result = sub_25CF42C68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25CEFF330(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_25CF42C28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_25CEFF3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25CF42C28();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *sub_25CEFF464(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_25CEFF4E0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *sub_25CEFF55C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25CEFF5D8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_25CEFF654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CEFF668);
}

uint64_t sub_25CEFF668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_25CF42C28();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t sub_25CEFF6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CEFF6C8);
}

uint64_t sub_25CEFF6C8()
{
  sub_25CF42C28();
  uint64_t v0 = OUTLINED_FUNCTION_8();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_25CEFF70C()
{
  uint64_t result = sub_25CF42C28();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateHandlesDataModel.CodingKeys()
{
  return &type metadata for DisambiguateHandlesDataModel.CodingKeys;
}

unint64_t sub_25CEFF7D4()
{
  unint64_t result = qword_26A62EE50;
  if (!qword_26A62EE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EE50);
  }
  return result;
}

uint64_t sub_25CEFF820()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25CEFF82C()
{
  return sub_25CF42C18();
}

BOOL sub_25CEFF85C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25CEFF86C()
{
  return sub_25CF44178();
}

uint64_t sub_25CEFF894(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v2 || (sub_25CF44148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C646E6168 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25CF44148();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25CEFF974()
{
  return 2;
}

uint64_t sub_25CEFF97C()
{
  return sub_25CF44188();
}

uint64_t sub_25CEFF9C4()
{
  return 0;
}

uint64_t sub_25CEFF9D0(char a1)
{
  if (a1) {
    return 0x656C646E6168;
  }
  else {
    return 0x7865646E69;
  }
}

uint64_t sub_25CEFFA00(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EE68);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF00054();
  OUTLINED_FUNCTION_7();
  sub_25CF440F8();
  if (!v1)
  {
    type metadata accessor for IndexedHandle(0);
    sub_25CF42C28();
    sub_25CEFE870(&qword_26A62EE78, MEMORY[0x263F6D358]);
    sub_25CF44108();
  }
  uint64_t v4 = OUTLINED_FUNCTION_3_0();
  return v5(v4);
}

uint64_t sub_25CEFFB70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = sub_25CF42C28();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EE80);
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for IndexedHandle(0);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = (uint64_t *)(v14 - v13);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF00054();
  sub_25CF44198();
  if (!v2)
  {
    uint64_t *v15 = sub_25CF44078();
    sub_25CEFE870(&qword_26A62EE88, MEMORY[0x263F6D358]);
    sub_25CF44088();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v11, v21);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))((char *)v15 + *(int *)(v12 + 20), v3, v20);
    sub_25CF000A0((uint64_t)v15, a2);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

BOOL sub_25CEFFDF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25CEFF85C(*a1, *a2);
}

uint64_t sub_25CEFFE04()
{
  return sub_25CEFF97C();
}

uint64_t sub_25CEFFE20()
{
  return sub_25CEFF86C();
}

uint64_t sub_25CEFFE28()
{
  return sub_25CF44188();
}

uint64_t sub_25CEFFE6C()
{
  return sub_25CEFF9D0(*v0);
}

uint64_t sub_25CEFFE74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CEFF894(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CEFFE9C()
{
  return sub_25CEFF9C4();
}

uint64_t sub_25CEFFEBC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CEFF974();
  *a1 = result;
  return result;
}

uint64_t sub_25CEFFEE4(uint64_t a1)
{
  unint64_t v2 = sub_25CF00054();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CEFFF20(uint64_t a1)
{
  unint64_t v2 = sub_25CF00054();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CEFFF5C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25CEFFB70(a1, a2);
}

uint64_t sub_25CEFFF74(void *a1)
{
  return sub_25CEFFA00(a1);
}

uint64_t sub_25CEFFF8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25CEFF82C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25CEFFFB8()
{
  unint64_t result = qword_26A62EE58;
  if (!qword_26A62EE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EE58);
  }
  return result;
}

unint64_t sub_25CF00008()
{
  unint64_t result = qword_26A62EE60;
  if (!qword_26A62EE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EE60);
  }
  return result;
}

unint64_t sub_25CF00054()
{
  unint64_t result = qword_26A62EE70;
  if (!qword_26A62EE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EE70);
  }
  return result;
}

uint64_t sub_25CF000A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IndexedHandle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF00104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EE90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF0016C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EE90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s10SiriMailUI28DisambiguateHandlesDataModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s10SiriMailUI28DisambiguateHandlesDataModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF00320);
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

uint64_t sub_25CF00348(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25CF00350(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IndexedHandle.CodingKeys()
{
  return &type metadata for IndexedHandle.CodingKeys;
}

unint64_t sub_25CF00370()
{
  unint64_t result = qword_26A62EE98;
  if (!qword_26A62EE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EE98);
  }
  return result;
}

unint64_t sub_25CF003C0()
{
  unint64_t result = qword_26A62EEA0;
  if (!qword_26A62EEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EEA0);
  }
  return result;
}

unint64_t sub_25CF00410()
{
  unint64_t result = qword_26A62EEA8;
  if (!qword_26A62EEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EEA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_25CF44108();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_25CF441A8();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t DisambiguateHandlesView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for DisambiguateHandlesView() + 20));
  sub_25CF43D18();
  sub_25CF01FE0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  *unsigned int v4 = sub_25CF432A8();
  v4[1] = v5;
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25CF43058();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.siriMail);
  BOOL v7 = sub_25CF43038();
  os_log_type_t v8 = sub_25CF43E28();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25CEFA000, v7, v8, "Constructing DisambiguateHandlesView", v9, 2u);
    MEMORY[0x2611A3230](v9, -1, -1);
  }

  return sub_25CF02200(a1, a2, (void (*)(void))type metadata accessor for DisambiguateHandlesDataModel);
}

uint64_t type metadata accessor for DisambiguateHandlesView()
{
  uint64_t result = qword_26A62EEC0;
  if (!qword_26A62EEC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DisambiguateHandlesView.body.getter()
{
  uint64_t v1 = type metadata accessor for DisambiguateHandlesView();
  uint64_t v2 = OUTLINED_FUNCTION_2_1(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_25CF02028(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for DisambiguateHandlesView);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_25CF02200((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, (void (*)(void))type metadata accessor for DisambiguateHandlesView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EEB0);
  sub_25CEFDA10(&qword_26A62EEB8, &qword_26A62EEB0);
  return sub_25CF43B68();
}

uint64_t sub_25CF00824@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v49 = a2;
  uint64_t v3 = type metadata accessor for DisambiguateHandlesView();
  uint64_t v45 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v45 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EEE0);
  uint64_t v54 = *(void *)(v48 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v48);
  v52 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v53 = (char *)&v40 - v7;
  uint64_t v8 = sub_25CF42B98();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v47 = sub_25CF43C38();
  uint64_t v50 = *(void *)(v47 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v47);
  v51 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v46 = sub_25CF43B98();
  uint64_t v44 = *(void *)(v46 - 8);
  uint64_t v13 = v44;
  uint64_t v14 = MEMORY[0x270FA5388](v46);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v40 - v17;
  v43 = (char *)&v40 - v17;
  sub_25CF43BA8();
  uint64_t v19 = sub_25CF42C38();
  uint64_t v67 = MEMORY[0x263F8D310];
  uint64_t v68 = MEMORY[0x263F77998];
  uint64_t v65 = v19;
  uint64_t v66 = v20;
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v58 = 0;
  long long v57 = 0u;
  long long v56 = 0u;
  sub_25CF42C48();
  sub_25CF42B88();
  swift_bridgeObjectRelease();
  v55[3] = sub_25CF43B48();
  v55[4] = MEMORY[0x263F77548];
  __swift_allocate_boxed_opaque_existential_1(v55);
  sub_25CF43B58();
  uint64_t v41 = v12;
  sub_25CF43C28();
  *(void *)&long long v62 = *(void *)(a1 + *(int *)(type metadata accessor for DisambiguateHandlesDataModel(0) + 20));
  sub_25CF02028(a1, (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for DisambiguateHandlesView);
  unint64_t v21 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  uint64_t v22 = swift_allocObject();
  sub_25CF02200((uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, (void (*)(void))type metadata accessor for DisambiguateHandlesView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EDF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EEE8);
  sub_25CEFDA10(&qword_26A62EEF0, &qword_26A62EDF8);
  uint64_t v23 = sub_25CF43C58();
  uint64_t v24 = sub_25CF01FE0(&qword_26A62EEF8, MEMORY[0x263F77850]);
  uint64_t v65 = v23;
  uint64_t v66 = v24;
  swift_getOpaqueTypeConformance2();
  sub_25CF01FE0(&qword_26A62EF00, (void (*)(uint64_t))type metadata accessor for IndexedHandle);
  uint64_t v25 = v53;
  sub_25CF43A98();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v42 = v16;
  uint64_t v27 = v46;
  v26(v16, v18, v46);
  uint64_t v45 = *(void *)(v50 + 16);
  uint64_t v28 = v51;
  uint64_t v29 = v47;
  ((void (*)(char *, char *, uint64_t))v45)(v51, v12, v47);
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  char v30 = v25;
  uint64_t v31 = v48;
  v40(v52, v30, v48);
  uint64_t v32 = v49;
  v26(v49, v16, v27);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF08);
  ((void (*)(char *, char *, uint64_t))v45)(&v32[*(int *)(v33 + 48)], v28, v29);
  v34 = &v32[*(int *)(v33 + 64)];
  v35 = v52;
  v40(v34, v52, v31);
  v36 = *(void (**)(char *, uint64_t))(v54 + 8);
  v36(v53, v31);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v50 + 8);
  v37(v41, v29);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v44 + 8);
  v38(v43, v27);
  v36(v35, v31);
  v37(v51, v29);
  return ((uint64_t (*)(char *, uint64_t))v38)(v42, v27);
}

uint64_t sub_25CF00FB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v25 = a1;
  uint64_t v31 = a3;
  uint64_t v3 = type metadata accessor for IndexedHandle(0);
  uint64_t v28 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v28 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = type metadata accessor for DisambiguateHandlesView();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v26 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = sub_25CF43C58();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25CF42C18();
  uint64_t v50 = MEMORY[0x263F8D310];
  uint64_t v51 = MEMORY[0x263F77998];
  uint64_t v48 = v11;
  uint64_t v49 = v12;
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  sub_25CF42C08();
  uint64_t v13 = self;
  uint64_t v14 = (void *)sub_25CF43D68();
  id v15 = objc_msgSend(v13, sel_localizedStringForLabel_, v14);

  uint64_t v16 = sub_25CF43D88();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();

  uint64_t v43 = MEMORY[0x263F8D310];
  uint64_t v44 = MEMORY[0x263F77998];
  uint64_t v41 = v16;
  uint64_t v42 = v18;
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  sub_25CF43C48();
  sub_25CF02028(v27, (uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for DisambiguateHandlesView);
  sub_25CF02028(v25, (uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for IndexedHandle);
  unint64_t v19 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v20 = (v6 + *(unsigned __int8 *)(v28 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v21 = swift_allocObject();
  sub_25CF02200((uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v19, (void (*)(void))type metadata accessor for DisambiguateHandlesView);
  sub_25CF02200((uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, (void (*)(void))type metadata accessor for IndexedHandle);
  sub_25CF01FE0(&qword_26A62EEF8, MEMORY[0x263F77850]);
  uint64_t v22 = v29;
  sub_25CF43848();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v10, v22);
}

void sub_25CF013A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for IndexedHandle(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  sub_25CF01624();
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25CF43058();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  sub_25CF02028(a2, (uint64_t)v8, (void (*)(void))type metadata accessor for IndexedHandle);
  sub_25CF02028(a2, (uint64_t)v6, (void (*)(void))type metadata accessor for IndexedHandle);
  uint64_t v10 = sub_25CF43038();
  os_log_type_t v11 = sub_25CF43E28();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = sub_25CF42C18();
    uint64_t v17 = sub_25CF34D98(v14, v15, &v18);
    sub_25CF43EB8();
    swift_bridgeObjectRelease();
    sub_25CF022E8((uint64_t)v8);
    *(_WORD *)(v12 + 12) = 2048;
    uint64_t v16 = *v6;
    sub_25CF022E8((uint64_t)v6);
    uint64_t v17 = v16;
    sub_25CF43EB8();
    _os_log_impl(&dword_25CEFA000, v10, v11, "Tapped contact handle: %s at index=%ld", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611A3230](v13, -1, -1);
    MEMORY[0x2611A3230](v12, -1, -1);
  }
  else
  {
    sub_25CF022E8((uint64_t)v6);
    sub_25CF022E8((uint64_t)v8);
  }
}

uint64_t sub_25CF01624()
{
  uint64_t v1 = (void *)sub_25CF42BA8();
  uint64_t v2 = *(void **)(v0 + *(int *)(type metadata accessor for DisambiguateHandlesView() + 20));
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v1, sel_identifier);
    sub_25CF43D88();

    if (!sub_25CF057A0(v1)) {
      sub_25CF43D38();
    }
    sub_25CF43D08();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF01FE0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
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

uint64_t sub_25CF017AC@<X0>(char *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DisambiguateHandlesView();
  OUTLINED_FUNCTION_0_0(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25CF00824(v5, a1);
}

uint64_t sub_25CF017FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguateHandlesView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25CF42C68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for DisambiguateHandlesDataModel(0);
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    os_log_type_t v11 = (char *)a2 + v9;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    swift_bridgeObjectRetain();
    id v14 = v13;
  }
  return a1;
}

void destroy for DisambiguateHandlesView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  type metadata accessor for DisambiguateHandlesDataModel(0);
  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = a2 + v8;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  id v13 = v12;
  return a1;
}

uint64_t assignWithCopy for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void **)(a1 + v8);
  uint64_t v12 = *(void **)v10;
  *uint64_t v9 = *(void *)v10;
  id v13 = v12;

  v9[1] = *(void *)(v10 + 8);
  return a1;
}

uint64_t initializeWithTake for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = *(void **)(a1 + v8);
  *uint64_t v9 = *v10;

  v9[1] = v10[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF01C40);
}

uint64_t sub_25CF01C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for DisambiguateHandlesDataModel(0);
  OUTLINED_FUNCTION_1_0();
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
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF01CEC);
}

void sub_25CF01CEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for DisambiguateHandlesDataModel(0);
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

uint64_t sub_25CF01D74()
{
  uint64_t result = type metadata accessor for DisambiguateHandlesDataModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25CF01E08()
{
  return sub_25CEFDA10(&qword_26A62EED0, &qword_26A62EED8);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t objectdestroyTm()
{
  type metadata accessor for DisambiguateHandlesView();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v1 + v7;
  sub_25CF42C68();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v11 + 8))(v10);
  type metadata accessor for DisambiguateHandlesDataModel(0);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, v8, v9);
}

uint64_t sub_25CF01F80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for DisambiguateHandlesView();
  OUTLINED_FUNCTION_0_0(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_25CF00FB8(a1, v7, a2);
}

uint64_t sub_25CF01FE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF02028(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25CF02088()
{
  type metadata accessor for DisambiguateHandlesView();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = (int *)(type metadata accessor for IndexedHandle(0) - 8);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)v7 + 80);
  uint64_t v9 = (v4 + v6 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(*(void *)v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  uint64_t v12 = v1 + v4;
  sub_25CF42C68();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v13 + 8))(v12);
  type metadata accessor for DisambiguateHandlesDataModel(0);
  swift_bridgeObjectRelease();

  uint64_t v14 = v1 + v7[7] + v9;
  sub_25CF42C28();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v15 + 8))(v14);
  return MEMORY[0x270FA0238](v1, v10, v11);
}

uint64_t sub_25CF02200(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

void sub_25CF02260()
{
  uint64_t v1 = type metadata accessor for DisambiguateHandlesView();
  OUTLINED_FUNCTION_2_1(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for IndexedHandle(0);
  OUTLINED_FUNCTION_0_0(v6);
  uint64_t v8 = v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  sub_25CF013A8(v0 + v3, v8);
}

uint64_t sub_25CF022E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IndexedHandle(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_25CF0238C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IndexedContact();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (void *)((char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF90);
  uint64_t v5 = MEMORY[0x270FA5388](v37);
  long long v39 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v36 = (void *)((char *)v28 - v8);
  MEMORY[0x270FA5388](v7);
  long long v35 = (void *)((char *)v28 - v9);
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_25CF26844();
  uint64_t v10 = v42;
  uint64_t v11 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v38 = v11;
  v28[1] = a1;
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v31 = sub_25CF42C68();
    uint64_t v13 = *(void *)(v31 - 8);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v32 = v13 + 16;
    long long v33 = v14;
    uint64_t v15 = (char *)(a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)));
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v30 = v16;
    uint64_t v34 = v4;
    uint64_t v17 = v37;
    uint64_t v18 = v31;
    do
    {
      unint64_t v19 = &v39[*(int *)(v17 + 48)];
      unint64_t v20 = v33;
      v33(v19, v15, v18);
      uint64_t v21 = v36;
      uint64_t v22 = (char *)v36 + *(int *)(v17 + 48);
      void *v36 = v12;
      (*v29)(v22, v19, v18);
      uint64_t v23 = (uint64_t)v21;
      uint64_t v24 = v35;
      sub_25CF03CD0(v23, (uint64_t)v35);
      uint64_t v25 = *v24;
      v20((char *)v4 + *(int *)(v41 + 20), (char *)v24 + *(int *)(v17 + 48), v18);
      *uint64_t v4 = v25;
      sub_25CF03D38((uint64_t)v24);
      uint64_t v10 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25CF26844();
        uint64_t v10 = v42;
      }
      unint64_t v26 = *(void *)(v10 + 16);
      if (v26 >= *(void *)(v10 + 24) >> 1)
      {
        sub_25CF26844();
        uint64_t v10 = v42;
      }
      ++v12;
      *(void *)(v10 + 16) = v26 + 1;
      uint64_t v4 = v34;
      sub_25CF03C6C((uint64_t)v34, v10+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v26);
      v15 += v30;
    }
    while (v38 != v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

SiriMailUI::DisambiguateRecipientsDataModel __swiftcall DisambiguateRecipientsDataModel.init(candidates:contactPickerButtonLabel:)(Swift::OpaquePointer candidates, Swift::String contactPickerButtonLabel)
{
  object = contactPickerButtonLabel._object;
  uint64_t countAndFlagsBits = contactPickerButtonLabel._countAndFlagsBits;
  uint64_t v4 = sub_25CF0238C((uint64_t)candidates._rawValue);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)v4;
  uint64_t v6 = countAndFlagsBits;
  uint64_t v7 = object;
  result.contactPickerButtonLabel._object = v7;
  result.contactPickerButtonLabel._uint64_t countAndFlagsBits = v6;
  result.candidates._rawValue = v5;
  return result;
}

uint64_t sub_25CF02728(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365;
  if (v2 || (sub_25CF44148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025CF4E940)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25CF44148();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25CF02824(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0x74616469646E6163;
  }
}

uint64_t sub_25CF02864()
{
  return sub_25CF02824(*v0);
}

uint64_t sub_25CF0286C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF02728(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF02894(uint64_t a1)
{
  unint64_t v2 = sub_25CF02AA0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF028D0(uint64_t a1)
{
  unint64_t v2 = sub_25CF02AA0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DisambiguateRecipientsDataModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF10);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF02AA0();
  sub_25CF441A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF20);
  sub_25CF02D34(&qword_26A62EF28, &qword_26A62EF30);
  sub_25CF44108();
  if (!v1) {
    sub_25CF440D8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_25CF02AA0()
{
  unint64_t result = qword_26A62EF18;
  if (!qword_26A62EF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EF18);
  }
  return result;
}

uint64_t type metadata accessor for IndexedContact()
{
  uint64_t result = qword_26A62EF50;
  if (!qword_26A62EF50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DisambiguateRecipientsDataModel.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF38);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2_2();
  uint64_t v4 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_25CF02AA0();
  sub_25CF44198();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF20);
    sub_25CF02D34(&qword_26A62EF40, &qword_26A62EF48);
    sub_25CF44088();
    uint64_t v4 = v8;
    swift_bridgeObjectRetain();
    sub_25CF44058();
    uint64_t v6 = OUTLINED_FUNCTION_3_1();
    v7(v6);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_25CF02D34(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62EF20);
    sub_25CF03C24(a2, (void (*)(uint64_t))type metadata accessor for IndexedContact);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25CF02DC8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = DisambiguateRecipientsDataModel.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_25CF02DF8(void *a1)
{
  return DisambiguateRecipientsDataModel.encode(to:)(a1);
}

uint64_t destroy for DisambiguateRecipientsDataModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s10SiriMailUI31DisambiguateRecipientsDataModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DisambiguateRecipientsDataModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for DisambiguateRecipientsDataModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateRecipientsDataModel(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t storeEnumTagSinglePayload for DisambiguateRecipientsDataModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DisambiguateRecipientsDataModel()
{
  return &type metadata for DisambiguateRecipientsDataModel;
}

uint64_t *sub_25CF02FEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_25CF42C68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_25CF030B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25CF42C68();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *sub_25CF03120(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_25CF0319C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *sub_25CF03218(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25CF03294(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25CF42C68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_25CF03310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF03324);
}

uint64_t sub_25CF03324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_25CF42C68();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t sub_25CF03370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF03384);
}

uint64_t sub_25CF03384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_25CF42C68();
  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

uint64_t sub_25CF033D4()
{
  uint64_t result = sub_25CF42C68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateRecipientsDataModel.CodingKeys()
{
  return &type metadata for DisambiguateRecipientsDataModel.CodingKeys;
}

unint64_t sub_25CF03488()
{
  unint64_t result = qword_26A62EF60;
  if (!qword_26A62EF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EF60);
  }
  return result;
}

uint64_t sub_25CF034D4()
{
  return sub_25CF42C48();
}

uint64_t sub_25CF03504(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v2 || (sub_25CF44148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746361746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25CF44148();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25CF035EC(char a1)
{
  if (a1) {
    return 0x746361746E6F63;
  }
  else {
    return 0x7865646E69;
  }
}

uint64_t sub_25CF03620(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF78);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF03BD8();
  sub_25CF441A8();
  sub_25CF440F8();
  if (!v1)
  {
    type metadata accessor for IndexedContact();
    sub_25CF42C68();
    sub_25CF03C24(&qword_26A62EDF0, MEMORY[0x263F6D458]);
    sub_25CF44108();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25CF037A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = sub_25CF42C68();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF88);
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for IndexedContact();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF03BD8();
  sub_25CF44198();
  if (!v2)
  {
    *uint64_t v17 = sub_25CF44078();
    sub_25CF03C24(&qword_26A62EE18, MEMORY[0x263F6D458]);
    sub_25CF44088();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v13, v23);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))((char *)v17 + *(int *)(v14 + 20), v8, v22);
    sub_25CF03C6C((uint64_t)v17, a2);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25CF03A38()
{
  return sub_25CF035EC(*v0);
}

uint64_t sub_25CF03A40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF03504(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF03A68(uint64_t a1)
{
  unint64_t v2 = sub_25CF03BD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF03AA4(uint64_t a1)
{
  unint64_t v2 = sub_25CF03BD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF03AE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25CF037A8(a1, a2);
}

uint64_t sub_25CF03AF8(void *a1)
{
  return sub_25CF03620(a1);
}

uint64_t sub_25CF03B10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25CF034D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25CF03B3C()
{
  unint64_t result = qword_26A62EF68;
  if (!qword_26A62EF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EF68);
  }
  return result;
}

unint64_t sub_25CF03B8C()
{
  unint64_t result = qword_26A62EF70;
  if (!qword_26A62EF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EF70);
  }
  return result;
}

unint64_t sub_25CF03BD8()
{
  unint64_t result = qword_26A62EF80;
  if (!qword_26A62EF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EF80);
  }
  return result;
}

uint64_t sub_25CF03C24(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF03C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IndexedContact();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF03CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF03D38(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *_s10SiriMailUI31DisambiguateRecipientsDataModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF03E64);
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

ValueMetadata *type metadata accessor for IndexedContact.CodingKeys()
{
  return &type metadata for IndexedContact.CodingKeys;
}

unint64_t sub_25CF03EA0()
{
  unint64_t result = qword_26A62EF98;
  if (!qword_26A62EF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EF98);
  }
  return result;
}

unint64_t sub_25CF03EF0()
{
  unint64_t result = qword_26A62EFA0;
  if (!qword_26A62EFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EFA0);
  }
  return result;
}

unint64_t sub_25CF03F40()
{
  unint64_t result = qword_26A62EFA8;
  if (!qword_26A62EFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62EFA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

void DisambiguateRecipientView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_25CF43D18();
  sub_25CF0580C((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  uint64_t v8 = sub_25CF432A8();
  uint64_t v10 = v9;
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25CF43058();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.siriMail);
  uint64_t v12 = sub_25CF43038();
  os_log_type_t v13 = sub_25CF43E28();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_25CEFA000, v12, v13, "Constructing DisambiguateRecipientView", v14, 2u);
    MEMORY[0x2611A3230](v14, -1, -1);
  }

  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = v8;
  a4[4] = v10;
}

uint64_t DisambiguateRecipientView.body.getter()
{
  long long v1 = *(_OWORD *)(v0 + 1);
  uint64_t v7 = *v0;
  long long v5 = *(_OWORD *)(v0 + 3);
  long long v6 = v1;
  uint64_t v2 = swift_allocObject();
  long long v3 = *((_OWORD *)v0 + 1);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v0[4];
  sub_25CF05220((uint64_t)&v7);
  sub_25CF0524C((uint64_t)&v6);
  sub_25CF05278((id *)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EFB0);
  sub_25CEFDA10(&qword_26A62EFB8, &qword_26A62EFB0);
  return sub_25CF43B68();
}

uint64_t sub_25CF04200@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EFD0);
  uint64_t v3 = *(void *)(v33 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v33);
  long long v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = sub_25CF43B98();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v10 = v32;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  os_log_type_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v31 = (char *)&v28 - v14;
  sub_25CF43BA8();
  long long v16 = *(_OWORD *)(a1 + 1);
  uint64_t v38 = *a1;
  uint64_t v35 = v38;
  long long v36 = *(_OWORD *)(a1 + 3);
  long long v37 = v16;
  uint64_t v17 = swift_allocObject();
  long long v18 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v17 + 32) = v18;
  *(void *)(v17 + 48) = a1[4];
  swift_bridgeObjectRetain();
  sub_25CF05220((uint64_t)&v38);
  sub_25CF0524C((uint64_t)&v37);
  sub_25CF05278((id *)&v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EF20);
  sub_25CEFDA10(&qword_26A62EFD8, &qword_26A62EF20);
  sub_25CF0580C(&qword_26A62EFE0, (void (*)(uint64_t))type metadata accessor for IndexedContact);
  uint64_t v29 = v8;
  sub_25CF43A98();
  unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v30 = v13;
  v19(v13, v15, v9);
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v21 = v8;
  uint64_t v22 = v33;
  v20(v6, v21, v33);
  uint64_t v23 = v34;
  v19(v34, v13, v9);
  uint64_t v24 = &v23[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62EFE8) + 48)];
  v20(v24, v6, v22);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
  v25(v29, v22);
  unint64_t v26 = *(void (**)(char *, uint64_t))(v32 + 8);
  v26(v31, v9);
  v25(v6, v22);
  return ((uint64_t (*)(char *, uint64_t))v26)(v30, v9);
}

uint64_t sub_25CF045BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  long long v37 = a3;
  uint64_t v5 = type metadata accessor for IndexedContact();
  uint64_t v30 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v31 = v6;
  uint64_t v33 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25CF42B98();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_25CF43BE8();
  uint64_t v34 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EFF0);
  uint64_t v35 = *(void *)(v11 - 8);
  uint64_t v36 = v11;
  MEMORY[0x270FA5388](v11);
  os_log_type_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a1;
  uint64_t v14 = sub_25CF42C38();
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v16 = MEMORY[0x263F77998];
  uint64_t v59 = MEMORY[0x263F8D310];
  uint64_t v60 = MEMORY[0x263F77998];
  *(void *)&long long v58 = v14;
  *((void *)&v58 + 1) = v17;
  uint64_t v18 = sub_25CF04A24();
  if (v19)
  {
    *((void *)&v56 + 1) = v15;
    uint64_t v57 = v16;
    *(void *)&long long v55 = v18;
    *((void *)&v55 + 1) = v19;
  }
  else
  {
    uint64_t v57 = 0;
    long long v55 = 0u;
    long long v56 = 0u;
  }
  uint64_t v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  memset(v51, 0, 40);
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  sub_25CF42C48();
  sub_25CF42B88();
  swift_bridgeObjectRelease();
  v38[3] = sub_25CF43B48();
  v38[4] = MEMORY[0x263F77548];
  __swift_allocate_boxed_opaque_existential_1(v38);
  sub_25CF43B58();
  sub_25CF43BD8();
  uint64_t v20 = *a2;
  long long v58 = *(_OWORD *)(a2 + 1);
  v51[0] = v20;
  long long v55 = *(_OWORD *)(a2 + 3);
  uint64_t v21 = v33;
  sub_25CF05578(v32, v33);
  unint64_t v22 = (*(unsigned __int8 *)(v30 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v23 = swift_allocObject();
  long long v24 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v23 + 32) = v24;
  *(void *)(v23 + 48) = a2[4];
  sub_25CF03C6C(v21, v23 + v22);
  sub_25CF05220((uint64_t)v51);
  sub_25CF0524C((uint64_t)&v58);
  sub_25CF05278((id *)&v55);
  uint64_t v25 = sub_25CF0580C(&qword_26A62EFF8, MEMORY[0x263F77720]);
  sub_25CF43848();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v8);
  *(void *)&long long v52 = v8;
  *((void *)&v52 + 1) = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v36;
  uint64_t v27 = sub_25CF437E8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v13, v26);
  *long long v37 = v27;
  return result;
}

uint64_t sub_25CF04A24()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F000);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25CF42BE8();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_2();
  uint64_t v47 = v7;
  MEMORY[0x270FA5388](v8);
  long long v46 = (char *)&v34 - v9;
  uint64_t v10 = sub_25CF42C28();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_2();
  long long v45 = v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t result = sub_25CF42C58();
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v52 = MEMORY[0x263F8EE78];
  uint64_t v44 = *(void *)(result + 16);
  if (!v44)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    if (*(void *)(v19 + 16) == 1)
    {
      sub_25CF12148(v19, (uint64_t)v2);
      swift_release();
      if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v10) != 1)
      {
        uint64_t v33 = sub_25CF42C18();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v10);
        return v33;
      }
      sub_25CF05854((uint64_t)v2);
    }
    else
    {
      swift_release();
    }
    return 0;
  }
  uint64_t v34 = v2;
  unint64_t v20 = 0;
  uint64_t v40 = v12 + 16;
  unsigned int v39 = *MEMORY[0x263F6D320];
  uint64_t v37 = v5 + 8;
  uint64_t v38 = (void (**)(uint64_t, void, uint64_t))(v5 + 104);
  uint64_t v35 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v36 = v10;
  uint64_t v42 = v12;
  long long v43 = (void (**)(uint64_t, char *, uint64_t))(v12 + 32);
  uint64_t v41 = result;
  uint64_t v21 = v46;
  unint64_t v22 = (void (**)(uint64_t, uint64_t))(v5 + 8);
  while (v20 < *(void *)(result + 16))
  {
    unint64_t v23 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v48 = *(void *)(v12 + 72);
    unint64_t v49 = v23;
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v17, result + v23 + v48 * v20, v10);
    sub_25CF42BF8();
    uint64_t v24 = v10;
    uint64_t v25 = v47;
    (*v38)(v47, v39, v3);
    sub_25CF0580C(&qword_26A62F008, MEMORY[0x263F6D338]);
    sub_25CF43DC8();
    sub_25CF43DC8();
    uint64_t v27 = v50;
    uint64_t v26 = v51;
    uint64_t v28 = *v22;
    (*v22)(v25, v3);
    v28((uint64_t)v21, v3);
    if (v26 == v27)
    {
      uint64_t v29 = *v43;
      (*v43)((uint64_t)v45, v17, v24);
      uint64_t v30 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25CF26894();
        uint64_t v30 = v52;
      }
      unint64_t v31 = *(void *)(v30 + 16);
      if (v31 >= *(void *)(v30 + 24) >> 1)
      {
        sub_25CF26894();
        uint64_t v30 = v52;
      }
      *(void *)(v30 + 16) = v31 + 1;
      unint64_t v32 = v30 + v49 + v31 * v48;
      uint64_t v10 = v36;
      v29(v32, v45, v36);
      uint64_t v52 = v30;
    }
    else
    {
      (*v35)(v17, v24);
      uint64_t v10 = v24;
    }
    ++v20;
    uint64_t result = v41;
    uint64_t v12 = v42;
    if (v44 == v20)
    {
      uint64_t v19 = v52;
      uint64_t v2 = v34;
      goto LABEL_13;
    }
  }
  __break(1u);
  return result;
}

void sub_25CF04E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for IndexedContact();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  sub_25CF050D8();
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25CF43058();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  sub_25CF05578(a2, (uint64_t)v8);
  sub_25CF05578(a2, (uint64_t)v6);
  uint64_t v10 = sub_25CF43038();
  os_log_type_t v11 = sub_25CF43E28();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = sub_25CF42C38();
    uint64_t v17 = sub_25CF34D98(v14, v15, &v18);
    sub_25CF43EB8();
    swift_bridgeObjectRelease();
    sub_25CF05744((uint64_t)v8);
    *(_WORD *)(v12 + 12) = 2048;
    uint64_t v16 = *v6;
    sub_25CF05744((uint64_t)v6);
    uint64_t v17 = v16;
    sub_25CF43EB8();
    _os_log_impl(&dword_25CEFA000, v10, v11, "Tapped contact: %s at index=%ld", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611A3230](v13, -1, -1);
    MEMORY[0x2611A3230](v12, -1, -1);
  }
  else
  {
    sub_25CF05744((uint64_t)v6);
    sub_25CF05744((uint64_t)v8);
  }
}

uint64_t sub_25CF050D8()
{
  uint64_t v1 = sub_25CF42BA8();
  uint64_t v2 = *(void **)(v0 + 24);
  if (v2)
  {
    uint64_t v3 = (void *)v1;
    id v4 = v2;
    id v5 = objc_msgSend(v3, sel_identifier);
    sub_25CF43D88();

    if (!sub_25CF057A0(v3)) {
      sub_25CF43D38();
    }
    sub_25CF43D08();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF0580C((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CF05218@<X0>(char *a1@<X8>)
{
  return sub_25CF04200((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_25CF05220(uint64_t a1)
{
  return a1;
}

uint64_t sub_25CF0524C(uint64_t a1)
{
  return a1;
}

id *sub_25CF05278(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_25CF052A4()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for DisambiguateRecipientView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for DisambiguateRecipientView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for DisambiguateRecipientView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a1[3];
  id v5 = (void *)a2[3];
  a1[3] = v5;
  id v6 = v5;

  a1[4] = a2[4];
  return a1;
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

uint64_t assignWithTake for DisambiguateRecipientView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateRecipientView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
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

uint64_t storeEnumTagSinglePayload for DisambiguateRecipientView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateRecipientView()
{
  return &type metadata for DisambiguateRecipientView;
}

uint64_t sub_25CF054E8()
{
  return sub_25CEFDA10(&qword_26A62EFC0, &qword_26A62EFC8);
}

uint64_t objectdestroyTm_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25CF05570@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25CF045BC(a1, (uint64_t *)(v2 + 16), a2);
}

uint64_t sub_25CF05578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IndexedContact();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF055DC()
{
  uint64_t v1 = (int *)(type metadata accessor for IndexedContact() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v6 = v0 + v1[7] + v3;
  uint64_t v7 = sub_25CF42C68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

void sub_25CF056E0()
{
  uint64_t v1 = *(void *)(type metadata accessor for IndexedContact() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_25CF04E78(v0 + 16, v2);
}

uint64_t sub_25CF05744(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IndexedContact();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF057A0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_userData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25CF43D28();

  return v3;
}

uint64_t sub_25CF0580C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF05854(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MailPluginModel.asEncoreEvent.getter()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_25CF42B08();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F020);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_2_2();
  type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_2();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v35[0] = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)v35 - v14;
  uint64_t v16 = sub_25CF42D28();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1();
  uint64_t v22 = v21 - v20;
  v35[1] = v2;
  sub_25CF05D6C(v2, (uint64_t)v15);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      OUTLINED_FUNCTION_13();
      uint64_t v34 = 28;
      break;
    case 2u:
      OUTLINED_FUNCTION_13();
      uint64_t v34 = 32;
      break;
    case 3u:
      OUTLINED_FUNCTION_13();
      uint64_t v34 = 34;
      break;
    default:
      sub_25CF42EF8();
      OUTLINED_FUNCTION_2();
      (*(void (**)(uint64_t, char *))(v23 + 32))(v22, v15);
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v22, *MEMORY[0x263F70658], v16);
      v36[3] = v16;
      v36[4] = sub_25CF07C3C(&qword_26A62F028, MEMORY[0x263F706A0]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 16))(boxed_opaque_existential_1, v22, v16);
      sub_25CF42F38();
      uint64_t v25 = sub_25CF42F48();
      __swift_storeEnumTagSinglePayload(v1, 0, 1, v25);
      sub_25CF42AF8();
      sub_25CF42AE8();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
      id v26 = objc_allocWithZone((Class)sub_25CF42F28());
      uint64_t v27 = sub_25CF42F18();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
      return v27;
  }
  static Logger.logAndCrash(_:file:line:)(v29, v30, v31, v32, v33, v34);
  __break(1u);
  JUMPOUT(0x25CF05D14);
}

uint64_t type metadata accessor for MailPluginModel()
{
  uint64_t result = qword_26A62F120;
  if (!qword_26A62F120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25CF05D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MailPluginModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *MailPluginModel.bundleName.unsafeMutableAddressor()
{
  return &static MailPluginModel.bundleName;
}

uint64_t static MailPluginModel.bundleName.getter()
{
  swift_beginAccess();
  uint64_t v0 = static MailPluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static MailPluginModel.bundleName.setter(uint64_t a1, char *a2)
{
  static MailPluginModel.bundleName = a1;
  off_26A62F018 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static MailPluginModel.bundleName.modify())()
{
  return j__swift_endAccess;
}

uint64_t MailPluginModel.snippetHidden(for:idiom:)()
{
  uint64_t v2 = sub_25CF42CB8();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_2();
  sub_25CF05D6C(v0, v1);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_25CF06EC4(v1, (void (*)(void))type metadata accessor for MailPluginModel);
  if (EnumCaseMultiPayload > 1)
  {
    char v11 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x263F75620], v2);
    char v11 = sub_25CF42CA8();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  }
  return v11 & 1;
}

BOOL sub_25CF06040(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25CF06050()
{
  return sub_25CF44178();
}

uint64_t sub_25CF06078(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7373654D646E6573 && a2 == 0xEB00000000656761;
  if (v2 || (sub_25CF44148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7373654D64616572 && a2 == 0xEC00000073656761;
    if (v6 || (sub_25CF44148() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x800000025CF4EAE0 || (sub_25CF44148() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000025CF4EB00)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v7 = sub_25CF44148();
      swift_bridgeObjectRelease();
      if (v7) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_25CF06258()
{
  return 4;
}

uint64_t sub_25CF06260()
{
  return sub_25CF44188();
}

unint64_t sub_25CF062A8(char a1)
{
  unint64_t result = 0x7373654D646E6573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7373654D64616572;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF06358()
{
  return 1;
}

uint64_t sub_25CF06360()
{
  return sub_25CF44178();
}

uint64_t sub_25CF06388(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25CF44148();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25CF063F8()
{
  return sub_25CF44188();
}

uint64_t sub_25CF0643C()
{
  return 12383;
}

BOOL sub_25CF06448(char *a1, char *a2)
{
  return sub_25CF06040(*a1, *a2);
}

uint64_t sub_25CF06454()
{
  return sub_25CF06260();
}

uint64_t sub_25CF0645C()
{
  return sub_25CF06050();
}

unint64_t sub_25CF06464()
{
  return sub_25CF062A8(*v0);
}

uint64_t sub_25CF0646C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF06078(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF06494@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF06258();
  *a1 = result;
  return result;
}

uint64_t sub_25CF064BC(uint64_t a1)
{
  unint64_t v2 = sub_25CF06E2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF064F8(uint64_t a1)
{
  unint64_t v2 = sub_25CF06E2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF06538()
{
  return sub_25CF063F8();
}

uint64_t sub_25CF0655C(uint64_t a1)
{
  unint64_t v2 = sub_25CF06E78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF06598(uint64_t a1)
{
  unint64_t v2 = sub_25CF06E78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF065D4(uint64_t a1)
{
  unint64_t v2 = sub_25CF06F18();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF06610(uint64_t a1)
{
  unint64_t v2 = sub_25CF06F18();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF0664C(uint64_t a1)
{
  unint64_t v2 = sub_25CF06FB0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF06688(uint64_t a1)
{
  unint64_t v2 = sub_25CF06FB0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF066C4()
{
  return sub_25CF44188();
}

uint64_t sub_25CF06704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF06388(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25CF06730()
{
  return sub_25CEFF9C4();
}

uint64_t sub_25CF0674C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF06358();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25CF06778(uint64_t a1)
{
  unint64_t v2 = sub_25CF06FFC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF067B4(uint64_t a1)
{
  unint64_t v2 = sub_25CF06FFC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MailPluginModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F030);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_3();
  type metadata accessor for DisambiguateHandlesDataModel(0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7_0(v5, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F038);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F040);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F048);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = sub_25CF42EF8();
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13 - v12;
  type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F050);
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF06E2C();
  sub_25CF441A8();
  sub_25CF05D6C(v33[5], (uint64_t)v1);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v26 = *v1;
      LOBYTE(v33[0]) = 1;
      sub_25CF06FB0();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for MailPluginModel.ReadMessagesCodingKeys, (uint64_t)v33, v32);
      v33[0] = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F088);
      sub_25CF07AD0(&qword_26A62F090, &qword_26A62F098);
      sub_25CF44108();
      OUTLINED_FUNCTION_2_3();
      v27();
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_2_3();
      v28();
      return swift_bridgeObjectRelease();
    case 2u:
      uint64_t v18 = *v1;
      uint64_t v19 = v1[1];
      uint64_t v20 = v1[2];
      LOBYTE(v33[0]) = 2;
      sub_25CF06F18();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys, (uint64_t)v33, v32);
      v33[0] = v18;
      v33[1] = v19;
      v33[2] = v20;
      sub_25CF06F64();
      sub_25CF44108();
      OUTLINED_FUNCTION_2_3();
      v21();
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_2_3();
      v22();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 3u:
      sub_25CF07A24((uint64_t)v1, v31, (void (*)(void))type metadata accessor for DisambiguateHandlesDataModel);
      LOBYTE(v33[0]) = 3;
      sub_25CF06E78();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for MailPluginModel.DisambiguateHandlesCodingKeys, (uint64_t)v33, v32);
      sub_25CF07C3C(&qword_26A62F068, (void (*)(uint64_t))type metadata accessor for DisambiguateHandlesDataModel);
      sub_25CF44108();
      OUTLINED_FUNCTION_2_3();
      v23();
      sub_25CF06EC4(v31, (void (*)(void))type metadata accessor for DisambiguateHandlesDataModel);
      goto LABEL_5;
    default:
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(v30 + 32))(v14, v1, v9);
      LOBYTE(v33[0]) = 0;
      sub_25CF06FFC();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for MailPluginModel.SendMessageCodingKeys, (uint64_t)v33, v32);
      sub_25CF07C3C(&qword_26A62F0A8, MEMORY[0x263F707B0]);
      sub_25CF44108();
      OUTLINED_FUNCTION_2_3();
      v17();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v14, v9);
LABEL_5:
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_2_3();
      return v24();
  }
}

unint64_t sub_25CF06E2C()
{
  unint64_t result = qword_26A62F058;
  if (!qword_26A62F058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F058);
  }
  return result;
}

unint64_t sub_25CF06E78()
{
  unint64_t result = qword_26A62F060;
  if (!qword_26A62F060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F060);
  }
  return result;
}

uint64_t sub_25CF06EC4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v3();
  return a1;
}

unint64_t sub_25CF06F18()
{
  unint64_t result = qword_26A62F070;
  if (!qword_26A62F070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F070);
  }
  return result;
}

unint64_t sub_25CF06F64()
{
  unint64_t result = qword_26A62F078;
  if (!qword_26A62F078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F078);
  }
  return result;
}

unint64_t sub_25CF06FB0()
{
  unint64_t result = qword_26A62F080;
  if (!qword_26A62F080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F080);
  }
  return result;
}

unint64_t sub_25CF06FFC()
{
  unint64_t result = qword_26A62F0A0;
  if (!qword_26A62F0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F0A0);
  }
  return result;
}

uint64_t MailPluginModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F0B0);
  OUTLINED_FUNCTION_0();
  uint64_t v77 = v4;
  uint64_t v78 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7_0(v5, v67);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F0B8);
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_3();
  uint64_t v80 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F0C0);
  OUTLINED_FUNCTION_0();
  uint64_t v74 = v10;
  uint64_t v75 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_3();
  uint64_t v81 = v11;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F0C8);
  OUTLINED_FUNCTION_0();
  uint64_t v72 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_3();
  uint64_t v79 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F0D0);
  OUTLINED_FUNCTION_0();
  uint64_t v83 = v16;
  uint64_t v84 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1();
  uint64_t v19 = v18 - v17;
  uint64_t v86 = type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_2();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v67 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v67 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v67 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v67 - v33;
  uint64_t v35 = a1[3];
  v87 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v35);
  sub_25CF06E2C();
  uint64_t v36 = (uint64_t)v90;
  sub_25CF44198();
  if (!v36)
  {
    v71 = v32;
    uint64_t v68 = v26;
    v69 = v29;
    v70 = v23;
    uint64_t v37 = v86;
    v90 = v34;
    uint64_t v38 = v84;
    uint64_t v39 = sub_25CF44098();
    uint64_t v40 = *(void *)(v39 + 16);
    if (v40
      && (uint64_t v67 = 0,
          uint64_t v41 = *(unsigned __int8 *)(v39 + 32),
          sub_25CF079A8(1, v40, v39, v39 + 32, 0, (2 * v40) | 1),
          uint64_t v43 = v42,
          unint64_t v45 = v44,
          swift_bridgeObjectRelease(),
          v43 == v45 >> 1))
    {
      uint64_t v46 = v82;
      switch(v41)
      {
        case 1:
          LOBYTE(v88) = 1;
          sub_25CF06FB0();
          OUTLINED_FUNCTION_5_0((uint64_t)&type metadata for MailPluginModel.ReadMessagesCodingKeys, (uint64_t)&v88);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F088);
          sub_25CF07AD0(&qword_26A62F0F0, &qword_26A62F0F8);
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_2_3();
          v55();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_2_3();
          v56();
          uint64_t v54 = v69;
          void *v69 = v88;
          goto LABEL_11;
        case 2:
          LOBYTE(v88) = 2;
          sub_25CF06F18();
          OUTLINED_FUNCTION_5_0((uint64_t)&type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys, (uint64_t)&v88);
          sub_25CF07A84();
          sub_25CF44088();
          OUTLINED_FUNCTION_2_3();
          v59();
          swift_unknownObjectRelease();
          uint64_t v60 = OUTLINED_FUNCTION_8_0();
          v61(v60);
          uint64_t v62 = v89;
          long long v63 = v68;
          *uint64_t v68 = v88;
          *((void *)v63 + 2) = v62;
          swift_storeEnumTagMultiPayload();
          uint64_t v64 = (uint64_t)v63;
          goto LABEL_12;
        case 3:
          LOBYTE(v88) = 3;
          sub_25CF06E78();
          OUTLINED_FUNCTION_5_0((uint64_t)&type metadata for MailPluginModel.DisambiguateHandlesCodingKeys, (uint64_t)&v88);
          type metadata accessor for DisambiguateHandlesDataModel(0);
          sub_25CF07C3C(&qword_26A62F0E0, (void (*)(uint64_t))type metadata accessor for DisambiguateHandlesDataModel);
          uint64_t v50 = (uint64_t)v70;
          sub_25CF44088();
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_2_3();
          v65();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_2_3();
          v66();
          swift_storeEnumTagMultiPayload();
          uint64_t v64 = v50;
LABEL_12:
          uint64_t v58 = (uint64_t)v90;
          sub_25CF07A24(v64, (uint64_t)v90, (void (*)(void))type metadata accessor for MailPluginModel);
          uint64_t v46 = v82;
          break;
        default:
          LOBYTE(v88) = 0;
          sub_25CF06FFC();
          OUTLINED_FUNCTION_5_0((uint64_t)&type metadata for MailPluginModel.SendMessageCodingKeys, (uint64_t)&v88);
          sub_25CF42EF8();
          sub_25CF07C3C(&qword_26A62F100, MEMORY[0x263F707B0]);
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_2_3();
          v52();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_2_3();
          v53();
          uint64_t v54 = v71;
LABEL_11:
          swift_storeEnumTagMultiPayload();
          uint64_t v57 = (uint64_t)v54;
          uint64_t v58 = (uint64_t)v90;
          sub_25CF07A24(v57, (uint64_t)v90, (void (*)(void))type metadata accessor for MailPluginModel);
          break;
      }
      sub_25CF07A24(v58, v46, (void (*)(void))type metadata accessor for MailPluginModel);
    }
    else
    {
      uint64_t v47 = sub_25CF43F68();
      swift_allocError();
      unint64_t v49 = v48;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F0D8);
      uint64_t *v49 = v37;
      sub_25CF44028();
      sub_25CF43F58();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v47 - 8) + 104))(v49, *MEMORY[0x263F8DCB0], v47);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v19, v38);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v87);
}

uint64_t sub_25CF07920()
{
  swift_beginAccess();
  uint64_t v0 = static MailPluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_25CF07978@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MailPluginModel.init(from:)(a1, a2);
}

uint64_t sub_25CF07990(void *a1)
{
  return MailPluginModel.encode(to:)(a1);
}

uint64_t sub_25CF079A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_25CF07A24(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_25CF07A84()
{
  unint64_t result = qword_26A62F0E8;
  if (!qword_26A62F0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F0E8);
  }
  return result;
}

uint64_t sub_25CF07AD0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F088);
    sub_25CF07C3C(a2, (void (*)(uint64_t))type metadata accessor for WidgetMessage);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25CF07B64()
{
  return sub_25CF07C3C(&qword_26A62F108, (void (*)(uint64_t))type metadata accessor for MailPluginModel);
}

uint64_t sub_25CF07BAC()
{
  return sub_25CF07C3C(&qword_26A62F110, (void (*)(uint64_t))type metadata accessor for MailPluginModel);
}

uint64_t sub_25CF07BF4()
{
  return sub_25CF07C3C(&qword_26A62F118, (void (*)(uint64_t))type metadata accessor for MailPluginModel);
}

uint64_t sub_25CF07C3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for MailPluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v9 = sub_25CF42C68();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        uint64_t v10 = type metadata accessor for DisambiguateHandlesDataModel(0);
        *(uint64_t *)((char *)a1 + *(int *)(v10 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v10 + 20));
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = sub_25CF42EF8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MailPluginModel(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_25CF42EF8();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      return v4(a1, v3);
    case 1:
      goto LABEL_7;
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3:
      uint64_t v5 = sub_25CF42C68();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      type metadata accessor for DisambiguateHandlesDataModel(0);
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for MailPluginModel(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v5 = a2[1];
      *a1 = *a2;
      a1[1] = v5;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 3u:
      uint64_t v6 = sub_25CF42C68();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
      *(void *)((char *)a1 + *(int *)(v7 + 20)) = *(void *)((char *)a2 + *(int *)(v7 + 20));
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = sub_25CF42EF8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for MailPluginModel(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25CF06EC4((uint64_t)a1, (void (*)(void))type metadata accessor for MailPluginModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v5 = sub_25CF42C68();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        uint64_t v6 = type metadata accessor for DisambiguateHandlesDataModel(0);
        *(void *)((char *)a1 + *(int *)(v6 + 20)) = *(void *)((char *)a2 + *(int *)(v6 + 20));
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = sub_25CF42EF8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for MailPluginModel(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v8 = sub_25CF42C68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    uint64_t v9 = type metadata accessor for DisambiguateHandlesDataModel(0);
    *(void *)&a1[*(int *)(v9 + 20)] = *(void *)&a2[*(int *)(v9 + 20)];
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_25CF42EF8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithTake for MailPluginModel(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25CF06EC4((uint64_t)a1, (void (*)(void))type metadata accessor for MailPluginModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v8 = sub_25CF42C68();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for DisambiguateHandlesDataModel(0);
      *(void *)&a1[*(int *)(v9 + 20)] = *(void *)&a2[*(int *)(v9 + 20)];
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_25CF42EF8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25CF084D8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25CF084E8()
{
  uint64_t result = sub_25CF42EF8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for DisambiguateHandlesDataModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MailPluginModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MailPluginModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF08718);
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

unsigned char *sub_25CF08740(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MailPluginModel.CodingKeys()
{
  return &type metadata for MailPluginModel.CodingKeys;
}

uint64_t sub_25CF08764()
{
  return 0;
}

ValueMetadata *type metadata accessor for MailPluginModel.SendMessageCodingKeys()
{
  return &type metadata for MailPluginModel.SendMessageCodingKeys;
}

ValueMetadata *type metadata accessor for MailPluginModel.ReadMessagesCodingKeys()
{
  return &type metadata for MailPluginModel.ReadMessagesCodingKeys;
}

ValueMetadata *type metadata accessor for MailPluginModel.DisambiguateRecipientsCodingKeys()
{
  return &type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys;
}

uint64_t _s10SiriMailUI15MailPluginModelO21SendMessageCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s10SiriMailUI15MailPluginModelO21SendMessageCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25CF08888);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MailPluginModel.DisambiguateHandlesCodingKeys()
{
  return &type metadata for MailPluginModel.DisambiguateHandlesCodingKeys;
}

unint64_t sub_25CF088C4()
{
  unint64_t result = qword_26A62F130;
  if (!qword_26A62F130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F130);
  }
  return result;
}

unint64_t sub_25CF08914()
{
  unint64_t result = qword_26A62F138;
  if (!qword_26A62F138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F138);
  }
  return result;
}

unint64_t sub_25CF08964()
{
  unint64_t result = qword_26A62F140;
  if (!qword_26A62F140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F140);
  }
  return result;
}

unint64_t sub_25CF089B4()
{
  unint64_t result = qword_26A62F148;
  if (!qword_26A62F148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F148);
  }
  return result;
}

unint64_t sub_25CF08A04()
{
  unint64_t result = qword_26A62F150;
  if (!qword_26A62F150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F150);
  }
  return result;
}

unint64_t sub_25CF08A54()
{
  unint64_t result = qword_26A62F158;
  if (!qword_26A62F158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F158);
  }
  return result;
}

unint64_t sub_25CF08AA4()
{
  unint64_t result = qword_26A62F160;
  if (!qword_26A62F160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F160);
  }
  return result;
}

unint64_t sub_25CF08AF4()
{
  unint64_t result = qword_26A62F168;
  if (!qword_26A62F168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F168);
  }
  return result;
}

unint64_t sub_25CF08B44()
{
  unint64_t result = qword_26A62F170;
  if (!qword_26A62F170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F170);
  }
  return result;
}

unint64_t sub_25CF08B94()
{
  unint64_t result = qword_26A62F178;
  if (!qword_26A62F178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F178);
  }
  return result;
}

unint64_t sub_25CF08BE4()
{
  unint64_t result = qword_26A62F180;
  if (!qword_26A62F180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F180);
  }
  return result;
}

unint64_t sub_25CF08C34()
{
  unint64_t result = qword_26A62F188;
  if (!qword_26A62F188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F188);
  }
  return result;
}

unint64_t sub_25CF08C84()
{
  unint64_t result = qword_26A62F190;
  if (!qword_26A62F190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F190);
  }
  return result;
}

unint64_t sub_25CF08CD4()
{
  unint64_t result = qword_26A62F198;
  if (!qword_26A62F198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F198);
  }
  return result;
}

unint64_t sub_25CF08D24()
{
  unint64_t result = qword_26A62F1A0;
  if (!qword_26A62F1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F1A0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F250](a1, a2, v2, a1);
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9F390](a1, a2, a3, a1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_25CF44088();
}

const char *sub_25CF08E58(unsigned __int8 a1)
{
  unint64_t v1 = "ResponseFramework";
  if (!a1) {
    unint64_t v1 = "SiriMail";
  }
  if (a1 - 2 >= 2) {
    return v1;
  }
  else {
    return "Mail";
  }
}

const char *sub_25CF08EA0(char a1)
{
  unint64_t result = "SceneHosting";
  switch(a1)
  {
    case 1:
      unint64_t result = "SMART";
      break;
    case 2:
      unint64_t result = "BlackPearl";
      break;
    case 3:
      unint64_t result = "CatchUp";
      break;
    default:
      return result;
  }
  return result;
}

const char *sub_25CF08F18()
{
  return sub_25CF08E58(*v0);
}

const char *sub_25CF08F20()
{
  return sub_25CF08EA0(*v0);
}

Swift::Bool __swiftcall MailUIFeatureFlags.isSceneHostingEnabled()()
{
  uint64_t v0 = sub_25CF42CB8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unsigned int v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v2);
  unsigned int v6 = &v15[-v5 - 8];
  uint64_t v16 = &type metadata for Features;
  unint64_t v7 = sub_25CF0911C();
  unint64_t v17 = v7;
  v15[0] = 1;
  char v8 = sub_25CF42BD8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if (v8)
  {
    uint64_t v16 = &type metadata for Features;
    unint64_t v17 = v7;
    v15[0] = 0;
    char v9 = sub_25CF42BD8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    char v10 = 0;
    if (v9)
    {
      sub_25CF42C98();
      sub_25CF42C88();
      sub_25CF42C78();
      swift_release();
      sub_25CF42CC8();
      swift_release();
      (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F75620], v0);
      sub_25CF09168();
      char v11 = sub_25CF43D58();
      uint64_t v12 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
      v12(v4, v0);
      v12(v6, v0);
      char v10 = v11 ^ 1;
    }
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

unint64_t sub_25CF0911C()
{
  unint64_t result = qword_26A62F1A8;
  if (!qword_26A62F1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F1A8);
  }
  return result;
}

unint64_t sub_25CF09168()
{
  unint64_t result = qword_26A62F1B0;
  if (!qword_26A62F1B0)
  {
    sub_25CF42CB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F1B0);
  }
  return result;
}

Swift::Bool __swiftcall MailUIFeatureFlags.isSMARTEnabled()()
{
  return sub_25CF091C8(1);
}

Swift::Bool __swiftcall MailUIFeatureFlags.isBlackPearlEnabled()()
{
  return sub_25CF091C8(2);
}

uint64_t sub_25CF091C8(char a1)
{
  uint64_t v5 = &type metadata for Features;
  unint64_t v6 = sub_25CF0911C();
  v4[0] = a1;
  char v2 = sub_25CF42BD8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

ValueMetadata *type metadata accessor for MailUIFeatureFlags()
{
  return &type metadata for MailUIFeatureFlags;
}

unsigned char *storeEnumTagSinglePayload for Features(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF092FCLL);
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

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_25CF09338()
{
  unint64_t result = qword_26A62F1B8;
  if (!qword_26A62F1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F1B8);
  }
  return result;
}

uint64_t property wrapper backing initializer of MessageDetailView.isDeleted()
{
  sub_25CF439B8();
  return v1;
}

uint64_t MessageDetailView.init(_:numberOfSummaryLines:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25CF43D18();
  sub_25CF0F430((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  *(void *)a3 = sub_25CF432A8();
  *(void *)(a3 + 8) = v6;
  sub_25CF439B8();
  *(unsigned char *)(a3 + 16) = v27;
  *(void *)(a3 + 24) = v28;
  unint64_t v7 = (int *)type metadata accessor for MessageDetailView();
  char v8 = (uint64_t *)(a3 + v7[12]);
  *char v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  swift_storeEnumTagMultiPayload();
  sub_25CF0F478((uint64_t)a1, a3 + v7[6], (void (*)(void))type metadata accessor for WidgetMessage);
  char v9 = (int *)type metadata accessor for WidgetMessage();
  char v10 = (uint64_t *)((char *)a1 + v9[20]);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v13 = (void *)(a3 + v7[8]);
  *uint64_t v13 = v12;
  v13[1] = v11;
  uint64_t v14 = (uint64_t *)((char *)a1 + v9[21]);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  unint64_t v17 = (void *)(a3 + v7[9]);
  *unint64_t v17 = v15;
  v17[1] = v16;
  uint64_t v18 = (uint64_t *)((char *)a1 + v9[19]);
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  uint64_t v21 = (void *)(a3 + v7[10]);
  void *v21 = v19;
  v21[1] = v20;
  uint64_t v22 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.uniqueIdentifier.getter(v22);
  if (qword_26A62ED18 != -1) {
    swift_once();
  }
  uint64_t v23 = (void *)qword_26A62F1C8;
  uint64_t v24 = (void *)sub_25CF43D68();
  id v25 = objc_msgSend(v23, sel_messageForSearchableItemIdentifier_, v24);
  swift_bridgeObjectRelease();

  uint64_t result = sub_25CF0F4CC((uint64_t)a1, (void (*)(void))type metadata accessor for WidgetMessage);
  *(void *)(a3 + v7[7]) = v25;
  *(void *)(a3 + v7[11]) = a2;
  return result;
}

uint64_t type metadata accessor for MessageDetailView()
{
  uint64_t result = qword_26A62F238;
  if (!qword_26A62F238) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t String.uniqueIdentifier.getter(uint64_t a1)
{
  sub_25CF42A88();
  OUTLINED_FUNCTION_3_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_0();
  sub_25CF42A78();
  sub_25CEFDB04();
  uint64_t v7 = sub_25CF43ED8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v1);
  uint64_t v8 = sub_25CF0CE00(v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10) {
    return v8;
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t MessageDetailView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v28[0] = a1;
  v28[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F1D0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F1D8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for MessageDetailView();
  uint64_t v12 = v11 - 8;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F1E0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = *(void *)(v2 + *(int *)(v12 + 32) + 56);
  uint64_t v20 = sub_25CF434E8();
  if (v19)
  {
    *(void *)uint64_t v6 = v20;
    *(void *)(v6 + 8) = 0;
    *(unsigned char *)(v6 + 16) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F1E8);
    sub_25CF0F478(v2, (uint64_t)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for MessageDetailView);
    unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v22 = swift_allocObject();
    sub_25CF0CE4C((uint64_t)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F1F0);
    sub_25CEFDA10(&qword_26A62F1F8, &qword_26A62F1F0);
    sub_25CF43B68();
    uint64_t v23 = &qword_26A62F1D0;
    sub_25CF0F584(v6, v10, &qword_26A62F1D0);
    swift_storeEnumTagMultiPayload();
    sub_25CEFDA10(&qword_26A62F200, &qword_26A62F1E0);
    sub_25CEFDA10(&qword_26A62F208, &qword_26A62F1D0);
    OUTLINED_FUNCTION_7_1();
    uint64_t v24 = v6;
  }
  else
  {
    *(void *)uint64_t v18 = v20;
    *(void *)(v18 + 8) = 0;
    *(unsigned char *)(v18 + 16) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F210);
    sub_25CF0F478(v2, (uint64_t)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for MessageDetailView);
    unint64_t v25 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v26 = swift_allocObject();
    sub_25CF0CE4C((uint64_t)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F218);
    sub_25CEFDA10(&qword_26A62F220, &qword_26A62F218);
    sub_25CF43B68();
    uint64_t v23 = &qword_26A62F1E0;
    sub_25CF0F584(v18, v10, &qword_26A62F1E0);
    swift_storeEnumTagMultiPayload();
    sub_25CEFDA10(&qword_26A62F200, &qword_26A62F1E0);
    sub_25CEFDA10(&qword_26A62F208, &qword_26A62F1D0);
    OUTLINED_FUNCTION_7_1();
    uint64_t v24 = v18;
  }
  return sub_25CF0F5D4(v24, v23);
}

uint64_t sub_25CF09B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v3 = sub_25CF43B88();
  uint64_t v77 = *(void *)(v3 - 8);
  uint64_t v78 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v76 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v74 = (char *)&v66 - v6;
  uint64_t v7 = type metadata accessor for WidgetMessage();
  uint64_t v8 = (int *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = v10;
  uint64_t v11 = type metadata accessor for MessageView();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v68 = (uint64_t *)((char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F308);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F310);
  uint64_t v17 = MEMORY[0x270FA5388](v70);
  uint64_t v72 = (uint64_t)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v69 = (uint64_t)&v66 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v71 = (uint64_t)&v66 - v21;
  uint64_t v22 = type metadata accessor for MessageDetailView();
  uint64_t v23 = a1 + *(int *)(v22 + 24);
  sub_25CF0F478(v23, (uint64_t)v10, (void (*)(void))type metadata accessor for WidgetMessage);
  uint64_t v24 = *(int *)(v22 + 44);
  uint64_t v73 = a1;
  uint64_t v25 = *(void *)(a1 + v24);
  LOBYTE(v10) = *(unsigned char *)(v23 + v8[12]);
  uint64_t v26 = v8[34];
  char v27 = (uint64_t *)(v23 + v8[33]);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  uint64_t v30 = *(void *)(v23 + v26);
  uint64_t v31 = *(void *)(v23 + v26 + 8);
  uint64_t v32 = (uint64_t *)(v23 + v8[35]);
  uint64_t v33 = *v32;
  uint64_t v34 = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v65 = v34;
  uint64_t v35 = (uint64_t)v16;
  uint64_t v36 = v68;
  sub_25CF1B938((uint64_t)v67, v25, (char)v10, v29, v28, v30, v31, v33, v68, v65);
  LOBYTE(v25) = sub_25CF43638();
  sub_25CF430B8();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  sub_25CF0F478((uint64_t)v36, v35, (void (*)(void))type metadata accessor for MessageView);
  uint64_t v45 = v35 + *(int *)(v14 + 44);
  *(unsigned char *)uint64_t v45 = v25;
  *(void *)(v45 + 8) = v38;
  *(void *)(v45 + 16) = v40;
  *(void *)(v45 + 24) = v42;
  *(void *)(v45 + 32) = v44;
  *(unsigned char *)(v45 + 40) = 0;
  sub_25CF0F4CC((uint64_t)v36, (void (*)(void))type metadata accessor for MessageView);
  LOBYTE(v33) = sub_25CF43618();
  unsigned __int8 v46 = sub_25CF43658();
  char v47 = sub_25CF43648();
  sub_25CF43648();
  if (sub_25CF43648() != v33) {
    char v47 = sub_25CF43648();
  }
  sub_25CF43648();
  if (sub_25CF43648() != v46) {
    char v47 = sub_25CF43648();
  }
  uint64_t v48 = v69;
  sub_25CF0F584(v35, v69, &qword_26A62F308);
  uint64_t v49 = v48 + *(int *)(v70 + 36);
  *(unsigned char *)uint64_t v49 = v47;
  *(_OWORD *)(v49 + 8) = 0u;
  *(_OWORD *)(v49 + 24) = 0u;
  *(unsigned char *)(v49 + 40) = 1;
  sub_25CF0F5D4(v35, &qword_26A62F308);
  uint64_t v50 = v71;
  sub_25CF0F51C(v48, v71);
  uint64_t v51 = sub_25CF0A100();
  uint64_t v52 = MEMORY[0x263F1B720];
  uint64_t v53 = MEMORY[0x263F774B0];
  uint64_t v83 = MEMORY[0x263F1B720];
  uint64_t v84 = MEMORY[0x263F774B0];
  uint64_t v82 = v51;
  uint64_t v54 = sub_25CF0A8AC();
  uint64_t v80 = v52;
  uint64_t v81 = v53;
  uint64_t v79 = v54;
  long long v55 = v74;
  sub_25CF43B78();
  uint64_t v56 = v72;
  sub_25CF0F584(v50, v72, &qword_26A62F310);
  uint64_t v58 = v76;
  uint64_t v57 = v77;
  uint64_t v59 = *(void (**)(char *, char *, uint64_t))(v77 + 16);
  uint64_t v60 = v78;
  v59(v76, v55, v78);
  uint64_t v61 = v75;
  sub_25CF0F584(v56, v75, &qword_26A62F310);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F318);
  v59((char *)(v61 + *(int *)(v62 + 48)), v58, v60);
  long long v63 = *(void (**)(char *, uint64_t))(v57 + 8);
  v63(v55, v60);
  sub_25CF0F5D4(v50, &qword_26A62F310);
  v63(v58, v60);
  return sub_25CF0F5D4(v56, &qword_26A62F310);
}

uint64_t sub_25CF0A100()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25CF43268();
  uint64_t v63 = *(void *)(v2 - 8);
  uint64_t v64 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v62 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25CF43998();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v61 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v59 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25CF43B38();
  uint64_t v53 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MessageDetailView();
  uint64_t v9 = v8 - 8;
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v50 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F268);
  uint64_t v55 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F270);
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v58 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v52 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F278);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v54 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F280);
  MEMORY[0x270FA5388](v56);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (uint64_t *)(v1 + *(int *)(v9 + 44));
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  sub_25CF0F478(v1, (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for MessageDetailView);
  unint64_t v24 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v25 = swift_allocObject();
  sub_25CF0CE4C((uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
  v68[0] = v23;
  v68[1] = v22;
  uint64_t v65 = v68;
  unint64_t v66 = 0xD000000000000017;
  unint64_t v67 = 0x800000025CF4EBA0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F288);
  sub_25CEFDA10(&qword_26A62F290, &qword_26A62F288);
  sub_25CF439F8();
  swift_bridgeObjectRelease();
  uint64_t v26 = v53;
  char v27 = v51;
  uint64_t v28 = v6;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v51, *MEMORY[0x263F774D8], v6);
  v68[0] = sub_25CF43908();
  sub_25CF431D8();
  id v29 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  v68[0] = MEMORY[0x2611A23E0](v29);
  sub_25CF431D8();
  sub_25CEFDA10(&qword_26A62F298, &qword_26A62F268);
  uint64_t v30 = v52;
  sub_25CF437F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v11);
  uint64_t v32 = v59;
  uint64_t v31 = v60;
  uint64_t v33 = v61;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, *MEMORY[0x263F1B538], v61);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = *(int *)(v17 + 44);
  uint64_t v36 = (uint64_t)v54;
  uint64_t v37 = (uint64_t *)&v54[v35];
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v37 + *(int *)(v38 + 28), v32, v33);
  *uint64_t v37 = KeyPath;
  uint64_t v40 = v57;
  uint64_t v39 = v58;
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v36, v30, v58);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v30, v39);
  uint64_t v41 = v62;
  sub_25CF43258();
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = (uint64_t *)&v20[*(int *)(v56 + 36)];
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A8);
  uint64_t v46 = v63;
  uint64_t v45 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))((char *)v43 + *(int *)(v44 + 28), v41, v64);
  uint64_t *v43 = v42;
  sub_25CF0F584(v36, (uint64_t)v20, &qword_26A62F278);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v45);
  sub_25CF0F5D4(v36, &qword_26A62F278);
  sub_25CF0F1A4();
  uint64_t v47 = sub_25CF437E8();
  sub_25CF0F5D4((uint64_t)v20, &qword_26A62F280);
  return v47;
}

uint64_t sub_25CF0A8AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25CF43268();
  uint64_t v63 = *(void *)(v2 - 8);
  uint64_t v64 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v62 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25CF43998();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v61 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v59 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25CF43B38();
  uint64_t v53 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MessageDetailView();
  uint64_t v9 = v8 - 8;
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v50 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F268);
  uint64_t v55 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F270);
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v58 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v52 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F278);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v54 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F280);
  MEMORY[0x270FA5388](v56);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (uint64_t *)(v1 + *(int *)(v9 + 48));
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  sub_25CF0F478(v1, (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for MessageDetailView);
  unint64_t v24 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v25 = swift_allocObject();
  sub_25CF0CE4C((uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
  v67[0] = v23;
  v67[1] = v22;
  uint64_t v65 = v67;
  strcpy((char *)v66, "envelope.open");
  v66[7] = -4864;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F288);
  sub_25CEFDA10(&qword_26A62F290, &qword_26A62F288);
  sub_25CF439F8();
  swift_bridgeObjectRelease();
  uint64_t v26 = v53;
  char v27 = v51;
  uint64_t v28 = v6;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v51, *MEMORY[0x263F774D8], v6);
  v67[0] = sub_25CF43908();
  sub_25CF431D8();
  id v29 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  v67[0] = MEMORY[0x2611A23E0](v29);
  sub_25CF431D8();
  sub_25CEFDA10(&qword_26A62F298, &qword_26A62F268);
  uint64_t v30 = v52;
  sub_25CF437F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v11);
  uint64_t v32 = v59;
  uint64_t v31 = v60;
  uint64_t v33 = v61;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, *MEMORY[0x263F1B538], v61);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = *(int *)(v17 + 44);
  uint64_t v36 = (uint64_t)v54;
  uint64_t v37 = (uint64_t *)&v54[v35];
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v37 + *(int *)(v38 + 28), v32, v33);
  *uint64_t v37 = KeyPath;
  uint64_t v40 = v57;
  uint64_t v39 = v58;
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v36, v30, v58);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v30, v39);
  uint64_t v41 = v62;
  sub_25CF43258();
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = (uint64_t *)&v20[*(int *)(v56 + 36)];
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A8);
  uint64_t v46 = v63;
  uint64_t v45 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))((char *)v43 + *(int *)(v44 + 28), v41, v64);
  uint64_t *v43 = v42;
  sub_25CF0F584(v36, (uint64_t)v20, &qword_26A62F278);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v45);
  sub_25CF0F5D4(v36, &qword_26A62F278);
  sub_25CF0F1A4();
  uint64_t v47 = sub_25CF437E8();
  sub_25CF0F5D4((uint64_t)v20, &qword_26A62F280);
  return v47;
}

uint64_t sub_25CF0B060@<X0>(char *a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v40 = sub_25CF43B88();
  uint64_t v44 = *(void *)(v40 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v40);
  uint64_t v45 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v32 - v3;
  uint64_t v5 = sub_25CF43BE8();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v8;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = sub_25CF43C78();
  uint64_t v39 = *(void *)(v11 - 8);
  uint64_t v12 = v39;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v38 = (char *)&v32 - v16;
  sub_25CF0B414((uint64_t)&v32 - v16);
  uint64_t v36 = v10;
  sub_25CF0BC44((uint64_t)v10);
  uint64_t v34 = v4;
  sub_25CF0C068();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v37 = v15;
  uint64_t v35 = v11;
  v18(v15, v17, v11);
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v32(v8, v10, v43);
  uint64_t v19 = v45;
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v21 = v40;
  v20(v45, v4, v40);
  uint64_t v22 = v41;
  v18(v41, v15, v11);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F260);
  unint64_t v24 = v33;
  uint64_t v25 = v43;
  v32(&v22[*(int *)(v23 + 48)], v33, v43);
  v20(&v22[*(int *)(v23 + 64)], v19, v21);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v44 + 8);
  v26(v34, v21);
  char v27 = *(void (**)(char *, uint64_t))(v42 + 8);
  uint64_t v28 = v25;
  v27(v36, v25);
  id v29 = *(void (**)(char *, uint64_t))(v39 + 8);
  uint64_t v30 = v35;
  v29(v38, v35);
  v26(v45, v21);
  v27(v24, v28);
  return ((uint64_t (*)(char *, uint64_t))v29)(v37, v30);
}

uint64_t sub_25CF0B414@<X0>(uint64_t a1@<X8>)
{
  uint64_t v91 = a1;
  uint64_t v2 = sub_25CF42B68();
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  MEMORY[0x270FA5388](v2);
  long long v88 = (char *)v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25CF42B98();
  MEMORY[0x270FA5388](v4 - 8);
  v81[3] = (char *)v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_25CF43B48();
  uint64_t v84 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v82 = (char *)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2F8);
  uint64_t v85 = *(void *)(v7 - 8);
  uint64_t v86 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v83 = (char *)v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25CF43498();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = type metadata accessor for MessageDetailView();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v1 + *(int *)(v11 + 24);
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = *(void *)(v14 + 24);
  uint64_t v92 = v14;
  sub_25CF0F478(v1, (uint64_t)v13, (void (*)(void))type metadata accessor for MessageDetailView);
  if (v16)
  {
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v18 = *(int *)(v10 + 24);
    uint64_t v19 = &v13[v18 + *(int *)(type metadata accessor for WidgetMessage() + 124)];
    uint64_t v15 = *(void *)v19;
    uint64_t v17 = *((void *)v19 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_25CF0F4CC((uint64_t)v13, (void (*)(void))type metadata accessor for MessageDetailView);
  uint64_t v119 = v15;
  uint64_t v120 = v17;
  v81[1] = sub_25CEFDB04();
  uint64_t v20 = sub_25CF437D8();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  sub_25CF436D8();
  uint64_t v25 = sub_25CF43788();
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t v31 = v30;
  sub_25CF0F360(v20, v22, v24);
  swift_bridgeObjectRelease();
  uint64_t v121 = MEMORY[0x263F1A830];
  uint64_t v122 = MEMORY[0x263F77340];
  uint64_t v32 = swift_allocObject();
  uint64_t v119 = v32;
  *(void *)(v32 + 16) = v25;
  *(void *)(v32 + 24) = v27;
  *(unsigned char *)(v32 + 32) = v29 & 1;
  *(void *)(v32 + 40) = v31;
  sub_25CF43488();
  sub_25CF43478();
  v81[2] = type metadata accessor for WidgetMessage();
  sub_25CF43468();
  sub_25CF43478();
  sub_25CF434B8();
  uint64_t v33 = sub_25CF437C8();
  uint64_t v35 = v34;
  LOBYTE(v22) = v36;
  uint64_t v38 = v37;
  uint64_t v39 = MEMORY[0x263F1A830];
  uint64_t v117 = MEMORY[0x263F1A830];
  uint64_t v40 = MEMORY[0x263F77340];
  uint64_t v118 = MEMORY[0x263F77340];
  uint64_t v41 = swift_allocObject();
  uint64_t v116 = v41;
  *(void *)(v41 + 16) = v33;
  *(void *)(v41 + 24) = v35;
  *(unsigned char *)(v41 + 32) = v22 & 1;
  *(void *)(v41 + 40) = v38;
  uint64_t v115 = 0;
  long long v113 = 0u;
  long long v114 = 0u;
  sub_25CF434A8();
  uint64_t v42 = sub_25CF437C8();
  uint64_t v44 = v43;
  LOBYTE(v22) = v45;
  uint64_t v47 = v46;
  uint64_t v111 = v39;
  uint64_t v112 = v40;
  uint64_t v48 = swift_allocObject();
  uint64_t v110 = v48;
  *(void *)(v48 + 16) = v42;
  *(void *)(v48 + 24) = v44;
  *(unsigned char *)(v48 + 32) = v22 & 1;
  *(void *)(v48 + 40) = v47;
  uint64_t v109 = 0;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v106 = 0;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v103 = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v97 = sub_25CF3D2F4();
  uint64_t v98 = v49;
  uint64_t v50 = sub_25CF437D8();
  uint64_t v52 = v51;
  LOBYTE(v47) = v53 & 1;
  uint64_t v97 = sub_25CF43918();
  uint64_t v54 = sub_25CF437A8();
  uint64_t v56 = v55;
  char v58 = v57 & 1;
  sub_25CF0F360(v50, v52, v47);
  swift_release();
  swift_bridgeObjectRelease();
  sub_25CF43728();
  uint64_t v59 = sub_25CF437B8();
  uint64_t v61 = v60;
  LOBYTE(v47) = v62;
  swift_release();
  LOBYTE(v50) = v47 & 1;
  sub_25CF0F360(v54, v56, v58);
  swift_bridgeObjectRelease();
  sub_25CF436C8();
  uint64_t v63 = sub_25CF43788();
  uint64_t v65 = v64;
  char v67 = v66;
  uint64_t v69 = v68;
  sub_25CF0F360(v59, v61, v50);
  swift_bridgeObjectRelease();
  uint64_t v99 = MEMORY[0x263F1A830];
  uint64_t v100 = MEMORY[0x263F77340];
  uint64_t v70 = swift_allocObject();
  uint64_t v97 = v70;
  *(void *)(v70 + 16) = v63;
  *(void *)(v70 + 24) = v65;
  *(unsigned char *)(v70 + 32) = v67 & 1;
  *(void *)(v70 + 40) = v69;
  sub_25CF42B88();
  uint64_t v71 = v82;
  sub_25CF43B58();
  uint64_t v73 = v88;
  uint64_t v72 = v89;
  uint64_t v74 = v90;
  (*(void (**)(char *, void, uint64_t))(v89 + 104))(v88, *MEMORY[0x263F76578], v90);
  uint64_t v75 = sub_25CF0F430(&qword_26A62F300, MEMORY[0x263F77558]);
  uint64_t v76 = v83;
  uint64_t v77 = v87;
  sub_25CF43818();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v74);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v71, v77);
  uint64_t v93 = v77;
  uint64_t v94 = v75;
  swift_getOpaqueTypeConformance2();
  uint64_t v78 = v86;
  uint64_t v79 = sub_25CF437E8();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v76, v78);
  uint64_t v95 = MEMORY[0x263F1B720];
  uint64_t v96 = MEMORY[0x263F774B0];
  uint64_t v93 = v79;
  return sub_25CF43C68();
}

uint64_t sub_25CF0BC44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v45 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D8);
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v42 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MessageDetailView();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2 + *(int *)(v6 + 24);
  uint64_t v10 = *(void *)(v9 + 32);
  uint64_t v11 = *(void *)(v9 + 40);
  v41[1] = v2;
  sub_25CF0F478(v2, (uint64_t)v8, (void (*)(void))type metadata accessor for MessageDetailView);
  if (v11)
  {
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v13 = *(int *)(v5 + 24);
    uint64_t v14 = &v8[v13 + *(int *)(type metadata accessor for WidgetMessage() + 128)];
    uint64_t v10 = *(void *)v14;
    uint64_t v12 = *((void *)v14 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_25CF0F4CC((uint64_t)v8, (void (*)(void))type metadata accessor for MessageDetailView);
  uint64_t v70 = v10;
  uint64_t v71 = v12;
  sub_25CEFDB04();
  uint64_t v15 = sub_25CF437D8();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_25CF436F8();
  uint64_t v20 = sub_25CF437B8();
  uint64_t v22 = v21;
  char v24 = v23;
  swift_release();
  sub_25CF0F360(v15, v17, v19);
  swift_bridgeObjectRelease();
  sub_25CF436B8();
  uint64_t v25 = sub_25CF43788();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  char v31 = v30 & 1;
  sub_25CF0F360(v20, v22, v24 & 1);
  swift_bridgeObjectRelease();
  char v32 = sub_25CF43628();
  uint64_t v70 = v25;
  uint64_t v71 = v27;
  char v72 = v31;
  uint64_t v73 = v29;
  LOBYTE(v74) = v32;
  long long v75 = 0u;
  long long v76 = 0u;
  char v77 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2E0);
  sub_25CF0F370();
  uint64_t v33 = sub_25CF437E8();
  sub_25CF0F360(v25, v27, v31);
  uint64_t v34 = swift_bridgeObjectRelease();
  uint64_t v35 = MEMORY[0x263F1B720];
  uint64_t v36 = MEMORY[0x263F774B0];
  uint64_t v73 = MEMORY[0x263F1B720];
  uint64_t v74 = MEMORY[0x263F774B0];
  uint64_t v70 = v33;
  MEMORY[0x270FA5388](v34);
  sub_25CF435F8();
  uint64_t v37 = v42;
  sub_25CF43118();
  sub_25CEFDA10(&qword_26A62F2F0, &qword_26A62F2D8);
  uint64_t v38 = v44;
  uint64_t v39 = sub_25CF437E8();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v37, v38);
  uint64_t v68 = v35;
  uint64_t v69 = v36;
  uint64_t v67 = v39;
  uint64_t v66 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v60 = 0;
  long long v58 = 0u;
  long long v59 = 0u;
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
  return sub_25CF43BD8();
}

uint64_t sub_25CF0C068()
{
  return sub_25CF43B78();
}

uint64_t sub_25CF0C0D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MessageDetailView();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1 + *(int *)(v5 + 24);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v9 = *(void *)(v8 + 72);
  sub_25CF0F478(a1, (uint64_t)v7, (void (*)(void))type metadata accessor for MessageDetailView);
  if (v9)
  {
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v12 = *(int *)(v4 + 24);
    uint64_t v13 = &v7[v12 + *(int *)(type metadata accessor for WidgetMessage() + 132)];
    uint64_t v10 = *(void *)v13;
    uint64_t v11 = *((void *)v13 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_25CF0F4CC((uint64_t)v7, (void (*)(void))type metadata accessor for MessageDetailView);
  v27[2] = v10;
  v27[3] = v11;
  sub_25CEFDB04();
  uint64_t v14 = sub_25CF437D8();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_25CF43728();
  uint64_t v19 = sub_25CF437B8();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_25CF0F360(v14, v16, v18);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v21;
  *(unsigned char *)(a2 + 16) = v23 & 1;
  *(void *)(a2 + 24) = v25;
  return result;
}

uint64_t sub_25CF0C270()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25CF43268();
  uint64_t v63 = *(void *)(v2 - 8);
  uint64_t v64 = v2;
  MEMORY[0x270FA5388](v2);
  long long v62 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25CF43998();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v61 = v4;
  MEMORY[0x270FA5388](v4);
  long long v59 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25CF43B38();
  uint64_t v53 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MessageDetailView();
  uint64_t v9 = v8 - 8;
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v50 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F268);
  uint64_t v55 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F270);
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v58 = v14;
  MEMORY[0x270FA5388](v14);
  long long v52 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F278);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v54 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F280);
  MEMORY[0x270FA5388](v56);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (uint64_t *)(v1 + *(int *)(v9 + 40));
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  sub_25CF0F478(v1, (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for MessageDetailView);
  unint64_t v24 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v25 = swift_allocObject();
  sub_25CF0CE4C((uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
  v68[0] = v23;
  v68[1] = v22;
  long long v65 = v68;
  uint64_t v66 = 0x6873617274;
  unint64_t v67 = 0xE500000000000000;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F288);
  sub_25CEFDA10(&qword_26A62F290, &qword_26A62F288);
  sub_25CF439F8();
  swift_bridgeObjectRelease();
  uint64_t v26 = v53;
  uint64_t v27 = v51;
  uint64_t v28 = v6;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v51, *MEMORY[0x263F774D8], v6);
  v68[0] = sub_25CF43908();
  sub_25CF431D8();
  id v29 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  v68[0] = MEMORY[0x2611A23E0](v29);
  sub_25CF431D8();
  sub_25CEFDA10(&qword_26A62F298, &qword_26A62F268);
  char v30 = v52;
  sub_25CF437F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v11);
  char v32 = v59;
  uint64_t v31 = v60;
  uint64_t v33 = v61;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, *MEMORY[0x263F1B538], v61);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = *(int *)(v17 + 44);
  uint64_t v36 = (uint64_t)v54;
  uint64_t v37 = (uint64_t *)&v54[v35];
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v37 + *(int *)(v38 + 28), v32, v33);
  *uint64_t v37 = KeyPath;
  uint64_t v40 = v57;
  uint64_t v39 = v58;
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v36, v30, v58);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v30, v39);
  uint64_t v41 = v62;
  sub_25CF43258();
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = (uint64_t *)&v20[*(int *)(v56 + 36)];
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A8);
  uint64_t v46 = v63;
  uint64_t v45 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))((char *)v43 + *(int *)(v44 + 28), v41, v64);
  uint64_t *v43 = v42;
  sub_25CF0F584(v36, (uint64_t)v20, &qword_26A62F278);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v45);
  sub_25CF0F5D4(v36, &qword_26A62F278);
  sub_25CF0F1A4();
  uint64_t v47 = sub_25CF437E8();
  sub_25CF0F5D4((uint64_t)v20, &qword_26A62F280);
  return v47;
}

uint64_t sub_25CF0CA14(id *a1)
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
  sub_25CF439C8();
  sub_25CF439D8();
  swift_release();
  if (*a1)
  {
    id v2 = *a1;
    sub_25CF43D38();
    sub_25CF43D08();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF0F430((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CF0CB74(id *a1)
{
  if (*a1)
  {
    id v1 = *a1;
    sub_25CF43D38();
    sub_25CF43D08();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF0F430((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

id sub_25CF0CC68()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3B160]), sel_init);
  qword_26A62F1C0 = (uint64_t)result;
  return result;
}

id sub_25CF0CC9C()
{
  if (qword_26A62ED10 != -1) {
    swift_once();
  }
  id result = objc_msgSend((id)qword_26A62F1C0, sel_messageRepository);
  qword_26A62F1C8 = (uint64_t)result;
  return result;
}

uint64_t String.mailMessageID.getter(uint64_t a1)
{
  sub_25CF42A88();
  OUTLINED_FUNCTION_3_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_0();
  sub_25CF42A78();
  sub_25CEFDB04();
  uint64_t v7 = sub_25CF43ED8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v1);
  if (*(void *)(v7 + 16))
  {
    a1 = *(void *)(v7 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25CF0CE00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25CF0CE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageDetailView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF0CEB0()
{
  return sub_25CF0CEE4((uint64_t (*)(uint64_t))sub_25CF09B7C);
}

uint64_t sub_25CF0CECC()
{
  return sub_25CF0CEE4((uint64_t (*)(uint64_t))sub_25CF0B060);
}

uint64_t sub_25CF0CEE4(uint64_t (*a1)(uint64_t))
{
  uint64_t v1 = type metadata accessor for MessageDetailView();
  OUTLINED_FUNCTION_0_0(v1);
  uint64_t v3 = OUTLINED_FUNCTION_6_0(*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25CF0CF40()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for MessageDetailView(uint64_t a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v22 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v5 = a3[6];
    uint64_t v6 = (void *)(a1 + v5);
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = *(uint64_t *)((char *)a2 + v5 + 8);
    *uint64_t v6 = *(char **)((char *)a2 + v5);
    v6[1] = v8;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v5 + 24);
    v6[2] = *(char **)((char *)a2 + v5 + 16);
    v6[3] = v9;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v5 + 40);
    v6[4] = *(char **)((char *)a2 + v5 + 32);
    v6[5] = v10;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v5 + 56);
    v6[6] = *(char **)((char *)a2 + v5 + 48);
    v6[7] = v11;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v5 + 72);
    v6[8] = *(char **)((char *)a2 + v5 + 64);
    v6[9] = v12;
    uint64_t v13 = (int *)type metadata accessor for WidgetMessage();
    uint64_t v14 = v13[9];
    uint64_t v109 = v7 + v14;
    uint64_t v111 = (char *)v6 + v14;
    uint64_t v15 = sub_25CF42AD8();
    long long v107 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    uint64_t v16 = v4;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v107(v111, v109, v15);
    *((unsigned char *)v6 + v13[10]) = *(unsigned char *)(v7 + v13[10]);
    *((unsigned char *)v6 + v13[11]) = *(unsigned char *)(v7 + v13[11]);
    *((unsigned char *)v6 + v13[12]) = *(unsigned char *)(v7 + v13[12]);
    *((unsigned char *)v6 + v13[13]) = *(unsigned char *)(v7 + v13[13]);
    uint64_t v17 = v13[14];
    uint64_t v18 = (char *)v6 + v17;
    uint64_t v19 = (const void *)(v7 + v17);
    uint64_t v20 = sub_25CF42AA8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
    }
    *((unsigned char *)v6 + v13[15]) = *(unsigned char *)(v7 + v13[15]);
    uint64_t v23 = v13[16];
    unint64_t v24 = (void *)((char *)v6 + v23);
    uint64_t v25 = (void *)(v7 + v23);
    uint64_t v26 = v25[1];
    *unint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = v13[17];
    uint64_t v28 = (void *)((char *)v6 + v27);
    id v29 = (void *)(v7 + v27);
    uint64_t v113 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v113;
    *((unsigned char *)v6 + v13[18]) = *(unsigned char *)(v7 + v13[18]);
    uint64_t v30 = v13[19];
    uint64_t v31 = (void *)((char *)v6 + v30);
    char v32 = (void *)(v7 + v30);
    uint64_t v112 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v112;
    uint64_t v33 = v13[20];
    uint64_t v34 = (void *)((char *)v6 + v33);
    uint64_t v35 = (void *)(v7 + v33);
    uint64_t v110 = v35[1];
    void *v34 = *v35;
    v34[1] = v110;
    uint64_t v36 = v13[21];
    uint64_t v37 = (void *)((char *)v6 + v36);
    uint64_t v38 = (void *)(v7 + v36);
    uint64_t v108 = v38[1];
    *uint64_t v37 = *v38;
    v37[1] = v108;
    uint64_t v39 = v13[22];
    uint64_t v40 = (void *)((char *)v6 + v39);
    uint64_t v41 = (void *)(v7 + v39);
    uint64_t v106 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v106;
    uint64_t v42 = v13[23];
    uint64_t v43 = (void *)((char *)v6 + v42);
    uint64_t v44 = (void *)(v7 + v42);
    uint64_t v105 = v44[1];
    void *v43 = *v44;
    v43[1] = v105;
    uint64_t v45 = v13[24];
    uint64_t v46 = (void *)((char *)v6 + v45);
    uint64_t v47 = (void *)(v7 + v45);
    uint64_t v104 = v47[1];
    *uint64_t v46 = *v47;
    v46[1] = v104;
    uint64_t v48 = v13[25];
    uint64_t v49 = (void *)((char *)v6 + v48);
    uint64_t v50 = (void *)(v7 + v48);
    uint64_t v103 = v50[1];
    void *v49 = *v50;
    v49[1] = v103;
    uint64_t v51 = v13[26];
    long long v52 = (void *)((char *)v6 + v51);
    uint64_t v53 = (void *)(v7 + v51);
    uint64_t v102 = v53[1];
    void *v52 = *v53;
    v52[1] = v102;
    uint64_t v54 = v13[27];
    uint64_t v55 = (void *)((char *)v6 + v54);
    uint64_t v56 = (void *)(v7 + v54);
    uint64_t v101 = v56[1];
    *uint64_t v55 = *v56;
    v55[1] = v101;
    uint64_t v57 = v13[28];
    uint64_t v58 = (void *)((char *)v6 + v57);
    long long v59 = (void *)(v7 + v57);
    uint64_t v100 = v59[1];
    *uint64_t v58 = *v59;
    v58[1] = v100;
    uint64_t v60 = v13[29];
    uint64_t v61 = (void *)((char *)v6 + v60);
    long long v62 = (void *)(v7 + v60);
    uint64_t v99 = v62[1];
    *uint64_t v61 = *v62;
    v61[1] = v99;
    uint64_t v63 = v13[30];
    uint64_t v64 = (void *)((char *)v6 + v63);
    long long v65 = (void *)(v7 + v63);
    uint64_t v66 = v65[1];
    *uint64_t v64 = *v65;
    v64[1] = v66;
    uint64_t v67 = v13[31];
    uint64_t v68 = (void *)((char *)v6 + v67);
    uint64_t v69 = (void *)(v7 + v67);
    uint64_t v70 = v69[1];
    *uint64_t v68 = *v69;
    v68[1] = v70;
    uint64_t v71 = v13[32];
    char v72 = (void *)((char *)v6 + v71);
    uint64_t v73 = (void *)(v7 + v71);
    uint64_t v74 = v73[1];
    *char v72 = *v73;
    v72[1] = v74;
    uint64_t v75 = v13[33];
    long long v76 = (void *)((char *)v6 + v75);
    char v77 = (void *)(v7 + v75);
    uint64_t v78 = v77[1];
    *long long v76 = *v77;
    v76[1] = v78;
    uint64_t v79 = a3[7];
    uint64_t v80 = a3[8];
    uint64_t v81 = *(char **)((char *)a2 + v79);
    *(void *)(a1 + v79) = v81;
    uint64_t v82 = (void *)(a1 + v80);
    uint64_t v83 = (char **)((char *)a2 + v80);
    uint64_t v84 = v83[1];
    *uint64_t v82 = *v83;
    v82[1] = v84;
    uint64_t v85 = a3[9];
    uint64_t v86 = a3[10];
    uint64_t v87 = (void *)(a1 + v85);
    long long v88 = (char **)((char *)a2 + v85);
    uint64_t v89 = v88[1];
    void *v87 = *v88;
    v87[1] = v89;
    uint64_t v90 = (void *)(a1 + v86);
    uint64_t v91 = (char **)((char *)a2 + v86);
    uint64_t v92 = v91[1];
    void *v90 = *v91;
    v90[1] = v92;
    uint64_t v93 = a3[12];
    *(void *)(a1 + a3[11]) = *(char **)((char *)a2 + a3[11]);
    uint64_t v94 = (void *)(a1 + v93);
    uint64_t v95 = (char **)((char *)a2 + v93);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v96 = v81;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v97 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v97 - 8) + 16))(v94, v95, v97);
    }
    else
    {
      *uint64_t v94 = *v95;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    return (char *)a1;
  }
  return v22;
}

uint64_t destroy for MessageDetailView(id *a1, int *a2)
{
  swift_release();
  uint64_t v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for WidgetMessage();
  uint64_t v6 = &v4[*(int *)(v5 + 36)];
  uint64_t v7 = sub_25CF42AD8();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = (uint64_t)&v4[*(int *)(v5 + 56)];
  uint64_t v9 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (char *)a1 + a2[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25CF43138();
    uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
    return v12(v10, v11);
  }
  else
  {
    return swift_release();
  }
}

uint64_t initializeWithCopy for MessageDetailView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v111 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = a3[6];
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = a2 + v4;
  uint64_t v7 = *(void *)(a2 + v4 + 8);
  void *v5 = *(void *)(a2 + v4);
  v5[1] = v7;
  uint64_t v8 = *(void *)(a2 + v4 + 24);
  v5[2] = *(void *)(a2 + v4 + 16);
  v5[3] = v8;
  uint64_t v9 = *(void *)(a2 + v4 + 40);
  v5[4] = *(void *)(a2 + v4 + 32);
  v5[5] = v9;
  uint64_t v10 = *(void *)(a2 + v4 + 56);
  v5[6] = *(void *)(a2 + v4 + 48);
  v5[7] = v10;
  uint64_t v11 = *(void *)(a2 + v4 + 72);
  v5[8] = *(void *)(a2 + v4 + 64);
  v5[9] = v11;
  uint64_t v12 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v13 = v12[9];
  uint64_t v107 = v6 + v13;
  uint64_t v109 = (char *)v5 + v13;
  uint64_t v14 = sub_25CF42AD8();
  uint64_t v105 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  id v15 = v111;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v105(v109, v107, v14);
  *((unsigned char *)v5 + v12[10]) = *(unsigned char *)(v6 + v12[10]);
  *((unsigned char *)v5 + v12[11]) = *(unsigned char *)(v6 + v12[11]);
  *((unsigned char *)v5 + v12[12]) = *(unsigned char *)(v6 + v12[12]);
  *((unsigned char *)v5 + v12[13]) = *(unsigned char *)(v6 + v12[13]);
  uint64_t v16 = v12[14];
  uint64_t v17 = (char *)v5 + v16;
  uint64_t v18 = (const void *)(v6 + v16);
  uint64_t v19 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  *((unsigned char *)v5 + v12[15]) = *(unsigned char *)(v6 + v12[15]);
  uint64_t v21 = v12[16];
  uint64_t v22 = (void *)((char *)v5 + v21);
  uint64_t v23 = (void *)(v6 + v21);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = v12[17];
  uint64_t v26 = (void *)((char *)v5 + v25);
  uint64_t v27 = (void *)(v6 + v25);
  uint64_t v112 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v112;
  *((unsigned char *)v5 + v12[18]) = *(unsigned char *)(v6 + v12[18]);
  uint64_t v28 = v12[19];
  id v29 = (void *)((char *)v5 + v28);
  uint64_t v30 = (void *)(v6 + v28);
  uint64_t v110 = v30[1];
  *id v29 = *v30;
  v29[1] = v110;
  uint64_t v31 = v12[20];
  char v32 = (void *)((char *)v5 + v31);
  uint64_t v33 = (void *)(v6 + v31);
  uint64_t v108 = v33[1];
  *char v32 = *v33;
  v32[1] = v108;
  uint64_t v34 = v12[21];
  uint64_t v35 = (void *)((char *)v5 + v34);
  uint64_t v36 = (void *)(v6 + v34);
  uint64_t v106 = v36[1];
  void *v35 = *v36;
  v35[1] = v106;
  uint64_t v37 = v12[22];
  uint64_t v38 = (void *)((char *)v5 + v37);
  uint64_t v39 = (void *)(v6 + v37);
  uint64_t v104 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v104;
  uint64_t v40 = v12[23];
  uint64_t v41 = (void *)((char *)v5 + v40);
  uint64_t v42 = (void *)(v6 + v40);
  uint64_t v103 = v42[1];
  *uint64_t v41 = *v42;
  v41[1] = v103;
  uint64_t v43 = v12[24];
  uint64_t v44 = (void *)((char *)v5 + v43);
  uint64_t v45 = (void *)(v6 + v43);
  uint64_t v102 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v102;
  uint64_t v46 = v12[25];
  uint64_t v47 = (void *)((char *)v5 + v46);
  uint64_t v48 = (void *)(v6 + v46);
  uint64_t v101 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v101;
  uint64_t v49 = v12[26];
  uint64_t v50 = (void *)((char *)v5 + v49);
  uint64_t v51 = (void *)(v6 + v49);
  uint64_t v100 = v51[1];
  *uint64_t v50 = *v51;
  v50[1] = v100;
  uint64_t v52 = v12[27];
  uint64_t v53 = (void *)((char *)v5 + v52);
  uint64_t v54 = (void *)(v6 + v52);
  uint64_t v99 = v54[1];
  void *v53 = *v54;
  v53[1] = v99;
  uint64_t v55 = v12[28];
  uint64_t v56 = (void *)((char *)v5 + v55);
  uint64_t v57 = (void *)(v6 + v55);
  uint64_t v98 = v57[1];
  *uint64_t v56 = *v57;
  v56[1] = v98;
  uint64_t v58 = v12[29];
  long long v59 = (void *)((char *)v5 + v58);
  uint64_t v60 = (void *)(v6 + v58);
  uint64_t v97 = v60[1];
  *long long v59 = *v60;
  v59[1] = v97;
  uint64_t v61 = v12[30];
  long long v62 = (void *)((char *)v5 + v61);
  uint64_t v63 = (void *)(v6 + v61);
  uint64_t v64 = v63[1];
  *long long v62 = *v63;
  v62[1] = v64;
  uint64_t v65 = v12[31];
  uint64_t v66 = (void *)((char *)v5 + v65);
  uint64_t v67 = (void *)(v6 + v65);
  uint64_t v68 = v67[1];
  *uint64_t v66 = *v67;
  v66[1] = v68;
  uint64_t v69 = v12[32];
  uint64_t v70 = (void *)((char *)v5 + v69);
  uint64_t v71 = (void *)(v6 + v69);
  uint64_t v72 = v71[1];
  void *v70 = *v71;
  v70[1] = v72;
  uint64_t v73 = v12[33];
  uint64_t v74 = (void *)((char *)v5 + v73);
  uint64_t v75 = (void *)(v6 + v73);
  uint64_t v76 = v75[1];
  *uint64_t v74 = *v75;
  v74[1] = v76;
  uint64_t v77 = a3[7];
  uint64_t v78 = a3[8];
  uint64_t v79 = *(void **)(a2 + v77);
  *(void *)(a1 + v77) = v79;
  uint64_t v80 = (void *)(a1 + v78);
  uint64_t v81 = (void *)(a2 + v78);
  uint64_t v82 = v81[1];
  *uint64_t v80 = *v81;
  v80[1] = v82;
  uint64_t v83 = a3[9];
  uint64_t v84 = a3[10];
  uint64_t v85 = (void *)(a1 + v83);
  uint64_t v86 = (void *)(a2 + v83);
  uint64_t v87 = v86[1];
  *uint64_t v85 = *v86;
  v85[1] = v87;
  long long v88 = (void *)(a1 + v84);
  uint64_t v89 = (void *)(a2 + v84);
  uint64_t v90 = v89[1];
  *long long v88 = *v89;
  v88[1] = v90;
  uint64_t v91 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v92 = (void *)(a1 + v91);
  uint64_t v93 = (void *)(a2 + v91);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v94 = v79;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v95 = sub_25CF43138();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v95 - 8) + 16))(v92, v93, v95);
  }
  else
  {
    *uint64_t v92 = *v93;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for MessageDetailView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[2] = v11[2];
  v10[3] = v11[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[4] = v11[4];
  v10[5] = v11[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[6] = v11[6];
  v10[7] = v11[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[8] = v11[8];
  v10[9] = v11[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v13 = v12[9];
  uint64_t v14 = (char *)v10 + v13;
  id v15 = (char *)v11 + v13;
  uint64_t v16 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  *((unsigned char *)v10 + v12[10]) = *((unsigned char *)v11 + v12[10]);
  *((unsigned char *)v10 + v12[11]) = *((unsigned char *)v11 + v12[11]);
  *((unsigned char *)v10 + v12[12]) = *((unsigned char *)v11 + v12[12]);
  *((unsigned char *)v10 + v12[13]) = *((unsigned char *)v11 + v12[13]);
  uint64_t v17 = v12[14];
  uint64_t v18 = (char *)v10 + v17;
  uint64_t v19 = (char *)v11 + v17;
  uint64_t v20 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20);
  if (EnumTagSinglePayload)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v23 = *(void *)(v20 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v20);
LABEL_6:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v18, v19, v20);
LABEL_7:
  *((unsigned char *)v10 + v12[15]) = *((unsigned char *)v11 + v12[15]);
  uint64_t v25 = v12[16];
  uint64_t v26 = (void *)((char *)v10 + v25);
  uint64_t v27 = (void *)((char *)v11 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = v12[17];
  id v29 = (void *)((char *)v10 + v28);
  uint64_t v30 = (void *)((char *)v11 + v28);
  *id v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)v10 + v12[18]) = *((unsigned char *)v11 + v12[18]);
  uint64_t v31 = v12[19];
  char v32 = (void *)((char *)v10 + v31);
  uint64_t v33 = (void *)((char *)v11 + v31);
  *char v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = v12[20];
  uint64_t v35 = (void *)((char *)v10 + v34);
  uint64_t v36 = (void *)((char *)v11 + v34);
  void *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = v12[21];
  uint64_t v38 = (void *)((char *)v10 + v37);
  uint64_t v39 = (void *)((char *)v11 + v37);
  *uint64_t v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = v12[22];
  uint64_t v41 = (void *)((char *)v10 + v40);
  uint64_t v42 = (void *)((char *)v11 + v40);
  *uint64_t v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v43 = v12[23];
  uint64_t v44 = (void *)((char *)v10 + v43);
  uint64_t v45 = (void *)((char *)v11 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = v12[24];
  uint64_t v47 = (void *)((char *)v10 + v46);
  uint64_t v48 = (void *)((char *)v11 + v46);
  *uint64_t v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v49 = v12[25];
  uint64_t v50 = (void *)((char *)v10 + v49);
  uint64_t v51 = (void *)((char *)v11 + v49);
  *uint64_t v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v52 = v12[26];
  uint64_t v53 = (void *)((char *)v10 + v52);
  uint64_t v54 = (void *)((char *)v11 + v52);
  void *v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v55 = v12[27];
  uint64_t v56 = (void *)((char *)v10 + v55);
  uint64_t v57 = (void *)((char *)v11 + v55);
  *uint64_t v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = v12[28];
  long long v59 = (void *)((char *)v10 + v58);
  uint64_t v60 = (void *)((char *)v11 + v58);
  *long long v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v61 = v12[29];
  long long v62 = (void *)((char *)v10 + v61);
  uint64_t v63 = (void *)((char *)v11 + v61);
  *long long v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v12[30];
  uint64_t v65 = (void *)((char *)v10 + v64);
  uint64_t v66 = (void *)((char *)v11 + v64);
  *uint64_t v65 = *v66;
  v65[1] = v66[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v67 = v12[31];
  uint64_t v68 = (void *)((char *)v10 + v67);
  uint64_t v69 = (void *)((char *)v11 + v67);
  *uint64_t v68 = *v69;
  v68[1] = v69[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v70 = v12[32];
  uint64_t v71 = (void *)((char *)v10 + v70);
  uint64_t v72 = (void *)((char *)v11 + v70);
  void *v71 = *v72;
  v71[1] = v72[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v73 = v12[33];
  uint64_t v74 = (void *)((char *)v10 + v73);
  uint64_t v75 = (void *)((char *)v11 + v73);
  *uint64_t v74 = *v75;
  v74[1] = v75[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v76 = a3[7];
  uint64_t v77 = *(void **)(a2 + v76);
  uint64_t v78 = *(void **)(a1 + v76);
  *(void *)(a1 + v76) = v77;
  id v79 = v77;

  uint64_t v80 = a3[8];
  uint64_t v81 = (void *)(a1 + v80);
  uint64_t v82 = (void *)(a2 + v80);
  *uint64_t v81 = *v82;
  v81[1] = v82[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v83 = a3[9];
  uint64_t v84 = (void *)(a1 + v83);
  uint64_t v85 = (void *)(a2 + v83);
  *uint64_t v84 = *v85;
  v84[1] = v85[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v86 = a3[10];
  uint64_t v87 = (void *)(a1 + v86);
  long long v88 = (void *)(a2 + v86);
  void *v87 = *v88;
  v87[1] = v88[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  if (a1 != a2)
  {
    uint64_t v89 = a3[12];
    uint64_t v90 = (void *)(a1 + v89);
    uint64_t v91 = (void *)(a2 + v89);
    sub_25CF0F5D4(a1 + v89, &qword_26A62ED50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v92 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v92 - 8) + 16))(v90, v91, v92);
    }
    else
    {
      void *v90 = *v91;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for MessageDetailView(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  id v8 = (_OWORD *)((char *)a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  long long v10 = *(_OWORD *)((char *)a2 + v7 + 16);
  *id v8 = *(_OWORD *)((char *)a2 + v7);
  v8[1] = v10;
  long long v11 = *(_OWORD *)((char *)a2 + v7 + 48);
  v8[2] = *(_OWORD *)((char *)a2 + v7 + 32);
  v8[3] = v11;
  v8[4] = *(_OWORD *)((char *)a2 + v7 + 64);
  uint64_t v12 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v13 = v12[9];
  uint64_t v14 = (char *)v8 + v13;
  id v15 = &v9[v13];
  uint64_t v16 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  *((unsigned char *)v8 + v12[10]) = v9[v12[10]];
  *((unsigned char *)v8 + v12[11]) = v9[v12[11]];
  *((unsigned char *)v8 + v12[12]) = v9[v12[12]];
  *((unsigned char *)v8 + v12[13]) = v9[v12[13]];
  uint64_t v17 = v12[14];
  uint64_t v18 = (char *)v8 + v17;
  uint64_t v19 = &v9[v17];
  uint64_t v20 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  *((unsigned char *)v8 + v12[15]) = v9[v12[15]];
  *(_OWORD *)((char *)v8 + v12[16]) = *(_OWORD *)&v9[v12[16]];
  *(_OWORD *)((char *)v8 + v12[17]) = *(_OWORD *)&v9[v12[17]];
  *((unsigned char *)v8 + v12[18]) = v9[v12[18]];
  *(_OWORD *)((char *)v8 + v12[19]) = *(_OWORD *)&v9[v12[19]];
  *(_OWORD *)((char *)v8 + v12[20]) = *(_OWORD *)&v9[v12[20]];
  *(_OWORD *)((char *)v8 + v12[21]) = *(_OWORD *)&v9[v12[21]];
  *(_OWORD *)((char *)v8 + v12[22]) = *(_OWORD *)&v9[v12[22]];
  *(_OWORD *)((char *)v8 + v12[23]) = *(_OWORD *)&v9[v12[23]];
  *(_OWORD *)((char *)v8 + v12[24]) = *(_OWORD *)&v9[v12[24]];
  *(_OWORD *)((char *)v8 + v12[25]) = *(_OWORD *)&v9[v12[25]];
  *(_OWORD *)((char *)v8 + v12[26]) = *(_OWORD *)&v9[v12[26]];
  *(_OWORD *)((char *)v8 + v12[27]) = *(_OWORD *)&v9[v12[27]];
  *(_OWORD *)((char *)v8 + v12[28]) = *(_OWORD *)&v9[v12[28]];
  *(_OWORD *)((char *)v8 + v12[29]) = *(_OWORD *)&v9[v12[29]];
  *(_OWORD *)((char *)v8 + v12[30]) = *(_OWORD *)&v9[v12[30]];
  *(_OWORD *)((char *)v8 + v12[31]) = *(_OWORD *)&v9[v12[31]];
  *(_OWORD *)((char *)v8 + v12[32]) = *(_OWORD *)&v9[v12[32]];
  *(_OWORD *)((char *)v8 + v12[33]) = *(_OWORD *)&v9[v12[33]];
  uint64_t v22 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  uint64_t v23 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_OWORD *)((char *)a1 + v23) = *(_OWORD *)((char *)a2 + v23);
  uint64_t v24 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_25CF43138();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v25, v26, v28);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for MessageDetailView(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v7 = a3[6];
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *id v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRelease();
  id v15 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v16 = v15[9];
  uint64_t v17 = (char *)v8 + v16;
  uint64_t v18 = (char *)v9 + v16;
  uint64_t v19 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *((unsigned char *)v8 + v15[10]) = *((unsigned char *)v9 + v15[10]);
  *((unsigned char *)v8 + v15[11]) = *((unsigned char *)v9 + v15[11]);
  *((unsigned char *)v8 + v15[12]) = *((unsigned char *)v9 + v15[12]);
  *((unsigned char *)v8 + v15[13]) = *((unsigned char *)v9 + v15[13]);
  uint64_t v20 = v15[14];
  uint64_t v21 = (char *)v8 + v20;
  uint64_t v22 = (char *)v9 + v20;
  uint64_t v23 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v23);
  int v25 = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23);
  if (EnumTagSinglePayload)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v26 = *(void *)(v23 - 8);
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v23);
LABEL_6:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v21, v22, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v21, v22, v23);
LABEL_7:
  *((unsigned char *)v8 + v15[15]) = *((unsigned char *)v9 + v15[15]);
  uint64_t v28 = v15[16];
  id v29 = (void *)((char *)v8 + v28);
  uint64_t v30 = (void *)((char *)v9 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *id v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = v15[17];
  uint64_t v34 = (void *)((char *)v8 + v33);
  uint64_t v35 = (void *)((char *)v9 + v33);
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  void *v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  *((unsigned char *)v8 + v15[18]) = *((unsigned char *)v9 + v15[18]);
  uint64_t v38 = v15[19];
  uint64_t v39 = (void *)((char *)v8 + v38);
  uint64_t v40 = (void *)((char *)v9 + v38);
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  void *v39 = v42;
  v39[1] = v41;
  swift_bridgeObjectRelease();
  uint64_t v43 = v15[20];
  uint64_t v44 = (void *)((char *)v8 + v43);
  uint64_t v45 = (void *)((char *)v9 + v43);
  uint64_t v47 = *v45;
  uint64_t v46 = v45[1];
  *uint64_t v44 = v47;
  v44[1] = v46;
  swift_bridgeObjectRelease();
  uint64_t v48 = v15[21];
  uint64_t v49 = (void *)((char *)v8 + v48);
  uint64_t v50 = (void *)((char *)v9 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  void *v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  uint64_t v53 = v15[22];
  uint64_t v54 = (void *)((char *)v8 + v53);
  uint64_t v55 = (void *)((char *)v9 + v53);
  uint64_t v57 = *v55;
  uint64_t v56 = v55[1];
  *uint64_t v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  uint64_t v58 = v15[23];
  long long v59 = (void *)((char *)v8 + v58);
  uint64_t v60 = (void *)((char *)v9 + v58);
  uint64_t v62 = *v60;
  uint64_t v61 = v60[1];
  *long long v59 = v62;
  v59[1] = v61;
  swift_bridgeObjectRelease();
  uint64_t v63 = v15[24];
  uint64_t v64 = (void *)((char *)v8 + v63);
  uint64_t v65 = (void *)((char *)v9 + v63);
  uint64_t v67 = *v65;
  uint64_t v66 = v65[1];
  *uint64_t v64 = v67;
  v64[1] = v66;
  swift_bridgeObjectRelease();
  uint64_t v68 = v15[25];
  uint64_t v69 = (void *)((char *)v8 + v68);
  uint64_t v70 = (void *)((char *)v9 + v68);
  uint64_t v72 = *v70;
  uint64_t v71 = v70[1];
  void *v69 = v72;
  v69[1] = v71;
  swift_bridgeObjectRelease();
  uint64_t v73 = v15[26];
  uint64_t v74 = (void *)((char *)v8 + v73);
  uint64_t v75 = (void *)((char *)v9 + v73);
  uint64_t v77 = *v75;
  uint64_t v76 = v75[1];
  *uint64_t v74 = v77;
  v74[1] = v76;
  swift_bridgeObjectRelease();
  uint64_t v78 = v15[27];
  id v79 = (void *)((char *)v8 + v78);
  uint64_t v80 = (void *)((char *)v9 + v78);
  uint64_t v82 = *v80;
  uint64_t v81 = v80[1];
  *id v79 = v82;
  v79[1] = v81;
  swift_bridgeObjectRelease();
  uint64_t v83 = v15[28];
  uint64_t v84 = (void *)((char *)v8 + v83);
  uint64_t v85 = (void *)((char *)v9 + v83);
  uint64_t v87 = *v85;
  uint64_t v86 = v85[1];
  *uint64_t v84 = v87;
  v84[1] = v86;
  swift_bridgeObjectRelease();
  uint64_t v88 = v15[29];
  uint64_t v89 = (void *)((char *)v8 + v88);
  uint64_t v90 = (void *)((char *)v9 + v88);
  uint64_t v92 = *v90;
  uint64_t v91 = v90[1];
  *uint64_t v89 = v92;
  v89[1] = v91;
  swift_bridgeObjectRelease();
  uint64_t v93 = v15[30];
  id v94 = (void *)((char *)v8 + v93);
  uint64_t v95 = (void *)((char *)v9 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  *id v94 = v97;
  v94[1] = v96;
  swift_bridgeObjectRelease();
  uint64_t v98 = v15[31];
  uint64_t v99 = (void *)((char *)v8 + v98);
  uint64_t v100 = (void *)((char *)v9 + v98);
  uint64_t v102 = *v100;
  uint64_t v101 = v100[1];
  *uint64_t v99 = v102;
  v99[1] = v101;
  swift_bridgeObjectRelease();
  uint64_t v103 = v15[32];
  uint64_t v104 = (void *)((char *)v8 + v103);
  uint64_t v105 = (void *)((char *)v9 + v103);
  uint64_t v107 = *v105;
  uint64_t v106 = v105[1];
  *uint64_t v104 = v107;
  v104[1] = v106;
  swift_bridgeObjectRelease();
  uint64_t v108 = v15[33];
  uint64_t v109 = (void *)((char *)v8 + v108);
  uint64_t v110 = (void *)((char *)v9 + v108);
  uint64_t v112 = *v110;
  uint64_t v111 = v110[1];
  *uint64_t v109 = v112;
  v109[1] = v111;
  swift_bridgeObjectRelease();
  uint64_t v113 = a3[7];
  long long v114 = *(void **)(a1 + v113);
  *(void *)(a1 + v113) = *(void *)(a2 + v113);

  uint64_t v115 = a3[8];
  uint64_t v116 = (void *)(a1 + v115);
  uint64_t v117 = (uint64_t *)(a2 + v115);
  uint64_t v119 = *v117;
  uint64_t v118 = v117[1];
  *uint64_t v116 = v119;
  v116[1] = v118;
  swift_bridgeObjectRelease();
  uint64_t v120 = a3[9];
  uint64_t v121 = (void *)(a1 + v120);
  uint64_t v122 = (uint64_t *)(a2 + v120);
  uint64_t v124 = *v122;
  uint64_t v123 = v122[1];
  *uint64_t v121 = v124;
  v121[1] = v123;
  swift_bridgeObjectRelease();
  uint64_t v125 = a3[10];
  v126 = (void *)(a1 + v125);
  v127 = (uint64_t *)(a2 + v125);
  uint64_t v129 = *v127;
  uint64_t v128 = v127[1];
  void *v126 = v129;
  v126[1] = v128;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  if (a1 != a2)
  {
    uint64_t v130 = a3[12];
    v131 = (void *)(a1 + v130);
    v132 = (const void *)(a2 + v130);
    sub_25CF0F5D4(a1 + v130, &qword_26A62ED50);
    uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v134 = sub_25CF43138();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v134 - 8) + 32))(v131, v132, v134);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v131, v132, *(void *)(*(void *)(v133 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF0ED28);
}

uint64_t sub_25CF0ED28(uint64_t a1, uint64_t a2, int *a3)
{
  type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[6];
LABEL_8:
    return __swift_getEnumTagSinglePayload(a1 + v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v9 = a3[12];
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + a3[7]);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageDetailView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF0EDF0);
}

void sub_25CF0EDF0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a4[6];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[7]) = (a2 - 1);
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v11 = a4[12];
  }
  __swift_storeEnumTagSinglePayload(a1 + v11, a2, a2, v10);
}

void sub_25CF0EEA0()
{
  type metadata accessor for WidgetMessage();
  if (v0 <= 0x3F)
  {
    sub_25CF0EF9C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25CF0EF9C()
{
  if (!qword_26A62F248)
  {
    sub_25CF43138();
    unint64_t v0 = sub_25CF43148();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A62F248);
    }
  }
}

unint64_t sub_25CF0EFF8()
{
  unint64_t result = qword_26A62F250;
  if (!qword_26A62F250)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F258);
    sub_25CEFDA10(&qword_26A62F200, &qword_26A62F1E0);
    sub_25CEFDA10(&qword_26A62F208, &qword_26A62F1D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F250);
  }
  return result;
}

uint64_t sub_25CF0F0BC()
{
  uint64_t v0 = type metadata accessor for MessageDetailView();
  OUTLINED_FUNCTION_0_0(v0);
  uint64_t v2 = (id *)OUTLINED_FUNCTION_6_0(*(unsigned __int8 *)(v1 + 80));
  return sub_25CF0CA14(v2);
}

uint64_t sub_25CF0F0F4()
{
  return sub_25CF439A8();
}

uint64_t sub_25CF0F174()
{
  return sub_25CF0F0F4();
}

uint64_t sub_25CF0F188()
{
  return sub_25CF0F174();
}

unint64_t sub_25CF0F1A4()
{
  unint64_t result = qword_26A62F2B0;
  if (!qword_26A62F2B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F280);
    sub_25CF0F244();
    sub_25CEFDA10(&qword_26A62F2C8, &qword_26A62F2A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F2B0);
  }
  return result;
}

unint64_t sub_25CF0F244()
{
  unint64_t result = qword_26A62F2B8;
  if (!qword_26A62F2B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F278);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F268);
    sub_25CEFDA10(&qword_26A62F298, &qword_26A62F268);
    swift_getOpaqueTypeConformance2();
    sub_25CEFDA10(&qword_26A62F2C0, &qword_26A62F2A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F2B8);
  }
  return result;
}

uint64_t sub_25CF0F348()
{
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_25CF0F360(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_25CF0F370()
{
  unint64_t result = qword_26A62F2E8;
  if (!qword_26A62F2E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F2E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F2E8);
  }
  return result;
}

uint64_t sub_25CF0F3E4@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF0C0D0(*(void *)(v1 + 16), a1);
}

uint64_t sub_25CF0F3EC()
{
  sub_25CF0F360(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25CF0F430(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF0F478(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_11_0();
  v5(v4);
  return a2;
}

uint64_t sub_25CF0F4CC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  v4(v3);
  return a1;
}

uint64_t sub_25CF0F51C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF0F584(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_11_0();
  v5(v4);
  return a2;
}

uint64_t sub_25CF0F5D4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  v4(v3);
  return a1;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = type metadata accessor for MessageDetailView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for WidgetMessage();
  uint64_t v7 = v5 + *(int *)(v6 + 36);
  sub_25CF42AD8();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v8 + 8))(v7);
  uint64_t v9 = v5 + *(int *)(v6 + 56);
  uint64_t v10 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25CF43138();
    OUTLINED_FUNCTION_2();
    uint64_t v11 = OUTLINED_FUNCTION_10_0();
    v12(v11);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF0F8D8()
{
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_25CF0F8F0()
{
  uint64_t v0 = type metadata accessor for MessageDetailView();
  OUTLINED_FUNCTION_0_0(v0);
  uint64_t v2 = (id *)OUTLINED_FUNCTION_6_0(*(unsigned __int8 *)(v1 + 80));
  return sub_25CF0CB74(v2);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_25CF0F8F0();
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(uint64_t a1@<X8>)
{
  return v1 + ((a1 + 16) & ~a1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_25CF43518();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0;
}

uint64_t *sub_25CF0F9F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 1;
    unint64_t v9 = a2[2];
    swift_bridgeObjectRetain();
    uint64_t v49 = a3;
    if (v9 >= 6)
    {
      a1[1] = *v8;
      a1[2] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)(a1 + 1) = *(_OWORD *)v8;
    }
    uint64_t v10 = (int *)type metadata accessor for WidgetMailbox();
    uint64_t v11 = v10[6];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_25CF42AA8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    uint64_t v16 = v10[7];
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v50 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v50;
    uint64_t v19 = v10[8];
    uint64_t v20 = (uint64_t *)((char *)a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v10[9];
    uint64_t v24 = (uint64_t *)((char *)a1 + v23);
    int v25 = (uint64_t *)((char *)a2 + v23);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = v10[10];
    uint64_t v28 = (uint64_t *)((char *)a1 + v27);
    id v29 = (uint64_t *)((char *)a2 + v27);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = v10[11];
    uint64_t v32 = (uint64_t *)((char *)a1 + v31);
    uint64_t v33 = (uint64_t *)((char *)a2 + v31);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = v10[12];
    uint64_t v36 = (uint64_t *)((char *)a1 + v35);
    uint64_t v37 = (uint64_t *)((char *)a2 + v35);
    uint64_t v38 = v37[1];
    void *v36 = *v37;
    v36[1] = v38;
    uint64_t v39 = *(int *)(type metadata accessor for Snapshot() + 20);
    uint64_t v40 = (char *)a1 + v39;
    uint64_t v41 = (char *)a2 + v39;
    unint64_t v42 = *(uint64_t *)((char *)a2 + v39);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v42 >= 2)
    {
      uint64_t v43 = *((void *)v41 + 1);
      *(void *)uint64_t v40 = v42;
      *((void *)v40 + 1) = v43;
      *((_WORD *)v40 + 8) = *((_WORD *)v41 + 8);
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
      *((_WORD *)v40 + 8) = *((_WORD *)v41 + 8);
    }
    uint64_t v44 = *(int *)(v49 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(v49 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v49 + 20));
    uint64_t v45 = (uint64_t *)((char *)a1 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v47 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
    }
    else
    {
      *uint64_t v45 = *v46;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25CF0FD1C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16) >= 6uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(type metadata accessor for WidgetMailbox() + 24);
  uint64_t v5 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + *(int *)(type metadata accessor for Snapshot() + 20)) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25CF43138();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

void *sub_25CF0FEE8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2 + 1;
  unint64_t v7 = a2[2];
  swift_bridgeObjectRetain();
  uint64_t v47 = a3;
  if (v7 >= 6)
  {
    a1[1] = *v6;
    a1[2] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v6;
  }
  uint64_t v8 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v9 = v8[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  uint64_t v14 = v8[7];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v48 = v16[1];
  void *v15 = *v16;
  v15[1] = v48;
  uint64_t v17 = v8[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = v8[9];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = v8[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = v8[11];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (void *)((char *)a2 + v29);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  uint64_t v33 = v8[12];
  uint64_t v34 = (void *)((char *)a1 + v33);
  uint64_t v35 = (void *)((char *)a2 + v33);
  uint64_t v36 = v35[1];
  void *v34 = *v35;
  v34[1] = v36;
  uint64_t v37 = *(int *)(type metadata accessor for Snapshot() + 20);
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  unint64_t v40 = *(void *)((char *)a2 + v37);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v40 >= 2)
  {
    uint64_t v41 = *((void *)v39 + 1);
    *(void *)uint64_t v38 = v40;
    *((void *)v38 + 1) = v41;
    *((_WORD *)v38 + 8) = *((_WORD *)v39 + 8);
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
    *((_WORD *)v38 + 8) = *((_WORD *)v39 + 8);
  }
  uint64_t v42 = *(int *)(v47 + 24);
  *(void *)((char *)a1 + *(int *)(v47 + 20)) = *(void *)((char *)a2 + *(int *)(v47 + 20));
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v45 = sub_25CF43138();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
  }
  else
  {
    void *v43 = *v44;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_25CF101C4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = a2[2];
  if (a1[2] < 6uLL)
  {
    if (v6 >= 6)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 < 6)
  {
    sub_25CEFDA54((uint64_t)(a1 + 1), &qword_26A62F328);
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  unint64_t v7 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_13:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_14:
  uint64_t v16 = v7[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = v7[8];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = v7[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  void *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = v7[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = v7[11];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (void *)((char *)a2 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = v7[12];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = *(int *)(type metadata accessor for Snapshot() + 20);
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  unint64_t v37 = *(void *)((char *)a2 + v34);
  if (*(void *)((char *)a1 + v34) >= 2uLL)
  {
    if (v37 >= 2)
    {
      *(void *)uint64_t v35 = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v41 = *((void *)v36 + 1);
      v35[16] = v36[16];
      *((void *)v35 + 1) = v41;
      v35[17] = v36[17];
    }
    else
    {
      sub_25CEFDA54((uint64_t)a1 + v34, &qword_26A62F330);
      __int16 v39 = *((_WORD *)v36 + 8);
      *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
      *((_WORD *)v35 + 8) = v39;
    }
  }
  else if (v37 >= 2)
  {
    *(void *)uint64_t v35 = v37;
    uint64_t v40 = *((void *)v36 + 1);
    v35[16] = v36[16];
    *((void *)v35 + 1) = v40;
    v35[17] = v36[17];
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v38 = *(_OWORD *)v36;
    *((_WORD *)v35 + 8) = *((_WORD *)v36 + 8);
    *(_OWORD *)uint64_t v35 = v38;
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v42 = *(int *)(a3 + 24);
    uint64_t v43 = (void *)((char *)a1 + v42);
    uint64_t v44 = (void *)((char *)a2 + v42);
    sub_25CEFDA54((uint64_t)a1 + v42, &qword_26A62ED50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v45 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
    }
    else
    {
      void *v43 = *v44;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25CF1064C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  unint64_t v6 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v7 = v6[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + v6[7]) = *(_OWORD *)(a2 + v6[7]);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  *(_OWORD *)(a1 + v6[9]) = *(_OWORD *)(a2 + v6[9]);
  *(_OWORD *)(a1 + v6[10]) = *(_OWORD *)(a2 + v6[10]);
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(_OWORD *)(a1 + v6[12]) = *(_OWORD *)(a2 + v6[12]);
  uint64_t v12 = *(int *)(type metadata accessor for Snapshot() + 20);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  uint64_t v15 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_25CF43138();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  return a1;
}

uint64_t sub_25CF10864(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRelease();
  unint64_t v6 = a2 + 1;
  if (*(void *)(a1 + 16) < 6uLL) {
    goto LABEL_4;
  }
  unint64_t v7 = a2[2];
  if (v7 < 6)
  {
    sub_25CEFDA54(a1 + 8, &qword_26A62F328);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v6;
    goto LABEL_6;
  }
  *(void *)(a1 + 8) = *(void *)v6;
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v8 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v9 = v8[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
LABEL_11:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_12:
  uint64_t v17 = v8[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v8[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  void *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = v8[9];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = v8[10];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)((char *)a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *uint64_t v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = v8[11];
  long long v38 = (void *)(a1 + v37);
  __int16 v39 = (void *)((char *)a2 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  *long long v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  uint64_t v42 = v8[12];
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  uint64_t v46 = *v44;
  uint64_t v45 = v44[1];
  void *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  uint64_t v47 = *(int *)(type metadata accessor for Snapshot() + 20);
  uint64_t v48 = a1 + v47;
  uint64_t v49 = (char *)a2 + v47;
  if (*(void *)(a1 + v47) < 2uLL)
  {
LABEL_15:
    *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
    *(_WORD *)(v48 + 16) = *((_WORD *)v49 + 8);
    goto LABEL_17;
  }
  if (*(void *)v49 < 2uLL)
  {
    sub_25CEFDA54(v48, &qword_26A62F330);
    goto LABEL_15;
  }
  *(void *)uint64_t v48 = *(void *)v49;
  swift_bridgeObjectRelease();
  *(void *)(v48 + 8) = *((void *)v49 + 1);
  *(unsigned char *)(v48 + 16) = v49[16];
  *(unsigned char *)(v48 + 17) = v49[17];
LABEL_17:
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  if ((void *)a1 != a2)
  {
    uint64_t v50 = *(int *)(a3 + 24);
    uint64_t v51 = (void *)(a1 + v50);
    uint64_t v52 = (char *)a2 + v50;
    sub_25CEFDA54(a1 + v50, &qword_26A62ED50);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v54 = sub_25CF43138();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(v51, v52, v54);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v51, v52, *(void *)(*(void *)(v53 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25CF10C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF10C28);
}

uint64_t sub_25CF10C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Snapshot();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_25CF10CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF10CF0);
}

void sub_25CF10CF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for Snapshot();
  OUTLINED_FUNCTION_1_0();
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for MessageListHeaderView()
{
  uint64_t result = qword_26A62F338;
  if (!qword_26A62F338) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25CF10DE8()
{
  type metadata accessor for Snapshot();
  if (v0 <= 0x3F)
  {
    sub_25CF0EF9C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_25CF10EBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF10ED8()
{
  uint64_t v0 = sub_25CF43138();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  type metadata accessor for MessageListHeaderView();
  sub_25CF2F1F8((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v6, *MEMORY[0x263F184F8], v0);
  char v9 = sub_25CF43128();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v6, v0);
  v10(v8, v0);
  if (v9) {
    return sub_25CF43948();
  }
  else {
    return sub_25CF43928();
  }
}

id sub_25CF11004()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  objc_msgSend(v0, sel_setNumberStyle_, 1);
  id result = objc_msgSend(v0, sel_setUsesSignificantDigits_, 0);
  qword_26A62F320 = (uint64_t)v0;
  return result;
}

uint64_t sub_25CF11068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F348);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F350);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_3();
  uint64_t v41 = v6;
  uint64_t v7 = type metadata accessor for MessageListHeaderView();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v36 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F358);
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_3();
  uint64_t v37 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  MEMORY[0x270FA5388](v12 - 8);
  int v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25CF42AA8();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v34 - v22;
  uint64_t v24 = type metadata accessor for WidgetMailbox();
  sub_25CEFDAA8(v1 + *(int *)(v24 + 24), (uint64_t)v14, &qword_26A62F228);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_25CEFDA54((uint64_t)v14, &qword_26A62F228);
    *(void *)uint64_t v4 = sub_25CF43438();
    *((void *)v4 + 1) = 0x4018000000000000;
    v4[16] = 0;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F360);
    sub_25CF115B4(v1, (uint64_t)&v4[*(int *)(v25 + 44)]);
    sub_25CEFDAA8((uint64_t)v4, v41, &qword_26A62F348);
    swift_storeEnumTagMultiPayload();
    sub_25CEFDA10(&qword_26A62F368, &qword_26A62F358);
    sub_25CEFDA10(&qword_26A62F370, &qword_26A62F348);
    sub_25CF43518();
    return sub_25CEFDA54((uint64_t)v4, &qword_26A62F348);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v23, v14, v15);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v21, v23, v15);
    uint64_t v27 = v1;
    uint64_t v28 = v36;
    sub_25CF11BC8(v27, v36);
    unint64_t v29 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    uint64_t v30 = swift_allocObject();
    sub_25CF11E1C(v28, v30 + v29);
    sub_25CEFDA10(&qword_26A62F370, &qword_26A62F348);
    uint64_t v31 = v37;
    sub_25CF43778();
    swift_release();
    uint64_t v32 = v38;
    uint64_t v33 = v40;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v41, v31, v40);
    swift_storeEnumTagMultiPayload();
    sub_25CEFDA10(&qword_26A62F368, &qword_26A62F358);
    sub_25CF43518();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v23, v15);
  }
}

uint64_t sub_25CF11564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_25CF43438();
  *(void *)(a2 + 8) = 0x4018000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F360);
  return sub_25CF115B4(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_25CF115B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F378);
  MEMORY[0x270FA5388](v72);
  uint64_t v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25CF43288();
  uint64_t v74 = *(void *)(v6 - 8);
  uint64_t v75 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F380);
  MEMORY[0x270FA5388](v82);
  uint64_t v73 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F388);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v76 = (uint64_t)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int v14 = (char *)&v62 - v13;
  uint64_t v83 = sub_25CF3CF6C();
  uint64_t v84 = v15;
  sub_25CEFDB04();
  uint64_t v16 = sub_25CF437D8();
  uint64_t v80 = v17;
  uint64_t v81 = v16;
  int v77 = v18;
  uint64_t v20 = v19;
  uint64_t KeyPath = swift_getKeyPath();
  sub_25CF436E8();
  sub_25CF436B8();
  uint64_t v79 = sub_25CF43708();
  swift_release();
  uint64_t v22 = swift_getKeyPath();
  uint64_t v78 = sub_25CF10ED8();
  uint64_t v23 = a1 + *(int *)(type metadata accessor for Snapshot() + 20);
  uint64_t v24 = 1;
  if (*(void *)v23 >= 2uLL && (*(_WORD *)(v23 + 16) & 1) == 0 && *(uint64_t *)(v23 + 8) >= 1)
  {
    uint64_t v67 = v8;
    uint64_t v68 = (uint64_t *)v5;
    uint64_t v70 = KeyPath;
    uint64_t v71 = v20;
    if (qword_26A62ED20 != -1) {
      swift_once();
    }
    uint64_t v25 = (void *)qword_26A62F320;
    uint64_t v26 = (void *)sub_25CF43E08();
    id v27 = objc_msgSend(v25, sel_stringForObjectValue_, v26);

    if (v27)
    {
      uint64_t v28 = sub_25CF43D88();
      uint64_t v30 = v29;

      uint64_t v83 = v28;
      uint64_t v84 = v30;
      uint64_t v31 = sub_25CF437D8();
      uint64_t v33 = v32;
      LOBYTE(v30) = v34 & 1;
      type metadata accessor for MessageListHeaderView();
      uint64_t v35 = sub_25CF437B8();
      uint64_t v63 = v36;
      char v38 = v37 & 1;
      sub_25CF0F360(v31, v33, v30);
      swift_bridgeObjectRelease();
      sub_25CF43958();
      uint64_t v39 = v35;
      uint64_t v40 = v63;
      uint64_t v69 = sub_25CF43798();
      uint64_t v66 = v41;
      LOBYTE(v28) = v42;
      uint64_t v65 = v43;
      swift_release();
      int v44 = v28 & 1;
      sub_25CF0F360(v39, v40, v38);
      swift_bridgeObjectRelease();
      uint64_t v45 = v67;
      sub_25CF43278();
      uint64_t v46 = swift_getKeyPath();
      uint64_t v47 = v68;
      uint64_t v48 = v74;
      uint64_t v49 = v75;
      (*(void (**)(char *, char *, uint64_t))(v74 + 16))((char *)v68 + *(int *)(v72 + 28), v45, v75);
      *uint64_t v47 = v46;
      uint64_t v50 = (uint64_t)v73;
      sub_25CEFDAA8((uint64_t)v47, (uint64_t)&v73[*((int *)v82 + 9)], &qword_26A62F378);
      uint64_t v51 = v69;
      uint64_t v52 = v66;
      *(void *)uint64_t v50 = v69;
      *(void *)(v50 + 8) = v52;
      char v53 = v44;
      int v64 = v44;
      *(unsigned char *)(v50 + 16) = v44;
      *(void *)(v50 + 24) = v65;
      uint64_t v54 = v52;
      sub_25CF11FC8(v51, v52, v53);
      swift_bridgeObjectRetain();
      sub_25CEFDA54((uint64_t)v47, &qword_26A62F378);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v49);
      sub_25CF0F360(v69, v54, v64);
      swift_bridgeObjectRelease();
      sub_25CF12000(v50, (uint64_t)v14);
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 1;
    }
    uint64_t KeyPath = v70;
    uint64_t v20 = v71;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v14, v24, 1, (uint64_t)v82);
  char v55 = v77 & 1;
  uint64_t v56 = v76;
  sub_25CEFDAA8((uint64_t)v14, v76, &qword_26A62F388);
  uint64_t v58 = v80;
  uint64_t v57 = v81;
  *(void *)a2 = v81;
  *(void *)(a2 + 8) = v58;
  *(unsigned char *)(a2 + 16) = v55;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = KeyPath;
  *(void *)(a2 + 40) = 1;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = v22;
  uint64_t v82 = v14;
  uint64_t v59 = v78;
  *(void *)(a2 + 64) = v79;
  *(void *)(a2 + 72) = v59;
  *(void *)(a2 + 80) = 0x3FE999999999999ALL;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F390);
  sub_25CEFDAA8(v56, a2 + *(int *)(v60 + 64), &qword_26A62F388);
  sub_25CF11FC8(v57, v58, v55);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25CEFDA54((uint64_t)v82, &qword_26A62F388);
  sub_25CEFDA54(v56, &qword_26A62F388);
  sub_25CF0F360(v57, v58, v55);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF11BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF11C2C()
{
  uint64_t v1 = type metadata accessor for MessageListHeaderView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v3 + 16) >= 6uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = v5 + *(int *)(type metadata accessor for WidgetMailbox() + 24);
  uint64_t v7 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  if (*(void *)(v5 + *(int *)(type metadata accessor for Snapshot() + 20)) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_release();
  uint64_t v8 = v5 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25CF43138();
    OUTLINED_FUNCTION_2();
    (*(void (**)(uint64_t))(v9 + 8))(v8);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF11E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF11E80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MessageListHeaderView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25CF11564(v4, a1);
}

uint64_t sub_25CF11EF0(uint64_t a1)
{
  uint64_t v2 = sub_25CF43288();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25CF43348();
}

uint64_t sub_25CF11FC8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25CF11FD8()
{
  return sub_25CF43338();
}

uint64_t sub_25CF12000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25CF1206C()
{
  unint64_t result = qword_26A62F398;
  if (!qword_26A62F398)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F3A0);
    sub_25CEFDA10(&qword_26A62F368, &qword_26A62F358);
    sub_25CEFDA10(&qword_26A62F370, &qword_26A62F348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F398);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF12148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_25CF42C28();
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

uint64_t sub_25CF121F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for WidgetMessage();
  uint64_t v6 = v5;
  if (v4)
  {
    sub_25CF176E0(a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), a2, (void (*)(void))type metadata accessor for WidgetMessage);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_25CF122AC()
{
  uint64_t v3 = &type metadata for Features;
  unint64_t v4 = sub_25CF0911C();
  v2[0] = 2;
  char v0 = sub_25CF42BD8();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  byte_26A62F3A8 = v0 & 1;
  return result;
}

uint64_t MessageListView.init(mode:messages:numberOfSummaryLines:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v75 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F3B0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v83 = (uint64_t)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_2();
  uint64_t v82 = v10;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_2();
  uint64_t v81 = v12;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_2();
  uint64_t v80 = v14;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_5_2();
  uint64_t v79 = v16;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5_2();
  uint64_t v78 = v18;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_5_2();
  uint64_t v77 = v20;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_5_2();
  uint64_t v76 = v22;
  OUTLINED_FUNCTION_4();
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v74 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v74 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v74 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v74 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  char v38 = (char *)&v74 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&v74 - v39;
  sub_25CF43D18();
  sub_25CF16D88((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  *(void *)a4 = sub_25CF432A8();
  *(void *)(a4 + 8) = v41;
  char v42 = (uint64_t *)(a4 + *(int *)(type metadata accessor for MessageListView() + 88));
  *char v42 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  swift_storeEnumTagMultiPayload();
  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_25CF121F0(a2, (uint64_t)v40);
  uint64_t v43 = (int *)type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_0_1((uint64_t)v40);
  if (v44)
  {
    swift_bridgeObjectRetain();
    sub_25CF0F5D4((uint64_t)v40, &qword_26A62F3B0);
    char v45 = 0;
  }
  else
  {
    char v45 = v40[v43[18]];
    swift_bridgeObjectRetain();
    sub_25CF17690((uint64_t)v40, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(unsigned char *)(a4 + 32) = v45;
  sub_25CF121F0(a2, (uint64_t)v38);
  OUTLINED_FUNCTION_0_1((uint64_t)v38);
  if (v44)
  {
    sub_25CF0F5D4((uint64_t)v38, &qword_26A62F3B0);
    char v46 = 0;
  }
  else
  {
    char v46 = v38[v43[15]];
    sub_25CF17690((uint64_t)v38, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(unsigned char *)(a4 + 33) = v46;
  *(void *)(a4 + 40) = v75;
  sub_25CF121F0(a2, (uint64_t)v35);
  OUTLINED_FUNCTION_0_1((uint64_t)v35);
  if (v44)
  {
    sub_25CF0F5D4((uint64_t)v35, &qword_26A62F3B0);
    uint64_t v49 = 0;
    unint64_t v48 = 0xE000000000000000;
  }
  else
  {
    uint64_t v47 = &v35[v43[22]];
    uint64_t v49 = *(void *)v47;
    unint64_t v48 = *((void *)v47 + 1);
    swift_bridgeObjectRetain();
    sub_25CF17690((uint64_t)v35, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  uint64_t v50 = v76;
  *(void *)(a4 + 48) = v49;
  *(void *)(a4 + 56) = v48;
  sub_25CF121F0(a2, (uint64_t)v32);
  OUTLINED_FUNCTION_0_1((uint64_t)v32);
  if (v44)
  {
    sub_25CF0F5D4((uint64_t)v32, &qword_26A62F3B0);
    uint64_t v53 = 0;
    unint64_t v52 = 0xE000000000000000;
  }
  else
  {
    uint64_t v51 = &v32[v43[23]];
    uint64_t v53 = *(void *)v51;
    unint64_t v52 = *((void *)v51 + 1);
    swift_bridgeObjectRetain();
    sub_25CF17690((uint64_t)v32, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  uint64_t v54 = v78;
  *(void *)(a4 + 64) = v53;
  *(void *)(a4 + 72) = v52;
  sub_25CF121F0(a2, (uint64_t)v29);
  OUTLINED_FUNCTION_0_1((uint64_t)v29);
  if (v44)
  {
    sub_25CF0F5D4((uint64_t)v29, &qword_26A62F3B0);
    uint64_t v57 = 0;
    unint64_t v56 = 0xE000000000000000;
  }
  else
  {
    char v55 = &v29[v43[24]];
    uint64_t v57 = *(void *)v55;
    unint64_t v56 = *((void *)v55 + 1);
    swift_bridgeObjectRetain();
    sub_25CF17690((uint64_t)v29, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  uint64_t v58 = v79;
  *(void *)(a4 + 80) = v57;
  *(void *)(a4 + 88) = v56;
  sub_25CF121F0(a2, (uint64_t)v26);
  OUTLINED_FUNCTION_0_1((uint64_t)v26);
  if (v44)
  {
    sub_25CF0F5D4((uint64_t)v26, &qword_26A62F3B0);
    uint64_t v61 = 0;
    unint64_t v60 = 0xE000000000000000;
  }
  else
  {
    uint64_t v59 = &v26[v43[25]];
    uint64_t v61 = *(void *)v59;
    unint64_t v60 = *((void *)v59 + 1);
    swift_bridgeObjectRetain();
    sub_25CF17690((uint64_t)v26, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  uint64_t v62 = v80;
  *(void *)(a4 + 96) = v61;
  *(void *)(a4 + 104) = v60;
  sub_25CF121F0(a2, v50);
  OUTLINED_FUNCTION_0_1(v50);
  if (v44)
  {
    sub_25CF0F5D4(v50, &qword_26A62F3B0);
    uint64_t v65 = 0;
    unint64_t v64 = 0xE000000000000000;
  }
  else
  {
    uint64_t v63 = (uint64_t *)(v50 + v43[26]);
    uint64_t v65 = *v63;
    unint64_t v64 = v63[1];
    swift_bridgeObjectRetain();
    sub_25CF17690(v50, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  uint64_t v66 = v81;
  *(void *)(a4 + 112) = v65;
  *(void *)(a4 + 120) = v64;
  uint64_t v67 = v77;
  sub_25CF121F0(a2, v77);
  OUTLINED_FUNCTION_0_1(v67);
  if (v44)
  {
    sub_25CF0F5D4(v67, &qword_26A62F3B0);
    OUTLINED_FUNCTION_7_2();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    sub_25CF17690(v67, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  uint64_t v68 = v82;
  *(void *)(a4 + 128) = v64;
  *(void *)(a4 + 136) = v50;
  sub_25CF121F0(a2, v54);
  OUTLINED_FUNCTION_0_1(v54);
  if (v44)
  {
    sub_25CF0F5D4(v54, &qword_26A62F3B0);
    OUTLINED_FUNCTION_7_2();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    sub_25CF17690(v54, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(void *)(a4 + 144) = v64;
  *(void *)(a4 + 152) = v50;
  sub_25CF121F0(a2, v58);
  OUTLINED_FUNCTION_0_1(v58);
  if (v44)
  {
    sub_25CF0F5D4(v58, &qword_26A62F3B0);
    OUTLINED_FUNCTION_7_2();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    sub_25CF17690(v58, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(void *)(a4 + 160) = v64;
  *(void *)(a4 + 168) = v50;
  sub_25CF121F0(a2, v62);
  OUTLINED_FUNCTION_0_1(v62);
  if (v44)
  {
    sub_25CF0F5D4(v62, &qword_26A62F3B0);
    OUTLINED_FUNCTION_7_2();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    sub_25CF17690(v62, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(void *)(a4 + 176) = v64;
  *(void *)(a4 + 184) = v50;
  sub_25CF121F0(a2, v66);
  OUTLINED_FUNCTION_0_1(v66);
  if (v44)
  {
    sub_25CF0F5D4(v66, &qword_26A62F3B0);
    OUTLINED_FUNCTION_7_2();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    sub_25CF17690(v66, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(void *)(a4 + 192) = v64;
  *(void *)(a4 + 200) = v50;
  sub_25CF121F0(a2, v68);
  OUTLINED_FUNCTION_0_1(v68);
  if (v44)
  {
    sub_25CF0F5D4(v68, &qword_26A62F3B0);
    OUTLINED_FUNCTION_7_2();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    sub_25CF17690(v68, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(void *)(a4 + 208) = v64;
  *(void *)(a4 + 216) = v50;
  uint64_t v69 = v83;
  sub_25CF121F0(a2, v83);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_1(v69);
  if (v44)
  {
    uint64_t result = sub_25CF0F5D4(v69, &qword_26A62F3B0);
    uint64_t v72 = 0;
    unint64_t v71 = 0xE000000000000000;
  }
  else
  {
    uint64_t v70 = (uint64_t *)(v69 + v43[33]);
    uint64_t v72 = *v70;
    unint64_t v71 = v70[1];
    swift_bridgeObjectRetain();
    uint64_t result = sub_25CF17690(v69, (void (*)(void))type metadata accessor for WidgetMessage);
  }
  *(void *)(a4 + 224) = v72;
  *(void *)(a4 + 232) = v71;
  return result;
}

uint64_t type metadata accessor for MessageListView()
{
  uint64_t result = qword_26A62F3C0;
  if (!qword_26A62F3C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MessageListView.body.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_25CF434E8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F3B8);
  return sub_25CF12BE8(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_25CF12BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v255 = a2;
  uint64_t v3 = sub_25CF42B98();
  MEMORY[0x270FA5388](v3 - 8);
  v216 = (char *)&v194 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v228 = sub_25CF43BC8();
  uint64_t v219 = *(void *)(v228 - 8);
  MEMORY[0x270FA5388](v228);
  v218 = (char *)&v194 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v230 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F3E0);
  uint64_t v221 = *(void *)(v230 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v230);
  v217 = (char *)&v194 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v220 = (char *)&v194 - v8;
  uint64_t v252 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F3E8);
  MEMORY[0x270FA5388](v252);
  v254 = (uint64_t *)((char *)&v194 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F3F0);
  MEMORY[0x270FA5388](v226);
  uint64_t v227 = (uint64_t)&v194 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v253 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F3F8);
  MEMORY[0x270FA5388](v253);
  v229 = (char *)&v194 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = sub_25CF43B88();
  uint64_t v205 = *(void *)(v206 - 8);
  MEMORY[0x270FA5388](v206);
  v204 = (char *)&v194 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F400);
  MEMORY[0x270FA5388](v203);
  v210 = (char *)&v194 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v224 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F408);
  uint64_t v14 = MEMORY[0x270FA5388](v224);
  uint64_t v209 = (uint64_t)&v194 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v208 = (uint64_t)&v194 - v16;
  uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F410);
  MEMORY[0x270FA5388](v202);
  v207 = (char *)&v194 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = sub_25CF43268();
  uint64_t v200 = *(void *)(v201 - 8);
  MEMORY[0x270FA5388](v201);
  v199 = (char *)&v194 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_25CF43B38();
  uint64_t v195 = *(void *)(v196 - 8);
  MEMORY[0x270FA5388](v196);
  v194 = (char *)&v194 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F418);
  uint64_t v214 = *(void *)(v215 - 8);
  MEMORY[0x270FA5388](v215);
  v213 = (char *)&v194 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F420);
  uint64_t v197 = *(void *)(v198 - 8);
  MEMORY[0x270FA5388](v198);
  v211 = (char *)&v194 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F428);
  MEMORY[0x270FA5388](v212);
  uint64_t v222 = (uint64_t)&v194 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v225 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F430);
  MEMORY[0x270FA5388](v225);
  uint64_t v223 = (uint64_t)&v194 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F438);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v251 = (uint64_t)&v194 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v259 = (uint64_t)&v194 - v27;
  uint64_t v28 = type metadata accessor for MessageListView();
  v245 = *(uint64_t (**)())(v28 - 8);
  MEMORY[0x270FA5388](v28 - 8);
  v246 = v29;
  uint64_t v256 = (uint64_t)&v194 - (((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v250 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F440);
  uint64_t v249 = *(void *)(v250 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v250);
  v248 = (char *)&v194 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  v258 = (char *)&v194 - v32;
  v240 = (void *)sub_25CF43A78();
  uint64_t v239 = *(v240 - 1);
  MEMORY[0x270FA5388](v240);
  v237 = (char *)&v194 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v238 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F448) - 8;
  MEMORY[0x270FA5388](v238);
  v236 = (char *)&v194 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F450);
  MEMORY[0x270FA5388](v241);
  unint64_t v244 = (unint64_t)&v194 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F458);
  uint64_t v36 = MEMORY[0x270FA5388](v243);
  uint64_t v247 = (uint64_t)&v194 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v242 = (uint64_t)&v194 - v39;
  MEMORY[0x270FA5388](v38);
  uint64_t v262 = (uint64_t)&v194 - v40;
  uint64_t v41 = type metadata accessor for MessageListHeaderView();
  uint64_t v42 = v41 - 8;
  MEMORY[0x270FA5388](v41);
  char v44 = (char **)((char *)&v194 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F460) - 8;
  MEMORY[0x270FA5388](v233);
  uint64_t v231 = (uint64_t)&v194 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F468) - 8;
  MEMORY[0x270FA5388](v234);
  uint64_t v232 = (uint64_t)&v194 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F470) - 8;
  uint64_t v47 = MEMORY[0x270FA5388](v235);
  uint64_t v261 = (uint64_t)&v194 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v47);
  uint64_t v260 = (uint64_t)&v194 - v49;
  uint64_t v50 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v51 = (uint64_t)v44 + v50[6];
  uint64_t v52 = sub_25CF42AA8();
  __swift_storeEnumTagSinglePayload(v51, 1, 1, v52);
  uint64_t v53 = *(void *)(a1 + 96);
  uint64_t v54 = *(void *)(a1 + 104);
  uint64_t v55 = *(void *)(a1 + 112);
  uint64_t v56 = *(void *)(a1 + 120);
  uint64_t v57 = *(void *)(a1 + 128);
  uint64_t v58 = *(void *)(a1 + 136);
  uint64_t v59 = *(void *)(a1 + 144);
  uint64_t v60 = *(void *)(a1 + 152);
  uint64_t v61 = *(void *)(a1 + 160);
  uint64_t v62 = *(void *)(a1 + 168);
  uint64_t v63 = *(void *)(a1 + 176);
  uint64_t v64 = *(void *)(a1 + 184);
  *char v44 = 0;
  v44[1] = 0;
  v44[2] = 1;
  uint64_t v65 = (void *)((char *)v44 + v50[7]);
  *uint64_t v65 = v53;
  v65[1] = v54;
  uint64_t v66 = (void *)((char *)v44 + v50[8]);
  *uint64_t v66 = v55;
  v66[1] = v56;
  uint64_t v67 = (void *)((char *)v44 + v50[9]);
  *uint64_t v67 = v57;
  v67[1] = v58;
  uint64_t v68 = (void *)((char *)v44 + v50[10]);
  *uint64_t v68 = v59;
  v68[1] = v60;
  uint64_t v69 = (void *)((char *)v44 + v50[11]);
  void *v69 = v61;
  v69[1] = v62;
  uint64_t v70 = (void *)((char *)v44 + v50[12]);
  void *v70 = v63;
  v70[1] = v64;
  uint64_t v71 = *(void *)(a1 + 24);
  uint64_t v257 = a1;
  if (*(unsigned char *)(a1 + 33)) {
    __int16 v72 = 257;
  }
  else {
    __int16 v72 = 1;
  }
  uint64_t v73 = (char *)v44 + *(int *)(type metadata accessor for Snapshot() + 20);
  *(void *)uint64_t v73 = v71;
  *((void *)v73 + 1) = 0;
  *((_WORD *)v73 + 8) = v72;
  uint64_t v74 = *(int *)(v42 + 28);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v75 = (uint64_t)v236;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)((char *)v44 + v74) = sub_25CF43748();
  uint64_t v76 = (void *)((char *)v44 + *(int *)(v42 + 32));
  *uint64_t v76 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  swift_storeEnumTagMultiPayload();
  LOBYTE(v76) = sub_25CF43638();
  uint64_t v77 = v231;
  sub_25CF176E0((uint64_t)v44, v231, (void (*)(void))type metadata accessor for MessageListHeaderView);
  uint64_t v78 = v77 + *(int *)(v233 + 44);
  *(unsigned char *)uint64_t v78 = (_BYTE)v76;
  *(_OWORD *)(v78 + 8) = 0u;
  *(_OWORD *)(v78 + 24) = 0u;
  *(unsigned char *)(v78 + 40) = 1;
  sub_25CF17690((uint64_t)v44, (void (*)(void))type metadata accessor for MessageListHeaderView);
  LOBYTE(v76) = sub_25CF43618();
  uint64_t v79 = v232;
  sub_25CF0F584(v77, v232, &qword_26A62F460);
  uint64_t v80 = v79 + *(int *)(v234 + 44);
  *(unsigned char *)uint64_t v80 = (_BYTE)v76;
  *(_OWORD *)(v80 + 8) = 0u;
  *(_OWORD *)(v80 + 24) = 0u;
  *(unsigned char *)(v80 + 40) = 1;
  sub_25CF0F5D4(v77, &qword_26A62F460);
  sub_25CF43AD8();
  sub_25CF431C8();
  uint64_t v81 = v261;
  sub_25CF0F584(v79, v261, &qword_26A62F468);
  uint64_t v82 = (_OWORD *)(v81 + *(int *)(v235 + 44));
  long long v83 = v272;
  long long v84 = v273;
  *uint64_t v82 = v271;
  v82[1] = v83;
  v82[2] = v84;
  sub_25CF0F5D4(v79, &qword_26A62F468);
  sub_25CF17788(v81, v260, &qword_26A62F470);
  uint64_t v85 = v237;
  sub_25CF43A68();
  LOBYTE(v76) = sub_25CF43638();
  uint64_t v86 = v239;
  uint64_t v87 = v240;
  (*(void (**)(uint64_t, char *, void *))(v239 + 16))(v75, v85, v240);
  uint64_t v88 = v75 + *(int *)(v238 + 44);
  *(unsigned char *)uint64_t v88 = (_BYTE)v76;
  *(_OWORD *)(v88 + 8) = 0u;
  *(_OWORD *)(v88 + 24) = 0u;
  *(unsigned char *)(v88 + 40) = 1;
  (*(void (**)(char *, void *))(v86 + 8))(v85, v87);
  char v89 = sub_25CF43618();
  if (qword_26A62ED28 != -1) {
    swift_once();
  }
  char v90 = byte_26A62F3A8;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = 0;
  if (byte_26A62F3A8 == 1)
  {
    sub_25CF430B8();
    uint64_t v92 = v96;
    uint64_t v93 = v97;
    uint64_t v94 = v98;
    uint64_t v95 = v99;
  }
  uint64_t v100 = v244;
  sub_25CF0F584(v75, v244, &qword_26A62F448);
  uint64_t v101 = v100 + *(int *)(v241 + 36);
  *(unsigned char *)uint64_t v101 = v89;
  *(void *)(v101 + 8) = v92;
  *(void *)(v101 + 16) = v93;
  *(void *)(v101 + 24) = v94;
  *(void *)(v101 + 32) = v95;
  *(unsigned char *)(v101 + 40) = v90 ^ 1;
  sub_25CF0F5D4(v75, &qword_26A62F448);
  char v102 = sub_25CF43628();
  char v103 = byte_26A62F3A8;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  uint64_t v107 = v259;
  uint64_t v108 = v257;
  uint64_t v109 = v256;
  if (byte_26A62F3A8 == 1)
  {
    sub_25CF430B8();
    uint64_t v91 = v110;
    uint64_t v104 = v111;
    uint64_t v105 = v112;
    uint64_t v106 = v113;
  }
  uint64_t v114 = v242;
  sub_25CF0F584(v100, v242, &qword_26A62F450);
  uint64_t v115 = v114 + *(int *)(v243 + 36);
  *(unsigned char *)uint64_t v115 = v102;
  *(void *)(v115 + 8) = v91;
  *(void *)(v115 + 16) = v104;
  *(void *)(v115 + 24) = v105;
  *(void *)(v115 + 32) = v106;
  *(unsigned char *)(v115 + 40) = v103 ^ 1;
  sub_25CF0F5D4(v100, &qword_26A62F450);
  sub_25CF17788(v114, v262, &qword_26A62F458);
  sub_25CF176E0(v108, v109, (void (*)(void))type metadata accessor for MessageListView);
  unint64_t v116 = (*((unsigned __int8 *)v245 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v245 + 80);
  uint64_t v117 = swift_allocObject();
  sub_25CF17734(v109, v117 + v116, (void (*)(void))type metadata accessor for MessageListView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F478);
  sub_25CF168FC();
  sub_25CF43B68();
  uint64_t v118 = *(void *)(v108 + 16);
  if (v118 == 1)
  {
    uint64_t v161 = *(void *)(v108 + 80);
    uint64_t v160 = *(void *)(v108 + 88);
    uint64_t v269 = MEMORY[0x263F8D310];
    uint64_t v270 = MEMORY[0x263F77998];
    uint64_t v267 = v161;
    uint64_t v268 = v160;
    uint64_t v266 = 0;
    long long v265 = 0u;
    long long v264 = 0u;
    swift_bridgeObjectRetain();
    sub_25CF42B78();
    v263[3] = sub_25CF43B48();
    v263[4] = MEMORY[0x263F77548];
    __swift_allocate_boxed_opaque_existential_1(v263);
    sub_25CF43B58();
    v162 = v218;
    sub_25CF43BB8();
    sub_25CF176E0(v108, v109, (void (*)(void))type metadata accessor for MessageListView);
    uint64_t v163 = swift_allocObject();
    sub_25CF17734(v109, v163 + v116, (void (*)(void))type metadata accessor for MessageListView);
    uint64_t v164 = sub_25CF16D88(&qword_26A62F4F0, MEMORY[0x263F776F0]);
    v165 = v217;
    uint64_t v166 = v228;
    sub_25CF43848();
    swift_release();
    (*(void (**)(char *, uint64_t))(v219 + 8))(v162, v166);
    uint64_t v167 = v221;
    v168 = v220;
    uint64_t v169 = v230;
    (*(void (**)(char *, char *, uint64_t))(v221 + 32))(v220, v165, v230);
    (*(void (**)(uint64_t, char *, uint64_t))(v167 + 16))(v227, v168, v169);
    swift_storeEnumTagMultiPayload();
    sub_25CF16BC4();
    uint64_t v267 = v166;
    uint64_t v268 = v164;
    swift_getOpaqueTypeConformance2();
    uint64_t v170 = (uint64_t)v229;
    sub_25CF43518();
    sub_25CF0F584(v170, (uint64_t)v254, &qword_26A62F3F8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F4C0);
    sub_25CF16AE0();
    sub_25CEFDA10(&qword_26A62F4F8, &qword_26A62F4C0);
    sub_25CF43518();
    sub_25CF0F5D4(v170, &qword_26A62F3F8);
    (*(void (**)(char *, uint64_t))(v167 + 8))(v168, v169);
  }
  else if (v118)
  {
    uint64_t v171 = sub_25CF43448();
    v172 = v254;
    uint64_t *v254 = v171;
    v172[1] = 0;
    *((unsigned char *)v172 + 16) = 1;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F4C0);
    sub_25CF16AE0();
    sub_25CEFDA10(&qword_26A62F4F8, &qword_26A62F4C0);
    sub_25CF43518();
  }
  else
  {
    uint64_t v119 = 1;
    if (*(unsigned char *)(v108 + 32) == 1)
    {
      uint64_t v120 = *(void *)(v108 + 56);
      uint64_t v267 = *(void *)(v108 + 48);
      uint64_t v268 = v120;
      v246 = type metadata accessor for MessageListView;
      sub_25CF176E0(v108, v109, (void (*)(void))type metadata accessor for MessageListView);
      uint64_t v121 = swift_allocObject();
      v245 = type metadata accessor for MessageListView;
      sub_25CF17734(v109, v121 + v116, (void (*)(void))type metadata accessor for MessageListView);
      unint64_t v244 = sub_25CEFDB04();
      swift_bridgeObjectRetain();
      uint64_t v122 = v213;
      sub_25CF43A08();
      uint64_t v123 = v195;
      uint64_t v124 = v194;
      uint64_t v125 = v196;
      (*(void (**)(char *, void, uint64_t))(v195 + 104))(v194, *MEMORY[0x263F774E0], v196);
      sub_25CEFDA10(&qword_26A62F508, &qword_26A62F418);
      uint64_t v126 = v215;
      sub_25CF43808();
      (*(void (**)(char *, uint64_t))(v123 + 8))(v124, v125);
      v127 = *(void (**)(char *, uint64_t))(v214 + 8);
      uint64_t v242 = v214 + 8;
      uint64_t v243 = (uint64_t)v127;
      v127(v122, v126);
      uint64_t v128 = v199;
      sub_25CF43258();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v130 = v222;
      v131 = (uint64_t *)(v222 + *(int *)(v212 + 36));
      uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A8);
      v132 = (char *)v131 + *(int *)(v241 + 28);
      uint64_t v133 = v200;
      v240 = *(void **)(v200 + 16);
      uint64_t v134 = v201;
      ((void (*)(char *, char *, uint64_t))v240)(v132, v128, v201);
      uint64_t *v131 = KeyPath;
      uint64_t v135 = v197;
      uint64_t v136 = v130;
      v137 = v211;
      uint64_t v138 = v198;
      (*(void (**)(uint64_t, char *, uint64_t))(v197 + 16))(v136, v211, v198);
      uint64_t v239 = *(void *)(v133 + 8);
      ((void (*)(char *, uint64_t))v239)(v128, v134);
      (*(void (**)(char *, uint64_t))(v135 + 8))(v137, v138);
      uint64_t v139 = *(void *)(v257 + 72);
      uint64_t v267 = *(void *)(v257 + 64);
      uint64_t v268 = v139;
      uint64_t v140 = v256;
      sub_25CF176E0(v257, v256, (void (*)(void))v246);
      uint64_t v141 = swift_allocObject();
      sub_25CF17734(v140, v141 + v116, (void (*)(void))v245);
      swift_bridgeObjectRetain();
      v142 = v213;
      sub_25CF43A08();
      sub_25CF43258();
      uint64_t v143 = swift_getKeyPath();
      uint64_t v144 = (uint64_t)v207;
      v145 = (uint64_t *)&v207[*(int *)(v202 + 36)];
      ((void (*)(char *, char *, uint64_t))v240)((char *)v145 + *(int *)(v241 + 28), v128, v134);
      uint64_t *v145 = v143;
      v146 = v142;
      v147 = v142;
      uint64_t v148 = v215;
      (*(void (**)(uint64_t, char *, uint64_t))(v214 + 16))(v144, v147, v215);
      ((void (*)(char *, uint64_t))v239)(v128, v134);
      ((void (*)(char *, uint64_t))v243)(v146, v148);
      sub_25CF16F20();
      uint64_t v149 = sub_25CF437E8();
      uint64_t v150 = MEMORY[0x263F1B720];
      uint64_t v151 = MEMORY[0x263F774B0];
      uint64_t v269 = MEMORY[0x263F1B720];
      uint64_t v270 = MEMORY[0x263F774B0];
      uint64_t v267 = v149;
      sub_25CF17020();
      uint64_t v152 = sub_25CF437E8();
      *((void *)&v265 + 1) = v150;
      uint64_t v266 = v151;
      *(void *)&long long v264 = v152;
      v153 = v204;
      sub_25CF43B78();
      LOBYTE(v150) = sub_25CF43638();
      uint64_t v154 = v205;
      uint64_t v155 = (uint64_t)v210;
      uint64_t v156 = v206;
      (*(void (**)(char *, char *, uint64_t))(v205 + 16))(v210, v153, v206);
      uint64_t v157 = v155 + *(int *)(v203 + 36);
      *(unsigned char *)uint64_t v157 = v150;
      *(_OWORD *)(v157 + 8) = 0u;
      *(_OWORD *)(v157 + 24) = 0u;
      *(unsigned char *)(v157 + 40) = 1;
      (*(void (**)(char *, uint64_t))(v154 + 8))(v153, v156);
      if (byte_26A62F3A8 == 1)
      {
        char v158 = sub_25CF43658();
        char v159 = sub_25CF43648();
      }
      else
      {
        unsigned __int8 v173 = sub_25CF43628();
        char v158 = sub_25CF43658();
        char v159 = sub_25CF43648();
        sub_25CF43648();
        if (sub_25CF43648() != v173) {
          char v159 = sub_25CF43648();
        }
      }
      sub_25CF43648();
      char v174 = sub_25CF43648();
      uint64_t v107 = v259;
      if (v174 != v158) {
        char v159 = sub_25CF43648();
      }
      uint64_t v175 = v209;
      sub_25CF0F584(v155, v209, &qword_26A62F400);
      uint64_t v176 = v175 + *(int *)(v224 + 36);
      *(unsigned char *)uint64_t v176 = v159;
      *(_OWORD *)(v176 + 8) = 0u;
      *(_OWORD *)(v176 + 24) = 0u;
      *(unsigned char *)(v176 + 40) = 1;
      sub_25CF0F5D4(v155, &qword_26A62F400);
      sub_25CF0F5D4(v144, &qword_26A62F410);
      sub_25CF0F5D4(v222, &qword_26A62F428);
      uint64_t v177 = v208;
      sub_25CF17788(v175, v208, &qword_26A62F408);
      sub_25CF17788(v177, v223, &qword_26A62F408);
      uint64_t v119 = 0;
    }
    uint64_t v178 = v223;
    __swift_storeEnumTagSinglePayload(v223, v119, 1, v224);
    sub_25CF0F584(v178, v227, &qword_26A62F430);
    swift_storeEnumTagMultiPayload();
    sub_25CF16BC4();
    uint64_t v179 = sub_25CF16D88(&qword_26A62F4F0, MEMORY[0x263F776F0]);
    uint64_t v267 = v228;
    uint64_t v268 = v179;
    swift_getOpaqueTypeConformance2();
    uint64_t v180 = (uint64_t)v229;
    sub_25CF43518();
    sub_25CF0F584(v180, (uint64_t)v254, &qword_26A62F3F8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F4C0);
    sub_25CF16AE0();
    sub_25CEFDA10(&qword_26A62F4F8, &qword_26A62F4C0);
    sub_25CF43518();
    sub_25CF0F5D4(v180, &qword_26A62F3F8);
    sub_25CF0F5D4(v178, &qword_26A62F430);
  }
  uint64_t v181 = v107;
  uint64_t v182 = v261;
  sub_25CF0F584(v260, v261, &qword_26A62F470);
  uint64_t v183 = v247;
  sub_25CF0F584(v262, v247, &qword_26A62F458);
  uint64_t v184 = v249;
  v185 = *(void (**)(char *, char *, uint64_t))(v249 + 16);
  v186 = v248;
  v187 = v258;
  uint64_t v188 = v250;
  v185(v248, v258, v250);
  uint64_t v189 = v251;
  sub_25CF0F584(v181, v251, &qword_26A62F438);
  uint64_t v190 = v255;
  sub_25CF0F584(v182, v255, &qword_26A62F470);
  v191 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F500);
  sub_25CF0F584(v183, v190 + v191[12], &qword_26A62F458);
  v185((char *)(v190 + v191[16]), v186, v188);
  sub_25CF0F584(v189, v190 + v191[20], &qword_26A62F438);
  sub_25CF0F5D4(v259, &qword_26A62F438);
  v192 = *(void (**)(char *, uint64_t))(v184 + 8);
  v192(v187, v188);
  sub_25CF0F5D4(v262, &qword_26A62F458);
  sub_25CF0F5D4(v260, &qword_26A62F470);
  sub_25CF0F5D4(v189, &qword_26A62F438);
  v192(v186, v188);
  sub_25CF0F5D4(v183, &qword_26A62F458);
  return sub_25CF0F5D4(v261, &qword_26A62F470);
}

uint64_t sub_25CF14B4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF14B68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageListView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = swift_bridgeObjectRetain();
  size_t v6 = sub_25CF170E4(v5);
  swift_bridgeObjectRelease();
  v11[1] = v6;
  swift_getKeyPath();
  sub_25CF176E0(a1, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for MessageListView);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_25CF17734((uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, (void (*)(void))type metadata accessor for MessageListView);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_25CF175E8;
  *(void *)(v9 + 24) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F520);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F490);
  sub_25CEFDA10(&qword_26A62F528, &qword_26A62F520);
  sub_25CF16970();
  return sub_25CF43A88();
}

uint64_t sub_25CF14D70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v104 = a2;
  uint64_t v105 = a1;
  uint64_t v109 = a4;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F538);
  MEMORY[0x270FA5388](v106);
  uint64_t v108 = (uint64_t)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F4A0);
  MEMORY[0x270FA5388](v107);
  uint64_t v103 = (uint64_t)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25CF43A78();
  uint64_t v95 = *(void *)(v7 - 8);
  uint64_t v96 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v94 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F448);
  MEMORY[0x270FA5388](v92);
  uint64_t v93 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F450);
  MEMORY[0x270FA5388](v97);
  uint64_t v100 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F458);
  uint64_t v11 = MEMORY[0x270FA5388](v99);
  uint64_t v101 = (uint64_t)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v98 = (uint64_t)&v91 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v102 = (uint64_t)&v91 - v15;
  uint64_t v16 = type metadata accessor for MessageView();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (uint64_t *)((char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F308);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v91 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v91 - v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F310);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v91 = (uint64_t)&v91 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v91 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v91 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v91 - v34;
  uint64_t v36 = *(void *)(*(void *)(a3 + 24) + 16) - 1;
  sub_25CF157D0(v104, v18);
  char v37 = sub_25CF43638();
  sub_25CF430B8();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  if (v36 <= v105)
  {
    sub_25CF176E0((uint64_t)v18, (uint64_t)v22, (void (*)(void))type metadata accessor for MessageView);
    long long v84 = &v22[*(int *)(v19 + 36)];
    *long long v84 = v37;
    *((void *)v84 + 1) = v39;
    *((void *)v84 + 2) = v41;
    *((void *)v84 + 3) = v43;
    *((void *)v84 + 4) = v45;
    v84[40] = 0;
    sub_25CF17690((uint64_t)v18, (void (*)(void))type metadata accessor for MessageView);
    if (qword_26A62ED28 != -1) {
      swift_once();
    }
    if (byte_26A62F3A8 == 1)
    {
      unsigned __int8 v85 = sub_25CF43658();
      char v86 = sub_25CF43648();
    }
    else
    {
      unsigned __int8 v87 = sub_25CF43628();
      unsigned __int8 v85 = sub_25CF43658();
      char v86 = sub_25CF43648();
      sub_25CF43648();
      if (sub_25CF43648() != v87) {
        char v86 = sub_25CF43648();
      }
    }
    sub_25CF43648();
    if (sub_25CF43648() != v85) {
      char v86 = sub_25CF43648();
    }
    uint64_t v88 = v91;
    sub_25CF0F584((uint64_t)v22, v91, &qword_26A62F308);
    uint64_t v89 = v88 + *(int *)(v25 + 36);
    *(unsigned char *)uint64_t v89 = v86;
    *(_OWORD *)(v89 + 8) = 0u;
    *(_OWORD *)(v89 + 24) = 0u;
    *(unsigned char *)(v89 + 40) = 1;
    sub_25CF0F5D4((uint64_t)v22, &qword_26A62F308);
    sub_25CF17788(v88, (uint64_t)v30, &qword_26A62F310);
    sub_25CF0F584((uint64_t)v30, v108, &qword_26A62F310);
    swift_storeEnumTagMultiPayload();
    sub_25CEFDA10(&qword_26A62F498, &qword_26A62F4A0);
    sub_25CF16C5C(&qword_26A62F4A8, &qword_26A62F310, (void (*)(void))sub_25CF16A34);
    sub_25CF43518();
  }
  else
  {
    sub_25CF176E0((uint64_t)v18, (uint64_t)v24, (void (*)(void))type metadata accessor for MessageView);
    uint64_t v46 = &v24[*(int *)(v19 + 36)];
    *uint64_t v46 = v37;
    *((void *)v46 + 1) = v39;
    *((void *)v46 + 2) = v41;
    *((void *)v46 + 3) = v43;
    *((void *)v46 + 4) = v45;
    v46[40] = 0;
    sub_25CF17690((uint64_t)v18, (void (*)(void))type metadata accessor for MessageView);
    char v47 = sub_25CF43658();
    sub_25CF0F584((uint64_t)v24, (uint64_t)v33, &qword_26A62F308);
    uint64_t v48 = &v33[*(int *)(v25 + 36)];
    *uint64_t v48 = v47;
    *(_OWORD *)(v48 + 8) = 0u;
    *(_OWORD *)(v48 + 24) = 0u;
    v48[40] = 1;
    sub_25CF0F5D4((uint64_t)v24, &qword_26A62F308);
    sub_25CF17788((uint64_t)v33, (uint64_t)v35, &qword_26A62F310);
    uint64_t v49 = v94;
    sub_25CF43A68();
    char v50 = sub_25CF43638();
    uint64_t v52 = v95;
    uint64_t v51 = v96;
    uint64_t v53 = v93;
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v93, v49, v96);
    uint64_t v54 = &v53[*(int *)(v92 + 36)];
    *uint64_t v54 = v50;
    *(_OWORD *)(v54 + 8) = 0u;
    *(_OWORD *)(v54 + 24) = 0u;
    v54[40] = 1;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v51);
    char v55 = sub_25CF43618();
    uint64_t v56 = (uint64_t)v53;
    if (qword_26A62ED28 != -1) {
      swift_once();
    }
    char v57 = byte_26A62F3A8;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = (uint64_t)v100;
    if (byte_26A62F3A8 == 1)
    {
      sub_25CF430B8();
      uint64_t v59 = v64;
      uint64_t v60 = v65;
      uint64_t v61 = v66;
      uint64_t v62 = v67;
    }
    sub_25CF0F584(v56, v63, &qword_26A62F448);
    uint64_t v68 = v63 + *(int *)(v97 + 36);
    *(unsigned char *)uint64_t v68 = v55;
    *(void *)(v68 + 8) = v59;
    *(void *)(v68 + 16) = v60;
    *(void *)(v68 + 24) = v61;
    *(void *)(v68 + 32) = v62;
    *(unsigned char *)(v68 + 40) = v57 ^ 1;
    sub_25CF0F5D4(v56, &qword_26A62F448);
    char v69 = sub_25CF43628();
    char v70 = byte_26A62F3A8;
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    if (byte_26A62F3A8 == 1)
    {
      sub_25CF430B8();
      uint64_t v58 = v74;
      uint64_t v71 = v75;
      uint64_t v72 = v76;
      uint64_t v73 = v77;
    }
    uint64_t v78 = v98;
    sub_25CF0F584(v63, v98, &qword_26A62F450);
    uint64_t v79 = v78 + *(int *)(v99 + 36);
    *(unsigned char *)uint64_t v79 = v69;
    *(void *)(v79 + 8) = v58;
    *(void *)(v79 + 16) = v71;
    *(void *)(v79 + 24) = v72;
    *(void *)(v79 + 32) = v73;
    *(unsigned char *)(v79 + 40) = v70 ^ 1;
    sub_25CF0F5D4(v63, &qword_26A62F450);
    uint64_t v80 = v102;
    sub_25CF17788(v78, v102, &qword_26A62F458);
    sub_25CF0F584((uint64_t)v35, (uint64_t)v33, &qword_26A62F310);
    uint64_t v81 = v101;
    sub_25CF0F584(v80, v101, &qword_26A62F458);
    uint64_t v82 = v103;
    sub_25CF0F584((uint64_t)v33, v103, &qword_26A62F310);
    uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F540);
    sub_25CF0F584(v81, v82 + *(int *)(v83 + 48), &qword_26A62F458);
    sub_25CF0F5D4(v81, &qword_26A62F458);
    sub_25CF0F5D4((uint64_t)v33, &qword_26A62F310);
    sub_25CF0F584(v82, v108, &qword_26A62F4A0);
    swift_storeEnumTagMultiPayload();
    sub_25CEFDA10(&qword_26A62F498, &qword_26A62F4A0);
    sub_25CF16C5C(&qword_26A62F4A8, &qword_26A62F310, (void (*)(void))sub_25CF16A34);
    sub_25CF43518();
    sub_25CF0F5D4(v82, &qword_26A62F4A0);
    sub_25CF0F5D4(v80, &qword_26A62F458);
    uint64_t v30 = v35;
  }
  return sub_25CF0F5D4((uint64_t)v30, &qword_26A62F310);
}

uint64_t sub_25CF157D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for WidgetMessage();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25CF176E0(a1, (uint64_t)v8, (void (*)(void))type metadata accessor for WidgetMessage);
  uint64_t v9 = v2[5];
  LOBYTE(a1) = *(unsigned char *)(a1 + *(int *)(v6 + 48));
  uint64_t v10 = v2[24];
  uint64_t v11 = v2[25];
  uint64_t v12 = v2[26];
  uint64_t v13 = v2[27];
  uint64_t v15 = v2[28];
  uint64_t v14 = v2[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_25CF1B938((uint64_t)v8, v9, a1, v10, v11, v12, v13, v15, a2, v14);
}

uint64_t sub_25CF158E0(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F530);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_25CF15944(id *a1)
{
  if (*a1)
  {
    id v1 = *a1;
    sub_25CF43D38();
    sub_25CF43D08();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF16D88((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CF15A30(id *a1)
{
  uint64_t v3 = sub_25CF42B58();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_8_1();
  if (*a1)
  {
    id v7 = *a1;
    sub_25CF42B48();
    sub_25CF43CF8();

    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  }
  else
  {
    sub_25CF43D18();
    sub_25CF16D88((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for MessageListView(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *((void *)a1 + 3) = a2[3];
    *((_WORD *)a1 + 16) = *((_WORD *)a2 + 16);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    uint64_t v6 = a2[8];
    *((void *)a1 + 7) = a2[7];
    *((void *)a1 + 8) = v6;
    id v7 = a2[10];
    *((void *)a1 + 9) = a2[9];
    *((void *)a1 + 10) = v7;
    uint64_t v8 = a2[12];
    *((void *)a1 + 11) = a2[11];
    *((void *)a1 + 12) = v8;
    uint64_t v9 = a2[14];
    *((void *)a1 + 13) = a2[13];
    *((void *)a1 + 14) = v9;
    uint64_t v10 = a2[16];
    *((void *)a1 + 15) = a2[15];
    *((void *)a1 + 16) = v10;
    uint64_t v11 = a2[18];
    *((void *)a1 + 17) = a2[17];
    *((void *)a1 + 18) = v11;
    uint64_t v12 = a2[20];
    *((void *)a1 + 19) = a2[19];
    *((void *)a1 + 20) = v12;
    uint64_t v13 = a2[22];
    *((void *)a1 + 21) = a2[21];
    *((void *)a1 + 22) = v13;
    uint64_t v14 = a2[24];
    *((void *)a1 + 23) = a2[23];
    *((void *)a1 + 24) = v14;
    uint64_t v15 = a2[26];
    *((void *)a1 + 25) = a2[25];
    *((void *)a1 + 26) = v15;
    uint64_t v16 = a2[28];
    *((void *)a1 + 27) = a2[27];
    *((void *)a1 + 28) = v16;
    uint64_t v17 = *(int *)(a3 + 88);
    uint64_t v21 = &a1[v17];
    uint64_t v22 = (char **)((char *)a2 + v17);
    *((void *)a1 + 29) = a2[29];
    uint64_t v18 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_25CF43138();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v21, v22, v19);
    }
    else
    {
      *(void *)uint64_t v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MessageListView(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v4 = (char *)a1 + *(int *)(a2 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25CF43138();
    uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t initializeWithCopy for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  uint64_t v10 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v10;
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  uint64_t v12 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v12;
  uint64_t v13 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v13;
  uint64_t v14 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v14;
  uint64_t v15 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v15;
  uint64_t v16 = *(int *)(a3 + 88);
  uint64_t v21 = (void *)(a1 + v16);
  uint64_t v20 = (void *)(a2 + v16);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  id v17 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_25CF43138();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v21, v20, v18);
  }
  else
  {
    void *v21 = *v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 88);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    sub_25CF0F5D4(a1 + v9, &qword_26A62ED50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  long long v8 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v8;
  long long v9 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v9;
  long long v10 = *(_OWORD *)(a2 + 224);
  uint64_t v11 = *(int *)(a3 + 88);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v10;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_25CF43138();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v17;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v18 = *(int *)(a3 + 88);
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (const void *)(a2 + v18);
    sub_25CF0F5D4(a1 + v18, &qword_26A62ED50);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_25CF43138();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF16670);
}

uint64_t sub_25CF16670(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v9 = a1 + *(int *)(a3 + 88);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF16710);
}

uint64_t sub_25CF16710(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v8 = v5 + *(int *)(a4 + 88);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25CF16794()
{
  sub_25CF0EF9C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25CF16874()
{
  return sub_25CEFDA10(&qword_26A62F3D0, &qword_26A62F3D8);
}

uint64_t sub_25CF168B4()
{
  uint64_t v0 = type metadata accessor for MessageListView();
  OUTLINED_FUNCTION_0_0(v0);
  uint64_t v2 = OUTLINED_FUNCTION_6_0(*(unsigned __int8 *)(v1 + 80));
  return sub_25CF14B68(v2);
}

unint64_t sub_25CF168FC()
{
  unint64_t result = qword_26A62F480;
  if (!qword_26A62F480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F478);
    sub_25CF16970();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F480);
  }
  return result;
}

unint64_t sub_25CF16970()
{
  unint64_t result = qword_26A62F488;
  if (!qword_26A62F488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F490);
    sub_25CEFDA10(&qword_26A62F498, &qword_26A62F4A0);
    sub_25CF16C5C(&qword_26A62F4A8, &qword_26A62F310, (void (*)(void))sub_25CF16A34);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F488);
  }
  return result;
}

unint64_t sub_25CF16A34()
{
  unint64_t result = qword_26A62F4B0;
  if (!qword_26A62F4B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F308);
    sub_25CF16D88(&qword_26A62F4B8, (void (*)(uint64_t))type metadata accessor for MessageView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F4B0);
  }
  return result;
}

unint64_t sub_25CF16AE0()
{
  unint64_t result = qword_26A62F4C8;
  if (!qword_26A62F4C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F3F8);
    sub_25CF16BC4();
    sub_25CF43BC8();
    sub_25CF16D88(&qword_26A62F4F0, MEMORY[0x263F776F0]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F4C8);
  }
  return result;
}

unint64_t sub_25CF16BC4()
{
  unint64_t result = qword_26A62F4D0;
  if (!qword_26A62F4D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F430);
    sub_25CF16C5C(&qword_26A62F4D8, &qword_26A62F408, (void (*)(void))sub_25CF16CDC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F4D0);
  }
  return result;
}

uint64_t sub_25CF16C5C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25CF16CDC()
{
  unint64_t result = qword_26A62F4E0;
  if (!qword_26A62F4E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F400);
    sub_25CF16D88(&qword_26A62F4E8, MEMORY[0x263F77660]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F4E0);
  }
  return result;
}

uint64_t sub_25CF16D88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF16DDC()
{
  uint64_t v0 = type metadata accessor for MessageListView();
  OUTLINED_FUNCTION_0_0(v0);
  uint64_t v2 = (id *)OUTLINED_FUNCTION_6_0(*(unsigned __int8 *)(v1 + 80));
  return sub_25CF15944(v2);
}

uint64_t sub_25CF16E14()
{
  return sub_25CF43358();
}

uint64_t sub_25CF16E38()
{
  return sub_25CF43358();
}

uint64_t sub_25CF16E5C(uint64_t a1)
{
  sub_25CF43268();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_8_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  return sub_25CF43368();
}

uint64_t sub_25CF16EF4()
{
  uint64_t v0 = type metadata accessor for MessageListView();
  OUTLINED_FUNCTION_0_0(v0);
  uint64_t v2 = (id *)OUTLINED_FUNCTION_6_0(*(unsigned __int8 *)(v1 + 80));
  return sub_25CF15A30(v2);
}

unint64_t sub_25CF16F20()
{
  unint64_t result = qword_26A62F510;
  if (!qword_26A62F510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F428);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F418);
    sub_25CEFDA10(&qword_26A62F508, &qword_26A62F418);
    swift_getOpaqueTypeConformance2();
    sub_25CEFDA10(&qword_26A62F2C8, &qword_26A62F2A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F510);
  }
  return result;
}

unint64_t sub_25CF17020()
{
  unint64_t result = qword_26A62F518;
  if (!qword_26A62F518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F410);
    sub_25CEFDA10(&qword_26A62F508, &qword_26A62F418);
    sub_25CEFDA10(&qword_26A62F2C8, &qword_26A62F2A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F518);
  }
  return result;
}

size_t sub_25CF170E4(uint64_t a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F530);
  uint64_t v2 = MEMORY[0x270FA5388](v41);
  uint64_t v46 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v45 = (void *)((char *)v39 - v5);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v39 - v6;
  uint64_t v47 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  uint64_t v44 = v10;
  v39[0] = a1;
  if (v10)
  {
    uint64_t v40 = (v9 + 32) & ~v9;
    uint64_t v12 = MEMORY[0x263F8EE78] + v40;
    uint64_t v13 = 0;
    uint64_t v10 = 0;
    uint64_t v14 = *(void *)(type metadata accessor for WidgetMessage() - 8);
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    uint64_t v16 = *(void *)(v14 + 72);
    uint64_t v42 = v7;
    uint64_t v43 = v16;
    v39[1] = v9 | 7;
    uint64_t v17 = v11;
    uint64_t v18 = v41;
    while (1)
    {
      uint64_t v19 = (uint64_t)&v46[*(int *)(v18 + 48)];
      sub_25CF176E0(v15, v19, (void (*)(void))type metadata accessor for WidgetMessage);
      uint64_t v20 = (uint64_t)v45;
      uint64_t v21 = (uint64_t)v45 + *(int *)(v18 + 48);
      *uint64_t v45 = v13;
      sub_25CF17734(v19, v21, (void (*)(void))type metadata accessor for WidgetMessage);
      size_t result = sub_25CF17788(v20, (uint64_t)v7, &qword_26A62F530);
      if (v10)
      {
        uint64_t v11 = v17;
      }
      else
      {
        unint64_t v23 = v17[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_32;
        }
        int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v24;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F548);
        uint64_t v26 = *(void *)(v47 + 72);
        uint64_t v27 = v40;
        uint64_t v11 = (void *)swift_allocObject();
        size_t result = _swift_stdlib_malloc_size(v11);
        if (!v26) {
          goto LABEL_33;
        }
        int64_t v28 = result - v27;
        if (result - v27 == 0x8000000000000000 && v26 == -1) {
          goto LABEL_34;
        }
        uint64_t v30 = v28 / v26;
        void v11[2] = v25;
        v11[3] = 2 * (v28 / v26);
        uint64_t v31 = (char *)v11 + v27;
        unint64_t v32 = v17[3];
        uint64_t v33 = (v32 >> 1) * v26;
        if (v17[2])
        {
          if (v11 < v17 || v31 >= (char *)v17 + v40 + v33)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v17)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v17[2] = 0;
        }
        uint64_t v12 = (uint64_t)&v31[v33];
        uint64_t v10 = (v30 & 0x7FFFFFFFFFFFFFFFLL) - (v32 >> 1);
        size_t result = swift_release();
        uint64_t v18 = v41;
      }
      BOOL v35 = __OFSUB__(v10--, 1);
      if (v35) {
        break;
      }
      ++v13;
      uint64_t v7 = v42;
      sub_25CF17788((uint64_t)v42, v12, &qword_26A62F530);
      v12 += *(void *)(v47 + 72);
      v15 += v43;
      uint64_t v17 = v11;
      if (v44 == v13) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
LABEL_27:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v36 = v11[3];
  if (v36 < 2) {
    return (size_t)v11;
  }
  unint64_t v37 = v36 >> 1;
  BOOL v35 = __OFSUB__(v37, v10);
  unint64_t v38 = v37 - v10;
  if (!v35)
  {
    void v11[2] = v38;
    return (size_t)v11;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = *(void *)(type metadata accessor for MessageListView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25CF43138();
    OUTLINED_FUNCTION_2();
    uint64_t v5 = OUTLINED_FUNCTION_10_0();
    v6(v5);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF175E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for MessageListView();
  OUTLINED_FUNCTION_0_0(v7);
  uint64_t v9 = v3 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return sub_25CF14D70(a1, a2, v9, a3);
}

uint64_t sub_25CF17650()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25CF17688(char *a1)
{
  return sub_25CF158E0(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

uint64_t sub_25CF17690(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  v4(v3);
  return a1;
}

uint64_t sub_25CF176E0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_11_0();
  v5(v4);
  return a2;
}

uint64_t sub_25CF17734(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_12_0();
  v5(v4);
  return a2;
}

uint64_t sub_25CF17788(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_12_0();
  v5(v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

uint64_t destroy for MessageStateView(uint64_t a1)
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for MessageStateView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  id v6 = v5;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MessageStateView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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

uint64_t assignWithTake for MessageStateView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStateView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MessageStateView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MessageStateView()
{
  return &type metadata for MessageStateView;
}

uint64_t sub_25CF17AA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF17AC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v133 = a1;
  sub_25CF43BF8();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_4(v3);
  uint64_t v132 = sub_25CF43C18();
  OUTLINED_FUNCTION_0();
  uint64_t v116 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F550);
  uint64_t v8 = OUTLINED_FUNCTION_2_4(v7, (uint64_t)&v147);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F558);
  uint64_t v11 = OUTLINED_FUNCTION_2_4(v10, (uint64_t)&v145);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v12);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F560);
  uint64_t v14 = OUTLINED_FUNCTION_2_4(v13, (uint64_t)&v146);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_4(v15);
  uint64_t v124 = sub_25CF43B88();
  OUTLINED_FUNCTION_0();
  uint64_t v122 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F568);
  uint64_t v20 = OUTLINED_FUNCTION_2_4(v19, (uint64_t)v137);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v21);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F570);
  uint64_t v23 = OUTLINED_FUNCTION_2_4(v22, (uint64_t)v139);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_4(v24);
  uint64_t v129 = sub_25CF43268();
  OUTLINED_FUNCTION_0();
  uint64_t v115 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_4(v27);
  uint64_t v107 = sub_25CF43B38();
  OUTLINED_FUNCTION_0();
  uint64_t v106 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_1();
  uint64_t v32 = v31 - v30;
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F418);
  OUTLINED_FUNCTION_0();
  uint64_t v125 = v33;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v35);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F420);
  OUTLINED_FUNCTION_0();
  uint64_t v108 = v36;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_1();
  uint64_t v40 = v39 - v38;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F578);
  uint64_t v42 = OUTLINED_FUNCTION_2_4(v41, (uint64_t)&v133);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_1();
  uint64_t v45 = v44 - v43;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F580);
  uint64_t v47 = OUTLINED_FUNCTION_2_4(v46, (uint64_t)&v144);
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_4(v48);
  uint64_t v49 = sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  uint64_t v51 = v50;
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_1();
  uint64_t v55 = v54 - v53;
  long long v144 = *v1;
  uint64_t v56 = *((void *)&v144 + 1);
  swift_getKeyPath();
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  swift_retain();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  sub_25CF18CF8((uint64_t)&v144);
  int v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 88))(v55, v49);
  if (v58 == *MEMORY[0x263F70738])
  {
    uint64_t v59 = (uint64_t *)(v56 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
    swift_beginAccess();
    uint64_t v60 = *v59;
    uint64_t v61 = v59[1];
    *(void *)&long long v138 = v60;
    *((void *)&v138 + 1) = v61;
    long long v62 = v1[1];
    long long v142 = v1[2];
    long long v143 = v62;
    uint64_t v63 = (_OWORD *)swift_allocObject();
    OUTLINED_FUNCTION_9_1(v63);
    swift_bridgeObjectRetain();
    sub_25CF05278((id *)&v143);
    sub_25CF18E34((uint64_t)&v142);
    sub_25CEFDB04();
    sub_25CF43A08();
    (*(void (**)(uint64_t, void, uint64_t))(v106 + 104))(v32, *MEMORY[0x263F774E0], v107);
    sub_25CEFDA10(&qword_26A62F508, &qword_26A62F418);
    sub_25CF43808();
    OUTLINED_FUNCTION_13_0();
    v64();
    uint64_t v117 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
    v117(v126, v128);
    BOOL v65 = sub_25CF18A34();
    uint64_t v66 = swift_getKeyPath();
    uint64_t v67 = swift_allocObject();
    *(unsigned char *)(v67 + 16) = v65;
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_11_1();
    v68();
    char v69 = (uint64_t *)(v45 + *(int *)(v105 + 36));
    uint64_t *v69 = v66;
    v69[1] = (uint64_t)sub_25CF18E6C;
    v69[2] = v67;
    (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v40, v109);
    sub_25CF43258();
    uint64_t v70 = swift_getKeyPath();
    uint64_t v71 = (uint64_t *)(v130 + *(int *)(v127 + 36));
    uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A8);
    uint64_t v110 = *(void (**)(char *, uint64_t, uint64_t))(v115 + 16);
    v110((char *)v71 + *(int *)(v111 + 28), v112, v129);
    uint64_t *v71 = v70;
    sub_25CF18EFC(v45, v130, &qword_26A62F578);
    OUTLINED_FUNCTION_13_0();
    v72();
    sub_25CF191C8(v45, &qword_26A62F578);
    uint64_t v73 = (uint64_t *)(v56 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
    swift_beginAccess();
    uint64_t v74 = *v73;
    uint64_t v75 = v73[1];
    *(void *)&long long v138 = v74;
    *((void *)&v138 + 1) = v75;
    uint64_t v76 = (_OWORD *)swift_allocObject();
    OUTLINED_FUNCTION_9_1(v76);
    sub_25CF05278((id *)&v143);
    sub_25CF18E34((uint64_t)&v142);
    swift_bridgeObjectRetain();
    sub_25CF43A08();
    long long v138 = v142;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
    sub_25CF439C8();
    char v77 = v134;
    uint64_t v78 = swift_getKeyPath();
    uint64_t v79 = swift_allocObject();
    *(unsigned char *)(v79 + 16) = v77;
    uint64_t v80 = OUTLINED_FUNCTION_14();
    v81(v80);
    uint64_t v82 = (uint64_t *)(v118 + *(int *)(v114 + 36));
    *uint64_t v82 = v78;
    v82[1] = (uint64_t)sub_25CF1931C;
    v82[2] = v79;
    v117(v126, v128);
    sub_25CF43258();
    uint64_t v83 = swift_getKeyPath();
    long long v84 = (uint64_t *)(v120 + *(int *)(v119 + 36));
    v110((char *)v84 + *(int *)(v111 + 28), v112, v129);
    *long long v84 = v83;
    uint64_t v85 = OUTLINED_FUNCTION_14();
    sub_25CF18EFC(v85, v86, &qword_26A62F568);
    OUTLINED_FUNCTION_13_0();
    v87();
    sub_25CF191C8(v118, &qword_26A62F568);
    sub_25CF19060(&qword_26A62F598, &qword_26A62F580, (void (*)(void))sub_25CF18F60);
    uint64_t v88 = sub_25CF437E8();
    uint64_t v89 = MEMORY[0x263F1B720];
    uint64_t v90 = MEMORY[0x263F774B0];
    uint64_t v140 = MEMORY[0x263F1B720];
    uint64_t v141 = MEMORY[0x263F774B0];
    *(void *)&long long v138 = v88;
    sub_25CF19060(&qword_26A62F5B8, &qword_26A62F570, (void (*)(void))sub_25CF19104);
    uint64_t v91 = sub_25CF437E8();
    uint64_t v135 = v89;
    uint64_t v136 = v90;
    uint64_t v134 = v91;
    sub_25CF43B78();
    OUTLINED_FUNCTION_11_1();
    v92();
    swift_storeEnumTagMultiPayload();
    sub_25CF19224(&qword_26A62F4E8, MEMORY[0x263F77660]);
    sub_25CF19224(&qword_26A62F590, MEMORY[0x263F77798]);
    sub_25CF43518();
    sub_25CF18EFC(v123, v131, &qword_26A62F560);
    swift_storeEnumTagMultiPayload();
    sub_25CF18D24();
    OUTLINED_FUNCTION_7_3();
    sub_25CF43518();
    sub_25CF191C8(v123, &qword_26A62F560);
    (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v121, v124);
    sub_25CF191C8(v120, &qword_26A62F570);
    return sub_25CF191C8(v130, &qword_26A62F580);
  }
  else if (v58 == *MEMORY[0x263F70748] || v58 == *MEMORY[0x263F70730])
  {
    OUTLINED_FUNCTION_8_2();
    uint64_t v95 = *KeyPath;
    uint64_t v96 = KeyPath[1];
    uint64_t v140 = MEMORY[0x263F8D310];
    uint64_t v141 = MEMORY[0x263F77998];
    *(void *)&long long v138 = v95;
    *((void *)&v138 + 1) = v96;
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_12_1();
    v97();
    swift_bridgeObjectRetain();
    sub_25CF43C08();
    OUTLINED_FUNCTION_11_1();
    v98();
    swift_storeEnumTagMultiPayload();
    sub_25CF19224(&qword_26A62F4E8, MEMORY[0x263F77660]);
    sub_25CF19224(&qword_26A62F590, MEMORY[0x263F77798]);
    sub_25CF43518();
    sub_25CF18EFC(v123, v131, &qword_26A62F560);
    swift_storeEnumTagMultiPayload();
    sub_25CF18D24();
    OUTLINED_FUNCTION_7_3();
    sub_25CF43518();
    sub_25CF191C8(v123, &qword_26A62F560);
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_13_0();
    return v99();
  }
  else if (v58 == *MEMORY[0x263F70750] || v58 == *MEMORY[0x263F70740])
  {
    OUTLINED_FUNCTION_8_2();
    uint64_t v101 = *KeyPath;
    uint64_t v102 = KeyPath[1];
    uint64_t v140 = MEMORY[0x263F8D310];
    uint64_t v141 = MEMORY[0x263F77998];
    *(void *)&long long v138 = v101;
    *((void *)&v138 + 1) = v102;
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_12_1();
    v103();
    swift_bridgeObjectRetain();
    sub_25CF43C08();
    OUTLINED_FUNCTION_11_1();
    v104();
    swift_storeEnumTagMultiPayload();
    sub_25CF18D24();
    sub_25CF19224(&qword_26A62F590, MEMORY[0x263F77798]);
    sub_25CF43518();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v116 + 8))(v113, v132);
  }
  else
  {
    uint64_t result = sub_25CF44138();
    __break(1u);
  }
  return result;
}

BOOL sub_25CF18A34()
{
  long long v17 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
  sub_25CF439C8();
  if (v16) {
    return 1;
  }
  long long v17 = *v0;
  swift_retain();
  uint64_t v1 = SiriMailModel.to.getter();
  sub_25CF18CF8((uint64_t)&v17);
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease();
  if (!v2)
  {
    swift_retain();
    uint64_t v3 = SiriMailModel.cc.getter();
    sub_25CF18CF8((uint64_t)&v17);
    uint64_t v4 = *(void *)(v3 + 16);
    swift_bridgeObjectRelease();
    if (!v4)
    {
      swift_retain();
      uint64_t v5 = SiriMailModel.bcc.getter();
      sub_25CF18CF8((uint64_t)&v17);
      uint64_t v6 = *(void *)(v5 + 16);
      swift_bridgeObjectRelease();
      if (!v6) {
        return 1;
      }
    }
  }
  swift_retain();
  uint64_t v7 = SiriMailModel.subject.getter();
  unint64_t v9 = v8;
  sub_25CF18CF8((uint64_t)&v17);
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10) {
    return 1;
  }
  swift_retain();
  uint64_t v11 = SiriMailModel.body.getter();
  unint64_t v13 = v12;
  sub_25CF18CF8((uint64_t)&v17);
  swift_bridgeObjectRelease();
  uint64_t v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0) {
    uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
  }
  return v14 == 0;
}

uint64_t sub_25CF18B8C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = (void *)a2();
    id v6 = objc_msgSend(v5, sel_identifier);

    sub_25CF43D88();
    sub_25CF43D38();
    sub_25CF43D08();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
    return sub_25CF439D8();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF19224((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CF18CF8(uint64_t a1)
{
  return a1;
}

unint64_t sub_25CF18D24()
{
  unint64_t result = qword_26A62F588;
  if (!qword_26A62F588)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F560);
    sub_25CF19224(&qword_26A62F4E8, MEMORY[0x263F77660]);
    sub_25CF19224(&qword_26A62F590, MEMORY[0x263F77798]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F588);
  }
  return result;
}

uint64_t sub_25CF18E04()
{
  return sub_25CF18B8C(v0 + 16, MEMORY[0x263F6F7A8]);
}

uint64_t sub_25CF18E34(uint64_t a1)
{
  return a1;
}

unsigned char *sub_25CF18E6C(unsigned char *a1)
{
  return sub_25CF3338C(a1, *(unsigned char *)(v1 + 16));
}

uint64_t objectdestroyTm_3()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25CF18EC8()
{
  return sub_25CF18B8C(v0 + 16, MEMORY[0x263F6F798]);
}

uint64_t sub_25CF18EFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25CF18F60()
{
  unint64_t result = qword_26A62F5A0;
  if (!qword_26A62F5A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F578);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F418);
    sub_25CEFDA10(&qword_26A62F508, &qword_26A62F418);
    swift_getOpaqueTypeConformance2();
    sub_25CEFDA10(&qword_26A62F5A8, &qword_26A62F5B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F5A0);
  }
  return result;
}

uint64_t sub_25CF19060(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_25CEFDA10(&qword_26A62F2C8, &qword_26A62F2A8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25CF19104()
{
  unint64_t result = qword_26A62F5C0;
  if (!qword_26A62F5C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F568);
    sub_25CEFDA10(&qword_26A62F508, &qword_26A62F418);
    sub_25CEFDA10(&qword_26A62F5A8, &qword_26A62F5B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F5C0);
  }
  return result;
}

uint64_t sub_25CF191C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25CF19224(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25CF19270()
{
  unint64_t result = qword_26A62F5C8;
  if (!qword_26A62F5C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F5D0);
    sub_25CF18D24();
    sub_25CF19224(&qword_26A62F590, MEMORY[0x263F77798]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F5C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_4@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

void OUTLINED_FUNCTION_6_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_1(_OWORD *a1)
{
  long long v4 = v1[1];
  a1[1] = *v1;
  a1[2] = v4;
  a1[3] = v1[2];
  return sub_25CF18E34(v2 - 112);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

char *sub_25CF19410(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  long long v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v22 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v5 = a3[5];
    id v6 = &a1[v5];
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = *(uint64_t *)((char *)a2 + v5 + 8);
    *(void *)id v6 = *(char **)((char *)a2 + v5);
    *((void *)v6 + 1) = v8;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v5 + 24);
    *((void *)v6 + 2) = *(char **)((char *)a2 + v5 + 16);
    *((void *)v6 + 3) = v9;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v5 + 40);
    *((void *)v6 + 4) = *(char **)((char *)a2 + v5 + 32);
    *((void *)v6 + 5) = v10;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v5 + 56);
    *((void *)v6 + 6) = *(char **)((char *)a2 + v5 + 48);
    *((void *)v6 + 7) = v11;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v5 + 72);
    *((void *)v6 + 8) = *(char **)((char *)a2 + v5 + 64);
    *((void *)v6 + 9) = v12;
    unint64_t v13 = (int *)type metadata accessor for WidgetMessage();
    uint64_t v14 = v13[9];
    uint64_t v124 = v7 + v14;
    uint64_t v126 = &v6[v14];
    uint64_t v15 = sub_25CF42AD8();
    uint64_t v122 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    char v16 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v122(v126, v124, v15);
    v6[v13[10]] = *(unsigned char *)(v7 + v13[10]);
    v6[v13[11]] = *(unsigned char *)(v7 + v13[11]);
    v6[v13[12]] = *(unsigned char *)(v7 + v13[12]);
    v6[v13[13]] = *(unsigned char *)(v7 + v13[13]);
    uint64_t v17 = v13[14];
    uint64_t v18 = &v6[v17];
    uint64_t v19 = (const void *)(v7 + v17);
    uint64_t v20 = sub_25CF42AA8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
    }
    v6[v13[15]] = *(unsigned char *)(v7 + v13[15]);
    uint64_t v23 = v13[16];
    uint64_t v24 = &v6[v23];
    uint64_t v25 = (void *)(v7 + v23);
    uint64_t v26 = v25[1];
    *(void *)uint64_t v24 = *v25;
    *((void *)v24 + 1) = v26;
    uint64_t v27 = v13[17];
    uint64_t v28 = &v6[v27];
    uint64_t v29 = (void *)(v7 + v27);
    uint64_t v127 = v29[1];
    *(void *)uint64_t v28 = *v29;
    *((void *)v28 + 1) = v127;
    v6[v13[18]] = *(unsigned char *)(v7 + v13[18]);
    uint64_t v30 = v13[19];
    uint64_t v31 = &v6[v30];
    uint64_t v32 = (void *)(v7 + v30);
    uint64_t v125 = v32[1];
    *(void *)uint64_t v31 = *v32;
    *((void *)v31 + 1) = v125;
    uint64_t v33 = v13[20];
    uint64_t v34 = &v6[v33];
    uint64_t v35 = (void *)(v7 + v33);
    uint64_t v123 = v35[1];
    *(void *)uint64_t v34 = *v35;
    *((void *)v34 + 1) = v123;
    uint64_t v36 = v13[21];
    uint64_t v37 = &v6[v36];
    uint64_t v38 = (void *)(v7 + v36);
    uint64_t v121 = v38[1];
    *(void *)uint64_t v37 = *v38;
    *((void *)v37 + 1) = v121;
    uint64_t v39 = v13[22];
    uint64_t v40 = &v6[v39];
    uint64_t v41 = (void *)(v7 + v39);
    uint64_t v120 = v41[1];
    *(void *)uint64_t v40 = *v41;
    *((void *)v40 + 1) = v120;
    uint64_t v42 = v13[23];
    uint64_t v43 = &v6[v42];
    uint64_t v44 = (void *)(v7 + v42);
    uint64_t v119 = v44[1];
    *(void *)uint64_t v43 = *v44;
    *((void *)v43 + 1) = v119;
    uint64_t v45 = v13[24];
    uint64_t v46 = &v6[v45];
    uint64_t v47 = (void *)(v7 + v45);
    uint64_t v118 = v47[1];
    *(void *)uint64_t v46 = *v47;
    *((void *)v46 + 1) = v118;
    uint64_t v48 = v13[25];
    uint64_t v49 = &v6[v48];
    uint64_t v50 = (void *)(v7 + v48);
    uint64_t v117 = v50[1];
    *(void *)uint64_t v49 = *v50;
    *((void *)v49 + 1) = v117;
    uint64_t v51 = v13[26];
    uint64_t v52 = &v6[v51];
    uint64_t v53 = (void *)(v7 + v51);
    uint64_t v116 = v53[1];
    *(void *)uint64_t v52 = *v53;
    *((void *)v52 + 1) = v116;
    uint64_t v54 = v13[27];
    uint64_t v55 = &v6[v54];
    uint64_t v56 = (void *)(v7 + v54);
    uint64_t v115 = v56[1];
    *(void *)uint64_t v55 = *v56;
    *((void *)v55 + 1) = v115;
    uint64_t v57 = v13[28];
    int v58 = &v6[v57];
    uint64_t v59 = (void *)(v7 + v57);
    uint64_t v114 = v59[1];
    *(void *)int v58 = *v59;
    *((void *)v58 + 1) = v114;
    uint64_t v60 = v13[29];
    uint64_t v61 = &v6[v60];
    long long v62 = (void *)(v7 + v60);
    uint64_t v113 = v62[1];
    *(void *)uint64_t v61 = *v62;
    *((void *)v61 + 1) = v113;
    uint64_t v63 = v13[30];
    uint64_t v64 = &v6[v63];
    BOOL v65 = (void *)(v7 + v63);
    uint64_t v66 = v65[1];
    *(void *)uint64_t v64 = *v65;
    *((void *)v64 + 1) = v66;
    uint64_t v67 = v13[31];
    uint64_t v68 = &v6[v67];
    char v69 = (void *)(v7 + v67);
    uint64_t v70 = v69[1];
    *(void *)uint64_t v68 = *v69;
    *((void *)v68 + 1) = v70;
    uint64_t v71 = v13[32];
    uint64_t v72 = &v6[v71];
    uint64_t v73 = (void *)(v7 + v71);
    uint64_t v74 = v73[1];
    *(void *)uint64_t v72 = *v73;
    *((void *)v72 + 1) = v74;
    uint64_t v75 = v13[33];
    uint64_t v76 = &v6[v75];
    char v77 = (void *)(v7 + v75);
    uint64_t v78 = v77[1];
    *(void *)uint64_t v76 = *v77;
    *((void *)v76 + 1) = v78;
    uint64_t v79 = a3[7];
    uint64_t v22 = a1;
    *(void *)&a1[a3[6]] = *(char **)((char *)a2 + a3[6]);
    a1[v79] = *((unsigned char *)a2 + v79);
    uint64_t v80 = a3[8];
    uint64_t v81 = a3[9];
    uint64_t v82 = &a1[v80];
    uint64_t v83 = (char **)((char *)a2 + v80);
    uint64_t v84 = v83[1];
    *(void *)uint64_t v82 = *v83;
    *((void *)v82 + 1) = v84;
    uint64_t v85 = &a1[v81];
    uint64_t v86 = (char **)((char *)a2 + v81);
    uint64_t v87 = v86[1];
    *(void *)uint64_t v85 = *v86;
    *((void *)v85 + 1) = v87;
    uint64_t v88 = a3[10];
    uint64_t v89 = a3[11];
    uint64_t v90 = &a1[v88];
    uint64_t v91 = (char **)((char *)a2 + v88);
    uint64_t v92 = v91[1];
    *(void *)uint64_t v90 = *v91;
    *((void *)v90 + 1) = v92;
    uint64_t v111 = &a1[v89];
    uint64_t v112 = (uint64_t)a2 + v89;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v93 - 8) + 16))(v111, v112, v93);
    uint64_t v94 = a3[12];
    uint64_t v95 = a3[13];
    uint64_t v96 = &a1[v94];
    uint64_t v97 = (char **)((char *)a2 + v94);
    uint64_t v98 = v97[1];
    *(void *)uint64_t v96 = *v97;
    *((void *)v96 + 1) = v98;
    uint64_t v99 = &a1[v95];
    uint64_t v100 = (char **)((char *)a2 + v95);
    uint64_t v101 = v100[1];
    *(void *)uint64_t v99 = *v100;
    *((void *)v99 + 1) = v101;
    uint64_t v102 = a3[14];
    uint64_t v103 = a3[15];
    uint64_t v104 = &a1[v102];
    uint64_t v105 = (char **)((char *)a2 + v102);
    uint64_t v106 = v105[1];
    *(void *)uint64_t v104 = *v105;
    *((void *)v104 + 1) = v106;
    uint64_t v107 = &a1[v103];
    uint64_t v108 = (char **)((char *)a2 + v103);
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v109 = sub_25CF434C8();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v109 - 8) + 16))(v107, v108, v109);
    }
    else
    {
      *(void *)uint64_t v107 = *v108;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v22;
}

uint64_t sub_25CF19A04(id *a1, int *a2)
{
  long long v4 = (char *)a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for WidgetMessage();
  id v6 = &v4[*(int *)(v5 + 36)];
  uint64_t v7 = sub_25CF42AD8();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = (uint64_t)&v4[*(int *)(v5 + 56)];
  uint64_t v9 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (char *)a1 + a2[11];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v12 = (char *)a1 + a2[15];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_25CF434C8();
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);
    return v14(v12, v13);
  }
  else
  {
    return swift_release();
  }
}

void *sub_25CF19D5C(void *a1, uint64_t a2, int *a3)
{
  long long v4 = *(void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v3;
  uint64_t v5 = a3[5];
  id v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = a2 + v5;
  uint64_t v8 = *(void *)(a2 + v5 + 8);
  *id v6 = *(void *)(a2 + v5);
  v6[1] = v8;
  uint64_t v9 = *(void *)(a2 + v5 + 24);
  v6[2] = *(void *)(a2 + v5 + 16);
  v6[3] = v9;
  uint64_t v10 = *(void *)(a2 + v5 + 40);
  v6[4] = *(void *)(a2 + v5 + 32);
  v6[5] = v10;
  uint64_t v11 = *(void *)(a2 + v5 + 56);
  v6[6] = *(void *)(a2 + v5 + 48);
  v6[7] = v11;
  uint64_t v12 = *(void *)(a2 + v5 + 72);
  v6[8] = *(void *)(a2 + v5 + 64);
  v6[9] = v12;
  uint64_t v13 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v14 = v13[9];
  uint64_t v123 = v7 + v14;
  uint64_t v125 = (char *)v6 + v14;
  uint64_t v15 = sub_25CF42AD8();
  uint64_t v121 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  id v16 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v121(v125, v123, v15);
  *((unsigned char *)v6 + v13[10]) = *(unsigned char *)(v7 + v13[10]);
  *((unsigned char *)v6 + v13[11]) = *(unsigned char *)(v7 + v13[11]);
  *((unsigned char *)v6 + v13[12]) = *(unsigned char *)(v7 + v13[12]);
  *((unsigned char *)v6 + v13[13]) = *(unsigned char *)(v7 + v13[13]);
  uint64_t v17 = v13[14];
  uint64_t v18 = (char *)v6 + v17;
  uint64_t v19 = (const void *)(v7 + v17);
  uint64_t v20 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  *((unsigned char *)v6 + v13[15]) = *(unsigned char *)(v7 + v13[15]);
  uint64_t v22 = v13[16];
  uint64_t v23 = (void *)((char *)v6 + v22);
  uint64_t v24 = (void *)(v7 + v22);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = v13[17];
  uint64_t v27 = (void *)((char *)v6 + v26);
  uint64_t v28 = (void *)(v7 + v26);
  uint64_t v126 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v126;
  *((unsigned char *)v6 + v13[18]) = *(unsigned char *)(v7 + v13[18]);
  uint64_t v29 = v13[19];
  uint64_t v30 = (void *)((char *)v6 + v29);
  uint64_t v31 = (void *)(v7 + v29);
  uint64_t v124 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v124;
  uint64_t v32 = v13[20];
  uint64_t v33 = (void *)((char *)v6 + v32);
  uint64_t v34 = (void *)(v7 + v32);
  uint64_t v122 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v122;
  uint64_t v35 = v13[21];
  uint64_t v36 = (void *)((char *)v6 + v35);
  uint64_t v37 = (void *)(v7 + v35);
  uint64_t v120 = v37[1];
  void *v36 = *v37;
  v36[1] = v120;
  uint64_t v38 = v13[22];
  uint64_t v39 = (void *)((char *)v6 + v38);
  uint64_t v40 = (void *)(v7 + v38);
  uint64_t v119 = v40[1];
  void *v39 = *v40;
  v39[1] = v119;
  uint64_t v41 = v13[23];
  uint64_t v42 = (void *)((char *)v6 + v41);
  uint64_t v43 = (void *)(v7 + v41);
  uint64_t v118 = v43[1];
  *uint64_t v42 = *v43;
  v42[1] = v118;
  uint64_t v44 = v13[24];
  uint64_t v45 = (void *)((char *)v6 + v44);
  uint64_t v46 = (void *)(v7 + v44);
  uint64_t v117 = v46[1];
  *uint64_t v45 = *v46;
  v45[1] = v117;
  uint64_t v47 = v13[25];
  uint64_t v48 = (void *)((char *)v6 + v47);
  uint64_t v49 = (void *)(v7 + v47);
  uint64_t v116 = v49[1];
  *uint64_t v48 = *v49;
  v48[1] = v116;
  uint64_t v50 = v13[26];
  uint64_t v51 = (void *)((char *)v6 + v50);
  uint64_t v52 = (void *)(v7 + v50);
  uint64_t v115 = v52[1];
  void *v51 = *v52;
  v51[1] = v115;
  uint64_t v53 = v13[27];
  uint64_t v54 = (void *)((char *)v6 + v53);
  uint64_t v55 = (void *)(v7 + v53);
  uint64_t v114 = v55[1];
  *uint64_t v54 = *v55;
  v54[1] = v114;
  uint64_t v56 = v13[28];
  uint64_t v57 = (void *)((char *)v6 + v56);
  int v58 = (void *)(v7 + v56);
  uint64_t v113 = v58[1];
  *uint64_t v57 = *v58;
  v57[1] = v113;
  uint64_t v59 = v13[29];
  uint64_t v60 = (void *)((char *)v6 + v59);
  uint64_t v61 = (void *)(v7 + v59);
  uint64_t v112 = v61[1];
  *uint64_t v60 = *v61;
  v60[1] = v112;
  uint64_t v62 = v13[30];
  uint64_t v63 = (void *)((char *)v6 + v62);
  uint64_t v64 = (void *)(v7 + v62);
  uint64_t v65 = v64[1];
  *uint64_t v63 = *v64;
  v63[1] = v65;
  uint64_t v66 = v13[31];
  uint64_t v67 = (void *)((char *)v6 + v66);
  uint64_t v68 = (void *)(v7 + v66);
  uint64_t v69 = v68[1];
  *uint64_t v67 = *v68;
  v67[1] = v69;
  uint64_t v70 = v13[32];
  uint64_t v71 = (void *)((char *)v6 + v70);
  uint64_t v72 = (void *)(v7 + v70);
  uint64_t v73 = v72[1];
  void *v71 = *v72;
  v71[1] = v73;
  uint64_t v74 = v13[33];
  uint64_t v75 = (void *)((char *)v6 + v74);
  uint64_t v76 = (void *)(v7 + v74);
  uint64_t v77 = v76[1];
  *uint64_t v75 = *v76;
  v75[1] = v77;
  uint64_t v78 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *((unsigned char *)a1 + v78) = *(unsigned char *)(a2 + v78);
  uint64_t v79 = a3[8];
  uint64_t v80 = a3[9];
  uint64_t v81 = (void *)((char *)a1 + v79);
  uint64_t v82 = (void *)(a2 + v79);
  uint64_t v83 = v82[1];
  *uint64_t v81 = *v82;
  v81[1] = v83;
  uint64_t v84 = (void *)((char *)a1 + v80);
  uint64_t v85 = (void *)(a2 + v80);
  uint64_t v86 = v85[1];
  *uint64_t v84 = *v85;
  v84[1] = v86;
  uint64_t v87 = a3[10];
  uint64_t v88 = a3[11];
  uint64_t v89 = (void *)((char *)a1 + v87);
  uint64_t v90 = (void *)(a2 + v87);
  uint64_t v91 = v90[1];
  *uint64_t v89 = *v90;
  v89[1] = v91;
  uint64_t v110 = (char *)a1 + v88;
  uint64_t v111 = a2 + v88;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v92 - 8) + 16))(v110, v111, v92);
  uint64_t v93 = a3[12];
  uint64_t v94 = a3[13];
  uint64_t v95 = (void *)((char *)a1 + v93);
  uint64_t v96 = (void *)(a2 + v93);
  uint64_t v97 = v96[1];
  *uint64_t v95 = *v96;
  v95[1] = v97;
  uint64_t v98 = (void *)((char *)a1 + v94);
  uint64_t v99 = (void *)(a2 + v94);
  uint64_t v100 = v99[1];
  *uint64_t v98 = *v99;
  v98[1] = v100;
  uint64_t v101 = a3[14];
  uint64_t v102 = a3[15];
  uint64_t v103 = (void *)((char *)a1 + v101);
  uint64_t v104 = (void *)(a2 + v101);
  uint64_t v105 = v104[1];
  *uint64_t v103 = *v104;
  v103[1] = v105;
  uint64_t v106 = (void *)((char *)a1 + v102);
  uint64_t v107 = (void *)(a2 + v102);
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v108 = sub_25CF434C8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v108 - 8) + 16))(v106, v107, v108);
  }
  else
  {
    *uint64_t v106 = *v107;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_25CF1A2F4(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[2] = v11[2];
  v10[3] = v11[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[4] = v11[4];
  v10[5] = v11[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[6] = v11[6];
  v10[7] = v11[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[8] = v11[8];
  v10[9] = v11[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v13 = v12[9];
  uint64_t v14 = (char *)v10 + v13;
  uint64_t v15 = (char *)v11 + v13;
  uint64_t v16 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  *((unsigned char *)v10 + v12[10]) = *((unsigned char *)v11 + v12[10]);
  *((unsigned char *)v10 + v12[11]) = *((unsigned char *)v11 + v12[11]);
  *((unsigned char *)v10 + v12[12]) = *((unsigned char *)v11 + v12[12]);
  *((unsigned char *)v10 + v12[13]) = *((unsigned char *)v11 + v12[13]);
  uint64_t v17 = v12[14];
  uint64_t v18 = (char *)v10 + v17;
  uint64_t v19 = (char *)v11 + v17;
  uint64_t v20 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20);
  if (EnumTagSinglePayload)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v23 = *(void *)(v20 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v20);
LABEL_6:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v18, v19, v20);
LABEL_7:
  *((unsigned char *)v10 + v12[15]) = *((unsigned char *)v11 + v12[15]);
  uint64_t v25 = v12[16];
  uint64_t v26 = (void *)((char *)v10 + v25);
  uint64_t v27 = (void *)((char *)v11 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = v12[17];
  uint64_t v29 = (void *)((char *)v10 + v28);
  uint64_t v30 = (void *)((char *)v11 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)v10 + v12[18]) = *((unsigned char *)v11 + v12[18]);
  uint64_t v31 = v12[19];
  uint64_t v32 = (void *)((char *)v10 + v31);
  uint64_t v33 = (void *)((char *)v11 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = v12[20];
  uint64_t v35 = (void *)((char *)v10 + v34);
  uint64_t v36 = (void *)((char *)v11 + v34);
  void *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = v12[21];
  uint64_t v38 = (void *)((char *)v10 + v37);
  uint64_t v39 = (void *)((char *)v11 + v37);
  *uint64_t v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = v12[22];
  uint64_t v41 = (void *)((char *)v10 + v40);
  uint64_t v42 = (void *)((char *)v11 + v40);
  *uint64_t v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v43 = v12[23];
  uint64_t v44 = (void *)((char *)v10 + v43);
  uint64_t v45 = (void *)((char *)v11 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = v12[24];
  uint64_t v47 = (void *)((char *)v10 + v46);
  uint64_t v48 = (void *)((char *)v11 + v46);
  *uint64_t v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v49 = v12[25];
  uint64_t v50 = (void *)((char *)v10 + v49);
  uint64_t v51 = (void *)((char *)v11 + v49);
  *uint64_t v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v52 = v12[26];
  uint64_t v53 = (void *)((char *)v10 + v52);
  uint64_t v54 = (void *)((char *)v11 + v52);
  void *v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v55 = v12[27];
  uint64_t v56 = (void *)((char *)v10 + v55);
  uint64_t v57 = (void *)((char *)v11 + v55);
  *uint64_t v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = v12[28];
  uint64_t v59 = (void *)((char *)v10 + v58);
  uint64_t v60 = (void *)((char *)v11 + v58);
  *uint64_t v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v61 = v12[29];
  uint64_t v62 = (void *)((char *)v10 + v61);
  uint64_t v63 = (void *)((char *)v11 + v61);
  *uint64_t v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v12[30];
  uint64_t v65 = (void *)((char *)v10 + v64);
  uint64_t v66 = (void *)((char *)v11 + v64);
  *uint64_t v65 = *v66;
  v65[1] = v66[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v67 = v12[31];
  uint64_t v68 = (void *)((char *)v10 + v67);
  uint64_t v69 = (void *)((char *)v11 + v67);
  *uint64_t v68 = *v69;
  v68[1] = v69[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v70 = v12[32];
  uint64_t v71 = (void *)((char *)v10 + v70);
  uint64_t v72 = (void *)((char *)v11 + v70);
  void *v71 = *v72;
  v71[1] = v72[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v73 = v12[33];
  uint64_t v74 = (void *)((char *)v10 + v73);
  uint64_t v75 = (void *)((char *)v11 + v73);
  *uint64_t v74 = *v75;
  v74[1] = v75[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v76 = a3[8];
  uint64_t v77 = (void *)(a1 + v76);
  uint64_t v78 = (void *)(a2 + v76);
  *uint64_t v77 = *v78;
  v77[1] = v78[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v79 = a3[9];
  uint64_t v80 = (void *)(a1 + v79);
  uint64_t v81 = (void *)(a2 + v79);
  *uint64_t v80 = *v81;
  v80[1] = v81[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v82 = a3[10];
  uint64_t v83 = (void *)(a1 + v82);
  uint64_t v84 = (void *)(a2 + v82);
  *uint64_t v83 = *v84;
  v83[1] = v84[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v85 = a3[11];
  uint64_t v86 = a1 + v85;
  uint64_t v87 = a2 + v85;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 24))(v86, v87, v88);
  uint64_t v89 = a3[12];
  uint64_t v90 = (void *)(a1 + v89);
  uint64_t v91 = (void *)(a2 + v89);
  void *v90 = *v91;
  v90[1] = v91[1];
  swift_retain();
  swift_release();
  uint64_t v92 = a3[13];
  uint64_t v93 = (void *)(a1 + v92);
  uint64_t v94 = (void *)(a2 + v92);
  *uint64_t v93 = *v94;
  v93[1] = v94[1];
  swift_retain();
  swift_release();
  uint64_t v95 = a3[14];
  uint64_t v96 = (void *)(a1 + v95);
  uint64_t v97 = (void *)(a2 + v95);
  *uint64_t v96 = *v97;
  v96[1] = v97[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v98 = a3[15];
    uint64_t v99 = (void *)(a1 + v98);
    uint64_t v100 = (void *)(a2 + v98);
    sub_25CF219F0(a1 + v98, &qword_26A62F5E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v101 = sub_25CF434C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v101 - 8) + 16))(v99, v100, v101);
    }
    else
    {
      *uint64_t v99 = *v100;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_25CF1AAC8(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (_OWORD *)((char *)a1 + v6);
  id v8 = (char *)a2 + v6;
  long long v9 = *(_OWORD *)((char *)a2 + v6 + 16);
  *uint64_t v7 = *(_OWORD *)((char *)a2 + v6);
  v7[1] = v9;
  long long v10 = *(_OWORD *)((char *)a2 + v6 + 48);
  v7[2] = *(_OWORD *)((char *)a2 + v6 + 32);
  v7[3] = v10;
  v7[4] = *(_OWORD *)((char *)a2 + v6 + 64);
  uint64_t v11 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v12 = v11[9];
  uint64_t v13 = (char *)v7 + v12;
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *((unsigned char *)v7 + v11[10]) = v8[v11[10]];
  *((unsigned char *)v7 + v11[11]) = v8[v11[11]];
  *((unsigned char *)v7 + v11[12]) = v8[v11[12]];
  *((unsigned char *)v7 + v11[13]) = v8[v11[13]];
  uint64_t v16 = v11[14];
  uint64_t v17 = (char *)v7 + v16;
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  *((unsigned char *)v7 + v11[15]) = v8[v11[15]];
  *(_OWORD *)((char *)v7 + v11[16]) = *(_OWORD *)&v8[v11[16]];
  *(_OWORD *)((char *)v7 + v11[17]) = *(_OWORD *)&v8[v11[17]];
  *((unsigned char *)v7 + v11[18]) = v8[v11[18]];
  *(_OWORD *)((char *)v7 + v11[19]) = *(_OWORD *)&v8[v11[19]];
  *(_OWORD *)((char *)v7 + v11[20]) = *(_OWORD *)&v8[v11[20]];
  *(_OWORD *)((char *)v7 + v11[21]) = *(_OWORD *)&v8[v11[21]];
  *(_OWORD *)((char *)v7 + v11[22]) = *(_OWORD *)&v8[v11[22]];
  *(_OWORD *)((char *)v7 + v11[23]) = *(_OWORD *)&v8[v11[23]];
  *(_OWORD *)((char *)v7 + v11[24]) = *(_OWORD *)&v8[v11[24]];
  *(_OWORD *)((char *)v7 + v11[25]) = *(_OWORD *)&v8[v11[25]];
  *(_OWORD *)((char *)v7 + v11[26]) = *(_OWORD *)&v8[v11[26]];
  *(_OWORD *)((char *)v7 + v11[27]) = *(_OWORD *)&v8[v11[27]];
  *(_OWORD *)((char *)v7 + v11[28]) = *(_OWORD *)&v8[v11[28]];
  *(_OWORD *)((char *)v7 + v11[29]) = *(_OWORD *)&v8[v11[29]];
  *(_OWORD *)((char *)v7 + v11[30]) = *(_OWORD *)&v8[v11[30]];
  *(_OWORD *)((char *)v7 + v11[31]) = *(_OWORD *)&v8[v11[31]];
  *(_OWORD *)((char *)v7 + v11[32]) = *(_OWORD *)&v8[v11[32]];
  *(_OWORD *)((char *)v7 + v11[33]) = *(_OWORD *)&v8[v11[33]];
  uint64_t v21 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
  uint64_t v22 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  uint64_t v23 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  uint64_t v27 = a3[13];
  *(_OWORD *)((char *)a1 + a3[12]) = *(_OWORD *)((char *)a2 + a3[12]);
  *(_OWORD *)((char *)a1 + v27) = *(_OWORD *)((char *)a2 + v27);
  uint64_t v28 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_25CF434C8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  return a1;
}

void *sub_25CF1AE84(void *a1, void *a2, int *a3)
{
  uint64_t v6 = (void *)*a1;
  *a1 = *a2;

  a1[1] = a2[1];
  uint64_t v7 = a3[5];
  id v8 = (void *)((char *)a1 + v7);
  long long v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
  *id v8 = *(void *)((char *)a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v16 = v15[9];
  uint64_t v17 = (char *)v8 + v16;
  uint64_t v18 = (char *)v9 + v16;
  uint64_t v19 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *((unsigned char *)v8 + v15[10]) = *((unsigned char *)v9 + v15[10]);
  *((unsigned char *)v8 + v15[11]) = *((unsigned char *)v9 + v15[11]);
  *((unsigned char *)v8 + v15[12]) = *((unsigned char *)v9 + v15[12]);
  *((unsigned char *)v8 + v15[13]) = *((unsigned char *)v9 + v15[13]);
  uint64_t v20 = v15[14];
  uint64_t v21 = (char *)v8 + v20;
  uint64_t v22 = (char *)v9 + v20;
  uint64_t v23 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v23);
  int v25 = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23);
  if (EnumTagSinglePayload)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v26 = *(void *)(v23 - 8);
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v23);
LABEL_6:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v21, v22, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v21, v22, v23);
LABEL_7:
  *((unsigned char *)v8 + v15[15]) = *((unsigned char *)v9 + v15[15]);
  uint64_t v28 = v15[16];
  uint64_t v29 = (void *)((char *)v8 + v28);
  uint64_t v30 = (void *)((char *)v9 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = v15[17];
  uint64_t v34 = (void *)((char *)v8 + v33);
  uint64_t v35 = (void *)((char *)v9 + v33);
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  void *v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  *((unsigned char *)v8 + v15[18]) = *((unsigned char *)v9 + v15[18]);
  uint64_t v38 = v15[19];
  uint64_t v39 = (void *)((char *)v8 + v38);
  uint64_t v40 = (void *)((char *)v9 + v38);
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  void *v39 = v42;
  v39[1] = v41;
  swift_bridgeObjectRelease();
  uint64_t v43 = v15[20];
  uint64_t v44 = (void *)((char *)v8 + v43);
  uint64_t v45 = (void *)((char *)v9 + v43);
  uint64_t v47 = *v45;
  uint64_t v46 = v45[1];
  *uint64_t v44 = v47;
  v44[1] = v46;
  swift_bridgeObjectRelease();
  uint64_t v48 = v15[21];
  uint64_t v49 = (void *)((char *)v8 + v48);
  uint64_t v50 = (void *)((char *)v9 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  void *v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  uint64_t v53 = v15[22];
  uint64_t v54 = (void *)((char *)v8 + v53);
  uint64_t v55 = (void *)((char *)v9 + v53);
  uint64_t v57 = *v55;
  uint64_t v56 = v55[1];
  *uint64_t v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  uint64_t v58 = v15[23];
  uint64_t v59 = (void *)((char *)v8 + v58);
  uint64_t v60 = (void *)((char *)v9 + v58);
  uint64_t v62 = *v60;
  uint64_t v61 = v60[1];
  *uint64_t v59 = v62;
  v59[1] = v61;
  swift_bridgeObjectRelease();
  uint64_t v63 = v15[24];
  uint64_t v64 = (void *)((char *)v8 + v63);
  uint64_t v65 = (void *)((char *)v9 + v63);
  uint64_t v67 = *v65;
  uint64_t v66 = v65[1];
  *uint64_t v64 = v67;
  v64[1] = v66;
  swift_bridgeObjectRelease();
  uint64_t v68 = v15[25];
  uint64_t v69 = (void *)((char *)v8 + v68);
  uint64_t v70 = (void *)((char *)v9 + v68);
  uint64_t v72 = *v70;
  uint64_t v71 = v70[1];
  void *v69 = v72;
  v69[1] = v71;
  swift_bridgeObjectRelease();
  uint64_t v73 = v15[26];
  uint64_t v74 = (void *)((char *)v8 + v73);
  uint64_t v75 = (void *)((char *)v9 + v73);
  uint64_t v77 = *v75;
  uint64_t v76 = v75[1];
  *uint64_t v74 = v77;
  v74[1] = v76;
  swift_bridgeObjectRelease();
  uint64_t v78 = v15[27];
  uint64_t v79 = (void *)((char *)v8 + v78);
  uint64_t v80 = (void *)((char *)v9 + v78);
  uint64_t v82 = *v80;
  uint64_t v81 = v80[1];
  *uint64_t v79 = v82;
  v79[1] = v81;
  swift_bridgeObjectRelease();
  uint64_t v83 = v15[28];
  uint64_t v84 = (void *)((char *)v8 + v83);
  uint64_t v85 = (void *)((char *)v9 + v83);
  uint64_t v87 = *v85;
  uint64_t v86 = v85[1];
  *uint64_t v84 = v87;
  v84[1] = v86;
  swift_bridgeObjectRelease();
  uint64_t v88 = v15[29];
  uint64_t v89 = (void *)((char *)v8 + v88);
  uint64_t v90 = (void *)((char *)v9 + v88);
  uint64_t v92 = *v90;
  uint64_t v91 = v90[1];
  *uint64_t v89 = v92;
  v89[1] = v91;
  swift_bridgeObjectRelease();
  uint64_t v93 = v15[30];
  uint64_t v94 = (void *)((char *)v8 + v93);
  uint64_t v95 = (void *)((char *)v9 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  *uint64_t v94 = v97;
  v94[1] = v96;
  swift_bridgeObjectRelease();
  uint64_t v98 = v15[31];
  uint64_t v99 = (void *)((char *)v8 + v98);
  uint64_t v100 = (void *)((char *)v9 + v98);
  uint64_t v102 = *v100;
  uint64_t v101 = v100[1];
  *uint64_t v99 = v102;
  v99[1] = v101;
  swift_bridgeObjectRelease();
  uint64_t v103 = v15[32];
  uint64_t v104 = (void *)((char *)v8 + v103);
  uint64_t v105 = (void *)((char *)v9 + v103);
  uint64_t v107 = *v105;
  uint64_t v106 = v105[1];
  *uint64_t v104 = v107;
  v104[1] = v106;
  swift_bridgeObjectRelease();
  uint64_t v108 = v15[33];
  uint64_t v109 = (void *)((char *)v8 + v108);
  uint64_t v110 = (void *)((char *)v9 + v108);
  uint64_t v112 = *v110;
  uint64_t v111 = v110[1];
  *uint64_t v109 = v112;
  v109[1] = v111;
  swift_bridgeObjectRelease();
  uint64_t v113 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v113) = *((unsigned char *)a2 + v113);
  uint64_t v114 = a3[8];
  uint64_t v115 = (void *)((char *)a1 + v114);
  uint64_t v116 = (void *)((char *)a2 + v114);
  uint64_t v118 = *v116;
  uint64_t v117 = v116[1];
  *uint64_t v115 = v118;
  v115[1] = v117;
  swift_bridgeObjectRelease();
  uint64_t v119 = a3[9];
  uint64_t v120 = (void *)((char *)a1 + v119);
  uint64_t v121 = (void *)((char *)a2 + v119);
  uint64_t v123 = *v121;
  uint64_t v122 = v121[1];
  *uint64_t v120 = v123;
  v120[1] = v122;
  swift_bridgeObjectRelease();
  uint64_t v124 = a3[10];
  uint64_t v125 = (void *)((char *)a1 + v124);
  uint64_t v126 = (void *)((char *)a2 + v124);
  uint64_t v128 = *v126;
  uint64_t v127 = v126[1];
  *uint64_t v125 = v128;
  v125[1] = v127;
  swift_bridgeObjectRelease();
  uint64_t v129 = a3[11];
  uint64_t v130 = (char *)a1 + v129;
  uint64_t v131 = (char *)a2 + v129;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 40))(v130, v131, v132);
  uint64_t v133 = a3[12];
  uint64_t v134 = (void *)((char *)a1 + v133);
  uint64_t v135 = (void *)((char *)a2 + v133);
  *uint64_t v134 = *v135;
  v134[1] = v135[1];
  swift_release();
  uint64_t v136 = a3[13];
  v137 = (void *)((char *)a1 + v136);
  long long v138 = (void *)((char *)a2 + v136);
  void *v137 = *v138;
  v137[1] = v138[1];
  swift_release();
  uint64_t v139 = a3[14];
  uint64_t v140 = (void *)((char *)a1 + v139);
  uint64_t v141 = (void *)((char *)a2 + v139);
  *uint64_t v140 = *v141;
  v140[1] = v141[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v142 = a3[15];
    long long v143 = (char *)a1 + v142;
    long long v144 = (char *)a2 + v142;
    sub_25CF219F0((uint64_t)a1 + v142, &qword_26A62F5E0);
    uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v146 = sub_25CF434C8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v146 - 8) + 32))(v143, v144, v146);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v143, v144, *(void *)(*(void *)(v145 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25CF1B4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF1B4CC);
}

uint64_t sub_25CF1B4CC(uint64_t a1, uint64_t a2, int *a3)
{
  type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[5];
    goto LABEL_10;
  }
  if (a2 != 0x7FFFFFFF)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v9 = a3[11];
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E8);
      uint64_t v9 = a3[15];
    }
LABEL_10:
    return __swift_getEnumTagSinglePayload(a1 + v9, a2, v8);
  }
  unint64_t v10 = *(void *)(a1 + a3[8] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_25CF1B5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF1B5C0);
}

void sub_25CF1B5C0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[8] + 8) = (a2 - 1);
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v11 = a4[11];
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E8);
      uint64_t v11 = a4[15];
    }
  }
  __swift_storeEnumTagSinglePayload(a1 + v11, a2, a2, v10);
}

uint64_t type metadata accessor for MessageView()
{
  uint64_t result = qword_26A62F5F0;
  if (!qword_26A62F5F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25CF1B6E4()
{
  type metadata accessor for WidgetMessage();
  if (v0 <= 0x3F)
  {
    sub_25CF1B81C();
    if (v1 <= 0x3F)
    {
      sub_25CF1B8C4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25CF1B81C()
{
  if (!qword_26A62F600)
  {
    sub_25CF1B878();
    unint64_t v0 = sub_25CF43188();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A62F600);
    }
  }
}

unint64_t sub_25CF1B878()
{
  unint64_t result = qword_26A62F608;
  if (!qword_26A62F608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F608);
  }
  return result;
}

void sub_25CF1B8C4()
{
  if (!qword_26A62F610)
  {
    sub_25CF434C8();
    unint64_t v0 = sub_25CF43148();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A62F610);
    }
  }
}

uint64_t sub_25CF1B91C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF1B938@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10)
{
  uint64_t v16 = sub_25CF43768();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1();
  uint64_t v22 = v21 - v20;
  sub_25CF43D18();
  sub_25CF0F430((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  *a9 = sub_25CF432A8();
  a9[1] = v23;
  uint64_t v24 = (int *)type metadata accessor for MessageView();
  sub_25CF21A40(a1, (uint64_t)a9 + v24[5], (void (*)(void))type metadata accessor for WidgetMessage);
  *(uint64_t *)((char *)a9 + v24[6]) = a2;
  *((unsigned char *)a9 + v24[7]) = a3;
  int v25 = (uint64_t *)((char *)a9 + v24[8]);
  *int v25 = a4;
  v25[1] = a5;
  uint64_t v26 = (uint64_t *)((char *)a9 + v24[9]);
  *uint64_t v26 = a6;
  v26[1] = a7;
  uint64_t v27 = (uint64_t *)((char *)a9 + v24[10]);
  *uint64_t v27 = a8;
  v27[1] = a10;
  (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v22, *MEMORY[0x263F1A6C0], v16);
  sub_25CF1B878();
  sub_25CF43168();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_4();
  uint64_t v28 = (uint64_t *)((char *)a9 + v24[15]);
  *uint64_t v28 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
  return swift_storeEnumTagMultiPayload();
}

double sub_25CF1BB5C()
{
  uint64_t v0 = sub_25CF434C8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  long long v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v10 - v5;
  type metadata accessor for MessageView();
  sub_25CF2F234((uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F199C8], v0);
  BOOL v7 = sub_25CF1BCDC((uint64_t)v6, (uint64_t)v4);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  double result = 20.0;
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
    sub_25CF43178();
    return *(double *)&v10[1];
  }
  return result;
}

BOOL sub_25CF1BCDC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v3 = sub_25CF434C8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
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

uint64_t sub_25CF1C0F4()
{
  uint64_t v2 = type metadata accessor for MessageView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F618);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8_3();
  *(void *)uint64_t v1 = sub_25CF43448();
  *(void *)(v1 + 8) = 0;
  *(unsigned char *)(v1 + 16) = 0;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F620);
  sub_25CF1C2C0(v0, v1 + *(int *)(v6 + 44));
  sub_25CF20D40(v0, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_25CF21A40((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, (void (*)(void))type metadata accessor for MessageView);
  sub_25CEFDA10(&qword_26A62F628, &qword_26A62F618);
  sub_25CF43878();
  swift_release();
  return sub_25CF219F0(v1, &qword_26A62F618);
}

uint64_t sub_25CF1C2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F630);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  unint64_t v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v24[-v8 - 8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F638);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v11);
  int v15 = &v24[-v14 - 8];
  int v25 = &type metadata for Features;
  unint64_t v26 = sub_25CF0911C();
  v24[0] = 2;
  char v16 = sub_25CF42BD8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  if (v16)
  {
    *(void *)int v15 = sub_25CF43448();
    *((void *)v15 + 1) = 0x4020000000000000;
    v15[16] = 0;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F658);
    sub_25CF1C51C(a1, (uint64_t)&v15[*(int *)(v17 + 44)]);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F640);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, v18, 1, v19);
  *(void *)uint64_t v9 = sub_25CF434E8();
  *((void *)v9 + 1) = 0x4008000000000000;
  v9[16] = 0;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F648);
  sub_25CF1D7CC(a1, (uint64_t)&v9[*(int *)(v20 + 44)]);
  sub_25CEFDAA8((uint64_t)v15, (uint64_t)v13, &qword_26A62F638);
  sub_25CEFDAA8((uint64_t)v9, (uint64_t)v7, &qword_26A62F630);
  sub_25CEFDAA8((uint64_t)v13, a2, &qword_26A62F638);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F650);
  sub_25CEFDAA8((uint64_t)v7, a2 + *(int *)(v21 + 48), &qword_26A62F630);
  sub_25CF219F0((uint64_t)v9, &qword_26A62F630);
  sub_25CF219F0((uint64_t)v15, &qword_26A62F638);
  sub_25CF219F0((uint64_t)v7, &qword_26A62F630);
  return sub_25CF219F0((uint64_t)v13, &qword_26A62F638);
}

uint64_t sub_25CF1C51C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = sub_25CF42B68();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v66 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25CF42B98();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v59 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_25CF43B48();
  uint64_t v62 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v60 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2F8);
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v64 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v61 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F660);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F668);
  uint64_t v13 = MEMORY[0x270FA5388](v58);
  int v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v53 - v16;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F670);
  MEMORY[0x270FA5388](v57);
  uint64_t v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F678);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F680);
  uint64_t v23 = MEMORY[0x270FA5388](v56);
  int v25 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v53 - v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F688);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v54 = (uint64_t)&v53 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v53 - v31;
  uint64_t v33 = a1 + *(int *)(type metadata accessor for MessageView() + 20);
  uint64_t v53 = type metadata accessor for WidgetMessage();
  uint64_t v34 = *(int *)(v53 + 44);
  uint64_t v55 = v33;
  if (*(unsigned char *)(v33 + v34) == 1)
  {
    sub_25CF1CD10((uint64_t)v22);
    sub_25CF1BB5C();
    sub_25CF43AD8();
    sub_25CF431C8();
    sub_25CEFDAA8((uint64_t)v22, (uint64_t)v25, &qword_26A62F678);
    uint64_t v35 = &v25[*(int *)(v56 + 36)];
    long long v36 = v73;
    *(_OWORD *)uint64_t v35 = v72;
    *((_OWORD *)v35 + 1) = v36;
    *((_OWORD *)v35 + 2) = v74;
    sub_25CF219F0((uint64_t)v22, &qword_26A62F678);
    uint64_t v37 = &qword_26A62F680;
    sub_25CF17788((uint64_t)v25, (uint64_t)v27, &qword_26A62F680);
    sub_25CEFDAA8((uint64_t)v27, (uint64_t)v19, &qword_26A62F680);
    swift_storeEnumTagMultiPayload();
    sub_25CF2110C();
    sub_25CF2138C();
    sub_25CF43518();
    uint64_t v38 = (uint64_t)v27;
  }
  else
  {
    sub_25CF1D340((uint64_t)v12);
    sub_25CF1BB5C();
    sub_25CF43AA8();
    sub_25CF431C8();
    sub_25CEFDAA8((uint64_t)v12, (uint64_t)v15, &qword_26A62F660);
    uint64_t v39 = &v15[*(int *)(v58 + 36)];
    long long v40 = v73;
    *(_OWORD *)uint64_t v39 = v72;
    *((_OWORD *)v39 + 1) = v40;
    *((_OWORD *)v39 + 2) = v74;
    sub_25CF219F0((uint64_t)v12, &qword_26A62F660);
    uint64_t v37 = &qword_26A62F668;
    sub_25CF17788((uint64_t)v15, (uint64_t)v17, &qword_26A62F668);
    sub_25CEFDAA8((uint64_t)v17, (uint64_t)v19, &qword_26A62F668);
    swift_storeEnumTagMultiPayload();
    sub_25CF2110C();
    sub_25CF2138C();
    sub_25CF43518();
    uint64_t v38 = (uint64_t)v17;
  }
  sub_25CF219F0(v38, v37);
  sub_25CF42B88();
  uint64_t v41 = v60;
  sub_25CF43B58();
  uint64_t v43 = v66;
  uint64_t v42 = v67;
  uint64_t v44 = v68;
  (*(void (**)(char *, void, uint64_t))(v67 + 104))(v66, *MEMORY[0x263F764D0], v68);
  uint64_t v45 = sub_25CF0F430(&qword_26A62F300, MEMORY[0x263F77558]);
  uint64_t v46 = v61;
  uint64_t v47 = v65;
  sub_25CF43818();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v41, v47);
  uint64_t v70 = v47;
  uint64_t v71 = v45;
  swift_getOpaqueTypeConformance2();
  uint64_t v48 = v64;
  uint64_t v49 = sub_25CF437E8();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v46, v48);
  uint64_t v50 = v54;
  sub_25CEFDAA8((uint64_t)v32, v54, &qword_26A62F688);
  uint64_t v51 = v69;
  sub_25CEFDAA8(v50, v69, &qword_26A62F688);
  *(void *)(v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F700) + 48)) = v49;
  swift_retain();
  sub_25CF219F0((uint64_t)v32, &qword_26A62F688);
  swift_release();
  return sub_25CF219F0(v50, &qword_26A62F688);
}

uint64_t sub_25CF1CD10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F708);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v53 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25CF43718();
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for MessageView();
  MEMORY[0x270FA5388](v55);
  uint64_t v56 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_25CF43998();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6C8);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (uint64_t *)((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6B8);
  MEMORY[0x270FA5388](v57);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6A8);
  MEMORY[0x270FA5388](v58);
  uint64_t v49 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25CF43978();
  uint64_t v61 = &type metadata for Features;
  unint64_t v62 = sub_25CF0911C();
  v60[0] = 2;
  char v22 = sub_25CF42BD8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  uint64_t v23 = (unsigned int *)MEMORY[0x263F1B540];
  if ((v22 & 1) == 0) {
    uint64_t v23 = (unsigned int *)MEMORY[0x263F1B538];
  }
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *v23, v10);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)v9 + *(int *)(v7 + 36), v13, v10);
  *uint64_t v9 = KeyPath;
  sub_25CEFDAA8((uint64_t)v9, (uint64_t)v17 + *(int *)(v15 + 44), &qword_26A62F2A0);
  *uint64_t v17 = v21;
  swift_retain();
  sub_25CF219F0((uint64_t)v9, &qword_26A62F2A0);
  uint64_t v25 = v10;
  uint64_t v26 = v55;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
  swift_release();
  uint64_t v27 = v59;
  uint64_t v28 = v59 + *(int *)(v26 + 20);
  LODWORD(v28) = *(unsigned __int8 *)(v28 + *(int *)(type metadata accessor for WidgetMessage() + 40));
  uint64_t v29 = v27;
  uint64_t v30 = v56;
  sub_25CF20D40(v29, v56);
  if (v28 != 1)
  {
    sub_25CF2162C(v30);
    uint64_t v33 = (uint64_t)v53;
    uint64_t v32 = v54;
    uint64_t v35 = v51;
    uint64_t v34 = v52;
    uint64_t v37 = (uint64_t)v49;
    long long v36 = v50;
    goto LABEL_7;
  }
  char v31 = *(unsigned char *)(v30 + *(int *)(v26 + 28));
  sub_25CF2162C(v30);
  uint64_t v33 = (uint64_t)v53;
  uint64_t v32 = v54;
  uint64_t v35 = v51;
  uint64_t v34 = v52;
  uint64_t v37 = (uint64_t)v49;
  long long v36 = v50;
  if (v31)
  {
LABEL_7:
    sub_25CF43688();
    goto LABEL_8;
  }
  sub_25CF43748();
LABEL_8:
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v36, *MEMORY[0x263F1A680], v34);
  uint64_t v38 = sub_25CF43738();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v34);
  uint64_t v39 = swift_getKeyPath();
  sub_25CEFDAA8((uint64_t)v17, (uint64_t)v19, &qword_26A62F6C8);
  long long v40 = (uint64_t *)&v19[*(int *)(v57 + 36)];
  *long long v40 = v39;
  v40[1] = v38;
  sub_25CF219F0((uint64_t)v17, &qword_26A62F6C8);
  uint64_t v41 = sub_25CF43908();
  uint64_t v42 = swift_getKeyPath();
  sub_25CEFDAA8((uint64_t)v19, v37, &qword_26A62F6B8);
  uint64_t v43 = (uint64_t *)(v37 + *(int *)(v58 + 36));
  uint64_t *v43 = v42;
  v43[1] = v41;
  sub_25CF219F0((uint64_t)v19, &qword_26A62F6B8);
  sub_25CF434F8();
  uint64_t v44 = sub_25CF43508();
  __swift_storeEnumTagSinglePayload(v33, 0, 1, v44);
  uint64_t v45 = swift_getKeyPath();
  uint64_t v46 = (uint64_t *)(v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F678) + 36));
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6E8);
  sub_25CEFDAA8(v33, (uint64_t)v46 + *(int *)(v47 + 28), &qword_26A62F708);
  *uint64_t v46 = v45;
  sub_25CEFDAA8(v37, v32, &qword_26A62F6A8);
  sub_25CF219F0(v33, &qword_26A62F708);
  return sub_25CF219F0(v37, &qword_26A62F6A8);
}

uint64_t sub_25CF1D340@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F708);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v41 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25CF43718();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v38 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_25CF43998();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6C8);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6B8);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  uint64_t v37 = (uint64_t)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_25CF43978();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B538], v9);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v8 + *(int *)(v6 + 36), v12, v9);
  *uint64_t v8 = KeyPath;
  sub_25CEFDAA8((uint64_t)v8, (uint64_t)v16 + *(int *)(v14 + 44), &qword_26A62F2A0);
  *uint64_t v16 = v20;
  swift_retain();
  sub_25CF219F0((uint64_t)v8, &qword_26A62F2A0);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  sub_25CF43748();
  uint64_t v23 = v38;
  uint64_t v22 = v39;
  uint64_t v24 = v40;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, *MEMORY[0x263F1A680], v40);
  uint64_t v25 = sub_25CF43738();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = v37;
  sub_25CEFDAA8((uint64_t)v16, v37, &qword_26A62F6C8);
  uint64_t v28 = (uint64_t *)(v27 + *(int *)(v18 + 44));
  *uint64_t v28 = v26;
  v28[1] = v25;
  sub_25CF219F0((uint64_t)v16, &qword_26A62F6C8);
  uint64_t v29 = (uint64_t)v41;
  sub_25CF434F8();
  uint64_t v30 = sub_25CF43508();
  __swift_storeEnumTagSinglePayload(v29, 0, 1, v30);
  uint64_t v31 = swift_getKeyPath();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F660);
  uint64_t v33 = v42;
  uint64_t v34 = (uint64_t *)(v42 + *(int *)(v32 + 36));
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6E8);
  sub_25CEFDAA8(v29, (uint64_t)v34 + *(int *)(v35 + 28), &qword_26A62F708);
  uint64_t *v34 = v31;
  sub_25CEFDAA8(v27, v33, &qword_26A62F6B8);
  sub_25CF219F0(v29, &qword_26A62F708);
  return sub_25CF219F0(v27, &qword_26A62F6B8);
}

uint64_t sub_25CF1D7CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v93 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F710);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v87 = (uint64_t)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F718);
  MEMORY[0x270FA5388](v90);
  uint64_t v86 = (uint64_t)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F720);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v92 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v91 = (uint64_t)&v85 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F728);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v95 = (uint64_t *)((char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F730) - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v97);
  uint64_t v89 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v96 = (uint64_t)&v85 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v101 = (uint64_t)&v85 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F738);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F740);
  uint64_t v21 = v20 - 8;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v88 = (char *)&v85 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v85 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v102 = (uint64_t)&v85 - v27;
  *(void *)uint64_t v19 = sub_25CF43438();
  *((void *)v19 + 1) = 0x4000000000000000;
  v19[16] = 0;
  uint64_t v28 = (uint64_t)&v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F748) + 44)];
  uint64_t v99 = a1;
  sub_25CF1E000(a1, v28);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v100 = type metadata accessor for MessageView();
  uint64_t v30 = (uint64_t *)(a1 + *(int *)(v100 + 48));
  uint64_t v31 = *v30;
  uint64_t v32 = v30[1];
  uint64_t v103 = v31;
  uint64_t v104 = v32;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F750);
  sub_25CF439E8();
  uint64_t v34 = v105;
  uint64_t v33 = v106;
  uint64_t v35 = v107;
  long long v36 = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
  *((void *)v36 + 2) = v34;
  *((void *)v36 + 3) = v33;
  *((void *)v36 + 4) = v35;
  *((void *)v36 + 5) = KeyPath;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v37 = sub_25CF43AC8();
  uint64_t v39 = v38;
  sub_25CEFDAA8((uint64_t)v19, (uint64_t)v26, &qword_26A62F738);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v40 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v26[*(int *)(v21 + 44)];
  uint64_t v94 = sub_25CF3BF88;
  *uint64_t v40 = sub_25CF3BF88;
  v40[1] = 0;
  v40[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_25CF217AC;
  v40[3] = v36;
  v40[4] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v37;
  v40[5] = v39;
  sub_25CF219F0((uint64_t)v19, &qword_26A62F738);
  sub_25CF17788((uint64_t)v26, v102, &qword_26A62F740);
  uint64_t v41 = sub_25CF43438();
  uint64_t v42 = (uint64_t)v95;
  *uint64_t v95 = v41;
  *(void *)(v42 + 8) = 0x4010000000000000;
  *(unsigned char *)(v42 + 16) = 0;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F758);
  uint64_t v44 = v99;
  sub_25CF1EB80(v99, v42 + *(int *)(v43 + 44));
  uint64_t v45 = swift_getKeyPath();
  uint64_t v46 = (uint64_t *)(v44 + *(int *)(v100 + 52));
  uint64_t v47 = *v46;
  uint64_t v48 = v46[1];
  uint64_t v103 = v47;
  uint64_t v104 = v48;
  sub_25CF439E8();
  uint64_t v50 = v105;
  uint64_t v49 = v106;
  uint64_t v51 = v107;
  uint64_t v52 = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
  *((void *)v52 + 2) = v50;
  *((void *)v52 + 3) = v49;
  *((void *)v52 + 4) = v51;
  *((void *)v52 + 5) = v45;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v53 = sub_25CF43AC8();
  uint64_t v55 = v54;
  uint64_t v56 = v96;
  sub_25CEFDAA8(v42, v96, &qword_26A62F728);
  swift_release();
  uint64_t v57 = v99;
  uint64_t v58 = (int *)v100;
  swift_release();
  swift_release();
  uint64_t v59 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v56 + *(int *)(v97 + 44));
  *uint64_t v59 = v94;
  v59[1] = 0;
  v59[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_25CF21B78;
  v59[3] = v52;
  v59[4] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v53;
  v59[5] = v55;
  sub_25CF219F0(v42, &qword_26A62F728);
  sub_25CF17788(v56, v101, &qword_26A62F730);
  if (*(void *)(v57 + v58[5] + 56) && *(uint64_t *)(v57 + v58[6]) >= 1)
  {
    uint64_t v60 = v87;
    sub_25CF202C0(v87);
    uint64_t v61 = swift_getKeyPath();
    unint64_t v62 = (uint64_t *)(v57 + v58[14]);
    uint64_t v63 = *v62;
    uint64_t v64 = v62[1];
    uint64_t v103 = v63;
    uint64_t v104 = v64;
    sub_25CF439E8();
    uint64_t v65 = v105;
    uint64_t v66 = v106;
    uint64_t v67 = v107;
    uint64_t v68 = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
    *((void *)v68 + 2) = v65;
    *((void *)v68 + 3) = v66;
    *((void *)v68 + 4) = v67;
    *((void *)v68 + 5) = v61;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v69 = sub_25CF43AC8();
    uint64_t v71 = v70;
    uint64_t v72 = v86;
    sub_25CEFDAA8(v60, v86, &qword_26A62F710);
    swift_release();
    swift_release();
    swift_release();
    uint64_t v73 = v90;
    long long v74 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v72 + *(int *)(v90 + 36));
    *long long v74 = sub_25CF3BF88;
    v74[1] = 0;
    v74[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_25CF21B78;
    v74[3] = v68;
    v74[4] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v69;
    v74[5] = v71;
    sub_25CF219F0(v60, &qword_26A62F710);
    uint64_t v75 = v91;
    sub_25CF17788(v72, v91, &qword_26A62F718);
    uint64_t v76 = 0;
    uint64_t v78 = (uint64_t)v92;
    uint64_t v77 = v93;
  }
  else
  {
    uint64_t v76 = 1;
    uint64_t v78 = (uint64_t)v92;
    uint64_t v77 = v93;
    uint64_t v73 = v90;
    uint64_t v75 = v91;
  }
  uint64_t v79 = (uint64_t)v89;
  uint64_t v80 = (uint64_t)v88;
  __swift_storeEnumTagSinglePayload(v75, v76, 1, v73);
  uint64_t v81 = v102;
  sub_25CEFDAA8(v102, v80, &qword_26A62F740);
  uint64_t v82 = v101;
  sub_25CEFDAA8(v101, v79, &qword_26A62F730);
  sub_25CEFDAA8(v75, v78, &qword_26A62F720);
  sub_25CEFDAA8(v80, v77, &qword_26A62F740);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F760);
  sub_25CEFDAA8(v79, v77 + *(int *)(v83 + 48), &qword_26A62F730);
  sub_25CEFDAA8(v78, v77 + *(int *)(v83 + 64), &qword_26A62F720);
  sub_25CF219F0(v75, &qword_26A62F720);
  sub_25CF219F0(v82, &qword_26A62F730);
  sub_25CF219F0(v81, &qword_26A62F740);
  sub_25CF219F0(v78, &qword_26A62F720);
  sub_25CF219F0(v79, &qword_26A62F730);
  return sub_25CF219F0(v80, &qword_26A62F740);
}

uint64_t sub_25CF1E000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7A8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&KeyPath - v7;
  *(void *)uint64_t v8 = sub_25CF43438();
  *((void *)v8 + 1) = 0x4010000000000000;
  v8[16] = 0;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7B0);
  sub_25CF1E284(a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  type metadata accessor for MessageView();
  uint64_t v32 = sub_25CF3D2F4();
  uint64_t v33 = v10;
  sub_25CEFDB04();
  uint64_t v11 = sub_25CF437D8();
  uint64_t v13 = v12;
  uint64_t v29 = v14;
  char v16 = v15 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = sub_25CF43728();
  uint64_t v18 = swift_getKeyPath();
  uint64_t v19 = sub_25CF43958();
  uint64_t v20 = swift_getKeyPath();
  uint64_t v30 = v6;
  sub_25CEFDAA8((uint64_t)v8, (uint64_t)v6, &qword_26A62F7A8);
  uint64_t v21 = (uint64_t)v6;
  uint64_t v22 = v31;
  sub_25CEFDAA8(v21, v31, &qword_26A62F7A8);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7B8);
  uint64_t v24 = v22 + *(int *)(v23 + 48);
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = 1;
  uint64_t v25 = v22 + *(int *)(v23 + 64);
  *(void *)uint64_t v25 = v11;
  *(void *)(v25 + 8) = v13;
  *(unsigned char *)(v25 + 16) = v16;
  uint64_t v26 = KeyPath;
  *(void *)(v25 + 24) = v29;
  *(void *)(v25 + 32) = 0x3FF0000000000000;
  *(void *)(v25 + 40) = v26;
  *(void *)(v25 + 48) = 1;
  *(unsigned char *)(v25 + 56) = 0;
  *(void *)(v25 + 64) = v18;
  *(void *)(v25 + 72) = v17;
  *(void *)(v25 + 80) = v20;
  *(void *)(v25 + 88) = v19;
  *(void *)(v25 + 96) = 0x3FE8000000000000;
  sub_25CF11FC8(v11, v13, v16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25CF219F0((uint64_t)v8, &qword_26A62F7A8);
  sub_25CF0F360(v11, v13, v16);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_25CF219F0((uint64_t)v30, &qword_26A62F7A8);
}

uint64_t sub_25CF1E284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F660);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v63 = (uint64_t)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F668);
  uint64_t v5 = MEMORY[0x270FA5388](KeyPath);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v64 = (uint64_t)&v58 - v8;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7C0);
  MEMORY[0x270FA5388](v65);
  uint64_t v67 = (uint64_t)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7C8);
  MEMORY[0x270FA5388](v59);
  uint64_t v60 = (uint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7D0);
  MEMORY[0x270FA5388](v66);
  unint64_t v62 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F678);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F680);
  uint64_t v15 = MEMORY[0x270FA5388](v58);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v61 = (uint64_t)&v58 - v18;
  uint64_t v19 = type metadata accessor for MessageView();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7D8);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v68 = (uint64_t)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v71 = (uint64_t)&v58 - v25;
  uint64_t v26 = a1 + *(int *)(v19 + 20);
  uint64_t v27 = type metadata accessor for WidgetMessage();
  int v28 = *(unsigned __int8 *)(v26 + *(int *)(v27 + 40));
  uint64_t v29 = a1;
  sub_25CF20D40(a1, (uint64_t)v21);
  if (v28 == 1)
  {
    char v30 = v21[*(int *)(v19 + 28)];
    sub_25CF2162C((uint64_t)v21);
    if ((v30 & 1) == 0)
    {
      uint64_t v31 = a1;
      sub_25CF1FE1C(MEMORY[0x263F1A5C8], MEMORY[0x263F1B3F0], (uint64_t)v14);
      sub_25CF1BB5C();
      sub_25CF43AC8();
      sub_25CF431C8();
      sub_25CEFDAA8((uint64_t)v14, (uint64_t)v17, &qword_26A62F678);
      uint64_t v32 = &v17[*(int *)(v58 + 36)];
      long long v33 = v75;
      *(_OWORD *)uint64_t v32 = v74;
      *((_OWORD *)v32 + 1) = v33;
      *((_OWORD *)v32 + 2) = v76;
      sub_25CF219F0((uint64_t)v14, &qword_26A62F678);
      uint64_t v34 = v61;
      sub_25CF17788((uint64_t)v17, v61, &qword_26A62F680);
      sub_25CEFDAA8(v34, v60, &qword_26A62F680);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      sub_25CF2110C();
      uint64_t v45 = (uint64_t)v62;
      sub_25CF43518();
      sub_25CEFDAA8(v45, v67, &qword_26A62F7D0);
      swift_storeEnumTagMultiPayload();
      sub_25CF2197C();
      sub_25CF2138C();
      uint64_t v40 = v71;
      sub_25CF43518();
      sub_25CF219F0(v45, &qword_26A62F7D0);
      uint64_t v41 = v34;
      uint64_t v42 = &qword_26A62F680;
      goto LABEL_10;
    }
  }
  else
  {
    sub_25CF2162C((uint64_t)v21);
  }
  if (*(unsigned char *)(v26 + *(int *)(v27 + 44)) == 1)
  {
    *((void *)&v75 + 1) = &type metadata for Features;
    *(void *)&long long v76 = sub_25CF0911C();
    LOBYTE(v74) = 2;
    char v35 = sub_25CF42BD8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v74);
    if ((v35 & 1) == 0)
    {
      uint64_t v31 = a1;
      sub_25CF1CD10((uint64_t)v14);
      sub_25CF1BB5C();
      sub_25CF43AC8();
      sub_25CF431C8();
      sub_25CEFDAA8((uint64_t)v14, (uint64_t)v17, &qword_26A62F678);
      uint64_t v43 = &v17[*(int *)(v58 + 36)];
      long long v44 = v75;
      *(_OWORD *)uint64_t v43 = v74;
      *((_OWORD *)v43 + 1) = v44;
      *((_OWORD *)v43 + 2) = v76;
      sub_25CF219F0((uint64_t)v14, &qword_26A62F678);
      uint64_t v34 = v61;
      sub_25CF17788((uint64_t)v17, v61, &qword_26A62F680);
      sub_25CEFDAA8(v34, v60, &qword_26A62F680);
      goto LABEL_9;
    }
  }
  uint64_t v36 = v63;
  uint64_t v31 = v29;
  sub_25CF1D340(v63);
  *((void *)&v75 + 1) = &type metadata for Features;
  *(void *)&long long v76 = sub_25CF0911C();
  LOBYTE(v74) = 2;
  sub_25CF42BD8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v74);
  sub_25CF1BB5C();
  sub_25CF43AA8();
  sub_25CF431C8();
  sub_25CEFDAA8(v36, (uint64_t)v7, &qword_26A62F660);
  uint64_t v37 = &v7[*(int *)(KeyPath + 36)];
  long long v38 = v75;
  *(_OWORD *)uint64_t v37 = v74;
  *((_OWORD *)v37 + 1) = v38;
  *((_OWORD *)v37 + 2) = v76;
  sub_25CF219F0(v36, &qword_26A62F660);
  uint64_t v39 = v64;
  sub_25CF17788((uint64_t)v7, v64, &qword_26A62F668);
  sub_25CEFDAA8(v39, v67, &qword_26A62F668);
  swift_storeEnumTagMultiPayload();
  sub_25CF2197C();
  sub_25CF2138C();
  uint64_t v40 = v71;
  sub_25CF43518();
  uint64_t v41 = v39;
  uint64_t v42 = &qword_26A62F668;
LABEL_10:
  sub_25CF219F0(v41, v42);
  sub_25CF208CC(v31, (uint64_t)v72);
  uint64_t v46 = v72[0];
  uint64_t v47 = v72[1];
  uint64_t v48 = v72[2];
  uint64_t v49 = v72[3];
  char v50 = v73;
  uint64_t KeyPath = swift_getKeyPath();
  sub_25CF43758();
  sub_25CF436D8();
  uint64_t v51 = sub_25CF43708();
  swift_release();
  uint64_t v52 = swift_getKeyPath();
  uint64_t v53 = v40;
  uint64_t v54 = v68;
  sub_25CEFDAA8(v53, v68, &qword_26A62F7D8);
  uint64_t v55 = v70;
  sub_25CEFDAA8(v54, v70, &qword_26A62F7D8);
  uint64_t v56 = v55 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7E8) + 48);
  *(void *)uint64_t v56 = v46;
  *(void *)(v56 + 8) = v47;
  *(void *)(v56 + 16) = v48;
  *(void *)(v56 + 24) = v49;
  *(unsigned char *)(v56 + 32) = v50;
  *(void *)(v56 + 40) = KeyPath;
  *(void *)(v56 + 48) = 1;
  *(unsigned char *)(v56 + 56) = 0;
  *(void *)(v56 + 64) = v52;
  *(void *)(v56 + 72) = v51;
  sub_25CF21904(v46, v47, v48);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25CF219F0(v71, &qword_26A62F7D8);
  sub_25CF21940(v46, v47, v48);
  swift_release();
  swift_release();
  swift_release();
  return sub_25CF219F0(v54, &qword_26A62F7D8);
}

uint64_t sub_25CF1EB80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v102 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F770);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v107 = (uint64_t)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v106 = (uint64_t)&v88 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v110 = (uint64_t)&v88 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v109 = (uint64_t)&v88 - v10;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F670);
  MEMORY[0x270FA5388](v93);
  uint64_t v95 = (uint64_t)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F678);
  MEMORY[0x270FA5388](v101);
  uint64_t v91 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F680);
  uint64_t v13 = MEMORY[0x270FA5388](v92);
  uint64_t v89 = (uint64_t)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v90 = (char *)&v88 - v15;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F688);
  MEMORY[0x270FA5388](v98);
  uint64_t v94 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F778);
  MEMORY[0x270FA5388](v96);
  uint64_t v97 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F660);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F668);
  uint64_t v21 = MEMORY[0x270FA5388](v99);
  uint64_t v23 = (char *)&v88 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v88 - v24;
  uint64_t v26 = type metadata accessor for MessageView();
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v88 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v88 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v88 - v33;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F780);
  MEMORY[0x270FA5388](v100);
  uint64_t v36 = (char *)&v88 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F788);
  uint64_t v38 = MEMORY[0x270FA5388](v37 - 8);
  uint64_t v105 = (uint64_t)&v88 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  uint64_t v111 = (uint64_t)&v88 - v40;
  *((void *)&v115 + 1) = &type metadata for Features;
  *(void *)&long long v116 = sub_25CF0911C();
  LOBYTE(v114) = 2;
  char v41 = sub_25CF42BD8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v114);
  uint64_t v103 = v26;
  uint64_t v42 = a1 + *(int *)(v26 + 20);
  uint64_t v104 = type metadata accessor for WidgetMessage();
  int v43 = *(unsigned __int8 *)(v42 + *(int *)(v104 + 40));
  uint64_t v108 = a1;
  if (v41)
  {
    sub_25CF20D40(a1, (uint64_t)v34);
    if (v43)
    {
      char v44 = v34[*(int *)(v103 + 28)];
      sub_25CF2162C((uint64_t)v34);
      if ((v44 & 1) == 0)
      {
        uint64_t v45 = 1;
        uint64_t v46 = v101;
        uint64_t v47 = (uint64_t)v97;
        uint64_t v48 = v99;
LABEL_11:
        __swift_storeEnumTagSinglePayload((uint64_t)v36, v45, 1, v48);
        sub_25CEFDAA8((uint64_t)v36, v47, &qword_26A62F780);
        swift_storeEnumTagMultiPayload();
        sub_25CF21814();
        sub_25CF21888();
        sub_25CF43518();
        sub_25CF219F0((uint64_t)v36, &qword_26A62F780);
        uint64_t v60 = v104;
        goto LABEL_16;
      }
    }
    else
    {
      sub_25CF2162C((uint64_t)v34);
    }
    sub_25CF1D340((uint64_t)v20);
    sub_25CF1BB5C();
    a1 = v108;
    sub_25CF43AA8();
    sub_25CF431C8();
    sub_25CEFDAA8((uint64_t)v20, (uint64_t)v25, &qword_26A62F660);
    uint64_t v48 = v99;
    uint64_t v58 = &v25[*(int *)(v99 + 36)];
    long long v59 = v115;
    *(_OWORD *)uint64_t v58 = v114;
    *((_OWORD *)v58 + 1) = v59;
    *((_OWORD *)v58 + 2) = v116;
    sub_25CF219F0((uint64_t)v20, &qword_26A62F660);
    sub_25CF17788((uint64_t)v25, (uint64_t)v36, &qword_26A62F668);
    uint64_t v45 = 0;
    uint64_t v46 = v101;
    uint64_t v47 = (uint64_t)v97;
    goto LABEL_11;
  }
  uint64_t v49 = (uint64_t)v91;
  sub_25CF20D40(a1, (uint64_t)v32);
  if (!v43)
  {
    sub_25CF2162C((uint64_t)v32);
    sub_25CF20D40(a1, (uint64_t)v29);
    goto LABEL_13;
  }
  char v50 = v32[*(int *)(v103 + 28)];
  sub_25CF2162C((uint64_t)v32);
  sub_25CF20D40(a1, (uint64_t)v29);
  if (v50)
  {
LABEL_13:
    sub_25CF2162C((uint64_t)v29);
    uint64_t v52 = (uint64_t)v97;
    goto LABEL_14;
  }
  char v51 = v29[*(int *)(v103 + 20) + *(int *)(v104 + 44)];
  sub_25CF2162C((uint64_t)v29);
  uint64_t v52 = (uint64_t)v97;
  if ((v51 & 1) == 0)
  {
LABEL_14:
    sub_25CF1D340((uint64_t)v20);
    sub_25CF1BB5C();
    sub_25CF43AA8();
    sub_25CF431C8();
    sub_25CEFDAA8((uint64_t)v20, (uint64_t)v23, &qword_26A62F660);
    uint64_t v61 = &v23[*(int *)(v99 + 36)];
    long long v62 = v115;
    *(_OWORD *)uint64_t v61 = v114;
    *((_OWORD *)v61 + 1) = v62;
    *((_OWORD *)v61 + 2) = v116;
    sub_25CF219F0((uint64_t)v20, &qword_26A62F660);
    uint64_t v56 = &qword_26A62F668;
    sub_25CF17788((uint64_t)v23, (uint64_t)v25, &qword_26A62F668);
    sub_25CEFDAA8((uint64_t)v25, v95, &qword_26A62F668);
    swift_storeEnumTagMultiPayload();
    sub_25CF2110C();
    sub_25CF2138C();
    uint64_t v57 = (uint64_t)v94;
    goto LABEL_15;
  }
  sub_25CF1CD10(v49);
  sub_25CF1BB5C();
  sub_25CF43AC8();
  sub_25CF431C8();
  uint64_t v53 = v89;
  sub_25CEFDAA8(v49, v89, &qword_26A62F678);
  uint64_t v54 = (_OWORD *)(v53 + *(int *)(v92 + 36));
  long long v55 = v115;
  *uint64_t v54 = v114;
  v54[1] = v55;
  v54[2] = v116;
  sub_25CF219F0(v49, &qword_26A62F678);
  uint64_t v56 = &qword_26A62F680;
  uint64_t v25 = v90;
  sub_25CF17788(v53, (uint64_t)v90, &qword_26A62F680);
  sub_25CEFDAA8((uint64_t)v25, v95, &qword_26A62F680);
  swift_storeEnumTagMultiPayload();
  sub_25CF2110C();
  sub_25CF2138C();
  uint64_t v57 = (uint64_t)v94;
LABEL_15:
  sub_25CF43518();
  sub_25CF219F0((uint64_t)v25, v56);
  uint64_t v46 = v101;
  sub_25CEFDAA8(v57, v52, &qword_26A62F688);
  swift_storeEnumTagMultiPayload();
  sub_25CF21814();
  sub_25CF21888();
  sub_25CF43518();
  sub_25CF219F0(v57, &qword_26A62F688);
  uint64_t v60 = v104;
  a1 = v108;
LABEL_16:
  sub_25CF209D4(a1, (uint64_t)v112);
  uint64_t v64 = v112[0];
  uint64_t v63 = v112[1];
  uint64_t v66 = v112[2];
  uint64_t v65 = v112[3];
  int v67 = v113;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v101 = sub_25CF43688();
  uint64_t v69 = swift_getKeyPath();
  uint64_t v70 = a1 + *(int *)(v103 + 20);
  BOOL v71 = *(unsigned char *)(v70 + *(int *)(v60 + 48)) == 1;
  uint64_t v104 = KeyPath;
  uint64_t v100 = v69;
  LODWORD(v99) = v67;
  if (v71)
  {
    uint64_t v72 = v109;
    sub_25CF1F8C0(v109);
    uint64_t v74 = v72;
    uint64_t v73 = 0;
  }
  else
  {
    uint64_t v73 = 1;
    uint64_t v74 = v109;
  }
  uint64_t v75 = v46;
  uint64_t v76 = 1;
  __swift_storeEnumTagSinglePayload(v74, v73, 1, v46);
  if (*(unsigned char *)(v70 + *(int *)(v60 + 52)) == 1)
  {
    sub_25CF1FE1C(MEMORY[0x263F1A6A8], MEMORY[0x263F1B398], v110);
    uint64_t v74 = v109;
    uint64_t v76 = 0;
  }
  uint64_t v77 = v110;
  __swift_storeEnumTagSinglePayload(v110, v76, 1, v75);
  uint64_t v78 = v105;
  sub_25CEFDAA8(v111, v105, &qword_26A62F788);
  uint64_t v79 = v106;
  sub_25CEFDAA8(v74, v106, &qword_26A62F770);
  sub_25CEFDAA8(v77, v107, &qword_26A62F770);
  uint64_t v80 = v102;
  sub_25CEFDAA8(v78, v102, &qword_26A62F788);
  uint64_t v81 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F7A0);
  uint64_t v82 = v80 + v81[12];
  *(void *)uint64_t v82 = v64;
  *(void *)(v82 + 8) = v63;
  *(void *)(v82 + 16) = v66;
  *(void *)(v82 + 24) = v65;
  *(unsigned char *)(v82 + 32) = v99;
  *(void *)(v82 + 40) = v104;
  *(void *)(v82 + 48) = 1;
  *(unsigned char *)(v82 + 56) = 0;
  uint64_t v83 = v101;
  *(void *)(v82 + 64) = v100;
  *(void *)(v82 + 72) = v83;
  uint64_t v84 = v80 + v81[16];
  *(void *)uint64_t v84 = 0;
  *(unsigned char *)(v84 + 8) = 0;
  sub_25CEFDAA8(v79, v80 + v81[20], &qword_26A62F770);
  uint64_t v85 = v80 + v81[24];
  uint64_t v86 = v107;
  sub_25CEFDAA8(v107, v85, &qword_26A62F770);
  sub_25CF21904(v64, v63, v66);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25CF21904(v64, v63, v66);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25CF219F0(v110, &qword_26A62F770);
  sub_25CF219F0(v109, &qword_26A62F770);
  sub_25CF21940(v64, v63, v66);
  swift_release();
  swift_release();
  swift_release();
  sub_25CF219F0(v111, &qword_26A62F788);
  sub_25CF219F0(v86, &qword_26A62F770);
  sub_25CF219F0(v106, &qword_26A62F770);
  sub_25CF21940(v64, v63, v66);
  swift_release();
  swift_release();
  swift_release();
  return sub_25CF219F0(v105, &qword_26A62F788);
}

uint64_t sub_25CF1F8C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F708);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v49 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25CF43718();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v46 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_25CF43998();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6C8);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6B8);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  uint64_t v43 = (uint64_t)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6A8) - 8;
  MEMORY[0x270FA5388](v45);
  uint64_t v44 = (uint64_t)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25CF43978();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B538], v9);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v8 + *(int *)(v6 + 36), v12, v9);
  *uint64_t v8 = KeyPath;
  sub_25CEFDAA8((uint64_t)v8, (uint64_t)v16 + *(int *)(v14 + 44), &qword_26A62F2A0);
  *uint64_t v16 = v21;
  swift_retain();
  sub_25CF219F0((uint64_t)v8, &qword_26A62F2A0);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  sub_25CF43748();
  uint64_t v24 = v46;
  uint64_t v23 = v47;
  uint64_t v25 = v48;
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v46, *MEMORY[0x263F1A680], v48);
  uint64_t v26 = sub_25CF43738();
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  uint64_t v27 = swift_getKeyPath();
  uint64_t v28 = v43;
  sub_25CEFDAA8((uint64_t)v16, v43, &qword_26A62F6C8);
  uint64_t v29 = (uint64_t *)(v28 + *(int *)(v18 + 44));
  *uint64_t v29 = v27;
  v29[1] = v26;
  sub_25CF219F0((uint64_t)v16, &qword_26A62F6C8);
  id v30 = objc_msgSend(self, sel_tertiaryLabelColor);
  uint64_t v31 = MEMORY[0x2611A2450](v30);
  uint64_t v32 = swift_getKeyPath();
  uint64_t v33 = v44;
  sub_25CEFDAA8(v28, v44, &qword_26A62F6B8);
  uint64_t v34 = (uint64_t *)(v33 + *(int *)(v45 + 44));
  uint64_t *v34 = v32;
  v34[1] = v31;
  sub_25CF219F0(v28, &qword_26A62F6B8);
  uint64_t v35 = (uint64_t)v49;
  sub_25CF434F8();
  uint64_t v36 = sub_25CF43508();
  __swift_storeEnumTagSinglePayload(v35, 0, 1, v36);
  uint64_t v37 = swift_getKeyPath();
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F678);
  uint64_t v39 = v50;
  uint64_t v40 = (uint64_t *)(v50 + *(int *)(v38 + 36));
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6E8);
  sub_25CEFDAA8(v35, (uint64_t)v40 + *(int *)(v41 + 28), &qword_26A62F708);
  *uint64_t v40 = v37;
  sub_25CEFDAA8(v33, v39, &qword_26A62F6A8);
  sub_25CF219F0(v35, &qword_26A62F708);
  return sub_25CF219F0(v33, &qword_26A62F6A8);
}

uint64_t sub_25CF1FE1C@<X0>(void (*a1)(uint64_t)@<X2>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F708);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1_3();
  uint64_t v51 = v5;
  sub_25CF43718();
  OUTLINED_FUNCTION_0();
  uint64_t v47 = v7;
  uint64_t v48 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_3();
  uint64_t v46 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1();
  uint64_t v13 = (uint64_t *)(v12 - v11);
  uint64_t v14 = sub_25CF43998();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6C8);
  uint64_t v22 = v21 - 8;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1();
  uint64_t v25 = (uint64_t *)(v24 - v23);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6B8) - 8;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_8_3();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6A8) - 8;
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_1_3();
  uint64_t v43 = v26;
  uint64_t v27 = sub_25CF43978();
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v20, *MEMORY[0x263F1B538], v14);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)v13 + *(int *)(v10 + 36), v20, v14);
  *uint64_t v13 = KeyPath;
  sub_25CEFDAA8((uint64_t)v13, (uint64_t)v25 + *(int *)(v22 + 44), &qword_26A62F2A0);
  *uint64_t v25 = v27;
  swift_retain();
  sub_25CF219F0((uint64_t)v13, &qword_26A62F2A0);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  uint64_t v29 = swift_release();
  a1(v29);
  (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v46, *MEMORY[0x263F1A680], v48);
  uint64_t v30 = sub_25CF43738();
  swift_release();
  OUTLINED_FUNCTION_2_3();
  v31();
  uint64_t v32 = swift_getKeyPath();
  sub_25CEFDAA8((uint64_t)v25, v3, &qword_26A62F6C8);
  uint64_t v33 = (uint64_t *)(v3 + *(int *)(v44 + 44));
  *uint64_t v33 = v32;
  v33[1] = v30;
  uint64_t v34 = sub_25CF219F0((uint64_t)v25, &qword_26A62F6C8);
  uint64_t v35 = a2(v34);
  uint64_t v36 = swift_getKeyPath();
  sub_25CEFDAA8(v3, v43, &qword_26A62F6B8);
  uint64_t v37 = (uint64_t *)(v43 + *(int *)(v45 + 44));
  *uint64_t v37 = v36;
  v37[1] = v35;
  sub_25CF219F0(v3, &qword_26A62F6B8);
  sub_25CF434F8();
  uint64_t v38 = sub_25CF43508();
  __swift_storeEnumTagSinglePayload(v51, 0, 1, v38);
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = (uint64_t *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F678) + 36));
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F6E8);
  sub_25CEFDAA8(v51, (uint64_t)v40 + *(int *)(v41 + 28), &qword_26A62F708);
  *uint64_t v40 = v39;
  sub_25CEFDAA8(v43, a3, &qword_26A62F6A8);
  sub_25CF219F0(v51, &qword_26A62F708);
  return sub_25CF219F0(v43, &qword_26A62F6A8);
}

uint64_t sub_25CF202C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2A0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v44 = sub_25CF43998();
  uint64_t v7 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F768);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_25CF43438();
  sub_25CF20ADC((uint64_t)v45);
  uint64_t v43 = v45[0];
  uint64_t v35 = v45[1];
  int v42 = v46;
  uint64_t v14 = v47;
  uint64_t v37 = v49;
  uint64_t v38 = v48;
  int v36 = v50;
  uint64_t v39 = v51;
  uint64_t v33 = *(void *)(v2 + *(int *)(type metadata accessor for MessageView() + 24));
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = *MEMORY[0x263F1B538];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  uint64_t v34 = v9;
  uint64_t v18 = v44;
  v17(v9, v16, v44);
  uint64_t v19 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v6 + *(int *)(v4 + 36), v9, v18);
  *uint64_t v6 = v19;
  sub_25CEFDAA8((uint64_t)v6, (uint64_t)&v13[*(int *)(v11 + 44)], &qword_26A62F2A0);
  uint64_t v20 = v39;
  *(void *)uint64_t v13 = v40;
  *((void *)v13 + 1) = 0x4010000000000000;
  v13[16] = 0;
  uint64_t v21 = v43;
  uint64_t v22 = v35;
  *((void *)v13 + 3) = v43;
  *((void *)v13 + 4) = v22;
  char v23 = v42;
  v13[40] = v42;
  uint64_t v24 = v37;
  uint64_t v25 = v38;
  *((void *)v13 + 6) = v14;
  *((void *)v13 + 7) = v25;
  *((void *)v13 + 8) = v24;
  LOBYTE(v18) = v36;
  v13[72] = v36;
  *((void *)v13 + 10) = v20;
  *((void *)v13 + 11) = KeyPath;
  *((void *)v13 + 12) = v33;
  v13[104] = 0;
  uint64_t v26 = v22;
  sub_25CF11FC8(v21, v22, v23);
  swift_bridgeObjectRetain();
  sub_25CF11FC8(v25, v24, v18);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25CF219F0((uint64_t)v6, &qword_26A62F2A0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v34, v44);
  sub_25CF0F360(v43, v26, v42);
  swift_bridgeObjectRelease();
  sub_25CF0F360(v25, v24, v18);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_25CF43688();
  uint64_t v28 = swift_getKeyPath();
  uint64_t v29 = v41;
  sub_25CEFDAA8((uint64_t)v13, v41, &qword_26A62F768);
  uint64_t v30 = (uint64_t *)(v29 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62F710) + 36));
  *uint64_t v30 = v28;
  v30[1] = v27;
  return sub_25CF219F0((uint64_t)v13, &qword_26A62F768);
}

uint64_t sub_25CF20648(void **a1)
{
  uint64_t v2 = sub_25CF42B58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char *)a1 + *(int *)(type metadata accessor for MessageView() + 20);
  uint64_t v10 = type metadata accessor for WidgetMessage();
  sub_25CEFDAA8((uint64_t)&v9[*(int *)(v10 + 56)], (uint64_t)v8, &qword_26A62F228);
  uint64_t v11 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v11) == 1)
  {
    sub_25CF219F0((uint64_t)v8, &qword_26A62F228);
    uint64_t v12 = *a1;
    if (*a1) {
      goto LABEL_5;
    }
  }
  else
  {
    sub_25CF42A98();
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v8, v11);
    uint64_t v12 = *a1;
    if (*a1)
    {
LABEL_5:
      id v13 = v12;
      sub_25CF42B48();
      sub_25CF43CF8();

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  sub_25CF43D18();
  sub_25CF0F430((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  uint64_t result = sub_25CF43298();
  __break(1u);
  return result;
}

double sub_25CF208CC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MessageView();
  uint64_t v5 = a1 + *(int *)(v4 + 20);
  if (*(void *)(v5 + 24)) {
    long long v7 = *(_OWORD *)(v5 + 16);
  }
  else {
    long long v7 = *(_OWORD *)(a1 + *(int *)(v4 + 32));
  }
  sub_25CEFDB04();
  swift_bridgeObjectRetain();
  sub_25CF437D8();
  sub_25CF43518();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(unsigned char *)(a2 + 32) = v9;
  return result;
}

double sub_25CF209D4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MessageView();
  uint64_t v5 = a1 + *(int *)(v4 + 20);
  if (*(void *)(v5 + 40)) {
    long long v7 = *(_OWORD *)(v5 + 32);
  }
  else {
    long long v7 = *(_OWORD *)(a1 + *(int *)(v4 + 36));
  }
  sub_25CEFDB04();
  swift_bridgeObjectRetain();
  sub_25CF437D8();
  sub_25CF43518();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(unsigned char *)(a2 + 32) = v9;
  return result;
}

uint64_t sub_25CF20ADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25CF43498();
  MEMORY[0x270FA5388](v2 - 8);
  sub_25CF434A8();
  uint64_t v3 = sub_25CF437C8();
  uint64_t v21 = v4;
  uint64_t v22 = v3;
  uint64_t v23 = v5;
  char v7 = v6 & 1;
  sub_25CF43488();
  sub_25CF43478();
  sub_25CF43988();
  sub_25CF43458();
  swift_release();
  sub_25CF43478();
  sub_25CF43468();
  sub_25CF43478();
  sub_25CF434B8();
  uint64_t v8 = sub_25CF437C8();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_25CF43548();
  uint64_t v13 = sub_25CF437A8();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_25CF0F360(v8, v10, v12);
  swift_bridgeObjectRelease();
  *(void *)a1 = v22;
  *(void *)(a1 + 8) = v21;
  *(unsigned char *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v23;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v15;
  *(unsigned char *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v17;
  sub_25CF11FC8(v22, v21, v7);
  swift_bridgeObjectRetain();
  sub_25CF11FC8(v13, v15, v19);
  swift_bridgeObjectRetain();
  sub_25CF0F360(v13, v15, v19);
  swift_bridgeObjectRelease();
  sub_25CF0F360(v22, v21, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF20D40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF20DA4()
{
  uint64_t v1 = type metadata accessor for MessageView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for WidgetMessage();
  sub_25CF42AD8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v7();
  uint64_t v8 = v5 + *(int *)(v6 + 56);
  uint64_t v9 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5D8);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v10();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25CF434C8();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2_3();
    v11();
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF210AC()
{
  uint64_t v1 = *(void *)(type metadata accessor for MessageView() - 8);
  uint64_t v2 = (void **)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return sub_25CF20648(v2);
}

unint64_t sub_25CF2110C()
{
  unint64_t result = qword_26A62F690;
  if (!qword_26A62F690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F680);
    sub_25CF2142C(&qword_26A62F698, &qword_26A62F678, (void (*)(void))sub_25CF211AC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F690);
  }
  return result;
}

unint64_t sub_25CF211AC()
{
  unint64_t result = qword_26A62F6A0;
  if (!qword_26A62F6A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F6A8);
    sub_25CF2124C();
    sub_25CEFDA10(&qword_26A62F6D0, &qword_26A62F6D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F6A0);
  }
  return result;
}

unint64_t sub_25CF2124C()
{
  unint64_t result = qword_26A62F6B0;
  if (!qword_26A62F6B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F6B8);
    sub_25CF212EC();
    sub_25CEFDA10(&qword_26A62EDB0, &qword_26A62EDB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F6B0);
  }
  return result;
}

unint64_t sub_25CF212EC()
{
  unint64_t result = qword_26A62F6C0;
  if (!qword_26A62F6C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F6C8);
    sub_25CEFDA10(&qword_26A62F2C0, &qword_26A62F2A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F6C0);
  }
  return result;
}

unint64_t sub_25CF2138C()
{
  unint64_t result = qword_26A62F6F0;
  if (!qword_26A62F6F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F668);
    sub_25CF2142C(&qword_26A62F6F8, &qword_26A62F660, (void (*)(void))sub_25CF2124C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F6F0);
  }
  return result;
}

uint64_t sub_25CF2142C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_25CEFDA10(&qword_26A62F6E0, &qword_26A62F6E8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25CF214D0()
{
  return sub_25CF432B8();
}

uint64_t sub_25CF214F4()
{
  return sub_25CF432B8();
}

uint64_t sub_25CF21518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF21544(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

uint64_t sub_25CF21544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_25CF215EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF21544(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

uint64_t sub_25CF2162C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF21690@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25CF43318();
  *a1 = result;
  return result;
}

uint64_t sub_25CF216BC()
{
  return sub_25CF43328();
}

uint64_t sub_25CF216EC()
{
  return sub_25CF43398();
}

uint64_t sub_25CF21710(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F708);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25CEFDAA8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26A62F708);
  return sub_25CF433A8();
}

uint64_t sub_25CF217AC()
{
  return sub_25CF3BFC8();
}

uint64_t objectdestroy_18Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_25CF21814()
{
  unint64_t result = qword_26A62F790;
  if (!qword_26A62F790)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F780);
    sub_25CF2138C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F790);
  }
  return result;
}

unint64_t sub_25CF21888()
{
  unint64_t result = qword_26A62F798;
  if (!qword_26A62F798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F688);
    sub_25CF2110C();
    sub_25CF2138C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F798);
  }
  return result;
}

uint64_t sub_25CF21904(uint64_t a1, uint64_t a2, char a3)
{
  sub_25CF11FC8(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25CF21940(uint64_t a1, uint64_t a2, char a3)
{
  sub_25CF0F360(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_25CF2197C()
{
  unint64_t result = qword_26A62F7E0;
  if (!qword_26A62F7E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F7D0);
    sub_25CF2110C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F7E0);
  }
  return result;
}

uint64_t sub_25CF219F0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v3();
  return a1;
}

uint64_t sub_25CF21A40(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_12_0();
  v5(v4);
  return a2;
}

uint64_t sub_25CF21A94()
{
  return sub_25CF432E8();
}

uint64_t sub_25CF21AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF21544(a1, a2, a3, a4, MEMORY[0x263F19A00], MEMORY[0x263F192B8]);
}

uint64_t sub_25CF21AF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  *(void *)(v0 - 104) = 0;
  return sub_25CF439B8();
}

double OUTLINED_FUNCTION_7_4()
{
  double result = *(double *)(v1 - 96);
  uint64_t v3 = *(void *)(v1 - 88);
  *(double *)uint64_t v0 = result;
  *(void *)(v0 + 8) = v3;
  return result;
}

void destroy for RecipientTextView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 88);
}

uint64_t initializeWithCopy for RecipientTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  char v7 = *(void **)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v8 = v7;
  return a1;
}

uint64_t assignWithCopy for RecipientTextView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 88);
  uint64_t v5 = *(void **)(a2 + 88);
  *(void *)(a1 + 88) = v5;
  id v6 = v5;

  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for RecipientTextView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);

  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for RecipientTextView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
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

uint64_t storeEnumTagSinglePayload for RecipientTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for RecipientTextView()
{
  return &type metadata for RecipientTextView;
}

uint64_t sub_25CF21F90()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_25CF21F9C()
{
  id v1 = objc_allocWithZone((Class)type metadata accessor for RecipientViewController_Phone());
  sub_25CF22794((uint64_t)v0);
  return sub_25CF2327C(v0);
}

uint64_t sub_25CF21FDC(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_25CF43B08();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25CF43B28();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_25CF43058();
  __swift_project_value_buffer(v15, (uint64_t)static Logger.siriMail);
  uint64_t v16 = sub_25CF43038();
  os_log_type_t v17 = sub_25CF43E58();
  if (os_log_type_enabled(v16, v17))
  {
    char v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v18 = 0;
    _os_log_impl(&dword_25CEFA000, v16, v17, "RecipientTextView.updateUIViewController(_:context:)", v18, 2u);
    MEMORY[0x2611A3230](v18, -1, -1);
  }

  sub_25CF226B0();
  char v19 = (void *)sub_25CF43E68();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  memcpy((void *)(v20 + 24), v2, 0x68uLL);
  aBlock[4] = sub_25CF22770;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25CF223D8;
  aBlock[3] = &block_descriptor;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = a1;
  sub_25CF22794((uint64_t)v2);
  swift_release();
  sub_25CF43B18();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25CF22C04((unint64_t *)&unk_26A62FA60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F800);
  sub_25CF22830();
  sub_25CF43EF8();
  MEMORY[0x2611A2960](0, v14, v9, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v25);
}

void sub_25CF2230C()
{
  uint64_t v0 = sub_25CF22D58();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F808);
  MEMORY[0x2611A2500](&v3);
  char v2 = sub_25CF229E4(v0, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    MEMORY[0x2611A2500](&v3, v1);
    sub_25CF22DD0(v3);
  }
}

uint64_t sub_25CF223D8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25CF2241C()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_25CF21F9C();
}

uint64_t sub_25CF22458(void *a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_25CF21FDC(a1);
}

uint64_t sub_25CF224A8()
{
  return sub_25CF43578();
}

uint64_t sub_25CF224E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25CF22C4C();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_25CF22548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25CF22C4C();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_25CF225AC()
{
}

unint64_t sub_25CF225D8()
{
  unint64_t result = qword_26A62F7F0;
  if (!qword_26A62F7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F7F0);
  }
  return result;
}

uint64_t sub_25CF22624()
{
  id v1 = objc_msgSend(self, sel_stringFromContact_style_, v0, 0);
  if (!v1) {
    id v1 = objc_msgSend(v0, sel_givenName);
  }
  uint64_t v2 = sub_25CF43D88();

  return v2;
}

unint64_t sub_25CF226B0()
{
  unint64_t result = qword_26A62F7F8;
  if (!qword_26A62F7F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A62F7F8);
  }
  return result;
}

uint64_t sub_25CF226F0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 128, 7);
}

void sub_25CF22770()
{
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

uint64_t sub_25CF22794(uint64_t a1)
{
  id v2 = *(id *)(a1 + 88);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_25CF22830()
{
  unint64_t result = qword_26A62FA70;
  if (!qword_26A62FA70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F800);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FA70);
  }
  return result;
}

uint64_t sub_25CF22884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetMessage() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (uint64_t *)((char *)&v19 - v9);
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
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_25CF22C98(a1 + v12, (uint64_t)v10);
        sub_25CF22C98(a2 + v12, (uint64_t)v7);
        char v15 = static WidgetMessage.__derived_struct_equals(_:_:)(v10, v7);
        sub_25CF22CFC((uint64_t)v7);
        sub_25CF22CFC((uint64_t)v10);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
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

uint64_t sub_25CF229E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25CF42E68();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v28 - v8;
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
      uint64_t v30 = (void (**)(uint64_t, uint64_t))(v12 - 8);
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
        uint64_t v9 = v20;
        sub_25CF22C04(&qword_26A62F810, MEMORY[0x263F70788]);
        char v23 = sub_25CF43D58();
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

uint64_t sub_25CF22C04(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25CF22C4C()
{
  unint64_t result = qword_26A62F818;
  if (!qword_26A62F818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62F818);
  }
  return result;
}

uint64_t sub_25CF22C98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF22CFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WidgetMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF22D58()
{
  uint64_t result = sub_25CF26E74(*(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView));
  if (result)
  {
    unint64_t v2 = sub_25CF26210(result);
    swift_bridgeObjectRelease();
    sub_25CF23068(v2);
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25CF22DD0(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_25CF26934(0, v4, 0);
    uint64_t v5 = v25;
    uint64_t v6 = sub_25CF42E68();
    OUTLINED_FUNCTION_2_1(v6);
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v10 = *(void *)(v9 + 72);
    while (1)
    {
      uint64_t v11 = sub_25CF42E58();
      uint64_t v13 = v12;
      uint64_t v14 = sub_25CF42E48();
      uint64_t v16 = v15;
      id v17 = objc_allocWithZone(MEMORY[0x263F33430]);
      id v18 = sub_25CF26398(0, v11, v13, v14, v16, 0);
      if (!v18) {
        break;
      }
      id v19 = v18;
      uint64_t v24 = sub_25CF27338(0, &qword_26A62F9F8);
      uint64_t v25 = v5;
      *(void *)&long long v23 = v19;
      unint64_t v21 = *(void *)(v5 + 16);
      unint64_t v20 = *(void *)(v5 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_25CF26934((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v5 = v25;
      }
      *(void *)(v5 + 16) = v21 + 1;
      sub_25CF26954(&v23, (_OWORD *)(v5 + 32 * v21 + 32));
      v8 += v10;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v22;
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_9:
    sub_25CF2714C(v5, v3, MEMORY[0x263F8EE58] + 8, (SEL *)&selRef_setRecipients_);
  }
}

uint64_t sub_25CF22FA8()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_contact);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_25CF22624();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = sub_25CF26ED0(v0, (SEL *)&selRef_displayString);
    uint64_t v6 = v7;
  }
  uint64_t v8 = sub_25CF26ED0(v1, (SEL *)&selRef_address);
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    uint64_t v8 = v4;
    uint64_t v9 = v6;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270F68910](v8, v9, v10, v11);
}

void sub_25CF23068(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v16 = sub_25CF42E68();
  uint64_t v4 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v7)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_25CF268E4();
    if (v7 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v8 = 0;
    uint64_t v9 = v17;
    unint64_t v15 = a1 & 0xC000000000000001;
    v14[0] = v2;
    v14[1] = v4 + 32;
    unint64_t v10 = a1;
    while (v7 != v8)
    {
      if (v15) {
        id v11 = (id)MEMORY[0x2611A2A30](v8, a1);
      }
      else {
        id v11 = *(id *)(a1 + 8 * v8 + 32);
      }
      uint64_t v12 = v11;
      sub_25CF22FA8();

      uint64_t v17 = v9;
      unint64_t v13 = *(void *)(v9 + 16);
      unint64_t v2 = v13 + 1;
      if (v13 >= *(void *)(v9 + 24) >> 1)
      {
        sub_25CF268E4();
        uint64_t v9 = v17;
      }
      ++v8;
      *(void *)(v9 + 16) = v2;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v9+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v13, v6, v16);
      a1 = v10;
      if (v7 == v8) {
        return;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25CF43FF8();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25CF2327C(void *a1)
{
  unint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for ComposeRecipientTextView());
  uint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  *(void *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25CF43FF8()) {
    unint64_t v8 = sub_25CF26BC8(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v8 = MEMORY[0x263F8EE88];
  }
  *(void *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_cancellables] = v8;
  uint64_t v9 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController;
  *(void *)&v7[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33410]), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
  *(void *)&v7[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_init);
  *(void *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint] = 0;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33428]), sel_initWithAutocompleteSearchType_, 0);
  if (v11)
  {
    *(void *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager] = v11;
    v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults] = 0;
    *(void *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID] = 0;
    memcpy(&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container], a1, 0x68uLL);
    sub_25CF22794((uint64_t)a1);

    v18.receiver = v7;
    v18.super_class = ObjectType;
    uint64_t v12 = (char *)objc_msgSendSuper2(&v18, sel_initWithNibName_bundle_, 0, 0);
    unint64_t v13 = *(void **)&v12[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager];
    uint64_t v14 = v12;
    objc_msgSend(v13, sel_setSearchTypes_, 2);
    unint64_t v15 = (void *)a1[11];
    if (v15)
    {
      id v16 = v15;
      sub_25CF43CD8();

      swift_allocObject();
      swift_unknownObjectWeakInit();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA18);
      sub_25CEFDA10(&qword_26A62FA20, &qword_26A62FA18);
      sub_25CF430A8();
      swift_release();
      swift_release();
      swift_beginAccess();
      sub_25CF43068();
      swift_endAccess();
      sub_25CF26FCC((uint64_t)a1);
      swift_release();

      return (uint64_t)v14;
    }
  }
  else
  {
    __break(1u);
  }
  sub_25CF43D18();
  sub_25CF271F0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
  uint64_t result = OUTLINED_FUNCTION_2_5();
  __break(1u);
  return result;
}

void sub_25CF23590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25CF43CE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if ((*(unsigned int (**)(void *, uint64_t))(v5 + 88))(v7, v4) == *MEMORY[0x263F77958])
  {
    (*(void (**)(void *, uint64_t))(v5 + 96))(v7, v4);
    if (*v7 == 4)
    {
      swift_beginAccess();
      uint64_t v8 = MEMORY[0x2611A32B0](a2 + 16);
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        id v10 = *(id *)(v8 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);

        objc_msgSend(v10, sel_resignFirstResponder);
      }
    }
  }
  else
  {
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_25CF23728()
{
  uint64_t v1 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComposeRecipientTextView()), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    goto LABEL_5;
  }
LABEL_2:
  for (unint64_t i = MEMORY[0x263F8EE88]; ; unint64_t i = sub_25CF26BC8(MEMORY[0x263F8EE78]))
  {
    *(void *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_cancellables] = i;
    uint64_t v3 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController;
    *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33410]), sel_init);
    uint64_t v4 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
    *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_init);
    *(void *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint] = 0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33428]), sel_initWithAutocompleteSearchType_, 0);
    if (v5) {
      break;
    }
    __break(1u);
LABEL_5:
    if (!sub_25CF43FF8()) {
      goto LABEL_2;
    }
  }
  *(void *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager] = v5;
  v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID] = 0;

  static Logger.logAndCrash(_:file:line:)(0xD000000000000025, 0x800000025CF4E890, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriMail/SiriMailUI/View/SendMail/Interactive/RecipientTextView/RecipientViewController_Phone.swift", 137, 2, 78);
  __break(1u);
}

void sub_25CF23898()
{
  uint64_t v1 = v0;
  v104.receiver = v0;
  v104.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v104, sel_viewDidLoad);
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView];
  uint64_t v3 = &off_265502000;
  objc_msgSend(v2, sel_setDelegate_, v0);
  uint64_t v4 = &v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container];
  id v5 = (void *)sub_25CF43D68();
  objc_msgSend(v2, sel_setLabel_, v5);

  id v6 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835F0]);
  sub_25CEFDBF4(v6);
  objc_msgSend(v2, sel_setSeparatorHidden_, 1);
  objc_msgSend(v2, sel_setBackgroundColor_, 0);
  uint64_t v101 = *((void *)v4 + 8);
  long long v102 = *(_OWORD *)(v4 + 72);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F808);
  MEMORY[0x2611A2500](&v99, v7);
  uint64_t v8 = v99;
  int64_t v9 = *(void *)(v99 + 16);
  if (v9)
  {
    uint64_t v96 = v2;
    uint64_t v97 = v1;
    *(void *)&long long v99 = MEMORY[0x263F8EE78];
    sub_25CF26934(0, v9, 0);
    uint64_t v10 = v99;
    uint64_t v11 = sub_25CF42E68();
    OUTLINED_FUNCTION_2_1(v11);
    uint64_t v13 = v8 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v15 = *(void *)(v14 + 72);
    while (1)
    {
      uint64_t v16 = sub_25CF42E58();
      uint64_t v18 = v17;
      uint64_t v19 = sub_25CF42E48();
      uint64_t v21 = v20;
      id v22 = objc_allocWithZone(MEMORY[0x263F33430]);
      id v23 = sub_25CF26398(0, v16, v18, v19, v21, 0);
      if (!v23) {
        break;
      }
      uint64_t v24 = (uint64_t)v23;
      uint64_t v103 = sub_25CF27338(0, &qword_26A62F9F8);
      uint64_t v101 = v24;
      *(void *)&long long v99 = v10;
      unint64_t v26 = *(void *)(v10 + 16);
      unint64_t v25 = *(void *)(v10 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_25CF26934((char *)(v25 > 1), v26 + 1, 1);
        uint64_t v10 = v99;
      }
      *(void *)(v10 + 16) = v26 + 1;
      sub_25CF26954(&v101, (_OWORD *)(v10 + 32 * v26 + 32));
      v13 += v15;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        unint64_t v2 = v96;
        uint64_t v1 = v97;
        uint64_t v3 = &off_265502000;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_9:
  sub_25CF2714C(v10, v2, MEMORY[0x263F8EE58] + 8, (SEL *)&selRef_setRecipients_);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v27 = objc_msgSend(v1, sel_view);
  if (!v27) {
    goto LABEL_24;
  }
  uint64_t v28 = v27;
  objc_msgSend(v27, sel_addSubview_, v2);

  uint64_t v29 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController];
  objc_msgSend(v29, (SEL)v3[292], v1);
  objc_msgSend(v1, sel_addChildViewController_, v29);
  id v30 = objc_msgSend(v29, sel_tableView);
  if (!v30)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v31 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
  uint64_t v32 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView];
  *(void *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView] = v30;

  uint64_t v33 = *(void **)&v1[v31];
  uint64_t v34 = self;
  id v35 = v33;
  id v36 = objc_msgSend(v34, sel_clearColor);
  objc_msgSend(v35, sel_setBackgroundColor_, v36);

  objc_msgSend(*(id *)&v1[v31], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v1[v31], sel_setKeyboardDismissMode_, 1);
  objc_msgSend(*(id *)&v1[v31], sel_setEstimatedRowHeight_, 0.0);
  objc_msgSend(*(id *)&v1[v31], sel_setEstimatedSectionHeaderHeight_, 0.0);
  objc_msgSend(*(id *)&v1[v31], sel_setEstimatedSectionFooterHeight_, 0.0);
  objc_msgSend(*(id *)&v1[v31], sel_setHidden_, 1);
  id v37 = objc_msgSend(v1, sel_view);
  if (!v37)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v38 = v37;
  objc_msgSend(v37, sel_addSubview_, *(void *)&v1[v31]);

  sub_25CF27338(0, &qword_26A62FA90);
  uint64_t v103 = type metadata accessor for ComposeRecipientTextView();
  uint64_t v101 = (uint64_t)v2;
  sub_25CF27338(0, &qword_26A62FA98);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  long long v99 = 0u;
  long long v100 = 0u;
  id v40 = v2;
  objc_msgSend(ObjCClassFromMetadata, sel_preferredHeight);
  id v42 = sub_25CF24220(&v101, 8, 0, &v99, 0, 1.0, v41);
  uint64_t v43 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint;
  uint64_t v44 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint] = v42;

  uint64_t v45 = *(void **)&v1[v31];
  uint64_t v103 = sub_25CF27338(0, &qword_26A62FAA0);
  uint64_t v101 = (uint64_t)v45;
  long long v99 = 0u;
  long long v100 = 0u;
  id v46 = v45;
  id v47 = sub_25CF24220(&v101, 8, 0, &v99, 0, 1.0, 0.0);
  uint64_t v48 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint;
  uint64_t v49 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint] = v47;

  uint64_t v51 = *(void **)&v1[v43];
  if (!v51)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  LODWORD(v50) = 1144750080;
  objc_msgSend(v51, sel_setPriority_, v50);
  uint64_t v98 = v48;
  uint64_t v53 = *(void **)&v1[v48];
  if (!v53)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LODWORD(v52) = 1132068864;
  objc_msgSend(v53, sel_setPriority_, v52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FAA8);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_25CF46150;
  id v55 = objc_msgSend(v40, sel_topAnchor);
  id v56 = objc_msgSend(v1, sel_view);
  if (!v56)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v57 = v56;
  uint64_t v58 = v1;
  id v59 = objc_msgSend(v56, sel_topAnchor);

  id v60 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v59);
  *(void *)(v54 + 32) = v60;
  id v61 = objc_msgSend(v40, sel_leadingAnchor);
  id v62 = objc_msgSend(v58, sel_view);
  if (!v62)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v63 = v62;
  id v64 = objc_msgSend(v62, sel_leadingAnchor);

  id v65 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v64);
  *(void *)(v54 + 40) = v65;
  id v66 = objc_msgSend(v40, sel_trailingAnchor);
  id v67 = objc_msgSend(v58, sel_view);
  if (!v67)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v68 = v67;
  id v69 = objc_msgSend(v67, sel_trailingAnchor);

  id v70 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v69);
  *(void *)(v54 + 48) = v70;
  BOOL v71 = *(void **)&v58[v43];
  if (!v71)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  *(void *)(v54 + 56) = v71;
  uint64_t v72 = *(void **)&v58[v31];
  id v73 = v71;
  id v74 = objc_msgSend(v72, sel_topAnchor);
  id v75 = objc_msgSend(v40, sel_bottomAnchor);
  id v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(void *)(v54 + 64) = v76;
  id v77 = objc_msgSend(*(id *)&v58[v31], sel_leadingAnchor);
  id v78 = objc_msgSend(v58, sel_view);
  if (!v78)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v79 = v78;
  id v80 = objc_msgSend(v78, sel_leadingAnchor);

  id v81 = OUTLINED_FUNCTION_6_3();
  *(void *)(v54 + 72) = v81;
  id v82 = objc_msgSend(*(id *)&v58[v31], sel_trailingAnchor);
  id v83 = objc_msgSend(v58, sel_view);
  if (!v83)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v84 = v83;
  id v85 = objc_msgSend(v83, sel_trailingAnchor);

  id v86 = OUTLINED_FUNCTION_6_3();
  *(void *)(v54 + 80) = v86;
  id v87 = objc_msgSend(*(id *)&v58[v31], sel_bottomAnchor);
  id v88 = objc_msgSend(v58, sel_view);
  if (!v88)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v89 = v88;
  id v90 = objc_msgSend(v88, sel_bottomAnchor);

  id v91 = OUTLINED_FUNCTION_6_3();
  *(void *)(v54 + 88) = v91;
  uint64_t v92 = *(void **)&v58[v98];
  if (v92)
  {
    uint64_t v93 = self;
    *(void *)(v54 + 96) = v92;
    uint64_t v101 = v54;
    sub_25CF43DF8();
    id v94 = v92;
    uint64_t v95 = (void *)sub_25CF43DD8();
    swift_bridgeObjectRelease();
    objc_msgSend(v93, sel_activateConstraints_, v95);

    return;
  }
LABEL_36:
  __break(1u);
}

id sub_25CF24220(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v14 = sub_25CF44128();
  uint64_t v15 = a4[3];
  if (v15)
  {
    uint64_t v16 = __swift_project_boxed_opaque_existential_1(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    MEMORY[0x270FA5388](v16);
    uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_25CF44128();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_, v14, a2, a3, v21, a5, a6, a7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v22;
}

id sub_25CF2443C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_viewDidLayoutSubviews);
  return sub_25CF24478();
}

id sub_25CF24478()
{
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  objc_super v2 = result;
  objc_msgSend(result, sel_bounds);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double Width = CGRectGetWidth(v18);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v12 = result;
  objc_msgSend(result, sel_systemLayoutSizeFittingSize_, Width, *(double *)(MEMORY[0x263F83810] + 8));
  double v14 = v13;
  double v16 = v15;

  return objc_msgSend(v0, sel_setPreferredContentSize_, v14, v16);
}

void sub_25CF245BC(unint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
  CGFloat v4 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView);
  if (a1 >> 62)
  {
    id v12 = v4;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25CF43FF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v6 = v4;
  }
  objc_msgSend(v4, sel_setHidden_, v5 == 0);

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView), sel_setSeparatorHidden_, objc_msgSend(*(id *)(v1 + v3), sel_isHidden));
  sub_25CF27068(a1, *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController));
  double v7 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint);
  if (v7)
  {
    CGFloat v8 = *(void **)(v1 + v3);
    id v9 = v7;
    objc_msgSend(v8, sel_contentSize);
    objc_msgSend(v9, sel_setConstant_, v10);

    objc_msgSend(*(id *)(v1 + v3), sel_setNeedsUpdateConstraints);
    uint64_t v11 = *(void **)(v1 + v3);
    swift_retain();
    swift_retain();
    objc_msgSend(v11, sel_isHidden);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA40);
    sub_25CF43A28();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

void sub_25CF24768()
{
}

id sub_25CF247C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RecipientViewController_Phone()
{
  return self;
}

void sub_25CF24938()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container;
  OUTLINED_FUNCTION_12_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA40);
  OUTLINED_FUNCTION_9_2();
  objc_super v2 = *(void **)(v1 + 88);
  if (v2)
  {
    id v3 = v2;
    sub_25CF43CA8();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF271F0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    OUTLINED_FUNCTION_2_5();
    __break(1u);
  }
}

void sub_25CF24A48(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container;
  OUTLINED_FUNCTION_12_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA40);
  OUTLINED_FUNCTION_9_2();
  uint64_t v5 = *(void **)(v4 + 88);
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = v5;
  sub_25CF43CA8();

  id v7 = objc_msgSend(a2, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA88);
  unint64_t v8 = sub_25CF43DE8();

  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25CF43FF8();
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v9 = *(id *)(v8 + 32);
      goto LABEL_7;
    }
    __break(1u);
LABEL_14:
    sub_25CF43D18();
    sub_25CF271F0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    OUTLINED_FUNCTION_2_5();
    __break(1u);
    return;
  }
  id v9 = (id)MEMORY[0x2611A2A30](0, v8);
LABEL_7:
  double v10 = v9;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v10, sel_value);

  if (v11)
  {
    sub_25CF43D78();
  }
}

void sub_25CF24CE0(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container;
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 48);
  char v7 = *(unsigned char *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 56);
  v17[0] = *(void *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 40);
  v17[1] = v6;
  char v18 = v7;
  LOBYTE(v16[0]) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA40);
  sub_25CF43A28();
  unint64_t v8 = *(void **)(v5 + 88);
  if (v8)
  {
    id v9 = v8;
    sub_25CF43CA8();

    if (objc_msgSend(a2, sel_value))
    {
      sub_25CF43EE8();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v16, 0, sizeof(v16));
    }
    sub_25CF27270((uint64_t)v16, (uint64_t)v17);
    if (v19)
    {
      if (swift_dynamicCast())
      {
        double v10 = *(void **)(v3 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
        id v11 = objc_msgSend(a2, sel_contact);
        id v12 = objc_allocWithZone(MEMORY[0x263F33430]);
        id v13 = sub_25CF2630C(v11, v14, v15, 0);
        objc_msgSend(v10, sel_addRecipient_, v13);
      }
    }
    else
    {
      sub_25CF272D8((uint64_t)v17);
    }
  }
  else
  {
    sub_25CF43D18();
    sub_25CF271F0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    OUTLINED_FUNCTION_2_5();
    __break(1u);
  }
}

void sub_25CF24F20()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
  id v3 = v1;
  id v4 = objc_msgSend(v2, sel_textView);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_contentSize);
  double v7 = v6;

  objc_msgSend(v3, sel_setConstant_, v7);
  objc_msgSend(v2, sel_setNeedsUpdateConstraints);
}

void sub_25CF250D4()
{
  OUTLINED_FUNCTION_7_5();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_25CF43B08();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v18 = OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_9_0();
  sub_25CF27338(0, (unint64_t *)&qword_26A62F7F8);
  id v13 = (void *)sub_25CF43E68();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v0;
  v20[4] = v6;
  v20[5] = v14;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 1107296256;
  v20[2] = sub_25CF223D8;
  v20[3] = v4;
  uint64_t v15 = _Block_copy(v20);
  id v16 = v0;
  swift_release();
  sub_25CF43B18();
  v20[0] = MEMORY[0x263F8EE78];
  sub_25CF271F0((unint64_t *)&unk_26A62FA60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F800);
  sub_25CEFDA10((unint64_t *)&qword_26A62FA70, &qword_26A62F800);
  OUTLINED_FUNCTION_5_3();
  sub_25CF43EF8();
  uint64_t v17 = OUTLINED_FUNCTION_11_2();
  MEMORY[0x2611A2960](v17);
  _Block_release(v15);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v1, v7);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v18);
  OUTLINED_FUNCTION_10_2();
}

void sub_25CF25394(id a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3) {
      a3 = sub_25CF43D68();
    }
    id v4 = (id)a3;
    objc_msgSend(a1, sel_addAddress_);
  }
  else
  {
    __break(1u);
  }
}

id sub_25CF25490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone(MEMORY[0x263F33430]);
  swift_bridgeObjectRetain();
  return sub_25CF2630C(0, a2, a3, 0);
}

void sub_25CF2557C()
{
  OUTLINED_FUNCTION_7_5();
  uint64_t v3 = v0;
  unint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_25CF43B08();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v20 = OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_9_0();
  if (v5)
  {
    sub_25CF257D4(v7, v5);
    sub_25CF27338(0, (unint64_t *)&qword_26A62F7F8);
    uint64_t v15 = (void *)sub_25CF43E68();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v3;
    v21[4] = sub_25CF271BC;
    v21[5] = v16;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 1107296256;
    v21[2] = sub_25CF223D8;
    v21[3] = &block_descriptor_0;
    uint64_t v17 = _Block_copy(v21);
    id v18 = v3;
    swift_release();
    sub_25CF43B18();
    v21[0] = MEMORY[0x263F8EE78];
    sub_25CF271F0((unint64_t *)&unk_26A62FA60, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F800);
    sub_25CEFDA10((unint64_t *)&qword_26A62FA70, &qword_26A62F800);
    OUTLINED_FUNCTION_5_3();
    sub_25CF43EF8();
    uint64_t v19 = OUTLINED_FUNCTION_11_2();
    MEMORY[0x2611A2960](v19);
    _Block_release(v17);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v8);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v20);
    OUTLINED_FUNCTION_10_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_25CF257D4(uint64_t a1, unint64_t a2)
{
  *(unsigned char *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults) = 0;
  unint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager);
  uint64_t v6 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID;
  if (*(void *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID))
  {
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager), sel_cancelTaskWithID_);
    uint64_t v7 = *(void **)(v2 + v6);
    *(void *)(v2 + v6) = 0;
  }
  uint64_t v8 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    *(void *)(v2 + v6) = sub_25CF270E4(a1, a2, 0, v2, v5);
    MEMORY[0x270F9A758]();
  }
  else
  {
    unint64_t v9 = MEMORY[0x263F8EE78];
    sub_25CF245BC(v9);
  }
}

uint64_t sub_25CF258BC()
{
  return sub_25CF43A28();
}

void sub_25CF25A20(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 88);
  if (v3)
  {
    id v5 = v3;
    a2();
  }
  else
  {
    sub_25CF43D18();
    sub_25CF271F0((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    OUTLINED_FUNCTION_2_5();
    __break(1u);
  }
}

void sub_25CF25B44()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA40);
  OUTLINED_FUNCTION_9_2();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEBE0]), sel_init);
  objc_msgSend(v2, sel_setDelegate_, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA48);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25CF46160;
  *(void *)(v3 + 32) = sub_25CF43D88();
  *(void *)(v3 + 40) = v4;
  sub_25CF2714C(v3, v2, MEMORY[0x263F8D310], (SEL *)&selRef_setDisplayedPropertyKeys_);
  sub_25CF27338(0, (unint64_t *)&unk_26A62FA50);
  id v5 = (void *)sub_25CF43E18();
  objc_msgSend(v2, sel_setPredicateForEnablingContact_, v5);

  uint64_t v6 = (void *)sub_25CF43E18();
  objc_msgSend(v2, sel_setPredicateForSelectionOfContact_, v6);

  uint64_t v7 = (void *)sub_25CF43E18();
  objc_msgSend(v2, sel_setPredicateForSelectionOfProperty_, v7);

  objc_msgSend(v1, sel_presentViewController_animated_completion_, v2, 1, 0);
}

uint64_t sub_25CF25D88(uint64_t a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults) = 1;
  if (a1 && (uint64_t v2 = sub_25CF25DF4(a1)) != 0)
  {
    unint64_t v3 = v2;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v3 = MEMORY[0x263F8EE78];
  }
  sub_25CF245BC(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF25DF4(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25CF43FA8();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_25CF26F30(i, (uint64_t)v5);
    sub_25CF27338(0, &qword_26A62F9F8);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25CF43F88();
    sub_25CF43FB8();
    sub_25CF43FC8();
    sub_25CF43F98();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void sub_25CF25F94()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults) & 1) == 0) {
    sub_25CF245BC(MEMORY[0x263F8EE78]);
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID);
  *(void *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID) = 0;
}

void sub_25CF2602C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
  objc_msgSend(v4, sel_clearText);
  objc_msgSend(v4, sel_addRecipient_, a2);
  unint64_t v5 = MEMORY[0x263F8EE78];
  sub_25CF245BC(v5);
}

void sub_25CF26180()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint);
  if (v1)
  {
    uint64_t v2 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
    unint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView);
    id v4 = v1;
    objc_msgSend(v3, sel_contentSize);
    objc_msgSend(v4, sel_setConstant_, v5);

    uint64_t v6 = *(void **)(v0 + v2);
    objc_msgSend(v6, sel_setNeedsUpdateConstraints);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25CF26210(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    sub_25CF43FA8();
    uint64_t v4 = a1 + 32;
    do
    {
      sub_25CF26F30(v4, (uint64_t)&v5);
      sub_25CF27338(0, &qword_26A62F9F8);
      swift_dynamicCast();
      sub_25CF43F88();
      sub_25CF43FB8();
      sub_25CF43FC8();
      sub_25CF43F98();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

id sub_25CF2630C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (a3)
  {
    uint64_t v8 = (void *)sub_25CF43D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v5, sel_initWithContact_address_kind_, a1, v8, a4);

  return v9;
}

id sub_25CF26398(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  if (!a3)
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = (void *)sub_25CF43D68();
  swift_bridgeObjectRelease();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = (void *)sub_25CF43D68();
  swift_bridgeObjectRelease();
LABEL_6:
  id v13 = objc_msgSend(v7, sel_initWithContact_address_displayString_kind_, a1, v11, v12, a6);

  return v13;
}

uint64_t sub_25CF26460(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_3_5();
    uint64_t result = sub_25CF44008();
    __break(1u);
  }
  else if (a3 < a1 {
         || (uint64_t result = ((uint64_t (*)(void))a4)(0),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_13_1();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_13_1();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_25CF26578(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25CF44008();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_25CF2660C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0
    || ((uint64_t v7 = a4(0), v8 = *(void *)(*(void *)(v7 - 8) + 72) * a2, v9 = a3 + v8, v10 = a1 + v8, v9 > a1)
      ? (BOOL v11 = v10 > a3)
      : (BOOL v11 = 0),
        v11))
  {
    OUTLINED_FUNCTION_3_5();
    uint64_t v13 = sub_25CF44008();
    __break(1u);
  }
  else
  {
    uint64_t v12 = v7;
    uint64_t v13 = a3;
    unint64_t v14 = a1;
    uint64_t v15 = a2;
  }
  return MEMORY[0x270FA01C8](v13, v14, v15, v12);
}

uint64_t sub_25CF26710(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((v5 = a1, a3 + 32 * v4 > a1) ? (BOOL v6 = a1 + 32 * v4 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_25CF44008();
    __break(1u);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE58] + 8;
    uint64_t v8 = a3;
  }
  return MEMORY[0x270FA01C8](v8, v5, v4, v7);
}

void sub_25CF267F4()
{
  sub_25CF26964();
  void *v0 = v1;
}

void sub_25CF26844()
{
  sub_25CF26964();
  void *v0 = v1;
}

void sub_25CF26894()
{
  sub_25CF26964();
  void *v0 = v1;
}

void sub_25CF268E4()
{
  sub_25CF26964();
  void *v0 = v1;
}

char *sub_25CF26934(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25CF26AE4(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

_OWORD *sub_25CF26954(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_25CF26964()
{
  OUTLINED_FUNCTION_7_5();
  uint64_t v4 = v3;
  BOOL v6 = v5;
  uint64_t v7 = v1;
  char v9 = v8;
  if (v10)
  {
    unint64_t v11 = *(void *)(v1 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < v0)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        uint64_t v12 = v0;
      }
    }
  }
  else
  {
    uint64_t v12 = v0;
  }
  uint64_t v13 = *(void *)(v1 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v20 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v2);
  uint64_t v15 = v6(0);
  OUTLINED_FUNCTION_2_1(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  size_t v21 = _swift_stdlib_malloc_size(v20);
  if (!v17)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v21 - v19 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_24;
  }
  v20[2] = v13;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_19:
  uint64_t v23 = *(void *)(v6(0) - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v25 = (unint64_t)v20 + v24;
  unint64_t v26 = v7 + v24;
  if (v9)
  {
    sub_25CF26460(v26, v13, v25, v4);
    *(void *)(v7 + 16) = 0;
  }
  else
  {
    sub_25CF2660C(v26, v13, v25, (uint64_t (*)(void))v4);
  }
  swift_release();
  OUTLINED_FUNCTION_10_2();
}

char *sub_25CF26AE4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA00);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25CF26578(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25CF26710((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

unint64_t sub_25CF26BC8(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25CF43FF8();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA28);
    uint64_t result = sub_25CF43F08();
    unint64_t v3 = result;
    goto LABEL_6;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25CF43FF8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v18 = v1 + 32;
  uint64_t v19 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v20 = v1;
  while (1)
  {
    if (v21)
    {
      uint64_t result = MEMORY[0x2611A2A30](v6, v1);
      unint64_t v8 = result;
    }
    else
    {
      if (v6 >= *(void *)(v19 + 16)) {
        goto LABEL_28;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v6);
      uint64_t result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    sub_25CF43078();
    sub_25CF271F0(&qword_26A62FA30, MEMORY[0x263EFDD18]);
    uint64_t result = sub_25CF43D48();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v15 = ~v10;
      sub_25CF271F0(&qword_26A62FA38, MEMORY[0x263EFDD18]);
      while (1)
      {
        uint64_t result = sub_25CF43D58();
        if (result) {
          break;
        }
        unint64_t v11 = (v11 + 1) & v15;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          unint64_t v1 = v20;
          goto LABEL_21;
        }
      }
      uint64_t result = swift_release();
      unint64_t v1 = v20;
    }
    else
    {
LABEL_21:
      *(void *)(v7 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v8;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v9 = __OFADD__(v16, 1);
      uint64_t v17 = v16 + 1;
      if (v9) {
        goto LABEL_27;
      }
      *(void *)(v3 + 16) = v17;
    }
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25CF26E74(void *a1)
{
  id v1 = objc_msgSend(a1, sel_recipients);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_25CF43DE8();

  return v3;
}

uint64_t sub_25CF26ED0(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_25CF43D88();

  return v4;
}

uint64_t sub_25CF26F30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25CF26F8C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25CF26FC4(uint64_t a1)
{
  sub_25CF23590(a1, v1);
}

uint64_t sub_25CF26FCC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 88);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return a1;
}

void sub_25CF27068(uint64_t a1, void *a2)
{
  sub_25CF27338(0, &qword_26A62F9F8);
  id v3 = (id)sub_25CF43DD8();
  objc_msgSend(a2, sel_setRecipients_, v3);
}

id sub_25CF270E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v8 = (void *)sub_25CF43D68();
  id v9 = objc_msgSend(a5, sel_searchForText_withAutocompleteFetchContext_consumer_, v8, a3, a4);

  return v9;
}

void sub_25CF2714C(uint64_t a1, void *a2, uint64_t a3, SEL *a4)
{
  id v6 = (id)sub_25CF43DD8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a4, v6);
}

uint64_t sub_25CF271BC()
{
  return sub_25CF258BC();
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

uint64_t sub_25CF271F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF27238()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25CF27270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF272D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FA80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF27338(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_25CF43298();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_25CF43B28();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return v0 - 128;
}

id OUTLINED_FUNCTION_6_3()
{
  return objc_msgSend(v0, (SEL)(v2 + 750), v1);
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_25CF43A28();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

void *sub_25CF274B0(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    *(void *)(a1 + 56) = a2[7];
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v7 = a3[9];
    unint64_t v8 = (char *)(a1 + v7);
    id v9 = (char *)a2 + v7;
    *(void *)(a1 + 72) = a2[9];
    uint64_t v10 = sub_25CF42DF8();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
    *(void *)&v8[*(int *)(v13 + 36)] = *(void *)&v9[*(int *)(v13 + 36)];
    uint64_t v14 = *(int *)(v13 + 40);
    uint64_t v15 = &v8[v14];
    uint64_t v16 = &v9[v14];
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v10))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v15, v16, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v10);
    }
    uint64_t v18 = a3[10];
    uint64_t v19 = a3[11];
    unint64_t v20 = (void *)((char *)v4 + v18);
    uint64_t v21 = (uint64_t)a2 + v18;
    uint64_t v23 = *(void **)v21;
    uint64_t v22 = *(void *)(v21 + 8);
    *unint64_t v20 = v23;
    v20[1] = v22;
    unint64_t v24 = (void *)((char *)v4 + v19);
    unint64_t v25 = (uint64_t *)((char *)a2 + v19);
    id v26 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v24, v25, v27);
    }
    else
    {
      *unint64_t v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_25CF277D0(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[9];
  uint64_t v5 = sub_25CF42DF8();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  swift_release();
  uint64_t v7 = v4 + *(int *)(v6 + 40);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v7, v5);
  }

  uint64_t v8 = a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_25CF43138();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_25CF2798C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v9 = sub_25CF42DF8();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  *(void *)&v7[*(int *)(v11 + 36)] = *(void *)&v8[*(int *)(v11 + 36)];
  uint64_t v12 = *(int *)(v11 + 40);
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v9))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v13, v14, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v9);
  }
  uint64_t v16 = a3[10];
  uint64_t v17 = a3[11];
  uint64_t v18 = (void *)(a1 + v16);
  uint64_t v19 = a2 + v16;
  uint64_t v21 = *(void **)v19;
  uint64_t v20 = *(void *)(v19 + 8);
  *uint64_t v18 = v21;
  v18[1] = v20;
  uint64_t v22 = (void *)(a1 + v17);
  uint64_t v23 = (void *)(a2 + v17);
  id v24 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_25CF43138();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v22, v23, v25);
  }
  else
  {
    void *v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_25CF27C54(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_25CF42DF8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  *(void *)&v7[*(int *)(v14 + 36)] = *(void *)&v8[*(int *)(v14 + 36)];
  swift_retain();
  swift_release();
  uint64_t v15 = *(int *)(v14 + 40);
  uint64_t v16 = &v7[v15];
  uint64_t v17 = &v8[v15];
  LODWORD(v14) = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v9);
  int v18 = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v9);
  if (v14)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v16, v17, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v19 = *(void *)(v9 - 8);
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  id v24 = *(void **)(a1 + v21);
  uint64_t v25 = *(void **)(a2 + v21);
  void *v22 = v25;
  id v26 = v25;

  v22[1] = *(void *)(v23 + 8);
  if (a1 != a2)
  {
    uint64_t v27 = a3[11];
    uint64_t v28 = (void *)(a1 + v27);
    uint64_t v29 = (void *)(a2 + v27);
    sub_25CEFDA54(a1 + v27, &qword_26A62ED50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      *uint64_t v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_25CF28070(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = a3[9];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25CF42DF8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  *(void *)&v9[*(int *)(v13 + 36)] = *(void *)&v10[*(int *)(v13 + 36)];
  uint64_t v14 = *(int *)(v13 + 40);
  uint64_t v15 = &v9[v14];
  uint64_t v16 = &v10[v14];
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v11))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v15, v16, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v11);
  }
  uint64_t v18 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_25CF43138();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  return a1;
}

uint64_t sub_25CF282C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  uint64_t v7 = a3[9];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_25CF42DF8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  *(void *)&v8[*(int *)(v15 + 36)] = *(void *)&v9[*(int *)(v15 + 36)];
  swift_release();
  uint64_t v16 = *(int *)(v15 + 40);
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  LODWORD(v15) = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v10);
  int v19 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v10);
  if (v15)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v17, v18, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v20 = *(void *)(v10 - 8);
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v10);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v10);
LABEL_13:
  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)(a1 + v22);
  id v24 = (void *)(a2 + v22);
  uint64_t v25 = *(void **)(a1 + v22);
  void *v23 = *v24;

  v23[1] = v24[1];
  if (a1 != a2)
  {
    uint64_t v26 = a3[11];
    uint64_t v27 = (void *)(a1 + v26);
    uint64_t v28 = (const void *)(a2 + v26);
    sub_25CEFDA54(a1 + v26, &qword_26A62ED50);
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_25CF43138();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v30 - 8) + 32))(v27, v28, v30);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25CF286B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF286C4);
}

uint64_t sub_25CF286C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 36);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
      uint64_t v11 = *(int *)(a3 + 44);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_25CF28778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF2878C);
}

uint64_t sub_25CF2878C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 36);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
      uint64_t v11 = *(int *)(a4 + 44);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SceneClientView()
{
  uint64_t result = qword_26A62FBA0;
  if (!qword_26A62FBA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25CF28884()
{
  sub_25CF28968();
  if (v0 <= 0x3F)
  {
    sub_25CF0EF9C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25CF28968()
{
  if (!qword_26A62FBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FB90);
    sub_25CF2DB58((uint64_t)&unk_26A62FBB8);
    unint64_t v0 = sub_25CF43108();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A62FBB0);
    }
  }
}

uint64_t sub_25CF28A08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF28A24()
{
  return 1;
}

uint64_t sub_25CF28AF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SceneClientView();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v14 - v6;
  uint64_t v8 = *(void *)(v0 + 24);
  char v15 = *(unsigned char *)(v0 + 16);
  uint64_t v16 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
  sub_25CF439C8();
  int v9 = v17;
  sub_25CF2D910(v1, (uint64_t)v7);
  if (v9 == 1)
  {
    uint64_t v10 = *((void *)v7 + 5);
    char v15 = v7[32];
    uint64_t v16 = v10;
    sub_25CF439C8();
    sub_25CF2DED0((uint64_t)v7);
    unsigned __int8 v11 = v17;
    sub_25CF2D910(v1, (uint64_t)v5);
    if (v11)
    {
      uint64_t v12 = *((void *)v5 + 7);
      char v15 = v5[48];
      uint64_t v16 = v12;
      sub_25CF439C8();
      sub_25CF2DED0((uint64_t)v5);
      return v17;
    }
  }
  else
  {
    sub_25CF2DED0((uint64_t)v7);
    sub_25CF2D910(v1, (uint64_t)v5);
  }
  sub_25CF2DED0((uint64_t)v5);
  return 0;
}

uint64_t sub_25CF28C5C@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11_3();
  *(unsigned char *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11_3();
  *(unsigned char *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11_3();
  *(unsigned char *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11_3();
  *(unsigned char *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = type metadata accessor for SceneClientView();
  sub_25CF42DF8();
  sub_25CF2E700((uint64_t)&unk_26A62FBC0);
  sub_25CF430F8();
  unsigned __int8 v11 = (uint64_t *)(a1 + *(int *)(v10 + 40));
  sub_25CF43D18();
  sub_25CF2E700((uint64_t)&qword_26A62FA10);
  *unsigned __int8 v11 = sub_25CF432A8();
  v11[1] = v12;
  uint64_t v13 = (uint64_t *)(a1 + *(int *)(v10 + 44));
  *uint64_t v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for SiriMailModel();
  sub_25CF2E700((uint64_t)&qword_26A62FC10);
  uint64_t result = sub_25CF43218();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v15;
  return result;
}

uint64_t sub_25CF28E38@<X0>(uint64_t a1@<X8>)
{
  char v2 = v1;
  uint64_t v104 = a1;
  sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  uint64_t v102 = v4;
  uint64_t v103 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v101 = (char *)v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  long long v100 = (char *)v76 - v7;
  uint64_t v8 = type metadata accessor for SceneClientView();
  uint64_t v9 = v8 - 8;
  uint64_t v98 = *(void *)(v8 - 8);
  uint64_t v97 = *(void *)(v98 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v96 = (uint64_t)v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13 - v12;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBC8) - 8;
  MEMORY[0x270FA5388](v88);
  OUTLINED_FUNCTION_1_3();
  uint64_t v86 = v15;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD0);
  OUTLINED_FUNCTION_0();
  uint64_t v81 = v16;
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_6_2((uint64_t)v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_6_2((uint64_t)v76 - v21);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD8);
  OUTLINED_FUNCTION_0();
  uint64_t v87 = v22;
  uint64_t v85 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_6_2((uint64_t)v76 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)v76 - v27;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBE0);
  MEMORY[0x270FA5388](v29 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v32 = v31 - v30;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBE8) - 8;
  MEMORY[0x270FA5388](v83);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v33);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBF0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_3();
  uint64_t v105 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBF8);
  OUTLINED_FUNCTION_0();
  uint64_t v94 = v37;
  uint64_t v95 = v36;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_1_3();
  uint64_t v91 = v38;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC00) - 8;
  MEMORY[0x270FA5388](v93);
  OUTLINED_FUNCTION_1_3();
  uint64_t v92 = v39;
  *(void *)uint64_t v32 = sub_25CF434E8();
  *(void *)(v32 + 8) = 0;
  *(unsigned char *)(v32 + 16) = 0;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC08);
  sub_25CF2987C(v2, v32 + *(int *)(v40 + 44));
  id v77 = v2;
  type metadata accessor for SiriMailModel();
  sub_25CF2E700((uint64_t)&unk_26A62FC10);
  sub_25CF43228();
  swift_getKeyPath();
  sub_25CF43238();
  swift_release();
  swift_release();
  v76[1] = &v2[*(int *)(v9 + 44)];
  v76[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  uint64_t v41 = v79;
  sub_25CF430D8();
  MEMORY[0x2611A2500](v78);
  uint64_t v42 = v80;
  sub_25CEFDAA8(v41, v80, &qword_26A62FBD0);
  unint64_t v43 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  uint64_t v44 = swift_allocObject();
  sub_25CF2E5F4(v42, v44 + v43, &qword_26A62FBD0);
  uint64_t v45 = v86;
  uint64_t v46 = v86 + *(int *)(v88 + 44);
  sub_25CEFDAA8(v14, v46, &qword_26A62FB90);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC18);
  uint64_t v48 = (uint64_t (**)(uint64_t))(v46 + *(int *)(v47 + 36));
  *uint64_t v48 = sub_25CF2D6C4;
  v48[1] = (uint64_t (*)(uint64_t))v44;
  sub_25CEFDAA8(v32, v45, &qword_26A62FBE0);
  sub_25CEFDA54(v14, &qword_26A62FB90);
  sub_25CF430E8();
  uint64_t v49 = v84;
  sub_25CEFDAA8((uint64_t)v28, v84, &qword_26A62FBD8);
  unint64_t v50 = (*(unsigned __int8 *)(v87 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
  uint64_t v51 = swift_allocObject();
  sub_25CF2E5F4(v49, v51 + v50, &qword_26A62FBD8);
  uint64_t v52 = v82;
  uint64_t v53 = v82 + *(int *)(v83 + 44);
  sub_25CEFDAA8(v14, v53, &qword_26A62FB90);
  uint64_t v54 = (uint64_t (**)(uint64_t))(v53 + *(int *)(v47 + 36));
  *uint64_t v54 = sub_25CF2D894;
  v54[1] = (uint64_t (*)(uint64_t))v51;
  sub_25CEFDAA8(v45, v52, &qword_26A62FBC8);
  sub_25CEFDA54(v14, &qword_26A62FB90);
  sub_25CEFDA54(v45, &qword_26A62FBC8);
  sub_25CEFDA54(v41, &qword_26A62FBD0);
  sub_25CEFDA54((uint64_t)v28, &qword_26A62FBD8);
  sub_25CEFDA54(v32, &qword_26A62FBE0);
  uint64_t v55 = v105;
  sub_25CEFDAA8(v52, v105, &qword_26A62FBE8);
  id v56 = (void (**)())(v55 + *(int *)(v89 + 36));
  *id v56 = sub_25CF2CB5C;
  v56[1] = 0;
  v56[2] = 0;
  v56[3] = 0;
  sub_25CEFDA54(v52, &qword_26A62FBE8);
  sub_25CF430C8();
  uint64_t v57 = (uint64_t)v77;
  uint64_t v58 = v96;
  sub_25CF2D910((uint64_t)v77, v96);
  unint64_t v59 = (*(unsigned __int8 *)(v98 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
  uint64_t v60 = swift_allocObject();
  sub_25CF2D978(v58, v60 + v59);
  sub_25CF2DE58((uint64_t)&unk_26A62FC20);
  sub_25CF2DB58((uint64_t)&qword_26A62FC48);
  uint64_t v61 = v91;
  uint64_t v62 = v105;
  sub_25CF438E8();
  swift_release();
  sub_25CEFDA54(v14, &qword_26A62FB90);
  sub_25CEFDA54(v62, &qword_26A62FBF0);
  sub_25CF2D910(v57, v58);
  uint64_t v63 = swift_allocObject();
  sub_25CF2D978(v58, v63 + v59);
  uint64_t v65 = v94;
  uint64_t v64 = v95;
  uint64_t v66 = v92;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 16))(v92, v61, v95);
  id v67 = (void *)(v66 + *(int *)(v93 + 44));
  *id v67 = 0;
  v67[1] = 0;
  v67[2] = sub_25CF2DDDC;
  void v67[3] = v63;
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v61, v64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v68 = v100;
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  id v69 = v101;
  uint64_t v70 = v102;
  uint64_t v71 = v103;
  (*(void (**)(char *, void, uint64_t))(v102 + 104))(v101, *MEMORY[0x263F70738], v103);
  uint64_t v72 = v69;
  LOBYTE(v69) = sub_25CF2F114();
  id v73 = *(void (**)(char *, uint64_t))(v70 + 8);
  v73(v72, v71);
  v73(v68, v71);
  uint64_t v74 = v104;
  sub_25CEFDAA8(v66, v104, &qword_26A62FC00);
  *(unsigned char *)(v74 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC58) + 36)) = v69 & 1;
  return sub_25CEFDA54(v66, &qword_26A62FC00);
}

uint64_t sub_25CF2987C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v380 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC68);
  uint64_t v355 = *(void *)(v3 - 8);
  uint64_t v356 = v3;
  MEMORY[0x270FA5388](v3);
  v354 = (char *)&v326 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC70);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v358 = (char *)&v326 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v357 = (uint64_t)&v326 - v8;
  uint64_t v400 = sub_25CF42DF8();
  uint64_t v384 = *(void *)(v400 - 8);
  MEMORY[0x270FA5388](v400);
  v335 = (char *)&v326 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v349 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC78);
  uint64_t v10 = MEMORY[0x270FA5388](v349);
  v364 = (char *)&v326 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v341 = (uint64_t)&v326 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC80);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  v367 = (uint64_t *)((char *)&v326 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v366 = (uint64_t)&v326 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC88);
  MEMORY[0x270FA5388](v17 - 8);
  v376 = (uint64_t *)((char *)&v326 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v361 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC90);
  MEMORY[0x270FA5388](v361);
  uint64_t v377 = (uint64_t)&v326 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v363 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FC98);
  uint64_t v20 = MEMORY[0x270FA5388](v363);
  uint64_t v365 = (uint64_t)&v326 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v362 = (uint64_t)&v326 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v378 = (uint64_t)&v326 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCA0);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  v396 = (char *)&v326 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v393 = (uint64_t)&v326 - v28;
  uint64_t v404 = type metadata accessor for SceneClientView();
  uint64_t v29 = MEMORY[0x270FA5388](v404);
  uint64_t v369 = (uint64_t)&v326 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v368 = (uint64_t)&v326 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v360 = (uint64_t)&v326 - v34;
  MEMORY[0x270FA5388](v33);
  v375 = (char *)&v326 - v35;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCA8);
  uint64_t v37 = MEMORY[0x270FA5388](v36 - 8);
  uint64_t v379 = (uint64_t)&v326 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  uint64_t v399 = (uint64_t)&v326 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v388 = (void *)((char *)&v326 - v42);
  MEMORY[0x270FA5388](v41);
  uint64_t v398 = (uint64_t)&v326 - v43;
  uint64_t v391 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v44 = MEMORY[0x270FA5388](v391);
  uint64_t v334 = (uint64_t)&v326 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v340 = (char *)&v326 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  uint64_t v342 = (uint64_t)&v326 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  uint64_t v336 = (uint64_t)&v326 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v347 = (char *)&v326 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  uint64_t v348 = (uint64_t)&v326 - v55;
  MEMORY[0x270FA5388](v54);
  uint64_t v57 = (char *)&v326 - v56;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD0);
  MEMORY[0x270FA5388](v58 - 8);
  v390 = (char *)&v326 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v387 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCB0);
  v402 = *(void **)(v387 - 8);
  uint64_t v60 = MEMORY[0x270FA5388](v387);
  v346 = (char *)&v326 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v359 = (char *)&v326 - v63;
  MEMORY[0x270FA5388](v62);
  v397 = (char *)&v326 - v64;
  uint64_t v386 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCB8);
  uint64_t v65 = MEMORY[0x270FA5388](v386);
  v339 = (char *)&v326 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = MEMORY[0x270FA5388](v65);
  v345 = (char *)&v326 - v68;
  MEMORY[0x270FA5388](v67);
  v374 = (char *)&v326 - v69;
  uint64_t v385 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCC0);
  uint64_t v70 = MEMORY[0x270FA5388](v385);
  uint64_t v337 = (uint64_t)&v326 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = MEMORY[0x270FA5388](v70);
  uint64_t v338 = (uint64_t)&v326 - v73;
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  uint64_t v403 = (uint64_t)&v326 - v75;
  uint64_t v76 = MEMORY[0x270FA5388](v74);
  uint64_t v343 = (uint64_t)&v326 - v77;
  uint64_t v78 = MEMORY[0x270FA5388](v76);
  uint64_t v344 = (uint64_t)&v326 - v79;
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  v373 = (char *)&v326 - v81;
  MEMORY[0x270FA5388](v80);
  uint64_t v405 = (uint64_t)&v326 - v82;
  uint64_t v83 = *((void *)a1 + 1);
  uint64_t v84 = *(void *)(v83 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_toLabel + 8);
  *(void *)&long long v389 = *(void *)(v83 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_toLabel);
  uint64_t v85 = *((void *)a1 + 3);
  LOBYTE(v426) = a1[16];
  *((void *)&v426 + 1) = v85;
  swift_bridgeObjectRetain();
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
  sub_25CF439E8();
  uint64_t v382 = *(void *)&v408[8];
  uint64_t v383 = *(void *)v408;
  LODWORD(v381) = v408[16];
  uint64_t v87 = *((void *)a1 + 9);
  LOBYTE(v426) = a1[64];
  *((void *)&v426 + 1) = v87;
  sub_25CF439E8();
  unint64_t v371 = *(void *)&v408[8];
  v372 = *(char **)v408;
  char v88 = v408[16];
  uint64_t v89 = type metadata accessor for SiriMailModel();
  unint64_t v90 = sub_25CF2E700((uint64_t)&unk_26A62FC10);
  uint64_t v395 = v89;
  sub_25CF43228();
  swift_getKeyPath();
  unint64_t v394 = v90;
  sub_25CF43238();
  swift_release();
  swift_release();
  uint64_t v91 = *(void *)v408;
  uint64_t v92 = sub_25CF43D18();
  unint64_t v93 = sub_25CF2E700((uint64_t)&qword_26A62FA10);
  long long v370 = *(_OWORD *)&v408[8];
  uint64_t v406 = v92;
  uint64_t v401 = v93;
  uint64_t v94 = sub_25CF432A8();
  uint64_t v96 = v95;
  uint64_t v97 = *((void *)a1 + 3);
  v408[0] = a1[16];
  *(void *)&v408[8] = v97;
  uint64_t v392 = v86;
  sub_25CF439C8();
  *(void *)v408 = v389;
  *(void *)&v408[8] = v84;
  *(void *)&v408[16] = v383;
  uint64_t v409 = v382;
  LOBYTE(v410) = (_BYTE)v381;
  v411 = v372;
  unint64_t v412 = v371;
  LOBYTE(v413) = v88;
  uint64_t v414 = v91;
  long long v415 = v370;
  v416 = (void *)v94;
  uint64_t v417 = v96;
  char v418 = 0;
  char v419 = v426;
  uint64_t v98 = &a1[*(int *)(v404 + 36)];
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  uint64_t v100 = (uint64_t)v390;
  uint64_t v383 = v99;
  *(void *)&long long v370 = v98;
  sub_25CF430D8();
  uint64_t v101 = *MEMORY[0x263F706F8];
  uint64_t v102 = v400;
  v381 = *(void (**)(char *, uint64_t, uint64_t))(v384 + 104);
  uint64_t v382 = v384 + 104;
  v381(v57, v101, v400);
  __swift_storeEnumTagSinglePayload((uint64_t)v57, 0, 1, v102);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCC8);
  unint64_t v104 = sub_25CF2DE58((uint64_t)&unk_26A62FCD0);
  unint64_t v105 = sub_25CF2DB58((uint64_t)&unk_26A62FBB8);
  unint64_t v352 = v104;
  uint64_t v353 = v103;
  unint64_t v371 = v105;
  sub_25CF438C8();
  v372 = v57;
  sub_25CEFDA54((uint64_t)v57, &qword_26A62FB90);
  sub_25CEFDA54(v100, &qword_26A62FBD0);
  uint64_t v106 = v416;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v107 = (uint64_t)a1;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  uint64_t v108 = *(void **)&a1[*(int *)(v404 + 40)];
  if (!v108) {
    goto LABEL_67;
  }
  *(void *)&long long v389 = &a1[*(int *)(v404 + 40)];
  id v109 = v108;
  char v110 = sub_25CF43C88();

  if (v110) {
    sub_25CF43AD8();
  }
  else {
    sub_25CF43AC8();
  }
  uint64_t v111 = v396;
  uint64_t v112 = v393;
  sub_25CF431C8();
  unsigned __int8 v113 = v402;
  uint64_t v114 = (uint64_t)v374;
  long long v115 = v397;
  uint64_t v116 = v387;
  v350 = (void (*)(char *, char *, uint64_t))v402[2];
  v351 = v402 + 2;
  v350(v374, v397, v387);
  uint64_t v117 = (_OWORD *)(v114 + *(int *)(v386 + 36));
  long long v118 = v421;
  *uint64_t v117 = v420;
  v117[1] = v118;
  v117[2] = v422;
  uint64_t v119 = (char *)v113[1];
  v402 = v113 + 1;
  v397 = v119;
  ((void (*)(char *, uint64_t))v119)(v115, v116);
  uint64_t v120 = sub_25CF432A8();
  uint64_t v122 = v121;
  uint64_t v123 = (uint64_t)v373;
  sub_25CEFDAA8(v114, (uint64_t)v373, &qword_26A62FCB8);
  uint64_t v124 = (uint64_t *)(v123 + *(int *)(v385 + 36));
  *uint64_t v124 = v120;
  v124[1] = v122;
  sub_25CEFDA54(v114, &qword_26A62FCB8);
  sub_25CF2E5F4(v123, v405, &qword_26A62FCC0);
  uint64_t v125 = *((void *)a1 + 3);
  v408[0] = a1[16];
  *(void *)&v408[8] = v125;
  sub_25CF439C8();
  if (v426 != 1) {
    goto LABEL_7;
  }
  sub_25CF43228();
  swift_getKeyPath();
  sub_25CF43238();
  swift_release();
  swift_release();
  char v126 = sub_25CF28A24();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if ((v126 & 1) == 0)
  {
    v373 = (char *)sub_25CF432A8();
    v333 = v129;
    uint64_t v130 = *((void *)a1 + 1);
    uint64_t v131 = *(void *)(v130 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_ccLabel + 8);
    uint64_t v332 = *(void *)(v130 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_ccLabel);
    uint64_t v132 = *((void *)a1 + 5);
    LOBYTE(v426) = a1[32];
    *((void *)&v426 + 1) = v132;
    swift_bridgeObjectRetain();
    sub_25CF439E8();
    uint64_t v330 = *(void *)&v408[8];
    *(void *)&long long v331 = *(void *)v408;
    int v329 = v408[16];
    uint64_t v133 = *((void *)a1 + 9);
    LOBYTE(v426) = a1[64];
    *((void *)&v426 + 1) = v133;
    sub_25CF439E8();
    uint64_t v134 = *(char **)v408;
    unint64_t v328 = *(void *)&v408[8];
    int v327 = v408[16];
    sub_25CF43228();
    swift_getKeyPath();
    sub_25CF43238();
    swift_release();
    swift_release();
    uint64_t v135 = *(void *)v408;
    long long v326 = *(_OWORD *)&v408[8];
    uint64_t v136 = sub_25CF432A8();
    uint64_t v138 = v137;
    char v139 = a1[32];
    v374 = a1;
    uint64_t v140 = *((void *)a1 + 5);
    v408[0] = v139;
    *(void *)&v408[8] = v140;
    sub_25CF439C8();
    *(void *)v408 = v332;
    *(void *)&v408[8] = v131;
    *(void *)&v408[16] = v331;
    uint64_t v409 = v330;
    LOBYTE(v410) = v329;
    v411 = v134;
    unint64_t v412 = v328;
    LOBYTE(v413) = v327;
    uint64_t v414 = v135;
    uint64_t v141 = (id *)v389;
    long long v415 = v326;
    v416 = (void *)v136;
    uint64_t v417 = v138;
    char v418 = 0;
    char v419 = v426;
    uint64_t v142 = (uint64_t)v390;
    sub_25CF430D8();
    uint64_t v143 = (uint64_t)v372;
    uint64_t v144 = v400;
    v381(v372, *MEMORY[0x263F706F0], v400);
    __swift_storeEnumTagSinglePayload(v143, 0, 1, v144);
    sub_25CF438C8();
    sub_25CEFDA54(v143, &qword_26A62FB90);
    sub_25CEFDA54(v142, &qword_26A62FBD0);
    uint64_t v145 = v416;
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();

    if (!*v141) {
      goto LABEL_67;
    }
    id v146 = *v141;
    char v147 = sub_25CF43C88();

    if (v147) {
      sub_25CF43AD8();
    }
    else {
      sub_25CF43AC8();
    }
    uint64_t v112 = v393;
    uint64_t v107 = (uint64_t)v374;
    sub_25CF431C8();
    uint64_t v148 = (uint64_t)v345;
    uint64_t v149 = v359;
    uint64_t v150 = v387;
    v350(v345, v359, v387);
    uint64_t v151 = (_OWORD *)(v148 + *(int *)(v386 + 36));
    long long v152 = v424;
    *uint64_t v151 = v423;
    v151[1] = v152;
    v151[2] = v425;
    ((void (*)(char *, uint64_t))v397)(v149, v150);
    uint64_t v153 = sub_25CF432A8();
    uint64_t v155 = v154;
    uint64_t v156 = v343;
    sub_25CEFDAA8(v148, v343, &qword_26A62FCB8);
    uint64_t v157 = (uint64_t *)(v156 + *(int *)(v385 + 36));
    *uint64_t v157 = v153;
    v157[1] = v155;
    sub_25CEFDA54(v148, &qword_26A62FCB8);
    uint64_t v158 = v156;
    uint64_t v159 = v344;
    sub_25CF2E5F4(v158, v344, &qword_26A62FCC0);
    uint64_t v160 = v403;
    sub_25CEFDAA8(v159, v403, &qword_26A62FCC0);
    uint64_t v161 = v388;
    v162 = v373;
    uint64_t v163 = v333;
    void *v388 = v373;
    v161[1] = v163;
    uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD18);
    sub_25CEFDAA8(v160, (uint64_t)v161 + *(int *)(v164 + 48), &qword_26A62FCC0);
    id v165 = v162;
    sub_25CEFDA54(v159, &qword_26A62FCC0);
    sub_25CEFDA54(v160, &qword_26A62FCC0);

    uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCD8);
    __swift_storeEnumTagSinglePayload((uint64_t)v161, 0, 1, v166);
    sub_25CF2E5F4((uint64_t)v161, v398, &qword_26A62FCA8);
    uint64_t v128 = v396;
  }
  else
  {
LABEL_7:
    uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCD8);
    __swift_storeEnumTagSinglePayload(v398, 1, 1, v127);
    uint64_t v128 = v111;
  }
  uint64_t v167 = *(void *)(v107 + 24);
  v408[0] = *(unsigned char *)(v107 + 16);
  *(void *)&v408[8] = v167;
  sub_25CF439C8();
  int v168 = v426;
  uint64_t v169 = (uint64_t)v375;
  sub_25CF2D910(v107, (uint64_t)v375);
  if (v168 != 1)
  {
    sub_25CF2DED0(v169);
    uint64_t v171 = (id *)v389;
LABEL_20:
    uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCD8);
    __swift_storeEnumTagSinglePayload(v399, 1, 1, v192);
    goto LABEL_21;
  }
  uint64_t v170 = *(void *)(v169 + 40);
  v408[0] = *(unsigned char *)(v169 + 32);
  *(void *)&v408[8] = v170;
  sub_25CF439C8();
  sub_25CF2DED0(v169);
  uint64_t v171 = (id *)v389;
  if ((v426 & 1) == 0) {
    goto LABEL_20;
  }
  sub_25CF43228();
  swift_getKeyPath();
  sub_25CF43238();
  swift_release();
  swift_release();
  char v172 = sub_25CF28A24();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v172) {
    goto LABEL_20;
  }
  v375 = (char *)sub_25CF432A8();
  v373 = (char *)v173;
  uint64_t v174 = *(void *)(v107 + 8);
  uint64_t v175 = *(void *)(v174 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_bccLabel + 8);
  v359 = *(char **)(v174 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_bccLabel);
  uint64_t v176 = *(void *)(v107 + 56);
  LOBYTE(v426) = *(unsigned char *)(v107 + 48);
  *((void *)&v426 + 1) = v176;
  swift_bridgeObjectRetain();
  sub_25CF439E8();
  uint64_t v344 = *(void *)&v408[8];
  v345 = *(char **)v408;
  LODWORD(v343) = v408[16];
  uint64_t v177 = *(void *)(v107 + 72);
  LOBYTE(v426) = *(unsigned char *)(v107 + 64);
  *((void *)&v426 + 1) = v177;
  sub_25CF439E8();
  v333 = *(char **)v408;
  unint64_t v178 = *(void *)&v408[8];
  LODWORD(v332) = v408[16];
  sub_25CF43228();
  swift_getKeyPath();
  sub_25CF43238();
  swift_release();
  swift_release();
  uint64_t v179 = *(void *)v408;
  long long v331 = *(_OWORD *)&v408[8];
  uint64_t v180 = sub_25CF432A8();
  uint64_t v182 = v181;
  char v183 = *(unsigned char *)(v107 + 48);
  v374 = (char *)v107;
  uint64_t v184 = *(void *)(v107 + 56);
  v408[0] = v183;
  *(void *)&v408[8] = v184;
  sub_25CF439C8();
  *(void *)v408 = v359;
  *(void *)&v408[8] = v175;
  *(void *)&v408[16] = v345;
  uint64_t v409 = v344;
  LOBYTE(v410) = v343;
  v411 = v333;
  unint64_t v412 = v178;
  LOBYTE(v413) = v332;
  uint64_t v414 = v179;
  long long v415 = v331;
  v416 = (void *)v180;
  uint64_t v417 = v182;
  char v418 = 0;
  char v419 = v426;
  uint64_t v185 = (uint64_t)v390;
  sub_25CF430D8();
  uint64_t v186 = (uint64_t)v372;
  uint64_t v187 = v400;
  v381(v372, *MEMORY[0x263F70700], v400);
  __swift_storeEnumTagSinglePayload(v186, 0, 1, v187);
  sub_25CF438C8();
  sub_25CEFDA54(v186, &qword_26A62FB90);
  sub_25CEFDA54(v185, &qword_26A62FBD0);
  uint64_t v188 = v416;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v189 = (id *)v389;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  if (!*v189) {
    goto LABEL_67;
  }
  id v190 = *v189;
  char v191 = sub_25CF43C88();

  if (v191) {
    sub_25CF43AD8();
  }
  else {
    sub_25CF43AC8();
  }
  uint64_t v128 = v396;
  uint64_t v112 = v393;
  uint64_t v107 = (uint64_t)v374;
  sub_25CF431C8();
  uint64_t v294 = (uint64_t)v339;
  v295 = v346;
  uint64_t v296 = v387;
  v350(v339, v346, v387);
  v297 = (_OWORD *)(v294 + *(int *)(v386 + 36));
  long long v298 = v427;
  _OWORD *v297 = v426;
  v297[1] = v298;
  v297[2] = v428;
  ((void (*)(char *, uint64_t))v397)(v295, v296);
  uint64_t v299 = sub_25CF432A8();
  uint64_t v301 = v300;
  uint64_t v302 = v337;
  sub_25CEFDAA8(v294, v337, &qword_26A62FCB8);
  v303 = (uint64_t *)(v302 + *(int *)(v385 + 36));
  uint64_t *v303 = v299;
  v303[1] = v301;
  sub_25CEFDA54(v294, &qword_26A62FCB8);
  uint64_t v304 = v302;
  uint64_t v305 = v338;
  sub_25CF2E5F4(v304, v338, &qword_26A62FCC0);
  uint64_t v306 = v403;
  sub_25CEFDAA8(v305, v403, &qword_26A62FCC0);
  v307 = v388;
  v308 = v375;
  uint64_t v309 = (uint64_t)v373;
  void *v388 = v375;
  v307[1] = v309;
  uint64_t v310 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD18);
  sub_25CEFDAA8(v306, (uint64_t)v307 + *(int *)(v310 + 48), &qword_26A62FCC0);
  id v311 = v308;
  sub_25CEFDA54(v305, &qword_26A62FCC0);
  sub_25CEFDA54(v306, &qword_26A62FCC0);

  uint64_t v312 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCD8);
  __swift_storeEnumTagSinglePayload((uint64_t)v307, 0, 1, v312);
  sub_25CF2E5F4((uint64_t)v307, v399, &qword_26A62FCA8);
  uint64_t v171 = (id *)v389;
LABEL_21:
  if (sub_25CF28AF0())
  {
    uint64_t v193 = sub_25CF432A8();
    v397 = v194;
    uint64_t v195 = sub_25CF43438();
    if (qword_26A62ED00 != -1) {
      swift_once();
    }
    uint64_t v196 = qword_26A633170;
    uint64_t v197 = v376;
    uint64_t *v376 = v195;
    v197[1] = v196;
    *((unsigned char *)v197 + 16) = 0;
    uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCF0);
    sub_25CF2C054(v107, (uint64_t *)((char *)v197 + *(int *)(v198 + 44)));
    if (*v171)
    {
      id v199 = *v171;
      char v200 = sub_25CF43C88();

      uint64_t v201 = v360;
      sub_25CF2D910(v107, v360);
      v402 = (void *)v193;
      if ((v200 & 1) == 0)
      {
        sub_25CF2DED0(v201);
        goto LABEL_31;
      }
      uint64_t v202 = *(void **)(v201 + *(int *)(v404 + 40));
      if (v202)
      {
        uint64_t v203 = v201;
        id v204 = v202;
        sub_25CF43C98();
        double v206 = v205;

        sub_25CF2DED0(v203);
        if (v206 > 1.0)
        {
          uint64_t v207 = sub_25CF436A8();
          goto LABEL_32;
        }
LABEL_31:
        uint64_t v207 = sub_25CF43688();
LABEL_32:
        uint64_t v211 = v207;
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v214 = v376;
        uint64_t v213 = v377;
        sub_25CEFDAA8((uint64_t)v376, v377, &qword_26A62FC88);
        uint64_t v215 = (uint64_t *)(v213 + *(int *)(v361 + 36));
        *uint64_t v215 = KeyPath;
        v215[1] = v211;
        sub_25CEFDA54((uint64_t)v214, &qword_26A62FC88);
        LOBYTE(v214) = sub_25CF43638();
        unsigned __int8 v216 = sub_25CF43618();
        unsigned __int8 v217 = sub_25CF43628();
        char v218 = sub_25CF43648();
        sub_25CF43648();
        if (sub_25CF43648() != v214) {
          char v218 = sub_25CF43648();
        }
        sub_25CF43648();
        if (sub_25CF43648() != v216) {
          char v218 = sub_25CF43648();
        }
        uint64_t v219 = v400;
        uint64_t v220 = (uint64_t)v364;
        sub_25CF43648();
        if (sub_25CF43648() != v217) {
          char v218 = sub_25CF43648();
        }
        uint64_t v221 = v377;
        uint64_t v222 = v362;
        sub_25CEFDAA8(v377, v362, &qword_26A62FC90);
        uint64_t v223 = v222 + *(int *)(v363 + 36);
        *(unsigned char *)uint64_t v223 = v218;
        *(_OWORD *)(v223 + 8) = 0u;
        *(_OWORD *)(v223 + 24) = 0u;
        *(unsigned char *)(v223 + 40) = 1;
        sub_25CEFDA54(v221, &qword_26A62FC90);
        sub_25CF2E5F4(v222, v378, &qword_26A62FC98);
        swift_retain();
        uint64_t v224 = SiriMailModel.subject.getter();
        unint64_t v226 = v225;
        swift_release();
        swift_bridgeObjectRelease();
        if ((v226 & 0x2000000000000000) != 0) {
          uint64_t v227 = HIBYTE(v226) & 0xF;
        }
        else {
          uint64_t v227 = v224 & 0xFFFFFFFFFFFFLL;
        }
        uint64_t v228 = v368;
        sub_25CF2D910(v107, v368);
        if (v227)
        {
          sub_25CF2DED0(v228);
LABEL_43:
          uint64_t v229 = v369;
          sub_25CF2D910(v107, v369);
LABEL_44:
          sub_25CF2DED0(v229);
          uint64_t v230 = *MEMORY[0x263F70708];
LABEL_45:
          uint64_t v392 = sub_25CF432A8();
          uint64_t v404 = v231;
          sub_25CF43228();
          swift_getKeyPath();
          sub_25CF43238();
          swift_release();
          swift_release();
          long long v389 = *(_OWORD *)v408;
          uint64_t v232 = *(void *)&v408[16];
          uint64_t v233 = v409;
          uint64_t v234 = (unint64_t *)(*(void *)(v107 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
          swift_beginAccess();
          unint64_t v236 = *v234;
          unint64_t v235 = v234[1];
          swift_bridgeObjectRetain();
          uint64_t v237 = sub_25CF432A8();
          *(_OWORD *)v408 = v389;
          *(void *)&v408[16] = v232;
          uint64_t v409 = v233;
          v410 = (void *)v237;
          v411 = v238;
          unint64_t v412 = v236;
          unint64_t v413 = v235;
          uint64_t v239 = (uint64_t)v390;
          sub_25CF430D8();
          uint64_t v240 = (uint64_t)v372;
          v381(v372, v230, v219);
          __swift_storeEnumTagSinglePayload(v240, 0, 1, v219);
          unint64_t v241 = sub_25CF2DFBC();
          uint64_t v242 = v354;
          uint64_t v243 = v391;
          uint64_t v244 = v371;
          sub_25CF438C8();
          sub_25CEFDA54(v240, &qword_26A62FB90);
          sub_25CEFDA54(v239, &qword_26A62FBD0);
          v245 = v410;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();

          *(void *)v408 = &type metadata for BodyTextEditor;
          *(void *)&v408[8] = v243;
          *(void *)&v408[16] = v241;
          uint64_t v409 = v244;
          swift_getOpaqueTypeConformance2();
          uint64_t v246 = (uint64_t)v358;
          uint64_t v247 = v356;
          sub_25CF438A8();
          (*(void (**)(char *, uint64_t))(v355 + 8))(v242, v247);
          uint64_t v248 = v357;
          sub_25CF2E5F4(v246, v357, &qword_26A62FC70);
          swift_retain();
          uint64_t v400 = sub_25CF43218();
          uint64_t v250 = v249;
          uint64_t v401 = sub_25CF432A8();
          uint64_t v406 = v251;
          char v407 = 0;
          sub_25CF439B8();
          char v252 = v408[0];
          uint64_t v253 = *(void *)&v408[8];
          sub_25CEFDAA8(v248, v246, &qword_26A62FC70);
          uint64_t v254 = (uint64_t)v367;
          uint64_t v255 = (void *)v392;
          uint64_t v256 = v404;
          uint64_t *v367 = v392;
          *(void *)(v254 + 8) = v256;
          uint64_t v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD10);
          sub_25CEFDAA8(v246, v254 + *(int *)(v257 + 48), &qword_26A62FC70);
          uint64_t v258 = *(int *)(v257 + 64);
          uint64_t v259 = v396;
          uint64_t v260 = v254 + v258;
          *(void *)uint64_t v260 = v400;
          *(void *)(v260 + 8) = v250;
          uint64_t v261 = (void *)v401;
          uint64_t v262 = v406;
          *(void *)(v260 + 16) = v401;
          *(void *)(v260 + 24) = v262;
          *(unsigned char *)(v260 + 32) = v252;
          *(void *)(v260 + 40) = v253;
          swift_retain();
          id v263 = v255;
          swift_retain();
          id v264 = v261;
          sub_25CEFDA54(v248, &qword_26A62FC70);
          long long v265 = v259;
          swift_release();

          swift_release();
          sub_25CEFDA54(v246, &qword_26A62FC70);

          uint64_t v266 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCF8);
          __swift_storeEnumTagSinglePayload(v254, 0, 1, v266);
          uint64_t v267 = v366;
          sub_25CF2E5F4(v254, v366, &qword_26A62FC80);
LABEL_46:
          uint64_t v268 = v378;
          uint64_t v269 = v365;
          sub_25CEFDAA8(v378, v365, &qword_26A62FC98);
          sub_25CEFDAA8(v267, v254, &qword_26A62FC80);
          uint64_t v270 = v402;
          long long v271 = v397;
          *long long v265 = v402;
          v265[1] = v271;
          uint64_t v272 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD00);
          sub_25CEFDAA8(v269, (uint64_t)v265 + *(int *)(v272 + 48), &qword_26A62FC98);
          sub_25CEFDAA8(v254, (uint64_t)v265 + *(int *)(v272 + 64), &qword_26A62FC80);
          id v273 = v270;
          sub_25CEFDA54(v267, &qword_26A62FC80);
          sub_25CEFDA54(v268, &qword_26A62FC98);

          sub_25CEFDA54(v254, &qword_26A62FC80);
          sub_25CEFDA54(v269, &qword_26A62FC98);

          uint64_t v274 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCE0);
          __swift_storeEnumTagSinglePayload((uint64_t)v265, 0, 1, v274);
          uint64_t v210 = v393;
          sub_25CF2E5F4((uint64_t)v265, v393, &qword_26A62FCA0);
          uint64_t v209 = (uint64_t)v265;
          goto LABEL_47;
        }
        uint64_t v284 = v348;
        sub_25CF430C8();
        uint64_t v285 = (uint64_t)v347;
        v381(v347, *MEMORY[0x263F70710], v219);
        __swift_storeEnumTagSinglePayload(v285, 0, 1, v219);
        uint64_t v286 = v341;
        uint64_t v287 = v341 + *(int *)(v349 + 48);
        sub_25CEFDAA8(v284, v341, &qword_26A62FB90);
        sub_25CEFDAA8(v285, v287, &qword_26A62FB90);
        if (__swift_getEnumTagSinglePayload(v286, 1, v219) == 1)
        {
          sub_25CEFDA54(v285, &qword_26A62FB90);
          sub_25CEFDA54(v284, &qword_26A62FB90);
          sub_25CF2DED0(v228);
          int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v287, 1, v219);
          long long v265 = v396;
          if (EnumTagSinglePayload == 1)
          {
            sub_25CEFDA54(v286, &qword_26A62FB90);
            goto LABEL_43;
          }
        }
        else
        {
          uint64_t v289 = v336;
          sub_25CEFDAA8(v286, v336, &qword_26A62FB90);
          int v290 = __swift_getEnumTagSinglePayload(v287, 1, v219);
          long long v265 = v396;
          if (v290 != 1)
          {
            uint64_t v315 = v286;
            uint64_t v316 = v384;
            v317 = v335;
            (*(void (**)(char *, uint64_t, uint64_t))(v384 + 32))(v335, v287, v219);
            sub_25CF2E700((uint64_t)&unk_26A62FC50);
            char v318 = sub_25CF43D58();
            v319 = *(void (**)(char *, uint64_t))(v316 + 8);
            v319(v317, v400);
            sub_25CEFDA54((uint64_t)v347, &qword_26A62FB90);
            sub_25CEFDA54(v348, &qword_26A62FB90);
            sub_25CF2DED0(v368);
            v319((char *)v289, v400);
            uint64_t v219 = v400;
            uint64_t v291 = v342;
            sub_25CEFDA54(v315, &qword_26A62FB90);
            uint64_t v229 = v369;
            sub_25CF2D910(v107, v369);
            if (v318) {
              goto LABEL_44;
            }
LABEL_54:
            sub_25CF430C8();
            uint64_t v230 = *MEMORY[0x263F70708];
            uint64_t v292 = (uint64_t)v340;
            v381(v340, v230, v219);
            __swift_storeEnumTagSinglePayload(v292, 0, 1, v219);
            uint64_t v293 = v220 + *(int *)(v349 + 48);
            sub_25CEFDAA8(v291, v220, &qword_26A62FB90);
            sub_25CEFDAA8(v292, v293, &qword_26A62FB90);
            if (__swift_getEnumTagSinglePayload(v220, 1, v219) == 1)
            {
              sub_25CEFDA54(v292, &qword_26A62FB90);
              sub_25CEFDA54(v291, &qword_26A62FB90);
              sub_25CF2DED0(v369);
              if (__swift_getEnumTagSinglePayload(v293, 1, v219) == 1)
              {
                sub_25CEFDA54(v220, &qword_26A62FB90);
                goto LABEL_45;
              }
            }
            else
            {
              uint64_t v313 = v334;
              sub_25CEFDAA8(v220, v334, &qword_26A62FB90);
              if (__swift_getEnumTagSinglePayload(v293, 1, v219) != 1)
              {
                uint64_t v320 = v220;
                uint64_t v321 = v384;
                uint64_t v322 = v313;
                v323 = v335;
                (*(void (**)(char *, uint64_t, uint64_t))(v384 + 32))(v335, v293, v219);
                sub_25CF2E700((uint64_t)&unk_26A62FC50);
                char v324 = sub_25CF43D58();
                v325 = *(void (**)(char *, uint64_t))(v321 + 8);
                v325(v323, v400);
                sub_25CEFDA54((uint64_t)v340, &qword_26A62FB90);
                sub_25CEFDA54(v342, &qword_26A62FB90);
                sub_25CF2DED0(v369);
                v325((char *)v322, v400);
                uint64_t v219 = v400;
                sub_25CEFDA54(v320, &qword_26A62FB90);
                if (v324) {
                  goto LABEL_45;
                }
LABEL_62:
                uint64_t v314 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCF8);
                uint64_t v267 = v366;
                __swift_storeEnumTagSinglePayload(v366, 1, 1, v314);
                uint64_t v254 = (uint64_t)v367;
                goto LABEL_46;
              }
              sub_25CEFDA54((uint64_t)v340, &qword_26A62FB90);
              sub_25CEFDA54(v342, &qword_26A62FB90);
              sub_25CF2DED0(v369);
              (*(void (**)(uint64_t, uint64_t))(v384 + 8))(v313, v219);
            }
            sub_25CEFDA54(v220, &qword_26A62FC78);
            goto LABEL_62;
          }
          sub_25CEFDA54((uint64_t)v347, &qword_26A62FB90);
          sub_25CEFDA54(v348, &qword_26A62FB90);
          sub_25CF2DED0(v368);
          (*(void (**)(uint64_t, uint64_t))(v384 + 8))(v289, v219);
        }
        sub_25CEFDA54(v286, &qword_26A62FC78);
        sub_25CF2D910(v107, v369);
        uint64_t v291 = v342;
        goto LABEL_54;
      }
    }
    while (1)
    {
LABEL_67:
      sub_25CF43298();
      __break(1u);
    }
  }
  uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCE0);
  __swift_storeEnumTagSinglePayload(v112, 1, 1, v208);
  uint64_t v209 = (uint64_t)v128;
  uint64_t v210 = v112;
LABEL_47:
  uint64_t v275 = v403;
  sub_25CEFDAA8(v405, v403, &qword_26A62FCC0);
  uint64_t v276 = v398;
  v277 = v388;
  sub_25CEFDAA8(v398, (uint64_t)v388, &qword_26A62FCA8);
  uint64_t v278 = v399;
  uint64_t v279 = v379;
  sub_25CEFDAA8(v399, v379, &qword_26A62FCA8);
  sub_25CEFDAA8(v210, v209, &qword_26A62FCA0);
  uint64_t v280 = v380;
  sub_25CEFDAA8(v275, v380, &qword_26A62FCC0);
  uint64_t v281 = v210;
  v282 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FCE8);
  sub_25CEFDAA8((uint64_t)v277, v280 + v282[12], &qword_26A62FCA8);
  sub_25CEFDAA8(v279, v280 + v282[16], &qword_26A62FCA8);
  sub_25CEFDAA8(v209, v280 + v282[20], &qword_26A62FCA0);
  sub_25CEFDA54(v281, &qword_26A62FCA0);
  sub_25CEFDA54(v278, &qword_26A62FCA8);
  sub_25CEFDA54(v276, &qword_26A62FCA8);
  sub_25CEFDA54(v405, &qword_26A62FCC0);
  sub_25CEFDA54(v209, &qword_26A62FCA0);
  sub_25CEFDA54(v279, &qword_26A62FCA8);
  sub_25CEFDA54((uint64_t)v277, &qword_26A62FCA8);
  return sub_25CEFDA54(v403, &qword_26A62FCC0);
}

uint64_t sub_25CF2C054@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  MEMORY[0x270FA5388](v89);
  uint64_t v78 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v75 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_25CF43538();
  uint64_t v73 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62EDA8);
  uint64_t v71 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD30);
  uint64_t v77 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v68 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD38);
  uint64_t v83 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v74 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD40);
  uint64_t v86 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v67 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD48);
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD50);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  unint64_t v90 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v88 = (uint64_t)&v66 - v17;
  uint64_t v66 = a1;
  uint64_t v18 = (uint64_t *)(*(void *)(a1 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
  swift_beginAccess();
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  *(void *)&long long v96 = v19;
  *((void *)&v96 + 1) = v20;
  sub_25CEFDB04();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25CF437D8();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  LODWORD(v96) = sub_25CF43548();
  uint64_t v81 = sub_25CF437A8();
  uint64_t v80 = v26;
  int v69 = v27;
  uint64_t v82 = v28;
  sub_25CF0F360(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_25CF434A8();
  type metadata accessor for SiriMailModel();
  sub_25CF2E700((uint64_t)&unk_26A62FC10);
  sub_25CF43228();
  swift_getKeyPath();
  sub_25CF43238();
  swift_release();
  swift_release();
  sub_25CF43AE8();
  sub_25CF43528();
  unint64_t v29 = sub_25CF2E020((uint64_t)&qword_26A62EDA0);
  unint64_t v30 = sub_25CF2E700((uint64_t)&unk_26A62FD58);
  uint64_t v31 = v68;
  uint64_t v32 = v70;
  uint64_t v33 = v72;
  sub_25CF43898();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v7, v33);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v9, v32);
  type metadata accessor for SceneClientView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  uint64_t v34 = (uint64_t)v75;
  sub_25CF430D8();
  uint64_t v35 = *MEMORY[0x263F70710];
  uint64_t v36 = sub_25CF42DF8();
  uint64_t v37 = (uint64_t)v78;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v78, v35, v36);
  __swift_storeEnumTagSinglePayload(v37, 0, 1, v36);
  *(void *)&long long v96 = v32;
  *((void *)&v96 + 1) = v33;
  *(void *)&long long v97 = v29;
  *((void *)&v97 + 1) = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v39 = sub_25CF2DB58((uint64_t)&unk_26A62FBB8);
  uint64_t v40 = v74;
  uint64_t v41 = v76;
  uint64_t v42 = v89;
  sub_25CF438C8();
  sub_25CEFDA54(v37, &qword_26A62FB90);
  sub_25CEFDA54(v34, &qword_26A62FBD0);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v31, v41);
  uint64_t v98 = 0;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v92 = v41;
  uint64_t v93 = v42;
  uint64_t v94 = OpaqueTypeConformance2;
  unint64_t v95 = v39;
  swift_getOpaqueTypeConformance2();
  uint64_t v43 = v67;
  uint64_t v44 = v79;
  sub_25CF43828();
  sub_25CEFDA54((uint64_t)&v96, &qword_26A62EDC0);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v40, v44);
  char v45 = sub_25CF43668();
  if (qword_26A62ED08 != -1) {
    swift_once();
  }
  char v46 = v69 & 1;
  sub_25CF430B8();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v55 = v86;
  uint64_t v56 = (uint64_t)v84;
  uint64_t v57 = v87;
  (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v84, v43, v87);
  uint64_t v58 = v56 + *(int *)(v85 + 36);
  *(unsigned char *)uint64_t v58 = v45;
  *(void *)(v58 + 8) = v48;
  *(void *)(v58 + 16) = v50;
  *(void *)(v58 + 24) = v52;
  *(void *)(v58 + 32) = v54;
  *(unsigned char *)(v58 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v43, v57);
  sub_25CF2E060();
  uint64_t v59 = (uint64_t)v90;
  sub_25CF438A8();
  sub_25CEFDA54(v56, &qword_26A62FD48);
  uint64_t v60 = v88;
  sub_25CF2E5F4(v59, v88, &qword_26A62FD50);
  sub_25CEFDAA8(v60, v59, &qword_26A62FD50);
  uint64_t v61 = v91;
  uint64_t v62 = v81;
  uint64_t v63 = v80;
  *uint64_t v91 = v81;
  v61[1] = v63;
  *((unsigned char *)v61 + 16) = v46;
  v61[3] = v82;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD68);
  sub_25CEFDAA8(v59, (uint64_t)v61 + *(int *)(v64 + 48), &qword_26A62FD50);
  sub_25CF11FC8(v62, v63, v46);
  swift_bridgeObjectRetain();
  sub_25CEFDA54(v60, &qword_26A62FD50);
  sub_25CEFDA54(v59, &qword_26A62FD50);
  sub_25CF0F360(v62, v63, v46);
  return swift_bridgeObjectRelease();
}

void sub_25CF2CB5C()
{
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25CF43058();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  oslog = sub_25CF43038();
  os_log_type_t v1 = sub_25CF43E28();
  if (os_log_type_enabled(oslog, v1))
  {
    char v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v2 = 0;
    _os_log_impl(&dword_25CEFA000, oslog, v1, "View did appear", v2, 2u);
    MEMORY[0x2611A3230](v2, -1, -1);
  }
}

void sub_25CF2CC44(uint64_t a1)
{
  uint64_t v2 = sub_25CF42F68();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25CF42E08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))((char *)&v29 - v13, *MEMORY[0x263F70738], v8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  char v15 = sub_25CF2F114();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v16(v14, v8);
  if (v15)
  {
    uint64_t v17 = type metadata accessor for SceneClientView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
    sub_25CF430C8();
    uint64_t v18 = sub_25CF42DF8();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v18);
    sub_25CEFDA54((uint64_t)v7, &qword_26A62FB90);
    if (EnumTagSinglePayload == 1)
    {
      uint64_t v20 = *(void *)(a1 + 72);
      char v32 = *(unsigned char *)(a1 + 64);
      uint64_t v33 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
      sub_25CF439C8();
      if (v34 == 1)
      {
        if (qword_26A62ED30 != -1) {
          swift_once();
        }
        uint64_t v21 = sub_25CF43058();
        __swift_project_value_buffer(v21, (uint64_t)static Logger.siriMail);
        uint64_t v22 = sub_25CF43038();
        os_log_type_t v23 = sub_25CF43E28();
        if (os_log_type_enabled(v22, v23))
        {
          char v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v24 = 0;
          _os_log_impl(&dword_25CEFA000, v22, v23, "Got nil focus field, sending .returnedToVoiceMode Direct Invocation", v24, 2u);
          MEMORY[0x2611A3230](v24, -1, -1);
        }

        uint64_t v26 = v30;
        uint64_t v25 = v31;
        (*(void (**)(char *, void, uint64_t))(v30 + 104))(v4, *MEMORY[0x263F3B518], v31);
        sub_25CF42F58();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v25);
        int v27 = *(void **)(a1 + *(int *)(v17 + 40));
        if (v27)
        {
          id v28 = v27;
          sub_25CF43D08();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_25CF43D18();
          sub_25CF2E700((uint64_t)&qword_26A62FA10);
          sub_25CF43298();
          __break(1u);
        }
      }
    }
  }
}

uint64_t sub_25CF2D0D4()
{
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25CF43058();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  os_log_type_t v1 = sub_25CF43038();
  os_log_type_t v2 = sub_25CF43E28();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25CEFA000, v1, v2, "View will disappear", v3, 2u);
    MEMORY[0x2611A3230](v3, -1, -1);
  }

  type metadata accessor for SiriMailModel();
  sub_25CF2E700((uint64_t)&unk_26A62FC60);
  swift_retain();
  sub_25CF42F98();
  return swift_release();
}

uint64_t sub_25CF2D3E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25CF43A78();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F448);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  sub_25CF43A68();
  if (a1)
  {
    id v16 = a1;
    char v17 = sub_25CF43C88();

    if (v17) {
      char v18 = sub_25CF43658();
    }
    else {
      char v18 = sub_25CF43638();
    }
    char v19 = v18;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v15, v10, v4);
    uint64_t v20 = v15 + *(int *)(v11 + 36);
    *(unsigned char *)uint64_t v20 = v19;
    *(_OWORD *)(v20 + 8) = 0u;
    *(_OWORD *)(v20 + 24) = 0u;
    *(unsigned char *)(v20 + 40) = 1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
    return sub_25CF2E5F4(v15, a2, &qword_26A62F448);
  }
  else
  {
    sub_25CF43D18();
    sub_25CF2E700((uint64_t)&qword_26A62FA10);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CF2D5A8@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF2D3E4(*v1, a1);
}

uint64_t sub_25CF2D5BC()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD8) + 32);
  sub_25CF42DF8();
  if (!OUTLINED_FUNCTION_9_3(v5))
  {
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_12_3();
    v6();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF2D6C4(uint64_t a1)
{
  return sub_25CF2D8B4(a1, &qword_26A62FBD0, MEMORY[0x263F183E0]);
}

uint64_t sub_25CF2D6E4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  sub_25CEFDAA8(a1, v9 - v8, &qword_26A62FB90);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a3);
  return a4(v10, v11);
}

uint64_t sub_25CF2D794()
{
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FBD8) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[10];
  sub_25CF42DF8();
  if (!OUTLINED_FUNCTION_9_3(v5))
  {
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_12_3();
    v6();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF2D894(uint64_t a1)
{
  return sub_25CF2D8B4(a1, &qword_26A62FBD8, MEMORY[0x263F1B738]);
}

uint64_t sub_25CF2D8B4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_0(v7);
  return sub_25CF2D6E4(a1, v3 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), a2, a3);
}

uint64_t sub_25CF2D910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SceneClientView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF2D978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SceneClientView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF2D9DC()
{
  return sub_25CF2DDF4((uint64_t (*)(uint64_t))sub_25CF2CC44);
}

unint64_t sub_25CF2D9F4()
{
  unint64_t result = qword_26A62FC28;
  if (!qword_26A62FC28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FBE8);
    sub_25CF2DA94();
    sub_25CF2E020((uint64_t)&unk_26A62FC40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FC28);
  }
  return result;
}

unint64_t sub_25CF2DA94()
{
  unint64_t result = qword_26A62FC30;
  if (!qword_26A62FC30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FBC8);
    sub_25CF2E020((uint64_t)&unk_26A62FC38);
    sub_25CF2E020((uint64_t)&unk_26A62FC40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FC30);
  }
  return result;
}

unint64_t sub_25CF2DB58(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_10_3(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FB90);
    sub_25CF2E700(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v1 = (int *)type metadata accessor for SceneClientView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[9];
  sub_25CF42DF8();
  if (!OUTLINED_FUNCTION_9_3(v6))
  {
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_12_3();
    v7();
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB98);
  swift_release();
  if (!OUTLINED_FUNCTION_9_3(v6 + *(int *)(v8 + 40)))
  {
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_12_3();
    v9();
  }

  uint64_t v10 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25CF43138();
    OUTLINED_FUNCTION_2();
    (*(void (**)(uint64_t))(v11 + 8))(v10);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF2DDDC()
{
  return sub_25CF2DDF4((uint64_t (*)(uint64_t))sub_25CF2D0D4);
}

uint64_t sub_25CF2DDF4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SceneClientView();
  OUTLINED_FUNCTION_0_0(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

unint64_t sub_25CF2DE58(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_10_3(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25CF2DED0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SceneClientView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF2DF2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25CF433B8();
  *a1 = result;
  return result;
}

uint64_t sub_25CF2DF58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25CF433B8();
  *a1 = result;
  return result;
}

uint64_t sub_25CF2DF84()
{
  return sub_25CF433C8();
}

unint64_t sub_25CF2DFBC()
{
  unint64_t result = qword_26A62FD08;
  if (!qword_26A62FD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FD08);
  }
  return result;
}

unint64_t sub_25CF2E020(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_10_3(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25CF2E060()
{
  unint64_t result = qword_26A62FD60;
  if (!qword_26A62FD60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FD48);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FD38);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FD30);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FB90);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62EDA8);
    sub_25CF43538();
    sub_25CF2E020((uint64_t)&qword_26A62EDA0);
    sub_25CF2E700((uint64_t)&unk_26A62FD58);
    swift_getOpaqueTypeConformance2();
    sub_25CF2DB58((uint64_t)&unk_26A62FBB8);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FD60);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SceneClientView.SendMessageDivider(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for SceneClientView.SendMessageDivider(id *a1)
{
}

uint64_t assignWithCopy for SceneClientView.SendMessageDivider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for SceneClientView.SendMessageDivider(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneClientView.SendMessageDivider(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SceneClientView.SendMessageDivider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneClientView.SendMessageDivider()
{
  return &type metadata for SceneClientView.SendMessageDivider;
}

unint64_t sub_25CF2E3D4()
{
  unint64_t result = qword_26A62FD70;
  if (!qword_26A62FD70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FC58);
    sub_25CF2E450();
    sub_25CF2E58C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FD70);
  }
  return result;
}

unint64_t sub_25CF2E450()
{
  unint64_t result = qword_26A62FD78;
  if (!qword_26A62FD78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FC00);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FBF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FB90);
    sub_25CF2DE58((uint64_t)&unk_26A62FC20);
    sub_25CF2DB58((uint64_t)&qword_26A62FC48);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FD78);
  }
  return result;
}

unint64_t sub_25CF2E58C()
{
  unint64_t result = qword_26A62FD80;
  if (!qword_26A62FD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FD80);
  }
  return result;
}

uint64_t sub_25CF2E5D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF2E5F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_25CF2E654()
{
  unint64_t result = qword_26A62FD88;
  if (!qword_26A62FD88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62F448);
    sub_25CF2E700((uint64_t)&unk_26A62FD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FD88);
  }
  return result;
}

unint64_t sub_25CF2E700(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_10_3(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_25CF439B8();
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_25CF2E7B0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v9 = (void *)a2[2];
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = v9;
    *(void *)(a1 + 24) = v8;
    uint64_t v10 = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    *(void *)(a1 + 32) = v10;
    swift_retain();
    id v14 = v9;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = *(int *)(a3 + 32);
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
    *(void *)(v18 + 8) = *(void *)(v19 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_25CF2E920(uint64_t a1, uint64_t a2)
{
  swift_release();

  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25CF43138();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_25CF2E9EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v8 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v7;
  uint64_t v9 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *(void *)(a1 + 32) = v9;
  swift_retain();
  id v13 = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_25CF43138();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
  }
  else
  {
    *uint64_t v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(unsigned char *)uint64_t v16 = *(unsigned char *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_25CF2EB10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v7 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v7;
  id v8 = v7;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  char v9 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_25CF219F0(a1 + v10, &qword_26A62ED50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_25CF43138();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25CF2EC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 28);
  id v8 = (void *)(a1 + v7);
  char v9 = (const void *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25CF43138();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_25CF2ED7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_release();
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  char v8 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v8;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (const void *)(a2 + v9);
    sub_25CF219F0(a1 + v9, &qword_26A62ED50);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_25CF43138();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_release();
  return a1;
}

uint64_t sub_25CF2EECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF2EEE0);
}

uint64_t sub_25CF2EEE0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25CF2EF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF2EF80);
}

uint64_t sub_25CF2EF80(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F230);
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SceneHostView()
{
  uint64_t result = qword_26A62FD98;
  if (!qword_26A62FD98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25CF2F04C()
{
  sub_25CF0EF9C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25CF2F0F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF2F114()
{
  sub_25CF42E08();
  sub_25CF32E08(&qword_26A62FDF8, MEMORY[0x263F70758]);
  sub_25CF43DC8();
  sub_25CF43DC8();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_25CF44148();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_25CF2F1F8@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF2F26C(&qword_26A62ED50, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_25CF2F234@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF2F26C(&qword_26A62F5E0, MEMORY[0x263F19A00], 0xD000000000000013, 0x800000025CF4F0A0, a1);
}

uint64_t sub_25CF2F26C@<X0>(uint64_t *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = v5;
  uint64_t v11 = sub_25CF43428();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v17 = v16 - v15;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1();
  uint64_t v21 = v20 - v19;
  sub_25CEFDAA8(v9, v20 - v19, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    a2(0);
    OUTLINED_FUNCTION_2();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(a5, v21);
  }
  else
  {
    os_log_type_t v24 = sub_25CF43E48();
    uint64_t v25 = sub_25CF435E8();
    if (os_log_type_enabled(v25, v24))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v29 = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      sub_25CF34D98(a3, a4, &v29);
      sub_25CF43EB8();
      _os_log_impl(&dword_25CEFA000, v25, v24, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A3230](v27, -1, -1);
      MEMORY[0x2611A3230](v26, -1, -1);
    }

    sub_25CF43418();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  }
}

uint64_t sub_25CF2F4DC(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25CF43428();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_25CF43E48();
    uint64_t v9 = sub_25CF435E8();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v14 = sub_25CF34D98(0xD000000000000015, 0x800000025CF4F080, &v15);
      sub_25CF43EB8();
      _os_log_impl(&dword_25CEFA000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A3230](v12, -1, -1);
      MEMORY[0x2611A3230](v11, -1, -1);
    }

    sub_25CF43418();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_25CF2F6E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SceneHostView();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = &v21[-v8];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v21[-v10];
  uint64_t v12 = *(void *)(v0 + 8);
  swift_retain();
  SiriMailModel.subject.getter();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_4();
  sub_25CF32AA0(v1, (uint64_t)v11);
  if (!v12)
  {
    sub_25CF333C8((uint64_t)v11);
    sub_25CF32AA0(v1, (uint64_t)v9);
    goto LABEL_6;
  }
  uint64_t v13 = *((void *)v11 + 1);
  swift_retain();
  SiriMailModel.body.getter();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_4();
  sub_25CF333C8((uint64_t)v11);
  sub_25CF32AA0(v1, (uint64_t)v9);
  if (!v13)
  {
LABEL_6:
    sub_25CF333C8((uint64_t)v9);
    sub_25CF32AA0(v1, (uint64_t)v6);
    goto LABEL_7;
  }
  swift_retain();
  uint64_t v14 = SiriMailModel.to.getter();
  swift_release();
  uint64_t v15 = *(void *)(v14 + 16);
  swift_bridgeObjectRelease();
  sub_25CF333C8((uint64_t)v9);
  sub_25CF32AA0(v1, (uint64_t)v6);
  if (!v15)
  {
LABEL_7:
    uint64_t v19 = 1;
    goto LABEL_8;
  }
  uint64_t v16 = &v6[*(int *)(v2 + 32)];
  char v17 = *v16;
  uint64_t v18 = *((void *)v16 + 1);
  v21[8] = v17;
  uint64_t v22 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
  sub_25CF439C8();
  uint64_t v19 = v23;
LABEL_8:
  sub_25CF333C8((uint64_t)v6);
  return v19;
}

uint64_t sub_25CF2F8D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v75 = a1;
  sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  uint64_t v79 = v2;
  uint64_t v80 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v74 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v70 = (char *)&v58 - v6;
  uint64_t v66 = (void (*)(void, void))__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_3();
  uint64_t v64 = v8;
  uint64_t v9 = type metadata accessor for SceneHostView();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDA8);
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDB0);
  uint64_t v62 = v17;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1_3();
  uint64_t v19 = v18;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDB8);
  OUTLINED_FUNCTION_0();
  uint64_t v71 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_3();
  uint64_t v78 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDC0);
  OUTLINED_FUNCTION_0();
  uint64_t v72 = v24;
  uint64_t v73 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_1_3();
  uint64_t v65 = v25;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDC8) - 8;
  MEMORY[0x270FA5388](v69);
  OUTLINED_FUNCTION_1_3();
  uint64_t v67 = v26;
  *(void *)uint64_t v16 = sub_25CF434E8();
  *(void *)(v16 + 8) = 0;
  *(unsigned char *)(v16 + 16) = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDD0);
  sub_25CF300C8(v1, v16 + *(int *)(v27 + 44));
  sub_25CF32AA0(v1, (uint64_t)v12);
  uint64_t v28 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v29 = ((v28 + 16) & ~v28) + v11;
  uint64_t v30 = (v28 + 16) & ~v28;
  uint64_t v31 = v28 | 7;
  uint64_t v76 = v29;
  uint64_t v32 = swift_allocObject();
  uint64_t v77 = v30;
  sub_25CF32B08((uint64_t)v12, v32 + v30);
  uint64_t v63 = v19;
  sub_25CEFDAA8(v16, v19, &qword_26A62FDA8);
  uint64_t v33 = (uint64_t (**)())(v19 + *(int *)(v17 + 36));
  *uint64_t v33 = sub_25CF32B6C;
  v33[1] = (uint64_t (*)())v32;
  v33[2] = 0;
  v33[3] = 0;
  sub_25CF219F0(v16, &qword_26A62FDA8);
  uint64_t v34 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v35 = v64;
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v36 = (uint64_t)v12;
  sub_25CF32AA0(v1, (uint64_t)v12);
  uint64_t v61 = v31;
  uint64_t v37 = swift_allocObject();
  sub_25CF32B08((uint64_t)v12, v37 + v30);
  unint64_t v59 = sub_25CF32BA8();
  unint64_t v38 = sub_25CF32C48();
  uint64_t v39 = v62;
  uint64_t v40 = v66;
  uint64_t v41 = v63;
  sub_25CF438D8();
  swift_release();
  sub_25CF219F0(v35, &qword_26A62FB90);
  sub_25CF219F0(v41, &qword_26A62FDB0);
  uint64_t v60 = v34;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v42 = v70;
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  sub_25CF32AA0(v34, v36);
  uint64_t v43 = swift_allocObject();
  sub_25CF32B08(v36, v43 + v77);
  uint64_t v81 = v39;
  uint64_t v82 = v40;
  unint64_t v83 = v59;
  unint64_t v84 = v38;
  swift_getOpaqueTypeConformance2();
  sub_25CF32E08(&qword_26A62FDE8, MEMORY[0x263F70758]);
  uint64_t v44 = v65;
  uint64_t v45 = v79;
  sub_25CF438D8();
  swift_release();
  uint64_t v66 = *(void (**)(void, void))(v80 + 8);
  char v46 = v42;
  v66(v42, v45);
  OUTLINED_FUNCTION_2_3();
  v47();
  sub_25CF32AA0(v60, v36);
  uint64_t v48 = swift_allocObject();
  sub_25CF32B08(v36, v48 + v77);
  uint64_t v49 = v67;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v67, v44, v73);
  uint64_t v50 = (void *)(v49 + *(int *)(v69 + 44));
  *uint64_t v50 = 0;
  v50[1] = 0;
  v50[2] = sub_25CF32D88;
  v50[3] = v48;
  OUTLINED_FUNCTION_2_3();
  v51();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v52 = v79;
  uint64_t v53 = v74;
  (*(void (**)(char *, void, uint64_t))(v80 + 104))(v74, *MEMORY[0x263F70738], v79);
  LOBYTE(v48) = sub_25CF2F114();
  uint64_t v54 = v53;
  uint64_t v55 = (void (*)(char *, uint64_t))v66;
  v66(v54, v52);
  v55(v46, v52);
  uint64_t v56 = v75;
  sub_25CEFDAA8(v49, v75, &qword_26A62FDC8);
  *(unsigned char *)(v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A62FDF0) + 36)) = v48 & 1;
  return sub_25CF219F0(v49, &qword_26A62FDC8);
}

uint64_t sub_25CF300C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v99 = a2;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE18);
  MEMORY[0x270FA5388](v87);
  uint64_t v85 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_25CF43BF8();
  uint64_t v80 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v81 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_25CF43C18();
  uint64_t v84 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  unint64_t v83 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25CF42E08();
  uint64_t v91 = *(void *)(v6 - 8);
  uint64_t v92 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v79 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v90 = (char *)&v77 - v9;
  uint64_t v89 = sub_25CF42EF8();
  uint64_t v103 = *(void *)(v89 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v89);
  uint64_t v78 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v88 = (char *)&v77 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE20);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v93 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v96 = (uint64_t)&v77 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE28);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE30);
  uint64_t v97 = *(void *)(v18 - 8);
  uint64_t v98 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  unint64_t v95 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v77 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE38);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE40);
  uint64_t v27 = v26 - 8;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v102 = (uint64_t)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v77 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v77 - v33;
  *(void *)uint64_t v25 = sub_25CF43448();
  *((void *)v25 + 1) = 0;
  v25[16] = 1;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE48);
  sub_25CF30CF4(a1, &v25[*(int *)(v35 + 44)]);
  char v36 = sub_25CF43608();
  sub_25CEFDAA8((uint64_t)v25, (uint64_t)v32, &qword_26A62FE38);
  uint64_t v37 = &v32[*(int *)(v27 + 44)];
  *uint64_t v37 = v36;
  *(_OWORD *)(v37 + 8) = 0u;
  *(_OWORD *)(v37 + 24) = 0u;
  v37[40] = 1;
  sub_25CF219F0((uint64_t)v25, &qword_26A62FE38);
  uint64_t v101 = v34;
  sub_25CF2E5F4((uint64_t)v32, (uint64_t)v34, &qword_26A62FE40);
  type metadata accessor for SiriMailModel();
  sub_25CF32E08(&qword_26A62FC10, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF43228();
  swift_getKeyPath();
  sub_25CF43238();
  swift_release();
  swift_release();
  unint64_t v38 = (void (*)(uint64_t))MEMORY[0x263F707B0];
  sub_25CF32E08(&qword_26A62F100, MEMORY[0x263F707B0]);
  sub_25CF32E08(&qword_26A62F0A8, v38);
  sub_25CF32E08(&qword_26A62FE50, v38);
  uint64_t v94 = v22;
  uint64_t v39 = v89;
  sub_25CF42CD8();
  uint64_t v100 = a1;
  swift_retain();
  uint64_t v40 = v88;
  sub_25CF36F38();
  swift_release();
  uint64_t v41 = v90;
  sub_25CF42E18();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v103 + 8);
  uint64_t v43 = v39;
  v103 += 8;
  v42(v40, v39);
  uint64_t v44 = v91;
  uint64_t v45 = v92;
  char v46 = *(uint64_t (**)(char *, uint64_t))(v91 + 88);
  LODWORD(v40) = v46(v41, v92);
  int v47 = *MEMORY[0x263F70730];
  uint64_t v48 = *(void (**)(char *, uint64_t))(v44 + 8);
  v48(v41, v45);
  if (v40 == v47)
  {
    uint64_t v49 = (uint64_t *)(*(void *)(v100 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
    swift_beginAccess();
    uint64_t v50 = *v49;
    uint64_t v51 = v49[1];
    uint64_t v106 = MEMORY[0x263F8D310];
    uint64_t v107 = MEMORY[0x263F77998];
    uint64_t v104 = v50;
    uint64_t v105 = v51;
    (*(void (**)(char *, void, uint64_t))(v80 + 104))(v81, *MEMORY[0x263F77780], v82);
    swift_bridgeObjectRetain();
    uint64_t v52 = v83;
    sub_25CF43C08();
    uint64_t v53 = v84;
    uint64_t v54 = v86;
    (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v85, v52, v86);
  }
  else
  {
    swift_retain();
    uint64_t v55 = v78;
    sub_25CF36F38();
    swift_release();
    uint64_t v56 = v79;
    sub_25CF42E18();
    v42(v55, v43);
    LODWORD(v55) = v46(v56, v45);
    int v57 = *MEMORY[0x263F70750];
    v48(v56, v45);
    if (v55 != v57)
    {
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE58);
      uint64_t v63 = v96;
      __swift_storeEnumTagSinglePayload(v96, 1, 1, v64);
      uint64_t v61 = (uint64_t)v93;
      goto LABEL_7;
    }
    uint64_t v58 = (uint64_t *)(*(void *)(v100 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
    swift_beginAccess();
    uint64_t v59 = *v58;
    uint64_t v60 = v58[1];
    uint64_t v106 = MEMORY[0x263F8D310];
    uint64_t v107 = MEMORY[0x263F77998];
    uint64_t v104 = v59;
    uint64_t v105 = v60;
    (*(void (**)(char *, void, uint64_t))(v80 + 104))(v81, *MEMORY[0x263F77790], v82);
    swift_bridgeObjectRetain();
    uint64_t v52 = v83;
    sub_25CF43C08();
    uint64_t v53 = v84;
    uint64_t v54 = v86;
    (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v85, v52, v86);
  }
  swift_storeEnumTagMultiPayload();
  sub_25CF32E08(&qword_26A62F590, MEMORY[0x263F77798]);
  uint64_t v61 = (uint64_t)v93;
  sub_25CF43518();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE58);
  __swift_storeEnumTagSinglePayload(v61, 0, 1, v62);
  uint64_t v63 = v96;
  sub_25CF2E5F4(v61, v96, &qword_26A62FE20);
LABEL_7:
  uint64_t v65 = v102;
  sub_25CEFDAA8((uint64_t)v101, v102, &qword_26A62FE40);
  uint64_t v67 = v97;
  uint64_t v66 = v98;
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v97 + 16);
  uint64_t v70 = v94;
  uint64_t v69 = v95;
  v68(v95, v94, v98);
  sub_25CEFDAA8(v63, v61, &qword_26A62FE20);
  uint64_t v71 = v61;
  uint64_t v72 = v99;
  sub_25CEFDAA8(v65, v99, &qword_26A62FE40);
  uint64_t v73 = v63;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE60);
  v68((char *)(v72 + *(int *)(v74 + 48)), v69, v66);
  sub_25CEFDAA8(v71, v72 + *(int *)(v74 + 64), &qword_26A62FE20);
  sub_25CF219F0(v73, &qword_26A62FE20);
  uint64_t v75 = *(void (**)(char *, uint64_t))(v67 + 8);
  v75(v70, v66);
  sub_25CF219F0((uint64_t)v101, &qword_26A62FE40);
  sub_25CF219F0(v71, &qword_26A62FE20);
  v75(v69, v66);
  return sub_25CF219F0(v102, &qword_26A62FE40);
}

uint64_t sub_25CF30CF4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE68);
  uint64_t v52 = *(void *)(v3 - 8);
  uint64_t v53 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v48 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE70) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v50);
  uint64_t v49 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v51 = (uint64_t)&v43 - v7;
  uint64_t v8 = type metadata accessor for SceneHostView();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE78);
  MEMORY[0x270FA5388](v46);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE80);
  uint64_t v44 = *(void *)(v14 - 8);
  uint64_t v45 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v43 - v18;
  int v47 = (char *)&v43 - v18;
  *(void *)uint64_t v13 = sub_25CF434D8();
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE88);
  sub_25CF312AC(a1, (uint64_t)&v13[*(int *)(v20 + 44)]);
  sub_25CF32AA0(a1, (uint64_t)v11);
  unint64_t v21 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v22 = swift_allocObject();
  sub_25CF32B08((uint64_t)v11, v22 + v21);
  sub_25CEFDA10(&qword_26A62FE90, &qword_26A62FE78);
  sub_25CF43878();
  swift_release();
  sub_25CF219F0((uint64_t)v13, &qword_26A62FE78);
  uint64_t v23 = v44;
  uint64_t v24 = v19;
  uint64_t v25 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v24, v17, v45);
  sub_25CF32AA0(a1, (uint64_t)v11);
  uint64_t v26 = swift_allocObject();
  sub_25CF32B08((uint64_t)v11, v26 + v21);
  uint64_t v55 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FE98);
  sub_25CF33024();
  uint64_t v27 = v48;
  sub_25CF439F8();
  char v28 = sub_25CF2F6E4();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = v28 & 1;
  uint64_t v32 = v52;
  uint64_t v31 = v53;
  uint64_t v33 = (uint64_t)v49;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v49, v27, v53);
  uint64_t v34 = (uint64_t *)(v33 + *(int *)(v50 + 44));
  uint64_t *v34 = KeyPath;
  v34[1] = (uint64_t)sub_25CF333B0;
  v34[2] = v30;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v27, v31);
  uint64_t v35 = v51;
  sub_25CF2E5F4(v33, v51, &qword_26A62FE70);
  char v36 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  uint64_t v37 = v47;
  v36(v17, v47, v25);
  sub_25CEFDAA8(v35, v33, &qword_26A62FE70);
  unint64_t v38 = v54;
  v36(v54, v17, v25);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FF08);
  uint64_t v40 = &v38[*(int *)(v39 + 48)];
  *(void *)uint64_t v40 = 0;
  v40[8] = 1;
  sub_25CEFDAA8(v33, (uint64_t)&v38[*(int *)(v39 + 64)], &qword_26A62FE70);
  sub_25CF219F0(v35, &qword_26A62FE70);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v23 + 8);
  v41(v37, v25);
  sub_25CF219F0(v33, &qword_26A62FE70);
  return ((uint64_t (*)(char *, uint64_t))v41)(v17, v25);
}

uint64_t sub_25CF312AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FF10);
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 8);
  swift_retain();
  uint64_t v7 = SiriMailModel.subject.getter();
  unint64_t v9 = v8;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
  {
    swift_retain();
    uint64_t v11 = SiriMailModel.subject.getter();
    uint64_t v13 = v12;
    swift_release();
  }
  else
  {
    uint64_t v11 = *(void *)(v6 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_newMessageLabel);
    uint64_t v13 = *(void *)(v6 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_newMessageLabel + 8);
    swift_bridgeObjectRetain();
  }
  uint64_t v33 = v11;
  uint64_t v34 = v13;
  sub_25CEFDB04();
  uint64_t v14 = sub_25CF437D8();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_25CF43678();
  uint64_t v19 = sub_25CF437B8();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_25CF0F360(v14, v16, v18);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = swift_getKeyPath();
  uint64_t v33 = v19;
  uint64_t v34 = v21;
  char v35 = v23 & 1;
  uint64_t v36 = v25;
  uint64_t v37 = KeyPath;
  uint64_t v38 = 0x3FE0000000000000;
  uint64_t v39 = v27;
  uint64_t v40 = 2;
  char v41 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FF18);
  sub_25CF33480();
  sub_25CF438B8();
  sub_25CF0F360(v19, v21, v23 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(v32, v5, v31);
}

uint64_t sub_25CF31514(uint64_t a1)
{
  uint64_t v2 = sub_25CF42B58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(a1 + 16);
  if (v6)
  {
    id v7 = v6;
    sub_25CF42B48();
    sub_25CF43CF8();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_25CF43D18();
    sub_25CF32E08((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

void sub_25CF31678(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 40);
  uint64_t v3 = swift_retain();
  sub_25CF2F4DC(v3, v2);
  swift_release();
  uint64_t v4 = sub_25CF42F08();
  v15[3] = v4;
  uint64_t v5 = (void (*)(uint64_t))MEMORY[0x263F707D8];
  v15[4] = sub_25CF32E08(&qword_26A62FE00, MEMORY[0x263F707D8]);
  v15[5] = sub_25CF32E08(&qword_26A62FE08, v5);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v4 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F707D0], v4);
  sub_25CF42CE8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  id v7 = *(void **)(a1 + 16);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = (void *)sub_25CF42BB8();
    id v10 = objc_msgSend(v9, sel_identifier);

    sub_25CF43D88();
    sub_25CF43D38();
    sub_25CF43D08();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = (char *)(a1 + *(int *)(type metadata accessor for SceneHostView() + 32));
    char v12 = *v11;
    uint64_t v13 = *((void *)v11 + 1);
    LOBYTE(v15[0]) = v12;
    v15[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
    sub_25CF439D8();
    id v14 = objc_msgSend(self, sel_sharedApplication);
    objc_msgSend(v14, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);
  }
  else
  {
    sub_25CF43D18();
    sub_25CF32E08((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    sub_25CF43298();
    __break(1u);
  }
}

uint64_t sub_25CF31920@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25CF43978();
  char v3 = sub_25CF43608();
  sub_25CF430B8();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_25CF43948();
  if (sub_25CF2F6E4()) {
    uint64_t v13 = sub_25CF43918();
  }
  else {
    uint64_t v13 = sub_25CF43908();
  }
  uint64_t v14 = v13;
  uint64_t result = sub_25CF43608();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v11;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v14;
  *(unsigned char *)(a1 + 72) = result;
  *(_WORD *)(a1 + 73) = 256;
  return result;
}

uint64_t sub_25CF319E8(uint64_t a1)
{
  uint64_t v2 = sub_25CF42EF8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25CF374E4();
}

void sub_25CF31AB4(uint64_t a1)
{
  uint64_t v2 = sub_25CF43138();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - v7;
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25CF43058();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  uint64_t v10 = sub_25CF43038();
  os_log_type_t v11 = sub_25CF43E28();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_25CEFA000, v10, v11, "#SceneHostView View did appear", v12, 2u);
    MEMORY[0x2611A3230](v12, -1, -1);
  }

  uint64_t v13 = *(void **)(a1 + 16);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = (void *)sub_25CF43CC8();

    if (v15)
    {
      if (objc_msgSend(v15, sel_respondsToSelector_, sel_informHostOfBackgroundColor_))
      {
        type metadata accessor for SceneHostView();
        sub_25CF2F26C(&qword_26A62ED50, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v8);
        (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F184F8], v2);
        char v16 = sub_25CF43128();
        char v17 = *(void (**)(char *, uint64_t))(v3 + 8);
        v17(v6, v2);
        v17(v8, v2);
        char v18 = self;
        uint64_t v19 = &selRef_systemBlackColor;
        if ((v16 & 1) == 0) {
          uint64_t v19 = &selRef_systemWhiteColor;
        }
        id v20 = [v18 *v19];
        sub_25CF32DA0();
        MEMORY[0x2611A2450](v20);
        uint64_t v21 = (void *)sub_25CF43E88();
        objc_msgSend(v15, sel_informHostOfBackgroundColor_, v21);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    sub_25CF43D18();
    sub_25CF32E08((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    sub_25CF43298();
    __break(1u);
  }
}

void sub_25CF31E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v41 = (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (uint64_t)&v39 - v7;
  uint64_t v8 = sub_25CF42E08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v39 - v13;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(v9 + 88);
  int v16 = v15(v14, v8);
  int v17 = *MEMORY[0x263F70730];
  char v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v14, v8);
  if (v16 == v17)
  {
    if (qword_26A62ED30 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25CF43058();
    __swift_project_value_buffer(v19, (uint64_t)static Logger.siriMail);
    id v20 = sub_25CF43038();
    os_log_type_t v21 = sub_25CF43E58();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_12;
    }
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    char v23 = "#SceneHostView focus changed, but we're already sending the email: do nothing";
LABEL_11:
    _os_log_impl(&dword_25CEFA000, v20, v21, v23, v22, 2u);
    MEMORY[0x2611A3230](v22, -1, -1);
LABEL_12:

    return;
  }
  uint64_t v40 = a3;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  swift_release();
  int v24 = v15(v12, v8);
  int v25 = *MEMORY[0x263F70750];
  v18(v12, v8);
  if (v24 == v25)
  {
    if (qword_26A62ED30 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25CF43058();
    __swift_project_value_buffer(v26, (uint64_t)static Logger.siriMail);
    id v20 = sub_25CF43038();
    os_log_type_t v21 = sub_25CF43E58();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_12;
    }
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    char v23 = "#SceneHostView focus changed, but we've already cancelled the email: do nothing";
    goto LABEL_11;
  }
  uint64_t v27 = sub_25CF42DF8();
  uint64_t v28 = v43;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v43, 1, v27);
  uint64_t v30 = v44;
  uint64_t v31 = v42;
  sub_25CEFDAA8(v44, v42, &qword_26A62FB90);
  if (EnumTagSinglePayload == 1 && __swift_getEnumTagSinglePayload(v31, 1, v27) != 1)
  {
    sub_25CF219F0(v31, &qword_26A62FB90);
    uint64_t v38 = *(void **)(v40 + 16);
    if (v38)
    {
      id v37 = v38;
      sub_25CF43CB8();
      goto LABEL_23;
    }
LABEL_24:
    sub_25CF43D18();
    sub_25CF32E08((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    sub_25CF43298();
    __break(1u);
    return;
  }
  sub_25CF219F0(v31, &qword_26A62FB90);
  int v32 = __swift_getEnumTagSinglePayload(v28, 1, v27);
  uint64_t v33 = v30;
  uint64_t v34 = v41;
  sub_25CEFDAA8(v33, v41, &qword_26A62FB90);
  if (v32 == 1)
  {
    sub_25CF219F0(v34, &qword_26A62FB90);
    return;
  }
  int v35 = __swift_getEnumTagSinglePayload(v34, 1, v27);
  sub_25CF219F0(v34, &qword_26A62FB90);
  if (v35 == 1)
  {
    uint64_t v36 = *(void **)(v40 + 16);
    if (v36)
    {
      id v37 = v36;
      sub_25CF43CA8();
LABEL_23:

      return;
    }
    goto LABEL_24;
  }
}

uint64_t sub_25CF32384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25CF42E08();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25CF43058();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  uint64_t v10 = sub_25CF43038();
  os_log_type_t v11 = sub_25CF43E28();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_25CEFA000, v10, v11, "#SceneHostView View did change", v12, 2u);
    MEMORY[0x2611A3230](v12, -1, -1);
  }

  sub_25CF32E08(&qword_26A62FDE8, MEMORY[0x263F70758]);
  uint64_t result = sub_25CF43D58();
  if ((result & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    int v14 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
    int v15 = *MEMORY[0x263F70730];
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v14 == v15)
    {
      uint64_t v16 = a3 + *(int *)(type metadata accessor for SceneHostView() + 32);
      uint64_t v17 = *(void *)(v16 + 8);
      LOBYTE(v28) = *(unsigned char *)v16;
      uint64_t v29 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F2D0);
      uint64_t result = sub_25CF439C8();
      if ((v33 & 1) == 0)
      {
        char v18 = sub_25CF43038();
        os_log_type_t v19 = sub_25CF43E58();
        if (os_log_type_enabled(v18, v19))
        {
          id v20 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v20 = 0;
          _os_log_impl(&dword_25CEFA000, v18, v19, "#SceneHostView model state changed to .sent, view sending action", v20, 2u);
          MEMORY[0x2611A3230](v20, -1, -1);
        }

        char v21 = *(unsigned char *)(a3 + 40);
        uint64_t v22 = swift_retain();
        sub_25CF2F4DC(v22, v21);
        swift_release();
        uint64_t v23 = sub_25CF42F08();
        uint64_t v30 = v23;
        int v24 = (void (*)(uint64_t))MEMORY[0x263F707D8];
        uint64_t v31 = sub_25CF32E08(&qword_26A62FE00, MEMORY[0x263F707D8]);
        uint64_t v32 = sub_25CF32E08(&qword_26A62FE08, v24);
        int v25 = __swift_allocate_boxed_opaque_existential_1(&v28);
        (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F707D0], v23);
        sub_25CF42CE8();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
        uint64_t v26 = *(void *)(v16 + 8);
        LOBYTE(v28) = *(unsigned char *)v16;
        uint64_t v29 = v26;
        char v33 = 1;
        return sub_25CF439D8();
      }
    }
  }
  return result;
}

uint64_t sub_25CF3278C()
{
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25CF43058();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  uint64_t v1 = sub_25CF43038();
  os_log_type_t v2 = sub_25CF43E28();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25CEFA000, v1, v2, "#SceneHostView View will disappear", v3, 2u);
    MEMORY[0x2611A3230](v3, -1, -1);
  }

  type metadata accessor for SiriMailModel();
  sub_25CF32E08(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  swift_retain();
  sub_25CF42F98();
  return swift_release();
}

uint64_t sub_25CF32AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SceneHostView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF32B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SceneHostView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF32B6C()
{
  return sub_25CF32FC8((uint64_t (*)(uint64_t))sub_25CF31AB4);
}

uint64_t sub_25CF32B90(uint64_t a1, uint64_t a2)
{
  return sub_25CF32D10(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25CF31E28);
}

unint64_t sub_25CF32BA8()
{
  unint64_t result = qword_26A62FDD8;
  if (!qword_26A62FDD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FDB0);
    sub_25CEFDA10(&qword_26A62FDE0, &qword_26A62FDA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FDD8);
  }
  return result;
}

unint64_t sub_25CF32C48()
{
  unint64_t result = qword_26A62FC48;
  if (!qword_26A62FC48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FB90);
    sub_25CF32E08(&qword_26A62FC50, MEMORY[0x263F70718]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FC48);
  }
  return result;
}

uint64_t sub_25CF32CF8(uint64_t a1, uint64_t a2)
{
  return sub_25CF32D10(a1, a2, sub_25CF32384);
}

uint64_t sub_25CF32D10(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = type metadata accessor for SceneHostView();
  OUTLINED_FUNCTION_0_0(v6);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a3(a1, a2, v8);
}

uint64_t sub_25CF32D88()
{
  return sub_25CF32FC8((uint64_t (*)(uint64_t))sub_25CF3278C);
}

unint64_t sub_25CF32DA0()
{
  unint64_t result = qword_26A62FE10;
  if (!qword_26A62FE10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A62FE10);
  }
  return result;
}

uint64_t sub_25CF32DE0()
{
  return sub_25CF36F38();
}

uint64_t sub_25CF32E08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF32E54()
{
  return sub_25CF32FC8(sub_25CF31514);
}

uint64_t objectdestroyTm_4()
{
  uint64_t v1 = *(void *)(type metadata accessor for SceneHostView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();

  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25CF43138();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2_3();
    v5();
  }
  else
  {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25CF32FB0()
{
  return sub_25CF32FC8((uint64_t (*)(uint64_t))sub_25CF31678);
}

uint64_t sub_25CF32FC8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SceneHostView();
  OUTLINED_FUNCTION_0_0(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

uint64_t sub_25CF3301C@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF31920(a1);
}

unint64_t sub_25CF33024()
{
  unint64_t result = qword_26A62FEA0;
  if (!qword_26A62FEA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FE98);
    sub_25CF330C4();
    sub_25CEFDA10(&qword_26A62FEF8, &qword_26A62FF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FEA0);
  }
  return result;
}

unint64_t sub_25CF330C4()
{
  unint64_t result = qword_26A62FEA8;
  if (!qword_26A62FEA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FEB0);
    sub_25CF33164();
    sub_25CEFDA10(&qword_26A62FEE8, &qword_26A62FEF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FEA8);
  }
  return result;
}

unint64_t sub_25CF33164()
{
  unint64_t result = qword_26A62FEB8;
  if (!qword_26A62FEB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FEC0);
    sub_25CF33204();
    sub_25CEFDA10(&qword_26A62FED8, &qword_26A62FEE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FEB8);
  }
  return result;
}

unint64_t sub_25CF33204()
{
  unint64_t result = qword_26A62FEC8;
  if (!qword_26A62FEC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FEC8);
  }
  return result;
}

uint64_t sub_25CF33278@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25CF433F8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25CF332AC()
{
  return sub_25CF43408();
}

uint64_t sub_25CF332DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF433D8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25CF3330C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF433D8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25CF3333C()
{
  return sub_25CF433E8();
}

uint64_t sub_25CF33364()
{
  return sub_25CF433E8();
}

unsigned char *sub_25CF3338C(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_25CF333A0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_25CF333B0(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_25CF333C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SceneHostView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF33424@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25CF43378();
  *a1 = v3;
  return result;
}

uint64_t sub_25CF33450()
{
  return sub_25CF43388();
}

unint64_t sub_25CF33480()
{
  unint64_t result = qword_26A62FF20;
  if (!qword_26A62FF20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FF18);
    sub_25CF33520();
    sub_25CEFDA10(&qword_26A62FF48, &qword_26A62FF50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FF20);
  }
  return result;
}

unint64_t sub_25CF33520()
{
  unint64_t result = qword_26A62FF28;
  if (!qword_26A62FF28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FF30);
    sub_25CEFDA10(&qword_26A62FF38, &qword_26A62FF40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FF28);
  }
  return result;
}

unint64_t sub_25CF335C4()
{
  unint64_t result = qword_26A62FF58;
  if (!qword_26A62FF58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FDF0);
    sub_25CF33640();
    sub_25CF2E58C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FF58);
  }
  return result;
}

unint64_t sub_25CF33640()
{
  unint64_t result = qword_26A62FF60;
  if (!qword_26A62FF60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FDC8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FDB8);
    sub_25CF42E08();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FDB0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FB90);
    sub_25CF32BA8();
    sub_25CF32C48();
    swift_getOpaqueTypeConformance2();
    sub_25CF32E08(&qword_26A62FDE8, MEMORY[0x263F70758]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FF60);
  }
  return result;
}

uint64_t SendMessageView.message.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25CF42EF8();
  OUTLINED_FUNCTION_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t SendMessageView.init(message:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25CF42EF8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(void))(v5 + 16);
  OUTLINED_FUNCTION_2_6();
  v8();
  OUTLINED_FUNCTION_2_6();
  v8();
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v7, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  uint64_t result = type metadata accessor for SendMessageView();
  uint64_t v12 = a2 + *(int *)(result + 20);
  *(void *)uint64_t v12 = sub_25CF33AC4;
  *(void *)(v12 + 8) = v10;
  *(unsigned char *)(v12 + 16) = 0;
  return result;
}

uint64_t sub_25CF33964(uint64_t a1)
{
  uint64_t v2 = sub_25CF42EF8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  type metadata accessor for SiriMailModel();
  swift_allocObject();
  return SiriMailModel.init(message:)();
}

uint64_t sub_25CF33A3C()
{
  sub_25CF42EF8();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25CF33AC4()
{
  uint64_t v1 = *(void *)(sub_25CF42EF8() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25CF33964(v2);
}

uint64_t type metadata accessor for SendMessageView()
{
  uint64_t result = qword_26A62FF80;
  if (!qword_26A62FF80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SendMessageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = type metadata accessor for SceneClientView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FF68);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for SceneHostView();
  OUTLINED_FUNCTION_2();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v23 - v11;
  Swift::Bool v13 = MailUIFeatureFlags.isSceneHostingEnabled()();
  type metadata accessor for SendMessageView();
  type metadata accessor for SiriMailModel();
  sub_25CF33F98(&qword_26A62FC10, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF43158();
  if (v13)
  {
    *(void *)uint64_t v10 = sub_25CF43218();
    *((void *)v10 + 1) = v14;
    sub_25CF43D18();
    sub_25CF33F98((unint64_t *)&qword_26A62FA10, MEMORY[0x263F77980]);
    *((void *)v10 + 2) = sub_25CF432A8();
    *((void *)v10 + 3) = v15;
    *((void *)v10 + 4) = swift_getKeyPath();
    v10[40] = 0;
    uint64_t v16 = v24;
    uint64_t v17 = (uint64_t *)&v10[*(int *)(v24 + 28)];
    *uint64_t v17 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62ED50);
    swift_storeEnumTagMultiPayload();
    char v18 = &v10[*(int *)(v16 + 32)];
    char v27 = 0;
    sub_25CF439B8();
    uint64_t v19 = v29;
    *char v18 = v28;
    *((void *)v18 + 1) = v19;
    sub_25CF32B08((uint64_t)v10, (uint64_t)v12);
    id v20 = type metadata accessor for SceneHostView;
    sub_25CF34048((uint64_t)v12, (uint64_t)v6, (void (*)(void))type metadata accessor for SceneHostView);
    swift_storeEnumTagMultiPayload();
    sub_25CF33F98(&qword_26A62FF70, (void (*)(uint64_t))type metadata accessor for SceneHostView);
    sub_25CF33F98(&qword_26A62FF78, (void (*)(uint64_t))type metadata accessor for SceneClientView);
    sub_25CF43518();
    uint64_t v21 = (uint64_t)v12;
  }
  else
  {
    sub_25CF28C5C((uint64_t)v3);
    id v20 = type metadata accessor for SceneClientView;
    sub_25CF34048((uint64_t)v3, (uint64_t)v6, (void (*)(void))type metadata accessor for SceneClientView);
    swift_storeEnumTagMultiPayload();
    sub_25CF33F98(&qword_26A62FF70, (void (*)(uint64_t))type metadata accessor for SceneHostView);
    sub_25CF33F98(&qword_26A62FF78, (void (*)(uint64_t))type metadata accessor for SceneClientView);
    sub_25CF43518();
    uint64_t v21 = (uint64_t)v3;
  }
  return sub_25CF340A8(v21, (void (*)(void))v20);
}

uint64_t sub_25CF33F98(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF33FE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25CF432F8();
  *a1 = result;
  return result;
}

uint64_t sub_25CF34010()
{
  return sub_25CF43308();
}

uint64_t sub_25CF34048(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25CF340A8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25CF34100()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SendMessageView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25CF42EF8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *((void *)v10 + 1);
    char v13 = v10[16];
    sub_25CF34210();
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
    v9[16] = v13;
  }
  return a1;
}

uint64_t sub_25CF34210()
{
  return swift_retain();
}

uint64_t destroy for SendMessageView(uint64_t a1)
{
  uint64_t v2 = sub_25CF42EF8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return sub_25CF34294();
}

uint64_t sub_25CF34294()
{
  return swift_release();
}

uint64_t initializeWithCopy for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42EF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  char v12 = *((unsigned char *)v9 + 16);
  sub_25CF34210();
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  return a1;
}

uint64_t assignWithCopy for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42EF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  char v12 = *((unsigned char *)v9 + 16);
  sub_25CF34210();
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  sub_25CF34294();
  return a1;
}

uint64_t initializeWithTake for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42EF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t assignWithTake for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25CF42EF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v10;
  sub_25CF34294();
  return a1;
}

uint64_t getEnumTagSinglePayload for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF34528);
}

uint64_t sub_25CF34528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25CF42EF8();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    if (v9 > 1) {
      return (v9 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF345C8);
}

void sub_25CF345C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25CF42EF8();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
  }
}

uint64_t sub_25CF34654()
{
  uint64_t result = sub_25CF42EF8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25CF346EC()
{
  unint64_t result = qword_26A62FF90;
  if (!qword_26A62FF90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FF98);
    sub_25CF33F98(&qword_26A62FF70, (void (*)(uint64_t))type metadata accessor for SceneHostView);
    sub_25CF33F98(&qword_26A62FF78, (void (*)(uint64_t))type metadata accessor for SceneClientView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FF90);
  }
  return result;
}

uint64_t static Logger.logAndCrash(_:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v33 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFA0);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_25CF43058();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)static Logger.siriMail);
  uint64_t v18 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v15, v17, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v16);
  sub_25CF34C28((uint64_t)v15, (uint64_t)v13);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v16) == 1)
  {
    sub_25CF34C90((uint64_t)v13);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_25CF43038();
    os_log_type_t v20 = sub_25CF43E38();
    int v30 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v31 = a6;
      uint64_t v22 = v21;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v35 = v28;
      *(_DWORD *)uint64_t v22 = 136315650;
      uint64_t v32 = a3;
      uint64_t v23 = sub_25CF43F38();
      uint64_t v34 = sub_25CF34D98(v23, v24, &v35);
      int v29 = a5;
      sub_25CF43EB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2048;
      uint64_t v34 = v31;
      sub_25CF43EB8();
      *(_WORD *)(v22 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25CF34D98(a1, a2, &v35);
      sub_25CF43EB8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25CEFA000, v19, (os_log_type_t)v30, "FatalError at %s:%lu - %s", (uint8_t *)v22, 0x20u);
      uint64_t v25 = v28;
      swift_arrayDestroy();
      MEMORY[0x2611A3230](v25, -1, -1);
      MEMORY[0x2611A3230](v22, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v16);
  }
  sub_25CF42BC8();
  uint64_t result = sub_25CF43FE8();
  __break(1u);
  return result;
}

uint64_t Logger.siriMail.unsafeMutableAddressor()
{
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25CF43058();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
}

uint64_t sub_25CF34BB0()
{
  uint64_t v0 = sub_25CF43058();
  __swift_allocate_value_buffer(v0, static Logger.siriMail);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  return sub_25CF43048();
}

uint64_t sub_25CF34C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF34C90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static Logger.siriMail.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25CF43058();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriMail);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25CF34D98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25CF34E7C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25CF26F30((uint64_t)v12, *a3);
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
      sub_25CF26F30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t sub_25CF34E7C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25CF34FD4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25CF43EC8();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25CF350AC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25CF43F78();
    if (!v8)
    {
      uint64_t result = sub_25CF43FD8();
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

void *sub_25CF34FD4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25CF44008();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25CF350AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25CF35144(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25CF35320(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25CF35320((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25CF35144(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25CF43DB8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_25CF352B8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25CF43F28();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25CF44008();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25CF43FD8();
  __break(1u);
  return result;
}

void *sub_25CF352B8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25CF35320(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFA8);
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
  char v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25CF354D0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25CF353F8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25CF353F8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25CF44008();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25CF354D0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25CF44008();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_25CF355C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.to.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF355F0()
{
  return SiriMailModel.to.setter();
}

uint64_t sub_25CF3561C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.cc.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF35648()
{
  return SiriMailModel.cc.setter();
}

uint64_t sub_25CF35674@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.bcc.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF356A0()
{
  return SiriMailModel.bcc.setter();
}

uint64_t sub_25CF356CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.subject.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF356F8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF35754(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SiriMailModel.subject.setter);
}

uint64_t sub_25CF35710@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.body.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF3573C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF35754(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SiriMailModel.body.setter);
}

uint64_t sub_25CF35754(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_25CF3579C()
{
  return SiriMailModel.focusedField.getter();
}

uint64_t sub_25CF357C0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v4 = OUTLINED_FUNCTION_21(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8_1();
  sub_25CF38A20(a1, v1);
  return SiriMailModel.focusedField.setter(v1);
}

uint64_t SiriMailModel.__allocating_init(message:)()
{
  uint64_t v0 = swift_allocObject();
  SiriMailModel.init(message:)();
  return v0;
}

uint64_t property wrapper backing initializer of SiriMailModel.subject(uint64_t a1, uint64_t a2)
{
  return sub_25CF35978(a1, a2, (uint64_t)&unk_270A1C8D0, (uint64_t)sub_25CF385CC);
}

uint64_t SiriMailModel.subject.getter()
{
  return sub_25CF35AA8();
}

uint64_t SiriMailModel.subject.setter()
{
  return sub_25CF35B28();
}

uint64_t (*SiriMailModel.subject.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.body(uint64_t a1, uint64_t a2)
{
  return sub_25CF35978(a1, a2, (uint64_t)&unk_270A1C8F8, (uint64_t)sub_25CF386F4);
}

uint64_t sub_25CF35978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = OUTLINED_FUNCTION_7_7();
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = 0;
  type metadata accessor for SiriMailModel();
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  OUTLINED_FUNCTION_37();
  return sub_25CF42FC8();
}

uint64_t sub_25CF35A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  sub_25CF42D28();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = OUTLINED_FUNCTION_39();
  v4(v3);
  return swift_bridgeObjectRetain();
}

uint64_t SiriMailModel.body.getter()
{
  return sub_25CF35AA8();
}

uint64_t sub_25CF35AA8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SiriMailModel.body.setter()
{
  return sub_25CF35B28();
}

uint64_t sub_25CF35B28()
{
  return sub_25CF43008();
}

uint64_t (*SiriMailModel.body.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.attachments()
{
  uint64_t v0 = OUTLINED_FUNCTION_7_7();
  *(void *)(v0 + 16) = sub_25CF3876C;
  *(void *)(v0 + 24) = 0;
  type metadata accessor for SiriMailModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFC0);
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF387B8();
  return sub_25CF42FC8();
}

uint64_t SiriMailModel.attachments.getter()
{
  return sub_25CF360B4();
}

uint64_t sub_25CF35D08()
{
  return SiriMailModel.attachments.setter();
}

uint64_t SiriMailModel.attachments.setter()
{
  return sub_25CF36134();
}

uint64_t (*SiriMailModel.attachments.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.to(uint64_t a1)
{
  return sub_25CF35EA8(a1, (uint64_t)&unk_270A1C948, (uint64_t)sub_25CF3888C);
}

uint64_t SiriMailModel.to.getter()
{
  return sub_25CF360B4();
}

uint64_t SiriMailModel.to.setter()
{
  return sub_25CF36134();
}

uint64_t (*SiriMailModel.to.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.cc(uint64_t a1)
{
  return sub_25CF35EA8(a1, (uint64_t)&unk_270A1C970, (uint64_t)sub_25CF38980);
}

uint64_t sub_25CF35EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = OUTLINED_FUNCTION_7_7();
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = 0;
  type metadata accessor for SiriMailModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD28);
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF388AC();
  OUTLINED_FUNCTION_37();
  return sub_25CF42FC8();
}

uint64_t SiriMailModel.cc.getter()
{
  return sub_25CF360B4();
}

uint64_t SiriMailModel.cc.setter()
{
  return sub_25CF36134();
}

uint64_t (*SiriMailModel.cc.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.bcc(uint64_t a1)
{
  return sub_25CF35EA8(a1, (uint64_t)&unk_270A1C998, (uint64_t)sub_25CF389D0);
}

uint64_t sub_25CF36030@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  sub_25CF42D28();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = OUTLINED_FUNCTION_39();
  v3(v2);
  return swift_bridgeObjectRetain();
}

uint64_t SiriMailModel.bcc.getter()
{
  return sub_25CF360B4();
}

uint64_t sub_25CF360B4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SiriMailModel.bcc.setter()
{
  return sub_25CF36134();
}

uint64_t sub_25CF36134()
{
  return sub_25CF43008();
}

uint64_t (*SiriMailModel.bcc.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.focusedField(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_8_3();
  sub_25CF38A20(a1, v1);
  type metadata accessor for SiriMailModel();
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF32C48();
  sub_25CF42FC8();
  return sub_25CF38A8C(a1);
}

uint64_t sub_25CF36308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25CF38A20(a1, a2);
  uint64_t v3 = *MEMORY[0x263F70660];
  uint64_t v4 = sub_25CF42D28();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104);
  return v5(a2, v3, v4);
}

uint64_t SiriMailModel.focusedField.getter()
{
  return sub_25CF366D4();
}

uint64_t SiriMailModel.focusedField.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v4 = OUTLINED_FUNCTION_21(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8_1();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25CF38A20(a1, v1);
  swift_retain();
  sub_25CF43008();
  return sub_25CF38A8C(a1);
}

uint64_t (*SiriMailModel.focusedField.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

uint64_t property wrapper backing initializer of SiriMailModel.state()
{
  sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = OUTLINED_FUNCTION_38();
  v2(v1);
  type metadata accessor for SiriMailModel();
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF39EA4(&qword_26A62FDE8, MEMORY[0x263F70758]);
  sub_25CF42FC8();
  uint64_t v3 = OUTLINED_FUNCTION_12_4();
  return v4(v3);
}

uint64_t sub_25CF3660C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25CF42E08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  uint64_t v5 = *MEMORY[0x263F70688];
  uint64_t v6 = sub_25CF42D28();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104);
  return v7(a2, v5, v6);
}

uint64_t SiriMailModel.state.getter()
{
  return sub_25CF366D4();
}

uint64_t sub_25CF366D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25CF42FF8();
  swift_release();
  return swift_release();
}

uint64_t sub_25CF36744()
{
  return SiriMailModel.state.getter();
}

uint64_t sub_25CF36768(uint64_t a1)
{
  sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_8_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  return SiriMailModel.state.setter(v1);
}

uint64_t SiriMailModel.state.setter(uint64_t a1)
{
  uint64_t v2 = sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8_3();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v6 = OUTLINED_FUNCTION_38();
  v7(v6);
  swift_retain();
  sub_25CF43008();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*SiriMailModel.state.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19((uint64_t)v1);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_3_7(v3);
  return sub_25CF35940;
}

void sub_25CF36948(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

id SiriMailModel.snippetService.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_snippetService);
}

uint64_t SiriMailModel.subscription.getter()
{
  return swift_retain();
}

uint64_t SiriMailModel.subscription.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_30();
  void *v1 = a1;
  return swift_release();
}

uint64_t (*SiriMailModel.subscription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriMailModel.toLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.ccLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.bccLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.subjectLabel.getter()
{
  return sub_25CF36D40(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
}

uint64_t SiriMailModel.subjectLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_25CF36D94(a1, a2);
}

uint64_t (*SiriMailModel.subjectLabel.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriMailModel.cancelLabel.getter()
{
  return sub_25CF36D40(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
}

uint64_t SiriMailModel.cancelLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_25CF36D94(a1, a2);
}

uint64_t (*SiriMailModel.cancelLabel.modify())()
{
  return j__swift_endAccess;
}

uint64_t SiriMailModel.cancelledLabel.getter()
{
  return sub_25CF36D40(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
}

uint64_t SiriMailModel.cancelledLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_25CF36D94(a1, a2);
}

uint64_t (*SiriMailModel.cancelledLabel.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriMailModel.sendLabel.getter()
{
  return sub_25CF36D40(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
}

uint64_t SiriMailModel.sendLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_25CF36D94(a1, a2);
}

uint64_t (*SiriMailModel.sendLabel.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriMailModel.sentLabel.getter()
{
  return sub_25CF36D40(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
}

uint64_t SiriMailModel.sentLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_25CF36D94(a1, a2);
}

uint64_t (*SiriMailModel.sentLabel.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriMailModel.messageLabel.getter()
{
  return sub_25CF36D40(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
}

uint64_t sub_25CF36D40(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  OUTLINED_FUNCTION_8_4();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t SiriMailModel.messageLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_25CF36D94(a1, a2);
}

uint64_t sub_25CF36D94(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_30();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriMailModel.messageLabel.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriMailModel.deleteLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.replyLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.nextLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.seeAllLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.moreInMailLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t SiriMailModel.newMessageLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t sub_25CF36F38()
{
  uint64_t v0 = sub_25CF42E08();
  uint64_t v1 = OUTLINED_FUNCTION_21(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_23(v2, v7);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v4 = OUTLINED_FUNCTION_21(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v5);
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  SiriMailModel.to.getter();
  SiriMailModel.cc.getter();
  SiriMailModel.bcc.getter();
  SiriMailModel.subject.getter();
  SiriMailModel.body.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  SiriMailModel.attachments.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25CF42FF8();
  swift_release();
  swift_release();
  return sub_25CF42E98();
}

uint64_t sub_25CF374E4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v2 = OUTLINED_FUNCTION_21(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_25();
  uint64_t v3 = sub_25CF42E08();
  uint64_t v4 = OUTLINED_FUNCTION_21(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25CF42DC8();
  SiriMailModel.to.setter();
  sub_25CF42DB8();
  SiriMailModel.cc.setter();
  sub_25CF42DD8();
  SiriMailModel.bcc.setter();
  sub_25CF42E18();
  SiriMailModel.state.setter((uint64_t)v6);
  sub_25CF42E88();
  SiriMailModel.subject.setter();
  sub_25CF42DE8();
  SiriMailModel.body.setter();
  sub_25CF42D78();
  SiriMailModel.focusedField.setter(v0);
  sub_25CF42D38();
  SiriMailModel.attachments.setter();
  sub_25CF42EF8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  return v7();
}

uint64_t SiriMailModel.init(message:)()
{
  uint64_t v2 = sub_25CF42F48();
  uint64_t v3 = OUTLINED_FUNCTION_21(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630010);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v6);
  uint64_t v93 = sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  uint64_t v96 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v92 = v9;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_35();
  uint64_t v90 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630018);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_23(v13, v83);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_2();
  uint64_t v94 = v15;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_35();
  uint64_t v91 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630020);
  OUTLINED_FUNCTION_0();
  uint64_t v95 = v18;
  MEMORY[0x270FA5388](v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630028);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6_2(v21);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A630030);
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  uint64_t v85 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_34();
  uint64_t v25 = v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__subject;
  uint64_t v84 = v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__subject;
  uint64_t v26 = OUTLINED_FUNCTION_7_7();
  *(void *)(v26 + 16) = sub_25CF385CC;
  *(void *)(v26 + 24) = 0;
  type metadata accessor for SiriMailModel();
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF42FC8();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32);
  v27(v25, v1, v89);
  uint64_t v28 = v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__body;
  uint64_t v86 = v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__body;
  uint64_t v29 = OUTLINED_FUNCTION_7_7();
  *(void *)(v29 + 16) = sub_25CF386F4;
  *(void *)(v29 + 24) = 0;
  sub_25CF42FC8();
  v27(v28, v1, v89);
  uint64_t v30 = OUTLINED_FUNCTION_7_7();
  *(void *)(v30 + 16) = sub_25CF3876C;
  *(void *)(v30 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FFC0);
  sub_25CF387B8();
  sub_25CF42FC8();
  OUTLINED_FUNCTION_27();
  v31();
  uint64_t v32 = OUTLINED_FUNCTION_7_7();
  *(void *)(v32 + 16) = sub_25CF3888C;
  *(void *)(v32 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FD28);
  sub_25CF388AC();
  OUTLINED_FUNCTION_36();
  uint64_t v33 = *(void (**)(void))(v95 + 32);
  OUTLINED_FUNCTION_28();
  v33();
  uint64_t v34 = OUTLINED_FUNCTION_7_7();
  *(void *)(v34 + 16) = sub_25CF38980;
  *(void *)(v34 + 24) = 0;
  sub_25CF42FC8();
  OUTLINED_FUNCTION_28();
  v33();
  uint64_t v35 = OUTLINED_FUNCTION_7_7();
  *(void *)(v35 + 16) = sub_25CF389D0;
  *(void *)(v35 + 24) = 0;
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  v33();
  uint64_t v36 = sub_25CF42DF8();
  __swift_storeEnumTagSinglePayload(v91, 1, 1, v36);
  sub_25CF38A20(v91, v94);
  sub_25CF32C48();
  OUTLINED_FUNCTION_40();
  sub_25CF42FC8();
  sub_25CF38A8C(v91);
  OUTLINED_FUNCTION_27();
  v37();
  (*(void (**)(uint64_t, void, uint64_t))(v96 + 104))(v90, *MEMORY[0x263F70738], v93);
  uint64_t v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 16);
  v87(v92, v90, v93);
  sub_25CF39EA4(&qword_26A62FDE8, MEMORY[0x263F70758]);
  OUTLINED_FUNCTION_40();
  sub_25CF42FC8();
  (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v90, v93);
  OUTLINED_FUNCTION_27();
  v38();
  uint64_t v39 = OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_snippetService;
  sub_25CF42F88();
  sub_25CF42F38();
  *(void *)(v0 + v39) = sub_25CF42F78();
  *(void *)(v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription) = 0;
  sub_25CF42E88();
  OUTLINED_FUNCTION_4_3();
  uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  v88(v84, v89);
  uint64_t v40 = OUTLINED_FUNCTION_7_7();
  *(void *)(v40 + 16) = sub_25CF385CC;
  *(void *)(v40 + 24) = 0;
  sub_25CF42FC8();
  swift_endAccess();
  sub_25CF42DE8();
  OUTLINED_FUNCTION_4_3();
  v88(v86, v89);
  uint64_t v41 = OUTLINED_FUNCTION_7_7();
  *(void *)(v41 + 16) = sub_25CF386F4;
  *(void *)(v41 + 24) = 0;
  sub_25CF42FC8();
  swift_endAccess();
  sub_25CF42D38();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_3();
  v42();
  uint64_t v43 = OUTLINED_FUNCTION_7_7();
  *(void *)(v43 + 16) = sub_25CF3876C;
  *(void *)(v43 + 24) = 0;
  sub_25CF42FC8();
  swift_endAccess();
  sub_25CF42DC8();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4_3();
  uint64_t v44 = *(void (**)(void))(v95 + 8);
  OUTLINED_FUNCTION_29();
  v44();
  uint64_t v45 = OUTLINED_FUNCTION_7_7();
  *(void *)(v45 + 16) = sub_25CF3888C;
  *(void *)(v45 + 24) = 0;
  sub_25CF42FC8();
  swift_endAccess();
  sub_25CF42DB8();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_29();
  v44();
  uint64_t v46 = OUTLINED_FUNCTION_7_7();
  *(void *)(v46 + 16) = sub_25CF38980;
  *(void *)(v46 + 24) = 0;
  OUTLINED_FUNCTION_24();
  swift_endAccess();
  sub_25CF42DD8();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_29();
  v44();
  uint64_t v47 = OUTLINED_FUNCTION_7_7();
  *(void *)(v47 + 16) = sub_25CF389D0;
  *(void *)(v47 + 24) = 0;
  OUTLINED_FUNCTION_24();
  swift_endAccess();
  sub_25CF42E18();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_3();
  v48();
  v87(v92, v90, v93);
  OUTLINED_FUNCTION_40();
  sub_25CF42FC8();
  OUTLINED_FUNCTION_2_3();
  v49();
  swift_endAccess();
  sub_25CF42D78();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_3();
  v50();
  sub_25CF38A20(v91, v94);
  sub_25CF42FC8();
  sub_25CF38A8C(v91);
  swift_endAccess();
  uint64_t v51 = sub_25CF42EA8();
  OUTLINED_FUNCTION_10_4(v51, v52, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_toLabel);
  uint64_t v53 = sub_25CF42E78();
  OUTLINED_FUNCTION_10_4(v53, v54, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_ccLabel);
  uint64_t v55 = sub_25CF42EB8();
  OUTLINED_FUNCTION_10_4(v55, v56, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_bccLabel);
  uint64_t v57 = sub_25CF42D98();
  OUTLINED_FUNCTION_10_4(v57, v58, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
  uint64_t v59 = sub_25CF42D48();
  OUTLINED_FUNCTION_10_4(v59, v60, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
  uint64_t v61 = sub_25CF42DA8();
  OUTLINED_FUNCTION_10_4(v61, v62, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
  uint64_t v63 = sub_25CF42ED8();
  OUTLINED_FUNCTION_10_4(v63, v64, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
  uint64_t v65 = sub_25CF42EE8();
  OUTLINED_FUNCTION_10_4(v65, v66, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
  uint64_t v67 = sub_25CF42D88();
  OUTLINED_FUNCTION_10_4(v67, v68, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
  uint64_t v69 = sub_25CF42D58();
  OUTLINED_FUNCTION_10_4(v69, v70, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_deleteLabel);
  uint64_t v71 = sub_25CF42D18();
  OUTLINED_FUNCTION_10_4(v71, v72, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_replyLabel);
  uint64_t v73 = sub_25CF42EC8();
  OUTLINED_FUNCTION_10_4(v73, v74, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_nextLabel);
  uint64_t v75 = sub_25CF42D68();
  OUTLINED_FUNCTION_10_4(v75, v76, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_seeAllLabel);
  uint64_t v77 = sub_25CF42D08();
  OUTLINED_FUNCTION_10_4(v77, v78, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_moreInMailLabel);
  uint64_t v79 = sub_25CF42CF8();
  OUTLINED_FUNCTION_10_4(v79, v80, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_newMessageLabel);
  swift_allocObject();
  swift_weakInit();
  sub_25CF42FA8();
  swift_release();
  sub_25CF42EF8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v81();
  return v0;
}

uint64_t sub_25CF385CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25CF35A24(a1, a2, a3);
}

uint64_t sub_25CF385EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25CF38624(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t type metadata accessor for SiriMailModel()
{
  uint64_t result = qword_26A630040;
  if (!qword_26A630040) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25CF3869C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.subject.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF386C8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF35754(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SiriMailModel.subject.setter);
}

uint64_t sub_25CF386F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25CF35A24(a1, a2, a3);
}

uint64_t sub_25CF38714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.body.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF38740(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25CF35754(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SiriMailModel.body.setter);
}

uint64_t sub_25CF3876C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25CF36030(a1, a2);
}

uint64_t sub_25CF3878C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_25CF387B8()
{
  unint64_t result = qword_26A62FFC8;
  if (!qword_26A62FFC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FFC0);
    sub_25CF39EA4(&qword_26A62FFD0, MEMORY[0x263F70640]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FFC8);
  }
  return result;
}

uint64_t sub_25CF3885C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.attachments.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF3888C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25CF36030(a1, a2);
}

unint64_t sub_25CF388AC()
{
  unint64_t result = qword_26A62FFE0;
  if (!qword_26A62FFE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A62FD28);
    sub_25CF39EA4(&qword_26A62F810, MEMORY[0x263F70788]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A62FFE0);
  }
  return result;
}

uint64_t sub_25CF38950@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.to.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF38980@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25CF36030(a1, a2);
}

uint64_t sub_25CF389A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.cc.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF389D0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25CF36030(a1, a2);
}

uint64_t sub_25CF389F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriMailModel.bcc.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25CF38A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25CF38A8C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF38AEC()
{
  return SiriMailModel.focusedField.getter();
}

uint64_t sub_25CF38B18()
{
  return SiriMailModel.state.getter();
}

uint64_t sub_25CF38B40()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25CF38B78(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25CF38EAC(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_25CF38BD8(uint64_t a1)
{
  return sub_25CF38B78(a1);
}

uint64_t SiriMailModel.post(action:)(uint64_t a1)
{
  uint64_t v3 = sub_25CF42D28();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_25();
  sub_25CF42E28();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v1, a1);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v1, *MEMORY[0x263F70690], v3);
  type metadata accessor for SiriMailModel();
  sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  sub_25CF42FB8();
  uint64_t v8 = OUTLINED_FUNCTION_33();
  return v9(v8);
}

void sub_25CF38EAC(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v91 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  uint64_t v5 = OUTLINED_FUNCTION_21(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_2();
  uint64_t v83 = v6;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_35();
  uint64_t v84 = v8;
  sub_25CF42E08();
  OUTLINED_FUNCTION_0();
  uint64_t v81 = v10;
  uint64_t v82 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_2();
  uint64_t v80 = v11;
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_35();
  uint64_t v88 = v13;
  uint64_t v14 = sub_25CF42EF8();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_34();
  uint64_t v18 = sub_25CF42D28();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_2();
  uint64_t v89 = v22;
  OUTLINED_FUNCTION_4();
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (void (*)(uint64_t))((char *)v79 - v25);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v79 - v27;
  uint64_t v29 = (void *)(v1 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription);
  OUTLINED_FUNCTION_40();
  swift_beginAccess();
  if (*v29 && (swift_retain(), char isCancelled = swift_task_isCancelled(), swift_release(), (isCancelled & 1) != 0))
  {
    if (qword_26A62ED30 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_25CF43058();
    __swift_project_value_buffer(v31, (uint64_t)static Logger.siriMail);
    uint64_t v32 = sub_25CF43038();
    os_log_type_t v33 = sub_25CF43E28();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_25CEFA000, v32, v33, "Skipping update since this SiriMailModel has been cancelled", v34, 2u);
      OUTLINED_FUNCTION_22();
    }
  }
  else
  {
    uint64_t v85 = v2;
    if (qword_26A62ED30 != -1) {
      swift_once();
    }
    uint64_t v86 = v16;
    uint64_t v87 = v14;
    uint64_t v35 = sub_25CF43058();
    __swift_project_value_buffer(v35, (uint64_t)static Logger.siriMail);
    uint64_t v36 = v91;
    uint64_t v90 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    v90(v28, v91, v18);
    id v37 = sub_25CF43038();
    os_log_type_t v38 = sub_25CF43E28();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v79[2] = v3;
      v94[0] = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      v79[1] = v39 + 4;
      v90((char *)v26, (uint64_t)v28, v18);
      uint64_t v41 = sub_25CF43D98();
      uint64_t v26 = (void (*)(uint64_t))v42;
      uint64_t v92 = sub_25CF34D98(v41, v42, v94);
      uint64_t v36 = v91;
      sub_25CF43EB8();
      swift_bridgeObjectRelease();
      uint64_t v43 = OUTLINED_FUNCTION_32();
      v26(v43);
      _os_log_impl(&dword_25CEFA000, v37, v38, "Got change: %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_22();
    }
    else
    {
      uint64_t v44 = OUTLINED_FUNCTION_32();
      v26(v44);
    }

    type metadata accessor for SiriMailModel();
    sub_25CF39EA4(&qword_26A62FC10, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
    sub_25CF43088();
    sub_25CF43098();
    swift_release();
    uint64_t v45 = v89;
    v90((char *)v89, v36, v18);
    int v46 = (*(uint64_t (**)(uint64_t *, uint64_t))(v20 + 88))(v45, v18);
    if (v46 != *MEMORY[0x263F70658])
    {
      if (v46 == *MEMORY[0x263F70698] || v46 == *MEMORY[0x263F70680])
      {
        uint64_t v61 = OUTLINED_FUNCTION_2_7();
        v62(v61);
        unint64_t v63 = v45[1];
        uint64_t v92 = *v45;
        unint64_t v93 = v63;
        OUTLINED_FUNCTION_1_5();
        uint64_t v64 = &qword_26A630030;
      }
      else if (v46 == *MEMORY[0x263F70650])
      {
        uint64_t v65 = OUTLINED_FUNCTION_2_7();
        v66(v65);
        OUTLINED_FUNCTION_42();
        OUTLINED_FUNCTION_1_5();
        uint64_t v64 = &qword_26A630028;
      }
      else
      {
        if (v46 != *MEMORY[0x263F70670] && v46 != *MEMORY[0x263F70668] && v46 != *MEMORY[0x263F70678])
        {
          if (v46 == *MEMORY[0x263F70660])
          {
            uint64_t v69 = OUTLINED_FUNCTION_2_7();
            v70(v69);
            uint64_t v71 = (uint64_t)v45;
            uint64_t v72 = v84;
            sub_25CF3A38C(v71, v84);
            sub_25CF38A20(v72, v83);
            OUTLINED_FUNCTION_1_5();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A630018);
            sub_25CF42FD8();
            swift_endAccess();
            sub_25CF38A8C(v72);
          }
          else if (v46 == *MEMORY[0x263F70690])
          {
            ((void (*)(uint64_t *, uint64_t))v26)(v45, v18);
          }
          else if (v46 == *MEMORY[0x263F70688])
          {
            uint64_t v73 = OUTLINED_FUNCTION_2_7();
            v74(v73);
            uint64_t v75 = v81;
            uint64_t v76 = v88;
            uint64_t v77 = v82;
            OUTLINED_FUNCTION_27();
            v78();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v75 + 16))(v80, v76, v77);
            OUTLINED_FUNCTION_1_5();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A630010);
            sub_25CF42FD8();
            swift_endAccess();
            (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v76, v77);
          }
          else
          {
            sub_25CF44138();
            __break(1u);
          }
          return;
        }
        uint64_t v67 = OUTLINED_FUNCTION_2_7();
        v68(v67);
        OUTLINED_FUNCTION_42();
        OUTLINED_FUNCTION_1_5();
        uint64_t v64 = &qword_26A630020;
      }
      __swift_instantiateConcreteTypeFromMangledName(v64);
      sub_25CF42FD8();
      swift_endAccess();
      return;
    }
    uint64_t v47 = OUTLINED_FUNCTION_2_7();
    v48(v47);
    uint64_t v50 = v85;
    uint64_t v49 = v86;
    uint64_t v51 = v87;
    OUTLINED_FUNCTION_27();
    v52();
    uint64_t v53 = sub_25CF42E88();
    if (v54) {
      uint64_t v55 = v53;
    }
    else {
      uint64_t v55 = 0;
    }
    if (v54) {
      unint64_t v56 = v54;
    }
    else {
      unint64_t v56 = 0xE000000000000000;
    }
    uint64_t v92 = v55;
    unint64_t v93 = v56;
    OUTLINED_FUNCTION_1_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A630030);
    sub_25CF42FD8();
    swift_endAccess();
    uint64_t v57 = sub_25CF42DE8();
    if (v58) {
      uint64_t v59 = v57;
    }
    else {
      uint64_t v59 = 0;
    }
    if (v58) {
      unint64_t v60 = v58;
    }
    else {
      unint64_t v60 = 0xE000000000000000;
    }
    uint64_t v92 = v59;
    unint64_t v93 = v60;
    OUTLINED_FUNCTION_1_5();
    sub_25CF42FD8();
    swift_endAccess();
    uint64_t v92 = sub_25CF42DC8();
    OUTLINED_FUNCTION_1_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A630020);
    sub_25CF42FD8();
    swift_endAccess();
    uint64_t v92 = sub_25CF42DB8();
    OUTLINED_FUNCTION_1_5();
    sub_25CF42FD8();
    swift_endAccess();
    uint64_t v92 = sub_25CF42DD8();
    OUTLINED_FUNCTION_1_5();
    sub_25CF42FD8();
    swift_endAccess();
    uint64_t v92 = sub_25CF42D38();
    OUTLINED_FUNCTION_1_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A630028);
    sub_25CF42FD8();
    swift_endAccess();
    sub_25CF42E18();
    OUTLINED_FUNCTION_1_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A630010);
    sub_25CF42FD8();
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v50, v51);
  }
}

uint64_t SiriMailModel.deinit()
{
  uint64_t v1 = v0;
  if (qword_26A62ED30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25CF43058();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.siriMail);
  swift_retain_n();
  uint64_t v3 = sub_25CF43038();
  os_log_type_t v4 = sub_25CF43E28();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v6 = sub_25CF43D98();
    sub_25CF34D98(v6, v7, &v32);
    sub_25CF43EB8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25CEFA000, v3, v4, "SiriMailModel.deinit on instance %s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_22();
  }
  else
  {

    swift_release_n();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630030);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  OUTLINED_FUNCTION_17();
  v9(v10, v11);
  OUTLINED_FUNCTION_17();
  v9(v12, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630028);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v16(v14, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630020);
  OUTLINED_FUNCTION_2();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  OUTLINED_FUNCTION_17();
  v18(v19, v20);
  OUTLINED_FUNCTION_17();
  v18(v21, v22);
  OUTLINED_FUNCTION_17();
  v18(v23, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630018);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v27(v25, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630010);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3();
  v30(v28, v29);

  swift_release();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_9_4();
  return v1;
}

uint64_t SiriMailModel.__deallocating_deinit()
{
  SiriMailModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25CF39C80()
{
  return swift_retain();
}

uint64_t sub_25CF39CCC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_25CF39D20())()
{
  return j_j__swift_endAccess;
}

id sub_25CF39D7C()
{
  return *(id *)(v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_snippetService);
}

uint64_t sub_25CF39D8C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SiriMailModel();
  uint64_t result = sub_25CF43088();
  *a1 = result;
  return result;
}

uint64_t sub_25CF39DCC()
{
  return sub_25CF39EA4(&qword_26A62FC10, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
}

uint64_t sub_25CF39E14()
{
  return sub_25CF39EA4(&qword_26A630038, MEMORY[0x263F706A0]);
}

uint64_t sub_25CF39E5C()
{
  return sub_25CF39EA4(&qword_26A62F028, MEMORY[0x263F706A0]);
}

uint64_t sub_25CF39EA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF39EEC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25CF39EF8()
{
  return type metadata accessor for SiriMailModel();
}

void sub_25CF39F00()
{
  sub_25CF3A128();
  if (v0 <= 0x3F)
  {
    sub_25CF3A1D8(319, &qword_26A630058, &qword_26A62FFC0, (void (*)(void))sub_25CF387B8);
    if (v1 <= 0x3F)
    {
      sub_25CF3A1D8(319, &qword_26A630060, &qword_26A62FD28, (void (*)(void))sub_25CF388AC);
      if (v2 <= 0x3F)
      {
        sub_25CF3A1D8(319, &qword_26A630068, &qword_26A62FB90, (void (*)(void))sub_25CF32C48);
        if (v3 <= 0x3F)
        {
          sub_25CF3A2A0();
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_25CF3A128()
{
  if (!qword_26A630050)
  {
    type metadata accessor for SiriMailModel();
    sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
    unint64_t v0 = sub_25CF43018();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A630050);
    }
  }
}

void sub_25CF3A1D8(uint64_t a1, unint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  if (!*a2)
  {
    type metadata accessor for SiriMailModel();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
    a4();
    unint64_t v7 = sub_25CF43018();
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_25CF3A2A0()
{
  if (!qword_26A630070)
  {
    type metadata accessor for SiriMailModel();
    sub_25CF42E08();
    sub_25CF39EA4(&qword_26A62FC60, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
    sub_25CF39EA4(&qword_26A62FDE8, MEMORY[0x263F70758]);
    unint64_t v0 = sub_25CF43018();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A630070);
    }
  }
}

uint64_t sub_25CF3A38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62FB90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  return MEMORY[0x270F26ED0](v2, v1, v3, a1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)(v3 + a3);
  *uint64_t v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_19(uint64_t result)
{
  void *v1 = result;
  return result;
}

void *OUTLINED_FUNCTION_20()
{
  return malloc(0x38uLL);
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_22()
{
  JUMPOUT(0x2611A3230);
}

void OUTLINED_FUNCTION_23(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 328) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_25CF42FC8();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_25CF42FC8();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return v0;
}

void OUTLINED_FUNCTION_42()
{
  *(void *)(v1 - 152) = *v0;
}

uint64_t *sub_25CF3A728(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 1;
    unint64_t v9 = a2[2];
    swift_bridgeObjectRetain();
    if (v9 >= 6)
    {
      a1[1] = *v8;
      a1[2] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)(a1 + 1) = *(_OWORD *)v8;
    }
    uint64_t v10 = (int *)type metadata accessor for WidgetMailbox();
    uint64_t v11 = v10[6];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_25CF42AA8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    uint64_t v16 = v10[7];
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = v10[8];
    uint64_t v21 = (uint64_t *)((char *)a1 + v20);
    uint64_t v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = v10[9];
    uint64_t v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = v10[10];
    uint64_t v29 = (uint64_t *)((char *)a1 + v28);
    uint64_t v30 = (uint64_t *)((char *)a2 + v28);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = v10[11];
    os_log_type_t v33 = (uint64_t *)((char *)a1 + v32);
    uint64_t v34 = (uint64_t *)((char *)a2 + v32);
    uint64_t v35 = v34[1];
    *os_log_type_t v33 = *v34;
    v33[1] = v35;
    uint64_t v36 = v10[12];
    id v37 = (uint64_t *)((char *)a1 + v36);
    os_log_type_t v38 = (uint64_t *)((char *)a2 + v36);
    uint64_t v39 = v38[1];
    *id v37 = *v38;
    v37[1] = v39;
    uint64_t v40 = *(int *)(a3 + 20);
    uint64_t v41 = (char *)a1 + v40;
    unint64_t v42 = (char *)a2 + v40;
    unint64_t v43 = *(uint64_t *)((char *)a2 + v40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v43 >= 2)
    {
      uint64_t v44 = *((void *)v42 + 1);
      *(void *)uint64_t v41 = v43;
      *((void *)v41 + 1) = v44;
      *((_WORD *)v41 + 8) = *((_WORD *)v42 + 8);
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
      *((_WORD *)v41 + 8) = *((_WORD *)v42 + 8);
    }
  }
  return a1;
}

unint64_t sub_25CF3A990(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16) >= 6uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(type metadata accessor for WidgetMailbox() + 24);
  uint64_t v5 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t result = *(void *)(a1 + *(int *)(a2 + 20));
  if (result >= 2)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_25CF3AAD4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2 + 1;
  unint64_t v7 = a2[2];
  swift_bridgeObjectRetain();
  if (v7 >= 6)
  {
    a1[1] = *v6;
    a1[2] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v6;
  }
  uint64_t v8 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v9 = v8[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  uint64_t v14 = v8[7];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v8[8];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v8[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = v8[10];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = v8[11];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  uint64_t v34 = v8[12];
  uint64_t v35 = (void *)((char *)a1 + v34);
  uint64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v37 = v36[1];
  void *v35 = *v36;
  v35[1] = v37;
  uint64_t v38 = *(int *)(a3 + 20);
  uint64_t v39 = (char *)a1 + v38;
  uint64_t v40 = (char *)a2 + v38;
  unint64_t v41 = *(void *)((char *)a2 + v38);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v41 >= 2)
  {
    uint64_t v42 = *((void *)v40 + 1);
    *(void *)uint64_t v39 = v41;
    *((void *)v39 + 1) = v42;
    *((_WORD *)v39 + 8) = *((_WORD *)v40 + 8);
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    *((_WORD *)v39 + 8) = *((_WORD *)v40 + 8);
  }
  return a1;
}

void *sub_25CF3ACF4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = a2[2];
  if (a1[2] < 6uLL)
  {
    if (v6 >= 6)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 < 6)
  {
    sub_25CF191C8((uint64_t)(a1 + 1), &qword_26A62F328);
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  unint64_t v7 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_13:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_14:
  uint64_t v16 = v7[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = v7[8];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = v7[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  void *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = v7[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = v7[11];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (void *)((char *)a2 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = v7[12];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = *(int *)(a3 + 20);
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  unint64_t v37 = *(void *)((char *)a2 + v34);
  if (*(void *)((char *)a1 + v34) >= 2uLL)
  {
    if (v37 >= 2)
    {
      *(void *)uint64_t v35 = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v41 = *((void *)v36 + 1);
      v35[16] = v36[16];
      *((void *)v35 + 1) = v41;
      v35[17] = v36[17];
    }
    else
    {
      sub_25CF191C8((uint64_t)a1 + v34, &qword_26A62F330);
      __int16 v39 = *((_WORD *)v36 + 8);
      *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
      *((_WORD *)v35 + 8) = v39;
    }
  }
  else if (v37 >= 2)
  {
    *(void *)uint64_t v35 = v37;
    uint64_t v40 = *((void *)v36 + 1);
    v35[16] = v36[16];
    *((void *)v35 + 1) = v40;
    v35[17] = v36[17];
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v38 = *(_OWORD *)v36;
    *((_WORD *)v35 + 8) = *((_WORD *)v36 + 8);
    *(_OWORD *)uint64_t v35 = v38;
  }
  return a1;
}

uint64_t sub_25CF3B0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  unint64_t v6 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v7 = v6[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + v6[7]) = *(_OWORD *)(a2 + v6[7]);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  *(_OWORD *)(a1 + v6[9]) = *(_OWORD *)(a2 + v6[9]);
  *(_OWORD *)(a1 + v6[10]) = *(_OWORD *)(a2 + v6[10]);
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(_OWORD *)(a1 + v6[12]) = *(_OWORD *)(a2 + v6[12]);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  return a1;
}

uint64_t sub_25CF3B218(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRelease();
  unint64_t v6 = a2 + 1;
  if (*(void *)(a1 + 16) < 6uLL) {
    goto LABEL_4;
  }
  unint64_t v7 = a2[2];
  if (v7 < 6)
  {
    sub_25CF191C8(a1 + 8, &qword_26A62F328);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v6;
    goto LABEL_6;
  }
  *(void *)(a1 + 8) = *(void *)v6;
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v8 = (int *)type metadata accessor for WidgetMailbox();
  uint64_t v9 = v8[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
LABEL_11:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_12:
  uint64_t v17 = v8[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v8[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  void *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = v8[9];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = v8[10];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)((char *)a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *uint64_t v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = v8[11];
  long long v38 = (void *)(a1 + v37);
  __int16 v39 = (void *)((char *)a2 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  *long long v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  uint64_t v42 = v8[12];
  unint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  uint64_t v46 = *v44;
  uint64_t v45 = v44[1];
  void *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  uint64_t v47 = *(int *)(a3 + 20);
  uint64_t v48 = a1 + v47;
  uint64_t v49 = (char *)a2 + v47;
  if (*(void *)(a1 + v47) >= 2uLL)
  {
    if (*(void *)v49 >= 2uLL)
    {
      *(void *)uint64_t v48 = *(void *)v49;
      swift_bridgeObjectRelease();
      *(void *)(v48 + 8) = *((void *)v49 + 1);
      *(unsigned char *)(v48 + 16) = v49[16];
      *(unsigned char *)(v48 + 17) = v49[17];
      return a1;
    }
    sub_25CF191C8(v48, &qword_26A62F330);
  }
  *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
  *(_WORD *)(v48 + 16) = *((_WORD *)v49 + 8);
  return a1;
}

uint64_t sub_25CF3B4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF3B508);
}

uint64_t sub_25CF3B508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for WidgetMailbox();
  OUTLINED_FUNCTION_1_0();
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
    int v10 = v9 - 2;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25CF3B5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF3B5B4);
}

void sub_25CF3B5B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for WidgetMailbox();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 + 1);
  }
}

uint64_t type metadata accessor for Snapshot()
{
  uint64_t result = qword_26A630078;
  if (!qword_26A630078) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25CF3B684()
{
  uint64_t result = type metadata accessor for WidgetMailbox();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t destroy for Snapshot.State(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s10SiriMailUI8SnapshotV5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for Snapshot.State(uint64_t a1, long long *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      uint64_t v7 = *((void *)a2 + 1);
      *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
      *(void *)(a1 + 8) = v7;
      *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v8 = *a2;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(void *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *((void *)a2 + 1);
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Snapshot.State(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Snapshot.State(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 18)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for Snapshot.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_WORD *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_25CF3B99C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_25CF3B9B4(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    *(_WORD *)(result + 16) = 0;
    *(void *)(result + 8) = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *(void *)__n128 result = v2;
  return result;
}

ValueMetadata *type metadata accessor for Snapshot.State()
{
  return &type metadata for Snapshot.State;
}

uint64_t sub_25CF3B9E8(uint64_t a1, uint64_t a2, __int16 a3, unint64_t a4, uint64_t a5, __int16 a6)
{
  if (!a1) {
    return !a4;
  }
  if (a1 == 1) {
    return a4 == 1;
  }
  if (a4 < 2) {
    return 0;
  }
  if ((sub_25CF22884(a1, a4) & 1) == 0) {
    return 0;
  }
  if (a3)
  {
    if (a6) {
      return ((a3 & 0x100) == 0) ^ ((unsigned __int16)(a6 & 0x100) >> 8);
    }
    return 0;
  }
  uint64_t result = 0;
  if ((a6 & 1) == 0 && a2 == a5) {
    return ((a3 & 0x100) == 0) ^ ((unsigned __int16)(a6 & 0x100) >> 8);
  }
  return result;
}

uint64_t sub_25CF3BA94(uint64_t a1, uint64_t a2)
{
  return sub_25CF3B9E8(*(void *)a1, *(void *)(a1 + 8), *(_WORD *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(_WORD *)(a2 + 16));
}

ValueMetadata *type metadata accessor for AmbientDrawable()
{
  return &type metadata for AmbientDrawable;
}

uint64_t sub_25CF3BAC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25CF3BADC@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A630088);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A630090);
  MEMORY[0x270FA5388](v8);
  int v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630098);
  sub_25CF3BD44();
  sub_25CF43838();
  if (a1)
  {
    id v11 = a1;
    char v12 = sub_25CF43C88();

    if (v12)
    {
      id v13 = v11;
      sub_25CF43C98();
    }
    char v14 = sub_25CF43608();
    sub_25CF430B8();
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v7, v4);
    uint64_t v23 = &v10[*(int *)(v8 + 36)];
    char *v23 = v14;
    *((void *)v23 + 1) = v16;
    *((void *)v23 + 2) = v18;
    *((void *)v23 + 3) = v20;
    *((void *)v23 + 4) = v22;
    v23[40] = 0;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_25CF3BD98((uint64_t)v10, a2);
  }
  else
  {
    sub_25CF43D18();
    sub_25CEFD0A0();
    uint64_t result = sub_25CF43298();
    __break(1u);
  }
  return result;
}

uint64_t sub_25CF3BD20()
{
  return sub_25CF431B8();
}

uint64_t sub_25CF3BD3C@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF3BADC(*v1, a1);
}

unint64_t sub_25CF3BD44()
{
  unint64_t result = qword_26A6300A0;
  if (!qword_26A6300A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A630098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6300A0);
  }
  return result;
}

uint64_t sub_25CF3BD98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A630090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25CF3BE04()
{
  unint64_t result = qword_26A6300A8;
  if (!qword_26A6300A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A630090);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A630098);
    sub_25CF3BD44();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6300A8);
  }
  return result;
}

void sub_25CF3BEB4()
{
  qword_26A6300B0 = 0;
  *(void *)algn_26A6300B8 = 0;
}

uint64_t *sub_25CF3BEC4()
{
  if (qword_26A62ED38 != -1) {
    swift_once();
  }
  return &qword_26A6300B0;
}

double sub_25CF3BF10(_OWORD *a1, void (*a2)(long long *__return_ptr))
{
  a2(&v4);
  double result = *(double *)&v4;
  *a1 = v4;
  return result;
}

__n128 sub_25CF3BF50@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = (__n128 *)sub_25CF3BEC4();
  __n128 result = *v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_25CF3BF88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25CF43938();
  uint64_t result = sub_25CF431E8();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_25CF3BFC8()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for SyncedSizePreferenceKey()
{
  return &type metadata for SyncedSizePreferenceKey;
}

uint64_t *sub_25CF3C074(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 1;
    unint64_t v9 = a2[2];
    swift_bridgeObjectRetain();
    if (v9 >= 6)
    {
      a1[1] = *v8;
      a1[2] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)(a1 + 1) = *(_OWORD *)v8;
    }
    uint64_t v10 = a3[6];
    id v11 = (char *)a1 + v10;
    char v12 = (char *)a2 + v10;
    uint64_t v13 = sub_25CF42AA8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
    }
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    uint64_t v17 = (uint64_t *)((char *)a1 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (uint64_t *)((char *)a1 + v16);
    uint64_t v21 = (uint64_t *)((char *)a2 + v16);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[9];
    uint64_t v24 = a3[10];
    uint64_t v25 = (uint64_t *)((char *)a1 + v23);
    uint64_t v26 = (uint64_t *)((char *)a2 + v23);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = (uint64_t *)((char *)a1 + v24);
    uint64_t v29 = (uint64_t *)((char *)a2 + v24);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = a3[11];
    uint64_t v32 = a3[12];
    uint64_t v33 = (uint64_t *)((char *)a1 + v31);
    uint64_t v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v35 = v34[1];
    *uint64_t v33 = *v34;
    v33[1] = v35;
    uint64_t v36 = (uint64_t *)((char *)a1 + v32);
    uint64_t v37 = (uint64_t *)((char *)a2 + v32);
    uint64_t v38 = v37[1];
    void *v36 = *v37;
    v36[1] = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25CF3C270(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16) >= 6uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_25CF3C378(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2 + 1;
  unint64_t v7 = a2[2];
  swift_bridgeObjectRetain();
  if (v7 >= 6)
  {
    a1[1] = *v6;
    a1[2] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v6;
  }
  uint64_t v8 = a3[6];
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)((char *)a1 + v13);
  uint64_t v16 = (void *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (void *)((char *)a1 + v14);
  uint64_t v19 = (void *)((char *)a2 + v14);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = a3[9];
  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)((char *)a1 + v21);
  uint64_t v24 = (void *)((char *)a2 + v21);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = (void *)((char *)a1 + v22);
  uint64_t v27 = (void *)((char *)a2 + v22);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = a3[11];
  uint64_t v30 = a3[12];
  uint64_t v31 = (void *)((char *)a1 + v29);
  uint64_t v32 = (void *)((char *)a2 + v29);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  uint64_t v34 = (void *)((char *)a1 + v30);
  uint64_t v35 = (void *)((char *)a2 + v30);
  uint64_t v36 = v35[1];
  void *v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25CF3C52C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = a2[2];
  if (a1[2] < 6uLL)
  {
    if (v6 >= 6)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 < 6)
  {
    sub_25CF3C824((uint64_t)(a1 + 1));
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_13;
  }
  if (v12)
  {
LABEL_13:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_14:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  void *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[12];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25CF3C824(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F328);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CF3C884(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  return a1;
}

uint64_t sub_25CF3C9B0(uint64_t a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2 + 1;
  if (*(void *)(a1 + 16) < 6uLL) {
    goto LABEL_4;
  }
  unint64_t v7 = a2[2];
  if (v7 < 6)
  {
    sub_25CF3C824(a1 + 8);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v6;
    goto LABEL_6;
  }
  *(void *)(a1 + 8) = *(void *)v6;
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_11;
  }
  if (v13)
  {
LABEL_11:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
LABEL_12:
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  void *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *uint64_t v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[11];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[12];
  uint64_t v42 = (void *)(a1 + v41);
  unint64_t v43 = (void *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25CF3CC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF3CC24);
}

uint64_t sub_25CF3CC24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_25CF3CCBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF3CCD0);
}

void sub_25CF3CCD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  }
}

uint64_t type metadata accessor for WidgetMailbox()
{
  uint64_t result = qword_26A6300C8;
  if (!qword_26A6300C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25CF3CDAC()
{
  sub_25CF3CE60();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25CF3CE60()
{
  if (!qword_26A6300D8)
  {
    sub_25CF42AA8();
    unint64_t v0 = sub_25CF43EA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6300D8);
    }
  }
}

uint64_t sub_25CF3CEB8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      return !a4;
    case 1:
      return a4 == 1;
    case 2:
      return a4 == 2;
    case 3:
      return a4 == 3;
    case 4:
      return a4 == 4;
    case 5:
      return a4 == 5;
    default:
      if (a4 < 6) {
        return 0;
      }
      if (a1 == a3 && a2 == a4) {
        return 1;
      }
      else {
        return sub_25CF44148();
      }
  }
}

uint64_t sub_25CF3CF6C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  switch(v2)
  {
    case 0uLL:
      uint64_t v3 = *(int *)(type metadata accessor for WidgetMailbox() + 32);
      goto LABEL_9;
    case 1uLL:
      uint64_t v3 = *(int *)(type metadata accessor for WidgetMailbox() + 36);
      goto LABEL_9;
    case 2uLL:
      uint64_t v3 = *(int *)(type metadata accessor for WidgetMailbox() + 40);
      goto LABEL_9;
    case 3uLL:
      uint64_t v3 = *(int *)(type metadata accessor for WidgetMailbox() + 44);
      goto LABEL_9;
    case 4uLL:
      uint64_t v3 = *(int *)(type metadata accessor for WidgetMailbox() + 28);
      goto LABEL_9;
    case 5uLL:
      uint64_t v3 = *(int *)(type metadata accessor for WidgetMailbox() + 48);
LABEL_9:
      uint64_t v4 = *(void *)(v0 + v3);
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = *(void *)(v0 + 8);
      break;
  }
  sub_25CF3D06C(v1, v2);
  return v4;
}

uint64_t sub_25CF3D06C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 6) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t destroy for WidgetMailbox.Configuration(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s10SiriMailUI13WidgetMailboxV13ConfigurationOwCP_0(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for WidgetMailbox.Configuration(void *a1, void *a2)
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

uint64_t assignWithTake for WidgetMailbox.Configuration(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for WidgetMailbox.Configuration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF9 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483642);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 5;
  if (v4 >= 7) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WidgetMailbox.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 5;
    }
  }
  return result;
}

uint64_t sub_25CF3D298(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25CF3D2B0(void *result, int a2)
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

ValueMetadata *type metadata accessor for WidgetMailbox.Configuration()
{
  return &type metadata for WidgetMailbox.Configuration;
}

uint64_t sub_25CF3D2E0(uint64_t *a1, uint64_t a2)
{
  return sub_25CF3CEB8(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

uint64_t sub_25CF3D2F4()
{
  uint64_t v0 = sub_25CF42B38();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  sub_25CF42B28();
  type metadata accessor for WidgetMessage();
  char v7 = sub_25CF42B18();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  if (v7)
  {
    if (qword_26A62ED48 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_26A6300E8;
  }
  else
  {
    if (qword_26A62ED40 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_26A6300E0;
  }
  uint64_t v9 = (void *)sub_25CF42AB8();
  id v10 = objc_msgSend(v8, sel_stringFromDate_, v9);

  uint64_t v11 = sub_25CF43D88();
  return v11;
}

uint64_t WidgetMessage.debugDescription.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3 - v2;
  sub_25CF43F18();
  sub_25CF43DA8();
  swift_bridgeObjectRetain();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6300F0);
  OUTLINED_FUNCTION_26();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_28_0();
  uint64_t v5 = (int *)type metadata accessor for WidgetMessage();
  sub_25CF42AD8();
  sub_25CF40C84(&qword_26A6300F8, MEMORY[0x263F07490]);
  sub_25CF44118();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  OUTLINED_FUNCTION_21_0(v5[11]);
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  OUTLINED_FUNCTION_21_0(v5[12]);
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  sub_25CF43F18();
  sub_25CF43DA8();
  OUTLINED_FUNCTION_21_0(v5[13]);
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  sub_25CF3D988(v0 + v5[14], v4);
  sub_25CF43D98();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  OUTLINED_FUNCTION_21_0(v5[15]);
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  sub_25CF43DA8();
  swift_bridgeObjectRetain();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_28_0();
  swift_bridgeObjectRetain();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25CF43DA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for WidgetMessage()
{
  uint64_t result = qword_26A630148;
  if (!qword_26A630148) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25CF3D988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t WidgetMessage.id.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.sender.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.subject.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.generatedSummary.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.messageBody.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.dateReceived.getter()
{
  type metadata accessor for WidgetMessage();
  sub_25CF42AD8();
  OUTLINED_FUNCTION_2();
  uint64_t v0 = OUTLINED_FUNCTION_12_4();
  return v1(v0);
}

uint64_t WidgetMessage.isVIP.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WidgetMessage() + 40));
}

uint64_t WidgetMessage.isUnread.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WidgetMessage() + 44));
}

uint64_t WidgetMessage.hasAttachments.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WidgetMessage() + 48));
}

uint64_t WidgetMessage.isBlocked.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WidgetMessage() + 52));
}

uint64_t WidgetMessage.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for WidgetMessage() + 56);
  return sub_25CF3D988(v3, a1);
}

uint64_t WidgetMessage.isSpearfish.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WidgetMessage() + 60));
}

uint64_t WidgetMessage.contactId.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.contactId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for WidgetMessage() + 64));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*WidgetMessage.contactId.modify())()
{
  return nullsub_1;
}

uint64_t WidgetMessage.toRecipients.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.toRecipients.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for WidgetMessage() + 68));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*WidgetMessage.toRecipients.modify())()
{
  return nullsub_1;
}

uint64_t WidgetMessage.hasNextWindow.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WidgetMessage() + 72));
}

uint64_t WidgetMessage.readLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.deleteLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.replyLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.nextLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.seeAllLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.moreInMailLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.vipLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.inboxesLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.inboxLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.flaggedLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.unreadLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.todayLabel.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.emptySender.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.emptySubject.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.emptyBody.getter()
{
  return OUTLINED_FUNCTION_12_4();
}

uint64_t WidgetMessage.init(id:sender:subject:generatedSummary:messageBody:dateReceived:isVIP:isUnread:hasAttachments:isBlocked:url:isSpearfish:contactId:toRecipients:hasNextWindow:readLabel:deleteLabel:replyLabel:nextLabel:seeAllLabel:moreInMailLabel:vipLabel:inboxesLabel:inboxLabel:flaggedLabel:unreadLabel:todayLabel:emptySender:emptySubject:emptyBody:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, char a13, char a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  unint64_t v54 = (int *)type metadata accessor for WidgetMessage();
  uint64_t v55 = (char *)a9 + v54[9];
  sub_25CF42AD8();
  OUTLINED_FUNCTION_2();
  (*(void (**)(char *, uint64_t))(v56 + 32))(v55, a12);
  *((unsigned char *)a9 + v54[10]) = a13;
  *((unsigned char *)a9 + v54[11]) = a14;
  *((unsigned char *)a9 + v54[12]) = a15;
  *((unsigned char *)a9 + v54[13]) = a16;
  uint64_t result = sub_25CF3E404(a17, (uint64_t)a9 + v54[14]);
  *((unsigned char *)a9 + v54[15]) = a18;
  unint64_t v58 = (void *)((char *)a9 + v54[16]);
  *unint64_t v58 = a19;
  v58[1] = a20;
  uint64_t v59 = (void *)((char *)a9 + v54[17]);
  *uint64_t v59 = a21;
  v59[1] = a22;
  *((unsigned char *)a9 + v54[18]) = a23;
  unint64_t v60 = (void *)((char *)a9 + v54[19]);
  *unint64_t v60 = a24;
  v60[1] = a25;
  uint64_t v61 = (void *)((char *)a9 + v54[20]);
  *uint64_t v61 = a26;
  v61[1] = a27;
  uint64_t v62 = (void *)((char *)a9 + v54[21]);
  *uint64_t v62 = a28;
  v62[1] = a29;
  unint64_t v63 = (void *)((char *)a9 + v54[22]);
  *unint64_t v63 = a30;
  v63[1] = a31;
  uint64_t v64 = (void *)((char *)a9 + v54[23]);
  *uint64_t v64 = a32;
  v64[1] = a33;
  uint64_t v65 = (void *)((char *)a9 + v54[24]);
  *uint64_t v65 = a34;
  v65[1] = a35;
  uint64_t v66 = (void *)((char *)a9 + v54[25]);
  *uint64_t v66 = a36;
  v66[1] = a37;
  uint64_t v67 = (void *)((char *)a9 + v54[26]);
  *uint64_t v67 = a38;
  v67[1] = a39;
  uint64_t v68 = (void *)((char *)a9 + v54[27]);
  *uint64_t v68 = a40;
  v68[1] = a41;
  uint64_t v69 = (void *)((char *)a9 + v54[28]);
  void *v69 = a42;
  v69[1] = a43;
  uint64_t v70 = (void *)((char *)a9 + v54[29]);
  void *v70 = a44;
  v70[1] = a45;
  uint64_t v71 = (void *)((char *)a9 + v54[30]);
  void *v71 = a46;
  v71[1] = a47;
  uint64_t v72 = (void *)((char *)a9 + v54[31]);
  *uint64_t v72 = a48;
  v72[1] = a49;
  uint64_t v73 = (void *)((char *)a9 + v54[32]);
  *uint64_t v73 = a50;
  v73[1] = a51;
  uint64_t v74 = (void *)((char *)a9 + v54[33]);
  *uint64_t v74 = a52;
  v74[1] = a53;
  return result;
}

uint64_t sub_25CF3E404(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static WidgetMessage.__derived_struct_equals(_:_:)(void *a1, void *a2)
{
  uint64_t v6 = sub_25CF42AA8();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_2();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A630100);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_9_0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = &v129[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = &v129[-v17];
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v129[-v19];
  BOOL v21 = *a1 == *a2 && a1[1] == a2[1];
  if (!v21)
  {
    sub_25CF44148();
    char v22 = OUTLINED_FUNCTION_10_5();
    if ((v23 & 1) == 0) {
      return v22 & 1;
    }
  }
  uint64_t v24 = a1[3];
  uint64_t v25 = a2[3];
  if (v24)
  {
    if (!v25) {
      goto LABEL_74;
    }
    if (a1[2] != a2[2] || v24 != v25)
    {
      sub_25CF44148();
      char v22 = OUTLINED_FUNCTION_10_5();
      if ((v27 & 1) == 0) {
        return v22 & 1;
      }
    }
  }
  else if (v25)
  {
    goto LABEL_74;
  }
  uint64_t v28 = a1[5];
  uint64_t v29 = a2[5];
  if (v28)
  {
    if (!v29) {
      goto LABEL_74;
    }
    if (a1[4] != a2[4] || v28 != v29)
    {
      sub_25CF44148();
      char v22 = OUTLINED_FUNCTION_10_5();
      if ((v31 & 1) == 0) {
        return v22 & 1;
      }
    }
  }
  else if (v29)
  {
    goto LABEL_74;
  }
  uint64_t v32 = a1[7];
  uint64_t v33 = a2[7];
  if (v32)
  {
    if (!v33) {
      goto LABEL_74;
    }
    if (a1[6] != a2[6] || v32 != v33)
    {
      sub_25CF44148();
      char v22 = OUTLINED_FUNCTION_10_5();
      if ((v35 & 1) == 0) {
        return v22 & 1;
      }
    }
  }
  else if (v33)
  {
    goto LABEL_74;
  }
  uint64_t v36 = a1[9];
  uint64_t v37 = a2[9];
  if (v36)
  {
    if (!v37) {
      goto LABEL_74;
    }
    if (a1[8] != a2[8] || v36 != v37)
    {
      sub_25CF44148();
      char v22 = OUTLINED_FUNCTION_10_5();
      if ((v39 & 1) == 0) {
        return v22 & 1;
      }
    }
  }
  else if (v37)
  {
    goto LABEL_74;
  }
  uint64_t v131 = type metadata accessor for WidgetMessage();
  if ((sub_25CF42AC8() & 1) == 0) {
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_17_0();
  if (!v21) {
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_17_0();
  if (!v21) {
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_17_0();
  if (!v21) {
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_17_0();
  if (!v21) {
    goto LABEL_74;
  }
  sub_25CF3D988((uint64_t)a1 + *(int *)(v40 + 56), (uint64_t)v20);
  sub_25CF3D988((uint64_t)a2 + *(int *)(v131 + 56), (uint64_t)v18);
  uint64_t v41 = v2 + *(int *)(v10 + 48);
  sub_25CF3D988((uint64_t)v20, v2);
  sub_25CF3D988((uint64_t)v18, v41);
  OUTLINED_FUNCTION_27_0(v2);
  if (v21)
  {
    sub_25CEFDA54((uint64_t)v18, &qword_26A62F228);
    sub_25CEFDA54((uint64_t)v20, &qword_26A62F228);
    OUTLINED_FUNCTION_27_0(v41);
    if (v21)
    {
      sub_25CEFDA54(v2, &qword_26A62F228);
      goto LABEL_61;
    }
LABEL_59:
    sub_25CEFDA54(v2, &qword_26A630100);
    goto LABEL_74;
  }
  sub_25CF3D988(v2, (uint64_t)v15);
  OUTLINED_FUNCTION_27_0(v41);
  if (v42)
  {
    sub_25CEFDA54((uint64_t)v18, &qword_26A62F228);
    sub_25CEFDA54((uint64_t)v20, &qword_26A62F228);
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v15, v6);
    goto LABEL_59;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v3, v41, v6);
  sub_25CF40C84(&qword_26A630108, MEMORY[0x263F06EA8]);
  int v130 = sub_25CF43D58();
  unint64_t v43 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v43(v3, v6);
  sub_25CEFDA54((uint64_t)v18, &qword_26A62F228);
  sub_25CEFDA54((uint64_t)v20, &qword_26A62F228);
  v43((uint64_t)v15, v6);
  sub_25CEFDA54(v2, &qword_26A62F228);
  if ((v130 & 1) == 0) {
    goto LABEL_74;
  }
LABEL_61:
  OUTLINED_FUNCTION_17_0();
  if (!v21) {
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_2_8(*(int *)(v44 + 64));
  if (!v21 || v45 != v46)
  {
    sub_25CF44148();
    char v22 = OUTLINED_FUNCTION_6_6();
    if ((v49 & 1) == 0) {
      return v22 & 1;
    }
  }
  OUTLINED_FUNCTION_2_8(*(int *)(v47 + 68));
  if (!v21 || v50 != v51)
  {
    sub_25CF44148();
    char v22 = OUTLINED_FUNCTION_6_6();
    if ((v53 & 1) == 0) {
      return v22 & 1;
    }
  }
  OUTLINED_FUNCTION_17_0();
  if (!v21)
  {
LABEL_74:
    char v22 = 0;
    return v22 & 1;
  }
  OUTLINED_FUNCTION_2_8(*(int *)(v54 + 76));
  BOOL v59 = v21 && v56 == v57;
  if (v59 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v60 & 1) != 0))
  {
    OUTLINED_FUNCTION_2_8(*(int *)(v58 + 80));
    BOOL v64 = v21 && v61 == v62;
    if (v64 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v65 & 1) != 0))
    {
      OUTLINED_FUNCTION_2_8(*(int *)(v63 + 84));
      BOOL v69 = v21 && v66 == v67;
      if (v69 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v70 & 1) != 0))
      {
        OUTLINED_FUNCTION_2_8(*(int *)(v68 + 88));
        BOOL v74 = v21 && v71 == v72;
        if (v74 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v75 & 1) != 0))
        {
          OUTLINED_FUNCTION_2_8(*(int *)(v73 + 92));
          BOOL v79 = v21 && v76 == v77;
          if (v79 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v80 & 1) != 0))
          {
            OUTLINED_FUNCTION_2_8(*(int *)(v78 + 96));
            BOOL v84 = v21 && v81 == v82;
            if (v84 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v85 & 1) != 0))
            {
              OUTLINED_FUNCTION_2_8(*(int *)(v83 + 100));
              BOOL v89 = v21 && v86 == v87;
              if (v89 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v90 & 1) != 0))
              {
                OUTLINED_FUNCTION_2_8(*(int *)(v88 + 104));
                BOOL v94 = v21 && v91 == v92;
                if (v94 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v95 & 1) != 0))
                {
                  OUTLINED_FUNCTION_2_8(*(int *)(v93 + 108));
                  BOOL v99 = v21 && v96 == v97;
                  if (v99 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v100 & 1) != 0))
                  {
                    OUTLINED_FUNCTION_2_8(*(int *)(v98 + 112));
                    BOOL v104 = v21 && v101 == v102;
                    if (v104 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v105 & 1) != 0))
                    {
                      OUTLINED_FUNCTION_2_8(*(int *)(v103 + 116));
                      BOOL v109 = v21 && v106 == v107;
                      if (v109 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v110 & 1) != 0))
                      {
                        OUTLINED_FUNCTION_2_8(*(int *)(v108 + 120));
                        BOOL v114 = v21 && v111 == v112;
                        if (v114 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v115 & 1) != 0))
                        {
                          OUTLINED_FUNCTION_2_8(*(int *)(v113 + 124));
                          BOOL v119 = v21 && v116 == v117;
                          if (v119 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v120 & 1) != 0))
                          {
                            OUTLINED_FUNCTION_2_8(*(int *)(v118 + 128));
                            BOOL v124 = v21 && v121 == v122;
                            if (v124 || (sub_25CF44148(), char v22 = OUTLINED_FUNCTION_6_6(), (v125 & 1) != 0))
                            {
                              OUTLINED_FUNCTION_2_8(*(int *)(v123 + 132));
                              if (v21 && v126 == v127) {
                                char v22 = 1;
                              }
                              else {
                                char v22 = sub_25CF44148();
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
      }
    }
  }
  return v22 & 1;
}

uint64_t sub_25CF3EB28(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_25CF44148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7265646E6573 && a2 == 0xE600000000000000;
    if (v6 || (sub_25CF44148() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
      if (v7 || (sub_25CF44148() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000025CF4F4C0 || (sub_25CF44148() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x426567617373656DLL && a2 == 0xEB0000000079646FLL;
        if (v8 || (sub_25CF44148() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x6563655265746164 && a2 == 0xEC00000064657669;
          if (v9 || (sub_25CF44148() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x5049567369 && a2 == 0xE500000000000000;
            if (v10 || (sub_25CF44148() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x646165726E557369 && a2 == 0xE800000000000000;
              if (v11 || (sub_25CF44148() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                BOOL v12 = a1 == 0x6361747441736168 && a2 == 0xEE0073746E656D68;
                if (v12 || (sub_25CF44148() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  BOOL v13 = a1 == 0x656B636F6C427369 && a2 == 0xE900000000000064;
                  if (v13 || (sub_25CF44148() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else
                  {
                    BOOL v14 = a1 == 7107189 && a2 == 0xE300000000000000;
                    if (v14 || (sub_25CF44148() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 10;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x6672616570537369 && a2 == 0xEB00000000687369;
                      if (v15 || (sub_25CF44148() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 11;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x49746361746E6F63 && a2 == 0xE900000000000064;
                        if (v16 || (sub_25CF44148() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 12;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x6970696365526F74 && a2 == 0xEC00000073746E65;
                          if (v17 || (sub_25CF44148() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 13;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x577478654E736168 && a2 == 0xED0000776F646E69;
                            if (v18 || (sub_25CF44148() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 14;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x6562614C64616572 && a2 == 0xE90000000000006CLL;
                              if (v19 || (sub_25CF44148() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 15;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x614C6574656C6564 && a2 == 0xEB000000006C6562;
                                if (v20 || (sub_25CF44148() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 16;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x62614C796C706572 && a2 == 0xEA00000000006C65;
                                  if (v21 || (sub_25CF44148() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 17;
                                  }
                                  else
                                  {
                                    BOOL v22 = a1 == 0x6562614C7478656ELL && a2 == 0xE90000000000006CLL;
                                    if (v22 || (sub_25CF44148() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 18;
                                    }
                                    else
                                    {
                                      BOOL v23 = a1 == 0x614C6C6C41656573 && a2 == 0xEB000000006C6562;
                                      if (v23 || (sub_25CF44148() & 1) != 0)
                                      {
                                        swift_bridgeObjectRelease();
                                        return 19;
                                      }
                                      else
                                      {
                                        BOOL v24 = a1 == 0x614D6E4965726F6DLL && a2 == 0xEF6C6562614C6C69;
                                        if (v24 || (sub_25CF44148() & 1) != 0)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 20;
                                        }
                                        else
                                        {
                                          BOOL v25 = a1 == 0x6C6562614C706976 && a2 == 0xE800000000000000;
                                          if (v25 || (sub_25CF44148() & 1) != 0)
                                          {
                                            swift_bridgeObjectRelease();
                                            return 21;
                                          }
                                          else
                                          {
                                            BOOL v26 = a1 == 0x4C7365786F626E69 && a2 == 0xEC0000006C656261;
                                            if (v26 || (sub_25CF44148() & 1) != 0)
                                            {
                                              swift_bridgeObjectRelease();
                                              return 22;
                                            }
                                            else
                                            {
                                              BOOL v27 = a1 == 0x62614C786F626E69 && a2 == 0xEA00000000006C65;
                                              if (v27 || (sub_25CF44148() & 1) != 0)
                                              {
                                                swift_bridgeObjectRelease();
                                                return 23;
                                              }
                                              else
                                              {
                                                BOOL v28 = a1 == 0x4C64656767616C66 && a2 == 0xEC0000006C656261;
                                                if (v28 || (sub_25CF44148() & 1) != 0)
                                                {
                                                  swift_bridgeObjectRelease();
                                                  return 24;
                                                }
                                                else
                                                {
                                                  BOOL v29 = a1 == 0x614C646165726E75 && a2 == 0xEB000000006C6562;
                                                  if (v29 || (sub_25CF44148() & 1) != 0)
                                                  {
                                                    swift_bridgeObjectRelease();
                                                    return 25;
                                                  }
                                                  else
                                                  {
                                                    BOOL v30 = a1 == 0x62614C7961646F74 && a2 == 0xEA00000000006C65;
                                                    if (v30 || (sub_25CF44148() & 1) != 0)
                                                    {
                                                      swift_bridgeObjectRelease();
                                                      return 26;
                                                    }
                                                    else
                                                    {
                                                      BOOL v31 = a1 == 0x6E65537974706D65 && a2 == 0xEB00000000726564;
                                                      if (v31 || (sub_25CF44148() & 1) != 0)
                                                      {
                                                        swift_bridgeObjectRelease();
                                                        return 27;
                                                      }
                                                      else
                                                      {
                                                        BOOL v32 = a1 == 0x6275537974706D65 && a2 == 0xEC0000007463656ALL;
                                                        if (v32 || (sub_25CF44148() & 1) != 0)
                                                        {
                                                          swift_bridgeObjectRelease();
                                                          return 28;
                                                        }
                                                        else if (a1 == 0x646F427974706D65 {
                                                               && a2 == 0xE900000000000079)
                                                        }
                                                        {
                                                          swift_bridgeObjectRelease();
                                                          return 29;
                                                        }
                                                        else
                                                        {
                                                          char v34 = sub_25CF44148();
                                                          swift_bridgeObjectRelease();
                                                          if (v34) {
                                                            return 29;
                                                          }
                                                          else {
                                                            return 30;
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
          }
        }
      }
    }
  }
}

uint64_t sub_25CF3F7D8()
{
  return 30;
}

uint64_t sub_25CF3F7E0(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      return 0x7265646E6573;
    case 2:
      return 0x7463656A627573;
    case 3:
      return 0xD000000000000010;
    case 4:
      return 0x426567617373656DLL;
    case 5:
      return 0x6563655265746164;
    case 6:
      return 0x5049567369;
    case 7:
      return 0x646165726E557369;
    case 8:
      return 0x6361747441736168;
    case 9:
      return 0x656B636F6C427369;
    case 10:
      return 7107189;
    case 11:
      return 0x6672616570537369;
    case 12:
      return 0x49746361746E6F63;
    case 13:
      return 0x6970696365526F74;
    case 14:
      return 0x577478654E736168;
    case 15:
      unsigned int v3 = 1684104562;
      return v3 | 0x6562614C00000000;
    case 16:
      uint64_t v4 = 0x6574656C6564;
      goto LABEL_30;
    case 17:
      uint64_t v5 = 1819305330;
      goto LABEL_32;
    case 18:
      unsigned int v3 = 1954047342;
      return v3 | 0x6562614C00000000;
    case 19:
      uint64_t v4 = 0x6C6C41656573;
      goto LABEL_30;
    case 20:
      return 0x614D6E4965726F6DLL;
    case 21:
      return 0x6C6562614C706976;
    case 22:
      return 0x4C7365786F626E69;
    case 23:
      unint64_t v6 = 0x4C786F626E69;
      goto LABEL_33;
    case 24:
      return 0x4C64656767616C66;
    case 25:
      uint64_t v4 = 0x646165726E75;
LABEL_30:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x614C000000000000;
      break;
    case 26:
      uint64_t v5 = 1633972084;
LABEL_32:
      unint64_t v6 = v5 & 0xFFFF0000FFFFFFFFLL | 0x4C7900000000;
LABEL_33:
      uint64_t result = v6 & 0xFFFFFFFFFFFFLL | 0x6261000000000000;
      break;
    case 27:
      uint64_t result = 0x6E65537974706D65;
      break;
    case 28:
      uint64_t result = 0x6275537974706D65;
      break;
    case 29:
      uint64_t result = 0x646F427974706D65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF3FB84()
{
  return sub_25CF3F7E0(*v0);
}

uint64_t sub_25CF3FB8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF3EB28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF3FBB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF3F7D8();
  *a1 = result;
  return result;
}

uint64_t sub_25CF3FBDC(uint64_t a1)
{
  unint64_t v2 = sub_25CF40098();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF3FC18(uint64_t a1)
{
  unint64_t v2 = sub_25CF40098();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WidgetMessage.encode(to:)(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A630110);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF40098();
  sub_25CF441A8();
  sub_25CF440D8();
  if (!v2)
  {
    OUTLINED_FUNCTION_14_0(v4[2], v4[3], 1);
    OUTLINED_FUNCTION_14_0(v4[4], v4[5], 2);
    OUTLINED_FUNCTION_14_0(v4[6], v4[7], 3);
    OUTLINED_FUNCTION_14_0(v4[8], v4[9], 4);
    BOOL v10 = (int *)type metadata accessor for WidgetMessage();
    sub_25CF42AD8();
    sub_25CF40C84(&qword_26A630120, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_22_0();
    sub_25CF44108();
    OUTLINED_FUNCTION_9_5(*((unsigned __int8 *)v4 + v10[10]), 6);
    OUTLINED_FUNCTION_9_5(*((unsigned __int8 *)v4 + v10[11]), 7);
    OUTLINED_FUNCTION_9_5(*((unsigned __int8 *)v4 + v10[12]), 8);
    OUTLINED_FUNCTION_9_5(*((unsigned __int8 *)v4 + v10[13]), 9);
    sub_25CF42AA8();
    sub_25CF40C84(&qword_26A630128, MEMORY[0x263F06EA8]);
    OUTLINED_FUNCTION_22_0();
    sub_25CF440C8();
    OUTLINED_FUNCTION_9_5(*((unsigned __int8 *)v4 + v10[15]), 11);
    OUTLINED_FUNCTION_11_4(v10[16]);
    OUTLINED_FUNCTION_1_6(12);
    OUTLINED_FUNCTION_11_4(v10[17]);
    OUTLINED_FUNCTION_1_6(13);
    OUTLINED_FUNCTION_9_5(*((unsigned __int8 *)v4 + v10[18]), 14);
    OUTLINED_FUNCTION_11_4(v10[19]);
    OUTLINED_FUNCTION_1_6(15);
    OUTLINED_FUNCTION_11_4(v10[20]);
    OUTLINED_FUNCTION_1_6(16);
    OUTLINED_FUNCTION_11_4(v10[21]);
    OUTLINED_FUNCTION_1_6(17);
    OUTLINED_FUNCTION_11_4(v10[22]);
    OUTLINED_FUNCTION_1_6(18);
    OUTLINED_FUNCTION_11_4(v10[23]);
    OUTLINED_FUNCTION_1_6(19);
    OUTLINED_FUNCTION_11_4(v10[24]);
    OUTLINED_FUNCTION_1_6(20);
    OUTLINED_FUNCTION_11_4(v10[25]);
    OUTLINED_FUNCTION_1_6(21);
    OUTLINED_FUNCTION_11_4(v10[26]);
    OUTLINED_FUNCTION_1_6(22);
    OUTLINED_FUNCTION_11_4(v10[27]);
    OUTLINED_FUNCTION_1_6(23);
    OUTLINED_FUNCTION_11_4(v10[28]);
    OUTLINED_FUNCTION_1_6(24);
    OUTLINED_FUNCTION_11_4(v10[29]);
    OUTLINED_FUNCTION_1_6(25);
    OUTLINED_FUNCTION_11_4(v10[30]);
    OUTLINED_FUNCTION_1_6(26);
    OUTLINED_FUNCTION_11_4(v10[31]);
    OUTLINED_FUNCTION_1_6(27);
    OUTLINED_FUNCTION_11_4(v10[32]);
    OUTLINED_FUNCTION_1_6(28);
    OUTLINED_FUNCTION_11_4(v10[33]);
    OUTLINED_FUNCTION_1_6(29);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v3, v6);
}

unint64_t sub_25CF40098()
{
  unint64_t result = qword_26A630118;
  if (!qword_26A630118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A630118);
  }
  return result;
}

uint64_t WidgetMessage.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6 - v5;
  sub_25CF42AD8();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v9;
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A630130);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v62 = (int *)type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v61 = (uint64_t *)(v13 - v12);
  uint64_t v60 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CF40098();
  sub_25CF44198();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  *uint64_t v61 = sub_25CF44058();
  v61[1] = v14;
  v61[2] = OUTLINED_FUNCTION_20_0(1);
  v61[3] = v15;
  v61[4] = OUTLINED_FUNCTION_20_0(2);
  v61[5] = v16;
  v61[6] = OUTLINED_FUNCTION_20_0(3);
  v61[7] = v17;
  v61[8] = OUTLINED_FUNCTION_20_0(4);
  v61[9] = v18;
  sub_25CF40C84(&qword_26A630138, MEMORY[0x263F07490]);
  sub_25CF44088();
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))((char *)v61 + v62[9], v2, v59);
  *((unsigned char *)v61 + v62[10]) = sub_25CF44068() & 1;
  *((unsigned char *)v61 + v62[11]) = sub_25CF44068() & 1;
  *((unsigned char *)v61 + v62[12]) = sub_25CF44068() & 1;
  *((unsigned char *)v61 + v62[13]) = sub_25CF44068() & 1;
  sub_25CF42AA8();
  sub_25CF40C84(&qword_26A630140, MEMORY[0x263F06EA8]);
  sub_25CF44048();
  sub_25CF3E404(v7, (uint64_t)v61 + v62[14]);
  *((unsigned char *)v61 + v62[15]) = OUTLINED_FUNCTION_25_0(11) & 1;
  uint64_t v19 = OUTLINED_FUNCTION_3_8(12);
  OUTLINED_FUNCTION_13_2(v19, v20, v62[16]);
  uint64_t v21 = OUTLINED_FUNCTION_3_8(13);
  OUTLINED_FUNCTION_13_2(v21, v22, v62[17]);
  *((unsigned char *)v61 + v62[18]) = OUTLINED_FUNCTION_25_0(14) & 1;
  uint64_t v23 = OUTLINED_FUNCTION_3_8(15);
  OUTLINED_FUNCTION_13_2(v23, v24, v62[19]);
  uint64_t v25 = OUTLINED_FUNCTION_3_8(16);
  OUTLINED_FUNCTION_13_2(v25, v26, v62[20]);
  uint64_t v27 = OUTLINED_FUNCTION_3_8(17);
  OUTLINED_FUNCTION_13_2(v27, v28, v62[21]);
  uint64_t v29 = OUTLINED_FUNCTION_3_8(18);
  OUTLINED_FUNCTION_13_2(v29, v30, v62[22]);
  uint64_t v31 = OUTLINED_FUNCTION_3_8(19);
  OUTLINED_FUNCTION_13_2(v31, v32, v62[23]);
  uint64_t v33 = OUTLINED_FUNCTION_3_8(20);
  OUTLINED_FUNCTION_13_2(v33, v34, v62[24]);
  uint64_t v35 = OUTLINED_FUNCTION_3_8(21);
  OUTLINED_FUNCTION_13_2(v35, v36, v62[25]);
  uint64_t v37 = OUTLINED_FUNCTION_3_8(22);
  OUTLINED_FUNCTION_13_2(v37, v38, v62[26]);
  uint64_t v39 = OUTLINED_FUNCTION_3_8(23);
  OUTLINED_FUNCTION_13_2(v39, v40, v62[27]);
  uint64_t v41 = OUTLINED_FUNCTION_3_8(24);
  OUTLINED_FUNCTION_13_2(v41, v42, v62[28]);
  uint64_t v43 = OUTLINED_FUNCTION_3_8(25);
  OUTLINED_FUNCTION_13_2(v43, v44, v62[29]);
  uint64_t v45 = OUTLINED_FUNCTION_3_8(26);
  OUTLINED_FUNCTION_13_2(v45, v46, v62[30]);
  uint64_t v47 = OUTLINED_FUNCTION_3_8(27);
  OUTLINED_FUNCTION_13_2(v47, v48, v62[31]);
  uint64_t v49 = OUTLINED_FUNCTION_3_8(28);
  OUTLINED_FUNCTION_13_2(v49, v50, v62[32]);
  uint64_t v51 = OUTLINED_FUNCTION_3_8(29);
  uint64_t v53 = v52;
  uint64_t v54 = OUTLINED_FUNCTION_0_2();
  v55(v54);
  uint64_t v56 = (uint64_t *)((char *)v61 + v62[33]);
  *uint64_t v56 = v51;
  v56[1] = v53;
  sub_25CF22C98((uint64_t)v61, 0);
  __swift_destroy_boxed_opaque_existential_1(v60);
  return sub_25CF22CFC((uint64_t)v61);
}

uint64_t sub_25CF40C84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25CF40CCC(void *a1)
{
  return WidgetMessage.init(from:)(a1);
}

uint64_t sub_25CF40CE4(void *a1)
{
  return WidgetMessage.encode(to:)(a1);
}

uint64_t sub_25CF40D00@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *initializeBufferWithCopyOfBuffer for WidgetMessage(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v11 = a2[9];
    uint64_t v12 = a3[9];
    uint64_t v93 = (char *)a2 + v12;
    char v95 = (char *)a1 + v12;
    a1[8] = a2[8];
    a1[9] = v11;
    uint64_t v13 = sub_25CF42AD8();
    uint64_t v91 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v91(v95, v93, v13);
    uint64_t v14 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v15 = a3[13];
    *((unsigned char *)v4 + a3[12]) = *((unsigned char *)a2 + a3[12]);
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v16 = a3[14];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_25CF42AA8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
    }
    uint64_t v22 = a3[16];
    *((unsigned char *)v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    uint64_t v23 = (void *)((char *)v4 + v22);
    uint64_t v24 = (void *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = a3[17];
    uint64_t v27 = a3[18];
    uint64_t v28 = (void *)((char *)v4 + v26);
    uint64_t v29 = (void *)((char *)a2 + v26);
    uint64_t v30 = *v29;
    uint64_t v31 = v29[1];
    LOBYTE(v29) = *((unsigned char *)a2 + v27);
    *uint64_t v28 = v30;
    v28[1] = v31;
    *((unsigned char *)v4 + v27) = (_BYTE)v29;
    uint64_t v32 = a3[19];
    uint64_t v33 = a3[20];
    uint64_t v34 = (void *)((char *)v4 + v32);
    uint64_t v35 = (void *)((char *)a2 + v32);
    uint64_t v92 = v35[1];
    void *v34 = *v35;
    v34[1] = v92;
    uint64_t v36 = (void *)((char *)v4 + v33);
    uint64_t v37 = (void *)((char *)a2 + v33);
    uint64_t v94 = v37[1];
    void *v36 = *v37;
    v36[1] = v94;
    uint64_t v38 = a3[21];
    uint64_t v39 = a3[22];
    uint64_t v40 = (void *)((char *)v4 + v38);
    uint64_t v41 = (void *)((char *)a2 + v38);
    uint64_t v89 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v89;
    uint64_t v42 = (void *)((char *)v4 + v39);
    uint64_t v43 = (void *)((char *)a2 + v39);
    uint64_t v90 = v43[1];
    *uint64_t v42 = *v43;
    v42[1] = v90;
    uint64_t v44 = a3[23];
    uint64_t v45 = a3[24];
    uint64_t v46 = (void *)((char *)v4 + v44);
    uint64_t v47 = (void *)((char *)a2 + v44);
    uint64_t v87 = v47[1];
    *uint64_t v46 = *v47;
    v46[1] = v87;
    uint64_t v48 = (void *)((char *)v4 + v45);
    uint64_t v49 = (void *)((char *)a2 + v45);
    uint64_t v88 = v49[1];
    *uint64_t v48 = *v49;
    v48[1] = v88;
    uint64_t v50 = a3[25];
    uint64_t v51 = a3[26];
    uint64_t v52 = (void *)((char *)v4 + v50);
    uint64_t v53 = (void *)((char *)a2 + v50);
    uint64_t v54 = v53[1];
    void *v52 = *v53;
    v52[1] = v54;
    uint64_t v55 = (void *)((char *)v4 + v51);
    uint64_t v56 = (void *)((char *)a2 + v51);
    uint64_t v86 = v56[1];
    *uint64_t v55 = *v56;
    v55[1] = v86;
    uint64_t v57 = a3[27];
    uint64_t v58 = a3[28];
    uint64_t v59 = (void *)((char *)v4 + v57);
    uint64_t v60 = (void *)((char *)a2 + v57);
    uint64_t v61 = v60[1];
    *uint64_t v59 = *v60;
    v59[1] = v61;
    uint64_t v62 = (void *)((char *)v4 + v58);
    uint64_t v63 = (void *)((char *)a2 + v58);
    uint64_t v64 = v63[1];
    *uint64_t v62 = *v63;
    v62[1] = v64;
    uint64_t v65 = a3[29];
    uint64_t v66 = a3[30];
    uint64_t v67 = (void *)((char *)v4 + v65);
    uint64_t v68 = (void *)((char *)a2 + v65);
    uint64_t v69 = v68[1];
    *uint64_t v67 = *v68;
    v67[1] = v69;
    char v70 = (void *)((char *)v4 + v66);
    uint64_t v71 = (void *)((char *)a2 + v66);
    uint64_t v72 = v71[1];
    void *v70 = *v71;
    v70[1] = v72;
    uint64_t v73 = a3[31];
    uint64_t v74 = a3[32];
    char v75 = (void *)((char *)v4 + v73);
    uint64_t v76 = (void *)((char *)a2 + v73);
    uint64_t v77 = v76[1];
    *char v75 = *v76;
    v75[1] = v77;
    uint64_t v78 = (void *)((char *)v4 + v74);
    BOOL v79 = (void *)((char *)a2 + v74);
    uint64_t v80 = v79[1];
    *uint64_t v78 = *v79;
    v78[1] = v80;
    uint64_t v81 = a3[33];
    uint64_t v82 = (void *)((char *)v4 + v81);
    uint64_t v83 = (void *)((char *)a2 + v81);
    uint64_t v84 = v83[1];
    *uint64_t v82 = *v83;
    v82[1] = v84;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for WidgetMessage(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_25CF42AD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 56);
  uint64_t v7 = sub_25CF42AA8();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WidgetMessage(void *a1, void *a2, int *a3)
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
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v10 = a2[9];
  uint64_t v11 = a3[9];
  uint64_t v91 = (char *)a2 + v11;
  uint64_t v93 = (char *)a1 + v11;
  a1[8] = a2[8];
  a1[9] = v10;
  uint64_t v12 = sub_25CF42AD8();
  uint64_t v89 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v89(v93, v91, v12);
  uint64_t v13 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v14 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *((unsigned char *)a1 + v14) = *((unsigned char *)a2 + v14);
  uint64_t v15 = a3[14];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  }
  uint64_t v20 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[17];
  uint64_t v25 = a3[18];
  uint64_t v26 = (void *)((char *)a1 + v24);
  uint64_t v27 = (void *)((char *)a2 + v24);
  uint64_t v28 = *v27;
  uint64_t v29 = v27[1];
  LOBYTE(v27) = *((unsigned char *)a2 + v25);
  *uint64_t v26 = v28;
  v26[1] = v29;
  *((unsigned char *)a1 + v25) = (_BYTE)v27;
  uint64_t v30 = a3[19];
  uint64_t v31 = a3[20];
  uint64_t v32 = (void *)((char *)a1 + v30);
  uint64_t v33 = (void *)((char *)a2 + v30);
  uint64_t v90 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v90;
  uint64_t v34 = (void *)((char *)a1 + v31);
  uint64_t v35 = (void *)((char *)a2 + v31);
  uint64_t v92 = v35[1];
  void *v34 = *v35;
  v34[1] = v92;
  uint64_t v36 = a3[21];
  uint64_t v37 = a3[22];
  uint64_t v38 = (void *)((char *)a1 + v36);
  uint64_t v39 = (void *)((char *)a2 + v36);
  uint64_t v87 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v87;
  uint64_t v40 = (void *)((char *)a1 + v37);
  uint64_t v41 = (void *)((char *)a2 + v37);
  uint64_t v88 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v88;
  uint64_t v42 = a3[23];
  uint64_t v43 = a3[24];
  uint64_t v44 = (void *)((char *)a1 + v42);
  uint64_t v45 = (void *)((char *)a2 + v42);
  uint64_t v85 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v85;
  uint64_t v46 = (void *)((char *)a1 + v43);
  uint64_t v47 = (void *)((char *)a2 + v43);
  uint64_t v86 = v47[1];
  *uint64_t v46 = *v47;
  v46[1] = v86;
  uint64_t v48 = a3[25];
  uint64_t v49 = a3[26];
  uint64_t v50 = (void *)((char *)a1 + v48);
  uint64_t v51 = (void *)((char *)a2 + v48);
  uint64_t v52 = v51[1];
  *uint64_t v50 = *v51;
  v50[1] = v52;
  uint64_t v53 = (void *)((char *)a1 + v49);
  uint64_t v54 = (void *)((char *)a2 + v49);
  uint64_t v84 = v54[1];
  void *v53 = *v54;
  v53[1] = v84;
  uint64_t v55 = a3[27];
  uint64_t v56 = a3[28];
  uint64_t v57 = (void *)((char *)a1 + v55);
  uint64_t v58 = (void *)((char *)a2 + v55);
  uint64_t v59 = v58[1];
  *uint64_t v57 = *v58;
  v57[1] = v59;
  uint64_t v60 = (void *)((char *)a1 + v56);
  uint64_t v61 = (void *)((char *)a2 + v56);
  uint64_t v62 = v61[1];
  *uint64_t v60 = *v61;
  v60[1] = v62;
  uint64_t v63 = a3[29];
  uint64_t v64 = a3[30];
  uint64_t v65 = (void *)((char *)a1 + v63);
  uint64_t v66 = (void *)((char *)a2 + v63);
  uint64_t v67 = v66[1];
  *uint64_t v65 = *v66;
  v65[1] = v67;
  uint64_t v68 = (void *)((char *)a1 + v64);
  uint64_t v69 = (void *)((char *)a2 + v64);
  uint64_t v70 = v69[1];
  *uint64_t v68 = *v69;
  v68[1] = v70;
  uint64_t v71 = a3[31];
  uint64_t v72 = a3[32];
  uint64_t v73 = (void *)((char *)a1 + v71);
  uint64_t v74 = (void *)((char *)a2 + v71);
  uint64_t v75 = v74[1];
  *uint64_t v73 = *v74;
  v73[1] = v75;
  uint64_t v76 = (void *)((char *)a1 + v72);
  uint64_t v77 = (void *)((char *)a2 + v72);
  uint64_t v78 = v77[1];
  *uint64_t v76 = *v77;
  v76[1] = v78;
  uint64_t v79 = a3[33];
  uint64_t v80 = (void *)((char *)a1 + v79);
  uint64_t v81 = (void *)((char *)a2 + v79);
  uint64_t v82 = v81[1];
  *uint64_t v80 = *v81;
  v80[1] = v82;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WidgetMessage(void *a1, void *a2, int *a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  uint64_t v10 = a3[14];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    uint64_t v16 = *(void *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
LABEL_7:
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  uint64_t v18 = a3[16];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  void *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[17];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[18]) = *((unsigned char *)a2 + a3[18]);
  uint64_t v24 = a3[19];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[20];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[21];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[22];
  uint64_t v34 = (void *)((char *)a1 + v33);
  uint64_t v35 = (void *)((char *)a2 + v33);
  void *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[23];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[24];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[25];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  void *v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[26];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  *uint64_t v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v48 = a3[27];
  uint64_t v49 = (void *)((char *)a1 + v48);
  uint64_t v50 = (void *)((char *)a2 + v48);
  void *v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[28];
  uint64_t v52 = (void *)((char *)a1 + v51);
  uint64_t v53 = (void *)((char *)a2 + v51);
  void *v52 = *v53;
  v52[1] = v53[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v54 = a3[29];
  uint64_t v55 = (void *)((char *)a1 + v54);
  uint64_t v56 = (void *)((char *)a2 + v54);
  *uint64_t v55 = *v56;
  v55[1] = v56[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v57 = a3[30];
  uint64_t v58 = (void *)((char *)a1 + v57);
  uint64_t v59 = (void *)((char *)a2 + v57);
  *uint64_t v58 = *v59;
  v58[1] = v59[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v60 = a3[31];
  uint64_t v61 = (void *)((char *)a1 + v60);
  uint64_t v62 = (void *)((char *)a2 + v60);
  *uint64_t v61 = *v62;
  v61[1] = v62[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v63 = a3[32];
  uint64_t v64 = (void *)((char *)a1 + v63);
  uint64_t v65 = (void *)((char *)a2 + v63);
  *uint64_t v64 = *v65;
  v64[1] = v65[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v66 = a3[33];
  uint64_t v67 = (void *)((char *)a1 + v66);
  uint64_t v68 = (void *)((char *)a2 + v66);
  *uint64_t v67 = *v68;
  v67[1] = v68[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for WidgetMessage(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = a3[9];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
  uint64_t v13 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v14 = a3[14];
  int v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_25CF42AA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  uint64_t v19 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  uint64_t v20 = a3[18];
  *(_OWORD *)((char *)a1 + a3[17]) = *(_OWORD *)((char *)a2 + a3[17]);
  *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
  uint64_t v21 = a3[20];
  *(_OWORD *)((char *)a1 + a3[19]) = *(_OWORD *)((char *)a2 + a3[19]);
  *(_OWORD *)((char *)a1 + v21) = *(_OWORD *)((char *)a2 + v21);
  uint64_t v22 = a3[22];
  *(_OWORD *)((char *)a1 + a3[21]) = *(_OWORD *)((char *)a2 + a3[21]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  uint64_t v23 = a3[24];
  *(_OWORD *)((char *)a1 + a3[23]) = *(_OWORD *)((char *)a2 + a3[23]);
  *(_OWORD *)((char *)a1 + v23) = *(_OWORD *)((char *)a2 + v23);
  uint64_t v24 = a3[26];
  *(_OWORD *)((char *)a1 + a3[25]) = *(_OWORD *)((char *)a2 + a3[25]);
  *(_OWORD *)((char *)a1 + v24) = *(_OWORD *)((char *)a2 + v24);
  uint64_t v25 = a3[28];
  *(_OWORD *)((char *)a1 + a3[27]) = *(_OWORD *)((char *)a2 + a3[27]);
  *(_OWORD *)((char *)a1 + v25) = *(_OWORD *)((char *)a2 + v25);
  uint64_t v26 = a3[30];
  *(_OWORD *)((char *)a1 + a3[29]) = *(_OWORD *)((char *)a2 + a3[29]);
  *(_OWORD *)((char *)a1 + v26) = *(_OWORD *)((char *)a2 + v26);
  uint64_t v27 = a3[32];
  *(_OWORD *)((char *)a1 + a3[31]) = *(_OWORD *)((char *)a2 + a3[31]);
  *(_OWORD *)((char *)a1 + v27) = *(_OWORD *)((char *)a2 + v27);
  *(_OWORD *)((char *)a1 + a3[33]) = *(_OWORD *)((char *)a2 + a3[33]);
  return a1;
}

void *assignWithTake for WidgetMessage(void *a1, void *a2, int *a3)
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
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[9];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_25CF42AD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
  uint64_t v16 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
  uint64_t v17 = a3[14];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_25CF42AA8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    uint64_t v23 = *(void *)(v20 - 8);
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v18, v19, v20);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v20);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
LABEL_7:
  uint64_t v25 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[17];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[19];
  *((unsigned char *)a1 + a3[18]) = *((unsigned char *)a2 + a3[18]);
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  void *v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[20];
  uint64_t v41 = (void *)((char *)a1 + v40);
  uint64_t v42 = (void *)((char *)a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[21];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *uint64_t v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[22];
  uint64_t v51 = (void *)((char *)a1 + v50);
  uint64_t v52 = (void *)((char *)a2 + v50);
  uint64_t v54 = *v52;
  uint64_t v53 = v52[1];
  void *v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[23];
  uint64_t v56 = (void *)((char *)a1 + v55);
  uint64_t v57 = (void *)((char *)a2 + v55);
  uint64_t v59 = *v57;
  uint64_t v58 = v57[1];
  *uint64_t v56 = v59;
  v56[1] = v58;
  swift_bridgeObjectRelease();
  uint64_t v60 = a3[24];
  uint64_t v61 = (void *)((char *)a1 + v60);
  uint64_t v62 = (void *)((char *)a2 + v60);
  uint64_t v64 = *v62;
  uint64_t v63 = v62[1];
  *uint64_t v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  uint64_t v65 = a3[25];
  uint64_t v66 = (void *)((char *)a1 + v65);
  uint64_t v67 = (void *)((char *)a2 + v65);
  uint64_t v69 = *v67;
  uint64_t v68 = v67[1];
  *uint64_t v66 = v69;
  v66[1] = v68;
  swift_bridgeObjectRelease();
  uint64_t v70 = a3[26];
  uint64_t v71 = (void *)((char *)a1 + v70);
  uint64_t v72 = (void *)((char *)a2 + v70);
  uint64_t v74 = *v72;
  uint64_t v73 = v72[1];
  void *v71 = v74;
  v71[1] = v73;
  swift_bridgeObjectRelease();
  uint64_t v75 = a3[27];
  uint64_t v76 = (void *)((char *)a1 + v75);
  uint64_t v77 = (void *)((char *)a2 + v75);
  uint64_t v79 = *v77;
  uint64_t v78 = v77[1];
  *uint64_t v76 = v79;
  v76[1] = v78;
  swift_bridgeObjectRelease();
  uint64_t v80 = a3[28];
  uint64_t v81 = (void *)((char *)a1 + v80);
  uint64_t v82 = (void *)((char *)a2 + v80);
  uint64_t v84 = *v82;
  uint64_t v83 = v82[1];
  *uint64_t v81 = v84;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  uint64_t v85 = a3[29];
  uint64_t v86 = (void *)((char *)a1 + v85);
  uint64_t v87 = (void *)((char *)a2 + v85);
  uint64_t v89 = *v87;
  uint64_t v88 = v87[1];
  *uint64_t v86 = v89;
  v86[1] = v88;
  swift_bridgeObjectRelease();
  uint64_t v90 = a3[30];
  uint64_t v91 = (void *)((char *)a1 + v90);
  uint64_t v92 = (void *)((char *)a2 + v90);
  uint64_t v94 = *v92;
  uint64_t v93 = v92[1];
  *uint64_t v91 = v94;
  v91[1] = v93;
  swift_bridgeObjectRelease();
  uint64_t v95 = a3[31];
  uint64_t v96 = (void *)((char *)a1 + v95);
  uint64_t v97 = (void *)((char *)a2 + v95);
  uint64_t v99 = *v97;
  uint64_t v98 = v97[1];
  *uint64_t v96 = v99;
  v96[1] = v98;
  swift_bridgeObjectRelease();
  uint64_t v100 = a3[32];
  uint64_t v101 = (void *)((char *)a1 + v100);
  uint64_t v102 = (void *)((char *)a2 + v100);
  uint64_t v104 = *v102;
  uint64_t v103 = v102[1];
  *uint64_t v101 = v104;
  v101[1] = v103;
  swift_bridgeObjectRelease();
  uint64_t v105 = a3[33];
  uint64_t v106 = (void *)((char *)a1 + v105);
  uint64_t v107 = (void *)((char *)a2 + v105);
  uint64_t v109 = *v107;
  uint64_t v108 = v107[1];
  *uint64_t v106 = v109;
  v106[1] = v108;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25CF42294);
}

uint64_t sub_25CF42294(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_25CF42AD8();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 36);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      uint64_t v11 = *(int *)(a3 + 56);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for WidgetMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25CF42358);
}

uint64_t sub_25CF42358(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_25CF42AD8();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 36);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A62F228);
      uint64_t v11 = *(int *)(a4 + 56);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_25CF42404()
{
  sub_25CF42AD8();
  if (v0 <= 0x3F)
  {
    sub_25CF3CE60();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for WidgetMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE3)
  {
    if (a2 + 29 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 29) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 30;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1E;
  int v5 = v6 - 30;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WidgetMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 29 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 29) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE2)
  {
    unsigned int v6 = ((a2 - 227) >> 8) + 1;
    *uint64_t result = a2 + 29;
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
        JUMPOUT(0x25CF42678);
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
          *uint64_t result = a2 + 29;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetMessage.CodingKeys()
{
  return &type metadata for WidgetMessage.CodingKeys;
}

unint64_t sub_25CF426B4()
{
  unint64_t result = qword_26A630158;
  if (!qword_26A630158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A630158);
  }
  return result;
}

unint64_t sub_25CF42704()
{
  unint64_t result = qword_26A630160;
  if (!qword_26A630160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A630160);
  }
  return result;
}

unint64_t sub_25CF42754()
{
  unint64_t result = qword_26A630168;
  if (!qword_26A630168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A630168);
  }
  return result;
}

id sub_25CF427A0()
{
  id result = sub_25CF427C0();
  qword_26A6300E0 = (uint64_t)result;
  return result;
}

id sub_25CF427C0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  objc_msgSend(v0, sel_setDoesRelativeDateFormatting_, 1);
  return v0;
}

id sub_25CF42834()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 0);
  id result = objc_msgSend(v0, sel_setTimeStyle_, 1);
  qword_26A6300E8 = (uint64_t)v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_1_6@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_25CF440D8();
}

uint64_t OUTLINED_FUNCTION_2_8@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_3_8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_25CF44058();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_5@<X0>(uint64_t a1@<X0>, char a2@<W8>)
{
  *(unsigned char *)(v3 - 65) = a2;
  return MEMORY[0x270F9F430](a1, v3 - 65, v2);
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_13_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)(v3 + a3);
  *uint64_t v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W8>)
{
  *(unsigned char *)(v4 - 65) = a3;
  return MEMORY[0x270F9F3B0](a1, a2, v4 - 65, v3);
}

void OUTLINED_FUNCTION_15()
{
  *(_DWORD *)(v0 - 112) = 0;
}

uint64_t OUTLINED_FUNCTION_20_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v2 - 65) = a1;
  return MEMORY[0x270F9F270](v2 - 65, v1);
}

uint64_t OUTLINED_FUNCTION_21_0@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + a1)) {
    return v3;
  }
  else {
    return v2;
  }
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_25CF44068();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_25CF43D98();
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_25CF43DA8();
}

uint64_t sub_25CF42A78()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_25CF42A88()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25CF42A98()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25CF42AA8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25CF42AB8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25CF42AC8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25CF42AD8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25CF42AE8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25CF42AF8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25CF42B08()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25CF42B18()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_25CF42B28()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25CF42B38()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25CF42B48()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_25CF42B58()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_25CF42B68()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_25CF42B78()
{
  return MEMORY[0x270F75650]();
}

uint64_t sub_25CF42B88()
{
  return MEMORY[0x270F75658]();
}

uint64_t sub_25CF42B98()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_25CF42BA8()
{
  return MEMORY[0x270F66F38]();
}

uint64_t sub_25CF42BB8()
{
  return MEMORY[0x270F66F60]();
}

uint64_t sub_25CF42BC8()
{
  return MEMORY[0x270F67078]();
}

uint64_t sub_25CF42BD8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25CF42BE8()
{
  return MEMORY[0x270F65718]();
}

uint64_t sub_25CF42BF8()
{
  return MEMORY[0x270F65730]();
}

uint64_t sub_25CF42C08()
{
  return MEMORY[0x270F65738]();
}

uint64_t sub_25CF42C18()
{
  return MEMORY[0x270F65740]();
}

uint64_t sub_25CF42C28()
{
  return MEMORY[0x270F65748]();
}

uint64_t sub_25CF42C38()
{
  return MEMORY[0x270F65B08]();
}

uint64_t sub_25CF42C48()
{
  return MEMORY[0x270F65B78]();
}

uint64_t sub_25CF42C58()
{
  return MEMORY[0x270F65BA8]();
}

uint64_t sub_25CF42C68()
{
  return MEMORY[0x270F65BE0]();
}

uint64_t sub_25CF42C78()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_25CF42C88()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_25CF42C98()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_25CF42CA8()
{
  return MEMORY[0x270F729D8]();
}

uint64_t sub_25CF42CB8()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_25CF42CC8()
{
  return MEMORY[0x270F72A88]();
}

uint64_t sub_25CF42CD8()
{
  return MEMORY[0x270F662E8]();
}

uint64_t sub_25CF42CE8()
{
  return MEMORY[0x270F662F0]();
}

uint64_t sub_25CF42CF8()
{
  return MEMORY[0x270F68820]();
}

uint64_t sub_25CF42D08()
{
  return MEMORY[0x270F68828]();
}

uint64_t sub_25CF42D18()
{
  return MEMORY[0x270F68830]();
}

uint64_t sub_25CF42D28()
{
  return MEMORY[0x270F68838]();
}

uint64_t sub_25CF42D38()
{
  return MEMORY[0x270F68840]();
}

uint64_t sub_25CF42D48()
{
  return MEMORY[0x270F68850]();
}

uint64_t sub_25CF42D58()
{
  return MEMORY[0x270F68858]();
}

uint64_t sub_25CF42D68()
{
  return MEMORY[0x270F68860]();
}

uint64_t sub_25CF42D78()
{
  return MEMORY[0x270F68868]();
}

uint64_t sub_25CF42D88()
{
  return MEMORY[0x270F68870]();
}

uint64_t sub_25CF42D98()
{
  return MEMORY[0x270F68878]();
}

uint64_t sub_25CF42DA8()
{
  return MEMORY[0x270F68880]();
}

uint64_t sub_25CF42DB8()
{
  return MEMORY[0x270F68898]();
}

uint64_t sub_25CF42DC8()
{
  return MEMORY[0x270F688B0]();
}

uint64_t sub_25CF42DD8()
{
  return MEMORY[0x270F688C0]();
}

uint64_t sub_25CF42DE8()
{
  return MEMORY[0x270F688D0]();
}

uint64_t sub_25CF42DF8()
{
  return MEMORY[0x270F688D8]();
}

uint64_t sub_25CF42E08()
{
  return MEMORY[0x270F688F0]();
}

uint64_t sub_25CF42E18()
{
  return MEMORY[0x270F688F8]();
}

uint64_t sub_25CF42E28()
{
  return MEMORY[0x270F68908]();
}

uint64_t sub_25CF42E48()
{
  return MEMORY[0x270F68918]();
}

uint64_t sub_25CF42E58()
{
  return MEMORY[0x270F68920]();
}

uint64_t sub_25CF42E68()
{
  return MEMORY[0x270F68928]();
}

uint64_t sub_25CF42E78()
{
  return MEMORY[0x270F68938]();
}

uint64_t sub_25CF42E88()
{
  return MEMORY[0x270F68940]();
}

uint64_t sub_25CF42E98()
{
  return MEMORY[0x270F68948]();
}

uint64_t sub_25CF42EA8()
{
  return MEMORY[0x270F68950]();
}

uint64_t sub_25CF42EB8()
{
  return MEMORY[0x270F68958]();
}

uint64_t sub_25CF42EC8()
{
  return MEMORY[0x270F68960]();
}

uint64_t sub_25CF42ED8()
{
  return MEMORY[0x270F68968]();
}

uint64_t sub_25CF42EE8()
{
  return MEMORY[0x270F68970]();
}

uint64_t sub_25CF42EF8()
{
  return MEMORY[0x270F68978]();
}

uint64_t sub_25CF42F08()
{
  return MEMORY[0x270F68980]();
}

uint64_t sub_25CF42F18()
{
  return MEMORY[0x270F26E68]();
}

uint64_t sub_25CF42F28()
{
  return MEMORY[0x270F26E70]();
}

uint64_t sub_25CF42F38()
{
  return MEMORY[0x270F68988]();
}

uint64_t sub_25CF42F48()
{
  return MEMORY[0x270F26E80]();
}

uint64_t sub_25CF42F58()
{
  return MEMORY[0x270F26E88]();
}

uint64_t sub_25CF42F68()
{
  return MEMORY[0x270F26E90]();
}

uint64_t sub_25CF42F78()
{
  return MEMORY[0x270F26E98]();
}

uint64_t sub_25CF42F88()
{
  return MEMORY[0x270F26EA0]();
}

uint64_t sub_25CF42F98()
{
  return MEMORY[0x270F26EA8]();
}

uint64_t sub_25CF42FA8()
{
  return MEMORY[0x270F26EB0]();
}

uint64_t sub_25CF42FB8()
{
  return MEMORY[0x270F26EB8]();
}

uint64_t sub_25CF42FC8()
{
  return MEMORY[0x270F26EC0]();
}

uint64_t sub_25CF42FD8()
{
  return MEMORY[0x270F26EC8]();
}

uint64_t sub_25CF42FF8()
{
  return MEMORY[0x270F26ED8]();
}

uint64_t sub_25CF43008()
{
  return MEMORY[0x270F26EE0]();
}

uint64_t sub_25CF43018()
{
  return MEMORY[0x270F26EE8]();
}

uint64_t sub_25CF43028()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25CF43038()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25CF43048()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25CF43058()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25CF43068()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25CF43078()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_25CF43088()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25CF43098()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_25CF430A8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25CF430B8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25CF430C8()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_25CF430D8()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_25CF430E8()
{
  return MEMORY[0x270EFED48]();
}

uint64_t sub_25CF430F8()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_25CF43108()
{
  return MEMORY[0x270EFED78]();
}

uint64_t sub_25CF43118()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_25CF43128()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_25CF43138()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25CF43148()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25CF43158()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_25CF43168()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_25CF43178()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_25CF43188()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_25CF43198()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_25CF431A8()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_25CF431B8()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_25CF431C8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25CF431D8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_25CF431E8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_25CF431F8()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_25CF43208()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_25CF43218()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_25CF43228()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_25CF43238()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_25CF43248()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_25CF43258()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_25CF43268()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_25CF43278()
{
  return MEMORY[0x270F00770]();
}

uint64_t sub_25CF43288()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_25CF43298()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_25CF432A8()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_25CF432B8()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_25CF432C8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25CF432D8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25CF432E8()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_25CF432F8()
{
  return MEMORY[0x270F662F8]();
}

uint64_t sub_25CF43308()
{
  return MEMORY[0x270F66300]();
}

uint64_t sub_25CF43318()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25CF43328()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25CF43338()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_25CF43348()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_25CF43358()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_25CF43368()
{
  return MEMORY[0x270F00B30]();
}

uint64_t sub_25CF43378()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_25CF43388()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_25CF43398()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_25CF433A8()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_25CF433B8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25CF433C8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25CF433D8()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25CF433E8()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25CF433F8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_25CF43408()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_25CF43418()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25CF43428()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25CF43438()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_25CF43448()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25CF43458()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_25CF43468()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_25CF43478()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_25CF43488()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_25CF43498()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_25CF434A8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_25CF434B8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_25CF434C8()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_25CF434D8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25CF434E8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_25CF434F8()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_25CF43508()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_25CF43518()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25CF43528()
{
  return MEMORY[0x270F01B68]();
}

uint64_t sub_25CF43538()
{
  return MEMORY[0x270F01B70]();
}

uint64_t sub_25CF43548()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_25CF43558()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25CF43568()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25CF43578()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25CF43598()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25CF435A8()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25CF435B8()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25CF435D8()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_25CF435E8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25CF435F8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_25CF43608()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25CF43618()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_25CF43628()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25CF43638()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_25CF43648()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25CF43658()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25CF43668()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_25CF43678()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_25CF43688()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_25CF43698()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25CF436A8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_25CF436B8()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_25CF436C8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_25CF436D8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_25CF436E8()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_25CF436F8()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_25CF43708()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_25CF43718()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_25CF43728()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_25CF43738()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_25CF43748()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_25CF43758()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25CF43768()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_25CF43778()
{
  return MEMORY[0x270F02D90]();
}

uint64_t sub_25CF43788()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_25CF43798()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25CF437A8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_25CF437B8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25CF437C8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25CF437D8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25CF437E8()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_25CF437F8()
{
  return MEMORY[0x270F75960]();
}

uint64_t sub_25CF43808()
{
  return MEMORY[0x270F75970]();
}

uint64_t sub_25CF43818()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_25CF43828()
{
  return MEMORY[0x270F759B0]();
}

uint64_t sub_25CF43838()
{
  return MEMORY[0x270F759C8]();
}

uint64_t sub_25CF43848()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_25CF43858()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25CF43868()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25CF43878()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25CF43888()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25CF43898()
{
  return MEMORY[0x270F03750]();
}

uint64_t sub_25CF438A8()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_25CF438B8()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_25CF438C8()
{
  return MEMORY[0x270F040A0]();
}

uint64_t sub_25CF438D8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25CF438E8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_25CF438F8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25CF43908()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_25CF43918()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_25CF43928()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25CF43938()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25CF43948()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25CF43958()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_25CF43968()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_25CF43978()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25CF43988()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_25CF43998()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_25CF439A8()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_25CF439B8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25CF439C8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25CF439D8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25CF439E8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25CF439F8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25CF43A08()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_25CF43A18()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25CF43A28()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25CF43A38()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_25CF43A48()
{
  return MEMORY[0x270F04BA8]();
}

uint64_t sub_25CF43A58()
{
  return MEMORY[0x270F04BB0]();
}

uint64_t sub_25CF43A68()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_25CF43A78()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_25CF43A88()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_25CF43A98()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25CF43AA8()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_25CF43AB8()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_25CF43AC8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25CF43AD8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_25CF43AE8()
{
  return MEMORY[0x270F052C0]();
}

uint64_t sub_25CF43AF8()
{
  return MEMORY[0x270F052D8]();
}

uint64_t sub_25CF43B08()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25CF43B18()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25CF43B28()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25CF43B38()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t sub_25CF43B48()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_25CF43B58()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_25CF43B68()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_25CF43B78()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_25CF43B88()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_25CF43B98()
{
  return MEMORY[0x270F75D18]();
}

uint64_t sub_25CF43BA8()
{
  return MEMORY[0x270F75D28]();
}

uint64_t sub_25CF43BB8()
{
  return MEMORY[0x270F75D60]();
}

uint64_t sub_25CF43BC8()
{
  return MEMORY[0x270F75D68]();
}

uint64_t sub_25CF43BD8()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_25CF43BE8()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_25CF43BF8()
{
  return MEMORY[0x270F75E58]();
}

uint64_t sub_25CF43C08()
{
  return MEMORY[0x270F75E70]();
}

uint64_t sub_25CF43C18()
{
  return MEMORY[0x270F75E80]();
}

uint64_t sub_25CF43C28()
{
  return MEMORY[0x270F75EC8]();
}

uint64_t sub_25CF43C38()
{
  return MEMORY[0x270F75ED0]();
}

uint64_t sub_25CF43C48()
{
  return MEMORY[0x270F75F70]();
}

uint64_t sub_25CF43C58()
{
  return MEMORY[0x270F75F78]();
}

uint64_t sub_25CF43C68()
{
  return MEMORY[0x270F760F0]();
}

uint64_t sub_25CF43C78()
{
  return MEMORY[0x270F760F8]();
}

uint64_t sub_25CF43C88()
{
  return MEMORY[0x270F76160]();
}

uint64_t sub_25CF43C98()
{
  return MEMORY[0x270F76170]();
}

uint64_t sub_25CF43CA8()
{
  return MEMORY[0x270F761B0]();
}

uint64_t sub_25CF43CB8()
{
  return MEMORY[0x270F761C8]();
}

uint64_t sub_25CF43CC8()
{
  return MEMORY[0x270F761D0]();
}

uint64_t sub_25CF43CD8()
{
  return MEMORY[0x270F76200]();
}

uint64_t sub_25CF43CE8()
{
  return MEMORY[0x270F76220]();
}

uint64_t sub_25CF43CF8()
{
  return MEMORY[0x270F76250]();
}

uint64_t sub_25CF43D08()
{
  return MEMORY[0x270F76260]();
}

uint64_t sub_25CF43D18()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_25CF43D28()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25CF43D38()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25CF43D48()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25CF43D58()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25CF43D68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25CF43D78()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25CF43D88()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25CF43D98()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25CF43DA8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25CF43DB8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25CF43DC8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25CF43DD8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25CF43DE8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25CF43DF8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25CF43E08()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25CF43E18()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_25CF43E28()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25CF43E38()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25CF43E48()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25CF43E58()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25CF43E68()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25CF43E78()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25CF43E88()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_25CF43E98()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_25CF43EA8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25CF43EB8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25CF43EC8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25CF43ED8()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25CF43EE8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25CF43EF8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25CF43F08()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25CF43F18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25CF43F28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25CF43F38()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25CF43F48()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25CF43F58()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25CF43F68()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25CF43F78()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25CF43F88()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25CF43F98()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25CF43FA8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25CF43FB8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25CF43FC8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25CF43FD8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25CF43FE8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25CF43FF8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25CF44008()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25CF44028()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25CF44048()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25CF44058()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25CF44068()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25CF44078()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25CF44088()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25CF44098()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25CF440C8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25CF440D8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25CF440F8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25CF44108()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25CF44118()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25CF44128()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25CF44138()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25CF44148()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25CF44158()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25CF44168()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25CF44178()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25CF44188()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25CF44198()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25CF441A8()
{
  return MEMORY[0x270F9FD98]();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

void free(void *a1)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}