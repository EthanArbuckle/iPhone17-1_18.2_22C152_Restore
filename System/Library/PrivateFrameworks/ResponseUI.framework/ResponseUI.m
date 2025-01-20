void UpdatePresentation.style.getter(unsigned char *a1@<X8>)
{
  unsigned char *v1;

  *a1 = *v1;
}

ResponseUI::UpdatePresentation __swiftcall UpdatePresentation.init(style:)(ResponseUI::UpdatePresentation style)
{
  unsigned char *v1 = *(unsigned char *)style.style;
  return style;
}

BOOL static UpdatePresentation.PresentationStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t UpdatePresentation.PresentationStyle.hash(into:)()
{
  return sub_25B3F0F00();
}

uint64_t sub_25B3EB7C4(char a1)
{
  if (a1) {
    return 0x657370616C6C6F63;
  }
  else {
    return 0x6465646E61707865;
  }
}

BOOL sub_25B3EB800(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25B3EB81C()
{
  return sub_25B3F0F00();
}

uint64_t sub_25B3EB84C()
{
  return sub_25B3EB7C4(*v0);
}

uint64_t sub_25B3EB854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3ED140(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3EB87C()
{
  return 0;
}

void sub_25B3EB888(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25B3EB894(uint64_t a1)
{
  unint64_t v2 = sub_25B3EBD70();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3EB8D0(uint64_t a1)
{
  unint64_t v2 = sub_25B3EBD70();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B3EB90C()
{
  return 0;
}

void sub_25B3EB918(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25B3EB924(uint64_t a1)
{
  unint64_t v2 = sub_25B3EBDC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3EB960(uint64_t a1)
{
  unint64_t v2 = sub_25B3EBDC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B3EB99C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25B3EB9CC(uint64_t a1)
{
  unint64_t v2 = sub_25B3EBE18();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3EBA08(uint64_t a1)
{
  unint64_t v2 = sub_25B3EBE18();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UpdatePresentation.PresentationStyle.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF508);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF510);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF518);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EBD70();
  sub_25B3F0F30();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_25B3EBDC4();
    v14 = v18;
    sub_25B3F0E60();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_25B3EBE18();
    sub_25B3F0E60();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
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

unint64_t sub_25B3EBD70()
{
  unint64_t result = qword_26A4FF520;
  if (!qword_26A4FF520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF520);
  }
  return result;
}

unint64_t sub_25B3EBDC4()
{
  unint64_t result = qword_26A4FF528;
  if (!qword_26A4FF528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF528);
  }
  return result;
}

unint64_t sub_25B3EBE18()
{
  unint64_t result = qword_26A4FF530;
  if (!qword_26A4FF530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF530);
  }
  return result;
}

uint64_t UpdatePresentation.PresentationStyle.hashValue.getter()
{
  return sub_25B3F0F10();
}

uint64_t UpdatePresentation.PresentationStyle.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF538);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF540);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF548);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EBD70();
  v11 = v32;
  sub_25B3F0F20();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_25B3F0E50();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_25B3F0DC0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF550);
    *char v22 = &type metadata for UpdatePresentation.PresentationStyle;
    sub_25B3F0E20();
    sub_25B3F0DB0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
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
    sub_25B3EBDC4();
    v18 = v14;
    sub_25B3F0E10();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_25B3EBE18();
    sub_25B3F0E10();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_25B3EC30C()
{
  return sub_25B3F0F10();
}

uint64_t sub_25B3EC354()
{
  return sub_25B3F0F10();
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

uint64_t sub_25B3EC3E8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return UpdatePresentation.PresentationStyle.init(from:)(a1, a2);
}

uint64_t sub_25B3EC400(void *a1)
{
  return UpdatePresentation.PresentationStyle.encode(to:)(a1);
}

BOOL static UpdatePresentation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25B3EC430()
{
  return 1;
}

uint64_t sub_25B3EC438()
{
  return sub_25B3F0F10();
}

uint64_t sub_25B3EC47C()
{
  return sub_25B3F0F00();
}

uint64_t sub_25B3EC4A4()
{
  return sub_25B3F0F10();
}

