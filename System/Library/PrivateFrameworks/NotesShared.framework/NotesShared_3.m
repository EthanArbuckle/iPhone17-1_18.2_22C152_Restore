uint64_t _s11NotesShared16EditNoteActivityV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char v17;
  char v18;
  char v20;
  uint64_t v22;

  v4 = type metadata accessor for EditNoteActivity();
  v5 = MEMORY[0x1F4188790](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1F4188790](v5);
  v10 = (char *)&v22 - v9;
  v11 = MEMORY[0x1F4188790](v8);
  v13 = (char *)&v22 - v12;
  MEMORY[0x1F4188790](v11);
  v15 = (char *)&v22 - v14;
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    sub_1C3CEBC54((uint64_t)a1, (uint64_t)&v22 - v14);
    sub_1C3CEBC54((uint64_t)a2, (uint64_t)v13);
  }
  else
  {
    v17 = sub_1C3DBB3B8();
    sub_1C3CEBC54((uint64_t)a1, (uint64_t)v15);
    sub_1C3CEBC54((uint64_t)a2, (uint64_t)v13);
    if ((v17 & 1) == 0)
    {
      sub_1C3D91140((uint64_t)v15);
      sub_1C3D91140((uint64_t)v13);
      sub_1C3CEBC54((uint64_t)a1, (uint64_t)v10);
      sub_1C3CEBC54((uint64_t)a2, (uint64_t)v7);
      v18 = 0;
      goto LABEL_16;
    }
  }
  if (*((void *)v15 + 2) == *((void *)v13 + 2) && *((void *)v15 + 3) == *((void *)v13 + 3))
  {
    sub_1C3D91140((uint64_t)v15);
    sub_1C3D91140((uint64_t)v13);
    sub_1C3CEBC54((uint64_t)a1, (uint64_t)v10);
    sub_1C3CEBC54((uint64_t)a2, (uint64_t)v7);
  }
  else
  {
    v20 = sub_1C3DBB3B8();
    sub_1C3D91140((uint64_t)v15);
    sub_1C3D91140((uint64_t)v13);
    sub_1C3CEBC54((uint64_t)a1, (uint64_t)v10);
    sub_1C3CEBC54((uint64_t)a2, (uint64_t)v7);
    v18 = 0;
    if ((v20 & 1) == 0) {
      goto LABEL_16;
    }
  }
  v18 = sub_1C3DB8B48();
LABEL_16:
  sub_1C3D91140((uint64_t)v7);
  sub_1C3D91140((uint64_t)v10);
  return v18 & 1;
}

uint64_t sub_1C3D90CC4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x444965746F6ELL && a2 == 0xE600000000000000;
  if (v2 || (sub_1C3DBB3B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49746E756F636361 && a2 == 0xE900000000000044 || (sub_1C3DBB3B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x496163696C706572 && a2 == 0xE900000000000044 || (sub_1C3DBB3B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C74695465746F6ELL && a2 == 0xE900000000000065 || (sub_1C3DBB3B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7274744165746F6ELL && a2 == 0xEE00736574756269)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1C3DBB3B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_1C3D90F14()
{
  unint64_t result = qword_1EA388F98;
  if (!qword_1EA388F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA388F98);
  }
  return result;
}

uint64_t sub_1C3D90F68()
{
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1C3D90FB0()
{
  sub_1C3D8E598(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void (**)(id))(v0 + 48));
}

unint64_t sub_1C3D90FD4()
{
  unint64_t result = qword_1EB6FBC28;
  if (!qword_1EB6FBC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6FBC28);
  }
  return result;
}

unint64_t sub_1C3D91028()
{
  unint64_t result = qword_1EB6FBC18;
  if (!qword_1EB6FBC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6FBC18);
  }
  return result;
}

uint64_t sub_1C3D9107C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6FBDF8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C3D910EC()
{
  unint64_t result = qword_1EA388FB8;
  if (!qword_1EA388FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA388FB8);
  }
  return result;
}

uint64_t sub_1C3D91140(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EditNoteActivity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C3D911A0()
{
  unint64_t result = qword_1EB6FBC20;
  if (!qword_1EB6FBC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6FBC20);
  }
  return result;
}

uint64_t sub_1C3D911F4()
{
  return MEMORY[0x1E4FBB1B0];
}

uint64_t sub_1C3D91200()
{
  return sub_1C3D91E50((unint64_t *)&unk_1EA388FC0, (void (*)(uint64_t))type metadata accessor for EditNoteActivity);
}

uint64_t sub_1C3D91248()
{
  return sub_1C3D91E50(&qword_1EB6FBC40, (void (*)(uint64_t))type metadata accessor for EditNoteActivity);
}

uint64_t sub_1C3D91290()
{
  return sub_1C3D91E50(qword_1EB6FBC58, (void (*)(uint64_t))type metadata accessor for EditNoteActivity);
}

uint64_t sub_1C3D912D8()
{
  return MEMORY[0x1E4FBB1D8];
}

uint64_t sub_1C3D912E4()
{
  return MEMORY[0x1E4FBB1A8];
}

uint64_t sub_1C3D912F0()
{
  return sub_1C3D91E50(&qword_1EB6FBC50, (void (*)(uint64_t))type metadata accessor for EditNoteActivity);
}

uint64_t sub_1C3D91338()
{
  return sub_1C3D91E50(&qword_1EB6FBC48, (void (*)(uint64_t))type metadata accessor for EditNoteActivity);
}

uint64_t *initializeBufferWithCopyOfBuffer for EditNoteActivity(uint64_t *a1, uint64_t *a2, int *a3)
{
  v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    uint64_t *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1C3DB8B98();
    v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    v16 = (uint64_t *)((char *)v4 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    *(uint64_t *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for EditNoteActivity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1C3DB8B98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EditNoteActivity(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1C3DB8B98();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)((char *)a1 + v13);
  v16 = (void *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EditNoteActivity(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C3DB8B98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for EditNoteActivity(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1C3DB8B98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

void *assignWithTake for EditNoteActivity(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1C3DB8B98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EditNoteActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C3D918C8);
}

uint64_t sub_1C3D918C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1C3DB8B98();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for EditNoteActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C3D9198C);
}

uint64_t sub_1C3D9198C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C3DB8B98();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1C3D91A34()
{
  uint64_t result = sub_1C3DB8B98();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EditNoteActivity.NoteAttributes(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C3D91BB0);
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

ValueMetadata *type metadata accessor for EditNoteActivity.NoteAttributes()
{
  return &type metadata for EditNoteActivity.NoteAttributes;
}

unsigned char *storeEnumTagSinglePayload for EditNoteActivity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C3D91CB4);
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

ValueMetadata *type metadata accessor for EditNoteActivity.CodingKeys()
{
  return &type metadata for EditNoteActivity.CodingKeys;
}

unint64_t sub_1C3D91CF0()
{
  unint64_t result = qword_1EA388FD0;
  if (!qword_1EA388FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA388FD0);
  }
  return result;
}

unint64_t sub_1C3D91D48()
{
  unint64_t result = qword_1EB6FBC38;
  if (!qword_1EB6FBC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6FBC38);
  }
  return result;
}

unint64_t sub_1C3D91DA0()
{
  unint64_t result = qword_1EB6FBC30;
  if (!qword_1EB6FBC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6FBC30);
  }
  return result;
}

uint64_t sub_1C3D91DF4(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_1C3D91DFC()
{
  unint64_t result = qword_1EA388FD8;
  if (!qword_1EA388FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA388FD8);
  }
  return result;
}

uint64_t sub_1C3D91E50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static ICCloudConfiguration.overridableValue<A>(for:in:defaults:)@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  sub_1C3DBAA78();
  if (v7)
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    uint64_t v9 = (void *)sub_1C3DB9BF8();
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)sub_1C3DB9A88();
    id v11 = objc_msgSend(ObjCClassFromMetadata, sel_overridableValueForKey_inConfigurationDictionary_userDefaults_, v9, v10, a2);

    if (v11)
    {
      sub_1C3DBAA68();
      swift_unknownObjectRelease();
      sub_1C3C2A5D8(v24, v25);
    }
    else
    {
      memset(v25, 0, sizeof(v25));
    }
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB6FB1D8);
    uint64_t v22 = *(void *)(*MEMORY[0x1E4FBC5F0] + v6 + 8);
    int v23 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v22 - 8) + 56))(a3, v23 ^ 1u, 1);
  }
  else
  {
    uint64_t v12 = qword_1EA3856D0;
    swift_retain_n();
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1C3DB9048();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EA386670);
    os_log_type_t v14 = sub_1C3DBA6B8();
    uint64_t v15 = sub_1C3DB9028();
    os_log_type_t v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(void *)&v24[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315650;
      uint64_t v19 = sub_1C3DBACC8();
      *(void *)&v25[0] = sub_1C3C516D0(v19, v20, (uint64_t *)v24);
      sub_1C3DBA9A8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2048;
      *(void *)&v25[0] = 35;
      sub_1C3DBA9A8();
      *(_WORD *)(v17 + 22) = 2080;
      *(void *)&v25[0] = 0;
      *((void *)&v25[0] + 1) = 0xE000000000000000;
      sub_1C3DBAC68();
      sub_1C3DB9D68();
      v26 = a1;
      sub_1C3DBB6E8();
      sub_1C3DBB398();
      *(void *)&v25[0] = sub_1C3C516D0(*(uint64_t *)&v25[0], *((unint64_t *)&v25[0] + 1), (uint64_t *)v24);
      sub_1C3DBA9A8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C3A61000, v15, v16, "Failed assertion at %s:%lu: %s", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1C877E600](v18, -1, -1);
      MEMORY[0x1C877E600](v17, -1, -1);
    }
    swift_release_n();

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(*MEMORY[0x1E4FBC5F0] + v6 + 8)
                                                                            - 8)
                                                                + 56))(a3, 1, 1);
  }
}

