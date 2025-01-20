uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.startAnnotationUIService()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_25BAAF15C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.stopAnnotationUIService()(uint64_t a1, uint64_t a2)
{
  v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25BAAEDB0;
  return v7(a1, a2);
}

uint64_t sub_25BAAEDB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.processTapGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25BAAEDB0;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.processDragGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 32) + **(int **)(a3 + 32));
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25BAAF15C;
  return v9(a1, a2, a3);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25BAAF0BC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25BAAF0DC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint()
{
  if (!qword_26A5361C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A5361C0);
    }
  }
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewControllerProtocol.clearDrawing()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewControllerProtocol.processTapGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewControllerProtocol.processDragGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_25BAAF19C(char a1)
{
  if (a1 == 2) {
    return 0x746E696F70;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 25705;
}

BOOL sub_25BAAF1EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25BAAF200()
{
  return sub_25BAB6C40();
}

uint64_t sub_25BAAF248()
{
  return sub_25BAB6C30();
}

uint64_t sub_25BAAF274()
{
  return sub_25BAB6C40();
}

uint64_t sub_25BAAF2B8()
{
  return sub_25BAAF19C(*v0);
}

uint64_t sub_25BAAF2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BAB0ACC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25BAAF2E8()
{
  return 0;
}

void sub_25BAAF2F4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25BAAF300(uint64_t a1)
{
  unint64_t v2 = sub_25BAAF634();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BAAF33C(uint64_t a1)
{
  unint64_t v2 = sub_25BAAF634();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DragGestureMessage.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536230);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAAF634();
  sub_25BAB6C60();
  LOBYTE(v12) = 0;
  sub_25BAB6910();
  sub_25BAAFAE8(&qword_26A536240, MEMORY[0x263F07508]);
  sub_25BAB6BA0();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for DragGestureMessage();
    LOBYTE(v12) = 1;
    sub_25BAB6BB0();
    long long v12 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    type metadata accessor for CGPoint();
    sub_25BAAFAE8(&qword_26A536248, (void (*)(uint64_t))type metadata accessor for CGPoint);
    sub_25BAB6BA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25BAAF634()
{
  unint64_t result = qword_26A536238;
  if (!qword_26A536238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536238);
  }
  return result;
}

uint64_t type metadata accessor for DragGestureMessage()
{
  uint64_t result = qword_26A536280;
  if (!qword_26A536280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DragGestureMessage.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = sub_25BAB6910();
  uint64_t v20 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v22 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536250);
  uint64_t v19 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DragGestureMessage();
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAAF634();
  sub_25BAB6C50();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v20;
  LOBYTE(v23) = 0;
  sub_25BAAFAE8(&qword_26A536258, MEMORY[0x263F07508]);
  uint64_t v13 = v21;
  sub_25BAB6B80();
  v14 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 32);
  v15 = v22;
  v22 = (char *)v4;
  v14(v11, v15, v4);
  LOBYTE(v23) = 1;
  *(void *)(v11 + *(int *)(v8 + 20)) = sub_25BAB6B90();
  type metadata accessor for CGPoint();
  char v24 = 2;
  sub_25BAAFAE8(&qword_26A536260, (void (*)(uint64_t))type metadata accessor for CGPoint);
  sub_25BAB6B80();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v13);
  *(_OWORD *)(v11 + *(int *)(v8 + 24)) = v23;
  sub_25BAAFB30(v11, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25BAAFB94(v11);
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

uint64_t sub_25BAAFAE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BAAFB30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DragGestureMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BAAFB94(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DragGestureMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BAAFBF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DragGestureMessage.init(from:)(a1, a2);
}

uint64_t sub_25BAAFC08(void *a1)
{
  return DragGestureMessage.encode(to:)(a1);
}

uint64_t DragGestureMessage.init(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A536268);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25BAB6910();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_25BAB69B0();
  uint64_t v31 = v10;
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v11 = sub_25BAB00A0((uint64_t)v32), (v12 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v33);
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  sub_25BAB00E4((uint64_t)v32);
  if (!*((void *)&v34 + 1)) {
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v35 = v30;
  uint64_t v30 = sub_25BAB69C0();
  uint64_t v31 = v13;
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_25BAB00A0((uint64_t)v32), (v15 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v33);
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  sub_25BAB00E4((uint64_t)v32);
  if (!*((void *)&v34 + 1)) {
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  uint64_t v16 = v30;
  uint64_t v30 = sub_25BAB69D0();
  uint64_t v31 = v17;
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v18 = sub_25BAB00A0((uint64_t)v32), (v19 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v33);
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  sub_25BAB00E4((uint64_t)v32);
  if (!*((void *)&v34 + 1))
  {
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    swift_bridgeObjectRelease();
    sub_25BAB018C((uint64_t)&v33, &qword_26A536270);
LABEL_26:
    sub_25BAB0138();
    swift_allocError();
    *char v24 = 7;
    return swift_willThrow();
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v20 = v30;
  uint64_t v30 = sub_25BAB69E0();
  uint64_t v31 = v21;
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v22 = sub_25BAB00A0((uint64_t)v32), (v23 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v22, (uint64_t)&v33);
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_25BAB00E4((uint64_t)v32);
  if (!*((void *)&v34 + 1)) {
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v26 = v30;
  sub_25BAB68F0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_25BAB6900();
    sub_25BAB018C((uint64_t)v5, &qword_26A536268);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a2, v9, v6);
  }
  else
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v27(v9, v5, v6);
    v27(a2, v9, v6);
  }
  uint64_t result = type metadata accessor for DragGestureMessage();
  v28 = (uint64_t *)&a2[*(int *)(result + 24)];
  uint64_t *v28 = v16;
  v28[1] = v20;
  *(void *)&a2[*(int *)(result + 20)] = v26;
  return result;
}

unint64_t sub_25BAB00A0(uint64_t a1)
{
  uint64_t v2 = sub_25BAB6B00();
  return sub_25BAB0A04(a1, v2);
}

uint64_t sub_25BAB00E4(uint64_t a1)
{
  return a1;
}

unint64_t sub_25BAB0138()
{
  unint64_t result = qword_26A536278;
  if (!qword_26A536278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536278);
  }
  return result;
}