uint64_t sub_25B3EC4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3ED234(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25B3EC514(uint64_t a1)
{
  unint64_t v2 = sub_25B3EC6D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3EC550(uint64_t a1)
{
  unint64_t v2 = sub_25B3EC6D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UpdatePresentation.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF558);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EC6D4();
  sub_25B3F0F30();
  char v10 = v7;
  sub_25B3EC728();
  sub_25B3F0E80();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_25B3EC6D4()
{
  unint64_t result = qword_26A4FF560;
  if (!qword_26A4FF560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF560);
  }
  return result;
}

unint64_t sub_25B3EC728()
{
  unint64_t result = qword_26A4FF568;
  if (!qword_26A4FF568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF568);
  }
  return result;
}

uint64_t UpdatePresentation.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF570);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EC6D4();
  sub_25B3F0F20();
  if (!v2)
  {
    sub_25B3EC8E4();
    sub_25B3F0E40();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_25B3EC8E4()
{
  unint64_t result = qword_26A4FF578;
  if (!qword_26A4FF578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF578);
  }
  return result;
}

uint64_t sub_25B3EC938@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return UpdatePresentation.init(from:)(a1, a2);
}

uint64_t sub_25B3EC950(void *a1)
{
  return UpdatePresentation.encode(to:)(a1);
}

uint64_t sub_25B3EC968()
{
  return sub_25B3F0CF0();
}

uint64_t sub_25B3EC9D4()
{
  return sub_25B3F0CE0();
}

unint64_t ShowInCompactKey.getter()
{
  return 0xD000000000000010;
}

unint64_t sub_25B3ECA48()
{
  unint64_t result = qword_26A4FF580;
  if (!qword_26A4FF580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF580);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
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
      JUMPOUT(0x25B3ECBC8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B3ECBF0()
{
  return 0;
}

ValueMetadata *type metadata accessor for UpdatePresentation.CodingKeys()
{
  return &type metadata for UpdatePresentation.CodingKeys;
}

uint64_t _s10ResponseUI18UpdatePresentationV17PresentationStyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s10ResponseUI18UpdatePresentationV17PresentationStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3ECD64);
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

uint64_t sub_25B3ECD8C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25B3ECD94(unsigned char *result, char a2)
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

unint64_t sub_25B3ECDD4()
{
  unint64_t result = qword_26A4FF588;
  if (!qword_26A4FF588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF588);
  }
  return result;
}

unint64_t sub_25B3ECE2C()
{
  unint64_t result = qword_26A4FF590;
  if (!qword_26A4FF590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF590);
  }
  return result;
}

unint64_t sub_25B3ECE84()
{
  unint64_t result = qword_26A4FF598;
  if (!qword_26A4FF598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF598);
  }
  return result;
}

unint64_t sub_25B3ECEDC()
{
  unint64_t result = qword_26A4FF5A0;
  if (!qword_26A4FF5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5A0);
  }
  return result;
}

unint64_t sub_25B3ECF34()
{
  unint64_t result = qword_26A4FF5A8;
  if (!qword_26A4FF5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5A8);
  }
  return result;
}

unint64_t sub_25B3ECF8C()
{
  unint64_t result = qword_26A4FF5B0;
  if (!qword_26A4FF5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5B0);
  }
  return result;
}

unint64_t sub_25B3ECFE4()
{
  unint64_t result = qword_26A4FF5B8;
  if (!qword_26A4FF5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5B8);
  }
  return result;
}

unint64_t sub_25B3ED03C()
{
  unint64_t result = qword_26A4FF5C0;
  if (!qword_26A4FF5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5C0);
  }
  return result;
}

unint64_t sub_25B3ED094()
{
  unint64_t result = qword_26A4FF5C8;
  if (!qword_26A4FF5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5C8);
  }
  return result;
}

unint64_t sub_25B3ED0EC()
{
  unint64_t result = qword_26A4FF5D0;
  if (!qword_26A4FF5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5D0);
  }
  return result;
}

uint64_t sub_25B3ED140(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6465646E61707865 && a2 == 0xE800000000000000;
  if (v3 || (sub_25B3F0E90() & 1) != 0)
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
    char v6 = sub_25B3F0E90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B3ED234(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656C797473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25B3F0E90();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25B3ED2B4()
{
  return 0x656C797473;
}

unint64_t sub_25B3ED2C8()
{
  unint64_t result = qword_26A4FF5D8;
  if (!qword_26A4FF5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5D8);
  }
  return result;
}

unint64_t sub_25B3ED31C()
{
  unint64_t result = qword_26A4FF5E0;
  if (!qword_26A4FF5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5E0);
  }
  return result;
}

