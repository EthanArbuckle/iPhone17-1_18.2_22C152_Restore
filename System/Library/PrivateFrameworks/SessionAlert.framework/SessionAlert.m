uint64_t sub_1C7D5CF1C()
{
  uint64_t v0;
  uint64_t vars8;

  MEMORY[0x1C87C2080](*(void *)(v0 + 16), -1, -1);
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for UnfairLock()
{
  return self;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1EA502990)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA502990);
    }
  }
}

double static DismissOption.systemDefaultDismissInterval.getter()
{
  return 6.0;
}

void static DismissOption.systemDefault.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x4018000000000000;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t DismissOption.hash(into:)()
{
  if (*(unsigned char *)(v0 + 8) == 1) {
    return sub_1C7D78ED0();
  }
  sub_1C7D78ED0();
  return sub_1C7D78EE0();
}

uint64_t static DismissOption.== infix(_:_:)(uint64_t a1, uint64_t a2)
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

uint64_t sub_1C7D5D0A4()
{
  return 1;
}

uint64_t sub_1C7D5D0AC()
{
  return sub_1C7D78EF0();
}

uint64_t sub_1C7D5D0F0()
{
  return sub_1C7D78ED0();
}

uint64_t sub_1C7D5D118()
{
  return sub_1C7D78EF0();
}

uint64_t sub_1C7D5D15C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D5EA14(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1C7D5D188()
{
  return 0;
}

void sub_1C7D5D194(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C7D5D1A0(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5D980();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D5D1DC(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5D980();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D5D218(char a1)
{
  return *(void *)&aNever_0[8 * a1];
}

BOOL sub_1C7D5D238(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s12SessionAlert0B0V9NecessityO9hashValueSivg_0()
{
  return sub_1C7D78EF0();
}

uint64_t sub_1C7D5D294()
{
  return sub_1C7D78ED0();
}

uint64_t sub_1C7D5D2C0()
{
  return sub_1C7D78EF0();
}

uint64_t sub_1C7D5D304()
{
  return sub_1C7D5D218(*v0);
}

uint64_t sub_1C7D5D30C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D5EA90(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C7D5D334(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C7D5D340(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5D92C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D5D37C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5D92C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D5D3B8()
{
  return 0;
}

uint64_t sub_1C7D5D3C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1C7D5D3F4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5DA28();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D5D430(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5DA28();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D5D46C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5D9D4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D5D4A8(uint64_t a1)
{
  unint64_t v2 = sub_1C7D5D9D4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t DismissOption.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502998);
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  MEMORY[0x1F4188790]();
  unsigned int v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029A0);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  MEMORY[0x1F4188790]();
  v25 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029A8);
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t v24 = v9;
  MEMORY[0x1F4188790]();
  v22 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029B0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *v2;
  int v16 = *((unsigned __int8 *)v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D5D92C();
  sub_1C7D78F10();
  if (v16 == 1)
  {
    if (v15)
    {
      char v31 = 1;
      sub_1C7D5D9D4();
      v17 = v25;
      sub_1C7D78E50();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
    }
    else
    {
      char v30 = 0;
      sub_1C7D5DA28();
      v17 = v22;
      sub_1C7D78E50();
      uint64_t v19 = v23;
      uint64_t v18 = v24;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    char v32 = 2;
    sub_1C7D5D980();
    sub_1C7D78E50();
    uint64_t v20 = v29;
    sub_1C7D78E70();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
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

unint64_t sub_1C7D5D92C()
{
  unint64_t result = qword_1EA5029B8;
  if (!qword_1EA5029B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5029B8);
  }
  return result;
}

unint64_t sub_1C7D5D980()
{
  unint64_t result = qword_1EA5029C0;
  if (!qword_1EA5029C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5029C0);
  }
  return result;
}

unint64_t sub_1C7D5D9D4()
{
  unint64_t result = qword_1EA5029C8;
  if (!qword_1EA5029C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5029C8);
  }
  return result;
}

unint64_t sub_1C7D5DA28()
{
  unint64_t result = qword_1EA5029D0;
  if (!qword_1EA5029D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5029D0);
  }
  return result;
}

uint64_t DismissOption.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1C7D78EC0();
  sub_1C7D78ED0();
  if (v1 != 1) {
    sub_1C7D78EE0();
  }
  return sub_1C7D78EF0();
}

uint64_t DismissOption.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029D8);
  uint64_t v36 = *(void *)(v34 - 8);
  MEMORY[0x1F4188790]();
  v39 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029E0);
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029E8);
  uint64_t v38 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029F0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1C7D5D92C();
  uint64_t v14 = v41;
  sub_1C7D78F00();
  if (v14) {
    goto LABEL_11;
  }
  uint64_t v32 = v6;
  uint64_t v16 = v38;
  uint64_t v15 = v39;
  uint64_t v41 = v10;
  uint64_t v17 = sub_1C7D78E40();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v20 = sub_1C7D78D60();
    swift_allocError();
    v21 = v12;
    uint64_t v22 = v9;
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029F8);
    *uint64_t v24 = &type metadata for DismissOption;
    sub_1C7D78DF0();
    sub_1C7D78D50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v24, *MEMORY[0x1E4FBBA70], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v22);
LABEL_11:
    uint64_t v25 = (uint64_t)v40;
    return __swift_destroy_boxed_opaque_existential_1(v25);
  }
  if (*(unsigned char *)(v17 + 32))
  {
    if (*(unsigned char *)(v17 + 32) != 1)
    {
      char v44 = 2;
      sub_1C7D5D980();
      uint64_t v27 = v15;
      sub_1C7D78DE0();
      uint64_t v26 = v37;
      uint64_t v29 = v34;
      sub_1C7D78E20();
      uint64_t v19 = v30;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
      uint64_t v25 = (uint64_t)v40;
      char v18 = 0;
      goto LABEL_9;
    }
    char v43 = 1;
    sub_1C7D5D9D4();
    sub_1C7D78DE0();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v5, v35);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    char v18 = 1;
    uint64_t v19 = 1;
  }
  else
  {
    char v42 = 0;
    sub_1C7D5DA28();
    sub_1C7D78DE0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    char v18 = 1;
    uint64_t v19 = 0;
  }
  uint64_t v25 = (uint64_t)v40;
  uint64_t v26 = v37;
LABEL_9:
  *(void *)uint64_t v26 = v19;
  *(unsigned char *)(v26 + 8) = v18;
  return __swift_destroy_boxed_opaque_existential_1(v25);
}

uint64_t sub_1C7D5E09C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DismissOption.init(from:)(a1, a2);
}

uint64_t sub_1C7D5E0B4(void *a1)
{
  return DismissOption.encode(to:)(a1);
}

uint64_t sub_1C7D5E0D4()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1C7D78EC0();
  sub_1C7D78ED0();
  if (v1 != 1) {
    sub_1C7D78EE0();
  }
  return sub_1C7D78EF0();
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

unint64_t sub_1C7D5E1A4()
{
  unint64_t result = qword_1EA502A00;
  if (!qword_1EA502A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A00);
  }
  return result;
}

uint64_t sub_1C7D5E1F8(uint64_t a1, uint64_t a2)
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

uint64_t dispatch thunk of AlertManagerDelegate.alertManager(_:didDismiss:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DismissOption(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DismissOption(uint64_t result, int a2, int a3)
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

uint64_t sub_1C7D5E2C8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C7D5E2E8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DismissOption()
{
  return &type metadata for DismissOption;
}

uint64_t dispatch thunk of AlertManaging.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AlertManaging.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AlertManaging.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AlertManaging.alert(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AlertManaging.hasAlert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of AlertManaging.presentAlert(identifier:payload:coordinated:dismissOption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 48))();
}

uint64_t dispatch thunk of AlertManaging.dismissAlert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DismissOption.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DismissOption.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7D5E50CLL);
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

uint64_t sub_1C7D5E534(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C7D5E53C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DismissOption.CodingKeys()
{
  return &type metadata for DismissOption.CodingKeys;
}

ValueMetadata *type metadata accessor for DismissOption.NeverCodingKeys()
{
  return &type metadata for DismissOption.NeverCodingKeys;
}

ValueMetadata *type metadata accessor for DismissOption.NextUpdateCodingKeys()
{
  return &type metadata for DismissOption.NextUpdateCodingKeys;
}

uint64_t getEnumTagSinglePayload for DismissOption.AfterCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DismissOption.AfterCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C7D5E664);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C7D5E68C()
{
  return 0;
}

ValueMetadata *type metadata accessor for DismissOption.AfterCodingKeys()
{
  return &type metadata for DismissOption.AfterCodingKeys;
}

unint64_t sub_1C7D5E6A8()
{
  unint64_t result = qword_1EA502A08;
  if (!qword_1EA502A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A08);
  }
  return result;
}

unint64_t sub_1C7D5E700()
{
  unint64_t result = qword_1EA502A10;
  if (!qword_1EA502A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A10);
  }
  return result;
}

unint64_t sub_1C7D5E758()
{
  unint64_t result = qword_1EA502A18;
  if (!qword_1EA502A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A18);
  }
  return result;
}

unint64_t sub_1C7D5E7B0()
{
  unint64_t result = qword_1EA502A20;
  if (!qword_1EA502A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A20);
  }
  return result;
}

unint64_t sub_1C7D5E808()
{
  unint64_t result = qword_1EA502A28;
  if (!qword_1EA502A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A28);
  }
  return result;
}

unint64_t sub_1C7D5E860()
{
  unint64_t result = qword_1EA502A30;
  if (!qword_1EA502A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A30);
  }
  return result;
}

unint64_t sub_1C7D5E8B8()
{
  unint64_t result = qword_1EA502A38;
  if (!qword_1EA502A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A38);
  }
  return result;
}

unint64_t sub_1C7D5E910()
{
  unint64_t result = qword_1EA502A40;
  if (!qword_1EA502A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A40);
  }
  return result;
}

unint64_t sub_1C7D5E968()
{
  unint64_t result = qword_1EA502A48;
  if (!qword_1EA502A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A48);
  }
  return result;
}

unint64_t sub_1C7D5E9C0()
{
  unint64_t result = qword_1EA502A50;
  if (!qword_1EA502A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502A50);
  }
  return result;
}

uint64_t sub_1C7D5EA14(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1C7D5EA84()
{
  return 12383;
}

uint64_t sub_1C7D5EA90(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726576656ELL && a2 == 0xE500000000000000;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616470557478656ELL && a2 == 0xEA00000000006574 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265746661 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void sub_1C7D5EBD4()
{
  qword_1EBC68D50 = 0x7472656C61;
  *(void *)algn_1EBC68D58 = 0xE500000000000000;
}

uint64_t static AlertCenter.zone.getter()
{
  if (qword_1EBC68D60 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EBC68D50;
  swift_bridgeObjectRetain();
  return v0;
}

void *sub_1C7D5EC5C()
{
  unint64_t result = (void *)sub_1C7D6BB20((uint64_t)&unk_1F2257308);
  off_1EBC68E10 = result;
  return result;
}

double sub_1C7D5EC84@<D0>(_OWORD *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A58);
  sub_1C7D78CC0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1C7D5ECF8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A58);
  sub_1C7D78CC0();
  return v1;
}

uint64_t sub_1C7D5ED64@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C7D6C84C(a1);
}

uint64_t sub_1C7D5ED7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v6 = *(NSObject **)(v3 + 16);
  BOOL v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C7D5EF34;
  *(void *)(v8 + 24) = v7;
  v11[4] = sub_1C7D5EF58;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C7D5EF80;
  v11[3] = &block_descriptor;
  uint64_t v9 = _Block_copy(v11);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  swift_unknownObjectRelease();
  _Block_release(v9);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a1) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7D5EEF4()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C7D5EF34()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  *(void *)(v2 + 152) = v0[4];
  return MEMORY[0x1F4186840](v2 + 144, v1);
}

uint64_t sub_1C7D5EF48()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7D5EF58()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C7D5EF80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

void (*sub_1C7D5EFC0(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A58);
  sub_1C7D78CC0();
  *(_OWORD *)uint64_t v3 = *((_OWORD *)v3 + 1);
  return sub_1C7D5F070;
}

void sub_1C7D5F070(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  uint64_t v4 = v2[1];
  if (a2)
  {
    uint64_t v5 = swift_unknownObjectRetain();
    sub_1C7D5ED7C(v5, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C7D5ED7C(v3, v2[1]);
  }
  free(v2);
}

void *AlertCenter.__allocating_init(store:syncEngine:presenter:watchdogIntervals:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_allocObject();
  uint64_t v10 = sub_1C7D6BBF8(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v10;
}

void *AlertCenter.init(store:syncEngine:presenter:watchdogIntervals:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = sub_1C7D6BBF8(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t AlertCenter.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_bridgeObjectRelease();
  sub_1C7D6C0A0(v0 + 144);
  return v0;
}

uint64_t AlertCenter.__deallocating_deinit()
{
  AlertCenter.deinit();
  return MEMORY[0x1F4186488](v0, 160, 7);
}

uint64_t AlertCenter.alert(with:)()
{
  return sub_1C7D78CC0();
}

uint64_t sub_1C7D5F288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 96;
  swift_beginAccess();
  sub_1C7D6D970(v5, (uint64_t)v9);
  uint64_t v6 = v10;
  uint64_t v7 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a3, v6, v7);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

Swift::Bool __swiftcall AlertCenter.hasAlert(identifier:)(Swift::String identifier)
{
  object = identifier._object;
  uint64_t countAndFlagsBits = identifier._countAndFlagsBits;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790]();
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = v1;
  uint64_t v10 = countAndFlagsBits;
  uint64_t v11 = object;
  sub_1C7D78CC0();
  uint64_t v6 = type metadata accessor for Alert(0);
  LOBYTE(object) = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6) != 1;
  sub_1C7D6C94C((uint64_t)v5, &qword_1EBC68DB0);
  return (char)object;
}

uint64_t AlertCenter.presentAlert(identifier:payload:coordinated:dismissOption:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5, uint64_t *a6)
{
  uint64_t v7 = v6;
  unint64_t v71 = a4;
  uint64_t v61 = a1;
  uint64_t v68 = sub_1C7D78A00();
  uint64_t v66 = *(void *)(v68 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v68);
  v63 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v55 - v14;
  uint64_t v62 = type metadata accessor for Alert(0);
  uint64_t v64 = *(void *)(v62 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v62);
  uint64_t v67 = (uint64_t)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v55 - v19;
  uint64_t v65 = v21;
  MEMORY[0x1F4188790](v18);
  uint64_t v69 = (uint64_t)&v55 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A60);
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v25 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = *a6;
  int v60 = *((unsigned __int8 *)a6 + 8);
  if (a5)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 32), *(void *)(v7 + 56));
    sub_1C7D78AE0();
    uint64_t v26 = sub_1C7D78B20();
    BOOL v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v25, 1, v26) == 1;
    sub_1C7D6C94C((uint64_t)v25, &qword_1EA502A60);
  }
  else
  {
    BOOL v70 = 1;
  }
  swift_bridgeObjectRetain();
  sub_1C7D789E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A68);
  uint64_t v27 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  unint64_t v28 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1C7D79990;
  unint64_t v30 = v29 + v28;
  v56 = v15;
  uint64_t v55 = a2;
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 32), *(void *)(v7 + 56));
  uint64_t v57 = a3;
  sub_1C7D6C0E8(a3, v71);
  uint64_t v31 = sub_1C7D78AF0();
  uint64_t v33 = v32;
  uint64_t v58 = v7;
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 32), *(void *)(v7 + 56));
  uint64_t v34 = sub_1C7D78AF0();
  uint64_t v36 = v35;
  uint64_t result = sub_1C7D789E0();
  *(unsigned char *)unint64_t v30 = v70;
  *(void *)(v30 + 8) = v31;
  *(void *)(v30 + 16) = v33;
  *(void *)(v30 + 24) = v34;
  *(void *)(v30 + 32) = v36;
  *(unsigned char *)(v30 + 40) = 0;
  if (!*(void *)(v29 + 16))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v38 = (int *)v62;
  uint64_t v39 = v55;
  *(void *)uint64_t v20 = v61;
  *((void *)v20 + 1) = v39;
  uint64_t v40 = v66;
  uint64_t v41 = v56;
  uint64_t v42 = v68;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(&v20[v38[5]], v56, v68);
  char v43 = &v20[v38[7]];
  *(void *)char v43 = v59;
  v43[8] = v60;
  char v44 = v63;
  sub_1C7D78990();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(&v20[v38[6]], v44, v42);
  v45 = (uint64_t *)&v20[v38[8]];
  unint64_t v46 = v71;
  uint64_t *v45 = v57;
  v45[1] = v46;
  *(void *)&v20[v38[9]] = v29;
  uint64_t v47 = v69;
  sub_1C7D6CAF8((uint64_t)v20, v69, type metadata accessor for Alert);
  uint64_t v48 = v58;
  v49 = *(NSObject **)(v58 + 16);
  uint64_t v50 = v67;
  sub_1C7D6CA30(v47, v67, type metadata accessor for Alert);
  unint64_t v51 = (*(unsigned __int8 *)(v64 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
  uint64_t v52 = swift_allocObject();
  *(void *)(v52 + 16) = v48;
  sub_1C7D6CAF8(v50, v52 + v51, type metadata accessor for Alert);
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = sub_1C7D6C19C;
  *(void *)(v53 + 24) = v52;
  aBlock[4] = sub_1C7D6DA1C;
  aBlock[5] = v53;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C7D5EF80;
  aBlock[3] = &block_descriptor_15;
  v54 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v49, v54);
  _Block_release(v54);
  sub_1C7D6CA98(v47, type metadata accessor for Alert);
  LOBYTE(v51) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v51) {
LABEL_8:
  }
    __break(1u);
  return result;
}

void sub_1C7D5FA94(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A60);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  v200 = (char *)v198 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v208 = (char *)v198 - v7;
  uint64_t v212 = type metadata accessor for Alert(0);
  uint64_t v206 = *(void *)(v212 - 8);
  uint64_t v8 = *(void *)(v206 + 64);
  uint64_t v9 = MEMORY[0x1F4188790](v212);
  v211 = (void *)((char *)v198 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v198 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  v207 = (void *)((char *)v198 - v14);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v201 = (void *)((char *)v198 - v16);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (void *)((char *)v198 - v18);
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  v203 = (void *)((char *)v198 - v21);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  v204 = (void *)((char *)v198 - v23);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  v209 = (void *)((char *)v198 - v25);
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  v210 = (void *)((char *)v198 - v27);
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  v202 = (void *)((char *)v198 - v29);
  MEMORY[0x1F4188790](v28);
  uint64_t v31 = (char *)v198 - v30;
  uint64_t v32 = sub_1C7D78C20();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v35 = (void *)((char *)v198 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v36 = (void *)v2[2];
  *uint64_t v35 = v36;
  (*(void (**)(void *, void, uint64_t))(v33 + 104))(v35, *MEMORY[0x1E4FBCBF0], v32);
  id v37 = v36;
  LOBYTE(v36) = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v33 + 8))(v35, v32);
  if (v36)
  {
    v205 = v12;
    sub_1C7D68EE4(*a1, a1[1]);
    if (qword_1EBC68F80 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v38 = sub_1C7D78BD0();
  uint64_t v39 = __swift_project_value_buffer(v38, (uint64_t)qword_1EBC68F68);
  sub_1C7D6CA30((uint64_t)a1, (uint64_t)v31, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v40 = sub_1C7D78BC0();
  os_log_type_t v41 = sub_1C7D78C90();
  BOOL v42 = os_log_type_enabled(v40, v41);
  v213 = a1;
  v199 = v19;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    v198[1] = v39;
    uint64_t v44 = v43;
    v198[0] = swift_slowAlloc();
    v215[0] = v198[0];
    *(_DWORD *)uint64_t v44 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    uint64_t v45 = sub_1C7D78AF0();
    uint64_t v214 = sub_1C7D6B1E0(v45, v46, v215);
    a1 = v213;
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2082;
    uint64_t v47 = Alert.description.getter();
    uint64_t v214 = sub_1C7D6B1E0(v47, v48, v215);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v31, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v40, v41, "(%{private}s): Advancing alert to next state: %{public}s", (uint8_t *)v44, 0x16u);
    uint64_t v49 = v198[0];
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v49, -1, -1);
    MEMORY[0x1C87C2080](v44, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v31, type metadata accessor for Alert);
  }

  if (sub_1C7D68A50((uint64_t)a1))
  {
    uint64_t v50 = v211;
    sub_1C7D6CA30((uint64_t)a1, (uint64_t)v211, type metadata accessor for Alert);
    swift_retain_n();
    unint64_t v51 = sub_1C7D78BC0();
    os_log_type_t v52 = sub_1C7D78C90();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      v215[0] = v54;
      *(_DWORD *)uint64_t v53 = 136380931;
      __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
      uint64_t v55 = sub_1C7D78AF0();
      uint64_t v214 = sub_1C7D6B1E0(v55, v56, v215);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v53 + 12) = 2082;
      uint64_t v57 = *v50;
      unint64_t v58 = v50[1];
      swift_bridgeObjectRetain();
      uint64_t v214 = sub_1C7D6B1E0(v57, v58, v215);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      sub_1C7D6CA98((uint64_t)v50, type metadata accessor for Alert);
      uint64_t v59 = "(%{private}s): Current state is obsolete; abandoning further action: %{public}s";
