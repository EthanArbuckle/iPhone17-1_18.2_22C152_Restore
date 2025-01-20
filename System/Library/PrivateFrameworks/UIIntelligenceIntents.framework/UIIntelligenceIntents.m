ValueMetadata *type metadata accessor for InsertTextBridge_UIKit()
{
  return &type metadata for InsertTextBridge_UIKit;
}

uint64_t sub_260435BCC(uint64_t a1, uint64_t a2)
{
  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A86E0D8 + dword_26A86E0D8);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_260435C80;
  return v7(a1, a2);
}

uint64_t sub_260435C80()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_260435D74(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_260435D94, 0, 0);
}

uint64_t sub_260435D94()
{
  sub_26044B7A0();
  *(void *)(v0 + 32) = sub_26044B790();
  uint64_t v2 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_260435E28, v2, v1);
}

id sub_260435E28()
{
  swift_release();
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(result, sel_inputDelegate);

    if (v3)
    {
      uint64_t v4 = (void *)sub_26044B740();
      objc_msgSend(v3, sel_insertText_, v4);
    }
    else
    {
      sub_260435F44();
      swift_allocError();
      unsigned char *v6 = 1;
      swift_willThrow();
    }
    v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_260435F44()
{
  unint64_t result = qword_26A86E0E0;
  if (!qword_26A86E0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E0E0);
  }
  return result;
}

uint64_t sub_260435F98()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WritingTools_UIKit()
{
  return self;
}

unint64_t sub_260435FF8()
{
  unint64_t result = qword_26A86E0E8;
  if (!qword_26A86E0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E0E8);
  }
  return result;
}

uint64_t sub_26043604C()
{
  uint64_t v0 = sub_26044B480();
  __swift_allocate_value_buffer(v0, qword_26A86E740);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E740);
  return sub_26044B470();
}

unint64_t sub_2604360B8()
{
  unint64_t result = qword_26A86E0F0;
  if (!qword_26A86E0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E0F0);
  }
  return result;
}

unint64_t sub_260436110()
{
  unint64_t result = qword_26A86E0F8;
  if (!qword_26A86E0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E0F8);
  }
  return result;
}

unint64_t sub_260436168()
{
  unint64_t result = qword_26A86E100;
  if (!qword_26A86E100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E100);
  }
  return result;
}

uint64_t sub_2604361BC()
{
  return sub_260436588(&qword_26A86E108, &qword_26A86E110);
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

uint64_t sub_260436240()
{
  return MEMORY[0x263EFBFD0];
}

uint64_t sub_26043624C(uint64_t a1)
{
  unint64_t v2 = sub_26043697C();
  return MEMORY[0x270EE09F0](a1, v2);
}

unint64_t sub_26043629C()
{
  unint64_t result = qword_26A86E118;
  if (!qword_26A86E118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E118);
  }
  return result;
}

unint64_t sub_2604362F4()
{
  unint64_t result = qword_26A86E120;
  if (!qword_26A86E120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E120);
  }
  return result;
}

unint64_t sub_26043634C()
{
  unint64_t result = qword_26A86E128;
  if (!qword_26A86E128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E128);
  }
  return result;
}

unint64_t sub_2604363A4()
{
  unint64_t result = qword_26A86E130;
  if (!qword_26A86E130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E130);
  }
  return result;
}

unint64_t sub_2604363FC()
{
  unint64_t result = qword_26A86E138;
  if (!qword_26A86E138)
  {
    sub_26044B4D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E138);
  }
  return result;
}

uint64_t sub_260436454(uint64_t a1)
{
  unint64_t v2 = sub_26043697C();
  return MEMORY[0x270EE0A00](a1, v2);
}

uint64_t sub_2604364A4@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B480();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E740);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_26043654C()
{
  return sub_260436588(&qword_26A86E140, &qword_26A86E148);
}

uint64_t sub_260436588(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2604365CC(uint64_t a1)
{
  unint64_t v2 = sub_260435FF8();
  return MEMORY[0x270EE0C68](a1, v2);
}

unint64_t sub_26043661C()
{
  unint64_t result = qword_26A86E150;
  if (!qword_26A86E150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E150);
  }
  return result;
}

uint64_t sub_260436670()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E158);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_26044B4C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  sub_26044B4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = sub_26044B390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  return sub_26044B3A0();
}

uint64_t sub_260436840(uint64_t a1)
{
  unint64_t v2 = sub_2604363A4();
  return MEMORY[0x270EE1D98](a1, v2);
}

ValueMetadata *type metadata accessor for RunIntelligenceCommandResultEntity()
{
  return &type metadata for RunIntelligenceCommandResultEntity;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_26043697C()
{
  unint64_t result = qword_26A86E168;
  if (!qword_26A86E168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E168);
  }
  return result;
}

uint64_t sub_2604369D0()
{
  return sub_260437280(&qword_26A86E170, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntityID);
}

uint64_t type metadata accessor for IntelligenceCommandEntityID()
{
  uint64_t result = qword_26A86E178;
  if (!qword_26A86E178) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260436A64()
{
  return sub_26044B8A0();
}

uint64_t sub_260436AEC()
{
  sub_26044B4F0();
  sub_260437280(&qword_26A86E198, MEMORY[0x263F81950]);
  return sub_26044B6C0();
}

uint64_t sub_260436B70()
{
  return sub_26044B8A0();
}

uint64_t sub_260436BF4()
{
  sub_26044B4F0();
  sub_260437280(&qword_26A86E190, MEMORY[0x263F81950]);
  return sub_26044B810();
}

uint64_t sub_260436C68@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E188);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_26044B4F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_26044B500();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_260437220((uint64_t)v5);
    uint64_t v10 = 1;
  }
  else
  {
    v11 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v11(v9, v5, v6);
    v11(a2, v9, v6);
    uint64_t v10 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, v10, 1, a1);
}

uint64_t sub_260436E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_260436E9C(uint64_t a1)
{
  uint64_t v2 = sub_26044B4F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_260436F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_260436F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_260436FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_26043702C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_260437090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2604370A4);
}

uint64_t sub_2604370A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_260437110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260437124);
}

uint64_t sub_260437124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_260437194()
{
  uint64_t result = sub_26044B4F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_260437220(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_260437280(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2604372CC()
{
  unint64_t result = qword_26A86E1A0;
  if (!qword_26A86E1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E1A0);
  }
  return result;
}

unint64_t sub_260437324()
{
  unint64_t result = qword_26A86E1A8;
  if (!qword_26A86E1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E1A8);
  }
  return result;
}

uint64_t sub_260437378()
{
  return sub_260437924(qword_26A86E1B0);
}

uint64_t sub_2604373AC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2604373CC, 0, 0);
}

uint64_t sub_2604373CC()
{
  if (qword_26A86E0A0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_260437498;
  uint64_t v2 = *(void *)(v0 + 16);
  return sub_260443390(v2);
}

uint64_t sub_260437498(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_260437598(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2604375B8, 0, 0);
}

uint64_t sub_2604375B8()
{
  **(void **)(v0 + 16) = MEMORY[0x263F8EE78];
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2604375E4()
{
  unint64_t result = qword_26A86E1C8;
  if (!qword_26A86E1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E1C8);
  }
  return result;
}

uint64_t sub_260437638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_26043765C, 0, 0);
}

uint64_t sub_26043765C()
{
  if (qword_26A86E0A0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_260437728;
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  return sub_260443E50(v3, v2);
}

uint64_t sub_260437728(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    return MEMORY[0x270FA2498](sub_260437874, 0, 0);
  }
}

uint64_t sub_260437874()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 48);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_26043789C()
{
  unint64_t result = qword_26A86E1D8;
  if (!qword_26A86E1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E1D8);
  }
  return result;
}

uint64_t sub_2604378F0()
{
  return sub_260437924((unint64_t *)&qword_26A86E1E0);
}

uint64_t sub_260437924(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for IntelligenceCommandEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_26043796C()
{
  unint64_t result = qword_26A86E1E8;
  if (!qword_26A86E1E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A86E1F0);
    sub_260437924((unint64_t *)&qword_26A86E1E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E1E8);
  }
  return result;
}

uint64_t sub_2604379FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_2604375E4();
  void *v5 = v2;
  v5[1] = sub_260435C80;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_260437AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_260435C80;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

ValueMetadata *type metadata accessor for IntelligenceCommandQuery()
{
  return &type metadata for IntelligenceCommandQuery;
}

unint64_t sub_260437B7C()
{
  unint64_t result = qword_26A86E208;
  if (!qword_26A86E208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E208);
  }
  return result;
}

uint64_t sub_260437BD0()
{
  uint64_t v0 = sub_26044B4C0();
  __swift_allocate_value_buffer(v0, qword_26A86E758);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E758);
  return sub_26044B4A0();
}

uint64_t sub_260437C34()
{
  return sub_26044B220();
}

uint64_t sub_260437C58()
{
  return sub_26044B220();
}

uint64_t sub_260437C7C()
{
  return sub_26044B220();
}

uint64_t sub_260437CA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v13 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = sub_26044B4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  sub_26044B4A0();
  sub_26044B4A0();
  v12 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v12(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E298);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_26044C170;
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  v12(v4, 0, 1, v7);
  uint64_t v9 = v13;
  sub_26044B370();
  uint64_t v10 = sub_26044B360();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
}

uint64_t sub_260437FC4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2A0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2A8);
  MEMORY[0x270FA5388](v1);
  sub_2604398F0();
  sub_26044B420();
  sub_26044B410();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2B0);
  sub_26044B400();
  swift_release();
  sub_26044B410();
  swift_getKeyPath();
  sub_26044B400();
  swift_release();
  sub_26044B410();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2B8);
  sub_26044B400();
  swift_release();
  sub_26044B410();
  sub_26044B430();
  return sub_26044B3F0();
}

uint64_t sub_2604381D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a3;
  v4[18] = a4;
  v4[16] = a1;
  uint64_t v5 = type metadata accessor for IntelligenceCommandEntity();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E188);
  v4[22] = swift_task_alloc();
  uint64_t v6 = sub_26044B4F0();
  v4[23] = v6;
  v4[24] = *(void *)(v6 - 8);
  v4[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E278);
  v4[26] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for IntelligenceCommandEntityID();
  v4[27] = v7;
  v4[28] = *(void *)(v7 - 8);
  v4[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E280);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_26043840C, 0, 0);
}

uint64_t sub_26043840C()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  *(void *)(v0 + 272) = v4;
  *(void *)(v0 + 280) = (v3 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v4(v1, 1, 1, v2);
  sub_26044B200();
  if (*(void *)(v0 + 104))
  {
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 192);
    uint64_t v7 = *(void *)(v0 + 176);
    swift_bridgeObjectRetain();
    sub_26044B500();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5) == 1)
    {
      sub_26043A578(*(void *)(v0 + 176), &qword_26A86E188);
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 200);
      uint64_t v13 = *(void *)(v0 + 208);
      uint64_t v15 = *(void *)(v0 + 184);
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 192) + 32);
      v16(v14, *(void *)(v0 + 176), v15);
      v16(v13, v14, v15);
      uint64_t v8 = 0;
    }
    v18 = (uint64_t *)(v0 + 208);
    uint64_t v17 = *(void *)(v0 + 208);
    uint64_t v19 = *(void *)(v0 + 216);
    uint64_t v20 = *(void *)(v0 + 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v17, v8, 1, v19);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19) == 1)
    {
      v21 = &qword_26A86E278;
LABEL_13:
      uint64_t v22 = *(void *)(v0 + 264);
      sub_26043A578(*v18, v21);
      sub_26043A3C8();
      swift_allocError();
      unsigned char *v23 = 2;
      swift_willThrow();
      sub_26043A578(v22, &qword_26A86E280);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v24 = *(uint64_t (**)(void))(v0 + 8);
      return v24();
    }
    sub_26043A5D4(*(void *)(v0 + 208), *(void *)(v0 + 232), (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntityID);
    if (qword_26A86E0A0 != -1) {
      swift_once();
    }
    uint64_t v26 = *(void *)(v0 + 224);
    uint64_t v25 = *(void *)(v0 + 232);
    sub_26043A41C((uint64_t)&unk_26A86E810, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E290);
    int v27 = *(_DWORD *)(v26 + 80);
    *(_DWORD *)(v0 + 368) = v27;
    unint64_t v28 = (v27 + 32) & ~(unint64_t)v27;
    uint64_t v29 = swift_allocObject();
    *(void *)(v0 + 288) = v29;
    *(_OWORD *)(v29 + 16) = xmmword_26044C180;
    sub_26043A63C(v25, v29 + v28, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntityID);
    v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v30;
    void *v30 = v0;
    v30[1] = sub_260438A1C;
    return sub_260443390(v29);
  }
  else
  {
    sub_26044B200();
    uint64_t v10 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 120);
    *(void *)(v0 + 320) = v9;
    if (v9)
    {
      if (qword_26A86E0A0 != -1) {
        swift_once();
      }
      v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 328) = v11;
      void *v11 = v0;
      v11[1] = sub_260438F10;
      return sub_260443E50(v10, v9);
    }
    else
    {
      v18 = (uint64_t *)(v0 + 240);
      uint64_t v31 = *(void *)(v0 + 240);
      uint64_t v32 = *(void *)(v0 + 152);
      uint64_t v33 = *(void *)(v0 + 160);
      sub_26043A360(*(void *)(v0 + 264), v31);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1)
      {
        v21 = &qword_26A86E280;
        goto LABEL_13;
      }
      sub_26043A5D4(*(void *)(v0 + 240), *(void *)(v0 + 168), (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
      if (qword_26A86E0A0 != -1) {
        swift_once();
      }
      uint64_t v34 = *(void *)(v0 + 168);
      uint64_t v35 = *(void *)(v0 + 152);
      sub_26043A41C((uint64_t)&unk_26A86E810, v0 + 16);
      uint64_t v36 = v34 + *(int *)(v35 + 44);
      uint64_t v37 = *(void *)(v0 + 40);
      uint64_t v38 = *(void *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v37);
      v40 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 + 8) + **(int **)(v38 + 8));
      v39 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v39;
      void *v39 = v0;
      v39[1] = sub_26043938C;
      return v40(v36, v37, v38);
    }
  }
}

