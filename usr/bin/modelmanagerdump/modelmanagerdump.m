uint64_t sub_10000234C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_1000028AC(&qword_100008040);
  __chkstk_darwin();
  v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for CommandConfiguration();
  sub_100002CC4(v2, qword_100008088);
  sub_100002C8C(v2, (uint64_t)qword_100008088);
  v3 = type metadata accessor for NameSpecification();
  sub_100002D28((uint64_t)v1, 1, 1, v3);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100002464()
{
  if (qword_100008000 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for CommandConfiguration();

  return sub_100002C8C(v0, (uint64_t)qword_100008088);
}

uint64_t sub_1000024C8()
{
  sub_100002DB8();
  type metadata accessor for String.Encoding();
  v0[2] = swift_task_alloc();
  uint64_t v1 = type metadata accessor for StateDump();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  uint64_t v2 = swift_task_alloc();
  v0[5] = v2;
  v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  void *v3 = v0;
  v3[1] = sub_1000025E8;
  return static StateDump.dump()(v2);
}

uint64_t sub_1000025E8()
{
  sub_100002DB8();
  sub_100002DA0();
  *(void *)(v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100002840;
  }
  else {
    uint64_t v2 = sub_1000026D4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000026D4()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_1000028AC(&qword_100008018);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100003AB0;
  uint64_t v5 = StateDump.dataValue.getter();
  if (v6 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v5;
  }
  if (v6 >> 60 == 15) {
    unint64_t v8 = 0xC000000000000000;
  }
  else {
    unint64_t v8 = v6;
  }
  static String.Encoding.utf8.getter();
  uint64_t v9 = String.init(data:encoding:)();
  unint64_t v11 = v10;
  sub_1000028F0(v7, v8);
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v12 = 0xD000000000000013;
  if (v11) {
    unint64_t v12 = v9;
  }
  unint64_t v13 = 0x8000000100003CE0;
  if (v11) {
    unint64_t v13 = v11;
  }
  *(void *)(v4 + 32) = v12;
  *(void *)(v4 + 40) = v13;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100002840()
{
  sub_100002DB8();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000028AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000028F0(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for DumpState()
{
  return &type metadata for DumpState;
}

uint64_t sub_100002958(uint64_t a1)
{
  return sub_100002D50(a1);
}

uint64_t sub_100002980()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100002A0C;
  return sub_1000024C8();
}

uint64_t sub_100002A0C()
{
  sub_100002DB8();
  sub_100002DA0();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002AD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100002464();
  uint64_t v3 = type metadata accessor for CommandConfiguration();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

void sub_100002B4C()
{
}

void sub_100002B68()
{
}

uint64_t sub_100002B84(uint64_t a1)
{
  return sub_100002958(a1);
}

unint64_t sub_100002BA0()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

unint64_t sub_100002BF0()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

unint64_t sub_100002C40()
{
  unint64_t result = qword_100008038;
  if (!qword_100008038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008038);
  }
  return result;
}

uint64_t sub_100002C8C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100002CC4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100002D50(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002DC4()
{
  sub_1000028AC(&qword_100008040);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  sub_100002CC4(v2, qword_1000080A0);
  sub_100002C8C(v2, (uint64_t)qword_1000080A0);
  uint64_t v3 = type metadata accessor for NameSpecification();
  sub_100002D28((uint64_t)v1, 1, 1, v3);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100002EDC()
{
  if (qword_100008008 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for CommandConfiguration();

  return sub_100002C8C(v0, (uint64_t)qword_1000080A0);
}

uint64_t sub_100002F40()
{
  return _swift_task_switch(sub_100002F5C, 0, 0);
}

uint64_t sub_100002F5C()
{
  sub_100002BA0();
  static ParsableArguments.parse(_:)();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003050;
  return sub_1000024C8();
}

uint64_t sub_100003050()
{
  sub_100002DA0();
  uint64_t v2 = *v1;
  sub_100003840();
  void *v3 = v2;
  *(void *)(v4 + 24) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_100003150;
  }
  else {
    uint64_t v5 = sub_100003138;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100003138()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003150()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003168()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000031F4;
  return sub_100002F40();
}

uint64_t sub_1000031F4()
{
  sub_100002DA0();
  uint64_t v1 = *v0;
  sub_100003840();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_1000032BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100002EDC();
  uint64_t v3 = type metadata accessor for CommandConfiguration();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10000332C()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  sub_1000036F4();
  *uint64_t v1 = v0;
  v1[1] = sub_1000033EC;
  return static AsyncParsableCommand.main()();
}

uint64_t sub_1000033EC()
{
  sub_100002DA0();
  uint64_t v1 = *v0;
  sub_100003840();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000034FC, v4, v3);
}

void sub_1000034FC()
{
}

int main(int argc, const char **argv, const char **envp)
{
  swift_task_create();
  swift_task_getMainExecutor();
  swift_job_run();
  int result = swift_task_asyncMainDrainQueue();
  __break(1u);
  return result;
}

uint64_t sub_10000359C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003628;
  return sub_10000332C();
}

uint64_t sub_100003628()
{
  sub_100002DA0();
  uint64_t v1 = *v0;
  sub_100003840();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

unint64_t sub_1000036F4()
{
  unint64_t result = qword_100008058;
  if (!qword_100008058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008058);
  }
  return result;
}

ValueMetadata *type metadata accessor for modelmanagerdump()
{
  return &type metadata for modelmanagerdump;
}

unint64_t sub_100003754()
{
  unint64_t result = qword_100008060;
  if (!qword_100008060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008060);
  }
  return result;
}

unint64_t sub_1000037A4()
{
  unint64_t result = qword_100008068;
  if (!qword_100008068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

unint64_t sub_1000037F4()
{
  unint64_t result = qword_100008070;
  if (!qword_100008070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

uint64_t StateDump.dataValue.getter()
{
  return StateDump.dataValue.getter();
}

uint64_t type metadata accessor for StateDump()
{
  return type metadata accessor for StateDump();
}

uint64_t static ParsableCommand._commandName.getter()
{
  return static ParsableCommand._commandName.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableCommand.run()()
{
}

uint64_t type metadata accessor for NameSpecification()
{
  return type metadata accessor for NameSpecification();
}

uint64_t static ParsableArguments._errorLabel.getter()
{
  return static ParsableArguments._errorLabel.getter();
}

uint64_t static ParsableArguments.parse(_:)()
{
  return static ParsableArguments.parse(_:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableArguments.validate()()
{
}

uint64_t CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)()
{
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t type metadata accessor for CommandConfiguration()
{
  return type metadata accessor for CommandConfiguration();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

void exit(int a1)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_job_run()
{
  return _swift_job_run();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_asyncMainDrainQueue()
{
  return _swift_task_asyncMainDrainQueue();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}