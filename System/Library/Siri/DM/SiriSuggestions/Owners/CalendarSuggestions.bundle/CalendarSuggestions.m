uint64_t sub_2AA4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_C270 != -1) {
    swift_once();
  }
  v0 = sub_65C0();
  v1 = sub_36D8(v0, (uint64_t)qword_C688);
  v2 = sub_65E0();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)sub_36C0() = 0;
    sub_370C(&dword_0, v3, v4, "#CalendarOwnerDefinitionFactory createOwnerDefinitions");
    swift_slowDealloc();
  }

  sub_3490(&qword_C3E8);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_67F0;
  *(void *)(v5 + 56) = &type metadata for CalendarOwnerDefinition;
  *(void *)(v5 + 64) = sub_34D4();
  return v5;
}

uint64_t type metadata accessor for CalendarOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_2BC0()
{
  return sub_2AA4();
}

uint64_t sub_2BD8()
{
  uint64_t v1 = sub_6520();
  v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_3448(v2, v0, v1);
}

uint64_t sub_2C58()
{
  sub_6400();
  swift_allocObject();
  uint64_t result = sub_6410();
  qword_C680 = result;
  return result;
}

unint64_t sub_2CB8@<X0>(uint64_t a1@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_65C0();
  v3 = (void *)sub_36D8(v2, (uint64_t)qword_C688);
  os_log_type_t v4 = sub_65E0();
  if (sub_3688(v4))
  {
    v5 = (_WORD *)sub_36C0();
    sub_3700(v5);
    sub_3668(&dword_0, v6, v7, "#CalendarOwnerDefinition getSourceGenerator");
    sub_36A4();
  }

  *(void *)(a1 + 24) = &type metadata for CalendarGenerator;
  unint64_t result = sub_3618();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_2D6C@<X0>(uint64_t *a1@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_65C0();
  v3 = (void *)sub_36D8(v2, (uint64_t)qword_C688);
  os_log_type_t v4 = sub_65E0();
  if (sub_3688(v4))
  {
    v5 = (_WORD *)sub_36C0();
    sub_3700(v5);
    sub_3668(&dword_0, v6, v7, "#CalendarOwnerDefinition getTargetOwnerDefinition");
    sub_36A4();
  }

  uint64_t v8 = type metadata accessor for CalendarTargetOwnerDefinition();
  uint64_t v9 = swift_allocObject();
  a1[3] = v8;
  uint64_t result = sub_35D0(&qword_C418, v10, (void (*)(uint64_t))type metadata accessor for CalendarTargetOwnerDefinition);
  a1[4] = result;
  *a1 = v9;
  return result;
}

uint64_t sub_2E64@<X0>(uint64_t *a1@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_65C0();
  v3 = (void *)sub_36D8(v2, (uint64_t)qword_C688);
  os_log_type_t v4 = sub_65E0();
  if (sub_3688(v4))
  {
    v5 = (_WORD *)sub_36C0();
    sub_3700(v5);
    sub_3668(&dword_0, v6, v7, "#CalendarOwnerDefinition getOwner");
    sub_36A4();
  }

  if (qword_C268 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_C680;
  a1[3] = sub_6400();
  a1[4] = sub_35D0(&qword_C3F8, 255, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  *a1 = v8;
  return swift_retain();
}

uint64_t sub_2FAC@<X0>(uint64_t *a1@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_65C0();
  v3 = (void *)sub_36D8(v2, (uint64_t)qword_C688);
  os_log_type_t v4 = sub_65E0();
  if (sub_3688(v4))
  {
    v5 = (_WORD *)sub_36C0();
    sub_3700(v5);
    sub_3668(&dword_0, v6, v7, "#CalendarTargetOwnerDefinition getSuggestionsRepo");
    sub_36A4();
  }

  uint64_t v8 = type metadata accessor for CalendarSuggestionsRepository();
  uint64_t v9 = swift_allocObject();
  a1[3] = v8;
  uint64_t result = sub_35D0(&qword_C400, 255, (void (*)(uint64_t))type metadata accessor for CalendarSuggestionsRepository);
  a1[4] = result;
  *a1 = v9;
  return result;
}

void *sub_30AC()
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_65C0();
  uint64_t v1 = sub_36D8(v0, (uint64_t)qword_C688);
  os_log_type_t v2 = sub_65E0();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)sub_36C0() = 0;
    sub_370C(&dword_0, v3, v4, "#CalendarTargetOwnerDefinition getSuggestionsResolvers");
    swift_slowDealloc();
  }

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_316C@<X0>(uint64_t *a1@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_65C0();
  uint64_t v3 = (void *)sub_36D8(v2, (uint64_t)qword_C688);
  os_log_type_t v4 = sub_65E0();
  if (sub_3688(v4))
  {
    v5 = (_WORD *)sub_36C0();
    sub_3700(v5);
    sub_3668(&dword_0, v6, v7, "#CalendarTargetOwnerDefinition getSuggestionsFilter");
    sub_36A4();
  }

  uint64_t v8 = sub_64D0();
  uint64_t result = sub_64C0();
  a1[3] = v8;
  a1[4] = (uint64_t)&protocol witness table for NoOpSuggestionFilter;
  *a1 = result;
  return result;
}

uint64_t sub_322C@<X0>(uint64_t *a1@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_65C0();
  uint64_t v3 = (void *)sub_36D8(v2, (uint64_t)qword_C688);
  os_log_type_t v4 = sub_65E0();
  if (sub_3688(v4))
  {
    v5 = (_WORD *)sub_36C0();
    sub_3700(v5);
    sub_3668(&dword_0, v6, v7, "#CalendarTargetOwnerDefinition getOwner");
    sub_36A4();
  }

  if (qword_C268 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_C680;
  a1[3] = sub_6400();
  a1[4] = sub_35D0(&qword_C3F8, 255, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  *a1 = v8;
  return swift_retain();
}

uint64_t sub_3364()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for CalendarTargetOwnerDefinition()
{
  return self;
}

uint64_t sub_3398@<X0>(uint64_t *a1@<X8>)
{
  return sub_2FAC(a1);
}

void *sub_33B0()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_33D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_316C(a1);
}

uint64_t sub_33E8@<X0>(uint64_t *a1@<X8>)
{
  return sub_322C(a1);
}

uint64_t sub_3400(uint64_t a1, uint64_t a2)
{
  return sub_35D0((unint64_t *)&unk_C3D8, a2, (void (*)(uint64_t))type metadata accessor for CalendarTargetOwnerDefinition);
}

uint64_t sub_3448(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_3458(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_3490(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_34D4()
{
  unint64_t result = qword_C3F0;
  if (!qword_C3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C3F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarOwnerDefinition()
{
  return &type metadata for CalendarOwnerDefinition;
}

unint64_t sub_3534()
{
  unint64_t result = qword_C408;
  if (!qword_C408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C408);
  }
  return result;
}

unint64_t sub_3584()
{
  unint64_t result = qword_C410;
  if (!qword_C410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C410);
  }
  return result;
}

uint64_t sub_35D0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_3618()
{
  unint64_t result = qword_C420;
  if (!qword_C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C420);
  }
  return result;
}

void sub_3668(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL sub_3688(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_36A4()
{
  return swift_slowDealloc();
}

uint64_t sub_36C0()
{
  return swift_slowAlloc();
}

uint64_t sub_36D8(uint64_t a1, uint64_t a2)
{
  sub_3458(a1, a2);
  return sub_65A0();
}

_WORD *sub_3700(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

void sub_370C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_372C()
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_65C0();
  sub_3458(v0, (uint64_t)qword_C688);
  uint64_t v1 = sub_65A0();
  os_log_type_t v2 = sub_65E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "#CalendarSuggestionsRepository getPooledSuggestions", v3, 2u);
    swift_slowDealloc();
  }

  sub_3490(&qword_C4E0);
  sub_64A0();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_69B0;
  sub_64B0();
  sub_3F70();
  sub_395C();
  swift_bridgeObjectRelease();
  sub_3F70();
  sub_3A00();
  swift_bridgeObjectRelease();
  sub_3F70();
  sub_3AA0();
  swift_bridgeObjectRelease();
  sub_3F70();
  sub_3B44();
  swift_bridgeObjectRelease();
  sub_3F70();
  sub_3BE4();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_395C()
{
  return sub_6490();
}

uint64_t sub_3A00()
{
  return sub_6490();
}

uint64_t sub_3AA0()
{
  return sub_6490();
}

uint64_t sub_3B44()
{
  return sub_6490();
}

uint64_t sub_3BE4()
{
  return sub_6490();
}

uint64_t type metadata accessor for CalendarSuggestionsRepository()
{
  return self;
}

uint64_t sub_3CA8()
{
  return sub_372C();
}

uint64_t sub_3CC0(uint64_t a1, uint64_t a2)
{
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_3D68;
  return InternalSuggestionsRepository.getAsyncPooledSuggestions()(a1, a2);
}

uint64_t sub_3D68(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_3E64(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return SuggestionsRepository.getOwner()(a1, WitnessTable);
}

uint64_t sub_3EC8()
{
  return sub_3F30((unint64_t *)&unk_C4C8);
}

uint64_t sub_3EFC()
{
  return sub_3F30(&qword_C4D8);
}

uint64_t sub_3F30(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CalendarSuggestionsRepository();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_3F70()
{
  return sub_65D0();
}

uint64_t sub_3F90()
{
  uint64_t v0 = sub_65C0();
  sub_4014(v0, qword_C688);
  sub_3458(v0, (uint64_t)qword_C688);
  return sub_65B0();
}

uint64_t *sub_4014(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_4078@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_65C0();
  sub_3458(v4, (uint64_t)qword_C688);
  uint64_t v5 = sub_65A0();
  os_log_type_t v6 = sub_65E0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "#CalendarInvocationActionProvider getInvocationAction", v7, 2u);
    swift_slowDealloc();
  }

  sub_4A38(a1, a1[3]);
  sub_6450();
  sub_41FC();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_6510();
  swift_allocObject();
  uint64_t v9 = sub_6500();
  a2[3] = v8;
  unint64_t result = sub_4A7C();
  a2[4] = result;
  *a2 = v9;
  return result;
}

uint64_t sub_41FC()
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_65C0();
  sub_3458(v0, (uint64_t)qword_C688);
  uint64_t v1 = sub_65A0();
  os_log_type_t v2 = sub_65E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "#CalendarInvocationActionProvider mapToDirectInvocation", v3, 2u);
    swift_slowDealloc();
  }

  sub_3490(&qword_C518);
  return sub_65D0();
}

uint64_t sub_430C()
{
  return sub_4ACC((uint64_t)&unk_8558, (uint64_t (*)(void))sub_48E8);
}

unint64_t sub_4340@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_4078(a1, a2);
}

uint64_t sub_438C()
{
  return sub_4ACC((uint64_t)&unk_8578, (uint64_t (*)(void))sub_489C);
}

unint64_t sub_43C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_4078(a1, a2);
}