uint64_t static ICCloudConfiguration.loadSharedConfiguration(priority:)(uint64_t a1)
{
  v2[30] = a1;
  v2[31] = v1;
  uint64_t v3 = sub_1C3DB9578();
  v2[32] = v3;
  v2[33] = *(void *)(v3 - 8);
  v2[34] = swift_task_alloc();
  uint64_t v4 = sub_1C3DB95E8();
  v2[35] = v4;
  v2[36] = *(void *)(v4 - 8);
  v2[37] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FBAE0);
  v2[38] = swift_task_alloc();
  uint64_t v5 = sub_1C3DBA278();
  v2[39] = v5;
  v2[40] = *(void *)(v5 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C3D92470, 0, 0);
}

uint64_t sub_1C3D92470()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[38];
  sub_1C3C9F998(v0[30], v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1C3D53AE4(v0[38]);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v0[2] = v0;
    v0[7] = v0 + 28;
    v0[3] = sub_1C3D928D8;
    uint64_t v5 = swift_continuation_init();
    v0[18] = MEMORY[0x1E4F143A8];
    v0[19] = 0x40000000;
    v0[20] = sub_1C3D92A58;
    v0[21] = &block_descriptor;
    v0[22] = v5;
    objc_msgSend(ObjCClassFromMetadata, sel_loadSharedConfigurationWithCompletionHandler_, v0 + 18);
    uint64_t v6 = v0 + 2;
  }
  else
  {
    uint64_t v8 = v0[41];
    uint64_t v7 = v0[42];
    uint64_t v10 = v0[39];
    uint64_t v9 = v0[40];
    uint64_t v11 = v0[37];
    uint64_t v12 = v0[36];
    uint64_t v19 = v0[35];
    uint64_t v13 = v0[33];
    uint64_t v14 = v0[34];
    uint64_t v20 = v0[32];
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v7, v0[38], v10);
    uint64_t v15 = (void *)swift_getObjCClassFromMetadata();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v10);
    DispatchQoS.init(_:)(v8);
    sub_1C3DB95D8();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v19);
    uint64_t v16 = sub_1C3DB9568();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v20);
    v0[10] = v0;
    v0[15] = v0 + 29;
    v0[11] = sub_1C3D92740;
    uint64_t v17 = swift_continuation_init();
    v0[23] = MEMORY[0x1E4F143A8];
    v0[24] = 0x40000000;
    v0[25] = sub_1C3D92A58;
    v0[26] = &block_descriptor_1;
    v0[27] = v17;
    objc_msgSend(v15, sel_loadSharedConfigurationWithQoSClass_completionHandler_, v16);
    uint64_t v6 = v0 + 10;
  }
  return MEMORY[0x1F41881E8](v6);
}

uint64_t sub_1C3D92740()
{
  return MEMORY[0x1F4188298](sub_1C3D92820, 0, 0);
}

uint64_t sub_1C3D92820()
{
  (*(void (**)(void, void))(v0[40] + 8))(v0[42], v0[39]);
  uint64_t v1 = v0[29];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_1C3D928D8()
{
  return MEMORY[0x1F4188298](sub_1C3D929B8, 0, 0);
}

uint64_t sub_1C3D929B8()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1C3D92A58(uint64_t a1, void *a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  id v2 = a2;
  return swift_continuation_resume();
}

uint64_t ICCloudConfiguration.overridableValue<A>(for:in:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *a1;
  sub_1C3DBAA78();
  if (v6)
  {
    uint64_t v7 = (void *)sub_1C3DB9BF8();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)sub_1C3DB9A88();
    id v9 = objc_msgSend(v2, sel_overridableValueForKey_inConfigurationDictionary_, v7, v8);

    if (v9)
    {
      sub_1C3DBAA68();
      swift_unknownObjectRelease();
      sub_1C3C2A5D8(v22, v23);
    }
    else
    {
      memset(v23, 0, sizeof(v23));
    }
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB6FB1D8);
    uint64_t v20 = *(void *)(*MEMORY[0x1E4FBC5F0] + v5 + 8);
    int v21 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 56))(a2, v21 ^ 1u, 1);
  }
  else
  {
    uint64_t v10 = qword_1EA3856D0;
    swift_retain_n();
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1C3DB9048();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EA386670);
    os_log_type_t v12 = sub_1C3DBA6B8();
    uint64_t v13 = sub_1C3DB9028();
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(void *)&v22[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315650;
      uint64_t v17 = sub_1C3DBACC8();
      *(void *)&v23[0] = sub_1C3C516D0(v17, v18, (uint64_t *)v22);
      sub_1C3DBA9A8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)&v23[0] = 47;
      sub_1C3DBA9A8();
      *(_WORD *)(v15 + 22) = 2080;
      *(void *)&v23[0] = 0;
      *((void *)&v23[0] + 1) = 0xE000000000000000;
      sub_1C3DBAC68();
      sub_1C3DB9D68();
      v24 = a1;
      sub_1C3DBB6E8();
      sub_1C3DBB398();
      *(void *)&v23[0] = sub_1C3C516D0(*(uint64_t *)&v23[0], *((unint64_t *)&v23[0] + 1), (uint64_t *)v22);
      sub_1C3DBA9A8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C3A61000, v13, v14, "Failed assertion at %s:%lu: %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1C877E600](v16, -1, -1);
      MEMORY[0x1C877E600](v15, -1, -1);
    }
    swift_release_n();

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(*MEMORY[0x1E4FBC5F0] + v5 + 8)
                                                                            - 8)
                                                                + 56))(a2, 1, 1);
  }
}

uint64_t related decl 'e' for ICPaperDocumentErrorCode.init(_:attachment:)(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1C3D92EF8(a1, a2);

  return v3;
}

uint64_t static related decl 'e' for ICPaperDocumentErrorCode.attachmentClassKey.getter()
{
  return sub_1C3DB9C38();
}

uint64_t static related decl 'e' for ICPaperDocumentErrorCode.attachmentIdentifierKey.getter()
{
  return sub_1C3DB9C38();
}

uint64_t sub_1C3D92EF8(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA386590);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C3DD3D30;
  *(void *)(inited + 32) = sub_1C3DB9C38();
  *(void *)(inited + 40) = v5;
  uint64_t ObjectType = swift_getObjectType();
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA388FE8);
  *(void *)(inited + 48) = ObjectType;
  sub_1C3C81620(inited);
  id v7 = objc_msgSend(a2, sel_identifier);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_1C3DB9C38();
    uint64_t v11 = v10;

    uint64_t v12 = sub_1C3DB9C38();
    uint64_t v14 = v13;
    uint64_t v19 = MEMORY[0x1E4FBB1A0];
    *(void *)&long long v18 = v9;
    *((void *)&v18 + 1) = v11;
    sub_1C3C2A5D8(&v18, v17);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1C3D05584(v17, v12, v14, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for ICPaperDocumentError(0);
  *(void *)&v17[0] = a1;
  sub_1C3D93068();
  sub_1C3DB8768();
  return v18;
}

unint64_t sub_1C3D93068()
{
  unint64_t result = qword_1EA385BD0;
  if (!qword_1EA385BD0)
  {
    type metadata accessor for ICPaperDocumentError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA385BD0);
  }
  return result;
}

uint64_t __getMarkupViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICNotesCrossProcessChangeCoordinator postCrossProcessNotificationName:](v0);
}

void versioned_document::Document::CheckTypeAndMergeFrom()
{
  __assert_rtn("down_cast", "common.h", 349, "f == NULL || dynamic_cast<To>(f) != NULL");
}

void versioned_document::Version::SharedCtor()
{
  __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
}

uint64_t __getMKMapItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[ICCloudConfiguration availableConfigurationURLs](v0);
}

uint64_t __getLPLinkMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICAccount setMarkedForDeletion:](v0);
}

#error "1C3DA0F78: call analysis failed (funcsize=49)"

#error "1C3DA4208: call analysis failed (funcsize=38)"