uint64_t sub_260438A1C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 304) = a1;
  *(void *)(v3 + 312) = v1;
  swift_task_dealloc();
  sub_26043A4BC(v3 + 56);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  if (v1) {
    uint64_t v4 = sub_2604396DC;
  }
  else {
    uint64_t v4 = sub_260438BB4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_260438BB4()
{
  uint64_t v1 = *(void *)(v0 + 304);
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(v0 + 160) + 80);
    sub_26043A63C(v1 + ((v2 + 32) & ~v2), *(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v4 = *(void *)(v0 + 232);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 272))(*(void *)(v0 + 256), v3, 1, *(void *)(v0 + 152));
  swift_bridgeObjectRelease();
  sub_26043A6A4(v4, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntityID);
  uint64_t v6 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 264);
  sub_26043A578(v5, &qword_26A86E280);
  sub_26043A510(v6, v5);
  uint64_t v7 = *(void *)(v0 + 240);
  uint64_t v8 = *(void *)(v0 + 152);
  uint64_t v9 = *(void *)(v0 + 160);
  sub_26043A360(*(void *)(v0 + 264), v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 264);
    sub_26043A578(*(void *)(v0 + 240), &qword_26A86E280);
    sub_26043A3C8();
    swift_allocError();
    unsigned char *v11 = 2;
    swift_willThrow();
    sub_26043A578(v10, &qword_26A86E280);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
  else
  {
    sub_26043A5D4(*(void *)(v0 + 240), *(void *)(v0 + 168), (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
    if (qword_26A86E0A0 != -1) {
      swift_once();
    }
    uint64_t v14 = *(void *)(v0 + 168);
    uint64_t v15 = *(void *)(v0 + 152);
    sub_26043A41C((uint64_t)&unk_26A86E810, v0 + 16);
    uint64_t v16 = v14 + *(int *)(v15 + 44);
    uint64_t v17 = *(void *)(v0 + 40);
    uint64_t v18 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v17);
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 + 8) + **(int **)(v18 + 8));
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 352) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_26043938C;
    return v20(v16, v17, v18);
  }
}

uint64_t sub_260438F10(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 336) = a1;
  *(void *)(v3 + 344) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_2604397E0;
  }
  else {
    uint64_t v4 = sub_26043904C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_26043904C()
{
  uint64_t v1 = *(void *)(v0 + 336);
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(v0 + 160) + 80);
    sub_26043A63C(v1 + ((v2 + 32) & ~v2), *(void *)(v0 + 248), (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 272))(*(void *)(v0 + 248), v3, 1, *(void *)(v0 + 152));
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 248);
  uint64_t v5 = *(void *)(v0 + 264);
  sub_26043A578(v5, &qword_26A86E280);
  sub_26043A510(v4, v5);
  uint64_t v6 = *(void *)(v0 + 240);
  uint64_t v7 = *(void *)(v0 + 152);
  uint64_t v8 = *(void *)(v0 + 160);
  sub_26043A360(*(void *)(v0 + 264), v6);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t v9 = *(void *)(v0 + 264);
    sub_26043A578(*(void *)(v0 + 240), &qword_26A86E280);
    sub_26043A3C8();
    swift_allocError();
    *uint64_t v10 = 2;
    swift_willThrow();
    sub_26043A578(v9, &qword_26A86E280);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    sub_26043A5D4(*(void *)(v0 + 240), *(void *)(v0 + 168), (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
    if (qword_26A86E0A0 != -1) {
      swift_once();
    }
    uint64_t v13 = *(void *)(v0 + 168);
    uint64_t v14 = *(void *)(v0 + 152);
    sub_26043A41C((uint64_t)&unk_26A86E810, v0 + 16);
    uint64_t v15 = v13 + *(int *)(v14 + 44);
    uint64_t v16 = *(void *)(v0 + 40);
    uint64_t v17 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v16);
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 + 8) + **(int **)(v17 + 8));
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 352) = v18;
    void *v18 = v0;
    v18[1] = sub_26043938C;
    return v19(v15, v16, v17);
  }
}

uint64_t sub_26043938C()
{
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2604395CC;
  }
  else {
    uint64_t v2 = sub_2604394A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2604394A0()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[21];
  sub_26043A4BC((uint64_t)(v0 + 2));
  sub_26043634C();
  sub_26044B190();
  sub_26043A6A4(v2, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
  sub_26043A578(v1, &qword_26A86E280);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2604395CC()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[21];
  sub_26043A4BC((uint64_t)(v0 + 2));
  sub_26043A6A4(v2, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
  sub_26043A578(v1, &qword_26A86E280);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2604396DC()
{
  uint64_t v1 = v0[33];
  sub_26043A6A4(v0[29], (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntityID);
  sub_26043A578(v1, &qword_26A86E280);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_2604397E0()
{
  sub_26043A578(*(void *)(v0 + 264), &qword_26A86E280);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2604398C4()
{
  return sub_26044B200();
}

unint64_t sub_2604398F0()
{
  unint64_t result = qword_26A86E210;
  if (!qword_26A86E210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E210);
  }
  return result;
}

unint64_t sub_260439948()
{
  unint64_t result = qword_26A86E218;
  if (!qword_26A86E218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E218);
  }
  return result;
}

unint64_t sub_2604399A0()
{
  unint64_t result = qword_26A86E220;
  if (!qword_26A86E220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E220);
  }
  return result;
}

uint64_t sub_2604399F4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_260439A28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_260439A44@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E068 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B4C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E758);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_260439B00(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_260435C80;
  return sub_2604381D8(a1, v6, v5, v4);
}

uint64_t sub_260439BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_260439E98();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_260439BD8(uint64_t a1)
{
  unint64_t v2 = sub_2604398F0();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t destroy for RunIntelligenceCommandForKey()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s21UIIntelligenceIntents28RunIntelligenceCommandForKeyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  return a1;
}

void *assignWithCopy for RunIntelligenceCommandForKey(void *a1, void *a2)
{
  *a1 = *a2;
  sub_26044B280();
  swift_release();
  a1[1] = a2[1];
  sub_26044B280();
  swift_release();
  a1[2] = a2[2];
  sub_26044B280();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RunIntelligenceCommandForKey(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RunIntelligenceCommandForKey(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RunIntelligenceCommandForKey(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RunIntelligenceCommandForKey()
{
  return &type metadata for RunIntelligenceCommandForKey;
}

uint64_t sub_260439E20()
{
  return sub_260436588(&qword_26A86E230, &qword_26A86E238);
}

uint64_t sub_260439E5C()
{
  return sub_260436588(&qword_26A86E240, &qword_26A86E248);
}

uint64_t sub_260439E98()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E250);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v31 = (char *)v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_26044B440();
  uint64_t v2 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v33 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26044B4C0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v25 = v10;
  v12(v9, 1, 1, v10);
  uint64_t v26 = v11 + 56;
  v24 = v12;
  uint64_t v32 = sub_26044B180();
  uint64_t v13 = *(void *)(v32 - 8);
  unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  uint64_t v29 = v13 + 56;
  v28(v6, 1, 1, v32);
  unsigned int v34 = *MEMORY[0x263EFBDC8];
  int v27 = *(void (**)(char *))(v2 + 104);
  uint64_t v35 = v2 + 104;
  uint64_t v14 = v36;
  v27(v33);
  uint64_t v30 = sub_26044B250();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E268);
  sub_26044B4A0();
  v12(v9, 1, 1, v10);
  uint64_t v15 = sub_26044B6F0();
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v16 = *(void *)(v15 - 8);
  v23[0] = *(void *)(v16 + 56);
  v23[1] = v16 + 56;
  uint64_t v17 = v31;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v23[0])(v31, 1, 1, v15);
  uint64_t v18 = v28;
  v28(v6, 1, 1, v32);
  uint64_t v19 = v33;
  uint64_t v20 = v14;
  uint64_t v21 = v27;
  ((void (*)(char *, void, uint64_t))v27)(v33, v34, v20);
  v23[2] = sub_26044B260();
  sub_26044B4A0();
  v24(v9, 1, 1, v25);
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v23[0])(v17, 1, 1, v15);
  v18(v6, 1, 1, v32);
  ((void (*)(char *, void, uint64_t))v21)(v19, v34, v36);
  sub_26044B260();
  return v30;
}

uint64_t sub_26043A360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_26043A3C8()
{
  unint64_t result = qword_26A86E288;
  if (!qword_26A86E288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E288);
  }
  return result;
}

uint64_t sub_26043A41C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_26043A4BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_26043A510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26043A578(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_26043A5D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_26043A63C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_26043A6A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_26043A704@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

uint64_t sub_26043A730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

uint64_t sub_26043A75C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

uint64_t sub_26043A788()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2F8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_26044B290();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E300);
  MEMORY[0x270FA5388](v8);
  sub_26043B19C();
  sub_26044B300();
  sub_26044B2F0();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263EFB9F0], v4);
  sub_26044B2D0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_26044B2F0();
  sub_26044B310();
  uint64_t v9 = sub_26044B2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E308);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_26044C180;
  *(void *)(v10 + 32) = v9;
  uint64_t v11 = sub_26044B2A0();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_26043AA38()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2D8);
  uint64_t v12 = *(void *)(v0 - 8);
  uint64_t v13 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_26044B290();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2E0);
  MEMORY[0x270FA5388](v7);
  sub_26043B1F0();
  sub_26044B300();
  sub_26044B2F0();
  swift_getKeyPath();
  sub_26043B2B8();
  sub_26044B280();
  swift_release();
  sub_26044B2E0();
  swift_release();
  sub_26044B2F0();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263EFB9F0], v3);
  sub_26044B2D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_26044B2F0();
  sub_26044B310();
  uint64_t v8 = sub_26044B2B0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2F0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_26044C180;
  *(void *)(v9 + 32) = v8;
  uint64_t v10 = sub_26044B2A0();
  swift_bridgeObjectRelease();
  return v10;
}

ValueMetadata *type metadata accessor for WritingToolsAssistantIntentsProvider()
{
  return &type metadata for WritingToolsAssistantIntentsProvider;
}

uint64_t sub_26043AD70()
{
  uint64_t v26 = sub_26044B440();
  uint64_t v0 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_26044B4C0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v25 = sub_26044B340();
  uint64_t v11 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  uint64_t v14 = sub_26044B180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263EFBDC8], v26);
  uint64_t v27 = sub_26044B250();
  sub_26043B19C();
  sub_26044B350();
  uint64_t v15 = sub_26044B330();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v17 = v25;
  v16(v13, v25);
  uint64_t v27 = sub_26044AAF4();
  uint64_t v28 = v18;
  uint64_t v29 = v19;
  sub_26043B1F0();
  sub_26044B350();
  uint64_t v20 = sub_26044B330();
  v16(v13, v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E2D0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_26044C390;
  *(void *)(v21 + 32) = v15;
  *(void *)(v21 + 40) = v20;
  uint64_t v22 = sub_26044B320();
  swift_bridgeObjectRelease();
  return v22;
}

unint64_t sub_26043B19C()
{
  unint64_t result = qword_26A86E2C0;
  if (!qword_26A86E2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E2C0);
  }
  return result;
}

unint64_t sub_26043B1F0()
{
  unint64_t result = qword_26A86E2C8;
  if (!qword_26A86E2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E2C8);
  }
  return result;
}

uint64_t sub_26043B244@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26044B200();
  *a1 = v3;
  return result;
}

uint64_t sub_26043B280()
{
  return sub_26044B210();
}

unint64_t sub_26043B2B8()
{
  unint64_t result = qword_26A86E2E8;
  if (!qword_26A86E2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E2E8);
  }
  return result;
}

unint64_t sub_26043B314()
{
  unint64_t result = qword_26A86E310;
  if (!qword_26A86E310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E310);
  }
  return result;
}

uint64_t sub_26043B368()
{
  uint64_t v0 = sub_26044B4C0();
  __swift_allocate_value_buffer(v0, qword_26A86E770);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E770);
  return sub_26044B4A0();
}

uint64_t sub_26043B3D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a1;
  v3[5] = a3;
  sub_26044B7A0();
  v3[6] = sub_26044B790();
  uint64_t v5 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_26043B468, v5, v4);
}

uint64_t sub_26043B468()
{
  swift_release();
  type metadata accessor for WritingTools_UIKit();
  uint64_t v1 = swift_allocObject();
  id v2 = objc_msgSend(self, sel_sharedApplication);
  id v3 = objc_msgSend(v2, sel__responderForKeyEvents);

  if (v3)
  {
    *(void *)(v1 + 16) = v3;
    if (objc_msgSend(v3, sel__supportsWritingTools))
    {
      sub_26044B200();
      uint64_t v4 = *(void *)(v0 + 24);
      id v5 = *(id *)(v1 + 16);
      uint64_t v6 = (void *)sub_26044B740();
      if (v4) {
        uint64_t v7 = (void *)sub_26044B740();
      }
      else {
        uint64_t v7 = 0;
      }
      objc_msgSend(v5, sel__startWritingToolsWithTool_prompt_sender_, v6, v7, 0);

      swift_bridgeObjectRelease();
      *(unsigned char *)(v0 + 16) = 0;
      sub_26043BFB0();
    }
    else
    {
      *(unsigned char *)(v0 + 16) = 1;
      sub_26043BFB0();
    }
    sub_26044B190();
    swift_release();
  }
  else
  {
    swift_deallocPartialClassInstance();
    *(unsigned char *)(v0 + 16) = 1;
    sub_26043BFB0();
    sub_26044B190();
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

unint64_t sub_26043B67C()
{
  unint64_t result = qword_26A86E318;
  if (!qword_26A86E318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E318);
  }
  return result;
}

unint64_t sub_26043B6D4()
{
  unint64_t result = qword_26A86E320;
  if (!qword_26A86E320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E320);
  }
  return result;
}

unint64_t sub_26043B72C()
{
  unint64_t result = qword_26A86E328;
  if (!qword_26A86E328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E328);
  }
  return result;
}

uint64_t sub_26043B780()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_26043B7B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_26043B804@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E070 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B4C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E770);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_26043B8B4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_260435C80;
  return sub_26043B3D0(a1, v5, v4);
}

uint64_t sub_26043B954@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26043BBD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_26043B97C(uint64_t a1)
{
  unint64_t v2 = sub_26043B67C();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t destroy for WritingToolsComposeIntent()
{
  swift_release();
  return swift_release();
}

void *_s21UIIntelligenceIntents25WritingToolsComposeIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_26044B280();
  sub_26044B280();
  return a1;
}

void *assignWithCopy for WritingToolsComposeIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_26044B280();
  swift_release();
  a1[1] = a2[1];
  sub_26044B280();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for WritingToolsComposeIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WritingToolsComposeIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WritingToolsComposeIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WritingToolsComposeIntent()
{
  return &type metadata for WritingToolsComposeIntent;
}

unint64_t sub_26043BB74()
{
  unint64_t result = qword_26A86E338;
  if (!qword_26A86E338)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A86E340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E338);
  }
  return result;
}

