uint64_t sub_100001320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, void, uint64_t, uint64_t);
  uint64_t vars8;

  URL.init(fileURLWithPath:)();
  v2 = type metadata accessor for URL();
  v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 0, 1, v2);
}

uint64_t sub_1000013AC()
{
  type metadata accessor for String.Encoding();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v0 = type metadata accessor for URL.DirectoryHint();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000193C(&qword_100008010);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)v20 - v11;
  URL.init(fileURLWithPath:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_100001980((uint64_t)v5);
    sub_10000193C(&qword_100008018);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100003980;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 32) = 0xD000000000000020;
    *(void *)(v13 + 40) = 0x8000000100003BA0;
    print(_:separator:terminator:)();
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    v20[10] = 0xD000000000000012;
    v20[11] = 0x8000000100003BD0;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
    sub_1000019E0();
    URL.appending<A>(path:directoryHint:)();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    swift_bridgeObjectRelease();
    static String.Encoding.utf8.getter();
    uint64_t v15 = String.init(contentsOf:encoding:)();
    uint64_t v17 = v16;
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v10, v6);
    sub_10000193C(&qword_100008018);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100003980;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 32) = v15;
    *(void *)(v19 + 40) = v17;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v18)(v12, v6);
  }
}

uint64_t sub_10000193C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100001980(uint64_t a1)
{
  uint64_t v2 = sub_10000193C(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000019E0()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100001A34()
{
  uint64_t v25 = type metadata accessor for DispatchTimeInterval();
  uint64_t v0 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v2 = (uint64_t *)((char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = type metadata accessor for DispatchTime();
  uint64_t v3 = *(void *)(v24 - 8);
  uint64_t v4 = __chkstk_darwin(v24);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - v7;
  id v9 = [objc_allocWithZone((Class)SoftwareTransparency) initWithApplication:0];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  uint64_t v23 = v11 + 16;
  *(void *)(v11 + 24) = 0;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v10;
  aBlock[4] = sub_100001F5C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100001F64;
  aBlock[3] = &unk_1000043E8;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  v14 = v10;
  swift_release();
  id v26 = v9;
  [v9 sysdiagnoseInfoWithCompletion:v13];
  _Block_release(v13);
  static DispatchTime.now()();
  *uint64_t v2 = 2500;
  uint64_t v15 = v25;
  (*(void (**)(void *, void, uint64_t))(v0 + 104))(v2, enum case for DispatchTimeInterval.milliseconds(_:), v25);
  + infix(_:_:)();
  (*(void (**)(void *, uint64_t))(v0 + 8))(v2, v15);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v17 = v6;
  uint64_t v18 = v24;
  v16(v17, v24);
  LOBYTE(v15) = OS_dispatch_semaphore.wait(timeout:)();
  v16(v8, v18);
  if ((v15 & 1) != 0 || (swift_beginAccess(), (uint64_t v19 = *(void *)(v11 + 24)) == 0))
  {

    swift_release();
    return 0;
  }
  else
  {
    uint64_t v20 = *(void *)(v11 + 16);
    sub_10000193C(&qword_100008018);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100003980;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 32) = v20;
    *(void *)(v21 + 40) = v19;
    swift_bridgeObjectRetain();
    print(_:separator:terminator:)();
    swift_release();
    swift_bridgeObjectRelease();

    return 1;
  }
}

uint64_t sub_100001DF0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100001E28(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for String.Encoding();
  uint64_t result = __chkstk_darwin(v6 - 8);
  if (a2 >> 60 != 15)
  {
    sub_1000034B8(a1, a2);
    static String.Encoding.utf8.getter();
    uint64_t v8 = String.init(data:encoding:)();
    if (v9)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v9;
      swift_beginAccess();
      *(void *)(a3 + 16) = v10;
      *(void *)(a3 + 24) = v11;
      swift_bridgeObjectRelease();
      OS_dispatch_semaphore.signal()();
    }
    return sub_10000344C(a1, a2);
  }
  return result;
}

uint64_t sub_100001F1C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100001F5C(uint64_t a1, unint64_t a2)
{
  return sub_100001E28(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100001F64(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_10000344C((uint64_t)v4, v8);

  return swift_release();
}

uint64_t sub_100002010(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100002020()
{
  return swift_release();
}

uint64_t transparencySysdiagnose.init()()
{
  sub_10000193C(&qword_100008028);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NameSpecification();
  __chkstk_darwin();
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v2 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t variable initialization expression of transparencySysdiagnose._useFallback()
{
  return 0;
}

uint64_t property wrapper backing initializer of transparencySysdiagnose.useFallback()
{
  sub_10000193C(&qword_100008028);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NameSpecification();
  __chkstk_darwin();
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v2 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t sub_10000229C()
{
  sub_10000193C(&qword_100008030);
  Flag.wrappedValue.getter();
  return v1;
}

uint64_t sub_1000022D0()
{
  return Flag.wrappedValue.setter();
}

void (*sub_100002308(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_10000193C(&qword_100008030);
  v2[4] = Flag.wrappedValue.modify();
  return sub_100002374;
}

void sub_100002374(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> transparencySysdiagnose.run()()
{
  sub_10000193C(&qword_100008030);
  Flag.wrappedValue.getter();
  if ((v0 & 1) != 0 || (sub_100001A34() & 1) == 0) {
    sub_1000013AC();
  }
}

uint64_t sub_10000240C()
{
  return static ParsableCommand.main()();
}

uint64_t type metadata accessor for transparencySysdiagnose()
{
  uint64_t result = qword_100008280;
  if (!qword_100008280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000024AC()
{
  return 1;
}

Swift::Int sub_1000024B4()
{
  return Hasher._finalize()();
}

void sub_1000024F8()
{
}

Swift::Int sub_100002520()
{
  return Hasher._finalize()();
}

uint64_t sub_100002560()
{
  return 0x626C6C6146657375;
}

uint64_t sub_100002580@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x626C6C6146657375 && a2 == 0xEB000000006B6361)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100002630()
{
  return 0;
}

void sub_10000263C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100002648(uint64_t a1)
{
  unint64_t v2 = sub_100002A64();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002684(uint64_t a1)
{
  unint64_t v2 = sub_100002A64();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t transparencySysdiagnose.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = sub_10000193C(&qword_100008030);
  uint64_t v20 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000193C(&qword_100008040);
  uint64_t v22 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000193C(&qword_100008028);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = type metadata accessor for transparencySysdiagnose();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v16 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 0, 1, v16);
  Flag<A>.init(wrappedValue:name:help:)();
  sub_100002A20(a1, a1[3]);
  sub_100002A64();
  uint64_t v17 = v23;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v17)
  {
    sub_100002B64();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
    (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v15, v5, v3);
    sub_100002C08((uint64_t)v15, v21);
  }
  sub_100002AB8((uint64_t)a1);
  return sub_100002B08((uint64_t)v15);
}

void *sub_100002A20(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100002A64()
{
  unint64_t result = qword_1000080F0[0];
  if (!qword_1000080F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000080F0);
  }
  return result;
}

uint64_t sub_100002AB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002B08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for transparencySysdiagnose();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100002B64()
{
  unint64_t result = qword_100008048;
  if (!qword_100008048)
  {
    sub_100002BC0(&qword_100008030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008048);
  }
  return result;
}

uint64_t sub_100002BC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002C08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for transparencySysdiagnose();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_100002C74()
{
}

uint64_t sub_100002C90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return transparencySysdiagnose.init(from:)(a1, a2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_100002D00()
{
  return sub_100002D68(&qword_100008050);
}

uint64_t sub_100002D34()
{
  return sub_100002D68(&qword_100008058);
}

uint64_t sub_100002D68(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for transparencySysdiagnose();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  char v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for transparencySysdiagnose(uint64_t a1)
{
  uint64_t v2 = sub_10000193C(&qword_100008030);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for transparencySysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100003038);
}

uint64_t sub_100003038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for transparencySysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000030BC);
}

uint64_t sub_1000030BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000193C(&qword_100008030);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_100003130()
{
  sub_1000031BC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000031BC()
{
  if (!qword_1000080B8)
  {
    unint64_t v0 = type metadata accessor for Flag();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000080B8);
    }
  }
}

uint64_t getEnumTagSinglePayload for transparencySysdiagnose.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for transparencySysdiagnose.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100003308);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for transparencySysdiagnose.CodingKeys()
{
  return &type metadata for transparencySysdiagnose.CodingKeys;
}

unint64_t sub_100003348()
{
  unint64_t result = qword_100008390[0];
  if (!qword_100008390[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008390);
  }
  return result;
}

unint64_t sub_1000033A0()
{
  unint64_t result = qword_1000084A0;
  if (!qword_1000084A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000084A0);
  }
  return result;
}

unint64_t sub_1000033F8()
{
  unint64_t result = qword_1000084A8[0];
  if (!qword_1000084A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000084A8);
  }
  return result;
}

uint64_t sub_10000344C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100003460(a1, a2);
  }
  return a1;
}

uint64_t sub_100003460(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000034B8(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t ArgumentHelp.init(stringLiteral:)()
{
  return ArgumentHelp.init(stringLiteral:)();
}

uint64_t type metadata accessor for ArgumentHelp()
{
  return type metadata accessor for ArgumentHelp();
}

uint64_t static ParsableCommand._commandName.getter()
{
  return static ParsableCommand._commandName.getter();
}

uint64_t static ParsableCommand.configuration.getter()
{
  return static ParsableCommand.configuration.getter();
}

uint64_t static ParsableCommand.main()()
{
  return static ParsableCommand.main()();
}

uint64_t static NameSpecification.long.getter()
{
  return static NameSpecification.long.getter();
}

uint64_t type metadata accessor for NameSpecification()
{
  return type metadata accessor for NameSpecification();
}

uint64_t static ParsableArguments._errorLabel.getter()
{
  return static ParsableArguments._errorLabel.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableArguments.validate()()
{
}

uint64_t Flag.wrappedValue.modify()
{
  return Flag.wrappedValue.modify();
}

uint64_t Flag.wrappedValue.getter()
{
  return Flag.wrappedValue.getter();
}

uint64_t Flag.wrappedValue.setter()
{
  return Flag.wrappedValue.setter();
}

uint64_t Flag<A>.init(wrappedValue:name:help:)()
{
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t type metadata accessor for Flag()
{
  return type metadata accessor for Flag();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t String.init(contentsOf:encoding:)()
{
  return String.init(contentsOf:encoding:)();
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

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}