uint64_t sub_440C()
{
  return sub_4ACC((uint64_t)&unk_85B8, (uint64_t (*)(void))sub_4804);
}

unint64_t sub_4440@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_4078(a1, a2);
}

uint64_t sub_448C()
{
  return sub_4ACC((uint64_t)&unk_85D8, (uint64_t (*)(void))sub_4768);
}

unint64_t sub_44C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_4078(a1, a2);
}

uint64_t sub_450C()
{
  return sub_4ACC((uint64_t)&unk_8598, (uint64_t (*)(void))sub_4850);
}

uint64_t sub_4540(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = sub_63D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_C278 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_3458(v4, (uint64_t)qword_C6A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  if (qword_C280 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_C6B8;
  v12[3] = sub_64F0();
  v12[4] = &protocol witness table for StaticIconUrlProvider;
  v12[0] = v9;
  v11[3] = a1;
  v11[4] = a2();
  swift_retain();
  sub_6420();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_47B4(v11);
  return sub_47B4(v12);
}

unint64_t sub_471C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_4078(a1, a2);
}

unint64_t sub_4768()
{
  unint64_t result = qword_C4E8;
  if (!qword_C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C4E8);
  }
  return result;
}

uint64_t sub_47B4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_4804()
{
  unint64_t result = qword_C4F0;
  if (!qword_C4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C4F0);
  }
  return result;
}