uint64_t sub_26043BBD0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E250);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v31 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_26044B440();
  uint64_t v2 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v29 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26044B4C0();
  uint64_t v23 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v12(v9, 1, 1, v10);
  uint64_t v13 = sub_26044B180();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v28 = v14 + 56;
  v27(v6, 1, 1, v13);
  unsigned int v26 = *MEMORY[0x263EFBDC8];
  uint64_t v15 = *(void (**)(void))(v2 + 104);
  uint64_t v24 = v2 + 104;
  uint64_t v25 = (void (*)(char *, void, uint64_t))v15;
  uint64_t v16 = v29;
  uint64_t v17 = v30;
  v15(v29);
  uint64_t v18 = v16;
  uint64_t v19 = sub_26044B250();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E268);
  sub_26044B4A0();
  v12(v9, 1, 1, v23);
  uint64_t v20 = sub_26044B6F0();
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v31, 1, 1, v20);
  v27(v6, 1, 1, v13);
  v25(v18, v26, v17);
  sub_26044B260();
  return v19;
}

unint64_t sub_26043BFB0()
{
  unint64_t result = qword_26A86E350;
  if (!qword_26A86E350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E350);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommandBridge_UIKit()
{
  return &type metadata for IntelligenceCommandBridge_UIKit;
}

uint64_t sub_26043C014(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_26A86E368 + dword_26A86E368);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_260435C80;
  return v5(a1);
}

uint64_t sub_26043C0BC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_26043C0DC, 0, 0);
}

uint64_t sub_26043C0DC()
{
  v0[3] = sub_26044B6A0();
  v0[4] = sub_26044B7A0();
  v0[5] = sub_26044B790();
  uint64_t v2 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_26043C180, v2, v1);
}

uint64_t sub_26043C180()
{
  swift_release();
  *(void *)(v0 + 48) = sub_26044B690();
  return MEMORY[0x270FA2498](sub_26043C1F4, 0, 0);
}

uint64_t sub_26043C1F4()
{
  *(void *)(v0 + 56) = sub_26044B790();
  uint64_t v2 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_26043C280, v2, v1);
}

uint64_t sub_26043C280()
{
  swift_release();
  uint64_t v1 = sub_26044B660();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_26043C300(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_26044B650();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  uint64_t v3 = sub_26044B670();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_26043C41C, 0, 0);
}

uint64_t sub_26043C41C()
{
  *(void *)(v0 + 80) = sub_26044B6A0();
  sub_26044B7A0();
  *(void *)(v0 + 88) = sub_26044B790();
  uint64_t v2 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_26043C4BC, v2, v1);
}

uint64_t sub_26043C4BC()
{
  swift_release();
  v0[12] = sub_26044B690();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[13] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_26043C56C;
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[3];
  return MEMORY[0x270F821A0](v2, v3);
}

uint64_t sub_26043C56C()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_26043C710;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_26043C688;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_26043C688()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_26043C710()
{
  uint64_t v1 = v0[14];
  swift_release();
  v0[2] = v1;
  MEMORY[0x261211260](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E370);
  if (swift_dynamicCast())
  {
    int v2 = (*(uint64_t (**)(void, void))(v0[5] + 88))(v0[6], v0[4]);
    if (v2 == *MEMORY[0x263F81F98])
    {
      MEMORY[0x261211250](v0[14]);
      sub_26043A3C8();
      swift_allocError();
      char v4 = 2;
LABEL_6:
      *uint64_t v3 = v4;
      swift_willThrow();
      MEMORY[0x261211250](v0[2]);
      goto LABEL_9;
    }
    if (v2 == *MEMORY[0x263F81F90])
    {
      MEMORY[0x261211250](v0[14]);
      sub_26043A3C8();
      swift_allocError();
      char v4 = 3;
      goto LABEL_6;
    }
    (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  }
  MEMORY[0x261211250](v0[2]);
  swift_willThrow();
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_26043C8B8()
{
  return sub_26043EB24(&qword_26A86E378, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t type metadata accessor for IntelligenceCommandEntity()
{
  uint64_t result = qword_26A86E3D0;
  if (!qword_26A86E3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26043C94C()
{
  return sub_26043EB24(&qword_26A86E380, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043C994()
{
  return sub_26043EB24(&qword_26A86E388, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043C9DC()
{
  return sub_26043EB24(&qword_26A86E390, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntityID);
}

uint64_t sub_26043CA24()
{
  uint64_t v0 = sub_26044B480();
  __swift_allocate_value_buffer(v0, qword_26A86E788);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E788);
  return sub_26044B470();
}

uint64_t sub_26043CA88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E158);
  MEMORY[0x270FA5388](v1 - 8);
  v46 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v3 - 8);
  v49 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_26044B4C0();
  uint64_t v5 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v6 = sub_26044B730();
  MEMORY[0x270FA5388](v6 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E428);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_26044C180;
  sub_26044B4F0();
  sub_26043EB24(&qword_26A86E190, MEMORY[0x263F81950]);
  *(void *)(v7 + 32) = sub_26044B810();
  *(void *)(v7 + 40) = v8;
  type metadata accessor for IntelligenceCommandEntity();
  sub_26044B1B0();
  unint64_t v9 = v51;
  if (v51)
  {
    uint64_t v10 = v50;
    uint64_t v11 = HIBYTE(v51) & 0xF;
    if ((v51 & 0x2000000000000000) == 0) {
      uint64_t v11 = v50 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      unint64_t v13 = *(void *)(v7 + 16);
      unint64_t v12 = *(void *)(v7 + 24);
      if (v13 >= v12 >> 1) {
        uint64_t v7 = (uint64_t)sub_26043EA1C((char *)(v12 > 1), v13 + 1, 1, (char *)v7);
      }
      *(void *)(v7 + 16) = v13 + 1;
      uint64_t v14 = v7 + 16 * v13;
      *(void *)(v14 + 32) = v10;
      *(void *)(v14 + 40) = v9;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_26044B1B0();
  unint64_t v15 = v51;
  if (v51)
  {
    uint64_t v16 = v50;
    uint64_t v17 = HIBYTE(v51) & 0xF;
    if ((v51 & 0x2000000000000000) == 0) {
      uint64_t v17 = v50 & 0xFFFFFFFFFFFFLL;
    }
    if (v17)
    {
      unint64_t v19 = *(void *)(v7 + 16);
      unint64_t v18 = *(void *)(v7 + 24);
      if (v19 >= v18 >> 1) {
        uint64_t v7 = (uint64_t)sub_26043EA1C((char *)(v18 > 1), v19 + 1, 1, (char *)v7);
      }
      *(void *)(v7 + 16) = v19 + 1;
      uint64_t v20 = v7 + 16 * v19;
      *(void *)(v20 + 32) = v16;
      *(void *)(v20 + 40) = v15;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_26044B1B0();
  if (v50)
  {
    if (*(void *)(v50 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E418);
      sub_260436588(&qword_26A86E420, &qword_26A86E418);
      uint64_t v21 = sub_26044B6D0();
      uint64_t v23 = v22;
      swift_bridgeObjectRelease();
      unint64_t v25 = *(void *)(v7 + 16);
      unint64_t v24 = *(void *)(v7 + 24);
      if (v25 >= v24 >> 1) {
        uint64_t v7 = (uint64_t)sub_26043EA1C((char *)(v24 > 1), v25 + 1, 1, (char *)v7);
      }
      *(void *)(v7 + 16) = v25 + 1;
      uint64_t v26 = v7 + 16 * v25;
      *(void *)(v26 + 32) = v21;
      *(void *)(v26 + 40) = v23;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v50 = 0x2070756F7247;
  unint64_t v51 = 0xE600000000000000;
  sub_26044B1B0();
  sub_26044B810();
  sub_26044B760();
  swift_bridgeObjectRelease();
  uint64_t v27 = v50;
  unint64_t v28 = v51;
  unint64_t v30 = *(void *)(v7 + 16);
  unint64_t v29 = *(void *)(v7 + 24);
  if (v30 >= v29 >> 1) {
    uint64_t v7 = (uint64_t)sub_26043EA1C((char *)(v29 > 1), v30 + 1, 1, (char *)v7);
  }
  *(void *)(v7 + 16) = v30 + 1;
  uint64_t v31 = v7 + 16 * v30;
  *(void *)(v31 + 32) = v27;
  *(void *)(v31 + 40) = v28;
  sub_26044B1B0();
  if (v50 != 2)
  {
    uint64_t v50 = 0;
    unint64_t v51 = 0xE000000000000000;
    sub_26044B760();
    swift_bridgeObjectRelease();
    uint64_t v32 = v50;
    unint64_t v33 = v51;
    unint64_t v35 = *(void *)(v7 + 16);
    unint64_t v34 = *(void *)(v7 + 24);
    if (v35 >= v34 >> 1) {
      uint64_t v7 = (uint64_t)sub_26043EA1C((char *)(v34 > 1), v35 + 1, 1, (char *)v7);
    }
    *(void *)(v7 + 16) = v35 + 1;
    uint64_t v36 = v7 + 16 * v35;
    *(void *)(v36 + 32) = v32;
    *(void *)(v36 + 40) = v33;
  }
  sub_26044B1B0();
  unint64_t v37 = v51;
  if (v51)
  {
    uint64_t v38 = v50;
    unint64_t v40 = *(void *)(v7 + 16);
    unint64_t v39 = *(void *)(v7 + 24);
    uint64_t v41 = v46;
    if (v40 >= v39 >> 1) {
      uint64_t v7 = (uint64_t)sub_26043EA1C((char *)(v39 > 1), v40 + 1, 1, (char *)v7);
    }
    *(void *)(v7 + 16) = v40 + 1;
    uint64_t v42 = v7 + 16 * v40;
    *(void *)(v42 + 32) = v38;
    *(void *)(v42 + 40) = v37;
  }
  else
  {
    uint64_t v41 = v46;
  }
  sub_26044B720();
  sub_26044B710();
  uint64_t v50 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E418);
  sub_260436588(&qword_26A86E420, &qword_26A86E418);
  sub_26044B6D0();
  swift_bridgeObjectRelease();
  sub_26044B700();
  swift_bridgeObjectRelease();
  sub_26044B710();
  sub_26044B4B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v49, 1, 1, v48);
  uint64_t v43 = sub_26044B390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v41, 1, 1, v43);
  return sub_26044B3A0();
}

uint64_t sub_26043D12C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a1;
  uint64_t v3 = sub_26044B580();
  uint64_t v66 = *(void *)(v3 - 8);
  uint64_t v67 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v65 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26044B550();
  uint64_t v63 = *(void *)(v5 - 8);
  uint64_t v64 = v5;
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v60 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v62 = (char *)&v59 - v9;
  MEMORY[0x270FA5388](v8);
  v61 = (char *)&v59 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E3E0);
  MEMORY[0x270FA5388](v11 - 8);
  v71 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_26044B5A0();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v74 = v13;
  MEMORY[0x270FA5388](v13);
  v72 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_26044B4C0();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v18 = (int *)type metadata accessor for IntelligenceCommandEntity();
  uint64_t v19 = v18[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E3E8);
  sub_26044B4A0();
  uint64_t v69 = MEMORY[0x2612109D0](v17);
  *(void *)(a2 + v19) = v69;
  uint64_t v20 = v18[6];
  sub_26044B4A0();
  uint64_t v68 = MEMORY[0x2612109D0](v17);
  *(void *)(a2 + v20) = v68;
  uint64_t v21 = v18[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E3F0);
  sub_26044B4A0();
  *(void *)(a2 + v21) = MEMORY[0x2612109D0](v17);
  uint64_t v22 = v18[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E3F8);
  sub_26044B4A0();
  *(void *)(a2 + v22) = MEMORY[0x2612109F0](v17);
  uint64_t v23 = v18[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E400);
  sub_26044B4A0();
  *(void *)(a2 + v23) = MEMORY[0x2612109E0](v17);
  uint64_t v24 = v70;
  uint64_t v25 = v18[10];
  sub_26044B4A0();
  *(void *)(a2 + v25) = MEMORY[0x2612109D0](v17);
  uint64_t v26 = a2 + v18[11];
  uint64_t v27 = sub_26044B5F0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = v26;
  uint64_t v30 = v73;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v29, v24, v27);
  sub_26044B510();
  uint64_t v75 = sub_26044B5D0();
  uint64_t v76 = v31;
  sub_26044B1C0();
  uint64_t v75 = sub_26044B530();
  uint64_t v76 = v32;
  sub_26044B1C0();
  uint64_t v75 = sub_26044B5C0();
  sub_26044B1C0();
  uint64_t v75 = sub_26044B5E0();
  sub_26044B1C0();
  LOBYTE(v75) = sub_26044B520() & 1;
  sub_26044B1C0();
  uint64_t v33 = (uint64_t)v71;
  sub_26044B5B0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v33, 1, v74) == 1)
  {
    sub_26043E7E8(v33);
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    sub_26044B1C0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v24, v27);
  }
  else
  {
    uint64_t v59 = v27;
    uint64_t v68 = v25;
    uint64_t v69 = a2;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v72, v33, v74);
    unint64_t v35 = v61;
    sub_26044B560();
    uint64_t v36 = (void (*)(uint64_t))MEMORY[0x263F81980];
    sub_26043EB24(&qword_26A86E408, MEMORY[0x263F81980]);
    unint64_t v37 = v62;
    uint64_t v38 = v64;
    sub_26044B7C0();
    sub_26043EB24(&qword_26A86E410, v36);
    LOBYTE(v36) = sub_26044B6E0();
    unint64_t v39 = *(void (**)(char *, uint64_t))(v63 + 8);
    v39(v37, v38);
    v39(v35, v38);
    if (v36)
    {
      unint64_t v40 = (char *)MEMORY[0x263F8EE78];
      uint64_t v41 = v59;
    }
    else
    {
      uint64_t v42 = v60;
      sub_26044B560();
      uint64_t v43 = sub_26044B540();
      uint64_t v45 = v44;
      v39(v42, v38);
      unint64_t v40 = sub_26043EA1C(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v47 = *((void *)v40 + 2);
      unint64_t v46 = *((void *)v40 + 3);
      if (v47 >= v46 >> 1) {
        unint64_t v40 = sub_26043EA1C((char *)(v46 > 1), v47 + 1, 1, v40);
      }
      uint64_t v41 = v59;
      *((void *)v40 + 2) = v47 + 1;
      uint64_t v48 = &v40[16 * v47];
      *((void *)v48 + 4) = v43;
      *((void *)v48 + 5) = v45;
    }
    v49 = v65;
    sub_26044B590();
    uint64_t v50 = sub_26044B570();
    uint64_t v52 = v51;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v49, v67);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v40 = sub_26043EA1C(0, *((void *)v40 + 2) + 1, 1, v40);
    }
    unint64_t v54 = *((void *)v40 + 2);
    unint64_t v53 = *((void *)v40 + 3);
    if (v54 >= v53 >> 1) {
      unint64_t v40 = sub_26043EA1C((char *)(v53 > 1), v54 + 1, 1, v40);
    }
    *((void *)v40 + 2) = v54 + 1;
    v55 = &v40[16 * v54];
    *((void *)v55 + 4) = v50;
    *((void *)v55 + 5) = v52;
    uint64_t v75 = (uint64_t)v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E418);
    sub_260436588(&qword_26A86E420, &qword_26A86E418);
    uint64_t v56 = sub_26044B6D0();
    uint64_t v58 = v57;
    swift_bridgeObjectRelease();
    uint64_t v75 = v56;
    uint64_t v76 = v58;
    sub_26044B1C0();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v24, v41);
    return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v72, v74);
  }
}