uint64_t Layout.snippetModel()@<X0>(uint64_t *a1@<X8>)
{
  sub_25B3F0CB0();
  swift_allocObject();
  sub_25B3F0CA0();
  sub_25B3ED47C();
  uint64_t v3 = sub_25B3F0C90();
  uint64_t v5 = v4;
  uint64_t result = swift_release();
  if (!v1)
  {
    *a1 = v3;
    a1[1] = v5;
    uint64_t v7 = *MEMORY[0x263F4C1D0];
    uint64_t v8 = sub_25B3F0D00();
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(a1, v7, v8);
  }
  return result;
}

unint64_t sub_25B3ED47C()
{
  unint64_t result = qword_26A4FF5E8;
  if (!qword_26A4FF5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF5E8);
  }
  return result;
}

uint64_t sub_25B3ED4D0(char a1)
{
  return *(void *)&aExpandabtrunca[8 * a1];
}

uint64_t sub_25B3ED4F0(char a1)
{
  if (a1) {
    return 0x43746361706D6F63;
  }
  else {
    return 0x647261436C6C7566;
  }
}

uint64_t sub_25B3ED530(char a1)
{
  if (a1) {
    return 0x74696D696CLL;
  }
  else {
    return 1685217635;
  }
}

uint64_t sub_25B3ED560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3EF188(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25B3ED58C(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDE40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3ED5C8(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDE40();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_25B3ED604(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25B3ED618()
{
  return sub_25B3ED4D0(*v0);
}

uint64_t sub_25B3ED620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3EF204(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B3ED648(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25B3ED654(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDDEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3ED690(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDDEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B3ED6CC()
{
  return sub_25B3ED4F0(*v0);
}

uint64_t sub_25B3ED6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3EF34C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3ED6FC(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDF8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3ED738(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDF8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B3ED774()
{
  return sub_25B3ED530(*v0);
}

uint64_t sub_25B3ED77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3EF448(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3ED7A4(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDF38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3ED7E0(uint64_t a1)
{
  unint64_t v2 = sub_25B3EDF38();
  return MEMORY[0x270FA00B8](a1, v2);
}

void Layout.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF5F0);
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  MEMORY[0x270FA5388]();
  char v34 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF5F8);
  uint64_t v33 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388]();
  v39 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF600);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF608);
  uint64_t v41 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = *(void **)v1;
  id v42 = *(id *)(v1 + 8);
  int v12 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EDDEC();
  uint64_t v13 = v10;
  sub_25B3F0F30();
  if (v12)
  {
    if (v12 != 1)
    {
      LOBYTE(v46) = 2;
      sub_25B3EDE40();
      id v27 = v11;
      uint64_t v28 = v34;
      uint64_t v29 = v44;
      sub_25B3F0E60();
      id v46 = v27;
      sub_25B3EDE94();
      uint64_t v30 = v38;
      sub_25B3F0E80();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v28, v30);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v29);
      uint64_t v19 = v11;
      id v20 = v42;
      unsigned __int8 v21 = 2;
      goto LABEL_8;
    }
    LOBYTE(v46) = 1;
    sub_25B3EDF38();
    id v14 = v11;
    uint64_t v15 = v39;
    uint64_t v16 = v44;
    sub_25B3F0E60();
    id v46 = v14;
    char v45 = 0;
    sub_25B3EDE94();
    uint64_t v17 = v40;
    uint64_t v18 = v43;
    sub_25B3F0E80();
    if (v18)
    {
      (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v17);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v16);
      uint64_t v19 = v11;
      id v20 = v42;
      unsigned __int8 v21 = 1;
LABEL_8:
      sub_25B3EDEE8(v19, v20, v21);
      return;
    }
    LOBYTE(v46) = 1;
    id v31 = v42;
    sub_25B3F0E70();
    sub_25B3EDEE8(v11, v31, 1u);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v17);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v16);
  }
  else
  {
    LOBYTE(v46) = 0;
    sub_25B3EDF8C();
    id v22 = v11;
    id v23 = v42;
    uint64_t v24 = v44;
    sub_25B3F0E60();
    id v46 = v22;
    char v45 = 0;
    sub_25B3EDE94();
    uint64_t v25 = v36;
    uint64_t v26 = v43;
    sub_25B3F0E80();
    if (v26)
    {

      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v25);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v24);
    }
    else
    {
      id v46 = v23;
      char v45 = 1;
      sub_25B3F0E80();

      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v25);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v24);
    }
  }
}