unint64_t sub_4850()
{
  unint64_t result = qword_C4F8;
  if (!qword_C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C4F8);
  }
  return result;
}

unint64_t sub_489C()
{
  unint64_t result = qword_C500;
  if (!qword_C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C500);
  }
  return result;
}

unint64_t sub_48E8()
{
  unint64_t result = qword_C508;
  if (!qword_C508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C508);
  }
  return result;
}

void type metadata accessor for ReadEventsInvocationAction()
{
}

void type metadata accessor for CreateEventInvocationAction()
{
}

void type metadata accessor for DeleteEventInvocationAction()
{
}

void type metadata accessor for RenameEventInvocationAction()
{
}

void type metadata accessor for RescheduleEventInvocationAction()
{
}

unint64_t sub_4970(uint64_t a1)
{
  unint64_t result = sub_4768();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_4998(uint64_t a1)
{
  unint64_t result = sub_4804();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_49C0(uint64_t a1)
{
  unint64_t result = sub_4850();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_49E8(uint64_t a1)
{
  unint64_t result = sub_489C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_4A10(uint64_t a1)
{
  unint64_t result = sub_48E8();
  *(void *)(a1 + 8) = result;
  return result;
}

void *sub_4A38(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_4A7C()
{
  unint64_t result = qword_C510;
  if (!qword_C510)
  {
    sub_6510();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C510);
  }
  return result;
}

uint64_t sub_4ACC(uint64_t a1, uint64_t (*a2)(void))
{
  return sub_4540(a1, a2);
}

uint64_t sub_4ADC()
{
  sub_6210();
  v0[51] = v1;
  uint64_t v2 = sub_6580();
  v0[52] = v2;
  v0[53] = *(void *)(v2 - 8);
  v0[54] = swift_task_alloc();
  return _swift_task_switch(sub_4B98, 0, 0);
}

uint64_t sub_4B98()
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_65C0();
  sub_3458(v1, (uint64_t)qword_C688);
  uint64_t v2 = sub_65A0();
  os_log_type_t v3 = sub_65E0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_36C0();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "#CalendarGenerator generateCandidateSuggestions", v4, 2u);
    sub_61F8();
  }
  uint64_t v61 = *(void *)(v0 + 432);
  uint64_t v72 = *(void *)(v0 + 424);
  uint64_t v5 = *(void **)(v0 + 408);
  uint64_t v71 = *(void *)(v0 + 416);

  sub_3490(&qword_C658);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_69B0;
  v64 = v5;
  uint64_t v56 = v5[3];
  v53 = sub_4A38(v5, v56);
  uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  sub_65D0();
  unsigned int v70 = enum case for Objective.discoverability(_:);
  v69 = *(void (**)(uint64_t))(v72 + 104);
  v69(v61);
  sub_6530();
  swift_bridgeObjectRelease();
  v68 = *(uint64_t (**)(uint64_t, uint64_t))(v72 + 8);
  uint64_t v8 = v61;
  uint64_t v9 = v68(v61, v71);
  sub_6148(v9, v10, v11, v12, v13, v14, v15, v16, v50, (uint64_t)v53, v56, inited + 32, v61, v64);
  sub_65D0();
  ((void (*)(uint64_t, void, uint64_t))v69)(v8, v70, v71);
  sub_6530();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_6128();
  uint64_t v19 = v18(v17);
  sub_6148(v19, v20, v21, v22, v23, v24, v25, v26, v51, v54, v57, v59, v62, v65);
  sub_65D0();
  uint64_t v27 = sub_6104();
  v28(v27);
  sub_6178();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_6128();
  uint64_t v31 = v30(v29);
  sub_6148(v31, v32, v33, v34, v35, v36, v37, v38, v52, v55, v58, v60, v63, v66);
  sub_65D0();
  uint64_t v39 = sub_6104();
  v40(v39);
  sub_6178();
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_6128();
  v42(v41);
  sub_4A38(v67, v67[3]);
  sub_65D0();
  uint64_t v43 = sub_6104();
  v44(v43);
  sub_6530();
  swift_bridgeObjectRelease();
  v68(v8, v71);
  for (uint64_t i = 32; i != 232; i += 40)
  {
    sub_5C84(inited + i, v0 + 248);
    sub_5CEC(v0 + 248, v0 + 328);
    if (*(void *)(v0 + 352))
    {
      sub_60CC((long long *)(v0 + 328), v0 + 288);
      sub_60CC((long long *)(v0 + 288), v0 + 368);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_5DB4(0, *((void *)v7 + 2) + 1, 1, (uint64_t)v7);
      }
      unint64_t v47 = *((void *)v7 + 2);
      unint64_t v46 = *((void *)v7 + 3);
      if (v47 >= v46 >> 1) {
        uint64_t v7 = sub_5DB4((char *)(v46 > 1), v47 + 1, 1, (uint64_t)v7);
      }
      *((void *)v7 + 2) = v47 + 1;
      sub_60CC((long long *)(v0 + 368), (uint64_t)&v7[40 * v47 + 32]);
    }
    else
    {
      sub_5D54(v0 + 328);
    }
  }
  swift_setDeallocating();
  sub_6068();
  swift_task_dealloc();
  v48 = *(uint64_t (**)(char *))(v0 + 8);
  return v48(v7);
}