uint64_t sub_26043D998()
{
  return sub_26043EB24(&qword_26A86E398, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043D9E0()
{
  return sub_26043EB24(&qword_26A86E3A0, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043DA28()
{
  return sub_26043EB24((unint64_t *)&qword_26A86E1E0, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043DA70()
{
  return sub_26043EB24(&qword_26A86E3A8, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043DAB8()
{
  return sub_26043EB24(&qword_26A86E3B0, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntityID);
}

uint64_t sub_26043DB00@<X0>(uint64_t a1@<X8>)
{
  return sub_26043EB6C(v1, a1);
}

uint64_t sub_26043DB0C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E078 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B480();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E788);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_26043DBB4()
{
  return sub_260436588(&qword_26A86E3B8, &qword_26A86E3C0);
}

uint64_t sub_26043DBF0(uint64_t a1)
{
  uint64_t v2 = sub_26043EB24(qword_26A86E1B0, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t sub_26043DC6C()
{
  return sub_26043EB24(&qword_26A86E3C8, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
}

uint64_t sub_26043DCB8(uint64_t a1)
{
  uint64_t v2 = sub_26043EB24(&qword_26A86E3A8, (void (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity);
  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t *sub_26043DD34(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    sub_26044B280();
  }
  else
  {
    uint64_t v7 = sub_26044B4F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v11 = a3[11];
    uint64_t v16 = (char *)a2 + v11;
    uint64_t v17 = (char *)a1 + v11;
    uint64_t v12 = sub_26044B5F0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    sub_26044B280();
    sub_26044B280();
    sub_26044B280();
    sub_26044B280();
    sub_26044B280();
    sub_26044B280();
    v13(v17, v16, v12);
  }
  return a1;
}

uint64_t sub_26043DECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 44);
  uint64_t v6 = sub_26044B5F0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_26043DFBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[11];
  uint64_t v14 = a2 + v10;
  uint64_t v15 = a1 + v10;
  uint64_t v11 = sub_26044B5F0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  v12(v15, v14, v11);
  return a1;
}

uint64_t sub_26043E104(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  sub_26044B280();
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  sub_26044B280();
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  sub_26044B280();
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  sub_26044B280();
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  sub_26044B280();
  swift_release();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  sub_26044B280();
  swift_release();
  uint64_t v7 = a3[11];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_26044B5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_26043E264(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[11];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_26044B5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_26043E358(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_26044B4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_release();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_release();
  uint64_t v7 = a3[11];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_26044B5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_26043E488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_26043E49C);
}

uint64_t sub_26043E49C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for IntelligenceCommandEntityID();
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
    uint64_t v11 = sub_26044B5F0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 44);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_26043E5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26043E5DC);
}

uint64_t sub_26043E5DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for IntelligenceCommandEntityID();
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
    uint64_t v11 = sub_26044B5F0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 44);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_26043E708()
{
  uint64_t result = sub_26044B4F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_26044B5F0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_26043E7E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E3E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t sub_26043E848(size_t result, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E430);
  uint64_t v10 = *(void *)(sub_26044B4F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_26044B4F0() - 8);
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

char *sub_26043EA1C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E428);
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
  uint64_t v14 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_26043EB24(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26043EB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceCommandEntityID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_26043EBD4()
{
  unint64_t result = qword_26A86E438;
  if (!qword_26A86E438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E438);
  }
  return result;
}

uint64_t sub_26043EC28()
{
  uint64_t v0 = sub_26044B4C0();
  __swift_allocate_value_buffer(v0, qword_26A86E7A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E7A0);
  return sub_26044B4A0();
}

uint64_t sub_26043EC8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v13 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = sub_26044B4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  sub_26044B4A0();
  sub_26044B4A0();
  uint64_t v12 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v12(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E298);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_26044C170;
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  v12(v4, 0, 1, v7);
  uint64_t v9 = v13;
  sub_26044B370();
  uint64_t v10 = sub_26044B360();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
}

uint64_t sub_26043EFB0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E480);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E488);
  MEMORY[0x270FA5388](v1);
  sub_26043F5BC();
  sub_26044B420();
  sub_26044B410();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E490);
  sub_26044B400();
  swift_release();
  sub_26044B410();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E498);
  sub_26044B400();
  swift_release();
  sub_26044B410();
  sub_26044B430();
  return sub_26044B3F0();
}

uint64_t sub_26043F188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a1;
  v3[8] = a3;
  v3[9] = type metadata accessor for IntelligenceCommandEntity();
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_26043F21C, 0, 0);
}

uint64_t sub_26043F21C()
{
  if (qword_26A86E0A0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  sub_26043A41C((uint64_t)&unk_26A86E810, (uint64_t)(v0 + 2));
  sub_26044B200();
  uint64_t v3 = v1 + *(int *)(v2 + 44);
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 8) + **(int **)(v5 + 8));
  unint64_t v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  void *v6 = v0;
  v6[1] = sub_26043F388;
  return v8(v3, v4, v5);
}

uint64_t sub_26043F388()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_26043F53C;
  }
  else {
    uint64_t v2 = sub_26043F49C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_26043F49C()
{
  sub_26043FE48(*(void *)(v0 + 80));
  sub_26043A4BC(v0 + 16);
  sub_26043634C();
  sub_26044B190();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_26043F53C()
{
  sub_26043FE48(*(void *)(v0 + 80));
  sub_26043A4BC(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_26043F5BC()
{
  unint64_t result = qword_26A86E440;
  if (!qword_26A86E440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E440);
  }
  return result;
}

unint64_t sub_26043F614()
{
  unint64_t result = qword_26A86E448;
  if (!qword_26A86E448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E448);
  }
  return result;
}

unint64_t sub_26043F66C()
{
  unint64_t result = qword_26A86E450;
  if (!qword_26A86E450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E450);
  }
  return result;
}

uint64_t sub_26043F6C0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_26043F6F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_26043F710@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E080 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B4C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E7A0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_26043F7C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 8);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_260435C80;
  return sub_26043F188(a1, v5, v4);
}

uint64_t sub_26043F860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26043F94C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_26043F888(uint64_t a1)
{
  unint64_t v2 = sub_26043F5BC();
  return MEMORY[0x270EE0D28](a1, v2);
}

ValueMetadata *type metadata accessor for RunIntelligenceCommand()
{
  return &type metadata for RunIntelligenceCommand;
}

uint64_t sub_26043F8D4()
{
  return sub_260436588(&qword_26A86E460, &qword_26A86E468);
}

uint64_t sub_26043F910()
{
  return sub_260436588(&qword_26A86E240, &qword_26A86E248);
}

uint64_t sub_26043F94C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E280);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v27 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_26044B440();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v26 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_26044B4C0();
  uint64_t v21 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  sub_26044B4A0();
  uint64_t v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
  v15(v12, 0, 1, v13);
  sub_26044B170();
  uint64_t v16 = sub_26044B180();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v9, 0, 1, v16);
  unsigned int v22 = *MEMORY[0x263EFBDC8];
  unint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v23 = v2 + 104;
  uint64_t v24 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  uint64_t v25 = sub_26044B250();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E470);
  sub_26044B4A0();
  sub_26044B4A0();
  v15(v12, 0, 1, v21);
  uint64_t v19 = type metadata accessor for IntelligenceCommandEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v27, 1, 1, v19);
  sub_26044B170();
  v17(v9, 0, 1, v16);
  v17(v26, 1, 1, v16);
  v24(v4, v22, v28);
  sub_26043FDF0();
  sub_26044B240();
  return v25;
}

unint64_t sub_26043FDF0()
{
  unint64_t result = qword_26A86E1B0[0];
  if (!qword_26A86E1B0[0])
  {
    type metadata accessor for IntelligenceCommandEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A86E1B0);
  }
  return result;
}

uint64_t sub_26043FE48(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IntelligenceCommandEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_26043FEA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

uint64_t sub_26043FED0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

unint64_t sub_26043FF00()
{
  unint64_t result = qword_26A86E4A0;
  if (!qword_26A86E4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E4A0);
  }
  return result;
}

uint64_t sub_26043FF54()
{
  uint64_t v0 = sub_26044B4C0();
  __swift_allocate_value_buffer(v0, qword_26A86E7B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E7B8);
  return sub_26044B4A0();
}

uint64_t sub_26043FFB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - v5;
  uint64_t v7 = sub_26044B4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  sub_26044B4A0();
  sub_26044B4A0();
  uint64_t v9 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E298);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_26044CA60;
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  v9(v4, 0, 1, v7);
  uint64_t v10 = v14;
  sub_26044B370();
  uint64_t v11 = sub_26044B360();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_260440298()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E4F8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E500);
  MEMORY[0x270FA5388](v1);
  sub_260440804();
  sub_26044B420();
  sub_26044B410();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E508);
  sub_26044B400();
  swift_release();
  sub_26044B410();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E510);
  sub_26044B400();
  swift_release();
  sub_26044B410();
  sub_26044B430();
  return sub_26044B3F0();
}

uint64_t sub_260440470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = a3;
  return MEMORY[0x270FA2498](sub_260440490, 0, 0);
}

uint64_t sub_260440490()
{
  if (qword_26A86E098 != -1) {
    swift_once();
  }
  sub_260440FF0((uint64_t)&unk_26A86E7E8, (uint64_t)(v0 + 2));
  sub_26044B200();
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  v0[11] = v2;
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 8) + **(int **)(v4 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[12] = v5;
  void *v5 = v0;
  v5[1] = sub_260440600;
  return v7(v1, v2, v3, v4);
}

uint64_t sub_260440600()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_260440790;
  }
  else {
    uint64_t v2 = sub_260440714;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_260440714()
{
  sub_26044104C(v0 + 16);
  swift_bridgeObjectRelease();
  sub_26044B1A0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_260440790()
{
  sub_26044104C(v0 + 16);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_260440804()
{
  unint64_t result = qword_26A86E4A8;
  if (!qword_26A86E4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E4A8);
  }
  return result;
}

unint64_t sub_26044085C()
{
  unint64_t result = qword_26A86E4B0;
  if (!qword_26A86E4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E4B0);
  }
  return result;
}

unint64_t sub_2604408B4()
{
  unint64_t result = qword_26A86E4B8;
  if (!qword_26A86E4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E4B8);
  }
  return result;
}

uint64_t sub_260440908()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_260440924()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_260440940@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E088 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B4C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E7B8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_2604409F0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_260435C80;
  v5[9] = a1;
  v5[10] = v4;
  return MEMORY[0x270FA2498](sub_260440490, 0, 0);
}

uint64_t sub_260440AA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_260440B8C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260440AC8(uint64_t a1)
{
  unint64_t v2 = sub_260440804();
  return MEMORY[0x270EE0D28](a1, v2);
}

ValueMetadata *type metadata accessor for InsertIntelligenceText()
{
  return &type metadata for InsertIntelligenceText;
}

uint64_t sub_260440B14()
{
  return sub_260436588(&qword_26A86E4C8, &qword_26A86E4D0);
}

uint64_t sub_260440B50()
{
  return sub_260436588(&qword_26A86E4D8, &qword_26A86E4E0);
}

uint64_t sub_260440B8C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E250);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v29 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_26044B440();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_26044B4C0();
  uint64_t v23 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  sub_26044B4A0();
  unsigned int v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  v22(v10, 0, 1, v11);
  sub_26044B170();
  uint64_t v13 = sub_26044B180();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
  uint64_t v27 = v14 + 56;
  v26(v7, 0, 1, v13);
  uint64_t v15 = *MEMORY[0x263EFBDC8];
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  uint64_t v24 = v2 + 104;
  uint64_t v25 = v16;
  uint64_t v17 = v28;
  v16(v4, v15, v28);
  unint64_t v18 = v4;
  uint64_t v19 = sub_26044B250();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E4E8);
  sub_26044B4A0();
  sub_26044B4A0();
  v22(v10, 0, 1, v23);
  uint64_t v20 = sub_26044B6F0();
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v29, 1, 1, v20);
  sub_26044B170();
  v26(v7, 0, 1, v13);
  v25(v18, v15, v17);
  sub_26044B260();
  return v19;
}

uint64_t sub_260440FF0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_26044104C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2604410A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

uint64_t sub_2604410CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044B220();
  *a1 = result;
  return result;
}

unint64_t sub_2604410FC()
{
  unint64_t result = qword_26A86E518;
  if (!qword_26A86E518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E518);
  }
  return result;
}

uint64_t sub_260441150()
{
  uint64_t v0 = sub_26044B4C0();
  __swift_allocate_value_buffer(v0, qword_26A86E7D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E7D0);
  return sub_26044B4A0();
}

uint64_t sub_2604411B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v13 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = sub_26044B4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  sub_26044B4A0();
  sub_26044B4A0();
  uint64_t v12 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v12(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E298);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_26044C170;
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  sub_26044B4A0();
  v12(v4, 0, 1, v7);
  uint64_t v9 = v13;
  sub_26044B370();
  uint64_t v10 = sub_26044B360();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
}

uint64_t sub_2604414D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a1;
  v5[4] = a3;
  uint64_t v6 = sub_26044B640();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_260441598, 0, 0);
}