LABEL_9:
      _os_log_impl(&dword_1C7D5B000, v51, v52, v59, (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      int v60 = (void *)v54;
LABEL_10:
      MEMORY[0x1C87C2080](v60, -1, -1);
      MEMORY[0x1C87C2080](v53, -1, -1);
LABEL_69:

      return;
    }
    swift_release_n();
    uint64_t v75 = (uint64_t)v50;
LABEL_68:
    sub_1C7D6CA98(v75, type metadata accessor for Alert);
    goto LABEL_69;
  }
  uint64_t v61 = *(int *)(v212 + 36);
  uint64_t v62 = *(uint64_t *)((char *)a1 + v61);
  uint64_t v63 = *(void *)(v62 + 16);
  if (!v63)
  {
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v211 = v2;
  uint64_t v64 = v63 - 1;
  uint64_t v65 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  unint64_t v66 = (*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
  uint64_t v67 = *(void *)(v65 + 72);
  unint64_t v68 = v62 + v66 + v67 * v64;
  unsigned int v69 = *(unsigned __int8 *)(v68 + 40);
  if (!(v69 >> 6))
  {
    if ((v69 & 1) == 0)
    {
      uint64_t v77 = *(void *)(v68 + 24);
      uint64_t v76 = *(void *)(v68 + 32);
      uint64_t v78 = (uint64_t)v211;
      __swift_project_boxed_opaque_existential_1(v211 + 4, v211[7]);
      swift_bridgeObjectRetain();
      if (v77 == sub_1C7D78AF0() && v76 == v79)
      {
        swift_bridgeObjectRelease_n();
        v80 = v213;
      }
      else
      {
        char v122 = sub_1C7D78EA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v80 = v213;
        if ((v122 & 1) == 0)
        {
          v159 = v202;
          sub_1C7D6CA30((uint64_t)v213, (uint64_t)v202, type metadata accessor for Alert);
          swift_retain_n();
          unint64_t v51 = sub_1C7D78BC0();
          os_log_type_t v160 = sub_1C7D78C90();
          if (os_log_type_enabled(v51, v160))
          {
            uint64_t v53 = swift_slowAlloc();
            v213 = (uint64_t *)swift_slowAlloc();
            v215[0] = (uint64_t)v213;
            *(_DWORD *)uint64_t v53 = 136380931;
            __swift_project_boxed_opaque_existential_1((void *)(v78 + 32), *(void *)(v78 + 56));
            uint64_t v161 = sub_1C7D78AF0();
            uint64_t v214 = sub_1C7D6B1E0(v161, v162, v215);
            sub_1C7D78CF0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v53 + 12) = 2082;
            uint64_t v163 = *v159;
            unint64_t v164 = v159[1];
            swift_bridgeObjectRetain();
            uint64_t v214 = sub_1C7D6B1E0(v163, v164, v215);
            sub_1C7D78CF0();
            swift_bridgeObjectRelease();
            sub_1C7D6CA98((uint64_t)v159, type metadata accessor for Alert);
            _os_log_impl(&dword_1C7D5B000, v51, v160, "(%{private}s): Ignoring alert request not intended for this device: %{public}s", (uint8_t *)v53, 0x16u);
            v165 = v213;
            swift_arrayDestroy();
            int v60 = v165;
            goto LABEL_10;
          }
          swift_release_n();
          uint64_t v75 = (uint64_t)v159;
          goto LABEL_68;
        }
      }
      sub_1C7D66C54((uint64_t)v80);
      return;
    }
    v101 = v210;
    sub_1C7D6CA30((uint64_t)a1, (uint64_t)v210, type metadata accessor for Alert);
    uint64_t v102 = (uint64_t)v211;
    swift_retain_n();
    unint64_t v51 = sub_1C7D78BC0();
    os_log_type_t v103 = sub_1C7D78C90();
    if (os_log_type_enabled(v51, v103))
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      v215[0] = v104;
      *(_DWORD *)uint64_t v53 = 136380931;
      __swift_project_boxed_opaque_existential_1((void *)(v102 + 32), *(void *)(v102 + 56));
      uint64_t v105 = sub_1C7D78AF0();
      uint64_t v214 = sub_1C7D6B1E0(v105, v106, v215);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v53 + 12) = 2082;
      uint64_t v107 = *v101;
      unint64_t v108 = v101[1];
      swift_bridgeObjectRetain();
      uint64_t v214 = sub_1C7D6B1E0(v107, v108, v215);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      sub_1C7D6CA98((uint64_t)v101, type metadata accessor for Alert);
      _os_log_impl(&dword_1C7D5B000, v51, v103, "(%{private}s): Ignoring alert that is waiting to be presented: %{public}s", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      int v60 = (void *)v104;
      goto LABEL_10;
    }
LABEL_67:
    swift_release_n();
    uint64_t v75 = (uint64_t)v101;
    goto LABEL_68;
  }
  if (v69 >> 6 != 1)
  {
    uint64_t v82 = *(void *)(v68 + 24);
    uint64_t v81 = *(void *)(v68 + 32);
    v83 = v211 + 4;
    __swift_project_boxed_opaque_existential_1(v211 + 4, v211[7]);
    swift_bridgeObjectRetain();
    if (v82 == sub_1C7D78AF0() && v81 == v84)
    {
      swift_bridgeObjectRelease_n();
      v85 = v213;
    }
    else
    {
      char v109 = sub_1C7D78EA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v85 = v213;
      if ((v109 & 1) == 0)
      {
        __swift_project_boxed_opaque_existential_1(v83, v211[7]);
        uint64_t v110 = sub_1C7D78AF0();
        uint64_t v112 = v111;
        uint64_t v113 = *(uint64_t *)((char *)v85 + v61);
        uint64_t v114 = *(void *)(v113 + 16);
        if (v114)
        {
          uint64_t v115 = v110;
          v116 = (unsigned __int8 *)(v66 + v113 + 40);
          while (1)
          {
            BOOL v117 = *((void *)v116 - 2) == v115 && *((void *)v116 - 1) == v112;
            if (v117 || (sub_1C7D78EA0()) && *v116 <= 0x3Fu) {
              break;
            }
            v116 += v67;
            if (!--v114) {
              goto LABEL_57;
            }
          }
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_57:
          swift_bridgeObjectRelease();
          sub_1C7D692C8((uint64_t)v85);
        }
      }
    }
    v181 = (double *)((char *)v85 + *(int *)(v212 + 28));
    if (((_BYTE)v181[1] & 1) == 0)
    {
      double v182 = *v181;
      if (*v181 <= 0.0)
      {
        sub_1C7D61C8C(v85);
      }
      else
      {
        uint64_t v183 = *v85;
        uint64_t v184 = v85[1];
        uint64_t v185 = (uint64_t)v205;
        sub_1C7D6CA30((uint64_t)v85, (uint64_t)v205, type metadata accessor for Alert);
        unint64_t v186 = (*(unsigned __int8 *)(v206 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v206 + 80);
        uint64_t v187 = swift_allocObject();
        *(void *)(v187 + 16) = v211;
        sub_1C7D6CAF8(v185, v187 + v186, type metadata accessor for Alert);
        swift_retain();
        sub_1C7D69794(v183, v184, (uint64_t (*)(uint64_t))sub_1C7D6C9AC, v187, v182);
        swift_release();
      }
    }
    return;
  }
  uint64_t v71 = *(void *)(v68 + 8);
  uint64_t v70 = *(void *)(v68 + 16);
  v72 = v211 + 4;
  __swift_project_boxed_opaque_existential_1(v211 + 4, v211[7]);
  swift_bridgeObjectRetain();
  if (v71 == sub_1C7D78AF0() && v70 == v73)
  {
    swift_bridgeObjectRelease_n();
    v74 = v213;
  }
  else
  {
    char v86 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v74 = v213;
    if ((v86 & 1) == 0)
    {
      v101 = v207;
      sub_1C7D6CA30((uint64_t)v213, (uint64_t)v207, type metadata accessor for Alert);
      uint64_t v123 = (uint64_t)v211;
      swift_retain_n();
      unint64_t v51 = sub_1C7D78BC0();
      os_log_type_t v52 = sub_1C7D78C90();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        v215[0] = v54;
        *(_DWORD *)uint64_t v53 = 136380931;
        __swift_project_boxed_opaque_existential_1(v72, *(void *)(v123 + 56));
        uint64_t v124 = sub_1C7D78AF0();
        uint64_t v214 = sub_1C7D6B1E0(v124, v125, v215);
        sub_1C7D78CF0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2082;
        uint64_t v126 = *v101;
        unint64_t v127 = v101[1];
        swift_bridgeObjectRetain();
        uint64_t v214 = sub_1C7D6B1E0(v126, v127, v215);
        sub_1C7D78CF0();
        swift_bridgeObjectRelease();
        sub_1C7D6CA98((uint64_t)v101, type metadata accessor for Alert);
        uint64_t v59 = "(%{private}s): Ignoring failing alert that originated on another device: %{public}s";
        goto LABEL_9;
      }
      goto LABEL_67;
    }
  }
  uint64_t v87 = *(uint64_t *)((char *)v74 + v61);
  uint64_t v88 = *(void *)(v87 + 16);
  if (!v88) {
    goto LABEL_92;
  }
  uint64_t v89 = v87 + v66 + (v88 - 1) * v67;
  if (*(unsigned char *)v89 == 1)
  {
    v90 = v209;
    sub_1C7D6CA30((uint64_t)v74, (uint64_t)v209, type metadata accessor for Alert);
    uint64_t v91 = (uint64_t)v211;
    swift_retain_n();
    v92 = sub_1C7D78BC0();
    os_log_type_t v93 = sub_1C7D78C80();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      v215[0] = v95;
      *(_DWORD *)uint64_t v94 = 136315394;
      __swift_project_boxed_opaque_existential_1(v72, *(void *)(v91 + 56));
      uint64_t v96 = sub_1C7D78AF0();
      uint64_t v214 = sub_1C7D6B1E0(v96, v97, v215);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v94 + 12) = 2082;
      uint64_t v98 = *v90;
      unint64_t v99 = v90[1];
      swift_bridgeObjectRetain();
      uint64_t v214 = sub_1C7D6B1E0(v98, v99, v215);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      sub_1C7D6CA98((uint64_t)v90, type metadata accessor for Alert);
      _os_log_impl(&dword_1C7D5B000, v92, v93, "(%s): Mandatory alert failed to be displayed: %{public}s", (uint8_t *)v94, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v95, -1, -1);
      uint64_t v100 = v94;
      v74 = v213;
      MEMORY[0x1C87C2080](v100, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_1C7D6CA98((uint64_t)v90, type metadata accessor for Alert);
    }

    sub_1C7D61C8C(v74);
    return;
  }
  uint64_t v119 = *(void *)(v89 + 24);
  uint64_t v118 = *(void *)(v89 + 32);
  __swift_project_boxed_opaque_existential_1(v72, v211[7]);
  swift_bridgeObjectRetain();
  if (v119 != sub_1C7D78AF0() || v118 != v120)
  {
    char v128 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v121 = v213;
    if (v128) {
      goto LABEL_53;
    }
    uint64_t v166 = *(uint64_t *)((char *)v213 + v61);
    uint64_t v167 = *(void *)(v166 + 16);
    if (v167)
    {
      uint64_t v168 = v166 + v66 + (v167 - 1) * v67;
      uint64_t v170 = *(void *)(v168 + 24);
      uint64_t v169 = *(void *)(v168 + 32);
      uint64_t v129 = (uint64_t)v211;
      __swift_project_boxed_opaque_existential_1(v72, v211[7]);
      swift_bridgeObjectRetain();
      uint64_t v171 = (uint64_t)v200;
      sub_1C7D78AE0();
      uint64_t v172 = sub_1C7D78B20();
      uint64_t v173 = *(void *)(v172 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v173 + 48))(v171, 1, v172) == 1)
      {
        sub_1C7D6C94C(v171, &qword_1EA502A60);
        swift_bridgeObjectRelease();
        v121 = v213;
        v101 = v201;
        goto LABEL_65;
      }
      uint64_t v188 = sub_1C7D78B10();
      uint64_t v190 = v189;
      (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v171, v172);
      v101 = v201;
      if (v170 == v188 && v169 == v190)
      {
        swift_bridgeObjectRelease_n();
        v121 = v213;
      }
      else
      {
        char v191 = sub_1C7D78EA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v121 = v213;
        if ((v191 & 1) == 0)
        {
LABEL_65:
          sub_1C7D6CA30((uint64_t)v121, (uint64_t)v101, type metadata accessor for Alert);
          swift_retain_n();
          unint64_t v51 = sub_1C7D78BC0();
          os_log_type_t v52 = sub_1C7D78C80();
          if (os_log_type_enabled(v51, v52))
          {
            uint64_t v53 = swift_slowAlloc();
            uint64_t v54 = swift_slowAlloc();
            v215[0] = v54;
            *(_DWORD *)uint64_t v53 = 136380931;
            __swift_project_boxed_opaque_existential_1(v72, *(void *)(v129 + 56));
            uint64_t v174 = sub_1C7D78AF0();
            uint64_t v214 = sub_1C7D6B1E0(v174, v175, v215);
            sub_1C7D78CF0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v53 + 12) = 2082;
            uint64_t v176 = *v101;
            unint64_t v177 = v101[1];
            swift_bridgeObjectRetain();
            uint64_t v214 = sub_1C7D6B1E0(v176, v177, v215);
            sub_1C7D78CF0();
            swift_bridgeObjectRelease();
            sub_1C7D6CA98((uint64_t)v101, type metadata accessor for Alert);
            uint64_t v59 = "(%{private}s): Ignoring alert from unexpected device: %{public}s";
            goto LABEL_9;
          }
          goto LABEL_67;
        }
      }
      v192 = v199;
      sub_1C7D6CA30((uint64_t)v121, (uint64_t)v199, type metadata accessor for Alert);
      swift_retain_n();
      v134 = sub_1C7D78BC0();
      os_log_type_t v135 = sub_1C7D78C90();
      if (os_log_type_enabled(v134, v135))
      {
        uint64_t v136 = swift_slowAlloc();
        uint64_t v212 = swift_slowAlloc();
        v215[0] = v212;
        *(_DWORD *)uint64_t v136 = 136380931;
        uint64_t v193 = (uint64_t)v192;
        __swift_project_boxed_opaque_existential_1(v72, *(void *)(v129 + 56));
        uint64_t v194 = sub_1C7D78AF0();
        uint64_t v214 = sub_1C7D6B1E0(v194, v195, v215);
        sub_1C7D78CF0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v136 + 12) = 2082;
        uint64_t v196 = *v192;
        unint64_t v197 = v192[1];
        swift_bridgeObjectRetain();
        uint64_t v214 = sub_1C7D6B1E0(v196, v197, v215);
        sub_1C7D78CF0();
        swift_bridgeObjectRelease();
        sub_1C7D6CA98(v193, type metadata accessor for Alert);
        v141 = "(%{private}s): Remote device failed to show optional alert; retrying as mandatory alert: %{public}s";
        goto LABEL_56;
      }
      swift_release_n();
      uint64_t v178 = (uint64_t)v192;
LABEL_72:
      sub_1C7D6CA98(v178, type metadata accessor for Alert);
      goto LABEL_73;
    }
LABEL_93:
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease_n();
  v121 = v213;
LABEL_53:
  uint64_t v129 = (uint64_t)v211;
  __swift_project_boxed_opaque_existential_1(v72, v211[7]);
  uint64_t v130 = (uint64_t)v208;
  sub_1C7D78AE0();
  uint64_t v131 = sub_1C7D78B20();
  uint64_t v132 = *(void *)(v131 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v132 + 48))(v130, 1, v131) == 1)
  {
    sub_1C7D6C94C(v130, &qword_1EA502A60);
    v133 = v203;
    sub_1C7D6CA30((uint64_t)v121, (uint64_t)v203, type metadata accessor for Alert);
    swift_retain_n();
    v134 = sub_1C7D78BC0();
    os_log_type_t v135 = sub_1C7D78C90();
    if (os_log_type_enabled(v134, v135))
    {
      uint64_t v136 = swift_slowAlloc();
      uint64_t v212 = swift_slowAlloc();
      v215[0] = v212;
      *(_DWORD *)uint64_t v136 = 136380931;
      __swift_project_boxed_opaque_existential_1(v72, *(void *)(v129 + 56));
      uint64_t v137 = sub_1C7D78AF0();
      uint64_t v214 = sub_1C7D6B1E0(v137, v138, v215);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v136 + 12) = 2082;
      uint64_t v139 = *v133;
      unint64_t v140 = v133[1];
      swift_bridgeObjectRetain();
      uint64_t v214 = sub_1C7D6B1E0(v139, v140, v215);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      sub_1C7D6CA98((uint64_t)v133, type metadata accessor for Alert);
      v141 = "(%{private}s): Optional alert failed; retrying as mandatory alert: %{public}s";
LABEL_56:
      _os_log_impl(&dword_1C7D5B000, v134, v135, v141, (uint8_t *)v136, 0x16u);
      uint64_t v142 = v212;
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v142, -1, -1);
      uint64_t v143 = v136;
      v121 = v213;
      MEMORY[0x1C87C2080](v143, -1, -1);
LABEL_73:

      __swift_project_boxed_opaque_existential_1(v72, *(void *)(v129 + 56));
      uint64_t v179 = sub_1C7D78AF0();
      LOBYTE(v215[0]) = 1;
      sub_1C7D662A4(v121, v179, v180, (unsigned __int8 *)v215);
      swift_bridgeObjectRelease();
      return;
    }
    swift_release_n();
    uint64_t v178 = (uint64_t)v133;
    goto LABEL_72;
  }
  uint64_t v144 = sub_1C7D78B10();
  uint64_t v146 = v145;
  (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v130, v131);
  uint64_t v147 = (uint64_t)v121;
  v148 = v204;
  sub_1C7D6CA30(v147, (uint64_t)v204, type metadata accessor for Alert);
  swift_retain_n();
  v149 = sub_1C7D78BC0();
  os_log_type_t v150 = sub_1C7D78C90();
  if (os_log_type_enabled(v149, v150))
  {
    v151 = v72;
    uint64_t v152 = swift_slowAlloc();
    uint64_t v153 = swift_slowAlloc();
    v215[0] = v153;
    *(_DWORD *)uint64_t v152 = 136380931;
    uint64_t v154 = *(void *)(v129 + 56);
    uint64_t v212 = v144;
    __swift_project_boxed_opaque_existential_1(v151, v154);
    uint64_t v155 = sub_1C7D78AF0();
    uint64_t v214 = sub_1C7D6B1E0(v155, v156, v215);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v152 + 12) = 2082;
    uint64_t v157 = *v148;
    unint64_t v158 = v148[1];
    swift_bridgeObjectRetain();
    uint64_t v214 = sub_1C7D6B1E0(v157, v158, v215);
    sub_1C7D78CF0();
    uint64_t v144 = v212;
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v148, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v149, v150, "(%{private}s): Sending failed optional alert to remote device: %{public}s", (uint8_t *)v152, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v153, -1, -1);
    MEMORY[0x1C87C2080](v152, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v148, type metadata accessor for Alert);
  }

  LOBYTE(v215[0]) = 0;
  sub_1C7D662A4(v213, v144, v146, (unsigned __int8 *)v215);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall AlertCenter.dismissAlert(identifier:)(Swift::String identifier)
{
  uint64_t v2 = v1;
  object = identifier._object;
  uint64_t countAndFlagsBits = identifier._countAndFlagsBits;
  uint64_t v5 = *(NSObject **)(v2 + 16);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = countAndFlagsBits;
  v6[4] = object;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1C7D6C204;
  *(void *)(v7 + 24) = v6;
  v9[4] = sub_1C7D6DA1C;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1C7D5EF80;
  void v9[3] = &block_descriptor_25;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v5) {
    __break(1u);
  }
}

uint64_t sub_1C7D61854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Alert(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (uint64_t *)((char *)&v28 - v14);
  swift_beginAccess();
  sub_1C7D6D970(a1 + 96, (uint64_t)v30);
  uint64_t v16 = v31;
  uint64_t v17 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(a2, a3, v16, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1C7D6C94C((uint64_t)v8, &qword_1EBC68DB0);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  else
  {
    sub_1C7D6CAF8((uint64_t)v8, (uint64_t)v15, type metadata accessor for Alert);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    if (qword_1EBC68F80 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1C7D78BD0();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EBC68F68);
    sub_1C7D6CA30((uint64_t)v15, (uint64_t)v13, type metadata accessor for Alert);
    swift_retain_n();
    uint64_t v20 = sub_1C7D78BC0();
    os_log_type_t v21 = sub_1C7D78C90();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v30[0] = v28;
      *(_DWORD *)uint64_t v22 = 136380931;
      __swift_project_boxed_opaque_existential_1((void *)(a1 + 32), *(void *)(a1 + 56));
      uint64_t v23 = sub_1C7D78AF0();
      uint64_t v29 = sub_1C7D6B1E0(v23, v24, v30);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      uint64_t v25 = Alert.description.getter();
      uint64_t v29 = sub_1C7D6B1E0(v25, v26, v30);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      sub_1C7D6CA98((uint64_t)v13, type metadata accessor for Alert);
      _os_log_impl(&dword_1C7D5B000, v20, v21, "(%{private}s): Dismissing alert: %{public}s", (uint8_t *)v22, 0x16u);
      uint64_t v27 = v28;
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v27, -1, -1);
      MEMORY[0x1C87C2080](v22, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_1C7D6CA98((uint64_t)v13, type metadata accessor for Alert);
    }

    sub_1C7D61C8C(v15);
    return sub_1C7D6CA98((uint64_t)v15, type metadata accessor for Alert);
  }
}

uint64_t sub_1C7D61C8C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v43 = *(void *)(type metadata accessor for Alert(0) - 8);
  uint64_t v4 = *(void *)(v43 + 64);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v41 - v6;
  uint64_t v8 = sub_1C7D78C20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (void *)((char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = (void *)v2[2];
  *uint64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  id v13 = v12;
  char v14 = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v14)
  {
    v41[2] = v4;
    uint64_t v42 = (uint64_t)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (qword_1EBC68F80 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v15 = sub_1C7D78BD0();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EBC68F68);
  sub_1C7D6CA30((uint64_t)a1, (uint64_t)v7, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v16 = sub_1C7D78BC0();
  os_log_type_t v17 = sub_1C7D78C90();
  BOOL v18 = os_log_type_enabled(v16, v17);
  v41[1] = v13;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v44 = a1;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    v46[0] = v21;
    *(_DWORD *)uint64_t v20 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    uint64_t v22 = sub_1C7D78AF0();
    uint64_t v45 = sub_1C7D6B1E0(v22, v23, v46);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    uint64_t v24 = Alert.description.getter();
    uint64_t v45 = sub_1C7D6B1E0(v24, v25, v46);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v7, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v16, v17, "(%{private}s): Deleting alert: %{public}s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v21, -1, -1);
    uint64_t v26 = v20;
    a1 = v44;
    MEMORY[0x1C87C2080](v26, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v7, type metadata accessor for Alert);
  }

  uint64_t v27 = *a1;
  unint64_t v28 = a1[1];
  swift_beginAccess();
  uint64_t v29 = v2[15];
  uint64_t v30 = v2[16];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v2 + 12), v29);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v30 + 32))(v27, v28, v29, v30);
  swift_endAccess();
  uint64_t v31 = v2[7];
  uint64_t v44 = (uint64_t *)v2[8];
  __swift_project_boxed_opaque_existential_1(v2 + 4, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AA0);
  sub_1C7D78BA0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C7D79990;
  uint64_t v32 = qword_1EBC68D60;
  swift_bridgeObjectRetain();
  if (v32 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C7D78B80();
  sub_1C7D78AD0();
  swift_bridgeObjectRelease();
  uint64_t v33 = v2[10];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v33 + 40))(a1, ObjectType, v33);
  sub_1C7D68EE4(v27, v28);
  uint64_t result = MEMORY[0x1C87C20F0](v2 + 18);
  if (result)
  {
    uint64_t v36 = result;
    uint64_t v37 = v2[19];
    sub_1C7D78AC0();
    uint64_t v38 = v42;
    sub_1C7D6CA30((uint64_t)a1, v42, type metadata accessor for Alert);
    unint64_t v39 = (*(unsigned __int8 *)(v43 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v40 = (void *)swift_allocObject();
    v40[2] = v36;
    v40[3] = v37;
    v40[4] = v2;
    sub_1C7D6CAF8(v38, (uint64_t)v40 + v39, type metadata accessor for Alert);
    swift_retain();
    swift_unknownObjectRetain();
    sub_1C7D78AB0();
    sub_1C7D78AA0();
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*sub_1C7D62318(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1C7D5EFC0(v2);
  return sub_1C7D62370;
}

void sub_1C7D62370(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1C7D623B8()
{
  return sub_1C7D78CC0();
}

BOOL sub_1C7D6242C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = v2;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  sub_1C7D78CC0();
  uint64_t v8 = type metadata accessor for Alert(0);
  BOOL v9 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) != 1;
  sub_1C7D6C94C((uint64_t)v7, &qword_1EBC68DB0);
  return v9;
}

uint64_t AlertCenter.syncEngine(_:dataFor:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A70);
  sub_1C7D78CC0();
  return v1;
}

void sub_1C7D625BC(uint64_t a1@<X0>, uint8_t *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v56 = a3;
  uint64_t v5 = sub_1C7D78BA0();
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  unint64_t v51 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  os_log_type_t v52 = (char *)&v50 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Alert(0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (uint8_t *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C7D6D970(a1 + 96, (uint64_t)v58);
  uint64_t v16 = v58[4];
  __swift_project_boxed_opaque_existential_1(v58, v58[3]);
  uint64_t v53 = a2;
  uint64_t v17 = sub_1C7D78B90();
  (*(void (**)(uint64_t))(v16 + 16))(v17);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_1C7D6C94C((uint64_t)v11, &qword_1EBC68DB0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    if (qword_1EBC68F80 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C7D78BD0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EBC68F68);
    uint64_t v19 = v54;
    uint64_t v20 = v52;
    uint64_t v21 = v55;
    (*(void (**)(char *, uint8_t *, uint64_t))(v54 + 16))(v52, v53, v55);
    uint64_t v22 = sub_1C7D78BC0();
    os_log_type_t v23 = sub_1C7D78C90();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v58[0] = v25;
      *(_DWORD *)uint64_t v24 = 136446210;
      uint64_t v53 = v24 + 4;
      sub_1C7D6D9D4(&qword_1EA502A80, 255, MEMORY[0x1E4F9A9C8]);
      uint64_t v26 = sub_1C7D78E90();
      uint64_t v59 = sub_1C7D6B1E0(v26, v27, v58);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
      _os_log_impl(&dword_1C7D5B000, v22, v23, "Could not find an alert for recordID %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v25, -1, -1);
      MEMORY[0x1C87C2080](v24, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
    }

    uint64_t v47 = 0;
    unint64_t v48 = 0xF000000000000000;
    uint64_t v49 = v56;
  }
  else
  {
    sub_1C7D6CAF8((uint64_t)v11, (uint64_t)v15, type metadata accessor for Alert);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    sub_1C7D78950();
    swift_allocObject();
    uint64_t v28 = sub_1C7D78940();
    sub_1C7D6D9D4(&qword_1EA502AD0, 255, (void (*)(uint64_t))type metadata accessor for Alert);
    uint64_t v29 = v57;
    uint64_t v30 = sub_1C7D78930();
    uint64_t v32 = v15;
    if (v29)
    {
      if (qword_1EBC68F80 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_1C7D78BD0();
      __swift_project_value_buffer(v33, (uint64_t)qword_1EBC68F68);
      uint64_t v34 = v54;
      uint64_t v35 = v51;
      uint64_t v36 = v55;
      (*(void (**)(char *, uint8_t *, uint64_t))(v54 + 16))(v51, v53, v55);
      MEMORY[0x1C87C1F40](v29);
      MEMORY[0x1C87C1F40](v29);
      uint64_t v37 = sub_1C7D78BC0();
      os_log_type_t v38 = sub_1C7D78C90();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v57 = v28;
        uint64_t v40 = v39;
        os_log_type_t v52 = (char *)swift_slowAlloc();
        v58[0] = (uint64_t)v52;
        *(_DWORD *)uint64_t v40 = 136446466;
        uint64_t v53 = v32;
        sub_1C7D6D9D4(&qword_1EA502A80, 255, MEMORY[0x1E4F9A9C8]);
        uint64_t v41 = sub_1C7D78E90();
        uint64_t v59 = sub_1C7D6B1E0(v41, v42, v58);
        sub_1C7D78CF0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
        *(_WORD *)(v40 + 12) = 2082;
        uint64_t v59 = v29;
        MEMORY[0x1C87C1F40](v29);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AD8);
        uint64_t v43 = sub_1C7D78C40();
        uint64_t v59 = sub_1C7D6B1E0(v43, v44, v58);
        sub_1C7D78CF0();
        swift_bridgeObjectRelease();
        MEMORY[0x1C87C1F30](v29);
        MEMORY[0x1C87C1F30](v29);
        _os_log_impl(&dword_1C7D5B000, v37, v38, "Could not encode alert for recordID %{public}s: %{public}s", (uint8_t *)v40, 0x16u);
        uint64_t v45 = v52;
        swift_arrayDestroy();
        MEMORY[0x1C87C2080](v45, -1, -1);
        MEMORY[0x1C87C2080](v40, -1, -1);

        swift_release();
        MEMORY[0x1C87C1F30](v29);
        uint64_t v46 = (uint64_t)v53;
      }
      else
      {

        swift_release();
        MEMORY[0x1C87C1F30](v29);
        MEMORY[0x1C87C1F30](v29);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
        MEMORY[0x1C87C1F30](v29);
        uint64_t v46 = (uint64_t)v32;
      }
      sub_1C7D6CA98(v46, type metadata accessor for Alert);
      uint64_t v47 = 0;
      unint64_t v48 = 0xF000000000000000;
    }
    else
    {
      uint64_t v47 = v30;
      unint64_t v48 = v31;
      sub_1C7D6CA98((uint64_t)v15, type metadata accessor for Alert);
      swift_release();
    }
    uint64_t v49 = v56;
  }
  uint64_t *v49 = v47;
  v49[1] = v48;
}

uint64_t AlertCenter.syncEngine(_:resolveConflictBetween:and:)()
{
  sub_1C7D78CC0();
  return v1;
}

uint64_t sub_1C7D62E1C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v97 = a1;
  uint64_t v95 = a2;
  uint64_t v2 = sub_1C7D78B70();
  uint64_t v86 = *(void *)(v2 - 8);
  uint64_t v87 = v2;
  MEMORY[0x1F4188790](v2);
  v85 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C7D78B40();
  uint64_t v81 = *(void *)(v4 - 8);
  uint64_t v82 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v79 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C7D78BA0();
  uint64_t v83 = *(void *)(v6 - 8);
  uint64_t v84 = v6;
  MEMORY[0x1F4188790](v6);
  v80 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v91 = *(void *)(v8 - 8);
  uint64_t v92 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v88 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v90 = (char *)&v76 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  os_log_type_t v93 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v76 - v15;
  uint64_t v17 = type metadata accessor for Alert(0);
  uint64_t v99 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v89 = (uint64_t)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v76 - v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v94 = (uint64_t)&v76 - v23;
  sub_1C7D78920();
  swift_allocObject();
  uint64_t v24 = sub_1C7D78910();
  uint64_t v25 = sub_1C7D78B50();
  unint64_t v27 = v26;
  sub_1C7D6D9D4(&qword_1EA502A78, 255, (void (*)(uint64_t))type metadata accessor for Alert);
  uint64_t v28 = v17;
  uint64_t v98 = v24;
  uint64_t v29 = (uint64_t)v96;
  sub_1C7D78900();
  if (v29)
  {
    MEMORY[0x1C87C1F30](v29);
    sub_1C7D6C144(v25, v27);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v99 + 56))(v16, 1, 1, v17);
    sub_1C7D6C94C((uint64_t)v16, &qword_1EBC68DB0);
    uint64_t v30 = sub_1C7D78B50();
    uint64_t v32 = v31;
    uint64_t result = swift_release();
LABEL_10:
    uint64_t v61 = v95;
    *uint64_t v95 = v30;
    v61[1] = v32;
    return result;
  }
  uint64_t v96 = v22;
  sub_1C7D6C144(v25, v27);
  uint64_t v34 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v99 + 56);
  v99 += 56;
  uint64_t v78 = v34;
  v34((uint64_t)v16, 0, 1, v17);
  sub_1C7D6CAF8((uint64_t)v16, v94, type metadata accessor for Alert);
  uint64_t v35 = sub_1C7D78B50();
  unint64_t v37 = v36;
  uint64_t v38 = (uint64_t)v93;
  sub_1C7D78900();
  uint64_t v77 = 0;
  sub_1C7D6C144(v35, v37);
  v78(v38, 0, 1, v17);
  sub_1C7D6CAF8(v38, (uint64_t)v96, type metadata accessor for Alert);
  uint64_t v39 = *(void *)(v94 + *(int *)(v17 + 36));
  uint64_t v40 = *(void *)(v39 + 16);
  if (!v40)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v41 = v40 - 1;
  uint64_t v42 = type metadata accessor for Alert.HistoryItem(0);
  uint64_t v35 = (*(unsigned __int8 *)(*(void *)(v42 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v42 - 8) + 80);
  uint64_t v43 = *(void *)(*(void *)(v42 - 8) + 72);
  uint64_t v44 = v39 + v35 + v43 * v41 + *(int *)(v42 + 32);
  uint64_t v45 = v90;
  uint64_t v46 = v91;
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 16);
  uint64_t v48 = v92;
  v47(v90, v44, v92);
  uint64_t v49 = *(void *)&v96[*(int *)(v28 + 36)];
  uint64_t v50 = *(void *)(v49 + 16);
  if (!v50)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v51 = v49 + v35 + (v50 - 1) * v43 + *(int *)(v42 + 32);
  os_log_type_t v52 = v88;
  v47(v88, v51, v48);
  char v53 = sub_1C7D789A0();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v48);
  v54(v45, v48);
  uint64_t v55 = v94;
  if (v53) {
    uint64_t v56 = v94;
  }
  else {
    uint64_t v56 = (uint64_t)v96;
  }
  uint64_t v57 = v89;
  sub_1C7D6CA30(v56, v89, type metadata accessor for Alert);
  sub_1C7D78950();
  swift_allocObject();
  sub_1C7D78940();
  sub_1C7D6D9D4(&qword_1EA502AD0, 255, (void (*)(uint64_t))type metadata accessor for Alert);
  uint64_t v58 = v77;
  uint64_t v59 = sub_1C7D78930();
  uint64_t v35 = v58;
  if (!v58)
  {
    uint64_t v30 = v59;
    uint64_t v32 = v60;
    swift_release();
    swift_release();
    sub_1C7D6CA98(v57, type metadata accessor for Alert);
    sub_1C7D6CA98((uint64_t)v96, type metadata accessor for Alert);
    uint64_t result = sub_1C7D6CA98(v55, type metadata accessor for Alert);
    goto LABEL_10;
  }