uint64_t sub_5094()
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_65C0();
  sub_3458(v0, (uint64_t)qword_C688);
  uint64_t v1 = sub_65A0();
  os_log_type_t v2 = sub_65E0();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)sub_36C0();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "#CalendarGenerator getSubscriptions", v3, 2u);
    sub_61F8();
  }

  sub_3490(&qword_C620);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_67F0;
  sub_6570();
  uint64_t v5 = sub_6430();
  v17[3] = v5;
  v17[4] = sub_5C3C(&qword_C628, 255, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  uint64_t v6 = sub_5BD8(v17);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v6, enum case for CoreSignalTypes.app(_:), v5);
  *(void *)(inited + 32) = sub_6560();
  sub_3490(&qword_C630);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_69B0;
  uint64_t v8 = type metadata accessor for CalendarConfigurator();
  uint64_t v9 = swift_allocObject();
  sub_5694(0xD000000000000018, 0x8000000000007020);
  *(void *)(v7 + 56) = v8;
  uint64_t v11 = sub_5C3C(&qword_C638, v10, (void (*)(uint64_t))type metadata accessor for CalendarConfigurator);
  *(void *)(v7 + 64) = v11;
  *(void *)(v7 + 32) = v9;
  uint64_t v12 = sub_61CC();
  sub_61AC((uint64_t)"calendarEvent_DeleteEvent");
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v11;
  *(void *)(v7 + 72) = v12;
  uint64_t v13 = sub_61CC();
  sub_61AC((uint64_t)"calendarEvent_CreateEvent");
  *(void *)(v7 + 136) = v8;
  *(void *)(v7 + 144) = v11;
  *(void *)(v7 + 112) = v13;
  uint64_t v14 = sub_61CC();
  sub_61AC((uint64_t)"calendarEvent_RenameEvent");
  *(void *)(v7 + 176) = v8;
  *(void *)(v7 + 184) = v11;
  *(void *)(v7 + 152) = v14;
  uint64_t v15 = sub_61CC();
  sub_5694(0xD00000000000001DLL, 0x8000000000006E80);
  *(void *)(v7 + 216) = v8;
  *(void *)(v7 + 224) = v11;
  *(void *)(v7 + 192) = v15;
  *(void *)(inited + 40) = v7;
  sub_3490(&qword_C640);
  sub_5C3C(&qword_C648, 255, (void (*)(uint64_t))&type metadata accessor for Signal);
  return sub_65D0();
}