#error "1C3DA42A8: call analysis failed (funcsize=38)"

#error "1C3DA4348: call analysis failed (funcsize=38)"

#error "1C3DA43FC: call analysis failed (funcsize=43)"

#error "1C3DA449C: call analysis failed (funcsize=38)"

uint64_t __getCNMutablePostalAddressClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNPostalAddressFormatterClass_block_invoke_cold_1(v0);
}

uint64_t __getCNPostalAddressFormatterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICCloudThrottlingPolicy incrementBatchCount](v0);
}

void __getNLEmbeddingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  topotext::Selection::MergeFrom(v0);
}

void topotext::Selection::MergeFrom()
{
}

void topotext::AttributeRun::MergeFrom()
{
}

uint64_t __getNLTokenizerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAppleSpellClass_block_invoke_cold_1(v0);
}

uint64_t __getAppleSpellClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2_cold_1(v0);
}

uint64_t __getVNSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNImageRequestHandlerClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNRecognizeTextRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNRecognizeTextRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_1(v0);
}

void __getCKRecordClass_block_invoke_cold_1()
{
}

uint64_t sub_1C3DB80F8()
{
  return MEMORY[0x1F40D4928]();
}

uint64_t sub_1C3DB8108()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1C3DB8118()
{
  return MEMORY[0x1F40E2FD8]();
}

uint64_t sub_1C3DB8128()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C3DB8138()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C3DB8148()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C3DB8158()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1C3DB8168()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1C3DB8178()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1C3DB8188()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C3DB8198()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C3DB81A8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C3DB81B8()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1C3DB81C8()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1C3DB81D8()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1C3DB81E8()
{
  return MEMORY[0x1F40E3370]();
}

uint64_t sub_1C3DB81F8()
{
  return MEMORY[0x1F40E33E8]();
}

uint64_t sub_1C3DB8208()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1C3DB8218()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1C3DB8228()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1C3DB8238()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1C3DB8248()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1C3DB8258()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1C3DB8268()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1C3DB8278()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C3DB8288()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1C3DB8298()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1C3DB82A8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C3DB82B8()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1C3DB82C8()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1C3DB82D8()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1C3DB82E8()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1C3DB82F8()
{
  return MEMORY[0x1F40E3638]();
}

uint64_t sub_1C3DB8308()
{
  return MEMORY[0x1F40E3640]();
}

uint64_t sub_1C3DB8318()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1C3DB8328()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1C3DB8338()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1C3DB8348()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1C3DB8358()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1C3DB8368()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1C3DB8378()
{
  return MEMORY[0x1F40E3720]();
}

uint64_t sub_1C3DB8388()
{
  return MEMORY[0x1F40E3728]();
}

uint64_t sub_1C3DB8398()
{
  return MEMORY[0x1F40E3730]();
}

uint64_t sub_1C3DB83A8()
{
  return MEMORY[0x1F40E3738]();
}

uint64_t sub_1C3DB83B8()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1C3DB83C8()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1C3DB83D8()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1C3DB83E8()
{
  return MEMORY[0x1F40E3778]();
}

uint64_t sub_1C3DB83F8()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1C3DB8408()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1C3DB8418()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C3DB8428()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C3DB8438()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C3DB8448()
{
  return MEMORY[0x1F40E3838]();
}

uint64_t sub_1C3DB8458()
{
  return MEMORY[0x1F40E3848]();
}

uint64_t sub_1C3DB8468()
{
  return MEMORY[0x1F40E3A78]();
}

uint64_t sub_1C3DB8478()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1C3DB8488()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1C3DB8498()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1C3DB84E8()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1C3DB84F8()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1C3DB8508()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1C3DB8518()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1C3DB8528()
{
  return MEMORY[0x1F40E3D38]();
}

uint64_t sub_1C3DB8538()
{
  return MEMORY[0x1F40E3D40]();
}

uint64_t sub_1C3DB8548()
{
  return MEMORY[0x1F40E3D58]();
}

uint64_t sub_1C3DB8558()
{
  return MEMORY[0x1F40E3D60]();
}

uint64_t sub_1C3DB8568()
{
  return MEMORY[0x1F40E3D68]();
}

uint64_t sub_1C3DB8578()
{
  return MEMORY[0x1F40E3DC8]();
}

uint64_t sub_1C3DB8588()
{
  return MEMORY[0x1F40E3DE8]();
}

uint64_t sub_1C3DB8598()
{
  return MEMORY[0x1F40E3DF8]();
}

uint64_t sub_1C3DB85A8()
{
  return MEMORY[0x1F40E3E08]();
}

uint64_t sub_1C3DB85B8()
{
  return MEMORY[0x1F40E3E98]();
}

uint64_t sub_1C3DB85C8()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1C3DB85D8()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1C3DB85E8()
{
  return MEMORY[0x1F40E3F00]();
}

uint64_t sub_1C3DB85F8()
{
  return MEMORY[0x1F40E3F18]();
}

uint64_t sub_1C3DB8608()
{
  return MEMORY[0x1F40E3F68]();
}

uint64_t sub_1C3DB8618()
{
  return MEMORY[0x1F4187828]();
}

uint64_t sub_1C3DB8628()
{
  return MEMORY[0x1F40E3FF0]();
}

uint64_t sub_1C3DB8638()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1C3DB8648()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1C3DB8658()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1C3DB8668()
{
  return MEMORY[0x1F40E4140]();
}

uint64_t sub_1C3DB8678()
{
  return MEMORY[0x1F40E4150]();
}

uint64_t sub_1C3DB8688()
{
  return MEMORY[0x1F40E4160]();
}

uint64_t sub_1C3DB8698()
{
  return MEMORY[0x1F40E41B8]();
}

uint64_t sub_1C3DB86A8()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1C3DB86B8()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1C3DB86C8()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1C3DB86D8()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1C3DB86E8()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1C3DB86F8()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1C3DB8768()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1C3DB8788()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C3DB8798()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C3DB87A8()
{
  return MEMORY[0x1F40E4868]();
}

uint64_t sub_1C3DB87B8()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1C3DB87C8()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1C3DB87D8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1C3DB87E8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C3DB87F8()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1C3DB8808()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1C3DB8828()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1C3DB8838()
{
  return MEMORY[0x1F40E4990]();
}

uint64_t sub_1C3DB8848()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C3DB8858()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1C3DB8868()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1C3DB8878()
{
  return MEMORY[0x1F40E4A18]();
}

uint64_t sub_1C3DB8888()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1C3DB8898()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C3DB88A8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1C3DB88B8()
{
  return MEMORY[0x1F40E4AE8]();
}

uint64_t sub_1C3DB88C8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C3DB88D8()
{
  return MEMORY[0x1F40E4B40]();
}

uint64_t sub_1C3DB88E8()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1C3DB88F8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C3DB8908()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1C3DB8918()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1C3DB8928()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1C3DB8938()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C3DB8948()
{
  return MEMORY[0x1F40E4D90]();
}

uint64_t sub_1C3DB8958()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C3DB8968()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1C3DB8978()
{
  return MEMORY[0x1F40E4E48]();
}

uint64_t sub_1C3DB8988()
{
  return MEMORY[0x1F40E5058]();
}

uint64_t sub_1C3DB8998()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1C3DB89A8()
{
  return MEMORY[0x1F4139BA0]();
}

uint64_t sub_1C3DB89B8()
{
  return MEMORY[0x1F4139BA8]();
}

uint64_t sub_1C3DB89C8()
{
  return MEMORY[0x1F4139BC0]();
}

uint64_t sub_1C3DB89D8()
{
  return MEMORY[0x1F4139BD0]();
}

uint64_t sub_1C3DB89E8()
{
  return MEMORY[0x1F4139BD8]();
}

uint64_t sub_1C3DB89F8()
{
  return MEMORY[0x1F40E50A0]();
}

uint64_t sub_1C3DB8A08()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1C3DB8A18()
{
  return MEMORY[0x1F40E50E8]();
}

uint64_t sub_1C3DB8A28()
{
  return MEMORY[0x1F40E50F0]();
}

uint64_t sub_1C3DB8A38()
{
  return MEMORY[0x1F40E50F8]();
}

uint64_t sub_1C3DB8A48()
{
  return MEMORY[0x1F40E5100]();
}

uint64_t sub_1C3DB8A58()
{
  return MEMORY[0x1F40E5118]();
}

uint64_t sub_1C3DB8A68()
{
  return MEMORY[0x1F40E5148]();
}

uint64_t sub_1C3DB8A78()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C3DB8A88()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C3DB8A98()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1C3DB8AA8()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1C3DB8AB8()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1C3DB8AC8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t _s10Foundation4DateV11NotesSharedE15defaultArgumentACvgZ_0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1C3DB8AE8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C3DB8AF8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C3DB8B08()
{
  return MEMORY[0x1F40E5390]();
}