LABEL_13:
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v62 = sub_1C7D78BD0();
  __swift_project_value_buffer(v62, (uint64_t)qword_1EBC68F68);
  (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v85, v97, v87);
  MEMORY[0x1C87C1F40](v35);
  uint64_t v63 = sub_1C7D78BC0();
  os_log_type_t v64 = sub_1C7D78C90();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    uint64_t v101 = v99;
    *(_DWORD *)uint64_t v65 = 136446466;
    uint64_t v98 = v65 + 4;
    unint64_t v66 = v79;
    uint64_t v67 = v85;
    sub_1C7D78B60();
    unint64_t v68 = v80;
    sub_1C7D78B30();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v66, v82);
    sub_1C7D6D9D4(&qword_1EA502A80, 255, MEMORY[0x1E4F9A9C8]);
    uint64_t v69 = v84;
    uint64_t v70 = sub_1C7D78E90();
    unint64_t v72 = v71;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v68, v69);
    uint64_t v100 = sub_1C7D6B1E0(v70, v72, &v101);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v67, v87);
    *(_WORD *)(v65 + 12) = 2082;
    uint64_t v100 = v35;
    MEMORY[0x1C87C1F40](v35);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AD8);
    uint64_t v73 = sub_1C7D78C40();
    uint64_t v100 = sub_1C7D6B1E0(v73, v74, &v101);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    MEMORY[0x1C87C1F30](v35);
    MEMORY[0x1C87C1F30](v35);
    _os_log_impl(&dword_1C7D5B000, v63, v64, "Could not encode alert for recordID %{public}s: %{public}s", (uint8_t *)v65, 0x16u);
    uint64_t v75 = v99;
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v75, -1, -1);
    MEMORY[0x1C87C2080](v65, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v87);
    MEMORY[0x1C87C1F30](v35);
    MEMORY[0x1C87C1F30](v35);
  }

  uint64_t result = sub_1C7D78D90();
  __break(1u);
  return result;
}

BOOL AlertCenter.syncEngine(_:didFetch:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C7D78B40();
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v47 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C7D78BA0();
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v48 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = (char *)sub_1C7D78B70();
  uint64_t v57 = *((void *)v59 - 1);
  MEMORY[0x1F4188790](v59);
  uint64_t v58 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Alert(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v53 = (uint64_t)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v54 = (uint8_t *)&v46 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v46 - v17;
  sub_1C7D78920();
  swift_allocObject();
  uint64_t v19 = sub_1C7D78910();
  uint64_t v55 = a2;
  uint64_t v20 = sub_1C7D78B50();
  unint64_t v22 = v21;
  sub_1C7D6D9D4(&qword_1EA502A78, 255, (void (*)(uint64_t))type metadata accessor for Alert);
  uint64_t v60 = v19;
  sub_1C7D78900();
  sub_1C7D6C144(v20, v22);
  uint64_t v23 = (uint64_t)v18;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v18, 0, 1, v8);
  sub_1C7D6C258((uint64_t)v18, (uint64_t)v16);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v16, 1, v8);
  if (v24 == 1)
  {
    LODWORD(v56) = 1;
    sub_1C7D6C94C((uint64_t)v16, &qword_1EBC68DB0);
    if (qword_1EBC68F80 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1C7D78BD0();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EBC68F68);
    uint64_t v31 = v57;
    uint64_t v32 = v58;
    uint64_t v33 = (uint64_t)v59;
    (*(void (**)(char *, uint64_t, char *))(v57 + 16))(v58, v55, v59);
    uint64_t v34 = sub_1C7D78BC0();
    os_log_type_t v35 = sub_1C7D78C90();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = v31;
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v62 = v55;
      *(_DWORD *)unint64_t v37 = 136446210;
      uint64_t v54 = v37 + 4;
      uint64_t v38 = v47;
      sub_1C7D78B60();
      uint64_t v39 = v48;
      sub_1C7D78B30();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v38, v50);
      sub_1C7D6D9D4(&qword_1EA502A80, 255, MEMORY[0x1E4F9A9C8]);
      uint64_t v40 = v52;
      uint64_t v41 = sub_1C7D78E90();
      unint64_t v43 = v42;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v40);
      uint64_t v61 = sub_1C7D6B1E0(v41, v43, &v62);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v36 + 8))(v58, v59);
      _os_log_impl(&dword_1C7D5B000, v34, v35, "Could not create an alert for recordID %{public}s", v37, 0xCu);
      uint64_t v44 = v55;
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v44, -1, -1);
      MEMORY[0x1C87C2080](v37, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
    }
    sub_1C7D6C94C(v23, &qword_1EBC68DB0);
    int v24 = v56;
  }
  else
  {
    uint64_t v59 = v18;
    uint64_t v25 = (uint64_t)v54;
    sub_1C7D6CAF8((uint64_t)v16, (uint64_t)v54, type metadata accessor for Alert);
    uint64_t v58 = (char *)sub_1C7D78AC0();
    uint64_t v26 = v56;
    uint64_t v27 = v53;
    sub_1C7D6CA30(v25, v53, type metadata accessor for Alert);
    unint64_t v28 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v26;
    sub_1C7D6CAF8(v27, v29 + v28, type metadata accessor for Alert);
    swift_retain();
    sub_1C7D78AB0();
    sub_1C7D78AA0();
    swift_release();
    swift_release();
    sub_1C7D6CA98(v25, type metadata accessor for Alert);
    sub_1C7D6C94C((uint64_t)v59, &qword_1EBC68DB0);
  }
  return v24 != 1;
}

uint64_t sub_1C7D640D4(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AA8);
  MEMORY[0x1F4188790](v64);
  uint64_t v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v60 = (uint64_t *)((char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v56 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v65 = (uint64_t)&v56 - v12;
  uint64_t v13 = type metadata accessor for Alert(0);
  uint64_t v62 = *(void *)(v13 - 8);
  uint64_t v63 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v58 = (uint64_t *)((char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v56 - v16;
  uint64_t v18 = sub_1C7D78C20();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  unint64_t v21 = (uint64_t *)((char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v22 = (void *)v2[2];
  void *v21 = v22;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E4FBCBF0], v18);
  id v23 = v22;
  LOBYTE(v22) = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v19 + 8))(v21, v18);
  if (v22)
  {
    uint64_t v61 = v11;
    if (qword_1EBC68F80 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v24 = sub_1C7D78BD0();
  uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)qword_1EBC68F68);
  sub_1C7D6CA30((uint64_t)a1, (uint64_t)v17, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v59 = v25;
  uint64_t v26 = sub_1C7D78BC0();
  os_log_type_t v27 = sub_1C7D78C90();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v57 = v5;
    uint64_t v29 = v28;
    uint64_t v56 = swift_slowAlloc();
    v68[0] = v56;
    *(_DWORD *)uint64_t v29 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    uint64_t v30 = sub_1C7D78AF0();
    uint64_t v67 = sub_1C7D6B1E0(v30, v31, v68);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2082;
    uint64_t v32 = Alert.description.getter();
    uint64_t v67 = sub_1C7D6B1E0(v32, v33, v68);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v17, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v26, v27, "(%{private}s): Received alert update from sync engine: %{public}s", (uint8_t *)v29, 0x16u);
    uint64_t v34 = v56;
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v34, -1, -1);
    uint64_t v35 = v29;
    uint64_t v5 = v57;
    MEMORY[0x1C87C2080](v35, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v17, type metadata accessor for Alert);
  }

  uint64_t v36 = v63;
  swift_beginAccess();
  sub_1C7D6D970((uint64_t)(v2 + 12), (uint64_t)v68);
  uint64_t v37 = v69;
  uint64_t v38 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  uint64_t v39 = v65;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 16))(*a1, a1[1], v37, v38);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
  uint64_t v40 = (uint64_t)v61;
  sub_1C7D6CA30((uint64_t)a1, (uint64_t)v61, type metadata accessor for Alert);
  uint64_t v41 = v62;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v62 + 56))(v40, 0, 1, v36);
  uint64_t v42 = (uint64_t)&v5[*(int *)(v64 + 48)];
  sub_1C7D6C258(v39, (uint64_t)v5);
  sub_1C7D6C258(v40, v42);
  unint64_t v43 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48);
  if (v43((uint64_t)v5, 1, v36) != 1)
  {
    uint64_t v44 = v60;
    sub_1C7D6C258((uint64_t)v5, (uint64_t)v60);
    if (v43(v42, 1, v36) != 1)
    {
      uint64_t v45 = v58;
      sub_1C7D6CAF8(v42, (uint64_t)v58, type metadata accessor for Alert);
      char v46 = _s12SessionAlert0B0V2eeoiySbAC_ACtFZ_0(v44, v45);
      sub_1C7D6CA98((uint64_t)v45, type metadata accessor for Alert);
      sub_1C7D6C94C(v40, &qword_1EBC68DB0);
      sub_1C7D6CA98((uint64_t)v44, type metadata accessor for Alert);
      sub_1C7D6C94C((uint64_t)v5, &qword_1EBC68DB0);
      if (v46) {
        goto LABEL_13;
      }
LABEL_15:
      swift_beginAccess();
      uint64_t v53 = v2[15];
      uint64_t v54 = v2[16];
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v2 + 12), v53);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v54 + 24))(a1, v53, v54);
      swift_endAccess();
      sub_1C7D5FA94(a1);
      return sub_1C7D6C94C(v65, &qword_1EBC68DB0);
    }
    sub_1C7D6C94C(v40, &qword_1EBC68DB0);
    sub_1C7D6CA98((uint64_t)v44, type metadata accessor for Alert);
LABEL_11:
    sub_1C7D6C94C((uint64_t)v5, &qword_1EA502AA8);
    goto LABEL_15;
  }
  sub_1C7D6C94C(v40, &qword_1EBC68DB0);
  if (v43(v42, 1, v36) != 1) {
    goto LABEL_11;
  }
  sub_1C7D6C94C((uint64_t)v5, &qword_1EBC68DB0);
LABEL_13:
  swift_retain_n();
  uint64_t v47 = sub_1C7D78BC0();
  os_log_type_t v48 = sub_1C7D78C90();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)uint64_t v49 = 136380675;
    v68[0] = v50;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    uint64_t v51 = sub_1C7D78AF0();
    uint64_t v66 = sub_1C7D6B1E0(v51, v52, v68);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7D5B000, v47, v48, "(%{private}s): Ignoring unchanged alert", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v50, -1, -1);
    MEMORY[0x1C87C2080](v49, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  return sub_1C7D6C94C(v65, &qword_1EBC68DB0);
}

uint64_t AlertCenter.syncEngine(_:didDelete:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C7D78BA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  sub_1C7D78AC0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_1C7D78AB0();
  sub_1C7D78AA0();
  return swift_release();
}

uint64_t sub_1C7D64AFC(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v6 = sub_1C7D78BA0();
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v33 = v6;
  MEMORY[0x1F4188790](v6);
  unint64_t v31 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Alert(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C7D6D970(a3 + 96, (uint64_t)v37);
  uint64_t v15 = v37[4];
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  uint64_t v30 = a4;
  uint64_t v16 = sub_1C7D78B90();
  (*(void (**)(uint64_t))(v15 + 16))(v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1C7D6C94C((uint64_t)v10, &qword_1EBC68DB0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    if (qword_1EBC68F80 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C7D78BD0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBC68F68);
    uint64_t v18 = v31;
    uint64_t v19 = v32;
    uint64_t v20 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v31, v30, v33);
    unint64_t v21 = sub_1C7D78BC0();
    os_log_type_t v22 = sub_1C7D78C90();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v37[0] = v24;
      *(_DWORD *)id v23 = 136446210;
      sub_1C7D6D9D4(&qword_1EA502A80, 255, MEMORY[0x1E4F9A9C8]);
      uint64_t v25 = sub_1C7D78E90();
      uint64_t v36 = sub_1C7D6B1E0(v25, v26, v37);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v20);
      _os_log_impl(&dword_1C7D5B000, v21, v22, "Could not find an existing alert for deleted recordID %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v24, -1, -1);
      MEMORY[0x1C87C2080](v23, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v20);
    }

    return v34();
  }
  else
  {
    sub_1C7D6CAF8((uint64_t)v10, (uint64_t)v14, type metadata accessor for Alert);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    uint64_t v27 = sub_1C7D64F6C((uint64_t)v14);
    ((void (*)(uint64_t))v34)(v27);
    return sub_1C7D6CA98((uint64_t)v14, type metadata accessor for Alert);
  }
}