unint64_t sub_25B3EDDEC()
{
  unint64_t result = qword_26A4FF610;
  if (!qword_26A4FF610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF610);
  }
  return result;
}

unint64_t sub_25B3EDE40()
{
  unint64_t result = qword_26A4FF618;
  if (!qword_26A4FF618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF618);
  }
  return result;
}

unint64_t sub_25B3EDE94()
{
  unint64_t result = qword_26A4FF620;
  if (!qword_26A4FF620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF620);
  }
  return result;
}

void sub_25B3EDEE8(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 - 1 >= 2)
  {
    if (a3) {
      return;
    }

    a1 = a2;
  }
}

unint64_t sub_25B3EDF38()
{
  unint64_t result = qword_26A4FF628;
  if (!qword_26A4FF628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF628);
  }
  return result;
}

unint64_t sub_25B3EDF8C()
{
  unint64_t result = qword_26A4FF630;
  if (!qword_26A4FF630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF630);
  }
  return result;
}

uint64_t Layout.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF638);
  uint64_t v36 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v38 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF640);
  uint64_t v37 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF648);
  uint64_t v35 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF650);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  int v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_25B3EDDEC();
  uint64_t v14 = v41;
  sub_25B3F0F20();
  if (!v14)
  {
    uint64_t v32 = v6;
    uint64_t v16 = v38;
    uint64_t v15 = v39;
    uint64_t v41 = v10;
    uint64_t v17 = sub_25B3F0E50();
    if (*(void *)(v17 + 16) == 1)
    {
      v31[1] = v17;
      int v18 = *(unsigned __int8 *)(v17 + 32);
      if (*(unsigned char *)(v17 + 32))
      {
        if (v18 == 1)
        {
          LOBYTE(v44) = 1;
          sub_25B3EDF38();
          sub_25B3F0E10();
          LOBYTE(v43) = 0;
          sub_25B3EE74C();
          uint64_t v19 = v34;
          sub_25B3F0E40();
          uint64_t v39 = v9;
          uint64_t v25 = v44;
          LOBYTE(v43) = 1;
          uint64_t v26 = sub_25B3F0E30();
          uint64_t v27 = v19;
          uint64_t v28 = v41;
          uint64_t v29 = v26;
          (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v27);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v39);
        }
        else
        {
          LOBYTE(v44) = 2;
          sub_25B3EDE40();
          sub_25B3F0E10();
          sub_25B3EE74C();
          sub_25B3F0E40();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v15);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
          uint64_t v29 = 0;
          uint64_t v25 = v44;
        }
      }
      else
      {
        LOBYTE(v44) = 0;
        sub_25B3EDF8C();
        sub_25B3F0E10();
        LOBYTE(v43) = 0;
        sub_25B3EE74C();
        uint64_t v23 = v32;
        sub_25B3F0E40();
        uint64_t v39 = v9;
        uint64_t v25 = v44;
        char v42 = 1;
        sub_25B3F0E40();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v23);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v39);
        uint64_t v29 = v43;
      }
      uint64_t v30 = v33;
      *uint64_t v33 = v25;
      v30[1] = v29;
      *((unsigned char *)v30 + 16) = v18;
    }
    else
    {
      uint64_t v20 = sub_25B3F0DC0();
      swift_allocError();
      id v22 = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF550);
      *id v22 = &type metadata for Layout;
      sub_25B3F0E20();
      sub_25B3F0DB0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
}

unint64_t sub_25B3EE74C()
{
  unint64_t result = qword_26A4FF658;
  if (!qword_26A4FF658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF658);
  }
  return result;
}

uint64_t sub_25B3EE7A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return Layout.init(from:)(a1, a2);
}

void sub_25B3EE7B8(void *a1)
{
}

id sub_25B3EE7D4(id result, void *a2, unsigned __int8 a3)
{
  if (a3 - 1 >= 2)
  {
    if (a3) {
      return result;
    }
    id v4 = result;
    unint64_t result = a2;
  }
  return result;
}

void destroy for Layout(uint64_t a1)
{
}