uint64_t sub_260441598()
{
  sub_26044B630();
  sub_26044B200();
  if (*(unsigned char *)(v0 + 104) == 1) {
    sub_26044B610();
  }
  sub_26044B200();
  if (*(unsigned char *)(v0 + 105) == 1) {
    sub_26044B600();
  }
  sub_26044B200();
  if (*(unsigned char *)(v0 + 106) == 1) {
    sub_26044B620();
  }
  if (qword_26A86E0A0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2604416EC;
  uint64_t v2 = *(void *)(v0 + 72);
  return sub_260444828(v2);
}

uint64_t sub_2604416EC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2604418F0;
  }
  else
  {
    *(void *)(v4 + 96) = a1;
    uint64_t v5 = sub_260441814;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_260441814()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  v0[2] = v0[12];
  __swift_instantiateConcreteTypeFromMangledName(qword_26A86E1F0);
  sub_26044254C();
  sub_26044B190();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2604418F0()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

unint64_t sub_260441974()
{
  unint64_t result = qword_26A86E520;
  if (!qword_26A86E520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E520);
  }
  return result;
}

unint64_t sub_2604419CC()
{
  unint64_t result = qword_26A86E528;
  if (!qword_26A86E528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E528);
  }
  return result;
}

unint64_t sub_260441A24()
{
  unint64_t result = qword_26A86E530;
  if (!qword_26A86E530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E530);
  }
  return result;
}

uint64_t sub_260441A78()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_260441AAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_260441AFC@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A86E090 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26044B4C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86E7D0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_260441BA8(uint64_t a1)
{
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_260435C80;
  return sub_2604414D4(a1, v7, v4, v5, v6);
}

uint64_t sub_260441C5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_260441F88();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_260441C88(uint64_t a1)
{
  unint64_t v2 = sub_260441974();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for FetchIntelligenceCommands(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  sub_26044B280();
  return v3;
}

uint64_t destroy for FetchIntelligenceCommands()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for FetchIntelligenceCommands(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  sub_26044B280();
  return a1;
}

void *assignWithCopy for FetchIntelligenceCommands(void *a1, void *a2)
{
  *a1 = *a2;
  sub_26044B280();
  swift_release();
  a1[1] = a2[1];
  sub_26044B280();
  swift_release();
  a1[2] = a2[2];
  sub_26044B280();
  swift_release();
  a1[3] = a2[3];
  sub_26044B280();
  swift_release();
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

_OWORD *assignWithTake for FetchIntelligenceCommands(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchIntelligenceCommands(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FetchIntelligenceCommands(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FetchIntelligenceCommands()
{
  return &type metadata for FetchIntelligenceCommands;
}

unint64_t sub_260441F2C()
{
  unint64_t result = qword_26A86E540;
  if (!qword_26A86E540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A86E548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E540);
  }
  return result;
}

uint64_t sub_260441F88()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E550);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v41 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_26044B440();
  uint64_t v2 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_26044B4C0();
  uint64_t v49 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v15(v10, 1, 1, v11);
  uint64_t v16 = sub_26044B180();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v43 = v17 + 56;
  uint64_t v34 = v16;
  v42(v7, 1, 1, v16);
  unsigned int v50 = *MEMORY[0x263EFBDC8];
  unint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v47 = v2 + 104;
  uint64_t v48 = (void (*)(char *, void, uint64_t))v18;
  uint64_t v38 = v4;
  v18(v4);
  uint64_t v40 = sub_26044B250();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E558);
  sub_26044B4A0();
  uint64_t v35 = v12 + 56;
  uint64_t v36 = v15;
  v15(v10, 1, 1, v49);
  char v54 = 2;
  uint64_t v45 = sub_26044B770();
  uint64_t v20 = *(void *)(v45 - 8);
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v46 = v20 + 56;
  uint64_t v21 = v41;
  v44(v41, 1, 1, v45);
  uint64_t v31 = v7;
  uint64_t v22 = v16;
  uint64_t v23 = v42;
  v42(v7, 1, 1, v22);
  uint64_t v24 = v38;
  v48(v38, v50, v51);
  uint64_t v32 = v14;
  uint64_t v33 = v19;
  uint64_t v39 = sub_26044B270();
  sub_26044B4A0();
  v15(v10, 1, 1, v49);
  char v53 = 2;
  v44(v21, 1, 1, v45);
  uint64_t v25 = v31;
  uint64_t v26 = v34;
  v23(v31, 1, 1, v34);
  uint64_t v27 = v51;
  uint64_t v28 = v48;
  v48(v24, v50, v51);
  uint64_t v37 = sub_26044B270();
  sub_26044B4A0();
  v36(v10, 1, 1, v49);
  char v52 = 2;
  v44(v21, 1, 1, v45);
  v42(v25, 1, 1, v26);
  v28(v24, v50, v27);
  sub_26044B270();
  return v40;
}

unint64_t sub_26044254C()
{
  unint64_t result = qword_26A86E568;
  if (!qword_26A86E568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A86E1F0);
    sub_2604425C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E568);
  }
  return result;
}

unint64_t sub_2604425C0()
{
  unint64_t result = qword_26A86E1E0;
  if (!qword_26A86E1E0)
  {
    type metadata accessor for IntelligenceCommandEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E1E0);
  }
  return result;
}

uint64_t sub_260442618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_260435C80;
  return v11(a1, a2, a3, a4);
}

BOOL sub_260442724(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_26044273C()
{
  return sub_26044B8A0();
}

uint64_t sub_260442784()
{
  return sub_26044B890();
}

uint64_t sub_2604427B0()
{
  return sub_26044B8A0();
}

uint64_t sub_260442804()
{
  return sub_26044B4A0();
}

void sub_260442848()
{
  qword_26A86E800 = (uint64_t)&type metadata for InsertTextBridge_UIKit;
  *(void *)algn_26A86E808 = &off_270C70A40;
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

uint64_t initializeWithCopy for InsertTextBridge(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for InsertTextBridge(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        sub_26044B280();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          sub_26044B280();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          sub_26044B280();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for InsertTextBridge(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsertTextBridge(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InsertTextBridge(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InsertTextBridge()
{
  return &type metadata for InsertTextBridge;
}

uint64_t sub_260442C5C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_260442C80, 0, 0);
}

uint64_t sub_260442C80()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  long long v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *long long v4 = v0;
  v4[1] = sub_260442D88;
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  return v8(v6, v5, v2, v3);
}

uint64_t sub_260442D88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InsertTextBridge.BridgeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for InsertTextBridge.BridgeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260442FE8);
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

uint64_t sub_260443010(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_260443018(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for InsertTextBridge.BridgeError()
{
  return &type metadata for InsertTextBridge.BridgeError;
}

unint64_t sub_260443038()
{
  unint64_t result = qword_26A86E580[0];
  if (!qword_26A86E580[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A86E580);
  }
  return result;
}

uint64_t sub_26044308C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_260435C80;
  return v9(a1, a2, a3);
}

uint64_t sub_260443190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_260443294;
  return v9(a1, a2, a3);
}

uint64_t sub_260443294(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_260443390(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_26044B5F0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  v2[8] = *(void *)(type metadata accessor for IntelligenceCommandEntity() - 8);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E188);
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_26044B4F0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = *(void *)(type metadata accessor for IntelligenceCommandEntityID() - 8);
  v2[16] = swift_task_alloc();
  uint64_t v5 = sub_26044B640();
  v2[17] = v5;
  v2[18] = *(void *)(v5 - 8);
  v2[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_260443608, 0, 0);
}

uint64_t sub_260443608()
{
  uint64_t v1 = (void *)v0[3];
  sub_26044B630();
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[20] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_26044371C;
  uint64_t v5 = v0[19];
  return v7(v5, v2, v3);
}

uint64_t sub_26044371C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_260443D74;
  }
  else {
    uint64_t v4 = sub_260443830;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_260443830()
{
  uint64_t v1 = v0[2];
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v4 = v0[15];
    uint64_t v5 = v0[12];
    uint64_t v6 = v0[2] + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v7 = *(void *)(v4 + 72);
    uint64_t v46 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v47 = (void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    uint64_t v8 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v45 = v5;
    uint64_t v9 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    swift_bridgeObjectRetain();
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
    uint64_t v43 = v7;
    do
    {
      uint64_t v11 = v0[16];
      uint64_t v13 = v0[10];
      uint64_t v12 = v0[11];
      sub_26043EB6C(v6, v11);
      (*v47)(v13, v11, v12);
      (*v46)(v13, 0, 1, v12);
      sub_260445D00(v11);
      if ((*v8)(v13, 1, v12) == 1)
      {
        sub_26043A578(v0[10], &qword_26A86E188);
      }
      else
      {
        uint64_t v15 = (char *)v0[13];
        uint64_t v14 = (char *)v0[14];
        uint64_t v16 = v0[11];
        uint64_t v17 = *v9;
        (*v9)(v14, (char *)v0[10], v16);
        v17(v15, v14, v16);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v10 = (char *)sub_26043E848(0, *((void *)v10 + 2) + 1, 1, v10);
        }
        unint64_t v19 = *((void *)v10 + 2);
        unint64_t v18 = *((void *)v10 + 3);
        if (v19 >= v18 >> 1) {
          uint64_t v10 = (char *)sub_26043E848(v18 > 1, v19 + 1, 1, v10);
        }
        uint64_t v20 = (char *)v0[13];
        uint64_t v21 = v0[11];
        *((void *)v10 + 2) = v19 + 1;
        v17(&v10[((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v19], v20, v21);
        uint64_t v7 = v43;
      }
      v6 += v7;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v22 = v0[21];
  uint64_t v23 = sub_260446BD8((uint64_t)v10);
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_260446D60(v22, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v25 = *(void *)(v24 + 16);
  if (v25)
  {
    uint64_t v48 = v0[8];
    uint64_t v49 = v3;
    uint64_t v26 = v0[5];
    sub_260445C88(0, v25, 0);
    uint64_t v27 = *(void (**)(unint64_t, unint64_t, uint64_t))(v26 + 16);
    v26 += 16;
    unint64_t v28 = v24 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
    uint64_t v44 = *(void *)(v26 + 56);
    uint64_t v42 = (void (**)(unint64_t, uint64_t))(v26 - 8);
    uint64_t v29 = v3;
    uint64_t v30 = v27;
    do
    {
      uint64_t v31 = v0[9];
      uint64_t v33 = v0[6];
      unint64_t v32 = v0[7];
      uint64_t v34 = v0[4];
      v30(v32, v28, v34);
      v30(v33, v32, v34);
      sub_26043D12C(v33, v31);
      (*v42)(v32, v34);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_260445C88(0, *(void *)(v29 + 16) + 1, 1);
        uint64_t v29 = v49;
      }
      unint64_t v36 = *(void *)(v29 + 16);
      unint64_t v35 = *(void *)(v29 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_260445C88(v35 > 1, v36 + 1, 1);
        uint64_t v29 = v49;
      }
      uint64_t v37 = v0[9];
      *(void *)(v29 + 16) = v36 + 1;
      sub_26043A5D4(v37, v29+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(void *)(v48 + 72) * v36, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
      v28 += v44;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v38 = (uint64_t (*)(uint64_t))v0[1];
    return v38(v29);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_26043A3C8();
    swift_allocError();
    *uint64_t v40 = 2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = (uint64_t (*)(void))v0[1];
    return v41();
  }
}

uint64_t sub_260443D74()
{
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_260443E50(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_26044B5F0();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  v3[9] = *(void *)(type metadata accessor for IntelligenceCommandEntity() - 8);
  v3[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E188);
  v3[11] = swift_task_alloc();
  uint64_t v5 = sub_26044B4F0();
  v3[12] = v5;
  v3[13] = *(void *)(v5 - 8);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E278);
  v3[15] = swift_task_alloc();
  uint64_t v6 = sub_26044B640();
  v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_260444094, 0, 0);
}

uint64_t sub_260444094()
{
  uint64_t v1 = (void *)v0[4];
  sub_26044B630();
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[19] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2604441A8;
  uint64_t v5 = v0[18];
  return v7(v5, v2, v3);
}

uint64_t sub_2604441A8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 160) = a1;
  *(void *)(v3 + 168) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_260444758;
  }
  else {
    uint64_t v4 = sub_2604442BC;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2604442BC()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 88);
  (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  swift_bridgeObjectRetain();
  sub_26044B500();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 120);
  if (v4 == 1)
  {
    sub_26043A578(*(void *)(v0 + 88), &qword_26A86E188);
    uint64_t v6 = type metadata accessor for IntelligenceCommandEntityID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 112);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 104) + 32);
    v9(v7, *(void *)(v0 + 88), v8);
    v9(v5, v7, v8);
    uint64_t v10 = type metadata accessor for IntelligenceCommandEntityID();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  uint64_t v11 = *(void *)(v0 + 160);
  uint64_t v12 = *(void *)(v0 + 120);
  long long v35 = *(_OWORD *)(v0 + 16);
  uint64_t v13 = swift_task_alloc();
  *(_OWORD *)(v13 + 16) = v35;
  *(void *)(v13 + 32) = v12;
  uint64_t v14 = sub_260444EC0((uint64_t (*)(char *))sub_260447214, v13, v11);
  swift_task_dealloc();
  int64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v36 = *(void *)(v0 + 72);
    uint64_t v16 = *(void *)(v0 + 48);
    uint64_t v37 = MEMORY[0x263F8EE78];
    sub_260445C88(0, v15, 0);
    uint64_t v17 = *(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 16);
    v16 += 16;
    unint64_t v18 = v14 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
    uint64_t v34 = *(void *)(v16 + 56);
    uint64_t v33 = (void (**)(unint64_t, uint64_t))(v16 - 8);
    uint64_t v19 = v37;
    uint64_t v20 = v17;
    do
    {
      uint64_t v21 = *(void *)(v0 + 80);
      uint64_t v23 = *(void *)(v0 + 56);
      unint64_t v22 = *(void *)(v0 + 64);
      uint64_t v24 = *(void *)(v0 + 40);
      v20(v22, v18, v24);
      v20(v23, v22, v24);
      sub_26043D12C(v23, v21);
      (*v33)(v22, v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_260445C88(0, *(void *)(v19 + 16) + 1, 1);
        uint64_t v19 = v37;
      }
      unint64_t v26 = *(void *)(v19 + 16);
      unint64_t v25 = *(void *)(v19 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_260445C88(v25 > 1, v26 + 1, 1);
        uint64_t v19 = v37;
      }
      uint64_t v27 = *(void *)(v0 + 80);
      *(void *)(v19 + 16) = v26 + 1;
      sub_26043A5D4(v27, v19+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v26, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
      v18 += v34;
      --v15;
    }
    while (v15);
    sub_26043A578(*(void *)(v0 + 120), &qword_26A86E278);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v28(v19);
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 120);
    swift_bridgeObjectRelease();
    sub_26043A3C8();
    swift_allocError();
    *uint64_t v31 = 2;
    swift_willThrow();
    sub_26043A578(v30, &qword_26A86E278);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
    return v32();
  }
}

uint64_t sub_260444758()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_260444828(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_26044B5F0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  v2[8] = *(void *)(type metadata accessor for IntelligenceCommandEntity() - 8);
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_260444950, 0, 0);
}

