uint64_t objectdestroy_19Tm()
{
  uint64_t v0;
  uint64_t vars8;

  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
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

void sub_25AC64158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_25AC64270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t sub_25AC64630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 8)
                                                                                              + **(int **)(a7 + 8));
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_25AC64768;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_25AC64768()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_25AC6485C(void *a1@<X8>)
{
  *a1 = *v1;
}

ValueMetadata *type metadata accessor for MusicIssues()
{
  return &type metadata for MusicIssues;
}

void *sub_25AC64878@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25AC64AD0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25AC648A4(uint64_t *a1, uint64_t *a2)
{
  return sub_25AC75548(*a1, *a2);
}

uint64_t sub_25AC648B0()
{
  return 1;
}

uint64_t sub_25AC648B8()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC64908()
{
  return sub_25AC8EE78();
}

uint64_t sub_25AC6491C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC64968@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_25AC649BC(void *a1@<X8>)
{
  *a1 = 0x6575737369;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_25AC649D4()
{
  return 0x6575737369;
}

uint64_t sub_25AC649E8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25AC64A40()
{
  return 0;
}

void sub_25AC64A4C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25AC64A58(uint64_t a1)
{
  unint64_t v2 = sub_25AC64C60();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC64A94(uint64_t a1)
{
  unint64_t v2 = sub_25AC64C60();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25AC64AD0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD870);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC64C60();
  sub_25AC8F2A8();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD880);
    sub_25AC64CB4();
    sub_25AC8F1E8();
    uint64_t v7 = (void *)v9[1];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_25AC64C60()
{
  unint64_t result = qword_26A4AD878;
  if (!qword_26A4AD878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD878);
  }
  return result;
}

unint64_t sub_25AC64CB4()
{
  unint64_t result = qword_26A4AD888;
  if (!qword_26A4AD888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4AD880);
    sub_25AC64D28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD888);
  }
  return result;
}

unint64_t sub_25AC64D28()
{
  unint64_t result = qword_26A4AD890;
  if (!qword_26A4AD890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD890);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MusicIssues.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MusicIssues.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25AC64E70);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC64E98()
{
  return 0;
}

ValueMetadata *type metadata accessor for MusicIssues.CodingKeys()
{
  return &type metadata for MusicIssues.CodingKeys;
}

unint64_t sub_25AC64EB8()
{
  unint64_t result = qword_26A4AD898;
  if (!qword_26A4AD898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD898);
  }
  return result;
}

unint64_t sub_25AC64F10()
{
  unint64_t result = qword_26A4AD8A0;
  if (!qword_26A4AD8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8A0);
  }
  return result;
}

unint64_t sub_25AC64F68()
{
  unint64_t result = qword_26A4AD8A8;
  if (!qword_26A4AD8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8A8);
  }
  return result;
}

uint64_t sub_25AC64FBC(char *a1, char *a2)
{
  return sub_25AC73A00(*a1, *a2);
}

uint64_t sub_25AC64FC8()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC65038()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC6508C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC650F8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_25AC65158(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6F65646976;
  if (*v1) {
    uint64_t v2 = 0x636973756DLL;
  }
  *a1 = v2;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_25AC65188(unsigned __int8 *a1, char *a2)
{
  return sub_25AC736E4(*a1, *a2);
}

uint64_t sub_25AC65194()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6527C()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC6534C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC65430@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC65B2C();
  *a1 = result;
  return result;
}

void sub_25AC65460(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1735290739;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x6F65646976;
      goto LABEL_3;
    case 2:
      *a1 = 0x6D75626C61;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 0x6E6F6974617473;
      a1[1] = 0xE700000000000000;
      break;
    case 4:
      *a1 = 0x7473696C79616C70;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC6550C(char a1)
{
  switch(a1)
  {
    case 1:
      if (qword_26A4AD860 != -1) {
        goto LABEL_12;
      }
      break;
    case 2:
      if (qword_26A4AD860 != -1) {
        goto LABEL_12;
      }
      break;
    case 3:
      if (qword_26A4AD860 != -1) {
        goto LABEL_12;
      }
      break;
    case 4:
      if (qword_26A4AD860 != -1) {
        goto LABEL_12;
      }
      break;
    default:
      if (qword_26A4AD860 != -1) {
LABEL_12:
      }
        swift_once();
      break;
  }
  return sub_25AC8EBC8();
}

BOOL LogLevel.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_25AC65828(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25AC65840()
{
  return sub_25AC8F288();
}

void *sub_25AC65870@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_25AC658A4()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC658EC()
{
  return sub_25AC8F298();
}

uint64_t AppTarget.id.getter(uint64_t a1)
{
  if (!a1) {
    return 30324;
  }
  if (a1 == 1) {
    return 0x636973756DLL;
  }
  uint64_t result = sub_25AC8F218();
  __break(1u);
  return result;
}

uint64_t sub_25AC65990@<X0>(uint64_t *a1@<X8>)
{
  if (!*v1)
  {
    unint64_t v2 = 0xE200000000000000;
    uint64_t v3 = 30324;
LABEL_5:
    *a1 = v3;
    a1[1] = v2;
    return result;
  }
  if (*v1 == 1)
  {
    unint64_t v2 = 0xE500000000000000;
    uint64_t v3 = 0x636973756DLL;
    goto LABEL_5;
  }
  uint64_t result = sub_25AC8F218();
  __break(1u);
  return result;
}

uint64_t static Constants.Config.RefreshFrequency.issue.getter()
{
  return 1800;
}

uint64_t static Constants.Config.RefreshFrequency.location.getter()
{
  return 3600;
}

uint64_t static Constants.Config.Synchronization.delay.getter()
{
  return 180;
}

unint64_t sub_25AC65A14()
{
  unint64_t result = qword_26A4AD8B0;
  if (!qword_26A4AD8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8B0);
  }
  return result;
}

unint64_t sub_25AC65A6C()
{
  unint64_t result = qword_26A4AD8B8;
  if (!qword_26A4AD8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8B8);
  }
  return result;
}

uint64_t sub_25AC65AC0()
{
  return MEMORY[0x263F8D320];
}

ValueMetadata *type metadata accessor for LogLevel()
{
  return &type metadata for LogLevel;
}

ValueMetadata *type metadata accessor for AppTarget()
{
  return &type metadata for AppTarget;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

ValueMetadata *type metadata accessor for Constants.Config()
{
  return &type metadata for Constants.Config;
}

ValueMetadata *type metadata accessor for Constants.Config.RefreshFrequency()
{
  return &type metadata for Constants.Config.RefreshFrequency;
}

ValueMetadata *type metadata accessor for Constants.Config.Synchronization()
{
  return &type metadata for Constants.Config.Synchronization;
}

uint64_t sub_25AC65B2C()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ItemType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ItemType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25AC65CE0);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_25AC65D08(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25AC65D10(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ItemType()
{
  return &type metadata for ItemType;
}

uint64_t getEnumTagSinglePayload for CriteriaType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CriteriaType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC65E84);
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

unsigned char *sub_25AC65EAC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CriteriaType()
{
  return &type metadata for CriteriaType;
}

unint64_t sub_25AC65ECC()
{
  unint64_t result = qword_26A4AD8C0;
  if (!qword_26A4AD8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8C0);
  }
  return result;
}

unint64_t sub_25AC65F24()
{
  unint64_t result = qword_26A4AD8C8;
  if (!qword_26A4AD8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8C8);
  }
  return result;
}

double sub_25AC65F8C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25AC67448(a1, (uint64_t)v10);
  if (!v2)
  {
    long long v5 = v18;
    *(_OWORD *)(a2 + 128) = v17;
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v19;
    *(void *)(a2 + 176) = v20;
    long long v6 = v14;
    *(_OWORD *)(a2 + 64) = v13;
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = v16;
    *(_OWORD *)(a2 + 96) = v15;
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = v10[1];
    *(_OWORD *)a2 = v10[0];
    *(_OWORD *)(a2 + 16) = v8;
    double result = *(double *)&v11;
    long long v9 = v12;
    *(_OWORD *)(a2 + 32) = v11;
    *(_OWORD *)(a2 + 48) = v9;
  }
  return result;
}

uint64_t sub_25AC6600C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC66074()
{
  sub_25AC8EE78();

  return sub_25AC8EE78();
}

uint64_t sub_25AC660C4()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC66128(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25AC8F208();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for MusicDeviceCriteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TVIssue(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = a1[7];
  if (result != 1)
  {
    if (result == 2) {
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[9] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[17] != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[19];
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TVIssue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = a2 + 48;
  long long v9 = (_OWORD *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 == 2)
  {
    long long v10 = *(_OWORD *)(v7 + 112);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(v7 + 96);
    *(_OWORD *)(a1 + 160) = v10;
    *(void *)(a1 + 176) = *(void *)(v7 + 128);
    long long v11 = *(_OWORD *)(v7 + 48);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(v7 + 32);
    *(_OWORD *)(a1 + 96) = v11;
    long long v12 = *(_OWORD *)(v7 + 80);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(v7 + 64);
    *(_OWORD *)(a1 + 128) = v12;
    long long v13 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
    *(_OWORD *)(a1 + 64) = v13;
  }
  else
  {
    *(unsigned char *)(a1 + 48) = *(unsigned char *)v7;
    if (v8 == 1)
    {
      *(_OWORD *)(a1 + 56) = *v9;
    }
    else
    {
      uint64_t v14 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v8;
      *(void *)(a1 + 64) = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v15 = *(void *)(a2 + 72);
    if (v15 == 1)
    {
      long long v16 = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 88) = v16;
      long long v17 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v17;
    }
    else
    {
      uint64_t v18 = *(void *)(a2 + 80);
      uint64_t v19 = *(void *)(a2 + 88);
      *(void *)(a1 + 72) = v15;
      *(void *)(a1 + 80) = v18;
      uint64_t v20 = *(void *)(a2 + 96);
      uint64_t v21 = *(void *)(a2 + 104);
      *(void *)(a1 + 88) = v19;
      *(void *)(a1 + 96) = v20;
      uint64_t v22 = *(void *)(a2 + 112);
      uint64_t v23 = *(void *)(a2 + 120);
      *(void *)(a1 + 104) = v21;
      *(void *)(a1 + 112) = v22;
      uint64_t v24 = *(void *)(a2 + 128);
      *(void *)(a1 + 120) = v23;
      *(void *)(a1 + 128) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v25 = *(void *)(a2 + 136);
    if (v25 != 1) {
      uint64_t v25 = swift_bridgeObjectRetain();
    }
    *(void *)(a1 + 136) = v25;
    uint64_t v26 = *(void *)(a2 + 152);
    if (v26 == 1)
    {
      long long v27 = *(_OWORD *)(a2 + 160);
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 160) = v27;
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
    }
    else
    {
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = v26;
      uint64_t v28 = *(void *)(a2 + 168);
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      *(void *)(a1 + 168) = v28;
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t assignWithCopy for TVIssue(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = (_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = (_OWORD *)(a1 + 48);
  uint64_t v8 = (_OWORD *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 56);
  long long v9 = (_OWORD *)(a2 + 48);
  if (v5 == 2)
  {
    if (v7 == 2)
    {
      _OWORD *v6 = *v9;
      long long v10 = *(_OWORD *)(a2 + 64);
      long long v11 = *(_OWORD *)(a2 + 80);
      long long v12 = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
      *(_OWORD *)(a1 + 112) = v12;
      *(_OWORD *)(a1 + 64) = v10;
      *(_OWORD *)(a1 + 80) = v11;
      long long v13 = *(_OWORD *)(a2 + 128);
      long long v14 = *(_OWORD *)(a2 + 144);
      long long v15 = *(_OWORD *)(a2 + 160);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(_OWORD *)(a1 + 144) = v14;
      *(_OWORD *)(a1 + 160) = v15;
      *(_OWORD *)(a1 + 128) = v13;
      return a1;
    }
    *(unsigned char *)uint64_t v6 = *(unsigned char *)v9;
    if (*(void *)v8 == 1)
    {
      *uint64_t v4 = *v8;
    }
    else
    {
      *(void *)(a1 + 56) = *(void *)v8;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v23 = *(void *)(a2 + 72);
    if (v23 == 1)
    {
      long long v24 = *(_OWORD *)(a2 + 72);
      long long v25 = *(_OWORD *)(a2 + 88);
      long long v26 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v26;
      *(_OWORD *)(a1 + 72) = v24;
      *(_OWORD *)(a1 + 88) = v25;
    }
    else
    {
      *(void *)(a1 + 72) = v23;
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v27 = *(void *)(a2 + 136);
    if (v27 != 1) {
      uint64_t v27 = swift_bridgeObjectRetain();
    }
    *(void *)(a1 + 136) = v27;
    if (*(void *)(a2 + 152) == 1)
    {
      long long v28 = *(_OWORD *)(a2 + 144);
      long long v29 = *(_OWORD *)(a2 + 160);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(_OWORD *)(a1 + 144) = v28;
      *(_OWORD *)(a1 + 160) = v29;
      return a1;
    }
LABEL_41:
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (v7 == 2)
  {
    sub_25AC66B74(a1 + 48);
    _OWORD *v6 = *v9;
    long long v16 = *(_OWORD *)(a2 + 112);
    long long v18 = *(_OWORD *)(a2 + 64);
    long long v17 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v16;
    *(_OWORD *)(a1 + 64) = v18;
    *(_OWORD *)(a1 + 80) = v17;
    long long v20 = *(_OWORD *)(a2 + 144);
    long long v19 = *(_OWORD *)(a2 + 160);
    long long v21 = *(_OWORD *)(a2 + 128);
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    *(_OWORD *)(a1 + 144) = v20;
    *(_OWORD *)(a1 + 160) = v19;
    *(_OWORD *)(a1 + 128) = v21;
    return a1;
  }
  *(unsigned char *)uint64_t v6 = *(unsigned char *)v9;
  uint64_t v22 = *(void *)v8;
  if (v5 == 1)
  {
    if (v22 != 1)
    {
      *(void *)(a1 + 56) = v22;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (v22 == 1)
  {
    sub_25AC66A24(a1 + 56);
LABEL_16:
    *uint64_t v4 = *v8;
    goto LABEL_23;
  }
  *(void *)(a1 + 56) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_23:
  v30 = (_OWORD *)(a1 + 72);
  v32 = (long long *)(a2 + 72);
  uint64_t v31 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) == 1)
  {
    if (v31 == 1)
    {
      long long v33 = *v32;
      long long v34 = *(_OWORD *)(a2 + 88);
      long long v35 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v35;
      _OWORD *v30 = v33;
      *(_OWORD *)(a1 + 88) = v34;
    }
    else
    {
      *(void *)(a1 + 72) = v31;
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v31 == 1)
  {
    sub_25AC66A78(a1 + 72);
    long long v36 = *(_OWORD *)(a2 + 120);
    long long v38 = *v32;
    long long v37 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v36;
    _OWORD *v30 = v38;
    *(_OWORD *)(a1 + 88) = v37;
  }
  else
  {
    *(void *)(a1 + 72) = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v39 = (uint64_t *)(a1 + 136);
  uint64_t v40 = *(void *)(a2 + 136);
  if (*(void *)(a1 + 136) == 1)
  {
    if (v40 == 1)
    {
      uint64_t v41 = 1;
LABEL_35:
      uint64_t *v39 = v41;
      goto LABEL_38;
    }
    uint64_t *v39 = v40;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v40 == 1)
    {
      sub_25AC66ACC(a1 + 136);
      uint64_t v41 = *(void *)(a2 + 136);
      goto LABEL_35;
    }
    uint64_t *v39 = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_38:
  v42 = (long long *)(a1 + 144);
  v43 = (long long *)(a2 + 144);
  uint64_t v44 = *(void *)(a2 + 152);
  if (*(void *)(a1 + 152) == 1)
  {
    if (v44 == 1)
    {
      long long v45 = *v43;
      long long v46 = *(_OWORD *)(a2 + 160);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      long long *v42 = v45;
      *(_OWORD *)(a1 + 160) = v46;
      return a1;
    }
    goto LABEL_41;
  }
  if (v44 == 1)
  {
    sub_25AC66B20(a1 + 144);
    uint64_t v47 = *(void *)(a2 + 176);
    long long v48 = *(_OWORD *)(a2 + 160);
    long long *v42 = *v43;
    *(_OWORD *)(a1 + 160) = v48;
    *(void *)(a1 + 176) = v47;
  }
  else
  {
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_25AC66A24(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AC66A78(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AC66ACC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AC66B20(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AC66B74(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy184_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(void *)(a1 + 176) = *((void *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for TVIssue(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = (_OWORD *)(a1 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  long long v10 = (_OWORD *)(a2 + 48);
  if (v7 == 2) {
    goto LABEL_4;
  }
  if (v9 == 2)
  {
    sub_25AC66B74(a1 + 48);
LABEL_4:
    long long v11 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v11;
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    long long v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
    long long v13 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v13;
    long long v14 = *(_OWORD *)(a2 + 64);
    *uint64_t v8 = *v10;
    *(_OWORD *)(a1 + 64) = v14;
    return a1;
  }
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v10;
  if (v7 == 1) {
    goto LABEL_8;
  }
  if (v9 == 1)
  {
    sub_25AC66A24(a1 + 56);
LABEL_8:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_10;
  }
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
LABEL_10:
  uint64_t v15 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) == 1)
  {
LABEL_13:
    long long v16 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v16;
    long long v17 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v17;
    goto LABEL_15;
  }
  if (v15 == 1)
  {
    sub_25AC66A78(a1 + 72);
    goto LABEL_13;
  }
  *(void *)(a1 + 72) = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
LABEL_15:
  long long v18 = (uint64_t *)(a1 + 136);
  uint64_t v19 = *(void *)(a2 + 136);
  if (*(void *)(a1 + 136) != 1)
  {
    if (v19 != 1)
    {
      *long long v18 = v19;
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    sub_25AC66ACC(a1 + 136);
    uint64_t v19 = 1;
  }
  *long long v18 = v19;
LABEL_20:
  if (*(void *)(a1 + 152) != 1)
  {
    uint64_t v20 = *(void *)(a2 + 152);
    if (v20 != 1)
    {
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = v20;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25AC66B20(a1 + 144);
  }
  long long v21 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v21;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVIssue(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 184)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVIssue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 184) = 1;
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
    *(unsigned char *)(result + 184) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVIssue()
{
  return &type metadata for TVIssue;
}

unint64_t sub_25AC66F40()
{
  unint64_t result = qword_26A4AD8D0;
  if (!qword_26A4AD8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8D0);
  }
  return result;
}

uint64_t sub_25AC66F94(unsigned __int8 *a1, char *a2)
{
  return sub_25AC72DEC(*a1, *a2);
}

uint64_t sub_25AC66FA0()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC67084()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC67150()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC67230@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC67B0C();
  *a1 = result;
  return result;
}

void sub_25AC67260(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEA0000000000656CLL;
  uint64_t v3 = 0x746954726F727265;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEC00000065676173;
      uint64_t v3 = 0x73654D726F727265;
      goto LABEL_3;
    case 2:
      *a1 = 0x656C61636F6CLL;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0x6169726574697263;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC67304()
{
  uint64_t result = 0x746954726F727265;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73654D726F727265;
      break;
    case 2:
      uint64_t result = 0x656C61636F6CLL;
      break;
    case 3:
      uint64_t result = 0x6169726574697263;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC6739C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC67B0C();
  *a1 = result;
  return result;
}

void sub_25AC673C4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_25AC673D0(uint64_t a1)
{
  unint64_t v2 = sub_25AC6773C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC6740C(uint64_t a1)
{
  unint64_t v2 = sub_25AC6773C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC67448@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD8D8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC6773C();
  sub_25AC8F2A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v9 = v5;
  LOBYTE(v20) = 0;
  long long v10 = v7;
  uint64_t v11 = v47;
  *(void *)&long long v43 = sub_25AC8F1D8();
  *((void *)&v43 + 1) = v12;
  LOBYTE(v20) = 1;
  *(void *)&long long v44 = sub_25AC8F1D8();
  *((void *)&v44 + 1) = v13;
  LOBYTE(v20) = 2;
  *(void *)&long long v45 = sub_25AC8F1D8();
  *((void *)&v45 + 1) = v14;
  char v32 = 3;
  sub_25AC67790();
  sub_25AC8F1E8();
  long long v26 = v39;
  long long v27 = v40;
  *(void *)&long long v28 = v41;
  long long v22 = v35;
  long long v23 = v36;
  long long v24 = v37;
  long long v25 = v38;
  long long v20 = v33;
  long long v21 = v34;
  nullsub_1(&v20);
  sub_25AC67808((uint64_t)&v20, (uint64_t)v42);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v4);
  sub_25AC67808((uint64_t)v42, (uint64_t)&v46);
  long long v20 = v43;
  long long v21 = v44;
  long long v22 = v45;
  sub_25AC67808((uint64_t)v42, (uint64_t)&v23);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v15 = v29;
  *(_OWORD *)(v11 + 128) = v28;
  *(_OWORD *)(v11 + 144) = v15;
  *(_OWORD *)(v11 + 160) = v30;
  *(void *)(v11 + 176) = v31;
  long long v16 = v25;
  *(_OWORD *)(v11 + 64) = v24;
  *(_OWORD *)(v11 + 80) = v16;
  long long v17 = v27;
  *(_OWORD *)(v11 + 96) = v26;
  *(_OWORD *)(v11 + 112) = v17;
  long long v18 = v21;
  *(_OWORD *)uint64_t v11 = v20;
  *(_OWORD *)(v11 + 16) = v18;
  long long v19 = v23;
  *(_OWORD *)(v11 + 32) = v22;
  *(_OWORD *)(v11 + 48) = v19;
  return result;
}

unint64_t sub_25AC6773C()
{
  unint64_t result = qword_26A4AD8E0;
  if (!qword_26A4AD8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8E0);
  }
  return result;
}

unint64_t sub_25AC67790()
{
  unint64_t result = qword_26A4AD8E8;
  if (!qword_26A4AD8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8E8);
  }
  return result;
}

double sub_25AC677E4(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = xmmword_25AC90000;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_25AC67808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD8F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for TVIssue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TVIssue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 3;
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
        JUMPOUT(0x25AC679CCLL);
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
          *double result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVIssue.CodingKeys()
{
  return &type metadata for TVIssue.CodingKeys;
}

unint64_t sub_25AC67A08()
{
  unint64_t result = qword_26A4AD8F8;
  if (!qword_26A4AD8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD8F8);
  }
  return result;
}

unint64_t sub_25AC67A60()
{
  unint64_t result = qword_26A4AD900;
  if (!qword_26A4AD900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD900);
  }
  return result;
}

unint64_t sub_25AC67AB8()
{
  unint64_t result = qword_26A4AD908;
  if (!qword_26A4AD908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD908);
  }
  return result;
}

uint64_t sub_25AC67B0C()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25AC67B58()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Network()
{
  return self;
}

uint64_t sub_25AC67BBC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Util()
{
  return self;
}

uint64_t sub_25AC67BF0()
{
  uint64_t v1 = v0[1];
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((*v0 & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if ((v1 & 0xF00000000000000) == 0)
  {
    __break(1u);
    return result;
  }
LABEL_5:
  sub_25AC8EE98();

  return sub_25AC8EEE8();
}

uint64_t sub_25AC67C58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_25AC8EF88();
  }
  else {
    return 0;
  }
}

uint64_t sub_25AC67CA0(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  swift_bridgeObjectRetain();
  sub_25AC8F0B8();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if ((v13 & 0x1000000000000000) != 0) {
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  sub_25AC8F0B8();
  uint64_t v15 = v14;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v15 & 0x1000000000000000) != 0) {
    goto LABEL_25;
  }
  uint64_t v17 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v17) = 1;
  }
  uint64_t v18 = 4 << v17;
  unint64_t v19 = a1;
  if ((a1 & 0xC) == 4 << v17)
  {
    uint64_t result = sub_25AC68034(a1, a5, a6);
    unint64_t v19 = result;
  }
  uint64_t v40 = a3;
  unint64_t v20 = a2;
  unint64_t v21 = a5 & 0x800000000000000;
  if ((a6 & 0x1000000000000000) != 0)
  {
    uint64_t v23 = a6 & 0x2000000000000000;
    uint64_t v25 = a5 & 0xFFFFFFFFFFFFLL;
    unint64_t v24 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) != 0) {
      unint64_t v32 = HIBYTE(a6) & 0xF;
    }
    else {
      unint64_t v32 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v32 < v19 >> 16) {
      goto LABEL_43;
    }
    uint64_t result = sub_25AC8EF38();
    uint64_t v22 = result;
    if (v21) {
      uint64_t v26 = 7;
    }
    else {
      uint64_t v26 = 11;
    }
  }
  else
  {
    uint64_t v22 = v19 >> 16;
    uint64_t v23 = a6 & 0x2000000000000000;
    unint64_t v24 = HIBYTE(a6) & 0xF;
    uint64_t v25 = a5 & 0xFFFFFFFFFFFFLL;
    uint64_t v26 = 7;
  }
  if (!v23) {
    unint64_t v24 = v25;
  }
  uint64_t v27 = 4 << (v21 >> 59);
  unint64_t v28 = v26 | (v24 << 16);
  a2 = v20;
  if ((a6 & 0x1000000000000000) == 0) {
    uint64_t v27 = 8;
  }
  unint64_t v29 = v20;
  if ((v20 & 0xC) == v27)
  {
    unint64_t v33 = v20;
    uint64_t v34 = v22;
    uint64_t result = sub_25AC68034(v33, a5, a6);
    uint64_t v22 = v34;
    unint64_t v29 = result;
  }
  if ((v26 & 0xC) == v18)
  {
    unint64_t v35 = v26 | (v24 << 16);
    uint64_t v36 = v22;
    uint64_t result = sub_25AC68034(v35, a5, a6);
    uint64_t v22 = v36;
    unint64_t v28 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_17:
      uint64_t v30 = (v28 >> 16) - (v29 >> 16);
      if ((a4 & 0x1000000000000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_17;
  }
  if (v24 < v29 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v24 >= v28 >> 16)
  {
    uint64_t v37 = v22;
    uint64_t v38 = sub_25AC8EF38();
    uint64_t v22 = v37;
    uint64_t v30 = v38;
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x2000000000000000) != 0)
      {
        uint64_t result = HIBYTE(a4) & 0xF;
        uint64_t v31 = v22 + result;
        if (!__OFADD__(v22, result)) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v40 & 0xFFFFFFFFFFFFLL;
        uint64_t v31 = v22 + (v40 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v22, v40 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_23;
        }
      }
      goto LABEL_39;
    }
LABEL_37:
    uint64_t v39 = v22;
    uint64_t result = sub_25AC8EF08();
    uint64_t v31 = v39 + result;
    if (!__OFADD__(v39, result))
    {
LABEL_23:
      uint64_t result = v31 + v30;
      if (!__OFADD__(v31, v30))
      {
        MEMORY[0x261152160](result);
LABEL_25:
        sub_25AC8EFA8();
        sub_25AC690BC();
        sub_25AC8EEB8();
        swift_bridgeObjectRelease();
        sub_25AC8EEB8();
        sub_25AC67FE8(a2, a5, a6);
        sub_25AC8EEB8();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_40;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

unint64_t sub_25AC67FE8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_25AC8EFA8();
  }
  __break(1u);
  return result;
}

uint64_t sub_25AC68034(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25AC8EF58();
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
    uint64_t v5 = MEMORY[0x261152230](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25AC680B0(uint64_t result)
{
  if (!result) {
    return result;
  }
  if (result < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_25AC8EEA8();
  if (v1)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  return sub_25AC8EE48();
}

uint64_t sub_25AC68138(uint64_t a1, unint64_t a2)
{
  sub_25AC688B4();
  if ((sub_25AC8F128() & 1) == 0) {
    goto LABEL_31;
  }
  if (sub_25AC8EE88() == 1)
  {
    char v4 = 1;
    return v4 & 1;
  }
  uint64_t v18 = a1;
  unint64_t v19 = a2;
  swift_bridgeObjectRetain();
  uint64_t result = sub_25AC8EF68();
  char v17 = result;
  if ((result & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    char v11 = sub_25AC8EF78();
    swift_bridgeObjectRelease();
    if (v11)
    {
      sub_25AC67BF0();
      swift_bridgeObjectRelease();
      uint64_t v13 = v18;
      unint64_t v12 = v19;
      swift_bridgeObjectRetain();
      char v14 = sub_25AC8EF78();
      uint64_t result = swift_bridgeObjectRelease();
      if (v14)
      {
        do
        {
          if ((v12 & 0x2000000000000000) != 0)
          {
            if ((v12 & 0xF00000000000000) == 0) {
              goto LABEL_36;
            }
          }
          else if ((v13 & 0xFFFFFFFFFFFFLL) == 0)
          {
            __break(1u);
            break;
          }
          sub_25AC8EE98();
          sub_25AC8EEE8();
          swift_bridgeObjectRelease();
          uint64_t v13 = v18;
          unint64_t v12 = v19;
          swift_bridgeObjectRetain();
          char v15 = sub_25AC8EF78();
          uint64_t result = swift_bridgeObjectRelease();
        }
        while ((v15 & 1) != 0);
      }
    }
    if ((sub_25AC8F128() & 1) == 0)
    {
      if (v17)
      {
        if (v11) {
          char v16 = sub_25AC8F128();
        }
        else {
          char v16 = sub_25AC8EF78();
        }
        goto LABEL_34;
      }
      if (v11)
      {
        char v16 = sub_25AC8EF68();
LABEL_34:
        char v4 = v16;
        swift_bridgeObjectRelease();
        return v4 & 1;
      }
    }
    swift_bridgeObjectRelease();
LABEL_31:
    char v4 = 0;
    return v4 & 1;
  }
  uint64_t v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6) {
    goto LABEL_37;
  }
  uint64_t result = sub_25AC67C58(a1, a2);
  if (v7)
  {
    sub_25AC680B0(1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    char v8 = sub_25AC8EF68();
    uint64_t result = swift_bridgeObjectRelease();
    if (v8)
    {
      while (1)
      {
        if ((a2 & 0x2000000000000000) != 0)
        {
          if ((a2 & 0xF00000000000000) == 0) {
            goto LABEL_35;
          }
        }
        else if ((a1 & 0xFFFFFFFFFFFFLL) == 0)
        {
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        sub_25AC8EF88();
        uint64_t result = sub_25AC8EEA8();
        if (v9) {
          goto LABEL_38;
        }
        sub_25AC8EE48();
        swift_bridgeObjectRelease();
        a1 = v18;
        a2 = v19;
        swift_bridgeObjectRetain();
        char v10 = sub_25AC8EF68();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v10 & 1) == 0) {
          goto LABEL_16;
        }
      }
    }
    goto LABEL_16;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_25AC68508(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v44 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD910);
  MEMORY[0x270FA5388](v7 - 8);
  long long v45 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25AC8EB38();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = a1;
  unint64_t v47 = a2;
  sub_25AC8EB28();
  unint64_t v13 = sub_25AC688B4();
  uint64_t v14 = sub_25AC8F0E8();
  unint64_t v16 = v15;
  char v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v12, v9);
  uint64_t v46 = a3;
  unint64_t v47 = v44;
  sub_25AC8EB28();
  unint64_t v44 = v13;
  uint64_t v18 = sub_25AC8F0E8();
  unint64_t v20 = v19;
  v17(v12, v9);
  unint64_t v21 = 0xE000000000000000;
  uint64_t v50 = 0;
  unint64_t v51 = 0xE000000000000000;
  uint64_t v22 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0) {
    uint64_t v22 = v14 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v46 = v14;
  unint64_t v47 = v16;
  uint64_t v48 = 0;
  uint64_t v49 = v22;
  uint64_t v23 = sub_25AC8EEF8();
  if (v24)
  {
    uint64_t v25 = v23;
    uint64_t v26 = v24;
    do
    {
      if ((sub_25AC8EDA8() & 1) == 0) {
        MEMORY[0x2611521D0](v25, v26);
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = sub_25AC8EEF8();
      uint64_t v26 = v27;
    }
    while (v27);
    uint64_t v29 = v50;
    unint64_t v28 = v51;
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v28 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v50 = 0;
  unint64_t v51 = 0xE000000000000000;
  uint64_t v30 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v30 = v18 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v46 = v18;
  unint64_t v47 = v20;
  uint64_t v48 = 0;
  uint64_t v49 = v30;
  uint64_t v31 = sub_25AC8EEF8();
  uint64_t v33 = v32;
  if (v32)
  {
    uint64_t v34 = v31;
    do
    {
      if ((sub_25AC8EDA8() & 1) == 0) {
        MEMORY[0x2611521D0](v34, v33);
      }
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_25AC8EEF8();
      uint64_t v33 = v35;
    }
    while (v35);
    uint64_t v33 = v50;
    unint64_t v21 = v51;
  }
  swift_bridgeObjectRelease();
  uint64_t v46 = v29;
  unint64_t v47 = v28;
  uint64_t v50 = v33;
  unint64_t v51 = v21;
  uint64_t v36 = sub_25AC8ECB8();
  char v37 = 1;
  uint64_t v38 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v45, 1, 1, v36);
  uint64_t v39 = sub_25AC8F118();
  sub_25AC68908(v38);
  if (v39)
  {
    uint64_t v40 = sub_25AC8EE38();
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    sub_25AC8EE38();
    swift_bridgeObjectRelease();
    char v37 = sub_25AC68138(v40, v42);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v37 & 1;
}

unint64_t sub_25AC688B4()
{
  unint64_t result = qword_26A4AD918;
  if (!qword_26A4AD918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD918);
  }
  return result;
}

uint64_t sub_25AC68908(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD910);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AC68968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, void *a5@<X8>)
{
  uint64_t v36 = a5;
  uint64_t v9 = sub_25AC8EB38();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  sub_25AC8EB18();
  unint64_t v47 = sub_25AC688B4();
  uint64_t v13 = sub_25AC8F0C8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v14 = 0;
  unint64_t v15 = *(void *)(v13 + 16);
  uint64_t v16 = v13 + 32;
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v41 = a1;
  unint64_t v42 = (uint64_t *)(a1 + 80);
  uint64_t v18 = 1;
  uint64_t v44 = a4;
  unint64_t v19 = v15;
  unint64_t v39 = v15;
  uint64_t v40 = v13;
  uint64_t v37 = v17;
  uint64_t v38 = v13 + 32;
  do
  {
    if (*(void *)(v13 + 16) < v19)
    {
      __break(1u);
      JUMPOUT(0x25AC68DF8);
    }
    uint64_t v52 = v13;
    uint64_t v53 = v16;
    uint64_t v54 = 0;
    uint64_t v55 = (2 * v19) | 1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD930);
    sub_25AC69110();
    uint64_t v48 = sub_25AC8EDB8();
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    if (v17)
    {
      uint64_t v43 = v14;
      swift_bridgeObjectRetain();
      uint64_t v22 = v42;
      uint64_t v23 = v17;
      do
      {
        uint64_t v25 = *(v22 - 6);
        uint64_t v17 = *(v22 - 5);
        uint64_t v18 = *(v22 - 3);
        uint64_t v45 = *(v22 - 4);
        uint64_t v46 = v25;
        uint64_t v49 = *((unsigned __int8 *)v22 - 16);
        uint64_t v14 = *(v22 - 1);
        uint64_t v16 = *v22;
        uint64_t v52 = v14;
        uint64_t v53 = v16;
        uint64_t v50 = v48;
        uint64_t v51 = v21;
        uint64_t v26 = v21;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!sub_25AC8F108())
        {
          unint64_t v27 = 0xE400000000000000;
          uint64_t v28 = 1735290739;
          switch(v49)
          {
            case 1:
              unint64_t v27 = 0xE500000000000000;
              uint64_t v28 = 0x6F65646976;
              break;
            case 2:
              unint64_t v27 = 0xE500000000000000;
              uint64_t v28 = 0x6D75626C61;
              break;
            case 3:
              unint64_t v27 = 0xE700000000000000;
              uint64_t v28 = 0x6E6F6974617473;
              break;
            case 4:
              unint64_t v27 = 0xE800000000000000;
              uint64_t v28 = 0x7473696C79616C70;
              break;
            case 5:
              goto LABEL_29;
            default:
              break;
          }
          unint64_t v29 = 0xE400000000000000;
          uint64_t v30 = 1735290739;
          switch(v44)
          {
            case 1:
              unint64_t v29 = 0xE500000000000000;
              if (v28 != 0x6F65646976) {
                goto LABEL_5;
              }
              goto LABEL_20;
            case 2:
              unint64_t v29 = 0xE500000000000000;
              if (v28 != 0x6D75626C61) {
                goto LABEL_5;
              }
              goto LABEL_20;
            case 3:
              unint64_t v29 = 0xE700000000000000;
              uint64_t v30 = 0x6E6F6974617473;
              goto LABEL_19;
            case 4:
              unint64_t v29 = 0xE800000000000000;
              if (v28 != 0x7473696C79616C70) {
                goto LABEL_5;
              }
              goto LABEL_20;
            default:
LABEL_19:
              if (v28 != v30) {
                goto LABEL_5;
              }
LABEL_20:
              if (v27 == v29)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v31 = v36;
                goto LABEL_30;
              }
LABEL_5:
              char v24 = sub_25AC8F208();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v24) {
                goto LABEL_29;
              }
              break;
          }
        }
        v22 += 7;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        --v23;
        uint64_t v21 = v26;
      }
      while (v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v15 = v39;
      uint64_t v13 = v40;
      uint64_t v14 = v43;
      uint64_t v17 = v37;
      uint64_t v16 = v38;
      uint64_t v18 = 1;
      if (v43 == v39)
      {
LABEL_32:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v32 = 0;
        uint64_t v17 = 0;
        uint64_t v33 = 0;
        uint64_t v18 = 0;
        uint64_t v49 = 0;
        uint64_t v14 = 0;
        uint64_t v16 = 0;
        uint64_t v31 = v36;
        goto LABEL_31;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (v14 == v15) {
        goto LABEL_32;
      }
    }
    ++v14;
    unint64_t v19 = v15 - v14;
  }
  while ((uint64_t)(v15 - v14) >= 0);
  __break(1u);
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v31 = v36;
LABEL_30:
  uint64_t v33 = v45;
  uint64_t v32 = v46;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_31:
  *uint64_t v31 = v32;
  v31[1] = v17;
  v31[2] = v33;
  v31[3] = v18;
  v31[4] = v49;
  v31[5] = v14;
  v31[6] = v16;
  return result;
}

id sub_25AC68E24(uint64_t a1, void (*a2)(void, unint64_t, unint64_t))
{
  id v3 = objc_msgSend(self, sel_sharedSession);
  id v4 = objc_msgSend(v3, sel_configuration);

  id v5 = objc_msgSend(v4, sel_URLCache);
  if (!v5
    || (uint64_t v6 = (void *)sub_25AC8EAA8(),
        id v7 = objc_msgSend(v5, sel_cachedResponseForRequest_, v6),
        v5,
        v6,
        !v7))
  {
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    sub_25AC8EAC8();
    sub_25AC6916C();
    sub_25AC8F1F8();
    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    a2(0, 0xD000000000000017, 0x800000025AC923C0);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v7;
}

uint64_t sub_25AC68F94(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_25AC69068();
  uint64_t v8 = (void *)sub_25AC8F018();
  if (v8[2])
  {
    unint64_t v9 = v8[4];
    unint64_t v10 = v8[5];
    swift_bridgeObjectRelease();
    return sub_25AC67CA0(v9, v10, a3, a4, a1, a2);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t sub_25AC69068()
{
  unint64_t result = qword_26A4AD920;
  if (!qword_26A4AD920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD920);
  }
  return result;
}

unint64_t sub_25AC690BC()
{
  unint64_t result = qword_26A4AD928;
  if (!qword_26A4AD928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD928);
  }
  return result;
}

unint64_t sub_25AC69110()
{
  unint64_t result = qword_26A4AD938;
  if (!qword_26A4AD938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4AD930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD938);
  }
  return result;
}

unint64_t sub_25AC6916C()
{
  unint64_t result = qword_26A4AD940;
  if (!qword_26A4AD940)
  {
    sub_25AC8EAC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD940);
  }
  return result;
}

double sub_25AC691C4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25AC699E4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_25AC69214(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  return sub_25AC696A0((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_25AC69270(unsigned __int8 *a1, char *a2)
{
  return sub_25AC73890(*a1, *a2);
}

uint64_t sub_25AC6927C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC69348()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC693FC()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC694C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC69F04();
  *a1 = result;
  return result;
}

void sub_25AC694F4(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x656C746974;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 2036625250;
      goto LABEL_3;
    case 2:
      *a1 = 0x657079546D657469;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x656C61636F6CLL;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC69580()
{
  uint64_t result = 0x656C746974;
  switch(*v0)
  {
    case 1:
      uint64_t result = 2036625250;
      break;
    case 2:
      uint64_t result = 0x657079546D657469;
      break;
    case 3:
      uint64_t result = 0x656C61636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC69600@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC69F04();
  *a1 = result;
  return result;
}

uint64_t sub_25AC69628(uint64_t a1)
{
  unint64_t v2 = sub_25AC69CA4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC69664(uint64_t a1)
{
  unint64_t v2 = sub_25AC69CA4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC696A0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_25AC8F208(), uint64_t result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (v8 = sub_25AC8F208(), uint64_t result = 0, (v8 & 1) != 0))
    {
      int v9 = *(unsigned __int8 *)(a1 + 32);
      int v10 = *(unsigned __int8 *)(a2 + 32);
      if (v9 == 5)
      {
        if (v10 != 5) {
          return 0;
        }
      }
      else if (v10 == 5 || (sub_25AC736E4(v9, v10) & 1) == 0)
      {
        return 0;
      }
      if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48))
      {
        return 1;
      }
      else
      {
        return sub_25AC8F208();
      }
    }
  }
  return result;
}

uint64_t destroy for MusicMessage()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicMessage(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for MusicMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicMessage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicMessage()
{
  return &type metadata for MusicMessage;
}

uint64_t sub_25AC699E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD948);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  char v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC69CA4();
  sub_25AC8F2A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v27 = 0;
  uint64_t v10 = sub_25AC8F1D8();
  uint64_t v23 = v6;
  uint64_t v12 = v11;
  uint64_t v21 = v10;
  char v26 = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_25AC8F1D8();
  uint64_t v15 = v14;
  uint64_t v20 = v13;
  char v25 = 2;
  swift_bridgeObjectRetain();
  sub_25AC8F1D8();
  sub_25AC8EE38();
  uint64_t v22 = v16;
  swift_bridgeObjectRelease();
  LODWORD(v22) = sub_25AC65B2C();
  char v24 = 3;
  uint64_t v17 = sub_25AC8F1D8();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v21;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v15;
  *(unsigned char *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v19;
  return result;
}

unint64_t sub_25AC69CA4()
{
  unint64_t result = qword_26A4AD950;
  if (!qword_26A4AD950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD950);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MusicMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC69DC4);
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

ValueMetadata *type metadata accessor for MusicMessage.CodingKeys()
{
  return &type metadata for MusicMessage.CodingKeys;
}

unint64_t sub_25AC69E00()
{
  unint64_t result = qword_26A4AD958;
  if (!qword_26A4AD958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD958);
  }
  return result;
}

unint64_t sub_25AC69E58()
{
  unint64_t result = qword_26A4AD960;
  if (!qword_26A4AD960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD960);
  }
  return result;
}

unint64_t sub_25AC69EB0()
{
  unint64_t result = qword_26A4AD968;
  if (!qword_26A4AD968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD968);
  }
  return result;
}

uint64_t sub_25AC69F04()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

Swift::String __swiftcall String.noBreakingSpaced()()
{
  sub_25AC688B4();
  uint64_t v0 = sub_25AC8F0F8();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

unsigned __int8 *sub_25AC69FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25AC8EB38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v35 = 44;
  unint64_t v36 = 0xE100000000000000;
  sub_25AC688B4();
  uint64_t v8 = sub_25AC8F0D8();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v32 = v7;
    uint64_t v33 = v5;
    uint64_t v34 = v4;
    swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t *)(v8 + 40);
    while (1)
    {
      uint64_t v11 = *(v10 - 1);
      uint64_t v12 = *v10;
      uint64_t v37 = v11;
      uint64_t v38 = v12;
      uint64_t v35 = 0x6567612D78616DLL;
      unint64_t v36 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      if (sub_25AC8F128()) {
        break;
      }
      v10 += 2;
      swift_bridgeObjectRelease();
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v37 = v11;
    uint64_t v38 = v12;
    uint64_t v20 = v32;
    sub_25AC8EB28();
    uint64_t v21 = sub_25AC8F0E8();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
    swift_bridgeObjectRelease();
    uint64_t v37 = v21;
    uint64_t v38 = v23;
    uint64_t v35 = 0x3D6567612D78616DLL;
    unint64_t v36 = 0xE800000000000000;
    sub_25AC69068();
    sub_25AC8F008();
    swift_bridgeObjectRelease();
    uint64_t v13 = v39;
    unint64_t v15 = v40;
    unint64_t v17 = v41;
    unint64_t v19 = v42;
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v13 = MEMORY[0x2611523B0](0, 0xE000000000000000);
    unint64_t v15 = v14;
    unint64_t v17 = v16;
    unint64_t v19 = v18;
  }
  if ((v15 ^ v13) >> 14)
  {
    uint64_t v24 = sub_25AC6AB80(v13, v15, v17, v19, 10);
    if ((v25 & 0x100) != 0)
    {
      char v26 = sub_25AC6A2BC(v13, v15, v17, v19, 10);
      char v30 = v29;
      swift_bridgeObjectRelease();
      int v28 = v30 & 1;
    }
    else
    {
      char v26 = (unsigned __int8 *)v24;
      char v27 = v25;
      swift_bridgeObjectRelease();
      int v28 = v27 & 1;
    }
    if (v28) {
      return 0;
    }
    else {
      return v26;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

unsigned __int8 *sub_25AC6A2BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_25AC690BC();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25AC8EF98();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_25AC6A62C();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_25AC8F168();
  }
LABEL_7:
  uint64_t v13 = sub_25AC6A3B0(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_25AC6A3B0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
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
              uint64_t v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12))) {
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
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v23 = a3 + 48;
      unsigned __int8 v24 = a3 + 55;
      unsigned __int8 v25 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v23 = 58;
      }
      else
      {
        unsigned __int8 v25 = 97;
        unsigned __int8 v24 = 65;
      }
      if (result)
      {
        uint64_t v26 = 0;
        do
        {
          unsigned int v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              uint64_t v13 = 0;
              if (v27 < 0x61 || v27 >= v25) {
                return (unsigned __int8 *)v13;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
            return 0;
          }
          uint64_t v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v15 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v16 = a3 + 48;
  unsigned __int8 v17 = a3 + 55;
  unsigned __int8 v18 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v16 = 58;
  }
  else
  {
    unsigned __int8 v18 = 97;
    unsigned __int8 v17 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v19 = result + 1;
  do
  {
    unsigned int v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        uint64_t v13 = 0;
        if (v20 < 0x61 || v20 >= v18) {
          return (unsigned __int8 *)v13;
        }
        char v21 = -87;
      }
      else
      {
        char v21 = -55;
      }
    }
    else
    {
      char v21 = -48;
    }
    uint64_t v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21))) {
      return 0;
    }
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_25AC6A62C()
{
  unint64_t v0 = sub_25AC8EFA8();
  uint64_t v4 = sub_25AC6A6AC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25AC6A6AC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_25AC6A804(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25AC6A904(v9, 0);
      unint64_t v12 = sub_25AC6A96C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25AC8F168();
LABEL_4:
        JUMPOUT(0x261152170);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x261152170](v11 + 4, v11[2]);
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
    return MEMORY[0x261152170]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_25AC6A804(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    Swift::String result = sub_25AC68034(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    Swift::String result = sub_25AC68034(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return sub_25AC8EF38();
}

void *sub_25AC6A904(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD970);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_25AC6A96C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    Swift::String result = v12;
    if (v17 == v15) {
      Swift::String result = sub_25AC68034(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      Swift::String result = sub_25AC8EF48();
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
        Swift::String result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          Swift::String result = sub_25AC8F168();
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
    Swift::String result = sub_25AC68034(v12, a6, a7);
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
    unint64_t v12 = sub_25AC8EF18();
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

uint64_t sub_25AC6AB80(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v11 = (void *)sub_25AC8F168();
  }
  uint64_t result = sub_25AC6AC58((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_25AC6AC58(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    uint64_t result = sub_25AC68034(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_95;
  }
  uint64_t result = sub_25AC8EF38();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    uint64_t result = sub_25AC68034(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    uint64_t result = sub_25AC68034(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    uint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_91;
  }
  if (v17 < a3 >> 16)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t result = sub_25AC8EF38();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_90;
  }
  if (v18 < v15)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v31 = a6 + 48;
        unsigned __int8 v32 = a6 + 55;
        unsigned __int8 v33 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v31 = 58;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v32 = 65;
        }
        if (v19)
        {
          uint64_t v24 = 0;
          uint64_t v34 = v19 + 1;
          uint64_t v35 = result - 1;
          do
          {
            unsigned int v36 = *v34;
            if (v36 < 0x30 || v36 >= v31)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                uint64_t v29 = 0;
                if (v36 < 0x61 || v36 >= v33) {
                  return v29;
                }
                char v37 = -87;
              }
              else
              {
                char v37 = -55;
              }
            }
            else
            {
              char v37 = -48;
            }
            uint64_t v38 = v24 * a6;
            if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63) {
              return 0;
            }
            uint64_t v24 = v38 + (v36 + v37);
            if (__OFADD__(v38, (v36 + v37))) {
              return 0;
            }
            ++v34;
            --v35;
          }
          while (v35);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_94;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v39 = a6 + 48;
      unsigned __int8 v40 = a6 + 55;
      unsigned __int8 v41 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v39 = 58;
      }
      else
      {
        unsigned __int8 v41 = 97;
        unsigned __int8 v40 = 65;
      }
      if (v19)
      {
        uint64_t v42 = 0;
        do
        {
          unsigned int v43 = *v19;
          if (v43 < 0x30 || v43 >= v39)
          {
            if (v43 < 0x41 || v43 >= v40)
            {
              uint64_t v29 = 0;
              if (v43 < 0x61 || v43 >= v41) {
                return v29;
              }
              char v44 = -87;
            }
            else
            {
              char v44 = -55;
            }
          }
          else
          {
            char v44 = -48;
          }
          uint64_t v45 = v42 * a6;
          if ((unsigned __int128)(v42 * (__int128)a6) >> 64 != (v42 * a6) >> 63) {
            return 0;
          }
          uint64_t v42 = v45 + (v43 + v44);
          if (__OFADD__(v45, (v43 + v44))) {
            return 0;
          }
          ++v19;
          --result;
        }
        while (result);
        return v45 + (v43 + v44);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 48;
      unsigned __int8 v22 = a6 + 55;
      unsigned __int8 v23 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v21 = 58;
      }
      else
      {
        unsigned __int8 v23 = 97;
        unsigned __int8 v22 = 65;
      }
      if (v19)
      {
        uint64_t v24 = 0;
        unsigned __int8 v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              uint64_t v29 = 0;
              if (v27 < 0x61 || v27 >= v23) {
                return v29;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v30 = v24 * a6;
          if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63) {
            return 0;
          }
          uint64_t v24 = v30 - (v27 + v28);
          if (__OFSUB__(v30, (v27 + v28))) {
            return 0;
          }
          ++v25;
          if (!--v26) {
            return v24;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t destroy for LocationCriteria()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s10QOSToolkit16LocationCriteriaVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LocationCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for LocationCriteria(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationCriteria(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for LocationCriteria(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for LocationCriteria()
{
  return &type metadata for LocationCriteria;
}

uint64_t sub_25AC6B260@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25AC6B630(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_25AC6B28C(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  uint64_t v5 = *(void **)(a1 + 8);
  unsigned __int8 v6 = *(void **)a2;
  unint64_t v7 = *(void **)(a2 + 8);
  if (v4)
  {
    if (!v6 || (sub_25AC75A24(v4, v6) & 1) == 0) {
      return 0;
    }
  }
  else if (v6)
  {
    return 0;
  }
  if (v5)
  {
    if (v7 && (sub_25AC75A24(v5, v7) & 1) != 0) {
      return 1;
    }
  }
  else if (!v7)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_25AC6B300(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25AC72DE8(*a1, *a2);
}

uint64_t sub_25AC6B30C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6B38C()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC6B3F8()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6B474@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_25AC6B4D4(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x7972746E756F63;
  if (*v1) {
    uint64_t v2 = 0x6574617473;
  }
  unint64_t v3 = 0xE700000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25AC6B510()
{
  if (*v0) {
    return 0x6574617473;
  }
  else {
    return 0x7972746E756F63;
  }
}

uint64_t sub_25AC6B548@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_25AC6B5AC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25AC6B5B8(uint64_t a1)
{
  unint64_t v2 = sub_25AC6B820();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC6B5F4(uint64_t a1)
{
  unint64_t v2 = sub_25AC6B820();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC6B630(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD978);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned __int8 v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25AC6B820();
  sub_25AC8F2A8();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
    char v10 = 0;
    sub_25AC6B874();
    sub_25AC8F1E8();
    uint64_t v7 = v11;
    char v10 = 1;
    sub_25AC8F1E8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_25AC6B820()
{
  unint64_t result = qword_26A4AD980;
  if (!qword_26A4AD980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD980);
  }
  return result;
}

unint64_t sub_25AC6B874()
{
  unint64_t result = qword_26A4AD990;
  if (!qword_26A4AD990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4AD988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD990);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LocationCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC6B9ACLL);
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

ValueMetadata *type metadata accessor for LocationCriteria.CodingKeys()
{
  return &type metadata for LocationCriteria.CodingKeys;
}

unint64_t sub_25AC6B9E8()
{
  unint64_t result = qword_26A4AD998;
  if (!qword_26A4AD998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD998);
  }
  return result;
}

unint64_t sub_25AC6BA40()
{
  unint64_t result = qword_26A4AD9A0;
  if (!qword_26A4AD9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD9A0);
  }
  return result;
}

unint64_t sub_25AC6BA98()
{
  unint64_t result = qword_26A4AD9A8;
  if (!qword_26A4AD9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD9A8);
  }
  return result;
}

uint64_t QOSConfig.appTarget.getter()
{
  return *(void *)(v0 + OBJC_IVAR___QOSConfigInternal_appTarget);
}

uint64_t QOSConfig.locale.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___QOSConfigInternal_locale);
  swift_bridgeObjectRetain();
  return v1;
}

id QOSConfig.__allocating_init(appTarget:locale:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  uint64_t v8 = &v7[OBJC_IVAR___QOSConfigInternal_issuesUrl];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v7[OBJC_IVAR___QOSConfigInternal_locationUrl];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  char v10 = &v7[OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs];
  *(void *)char v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v7[OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = &v7[OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  *(void *)&v7[OBJC_IVAR___QOSConfigInternal_appTarget] = a1;
  uint64_t v13 = &v7[OBJC_IVAR___QOSConfigInternal_locale];
  *(void *)uint64_t v13 = a2;
  *((void *)v13 + 1) = a3;
  v15.receiver = v7;
  v15.super_class = v3;
  return objc_msgSendSuper2(&v15, sel_init);
}

id QOSConfig.init(appTarget:locale:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = &v3[OBJC_IVAR___QOSConfigInternal_issuesUrl];
  *(void *)unsigned int v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v3[OBJC_IVAR___QOSConfigInternal_locationUrl];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  unsigned int v6 = &v3[OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs];
  *(void *)unsigned int v6 = 0;
  v6[8] = 1;
  uint64_t v7 = &v3[OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs];
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  uint64_t v8 = &v3[OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  *(void *)&v3[OBJC_IVAR___QOSConfigInternal_appTarget] = a1;
  uint64_t v9 = &v3[OBJC_IVAR___QOSConfigInternal_locale];
  *(void *)uint64_t v9 = a2;
  *((void *)v9 + 1) = a3;
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for QOSConfig();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for QOSConfig()
{
  return self;
}

id QOSConfig.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void QOSConfig.init()()
{
}

id QOSConfig.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QOSConfig();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for QOSConfig(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QOSConfig);
}

uint64_t dispatch thunk of QOSConfig.__allocating_init(appTarget:locale:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t sub_25AC6BF90()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_25AC6BFB0, 0, 0);
}

uint64_t sub_25AC6BFB0()
{
  uint64_t v1 = v0[3];
  v0[4] = sub_25AC6CB78();
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___QOSConfigInternal_appTarget);
  if (v2 == 1)
  {
    unsigned int v6 = (void *)swift_task_alloc();
    v0[8] = v6;
    void *v6 = v0;
    v6[1] = sub_25AC6C2A4;
    uint64_t v4 = 0x800000025AC92500;
    uint64_t v5 = 0xD000000000000016;
    goto LABEL_5;
  }
  if (!v2)
  {
    int v3 = (void *)swift_task_alloc();
    v0[5] = v3;
    *int v3 = v0;
    v3[1] = sub_25AC6C124;
    uint64_t v4 = 0x800000025AC925D0;
    uint64_t v5 = 0xD000000000000021;
LABEL_5:
    return sub_25AC7C4B4(v5, v4);
  }
  v0[2] = v2;
  return sub_25AC8F218();
}

uint64_t sub_25AC6C124(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC6C224, 0, 0);
}

uint64_t sub_25AC6C224()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(_OWORD *)(*(void *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_issuesUrl) = *(_OWORD *)(v0 + 48);

  swift_bridgeObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25AC6C2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC6C3A4, 0, 0);
}

uint64_t sub_25AC6C3A4()
{
  *(_OWORD *)(*(void *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_issuesUrl) = *(_OWORD *)(v0 + 72);
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC6C46C;
  return sub_25AC7C4B4(0xD000000000000018, 0x800000025AC92520);
}

uint64_t sub_25AC6C46C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC6C56C, 0, 0);
}

uint64_t sub_25AC6C56C()
{
  *(_OWORD *)(*(void *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_locationUrl) = *(_OWORD *)(v0 + 96);
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC6C634;
  return sub_25AC7C830(0xD00000000000002BLL, 0x800000025AC92540);
}

uint64_t sub_25AC6C634(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 120) = a1;
  *(unsigned char *)(v3 + 160) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC6C738, 0, 0);
}

uint64_t sub_25AC6C738()
{
  uint64_t v1 = 1800;
  if ((*(unsigned char *)(v0 + 160) & 1) == 0) {
    uint64_t v1 = *(void *)(v0 + 120);
  }
  uint64_t v2 = *(void *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs;
  *(void *)uint64_t v2 = v1;
  *(unsigned char *)(v2 + 8) = 0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25AC6C80C;
  return sub_25AC7C830(0xD00000000000002ELL, 0x800000025AC92570);
}

uint64_t sub_25AC6C80C(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(unsigned char *)(v3 + 161) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC6C910, 0, 0);
}

uint64_t sub_25AC6C910()
{
  uint64_t v1 = 3600;
  if ((*(unsigned char *)(v0 + 161) & 1) == 0) {
    uint64_t v1 = *(void *)(v0 + 136);
  }
  uint64_t v2 = *(void *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs;
  *(void *)uint64_t v2 = v1;
  *(unsigned char *)(v2 + 8) = 0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25AC6C9E4;
  return sub_25AC7C830(0xD00000000000002BLL, 0x800000025AC925A0);
}

uint64_t sub_25AC6C9E4(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 152) = a1;
  *(unsigned char *)(v3 + 162) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC6CAE8, 0, 0);
}

uint64_t sub_25AC6CAE8()
{
  char v1 = *(unsigned char *)(v0 + 162);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 24);

  uint64_t v4 = 180;
  if ((v1 & 1) == 0) {
    uint64_t v4 = v2;
  }
  uint64_t v5 = v3 + OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs;
  *(void *)uint64_t v5 = v4;
  *(unsigned char *)(v5 + 8) = 0;
  unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_25AC6CB78()
{
  if (*(void *)(v0 + OBJC_IVAR___QOSConfigInternal_appTarget) > 1uLL)
  {
    uint64_t result = sub_25AC8F218();
    __break(1u);
  }
  else
  {
    char v1 = (void *)sub_25AC8EDC8();
    uint64_t v2 = (void *)sub_25AC8EDC8();
    id v3 = objc_msgSend(self, sel_bagForProfile_profileVersion_, v1, v2);

    return (uint64_t)v3;
  }
  return result;
}

__n128 sub_25AC6CC4C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25AC6E76C(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v9[10];
    long long v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    __n128 result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

BOOL sub_25AC6CCB0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[9];
  v13[8] = a1[8];
  v13[9] = v2;
  v13[10] = a1[10];
  long long v3 = a1[5];
  v13[4] = a1[4];
  v13[5] = v3;
  long long v4 = a1[7];
  v13[6] = a1[6];
  v13[7] = v4;
  long long v5 = a1[1];
  v13[0] = *a1;
  v13[1] = v5;
  long long v6 = a1[3];
  v13[2] = a1[2];
  v13[3] = v6;
  long long v7 = a2[9];
  v14[8] = a2[8];
  v14[9] = v7;
  v14[10] = a2[10];
  long long v8 = a2[5];
  v14[4] = a2[4];
  v14[5] = v8;
  long long v9 = a2[7];
  v14[6] = a2[6];
  v14[7] = v9;
  long long v10 = a2[1];
  v14[0] = *a2;
  v14[1] = v10;
  long long v11 = a2[3];
  void v14[2] = a2[2];
  void v14[3] = v11;
  return sub_25AC6D1E8(v13, v14);
}

uint64_t sub_25AC6CD44(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25AC736E0(*a1, *a2);
}

uint64_t sub_25AC6CD50()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6CE30()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC6CEF8()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6CFD4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC6EFB0();
  *a1 = result;
  return result;
}

void sub_25AC6D004(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1701869940;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x6E6F697461636F6CLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x746E65746E6F63;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x656369766564;
      a1[1] = 0xE600000000000000;
      break;
    case 4:
      *a1 = 1668508013;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC6D0A8()
{
  uint64_t result = 1701869940;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 2:
      uint64_t result = 0x746E65746E6F63;
      break;
    case 3:
      uint64_t result = 0x656369766564;
      break;
    case 4:
      uint64_t result = 1668508013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC6D13C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC6EFB0();
  *a1 = result;
  return result;
}

void sub_25AC6D164(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_25AC6D170(uint64_t a1)
{
  unint64_t v2 = sub_25AC6EC00();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC6D1AC(uint64_t a1)
{
  unint64_t v2 = sub_25AC6EC00();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_25AC6D1E8(void *a1, void *a2)
{
  int v4 = *(unsigned __int8 *)a1;
  int v5 = *(unsigned __int8 *)a2;
  if (v4 == 2)
  {
    if (v5 != 2) {
      return 0;
    }
  }
  else
  {
    if (v5 == 2) {
      return 0;
    }
    if (v4) {
      uint64_t v6 = 0x636973756DLL;
    }
    else {
      uint64_t v6 = 0x6F65646976;
    }
    if (v5) {
      uint64_t v7 = 0x636973756DLL;
    }
    else {
      uint64_t v7 = 0x6F65646976;
    }
    if (v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v8 = sub_25AC8F208();
      swift_bridgeObjectRelease_n();
      BOOL result = 0;
      if ((v8 & 1) == 0) {
        return result;
      }
    }
  }
  uint64_t v10 = a1[1];
  uint64_t v11 = a2[1];
  if (v10 != 1)
  {
    if (v11 == 1) {
      return 0;
    }
    uint64_t v24 = (void *)a1[2];
    unsigned __int8 v25 = (void *)a2[2];
    if (v10)
    {
      uint64_t v26 = (void *)a1[1];
      if (!v11)
      {
        sub_25AC6DB40((uint64_t)v26);
        sub_25AC6DB40(v10);
        sub_25AC6DB40(0);
        goto LABEL_42;
      }
      if ((sub_25AC75A24(v26, (void *)a2[1]) & 1) == 0)
      {
        sub_25AC6DB40(v10);
        uint64_t v27 = v10;
LABEL_28:
        sub_25AC6DB40(v27);
LABEL_29:
        uint64_t v29 = v11;
LABEL_30:
        sub_25AC6DB40(v29);
        swift_bridgeObjectRelease();
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25AC6DB88(v10);
        return 0;
      }
    }
    else if (v11)
    {
      sub_25AC6DB40(0);
      uint64_t v27 = 0;
      goto LABEL_28;
    }
    if (v24)
    {
      if (!v25)
      {
        sub_25AC6DB40(v10);
        sub_25AC6DB40(v10);
        uint64_t v29 = v11;
        goto LABEL_30;
      }
      char v30 = sub_25AC75A24(v24, v25);
      sub_25AC6DB40(v10);
      sub_25AC6DB40(v10);
      sub_25AC6DB40(v11);
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0) {
        goto LABEL_42;
      }
    }
    else
    {
      sub_25AC6DB40(v10);
      sub_25AC6DB40(v10);
      if (v25) {
        goto LABEL_29;
      }
      sub_25AC6DB40(v11);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25AC6DB88(v10);
    goto LABEL_16;
  }
  if (v11 != 1) {
    return 0;
  }
LABEL_16:
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v15 = a1[5];
  uint64_t v14 = a1[6];
  uint64_t v16 = a1[7];
  uint64_t v17 = a1[8];
  uint64_t v19 = a2[3];
  uint64_t v18 = a2[4];
  uint64_t v21 = a2[5];
  uint64_t v20 = a2[6];
  uint64_t v23 = a2[7];
  uint64_t v22 = a2[8];
  if (v12 != 1)
  {
    if (v19 != 1)
    {
      v84[0] = a1[3];
      v84[1] = v13;
      v84[2] = v15;
      v84[3] = v14;
      v84[4] = v16;
      v84[5] = v17;
      v85[0] = v19;
      v85[1] = v18;
      v85[2] = v21;
      v85[3] = v20;
      v85[4] = v23;
      v85[5] = v22;
      uint64_t v57 = v19;
      char v58 = sub_25AC8B814((uint64_t)v84, (uint64_t)v85);
      sub_25AC6D7A8(v12);
      sub_25AC6D7A8(v12);
      sub_25AC6D7A8(v57);
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
      sub_25AC6D830(v12);
      if ((v58 & 1) == 0) {
        return 0;
      }
      goto LABEL_36;
    }
LABEL_25:
    uint64_t v28 = a2[3];
    sub_25AC6D7A8(v12);
    sub_25AC6D7A8(v28);
    sub_25AC6D830(v12);
    sub_25AC6D830(v28);
    return 0;
  }
  if (v19 != 1) {
    goto LABEL_25;
  }
LABEL_36:
  unsigned __int8 v31 = (void *)a1[9];
  unsigned __int8 v32 = (void *)a2[9];
  if (v31 == (void *)1)
  {
    if (v32 != (void *)1) {
      return 0;
    }
  }
  else
  {
    if (v32 == (void *)1) {
      return 0;
    }
    if (v31)
    {
      if (!v32 || (sub_25AC75A24(v31, v32) & 1) == 0) {
        return 0;
      }
    }
    else if (v32)
    {
      return 0;
    }
  }
  uint64_t v33 = a1[10];
  uint64_t v34 = a1[11];
  uint64_t v35 = a1[12];
  uint64_t v36 = a1[13];
  uint64_t v37 = a1[14];
  uint64_t v38 = a1[15];
  uint64_t v39 = a1[16];
  uint64_t v40 = a1[17];
  uint64_t v41 = a1[18];
  uint64_t v42 = a1[19];
  uint64_t v43 = a1[20];
  uint64_t v44 = a1[21];
  uint64_t v46 = a2[10];
  uint64_t v45 = a2[11];
  uint64_t v48 = a2[12];
  uint64_t v47 = a2[13];
  uint64_t v50 = a2[14];
  uint64_t v49 = a2[15];
  uint64_t v52 = a2[16];
  uint64_t v51 = a2[17];
  uint64_t v54 = a2[18];
  uint64_t v53 = a2[19];
  uint64_t v55 = a2[20];
  uint64_t v56 = a2[21];
  if (v33 == 1)
  {
    if (v46 == 1) {
      return 1;
    }
    goto LABEL_55;
  }
  if (v46 == 1)
  {
LABEL_55:
    uint64_t v59 = v33;
    uint64_t v60 = v34;
    uint64_t v61 = v35;
    uint64_t v62 = v36;
    uint64_t v63 = v37;
    uint64_t v64 = v38;
    uint64_t v65 = v39;
    uint64_t v66 = v40;
    uint64_t v67 = v41;
    uint64_t v68 = v42;
    uint64_t v69 = v43;
    uint64_t v70 = v44;
    uint64_t v71 = v46;
    uint64_t v72 = v45;
    uint64_t v73 = v48;
    uint64_t v74 = v47;
    uint64_t v75 = v50;
    uint64_t v76 = v49;
    uint64_t v77 = v52;
    uint64_t v78 = v51;
    uint64_t v79 = v54;
    uint64_t v80 = v53;
    uint64_t v81 = v55;
    uint64_t v82 = v56;
    sub_25AC6D8B4(v33);
    sub_25AC6D8B4(v46);
    sub_25AC6D998(&v59);
    return 0;
  }
  v83[0] = v33;
  v83[1] = v34;
  v83[2] = v35;
  v83[3] = v36;
  v83[4] = v37;
  v83[5] = v38;
  v83[6] = v39;
  v83[7] = v40;
  v83[8] = v41;
  v83[9] = v42;
  v83[10] = v43;
  v83[11] = v44;
  uint64_t v59 = v46;
  uint64_t v60 = v45;
  uint64_t v61 = v48;
  uint64_t v62 = v47;
  uint64_t v63 = v50;
  uint64_t v64 = v49;
  uint64_t v65 = v52;
  uint64_t v66 = v51;
  uint64_t v67 = v54;
  uint64_t v68 = v53;
  uint64_t v69 = v55;
  uint64_t v70 = v56;
  return (sub_25AC805FC((uint64_t)v83, (uint64_t)&v59) & 1) != 0;
}

uint64_t sub_25AC6D7A8(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AC6D830(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC6D8B4(uint64_t result)
{
  if (result != 1)
  {
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
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t *sub_25AC6D998(uint64_t *a1)
{
  uint64_t v3 = a1[12];
  sub_25AC6DA5C(*a1);
  sub_25AC6DA5C(v3);
  return a1;
}

uint64_t sub_25AC6DA5C(uint64_t result)
{
  if (result != 1)
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
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC6DB40(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AC6DB88(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for MusicCriteria(void *a1)
{
  if (a1[1] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[3] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[9] != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[10];
  if (result != 1)
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
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for MusicCriteria(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5 == 1)
  {
    *int v4 = *(_OWORD *)(a2 + 8);
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 24);
  if (v7 == 1)
  {
    long long v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v9;
    uint64_t v11 = *(void *)(a2 + 48);
    uint64_t v12 = *(void *)(a2 + 56);
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = v11;
    uint64_t v13 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v14 = *(void *)(a2 + 72);
  if (v14 != 1) {
    uint64_t v14 = swift_bridgeObjectRetain();
  }
  *(void *)(a1 + 72) = v14;
  uint64_t v15 = *(void *)(a2 + 80);
  if (v15 == 1)
  {
    long long v16 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v16;
    long long v17 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v17;
    long long v18 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v18;
  }
  else
  {
    uint64_t v19 = *(void *)(a2 + 88);
    uint64_t v20 = *(void *)(a2 + 96);
    *(void *)(a1 + 80) = v15;
    *(void *)(a1 + 88) = v19;
    uint64_t v21 = *(void *)(a2 + 104);
    uint64_t v22 = *(void *)(a2 + 112);
    *(void *)(a1 + 96) = v20;
    *(void *)(a1 + 104) = v21;
    uint64_t v23 = *(void *)(a2 + 120);
    uint64_t v24 = *(void *)(a2 + 128);
    *(void *)(a1 + 112) = v22;
    *(void *)(a1 + 120) = v23;
    uint64_t v25 = *(void *)(a2 + 136);
    uint64_t v26 = *(void *)(a2 + 144);
    *(void *)(a1 + 128) = v24;
    *(void *)(a1 + 136) = v25;
    uint64_t v27 = *(void *)(a2 + 152);
    uint64_t v30 = *(void *)(a2 + 160);
    *(void *)(a1 + 144) = v26;
    *(void *)(a1 + 152) = v27;
    uint64_t v28 = *(void *)(a2 + 168);
    *(void *)(a1 + 160) = v30;
    *(void *)(a1 + 168) = v28;
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
  return a1;
}

uint64_t assignWithCopy for MusicCriteria(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 8);
  if (v5 == 1)
  {
    if (v6 != 1)
    {
      *(void *)(a1 + 8) = v6;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 == 1)
  {
    sub_25AC66A24((uint64_t)v4);
LABEL_6:
    *int v4 = *v7;
    goto LABEL_8;
  }
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  long long v8 = (long long *)(a1 + 24);
  uint64_t v10 = (long long *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) == 1)
  {
    if (v9 == 1)
    {
      long long v11 = *v10;
      long long v12 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = v12;
      *long long v8 = v11;
    }
    else
    {
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_25AC6E34C(a1 + 24);
    long long v14 = *(_OWORD *)(a2 + 40);
    long long v13 = *(_OWORD *)(a2 + 56);
    *long long v8 = *v10;
    *(_OWORD *)(a1 + 40) = v14;
    *(_OWORD *)(a1 + 56) = v13;
  }
  else
  {
    *(void *)(a1 + 24) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = (uint64_t *)(a1 + 72);
  uint64_t v16 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) == 1)
  {
    if (v16 == 1)
    {
      uint64_t v17 = 1;
LABEL_20:
      uint64_t *v15 = v17;
      goto LABEL_23;
    }
    uint64_t *v15 = v16;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v16 == 1)
    {
      sub_25AC66ACC(a1 + 72);
      uint64_t v17 = *(void *)(a2 + 72);
      goto LABEL_20;
    }
    uint64_t *v15 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_23:
  long long v18 = (_OWORD *)(a1 + 80);
  uint64_t v20 = (_OWORD *)(a2 + 80);
  uint64_t v19 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80) == 1)
  {
    if (v19 == 1)
    {
      long long v21 = *(_OWORD *)(a2 + 96);
      *long long v18 = *v20;
      *(_OWORD *)(a1 + 96) = v21;
      long long v22 = *(_OWORD *)(a2 + 112);
      long long v23 = *(_OWORD *)(a2 + 128);
      long long v24 = *(_OWORD *)(a2 + 160);
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 160) = v24;
      *(_OWORD *)(a1 + 112) = v22;
      *(_OWORD *)(a1 + 128) = v23;
    }
    else
    {
      *(void *)(a1 + 80) = v19;
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
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
  }
  else if (v19 == 1)
  {
    sub_25AC6E3A0(a1 + 80);
    long long v25 = *(_OWORD *)(a2 + 96);
    *long long v18 = *v20;
    *(_OWORD *)(a1 + 96) = v25;
    long long v26 = *(_OWORD *)(a2 + 160);
    long long v28 = *(_OWORD *)(a2 + 112);
    long long v27 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v26;
    *(_OWORD *)(a1 + 112) = v28;
    *(_OWORD *)(a1 + 128) = v27;
  }
  else
  {
    *(void *)(a1 + 80) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_25AC6E34C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AC6E3A0(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy176_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for MusicCriteria(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = (_OWORD *)(a1 + 8);
  long long v6 = (_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) == 1) {
    goto LABEL_4;
  }
  if (v5 == 1)
  {
    sub_25AC66A24((uint64_t)v4);
LABEL_4:
    *long long v4 = *v6;
    goto LABEL_6;
  }
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v7 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) == 1)
  {
LABEL_9:
    long long v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    sub_25AC6E34C(a1 + 24);
    goto LABEL_9;
  }
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
LABEL_11:
  long long v9 = (uint64_t *)(a1 + 72);
  uint64_t v10 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) == 1)
  {
LABEL_14:
    *long long v9 = v10;
    goto LABEL_16;
  }
  if (v10 == 1)
  {
    sub_25AC66ACC(a1 + 72);
    uint64_t v10 = 1;
    goto LABEL_14;
  }
  *long long v9 = v10;
  swift_bridgeObjectRelease();
LABEL_16:
  uint64_t v11 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80) != 1)
  {
    if (v11 != 1)
    {
      *(void *)(a1 + 80) = v11;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25AC6E3A0(a1 + 80);
  }
  long long v12 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v12;
  long long v13 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v13;
  long long v14 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicCriteria(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *(unsigned char *)(a1 + 176)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 176) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 176) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicCriteria()
{
  return &type metadata for MusicCriteria;
}

uint64_t sub_25AC6E76C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD9F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  long long v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC6EC00();
  sub_25AC8F2A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v43) = 0;
  sub_25AC8F1D8();
  uint64_t v10 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v10 == 1) {
    int v11 = 1;
  }
  else {
    int v11 = 2;
  }
  if (!v10) {
    int v11 = 0;
  }
  int v55 = v11;
  char v56 = 1;
  sub_25AC6EC54();
  sub_25AC8F1E8();
  uint64_t v40 = v44;
  uint64_t v41 = v43;
  char v56 = 2;
  sub_25AC6ECA8();
  sub_25AC8F1E8();
  uint64_t v38 = v44;
  uint64_t v39 = v43;
  uint64_t v36 = v46;
  uint64_t v37 = v45;
  uint64_t v34 = v48;
  uint64_t v35 = v47;
  uint64_t v33 = v49;
  uint64_t v32 = v50;
  uint64_t v31 = v51;
  uint64_t v30 = v52;
  uint64_t v29 = v53;
  uint64_t v28 = v54;
  uint64_t v42 = v6;
  char v56 = 3;
  sub_25AC6ECFC();
  sub_25AC8F1E8();
  uint64_t v27 = v43;
  uint64_t v26 = v44;
  uint64_t v12 = v46;
  uint64_t v25 = v45;
  uint64_t v13 = v47;
  uint64_t v14 = v48;
  char v56 = 4;
  sub_25AC6ED50();
  sub_25AC8F1E8();
  uint64_t v15 = v43;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *(unsigned char *)a2 = v55;
  uint64_t v16 = v40;
  *(void *)(a2 + 8) = v41;
  *(void *)(a2 + 16) = v16;
  uint64_t v17 = v26;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v25;
  *(void *)(a2 + 48) = v12;
  *(void *)(a2 + 56) = v13;
  *(void *)(a2 + 64) = v14;
  uint64_t v18 = v39;
  *(void *)(a2 + 72) = v15;
  *(void *)(a2 + 80) = v18;
  uint64_t v19 = v37;
  *(void *)(a2 + 88) = v38;
  *(void *)(a2 + 96) = v19;
  uint64_t v20 = v35;
  *(void *)(a2 + 104) = v36;
  *(void *)(a2 + 112) = v20;
  uint64_t v21 = v33;
  *(void *)(a2 + 120) = v34;
  *(void *)(a2 + 128) = v21;
  uint64_t v22 = v31;
  *(void *)(a2 + 136) = v32;
  *(void *)(a2 + 144) = v22;
  uint64_t v23 = v29;
  *(void *)(a2 + 152) = v30;
  *(void *)(a2 + 160) = v23;
  *(void *)(a2 + 168) = v28;
  return result;
}

unint64_t sub_25AC6EC00()
{
  unint64_t result = qword_26A4AD9F8;
  if (!qword_26A4AD9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4AD9F8);
  }
  return result;
}

unint64_t sub_25AC6EC54()
{
  unint64_t result = qword_26A4ADA00;
  if (!qword_26A4ADA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA00);
  }
  return result;
}

unint64_t sub_25AC6ECA8()
{
  unint64_t result = qword_26A4ADA08;
  if (!qword_26A4ADA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA08);
  }
  return result;
}

unint64_t sub_25AC6ECFC()
{
  unint64_t result = qword_26A4ADA10;
  if (!qword_26A4ADA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA10);
  }
  return result;
}

unint64_t sub_25AC6ED50()
{
  unint64_t result = qword_26A4ADA18;
  if (!qword_26A4ADA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA18);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MusicCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25AC6EE70);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicCriteria.CodingKeys()
{
  return &type metadata for MusicCriteria.CodingKeys;
}

unint64_t sub_25AC6EEAC()
{
  unint64_t result = qword_26A4ADA20;
  if (!qword_26A4ADA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA20);
  }
  return result;
}

unint64_t sub_25AC6EF04()
{
  unint64_t result = qword_26A4ADA28;
  if (!qword_26A4ADA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA28);
  }
  return result;
}

unint64_t sub_25AC6EF5C()
{
  unint64_t result = qword_26A4ADA30;
  if (!qword_26A4ADA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA30);
  }
  return result;
}

uint64_t sub_25AC6EFB0()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

BOOL static QOSItem.QOSMusicItem.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t QOSItem.QOSMusicItem.hash(into:)()
{
  return sub_25AC8F288();
}

uint64_t _s10QOSToolkit7QOSItemO9QOSTVItemO9hashValueSivg_0()
{
  return sub_25AC8F298();
}

BOOL sub_25AC6F094(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25AC6F0A8()
{
  return sub_25AC8F288();
}

uint64_t sub_25AC6F0D4()
{
  return sub_25AC8F298();
}

uint64_t QOSItem.hash(into:)()
{
  return sub_25AC8F288();
}

BOOL static QOSItem.== infix(_:_:)(unsigned __int8 *a1, char *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if ((v2 & 0x80u) == 0) {
    BOOL v4 = v3 >= 0;
  }
  else {
    BOOL v4 = v3 < 0;
  }
  return v2 == v3 && v4;
}

uint64_t QOSItem.hashValue.getter()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6F1E0()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC6F238()
{
  return sub_25AC8F288();
}

uint64_t sub_25AC6F27C()
{
  return sub_25AC8F298();
}

BOOL sub_25AC6F2D0(unsigned __int8 *a1, char *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if ((v2 & 0x80u) == 0) {
    BOOL v4 = v3 >= 0;
  }
  else {
    BOOL v4 = v3 < 0;
  }
  return v2 == v3 && v4;
}

unint64_t QOSItem.id.getter()
{
  if ((char)*v0 < 0)
  {
    unint64_t result = 0x657079546D657469;
    switch(*v0 & 0x7F)
    {
      case 1:
        unint64_t result = 0x7364497465737361;
        break;
      case 2:
        unint64_t result = 0x5465636976726573;
        break;
      case 3:
        unint64_t result = 0x707954616964656DLL;
        break;
      case 4:
        unint64_t result = 0x6570795479616C70;
        break;
      case 5:
        unint64_t result = 0x6574614379616C70;
        break;
      case 6:
        unint64_t result = 0x726F466F69647561;
        break;
      case 7:
        unint64_t result = 0x6E65526F69647561;
        break;
      case 8:
        unint64_t result = 0x614C64726F636572;
        break;
      case 9:
        unint64_t result = 0x546E6F6974617473;
        break;
      case 0xA:
        unint64_t result = 0xD000000000000014;
        break;
      case 0xB:
        unint64_t result = 0xD000000000000016;
        break;
      case 0xC:
LABEL_6:
        unint64_t result = 0x656C61636F6CLL;
        break;
      default:
        return result;
    }
  }
  else
  {
    unint64_t result = 0x54746E65746E6F63;
    switch(*v0)
    {
      case 1:
        unint64_t result = 0x6449646E617262;
        break;
      case 2:
        unint64_t result = 0x656449616964656DLL;
        break;
      case 3:
        goto LABEL_6;
      default:
        return result;
    }
  }
  return result;
}

uint64_t QOSItem.QOSTVItem.id.getter()
{
  uint64_t result = 0x54746E65746E6F63;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6449646E617262;
      break;
    case 2:
      uint64_t result = 0x656449616964656DLL;
      break;
    case 3:
      uint64_t result = 0x656C61636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t QOSItem.QOSMusicItem.id.getter()
{
  unint64_t result = 0x657079546D657469;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7364497465737361;
      break;
    case 2:
      unint64_t result = 0x5465636976726573;
      break;
    case 3:
      unint64_t result = 0x707954616964656DLL;
      break;
    case 4:
      unint64_t result = 0x6570795479616C70;
      break;
    case 5:
      unint64_t result = 0x6574614379616C70;
      break;
    case 6:
      unint64_t result = 0x726F466F69647561;
      break;
    case 7:
      unint64_t result = 0x6E65526F69647561;
      break;
    case 8:
      unint64_t result = 0x614C64726F636572;
      break;
    case 9:
      unint64_t result = 0x546E6F6974617473;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000016;
      break;
    case 0xC:
      unint64_t result = 0x656C61636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25AC6F7BC()
{
  unint64_t result = qword_26A4ADA38;
  if (!qword_26A4ADA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA38);
  }
  return result;
}

unint64_t sub_25AC6F814()
{
  unint64_t result = qword_26A4ADA40;
  if (!qword_26A4ADA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA40);
  }
  return result;
}

unint64_t sub_25AC6F86C()
{
  unint64_t result = qword_26A4ADA48;
  if (!qword_26A4ADA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA48);
  }
  return result;
}

unint64_t sub_25AC6F8C0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = QOSItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_25AC6F8E8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEB00000000657079;
  uint64_t v3 = 0x54746E65746E6F63;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x6449646E617262;
      goto LABEL_3;
    case 2:
      *a1 = 0x656449616964656DLL;
      a1[1] = 0xEF7265696669746ELL;
      break;
    case 3:
      *a1 = 0x656C61636F6CLL;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_25AC6F994@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = QOSItem.QOSMusicItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for QOSItem(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF) {
    goto LABEL_17;
  }
  if (a2 + 241 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 241) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 241;
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
      return (*a1 | (v4 << 8)) - 241;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 241;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 3) & 0xE | (*a1 >> 7)) ^ 0xF;
  if (v6 >= 0xE) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for QOSItem(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 241 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 241) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE)
  {
    unsigned int v6 = ((a2 - 15) >> 8) + 1;
    *unint64_t result = a2 - 15;
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
        JUMPOUT(0x25AC6FB34);
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
          *unint64_t result = 16 * (((-a2 >> 1) & 7) - 8 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_25AC6FB5C(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

unsigned char *sub_25AC6FB68(unsigned char *result)
{
  *result &= ~0x80u;
  return result;
}

unsigned char *sub_25AC6FB78(unsigned char *result, char a2)
{
  *unint64_t result = *result & 0xF | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for QOSItem()
{
  return &type metadata for QOSItem;
}

unsigned char *storeEnumTagSinglePayload for QOSItem.QOSTVItem(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC6FC68);
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

ValueMetadata *type metadata accessor for QOSItem.QOSTVItem()
{
  return &type metadata for QOSItem.QOSTVItem;
}

uint64_t getEnumTagSinglePayload for QOSItem.QOSMusicItem(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for QOSItem.QOSMusicItem(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x25AC6FDFCLL);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QOSItem.QOSMusicItem()
{
  return &type metadata for QOSItem.QOSMusicItem;
}

void sub_25AC6FE4C(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xED00006C6F72746ELL;
  uint64_t v3 = 0x6F432D6568636143;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEE006874676E654CLL;
      uint64_t v3 = 0x2D746E65746E6F43;
      goto LABEL_3;
    case 2:
      strcpy((char *)a1, "Content-Type");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 3:
      *(void *)a1 = 1702125892;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 4:
      strcpy((char *)a1, "Last-Modified");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    case 5:
      *(void *)a1 = 0xD000000000000011;
      *(void *)(a1 + 8) = 0x800000025AC92600;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t getEnumTagSinglePayload for HTTPHeaderField(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HTTPHeaderField(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25AC700ACLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPHeaderField()
{
  return &type metadata for HTTPHeaderField;
}

unint64_t sub_25AC700E8()
{
  unint64_t result = qword_26A4ADA50;
  if (!qword_26A4ADA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA50);
  }
  return result;
}

void *sub_25AC7013C(char a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD910);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADA58);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AC703D8(a2, (uint64_t)v13, &qword_26A4ADA58);
  uint64_t v14 = sub_25AC8ECF8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    uint64_t v16 = (void *)sub_25AC8ECD8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  objc_msgSend(v4, sel_setTimeZone_, v16);

  sub_25AC703D8(a3, (uint64_t)v10, &qword_26A4AD910);
  uint64_t v17 = sub_25AC8ECB8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) != 1)
  {
    uint64_t v19 = (void *)sub_25AC8EC98();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v17);
  }
  objc_msgSend(v4, sel_setLocale_, v19);

  uint64_t v20 = (void *)sub_25AC8EDC8();
  if (a1) {
    uint64_t v21 = &selRef_setLocalizedDateFormatFromTemplate_;
  }
  else {
    uint64_t v21 = &selRef_setDateFormat_;
  }
  objc_msgSend(v4, *v21, v20);

  return v4;
}

uint64_t sub_25AC703D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_25AC7043C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25AC71FD8(a1, (uint64_t)v11);
  if (!v2)
  {
    long long v5 = v11[11];
    *(_OWORD *)(a2 + 160) = v11[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v11[12];
    *(void *)(a2 + 208) = v12;
    long long v6 = v11[7];
    *(_OWORD *)(a2 + 96) = v11[6];
    *(_OWORD *)(a2 + 112) = v6;
    long long v7 = v11[9];
    *(_OWORD *)(a2 + 128) = v11[8];
    *(_OWORD *)(a2 + 144) = v7;
    long long v8 = v11[3];
    *(_OWORD *)(a2 + 32) = v11[2];
    *(_OWORD *)(a2 + 48) = v8;
    long long v9 = v11[5];
    *(_OWORD *)(a2 + 64) = v11[4];
    *(_OWORD *)(a2 + 80) = v9;
    double result = *(double *)v11;
    long long v10 = v11[1];
    *(_OWORD *)a2 = v11[0];
    *(_OWORD *)(a2 + 16) = v10;
  }
  return result;
}

uint64_t sub_25AC704C8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 176);
  v15[10] = *(_OWORD *)(a1 + 160);
  v15[11] = v2;
  v15[12] = *(_OWORD *)(a1 + 192);
  uint64_t v16 = *(void *)(a1 + 208);
  long long v3 = *(_OWORD *)(a1 + 112);
  v15[6] = *(_OWORD *)(a1 + 96);
  v15[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 144);
  v15[8] = *(_OWORD *)(a1 + 128);
  v15[9] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v15[4] = *(_OWORD *)(a1 + 64);
  v15[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v7;
  long long v8 = *(_OWORD *)(a2 + 176);
  v17[10] = *(_OWORD *)(a2 + 160);
  v17[11] = v8;
  v17[12] = *(_OWORD *)(a2 + 192);
  uint64_t v18 = *(void *)(a2 + 208);
  long long v9 = *(_OWORD *)(a2 + 112);
  v17[6] = *(_OWORD *)(a2 + 96);
  v17[7] = v9;
  long long v10 = *(_OWORD *)(a2 + 144);
  v17[8] = *(_OWORD *)(a2 + 128);
  v17[9] = v10;
  long long v11 = *(_OWORD *)(a2 + 48);
  v17[2] = *(_OWORD *)(a2 + 32);
  v17[3] = v11;
  long long v12 = *(_OWORD *)(a2 + 80);
  v17[4] = *(_OWORD *)(a2 + 64);
  v17[5] = v12;
  long long v13 = *(_OWORD *)(a2 + 16);
  v17[0] = *(_OWORD *)a2;
  v17[1] = v13;
  return sub_25AC70A70((uint64_t)v15, (uint64_t)v17) & 1;
}

uint64_t sub_25AC7057C(unsigned __int8 *a1, char *a2)
{
  return sub_25AC73C14(*a1, *a2);
}

uint64_t sub_25AC70588()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC70668()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC70730()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC7080C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC72D9C();
  *a1 = result;
  return result;
}

void sub_25AC7083C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE900000000000065;
  uint64_t v3 = 0x6D69547472617473;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x656D6954646E65;
      goto LABEL_3;
    case 2:
      *a1 = 0x6169726574697263;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x736567617373656DLL;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC708DC()
{
  uint64_t result = 0x6D69547472617473;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656D6954646E65;
      break;
    case 2:
      uint64_t result = 0x6169726574697263;
      break;
    case 3:
      uint64_t result = 0x736567617373656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC70970@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC72D9C();
  *a1 = result;
  return result;
}

uint64_t sub_25AC70998(uint64_t a1)
{
  unint64_t v2 = sub_25AC72794();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC709D4(uint64_t a1)
{
  unint64_t v2 = sub_25AC72794();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC70A10(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
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

uint64_t sub_25AC70A70(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      goto LABEL_20;
    }
  }
  else
  {
    if (*(double *)a1 != *(double *)a2) {
      char v4 = 1;
    }
    if (v4) {
      goto LABEL_20;
    }
  }
  char v5 = *(unsigned char *)(a2 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      goto LABEL_20;
    }
  }
  else
  {
    if (*(double *)(a1 + 16) != *(double *)(a2 + 16)) {
      char v5 = 1;
    }
    if (v5) {
      goto LABEL_20;
    }
  }
  sub_25AC70DC0(a1 + 32, (uint64_t)v14);
  sub_25AC70DC0(a2 + 32, (uint64_t)v15);
  sub_25AC70DC0((uint64_t)v14, (uint64_t)v16);
  if (sub_25AC70E28((uint64_t)v16) == 1)
  {
    sub_25AC70DC0((uint64_t)v15, (uint64_t)v12);
    if (sub_25AC70E28((uint64_t)v12) == 1) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  sub_25AC70DC0((uint64_t)v15, (uint64_t)v11);
  if (sub_25AC70E28((uint64_t)v11) == 1)
  {
LABEL_17:
    sub_25AC70DC0((uint64_t)v14, (uint64_t)v12);
    sub_25AC70DC0((uint64_t)v15, (uint64_t)&v13);
    sub_25AC71154(v14, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
    sub_25AC71154(v15, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
    sub_25AC70E54((uint64_t)v12);
LABEL_20:
    char v7 = 0;
    return v7 & 1;
  }
  sub_25AC70DC0((uint64_t)v14, (uint64_t)v9);
  v17[8] = v9[8];
  v17[9] = v9[9];
  v17[10] = v9[10];
  v17[4] = v9[4];
  v17[5] = v9[5];
  v17[6] = v9[6];
  v17[7] = v9[7];
  v17[0] = v9[0];
  v17[1] = v9[1];
  v17[2] = v9[2];
  v17[3] = v9[3];
  sub_25AC70DC0((uint64_t)v15, (uint64_t)v10);
  v12[8] = v10[8];
  v12[9] = v10[9];
  v12[10] = v10[10];
  v12[4] = v10[4];
  v12[5] = v10[5];
  v12[6] = v10[6];
  v12[7] = v10[7];
  v12[0] = v10[0];
  v12[1] = v10[1];
  v12[2] = v10[2];
  v12[3] = v10[3];
  sub_25AC71154(v14, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
  sub_25AC71154(v15, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
  BOOL v6 = sub_25AC6D1E8(v17, v12);
  sub_25AC71154(v15, (void (*)(uint64_t, uint64_t))sub_25AC6DB88, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830, (void (*)(uint64_t))sub_25AC71144, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
  sub_25AC71154(v14, (void (*)(uint64_t, uint64_t))sub_25AC6DB88, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830, (void (*)(uint64_t))sub_25AC71144, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
  if (!v6) {
    goto LABEL_20;
  }
LABEL_19:
  char v7 = sub_25AC75AEC(*(void *)(a1 + 208), *(void *)(a2 + 208));
  return v7 & 1;
}

uint64_t sub_25AC70DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADA60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25AC70E28(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 - 1) & ~(((int)v1 - 1) >> 31);
}

uint64_t sub_25AC70E44(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AC70E54(uint64_t a1)
{
  uint64_t v17 = *(void *)(a1 + 184);
  uint64_t v18 = *(void *)(a1 + 176);
  uint64_t v15 = *(void *)(a1 + 200);
  uint64_t v16 = *(void *)(a1 + 192);
  uint64_t v2 = *(void *)(a1 + 216);
  uint64_t v14 = *(void *)(a1 + 208);
  uint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  long long v12 = *(_OWORD *)(a1 + 256);
  long long v13 = *(_OWORD *)(a1 + 240);
  long long v11 = *(_OWORD *)(a1 + 272);
  long long v9 = *(_OWORD *)(a1 + 304);
  long long v10 = *(_OWORD *)(a1 + 288);
  long long v8 = *(_OWORD *)(a1 + 320);
  uint64_t v5 = *(void *)(a1 + 336);
  uint64_t v6 = *(void *)(a1 + 344);
  sub_25AC70FDC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    (void (*)(uint64_t, uint64_t))sub_25AC6DB88,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830,
    (void (*)(uint64_t))sub_25AC71144,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
  sub_25AC70FDC(v18, v17, v16, v15, v14, v2, v3, v4, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v9, *((uint64_t *)&v9 + 1), v8,
    *((uint64_t *)&v8 + 1),
    v5,
    v6,
    (void (*)(uint64_t, uint64_t))sub_25AC6DB88,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830,
    (void (*)(uint64_t))sub_25AC71144,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
  return a1;
}

void sub_25AC70FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t),void (*a24)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),void (*a25)(uint64_t),void (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a2 != 2)
  {
    a23(a2, a3);
    a24(a4, a5, a6, a7, a8, a9);
    a25(a10);
    a26(a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
  }
}

uint64_t sub_25AC71144(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_25AC71154(uint64_t *a1, void (*a2)(uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a4)(uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_25AC70FDC(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a2,
    a3,
    a4,
    a5);
  return a1;
}

uint64_t destroy for MusicIssue(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2 != 1)
  {
    if (v2 == 2) {
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[7] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[13] != 1) {
    swift_bridgeObjectRelease();
  }
  if (a1[14] != 1)
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
  }
LABEL_10:

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicIssue(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = (_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  if (v5 == 2)
  {
    long long v6 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v6;
    *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
    long long v7 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v7;
    long long v8 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v8;
    long long v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *v4;
    *(_OWORD *)(a1 + 48) = v9;
    long long v10 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v10;
  }
  else
  {
    *(unsigned char *)(a1 + 32) = *(unsigned char *)v4;
    if (v5 == 1)
    {
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    }
    else
    {
      uint64_t v11 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v12 = *(void *)(a2 + 56);
    if (v12 == 1)
    {
      long long v13 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = v13;
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    }
    else
    {
      uint64_t v14 = *(void *)(a2 + 64);
      uint64_t v15 = *(void *)(a2 + 72);
      *(void *)(a1 + 56) = v12;
      *(void *)(a1 + 64) = v14;
      uint64_t v16 = *(void *)(a2 + 80);
      uint64_t v17 = *(void *)(a2 + 88);
      *(void *)(a1 + 72) = v15;
      *(void *)(a1 + 80) = v16;
      uint64_t v18 = *(void *)(a2 + 96);
      *(void *)(a1 + 88) = v17;
      *(void *)(a1 + 96) = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v19 = *(void *)(a2 + 104);
    if (v19 != 1) {
      uint64_t v19 = swift_bridgeObjectRetain();
    }
    *(void *)(a1 + 104) = v19;
    uint64_t v20 = *(void *)(a2 + 112);
    if (v20 == 1)
    {
      long long v21 = *(_OWORD *)(a2 + 160);
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 160) = v21;
      long long v22 = *(_OWORD *)(a2 + 192);
      *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
      *(_OWORD *)(a1 + 192) = v22;
      long long v23 = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = v23;
    }
    else
    {
      uint64_t v24 = *(void *)(a2 + 120);
      uint64_t v25 = *(void *)(a2 + 128);
      *(void *)(a1 + 112) = v20;
      *(void *)(a1 + 120) = v24;
      uint64_t v26 = *(void *)(a2 + 136);
      uint64_t v27 = *(void *)(a2 + 144);
      *(void *)(a1 + 128) = v25;
      *(void *)(a1 + 136) = v26;
      uint64_t v28 = *(void *)(a2 + 152);
      uint64_t v29 = *(void *)(a2 + 160);
      *(void *)(a1 + 144) = v27;
      *(void *)(a1 + 152) = v28;
      uint64_t v30 = *(void *)(a2 + 168);
      uint64_t v31 = *(void *)(a2 + 176);
      *(void *)(a1 + 160) = v29;
      *(void *)(a1 + 168) = v30;
      uint64_t v32 = *(void *)(a2 + 184);
      uint64_t v35 = *(void *)(a2 + 192);
      *(void *)(a1 + 176) = v31;
      *(void *)(a1 + 184) = v32;
      uint64_t v33 = *(void *)(a2 + 200);
      *(void *)(a1 + 192) = v35;
      *(void *)(a1 + 200) = v33;
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
  }
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicIssue(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  long long v7 = a2 + 5;
  uint64_t v6 = a2[5];
  long long v8 = (long long *)(a1 + 32);
  long long v9 = (long long *)(a2 + 4);
  long long v10 = (_OWORD *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11 == 2)
  {
    if (v6 == 2)
    {
      long long v12 = *v9;
      long long v13 = *((_OWORD *)a2 + 4);
      *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 64) = v13;
      *long long v8 = v12;
      long long v14 = *((_OWORD *)a2 + 5);
      long long v15 = *((_OWORD *)a2 + 6);
      long long v16 = *((_OWORD *)a2 + 8);
      *(_OWORD *)(a1 + 112) = *((_OWORD *)a2 + 7);
      *(_OWORD *)(a1 + 128) = v16;
      *(_OWORD *)(a1 + 80) = v14;
      *(_OWORD *)(a1 + 96) = v15;
      long long v17 = *((_OWORD *)a2 + 9);
      long long v18 = *((_OWORD *)a2 + 10);
      long long v19 = *((_OWORD *)a2 + 12);
      *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
      *(_OWORD *)(a1 + 192) = v19;
      *(_OWORD *)(a1 + 144) = v17;
      *(_OWORD *)(a1 + 160) = v18;
      goto LABEL_45;
    }
    *(unsigned char *)long long v8 = *(unsigned char *)v9;
    if (*(void *)v7 == 1)
    {
      *long long v10 = *v7;
    }
    else
    {
      *(void *)(a1 + 40) = *(void *)v7;
      *(void *)(a1 + 48) = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v29 = a2[7];
    if (v29 == 1)
    {
      long long v30 = *(_OWORD *)(a2 + 7);
      long long v31 = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
      *(_OWORD *)(a1 + 88) = v31;
      *(_OWORD *)(a1 + 56) = v30;
    }
    else
    {
      *(void *)(a1 + 56) = v29;
      *(void *)(a1 + 64) = a2[8];
      *(void *)(a1 + 72) = a2[9];
      *(void *)(a1 + 80) = a2[10];
      *(void *)(a1 + 88) = a2[11];
      *(void *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v32 = a2[13];
    if (v32 != 1) {
      uint64_t v32 = swift_bridgeObjectRetain();
    }
    *(void *)(a1 + 104) = v32;
    uint64_t v33 = a2[14];
    if (v33 == 1)
    {
      long long v34 = *((_OWORD *)a2 + 8);
      *(_OWORD *)(a1 + 112) = *((_OWORD *)a2 + 7);
      *(_OWORD *)(a1 + 128) = v34;
      long long v35 = *((_OWORD *)a2 + 9);
      long long v36 = *((_OWORD *)a2 + 10);
      long long v37 = *((_OWORD *)a2 + 12);
      *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
      *(_OWORD *)(a1 + 192) = v37;
      *(_OWORD *)(a1 + 144) = v35;
      *(_OWORD *)(a1 + 160) = v36;
      goto LABEL_45;
    }
LABEL_41:
    *(void *)(a1 + 112) = v33;
    *(void *)(a1 + 120) = a2[15];
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = a2[17];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = a2[19];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = a2[21];
    *(void *)(a1 + 176) = a2[22];
    *(void *)(a1 + 184) = a2[23];
    *(void *)(a1 + 192) = a2[24];
    *(void *)(a1 + 200) = a2[25];
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
    goto LABEL_45;
  }
  if (v6 == 2)
  {
    sub_25AC71B94(a1 + 32);
    long long v21 = v9[1];
    long long v20 = v9[2];
    *long long v8 = *v9;
    v8[1] = v21;
    v8[2] = v20;
    long long v22 = v9[6];
    long long v24 = v9[3];
    long long v23 = v9[4];
    v8[5] = v9[5];
    v8[6] = v22;
    v8[3] = v24;
    v8[4] = v23;
    long long v25 = v9[10];
    long long v27 = v9[7];
    long long v26 = v9[8];
    v8[9] = v9[9];
    v8[10] = v25;
    v8[7] = v27;
    v8[8] = v26;
    goto LABEL_45;
  }
  *(unsigned char *)long long v8 = *(unsigned char *)v9;
  uint64_t v28 = *(void *)v7;
  if (v11 == 1)
  {
    if (v28 != 1)
    {
      *(void *)(a1 + 40) = v28;
      *(void *)(a1 + 48) = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (v28 == 1)
  {
    sub_25AC66A24((uint64_t)v10);
LABEL_16:
    *long long v10 = *v7;
    goto LABEL_23;
  }
  *(void *)(a1 + 40) = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_23:
  uint64_t v38 = (long long *)(a1 + 56);
  uint64_t v40 = (long long *)(a2 + 7);
  uint64_t v39 = a2[7];
  if (*(void *)(a1 + 56) == 1)
  {
    if (v39 == 1)
    {
      long long v41 = *v40;
      long long v42 = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
      *(_OWORD *)(a1 + 88) = v42;
      *uint64_t v38 = v41;
    }
    else
    {
      *(void *)(a1 + 56) = v39;
      *(void *)(a1 + 64) = a2[8];
      *(void *)(a1 + 72) = a2[9];
      *(void *)(a1 + 80) = a2[10];
      *(void *)(a1 + 88) = a2[11];
      *(void *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v39 == 1)
  {
    sub_25AC6E34C(a1 + 56);
    long long v44 = *(_OWORD *)(a2 + 9);
    long long v43 = *(_OWORD *)(a2 + 11);
    *uint64_t v38 = *v40;
    *(_OWORD *)(a1 + 72) = v44;
    *(_OWORD *)(a1 + 88) = v43;
  }
  else
  {
    *(void *)(a1 + 56) = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 64) = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 72) = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 80) = a2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 96) = a2[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v45 = (uint64_t *)(a1 + 104);
  uint64_t v46 = a2[13];
  if (*(void *)(a1 + 104) == 1)
  {
    if (v46 == 1)
    {
      uint64_t v47 = 1;
LABEL_35:
      *uint64_t v45 = v47;
      goto LABEL_38;
    }
    *uint64_t v45 = v46;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v46 == 1)
    {
      sub_25AC66ACC(a1 + 104);
      uint64_t v47 = a2[13];
      goto LABEL_35;
    }
    *uint64_t v45 = v46;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_38:
  uint64_t v48 = (_OWORD *)(a1 + 112);
  uint64_t v49 = a2 + 14;
  uint64_t v33 = a2[14];
  if (*(void *)(a1 + 112) == 1)
  {
    if (v33 == 1)
    {
      long long v50 = *((_OWORD *)a2 + 8);
      *uint64_t v48 = *v49;
      *(_OWORD *)(a1 + 128) = v50;
      long long v51 = *((_OWORD *)a2 + 9);
      long long v52 = *((_OWORD *)a2 + 10);
      long long v53 = *((_OWORD *)a2 + 12);
      *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
      *(_OWORD *)(a1 + 192) = v53;
      *(_OWORD *)(a1 + 144) = v51;
      *(_OWORD *)(a1 + 160) = v52;
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  if (v33 == 1)
  {
    sub_25AC6E3A0(a1 + 112);
    long long v54 = *((_OWORD *)a2 + 8);
    *uint64_t v48 = *v49;
    *(_OWORD *)(a1 + 128) = v54;
    long long v55 = *((_OWORD *)a2 + 12);
    long long v57 = *((_OWORD *)a2 + 9);
    long long v56 = *((_OWORD *)a2 + 10);
    *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
    *(_OWORD *)(a1 + 192) = v55;
    *(_OWORD *)(a1 + 144) = v57;
    *(_OWORD *)(a1 + 160) = v56;
  }
  else
  {
    *(void *)(a1 + 112) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 120) = a2[15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 128) = a2[16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 136) = a2[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 144) = a2[18];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 152) = a2[19];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 160) = a2[20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 168) = a2[21];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 176) = a2[22];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 184) = a2[23];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 192) = a2[24];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 200) = a2[25];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_45:
  *(void *)(a1 + 208) = a2[26];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25AC71B94(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy216_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  __n128 result = *(__n128 *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 192);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for MusicIssue(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  long long v4 = (_OWORD *)(a1 + 32);
  long long v5 = (_OWORD *)(a2 + 32);
  long long v7 = (_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 2) {
    goto LABEL_4;
  }
  long long v9 = (_OWORD *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 40);
  if (v8 == 2)
  {
    sub_25AC71B94((uint64_t)v4);
LABEL_4:
    long long v10 = v5[9];
    v4[8] = v5[8];
    v4[9] = v10;
    v4[10] = v5[10];
    long long v11 = v5[5];
    v4[4] = v5[4];
    v4[5] = v11;
    long long v12 = v5[7];
    v4[6] = v5[6];
    v4[7] = v12;
    long long v13 = v5[1];
    *long long v4 = *v5;
    v4[1] = v13;
    long long v14 = v5[3];
    v4[2] = v5[2];
    v4[3] = v14;
    goto LABEL_25;
  }
  *(unsigned char *)long long v4 = *(unsigned char *)v5;
  if (v6 == 1) {
    goto LABEL_8;
  }
  if (v8 == 1)
  {
    sub_25AC66A24((uint64_t)v7);
LABEL_8:
    *long long v7 = *v9;
    goto LABEL_10;
  }
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
LABEL_10:
  uint64_t v15 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) == 1)
  {
LABEL_13:
    long long v16 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v16;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    goto LABEL_15;
  }
  if (v15 == 1)
  {
    sub_25AC6E34C(a1 + 56);
    goto LABEL_13;
  }
  *(void *)(a1 + 56) = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
LABEL_15:
  long long v17 = (uint64_t *)(a1 + 104);
  uint64_t v18 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104) != 1)
  {
    if (v18 != 1)
    {
      *long long v17 = v18;
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    sub_25AC66ACC(a1 + 104);
    uint64_t v18 = 1;
  }
  *long long v17 = v18;
LABEL_20:
  uint64_t v19 = *(void *)(a2 + 112);
  if (*(void *)(a1 + 112) != 1)
  {
    if (v19 != 1)
    {
      *(void *)(a1 + 112) = v19;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 192) = *(void *)(a2 + 192);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    sub_25AC6E3A0(a1 + 112);
  }
  long long v20 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v20;
  long long v21 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v21;
  long long v22 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v22;
LABEL_25:
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicIssue(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 216)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 208);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicIssue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 216) = 1;
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
      *(void *)(result + 208) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 216) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicIssue()
{
  return &type metadata for MusicIssue;
}

uint64_t *sub_25AC71FD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v78 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADA68);
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  long long v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v74 = 0;
  BYTE8(v74) = 1;
  *(void *)&long long v75 = 0;
  BYTE8(v75) = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC72794();
  sub_25AC8F2A8();
  if (v2) {
    return (uint64_t *)__swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v43 = v5;
  LOBYTE(v58) = 0;
  sub_25AC8F1D8();
  uint64_t v10 = v9;
  *(void *)&long long v44 = 0;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  *(&v42 - 2) = &v44;
  if ((v10 & 0x1000000000000000) != 0 || !(v10 & 0x2000000000000000 | v12 & 0x1000000000000000))
  {
    sub_25AC8F148();
    swift_bridgeObjectRelease();
    long long v17 = v7;
  }
  else
  {
    MEMORY[0x270FA5388](v11);
    *(&v42 - 2) = sub_25AC72AAC;
    *(&v42 - 1) = v14;
    if ((v10 & 0x2000000000000000) != 0)
    {
      *(void *)&long long v58 = v13;
      *((void *)&v58 + 1) = v10 & 0xFFFFFFFFFFFFFFLL;
      if v13 <= 0x20u && ((0x100003E01uLL >> v13))
      {
        BOOL v19 = 0;
        long long v17 = v7;
      }
      else
      {
        uint64_t v18 = (unsigned char *)_swift_stdlib_strtod_clocale();
        long long v17 = v7;
        if (v18) {
          BOOL v19 = *v18 == 0;
        }
        else {
          BOOL v19 = 0;
        }
      }
      LOBYTE(v73[0]) = v19;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v13 & 0x1000000000000000) != 0)
      {
        uint64_t v15 = (v10 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        long long v42 = &v42 - 4;
        uint64_t v15 = sub_25AC8F168();
      }
      long long v17 = v7;
      LOBYTE(v73[0]) = sub_25AC70A10(v15, v16, (void (*)(uint64_t *__return_ptr))sub_25AC72AC4) & 1;
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v21 = v43;
  uint64_t v20 = v44;
  if (!LOBYTE(v73[0])) {
    uint64_t v20 = 0;
  }
  *(void *)&long long v74 = v20;
  BYTE8(v74) = LOBYTE(v73[0]) ^ 1;
  LOBYTE(v58) = 1;
  uint64_t v22 = sub_25AC8F1D8();
  uint64_t v24 = v23;
  *(void *)&long long v44 = 0;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  *(&v42 - 2) = &v44;
  if ((v24 & 0x1000000000000000) != 0 || !(v24 & 0x2000000000000000 | v26 & 0x1000000000000000))
  {
    sub_25AC8F148();
    swift_bridgeObjectRelease();
  }
  else
  {
    MEMORY[0x270FA5388](v25);
    *(&v42 - 2) = sub_25AC72AAC;
    *(&v42 - 1) = v28;
    if ((v24 & 0x2000000000000000) != 0)
    {
      *(void *)&long long v58 = v27;
      *((void *)&v58 + 1) = v24 & 0xFFFFFFFFFFFFFFLL;
      BOOL v32 = (v27 > 0x20u || ((0x100003E01uLL >> v27) & 1) == 0)
         && (long long v31 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
         && *v31 == 0;
      LOBYTE(v73[0]) = v32;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v27 & 0x1000000000000000) != 0)
      {
        uint64_t v29 = (v24 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v30 = v27 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        long long v42 = &v42 - 4;
        uint64_t v29 = sub_25AC8F168();
      }
      LOBYTE(v73[0]) = sub_25AC70A10(v29, v30, (void (*)(uint64_t *__return_ptr))sub_25AC72AC4) & 1;
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = v43;
  }
  uint64_t v33 = v44;
  if (!LOBYTE(v73[0])) {
    uint64_t v33 = 0;
  }
  uint64_t v34 = v78;
  *(void *)&long long v75 = v33;
  BYTE8(v75) = LOBYTE(v73[0]) ^ 1;
  char v72 = 2;
  sub_25AC727E8();
  sub_25AC8F1E8();
  long long v52 = v66;
  long long v53 = v67;
  long long v54 = v68;
  long long v48 = v62;
  long long v49 = v63;
  long long v50 = v64;
  long long v51 = v65;
  long long v44 = v58;
  long long v45 = v59;
  long long v46 = v60;
  long long v47 = v61;
  nullsub_1(&v44);
  sub_25AC70DC0((uint64_t)&v44, (uint64_t)v73);
  sub_25AC70DC0((uint64_t)v73, (uint64_t)v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADA80);
  LOBYTE(v44) = 3;
  sub_25AC71154(v73, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
  sub_25AC72864();
  sub_25AC8F1E8();
  uint64_t v35 = v58;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v4);
  uint64_t v77 = v35;
  *(void *)&long long v44 = v74;
  BYTE8(v44) = BYTE8(v74);
  *(void *)&long long v45 = v75;
  BYTE8(v45) = BYTE8(v75);
  sub_25AC70DC0((uint64_t)v73, (uint64_t)&v46);
  uint64_t v57 = v35;
  sub_25AC7292C((uint64_t *)&v44);
  sub_25AC71154(v73, (void (*)(uint64_t, uint64_t))sub_25AC6DB88, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830, (void (*)(uint64_t))sub_25AC71144, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v68 = v76[8];
  long long v69 = v76[9];
  long long v70 = v76[10];
  uint64_t v71 = v77;
  long long v64 = v76[4];
  long long v65 = v76[5];
  long long v66 = v76[6];
  long long v67 = v76[7];
  long long v60 = v76[0];
  long long v61 = v76[1];
  long long v62 = v76[2];
  long long v63 = v76[3];
  long long v58 = v74;
  long long v59 = v75;
  __n128 result = sub_25AC729EC((uint64_t *)&v58);
  long long v36 = v55;
  *(_OWORD *)(v34 + 160) = v54;
  *(_OWORD *)(v34 + 176) = v36;
  *(_OWORD *)(v34 + 192) = v56;
  *(void *)(v34 + 208) = v57;
  long long v37 = v51;
  *(_OWORD *)(v34 + 96) = v50;
  *(_OWORD *)(v34 + 112) = v37;
  long long v38 = v53;
  *(_OWORD *)(v34 + 128) = v52;
  *(_OWORD *)(v34 + 144) = v38;
  long long v39 = v47;
  *(_OWORD *)(v34 + 32) = v46;
  *(_OWORD *)(v34 + 48) = v39;
  long long v40 = v49;
  *(_OWORD *)(v34 + 64) = v48;
  *(_OWORD *)(v34 + 80) = v40;
  long long v41 = v45;
  *(_OWORD *)uint64_t v34 = v44;
  *(_OWORD *)(v34 + 16) = v41;
  return result;
}

unint64_t sub_25AC72794()
{
  unint64_t result = qword_26A4ADA70;
  if (!qword_26A4ADA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA70);
  }
  return result;
}

unint64_t sub_25AC727E8()
{
  unint64_t result = qword_26A4ADA78;
  if (!qword_26A4ADA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA78);
  }
  return result;
}

double sub_25AC7283C(_OWORD *a1)
{
  double result = 0.0;
  *a1 = xmmword_25AC90000;
  a1[1] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  return result;
}

unint64_t sub_25AC72864()
{
  unint64_t result = qword_26A4ADA88;
  if (!qword_26A4ADA88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4ADA80);
    sub_25AC728D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA88);
  }
  return result;
}

unint64_t sub_25AC728D8()
{
  unint64_t result = qword_26A4ADA90;
  if (!qword_26A4ADA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA90);
  }
  return result;
}

uint64_t *sub_25AC7292C(uint64_t *a1)
{
  sub_25AC70FDC(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20], a1[21], a1[22],
    a1[23],
    a1[24],
    a1[25],
    (void (*)(uint64_t, uint64_t))sub_25AC6DB40,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8,
    (void (*)(uint64_t))sub_25AC70E44,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_25AC729EC(uint64_t *a1)
{
  sub_25AC70FDC(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20], a1[21], a1[22],
    a1[23],
    a1[24],
    a1[25],
    (void (*)(uint64_t, uint64_t))sub_25AC6DB88,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830,
    (void (*)(uint64_t))sub_25AC71144,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_25AC72AAC@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_25AC72ADC(a1, a2);
}

void *sub_25AC72AC4@<X0>(unsigned char *a1@<X8>)
{
  return sub_25AC72B4C(a1);
}

unsigned char *sub_25AC72ADC@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_25AC72B4C@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MusicIssue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC72C5CLL);
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

ValueMetadata *type metadata accessor for MusicIssue.CodingKeys()
{
  return &type metadata for MusicIssue.CodingKeys;
}

unint64_t sub_25AC72C98()
{
  unint64_t result = qword_26A4ADA98;
  if (!qword_26A4ADA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADA98);
  }
  return result;
}

unint64_t sub_25AC72CF0()
{
  unint64_t result = qword_26A4ADAA0;
  if (!qword_26A4ADAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADAA0);
  }
  return result;
}

unint64_t sub_25AC72D48()
{
  unint64_t result = qword_26A4ADAA8;
  if (!qword_26A4ADAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADAA8);
  }
  return result;
}

uint64_t sub_25AC72D9C()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25AC72DEC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEA0000000000656CLL;
  uint64_t v3 = 0x746954726F727265;
  uint64_t v4 = a1;
  uint64_t v5 = 0x746954726F727265;
  unint64_t v6 = 0xEA0000000000656CLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x73654D726F727265;
      unint64_t v6 = 0xEC00000065676173;
      break;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x6169726574697263;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEC00000065676173;
      if (v5 == 0x73654D726F727265) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x656C61636F6CLL;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x6169726574697263) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC72F8C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC000000796C696DLL;
  uint64_t v3 = 0x6146656369766564;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6146656369766564;
  unint64_t v6 = 0xEC000000796C696DLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x614E656369766564;
      unint64_t v6 = 0xEA0000000000656DLL;
      break;
    case 2:
      uint64_t v5 = 0x6F4D656369766564;
      unint64_t v6 = 0xEB000000006C6564;
      break;
    case 3:
      uint64_t v5 = 0x6973726556707061;
      unint64_t v6 = 0xEA00000000006E6FLL;
      break;
    case 4:
      uint64_t v5 = 0x6F6973726556736FLL;
      unint64_t v6 = 0xE90000000000006ELL;
      break;
    case 5:
      unint64_t v6 = 0xE200000000000000;
      uint64_t v5 = 29551;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEA0000000000656DLL;
      if (v5 == 0x614E656369766564) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xEB000000006C6564;
      if (v5 != 0x6F4D656369766564) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v2 = 0xEA00000000006E6FLL;
      if (v5 != 0x6973726556707061) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v3 = 0x6F6973726556736FLL;
      unint64_t v2 = 0xE90000000000006ELL;
      goto LABEL_15;
    case 5:
      unint64_t v2 = 0xE200000000000000;
      if (v5 != 29551) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC731C0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB00000000657079;
  uint64_t v3 = 0x54746E65746E6F63;
  uint64_t v4 = a1;
  uint64_t v5 = 0x54746E65746E6F63;
  unint64_t v6 = 0xEB00000000657079;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x6449646E617262;
      break;
    case 2:
      uint64_t v5 = 0x4965636976726573;
      unint64_t v6 = 0xE900000000000064;
      break;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x64496D616461;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      if (v5 == 0x6449646E617262) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v3 = 0x4965636976726573;
      unint64_t v2 = 0xE900000000000064;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xE600000000000000;
      if (v5 == 0x64496D616461) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC73360(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC000000796C696DLL;
  uint64_t v3 = 0x6146656369766564;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6146656369766564;
  unint64_t v6 = 0xEC000000796C696DLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x614E656369766564;
      unint64_t v6 = 0xEA0000000000656DLL;
      break;
    case 2:
      uint64_t v5 = 0x6F4D656369766564;
      unint64_t v6 = 0xEB000000006C6564;
      break;
    case 3:
      uint64_t v5 = 0x6973726556707061;
      unint64_t v6 = 0xEA00000000006E6FLL;
      break;
    case 4:
      uint64_t v5 = 0x726556736A736C68;
      unint64_t v6 = 0xEC0000006E6F6973;
      break;
    case 5:
      uint64_t v5 = 0x657261776D726966;
      unint64_t v6 = 0xEF6E6F6973726556;
      break;
    case 6:
      uint64_t v5 = 0x6F6973726556736FLL;
      unint64_t v6 = 0xE90000000000006ELL;
      break;
    case 7:
      unint64_t v6 = 0xE200000000000000;
      uint64_t v5 = 29551;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEA0000000000656DLL;
      if (v5 == 0x614E656369766564) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v2 = 0xEB000000006C6564;
      if (v5 != 0x6F4D656369766564) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v2 = 0xEA00000000006E6FLL;
      if (v5 != 0x6973726556707061) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v2 = 0xEC0000006E6F6973;
      if (v5 != 0x726556736A736C68) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v2 = 0xEF6E6F6973726556;
      if (v5 != 0x657261776D726966) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      uint64_t v3 = 0x6F6973726556736FLL;
      unint64_t v2 = 0xE90000000000006ELL;
      goto LABEL_21;
    case 7:
      unint64_t v2 = 0xE200000000000000;
      if (v5 != 29551) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v3) {
        goto LABEL_25;
      }
LABEL_22:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC7363C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6574617473;
  }
  else {
    uint64_t v3 = 0x7972746E756F63;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6574617473;
  }
  else {
    uint64_t v5 = 0x7972746E756F63;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25AC8F208();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25AC736E4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1735290739;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1735290739;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6F65646976;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6D75626C61;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6E6F6974617473;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7473696C79616C70;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x6F65646976) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6D75626C61) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x6E6F6974617473;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x7473696C79616C70) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC73890(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x656C746974;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x656C746974;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 2036625250;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x657079546D657469;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x656C61636F6CLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 2036625250) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x657079546D657469;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x656C61636F6CLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC73A00(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x636973756DLL;
  }
  else {
    uint64_t v2 = 0x6F65646976;
  }
  if (a2) {
    uint64_t v3 = 0x636973756DLL;
  }
  else {
    uint64_t v3 = 0x6F65646976;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25AC8F208();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25AC73A78(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701869940;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1701869940;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x6E6F697461636F6CLL;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x746E65746E6F63;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x656369766564;
      break;
    case 4:
      uint64_t v5 = 1668508013;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x6E6F697461636F6CLL) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x746E65746E6F63) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x656369766564;
      goto LABEL_12;
    case 4:
      if (v5 != 1668508013) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC73C14(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000065;
  uint64_t v3 = 0x6D69547472617473;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6D69547472617473;
  unint64_t v6 = 0xE900000000000065;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x656D6954646E65;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x6169726574697263;
      break;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x736567617373656DLL;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      if (v5 == 0x656D6954646E65) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x6169726574697263;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x736567617373656DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25AC8F208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25AC73DAC(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25AC8EC78();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v100 - v11;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
  unint64_t v13 = sub_25AC75F18(0x80u);
  if ((v14 & 1) == 0 || !*(void *)(*(void *)(*(void *)(a1 + 56) + 8 * v13) + 16)) {
    goto LABEL_6;
  }
  uint64_t v15 = sub_25AC8EE38();
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  int v18 = sub_25AC65B2C();
  if (v18 == 5)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    (*(void (**)(void, unint64_t, unint64_t))(v3 + 56))(0, 0xD00000000000001BLL, 0x800000025AC926F0);
LABEL_7:
    BOOL v19 = *(void (**)(void))(v3 + 72);
    sub_25AC75210((uint64_t)&v158);
    sub_25AC77BAC((uint64_t)&v158, (uint64_t)&v180, &qword_26A4ADAB8);
    sub_25AC77050(a1, (uint64_t)&v180, (uint64_t)objc_msgSend(a2, sel_code), 1);
    v19();
    uint64_t v20 = swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v3 + 88))(v20);
  }
  int v124 = v18;
  uint64_t v123 = v15;
  if (!*(void *)(a1 + 16)
    || (unint64_t v23 = sub_25AC75F18(0x8Cu), (v24 & 1) == 0)
    || (uint64_t v25 = *(void **)(*(void *)(a1 + 56) + 8 * v23), !v25[2]))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(void, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000012, 0x800000025AC92710);
    goto LABEL_7;
  }
  uint64_t v26 = v25[5];
  uint64_t v104 = v25[4];
  uint64_t v27 = qword_26A4AD860;
  uint64_t v110 = v17;
  uint64_t v111 = v26;
  swift_bridgeObjectRetain();
  if (v27 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_25AC8EBC8();
  v125 = (long long *)v29;
  uint64_t v126 = v28;
  v122 = (void *)sub_25AC6550C(v124);
  uint64_t v31 = v30;
  BOOL v32 = (objc_class *)type metadata accessor for QOSAlertMessage();
  uint64_t v33 = (char *)objc_allocWithZone(v32);
  uint64_t v34 = (uint64_t *)&v33[OBJC_IVAR___QOSAlertMessageInternal_title];
  uint64_t v35 = (uint64_t)v125;
  *uint64_t v34 = v126;
  v34[1] = v35;
  long long v36 = &v33[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(void *)long long v36 = v122;
  *((void *)v36 + 1) = v31;
  v157.receiver = v33;
  Class v103 = v32;
  v157.super_class = v32;
  id v21 = objc_msgSendSuper2(&v157, sel_init);
  sub_25AC7799C(v3 + 104, (uint64_t)&v180);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAC8);
  type metadata accessor for MusicIssuesService();
  if (!swift_dynamicCast()
    || (uint64_t v106 = *(void *)(v158 + 112), swift_bridgeObjectRetain(), swift_release(), !v106))
  {
LABEL_55:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(void, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000012, 0x800000025AC92770);
    v84 = *(void (**)(uint64_t))(v3 + 72);
    sub_25AC75210((uint64_t)&v158);
    sub_25AC77BAC((uint64_t)&v158, (uint64_t)&v180, &qword_26A4ADAB8);
LABEL_56:
    uint64_t v85 = sub_25AC77050(a1, (uint64_t)&v180, (uint64_t)objc_msgSend(a2, sel_code, v100), 1);
    goto LABEL_57;
  }
  uint64_t v107 = *(void *)(v106 + 16);
  if (!v107)
  {
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  uint64_t v109 = v106 + 32;
  uint64_t v37 = v106;
  swift_bridgeObjectRetain_n();
  long long v38 = *(_OWORD *)(v37 + 208);
  long long v168 = *(_OWORD *)(v37 + 192);
  long long v169 = v38;
  long long v170 = *(_OWORD *)(v37 + 224);
  uint64_t v171 = *(void *)(v37 + 240);
  long long v39 = *(_OWORD *)(v37 + 144);
  long long v164 = *(_OWORD *)(v37 + 128);
  long long v165 = v39;
  long long v40 = *(_OWORD *)(v37 + 176);
  long long v166 = *(_OWORD *)(v37 + 160);
  long long v167 = v40;
  long long v41 = *(_OWORD *)(v37 + 80);
  long long v160 = *(_OWORD *)(v37 + 64);
  long long v161 = v41;
  long long v42 = *(_OWORD *)(v37 + 112);
  long long v162 = *(_OWORD *)(v37 + 96);
  long long v163 = v42;
  long long v43 = *(_OWORD *)(v37 + 32);
  long long v44 = *(_OWORD *)(v37 + 48);
  uint64_t v45 = v109;
  long long v158 = v43;
  long long v159 = v44;
  v100 = (void (**)(char *, uint64_t))(v7 + 8);
  v101 = (void (**)(char *, char *, uint64_t))(v7 + 16);
  v125 = &v160;
  uint64_t v126 = 1;
  unint64_t v105 = 0x800000025AC927B0;
  long long v102 = xmmword_25AC90C90;
  uint64_t v46 = v107;
  while (1)
  {
    sub_25AC77BAC((uint64_t)v125, (uint64_t)v156, &qword_26A4ADA60);
    if (sub_25AC70E28((uint64_t)v156) != 1 && v156[0] != 2) {
      break;
    }
LABEL_31:
    if (v126 == v46)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_25AC75210((uint64_t)&v158);
      sub_25AC77BAC((uint64_t)&v158, (uint64_t)&v180, &qword_26A4ADAB8);
      (*(void (**)(void, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000017, 0x800000025AC92790);
      v84 = *(void (**)(uint64_t))(v3 + 72);
      goto LABEL_56;
    }
    long long v50 = (long long *)(v45 + 216 * v126);
    long long v51 = v50[1];
    long long v158 = *v50;
    long long v159 = v51;
    long long v52 = v50[2];
    long long v53 = v50[3];
    long long v54 = v50[5];
    long long v162 = v50[4];
    long long v163 = v54;
    long long v160 = v52;
    long long v161 = v53;
    long long v55 = v50[6];
    long long v56 = v50[7];
    long long v57 = v50[9];
    long long v166 = v50[8];
    long long v167 = v57;
    long long v164 = v55;
    long long v165 = v56;
    long long v58 = v50[10];
    long long v59 = v50[11];
    long long v60 = v50[12];
    uint64_t v171 = *((void *)v50 + 26);
    long long v169 = v59;
    long long v170 = v60;
    long long v168 = v58;
    ++v126;
  }
  if (v156[0])
  {
    sub_25AC7292C((uint64_t *)&v158);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v47 = sub_25AC8F208();
    sub_25AC7292C((uint64_t *)&v158);
    swift_bridgeObjectRelease();
    if ((v47 & 1) == 0)
    {
LABEL_22:
      sub_25AC729EC((uint64_t *)&v158);
LABEL_30:
      uint64_t v45 = v109;
      goto LABEL_31;
    }
  }
  sub_25AC77BAC((uint64_t)v125, (uint64_t)&v142, &qword_26A4ADA60);
  v179[0] = v144;
  uint64_t v112 = v145;
  uint64_t v113 = v154;
  v179[1] = v145;
  uint64_t v121 = v147;
  v122 = (void *)v146;
  v179[2] = v146;
  v179[3] = v147;
  uint64_t v119 = v149;
  unint64_t v120 = v148;
  v179[4] = v148;
  v179[5] = v149;
  uint64_t v117 = v151;
  uint64_t v118 = v150;
  v179[6] = v150;
  v179[7] = v151;
  uint64_t v115 = v153;
  uint64_t v116 = v152;
  v179[8] = v152;
  v179[9] = v153;
  v179[10] = v154;
  uint64_t v48 = v155;
  v179[11] = v155;
  uint64_t v114 = v144;
  if (v144 == 1) {
    goto LABEL_28;
  }
  v179[12] = v114;
  v179[13] = v112;
  v179[14] = v122;
  v179[15] = v121;
  v179[16] = v120;
  v179[17] = v119;
  v179[18] = v118;
  v179[19] = v117;
  v179[20] = v116;
  v179[21] = v115;
  v179[22] = v113;
  v179[23] = v155;
  sub_25AC76CBC(a1, v172);
  char v49 = sub_25AC7EE00(v172);
  sub_25AC77A00((uint64_t)v172);
  if ((v49 & 1) == 0)
  {
LABEL_28:
    (*(void (**)(void, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000011, v105);
    sub_25AC76CBC(a1, v173);
    uint64_t v108 = v48;
    sub_25AC6D8B4(v114);
    sub_25AC75238((uint64_t)v179, v173);
    sub_25AC77A00((uint64_t)v173);
    sub_25AC6DA5C(v114);
    goto LABEL_29;
  }
  if (v143 == 1)
  {
LABEL_27:
    (*(void (**)(void, uint64_t, unint64_t))(v3 + 56))(0, 0x206373696D206F4ELL, 0xEE002E686374616DLL);
LABEL_29:
    sub_25AC729EC((uint64_t *)&v158);
    uint64_t v46 = v107;
    goto LABEL_30;
  }
  v122 = (void *)v143;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAD0);
  uint64_t v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = v102;
  id v180 = objc_msgSend(a2, sel_code);
  *(void *)(v61 + 32) = sub_25AC8F1F8();
  long long v62 = v122;
  *(void *)(v61 + 40) = v63;
  if (v62)
  {
    uint64_t v119 = v61;
    uint64_t v64 = v62[2];
    if (v64)
    {
      uint64_t v116 = v61 + 32;
      uint64_t v117 = v64;
      unint64_t v120 = v62[4];
      uint64_t v118 = v62[5];
      uint64_t v65 = (uint64_t)v62;
      sub_25AC70E44((uint64_t)v62);
      unint64_t v66 = *(void *)(v119 + 40);
      uint64_t v121 = *(void *)(v119 + 32);
      swift_bridgeObjectRetain();
      sub_25AC70E44(v65);
      swift_bridgeObjectRetain();
      unint64_t v67 = v118;
      swift_bridgeObjectRetain();
      uint64_t v68 = v120;
      unint64_t v120 = v66;
      LOBYTE(v66) = sub_25AC68508(v68, v67, v121, v66);
      swift_bridgeObjectRelease();
      if ((v66 & 1) == 0)
      {
        uint64_t v69 = v117 - 1;
        if (v117 == 1)
        {
LABEL_37:
          uint64_t v70 = (uint64_t)v122;
          sub_25AC71144((uint64_t)v122);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_25AC71144(v70);
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          goto LABEL_27;
        }
        unint64_t v71 = v122[7];
        uint64_t v118 = v122[6];
        swift_bridgeObjectRetain();
        LODWORD(v118) = sub_25AC68508(v118, v71, v121, v120);
        swift_bridgeObjectRelease();
        if ((v118 & 1) == 0)
        {
          char v72 = v122 + 9;
          while (--v69)
          {
            unint64_t v73 = *v72;
            uint64_t v117 = *(v72 - 1);
            uint64_t v118 = (uint64_t)(v72 + 2);
            swift_bridgeObjectRetain();
            LODWORD(v117) = sub_25AC68508(v117, v73, v121, v120);
            swift_bridgeObjectRelease();
            char v72 = (unint64_t *)v118;
            if (v117) {
              goto LABEL_44;
            }
          }
          goto LABEL_37;
        }
      }
LABEL_44:
      uint64_t v74 = (uint64_t)v122;
      sub_25AC71144((uint64_t)v122);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25AC71144(v74);
    }
  }
  swift_bridgeObjectRelease();
  v122 = (void *)v159;
  char v75 = BYTE8(v159);
  if ((BYTE8(v158) & 1) == 0 && (BYTE8(v159) & 1) == 0)
  {
    double v76 = *(double *)&v158;
    sub_25AC8EC68();
    sub_25AC8EC48();
    double v78 = v77 * 1000.0;
    (*v101)(v10, v12, v6);
    if (v76 <= v78)
    {
      double v80 = *(double *)&v122;
      sub_25AC8EC48();
      double v82 = v81 * 1000.0;
      v83 = *v100;
      (*v100)(v10, v6);
      v83(v12, v6);
      uint64_t v46 = v107;
      if (v82 < v80)
      {
        char v75 = 0;
        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v79 = *v100;
      (*v100)(v10, v6);
      v79(v12, v6);
      uint64_t v46 = v107;
    }
    goto LABEL_22;
  }
  (*(void (**)(void, unint64_t, unint64_t))(v3 + 56))(0, 0xD00000000000001BLL, 0x800000025AC927D0);
LABEL_59:
  swift_bridgeObjectRelease_n();
  uint64_t v86 = v104;
  uint64_t v87 = v111;
  sub_25AC68968(v171, v104, v111, v124, v174);
  sub_25AC77BAC((uint64_t)v174, (uint64_t)v175, &qword_26A4ADAD8);
  if (*((void *)&v175[0] + 1))
  {
    v177[0] = v175[0];
    v177[1] = v175[1];
    v177[2] = v175[2];
    uint64_t v178 = v176;
    swift_bridgeObjectRelease();
    v88 = *(void (**)(uint64_t))(v3 + 72);
    long long v138 = v168;
    long long v139 = v169;
    long long v140 = v170;
    uint64_t v141 = v171;
    long long v134 = v164;
    long long v135 = v165;
    long long v136 = v166;
    long long v137 = v167;
    long long v130 = v160;
    long long v131 = v161;
    long long v132 = v162;
    long long v133 = v163;
    long long v128 = v158;
    long long v129 = v159;
    nullsub_1(&v128);
    sub_25AC77BAC((uint64_t)&v128, (uint64_t)&v180, &qword_26A4ADAB8);
    sub_25AC7292C((uint64_t *)&v158);
    uint64_t v89 = sub_25AC77050(a1, (uint64_t)&v180, (uint64_t)objc_msgSend(a2, sel_code), 0);
    sub_25AC729EC((uint64_t *)&v158);
    v88(v89);
    swift_bridgeObjectRelease();
    unint64_t v90 = sub_25AC74CA4((uint64_t)v177, v86, v87, (uint64_t)v122, v75);
    unint64_t v92 = v91;
    swift_bridgeObjectRelease();
    sub_25AC729EC((uint64_t *)&v158);
    long long v93 = v177[0];
    v94 = v103;
    v95 = (char *)objc_allocWithZone(v103);
    *(_OWORD *)&v95[OBJC_IVAR___QOSAlertMessageInternal_title] = v93;
    v96 = (unint64_t *)&v95[OBJC_IVAR___QOSAlertMessageInternal_body];
    unint64_t *v96 = v90;
    v96[1] = v92;
    v127.receiver = v95;
    v127.super_class = v94;
    swift_bridgeObjectRetain();
    id v97 = objc_msgSendSuper2(&v127, sel_init);
    sub_25AC77AC8(v174);

    return (uint64_t)v97;
  }
  v98 = *(void (**)(void, id, unint64_t))(v3 + 56);
  id v180 = 0;
  unint64_t v181 = 0xE000000000000000;
  sub_25AC8F158();
  swift_bridgeObjectRelease();
  id v180 = (id)0xD00000000000001FLL;
  unint64_t v181 = 0x800000025AC927F0;
  sub_25AC8EED8();
  swift_bridgeObjectRelease();
  sub_25AC8EED8();
  sub_25AC8EED8();
  swift_bridgeObjectRelease();
  v98(0, v180, v181);
  swift_bridgeObjectRelease();
  v84 = *(void (**)(uint64_t))(v3 + 72);
  long long v138 = v168;
  long long v139 = v169;
  long long v140 = v170;
  uint64_t v141 = v171;
  long long v134 = v164;
  long long v135 = v165;
  long long v136 = v166;
  long long v137 = v167;
  long long v130 = v160;
  long long v131 = v161;
  long long v132 = v162;
  long long v133 = v163;
  long long v128 = v158;
  long long v129 = v159;
  nullsub_1(&v128);
  sub_25AC77BAC((uint64_t)&v128, (uint64_t)&v180, &qword_26A4ADAB8);
  uint64_t v99 = sub_25AC77050(a1, (uint64_t)&v180, (uint64_t)objc_msgSend(a2, sel_code), 1);
  sub_25AC729EC((uint64_t *)&v158);
  uint64_t v85 = v99;
LABEL_57:
  v84(v85);
  swift_bridgeObjectRelease();
  return (uint64_t)v21;
}

unint64_t sub_25AC74CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  v33[1] = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADA58);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD910);
  MEMORY[0x270FA5388](v12 - 8);
  char v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25AC8EC78();
  uint64_t v34 = *(void *)(v15 - 8);
  uint64_t v35 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v18 = *(void *)(a1 + 16);
  unint64_t v19 = *(void *)(a1 + 24);
  if ((a5 & 1) != 0
    || (unint64_t v40 = v18,
        unint64_t v41 = v19,
        uint64_t v38 = 0x4040656D69744040,
        unint64_t v39 = 0xE800000000000000,
        sub_25AC688B4(),
        (sub_25AC8F128() & 1) == 0))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_25AC8EC38();
    id v20 = *(id *)(v6 + 144);
    swift_bridgeObjectRetain();
    sub_25AC8EC88();
    uint64_t v21 = sub_25AC8ECB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 0, 1, v21);
    sub_25AC8ECE8();
    uint64_t v22 = sub_25AC8ECF8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v11, 0, 1, v22);
    unint64_t v23 = sub_25AC7013C(1, (uint64_t)v11, (uint64_t)v14);

    sub_25AC77B50((uint64_t)v11, &qword_26A4ADA58);
    sub_25AC77B50((uint64_t)v14, &qword_26A4AD910);
    char v24 = (void *)sub_25AC8EC18();
    id v25 = objc_msgSend(v23, sel_stringFromDate_, v24);

    uint64_t v26 = sub_25AC8EDD8();
    unint64_t v28 = v27;

    unint64_t v40 = v26;
    unint64_t v41 = v28;
    uint64_t v38 = 32;
    unint64_t v39 = 0xE100000000000000;
    uint64_t v36 = 41154;
    unint64_t v37 = 0xA200000000000000;
    uint64_t v29 = sub_25AC8F0F8();
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    unint64_t v18 = sub_25AC68F94(v18, v19, v29, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  }
  return v18;
}

uint64_t sub_25AC7505C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MusicPlaybackErrorMessage()
{
  return self;
}

uint64_t sub_25AC750E0(uint64_t a1, void *a2)
{
  return sub_25AC73DAC(a1, a2);
}

uint64_t sub_25AC75104(uint64_t a1, uint64_t a2)
{
  v3[56] = a1;
  v3[57] = a2;
  v3[58] = *v2;
  return MEMORY[0x270FA2498](sub_25AC7512C, 0, 0);
}

uint64_t sub_25AC7512C()
{
  uint64_t v1 = (void *)v0[57];
  uint64_t v2 = v0[58];
  uint64_t v3 = v0[56];
  uint64_t v4 = *(void (**)(void))(v2 + 72);
  sub_25AC75210((uint64_t)(v0 + 2));
  sub_25AC77BAC((uint64_t)(v0 + 2), (uint64_t)(v0 + 29), &qword_26A4ADAB8);
  sub_25AC77050(v3, (uint64_t)(v0 + 29), (uint64_t)objc_msgSend(v1, sel_code), 1);
  v4();
  uint64_t v5 = swift_bridgeObjectRelease();
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 88))(v5);
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

double sub_25AC75210(uint64_t a1)
{
  *(void *)(a1 + 208) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_25AC75238(uint64_t a1, uint64_t *a2)
{
  uint64_t result = sub_25AC77BAC(a1, (uint64_t)v10, &qword_26A4ADAE0);
  if (v10[0] == (void *)1) {
    return (*(uint64_t (**)(void, unint64_t, unint64_t))(v2 + 56))(0, 0xD00000000000001ALL, 0x800000025AC92810);
  }
  uint64_t v5 = v10[6];
  uint64_t v6 = (void *)*a2;
  if (!v10[0])
  {
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v6 || (uint64_t result = sub_25AC75A24(v10[0], (void *)*a2), (result & 1) == 0))
  {
LABEL_8:
    uint64_t v7 = *(void (**)(void, unint64_t, unint64_t))(v2 + 56);
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAE8);
    sub_25AC8EE28();
    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    sub_25AC8EED8();
    swift_bridgeObjectRetain();
    sub_25AC8EE28();
    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    v7(0, 0xD000000000000015, 0x800000025AC92830);
    uint64_t result = swift_bridgeObjectRelease();
  }
LABEL_9:
  uint64_t v8 = (void *)a2[6];
  if (!v5)
  {
    if (!v8) {
      return result;
    }
    goto LABEL_14;
  }
  if (!v8 || (uint64_t result = sub_25AC75A24(v5, v8), (result & 1) == 0))
  {
LABEL_14:
    uint64_t v9 = *(void (**)(void, unint64_t, unint64_t))(v2 + 56);
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAE8);
    sub_25AC8EE28();
    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    sub_25AC8EED8();
    swift_bridgeObjectRetain();
    sub_25AC8EE28();
    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    v9(0, 0xD000000000000014, 0x800000025AC92850);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC754C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (void *)(a1 + 40);
    for (i = (void *)(a2 + 40); ; i += 23)
    {
      BOOL v5 = *(v3 - 1) == *(i - 1) && *v3 == *i;
      if (!v5 && (sub_25AC8F208() & 1) == 0) {
        break;
      }
      v3 += 23;
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_25AC75548(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (long long *)(a1 + 32);
    uint64_t v4 = (long long *)(a2 + 32);
    for (uint64_t i = v2 - 1; ; --i)
    {
      long long v6 = v3[11];
      v30[8] = v3[10];
      v30[9] = v6;
      v30[10] = v3[12];
      uint64_t v31 = *((void *)v3 + 26);
      long long v7 = v3[7];
      v30[4] = v3[6];
      v30[5] = v7;
      long long v8 = v3[9];
      v30[6] = v3[8];
      v30[7] = v8;
      long long v9 = v3[3];
      v30[0] = v3[2];
      v30[1] = v9;
      long long v10 = v3[5];
      v30[2] = v3[4];
      v30[3] = v10;
      long long v11 = v3[1];
      long long v28 = *v3;
      long long v29 = v11;
      long long v12 = v4[11];
      v34[8] = v4[10];
      v34[9] = v12;
      v34[10] = v4[12];
      uint64_t v35 = *((void *)v4 + 26);
      long long v13 = v4[7];
      v34[4] = v4[6];
      v34[5] = v13;
      long long v14 = v4[9];
      v34[6] = v4[8];
      v34[7] = v14;
      long long v15 = v4[3];
      v34[0] = v4[2];
      v34[1] = v15;
      long long v16 = v4[5];
      v34[2] = v4[4];
      v34[3] = v16;
      long long v17 = v4[1];
      long long v32 = *v4;
      long long v33 = v17;
      char v18 = BYTE8(v32);
      if (BYTE8(v28))
      {
        if (!BYTE8(v32)) {
          return 0;
        }
      }
      else
      {
        if (*(double *)&v28 != *(double *)&v32) {
          char v18 = 1;
        }
        if (v18) {
          return 0;
        }
      }
      char v19 = BYTE8(v33);
      if (BYTE8(v29))
      {
        if (!BYTE8(v33)) {
          return 0;
        }
      }
      else
      {
        if (*(double *)&v29 != *(double *)&v33) {
          char v19 = 1;
        }
        if (v19) {
          return 0;
        }
      }
      sub_25AC77BAC((uint64_t)v30, (uint64_t)v27, &qword_26A4ADA60);
      if (sub_25AC70E28((uint64_t)v27) == 1)
      {
        sub_25AC77BAC((uint64_t)v34, (uint64_t)v25, &qword_26A4ADA60);
        if (sub_25AC70E28((uint64_t)v25) != 1) {
          goto LABEL_26;
        }
        sub_25AC7292C((uint64_t *)&v28);
        sub_25AC7292C((uint64_t *)&v32);
      }
      else
      {
        sub_25AC77BAC((uint64_t)v34, (uint64_t)v25, &qword_26A4ADA60);
        if (sub_25AC70E28((uint64_t)v25) == 1)
        {
LABEL_26:
          sub_25AC77BAC((uint64_t)v30, (uint64_t)v25, &qword_26A4ADA60);
          sub_25AC77BAC((uint64_t)v34, (uint64_t)&v26, &qword_26A4ADA60);
          sub_25AC71154((uint64_t *)v30, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
          sub_25AC71154((uint64_t *)v34, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
          sub_25AC70E54((uint64_t)v25);
          return 0;
        }
        sub_25AC77BAC((uint64_t)v30, (uint64_t)v23, &qword_26A4ADA60);
        v36[8] = v23[8];
        v36[9] = v23[9];
        v36[10] = v23[10];
        v36[4] = v23[4];
        v36[5] = v23[5];
        v36[7] = v23[7];
        v36[6] = v23[6];
        v36[0] = v23[0];
        v36[1] = v23[1];
        v36[3] = v23[3];
        v36[2] = v23[2];
        sub_25AC77BAC((uint64_t)v34, (uint64_t)v24, &qword_26A4ADA60);
        v37[8] = v24[8];
        v37[9] = v24[9];
        v37[10] = v24[10];
        v37[4] = v24[4];
        v37[5] = v24[5];
        v37[7] = v24[7];
        v37[6] = v24[6];
        v37[0] = v24[0];
        v37[1] = v24[1];
        v37[3] = v24[3];
        v37[2] = v24[2];
        sub_25AC7292C((uint64_t *)&v28);
        sub_25AC7292C((uint64_t *)&v32);
        sub_25AC71154((uint64_t *)v30, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
        sub_25AC71154((uint64_t *)v34, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D7A8, (void (*)(uint64_t))sub_25AC70E44, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D8B4);
        BOOL v20 = sub_25AC6D1E8(v36, v37);
        sub_25AC71154((uint64_t *)v34, (void (*)(uint64_t, uint64_t))sub_25AC6DB88, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830, (void (*)(uint64_t))sub_25AC71144, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
        sub_25AC71154((uint64_t *)v30, (void (*)(uint64_t, uint64_t))sub_25AC6DB88, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6D830, (void (*)(uint64_t))sub_25AC71144, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC6DA5C);
        if (!v20)
        {
          sub_25AC729EC((uint64_t *)&v32);
          sub_25AC729EC((uint64_t *)&v28);
          return 0;
        }
      }
      char v21 = sub_25AC75AEC(v31, v35);
      sub_25AC729EC((uint64_t *)&v32);
      sub_25AC729EC((uint64_t *)&v28);
      if ((v21 & 1) == 0) {
        return 0;
      }
      if (!i) {
        return 1;
      }
      uint64_t v4 = (long long *)((char *)v4 + 216);
      uint64_t v3 = (long long *)((char *)v3 + 216);
    }
  }
  return 1;
}

uint64_t sub_25AC75A24(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_25AC8F208(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    long long v9 = a2 + 7;
    for (uint64_t i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_25AC8F208() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_25AC75AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = 0;
  while (2)
  {
    uint64_t v5 = *(void *)(a1 + v3 + 48);
    uint64_t v6 = *(void *)(a1 + v3 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + v3 + 64);
    uint64_t v8 = *(void *)(a1 + v3 + 80);
    uint64_t v9 = *(void *)(a2 + v3 + 48);
    uint64_t v23 = *(void *)(a2 + v3 + 56);
    int v10 = *(unsigned __int8 *)(a2 + v3 + 64);
    uint64_t v11 = *(void *)(a2 + v3 + 80);
    uint64_t v21 = *(void *)(a2 + v3 + 72);
    uint64_t v22 = *(void *)(a1 + v3 + 72);
    if ((*(void *)(a1 + v3 + 32) != *(void *)(a2 + v3 + 32)
       || *(void *)(a1 + v3 + 40) != *(void *)(a2 + v3 + 40))
      && (sub_25AC8F208() & 1) == 0
      || (v5 != v9 || v6 != v23) && (sub_25AC8F208() & 1) == 0)
    {
      return 0;
    }
    if (v7 == 5)
    {
      if (v10 != 5) {
        return 0;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v12 = v11;
      swift_bridgeObjectRetain();
      goto LABEL_32;
    }
    unint64_t v13 = 0xE400000000000000;
    uint64_t v14 = 1735290739;
    switch(v7)
    {
      case 1:
        unint64_t v13 = 0xE500000000000000;
        uint64_t v14 = 0x6F65646976;
        break;
      case 2:
        unint64_t v13 = 0xE500000000000000;
        uint64_t v14 = 0x6D75626C61;
        break;
      case 3:
        unint64_t v13 = 0xE700000000000000;
        uint64_t v14 = 0x6E6F6974617473;
        break;
      case 4:
        unint64_t v13 = 0xE800000000000000;
        uint64_t v14 = 0x7473696C79616C70;
        break;
      default:
        break;
    }
    unint64_t v15 = 0xE400000000000000;
    uint64_t v16 = 1735290739;
    uint64_t v12 = v11;
    switch(v10)
    {
      case 0:
        goto LABEL_27;
      case 1:
        unint64_t v15 = 0xE500000000000000;
        if (v14 != 0x6F65646976) {
          goto LABEL_31;
        }
        goto LABEL_28;
      case 2:
        unint64_t v15 = 0xE500000000000000;
        if (v14 != 0x6D75626C61) {
          goto LABEL_31;
        }
        goto LABEL_28;
      case 3:
        unint64_t v15 = 0xE700000000000000;
        uint64_t v16 = 0x6E6F6974617473;
LABEL_27:
        if (v14 == v16) {
          goto LABEL_28;
        }
        goto LABEL_31;
      case 4:
        unint64_t v15 = 0xE800000000000000;
        if (v14 != 0x7473696C79616C70) {
          goto LABEL_31;
        }
LABEL_28:
        if (v13 == v15)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease_n();
          goto LABEL_32;
        }
LABEL_31:
        char v17 = sub_25AC8F208();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17)
        {
LABEL_32:
          if (v22 == v21 && v8 == v12)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v4 = sub_25AC8F208();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v4 & 1) == 0) {
              return 0;
            }
          }
          v3 += 56;
          if (!--v2) {
            return 1;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      default:
        return 0;
    }
  }
}

unint64_t sub_25AC75F18(unsigned __int8 a1)
{
  sub_25AC8F278();
  sub_25AC8F288();
  sub_25AC8F288();
  uint64_t v2 = sub_25AC8F298();

  return sub_25AC76008(a1, v2);
}

unint64_t sub_25AC75F90(uint64_t a1, uint64_t a2)
{
  sub_25AC8F278();
  sub_25AC8EE78();
  uint64_t v4 = sub_25AC8F298();

  return sub_25AC7609C(a1, a2, v4);
}

unint64_t sub_25AC76008(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    uint64_t v7 = *(void *)(v2 + 48);
    do
    {
      int v8 = *(unsigned __int8 *)(v7 + result);
      if (*(char *)(v7 + result) < 0)
      {
        if ((a1 & 0x80) != 0 && ((v8 ^ a1) & 0x7F) == 0) {
          return result;
        }
      }
      else if ((a1 & 0x80) == 0 && v8 == a1)
      {
        return result;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_25AC7609C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25AC8F208() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25AC8F208() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25AC76180(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAC0);
  char v42 = a2;
  uint64_t v6 = sub_25AC8F1A8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    char v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    long long v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25AC8F278();
    sub_25AC8EE78();
    uint64_t result = sub_25AC8F298();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    char v19 = (void *)(*(void *)(v7 + 48) + v18);
    *char v19 = v34;
    v19[1] = v33;
    BOOL v20 = (void *)(*(void *)(v7 + 56) + v18);
    *BOOL v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  char v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25AC764A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAF0);
  char v36 = a2;
  uint64_t v6 = sub_25AC8F1A8();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25AC8F278();
    sub_25AC8EE78();
    uint64_t result = sub_25AC8F298();
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
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25AC767C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25AC75F90(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_25AC76948();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      int64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *int64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_25AC76180(v17, a5 & 1);
  unint64_t v23 = sub_25AC75F90(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_25AC8F228();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  char v25 = (uint64_t *)(v20[6] + 16 * v14);
  *char v25 = a3;
  v25[1] = a4;
  unint64_t v26 = (void *)(v20[7] + 16 * v14);
  *unint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

void *sub_25AC76948()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AC8F198();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25AC76B04()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AC8F198();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_25AC76CBC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v36 = MEMORY[0x263F8EE78];
    uint64_t v37 = MEMORY[0x263F8EE78];
    uint64_t v38 = MEMORY[0x263F8EE78];
    uint64_t v6 = MEMORY[0x263F8EE78];
LABEL_24:
    uint64_t v15 = v18;
LABEL_25:
    uint64_t v19 = v18;
    goto LABEL_26;
  }
  unint64_t v4 = sub_25AC75F18(0x80u);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (!*(void *)(a1 + 16))
  {
LABEL_17:
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v36 = MEMORY[0x263F8EE78];
    uint64_t v37 = MEMORY[0x263F8EE78];
    uint64_t v38 = MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
LABEL_4:
  unint64_t v7 = sub_25AC75F18(0x81u);
  if (v8)
  {
    uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
  uint64_t v38 = MEMORY[0x263F8EE78];
  if (!*(void *)(a1 + 16))
  {
LABEL_19:
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v36 = MEMORY[0x263F8EE78];
    uint64_t v37 = MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
LABEL_6:
  unint64_t v9 = sub_25AC75F18(0x82u);
  if (v10)
  {
    uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
  uint64_t v37 = MEMORY[0x263F8EE78];
  if (!*(void *)(a1 + 16))
  {
LABEL_21:
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v36 = MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
LABEL_8:
  unint64_t v11 = sub_25AC75F18(0x84u);
  if (v12)
  {
    uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
  uint64_t v36 = MEMORY[0x263F8EE78];
  if (!*(void *)(a1 + 16))
  {
LABEL_23:
    uint64_t v18 = MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
LABEL_10:
  unint64_t v13 = sub_25AC75F18(0x85u);
  if (v14)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v13);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_12;
    }
    goto LABEL_51;
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (!*(void *)(a1 + 16))
  {
LABEL_51:
    uint64_t v18 = MEMORY[0x263F8EE78];
    goto LABEL_25;
  }
LABEL_12:
  unint64_t v16 = sub_25AC75F18(0x86u);
  if (v17)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8 * v16);
    swift_bridgeObjectRetain();
    if (!*(void *)(a1 + 16)) {
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    if (!*(void *)(a1 + 16)) {
      goto LABEL_55;
    }
  }
  unint64_t v34 = sub_25AC75F18(0x87u);
  if (v35)
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8 * v34);
    swift_bridgeObjectRetain();
    goto LABEL_26;
  }
LABEL_55:
  uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_26:
  if (!*(void *)(a1 + 16))
  {
    uint64_t v31 = MEMORY[0x263F8EE78];
    uint64_t v25 = MEMORY[0x263F8EE78];
    uint64_t v22 = MEMORY[0x263F8EE78];
LABEL_41:
    uint64_t v28 = v31;
    goto LABEL_42;
  }
  unint64_t v20 = sub_25AC75F18(0x83u);
  if (v21)
  {
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8 * v20);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_29;
    }
    goto LABEL_38;
  }
  uint64_t v22 = MEMORY[0x263F8EE78];
  if (!*(void *)(a1 + 16))
  {
LABEL_38:
    uint64_t v31 = MEMORY[0x263F8EE78];
    uint64_t v25 = MEMORY[0x263F8EE78];
    goto LABEL_41;
  }
LABEL_29:
  unint64_t v23 = sub_25AC75F18(0x88u);
  if ((v24 & 1) == 0)
  {
    uint64_t v25 = MEMORY[0x263F8EE78];
    if (*(void *)(a1 + 16)) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8 * v23);
  swift_bridgeObjectRetain();
  if (!*(void *)(a1 + 16))
  {
LABEL_40:
    uint64_t v31 = MEMORY[0x263F8EE78];
    goto LABEL_41;
  }
LABEL_31:
  unint64_t v26 = sub_25AC75F18(0x89u);
  if (v27)
  {
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8 * v26);
    swift_bridgeObjectRetain();
    if (*(void *)(a1 + 16)) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v28 = MEMORY[0x263F8EE78];
    if (*(void *)(a1 + 16))
    {
LABEL_33:
      unint64_t v29 = sub_25AC75F18(0x8Au);
      if (v30)
      {
        uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8 * v29);
        swift_bridgeObjectRetain();
        if (!*(void *)(a1 + 16)) {
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v31 = MEMORY[0x263F8EE78];
        if (!*(void *)(a1 + 16)) {
          goto LABEL_49;
        }
      }
      sub_25AC75F18(0x8Bu);
      if (v33)
      {
        uint64_t result = swift_bridgeObjectRetain();
        goto LABEL_43;
      }
LABEL_49:
      uint64_t result = MEMORY[0x263F8EE78];
      goto LABEL_43;
    }
  }
  uint64_t v31 = MEMORY[0x263F8EE78];
LABEL_42:
  uint64_t result = v31;
LABEL_43:
  *a2 = v6;
  a2[1] = v37;
  a2[2] = v36;
  a2[3] = v15;
  a2[4] = v18;
  a2[5] = v19;
  a2[6] = v38;
  a2[7] = v22;
  a2[8] = v25;
  a2[9] = v28;
  a2[10] = v31;
  a2[11] = result;
  return result;
}

uint64_t sub_25AC77050(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    uint64_t v6 = 0x746C7561666564;
  }
  else {
    uint64_t v6 = 0x6465636E61686E65;
  }
  if (a4) {
    uint64_t v7 = 0xE700000000000000;
  }
  else {
    uint64_t v7 = 0xE800000000000000;
  }
  uint64_t v8 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_25AC767C0(v6, v7, 0x546567617373656DLL, 0xEB00000000657079, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_25AC8F1F8();
  uint64_t v12 = v11;
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v104 = v8;
  sub_25AC767C0(v10, v12, 0x646F43726F727265, 0xE900000000000065, v13);
  uint64_t v14 = v8;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16))
  {
    unint64_t v15 = sub_25AC75F18(0x80u);
    if (v16)
    {
      char v17 = *(void **)(*(void *)(a1 + 56) + 8 * v15);
      if (v17[2])
      {
        uint64_t v18 = v17[4];
        uint64_t v19 = v17[5];
        swift_bridgeObjectRetain();
        char v20 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v104 = v8;
        sub_25AC767C0(v18, v19, 0x657079546D657469, 0xE800000000000000, v20);
        swift_bridgeObjectRelease();
      }
    }
    if (*(void *)(a1 + 16))
    {
      unint64_t v21 = sub_25AC75F18(0x8Cu);
      if (v22)
      {
        unint64_t v23 = *(void **)(*(void *)(a1 + 56) + 8 * v21);
        if (v23[2])
        {
          uint64_t v24 = v23[4];
          uint64_t v25 = v23[5];
          swift_bridgeObjectRetain();
          char v26 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v104 = v8;
          sub_25AC767C0(v24, v25, 0x656C61636F6CLL, 0xE600000000000000, v26);
          swift_bridgeObjectRelease();
        }
      }
      if (*(void *)(a1 + 16))
      {
        unint64_t v27 = sub_25AC75F18(0x81u);
        if (v28)
        {
          unint64_t v29 = *(void **)(*(void *)(a1 + 56) + 8 * v27);
          if (v29[2])
          {
            uint64_t v30 = v29[4];
            uint64_t v31 = v29[5];
            swift_bridgeObjectRetain();
            char v32 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v104 = v8;
            sub_25AC767C0(v30, v31, 0x64497465737361, 0xE700000000000000, v32);
            swift_bridgeObjectRelease();
          }
        }
        if (*(void *)(a1 + 16))
        {
          unint64_t v33 = sub_25AC75F18(0x89u);
          if (v34)
          {
            char v35 = *(void **)(*(void *)(a1 + 56) + 8 * v33);
            if (v35[2])
            {
              uint64_t v36 = v35[4];
              uint64_t v37 = v35[5];
              swift_bridgeObjectRetain();
              char v38 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&long long v104 = v8;
              sub_25AC767C0(v36, v37, 0x546E6F6974617473, 0xEB00000000657079, v38);
              swift_bridgeObjectRelease();
            }
          }
          if (*(void *)(a1 + 16))
          {
            unint64_t v39 = sub_25AC75F18(0x87u);
            if (v40)
            {
              uint64_t v41 = *(void **)(*(void *)(a1 + 56) + 8 * v39);
              if (v41[2])
              {
                uint64_t v42 = v41[4];
                uint64_t v43 = v41[5];
                swift_bridgeObjectRetain();
                char v44 = swift_isUniquelyReferenced_nonNull_native();
                *(void *)&long long v104 = v8;
                sub_25AC767C0(v42, v43, 0x6E65526F69647561, 0xEE006E6F69746964, v44);
                swift_bridgeObjectRelease();
              }
            }
            if (*(void *)(a1 + 16))
            {
              unint64_t v45 = sub_25AC75F18(0x8Au);
              if (v46)
              {
                char v47 = *(void **)(*(void *)(a1 + 56) + 8 * v45);
                if (v47[2])
                {
                  uint64_t v48 = v47[4];
                  uint64_t v49 = v47[5];
                  swift_bridgeObjectRetain();
                  char v50 = swift_isUniquelyReferenced_nonNull_native();
                  *(void *)&long long v104 = v8;
                  sub_25AC767C0(v48, v49, 0xD000000000000013, 0x800000025AC926D0, v50);
                  swift_bridgeObjectRelease();
                }
              }
              if (*(void *)(a1 + 16))
              {
                unint64_t v51 = sub_25AC75F18(0x8Bu);
                if (v52)
                {
                  long long v53 = *(void **)(*(void *)(a1 + 56) + 8 * v51);
                  if (v53[2])
                  {
                    uint64_t v54 = v53[4];
                    uint64_t v55 = v53[5];
                    swift_bridgeObjectRetain();
                    char v56 = swift_isUniquelyReferenced_nonNull_native();
                    *(void *)&long long v104 = v8;
                    sub_25AC767C0(v54, v55, 0xD000000000000015, 0x800000025AC926B0, v56);
                    swift_bridgeObjectRelease();
                  }
                }
                if (*(void *)(a1 + 16))
                {
                  unint64_t v57 = sub_25AC75F18(0x85u);
                  if (v58)
                  {
                    long long v59 = *(void **)(*(void *)(a1 + 56) + 8 * v57);
                    if (v59[2])
                    {
                      uint64_t v60 = v59[4];
                      uint64_t v61 = v59[5];
                      swift_bridgeObjectRetain();
                      char v62 = swift_isUniquelyReferenced_nonNull_native();
                      *(void *)&long long v104 = v8;
                      sub_25AC767C0(v60, v61, 0x6574614379616C70, 0xEC00000079726F67, v62);
                      swift_bridgeObjectRelease();
                    }
                  }
                  if (*(void *)(a1 + 16))
                  {
                    unint64_t v63 = sub_25AC75F18(0x82u);
                    if (v64)
                    {
                      uint64_t v65 = *(void **)(*(void *)(a1 + 56) + 8 * v63);
                      if (v65[2])
                      {
                        uint64_t v66 = v65[4];
                        uint64_t v67 = v65[5];
                        swift_bridgeObjectRetain();
                        char v68 = swift_isUniquelyReferenced_nonNull_native();
                        *(void *)&long long v104 = v8;
                        sub_25AC767C0(v66, v67, 0x5465636976726573, 0xEB00000000657079, v68);
                        swift_bridgeObjectRelease();
                      }
                    }
                    if (*(void *)(a1 + 16))
                    {
                      unint64_t v69 = sub_25AC75F18(0x83u);
                      if (v70)
                      {
                        unint64_t v71 = *(void **)(*(void *)(a1 + 56) + 8 * v69);
                        if (v71[2])
                        {
                          uint64_t v72 = v71[4];
                          uint64_t v73 = v71[5];
                          swift_bridgeObjectRetain();
                          char v74 = swift_isUniquelyReferenced_nonNull_native();
                          *(void *)&long long v104 = v8;
                          sub_25AC767C0(v72, v73, 0x707954616964656DLL, 0xE900000000000065, v74);
                          swift_bridgeObjectRelease();
                        }
                      }
                      if (*(void *)(a1 + 16))
                      {
                        unint64_t v75 = sub_25AC75F18(0x84u);
                        if (v76)
                        {
                          double v77 = *(void **)(*(void *)(a1 + 56) + 8 * v75);
                          if (v77[2])
                          {
                            uint64_t v78 = v77[4];
                            uint64_t v79 = v77[5];
                            swift_bridgeObjectRetain();
                            char v80 = swift_isUniquelyReferenced_nonNull_native();
                            *(void *)&long long v104 = v8;
                            sub_25AC767C0(v78, v79, 0x6570795479616C70, 0xE800000000000000, v80);
                            swift_bridgeObjectRelease();
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
  sub_25AC77BAC(a2, (uint64_t)v102, &qword_26A4ADAB8);
  if (sub_25AC77984((uint64_t)v102) != 1)
  {
    v106[8] = v102[10];
    v106[9] = v102[11];
    v106[10] = v102[12];
    uint64_t v107 = v103;
    v106[4] = v102[6];
    v106[5] = v102[7];
    v106[6] = v102[8];
    v106[7] = v102[9];
    v106[0] = v102[2];
    v106[1] = v102[3];
    v106[2] = v102[4];
    v106[3] = v102[5];
    long long v104 = v102[0];
    long long v105 = v102[1];
    sub_25AC77BAC((uint64_t)v106, (uint64_t)v99, &qword_26A4ADA60);
    sub_25AC77BAC((uint64_t)v99, (uint64_t)&v100, &qword_26A4ADA60);
    if (sub_25AC70E28((uint64_t)&v100) != 1)
    {
      if ((unint64_t)v101 >= 2 && v101[2])
      {
        uint64_t v81 = v101[4];
        uint64_t v82 = v101[5];
        swift_bridgeObjectRetain();
        char v83 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v8;
        sub_25AC767C0(v81, v82, 0x6146656369766564, 0xEC000000796C696DLL, v83);
        swift_bridgeObjectRelease();
      }
      sub_25AC77BAC((uint64_t)v99, (uint64_t)v94, &qword_26A4ADA60);
      if (v95 != 1 && v96 && v96[2])
      {
        uint64_t v84 = v96[4];
        uint64_t v85 = v96[5];
        swift_bridgeObjectRetain();
        char v86 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v8;
        sub_25AC767C0(v84, v85, 0x6F4D656369766564, 0xEB000000006C6564, v86);
        uint64_t v14 = v94[0];
        swift_bridgeObjectRelease();
      }
      sub_25AC77BAC((uint64_t)v99, (uint64_t)v94, &qword_26A4ADA60);
      if (v95 != 1 && v98 && v98[2])
      {
        uint64_t v87 = v98[4];
        uint64_t v88 = v98[5];
        swift_bridgeObjectRetain();
        char v89 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v14;
        sub_25AC767C0(v87, v88, 29551, 0xE200000000000000, v89);
        uint64_t v14 = v94[0];
        swift_bridgeObjectRelease();
      }
      sub_25AC77BAC((uint64_t)v99, (uint64_t)v94, &qword_26A4ADA60);
      if (v95 != 1 && v97 && v97[2])
      {
        uint64_t v90 = v97[4];
        uint64_t v91 = v97[5];
        swift_bridgeObjectRetain();
        char v92 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v14;
        sub_25AC767C0(v90, v91, 0x6F6973726556736FLL, 0xE90000000000006ELL, v92);
        uint64_t v14 = v94[0];
        swift_bridgeObjectRelease();
      }
    }
  }
  return v14;
}

uint64_t sub_25AC77984(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 208);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_25AC7799C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25AC77A00(uint64_t a1)
{
  return a1;
}

uint64_t *sub_25AC77AC8(uint64_t *a1)
{
  return a1;
}

uint64_t sub_25AC77B00(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC77B50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25AC77BAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t destroy for TVCriteria(void *a1)
{
  if (a1[1] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[3] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[11] != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[13];
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TVCriteria(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5 == 1)
  {
    *unint64_t v4 = *(_OWORD *)(a2 + 8);
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 24);
  if (v7 == 1)
  {
    long long v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    long long v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
  }
  else
  {
    uint64_t v10 = *(void *)(a2 + 32);
    uint64_t v11 = *(void *)(a2 + 40);
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v10;
    uint64_t v12 = *(void *)(a2 + 48);
    uint64_t v13 = *(void *)(a2 + 56);
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = v12;
    uint64_t v14 = *(void *)(a2 + 64);
    uint64_t v15 = *(void *)(a2 + 72);
    *(void *)(a1 + 56) = v13;
    *(void *)(a1 + 64) = v14;
    uint64_t v16 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = v15;
    *(void *)(a1 + 80) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v17 = *(void *)(a2 + 88);
  if (v17 != 1) {
    uint64_t v17 = swift_bridgeObjectRetain();
  }
  *(void *)(a1 + 88) = v17;
  uint64_t v18 = *(void *)(a2 + 104);
  if (v18 == 1)
  {
    long long v19 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v19;
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
  }
  else
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v18;
    uint64_t v20 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v20;
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for TVCriteria(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 8);
  if (v5 == 1)
  {
    if (v6 != 1)
    {
      *(void *)(a1 + 8) = v6;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 == 1)
  {
    sub_25AC66A24((uint64_t)v4);
LABEL_6:
    *unint64_t v4 = *v7;
    goto LABEL_8;
  }
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  long long v8 = (_OWORD *)(a1 + 24);
  uint64_t v10 = (long long *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) == 1)
  {
    if (v9 == 1)
    {
      long long v11 = *v10;
      long long v12 = *(_OWORD *)(a2 + 40);
      long long v13 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = v13;
      *long long v8 = v11;
      *(_OWORD *)(a1 + 40) = v12;
    }
    else
    {
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_25AC66A78(a1 + 24);
    long long v14 = *(_OWORD *)(a2 + 72);
    long long v16 = *v10;
    long long v15 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v14;
    *long long v8 = v16;
    *(_OWORD *)(a1 + 40) = v15;
  }
  else
  {
    *(void *)(a1 + 24) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = (uint64_t *)(a1 + 88);
  uint64_t v18 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) == 1)
  {
    if (v18 == 1)
    {
      uint64_t v19 = 1;
LABEL_20:
      *uint64_t v17 = v19;
      goto LABEL_23;
    }
    *uint64_t v17 = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v18 == 1)
    {
      sub_25AC66ACC(a1 + 88);
      uint64_t v19 = *(void *)(a2 + 88);
      goto LABEL_20;
    }
    *uint64_t v17 = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_23:
  uint64_t v20 = (long long *)(a1 + 96);
  unint64_t v21 = (long long *)(a2 + 96);
  uint64_t v22 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104) == 1)
  {
    if (v22 == 1)
    {
      long long v23 = *v21;
      long long v24 = *(_OWORD *)(a2 + 112);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *uint64_t v20 = v23;
      *(_OWORD *)(a1 + 112) = v24;
    }
    else
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v22 == 1)
  {
    sub_25AC66B20(a1 + 96);
    uint64_t v25 = *(void *)(a2 + 128);
    long long v26 = *(_OWORD *)(a2 + 112);
    *uint64_t v20 = *v21;
    *(_OWORD *)(a1 + 112) = v26;
    *(void *)(a1 + 128) = v25;
  }
  else
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for TVCriteria(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = (_OWORD *)(a1 + 8);
  long long v6 = (_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) == 1) {
    goto LABEL_4;
  }
  if (v5 == 1)
  {
    sub_25AC66A24((uint64_t)v4);
LABEL_4:
    *long long v4 = *v6;
    goto LABEL_6;
  }
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v7 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) == 1)
  {
LABEL_9:
    long long v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    long long v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    sub_25AC66A78(a1 + 24);
    goto LABEL_9;
  }
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
LABEL_11:
  uint64_t v10 = (uint64_t *)(a1 + 88);
  uint64_t v11 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) == 1)
  {
LABEL_14:
    *uint64_t v10 = v11;
    goto LABEL_16;
  }
  if (v11 == 1)
  {
    sub_25AC66ACC(a1 + 88);
    uint64_t v11 = 1;
    goto LABEL_14;
  }
  *uint64_t v10 = v11;
  swift_bridgeObjectRelease();
LABEL_16:
  if (*(void *)(a1 + 104) != 1)
  {
    uint64_t v12 = *(void *)(a2 + 104);
    if (v12 != 1)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v12;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25AC66B20(a1 + 96);
  }
  long long v13 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v13;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVCriteria(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for TVCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVCriteria()
{
  return &type metadata for TVCriteria;
}

__n128 sub_25AC7851C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25AC78F7C(a1, (uint64_t)v8);
  if (!v2)
  {
    long long v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(void *)(a2 + 128) = v9;
    long long v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

BOOL sub_25AC78588(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  uint64_t v12 = *(void *)(a1 + 128);
  long long v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  uint64_t v14 = *(void *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_25AC78A98(v11, v13);
}

uint64_t sub_25AC7860C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC786EC()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC787B4()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC78890@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC798F4();
  *a1 = result;
  return result;
}

void sub_25AC788C0(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1701869940;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x6E6F697461636F6CLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x746E65746E6F63;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x656369766564;
      a1[1] = 0xE600000000000000;
      break;
    case 4:
      *a1 = 1668508013;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC78964()
{
  uint64_t result = 1701869940;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 2:
      uint64_t result = 0x746E65746E6F63;
      break;
    case 3:
      uint64_t result = 0x656369766564;
      break;
    case 4:
      uint64_t result = 1668508013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC789F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC798F4();
  *a1 = result;
  return result;
}

uint64_t sub_25AC78A20(uint64_t a1)
{
  unint64_t v2 = sub_25AC79340();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC78A5C(uint64_t a1)
{
  unint64_t v2 = sub_25AC79340();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_25AC78A98(void *a1, void *a2)
{
  int v4 = *(unsigned __int8 *)a1;
  int v5 = *(unsigned __int8 *)a2;
  if (v4 == 2)
  {
    if (v5 != 2) {
      return 0;
    }
  }
  else
  {
    if (v5 == 2) {
      return 0;
    }
    if (v4) {
      uint64_t v6 = 0x636973756DLL;
    }
    else {
      uint64_t v6 = 0x6F65646976;
    }
    if (v5) {
      uint64_t v7 = 0x636973756DLL;
    }
    else {
      uint64_t v7 = 0x6F65646976;
    }
    if (v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v8 = sub_25AC8F208();
      swift_bridgeObjectRelease_n();
      BOOL result = 0;
      if ((v8 & 1) == 0) {
        return result;
      }
    }
  }
  uint64_t v10 = a1[1];
  uint64_t v11 = a2[1];
  if (v10 != 1)
  {
    if (v11 == 1) {
      return 0;
    }
    char v28 = (void *)a1[2];
    unint64_t v29 = (void *)a2[2];
    if (v10)
    {
      uint64_t v30 = (void *)a1[1];
      if (!v11)
      {
        sub_25AC6DB40((uint64_t)v30);
        sub_25AC6DB40(v10);
        sub_25AC6DB40(0);
        goto LABEL_42;
      }
      if ((sub_25AC75A24(v30, (void *)a2[1]) & 1) == 0)
      {
        sub_25AC6DB40(v10);
        uint64_t v31 = v10;
LABEL_28:
        sub_25AC6DB40(v31);
LABEL_29:
        uint64_t v32 = v11;
LABEL_30:
        sub_25AC6DB40(v32);
        swift_bridgeObjectRelease();
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25AC6DB88(v10);
        return 0;
      }
    }
    else if (v11)
    {
      sub_25AC6DB40(0);
      uint64_t v31 = 0;
      goto LABEL_28;
    }
    if (v28)
    {
      if (!v29)
      {
        sub_25AC6DB40(v10);
        sub_25AC6DB40(v10);
        uint64_t v32 = v11;
        goto LABEL_30;
      }
      char v33 = sub_25AC75A24(v28, v29);
      sub_25AC6DB40(v10);
      sub_25AC6DB40(v10);
      sub_25AC6DB40(v11);
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0) {
        goto LABEL_42;
      }
    }
    else
    {
      sub_25AC6DB40(v10);
      sub_25AC6DB40(v10);
      if (v29) {
        goto LABEL_29;
      }
      sub_25AC6DB40(v11);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25AC6DB88(v10);
    goto LABEL_16;
  }
  if (v11 != 1) {
    return 0;
  }
LABEL_16:
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v14 = a1[5];
  uint64_t v15 = a1[6];
  uint64_t v16 = a1[7];
  uint64_t v17 = a1[8];
  uint64_t v18 = a1[9];
  uint64_t v19 = a1[10];
  uint64_t v20 = a2[3];
  uint64_t v21 = a2[4];
  uint64_t v23 = a2[5];
  uint64_t v22 = a2[6];
  uint64_t v25 = a2[7];
  uint64_t v24 = a2[8];
  uint64_t v27 = a2[9];
  uint64_t v26 = a2[10];
  if (v12 != 1)
  {
    if (v20 != 1)
    {
      v65[0] = a1[3];
      v65[1] = v13;
      v65[2] = v14;
      v65[3] = v15;
      v65[4] = v16;
      v65[5] = v17;
      v65[6] = v18;
      v65[7] = v19;
      uint64_t v47 = v20;
      uint64_t v48 = v21;
      uint64_t v49 = v23;
      uint64_t v50 = v22;
      uint64_t v51 = v25;
      uint64_t v52 = v24;
      uint64_t v53 = v27;
      uint64_t v54 = v26;
      if ((sub_25AC81CC8((uint64_t)v65, (uint64_t)&v47) & 1) == 0) {
        return 0;
      }
      goto LABEL_36;
    }
LABEL_25:
    uint64_t v47 = a1[3];
    uint64_t v48 = v13;
    uint64_t v49 = v14;
    uint64_t v50 = v15;
    uint64_t v51 = v16;
    uint64_t v52 = v17;
    uint64_t v53 = v18;
    uint64_t v54 = v19;
    uint64_t v55 = v20;
    uint64_t v56 = v21;
    uint64_t v57 = v23;
    uint64_t v58 = v22;
    uint64_t v59 = v25;
    uint64_t v60 = v24;
    uint64_t v61 = v27;
    uint64_t v62 = v26;
    sub_25AC7943C(v12);
    sub_25AC7943C(v20);
    sub_25AC794E4(&v47);
    return 0;
  }
  if (v20 != 1) {
    goto LABEL_25;
  }
LABEL_36:
  char v34 = (void *)a1[11];
  uint64_t v35 = a2[11];
  if (v34 == (void *)1)
  {
    if (v35 != 1) {
      return 0;
    }
  }
  else
  {
    if (v35 == 1) {
      return 0;
    }
    if (v34)
    {
      if (!v35 || (sub_25AC75A24(v34, (void *)a2[11]) & 1) == 0) {
        return 0;
      }
    }
    else
    {
      sub_25AC71144(0);
      if (v35) {
        return 0;
      }
    }
  }
  uint64_t v37 = a1[12];
  uint64_t v36 = a1[13];
  uint64_t v39 = a1[14];
  uint64_t v38 = a1[15];
  uint64_t v40 = a1[16];
  uint64_t v42 = a2[12];
  uint64_t v41 = a2[13];
  uint64_t v44 = a2[14];
  uint64_t v43 = a2[15];
  uint64_t v45 = a2[16];
  if (v36 == 1)
  {
    if (v41 == 1) {
      return 1;
    }
    goto LABEL_55;
  }
  if (v41 == 1)
  {
LABEL_55:
    sub_25AC79618(v37, v36);
    sub_25AC79618(v42, v41);
    sub_25AC79680(v37, v36);
    sub_25AC79680(v42, v41);
    return 0;
  }
  v63[0] = v37;
  v63[1] = v36;
  v63[2] = v39;
  v63[3] = v38;
  v63[4] = v40;
  v64[0] = v42;
  v64[1] = v41;
  v64[2] = v44;
  v64[3] = v43;
  v64[4] = v45;
  char v46 = sub_25AC7E7F8(v63, v64);
  sub_25AC79618(v37, v36);
  sub_25AC79618(v37, v36);
  sub_25AC79618(v42, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25AC79680(v37, v36);
  return (v46 & 1) != 0;
}

uint64_t sub_25AC78F7C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC79340();
  sub_25AC8F2A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v35) = 0;
  sub_25AC8F1D8();
  uint64_t v10 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v10 == 1) {
    int v11 = 1;
  }
  else {
    int v11 = 2;
  }
  if (!v10) {
    int v11 = 0;
  }
  int v43 = v11;
  char v44 = 1;
  sub_25AC6EC54();
  sub_25AC8F1E8();
  uint64_t v32 = v36;
  uint64_t v33 = v35;
  char v44 = 2;
  sub_25AC79394();
  sub_25AC8F1E8();
  uint64_t v30 = v36;
  uint64_t v31 = v35;
  uint64_t v28 = v38;
  uint64_t v29 = v37;
  uint64_t v27 = v39;
  uint64_t v34 = v6;
  char v44 = 3;
  sub_25AC793E8();
  sub_25AC8F1E8();
  uint64_t v25 = v36;
  uint64_t v26 = v35;
  uint64_t v23 = v38;
  uint64_t v24 = v37;
  uint64_t v12 = v40;
  uint64_t v22 = v39;
  uint64_t v14 = v41;
  uint64_t v13 = v42;
  char v44 = 4;
  sub_25AC6ED50();
  sub_25AC8F1E8();
  uint64_t v15 = v35;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *(unsigned char *)a2 = v43;
  uint64_t v16 = v32;
  *(void *)(a2 + 8) = v33;
  *(void *)(a2 + 16) = v16;
  uint64_t v17 = v25;
  *(void *)(a2 + 24) = v26;
  *(void *)(a2 + 32) = v17;
  uint64_t v18 = v23;
  *(void *)(a2 + 40) = v24;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v12;
  *(void *)(a2 + 72) = v14;
  *(void *)(a2 + 80) = v13;
  uint64_t v19 = v31;
  *(void *)(a2 + 88) = v15;
  *(void *)(a2 + 96) = v19;
  uint64_t v20 = v29;
  *(void *)(a2 + 104) = v30;
  *(void *)(a2 + 112) = v20;
  uint64_t v21 = v27;
  *(void *)(a2 + 120) = v28;
  *(void *)(a2 + 128) = v21;
  return result;
}

unint64_t sub_25AC79340()
{
  unint64_t result = qword_26A4ADB00;
  if (!qword_26A4ADB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB00);
  }
  return result;
}

unint64_t sub_25AC79394()
{
  unint64_t result = qword_26A4ADB08;
  if (!qword_26A4ADB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB08);
  }
  return result;
}

unint64_t sub_25AC793E8()
{
  unint64_t result = qword_26A4ADB10;
  if (!qword_26A4ADB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB10);
  }
  return result;
}

uint64_t sub_25AC7943C(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t *sub_25AC794E4(uint64_t *a1)
{
  uint64_t v2 = a1[8];
  sub_25AC79574(*a1);
  sub_25AC79574(v2);
  return a1;
}

uint64_t sub_25AC79574(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC79618(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AC79680(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TVCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC797B4);
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

ValueMetadata *type metadata accessor for TVCriteria.CodingKeys()
{
  return &type metadata for TVCriteria.CodingKeys;
}

unint64_t sub_25AC797F0()
{
  unint64_t result = qword_26A4ADB18;
  if (!qword_26A4ADB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB18);
  }
  return result;
}

unint64_t sub_25AC79848()
{
  unint64_t result = qword_26A4ADB20;
  if (!qword_26A4ADB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB20);
  }
  return result;
}

unint64_t sub_25AC798A0()
{
  unint64_t result = qword_26A4ADB28;
  if (!qword_26A4ADB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB28);
  }
  return result;
}

uint64_t sub_25AC798F4()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_25AC79940(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25AC79954(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25AC79968(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25AC7997C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25AC79990(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25AC799C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_25AC799F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_25AC79A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 64) + **(int **)(a2 + 64));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25AC64768;
  return v7(a1, a2);
}

id QOSAlertMessage.__allocating_init(title:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR___QOSAlertMessageInternal_title];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  int v11 = &v9[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(void *)int v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

BOOL static QOSError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t QOSError.hash(into:)()
{
  return sub_25AC8F288();
}

uint64_t QOSError.hashValue.getter()
{
  return sub_25AC8F298();
}

BOOL sub_25AC79C28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t QOSAlertMessage.title.getter()
{
  return sub_25AC79CEC(&OBJC_IVAR___QOSAlertMessageInternal_title);
}

id sub_25AC79C74(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    int v3 = (void *)sub_25AC8EDC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

uint64_t QOSAlertMessage.body.getter()
{
  return sub_25AC79CEC(&OBJC_IVAR___QOSAlertMessageInternal_body);
}

uint64_t sub_25AC79CEC(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

id QOSAlertMessage.init(title:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = &v4[OBJC_IVAR___QOSAlertMessageInternal_title];
  *(void *)uint64_t v5 = a1;
  *((void *)v5 + 1) = a2;
  unsigned int v6 = &v4[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(void *)unsigned int v6 = a3;
  *((void *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for QOSAlertMessage();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t type metadata accessor for QOSAlertMessage()
{
  return self;
}

id QOSAlertMessage.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void QOSAlertMessage.init()()
{
}

id QOSAlertMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QOSAlertMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25AC79F5C()
{
  sub_25AC7C468();
  uint64_t result = sub_25AC8F088();
  qword_26B331AE0 = result;
  return result;
}

uint64_t sub_25AC79FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_26B331AD8 != -1) {
    swift_once();
  }
  if (a1 == 1)
  {
    sub_25AC8F048();
  }
  else
  {
    if (a1)
    {
      uint64_t result = sub_25AC8F218();
      __break(1u);
      return result;
    }
    sub_25AC8F038();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B331AF8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25AC90C90;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 64) = sub_25AC7C414();
  *(void *)(v6 + 32) = a2;
  *(void *)(v6 + 40) = a3;
  swift_bridgeObjectRetain();
  sub_25AC8ED08();

  return swift_bridgeObjectRelease();
}

uint64_t (*static QOSErrorMessage.logger.getter())(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25AC79FC8;
}

uint64_t sub_25AC7A120()
{
  if (qword_26B331AD8 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B331AF8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25AC90C90;
  uint64_t v1 = MEMORY[0x263F8D310];
  uint64_t v2 = sub_25AC8ED98();
  uint64_t v4 = v3;
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = sub_25AC7C414();
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v4;
  sub_25AC8F058();
  sub_25AC8ED08();

  return swift_bridgeObjectRelease();
}

uint64_t (*static QOSErrorMessage.metricsRecorder.getter())()
{
  return sub_25AC7A120;
}

uint64_t static QOSErrorMessage.getObjcInstance(config:logger:metricsRecorder:defaultAlert:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25AC7B620(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t static QOSErrorMessage.getSwiftInstance(config:logger:metricsRecorder:defaultAlert:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v13 = *(void *)&a1[OBJC_IVAR___QOSConfigInternal_appTarget];
  uint64_t v33 = a4;
  uint64_t v34 = a6;
  uint64_t v32 = a2;
  if (v13 == 1)
  {
    uint64_t v36 = type metadata accessor for QOSConfig();
    uint64_t v37 = &off_27088E818;
    v35[0] = a1;
    uint64_t v14 = type metadata accessor for MusicPlaybackErrorMessage();
    uint64_t v15 = (void *)swift_allocObject();
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v36);
    MEMORY[0x270FA5388](v16);
    uint64_t v18 = (uint64_t *)((char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v19 + 16))(v18);
    uint64_t v20 = *v18;
    uint64_t v21 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v22 = sub_25AC7ACF8(v20, v32, a3, v33, a5, v34, a7, v15);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    uint64_t v24 = &off_27088ECD8;
LABEL_5:
    a8[3] = v14;
    a8[4] = v24;
    *a8 = v22;
    return result;
  }
  if (!v13)
  {
    uint64_t v36 = type metadata accessor for QOSConfig();
    uint64_t v37 = &off_27088E818;
    v35[0] = a1;
    uint64_t v14 = type metadata accessor for TVPlaybackErrorMessage();
    uint64_t v25 = (void *)swift_allocObject();
    uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v36);
    MEMORY[0x270FA5388](v26);
    uint64_t v28 = (uint64_t *)((char *)&v32 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v29 + 16))(v28);
    uint64_t v30 = *v28;
    uint64_t v31 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v22 = sub_25AC7B3D8(v30, v32, a3, v33, a5, v34, a7, v25);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    uint64_t v24 = &off_27088F360;
    goto LABEL_5;
  }
  uint64_t result = sub_25AC8F218();
  __break(1u);
  return result;
}

id QOSErrorMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25AC7A760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25AC8EFD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25AC8EFC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25AC7BDE8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25AC8EFB8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25AC7A904(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25AC7A9E0;
  return v6(a1);
}

uint64_t sub_25AC7A9E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25AC7AAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for QOSConfig();
  v32[3] = v8;
  v32[4] = &off_27088E818;
  v32[0] = a1;
  uint64_t v9 = type metadata accessor for Network();
  uint64_t v30 = v9;
  uint64_t v31 = &off_27088E5E0;
  v29[0] = a2;
  type metadata accessor for LocationService();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (uint64_t *)((char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = *v13;
  uint64_t v20 = *v17;
  uint64_t v27 = v8;
  uint64_t v28 = &off_27088E818;
  uint64_t v25 = &off_27088E5E0;
  *(void *)&long long v26 = v19;
  uint64_t v24 = v9;
  *(void *)&long long v23 = v20;
  *(_OWORD *)(v10 + 112) = 0u;
  *(_OWORD *)(v10 + 128) = 0u;
  sub_25AC7C3A8(&v26, v10 + 16);
  sub_25AC7C3A8(&v23, v10 + 56);
  *(void *)(v10 + 96) = a3;
  *(void *)(v10 + 104) = a4;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return v10;
}

void *sub_25AC7ACF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v36[3] = type metadata accessor for QOSConfig();
  v36[4] = &off_27088E818;
  v36[0] = a1;
  a8[18] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_25AC7799C((uint64_t)v36, (uint64_t)(a8 + 2));
  a8[7] = a2;
  a8[8] = a3;
  a8[9] = a4;
  a8[10] = a5;
  a8[11] = a6;
  a8[12] = a7;
  uint64_t v16 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  id v17 = objc_msgSend(v16, sel_defaultSessionConfiguration);
  id v18 = objc_msgSend(self, sel_sessionWithConfiguration_, v17);

  type metadata accessor for Network();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v18;
  v19[3] = a2;
  v19[4] = a3;
  sub_25AC7799C((uint64_t)v36, (uint64_t)&v33);
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v33, v34);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (uint64_t *)((char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = *v22;
  swift_retain_n();
  swift_retain();
  uint64_t v25 = sub_25AC7AAD8(v24, (uint64_t)v19, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  sub_25AC7799C((uint64_t)v36, (uint64_t)&v33);
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v33, v34);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (uint64_t *)((char *)&v33 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  uint64_t v30 = *v28;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v31 = sub_25AC7C0F4(v30, (uint64_t)v19, v25, a2, a3);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  uint64_t v34 = type metadata accessor for MusicIssuesService();
  uint64_t v35 = &off_26BC35510;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)&long long v33 = v31;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  sub_25AC7C3A8(&v33, (uint64_t)(a8 + 13));
  return a8;
}

void *sub_25AC7B060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = type metadata accessor for QOSConfig();
  v18[4] = &off_27088E818;
  v18[0] = a1;
  v17[3] = type metadata accessor for Network();
  v17[4] = &off_27088E5E0;
  v17[0] = a2;
  a5[14] = 0;
  a5[15] = 0;
  sub_25AC7799C((uint64_t)v18, (uint64_t)(a5 + 2));
  sub_25AC7799C((uint64_t)v17, (uint64_t)(a5 + 7));
  a5[12] = a3;
  a5[13] = a4;
  uint64_t v13 = sub_25AC8EFD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = 0;
  void v14[3] = 0;
  v14[4] = a5;
  swift_retain();
  uint64_t v15 = sub_25AC7A760((uint64_t)v12, (uint64_t)&unk_26A4ADB58, (uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  a5[15] = v15;
  swift_release();
  return a5;
}

void *sub_25AC7B1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = type metadata accessor for QOSConfig();
  uint64_t v24 = &off_27088E818;
  v22[0] = a1;
  uint64_t v20 = type metadata accessor for Network();
  uint64_t v21 = &off_27088E5E0;
  v19[0] = a2;
  type metadata accessor for TVIssuesService();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (void *)((char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  id v17 = sub_25AC7B060(*v11, *v15, a3, a4, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v17;
}

void *sub_25AC7B3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v30[3] = type metadata accessor for QOSConfig();
  v30[4] = &off_27088E818;
  v30[0] = a1;
  sub_25AC7799C((uint64_t)v30, (uint64_t)(a8 + 2));
  a8[7] = a2;
  a8[8] = a3;
  a8[9] = a4;
  a8[10] = a5;
  a8[11] = a6;
  a8[12] = a7;
  uint64_t v16 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  id v17 = objc_msgSend(v16, sel_defaultSessionConfiguration);
  id v18 = objc_msgSend(self, sel_sessionWithConfiguration_, v17);

  type metadata accessor for Network();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v18;
  void v19[3] = a2;
  v19[4] = a3;
  sub_25AC7799C((uint64_t)v30, (uint64_t)&v27);
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v27, v28);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (uint64_t *)((char *)&v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = *v22;
  swift_retain_n();
  swift_retain();
  uint64_t v25 = sub_25AC7B1EC(v24, (uint64_t)v19, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  uint64_t v28 = type metadata accessor for TVIssuesService();
  uint64_t v29 = &off_26BC35608;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)&long long v27 = v25;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  sub_25AC7C3A8(&v27, (uint64_t)(a8 + 13));
  return a8;
}

uint64_t sub_25AC7B620(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *(void *)&a1[OBJC_IVAR___QOSConfigInternal_appTarget];
  if (!v8)
  {
    uint64_t v29 = a6;
    uint64_t v27 = type metadata accessor for QOSConfig();
    uint64_t v28 = &off_27088E818;
    v26[0] = a1;
    type metadata accessor for TVPlaybackErrorMessage();
    uint64_t v24 = (void *)swift_allocObject();
    uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v23;
    MEMORY[0x270FA5388](v15);
    id v17 = (uint64_t *)((char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v18 + 16))(v17);
    uint64_t v19 = *v17;
    uint64_t v20 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v7 = sub_25AC7B3D8(v19, a2, a3, a4, a5, v29, a7, v24);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return (uint64_t)v7;
  }
  if (v8 == 1)
  {
    sub_25AC7C3C0();
    swift_allocError();
    *uint64_t v21 = 0;
    swift_willThrow();
    return (uint64_t)v7;
  }
  uint64_t result = sub_25AC8F218();
  __break(1u);
  return result;
}

unint64_t sub_25AC7B828()
{
  unint64_t result = qword_26A4ADB48;
  if (!qword_26A4ADB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADB48);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for QOSError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC7B948);
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

ValueMetadata *type metadata accessor for QOSError()
{
  return &type metadata for QOSError;
}

uint64_t method lookup function for QOSAlertMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QOSAlertMessage);
}

uint64_t dispatch thunk of QOSAlertMessage.__allocating_init(title:body:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SwiftQOSErrorMessageProtocol.getLocalizedErrorMessage(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SwiftQOSErrorMessageProtocol.fetchLocalizedErrorMessage(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25AC7BACC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25AC7BACC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  int v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for QOSErrorMessage()
{
  return self;
}

uint64_t sub_25AC7BBEC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25AC7BC24(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  id v4 = (id)sub_25AC8EDC8();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);
}

void sub_25AC7BC8C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_25AC8ED78();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

id sub_25AC7BCF8()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();

  return v1;
}

uint64_t sub_25AC7BD34(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25AC64768;
  return sub_25AC8DE58(a1, v4, v5, v6);
}

uint64_t sub_25AC7BDE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AC7BE48()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AC7BE80(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25AC64768;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A4ADB60 + dword_26A4ADB60);
  return v6(a1, v4);
}

void *sub_25AC7BF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v19[3] = type metadata accessor for QOSConfig();
  v19[4] = &off_27088E818;
  v19[0] = a1;
  v18[3] = type metadata accessor for Network();
  v18[4] = &off_27088E5E0;
  v18[0] = a2;
  a6[14] = 0;
  a6[16] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_25AC7799C((uint64_t)v19, (uint64_t)(a6 + 2));
  sub_25AC7799C((uint64_t)v18, (uint64_t)(a6 + 7));
  a6[12] = a4;
  a6[13] = a5;
  a6[15] = a3;
  uint64_t v15 = sub_25AC8EFD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = a6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25AC7A760((uint64_t)v14, (uint64_t)&unk_26A4ADB70, (uint64_t)v16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return a6;
}

void *sub_25AC7C0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = type metadata accessor for QOSConfig();
  uint64_t v26 = &off_27088E818;
  v24[0] = a1;
  uint64_t v22 = type metadata accessor for Network();
  uint64_t v23 = &off_27088E5E0;
  v21[0] = a2;
  type metadata accessor for MusicIssuesService();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void *)((char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
  MEMORY[0x270FA5388](v15);
  id v17 = (void *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = sub_25AC7BF38(*v13, *v17, a3, a4, a5, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

uint64_t sub_25AC7C2F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25AC7C4B0;
  return sub_25AC870A0(a1, v4, v5, v6);
}

uint64_t sub_25AC7C3A8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_25AC7C3C0()
{
  unint64_t result = qword_26A4ADB78;
  if (!qword_26A4ADB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A4ADB78);
  }
  return result;
}

unint64_t sub_25AC7C414()
{
  unint64_t result = qword_26B331AE8;
  if (!qword_26B331AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B331AE8);
  }
  return result;
}

unint64_t sub_25AC7C468()
{
  unint64_t result = qword_26B331AF0;
  if (!qword_26B331AF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B331AF0);
  }
  return result;
}

uint64_t sub_25AC7C4B4(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return MEMORY[0x270FA2498](sub_25AC7C4D8, 0, 0);
}

uint64_t sub_25AC7C4D8()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_25AC8EDC8();
  v0[20] = v2;
  id v3 = objc_msgSend(v1, sel_stringForKey_, v2);
  v0[21] = v3;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25AC7C608;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25AC7CBBC;
  v0[13] = &block_descriptor_1;
  v0[14] = v4;
  objc_msgSend(v3, sel_valueWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25AC7C608()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_25AC7C7A0;
  }
  else {
    uint64_t v2 = sub_25AC7C718;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25AC7C718()
{
  uint64_t v1 = *(void **)(v0 + 160);

  uint64_t v2 = sub_25AC8EE18();
  uint64_t v4 = v3;

  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v5(v2, v4);
}

uint64_t sub_25AC7C7A0()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = (void *)v0[20];
  swift_willThrow();

  uint64_t v4 = (uint64_t (*)(void, void))v0[1];
  return v4(0, 0);
}

uint64_t sub_25AC7C830(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return MEMORY[0x270FA2498](sub_25AC7C854, 0, 0);
}

uint64_t sub_25AC7C854()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_25AC8EDC8();
  v0[20] = v2;
  id v3 = objc_msgSend(v1, sel_integerForKey_, v2);
  v0[21] = v3;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25AC7C984;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25AC7CBBC;
  v0[13] = &block_descriptor;
  v0[14] = v4;
  objc_msgSend(v3, sel_valueWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25AC7C984()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_25AC7CB24;
  }
  else {
    uint64_t v2 = sub_25AC7CA94;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25AC7CA94()
{
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v2 = *(void **)(v0 + 120);

  uint64_t v3 = sub_25AC8EFF8();
  BOOL v4 = *(void *)(v0 + 176) != 0;
  uint64_t v5 = *(uint64_t (**)(uint64_t, BOOL))(v0 + 8);
  return v5(v3, v4);
}

uint64_t sub_25AC7CB24()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = (void *)v0[20];
  swift_willThrow();

  BOOL v4 = v0[22] != 0;
  uint64_t v5 = (uint64_t (*)(void, BOOL))v0[1];
  return v5(0, v4);
}

uint64_t sub_25AC7CBC0(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E48);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    return MEMORY[0x270FA2410](v4, v6);
  }
  else
  {
    if (a2)
    {
      uint64_t v9 = *(void *)(*(void *)(v4 + 64) + 40);
      *(void *)uint64_t v9 = a2;
      *(unsigned char *)(v9 + 8) = a3;
      id v10 = a2;
      a1 = v4;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_25AC7CC84(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25AC7CC98(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25AC7CCAC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25AC7CCC0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25AC7CCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 48) + **(int **)(a5 + 48));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_25AC64768;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_25AC7CDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_25AC7CDFC()
{
  uint64_t result = sub_25AC8F098();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25AC7CE8C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_25AC7CFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_25AC7D08C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_25AC7D184(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *sub_25AC7D2F0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_25AC7D3E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t sub_25AC7D554(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_25AC7D6F4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x25AC7D930);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          id v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Cache()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25AC7D9A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25AC8EB98();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADC18);
  MEMORY[0x270FA5388](v6 - 8);
  unsigned int v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AC8EB88();
  unsigned int v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (!v9(v8, 1, v2))
  {
    swift_bridgeObjectRetain();
    sub_25AC8EB68();
  }
  if (v9(v8, 1, v2))
  {
    uint64_t v10 = sub_25AC8EBE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_25AC8EB78();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_25AC7DB98((uint64_t)v8);
}

uint64_t sub_25AC7DB98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADC18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for QoSDevice()
{
  return self;
}

uint64_t sub_25AC7DC1C(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_25AC7DCE0(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_25AC7DC1C(__src, &__src[a2]);
  }
  sub_25AC8EBB8();
  swift_allocObject();
  sub_25AC8EBA8();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_25AC8EBF8();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_25AC7DD94()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_25AC8EB38();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25AC8EE08();
  MEMORY[0x270FA5388](v4 - 8);
  bzero(&v14, 0x500uLL);
  uname(&v14);
  uint64_t v5 = sub_25AC7DCE0(v14.machine, 256);
  unint64_t v7 = v6;
  uint64_t v15 = v5;
  unint64_t v16 = v6;
  sub_25AC8EDF8();
  sub_25AC7DF90();
  uint64_t v8 = sub_25AC8EDE8();
  unint64_t v10 = v9;
  sub_25AC7DFE4(v5, v7);
  if (!v10) {
    __break(1u);
  }
  uint64_t v15 = v8;
  unint64_t v16 = v10;
  sub_25AC8EB08();
  sub_25AC688B4();
  uint64_t v11 = sub_25AC8F0E8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_25AC7DF90()
{
  unint64_t result = qword_26A4ADC20;
  if (!qword_26A4ADC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC20);
  }
  return result;
}

uint64_t sub_25AC7DFE4(uint64_t a1, unint64_t a2)
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

uint64_t destroy for TVContentCriteria()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TVContentCriteria(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TVContentCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for TVContentCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TVContentCriteria(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
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

uint64_t storeEnumTagSinglePayload for TVContentCriteria(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVContentCriteria()
{
  return &type metadata for TVContentCriteria;
}

double sub_25AC7E2BC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25AC7E8C4(a1, (uint64_t *)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_25AC7E304(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_25AC7E7F8(v5, v7) & 1;
}

uint64_t sub_25AC7E350(unsigned __int8 *a1, char *a2)
{
  return sub_25AC731C0(*a1, *a2);
}

uint64_t sub_25AC7E35C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC7E440()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC7E50C()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC7E5EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC7EDB4();
  *a1 = result;
  return result;
}

void sub_25AC7E61C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEB00000000657079;
  uint64_t v3 = 0x54746E65746E6F63;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x6449646E617262;
      goto LABEL_3;
    case 2:
      *a1 = 0x4965636976726573;
      a1[1] = 0xE900000000000064;
      break;
    case 3:
      *a1 = 0x64496D616461;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC7E6C0()
{
  uint64_t result = 0x54746E65746E6F63;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6449646E617262;
      break;
    case 2:
      uint64_t result = 0x4965636976726573;
      break;
    case 3:
      uint64_t result = 0x64496D616461;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC7E758@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC7EDB4();
  *a1 = result;
  return result;
}

uint64_t sub_25AC7E780(uint64_t a1)
{
  unint64_t v2 = sub_25AC7EB54();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC7E7BC(uint64_t a1)
{
  unint64_t v2 = sub_25AC7EB54();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC7E7F8(void *a1, void *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  if (!v4)
  {
    if (v5) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v5) {
    return 0;
  }
  BOOL v6 = *a1 == *a2 && v4 == v5;
  if (v6 || (v7 = sub_25AC8F208(), uint64_t result = 0, (v7 & 1) != 0))
  {
LABEL_10:
    unint64_t v9 = (void *)a1[2];
    unint64_t v10 = (void *)a2[2];
    if (v9)
    {
      if (!v10 || (sub_25AC75A24(v9, v10) & 1) == 0) {
        return 0;
      }
    }
    else if (v10)
    {
      return 0;
    }
    uint64_t v11 = (void *)a1[3];
    uint64_t v12 = (void *)a2[3];
    if (v11)
    {
      if (!v12 || (sub_25AC75A24(v11, v12) & 1) == 0) {
        return 0;
      }
    }
    else if (v12)
    {
      return 0;
    }
    uint64_t v13 = (void *)a1[4];
    utsname v14 = (void *)a2[4];
    if (v13)
    {
      if (v14 && (sub_25AC75A24(v13, v14) & 1) != 0) {
        return 1;
      }
    }
    else if (!v14)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_25AC7E8C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADC28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC7EB54();
  sub_25AC8F2A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v20) = 0;
  uint64_t v10 = sub_25AC8F1D8();
  uint64_t v18 = v6;
  uint64_t v16 = v11;
  uint64_t v17 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
  char v19 = 1;
  sub_25AC6B874();
  sub_25AC8F1E8();
  uint64_t v12 = v20;
  char v19 = 2;
  sub_25AC8F1E8();
  uint64_t v13 = v20;
  char v19 = 3;
  sub_25AC8F1E8();
  uint64_t v14 = v20;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  uint64_t v15 = v16;
  *a2 = v17;
  a2[1] = v15;
  a2[2] = v12;
  a2[3] = v13;
  a2[4] = v14;
  return result;
}

unint64_t sub_25AC7EB54()
{
  unint64_t result = qword_26A4ADC30;
  if (!qword_26A4ADC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC30);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TVContentCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC7EC74);
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

ValueMetadata *type metadata accessor for TVContentCriteria.CodingKeys()
{
  return &type metadata for TVContentCriteria.CodingKeys;
}

unint64_t sub_25AC7ECB0()
{
  unint64_t result = qword_26A4ADC38;
  if (!qword_26A4ADC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC38);
  }
  return result;
}

unint64_t sub_25AC7ED08()
{
  unint64_t result = qword_26A4ADC40;
  if (!qword_26A4ADC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC40);
  }
  return result;
}

unint64_t sub_25AC7ED60()
{
  unint64_t result = qword_26A4ADC48;
  if (!qword_26A4ADC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC48);
  }
  return result;
}

uint64_t sub_25AC7EDB4()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25AC7EE00(void *a1)
{
  uint64_t v2 = a1;
  int v3 = (void *)*v1;
  if (*v1)
  {
    uint64_t v4 = *a1;
    if (!*v2) {
      return 0;
    }
    uint64_t v5 = v3[2];
    if (v5)
    {
      uint64_t v197 = *(void *)(v4 + 16);
      if (v197)
      {
        v243 = v2;
        unint64_t v6 = v3[5];
        uint64_t v208 = v3[4];
        uint64_t v219 = v4 + 32;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v197; ++i)
        {
          uint64_t v8 = (uint64_t *)(v219 + 16 * i);
          uint64_t v10 = *v8;
          unint64_t v9 = v8[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          char v11 = sub_25AC68508(v208, v6, v10, v9);
          swift_bridgeObjectRelease();
          if (v11)
          {
LABEL_12:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            uint64_t v1 = v231;
            uint64_t v2 = v243;
            goto LABEL_13;
          }
          if (v5 != 1)
          {
            uint64_t v12 = v3[6];
            unint64_t v13 = v3[7];
            swift_bridgeObjectRetain();
            LOBYTE(v12) = sub_25AC68508(v12, v13, v10, v9);
            swift_bridgeObjectRelease();
            uint64_t v15 = v5 - 1;
            uint64_t v14 = v3 + 9;
            if (v12) {
              goto LABEL_12;
            }
            while (--v15)
            {
              uint64_t v16 = v14 + 2;
              uint64_t v18 = *(v14 - 1);
              unint64_t v17 = *v14;
              swift_bridgeObjectRetain();
              LOBYTE(v18) = sub_25AC68508(v18, v17, v10, v9);
              swift_bridgeObjectRelease();
              uint64_t v14 = v16;
              if (v18) {
                goto LABEL_12;
              }
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
LABEL_90:
        uint64_t v120 = 0;
        goto LABEL_91;
      }
      return 0;
    }
  }
LABEL_13:
  char v19 = (void *)v1[1];
  if (v19)
  {
    uint64_t v20 = v2[1];
    if (!v20) {
      return 0;
    }
    uint64_t v21 = v19[2];
    if (v21)
    {
      uint64_t v198 = *(void *)(v20 + 16);
      if (!v198) {
        return 0;
      }
      v232 = v1;
      v244 = v2;
      unint64_t v22 = v19[5];
      uint64_t v209 = v19[4];
      uint64_t v220 = v20 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v23 = 0;
      while (1)
      {
        uint64_t v24 = (uint64_t *)(v220 + 16 * v23);
        uint64_t v26 = *v24;
        unint64_t v25 = v24[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v27 = sub_25AC68508(v209, v22, v26, v25);
        swift_bridgeObjectRelease();
        if (v27) {
          break;
        }
        if (v21 != 1)
        {
          uint64_t v28 = v19[6];
          unint64_t v29 = v19[7];
          swift_bridgeObjectRetain();
          LOBYTE(v28) = sub_25AC68508(v28, v29, v26, v25);
          swift_bridgeObjectRelease();
          uint64_t v31 = v21 - 1;
          uint64_t v30 = v19 + 9;
          if (v28) {
            break;
          }
          while (--v31)
          {
            uint64_t v32 = v30 + 2;
            uint64_t v34 = *(v30 - 1);
            unint64_t v33 = *v30;
            swift_bridgeObjectRetain();
            LOBYTE(v34) = sub_25AC68508(v34, v33, v26, v25);
            swift_bridgeObjectRelease();
            uint64_t v30 = v32;
            if (v34) {
              goto LABEL_24;
            }
          }
        }
        ++v23;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v23 == v198) {
          goto LABEL_90;
        }
      }
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v232;
      uint64_t v2 = v244;
    }
  }
  uint64_t v35 = (void *)v1[2];
  if (v35)
  {
    uint64_t v36 = v2[2];
    if (!v36) {
      return 0;
    }
    uint64_t v37 = v35[2];
    if (v37)
    {
      uint64_t v199 = *(void *)(v36 + 16);
      if (!v199) {
        return 0;
      }
      v233 = v1;
      v245 = v2;
      unint64_t v38 = v35[5];
      uint64_t v210 = v35[4];
      uint64_t v221 = v36 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v39 = 0;
      while (1)
      {
        uint64_t v40 = (uint64_t *)(v221 + 16 * v39);
        uint64_t v42 = *v40;
        unint64_t v41 = v40[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v43 = sub_25AC68508(v210, v38, v42, v41);
        swift_bridgeObjectRelease();
        if (v43) {
          break;
        }
        if (v37 != 1)
        {
          uint64_t v44 = v35[6];
          unint64_t v45 = v35[7];
          swift_bridgeObjectRetain();
          LOBYTE(v44) = sub_25AC68508(v44, v45, v42, v41);
          swift_bridgeObjectRelease();
          uint64_t v47 = v37 - 1;
          char v46 = v35 + 9;
          if (v44) {
            break;
          }
          while (--v47)
          {
            uint64_t v48 = v46 + 2;
            uint64_t v50 = *(v46 - 1);
            unint64_t v49 = *v46;
            swift_bridgeObjectRetain();
            LOBYTE(v50) = sub_25AC68508(v50, v49, v42, v41);
            swift_bridgeObjectRelease();
            char v46 = v48;
            if (v50) {
              goto LABEL_36;
            }
          }
        }
        ++v39;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v39 == v199) {
          goto LABEL_90;
        }
      }
LABEL_36:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v233;
      uint64_t v2 = v245;
    }
  }
  uint64_t v51 = (void *)v1[3];
  if (v51)
  {
    uint64_t v52 = v2[3];
    if (!v52) {
      return 0;
    }
    uint64_t v53 = v51[2];
    if (v53)
    {
      uint64_t v200 = *(void *)(v52 + 16);
      if (!v200) {
        return 0;
      }
      v234 = v1;
      v246 = v2;
      unint64_t v54 = v51[5];
      uint64_t v211 = v51[4];
      uint64_t v222 = v52 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v55 = 0;
      while (1)
      {
        uint64_t v56 = (uint64_t *)(v222 + 16 * v55);
        uint64_t v58 = *v56;
        unint64_t v57 = v56[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v59 = sub_25AC68508(v211, v54, v58, v57);
        swift_bridgeObjectRelease();
        if (v59) {
          break;
        }
        if (v53 != 1)
        {
          uint64_t v60 = v51[6];
          unint64_t v61 = v51[7];
          swift_bridgeObjectRetain();
          LOBYTE(v60) = sub_25AC68508(v60, v61, v58, v57);
          swift_bridgeObjectRelease();
          uint64_t v63 = v53 - 1;
          uint64_t v62 = v51 + 9;
          if (v60) {
            break;
          }
          while (--v63)
          {
            char v64 = v62 + 2;
            uint64_t v66 = *(v62 - 1);
            unint64_t v65 = *v62;
            swift_bridgeObjectRetain();
            LOBYTE(v66) = sub_25AC68508(v66, v65, v58, v57);
            swift_bridgeObjectRelease();
            uint64_t v62 = v64;
            if (v66) {
              goto LABEL_48;
            }
          }
        }
        ++v55;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v55 == v200) {
          goto LABEL_90;
        }
      }
LABEL_48:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v234;
      uint64_t v2 = v246;
    }
  }
  uint64_t v67 = (void *)v1[4];
  if (v67)
  {
    uint64_t v68 = v2[4];
    if (!v68) {
      return 0;
    }
    uint64_t v69 = v67[2];
    if (v69)
    {
      uint64_t v201 = *(void *)(v68 + 16);
      if (!v201) {
        return 0;
      }
      v235 = v1;
      v247 = v2;
      unint64_t v70 = v67[5];
      uint64_t v212 = v67[4];
      uint64_t v223 = v68 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v71 = 0;
      while (1)
      {
        uint64_t v72 = (uint64_t *)(v223 + 16 * v71);
        uint64_t v74 = *v72;
        unint64_t v73 = v72[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v75 = sub_25AC68508(v212, v70, v74, v73);
        swift_bridgeObjectRelease();
        if (v75) {
          break;
        }
        if (v69 != 1)
        {
          uint64_t v76 = v67[6];
          unint64_t v77 = v67[7];
          swift_bridgeObjectRetain();
          LOBYTE(v76) = sub_25AC68508(v76, v77, v74, v73);
          swift_bridgeObjectRelease();
          uint64_t v79 = v69 - 1;
          uint64_t v78 = v67 + 9;
          if (v76) {
            break;
          }
          while (--v79)
          {
            char v80 = v78 + 2;
            uint64_t v82 = *(v78 - 1);
            unint64_t v81 = *v78;
            swift_bridgeObjectRetain();
            LOBYTE(v82) = sub_25AC68508(v82, v81, v74, v73);
            swift_bridgeObjectRelease();
            uint64_t v78 = v80;
            if (v82) {
              goto LABEL_60;
            }
          }
        }
        ++v71;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v71 == v201) {
          goto LABEL_90;
        }
      }
LABEL_60:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v235;
      uint64_t v2 = v247;
    }
  }
  char v83 = (void *)v1[5];
  if (v83)
  {
    uint64_t v84 = v2[5];
    if (!v84) {
      return 0;
    }
    uint64_t v85 = v83[2];
    if (v85)
    {
      uint64_t v202 = *(void *)(v84 + 16);
      if (!v202) {
        return 0;
      }
      v236 = v1;
      v248 = v2;
      unint64_t v86 = v83[5];
      uint64_t v213 = v83[4];
      uint64_t v224 = v84 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v87 = 0;
      while (1)
      {
        uint64_t v88 = (uint64_t *)(v224 + 16 * v87);
        uint64_t v90 = *v88;
        unint64_t v89 = v88[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v91 = sub_25AC68508(v213, v86, v90, v89);
        swift_bridgeObjectRelease();
        if (v91) {
          break;
        }
        if (v85 != 1)
        {
          uint64_t v92 = v83[6];
          unint64_t v93 = v83[7];
          swift_bridgeObjectRetain();
          LOBYTE(v92) = sub_25AC68508(v92, v93, v90, v89);
          swift_bridgeObjectRelease();
          uint64_t v95 = v85 - 1;
          v94 = v83 + 9;
          if (v92) {
            break;
          }
          while (--v95)
          {
            v96 = v94 + 2;
            uint64_t v98 = *(v94 - 1);
            unint64_t v97 = *v94;
            swift_bridgeObjectRetain();
            LOBYTE(v98) = sub_25AC68508(v98, v97, v90, v89);
            swift_bridgeObjectRelease();
            v94 = v96;
            if (v98) {
              goto LABEL_72;
            }
          }
        }
        ++v87;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v87 == v202) {
          goto LABEL_90;
        }
      }
LABEL_72:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v236;
      uint64_t v2 = v248;
    }
  }
  uint64_t v99 = (void *)v1[6];
  if (v99)
  {
    uint64_t v100 = v2[6];
    if (!v100) {
      return 0;
    }
    uint64_t v101 = v99[2];
    if (v101)
    {
      uint64_t v203 = *(void *)(v100 + 16);
      if (!v203) {
        return 0;
      }
      v237 = v1;
      v249 = v2;
      unint64_t v102 = v99[5];
      uint64_t v214 = v99[4];
      uint64_t v225 = v100 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v103 = 0;
      while (1)
      {
        long long v104 = (uint64_t *)(v225 + 16 * v103);
        uint64_t v106 = *v104;
        unint64_t v105 = v104[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v107 = sub_25AC68508(v214, v102, v106, v105);
        swift_bridgeObjectRelease();
        if (v107) {
          break;
        }
        if (v101 != 1)
        {
          uint64_t v108 = v99[6];
          unint64_t v109 = v99[7];
          swift_bridgeObjectRetain();
          LOBYTE(v108) = sub_25AC68508(v108, v109, v106, v105);
          swift_bridgeObjectRelease();
          uint64_t v111 = v101 - 1;
          uint64_t v110 = v99 + 9;
          if (v108) {
            break;
          }
          while (--v111)
          {
            uint64_t v112 = v110 + 2;
            uint64_t v114 = *(v110 - 1);
            unint64_t v113 = *v110;
            swift_bridgeObjectRetain();
            LOBYTE(v114) = sub_25AC68508(v114, v113, v106, v105);
            swift_bridgeObjectRelease();
            uint64_t v110 = v112;
            if (v114) {
              goto LABEL_84;
            }
          }
        }
        ++v103;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v103 == v203) {
          goto LABEL_90;
        }
      }
LABEL_84:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v237;
      uint64_t v2 = v249;
    }
  }
  uint64_t v115 = (void *)v1[7];
  if (v115)
  {
    uint64_t v116 = v2[7];
    if (!v116) {
      return 0;
    }
    uint64_t v117 = v115[2];
    if (v117)
    {
      uint64_t v204 = *(void *)(v116 + 16);
      if (!v204) {
        return 0;
      }
      v238 = v1;
      v250 = v2;
      unint64_t v118 = v115[5];
      uint64_t v215 = v115[4];
      uint64_t v226 = v116 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v119 = 0;
      while (1)
      {
        uint64_t v121 = (uint64_t *)(v226 + 16 * v119);
        uint64_t v123 = *v121;
        unint64_t v122 = v121[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v124 = sub_25AC68508(v215, v118, v123, v122);
        swift_bridgeObjectRelease();
        if (v124) {
          break;
        }
        if (v117 != 1)
        {
          uint64_t v125 = v115[6];
          unint64_t v126 = v115[7];
          swift_bridgeObjectRetain();
          LOBYTE(v125) = sub_25AC68508(v125, v126, v123, v122);
          swift_bridgeObjectRelease();
          uint64_t v128 = v117 - 1;
          objc_super v127 = v115 + 9;
          if (v125) {
            break;
          }
          while (--v128)
          {
            long long v129 = v127 + 2;
            uint64_t v131 = *(v127 - 1);
            unint64_t v130 = *v127;
            swift_bridgeObjectRetain();
            LOBYTE(v131) = sub_25AC68508(v131, v130, v123, v122);
            swift_bridgeObjectRelease();
            objc_super v127 = v129;
            if (v131) {
              goto LABEL_98;
            }
          }
        }
        ++v119;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v120 = 0;
        if (v119 == v204) {
          goto LABEL_91;
        }
      }
LABEL_98:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v238;
      uint64_t v2 = v250;
    }
  }
  long long v132 = (void *)v1[8];
  if (v132)
  {
    uint64_t v133 = v2[8];
    if (!v133) {
      return 0;
    }
    uint64_t v134 = v132[2];
    if (v134)
    {
      uint64_t v205 = *(void *)(v133 + 16);
      if (!v205) {
        return 0;
      }
      v239 = v1;
      v251 = v2;
      unint64_t v135 = v132[5];
      uint64_t v216 = v132[4];
      uint64_t v227 = v133 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v136 = 0;
      while (1)
      {
        long long v137 = (uint64_t *)(v227 + 16 * v136);
        uint64_t v139 = *v137;
        unint64_t v138 = v137[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v140 = sub_25AC68508(v216, v135, v139, v138);
        swift_bridgeObjectRelease();
        if (v140) {
          break;
        }
        if (v134 != 1)
        {
          uint64_t v141 = v132[6];
          unint64_t v142 = v132[7];
          swift_bridgeObjectRetain();
          LOBYTE(v141) = sub_25AC68508(v141, v142, v139, v138);
          swift_bridgeObjectRelease();
          uint64_t v144 = v134 - 1;
          uint64_t v143 = v132 + 9;
          if (v141) {
            break;
          }
          while (--v144)
          {
            uint64_t v145 = v143 + 2;
            uint64_t v147 = *(v143 - 1);
            unint64_t v146 = *v143;
            swift_bridgeObjectRetain();
            LOBYTE(v147) = sub_25AC68508(v147, v146, v139, v138);
            swift_bridgeObjectRelease();
            uint64_t v143 = v145;
            if (v147) {
              goto LABEL_110;
            }
          }
        }
        ++v136;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v120 = 0;
        if (v136 == v205) {
          goto LABEL_91;
        }
      }
LABEL_110:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v239;
      uint64_t v2 = v251;
    }
  }
  unint64_t v148 = (void *)v1[9];
  if (v148)
  {
    uint64_t v149 = v2[9];
    if (!v149) {
      return 0;
    }
    uint64_t v150 = v148[2];
    if (v150)
    {
      uint64_t v206 = *(void *)(v149 + 16);
      if (!v206) {
        return 0;
      }
      v240 = v1;
      v252 = v2;
      unint64_t v151 = v148[5];
      uint64_t v217 = v148[4];
      uint64_t v228 = v149 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v152 = 0;
      while (1)
      {
        uint64_t v153 = (uint64_t *)(v228 + 16 * v152);
        uint64_t v155 = *v153;
        unint64_t v154 = v153[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v156 = sub_25AC68508(v217, v151, v155, v154);
        swift_bridgeObjectRelease();
        if (v156) {
          break;
        }
        if (v150 != 1)
        {
          uint64_t v157 = v148[6];
          unint64_t v158 = v148[7];
          swift_bridgeObjectRetain();
          LOBYTE(v157) = sub_25AC68508(v157, v158, v155, v154);
          swift_bridgeObjectRelease();
          uint64_t v160 = v150 - 1;
          long long v159 = v148 + 9;
          if (v157) {
            break;
          }
          while (--v160)
          {
            long long v161 = v159 + 2;
            uint64_t v163 = *(v159 - 1);
            unint64_t v162 = *v159;
            swift_bridgeObjectRetain();
            LOBYTE(v163) = sub_25AC68508(v163, v162, v155, v154);
            swift_bridgeObjectRelease();
            long long v159 = v161;
            if (v163) {
              goto LABEL_122;
            }
          }
        }
        ++v152;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v120 = 0;
        if (v152 == v206) {
          goto LABEL_91;
        }
      }
LABEL_122:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v240;
      uint64_t v2 = v252;
    }
  }
  long long v164 = (void *)v1[10];
  if (v164)
  {
    uint64_t v165 = v2[10];
    if (!v165) {
      return 0;
    }
    uint64_t v166 = v164[2];
    if (v166)
    {
      uint64_t v207 = *(void *)(v165 + 16);
      if (!v207) {
        return 0;
      }
      v241 = v1;
      v253 = v2;
      unint64_t v167 = v164[5];
      uint64_t v218 = v164[4];
      uint64_t v229 = v165 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v168 = 0;
      while (1)
      {
        long long v169 = (uint64_t *)(v229 + 16 * v168);
        uint64_t v171 = *v169;
        unint64_t v170 = v169[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v172 = sub_25AC68508(v218, v167, v171, v170);
        swift_bridgeObjectRelease();
        if (v172) {
          break;
        }
        if (v166 != 1)
        {
          uint64_t v173 = v164[6];
          unint64_t v174 = v164[7];
          swift_bridgeObjectRetain();
          LOBYTE(v173) = sub_25AC68508(v173, v174, v171, v170);
          swift_bridgeObjectRelease();
          uint64_t v176 = v166 - 1;
          v175 = v164 + 9;
          if (v173) {
            break;
          }
          while (--v176)
          {
            v177 = v175 + 2;
            uint64_t v179 = *(v175 - 1);
            unint64_t v178 = *v175;
            swift_bridgeObjectRetain();
            LOBYTE(v179) = sub_25AC68508(v179, v178, v171, v170);
            swift_bridgeObjectRelease();
            v175 = v177;
            if (v179) {
              goto LABEL_134;
            }
          }
        }
        ++v168;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v120 = 0;
        if (v168 == v207) {
          goto LABEL_91;
        }
      }
LABEL_134:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v241;
      uint64_t v2 = v253;
    }
  }
  id v180 = (void *)v1[11];
  if (!v180) {
    return 1;
  }
  uint64_t v181 = v2[11];
  if (!v181) {
    return 0;
  }
  uint64_t v182 = v180[2];
  if (!v182) {
    return 1;
  }
  uint64_t v230 = *(void *)(v181 + 16);
  if (!v230) {
    return 0;
  }
  unint64_t v183 = v180[5];
  uint64_t v242 = v180[4];
  uint64_t v254 = v181 + 32;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v184 = 0;
  while (1)
  {
    v186 = (uint64_t *)(v254 + 16 * v184);
    uint64_t v188 = *v186;
    unint64_t v187 = v186[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v189 = sub_25AC68508(v242, v183, v188, v187);
    swift_bridgeObjectRelease();
    if (v189) {
      break;
    }
    if (v182 != 1)
    {
      uint64_t v190 = v180[6];
      unint64_t v191 = v180[7];
      swift_bridgeObjectRetain();
      LOBYTE(v190) = sub_25AC68508(v190, v191, v188, v187);
      swift_bridgeObjectRelease();
      uint64_t v193 = v182 - 1;
      v192 = v180 + 9;
      if (v190) {
        break;
      }
      while (--v193)
      {
        v194 = v192 + 2;
        uint64_t v196 = *(v192 - 1);
        unint64_t v195 = *v192;
        swift_bridgeObjectRetain();
        LOBYTE(v196) = sub_25AC68508(v196, v195, v188, v187);
        swift_bridgeObjectRelease();
        v192 = v194;
        if (v196) {
          goto LABEL_149;
        }
      }
    }
    ++v184;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v120 = 0;
    if (v184 == v230) {
      goto LABEL_91;
    }
  }
LABEL_149:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v120 = 1;
LABEL_91:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v120;
}

double sub_25AC7FF28@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_25AC80C0C(a1, v8);
  if (!v2)
  {
    long long v5 = v8[3];
    a2[2] = v8[2];
    a2[3] = v5;
    long long v6 = v8[5];
    a2[4] = v8[4];
    a2[5] = v6;
    double result = *(double *)v8;
    long long v7 = v8[1];
    *a2 = v8[0];
    a2[1] = v7;
  }
  return result;
}

unint64_t sub_25AC7FF74(char a1)
{
  unint64_t result = 0x657079546D657469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x5465636976726573;
      break;
    case 2:
      unint64_t result = 0x6570795479616C70;
      break;
    case 3:
      unint64_t result = 0x6574614379616C70;
      break;
    case 4:
      unint64_t result = 0x726F466F69647561;
      break;
    case 5:
      unint64_t result = 0x6E65526F69647561;
      break;
    case 6:
      unint64_t result = 0x7364497465737361;
      break;
    case 7:
      unint64_t result = 0x707954616964656DLL;
      break;
    case 8:
      unint64_t result = 0x614C64726F636572;
      break;
    case 9:
      unint64_t result = 0x546E6F6974617473;
      break;
    case 10:
      unint64_t result = 0xD000000000000014;
      break;
    case 11:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25AC80130(char a1)
{
  unint64_t result = 0x657079546D657469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x5465636976726573;
      break;
    case 2:
      unint64_t result = 0x6570795479616C70;
      break;
    case 3:
      unint64_t result = 0x6574614379616C70;
      break;
    case 4:
      unint64_t result = 0x726F466F69647561;
      break;
    case 5:
      unint64_t result = 0x6E65526F69647561;
      break;
    case 6:
      unint64_t result = 0x7364497465737361;
      break;
    case 7:
      unint64_t result = 0x707954616964656DLL;
      break;
    case 8:
      unint64_t result = 0x614C64726F636572;
      break;
    case 9:
      unint64_t result = 0x546E6F6974617473;
      break;
    case 10:
      unint64_t result = 0xD000000000000014;
      break;
    case 11:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC802EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  void v9[2] = a1[2];
  v9[3] = v2;
  long long v3 = a1[5];
  v9[4] = a1[4];
  v9[5] = v3;
  long long v4 = a1[1];
  v9[0] = *a1;
  v9[1] = v4;
  long long v5 = a2[3];
  _OWORD v10[2] = a2[2];
  v10[3] = v5;
  long long v6 = a2[5];
  v10[4] = a2[4];
  v10[5] = v6;
  long long v7 = a2[1];
  v10[0] = *a2;
  v10[1] = v7;
  return sub_25AC805FC((uint64_t)v9, (uint64_t)v10) & 1;
}

uint64_t sub_25AC80348(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_25AC7FF74(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_25AC7FF74(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25AC8F208();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25AC803D4()
{
  char v1 = *v0;
  sub_25AC8F278();
  sub_25AC7FF74(v1);
  sub_25AC8EE78();
  swift_bridgeObjectRelease();
  return sub_25AC8F298();
}

uint64_t sub_25AC80438()
{
  sub_25AC7FF74(*v0);
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC8048C()
{
  char v1 = *v0;
  sub_25AC8F278();
  sub_25AC7FF74(v1);
  sub_25AC8EE78();
  swift_bridgeObjectRelease();
  return sub_25AC8F298();
}

uint64_t sub_25AC804EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC8151C();
  *a1 = result;
  return result;
}

unint64_t sub_25AC8051C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25AC7FF74(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25AC80548()
{
  return sub_25AC80130(*v0);
}

uint64_t sub_25AC80550@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC8151C();
  *a1 = result;
  return result;
}

void sub_25AC80578(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_25AC80584(uint64_t a1)
{
  unint64_t v2 = sub_25AC8122C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC805C0(uint64_t a1)
{
  unint64_t v2 = sub_25AC8122C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC805FC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (v4)
  {
    if (!v5 || (sub_25AC75A24(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  long long v7 = *(void **)(a2 + 8);
  if (v6)
  {
    if (!v7 || (sub_25AC75A24(v6, v7) & 1) == 0) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  char v8 = *(void **)(a1 + 16);
  unint64_t v9 = *(void **)(a2 + 16);
  if (v8)
  {
    if (!v9 || (sub_25AC75A24(v8, v9) & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  uint64_t v10 = *(void **)(a1 + 24);
  char v11 = *(void **)(a2 + 24);
  if (v10)
  {
    if (!v11 || (sub_25AC75A24(v10, v11) & 1) == 0) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  unint64_t v13 = *(void **)(a2 + 32);
  if (v12)
  {
    if (!v13 || (sub_25AC75A24(v12, v13) & 1) == 0) {
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void **)(a2 + 40);
  if (v14)
  {
    if (!v15 || (sub_25AC75A24(v14, v15) & 1) == 0) {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  uint64_t v16 = *(void **)(a1 + 48);
  unint64_t v17 = *(void **)(a2 + 48);
  if (v16)
  {
    if (!v17 || (sub_25AC75A24(v16, v17) & 1) == 0) {
      return 0;
    }
  }
  else if (v17)
  {
    return 0;
  }
  uint64_t v18 = *(void **)(a1 + 56);
  char v19 = *(void **)(a2 + 56);
  if (v18)
  {
    if (!v19 || (sub_25AC75A24(v18, v19) & 1) == 0) {
      return 0;
    }
  }
  else if (v19)
  {
    return 0;
  }
  uint64_t v20 = *(void **)(a1 + 64);
  uint64_t v21 = *(void **)(a2 + 64);
  if (v20)
  {
    if (!v21 || (sub_25AC75A24(v20, v21) & 1) == 0) {
      return 0;
    }
  }
  else if (v21)
  {
    return 0;
  }
  unint64_t v22 = *(void **)(a1 + 72);
  uint64_t v23 = *(void **)(a2 + 72);
  if (v22)
  {
    if (!v23 || (sub_25AC75A24(v22, v23) & 1) == 0) {
      return 0;
    }
  }
  else if (v23)
  {
    return 0;
  }
  uint64_t v24 = *(void **)(a1 + 80);
  unint64_t v25 = *(void **)(a2 + 80);
  if (v24)
  {
    if (!v25 || (sub_25AC75A24(v24, v25) & 1) == 0) {
      return 0;
    }
  }
  else if (v25)
  {
    return 0;
  }
  uint64_t v26 = *(void **)(a1 + 88);
  char v27 = *(void **)(a2 + 88);
  if (v26)
  {
    if (v27 && (sub_25AC75A24(v26, v27) & 1) != 0) {
      return 1;
    }
  }
  else if (!v27)
  {
    return 1;
  }
  return 0;
}

uint64_t destroy for MusicContentCriteria()
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

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for MusicContentCriteria(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
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

void *assignWithCopy for MusicContentCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_OWORD *assignWithTake for MusicContentCriteria(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicContentCriteria(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 96)) {
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

uint64_t storeEnumTagSinglePayload for MusicContentCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicContentCriteria()
{
  return &type metadata for MusicContentCriteria;
}

uint64_t sub_25AC80C0C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADC50);
  uint64_t v6 = *(void **)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC8122C();
  sub_25AC8F2A8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v41 = v6;
    uint64_t v42 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
    char v43 = 0;
    sub_25AC6B874();
    sub_25AC8F1E8();
    char v43 = 1;
    uint64_t v40 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v43 = 2;
    uint64_t v39 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v43 = 3;
    unint64_t v38 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v43 = 4;
    uint64_t v37 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    uint64_t v36 = a2;
    char v43 = 5;
    uint64_t v35 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v43 = 6;
    uint64_t v34 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v43 = 7;
    unint64_t v33 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v43 = 8;
    uint64_t v32 = v44;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    uint64_t v10 = v44;
    LOBYTE(v44) = 9;
    char v11 = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25AC8F1D8();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAD0);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_25AC90C90;
    *(void *)(v15 + 32) = v12;
    *(void *)(v15 + 40) = v14;
    uint64_t v16 = v15;
    char v43 = 10;
    sub_25AC8F1E8();
    unint64_t v17 = v44;
    char v43 = 11;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    uint64_t v18 = (uint64_t)v42;
    uint64_t v42 = v44;
    ((void (*)(char *, uint64_t))v41[1])(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v31 = v16;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1(v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = v11;
    swift_bridgeObjectRelease();
    char v19 = v32;
    swift_bridgeObjectRelease();
    uint64_t v20 = v33;
    swift_bridgeObjectRelease();
    unint64_t v41 = v17;
    uint64_t v21 = v34;
    swift_bridgeObjectRelease();
    unint64_t v22 = v35;
    swift_bridgeObjectRelease();
    uint64_t v23 = v37;
    swift_bridgeObjectRelease();
    uint64_t v24 = v38;
    swift_bridgeObjectRelease();
    unint64_t v25 = v39;
    swift_bridgeObjectRelease();
    uint64_t v26 = v40;
    uint64_t result = swift_bridgeObjectRelease();
    char v27 = v36;
    *uint64_t v36 = v26;
    v27[1] = v25;
    v27[2] = v24;
    v27[3] = v23;
    v27[4] = v22;
    v27[5] = v21;
    v27[6] = v20;
    v27[7] = v19;
    uint64_t v28 = v31;
    v27[8] = v30;
    v27[9] = v28;
    unint64_t v29 = v42;
    v27[10] = v41;
    v27[11] = v29;
  }
  return result;
}

unint64_t sub_25AC8122C()
{
  unint64_t result = qword_26A4ADC58;
  if (!qword_26A4ADC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MusicContentCriteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MusicContentCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x25AC813DCLL);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicContentCriteria.CodingKeys()
{
  return &type metadata for MusicContentCriteria.CodingKeys;
}

unint64_t sub_25AC81418()
{
  unint64_t result = qword_26A4ADC60;
  if (!qword_26A4ADC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC60);
  }
  return result;
}

unint64_t sub_25AC81470()
{
  unint64_t result = qword_26A4ADC68;
  if (!qword_26A4ADC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC68);
  }
  return result;
}

unint64_t sub_25AC814C8()
{
  unint64_t result = qword_26A4ADC70;
  if (!qword_26A4ADC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC70);
  }
  return result;
}

uint64_t sub_25AC8151C()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC) {
    return 12;
  }
  else {
    return v0;
  }
}

uint64_t destroy for TVDeviceCriteria()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TVDeviceCriteria(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
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

void *assignWithCopy for TVDeviceCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for TVDeviceCriteria(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TVDeviceCriteria(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 64)) {
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

uint64_t storeEnumTagSinglePayload for TVDeviceCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVDeviceCriteria()
{
  return &type metadata for TVDeviceCriteria;
}

double sub_25AC818C8@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_25AC81DF4(a1, v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_25AC8190C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = a1[3];
  _OWORD v7[2] = a1[2];
  _OWORD v7[3] = v3;
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  long long v5 = a2[3];
  v8[2] = a2[2];
  v8[3] = v5;
  return sub_25AC81CC8((uint64_t)v7, (uint64_t)v8) & 1;
}

uint64_t sub_25AC81958(unsigned __int8 *a1, char *a2)
{
  return sub_25AC73360(*a1, *a2);
}

uint64_t sub_25AC81964()
{
  return sub_25AC8B120();
}

uint64_t sub_25AC81970()
{
  return sub_25AC8AFC0();
}

uint64_t sub_25AC81978()
{
  return sub_25AC8B120();
}

uint64_t sub_25AC81980@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC8254C();
  *a1 = result;
  return result;
}

void sub_25AC819B0(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xEC000000796C696DLL;
  uint64_t v3 = 0x6146656369766564;
  switch(*v1)
  {
    case 1:
      uint64_t v3 = 0x614E656369766564;
      unint64_t v2 = 0xEA0000000000656DLL;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x6F4D656369766564;
      *(void *)(a1 + 8) = 0xEB000000006C6564;
      break;
    case 3:
      *(void *)a1 = 0x6973726556707061;
      *(void *)(a1 + 8) = 0xEA00000000006E6FLL;
      break;
    case 4:
      strcpy((char *)a1, "hlsjsVersion");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 5:
      *(void *)a1 = 0x657261776D726966;
      *(void *)(a1 + 8) = 0xEF6E6F6973726556;
      break;
    case 6:
      *(void *)a1 = 0x6F6973726556736FLL;
      *(void *)(a1 + 8) = 0xE90000000000006ELL;
      break;
    case 7:
      *(void *)a1 = 29551;
      *(void *)(a1 + 8) = 0xE200000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_25AC81AF4()
{
  uint64_t result = 0x6146656369766564;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x614E656369766564;
      break;
    case 2:
      uint64_t result = 0x6F4D656369766564;
      break;
    case 3:
      uint64_t result = 0x6973726556707061;
      break;
    case 4:
      uint64_t result = 0x726556736A736C68;
      break;
    case 5:
      uint64_t result = 0x657261776D726966;
      break;
    case 6:
      uint64_t result = 0x6F6973726556736FLL;
      break;
    case 7:
      uint64_t result = 29551;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC81C1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC8254C();
  *a1 = result;
  return result;
}

void sub_25AC81C44(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_25AC81C50(uint64_t a1)
{
  unint64_t v2 = sub_25AC8225C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC81C8C(uint64_t a1)
{
  unint64_t v2 = sub_25AC8225C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC81CC8(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  long long v5 = *(void **)a2;
  if (v4)
  {
    if (!v5 || (sub_25AC75A24(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  long long v6 = *(void **)(a1 + 8);
  BOOL v7 = *(void **)(a2 + 8);
  if (v6)
  {
    if (!v7 || (sub_25AC75A24(v6, v7) & 1) == 0) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  long long v8 = *(void **)(a1 + 16);
  long long v9 = *(void **)(a2 + 16);
  if (v8)
  {
    if (!v9 || (sub_25AC75A24(v8, v9) & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  uint64_t v10 = *(void **)(a1 + 24);
  char v11 = *(void **)(a2 + 24);
  if (v10)
  {
    if (!v11 || (sub_25AC75A24(v10, v11) & 1) == 0) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void **)(a2 + 32);
  if (v12)
  {
    if (!v13 || (sub_25AC75A24(v12, v13) & 1) == 0) {
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void **)(a2 + 40);
  if (v14)
  {
    if (!v15 || (sub_25AC75A24(v14, v15) & 1) == 0) {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  uint64_t v16 = *(void **)(a1 + 48);
  unint64_t v17 = *(void **)(a2 + 48);
  if (v16)
  {
    if (!v17 || (sub_25AC75A24(v16, v17) & 1) == 0) {
      return 0;
    }
  }
  else if (v17)
  {
    return 0;
  }
  uint64_t v18 = *(void **)(a1 + 56);
  char v19 = *(void **)(a2 + 56);
  if (v18)
  {
    if (v19 && (sub_25AC75A24(v18, v19) & 1) != 0) {
      return 1;
    }
  }
  else if (!v19)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_25AC81DF4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADC78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC8225C();
  sub_25AC8F2A8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v25 = v6;
    uint64_t v26 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
    char v27 = 2;
    sub_25AC6B874();
    sub_25AC8F1E8();
    char v27 = 0;
    uint64_t v24 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v27 = 1;
    uint64_t v23 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v27 = 3;
    unint64_t v22 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v27 = 4;
    uint64_t v21 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v27 = 5;
    uint64_t v20 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v27 = 6;
    uint64_t v10 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    char v27 = 7;
    char v11 = v28;
    swift_bridgeObjectRetain();
    sub_25AC8F1E8();
    uint64_t v12 = v26;
    uint64_t v26 = v28;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    uint64_t v13 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = v20;
    swift_bridgeObjectRelease();
    uint64_t v15 = v21;
    swift_bridgeObjectRelease();
    uint64_t v16 = v24;
    swift_bridgeObjectRelease();
    unint64_t v17 = v22;
    swift_bridgeObjectRelease();
    uint64_t v18 = v23;
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v12 = v18;
    v12[1] = v17;
    v12[2] = v16;
    v12[3] = v15;
    v12[4] = v14;
    v12[5] = v10;
    char v19 = v26;
    v12[6] = v13;
    v12[7] = v19;
  }
  return result;
}

unint64_t sub_25AC8225C()
{
  unint64_t result = qword_26A4ADC80;
  if (!qword_26A4ADC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC80);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TVDeviceCriteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TVDeviceCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC8240CLL);
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

ValueMetadata *type metadata accessor for TVDeviceCriteria.CodingKeys()
{
  return &type metadata for TVDeviceCriteria.CodingKeys;
}

unint64_t sub_25AC82448()
{
  unint64_t result = qword_26A4ADC88;
  if (!qword_26A4ADC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC88);
  }
  return result;
}

unint64_t sub_25AC824A0()
{
  unint64_t result = qword_26A4ADC90;
  if (!qword_26A4ADC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC90);
  }
  return result;
}

unint64_t sub_25AC824F8()
{
  unint64_t result = qword_26A4ADC98;
  if (!qword_26A4ADC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADC98);
  }
  return result;
}

uint64_t sub_25AC8254C()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t sub_25AC82644(uint64_t a1, uint64_t a2)
{
  int v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = sub_25AC8EDD8();
  uint64_t v6 = v5;
  swift_retain();
  v3(a2, v4, v6);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC8276C(uint64_t a1)
{
  char v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_25AC8ED88();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_25AC82890(uint64_t a1)
{
  char v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  int v3 = (void *)v1(v2);
  swift_release();

  return v3;
}

uint64_t sub_25AC829F4(uint64_t a1, uint64_t a2)
{
  v3[149] = v2;
  v3[148] = a2;
  v3[147] = a1;
  uint64_t v4 = sub_25AC8EB58();
  v3[150] = v4;
  v3[151] = *(void *)(v4 - 8);
  v3[152] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25AC82ABC, 0, 0);
}

uint64_t sub_25AC82ABC()
{
  *(void *)(v0 + 1160) = objc_msgSend(*(id *)(v0 + 1184), sel_code);
  sub_25AC8F1F8();
  sub_25AC8EB48();
  swift_bridgeObjectRelease();
  char v1 = (void *)sub_25AC846A0(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v3 = v1[2];
  unint64_t v2 = v1[3];
  if (v3 >= v2 >> 1) {
    char v1 = (void *)sub_25AC846A0(v2 > 1, v3 + 1, 1, v1);
  }
  uint64_t v4 = *(void *)(v0 + 1216);
  uint64_t v5 = *(void *)(v0 + 1208);
  uint64_t v6 = *(void *)(v0 + 1200);
  BOOL v7 = *(void **)(v0 + 1192);
  uint64_t v8 = *(void *)(v0 + 1176);
  v1[2] = v3 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))((unint64_t)v1+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v3, v4, v6);
  *(void *)(v0 + 1168) = v1;
  *(void *)(swift_task_alloc() + 16) = v0 + 1168;
  sub_25AC84DF4(v8, (void (*)(uint64_t, uint64_t, uint64_t))sub_25AC84C08);
  swift_task_dealloc();
  uint64_t v9 = v7[16];
  uint64_t v10 = v7[17];
  __swift_project_boxed_opaque_existential_1(v7 + 13, v9);
  uint64_t v11 = *(void *)(v0 + 1168);
  *(void *)(v0 + 1224) = v11;
  uint64_t v12 = *(int **)(v10 + 48);
  *(void *)(v0 + 1232) = swift_getAssociatedTypeWitness();
  uint64_t v13 = sub_25AC8F098();
  *(void *)(v0 + 1240) = v13;
  *(void *)(v0 + 1248) = *(void *)(v13 - 8);
  uint64_t v14 = swift_task_alloc();
  *(void *)(v0 + 1256) = v14;
  unint64_t v17 = (int *)((char *)v12 + *v12);
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 1264) = v15;
  void *v15 = v0;
  v15[1] = sub_25AC82DB8;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t, uint64_t))v17)(v14, 0, v11, v9, v10);
}

uint64_t sub_25AC82DB8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25AC82ED0, 0, 0);
}

uint64_t sub_25AC82ED0()
{
  uint64_t v1 = (_OWORD *)(v0 + 1072);
  uint64_t v2 = *(void *)(v0 + 1256);
  uint64_t v3 = *(void *)(v0 + 1232);
  uint64_t v4 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1248) + 8))(v2, *(void *)(v0 + 1240));
    swift_task_dealloc();
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 1088) = 0u;
  }
  else
  {
    *(void *)(v0 + 1096) = v3;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 1072));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 32))(boxed_opaque_existential_0, v2, v3);
    swift_task_dealloc();
  }
  sub_25AC84F94(v0 + 1072, v0 + 1104);
  if (!*(void *)(v0 + 1128))
  {
    sub_25AC77B50(v0 + 1104, &qword_26A4ADCB8);
    goto LABEL_18;
  }
  uint64_t v6 = (uint64_t *)(v0 + 1152);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    uint64_t v33 = *(void *)(v0 + 1192);
    uint64_t v34 = *(void **)(v0 + 1184);
    uint64_t v35 = *(void *)(v0 + 1176);
    uint64_t v36 = *(void (**)(void))(v33 + 72);
    sub_25AC84FFC(v0 + 752);
    sub_25AC77BAC(v0 + 752, v0 + 200, &qword_26A4ADCC0);
    sub_25AC85020(v35, v0 + 200, (uint64_t)objc_msgSend(v34, sel_code), 1);
    v36();
    uint64_t v37 = swift_bridgeObjectRelease();
    id v38 = (id)(*(uint64_t (**)(uint64_t))(v33 + 88))(v37);
    uint64_t v39 = (uint64_t)v1;
    goto LABEL_19;
  }
  uint64_t v7 = *v6;
  uint64_t v8 = *(void *)(*v6 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v56 = (_OWORD *)(v0 + 384);
  uint64_t v57 = v0 + 16;
  uint64_t v9 = (_OWORD *)(v0 + 568);
  swift_bridgeObjectRetain();
  long long v10 = *(_OWORD *)(v7 + 32);
  long long v11 = *(_OWORD *)(v7 + 48);
  long long v12 = *(_OWORD *)(v7 + 80);
  *(_OWORD *)(v0 + 600) = *(_OWORD *)(v7 + 64);
  *(_OWORD *)(v0 + 616) = v12;
  *(_OWORD *)(v0 + 568) = v10;
  *(_OWORD *)(v0 + 584) = v11;
  long long v13 = *(_OWORD *)(v7 + 96);
  long long v14 = *(_OWORD *)(v7 + 112);
  long long v15 = *(_OWORD *)(v7 + 144);
  *(_OWORD *)(v0 + 664) = *(_OWORD *)(v7 + 128);
  *(_OWORD *)(v0 + 680) = v15;
  *(_OWORD *)(v0 + 632) = v13;
  *(_OWORD *)(v0 + 648) = v14;
  long long v16 = *(_OWORD *)(v7 + 160);
  long long v17 = *(_OWORD *)(v7 + 176);
  long long v18 = *(_OWORD *)(v7 + 192);
  *(void *)(v0 + 744) = *(void *)(v7 + 208);
  *(_OWORD *)(v0 + 712) = v17;
  *(_OWORD *)(v0 + 728) = v18;
  *(_OWORD *)(v0 + 696) = v16;
  uint64_t v19 = v8 - 1;
  for (uint64_t i = 216; ; i += 184)
  {
    sub_25AC77BAC(v0 + 616, v0 + 936, &qword_26A4AD8F0);
    if (sub_25AC70E28(v0 + 936) == 1) {
      goto LABEL_13;
    }
    int v21 = *(unsigned __int8 *)(v0 + 936);
    if (v21 == 2) {
      goto LABEL_13;
    }
    uint64_t v22 = *(void *)(v0 + 576);
    uint64_t v59 = *(void *)(v0 + 568);
    uint64_t v60 = *(void *)(v0 + 584);
    uint64_t v58 = *(void *)(v0 + 592);
    if ((v21 & 1) == 0) {
      break;
    }
    char v23 = sub_25AC8F208();
    sub_25AC856AC(v0 + 568);
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_23;
    }
    sub_25AC857D8(v0 + 568);
LABEL_13:
    if (!v19)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v1 = (_OWORD *)(v0 + 1072);
      goto LABEL_18;
    }
    long long v24 = *(_OWORD *)(v7 + i);
    long long v25 = *(_OWORD *)(v7 + i + 16);
    long long v26 = *(_OWORD *)(v7 + i + 48);
    *(_OWORD *)(v0 + 600) = *(_OWORD *)(v7 + i + 32);
    *(_OWORD *)(v0 + 616) = v26;
    *uint64_t v9 = v24;
    *(_OWORD *)(v0 + 584) = v25;
    long long v27 = *(_OWORD *)(v7 + i + 64);
    long long v28 = *(_OWORD *)(v7 + i + 80);
    long long v29 = *(_OWORD *)(v7 + i + 112);
    *(_OWORD *)(v0 + 664) = *(_OWORD *)(v7 + i + 96);
    *(_OWORD *)(v0 + 680) = v29;
    *(_OWORD *)(v0 + 632) = v27;
    *(_OWORD *)(v0 + 648) = v28;
    long long v30 = *(_OWORD *)(v7 + i + 128);
    long long v31 = *(_OWORD *)(v7 + i + 144);
    long long v32 = *(_OWORD *)(v7 + i + 160);
    *(void *)(v0 + 744) = *(void *)(v7 + i + 176);
    *(_OWORD *)(v0 + 712) = v31;
    *(_OWORD *)(v0 + 728) = v32;
    *(_OWORD *)(v0 + 696) = v30;
    --v19;
  }
  sub_25AC856AC(v0 + 568);
  swift_bridgeObjectRelease();
LABEL_23:
  uint64_t v42 = *(void *)(v0 + 1192);
  char v43 = *(void **)(v0 + 1184);
  uint64_t v44 = *(void *)(v0 + 1176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v45 = *(_OWORD *)(v0 + 712);
  *(_OWORD *)(v0 + 512) = *(_OWORD *)(v0 + 696);
  *(_OWORD *)(v0 + 528) = v45;
  *(_OWORD *)(v0 + 544) = *(_OWORD *)(v0 + 728);
  *(void *)(v0 + 560) = *(void *)(v0 + 744);
  long long v46 = *(_OWORD *)(v0 + 648);
  *(_OWORD *)(v0 + 448) = *(_OWORD *)(v0 + 632);
  *(_OWORD *)(v0 + 464) = v46;
  long long v47 = *(_OWORD *)(v0 + 680);
  *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 664);
  *(_OWORD *)(v0 + 496) = v47;
  long long v48 = *(_OWORD *)(v0 + 584);
  *uint64_t v56 = *v9;
  *(_OWORD *)(v0 + 400) = v48;
  long long v49 = *(_OWORD *)(v0 + 616);
  *(_OWORD *)(v0 + 416) = *(_OWORD *)(v0 + 600);
  *(_OWORD *)(v0 + 432) = v49;
  nullsub_1(v56);
  sub_25AC77BAC((uint64_t)v56, v57, &qword_26A4ADCC0);
  uint64_t v50 = *(void (**)(uint64_t))(v42 + 72);
  sub_25AC856AC(v0 + 568);
  uint64_t v51 = sub_25AC85020(v44, v57, (uint64_t)objc_msgSend(v43, sel_code), 0);
  sub_25AC857D8(v0 + 568);
  v50(v51);
  swift_bridgeObjectRelease();
  uint64_t v52 = (objc_class *)type metadata accessor for QOSAlertMessage();
  uint64_t v53 = (char *)objc_allocWithZone(v52);
  unint64_t v54 = &v53[OBJC_IVAR___QOSAlertMessageInternal_title];
  *(void *)unint64_t v54 = v59;
  *((void *)v54 + 1) = v22;
  uint64_t v55 = &v53[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(void *)uint64_t v55 = v60;
  *((void *)v55 + 1) = v58;
  *(void *)(v0 + 1136) = v53;
  *(void *)(v0 + 1144) = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v38 = objc_msgSendSuper2((objc_super *)(v0 + 1136), sel_init);
  sub_25AC857D8(v0 + 568);
  uint64_t v39 = v0 + 1072;
LABEL_19:
  sub_25AC77B50(v39, &qword_26A4ADCB8);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v40 = *(uint64_t (**)(id))(v0 + 8);
  return v40(v38);
}

uint64_t sub_25AC833EC(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  uint64_t v6 = sub_25AC8EB58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
  sub_25AC85A98();
  sub_25AC8EDB8();
  sub_25AC8EB48();
  swift_bridgeObjectRelease();
  long long v10 = *a4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    long long v10 = (void *)sub_25AC846A0(0, v10[2] + 1, 1, v10);
    *a4 = v10;
  }
  unint64_t v13 = v10[2];
  unint64_t v12 = v10[3];
  if (v13 >= v12 >> 1)
  {
    long long v10 = (void *)sub_25AC846A0(v12 > 1, v13 + 1, 1, v10);
    *a4 = v10;
  }
  _OWORD v10[2] = v13 + 1;
  return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v13, v9, v6);
}

uint64_t sub_25AC8372C(int a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
  uint64_t v6 = sub_25AC8ED88();
  v4[5] = v6;
  id v7 = a2;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v4[6] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_25AC83828;
  return sub_25AC829F4(v6, (uint64_t)v7);
}

uint64_t sub_25AC83828(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_25AC839B4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void (**)(uint64_t))(v3 + 72);
  sub_25AC84FFC((uint64_t)v15);
  sub_25AC77BAC((uint64_t)v15, (uint64_t)v14, &qword_26A4ADCC0);
  id v7 = objc_msgSend(a2, sel_code);
  if (*(void *)(sub_25AC83D84(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAF0);
    uint64_t v8 = sub_25AC8F1B8();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  uint64_t v13 = v8;
  uint64_t v9 = (void *)swift_bridgeObjectRetain();
  sub_25AC84874(v9, 1, &v13);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_25AC85020(v13, (uint64_t)v14, (uint64_t)v7, 1);
  swift_release();
  v6(v10);
  uint64_t v11 = swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v3 + 88))(v11);
}

uint64_t sub_25AC83B00(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_25AC83B24, 0, 0);
}

uint64_t sub_25AC83B24()
{
  uint64_t v8 = v0;
  if (*(void *)(sub_25AC83D84(v0[3]) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADAF0);
    uint64_t v1 = sub_25AC8F1B8();
  }
  else
  {
    uint64_t v1 = MEMORY[0x263F8EE80];
  }
  uint64_t v7 = v1;
  uint64_t v2 = (void *)swift_bridgeObjectRetain();
  sub_25AC84874(v2, 1, &v7);
  swift_bridgeObjectRelease();
  uint64_t v3 = v7;
  v0[6] = v7;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25AC83C6C;
  uint64_t v5 = v0[4];
  return sub_25AC829F4(v3, v5);
}

uint64_t sub_25AC83C6C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25AC83D84(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = a1;
    uint64_t v32 = MEMORY[0x263F8EE78];
    sub_25AC84C10(0, v1, 0);
    uint64_t v2 = v32;
    uint64_t v5 = sub_25AC84D6C(v3);
    uint64_t v6 = 0;
    uint64_t v7 = v3 + 64;
    char v8 = *(unsigned char *)(v3 + 32);
    uint64_t v26 = v3 + 80;
    int64_t v27 = v1;
    int v28 = v4;
    uint64_t v29 = v3 + 64;
    uint64_t v30 = v3;
    while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << v8)
    {
      unint64_t v11 = (unint64_t)v5 >> 6;
      if ((*(void *)(v7 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
        goto LABEL_41;
      }
      if (*(_DWORD *)(v3 + 36) != v4) {
        goto LABEL_42;
      }
      int v12 = *(char *)(*(void *)(v3 + 48) + v5);
      uint64_t v13 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v5);
      uint64_t v14 = *(void *)(*(void *)(v3 + 56) + 8 * v5);
      uint64_t v31 = v6;
      if (v12 < 0)
      {
        unint64_t v16 = 0x657079546D657469;
        unint64_t v15 = 0xE900000000000073;
        switch(v13 & 0x7F)
        {
          case 1:
            unint64_t v15 = 0xE800000000000000;
            unint64_t v16 = 0x7364497465737361;
            break;
          case 2:
            unint64_t v16 = 0x5465636976726573;
            goto LABEL_24;
          case 3:
            unint64_t v15 = 0xEA00000000007365;
            unint64_t v16 = 0x707954616964656DLL;
            break;
          case 4:
            unint64_t v16 = 0x6570795479616C70;
            break;
          case 5:
            unint64_t v15 = 0xEE00736569726F67;
            unint64_t v16 = 0x6574614379616C70;
            break;
          case 6:
            unint64_t v15 = 0xEC0000007374616DLL;
            unint64_t v16 = 0x726F466F69647561;
            break;
          case 7:
            unint64_t v15 = 0xEF736E6F69746964;
            unint64_t v16 = 0x6E65526F69647561;
            break;
          case 8:
            unint64_t v15 = 0xEC000000736C6562;
            unint64_t v16 = 0x614C64726F636572;
            break;
          case 9:
            unint64_t v16 = 0x546E6F6974617473;
LABEL_24:
            unint64_t v15 = 0xEC00000073657079;
            break;
          case 0xALL:
            unint64_t v15 = 0x800000025AC92020;
            unint64_t v16 = 0xD000000000000014;
            break;
          case 0xBLL:
            unint64_t v16 = 0xD000000000000016;
            unint64_t v15 = 0x800000025AC92040;
            break;
          case 0xCLL:
LABEL_14:
            unint64_t v15 = 0xE600000000000000;
            unint64_t v16 = 0x656C61636F6CLL;
            break;
          default:
            break;
        }
      }
      else
      {
        unint64_t v15 = 0xEB00000000657079;
        unint64_t v16 = 0x54746E65746E6F63;
        switch(v13)
        {
          case 1:
            unint64_t v15 = 0xE700000000000000;
            unint64_t v16 = 0x6449646E617262;
            break;
          case 2:
            unint64_t v15 = 0xEF7265696669746ELL;
            unint64_t v16 = 0x656449616964656DLL;
            break;
          case 3:
            goto LABEL_14;
          default:
            break;
        }
      }
      unint64_t v18 = *(void *)(v32 + 16);
      unint64_t v17 = *(void *)(v32 + 24);
      swift_bridgeObjectRetain();
      if (v18 >= v17 >> 1) {
        sub_25AC84C10((void *)(v17 > 1), v18 + 1, 1);
      }
      *(void *)(v32 + 16) = v18 + 1;
      uint64_t v19 = (void *)(v32 + 24 * v18);
      v19[4] = v16;
      void v19[5] = v15;
      v19[6] = v14;
      uint64_t v3 = v30;
      char v8 = *(unsigned char *)(v30 + 32);
      unint64_t v9 = 1 << v8;
      if (v5 >= 1 << v8) {
        goto LABEL_43;
      }
      uint64_t v7 = v29;
      uint64_t v20 = *(void *)(v29 + 8 * v11);
      if ((v20 & (1 << v5)) == 0) {
        goto LABEL_44;
      }
      int v4 = v28;
      if (*(_DWORD *)(v30 + 36) != v28) {
        goto LABEL_45;
      }
      unint64_t v21 = v20 & (-2 << (v5 & 0x3F));
      if (v21)
      {
        unint64_t v9 = __clz(__rbit64(v21)) | v5 & 0xFFFFFFFFFFFFFFC0;
        int64_t v10 = v27;
      }
      else
      {
        unint64_t v22 = v11 + 1;
        unint64_t v23 = (v9 + 63) >> 6;
        int64_t v10 = v27;
        if (v11 + 1 < v23)
        {
          unint64_t v24 = *(void *)(v29 + 8 * v22);
          if (v24)
          {
LABEL_38:
            unint64_t v9 = __clz(__rbit64(v24)) + (v22 << 6);
          }
          else
          {
            while (v23 - 2 != v11)
            {
              unint64_t v24 = *(void *)(v26 + 8 * v11++);
              if (v24)
              {
                unint64_t v22 = v11 + 1;
                goto LABEL_38;
              }
            }
          }
        }
      }
      uint64_t v6 = v31 + 1;
      uint64_t v5 = v9;
      if (v31 + 1 == v10) {
        return v2;
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    JUMPOUT(0x25AC841B8);
  }
  return v2;
}

uint64_t sub_25AC841FC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TVPlaybackErrorMessage()
{
  return self;
}

uint64_t sub_25AC84278(uint64_t a1, void *a2)
{
  return sub_25AC839B4(a1, a2);
}

uint64_t sub_25AC8429C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25AC7BACC;
  _OWORD v7[4] = a2;
  v7[5] = v6;
  _OWORD v7[3] = a1;
  return MEMORY[0x270FA2498](sub_25AC83B24, 0, 0);
}

uint64_t sub_25AC8435C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  int v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *int v4 = v3;
  v4[1] = sub_25AC7C4B0;
  return v6();
}

uint64_t sub_25AC84428(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25AC7C4B0;
  return v7();
}

uint64_t sub_25AC844F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25AC8EFD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25AC8EFC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25AC77B50(a1, &qword_26B331E38);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25AC8EFB8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

size_t sub_25AC846A0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCD0);
  uint64_t v10 = *(void *)(sub_25AC8EB58() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25AC8EB58() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
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
  return (size_t)v13;
}

void sub_25AC84874(void *a1, char a2, void *a3)
{
  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v41 = a1[2];
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = a1[6];
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_25AC75F90(v7, v6);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_25AC76B04();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v7;
    v20[1] = v6;
    *(void *)(v19[7] + 8 * v11) = v8;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v23;
    uint64_t v24 = v41 - 1;
    if (v41 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    long long v25 = a1 + 9;
    while (1)
    {
      uint64_t v27 = *(v25 - 2);
      uint64_t v26 = *(v25 - 1);
      uint64_t v28 = *v25;
      uint64_t v29 = (void *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_25AC75F90(v27, v26);
      uint64_t v32 = v29[2];
      BOOL v33 = (v31 & 1) == 0;
      BOOL v22 = __OFADD__(v32, v33);
      uint64_t v34 = v32 + v33;
      if (v22) {
        break;
      }
      char v35 = v31;
      if (v29[3] < v34)
      {
        sub_25AC764A8(v34, 1);
        unint64_t v30 = sub_25AC75F90(v27, v26);
        if ((v35 & 1) != (v36 & 1)) {
          goto LABEL_25;
        }
      }
      if (v35) {
        goto LABEL_10;
      }
      uint64_t v37 = (void *)*a3;
      *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      id v38 = (uint64_t *)(v37[6] + 16 * v30);
      *id v38 = v27;
      v38[1] = v26;
      *(void *)(v37[7] + 8 * v30) = v28;
      uint64_t v39 = v37[2];
      BOOL v22 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v22) {
        goto LABEL_24;
      }
      v37[2] = v40;
      v25 += 3;
      if (!--v24) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_25AC764A8(v14, a2 & 1);
  unint64_t v16 = sub_25AC75F90(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    unint64_t v18 = (void *)swift_allocError();
    swift_willThrow();
    MEMORY[0x261152A20](v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E48);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_25AC8F228();
  __break(1u);
LABEL_26:
  sub_25AC8F158();
  sub_25AC8EED8();
  sub_25AC8F178();
  sub_25AC8EED8();
  sub_25AC8F188();
  __break(1u);
}

uint64_t sub_25AC84C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25AC833EC(a1, a2, a3, *(void ***)(v3 + 16));
}

void *sub_25AC84C10(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_25AC84C30(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_25AC84C30(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCD8);
    char v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    _OWORD v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCE0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_25AC84D6C(uint64_t a1)
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

uint64_t sub_25AC84DF4(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    BOOL v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v8) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25AC84F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_25AC84FFC(uint64_t a1)
{
  *(void *)(a1 + 176) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_25AC85020(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_25AC767C0(0xD000000000000014, 0x800000025AC92B10, 0x6449676F6C616964, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v66 = v7;
  sub_25AC767C0(0xD000000000000014, 0x800000025AC92B10, 0x7954676F6C616964, 0xEA00000000006570, v9);
  swift_bridgeObjectRelease();
  BOOL v10 = (a4 & 1) == 0;
  if (a4) {
    uint64_t v11 = 0x746C7561666564;
  }
  else {
    uint64_t v11 = 0x6465636E61686E65;
  }
  if (v10) {
    uint64_t v12 = 0xE800000000000000;
  }
  else {
    uint64_t v12 = 0xE700000000000000;
  }
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_25AC767C0(v11, v12, 0xD000000000000018, 0x800000025AC92B30, v13);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_25AC8F1F8();
  uint64_t v16 = v15;
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v66 = v7;
  sub_25AC767C0(v14, v16, 0x646F43726F727265, 0xE900000000000065, v17);
  uint64_t v18 = v7;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16))
  {
    unint64_t v19 = sub_25AC75F90(0x656C61636F6CLL, 0xE600000000000000);
    if (v20)
    {
      uint64_t v21 = *(void **)(*(void *)(a1 + 56) + 8 * v19);
      if (v21[2])
      {
        uint64_t v22 = v21[4];
        uint64_t v23 = v21[5];
        swift_bridgeObjectRetain();
        char v24 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v66 = v7;
        sub_25AC767C0(v22, v23, 0x656C61636F6CLL, 0xE600000000000000, v24);
        swift_bridgeObjectRelease();
      }
    }
    if (*(void *)(a1 + 16))
    {
      unint64_t v25 = sub_25AC75F90(0x656449616964656DLL, 0xEF7265696669746ELL);
      if (v26)
      {
        uint64_t v27 = *(void **)(*(void *)(a1 + 56) + 8 * v25);
        if (v27[2])
        {
          uint64_t v28 = v27[4];
          uint64_t v29 = v27[5];
          swift_bridgeObjectRetain();
          char v30 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v66 = v7;
          sub_25AC767C0(v28, v29, 0x656449616964656DLL, 0xEF7265696669746ELL, v30);
          swift_bridgeObjectRelease();
        }
      }
      if (*(void *)(a1 + 16))
      {
        unint64_t v31 = sub_25AC75F90(0x54746E65746E6F63, 0xEB00000000657079);
        if (v32)
        {
          BOOL v33 = *(void **)(*(void *)(a1 + 56) + 8 * v31);
          if (v33[2])
          {
            uint64_t v34 = v33[4];
            uint64_t v35 = v33[5];
            swift_bridgeObjectRetain();
            char v36 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v66 = v7;
            sub_25AC767C0(v34, v35, 0x54746E65746E6F63, 0xEB00000000657079, v36);
            swift_bridgeObjectRelease();
          }
        }
        if (*(void *)(a1 + 16))
        {
          unint64_t v37 = sub_25AC75F90(0x6449646E617262, 0xE700000000000000);
          if (v38)
          {
            uint64_t v39 = *(void **)(*(void *)(a1 + 56) + 8 * v37);
            if (v39[2])
            {
              uint64_t v40 = v39[4];
              uint64_t v41 = v39[5];
              swift_bridgeObjectRetain();
              char v42 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&long long v66 = v7;
              sub_25AC767C0(v40, v41, 0x6449646E617262, 0xE700000000000000, v42);
              swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
  }
  sub_25AC77BAC(a2, (uint64_t)v64, &qword_26A4ADCC0);
  if (sub_25AC85A80((uint64_t)v64) != 1)
  {
    v69[5] = v64[8];
    v69[6] = v64[9];
    v69[7] = v64[10];
    uint64_t v70 = v65;
    v69[1] = v64[4];
    v69[2] = v64[5];
    v69[3] = v64[6];
    v69[4] = v64[7];
    long long v66 = v64[0];
    long long v67 = v64[1];
    long long v68 = v64[2];
    v69[0] = v64[3];
    sub_25AC77BAC((uint64_t)v69, (uint64_t)v61, &qword_26A4AD8F0);
    sub_25AC77BAC((uint64_t)v61, (uint64_t)v62, &qword_26A4AD8F0);
    if (sub_25AC70E28((uint64_t)v62) != 1)
    {
      if ((unint64_t)v63 >= 2 && v63[2])
      {
        uint64_t v43 = v63[4];
        uint64_t v44 = v63[5];
        swift_bridgeObjectRetain();
        char v45 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v7;
        sub_25AC767C0(v43, v44, 0x6146656369766564, 0xEC000000796C696DLL, v45);
        swift_bridgeObjectRelease();
      }
      sub_25AC77BAC((uint64_t)v61, (uint64_t)v56, &qword_26A4AD8F0);
      if (v57 != 1 && v58 && v58[2])
      {
        uint64_t v46 = v58[4];
        uint64_t v47 = v58[5];
        swift_bridgeObjectRetain();
        char v48 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v7;
        sub_25AC767C0(v46, v47, 0x6F4D656369766564, 0xEB000000006C6564, v48);
        uint64_t v18 = v56[0];
        swift_bridgeObjectRelease();
      }
      sub_25AC77BAC((uint64_t)v61, (uint64_t)v56, &qword_26A4AD8F0);
      if (v57 != 1 && v60 && v60[2])
      {
        uint64_t v49 = v60[4];
        uint64_t v50 = v60[5];
        swift_bridgeObjectRetain();
        char v51 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v18;
        sub_25AC767C0(v49, v50, 29551, 0xE200000000000000, v51);
        uint64_t v18 = v56[0];
        swift_bridgeObjectRelease();
      }
      sub_25AC77BAC((uint64_t)v61, (uint64_t)v56, &qword_26A4AD8F0);
      if (v57 != 1 && v59 && v59[2])
      {
        uint64_t v52 = v59[4];
        uint64_t v53 = v59[5];
        swift_bridgeObjectRetain();
        char v54 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v18;
        sub_25AC767C0(v52, v53, 0x6F6973726556736FLL, 0xE90000000000006ELL, v54);
        uint64_t v18 = v56[0];
        swift_bridgeObjectRelease();
      }
    }
  }
  return v18;
}

uint64_t sub_25AC856AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 112);
  long long v11 = *(_OWORD *)(a1 + 144);
  long long v12 = *(_OWORD *)(a1 + 128);
  long long v10 = *(_OWORD *)(a1 + 160);
  uint64_t v8 = *(void *)(a1 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25AC85904(v15, v2, v3, v4, v5, v6, v7, v14, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v8, (void (*)(uint64_t, uint64_t))sub_25AC6DB40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC7943C,
    (void (*)(uint64_t))sub_25AC70E44,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC79618);
  return a1;
}

uint64_t sub_25AC857D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 112);
  long long v11 = *(_OWORD *)(a1 + 144);
  long long v12 = *(_OWORD *)(a1 + 128);
  long long v10 = *(_OWORD *)(a1 + 160);
  uint64_t v8 = *(void *)(a1 + 176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25AC85904(v15, v2, v3, v4, v5, v6, v7, v14, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v8, (void (*)(uint64_t, uint64_t))sub_25AC6DB88, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC79574,
    (void (*)(uint64_t))sub_25AC71144,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25AC79680);
  return a1;
}

void sub_25AC85904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void (*a18)(uint64_t, uint64_t), void (*a19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a20)(uint64_t),void (*a21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a2 != 2)
  {
    a18(a2, a3);
    a19(a4, a5, a6, a7, a8, a9, a10, a11);
    a20(a12);
    a21(a13, a14, a15, a16, a17);
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25AC85A80(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

unint64_t sub_25AC85A98()
{
  unint64_t result = qword_26A4ADCC8;
  if (!qword_26A4ADCC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4AD988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADCC8);
  }
  return result;
}

uint64_t sub_25AC85AF4()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25AC85B44()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_25AC64768;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, uint64_t))((char *)&dword_26A4ADCE8 + dword_26A4ADCE8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_25AC85C08()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25AC7C4B0;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26A4ADCF8 + dword_26A4ADCF8);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25AC85D0C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25AC7C4B0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A4ADD08 + dword_26A4ADD08);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_25AC85DD8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AC85E10(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25AC64768;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A4ADD18 + dword_26A4ADD18);
  return v6(a1, v4);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_25AC85EE0(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_25AC85F00, 0, 0);
}

uint64_t sub_25AC85F00()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC85FA4;
  uint64_t v2 = *(void *)(v0 + 48);
  return MEMORY[0x270EF1EB0](v2, 0);
}

uint64_t sub_25AC85FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[9] = a1;
  v5[10] = a2;
  v5[11] = a3;
  v5[12] = v3;
  swift_task_dealloc();
  if (v3) {
    uint64_t v6 = sub_25AC896A0;
  }
  else {
    uint64_t v6 = sub_25AC860BC;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25AC860BC()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v2 = (void *)v1;
  id v3 = *(id *)(v0 + 88);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_6:
    unint64_t v10 = *(void *)(v0 + 80);
    long long v11 = *(void **)(v0 + 88);
    uint64_t v12 = *(void *)(v0 + 72);
    long long v13 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)(v0 + 56) + 24);
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_description);
    sub_25AC8EDD8();

    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    v13(1, 0xD000000000000018, 0x800000025AC92CD0);

    sub_25AC7DFE4(v12, v10);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v4 = *(void **)(v0 + 96);
  sub_25AC8EAF8();
  swift_allocObject();
  sub_25AC8EAE8();
  sub_25AC88C4C();
  sub_25AC8EAD8();
  uint64_t v5 = v4;
  unint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(void **)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 72);
  if (v5)
  {
    uint64_t v9 = *(void *)(v0 + 56);

    swift_release();
    (*(void (**)(uint64_t, uint64_t, unint64_t))(v9 + 24))(1, 0x676E69646F636544, 0xEE00726F72724520);

    sub_25AC7DFE4(v8, v6);
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  swift_release();

  sub_25AC7DFE4(v8, v6);
  uint64_t v15 = *(void *)(v0 + 40);
LABEL_8:
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v15);
}

uint64_t sub_25AC8631C(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_25AC8633C, 0, 0);
}

uint64_t sub_25AC8633C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC863E0;
  uint64_t v2 = *(void *)(v0 + 48);
  return MEMORY[0x270EF1EB0](v2, 0);
}

uint64_t sub_25AC863E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[9] = a1;
  v5[10] = a2;
  v5[11] = a3;
  v5[12] = v3;
  swift_task_dealloc();
  if (v3) {
    unint64_t v6 = sub_25AC86758;
  }
  else {
    unint64_t v6 = sub_25AC864F8;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25AC864F8()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v2 = (void *)v1;
  id v3 = *(id *)(v0 + 88);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_6:
    unint64_t v10 = *(void *)(v0 + 80);
    long long v11 = *(void **)(v0 + 88);
    uint64_t v12 = *(void *)(v0 + 72);
    long long v13 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)(v0 + 56) + 24);
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_description);
    sub_25AC8EDD8();

    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    v13(1, 0xD000000000000018, 0x800000025AC92CD0);

    sub_25AC7DFE4(v12, v10);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v4 = *(void **)(v0 + 96);
  sub_25AC8EAF8();
  swift_allocObject();
  sub_25AC8EAE8();
  sub_25AC88BF8();
  sub_25AC8EAD8();
  uint64_t v5 = v4;
  unint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(void **)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 72);
  if (v5)
  {
    uint64_t v9 = *(void *)(v0 + 56);

    swift_release();
    (*(void (**)(uint64_t, uint64_t, unint64_t))(v9 + 24))(1, 0x676E69646F636544, 0xEE00726F72724520);

    sub_25AC7DFE4(v8, v6);
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  swift_release();

  sub_25AC7DFE4(v8, v6);
  uint64_t v15 = *(void *)(v0 + 40);
LABEL_8:
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v15);
}

uint64_t sub_25AC86758()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = *(void (**)(uint64_t, void, void))(v0[7] + 24);
  sub_25AC8F158();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  sub_25AC8EED8();
  v0[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E48);
  sub_25AC8F178();
  v2(1, v0[2], v0[3]);
  swift_bridgeObjectRelease();

  id v3 = (uint64_t (*)(void))v0[1];
  return v3(0);
}

uint64_t sub_25AC86878(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return MEMORY[0x270FA2498](sub_25AC86898, 0, 0);
}

uint64_t sub_25AC86898()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC8693C;
  uint64_t v2 = *(void *)(v0 + 72);
  return MEMORY[0x270EF1EB0](v2, 0);
}

uint64_t sub_25AC8693C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[12] = a1;
  v5[13] = a2;
  v5[14] = a3;
  v5[15] = v3;
  swift_task_dealloc();
  if (v3) {
    unint64_t v6 = sub_25AC86CC4;
  }
  else {
    unint64_t v6 = sub_25AC86A54;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25AC86A54()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v2 = (void *)v1;
  id v3 = *(id *)(v0 + 112);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_6:
    unint64_t v10 = *(void *)(v0 + 104);
    long long v11 = *(void **)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 96);
    long long v13 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)(v0 + 80) + 24);
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_description);
    sub_25AC8EDD8();

    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    v13(1, 0xD000000000000018, 0x800000025AC92CD0);

    sub_25AC7DFE4(v12, v10);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v4 = *(void **)(v0 + 120);
  sub_25AC8EAF8();
  swift_allocObject();
  sub_25AC8EAE8();
  sub_25AC89604();
  sub_25AC8EAD8();
  uint64_t v5 = v4;
  unint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = *(void **)(v0 + 112);
  uint64_t v8 = *(void *)(v0 + 96);
  if (v5)
  {
    uint64_t v9 = *(void *)(v0 + 80);

    swift_release();
    (*(void (**)(uint64_t, uint64_t, unint64_t))(v9 + 24))(1, 0x676E69646F636544, 0xEE00726F72724520);

    sub_25AC7DFE4(v8, v6);
LABEL_7:
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_8;
  }
  swift_release();

  sub_25AC7DFE4(v8, v6);
  uint64_t v15 = *(void *)(v0 + 16);
  uint64_t v16 = *(void *)(v0 + 24);
  uint64_t v17 = *(void *)(v0 + 32);
  uint64_t v18 = *(void *)(v0 + 40);
LABEL_8:
  unint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 8);
  return v19(v15, v16, v17, v18);
}

uint64_t sub_25AC86CC4()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = *(void (**)(uint64_t, void, void))(v0[10] + 24);
  sub_25AC8F158();
  v0[6] = 0;
  v0[7] = 0xE000000000000000;
  sub_25AC8EED8();
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E48);
  sub_25AC8F178();
  v2(1, v0[6], v0[7]);
  swift_bridgeObjectRelease();

  id v3 = (uint64_t (*)(void, void, void, void))v0[1];
  return v3(0, 0, 0, 0);
}

uint64_t sub_25AC86DF0(uint64_t a1, void (*a2)(uint64_t, unint64_t, unint64_t))
{
  id v3 = sub_25AC68E24(a1, a2);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_25AC8EAF8();
    swift_allocObject();
    sub_25AC8EAE8();
    id v5 = objc_msgSend(v4, sel_data);
    uint64_t v6 = sub_25AC8EC08();
    unint64_t v8 = v7;

    sub_25AC89604();
    sub_25AC8EAD8();

    sub_25AC7DFE4(v6, v8);
    swift_release();
    return v10;
  }
  else
  {
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    a2(1, 0xD000000000000017, 0x800000025AC92DE0);
    return 0;
  }
}

uint64_t sub_25AC86F50(uint64_t a1, void (*a2)(uint64_t, unint64_t, unint64_t))
{
  id v3 = sub_25AC68E24(a1, a2);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_25AC8EAF8();
    swift_allocObject();
    sub_25AC8EAE8();
    id v5 = objc_msgSend(v4, sel_data);
    uint64_t v6 = sub_25AC8EC08();
    unint64_t v8 = v7;

    sub_25AC88BF8();
    sub_25AC8EAD8();

    sub_25AC7DFE4(v6, v8);
    swift_release();
    return v10;
  }
  else
  {
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    a2(1, 0xD00000000000001ALL, 0x800000025AC92D90);
    return 0;
  }
}

uint64_t sub_25AC870A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25AC870C0, 0, 0);
}

uint64_t sub_25AC870C0()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + 16), *(void *)(*(void *)(v0 + 16) + 40));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC87160;
  return sub_25AC6BF90();
}

uint64_t sub_25AC87160()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC8725C, 0, 0);
}

uint64_t sub_25AC8725C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v1 + 112) = sub_25AC872D0();
  swift_bridgeObjectRelease();
  sub_25AC875F0();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25AC872D0()
{
  uint64_t v36 = sub_25AC8EAC8();
  uint64_t v1 = *(void *)(v36 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v36);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v33 - v5;
  unint64_t v7 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]) + OBJC_IVAR___QOSConfigInternal_locationUrl);
  uint64_t v8 = v7[1];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = *v7;
  uint64_t v10 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]) + OBJC_IVAR___QOSConfigInternal_issuesUrl);
  uint64_t v11 = v10[1];
  if (!v11) {
    return 0;
  }
  uint64_t v34 = *v10;
  uint64_t v35 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25AC8D990(1uLL, v9, v8, (uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t v12 = (void (*)(uint64_t, unint64_t, unint64_t))v0[12];
  swift_retain();
  uint64_t v13 = sub_25AC86DF0((uint64_t)v6, v12);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v20 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v21 = v6;
  uint64_t v22 = v36;
  uint64_t v33 = v1 + 8;
  v20(v21, v36);
  uint64_t v23 = (void (*)(uint64_t, uint64_t))v20;
  swift_release();
  if (!v15)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  size_t v24 = sub_25AC8820C(v13, v15, v17, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = (uint64_t)v35;
  sub_25AC8D144(1uLL, v34, v11, v24, (uint64_t)v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((sub_25AC88CA0(v25) & 1) == 0)
  {
    id v28 = objc_msgSend(self, sel_sharedSession);
    id v29 = objc_msgSend(v28, sel_configuration);

    id v30 = objc_msgSend(v29, sel_URLCache);
    if (v30)
    {
      unint64_t v31 = (void *)sub_25AC8EAA8();
      objc_msgSend(v30, sel_removeCachedResponseForRequest_, v31);
    }
    v23(v25, v22);
    return 0;
  }
  char v26 = (void (*)(uint64_t, unint64_t, unint64_t))v0[12];
  swift_retain();
  uint64_t v27 = sub_25AC86F50(v25, v26);
  v23(v25, v22);
  swift_release();
  return v27;
}

void *sub_25AC875F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25AC8ED18();
  uint64_t v34 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25AC8ED38();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  uint64_t v33 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25AC8ED58();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v16 = (void *)(v0 + 16);
  uint64_t v17 = *__swift_project_boxed_opaque_existential_1(v16, *(void *)(v1 + 40))
      + OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs;
  if ((*(unsigned char *)(v17 + 8) & 1) != 0
    || (uint64_t v18 = *(void *)v17,
        uint64_t v19 = *__swift_project_boxed_opaque_existential_1(v16, *(void *)(v1 + 40))
            + OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs,
        (*(unsigned char *)(v19 + 8) & 1) != 0)
    || (uint64_t v31 = *(void *)v19,
        unint64_t result = __swift_project_boxed_opaque_existential_1(v16, *(void *)(v1 + 40)),
        uint64_t v21 = *result + OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs,
        (*(unsigned char *)(v21 + 8) & 1) != 0))
  {
    uint64_t v22 = *(void (**)(uint64_t, unint64_t, unint64_t))(v1 + 96);
    swift_retain();
    v22(1, 0xD000000000000026, 0x800000025AC92CF0);
    return (void *)swift_release();
  }
  else if (v18 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v29 = *(void *)v21;
    double v23 = (double)(uint64_t)sub_25AC89324(v18 + 1);
    sub_25AC893B0();
    uint64_t v30 = sub_25AC8F078();
    sub_25AC8ED48();
    MEMORY[0x261152070](v13, v23);
    size_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v13, v9);
    uint64_t v25 = (void *)swift_allocObject();
    uint64_t v26 = v31;
    v25[2] = v1;
    v25[3] = v26;
    v25[4] = v29;
    aBlock[4] = sub_25AC89428;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25AC87D0C;
    aBlock[3] = &block_descriptor_1;
    uint64_t v27 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_25AC8ED28();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_25AC89658(&qword_26B331E20, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E28);
    sub_25AC8943C();
    sub_25AC8F138();
    id v28 = (void *)v30;
    MEMORY[0x261152370](v15, v8, v4, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v4, v2);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v32);
    return (void *)((uint64_t (*)(char *, uint64_t))v24)(v15, v9);
  }
  return result;
}

void sub_25AC87AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v7 = self;
  uint64_t v21 = (uint64_t (*)())sub_25AC89498;
  uint64_t v22 = v6;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_25AC87EF8;
  char v20 = &block_descriptor_13;
  uint64_t v8 = _Block_copy(&v17);
  swift_retain_n();
  swift_release();
  id v9 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v8, 0.0);
  _Block_release(v8);
  swift_release();

  uint64_t v10 = *(void *)(a1 + 120);
  double v11 = (double)a2;
  uint64_t v21 = (uint64_t (*)())sub_25AC894A0;
  uint64_t v22 = v10;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_25AC87EF8;
  char v20 = &block_descriptor_16;
  uint64_t v12 = _Block_copy(&v17);
  swift_retain_n();
  swift_release();
  id v13 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v12, v11);
  _Block_release(v12);
  swift_release();

  double v14 = (double)a3;
  uint64_t v21 = sub_25AC894A8;
  uint64_t v22 = a1;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_25AC87EF8;
  char v20 = &block_descriptor_19;
  uint64_t v15 = _Block_copy(&v17);
  swift_retain();
  swift_release();
  id v16 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v15, v14);
  _Block_release(v15);
}

uint64_t sub_25AC87D0C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_25AC87D50()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (void *)v0[15];
  uint64_t v5 = v4[15];
  if (v5)
  {
    uint64_t v7 = v4[16];
    uint64_t v6 = v4[17];
    uint64_t v8 = v4[14];
    uint64_t v9 = sub_25AC8EFD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v10 = (void *)swift_allocObject();
    _OWORD v10[2] = 0;
    v10[3] = 0;
    v10[4] = v0;
    v10[5] = v8;
    _OWORD v10[6] = v5;
    v10[7] = v7;
    v10[8] = v6;
    sub_25AC895C0(v8, v5);
    swift_retain();
    sub_25AC7A760((uint64_t)v3, (uint64_t)&unk_26A4ADD68, (uint64_t)v10);
    return swift_release();
  }
  else
  {
    v0[14] = 0;
    swift_bridgeObjectRelease();
    uint64_t v12 = (void (*)(uint64_t, unint64_t, unint64_t))v0[12];
    swift_retain();
    v12(1, 0xD00000000000002CLL, 0x800000025AC92D40);
    return swift_release();
  }
}

void sub_25AC87EF8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25AC87F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  _OWORD v8[6] = a8;
  v8[3] = a5;
  _OWORD v8[4] = a6;
  v8[2] = a4;
  return MEMORY[0x270FA2498](sub_25AC87F88, 0, 0);
}

uint64_t sub_25AC87F88()
{
  size_t v1 = sub_25AC8820C(v0[3], v0[4], v0[5], v0[6]);
  v0[7] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25AC88038;
  return sub_25AC8840C(1, v1);
}

uint64_t sub_25AC88038(uint64_t a1)
{
  *(void *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25AC88158, 0, 0);
}

uint64_t sub_25AC88158()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[2];
  if (v1)
  {
    *(void *)(v2 + 112) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(v2 + 112) = 0;
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void (**)(uint64_t, unint64_t, unint64_t))(v2 + 96);
    swift_retain();
    v3(1, 0xD000000000000015, 0x800000025AC92D70);
    swift_release();
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

size_t sub_25AC8820C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[1] = a4;
  v12[0] = sub_25AC8EB58();
  uint64_t v5 = *(void *)(v12[0] - 8);
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v12[0]);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCD0);
  unint64_t v9 = ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + 2 * *(void *)(v5 + 72);
  size_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25AC91640;
  sub_25AC8EB48();
  sub_25AC8EB48();
  if (*(void *)(*__swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40))
                 + OBJC_IVAR___QOSConfigInternal_locale
                 + 8))
  {
    swift_bridgeObjectRetain();
    sub_25AC8EB48();
    swift_bridgeObjectRelease();
    size_t v10 = sub_25AC846A0(1uLL, 3, 1, (void *)v10);
    *(void *)(v10 + 16) = 3;
    (*(void (**)(size_t, char *, void))(v6 + 32))(v10 + v9, v8, v12[0]);
  }
  return v10;
}

uint64_t sub_25AC8840C(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = sub_25AC8EAC8();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25AC884D0, 0, 0);
}

uint64_t sub_25AC884D0()
{
  uint64_t v1 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1((void *)(v0[10] + 16), *(void *)(v0[10] + 40))
                 + OBJC_IVAR___QOSConfigInternal_issuesUrl);
  uint64_t v2 = v1[1];
  if (v2)
  {
    uint64_t v3 = v0[13];
    uint64_t v4 = v0[9];
    unint64_t v5 = v0[8];
    uint64_t v6 = *v1;
    sub_25AC7799C(v0[10] + 56, (uint64_t)(v0 + 2));
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    swift_bridgeObjectRetain();
    sub_25AC8D144(v5, v6, v2, v4, v3);
    swift_bridgeObjectRelease();
    uint64_t v12 = (uint64_t (*)(uint64_t))((char *)&dword_26A4ADD38 + dword_26A4ADD38);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[14] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_25AC88698;
    uint64_t v8 = v0[13];
    return v12(v8);
  }
  else
  {
    size_t v10 = *(void (**)(uint64_t, unint64_t, unint64_t))(v0[10] + 96);
    swift_retain();
    v10(1, 0xD000000000000023, 0x800000025AC92C50);
    swift_release();
    swift_task_dealloc();
    double v11 = (uint64_t (*)(void))v0[1];
    return v11(0);
  }
}

uint64_t sub_25AC88698(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 104);
  uint64_t v3 = *(void *)(*(void *)v1 + 96);
  uint64_t v4 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_25AC887F8, 0, 0);
}

uint64_t sub_25AC887F8()
{
  uint64_t v1 = v0[15];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (v1)
  {
    uint64_t v2 = v0[15];
    uint64_t v3 = v0[10];
    if (*(void *)(v2 + 16))
    {
      uint64_t v4 = *(void (**)(void, unint64_t, unint64_t))(v3 + 96);
      swift_retain();
      sub_25AC8F158();
      swift_bridgeObjectRelease();
      v0[7] = *(void *)(v2 + 16);
      sub_25AC8F1F8();
      sub_25AC8EED8();
      swift_bridgeObjectRelease();
      v4(0, 0xD00000000000001FLL, 0x800000025AC92CB0);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v5 = v0[15];
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    uint64_t v6 = *(void (**)(uint64_t, unint64_t, unint64_t))(v3 + 96);
    swift_retain();
    unint64_t v7 = 0x726F727265206F4ELL;
    unint64_t v8 = 0xEE00646E756F6620;
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, unint64_t, unint64_t))(v0[10] + 96);
    swift_retain();
    unint64_t v7 = 0xD000000000000029;
    unint64_t v8 = 0x800000025AC92C80;
  }
  v6(1, v7, v8);
  swift_release();
  uint64_t v5 = 0;
LABEL_7:
  swift_task_dealloc();
  unint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v5);
}

uint64_t sub_25AC889B8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MusicIssuesService()
{
  return self;
}

uint64_t sub_25AC88A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  void *v6 = v3;
  v6[1] = sub_25AC88AE8;
  return sub_25AC8840C(a2, a3);
}

uint64_t sub_25AC88AE8(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_25AC88BF8()
{
  unint64_t result = qword_26A4ADD40;
  if (!qword_26A4ADD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADD40);
  }
  return result;
}

unint64_t sub_25AC88C4C()
{
  unint64_t result = qword_26A4ADD50;
  if (!qword_26A4ADD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A4ADD50);
  }
  return result;
}

uint64_t sub_25AC88CA0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADD80);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD910);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADA58);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25AC8EC78();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v55 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v54 = (char *)&v50 - v16;
  uint64_t v17 = *(void (**)(void, unint64_t, unint64_t))(v1 + 96);
  swift_retain();
  id v18 = sub_25AC68E24(a1, v17);
  swift_release();
  if (!v18) {
    goto LABEL_16;
  }
  uint64_t v52 = v13;
  uint64_t v53 = v12;
  id v19 = objc_msgSend(v18, sel_response);
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  if (!v20)
  {

    id v19 = v18;
LABEL_15:

LABEL_16:
    uint64_t v49 = *(void (**)(void, unint64_t, unint64_t))(v1 + 96);
    unint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    swift_retain();
    sub_25AC8F158();
    swift_bridgeObjectRelease();
    unint64_t v56 = 0xD000000000000021;
    unint64_t v57 = 0x800000025AC92DB0;
    sub_25AC8EAC8();
    sub_25AC89658((unint64_t *)&qword_26A4AD940, MEMORY[0x263F06088]);
    sub_25AC8F1F8();
    sub_25AC8EED8();
    swift_bridgeObjectRelease();
    v49(0, v56, v57);
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v21 = (void *)v20;
  char v51 = v5;
  uint64_t v22 = (void *)sub_25AC8EDC8();
  id v23 = objc_msgSend(v21, sel_valueForHTTPHeaderField_, v22);

  if (!v23)
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v50 = sub_25AC8EDD8();
  uint64_t v25 = v24;

  id v19 = objc_msgSend(v18, sel_response);
  self;
  uint64_t v26 = swift_dynamicCastObjCClass();
  if (!v26)
  {

    swift_bridgeObjectRelease();
    id v19 = v18;
    goto LABEL_15;
  }
  uint64_t v27 = (void *)v26;
  uint64_t v28 = v25;
  uint64_t v29 = (void *)sub_25AC8EDC8();
  id v30 = objc_msgSend(v27, sel_valueForHTTPHeaderField_, v29);

  if (!v30)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_25AC8EDD8();

  id v31 = *(id *)(v1 + 128);
  sub_25AC8ECC8();
  sub_25AC8ECA8();
  uint64_t v32 = sub_25AC8ECB8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v8, 0, 1, v32);
  uint64_t v33 = sub_25AC7013C(0, (uint64_t)v11, (uint64_t)v8);

  sub_25AC77B50((uint64_t)v8, &qword_26A4AD910);
  sub_25AC77B50((uint64_t)v11, &qword_26A4ADA58);
  uint64_t v34 = (void *)sub_25AC8EDC8();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v33, sel_dateFromString_, v34);

  if (!v35)
  {
    uint64_t v37 = (uint64_t)v51;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v51, 1, 1, v53);
    goto LABEL_19;
  }
  uint64_t v36 = v55;
  sub_25AC8EC58();

  uint64_t v37 = (uint64_t)v51;
  uint64_t v38 = v52;
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
  uint64_t v40 = v36;
  uint64_t v41 = v53;
  v39(v51, v40, v53);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v37, 0, 1, v41);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v37, 1, v41) == 1)
  {
LABEL_19:
    swift_bridgeObjectRelease();

    sub_25AC77B50(v37, &qword_26A4ADD80);
    return 0;
  }
  char v42 = v54;
  v39(v54, (char *)v37, v41);
  uint64_t v43 = sub_25AC69FC8(v50, v28);
  char v45 = v44;
  swift_bridgeObjectRelease();
  if (v45)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v42, v41);
  }
  else
  {
    sub_25AC8EC28();
    double v47 = v46;

    (*(void (**)(char *, uint64_t))(v38 + 8))(v42, v41);
    if (fabs(v47) < (double)(uint64_t)v43) {
      return 1;
    }
  }
  return 0;
}

unint64_t sub_25AC89324(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x261152B30](&v3, 8);
    unint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x261152B30](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_25AC893B0()
{
  unint64_t result = qword_26B331E40;
  if (!qword_26B331E40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B331E40);
  }
  return result;
}

uint64_t sub_25AC893F0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25AC89428()
{
  sub_25AC87AA0(v0[2], v0[3], v0[4]);
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_25AC8943C()
{
  unint64_t result = qword_26B331E30;
  if (!qword_26B331E30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B331E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B331E30);
  }
  return result;
}

id sub_25AC89498(void *a1)
{
  return sub_25AC896BC(a1, v1);
}

uint64_t sub_25AC894A0(uint64_t a1)
{
  return sub_25AC89E54(a1, v1);
}

uint64_t sub_25AC894AC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25AC894FC()
{
  long long v5 = *(_OWORD *)(v0 + 48);
  long long v6 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_25AC64768;
  *(void *)(v3 + 48) = v2;
  *(_OWORD *)(v3 + 16) = v6;
  *(_OWORD *)(v3 + 32) = v5;
  return MEMORY[0x270FA2498](sub_25AC87F88, 0, 0);
}

uint64_t sub_25AC895C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25AC89604()
{
  unint64_t result = qword_26A4ADD78;
  if (!qword_26A4ADD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADD78);
  }
  return result;
}

uint64_t sub_25AC89658(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_25AC896BC(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  MEMORY[0x270FA5388](v4 - 8);
  long long v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25AC8EFD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  _OWORD v8[4] = a2;
  swift_retain();
  sub_25AC7A760((uint64_t)v6, (uint64_t)&unk_26A4ADDA8, (uint64_t)v8);
  swift_release();
  return objc_msgSend(a1, sel_invalidate);
}

uint64_t sub_25AC897D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25AC89864;
  return sub_25AC89968();
}

uint64_t sub_25AC89864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)*v4;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC8A53C, 0, 0);
}

uint64_t sub_25AC89968()
{
  v1[7] = v0;
  uint64_t v2 = sub_25AC8EAC8();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25AC89A28, 0, 0);
}

uint64_t sub_25AC89A28()
{
  uint64_t v1 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1((void *)(v0[7] + 16), *(void *)(v0[7] + 40))
                 + OBJC_IVAR___QOSConfigInternal_locationUrl);
  uint64_t v2 = v1[1];
  if (v2)
  {
    uint64_t v3 = v0[10];
    uint64_t v4 = *v1;
    sub_25AC7799C(v0[7] + 56, (uint64_t)(v0 + 2));
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    swift_bridgeObjectRetain();
    sub_25AC8D990(1uLL, v4, v2, v3);
    swift_bridgeObjectRelease();
    uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_26A4ADD70 + dword_26A4ADD70);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[11] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_25AC89BE8;
    uint64_t v6 = v0[10];
    return v10(v6);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, unint64_t, unint64_t))(v0[7] + 96);
    swift_retain();
    v8(1, 0xD000000000000025, 0x800000025AC92E40);
    swift_release();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void, void, void, void))v0[1];
    return v9(0, 0, 0, 0);
  }
}

uint64_t sub_25AC89BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void **)v4;
  uint64_t v6 = *(void *)(*(void *)v4 + 80);
  uint64_t v7 = *(void *)(*(void *)v4 + 72);
  uint64_t v8 = *(void *)(*(void *)v4 + 64);
  v5[12] = a1;
  v5[13] = a2;
  v5[14] = a3;
  v5[15] = a4;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  return MEMORY[0x270FA2498](sub_25AC89D4C, 0, 0);
}

uint64_t sub_25AC89D4C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[7];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v3 = *(void (**)(uint64_t, unint64_t, unint64_t))(v2 + 96);
  swift_retain();
  if (v1)
  {
    v3(0, 0xD000000000000012, 0x800000025AC92EA0);
    swift_release();
    uint64_t v4 = v0[13];
  }
  else
  {
    v3(1, 0xD000000000000025, 0x800000025AC92E70);
    swift_release();
    uint64_t v4 = 0;
  }
  uint64_t v6 = v0[14];
  uint64_t v5 = v0[15];
  uint64_t v7 = v0[12];
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[1];
  return v8(v7, v4, v6, v5);
}

uint64_t sub_25AC89E54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25AC8EFD8();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  _OWORD v8[4] = a2;
  int v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  swift_retain();
  if (v9 == 1)
  {
    sub_25AC7BDE8((uint64_t)v5);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    sub_25AC8EFC8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_25AC8EFB8();
      uint64_t v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = &unk_26A4ADD90;
  *(void *)(v13 + 24) = v8;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    void v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_25AC8A090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25AC8A124;
  return sub_25AC89968();
}

uint64_t sub_25AC8A124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)*v4;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25AC8A228, 0, 0);
}

uint64_t sub_25AC8A228()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 120);
  long long v4 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v1 + 112) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 128) = v4;
  sub_25AC8A310(v2, v3);
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_25AC8A298()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  sub_25AC8A310(*(void *)(v0 + 112), *(void *)(v0 + 120));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocationService()
{
  return self;
}

uint64_t sub_25AC8A310(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC8A358()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25AC64768;
  v3[2] = v2;
  long long v4 = (void *)swift_task_alloc();
  v3[3] = v4;
  *long long v4 = v3;
  v4[1] = sub_25AC8A124;
  return sub_25AC89968();
}

uint64_t sub_25AC8A42C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AC8A468()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25AC7C4B0;
  v3[2] = v2;
  long long v4 = (void *)swift_task_alloc();
  v3[3] = v4;
  *long long v4 = v3;
  v4[1] = sub_25AC89864;
  return sub_25AC89968();
}

ValueMetadata *type metadata accessor for TVIssues()
{
  return &type metadata for TVIssues;
}

uint64_t sub_25AC8A550(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_25AC8F288();
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = v3 - 1;
    for (uint64_t i = 32; ; i += 184)
    {
      long long v7 = *(_OWORD *)(a2 + i + 144);
      v12[8] = *(_OWORD *)(a2 + i + 128);
      v12[9] = v7;
      v12[10] = *(_OWORD *)(a2 + i + 160);
      uint64_t v13 = *(void *)(a2 + i + 176);
      long long v8 = *(_OWORD *)(a2 + i + 80);
      v12[4] = *(_OWORD *)(a2 + i + 64);
      v12[5] = v8;
      long long v9 = *(_OWORD *)(a2 + i + 112);
      v12[6] = *(_OWORD *)(a2 + i + 96);
      v12[7] = v9;
      long long v10 = *(_OWORD *)(a2 + i + 16);
      v12[0] = *(_OWORD *)(a2 + i);
      v12[1] = v10;
      long long v11 = *(_OWORD *)(a2 + i + 48);
      void v12[2] = *(_OWORD *)(a2 + i + 32);
      v12[3] = v11;
      sub_25AC856AC((uint64_t)v12);
      sub_25AC8EE78();
      sub_25AC8EE78();
      sub_25AC857D8((uint64_t)v12);
      if (!v5) {
        break;
      }
      --v5;
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AC8A648(uint64_t a1)
{
  sub_25AC8F278();
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25AC8F288();
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = v2 - 1;
    for (uint64_t i = 32; ; i += 184)
    {
      long long v5 = *(_OWORD *)(a1 + i + 144);
      _OWORD v11[8] = *(_OWORD *)(a1 + i + 128);
      v11[9] = v5;
      v11[10] = *(_OWORD *)(a1 + i + 160);
      uint64_t v12 = *(void *)(a1 + i + 176);
      long long v6 = *(_OWORD *)(a1 + i + 80);
      v11[4] = *(_OWORD *)(a1 + i + 64);
      v11[5] = v6;
      long long v7 = *(_OWORD *)(a1 + i + 112);
      v11[6] = *(_OWORD *)(a1 + i + 96);
      v11[7] = v7;
      long long v8 = *(_OWORD *)(a1 + i + 16);
      v11[0] = *(_OWORD *)(a1 + i);
      v11[1] = v8;
      long long v9 = *(_OWORD *)(a1 + i + 48);
      v11[2] = *(_OWORD *)(a1 + i + 32);
      v11[3] = v9;
      sub_25AC856AC((uint64_t)v11);
      sub_25AC8EE78();
      sub_25AC8EE78();
      sub_25AC857D8((uint64_t)v11);
      if (!v3) {
        break;
      }
      --v3;
    }
    swift_bridgeObjectRelease();
  }
  return sub_25AC8F298();
}

void *sub_25AC8A74C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25AC8AA10(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25AC8A778()
{
  return sub_25AC8A648(*v0);
}

uint64_t sub_25AC8A780(uint64_t a1)
{
  return sub_25AC8A550(a1, *v1);
}

uint64_t sub_25AC8A788()
{
  uint64_t v1 = *v0;
  sub_25AC8F278();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_25AC8F288();
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = v2 - 1;
    for (uint64_t i = 32; ; i += 184)
    {
      long long v5 = *(_OWORD *)(v1 + i);
      long long v6 = *(_OWORD *)(v1 + i + 16);
      long long v7 = *(_OWORD *)(v1 + i + 48);
      void v15[2] = *(_OWORD *)(v1 + i + 32);
      v15[3] = v7;
      v15[0] = v5;
      v15[1] = v6;
      long long v8 = *(_OWORD *)(v1 + i + 64);
      long long v9 = *(_OWORD *)(v1 + i + 80);
      long long v10 = *(_OWORD *)(v1 + i + 112);
      v15[6] = *(_OWORD *)(v1 + i + 96);
      v15[7] = v10;
      void v15[4] = v8;
      v15[5] = v9;
      long long v11 = *(_OWORD *)(v1 + i + 128);
      long long v12 = *(_OWORD *)(v1 + i + 144);
      long long v13 = *(_OWORD *)(v1 + i + 160);
      uint64_t v16 = *(void *)(v1 + i + 176);
      v15[9] = v12;
      v15[10] = v13;
      v15[8] = v11;
      sub_25AC856AC((uint64_t)v15);
      sub_25AC8EE78();
      sub_25AC8EE78();
      sub_25AC857D8((uint64_t)v15);
      if (!v3) {
        break;
      }
      --v3;
    }
    swift_bridgeObjectRelease();
  }
  return sub_25AC8F298();
}

uint64_t sub_25AC8A888(uint64_t *a1, uint64_t *a2)
{
  return sub_25AC754C0(*a1, *a2);
}

unint64_t sub_25AC8A898()
{
  unint64_t result = qword_26A4ADDB0;
  if (!qword_26A4ADDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDB0);
  }
  return result;
}

uint64_t sub_25AC8A8EC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25AC8A940@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25AC8A998(uint64_t a1)
{
  unint64_t v2 = sub_25AC8ABA0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC8A9D4(uint64_t a1)
{
  unint64_t v2 = sub_25AC8ABA0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25AC8AA10(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADDB8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC8ABA0();
  sub_25AC8F2A8();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADDC8);
    sub_25AC8ABF4();
    sub_25AC8F1E8();
    long long v7 = (void *)v9[1];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_25AC8ABA0()
{
  unint64_t result = qword_26A4ADDC0;
  if (!qword_26A4ADDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDC0);
  }
  return result;
}

unint64_t sub_25AC8ABF4()
{
  unint64_t result = qword_26A4ADDD0;
  if (!qword_26A4ADDD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4ADDC8);
    sub_25AC8AC68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDD0);
  }
  return result;
}

unint64_t sub_25AC8AC68()
{
  unint64_t result = qword_26A4ADDD8;
  if (!qword_26A4ADDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDD8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TVIssues.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25AC8AD58);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVIssues.CodingKeys()
{
  return &type metadata for TVIssues.CodingKeys;
}

unint64_t sub_25AC8AD94()
{
  unint64_t result = qword_26A4ADDE0;
  if (!qword_26A4ADDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDE0);
  }
  return result;
}

unint64_t sub_25AC8ADEC()
{
  unint64_t result = qword_26A4ADDE8;
  if (!qword_26A4ADDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDE8);
  }
  return result;
}

unint64_t sub_25AC8AE44()
{
  unint64_t result = qword_26A4ADDF0;
  if (!qword_26A4ADDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADDF0);
  }
  return result;
}

uint64_t sub_25AC8AE98()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC8AFC0()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC8B120()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC8B290()
{
  return sub_25AC8F298();
}

double sub_25AC8B3B4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_25AC8BBE4(a1, v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_25AC8B3F8(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  _OWORD v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_25AC8B814((uint64_t)v7, (uint64_t)v8) & 1;
}

uint64_t sub_25AC8B440(unsigned __int8 *a1, char *a2)
{
  return sub_25AC72F8C(*a1, *a2);
}

uint64_t sub_25AC8B44C()
{
  return sub_25AC8AE98();
}

uint64_t sub_25AC8B454()
{
  sub_25AC8EE78();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25AC8B564()
{
  return sub_25AC8B290();
}

uint64_t sub_25AC8B56C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC8C184();
  *a1 = result;
  return result;
}

void sub_25AC8B59C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEC000000796C696DLL;
  uint64_t v3 = 0x6146656369766564;
  switch(*v1)
  {
    case 1:
      uint64_t v3 = 0x614E656369766564;
      unint64_t v2 = 0xEA0000000000656DLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x6F4D656369766564;
      a1[1] = 0xEB000000006C6564;
      break;
    case 3:
      *a1 = 0x6973726556707061;
      a1[1] = 0xEA00000000006E6FLL;
      break;
    case 4:
      *a1 = 0x6F6973726556736FLL;
      a1[1] = 0xE90000000000006ELL;
      break;
    case 5:
      *a1 = 29551;
      a1[1] = 0xE200000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25AC8B68C()
{
  uint64_t result = 0x6146656369766564;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x614E656369766564;
      break;
    case 2:
      uint64_t result = 0x6F4D656369766564;
      break;
    case 3:
      uint64_t result = 0x6973726556707061;
      break;
    case 4:
      uint64_t result = 0x6F6973726556736FLL;
      break;
    case 5:
      uint64_t result = 29551;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AC8B768@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AC8C184();
  *a1 = result;
  return result;
}

void sub_25AC8B790(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25AC8B79C(uint64_t a1)
{
  unint64_t v2 = sub_25AC8BF24();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC8B7D8(uint64_t a1)
{
  unint64_t v2 = sub_25AC8BF24();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC8B814(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  long long v5 = *(void **)a2;
  if (v4)
  {
    if (!v5 || (sub_25AC75A24(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  long long v6 = *(void **)(a1 + 8);
  long long v7 = *(void **)(a2 + 8);
  if (v6)
  {
    if (!v7 || (sub_25AC75A24(v6, v7) & 1) == 0) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  long long v8 = *(void **)(a1 + 16);
  long long v9 = *(void **)(a2 + 16);
  if (v8)
  {
    if (!v9 || (sub_25AC75A24(v8, v9) & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  long long v10 = *(void **)(a1 + 24);
  long long v11 = *(void **)(a2 + 24);
  if (v10)
  {
    if (!v11 || (sub_25AC75A24(v10, v11) & 1) == 0) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  long long v12 = *(void **)(a1 + 32);
  long long v13 = *(void **)(a2 + 32);
  if (v12)
  {
    if (!v13 || (sub_25AC75A24(v12, v13) & 1) == 0) {
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void **)(a2 + 40);
  if (v14)
  {
    if (v15 && (sub_25AC75A24(v14, v15) & 1) != 0) {
      return 1;
    }
  }
  else if (!v15)
  {
    return 1;
  }
  return 0;
}

uint64_t destroy for MusicDeviceCriteria()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for MusicDeviceCriteria(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MusicDeviceCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for MusicDeviceCriteria(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicDeviceCriteria(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 48)) {
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

uint64_t storeEnumTagSinglePayload for MusicDeviceCriteria(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicDeviceCriteria()
{
  return &type metadata for MusicDeviceCriteria;
}

uint64_t sub_25AC8BBE4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADDF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC8BF24();
  sub_25AC8F2A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
  char v19 = 2;
  sub_25AC6B874();
  sub_25AC8F1E8();
  uint64_t v17 = v20;
  char v19 = 0;
  sub_25AC8F1E8();
  uint64_t v16 = v20;
  char v19 = 1;
  sub_25AC8F1E8();
  uint64_t v15 = v20;
  char v19 = 3;
  sub_25AC8F1E8();
  uint64_t v14 = v20;
  uint64_t v18 = v6;
  char v19 = 4;
  sub_25AC8F1E8();
  uint64_t v10 = v20;
  char v19 = 5;
  sub_25AC8F1E8();
  uint64_t v11 = v20;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  uint64_t v12 = v15;
  *a2 = v16;
  a2[1] = v12;
  uint64_t v13 = v14;
  a2[2] = v17;
  a2[3] = v13;
  a2[4] = v10;
  a2[5] = v11;
  return result;
}

unint64_t sub_25AC8BF24()
{
  unint64_t result = qword_26A4ADE00;
  if (!qword_26A4ADE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE00);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MusicDeviceCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25AC8C044);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicDeviceCriteria.CodingKeys()
{
  return &type metadata for MusicDeviceCriteria.CodingKeys;
}

unint64_t sub_25AC8C080()
{
  unint64_t result = qword_26A4ADE08;
  if (!qword_26A4ADE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE08);
  }
  return result;
}

unint64_t sub_25AC8C0D8()
{
  unint64_t result = qword_26A4ADE10;
  if (!qword_26A4ADE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE10);
  }
  return result;
}

unint64_t sub_25AC8C130()
{
  unint64_t result = qword_26A4ADE18;
  if (!qword_26A4ADE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE18);
  }
  return result;
}

uint64_t sub_25AC8C184()
{
  unint64_t v0 = sub_25AC8F1C8();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

void *initializeBufferWithCopyOfBuffer for MiscCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MiscCriteria()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for MiscCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for MiscCriteria(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MiscCriteria(uint64_t *a1, unsigned int a2)
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
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MiscCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiscCriteria()
{
  return &type metadata for MiscCriteria;
}

void *sub_25AC8C340@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = sub_25AC8C5D4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25AC8C36C(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (v2)
  {
    if (v3 && (sub_25AC75A24(v2, v3) & 1) != 0) {
      return 1;
    }
  }
  else if (!v3)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_25AC8C3AC()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC8C404()
{
  return sub_25AC8EE78();
}

uint64_t sub_25AC8C420()
{
  return sub_25AC8F298();
}

uint64_t sub_25AC8C474@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_25AC8C4C8(void *a1@<X8>)
{
  *a1 = 0x646F43726F727265;
  a1[1] = 0xEA00000000007365;
}

uint64_t sub_25AC8C4E8()
{
  return 0x646F43726F727265;
}

uint64_t sub_25AC8C504@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25AC8C55C(uint64_t a1)
{
  unint64_t v2 = sub_25AC8C764();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC8C598(uint64_t a1)
{
  unint64_t v2 = sub_25AC8C764();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25AC8C5D4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADE20);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC8C764();
  sub_25AC8F2A8();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
    sub_25AC6B874();
    sub_25AC8F1E8();
    uint64_t v7 = (void *)v9[1];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_25AC8C764()
{
  unint64_t result = qword_26A4ADE28;
  if (!qword_26A4ADE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE28);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MiscCriteria.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25AC8C854);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MiscCriteria.CodingKeys()
{
  return &type metadata for MiscCriteria.CodingKeys;
}

unint64_t sub_25AC8C890()
{
  unint64_t result = qword_26A4ADE30;
  if (!qword_26A4ADE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE30);
  }
  return result;
}

unint64_t sub_25AC8C8E8()
{
  unint64_t result = qword_26A4ADE38;
  if (!qword_26A4ADE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE38);
  }
  return result;
}

unint64_t sub_25AC8C940()
{
  unint64_t result = qword_26A4ADE40;
  if (!qword_26A4ADE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE40);
  }
  return result;
}

uint64_t destroy for Location()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Location(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Location(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for Location(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Location(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Location(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Location()
{
  return &type metadata for Location;
}

uint64_t sub_25AC8CB70@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25AC8CCDC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25AC8CBA0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_25AC8CC00@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AC8F1C8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_25AC8CC64(uint64_t a1)
{
  unint64_t v2 = sub_25AC8CEE4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AC8CCA0(uint64_t a1)
{
  unint64_t v2 = sub_25AC8CEE4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AC8CCDC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADE48);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AC8CEE4();
  sub_25AC8F2A8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_25AC8F1D8();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_25AC8F1D8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_25AC8CEE4()
{
  unint64_t result = qword_26A4ADE50;
  if (!qword_26A4ADE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE50);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Location.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AC8D004);
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

ValueMetadata *type metadata accessor for Location.CodingKeys()
{
  return &type metadata for Location.CodingKeys;
}

unint64_t sub_25AC8D040()
{
  unint64_t result = qword_26A4ADE58;
  if (!qword_26A4ADE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE58);
  }
  return result;
}

unint64_t sub_25AC8D098()
{
  unint64_t result = qword_26A4ADE60;
  if (!qword_26A4ADE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE60);
  }
  return result;
}

unint64_t sub_25AC8D0F0()
{
  unint64_t result = qword_26A4ADE68;
  if (!qword_26A4ADE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ADE68);
  }
  return result;
}

uint64_t sub_25AC8D144@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v47 = a4;
  uint64_t v48 = a2;
  uint64_t v45 = a5;
  uint64_t v7 = sub_25AC8EAC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADE70);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v46 = (uint64_t)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25AC8EBE8();
  uint64_t v49 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  char v42 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v43 = (char *)&v42 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ADE78);
  MEMORY[0x270FA5388](v17 - 8);
  char v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCD0);
  uint64_t v20 = *(void *)(sub_25AC8EB58() - 8);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v22;
  *(_OWORD *)(v22 + 16) = xmmword_25AC91DF0;
  uint64_t v53 = v8;
  uint64_t v54 = v7;
  char v44 = v10;
  uint64_t v50 = v13;
  char v51 = v19;
  if (a1 <= 1)
  {
    a1 = v22 + v21;
    swift_bridgeObjectRetain();
    sub_25AC8EB48();
    swift_bridgeObjectRelease();
    sub_25AC7DD94();
    sub_25AC8EB48();
    swift_bridgeObjectRelease();
    uint64_t v24 = self;
    id v25 = objc_msgSend(v24, sel_currentDevice);
    uint64_t v52 = a3;
    id v26 = v25;
    id v27 = objc_msgSend(v25, sel_model);

    sub_25AC8EDD8();
    sub_25AC8EB48();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v24, sel_currentDevice);
    id v29 = objc_msgSend(v28, sel_systemName);

    sub_25AC8EDD8();
    sub_25AC8EB48();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v24, sel_currentDevice);
    id v31 = objc_msgSend(v30, sel_systemVersion);

    sub_25AC8EDD8();
    sub_25AC8EB48();
    swift_bridgeObjectRelease();
    unint64_t v55 = v23;
    size_t v32 = swift_bridgeObjectRetain();
    sub_25AC8D808(v32);
    uint64_t v33 = v46;
    sub_25AC7D9A0(v46);
    uint64_t v35 = v49;
    uint64_t v34 = v50;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v33, 1, v50) == 1)
    {
      sub_25AC8D930(v33);
      uint64_t v37 = v53;
      uint64_t v36 = v54;
      uint64_t v38 = v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v51, 1, 1, v54);
    }
    else
    {
      uint64_t v39 = v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v43, v33, v34);
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v42, v39, v34);
      uint64_t v40 = v44;
      sub_25AC8EAB8();
      sub_25AC8EA98();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v39, v34);
      uint64_t v37 = v53;
      uint64_t v36 = v54;
      uint64_t v38 = v51;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v51, v40, v54);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v38, 0, 1, v36);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v36);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v38, 1, v36) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v45, v38, v36);
    }
    __break(1u);
  }
  unint64_t v55 = a1;
  swift_bridgeObjectRetain();
  uint64_t result = sub_25AC8F218();
  __break(1u);
  return result;
}

size_t sub_25AC8D808(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  int v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = sub_25AC846A0(result, v11, 1, v3);
  int v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  uint64_t result = sub_25AC8EB58();
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_25AC8D930(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADE70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AC8D990@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v26 = a4;
  uint64_t v27 = a2;
  uint64_t v5 = sub_25AC8EAC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADE70);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25AC8EBE8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v23 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v24 = (char *)&v23 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ADE78);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ADCD0);
  sub_25AC8EB58();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25AC90C90;
  uint64_t v28 = v5;
  if (a1)
  {
    if (a1 != 1) {
      goto LABEL_11;
    }
    a1 = 0xE500000000000000;
  }
  else
  {
    a1 = 0xE200000000000000;
  }
  swift_bridgeObjectRetain();
  sub_25AC8EB48();
  swift_bridgeObjectRelease();
  sub_25AC7D9A0((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_25AC8D930((uint64_t)v10);
    uint64_t v19 = v28;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v18, 1, 1, v28);
  }
  else
  {
    uint64_t v20 = v24;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v24, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v23, v20, v11);
    unint64_t v21 = v25;
    sub_25AC8EAB8();
    sub_25AC8EA98();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v11);
    uint64_t v19 = v28;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v18, v21, v28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v18, 0, 1, v19);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v21, v19);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v18, 1, v19) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v26, v18, v19);
  }
  __break(1u);
LABEL_11:
  unint64_t v30 = a1;
  swift_bridgeObjectRetain();
  uint64_t result = sub_25AC8F218();
  __break(1u);
  return result;
}

uint64_t sub_25AC8DE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25AC8DE78, 0, 0);
}

uint64_t sub_25AC8DE78()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + 16), *(void *)(*(void *)(v0 + 16) + 40));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25AC8DF18;
  return sub_25AC6BF90();
}

uint64_t sub_25AC8DF18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25AC8E00C(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = sub_25AC8EAC8();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25AC8E0D0, 0, 0);
}

uint64_t sub_25AC8E0D0()
{
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = v1[15];
  v0[13] = v2;
  if (v2)
  {
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[14] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25AC8E350;
    uint64_t v4 = MEMORY[0x263F8EE60] + 8;
    uint64_t v5 = MEMORY[0x263F8E628];
    uint64_t v6 = MEMORY[0x263F8E658];
    return MEMORY[0x270FA1FB8](v0 + 17, v2, v4, v5, v6);
  }
  else
  {
    uint64_t v7 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]) + OBJC_IVAR___QOSConfigInternal_issuesUrl);
    uint64_t v8 = v7[1];
    if (v8)
    {
      uint64_t v9 = v0[12];
      uint64_t v10 = v0[8];
      unint64_t v11 = v0[7];
      uint64_t v12 = *v7;
      sub_25AC7799C(v0[9] + 56, (uint64_t)(v0 + 2));
      __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
      swift_bridgeObjectRetain();
      sub_25AC8D144(v11, v12, v8, v10, v9);
      swift_bridgeObjectRelease();
      uint64_t v18 = (uint64_t (*)(uint64_t))((char *)&dword_26A4ADD48 + dword_26A4ADD48);
      uint64_t v13 = (void *)swift_task_alloc();
      v0[15] = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_25AC8E674;
      uint64_t v14 = v0[12];
      return v18(v14);
    }
    else
    {
      uint64_t v15 = *(void (**)(uint64_t, unint64_t, unint64_t))(v0[9] + 96);
      swift_retain();
      v15(1, 0xD000000000000023, 0x800000025AC92C50);
      swift_release();
      swift_task_dealloc();
      uint64_t v16 = (uint64_t (*)(void))v0[1];
      return v16(0);
    }
  }
}

uint64_t sub_25AC8E350()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_25AC8E468, 0, 0);
}

uint64_t sub_25AC8E468(uint64_t a1)
{
  if (*(unsigned char *)(v1 + 136))
  {
    uint64_t v2 = MEMORY[0x263F8E628];
    uint64_t v3 = MEMORY[0x263F8E658];
    return MEMORY[0x270FA0678](a1, v2, v3);
  }
  else
  {
    uint64_t v4 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1((void *)(*(void *)(v1 + 72) + 16), *(void *)(*(void *)(v1 + 72) + 40))+ OBJC_IVAR___QOSConfigInternal_issuesUrl);
    uint64_t v5 = v4[1];
    if (v5)
    {
      uint64_t v6 = *(void *)(v1 + 96);
      uint64_t v7 = *(void *)(v1 + 64);
      unint64_t v8 = *(void *)(v1 + 56);
      uint64_t v9 = *v4;
      sub_25AC7799C(*(void *)(v1 + 72) + 56, v1 + 16);
      __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
      swift_bridgeObjectRetain();
      sub_25AC8D144(v8, v9, v5, v7, v6);
      swift_bridgeObjectRelease();
      uint64_t v15 = (uint64_t (*)(uint64_t))((char *)&dword_26A4ADD48 + dword_26A4ADD48);
      uint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v1 + 120) = v10;
      *uint64_t v10 = v1;
      v10[1] = sub_25AC8E674;
      uint64_t v11 = *(void *)(v1 + 96);
      return v15(v11);
    }
    else
    {
      uint64_t v12 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)(v1 + 72) + 96);
      swift_retain();
      v12(1, 0xD000000000000023, 0x800000025AC92C50);
      swift_release();
      swift_task_dealloc();
      uint64_t v13 = *(uint64_t (**)(void))(v1 + 8);
      return v13(0);
    }
  }
}

uint64_t sub_25AC8E674(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_25AC8E7D4, 0, 0);
}

uint64_t sub_25AC8E7D4()
{
  uint64_t v1 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (v1)
  {
    uint64_t v2 = v0[16];
    if (*(void *)(v2 + 16)) {
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    unint64_t v3 = 0x726F727265206F4ELL;
    unint64_t v4 = 0xEE00646E756F6620;
  }
  else
  {
    unint64_t v4 = 0x800000025AC92C80;
    unint64_t v3 = 0xD000000000000029;
  }
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, unint64_t))(v0[9] + 96);
  swift_retain();
  v5(1, v3, v4);
  swift_release();
  uint64_t v2 = 0;
LABEL_6:
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v2);
}

uint64_t sub_25AC8E8D4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TVIssuesService()
{
  return self;
}

uint64_t sub_25AC8E950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  void *v6 = v3;
  v6[1] = sub_25AC88AE8;
  return sub_25AC8E00C(a2, a3);
}

void sub_25AC8E9FC()
{
  uint64_t v0 = (void *)sub_25AC8EDC8();
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_bundleWithIdentifier_, v0);

  if (!v2) {
    id v2 = objc_msgSend(v1, sel_mainBundle);
  }
  qword_26A4B2520 = (uint64_t)v2;
}

uint64_t sub_25AC8EA98()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_25AC8EAA8()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_25AC8EAB8()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_25AC8EAC8()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_25AC8EAD8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25AC8EAE8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25AC8EAF8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25AC8EB08()
{
  return MEMORY[0x270EEE130]();
}

uint64_t sub_25AC8EB18()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_25AC8EB28()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25AC8EB38()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25AC8EB48()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_25AC8EB58()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25AC8EB68()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_25AC8EB78()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_25AC8EB88()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_25AC8EB98()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25AC8EBA8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25AC8EBB8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25AC8EBC8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_25AC8EBD8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25AC8EBE8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25AC8EBF8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25AC8EC08()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25AC8EC18()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25AC8EC28()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25AC8EC38()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_25AC8EC48()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25AC8EC58()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25AC8EC68()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25AC8EC78()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25AC8EC88()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25AC8EC98()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_25AC8ECA8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25AC8ECB8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25AC8ECC8()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_25AC8ECD8()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25AC8ECE8()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25AC8ECF8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25AC8ED08()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25AC8ED18()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25AC8ED28()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25AC8ED38()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25AC8ED48()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25AC8ED58()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25AC8ED68()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25AC8ED78()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25AC8ED88()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25AC8ED98()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25AC8EDA8()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_25AC8EDB8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25AC8EDC8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25AC8EDD8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25AC8EDE8()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t sub_25AC8EDF8()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t sub_25AC8EE08()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25AC8EE18()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_25AC8EE28()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25AC8EE38()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25AC8EE48()
{
  return MEMORY[0x270F9D650]();
}

uint64_t sub_25AC8EE58()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_25AC8EE68()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25AC8EE78()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25AC8EE88()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25AC8EE98()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_25AC8EEA8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25AC8EEB8()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25AC8EEC8()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_25AC8EED8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25AC8EEE8()
{
  return MEMORY[0x270F9D7B8]();
}

uint64_t sub_25AC8EEF8()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25AC8EF08()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25AC8EF18()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25AC8EF28()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25AC8EF38()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25AC8EF48()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25AC8EF58()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25AC8EF68()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25AC8EF78()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25AC8EF88()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25AC8EF98()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25AC8EFA8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25AC8EFB8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25AC8EFC8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25AC8EFD8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25AC8EFF8()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_25AC8F008()
{
  return MEMORY[0x270FA2B90]();
}

uint64_t sub_25AC8F018()
{
  return MEMORY[0x270FA2BA0]();
}

uint64_t sub_25AC8F038()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25AC8F048()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25AC8F058()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25AC8F068()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25AC8F078()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25AC8F088()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25AC8F098()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25AC8F0A8()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_25AC8F0B8()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_25AC8F0C8()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25AC8F0D8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25AC8F0E8()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25AC8F0F8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25AC8F108()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_25AC8F118()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_25AC8F128()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25AC8F138()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25AC8F148()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25AC8F158()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25AC8F168()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25AC8F178()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25AC8F188()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25AC8F198()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25AC8F1A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25AC8F1B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25AC8F1C8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25AC8F1D8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25AC8F1E8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25AC8F1F8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25AC8F208()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25AC8F218()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25AC8F228()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25AC8F238()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25AC8F248()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25AC8F258()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25AC8F268()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25AC8F278()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25AC8F288()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25AC8F298()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25AC8F2A8()
{
  return MEMORY[0x270F9FD70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}