uint64_t sub_1C3DB8B18()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1C3DB8B28()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C3DB8B38()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C3DB8B48()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C3DB8B58()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C3DB8B68()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1C3DB8B78()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t _s10Foundation4UUIDV11NotesSharedE15defaultArgumentACvgZ_0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C3DB8B98()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C3DB8BA8()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1C3DB8BB8()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1C3DB8BC8()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1C3DB8BD8()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1C3DB8BE8()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1C3DB8BF8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C3DB8C08()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1C3DB8C18()
{
  return MEMORY[0x1F40E5820]();
}

uint64_t sub_1C3DB8C28()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1C3DB8C38()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1C3DB8C48()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C3DB8C58()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1C3DB8C68()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1C3DB8C78()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1C3DB8C88()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C3DB8C98()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1C3DB8CA8()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1C3DB8CB8()
{
  return MEMORY[0x1F40D32D0]();
}

uint64_t sub_1C3DB8CC8()
{
  return MEMORY[0x1F40D34E8]();
}

uint64_t sub_1C3DB8CD8()
{
  return MEMORY[0x1F40D34F0]();
}

uint64_t sub_1C3DB8CE8()
{
  return MEMORY[0x1F40D3710]();
}

uint64_t sub_1C3DB8CF8()
{
  return MEMORY[0x1F40D3968]();
}

uint64_t sub_1C3DB8D08()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1C3DB8D18()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1C3DB8D28()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1C3DB8D38()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1C3DB8D48()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1C3DB8D58()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1C3DB8D68()
{
  return MEMORY[0x1F4182D60]();
}

uint64_t sub_1C3DB8D78()
{
  return MEMORY[0x1F4111EE0]();
}

uint64_t sub_1C3DB8D88()
{
  return MEMORY[0x1F4111EF8]();
}

uint64_t sub_1C3DB8D98()
{
  return MEMORY[0x1F4111F00]();
}

uint64_t sub_1C3DB8DA8()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1C3DB8DB8()
{
  return MEMORY[0x1F4139BE0]();
}

uint64_t sub_1C3DB8DC8()
{
  return MEMORY[0x1F4139BF0]();
}

uint64_t sub_1C3DB8DD8()
{
  return MEMORY[0x1F4139BF8]();
}

uint64_t sub_1C3DB8DE8()
{
  return MEMORY[0x1F4139C00]();
}

uint64_t sub_1C3DB8DF8()
{
  return MEMORY[0x1F40E74A0]();
}

uint64_t sub_1C3DB8E08()
{
  return MEMORY[0x1F40E74A8]();
}

uint64_t sub_1C3DB8E18()
{
  return MEMORY[0x1F40E7568]();
}

uint64_t sub_1C3DB8E28()
{
  return MEMORY[0x1F40E7588]();
}

uint64_t sub_1C3DB8E38()
{
  return MEMORY[0x1F40E75C0]();
}

uint64_t sub_1C3DB8E48()
{
  return MEMORY[0x1F40E75D8]();
}

uint64_t sub_1C3DB8E68()
{
  return MEMORY[0x1F40E7740]();
}

uint64_t sub_1C3DB8E78()
{
  return MEMORY[0x1F40E77A8]();
}

uint64_t sub_1C3DB8E88()
{
  return MEMORY[0x1F40E77C8]();
}

uint64_t sub_1C3DB8E98()
{
  return MEMORY[0x1F4127060]();
}

uint64_t _s11NotesShared11PingRequestVACycfC_0()
{
  return MEMORY[0x1F4127078]();
}

uint64_t sub_1C3DB8EB8()
{
  return MEMORY[0x1F4127088]();
}

uint64_t sub_1C3DB8EC8()
{
  return MEMORY[0x1F4127138]();
}

uint64_t sub_1C3DB8EE8()
{
  return MEMORY[0x1F4127180]();
}

uint64_t sub_1C3DB8EF8()
{
  return MEMORY[0x1F4127200]();
}

uint64_t sub_1C3DB8F08()
{
  return MEMORY[0x1F4127290]();
}

uint64_t sub_1C3DB8F18()
{
  return MEMORY[0x1F41272C8]();
}

uint64_t sub_1C3DB8F28()
{
  return MEMORY[0x1F4127330]();
}

uint64_t sub_1C3DB8F48()
{
  return MEMORY[0x1F4127398]();
}

uint64_t sub_1C3DB8F58()
{
  return MEMORY[0x1F41273A0]();
}

uint64_t sub_1C3DB8F68()
{
  return MEMORY[0x1F4127458]();
}

uint64_t sub_1C3DB8F78()
{
  return MEMORY[0x1F41274A8]();
}

uint64_t sub_1C3DB8F88()
{
  return MEMORY[0x1F41274D0]();
}

uint64_t sub_1C3DB8F98()
{
  return MEMORY[0x1F4127660]();
}

uint64_t sub_1C3DB8FA8()
{
  return MEMORY[0x1F4127678]();
}

uint64_t sub_1C3DB8FB8()
{
  return MEMORY[0x1F4127680]();
}

uint64_t sub_1C3DB8FC8()
{
  return MEMORY[0x1F4127690]();
}

uint64_t sub_1C3DB8FD8()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1C3DB8FE8()
{
  return MEMORY[0x1F4187868]();
}

uint64_t sub_1C3DB8FF8()
{
  return MEMORY[0x1F4187990]();
}

uint64_t sub_1C3DB9008()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1C3DB9018()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1C3DB9028()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C3DB9038()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C3DB9048()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C3DB9058()
{
  return MEMORY[0x1F414A630]();
}

uint64_t sub_1C3DB9068()
{
  return MEMORY[0x1F414A638]();
}

uint64_t sub_1C3DB9078()
{
  return MEMORY[0x1F414A640]();
}

uint64_t sub_1C3DB9088()
{
  return MEMORY[0x1F414A648]();
}

uint64_t sub_1C3DB9098()
{
  return MEMORY[0x1F414A650]();
}

uint64_t sub_1C3DB90A8()
{
  return MEMORY[0x1F414A658]();
}

uint64_t sub_1C3DB90B8()
{
  return MEMORY[0x1F414A668]();
}

uint64_t sub_1C3DB90C8()
{
  return MEMORY[0x1F414A670]();
}

uint64_t sub_1C3DB90D8()
{
  return MEMORY[0x1F414A678]();
}

uint64_t sub_1C3DB90E8()
{
  return MEMORY[0x1F414A680]();
}

uint64_t sub_1C3DB90F8()
{
  return MEMORY[0x1F414A688]();
}

uint64_t sub_1C3DB9118()
{
  return MEMORY[0x1F414A698]();
}

uint64_t sub_1C3DB9128()
{
  return MEMORY[0x1F414A6A0]();
}

uint64_t sub_1C3DB9138()
{
  return MEMORY[0x1F414A6C8]();
}

uint64_t sub_1C3DB9148()
{
  return MEMORY[0x1F414A6D0]();
}

uint64_t sub_1C3DB9158()
{
  return MEMORY[0x1F414A6D8]();
}

uint64_t sub_1C3DB9168()
{
  return MEMORY[0x1F414A6E0]();
}

uint64_t sub_1C3DB9178()
{
  return MEMORY[0x1F4186BA0]();
}

uint64_t sub_1C3DB9188()
{
  return MEMORY[0x1F41884D8]();
}

uint64_t sub_1C3DB9198()
{
  return MEMORY[0x1F41884E0]();
}

uint64_t sub_1C3DB91D8()
{
  return MEMORY[0x1F40F7660]();
}

uint64_t sub_1C3DB91F8()
{
  return MEMORY[0x1F40F7680]();
}

uint64_t sub_1C3DB9208()
{
  return MEMORY[0x1F40F76A0]();
}

uint64_t sub_1C3DB9218()
{
  return MEMORY[0x1F40F76B0]();
}

uint64_t sub_1C3DB9228()
{
  return MEMORY[0x1F40F76F0]();
}

uint64_t sub_1C3DB9238()
{
  return MEMORY[0x1F40F7708]();
}

uint64_t sub_1C3DB9248()
{
  return MEMORY[0x1F40F7728]();
}

uint64_t sub_1C3DB9258()
{
  return MEMORY[0x1F40F7748]();
}

uint64_t sub_1C3DB9268()
{
  return MEMORY[0x1F40F7770]();
}

uint64_t sub_1C3DB9278()
{
  return MEMORY[0x1F40F7780]();
}

uint64_t sub_1C3DB9288()
{
  return MEMORY[0x1F40F7788]();
}

uint64_t sub_1C3DB9298()
{
  return MEMORY[0x1F40F7798]();
}

uint64_t sub_1C3DB92A8()
{
  return MEMORY[0x1F40F77A0]();
}

uint64_t sub_1C3DB92B8()
{
  return MEMORY[0x1F40F77E8]();
}

uint64_t sub_1C3DB92C8()
{
  return MEMORY[0x1F40F77F8]();
}

uint64_t sub_1C3DB92D8()
{
  return MEMORY[0x1F40F7808]();
}