uint64_t sub_53E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_60E8;
  return SignalSubscriber.getAsyncSubscriptions()(a1, a2);
}

uint64_t sub_548C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_60E8;
  return SignalSubscriber.getAsyncLookupSubscriptions()(a1, a2);
}

uint64_t sub_5534()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_55C8;
  return sub_4ADC();
}

uint64_t sub_55C8()
{
  sub_6210();
  uint64_t v2 = v1;
  sub_60EC();
  uint64_t v3 = *v0;
  sub_61E8();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_5694(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_65C0();
  sub_3458(v6, (uint64_t)qword_C688);
  uint64_t v7 = sub_65A0();
  os_log_type_t v8 = sub_65E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)sub_36C0();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "#CalendarConfigurator init", v9, 2u);
    sub_61F8();
  }

  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  return v3;
}

uint64_t sub_5778()
{
  return _swift_task_switch(sub_5794, 0, 0);
}

uint64_t sub_5794()
{
  if (qword_C270 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_65C0();
  sub_3458(v1, (uint64_t)qword_C688);
  uint64_t v2 = sub_65A0();
  os_log_type_t v3 = sub_65E0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_36C0();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "#CalendarConfigurator setContext", v4, 2u);
    sub_61F8();
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_5898()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for CalendarConfigurator()
{
  return self;
}

uint64_t sub_58F4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_5928()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_59B4;
  return sub_5778();
}