uint64_t sub_260444950()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  int v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  *int v4 = v0;
  v4[1] = sub_260444A58;
  uint64_t v5 = v0[2];
  return v7(v5, v2, v3);
}

uint64_t sub_260444A58(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 88) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_260444BB4, 0, 0);
  }
}

uint64_t sub_260444BB4()
{
  uint64_t v1 = v0[11];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v19 = v0[8];
    uint64_t v3 = v0[5];
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_260445C88(0, v2, 0);
    int v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v3 += 16;
    uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
    uint64_t v18 = *(void *)(v3 + 56);
    uint64_t v17 = (void (**)(uint64_t, uint64_t))(v3 - 8);
    uint64_t v6 = v20;
    uint64_t v7 = v4;
    do
    {
      uint64_t v8 = v0[9];
      uint64_t v10 = v0[6];
      uint64_t v9 = v0[7];
      uint64_t v11 = v0[4];
      v7(v9, v5, v11);
      v7(v10, v9, v11);
      sub_26043D12C(v10, v8);
      (*v17)(v9, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_260445C88(0, *(void *)(v6 + 16) + 1, 1);
        uint64_t v6 = v20;
      }
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_260445C88(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v20;
      }
      uint64_t v14 = v0[9];
      *(void *)(v6 + 16) = v13 + 1;
      sub_26043A5D4(v14, v6+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v13, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
      v5 += v18;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(v6);
}

uint64_t sub_260444DE4()
{
  return sub_26044B4A0();
}

BOOL sub_260444E84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_260444E98()
{
  return sub_260444DE4();
}

void sub_260444EA0()
{
  qword_26A86E828 = (uint64_t)&type metadata for IntelligenceCommandBridge_UIKit;
  unk_26A86E830 = &off_270C70BD8;
}

uint64_t sub_260444EC0(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v28 = sub_26044B5F0();
  uint64_t v7 = *(void *)(v28 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v26 = *(void *)(a3 + 16);
  if (v26)
  {
    unint64_t v14 = 0;
    uint64_t v21 = a3;
    unint64_t v22 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v24 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v25 = v7 + 16;
    v20[0] = a1;
    v20[1] = a2;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v13 = *(void *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a3 + v15 + v13 * v14, v28);
      char v16 = a1(v12);
      if (v3)
      {
        (*v22)(v12, v28);
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if (v16)
      {
        uint64_t v23 = *v24;
        v23(v27, v12, v28);
        uint64_t v17 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_260445CC4(0, *(void *)(v17 + 16) + 1, 1);
          uint64_t v17 = v29;
        }
        unint64_t v19 = *(void *)(v17 + 16);
        unint64_t v18 = *(void *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_260445CC4(v18 > 1, v19 + 1, 1);
          uint64_t v17 = v29;
        }
        *(void *)(v17 + 16) = v19 + 1;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v17 + v15 + v19 * v13, v27, v28);
        uint64_t v29 = v17;
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v22)(v12, v28);
      }
      if (v26 == ++v14)
      {
        uint64_t v13 = v29;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_260445164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a4;
  uint64_t v7 = sub_26044B4F0();
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v30 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E278);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v34 = (uint64_t)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for IntelligenceCommandEntityID();
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v29 = (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_26044B5F0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_26044B5D0() == a2 && v17 == a3)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
LABEL_13:
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    goto LABEL_14;
  }
  uint64_t v28 = v7;
  char v18 = sub_26044B820();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  if (v18) {
    goto LABEL_13;
  }
  if (sub_26044B530() == a2 && v19 == a3)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v21 = sub_26044B820();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v21)
  {
LABEL_14:
    char v23 = 1;
    return v23 & 1;
  }
  uint64_t v22 = v34;
  sub_260447238(v35, v34);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v22, 1, v33) == 1)
  {
    sub_26043A578(v22, &qword_26A86E278);
    char v23 = 0;
  }
  else
  {
    uint64_t v25 = v29;
    sub_26043A5D4(v22, v29, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntityID);
    uint64_t v26 = v30;
    sub_26044B510();
    char v23 = sub_26044B4E0();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v28);
    sub_260445D00(v25);
  }
  return v23 & 1;
}

uint64_t sub_260445548(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_260445568, 0, 0);
}

uint64_t sub_260445568()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  int v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *int v4 = v0;
  v4[1] = sub_260445670;
  uint64_t v5 = v0[2];
  return v7(v5, v2, v3);
}

uint64_t sub_260445670()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_260445764(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_260445784, 0, 0);
}

uint64_t sub_260445784()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_26044588C;
  uint64_t v5 = v0[2];
  return v7(v5, v2, v3);
}

uint64_t sub_26044588C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_26044598C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_26044B4F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_2604471D0(&qword_26A86E198);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v11 = sub_26044B6B0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    char v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      char v21 = v14;
      v14(v9, v20, v6);
      sub_2604471D0(&qword_26A86E5B0);
      char v22 = sub_26044B6E0();
      char v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      uint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_260446320((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

size_t sub_260445C88(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_260445D5C(a1, a2, a3, (void *)*v3, &qword_26A86E5A0, (uint64_t (*)(void))type metadata accessor for IntelligenceCommandEntity);
  *uint64_t v3 = result;
  return result;
}

size_t sub_260445CC4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_260445D5C(a1, a2, a3, (void *)*v3, &qword_26A86E5B8, MEMORY[0x263F819A0]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_260445D00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IntelligenceCommandEntityID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t sub_260445D5C(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
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
    char v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  char v16 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v16);
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
  swift_release();
  return (size_t)v16;
}

uint64_t sub_260445F38()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_26044B4F0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E5C0);
  uint64_t v5 = sub_26044B7E0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = sub_26044B280();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_2604471D0(&qword_26A86E198);
      uint64_t result = sub_26044B6B0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_260446320(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_26044B4F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_260445F38();
  }
  else
  {
    if (v11 > v10)
    {
      sub_260446598();
      goto LABEL_12;
    }
    sub_26044683C();
  }
  uint64_t v12 = *v3;
  sub_2604471D0(&qword_26A86E198);
  uint64_t v13 = sub_26044B6B0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_2604471D0(&qword_26A86E5B0);
      char v21 = sub_26044B6E0();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_26044B830();
  __break(1u);
  return result;
}

void *sub_260446598()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26044B4F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E5C0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_26044B7D0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_26044683C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26044B4F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E5C0);
  uint64_t v7 = sub_26044B7E0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = sub_26044B280();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_2604471D0(&qword_26A86E198);
    uint64_t result = sub_26044B6B0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_260446BD8(uint64_t a1)
{
  uint64_t v2 = sub_26044B4F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_2604471D0(&qword_26A86E198);
  uint64_t result = sub_26044B7B0();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_26044598C((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_260446D60(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_26044B4F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v52 = (char *)v34 - v10;
  uint64_t v11 = sub_26044B5F0();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v39 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v34 - v14;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v53 = MEMORY[0x263F8EE78];
  uint64_t v46 = *(void *)(a1 + 16);
  if (v46)
  {
    uint64_t v18 = 0;
    int64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v19 = v15 + 16;
    unint64_t v21 = (*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64);
    v34[1] = v2;
    unint64_t v35 = v21;
    uint64_t v43 = a1 + v21;
    uint64_t v44 = v20;
    uint64_t v47 = *(void *)(v19 + 56);
    uint64_t v49 = v6 + 16;
    uint64_t v50 = a2 + 56;
    uint64_t v51 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v37 = v6;
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    int64_t v40 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v41 = (char *)v34 - v14;
    uint64_t v42 = v11;
    uint64_t v45 = v19;
    do
    {
      uint64_t v48 = v18;
      v44(v16, v43 + v47 * v18, v11);
      sub_26044B510();
      if (*(void *)(a2 + 16)
        && (sub_2604471D0(&qword_26A86E198),
            uint64_t v22 = sub_26044B6B0(),
            uint64_t v23 = -1 << *(unsigned char *)(a2 + 32),
            unint64_t v24 = v22 & ~v23,
            ((*(void *)(v50 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) != 0))
      {
        uint64_t v25 = ~v23;
        uint64_t v26 = *(void *)(v37 + 72);
        unint64_t v27 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
        while (1)
        {
          uint64_t v28 = a2;
          v27(v9, *(void *)(a2 + 48) + v26 * v24, v5);
          sub_2604471D0(&qword_26A86E5B0);
          char v29 = sub_26044B6E0();
          unint64_t v30 = *v51;
          (*v51)(v9, v5);
          if (v29) {
            break;
          }
          unint64_t v24 = (v24 + 1) & v25;
          a2 = v28;
          if (((*(void *)(v50 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) == 0) {
            goto LABEL_3;
          }
        }
        v30(v52, v5);
        uint64_t v16 = v41;
        uint64_t v11 = v42;
        int64_t v36 = *v38;
        v36(v39, v41, v42);
        uint64_t v31 = v53;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_260445CC4(0, *(void *)(v31 + 16) + 1, 1);
          uint64_t v31 = v53;
        }
        a2 = v28;
        unint64_t v33 = *(void *)(v31 + 16);
        unint64_t v32 = *(void *)(v31 + 24);
        if (v33 >= v32 >> 1)
        {
          sub_260445CC4(v32 > 1, v33 + 1, 1);
          uint64_t v31 = v53;
        }
        *(void *)(v31 + 16) = v33 + 1;
        v36((char *)(v31 + v35 + v33 * v47), v39, v11);
        uint64_t v53 = v31;
      }
      else
      {
LABEL_3:
        (*v51)(v52, v5);
        uint64_t v16 = v41;
        uint64_t v11 = v42;
        (*v40)(v41, v42);
      }
      uint64_t v18 = v48 + 1;
    }
    while (v48 + 1 != v46);
    return v53;
  }
  return result;
}

uint64_t sub_2604471D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_26044B4F0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_260447214(uint64_t a1)
{
  return sub_260445164(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_260447238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommandBridge.BridgeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IntelligenceCommandBridge.BridgeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2604473FCLL);
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

unsigned char *sub_260447424(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommandBridge.BridgeError()
{
  return &type metadata for IntelligenceCommandBridge.BridgeError;
}

ValueMetadata *type metadata accessor for IntelligenceCommandBridge()
{
  return &type metadata for IntelligenceCommandBridge;
}

unint64_t sub_260447450()
{
  unint64_t result = qword_26A86E5E0;
  if (!qword_26A86E5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E5E0);
  }
  return result;
}

unint64_t sub_2604474A4(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000020;
      break;
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 3:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000021;
      break;
    case 5:
    case 10:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD000000000000023;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2604475C4()
{
  sub_26044B200();
  return v1;
}

uint64_t sub_2604475F8()
{
  uint64_t v0 = sub_26044B480();
  __swift_allocate_value_buffer(v0, qword_26A86E838);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86E838);
  return sub_26044B470();
}

unint64_t sub_26044765C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E728);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A86E730) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_26044C390;
  unsigned int v4 = (unsigned char *)(v3 + v2);
  *unsigned int v4 = 0;
  sub_26044B380();
  v4[v1] = 1;
  sub_26044B380();
  unint64_t result = sub_26044777C(v3);
  qword_26A86E850 = result;
  return result;
}

unint64_t sub_26044777C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E730);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    BOOL v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E738);
  uint64_t v6 = sub_26044B7F0();
  BOOL v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  sub_26044B280();
  while (1)
  {
    sub_26044B038(v12, (uint64_t)v5, &qword_26A86E730);
    char v14 = *v5;
    unint64_t result = sub_26044A4FC(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_26044B3B0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_260447974(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E700);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    BOOL v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E708);
  uint64_t v6 = sub_26044B7F0();
  BOOL v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  sub_26044B280();
  while (1)
  {
    sub_26044B038(v12, (uint64_t)v5, &qword_26A86E700);
    char v14 = *v5;
    unint64_t result = sub_26044A5AC(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_26044B3B0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

uint64_t sub_260447B6C(char *a1, char *a2)
{
  return sub_260447BD0(*a1, *a2);
}

unint64_t sub_260447B7C()
{
  unint64_t result = qword_26A86E5E8;
  if (!qword_26A86E5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E5E8);
  }
  return result;
}

uint64_t sub_260447BD0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6F70707553746F6ELL;
  }
  else {
    uint64_t v3 = 0x73736563637573;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xEC00000064657472;
  }
  if (a2) {
    uint64_t v5 = 0x6F70707553746F6ELL;
  }
  else {
    uint64_t v5 = 0x73736563637573;
  }
  if (a2) {
    unint64_t v6 = 0xEC00000064657472;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_26044B820();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260447C80()
{
  return sub_26044B8A0();
}

uint64_t sub_260447D0C()
{
  sub_26044B750();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260447D84()
{
  return sub_26044B8A0();
}

uint64_t sub_260447E0C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_26044B800();
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

void sub_260447E6C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x73736563637573;
  if (*v1) {
    uint64_t v2 = 0x6F70707553746F6ELL;
  }
  unint64_t v3 = 0xE700000000000000;
  if (*v1) {
    unint64_t v3 = 0xEC00000064657472;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_260447EB8()
{
  unint64_t result = qword_26A86E5F0;
  if (!qword_26A86E5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E5F0);
  }
  return result;
}

unint64_t sub_260447F10()
{
  unint64_t result = qword_26A86E5F8;
  if (!qword_26A86E5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E5F8);
  }
  return result;
}

unint64_t sub_260447F68()
{
  unint64_t result = qword_26A86E600;
  if (!qword_26A86E600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E600);
  }
  return result;
}

uint64_t sub_260447FBC()
{
  return MEMORY[0x263F8D380];
}

unint64_t sub_260447FCC()
{
  unint64_t result = qword_26A86E608;
  if (!qword_26A86E608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E608);
  }
  return result;
}

unint64_t sub_260448024()
{
  unint64_t result = qword_26A86E610;
  if (!qword_26A86E610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E610);
  }
  return result;
}

unint64_t sub_260448080()
{
  unint64_t result = qword_26A86E618;
  if (!qword_26A86E618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E618);
  }
  return result;
}

uint64_t sub_2604480D4@<X0>(uint64_t a1@<X8>)
{
  return sub_260449000(&qword_26A86E0A8, MEMORY[0x263EFBE48], (uint64_t)qword_26A86E838, a1);
}

uint64_t sub_26044810C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260449F0C(a1, a2, a3, (void (*)(void))sub_260448138);
}