uint64_t sub_1C3DB92E8()
{
  return MEMORY[0x1F40F7810]();
}

uint64_t sub_1C3DB92F8()
{
  return MEMORY[0x1F40F7818]();
}

uint64_t sub_1C3DB9308()
{
  return MEMORY[0x1F40F7820]();
}

uint64_t sub_1C3DB9318()
{
  return MEMORY[0x1F40F78B8]();
}

uint64_t sub_1C3DB9328()
{
  return MEMORY[0x1F40F78E0]();
}

uint64_t sub_1C3DB9338()
{
  return MEMORY[0x1F40F7A28]();
}

uint64_t sub_1C3DB9348()
{
  return MEMORY[0x1F40F7AA0]();
}

uint64_t sub_1C3DB9358()
{
  return MEMORY[0x1F40F7AB0]();
}

uint64_t sub_1C3DB9368()
{
  return MEMORY[0x1F40F7B20]();
}

uint64_t sub_1C3DB9378()
{
  return MEMORY[0x1F40F7BA0]();
}

uint64_t sub_1C3DB9388()
{
  return MEMORY[0x1F4187780]();
}

uint64_t sub_1C3DB9398()
{
  return MEMORY[0x1F4187798]();
}

uint64_t sub_1C3DB93A8()
{
  return MEMORY[0x1F41877A0]();
}

uint64_t sub_1C3DB93B8()
{
  return MEMORY[0x1F41877B8]();
}

uint64_t sub_1C3DB93C8()
{
  return MEMORY[0x1F41877C0]();
}

uint64_t sub_1C3DB93D8()
{
  return MEMORY[0x1F41877C8]();
}

uint64_t sub_1C3DB93E8()
{
  return MEMORY[0x1F41877D0]();
}

uint64_t sub_1C3DB93F8()
{
  return MEMORY[0x1F41877D8]();
}

uint64_t sub_1C3DB9408()
{
  return MEMORY[0x1F41877E8]();
}

uint64_t sub_1C3DB9418()
{
  return MEMORY[0x1F41877F0]();
}

uint64_t sub_1C3DB9428()
{
  return MEMORY[0x1F41877F8]();
}

uint64_t sub_1C3DB9438()
{
  return MEMORY[0x1F4187810]();
}

uint64_t sub_1C3DB9448()
{
  return MEMORY[0x1F4187818]();
}

uint64_t sub_1C3DB9458()
{
  return MEMORY[0x1F40D6640]();
}

uint64_t sub_1C3DB9468()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1C3DB9478()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1C3DB9488()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1C3DB9498()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1C3DB94A8()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1C3DB94B8()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1C3DB94C8()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1C3DB94D8()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1C3DB94E8()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1C3DB94F8()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1C3DB9508()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C3DB9518()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1C3DB9528()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1C3DB9538()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1C3DB9548()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C3DB9558()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C3DB9568()
{
  return MEMORY[0x1F4186CD0]();
}

uint64_t sub_1C3DB9578()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C3DB9588()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1C3DB9598()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C3DB95A8()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C3DB95B8()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1C3DB95C8()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1C3DB95D8()
{
  return MEMORY[0x1F4186D50]();
}

uint64_t sub_1C3DB95E8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C3DB95F8()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1C3DB9608()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1C3DB9618()
{
  return MEMORY[0x1F413A078]();
}

uint64_t sub_1C3DB9628()
{
  return MEMORY[0x1F413A090]();
}

uint64_t sub_1C3DB9638()
{
  return MEMORY[0x1F413A098]();
}

uint64_t sub_1C3DB9648()
{
  return MEMORY[0x1F413A0A8]();
}

uint64_t sub_1C3DB9658()
{
  return MEMORY[0x1F413A0B0]();
}

uint64_t sub_1C3DB9668()
{
  return MEMORY[0x1F413A0B8]();
}

uint64_t sub_1C3DB9678()
{
  return MEMORY[0x1F413A0C0]();
}

uint64_t sub_1C3DB9688()
{
  return MEMORY[0x1F413A0C8]();
}

uint64_t sub_1C3DB9698()
{
  return MEMORY[0x1F413A0D0]();
}

uint64_t sub_1C3DB96A8()
{
  return MEMORY[0x1F413A0D8]();
}

uint64_t sub_1C3DB96C8()
{
  return MEMORY[0x1F413A0E8]();
}

uint64_t sub_1C3DB96D8()
{
  return MEMORY[0x1F413A0F0]();
}

uint64_t sub_1C3DB96E8()
{
  return MEMORY[0x1F413A0F8]();
}

uint64_t sub_1C3DB96F8()
{
  return MEMORY[0x1F413A100]();
}

uint64_t sub_1C3DB9708()
{
  return MEMORY[0x1F413A110]();
}

uint64_t sub_1C3DB9718()
{
  return MEMORY[0x1F413A118]();
}

uint64_t sub_1C3DB9728()
{
  return MEMORY[0x1F413A120]();
}

uint64_t sub_1C3DB9738()
{
  return MEMORY[0x1F413A130]();
}

uint64_t sub_1C3DB9748()
{
  return MEMORY[0x1F413A138]();
}

uint64_t sub_1C3DB9758()
{
  return MEMORY[0x1F413A140]();
}

uint64_t sub_1C3DB9768()
{
  return MEMORY[0x1F413A150]();
}

uint64_t sub_1C3DB9778()
{
  return MEMORY[0x1F413A158]();
}

uint64_t sub_1C3DB9788()
{
  return MEMORY[0x1F413A1A0]();
}

uint64_t sub_1C3DB9798()
{
  return MEMORY[0x1F413A1A8]();
}

uint64_t sub_1C3DB97A8()
{
  return MEMORY[0x1F4112258]();
}

uint64_t sub_1C3DB97B8()
{
  return MEMORY[0x1F4112268]();
}

uint64_t sub_1C3DB97C8()
{
  return MEMORY[0x1F4112280]();
}

uint64_t sub_1C3DB97D8()
{
  return MEMORY[0x1F41122B0]();
}

uint64_t sub_1C3DB97E8()
{
  return MEMORY[0x1F41122C8]();
}

uint64_t sub_1C3DB97F8()
{
  return MEMORY[0x1F413A1C0]();
}

uint64_t sub_1C3DB9808()
{
  return MEMORY[0x1F413A1C8]();
}

uint64_t sub_1C3DB9818()
{
  return MEMORY[0x1F413A1D0]();
}

uint64_t sub_1C3DB9828()
{
  return MEMORY[0x1F413A1D8]();
}

uint64_t sub_1C3DB9838()
{
  return MEMORY[0x1F41123F8]();
}

uint64_t sub_1C3DB9848()
{
  return MEMORY[0x1F4112400]();
}

uint64_t sub_1C3DB9858()
{
  return MEMORY[0x1F4112408]();
}

uint64_t sub_1C3DB9868()
{
  return MEMORY[0x1F413A1E0]();
}

uint64_t sub_1C3DB9878()
{
  return MEMORY[0x1F413A1E8]();
}

uint64_t sub_1C3DB9888()
{
  return MEMORY[0x1F413A1F0]();
}

uint64_t sub_1C3DB9898()
{
  return MEMORY[0x1F413A1F8]();
}

uint64_t sub_1C3DB98A8()
{
  return MEMORY[0x1F413A200]();
}

uint64_t sub_1C3DB98B8()
{
  return MEMORY[0x1F413A208]();
}

uint64_t sub_1C3DB98C8()
{
  return MEMORY[0x1F413A210]();
}

uint64_t sub_1C3DB98D8()
{
  return MEMORY[0x1F4112410]();
}

uint64_t sub_1C3DB98E8()
{
  return MEMORY[0x1F4112418]();
}

uint64_t sub_1C3DB98F8()
{
  return MEMORY[0x1F41124A0]();
}

uint64_t sub_1C3DB9908()
{
  return MEMORY[0x1F41124A8]();
}

uint64_t sub_1C3DB9918()
{
  return MEMORY[0x1F41124B0]();
}

uint64_t sub_1C3DB9928()
{
  return MEMORY[0x1F41124B8]();
}

uint64_t sub_1C3DB9938()
{
  return MEMORY[0x1F4112508]();
}

uint64_t sub_1C3DB9948()
{
  return MEMORY[0x1F4112510]();
}

uint64_t sub_1C3DB9958()
{
  return MEMORY[0x1F4112540]();
}

uint64_t sub_1C3DB9968()
{
  return MEMORY[0x1F413A238]();
}

uint64_t sub_1C3DB9978()
{
  return MEMORY[0x1F413A248]();
}

uint64_t sub_1C3DB9988()
{
  return MEMORY[0x1F4112550]();
}

uint64_t sub_1C3DB9998()
{
  return MEMORY[0x1F4112568]();
}

uint64_t sub_1C3DB99A8()
{
  return MEMORY[0x1F4112570]();
}