uint64_t sub_59B4()
{
  sub_6210();
  sub_60EC();
  uint64_t v1 = *v0;
  sub_61E8();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_5A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_55C8;
  return CandidateSuggestionConfigurator.isValid(signal:)(a1, a2, a3);
}

ValueMetadata *type metadata accessor for CalendarGenerator()
{
  return &type metadata for CalendarGenerator;
}

unint64_t sub_5B3C()
{
  unint64_t result = qword_C5F8[0];
  if (!qword_C5F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_C5F8);
  }
  return result;
}

unint64_t sub_5B8C()
{
  unint64_t result = qword_C618;
  if (!qword_C618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C618);
  }
  return result;
}

uint64_t *sub_5BD8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_5C3C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_5C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3490(&qword_C660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_5CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3490(&qword_C660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5D54(uint64_t a1)
{
  uint64_t v2 = sub_3490(&qword_C660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_5DB4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_3490(&qword_C668);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_5FCC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_5EAC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_5EAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_3490(&qword_C670);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_65F0();
  __break(1u);
  return result;
}

char *sub_5FCC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_65F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_6068()
{
  sub_3490(&qword_C660);
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_60CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_6104()
{
  return v0;
}

uint64_t sub_6128()
{
  return v0;
}

uint64_t sub_6148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  sub_4A38(a14, a14[3]);
  return v14;
}

uint64_t sub_6178()
{
  return sub_6530();
}

uint64_t sub_61AC@<X0>(uint64_t a1@<X8>)
{
  return sub_5694(0xD000000000000019, (a1 - 32) | 0x8000000000000000);
}

uint64_t sub_61CC()
{
  return swift_allocObject();
}

uint64_t sub_61F8()
{
  return swift_slowDealloc();
}

uint64_t sub_621C()
{
  uint64_t v0 = sub_63D0();
  sub_4014(v0, qword_C6A0);
  sub_3458(v0, (uint64_t)qword_C6A0);
  return sub_63C0();
}

uint64_t sub_6284()
{
  sub_3490(&qword_C678);
  __chkstk_darwin();
  uint64_t v1 = (uint64_t *)((char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v1 = 0xD000000000000013;
  v1[1] = 0x80000000000072E0;
  uint64_t v2 = enum case for Image.appIcon(_:);
  uint64_t v3 = sub_6550();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(v1, v2, v3);
  sub_6398((uint64_t)v1, 0, 1, v3);
  sub_64F0();
  swift_allocObject();
  uint64_t result = sub_64E0();
  qword_C6B8 = result;
  return result;
}

uint64_t sub_6398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_63C0()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_63D0()
{
  return type metadata accessor for URL();
}

uint64_t sub_6400()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_6410()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_6420()
{
  return static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)();
}

uint64_t sub_6430()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_6440()
{
  return static ActionKeyMappers.simpleActionKeyMapper(actionId:)();
}

uint64_t sub_6450()
{
  return dispatch thunk of DialogProperties.getParameters()();
}

uint64_t sub_6470()
{
  return SignalSubscriber.getConfiguratorProvider()();
}

uint64_t sub_6490()
{
  return SuggestionDetails.init(suggestionId:resolverParams:description:viewProvider:actionIdKeyMapper:filter:)();
}

uint64_t sub_64A0()
{
  return type metadata accessor for SuggestionDetails();
}

uint64_t sub_64B0()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_64C0()
{
  return static NoOpSuggestionFilter.Instance.getter();
}

uint64_t sub_64D0()
{
  return type metadata accessor for NoOpSuggestionFilter();
}

uint64_t sub_64E0()
{
  return StaticIconUrlProvider.init(icon:)();
}

uint64_t sub_64F0()
{
  return type metadata accessor for StaticIconUrlProvider();
}

uint64_t sub_6500()
{
  return DirectInvocationAction.init(siriKitIdentifier:payload:suggestionId:)();
}

uint64_t sub_6510()
{
  return type metadata accessor for DirectInvocationAction();
}

uint64_t sub_6520()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)();
}

uint64_t sub_6530()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t sub_6550()
{
  return type metadata accessor for Image();
}

uint64_t sub_6560()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_6570()
{
  return type metadata accessor for Signal();
}

uint64_t sub_6580()
{
  return type metadata accessor for Objective();
}

uint64_t sub_6590()
{
  return Wrappable.getRoot()();
}

uint64_t sub_65A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_65B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_65C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_65D0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_65E0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_65F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t self
{
  return _self;
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}