uint64_t sub_1C7D64F6C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Alert(0);
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v6;
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = sub_1C7D78C20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (uint64_t *)((char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (void *)v2[2];
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCBF0], v10);
  id v15 = v14;
  char v16 = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v16)
  {
    if (qword_1EBC68F80 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v17 = sub_1C7D78BD0();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC68F68);
  char v46 = (uint64_t *)a1;
  sub_1C7D6CA30(a1, (uint64_t)v9, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v18 = sub_1C7D78BC0();
  os_log_type_t v19 = sub_1C7D78C90();
  BOOL v20 = os_log_type_enabled(v18, v19);
  id v43 = v15;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v42 = v7;
    uint64_t v22 = v21;
    uint64_t v23 = swift_slowAlloc();
    v48[0] = v23;
    *(_DWORD *)uint64_t v22 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    uint64_t v24 = sub_1C7D78AF0();
    uint64_t v47 = sub_1C7D6B1E0(v24, v25, v48);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2082;
    uint64_t v26 = Alert.description.getter();
    uint64_t v47 = sub_1C7D6B1E0(v26, v27, v48);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v9, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v18, v19, "(%{private}s): Dismissing alert: %{public}s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v23, -1, -1);
    uint64_t v28 = v22;
    uint64_t v7 = v42;
    MEMORY[0x1C87C2080](v28, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v9, type metadata accessor for Alert);
  }

  uint64_t v29 = (uint64_t)v46;
  uint64_t v30 = *v46;
  unint64_t v31 = v46[1];
  swift_beginAccess();
  uint64_t v32 = v2[15];
  uint64_t v33 = v2[16];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v2 + 12), v32);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v33 + 32))(v30, v31, v32, v33);
  swift_endAccess();
  uint64_t v34 = v2[10];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 40))(v29, ObjectType, v34);
  sub_1C7D68EE4(v30, v31);
  uint64_t result = MEMORY[0x1C87C20F0](v2 + 18);
  if (result)
  {
    uint64_t v37 = result;
    uint64_t v38 = v2[19];
    sub_1C7D78AC0();
    sub_1C7D6CA30(v29, (uint64_t)v7, type metadata accessor for Alert);
    unint64_t v39 = (*(unsigned __int8 *)(v44 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v40 = (void *)swift_allocObject();
    v40[2] = v37;
    v40[3] = v38;
    v40[4] = v2;
    sub_1C7D6CAF8((uint64_t)v7, (uint64_t)v40 + v39, type metadata accessor for Alert);
    swift_retain();
    swift_unknownObjectRetain();
    sub_1C7D78AB0();
    sub_1C7D78AA0();
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t AlertCenter.recordIDs(for:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A88);
  sub_1C7D78CC0();
  return v1;
}

uint64_t sub_1C7D6555C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A98);
  uint64_t v5 = MEMORY[0x1F4188790](v68);
  uint64_t v67 = (void *)((char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v66 = (char *)v55 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v65 = (void *)((char *)v55 - v10);
  MEMORY[0x1F4188790](v9);
  uint64_t v64 = (char *)v55 - v11;
  uint64_t v63 = sub_1C7D78BA0();
  uint64_t v12 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  unint64_t v72 = (char *)v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C7D6D970(a1 + 96, (uint64_t)v73);
  uint64_t v14 = v74;
  uint64_t v15 = v75;
  __swift_project_boxed_opaque_existential_1(v73, v74);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  int64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    v55[0] = a2;
    v55[1] = v2;
    uint64_t v76 = MEMORY[0x1E4FBC860];
    sub_1C7D6B838(0, v17, 0);
    uint64_t result = sub_1C7D6BA98(v16);
    unint64_t v20 = result;
    uint64_t v21 = 0;
    uint64_t v22 = v16 + 64;
    uint64_t v60 = v12 + 32;
    char v23 = *(unsigned char *)(v16 + 32);
    uint64_t v56 = v16 + 80;
    uint64_t v24 = &qword_1EA502A98;
    uint64_t v61 = v16;
    uint64_t v62 = v12;
    int64_t v57 = v17;
    uint64_t v58 = v19;
    uint64_t v59 = v16 + 64;
    while ((v20 & 0x8000000000000000) == 0 && (uint64_t)v20 < 1 << v23)
    {
      unint64_t v26 = v20 >> 6;
      if ((*(void *)(v22 + 8 * (v20 >> 6)) & (1 << v20)) == 0) {
        goto LABEL_29;
      }
      if (*(_DWORD *)(v16 + 36) != v19) {
        goto LABEL_30;
      }
      uint64_t v69 = v21;
      uint64_t v70 = 1 << v20;
      uint64_t v27 = v68;
      uint64_t v28 = v24;
      uint64_t v29 = v64;
      uint64_t v30 = (uint64_t)&v64[*(int *)(v68 + 48)];
      uint64_t v31 = *(void *)(v16 + 56);
      uint64_t v32 = (uint64_t *)(*(void *)(v16 + 48) + 16 * v20);
      uint64_t v33 = *v32;
      uint64_t v34 = v32[1];
      uint64_t v35 = *(void *)(*(void *)(type metadata accessor for Alert(0) - 8) + 72);
      unint64_t v71 = v20;
      sub_1C7D6CA30(v31 + v35 * v20, v30, type metadata accessor for Alert);
      *uint64_t v29 = v33;
      v29[1] = v34;
      uint64_t v36 = (uint64_t)v65;
      *uint64_t v65 = v33;
      *(void *)(v36 + 8) = v34;
      uint64_t v37 = v66;
      sub_1C7D6CA30(v30, v36 + *(int *)(v27 + 48), type metadata accessor for Alert);
      sub_1C7D6C8E4(v36, (uint64_t)v37, v28);
      swift_bridgeObjectRetain_n();
      uint64_t v38 = (uint64_t)v29;
      uint64_t v24 = v28;
      sub_1C7D6C94C(v38, v28);
      uint64_t v39 = *(int *)(v27 + 48);
      uint64_t v40 = v67;
      uint64_t v41 = (uint64_t)v67 + v39;
      uint64_t v42 = v37[1];
      *uint64_t v67 = *v37;
      v40[1] = v42;
      sub_1C7D6CA30((uint64_t)v37 + v39, (uint64_t)v40 + v39, type metadata accessor for Alert);
      uint64_t v43 = qword_1EBC68D60;
      swift_bridgeObjectRetain();
      if (v43 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      sub_1C7D78B80();
      sub_1C7D6CA98(v41, type metadata accessor for Alert);
      sub_1C7D6C94C((uint64_t)v37, v28);
      uint64_t v44 = v76;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v46 = v62;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C7D6B838(0, *(void *)(v44 + 16) + 1, 1);
        uint64_t v44 = v76;
      }
      uint64_t v16 = v61;
      uint64_t v47 = v71;
      unint64_t v49 = *(void *)(v44 + 16);
      unint64_t v48 = *(void *)(v44 + 24);
      if (v49 >= v48 >> 1)
      {
        sub_1C7D6B838(v48 > 1, v49 + 1, 1);
        uint64_t v44 = v76;
      }
      *(void *)(v44 + 16) = v49 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v46 + 32))(v44+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(void *)(v46 + 72) * v49, v72, v63);
      uint64_t v76 = v44;
      char v23 = *(unsigned char *)(v16 + 32);
      unint64_t v20 = 1 << v23;
      if (v47 >= 1 << v23) {
        goto LABEL_31;
      }
      uint64_t v22 = v59;
      uint64_t v50 = *(void *)(v59 + 8 * v26);
      if ((v50 & v70) == 0) {
        goto LABEL_32;
      }
      LODWORD(v19) = v58;
      if (*(_DWORD *)(v16 + 36) != v58) {
        goto LABEL_33;
      }
      unint64_t v51 = v50 & (-2 << (v47 & 0x3F));
      if (v51)
      {
        unint64_t v20 = __clz(__rbit64(v51)) | v47 & 0xFFFFFFFFFFFFFFC0;
        int64_t v25 = v57;
      }
      else
      {
        unint64_t v52 = v26 + 1;
        unint64_t v53 = (v20 + 63) >> 6;
        int64_t v25 = v57;
        if (v26 + 1 < v53)
        {
          unint64_t v54 = *(void *)(v59 + 8 * v52);
          if (v54)
          {
LABEL_24:
            unint64_t v20 = __clz(__rbit64(v54)) + (v52 << 6);
          }
          else
          {
            while (v53 - 2 != v26)
            {
              unint64_t v54 = *(void *)(v56 + 8 * v26++);
              if (v54)
              {
                unint64_t v52 = v26 + 1;
                goto LABEL_24;
              }
            }
          }
        }
      }
      uint64_t v21 = v69 + 1;
      if (v69 + 1 == v25)
      {
        swift_bridgeObjectRelease();
        a2 = (void *)v55[0];
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v44 = MEMORY[0x1E4FBC860];
LABEL_27:
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
    *a2 = v44;
  }
  return result;
}

uint64_t sub_1C7D65B38(uint64_t (*a1)(uint64_t a1), unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Alert(0);
  uint64_t v51 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A90);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v45 - v13;
  if (qword_1EBC68F80 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v15 = sub_1C7D78BD0();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EBC68F68);
    swift_retain_n();
    uint64_t v16 = sub_1C7D78BC0();
    os_log_type_t v17 = sub_1C7D78C90();
    int v18 = v17;
    BOOL v19 = os_log_type_enabled(v16, v17);
    unint64_t v47 = a2;
    unint64_t v48 = a1;
    if (v19)
    {
      LODWORD(v52) = v18;
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      int64_t v50 = v21;
      *(_DWORD *)unint64_t v20 = 136380675;
      v54[0] = v21;
      unint64_t v49 = v20 + 4;
      __swift_project_boxed_opaque_existential_1((void *)(a3 + 32), *(void *)(a3 + 56));
      uint64_t v22 = sub_1C7D78AF0();
      uint64_t v53 = sub_1C7D6B1E0(v22, v23, v54);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7D5B000, v16, (os_log_type_t)v52, "(%{private}s): Purging records", v20, 0xCu);
      int64_t v24 = v50;
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v24, -1, -1);
      MEMORY[0x1C87C2080](v20, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    swift_beginAccess();
    sub_1C7D6D970(a3 + 96, (uint64_t)v54);
    uint64_t v25 = v55;
    a1 = v56;
    __swift_project_boxed_opaque_existential_1(v54, v55);
    uint64_t v26 = (*((uint64_t (**)(uint64_t, uint64_t (*)(uint64_t)))a1 + 1))(v25, a1);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    int64_t v28 = 0;
    uint64_t v29 = *(void *)(v26 + 64);
    unint64_t v49 = (uint8_t *)(v26 + 64);
    uint64_t v30 = 1 << *(unsigned char *)(v26 + 32);
    uint64_t v31 = -1;
    if (v30 < 64) {
      uint64_t v31 = ~(-1 << v30);
    }
    a2 = v31 & v29;
    int64_t v50 = (unint64_t)(v30 + 63) >> 6;
    int64_t v46 = v50 - 1;
    uint64_t v52 = a3;
    if ((v31 & v29) != 0)
    {
      while (1)
      {
        unint64_t v32 = __clz(__rbit64(a2));
        a2 &= a2 - 1;
        unint64_t v33 = v32 | (v28 << 6);
LABEL_11:
        uint64_t v34 = *(void *)(v26 + 56);
        uint64_t v35 = (void *)(*(void *)(v26 + 48) + 16 * v33);
        uint64_t v36 = v35[1];
        *uint64_t v12 = *v35;
        v12[1] = v36;
        uint64_t v37 = v34 + *(void *)(v51 + 72) * v33;
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A98);
        sub_1C7D6CA30(v37, (uint64_t)v12 + *(int *)(v38 + 48), type metadata accessor for Alert);
        (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v12, 0, 1, v38);
        swift_bridgeObjectRetain();
        a3 = v52;
LABEL_30:
        sub_1C7D6C8E4((uint64_t)v12, (uint64_t)v14, &qword_1EA502A90);
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A98);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v14, 1, v43) == 1) {
          break;
        }
        swift_bridgeObjectRelease();
        a1 = type metadata accessor for Alert;
        sub_1C7D6CAF8((uint64_t)&v14[*(int *)(v43 + 48)], (uint64_t)v8, type metadata accessor for Alert);
        sub_1C7D64F6C((uint64_t)v8);
        uint64_t result = sub_1C7D6CA98((uint64_t)v8, type metadata accessor for Alert);
        if (!a2) {
          goto LABEL_12;
        }
      }
      uint64_t v44 = swift_release();
      return v48(v44);
    }
LABEL_12:
    int64_t v39 = v28 + 1;
    if (!__OFADD__(v28, 1)) {
      break;
    }
    __break(1u);
  }
  if (v39 >= v50) {
    goto LABEL_29;
  }
  unint64_t v40 = *(void *)&v49[8 * v39];
  if (v40)
  {
LABEL_15:
    a2 = (v40 - 1) & v40;
    unint64_t v33 = __clz(__rbit64(v40)) + (v39 << 6);
    int64_t v28 = v39;
    goto LABEL_11;
  }
  int64_t v41 = v28 + 2;
  ++v28;
  if (v39 + 1 >= v50) {
    goto LABEL_29;
  }
  unint64_t v40 = *(void *)&v49[8 * v41];
  if (v40)
  {
LABEL_18:
    int64_t v39 = v41;
    goto LABEL_15;
  }
  int64_t v28 = v39 + 1;
  if (v39 + 2 >= v50) {
    goto LABEL_29;
  }
  unint64_t v40 = *(void *)&v49[8 * v39 + 16];
  if (v40)
  {
    v39 += 2;
    goto LABEL_15;
  }
  int64_t v41 = v39 + 3;
  int64_t v28 = v39 + 2;
  if (v39 + 3 >= v50)
  {
LABEL_29:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A98);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v12, 1, 1, v42);
    a2 = 0;
    goto LABEL_30;
  }
  unint64_t v40 = *(void *)&v49[8 * v41];
  if (v40) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v39 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v39 >= v50)
    {
      int64_t v28 = v46;
      goto LABEL_29;
    }
    unint64_t v40 = *(void *)&v49[8 * v39];
    ++v41;
    if (v40) {
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C7D66130()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A70);
  sub_1C7D78CC0();
  return v1;
}

uint64_t sub_1C7D661A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A88);
  sub_1C7D78CC0();
  return v1;
}

uint64_t sub_1C7D6623C()
{
  sub_1C7D78CC0();
  return v1;
}