uint64_t sub_1C3DB99B8()
{
  return MEMORY[0x1F41125B8]();
}

uint64_t sub_1C3DB99C8()
{
  return MEMORY[0x1F41125C0]();
}

uint64_t sub_1C3DB99D8()
{
  return MEMORY[0x1F41125C8]();
}

uint64_t sub_1C3DB99E8()
{
  return MEMORY[0x1F41125D0]();
}

uint64_t sub_1C3DB99F8()
{
  return MEMORY[0x1F41125E0]();
}

uint64_t sub_1C3DB9A08()
{
  return MEMORY[0x1F41125E8]();
}

uint64_t sub_1C3DB9A18()
{
  return MEMORY[0x1F41125F8]();
}

uint64_t sub_1C3DB9A28()
{
  return MEMORY[0x1F4112600]();
}

uint64_t sub_1C3DB9A38()
{
  return MEMORY[0x1F41868F0]();
}

uint64_t sub_1C3DB9A48()
{
  return MEMORY[0x1F40F46D8]();
}

uint64_t sub_1C3DB9A58()
{
  return MEMORY[0x1F40F46E0]();
}

uint64_t sub_1C3DB9A68()
{
  return MEMORY[0x1F40F46E8]();
}

uint64_t sub_1C3DB9A78()
{
  return MEMORY[0x1F40F46F0]();
}

uint64_t sub_1C3DB9A88()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C3DB9A98()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C3DB9AA8()
{
  return MEMORY[0x1F4183360]();
}

uint64_t sub_1C3DB9AB8()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1C3DB9AC8()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1C3DB9AD8()
{
  return MEMORY[0x1F41834B0]();
}

uint64_t sub_1C3DB9AE8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1C3DB9AF8()
{
  return MEMORY[0x1F4183510]();
}

uint64_t sub_1C3DB9B08()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C3DB9B18()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C3DB9B28()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1C3DB9B38()
{
  return MEMORY[0x1F4183630]();
}

uint64_t sub_1C3DB9B48()
{
  return MEMORY[0x1F4183650]();
}

uint64_t sub_1C3DB9B58()
{
  return MEMORY[0x1F4183680]();
}

uint64_t sub_1C3DB9B68()
{
  return MEMORY[0x1F41883E8]();
}

uint64_t sub_1C3DB9B78()
{
  return MEMORY[0x1F4183720]();
}

uint64_t sub_1C3DB9B88()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C3DB9B98()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1C3DB9BA8()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1C3DB9BB8()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1C3DB9BC8()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1C3DB9BD8()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1C3DB9BE8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C3DB9BF8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C3DB9C08()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1C3DB9C18()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C3DB9C28()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C3DB9C38()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C3DB9C48()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1C3DB9C58()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C3DB9C68()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C3DB9C78()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C3DB9C88()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C3DB9C98()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1C3DB9CA8()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C3DB9CB8()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C3DB9CC8()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C3DB9CE8()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1C3DB9CF8()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1C3DB9D08()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C3DB9D18()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C3DB9D28()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1C3DB9D38()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C3DB9D48()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1C3DB9D58()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1C3DB9D68()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C3DB9D88()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1C3DB9D98()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C3DB9DA8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C3DB9DB8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C3DB9DD8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C3DB9DE8()
{
  return MEMORY[0x1F4183AD8]();
}

uint64_t sub_1C3DB9DF8()
{
  return MEMORY[0x1F4183AF0]();
}

uint64_t sub_1C3DB9E08()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1C3DB9E18()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C3DB9E28()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1C3DB9E38()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1C3DB9E48()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1C3DB9E58()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1C3DB9E68()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1C3DB9E78()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C3DB9E88()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C3DB9E98()
{
  return MEMORY[0x1F4139C08]();
}

uint64_t sub_1C3DB9EA8()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1C3DB9EB8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1C3DB9EC8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1C3DB9ED8()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1C3DB9EE8()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1C3DB9EF8()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1C3DB9F08()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1C3DB9F18()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1C3DB9F28()
{
  return MEMORY[0x1F4183D68]();
}

uint64_t sub_1C3DB9F38()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C3DB9F48()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1C3DB9F58()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1C3DB9F68()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C3DB9F78()
{
  return MEMORY[0x1F4183DB8]();
}

uint64_t sub_1C3DB9FB8()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1C3DB9FC8()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C3DB9FD8()
{
  return MEMORY[0x1F4183E30]();
}

uint64_t sub_1C3DB9FE8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C3DB9FF8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C3DBA008()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1C3DBA018()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C3DBA028()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C3DBA038()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C3DBA048()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1C3DBA058()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1C3DBA068()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C3DBA078()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1C3DBA088()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1C3DBA098()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C3DBA0A8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C3DBA0B8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1C3DBA0C8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C3DBA0D8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1C3DBA0E8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1C3DBA0F8()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1C3DBA108()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1C3DBA118()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1C3DBA128()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C3DBA138()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1C3DBA148()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1C3DBA158()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1C3DBA168()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C3DBA178()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C3DBA188()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C3DBA1E8()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1C3DBA1F8()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1C3DBA208()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1C3DBA218()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1C3DBA228()
{
  return MEMORY[0x1F4187CD8]();
}

uint64_t sub_1C3DBA238()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1C3DBA248()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_1C3DBA258()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1C3DBA268()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C3DBA278()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C3DBA288()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t sub_1C3DBA298()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1C3DBA2A8()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1C3DBA2B8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1C3DBA2D8()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1C3DBA2E8()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1C3DBA2F8()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1C3DBA308()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1C3DBA338()
{
  return MEMORY[0x1F4187E40]();
}

uint64_t sub_1C3DBA358()
{
  return MEMORY[0x1F4187E50]();
}

uint64_t sub_1C3DBA368()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1C3DBA378()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1C3DBA398()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1C3DBA3A8()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1C3DBA3B8()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1C3DBA3D8()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1C3DBA3E8()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1C3DBA3F8()
{
  return MEMORY[0x1F40E63D0]();
}

uint64_t sub_1C3DBA408()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C3DBA418()
{
  return MEMORY[0x1F4184090]();
}

uint64_t sub_1C3DBA428()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C3DBA438()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C3DBA448()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C3DBA458()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C3DBA468()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1C3DBA478()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C3DBA488()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1C3DBA498()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1C3DBA4A8()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C3DBA4B8()
{
  return MEMORY[0x1F40E64A0]();
}

uint64_t sub_1C3DBA4C8()
{
  return MEMORY[0x1F41842A0]();
}

uint64_t sub_1C3DBA508()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_1C3DBA528()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C3DBA538()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C3DBA548()
{
  return MEMORY[0x1F4184320]();
}

uint64_t sub_1C3DBA558()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1C3DBA568()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C3DBA578()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1C3DBA598()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1C3DBA5A8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1C3DBA5B8()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1C3DBA5C8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C3DBA5D8()
{
  return MEMORY[0x1F4184470]();
}

uint64_t sub_1C3DBA5E8()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t sub_1C3DBA5F8()
{
  return MEMORY[0x1F4184588]();
}

uint64_t sub_1C3DBA608()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1C3DBA618()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1C3DBA628()
{
  return MEMORY[0x1F4186A28]();
}

uint64_t sub_1C3DBA638()
{
  return MEMORY[0x1F4187418]();
}

uint64_t sub_1C3DBA648()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1C3DBA658()
{
  return MEMORY[0x1F4111F10]();
}

uint64_t sub_1C3DBA668()
{
  return MEMORY[0x1F40E6628]();
}

uint64_t sub_1C3DBA678()
{
  return MEMORY[0x1F40E6640]();
}

uint64_t sub_1C3DBA688()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C3DBA698()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C3DBA6A8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C3DBA6B8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C3DBA6C8()
{
  return MEMORY[0x1F4186A58]();
}

uint64_t sub_1C3DBA6D8()
{
  return MEMORY[0x1F4186A60]();
}

uint64_t sub_1C3DBA6E8()
{
  return MEMORY[0x1F4186A68]();
}

uint64_t sub_1C3DBA6F8()
{
  return MEMORY[0x1F4186A70]();
}

uint64_t sub_1C3DBA708()
{
  return MEMORY[0x1F4186A78]();
}

uint64_t sub_1C3DBA718()
{
  return MEMORY[0x1F4186A98]();
}

uint64_t sub_1C3DBA728()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C3DBA738()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C3DBA748()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1C3DBA758()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C3DBA768()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C3DBA778()
{
  return MEMORY[0x1F40D61E8]();
}

uint64_t sub_1C3DBA798()
{
  return MEMORY[0x1F40E6748]();
}

uint64_t sub_1C3DBA7A8()
{
  return MEMORY[0x1F40E6758]();
}

uint64_t sub_1C3DBA7B8()
{
  return MEMORY[0x1F40E6768]();
}

uint64_t sub_1C3DBA7C8()
{
  return MEMORY[0x1F40E6778]();
}