uint64_t _s10ResponseUI6LayoutOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25B3EE7D4(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Layout(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25B3EE7D4(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25B3EDEE8(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Layout(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)a1;
  unsigned __int8 v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25B3EDEE8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Layout(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Layout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
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

uint64_t sub_25B3EE9C0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25B3EE9C8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Layout()
{
  return &type metadata for Layout;
}

uint64_t getEnumTagSinglePayload for Layout.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Layout.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25B3EEB3CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_25B3EEB64(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Layout.CodingKeys()
{
  return &type metadata for Layout.CodingKeys;
}

ValueMetadata *type metadata accessor for Layout.ExpandableCodingKeys()
{
  return &type metadata for Layout.ExpandableCodingKeys;
}

unsigned char *_s10ResponseUI6LayoutO20ExpandableCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3EEC5CLL);
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

ValueMetadata *type metadata accessor for Layout.TruncatedCodingKeys()
{
  return &type metadata for Layout.TruncatedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Layout.CardCodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25B3EED30);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Layout.CardCodingKeys()
{
  return &type metadata for Layout.CardCodingKeys;
}

unint64_t sub_25B3EED6C()
{
  unint64_t result = qword_26A4FF660;
  if (!qword_26A4FF660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF660);
  }
  return result;
}

unint64_t sub_25B3EEDC4()
{
  unint64_t result = qword_26A4FF668;
  if (!qword_26A4FF668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF668);
  }
  return result;
}

unint64_t sub_25B3EEE1C()
{
  unint64_t result = qword_26A4FF670;
  if (!qword_26A4FF670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF670);
  }
  return result;
}

unint64_t sub_25B3EEE74()
{
  unint64_t result = qword_26A4FF678;
  if (!qword_26A4FF678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF678);
  }
  return result;
}

unint64_t sub_25B3EEECC()
{
  unint64_t result = qword_26A4FF680;
  if (!qword_26A4FF680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF680);
  }
  return result;
}

unint64_t sub_25B3EEF24()
{
  unint64_t result = qword_26A4FF688;
  if (!qword_26A4FF688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF688);
  }
  return result;
}

unint64_t sub_25B3EEF7C()
{
  unint64_t result = qword_26A4FF690;
  if (!qword_26A4FF690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF690);
  }
  return result;
}

unint64_t sub_25B3EEFD4()
{
  unint64_t result = qword_26A4FF698;
  if (!qword_26A4FF698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF698);
  }
  return result;
}

unint64_t sub_25B3EF02C()
{
  unint64_t result = qword_26A4FF6A0;
  if (!qword_26A4FF6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6A0);
  }
  return result;
}

unint64_t sub_25B3EF084()
{
  unint64_t result = qword_26A4FF6A8;
  if (!qword_26A4FF6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6A8);
  }
  return result;
}

unint64_t sub_25B3EF0DC()
{
  unint64_t result = qword_26A4FF6B0;
  if (!qword_26A4FF6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6B0);
  }
  return result;
}

unint64_t sub_25B3EF134()
{
  unint64_t result = qword_26A4FF6B8;
  if (!qword_26A4FF6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6B8);
  }
  return result;
}