uint64_t sub_1C7D662A4(void *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v5 = v4;
  unint64_t v108 = a1;
  uint64_t v109 = a3;
  uint64_t v107 = a2;
  uint64_t v7 = sub_1C7D78A00();
  uint64_t v104 = *(void *)(v7 - 8);
  uint64_t v105 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v101 = &v89[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (int *)&v89[-v10];
  uint64_t v12 = type metadata accessor for Alert(0);
  uint64_t v91 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v94 = &v89[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  os_log_type_t v93 = &v89[-v16];
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v102 = &v89[-v18];
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v99 = &v89[-v20];
  uint64_t v92 = v21;
  MEMORY[0x1F4188790](v19);
  unint64_t v106 = (uint64_t *)&v89[-v22];
  uint64_t v23 = type metadata accessor for Alert.HistoryItem(0);
  unint64_t v103 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = &v89[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v26 = sub_1C7D78C20();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v29 = &v89[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v30 = *a4;
  uint64_t v31 = (void *)v5[2];
  *uint64_t v29 = v31;
  (*(void (**)(void *, void, unint64_t))(v27 + 104))(v29, *MEMORY[0x1E4FBCBF0], v26);
  id v32 = v31;
  LOBYTE(v31) = sub_1C7D78C30();
  (*(void (**)(void *, unint64_t))(v27 + 8))(v29, v26);
  if (v31)
  {
    uint64_t v100 = v11;
    uint64_t v11 = (int *)v12;
    unint64_t v26 = *(void *)((char *)v108 + *(int *)(v12 + 36));
    uint64_t v33 = v5[7];
    uint64_t v97 = v5 + 4;
    uint64_t v98 = v5;
    __swift_project_boxed_opaque_existential_1(v5 + 4, v33);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_1C7D78AF0();
    uint64_t v36 = v35;
    uint64_t v37 = v109;
    swift_bridgeObjectRetain();
    sub_1C7D789E0();
    unsigned char *v25 = v30;
    *((void *)v25 + 1) = v34;
    *((void *)v25 + 2) = v36;
    *((void *)v25 + 3) = v107;
    *((void *)v25 + 4) = v37;
    v25[40] = 0;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int v90 = v30;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  unint64_t v26 = sub_1C7D6AF78(0, *(void *)(v26 + 16) + 1, 1, v26);
LABEL_3:
  uint64_t v39 = v104;
  unint64_t v41 = *(void *)(v26 + 16);
  unint64_t v40 = *(void *)(v26 + 24);
  if (v41 >= v40 >> 1) {
    unint64_t v26 = sub_1C7D6AF78(v40 > 1, v41 + 1, 1, v26);
  }
  *(void *)(v26 + 16) = v41 + 1;
  sub_1C7D6CAF8((uint64_t)v25, v26+ ((*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80))+ *(void *)(v103 + 72) * v41, type metadata accessor for Alert.HistoryItem);
  uint64_t v42 = v108;
  uint64_t v104 = *v108;
  unint64_t v43 = v26;
  uint64_t v44 = v108[1];
  uint64_t v45 = (char *)v108 + v11[5];
  int64_t v46 = v11;
  unint64_t v47 = *(void (**)(int *, char *, uint64_t))(v39 + 16);
  unint64_t v48 = v100;
  unint64_t v49 = (uint64_t *)v105;
  v47(v100, v45, v105);
  if (*(void *)(v43 + 16))
  {
    uint64_t v50 = v46[7];
    unint64_t v51 = *(void *)((char *)v42 + v46[8] + 8);
    uint64_t v95 = *(void *)((char *)v42 + v46[8]);
    unint64_t v96 = v51;
    unint64_t v103 = v43;
    uint64_t v52 = v48;
    uint64_t v53 = *(void *)((char *)v42 + v50);
    char v54 = *((unsigned char *)v42 + v50 + 8);
    uint64_t v55 = (uint64_t)v99;
    *uint64_t v99 = v104;
    *(void *)(v55 + 8) = v44;
    v47((int *)(v55 + v46[5]), (char *)v52, (uint64_t)v49);
    uint64_t v56 = v55 + v46[7];
    *(void *)uint64_t v56 = v53;
    *(unsigned char *)(v56 + 8) = v54;
    swift_bridgeObjectRetain();
    uint64_t v58 = v95;
    unint64_t v57 = v96;
    sub_1C7D6C0E8(v95, v96);
    uint64_t v59 = v101;
    sub_1C7D78990();
    (*(void (**)(int *, uint64_t *))(v39 + 8))(v52, v49);
    (*(void (**)(uint64_t, unsigned char *, uint64_t *))(v39 + 32))(v55 + v46[6], v59, v49);
    uint64_t v60 = (uint64_t *)(v55 + v46[8]);
    *uint64_t v60 = v58;
    v60[1] = v57;
    *(void *)(v55 + v46[9]) = v103;
    unint64_t v49 = v106;
    sub_1C7D6CAF8(v55, (uint64_t)v106, type metadata accessor for Alert);
    if (qword_1EBC68F80 == -1) {
      goto LABEL_7;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_7:
  uint64_t v61 = sub_1C7D78BD0();
  __swift_project_value_buffer(v61, (uint64_t)qword_1EBC68F68);
  uint64_t v62 = v102;
  sub_1C7D6CA30((uint64_t)v49, (uint64_t)v102, type metadata accessor for Alert);
  uint64_t v63 = v98;
  swift_retain_n();
  uint64_t v64 = sub_1C7D78BC0();
  os_log_type_t v65 = sub_1C7D78C90();
  BOOL v66 = os_log_type_enabled(v64, v65);
  uint64_t v67 = v109;
  if (v66)
  {
    uint64_t v68 = swift_slowAlloc();
    uint64_t v105 = swift_slowAlloc();
    v111[0] = v105;
    *(_DWORD *)uint64_t v68 = 136380931;
    uint64_t v69 = v97;
    __swift_project_boxed_opaque_existential_1(v97, v63[7]);
    uint64_t v70 = sub_1C7D78AF0();
    uint64_t v110 = sub_1C7D6B1E0(v70, v71, v111);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 12) = 2082;
    uint64_t v72 = Alert.description.getter();
    uint64_t v110 = sub_1C7D6B1E0(v72, v73, v111);
    uint64_t v67 = v109;
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v62, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v64, v65, "(%{private}s): Attempting to present alert on a specific device: %{public}s ", (uint8_t *)v68, 0x16u);
    uint64_t v74 = v105;
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v74, -1, -1);
    uint64_t v75 = v68;
    unint64_t v49 = v106;
    MEMORY[0x1C87C2080](v75, -1, -1);

    uint64_t v76 = v107;
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v62, type metadata accessor for Alert);

    uint64_t v76 = v107;
    uint64_t v69 = v97;
  }
  __swift_project_boxed_opaque_existential_1(v69, v63[7]);
  if (sub_1C7D78AF0() == v76 && v77 == v67)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v78 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if ((v78 & 1) == 0)
    {
      sub_1C7D6CA30((uint64_t)v49, (uint64_t)v93, type metadata accessor for Alert);
      sub_1C7D6CA30((uint64_t)v108, (uint64_t)v94, type metadata accessor for Alert);
      uint64_t v79 = *(unsigned __int8 *)(v91 + 80);
      uint64_t v80 = (v79 + 16) & ~v79;
      uint64_t v81 = v80 + v92;
      unint64_t v82 = (v80 + v92) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v83 = (v82 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v84 = v67;
      uint64_t v85 = (v79 + 16 + v83) & ~v79;
      uint64_t v86 = swift_allocObject();
      sub_1C7D6CAF8((uint64_t)v93, v86 + v80, type metadata accessor for Alert);
      *(unsigned char *)(v86 + v81) = v90;
      unint64_t v49 = v106;
      *(void *)(v82 + v86 + 8) = v63;
      uint64_t v87 = (void *)(v86 + v83);
      *uint64_t v87 = v76;
      v87[1] = v84;
      sub_1C7D6CAF8((uint64_t)v94, v86 + v85, type metadata accessor for Alert);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1C7D67A00(v49, (uint64_t (*)(uint64_t))sub_1C7D6D3AC, v86);
      swift_release();
      sub_1C7D67F64(v49);
      return sub_1C7D6CA98((uint64_t)v49, type metadata accessor for Alert);
    }
  }
  sub_1C7D66C54((uint64_t)v49);
  return sub_1C7D6CA98((uint64_t)v49, type metadata accessor for Alert);
}

void sub_1C7D66C54(uint64_t a1)
{
  uint64_t v66 = type metadata accessor for Alert.HistoryItem(0);
  uint64_t v3 = *(void *)(v66 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v66);
  uint64_t v67 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v59 - v7;
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v59 - v9;
  uint64_t v11 = type metadata accessor for Alert(0);
  uint64_t v63 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v65 = (uint64_t)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v70 = (id *)((char *)&v59 - v15);
  uint64_t v64 = v16;
  MEMORY[0x1F4188790](v14);
  uint64_t v68 = (id *)((char *)&v59 - v17);
  uint64_t v18 = sub_1C7D78C20();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (id *)((char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v69 = v1;
  uint64_t v22 = (void *)v1[2];
  void *v21 = v22;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E4FBCBF0], v18);
  id v23 = v22;
  LOBYTE(v22) = sub_1C7D78C30();
  uint64_t v25 = *(void (**)(void *, uint64_t))(v19 + 8);
  uint64_t v24 = (void *)(v19 + 8);
  v25(v21, v18);
  if (v22)
  {
    uint64_t v26 = *(void *)(a1 + *(int *)(v11 + 36));
    uint64_t v27 = *(void *)(v26 + 16);
    if (v27)
    {
      id v59 = v23;
      unint64_t v62 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v61 = *(void *)(v3 + 72);
      sub_1C7D6CA30(v26 + v62 + v61 * (v27 - 1), (uint64_t)v8, type metadata accessor for Alert.HistoryItem);
      char v28 = *v8;
      uint64_t v30 = *((void *)v8 + 1);
      uint64_t v29 = *((void *)v8 + 2);
      uint64_t v31 = *((void *)v8 + 3);
      uint64_t v32 = *((void *)v8 + 4);
      uint64_t v60 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7D789E0();
      *uint64_t v10 = v28;
      *((void *)v10 + 1) = v30;
      *((void *)v10 + 2) = v29;
      *((void *)v10 + 3) = v31;
      *((void *)v10 + 4) = v32;
      uint64_t v18 = a1;
      v10[40] = 1;
      sub_1C7D6CA98((uint64_t)v8, type metadata accessor for Alert.HistoryItem);
      uint64_t v24 = v68;
      sub_1C7D6CA30(a1, (uint64_t)v68, type metadata accessor for Alert);
      id v23 = v67;
      sub_1C7D6CA30((uint64_t)v10, (uint64_t)v67, type metadata accessor for Alert.HistoryItem);
      uint64_t v11 = *(int *)(v60 + 36);
      a1 = *(void *)((char *)v24 + v11);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_20:
  a1 = sub_1C7D6AF78(0, *(void *)(a1 + 16) + 1, 1, a1);
LABEL_4:
  uint64_t v33 = (uint64_t)v70;
  unint64_t v35 = *(void *)(a1 + 16);
  unint64_t v34 = *(void *)(a1 + 24);
  if (v35 >= v34 >> 1) {
    a1 = sub_1C7D6AF78(v34 > 1, v35 + 1, 1, a1);
  }
  *(void *)(a1 + 16) = v35 + 1;
  sub_1C7D6CAF8((uint64_t)v23, a1 + v62 + v35 * v61, type metadata accessor for Alert.HistoryItem);
  *(void *)((char *)v24 + v11) = a1;
  sub_1C7D6CA98((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
  uint64_t v36 = v69;
  sub_1C7D67F64(v24);
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_1C7D78BD0();
  __swift_project_value_buffer(v37, (uint64_t)qword_1EBC68F68);
  sub_1C7D6CA30(v18, v33, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v38 = sub_1C7D78BC0();
  os_log_type_t v39 = sub_1C7D78C90();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v72 = v41;
    *(_DWORD *)uint64_t v40 = 136380931;
    __swift_project_boxed_opaque_existential_1(v36 + 4, v36[7]);
    uint64_t v42 = sub_1C7D78AF0();
    uint64_t v71 = sub_1C7D6B1E0(v42, v43, &v72);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2082;
    uint64_t v44 = (uint64_t)v70;
    uint64_t v45 = Alert.description.getter();
    uint64_t v71 = sub_1C7D6B1E0(v45, v46, &v72);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98(v44, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v38, v39, "(%{private}s): Attempting to present alert on local device: %{public}s", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v41, -1, -1);
    MEMORY[0x1C87C2080](v40, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98(v33, type metadata accessor for Alert);
  }

  unint64_t v47 = (void *)v36[11];
  if (v47[2])
  {
    unint64_t v48 = sub_1C7D76FF8(1u);
    if (v49) {
      goto LABEL_17;
    }
  }
  if (qword_1EBC68E20 != -1) {
    swift_once();
  }
  unint64_t v47 = off_1EBC68E10;
  if (*((void *)off_1EBC68E10 + 2))
  {
    unint64_t v48 = sub_1C7D76FF8(1u);
    if (v50)
    {
LABEL_17:
      double v51 = *(double *)(v47[7] + 8 * v48);
      sub_1C7D78AC0();
      uint64_t v52 = sub_1C7D78A90();
      uint64_t v53 = sub_1C7D78A70();
      uint64_t v70 = &v59;
      MEMORY[0x1F4188790](v53);
      *(&v59 - 4) = v36;
      *(&v59 - 3) = v24;
      *(&v59 - 2) = (id)v52;
      uint64_t v54 = v65;
      sub_1C7D6CA30((uint64_t)v24, v65, type metadata accessor for Alert);
      uint64_t v55 = (uint64_t)v24;
      unint64_t v56 = (*(unsigned __int8 *)(v63 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
      unint64_t v57 = (v64 + v56 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v58 = swift_allocObject();
      *(void *)(v58 + 16) = v36;
      sub_1C7D6CAF8(v54, v58 + v56, type metadata accessor for Alert);
      *(void *)(v58 + v57) = v52;
      swift_retain();
      swift_retain();
      MEMORY[0x1C87C1790](v59, sub_1C7D6CB60, &v59 - 6, sub_1C7D6CCC4, v58, v51);
      swift_release();
      swift_release();
      sub_1C7D6CA98(v55, type metadata accessor for Alert);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C7D67490(uint64_t a1, char a2, void *a3, unint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v66 = a6;
  unint64_t v62 = a4;
  int v61 = a2 & 1;
  uint64_t v69 = sub_1C7D78A00();
  uint64_t v64 = *(void *)(v69 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v69);
  uint64_t v60 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v67 = (char *)&v58 - v11;
  uint64_t v12 = type metadata accessor for Alert(0);
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v58 = (int **)((char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v13);
  uint64_t v59 = (uint64_t)&v58 - v15;
  uint64_t v16 = type metadata accessor for Alert.HistoryItem(0);
  unint64_t v63 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v58 - v20;
  uint64_t v68 = (int *)v12;
  unint64_t v22 = *(void *)(a1 + *(int *)(v12 + 36));
  __swift_project_boxed_opaque_existential_1(a3 + 4, a3[7]);
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1C7D78AF0();
  uint64_t v25 = v24;
  uint64_t v65 = v16;
  swift_bridgeObjectRetain();
  sub_1C7D789E0();
  char *v21 = v61;
  *((void *)v21 + 1) = v23;
  *((void *)v21 + 2) = v25;
  *((void *)v21 + 3) = v62;
  *((void *)v21 + 4) = a5;
  v21[40] = 64;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v22 = sub_1C7D6AF78(0, *(void *)(v22 + 16) + 1, 1, v22);
  }
  unint64_t v27 = *(void *)(v22 + 16);
  unint64_t v26 = *(void *)(v22 + 24);
  if (v27 >= v26 >> 1) {
    unint64_t v22 = sub_1C7D6AF78(v26 > 1, v27 + 1, 1, v22);
  }
  *(void *)(v22 + 16) = v27 + 1;
  unint64_t v62 = (*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  uint64_t v28 = *(void *)(v63 + 72);
  sub_1C7D6CAF8((uint64_t)v21, v22 + v62 + v28 * v27, type metadata accessor for Alert.HistoryItem);
  __swift_project_boxed_opaque_existential_1(a3 + 4, a3[7]);
  uint64_t v29 = sub_1C7D78AF0();
  uint64_t v31 = v30;
  __swift_project_boxed_opaque_existential_1(a3 + 4, a3[7]);
  uint64_t v32 = sub_1C7D78AF0();
  uint64_t v34 = v33;
  sub_1C7D789E0();
  *uint64_t v19 = 1;
  *((void *)v19 + 1) = v29;
  *((void *)v19 + 2) = v31;
  *((void *)v19 + 3) = v32;
  *((void *)v19 + 4) = v34;
  v19[40] = 0;
  unint64_t v36 = *(void *)(v22 + 16);
  unint64_t v35 = *(void *)(v22 + 24);
  if (v36 >= v35 >> 1) {
    unint64_t v22 = sub_1C7D6AF78(v35 > 1, v36 + 1, 1, v22);
  }
  uint64_t v37 = v68;
  *(void *)(v22 + 16) = v36 + 1;
  sub_1C7D6CAF8((uint64_t)v19, v22 + v62 + v36 * v28, type metadata accessor for Alert.HistoryItem);
  uint64_t v38 = v66;
  os_log_type_t v39 = v67;
  uint64_t v68 = (int *)*v66;
  unint64_t v40 = v22;
  uint64_t v41 = v66[1];
  uint64_t v42 = v64;
  unint64_t v43 = *(uint64_t (**)(char *, char *, uint64_t))(v64 + 16);
  uint64_t v44 = v69;
  uint64_t result = v43(v67, (char *)v66 + v37[5], v69);
  if (*(void *)(v40 + 16))
  {
    uint64_t v46 = v37[7];
    unint64_t v47 = *(void *)((char *)v38 + v37[8] + 8);
    unint64_t v62 = *(void *)((char *)v38 + v37[8]);
    unint64_t v63 = v47;
    uint64_t v65 = v40;
    uint64_t v66 = a3;
    uint64_t v48 = *(void *)((char *)v38 + v46);
    char v49 = *((unsigned char *)v38 + v46 + 8);
    char v50 = v39;
    uint64_t v51 = (uint64_t)v58;
    *uint64_t v58 = v68;
    *(void *)(v51 + 8) = v41;
    v43((char *)(v51 + v37[5]), v50, v44);
    uint64_t v52 = v51 + v37[7];
    *(void *)uint64_t v52 = v48;
    *(unsigned char *)(v52 + 8) = v49;
    swift_bridgeObjectRetain();
    unint64_t v54 = v62;
    unint64_t v53 = v63;
    sub_1C7D6C0E8(v62, v63);
    uint64_t v55 = v60;
    sub_1C7D78990();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v50, v44);
    (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v51 + v37[6], v55, v44);
    unint64_t v56 = (unint64_t *)(v51 + v37[8]);
    unint64_t *v56 = v54;
    v56[1] = v53;
    *(void *)(v51 + v37[9]) = v65;
    uint64_t v57 = v59;
    sub_1C7D6CAF8(v51, v59, type metadata accessor for Alert);
    sub_1C7D5FA94(v57);
    return sub_1C7D6CA98(v57, type metadata accessor for Alert);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C7D67A00(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  uint64_t v6 = type metadata accessor for Alert(0);
  MEMORY[0x1F4188790](v6);
  uint64_t v48 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v45 - v12;
  uint64_t v14 = sub_1C7D78C20();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (uint64_t *)((char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = (void *)v4[2];
  void *v17 = v18;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E4FBCBF0], v14);
  id v19 = v18;
  LOBYTE(v18) = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v20 = *(uint64_t *)((char *)a1 + *(int *)(v6 + 36));
  uint64_t v21 = *(void *)(v20 + 16);
  if (!v21)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v22 = v4[11];
  uint64_t v23 = type metadata accessor for Alert.HistoryItem(0);
  uint64_t v24 = *(void *)(*(void *)(v23 - 8) + 72);
  if (*(void *)(v22 + 16))
  {
    uint64_t v25 = v23;
    uint64_t v26 = v21 - 1;
    uint64_t v27 = v20
        + ((*(unsigned __int8 *)(*(void *)(v23 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v23 - 8) + 80));
    sub_1C7D76FF8(*(unsigned char *)(v27 + v24 * v26 + 40));
    if (v28)
    {
      uint64_t v29 = *(void *)(v20 + 16);
      if (v29)
      {
        uint64_t v30 = v45;
        (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v11, v27 + (v29 - 1) * v24 + *(int *)(v25 + 32), v8);
        sub_1C7D789B0();
        uint64_t v31 = *(void (**)(char *, uint64_t))(v30 + 8);
        v31(v11, v8);
        sub_1C7D789C0();
        double v33 = v32;
        v31(v13, v8);
        sub_1C7D69794(*a1, a1[1], v46, v47, v33);
      }
      else
      {
        __break(1u);
      }
      return;
    }
  }
  if (qword_1EBC68F80 != -1) {
    goto LABEL_14;
  }
LABEL_8:
  uint64_t v34 = sub_1C7D78BD0();
  __swift_project_value_buffer(v34, (uint64_t)qword_1EBC68F68);
  uint64_t v35 = (uint64_t)a1;
  uint64_t v36 = v48;
  sub_1C7D6CA30(v35, v48, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v37 = sub_1C7D78BC0();
  os_log_type_t v38 = sub_1C7D78C90();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v50 = v40;
    *(_DWORD *)uint64_t v39 = 136380931;
    __swift_project_boxed_opaque_existential_1(v4 + 4, v4[7]);
    uint64_t v41 = sub_1C7D78AF0();
    uint64_t v49 = sub_1C7D6B1E0(v41, v42, &v50);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2082;
    uint64_t v43 = Alert.description.getter();
    uint64_t v49 = sub_1C7D6B1E0(v43, v44, &v50);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98(v36, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v37, v38, "(%{private}s): Alert does not require a watchdog: %{public}s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v40, -1, -1);
    MEMORY[0x1C87C2080](v39, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98(v36, type metadata accessor for Alert);
  }
}

uint64_t sub_1C7D67F64(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v74 = type metadata accessor for Alert(0);
  uint64_t v4 = *(void *)(v74 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v74);
  uint64_t v68 = (uint64_t)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v72 = (uint64_t)&v66 - v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v67 = (uint64_t *)((char *)&v66 - v9);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AA8);
  MEMORY[0x1F4188790](v73);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v69 = (uint64_t *)((char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v66 - v16;
  MEMORY[0x1F4188790](v15);
  id v19 = (char *)&v66 - v18;
  uint64_t v20 = sub_1C7D78C20();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (uint64_t *)((char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = *(void **)(v2 + 16);
  *uint64_t v23 = v24;
  (*(void (**)(void *, void, uint64_t))(v21 + 104))(v23, *MEMORY[0x1E4FBCBF0], v20);
  id v25 = v24;
  LOBYTE(v24) = sub_1C7D78C30();
  uint64_t v27 = *(void (**)(void *, uint64_t))(v21 + 8);
  uint64_t v26 = (void *)(v21 + 8);
  v27(v23, v20);
  if ((v24 & 1) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v26 = (void *)v2;
  swift_beginAccess();
  uint64_t v70 = v2 + 96;
  sub_1C7D6D970(v2 + 96, (uint64_t)v76);
  uint64_t v28 = v77;
  uint64_t v29 = v78;
  __swift_project_boxed_opaque_existential_1(v76, v77);
  (*(void (**)(void, void, uint64_t, uint64_t))(v29 + 16))(*a1, a1[1], v28, v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
  sub_1C7D6CA30((uint64_t)a1, (uint64_t)v17, type metadata accessor for Alert);
  uint64_t v30 = v74;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v17, 0, 1, v74);
  uint64_t v31 = (uint64_t)&v11[*(int *)(v73 + 48)];
  sub_1C7D6C258((uint64_t)v19, (uint64_t)v11);
  sub_1C7D6C258((uint64_t)v17, v31);
  double v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  int v33 = v32(v11, 1, v30);
  uint64_t v23 = v19;
  uint64_t v2 = (uint64_t)a1;
  if (v33 != 1)
  {
    uint64_t v34 = v69;
    sub_1C7D6C258((uint64_t)v11, (uint64_t)v69);
    if (v32((char *)v31, 1, v74) != 1)
    {
      uint64_t v35 = v67;
      sub_1C7D6CAF8(v31, (uint64_t)v67, type metadata accessor for Alert);
      char v36 = _s12SessionAlert0B0V2eeoiySbAC_ACtFZ_0(v34, v35);
      sub_1C7D6CA98((uint64_t)v35, type metadata accessor for Alert);
      sub_1C7D6C94C((uint64_t)v17, &qword_1EBC68DB0);
      sub_1C7D6CA98((uint64_t)v34, type metadata accessor for Alert);
      sub_1C7D6C94C((uint64_t)v11, &qword_1EBC68DB0);
      a1 = v26;
      if (v36) {
        goto LABEL_9;
      }
LABEL_13:
      if (qword_1EBC68F80 == -1)
      {
LABEL_14:
        uint64_t v47 = sub_1C7D78BD0();
        __swift_project_value_buffer(v47, (uint64_t)qword_1EBC68F68);
        uint64_t v48 = v72;
        sub_1C7D6CA30(v2, v72, type metadata accessor for Alert);
        swift_retain_n();
        uint64_t v49 = sub_1C7D78BC0();
        os_log_type_t v50 = sub_1C7D78C90();
        BOOL v51 = os_log_type_enabled(v49, v50);
        uint64_t v71 = v23;
        if (v51)
        {
          uint64_t v52 = swift_slowAlloc();
          uint64_t v74 = v2;
          uint64_t v53 = v52;
          uint64_t v54 = swift_slowAlloc();
          v76[0] = v54;
          *(_DWORD *)uint64_t v53 = 136380931;
          __swift_project_boxed_opaque_existential_1(a1 + 4, a1[7]);
          a1 = v26;
          uint64_t v55 = sub_1C7D78AF0();
          uint64_t v75 = sub_1C7D6B1E0(v55, v56, v76);
          sub_1C7D78CF0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v53 + 12) = 2082;
          uint64_t v57 = Alert.description.getter();
          uint64_t v75 = sub_1C7D6B1E0(v57, v58, v76);
          sub_1C7D78CF0();
          swift_bridgeObjectRelease();
          sub_1C7D6CA98(v48, type metadata accessor for Alert);
          _os_log_impl(&dword_1C7D5B000, v49, v50, "(%{private}s): Syncing alert: %{public}s", (uint8_t *)v53, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C87C2080](v54, -1, -1);
          uint64_t v59 = v53;
          uint64_t v2 = v74;
          MEMORY[0x1C87C2080](v59, -1, -1);
        }
        else
        {
          swift_release_n();
          sub_1C7D6CA98(v48, type metadata accessor for Alert);
        }

        uint64_t v60 = v70;
        swift_beginAccess();
        uint64_t v61 = a1[15];
        uint64_t v62 = a1[16];
        __swift_mutable_project_boxed_opaque_existential_1(v60, v61);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 24))(v2, v61, v62);
        swift_endAccess();
        __swift_project_boxed_opaque_existential_1(a1 + 4, a1[7]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AA0);
        sub_1C7D78BA0();
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C7D79990;
        uint64_t v63 = qword_1EBC68D60;
        swift_bridgeObjectRetain();
        if (v63 != -1) {
          swift_once();
        }
        swift_bridgeObjectRetain();
        sub_1C7D78B80();
        sub_1C7D78AD0();
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
LABEL_24:
      swift_once();
      goto LABEL_14;
    }
    sub_1C7D6C94C((uint64_t)v17, &qword_1EBC68DB0);
    sub_1C7D6CA98((uint64_t)v34, type metadata accessor for Alert);
    a1 = v26;
LABEL_7:
    sub_1C7D6C94C((uint64_t)v11, &qword_1EA502AA8);
    goto LABEL_13;
  }
  sub_1C7D6C94C((uint64_t)v17, &qword_1EBC68DB0);
  a1 = v26;
  if (v32((char *)v31, 1, v74) != 1) {
    goto LABEL_7;
  }
  sub_1C7D6C94C((uint64_t)v11, &qword_1EBC68DB0);
LABEL_9:
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_1C7D78BD0();
  __swift_project_value_buffer(v37, (uint64_t)qword_1EBC68F68);
  uint64_t v38 = v68;
  sub_1C7D6CA30(v2, v68, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v39 = sub_1C7D78BC0();
  os_log_type_t v40 = sub_1C7D78C90();
  if (!os_log_type_enabled(v39, v40))
  {

    sub_1C7D6CA98(v38, type metadata accessor for Alert);
    swift_release_n();
    uint64_t v64 = (uint64_t)v23;
    return sub_1C7D6C94C(v64, &qword_1EBC68DB0);
  }
  uint64_t v41 = swift_slowAlloc();
  uint64_t v42 = swift_slowAlloc();
  v76[0] = v42;
  *(_DWORD *)uint64_t v41 = 136380931;
  uint64_t v71 = v23;
  __swift_project_boxed_opaque_existential_1(a1 + 4, a1[7]);
  uint64_t v43 = sub_1C7D78AF0();
  uint64_t v75 = sub_1C7D6B1E0(v43, v44, v76);
  sub_1C7D78CF0();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v41 + 12) = 2082;
  uint64_t v45 = Alert.description.getter();
  uint64_t v75 = sub_1C7D6B1E0(v45, v46, v76);
  sub_1C7D78CF0();
  swift_bridgeObjectRelease();
  sub_1C7D6CA98(v38, type metadata accessor for Alert);
  _os_log_impl(&dword_1C7D5B000, v39, v40, "(%{private}s): Not syncing unchanged alert: %{public}s", (uint8_t *)v41, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x1C87C2080](v42, -1, -1);
  MEMORY[0x1C87C2080](v41, -1, -1);

LABEL_20:
  uint64_t v64 = (uint64_t)v71;
  return sub_1C7D6C94C(v64, &qword_1EBC68DB0);
}

uint64_t sub_1C7D68A50(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C7D78A00();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v48 - v8;
  uint64_t v10 = type metadata accessor for Alert(0);
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = *(int *)(result + 36);
  uint64_t v55 = a1;
  uint64_t v14 = *(void *)(a1 + v53);
  uint64_t v15 = *(void *)(v14 + 16);
  if (!v15)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v49 = v9;
  os_log_type_t v50 = v7;
  uint64_t v51 = v4;
  uint64_t v16 = v15 - 1;
  uint64_t v48 = type metadata accessor for Alert.HistoryItem(0);
  uint64_t v17 = *(void *)(v48 - 8);
  unint64_t v54 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = v14 + v54 + v18 * v16;
  uint64_t v21 = *(void *)(v19 + 8);
  uint64_t v20 = *(void *)(v19 + 16);
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  swift_bridgeObjectRetain();
  if (v21 == sub_1C7D78AF0() && v20 == v22)
  {
    swift_bridgeObjectRelease_n();
    sub_1C7D6CA30(v55, (uint64_t)v13, type metadata accessor for Alert);
    goto LABEL_15;
  }
  char v24 = sub_1C7D78EA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C7D6CA30(v55, (uint64_t)v13, type metadata accessor for Alert);
  if (v24)
  {
LABEL_15:
    sub_1C7D6CA98((uint64_t)v13, type metadata accessor for Alert);
LABEL_16:
    char v34 = 0;
    return v34 & 1;
  }
  uint64_t v25 = *(void *)&v13[*(int *)(v10 + 36)];
  uint64_t v26 = *(void *)(v25 + 16);
  if (!v26)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v27 = v54;
  uint64_t v28 = v25 + v54 + (v26 - 1) * v18;
  uint64_t v30 = *(void *)(v28 + 24);
  uint64_t v29 = *(void *)(v28 + 32);
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  swift_bridgeObjectRetain();
  if (v30 == sub_1C7D78AF0() && v29 == v31)
  {
    swift_bridgeObjectRelease_n();
    uint64_t result = sub_1C7D6CA98((uint64_t)v13, type metadata accessor for Alert);
  }
  else
  {
    char v33 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C7D6CA98((uint64_t)v13, type metadata accessor for Alert);
    char v34 = 0;
    if ((v33 & 1) == 0) {
      return v34 & 1;
    }
  }
  uint64_t v35 = v53;
  uint64_t v36 = *(void *)(v55 + v53);
  uint64_t v37 = *(void *)(v36 + 16);
  if (!v37)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unsigned int v38 = *(unsigned __int8 *)(v36 + v27 + (v37 - 1) * v18 + 40);
  if (v38 > 0x3F) {
    goto LABEL_16;
  }
  if (!*(void *)(v2[11] + 16)) {
    goto LABEL_16;
  }
  uint64_t result = sub_1C7D76FF8(v38);
  if ((v39 & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v40 = *(void *)(v55 + v35);
  uint64_t v41 = *(void *)(v40 + 16);
  if (v41)
  {
    uint64_t v42 = v40 + v27 + (v41 - 1) * v18 + *(int *)(v48 + 32);
    uint64_t v43 = v51;
    uint64_t v44 = v52;
    uint64_t v45 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v50, v42, v51);
    unint64_t v46 = v49;
    sub_1C7D78990();
    uint64_t v47 = *(void (**)(char *, uint64_t))(v44 + 8);
    v47(v45, v43);
    sub_1C7D789E0();
    char v34 = sub_1C7D789A0();
    v47(v45, v43);
    v47(v46, v43);
    return v34 & 1;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1C7D68EE4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C7D78C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (void *)v3[2];
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCBF0], v6);
  id v11 = v10;
  uint64_t v12 = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if ((v12 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    swift_once();
    goto LABEL_5;
  }
  uint64_t result = swift_beginAccess();
  uint64_t v14 = v3[17];
  if (!*(void *)(v14 + 16)) {
    return result;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_1C7D77080(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v12 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_1EBC68F80 != -1) {
    goto LABEL_12;
  }
LABEL_5:
  uint64_t v17 = sub_1C7D78BD0();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC68F68);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v18 = sub_1C7D78BC0();
  os_log_type_t v19 = sub_1C7D78C90();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v28[0] = v25;
    *(_DWORD *)uint64_t v20 = 136380931;
    uint64_t v24 = v20 + 4;
    uint64_t v26 = v12;
    __swift_project_boxed_opaque_existential_1(v3 + 4, v3[7]);
    uint64_t v21 = sub_1C7D78AF0();
    uint64_t v27 = sub_1C7D6B1E0(v21, v22, v28);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1C7D6B1E0(a1, a2, v28);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7D5B000, v18, v19, "(%{private}s): Watchdog cancelled for: %{public}s", (uint8_t *)v20, 0x16u);
    uint64_t v23 = v25;
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v23, -1, -1);
    MEMORY[0x1C87C2080](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  sub_1C7D78A20();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C7D77354(a1, a2);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1C7D692C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Alert(0);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v40 + 64);
  uint64_t v6 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = sub_1C7D78C20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (uint64_t *)((char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (void *)v2[2];
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCBF0], v10);
  id v15 = v14;
  char v16 = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v16)
  {
    uint64_t v39 = v5;
    if (qword_1EBC68F80 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v17 = sub_1C7D78BD0();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC68F68);
  sub_1C7D6CA30(a1, (uint64_t)v9, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v18 = sub_1C7D78BC0();
  os_log_type_t v19 = sub_1C7D78C90();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v38 = a1;
    uint64_t v21 = v20;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v42 = v37;
    *(_DWORD *)uint64_t v21 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    uint64_t v22 = sub_1C7D78AF0();
    uint64_t v41 = sub_1C7D6B1E0(v22, v23, &v42);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    uint64_t v24 = Alert.description.getter();
    uint64_t v41 = sub_1C7D6B1E0(v24, v25, &v42);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v9, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v18, v19, "(%{private}s): Attempting to present non-interrupting alert on local device: %{public}s", (uint8_t *)v21, 0x16u);
    uint64_t v26 = v37;
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v26, -1, -1);
    uint64_t v27 = v21;
    a1 = v38;
    MEMORY[0x1C87C2080](v27, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v9, type metadata accessor for Alert);
  }

  uint64_t v28 = v2[10];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v30 = swift_allocObject();
  swift_weakInit();
  sub_1C7D6CA30(a1, (uint64_t)v7, type metadata accessor for Alert);
  unint64_t v31 = (*(unsigned __int8 *)(v40 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = (uint64_t)v7;
  uint64_t v34 = v32;
  *(void *)(v32 + 16) = v30;
  sub_1C7D6CAF8(v33, v32 + v31, type metadata accessor for Alert);
  uint64_t v35 = *(void (**)(uint64_t, void, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v28 + 32);
  swift_retain();
  v35(a1, 0, sub_1C7D6D810, v34, ObjectType, v28);
  swift_release();
  return swift_release();
}

uint64_t sub_1C7D69794(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = sub_1C7D78C20();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  id v15 = (uint64_t *)((char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v16 = *(void **)(v6 + 16);
  *id v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4FBCBF0], v12);
  v16;
  LOBYTE(v16) = sub_1C7D78C30();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    uint64_t v18 = swift_beginAccess();
    if (*(void *)(*(void *)(v6 + 136) + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7D77080(a1, a2);
      if ((v19 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = swift_bridgeObjectRelease();
        if (a5 > 0.0) {
          goto LABEL_6;
        }
        return a3(v18);
      }
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C7D78A20();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_1C7D77354(a1, a2);
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v18 = swift_release();
    }
    if (a5 > 0.0)
    {
LABEL_6:
      sub_1C7D78A70();
      uint64_t v20 = sub_1C7D78A60();
      MEMORY[0x1F4188790](v20);
      *(&v23 - 4) = v6;
      *(&v23 - 3) = a1;
      *(&v23 - 2) = a2;
      uint64_t v21 = (void *)swift_allocObject();
      v21[2] = v6;
      v21[3] = a1;
      v21[4] = a2;
      v21[5] = a3;
      v21[6] = a4;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1C7D78A30();
      swift_release();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v24 = *(void *)(v6 + 136);
      *(void *)(v6 + 136) = 0x8000000000000000;
      sub_1C7D780BC(v20, a1, a2, isUniquelyReferenced_nonNull_native);
      *(void *)(v6 + 136) = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      return swift_release();
    }
    return a3(v18);
  }
  __break(1u);
  return result;
}

void sub_1C7D69B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for Alert(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    if (qword_1EBC68F80 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1C7D78BD0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EBC68F68);
    sub_1C7D6CA30(a3, (uint64_t)v6, type metadata accessor for Alert);
    swift_retain_n();
    uint64_t v10 = sub_1C7D78BC0();
    os_log_type_t v11 = sub_1C7D78C90();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v20 = v13;
      *(_DWORD *)uint64_t v12 = 136380931;
      __swift_project_boxed_opaque_existential_1((void *)(v8 + 32), *(void *)(v8 + 56));
      uint64_t v14 = sub_1C7D78AF0();
      uint64_t v19 = sub_1C7D6B1E0(v14, v15, &v20);
      sub_1C7D78CF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      uint64_t v16 = Alert.description.getter();
      uint64_t v19 = sub_1C7D6B1E0(v16, v17, &v20);
      sub_1C7D78CF0();
      swift_bridgeObjectRelease();
      sub_1C7D6CA98((uint64_t)v6, type metadata accessor for Alert);
      _os_log_impl(&dword_1C7D5B000, v10, v11, "(%{private}s): Presented non-interrupting alert on local device: %{public}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87C2080](v13, -1, -1);
      MEMORY[0x1C87C2080](v12, -1, -1);
      swift_release();
    }
    else
    {
      swift_release_n();
      sub_1C7D6CA98((uint64_t)v6, type metadata accessor for Alert);
    }
  }
}

uint64_t sub_1C7D69DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = a4;
  uint64_t v7 = type metadata accessor for Alert(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = *(void *)(a2 + 80);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  sub_1C7D6CA30(a3, (uint64_t)&ObjectType - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for Alert);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = a1;
  sub_1C7D6CAF8((uint64_t)&ObjectType - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, type metadata accessor for Alert);
  *(void *)(v13 + ((v9 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v17;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(char *), uint64_t, uint64_t, uint64_t))(v10 + 32);
  swift_retain();
  swift_retain();
  swift_retain();
  v14(a3, 1, sub_1C7D6CF04, v13, ObjectType, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_1C7D69FB4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a3;
  uint64_t v29 = a5;
  uint64_t v7 = sub_1C7D78BE0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v31 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1C7D78C10();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Alert(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12 - 8);
  unint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v16 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v18 = result;
    uint64_t v27 = *(void *)(result + 16);
    sub_1C7D6CA30(a4, (uint64_t)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for Alert);
    unint64_t v19 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v20 = v19 + v14;
    uint64_t v25 = v7;
    uint64_t v26 = v8;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v28;
    *(void *)(v21 + 24) = v18;
    sub_1C7D6CAF8((uint64_t)v15, v21 + v19, type metadata accessor for Alert);
    *(unsigned char *)(v21 + v20) = v16;
    *(void *)((v20 & 0xFFFFFFFFFFFFFFF8) + v21 + 8) = v29;
    aBlock[4] = sub_1C7D6D104;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C7D6AA5C;
    aBlock[3] = &block_descriptor_69;
    uint64_t v22 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1C7D78BF0();
    uint64_t v33 = MEMORY[0x1E4FBC860];
    sub_1C7D6D9D4(&qword_1EA502AB0, 255, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AB8);
    sub_1C7D6D920(&qword_1EA502AC0, &qword_1EA502AB8);
    uint64_t v23 = v31;
    uint64_t v24 = v25;
    sub_1C7D78D10();
    MEMORY[0x1C87C1A20](0, v11, v23, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v32);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C7D6A39C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if ((sub_1C7D78A50() & 1) == 0)
  {
    sub_1C7D78A20();
    unsigned __int8 v7 = a4;
    sub_1C7D6A40C(a3, &v7);
  }
  return sub_1C7D78A80();
}

uint64_t sub_1C7D6A40C(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v53 = type metadata accessor for Alert.HistoryItem(0);
  uint64_t v5 = *(unsigned char **)(v53 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v53);
  unint64_t v54 = &v48[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = &v48[-v9];
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = &v48[-v11];
  uint64_t v57 = type metadata accessor for Alert(0);
  uint64_t v13 = MEMORY[0x1F4188790](v57);
  unint64_t v56 = &v48[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v13);
  uint64_t v55 = &v48[-v15];
  uint64_t v16 = sub_1C7D78C20();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  unint64_t v19 = &v48[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v20 = *a2;
  uint64_t v21 = (void *)*((void *)v2 + 2);
  *unint64_t v19 = v21;
  (*(void (**)(void *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E4FBCBF0], v16);
  id v22 = v21;
  unint64_t v23 = sub_1C7D78C30();
  (*(void (**)(void *, uint64_t))(v17 + 8))(v19, v16);
  if ((v23 & 1) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v24 = *(void *)(a1 + *(int *)(v57 + 36));
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    unint64_t v23 = sub_1C7D6AF78(0, *(void *)(v23 + 16) + 1, 1, v23);
    goto LABEL_6;
  }
  int v26 = v20 & 1 | 0x40;
  if (v20 == 2) {
    int v26 = 128;
  }
  int v49 = v26;
  unint64_t v51 = (v5[80] + 32) & ~(unint64_t)v5[80];
  uint64_t v52 = v2;
  uint64_t v50 = *((void *)v5 + 9);
  sub_1C7D6CA30(v24 + v51 + v50 * (v25 - 1), (uint64_t)v10, type metadata accessor for Alert.HistoryItem);
  char v27 = *v10;
  uint64_t v29 = *((void *)v10 + 1);
  uint64_t v28 = *((void *)v10 + 2);
  uint64_t v30 = a1;
  uint64_t v32 = *((void *)v10 + 3);
  uint64_t v31 = *((void *)v10 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C7D789E0();
  *uint64_t v12 = v27;
  *((void *)v12 + 1) = v29;
  *((void *)v12 + 2) = v28;
  *((void *)v12 + 3) = v32;
  *((void *)v12 + 4) = v31;
  v12[40] = v49;
  sub_1C7D6CA98((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
  uint64_t v5 = v55;
  sub_1C7D6CA30(v30, (uint64_t)v55, type metadata accessor for Alert);
  uint64_t v2 = v54;
  sub_1C7D6CA30((uint64_t)v12, (uint64_t)v54, type metadata accessor for Alert.HistoryItem);
  a1 = *(int *)(v57 + 36);
  unint64_t v23 = *(void *)&v5[a1];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_16;
  }
LABEL_6:
  unint64_t v34 = *(void *)(v23 + 16);
  unint64_t v33 = *(void *)(v23 + 24);
  uint64_t v35 = v52;
  if (v34 >= v33 >> 1) {
    unint64_t v23 = sub_1C7D6AF78(v33 > 1, v34 + 1, 1, v23);
  }
  *(void *)(v23 + 16) = v34 + 1;
  sub_1C7D6CAF8((uint64_t)v2, v23 + v51 + v34 * v50, type metadata accessor for Alert.HistoryItem);
  *(void *)&v5[a1] = v23;
  sub_1C7D6CA98((uint64_t)v12, type metadata accessor for Alert.HistoryItem);
  sub_1C7D67F64(v5);
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_1C7D78BD0();
  __swift_project_value_buffer(v36, (uint64_t)qword_1EBC68F68);
  uint64_t v37 = v56;
  sub_1C7D6CA30((uint64_t)v5, (uint64_t)v56, type metadata accessor for Alert);
  swift_retain_n();
  uint64_t v38 = sub_1C7D78BC0();
  os_log_type_t v39 = sub_1C7D78C90();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v59 = v41;
    *(_DWORD *)uint64_t v40 = 136380931;
    __swift_project_boxed_opaque_existential_1((void *)v35 + 4, *((void *)v35 + 7));
    uint64_t v42 = sub_1C7D78AF0();
    uint64_t v58 = sub_1C7D6B1E0(v42, v43, &v59);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2082;
    uint64_t v44 = v56;
    uint64_t v45 = Alert.description.getter();
    uint64_t v58 = sub_1C7D6B1E0(v45, v46, &v59);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease();
    sub_1C7D6CA98((uint64_t)v44, type metadata accessor for Alert);
    _os_log_impl(&dword_1C7D5B000, v38, v39, "(%{private}s): Received presentation response for alert: %{public}s", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v41, -1, -1);
    MEMORY[0x1C87C2080](v40, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C7D6CA98((uint64_t)v37, type metadata accessor for Alert);
  }

  sub_1C7D5FA94(v5);
  return sub_1C7D6CA98((uint64_t)v5, type metadata accessor for Alert);
}

uint64_t sub_1C7D6AA5C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1C7D6AAA0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1C7D78BD0();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBC68F68);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_1C7D78BC0();
  os_log_type_t v9 = sub_1C7D78C90();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v14 = v11;
    *(_DWORD *)uint64_t v10 = 136380931;
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 32), *(void *)(a2 + 56));
    uint64_t v12 = sub_1C7D78AF0();
    sub_1C7D6B1E0(v12, v13, &v14);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_1C7D6B1E0(a3, a4, &v14);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7D5B000, v8, v9, "(%{private}s): Configured watchdog for: %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v11, -1, -1);
    MEMORY[0x1C87C2080](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
}

uint64_t sub_1C7D6ACD0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t))
{
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C7D78BD0();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBC68F68);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_1C7D78BC0();
  os_log_type_t v11 = sub_1C7D78C90();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v18[0] = v17;
    *(_DWORD *)uint64_t v12 = 136380931;
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 32), *(void *)(a2 + 56));
    uint64_t v13 = sub_1C7D78AF0();
    sub_1C7D6B1E0(v13, v14, v18);
    sub_1C7D78CF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_1C7D6B1E0(a3, a4, v18);
    sub_1C7D78CF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7D5B000, v10, v11, "(%{private}s): Watchdog fired for: %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87C2080](v17, -1, -1);
    MEMORY[0x1C87C2080](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C7D77354(a3, a4);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v15 = swift_release();
  return a5(v15);
}

uint64_t sub_1C7D6AF78(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502A68);
  uint64_t v10 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1C7D78D80();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C7D6C4E8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1C7D6B1E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C7D6B2B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C7D6D884((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C7D6D884((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C7D6B2B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C7D78D00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C7D6B470(a5, a6);
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
  uint64_t v8 = sub_1C7D78D70();
  if (!v8)
  {
    sub_1C7D78D80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C7D78DD0();
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

uint64_t sub_1C7D6B470(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C7D6B508(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C7D6B6E8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C7D6B6E8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C7D6B508(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C7D6B680(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C7D78D40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C7D78D80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C7D78C70();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C7D78DD0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C7D78D80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C7D6B680(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C7D6B6E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AC8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1C7D78DD0();
  __break(1u);
  return result;
}

uint64_t sub_1C7D6B838(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7D6B858(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1C7D6B858(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AA0);
  uint64_t v10 = *(void *)(sub_1C7D78BA0() - 8);
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
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1C7D78BA0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
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
  uint64_t result = sub_1C7D78DD0();
  __break(1u);
  return result;
}

uint64_t sub_1C7D6BA98(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

unint64_t sub_1C7D6BB20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68FA8);
    uint64_t v3 = (void *)sub_1C7D78DC0();
    for (i = (void *)(a1 + 40); ; i += 2)
    {
      unsigned __int8 v5 = *((unsigned char *)i - 8);
      uint64_t v6 = *i;
      unint64_t result = sub_1C7D76FF8(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(void *)(v3[7] + 8 * result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

void *sub_1C7D6BBF8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v31 = a3;
  uint64_t v32 = a2;
  uint64_t v30 = a1;
  uint64_t v29 = sub_1C7D78CB0();
  uint64_t v7 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C7D78CA0();
  MEMORY[0x1F4188790]();
  sub_1C7D78C10();
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[17] = MEMORY[0x1E4FBC868];
  v6[19] = 0;
  swift_unknownObjectWeakInit();
  v28[2] = sub_1C7D6D8E0();
  sub_1C7D78C00();
  uint64_t v35 = MEMORY[0x1E4FBC860];
  v28[5] = sub_1C7D6D9D4(&qword_1EBC68F98, 255, MEMORY[0x1E4FBCC10]);
  v28[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68F88);
  v28[6] = sub_1C7D6D920(&qword_1EBC68F90, &qword_1EBC68F88);
  sub_1C7D78D10();
  uint64_t v12 = *MEMORY[0x1E4FBCC68];
  uint64_t v13 = v7 + 104;
  size_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  uint64_t v28[3] = v13;
  uint64_t v15 = v29;
  v14(v9, v12, v29);
  v28[1] = v11;
  v6[2] = sub_1C7D78CE0();
  sub_1C7D78C00();
  uint64_t v35 = MEMORY[0x1E4FBC860];
  uint64_t v17 = v30;
  uint64_t v16 = v31;
  sub_1C7D78D10();
  v14(v9, v12, v15);
  unint64_t v18 = v32;
  v6[3] = sub_1C7D78CE0();
  sub_1C7D6D970((uint64_t)v18, (uint64_t)(v6 + 4));
  uint64_t v19 = v33;
  v6[9] = v16;
  v6[10] = v19;
  sub_1C7D6D970(v17, (uint64_t)(v6 + 12));
  if (v34)
  {
    v6[11] = v34;
    swift_unknownObjectRetain();
  }
  else
  {
    uint64_t v20 = qword_1EBC68E20;
    swift_unknownObjectRetain();
    if (v20 != -1) {
      swift_once();
    }
    v6[11] = off_1EBC68E10;
    swift_bridgeObjectRetain();
  }
  __swift_project_boxed_opaque_existential_1(v18, v18[3]);
  sub_1C7D6D9D4(&qword_1EBC68E28, v21, (void (*)(uint64_t))type metadata accessor for AlertCenter);
  uint64_t v22 = qword_1EBC68D60;
  swift_retain();
  if (v22 != -1) {
    swift_once();
  }
  sub_1C7D78B00();
  swift_release();
  uint64_t v23 = v6[10];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v25 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v23 + 16);
  uint64_t v26 = swift_retain();
  v25(v26, &protocol witness table for AlertCenter, ObjectType, v23);
  __swift_destroy_boxed_opaque_existential_1(v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v6;
}

uint64_t sub_1C7D6C0A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C7D6C0C8()
{
  return sub_1C7D5F288(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C7D6C0E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7D6C144(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7D6C19C()
{
  return sub_1C7D6C9C4((uint64_t (*)(unint64_t))sub_1C7D5FA94);
}

uint64_t sub_1C7D6C1B4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7D6C1C4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C7D6C204()
{
  return sub_1C7D61854(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C7D6C210()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C7D6C220(uint64_t *a1@<X8>)
{
  sub_1C7D625BC(*(void *)(v1 + 16), *(uint8_t **)(v1 + 24), a1);
}

uint64_t sub_1C7D6C23C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C7D62E1C(*(void *)(v1 + 24), a1);
}

uint64_t sub_1C7D6C258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1C7D6C2FC(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for Alert(0) - 8);
  uint64_t v4 = sub_1C7D640D4((uint64_t *)(v1
                               + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))));
  return a1(v4);
}

uint64_t sub_1C7D6C37C()
{
  uint64_t v1 = sub_1C7D78BA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C7D6C448(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_1C7D78BA0() - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_1C7D64AFC(a1, a2, v6, v7);
}

uint64_t sub_1C7D6C4CC@<X0>(void *a1@<X8>)
{
  return sub_1C7D6555C(*(void *)(v1 + 16), a1);
}

uint64_t sub_1C7D6C4E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1C7D78DD0();
  __break(1u);
  return result;
}

uint64_t _s12SessionAlert0B6CenterC12purgeRecords3for22pairedDeviceIdentifiery0A10SyncEngine0jK13Synchronizing_p_SStF_0()
{
  sub_1C7D78AC0();
  swift_retain();
  sub_1C7D78AB0();
  sub_1C7D78AA0();
  return swift_release();
}

uint64_t sub_1C7D6C6DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = swift_unknownObjectRetain();
  return sub_1C7D5ED7C(v2, v1);
}

uint64_t dispatch thunk of AlertPresenterDelegate.dismissAlert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of AlertPresenting.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AlertPresenting.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AlertPresenting.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AlertPresenting.present(alert:interrupting:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of AlertPresenting.dismiss(alert:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t type metadata accessor for AlertCenter()
{
  return self;
}

uint64_t method lookup function for AlertCenter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AlertCenter);
}

uint64_t dispatch thunk of AlertCenter.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AlertCenter.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AlertCenter.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AlertCenter.__allocating_init(store:syncEngine:presenter:watchdogIntervals:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1C7D6C84C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MEMORY[0x1C87C20F0](v1 + 144);
  uint64_t v4 = *(void *)(v1 + 152);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C7D6C884(uint64_t (*a1)(uint64_t a1), unint64_t a2)
{
  return sub_1C7D65B38(a1, a2, v2);
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

uint64_t sub_1C7D6C8E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7D6C94C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C7D6C9AC()
{
  return sub_1C7D6C9C4((uint64_t (*)(unint64_t))sub_1C7D61C8C);
}

uint64_t sub_1C7D6C9C4(uint64_t (*a1)(unint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for Alert(0) - 8);
  return a1(v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_1C7D6CA30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7D6CA98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C7D6CAF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7D6CB60(uint64_t a1)
{
  return sub_1C7D69DE4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C7D6CB6C()
{
  uint64_t v1 = (int *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v6 + v1[10]), *(void *)(v6 + v1[10] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1C7D6CCC4()
{
  uint64_t v1 = *(void *)(type metadata accessor for Alert(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unsigned __int8 v4 = 0;
  sub_1C7D6A40C(v0 + v2, &v4);
  return sub_1C7D78A80();
}

uint64_t sub_1C7D6CD6C()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C7D6CDA4()
{
  uint64_t v1 = (int *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v6 + v1[10]), *(void *)(v6 + v1[10] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1C7D6CF04(char *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for Alert(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C7D69FB4(a1, v5, v6, v1 + v4, v7);
}

uint64_t sub_1C7D6CFA4()
{
  uint64_t v1 = (int *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((v3 + *(void *)(*(void *)v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v6 + v1[10]), *(void *)(v6 + v1[10] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1C7D6D104()
{
  uint64_t v1 = *(void *)(type metadata accessor for Alert(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  unsigned __int8 v5 = *(unsigned char *)(v0 + v2 + *(void *)(v1 + 64));
  return sub_1C7D6A39C(v3, v4, v0 + v2, v5);
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

uint64_t sub_1C7D6D1E0()
{
  uint64_t v1 = (int *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  unint64_t v5 = (v2 + 16 + ((((v3 + v4) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v2;
  uint64_t v12 = v5 + v4;
  uint64_t v13 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v6 + v1[10]), *(void *)(v6 + v1[10] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = v0 + v5;
  swift_bridgeObjectRelease();
  v9(v10 + v1[7], v8);
  v9(v10 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v10 + v1[10]), *(void *)(v10 + v1[10] + 8));
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v12, v13);
}

uint64_t sub_1C7D6D3AC()
{
  uint64_t v1 = *(void *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  unint64_t v5 = ((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  char v6 = *(unsigned char *)(v0 + v4);
  uint64_t v7 = *(void **)((v4 & 0xFFFFFFFFFFFFFFF8) + v0 + 8);
  unint64_t v8 = *(void *)(v0 + v5);
  uint64_t v9 = *(void *)(v0 + v5 + 8);
  return sub_1C7D67490(v0 + v3, v6, v7, v8, v9, (void *)(v0 + ((v2 + 16 + v5) & ~v2)));
}

void sub_1C7D6D458(uint64_t a1)
{
  sub_1C7D6AAA0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1C7D6D464()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C7D6D4AC(uint64_t a1)
{
  return sub_1C7D6ACD0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(uint64_t (**)(uint64_t))(v1 + 40));
}

uint64_t objectdestroy_50Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v6 + v1[10]), *(void *)(v6 + v1[10] + 8));
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1C7D6D60C(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for Alert(0) - 8);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = (void *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, _UNKNOWN **, void, void, uint64_t, uint64_t))(v4 + 8))(v5, &protocol witness table for AlertCenter, *v6, v6[1], ObjectType, v4);
  return a1(v8);
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for Alert(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_1C7D78A00();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  sub_1C7D6C144(*(void *)(v6 + v1[10]), *(void *)(v6 + v1[10] + 8));
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v4, v5);
}

void sub_1C7D6D810(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for Alert(0) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  sub_1C7D69B10(a1, v4, v5);
}

uint64_t sub_1C7D6D884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1C7D6D8E0()
{
  unint64_t result = qword_1EBC68FA0;
  if (!qword_1EBC68FA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBC68FA0);
  }
  return result;
}

uint64_t sub_1C7D6D920(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C7D6D970(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C7D6D9D4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C7D6DA38@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C7D6C23C(a1);
}

uint64_t sub_1C7D6DA50@<X0>(void *a1@<X8>)
{
  return sub_1C7D6C4CC(a1);
}

void sub_1C7D6DA68(uint64_t *a1@<X8>)
{
}

uint64_t sub_1C7D6DA80()
{
  return sub_1C7D6C0C8();
}

uint64_t sub_1C7D6DA98()
{
  uint64_t v0 = sub_1C7D78A10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C7D78BD0();
  __swift_allocate_value_buffer(v4, qword_1EBC68F68);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC68F68);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F18018], v0);
  return sub_1C7D78BB0();
}

uint64_t static Logger.alert.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBC68F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C7D78BD0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBC68F68);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
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

uint64_t Alert.HistoryItem.init(necessity:requestingDeviceID:requestedDeviceID:state:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X8>)
{
  char v12 = *a1;
  char v13 = *a6;
  type metadata accessor for Alert.HistoryItem(0);
  uint64_t result = sub_1C7D789E0();
  *(unsigned char *)a7 = v12;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(unsigned char *)(a7 + 40) = v13;
  return result;
}

uint64_t type metadata accessor for Alert.HistoryItem(uint64_t a1)
{
  return sub_1C7D6DF04(a1, (uint64_t *)&unk_1EA502D00);
}

uint64_t Alert.init(identifier:creationDate:dismissOption:payload:history:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v27 = a5;
  uint64_t v15 = sub_1C7D78A00();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t result = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a7 + 16))
  {
    uint64_t v26 = a6;
    uint64_t v20 = *a4;
    char v21 = *((unsigned char *)a4 + 8);
    *(void *)a8 = a1;
    *((void *)a8 + 1) = a2;
    uint64_t v22 = (int *)type metadata accessor for Alert(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(&a8[v22[5]], a3, v15);
    uint64_t v23 = &a8[v22[7]];
    *(void *)uint64_t v23 = v20;
    v23[8] = v21;
    sub_1C7D78990();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v16 + 32))(&a8[v22[6]], v19, v15);
    uint64_t v24 = &a8[v22[8]];
    uint64_t v25 = v26;
    *(void *)uint64_t v24 = v27;
    *((void *)v24 + 1) = v25;
    *(void *)&a8[v22[9]] = a7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for Alert(uint64_t a1)
{
  return sub_1C7D6DF04(a1, qword_1EBC68D68);
}

uint64_t sub_1C7D6DF04(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Alert.currentState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for Alert(0);
  uint64_t v4 = *(void *)(v1 + *(int *)(result + 36));
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    uint64_t v7 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
    return sub_1C7D73754(v4+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v6, a1, type metadata accessor for Alert.HistoryItem);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7D6DFFC(char a1)
{
  if (a1) {
    return 0x726F7461646E616DLL;
  }
  else {
    return 0x6C616E6F6974706FLL;
  }
}

uint64_t sub_1C7D6E040()
{
  return sub_1C7D6DFFC(*v0);
}

uint64_t sub_1C7D6E048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D7603C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C7D6E070(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1C7D6E07C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6E488();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6E0B8(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6E488();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6E0F4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6E4DC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6E130(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6E4DC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6E16C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6E530();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6E1A8(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6E530();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Alert.Necessity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AE0);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AE8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502AF0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D6E488();
  sub_1C7D78F10();
  char v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_1C7D6E4DC();
    size_t v14 = v18;
    sub_1C7D78E50();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_1C7D6E530();
    sub_1C7D78E50();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_1C7D6E488()
{
  unint64_t result = qword_1EA502AF8;
  if (!qword_1EA502AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502AF8);
  }
  return result;
}

unint64_t sub_1C7D6E4DC()
{
  unint64_t result = qword_1EA502B00;
  if (!qword_1EA502B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B00);
  }
  return result;
}

unint64_t sub_1C7D6E530()
{
  unint64_t result = qword_1EA502B08;
  if (!qword_1EA502B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B08);
  }
  return result;
}

uint64_t Alert.Necessity.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B10);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B18);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B20);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D6E488();
  unint64_t v11 = v32;
  sub_1C7D78F00();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  size_t v14 = v10;
  uint64_t v15 = sub_1C7D78E40();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_1C7D78D60();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029F8);
    void *v22 = &type metadata for Alert.Necessity;
    sub_1C7D78DF0();
    sub_1C7D78D50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x1E4FBBA70], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_1C7D6E4DC();
    uint64_t v18 = v14;
    sub_1C7D78DE0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_1C7D6E530();
    sub_1C7D78DE0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_1C7D6E9E0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return Alert.Necessity.init(from:)(a1, a2);
}

uint64_t sub_1C7D6E9F8(void *a1)
{
  return Alert.Necessity.encode(to:)(a1);
}

uint64_t sub_1C7D6EA10(char a1)
{
  if (a1) {
    return 0x676E696B6E696874;
  }
  else {
    return 0x6974736575716572;
  }
}

uint64_t sub_1C7D6EA4C()
{
  return sub_1C7D6EA10(*v0);
}

uint64_t sub_1C7D6EA54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D76130(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7D6EA7C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6EE88();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6EAB8(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6EE88();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6EAF4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6EF30();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6EB30(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6EF30();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6EB6C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6EEDC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6EBA8(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6EEDC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Alert.CoordinationState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B28);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B30);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B38);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D6EE88();
  sub_1C7D78F10();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_1C7D6EEDC();
    size_t v14 = v18;
    sub_1C7D78E50();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_1C7D6EF30();
    sub_1C7D78E50();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_1C7D6EE88()
{
  unint64_t result = qword_1EA502B40;
  if (!qword_1EA502B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B40);
  }
  return result;
}

unint64_t sub_1C7D6EEDC()
{
  unint64_t result = qword_1EA502B48;
  if (!qword_1EA502B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B48);
  }
  return result;
}

unint64_t sub_1C7D6EF30()
{
  unint64_t result = qword_1EA502B50;
  if (!qword_1EA502B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B50);
  }
  return result;
}

uint64_t Alert.CoordinationState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B58);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B60);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B68);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D6EE88();
  unint64_t v11 = v32;
  sub_1C7D78F00();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  size_t v14 = v10;
  uint64_t v15 = sub_1C7D78E40();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_1C7D78D60();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029F8);
    void *v22 = &type metadata for Alert.CoordinationState;
    sub_1C7D78DF0();
    sub_1C7D78D50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x1E4FBBA70], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_1C7D6EEDC();
    uint64_t v18 = v14;
    sub_1C7D78DE0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_1C7D6EF30();
    sub_1C7D78DE0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_1C7D6F3E0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return Alert.CoordinationState.init(from:)(a1, a2);
}

uint64_t sub_1C7D6F3F8(void *a1)
{
  return Alert.CoordinationState.encode(to:)(a1);
}

uint64_t Alert.FailureReason.hash(into:)()
{
  return sub_1C7D78ED0();
}

BOOL static Alert.FailureReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C7D6F454(char a1)
{
  if (a1) {
    return 0x64656E696C636564;
  }
  else {
    return 0x74754F64656D6974;
  }
}

BOOL sub_1C7D6F484(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C7D6F49C()
{
  return sub_1C7D6F454(*v0);
}

uint64_t sub_1C7D6F4A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D76224(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7D6F4CC(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6F8D8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6F508(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6F8D8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6F544(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6F92C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6F580(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6F92C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6F5BC(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6F980();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6F5F8(uint64_t a1)
{
  unint64_t v2 = sub_1C7D6F980();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Alert.FailureReason.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B70);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B78);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502B80);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D6F8D8();
  sub_1C7D78F10();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_1C7D6F92C();
    size_t v14 = v18;
    sub_1C7D78E50();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_1C7D6F980();
    sub_1C7D78E50();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_1C7D6F8D8()
{
  unint64_t result = qword_1EA502B88;
  if (!qword_1EA502B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B88);
  }
  return result;
}

unint64_t sub_1C7D6F92C()
{
  unint64_t result = qword_1EA502B90;
  if (!qword_1EA502B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B90);
  }
  return result;
}

unint64_t sub_1C7D6F980()
{
  unint64_t result = qword_1EA502B98;
  if (!qword_1EA502B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502B98);
  }
  return result;
}

uint64_t Alert.FailureReason.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BA0);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BA8);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BB0);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D6F8D8();
  unint64_t v11 = v32;
  sub_1C7D78F00();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  size_t v14 = v10;
  uint64_t v15 = sub_1C7D78E40();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_1C7D78D60();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029F8);
    void *v22 = &type metadata for Alert.FailureReason;
    sub_1C7D78DF0();
    sub_1C7D78D50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x1E4FBBA70], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_1C7D6F92C();
    uint64_t v18 = v14;
    sub_1C7D78DE0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_1C7D6F980();
    sub_1C7D78DE0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_1C7D6FE30@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return Alert.FailureReason.init(from:)(a1, a2);
}

uint64_t sub_1C7D6FE48(void *a1)
{
  return Alert.FailureReason.encode(to:)(a1);
}

uint64_t Alert.AlertState.hash(into:)()
{
  if (((unint64_t)*v0 >> 6) <= 1) {
    sub_1C7D78ED0();
  }
  return sub_1C7D78ED0();
}

uint64_t sub_1C7D6FEB8(char a1)
{
  return *(void *)&aCoordinafailed[8 * a1];
}

uint64_t sub_1C7D6FED8()
{
  return sub_1C7D6FEB8(*v0);
}

uint64_t sub_1C7D6FEE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D76310(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7D6FF08(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72D9C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6FF44(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72D9C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D6FF88(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72EEC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D6FFC4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72EEC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D70000(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72DF0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D7003C(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72DF0();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7D70078(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72E44();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D700B4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D72E44();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Alert.AlertState.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BB8);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  char v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BC0);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BC8);
  uint64_t v21 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502BD0);
  uint64_t v10 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  char v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v13 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D72D9C();
  sub_1C7D78F10();
  if (v13 >> 6)
  {
    if (v13 >> 6 == 1)
    {
      char v14 = v13 & 1;
      char v31 = 1;
      sub_1C7D72E44();
      uint64_t v15 = v27;
      sub_1C7D78E50();
      char v30 = v14;
      sub_1C7D72E98();
      uint64_t v16 = v25;
      sub_1C7D78E80();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v15);
    }
    else
    {
      char v32 = 2;
      sub_1C7D72DF0();
      uint64_t v19 = v22;
      uint64_t v20 = v27;
      sub_1C7D78E50();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v20);
    }
  }
  else
  {
    char v29 = 0;
    sub_1C7D72EEC();
    uint64_t v18 = v27;
    sub_1C7D78E50();
    char v28 = v13 & 1;
    sub_1C7D72F40();
    sub_1C7D78E80();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v18);
  }
}

uint64_t Alert.AlertState.hashValue.getter()
{
  unint64_t v1 = *v0;
  sub_1C7D78EC0();
  if ((v1 >> 6) <= 1) {
    sub_1C7D78ED0();
  }
  sub_1C7D78ED0();
  return sub_1C7D78EF0();
}

uint64_t Alert.AlertState.init(from:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C08);
  uint64_t v39 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v38 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C10);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  uint64_t v36 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C18);
  uint64_t v34 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C20);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  char v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  uint64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_1C7D72D9C();
  uint64_t v16 = v41;
  sub_1C7D78F00();
  if (v16) {
    goto LABEL_9;
  }
  uint64_t v32 = v8;
  char v17 = v38;
  uint64_t v18 = v39;
  uint64_t v41 = v12;
  uint64_t v19 = sub_1C7D78E40();
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v22 = sub_1C7D78D60();
    swift_allocError();
    uint64_t v23 = v14;
    uint64_t v24 = v11;
    uint64_t v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5029F8);
    *uint64_t v26 = &type metadata for Alert.AlertState;
    sub_1C7D78DF0();
    sub_1C7D78D50();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v26, *MEMORY[0x1E4FBBA70], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v24);
LABEL_9:
    uint64_t v30 = (uint64_t)v40;
    return __swift_destroy_boxed_opaque_existential_1(v30);
  }
  if (*(unsigned char *)(v19 + 32))
  {
    if (*(unsigned char *)(v19 + 32) == 1)
    {
      char v45 = 1;
      sub_1C7D72E44();
      sub_1C7D78DE0();
      sub_1C7D72F94();
      uint64_t v20 = v35;
      sub_1C7D78E30();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v20);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      char v21 = v44 | 0x40;
    }
    else
    {
      char v46 = 2;
      sub_1C7D72DF0();
      sub_1C7D78DE0();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      char v21 = 0x80;
    }
    uint64_t v30 = (uint64_t)v40;
    *uint64_t v37 = v21;
  }
  else
  {
    char v43 = 0;
    sub_1C7D72EEC();
    uint64_t v27 = v10;
    sub_1C7D78DE0();
    char v28 = v37;
    sub_1C7D72FE8();
    uint64_t v29 = v32;
    sub_1C7D78E30();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
    uint64_t v30 = (uint64_t)v40;
    *char v28 = v42;
  }
  return __swift_destroy_boxed_opaque_existential_1(v30);
}

uint64_t sub_1C7D70B6C@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return Alert.AlertState.init(from:)(a1, a2);
}

uint64_t sub_1C7D70B84(void *a1)
{
  return Alert.AlertState.encode(to:)(a1);
}

uint64_t sub_1C7D70B9C()
{
  unint64_t v1 = *v0;
  sub_1C7D78EC0();
  if ((v1 >> 6) <= 1) {
    sub_1C7D78ED0();
  }
  sub_1C7D78ED0();
  return sub_1C7D78EF0();
}

uint64_t sub_1C7D70C0C()
{
  if (((unint64_t)*v0 >> 6) <= 1) {
    sub_1C7D78ED0();
  }
  return sub_1C7D78ED0();
}

uint64_t sub_1C7D70C60()
{
  unint64_t v1 = *v0;
  sub_1C7D78EC0();
  if ((v1 >> 6) <= 1) {
    sub_1C7D78ED0();
  }
  sub_1C7D78ED0();
  return sub_1C7D78EF0();
}

void Alert.HistoryItem.necessity.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Alert.HistoryItem.requestingDeviceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Alert.HistoryItem.requestedDeviceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void Alert.HistoryItem.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

uint64_t Alert.HistoryItem.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Alert.HistoryItem(0) + 32);
  uint64_t v4 = sub_1C7D78A00();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

unint64_t sub_1C7D70DC4(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x6574617473;
      break;
    case 4:
      unint64_t result = 1702125924;
      break;
    default:
      unint64_t result = 0x746973736563656ELL;
      break;
  }
  return result;
}

unint64_t sub_1C7D70E78()
{
  return sub_1C7D70DC4(*v0);
}

uint64_t sub_1C7D70E80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D76468(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C7D70EA8(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1C7D70EB4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D7312C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D70EF0(uint64_t a1)
{
  unint64_t v2 = sub_1C7D7312C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Alert.HistoryItem.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C38);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D7312C();
  sub_1C7D78F10();
  v10[15] = *v3;
  v10[14] = 0;
  sub_1C7D73180();
  sub_1C7D78E80();
  if (!v2)
  {
    v10[13] = 1;
    sub_1C7D78E60();
    v10[12] = 2;
    sub_1C7D78E60();
    v10[11] = v3[40];
    v10[10] = 3;
    sub_1C7D731D4();
    sub_1C7D78E80();
    type metadata accessor for Alert.HistoryItem(0);
    v10[9] = 4;
    sub_1C7D78A00();
    sub_1C7D732D0(&qword_1EA502C58, MEMORY[0x1E4F27928]);
    sub_1C7D78E80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Alert.HistoryItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = sub_1C7D78A00();
  uint64_t v22 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C60);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Alert.HistoryItem(0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1C7D7312C();
  sub_1C7D78F00();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  char v21 = v6;
  uint64_t v13 = (uint64_t)v11;
  uint64_t v15 = v23;
  uint64_t v14 = v24;
  char v32 = 0;
  sub_1C7D73228();
  sub_1C7D78E30();
  *(unsigned char *)uint64_t v13 = v33;
  char v31 = 1;
  *(void *)(v13 + 8) = sub_1C7D78E10();
  *(void *)(v13 + 16) = v16;
  char v30 = 2;
  *(void *)(v13 + 24) = sub_1C7D78E10();
  *(void *)(v13 + 32) = v17;
  char v28 = 3;
  sub_1C7D7327C();
  v20[1] = 0;
  sub_1C7D78E30();
  *(unsigned char *)(v13 + 40) = v29;
  char v27 = 4;
  sub_1C7D732D0(&qword_1EA502C78, MEMORY[0x1E4F27928]);
  uint64_t v18 = v25;
  sub_1C7D78E30();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v18);
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v13 + *(int *)(v9 + 32), v21, v4);
  sub_1C7D73754(v13, v14, type metadata accessor for Alert.HistoryItem);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return sub_1C7D737BC(v13, type metadata accessor for Alert.HistoryItem);
}

uint64_t sub_1C7D715C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Alert.HistoryItem.init(from:)(a1, a2);
}

uint64_t sub_1C7D715DC(void *a1)
{
  return Alert.HistoryItem.encode(to:)(a1);
}

uint64_t Alert.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Alert.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Alert(0) + 20);
  uint64_t v4 = sub_1C7D78A00();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t Alert.dismissDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Alert(0) + 24);
  uint64_t v4 = sub_1C7D78A00();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t Alert.dismissOption.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for Alert(0);
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 28));
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t Alert.payload.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for Alert(0) + 32);
  uint64_t v2 = *(void *)v1;
  sub_1C7D6C0E8(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t Alert.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for Alert(0) + 32);
  uint64_t result = sub_1C7D6C144(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t (*Alert.payload.modify())()
{
  return nullsub_1;
}

uint64_t Alert.history.getter()
{
  type metadata accessor for Alert(0);
  return swift_bridgeObjectRetain();
}

uint64_t Alert.history.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for Alert(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Alert.history.modify())()
{
  return nullsub_1;
}

uint64_t Alert.description.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_1C7D78D30();
  sub_1C7D78C60();
  swift_bridgeObjectRetain();
  sub_1C7D78C60();
  swift_bridgeObjectRelease();
  sub_1C7D78C60();
  uint64_t v4 = type metadata accessor for Alert(0);
  sub_1C7D78A00();
  sub_1C7D732D0(&qword_1EA502C80, MEMORY[0x1E4F27928]);
  sub_1C7D78E90();
  sub_1C7D78C60();
  swift_bridgeObjectRelease();
  sub_1C7D78C60();
  sub_1C7D78E90();
  sub_1C7D78C60();
  swift_bridgeObjectRelease();
  sub_1C7D78C60();
  uint64_t v5 = (uint64_t *)(v0 + *(int *)(v4 + 28));
  uint64_t v6 = *v5;
  LOBYTE(v5) = *((unsigned char *)v5 + 8);
  uint64_t v10 = v6;
  char v11 = (char)v5;
  sub_1C7D78C40();
  sub_1C7D78C60();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C7D78C60();
  uint64_t v8 = *(void *)(v0 + *(int *)(v4 + 36));
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    sub_1C7D73754(v8+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * (v9 - 1), (uint64_t)v3, type metadata accessor for Alert.HistoryItem);
    sub_1C7D78C40();
    sub_1C7D78C60();
    swift_bridgeObjectRelease();
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7D71BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Alert.HistoryItem(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (unsigned __int8 *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (unsigned __int8 *)&v23 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (v11 && a1 != a2)
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      while (1)
      {
        sub_1C7D73754(a1 + v12, (uint64_t)v10, type metadata accessor for Alert.HistoryItem);
        sub_1C7D73754(a2 + v12, (uint64_t)v7, type metadata accessor for Alert.HistoryItem);
        if (*v10 != *v7
          || (*((void *)v10 + 1) == *((void *)v7 + 1)
            ? (BOOL v15 = *((void *)v10 + 2) == *((void *)v7 + 2))
            : (BOOL v15 = 0),
              !v15 && (sub_1C7D78EA0() & 1) == 0
           || (*((void *)v10 + 3) == *((void *)v7 + 3)
             ? (BOOL v16 = *((void *)v10 + 4) == *((void *)v7 + 4))
             : (BOOL v16 = 0),
               !v16 && (sub_1C7D78EA0() & 1) == 0)))
        {
LABEL_31:
          sub_1C7D737BC((uint64_t)v7, type metadata accessor for Alert.HistoryItem);
          sub_1C7D737BC((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
          goto LABEL_32;
        }
        unsigned int v17 = v10[40];
        unsigned int v18 = v7[40];
        if (!(v17 >> 6)) {
          break;
        }
        if (v17 >> 6 == 1)
        {
          if ((v18 & 0xC0) != 0x40) {
            goto LABEL_31;
          }
          goto LABEL_21;
        }
        if (v18 != 128) {
          goto LABEL_31;
        }
LABEL_24:
        char v19 = sub_1C7D789D0();
        sub_1C7D737BC((uint64_t)v7, type metadata accessor for Alert.HistoryItem);
        sub_1C7D737BC((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
        BOOL v21 = v14-- != 0;
        if (v19)
        {
          v12 += v13;
          if (v21) {
            continue;
          }
        }
        return v19 & 1;
      }
      if (v18 > 0x3F) {
        goto LABEL_31;
      }
LABEL_21:
      if ((v18 ^ v17)) {
        goto LABEL_31;
      }
      goto LABEL_24;
    }
    char v19 = 1;
  }
  else
  {
LABEL_32:
    char v19 = 0;
  }
  return v19 & 1;
}

uint64_t sub_1C7D71E34(char a1)
{
  return *(void *)&aIdentificreati[8 * a1];
}

uint64_t sub_1C7D71E5C()
{
  return sub_1C7D71E34(*v0);
}

uint64_t sub_1C7D71E64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D7665C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C7D71E8C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1C7D71E98(uint64_t a1)
{
  unint64_t v2 = sub_1C7D73658();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7D71ED4(uint64_t a1)
{
  unint64_t v2 = sub_1C7D73658();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Alert.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v32 = sub_1C7D78A00();
  uint64_t v30 = *(void *)(v32 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v32);
  char v29 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v26 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502C88);
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Alert(0);
  MEMORY[0x1F4188790](v10);
  unint64_t v12 = (uint64_t *)((char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D73658();
  uint64_t v13 = (uint64_t)v33;
  sub_1C7D78F00();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v33 = a1;
  uint64_t v14 = v32;
  LOBYTE(v34) = 0;
  BOOL v16 = v9;
  *unint64_t v12 = sub_1C7D78E10();
  v12[1] = v17;
  LOBYTE(v34) = 1;
  sub_1C7D732D0(&qword_1EA502C78, MEMORY[0x1E4F27928]);
  sub_1C7D78E30();
  unsigned int v18 = (char *)v12 + *(int *)(v10 + 20);
  char v27 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  v27(v18, v6, v14);
  LOBYTE(v34) = 2;
  char v19 = v29;
  sub_1C7D78E30();
  uint64_t v26 = v10;
  v27((char *)v12 + *(int *)(v10 + 24), v19, v14);
  char v35 = 3;
  sub_1C7D736AC();
  char v29 = 0;
  sub_1C7D78E00();
  if (BYTE9(v34))
  {
    char v20 = 0;
    uint64_t v21 = 0x4018000000000000;
  }
  else
  {
    uint64_t v21 = v34;
    char v20 = BYTE8(v34) & 1;
  }
  uint64_t v22 = v28;
  uint64_t v23 = v26;
  uint64_t v24 = (char *)v12 + *(int *)(v26 + 28);
  *(void *)uint64_t v24 = v21;
  v24[8] = v20;
  char v35 = 4;
  sub_1C7D73700();
  sub_1C7D78E30();
  uint64_t v25 = v31;
  *(_OWORD *)((char *)v12 + *(int *)(v23 + 32)) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502CA8);
  char v35 = 5;
  sub_1C7D738C4(&qword_1EA502CB0, &qword_1EA502CB8);
  sub_1C7D78E30();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v7);
  *(uint64_t *)((char *)v12 + *(int *)(v23 + 36)) = v34;
  sub_1C7D73754((uint64_t)v12, v22, type metadata accessor for Alert);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return sub_1C7D737BC((uint64_t)v12, type metadata accessor for Alert);
}

uint64_t Alert.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502CC0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7D73658();
  sub_1C7D78F10();
  LOBYTE(v13) = 0;
  sub_1C7D78E60();
  if (!v2)
  {
    uint64_t v9 = (int *)type metadata accessor for Alert(0);
    LOBYTE(v13) = 1;
    sub_1C7D78A00();
    sub_1C7D732D0(&qword_1EA502C58, MEMORY[0x1E4F27928]);
    sub_1C7D78E80();
    LOBYTE(v13) = 2;
    sub_1C7D78E80();
    uint64_t v10 = (uint64_t *)(v3 + v9[7]);
    uint64_t v11 = *v10;
    LOBYTE(v10) = *((unsigned char *)v10 + 8);
    *(void *)&long long v13 = v11;
    BYTE8(v13) = (_BYTE)v10;
    char v14 = 3;
    sub_1C7D7381C();
    sub_1C7D78E80();
    long long v13 = *(_OWORD *)(v3 + v9[8]);
    char v14 = 4;
    sub_1C7D73870();
    sub_1C7D78E80();
    *(void *)&long long v13 = *(void *)(v3 + v9[9]);
    char v14 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502CA8);
    sub_1C7D738C4(&qword_1EA502CD8, &qword_1EA502CE0);
    sub_1C7D78E80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1C7D72870@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Alert.init(from:)(a1, a2);
}

uint64_t sub_1C7D72888(void *a1)
{
  return Alert.encode(to:)(a1);
}

uint64_t sub_1C7D728A0@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1C7D6C0E8(a2, a3);
      uint64_t v10 = (char *)sub_1C7D78960();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1C7D78980();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1C7D78970();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
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
        JUMPOUT(0x1C7D72B04);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1C7D6C144(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1C7D78960();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1C7D78980();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1C7D78970();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_1C7D72B14(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x1E4F143B8];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_1C7D6C0E8(a1, a2);
      char v5 = sub_1C7D73318((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_1C7D6C144(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_1C7D73318(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_1C7D6C144(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_1C7D728A0((uint64_t)__s1, a3, a4, &v14);
      sub_1C7D6C144(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t _s12SessionAlert0B0V0B5StateO2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  if (v2 >> 6)
  {
    if (v2 >> 6 == 1)
    {
      if ((v3 & 0xC0) != 0x40) {
        return 0;
      }
      return ((v3 ^ v2) & 1) == 0;
    }
    if (v3 == 128) {
      return 1;
    }
  }
  else if (v3 < 0x40)
  {
    return ((v3 ^ v2) & 1) == 0;
  }
  return 0;
}

unint64_t sub_1C7D72D9C()
{
  unint64_t result = qword_1EA502BD8;
  if (!qword_1EA502BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502BD8);
  }
  return result;
}

unint64_t sub_1C7D72DF0()
{
  unint64_t result = qword_1EA502BE0;
  if (!qword_1EA502BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502BE0);
  }
  return result;
}

unint64_t sub_1C7D72E44()
{
  unint64_t result = qword_1EA502BE8;
  if (!qword_1EA502BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502BE8);
  }
  return result;
}

unint64_t sub_1C7D72E98()
{
  unint64_t result = qword_1EA502BF0;
  if (!qword_1EA502BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502BF0);
  }
  return result;
}

unint64_t sub_1C7D72EEC()
{
  unint64_t result = qword_1EA502BF8;
  if (!qword_1EA502BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502BF8);
  }
  return result;
}

unint64_t sub_1C7D72F40()
{
  unint64_t result = qword_1EA502C00;
  if (!qword_1EA502C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C00);
  }
  return result;
}

unint64_t sub_1C7D72F94()
{
  unint64_t result = qword_1EA502C28;
  if (!qword_1EA502C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C28);
  }
  return result;
}

unint64_t sub_1C7D72FE8()
{
  unint64_t result = qword_1EA502C30;
  if (!qword_1EA502C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C30);
  }
  return result;
}

uint64_t _s12SessionAlert0B0V11HistoryItemV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  BOOL v5 = *((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2);
  if (!v5 && (sub_1C7D78EA0() & 1) == 0) {
    return 0;
  }
  BOOL v6 = *((void *)a1 + 3) == *((void *)a2 + 3) && *((void *)a1 + 4) == *((void *)a2 + 4);
  if (!v6 && (sub_1C7D78EA0() & 1) == 0) {
    return 0;
  }
  unsigned int v7 = a1[40];
  unsigned int v8 = a2[40];
  if (v7 >> 6)
  {
    if (v7 >> 6 == 1)
    {
      if ((v8 & 0xC0) != 0x40) {
        return 0;
      }
      goto LABEL_18;
    }
    if (v8 == 128) {
      goto LABEL_21;
    }
    return 0;
  }
  if (v8 > 0x3F) {
    return 0;
  }
LABEL_18:
  if ((v8 ^ v7)) {
    return 0;
  }
LABEL_21:
  type metadata accessor for Alert.HistoryItem(0);
  return sub_1C7D789D0();
}

unint64_t sub_1C7D7312C()
{
  unint64_t result = qword_1EA502C40;
  if (!qword_1EA502C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C40);
  }
  return result;
}

unint64_t sub_1C7D73180()
{
  unint64_t result = qword_1EA502C48;
  if (!qword_1EA502C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C48);
  }
  return result;
}

unint64_t sub_1C7D731D4()
{
  unint64_t result = qword_1EA502C50;
  if (!qword_1EA502C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C50);
  }
  return result;
}

unint64_t sub_1C7D73228()
{
  unint64_t result = qword_1EA502C68;
  if (!qword_1EA502C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C68);
  }
  return result;
}

unint64_t sub_1C7D7327C()
{
  unint64_t result = qword_1EA502C70;
  if (!qword_1EA502C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C70);
  }
  return result;
}

uint64_t sub_1C7D732D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C7D73318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1C7D78960();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1C7D78980();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1C7D78970();
  sub_1C7D728A0(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1C7D733D0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x1C7D7350CLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_1C7D6C0E8(a3, a4);
              char v15 = sub_1C7D72B14(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s12SessionAlert0B0V2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_1C7D78EA0() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (int *)type metadata accessor for Alert(0);
  if ((sub_1C7D789D0() & 1) == 0 || (sub_1C7D789D0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = v5[7];
  double v7 = *(double *)((char *)a1 + v6);
  int v8 = *((unsigned __int8 *)a1 + v6 + 8);
  uint64_t v9 = (double *)((char *)a2 + v6);
  double v10 = *v9;
  int v11 = *((unsigned __int8 *)v9 + 8);
  if (v8 == 1)
  {
    if (v7 == 0.0)
    {
      if (v10 != 0.0) {
        LOBYTE(v11) = 0;
      }
      if ((v11 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (v10 == 0.0) {
        int v11 = 0;
      }
      if (v11 != 1) {
        return 0;
      }
    }
  }
  else
  {
    if (v7 != v10) {
      LOBYTE(v11) = 1;
    }
    if (v11) {
      return 0;
    }
  }
  if ((sub_1C7D733D0(*(void *)((char *)a1 + v5[8]), *(void *)((char *)a1 + v5[8] + 8), *(void *)((char *)a2 + v5[8]), *(void *)((char *)a2 + v5[8] + 8)) & 1) == 0)return 0; {
  uint64_t v12 = v5[9];
  }
  uint64_t v13 = *(void *)((char *)a1 + v12);
  uint64_t v14 = *(void *)((char *)a2 + v12);
  return sub_1C7D71BC8(v13, v14);
}

unint64_t sub_1C7D73658()
{
  unint64_t result = qword_1EA502C90;
  if (!qword_1EA502C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C90);
  }
  return result;
}

unint64_t sub_1C7D736AC()
{
  unint64_t result = qword_1EA502C98;
  if (!qword_1EA502C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502C98);
  }
  return result;
}

unint64_t sub_1C7D73700()
{
  unint64_t result = qword_1EA502CA0;
  if (!qword_1EA502CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502CA0);
  }
  return result;
}

uint64_t sub_1C7D73754(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7D737BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1C7D7381C()
{
  unint64_t result = qword_1EA502CC8;
  if (!qword_1EA502CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502CC8);
  }
  return result;
}

unint64_t sub_1C7D73870()
{
  unint64_t result = qword_1EA502CD0;
  if (!qword_1EA502CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502CD0);
  }
  return result;
}

uint64_t sub_1C7D738C4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA502CA8);
    sub_1C7D732D0(a2, (void (*)(uint64_t))type metadata accessor for Alert.HistoryItem);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C7D7395C()
{
  unint64_t result = qword_1EA502CE8;
  if (!qword_1EA502CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502CE8);
  }
  return result;
}

unint64_t sub_1C7D739B4()
{
  unint64_t result = qword_1EA502CF0;
  if (!qword_1EA502CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502CF0);
  }
  return result;
}

unint64_t sub_1C7D73A0C()
{
  unint64_t result = qword_1EA502CF8;
  if (!qword_1EA502CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502CF8);
  }
  return result;
}

unint64_t sub_1C7D73A64()
{
  unint64_t result = qword_1EBC68E18;
  if (!qword_1EBC68E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC68E18);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for Alert(char *a1, char *a2, int *a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *(void *)a2;
    *(void *)BOOL v4 = *(void *)a2;
    BOOL v4 = (char *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    double v10 = &a2[v8];
    uint64_t v11 = sub_1C7D78A00();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    char v15 = &v4[v13];
    uint64_t v16 = &a2[v13];
    *(void *)char v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = (uint64_t *)&v4[v14];
    uint64_t v18 = *(void *)&a2[v14];
    unint64_t v19 = *(void *)&a2[v14 + 8];
    sub_1C7D6C0E8(v18, v19);
    uint64_t *v17 = v18;
    v17[1] = v19;
    *(void *)&v4[a3[9]] = *(void *)&a2[a3[9]];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for Alert(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1C7D78A00();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  sub_1C7D6C144(*(void *)(a1 + a2[8]), *(void *)(a1 + a2[8] + 8));
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for Alert(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_1C7D78A00();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = &a1[v12];
  char v15 = &a2[v12];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = (uint64_t *)&a1[v13];
  uint64_t v17 = *(void *)&a2[v13];
  unint64_t v18 = *(void *)&a2[v13 + 8];
  sub_1C7D6C0E8(v17, v18);
  *uint64_t v16 = v17;
  v16[1] = v18;
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for Alert(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1C7D78A00();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  char v14 = v13[8];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v14;
  uint64_t v15 = a3[8];
  uint64_t v16 = (uint64_t *)&a1[v15];
  uint64_t v17 = (uint64_t *)&a2[v15];
  uint64_t v18 = *v17;
  unint64_t v19 = v17[1];
  sub_1C7D6C0E8(*v17, v19);
  uint64_t v20 = *v16;
  unint64_t v21 = v16[1];
  *uint64_t v16 = v18;
  v16[1] = v19;
  sub_1C7D6C144(v20, v21);
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for Alert(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1C7D78A00();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = &a1[v11];
  char v14 = &a2[v11];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  return a1;
}

char *assignWithTake for Alert(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_1C7D78A00();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  char v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  *(void *)char v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = *(void *)&a1[v13];
  unint64_t v17 = *(void *)&a1[v13 + 8];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  sub_1C7D6C144(v16, v17);
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Alert(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C7D74104);
}

uint64_t sub_1C7D74104(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1C7D78A00();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Alert(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C7D741C8);
}

uint64_t sub_1C7D741C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C7D78A00();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1C7D74270()
{
  uint64_t result = sub_1C7D78A00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Alert.Necessity()
{
  return &type metadata for Alert.Necessity;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState()
{
  return &type metadata for Alert.CoordinationState;
}

ValueMetadata *type metadata accessor for Alert.FailureReason()
{
  return &type metadata for Alert.FailureReason;
}

uint64_t getEnumTagSinglePayload for Alert.AlertState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7E) {
    goto LABEL_17;
  }
  if (a2 + 130 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 130) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 130;
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
      return (*a1 | (v4 << 8)) - 130;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 130;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7D) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for Alert.AlertState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 130 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 130) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7D)
  {
    unsigned int v6 = ((a2 - 126) >> 8) + 1;
    *uint64_t result = a2 - 126;
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
        JUMPOUT(0x1C7D744DCLL);
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
          *uint64_t result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_1C7D74504(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return v1 & 1 | 2u;
  }
}

unsigned char *sub_1C7D74520(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_1C7D74530(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    *uint64_t result = *result & 1 | ((_BYTE)a2 << 6);
  }
  else {
    *uint64_t result = a2 & 1 | 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for Alert.AlertState()
{
  return &type metadata for Alert.AlertState;
}

void *initializeBufferWithCopyOfBuffer for Alert.HistoryItem(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v5;
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (uint64_t)a2 + v7;
    uint64_t v9 = a1 + v7;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v10 = sub_1C7D78A00();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v9, v8, v10);
  }
  return v3;
}

uint64_t destroy for Alert.HistoryItem(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1C7D78A00();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v9 = sub_1C7D78A00();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v7, v9);
  return a1;
}

uint64_t assignWithCopy for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1C7D78A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1C7D78A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1C7D78A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C7D749CC);
}

uint64_t sub_1C7D749CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1C7D78A00();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C7D74A90);
}

uint64_t sub_1C7D74A90(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C7D78A00();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1C7D74B38()
{
  uint64_t result = sub_1C7D78A00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Alert.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Alert.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1C7D74D40);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Alert.CodingKeys()
{
  return &type metadata for Alert.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Alert.HistoryItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Alert.HistoryItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7D74ED4);
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

ValueMetadata *type metadata accessor for Alert.HistoryItem.CodingKeys()
{
  return &type metadata for Alert.HistoryItem.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Alert.AlertState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7D74FD8);
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

ValueMetadata *type metadata accessor for Alert.AlertState.CodingKeys()
{
  return &type metadata for Alert.AlertState.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.AlertState.CoordinatingCodingKeys()
{
  return &type metadata for Alert.AlertState.CoordinatingCodingKeys;
}

unsigned char *_s12SessionAlert5AlertV10AlertStateO22CoordinatingCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C7D750C4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Alert.AlertState.FailedCodingKeys()
{
  return &type metadata for Alert.AlertState.FailedCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.AlertState.DisplayedCodingKeys()
{
  return &type metadata for Alert.AlertState.DisplayedCodingKeys;
}

unsigned char *sub_1C7D7510C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Alert.FailureReason.CodingKeys()
{
  return &type metadata for Alert.FailureReason.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.FailureReason.TimedOutCodingKeys()
{
  return &type metadata for Alert.FailureReason.TimedOutCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.FailureReason.DeclinedCodingKeys()
{
  return &type metadata for Alert.FailureReason.DeclinedCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState.CodingKeys()
{
  return &type metadata for Alert.CoordinationState.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState.RequestingCodingKeys()
{
  return &type metadata for Alert.CoordinationState.RequestingCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState.ThinkingCodingKeys()
{
  return &type metadata for Alert.CoordinationState.ThinkingCodingKeys;
}

uint64_t _s12SessionAlert5AlertV9NecessityOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12SessionAlert5AlertV9NecessityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7D752D4);
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

ValueMetadata *type metadata accessor for Alert.Necessity.CodingKeys()
{
  return &type metadata for Alert.Necessity.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.Necessity.OptionalCodingKeys()
{
  return &type metadata for Alert.Necessity.OptionalCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.Necessity.MandatoryCodingKeys()
{
  return &type metadata for Alert.Necessity.MandatoryCodingKeys;
}

unint64_t sub_1C7D75330()
{
  unint64_t result = qword_1EA502D10;
  if (!qword_1EA502D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D10);
  }
  return result;
}

unint64_t sub_1C7D75388()
{
  unint64_t result = qword_1EA502D18;
  if (!qword_1EA502D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D18);
  }
  return result;
}

unint64_t sub_1C7D753E0()
{
  unint64_t result = qword_1EA502D20;
  if (!qword_1EA502D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D20);
  }
  return result;
}

unint64_t sub_1C7D75438()
{
  unint64_t result = qword_1EA502D28;
  if (!qword_1EA502D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D28);
  }
  return result;
}

unint64_t sub_1C7D75490()
{
  unint64_t result = qword_1EA502D30;
  if (!qword_1EA502D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D30);
  }
  return result;
}

unint64_t sub_1C7D754E8()
{
  unint64_t result = qword_1EA502D38;
  if (!qword_1EA502D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D38);
  }
  return result;
}

unint64_t sub_1C7D75540()
{
  unint64_t result = qword_1EA502D40;
  if (!qword_1EA502D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D40);
  }
  return result;
}

unint64_t sub_1C7D75598()
{
  unint64_t result = qword_1EA502D48;
  if (!qword_1EA502D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D48);
  }
  return result;
}

unint64_t sub_1C7D755F0()
{
  unint64_t result = qword_1EA502D50;
  if (!qword_1EA502D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D50);
  }
  return result;
}

unint64_t sub_1C7D75648()
{
  unint64_t result = qword_1EA502D58;
  if (!qword_1EA502D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D58);
  }
  return result;
}

unint64_t sub_1C7D756A0()
{
  unint64_t result = qword_1EA502D60;
  if (!qword_1EA502D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D60);
  }
  return result;
}

unint64_t sub_1C7D756F8()
{
  unint64_t result = qword_1EA502D68;
  if (!qword_1EA502D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D68);
  }
  return result;
}

unint64_t sub_1C7D75750()
{
  unint64_t result = qword_1EA502D70;
  if (!qword_1EA502D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D70);
  }
  return result;
}

unint64_t sub_1C7D757A8()
{
  unint64_t result = qword_1EA502D78;
  if (!qword_1EA502D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D78);
  }
  return result;
}

unint64_t sub_1C7D75800()
{
  unint64_t result = qword_1EA502D80;
  if (!qword_1EA502D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D80);
  }
  return result;
}