uint64_t sub_1C3DBA7D8()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1C3DBA7E8()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1C3DBA7F8()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1C3DBA808()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1C3DBA818()
{
  return MEMORY[0x1F40D7050]();
}

uint64_t sub_1C3DBA828()
{
  return MEMORY[0x1F40D7058]();
}

uint64_t sub_1C3DBA838()
{
  return MEMORY[0x1F40D7060]();
}

uint64_t sub_1C3DBA848()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1C3DBA858()
{
  return MEMORY[0x1F4139C10]();
}

uint64_t sub_1C3DBA868()
{
  return MEMORY[0x1F4139C18]();
}

uint64_t sub_1C3DBA878()
{
  return MEMORY[0x1F40D4A98]();
}

uint64_t sub_1C3DBA888()
{
  return MEMORY[0x1F40D4AA8]();
}

uint64_t sub_1C3DBA8A8()
{
  return MEMORY[0x1F4186B58]();
}

uint64_t sub_1C3DBA8B8()
{
  return MEMORY[0x1F4111F48]();
}

uint64_t sub_1C3DBA8C8()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1C3DBA8D8()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C3DBA8E8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C3DBA8F8()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1C3DBA908()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1C3DBA918()
{
  return MEMORY[0x1F40E6970]();
}

uint64_t sub_1C3DBA928()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1C3DBA938()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C3DBA948()
{
  return MEMORY[0x1F41846D8]();
}

uint64_t sub_1C3DBA958()
{
  return MEMORY[0x1F41846E8]();
}

uint64_t sub_1C3DBA968()
{
  return MEMORY[0x1F4184730]();
}

uint64_t sub_1C3DBA978()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1C3DBA988()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1C3DBA998()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1C3DBA9A8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C3DBA9B8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C3DBA9C8()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1C3DBA9D8()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C3DBA9E8()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1C3DBA9F8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1C3DBAA08()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1C3DBAA18()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1C3DBAA28()
{
  return MEMORY[0x1F40E6CB8]();
}

uint64_t sub_1C3DBAA38()
{
  return MEMORY[0x1F40E6CC8]();
}

uint64_t sub_1C3DBAA48()
{
  return MEMORY[0x1F40E6D40]();
}

uint64_t sub_1C3DBAA58()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1C3DBAA68()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C3DBAA78()
{
  return MEMORY[0x1F4184988]();
}

uint64_t sub_1C3DBAA88()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1C3DBAA98()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1C3DBAAA8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C3DBAAB8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C3DBAAC8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C3DBAAD8()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1C3DBAAE8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C3DBAAF8()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1C3DBAB08()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1C3DBAB18()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1C3DBAB28()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1C3DBAB38()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C3DBAB48()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C3DBAB58()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1C3DBAB78()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C3DBAB88()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C3DBAB98()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1C3DBABA8()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1C3DBABB8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C3DBABC8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C3DBABD8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C3DBABE8()
{
  return MEMORY[0x1F4184C88]();
}

uint64_t sub_1C3DBABF8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C3DBAC08()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C3DBAC18()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C3DBAC28()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C3DBAC38()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1C3DBAC48()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1C3DBAC58()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1C3DBAC68()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C3DBAC78()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C3DBAC88()
{
  return MEMORY[0x1F4184CF8]();
}

uint64_t sub_1C3DBAC98()
{
  return MEMORY[0x1F4184D00]();
}

uint64_t sub_1C3DBACA8()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t sub_1C3DBACB8()
{
  return MEMORY[0x1F4184D10]();
}

uint64_t sub_1C3DBACC8()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1C3DBACD8()
{
  return MEMORY[0x1F4184D40]();
}

uint64_t sub_1C3DBACE8()
{
  return MEMORY[0x1F4184D48]();
}

uint64_t sub_1C3DBACF8()
{
  return MEMORY[0x1F4184D50]();
}

uint64_t sub_1C3DBAD08()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1C3DBAD18()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C3DBAD28()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C3DBAD38()
{
  return MEMORY[0x1F4184DB8]();
}

uint64_t sub_1C3DBAD48()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C3DBAD58()
{
  return MEMORY[0x1F4184DD8]();
}

uint64_t sub_1C3DBAD68()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1C3DBAD78()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C3DBAD88()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1C3DBAD98()
{
  return MEMORY[0x1F4184E10]();
}

uint64_t sub_1C3DBADA8()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1C3DBADB8()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1C3DBADC8()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1C3DBADD8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C3DBADE8()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1C3DBADF8()
{
  return MEMORY[0x1F4184E88]();
}

uint64_t sub_1C3DBAE08()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1C3DBAE18()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C3DBAE28()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C3DBAE38()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C3DBAE48()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C3DBAE58()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C3DBAE68()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C3DBAE78()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C3DBAE88()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C3DBAE98()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C3DBAEA8()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1C3DBAEB8()
{
  return MEMORY[0x1F4185030]();
}

uint64_t sub_1C3DBAEC8()
{
  return MEMORY[0x1F4185038]();
}

uint64_t sub_1C3DBAED8()
{
  return MEMORY[0x1F4185040]();
}

uint64_t sub_1C3DBAEE8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C3DBAEF8()
{
  return MEMORY[0x1F4188000]();
}

uint64_t sub_1C3DBAF08()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1C3DBAF18()
{
  return MEMORY[0x1F41850A0]();
}

uint64_t sub_1C3DBAF28()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1C3DBAF38()
{
  return MEMORY[0x1F4185180]();
}

uint64_t sub_1C3DBAF48()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C3DBAF58()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C3DBAF68()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1C3DBAF78()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1C3DBAF88()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1C3DBAF98()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1C3DBAFA8()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1C3DBAFB8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C3DBAFC8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C3DBAFD8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C3DBAFE8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C3DBAFF8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C3DBB008()
{
  return MEMORY[0x1F4188038]();
}

uint64_t sub_1C3DBB018()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1C3DBB038()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C3DBB048()
{
  return MEMORY[0x1F41854D0]();
}

uint64_t sub_1C3DBB058()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C3DBB068()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C3DBB078()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1C3DBB088()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1C3DBB098()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1C3DBB0A8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C3DBB0B8()
{
  return MEMORY[0x1F4185530]();
}

uint64_t sub_1C3DBB0C8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C3DBB0D8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C3DBB0E8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C3DBB0F8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1C3DBB108()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C3DBB118()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C3DBB128()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1C3DBB138()
{
  return MEMORY[0x1F41855F8]();
}

uint64_t sub_1C3DBB148()
{
  return MEMORY[0x1F4185600]();
}

uint64_t sub_1C3DBB158()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C3DBB168()
{
  return MEMORY[0x1F4185610]();
}

uint64_t sub_1C3DBB178()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1C3DBB188()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1C3DBB198()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1C3DBB1A8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C3DBB1B8()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C3DBB1C8()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C3DBB1D8()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1C3DBB1E8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C3DBB1F8()
{
  return MEMORY[0x1F41856D0]();
}

uint64_t sub_1C3DBB208()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1C3DBB218()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1C3DBB228()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C3DBB238()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1C3DBB248()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C3DBB258()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C3DBB268()
{
  return MEMORY[0x1F41857B8]();
}

uint64_t sub_1C3DBB278()
{
  return MEMORY[0x1F41857C0]();
}

uint64_t sub_1C3DBB288()
{
  return MEMORY[0x1F41857F0]();
}

uint64_t sub_1C3DBB298()
{
  return MEMORY[0x1F4185818]();
}

uint64_t sub_1C3DBB2A8()
{
  return MEMORY[0x1F4185828]();
}

uint64_t sub_1C3DBB2B8()
{
  return MEMORY[0x1F4185830]();
}

uint64_t sub_1C3DBB2C8()
{
  return MEMORY[0x1F4185838]();
}

uint64_t sub_1C3DBB2D8()
{
  return MEMORY[0x1F4185840]();
}

uint64_t sub_1C3DBB2E8()
{
  return MEMORY[0x1F4185848]();
}

uint64_t sub_1C3DBB2F8()
{
  return MEMORY[0x1F4185850]();
}

uint64_t sub_1C3DBB308()
{
  return MEMORY[0x1F4185858]();
}

uint64_t sub_1C3DBB318()
{
  return MEMORY[0x1F4185860]();
}

uint64_t sub_1C3DBB328()
{
  return MEMORY[0x1F4185868]();
}

uint64_t sub_1C3DBB338()
{
  return MEMORY[0x1F4185870]();
}

uint64_t sub_1C3DBB348()
{
  return MEMORY[0x1F41858B0]();
}

uint64_t sub_1C3DBB358()
{
  return MEMORY[0x1F41858D8]();
}

uint64_t sub_1C3DBB368()
{
  return MEMORY[0x1F4185900]();
}

uint64_t sub_1C3DBB378()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1C3DBB388()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1C3DBB398()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1C3DBB3A8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C3DBB3B8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C3DBB3D8()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1C3DBB3E8()
{
  return MEMORY[0x1F4185AC8]();
}