uint64_t sub_25BAB018C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25BAB01E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for DragGestureMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25BAB6910();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t destroy for DragGestureMessage(uint64_t a1)
{
  uint64_t v2 = sub_25BAB6910();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAB6910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAB6910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t initializeWithTake for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAB6910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAB6910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25BAB05B4);
}

uint64_t sub_25BAB05B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAB6910();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25BAB0634);
}

uint64_t sub_25BAB0634(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAB6910();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25BAB06A4()
{
  uint64_t result = sub_25BAB6910();
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

uint64_t getEnumTagSinglePayload for DragGestureMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DragGestureMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BAB08B0);
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

uint64_t sub_25BAB08D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25BAB08E4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DragGestureMessage.CodingKeys()
{
  return &type metadata for DragGestureMessage.CodingKeys;
}

unint64_t sub_25BAB0900()
{
  unint64_t result = qword_26A536290;
  if (!qword_26A536290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536290);
  }
  return result;
}

unint64_t sub_25BAB0958()
{
  unint64_t result = qword_26A536298;
  if (!qword_26A536298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536298);
  }
  return result;
}

unint64_t sub_25BAB09B0()
{
  unint64_t result = qword_26A5362A0;
  if (!qword_26A5362A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5362A0);
  }
  return result;
}

unint64_t sub_25BAB0A04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25BAB0BF4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x26116FE00](v9, a1);
      sub_25BAB00E4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25BAB0ACC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_25BAB6BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025BAB8130 || (sub_25BAB6BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E696F70 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25BAB6BC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25BAB0BF4(uint64_t a1, uint64_t a2)
{
  return a2;
}

BOOL static AnnotationUIServiceError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AnnotationUIServiceError.hash(into:)()
{
  return sub_25BAB6C30();
}

uint64_t AnnotationUIServiceError.hashValue.getter()
{
  return sub_25BAB6C40();
}

unint64_t AnnotationUIServiceError.errorDescription.getter()
{
  unint64_t result = 0xD00000000000001ALL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 2:
      unint64_t result = 0xD000000000000029;
      break;
    case 3:
    case 4:
      unint64_t result = 0xD000000000000033;
      break;
    case 5:
      unint64_t result = 0xD00000000000003ALL;
      break;
    case 6:
      unint64_t result = 0xD00000000000003DLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25BAB0DCC()
{
  unint64_t result = qword_26A5362A8;
  if (!qword_26A5362A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5362A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AnnotationUIServiceError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnnotationUIServiceError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x25BAB0F90);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnnotationUIServiceError()
{
  return &type metadata for AnnotationUIServiceError;
}

uint64_t dispatch thunk of ScreenSharingAnnotationDisplayManagerProtocol.attachViewController(forService:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25BAB10CC;
  return v9(a1, a2, a3);
}

uint64_t sub_25BAB10CC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of ScreenSharingAnnotationDisplayManagerProtocol.detachViewController(forService:viewController:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25BAAEDB0;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25BAB12E4()
{
  return 1;
}

uint64_t SecureHostingController.__allocating_init(rootView:)(uint64_t a1)
{
  int v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_25BAB22AC(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2
                                                          + class metadata base offset for SecureHostingController)
                                              - 8)
                                  + 8))(a1);
  return v5;
}

uint64_t SecureHostingController.init(rootView:)(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = sub_25BAB22AC(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + class metadata base offset for SecureHostingController)
                                              - 8)
                                  + 8))(a1);
  return v4;
}

void *SecureHostingController.__allocating_init(coder:rootView:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SecureHostingController.init(coder:rootView:)(a1, a2);
}

void *SecureHostingController.init(coder:rootView:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + class metadata base offset for SecureHostingController);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  uint64_t v7 = (void *)sub_25BAB6A50();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id SecureHostingController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SecureHostingController.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureHostingController();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_25BAB1668(uint64_t a1, uint64_t a2, void *a3)
{
  return SecureHostingController.init(coder:)(a3);
}

id SecureHostingController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ScreenSharingAnnotationViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return ScreenSharingAnnotationViewController.init()();
}

uint64_t ScreenSharingAnnotationViewController.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5362C0);
  uint64_t v3 = MEMORY[0x270FA5388](v1 - 8, v2);
  objc_super v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3, v6);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = qword_26A5362C8;
  sub_25BAB6980();
  swift_allocObject();
  uint64_t v10 = v0;
  *(void *)&v0[v9] = sub_25BAB6970();
  uint64_t v11 = qword_26A5362D0;
  sub_25BAB6A10();
  swift_allocObject();
  sub_25BAB6A00();
  uint64_t v12 = sub_25BAB69F0();
  swift_release();
  *(void *)&v10[v11] = v12;

  uint64_t v13 = sub_25BAB6930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  sub_25BAB23AC((uint64_t)v8, (uint64_t)v5);
  uint64_t v14 = sub_25BAB6A60();
  sub_25BAB2414((uint64_t)v8);
  return v14;
}