unint64_t sub_1C7D75858()
{
  unint64_t result = qword_1EA502D88;
  if (!qword_1EA502D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D88);
  }
  return result;
}

unint64_t sub_1C7D758B0()
{
  unint64_t result = qword_1EA502D90;
  if (!qword_1EA502D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D90);
  }
  return result;
}

unint64_t sub_1C7D75908()
{
  unint64_t result = qword_1EA502D98;
  if (!qword_1EA502D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502D98);
  }
  return result;
}

unint64_t sub_1C7D75960()
{
  unint64_t result = qword_1EA502DA0;
  if (!qword_1EA502DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DA0);
  }
  return result;
}

unint64_t sub_1C7D759B8()
{
  unint64_t result = qword_1EA502DA8;
  if (!qword_1EA502DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DA8);
  }
  return result;
}

unint64_t sub_1C7D75A10()
{
  unint64_t result = qword_1EA502DB0;
  if (!qword_1EA502DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DB0);
  }
  return result;
}

unint64_t sub_1C7D75A68()
{
  unint64_t result = qword_1EA502DB8;
  if (!qword_1EA502DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DB8);
  }
  return result;
}

unint64_t sub_1C7D75AC0()
{
  unint64_t result = qword_1EA502DC0;
  if (!qword_1EA502DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DC0);
  }
  return result;
}