uint64_t sub_1C3DBB3F8()
{
  return MEMORY[0x1F4185AD0]();
}

uint64_t sub_1C3DBB408()
{
  return MEMORY[0x1F4185B40]();
}

uint64_t sub_1C3DBB418()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1C3DBB428()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C3DBB448()
{
  return MEMORY[0x1F4185BE8]();
}

uint64_t sub_1C3DBB458()
{
  return MEMORY[0x1F4185BF0]();
}

uint64_t sub_1C3DBB468()
{
  return MEMORY[0x1F4185BF8]();
}

uint64_t sub_1C3DBB478()
{
  return MEMORY[0x1F4185C00]();
}

uint64_t sub_1C3DBB488()
{
  return MEMORY[0x1F4185C08]();
}

uint64_t sub_1C3DBB498()
{
  return MEMORY[0x1F4185C10]();
}

uint64_t sub_1C3DBB4A8()
{
  return MEMORY[0x1F4185C18]();
}

uint64_t sub_1C3DBB4B8()
{
  return MEMORY[0x1F4185C20]();
}

uint64_t sub_1C3DBB4C8()
{
  return MEMORY[0x1F4185C28]();
}

uint64_t sub_1C3DBB4D8()
{
  return MEMORY[0x1F4185C30]();
}

uint64_t sub_1C3DBB4F8()
{
  return MEMORY[0x1F4185D38]();
}

uint64_t sub_1C3DBB508()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1C3DBB518()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1C3DBB528()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C3DBB538()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C3DBB568()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C3DBB578()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C3DBB588()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C3DBB598()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C3DBB5A8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C3DBB5B8()
{
  return MEMORY[0x1F40E6E40]();
}

uint64_t sub_1C3DBB5C8()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C3DBB5D8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C3DBB5E8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C3DBB5F8()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C3DBB608()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C3DBB618()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1C3DBB628()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1C3DBB638()
{
  return MEMORY[0x1F4185F30]();
}

uint64_t sub_1C3DBB648()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1C3DBB658()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1C3DBB668()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1C3DBB678()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1C3DBB688()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1C3DBB698()
{
  return MEMORY[0x1F4185FA0]();
}

uint64_t sub_1C3DBB6A8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1C3DBB6B8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C3DBB6C8()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1C3DBB6D8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C3DBB6E8()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1C3DBB6F8()
{
  return MEMORY[0x1F40E6F00]();
}

uint64_t sub_1C3DBB708()
{
  return MEMORY[0x1F40E6F10]();
}

uint64_t sub_1C3DBB718()
{
  return MEMORY[0x1F40E6F18]();
}

uint64_t sub_1C3DBB728()
{
  return MEMORY[0x1F40E6F20]();
}

uint64_t sub_1C3DBB738()
{
  return MEMORY[0x1F40E6FD0]();
}

uint64_t sub_1C3DBB748()
{
  return MEMORY[0x1F4186130]();
}

uint64_t sub_1C3DBB758()
{
  return MEMORY[0x1F4186288]();
}

uint64_t sub_1C3DBB768()
{
  return MEMORY[0x1F4186290]();
}

uint64_t sub_1C3DBB798()
{
  return MEMORY[0x1F4186318]();
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B5A0](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFormatGetPropertyInfo(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *outPropertyDataSize)
{
  return MEMORY[0x1F410B5A8](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, outPropertyDataSize);
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1F40C94F8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1F40C9500]();
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1F40C9648](*(void *)&algorithm, password, passwordLen, salt, saltLen, *(void *)&prf, *(void *)&rounds, derivedKey);
}

int CCSymmetricKeyUnwrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *wrappedKey, size_t wrappedKeyLen, uint8_t *rawKey, size_t *rawKeyLen)
{
  return MEMORY[0x1F40C96D0](*(void *)&algorithm, iv, ivLen, kek, kekLen, wrappedKey, wrappedKeyLen, rawKey);
}

int CCSymmetricKeyWrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *rawKey, size_t rawKeyLen, uint8_t *wrappedKey, size_t *wrappedKeyLen)
{
  return MEMORY[0x1F40C96D8](*(void *)&algorithm, iv, ivLen, kek, kekLen, rawKey, rawKeyLen, wrappedKey);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x1F40D9EC0]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2C0](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x1F40DAB78](array);
}

BOOL CGPDFArrayGetString(CGPDFArrayRef array, size_t index, CGPDFStringRef *value)
{
  return MEMORY[0x1F40DABA0](array, index, value);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC0](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC8](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x1F40DABE8](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x1F40DAC18](dict, key, value);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x1F40DAC80](document);
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DACA0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

uint64_t CGPDFPageCopyString()
{
  return MEMORY[0x1F40DAD70]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x1F40DAF58](string);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x1F40D62F0]();
}

uint64_t CKOperationGroupTransferSizeForBytes()
{
  return MEMORY[0x1F40D63F0]();
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x1F40D6490]();
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DB8E8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DBD88](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, blockBufferOut);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t ICCGColorEquivalentToColor()
{
  return MEMORY[0x1F4139C28]();
}

uint64_t ICCheckedDynamicCast()
{
  return MEMORY[0x1F4139C30]();
}

uint64_t ICCheckedProtocolCast()
{
  return MEMORY[0x1F4139C38]();
}

uint64_t ICDataStoreServiceBundleIdentifier()
{
  return MEMORY[0x1F4139C50]();
}

uint64_t ICDynamicCast()
{
  return MEMORY[0x1F4139C60]();
}

uint64_t ICEditorExtensionBundleIdentifier()
{
  return MEMORY[0x1F4139C68]();
}

uint64_t ICGenericError()
{
  return MEMORY[0x1F4139C70]();
}

uint64_t ICGroupContainerIdentifier()
{
  return MEMORY[0x1F4139C78]();
}

uint64_t ICIntentsExtensionBundleIdentifier()
{
  return MEMORY[0x1F4139C80]();
}

uint64_t ICInternalSettingsDisableGASRAvailabilityCheck()
{
  return MEMORY[0x1F4139C90]();
}

uint64_t ICInternalSettingsGetBundleBoolSettingValue()
{
  return MEMORY[0x1F4139C98]();
}

uint64_t ICInternalSettingsIsAudioMastihaEnabled()
{
  return MEMORY[0x1F4139CB0]();
}

uint64_t ICInternalSettingsIsCollapsibleSectionsEnabled()
{
  return MEMORY[0x1F4139CC8]();
}

uint64_t ICInternalSettingsIsLockedNotesV1NeoEnabled()
{
  return MEMORY[0x1F4139CE0]();
}

uint64_t ICInternalSettingsIsOnenessUnlockEnabled()
{
  return MEMORY[0x1F4139D00]();
}

uint64_t ICInternalSettingsIsPDFsInNotesEnabled()
{
  return MEMORY[0x1F4139D08]();
}

uint64_t ICInternalSettingsIsTracingEnabled()
{
  return MEMORY[0x1F4139D30]();
}

uint64_t ICInternalSettingsShouldDisableTranscriptPostProcessing()
{
  return MEMORY[0x1F4139D38]();
}

uint64_t ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs()
{
  return MEMORY[0x1F4139D40]();
}

uint64_t ICIsSandboxModeEnabled()
{
  return MEMORY[0x1F4139D48]();
}

uint64_t ICKeyPathFromSelector()
{
  return MEMORY[0x1F4139D58]();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return MEMORY[0x1F4139D68]();
}

uint64_t ICProtocolCast()
{
  return MEMORY[0x1F4139D78]();
}

uint64_t ICSettingsBundleID()
{
  return MEMORY[0x1F4139D88]();
}

uint64_t ICSharedFrameworkBundleIdentifier()
{
  return MEMORY[0x1F4139D90]();
}

uint64_t ICSharingExtensionBundleIdentifier()
{
  return MEMORY[0x1F4139D98]();
}

uint64_t ICTestHostBundleIdentifier()
{
  return MEMORY[0x1F4139DB0]();
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  return MEMORY[0x1F4139DC0]();
}

uint64_t ICVerboseSearchLogging()
{
  return MEMORY[0x1F4139DC8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromNotesVersion()
{
  return MEMORY[0x1F4139DD0]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t TSDRectIsFinite()
{
  return MEMORY[0x1F4139DE8]();
}

uint64_t TSUDeviceRGBColorSpace()
{
  return MEMORY[0x1F4139E20]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5E0](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1F41863A0]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

uint64_t dispatchMainAfterDelay()
{
  return MEMORY[0x1F4139E28]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t performBlockOnMainThread()
{
  return MEMORY[0x1F4139E30]();
}

uint64_t performBlockOnMainThreadAndWait()
{
  return MEMORY[0x1F4139E38]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int sched_yield(void)
{
  return MEMORY[0x1F40CDEC8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1F40CDF60](__name, __value, *(void *)&__overwrite);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1F4186480]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x1F4186558]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}