uint64_t sub_25B3EF188(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25B3F0E90();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25B3EF1F8()
{
  return 12383;
}

uint64_t sub_25B3EF204(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6261646E61707865 && a2 == 0xEA0000000000656CLL;
  if (v3 || (sub_25B3F0E90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657461636E757274 && a2 == 0xE900000000000064 || (sub_25B3F0E90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1685217635 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25B3F0E90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25B3EF34C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x647261436C6C7566 && a2 == 0xE800000000000000;
  if (v3 || (sub_25B3F0E90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x43746361706D6F63 && a2 == 0xEB00000000647261)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B3F0E90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B3EF448(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1685217635 && a2 == 0xE400000000000000;
  if (v3 || (sub_25B3F0E90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74696D696CLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B3F0E90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B3EF520()
{
  uint64_t v0 = sub_25B3F0D20();
  __swift_allocate_value_buffer(v0, qword_26A5013C0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A5013C0);
  if (qword_26A4FF500 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A5013D8);
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25B3EF684()
{
  sub_25B3EF770();
  uint64_t result = sub_25B3F0D70();
  qword_26A4FF6C0 = result;
  return result;
}

uint64_t sub_25B3EF6E4()
{
  uint64_t v0 = sub_25B3F0D20();
  __swift_allocate_value_buffer(v0, qword_26A5013D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5013D8);
  if (qword_26A4FF4F8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A4FF6C0;
  return sub_25B3F0D30();
}

unint64_t sub_25B3EF770()
{
  unint64_t result = qword_26A4FF6C8;
  if (!qword_26A4FF6C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A4FF6C8);
  }
  return result;
}

id CodableCard.wrappedValue.getter()
{
  return *v0;
}

void CodableCard.wrappedValue.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*CodableCard.wrappedValue.modify())()
{
  return nullsub_1;
}

uint64_t CodableCard.init(wrappedValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t CodableCard.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF6D0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EFC14();
  sub_25B3F0F20();
  int v8 = v2;
  unint64_t v9 = 0x263F67000uLL;
  if (!v2)
  {
    sub_25B3F06A4();
    sub_25B3F0E40();
    uint64_t v27 = 0;
    uint64_t v10 = v29[0];
    unint64_t v11 = v29[1];
    id v12 = objc_allocWithZone(MEMORY[0x263F67B20]);
    sub_25B3F06F8(v10, v11);
    uint64_t v13 = (void *)sub_25B3F0CC0();
    sub_25B3F0750(v10, v11);
    id v14 = objc_msgSend(v12, sel_initWithData_, v13);

    if (v14)
    {
      id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677D0]), sel_initWithProtobuf_, v14);

      if (v15)
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        sub_25B3F0750(v10, v11);
        goto LABEL_12;
      }
    }
    sub_25B3F07A8();
    int v8 = (void *)swift_allocError();
    swift_willThrow();
    sub_25B3F0750(v10, v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (qword_26A4FF4F0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_25B3F0D20();
  __swift_project_value_buffer(v16, (uint64_t)qword_26A5013C0);
  id v17 = v8;
  id v18 = v8;
  uint64_t v19 = sub_25B3F0D10();
  os_log_type_t v20 = sub_25B3F0D60();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v27 = 0;
    id v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    v29[0] = v23;
    *(_DWORD *)id v22 = 136315138;
    swift_getErrorValue();
    uint64_t v24 = sub_25B3F0EA0();
    v29[2] = sub_25B3F004C(v24, v25, v29);
    unint64_t v9 = 0x263F67000;
    sub_25B3F0D80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25B3EA000, v19, v20, "Failed to decode SFCard; creating an empty Object instead. Error: %s",
      v22,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x261163800](v23, -1, -1);
    MEMORY[0x261163800](v22, -1, -1);
  }
  else
  {
  }
  id v15 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 2000)), sel_init);

LABEL_12:
  *uint64_t v28 = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_25B3EFC14()
{
  unint64_t result = qword_26A4FF6D8;
  if (!qword_26A4FF6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6D8);
  }
  return result;
}

uint64_t CodableCard.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF6F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67B20]), sel_initWithFacade_, *v1);
  int v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = objc_msgSend(v7, sel_data);

  if (!v9)
  {
    int v8 = 0;
LABEL_5:
    unint64_t v11 = 0xF000000000000000;
    goto LABEL_6;
  }
  int v8 = (void *)sub_25B3F0CD0();
  unint64_t v11 = v10;

LABEL_6:
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3EFC14();
  sub_25B3F0F30();
  v13[0] = v8;
  v13[1] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FF6F8);
  sub_25B3F07FC();
  sub_25B3F0E80();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_25B3F090C((uint64_t)v8, v11);
}