unint64_t sub_1C7D75B18()
{
  unint64_t result = qword_1EA502DC8;
  if (!qword_1EA502DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DC8);
  }
  return result;
}

unint64_t sub_1C7D75B70()
{
  unint64_t result = qword_1EA502DD0;
  if (!qword_1EA502DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DD0);
  }
  return result;
}

unint64_t sub_1C7D75BC8()
{
  unint64_t result = qword_1EA502DD8;
  if (!qword_1EA502DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DD8);
  }
  return result;
}

unint64_t sub_1C7D75C20()
{
  unint64_t result = qword_1EA502DE0;
  if (!qword_1EA502DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DE0);
  }
  return result;
}

unint64_t sub_1C7D75C78()
{
  unint64_t result = qword_1EA502DE8;
  if (!qword_1EA502DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DE8);
  }
  return result;
}

unint64_t sub_1C7D75CD0()
{
  unint64_t result = qword_1EA502DF0;
  if (!qword_1EA502DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DF0);
  }
  return result;
}

unint64_t sub_1C7D75D28()
{
  unint64_t result = qword_1EA502DF8;
  if (!qword_1EA502DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502DF8);
  }
  return result;
}

unint64_t sub_1C7D75D80()
{
  unint64_t result = qword_1EA502E00;
  if (!qword_1EA502E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E00);
  }
  return result;
}