void sub_25BAB18AC(char *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = qword_26A5362C8;
  sub_25BAB6980();
  swift_allocObject();
  id v6 = a3;
  *(void *)&a1[v5] = sub_25BAB6970();
  uint64_t v7 = qword_26A5362D0;
  sub_25BAB6A10();
  swift_allocObject();
  sub_25BAB6A00();
  uint64_t v8 = sub_25BAB69F0();
  swift_release();
  *(void *)&a1[v7] = v8;

  sub_25BAB6B60();
  __break(1u);
}

id sub_25BAB1988()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5362C0);
  MEMORY[0x270FA5388](v1 - 8, v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (objc_class *)type metadata accessor for ScreenSharingAnnotationViewController();
  v12.receiver = v0;
  v12.super_class = v5;
  objc_msgSendSuper2(&v12, sel_viewDidLoad);
  id result = objc_msgSend(v0, sel_view);
  if (result)
  {
    uint64_t v7 = result;
    id v8 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v7, sel_setBackgroundColor_, v8);

    id result = objc_msgSend(v0, sel_view);
    if (result)
    {
      uint64_t v9 = result;
      id v10 = objc_msgSend(result, sel_layer);

      objc_msgSend(v10, sel_setDisableUpdateMask_, 16);
      swift_retain();
      sub_25BAB6920();
      uint64_t v11 = sub_25BAB6930();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
      return (id)sub_25BAB6A70();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_25BAB1B38(void *a1)
{
  id v1 = a1;
  sub_25BAB1988();
}

void ScreenSharingAnnotationViewController.__allocating_init(rootView:)()
{
}

void ScreenSharingAnnotationViewController.init(rootView:)()
{
}

void ScreenSharingAnnotationViewController.__allocating_init(coder:rootView:)()
{
}

void ScreenSharingAnnotationViewController.init(coder:rootView:)()
{
}

void sub_25BAB1C40()
{
  swift_release();
  id v1 = *(void **)(v0 + qword_26A5362D0);
}

id ScreenSharingAnnotationViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenSharingAnnotationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25BAB1CB8(uint64_t a1)
{
  swift_release();
  objc_super v2 = *(void **)(a1 + qword_26A5362D0);
}

Swift::Void __swiftcall ScreenSharingAnnotationViewController.clearDrawing()()
{
}

uint64_t ScreenSharingAnnotationViewController.processTapGestureMessage(_:)(uint64_t a1)
{
  uint64_t v2 = sub_25BAB6990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F67048], v2);
  sub_25BAB69A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(self, sel_setRemoteInputMachTime_, v7);
  return sub_25BAB6950();
}

uint64_t ScreenSharingAnnotationViewController.processDragGestureMessage(_:)(uint64_t a1)
{
  uint64_t v2 = sub_25BAB6990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F67048], v2);
  uint64_t v7 = *(int *)(type metadata accessor for DragGestureMessage() + 20);
  sub_25BAB69A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(self, sel_setRemoteInputMachTime_, *(void *)(a1 + v7));
  return sub_25BAB6960();
}

uint64_t sub_25BAB1FD8()
{
  return sub_25BAB6940();
}

uint64_t sub_25BAB2004(uint64_t a1)
{
  uint64_t v2 = sub_25BAB6990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F67048], v2);
  sub_25BAB69A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(self, sel_setRemoteInputMachTime_, v7);
  return sub_25BAB6950();
}

uint64_t sub_25BAB2150(uint64_t a1)
{
  uint64_t v2 = sub_25BAB6990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F67048], v2);
  uint64_t v7 = *(int *)(type metadata accessor for DragGestureMessage() + 20);
  sub_25BAB69A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(self, sel_setRemoteInputMachTime_, *(void *)(a1 + v7));
  return sub_25BAB6960();
}

uint64_t sub_25BAB22AC(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return sub_25BAB6A60();
}

uint64_t type metadata accessor for SecureHostingController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BAB23AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5362C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BAB2414(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5362C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ScreenSharingAnnotationViewController()
{
  uint64_t result = qword_26A536358;
  if (!qword_26A536358) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BAB24C4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25BAB2508()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ScreenSharingAnnotationViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScreenSharingAnnotationViewController);
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ScreenSharingAnnotationViewController + v0 + 16))();
}

uint64_t sub_25BAB2598()
{
  return type metadata accessor for ScreenSharingAnnotationViewController();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id sub_25BAB25D0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
LABEL_5:
    id v5 = v1;
    return v2;
  }
  id result = objc_msgSend(self, sel_sharedDisplayManager);
  if (result)
  {
    uint64_t v4 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = result;
    id v2 = result;

    uint64_t v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void *ScreenSharingAnnotationDisplayManager.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  v0[2] = 0;
  id v1 = objc_allocWithZone((Class)type metadata accessor for ScreenSharingAnnotationViewController());
  v0[3] = ScreenSharingAnnotationViewController.init()();
  v0[4] = &protocol witness table for ScreenSharingAnnotationViewController;
  return v0;
}