unint64_t sub_260448138()
{
  unint64_t result = qword_26A86E620;
  if (!qword_26A86E620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E620);
  }
  return result;
}

uint64_t sub_26044818C(uint64_t a1)
{
  unint64_t v2 = sub_260448138();
  return MEMORY[0x270EE0C40](a1, v2);
}

unint64_t sub_2604481DC()
{
  unint64_t result = qword_26A86E628;
  if (!qword_26A86E628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E628);
  }
  return result;
}

unint64_t sub_260448234()
{
  unint64_t result = qword_26A86E630;
  if (!qword_26A86E630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E630);
  }
  return result;
}

unint64_t sub_26044828C()
{
  unint64_t result = qword_26A86E638;
  if (!qword_26A86E638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E638);
  }
  return result;
}

uint64_t sub_2604482E0(uint64_t a1, uint64_t a2)
{
  return sub_26044A120(a1, a2, &qword_26A86E0B0);
}

uint64_t sub_260448304(uint64_t a1)
{
  unint64_t v2 = sub_260448080();
  return MEMORY[0x270EE1C28](a1, v2);
}

uint64_t sub_260448350()
{
  return sub_260436588(&qword_26A86E640, &qword_26A86E648);
}

void sub_26044838C(void *a1@<X8>)
{
  *a1 = &unk_270C708D0;
}

unint64_t sub_2604483A0()
{
  unint64_t result = qword_26A86E650;
  if (!qword_26A86E650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E650);
  }
  return result;
}

uint64_t sub_2604483F4(uint64_t a1)
{
  return sub_260448418(a1, qword_26A86E858);
}

uint64_t sub_260448418(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_26044B4C0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_26044B4A0();
}

uint64_t sub_260448478(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_26044B7A0();
  *(void *)(v1 + 24) = sub_26044B790();
  uint64_t v3 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_260448510, v3, v2);
}

uint64_t sub_260448510()
{
  uint64_t v1 = (unsigned char *)(v0 + 32);
  swift_release();
  type metadata accessor for WritingTools_UIKit();
  uint64_t v2 = swift_allocObject();
  id v3 = objc_msgSend(self, sel_sharedApplication);
  id v4 = objc_msgSend(v3, sel__responderForKeyEvents);

  if (v4)
  {
    *(void *)(v2 + 16) = v4;
    if (objc_msgSend(v4, sel__supportsWritingTools))
    {
      id v5 = *(id *)(v2 + 16);
      unint64_t v6 = (void *)sub_26044B740();
      objc_msgSend(v5, sel__startWritingToolsWithTool_prompt_sender_, v6, 0, 0);

      *uint64_t v1 = 0;
    }
    else
    {
      *uint64_t v1 = 1;
    }
    sub_26043BFB0();
    sub_26044B190();
    swift_release();
  }
  else
  {
    swift_deallocPartialClassInstance();
    *(unsigned char *)(v0 + 32) = 1;
    sub_26043BFB0();
    sub_26044B190();
  }
  char v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

unint64_t sub_2604486D0()
{
  unint64_t result = qword_26A86E658;
  if (!qword_26A86E658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E658);
  }
  return result;
}

unint64_t sub_260448728()
{
  unint64_t result = qword_26A86E660;
  if (!qword_26A86E660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E660);
  }
  return result;
}

uint64_t sub_26044877C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2604487B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260449F0C(a1, a2, a3, (void (*)(void))sub_26043B19C);
}

uint64_t sub_2604487DC@<X0>(uint64_t a1@<X8>)
{
  return sub_260449000(&qword_26A86E0B8, MEMORY[0x263F06D40], (uint64_t)qword_26A86E858, a1);
}

uint64_t sub_260448814()
{
  return 1;
}

uint64_t sub_26044881C(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_26044B09C;
  return sub_260448478(a1);
}

uint64_t sub_2604488B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_26044B440();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_26044B4C0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = sub_26044B180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263EFBDC8], v2);
  uint64_t result = sub_26044B250();
  *a1 = result;
  return result;
}

uint64_t sub_260448B3C(uint64_t a1)
{
  unint64_t v2 = sub_26043B19C();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_260448B7C()
{
  unint64_t result = qword_26A86E670;
  if (!qword_26A86E670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E670);
  }
  return result;
}

uint64_t sub_260448BD0(uint64_t a1)
{
  return sub_260448418(a1, qword_26A86E870);
}

uint64_t sub_260448BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[4] = a1;
  sub_26044B7A0();
  v4[7] = sub_26044B790();
  uint64_t v6 = sub_26044B780();
  return MEMORY[0x270FA2498](sub_260448C8C, v6, v5);
}

uint64_t sub_260448C8C()
{
  swift_release();
  type metadata accessor for WritingTools_UIKit();
  uint64_t v1 = swift_allocObject();
  id v2 = objc_msgSend(self, sel_sharedApplication);
  id v3 = objc_msgSend(v2, sel__responderForKeyEvents);

  if (v3)
  {
    *(void *)(v1 + 16) = v3;
    if (objc_msgSend(v3, sel__supportsWritingTools))
    {
      sub_26044B200();
      char v4 = *(unsigned char *)(v0 + 16);
      sub_26044B200();
      uint64_t v5 = *(void *)(v0 + 24);
      uint64_t v6 = *(void **)(v1 + 16);
      sub_2604474A4(v4);
      id v7 = v6;
      uint64_t v8 = (void *)sub_26044B740();
      swift_bridgeObjectRelease();
      if (v5) {
        uint64_t v9 = (void *)sub_26044B740();
      }
      else {
        uint64_t v9 = 0;
      }
      objc_msgSend(v7, sel__startWritingToolsWithTool_prompt_sender_, v8, v9, 0);

      swift_bridgeObjectRelease();
      *(unsigned char *)(v0 + 16) = 0;
      sub_26043BFB0();
    }
    else
    {
      *(unsigned char *)(v0 + 16) = 1;
      sub_26043BFB0();
    }
    sub_26044B190();
    swift_release();
  }
  else
  {
    swift_deallocPartialClassInstance();
    *(unsigned char *)(v0 + 16) = 1;
    sub_26043BFB0();
    sub_26044B190();
  }
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

unint64_t sub_260448EBC()
{
  unint64_t result = qword_26A86E678;
  if (!qword_26A86E678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E678);
  }
  return result;
}

unint64_t sub_260448F14()
{
  unint64_t result = qword_26A86E680;
  if (!qword_26A86E680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E680);
  }
  return result;
}

uint64_t sub_260448F68()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_260448F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260449F0C(a1, a2, a3, (void (*)(void))sub_26043B1F0);
}

uint64_t sub_260448FC8@<X0>(uint64_t a1@<X8>)
{
  return sub_260449000(&qword_26A86E0C0, MEMORY[0x263F06D40], (uint64_t)qword_26A86E870, a1);
}

uint64_t sub_260449000@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v9(a4, v8, v7);
}

uint64_t sub_2604490A4(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_260435C80;
  return sub_260448BF0(a1, v6, v5, v4);
}

uint64_t sub_260449150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26044AAF4();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_26044917C(uint64_t a1)
{
  unint64_t v2 = sub_26043B1F0();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_2604491B8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E158);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v59 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_26044B4C0();
  uint64_t v70 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E6F8);
  uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A86E700) - 8);
  uint64_t v9 = *(void *)v8;
  uint64_t v66 = *(void *)(*(void *)v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = swift_allocObject();
  uint64_t v60 = v11;
  v61 = v8;
  *(_OWORD *)(v11 + 16) = xmmword_26044D050;
  unint64_t v12 = v11 + v10;
  *(unsigned char *)(v11 + v10) = 0;
  sub_26044B4A0();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v64 = v7 + 56;
  v65 = v13;
  v13(v5, 1, 1, v6);
  uint64_t v14 = sub_26044B390();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  uint64_t v16 = v15 + 56;
  uint64_t v63 = v14;
  v68(v2, 1, 1, v14);
  uint64_t v69 = v16;
  unint64_t v17 = v2;
  sub_26044B3A0();
  uint64_t v18 = v66;
  unint64_t v19 = v12;
  unint64_t v67 = v12;
  uint64_t v62 = v12 + v66 + v8[14];
  *(unsigned char *)(v12 + v66) = 1;
  sub_26044B4A0();
  uint64_t v20 = v5;
  BOOL v21 = v5;
  uint64_t v22 = v70;
  uint64_t v23 = v65;
  v65(v21, 1, 1, v70);
  v68(v2, 1, 1, v14);
  sub_26044B3A0();
  uint64_t v62 = 2 * v18;
  uint64_t v24 = v18;
  uint64_t v25 = (unsigned char *)(v19 + 2 * v18);
  uint64_t v26 = v61;
  uint64_t v59 = &v25[v61[14]];
  *uint64_t v25 = 2;
  sub_26044B4A0();
  v23(v20, 1, 1, v22);
  uint64_t v27 = v63;
  uint64_t v28 = v68;
  v68(v17, 1, 1, v63);
  sub_26044B3A0();
  unint64_t v29 = v67;
  unint64_t v30 = (unsigned char *)(v67 + v62 + v24);
  uint64_t v62 = (uint64_t)&v30[v26[14]];
  unsigned char *v30 = 3;
  sub_26044B4A0();
  uint64_t v31 = v65;
  v65(v20, 1, 1, v70);
  v28(v17, 1, 1, v27);
  unint64_t v32 = v28;
  sub_26044B3A0();
  uint64_t v33 = v66;
  uint64_t v62 = 4 * v66;
  uint64_t v34 = (unsigned char *)(v29 + 4 * v66);
  uint64_t v59 = &v34[v26[14]];
  *uint64_t v34 = 4;
  sub_26044B4A0();
  uint64_t v35 = v70;
  v31(v20, 1, 1, v70);
  uint64_t v36 = v63;
  v32(v17, 1, 1, v63);
  sub_26044B3A0();
  *(unsigned char *)(v29 + v62 + v33) = 5;
  sub_26044B4A0();
  uint64_t v37 = v35;
  uint64_t v38 = v65;
  v65(v20, 1, 1, v37);
  uint64_t v39 = v68;
  v68(v17, 1, 1, v36);
  sub_26044B3A0();
  uint64_t v40 = v66;
  uint64_t v41 = (unsigned char *)(v67 + 6 * v66);
  uint64_t v62 = (uint64_t)&v41[v26[14]];
  *uint64_t v41 = 6;
  sub_26044B4A0();
  v38(v20, 1, 1, v70);
  uint64_t v42 = v36;
  v39(v17, 1, 1, v36);
  sub_26044B3A0();
  uint64_t v62 = 8 * v40;
  unint64_t v43 = v67;
  uint64_t v44 = (unsigned char *)(v67 + 7 * v40);
  uint64_t v59 = &v44[v26[14]];
  *uint64_t v44 = 7;
  sub_26044B4A0();
  uint64_t v45 = v70;
  uint64_t v46 = v65;
  v65(v20, 1, 1, v70);
  uint64_t v47 = v42;
  uint64_t v48 = v68;
  v68(v17, 1, 1, v47);
  sub_26044B3A0();
  uint64_t v59 = (unsigned char *)(v43 + v62 + v26[14]);
  *(unsigned char *)(v43 + v62) = 8;
  sub_26044B4A0();
  uint64_t v49 = v45;
  uint64_t v50 = v46;
  v46(v20, 1, 1, v49);
  uint64_t v51 = v63;
  v48(v17, 1, 1, v63);
  sub_26044B3A0();
  uint64_t v52 = v66;
  unint64_t v53 = v67;
  char v54 = (unsigned char *)(v67 + v62 + v66);
  uint64_t v62 = (uint64_t)&v54[v26[14]];
  *char v54 = 9;
  sub_26044B4A0();
  uint64_t v55 = v70;
  v50(v20, 1, 1, v70);
  uint64_t v56 = v51;
  uint64_t v57 = v68;
  v68(v17, 1, 1, v56);
  sub_26044B3A0();
  *(unsigned char *)(v53 + 10 * v52) = 10;
  sub_26044B4A0();
  v50(v20, 1, 1, v55);
  v57(v17, 1, 1, v63);
  sub_26044B3A0();
  unint64_t result = sub_260447974(v60);
  qword_26A86E888 = result;
  return result;
}

uint64_t sub_260449A54(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_2604474A4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_2604474A4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_26044B820();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_260449AE4()
{
  unint64_t result = qword_26A86E690;
  if (!qword_26A86E690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E690);
  }
  return result;
}

uint64_t sub_260449B38()
{
  char v1 = *v0;
  sub_26044B880();
  sub_2604474A4(v1);
  sub_26044B750();
  swift_bridgeObjectRelease();
  return sub_26044B8A0();
}

uint64_t sub_260449B9C()
{
  sub_2604474A4(*v0);
  sub_26044B750();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260449BF0()
{
  char v1 = *v0;
  sub_26044B880();
  sub_2604474A4(v1);
  sub_26044B750();
  swift_bridgeObjectRelease();
  return sub_26044B8A0();
}

uint64_t sub_260449C50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26044AFEC();
  *a1 = result;
  return result;
}

unint64_t sub_260449C80@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2604474A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_260449CB0()
{
  unint64_t result = qword_26A86E698;
  if (!qword_26A86E698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E698);
  }
  return result;
}

unint64_t sub_260449D08()
{
  unint64_t result = qword_26A86E6A0;
  if (!qword_26A86E6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6A0);
  }
  return result;
}

unint64_t sub_260449D60()
{
  unint64_t result = qword_26A86E6A8;
  if (!qword_26A86E6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6A8);
  }
  return result;
}

unint64_t sub_260449DB8()
{
  unint64_t result = qword_26A86E6B0;
  if (!qword_26A86E6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6B0);
  }
  return result;
}

unint64_t sub_260449E10()
{
  unint64_t result = qword_26A86E6B8;
  if (!qword_26A86E6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6B8);
  }
  return result;
}

unint64_t sub_260449E6C()
{
  unint64_t result = qword_26A86E6C0;
  if (!qword_26A86E6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6C0);
  }
  return result;
}

uint64_t sub_260449EC0()
{
  return sub_26044B470();
}

uint64_t sub_260449EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260449F0C(a1, a2, a3, (void (*)(void))sub_260449F54);
}

uint64_t sub_260449F0C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_260449F54()
{
  unint64_t result = qword_26A86E6C8;
  if (!qword_26A86E6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6C8);
  }
  return result;
}

uint64_t sub_260449FA8(uint64_t a1)
{
  unint64_t v2 = sub_260449F54();
  return MEMORY[0x270EE0C40](a1, v2);
}