unint64_t sub_1C7D75DD8()
{
  unint64_t result = qword_1EA502E08;
  if (!qword_1EA502E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E08);
  }
  return result;
}

unint64_t sub_1C7D75E30()
{
  unint64_t result = qword_1EA502E10;
  if (!qword_1EA502E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E10);
  }
  return result;
}

unint64_t sub_1C7D75E88()
{
  unint64_t result = qword_1EA502E18;
  if (!qword_1EA502E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E18);
  }
  return result;
}

unint64_t sub_1C7D75EE0()
{
  unint64_t result = qword_1EA502E20;
  if (!qword_1EA502E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E20);
  }
  return result;
}

unint64_t sub_1C7D75F38()
{
  unint64_t result = qword_1EA502E28;
  if (!qword_1EA502E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E28);
  }
  return result;
}

unint64_t sub_1C7D75F90()
{
  unint64_t result = qword_1EA502E30;
  if (!qword_1EA502E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E30);
  }
  return result;
}

unint64_t sub_1C7D75FE8()
{
  unint64_t result = qword_1EA502E38;
  if (!qword_1EA502E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA502E38);
  }
  return result;
}

uint64_t sub_1C7D7603C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C616E6F6974706FLL && a2 == 0xE800000000000000;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7461646E616DLL && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C7D76130(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6974736575716572 && a2 == 0xEA0000000000676ELL;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696B6E696874 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C7D76224(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x74754F64656D6974 && a2 == 0xE800000000000000;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656E696C636564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C7D76310(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x616E6964726F6F63 && a2 == 0xEC000000676E6974;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6579616C70736964 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1C7D76468(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746973736563656ELL && a2 == 0xE900000000000079;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001C7D7B3E0 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001C7D7B400 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1C7D7665C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x447373696D736964 && a2 == 0xEB00000000657461 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4F7373696D736964 && a2 == 0xED00006E6F697470 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000 || (sub_1C7D78EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x79726F74736968 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_1C7D78EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_1C7D76928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Alert(0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_1C7D7716C(a1);
    sub_1C7D77424(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1C7D7716C((uint64_t)v10);
  }
  else
  {
    sub_1C7D775B4(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    sub_1C7D7822C((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *unsigned int v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t InMemoryAlertStore.alerts.getter()
{
  return swift_bridgeObjectRetain();
}

SessionAlert::InMemoryAlertStore __swiftcall InMemoryAlertStore.init()()
{
  *uint64_t v0 = MEMORY[0x1E4FBC868];
  return result;
}

uint64_t InMemoryAlertStore.alert(identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *v3;
  if (*(void *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_1C7D77080(a1, a2);
    if (v9)
    {
      unint64_t v10 = v8;
      uint64_t v11 = *(void *)(v5 + 56);
      uint64_t v12 = type metadata accessor for Alert(0);
      uint64_t v13 = *(void *)(v12 - 8);
      sub_1C7D770F8(v11 + *(void *)(v13 + 72) * v10, a3);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(a3, 0, 1, v12);
    }
    else
    {
      uint64_t v17 = type metadata accessor for Alert(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a3, 1, 1, v17);
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = type metadata accessor for Alert(0);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    return v15(a3, 1, 1, v14);
  }
}

uint64_t InMemoryAlertStore.update(alert:)(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v2 - 8);
  unsigned int v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  sub_1C7D770F8((uint64_t)a1, (uint64_t)v4);
  uint64_t v7 = type metadata accessor for Alert(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 0, 1, v7);
  swift_bridgeObjectRetain();
  return sub_1C7D76928((uint64_t)v4, v5, v6);
}

Swift::Void __swiftcall InMemoryAlertStore.remove(identifier:)(Swift::String identifier)
{
  object = identifier._object;
  uint64_t countAndFlagsBits = identifier._countAndFlagsBits;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Alert(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_bridgeObjectRetain();
  sub_1C7D76928((uint64_t)v5, countAndFlagsBits, (uint64_t)object);
}

uint64_t sub_1C7D76E38()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C7D76E44(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  sub_1C7D770F8((uint64_t)a1, (uint64_t)v4);
  uint64_t v7 = type metadata accessor for Alert(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 0, 1, v7);
  swift_bridgeObjectRetain();
  return sub_1C7D76928((uint64_t)v4, v5, v6);
}

uint64_t sub_1C7D76F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Alert(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  return sub_1C7D76928((uint64_t)v6, a1, a2);
}

unint64_t sub_1C7D76FF8(unsigned __int8 a1)
{
  sub_1C7D78EC0();
  if (!(a1 >> 6) || a1 >> 6 == 1) {
    sub_1C7D78ED0();
  }
  sub_1C7D78ED0();
  uint64_t v2 = sub_1C7D78EF0();
  return sub_1C7D771CC(a1, v2);
}

unint64_t sub_1C7D77080(uint64_t a1, uint64_t a2)
{
  sub_1C7D78EC0();
  sub_1C7D78C50();
  uint64_t v4 = sub_1C7D78EF0();
  return sub_1C7D77270(a1, a2, v4);
}

uint64_t sub_1C7D770F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Alert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for InMemoryAlertStore()
{
  return &type metadata for InMemoryAlertStore;
}

uint64_t sub_1C7D7716C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68DB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C7D771CC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    while (1)
    {
      unsigned int v7 = *(unsigned __int8 *)(*(void *)(v2 + 48) + result);
      if (!(v7 >> 6)) {
        break;
      }
      if (v7 >> 6 != 1)
      {
        if (a1 == 128) {
          return result;
        }
        goto LABEL_4;
      }
      if ((a1 & 0xC0) == 0x40) {
        goto LABEL_10;
      }
LABEL_4:
      unint64_t result = (result + 1) & v6;
      if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) == 0) {
        return result;
      }
    }
    if (a1 > 0x3Fu) {
      goto LABEL_4;
    }
LABEL_10:
    if (((v7 ^ a1) & 1) == 0) {
      return result;
    }
    goto LABEL_4;
  }
  return result;
}

unint64_t sub_1C7D77270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C7D78EA0() & 1) == 0)
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
      while (!v14 && (sub_1C7D78EA0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1C7D77354(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1C7D77080(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C7D78428();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1C7D77CD4(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C7D77424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C7D77080(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C7D785E0();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for Alert(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_1C7D775B4(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_1C7D77EAC(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for Alert(0);
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_1C7D775B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Alert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C7D77618(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502E48);
  char v36 = a2;
  uint64_t v6 = sub_1C7D78DB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    size_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1C7D78EC0();
    sub_1C7D78C50();
    uint64_t result = sub_1C7D78EF0();
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
  size_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C7D77930(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Alert(0);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502E40);
  int v43 = a2;
  uint64_t v9 = sub_1C7D78DB0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    unint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_1C7D775B4(v30, (uint64_t)v7);
    }
    else
    {
      sub_1C7D770F8(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_1C7D78EC0();
    sub_1C7D78C50();
    uint64_t result = sub_1C7D78EF0();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *unint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_1C7D775B4((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_1C7D77CD4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C7D78D20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1C7D78EC0();
        swift_bridgeObjectRetain();
        sub_1C7D78C50();
        uint64_t v9 = sub_1C7D78EF0();
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
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
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

unint64_t sub_1C7D77EAC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C7D78D20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_1C7D78EC0();
        swift_bridgeObjectRetain();
        sub_1C7D78C50();
        uint64_t v9 = sub_1C7D78EF0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for Alert(0) - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1C7D780BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1C7D77080(a2, a3);
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
    sub_1C7D78428();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1C7D77618(v15, a4 & 1);
  unint64_t v21 = sub_1C7D77080(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1C7D78EB0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C7D7822C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1C7D77080(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1C7D785E0();
      goto LABEL_7;
    }
    sub_1C7D77930(v15, a4 & 1);
    unint64_t v22 = sub_1C7D77080(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1C7D78EB0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for Alert(0) - 8) + 72) * v12;
    return sub_1C7D7884C(a1, v20);
  }
LABEL_13:
  sub_1C7D78390(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C7D78390(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for Alert(0);
  uint64_t result = sub_1C7D775B4(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_1C7D78428()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502E48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7D78DA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

void *sub_1C7D785E0()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Alert(0);
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA502E40);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1C7D78DA0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_1C7D770F8(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    int64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    void *v22 = v19;
    v22[1] = v20;
    sub_1C7D775B4((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1C7D7884C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Alert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of AlertStoring.alerts.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AlertStoring.alert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AlertStoring.update(alert:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AlertStoring.remove(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_1C7D78900()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C7D78910()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C7D78920()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C7D78930()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C7D78940()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C7D78950()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C7D78960()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C7D78970()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C7D78980()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C7D78990()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C7D789A0()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1C7D789B0()
{
  return MEMORY[0x1F40E51C0]();
}

uint64_t sub_1C7D789C0()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1C7D789D0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1C7D789E0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1C7D789F0()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1C7D78A00()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C7D78A10()
{
  return MEMORY[0x1F40D3790]();
}

uint64_t sub_1C7D78A20()
{
  return MEMORY[0x1F40D3970]();
}

uint64_t sub_1C7D78A30()
{
  return MEMORY[0x1F40D3978]();
}

uint64_t sub_1C7D78A40()
{
  return MEMORY[0x1F40D3980]();
}

uint64_t sub_1C7D78A50()
{
  return MEMORY[0x1F40D3988]();
}

uint64_t sub_1C7D78A60()
{
  return MEMORY[0x1F40D3990]();
}

uint64_t sub_1C7D78A70()
{
  return MEMORY[0x1F40D3998]();
}

uint64_t sub_1C7D78A80()
{
  return MEMORY[0x1F414AA08]();
}

uint64_t sub_1C7D78A90()
{
  return MEMORY[0x1F414AA10]();
}

uint64_t sub_1C7D78AA0()
{
  return MEMORY[0x1F414AA18]();
}

uint64_t sub_1C7D78AB0()
{
  return MEMORY[0x1F414AA20]();
}

uint64_t sub_1C7D78AC0()
{
  return MEMORY[0x1F414AA28]();
}

uint64_t sub_1C7D78AD0()
{
  return MEMORY[0x1F414AF48]();
}

uint64_t sub_1C7D78AE0()
{
  return MEMORY[0x1F414AF50]();
}

uint64_t sub_1C7D78AF0()
{
  return MEMORY[0x1F414AF58]();
}

uint64_t sub_1C7D78B00()
{
  return MEMORY[0x1F414AF60]();
}

uint64_t sub_1C7D78B10()
{
  return MEMORY[0x1F414AF68]();
}

uint64_t sub_1C7D78B20()
{
  return MEMORY[0x1F414AF70]();
}

uint64_t sub_1C7D78B30()
{
  return MEMORY[0x1F414AFA8]();
}

uint64_t sub_1C7D78B40()
{
  return MEMORY[0x1F414AFB8]();
}

uint64_t sub_1C7D78B50()
{
  return MEMORY[0x1F414AFC8]();
}

uint64_t sub_1C7D78B60()
{
  return MEMORY[0x1F414AFD0]();
}

uint64_t sub_1C7D78B70()
{
  return MEMORY[0x1F414AFD8]();
}

uint64_t sub_1C7D78B80()
{
  return MEMORY[0x1F414AFE0]();
}

uint64_t sub_1C7D78B90()
{
  return MEMORY[0x1F414AFE8]();
}

uint64_t sub_1C7D78BA0()
{
  return MEMORY[0x1F414AFF8]();
}

uint64_t sub_1C7D78BB0()
{
  return MEMORY[0x1F40D39A0]();
}

uint64_t sub_1C7D78BC0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C7D78BD0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C7D78BE0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C7D78BF0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C7D78C00()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1C7D78C10()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C7D78C20()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1C7D78C30()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1C7D78C40()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C7D78C50()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C7D78C60()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C7D78C70()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C7D78C80()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C7D78C90()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C7D78CA0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C7D78CB0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C7D78CC0()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1C7D78CD0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C7D78CE0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C7D78CF0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C7D78D00()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C7D78D10()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C7D78D20()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C7D78D30()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C7D78D40()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C7D78D50()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C7D78D60()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C7D78D70()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C7D78D80()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C7D78D90()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C7D78DA0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C7D78DB0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C7D78DC0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C7D78DD0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C7D78DE0()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C7D78DF0()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C7D78E00()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C7D78E10()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C7D78E20()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C7D78E30()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C7D78E40()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C7D78E50()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C7D78E60()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C7D78E70()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C7D78E80()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C7D78E90()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C7D78EA0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C7D78EB0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C7D78EC0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C7D78ED0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C7D78EE0()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1C7D78EF0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C7D78F00()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C7D78F10()
{
  return MEMORY[0x1F4185FF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
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