void *ScreenSharingAnnotationDisplayManager.init()()
{
  v0[2] = 0;
  id v1 = objc_allocWithZone((Class)type metadata accessor for ScreenSharingAnnotationViewController());
  v0[3] = ScreenSharingAnnotationViewController.init()();
  v0[4] = &protocol witness table for ScreenSharingAnnotationViewController;
  return v0;
}

uint64_t ScreenSharingAnnotationDisplayManager.deinit()
{
  return v0;
}

uint64_t ScreenSharingAnnotationDisplayManager.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t ScreenSharingAnnotationDisplayManager.attachViewController(forService:)(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_26A536370 + dword_26A536370);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BAB2800;
  return v5(a1);
}

uint64_t sub_25BAB2800(void *a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
  if (v2)
  {
    return v7();
  }
  else
  {
    id v10 = *(uint64_t (**)(id, uint64_t))(v6 + 8);
    id v9 = a1;
    return v10(v9, a2);
  }
}

uint64_t sub_25BAB2944(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t ScreenSharingAnnotationDisplayManager.detachViewController(forService:viewController:)(uint64_t a1, uint64_t a2)
{
  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  sub_25BAB6AB0();
  v3[18] = sub_25BAB6AA0();
  uint64_t v5 = sub_25BAB6A90();
  v3[19] = v5;
  v3[20] = v4;
  return MEMORY[0x270FA2498](sub_25BAB2A04, v5, v4);
}

uint64_t sub_25BAB2A04()
{
  uint64_t v1 = v0[15];
  id v2 = sub_25BAB25D0();
  v0[21] = v2;
  if (v1)
  {
    uint64_t v3 = v2;
    uint64_t v5 = v0[15];
    uint64_t v4 = v0[16];
    v0[2] = v0;
    v0[7] = v0 + 22;
    v0[3] = sub_25BAB2B34;
    uint64_t v6 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_25BAB2944;
    v0[13] = &block_descriptor;
    v0[14] = v6;
    objc_msgSend(v3, sel_removeContentViewController_withUserInteractionEnabled_forService_context_completion_, v4, 0, v5, 0, v0 + 10);
    id v2 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_25BAB2B34()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return MEMORY[0x270FA2498](sub_25BAB2C3C, v2, v1);
}

uint64_t sub_25BAB2C3C()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 176);

  if (v2 != 1)
  {
    sub_25BAB0138();
    swift_allocError();
    *uint64_t v4 = 4;
    swift_willThrow();
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25BAB2CF8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_26A536370 + dword_26A536370);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BAB326C;
  return v5(a1);
}

uint64_t sub_25BAB2DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25BAAEDB0;
  return ScreenSharingAnnotationDisplayManager.detachViewController(forService:viewController:)(a1, a2);
}

uint64_t sub_25BAB2E50(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  sub_25BAB6AB0();
  v2[17] = sub_25BAB6AA0();
  uint64_t v4 = sub_25BAB6A90();
  v2[18] = v4;
  v2[19] = v3;
  return MEMORY[0x270FA2498](sub_25BAB2EE8, v4, v3);
}

uint64_t sub_25BAB2EE8()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  id v3 = sub_25BAB25D0();
  v0[20] = v3;
  uint64_t v4 = *(void *)(v1 + 24);
  v0[21] = v4;
  v0[22] = *(void *)(v1 + 32);
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_25BAB302C;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25BAB2944;
  v0[13] = &block_descriptor_10;
  v0[14] = v5;
  objc_msgSend(v3, sel_addContentViewController_withUserInteractionEnabled_forService_context_userInterfaceStyle_forWindowScene_completion_, v4, 0, v2, 0, 2, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25BAB302C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  return MEMORY[0x270FA2498](sub_25BAB3134, v2, v1);
}

uint64_t sub_25BAB3134()
{
  uint64_t v1 = *(void **)(v0 + 160);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 184);

  if (v2 == 1)
  {
    id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    uint64_t v4 = *(void *)(v0 + 168);
    uint64_t v5 = *(void *)(v0 + 176);
    return v3(v4, v5);
  }
  else
  {
    sub_25BAB0138();
    swift_allocError();
    unsigned char *v7 = 3;
    swift_willThrow();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t type metadata accessor for ScreenSharingAnnotationDisplayManager()
{
  return self;
}

uint64_t method lookup function for ScreenSharingAnnotationDisplayManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScreenSharingAnnotationDisplayManager);
}

uint64_t dispatch thunk of ScreenSharingAnnotationDisplayManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t ScreenSharingAnnotationCoordinator.__allocating_init(withService:displayManager:)(uint64_t a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  ScreenSharingAnnotationCoordinator.init(withService:displayManager:)(a1, a2);
  return v4;
}

uint64_t ScreenSharingAnnotationCoordinator.init(withService:displayManager:)(uint64_t a1, long long *a2)
{
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v2 + 65) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  sub_25BAB3360(a2, (uint64_t)v5);
  swift_beginAccess();
  sub_25BAB3378((uint64_t)v5, v2 + 24);
  swift_endAccess();
  return v2;
}