unint64_t sub_260449FF8()
{
  unint64_t result = qword_26A86E6D0;
  if (!qword_26A86E6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6D0);
  }
  return result;
}

unint64_t sub_26044A050()
{
  unint64_t result = qword_26A86E6D8;
  if (!qword_26A86E6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6D8);
  }
  return result;
}

unint64_t sub_26044A0A8()
{
  unint64_t result = qword_26A86E6E0;
  if (!qword_26A86E6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86E6E0);
  }
  return result;
}

uint64_t sub_26044A0FC(uint64_t a1, uint64_t a2)
{
  return sub_26044A120(a1, a2, &qword_26A86E0C8);
}

uint64_t sub_26044A120(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_26044A170(uint64_t a1)
{
  unint64_t v2 = sub_260449E6C();
  return MEMORY[0x270EE1C28](a1, v2);
}

uint64_t sub_26044A1BC()
{
  return sub_260436588(&qword_26A86E6E8, &qword_26A86E6F0);
}

void sub_26044A1F8(void *a1@<X8>)
{
  *a1 = &unk_270C70850;
}

uint64_t getEnumTagSinglePayload for RewriteType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RewriteType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x26044A364);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RewriteType()
{
  return &type metadata for RewriteType;
}

ValueMetadata *type metadata accessor for WritingToolsRewriteIntent()
{
  return &type metadata for WritingToolsRewriteIntent;
}

ValueMetadata *type metadata accessor for WritingToolsProofreadIntent()
{
  return &type metadata for WritingToolsProofreadIntent;
}

unsigned char *storeEnumTagSinglePayload for WritingToolsResult(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26044A488);
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

ValueMetadata *type metadata accessor for WritingToolsResult()
{
  return &type metadata for WritingToolsResult;
}

uint64_t sub_26044A4C0()
{
  return sub_260436588((unint64_t *)&qword_26A86E338, &qword_26A86E340);
}

unint64_t sub_26044A4FC(char a1)
{
  sub_26044B880();
  sub_26044B750();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_26044B8A0();
  return sub_26044A634(a1 & 1, v2);
}

unint64_t sub_26044A5AC(char a1)
{
  sub_26044B880();
  sub_2604474A4(a1);
  sub_26044B750();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_26044B8A0();
  return sub_26044A780(a1, v2);
}

unint64_t sub_26044A634(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x6F70707553746F6ELL;
    }
    else {
      uint64_t v6 = 0x73736563637573;
    }
    if (a1) {
      unint64_t v7 = 0xEC00000064657472;
    }
    else {
      unint64_t v7 = 0xE700000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x6F70707553746F6ELL : 0x73736563637573;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEC00000064657472 : 0xE700000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_26044B820();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_26044A780(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD00000000000001ALL;
      unint64_t v8 = 0x800000026044D880;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xD000000000000020;
          unint64_t v8 = 0x800000026044D8A0;
          break;
        case 2:
          unint64_t v7 = 0xD000000000000024;
          unint64_t v8 = 0x800000026044D8D0;
          break;
        case 3:
          unint64_t v7 = 0xD00000000000001FLL;
          unint64_t v8 = 0x800000026044D900;
          break;
        case 4:
          unint64_t v7 = 0xD000000000000021;
          unint64_t v8 = 0x800000026044D920;
          break;
        case 5:
          unint64_t v9 = "lRewriteOpenEnded";
          goto LABEL_14;
        case 6:
          unint64_t v7 = 0xD000000000000023;
          unint64_t v8 = 0x800000026044D970;
          break;
        case 7:
          unint64_t v7 = 0xD00000000000001ELL;
          unint64_t v8 = 0x800000026044D9A0;
          break;
        case 8:
          unint64_t v7 = 0xD00000000000001FLL;
          unint64_t v8 = 0x800000026044D9C0;
          break;
        case 9:
          unint64_t v7 = 0xD00000000000001DLL;
          unint64_t v8 = 0x800000026044D9E0;
          break;
        case 0xA:
          unint64_t v9 = "WTUIRequestedToolProofreading";
LABEL_14:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000018;
          break;
        default:
          break;
      }
      unint64_t v10 = 0x800000026044D880;
      switch(v6)
      {
        case 1:
          unint64_t v11 = 0xD000000000000020;
          unint64_t v12 = "WTUIRequestedToolRewriting";
          goto LABEL_26;
        case 2:
          unint64_t v11 = 0xD000000000000024;
          unint64_t v12 = "lRewriteFriendly";
          goto LABEL_26;
        case 3:
          unint64_t v11 = 0xD00000000000001FLL;
          unint64_t v12 = "lRewriteProfessional";
          goto LABEL_26;
        case 4:
          unint64_t v11 = 0xD000000000000021;
          unint64_t v12 = "WTUIRequestedToolRewriteConcise";
          goto LABEL_26;
        case 5:
          uint64_t v13 = "lRewriteOpenEnded";
          goto LABEL_31;
        case 6:
          unint64_t v11 = 0xD000000000000023;
          unint64_t v12 = "WTUIRequestedToolSummary";
          goto LABEL_26;
        case 7:
          unint64_t v11 = 0xD00000000000001ELL;
          unint64_t v12 = "lTransformKeyPoints";
          goto LABEL_26;
        case 8:
          unint64_t v11 = 0xD00000000000001FLL;
          unint64_t v12 = "WTUIRequestedToolTransformList";
LABEL_26:
          unint64_t v10 = (unint64_t)v12 | 0x8000000000000000;
          if (v7 != v11) {
            goto LABEL_33;
          }
          goto LABEL_32;
        case 9:
          unint64_t v10 = 0x800000026044D9E0;
          if (v7 != 0xD00000000000001DLL) {
            goto LABEL_33;
          }
          goto LABEL_32;
        case 10:
          uint64_t v13 = "WTUIRequestedToolProofreading";
LABEL_31:
          unint64_t v10 = (unint64_t)v13 | 0x8000000000000000;
          if (v7 == 0xD000000000000018) {
            goto LABEL_32;
          }
          goto LABEL_33;
        default:
          if (v7 != 0xD00000000000001ALL) {
            goto LABEL_33;
          }
LABEL_32:
          if (v8 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_33:
          char v14 = sub_26044B820();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v14) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_26044AAF4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E250);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v35 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_26044B440();
  uint64_t v2 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  unint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E258);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v34 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E160);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_26044B4C0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E260);
  sub_26044B4A0();
  unint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v31 = v13;
  uint64_t v38 = v14 + 56;
  v30(v12, 1, 1, v13);
  uint64_t v15 = sub_26044B180();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  uint64_t v37 = v16 + 56;
  v36(v9, 1, 1, v15);
  uint64_t v17 = *MEMORY[0x263EFBDC8];
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  uint64_t v28 = v2 + 104;
  uint64_t v26 = v4;
  unsigned int v32 = v17;
  uint64_t v18 = v39;
  v27(v4, v17, v39);
  uint64_t v33 = sub_26044B250();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E710);
  sub_26044B4A0();
  unint64_t v19 = v30;
  v30(v12, 1, 1, v13);
  LOBYTE(v40) = 11;
  uint64_t v20 = v9;
  BOOL v21 = v36;
  v36(v9, 1, 1, v15);
  v21(v34, 1, 1, v15);
  uint64_t v22 = v26;
  uint64_t v23 = v27;
  v27(v26, v17, v18);
  sub_260449F54();
  uint64_t v34 = (char *)sub_26044B230();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86E268);
  sub_26044B4A0();
  v19(v12, 1, 1, v31);
  uint64_t v24 = sub_26044B6F0();
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v35, 1, 1, v24);
  v36(v20, 1, 1, v15);
  v23(v22, v32, v39);
  sub_26044B260();
  return v33;
}

uint64_t sub_26044AFEC()
{
  unint64_t v0 = sub_26044B800();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB) {
    return 11;
  }
  else {
    return v0;
  }
}

uint64_t sub_26044B038(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_26044B0A0()
{
  return MEMORY[0x270EE0998]();
}

uint64_t sub_26044B0B0()
{
  return MEMORY[0x270EE09A8]();
}

uint64_t sub_26044B100()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_26044B110()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_26044B120()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_26044B130()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_26044B140()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_26044B170()
{
  return MEMORY[0x270EE0E68]();
}

uint64_t sub_26044B180()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_26044B190()
{
  return MEMORY[0x270EE0F98]();
}

uint64_t sub_26044B1A0()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_26044B1B0()
{
  return MEMORY[0x270EE1050]();
}

uint64_t sub_26044B1C0()
{
  return MEMORY[0x270EE1060]();
}

uint64_t sub_26044B1D0()
{
  return MEMORY[0x270EE1100]();
}

uint64_t sub_26044B1E0()
{
  return MEMORY[0x270EE1118]();
}

uint64_t sub_26044B1F0()
{
  return MEMORY[0x270EE1128]();
}

uint64_t sub_26044B200()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_26044B210()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_26044B220()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_26044B230()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_26044B240()
{
  return MEMORY[0x270EE1270]();
}

uint64_t sub_26044B250()
{
  return MEMORY[0x270EE1278]();
}

uint64_t sub_26044B260()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_26044B270()
{
  return MEMORY[0x270EE1308]();
}

uint64_t sub_26044B280()
{
  return MEMORY[0x270EE1410]();
}

uint64_t sub_26044B290()
{
  return MEMORY[0x270EE1420]();
}

uint64_t sub_26044B2A0()
{
  return MEMORY[0x270EE1428]();
}

uint64_t sub_26044B2B0()
{
  return MEMORY[0x270EE1438]();
}

uint64_t sub_26044B2C0()
{
  return MEMORY[0x270EE1470]();
}

uint64_t sub_26044B2D0()
{
  return MEMORY[0x270EE14C8]();
}

uint64_t sub_26044B2E0()
{
  return MEMORY[0x270EE14D8]();
}

uint64_t sub_26044B2F0()
{
  return MEMORY[0x270EE14E0]();
}

uint64_t sub_26044B300()
{
  return MEMORY[0x270EE14F8]();
}

uint64_t sub_26044B310()
{
  return MEMORY[0x270EE1500]();
}

uint64_t sub_26044B320()
{
  return MEMORY[0x270EE1510]();
}

uint64_t sub_26044B330()
{
  return MEMORY[0x270EE1518]();
}

uint64_t sub_26044B340()
{
  return MEMORY[0x270EE1520]();
}

uint64_t sub_26044B350()
{
  return MEMORY[0x270EE1530]();
}

uint64_t sub_26044B360()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_26044B370()
{
  return MEMORY[0x270EE1590]();
}

uint64_t sub_26044B380()
{
  return MEMORY[0x270EE18A0]();
}

uint64_t sub_26044B390()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_26044B3A0()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_26044B3B0()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_26044B3C0()
{
  return MEMORY[0x270EE19A8]();
}

uint64_t sub_26044B3E0()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_26044B3F0()
{
  return MEMORY[0x270EE1A50]();
}

uint64_t sub_26044B400()
{
  return MEMORY[0x270EE1AB0]();
}

uint64_t sub_26044B410()
{
  return MEMORY[0x270EE1AB8]();
}

uint64_t sub_26044B420()
{
  return MEMORY[0x270EE1AC0]();
}

uint64_t sub_26044B430()
{
  return MEMORY[0x270EE1AD0]();
}

uint64_t sub_26044B440()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_26044B460()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_26044B470()
{
  return MEMORY[0x270EE1CA0]();
}

uint64_t sub_26044B480()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_26044B4A0()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_26044B4B0()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_26044B4C0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_26044B4D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_26044B4E0()
{
  return MEMORY[0x270F80CA8]();
}

uint64_t sub_26044B4F0()
{
  return MEMORY[0x270F80CB8]();
}

uint64_t sub_26044B500()
{
  return MEMORY[0x270F80CC0]();
}

uint64_t sub_26044B510()
{
  return MEMORY[0x270F80CC8]();
}

uint64_t sub_26044B520()
{
  return MEMORY[0x270F80CD8]();
}

uint64_t sub_26044B530()
{
  return MEMORY[0x270F80CE0]();
}

uint64_t sub_26044B540()
{
  return MEMORY[0x270F80CF0]();
}

uint64_t sub_26044B550()
{
  return MEMORY[0x270F80CF8]();
}

uint64_t sub_26044B560()
{
  return MEMORY[0x270F80D00]();
}

uint64_t sub_26044B570()
{
  return MEMORY[0x270F80D08]();
}

uint64_t sub_26044B580()
{
  return MEMORY[0x270F80D10]();
}

uint64_t sub_26044B590()
{
  return MEMORY[0x270F80D18]();
}

uint64_t sub_26044B5A0()
{
  return MEMORY[0x270F80D20]();
}

uint64_t sub_26044B5B0()
{
  return MEMORY[0x270F80D28]();
}

uint64_t sub_26044B5C0()
{
  return MEMORY[0x270F80D38]();
}

uint64_t sub_26044B5D0()
{
  return MEMORY[0x270F80D40]();
}

uint64_t sub_26044B5E0()
{
  return MEMORY[0x270F80D50]();
}

uint64_t sub_26044B5F0()
{
  return MEMORY[0x270F80D58]();
}

uint64_t sub_26044B600()
{
  return MEMORY[0x270F812C0]();
}

uint64_t sub_26044B610()
{
  return MEMORY[0x270F812C8]();
}

uint64_t sub_26044B620()
{
  return MEMORY[0x270F812D0]();
}

uint64_t sub_26044B630()
{
  return MEMORY[0x270F812E0]();
}

uint64_t sub_26044B640()
{
  return MEMORY[0x270F812E8]();
}

uint64_t sub_26044B650()
{
  return MEMORY[0x270F82188]();
}

uint64_t sub_26044B660()
{
  return MEMORY[0x270F82190]();
}

uint64_t sub_26044B670()
{
  return MEMORY[0x270F82198]();
}

uint64_t sub_26044B690()
{
  return MEMORY[0x270F821A8]();
}

uint64_t sub_26044B6A0()
{
  return MEMORY[0x270F821B0]();
}

uint64_t sub_26044B6B0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_26044B6C0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_26044B6D0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_26044B6E0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_26044B6F0()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_26044B700()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_26044B710()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_26044B720()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_26044B730()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_26044B740()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26044B750()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26044B760()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26044B770()
{
  return MEMORY[0x270EE1F10]();
}

uint64_t sub_26044B780()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_26044B790()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_26044B7A0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_26044B7B0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_26044B7C0()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_26044B7D0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_26044B7E0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_26044B7F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26044B800()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_26044B810()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_26044B820()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26044B830()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_26044B840()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_26044B850()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_26044B860()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_26044B870()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_26044B880()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26044B890()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_26044B8A0()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}