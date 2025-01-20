uint64_t sub_100003118()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void v5[3];
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t *v11;
  void *v12;
  unsigned char **v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t (**)(uint64_t, uint64_t, uint64_t));
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  uint32_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned char *v35;
  uint64_t v36;
  uint32_t v37;
  char *v38;

  v28 = 0;
  v17 = sub_1000038EC;
  v38 = 0;
  v18 = 0;
  v19 = sub_100003BE0();
  v20 = *(void *)(v19 - 8);
  v21 = v19 - 8;
  v22 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  v23 = (char *)v5 - v22;
  v38 = (char *)v5 - v22;
  sub_100003BC0();
  v30 = sub_100003BD0();
  v29 = sub_100003C10();
  v26 = &v36;
  v36 = 2;
  v24 = sub_1000034BC();
  v25 = sub_100003538();
  sub_1000035B4();
  sub_100003C00();
  v27 = v37;
  sub_10000387C(&qword_100008018);
  v31 = sub_100003C50();
  if (os_log_type_enabled(v30, (os_log_type_t)v29))
  {
    v0 = v18;
    v7 = (uint8_t *)sub_100003C40();
    v5[2] = sub_10000387C(&qword_100008020);
    v6 = 0;
    v8 = sub_100003750(0);
    v9 = sub_100003750(v6);
    v13 = &v35;
    v35 = v7;
    v14 = &v34;
    v34 = v8;
    v11 = &v33;
    v33 = v9;
    v10 = 0;
    sub_1000037AC(0, &v35);
    sub_1000037AC(v10, v13);
    v32 = v31;
    v12 = v5;
    __chkstk_darwin();
    v1 = v14;
    v2 = &v5[-6];
    v15 = &v5[-6];
    v2[2] = v13;
    v2[3] = v1;
    v2[4] = v3;
    v16 = sub_10000387C(&qword_100008028);
    sub_10000391C();
    sub_100003BF0();
    if (v0)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v29, "Initializing MailShortcutsExtension", v7, v27);
      v5[1] = 0;
      sub_10000380C(v8);
      sub_10000380C(v9);
      sub_100003C20();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v23, v19);
}

unint64_t sub_1000034BC()
{
  uint64_t v2 = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100008000);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100003538()
{
  uint64_t v2 = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100008008);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000035B4()
{
  uint64_t v2 = qword_100008010;
  if (!qword_100008010)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100008010);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100003630()
{
  return sub_100003BB0();
}

uint64_t sub_1000036A8()
{
  return sub_100003BA0();
}

uint64_t sub_1000036E0()
{
  return sub_100003118();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_100003750(uint64_t a1)
{
  if (a1) {
    return sub_100003C40();
  }
  else {
    return 0;
  }
}

uint64_t sub_1000037AC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000037C0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_10000380C(uint64_t a1)
{
  if (a1)
  {
    sub_100003C30();
    sub_100003C20();
  }
}

uint64_t sub_10000387C(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_1000038EC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1000037C0(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_10000391C()
{
  uint64_t v2 = qword_100008030;
  if (!qword_100008030)
  {
    sub_1000039A0(&qword_100008028);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100008030);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000039A0(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

unint64_t sub_100003A18()
{
  uint64_t v2 = qword_100008038;
  if (!qword_100008038)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100008038);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100003A98()
{
  return sub_100003AB0();
}

unint64_t sub_100003AB0()
{
  uint64_t v2 = qword_100008040;
  if (!qword_100008040)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100008040);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100003B30()
{
  return swift_getOpaqueTypeConformance2();
}

void *type metadata accessor for MailShortcutsExtension()
{
  return &unk_100004270;
}

uint64_t sub_100003BA0()
{
  return AppIntentsExtension.configuration.getter();
}

uint64_t sub_100003BB0()
{
  return static AppExtension.main()();
}

uint64_t sub_100003BC0()
{
  return static Logger.mailUILogger<A>(for:)();
}

uint64_t sub_100003BD0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003BE0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003BF0()
{
  return Sequence.forEach(_:)();
}

uint64_t sub_100003C00()
{
  return UnsignedInteger<>.init<A>(_:)();
}

uint64_t sub_100003C10()
{
  return static os_log_type_t.default.getter();
}

void sub_100003C20()
{
}

uint64_t sub_100003C30()
{
  return UnsafeMutablePointer.deinitialize(count:)();
}

uint64_t sub_100003C40()
{
  return static UnsafeMutablePointer.allocate(capacity:)();
}

uint64_t sub_100003C50()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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