uint64_t sub_25BAB3360(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25BAB3378(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BAB33E0()
{
  v1[10] = v0;
  sub_25BAB6AB0();
  v1[11] = sub_25BAB6AA0();
  uint64_t v3 = sub_25BAB6A90();
  v1[12] = v3;
  v1[13] = v2;
  return MEMORY[0x270FA2498](sub_25BAB3478, v3, v2);
}

uint64_t sub_25BAB3478()
{
  uint64_t v1 = v0[10];
  swift_beginAccess();
  if (*(void *)(v1 + 48))
  {
    uint64_t v2 = v0[10];
    sub_25BAB56D8(v1 + 24, (uint64_t)(v0 + 2));
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
    uint64_t v5 = MEMORY[0x2611703B0](v2 + 16);
    v0[14] = v5;
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 8) + **(int **)(v4 + 8));
    uint64_t v6 = (void *)swift_task_alloc();
    v0[15] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_25BAB3620;
    return v11(v5, v3, v4);
  }
  else
  {
    swift_release();
    uint64_t v8 = v0[10];
    uint64_t v9 = *(void **)(v8 + 64);
    *(void *)(v8 + 64) = 0;
    *(void *)(v8 + 72) = 0;

    id v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_25BAB3620(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 128) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = v6[12];
    uint64_t v8 = v6[13];
    uint64_t v9 = sub_25BAB37E8;
  }
  else
  {
    swift_unknownObjectRelease();
    v6[17] = a2;
    v6[18] = a1;
    uint64_t v7 = v6[12];
    uint64_t v8 = v6[13];
    uint64_t v9 = sub_25BAB375C;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_25BAB375C()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v3 = v0[10];
  uint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v1;
  *(void *)(v3 + 72) = v2;

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25BAB37E8()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_25BAB0138();
  swift_allocError();
  *uint64_t v2 = 3;
  swift_willThrow();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25BAB38A4()
{
  v1[10] = v0;
  sub_25BAB6AB0();
  v1[11] = sub_25BAB6AA0();
  uint64_t v3 = sub_25BAB6A90();
  v1[12] = v3;
  v1[13] = v2;
  return MEMORY[0x270FA2498](sub_25BAB393C, v3, v2);
}

uint64_t sub_25BAB393C()
{
  uint64_t v1 = v0[10];
  swift_beginAccess();
  if (*(void *)(v1 + 48))
  {
    uint64_t v2 = v0[10];
    sub_25BAB56D8(v1 + 24, (uint64_t)(v0 + 2));
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
    uint64_t v5 = MEMORY[0x2611703B0](v2 + 16);
    v0[14] = v5;
    uint64_t v6 = *(void **)(v2 + 64);
    v0[15] = v6;
    uint64_t v11 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))(*(void *)(v4 + 16) + **(int **)(v4 + 16));
    id v7 = v6;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[16] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_25BAB3AF4;
    return v11(v5, v6, v3, v4);
  }
  else
  {
    swift_release();
    id v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_25BAB3AF4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[12];
    uint64_t v4 = v2[13];
    uint64_t v5 = sub_25BAB3C84;
  }
  else
  {
    uint64_t v6 = (void *)v2[15];
    swift_unknownObjectRelease();

    uint64_t v3 = v2[12];
    uint64_t v4 = v2[13];
    uint64_t v5 = sub_25BAB3C14;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25BAB3C14()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BAB3C84()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = (void *)v0[15];
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  sub_25BAB0138();
  swift_allocError();
  *uint64_t v3 = 4;
  swift_willThrow();

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t ScreenSharingAnnotationCoordinator.deinit()
{
  sub_25BAB3D7C(v0 + 16);
  sub_25BAB3DA4(v0 + 24);

  return v0;
}

uint64_t sub_25BAB3D7C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BAB3DA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ScreenSharingAnnotationCoordinator.__deallocating_deinit()
{
  sub_25BAB3D7C(v0 + 16);
  sub_25BAB3DA4(v0 + 24);

  return MEMORY[0x270FA0228](v0, 81, 7);
}

uint64_t ScreenSharingAnnotationCoordinator.startAnnotationUIService()()
{
  v1[7] = v0;
  uint64_t v2 = sub_25BAB6A40();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_25BAB6AB0();
  v1[14] = sub_25BAB6AA0();
  uint64_t v4 = sub_25BAB6A90();
  v1[15] = v4;
  v1[16] = v3;
  return MEMORY[0x270FA2498](sub_25BAB3F68, v4, v3);
}

uint64_t sub_25BAB3F68()
{
  sub_25BAB6A20();
  swift_retain();
  uint64_t v1 = sub_25BAB6A30();
  os_log_type_t v2 = sub_25BAB6AC0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67240192;
    *(_DWORD *)(v0 + 168) = *(unsigned __int8 *)(v3 + 80);
    sub_25BAB6AE0();
    swift_release();
    _os_log_impl(&dword_25BAAD000, v1, v2, "Coordinator asked to start Screen Sharing Annotation UI Service. isRunning=%{BOOL,public}d", v4, 8u);
    MEMORY[0x261170310](v4, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 136) = v9;
  *(void *)(v0 + 144) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v5, v6);
  if (*(unsigned char *)(v8 + 80))
  {
    swift_release();
    sub_25BAB6A20();
    id v10 = sub_25BAB6A30();
    os_log_type_t v11 = sub_25BAB6AC0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25BAAD000, v10, v11, "Annotation UI Service already running.", v12, 2u);
      MEMORY[0x261170310](v12, -1, -1);
    }
    uint64_t v13 = *(void *)(v0 + 88);
    uint64_t v14 = *(void *)(v0 + 64);

    v9(v13, v14);
    sub_25BAB0138();
    swift_allocError();
    unsigned char *v15 = 5;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
  else
  {
    *(unsigned char *)(v8 + 80) = 1;
    unint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v18;
    *unint64_t v18 = v0;
    v18[1] = sub_25BAB422C;
    return sub_25BAB33E0();
  }
}

