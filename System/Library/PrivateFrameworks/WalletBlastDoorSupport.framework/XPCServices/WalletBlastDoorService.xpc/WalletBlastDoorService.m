int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::OpaquePointer v9;
  Swift::OpaquePointer v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  sub_100003D54(&qword_100008000);
  __chkstk_darwin();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100003E60();
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  _CFPrefsSetDirectModeEnabled();
  _CFPrefsSetReadOnly();
  v9._rawValue = &off_100004178;
  qword_100008010 = (uint64_t)&off_100004178;
  sub_100003E70(v9, 1);
  v10._rawValue = &_swiftEmptyArrayStorage;
  qword_100008020 = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100003E80(v10);
  sub_100003EC0();
  qword_100008018 = sub_100003EA0();
  sub_100003E50();
  sub_100003ED0();
  sub_100003D98();
  sub_100003EB0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = enum case for SandboxID.blastdoor(_:);
  v12 = sub_100003EE0();
  v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v4, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v4, 0, 1, v12);
  sub_100003E90();
  sub_100003DF0((uint64_t)v4);
  return 0;
}

uint64_t sub_100003D54(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003D98()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    sub_100003E60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

uint64_t sub_100003DF0(uint64_t a1)
{
  uint64_t v2 = sub_100003D54(&qword_100008000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003E50()
{
  return WalletOrderPreviewUnpacker.init()();
}

uint64_t sub_100003E60()
{
  return type metadata accessor for WalletOrderPreviewUnpacker();
}

void sub_100003E70(Swift::OpaquePointer allowedImageFormats, Swift::Bool increasedRestrictions)
{
}

void sub_100003E80(Swift::OpaquePointer codecs)
{
}

uint64_t sub_100003E90()
{
  return dispatch thunk of BlastDoorServer.resume(sandboxID:)();
}

uint64_t sub_100003EA0()
{
  return static BlastDoorServer.service.getter();
}

uint64_t sub_100003EB0()
{
  return BlastDoorServer.register<A, B>(unpacker:for:)();
}

uint64_t sub_100003EC0()
{
  return type metadata accessor for BlastDoorServer();
}

uint64_t sub_100003ED0()
{
  return type metadata accessor for WalletOrderPreview();
}

uint64_t sub_100003EE0()
{
  return type metadata accessor for SandboxID();
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return __CFPrefsSetDirectModeEnabled();
}

uint64_t _CFPrefsSetReadOnly()
{
  return __CFPrefsSetReadOnly();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}