uint64_t sub_25B3EFE48@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25B3F0E00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25B3EFE9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25B3F0B7C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25B3EFEC8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25B3F0E00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25B3EFF20(uint64_t a1)
{
  unint64_t v2 = sub_25B3EFC14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3EFF5C(uint64_t a1)
{
  unint64_t v2 = sub_25B3EFC14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t static CodableCard.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t CodableCard.Error.hash(into:)()
{
  return sub_25B3F0F00();
}

uint64_t CodableCard.Error.hashValue.getter()
{
  return sub_25B3F0F10();
}

uint64_t sub_25B3F001C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return CodableCard.init(from:)(a1, a2);
}

uint64_t sub_25B3F0034(void *a1)
{
  return CodableCard.encode(to:)(a1);
}

uint64_t sub_25B3F004C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25B3F0120(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25B3F0C30((uint64_t)v12, *a3);
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
      sub_25B3F0C30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25B3F0120(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25B3F0D90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25B3F02DC(a5, a6);
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
  uint64_t v8 = sub_25B3F0DD0();
  if (!v8)
  {
    sub_25B3F0DE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25B3F0DF0();
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

uint64_t sub_25B3F02DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25B3F0374(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25B3F0554(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25B3F0554(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25B3F0374(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25B3F04EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25B3F0DA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25B3F0DE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25B3F0D50();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25B3F0DF0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25B3F0DE0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25B3F04EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4FF730);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25B3F0554(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4FF730);
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
  uint64_t result = sub_25B3F0DF0();
  __break(1u);
  return result;
}

unint64_t sub_25B3F06A4()
{
  unint64_t result = qword_26A4FF6E0;
  if (!qword_26A4FF6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6E0);
  }
  return result;
}

uint64_t sub_25B3F06F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_25B3F0750(uint64_t a1, unint64_t a2)
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

unint64_t sub_25B3F07A8()
{
  unint64_t result = qword_26A4FF6E8;
  if (!qword_26A4FF6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF6E8);
  }
  return result;
}

unint64_t sub_25B3F07FC()
{
  unint64_t result = qword_26A4FF700;
  if (!qword_26A4FF700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4FF6F8);
    sub_25B3F08B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF700);
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

unint64_t sub_25B3F08B8()
{
  unint64_t result = qword_26A4FF708;
  if (!qword_26A4FF708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF708);
  }
  return result;
}

uint64_t sub_25B3F090C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25B3F0750(a1, a2);
  }
  return a1;
}

unint64_t sub_25B3F0924()
{
  unint64_t result = qword_26A4FF710;
  if (!qword_26A4FF710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF710);
  }
  return result;
}

ValueMetadata *type metadata accessor for CodableCard()
{
  return &type metadata for CodableCard;
}

ValueMetadata *type metadata accessor for CodableCard.Error()
{
  return &type metadata for CodableCard.Error;
}

unsigned char *_s10ResponseUI11CodableCardV5ErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25B3F0A3CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CodableCard.CodingKeys()
{
  return &type metadata for CodableCard.CodingKeys;
}

unint64_t sub_25B3F0A78()
{
  unint64_t result = qword_26A4FF718;
  if (!qword_26A4FF718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF718);
  }
  return result;
}

unint64_t sub_25B3F0AD0()
{
  unint64_t result = qword_26A4FF720;
  if (!qword_26A4FF720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF720);
  }
  return result;
}

unint64_t sub_25B3F0B28()
{
  unint64_t result = qword_26A4FF728;
  if (!qword_26A4FF728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FF728);
  }
  return result;
}

uint64_t sub_25B3F0B7C()
{
  return 1635017060;
}

uint64_t sub_25B3F0B8C()
{
  return sub_25B3F0F10();
}

uint64_t sub_25B3F0BD8()
{
  return sub_25B3F0D40();
}

uint64_t sub_25B3F0BE8()
{
  return sub_25B3F0F10();
}

uint64_t sub_25B3F0C30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25B3F0C90()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25B3F0CA0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25B3F0CB0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25B3F0CC0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25B3F0CD0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25B3F0CE0()
{
  return MEMORY[0x270F74E00]();
}

uint64_t sub_25B3F0CF0()
{
  return MEMORY[0x270F74E08]();
}

uint64_t sub_25B3F0D00()
{
  return MEMORY[0x270F3DA70]();
}

uint64_t sub_25B3F0D10()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B3F0D20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B3F0D30()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25B3F0D40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B3F0D50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B3F0D60()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B3F0D70()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25B3F0D80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B3F0D90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B3F0DA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B3F0DB0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25B3F0DC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25B3F0DD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B3F0DE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B3F0DF0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B3F0E00()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25B3F0E10()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25B3F0E20()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25B3F0E30()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25B3F0E40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25B3F0E50()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25B3F0E60()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25B3F0E70()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25B3F0E80()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25B3F0E90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B3F0EA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25B3F0EB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B3F0EC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B3F0ED0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B3F0EE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B3F0EF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B3F0F00()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B3F0F10()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B3F0F20()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25B3F0F30()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}