uint64_t sub_25BAB422C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v5 = sub_25BAB4498;
  }
  else {
    uint64_t v5 = sub_25BAB4368;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25BAB4368()
{
  swift_release();
  sub_25BAB6A20();
  uint64_t v1 = sub_25BAB6A30();
  os_log_type_t v2 = sub_25BAB6AC0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25BAAD000, v1, v2, "Coordinator did show Annotation UI on screen", v3, 2u);
    MEMORY[0x261170310](v3, -1, -1);
  }
  uint64_t v4 = (void (*)(uint64_t, uint64_t))v0[17];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[8];

  v4(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25BAB4498()
{
  char v23 = v0;
  uint64_t v1 = (void *)v0[20];
  swift_release();
  sub_25BAB6A20();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25BAB6A30();
  os_log_type_t v5 = sub_25BAB6AD0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[20];
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[17];
    uint64_t v19 = v0[8];
    uint64_t v20 = v0[10];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_getErrorValue();
    uint64_t v9 = sub_25BAB6BD0();
    v0[6] = sub_25BAB55B4(v9, v10, &v22);
    sub_25BAB6AE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25BAAD000, v4, v5, "Coordinator could not start Screen Sharing Annotation UI Service: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261170310](v8, -1, -1);
    MEMORY[0x261170310](v7, -1, -1);

    v21(v20, v19);
  }
  else
  {
    os_log_type_t v11 = (void *)v0[20];
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[17];
    uint64_t v13 = v0[10];
    uint64_t v14 = v0[8];

    v12(v13, v14);
  }
  char v15 = (void *)v0[20];
  *(unsigned char *)(v0[7] + 80) = 0;
  sub_25BAB0138();
  swift_allocError();
  *uint64_t v16 = 1;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t ScreenSharingAnnotationCoordinator.stopAnnotationUIService()()
{
  v1[7] = v0;
  uint64_t v2 = sub_25BAB6A40();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_25BAB6AB0();
  v1[14] = sub_25BAB6AA0();
  uint64_t v4 = sub_25BAB6A90();
  v1[15] = v4;
  v1[16] = v3;
  return MEMORY[0x270FA2498](sub_25BAB4840, v4, v3);
}

uint64_t sub_25BAB4840()
{
  sub_25BAB6A20();
  swift_retain();
  uint64_t v1 = sub_25BAB6A30();
  os_log_type_t v2 = sub_25BAB6AC0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67240192;
    *(_DWORD *)(v0 + 172) = *(unsigned __int8 *)(v3 + 80);
    sub_25BAB6AE0();
    swift_release();
    _os_log_impl(&dword_25BAAD000, v1, v2, "Coordinator asked to stop Screen Sharing Annotation UI Service. isRunning=%{BOOL,public}d", v4, 8u);
    MEMORY[0x261170310](v4, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 136) = v9;
  *(void *)(v0 + 144) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v5, v6);
  if (*(unsigned char *)(v8 + 80) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 56);
    *(unsigned char *)(v8 + 80) = 0;
    os_log_type_t v11 = *(void **)(v10 + 64);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v0 + 56) + 72);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      id v15 = v11;
      v14(ObjectType, v12);
    }
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_25BAB4B4C;
    return sub_25BAB38A4();
  }
  else
  {
    swift_release();
    sub_25BAB6A20();
    unint64_t v18 = sub_25BAB6A30();
    os_log_type_t v19 = sub_25BAB6AC0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_25BAAD000, v18, v19, "Annotation UI Service already not running.", v20, 2u);
      MEMORY[0x261170310](v20, -1, -1);
    }
    uint64_t v21 = *(void *)(v0 + 88);
    uint64_t v22 = *(void *)(v0 + 64);

    v9(v21, v22);
    sub_25BAB0138();
    swift_allocError();
    *char v23 = 6;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_25BAB4B4C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v5 = sub_25BAB4E04;
  }
  else {
    uint64_t v5 = sub_25BAB4C88;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25BAB4C88()
{
  swift_release();
  sub_25BAB6A20();
  swift_retain();
  uint64_t v1 = sub_25BAB6A30();
  os_log_type_t v2 = sub_25BAB6AC0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67240192;
    *(_DWORD *)(v0 + 168) = *(unsigned __int8 *)(v3 + 80);
    sub_25BAB6AE0();
    swift_release();
    _os_log_impl(&dword_25BAAD000, v1, v2, "Coordinator did hide Screen Sharing UI on main screen (isRunning=%{BOOL,public}d)", v4, 8u);
    MEMORY[0x261170310](v4, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = *(void *)(v0 + 56);
  (*(void (**)(void, void))(v0 + 136))(*(void *)(v0 + 96), *(void *)(v0 + 64));
  uint64_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = 0;
  *(void *)(v5 + 72) = 0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_25BAB4E04()
{
  char v23 = v0;
  uint64_t v1 = (void *)v0[20];
  swift_release();
  sub_25BAB6A20();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25BAB6A30();
  os_log_type_t v5 = sub_25BAB6AD0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[20];
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[17];
    uint64_t v19 = v0[8];
    uint64_t v20 = v0[10];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_getErrorValue();
    uint64_t v9 = sub_25BAB6BD0();
    v0[6] = sub_25BAB55B4(v9, v10, &v22);
    sub_25BAB6AE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25BAAD000, v4, v5, "Coordinator could not stop Screen Sharing: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261170310](v8, -1, -1);
    MEMORY[0x261170310](v7, -1, -1);

    v21(v20, v19);
  }
  else
  {
    os_log_type_t v11 = (void *)v0[20];
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[17];
    uint64_t v13 = v0[10];
    uint64_t v14 = v0[8];

    v12(v13, v14);
  }
  id v15 = (void *)v0[20];
  *(unsigned char *)(v0[7] + 80) = 1;
  sub_25BAB0138();
  swift_allocError();
  *uint64_t v16 = 2;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t ScreenSharingAnnotationCoordinator.processTapGestureMessage(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a1;
  *(void *)(v2 + 40) = *(void *)(a1 + 16);
  sub_25BAB6AB0();
  *(void *)(v2 + 48) = sub_25BAB6AA0();
  uint64_t v4 = sub_25BAB6A90();
  return MEMORY[0x270FA2498](sub_25BAB513C, v4, v3);
}

uint64_t sub_25BAB513C()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[2];
  swift_release();
  uint64_t v2 = *(void **)(v1 + 64);
  if (v2)
  {
    uint64_t v3 = v0[5];
    uint64_t v5 = v0[3];
    uint64_t v4 = v0[4];
    uint64_t v6 = *(void *)(v0[2] + 72);
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v5;
    v12[1] = v4;
    v12[2] = v3;
    uint64_t v8 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 16);
    id v9 = v2;
    v8(v12, ObjectType, v6);
  }
  unint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t ScreenSharingAnnotationCoordinator.processDragGestureMessage(_:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_25BAB6AB0();
  v2[4] = sub_25BAB6AA0();
  uint64_t v4 = sub_25BAB6A90();
  return MEMORY[0x270FA2498](sub_25BAB52A8, v4, v3);
}

uint64_t sub_25BAB52A8()
{
  uint64_t v1 = v0[3];
  swift_release();
  uint64_t v2 = *(void **)(v1 + 64);
  if (v2)
  {
    uint64_t v3 = v0[2];
    uint64_t v4 = *(void *)(v0[3] + 72);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    id v7 = v2;
    v6(v3, ObjectType, v4);
  }
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_25BAB5360()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25BAAF15C;
  return ScreenSharingAnnotationCoordinator.startAnnotationUIService()();
}

uint64_t sub_25BAB53F0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25BAAEDB0;
  return ScreenSharingAnnotationCoordinator.stopAnnotationUIService()();
}

uint64_t sub_25BAB5480(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BAAEDB0;
  return ScreenSharingAnnotationCoordinator.processTapGestureMessage(_:)(a1);
}

uint64_t sub_25BAB5518(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_25BAB6AB0();
  v2[4] = sub_25BAB6AA0();
  uint64_t v5 = sub_25BAB6A90();
  return MEMORY[0x270FA2498](sub_25BAB52A8, v5, v4);
}

uint64_t sub_25BAB55B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25BAB573C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25BAB01E8((uint64_t)v12, *a3);
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
      sub_25BAB01E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for ScreenSharingAnnotationCoordinator()
{
  return self;
}

uint64_t method lookup function for ScreenSharingAnnotationCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScreenSharingAnnotationCoordinator);
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinator.__allocating_init(withService:displayManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_25BAB56D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25BAB573C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25BAB6AF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25BAB58F8(a5, a6);
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
  uint64_t v8 = sub_25BAB6B40();
  if (!v8)
  {
    sub_25BAB6B50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25BAB6B70();
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

uint64_t sub_25BAB58F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BAB5990(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25BAB5B70(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25BAB5B70(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25BAB5990(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25BAB5B08(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25BAB6B30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25BAB6B50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25BAB6A80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25BAB6B70();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25BAB6B50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25BAB5B08(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5363F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25BAB5B70(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5363F8);
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
  uint64_t result = sub_25BAB6B70();
  __break(1u);
  return result;
}

uint64_t sub_25BAB5CC4(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x746E696F70;
  }
}

BOOL sub_25BAB5CFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25BAB5D14()
{
  return sub_25BAB5CC4(*v0);
}

uint64_t sub_25BAB5D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BAB67E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_25BAB5D44(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25BAB5D50(uint64_t a1)
{
  unint64_t v2 = sub_25BAB5F74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BAB5D8C(uint64_t a1)
{
  unint64_t v2 = sub_25BAB5F74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TapGestureMessage.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536400);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  int64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAB5F74();
  sub_25BAB6C60();
  v12[0] = v9;
  v12[1] = v10;
  char v13 = 0;
  type metadata accessor for CGPoint();
  sub_25BAB61B0(&qword_26A536248);
  sub_25BAB6BA0();
  if (!v2)
  {
    LOBYTE(v12[0]) = 1;
    sub_25BAB6BB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_25BAB5F74()
{
  unint64_t result = qword_26A536408;
  if (!qword_26A536408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536408);
  }
  return result;
}

uint64_t TapGestureMessage.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536410);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAB5F74();
  sub_25BAB6C50();
  if (!v2)
  {
    type metadata accessor for CGPoint();
    char v15 = 0;
    sub_25BAB61B0(&qword_26A536260);
    sub_25BAB6B80();
    uint64_t v10 = v14[0];
    uint64_t v11 = v14[1];
    LOBYTE(v14[0]) = 1;
    uint64_t v12 = sub_25BAB6B90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25BAB61B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGPoint();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25BAB61F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return TapGestureMessage.init(from:)(a1, a2);
}

uint64_t sub_25BAB620C(void *a1)
{
  return TapGestureMessage.encode(to:)(a1);
}

uint64_t TapGestureMessage.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v14 = sub_25BAB69C0();
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_25BAB00A0((uint64_t)v17), (v5 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_25BAB00E4((uint64_t)v17);
  if (!*((void *)&v19 + 1)) {
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v6 = v14;
  uint64_t v15 = sub_25BAB69D0();
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v7 = sub_25BAB00A0((uint64_t)v17), (v8 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_25BAB00E4((uint64_t)v17);
  if (!*((void *)&v19 + 1))
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    sub_25BAB6468((uint64_t)&v18);
LABEL_19:
    sub_25BAB0138();
    swift_allocError();
    *uint64_t v12 = 7;
    return swift_willThrow();
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v9 = v15;
  uint64_t v16 = sub_25BAB69E0();
  sub_25BAB6B20();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_25BAB00A0((uint64_t)v17), (v11 & 1) != 0))
  {
    sub_25BAB01E8(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_25BAB00E4((uint64_t)v17);
  if (!*((void *)&v19 + 1)) {
    goto LABEL_17;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_19;
  }
  *a2 = v6;
  a2[1] = v9;
  a2[2] = v16;
  return result;
}

uint64_t sub_25BAB6468(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A536270);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TapGestureMessage(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TapGestureMessage(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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

ValueMetadata *type metadata accessor for TapGestureMessage()
{
  return &type metadata for TapGestureMessage;
}

uint64_t getEnumTagSinglePayload for TapGestureMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TapGestureMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25BAB6694);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_25BAB66BC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TapGestureMessage.CodingKeys()
{
  return &type metadata for TapGestureMessage.CodingKeys;
}

unint64_t sub_25BAB66DC()
{
  unint64_t result = qword_26A536418;
  if (!qword_26A536418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536418);
  }
  return result;
}

unint64_t sub_25BAB6734()
{
  unint64_t result = qword_26A536420;
  if (!qword_26A536420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536420);
  }
  return result;
}

unint64_t sub_25BAB678C()
{
  unint64_t result = qword_26A536428;
  if (!qword_26A536428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536428);
  }
  return result;
}

uint64_t sub_25BAB67E0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E696F70 && a2 == 0xE500000000000000;
  if (v3 || (sub_25BAB6BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025BAB8130)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25BAB6BC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25BAB68C0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25BAB68D0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25BAB68E0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25BAB68F0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25BAB6900()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25BAB6910()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25BAB6920()
{
  return MEMORY[0x270F5CC98]();
}

uint64_t sub_25BAB6930()
{
  return MEMORY[0x270F5CCA0]();
}

uint64_t sub_25BAB6940()
{
  return MEMORY[0x270F5CCA8]();
}

uint64_t sub_25BAB6950()
{
  return MEMORY[0x270F5CCB0]();
}

uint64_t sub_25BAB6960()
{
  return MEMORY[0x270F5CCB8]();
}

uint64_t sub_25BAB6970()
{
  return MEMORY[0x270F5CCC0]();
}

uint64_t sub_25BAB6980()
{
  return MEMORY[0x270F5CCC8]();
}

uint64_t sub_25BAB6990()
{
  return MEMORY[0x270F5CCD0]();
}

uint64_t sub_25BAB69A0()
{
  return MEMORY[0x270F5CCD8]();
}

uint64_t sub_25BAB69B0()
{
  return MEMORY[0x270F5CCE0]();
}

uint64_t sub_25BAB69C0()
{
  return MEMORY[0x270F5CCE8]();
}

uint64_t sub_25BAB69D0()
{
  return MEMORY[0x270F5CCF0]();
}

uint64_t sub_25BAB69E0()
{
  return MEMORY[0x270F5CCF8]();
}

uint64_t sub_25BAB69F0()
{
  return MEMORY[0x270F5CD00]();
}

uint64_t sub_25BAB6A00()
{
  return MEMORY[0x270F5CD08]();
}

uint64_t sub_25BAB6A10()
{
  return MEMORY[0x270F5CD10]();
}

uint64_t sub_25BAB6A20()
{
  return MEMORY[0x270F5CD18]();
}

uint64_t sub_25BAB6A30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BAB6A40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BAB6A50()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_25BAB6A60()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25BAB6A70()
{
  return MEMORY[0x270F016C8]();
}

uint64_t sub_25BAB6A80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BAB6A90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25BAB6AA0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25BAB6AB0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25BAB6AC0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25BAB6AD0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BAB6AE0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BAB6AF0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BAB6B00()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25BAB6B10()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25BAB6B20()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25BAB6B30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BAB6B40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BAB6B50()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BAB6B60()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25BAB6B70()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BAB6B80()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25BAB6B90()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25BAB6BA0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25BAB6BB0()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25BAB6BC0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BAB6BD0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25BAB6BE0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BAB6BF0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BAB6C00()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BAB6C10()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BAB6C20()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BAB6C30()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BAB6C40()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25BAB6C50()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25BAB6C60()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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